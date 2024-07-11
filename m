Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB9B92E7D4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 14:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C27B10EA40;
	Thu, 11 Jul 2024 12:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="glXMNa46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AF910EA40
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 12:01:05 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52e9a920e73so862458e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720699263; x=1721304063; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=esMVKNq1y0TATT+41IEGDEUae5nU0sRBjFU4pPm7zd8=;
 b=glXMNa46sviqxFx+IjBGW67Dm0oZ6CiYJlgXfr6FCJCo+R6iPVrEs6htO/juKb6vwO
 OMNlbrR5Yx+5gA+LaaHhl4dz01bCa2yiTiw1MN9VjOZ2eaA6zcnhTVLfQzRFZQ8MQf03
 GbEDwvkXEGca8//yK8FpM/VNraO6DZRAs8DEw0LUHAM2gO+glD7N9kROwgKkfYWc9pB+
 NY7/jGbAVF++6YrAygTsZe6a0IIuVJerx7rVJhkp5Ob3v+G6mNGeUokFEI3wn2zpqpEI
 QpNp6EjOweBIfMHv+Epg/zA/SWnYuWha4nFV2DqpgnEHx01wAC/+wvp1tj3K4P67D3yS
 eq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720699263; x=1721304063;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=esMVKNq1y0TATT+41IEGDEUae5nU0sRBjFU4pPm7zd8=;
 b=vhAqmhAaN9/L8u02d1X3aIwue36ZkMmiULxexJtgy0pr39I0kZLMNxcbX9FUremsWd
 qSugnAbngdGh2ckAKMUi2/alm5spah1G7rdbhHfalFBkcZ0RIZNlTYvrExthCogG+s2t
 p1Pwdc2e0xpXFCmd87iypspMspU0c55T3tUvLUmkewGnvopasj6hDTP/Tx6I36JFDQFh
 ah9C0xM2PSbQBKBvqdrdqg+ORJb/K01oBEn1YFxA3rQeqOUmuxhp69BcZsoHxvlMOxyg
 qLDTuuTbBjvzZMET90FdtwGcojQv/pp/ZLyK9+YzTLo3TdMqt0IAHbV0XZUmTc6X92Zh
 +Quw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzl7kajs794xOegG0J0Tw2Yc48rNcQwscndMtSk58u0a3IuRvBp0XPE0zIwx9P+MyE4uGOe6MnMCUsgY+LlozrvY36sTPxIVEHrBOCDtrC
X-Gm-Message-State: AOJu0YwCMPWF8mlKDvnvovdYGY0FyzVO5w1ZtWtXVzodaiIuVPzT4k7U
 tigwKutZK1GiBl10kv0qrSN1+G27+OQdQYhamg8J28FiDRxek4kK4x3gUaTD
X-Google-Smtp-Source: AGHT+IEOZD1Pdhqgo7a4wPqlYjLnwSC1secYlNhLAIp/3ySCB2qMZskZICslm6MPKv/WZEgiBjCbUA==
X-Received: by 2002:a05:6512:b1d:b0:52e:9beb:a2e2 with SMTP id
 2adb3069b0e04-52eb999434cmr5767646e87.19.1720699262521; 
 Thu, 11 Jul 2024 05:01:02 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1668sm284249725e9.1.2024.07.11.05.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 05:01:02 -0700 (PDT)
Message-ID: <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
Date: Thu, 11 Jul 2024 14:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: Matthew Brost <matthew.brost@intel.com>
Cc: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
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

Am 10.07.24 um 20:19 schrieb Matthew Brost:
> On Wed, Jul 10, 2024 at 02:42:58PM +0200, Christian König wrote:
>> That is something drivers really shouldn't mess with.
>>
> Thomas uses this in Xe to implement a shrinker [1]. Seems to need to
> remain available for drivers.

No, that is exactly what I try to prevent with that.

This is an internally thing of TTM and drivers should never use it directly.

Regards,
Christian.

