Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF31796D9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 18:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964316EB4C;
	Wed,  4 Mar 2020 17:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212F06EB4D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 17:36:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 09:36:29 -0800
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; d="scan'208";a="234109202"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 09:36:28 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id CE78C209DF; Wed,  4 Mar 2020 19:36:25 +0200 (EET)
Date: Wed, 4 Mar 2020 19:36:25 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] drm/fourcc: Add bayer formats and modifiers
Message-ID: <20200304173625.GM5379@paasikivi.fi.intel.com>
References: <20200228163135.524882-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228163135.524882-1-niklas.soderlund@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: libcamera-devel@lists.libcamera.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niklas,

Thank you for the patch.

On Fri, Feb 28, 2020 at 05:31:35PM +0100, Niklas S=F6derlund wrote:
> Bayer formats are used with cameras and contain green, red and blue
> components, with alternating lines of red and green, and blue and green
> pixels in different orders. For each block of 2x2 pixels there is one
> pixel with a red filter, two with a green filter, and one with a blue
> filter. The filters can be arranged in different patterns.
> =

> Add DRM fourcc formats to describe the most common Bayer formats. Also
> add a modifiers to describe the custom packing layouts used by the Intel
> IPU3 and in the MIPI (Mobile Industry Processor Interface) CSI-2
> specification.
> =

> Signed-off-by: Niklas S=F6derlund <niklas.soderlund@ragnatech.se>
> ---
>  include/uapi/drm/drm_fourcc.h | 95 +++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> =

> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d80737..561d5a08ffd16b69 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -286,6 +286,62 @@ extern "C" {
>  #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsamp=
led Cr (1) and Cb (2) planes */
>  =

>  =

> +/*
> + * Bayer formats
> + *
> + * Bayer formats contain green, red and blue components, with alternatin=
g lines
> + * of red and green, and blue and green pixels in different orders. For =
each
> + * block of 2x2 pixels there is one pixel with a red filter, two with a =
green
> + * filter, and one with a blue filter. The filters can be arranged in di=
fferent
> + * patterns.
> + *
> + * For example, RGGB:
> + *	row0: RGRGRGRG...
> + *	row1: GBGBGBGB...
> + *	row3: RGRGRGRG...
> + *	row4: GBGBGBGB...
> + *	...
> + *
> + * Vendors have different methods to pack the sampling formats to increa=
se data
> + * density. For this reason the fourcc only describes pixel sample size =
and the

This could be for other reasons than data density, such as for less
cumbersome memory access. I'd leave out "to increase data density".

> + * filter pattern for each block of 2x2 pixels. A modifier is needed to
> + * describe the memory layout.
> + *
> + * In addition to vendor modifiers for memory layout DRM_FORMAT_MOD_LINE=
AR may
> + * be used to describe a layout where all samples are placed consecutive=
ly in
> + * memory. If the sample does not fit inside a single byte, the sample s=
torage
> + * is extended to the minimum number of (little endian) bytes that can h=
old the
> + * sample and any unused most-significant bits are defined as padding.

Should it be added here that padding bits are all zero?

> + *
> + * For example, SRGGB10:
> + * Each 10-bit sample is contained in 2 consecutive little endian bytes,=
 where
> + * the 6 most-significant bits are unused.
> + */
> +
> +/* 8-bit Bayer formats */
> +#define DRM_FORMAT_SRGGB8	fourcc_code('R', 'G', 'G', 'B')
> +#define DRM_FORMAT_SGRBG8	fourcc_code('G', 'R', 'B', 'G')
> +#define DRM_FORMAT_SGBRG8	fourcc_code('G', 'B', 'R', 'G')
> +#define DRM_FORMAT_SBGGR8	fourcc_code('B', 'A', '8', '1')
> +
> +/* 10-bit Bayer formats */
> +#define DRM_FORMAT_SRGGB10	fourcc_code('R', 'G', '1', '0')
> +#define DRM_FORMAT_SGRBG10	fourcc_code('B', 'A', '1', '0')
> +#define DRM_FORMAT_SGBRG10	fourcc_code('G', 'B', '1', '0')
> +#define DRM_FORMAT_SBGGR10	fourcc_code('B', 'G', '1', '0')
> +
> +/* 12-bit Bayer formats */
> +#define DRM_FORMAT_SRGGB12	fourcc_code('R', 'G', '1', '2')
> +#define DRM_FORMAT_SGRBG12	fourcc_code('B', 'A', '1', '2')
> +#define DRM_FORMAT_SGBRG12	fourcc_code('G', 'B', '1', '2')
> +#define DRM_FORMAT_SBGGR12	fourcc_code('B', 'G', '1', '2')
> +
> +/* 14-bit Bayer formats */
> +#define DRM_FORMAT_SRGGB14	fourcc_code('R', 'G', '1', '4')
> +#define DRM_FORMAT_SGRBG14	fourcc_code('B', 'A', '1', '4')
> +#define DRM_FORMAT_SGBRG14	fourcc_code('G', 'B', '1', '4')
> +#define DRM_FORMAT_SBGGR14	fourcc_code('B', 'G', '1', '4')

The 4cc codes seemingly appear to those used in V4L2. Is that intentional?
Nothing wrong in that though, but is this a rule that's universally
followed?

> +
>  /*
>   * Format Modifiers:
>   *
> @@ -309,6 +365,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> +#define DRM_FORMAT_MOD_VENDOR_MIPI 0x0a
>  =

>  /* add more to the end as needed */
>  =

> @@ -434,6 +491,17 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
>  =

> +
> +/*
> + * IPU3 Bayer packing layout
> + *
> + * The IPU3 raw Bayer formats use a custom packing layout where there ar=
e no
> + * gaps between each 10-bit sample. It packs 25 pixels into 32 bytes lea=
ving
> + * the 6 most significant bits in the last byte unused. The format is li=
ttle
> + * endian.

Where is endianness really specified? DRM_FORMAT_BIG_ENDIAN would seem
independent of that.

I might omit endianness definition here.

> + */
> +#define IPU3_FORMAT_MOD_PACKED fourcc_mod_code(INTEL, 8)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> @@ -804,6 +872,33 @@ extern "C" {
>   */
>  #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
>  =

> +/* Mobile Industry Processor Interface (MIPI) modifiers */
> +
> +/*
> + * MIPI CSI-2 packing layout
> + *
> + * The CSI-2 RAW formats (for example Bayer) use a different packing lay=
out
> + * depenindg on the sample size.

"depending"

> + *
> + * - 10-bits per sample
> + *   Every four consecutive samples are packed into 5 bytes. Each of the=
 first 4
> + *   bytes contain the 8 high order bits of the pixels, and the 5th byte
> + *   contains the 2 least-significant bits of each pixel, in the same or=
der.
> + *
> + * - 12-bits per sample
> + *   Every two consecutive samples are packed into three bytes. Each of =
the
> + *   first two bytes contain the 8 high order bits of the pixels, and th=
e third
> + *   byte contains the four least-significant bits of each pixel, in the=
 same
> + *   order.
> + *
> + * - 14-bits per sample
> + *   Every four consecutive samples are packed into seven bytes. Each of=
 the
> + *   first four bytes contain the eight high order bits of the pixels, a=
nd the
> + *   three following bytes contains the six least-significant bits of ea=
ch
> + *   pixel, in the same order.
> + */
> +#define MIPI_FORMAT_MOD_CSI2_PACKED fourcc_mod_code(MIPI, 1)
> +
>  #if defined(__cplusplus)
>  }
>  #endif

-- =

Kind regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
