Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B071A062
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 16:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8215E10E556;
	Thu,  1 Jun 2023 14:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB7D10E554;
 Thu,  1 Jun 2023 14:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685630292; x=1717166292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kN660c8NFUyOdJrkLu+dYkEvaszRGd9qNNXBXk/WuAU=;
 b=Lm3mcd0VGbXN2qsJoo8Io7xGDFQZrEZPRF0Doizz4jZzJn0ZHPJRUAEE
 JyfajGNtw03CWcSj6WHeUeOuTfmu171gF6LO+9OHfmv3be784eHNIMfbs
 BUThI7qn8GoqBCPYUD6EwT39lzVtWVZ5TDpSerQ70hV3ROAjz6EU2PeHQ
 riStR1dWPcYcXvEfqs0uLOSg0oha+XMnHmb2dATnuvqHUL+sX6SUQcrXx
 LGJ1NlaR61xWU/ZDOqYzv0YeqX2/oTWEZqz8l+33J/GghgwXy55xJ/QY6
 QVjq21W8GX7uiDKJOujT7qabm1bMtD4qJ5q9jHIR8B6DNG0PLCmk9WSz3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="441936189"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="441936189"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="684867629"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="684867629"
Received: from mborsali-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.251.208.75])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:38:05 -0700
Date: Thu, 1 Jun 2023 16:38:02 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Use the correct error value
 when kernel_context() fails
Message-ID: <ZHitSozwyB69h8kU@ashyti-mobl2.lan>
References: <20230526124138.2006110-1-andi.shyti@linux.intel.com>
 <6897a425-8217-8fca-d0a0-fc02073f6b45@intel.com>
 <SJ1PR11MB620427ACD1EB3B717FDFA1BF81499@SJ1PR11MB6204.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620427ACD1EB3B717FDFA1BF81499@SJ1PR11MB6204.namprd11.prod.outlook.com>
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
Cc: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tejas,

> > > @@ -1530,8 +1530,8 @@ static int live_busywait_preempt(void *arg)
> > >   	struct drm_i915_gem_object *obj;
> > >   	struct i915_vma *vma;
> > >   	enum intel_engine_id id;
> > > -	int err = -ENOMEM;
> > >   	u32 *map;
> > > +	int err;
> 
> We could initialize err with 0 and remove err = 0 assignment below but leaving up to you. 

that assignement must be a leftover from previous patches because
err is already initialized here:

	err = i915_vma_pin(vma, 0, 0, PIN_GLOBAL);

will remove it. Thanks!

> > >
> > >   	/*
> > >   	 * Verify that even without HAS_LOGICAL_RING_PREEMPTION, we
> > can @@
> > > -1539,13 +1539,17 @@ static int live_busywait_preempt(void *arg)
> > >   	 */
> > >
> > >   	ctx_hi = kernel_context(gt->i915, NULL);
> > > -	if (!ctx_hi)
> > > -		return -ENOMEM;
> > > +	if (IS_ERR(ctx_hi))
> > > +		return PTR_ERR(ctx_hi);
> > > +
> > >   	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
> > >
> > >   	ctx_lo = kernel_context(gt->i915, NULL);
> > > -	if (!ctx_lo)
> > > +	if (IS_ERR(ctx_lo)) {
> > > +		err = PTR_ERR(ctx_lo);
> > >   		goto err_ctx_hi;
> > > +	}
> > > +
> 
> Looks fine,
> Acked-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Thank you!
Andi

> 
> > >   	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
> > >
> > >   	obj = i915_gem_object_create_internal(gt->i915, PAGE_SIZE);
> 
