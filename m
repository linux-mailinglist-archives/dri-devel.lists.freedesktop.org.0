Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 834DB6D729F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 05:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8565710E0CF;
	Wed,  5 Apr 2023 03:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10B710E0CF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 03:06:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp
 [118.241.147.243])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42F98106;
 Wed,  5 Apr 2023 05:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680663961;
 bh=fpuqvwekKv1fPRMdJBoKXPL1VJdLuveTMHHzCDRqYbs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jEVv9+tKz12dgeazkEunbDN4IbRf8/yB3pDPS9jfLxgOKeN8c44yCi/Obpkc3mNlC
 oMbPqvWxFbMXY/gUO0h6L3qhLxhhEuJ3zxmPU0z6ozu1KBUPz5nNAfG2AzbApMWP7A
 G6CljDRXgZPHpHbgoOiPGu7gqqM3lTwzyrfjTa9A=
Date: Wed, 5 Apr 2023 06:06:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/5] drm: shmobile: Add support for DRM_FORMAT_XRGB8888
Message-ID: <20230405030607.GH9915@pendragon.ideasonboard.com>
References: <cover.1680273039.git.geert+renesas@glider.be>
 <34ad1c1798b37a68ce08cffa8402be497ac2162e.1680273039.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34ad1c1798b37a68ce08cffa8402be497ac2162e.1680273039.git.geert+renesas@glider.be>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Fri, Mar 31, 2023 at 04:48:08PM +0200, Geert Uytterhoeven wrote:
> DRM_FORMAT_XRGB8888 aka XR24 is the modus francus of DRM, and should be
> supported by all drivers.
> 
> The handling for DRM_FORMAT_XRGB8888 is similar to DRM_FORMAT_ARGB8888,
> just ignore the alpha channel.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c  | 1 +
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c   | 5 +++++
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c | 5 +++++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> index 713a7612244c647a..08dc1428aa16caf0 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> @@ -232,6 +232,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>  		value = LDDDSR_LS | LDDDSR_WS | LDDDSR_BS;
>  		break;
>  	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_XRGB8888:
>  	default:
>  		value = LDDDSR_LS;
>  		break;
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> index 3c5fe3bc183c7c13..99381cc0abf3ae1f 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> @@ -39,6 +39,11 @@ static const struct shmob_drm_format_info shmob_drm_format_infos[] = {
>  		.bpp = 32,
>  		.yuv = false,
>  		.lddfr = LDDFR_PKF_ARGB32,
> +	}, {
> +		.fourcc = DRM_FORMAT_XRGB8888,
> +		.bpp = 32,
> +		.yuv = false,
> +		.lddfr = LDDFR_PKF_ARGB32,
>  	}, {
>  		.fourcc = DRM_FORMAT_NV12,
>  		.bpp = 12,
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> index 604ae23825daaafd..850986cee848226a 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> @@ -80,6 +80,7 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
>  		format |= LDBBSIFR_SWPL | LDBBSIFR_SWPW | LDBBSIFR_SWPB;
>  		break;
>  	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_XRGB8888:
>  	default:
>  		format |= LDBBSIFR_SWPL;
>  		break;
> @@ -95,6 +96,9 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
>  	case DRM_FORMAT_ARGB8888:
>  		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDDFR_PKF_ARGB32;
>  		break;
> +	case DRM_FORMAT_XRGB8888:
> +		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDDFR_PKF_ARGB32;
> +		break;
>  	case DRM_FORMAT_NV12:
>  	case DRM_FORMAT_NV21:
>  		format |= LDBBSIFR_AL_1 | LDBBSIFR_CHRR_420;
> @@ -231,6 +235,7 @@ static const uint32_t formats[] = {
>  	DRM_FORMAT_RGB565,
>  	DRM_FORMAT_RGB888,
>  	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_NV12,
>  	DRM_FORMAT_NV21,
>  	DRM_FORMAT_NV16,

-- 
Regards,

Laurent Pinchart
