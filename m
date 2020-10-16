Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CED2290D7C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 23:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BE26E061;
	Fri, 16 Oct 2020 21:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4B26E061
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 21:55:12 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DEF4180626;
 Fri, 16 Oct 2020 23:55:09 +0200 (CEST)
Date: Fri, 16 Oct 2020 23:55:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Qilong Zhang <zhangqilong3@huawei.com>
Subject: Re: [PATCH -next] dss:use devm_platform_ioremap_resource_byname
Message-ID: <20201016215508.GD1962741@ravnborg.org>
References: <20200916111353.105914-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916111353.105914-1-zhangqilong3@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=j5AbMmh5N-F5ncrrDQQA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 b.zolnierkie@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhang Qilong 

On Wed, Sep 16, 2020 at 07:13:53PM +0800, Qilong Zhang wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Thanks, applied to drm-misc-next. The patch will appear in -next in a
few weeks.

While applying I had to update a few things:
- checkpatch warning due to indent
- warning for unused variable
- subject, should start with "omapfb:" like other patches touching the
  same driver.

I also got a warning because you name differs in your mail and your
s-o-b. "Zhang Qilong" is not the same as "Qilong Zhang".
It would be nice if you for next submission have the same name in both
places.

The patch itself was fine - nice simplifications.

	Sam


> ---
>  .../video/fbdev/omap2/omapfb/dss/hdmi4_core.c | 10 +--------
>  .../video/fbdev/omap2/omapfb/dss/hdmi5_core.c | 10 +--------
>  .../video/fbdev/omap2/omapfb/dss/hdmi_phy.c   | 10 +--------
>  .../video/fbdev/omap2/omapfb/dss/hdmi_pll.c   |  9 +-------
>  .../video/fbdev/omap2/omapfb/dss/video-pll.c  | 21 +++----------------
>  5 files changed, 7 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
> index 7ca1803bf161..726c190862d4 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
> @@ -875,15 +875,7 @@ void hdmi4_audio_stop(struct hdmi_core_data *core, struct hdmi_wp_data *wp)
>  
>  int hdmi4_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
>  {
> -	struct resource *res;
> -
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
> -	if (!res) {
> -		DSSERR("can't get CORE mem resource\n");
> -		return -EINVAL;
> -	}
> -
> -	core->base = devm_ioremap_resource(&pdev->dev, res);
> +	core->base = devm_platform_ioremap_resource_byname(pdev, "core");
>  	if (IS_ERR(core->base)) {
>  		DSSERR("can't ioremap CORE\n");
>  		return PTR_ERR(core->base);
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
> index 2f6ff14a48d9..eda29d3032e1 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
> @@ -887,15 +887,7 @@ int hdmi5_audio_config(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
>  
>  int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
>  {
> -	struct resource *res;
> -
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
> -	if (!res) {
> -		DSSERR("can't get CORE IORESOURCE_MEM HDMI\n");
> -		return -EINVAL;
> -	}
> -
> -	core->base = devm_ioremap_resource(&pdev->dev, res);
> +	core->base = devm_platform_ioremap_resource_byname(pdev, "core");
>  	if (IS_ERR(core->base)) {
>  		DSSERR("can't ioremap HDMI core\n");
>  		return PTR_ERR(core->base);
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c
> index 9c645adba9e2..6fbfeb01b315 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c
> @@ -207,19 +207,11 @@ static const struct hdmi_phy_features *hdmi_phy_get_features(void)
>  
>  int hdmi_phy_init(struct platform_device *pdev, struct hdmi_phy_data *phy)
>  {
> -	struct resource *res;
> -
>  	phy_feat = hdmi_phy_get_features();
>  	if (!phy_feat)
>  		return -ENODEV;
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
> -	if (!res) {
> -		DSSERR("can't get PHY mem resource\n");
> -		return -EINVAL;
> -	}
> -
> -	phy->base = devm_ioremap_resource(&pdev->dev, res);
> +	phy->base = devm_platform_ioremap_resource_byname(pdev, "phy");
>  	if (IS_ERR(phy->base)) {
>  		DSSERR("can't ioremap TX PHY\n");
>  		return PTR_ERR(phy->base);
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
> index 4991be031b0b..eb984d9999fe 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
> @@ -220,17 +220,10 @@ int hdmi_pll_init(struct platform_device *pdev, struct hdmi_pll_data *pll,
>  	struct hdmi_wp_data *wp)
>  {
>  	int r;
> -	struct resource *res;
>  
>  	pll->wp = wp;
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pll");
> -	if (!res) {
> -		DSSERR("can't get PLL mem resource\n");
> -		return -EINVAL;
> -	}
> -
> -	pll->base = devm_ioremap_resource(&pdev->dev, res);
> +	pll->base = devm_platform_ioremap_resource_byname(pdev, "pll");
>  	if (IS_ERR(pll->base)) {
>  		DSSERR("can't ioremap PLLCTRL\n");
>  		return PTR_ERR(pll->base);
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/video-pll.c b/drivers/video/fbdev/omap2/omapfb/dss/video-pll.c
> index f45fe60b9e7d..bff03d920722 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/video-pll.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/video-pll.c
> @@ -129,7 +129,6 @@ struct dss_pll *dss_video_pll_init(struct platform_device *pdev, int id,
>  	const char * const clkctrl_name[] = { "pll1_clkctrl", "pll2_clkctrl" };
>  	const char * const clkin_name[] = { "video1_clk", "video2_clk" };
>  
> -	struct resource *res;
>  	struct dss_video_pll *vpll;
>  	void __iomem *pll_base, *clkctrl_base;
>  	struct clk *clk;
> @@ -138,14 +137,7 @@ struct dss_pll *dss_video_pll_init(struct platform_device *pdev, int id,
>  
>  	/* PLL CONTROL */
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, reg_name[id]);
> -	if (!res) {
> -		dev_err(&pdev->dev,
> -			"missing platform resource data for pll%d\n", id);
> -		return ERR_PTR(-ENODEV);
> -	}
> -
> -	pll_base = devm_ioremap_resource(&pdev->dev, res);
> +	pll_base = devm_platform_ioremap_resource_byname(pdev, reg_name[id]);
>  	if (IS_ERR(pll_base)) {
>  		dev_err(&pdev->dev, "failed to ioremap pll%d reg_name\n", id);
>  		return ERR_CAST(pll_base);
> @@ -153,15 +145,8 @@ struct dss_pll *dss_video_pll_init(struct platform_device *pdev, int id,
>  
>  	/* CLOCK CONTROL */
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -		clkctrl_name[id]);
> -	if (!res) {
> -		dev_err(&pdev->dev,
> -			"missing platform resource data for pll%d\n", id);
> -		return ERR_PTR(-ENODEV);
> -	}
> -
> -	clkctrl_base = devm_ioremap_resource(&pdev->dev, res);
> +	clkctrl_base = devm_platform_ioremap_resource_byname(pdev,
> +					clkctrl_name[id]);
>  	if (IS_ERR(clkctrl_base)) {
>  		dev_err(&pdev->dev, "failed to ioremap pll%d clkctrl\n", id);
>  		return ERR_CAST(clkctrl_base);
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
