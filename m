Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA2A73BBDE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3130B10E65C;
	Fri, 23 Jun 2023 15:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BBB10E65C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:41:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A8EF838;
 Fri, 23 Jun 2023 17:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687534837;
 bh=ArqSpTQIPLlQGIEbrbSLaivyf0ENs3vlfTMm4U/5SAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wPzsCj056QJcxMA2HRsKQPOmZF6EdhSqvtkgvaVOL7ZfFp7bzuzwZ5MKa0lCU1jft
 AXPw1OlUdeV6dOWa6nUXpNxVrtRul9BxYzLC1/jDdi9Xl/f+W1+2Fespvd0Q8WwvnD
 6dWN0vv27FDdYa8xb/VziVjWS5YWO/OoT/wCHW6A=
Date: Fri, 23 Jun 2023 18:41:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 15/39] drm: renesas: shmobile: Improve error handling
Message-ID: <20230623154112.GS2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <100c650ab37ae09a142a93afa3734400a6a96757.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <100c650ab37ae09a142a93afa3734400a6a96757.1687423204.git.geert+renesas@glider.be>
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

On Thu, Jun 22, 2023 at 11:21:27AM +0200, Geert Uytterhoeven wrote:
> Prepare for DT conversion, where panel probe can be deferred, by
> streamlining error propagation and handling:
>   - Use dev_err_probe() to avoid printing error messages in case of
>     probe deferral,
>   - Propagate errors where needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c |  3 ++-
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c | 14 +++++++++++---
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index 9aa9800899976a23..50fca18282c5cb5e 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -228,7 +228,8 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  
>  	ret = shmob_drm_modeset_init(sdev);
>  	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to initialize mode setting\n");
> +		dev_err_probe(&pdev->dev, ret,
> +			      "failed to initialize mode setting\n");
>  		goto err_free_drm_dev;
>  	}
>  
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
> index 3051318ddc7999bc..1a62e7f8a8a9e6df 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
> @@ -157,9 +157,17 @@ int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
>  	if (ret)
>  		return ret;
>  
> -	shmob_drm_crtc_create(sdev);
> -	shmob_drm_encoder_create(sdev);
> -	shmob_drm_connector_create(sdev, &sdev->encoder);
> +	ret = shmob_drm_crtc_create(sdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = shmob_drm_encoder_create(sdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = shmob_drm_connector_create(sdev, &sdev->encoder);
> +	if (ret < 0)
> +		return ret;
>  
>  	drm_kms_helper_poll_init(sdev->ddev);
>  

-- 
Regards,

Laurent Pinchart
