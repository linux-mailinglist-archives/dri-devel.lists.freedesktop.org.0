Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFFF6362DC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7771610E573;
	Wed, 23 Nov 2022 15:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7812410E56E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:08:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1DD7DB8201C;
 Wed, 23 Nov 2022 15:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56599C433D6;
 Wed, 23 Nov 2022 15:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669216084;
 bh=WLXFnRRwAGSB6144++E7djuO+TN+sZS/XitCX2fAGgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TG/g2GBNIgALQ5wN0e7SltfaGtNUnCLJ4tyf5qe6uQ5+MbiK+cD1wi657xD/BIUEB
 CG+UXgA9PMKXtbZp1C2/A/mO5p3IAw8lYD3+jt+t283E7aalR0c3smvT62zCNrAtnX
 1ivquwrWVIhD54Y1FcbDNoo/E0bVzCk9kMS2Ov7Haz3ukZkKg05zLfGETYiLRbFXww
 NtmKrARu8OD+0ZRSAQUuri8TQn7V77A49zWffoSq6LVnp+DaR/E0V8R9JRXyoGNt92
 3DbPYMJG/1akWttP5fwCshqoMLtUm+QMHEZWaaAAkB3tKwp1uA/39TsJWpLJjNXiQl
 eHjl8jTYlAyCQ==
Date: Wed, 23 Nov 2022 22:58:11 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Hsia-Jun Li <randy.li@synaptics.com>
Subject: Re: [PATCH v4] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Message-ID: <Y341AxDwqRC/0eep@xhacker>
References: <20221123091957.75967-1-randy.li@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221123091957.75967-1-randy.li@synaptics.com>
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
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, airlied@linux.ie,
 tzimmermann@suse.de, ayaka@soulik.info, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 helen.koike@collabora.com, laurent.pinchart@ideasonboard.com,
 ribalda@chromium.org, sebastian.hesselbarth@gmail.com, tfiga@chromium.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 05:19:57PM +0800, Hsia-Jun Li wrote:
> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> 
> Memory Traffic Reduction(MTR) is a module in Synaptics
> VideoSmart platform could process lossless compression image
> and cache the tile memory line.
> 
> Those modifiers only record the parameters would effort pixel
> layout or memory layout. Whether physical memory page mapping
> is used is not a part of format.
> 
> We would allocate the same size of memory for uncompressed
> and compressed luma and chroma data, while the compressed buffer
> would request two extra planes holding the metadata for
> the decompression.
> 
> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 75 +++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index bc056f2d537d..ca0b4ca70b36 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -407,6 +407,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b

Any users in the mainline tree?

>  
>  /* add more to the end as needed */
>  
> @@ -1507,6 +1508,80 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_CLEAR(field) \
>  	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>  
> +/*
> + * Synaptics VideoSmart modifiers
> + *
> + * Tiles could be arranged in Groups of Tiles (GOTs), it is a small tile
> + * within a tile. GOT size and layout varies based on platform and
> + * performance concern. When the compression is applied, it is possible
> + * that we would have two tile type in the GOT, these parameters can't
> + * tell the secondary tile type.
> + *
> + * Besides, an 8 size 4 bytes arrary (32 bytes) would be need to store
> + * some compression parameters for a compression meta data plane.
> + *
> + *       Macro
> + * Bits  Param Description
> + * ----  ----- -----------------------------------------------------------------
> + *
> + *  7:0  f     Scan direction description.
> + *
> + *               0 = Invalid
> + *               1 = V4, the scan would always start from vertical for 4 pixel
> + *                   then move back to the start pixel of the next horizontal
> + *                   direction.
> + *               2 = Reserved for future use.
> + *
> + * 15:8  m     The times of pattern repeat in the right angle direction from
> + *             the first scan direction.
> + *
> + * 19:16 p     The padding bits after the whole scan, could be zero.
> + *
> + * 20:20 g     GOT packing flag.
> + *
> + * 23:21 -     Reserved for future use.  Must be zero.
> + *
> + * 27:24 h     log2(horizontal) of bytes, in GOTs.
> + *
> + * 31:28 v     log2(vertical) of bytes, in GOTs.
> + *
> + * 35:32 -     Reserved for future use.  Must be zero.
> + *
> + * 36:36 c     Compression flag.
> + *
> + * 55:37 -     Reserved for future use.  Must be zero.
> + *
> + */
> +
> +#define DRM_FORMAT_MOD_SYNA_V4_TILED		fourcc_mod_code(SYNAPTICS, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, g, h, v, c) \
> +	fourcc_mod_code(SYNAPTICS, ((__u64)((f) & 0xff) | \
> +				 ((__u64)((m) & 0xff) << 8) | \
> +				 ((__u64)((p) & 0xf) << 16) | \
> +				 ((__u64)((g) & 0x1) << 20) | \
> +				 ((__u64)((h) & 0xf) << 24) | \
> +				 ((__u64)((v) & 0xf) << 28) | \
> +				 ((__u64)((c) & 0x1) << 36)))
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0, 0, 0, 0)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 7, 7, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.17.1
> 
