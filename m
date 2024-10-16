Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2259A03B0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 10:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E927510E6AA;
	Wed, 16 Oct 2024 08:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="wD71bpw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD5F10E6AA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 08:07:41 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-37d473c4bb6so4868391f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 01:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1729066059; x=1729670859;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0xg0An/0Rx0tpVemwhtjkpQa8ozQtKras4iQdBg2ObY=;
 b=wD71bpw+q/WQ/2M/1EpJ6eggBiN3s/vSlLhdULhHNs+Xym5mu7N80Kcrdo3L1JkE58
 +Wy7zRTRaTtsIT4iPpCEUXpDduQ+58YTj/DMQJ9ux5kj400zebSLYGGbS779i7qZVQuI
 brLaAiJnBautFx8gQpCx1sTsEv4bM4bi3GSOKa1xUQR1eu5kVUXSENP0Zv5aFWwBs412
 fRcMm/bAqXwLpRJjA+uZWd3DiU0yDinTtR3KKw9QIPeve+/1yK2xqlu9MJu5brKX+0pw
 P/nS5c9dZTp6VuHoV8ca0LVguXHjpWZ0Fqa1pZphte2mKCXSf/eHqTbqHVIxf2i1VNnu
 ASvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729066059; x=1729670859;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0xg0An/0Rx0tpVemwhtjkpQa8ozQtKras4iQdBg2ObY=;
 b=M7xZ2TXR+5znD7cHyrLb8CoohEddcyD+JtniZzlga7wWinZJx2pE6/CSpaSohBCN+l
 R6Y5/e7NaIB5uWw0Arb6XU2CB8dEipH7O+N/1rAfen60+JBDpMtK+09Iiao4xwydNNia
 q4fXwXoLMmG+RlXJk3GparJB5SCj8wilspd/WQ8dd/lnWny+W35eNYzVAz5eukHD2Hzn
 4MukQKkba3t9/4YGMB6wQ95rX4I8E+3Rsz3kPE8xYcEL/QuwmGXCY5PNbVm2xKxi3njd
 D52at5xkST6eX3bgOQmGRUbCgSDz6BV6kw+vZBa+2scQpaGMj/f62M099dD+5R1di9Tm
 bFdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+hKLKoDclxDUSrn2Y1ZTyoX0qJqdnnhswDjKfyl1udH+XO/yVyaHYoUOAkasAYWzb1HIX4eRj9uU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3Q9l72UNSd+ficNPDvguWhPN+TZMsCEB6TiV5jm2ca00vgiI/
 sZCfuy+ASLQN+pceo/bOeXv3gVL59oiri7L/sm2trAHl96diJ3589khVM+XZucs=
X-Google-Smtp-Source: AGHT+IEzGSd2MOvSOeImtL8xzdVl+OwLD6HLSyseFEZnuZzEYzFmU0ITW0l+WyT5JStCZfvLlndHvA==
X-Received: by 2002:a5d:5e0c:0:b0:37d:61aa:67de with SMTP id
 ffacd0b85a97d-37d61aa7145mr11578007f8f.42.1729066059113; 
 Wed, 16 Oct 2024 01:07:39 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fa87cdesm3634491f8f.44.2024.10.16.01.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 01:07:38 -0700 (PDT)
Message-ID: <54dd5ec4-3254-4d32-b6be-9a7b443d216b@ursulin.net>
Date: Wed, 16 Oct 2024 09:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] drm/drm_file: Add display of driver's internal
 memory size
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20241002234531.3113431-1-adrian.larumbe@collabora.com>
 <20241002234531.3113431-2-adrian.larumbe@collabora.com>
 <6657b080-f41e-4c95-8895-e474f1ca5d57@ursulin.net>
 <p72rfjerzsg4wsp6rgfcoo5fmlu77jmzdynosflj2hlos63pql@mnetv3t66wsc>
 <87a21c19-8fd2-492a-a620-243cd9c642dc@ursulin.net>
 <5h4vxk6hw7fkw4rebqprfdf3tmz7skdxfh6qgljcd4thxkpobu@jly67q62us4b>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <5h4vxk6hw7fkw4rebqprfdf3tmz7skdxfh6qgljcd4thxkpobu@jly67q62us4b>
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


