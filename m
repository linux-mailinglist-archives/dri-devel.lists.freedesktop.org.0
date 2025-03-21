Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBF0A6C601
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 23:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C422D10E14A;
	Fri, 21 Mar 2025 22:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iIDbYpwP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE3E10E14A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 22:33:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [194.75.195.10])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC550220;
 Fri, 21 Mar 2025 23:31:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742596319;
 bh=1QP3m2vfNW8WjNMDF8OqYegzPYF7ftevMUsOjQz758o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iIDbYpwPfIUBR3x4H2j2WWiPRQN7o3bI9vTtj+L20o8DKl38RXIhKVvpBUDS2U3ZD
 YQkTDpGiT1w/PJf5gseO3Xgj3dsnLVBt8TVQJkRE/tc2Ib6c3AI5nlYT3u8URO77Yg
 LzqHzsduFnDzbA7uZ8hclHX+dszXQwSoFQEmvYoI=
Date: Sat, 22 Mar 2025 00:33:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm: renesas: Extend RZ/G2L supported KMS formats
Message-ID: <20250321223320.GC11255@pendragon.ideasonboard.com>
References: <20250321172220.867165-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321172220.867165-1-kieran.bingham@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

Thank you for the patch.

On Fri, Mar 21, 2025 at 05:22:19PM +0000, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The RZ/G2L driver utilises the VSPD to read data from input sources.
> 
> The rzg2l_du_kms component lists a restricted subset of the capabilities
> of the VSPd which prevents additional formats from being used for

s/VSPd/VSPD/

> display planes.
> 
> The supported display plane formats are mapped in rzg2l_du_vsp_formats[].
> 
> Extend the rzg2l_du_format_infos[] table with the corresponding mappings
> between the supported DRM formats and the formats exposed by the VSP in
> rzg2l_du_vsp_formats, maintaining the same ordering in both tables.

Given the other replies to this patch, you may want to extend the commit
message to explain why this is fine, and how the VSPD will convert YUV
formats to RGB.

Now this makes realize we should implement support for colorspace in the
VSPD driver... It's a separate issue.

> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 141 ++++++++++++++++++-
>  1 file changed, 136 insertions(+), 5 deletions(-)
> 
> Prior to this patch, kmstest reports all of these formats as supported
> by the Planes, but using them fails during rzg2l_du_fb_create() as the
> corresponding format isn't found in rzg2l_du_format_info.
> 
> This patch now lets me capture and render pixelformats from the Mali-C55
> direct to an attached DSI panel on the Kakip board.
> 
> Patch tested with kms-tests:
> 
> PYTHONPATH=/usr/lib/aarch64-linux-gnu/python3.11/site-packages ./tests/kms-test-formats.py 
> Testing plane formats: SUCCESS
> 
> admin@kakip:~/kms-tests$ cat FormatsTest.log 
> U [66.967523] Testing plane formats
> U [66.975763] Testing connector DSI-1, CRTC 36, mode 720x1280
> U [66.978480] Testing format PixelFormat.RGB332
> U [70.143998] Testing format PixelFormat.ARGB4444
> U [73.357056] Testing format PixelFormat.XRGB4444
> U [76.574944] Testing format PixelFormat.ARGB1555
> U [79.805636] Testing format PixelFormat.XRGB1555
> U [83.016599] Testing format PixelFormat.RGB565
> U [86.230362] Testing format PixelFormat.BGR888
> U [89.444673] Testing format PixelFormat.RGB888
> U [92.677093] Testing format PixelFormat.BGRA8888
> U [95.904745] Testing format PixelFormat.BGRX8888
> U [99.119926] Testing format PixelFormat.ARGB8888
> U [102.350298] Testing format PixelFormat.XRGB8888
> U [105.579499] Testing format PixelFormat.UYVY
> U [108.878654] Testing format PixelFormat.YUYV
> U [112.176515] Testing format PixelFormat.YVYU
> U [115.470090] Testing format PixelFormat.NV12
> U [118.767513] Testing format PixelFormat.NV21
> U [122.065851] Testing format PixelFormat.NV16
> U [125.364001] Testing format PixelFormat.NV61
> U [128.662145] Testing format PixelFormat.YUV420
> U [131.978102] Testing format PixelFormat.YVU420
> U [135.292284] Testing format PixelFormat.YUV422
> U [138.623485] Testing format PixelFormat.YVU422
> U [141.955083] Testing format PixelFormat.YUV444
> U [145.336759] Testing format PixelFormat.YVU444
> U [148.761832] Test completed successfully
> 
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> index b1266fbd9598..a5e96f863172 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -36,8 +36,61 @@
>  
>  static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
>  	{
> -		.fourcc = DRM_FORMAT_XRGB8888,
> -		.v4l2 = V4L2_PIX_FMT_XBGR32,
> +		.fourcc = DRM_FORMAT_RGB332,
> +		.v4l2 = V4L2_PIX_FMT_RGB332,
> +		.bpp = 8,
> +		.planes = 1,
> +		.hsub = 1,

hsub isn't used in the driver, should it be removed (in a separate patch
of course) ? Or is that a sign there's a bug somewhere ?

