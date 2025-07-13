Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DF1B032B0
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 21:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E073110E02D;
	Sun, 13 Jul 2025 19:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eMideR0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ECD10E002;
 Sun, 13 Jul 2025 19:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xxuUfgSKUOW/IR0KSnrRRG/Gzc2YX5Yqy70vawg0Qs4=; b=eMideR0NMh3rusI9vNQPJOtIlr
 4Oe8TUz+gN4LHvvf4TUg7k+UgIvvwithz1swb5DZnMdDZpdKJTY5WhWKSvJXyoY5lGc6nfe3qrFtt
 ULi1RyU3FvqtrkJthoqESrqKPJC/WxwgRs3MFudnXSFol/+Vk2K2piJ3NuHCK7UOf+Mrbf4M+O5JY
 czT7RwfWa9oOPGHgtxJPhzLViTKenfVqgmIJz8tYt+tSz5gHSywV8ec0SHIJnSk0wNb3QeyiyMBfY
 G4BkwpJs++V0k0QGoTMy3+dOoY2fyCs2Hh5YuP6NKwbSySWJitv11JC6v2i46jJOz7zm8N30YLDqm
 c1sz+rqg==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ub1ym-00G9OD-NB; Sun, 13 Jul 2025 21:03:16 +0200
Message-ID: <2347cd33-5289-4e6f-8296-b34bc05eff8b@igalia.com>
Date: Sun, 13 Jul 2025 16:03:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
 <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
 <20499b2a-0695-430a-9280-035a7e04d328@amd.com>
 <335c9bc57d19f17a3ba0da311f287dfdc3d580c7.camel@mailbox.org>
 <176e7f13-52e8-42d6-a9db-0bb237790aef@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <176e7f13-52e8-42d6-a9db-0bb237790aef@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 11/07/25 12:20, Christian König wrote:
> On 11.07.25 15:37, Philipp Stanner wrote:
>> On Fri, 2025-07-11 at 15:22 +0200, Christian König wrote:
>>>
>>>
>>> On 08.07.25 15:25, Maíra Canal wrote:
>>>> When the DRM scheduler times out, it's possible that the GPU isn't hung;
>>>> instead, a job just took unusually long (longer than the timeout) but is
>>>> still running, and there is, thus, no reason to reset the hardware. This
>>>> can occur in two scenarios:
>>>>
>>>>    1. The job is taking longer than the timeout, but the driver determined
>>>>       through a GPU-specific mechanism that the hardware is still making
>>>>       progress. Hence, the driver would like the scheduler to skip the
>>>>       timeout and treat the job as still pending from then onward. This
>>>>       happens in v3d, Etnaviv, and Xe.
>>>>    2. Timeout has fired before the free-job worker. Consequently, the
>>>>       scheduler calls `sched->ops->timedout_job()` for a job that isn't
>>>>       timed out.
>>>>
>>>> These two scenarios are problematic because the job was removed from the
>>>> `sched->pending_list` before calling `sched->ops->timedout_job()`, which
>>>> means that when the job finishes, it won't be freed by the scheduler
>>>> though `sched->ops->free_job()` - leading to a memory leak.
>>>
>>> Yeah, that is unfortunately intentional.
>>>
>>>> To solve these problems, create a new `drm_gpu_sched_stat`, called
>>>> DRM_GPU_SCHED_STAT_NO_HANG, which allows a driver to skip the reset. The
>>>> new status will indicate that the job must be reinserted into
>>>> `sched->pending_list`, and the hardware / driver will still complete that
>>>> job.
>>>
>>> Well long story short we have already tried this and the whole approach doesn't work correctly in all cases. See the git history around how we used to destroy the jobs.
>>>
>>> The basic problem is that you can always race between timing out and Signaling/destroying the job. This is the long lasting job lifetime issue we already discussed more than once.
>>
>> The scheduler destroys the job, through free_job().
>> I think we have agreed that for now the scheduler is the party
>> responsible for the job lifetime.
> 
> That's what I strongly disagree on. The job is just a state bag between the submission and scheduling state of a submission.
> 
> For the scheduler the control starts when it is pushed into the entity and ends when run_job is called.
> 
> The real representation of the submission is the scheduler fence and that object has a perfectly defined lifetime, state and error handling.
> 
>>>
>>> If you want to fix this I think the correct approach is to completely drop tracking jobs in the scheduler at all.
>>
>> I don't see how this series introduces a problem?
>>
>> The fact is that drivers are abusing the API by just firing jobs back
>> into the scheduler's job list. This series legalizes the abuse by
>> providing scheduler functionality for that.
>>
>> IOW, the series improves the situation but does not add a *new*
>> problem. Even less so as driver's aren't forced to use the new status
>> code, but can continue having job completion race with timeout
>> handlers.
> 
> Maybe yes, but I'm really not sure about it.
> 
> Take a look at the git history or job destruction, we already had exactly that approach, removed it and said that leaking memory is at least better than an use after free issue.
> 

If the job was removed from the pending list in the beginning of the
timeout and drm_sched_get_finished_job() fetches jobs from the pending
list, how can we end up with an use-after-free issue?

Best Regards,
- Maíra

