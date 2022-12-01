Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5DB63EE51
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808F710E5AF;
	Thu,  1 Dec 2022 10:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFDB10E5AF;
 Thu,  1 Dec 2022 10:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669891530; x=1701427530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FPd/cnFynCMKjYIGIzyRbgxKgwYa2L9p+j2fAvZ51Fs=;
 b=Gk1Lu6y/MmWlg2ZNXAVt7xJ0Vfbib7gO8WpKhnjd21uQ/uaV7P2bEUPg
 D5d9ZeEmw7NSzYnhDEaAwvTKpNdl8lmAdT/VY258l0fPK8oRB37xZHphV
 x3oOH6ovPgbGbu4s2vm9vn4eRKe9ak6Y232ZF4yAraX3KxD/3xBlH/pPC
 ++Yzepu47NJxRqXst6sPGyG4v9aSmr4RMNZJOxU4LOMgP84zwykL/ShmC
 1umo/RniQSbW/9iwAeO0/Z9FMJ2sIdJkIaMfpzDI3uIi5dbqsyemPZPV9
 i3e7sSGo8IJQbVm8HYq1NqUoN1/ESZcte/6FJCqjZAtDPDrVW7TkCSH5X w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="313281413"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="313281413"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 02:45:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="595018269"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="595018269"
Received: from mschmidt-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.6])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 02:45:18 -0800
Date: Thu, 1 Dec 2022 11:45:14 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 3/5] drm/i915: Introduce guard pages to
 i915_vma
Message-ID: <Y4iFuizKSmS2YURK@ashyti-mobl2.lan>
References: <20221130235805.221010-1-andi.shyti@linux.intel.com>
 <20221130235805.221010-4-andi.shyti@linux.intel.com>
 <4f73fed7-9333-6450-e389-fd2b64a8f0e7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f73fed7-9333-6450-e389-fd2b64a8f0e7@linux.intel.com>
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
Cc: Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

[...]

> > @@ -768,8 +773,17 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> >   	GEM_BUG_ON(!IS_ALIGNED(alignment, I915_GTT_MIN_ALIGNMENT));
> >   	GEM_BUG_ON(!is_power_of_2(alignment));
> > +	guard = vma->guard; /* retain guard across rebinds */
> > +	if (flags & PIN_OFFSET_GUARD) {
> > +		GEM_BUG_ON(overflows_type(flags & PIN_OFFSET_MASK, u32));
> > +		guard = max_t(u32, guard, flags & PIN_OFFSET_MASK);
> > +	}
> > +	roundup(guard, BIT(vma->vm->scratch_order + PAGE_SHIFT));
> 
> roundup = ?

ehehe... yes, please ignore, that's some copy/paste error during
the rebase...

> Lets have a comment here as well.
> 
> /*
>  * Be efficient with PTE use by using the native size for the guard.
>  */
> 
> Would that be accurate?

and I also forgot the update of my previous comment... yours is
quite accurate.

> > +
> >   	start = flags & PIN_OFFSET_BIAS ? flags & PIN_OFFSET_MASK : 0;
> >   	GEM_BUG_ON(!IS_ALIGNED(start, I915_GTT_PAGE_SIZE));
> > +	/* We need to be sure we do not ecceed the va area */
> > +	GEM_BUG_ON(2 * guard > end);
> 
> "exceed" but haven't we said this is not needed?

I wrote it in the cover letter. I had an offline chat with Chris
and he was keen to have this check not only for overflow
protection but also for a documentation purpose so that the
reader knows better about the size and usage of the guard.

Does it make sense?

Thanks a lot!

Andi
