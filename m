Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14EA9840C8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A81810E642;
	Tue, 24 Sep 2024 08:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UvbVoKbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806ED10E656;
 Tue, 24 Sep 2024 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rk+K3jqbr0P1e08zr94RcxwSQ3YO6CfYfsFLpNW0lO8=; b=UvbVoKbLOwhDO0LKufId4CUv10
 K763CMZkVFW0/4O8Tt2u4dOmqH64ZjInv3ISNijE4tiA1fFaNnI/P76sbg+J+njyEfz26jwsCijQo
 dPg9mJ5kn1yg2R7D/GLvx7dYqSnMEAkiWXOVR7Hi42egZ94TRhmqLYRjW1XKBt0eHjcFGBWH3PA4w
 rirKw4gvwG69XOvItVGHdmBrgrwW7CTsz2hQJUSWGcbSgQeSqIJRY3y2MdJFa+hQ86fuJzu4V1S08
 qvjBGNh5LEIWOnXwVUlSWhJ4G9cmryIQOea+xjJMnYbwX6kC9WCvJ2uT5G5hFPuv6gCqMzjoWhDOg
 HS4/HpGQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1st18S-000JAa-OQ; Tue, 24 Sep 2024 10:43:04 +0200
Message-ID: <4898fa51-aac8-40ed-8d9d-9c019fc5add1@igalia.com>
Date: Tue, 24 Sep 2024 09:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/amdgpu: delay the use of
 amdgpu_vm_set_task_info
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, tursulin@igalia.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
 <20240920090920.1342694-4-pierre-eric.pelloux-prayer@amd.com>
 <121a41fe-6637-41ca-a21e-7bd01dc0f0bf@igalia.com>
 <ca494935-cf38-4bad-ab5c-2afdc9ce3d33@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <ca494935-cf38-4bad-ab5c-2afdc9ce3d33@amd.com>
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


On 24/09/2024 09:23, Christian König wrote:
> Am 23.09.24 um 12:25 schrieb Tvrtko Ursulin:
>>
>> On 20/09/2024 10:06, Pierre-Eric Pelloux-Prayer wrote:
>>> At this point the vm is locked so we safely modify it without risk of
>>> concurrent access.
>>
>> To which particular lock this is referring to and does this imply 
>> previous placement was unsafe?
> 
> We use the root PDs dma_resv object as VM lock to protect most field 
> inside the VM structure, only a few are protected by an additional 
> spinlock.
> 
> And yes, previously it was possible that you got a mangled process/task 
> name because no lock was protecting the task_info structure.

Got it, thanks Christian!

In this case I only suggest to be more explicit in the commit message 
and clearly say it is fixing an existing bug. Like it stands I wasn't 
sure if it was that, or the movement was just enabling the changes which 
come later in the series.

Regards,

Tvrtko

>>> Signed-off-by: Pierre-Eric Pelloux-Prayer 
>>> <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index 1e475eb01417..891128ecee6d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -309,9 +309,6 @@ static int amdgpu_cs_pass1(struct 
>>> amdgpu_cs_parser *p,
>>>           p->gang_leader->uf_addr = uf_offset;
>>>       kvfree(chunk_array);
>>>   -    /* Use this opportunity to fill in task info for the vm */
>>> -    amdgpu_vm_set_task_info(vm);
>>> -
>>>       return 0;
>>>     free_all_kdata:
>>> @@ -1180,6 +1177,9 @@ static int amdgpu_cs_vm_handling(struct 
>>> amdgpu_cs_parser *p)
>>>           job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
>>>       }
>>>   +    /* Use this opportunity to fill in task info for the vm */
>>> +    amdgpu_vm_set_task_info(vm);
>>> +
>>>       if (adev->debug_vm) {
>>>           /* Invalidate all BOs to test for userspace bugs */
>>>           amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> 
