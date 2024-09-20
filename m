Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3702F97D43B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 12:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC86310E802;
	Fri, 20 Sep 2024 10:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KJMXTYot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267E710E802
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 10:33:58 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42cacabd2e0so15799455e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 03:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726828437; x=1727433237; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lZG3Y8K3Rc+oZS+VmoX5YJaxhY5WT9jXa8woRRyTDiA=;
 b=KJMXTYoteLkDvGFtPi+lscUdMrGdz2GHdy1fkOUrj4+ACFqpcGqC+yQG9z8xDwRH8h
 jGgXLfbDxno7rlUmea/63p5bYUBE/zM9R7YvXXhhDzj1vVtmyrqc6y08/STi775KL6DY
 Lw9CQkFDyQeQlVgkXeZuZebP8jm5a6rm6Qhv+AjYMhHHHr0HikV5kJBMW12ZA7eCHXF+
 P/uvkux45V5apRImD3JrcjA3Ge+8sSkyzSJG0A6nkWP3ZzXXnMNymI1KAazNUz8sZHOj
 OLmd7UQrO2RRWYIYDBBiNRJcWEU56LQYrKfstAHvamp31P8v+nYbuk/IrlIDiudhz+Ox
 s8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726828437; x=1727433237;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lZG3Y8K3Rc+oZS+VmoX5YJaxhY5WT9jXa8woRRyTDiA=;
 b=sW50ETzlUGa0J82JsrttgvB7SuzaClLpHxaZqNzfMZhHWpwbRaAcCiD989LvVyjsvu
 oj5Rq6Rs6un6Ee5T4k/mJW0u+gEt3pUNRh3wY8SfuLgfKPPlRO65pwQlYY1HyVwagA29
 cbXetjzU/lxWBeRku7INECNaBqrhZhcp3L6kNumLIrT2tVVt6oMAoClycENPYEg0QJOb
 GQ6oeeiJ4mNKPpXE0IstCVE/Zd+5UYMxp04YlHu29vkO80Eb7pYnPxFbVawLJuQZWjD8
 9qxfg9CyEzT+UapKZjOVJL/gQDdTH1t0TP1E+VKKlZa6kXXym9mbDClRsg6fu38Dnxs1
 71tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURN5u1+fZyrjLDkqR5tzvuvzMzIcea02U9SJho0uAsHgCS5DnVJkStsvtdeDAyqvwd0+UoIfqcuto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu4O8tVLE6qI6oneU/XL6ADSlg/5Tx4W755fS1nd8DJW1iLOsh
 rWBELpLO2FtHD1XFCVKraV0bnLORmFNp5fsoc4Q7YGwrReExnUOg
X-Google-Smtp-Source: AGHT+IEppafszvuExI6WJWLAU6kIfEsWIkQsd7fkTRc9zf6GvWzN2HzsOw9DDETPvM+scomrHUtIKQ==
X-Received: by 2002:a05:600c:4fcd:b0:42c:bf0b:c489 with SMTP id
 5b1f17b1804b1-42e7ac1dc17mr14487115e9.18.1726828436541; 
 Fri, 20 Sep 2024 03:33:56 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e754c6dbcsm45203105e9.46.2024.09.20.03.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Sep 2024 03:33:56 -0700 (PDT)
Message-ID: <e2231195-8fed-4b25-8852-589794665e70@gmail.com>
Date: Fri, 20 Sep 2024 12:33:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
To: Philipp Stanner <pstanner@redhat.com>, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
References: <20240918133956.26557-1-christian.koenig@amd.com>
 <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
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

Am 20.09.24 um 10:57 schrieb Philipp Stanner:
> On Wed, 2024-09-18 at 15:39 +0200, Christian König wrote:
>> Tearing down the scheduler with jobs still on the pending list can
>> lead to use after free issues. Add a warning if drivers try to
>> destroy a scheduler which still has work pushed to the HW.
> Did you have time yet to look into my proposed waitque-solution?

I don't remember seeing anything. What have I missed?

>
>> When there are still entities with jobs the situation is even worse
>> since the dma_fences for those jobs can never signal we can just
>> choose between potentially locking up core memory management and
>> random memory corruption. When drivers really mess it up that well
>> let them run into a BUG_ON().
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
>>   1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index f093616fe53c..8a46fab5cdc8 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct drm_gpu_scheduler
>> *sched)
> I agree with Sima that it should first be documented in the function's
> docstring what the user is expected to have done before calling the
> function.

Good point, going to update the documentation as well.

Thanks,
Christian.

>
> P.
>
>>   
>>   	drm_sched_wqueue_stop(sched);
>>   
>> +	/*
>> +	 * Tearing down the scheduler wile there are still
>> unprocessed jobs can
>> +	 * lead to use after free issues in the scheduler fence.
>> +	 */
>> +	WARN_ON(!list_empty(&sched->pending_list));
>> +
>>   	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
>> {
>>   		struct drm_sched_rq *rq = sched->sched_rq[i];
>>   
>>   		spin_lock(&rq->lock);
>> -		list_for_each_entry(s_entity, &rq->entities, list)
>> +		list_for_each_entry(s_entity, &rq->entities, list) {
>> +			/*
>> +			 * The justification for this BUG_ON() is
>> that tearing
>> +			 * down the scheduler while jobs are pending
>> leaves
>> +			 * dma_fences unsignaled. Since we have
>> dependencies
>> +			 * from the core memory management to
>> eventually signal
>> +			 * dma_fences this can trivially lead to a
>> system wide
>> +			 * stop because of a locked up memory
>> management.
>> +			 */
>> +			BUG_ON(spsc_queue_count(&s_entity-
>>> job_queue));
>> +
>>   			/*
>>   			 * Prevents reinsertion and marks job_queue
>> as idle,
>>   			 * it will removed from rq in
>> drm_sched_entity_fini
>>   			 * eventually
>>   			 */
>>   			s_entity->stopped = true;
>> +		}
>>   		spin_unlock(&rq->lock);
>>   		kfree(sched->sched_rq[i]);
>>   	}