Actually, bpp isn't used either. Biju, could you look into this, and
check if we should remove the fields or use them ?

Regardless, with the commit message expanded,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	}, {
> +		.fourcc = DRM_FORMAT_ARGB4444,
> +		.v4l2 = V4L2_PIX_FMT_ARGB444,
> +		.bpp = 16,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_XRGB4444,
> +		.v4l2 = V4L2_PIX_FMT_XRGB444,
> +		.bpp = 16,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_ARGB1555,
> +		.v4l2 = V4L2_PIX_FMT_ARGB555,
> +		.bpp = 16,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_XRGB1555,
> +		.v4l2 = V4L2_PIX_FMT_XRGB555,
> +		.bpp = 16,
> +		.planes = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_RGB565,
> +		.v4l2 = V4L2_PIX_FMT_RGB565,
> +		.bpp = 16,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_BGR888,
> +		.v4l2 = V4L2_PIX_FMT_RGB24,
> +		.bpp = 24,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_RGB888,
> +		.v4l2 = V4L2_PIX_FMT_BGR24,
> +		.bpp = 24,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_BGRA8888,
> +		.v4l2 = V4L2_PIX_FMT_ARGB32,
> +		.bpp = 32,
> +		.planes = 1,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_BGRX8888,
> +		.v4l2 = V4L2_PIX_FMT_XRGB32,
>  		.bpp = 32,
>  		.planes = 1,
>  		.hsub = 1,
> @@ -48,11 +101,89 @@ static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
>  		.planes = 1,
>  		.hsub = 1,
>  	}, {
> -		.fourcc = DRM_FORMAT_RGB888,
> -		.v4l2 = V4L2_PIX_FMT_BGR24,
> -		.bpp = 24,
> +		.fourcc = DRM_FORMAT_XRGB8888,
> +		.v4l2 = V4L2_PIX_FMT_XBGR32,
> +		.bpp = 32,
>  		.planes = 1,
>  		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_UYVY,
> +		.v4l2 = V4L2_PIX_FMT_UYVY,
> +		.bpp = 16,
> +		.planes = 1,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YUYV,
> +		.v4l2 = V4L2_PIX_FMT_YUYV,
> +		.bpp = 16,
> +		.planes = 1,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YVYU,
> +		.v4l2 = V4L2_PIX_FMT_YVYU,
> +		.bpp = 16,
> +		.planes = 1,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_NV12,
> +		.v4l2 = V4L2_PIX_FMT_NV12M,
> +		.bpp = 12,
> +		.planes = 2,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_NV21,
> +		.v4l2 = V4L2_PIX_FMT_NV21M,
> +		.bpp = 12,
> +		.planes = 2,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_NV16,
> +		.v4l2 = V4L2_PIX_FMT_NV16M,
> +		.bpp = 16,
> +		.planes = 2,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_NV61,
> +		.v4l2 = V4L2_PIX_FMT_NV61M,
> +		.bpp = 16,
> +		.planes = 2,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YUV420,
> +		.v4l2 = V4L2_PIX_FMT_YUV420M,
> +		.bpp = 12,
> +		.planes = 3,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YVU420,
> +		.v4l2 = V4L2_PIX_FMT_YVU420M,
> +		.bpp = 12,
> +		.planes = 3,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YUV422,
> +		.v4l2 = V4L2_PIX_FMT_YUV422M,
> +		.bpp = 16,
> +		.planes = 3,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YVU422,
> +		.v4l2 = V4L2_PIX_FMT_YVU422M,
> +		.bpp = 16,
> +		.planes = 3,
> +		.hsub = 2,
> +	}, {
> +		.fourcc = DRM_FORMAT_YUV444,
> +		.v4l2 = V4L2_PIX_FMT_YUV444M,
> +		.bpp = 24,
> +		.planes = 3,
> +		.hsub = 1,
> +	}, {
> +		.fourcc = DRM_FORMAT_YVU444,
> +		.v4l2 = V4L2_PIX_FMT_YVU444M,
> +		.bpp = 24,
> +		.planes = 3,
> +		.hsub = 1,
>  	}
>  };
>  

-- 
Regards,

Laurent Pinchart
