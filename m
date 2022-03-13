Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B245B4D7871
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 22:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2ED10E2F5;
	Sun, 13 Mar 2022 21:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01D310E2C3;
 Sun, 13 Mar 2022 21:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647207010; x=1678743010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tQv+Ez4YrjbTaUvYfDsiyZbFqEH5+CjrVJ0MrPZoKhw=;
 b=VbTDqSQtG02K6+YSTCco49vBWtkTdBmg7R0h0cn7qNh/VCMhxYcYuE8G
 0gVcM9gNVLzCdeg8AQvttH1iRr9ni4qWV4cOP5n5GjpEawdt1HEgNeuIj
 GzqSyVZYX9+fcwOaFi0fgSrMjQJCSEfDkF1W1AoWSLY4m/QExQMmQDUhD
 Wp/3trnHyy9TfUgHiUrM719S1OKHD+E6AepUqH6/8Fu0rPH3QlrdH9HGZ
 d134KtvMwE9MbXOW+fKdgnuN3imxwBKWbVcT44d0tD3TgVE2xnurmhQju
 jNVp15pTpwklIJthpEHPluu0ozDMAEF4LjnRcbCZqCa4F3FWBjr1ZqOTN g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="255629979"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; d="scan'208";a="255629979"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 14:30:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; d="scan'208";a="556122158"
Received: from gionascu-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.220.31])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 14:30:04 -0700
Date: Sun, 13 Mar 2022 23:30:02 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v5 4/7] drm/i915/gt: create per-tile sysfs interface
Message-ID: <Yi5iWtOzyMLFZWo/@intel.intel>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-5-andi.shyti@linux.intel.com>
 <e096ed88-ec87-b45c-22ba-80d48f480808@intel.com>
 <YiU9+uRCzJAZlcRh@intel.intel>
 <70f07f08-36d8-0af8-adce-a3a4c780527c@intel.com>
 <Yi5J1HB5uypRUIW+@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yi5J1HB5uypRUIW+@intel.intel>
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

> > > > > +struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
> > > > > +					    const char *name)
> > > > > +{
> > > > > +	struct kobject *kobj = &dev->kobj;
> > > > > +
> > > > > +	/*
> > > > > +	 * We are interested at knowing from where the interface
> > > > > +	 * has been called, whether it's called from gt/ or from
> > > > > +	 * the parent directory.
> > > > > +	 * From the interface position it depends also the value of
> > > > > +	 * the private data.
> > > > > +	 * If the interface is called from gt/ then private data is
> > > > > +	 * of the "struct intel_gt *" type, otherwise it's * a
> > > > > +	 * "struct drm_i915_private *" type.
> > > > > +	 */
> > > > > +	if (!is_object_gt(kobj)) {
> > > > > +		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
> > > > > +
> > > > > +		pr_devel_ratelimited(DEPRECATED
> > > > > +			"%s (pid %d) is accessing deprecated %s "
> > > > > +			"sysfs control, please use gt/gt<n>/%s instead\n",
> > > > > +			current->comm, task_pid_nr(current), name, name);
> > > > > +		return to_gt(i915);
> > > > > +	}
> > > > > +
> > > > > +	return kobj_to_gt(kobj);
> > > > It took some time for me to understand what is going on here.
> > > > We have dev argument which sometimes can point to "struct device", sometimes
> > > > to "struct kobj_gt", but it's type suggests differently, quite ugly.
> > > > I wonder if wouldn't be better to use __ATTR instead of DEVICE_ATTR* as in
> > > > case of intel_engines_add_sysfs. This way abstractions would look better,
> > > > hopefully.
> > > How would it help?
> > > 
> > > The difference is that I'm adding twice different interfaces with
> > > the same name and different location (i.e. different object). The
> > > legacy intrefaces inherit the object from drm and I'm preserving
> > > that reference.
> > > 
> > > While the new objects would derive from the previous and they are
> > > pretty much like intel_engines_add_sysfs().
> > 
> > I was not clear on the issue. Here in case of 'id' attribute it is defined
> > as device_attribute, but in kobj_type.sysfs_ops you assign formally
> > incompatible &kobj_sysfs_ops.
> 
> 'kobj_sysfs_ops' is of the type 'kobj_type'.
> 
> > kobj_sysfs_ops expects kobj_attribute! Fortunately kobj_attribute is 'binary
> > compatible' with device_attribute and kobj is at beginning of struct device
> > as well, so it does not blow up, but I wouldn't say it is clean solution :)
> > If you look at intel_engines_add_sysfs you can see that all attributes are
> > defined as kobj_attribute.
> 
> That's exactly the approach I use in the next patches for the
> power management files, I use "struct kobj_gt" wrapped around
> "struct kobject". But I'm using that only for the GT files.
> 
> Are you, btw, suggesting to use this same approache also for the
> legacy files that for now have a pointer to the drm kobject? This
> way I would need to add more information, like the pointer to
> i915 and gt_id. This way I wouldn't need the files above that
> look hacky to you. Is this what you mean?

Still this wouldn't solve it because I am merging the legacy
interfaces to an existing kobject and creating new kobjects for
the new interfaces that go under gt. I would need some other
ugly hack to have things coming around.

Unless I misunderstood you.

Andi
