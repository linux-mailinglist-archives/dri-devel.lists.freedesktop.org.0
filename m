Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981BA8B33DE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 11:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9818F10EC56;
	Fri, 26 Apr 2024 09:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HQTUOZDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223CC10EC56
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 09:25:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 114E466B;
 Fri, 26 Apr 2024 11:24:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1714123455;
 bh=4sk3SkM9lTZY2JBkhhraAd6ifVIO1oEjvKtMkIamMGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HQTUOZDYmjmdlbB0bcbZ2NEqb+R83Hd10+hCsRKTTuc2aXnYepiQVDrzkOdEXdpbe
 d2lnDfNujb83VAOOpY4k7/HArtBk6L/7WL5hbogkzkdBm72Uem8gGBt7ditsbS1n7Y
 GED8BGTR2J/2mgslVwPguHMUvptabgDXo0R3XAsM=
Date: Fri, 26 Apr 2024 12:25:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: Fix missing drm_bridge_add() call
Message-ID: <20240426092500.GA4524@pendragon.ideasonboard.com>
References: <20240312-xilinx-dp-lock-fix-v1-1-1698f9f03bac@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240312-xilinx-dp-lock-fix-v1-1-1698f9f03bac@ideasonboard.com>
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

Hi Tomi,

Thank you for the patch.

On Tue, Mar 12, 2024 at 10:51:15AM +0200, Tomi Valkeinen wrote:
> The driver creates a bridge, but never calls drm_bridge_add() when
> non-live input is used. This leaves the bridge's hpd_mutex
> uninitialized, leading to:
> 
> WARNING: CPU: 0 PID: 9 at kernel/locking/mutex.c:582 __mutex_lock+0x708/0x840
> 
> Add the bridge add & remove calls so that the bridge gets managed
> correctly.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Fixes: 561671612394 ("drm: xlnx: zynqmp_dpsub: Add support for live video input")
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c    | 4 ++++
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index a0606fab0e22..9f750740dfb8 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1761,6 +1761,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>  
>  	dpsub->dp = dp;
>  
> +	drm_bridge_add(dpsub->bridge);
> +

This means that the bridge will be exposed to users before
zynqmp_disp_probe() is called, opening the door to a potential
use-before-init. The risk is mostly theoretical at this point I believe,
but it's still not a direction I'd like to that. Could you call
drm_bridge_add() in zynqmp_dpsub_probe(), between zynqmp_disp_probe()
and zynqmp_dpsub_drm_init() ?

>  	dev_dbg(dp->dev, "ZynqMP DisplayPort Tx probed with %u lanes\n",
>  		dp->num_lanes);
>  
> @@ -1789,4 +1791,6 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
>  
>  	zynqmp_dp_phy_exit(dp);
>  	zynqmp_dp_reset(dp, true);
> +
> +	drm_bridge_remove(dpsub->bridge);
>  }
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index 88eb33acd5f0..3933c4f1a44f 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -260,8 +260,6 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>  		ret = zynqmp_dpsub_drm_init(dpsub);
>  		if (ret)
>  			goto err_disp;
> -	} else {
> -		drm_bridge_add(dpsub->bridge);
>  	}
>  
>  	dev_info(&pdev->dev, "ZynqMP DisplayPort Subsystem driver probed");
> @@ -288,8 +286,6 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
>  
>  	if (dpsub->drm)
>  		zynqmp_dpsub_drm_cleanup(dpsub);
> -	else
> -		drm_bridge_remove(dpsub->bridge);
>  
>  	zynqmp_disp_remove(dpsub);
>  	zynqmp_dp_remove(dpsub);
> 
> ---
> base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
> change-id: 20240312-xilinx-dp-lock-fix-cf68f43a7bab

-- 
Regards,

Laurent Pinchart
