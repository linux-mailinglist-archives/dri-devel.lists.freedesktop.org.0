Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F291173BD73
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B5A10E686;
	Fri, 23 Jun 2023 17:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AA710E686
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 17:09:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92E28838;
 Fri, 23 Jun 2023 19:08:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687540125;
 bh=ho8g4d4+QSTop1taPB2ZsJswaSCq6PsVAP4v4ww2Dfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wz3uRXxrWjYUI9rpIY329Qo4BnsseqSPx+VyFaJEhK1+ionAWmL2pwWDFhpYEYtjH
 aGX2kxWrD1IKhPYSNvgeSEQvNQ2617v1Fl5f+C4xkAw1jXkK2b22Kb7b9yZzcInG8d
 hwis3GgME3SXmH9XuBTnQYyq2Up3el2mBMXVE3H8=
Date: Fri, 23 Jun 2023 20:09:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 31/39] drm: renesas: shmobile: Turn vblank on/off when
 enabling/disabling CRTC
Message-ID: <20230623170921.GI2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <c299dd21b17c43b56d4bc8bc0b2cad8d3edda397.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c299dd21b17c43b56d4bc8bc0b2cad8d3edda397.1687423204.git.geert+renesas@glider.be>
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

On Thu, Jun 22, 2023 at 11:21:43AM +0200, Geert Uytterhoeven wrote:
> The DRM core vblank handling mechanism requires drivers to forcefully
> turn vblank reporting off when disabling the CRTC, and to restore the
> vblank reporting status when enabling the CRTC.
> Implement this using the drm_crtc_vblank_{on,off}() helpers.
> 
> Note that drm_crtc_vblank_off() must be called at startup to synchronize
> the state of the vblank core code with the hardware, which is initially
> disabled.  This is performed at CRTC creation time, requiring vertical
> blank initialization to be moved before creating CRTCs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 10 +++++++++-
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 12 ++++++------
>  2 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index d2a0ac5f9368c11c..b184019d8b1ed89c 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -267,6 +267,9 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>  
>  	shmob_drm_crtc_start_stop(scrtc, true);
>  
> +	/* Turn vertical blank interrupt reporting back on. */
> +	drm_crtc_vblank_on(crtc);
> +
>  	scrtc->started = true;
>  }
>  
> @@ -332,10 +335,12 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
>  		return;
>  
>  	/*
> -	 * Wait for page flip completion before stopping the CRTC as userspace
> +	 * Disable vertical blank interrupt reporting.  We first need to wait
> +	 * for page flip completion before stopping the CRTC as userspace
>  	 * expects page flips to eventually complete.
>  	 */
>  	shmob_drm_crtc_wait_page_flip(scrtc);
> +	drm_crtc_vblank_off(crtc);
>  
>  	/* Stop the LCDC. */
>  	shmob_drm_crtc_start_stop(scrtc, false);
> @@ -571,6 +576,9 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
>  
>  	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
>  
> +	/* Start with vertical blank interrupt reporting disabled. */
> +	drm_crtc_vblank_off(crtc);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index 6eaf2c5a104f451a..a29c0c1093725b6e 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -189,17 +189,17 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = shmob_drm_modeset_init(sdev);
> -	if (ret < 0)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "failed to initialize mode setting\n");
> -
>  	ret = drm_vblank_init(ddev, 1);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed to initialize vblank\n");
> -		goto err_modeset_cleanup;
> +		return ret;
>  	}
>  
> +	ret = shmob_drm_modeset_init(sdev);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to initialize mode setting\n");
> +
>  	ret = platform_get_irq(pdev, 0);
>  	if (ret < 0)
>  		goto err_modeset_cleanup;

-- 
Regards,

Laurent Pinchart
