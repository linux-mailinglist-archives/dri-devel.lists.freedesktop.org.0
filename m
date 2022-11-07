Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE225620348
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 00:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0BD10E654;
	Mon,  7 Nov 2022 23:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CC010E5F8;
 Mon,  7 Nov 2022 23:07:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 133C0492;
 Tue,  8 Nov 2022 00:06:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1667862419;
 bh=N0sUr1gASY7tZbY60ADDHkTFGTrQM54JT8hf8XPS7DA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MmJTxFiCxVhUcC7KkJl56G9rUGL2Qai4zH66EbEGE/pY61UqOZQ0bdTVErENaMBZI
 612iucMMpAOtQ+e20W/Vyj7VxrenUeEE51phbTPSxrpY6TTttfWPurl4aya9rdq0+k
 VUeiEchPrXCvG+HDSAMpg1E7+p3C7WRwTL0XS0KQ=
Date: Tue, 8 Nov 2022 01:06:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Message-ID: <Y2mPgB4LoOqhhOUe@pendragon.ideasonboard.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2leZDfLj/5963wl@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 daniel.vetter@ffwll.ch, dmitry.baryshkov@linaro.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 09:37:08PM +0200, Ville Syrjälä wrote:
> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
> > Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
> > properties. When the color fill value is set, and the framebuffer is set
> > to NULL, memory fetch will be disabled.
> 
> Thinking a bit more universally I wonder if there should be
> some kind of enum property:
> 
> enum plane_pixel_source {
> 	FB,
> 	COLOR,
> 	LIVE_FOO,
> 	LIVE_BAR,
> 	...
> }

That's something I could use on (older) Renesas hardware, where planes
can be fed with a live source. The issue there is that the live source
is a compositor with multiple inputs, handled through the V4L2 API. How
to synchronize the configuration of the compositor and the display
engine is an unsolved problem at the moment, but it could be solved
another day.

> > In addition, loosen the NULL FB checks within the atomic commit callstack
> > to allow a NULL FB when color_fill is nonzero and add FB checks in
> > methods where the FB was previously assumed to be non-NULL.
> > 
> > Finally, have the DPU driver use drm_plane_state.color_fill and
> > drm_plane_state.color_fill_format instead of dpu_plane_state.color_fill,
> > and add extra checks in the DPU atomic commit callstack to account for a
> > NULL FB in cases where color_fill is set.
> > 
> > Some drivers support hardware that have optimizations for solid fill
> > planes. This series aims to expose these capabilities to userspace as
> > some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > hardware composer HAL) that can be set by apps like the Android Gears
> > app.
> > 
> > Userspace can set the color_fill value by setting COLOR_FILL_FORMAT to a
> > DRM format, setting COLOR_FILL to a color fill value, and setting the
> > framebuffer to NULL.
> 
> Is there some real reason for the format property? Ie. why not 
> just do what was the plan for the crttc background color and
> specify the color in full 16bpc format and just pick as many
> msbs from that as the hw can use?
> 
> > Jessica Zhang (3):
> >   drm: Introduce color fill properties for drm plane
> >   drm: Adjust atomic checks for solid fill color
> >   drm/msm/dpu: Use color_fill property for DPU planes
> > 
> >  drivers/gpu/drm/drm_atomic.c              | 68 ++++++++++++-----------
> >  drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
> >  drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
> >  drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
> >  drivers/gpu/drm/drm_plane.c               |  8 +--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++--------
> >  include/drm/drm_atomic_helper.h           |  5 +-
> >  include/drm/drm_blend.h                   |  2 +
> >  include/drm/drm_plane.h                   | 28 ++++++++++
> >  10 files changed, 188 insertions(+), 76 deletions(-)

-- 
Regards,

Laurent Pinchart
