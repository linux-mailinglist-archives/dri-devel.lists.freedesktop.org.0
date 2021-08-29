Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8852F3FAE78
	for <lists+dri-devel@lfdr.de>; Sun, 29 Aug 2021 22:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703AB89B8E;
	Sun, 29 Aug 2021 20:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC2989B8E
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 20:39:31 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id z7so3253005qvi.4
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 13:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JcAGpvjZl4otOzegeVlMhd6VrMWnkv2do4HIsVuxhR0=;
 b=yPuJr/zQ1fgd10+lMFbU0jMaMb0xUflxTZOJrLdglCH24AD9OIydlkW7LJxr9mbnbY
 BzsTCtgZ9bhvnqZNrYLUmhKM65pfmcyTT/VSXIkqpo3SRLtj8cXY3r1fH036In4nJNAx
 oZyCZ+0CXvfh0A5s7XazNsdIGRSCOqJqkPML+Z/4QyXPVvO5PY+8KgidnyZmZ87Qj15N
 zVpb+RR3cuGmbUXpa+88pEMjH0D6XWHuiB0bWjZGM+qsL1UAL79zeHC0vlAuEGM+NugU
 o7qaUj2M5VqAaUH80JYAK99pNxTKi0Uk0N/p1r3Jxa612//77NvEjSpG6UUjvOm2JeyJ
 CnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JcAGpvjZl4otOzegeVlMhd6VrMWnkv2do4HIsVuxhR0=;
 b=bz2QMxlsxrIWuTBVbVrk1VNk+i6i5f9ZRd0K0D7krFnRVyFAHlKoqnSX/0Y7txjWV6
 K19VMH1H6Y2gILXh97B+sRIX6lACjp8zhbszP3Ecv//OJym84vI1CvM2cgB+YwUKD1lH
 hPOJkzsTzDQM0qbE61F4fyNax5zGqgR2JY8PdFx+COJ0xeK31TQQS9RK0FowKjRCJadQ
 ViUFPni6Cp5UT0Ig1G0TvFFgXiqz4g1MVlhRBF+7c1b9LUlOWHorDbPWqKspcYD8v2xL
 2LYr4f98TIhnUaNYxju7nj/rr8rhoxvmrVICI1hq++TbKZSTl0ITjBFyOhO9Vw/cRLZq
 0uow==
X-Gm-Message-State: AOAM532jCEWwlMrWiXSWMXZpiJRrDzX7MM2AJzm7GCPnEpoAVmG1OV/8
 dTs5nD6PI0SGJRaoMoo2QcBB54LBigOL8pSwrOwkwQ==
X-Google-Smtp-Source: ABdhPJwEpxhX59DMqPkOOqNIn7bPRiH3aQrT3YCKJLPzFyFX/jeI0xmPWz1c5Wupta08Vtloc5VWW7MbXpCMXdIMSIk=
X-Received: by 2002:ad4:4b14:: with SMTP id r20mr19549901qvw.61.1630269570386; 
 Sun, 29 Aug 2021 13:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210829203027.276143-1-marijn.suijten@somainline.org>
 <20210829203027.276143-3-marijn.suijten@somainline.org>
In-Reply-To: <20210829203027.276143-3-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 29 Aug 2021 23:39:19 +0300
Message-ID: <CAA8EJppmBvohk3CC87N_P3m+CP=bRLWWknS7esDrYb-xArJFvg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dsi: Use "ref" fw clock instead of global
 name for VCO parent
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Abhinav Kumar <abhinavk@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi,

On Sun, 29 Aug 2021 at 23:30, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> All DSI PHY/PLL drivers were referencing their VCO parent clock by a
> global name, most of which don't exist or have been renamed.  These
> clock drivers seem to function fine without that except the 14nm driver
> for the sdm6xx [1].
>
> At the same time all DTs provide a "ref" clock as per the requirements
> of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
> that clock to use without relying on a global clock name, so that all
> dependencies are explicitly defined in DT (the firmware) in the end.

msm8974 (28nm-hpm) does not define the "ref" clock. So you'd have to:
1) add ref clock to the dtsi (should come in a separate patch).
2) add .name = "xo" as a fallback to the 28nm driver (to be compatible
with older devices)

Other than that this looks good to me.

>
> [1]: https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org/
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 4 +++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 4 +++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 4 +++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 +++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 4 +++-
>  5 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index e46b10fc793a..3cbb1f1475e8 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -562,7 +562,9 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
>         char clk_name[32], parent[32], vco_name[32];
>         char parent2[32], parent3[32], parent4[32];
>         struct clk_init_data vco_init = {
> -               .parent_names = (const char *[]){ "xo" },
> +               .parent_data = &(const struct clk_parent_data) {
> +                       .fw_name = "ref",
> +               },
>                 .num_parents = 1,
>                 .name = vco_name,
>                 .flags = CLK_IGNORE_UNUSED,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index bb31230721bd..406470265408 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -804,7 +804,9 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
>  {
>         char clk_name[32], parent[32], vco_name[32];
>         struct clk_init_data vco_init = {
> -               .parent_names = (const char *[]){ "xo" },
> +               .parent_data = &(const struct clk_parent_data) {
> +                       .fw_name = "ref",
> +               },
>                 .num_parents = 1,
>                 .name = vco_name,
>                 .flags = CLK_IGNORE_UNUSED,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 2da673a2add6..8ee9c9c0548d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -521,7 +521,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>  {
>         char clk_name[32], parent1[32], parent2[32], vco_name[32];
>         struct clk_init_data vco_init = {
> -               .parent_names = (const char *[]){ "xo" },
> +               .parent_data = &(const struct clk_parent_data) {
> +                       .fw_name = "ref",
> +               },
>                 .num_parents = 1,
>                 .name = vco_name,
>                 .flags = CLK_IGNORE_UNUSED,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index aaa37456f4ee..9662cb236468 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -385,7 +385,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>  {
>         char *clk_name, *parent_name, *vco_name;
>         struct clk_init_data vco_init = {
> -               .parent_names = (const char *[]){ "pxo" },
> +               .parent_data = &(const struct clk_parent_data) {
> +                       .fw_name = "ref",
> +               },
>                 .num_parents = 1,
>                 .flags = CLK_IGNORE_UNUSED,
>                 .ops = &clk_ops_dsi_pll_28nm_vco,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 7c23d4c47338..c77c30628cca 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -590,7 +590,9 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>         char clk_name[32], parent[32], vco_name[32];
>         char parent2[32], parent3[32], parent4[32];
>         struct clk_init_data vco_init = {
> -               .parent_names = (const char *[]){ "bi_tcxo" },
> +               .parent_data = &(const struct clk_parent_data) {
> +                       .fw_name = "ref",
> +               },
>                 .num_parents = 1,
>                 .name = vco_name,
>                 .flags = CLK_IGNORE_UNUSED,
> --
> 2.33.0
>


-- 
With best wishes
Dmitry
