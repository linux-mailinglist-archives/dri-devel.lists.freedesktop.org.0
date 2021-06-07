Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2A339D9F0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 12:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EE96E0F5;
	Mon,  7 Jun 2021 10:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA596E0F5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 10:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id E77503F5BA;
 Mon,  7 Jun 2021 12:44:48 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="J9WmkBMt";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYNdn6tKdmXC; Mon,  7 Jun 2021 12:44:47 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 5064E3F46C;
 Mon,  7 Jun 2021 12:44:44 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.55.55.41])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 6E9913601A1;
 Mon,  7 Jun 2021 12:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1623062683; bh=ZyDciiRdTAOqnBL3cyuZyCIusFBlSu1dmQv+UdvNwFo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=J9WmkBMt71ViarKNMzZa/V0vgz/IGAbSQtC5ieZ1tFjjJPKD7TbH6FROiMQ53Yb7k
 J279D34UV9LEhjQp2dJXkZuZegLaQUEQAWas2Efvltw5q5b4VsHJYYnKwds6Rd36TP
 5ZDtTKPeLpflEfevgpCmsjF+Mrh8wMh3GwBedKpA=
Subject: Re: [PATCH 10/10] drm/ttm: flip the switch for driver allocated
 resources v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <20210602100914.46246-10-christian.koenig@amd.com>
 <c7163102-61e7-435d-f10a-83ee1926fe1f@shipmail.org>
 <6c2ccd57-73bb-fcc5-a22c-0e6b5be12566@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <47c88617-2686-6df3-ac60-e8fd6e352963@shipmail.org>
Date: Mon, 7 Jun 2021 12:44:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <6c2ccd57-73bb-fcc5-a22c-0e6b5be12566@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 6/7/21 12:37 PM, Christian König wrote:
> Am 07.06.21 um 12:15 schrieb Thomas Hellström (Intel):
>>
>> On 6/2/21 12:09 PM, Christian König wrote:
>>> Instead of both driver and TTM allocating memory finalize embedding the
>>> ttm_resource object as base into the driver backends.
>>>
>>> v2: fix typo in vmwgfx grid mgr and double init in amdgpu_vram_mgr.c
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   | 44 ++++++--------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  2 +-
>>>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  5 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 60 
>>> +++++++++----------
>>>   drivers/gpu/drm/drm_gem_vram_helper.c         |  3 +-
>>>   drivers/gpu/drm/nouveau/nouveau_bo.c          |  8 +--
>>>   drivers/gpu/drm/nouveau/nouveau_mem.c         | 11 ++--
>>>   drivers/gpu/drm/nouveau/nouveau_mem.h         | 14 ++---
>>>   drivers/gpu/drm/nouveau/nouveau_ttm.c         | 32 +++++-----
>>>   drivers/gpu/drm/ttm/ttm_range_manager.c       | 23 +++----
>>>   drivers/gpu/drm/ttm/ttm_resource.c            | 18 +-----
>>>   drivers/gpu/drm/ttm/ttm_sys_manager.c         | 12 ++--
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 24 ++++----
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 27 ++++-----
>>>   include/drm/ttm/ttm_range_manager.h           |  3 +-
>>>   include/drm/ttm/ttm_resource.h                | 43 ++++++-------
>>>   16 files changed, 140 insertions(+), 189 deletions(-)
>> ...
>>>   diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>> index ce5d07ca384c..c32e1aee2481 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>> @@ -58,7 +58,7 @@ to_range_manager(struct ttm_resource_manager *man)
>>>   static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>>>                      struct ttm_buffer_object *bo,
>>>                      const struct ttm_place *place,
>>> -                   struct ttm_resource *mem)
>>> +                   struct ttm_resource **res)
>>>   {
>>>       struct ttm_range_manager *rman = to_range_manager(man);
>>>       struct ttm_range_mgr_node *node;
>>> @@ -83,37 +83,30 @@ static int ttm_range_man_alloc(struct 
>>> ttm_resource_manager *man,
>>>         spin_lock(&rman->lock);
>>>       ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
>>> -                      mem->num_pages, bo->page_alignment, 0,
>>> +                      node->base.num_pages,
>>> +                      bo->page_alignment, 0,
>>>                         place->fpfn, lpfn, mode);
>>>       spin_unlock(&rman->lock);
>>>   -    if (unlikely(ret)) {
>>> +    if (unlikely(ret))
>>>           kfree(node);
>>> -    } else {
>>> -        mem->mm_node = &node->mm_nodes[0];
>>> -        mem->start = node->mm_nodes[0].start;
>>> -    }
>>> +    else
>>> +        node->base.start = node->mm_nodes[0].start;
>>>         return ret;
>>>   }
>>
>> Looks like this patch forgets to assign *@res. Null pointer derefs 
>> when testing i915.
>
> I should really CC the Intel list for TTM patches as well. The CI 
> system should have spotted that.

Unfortunately, the dg1 system is not participating in CI yet AFAICT, but 
moving forward I think it's a good idea.

/Thomas


