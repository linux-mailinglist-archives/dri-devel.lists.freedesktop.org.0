Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938A38BF86A
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 10:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C84C10F9EE;
	Wed,  8 May 2024 08:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="E/C8TxeQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B9610F9EE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 08:23:21 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2e1fa824504so59043461fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 01:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1715156599; x=1715761399;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a4jlZPiignaM1A5meKpD4ZV2mCZM6u+KaT4mTwYwgAQ=;
 b=E/C8TxeQ2sg37+i+04vvDX0xlG4E7y6FurJhhS8oP2PqpuCaQr7ANFzgSLOj6PpHAy
 kogLo0t507rlyrmneeGRw2CI3iWGXjnHV79248d5x+mFs5ooSvlJiuyjTl+eKIjkcIWf
 Xje3ClJ85IPyn55GLJ4Nq003NFLzw3O25sEhuoCB5FZjbfjMEYVI91ijfvWifRbIVyhq
 ddtYTJwtotvwcrRpOluvNTffl4Hv0IEPQlPrTRm09GxQZ2KZ1fu47YgKAqXDMBW0CCgS
 t+xhWetPNIMn0PChAzdlkSA4PKaDOY4rto9EwpwH8O46GHmSqU0W3JOvI6cBV4Y5IOvF
 OTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715156599; x=1715761399;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a4jlZPiignaM1A5meKpD4ZV2mCZM6u+KaT4mTwYwgAQ=;
 b=r1TRzCvPRVYMSA1PZboDzV9lSqyoc0fFILjnsCUHImDK7wXL65x0v61i3vWirZtQby
 ifIQe/cqRoYQpFHm5vWmHKdP9C+gePcTwcKC5n0x3bndHPlJmwicAidgjxkd2M0e1X61
 CKJKcOfzVWUgqK1yu85+VZbk1DPivImEbIntsF7n/tzL5Wt2tMWXyKaDPhsKklwbwH2i
 fUUyG3wwQwIVimYMQPwryvNkv2YCFxIqPz/jUHNomSbKIXIZBHvsWDoq29VmEMVfPXsg
 PpUhvnFZib68mHUHu0OSDU6vbzfWO0BW0ofy5QtYfZXFPzKT7T0wvkGBXNSjBtQCqR0a
 kDHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB/R17Z9esV4c/rTjcUrrE6QqcbyabWC3367sMnVbFaTf8PObV0EYmbCeQaswjFuSsEYXRJopJD/HdEibOKZb/sktj4XPhCAV+2dGxc7lG
X-Gm-Message-State: AOJu0YyfvpH1wxgnZf886LbJpkUju+7WOuGs0XyVoS76MF67RghXQHIc
 NGKed51pvqw1YMVjwYyZsGYXdrPjEmUlVvoMcg6UMJyADoD+dU1petFvtw5wXpo=
X-Google-Smtp-Source: AGHT+IH7LRlqHyzspgvr5H7RdH4Jf3rqycB1J94U5s+OTvkDsbCjoGNOL1kbKg74tttXuR09WdBqRQ==
X-Received: by 2002:a2e:9496:0:b0:2dd:bd92:63a with SMTP id
 38308e7fff4ca-2e4476ad0a7mr12210051fa.34.1715156599133; 
 Wed, 08 May 2024 01:23:19 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f42e74625sm35218265e9.0.2024.05.08.01.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 01:23:18 -0700 (PDT)
Message-ID: <88d6eeee-fa6f-4e5e-9304-22df8fb0f63c@ursulin.net>
Date: Wed, 8 May 2024 09:23:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/xe/client: Print runtime to fdinfo
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
 <20240423235652.1959945-7-lucas.demarchi@intel.com>
 <ed28cb4e-a417-4255-b034-778dbfdaf6ec@ursulin.net>
 <xwp77yi7y3e3f6eyqf3qqeawsv3nh4db4vwmok3pccdddnimce@n7rts73arupp>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <xwp77yi7y3e3f6eyqf3qqeawsv3nh4db4vwmok3pccdddnimce@n7rts73arupp>
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


