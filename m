Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD564F23E3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 09:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D8810EE0D;
	Tue,  5 Apr 2022 07:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08D010EE0D;
 Tue,  5 Apr 2022 07:01:58 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5ae8ff.dynamic.kabel-deutschland.de
 [95.90.232.255])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4780461E64846;
 Tue,  5 Apr 2022 09:01:57 +0200 (CEST)
Message-ID: <226a1c28-2516-7af4-dc19-7236f31128e9@molgen.mpg.de>
Date: Tue, 5 Apr 2022 09:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Public patches but non-public development branch (Re: [PATCH 1/1]
 drm/amdkfd: Add missing NULL check in svm_range_map_to_gpu)
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220404214255.11902-1-Philip.Yang@amd.com>
 <7a0e9d4c-257f-287e-9caf-f4161887ba39@molgen.mpg.de>
 <530f3735-9a82-54af-c090-cc8d5b1510cc@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <530f3735-9a82-54af-c090-cc8d5b1510cc@amd.com>
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
Cc: Philip Yang <Philip.Yang@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Christian,


Am 05.04.22 um 08:54 schrieb Christian König:
> Am 05.04.22 um 08:45 schrieb Paul Menzel:

>> Am 04.04.22 um 23:42 schrieb Philip Yang:
>>> bo_adev is NULL for system memory mapping to GPU.
>>>
>>> Fixes: 05fe8eeca92 (drm/amdgpu: fix TLB flushing during eviction)
>>
>> Sorry, where can I find that commit?
> 
> Well that's expected, the development branch is not public.

Well obviously, it was unexpected for me. How should I have known? Where 
is that documented? If the patches are publicly posted to the mailing 
list, why is that development branch not public?

The current situation is really frustrating for non-AMD employees. How 
can the current situation be improved?


Kind regards,

Paul


>> I do not see it in drm-next from agd5f git archive 
>> git@gitlab.freedesktop.org:agd5f/linux.git.
>>
>>     $ git log --oneline -1
>>     e45422695c19 (HEAD, agd5f/drm-next) drm/amdkfd: Create file 
>> descriptor after client is added to smi_clients list
>>
>>
>> Kind regards,
>>
>> Paul
>>
>>
>>> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c 
>>> b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> index 907b02045824..d3fb2d0b5a25 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> @@ -1281,7 +1281,7 @@ svm_range_map_to_gpu(struct kfd_process_device 
>>> *pdd, struct svm_range *prange,
>>>                          last_start, prange->start + i,
>>>                          pte_flags,
>>>                          last_start - prange->start,
>>> -                       bo_adev->vm_manager.vram_base_offset,
>>> +                       bo_adev ? 
>>> bo_adev->vm_manager.vram_base_offset : 0,
>>>                          NULL, dma_addr, &vm->last_update);
>>>             for (j = last_start - prange->start; j <= i; j++)
