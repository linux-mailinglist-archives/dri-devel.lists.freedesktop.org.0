Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48B48B52CF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 10:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A358112B16;
	Mon, 29 Apr 2024 08:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="sUQviPAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1321112B16
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 08:07:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41bca450fa3so13671105e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 01:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1714378044; x=1714982844;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T5/hJsVmQUs2bQw1ikox8cY2fuz3ApOf5h0qgxHHUyc=;
 b=sUQviPAI3+ky/ueHtzHP4D66F4RYvn+aItLvVy1nfEoKWvxCihlTd4ovkmFVP0zh3I
 zWj/a6cEf5rQvJCV2GMV4E3ks2f5Z7XF7O3+ZJ+X0nOwByLRRomqKMDn/DlFWZjEpzuW
 dC8Cqhw4FIT43JzArQmfRzb2tD77MyTwCmPJ3N0g9FPKVwCHjudXM+cXs8SxnrrzSbxy
 hkr3Pdl2qH15sfq1nTUNYhB/PKxObQTUdXJN+fKf45VP8YeXQA2cnj2kS7k45SrYsKXB
 u5mTa/Ig9fE9Ae28q3uyLdsU6uDZZeBM0imuneA7TU+M2cEp0iipG8pxo+bRHixa3hyh
 H+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714378044; x=1714982844;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T5/hJsVmQUs2bQw1ikox8cY2fuz3ApOf5h0qgxHHUyc=;
 b=vsEW8aZq+9Pa+EiqzjmD70r8AQJYPlWgwxo/Mm+//+5br9vDczJgbt/mrLcZN8CPm/
 35zF4z0d+B1Mzk6XefiGuMzjzql0E9rW4VyjXL1Txovb0MrHzVePzPC2k9uDvCNIcg61
 QxOp6rnQI3Vh/vAZ+LKJFXOFLftD5Dth8mT7T7W4to90AAtjufT38f6CKqzAUpjlTUZ5
 AZNkfDGsFmA0lXtjvGDm062JtgkPGSe46d00nwGLrIEK0JCSIRFyzdUvSPucVv5nLy6w
 27/5s8f/PXnyZWOTW2ygIbZ7TNsVEkvd0A9eQ5wt5Xsv1EoKoIyuK8zg87mkUNwBdPBV
 o8Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpIduKWdBCF6jvFNDdd5LR5P6a9o0isTuloiCOoY/YpPhPMSoQixo/AT5bGT5RwyJaQjVnQNruwMWr8lPGyZugd8ULRUUNngpjiwhA/bRK
X-Gm-Message-State: AOJu0Yyn2IUQ7rnruSEk2ucsHI9bWPAwbyO3GIjGW2QXodaGLnrHp3jj
 kHdoktKCj70hv1+Ud4Un6bfySP/szMLi1UEy7vzOEfn5TdlOaSPti018Y6BUWNw=
X-Google-Smtp-Source: AGHT+IF5NieIT8w4n19jbd4GyYuctJOdURqn4+cjHXfoClamoglaPAvqgOqR8HFIeKT2uQ+LmR8znA==
X-Received: by 2002:a05:600c:35cf:b0:41c:1b0:7b6b with SMTP id
 r15-20020a05600c35cf00b0041c01b07b6bmr2843459wmq.19.1714378043799; 
 Mon, 29 Apr 2024 01:07:23 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 fl23-20020a05600c0b9700b0041bc41287cesm9071198wmb.16.2024.04.29.01.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 01:07:23 -0700 (PDT)
Message-ID: <1094d239-a536-438d-9fe3-23f1d58363dd@ursulin.net>
Date: Mon, 29 Apr 2024 09:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/xe: Add helper to accumulate exec queue runtime
Content-Language: en-GB
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
 <20240423235652.1959945-4-lucas.demarchi@intel.com>
 <da261fef-03ef-47ad-8001-fe4fa26f43e0@ursulin.net>
 <Ziv5i/ZBGr/bfGrH@orsosgc001>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <Ziv5i/ZBGr/bfGrH@orsosgc001>
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


