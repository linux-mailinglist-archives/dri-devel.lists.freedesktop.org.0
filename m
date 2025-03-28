Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A42A7483A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 11:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6633510E9CF;
	Fri, 28 Mar 2025 10:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mn3jL0hf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC8910E9CF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 10:28:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 296EF752;
 Fri, 28 Mar 2025 11:26:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1743157587;
 bh=OTwI9aGqFKxdOoAi9IRebrULyZqV3oGbyNLGr/YD3+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mn3jL0hf/e80kH2AjGhu3uy3ViQOOYxjuLq+tx/E8kMGOOoBPtvBZAYtnb1mI3EA8
 6Pm9/pWynXpTNYkcknaMy2BwPzB3x0KeRELYNZHIHDfjKsh2nV0tqgtIgpBTclUMfg
 uMF48BhYkFQGqt4EEdwiPhMHX1rO0AgBOh+A6ngU=
Date: Fri, 28 Mar 2025 12:27:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
Message-ID: <20250328102752.GA2639@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-2-322a300c6d72@ideasonboard.com>
 <20250327223449.GA16629@pendragon.ideasonboard.com>
 <5282b9f9-edef-45fd-8228-16096981a11a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5282b9f9-edef-45fd-8228-16096981a11a@ideasonboard.com>
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

On Fri, Mar 28, 2025 at 12:05:40PM +0200, Tomi Valkeinen wrote:
> On 28/03/2025 00:34, Laurent Pinchart wrote:
> > On Wed, Mar 26, 2025 at 03:22:45PM +0200, Tomi Valkeinen wrote:
> >> Add two new pixel formats:
> >>
> >> DRM_FORMAT_XV15 ("XV15")
> >> DRM_FORMAT_XV20 ("XV20")
> >>
> >> The formats are 2 plane 10 bit per component YCbCr, with the XV15 2x2
> >> subsampled whereas XV20 is 2x1 subsampled.
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/drm_fourcc.c  | 6 ++++++
> >>   include/uapi/drm/drm_fourcc.h | 8 ++++++++
> >>   2 files changed, 14 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> >> index 2f5781f5dcda..e101d1b99aeb 100644
> >> --- a/drivers/gpu/drm/drm_fourcc.c
> >> +++ b/drivers/gpu/drm/drm_fourcc.c
> >> @@ -346,6 +346,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >>   		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
> >>   		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> >>   		  .hsub = 2, .vsub = 2, .is_yuv = true},
> >> +		{ .format = DRM_FORMAT_XV15,		.depth = 0,  .num_planes = 2,
> >> +		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> >> +		  .hsub = 2, .vsub = 2, .is_yuv = true },
> >> +		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
> >> +		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> >> +		  .hsub = 2, .vsub = 1, .is_yuv = true },
> > 
> > It appears we can never have too much (or enough) documentation, as
> > reading the format info documentation leaves me with unanswered
> > questions.
> > 
> > Looking at drm_format_info_min_pitch():
> > 
> > uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
> > 				   int plane, unsigned int buffer_width)
> > {
> > 	if (!info || plane < 0 || plane >= info->num_planes)
> > 		return 0;
> > 
> > 	return DIV_ROUND_UP_ULL((u64)buffer_width * info->char_per_block[plane],
> > 			    drm_format_info_block_width(info, plane) *
> > 			    drm_format_info_block_height(info, plane));
> > }
> > 
> > For the first plane, the function will return `buffer_width * 4 / 3`
> > (rouding up), which I think is right. For the second plane, it will
> > return `buffer_width * 8 / 3`, which I believe is wrong as the format is
> > subsampled by a factor 2 horizontally. It seems that either
> > char_per_block and block_w need to take horizontal subsampling into
> > account (and therefore be 8 and 6 for the second plane), or
> > drm_format_info_min_pitch() should consider .hsub. Or there's something
> > else I'm missing :-)
> 
> The buffer_width is already divided by the hsub, in 
> drm_format_info_plane_width().

The function documentation doesn't clearly indicate if buffer_width is
the width of the buffer (as in the width of the first plane), or the
width of the requested plane. The variable name implies (for me) that
it's the width of the buffer, not the plane.

I've checked users of the function, and it seems to be a mess. The
following users pass the plane width to the function:

drivers/gpu/drm/drm_framebuffer.c
drivers/gpu/drm/drm_gem_framebuffer_helper.c
drivers/gpu/drm/tests/drm_format_test.c

However, the following users seem to pass the full buffer width:

drivers/gpu/drm/rockchip/rockchip_drm_vop.c
drivers/gpu/drm/tests/drm_format_helper_test.c

> >>   	};
> >>   
> >>   	unsigned int i;
> >> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> >> index 81202a50dc9e..1247b814bd66 100644
> >> --- a/include/uapi/drm/drm_fourcc.h
> >> +++ b/include/uapi/drm/drm_fourcc.h
> >> @@ -304,6 +304,14 @@ extern "C" {
> >>   #define DRM_FORMAT_RGB565_A8	fourcc_code('R', '5', 'A', '8')
> >>   #define DRM_FORMAT_BGR565_A8	fourcc_code('B', '5', 'A', '8')
> >>   
> >> +/*
> >> + * 2 plane 10 bit per component YCrCb
> >> + * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
> >> + * index 1 = Cb:Cr plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 2:10:10:10:2:10:10:10 little endian
> > 
> > I believe this is right, but I have a hard time validating it, as I
> > think the corresponding figures in UG1085 are incorrect (they show a
> > 8bpp format as far as I can tell). Do I assume correctly that you've
> > tested the formats ?
> 
> Yes. kms++'s master branch has support for all the formats in this series.
> 
>   Tomi

-- 
Regards,

Laurent Pinchart
