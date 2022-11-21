Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C206963309A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 00:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E9910E344;
	Mon, 21 Nov 2022 23:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B951710E353;
 Mon, 21 Nov 2022 23:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669072433; x=1700608433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9GbJtB/pFucX+YFDbSw5MNy4L11Mtr/QAZz9A8G0Sgw=;
 b=hUnm/+P4L4GiNwM+KdGaLMWcdPlqHiHi2fUjDYv4OrktLeLT02GOimCS
 dwdBxOlCcA7udzekeYR4VOpWc90G0uiuEhHuSk0zo2LvcrOu5i3pZ/KaU
 TT3CNCgBzQdY6N0UNcSVSoDugP8+GqkUhjyWCyp1DYArG3eLft2nP4Ygi
 eCLUu9Ra/oIGBrMsyR+ydUsj2z1LEITWkqvOBb9k1uSi0bMQ1ybXVEXck
 dgQ9IIj8WQc/C3p0MEWfETXs6lyvpUekUYHcz3QmK4Nq5Opx6dZtAlD4o
 bUWjZ/ITbSTEZOKCwBFxax95tlwyPJ0JT0LrN7ZGuasVzcTNA3LXyvtLh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="301230811"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="301230811"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 15:13:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="886296733"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="886296733"
Received: from pdorozyn-mobl.ger.corp.intel.com (HELO
 jkrzyszt-mobl1.ger.corp.intel.com) ([10.213.28.217])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 15:13:49 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Das,
 Nirmoy" <nirmoy.das@linux.intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915: Never return 0 if not all
 requests retired
Date: Tue, 22 Nov 2022 00:13:47 +0100
Message-ID: <9028647.CDJkKcVGEf@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <f55479c0-ca32-c8ae-119d-d1c9dbb71ce5@intel.com>
References: <20221118104222.57328-1-janusz.krzysztofik@linux.intel.com>
 <2856001.e9J7NaK4W3@jkrzyszt-mobl1.ger.corp.intel.com>
 <f55479c0-ca32-c8ae-119d-d1c9dbb71ce5@intel.com>
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
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

Thanks for providing your R-b, however, I'd still like to convince you that my 
approach, which you accepted anyway, is better justified than if we updated 0 
timeout with -ETIME immediately after returned by dma_fence_wait_timeout().

