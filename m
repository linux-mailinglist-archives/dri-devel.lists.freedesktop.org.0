Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD447A8B861
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 14:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AD510E0A8;
	Wed, 16 Apr 2025 12:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="HSDUS5SO";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="8XdPlmjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9955310E0A8;
 Wed, 16 Apr 2025 12:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1744805245;
 bh=uKLBNmhB7jAET6T+ao14YIP
 8yY6OI10vLTkOcEy9dio=; b=HSDUS5SOrIHJcl43gjuBSmDwvJufN66WSjiZUOfK87yFe6PVqr
 cQlVj4vdlKwUapX3eiRskkE1wZteTnj4lPfaOoDwyReh242iDkugoQFPLtsTNnIPzHWml7O3pPk
 Tv/ZBfSV5mPmwvcxBR7VpmqKn6MzPqkXJQTJr5OltTHmtrsTMapz7ef8fYdRxOFV5nNNYCescks
 R+RrVo6UcyO7upH2h8dPnu2XWS+84WbHFjh1AQpHjNqcjfOrHdh6o3Qr9VcDaQE7GpQL5uTFNNg
 QqPZt38BqAqkB5yQgdXFgt1N9EdmgKlmtytjIuZZUCFNtkO88hjhvNEyZ+0rC/KvmMg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1744805245; bh=uKLBNmhB7jAET6T+ao14YIP
 8yY6OI10vLTkOcEy9dio=; b=8XdPlmjSOrsGarT1CFASidxtGparIaOncTEGB/2pGh0mU9+5EY
 PYhT0v2u3+E4yz9LRxjJmUWHNDeq9qVWNDCg==;
Message-ID: <896721aa-e6c2-4da1-ba2e-6f52aea52615@damsy.net>
Date: Wed, 16 Apr 2025 14:07:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/amdgpu: use drm_file_err in logging to also
 dump process information
To: "Khatri, Sunil" <sukhatri@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415184318.2465197-1-sunil.khatri@amd.com>
 <20250415184318.2465197-3-sunil.khatri@amd.com>
 <34b082d4-b320-4eb3-8b36-fb63ffca3730@igalia.com>
 <ec6f48cc-9776-4912-b746-ee18edb3536b@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <ec6f48cc-9776-4912-b746-ee18edb3536b@amd.com>
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

Hi,

Le 16/04/2025 à 12:01, Khatri, Sunil a écrit :
> 
> On 4/16/2025 12:56 PM, Tvrtko Ursulin wrote:
>>
>> On 15/04/2025 19:43, Sunil Khatri wrote:
>>> add process and pid information in the userqueue error
>>> logging to make it more useful in resolving the error
>>> by logs.
>>>
>>> Sample log:
>>> [   42.444297] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Timed out waiting for 
>>> fence f=000000001c74d978 for comm:Xwayland pid:3427
>>> [   42.444669] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspending userqueue, timeout 
>>> waiting for comm:Xwayland pid:3427
>>> [   42.824729] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Timed out waiting for 
>>> fence f=0000000074407d3e for comm:systemd-logind pid:1058
>>> [   42.825082] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspending userqueue, timeout 
>>> waiting for comm:systemd-logind pid:1058
>>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 14 ++++++++------
>>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c b/drivers/gpu/drm/amd/amdgpu/ 
>>> amdgpu_userqueue.c
>>> index 1867520ba258..05c1ee27a319 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>>> @@ -43,7 +43,7 @@ amdgpu_userqueue_cleanup(struct amdgpu_userq_mgr *uq_mgr,
>>>       if (f && !dma_fence_is_signaled(f)) {
>>>           ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
>>>           if (ret <= 0) {
>>> -            DRM_ERROR("Timed out waiting for fence f=%p\n", f);
>>> +            drm_file_err(uq_mgr->file, "Timed out waiting for fence f=%p\n", f);
>>
>> You decided to leave %p after all?
> 
> Yes we are printing the fence ptr here to see which fence is timing out. Anyways right now intention 
> of this patch is to add additional process information along with existing information like fence here.
> 

I agree with Tvrtko, "fence=%llu:%llu" would be better to identify "which fence is timing out".


Pierre-Eric


> regards
> Sunil
> 
>>
>>>               return;
>>>           }
>>>       }
>>> @@ -440,7 +440,8 @@ amdgpu_userqueue_resume_all(struct amdgpu_userq_mgr *uq_mgr)
>>>       }
>>>         if (ret)
>>> -        DRM_ERROR("Failed to map all the queues\n");
>>> +        drm_file_err(uq_mgr->file, "Failed to map all the queue\n");
>>
>> You lost the plural by accident.
> Yes i will add 's'. Noted.
>>
> I am also not sure "all the queues" makes sense in this context versus "all queues" but it's 
> inconsequential really.
> Regards
> Sunil
>> Yes it all queues from a uq_mgr.
>>> +
>>>       return ret;
>>>   }
>>>   @@ -598,7 +599,8 @@ amdgpu_userqueue_suspend_all(struct amdgpu_userq_mgr *uq_mgr)
>>>       }
>>>         if (ret)
>>> -        DRM_ERROR("Couldn't unmap all the queues\n");
>>> +        drm_file_err(uq_mgr->file, "Couldn't unmap all the queues\n");
>>> +
>>>       return ret;
>>>   }
>>>   @@ -615,7 +617,7 @@ amdgpu_userqueue_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
>>>               continue;
>>>           ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
>>>           if (ret <= 0) {
>>> -            DRM_ERROR("Timed out waiting for fence f=%p\n", f);
>>> +            drm_file_err(uq_mgr->file, "Timed out waiting for fence f=%p\n", f);
>>>               return -ETIMEDOUT;
>>>           }
>>>       }
>>> @@ -634,13 +636,13 @@ amdgpu_userqueue_suspend(struct amdgpu_userq_mgr *uq_mgr,
>>>       /* Wait for any pending userqueue fence work to finish */
>>>       ret = amdgpu_userqueue_wait_for_signal(uq_mgr);
>>>       if (ret) {
>>> -        DRM_ERROR("Not suspending userqueue, timeout waiting for work\n");
>>> +        drm_file_err(uq_mgr->file, "Not suspending userqueue, timeout waiting\n");
>>>           return;
>>>       }
>>>         ret = amdgpu_userqueue_suspend_all(uq_mgr);
>>>       if (ret) {
>>> -        DRM_ERROR("Failed to evict userqueue\n");
>>> +        drm_file_err(uq_mgr->file, "Failed to evict userqueue\n");
>>>           return;
>>
>> It is pre-existing but strikes me as odd that failure to amdgpu_userqueue_suspend_all() logs a 
>> failure to *evict* instead of suspend (as the previous log does). Anyway, I did not look at the 
>> surrounding code so just thinking out loud.
> 
> Yes suspend failed as all the fences were not evicted and thats why suspend failed. Anyways there 
> are already alex patches which will change this to unmap as a code reorganisation for suspend/resume 
> is in pipeline.
> 
> regards
> 
> Sunil
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>       }
>>
