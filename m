Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD197DE269
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 15:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C6010E717;
	Wed,  1 Nov 2023 14:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3CD10E709
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 14:32:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D08E8D;
 Wed,  1 Nov 2023 15:32:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698849128;
 bh=a3lw8C+NZXOzSs8DpQrjBo8cXJrv3VFEkvITYoVoJFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L2KGzq6Vz51m8RMXprOhYxgkj6ZNkaYFKtRK15/cjNdkDti5CyhVt6dwn63Hyb+7i
 bSNPayJeEn3FPkffZlZsucFS9EPyPf399G2BNb2aP1rBMxiLXmDtT7HZLmc0a9pVMY
 DrsbngOa+UUej0hyCEGJoCaT0pruEVFuPX7QStZQ=
Date: Wed, 1 Nov 2023 16:32:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 08/10] drm/tidss: Add dispc_is_idle()
Message-ID: <20231101143231.GX12764@pendragon.ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
 <20231101-tidss-probe-v1-8-45149e0f9415@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231101-tidss-probe-v1-8-45149e0f9415@ideasonboard.com>
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Nov 01, 2023 at 11:17:45AM +0200, Tomi Valkeinen wrote:
> Add a helper function, dispc_is_idle(), which returns whether the DSS is
> idle (i.e. is any video port enabled).
> 
> For now we add a call to it in the suspend and resume callbacks, and
> print a warning if in either place the DSS is not idle.

Could you please explain here why these checks are needed/useful ? Why
would the dispc not be idle ?

> In the future
> this can be used to detect if the bootloader had enabled the DSS, and
> the driver can act on that.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 13db062892e3..a527c28c8833 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2603,10 +2603,18 @@ void dispc_vp_setup(struct dispc_device *dispc, u32 hw_videoport,
>  	dispc_vp_set_color_mgmt(dispc, hw_videoport, state, newmodeset);
>  }
>  
> +static bool dispc_is_idle(struct dispc_device *dispc)
> +{
> +	return REG_GET(dispc, DSS_SYSSTATUS, 9, 9);
> +}
> +
>  int dispc_runtime_suspend(struct dispc_device *dispc)
>  {
>  	dev_dbg(dispc->dev, "suspend\n");
>  
> +	if (!dispc_is_idle(dispc))
> +		dev_warn(dispc->dev, "Bad HW state: DSS not idle when suspending");
> +
>  	dispc->is_enabled = false;
>  
>  	clk_disable_unprepare(dispc->fclk);
> @@ -2620,6 +2628,9 @@ int dispc_runtime_resume(struct dispc_device *dispc)
>  
>  	clk_prepare_enable(dispc->fclk);
>  
> +	if (!dispc_is_idle(dispc))
> +		dev_warn(dispc->dev, "Bad HW state: DSS not idle when resuming");
> +
>  	if (REG_GET(dispc, DSS_SYSSTATUS, 0, 0) == 0)
>  		dev_warn(dispc->dev, "DSS FUNC RESET not done!\n");
>  

-- 
Regards,

Laurent Pinchart
