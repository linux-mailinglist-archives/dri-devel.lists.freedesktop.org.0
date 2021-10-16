Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FA0430293
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 14:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FB36E453;
	Sat, 16 Oct 2021 12:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7769C6E453
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 12:25:18 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 1efe3711-2e7c-11ec-9c3f-0050568c148b;
 Sat, 16 Oct 2021 12:25:17 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id DAD98194B5B;
 Sat, 16 Oct 2021 14:25:22 +0200 (CEST)
Date: Sat, 16 Oct 2021 14:25:13 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/bridge: dw-mipi-dsi: Fix dsi registration during
 drm probing
Message-ID: <YWrEqStMPYuzUoUn@ravnborg.org>
References: <20211016102232.202119-1-michael@amarulasolutions.com>
 <20211016102232.202119-6-michael@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016102232.202119-6-michael@amarulasolutions.com>
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

Hi Michael,

I fail to follow the logic in this patch.


On Sat, Oct 16, 2021 at 10:22:32AM +0000, Michael Trimarchi wrote:
> The dsi registration is implemented in rockchip platform driver.
> The attach can be called before the probe is terminated and therefore
> we need to be sure that corresponding entry during attach is valid
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c   |  8 +++++++-
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++++++----
>  include/drm/bridge/dw_mipi_dsi.h                |  2 +-
>  3 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index e44e18a0112a..44b211be15fc 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -362,8 +362,14 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  		dsi->device_found = true;
>  	}
>  
> +	/*
> +	 * NOTE: the dsi registration is implemented in
> +	 * platform driver, that to say dsi would be exist after
> +	 * probe is terminated. The call is done before the end of probe
> +	 * so we need to pass the dsi to the platform driver.
> +	 */
>  	if (pdata->host_ops && pdata->host_ops->attach) {
> -		ret = pdata->host_ops->attach(pdata->priv_data, device);
> +		ret = pdata->host_ops->attach(pdata->priv_data, device, dsi);
>  		if (ret < 0)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> index a2262bee5aa4..32ddc8642ec1 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -997,7 +997,8 @@ static const struct component_ops dw_mipi_dsi_rockchip_ops = {
>  };
>  
>  static int dw_mipi_dsi_rockchip_host_attach(void *priv_data,
> -					    struct mipi_dsi_device *device)
> +					    struct mipi_dsi_device *device,
> +					    struct dw_mipi_dsi *dmd)
>  {
>  	struct dw_mipi_dsi_rockchip *dsi = priv_data;
>  	struct device *second;
> @@ -1005,6 +1006,8 @@ static int dw_mipi_dsi_rockchip_host_attach(void *priv_data,
>  
>  	mutex_lock(&dsi->usage_mutex);
>  
> +	dsi->dmd = dmd;
> +
>  	if (dsi->usage_mode != DW_DSI_USAGE_IDLE) {
>  		DRM_DEV_ERROR(dsi->dev, "dsi controller already in use\n");
>  		mutex_unlock(&dsi->usage_mutex);
> @@ -1280,6 +1283,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> +	struct dw_mipi_dsi *dmd;
>  	struct dw_mipi_dsi_rockchip *dsi;
>  	struct phy_provider *phy_provider;
>  	struct resource *res;
> @@ -1391,9 +1395,9 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
>  	if (IS_ERR(phy_provider))
>  		return PTR_ERR(phy_provider);
>  
> -	dsi->dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
> -	if (IS_ERR(dsi->dmd)) {
> -		ret = PTR_ERR(dsi->dmd);
> +	dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
> +	if (IS_ERR(dmd)) {
> +		ret = PTR_ERR(dmd);

The memory pointed to by dmd is allocated in dw_mipi_dsi_probe(), but
the pointer is not saved here.
We rely on the attach operation to save the dmd pointer.


In other words - the attach operation must be called before we call
dw_mipi_dsi_rockchip_remove(), which uses the dmd member.

This all looks wrong to me - are we papering over some other issue
here?

	Sam
