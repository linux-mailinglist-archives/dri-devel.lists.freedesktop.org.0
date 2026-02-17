Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCXsN0+blGmcFwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:46:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE1214E60C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D8C10E27C;
	Tue, 17 Feb 2026 16:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="Mr4HPy7q";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="xImIZDLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 462 seconds by postgrey-1.36 at gabe;
 Tue, 17 Feb 2026 16:46:04 UTC
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279F310E27C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1771346290;
 bh=BSEjUYJSOicR1z+WnJOG/Qz
 mo24H96F2B6PgvcRqkDk=; b=Mr4HPy7qhbK2N2QWxCqxW8QxsTRUoZEwOpI7aqGM/2W15mqiaV
 POOGqVGM1svGJGDgSwEF1xnavCMn8DBWX1gg+UhIUz6xIFOo36Kq9m/QTQ2050gvURc/3ksbOFS
 K2DZJlU0FkIzzmp7+cVnmP3RO6fevSg2lqFyIldsAmAHkDTZsknqhvrjWmVWsFZeDPQ159hOV2J
 dQNfpf2nJig92fwB9f0PLcwz58cUjSJa68KsL5HP0kFlbUzKskApJdFfvhZRNjVUVWG3C1fpwFN
 aYGIAkdD8+WGnMFJ7buJJ0Xr+CWZoRVk766Mog9ldlb7ecFmBGOhvGBJQNXLOoInDBw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1771346290; bh=BSEjUYJSOicR1z+WnJOG/Qz
 mo24H96F2B6PgvcRqkDk=; b=xImIZDLrcKWoRpx1kMwMsLerqZdarUQaLmBr/AT91m1I/0SZCj
 RuEfZcbbAFePgUqOVxqaDrYvLP8fkBJggkDQ==;
