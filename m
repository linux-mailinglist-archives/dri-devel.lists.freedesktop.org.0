Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023F7ACAE6D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 15:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4F710E515;
	Mon,  2 Jun 2025 13:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="AehP1gEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886C510E519
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 13:01:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so37890195e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 06:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1748869283; x=1749474083;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=euxGwEPoht9Jsj5pttu2cEJFZhjghnavRV2BvVB1/bI=;
 b=AehP1gEufOxCpxzhzWNY3irEP39KUlnLq0FEqONqvonWxRVK3il7LwraEB+3m0Fi+a
 twq8bRCoDmJMm3Brq3KvzjsdHGHQ96oHc20mQaNF4HRdMhXRIamQ7WlUghKvAAn1vX7x
 n+h45r3wuNXDpxBQ5Xl8IZ+jhG9vmh7IoprhbADUbea/czOgm8/GJB27Lu6ThBQ4+2xA
 YuptPOgySK+e+6fY2ZjKAFrVHFdLjJtEQAdGdUIQGrgUDyJ5fp9TQzZqC4l1c1xCO7+J
 vyYJsK74J1yJXx/2JjR1YSg0Kb6SqZxXuPLPoAkSMU1C4DhkQN+MQ2J4c+dJAWKUQz7F
 QfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748869283; x=1749474083;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=euxGwEPoht9Jsj5pttu2cEJFZhjghnavRV2BvVB1/bI=;
 b=O3lyFdYgYtAlZ/iOxZ2bnCCDBvjpdXwjVKvNCJsZyBZeBmXCJEYN3PQduMoDV3Licu
 Te+r9cjiUHBvDvZBgGK/9w1hl/ZZ0npWkqnEQiplLbMe4lBYmpoFP+ZeQaNG6XLTFK0H
 xmi9ZZCynETovS4Gk6Bs8fQ+GTS+yE7R0dc6XdiQUEqyv44hZooAAGtnS+8ZTCzyTShO
 ADhWBIFowDZ46JcrWfA7ljjlLqAxie14UQRMFarjKYidVWYq0L4iHcjdx9+RQTia1OCl
 gVxtblnyUY9rGyFTj72lIr6JFIZK4X0tRxEHKAt62o3BQyZEkKEt5pwFmG3qVWpj7v7k
 +VTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu85/S/cszHct2bcxC2ynDa49arv4SovXfoX+fgG50pZTa9yjdJ9D7jc3S1mDZL7tyZYsfz5VxYB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvpkaZkdtbbyyGKCmmekX4Ov7ZbQSVYzHhl+x71HfN5WgDc6R7
 GxL2nfzMpyYas7sS4xpQmHYRiYe/v/bWs157PYTm9jp9850DkXN2mwxeLOGc7doZPXc=
X-Gm-Gg: ASbGnctwDtcNCbbc6zKYJj8KC8pFPJs7fGJj5GNUAh8kT9n5xsHsZ3yq/MI0w/7c8Ce
 atC74EKD/CjRTFVK0LFPy8Ram/12R5fdFWPRFM5QOZyFqjklTt/lXM/s1VfyBivLuNXwNf9xhYF
 Zx6uHPGOoKYQ4ngMzBG0OjLtKPNWNiYkUvgSSKyvLVtgi0+0RJpt2UPswWVnjN67Mo6/sOdlRqr
 qA7dWF1MUa8QSI+nF/m3maI82DMbWqNNwpMrFbY4Z8NHLkUFMOeznDzUTKSVUcF1dW31ms9GQjT
 oLGRkfuE/8ZHO9vHWpEoyGBpZobo6uqXEC07j0xpXsLetNHaYUpH0oTrKHqa5ZKHtg==
X-Google-Smtp-Source: AGHT+IGgyZGMnB+ffLpdAAczenyzQVohh2AnU13p0dgJfFSi4DMPqP1pURyiCTZ+VhLVWeIDvurhXA==
X-Received: by 2002:a05:6000:26d0:b0:3a4:f73d:53de with SMTP id
 ffacd0b85a97d-3a4fe16a72cmr6300402f8f.17.1748869282573; 
 Mon, 02 Jun 2025 06:01:22 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451df07ac73sm21651565e9.9.2025.06.02.06.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 06:01:21 -0700 (PDT)
Message-ID: <eaaa6ebb-61d9-482b-8e90-7d59373f937c@ursulin.net>
Date: Mon, 2 Jun 2025 14:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: signal scheduled fence when kill job
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, "Lin.Cao" <lincao12@amd.com>,
 dri-devel@lists.freedesktop.org, aamd-gfx@lists.freedesktop.org
Cc: haijun.chang@amd.com, zhenguo.yin@amd.com,
 Danilo Krummrich <dakr@kernel.org>
References: <20250515020713.1110476-1-lincao12@amd.com>
 <74e69f8c-a918-478d-b3f1-24c405abbb71@amd.com>
 <5c1f021f4aa808f2cd5d8da76e40662ba10b97d6.camel@mailbox.org>
 <7fa0a034-80ae-45c9-84bf-9841f9b28a93@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <7fa0a034-80ae-45c9-84bf-9841f9b28a93@amd.com>
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


On 15/05/2025 13:39, Christian König wrote:
> On 5/15/25 11:05, Philipp Stanner wrote:
>> On Thu, 2025-05-15 at 10:48 +0200, Christian König wrote:
>>> Explicitly adding the scheduler maintainers.
>>>
>>> On 5/15/25 04:07, Lin.Cao wrote:
>>>> Previously we only signaled finished fence which may cause some
>>>> submission's dependency cannot be cleared the cause benchmark hang.
>>>> Signal both scheduled fence and finished fence could fix this
>>>> issue.
>>
>> Code seems legit to me; but be so kind and also pimp up the commit
>> message a bit, Christian. It's not very clear what the bug is and why
>> setting the parent to NULL solves it. Or is the issue simply that the
>> fence might be dropped unsignaled, being a bug by definition? Needs to
>> be written down.
> 
> The later, we simply forgot to signal the scheduled fence when an application was killed.
> 
>> Grammar is also a bit too broken.
>>
>> And running the unit tests before pushing is probably also a good idea.
> 
> And maybe even writing a new unit test for that.

Gentle reminder that test would be needed as per 099b79f94366 ("drm/doc: 
Document KUnit expectations").

Regards,

Tvrtko


>>>>
>>>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>>
>> Acked-by: Philipp Stanner <phasta@kernel.org>
>>
>>>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>
>>> Danilo & Philipp can we quickly get an rb for that? I'm volunteering
>>> to push it to drm-misc-fixes and add the necessary stable tags since
>>> this is a fix for a rather ugly bug.
>>>
>>> Regards,
>>> Christian.
>>>
>>>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index bd39db7bb240..e671aa241720 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -176,6 +176,7 @@ static void
>>>> drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>>>   {
>>>>   	struct drm_sched_job *job = container_of(wrk,
>>>> typeof(*job), work);
>>>>   
>>>> +	drm_sched_fence_scheduled(job->s_fence, NULL);
>>>>   	drm_sched_fence_finished(job->s_fence, -ESRCH);
>>>>   	WARN_ON(job->s_fence->parent);
>>>>   	job->sched->ops->free_job(job);
>>>
>>
> 