On 15/10/2024 20:05, Adrián Larumbe wrote:
> Hi Tvrtko,
> 
> On 10.10.2024 10:50, Tvrtko Ursulin wrote:
>>
>> On 09/10/2024 23:55, Adrián Larumbe wrote:
>>> Hi Tvrtko,
>>>
>>> On 04.10.2024 14:41, Tvrtko Ursulin wrote:
>>>>
>>>> Hi Adrian,
>>>>
>>>> On 03/10/2024 00:45, Adrián Larumbe wrote:
>>>>> Some drivers must allocate a considerable amount of memory for bookkeeping
>>>>> structures and GPU's MCU-kernel shared communication regions. These are
>>>>> often created as a result of the invocation of the driver's ioctl()
>>>>> interface functions, so it is sensible to consider them as being owned by
>>>>> the render context associated with an open drm file.
>>>>>
>>>>> However, at the moment drm_show_memory_stats only traverses the UM-exposed
>>>>> drm objects for which a handle exists. Private driver objects and memory
>>>>> regions, though connected to a render context, are unaccounted for in their
>>>>> fdinfo numbers.
>>>>>
>>>>> Add a new drm_memory_stats 'internal' memory category.
>>>>>
>>>>> Because deciding what constitutes an 'internal' object and where to find
>>>>> these are driver-dependent, calculation of this size must be done through a
>>>>> driver-provided function pointer, which becomes the third argument of
>>>>> drm_show_memory_stats. Drivers which have no interest in exposing the size
>>>>> of internal memory objects can keep passing NULL for unaltered behaviour.
>>>>>
>>>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/drm_file.c              | 6 +++++-
>>>>>     drivers/gpu/drm/msm/msm_drv.c           | 2 +-
>>>>>     drivers/gpu/drm/panfrost/panfrost_drv.c | 2 +-
>>>>>     drivers/gpu/drm/v3d/v3d_drv.c           | 2 +-
>>>>>     include/drm/drm_file.h                  | 7 ++++++-
>>>>>     5 files changed, 14 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>>> index ad1dc638c83b..937471339c9a 100644
>>>>> --- a/drivers/gpu/drm/drm_file.c
>>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>>> @@ -856,6 +856,7 @@ void drm_print_memory_stats(struct drm_printer *p,
>>>>>     	print_size(p, "total", region, stats->private + stats->shared);
>>>>>     	print_size(p, "shared", region, stats->shared);
>>>>>     	print_size(p, "active", region, stats->active);
>>>>> +	print_size(p, "internal", region, stats->internal);
>>>>>     	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
>>>>>     		print_size(p, "resident", region, stats->resident);
>>>>> @@ -873,7 +874,7 @@ EXPORT_SYMBOL(drm_print_memory_stats);
>>>>>      * Helper to iterate over GEM objects with a handle allocated in the specified
>>>>>      * file.
>>>>>      */
>>>>> -void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>>>>> +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, internal_bos func)
>>>>>     {
>>>>>     	struct drm_gem_object *obj;
>>>>>     	struct drm_memory_stats status = {};
>>>>> @@ -919,6 +920,9 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>>>>>     	}
>>>>>     	spin_unlock(&file->table_lock);
>>>>> +	if (func)
>>>>> +		func(&status, file);
>>>>> +
>>>>>     	drm_print_memory_stats(p, &status, supported_status, "memory");
>>>>>     }
>>>>>     EXPORT_SYMBOL(drm_show_memory_stats);
>>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>>>>> index edbc1ab0fbc8..2b3feb79afc4 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>>>> @@ -880,7 +880,7 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>>>>>     	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
>>>>> -	drm_show_memory_stats(p, file);
>>>>> +	drm_show_memory_stats(p, file, NULL);
>>>>>     }
>>>>>     static const struct file_operations fops = {
>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>>> index 04d615df5259..aaa8602bf00d 100644
>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>>> @@ -609,7 +609,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>>>>>     	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
>>>>> -	drm_show_memory_stats(p, file);
>>>>> +	drm_show_memory_stats(p, file, NULL);
>>>>>     }
>>>>>     static const struct file_operations panfrost_drm_driver_fops = {
>>>>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
>>>>> index fb35c5c3f1a7..314e77c67972 100644
>>>>> --- a/drivers/gpu/drm/v3d/v3d_drv.c
>>>>> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
>>>>> @@ -195,7 +195,7 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>>>>>     			   v3d_queue_to_string(queue), jobs_completed);
>>>>>     	}
>>>>> -	drm_show_memory_stats(p, file);
>>>>> +	drm_show_memory_stats(p, file, NULL);
>>>>>     }
>>>>>     static const struct file_operations v3d_drm_fops = {
>>>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>>> index 8c0030c77308..661d00d5350e 100644
>>>>> --- a/include/drm/drm_file.h
>>>>> +++ b/include/drm/drm_file.h
>>>>> @@ -469,6 +469,7 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
>>>>>      * @resident: Total size of GEM objects backing pages
>>>>>      * @purgeable: Total size of GEM objects that can be purged (resident and not active)
>>>>>      * @active: Total size of GEM objects active on one or more engines
>>>>> + * @internal: Total size of GEM objects that aren't exposed to user space
>>>>>      *
>>>>>      * Used by drm_print_memory_stats()
>>>>>      */
>>>>> @@ -478,16 +479,20 @@ struct drm_memory_stats {
>>>>>     	u64 resident;
>>>>>     	u64 purgeable;
>>>>>     	u64 active;
>>>>> +	u64 internal;
>>>>
>>>> So equally as in the last round of discussion back in June, internal in my
>>>> mind still does not fit alongside the categories.
>>>>
>>>> Reason is that in some drivers, at least such as i915, "internal" can be:
>>>>
>>>> a) Backed by either system memory or device memory - so this does not provice
>>>> that visibility;
>>>>
>>>> b) They can also be resident or not, active or not, etc - so from that angle
>>>> it also does not fit.
>>>>
>>>> Do you lose anything if you add the internal objects into their respective
>>>> regions and under the existing categories? Like do you have an use case in
>>>> mind which needs to be able to distinguish between userspace and internal, or
>>>> the problem simply is internal are unaccounted for?
>>>
>>> The main use case we have in mind is exposing the size of driver buffer
>>> allocations that are triggered in respone to an ioctl(), and so linked to an
>>
>> Most of this and below is old and clear - but to this specific point - so you
>> do have an use case which specifically wants to know about the internal
>> allocations separately from the rest? Could you describe what it is?

