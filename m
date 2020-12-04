Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B0F2CEAB5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 10:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948A16E135;
	Fri,  4 Dec 2020 09:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44756E135
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 09:19:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59F9599A;
 Fri,  4 Dec 2020 10:19:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607073584;
 bh=WT8rjDRvI24mB14z16W9GZCi/3Wu8EJ+JvtfGRKYotY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ghPn6kbiuHqbfdsMPIkTVCWZCIn3/BtxYeKYYFhx21BmOKSUMeZjAz+70GCo9RwBI
 zzPfFd6tK0VnvpybanHuYxU4W65HZGS3a524kF1LDjzXo1AU0MbfwJGEdcxTcpCBx0
 0WnUe4Ih/0jKEUE/P01Kgu6lpNXtlF0ofID90YeM=
Date: Fri, 4 Dec 2020 11:19:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 2/7] drm/simple_kms_helper: add
 drmm_simple_encoder_alloc()
Message-ID: <20201204091943.GE4109@pendragon.ideasonboard.com>
References: <20200911135724.25833-1-p.zabel@pengutronix.de>
 <20200911135724.25833-2-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911135724.25833-2-p.zabel@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

Thank you for the patch.

On Fri, Sep 11, 2020 at 03:57:19PM +0200, Philipp Zabel wrote:
> Add an alternative to drm_simple_encoder_init() that allocates and
> initializes a simple encoder and registers drm_encoder_cleanup() with
> drmm_add_action_or_reset().
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c | 12 ++++++++++++
>  include/drm/drm_simple_kms_helper.h     | 24 ++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> index 74946690aba4..3cbbfb0f9b51 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -71,6 +72,17 @@ int drm_simple_encoder_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_simple_encoder_init);
>  
> +static const struct drm_encoder_funcs drmm_simple_encoder_funcs_empty = { };
> +
> +void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
> +				  size_t offset, int encoder_type)
> +{
> +	return __drmm_encoder_alloc(dev, size, offset,
> +				    &drmm_simple_encoder_funcs_empty,
> +				    encoder_type, NULL);
> +}
> +EXPORT_SYMBOL(__drmm_simple_encoder_alloc);

Do we need this ? Wouldn't it be better support a NULL drm_encoder_funcs
in the core (if we don't already) and use drmm_encoder_alloc() directly
in drivers ?

> +
>  static enum drm_mode_status
>  drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
>  			       const struct drm_display_mode *mode)
> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
> index a026375464ff..e6dbf3161c2f 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -185,4 +185,28 @@ int drm_simple_encoder_init(struct drm_device *dev,
>  			    struct drm_encoder *encoder,
>  			    int encoder_type);
>  
> +void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
> +				  size_t offset, int encoder_type);
> +
> +/**
> + * drmm_simple_encoder_alloc - Allocate and initialize an encoder with basic
> + *                             functionality.
> + * @dev: drm device
> + * @type: the type of the struct which contains struct &drm_encoder
> + * @member: the name of the &drm_encoder within @type.
> + * @encoder_type: user visible type of the encoder
> + *
> + * Allocates and initializes an encoder that has no further functionality.
> + * Settings for possible CRTC and clones are left to their initial values.
> + * Cleanup is automatically handled through registering drm_encoder_cleanup()
> + * with drmm_add_action().
> + *
> + * Returns:
> + * Pointer to new encoder, or ERR_PTR on failure.
> + */
> +#define drmm_simple_encoder_alloc(dev, type, member, encoder_type) \
> +	((type *)__drmm_simple_encoder_alloc(dev, sizeof(type), \
> +					     offsetof(type, member), \
> +					     encoder_type))
> +
>  #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
