Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B4B546CDD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 21:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BAE10FAA8;
	Fri, 10 Jun 2022 19:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BB710FA6C;
 Fri, 10 Jun 2022 19:01:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2D3B61EA7;
 Fri, 10 Jun 2022 19:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1352DC34114;
 Fri, 10 Jun 2022 19:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654887672;
 bh=Hnvop1nQB2a1YvXC9KrSU6WdMwLevAsVoA6EE55HKf0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=j2V8JdBRB9od3csLhFaWyYbQv4LOFTb655urrswTus3Zufk/CEtBBoyna10Gf0yzw
 g2Q25Psjl8EgSp54TApA8f2BEC4zmE/5LyPX/9sWAd+T/8SbBiqlZnpRS8NJmLdfLJ
 YXccNmbOugAmc0N1Y4Y3Zqb3FiKyYm8NFPBK6NqoIj0m2eVqVFUeBXoiZHdMKm2T3t
 UlUApgeWIfxWnmUOGL1W8187VMKi/0/uYDgZMax5vUo8xdYFSmcp0F5suozphejrz8
 WDs2WSLXWc27b2R5mOv8MNt7/VTjNxoQHJIWnHepHV54LX80fhopqJX0VAsjrJGjXj
 z8wubT/wkWYcA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220610074632.abtec5kulbclund4@SoMainline.org>
References: <20220601220747.1145095-1-marijn.suijten@somainline.org>
 <20220601220747.1145095-4-marijn.suijten@somainline.org>
 <CAA8EJpomtbN0+ocD2pRbkYriUY4D9OnjgoFzL9qNHhPm3Uz5cQ@mail.gmail.com>
 <20220609221211.684C1C34114@smtp.kernel.org>
 <20220610074632.abtec5kulbclund4@SoMainline.org>
Subject: Re: [PATCH v2 03/11] clk: fixed-factor: Introduce
 *clk_hw_register_fixed_factor_parent_hw()
From: Stephen Boyd <sboyd@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 10 Jun 2022 12:01:10 -0700
User-Agent: alot/0.10
Message-Id: <20220610190112.1352DC34114@smtp.kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Marijn Suijten (2022-06-10 00:46:32)
> On 2022-06-09 15:12:09, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2022-06-02 03:20:19)
> > > On Thu, 2 Jun 2022 at 01:07, Marijn Suijten
> > > <marijn.suijten@somainline.org> wrote:
> > > > diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed=
-factor.c
> > > > index 54942d758ee6..fabb98d0cdb2 100644
> > > > --- a/drivers/clk/clk-fixed-factor.c
> > > > +++ b/drivers/clk/clk-fixed-factor.c
> > > > @@ -148,17 +151,50 @@ struct clk_hw *devm_clk_hw_register_fixed_fac=
tor_index(struct device *dev,
> > > >                 const char *name, unsigned int index, unsigned long=
 flags,
> > > >                 unsigned int mult, unsigned int div)
> > > >  {
> > > > -       return __clk_hw_register_fixed_factor(dev, NULL, name, NULL=
, index,
> > > > -                                             flags, mult, div, tru=
e);
> > > > +       return __clk_hw_register_fixed_factor(dev, NULL, name, NULL=
, NULL,
> > > > +                                             index, flags, mult, d=
iv, true);
> > >=20
> > > Here (and several times later) you are inserting an argument and then
> > > moving arguments to the next line. My slight preference would be to
> > > just insert the arg (and maybe break the line if it gets too long) w/o
> > > touching the next lines.
>=20
> That'll definitely look odd, as we'll end up with index floating on a
> single line, all on its own.

Pretty sure Dmitry is suggesting to make the line longer, not put the
index on a line by itself. Ignore the 80-column limit.

>=20
> > I'd just add the argument at the end because when it is added in the
> > middle it makes the diff more difficult to read.
>=20
> How strong is this feeling, against keeping argument ordering consistent
> with other implementations of similar __clk_hw_register_* functions?
>=20

Not super strong. Just try to minimize the diff to make the reviewer's
job easier. In this case it would be inserting NULL before 'index' and
not modifying the next line so the diff is one line instead of two.
