Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 651C9635640
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B6310E52F;
	Wed, 23 Nov 2022 09:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C93D10E52F;
 Wed, 23 Nov 2022 09:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669195741; x=1700731741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dGBbXbJkt1BcetZNMsjzvf6JeP4I/PBq3zFLv4Y0Ikg=;
 b=HeotCluSfylCVoZAchOmYGc+ISaRGBJgzXy9XR7qNBiJ+33r3wqOET2l
 TF+u7DHGTYAYYdIduPfDYX5aIE+Qy4rf/CDTqDv0NjDpnCQjieXEoNsfF
 KOaGTb+8DMYwkYvV0KLOCTHuD+Cfh9EJLgImLk7yJ9qONYPw34eN19sxJ
 5WEGvsDjPVhZFTX0FbzBRPczkWSDZaqS9KiXg4pJX4bxASX8Uqp0QDpqn
 CX8gTBmM3ZbcQ4LgExINUavqv3rcl02CPtaT6TaoXjhevYjs6MCn904Yh
 ia8JmJ8vbhA7WhpFan2v0GJz+Ag3v2v9SsSeipHH/FbRPrRlC0cs13RJ1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="311653697"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="311653697"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 01:28:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="710522453"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="710522453"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.17.125])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 01:28:42 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v3 2/2] drm/i915: Never return 0 if not all requests
 retired
Date: Wed, 23 Nov 2022 10:28:40 +0100
Message-ID: <9026056.CDJkKcVGEf@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <6a465c20-b0a7-4beb-6d1b-4ff66a29975f@linux.intel.com>
References: <20221121145655.75141-1-janusz.krzysztofik@linux.intel.com>
 <20221121145655.75141-3-janusz.krzysztofik@linux.intel.com>
 <6a465c20-b0a7-4beb-6d1b-4ff66a29975f@linux.intel.com>
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
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 John Harrison <John.C.Harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

Thanks for your comments.

On Tuesday, 22 November 2022 11:50:38 CET Tvrtko Ursulin wrote:
> 
> On 21/11/2022 14:56, Janusz Krzysztofik wrote:
> > Users of intel_gt_retire_requests_timeout() expect 0 return value on
> > success.  However, we have no protection from passing back 0 potentially
> > returned by a call to dma_fence_wait_timeout() when it succedes right
> > after its timeout has expired.
> 
> Is this talking about a potential weakness, or ambiguous kerneldoc, of 
> dma_fence_wait_timeout, dma_fence_default_wait and 
> i915_request_wait_timeout? They appear to say 0 return means timeout, 
> implying unsignaled fence. In other words signaled must return positive 
> remaining timeout. Implementations seems to allow a race which indeed 
> appears that return 0 and signaled fence is possible.

While my initial analysis was indeed focused on inconsistent semantics of 0 
return values from different dma_fence_default_wait() backends, I should have 
also mentioned in this commit description that users may perfectly 
call intel_gt_retire_requests_timeout() with 0 timeout, in which case the 
false positive 0 value can be returned regardless of dma_fence_wait_timeout() 
potential issues.  Would you like me to reword and resubmit?

> If dma_fence_wait can indeed return 0 even when a request is signaled, 
> then how is timeout ?: -ETIME below correct? It isn't a chance for false 
> negative in its' callers?

The goal of intel_gt_retire_requests_timeout() is to retire requests.  When 
that goal has been reached, i.e., all requests have been retired, active count 
is 0, and 0 is correctly returned, regardless of timeout value.

The value of timeout is used only when there are still pending requests, which 
means that the goal hasn't been reached and the function hasn't succeeded.  
Then, no false negative is possible, unlike the false positive that we now 
have when we return 0  while some requests are still pending.

Thanks,
Janusz

> 
> Regards,
> 
> Tvrtko
> 
> > Replace 0 with -ETIME before potentially using the timeout value as return
> > code, so -ETIME is returned if there are still some requests not retired
> > after timeout, 0 otherwise.
> > 
> > v3: Use conditional expression, more compact but also better reflecting
> >      intention standing behind the change.
> > 
> > v2: Move the added lines down so flush_submission() is not affected.
> > 
> > Fixes: f33a8a51602c ("drm/i915: Merge wait_for_timelines with retire_request")
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: stable@vger.kernel.org # v5.5+
> > ---
> >   drivers/gpu/drm/i915/gt/intel_gt_requests.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> > index edb881d756309..1dfd01668c79c 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> > @@ -199,7 +199,7 @@ out_active:	spin_lock(&timelines->lock);
> >   	if (remaining_timeout)
> >   		*remaining_timeout = timeout;
> >   
> > -	return active_count ? timeout : 0;
> > +	return active_count ? timeout ?: -ETIME : 0;
> >   }
> >   
> >   static void retire_work_handler(struct work_struct *work)
> 




