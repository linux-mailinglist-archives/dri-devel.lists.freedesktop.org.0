Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73132613D5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 17:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62526E84E;
	Tue,  8 Sep 2020 15:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F816E84E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 15:52:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9643A3B;
 Tue,  8 Sep 2020 17:52:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599580353;
 bh=OL3z5iwluHLblCbZLAbf2QXrcIPlluVDPQElO/f/1vw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mclh8NqsDxRRq1lRHNpwNpxkWyTDiR8X3wi7KCTCm8YrZjy4VzLbrPefNgiFeJ4/6
 BXCSQe3D9sveR+bl1AnqgH9MLaSLd3aRV/Jokr+wZAYEl6bz8QiwKZb4Kpgj7fx4JU
 y6t0RoPPSvrSzZvlIt1TsaXS4kcp2v/cvI18GqGc=
Date: Tue, 8 Sep 2020 18:52:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Fix pitch handling for fully planar YUV
 formats
Message-ID: <20200908155208.GF11405@pendragon.ideasonboard.com>
References: <20200806022649.22506-1-laurent.pinchart+renesas@ideasonboard.com>
 <3c2147d8-b5bc-b0e8-6435-4d3ec0154249@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c2147d8-b5bc-b0e8-6435-4d3ec0154249@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

On Tue, Sep 08, 2020 at 04:42:58PM +0100, Kieran Bingham wrote:
> On 06/08/2020 03:26, Laurent Pinchart wrote:
> > When creating a frame buffer, the driver verifies that the pitches for
> > the chroma planes match the luma plane. This is done incorrectly for
> > fully planar YUV formats, without taking horizontal subsampling into
> > account. Fix it.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 52 ++++++++++++++++++++++++++-
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.h |  1 +
> >  2 files changed, 52 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index 482329102f19..2fda3734a57e 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -40,6 +40,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >  		.v4l2 = V4L2_PIX_FMT_RGB565,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  		.pnmr = PnMR_SPIM_TP | PnMR_DDDF_16BPP,
> >  		.edf = PnDDCR4_EDF_NONE,
> >  	}, {
> > @@ -47,6 +48,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >  		.v4l2 = V4L2_PIX_FMT_ARGB555,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  		.pnmr = PnMR_SPIM_ALP | PnMR_DDDF_ARGB,
> >  		.edf = PnDDCR4_EDF_NONE,
> >  	}, {
> > @@ -61,6 +63,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >  		.v4l2 = V4L2_PIX_FMT_XBGR32,
> >  		.bpp = 32,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  		.pnmr = PnMR_SPIM_TP | PnMR_DDDF_16BPP,
> >  		.edf = PnDDCR4_EDF_RGB888,
> >  	}, {
> > @@ -68,6 +71,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >  		.v4l2 = V4L2_PIX_FMT_ABGR32,
> >  		.bpp = 32,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  		.pnmr = PnMR_SPIM_ALP | PnMR_DDDF_16BPP,
> >  		.edf = PnDDCR4_EDF_ARGB8888,
> >  	}, {
> > @@ -75,6 +79,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >  		.v4l2 = V4L2_PIX_FMT_UYVY,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 2,
> >  		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
> >  		.edf = PnDDCR4_EDF_NONE,
> >  	}, {
> > @@ -82,6 +87,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >  		.v4l2 = V4L2_PIX_FMT_YUYV,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 2,
> >  		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
> >  		.edf = PnDDCR4_EDF_NONE,
> >  	}, {
> > @@ -89,6 +95,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >  		.v4l2 = V4L2_PIX_FMT_NV12M,
> >  		.bpp = 12,
> >  		.planes = 2,
> > +		.hsub = 2,
> >  		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
> >  		.edf = PnDDCR4_EDF_NONE,
> >  	}, {
> > @@ -96,6 +103,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >  		.v4l2 = V4L2_PIX_FMT_NV21M,
> >  		.bpp = 12,
> >  		.planes = 2,
> > +		.hsub = 2,
> >  		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
> >  		.edf = PnDDCR4_EDF_NONE,
> >  	}, {
> > @@ -103,6 +111,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >  		.v4l2 = V4L2_PIX_FMT_NV16M,
> >  		.bpp = 16,
> >  		.planes = 2,
> > +		.hsub = 2,
> >  		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
> >  		.edf = PnDDCR4_EDF_NONE,
> >  	},
> > @@ -115,156 +124,187 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >  		.v4l2 = V4L2_PIX_FMT_RGB332,
> >  		.bpp = 8,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_ARGB4444,
> >  		.v4l2 = V4L2_PIX_FMT_ARGB444,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_XRGB4444,
> >  		.v4l2 = V4L2_PIX_FMT_XRGB444,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_RGBA4444,
> >  		.v4l2 = V4L2_PIX_FMT_RGBA444,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_RGBX4444,
> >  		.v4l2 = V4L2_PIX_FMT_RGBX444,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_ABGR4444,
> >  		.v4l2 = V4L2_PIX_FMT_ABGR444,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_XBGR4444,
> >  		.v4l2 = V4L2_PIX_FMT_XBGR444,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_BGRA4444,
> >  		.v4l2 = V4L2_PIX_FMT_BGRA444,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_BGRX4444,
> >  		.v4l2 = V4L2_PIX_FMT_BGRX444,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_RGBA5551,
> >  		.v4l2 = V4L2_PIX_FMT_RGBA555,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_RGBX5551,
> >  		.v4l2 = V4L2_PIX_FMT_RGBX555,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_ABGR1555,
> >  		.v4l2 = V4L2_PIX_FMT_ABGR555,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_XBGR1555,
> >  		.v4l2 = V4L2_PIX_FMT_XBGR555,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_BGRA5551,
> >  		.v4l2 = V4L2_PIX_FMT_BGRA555,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_BGRX5551,
> >  		.v4l2 = V4L2_PIX_FMT_BGRX555,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_BGR888,
> >  		.v4l2 = V4L2_PIX_FMT_RGB24,
> >  		.bpp = 24,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_RGB888,
> >  		.v4l2 = V4L2_PIX_FMT_BGR24,
> >  		.bpp = 24,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_RGBA8888,
> >  		.v4l2 = V4L2_PIX_FMT_BGRA32,
> >  		.bpp = 32,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_RGBX8888,
> >  		.v4l2 = V4L2_PIX_FMT_BGRX32,
> >  		.bpp = 32,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_ABGR8888,
> >  		.v4l2 = V4L2_PIX_FMT_RGBA32,
> >  		.bpp = 32,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_XBGR8888,
> >  		.v4l2 = V4L2_PIX_FMT_RGBX32,
> >  		.bpp = 32,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_BGRA8888,
> >  		.v4l2 = V4L2_PIX_FMT_ARGB32,
> >  		.bpp = 32,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_BGRX8888,
> >  		.v4l2 = V4L2_PIX_FMT_XRGB32,
> >  		.bpp = 32,
> >  		.planes = 1,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_YVYU,
> >  		.v4l2 = V4L2_PIX_FMT_YVYU,
> >  		.bpp = 16,
> >  		.planes = 1,
> > +		.hsub = 2,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_NV61,
> >  		.v4l2 = V4L2_PIX_FMT_NV61M,
> >  		.bpp = 16,
> >  		.planes = 2,
> > +		.hsub = 2,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_YUV420,
> >  		.v4l2 = V4L2_PIX_FMT_YUV420M,
> >  		.bpp = 12,
> >  		.planes = 3,
> > +		.hsub = 2,
> 
> I guess vertical subsampling is handled distinctly?
> (perhaps the height of the plane or such?)

