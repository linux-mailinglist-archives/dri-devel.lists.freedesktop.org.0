Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5760A1BA11
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 17:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246B010E9DC;
	Fri, 24 Jan 2025 16:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+SkvFqH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F8B10E9DC;
 Fri, 24 Jan 2025 16:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737735270; x=1769271270;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=R/dRMuxP5wgdeb43MyrhWkWxBuCDZuLh033znv6nNiU=;
 b=b+SkvFqHYY+MoEey+7gRYQRSn9IJviWlgSxFyUj3dMmEXOWDhVb9GMOO
 dH+FFZvBUGWMPc3YsDkdUEiC1h04UprLzGx8WX9Czwa/Snt/6vXj5NLzh
 eG69VCNfiOROjiztE2OtMv3QbqFnk4CivNTfuYhwCUOMDAV0WPgebSblY
 GKmUBXE0Dm62PqqagmXR6hv0aH+bnQ6gPzTVmCVhg3IQ5L0memofSPW2X
 JqS4E+/yZOSK+Zo0BeQH8zqK3kIavVKgK9k1Y+53BJG5nJbWeXly/gRxl
 G2o5RConQ/j8HbuZJJsDqLzH+7HX6GmEKNb0xtWuZc2kXSWE7EmdZ+pa1 Q==;
X-CSE-ConnectionGUID: +3Ro70j4RMadXG5YTUH0Ww==
X-CSE-MsgGUID: YB/ywoO1S7K+UETMQtjhgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="42198349"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="42198349"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 08:14:30 -0800
X-CSE-ConnectionGUID: rTpXLy7xRoyhH7S6HkcIbw==
X-CSE-MsgGUID: 1LbnTiR5SwirLQopPlQmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="107923480"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 24 Jan 2025 08:14:24 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 Jan 2025 18:14:23 +0200
Date: Fri, 24 Jan 2025 18:14:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/6] drm: introduce atomic_needs_modeset() callbacks
Message-ID: <Z5O8XwIWnvBObyd6@intel.com>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
 <Z5ODTg9iTjNKggzN@intel.com> <Z5OOo9yR7PVXXIj4@phenom.ffwll.local>
 <Z5ORyQ_49ZNmAxtq@intel.com> <Z5OzwxBUjEDr00w6@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5OzwxBUjEDr00w6@phenom.ffwll.local>
X-Patchwork-Hint: comment
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

On Fri, Jan 24, 2025 at 04:37:39PM +0100, Simona Vetter wrote:
> On Fri, Jan 24, 2025 at 03:12:41PM +0200, Ville Syrjälä wrote:
> > On Fri, Jan 24, 2025 at 01:59:15PM +0100, Simona Vetter wrote:
> > > On Fri, Jan 24, 2025 at 02:10:54PM +0200, Ville Syrjälä wrote:
> > > > On Fri, Jan 24, 2025 at 01:14:18PM +0200, Dmitry Baryshkov wrote:
> > > > > There are several drivers which attempt to upgrading the commit to the
> > > > > full mode set from their per-object atomic_check() callbacks without
> > > > > calling the drm_atomic_helper_check_modeset() or
> > > > > drm_atomic_helper_check() again (as requested by those functions).
> > > > 
> > > > I don't really understand why any of that is supposedly necessary.
> > > > drm_atomic_helper_check_modeset() is really all about the
> > > > connector routing stuff, so if none of that is changing then there
> > > > is no point in calling it again. Eg. in i915 we call it just at
> > > > the start, and later on we flag internal modesets all over the
> > > > place, but none of those need drm_atomic_helper_check_modeset()
> > > > because nothing routing related will have changed.
> > > 
> > > i915 doesn't need this because as you say, it doesn't rely on the atomic
> > > helper modeset tracking much at all, but it's all internal. This is for
> > > drivers which rely more or less entirely on
> > > drm_atomic_crtc_needs_modeset().
> > > 
> > > Also note that it's not just about connector routing, but about adding all
> > > the necessary additional states with
> > > drm_atomic_add_affected_connectors/planes and re-running all the various
> > > state computation hooks for those. Again i915 hand-rolls that all.
> > 
> > IIRC it only runs the connectors' atomic_check(),
> > nothing else really. But maybe that's changed since I last
> > looked at it.
> 
> It calls into connector/bridge/crtc callbacks related to modesets and mode
> validation.

The pre-atomic mode_fixup stuff? Are people still using that in
atomic drivers? Hmm, it does look like someone added some real
atomic_check() calls in there, which is a slightly surprising
place to find them.

