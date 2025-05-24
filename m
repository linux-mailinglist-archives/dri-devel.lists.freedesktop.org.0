Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A81AC2FDE
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 15:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B65D10E075;
	Sat, 24 May 2025 13:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kBTLLont";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4EA10E043;
 Sat, 24 May 2025 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6XGC/vbTWuPr5wzWFaQ41n5nWcPDQ8q/9BamqbngT8k=; b=kBTLLontKYTptUlp4Tc5at2kBH
 xDRVB4+wgO3iyowZC4PuCNlH3i+mheqZCxt+/5a/BAaLb2HLSFTHkGYfw7cpWAPHfm3bHRBUFkZkP
 FJDXwYgPYNcHtXC9XAVnG6b+oiXkc+7EsBJS7/7E/swIoqwdvdgCtC1MUO5A7krF/ymbSQL3MtHSr
 qv/faHG3/ocYpl96bs3lIK8ketgbiVgFKWvSB8FI3cpiSiP/TrPBFaTMS6wGDnCTnke2zhVwLRbH1
 9axhPHv8GJzVkvYDKMcxf74OzzL3QwHO8dqOt5WuCGwE7cshnGFOiT78Bg+hYZwWp/9pT3a78P8uo
 6gS0tSKQ==;
Received: from [189.7.87.163] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uIp0e-00CZSH-Pa; Sat, 24 May 2025 15:33:57 +0200
Message-ID: <791df72e-ff87-42e3-a4fc-527aa693a155@igalia.com>
Date: Sat, 24 May 2025 10:33:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/sched: Allow drivers to skip the reset and keep
 on running
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
 <4242fd242c7e16d0ecdf11c5d0ad795efda727a5.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <4242fd242c7e16d0ecdf11c5d0ad795efda727a5.camel@mailbox.org>
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

Hi Philipp,

Sorry, I was OoO for a couple of weeks.

On 13/05/25 04:26, Philipp Stanner wrote:
> On Sat, 2025-05-03 at 17:59 -0300, Maíra Canal wrote:
>> When the DRM scheduler times out, it's possible that the GPU isn't
>> hung;
>> instead, a job may still be running, and there may be no valid reason
>> to
>> reset the hardware. This can occur in two situations:
>>
>>    1. The GPU exposes some mechanism that ensures the GPU is still
>> making
>>       progress. By checking this mechanism, we can safely skip the
>> reset,
>>       rearm the timeout, and allow the job to continue running until
>>       completion. This is the case for v3d and Etnaviv.
>>    2. TDR has fired before the IRQ that signals the fence.
>> Consequently,
>>       the job actually finishes, but it triggers a timeout before
>> signaling
>>       the completion fence.
>>
>> These two scenarios are problematic because we remove the job from
>> the
>> `sched->pending_list` before calling `sched->ops->timedout_job()`.
>> This
>> means that when the job finally signals completion (e.g. in the IRQ
>> handler), the scheduler won't call `sched->ops->free_job()`. As a
>> result,
>> the job and its resources won't be freed, leading to a memory leak.
> 
> We have discussed this and discovered another, related issue. See
> below.
> 
>>
>> To resolve this issue, we create a new `drm_gpu_sched_stat` that
>> allows a
>> driver to skip the reset. This new status will indicate that the job
>> should be reinserted into the pending list, and the driver will still
>> signal its completion.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 14 ++++++++++++++
>>   include/drm/gpu_scheduler.h            |  2 ++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index
>> 829579c41c6b5d8b2abce5ad373c7017469b7680..68ca827d77e32187a034309f881
>> 135dbc639a9b4 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -568,6 +568,17 @@ static void drm_sched_job_timedout(struct
>> work_struct *work)
> 
> So, the fundamental design problem we have is that the scheduler
> assumes that when a timeout occurs, the GPU is completely hung. Your
> patch addresses another aspect of that very problem.
> 
> But if the GPU is not hung, it can signal the hardware fence at any
> moment. So that's racy.

Unfortunately, this already happens, which would be the second point of
the list in the commit message.

> 
> It could, theoretically, lead to backend_ops.timedout_job() being
> called with a signaled job, i.e., a job that is not really timed out.
> 
> Would you say this is *the same* issue you're describing, or a separate
> one? It seems to me that it's a separate one.

It isn't the issue that I'm describing in the sense that the scheduler
itself won't do anything to address this issue. However, several drivers
already handle with this situation internally by checking the result of
`dma_fence_is_signaled()` and bailing out of the timeout if the job is
signaled. We would provide a proper status code for those drivers and
avoid memory leaks.

> 
> Anyways. What I propose is that we wait until your series here has been
> merged. Once that's done, we should document that drivers should expect
> that backend_ops.timedout_job() can get called with a job that has not
> actually timed out, and tell the scheduler about it through
> DRM_GPU_SCHED_STAT_NOT_HANGING. Then the scheduler reverts the
> timeout's actions, as you propose here.
> 
> 
>>   			job->sched->ops->free_job(job);
>>   			sched->free_guilty = false;
>>   		}
>> +
>> +		/*
>> +		 * If the driver indicated that the GPU is still
>> running and wants to skip
>> +		 * the reset, reinsert the job back into the pending
>> list and realarm the
>> +		 * timeout.
>> +		 */
>> +		if (status == DRM_GPU_SCHED_STAT_RUNNING) {
>> +			spin_lock(&sched->job_list_lock);
>> +			list_add(&job->list, &sched->pending_list);
>> +			spin_unlock(&sched->job_list_lock);
>> +		}
> 
> btw, if you go for Matt's requeue work item approach, it'll be better
> to write a helper function with a clear name for all that.
> 
> drm_sched_job_reinsert_on_false_timout() maybe.

Thanks for the review, I'll send v2 soon.

Best Regards,
- Maíra

> 
> 
> P.
> 
> 
>>   	} else {
>>   		spin_unlock(&sched->job_list_lock);
>>   	}