Vertical subsampling doesn't affect the pitch, so there's no specific
constraint there.

> >  	}, {
> >  		.fourcc = DRM_FORMAT_YVU420,
> >  		.v4l2 = V4L2_PIX_FMT_YVU420M,
> >  		.bpp = 12,
> >  		.planes = 3,
> > +		.hsub = 2,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_YUV422,
> >  		.v4l2 = V4L2_PIX_FMT_YUV422M,
> >  		.bpp = 16,
> >  		.planes = 3,
> > +		.hsub = 2,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_YVU422,
> >  		.v4l2 = V4L2_PIX_FMT_YVU422M,
> >  		.bpp = 16,
> >  		.planes = 3,
> > +		.hsub = 2,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_YUV444,
> >  		.v4l2 = V4L2_PIX_FMT_YUV444M,
> >  		.bpp = 24,
> >  		.planes = 3,
> > +		.hsub = 1,
> >  	}, {
> >  		.fourcc = DRM_FORMAT_YVU444,
> >  		.v4l2 = V4L2_PIX_FMT_YVU444M,
> >  		.bpp = 24,
> >  		.planes = 3,
> > +		.hsub = 1,
> >  	},
> >  };
> >  
> 
> I wonder when we can have a global/generic set of format tables so that
> all of this isn't duplicated on a per-driver basis.

Note that this table also contains register values, so at least that
part will need to be kept. For the rest, do you mean a 4CC library that
would be shared between DRM/KMS and V4L2 ? That's a great idea. Too bad
it has been shot down when patches were submitted :-S

> > @@ -311,6 +351,7 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> >  {
> >  	struct rcar_du_device *rcdu = dev->dev_private;
> >  	const struct rcar_du_format_info *format;
> > +	unsigned int chroma_pitch;
> >  	unsigned int max_pitch;
> >  	unsigned int align;
> >  	unsigned int i;
> > @@ -353,8 +394,17 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> >  		return ERR_PTR(-EINVAL);
> >  	}
> >  
> > +	/*
> > +	 * Calculate the chroma plane(s) pitch using the horizontal subsampling
> > +	 * factor. For semi-planar formats, the U and V planes are combined, the
> > +	 * pitch must thus be doubled.
> > +	 */
> > +	chroma_pitch = mode_cmd->pitches[0] / format->hsub;
> > +	if (format->planes == 2)
> > +		chroma_pitch *= 2;
> > +
> >  	for (i = 1; i < format->planes; ++i) {
> > -		if (mode_cmd->pitches[i] != mode_cmd->pitches[0]) {
> > +		if (mode_cmd->pitches[i] != chroma_pitch) {
> >  			dev_dbg(dev->dev,
> >  				"luma and chroma pitches do not match\n");
> 
> Is this statement still sufficient?
> I'd perhaps say 'are not compatible' or 'are not correct'. - but its
> only a debug print, so it really doesn't matter.

I like "are not compatible", I'll switch to that.

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> >  			return ERR_PTR(-EINVAL);
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
> > index 0346504d8c59..8f5fff176754 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
> > @@ -22,6 +22,7 @@ struct rcar_du_format_info {
> >  	u32 v4l2;
> >  	unsigned int bpp;
> >  	unsigned int planes;
> > +	unsigned int hsub;
> >  	unsigned int pnmr;
> >  	unsigned int edf;
> >  };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
