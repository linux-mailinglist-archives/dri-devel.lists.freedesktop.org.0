Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EBA62DC24
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 13:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF9B10E5F3;
	Thu, 17 Nov 2022 12:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061610E5F3;
 Thu, 17 Nov 2022 12:59:14 +0000 (UTC)
Received: from [192.168.2.32] (109-252-117-140.nat.spd-mgts.ru
 [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B2C6A6602A9F;
 Thu, 17 Nov 2022 12:59:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668689953;
 bh=ON8Edr4EA8eix/aDWgGrk3HyeT6U9/uv4SelRgBM4po=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=R7AFcxgj/LgAZtEb0ZKWrvgal4BqhUQZ27g4tSKs+otrjv0I9YMxRFdCNHugI6Vk9
 aj26a1o4uvg9dczbHQGur8H4MhMBEVplsXl8EglbnRjZoalqMC8WvQ63xYdgHu1cFO
 yQ8h90pRCbbQmkLdBFEe3cTgj9ulHPAO2Mit7SHnpXt5RTN9YxPHCcvuxo1kH1eF/8
 +GZ9O3IPUcRnmMnvVDADKyVchF7peDNZ4BUQcwW8xJ/RwnovBu5CNz/wwGAmnoHCnm
 0riNDi3Rcx6sW7h7UTC3kul3QrHafbtn0w34oa5307yG/qDq2gcgVccxuAXZ2aNwxS
 VQruz1qG0y1fQ==
Message-ID: <74d74689-9c8e-1691-a232-c18271974f37@collabora.com>
Date: Thu, 17 Nov 2022 15:59:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-13-christian.koenig@amd.com>
 <1b1fae07-a5c3-e982-94a2-c35ab26f0e91@collabora.com>
 <da420e53-cafd-b46f-90df-ed54e6de09a3@amd.com>
 <9722032c-f1b3-37ff-91d2-6ed965300047@collabora.com>
 <ef732036-895b-0f5c-d06b-d7e4a739541a@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ef732036-895b-0f5c-d06b-d7e4a739541a@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 11/17/22 15:55, Christian König wrote:
> Am 17.11.22 um 13:47 schrieb Dmitry Osipenko:
>> On 11/17/22 12:53, Christian König wrote:
>>> Am 17.11.22 um 03:36 schrieb Dmitry Osipenko:
>>>> Hi,
>>>>
>>>> On 10/14/22 11:46, Christian König wrote:
>>>>> +/* Remove the entity from the scheduler and kill all pending jobs */
>>>>> +static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>>>> +{
>>>>> +    struct drm_sched_job *job;
>>>>> +    struct dma_fence *prev;
>>>>> +
>>>>> +    if (!entity->rq)
>>>>> +        return;
>>>>> +
>>>>> +    spin_lock(&entity->rq_lock);
>>>>> +    entity->stopped = true;
>>>>> +    drm_sched_rq_remove_entity(entity->rq, entity);
>>>>> +    spin_unlock(&entity->rq_lock);
>>>>> +
>>>>> +    /* Make sure this entity is not used by the scheduler at the
>>>>> moment */
>>>>> +    wait_for_completion(&entity->entity_idle);
>>>> I'm always hitting lockup here using Panfrost driver on terminating
>>>> Xorg. Revering this patch helps. Any ideas how to fix it?
>>>>
>>> Well is the entity idle or are there some unsubmitted jobs left?
>> Do you mean unsubmitted to h/w? IIUC, there are unsubmitted jobs left.
>>
>> I see that there are 5-6 incomplete (in-flight) jobs when
>> panfrost_job_close() is invoked.
>>
>> There are 1-2 jobs that are constantly scheduled and finished once in a
>> few seconds after the lockup happens.
> 
> Well what drm_sched_entity_kill() is supposed to do is to prevent
> pushing queued up stuff to the hw when the process which queued it is
> killed. Is the process really killed or is that just some incorrect
> handling?

It's actually 5-6 incomplete jobs of Xorg that are hanging when Xorg
process is closed.

The two re-scheduled jobs are from sddm, so it's only the Xorg context
that hangs.

> In other words I see two possibilities here, either we have a bug in the
> scheduler or panfrost isn't using it correctly.
> 
> Does panfrost calls drm_sched_entity_flush() before it calls
> drm_sched_entity_fini()? (I don't have the driver source at hand at the
> moment).

Panfrost doesn't use drm_sched_entity_flush(), nor drm_sched_entity_flush().

-- 
Best regards,
Dmitry

