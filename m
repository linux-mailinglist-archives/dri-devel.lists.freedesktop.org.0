Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2F490F27
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 18:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD46C10F3D1;
	Mon, 17 Jan 2022 17:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A7F10F3D0;
 Mon, 17 Jan 2022 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642439780; x=1673975780;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kgMsCR0YF2GiQzst8dCBI9NwCvgvaa45tgvLKfV/kV8=;
 b=UB0ogMI9kPhlSp3AuWZHggYf60Msuy+QE0ZV1yBswRCBLlisIClALSKS
 zaDT+l74Ot4CInG36+JCyOQnTZ0RdRIXLeVl6BbuMq/gYJgpuhnA1iejJ
 gJSmU+Ot051u+rrrnGVugg9gSHF3UptzAj6YxFpFYTVRa7vUDLl8NSNUA
 SuDurp89trQtRQi/A66cQhKkv0Ywla0gadPeC3O1WAiOAPUdimgjavnfE
 /+WB1WiSvZk5qUn/FrT4eXy5VLX0NnYAZae94DQRSbHy0Azmb0Xhu0b2e
 lJ1qno+KGzjN+lPkfl/7t4C0Q1eVNW5/bkwiBoNq52WtXUnM1LgpElOgY A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="305398622"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="305398622"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 09:16:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="531417334"
Received: from ashvay-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.49.118])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 09:16:16 -0800
Date: Mon, 17 Jan 2022 19:16:13 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/gt: make a gt sysfs group
 and move power management files
Message-ID: <YeWkXTbsyEM10c71@intel.intel>
References: <20220117150910.231889-1-andi.shyti@linux.intel.com>
 <20220117150910.231889-3-andi.shyti@linux.intel.com>
 <ccbd6b7b-49ef-677f-ca3a-0e99c449f35d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccbd6b7b-49ef-677f-ca3a-0e99c449f35d@linux.intel.com>
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
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> > The previous power management files are kept in their original
> > root directory to avoid breaking the ABI. They point to the tile
> > '0' and a warning message is printed whenever accessed to. The
> > deprecated interface needs for the CONFIG_SYSFS_DEPRECATED_V2
> > flag in order to be generated.
> 
> CONFIG_SYSFS_DEPRECATED_V2 idea was abandoned, no? This patch at least does
> not appear to contain it so please update the commit message to reflect
> current state.
> 
> Adding Joonas to help address the question of how strict are userspace
> requirements for sysfs additions. Personally sysadmin use sounds fine to me,
> although it needs to be mentioned/documented as Matt requested, but I fear
> it may not be enough to upstream. Is Level0 at the stage where we can
> upstream for it I am also not sure.

no need... it's a leftover in the commit message. The deprecated
was removed a year ago, maybe. Thanks!

[...]

> > +		pr_devel_ratelimited(DEPRECATED
> > +			"%s (pid %d) is trying to access deprecated %s "
> > +			"sysfs control, please use gt/gt<n>/%s instead\n",
> 
> Maybe reword "is trying to access" to "is accesing" to remove any doubt
> whether something is failing or not?

OK

[...]

> > +	if (sysfs_create_file(dir, &dev_attr_id.attr))
> > +		drm_err(&gt->i915->drm,
> > +			"failed to create sysfs %s info files\n", name);
> 
> These drm_err could maybe be warn or notice, to reflect the fact driver is
> most likely completely functional? But only maybe since I haven't checked
> what we do for other sysfs failures. If rest are drm_err then I guess
> consistency trumps it.

yes, I agree with you and indeed they whould be treated as
warnings because the driver probes correctly if sysfs fails.

I will change this to drm_warn and fixx all the others. Thanks!

[...]

> > +static inline bool is_object_gt(struct kobject *kobj)
> > +{
> > +	bool b = !strncmp(kobj->name, "gt", 2);
> > +
> > +	GEM_BUG_ON(b && !isdigit(kobj->name[2]));
> 
> 1)
> Not sure what is the point of this GEM_BUG_ON? Checking strncmp works feels
> like an overkill.
> 
> 2)
> With the recent trend of "static inline considered harmful" perhaps consider
> moving it out of line.

OK

[...]

> > +static const struct attribute_group rc6_attr_group[] = {
> > +	{ .name = power_group_name, .attrs = rc6_attrs },
> > +	{ .attrs = rc6_attrs }
> > +};
> > +
> > +static const struct attribute_group rc6p_attr_group[] = {
> > +	{ .name = power_group_name, .attrs = rc6p_attrs },
> > +	{ .attrs = rc6p_attrs }
> > +};
> > +
> > +static const struct attribute_group media_rc6_attr_group[] = {
> > +	{ .name = power_group_name, .attrs = media_rc6_attrs },
> > +	{ .attrs = media_rc6_attrs }
> > +};
> > +
> > +static int __intel_gt_sysfs_create_group(struct kobject *kobj,
> > +					 const struct attribute_group *grp)
> > +{
> > +	int i = is_object_gt(kobj);
> 
> Is_object_gt returns a bool so can I be pedantic? :) Maybe just omit the
> local and solve it like that.

'i' is used also as an array index here, and callse merge/create
depending on what kind of object kobj is.

Maybe it's a bit of an ugly trick, but perhaps to mark the fact I
can do it like

	i = !!is_object_gt(kobj);

> > +
> > +	return i ? sysfs_create_group(kobj, &grp[i]) :
> > +		   sysfs_merge_group(kobj, &grp[i]);
> > +}
> > +
> > +static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
> > +{
> > +	int ret;
> > +
> > +	if (!HAS_RC6(gt->i915))
> > +		return;
> > +
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
> > +}

[...]

> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -8480,6 +8480,7 @@ enum {
> >   #define   GEN6_AGGRESSIVE_TURBO			(0 << 15)
> >   #define   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT	23
> >   #define   GEN9_IGNORE_SLICE_RATIO		(0 << 0)
> > +#define   GEN12_SW_REQ_UNSLICE_RATIO_SHIFT	23
> 
> Stray something?

I don't know how this ended up here... scary!

> Regards,
> 
> Tvrtko

Thanks a lot for looking again into this!

Andi