> 
> The thing is a few hundred lines in total if you include all the split out
> subfunctions. Like the kerneldoc pretty clearly spells out that it does a
> lot more than what you've listed here. Just i915 doesn't used most of
> that.

In my book a function should do one thing. And if you do have some
kind of massive dispatcher function then it should be very abstract
and just call some smaller functions to do each step.
tldr; I don't like any function that doesn't fit on my screen.

Anyways, my main worry is that someone adds some new logic/checks
somewhere that assumes that you can't flag modesets later without
calling the helper. Which is clearly not correct. Eg. most of the
modesets we do are just done to get the hardware turned off while
we reprogram some global resource that doesn't know how to
synchronize with active pipes, not because anything changed that
would need further checks/recomputation/etc.

> 
> > Anyways it feels like we're throwing everything and the
> > kitchen sink into a single function here. Maybe it should be
> > split into two or more functions with clear responsibilities?
> 
> I'm not sure you can split it up much, because modesetting is complicated.
> Like even if you'd want to split out just the routing update logic that's
> a pretty big mess with a bunch of callbacks so that we can pick the right
> encoders to add the right bridges. And then have a 2nd function that does
> the actual state computation/validation.
> 
> Not sure that's worth it, since only benefit would be for drivers like
> i915 that almost entirely hand-roll their own atomic check flow and really
> only need the connector routing bits. I guess if you're bored you could
> give it a stab.

Yeah, I guess I could try to carve it up a bit when I get bored
with other stuff.

> -Sima
> 
> > 
> > > 
> > > So yeah i915 doesn't need this.
> > > -Sima
> > > 
> > > > 
> > > > > 
> > > > > As discussed on IRC, add separate atomic_needs_modeset() callbacks,
> > > > > whose only purpose is to allow the plane, connector, encoder or CRTC to
> > > > > specify that for whatever reasons corresponding CRTC should undergo a
> > > > > full modeset. The helpers will call these callbacks in a proper place,
> > > > > adding affected objects and calling required functions as required.
> > > > > 
> > > > > The MSM patches depend on the msm-next tree and the series at [1]. The
> > > > > plan is to land core changes through drm-misc, then merge drm-misc-next
> > > > > into msm-next and merge remaining msm-specific patches through the
> > > > > msm-next tree.
> > > > > 
> > > > > [1] https://lore.kernel.org/dri-devel/20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org/
> > > > > 
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > > Dmitry Baryshkov (6):
> > > > >       drm/atomic-helper: add atomic_needs_modeset callbacks
> > > > >       drm/mgag200: move format check to drm_plane_helper.atomic_needs_modeset
> > > > >       drm/msm/dpu: stop upgrading commits by enabling allow_modeset
> > > > >       drm/msm/dpu: move CTM check to drm_crtc_helper.atomic_needs_modeset
> > > > >       drm/msm/dpu: use atomic_needs_modeset for CDM check
> > > > >       drm/msm: drop msm_atomic_check wrapper
> > > > > 
> > > > >  drivers/gpu/drm/drm_atomic_helper.c         | 59 ++++++++++++++++++
> > > > >  drivers/gpu/drm/mgag200/mgag200_drv.h       |  2 +
> > > > >  drivers/gpu/drm/mgag200/mgag200_mode.c      | 27 ++++++---
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 15 +++++
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++-----
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 --
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 --------
> > > > >  drivers/gpu/drm/msm/msm_atomic.c            | 29 ---------
> > > > >  drivers/gpu/drm/msm/msm_drv.h               |  1 -
> > > > >  drivers/gpu/drm/msm/msm_kms.c               |  2 +-
> > > > >  drivers/gpu/drm/msm/msm_kms.h               |  7 ---
> > > > >  include/drm/drm_modeset_helper_vtables.h    | 92 +++++++++++++++++++++++++++++
> > > > >  12 files changed, 219 insertions(+), 89 deletions(-)
> > > > > ---
> > > > > base-commit: 0936f0e54426177b0f0263ddf806ed5e13487db6
> > > > > change-id: 20250123-atomic-needs-modeset-8f6a8243a3f7
> > > > > prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
> > > > > prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
> > > > > prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
> > > > > prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
> > > > > prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
> > > > > 
> > > > > Best regards,
> > > > > -- 
> > > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > 
> > > > -- 
> > > > Ville Syrjälä
> > > > Intel
> > > 
> > > -- 
> > > Simona Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > 
> > -- 
> > Ville Syrjälä
> > Intel
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Ville Syrjälä
Intel
