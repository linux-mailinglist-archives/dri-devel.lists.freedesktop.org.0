Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC04C651EF6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F0E10E37C;
	Tue, 20 Dec 2022 10:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778A110E37C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 10:38:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 993F6706;
 Tue, 20 Dec 2022 11:38:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671532692;
 bh=dW9PTl4LC3ZcOm93shBjw6Hd1WDCPYX4VDPRhWRLioI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VWFj0sTEIa/rGrDH/13nI0rbYRG4Si8vJbplCZWSwy1EPY7Kq1mMN9otkZcQnp8FY
 leysHDGgU7bEHvpoWl+tr/bvd9mDtxIIc9OCUSTm1CepCivOW7XTVAfCMAiBrBwTNl
 EfCqCoRxBzV2L7B/LjR7tG3JzG2278Szkv1lJR0Y=
Date: Tue, 20 Dec 2022 12:38:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 7/7] drm: rcar-du: Add new formats (2-10-10-10 ARGB,
 Y210)
Message-ID: <Y6GQkAa9k+ut000B@pendragon.ideasonboard.com>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6Db2C+JehUPYSQp@pendragon.ideasonboard.com>
 <2f252958-1bb1-006a-b450-1315be8a3c9f@xs4all.nl>
 <Y6F9+73YZOJX3tht@pendragon.ideasonboard.com>
 <c35c07ff-a3d8-bbaa-25e7-00938c8c75ba@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c35c07ff-a3d8-bbaa-25e7-00938c8c75ba@xs4all.nl>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Tue, Dec 20, 2022 at 10:26:35AM +0100, Hans Verkuil wrote:
> On 20/12/2022 10:18, Laurent Pinchart wrote:
> > On Tue, Dec 20, 2022 at 10:01:04AM +0100, Hans Verkuil wrote:
> >> On 19/12/2022 22:47, Laurent Pinchart wrote:
> >>> Hi Tomi,
> >>>
> >>> (CC'ing Sakari and Hans)
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Mon, Dec 19, 2022 at 04:01:39PM +0200, Tomi Valkeinen wrote:
> >>>> Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010 and Y210.
> >>>>
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>> ---
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 24 +++++++++++++
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 49 +++++++++++++++++++++++++--
> >>>>  2 files changed, 71 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>>> index 8c2719efda2a..8ccabf5a30c4 100644
> >>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>>> @@ -259,6 +259,24 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>>  		.bpp = 32,
> >>>>  		.planes = 1,
> >>>>  		.hsub = 1,
> >>>> +	}, {
> >>>> +		.fourcc = DRM_FORMAT_RGBX1010102,
> >>>
> >>> Ah, here the format makes sense.
> >>>
> >>>> +		.v4l2 = V4L2_PIX_FMT_XBGR2101010,
> >>>
> >>> But this is horrible :-( Could we use the same names as DRM for new
> >>> formats, when there is no conflict with existing V4L2 formats ?
> >>>
> >>> Sakari, Hans, what do you think ? Please see patch 1/7 in the series for
> >>> the format definitions.
> >>
> >> V4L2 describes pixel formats based on how they appear in memory from the
> >> lowest to highest memory address.
> >>
> >> If I am not mistaken, DRM uses the CPU order. So that explains the difference
> >> in naming. I don't think we should hide that difference. And V4L2 has been
> >> quite consistent in following memory ordering in the naming (except possibly
> >> for some of the really old pixelformats).
> > 
> > We depart from that rule with at least the following RGB formats:
> > 
> > V4L2_PIX_FMT_XBGR32
> > V4L2_PIX_FMT_BGRX32
> > V4L2_PIX_FMT_ABGR32
> > V4L2_PIX_FMT_BGRA32
> > 
> > While the following formats follow the rule:
> > 
> > V4L2_PIX_FMT_RGB24
> > V4L2_PIX_FMT_BGR24
> > V4L2_PIX_FMT_XRGB32
> > V4L2_PIX_FMT_RGBX32
> > V4L2_PIX_FMT_RGBA32
> > V4L2_PIX_FMT_ARGB32
> > 
> > For 16-bit RGB formats, we name them based on the order in a 16-bit word
> > which is then stored in memory in little endian (except for the formats
> > explicitly defined as big-endian):
> > 
> > #define V4L2_PIX_FMT_RGB444  v4l2_fourcc('R', '4', '4', '4') /* 16  xxxxrrrr ggggbbbb */
> > #define V4L2_PIX_FMT_ARGB444 v4l2_fourcc('A', 'R', '1', '2') /* 16  aaaarrrr ggggbbbb */
> > #define V4L2_PIX_FMT_XRGB444 v4l2_fourcc('X', 'R', '1', '2') /* 16  xxxxrrrr ggggbbbb */
> > #define V4L2_PIX_FMT_RGBA444 v4l2_fourcc('R', 'A', '1', '2') /* 16  rrrrgggg bbbbaaaa */
> > #define V4L2_PIX_FMT_RGBX444 v4l2_fourcc('R', 'X', '1', '2') /* 16  rrrrgggg bbbbxxxx */
> > #define V4L2_PIX_FMT_ABGR444 v4l2_fourcc('A', 'B', '1', '2') /* 16  aaaabbbb ggggrrrr */
> > #define V4L2_PIX_FMT_XBGR444 v4l2_fourcc('X', 'B', '1', '2') /* 16  xxxxbbbb ggggrrrr */
> > #define V4L2_PIX_FMT_BGRA444 v4l2_fourcc('G', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */
> > #define V4L2_PIX_FMT_BGRX444 v4l2_fourcc('B', 'X', '1', '2') /* 16  bbbbgggg rrrrxxxx */
> > #define V4L2_PIX_FMT_RGB555  v4l2_fourcc('R', 'G', 'B', 'O') /* 16  RGB-5-5-5     */
> > #define V4L2_PIX_FMT_ARGB555 v4l2_fourcc('A', 'R', '1', '5') /* 16  ARGB-1-5-5-5  */
> > #define V4L2_PIX_FMT_XRGB555 v4l2_fourcc('X', 'R', '1', '5') /* 16  XRGB-1-5-5-5  */
> > #define V4L2_PIX_FMT_RGBA555 v4l2_fourcc('R', 'A', '1', '5') /* 16  RGBA-5-5-5-1  */
> > #define V4L2_PIX_FMT_RGBX555 v4l2_fourcc('R', 'X', '1', '5') /* 16  RGBX-5-5-5-1  */
> > #define V4L2_PIX_FMT_ABGR555 v4l2_fourcc('A', 'B', '1', '5') /* 16  ABGR-1-5-5-5  */
> > #define V4L2_PIX_FMT_XBGR555 v4l2_fourcc('X', 'B', '1', '5') /* 16  XBGR-1-5-5-5  */
> > #define V4L2_PIX_FMT_BGRA555 v4l2_fourcc('B', 'A', '1', '5') /* 16  BGRA-5-5-5-1  */
> > #define V4L2_PIX_FMT_BGRX555 v4l2_fourcc('B', 'X', '1', '5') /* 16  BGRX-5-5-5-1  */
> > #define V4L2_PIX_FMT_RGB565  v4l2_fourcc('R', 'G', 'B', 'P') /* 16  RGB-5-6-5     */
> 
> Yes, these are all really old pixel formats :-)

Which ones do you consider new then ? :-) Even if we look at the 24-bit
and 32-bit RGB formats only (which are not very recent), its 40%/60%.

