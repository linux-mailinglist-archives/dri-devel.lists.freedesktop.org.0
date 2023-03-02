Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E92E6A84E6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 16:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1EB10E50A;
	Thu,  2 Mar 2023 15:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE8F10E50A;
 Thu,  2 Mar 2023 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677769587; x=1709305587;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ip4iWJ00oFE4gex3XpejmOUulebLBEinjK5ITQA4ByM=;
 b=CaARN/vHafX613GtxnHe4zvr5bMcuZOWwnA+DpqF0DsN4q5fzr+d74Hl
 QCnPPGqV7/r8P9+MPfrfDuBOdMDplVf7o3cSWRUVhUcvXWZVSyRsqmQdA
 B0eB09a13n7b1Uq2BWoKcsCfVvg2vXxQijtYJSKwCczxvCywZHa4mO6MO
 P5GhE4AwL7bhX/udGyvXiOHq3zmK4rhlensxz5t458b6jlWv2uhLIf74k
 RH2JR1DXyjiewGjuhKBZMBBF0hItPPSaelPtJiq5wAb8uat3vmnaVQEJ0
 IqS6WtXkmM8kBGYnNc4oEPbOkbmylO00ad7aRbANut9uZcJUiHpcgcSTm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="318553776"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="318553776"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:43:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="818056878"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="818056878"
Received: from abals-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.217.187])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:43:54 -0800
Date: Thu, 2 Mar 2023 15:43:51 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915/active: Fix misuse of non-idle barriers as
 fence trackers
Message-ID: <ZAC2JwX6TH2xo3xV@ashyti-mobl2.lan>
References: <20230302120820.48740-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302120820.48740-1-janusz.krzysztofik@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

On Thu, Mar 02, 2023 at 01:08:20PM +0100, Janusz Krzysztofik wrote:
> Users reported oopses on list corruptions when using i915 perf with a
> number of concurrently running graphics applications.  Root cause analysis
> pointed at an issue in barrier processing code -- a race among perf open /
> close replacing active barriers with perf requests on kernel context and
> concurrent barrier preallocate / acquire operations performed during user
> context first pin / last unpin.
> 
> When adding a request to a composite tracker, we try to reuse an existing
> fence tracker, already allocated and registered with that composite.  The
> tracker we obtain may already track another fence, may be an idle barrier,
> or an active barrier.
> 
> If the tracker we get occurs a non-idle barrier then we try to delete that
> barrier from a list of barrier tasks it belongs to.  However, while doing
> that we don't respect return value from a function that performs the
> barrier deletion.  Should the deletion ever fail, we would end up reusing
> the tracker still registered as a barrier task.  Since the same structure
> field is reused with both fence callback lists and barrier tasks list,
> list corruptions would likely occur.
> 
> Barriers are now deleted from a barrier tasks list by temporarily removing
> the list content, traversing that content with skip over the node to be
> deleted, then populating the list back with the modified content.  Should
> that intentionally racy concurrent deletion attempts be not serialized,
> one or more of those may fail because of the list being temporary empty.
> 
> Related code that ignores the results of barrier deletion was initially
> introduced in v5.4 by commit d8af05ff38ae ("drm/i915: Allow sharing the
> idle-barrier from other kernel requests").  However, all users of the
> barrier deletion routine were apparently serialized at that time, then the
> issue didn't exhibit itself.  Results of git bisect with help of a newly
> developed igt@gem_barrier_race@remote-request IGT test indicate that list
> corruptions might start to appear after commit 311770173fac ("drm/i915/gt:
> Schedule request retirement when timeline idles"), introduced in v5.5.
> 
> Respect results of barrier deletion attempts -- mark the barrier as idle
> only if successfully deleted from the list.  Then, before proceeding with
> setting our fence as the one currently tracked, make sure that the tracker
> we've got is not a non-idle barrier.  If that check fails then don't use
> that tracker but go back and try to acquire a new, usable one.
> 
> v3: use unlikely() to document what outcome we expect (Andi),
>   - fix bad grammar in commit description.
> v2: no code changes,
>   - blame commit 311770173fac ("drm/i915/gt: Schedule request retirement
>     when timeline idles"), v5.5, not commit d8af05ff38ae ("drm/i915: Allow
>     sharing the idle-barrier from other kernel requests"), v5.4,
>   - reword commit description.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6333
> Fixes: 311770173fac ("drm/i915/gt: Schedule request retirement when timeline idles")
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: stable@vger.kernel.org # v5.5
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

I hope to see some future cleanups here, as well. Let's tie a
knot in our handkerchiefs to remind ourselves to revisit this in
the future.

Thanks,
Andi
