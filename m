Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCCD557518
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B86811A115;
	Thu, 23 Jun 2022 08:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3352511A115;
 Thu, 23 Jun 2022 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655971964; x=1687507964;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0/FMqWEGu0Ug6iTxNqlY0MzigxLWPFdVRBV3Qg+3Htg=;
 b=LAA3eZeJQc+CxjP7hszDzdn8xP4Wv4tTkY032UvaCdcH/taJihK1TfL5
 72Ibab+Amn7CdzEr+I2t4eegvpgttrLJ77Y4GwD2vf8U97YZHefwI93wF
 B5IBH6qyrqBw6QjcwKzYze944RbFxCVrR9wvvTN0bTFKRstbNPh40PJ13
 jq8O7/OgT+v3sTOOpDsFFI+KsKThtmRzrOskxksYMRyZUEbIUTbgOoxUk
 YNz8ZFPtpP9emq64tKQGMeuGNc8HkK78lPTRa8G7pxmLvYilvvj20NW8v
 xw34BqJ8VeQZbLQ/rwMvaK3dMdR2GCOyyhA0ovuPp27qeZWsbUqc3bGP8 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="366977798"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="366977798"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 01:12:43 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="615495051"
Received: from bo3zhang-mobl.amr.corp.intel.com (HELO [10.212.47.148])
 ([10.212.47.148])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 01:12:42 -0700
Message-ID: <98ede729-2087-7a92-5eb1-b8779c68ee05@linux.intel.com>
Date: Thu, 23 Jun 2022 09:12:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for waitboost
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
References: <20220515060506.22084-1-vinay.belgaumkar@intel.com>
 <87pmj11r2i.wl-ashutosh.dixit@intel.com>
 <c7849ab9-2d41-5172-5fe7-0d8726a11b81@intel.com>
 <87h74cxua1.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87h74cxua1.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, John Harrison <john.c.harrison@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/06/2022 22:28, Dixit, Ashutosh wrote:
> On Wed, 22 Jun 2022 13:30:23 -0700, Belgaumkar, Vinay wrote:
>> On 6/21/2022 5:26 PM, Dixit, Ashutosh wrote:
>>> On Sat, 14 May 2022 23:05:06 -0700, Vinay Belgaumkar wrote:
>>> The issue I have is what happens when we de-boost (restore min freq to its
>>> previous value in intel_guc_slpc_dec_waiters()). It would seem that that
>>> call is fairly important to get the min freq down when there are no pending
>>> requests. Therefore what do we do in that case?
>>>
>>> This is the function:
>>>
>>> void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
>>> {
>>>           mutex_lock(&slpc->lock);
>>>           if (atomic_dec_and_test(&slpc->num_waiters))
>>>                   slpc_force_min_freq(slpc, slpc->min_freq_softlimit);
>>>           mutex_unlock(&slpc->lock);
>>> }
>>>
>>>
>>> 1. First it would seem that at the minimum we need a similar drm_notice()
>>>      in intel_guc_slpc_dec_waiters(). That would mean we need to put the
>>>      drm_notice() back in slpc_force_min_freq() (replacing
>>>      i915_probe_error()) rather than in slpc_boost_work() above?
>> Sure.
>>>
>>> 2. Further, if de-boosting is important then maybe as was being discussed
>>>      in v1 of this patch (see the bottom of
>>>      https://patchwork.freedesktop.org/patch/485004/?series=103598&rev=1) do
>>>      we need to use intel_guc_send_busy_loop() in the
>>>      intel_guc_slpc_dec_waiters() code path?
>>
>> Using a busy_loop here would essentially be the same as blocking, right?
> 
> Well blocking waits for a response from GuC (so all previous requests need
> to be processed by GuC) whereas busy_loop() just waits for space to be
> available at the back of the queue (so just a few, or maybe just one,
> request have to be processed by GuC).
> 
>> And it could still fail/timeout with blocking as well (which is the problem
>> we are trying to solve here).
> 
> intel_guc_send_busy_loop() has an infinite wait without a drm_err()!! :)
> 
>> De-boosting is important, but in the worst case scenario, lets say this
>> request was not processed by GuC. This would happen only if the system
>> were really busy, which would mean there is a high likelihood we would
>> boost/de-boost again anyways and it would probably go through at that
>> point.
> 
> Not sure of this. The system was busy but now might have gone idle which is
> why we are trying to de-boost. But GuC queue might still be full so we may
> drop the de-boost request. Or if the system has gone really idle there will
> be space in the GuC queue.
> 
> Also the problem with intel_guc_send_busy_loop() is that it just has a
> sleep in it, so others might be adding requests in the GuC queue while
> busy_loop() was sleeping (to avoid such situations we'd need a SW queue in
> front of the real GuC queue).
> 
> So I am ok if we don't want to add intel_guc_send_busy_loop() for now and
> "wait and watch". Unless John suggests otherwise since I don't have any
> idea how likely is this to happen. If we change drm_notice to drm_err the
> CI will quick tell us if this happening.
> 
> Anyway, so at least let's move drm_notice (or drm_err) into
> slpc_force_min_freq() and I can ok the patch. Thanks.

I got a bit lost but I thought I suggested notice level? Is it the same 
log message you are discussing here? If so, I don't think it is an error 
strictly speaking but just an unexpected condition which should be noted 
(claim being it should never ever happen outside IGT). Maybe warning if 
you think notice is too low level?

Regards,

Tvrtko

> 
>>> At least we need to do 1. But for 2. we might as well just put
>>> intel_guc_send_busy_loop() in guc_action_slpc_set_param_nb()? In both cases
>>> (boost and de-boost) intel_guc_send_busy_loop() would be called from a work
>>> item so looks doable (the way we were previously doing the blocking call
>>> from the two places). Thoughts?
>>>
>>> Thanks.
>>> --
>>> Ashutosh
