Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0074E1C5E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Mar 2022 16:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23395112FCA;
	Sun, 20 Mar 2022 15:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14BC112FC8;
 Sun, 20 Mar 2022 15:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647791525; x=1679327525;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y/SCfWR/ZN7/70DG7o9pCGEInqSp717TZ4o3BwrPWGc=;
 b=kfOGhCPK8YJYxm6TShsIC2cXXKQUfXalsxHvofn7wLm6IYPhpzMjfn9o
 jq6Ip0d2/xqFSYw3vejJHjpJuChc+4Yxzqbpa3rYLSqlk7L3ItZN5RpTB
 U9flbQvQie9qtuixxGTQzd/YFUmc+vOhuTRGf8rhl9YNVuc+UZRBYnYLK
 DKBguKxJ6qxOyoMPwJ9H3nV0lHBEY6c/Mabjtshcbod8c9eX5qLhvzQhE
 pSukz2OvUk3KOGy9uzXmnz+ZgDBBEr+hg1S10L3rT7eJ550+fPgmM/4q5
 6ayFklNgt6MQNUWU2zLPEvUUeUQMcp6/WmmYcZkuXpOW17XlDpDiF4G8o w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="244882267"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="244882267"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 08:52:05 -0700
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="559521763"
Received: from bchindam-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.249.39.218])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 08:51:59 -0700
Date: Sun, 20 Mar 2022 17:51:56 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v7 3/7] drm/i915: Prepare for multiple GTs
Message-ID: <YjdNnImba7eGgG96@intel.intel>
References: <20220318233938.149744-1-andi.shyti@linux.intel.com>
 <20220318233938.149744-4-andi.shyti@linux.intel.com>
 <4d797b83-d7c5-6541-99fc-c9fc0998d358@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d797b83-d7c5-6541-99fc-c9fc0998d358@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Andi Shyti <andi@etezian.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Dale B Stimson <dale.b.stimson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michal,

[...]

> > +static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
> > +{
> > +	int ret;
> > +
> > +	if (!gt_is_root(gt)) {
> > +		struct intel_uncore_mmio_debug *mmio_debug;
> > +		struct intel_uncore *uncore;
> > +
> > +		uncore = kzalloc(sizeof(*uncore), GFP_KERNEL);
> > +		if (!uncore)
> > +			return -ENOMEM;
> > +
> > +		mmio_debug = kzalloc(sizeof(*mmio_debug), GFP_KERNEL);
> > +		if (!mmio_debug) {
> > +			kfree(uncore);
> > +			return -ENOMEM;
> > +		}
> > +
> > +		gt->uncore = uncore;
> > +		gt->uncore->debug = mmio_debug;
> > +
> > +		__intel_gt_init_early(gt);
> > +	}
> > +
> > +	intel_uncore_init_early(gt->uncore, gt);
> > +
> > +	ret = intel_uncore_setup_mmio(gt->uncore, phys_addr);
> > +	if (ret)
> > +		return ret;
> 
> (little guessing as in this patch we don't have non-root gt yet)
> 
> if the future, when we will be doing setup of non-root gt, if we return
> here then likely we will leak both uncore/mmio_debug as gt will not be
> added to i915->gts thus it will not be visible in for_each_gt loop used
> to release/cleanup all gts.
> 
> since in above code you are doing cleanup in case of kzalloc failure,
> same should be done in case of mmio setup failure.

that's a good point. In the next patch I am going to add support
for the first multitile platform and, because it's too old to
remember, I had a look and I think this part is not properly
managed.

Thanks for the note!

Andi
