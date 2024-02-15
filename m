Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7878569F0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 17:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFCE10E9EA;
	Thu, 15 Feb 2024 16:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbUF4Cei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBFA10E9E4;
 Thu, 15 Feb 2024 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708015720; x=1739551720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xgq4Ds/kAjzWrXkDesVD/FKc1lwyP5obgf32WIjrkRg=;
 b=hbUF4CeidLRg/cMKKQpjqdOItfYWXw0c/yScb09K4d79YJ1nlhkP00oh
 GJfp0TMyeNJxhQc+QSvj3WTWVvbDi6+/imHP0skoagjXsmJexAQga8dhR
 trq/aNhOvtVfVxw0M6OBlJWgUEuAuAh13foOREnu4xxryHtGt/62zEAzG
 f6dFm3MXpvUHHGbKcWe0ryvmbqqFMxr+8q8evWJsNlNSHxnY+3m39ynqE
 1HpBVOhBNhiiS9J3KF26vK12HNDafgCPlBJmT2QsnGFsvKut1TegR++17
 0pajILlcARi11giKUt1nN/blnbS9irS5S6YK8Pc/axfkZF0UCQ3beanIp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2253787"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2253787"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:48:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="826435556"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="826435556"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Feb 2024 08:48:37 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Feb 2024 18:48:36 +0200
Date: Thu, 15 Feb 2024 18:48:36 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>
Subject: Re: [RFC 0/5] Introduce drm sharpening property
Message-ID: <Zc5AZKR3yZGcCoat@intel.com>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
 <640e06ab-73f6-450a-97c2-8ef2e9ebe8b7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <640e06ab-73f6-450a-97c2-8ef2e9ebe8b7@amd.com>
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

On Thu, Feb 15, 2024 at 11:37:54AM -0500, Harry Wentland wrote:
> Adding a couple of compositor devs as they might be interested in this.
> 
> On 2024-02-14 06:24, Nemesa Garg wrote:
> > 	Many a times images are blurred or upscaled content is also not as
> > crisp as original rendered image. Traditional sharpening techniques often
> > apply a uniform level of enhancement across entire image, which sometimes
> > result in over-sharpening of some areas and potential loss of natural details. 
> > 
> > Intel has come up with Display Engine based adaptive sharpening filter 
> > with minimal power and performance impact. From LNL onwards, the Display
> > hardware can use one of the pipe scaler for adaptive sharpness filter.
> > This can be used for both gaming and non-gaming use cases like photos,
> > image viewing. It works on a region of pixels depending on the tap size.
> > 
> > This RFC is an attempt to introduce an adaptive sharpness solution which
> > helps in improving the image quality. For this new CRTC property is added.
> 
> I don't think CRTC is the right place for this. Scaling tends to be more
> of a plane thing. Planes can be scaled independently, or is that not the
> case for Intel? Or does Intel HW do this sharpening operation independent
> of any scaling, on the entire output?

We can scale either individual planes, or the entire crtc.

> 
> > The user can set this property with desired sharpness strength value with
> > 0-255. A value of 1 representing minimum sharpening strength and 255
> > representing maximum sharpness strength. A strength value of 0 means no
> > sharpening or sharpening feature disabled.
> > It works on a region of pixels depending on the tap size. The coefficients
> > are used to generate an alpha value which is used to blend the sharpened
> > image to original image.
> >  
> > Userspace implementation for sharpening feature and IGT implementation
> > is in progress.
> 
> It would be very helpful to have an idea how this looks in userspace, and
> which compositors will implement this.

Someone will probably need to spend some real time thinking
how this interacts with the scaling filter propery (eg. if
we want to extend that property with new values) and
the laptop panel scaling mode property. We also want to
implement the margin properties for external displays
which also involves scaling. Ie. we need some kind of
consistent story how all those things will work together.

> 
> Harry
> 
> > 
> > Nemesa Garg (5):
> >   drm: Introduce sharpeness mode property
> >   drm/i915/display/: Compute the scaler filter coefficients
> >   drm/i915/dispaly/: Enable the second scaler
> >   drm/i915/display/: Add registers and compute the strength
> >   drm/i915/display: Load the lut values and enable sharpness
> > 
> >  drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
> >  drivers/gpu/drm/drm_crtc.c                    |  17 ++
> >  drivers/gpu/drm/i915/Makefile                 |   1 +
> >  drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
> >  drivers/gpu/drm/i915/display/intel_display.c  |  20 +-
> >  .../drm/i915/display/intel_display_types.h    |  11 +
> >  .../drm/i915/display/intel_modeset_verify.c   |   1 +
> >  .../drm/i915/display/intel_sharpen_filter.c   | 214 ++++++++++++++++++
> >  .../drm/i915/display/intel_sharpen_filter.h   |  31 +++
> >  drivers/gpu/drm/i915/display/skl_scaler.c     |  86 ++++++-
> >  drivers/gpu/drm/i915/display/skl_scaler.h     |   1 +
> >  drivers/gpu/drm/i915/i915_reg.h               |  19 ++
> >  drivers/gpu/drm/xe/Makefile                   |   1 +
> >  include/drm/drm_crtc.h                        |  17 ++
> >  14 files changed, 416 insertions(+), 10 deletions(-)
> >  create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> >  create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> > 

-- 
Ville Syrjälä
Intel
