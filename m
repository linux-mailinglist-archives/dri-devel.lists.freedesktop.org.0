Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0678053F4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 13:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731D510E506;
	Tue,  5 Dec 2023 12:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1D310E506
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 12:16:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B4CE844;
 Tue,  5 Dec 2023 13:15:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1701778530;
 bh=9+pxjTIVs1ocDWGALrnbd3Impz+cj2wtP65yWfxCLY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rA7BH31fcloVqm/JVQnKmRx+Y2HxinUqhrCkFbbo7lNHoGtD//0JEM6DoMGuciCWu
 13wBTskukb/Ec13bTL1quSu9HYAKP6Z36Yqea6wZTd5hl8VRnJboGf7yco4dq/gjuk
 eRhWIS5KNUWx7qQPboC5ljt8W8F78V9fWS0/aWMA=
Date: Tue, 5 Dec 2023 14:16:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] drm: renesas: shmobile: Call
 drm_helper_force_disable_all() at shutdown time
Message-ID: <20231205121617.GF17394@pendragon.ideasonboard.com>
References: <0a13f43d1e519b88e0762cce178d7852b7dba2b1.1701775726.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a13f43d1e519b88e0762cce178d7852b7dba2b1.1701775726.git.geert+renesas@glider.be>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert and Doug,

Thank you for the patch.

On Tue, Dec 05, 2023 at 12:30:02PM +0100, Geert Uytterhoeven wrote:
> From: Douglas Anderson <dianders@chromium.org>
> 
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> This is important because drm_helper_force_disable_all() will cause
> panels to get disabled cleanly which may be important for their power
> sequencing.  Future changes will remove any custom powering off in
> individual panel drivers so the DRM drivers need to start getting this
> right.
> 
> The fact that we should call drm_atomic_helper_shutdown() in the case of
> OS shutdown comes straight out of the kernel doc "driver instance
> overview" in drm_drv.c.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid
> [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Tested on Atmark Techno Armadillo-800-EVA, where the PWM instance
> driving the backlight is now stopped on shutdown.
> Panel-simple does print two new warnings:
> 
>     +panel-simple panel: Skipping disable of already disabled panel
>     +panel-simple panel: Skipping unprepare of already unprepared panel

Have you investigated where this comes from ?

>      reboot: System halted
> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index bd16d4780c6436c3..a15162be26f259a4 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -171,6 +171,13 @@ static void shmob_drm_remove(struct platform_device *pdev)
>  	drm_kms_helper_poll_fini(ddev);
>  }
>  
> +static void shmob_drm_shutdown(struct platform_device *pdev)
> +{
> +	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
> +
> +	drm_atomic_helper_shutdown(&sdev->ddev);
> +}
> +
>  static int shmob_drm_probe(struct platform_device *pdev)
>  {
>  	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
> @@ -274,6 +281,7 @@ static const struct of_device_id shmob_drm_of_table[] __maybe_unused = {
>  static struct platform_driver shmob_drm_platform_driver = {
>  	.probe		= shmob_drm_probe,
>  	.remove_new	= shmob_drm_remove,
> +	.shutdown	= shmob_drm_shutdown,
>  	.driver		= {
>  		.name	= "shmob-drm",
>  		.of_match_table = of_match_ptr(shmob_drm_of_table),

-- 
Regards,

Laurent Pinchart
