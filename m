Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB88797BE45
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 16:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D2610E5D1;
	Wed, 18 Sep 2024 14:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kP69/LRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE45210E5D1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 14:56:19 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42ca6ba750eso6142435e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 07:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726671378; x=1727276178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u6sUztvG8M5+u5lWjFupkr1TmTeNjXtu/UBZ1lQRePQ=;
 b=kP69/LRu0hH0uvLR92u2sFKciXtv2InYTw+vzycdCGCwl5zFIK5GGJS5IyCrRbbTIm
 v2WR95s/tE/Fi5xCxTcRlQmQVG70ma6CGozcWIBvSIIygfo+manN/oRZIAL1y1pGu0tt
 +BJzpnUQFAoZ5adJz1sz6InXt3ufNOguZov92z1ACYWRp71DQbXfOy7VREfKdMxDnNfH
 jwuWNVL0b/b4avEq4uDLQGZBBGSCQDaiAvmO5mLsF8S7ELcLZPTVngOf5ox0jFWICMuY
 RZX/a55m2CIhOR3Gnqj1fleqLZIhnegbeG/2jPnyRM5qJuRHvGYkwzkt2JFVVjw3ZPmQ
 QBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726671378; x=1727276178;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u6sUztvG8M5+u5lWjFupkr1TmTeNjXtu/UBZ1lQRePQ=;
 b=D9XXURIGQ22cFfAYThlEIOeQpVpPHCriQddny4Ne1MbsX8Wgr6mAyetEBsjg7UPeyI
 QMCibkNo2rMhDTJXXknjjxm2qCBHfa2C0s1koABvX0suFXPdSgFmj2l/Jpk7eBm1Uj3G
 pni4EPJ5exq+NhN3G0OHBryWPktloL0bPTesIS23E0gaG89QKuDwVQMJSvRaV0E2j3RZ
 LGGKfS259aEgv2SAYB/7NYX0T4q6MIebv10lM2bjNtnzDsZC33Y7qrcuOwgPwTqB9TVj
 kMir+E8AWsGDPw16gShvi+sqj9HT8LRtIYwIotvna5jS2hDzOQpXG6m+bZVTEo5u1VXx
 Q44g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk8zp55Iuc+EJjlBhSNkkaxqsna78V/Zs/A0dMoKmMV1ZkF9Ef463kon9VZNTXCOqaag67uCGzx1g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk1bUyLodz2XqgFPXKJfwWwo/5qjL8ANGFgqELEAZzhyhnyKd8
 0XLWP2LNibJsA8iDqIi4G4q2/eEBdYfIzRfEVYLQPXJOtNf64AKK
X-Google-Smtp-Source: AGHT+IG0rY5/lS3vxfJsK5ob6+o42cEIiwcZkX4lNr616cvypTrpktKolArk44QCUSNiZtz1HDBChw==
X-Received: by 2002:a05:600c:1992:b0:42c:b826:a26c with SMTP id
 5b1f17b1804b1-42cbddced8fmr181749135e9.8.1726671377498; 
 Wed, 18 Sep 2024 07:56:17 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e70508027sm18836155e9.22.2024.09.18.07.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Sep 2024 07:56:16 -0700 (PDT)
Message-ID: <c9558c04-5f54-46b4-bc00-471d0481799d@gmail.com>
Date: Wed, 18 Sep 2024 16:56:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
To: Jani Nikula <jani.nikula@linux.intel.com>, dakr@kernel.org,
 pstanner@redhat.com, dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
References: <20240918133956.26557-1-christian.koenig@amd.com>
 <87h6adausa.fsf@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <87h6adausa.fsf@intel.com>
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

Am 18.09.24 um 16:41 schrieb Jani Nikula:
> On Wed, 18 Sep 2024, "Christian König" <ckoenig.leichtzumerken@gmail.com> wrote:
>> Tearing down the scheduler with jobs still on the pending list can
>> lead to use after free issues. Add a warning if drivers try to
>> destroy a scheduler which still has work pushed to the HW.
>>
>> When there are still entities with jobs the situation is even worse
>> since the dma_fences for those jobs can never signal we can just
>> choose between potentially locking up core memory management and
>> random memory corruption. When drivers really mess it up that well
>> let them run into a BUG_ON().
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
>>   1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index f093616fe53c..8a46fab5cdc8 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>   
>>   	drm_sched_wqueue_stop(sched);
>>   
>> +	/*
>> +	 * Tearing down the scheduler wile there are still unprocessed jobs can
>> +	 * lead to use after free issues in the scheduler fence.
>> +	 */
>> +	WARN_ON(!list_empty(&sched->pending_list));
> drm_WARN_ON(sched->dev, ...) would identify the device, which I presume
> would be helpful in multi-GPU systems.

Good point, going to fix that.

Regards,
Christian.

>
> BR,
> Jani.
>
>> +
>>   	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>>   		struct drm_sched_rq *rq = sched->sched_rq[i];
>>   
>>   		spin_lock(&rq->lock);
>> -		list_for_each_entry(s_entity, &rq->entities, list)
>> +		list_for_each_entry(s_entity, &rq->entities, list) {
>> +			/*
>> +			 * The justification for this BUG_ON() is that tearing
>> +			 * down the scheduler while jobs are pending leaves
>> +			 * dma_fences unsignaled. Since we have dependencies
>> +			 * from the core memory management to eventually signal
>> +			 * dma_fences this can trivially lead to a system wide
>> +			 * stop because of a locked up memory management.
>> +			 */
>> +			BUG_ON(spsc_queue_count(&s_entity->job_queue));
>> +
>>   			/*
>>   			 * Prevents reinsertion and marks job_queue as idle,
>>   			 * it will removed from rq in drm_sched_entity_fini
>>   			 * eventually
>>   			 */
>>   			s_entity->stopped = true;
>> +		}
>>   		spin_unlock(&rq->lock);
>>   		kfree(sched->sched_rq[i]);
>>   	}

