Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0191A59453
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141A610E429;
	Mon, 10 Mar 2025 12:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KFFVc9Xa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8D210E419
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OOBZ8qTz+v44tkaV6ZMNqcXZyTXLCvBkFF2upUV3LoM=; b=KFFVc9XaY+1pFHNBOL4y01UKy3
 zjmJtOA9Ognov++GYVTJxhjGRAfsvmzNPYAcIzh5il82pEKjczbp5VojwIOUWckxJ9mIzy6DLx72n
 Vcw6Uen8ImsNc/buI1dH0OLt39jRq712dULKNwZCL/pR3Pj88TAW8P/p9TPsLN+UXmPyN1e5EcktJ
 Uox80rIpGR5SXTeD/s2LDVJJBNO99LjGDmSbBhvPeh6vRORpub+LMMlJrAf3AH13xBqqOkm+EW+jn
 b332S3z75Ss8viQ8jRYQpSNFy3wYYWMWZ2qmD5cNf1PRXc6Cw8NWHKkZXwa2sZ98NLLAMusMEasM6
 pK3LK4vg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1trcEL-006TNE-8x; Mon, 10 Mar 2025 13:27:43 +0100
Message-ID: <6b9b27a7-2ccd-4f16-aa36-05877b5e8f7c@igalia.com>
Date: Mon, 10 Mar 2025 12:27:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: revert "drm_sched_job_cleanup(): correct false
 doc"
To: phasta@kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>, matthew.brost@intel.com,
 dakr@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250310074414.2129157-1-christian.koenig@amd.com>
 <564be70f7d64c04c1ad77499522d99c64ea4d4d3.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <564be70f7d64c04c1ad77499522d99c64ea4d4d3.camel@mailbox.org>
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


On 10/03/2025 12:11, Philipp Stanner wrote:
> On Mon, 2025-03-10 at 08:44 +0100, Christian König wrote:
>> This reverts commit 44d2f310f008613c1dbe5e234c2cf2be90cbbfab.
> 
> OK, your arguments with fence ordering are strong. Please update the
> commit message according to our discussion:

Could that argument please be explained in more concrete terms?

Are we talking here about skipping one seqno has potential to cause a 
problem, or there is more to it?

Because if it is just skipping I don't immediately see that breaks the 
monotonic/unique seqno ordering.

Only if we are worried about some code somewhere making assumptions  "if 
N got completed, that means N-1 got completed too". That generally isn't 
anything new and can happen with GPU resets, albeit in the latter case 
the fence error is I think always set.

Regards,

Tvrtko

>> Sorry for the delayed response, I only stumbled over this now while
>> going
>> over old mails and then re-thinking my reviewed by for this change.
> 
> Your RB hadn't even been applied (I merged before you gave it), so you
> can remove this first paragraph from the commit message
> 
>>
>> The function drm_sched_job_arm() is indeed the point of no return.
>> The
>> background is that it is nearly impossible for the driver to
>> correctly
>> retract the fence and signal it in the order enforced by the
>> dma_fence
>> framework.
>>
>> The code in drm_sched_job_cleanup() is for the purpose to cleanup
>> after
>> the job was armed through drm_sched_job_arm() *and* processed by the
>> scheduler.
>>
>> The correct approach for error handling in this situation is to set
>> the
>> error on the fences and then push to the entity anyway. We can
>> certainly
>> improve the documentation, but removing the warning is clearly not a
>> good
>> idea.
> 
> This last paragraph, as per our discussion, seems invalid. We shouldn't
> have that in the commit log, so that it won't give later hackers
> browsing it wrong ideas and we end up with someone actually mengling
> with those fences.
> 
> Thx
> P.
> 
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 53e6aec37b46..4d4219fbe49d 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1015,13 +1015,11 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>>    * Cleans up the resources allocated with drm_sched_job_init().
>>    *
>>    * Drivers should call this from their error unwind code if @job is
>> aborted
>> - * before it was submitted to an entity with
>> drm_sched_entity_push_job().
>> + * before drm_sched_job_arm() is called.
>>    *
>> - * Since calling drm_sched_job_arm() causes the job's fences to be
>> initialized,
>> - * it is up to the driver to ensure that fences that were exposed to
>> external
>> - * parties get signaled. drm_sched_job_cleanup() does not ensure
>> this.
>> - *
>> - * This function must also be called in &struct
>> drm_sched_backend_ops.free_job
>> + * After that point of no return @job is committed to be executed by
>> the
>> + * scheduler, and this function should be called from the
>> + * &drm_sched_backend_ops.free_job callback.
>>    */
>>   void drm_sched_job_cleanup(struct drm_sched_job *job)
>>   {
>> @@ -1032,7 +1030,7 @@ void drm_sched_job_cleanup(struct drm_sched_job
>> *job)
>>   		/* drm_sched_job_arm() has been called */
>>   		dma_fence_put(&job->s_fence->finished);
>>   	} else {
>> -		/* aborted job before arming */
>> +		/* aborted job before committing to run it */
>>   		drm_sched_fence_free(job->s_fence);
>>   	}
>>   
> 

