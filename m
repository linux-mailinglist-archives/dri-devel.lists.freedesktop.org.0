Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E03631B73
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 09:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0871010E165;
	Mon, 21 Nov 2022 08:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE7A10E165;
 Mon, 21 Nov 2022 08:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669019447; x=1700555447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pdnKycsOfYWpXT1hd7ZvzlSm6xze518SOmM9Ii97qO0=;
 b=NVuGlBapf50zMlLkgz0W0m1dofA9bnu24WK3lIrbOoa0nqMUdqXKT3TK
 0Ke6zuse2bp5jwW7sEF2SHeYRcMUr4CC5cdFwba0ZxuPUgUwG9B0Bkg0R
 e7S9OMkwOCH/o1aYHDXdTqbKIFNICTVZF7UWxSiTwvpz2oJ+2M06xVUOs
 rPw4ZsC2FyZXu5lM0H2N/6AR50aNpziJ7pF8YNIqM3/0mJO8oOJk7mgU2
 IHXmd2i1X1h0Hrb7AUnAdIAl2nxLJsmdJot/8/9jkWpOLCtRIS+YhatBt
 zn8RNurwRwvQ6For3bpa2Eyf08Ynp9yGFEHhNjLE+IzBP4LrPXYQDglU7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="315324080"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; d="scan'208";a="315324080"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 00:30:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="765882015"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; d="scan'208";a="765882015"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.31.92])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 00:30:42 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Das,
 Nirmoy" <nirmoy.das@linux.intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915: Never return 0 if not all requests
 retired
Date: Mon, 21 Nov 2022 09:30:38 +0100
Message-ID: <3200694.aeNJFYEL58@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b7b01eef-3550-9f9f-11d0-8698fa322f66@linux.intel.com>
References: <20221118104222.57328-1-janusz.krzysztofik@linux.intel.com>
 <20221118104222.57328-3-janusz.krzysztofik@linux.intel.com>
 <b7b01eef-3550-9f9f-11d0-8698fa322f66@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 John Harrison <John.C.Harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nimroy,

Thanks for looking at this.

On Friday, 18 November 2022 20:56:50 CET Das, Nirmoy wrote:
> 
> On 11/18/2022 11:42 AM, Janusz Krzysztofik wrote:
> > Users of intel_gt_retire_requests_timeout() expect 0 return value on
> > success.  However, we have no protection from passing back 0 potentially
> > returned by a call to dma_fence_wait_timeout() when it succedes right
> > after its timeout has expired.
> >
> > Replace 0 with -ETIME before potentially using the timeout value as return
> > code, so -ETIME is returned if there are still some requests not retired
> > after timeout, 0 otherwise.
> >
> > v2: Move the added lines down so flush_submission() is not affected.
> >
> > Fixes: f33a8a51602c ("drm/i915: Merge wait_for_timelines with 
retire_request")
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: stable@vger.kernel.org # v5.5+
> > ---
> >   drivers/gpu/drm/i915/gt/intel_gt_requests.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/
drm/i915/gt/intel_gt_requests.c
> > index edb881d756309..3ac4603eeb4ee 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> > @@ -199,6 +199,9 @@ out_active:	spin_lock(&timelines->lock);
> >   	if (remaining_timeout)
> >   		*remaining_timeout = timeout;
> >   
> > +	if (!timeout)
> > +		timeout = -ETIME;
> 
> This will return error, -ETIME when 0 timeout is passed, 
> intel_gt_retire_requests().

Yes, but only when active_count is not 0 after we loop through 
timelines->active_list calling retire_requests() on each and counting up 
failures in active_count.

> We don't want that. 

When 0 timeout is passed to intel_gt_retire_requests(), do we really want it 
to return 0 unconditionally, or are we rather interested if those calls to 
retire_requests() succeeded?

> I think you can use a separate variable to store 
> return val from the dma_fence_wait_timeout()
> 
> 
> Regards,
> 
> Nirmoy
> 
> > +
> >   	return active_count ? timeout : 0;

If active count is 0, we return 0 regardless of timeout value, and that's OK.  
However, if active_count is not 0, we shouldn't return 0, I believe, we should 
return either remaining time if some left, or error (-ETIME) if not.  If you 
think I'm wrong, please explain why.

Thanks,
Janusz

> >   }
> >   
> 