On Monday, 21 November 2022 13:12:00 CET Andrzej Hajda wrote:
> On 21.11.2022 11:59, Janusz Krzysztofik wrote:
> > On Monday, 21 November 2022 11:51:15 CET Janusz Krzysztofik wrote:
> >> Hi Andrzej,
> >>
> >> Thanks for your comment.
> >>
> >> On Monday, 21 November 2022 11:17:42 CET Andrzej Hajda wrote:
> >>>
> >>> On 21.11.2022 09:30, Janusz Krzysztofik wrote:
> >>>> Hi Nimroy,
> >>>>
> >>>> Thanks for looking at this.
> >>>>
> >>>> On Friday, 18 November 2022 20:56:50 CET Das, Nirmoy wrote:
> >>>>> On 11/18/2022 11:42 AM, Janusz Krzysztofik wrote:
> >>>>>> Users of intel_gt_retire_requests_timeout() expect 0 return value on
> >>>>>> success.  However, we have no protection from passing back 0 potentially
> >>>>>> returned by a call to dma_fence_wait_timeout() when it succedes right
> >>>>>> after its timeout has expired.
> >>>>>>
> >>>>>> Replace 0 with -ETIME before potentially using the timeout value as return
> >>>>>> code, so -ETIME is returned if there are still some requests not retired
> >>>>>> after timeout, 0 otherwise.
> >>>>>>
> >>>>>> v2: Move the added lines down so flush_submission() is not affected.
> >>>>>>
> >>>>>> Fixes: f33a8a51602c ("drm/i915: Merge wait_for_timelines with
> >>>> retire_request")
> >>>>>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> >>>>>> Cc: stable@vger.kernel.org # v5.5+
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/i915/gt/intel_gt_requests.c | 3 +++
> >>>>>>     1 file changed, 3 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/
> >>>> drm/i915/gt/intel_gt_requests.c
> >>>>>> index edb881d756309..3ac4603eeb4ee 100644
> >>>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> >>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> >>>>>> @@ -199,6 +199,9 @@ out_active:	spin_lock(&timelines->lock);
> >>>>>>     	if (remaining_timeout)
> >>>>>>     		*remaining_timeout = timeout;
> >>>>>>     
> >>>>>> +	if (!timeout)
> >>>>>> +		timeout = -ETIME;
> >>>>> This will return error, -ETIME when 0 timeout is passed,
> >>>>> intel_gt_retire_requests().
> >>>> Yes, but only when active_count is not 0 after we loop through
> >>>> timelines->active_list calling retire_requests() on each and counting up
> >>>> failures in active_count.
> >>>
> >>> Moving this line just after the call to dma_fence_wait_timeout should
> >>> solve the controversy.
> >>
> >> But that would break our need to pass 0, not -ETIME, to flush_submission() in
> >> case the initial value of timeout was 0, as pointed out by Chris during our
> >> discussion on v2.
> >>
> >> Maybe an inline comment above the added lines that explains why we are doing
> >> this could help?
> > 
> > How about not adding those two lines but modifying the return line instead?
> > 
> > -	return active_count ? timeout : 0;
> > +	return active_count ? timeout ?: -ETIME : 0;
> 
> Personally I would translate ret value from dma_fence* API ASAP, 

I think that would suggest we are trying to fix a problematic 0 response from 
dma_fence_wait_timeout() on success, while we already agreed with Chris' 
opinion that 0 is perfectl OK in that case, and returning 1 should be rather 
considered as problematic, since 0 just means success but no time left, and 
-ETIME means no success within timeout.  That's what had been implemented one 
time in our i915_request_wait_timeuout() backend, regardless of any breakage 
potentially introduced by later patches.

Then, fixing 0 return value from dma_fence_wait_timeout(), which is OK, is not 
what this patch is about.  The real problem is inconsistency between our 
declared API of i915_retire_reqiests_wait_timeout(), which promises to return 
0 on success, and that 0 remaining timeout value from dma_fence_wait_timeout() 
that we can potentially return when not all requests have been retired.  
That's what the patch is trying to fix, regardless of what that 0 timeout 
value can tell us about success or failure of a single call to 
dma_fence_wait_timeout(), not even speaking of a case when the function is 
called with timeout already equal 0.  Focused on success of retire_requests() 
rather than dma_fence_wait_timeout(), we generally ignore error codes from the 
latter, using them only for skipping next calls to that function, based on an 
assumption that no more time has been left.

Then, clearly fixing just our return value in the problematic case of 0 time 
left while not all requests have been retired seems the best option to me.

I've added your R-b to my v3 which implements just what you've accepted -- I 
hope you don't mind.

Thanks,
Janusz

> and 
> call flush_submission conditionally - to limit coexistence of both APIs.
> But this looks correct to me, as well.
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Regards
> Andrzej
> 
> > 
> > Would that be self explanatory?
> > 
> > Thanks,
> > Janusz
> > 
> >>
> >> Thanks,
> >> Janusz
> >>
> >>>
> >>> Regards
> >>> Andrzej
> >>>
> >>>>
> >>>>> We don't want that.
> >>>> When 0 timeout is passed to intel_gt_retire_requests(), do we really want it
> >>>> to return 0 unconditionally, or are we rather interested if those calls to
> >>>> retire_requests() succeeded?
> >>>>
> >>>>> I think you can use a separate variable to store
> >>>>> return val from the dma_fence_wait_timeout()
> >>>>>
> >>>>>
> >>>>> Regards,
> >>>>>
> >>>>> Nirmoy
> >>>>>
> >>>>>> +
> >>>>>>     	return active_count ? timeout : 0;
> >>>> If active count is 0, we return 0 regardless of timeout value, and that's OK.
> >>>> However, if active_count is not 0, we shouldn't return 0, I believe, we should
> >>>> return either remaining time if some left, or error (-ETIME) if not.  If you
> >>>> think I'm wrong, please explain why.
> >>>>
> >>>> Thanks,
> >>>> Janusz
> >>>>
> >>>>>>     }
> >>>>>>     
> >>>>
> >>>>
> >>>>
> >>>
> >>>
> >>
> >>
> > 
> > 
> > 
> > 
> 
> 




