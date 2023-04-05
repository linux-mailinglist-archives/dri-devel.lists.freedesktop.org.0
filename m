Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF996D820F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 17:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E95510E9F6;
	Wed,  5 Apr 2023 15:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09F710E9F6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680709022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAoSWbkGrjcqGy1ebcwtm3AyobUtd3KUJObW/aFOL0w=;
 b=PqlBYU7ZdOUrd4nXmnbQF5GLS+tc8TuIK9ZW7MG1/8D8GYBeYJjrF9jEt/HOM5kEw380UQ
 gPqhsrkeL+isv7nXfteWXhEoYruEZPraUTPY6lZX7VDy38YnKUBxVBfniU36EF4lS39L/4
 vp3lmFe/dZI00n6Itb17yn+fq6qEkUE=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-vXKy_LC2O72tFaNByCETcA-1; Wed, 05 Apr 2023 11:37:01 -0400
X-MC-Unique: vXKy_LC2O72tFaNByCETcA-1
Received: by mail-pf1-f198.google.com with SMTP id
 o188-20020a62cdc5000000b0062be61a5e48so14675333pfg.22
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 08:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680709020;
 h=content-transfer-encoding:in-reply-to:cc:organization:from
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PAoSWbkGrjcqGy1ebcwtm3AyobUtd3KUJObW/aFOL0w=;
 b=Fdwe6uoWw9JEzdR1cNvF8k3YqQVwcFP0Nzj6FyGnYG1wA+wGX4dYKjEhi7NqOEw5KH
 qSxK7AzYE40D6vyQaJ3+uiUXRnRXLt3SQRKXdiedpZvqI2EMR01G/rYEqHw3DT4X+G0v
 y9KwNOk83/usFIHOWnTTmdewL9HuTdbiOFXeRfNQtviPf/EkLLRdGKJuB99AbuDbnXo2
 Fd5uiiiIkYenTIizMAz3lgvIHDWTU/eL1/hlbYWiYRjyLMTk3t42nteU/BRwAtcqLvU7
 3z82pmISBcAQ3rwq1w5paLWWQh7ijy8a2f3DAEza+l/WJyDjBzyFvsDVvRFQSNqyBOGX
 bsRQ==
X-Gm-Message-State: AAQBX9csdO4kVgbMCCnOD0OtVaTB+C25MewvpD50WLEx8g3Xe72u4CwI
 FW1FupCTD9Vmu39ggudnGG7G5zq7DiCg/PYfFVwoHAHOx+HrvKPtefonoWBNkfWAEmEHU7eDSir
 DXdP9JqQM6ELRq93yTVKWR+9p06WE
X-Received: by 2002:a17:902:fb86:b0:1a1:cce7:94ed with SMTP id
 lg6-20020a170902fb8600b001a1cce794edmr5875805plb.67.1680709020721; 
 Wed, 05 Apr 2023 08:37:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350Ysj1lHSmWHRrIOh5XGakc+yhw2pI8tXqwln7bNPtMABRm3Ds3ebM09ogVIeJ4YwQVaZ5dCsg==
X-Received: by 2002:a17:902:fb86:b0:1a1:cce7:94ed with SMTP id
 lg6-20020a170902fb8600b001a1cce794edmr5875793plb.67.1680709020353; 
 Wed, 05 Apr 2023 08:37:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 jj21-20020a170903049500b001a19196af48sm10262513plb.64.2023.04.05.08.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 08:37:00 -0700 (PDT)