>
> Matt
>
> [1] https://patchwork.freedesktop.org/patch/602165/?series=131815&rev=6
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c      |  1 +
>>   drivers/gpu/drm/ttm/ttm_bo_util.c |  2 +
>>   drivers/gpu/drm/ttm/ttm_bo_util.h | 67 +++++++++++++++++++++++++++++++
>>   include/drm/ttm/ttm_bo.h          | 35 ----------------
>>   4 files changed, 70 insertions(+), 35 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ttm/ttm_bo_util.h
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 0131ec802066..41bee8696e69 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -45,6 +45,7 @@
>>   #include <linux/dma-resv.h>
>>   
>>   #include "ttm_module.h"
>> +#include "ttm_bo_util.h"
>>   
>>   static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
>>   					struct ttm_placement *placement)
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 3c07f4712d5c..03e28e3d0d03 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -37,6 +37,8 @@
>>   
>>   #include <drm/drm_cache.h>
>>   
>> +#include "ttm_bo_util.h"
>> +
>>   struct ttm_transfer_obj {
>>   	struct ttm_buffer_object base;
>>   	struct ttm_buffer_object *bo;
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.h b/drivers/gpu/drm/ttm/ttm_bo_util.h
>> new file mode 100644
>> index 000000000000..c19b50809208
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.h
>> @@ -0,0 +1,67 @@
>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>> +/**************************************************************************
>> + * Copyright 2024 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + **************************************************************************/
>> +#ifndef _TTM_BO_UTIL_H_
>> +#define _TTM_BO_UTIL_H_
>> +
>> +struct ww_acquire_ctx;
>> +
>> +struct ttm_buffer_object;
>> +struct ttm_operation_ctx;
>> +struct ttm_lru_walk;
>> +
>> +/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
>> +struct ttm_lru_walk_ops {
>> +	/**
>> +	 * process_bo - Process this bo.
>> +	 * @walk: struct ttm_lru_walk describing the walk.
>> +	 * @bo: A locked and referenced buffer object.
>> +	 *
>> +	 * Return: Negative error code on error, User-defined positive value
>> +	 * (typically, but not always, size of the processed bo) on success.
>> +	 * On success, the returned values are summed by the walk and the
>> +	 * walk exits when its target is met.
>> +	 * 0 also indicates success, -EBUSY means this bo was skipped.
>> +	 */
>> +	s64 (*process_bo)(struct ttm_lru_walk *walk,
>> +			  struct ttm_buffer_object *bo);
>> +};
>> +
>> +/**
>> + * struct ttm_lru_walk - Structure describing a LRU walk.
>> + */
>> +struct ttm_lru_walk {
>> +	/** @ops: Pointer to the ops structure. */
>> +	const struct ttm_lru_walk_ops *ops;
>> +	/** @ctx: Pointer to the struct ttm_operation_ctx. */
>> +	struct ttm_operation_ctx *ctx;
>> +	/** @ticket: The struct ww_acquire_ctx if any. */
>> +	struct ww_acquire_ctx *ticket;
>> +	/** @tryock_only: Only use trylock for locking. */
>> +	bool trylock_only;
>> +};
>> +
>> +s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>> +			   struct ttm_resource_manager *man, s64 target);
>> +
>> +#endif
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index d1a732d56259..5f7c967222a2 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -194,41 +194,6 @@ struct ttm_operation_ctx {
>>   	uint64_t bytes_moved;
>>   };
>>   
>> -struct ttm_lru_walk;
>> -
>> -/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
>> -struct ttm_lru_walk_ops {
>> -	/**
>> -	 * process_bo - Process this bo.
>> -	 * @walk: struct ttm_lru_walk describing the walk.
>> -	 * @bo: A locked and referenced buffer object.
>> -	 *
>> -	 * Return: Negative error code on error, User-defined positive value
>> -	 * (typically, but not always, size of the processed bo) on success.
>> -	 * On success, the returned values are summed by the walk and the
>> -	 * walk exits when its target is met.
>> -	 * 0 also indicates success, -EBUSY means this bo was skipped.
>> -	 */
>> -	s64 (*process_bo)(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo);
>> -};
>> -
>> -/**
>> - * struct ttm_lru_walk - Structure describing a LRU walk.
>> - */
>> -struct ttm_lru_walk {
>> -	/** @ops: Pointer to the ops structure. */
>> -	const struct ttm_lru_walk_ops *ops;
>> -	/** @ctx: Pointer to the struct ttm_operation_ctx. */
>> -	struct ttm_operation_ctx *ctx;
>> -	/** @ticket: The struct ww_acquire_ctx if any. */
>> -	struct ww_acquire_ctx *ticket;
>> -	/** @tryock_only: Only use trylock for locking. */
>> -	bool trylock_only;
>> -};
>> -
>> -s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>> -			   struct ttm_resource_manager *man, s64 target);
>> -
>>   /**
>>    * ttm_bo_get - reference a struct ttm_buffer_object
>>    *
>> -- 
>> 2.34.1
>>