On 26/04/2024 19:59, Umesh Nerlige Ramappa wrote:
> On Fri, Apr 26, 2024 at 11:49:32AM +0100, Tvrtko Ursulin wrote:
>>
>> On 24/04/2024 00:56, Lucas De Marchi wrote:
>>> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>
>>> Add a helper to accumulate per-client runtime of all its
>>> exec queues. Currently that is done in 2 places:
>>>
>>>     1. when the exec_queue is destroyed
>>>     2. when the sched job is completed
>>>
>>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
>>>  drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>>>  drivers/gpu/drm/xe/xe_sched_job.c    |  2 ++
>>>  4 files changed, 49 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 2e62450d86e1..33d3bf93a2f1 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -547,6 +547,15 @@ struct xe_file {
>>>          struct mutex lock;
>>>      } exec_queue;
>>> +    /**
>>> +     * @runtime: hw engine class runtime in ticks for this drm client
>>> +     *
>>> +     * Only stats from xe_exec_queue->lrc[0] are accumulated. For 
>>> multi-lrc
>>> +     * case, since all jobs run in parallel on the engines, only the 
>>> stats
>>> +     * from lrc[0] are sufficient.
>>
>> Out of curiousity doesn't this mean multi-lrc jobs will be incorrectly 
>> accounted for? (When capacity is considered.)
> 
> TBH, I am not sure what the user would like to see here for multi-lrc. 
> If reporting the capacity, then we may need to use width as a 
> multiplication factor for multi-lrc. How was this done in i915?

IMO user has to see the real utilisation - so if there are two VCS and 
both are busy, 100% should be reported and not 50%. Latter would be 
misleading, either with or without cross-checking with physical utilisation.

In i915 with execlists this works correctly and with GuC you would 
probably know the answer better than me.

Regards,

Tvrtko

> 
> Regards,
> Umesh
> 
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +     */
>>> +    u64 runtime[XE_ENGINE_CLASS_MAX];
>>> +
>>>      /** @client: drm client */
>>>      struct xe_drm_client *client;
>>>  };
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c 
>>> b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index 395de93579fa..b7b6256cb96a 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -214,6 +214,8 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>>>  {
>>>      int i;
>>> +    xe_exec_queue_update_runtime(q);
>>> +
>>>      for (i = 0; i < q->width; ++i)
>>>          xe_lrc_finish(q->lrc + i);
>>>      if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & 
>>> EXEC_QUEUE_FLAG_VM || !q->vm))
>>> @@ -769,6 +771,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>>>          q->lrc[0].fence_ctx.next_seqno - 1;
>>>  }
>>> +/**
>>> + * xe_exec_queue_update_runtime() - Update runtime for this exec 
>>> queue from hw
>>> + * @q: The exec queue
>>> + *
>>> + * Update the timestamp saved by HW for this exec queue and save 
>>> runtime
>>> + * calculated by using the delta from last update. On multi-lrc 
>>> case, only the
>>> + * first is considered.
>>> + */
>>> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>>> +{
>>> +    struct xe_file *xef;
>>> +    struct xe_lrc *lrc;
>>> +    u32 old_ts, new_ts;
>>> +
>>> +    /*
>>> +     * Jobs that are run during driver load may use an exec_queue, 
>>> but are
>>> +     * not associated with a user xe file, so avoid accumulating 
>>> busyness
>>> +     * for kernel specific work.
>>> +     */
>>> +    if (!q->vm || !q->vm->xef)
>>> +        return;
>>> +
>>> +    xef = q->vm->xef;
>>> +    lrc = &q->lrc[0];
>>> +
>>> +    new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>>> +
>>> +    /*
>>> +     * Special case the very first timestamp: we don't want the
>>> +     * initial delta to be a huge value
>>> +     */
>>> +    if (old_ts)
>>> +        xef->runtime[q->class] += new_ts - old_ts;
>>> +}
>>> +
>>>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>>>  {
>>>      struct xe_exec_queue *eq = q, *next;
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h 
>>> b/drivers/gpu/drm/xe/xe_exec_queue.h
>>> index 02ce8d204622..45b72daa2db3 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>>> @@ -66,5 +66,6 @@ struct dma_fence 
>>> *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>>>                             struct xe_vm *vm);
>>>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct 
>>> xe_vm *vm,
>>>                    struct dma_fence *fence);
>>> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
>>>  #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c 
>>> b/drivers/gpu/drm/xe/xe_sched_job.c
>>> index cd8a2fba5438..6a081a4fa190 100644
>>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
>>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
>>> @@ -242,6 +242,8 @@ bool xe_sched_job_completed(struct xe_sched_job 
>>> *job)
>>>  {
>>>      struct xe_lrc *lrc = job->q->lrc;
>>> +    xe_exec_queue_update_runtime(job->q);
>>> +
>>>      /*
>>>       * Can safely check just LRC[0] seqno as that is last seqno 
>>> written when
>>>       * parallel handshake is done.
