Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B59E3E3385
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 07:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F036E093;
	Sat,  7 Aug 2021 05:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9D96E08C;
 Sat,  7 Aug 2021 05:02:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="212623634"
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="212623634"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 22:02:24 -0700
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="482016359"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 22:02:23 -0700
Date: Fri, 6 Aug 2021 22:02:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Disable bonding on gen12+ platforms
Message-ID: <20210807050222.GP1556418@mdroper-desk1.amr.corp.intel.com>
References: <20210728192100.132425-1-matthew.brost@intel.com>
 <23d6e809-1d6e-ae35-1aee-e6f0c8c90419@intel.com>
 <CAKMK7uGt3xcquCAkoMNhF4=yVPQpVpWM7zKS8jPQ=wzha-VPfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGt3xcquCAkoMNhF4=yVPQpVpWM7zKS8jPQ=wzha-VPfA@mail.gmail.com>
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

On Fri, Aug 06, 2021 at 08:54:59PM +0200, Daniel Vetter wrote:
> On Fri, Aug 6, 2021 at 8:25 PM John Harrison <john.c.harrison@intel.com> wrote:
> > On 7/28/2021 12:21, Matthew Brost wrote:
> > > Disable bonding on gen12+ platforms aside from ones already supported by
> > > the i915 - TGL, RKL, and ADL-S.
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_context.c | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > index 05c3ee191710..9c3672bac0e2 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > @@ -446,6 +446,13 @@ set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
> > >       u16 idx, num_bonds;
> > >       int err, n;
> > >
> > > +     if (GRAPHICS_VER(i915) >= 12 && !IS_TIGERLAKE(i915) &&
> > > +         !IS_ROCKETLAKE(i915) && !IS_ALDERLAKE_S(i915)) {
> > > +             drm_dbg(&i915->drm,
> > > +                     "Bonding on gen12+ aside from TGL, RKL, and ADL_S not allowed\n");
> > I would have said not supported rather than not allowed. Either way:
> > Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> 
> Either is fine with me.
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 

Applied to drm-intel-gt-next (with the suggested debug message wording
tweak).  Thanks for the patch and reviews.


Matt

> >
> > > +             return -ENODEV;
> > > +     }
> > > +
> > >       if (get_user(idx, &ext->virtual_index))
> > >               return -EFAULT;
> > >
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
