Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DEB491280
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 01:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5911126A4;
	Tue, 18 Jan 2022 00:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC201126A3;
 Tue, 18 Jan 2022 00:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642464064; x=1674000064;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5VOGaDC79aqoYDjcQTGORZB39wAz6+QYpSqAjmyCUZo=;
 b=nEFkvUn67UjTDphOynjdBOpGn8IhBP4VXP60PR3PkewYZgpqOd0amd/j
 77DjhZ0hf/H7fWiON6uOyMfTmj7X7f/0XghJODpclvqWTePU8X6JAGFUu
 GibhyNgie604I1c2b0fnLTLei96rt0TTkp6D/3dNyC1Tcb/sMBO1LmNBT
 w0+c8RZg/cZpmaCkGDY3/Dgd9oPaFIIeQ9bW8v81BW9uQjxXrs7Q+jS1o
 0/qd/mf1FyXwmVHEktPU7ieHdVsTMBXWbgVs6g3n+449OzLCiiSoNSemg
 mTVEdfM9sE+yW/5i/z3hjPsGgoewdJC0mDe7hMabeQ1HypsdC+/qlDt+6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="232065796"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="232065796"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 16:01:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="531517223"
Received: from nkohl-mobl.ger.corp.intel.com (HELO intel.com) ([10.249.41.90])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2022 16:00:58 -0800
Date: Tue, 18 Jan 2022 02:00:55 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 2/2] drm/i915/gt: make a gt sysfs group and move power
 management files
Message-ID: <YeYDN/GG/C3/6mE0@intel.intel>
References: <20220117193255.236599-1-andi.shyti@linux.intel.com>
 <20220117193255.236599-3-andi.shyti@linux.intel.com>
 <d3eb3ece-3f15-7c2c-dd72-57000835bd65@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3eb3ece-3f15-7c2c-dd72-57000835bd65@intel.com>
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
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michal,

> > /sys/.../card0
> >          ├── gt
> >          │   ├── gt0
> >          │   │   ├── id
> >          │   │   ├── rc6_enable
> >          │   │   ├── rc6_residency_ms
> >          │   │   ├── rps_act_freq_mhz
> >          │   │   ├── rps_boost_freq_mhz
> >          │   │   ├── rps_cur_freq_mhz
> >          │   │   ├── rps_max_freq_mhz
> >          │   │   ├── rps_min_freq_mhz
> >          │   │   ├── rps_RP0_freq_mhz
> >          │   │   ├── rps_RP1_freq_mhz
> >          │   │   └── rps_RPn_freq_mhz
> > 	 .   .
> > 	 .   .
> > 	 .   .
> >          │   └── gt3
> 
> gtN ?

yep!

> > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> > index aa86ac33effc..5fd203c626fc 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -121,7 +121,9 @@ gt-y += \
> >  	gt/intel_timeline.o \
> >  	gt/intel_workarounds.o \
> >  	gt/shmem_utils.o \
> > -	gt/sysfs_engines.o
> > +	gt/sysfs_engines.o \
> > +	gt/sysfs_gt.o \
> > +	gt/sysfs_gt_pm.o
> 
> shouldn't these be named as
> 
> > +	gt/intel_gt_sysfs.o \
> > +	gt/intel_gt_pm_sysfs.o

You are right with wanting a coherent prefix, but I kept the
trend of starting with sysfs_gt*. We already have sysfs_engine.c.

And, because I wouldn't like to have part of it sysfs_gt* and
part of it intel_gt_sysfs*, then we either rename all or we leave
it as it is.

On the other hand if we are under i915/gt/... I don't expect it
to be the sysfs of another system.

To be honest, I don't have a strong opinion on this. If you do,
then I will change everything intel_gt_sysfs*.

[...]

> > +++ b/drivers/gpu/drm/i915/gt/sysfs_gt.c
> > @@ -0,0 +1,136 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2020 Intel Corporation
> 
> 2022 ?

Time flies... huh? :)

> > +void intel_gt_sysfs_register(struct intel_gt *gt)
> > +{
> > +	struct kobject *dir;
> > +	char name[80];
> > +
> > +	/*
> > +	 * We need to make things right with the
> > +	 * ABI compatibility. The files were originally
> > +	 * generated under the parent directory.
> > +	 *
> > +	 * We generate the files only for gt 0
> > +	 * to avoid duplicates.
> > +	 */
> > +	if (!gt->info.id)
> 
> maybe we should have gt_is_root(gt) helper ?

yes, makes sense.

> > +		intel_gt_sysfs_pm_init(gt, gt_get_parent_obj(gt));
> > +
> > +	snprintf(name, sizeof(name), "gt%d", gt->info.id);
> > +
> > +	dir = intel_gt_create_kobj(gt, gt->i915->sysfs_gt, name);
> > +	if (!dir) {
> > +		drm_warn(&gt->i915->drm,
> > +			 "failed to initialize %s sysfs root\n", name);
> > +		return;
> > +	}
> > +
> > +	if (sysfs_create_file(dir, &dev_attr_id.attr))
> > +		drm_warn(&gt->i915->drm,
> > +			 "failed to create sysfs %s info files\n", name);
> 
> can't we use default_groups in kobj_type ?

yeah... I'll try that.

[...]

> > +static ssize_t rc6_enable_show(struct device *dev,
> > +			       struct device_attribute *attr,
> > +			       char *buff)
> > +{
> > +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> > +	u8 mask = 0;
> > +
> > +	if (HAS_RC6(gt->i915))
> > +		mask |= BIT(0);
> > +	if (HAS_RC6p(gt->i915))
> > +		mask |= BIT(1);
> > +	if (HAS_RC6pp(gt->i915))
> > +		mask |= BIT(2);
> > +
> > +	return scnprintf(buff, PAGE_SIZE, "%x\n", mask);
> 
> sysfs_emit ?

OK

[...]

> > +	ret = __intel_gt_sysfs_create_group(kobj, rc6_attr_group);
> > +	if (ret)
> > +		drm_err(&gt->i915->drm,
> > +			"failed to create gt%u RC6 sysfs files\n", gt->info.id);
> > +
> > +	if (HAS_RC6p(gt->i915)) {
> > +		ret = __intel_gt_sysfs_create_group(kobj, rc6p_attr_group);
> > +		if (ret)
> > +			drm_err(&gt->i915->drm,
> > +				"failed to create gt%u RC6p sysfs files\n",
> > +				gt->info.id);
> > +	}
> > +
> > +	if (IS_VALLEYVIEW(gt->i915) || IS_CHERRYVIEW(gt->i915)) {
> > +		ret = __intel_gt_sysfs_create_group(kobj, media_rc6_attr_group);
> > +		if (ret)
> > +			drm_err(&gt->i915->drm,
> > +				"failed to create media %u RC6 sysfs files\n",
> > +				gt->info.id);
> > +	}
> 
> did you consider using attribute_group.is_visible instead adding groups
> manually ?

I can try this, as well.

[...]

> maybe this large but simple code movement should be done in a separate
> patch so we could then apply smaller and easier to review fixes ?

I can try to split it, even though most of it is basically a
copy/paste.

> ~Michal

Thanks a lot for this review, as well!

Andi
