Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04E241155
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 22:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA0289CCB;
	Mon, 10 Aug 2020 20:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F8989CCB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 20:04:35 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 95498804CE;
 Mon, 10 Aug 2020 22:04:33 +0200 (CEST)
Date: Mon, 10 Aug 2020 22:04:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] gpu: ipu-v3: remove unused functions
Message-ID: <20200810200432.GA415947@ravnborg.org>
References: <20200721130504.22081-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721130504.22081-1-p.zabel@pengutronix.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=Fe9iELajE1JTs8reR74A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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

On Tue, Jul 21, 2020 at 03:05:04PM +0200, Philipp Zabel wrote:
> ipu_mbus_code_to_colorspace, ipu_stride_to_bytes, and
> ipu_pixelformat_is_planar are unused. Remove them.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

git grep agrees with you.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/ipu-v3/ipu-common.c | 67 ---------------------------------
>  include/video/imx-ipu-v3.h      |  3 --
>  2 files changed, 70 deletions(-)
> 
> diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
> index b3dae9ec1a38..d166ee262ce4 100644
> --- a/drivers/gpu/ipu-v3/ipu-common.c
> +++ b/drivers/gpu/ipu-v3/ipu-common.c
> @@ -133,73 +133,6 @@ enum ipu_color_space ipu_pixelformat_to_colorspace(u32 pixelformat)
>  }
>  EXPORT_SYMBOL_GPL(ipu_pixelformat_to_colorspace);
>  
> -bool ipu_pixelformat_is_planar(u32 pixelformat)
> -{
> -	switch (pixelformat) {
> -	case V4L2_PIX_FMT_YUV420:
> -	case V4L2_PIX_FMT_YVU420:
> -	case V4L2_PIX_FMT_YUV422P:
> -	case V4L2_PIX_FMT_NV12:
> -	case V4L2_PIX_FMT_NV21:
> -	case V4L2_PIX_FMT_NV16:
> -	case V4L2_PIX_FMT_NV61:
> -		return true;
> -	}
> -
> -	return false;
> -}
> -EXPORT_SYMBOL_GPL(ipu_pixelformat_is_planar);
> -
> -enum ipu_color_space ipu_mbus_code_to_colorspace(u32 mbus_code)
> -{
> -	switch (mbus_code & 0xf000) {
> -	case 0x1000:
> -		return IPUV3_COLORSPACE_RGB;
> -	case 0x2000:
> -		return IPUV3_COLORSPACE_YUV;
> -	default:
> -		return IPUV3_COLORSPACE_UNKNOWN;
> -	}
> -}
> -EXPORT_SYMBOL_GPL(ipu_mbus_code_to_colorspace);
> -
> -int ipu_stride_to_bytes(u32 pixel_stride, u32 pixelformat)
> -{
> -	switch (pixelformat) {
> -	case V4L2_PIX_FMT_YUV420:
> -	case V4L2_PIX_FMT_YVU420:
> -	case V4L2_PIX_FMT_YUV422P:
> -	case V4L2_PIX_FMT_NV12:
> -	case V4L2_PIX_FMT_NV21:
> -	case V4L2_PIX_FMT_NV16:
> -	case V4L2_PIX_FMT_NV61:
> -		/*
> -		 * for the planar YUV formats, the stride passed to
> -		 * cpmem must be the stride in bytes of the Y plane.
> -		 * And all the planar YUV formats have an 8-bit
> -		 * Y component.
> -		 */
> -		return (8 * pixel_stride) >> 3;
> -	case V4L2_PIX_FMT_RGB565:
> -	case V4L2_PIX_FMT_YUYV:
> -	case V4L2_PIX_FMT_UYVY:
> -		return (16 * pixel_stride) >> 3;
> -	case V4L2_PIX_FMT_BGR24:
> -	case V4L2_PIX_FMT_RGB24:
> -		return (24 * pixel_stride) >> 3;
> -	case V4L2_PIX_FMT_BGR32:
> -	case V4L2_PIX_FMT_RGB32:
> -	case V4L2_PIX_FMT_XBGR32:
> -	case V4L2_PIX_FMT_XRGB32:
> -		return (32 * pixel_stride) >> 3;
> -	default:
> -		break;
> -	}
> -
> -	return -EINVAL;
> -}
> -EXPORT_SYMBOL_GPL(ipu_stride_to_bytes);
> -
>  int ipu_degrees_to_rot_mode(enum ipu_rotate_mode *mode, int degrees,
>  			    bool hflip, bool vflip)
>  {
> diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
> index 06b0b57e996c..d1b3889f74d8 100644
> --- a/include/video/imx-ipu-v3.h
> +++ b/include/video/imx-ipu-v3.h
> @@ -484,9 +484,6 @@ int ipu_smfc_set_watermark(struct ipu_smfc *smfc, u32 set_level, u32 clr_level);
>  
>  enum ipu_color_space ipu_drm_fourcc_to_colorspace(u32 drm_fourcc);
>  enum ipu_color_space ipu_pixelformat_to_colorspace(u32 pixelformat);
> -enum ipu_color_space ipu_mbus_code_to_colorspace(u32 mbus_code);
> -int ipu_stride_to_bytes(u32 pixel_stride, u32 pixelformat);
> -bool ipu_pixelformat_is_planar(u32 pixelformat);
>  int ipu_degrees_to_rot_mode(enum ipu_rotate_mode *mode, int degrees,
>  			    bool hflip, bool vflip);
>  int ipu_rot_mode_to_degrees(int *degrees, enum ipu_rotate_mode mode,
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
