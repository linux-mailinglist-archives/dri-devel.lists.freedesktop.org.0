Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8965B8E90
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 20:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A468D10E9B2;
	Wed, 14 Sep 2022 18:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C607E10E9B1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 18:07:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69D3CB80CB1;
 Wed, 14 Sep 2022 18:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F586C433D6;
 Wed, 14 Sep 2022 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663178834;
 bh=u2oRx56dEvhrWV3ZEhglBUWqj/570fEv26z8NhtxT1U=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=PBCzcVdkrrG14uxuvrHuAyh60xrk2mucc1WcgcwasSAW2ytLukURmYkNe+ODMp25K
 tzuc5rpcmuOzuw4stTRGwUd4qFdjl6LwC9iwJkPFEFiR83Jhia3HBD1UjExPrYSXKk
 gkEo/9fdzsFNeqhCwccsmp/rc/FUFDni4HkcUSe7NkjAAA+BlFANgSTtn7ncuzdrRf
 FYHlP6a2QmAiHtRC9Ax5zosdwgyxqrLgIibIyz9qKotD5Ae3poREPQ4ICZ8rlJmFT7
 6hbEyHp/s+6+62uZojx1KwlRKK5Ai4hiUwgCfNf9109KHn81+ljibt0JOdU7j3pfWS
 BYh8mLRMmI/ig==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220914161502.faiaccuxydyrdr6e@penduick>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
 <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
 <20220914155035.88E45C433C1@smtp.kernel.org>
 <20220914161502.faiaccuxydyrdr6e@penduick>
Subject: Re: [PATCH v1 2/7] clk: bcm: rpi: Add a function to retrieve the
 maximum
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 14 Sep 2022 11:07:12 -0700
User-Agent: alot/0.10
Message-Id: <20220914180714.0F586C433D6@smtp.kernel.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-09-14 09:15:02)
> Hi Stephen,
>=20
> Thanks for reviewing that series
>=20
> On Wed, Sep 14, 2022 at 08:50:33AM -0700, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2022-08-15 08:31:24)
> > > @@ -254,6 +255,33 @@ static int raspberrypi_fw_dumb_determine_rate(st=
ruct clk_hw *hw,
> > >         return 0;
> > >  }
> > > =20
> > > +unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
> > > +{
> > > +       const struct raspberrypi_clk_data *data;
> > > +       struct raspberrypi_clk *rpi;
> > > +       struct clk_hw *hw;
> > > +       u32 max_rate;
> > > +       int ret;
> > > +
> > > +       if (!clk)
> > > +               return 0;
> > > +
> > > +       hw =3D  __clk_get_hw(clk);
> >=20
> > Ideally we don't add more users of this API. I should document that :/
>=20
> What should be the proper way to implement this?
>=20
> > It begs the question though, why do we need this API to take a 'struct
> > clk'?  Can it simply hardcode the data->id value for the clk you care
> > about and call rpi_firmware_property() directly (or some wrapper of it)?
>=20
> You mean push it down to the consumer?
>=20
> We will have two users of that function eventually. The KMS driver, and
> the codec driver that isn't upstream yet. AFAIK, both are using a
> different clock, so we can' really hardcode it, and duplicating it at
> the consumer level would be weird.

Can you make an API that returns 'max freq for KMS' and 'max freq for
codec'? For example, it could take the enum value that the clk driver
uses for data->id?

>=20
> > Furthermore, I wonder if even that part needs to be implemented.  Why
> > not make a direct call to rpi_firmware_property() and get the max rate?
> > All of that can live in the drm driver. Making it a generic API that
> > takes a 'struct clk' means that it looks like any clk can be passed,
> > when that isn't true. It would be better to restrict it to the one use
> > case so that the scope of the problem doesn't grow. I understand that it
> > duplicates a few lines of code, but that looks like a fair tradeoff vs.
> > exposing an API that can be used for other clks in the future.
>=20
> So we'll want to have that function shared between the KMS and codec
> drivers eventually. The clock id used by both drivers is stored in the
> DT so we would create a function (outside of the clock drivers) that
> would parse the clocks property, get the ID, and then queries the
> firmware for it. Would that make sense?
>=20

Sure. Is the ID ever changing? If not then a simpler design would be to
ask for the particular ID and hardcode that in the driver.
