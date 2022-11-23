Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35CF635BB5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 12:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F3110E212;
	Wed, 23 Nov 2022 11:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525C510E212;
 Wed, 23 Nov 2022 11:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669202965; x=1700738965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uI76gLHqjg3EbD2fwGA5+x9IXC5dacGf/C8WjloFYsY=;
 b=ab7H2qLtBM45ezDivJLaF5vyIOK+/kj08tKE7yFdfRtuWz1X6C56AB19
 PsJhMXsCTxjFGnxs7VKVq49yZQe0GOy64UYpex3l8wQxhoO9rN5vLlvAa
 zdMShOAL0eySkcM4BtO5Wlfgc/ZwlXRrGK41MAclA3p7lBA+Q4yxy03Wm
 pIvS/FYqOslfFHY0SueuqRWXNwfQSoa6pfzQf7Ym8SgEMGQ+Ka1/CXyYf
 XUWHxYqsjXeR4Q63QRlcM+Fdpgc34LmkUcYskLhr5B4zniLKXlKQ3LZHb
 WRIwF5OopHXMot7zwF859cjSoXQRJ+SpgObps9DnMAm+0aAudjAP0RBp+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="293752870"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="293752870"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 03:29:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="705332837"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="705332837"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.17.125])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 03:29:22 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/i915: Fix negative value passed as
 remaining time
Date: Wed, 23 Nov 2022 12:29:19 +0100
Message-ID: <1933091.usQuhbGJ8B@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <d05b3556-19c7-6b50-8f23-0d17428dc741@linux.intel.com>
References: <20221121145655.75141-1-janusz.krzysztofik@linux.intel.com>
 <8188363.NyiUUSuA9g@jkrzyszt-mobl1.ger.corp.intel.com>
 <d05b3556-19c7-6b50-8f23-0d17428dc741@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 22 November 2022 11:41:29 CET Tvrtko Ursulin wrote:
> 
> On 21/11/2022 23:19, Janusz Krzysztofik wrote:
> > Hi Andrzej,
> > 
> > Thanks for providing your R-b.
> > 
> > On Monday, 21 November 2022 18:40:51 CET Andrzej Hajda wrote:
> >> On 21.11.2022 15:56, Janusz Krzysztofik wrote:
> >>> Commit b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work
> >>> with GuC") extended the API of intel_gt_retire_requests_timeout() with an
> >>> extra argument 'remaining_timeout', intended for passing back unconsumed
> >>> portion of requested timeout when 0 (success) is returned.  However, when
> >>> request retirement happens to succeed despite an error returned by a call
> >>> to dma_fence_wait_timeout(), that error code (a negative value) is passed
> >>> back instead of remaining time.  If we then pass that negative value
> >>> forward as requested timeout to intel_uc_wait_for_idle(), an explicit BUG
> >>> will be triggered.
> 
> Right, AFAICT a GEM_BUG_ON in debug builds, but in production builds 
> negative timeout will get passed along all the way to schedule_timeout 
> where error and call trace will be dumped. So fix appears warranted indeed.
> 
> >>> If request retirement succeeds but an error code is passed back via
> >>> remaininig_timeout, we may have no clue on how much of the initial timeout
> >>> might have been left for spending it on waiting for GuC to become idle.
> >>> OTOH, since all pending requests have been successfully retired, that
> >>> error code has been already ignored by intel_gt_retire_requests_timeout(),
> >>> then we shouldn't fail.
> >>>
> >>> Assume no more time has been left on error and pass 0 timeout value to
> >>> intel_uc_wait_for_idle() to give it a chance to return success if GuC is
> >>> already idle.
> >>>
> >>> v3: Don't fail on any error passed back via remaining_timeout.
> >>>
> >>> v2: Fix the issue on the caller side, not the provider.
> >>>
> >>> Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work
> > with GuC")
> >>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> >>> Cc: stable@vger.kernel.org # v5.15+
> >>
> >> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > 
> > While still open for comments from others, I'm now looking for potential
> > committer.
> 
> Both patches are considered good to go?

Yes, I hope so.  The actual diff of 2/2 v3 has received R-b from Andrzej still 
under discussion of v2, then I decided to add that tag to v3.

Andrzej, can you please respond to 2/2 v3 and confirm your R-b applies?

Thanks,
Janusz

> 
> Regards,
> 
> Tvrtko
> 
> > 
> > Thanks,
> > Janusz
> > 
> > 
> >>
> >> Regards
> >> Andrzej
> >>
> >>> ---
> >>>    drivers/gpu/drm/i915/gt/intel_gt.c | 9 +++++++--
> >>>    1 file changed, 7 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/
> > intel_gt.c
> >>> index b5ad9caa55372..7ef0edb2e37cd 100644
> >>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> >>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> >>> @@ -677,8 +677,13 @@ int intel_gt_wait_for_idle(struct intel_gt *gt, long
> > timeout)
> >>>    			return -EINTR;
> >>>    	}
> >>>    
> >>> -	return timeout ? timeout : intel_uc_wait_for_idle(&gt->uc,
> >>> -							
> > remaining_timeout);
> >>> +	if (timeout)
> >>> +		return timeout;
> >>> +
> >>> +	if (remaining_timeout < 0)
> >>> +		remaining_timeout = 0;
> >>> +
> >>> +	return intel_uc_wait_for_idle(&gt->uc, remaining_timeout);
> >>>    }
> >>>    
> >>>    int intel_gt_init(struct intel_gt *gt)
> >>
> >>
> > 
> > 
> > 
> > 
> 




