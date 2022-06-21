Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E48552AEC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 08:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBBC10FA51;
	Tue, 21 Jun 2022 06:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2F710FA51
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 06:20:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59295104;
 Tue, 21 Jun 2022 08:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655792437;
 bh=QxqGI8u7Mcjy3hAKsyC9Lq9xMXJUcfr/8cXBFAGKrXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Um0skpAxHmGTSW5KKa9z6qFSD447639lNm8xsuDGUtCDvnxWVWxm4oydnlFJ9PVwb
 0tOOgMIePz4s/oh+Lo48RnSPA9Qz2j/6XjVucwtIBS/vnloeur3715E9IPgyvg72fP
 P0BZRSU9B5A4FAHOP5VlpBrO2tj5O7FBOl7Ks6co=
Date: Tue, 21 Jun 2022 09:20:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH v2] drm: shmobile: Use backlight helper
Message-ID: <YrFjJa6aLSK5P3lY@pendragon.ideasonboard.com>
References: <20220616170821.1348169-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220616170821.1348169-1-steve@sk2.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Thank you for the patch.

On Thu, Jun 16, 2022 at 07:08:21PM +0200, Stephen Kitt wrote:
> This started with work on the removal of backlight_properties'
> deprecated fb_blank field, much of which can be taken care of by using
> helper functions provided by backlight.h instead of directly accessing
> fields in backlight_properties. This patch series doesn't involve
> fb_blank, but it still seems useful to use helper functions where
> appropriate.
> 
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes since v1: clarified commit message, this doesn't touch fb_blank
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_backlight.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
> index f6628a5ee95f..794573badfe8 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
> @@ -18,11 +18,7 @@ static int shmob_drm_backlight_update(struct backlight_device *bdev)
>  	struct shmob_drm_connector *scon = bl_get_data(bdev);
>  	struct shmob_drm_device *sdev = scon->connector.dev->dev_private;
>  	const struct shmob_drm_backlight_data *bdata = &sdev->pdata->backlight;
> -	int brightness = bdev->props.brightness;
> -
> -	if (bdev->props.power != FB_BLANK_UNBLANK ||
> -	    bdev->props.state & BL_CORE_SUSPENDED)
> -		brightness = 0;
> +	int brightness = backlight_get_brightness(bdev);
>  
>  	return bdata->set_brightness(brightness);
>  }
> 
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56

-- 
Regards,

Laurent Pinchart
