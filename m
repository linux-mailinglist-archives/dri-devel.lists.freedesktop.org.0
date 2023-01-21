Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73374676617
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 12:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E7010E150;
	Sat, 21 Jan 2023 11:51:04 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8FB10E06E;
 Sat, 21 Jan 2023 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674301862; x=1705837862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oos7fPKrii4BWDz/gBFOApZlVSf5+1BTlZZNhNV7MJc=;
 b=HD7WMwSjwzwXh+Ye5ASibzgFdwMbB8mNhuwL2cVCLC/debyYsxplbJW3
 v/xtohyX4/AXQof1ZbEHx8NWxQ1S3e/d7Xyo6Sn5JTv3HY5o7FHdkyNZi
 wCtM1eLbKyhLhX3eviEFWaPW6CSAjwgP+7Zk1c+W0ggnt8g+WNpIjEe3p
 YQWqF5MGYwv9NOwckKGXPCUOHN5lOFXo0J94DhIT3buixKgMm2p8SbO0v
 gJ7a56a1X3FMwvKOLvGWg8m5h7MA6b7u0VBeKU7c5JTRFdvTE3j9VRHrE
 TPmNRkclYyldDkzG8IZcNiXMo6R7YAQRm0zJ/58LxddB9QIN/B8smElV3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="305447420"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; d="scan'208";a="305447420"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2023 03:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="662828278"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; d="scan'208";a="662828278"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 21 Jan 2023 03:51:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pJCOg-00Clzl-2C; Sat, 21 Jan 2023 13:50:58 +0200
Date: Sat, 21 Jan 2023 13:50:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH v3 1/6] drm/i915: Fix request locking during error
 capture & debugfs dump
Message-ID: <Y8vRouFYGhINzS8h@smile.fi.intel.com>
References: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
 <20230119065000.1661857-2-John.C.Harrison@Intel.com>
 <Y8le1Z1nfSR2QWrg@smile.fi.intel.com>
 <a52b86fc-8dd1-ec59-94cc-217aa467c315@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a52b86fc-8dd1-ec59-94cc-217aa467c315@intel.com>
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
 Intel-GFX@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 03:06:02PM -0800, John Harrison wrote:
> On 1/19/2023 07:16, Andy Shevchenko wrote:
> > On Wed, Jan 18, 2023 at 10:49:55PM -0800, John.C.Harrison@Intel.com wrote:

...

> > > +		found = false;
> > > +		spin_lock(&ce->guc_state.lock);
> > >   		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
> > >   			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
> > >   				continue;
> > > +			found = true;
> > > +			break;
> > > +		}
> > This can be combined to (see also below)
> > 
> > 		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
> > 			if (i915_test_request_state(rq) == I915_REQUEST_ACTIVE)
> > 				break;
> > 		}
> > 
> > > +		spin_unlock(&ce->guc_state.lock);
> > Instead of 'found' you can check the current entry pointer
> > 
> > 		if (!list_entry_is_head(...))
> > 
> > And because requests can only be messed up with the guc_state itself, I think
> > you don't need to perform the above check under spinlock, so it's safe.
> I'm not following the argument as to why it is safe to test a guc_state
> owned list outside of holding the guc_state spinlock.

The very same reasons why found is not checked inside the lock.
If something bad to the list head pointer happens, it would mean
that we have much bigger issues. And list_entry_is_head() is specifically
to test the loop exit condition.

> I also think that having an explicit 'found' flag makes the code more
> readable and immediately obvious as to what is going on.

It depends on the perception. With boolean I have to go somewhere to be sure
that found has false when loop is fully revolved. (Sometimes it may be the
inverted loops like

    found = true;
    for (...loop...) {
        if (...cond...) {
	   found = false;
	   break;
        }
    }

while with the helper it's obvious)

> For the sake of one
> bool (which the compiler would optimise out anyway),

Is it really optimized away?

> I don't think it is worth the obfuscation of behaviour and the risk of "I
> think this will work".

Whatever, not big deal :)

> > > +		if (found) {
> > >   			intel_engine_set_hung_context(engine, ce);

-- 
With Best Regards,
Andy Shevchenko


