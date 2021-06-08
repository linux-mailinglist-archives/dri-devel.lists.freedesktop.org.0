Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 466A739EF59
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AC16EAC3;
	Tue,  8 Jun 2021 07:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEE96EAC3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 07:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 1D0693F50D;
 Tue,  8 Jun 2021 09:17:07 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="QJAv4i75";
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
 with ESMTP id hb5VUKc7_FCY; Tue,  8 Jun 2021 09:17:06 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id AE94F3F4D8;
 Tue,  8 Jun 2021 09:17:05 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id EBD013602F7;
 Tue,  8 Jun 2021 09:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1623136625; bh=BKOMCIyShH2VWRL2daTysBX+64dYivriSjRZiBZO0kw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=QJAv4i75ArnvCw1yPAs/+H5FlrR08vbg0u3ljDOoOr/Pr4X1A7H4RswYjMClQwewv
 XXFanPNKE0l2hcoPw5gS/PVgc/tLxHB21hI3c1hRGeu8X6huwvUBXAlQTLfG+q+Pyr
 iFAgax/FaXTCkw27Co9eJQd+25RMAx5PT+iZGjbI=
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <e5e6f3d0-af80-fa59-ba55-bafbb8e7670a@shipmail.org>
 <abe421ae-e09c-101a-5bfb-9a0de40a0e03@shipmail.org>
 <78dbb6a2-99f3-2362-8d74-6489e78df21a@gmail.com>
 <94009311-6161-19ae-d846-59fb396a69b6@shipmail.org>
 <6d316dfe-0378-8284-1f8e-29caf5619e34@gmail.com>
 <a08db95b-7c75-d998-7443-73d809121e47@shipmail.org>
 <aa1d9fea-d425-608d-6696-96e437acd08c@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <59e3ccb8-5c6a-e44b-41d7-9d15dc3c63f5@shipmail.org>
Date: Tue, 8 Jun 2021 09:17:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <aa1d9fea-d425-608d-6696-96e437acd08c@gmail.com>
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

Hi,

On 6/8/21 9:14 AM, Christian König wrote:
> Am 08.06.21 um 07:29 schrieb Thomas Hellström (Intel):
>> Hi,
>>
>> On 6/7/21 7:59 PM, Christian König wrote:
>>>
>>>
>>> Am 07.06.21 um 19:58 schrieb Thomas Hellström (Intel):
>>>>
>>>> On 6/7/21 7:54 PM, Christian König wrote:
>>>>>
>>>>>
>>>>> Am 07.06.21 um 19:06 schrieb Thomas Hellström (Intel):
>>>>>>
>>>>>> On 6/7/21 6:40 PM, Thomas Hellström (Intel) wrote:
>>>>>>>
>>>>>>> On 6/2/21 12:09 PM, Christian König wrote:
>>>>>>> ...
>>>>>>>> @@ -728,14 +728,15 @@ static int ttm_bo_add_move_fence(struct 
>>>>>>>> ttm_buffer_object *bo,
>>>>>>>>    */
>>>>>>>>   static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>>>>>>>>                     const struct ttm_place *place,
>>>>>>>> -                  struct ttm_resource *mem,
>>>>>>>> +                  struct ttm_resource **mem,
>>>>>>>>                     struct ttm_operation_ctx *ctx)
>>>>>>>>   {
>>>>>>>>       struct ttm_device *bdev = bo->bdev;
>>>>>>>> -    struct ttm_resource_manager *man = ttm_manager_type(bdev, 
>>>>>>>> mem->mem_type);
>>>>>>>> +    struct ttm_resource_manager *man;
>>>>>>>>       struct ww_acquire_ctx *ticket;
>>>>>>>>       int ret;
>>>>>>>>   +    man = ttm_manager_type(bdev, (*mem)->mem_type);
>>>>>>>
>>>>>>> Isn't (*mem) uninitialized here? Should be place->mem_type? 
>>>>>>> Eviction is immediately sent to the bushes.
>>>>>>>
>>>>>>> Got at least one additional NULL pointer deref to track down in 
>>>>>>> the eviction code, but could be a merge error of mine as well.
>>>>>>
>>>>>> Actually this last one was probably due to a bad temporary fix of 
>>>>>> the above one.
>>>>>
>>>>> I've found one more warning during my testing now. But that is 
>>>>> just a false positive.
>>>>>
>>>>> Apart from that I haven't seen any other fallout, but fingers 
>>>>> crossed.
>>>>
>>>> vmwgfx doesn't seem to happy. It works AFAICT., but warns in 
>>>> vmw_move() about ttm_bo_assign_mem() replacing an existing resource.
>>>
>>> Yeah, that's the one I've just fixed. Patch is underway.
>>
>> If that's the move_to_ghost patch, I don't think that would fix the 
>> vmwgfx issue, as IIRC vmwgfx ever uses ghost objects.
>
> Mhm, could be that vmwgfx is hitting the same warning with a different 
> backtrace.
>
> Do you have the log to double check?

Unfortunately not, but IIRC it was directly from vmw_move().

/Thomas


