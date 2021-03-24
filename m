Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2090346F7C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 03:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5FB6E241;
	Wed, 24 Mar 2021 02:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1B46E241
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 02:25:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92A7F580;
 Wed, 24 Mar 2021 03:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616552732;
 bh=yQk2Et593ck5JEiyof4AfzdzEASSQa7eRxQPm/iZHL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G2hljkGBJ/mQhub4L5wvIJdf4861qlayDfVzGuRCTTzaNOlR9aKpRt1plscTOnnba
 q1C/7dP/0GIWrdAEe7BB+4TcFQIsg+X2oiHmU40HfBZdOf7dCk8CmGMOd2UuFMGew4
 WjRgoZ2RlK+oWWWmGx0yX/CaePyL/BOYxTBQ+OZg=
Date: Wed, 24 Mar 2021 04:24:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/4] drm/simple_kms_helper: Add macro
 drmm_plain_simple_encoder_alloc()
Message-ID: <YFqi8v49Gckca7CO@pendragon.ideasonboard.com>
References: <20210124085552.29146-1-paul@crapouillou.net>
 <20210124085552.29146-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210124085552.29146-3-paul@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

Thank you for the patch.

On Sun, Jan 24, 2021 at 08:55:50AM +0000, Paul Cercueil wrote:
> This performs the same operation as drmm_simple_encoder_alloc(), but
> only allocates and returns a struct drm_encoder instance.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  include/drm/drm_simple_kms_helper.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
> index e6dbf3161c2f..f07e70303cfb 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -209,4 +209,21 @@ void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
>  					     offsetof(type, member), \
>  					     encoder_type))
>  
> +/**
> + * drmm_plain_simple_encoder_alloc - Allocate and initialize a drm_encoder
> + *                                   struct with basic functionality.
> + * @dev: drm device
> + * @encoder_type: user visible type of the encoder
> + *
> + * This performs the same operation as drmm_simple_encoder_alloc(), but
> + * only allocates and returns a struct drm_encoder instance.
> + *
> + * Returns:
> + * Pointer to the new drm_encoder struct, or ERR_PTR on failure.
> + */
> +#define drmm_plain_simple_encoder_alloc(dev, encoder_type) \
> +	((struct drm_encoder *) \
> +	 __drmm_simple_encoder_alloc(dev, sizeof(struct drm_encoder), \
> +				     0, encoder_type))
> +

As this isn't related to the simple encoder helper anymore, how about
using __drmm_encoder_alloc instead ?

#define drmm_plain_simple_encoder_alloc(dev, encoder_type) \
	((struct drm_encoder *) \
	__drmm_encoder_alloc(dev, sizeof(struct drm_encoder), 0, NULL, \
			     encoder_type, NULL))

I'd also rename the macro to drmm_plain_encoder_alloc(), and move it to
drm_encoder.h. That way drivers that don't need the simple KMS helper
won't have to select it just for this.

>  #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
