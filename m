Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4AD3D88CA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 09:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777496E1E8;
	Wed, 28 Jul 2021 07:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3FC6E1E8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 07:27:11 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 3c52e2c1-ef75-11eb-9082-0050568c148b;
 Wed, 28 Jul 2021 07:27:16 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id A3EBA194B99;
 Wed, 28 Jul 2021 09:27:30 +0200 (CEST)
Date: Wed, 28 Jul 2021 09:27:07 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH 12/14] drm/kmb: Fix possible oops in error handling
Message-ID: <YQEGy7LvaR3x1nHz@ravnborg.org>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-12-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728003126.1425028-12-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, Dan Carpenter <dan.carpenter@oracle.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha,

On Tue, Jul 27, 2021 at 05:31:24PM -0700, Anitha Chrisanthus wrote:
> If kmb_dsi_init() fails the "kmb->kmb_dsi" variable is an error pointer.
> This can potentially result in kernel panic when kmb_dsi_host_unregister is
> called.
> 
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 9 ++++++---
>  drivers/gpu/drm/kmb/kmb_dsi.c | 9 +++++----
>  drivers/gpu/drm/kmb/kmb_dsi.h | 3 ++-
>  3 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
> index bb7eca9e13ae..12f35c43d838 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -454,8 +454,9 @@ static int kmb_remove(struct platform_device *pdev)
>  	dev_set_drvdata(dev, NULL);
>  
>  	/* Unregister DSI host */
> -	kmb_dsi_host_unregister(kmb->kmb_dsi);
> +	kmb_dsi_host_unregister();
>  	drm_atomic_helper_shutdown(drm);
> +	drm_dev_put(drm);
>  	return 0;
>  }
>  
> @@ -519,7 +520,7 @@ static int kmb_probe(struct platform_device *pdev)
>  	if (IS_ERR(kmb->kmb_dsi)) {
>  		drm_err(&kmb->drm, "failed to initialize DSI\n");
>  		ret = PTR_ERR(kmb->kmb_dsi);
> -		goto err_free1;
> +		goto err_free2;
>  	}
>  
>  	kmb->kmb_dsi->dev = &dsi_pdev->dev;
> @@ -555,8 +556,10 @@ static int kmb_probe(struct platform_device *pdev)
>  	drm_crtc_cleanup(&kmb->crtc);
>  	drm_mode_config_cleanup(&kmb->drm);
>   err_free1:
> +	kmb_dsi_clk_disable(kmb->kmb_dsi);
> + err_free2:
>  	dev_set_drvdata(dev, NULL);
> -	kmb_dsi_host_unregister(kmb->kmb_dsi);
> +	kmb_dsi_host_unregister();
>  

This really looks like a step backward. There should not be a eed to
call unregister if kmb_dsi is not a valid pointer in the first place.
Also drn_dev_put() should not be needed with the use of drmm
infrastructure.



>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
> index 1cca0fe6f35f..a500172ada87 100644
> --- a/drivers/gpu/drm/kmb/kmb_dsi.c
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> @@ -172,17 +172,17 @@ mipi_hs_freq_range[MIPI_DPHY_DEFAULT_BIT_RATES] = {
>  	{.default_bit_rate_mbps = 2500, .hsfreqrange_code = 0x49}
>  };
>  
> -static void kmb_dsi_clk_disable(struct kmb_dsi *kmb_dsi)
> +void kmb_dsi_clk_disable(struct kmb_dsi *kmb_dsi)
>  {
>  	clk_disable_unprepare(kmb_dsi->clk_mipi);
>  	clk_disable_unprepare(kmb_dsi->clk_mipi_ecfg);
>  	clk_disable_unprepare(kmb_dsi->clk_mipi_cfg);
>  }
>  
> -void kmb_dsi_host_unregister(struct kmb_dsi *kmb_dsi)
> +void kmb_dsi_host_unregister(void)
>  {
> -	kmb_dsi_clk_disable(kmb_dsi);
> -	mipi_dsi_host_unregister(kmb_dsi->host);
> +	if (dsi_host)
> +		mipi_dsi_host_unregister(dsi_host);
>  }
I thought we had killed the global dsi_host variable??
Seems some cleanup is till needed here.

	Sam
