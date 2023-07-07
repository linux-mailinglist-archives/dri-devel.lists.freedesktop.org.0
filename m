Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAA174AECA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E55310E142;
	Fri,  7 Jul 2023 10:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13ED10E142
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 10:36:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-32-136-nat.elisa-mobile.fi
 [85.76.32.136])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEBEF558;
 Fri,  7 Jul 2023 12:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1688726167;
 bh=qbmSaQUymFJ9LS/n80xV3TXnTAQeqGluWo1pJjavueE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qjWxGwNH9zHsw3KNX95DnuiAjLU3zrph+McZOiQYxJzxQFphFty67LqrioFAX7cMX
 bT2PJkhdamUEkfscSBuv3CznZheFzwkLiTKAzSKVRx4ProH9uFLzNBEhXKrfZi+Dtx
 go2nY0Cw2wntWzR8h5cXSvrc5fiERlVdk0iCcBZA=
Date: Fri, 7 Jul 2023 13:36:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH libdrm 2/3] util: Add pattern support for
 DRM_FORMAT_NV{24,42}
Message-ID: <20230707103649.GB15801@pendragon.ideasonboard.com>
References: <cover.1688570702.git.geert+renesas@glider.be>
 <eab4e871d026e39f98591840daaa8d82b9ccc637.1688570702.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eab4e871d026e39f98591840daaa8d82b9ccc637.1688570702.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Wed, Jul 05, 2023 at 05:26:16PM +0200, Geert Uytterhoeven wrote:
> Add support for drawing the SMPTE and tiles patterns in buffers using
> semi-planar YUV formats with non-subsampled chroma planes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  tests/util/pattern.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> index 158c0b160a2ee870..f45a26ccec38f202 100644
> --- a/tests/util/pattern.c
> +++ b/tests/util/pattern.c
> @@ -698,6 +698,8 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
>  	case DRM_FORMAT_NV21:
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
>  		u = info->yuv.order & YUV_YCbCr ? planes[1] : planes[1] + 1;
>  		v = info->yuv.order & YUV_YCrCb ? planes[1] : planes[1] + 1;
>  		return fill_smpte_yuv_planar(&info->yuv, planes[0], u, v,
> @@ -1023,6 +1025,8 @@ static void fill_tiles(const struct util_format_info *info, void *planes[3],
>  	case DRM_FORMAT_NV21:
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
>  		u = info->yuv.order & YUV_YCbCr ? planes[1] : planes[1] + 1;
>  		v = info->yuv.order & YUV_YCrCb ? planes[1] : planes[1] + 1;
>  		return fill_tiles_yuv_planar(info, planes[0], u, v,

-- 
Regards,

Laurent Pinchart
