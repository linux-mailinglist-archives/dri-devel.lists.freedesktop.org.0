Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C3662DE75
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 15:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19ACF10E60F;
	Thu, 17 Nov 2022 14:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F383410E60F;
 Thu, 17 Nov 2022 14:41:31 +0000 (UTC)
Received: from [192.168.2.32] (109-252-117-140.nat.spd-mgts.ru
 [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4025A6602AA5;
 Thu, 17 Nov 2022 14:41:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668696090;
 bh=lvaIRdz0i9pdVzS+8oqK7lnk9saQpKoDeBlk0730jCg=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=GJ7pEQgHj7SN4oUrpoO6gYxyIXaj43jZtYvCSYrVlejoOs6X44Re0lJ2M0eksfiTr
 hTKehpZw5TkKpOKTTTumss3D7algBQg8qMt9ILZXyjTM8YswX43y6ftTl/dpi5EyS+
 s6j3qWqRfXBTNaQWCNwZK3p99kENxhUsAlNo05gl25Qyfj/RFDih2NqnZ8lO3NZx4a
 iAu3JvM0SyfHdfDiLYIKRU4PPgy85CDu6wmnh8BHU7095VRzqAipFTgntMrx5CSLG/
 KXnlkDJaPMKlllrCdiFtmmkM/srPEXbSNdqtaU2SifavtUs1jXL/wQP6Vhc2F02f75
 aIOArEl+FuOew==
Message-ID: <50308598-324f-f628-a4f1-55da3935a2f5@collabora.com>
Date: Thu, 17 Nov 2022 17:41:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-13-christian.koenig@amd.com>
 <1b1fae07-a5c3-e982-94a2-c35ab26f0e91@collabora.com>
 <da420e53-cafd-b46f-90df-ed54e6de09a3@amd.com>
 <9722032c-f1b3-37ff-91d2-6ed965300047@collabora.com>
 <ef732036-895b-0f5c-d06b-d7e4a739541a@gmail.com>
 <74d74689-9c8e-1691-a232-c18271974f37@collabora.com>
 <126a8c1e-69ec-5068-1aad-30f5e7c3ef21@collabora.com>
 <4f5766ab-d31f-d0c8-6b1e-0c7e0fbabfed@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <4f5766ab-d31f-d0c8-6b1e-0c7e0fbabfed@amd.com>
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

On 11/17/22 16:11, Christian König wrote:
> Am 17.11.22 um 14:00 schrieb Dmitry Osipenko:
>> On 11/17/22 15:59, Dmitry Osipenko wrote:
>>> On 11/17/22 15:55, Christian König wrote:
>>>> Am 17.11.22 um 13:47 schrieb Dmitry Osipenko:
>>>>> On 11/17/22 12:53, Christian König wrote:
>>>>>> Am 17.11.22 um 03:36 schrieb Dmitry Osipenko:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 10/14/22 11:46, Christian König wrote:
>>>>>>>> +/* Remove the entity from the scheduler and kill all pending
>>>>>>>> jobs */
>>>>>>>> +static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>>>>>>> +{
>>>>>>>> +    struct drm_sched_job *job;
>>>>>>>> +    struct dma_fence *prev;
>>>>>>>> +
>>>>>>>> +    if (!entity->rq)
>>>>>>>> +        return;
>>>>>>>> +
>>>>>>>> +    spin_lock(&entity->rq_lock);
>>>>>>>> +    entity->stopped = true;
>>>>>>>> +    drm_sched_rq_remove_entity(entity->rq, entity);
>>>>>>>> +    spin_unlock(&entity->rq_lock);
>>>>>>>> +
>>>>>>>> +    /* Make sure this entity is not used by the scheduler at the
>>>>>>>> moment */
>>>>>>>> +    wait_for_completion(&entity->entity_idle);
>>>>>>> I'm always hitting lockup here using Panfrost driver on terminating
>>>>>>> Xorg. Revering this patch helps. Any ideas how to fix it?
>>>>>>>
>>>>>> Well is the entity idle or are there some unsubmitted jobs left?
>>>>> Do you mean unsubmitted to h/w? IIUC, there are unsubmitted jobs left.
>>>>>
>>>>> I see that there are 5-6 incomplete (in-flight) jobs when
>>>>> panfrost_job_close() is invoked.
>>>>>
>>>>> There are 1-2 jobs that are constantly scheduled and finished once
>>>>> in a
>>>>> few seconds after the lockup happens.
>>>> Well what drm_sched_entity_kill() is supposed to do is to prevent
>>>> pushing queued up stuff to the hw when the process which queued it is
>>>> killed. Is the process really killed or is that just some incorrect
>>>> handling?
>>> It's actually 5-6 incomplete jobs of Xorg that are hanging when Xorg
>>> process is closed.
>>>
>>> The two re-scheduled jobs are from sddm, so it's only the Xorg context
>>> that hangs.
>>>
>>>> In other words I see two possibilities here, either we have a bug in
>>>> the
>>>> scheduler or panfrost isn't using it correctly.
>>>>
>>>> Does panfrost calls drm_sched_entity_flush() before it calls
>>>> drm_sched_entity_fini()? (I don't have the driver source at hand at the
>>>> moment).
>>> Panfrost doesn't use drm_sched_entity_flush(), nor
>>> drm_sched_entity_flush().
>> *nor drm_sched_entity_fini()
> 
> Well that would mean that this is *really* buggy! How do you then end up
> in drm_sched_entity_kill()? From drm_sched_entity_destroy()?

Yes, from drm_sched_entity_destroy().

> drm_sched_entity_flush() should be called from the flush callback from
> the file_operations structure of panfrost. See amdgpu_flush() and
> amdgpu_ctx_mgr_entity_flush(). This makes sure that we wait for all
> entities of the process/file descriptor to be flushed out.
> 
> drm_sched_entity_fini() must be called before you free the memory the
> entity structure or otherwise we would run into an use after free.

Right, drm_sched_entity_destroy() invokes these two functions and
Panfrost uses drm_sched_entity_destroy().

-- 
Best regards,
Dmitry