What about this?

>>> open file. I gave a summary of what these could be in the patch description, but
>>> in Panthor's case all these allocations are done with drm shmem functions
>>> because it makes it easier to retrieve the sgtable that gives us their system
>>> memory layout so that we can more easily map them onto the MMU's address space
>>> for a Pantor VM. These BO's, though managed by the drm shmem API, are never
>>> added to the open file list of user-exposed drm objects but we would still like
>>> to tell UM how much memory they take up.
>>>
>>> In the case of Panthor, they all add into the resident tally because all these
>>> internal BO's are immediately pinned so that they can also be accessed by the
>>> HW, but it doesn't have to be so for other drivers which might also keep track
>>> of similar allocations.
>>>
>>> I think maybe naming that tag as 'internal' is a bit of a misnomer and I could
>>> pick one that more accurately represents its meaning? Something like 'file-internal'
>>> or else 'file-private'.
>>>
>>> Regarding a), I don't think where the allocations happen (system or device memory)
>>> is relevant in this case, just that the allocations are tied to an open file, but
>>> not exposed to UM through a DRM buffer object handle.
>>
>> On this last paragraph - right.. I possibly got confused on a). Which is why I
>> always say it is good to include example output at least in the cover letter,
>> if not the commit message.
>>
>> How would it look on this driver?
>>
>> drm-total-$what: ..
>> drm-resident-$what: ..
>> drm-internal-$what: ...
> 
> In the case of Panthor, it would look like this:
> 
> drm-driver:     panthor
> drm-client-id:  3
> drm-engine-panthor:     611046570346 ns
> drm-cycles-panthor:     1172733302061
> drm-maxfreq-panthor:    1000000000 Hz
> drm-curfreq-panthor:    1000000000 Hz
> drm-total-memory:       16480 KiB
> drm-shared-memory:      0
> drm-active-memory:      16200 KiB
> drm-internal-memory:    10396 KiB
> drm-resident-memory:    26876 KiB
> drm-purgeable-memory:   0
> 
> Then in Panfrost:
> 
> drm-driver:     panfrost
> drm-client-id:  6
> drm-engine-fragment:    481941638 ns
> drm-cycles-fragment:    60243117
> drm-maxfreq-fragment:   799999987 Hz
> drm-curfreq-fragment:   124999998 Hz
> drm-engine-vertex-tiler:        55546675 ns
> drm-cycles-vertex-tiler:        6943796
> drm-maxfreq-vertex-tiler:       799999987 Hz
> drm-curfreq-vertex-tiler:       124999998 Hz
> drm-total-memory:       138420 KiB
> drm-shared-memory:      7200 KiB
> drm-active-memory:      0
> drm-internal-memory:    0
> drm-resident-memory:    2196 KiB
> drm-purgeable-memory:   128 KiB
> 
> 
>> b) still stands though in that internal can be resident or not, purgeable or
>> not.. Which is why I would like to know about the use case.
> 
> This is true, DRM file-internal objects or memory allocations could fall
> into any of these categories, and adding their sizes to the right one would
> be the responsibility of the function pointer passed to drm_show_memory_stats(),
> because that decision would have to be made on a per-driver basis.

