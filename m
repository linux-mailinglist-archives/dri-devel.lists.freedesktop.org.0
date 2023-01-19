Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0C4673D5F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 16:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C8D10E97A;
	Thu, 19 Jan 2023 15:21:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F6B10E97A;
 Thu, 19 Jan 2023 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674141668; x=1705677668;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4dB+bt3aRHg6hYiUPg05BOd4Z/eqHo3Wst37KVXzPBM=;
 b=Obk4LS7w3b/7TvtSFIhdN/cq2RNhNjEkcj5cdEsX9h+Qyii4/5MjQtAP
 oeXBTMrvsqoNrORtt/69nYtBg4TQP0EAH/GnCO9Lfgci5f8xvSBHpNG8O
 EN7RjVKlV50iCleBTBMZpmUGER9GV4LU2FhbhtfMMwLS6o9FELdPCrb9d
 tDquMeLH8N2MphR3kPq7XBWdVGc713AzbakIwpjID9Lj2fqgYtOAvKGhD
 4hiCBdrnMHwehXDNzJJN3tIfd6+wQ50EGyzFaVn+9XaB393o/1IXdpvU6
 Bb0ono3D5e3gs+TCCcfgbkmDPJryXYIEgMltFpoCxvof84Yv0QoZmjZ11 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="322998701"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="322998701"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 07:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="653411322"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="653411322"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007.jf.intel.com with ESMTP; 19 Jan 2023 07:16:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pIWeb-00Bizh-39; Thu, 19 Jan 2023 17:16:37 +0200
Date: Thu, 19 Jan 2023 17:16:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [PATCH v3 1/6] drm/i915: Fix request locking during error
 capture & debugfs dump
Message-ID: <Y8le1Z1nfSR2QWrg@smile.fi.intel.com>
References: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
 <20230119065000.1661857-2-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119065000.1661857-2-John.C.Harrison@Intel.com>
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
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 10:49:55PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> When GuC support was added to error capture, the locking around the
> request object was broken. Fix it up.
> 
> The context based search manages the spinlocking around the search
> internally. So it needs to grab the reference count internally as
> well. The execlist only request based search relies on external
> locking, so it needs an external reference count but within the
> spinlock not outside it.
> 
> The only other caller of the context based search is the code for
> dumping engine state to debugfs. That code wasn't previously getting
> an explicit reference at all as it does everything while holding the
> execlist specific spinlock. So, that needs updaing as well as that
> spinlock doesn't help when using GuC submission. Rather than trying to
> conditionally get/put depending on submission model, just change it to
> always do the get/put.
> 
> In addition, intel_guc_find_hung_context() was not acquiring the
> correct spinlock before searching the request list. So fix that up
> too. While at it, add some extra whitespace padding for readability.

...

> +		found = false;
> +		spin_lock(&ce->guc_state.lock);
>  		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
>  			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
>  				continue;
>  
> +			found = true;
> +			break;
> +		}

This can be combined to (see also below)

		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
			if (i915_test_request_state(rq) == I915_REQUEST_ACTIVE)
				break;
		}

> +		spin_unlock(&ce->guc_state.lock);

Instead of 'found' you can check the current entry pointer

		if (!list_entry_is_head(...))

And because requests can only be messed up with the guc_state itself, I think
you don't need to perform the above check under spinlock, so it's safe.

> +		if (found) {
>  			intel_engine_set_hung_context(engine, ce);

-- 
With Best Regards,
Andy Shevchenko


