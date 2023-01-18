Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0575D67259A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 18:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A3810E7BC;
	Wed, 18 Jan 2023 17:54:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA46D10E7BC;
 Wed, 18 Jan 2023 17:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674064490; x=1705600490;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IaQ3xMHQ+VW3JIZedZV42wA0ZpVRFrLWkzPeN1T/OYU=;
 b=h9HbfjaN6lvDDNvA3k2uD1FK3g5mH0ju5L17XaWwkbi8qIOQe/lK0xdA
 UI3KFRKQicprLE4YCzCMDqNHzgnce11EL3fIlHq8G+j37ZG6DSYfUclue
 AdP+s+VxU7bnhPJF1DYT+U3irJH40EzRExIVQUXTDuaXNOokFoCkIaP4M
 HOdi0ZL0j5uw8MJM/ZclyCD0S+JcOuKspaheqOVolXHHqDsOdbbFA1W9B
 KEdg4pkHiAWZNPzvadM5xmroydvxrj7Okq9huYmvW5C/FGNYLsIyJfADh
 dRMC2C861vlcI4T/5OkYVLEDBOuEUmZMwHjnpCj6HeOlIXpPz7A3Ci5Xw g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308614435"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="308614435"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 09:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="723189599"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="723189599"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2023 09:54:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pICe6-00BJ6g-38; Wed, 18 Jan 2023 19:54:46 +0200
Date: Wed, 18 Jan 2023 19:54:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH v2 1/5] drm/i915: Fix request locking during error
 capture & debugfs dump
Message-ID: <Y8gyZvVpZ19NkA0d@smile.fi.intel.com>
References: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
 <20230117213630.2897570-2-John.C.Harrison@Intel.com>
 <Y8et+QikzQE88t1L@smile.fi.intel.com>
 <8d9b9bdb-7e08-47b5-416c-69e743675e45@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d9b9bdb-7e08-47b5-416c-69e743675e45@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 09:34:47AM -0800, John Harrison wrote:
> On 1/18/2023 00:29, Andy Shevchenko wrote:
> > On Tue, Jan 17, 2023 at 01:36:26PM -0800, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > When GuC support was added to error capture, the locking around the
> > > request object was broken. Fix it up.
> > > 
> > > The context based search manages the spinlocking around the search
> > > internally. So it needs to grab the reference count internally as
> > > well. The execlist only request based search relies on external
> > > locking, so it needs an external reference count. So no change to that
> > > code itself but the context version does change.
> > > 
> > > The only other caller is the code for dumping engine state to debugfs.
> > > That code wasn't previously getting an explicit reference at all as it
> > > does everything while holding the execlist specific spinlock. So that
> > > needs updaing as well as that spinlock doesn't help when using GuC
> > > submission. Rather than trying to conditionally get/put depending on
> > > submission model, just change it to always do the get/put.
> > > 
> > > In addition, intel_guc_find_hung_context() was not acquiring the
> > > correct spinlock before searching the request list. So fix that up too.
> > > Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU reset
> > > with GuC")
> > Must be one line.
> In my tree it is one line. git itself does the line wrap when creating the
> email.

Can you elaborate? I never have had such issue with git send-email (starting
from v1.6.x of Git for sure).

> I missed that I need to manually unwrap it again before actually
> sending the email. Although the CI checkpatch also pointed this out in it's
> own obscure manner.

...

> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > Cc: Michael Cheng <michael.cheng@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > Cc: Bruce Chang <yu.bruce.chang@intel.com>
> > > Cc: intel-gfx@lists.freedesktop.org
> > Is it possible to utilize --to --cc parameters to git send-email instead of
> > noisy Cc list?
> This is the list auto-generated by the 'dim fixes' tool. I am told this is
> the officially correct way to create a fixes patch - copy the output from
> 'dim fixes' as is into the patch headers.

Okay, so it may be question to the `dim` tool then...

...

> > Stray change.
> Intentional change to improve the readability of a function that is being
> modified by other changes in this patch.

But not described in the commit message. That's why "stray".

-- 
With Best Regards,
Andy Shevchenko


