Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C6D585C3A
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 23:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3667AAFE3C;
	Sat, 30 Jul 2022 21:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AAF12AEA5
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 21:10:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACAC3480;
 Sat, 30 Jul 2022 23:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1659215418;
 bh=FPHryDeiK67gnR7HpsDuBEE0Mh2b398Y0FXuP3rvook=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IdBcIuWS4KwJntynKxXbQ/r+JYWESPxPh6takAQ/gLtetnKdB8nd24Y14OQ5FsFAx
 E8cvU2RBcJpQ9Oe8HwIEnlfa8NlGsQRYLpJzOcDz2xPiYbpvhxK8b5mCIYQ1VBpPXi
 L2+Ks8D3X9um6f5uIxa1haqZv/VPes7vy8oaFyG0=
Date: Sun, 31 Jul 2022 00:10:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Takanari Hayama <taki@igel.co.jp>
Subject: Re: [PATCH 1/3] media: vsp1: save pixel alpha info in vsp1_rwpf
Message-ID: <YuWeN/iFKSaINKui@pendragon.ideasonboard.com>
References: <20220704025231.3911138-1-taki@igel.co.jp>
 <20220704025231.3911138-2-taki@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704025231.3911138-2-taki@igel.co.jp>
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
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hayama-san,

Thank you for the patch (and sorry for the long delay).

On Mon, Jul 04, 2022 at 11:52:29AM +0900, Takanari Hayama wrote:
> In order to support DRM blend mode, we need to able to override pixel
> alpha flag. When DRM_MODE_BLEND_PIXEL_NONE is desired, we'd like to let
> VSP1 to ignore the pixel alpha by overriding the flag.
> 
> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c  | 1 +
>  drivers/media/platform/renesas/vsp1/vsp1_rpf.c  | 6 +++---
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.h | 2 ++
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index 0c2507dc03d6..9ec3ac835987 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -600,6 +600,7 @@ static int vsp1_du_pipeline_set_rwpf_format(struct vsp1_device *vsp1,
>  	rwpf->format.num_planes = fmtinfo->planes;
>  	rwpf->format.plane_fmt[0].bytesperline = pitch;
>  	rwpf->format.plane_fmt[1].bytesperline = pitch / chroma_hsub;
> +	rwpf->pixel_alpha = fmtinfo->alpha;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index 75083cb234fe..e6bd813dc68c 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -152,13 +152,13 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  	 * In all cases, disable color keying.
>  	 */
>  	vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, VI6_RPF_ALPH_SEL_AEXT_EXT |
> -		       (fmtinfo->alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
> -				       : VI6_RPF_ALPH_SEL_ASEL_FIXED));
> +		       (rpf->pixel_alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
> +					 : VI6_RPF_ALPH_SEL_ASEL_FIXED));
>  
>  	if (entity->vsp1->info->gen == 3) {
>  		u32 mult;
>  
> -		if (fmtinfo->alpha) {
> +		if (rpf->pixel_alpha) {
>  			/*
>  			 * When the input contains an alpha channel enable the
>  			 * alpha multiplier. If the input is premultiplied we

From a DRM point of view this looks fine.
vsp1_du_pipeline_set_rwpf_format() is called upon .atomic_update(), and
rpf_configure_stream() upon .atomic_flush(), and every update is
guaranteed to be followed by a flush (through code paths that are way
too convoluted, but that's a story for a different day).

However, VSP instances that are exposed through V4L2 will see a
regression with this patch. rwpf->pixel_alpha will never be set, so
alpha-enabled formats will break. Several test case from
https://git.ideasonboard.com/renesas/vsp-tests.git report failures, for
instance

# ./vsp-unit-test-0001.sh
Testing WPF packing in RGB332: pass
Testing WPF packing in ARGB555: pass
Testing WPF packing in XRGB555: pass
Testing WPF packing in RGB565: pass
Testing WPF packing in BGR24: pass
Testing WPF packing in RGB24: pass
Testing WPF packing in ABGR32: fail
Testing WPF packing in ARGB32: fail
Testing WPF packing in XBGR32: pass
Testing WPF packing in XRGB32: pass

It seems that this could be fixed fairly easily by setting
rpf->pixel_alpha in vsp1_video_set_format():

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 51219b1b6ea9..b518873d3280 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -1015,6 +1015,7 @@ vsp1_video_set_format(struct file *file, void *fh, struct v4l2_format *format)

 	video->rwpf->format = format->fmt.pix_mp;
 	video->rwpf->fmtinfo = info;
+	video->rwpf->pixel_alpha = info->alpha;

 done:
 	mutex_unlock(&video->lock);

I've tested that and it fixes the tests, so with this change,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

No need to submit a v2 if no other changes are needed in subsequent
patches, I can apply this change when merging the patches.

> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> index eac5c04c2239..07ddebb78dfa 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> @@ -43,6 +43,8 @@ struct vsp1_rwpf {
>  	const struct vsp1_format_info *fmtinfo;
>  	unsigned int brx_input;
>  
> +	bool pixel_alpha;
> +
>  	unsigned int alpha;
>  
>  	u32 mult_alpha;

-- 
Regards,

Laurent Pinchart