> > I would thus argue that, at least for RGB formats, naming them based on
> > the byte order in memory isn't such a clear cut rule. 
> > 
> >> Departing from that would be more of a hindrance than a help, IMHO.
> 
> Ideally we would unify the drm and v4l2 formats to new defines shared among
> the two subsystems. I believe that was attempted some years back. In the end,
> it was just decided to keep them separate, i.e. it wasn't worth the effort.
> 
> So unless someone wants to restart that idea, I think we should just stick to
> what we have today, warts and all.

Maxime proposed that and submitted an RFC If I recall correctly. I
really liked the idea, but it was shot down on maintenance issues (again
if I recall correctly) with concerns that the media tree would depend on
code outside of its direct control when adding new formats.

Still, even if we don't share any code, I think it's worth making new
formats identical between V4L2 and DRM (as in having the same 4CC value
and the same macro name, excluding the prefix, for the same format).

> >>>> +		.bpp = 32,
> >>>> +		.planes = 1,
> >>>> +		.hsub = 1,
> >>>> +	}, {
> >>>> +		.fourcc = DRM_FORMAT_RGBA1010102,
> >>>> +		.v4l2 = V4L2_PIX_FMT_ABGR2101010,
> >>>> +		.bpp = 32,
> >>>> +		.planes = 1,
> >>>> +		.hsub = 1,
> >>>> +	}, {
> >>>> +		.fourcc = DRM_FORMAT_ARGB2101010,
> >>>> +		.v4l2 = V4L2_PIX_FMT_BGRA1010102,
> >>>> +		.bpp = 32,
> >>>> +		.planes = 1,
> >>>> +		.hsub = 1,
> >>>>  	}, {
> >>>>  		.fourcc = DRM_FORMAT_YVYU,
> >>>>  		.v4l2 = V4L2_PIX_FMT_YVYU,
> >>>> @@ -307,6 +325,12 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>>  		.bpp = 24,
> >>>>  		.planes = 3,
> >>>>  		.hsub = 1,
> >>>> +	}, {
> >>>> +		.fourcc = DRM_FORMAT_Y210,
> >>>> +		.v4l2 = V4L2_PIX_FMT_Y210,
> >>>> +		.bpp = 32,
> >>>> +		.planes = 1,
> >>>> +		.hsub = 2,
> >>>>  	},
> >>>
> >>> Any reason why you'd not adding Y212 support already ?
> >>>
> >>>>  };
> >>>>  
> >>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> >>>> index e465aef41585..6f3e109a4f80 100644
> >>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> >>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> >>>> @@ -139,6 +139,42 @@ static const u32 rcar_du_vsp_formats[] = {
> >>>>  	DRM_FORMAT_YVU444,
> >>>>  };
> >>>>  
> >>>> +/*
> >>>> + * Gen4 supports the same formats as above, and additionally 2-10-10-10 RGB
> >>>> + * formats and Y210 format.
> >>>> + */
> >>>> +static const u32 rcar_du_vsp_formats_gen4[] = {
> >>>> +	DRM_FORMAT_RGB332,
> >>>> +	DRM_FORMAT_ARGB4444,
> >>>> +	DRM_FORMAT_XRGB4444,
> >>>> +	DRM_FORMAT_ARGB1555,
> >>>> +	DRM_FORMAT_XRGB1555,
> >>>> +	DRM_FORMAT_RGB565,
> >>>> +	DRM_FORMAT_BGR888,
> >>>> +	DRM_FORMAT_RGB888,
> >>>> +	DRM_FORMAT_BGRA8888,
> >>>> +	DRM_FORMAT_BGRX8888,
> >>>> +	DRM_FORMAT_ARGB8888,
> >>>> +	DRM_FORMAT_XRGB8888,
> >>>> +	DRM_FORMAT_RGBX1010102,
> >>>> +	DRM_FORMAT_RGBA1010102,
> >>>> +	DRM_FORMAT_ARGB2101010,
> >>>> +	DRM_FORMAT_UYVY,
> >>>> +	DRM_FORMAT_YUYV,
> >>>> +	DRM_FORMAT_YVYU,
> >>>> +	DRM_FORMAT_NV12,
> >>>> +	DRM_FORMAT_NV21,
> >>>> +	DRM_FORMAT_NV16,
> >>>> +	DRM_FORMAT_NV61,
> >>>> +	DRM_FORMAT_YUV420,
> >>>> +	DRM_FORMAT_YVU420,
> >>>> +	DRM_FORMAT_YUV422,
> >>>> +	DRM_FORMAT_YVU422,
> >>>> +	DRM_FORMAT_YUV444,
> >>>> +	DRM_FORMAT_YVU444,
> >>>> +	DRM_FORMAT_Y210,
> >>>> +};
> >>>> +
> >>>>  static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
> >>>>  {
> >>>>  	struct rcar_du_vsp_plane_state *state =
> >>>> @@ -436,14 +472,23 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
> >>>>  					 ? DRM_PLANE_TYPE_PRIMARY
> >>>>  					 : DRM_PLANE_TYPE_OVERLAY;
> >>>>  		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
> >>>> +		unsigned int num_formats;
> >>>> +		const u32 *formats;
> >>>> +
> >>>> +		if (rcdu->info->gen < 4) {
> >>>> +			num_formats = ARRAY_SIZE(rcar_du_vsp_formats);
> >>>> +			formats = rcar_du_vsp_formats;
> >>>> +		} else {
> >>>> +			num_formats = ARRAY_SIZE(rcar_du_vsp_formats_gen4);
> >>>> +			formats = rcar_du_vsp_formats_gen4;
> >>>> +		}
> >>>>  
> >>>>  		plane->vsp = vsp;
> >>>>  		plane->index = i;
> >>>>  
> >>>>  		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
> >>>>  					       crtcs, &rcar_du_vsp_plane_funcs,
> >>>> -					       rcar_du_vsp_formats,
> >>>> -					       ARRAY_SIZE(rcar_du_vsp_formats),
> >>>> +					       formats, num_formats,
> >>>>  					       NULL, type, NULL);
> >>>>  		if (ret < 0)
> >>>>  			return ret;

-- 
Regards,

Laurent Pinchart
