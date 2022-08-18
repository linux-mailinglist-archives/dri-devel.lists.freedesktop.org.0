Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF94599114
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4595B10E4B6;
	Thu, 18 Aug 2022 23:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D11E10E4B6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 23:16:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F17438B;
 Fri, 19 Aug 2022 01:16:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1660864597;
 bh=Az3BnJ+PPPqBPWaDNtlR2DNr4/sewjOqORMeUQxRMyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jmv4cDPN5u3bSOSa/sIjxxhbLNCjHsdjC1bTsM5bpNyA3E9xXJYwb2/Js1d7M7lbw
 9ZxGFKGcVh0xz2UifJwnj/vulBw3oA4ngUMuakd73ipXB75jdmdR9Hm1/XGQBd5YMd
 MBb/C5dH2LnP9kdGupSF00E+uNc5Jfp2KaIglap4=
Date: Fri, 19 Aug 2022 02:16:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hsia-Jun Li <randy.li@synaptics.com>
Subject: Re: [PATCH 1/2] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Message-ID: <Yv7IUrhTYWevMk60@pendragon.ideasonboard.com>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-2-randy.li@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220808162750.828001-2-randy.li@synaptics.com>
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
Cc: linux-arm-kernel@lists.infradead.org, tfiga@chromium.org,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, jszhang@kernel.org, ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsia-Jun,

Thank you for the patch.

On Tue, Aug 09, 2022 at 12:27:49AM +0800, Hsia-Jun Li wrote:
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
> The reason why we need to allocate the same size of memory for
> the compressed frame:
> 1. The compression ratio is not fixed and differnt platforms could
> use a different compression protocol. These protocols are complete
> vendor proprietaries, the other device won't be able to use them.
> It is not necessary to define the version of them here.
> 
> 2. Video codec could discard the compression attribute when the
> intra block copy applied to this frame. It would waste lots of
> time on re-allocation.
> 
> I am wondering if it is better to add an addtional plane property to
> describe whether the current framebuffer is compressed?
> While the compression flag is still a part of format modifier,
> because it would have two extra meta data planes in the compression
> version.

Would it possible to show an example of how these modifiers apply to a
particular format (such as NV12 for instance) ? Otherwise I'm having
trouble understanding how they actually work.

> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 49 +++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 0206f812c569..b67884e8bc69 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -381,6 +381,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
>  
>  /* add more to the end as needed */
>  
> @@ -1452,6 +1453,54 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_CLEAR(field) \
>  	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>  
> +/*
> + * Synaptics VideoSmart modifiers
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
> + * 35:20 -     Reserved for future use.  Must be zero.
> + *
> + * 36:36 c     Compression flag.
> + *
> + * 55:37 -     Reserved for future use.  Must be zero.
> + *
> + */
> +
> +#define DRM_FORMAT_MOD_SYNA_V4_TILED		fourcc_mod_code(SYNAPTICS, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, c) \
> +	fourcc_mod_code(SYNAPTICS, (((f) & 0xff) | \
> +				 (((m) & 0xff) << 8) | \
> +				 (((p) & 0xf) << 16) | \
> +				 (((c) & 0x1) << 36)))
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H1_COMPRESSED \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_COMPRESSED \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1)
> +
>  #if defined(__cplusplus)
>  }
>  #endif

-- 
Regards,

Laurent Pinchart
