Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118124D7893
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 23:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1BD10E473;
	Sun, 13 Mar 2022 22:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF54710E251;
 Sun, 13 Mar 2022 22:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647209708; x=1678745708;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/R8eYm3rchiPFV/kZWa+1VW/Wt/l2/Fvqjh6Cg7TRsM=;
 b=JdyA0AWdcYSJHZUWME0tGnIQS+yYJReRiJeXGsPVui4USHlpEDeGc7LM
 3H1BZ5J/R2vOFDNJePlQgQ3z1kZF075P+bKNFbYUJ1doC3K4AJzmceWpg
 umpXgU7vU80Fvylt+tcB3emfBwLVgmcTFozaueD3YSoREBVNh6RNnj8IR
 tRHnj32FJHEFa5jcYh74zlG2xc8++e8xR1zJruJyCF7EowLCp2oz1Ypbg
 yhaPQSz8pOHLh3LF+L4yESek6MaCFm3/6ySDCY9U+BO8bnRjZ88I0uLpe
 4PwuFB6zgi/vEviKe0WOCa98aAzb7a+5oOout1JIR2/F7e5aZ8sAK+5F/ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="342328262"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; d="scan'208";a="342328262"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 15:15:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; d="scan'208";a="539712842"
Received: from gionascu-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.220.31])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 15:15:03 -0700
Date: Mon, 14 Mar 2022 00:15:00 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v5 5/7] drm/i915/gt: Create per-tile RC6 sysfs interface
Message-ID: <Yi5s5OVpv0kWeIrx@intel.intel>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-6-andi.shyti@linux.intel.com>
 <c9987c7e-8a3e-82e9-c934-093524043850@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9987c7e-8a3e-82e9-c934-093524043850@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

> > Now tiles have their own sysfs interfaces under the gt/
> > directory. Because RC6 is a property that can be configured on a
> > tile basis, then each tile should have its own interface
> > 
> > The new sysfs structure will have a similar layout for the 4 tile
> > case:
> > 
> > /sys/.../card0
> >           ├── gt
> >           │   ├── gt0
> >           │   │   ├── id
> >           │   │   ├── rc6_enable
> >           │   │   ├── rc6_residency_ms
> >           .   .   .
> >           .   .   .
> >           .   .
> >           │   └── gtN
> >           │       ├── id
> >           │       ├── rc6_enable
> >           │       ├── rc6_residency_ms
> >           │       .
> >           │       .
> >           │
> >           └── power/                -+
> >                ├── rc6_enable        |    Original interface
> >                ├── rc6_residency_ms  +->  kept as existing ABI;
> >                .                     |    it multiplexes over
> >                .                     |    the GTs
> >                                     -+
> > 
> > The existing interfaces have been kept in their original location
> > to preserve the existing ABI. They act on all the GTs: when
> > reading they provide the average value from all the GTs.
> 
> If ABI should be kept forever, depreciation msg should be removed from
> intel_gt_sysfs_get_drvdata.

yes... to be removed!

> > +#ifdef CONFIG_PM
> > +static s64
> > +sysfs_gt_attribute_r_func(struct device *dev, struct device_attribute *attr,
> > +			  s64 (func)(struct intel_gt *gt))
> > +{
> > +	struct intel_gt *gt;
> > +	s64 ret = 0;
> > +
> > +	if (!is_object_gt(&dev->kobj)) {
> > +		int i, num_gt = 0;
> > +		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
> > +
> > +		for_each_gt(gt, i915, i) {
> > +			ret += func(gt);
> > +			num_gt++;
> > +		}
> > +
> > +		ret /= num_gt;
> > +	} else {
> > +		gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> > +		ret = func(gt);
> > +	}
> > +
> > +	return ret;
> > +}
> 
> Return value is always converted to u32 or int, maybe we could use just int
> ?

there is one case when the value to be returned is an 'int' and
that is the "int intel_gpu_freq()". That's why I supposed that
s64 was the right size. But I don't see how it can be negative so
that I will make it u32. Perhaps we need to change intel_gpu_freq
to be u32.

(Didn't want to take it too far, but I was also thinking that in
the future we might need to return error values)

> > +static ssize_t rc6_residency_ms_show(struct device *dev,
> > +				     struct device_attribute *attr,
> > +				     char *buff)
> > +{
> > +	s64 rc6_residency = sysfs_gt_attribute_r_func(dev, attr,
> > +						      __rc6_residency_ms_show);
> > +
> > +	return sysfs_emit(buff, "%u\n", (u32) rc6_residency);
> 
> Here and below (where applicable) variable should be just u32, no need to
> conversion in sysfs_emit.

yep! same comment as above.

> > +static int __intel_gt_sysfs_create_group(struct kobject *kobj,
> > +					 const struct attribute_group *grp)
> > +{
> > +	return is_object_gt(kobj) ?
> > +	       sysfs_create_group(kobj, &grp[0]) :
> > +	       sysfs_merge_group(kobj, &grp[1]);
> > +}
> 
> Merging handling "gt/gt#/*" and "power/*" attributes into the same helpers
> seems unnatural to me, in many functions we have two branches based on value
> of is_object_gt, with the most hacky intel_gt_sysfs_get_drvdata.
> Splitting handling these attributes would allow to drop fragile is_object_gt
> helper and make functions more straightforward, probably at the cost of few
> lines more. On the other side I am not sure if it is worth to change
> everything to just address code purity concerns :)

I the amount of duplicated code would be too high and there have
been already complaints some times in the past (e.g. we have had
same discussion in the case of the debugfs files).

But it's true that is quite hard to find the correct balance
between duplicated code and compact code.

> So with variable type adjustement:
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks!
