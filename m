Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAEC996CC8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 15:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8C410E72D;
	Wed,  9 Oct 2024 13:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="SG17PTYf";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="M1wTx2Sc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD2010E728;
 Wed,  9 Oct 2024 13:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1728481940;
 bh=y3vCb8lJ1Emv2BjETJYSa0m
 f3wOwiCfAIlM3SGQVcTU=; b=SG17PTYfsJLrf+a9nco/vi8u78T2X/Us3sBVLRhbu4IIcfUY5H
 yUkt7o3D5dLXXt27SvzEnc97pk3iUzfxfn1kkGnf9zmvcHijMw1y7Ss5XO3O5J8FwkcO/6M9rcx
 t4wqkyPi/cgKJ6eOcJaY2JGRSEDwcugdNKeaQHIIb8Iqd2i3jrwjZyKG8XmmqFf4tcjB/3H0fxY
 LCcL1hW0Ordt/a5wfbKfmFpbz/JCsJ2wrH+yMzjz1o9mmjATA7tcF8PH3MGfcU4UkMXtQ/pPCiT
 qHjEppVY6e8A98DRLfJID8o6BGrPP3Aar7cXy7LBbdbK2NwUBkXUopIIFjTI5oJ0UTg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1728481940; bh=y3vCb8lJ1Emv2BjETJYSa0m
 f3wOwiCfAIlM3SGQVcTU=; b=M1wTx2ScrOP5wwUz4o7ImRLQ7lmcSGBc/71hYvs1Xz499ga30L
 0ZY5s7SPIMlOilFB4Cq0LwdubBT5Z4L5w5CA==;
Message-ID: <dc319be0-af47-4053-bdd2-8a4d53ec4679@damsy.net>
Date: Wed, 9 Oct 2024 15:52:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: prevent BO_HANDLES error from being
 overwritten
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mohammed Anees <pvmohammedanees2003@gmail.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch,
 srinivasan.shanmugam@amd.com, David.Wu3@amd.com, felix.kuehling@amd.com,
 YuanShang.Mao@amd.com, pierre-eric.pelloux-prayer@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241009122831.109809-1-pvmohammedanees2003@gmail.com>
 <6426b779-bd4d-4c85-b99d-4ddedf75d837@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <6426b779-bd4d-4c85-b99d-4ddedf75d837@amd.com>
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

Thanks for the updated patch, looks good to me.

Le 09/10/2024 à 14:31, Christian König a écrit :
> Am 09.10.24 um 14:28 schrieb Mohammed Anees:
>> Before this patch, if multiple BO_HANDLES chunks were submitted,
>> the error -EINVAL would be correctly set but could be overwritten
>> by the return value from amdgpu_cs_p1_bo_handles(). This patch
>> ensures that if there are multiple BO_HANDLES, we stop.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: fec5f8e8c6bc ("drm/amdgpu: disallow multiple BO_HANDLES chunks in one submit")
>> Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> @Pierre-Eric can you pick that one up and push to amd-staging-drm-next?
> 
> Alex is currently on XDC and I'm a bit busy as well.

Sure, will do.

Pierre-Eric

> 
> Thanks,
> Christian.
> 
>> ---
>> v2:
>> - Switched to goto free_partial_kdata for error handling, following the existing pattern.
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 1e475eb01417..d891ab779ca7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -265,7 +265,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>>               /* Only a single BO list is allowed to simplify handling. */
>>               if (p->bo_list)
>> -                ret = -EINVAL;
>> +                goto free_partial_kdata;
>>               ret = amdgpu_cs_p1_bo_handles(p, p->chunks[i].kdata);
>>               if (ret)
