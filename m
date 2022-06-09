Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1205456F9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 00:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1E011BFDE;
	Thu,  9 Jun 2022 22:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AB111BCB0;
 Thu,  9 Jun 2022 22:12:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B4BF61F5E;
 Thu,  9 Jun 2022 22:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684C1C34114;
 Thu,  9 Jun 2022 22:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654812731;
 bh=zJvO4Ob62G1vZNY0ZLTIVvosVMthN1HJt9gvNcztX2c=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=cTKMxbEYwLB84MUA4Do8QRyHyOLUgtD5RLQ/1RlSMk2SgHDKcBvtPUs169GiTbQdc
 G/ycUcmw7zJp/7TtERG5HYIXnsfeJaX7ZUQeA9rlGlqFKYS/7NjzLpmPkn4Q8Axkni
 zVvxj9rXGxhbO6iVr8Ckyx3opAK61KNoe40cGD+DxKlFTpajFe38Dek/7iDYjviiQ4
 r6YKe5LGP3mD+msS3+kh1X4o1HzFzY6Rf6On0xmPT/GdQ20hxxtVPCdYdEcNGQxr7Q
 ypzvPbP7fCec+RW5k558duToIGoiRzFjyWM9IT+ypjpA4eS5KUYeONFoGDwqj/o5UD
 yTar86bAUyBmw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA8EJpomtbN0+ocD2pRbkYriUY4D9OnjgoFzL9qNHhPm3Uz5cQ@mail.gmail.com>
References: <20220601220747.1145095-1-marijn.suijten@somainline.org>
 <20220601220747.1145095-4-marijn.suijten@somainline.org>
 <CAA8EJpomtbN0+ocD2pRbkYriUY4D9OnjgoFzL9qNHhPm3Uz5cQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] clk: fixed-factor: Introduce
 *clk_hw_register_fixed_factor_parent_hw()
From: Stephen Boyd <sboyd@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 09 Jun 2022 15:12:09 -0700
User-Agent: alot/0.10
Message-Id: <20220609221211.684C1C34114@smtp.kernel.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Arnd Bergmann <arnd@arndb.de>, Jami Kettunen <jami.kettunen@somainline.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-02 03:20:19)
> On Thu, 2 Jun 2022 at 01:07, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> > diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-fac=
tor.c
> > index 54942d758ee6..fabb98d0cdb2 100644
> > --- a/drivers/clk/clk-fixed-factor.c
> > +++ b/drivers/clk/clk-fixed-factor.c
> > @@ -78,7 +78,8 @@ static void devm_clk_hw_register_fixed_factor_release=
(struct device *dev, void *
> >
> >  static struct clk_hw *
> >  __clk_hw_register_fixed_factor(struct device *dev, struct device_node =
*np,
> > -               const char *name, const char *parent_name, int index,
> > +               const char *name, const char *parent_name,
> > +               const struct clk_hw *parent_hw, int index,
> >                 unsigned long flags, unsigned int mult, unsigned int di=
v,
> >                 bool devm)
> >  {
> > @@ -108,7 +109,9 @@ __clk_hw_register_fixed_factor(struct device *dev, =
struct device_node *np,
> >         init.name =3D name;
> >         init.ops =3D &clk_fixed_factor_ops;
> >         init.flags =3D flags;
> > -       if (parent_name)
> > +       if (parent_hw)
> > +               init.parent_hws =3D &parent_hw;
> > +       else if (parent_name)
> >                 init.parent_names =3D &parent_name;
>=20
> If you change the order of if clauses, you won't have to introduce
> unnecessary changes.

Indeed, please do that.

>=20
> >         else
> >                 init.parent_data =3D &pdata;
> > @@ -148,17 +151,50 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_=
index(struct device *dev,
> >                 const char *name, unsigned int index, unsigned long fla=
gs,
> >                 unsigned int mult, unsigned int div)
> >  {
> > -       return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, in=
dex,
> > -                                             flags, mult, div, true);
> > +       return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, NU=
LL,
> > +                                             index, flags, mult, div, =
true);
>=20
> Here (and several times later) you are inserting an argument and then
> moving arguments to the next line. My slight preference would be to
> just insert the arg (and maybe break the line if it gets too long) w/o
> touching the next lines.

I'd just add the argument at the end because when it is added in the
middle it makes the diff more difficult to read.