On 07/05/2024 22:35, Lucas De Marchi wrote:
> On Fri, Apr 26, 2024 at 11:47:37AM GMT, Tvrtko Ursulin wrote:
>>
>> On 24/04/2024 00:56, Lucas De Marchi wrote:
>>> Print the accumulated runtime for client when printing fdinfo.
>>> Each time a query is done it first does 2 things:
>>>
>>> 1) loop through all the exec queues for the current client and
>>>    accumulate the runtime, per engine class. CTX_TIMESTAMP is used for
>>>    that, being read from the context image.
>>>
>>> 2) Read a "GPU timestamp" that can be used for considering "how much GPU
>>>    time has passed" and that has the same unit/refclock as the one
>>>    recording the runtime. RING_TIMESTAMP is used for that via MMIO.
>>>
>>> Since for all current platforms RING_TIMESTAMP follows the same
>>> refclock, just read it once, using any first engine.
>>>
>>> This is exported to userspace as 2 numbers in fdinfo:
>>>
>>>     drm-cycles-<class>: <RUNTIME>
>>>     drm-total-cycles-<class>: <TIMESTAMP>
>>>
>>> Userspace is expected to collect at least 2 samples, which allows to
>>> know the client engine busyness as per:
>>>
>>>             RUNTIME1 - RUNTIME0
>>>     busyness = ---------------------
>>>               T1 - T0
>>>
>>> Another thing to point out is that it's expected that userspace will
>>> read any 2 samples every few seconds.  Given the update frequency of the
>>> counters involved and that CTX_TIMESTAMP is 32-bits, the counter for
>>> each exec_queue can wrap around (assuming 100% utilization) after ~200s.
>>> The wraparound is not perceived by userspace since it's just accumulated
>>> for all the exec_queues in a 64-bit counter), but the measurement will
>>> not be accurate if the samples are too far apart.
>>>
>>> This could be mitigated by adding a workqueue to accumulate the counters
>>> every so often, but it's additional complexity for something that is
>>> done already by userspace every few seconds in tools like gputop (from
>>> igt), htop, nvtop, etc with none of them really defaulting to 1 sample
>>> per minute or more.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  Documentation/gpu/drm-usage-stats.rst       |  16 ++-
>>>  Documentation/gpu/xe/index.rst              |   1 +
>>>  Documentation/gpu/xe/xe-drm-usage-stats.rst |  10 ++
>>>  drivers/gpu/drm/xe/xe_drm_client.c          | 138 +++++++++++++++++++-
>>>  4 files changed, 162 insertions(+), 3 deletions(-)
>>>  create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst
>>>
>>> diff --git a/Documentation/gpu/drm-usage-stats.rst 
>>> b/Documentation/gpu/drm-usage-stats.rst
>>> index 6dc299343b48..421766289b78 100644
>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>> @@ -112,6 +112,17 @@ larger value within a reasonable period. Upon 
>>> observing a value lower than what
>>>  was previously read, userspace is expected to stay with that larger 
>>> previous
>>>  value until a monotonic update is seen.
>>> +- drm-total-cycles-<keystr>: <uint>
>>> +
>>> +Engine identifier string must be the same as the one specified in the
>>> +drm-cycles-<keystr> tag and shall contain the total number cycles 
>>> for the given
>>> +engine.
>>> +
>>> +This is a timestamp in GPU unspecified unit that matches the update 
>>> rate
>>> +of drm-cycles-<keystr>. For drivers that implement this interface, 
>>> the engine
>>> +utilization can be calculated entirely on the GPU clock domain, without
>>> +considering the CPU sleep time between 2 samples.
>>
>> Two opens.
>>
>> 1)
>> Do we need to explicity document that drm-total-cycles and drm-maxfreq 
>> are mutually exclusive?
> 
> so userspace has a fallback mechanism to calculate utilization depending
> on what keys are available?

No, to document all three at once do not make sense. Or at least are not 
expected. Or you envisage someone might legitimately emit all three? I 
don't see what would be the semantics. When we have cycles+maxfreq the 
latter is in Hz. And when we have cycles+total then it is unitless. All 
three?

>> 2)
>> Should drm-total-cycles for now be documents as driver specific?
> 
> you mean to call it xe-total-cycles?

Yes but it is not an ask, just an open.