Message-ID: <78b10f62-60d1-4dee-94a0-fa2eaf139cb6@damsy.net>
Date: Tue, 17 Feb 2026 17:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] drm/amdgpu: dump job ibs in the devcoredump
To: Alex Deucher <alexdeucher@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
 <20260211102657.4180-6-pierre-eric.pelloux-prayer@amd.com>
 <CADnq5_Ndh2zaQ5VcoA1jNjAohkurqofd5_TweCfX+iaKz9h+vA@mail.gmail.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <CADnq5_Ndh2zaQ5VcoA1jNjAohkurqofd5_TweCfX+iaKz9h+vA@mail.gmail.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[damsy.net:s=202408r,damsy.net:s=202408e];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[damsy.net];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:pierre-eric.pelloux-prayer@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[pierre-eric@damsy.net,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric@damsy.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[damsy.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iter.data:url,amd.com:email,damsy.net:mid,damsy.net:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3FE1214E60C
X-Rspamd-Action: no action



Le 17/02/2026 à 17:20, Alex Deucher a écrit :
> On Wed, Feb 11, 2026 at 6:07 AM Pierre-Eric Pelloux-Prayer
> <pierre-eric.pelloux-prayer@amd.com> wrote:
>>
>> Now that we have a worker thread, we can try to access the
>> IBs of the job. The process is:
>> * get the VM from the PASID
>> * get the BO from its VA and the VM
>> * map the BO for CPU access
>> * copy everything, then add it to the dump
>> Each step can fail so we have to be cautious.
>> These operations can be slow so when amdgpu_devcoredump_format
>> is called only to determine the size of the buffer we skip all
>> of them and assume they will succeed.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 84 ++++++++++++++++++-
>>   1 file changed, 83 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>> index d0af8a294abf..d576518c212d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>> @@ -200,12 +200,20 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
>>   static ssize_t
>>   amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_info *coredump)
>>   {
>> +       struct amdgpu_device *adev = coredump->adev;
>>          struct drm_printer p;
>>          struct drm_print_iterator iter;
>>          struct amdgpu_vm_fault_info *fault_info;
>> +       struct amdgpu_bo_va_mapping *mapping;
>>          struct amdgpu_ip_block *ip_block;
>> +       struct amdgpu_res_cursor cursor;
>> +       struct amdgpu_bo *abo, *root;
>> +       uint64_t va_start, offset;
>>          struct amdgpu_ring *ring;
>> -       int ver, i, j;
>> +       struct amdgpu_vm *vm;
>> +       u32 *ib_content;
>> +       uint8_t *kptr;
>> +       int ver, i, j, r;
>>          u32 ring_idx, off;
>>
>>          iter.data = buffer;
>> @@ -323,6 +331,80 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
>>          else if (coredump->reset_vram_lost)
>>                  drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>>
>> +       if (coredump->num_ibs) {
>> +               if (buffer)
>> +                       vm = amdgpu_vm_lock_by_pasid(adev, &root, coredump->pasid);
>> +               else
>> +                       vm = NULL;
> 
> Is there any point in doing the loop if the vm is NULL?

Yes : when doing the first pass to size the final buffer I skip the 
buffers mapping + read operations that might be slow and instead just 
account for the outputting of ib_size_dw dwords.

>
>> +
>> +               for (int i = 0; i < coredump->num_ibs && (!buffer || vm); i++) {
>> +                       ib_content = kvmalloc_array(coredump->ibs[i].ib_size_dw, 4,
>> +                                                   GFP_KERNEL);
> 
> Shouldn't this be GFP_NOWAIT?

This is executed by a worker so GFP_KERNEL should be ok?

Pierre-Eric

> 
> Alex
> 
>> +                       if (!ib_content)
>> +                               continue;
>> +
>> +                       if (!vm)
>> +                               goto output_ib_content;
>> +
>> +                       va_start = coredump->ibs[i].gpu_addr & AMDGPU_GMC_HOLE_MASK;
>> +                       mapping = amdgpu_vm_bo_lookup_mapping(vm, va_start / AMDGPU_GPU_PAGE_SIZE);
>> +                       if (!mapping)
>> +                               goto free_ib_content;
>> +
>> +                       offset = va_start - (mapping->start * AMDGPU_GPU_PAGE_SIZE);
>> +                       abo = amdgpu_bo_ref(mapping->bo_va->base.bo);
>> +                       r = amdgpu_bo_reserve(abo, false);
>> +                       if (r)
>> +                               goto free_ib_content;
>> +
>> +                       if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS) {
>> +                               off = 0;
>> +
>> +                               if (abo->tbo.resource->mem_type != TTM_PL_VRAM)
>> +                                       goto unreserve_abo;
>> +
>> +                               amdgpu_res_first(abo->tbo.resource, offset,
>> +                                                coredump->ibs[i].ib_size_dw * 4,
>> +                                                &cursor);
>> +                               while (cursor.remaining) {
>> +                                       amdgpu_device_mm_access(adev, cursor.start / 4,
>> +                                                               &ib_content[off], cursor.size / 4,
>> +                                                               false);
>> +                                       off += cursor.size;
>> +                                       amdgpu_res_next(&cursor, cursor.size);
>> +                               }
>> +                       } else {
>> +                               r = ttm_bo_kmap(&abo->tbo, 0,
>> +                                               PFN_UP(abo->tbo.base.size),
>> +                                               &abo->kmap);
>> +                               if (r)
>> +                                       goto unreserve_abo;
>> +
>> +                               kptr = amdgpu_bo_kptr(abo);
>> +                               kptr += offset;
>> +                               memcpy(ib_content, kptr,
>> +                                      coredump->ibs[i].ib_size_dw * 4);
>> +
>> +                               amdgpu_bo_kunmap(abo);
>> +                       }
>> +
>> +output_ib_content:
>> +                       drm_printf(&p, "\nIB #%d 0x%llx %d dw\n",
>> +                                  i, coredump->ibs[i].gpu_addr, coredump->ibs[i].ib_size_dw);
>> +                       for (int j = 0; j < coredump->ibs[i].ib_size_dw; j++)
>> +                               drm_printf(&p, "0x%08x\n", ib_content[j]);
>> +unreserve_abo:
>> +                       if (vm)
>> +                               amdgpu_bo_unreserve(abo);
>> +free_ib_content:
>> +                       kfree(ib_content);
>> +               }
>> +               if (vm) {
>> +                       amdgpu_bo_unreserve(root);
>> +                       amdgpu_bo_unref(&root);
>> +               }
>> +       }
>> +
>>          return count - iter.remain;
>>   }
>>
>> --
>> 2.43.0
>>
