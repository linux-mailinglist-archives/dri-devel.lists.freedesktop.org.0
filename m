Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A34D78EC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 01:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F62610E82B;
	Mon, 14 Mar 2022 00:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073B410E82B;
 Mon, 14 Mar 2022 00:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647218293; x=1678754293;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HriotLEBaLfgfg4tfYZogZk5jwdaGCvv6IFN+yNPHvQ=;
 b=BGSvQKYJuhXmwEUNHM5LXuvdmN3PgVjYVBzsDMqxmlpxv5GLN/XjsKVq
 bafk/eKuCUwcUH75NXKg3rnhiIKY3FGkMXxjvYUNnX2GB+M1y+0MFBt/z
 ihA7CUw5xWzrZI0hez/S4/u5UpTc9Z7wCPGyKu93Ppa//OunGp5Dwhcjs
 89YCpU829sygpyWf8/GbZiH87ra9zB4j6O9djpnwpPZ0aq31F8CFRnZsl
 58hW0rzcnKsoirvAQJK3/Pxji7uaMFVrTGzkppXmag8o/oY8jE6xYrTnq
 fTAh72Coiw+gq3U+IwDWeVwIz1s8aCD9SiCWzW6DVc2RT+MWPh/8wMMRI w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="235857318"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; d="scan'208";a="235857318"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 17:38:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; d="scan'208";a="556154983"
Received: from akramak-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.37.179])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 17:38:08 -0700
Date: Mon, 14 Mar 2022 02:38:04 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v5 7/7] drm/i915/gt: Adding new sysfs frequency attributes
Message-ID: <Yi6ObL00OJ8gB+V8@intel.intel>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-8-andi.shyti@linux.intel.com>
 <28e2363a-38aa-9d68-ac59-b78c9168a814@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28e2363a-38aa-9d68-ac59-b78c9168a814@intel.com>
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

Hi Michal,

[...]

> > +static ssize_t punit_req_freq_mhz_show(struct device *dev,
> > +				       struct device_attribute *attr,
> > +				       char *buff)
> > +{
> > +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> > +	struct intel_rps *rps = &gt->rps;
> > +	u32 preq = intel_rps_read_punit_req_frequency(rps);
> > +
> > +	return scnprintf(buff, PAGE_SIZE, "%d\n", preq);
> 
> %u since preq is u32
> 
> and use sysfs_emit (also in below show functions)

sure! I'll change them.

[...]

> >  static int intel_sysfs_rps_init(struct intel_gt *gt, struct kobject *kobj,
> >  				const struct attribute * const *attrs)
> >  {
> > @@ -493,4 +628,11 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
> >  	if (ret)
> >  		drm_warn(&gt->i915->drm,
> >  			 "failed to create gt%u RPS sysfs files", gt->info.id);
> > +
> > +	ret = sysfs_create_files(kobj, freq_attrs);
> > +	if (ret)
> > +		drm_warn(&gt->i915->drm,
> > +			 "failed to create gt%u throttle sysfs files",
> > +			 gt->info.id);
> 
> nit: would be nice to see %pe why it failed

[...]

I will add it to the other cases as well.

> > +static u32 __rps_read_mmio(struct intel_gt *gt, i915_reg_t reg32)
> 
> this doesn't look like "rps" helper, rather like "gt" so it should have
> different prefix and maybe even be exported by the gt or uncore ?
> 
> unless you wanted:
> 
> static u32 __rps_read_mmio(struct intel_rps *rps, i915_reg_t reg32)
> {
> 	struct intel_gt *gt = rps_to_gt(rps);
> 
> > +{
> > +	intel_wakeref_t wakeref;
> > +	u32 val;
> > +
> > +	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> > +		val = intel_uncore_read(gt->uncore, reg32);
> > +
> > +	return val;
> > +}

Yes, you are right!

@Sujaritha: shall I move "__rps_read_mmio()" in intel_gt.c and
call it intel_gt_read_mmio()?

[...]

> > +u32 intel_rps_read_throttle_reason_vr_thermalert(struct intel_rps *rps)
> > +{
> > +	struct intel_gt *gt = rps_to_gt(rps);
> > +	u32 thermalert = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & VR_THERMALERT_MASK;
> > +
> > +	return thermalert;
> > +}
> 
> shouldn't we return bool by all of these functions as used/expected in
> show() counterparts ?

Suja?

[...]

> > +#define GT0_PERF_LIMIT_REASONS		_MMIO(0x1381A8)
> > +#define   GT0_PERF_LIMIT_REASONS_MASK	0x00000de3
> 
> this mask is different that other (FIELD_PREP/GET wont work) so maybe we
> should name it in special way ?

As far as I understood this is still a mask and used as such.
This mask is actually telling that there is some throttling going
on.

It looks weird because there are some unwanted bits in between
the interesting bits.

> > +#define   PROCHOT_MASK			BIT(1)
> > +#define   THERMAL_LIMIT_MASK		BIT(2)
> > +#define   RATL_MASK			BIT(6)
> > +#define   VR_THERMALERT_MASK		BIT(7)
> > +#define   VR_TDC_MASK			BIT(8)
> > +#define   POWER_LIMIT_4_MASK		BIT(9)
> > +#define   POWER_LIMIT_1_MASK		BIT(11)
> > +#define   POWER_LIMIT_2_MASK		BIT(12)
> 
> REG_BIT ?

yes!

Thanks, Michal!
Andi
