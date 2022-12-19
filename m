Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D685C651477
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 21:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FC010E2FE;
	Mon, 19 Dec 2022 20:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF9910E2FE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 20:54:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA594825;
 Mon, 19 Dec 2022 21:54:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671483266;
 bh=rtjeVpdzKmvKcCm5/V1IKSgNbRc2XxoyhpnduxLNVsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TEgExkmaenIhgJbCONGF/DTQwt6CipDY8VlhYo5zfQ7yrh/pKNq0DGbEqRqlNn7rJ
 WZ2H10oSbwPIO0urbvLsIygKiQmLVXypZEuyybcmMXK/vqMhsLYwXwLfzmAqBD6x2s
 NgoDGNSsQ50hqMyL5GlATyNFoDY/N4PJIB6Ck5uI=
Date: Mon, 19 Dec 2022 22:54:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 2/7] media: Add Y210, Y212 and Y216 formats
Message-ID: <Y6DPfhhuCH1sC/R5@pendragon.ideasonboard.com>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-3-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221219140139.294245-3-tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Mon, Dec 19, 2022 at 04:01:34PM +0200, Tomi Valkeinen wrote:
> Add Y210, Y212 and Y216 formats.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  .../media/v4l/pixfmt-packed-yuv.rst           | 44 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  3 ++
>  include/uapi/linux/videodev2.h                |  8 ++++
>  3 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> index bf283a1b5581..3f193e5fd5cb 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> @@ -337,6 +337,50 @@ components horizontally by 2, storing 2 pixels in 4 bytes.

I would patch the above sentence to mention that it applies to 8 bit
formats.

>        - Y'\ :sub:`3`
>        - Cb\ :sub:`2`
>  
> +The packed YUYV formats with more than 8 bits per component are stored as four
> +16-bit little-endian words. Each word's most significat bits contain one

s/significat/significant/

> +component, and the least significant bits are zero padding.
> +
> +.. tabularcolumns:: |p{3.4cm}|p{1.2cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|
> +
> +.. flat-table:: Packed YUV 4:2:2 Formats in 64-bit container
> +    :header-rows: 1
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      - Word 0
> +      - Word 1
> +      - Word 2
> +      - Word 3
> +    * .. _V4L2-PIX-FMT-Y210:
> +
> +      - ``V4L2_PIX_FMT_Y210``
> +      - 'Y210'
> +
> +      - Y'\ :sub:`0` (bits 15-6)
> +      - Cb\ :sub:`0` (bits 15-6)
> +      - Y'\ :sub:`1` (bits 15-6)
> +      - Cr\ :sub:`0` (bits 15-6)
> +    * .. _V4L2-PIX-FMT-Y212:
> +
> +      - ``V4L2_PIX_FMT_Y212``
> +      - 'Y212'
> +
> +      - Y'\ :sub:`0` (bits 15-4)
> +      - Cb\ :sub:`0` (bits 15-4)
> +      - Y'\ :sub:`1` (bits 15-4)
> +      - Cr\ :sub:`0` (bits 15-4)
> +    * .. _V4L2-PIX-FMT-Y216:
> +
> +      - ``V4L2_PIX_FMT_Y216``
> +      - 'Y216'
> +
> +      - Y'\ :sub:`0` (bits 15-0)
> +      - Cb\ :sub:`0` (bits 15-0)
> +      - Y'\ :sub:`1` (bits 15-0)
> +      - Cr\ :sub:`0` (bits 15-0)
> +
>  .. raw:: latex
>  
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 964300deaf62..ba95389a59b5 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1449,6 +1449,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_10BE_8L128:	descr = "10-bit NV12M (8x128 Linear, BE)"; break;
> +	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
> +	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
> +	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;

While the names will not play nicely with future formats that would swap
the order of the Y, U and V components, they match the formats defined
by DRM, which I think is more important.

With the above small issues fixed,

Conditionally-Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 877fd61693b8..15b640d2da8a 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -621,6 +621,14 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
>  #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
>  
> +/*
> + * YCbCr packed format. For each Y2xx format, xx bits of valid data occupy the MSBs
> + * of the 16 bit components, and 16-xx bits of zero padding occupy the LSBs.
> + */
> +#define V4L2_PIX_FMT_Y210    v4l2_fourcc('Y', '2', '1', '0') /* 32  YUYV 4:2:2 */
> +#define V4L2_PIX_FMT_Y212    v4l2_fourcc('Y', '2', '1', '2') /* 32  YUYV 4:2:2 */
> +#define V4L2_PIX_FMT_Y216    v4l2_fourcc('Y', '2', '1', '6') /* 32  YUYV 4:2:2 */
> +
>  /* two planes -- one Y, one Cr + Cb interleaved  */
>  #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/CbCr 4:2:0  */
>  #define V4L2_PIX_FMT_NV21    v4l2_fourcc('N', 'V', '2', '1') /* 12  Y/CrCb 4:2:0  */

-- 
Regards,

Laurent Pinchart
