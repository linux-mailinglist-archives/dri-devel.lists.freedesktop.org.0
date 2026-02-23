Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IADoGmRsnGmcGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:04:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA50D1786A1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7B010E3E4;
	Mon, 23 Feb 2026 15:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="OB5Pnnwk";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="mqi3tkex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8DC10E3CC;
 Mon, 23 Feb 2026 15:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1771859016;
 bh=//VyQSb1AAV7R2tybo1nmuq
 E1TMTuJ9/sXf5xbAxuLQ=; b=OB5PnnwkJToiY2UZwgtIrXom49CvJKfPBVuPXnISLiKqYkAXHc
 ZYJX3nyKh39WIJs8+fxvwI+B66YkGFJ4cTq8//fXkftzua5IFKZZY87YKNLU8IfthJiH6F0WvB0
 2wbgTJ6G6fglY4QNLvSSVpyn7v+5dqrJGHJ12Fqt9rrQei/zeKuOJWctH4P5DPrAhu1wyUGyNg+
 COhii0/pKvEg3TD+xIM0WM2q2psum9vGbaYQ77eaJBnk8QxVVXMM1HVBMhlHHNImuvPMp+eaZLc
 NCYYrU0lcsHazduhqx1rtieYxVhdNnfwRJyacHVpJr8mRDvb08uWk+i/3Z+ocO4Jh2w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1771859016; bh=//VyQSb1AAV7R2tybo1nmuq
 E1TMTuJ9/sXf5xbAxuLQ=; b=mqi3tkexMVYPE4S9pIIvoV8bkGunoJtTNnusw+RtqVTEp+9m/l
 GnvhBR2XnzCpuJthrHMms1hrMzyUPJiQNLBQ==;
