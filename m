Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543989260B0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 14:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574B410E7D7;
	Wed,  3 Jul 2024 12:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="OkOMUVNi";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="Vl7/Lnn9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bunu.damsy.net (bunu.damsy.net [51.159.160.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A635C10E7D7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 12:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202404r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1720010521;
 bh=jm2YhROIdm7pwBWdhWAlkDX
 aitJl69ARjp6cpblP7ow=; b=OkOMUVNio5TjRXaOQIzbmWpd+3sn+BxyXAzEpr3zuOrfZmsRAm
 nKoeyzT8heukL2aKvijNCUqUK1O12zqArpq7Y+K9RwArSuDpjAaKOPmLGjuI7Td1+WbS555+aWm
 1rvxWmWFbtx7f4+gsflYJTSeyNsRyGsvJ4D+gbP1NZfpTDL5ntoptgl8wFv2W0dq78sHDmWSdAG
 M3ZE62W8NNTh5a06MMs7oIXZ/oXIb1x1DNAOpB/cHDiXtr1BlunCA37nFHj1ljSw3J4T08wrPU0
 z9e8yv29lTtSPf2oTl3pmyWIMj6T7HxqX0Z0kGPIpVUvCKst+J57GVKapt2KKf8Pddg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202404e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1720010521; bh=jm2YhROIdm7pwBWdhWAlkDX
 aitJl69ARjp6cpblP7ow=; b=Vl7/Lnn9cGv0oXd1VGZVxSfzudoeTx1BH3wl6w5Zy2sTJyZq6U
 75COtbJwJymQXx+Dgxalpd+I8lpNzdk00WDQ==;
Message-ID: <74020d3e-fa0a-45a7-89f7-f8ecac172ef6@damsy.net>
Date: Wed, 3 Jul 2024 14:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/doc: document some tracepoints as uAPI
To: Lucas Stach <l.stach@pengutronix.de>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
 <20240614081657.408397-5-pierre-eric.pelloux-prayer@amd.com>
 <3f4151d691ddca0fd621a88e60e5228627c52cfe.camel@pengutronix.de>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <3f4151d691ddca0fd621a88e60e5228627c52cfe.camel@pengutronix.de>
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



Le 03/07/2024 à 12:46, Lucas Stach a écrit :
> Am Freitag, dem 14.06.2024 um 10:16 +0200 schrieb Pierre-Eric Pelloux-
> Prayer:
>> This commit adds a document section in drm-uapi.rst about tracepoints,
>> and mark the events gpu_scheduler_trace.h as stable uAPI.
>>
>> The goal is to explicitly state that tools can rely on the fields,
>> formats and semantics of these events.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   Documentation/gpu/drm-uapi.rst                | 19 ++++++++++++++++
>>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 22 +++++++++++++++++++
>>   2 files changed, 41 insertions(+)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 370d820be248..78496793a8f0 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -570,3 +570,22 @@ dma-buf interoperability
>>   
>>   Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
>>   information on how dma-buf is integrated and exposed within DRM.
>> +
>> +
>> +Trace events
>> +============
>> +
>> +See Documentation/trace/tracepoints.rst for the tracepoints documentation.
>> +In the drm subsystem, some events are considered stable uAPI to avoid
>> +breaking tools (eg: gpuvis, umr) relying on them. Stable means that fields
>> +cannot be removed, nor their formatting updated. Adding new fields is
>> +possible, under the normal uAPI requirements.
> 
> What are those "normal uAPI requirements" in this context? Aside from
> not being able to remove or change any fields?

The ones from 
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

For the trace events, the sentence "patches must be reviewed and ready 
for merging into a suitable and canonical upstream project" could be 
read as "gpuvis patches must be reviewed and ready for merging".

Thanks,
Pierre-Eric



> 
> Regards,
> Lucas
> 
>> +
>> +Stable uAPI events
>> +------------------
>> +
>> +From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +.. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +   :doc: uAPI trace events
>> \ No newline at end of file
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index 0abcad26839c..63113803cdd5 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -33,6 +33,28 @@
>>   #define TRACE_SYSTEM gpu_scheduler
>>   #define TRACE_INCLUDE_FILE gpu_scheduler_trace
>>   
>> +
>> +/**
>> + * DOC: uAPI trace events
>> + *
>> + * ``drm_sched_job``, ``drm_run_job``, ``drm_sched_process_job``,
>> + * and ``drm_sched_job_wait_dep`` are considered stable uAPI.
>> + *
>> + * Common trace events attributes:
>> + *
>> + * * ``id``    - this is &drm_sched_job->id. It uniquely idenfies a job
>> + *   inside a &struct drm_gpu_scheduler.
>> + *
>> + * * ``dev``   - the dev_name() of the device running the job.
>> + *
>> + * * ``ring``  - the hardware ring running the job. Together with ``dev`` it
>> + *   uniquely identifies where the job is going to be executed.
>> + *
>> + * * ``fence`` - the &dma_fence.context and the &dma_fence.seqno of
>> + *   &drm_sched_fence.finished
>> + *
>> + */
>> +
>>   #ifndef __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
>>   #define __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
>>   /* Similar to trace_print_array_seq but for fences. */
