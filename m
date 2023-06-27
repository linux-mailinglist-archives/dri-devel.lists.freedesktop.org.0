Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 692C373FF34
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 17:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65EB10E301;
	Tue, 27 Jun 2023 15:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5724210E301;
 Tue, 27 Jun 2023 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687878261; x=1719414261;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2kiMALa71HEycvMDz7/YVI/SaGRhthJvggrF90y7KH0=;
 b=agvrhRxVcdIy7F/yKwMb5SViEjKsrYzJqYcO1/PfpplZyR/48dxybNcF
 FuiiXVghcReZD+5NLaAbllAmXh+BfiIMx7V68STszm1AhDXVxFWISV/0t
 uRZ6xFPuFFF3jkqU6oVJDdFwyPFgYA6KOaD1JinlbzGgBdvmz9erBwFWX
 mXHn9p8gEO05aYzMlsPfbh+71ypxc0xd6ZN7EjceAH+ib8cmE+AK8ZipJ
 kKsHq4LE1guhhxgkSwWdmuIiZcYM8Inig3/GTc+aawJewMCUxbcy0xduj
 yWkWx8mq17xwRq7tXx9wC+zkU0+uchSafDPMiSv8iFLutXmst1kMF4Zyb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="341933672"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="341933672"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 08:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963215417"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="963215417"
Received: from malashi-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.48.28])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 08:04:13 -0700
Date: Tue, 27 Jun 2023 17:04:09 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v8 1/2] drm/i915: preparation for using PAT index
Message-ID: <ZJr6aRb8SrLug7SQ@ashyti-mobl2.lan>
References: <20230509165200.1740-1-fei.yang@intel.com>
 <20230509165200.1740-2-fei.yang@intel.com>
 <874jmtt4pb.fsf@intel.com>
 <b22c7111-0587-19b5-d912-9d07b81d2bb0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b22c7111-0587-19b5-d912-9d07b81d2bb0@linux.intel.com>
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
Cc: fei.yang@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani and Tvrtko,

> > > This patch is a preparation for replacing enum i915_cache_level with PAT
> > > index. Caching policy for buffer objects is set through the PAT index in
> > > PTE, the old i915_cache_level is not sufficient to represent all caching
> > > modes supported by the hardware.
> > > 
> > > Preparing the transition by adding some platform dependent data structures
> > > and helper functions to translate the cache_level to pat_index.
> > > 
> > > cachelevel_to_pat: a platform dependent array mapping cache_level to
> > >                     pat_index.
> > > 
> > > max_pat_index: the maximum PAT index recommended in hardware specification
> > >                 Needed for validating the PAT index passed in from user
> > >                 space.
> > > 
> > > i915_gem_get_pat_index: function to convert cache_level to PAT index.
> > > 
> > > obj_to_i915(obj): macro moved to header file for wider usage.
> > > 
> > > I915_MAX_CACHE_LEVEL: upper bound of i915_cache_level for the
> > >                        convenience of coding.
> > > 
> > > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > 
> > [snip]
> > 
> > > diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > > index f6a7c0bd2955..0eda8b4ee17f 100644
> > > --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > > +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > > @@ -123,7 +123,9 @@ struct drm_i915_private *mock_gem_device(void)
> > >   	static struct dev_iommu fake_iommu = { .priv = (void *)-1 };
> > >   #endif
> > >   	struct drm_i915_private *i915;
> > > +	struct intel_device_info *i915_info;
> > >   	struct pci_dev *pdev;
> > > +	unsigned int i;
> > >   	int ret;
> > >   	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
> > > @@ -180,6 +182,13 @@ struct drm_i915_private *mock_gem_device(void)
> > >   		I915_GTT_PAGE_SIZE_2M;
> > >   	RUNTIME_INFO(i915)->memory_regions = REGION_SMEM;
> > > +
> > > +	/* simply use legacy cache level for mock device */
> > > +	i915_info = (struct intel_device_info *)INTEL_INFO(i915);
> > 
> > This is not okay. It's not okay to modify device info at runtime. This
> > is why we've separated runtime info from device info. This is why we've
> > made device info const, and localized the modifications to a couple of
> > places.
> > 
> > If you need to modify it, it belongs in runtime info. Even if it's only
> > ever modified for mock devices.
> > 
> > We were at the brink of being able to finally convert INTEL_INFO() into
> > a pointer to const rodata [1], where you are unable to modify it, but
> > this having been merged as commit 5e352e32aec2 ("drm/i915: preparation
> > for using PAT index") sets us back. (With [1] this oopses trying to
> > modify read-only data.)
> > 
> > This has been posted to the public list 20+ times, and nobody noticed or
> > pointed this out?!

That's not cool, indeed.

> > Throwing away const should be a huge red flag to any developer or
> > reviewer. Hell, *any* cast should be.
> > 
> > I've got a patch ready moving cachelevel_to_pat and max_pat_index to
> > runtime info. It's not great, since we'd be doing it only for the mock
> > device. Better ideas? I'm not waiting long.
> > 
> > 
> > BR,
> > Jani.
> > 
> > 
> > [1] https://patchwork.freedesktop.org/patch/msgid/0badc36ce6dd6b030507bdfd8a42ab984fb38d12.1686236840.git.jani.nikula@intel.com
> > 
> > 
> > > +	i915_info->max_pat_index = 3;
> > > +	for (i = 0; i < I915_MAX_CACHE_LEVEL; i++)
> > > +		i915_info->cachelevel_to_pat[i] = i;
> > > +
> 
> I'd simply suggest having a local static const table for the mock device. It
> should be trivial once i915->__info becomes a pointer so in that series I
> guess.

Fei... do you have bandwidth to look into this or do you want me
to try Tvrtko's suggestion out?

Thank you Jani for reporting it and thank you Tvrtko for
proposing the fix.

Andi
