Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000F3BD7CD6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1618C10E54A;
	Tue, 14 Oct 2025 07:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="K481wy2S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905B310E54E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PPDnBG0c+TZT9/EGnZ0kIFF609Bix/YmOdHndhFsGRc=; b=K481wy2S5FAOZN1020/owxde2P
 /xp5htDR8o5KsdvwWZYqoNtP9/0gIyQ1EQTPvxTQewmYBzlsg9n7GnJuIkAQD1Ayv96sdcxvG+ywj
 QUFf3X+dJcwkbFcnBDQZIY2+kMtHycmRovA4xhso2/5vE0GLH8GBo18rgu+HtSdr4W1O4YaRfue/Q
 5c1CvFDjEaoVp2dD1HZ+le1JazeJilGkbljUIR29aEAAh9w5lXyAqdfBkhtRtjfSm4+GP0tVQe+EK
 nrtDDV22SJv6eQuBsxQCo/13JTlBR7FW2cT6t+bOOACcPdb2P6BkWwv6J5oEQ+404ip8YTiB3ZaNH
 YOAyLApA==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v8Z6C-009I4u-12; Tue, 14 Oct 2025 09:05:32 +0200
Message-ID: <7ef8ae87-1162-4a4e-9f79-3089bd0a4409@igalia.com>
Date: Tue, 14 Oct 2025 08:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Fix potential double free in
 drm_sched_job_add_resv_dependencies
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Dan Carpenter <dan.carpenter@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 stable@vger.kernel.org
References: <20251013190731.63235-1-tvrtko.ursulin@igalia.com>
 <03cccc85bb18bfd806435a679c5327ec5d33a169.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <03cccc85bb18bfd806435a679c5327ec5d33a169.camel@mailbox.org>
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


On 14/10/2025 07:31, Philipp Stanner wrote:
> On Mon, 2025-10-13 at 20:07 +0100, Tvrtko Ursulin wrote:
>> When adding dependencies with drm_sched_job_add_dependency(), that
> 
> I'm sorry if there was confusion about upper case style. I'm quite sure
> I'd think I'd never ask for a function name to be written uppercase,
> but maybe that was a -ENOCOFFEE version of me last year or sth :O
> 
>> function consumes the fence reference both on success and failure, so in
>> the latter case the dma_fence_put() on the error path (xarray failed to
>> expand) is a double free.
>>
>> Interestingly this bug appears to have been present ever since
>> ebd5f74255b9 ("drm/sched: Add dependency tracking"), since the code back
>> then looked like this:
>>
>> drm_sched_job_add_implicit_dependencies():
>> ...
>>         for (i = 0; i < fence_count; i++) {
>>                 ret = drm_sched_job_add_dependency(job, fences[i]);
>>                 if (ret)
>>                         break;
>>         }
>>
>>         for (; i < fence_count; i++)
>>                 dma_fence_put(fences[i]);
>>
>> Which means for the failing 'i' the dma_fence_put was already a double
>> free. Possibly there were no users at that time, or the test cases were
>> insufficient to hit it.
>>
>> The bug was then only noticed and fixed after
>> 9c2ba265352a ("drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2")
>> landed, with its fixup of
>> 4eaf02d6076c ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies").
>>
>> At that point it was a slightly different flavour of a double free, which
>> 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder")
>> noticed and attempted to fix.
>>
>> But it only moved the double free from happening inside the
>> drm_sched_job_add_dependency(), when releasing the reference not yet
>> obtained, to the caller, when releasing the reference already released by
>> the former in the failure case.
>>
>> As such it is not easy to identify the right target for the fixes tag so
>> lets keep it simple and just continue the chain.
>>
>> While fixing we also improve the comment and explain the reason for taking
>> the reference and not dropping it.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder")
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Reference: https://lore.kernel.org/dri-devel/aNFbXq8OeYl3QSdm@stanley.mountain/
> 
> Any objection with me changing that to Closes: when applying?
> 
> As I read it that's a real bug report by Dan and this patches closes
> that report.

No objections, thanks!

Regards,

Tvrtko

>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Rob Clark <robdclark@chromium.org>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v5.16+
>> ---
>> v2:
>>   * Re-arrange commit text so discussion around sentences starting with
>>     capital letters in all cases can be avoided.
>>   * Keep double return for now.
>>   * Improved comment instead of dropping it.
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 46119aacb809..c39f0245e3a9 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -965,13 +965,14 @@ int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
>>   	dma_resv_assert_held(resv);
>>   
>>   	dma_resv_for_each_fence(&cursor, resv, usage, fence) {
>> -		/* Make sure to grab an additional ref on the added fence */
>> -		dma_fence_get(fence);
>> -		ret = drm_sched_job_add_dependency(job, fence);
>> -		if (ret) {
>> -			dma_fence_put(fence);
>> +		/*
>> +		 * As drm_sched_job_add_dependency always consumes the fence
>> +		 * reference (even when it fails), and dma_resv_for_each_fence
>> +		 * is not obtaining one, we need to grab one before calling.
>> +		 */
>> +		ret = drm_sched_job_add_dependency(job, dma_fence_get(fence));
>> +		if (ret)
>>   			return ret;
>> -		}
>>   	}
>>   	return 0;
>>   }
> 

