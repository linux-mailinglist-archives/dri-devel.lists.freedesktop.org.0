Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBF53FBF23
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 00:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D35689B70;
	Mon, 30 Aug 2021 22:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D02989B70;
 Mon, 30 Aug 2021 22:53:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDFD961004;
 Mon, 30 Aug 2021 22:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630363991;
 bh=CuRU5V2uX9+sWVT8L+dKxVnPm8RG5qyiQPyEmwcMfLs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=eoFceDxGSzkh4NZx2X8dM3YGUts1v0Pl5/uCBifSiK5t7UUf2t1fzXKRD80iJvHkK
 MtI/xIK2N6DVE4vwWH0L/NY57K+UABUEg2ODwcKiKaim+7boh0aDMW9yH+bem1WR8J
 WZrPiRnAxgeBLw6Lptl+CNfhJJb+jqlxEM6sYFdpVF3ziGbSBGw21spSq9dV8XEnzU
 FwnrvuUXorZmniKDn1lvwIBdoLtbt9k6CAsNnRZnr7akEy8CWNDG5TwOpVM1u7ltw5
 MQae2TAbeN89g83BiXn/wKsVGOV3MFKsR98AMV6M1pqb1OyaozdW1Iksj6vHl3E7Xz
 IzIddIvwR8PHg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YS1fllEswGQEGWPc@Marijn-Arch-PC.localdomain>
References: <20210830182445.167527-1-marijn.suijten@somainline.org>
 <20210830182445.167527-2-marijn.suijten@somainline.org>
 <163036177339.2676726.12271104951144475163@swboyd.mtv.corp.google.com>
 <YS1fllEswGQEGWPc@Marijn-Arch-PC.localdomain>
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: Use "ref" fw clock instead of global
 name for VCO parent
From: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>,
 Matthias Kaehlcke <mka@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 30 Aug 2021 15:53:10 -0700
Message-ID: <163036399040.2676726.5816296584899284140@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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

Quoting Marijn Suijten (2021-08-30 15:45:42)
> Hi Stephen,
>=20
> On 2021-08-30 15:16:13, Stephen Boyd wrote:
> > Quoting Marijn Suijten (2021-08-30 11:24:44)
> > > All DSI PHY/PLL drivers were referencing their VCO parent clock by a
> > > global name, most of which don't exist or have been renamed.  These
> > > clock drivers seem to function fine without that except the 14nm driv=
er
> > > for the sdm6xx [1].
> > >=20
> > > At the same time all DTs provide a "ref" clock as per the requirements
> > > of dsi-phy-common.yaml, but the clock is never used.  This patchset p=
uts
> > > that clock to use without relying on a global clock name, so that all
> > > dependencies are explicitly defined in DT (the firmware) in the end.
> > >=20
> > > Note that msm8974 is the only board not providing this clock, and
> > > apq8064 was providing the wrong clock (19.2MHz cxo instead of 27MHz
> > > pxo).  Both have been been addressed in separate patches that are
> > > supposed to land well in advance of this patchset.
> > >=20
> > > Furthermore not all board-DTs provided this clock initially but that
> > > deficiency has been addressed in followup patches (see the Fixes:
> > > below).  Those commits seem to assume that the clock was used, while
> > > nothing in history indicates that this "ref" clock was ever retrieved.
> > >=20
> > > [1]: https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc=
83f8a1be96@somainline.org/
> > >=20
> > > Fixes: 79e51645a1dd ("arm64: dts: qcom: msm8916: Set 'xo_board' as re=
f clock of the DSI PHY")
> > > Fixes: 6969d1d9c615 ("ARM: dts: qcom-apq8064: Set 'cxo_board' as ref =
clock of the DSI PHY")
> > > Fixes: 0c0e72705a33 ("arm64: dts: sdm845: Set 'bi_tcxo' as ref clock =
of the DSI PHYs")
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 4 +++-
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 4 +++-
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 4 +++-
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 +++-
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 4 +++-
> > >  5 files changed, 15 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu=
/drm/msm/dsi/phy/dsi_phy_10nm.c
> > > index e46b10fc793a..3cbb1f1475e8 100644
> > > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> > > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> > > @@ -562,7 +562,9 @@ static int pll_10nm_register(struct dsi_pll_10nm =
*pll_10nm, struct clk_hw **prov
> > >         char clk_name[32], parent[32], vco_name[32];
> > >         char parent2[32], parent3[32], parent4[32];
> > >         struct clk_init_data vco_init =3D {
> > > -               .parent_names =3D (const char *[]){ "xo" },
> > > +               .parent_data =3D &(const struct clk_parent_data) {
> > > +                       .fw_name =3D "ref",
> >=20
> > Please also add .name as the old parent_names value so that newer
> > kernels can be used without having to use new DT.
>=20
> We discussed that only msm8974 misses this "ref" clock at the time of
> writing.  Aforementioned Fixes: patches have all been merged about 3
> years ago, are those DTs still in use with a newer kernel?  I suppose
> this patch is only backported to kernels including those DT patches, is
> it reasonable to assume that at least that DT is in use there?

I have no idea.

>=20
> Besides, not all clock trees provide this global "xo" or "bi_tcxo" clock
> in the first place.
>=20

It doesn't hurt to also specify a .name to help migrate anything else
over. Unless you're confident it won't cause problems to rely on proper
DT being used?
