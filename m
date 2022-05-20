Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E5852F49B
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 22:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0906C10E70C;
	Fri, 20 May 2022 20:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021B110E512;
 Fri, 20 May 2022 20:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653079361; x=1684615361;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kxo40n+56M15FDOQoRl0gr0bB7E9LzLiW1zJVSjYl8k=;
 b=Ejoauvcbx/4yqdJR/fVQK7dyvhfUHAjw9NTt5cJ1Xgh4fMMa3+0BtI+8
 0FHYapV+b0EGzLfynPQdiKVyIgNJOoH+ajlgNk6USNp4tBNdUOtomRe7a
 2x2/RopQgLfPfZoW0KLdSIzZS9c/GgliEPXx/S2Czwdo4EFn26IHWcmof
 KDXuTTSszBjGE4mDLzm7bFka/Z3FrzJOyBUPsvNL0TYS8cPgLBOOq8Wzi
 2mJTKjgBRMY4XfdAtnMZsNpfk6zJU5VhkoUdGUxqzBO3Tq5RtHIyJgkvX
 0PhXW50JZ66Javf5BdGZ6R25mTZWqWuXKt3j4Y7e6wcl05BUrUma0itrD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270315675"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270315675"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 13:42:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="628347507"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 13:42:40 -0700
Date: Fri, 20 May 2022 13:42:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 2/6] drm/i915/xehp: Drop GETPARAM lookups of
 I915_PARAM_[SUB]SLICE_MASK
Message-ID: <Yof9PwfBVpWnMqIn@mdroper-desk1.amr.corp.intel.com>
References: <20220517032005.2694737-1-matthew.d.roper@intel.com>
 <20220517032005.2694737-3-matthew.d.roper@intel.com>
 <4123b22d-5018-bb08-4ae0-99140225dc1a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4123b22d-5018-bb08-4ae0-99140225dc1a@linux.intel.com>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 20, 2022 at 10:15:32AM +0100, Tvrtko Ursulin wrote:
> 
> On 17/05/2022 04:20, Matt Roper wrote:
> > Slice/subslice/EU information should be obtained via the topology
> > queries provided by the I915_QUERY interface; let's turn off support for
> > the old GETPARAM lookups on Xe_HP and beyond where we can't return
> > meaningful values.
> > 
> > The slice mask lookup is meaningless since Xe_HP doesn't support
> > traditional slices (and we make no attempt to return the various new
> > units like gslices, cslices, mslices, etc.) here.
> > 
> > The subslice mask lookup is even more problematic; given the distinct
> > masks for geometry vs compute purposes, the combined mask returned here
> > is likely not what userspace would want to act upon anyway.  The value
> > is also limited to 32-bits by the nature of the GETPARAM ioctl which is
> > sufficient for the initial Xe_HP platforms, but is unable to convey the
> > larger masks that will be needed on other upcoming platforms.  Finally,
> > the value returned here becomes even less meaningful when used on
> > multi-tile platforms where each tile will have its own masks.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/i915/i915_getparam.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> > index c12a0adefda5..ac9767c56619 100644
> > --- a/drivers/gpu/drm/i915/i915_getparam.c
> > +++ b/drivers/gpu/drm/i915/i915_getparam.c
> > @@ -148,11 +148,19 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
> >   		value = intel_engines_has_context_isolation(i915);
> >   		break;
> >   	case I915_PARAM_SLICE_MASK:
> > +		/* Not supported from Xe_HP onward; use topology queries */
> > +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> > +			return -EINVAL;
> > +
> >   		value = sseu->slice_mask;
> >   		if (!value)
> >   			return -ENODEV;
> >   		break;
> >   	case I915_PARAM_SUBSLICE_MASK:
> > +		/* Not supported from Xe_HP onward; use topology queries */
> > +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> > +			return -EINVAL;
> > +
> >   		/* Only copy bits from the first slice */
> >   		memcpy(&value, sseu->subslice_mask,
> >   		       min(sseu->ss_stride, (u8)sizeof(value)));
> 
> Just in case lets run this by Jordan and Lionel since it affects DG2. Anyone
> else on the userspace side who might be affected?

When I grep'd Mesa, I found two uses of I915_PARAM_SLICE_MASK and
I915_PARAM_SUBSLICE_MASK:

 * oa_metrics_kernel_support:  The topology query is used on gen10+ so
   the getparam code is only called on gen9 and below

 * getparam_topology:  Invoked via intel_get_device_info_from_fd().  The
   topology query is attempted first.  Only if that fails _and_ we're on
   a pre-gen10 platform does it fall back to GETPARAM.

I also checked https://github.com/intel/compute-runtime and only see
these being issued in one place:

 * HwInfoConfig::configureHwInfoDrm:  Only used if drm->queryTopology()
   returns a failure first.


I think those are the only relevant userspace for SSEU topology, so as
far as I can tell nobody is still relying on the legacy getparams by the
time we get to Xe_HP hardware.


Matt

> 
> Regards,
> 
> Tvrtko

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
