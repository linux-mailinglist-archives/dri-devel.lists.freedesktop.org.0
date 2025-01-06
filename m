Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C4AA02827
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 15:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E49410E0BE;
	Mon,  6 Jan 2025 14:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E7s1RuZ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F123610E68E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736174200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h5hcIYBd2cFpQ/iFdFgXHOmNme6Kj/cPc06DAfBxeQY=;
 b=E7s1RuZ2fxM//WN0qlzHOtkbM5Xp2mSjf1yNQu5ORwZLmOxcy1dnAw1LttvYeydOKmrNV8
 KLigJMZg4GejpPYbVtE5vT7YWjfLi5TGGrLoEZmOVjQ4uzeSQ+QxiDlbWX3NeAlPljigR8
 VCQFzguFumbsp8ME4916CH1ZAEm8zog=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-ts1um9pXO_Sy61vulyuTzg-1; Mon, 06 Jan 2025 09:36:36 -0500
X-MC-Unique: ts1um9pXO_Sy61vulyuTzg-1
X-Mimecast-MFC-AGG-ID: ts1um9pXO_Sy61vulyuTzg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43651b1ba8aso98934595e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 06:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736174195; x=1736778995;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5hcIYBd2cFpQ/iFdFgXHOmNme6Kj/cPc06DAfBxeQY=;
 b=Yqvl+RVitxewiX2Ylge/tUhICm3UxwzoFA7MDox9UWgCLc3zCLgNm8KFQyGP7SABFd
 Kfhc2iqhCNdCHbP0QQlsq74mqMY7vwu/4PZNTZT8sDnKFZcRpy36t7bi9iWbZ9pOMAtK
 DN6sczNfJRCHkXjmET90NccTc1/scdtokgwMCDIs/K9n9sm+8UWGlR5Ak1KNv1hf47Z9
 Wod7o8eyfHi27+CcX+P4/rOAbNb3uwdIC5eB8WlFMrGgePLXCdYxZC9BqRZ42fYMKhzl
 v4OPENqByvwZs2KqHh/bC8E3mgaVmPd/Vbn5cTuvFSfNqCLgAplThfHcssp3cuiCn1Y9
 xsew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoe/iF5lWbkISroY8e40AMzk3/ZtLWBdtv5d2pvKw6ZAkZVFgF+oYcJhAdpoYU56SHwmDJGmMlkbs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk+hnMOXu9+Kk/GQnWSd58t9tCucdVqlr47tE5SChRvYfafQPb
 fbUuVW8rbHsSUPfBgqQqADkX4vBLJ47eZkRvqBMwRftiOmkastDZKdoLBPEdglOizi3eO9M3WXT
 9x6AGVLIe91akUWx5VDk3/kcjOXZG11P8UmFtVQi/swQWL2QnBEpVoXflx23GqPN/LQ==
X-Gm-Gg: ASbGncuJZb/c9pVLFQAusrW78i9I+Q8V/qMiAY0ZsIduDWwjk0lRJBJlKx+NBC9RXUA
 ox+FgtKD+kERY+/xvOv0C7oNYGOHM3aJsIGJSkvOmb+v+gjVpIklhZ5lYA8khfUvJNrf3LMrGx9
 wSG2kgdTUohV6P35xpwzqPHNiyYOq6b/hNW8anLS9nEcIYJR+LDq3sYtSuxRldSv/IFU+0wSBBY
 Fujmp+eROl8hqvFrno6AzzkkEnHboY4
X-Received: by 2002:a05:600c:1990:b0:435:294:f1c8 with SMTP id
 5b1f17b1804b1-43668b93834mr397724185e9.28.1736174195191; 
 Mon, 06 Jan 2025 06:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0zUq0wMUNH4AGrWwr5yK1Wt7AJ8lyLbtSAp+NItR7fypEguExnUJqnsC50MI52YtRVFYQdg==
X-Received: by 2002:a05:600c:1990:b0:435:294:f1c8 with SMTP id
 5b1f17b1804b1-43668b93834mr397723965e9.28.1736174194695; 
 Mon, 06 Jan 2025 06:36:34 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661218f43sm573410285e9.19.2025.01.06.06.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 06:36:34 -0800 (PST)
Date: Mon, 6 Jan 2025 15:36:33 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ying Liu <victor.liu@nxp.com>,
 Marek Vasut <marex@denx.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 Abel Vesa <abel.vesa@linaro.org>, Herve Codina <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
Message-ID: <20250106-fabulous-tapir-of-acceptance-c4e3e7@houat>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
 <20241217-brown-wapiti-of-promotion-e3bec6@houat>
 <87bjx2tf3y.fsf@bootlin.com>
 <c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="l2x26wlw7urnozbm"
