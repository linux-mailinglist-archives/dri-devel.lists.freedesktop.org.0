Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 393B462DC10
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 13:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48B010E5EA;
	Thu, 17 Nov 2022 12:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A04210E0D8;
 Thu, 17 Nov 2022 12:55:47 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v1so3630851wrt.11;
 Thu, 17 Nov 2022 04:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pXXriTWBh+RZ1Dut5lvpuNwiP5L4De5MnkmJJ6JIojM=;
 b=YY1P2f1N5uoG0pIDn9vmQ7WsXsjXk1itjjwswiKCfn2XVjY3IzOLgpKPFHMMi08dQQ
 +931PgQkP/05uer+UEIODUV/+hj4dRe+hM6ooEgPeRIoZSYMDO85r/vzs3hOAK4F4sHJ
 rtQlAL1QmB5uMVnwem8CQmJ37wmCBU5w36Qulop0U9EJjNq+rhMdvXUOJY4+YFuCAdng
 vsJb+nStn5XVK4IwfYhWv10NGYi6u51qDIvTomrpKxB5j/uVEsuWamuLZ0lVAp+KT45+
 HFx8HeAI+UOsE8xozt2XoodQIaoeQqtcaIE/Dvm+Trp78h5mtXYFyBl8aTX1an85OcDg
 pqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pXXriTWBh+RZ1Dut5lvpuNwiP5L4De5MnkmJJ6JIojM=;
 b=fqQZ5vUa95oHIRxJJ+R004XK7dZii2IM2sr3JnIAS9d2N/HYTHQCGfylbV2FxGMQpf
 adEPE8YCobvnQkTQxv1SAjCPvyn5n1upOZy3YsX2UivZIu/920VK9ox54YMT81/Bs1+o
 z+tEEQOi0IYDtL5vRYe9EEj20ljyrjCMKHzKz5VkIJ2LZTK7GDIZD6uJ/D0/yIsdB1GE
 dLkAWs/8pB7flNiHnoVgEsz7fRtCWOL7afuCxTI8WeDWKuvwx4XGPh9FsdtUKXER1pwx
 80b7HID0KMIrFTpoCV3TDkun0F0xbo8v1oGRi2z+opqjpwYS9nnb5E566hmsZ2fAXaXp
 BLQw==
X-Gm-Message-State: ANoB5pn72l0u0LvBE+q7+/s4CxkfMBfQ5tlIE5iNDWPCw/NxI1z3oKec
 blN7qSAjVXKBpp2iLWRBJuw=
X-Google-Smtp-Source: AA0mqf4C8Ii3XHeHK6Fn3d493uT88fbdfNrEf4OC2XUIQIdvj/s85gI/9/drVWYTlN9GiEO75vmmqA==
X-Received: by 2002:a5d:564d:0:b0:225:2e65:7440 with SMTP id
 j13-20020a5d564d000000b002252e657440mr1447305wrw.6.1668689745600; 
 Thu, 17 Nov 2022 04:55:45 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adfcd83000000b0022eafed36ebsm937567wrj.73.2022.11.17.04.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 04:55:45 -0800 (PST)
Message-ID: <ef732036-895b-0f5c-d06b-d7e4a739541a@gmail.com>
Date: Thu, 17 Nov 2022 13:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-13-christian.koenig@amd.com>
 <1b1fae07-a5c3-e982-94a2-c35ab26f0e91@collabora.com>
 <da420e53-cafd-b46f-90df-ed54e6de09a3@amd.com>
 <9722032c-f1b3-37ff-91d2-6ed965300047@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <9722032c-f1b3-37ff-91d2-6ed965300047@collabora.com>
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

Am 17.11.22 um 13:47 schrieb Dmitry Osipenko:
> On 11/17/22 12:53, Christian König wrote:
>> Am 17.11.22 um 03:36 schrieb Dmitry Osipenko:
>>> Hi,
>>>
>>> On 10/14/22 11:46, Christian König wrote:
>>>> +/* Remove the entity from the scheduler and kill all pending jobs */
>>>> +static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>>> +{
>>>> +    struct drm_sched_job *job;
>>>> +    struct dma_fence *prev;
>>>> +
>>>> +    if (!entity->rq)
>>>> +        return;
>>>> +
>>>> +    spin_lock(&entity->rq_lock);
>>>> +    entity->stopped = true;
>>>> +    drm_sched_rq_remove_entity(entity->rq, entity);
>>>> +    spin_unlock(&entity->rq_lock);
>>>> +
>>>> +    /* Make sure this entity is not used by the scheduler at the
>>>> moment */
>>>> +    wait_for_completion(&entity->entity_idle);
>>> I'm always hitting lockup here using Panfrost driver on terminating
>>> Xorg. Revering this patch helps. Any ideas how to fix it?
>>>
>> Well is the entity idle or are there some unsubmitted jobs left?
> Do you mean unsubmitted to h/w? IIUC, there are unsubmitted jobs left.
>
> I see that there are 5-6 incomplete (in-flight) jobs when
> panfrost_job_close() is invoked.
>
> There are 1-2 jobs that are constantly scheduled and finished once in a
> few seconds after the lockup happens.

Well what drm_sched_entity_kill() is supposed to do is to prevent 
pushing queued up stuff to the hw when the process which queued it is 
killed. Is the process really killed or is that just some incorrect 
handling?

In other words I see two possibilities here, either we have a bug in the 
scheduler or panfrost isn't using it correctly.

Does panfrost calls drm_sched_entity_flush() before it calls 
drm_sched_entity_fini()? (I don't have the driver source at hand at the 
moment).

Regards,
Christian.
