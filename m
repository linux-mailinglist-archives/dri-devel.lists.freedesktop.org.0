Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E10192D354
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 15:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AA710E7CD;
	Wed, 10 Jul 2024 13:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="kIB6/7nr";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="I8IvBRhv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bunu.damsy.net (bunu.damsy.net [51.159.160.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CEE10E7CA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 13:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202404r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1720619183;
 bh=iDuB0IZBC7W3G/b2B2gsPMP
 ny0HVh947/T6AQZtB9Q0=; b=kIB6/7nrMHLjC6I45gYTgPHMAFxQNiYyFtn1g+5Sf3/Guhl2dl
 fzqf9aZs+pDMBigx85eQV7Hwtc5OEUEVj8zrZg4uM1XlK49LzdkE0MNe6Vqw/Lt+GsgBjlXWNS6
 yR/FDKsGfjkrXeqH46aIAGTlr0v90bSTVCyZoEkiymWG1Kyg09PmM0yc0qW8dAsIPprWcamGu+F
 6QjC7LIzeG/e2gqjL8QlwUwPIIV4+I5JT+uNJBjdL5SrKySA9/iN0UaBppfeVUoVKOubCSVeN5V
 AcwwDTGlQLDpX+zn9y2AwGgGlBKv88XXuIDc7p1etNEsNrIbVhEeJowYv1zOgWaalUw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202404e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1720619183; bh=iDuB0IZBC7W3G/b2B2gsPMP
 ny0HVh947/T6AQZtB9Q0=; b=I8IvBRhvjVKGZjuz8XlSSfe3WZT30mQBRB+y63zjN1njMmScj9
 6DmH0F0cz8TeaQpdFwkI1JzR6NtjKLP6BCCQ==;
Message-ID: <9248ae41-e6c7-4fe5-819e-daaa7e809e7b@damsy.net>
Date: Wed, 10 Jul 2024 15:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/doc: document some tracepoints as uAPI
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
 <20240614081657.408397-5-pierre-eric.pelloux-prayer@amd.com>
 <d509317e-3b85-4ce5-95a5-081697d7253f@igalia.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <d509317e-3b85-4ce5-95a5-081697d7253f@igalia.com>
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

Hi Maíra,

Le 03/07/2024 à 17:41, Maíra Canal a écrit :
> Hi Pierre,
> 
> On 6/14/24 05:16, Pierre-Eric Pelloux-Prayer wrote:
>> This commit adds a document section in drm-uapi.rst about tracepoints,
>> and mark the events gpu_scheduler_trace.h as stable uAPI.
>>
>> The goal is to explicitly state that tools can rely on the fields,
>> formats and semantics of these events.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer 
>> <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   Documentation/gpu/drm-uapi.rst                | 19 ++++++++++++++++
>>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 22 +++++++++++++++++++
>>   2 files changed, 41 insertions(+)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst 
>> b/Documentation/gpu/drm-uapi.rst
>> index 370d820be248..78496793a8f0 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -570,3 +570,22 @@ dma-buf interoperability
>>   Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
>>   information on how dma-buf is integrated and exposed within DRM.
>> +
>> +
>> +Trace events
>> +============
>> +
>> +See Documentation/trace/tracepoints.rst for the tracepoints 
>> documentation.
> 
> I would write it:
> 
> "See Documentation/trace/tracepoints.rst for information about using
> Linux Kernel Tracepoints."
> 
>> +In the drm subsystem, some events are considered stable uAPI to avoid
> 
> Super small nit: s/drm/DRM
> 
>> +breaking tools (eg: gpuvis, umr) relying on them. Stable means that 
>> fields
> 
> Super small nit:
> 
> 1. s/eg:/e.g.:
> 2. s/gpuvis/GPUVis (maybe a URL to it?)
> 3. Maybe a URL to umr?
> 
> 
>> +cannot be removed, nor their formatting updated. Adding new fields is
>> +possible, under the normal uAPI requirements.
>> +
>> +Stable uAPI events
>> +------------------
>> +
>> +From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Super small nit: from the rest of the file, I see that a title was never
> needed. Do we need it here?
> 
>> +
>> +.. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +   :doc: uAPI trace events
>> \ No newline at end of file
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h 
>> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index 0abcad26839c..63113803cdd5 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -33,6 +33,28 @@
>>   #define TRACE_SYSTEM gpu_scheduler
>>   #define TRACE_INCLUDE_FILE gpu_scheduler_trace
>> +
>> +/**
>> + * DOC: uAPI trace events
>> + *
>> + * ``drm_sched_job``, ``drm_run_job``, ``drm_sched_process_job``,
>> + * and ``drm_sched_job_wait_dep`` are considered stable uAPI.
> 
> Super small nit again, but I believe we should format function names
> with ``foo()``, if I understood kerneldoc documentation correctly.
> 
> Apart from all those nits, I completely agree with Lucas, it is great to
> see this improvement.
> 
> Acked-by: Maíra Canal <mcanal@igalia.com>


Thanks a lot for the feedback, I'll integrate it in v6.

Regards,
Pierre-Eric

> 
> Best Regards,
> - Maíra
> 
>> + *
>> + * Common trace events attributes:
>> + *
>> + * * ``id``    - this is &drm_sched_job->id. It uniquely idenfies a job
>> + *   inside a &struct drm_gpu_scheduler.
>> + *
>> + * * ``dev``   - the dev_name() of the device running the job.
>> + *
>> + * * ``ring``  - the hardware ring running the job. Together with 
>> ``dev`` it
>> + *   uniquely identifies where the job is going to be executed.
>> + *
>> + * * ``fence`` - the &dma_fence.context and the &dma_fence.seqno of
>> + *   &drm_sched_fence.finished
>> + *
>> + */
>> +
>>   #ifndef __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
>>   #define __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
>>   /* Similar to trace_print_array_seq but for fences. */