Content-Disposition: inline
In-Reply-To: <c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--l2x26wlw7urnozbm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
MIME-Version: 1.0

On Mon, Dec 30, 2024 at 05:22:56PM -0800, Stephen Boyd wrote:
> Quoting Miquel Raynal (2024-12-23 10:43:13)
> > Hi Maxime,
> >=20
> > On 17/12/2024 at 13:47:53 +01, Maxime Ripard <mripard@redhat.com> wrote:
> >=20
> > > On Thu, Nov 21, 2024 at 06:41:14PM +0100, Miquel Raynal wrote:
> > >> There are mainly two ways to change a clock frequency.
> > >
> > > There's much more than that :)
> >=20
> > "mainly"
> >=20
> > Or maybe I should have added "on purpose".
> >=20
> > >
> > > Off the top of my head, setting/clearing a min/max rate and changing =
the
> > > parent might also result in a rate change.
> > >
> > > And then, the firmware might get involved too.
> > >
> > >> The active way requires calling ->set_rate() in order to ask "on
> > >> purpose" for a frequency change. Otherwise, a clock can passively see
> > >> its frequency being updated depending on upstream clock frequency
> > >> changes. In most cases it is fine to just accept the new upstream
> > >> frequency - which by definition will have an impact on downstream
> > >> frequencies if we do not recalculate internal divisors. But there are
> > >> cases where, upon an upstream frequency change, we would like to
> > >> maintain a specific rate.
> > >
> > > Why is clk_set_rate_exclusive not enough?
> >=20
> > I am trying to protect these rate changes from subtree walks, I don't
> > see where setting an exclusive rate would have an effect? But I might be
> > overlooking something, definitely.
> >=20
> > ...
> >=20
> > >> @@ -2272,7 +2271,13 @@ static void clk_calc_subtree(struct clk_core =
*core)
> > >>  {
> > >>      struct clk_core *child;
> > >> =20
> > >> -    core->new_rate =3D clk_recalc(core, core->parent->new_rate);
> > >> +    if (core->flags & CLK_NO_RATE_CHANGE_DURING_PROPAGATION) {
> > >> +            core->new_rate =3D clk_determine(core, core->rate);
> > >> +            if (!core->new_rate)
> > >> +                    core->new_rate =3D clk_recalc(core, core->paren=
t->new_rate);
> > >> +    } else {
> > >> +            core->new_rate =3D clk_recalc(core, core->parent->new_r=
ate);
> > >> +    }
> > >
> > > Sorry, it's not clear to me how it works. How will the parent clocks
> > > will get notified to adjust their dividers in that scenario? Also, wh=
at
> > > if they can't?
> >=20
> > The idea is: if the flag is set, instead of accepting the new upstream
> > rate and recalculate the downstream rate based on a previously set
> > divider value, we change our divider value to match the same frequency
> > as before. But if we cannot, then we just keep the old way.
> >=20
>=20
> The exclusive rate code could support this if it doesn't already do so.
> If you call clk_set_rate_exclusive(child, <constant rate>) followed by
> clk_set_rate(parent, <new rate>) the core code should try to keep the
> child at the constant rate, or fail the clk_set_rate() call on the
> parent. It should be possible to confirm this with some KUnit tests for
> clk_set_rate_exclusive(). Similarly, if another child, child_B, of the
> parent changes the parent rate, we should speculate the new rate of the
> child_A that's protected and fail if we can't maintain the rate. We need
> to start generating a list of clks that we operate a rate change on to
> support this though, because right now we rely on the stack to track the
> clks that we change the rate of.
>=20
> Initially we thought that we could do this with clk notifiers. That may
> work here, but I suspect it will be clunky to get working because clk
> notifiers operate on struct clk.

I think notifiers are great for customers, but not really adequate for
the clock drivers tree. Indeed, you can only react to a (sub)tree
configuration using notifiers, but you can't affect it to try something
new that would be a better fit.

Like, if we have a PLL A, with two child clocks that are dividers. B is
initially (exclusively) set to freq X, and then you want to set C to 2X.

The best thing to do is to set A to 2X, and double B's divider. It's
simple enough, but we have no way to try to negociate that at the
moment.

Maxime

--l2x26wlw7urnozbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ3vqbQAKCRAnX84Zoj2+
duj7AYDidThds1LFflb8OweKnRrNPu4M0tpfbKNRxlViGeUwfGeosS89X8zOl5WP
yBs8cfoBf3W2e/SASrJLpQctBMdyN2XKiw8Hpa9n9cLwlnq7mQteUYczwt9dWEyp
r6A1YHUBOw==
=VbDO
-----END PGP SIGNATURE-----

--l2x26wlw7urnozbm--

