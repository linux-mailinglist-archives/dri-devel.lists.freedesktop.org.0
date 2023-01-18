Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FB67164E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 09:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFF410E184;
	Wed, 18 Jan 2023 08:29:54 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6F010E10D;
 Wed, 18 Jan 2023 08:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674030592; x=1705566592;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hd+NYneLBIAY9f1rlyWmG8Fx5MU7PPQmxwtR9U8seHY=;
 b=nv6AyHwULcTHkHOHTzZlbfIiSRf2/2TCMGF5/G0tRchYoRqXRi/okhYN
 KymsTrhsLe/X7aqavQ9HH4boaIejZalGDIGkibHs3S7zQ9txMWd5+WY3y
 12r02xtmNpscwoNwWRN4xfg+jW0f7uNnMRda6nrpVomJjKFtCBwT0pogP
 aNFPeczhG7aMDnAbzhyfhf45nbryTjMUoKDE4J4nXzxa2H9vBbwWTGLZk
 BPofUm0YJZpHUsu1StNwjUavtTgPKy+ODVGl8v/UZNsdX7Np8OPa9ncqN
 OX4pz3HwjBnExywMSIKscKzrAicRmnQS/+wfpk137wYKozWExbdGYSTtu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="352177160"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="352177160"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 00:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="748378938"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="748378938"
Received: from smile.fi.intel.com ([10.237.72.54])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2023 00:29:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pI3pK-00B0sS-0S; Wed, 18 Jan 2023 10:29:46 +0200
Date: Wed, 18 Jan 2023 10:29:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [PATCH v2 1/5] drm/i915: Fix request locking during error
 capture & debugfs dump
Message-ID: <Y8et+QikzQE88t1L@smile.fi.intel.com>
References: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
 <20230117213630.2897570-2-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117213630.2897570-2-John.C.Harrison@Intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>,
 Michael Cheng <michael.cheng@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Intel-GFX@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 01:36:26PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> When GuC support was added to error capture, the locking around the
> request object was broken. Fix it up.
> 
> The context based search manages the spinlocking around the search
> internally. So it needs to grab the reference count internally as
> well. The execlist only request based search relies on external
> locking, so it needs an external reference count. So no change to that
> code itself but the context version does change.
> 
> The only other caller is the code for dumping engine state to debugfs.
> That code wasn't previously getting an explicit reference at all as it
> does everything while holding the execlist specific spinlock. So that
> needs updaing as well as that spinlock doesn't help when using GuC
> submission. Rather than trying to conditionally get/put depending on
> submission model, just change it to always do the get/put.
> 
> In addition, intel_guc_find_hung_context() was not acquiring the
> correct spinlock before searching the request list. So fix that up too.

> Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU reset
> with GuC")

Must be one line.

> Fixes: 573ba126aef3 ("drm/i915/guc: Capture error state on context reset")

> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Michael Cheng <michael.cheng@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Bruce Chang <yu.bruce.chang@intel.com>
> Cc: intel-gfx@lists.freedesktop.org

Is it possible to utilize --to --cc parameters to git send-email instead of
noisy Cc list?

...

> +	if (hung_rq)
> +		i915_request_put(hung_rq);

In Linux kernel the idiom is that freeing resources APIs should be NULL-aware
(or ERR_PTR aware or both). Does i915 follows that? If so, the test should be
inside i915_request_put() rather than in any of the callers.

...

> @@ -4847,6 +4857,7 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>  			xa_lock(&guc->context_lookup);
>  			goto done;
>  		}
> +
>  next:
>  		intel_context_put(ce);
>  		xa_lock(&guc->context_lookup);

Stray change.

-- 
With Best Regards,
Andy Shevchenko


