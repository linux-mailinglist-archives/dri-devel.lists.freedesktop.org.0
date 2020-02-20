Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C47B165A02
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 10:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFE86ED06;
	Thu, 20 Feb 2020 09:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0556ED06
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 09:19:59 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ECE25283BDB;
 Thu, 20 Feb 2020 09:19:57 +0000 (GMT)
Date: Thu, 20 Feb 2020 10:19:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 01/34] drm/core: Add afbc helper functions
Message-ID: <20200220101954.23594793@collabora.com>
In-Reply-To: <20191217145020.14645-2-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <20191217145020.14645-2-andrzej.p@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 James Wang <james.qian.wang@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Dec 2019 15:49:47 +0100
Andrzej Pietrasiewicz <andrzej.p@collabora.com> wrote:

> Add checking if a modifier is afbc and getting afbc block size.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c | 53 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_fourcc.h     |  4 +++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index b234bfaeda06..d14dd7c86020 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -29,6 +29,7 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_print.h>
>  
>  static char printable_char(int c)
>  {
> @@ -393,3 +394,55 @@ uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
>  			    drm_format_info_block_height(info, plane));
>  }
>  EXPORT_SYMBOL(drm_format_info_min_pitch);
> +
> +/**
> + * drm_is_afbc - test if the modifier describes an afbc buffer
> + * @modifier - modifier to be tested
> + *
> + * Returns: true if the modifier describes an afbc buffer
> + */
> +bool drm_is_afbc(u64 modifier)
> +{
> +	/* is it ARM AFBC? */
> +	if ((modifier & DRM_FORMAT_MOD_ARM_AFBC(0)) == 0)

Hm, it's not doing what you describe. The test should be something like

#define VENDOR_AND_TYPE_MASK GENMASK_ULL(63, 52)

	if ((mod & VENDOR_AND_TYPE_MASK) == DRM_FORMAT_MOD_ARM_AFBC(0))

> +		return false;
> +
> +	/* Block size must be known */
> +	if ((modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) == 0)
> +		return false;
> +
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(drm_is_afbc);
> +
> +/**
> + * drm_afbc_get_superblock_wh - extract afbc block width/height from modifier
> + * @modifier: the modifier to be looked at
> + * @w: address of a place to store the block width
> + * @h: address of a place to store the block height
> + *
> + * Returns: true if the modifier describes a supported block size
> + */
> +bool drm_afbc_get_superblock_wh(u64 modifier, u32 *w, u32 *h)
> +{
> +	switch (modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) {
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_16x16:
> +		*w = 16;
> +		*h = 16;
> +		break;
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8:
> +		*w = 32;
> +		*h = 8;
> +		break;
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_64x4:
> +		/* fall through */
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8_64x4:
> +		/* fall through */

Any reason for not supporting those block sizes? It probably deserves a
comment, and a mention in the commit message.

> +	default:
> +		DRM_DEBUG_KMS("Invalid AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
> +			      modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
> +		return false;
> +	}
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(drm_afbc_get_superblock_wh);
> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> index 306d1efeb5e0..7eb23062bf45 100644
> --- a/include/drm/drm_fourcc.h
> +++ b/include/drm/drm_fourcc.h
> @@ -320,4 +320,8 @@ uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
>  				   int plane, unsigned int buffer_width);
>  const char *drm_get_format_name(uint32_t format, struct drm_format_name_buf *buf);
>  
> +bool drm_is_afbc(u64 modifier);
> +
> +bool drm_afbc_get_superblock_wh(u64 modifier, u32 *w, u32 *h);
> +
>  #endif /* __DRM_FOURCC_H__ */

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
