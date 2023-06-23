Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 754D873BD92
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5AF10E68A;
	Fri, 23 Jun 2023 17:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9363710E68A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 17:14:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 853A9838;
 Fri, 23 Jun 2023 19:13:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687540428;
 bh=Hwj1sni2JgJtJBI4VRhBNo1sZRyJ35p3cME8oscy48M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N9NYJs/KuoQaWH9irpsEwRW8YIl+ceC0BH39JRR2GkFGTO44IOADX+Mqz0beMYjSW
 b0k3/wVEBSYn/4mJ15o505xDMHAZhGtvDhoaTOtEf5znZnW3Yt8NcvxutGedR5dfKF
 rlxSVWFyKs2EqF6fsDkGy0yJUyXcmHd0O5Fkn50Y=
Date: Fri, 23 Jun 2023 20:14:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 36/39] drm: renesas: shmobile: Use suspend/resume helpers
Message-ID: <20230623171424.GL2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <dfc123f733f907c70b4365676c2211bdeca44ad2.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dfc123f733f907c70b4365676c2211bdeca44ad2.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:48AM +0200, Geert Uytterhoeven wrote:
> Replace the custom suspend/resume handling by calls into
> drm_mode_config_helper_{suspend,resume}().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 13 -------------
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  2 --
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 13 +++----------
>  3 files changed, 3 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index cf7152d64424e720..b11bb666de3bac46 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -339,19 +339,6 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
>  	scrtc->started = false;
>  }
>  
> -void shmob_drm_crtc_suspend(struct shmob_drm_crtc *scrtc)
> -{
> -	shmob_drm_crtc_stop(scrtc);
> -}
> -
> -void shmob_drm_crtc_resume(struct shmob_drm_crtc *scrtc)
> -{
> -	if (scrtc->dpms != DRM_MODE_DPMS_ON)
> -		return;
> -
> -	shmob_drm_crtc_start(scrtc);
> -}
> -
>  static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
>  {
>  	return container_of(crtc, struct shmob_drm_crtc, base);
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> index fe41e42d6cc55275..37380c815f1f5a08 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> @@ -40,8 +40,6 @@ struct shmob_drm_connector {
>  
>  int shmob_drm_crtc_create(struct shmob_drm_device *sdev);
>  void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc);
> -void shmob_drm_crtc_suspend(struct shmob_drm_crtc *scrtc);
> -void shmob_drm_crtc_resume(struct shmob_drm_crtc *scrtc);
>  
>  int shmob_drm_encoder_create(struct shmob_drm_device *sdev);
>  int shmob_drm_connector_create(struct shmob_drm_device *sdev,
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index 9107f84224602683..c43f408d6b1fcc5b 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -20,6 +20,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_generic.h>
>  #include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_modeset_helper.h>
>  #include <drm/drm_module.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -115,22 +116,14 @@ static int shmob_drm_pm_suspend(struct device *dev)
>  {
>  	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
>  
> -	drm_kms_helper_poll_disable(&sdev->ddev);
> -	shmob_drm_crtc_suspend(&sdev->crtc);
> -
> -	return 0;
> +	return drm_mode_config_helper_suspend(&sdev->ddev);
>  }
>  
>  static int shmob_drm_pm_resume(struct device *dev)
>  {
>  	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
>  
> -	drm_modeset_lock_all(&sdev->ddev);
> -	shmob_drm_crtc_resume(&sdev->crtc);
> -	drm_modeset_unlock_all(&sdev->ddev);
> -
> -	drm_kms_helper_poll_enable(&sdev->ddev);
> -	return 0;
> +	return drm_mode_config_helper_resume(&sdev->ddev);
>  }
>  
>  static DEFINE_SIMPLE_DEV_PM_OPS(shmob_drm_pm_ops,

-- 
Regards,

Laurent Pinchart
