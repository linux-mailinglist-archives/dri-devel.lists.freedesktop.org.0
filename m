Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D3266404B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 13:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0BA10E5AE;
	Tue, 10 Jan 2023 12:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44ED10E5AB;
 Tue, 10 Jan 2023 12:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673353180; x=1704889180;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=hMAKru4BErMxJmscpS8U4yfvHGR7TInX+pjKzB6Geb8=;
 b=iWzgDYhdLNxSGG4L9oVQCVwZ1bEhDjQBBHEE+xXS42x2VonI5yhlebXv
 e9tMz4p7Z1qi+Rcr1VP83OqRjMGXbY8FLoyInDchxbdasDaHmiI6fMVZ8
 vR/4LdBHUw06XmBQIs0Tq4me9HF7+LJaFs3bKYwjEZh/Lu3acBWX/GTPS
 4eu3IVwIAZvf4oZNOAdUpwnLQLsyz5FUu8bvLG+ASNeJSueva/9iIzExP
 pxN/gsbUDiEBM0jHfGR4zVEcwEvdCkNPTKxCB98MXQguXmeIztf/gmVCe
 2132+Ev4AJ9LNOC1Xc/ZSFg0qaYK+wF77lUr29jPEeHCwEDXFZI492xxP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="323197377"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="323197377"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 04:19:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="657036601"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="657036601"
Received: from gregoire-mobl3.amr.corp.intel.com (HELO [10.212.88.71])
 ([10.212.88.71])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 04:19:37 -0800
Message-ID: <3b1af19f-3500-3be8-9d28-ac7da5b7d728@linux.intel.com>
Date: Tue, 10 Jan 2023 12:19:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
 <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/01/2023 11:28, Tvrtko Ursulin wrote:
> 
> 
> On 09/01/2023 17:27, Jason Ekstrand wrote:
> 
> [snip]
> 
>>      >>> AFAICT it proposes to have 1:1 between *userspace* created
>>     contexts (per
>>      >>> context _and_ engine) and drm_sched. I am not sure avoiding
>>     invasive changes
>>      >>> to the shared code is in the spirit of the overall idea and 
>> instead
>>      >>> opportunity should be used to look at way to refactor/improve
>>     drm_sched.
>>
>>
>> Maybe?  I'm not convinced that what Xe is doing is an abuse at all or 
>> really needs to drive a re-factor.  (More on that later.)  There's 
>> only one real issue which is that it fires off potentially a lot of 
>> kthreads. Even that's not that bad given that kthreads are pretty 
>> light and you're not likely to have more kthreads than userspace 
>> threads which are much heavier.  Not ideal, but not the end of the 
>> world either.  Definitely something we can/should optimize but if we 
>> went through with Xe without this patch, it would probably be mostly ok.
>>
>>      >> Yes, it is 1:1 *userspace* engines and drm_sched.
>>      >>
>>      >> I'm not really prepared to make large changes to DRM scheduler
>>     at the
>>      >> moment for Xe as they are not really required nor does Boris
>>     seem they
>>      >> will be required for his work either. I am interested to see
>>     what Boris
>>      >> comes up with.
>>      >>
>>      >>> Even on the low level, the idea to replace drm_sched threads
>>     with workers
>>      >>> has a few problems.
>>      >>>
>>      >>> To start with, the pattern of:
>>      >>>
>>      >>>    while (not_stopped) {
>>      >>>     keep picking jobs
>>      >>>    }
>>      >>>
>>      >>> Feels fundamentally in disagreement with workers (while
>>     obviously fits
>>      >>> perfectly with the current kthread design).
>>      >>
>>      >> The while loop breaks and worker exists if no jobs are ready.
>>
>>
>> I'm not very familiar with workqueues. What are you saying would fit 
>> better? One scheduling job per work item rather than one big work item 
>> which handles all available jobs?
> 
> Yes and no, it indeed IMO does not fit to have a work item which is 
> potentially unbound in runtime. But it is a bit moot conceptual mismatch 
> because it is a worst case / theoretical, and I think due more 
> fundamental concerns.
> 
> If we have to go back to the low level side of things, I've picked this 
> random spot to consolidate what I have already mentioned and perhaps 
> expand.
> 
> To start with, let me pull out some thoughts from workqueue.rst:
> 
> """
> Generally, work items are not expected to hog a CPU and consume many 
> cycles. That means maintaining just enough concurrency to prevent work 
> processing from stalling should be optimal.
> """
> 
> For unbound queues:
> """
> The responsibility of regulating concurrency level is on the users.
> """
> 
> Given the unbound queues will be spawned on demand to service all queued 
> work items (more interesting when mixing up with the system_unbound_wq), 
> in the proposed design the number of instantiated worker threads does 
> not correspond to the number of user threads (as you have elsewhere 
> stated), but pessimistically to the number of active user contexts. That 
> is the number which drives the maximum number of not-runnable jobs that 
> can become runnable at once, and hence spawn that many work items, and 
> in turn unbound worker threads.
> 
> Several problems there.
> 
> It is fundamentally pointless to have potentially that many more threads 
> than the number of CPU cores - it simply creates a scheduling storm.

To make matters worse, if I follow the code correctly, all these per 
user context worker thread / work items end up contending on the same 
lock or circular buffer, both are one instance per GPU:

guc_engine_run_job
  -> submit_engine
     a) wq_item_append
         -> wq_wait_for_space
           -> msleep
     b) xe_guc_ct_send
         -> guc_ct_send
           -> mutex_lock(&ct->lock);
           -> later a potential msleep in h2g_has_room

Regards,

Tvrtko