It could work like that yes.

I only wonder if it would creating too much of the usual DRM mess of 
common helpers and vfuncs, and vfuncs implemented via common helpers, 
which call vfuncs, implemented by common helpers.. mental stack overflow.

I also need to go back to one of the early threads on fdinfo to remind 
myself what was my counter proposal to the current design. In case it 
would be more clearly more elegant at this point.

But anyway, first the core question of whether we really need the 
internal separated out.

>> Also if you add drm-internal for any driver calling drm_print_memory_stats I
>> think you "break" at least i915. There internal objects are already accounted
>> in the existing categories. And printing out internal with zero would be very
>> misleading.
> 
> I wasn't aware of this. So i915 is already doing this kind of accounting for internal

Xe and amddgpu too, at least. So I guess the general principle when 
proposing extensions is to have a browse around all current users.

> memory allocations. In that case, maybe printing of the 'drm-internal-memory' could
> be done conditionally when it's greater than 0 to avoid 'breaking' existing drivers,
> or else renaming it to 'drm-file-memory' would be seen as less invasive?

Skipping the print maybe yeah. Or even better a supported status flag as 
is for resident and purgeable. But first the discussion on justifying 
internal as a separate thing.

> I'm asking this because if, at the end of the day, making this change part of the
> drm fdinfo core is going to clash with existing accounting in other DRM drivers, perhaps
> it'd be easier to keep it Panthor-specific and add that tag together with its meaning
> to Documentation/gpu/panfrost.rst.
> 
> I thought about this at first, but it also struck me as something other drivers might
> want to do in the future in a sort of unified way, since internal allocations happening
> in response to an ioctl() is a common thing.

I agree internal allocations should generally be accounted. Question is 
does it need to be separately.

Regards,

Tvrtko

> 
> Cheers,
> Adrian
> 
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Regards,
>>> Adrian
>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>     };
>>>>>     enum drm_gem_object_status;
>>>>> +typedef void (*internal_bos)(struct drm_memory_stats *status,
>>>>> +			     struct drm_file *file);
>>>>> +
>>>>>     void drm_print_memory_stats(struct drm_printer *p,
>>>>>     			    const struct drm_memory_stats *stats,
>>>>>     			    enum drm_gem_object_status supported_status,
>>>>>     			    const char *region);
>>>>> -void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
>>>>> +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, internal_bos func);
>>>>>     void drm_show_fdinfo(struct seq_file *m, struct file *f);
>>>>>     struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
> 