Message-ID: <97ea1340-a17a-47f9-b491-2b6bd70cc81c@damsy.net>
Date: Mon, 23 Feb 2026 16:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] drm/amdgpu: dump job ibs in the devcoredump
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
 <20260211102657.4180-6-pierre-eric.pelloux-prayer@amd.com>
 <CADnq5_Ndh2zaQ5VcoA1jNjAohkurqofd5_TweCfX+iaKz9h+vA@mail.gmail.com>
 <78b10f62-60d1-4dee-94a0-fa2eaf139cb6@damsy.net>
 <CADnq5_OJ3jS8yUN6yih5UaydOKHUr=-dxW9+anBFgniOV0UqNg@mail.gmail.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <CADnq5_OJ3jS8yUN6yih5UaydOKHUr=-dxW9+anBFgniOV0UqNg@mail.gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[damsy.net:s=202408r,damsy.net:s=202408e];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[damsy.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[damsy.net:+];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric@damsy.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: BA50D1786A1
X-Rspamd-Action: no action



Le 17/02/2026 à 17:47, Alex Deucher a écrit :
> On Tue, Feb 17, 2026 at 11:38 AM Pierre-Eric Pelloux-Prayer
> <pierre-eric@damsy.net> wrote:
>>
>>
>>
>> Le 17/02/2026 à 17:20, Alex Deucher a écrit :
>>> On Wed, Feb 11, 2026 at 6:07 AM Pierre-Eric Pelloux-Prayer
>>> <pierre-eric.pelloux-prayer@amd.com> wrote:
>>>>
>>>> Now that we have a worker thread, we can try to access the
>>>> IBs of the job. The process is:
>>>> * get the VM from the PASID
>>>> * get the BO from its VA and the VM
>>>> * map the BO for CPU access
>>>> * copy everything, then add it to the dump
>>>> Each step can fail so we have to be cautious.
>>>> These operations can be slow so when amdgpu_devcoredump_format
>>>> is called only to determine the size of the buffer we skip all
>>>> of them and assume they will succeed.
>>>>
>>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>>> ---
>>>>    .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 84 ++++++++++++++++++-
>>>>    1 file changed, 83 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>>>> index d0af8a294abf..d576518c212d 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>>>> @@ -200,12 +200,20 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
>>>>    static ssize_t
>>>>    amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_info *coredump)
>>>>    {
>>>> +       struct amdgpu_device *adev = coredump->adev;
>>>>           struct drm_printer p;
>>>>           struct drm_print_iterator iter;
>>>>           struct amdgpu_vm_fault_info *fault_info;
>>>> +       struct amdgpu_bo_va_mapping *mapping;
>>>>           struct amdgpu_ip_block *ip_block;
>>>> +       struct amdgpu_res_cursor cursor;
>>>> +       struct amdgpu_bo *abo, *root;
>>>> +       uint64_t va_start, offset;
>>>>           struct amdgpu_ring *ring;
>>>> -       int ver, i, j;
>>>> +       struct amdgpu_vm *vm;
>>>> +       u32 *ib_content;
>>>> +       uint8_t *kptr;
>>>> +       int ver, i, j, r;
>>>>           u32 ring_idx, off;
>>>>
>>>>           iter.data = buffer;
>>>> @@ -323,6 +331,80 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
>>>>           else if (coredump->reset_vram_lost)
>>>>                   drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>>>>
>>>> +       if (coredump->num_ibs) {
>>>> +               if (buffer)
>>>> +                       vm = amdgpu_vm_lock_by_pasid(adev, &root, coredump->pasid);
>>>> +               else
>>>> +                       vm = NULL;
>>>
>>> Is there any point in doing the loop if the vm is NULL?
>>
>> Yes : when doing the first pass to size the final buffer I skip the
>> buffers mapping + read operations that might be slow and instead just
>> account for the outputting of ib_size_dw dwords.
> 
> But if you don't map the buffer, you'll just be dumping the random
> content from ib_content[].

No. I'll send a v2 with more comments, but what's happening is that this 
function is called twice:
* the first time with buffer=NULL. In this case we just need the 
drm_printf calls to happen. Because the output' size isn't dependent on 
the values read from ib_content it's fine to jump to the 
output_ib_content label as early as possible.
* the second time buffer is not NULL. If the vm is now NULL, we won't 
enter the loop at all.

The other advantage of skipping the vm lookup and bo mapping when sizing 
the buffer is that we size the buffer as if all future lookups/mapping 
are successful.

Pierre-Eric


> 
>>
>>>
>>>> +
>>>> +               for (int i = 0; i < coredump->num_ibs && (!buffer || vm); i++) {
>>>> +                       ib_content = kvmalloc_array(coredump->ibs[i].ib_size_dw, 4,
>>>> +                                                   GFP_KERNEL);
>>>
>>> Shouldn't this be GFP_NOWAIT?
>>
>> This is executed by a worker so GFP_KERNEL should be ok?
> 
> Oh, right.  Yeah, should be ok.
> 
> Alex
> 
>>
>> Pierre-Eric
>>
>>>
>>> Alex
>>>
>>>> +                       if (!ib_content)
>>>> +                               continue;
>>>> +
>>>> +                       if (!vm)
>>>> +                               goto output_ib_content;
>>>> +
>>>> +                       va_start = coredump->ibs[i].gpu_addr & AMDGPU_GMC_HOLE_MASK;
>>>> +                       mapping = amdgpu_vm_bo_lookup_mapping(vm, va_start / AMDGPU_GPU_PAGE_SIZE);
>>>> +                       if (!mapping)
>>>> +                               goto free_ib_content;
>>>> +
>>>> +                       offset = va_start - (mapping->start * AMDGPU_GPU_PAGE_SIZE);
>>>> +                       abo = amdgpu_bo_ref(mapping->bo_va->base.bo);
>>>> +                       r = amdgpu_bo_reserve(abo, false);
>>>> +                       if (r)
>>>> +                               goto free_ib_content;
>>>> +
>>>> +                       if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS) {
>>>> +                               off = 0;
>>>> +
>>>> +                               if (abo->tbo.resource->mem_type != TTM_PL_VRAM)
>>>> +                                       goto unreserve_abo;
>>>> +
>>>> +                               amdgpu_res_first(abo->tbo.resource, offset,
>>>> +                                                coredump->ibs[i].ib_size_dw * 4,
>>>> +                                                &cursor);
>>>> +                               while (cursor.remaining) {
>>>> +                                       amdgpu_device_mm_access(adev, cursor.start / 4,
>>>> +                                                               &ib_content[off], cursor.size / 4,
>>>> +                                                               false);
>>>> +                                       off += cursor.size;
>>>> +                                       amdgpu_res_next(&cursor, cursor.size);
>>>> +                               }
>>>> +                       } else {
>>>> +                               r = ttm_bo_kmap(&abo->tbo, 0,
>>>> +                                               PFN_UP(abo->tbo.base.size),
>>>> +                                               &abo->kmap);
>>>> +                               if (r)
>>>> +                                       goto unreserve_abo;
>>>> +
>>>> +                               kptr = amdgpu_bo_kptr(abo);
>>>> +                               kptr += offset;
>>>> +                               memcpy(ib_content, kptr,
>>>> +                                      coredump->ibs[i].ib_size_dw * 4);
>>>> +
>>>> +                               amdgpu_bo_kunmap(abo);
>>>> +                       }
>>>> +
>>>> +output_ib_content:
>>>> +                       drm_printf(&p, "\nIB #%d 0x%llx %d dw\n",
>>>> +                                  i, coredump->ibs[i].gpu_addr, coredump->ibs[i].ib_size_dw);
>>>> +                       for (int j = 0; j < coredump->ibs[i].ib_size_dw; j++)
>>>> +                               drm_printf(&p, "0x%08x\n", ib_content[j]);
>>>> +unreserve_abo:
>>>> +                       if (vm)
>>>> +                               amdgpu_bo_unreserve(abo);
>>>> +free_ib_content:
>>>> +                       kfree(ib_content);
>>>> +               }
>>>> +               if (vm) {
>>>> +                       amdgpu_bo_unreserve(root);
>>>> +                       amdgpu_bo_unref(&root);
>>>> +               }
>>>> +       }
>>>> +
>>>>           return count - iter.remain;
>>>>    }
>>>>
>>>> --
>>>> 2.43.0
>>>>
