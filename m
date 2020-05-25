Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D89E21E0BD9
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 12:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B446489F9F;
	Mon, 25 May 2020 10:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E69189F9F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 10:31:47 +0000 (UTC)
IronPort-SDR: WQ4uM0F5EBGLMtbahWuwYIMdolwEPhY33kJWx8zcPxDWe06nJeECPJDYnwMJlxIh8f07ySYWeN
 QrJvOeiDkE/A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 03:31:47 -0700
IronPort-SDR: fpRcIT3ZgbJqWnNHi/xrLLC8/GumvLWmSB39fBHAcgOt6vtv1rYqYzkAvYdCW+Zi8VMrDTFuvl
 vf24HtvCkr4w==
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; d="scan'208";a="254873662"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 03:31:45 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 938E120953; Mon, 25 May 2020 13:31:43 +0300 (EEST)
Date: Mon, 25 May 2020 13:31:43 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v2] drm/fourcc: Add bayer formats and modifiers
Message-ID: <20200525103143.GF7618@paasikivi.fi.intel.com>
References: <20200521235201.279642-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521235201.279642-1-niklas.soderlund@ragnatech.se>
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
Cc: libcamera-devel@lists.libcamera.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niklas,

Thank you for the update.

On Fri, May 22, 2020 at 01:52:01AM +0200, Niklas S=F6derlund wrote:
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
> * Changes since v1
> - Rename the defines from DRM_FORMAT_SRGGB8 to DRM_FORMAT_BAYER_RGGB8.
> - Update the fourcc codes passed to fourcc_code() to avoid a conflict.
> - Add diagrams for all Bayer formats memory layout.
> - Update documentation.
> ---
>  include/uapi/drm/drm_fourcc.h | 205 ++++++++++++++++++++++++++++++++++
>  1 file changed, 205 insertions(+)
> =

> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d80737..d07dd24b49bde6c1 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -285,6 +285,73 @@ extern "C" {
>  #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsamp=
led Cb (1) and Cr (2) planes */
>  #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsamp=
led Cr (1) and Cb (2) planes */
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
> + *	row2: RGRGRGRG...
> + *	row3: GBGBGBGB...
> + *	...
> + *
> + * Vendors have different methods to pack the pixel samples. For this re=
ason the
> + * fourcc only describes pixel sample size and the filter pattern for ea=
ch block
> + * of 2x2 pixels. A modifier is needed to describe the memory layout.
> + *
> + * In addition to vendor modifiers for memory layout DRM_FORMAT_MOD_LINE=
AR may
> + * be used to describe a layout where all samples are placed consecutive=
ly in
> + * memory. If the sample does not fit inside a single byte each sample i=
s stored
> + * in the minimum number of bytes required. Any unused bits in each samp=
le are
> + * defined as padding bits and set to zero.
> + *
> + * For example, DRM_FORMAT_BAYER_RGGB10 with DRM_FORMAT_MOD_LINEAR:
> + *
> + *  0                                              row 0 (RGRG)         =
                                   31
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | r0 r0 r0 r0 r0 r0 r0 r0 |  0  0  0  0  0  0 r0 r0 | g0 g0 g0 g0 g0=
 g0 g0 g0 |  0  0  0  0  0  0 g0 g0 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | r1 r1 r1 r1 r1 r1 r1 r1 |  0  0  0  0  0  0 r1 r1 | g1 g1 g1 g1 g1=
 g1 g1 g1 |  0  0  0  0  0  0 g1 g1 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *
> + *  0                                              row 1 (GBGB)         =
                                   31
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | g0 g0 g0 g0 g0 g0 g0 g0 |  0  0  0  0  0  0 g0 g0 | b0 b0 b0 b0 b0=
 b0 b0 b0 |  0  0  0  0  0  0 b0 b0 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | g1 g1 g1 g1 g1 g1 g1 g1 |  0  0  0  0  0  0 g1 g1 | b1 b1 b1 b1 b1=
 b1 b1 b1 |  0  0  0  0  0  0 b1 b1 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + */
> +
> +/* 8-bits Bayer formats */
> +#define DRM_FORMAT_BAYER_RGGB8		fourcc_code('R', 'G', 'G', 'B')
> +#define DRM_FORMAT_BAYER_GRBG8		fourcc_code('G', 'R', 'B', 'G')
> +#define DRM_FORMAT_BAYER_GBRG8		fourcc_code('G', 'B', 'R', 'G')
> +#define DRM_FORMAT_BAYER_BGGR8		fourcc_code('B', 'G', 'G', 'R')
> +
> +/* 10-bit Bayer formats */
> +#define DRM_FORMAT_BAYER_RGGB10		fourcc_code('R', 'G', '1', '0')
> +#define DRM_FORMAT_BAYER_GRBG10		fourcc_code('G', 'R', '1', '0')
> +#define DRM_FORMAT_BAYER_GBRG10		fourcc_code('G', 'B', '1', '0')
> +#define DRM_FORMAT_BAYER_BGGR10		fourcc_code('B', 'G', '1', '0')
> +
> +/* 12-bit Bayer formats */
> +#define DRM_FORMAT_BAYER_RGGB12		fourcc_code('R', 'G', '1', '2')
> +#define DRM_FORMAT_BAYER_GRBG12		fourcc_code('G', 'R', '1', '2')
> +#define DRM_FORMAT_BAYER_GBRG12		fourcc_code('G', 'B', '1', '2')
> +#define DRM_FORMAT_BAYER_BGGR12		fourcc_code('B', 'G', '1', '2')
> +
> +/* 14-bit Bayer formats */
> +#define DRM_FORMAT_BAYER_RGGB14		fourcc_code('R', 'G', '1', '4')
> +#define DRM_FORMAT_BAYER_GRBG14		fourcc_code('G', 'R', '1', '4')
> +#define DRM_FORMAT_BAYER_GBRG14		fourcc_code('G', 'B', '1', '4')
> +#define DRM_FORMAT_BAYER_BGGR14		fourcc_code('B', 'G', '1', '4')
> +
>  =

>  /*
>   * Format Modifiers:
> @@ -309,6 +376,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> +#define DRM_FORMAT_MOD_VENDOR_MIPI 0x0a

This is an interesting one. I don't think these formats have originated
from MIPI. The colour pattern itself is from Eastman Kodak apparently
(named after Bryce Bayer), but the memory format is not, apart from the
MIPI CSI-2 packed variant.

The formats are probably unlike the formats used on GPUs as they are
relatively similar across a number of vendors and devices.

There are more raw formats than just the Bayer formats, see e.g.

<URL:https://en.wikipedia.org/wiki/Raw_image_format>

At the same time, it'd be good to keep the CSI-2 packed variant as a format
modifier. I wonder if we could have something like
DRM_FORMAT_MOD_VENDOR_RAW, albeit a raw format is not a vendor.

Cc Daniel and Laurent.

>  =

>  /* add more to the end as needed */
>  =

> @@ -434,6 +502,56 @@ extern "C" {
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
> + * the 6 most significant bits in the last byte unused zero padding bits.
> + *
> + * For example, DRM_FORMAT_BAYER_BGGR10 with IPU3_FORMAT_MOD_PACKED:
> + *
> + *  0                                   row 0 (BGBGBGBGBGBGBGBGBGBGBGBGB=
)                                  31
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | b0 b0 b0 b0 b0 b0 b0 b0 | g0 g0 g0 g0 g0 g0 b0 b0 | b1 b1 b1 b1 g0=
 g0 g0 g0 | g1 g1 b1 b1 b1 b1 b1 b1 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | g1 g1 g1 g1 g1 g1 g1 g1 | b2 b2 b2 b2 b2 b2 b2 b2 | g2 g2 g2 g2 g2=
 g2 b2 b2 | b3 b3 b3 b3 g2 g2 g2 g2 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | g3 g3 b3 b3 b3 b3 b3 b3 | g3 g3 g3 g3 g3 g3 g3 g3 | b4 b4 b4 b4 b4=
 b4 b4 b4 | g4 g4 g4 g4 g4 g4 b4 b4 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | b5 b5 b5 b5 g4 g4 g4 g4 | g5 g5 b5 b5 b5 b5 b5 b5 | g5 g5 g5 g5 g5=
 g5 g5 g5 | b6 b6 b6 b6 b6 b6 b6 b6 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | g6 g6 g6 g6 g6 g6 b6 b6 | b7 b7 b7 b7 g6 g6 g6 g6 | g7 g7 b7 b7 b7=
 b7 b7 b7 | g7 g7 g7 g7 g7 g7 g7 g7 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | b8 b8 b8 b8 b8 b8 b8 b8 | g8 g8 g8 g8 g8 g8 b8 b8 | b9 b9 b9 b9 g8=
 g8 g8 g8 | g9 g9 b9 b9 b9 b9 b9 b9 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | g9 g9 g9 g9 g9 g9 g9 g9 | bA bA bA bA bA bA bA bA | gA gA gA gA gA=
 gA bA bA | bB bB bB bB gA gA gA gA |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | gB gB bB bB bB bB bB bB | gB gB gB gB gB gB gB gB | bC bC bC bC bC=
 bC bC bC |  0  0  0  0  0  0 bC bC |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *
> + *  0                                   row 1 (GRGRGRGRGRGRGRGRGRGRGRGRG=
)                                  31
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | g0 g0 g0 g0 g0 g0 g0 g0 | r0 r0 r0 r0 r0 r0 g0 g0 | g1 g1 g1 g1 r0=
 r0 r0 r0 | r1 r1 g1 g1 g1 g1 g1 g1 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | r1 r1 r1 r1 r1 r1 r1 r1 | g2 g2 g2 g2 g2 g2 g2 g2 | r2 r2 r2 r2 r2=
 r2 g2 g2 | g3 g3 g3 g3 r2 r2 r2 r2 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | r3 r3 g3 g3 g3 g3 g3 g3 | r3 r3 r3 r3 r3 r3 r3 r3 | g4 g4 g4 g4 g4=
 g4 g4 g4 | r4 r4 r4 r4 r4 r4 g4 g4 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | g5 g5 g5 g5 r4 r4 r4 r4 | r5 r5 g5 g5 g5 g5 g5 g5 | r5 r5 r5 r5 r5=
 r5 r5 r5 | g6 g6 g6 g6 g6 g6 g6 g6 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | r6 r6 r6 r6 r6 r6 g6 g6 | g7 g7 g7 g7 r6 r6 r6 r6 | r7 r7 g7 g7 g7=
 g7 g7 g7 | r7 r7 r7 r7 r7 r7 r7 r7 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | g8 g8 g8 g8 g8 g8 g8 g8 | r8 r8 r8 r8 r8 r8 g8 g8 | g9 g9 g9 g9 r8=
 r8 r8 r8 | r9 r9 g9 g9 g9 g9 g9 g9 |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | r9 r9 r9 r9 r9 r9 r9 r9 | gA gA gA gA gA gA gA gA | rA rA rA rA rA=
 rA gA gA | gB gB gB gB rA rA rA rA |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + *  | rB rB gB gB gB gB gB gB | rB rB rB rB rB rB rB rB | gC gC gC gC gC=
 gC gC gC |  0  0  0  0  0  0 gC gC |
> + *  +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  -  -=
  -  -  - +  -  -  -  -  -  -  -  - +
> + */
> +#define IPU3_FORMAT_MOD_PACKED fourcc_mod_code(INTEL, 8)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> @@ -804,6 +922,93 @@ extern "C" {
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
> + * depending on the sample size.
> + *
> + * - 10-bits per sample
> + *   Every four consecutive samples are packed into 5 bytes. Each of the=
 first 4
> + *   bytes contain the 8 high order bits of the pixels, and the 5th byte
> + *   contains the 2 least-significant bits of each pixel, in the same or=
der.
> + *
> + *   For example, DRM_FORMAT_BAYER_BGGR10 with MIPI_FORMAT_MOD_CSI2_PACK=
ED:
> + *
> + *    0                                            row 0 (BGBGBGBG)     =
                                     31
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | b0 b0 b0 b0 b0 b0 b0 b0 | g0 g0 g0 g0 g0 g0 g0 g0 | b1 b1 b1 b1 =
b1 b1 b1 b1 | g1 g1 g1 g1 g1 g1 g1 g1 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | g1 g1 b1 b1 g0 g0 b0 b0 | b2 b2 b2 b2 b2 b2 b2 b2 | g2 g2 g2 g2 =
g2 g2 g2 g2 | b3 b3 b3 b3 b3 b3 b3 b3 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | g3 g3 g3 g3 g3 g3 g3 g3 | g3 g3 b3 b3 g2 g2 b2 b2 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +
> + *
> + *    0                                            row 1 (GRGRGRGR)     =
                                     31
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | g0 g0 g0 g0 g0 g0 g0 g0 | r0 r0 r0 r0 r0 r0 r0 r0 | g1 g1 g1 g1 =
g1 g1 g1 g1 | r1 r1 r1 r1 r1 r1 r1 r1 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | r1 r1 g1 g1 r0 r0 g0 g0 | g2 g2 g2 g2 g2 g2 g2 g2 | r2 r2 r2 r2 =
r2 r2 r2 r2 | g3 g3 g3 g3 g3 g3 g3 g3 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | r3 r3 r3 r3 r3 r3 r3 r3 | r3 r3 g3 g3 r2 r2 g2 g2 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +
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
> + *   For example, DRM_FORMAT_BAYER_GRBG12 with MIPI_FORMAT_MOD_CSI2_PACK=
ED:
> + *
> + *    0                                              row 0 (GRGR)       =
                                     31
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | g0 g0 g0 g0 g0 g0 g0 g0 | r0 r0 r0 r0 r0 r0 r0 r0 | r0 r0 r0 r0 =
g0 g0 g0 g0 | g1 g1 g1 g1 g1 g1 g1 g1 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | r1 r1 r1 r1 r1 r1 r1 r1 | r1 r1 r1 r1 g1 g1 g1 g1 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +
> + *
> + *    0                                              row 1 (BGBG)       =
                                     31
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | b0 b0 b0 b0 b0 b0 b0 b0 | g0 g0 g0 g0 g0 g0 g0 g0 | g0 g0 g0 g0 =
b0 b0 b0 b0 | b1 b1 b1 b1 b1 b1 b1 b1 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | g1 g1 g1 g1 g1 g1 g1 g1 | g1 g1 g1 g1 b1 b1 b1 b1 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +
> + *
> + * - 14-bits per sample
> + *   Every four consecutive samples are packed into seven bytes. Each of=
 the
> + *   first four bytes contain the eight high order bits of the pixels, a=
nd the
> + *   three following bytes contains the six least-significant bits of ea=
ch
> + *   pixel, in the same order.
> + *
> + *   For example, DRM_FORMAT_BAYER_GBRG14 with MIPI_FORMAT_MOD_CSI2_PACK=
ED:
> + *
> + *    0                                            row 0 (GBGBGBGB)     =
                                     31
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | g0 g0 g0 g0 g0 g0 g0 g0 | b0 b0 b0 b0 b0 b0 b0 b0 | g1 g1 g1 g1 =
g1 g1 g1 g1 | b1 b1 b1 b1 b1 b1 b1 b1 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | b0 b0 g0 g0 g0 g0 g0 g0 | g1 g1 g1 g1 b0 b0 b0 b0 | b1 b1 b1 b1 =
b1 b1 g1 g1 | g2 g2 g2 g2 g2 g2 g2 g2 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | b2 b2 b2 b2 b2 b2 b2 b2 | g3 g3 g3 g3 g3 g3 g3 g3 | b3 b3 b3 b3 =
b3 b3 b3 b3 | b2 b2 g2 g2 g2 g2 g2 g2 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | g3 g3 g3 g3 b2 b2 b2 b2 | b3 b3 b3 b3 b3 b3 g3 g3 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +
> + *
> + *    0                                            row 1 (RGRGRGRG)     =
                                     31
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | r0 r0 r0 r0 r0 r0 r0 r0 | g0 g0 g0 g0 g0 g0 g0 g0 | r1 r1 r1 r1 =
r1 r1 r1 r1 | g1 g1 g1 g1 g1 g1 g1 g1 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | g0 g0 r0 r0 r0 r0 r0 r0 | r1 r1 r1 r1 g0 g0 g0 g0 | g1 g1 g1 g1 =
g1 g1 r1 r1 | r2 r2 r2 r2 r2 r2 r2 r2 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | g2 g2 g2 g2 g2 g2 g2 g2 | r3 r3 r3 r3 r3 r3 r3 r3 | g3 g3 g3 g3 =
g3 g3 g3 g3 | g2 g2 r2 r2 r2 r2 r2 r2 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +  -  -  -  - =
 -  -  -  - +  -  -  -  -  -  -  -  - +
> + *    | r3 r3 r3 r3 g2 g2 g2 g2 | g3 g3 g3 g3 g3 g3 r3 r3 |
> + *    +  -  -  -  -  -  -  -  - +  -  -  -  -  -  -  -  - +
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
