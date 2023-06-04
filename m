Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A727A72163E
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 12:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6147810E139;
	Sun,  4 Jun 2023 10:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00D010E139
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 10:57:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126166129043.28.openmobile.ne.jp
 [126.166.129.43])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD6402B6;
 Sun,  4 Jun 2023 12:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685876220;
 bh=WwVZnCR0eb6/3cTnWx9M1Vng1/WjZsWcG+uaiJuEb+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eX6eZi3hrDbHYTaSoqPFdUc5731t2sbTm2554gJQRW8KbTvhpTf5gqZVus61SJnod
 ER4VIa8xwM2k8xyEfvkZWa5Mc58PZCf3kqjZa04mFGh9wTiJ2+l5pt8dyvNaKN0RTK
 GG2IEd+SA3R/R7A3rWDFEOI8hIYIWzmbL1WIY4Dg=
Date: Sun, 4 Jun 2023 13:57:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm: rcar-du: Use dev_err_probe() to record cause of
 KMS init errors
Message-ID: <20230604105724.GC2483@pendragon.ideasonboard.com>
References: <20230604104958.7034-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230604104958.7034-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This should have read v3.

On Sun, Jun 04, 2023 at 01:49:58PM +0300, Laurent Pinchart wrote:
> The (large) rcar_du_modeset_init() function can fail for many reasons,
> two of two involving probe deferral. Use dev_err_probe() in those code
> paths to record the cause of the probe deferral, in order to help
> debugging probe issues.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Change since v1:
> 
> - Fix compilation
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 4 ++++
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 8 ++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> index 12a8839fe3be..5b752adb1b02 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -701,6 +701,10 @@ static int rcar_du_probe(struct platform_device *pdev)
>  	/* DRM/KMS objects */
>  	ret = rcar_du_modeset_init(rcdu);
>  	if (ret < 0) {
> +		/*
> +		 * Don't use dev_err_probe(), as it would overwrite the probe
> +		 * deferral reason recorded in rcar_du_modeset_init().
> +		 */
>  		if (ret != -EPROBE_DEFER)
>  			dev_err(&pdev->dev,
>  				"failed to initialize DRM/KMS (%d)\n", ret);
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index adfb36b0e815..78b665984e35 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -932,8 +932,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  
>  	/* Initialize the Color Management Modules. */
>  	ret = rcar_du_cmm_init(rcdu);
> -	if (ret)
> +	if (ret) {
> +		dev_err_probe(rcdu->dev, ret, "failed to initialize CMM\n");
>  		return ret;
> +	}
>  
>  	/* Create the CRTCs. */
>  	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
> @@ -952,8 +954,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  
>  	/* Initialize the encoders. */
>  	ret = rcar_du_encoders_init(rcdu);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		dev_err_probe(rcdu->dev, ret, "failed to initialize encoders\n");
>  		return ret;
> +	}
>  
>  	if (ret == 0) {
>  		dev_err(rcdu->dev, "error: no encoder could be initialized\n");

-- 
Regards,

Laurent Pinchart
