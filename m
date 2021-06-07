Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5219B39E604
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727336E8B1;
	Mon,  7 Jun 2021 17:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E246E8B1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 030DC3F29E;
 Mon,  7 Jun 2021 19:58:44 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="cDRGWE/s";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.689
X-Spam-Level: 
X-Spam-Status: No, score=-2.689 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09MtKzzLPqzd; Mon,  7 Jun 2021 19:58:43 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 5F1C53F29C;
 Mon,  7 Jun 2021 19:58:41 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D33293600BE;
 Mon,  7 Jun 2021 19:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1623088720; bh=ajLoBqypKHL04/NagZj/yRLUIepVQVjcfAhAffxQVsA=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=cDRGWE/soN70gEzTewq87Kcpbg6QzgaNcG9nwGqdmKwUmd+tNUmacp9ROjw3y7ZBY
 S5Z5cNqyBzrbQRsATzzkLmOkf574dMwEyovGuyK2qGIg4g1765eQqfYYIcI6FuP8Zh
 +5VYnkXIy7+1hC86YPeO2x/C7o2WqiV6f7bssmJM=
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <e5e6f3d0-af80-fa59-ba55-bafbb8e7670a@shipmail.org>
 <abe421ae-e09c-101a-5bfb-9a0de40a0e03@shipmail.org>
 <78dbb6a2-99f3-2362-8d74-6489e78df21a@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <94009311-6161-19ae-d846-59fb396a69b6@shipmail.org>
Date: Mon, 7 Jun 2021 19:58:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <78dbb6a2-99f3-2362-8d74-6489e78df21a@gmail.com>
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


On 6/7/21 7:54 PM, Christian König wrote:
>
>
> Am 07.06.21 um 19:06 schrieb Thomas Hellström (Intel):
>>
>> On 6/7/21 6:40 PM, Thomas Hellström (Intel) wrote:
>>>
>>> On 6/2/21 12:09 PM, Christian König wrote:
>>> ...
>>>> @@ -728,14 +728,15 @@ static int ttm_bo_add_move_fence(struct 
>>>> ttm_buffer_object *bo,
>>>>    */
>>>>   static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>>>>                     const struct ttm_place *place,
>>>> -                  struct ttm_resource *mem,
>>>> +                  struct ttm_resource **mem,
>>>>                     struct ttm_operation_ctx *ctx)
>>>>   {
>>>>       struct ttm_device *bdev = bo->bdev;
>>>> -    struct ttm_resource_manager *man = ttm_manager_type(bdev, 
>>>> mem->mem_type);
>>>> +    struct ttm_resource_manager *man;
>>>>       struct ww_acquire_ctx *ticket;
>>>>       int ret;
>>>>   +    man = ttm_manager_type(bdev, (*mem)->mem_type);
>>>
>>> Isn't (*mem) uninitialized here? Should be place->mem_type? Eviction 
>>> is immediately sent to the bushes.
>>>
>>> Got at least one additional NULL pointer deref to track down in the 
>>> eviction code, but could be a merge error of mine as well.
>>
>> Actually this last one was probably due to a bad temporary fix of the 
>> above one.
>
> I've found one more warning during my testing now. But that is just a 
> false positive.
>
> Apart from that I haven't seen any other fallout, but fingers crossed.

vmwgfx doesn't seem to happy. It works AFAICT., but warns in vmw_move() 
about ttm_bo_assign_mem() replacing an existing resource.

/Thomas



>
> Christian.
>
>>
>> /Thomas
>>
>>>
>>>