Message-ID: <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
Date: Wed, 5 Apr 2023 16:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
To: Luben Tuikov <luben.tuikov@amd.com>, Lucas Stach
 <l.stach@pengutronix.de>, daniel@ffwll.ch, Dave Airlie <airlied@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, andrey.grodzovsky@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 tvrtko.ursulin@linux.intel.com, Matthew Brost <matthew.brost@intel.com>,
 yuq825@gmail.com, Boris Brezillon <boris.brezillon@collabora.com>,
 lina@asahilina.net
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/4/23 06:31, Luben Tuikov wrote:
> On 2023-03-28 04:54, Lucas Stach wrote:
>> Hi Danilo,
>>
>> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
>>> Hi all,
>>>
>>> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")
>>> tries to track the accumulated time that a job was active on the GPU
>>> writing it to the entity through which the job was deployed to the
>>> scheduler originally. This is done within drm_sched_get_cleanup_job()
>>> which fetches a job from the schedulers pending_list.
>>>
>>> Doing this can result in a race condition where the entity is already
>>> freed, but the entity's newly added elapsed_ns field is still accessed
>>> once the job is fetched from the pending_list.
>>>
>>> After drm_sched_entity_destroy() being called it should be safe to free
>>> the structure that embeds the entity. However, a job originally handed
>>> over to the scheduler by this entity might still reside in the
>>> schedulers pending_list for cleanup after drm_sched_entity_destroy()
>>> already being called and the entity being freed. Hence, we can run into
>>> a UAF.
>>>
>> Sorry about that, I clearly didn't properly consider this case.
>>
>>> In my case it happened that a job, as explained above, was just picked
>>> from the schedulers pending_list after the entity was freed due to the
>>> client application exiting. Meanwhile this freed up memory was already
>>> allocated for a subsequent client applications job structure again.
>>> Hence, the new jobs memory got corrupted. Luckily, I was able to
>>> reproduce the same corruption over and over again by just using
>>> deqp-runner to run a specific set of VK test cases in parallel.
>>>
>>> Fixing this issue doesn't seem to be very straightforward though (unless
>>> I miss something), which is why I'm writing this mail instead of sending
>>> a fix directly.
>>>
>>> Spontaneously, I see three options to fix it:
>>>
>>> 1. Rather than embedding the entity into driver specific structures
>>> (e.g. tied to file_priv) we could allocate the entity separately and
>>> reference count it, such that it's only freed up once all jobs that were
>>> deployed through this entity are fetched from the schedulers pending list.
>>>
>> My vote is on this or something in similar vain for the long term. I
>> have some hope to be able to add a GPU scheduling algorithm with a bit
>> more fairness than the current one sometime in the future, which
>> requires execution time tracking on the entities.
> 
> Danilo,
> 
> Using kref is preferable, i.e. option 1 above.

I think the only real motivation for doing that would be for generically 
tracking job statistics within the entity a job was deployed through. If 
we all agree on tracking job statistics this way I am happy to prepare a 
patch for this option and drop this one: 
https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u

Christian mentioned amdgpu tried something similar to what Lucas tried 
running into similar trouble, backed off and implemented it in another 
way - a driver specific way I guess?

> 
> Lucas, can you shed some light on,
> 
> 1. In what way the current FIFO scheduling is unfair, and
> 2. shed some details on this "scheduling algorithm with a bit
> more fairness than the current one"?
> 
> Regards,
> Luben
> 
>>
>>> 2. Somehow make sure drm_sched_entity_destroy() does block until all
>>> jobs deployed through this entity were fetched from the schedulers
>>> pending list. Though, I'm pretty sure that this is not really desirable.
>>>
>>> 3. Just revert the change and let drivers implement tracking of GPU
>>> active times themselves.
>>>
>> Given that we are already pretty late in the release cycle and etnaviv
>> being the only driver so far making use of the scheduler elapsed time
>> tracking I think the right short term solution is to either move the
>> tracking into etnaviv or just revert the change for now. I'll have a
>> look at this.
>>
>> Regards,
>> Lucas
>>
>>> In the case of just reverting the change I'd propose to also set a jobs
>>> entity pointer to NULL  once the job was taken from the entity, such
>>> that in case of a future issue we fail where the actual issue resides
>>> and to make it more obvious that the field shouldn't be used anymore
>>> after the job was taken from the entity.
>>>
>>> I'm happy to implement the solution we agree on. However, it might also
>>> make sense to revert the change until we have a solution in place. I'm
>>> also happy to send a revert with a proper description of the problem.
>>> Please let me know what you think.
>>>
>>> - Danilo
>>>
>>
> 

