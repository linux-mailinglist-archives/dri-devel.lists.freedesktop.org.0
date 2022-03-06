Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB04CED57
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 20:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F254A10E0D1;
	Sun,  6 Mar 2022 19:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9322110E0D0;
 Sun,  6 Mar 2022 19:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646594439; x=1678130439;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2KijYDCX/wpuRw8fR5c/LZEHBuicn2Iiw+lGtRh+Hi8=;
 b=no5/pLBhQG84FMSK4edm/sZN+nOrJb9afrKSk4opqD5UQPr/PZwCn0b/
 ysWNZE7NXQ/+h1cqGJCtVd5lgkzThDyua+DQwg2uNIJIF8J3OAP3bxrlv
 lL0IftJTJKlgtpwF1OEtcrzgv3dHxMWNDUu694SPobbo9ikCpjGo6uiaB
 7nnjorHMqro5Cr+8B6mvzu8CcrnYGHg8ezT2vLtLFug+ceWJsABR6kFV9
 hUuSuciOg+09Bc0zicsLjOEwkSSNR7N8cXMO2fyQ370FMNpmfUJxNRo+G
 N7xHSLLqeEKjIanVkj9TmGryFOvDYyUQPNavovjn9+RzFBEaVvzrlEIbi A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="234209365"
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="234209365"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 11:20:38 -0800
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="552872033"
Received: from swray-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.53.53])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 11:20:34 -0800
Date: Sun, 6 Mar 2022 21:20:32 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v5 2/7] drm/i915: Prepare for multiple GTs
Message-ID: <YiUJgKaZx3ulPRMa@intel.intel>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-3-andi.shyti@linux.intel.com>
 <730e317a-8672-c13b-fa8d-713e9e7bd0d7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <730e317a-8672-c13b-fa8d-713e9e7bd0d7@intel.com>
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

> > -int intel_gt_probe_lmem(struct intel_gt *gt)
> > +static int intel_gt_probe_lmem(struct intel_gt *gt)
> >   {
> >   	struct drm_i915_private *i915 = gt->i915;
> > +	unsigned int instance = gt->info.id;
> >   	struct intel_memory_region *mem;
> >   	int id;
> >   	int err;
> > +	id = INTEL_REGION_LMEM_0 + instance;
> > +	if (drm_WARN_ON(&i915->drm, id >= INTEL_REGION_STOLEN_SMEM))
> 
> Do we need to check id correctness? wouldn't be enough to check it on
> initialization of gt->info.id.
> If yes, maybe (id > INTEL_REGION_LMEM_3) would be more readable, or (info.id
> < MAX_GT),  up to you.

yes, it's indeed redundant. Also because if that 'if' was true it
would be a bit more catastrophic than a simple warning. I will
remove it completely.

[...]

> > +	if (id) {
> > +		struct intel_uncore_mmio_debug *mmio_debug;
> > +		struct intel_uncore *uncore;
> > +
> > +		uncore = kzalloc(sizeof(*uncore), GFP_KERNEL);
> > +		if (!gt->uncore)
> > +			return -ENOMEM;
> 
> s/gt->uncore/uncore/

thanks!

[...]

> > +static void
> > +intel_gt_tile_cleanup(struct intel_gt *gt)
> > +{
> > +	intel_uncore_cleanup_mmio(gt->uncore);
> > +
> > +	if (gt->info.id) {
> > +		kfree(gt->uncore);
> > +		kfree(gt);
> 
> What about gt->uncore->debug ?

you don't want to leak anything? :)

will add it, nice catch! Thanks!

[...]

> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > index 1c67ff735f18..144f989e4fef 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -320,9 +320,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
> >   	intel_device_info_subplatform_init(dev_priv);
> >   	intel_step_init(dev_priv);
> > -	intel_gt_init_early(to_gt(dev_priv), dev_priv);
> > +	/* All tiles share a single mmio_debug */
> 
> So why are we allocating mmio_debug in intel_gt_tile_setup ?

yes... this is a leftover from previous development cycles... I
will remove the comment. Indeed this goes only to tile 0.

[...]

> >   void intel_uncore_cleanup_mmio(struct intel_uncore *uncore)
> >   {
> > -	struct pci_dev *pdev = to_pci_dev(uncore->i915->drm.dev);
> > -
> > -	pci_iounmap(pdev, uncore->regs);
> > +	if (uncore->regs)
> > +		iounmap(uncore->regs);
> 
> 'if' is not necessary, up to you.

will remove, thanks!

[...]

Thank you for the review!
Andi
