Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E6174AED3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961FB10E143;
	Fri,  7 Jul 2023 10:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CA210E143
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 10:38:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-32-136-nat.elisa-mobile.fi
 [85.76.32.136])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52041558;
 Fri,  7 Jul 2023 12:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1688726278;
 bh=L9/7Bf1eunm2Dl68BqIQkXOmHFdcsKoWUkQaUcSx31o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N6pkPaEaG7vdw93D4DkYUYslGB8jIUyby7a+6YME5c+aS/azfITmSkP/Rwj0oar4R
 It7hQz7OZvwemQ17S7vg2QsHVKAZpzI0ivnrQ5Y44U2FvOJyty0tVa29tICsYu6a66
 X//KMAG/f/3DemM1LJydjoeW5Ixg4Mm6SaKfAlBY=
Date: Fri, 7 Jul 2023 13:38:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH libdrm 3/3] modetest: Add support for DRM_FORMAT_NV{24, 42}
Message-ID: <20230707103841.GC15801@pendragon.ideasonboard.com>
References: <cover.1688570702.git.geert+renesas@glider.be>
 <1e43eba23f3a73ed4c18ec4516869a5abc39a475.1688570702.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1e43eba23f3a73ed4c18ec4516869a5abc39a475.1688570702.git.geert+renesas@glider.be>
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

On Wed, Jul 05, 2023 at 05:26:17PM +0200, Geert Uytterhoeven wrote:
> Add support for creating buffers using semi-planar YUV formats with
> non-subsampled chroma planes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  tests/modetest/buffers.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/tests/modetest/buffers.c b/tests/modetest/buffers.c
> index 0b55aeddfef9a854..0605b12552bb8eec 100644
> --- a/tests/modetest/buffers.c
> +++ b/tests/modetest/buffers.c
> @@ -129,6 +129,8 @@ bo_create(int fd, unsigned int format,
>  	case DRM_FORMAT_NV21:
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YVU420:
>  		bpp = 8;
> @@ -208,6 +210,11 @@ bo_create(int fd, unsigned int format,
>  		virtual_height = height * 2;
>  		break;
>  
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
> +		virtual_height = height * 3;
> +		break;
> +
>  	default:
>  		virtual_height = height;
>  		break;
> @@ -255,6 +262,19 @@ bo_create(int fd, unsigned int format,
>  		planes[1] = virtual + offsets[1];
>  		break;
>  
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
> +		offsets[0] = 0;
> +		handles[0] = bo->handle;
> +		pitches[0] = bo->pitch;
> +		pitches[1] = pitches[0] * 2;
> +		offsets[1] = pitches[0] * height;
> +		handles[1] = bo->handle;
> +
> +		planes[0] = virtual;
> +		planes[1] = virtual + offsets[1];
> +		break;
> +
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YVU420:
>  		offsets[0] = 0;

-- 
Regards,

Laurent Pinchart
