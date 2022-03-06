Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E3D4CEE4E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 00:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142A810E039;
	Sun,  6 Mar 2022 23:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E667310E039;
 Sun,  6 Mar 2022 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646607874; x=1678143874;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xMP3XG0Ajf7VvkOSjlOflb943YHpJ+VD2VLYew5yT38=;
 b=bwbNA8DcMCxQJ/LjHq1NHL20zcZ37L5nGsz9pTakBXsdRdNQXbHwL3g+
 7HwGx9+6VOcujvEM9I/A18eUxUXK9jmB9g0ipFr3wXv0Oi4JCL2VDZ2XR
 6T273pxRGBL0dFgA8oDioA+o9w/5rIrffQ9cH7+9Y35H93Z6wwkHvmQis
 EylsPSClBXZAj0qN+9HaNsA3abDN9j7PhAFfVAn5QPvkXeuLn4qlBgoMp
 6d/mhZ9Ew4A4Hwmm631il+1i6CJp0cvEkXtFx4GS+DMq3+1CENBzjiwnc
 jIf+GNygCGCZVsNp+WzwfLSyzpQ8WBQ5ZPL17Lpe/2C22OE3cPfOWvPCk Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="241696422"
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="241696422"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 15:04:34 -0800
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="512463184"
Received: from swray-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.53.53])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 15:04:30 -0800
Date: Mon, 7 Mar 2022 01:04:26 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v5 4/7] drm/i915/gt: create per-tile sysfs interface
Message-ID: <YiU9+uRCzJAZlcRh@intel.intel>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-5-andi.shyti@linux.intel.com>
 <e096ed88-ec87-b45c-22ba-80d48f480808@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e096ed88-ec87-b45c-22ba-80d48f480808@intel.com>
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

[...]

> > +bool is_object_gt(struct kobject *kobj)
> > +{
> > +	return !strncmp(kobj->name, "gt", 2);
> > +}
> 
> It looks quite fragile, at the moment I do not have better idea:) maybe
> after reviewing the rest of the patches.

yeah... it's not pretty, I agree, but I couldn't come up with a
better way of doing it.

> > +static struct intel_gt *kobj_to_gt(struct kobject *kobj)
> > +{
> > +	return container_of(kobj, struct kobj_gt, base)->gt;
> > +}
> > +
> > +struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
> > +					    const char *name)
> > +{
> > +	struct kobject *kobj = &dev->kobj;
> > +
> > +	/*
> > +	 * We are interested at knowing from where the interface
> > +	 * has been called, whether it's called from gt/ or from
> > +	 * the parent directory.
> > +	 * From the interface position it depends also the value of
> > +	 * the private data.
> > +	 * If the interface is called from gt/ then private data is
> > +	 * of the "struct intel_gt *" type, otherwise it's * a
> > +	 * "struct drm_i915_private *" type.
> > +	 */
> > +	if (!is_object_gt(kobj)) {
> > +		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
> > +
> > +		pr_devel_ratelimited(DEPRECATED
> > +			"%s (pid %d) is accessing deprecated %s "
> > +			"sysfs control, please use gt/gt<n>/%s instead\n",
> > +			current->comm, task_pid_nr(current), name, name);
> > +		return to_gt(i915);
> > +	}
> > +
> > +	return kobj_to_gt(kobj);
> 
> It took some time for me to understand what is going on here.
> We have dev argument which sometimes can point to "struct device", sometimes
> to "struct kobj_gt", but it's type suggests differently, quite ugly.
> I wonder if wouldn't be better to use __ATTR instead of DEVICE_ATTR* as in
> case of intel_engines_add_sysfs. This way abstractions would look better,
> hopefully.

How would it help?

The difference is that I'm adding twice different interfaces with
the same name and different location (i.e. different object). The
legacy intrefaces inherit the object from drm and I'm preserving
that reference.

While the new objects would derive from the previous and they are
pretty much like intel_engines_add_sysfs().

[...]

> > +struct kobject *
> > +intel_gt_create_kobj(struct intel_gt *gt, struct kobject *dir, const char *name)
> > +{
> > +	struct kobj_gt *kg;
> > +
> > +	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> > +	if (!kg)
> > +		return NULL;
> > +
> > +	kobject_init(&kg->base, &kobj_gt_type);
> > +	kg->gt = gt;
> > +
> > +	/* xfer ownership to sysfs tree */
> > +	if (kobject_add(&kg->base, dir, "%s", name)) {
> > +		kobject_put(&kg->base);
> > +		return NULL;
> > +	}
> > +
> > +	return &kg->base; /* borrowed ref */
> > +}
> > +
> > +void intel_gt_sysfs_register(struct intel_gt *gt)
> > +{
> > +	struct kobject *dir;
> > +	char name[80];
> > +
> > +	snprintf(name, sizeof(name), "gt%d", gt->info.id);
> > +
> > +	dir = intel_gt_create_kobj(gt, gt->i915->sysfs_gt, name);
> > +	if (!dir) {
> > +		drm_warn(&gt->i915->drm,
> > +			 "failed to initialize %s sysfs root\n", name);
> > +		return;
> > +	}
> > +}
> 
> Squashing intel_gt_create_kobj into intel_gt_sysfs_register would simplify
> code and allows drop snprintf to local array.

right!

> > +static struct kobject *i915_setup_gt_sysfs(struct kobject *parent)
> > +{
> > +	return kobject_create_and_add("gt", parent);
> > +}
> > +
> >   void i915_setup_sysfs(struct drm_i915_private *dev_priv)
> >   {
> >   	struct device *kdev = dev_priv->drm.primary->kdev;
> > @@ -538,6 +543,11 @@ void i915_setup_sysfs(struct drm_i915_private *dev_priv)
> >   	if (ret)
> >   		drm_err(&dev_priv->drm, "RPS sysfs setup failed\n");
> > +	dev_priv->sysfs_gt = i915_setup_gt_sysfs(&kdev->kobj);
> 
> Why not directly kobject_create_and_add("gt", parent) ? up to you.

of course!

[...]

Thanks a lot for the review,
Andi
