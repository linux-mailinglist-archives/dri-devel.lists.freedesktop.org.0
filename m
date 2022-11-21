Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468336330A7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 00:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6473B10E346;
	Mon, 21 Nov 2022 23:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D6110E18D;
 Mon, 21 Nov 2022 23:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669072779; x=1700608779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yy1NK+JbZ/gF9hcdJKRhcjZhGjaIhJ59gbbzwxB6+Xg=;
 b=VvBPbZ9HVx1tEiUryccgL98CHP8fHuvAs4Te4vxsnw0em+C8JR3pbZS2
 0P4+V9HDqgX43F/PvKdxQDOShxVIp+R55ISEckvpakvoRhnQ2MZMT33fI
 2nJ2XXvsqX8NEgBoce+YSVcJNJqZGErzaTKplWKsSIyVn0XsVbUpaUye/
 NVIsVSUP63NIe9q9ebbf2BMVvyVpkFlJaAGaC8APRjBLopd37lcRwOjrx
 n3GDgRURbeA4Pm1b/Mh+i1mCE33lzgKhvWSZrQzpR3r3mDPl4E42I33lo
 RzUu3lGY1l11aFuk95eozmTW604EAkqpQl9xw0xWlB/3uBu3Y9NOICRKN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="314832789"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="314832789"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 15:19:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="672268463"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="672268463"
Received: from pdorozyn-mobl.ger.corp.intel.com (HELO
 jkrzyszt-mobl1.ger.corp.intel.com) ([10.213.28.217])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 15:19:35 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/i915: Fix negative value passed as
 remaining time
Date: Tue, 22 Nov 2022 00:19:32 +0100
Message-ID: <8188363.NyiUUSuA9g@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <37493d84-441b-76fa-d42b-ae1764a361bb@intel.com>
References: <20221121145655.75141-1-janusz.krzysztofik@linux.intel.com>
 <20221121145655.75141-2-janusz.krzysztofik@linux.intel.com>
 <37493d84-441b-76fa-d42b-ae1764a361bb@intel.com>
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

Hi Andrzej,

Thanks for providing your R-b.

On Monday, 21 November 2022 18:40:51 CET Andrzej Hajda wrote:
> On 21.11.2022 15:56, Janusz Krzysztofik wrote:
> > Commit b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work
> > with GuC") extended the API of intel_gt_retire_requests_timeout() with an
> > extra argument 'remaining_timeout', intended for passing back unconsumed
> > portion of requested timeout when 0 (success) is returned.  However, when
> > request retirement happens to succeed despite an error returned by a call
> > to dma_fence_wait_timeout(), that error code (a negative value) is passed
> > back instead of remaining time.  If we then pass that negative value
> > forward as requested timeout to intel_uc_wait_for_idle(), an explicit BUG
> > will be triggered.
> > 
> > If request retirement succeeds but an error code is passed back via
> > remaininig_timeout, we may have no clue on how much of the initial timeout
> > might have been left for spending it on waiting for GuC to become idle.
> > OTOH, since all pending requests have been successfully retired, that
> > error code has been already ignored by intel_gt_retire_requests_timeout(),
> > then we shouldn't fail.
> > 
> > Assume no more time has been left on error and pass 0 timeout value to
> > intel_uc_wait_for_idle() to give it a chance to return success if GuC is
> > already idle.
> > 
> > v3: Don't fail on any error passed back via remaining_timeout.
> > 
> > v2: Fix the issue on the caller side, not the provider.
> > 
> > Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work 
with GuC")
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: stable@vger.kernel.org # v5.15+
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

While still open for comments from others, I'm now looking for potential 
committer.

Thanks,
Janusz


> 
> Regards
> Andrzej
> 
> > ---
> >   drivers/gpu/drm/i915/gt/intel_gt.c | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/
intel_gt.c
> > index b5ad9caa55372..7ef0edb2e37cd 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > @@ -677,8 +677,13 @@ int intel_gt_wait_for_idle(struct intel_gt *gt, long 
timeout)
> >   			return -EINTR;
> >   	}
> >   
> > -	return timeout ? timeout : intel_uc_wait_for_idle(&gt->uc,
> > -							  
remaining_timeout);
> > +	if (timeout)
> > +		return timeout;
> > +
> > +	if (remaining_timeout < 0)
> > +		remaining_timeout = 0;
> > +
> > +	return intel_uc_wait_for_idle(&gt->uc, remaining_timeout);
> >   }
> >   
> >   int intel_gt_init(struct intel_gt *gt)
> 
> 




