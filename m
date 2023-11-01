Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406527DE1C7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 14:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D65C10E6F2;
	Wed,  1 Nov 2023 13:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0E110E6F2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 13:54:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D953D8D;
 Wed,  1 Nov 2023 14:53:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698846823;
 bh=umd36ZH9/8B0MzVnTORCG6HOMVV7hcOEiqUo9JtmjcM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V1KOm7VV3uZjtjNlXMR4pg1tx0mUa8ziTZ8aXVn4dCHc+FqmR3wzmkrOc/reHG2Zy
 Ep72AygN+Ez+WGmY6Tth0UMsvO2klG60j8uUF53lf1Z0+vUS2hpkR9h7IDVogWAVyp
 xmBWW4X6TuRDwzW+uCf3C0XtyBqOhUNks7BHVt8U=
Date: Wed, 1 Nov 2023 15:54:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 02/10] drm/tidss: Use PM autosuspend
Message-ID: <20231101135406.GR12764@pendragon.ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
 <20231101-tidss-probe-v1-2-45149e0f9415@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231101-tidss-probe-v1-2-45149e0f9415@ideasonboard.com>
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

On Wed, Nov 01, 2023 at 11:17:39AM +0200, Tomi Valkeinen wrote:
> Use runtime PM autosuspend feature, with 1s timeout, to avoid
> unnecessary suspend-resume cycles when, e.g. the userspace temporarily
> turns off the crtcs when configuring the outputs.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tidss/tidss_drv.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index f403db11b846..64914331715a 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -43,7 +43,9 @@ void tidss_runtime_put(struct tidss_device *tidss)
>  
>  	dev_dbg(tidss->dev, "%s\n", __func__);
>  
> -	r = pm_runtime_put_sync(tidss->dev);
> +	pm_runtime_mark_last_busy(tidss->dev);
> +
> +	r = pm_runtime_put_autosuspend(tidss->dev);
>  	WARN_ON(r < 0);
>  }
>  
> @@ -144,6 +146,9 @@ static int tidss_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(dev);
>  
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +
>  #ifndef CONFIG_PM
>  	/* If we don't have PM, we need to call resume manually */
>  	dispc_runtime_resume(tidss->dispc);

By the way, there's a way to handle this without any ifdef:

	dispc_runtime_resume(tidss->dispc);

	pm_runtime_set_active(dev);
	pm_runtime_get_noresume(dev);
	pm_runtime_enable(dev);
	pm_runtime_set_autosuspend_delay(dev, 1000);
	pm_runtime_use_autosuspend(dev);

Then, in the error path,

	pm_runtime_dont_use_autosuspend(dev);
	pm_runtime_disable(dev);
	pm_runtime_put_noidle(dev);

	dispc_runtime_suspend(tidss->dispc);

And in remove:

	pm_runtime_dont_use_autosuspend(dev);
	pm_runtime_disable(dev);
	if (!pm_runtime_status_suspended(dev))
		dispc_runtime_suspend(tidss->dispc);
	pm_runtime_set_suspended(dev);

And yes, runtime PM is a horrible API.

> @@ -215,6 +220,7 @@ static void tidss_remove(struct platform_device *pdev)
>  	/* If we don't have PM, we need to call suspend manually */
>  	dispc_runtime_suspend(tidss->dispc);
>  #endif
> +	pm_runtime_dont_use_autosuspend(dev);

This also needs to be done in the probe error path.

>  	pm_runtime_disable(dev);
>  
>  	/* devm allocated dispc goes away with the dev so mark it NULL */
> 

-- 
Regards,

Laurent Pinchart