>> I have added some more poeple in the cc who were involved with driver 
>> fdinfo implementations if they will have an opinion.
>>
>> I would say potentially yes, and promote it to common if more than one 
>> driver would use it.
>>
>> For instance I see panfrost has the driver specific drm-curfreq 
>> (although isn't documenting it fully in panfrost.rst). And I have to 
>> say it is somewhat questionable to expose the current frequency per 
>> fdinfo per engine but not my call.
> 
> aren't all of Documentation/gpu/drm-usage-stats.rst optional that
> driver may or may not implement? When you say driver-specific I'd think
> more of the ones not using <drm> as prefix as e.g. amd-*.
> 
> I think drm-cycles + drm-total-cycles is just an alternative
> implementation for engine utilization. Like drm-cycles + drm-maxfreq
> already is an alternative to drm-engine and is not implemented by e.g.
> amdgpu/i915.
> 
> I will submit a new version of the entire patch series to get the ball
> rolling, but let's keep this open for now.
> 
> <...>
> 
>>> +static void show_runtime(struct drm_printer *p, struct drm_file *file)
>>> +{
>>> +    struct xe_file *xef = file->driver_priv;
>>> +    struct xe_device *xe = xef->xe;
>>> +    struct xe_gt *gt;
>>> +    struct xe_hw_engine *hwe;
>>> +    struct xe_exec_queue *q;
>>> +    unsigned long i, id_hwe, id_gt, capacity[XE_ENGINE_CLASS_MAX] = 
>>> { };
>>> +    u64 gpu_timestamp, engine_mask = 0;
>>> +    bool gpu_stamp = false;
>>> +
>>> +    xe_pm_runtime_get(xe);
>>> +
>>> +    /* Accumulate all the exec queues from this client */
>>> +    mutex_lock(&xef->exec_queue.lock);
>>> +    xa_for_each(&xef->exec_queue.xa, i, q)
>>> +        xe_exec_queue_update_runtime(q);
>>> +    mutex_unlock(&xef->exec_queue.lock);
>>> +
>>> +
>>> +    /* Calculate capacity of each engine class */
>>> +    BUILD_BUG_ON(ARRAY_SIZE(class_to_mask) != XE_ENGINE_CLASS_MAX);
>>> +    for_each_gt(gt, xe, id_gt)
>>> +        engine_mask |= gt->info.engine_mask;
>>> +    for (i = 0; i < XE_ENGINE_CLASS_MAX; i++)
>>> +        capacity[i] = hweight64(engine_mask & class_to_mask[i]);
>>
>> FWIW the above two loops are static so could store capacity in struct 
>> xe_device.
> 
> yes, but just creating a cache in xe of something derived from gt is not
> something to consider lightly. Particularly considering the small number
> of xe->info.gt_count we have. For something that runs only when someone
> cat the fdinfo, this doesn't seem terrible.
> 
>>
>>> +
>>> +    /*
>>> +     * Iterate over all engines, printing the accumulated
>>> +     * runtime for this client, per engine class
>>> +     */
>>> +    for_each_gt(gt, xe, id_gt) {
>>> +        xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>> +        for_each_hw_engine(hwe, gt, id_hwe) {
>>> +            const char *class_name;
>>> +
>>> +            if (!capacity[hwe->class])
>>> +                continue;
>>> +
>>> +            /*
>>> +             * Use any (first) engine to have a timestamp to be used 
>>> every
>>> +             * time
>>> +             */
>>> +            if (!gpu_stamp) {
>>> +                gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>> +                gpu_stamp = true;
>>> +            }
>>> +
>>> +            class_name = xe_hw_engine_class_to_str(hwe->class);
>>> +
>>> +            drm_printf(p, "drm-cycles-%s:\t%llu\n",
>>> +                   class_name, xef->runtime[hwe->class]);
>>> +            drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>>> +                   class_name, gpu_timestamp);
>>> +
>>> +            if (capacity[hwe->class] > 1)
>>> +                drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>>> +                       class_name, capacity[hwe->class]);
>>> +
>>> +            /* engine class already handled, skip next iterations */
>>> +            capacity[hwe->class] = 0;
>>> +        }
>>> +        xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>> +    }
>>
>> More FWIW and AFAICT, could just walk the "list" of classes instead of 
> 
> xe_force_wake_get() is per gt, so the alternative would be... loop
> through the gts to get all forcewakes, loop through all engine classes, 
> loop
> again through all gts to put the forcewake. And we also need to consider
> that an engine class may not be available in all GTs... example:
> vcs/vecs in MTL and later, so we need to track it globally across GTs
> anyway.

Forcewake is only needed once for the gpu_timestamp, no? At least I 
don't see any other potential hardware access in the loop. Hence I 
thought if you could have a known engine to get the timestamp outside 
the loop, you could then run a flat loop (over classes) avoiding the per 
gt fw dance. Your choice ofc.

Regards,

Tvrtko

> 
>> the nested loop with skipping already visited classes. Assuming in xe 
>> there is an easy way to get a known present engine for the 
>> gpu_timestamp it would be flatter and less code.
> 
> from the device we can get either tile or gt. To work with the
> hw_engines we have to look inside the gt.
> 
> Lucas De Marchi
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +
>>> +    xe_pm_runtime_get(xe);
>>> +}
>>> +
>>>  /**
>>>   * xe_drm_client_fdinfo() - Callback for fdinfo interface
>>>   * @p: The drm_printer ptr
>>> @@ -192,5 +327,6 @@ static void show_meminfo(struct drm_printer *p, 
>>> struct drm_file *file)
>>>  void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>>>  {
>>>      show_meminfo(p, file);
>>> +    show_runtime(p, file);
>>>  }
>>>  #endif
