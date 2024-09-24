Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7730E9842E7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 12:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE5910E6A5;
	Tue, 24 Sep 2024 10:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="Po0Pnoh2";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="C2LLIChc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E7B10E6A5;
 Tue, 24 Sep 2024 10:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1727172090;
 bh=Vgoy2mqrOJSuLgcURVE/ckm
 d7UE5V/DHsEqtDVY+bIQ=; b=Po0Pnoh2oJjcoAudwlgXswI0zJlLi86HvB1In1ztm3R74s6UQE
 0S2A7QULfXLt54C+e5OWYJ2ellJNWuLsIYgJD4v9fRLcuPLOHJHaDMX3mvzONMTdyeulCXMcKM1
 oBQSxSWfIL3x1g1bFHQP8X6adDpielnfAl+fGpgZDZgggdHWSd/pm1k13Eit5i1uE2/WqNsojoW
 OAgBY+Y+z3MySvEL9lUcGRH578d2xCYBVaIc1/IvPoFwCrSNOjo7R5i8QMmNv0Em2WUz5VD4T3s
 7Pmm9lqWPqpY3076YBMIphXJQieYz/tPIF3VP7n2q/LdVRqvpDcPaiz7/tDd//hUIsw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1727172090; bh=Vgoy2mqrOJSuLgcURVE/ckm
 d7UE5V/DHsEqtDVY+bIQ=; b=C2LLIChcxpanz6BOECirHhfZLG03wOeRzwpXNOHzrtu1DdsGpZ
 mu6mMMAq+a8/ooBvXlepYV89b+rV2j0QYzAw==;
Message-ID: <fd28718e-cba5-43b0-996b-508390fa23fd@damsy.net>
Date: Tue, 24 Sep 2024 12:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/amdgpu: delay the use of
 amdgpu_vm_set_task_info
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, tursulin@igalia.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
 <20240920090920.1342694-4-pierre-eric.pelloux-prayer@amd.com>
 <121a41fe-6637-41ca-a21e-7bd01dc0f0bf@igalia.com>
 <ca494935-cf38-4bad-ab5c-2afdc9ce3d33@amd.com>
 <4898fa51-aac8-40ed-8d9d-9c019fc5add1@igalia.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <4898fa51-aac8-40ed-8d9d-9c019fc5add1@igalia.com>
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



Le 24/09/2024 à 10:43, Tvrtko Ursulin a écrit :
> 
> On 24/09/2024 09:23, Christian König wrote:
>> Am 23.09.24 um 12:25 schrieb Tvrtko Ursulin:
>>>
>>> On 20/09/2024 10:06, Pierre-Eric Pelloux-Prayer wrote:
>>>> At this point the vm is locked so we safely modify it without risk of
>>>> concurrent access.
>>>
>>> To which particular lock this is referring to and does this imply previous placement was unsafe?
>>
>> We use the root PDs dma_resv object as VM lock to protect most field inside the VM structure, only 
>> a few are protected by an additional spinlock.
>>
>> And yes, previously it was possible that you got a mangled process/task name because no lock was 
>> protecting the task_info structure.
> 
> Got it, thanks Christian!
> 
> In this case I only suggest to be more explicit in the commit message and clearly say it is fixing 
> an existing bug. Like it stands I wasn't sure if it was that, or the movement was just enabling the 
> changes which come later in the series.

Good idea, will do.

Pierre-Eric

> 
> Regards,
> 
> Tvrtko
> 
>>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +++---
>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>> index 1e475eb01417..891128ecee6d 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>> @@ -309,9 +309,6 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>>>>           p->gang_leader->uf_addr = uf_offset;
>>>>       kvfree(chunk_array);
>>>>   -    /* Use this opportunity to fill in task info for the vm */
>>>> -    amdgpu_vm_set_task_info(vm);
>>>> -
>>>>       return 0;
>>>>     free_all_kdata:
>>>> @@ -1180,6 +1177,9 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>>>>           job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
>>>>       }
>>>>   +    /* Use this opportunity to fill in task info for the vm */
>>>> +    amdgpu_vm_set_task_info(vm);
>>>> +
>>>>       if (adev->debug_vm) {
>>>>           /* Invalidate all BOs to test for userspace bugs */
>>>>           amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>>
