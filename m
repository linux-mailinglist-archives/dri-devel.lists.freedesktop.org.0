Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEC77E9CCB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 14:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1547C10E092;
	Mon, 13 Nov 2023 13:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F73A10E092
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 13:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699881251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=apRsgsjUrkTMu7Ex/ouOXJ10+bWdueEuJWESAypcOEY=;
 b=iXvjRiw2G06YSqwD1fmD+TgNi+QcLxSOmgxcdrzGTM0s8D7QQQBIsfydriq6ll2vJmhTmU
 eCWNl2K0lwZTB8rvZgnbg9YvoQCTchp8urh/l0hOMDvVpjA75vD6NGYqwbDXGzLKVdRrVC
 VoiLlSZMhBSmbsKlPPjkOLw/hXm6rCI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-zPJojICbNNS_oRuP_6C6dw-1; Mon, 13 Nov 2023 08:14:10 -0500
X-MC-Unique: zPJojICbNNS_oRuP_6C6dw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9bf1047cb28so319016666b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 05:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699881249; x=1700486049;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=apRsgsjUrkTMu7Ex/ouOXJ10+bWdueEuJWESAypcOEY=;
 b=PlsfBNlhPLn4ZKGkIoJR3cDDfTqU9XSg1K27MgbO7W2MjrQo8pUjPTiMsoIWq57NET
 WBcS2/I2Fgkh1441/JFpUy+SmEN5OyWK+kYsPSG+MxRsjDl4nExZk8uxk/mPXtLY+8Qy
 fgF0Sg3TRqFQEiK6pAwfBlhcSa05G+pKvjBW2oZUteFLZUGqEnV+lWK3xktm7CL4sJlM
 QTz3GxwMiDHdRjh9n3JqFFFyWqyzI6kg6sC9T1ITrOYgv7yOPiwsfeYwYVP4JfZ7XNNx
 I34ykWFqGMdj9biOIFZ+X5Q3pdp+XSw4SQJzyzPtMK3+YfP+wg9cugvwJJ8CnT3Ag3HF
 BvPQ==
X-Gm-Message-State: AOJu0YytbMPvvV+Q/z65U0KRMBVpCnTicE5ThkO1iRz6cwjhoqMAShXF
 3pQh5dC336OHBk9igRnozg5jldTp1wkv/4DGc3A2U+VejLyKosEtOYkw1cCl4UrsBymEwdoQEGI
 sAVWb9YJR++JeIUwrEmNhfAWOyL5t
X-Received: by 2002:a17:906:40c5:b0:9e2:d087:86de with SMTP id
 a5-20020a17090640c500b009e2d08786demr4163683ejk.42.1699881249182; 
 Mon, 13 Nov 2023 05:14:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmjEqe4EBqb9oN66sVBtDI23BScatKihht2oGtIktFpEKFMstJcw5iPKx18Ni0psCt0zWV2g==
X-Received: by 2002:a17:906:40c5:b0:9e2:d087:86de with SMTP id
 a5-20020a17090640c500b009e2d08786demr4163664ejk.42.1699881248872; 
 Mon, 13 Nov 2023 05:14:08 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a1709060d9000b009be14e5cd54sm4047977eji.57.2023.11.13.05.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 05:14:08 -0800 (PST)
Message-ID: <4be75380-eefc-4808-9cfb-8e3f2448ab90@redhat.com>
Date: Mon, 13 Nov 2023 14:14:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: improve GPU scheduler documentation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@gmail.com, ltuikov89@gmail.com, dri-devel@lists.freedesktop.org,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexander.deucher@amd.com, "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20231113123832.120710-1-christian.koenig@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231113123832.120710-1-christian.koenig@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 11/13/23 13:38, Christian König wrote:
> Start to improve the scheduler document. Especially document the
> lifetime of each of the objects as well as the restrictions around
> DMA-fence handling and userspace compatibility.

Thanks a lot for submitting this - it's very much appreciated!

Before reviewing in detail, do you mind to re-structure this a little bit? Instead
of packing everything in an enumeration I'd suggest to have separate DOC paragraphs.

For instance:

- keep "Overview" to introduce the overall idea and basic structures of the component
- a paragraph for each of those basic structures (drm_gpu_scheduler, drm_sched_entity,
   drm_sched_fence) explaining their purpose and lifetime
- a paragraph about the pitfalls dealing with DMA fences
- a paragraph about the pitfalls of the driver callbacks (although this might highly
   intersect with the previous suggested one)

I feel like this would be much easier to read.

Besides that, which covers the conceptual side of things, I think we also need to
improve the documentation on what the scheduler implementation expects from drivers,
e.g. zero initialize structures, valid initialization parameters for typical use cases,
etc. However, that's for a separate patch.

- Danilo

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 126 ++++++++++++++++++++-----
>   1 file changed, 104 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 506371c42745..36a7c5dc852d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,28 +24,110 @@
>   /**
>    * DOC: Overview
>    *
> - * The GPU scheduler provides entities which allow userspace to push jobs
> - * into software queues which are then scheduled on a hardware run queue.
> - * The software queues have a priority among them. The scheduler selects the entities
> - * from the run queue using a FIFO. The scheduler provides dependency handling
> - * features among jobs. The driver is supposed to provide callback functions for
> - * backend operations to the scheduler like submitting a job to hardware run queue,
> - * returning the dependencies of a job etc.
> - *
> - * The organisation of the scheduler is the following:
> - *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different priorities
> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be scheduled on
> - *    the hardware.
> - *
> - * The jobs in a entity are always scheduled in the order that they were pushed.
> - *
> - * Note that once a job was taken from the entities queue and pushed to the
> - * hardware, i.e. the pending queue, the entity must not be referenced anymore
> - * through the jobs entity pointer.
> + * The GPU scheduler implements some logic to decide which command submission
> + * to push next to the hardware. Another major use case for the GPU scheduler
> + * is to enforce correct driver behavior around those command submission.
> + * Because of this it's also used by drivers which don't need the actual
> + * scheduling functionality.
> + *
> + * To fulfill this task the GPU scheduler uses of the following objects:
> + *
> + * 1. The job object which contains a bunch of dependencies in the form of
> + *    DMA-fence objects. Drivers can also implement an optional prepare_job
> + *    callback which returns additional dependencies as DMA-fence objects.
> + *    It's important to note that this callback must follow the DMA-fence rules,
> + *    so it can't easily allocate memory or grab locks under which memory is
> + *    allocated. Drivers should use this as base class for an object which
> + *    contains the necessary state to push the command submission to the
> + *    hardware.
> + *
> + *    The lifetime of the job object should at least be from pushing it into the
> + *    scheduler until the scheduler notes through the free callback that a job
> + *    isn't needed any more. Drivers can of course keep their job object alive
> + *    longer than that, but that's outside of the scope of the scheduler
> + *    component. Job initialization is split into two parts,
> + *    drm_sched_job_init() and drm_sched_job_arm(). It's important to note that
> + *    after arming a job drivers must follow the DMA-fence rules and can't
> + *    easily allocate memory or takes locks under which memory is allocated.
> + *
> + * 2. The entity object which is a container for jobs which should execute
> + *    sequentially. Drivers should create an entity for each individual context
> + *    they maintain for command submissions which can run in parallel.
> + *
> + *    The lifetime of the entity should *not* exceed the lifetime of the
> + *    userspace process it was created for and drivers should call the
> + *    drm_sched_entity_flush() function from their file_operations.flush
> + *    callback. Background is that for compatibility reasons with existing
> + *    userspace all results of a command submission should become visible
> + *    externally even after after a process exits. The only exception to that
> + *    is when the process is actively killed by a SIGKILL. In this case the
> + *    entity object makes sure that jobs are freed without running them while
> + *    still maintaining correct sequential order for signaling fences. So it's
> + *    possible that an entity object is not alive any more while jobs from it
> + *    are still running on the hardware.
> + *
> + * 3. The hardware fence object which is a DMA-fence provided by the driver as
> + *    result of running jobs. Drivers need to make sure that the normal
> + *    DMA-fence semantics are followed for this object. It's important to note
> + *    that the memory for this object can *not* be allocated in the run_job
> + *    callback since that would violate the requirements for the DMA-fence
> + *    implementation. The scheduler maintains a timeout handler which triggers
> + *    if this fence doesn't signal in a configurable time frame.
> + *
> + *    The lifetime of this object follows DMA-fence ref-counting rules, the
> + *    scheduler takes ownership of the reference returned by the driver and
> + *    drops it when it's not needed any more. Errors should also be signaled
> + *    through the hardware fence and are bubbled up back to the scheduler fence
> + *    and entity.
> + *
> + * 4. The scheduler fence object which encapsulates the whole time from pushing
> + *    the job into the scheduler until the hardware has finished processing it.
> + *    This is internally managed by the scheduler, but drivers can grab
> + *    additional reference to it after arming a job. The implementation
> + *    provides DMA-fence interfaces for signaling both scheduling of a command
> + *    submission as well as finishing of processing.
> + *
> + *    The lifetime of this object also follows normal DMA-fence ref-counting
> + *    rules. The finished fence is the one normally exposed outside of the
> + *    scheduler, but the driver can grab references to both the scheduled as
> + *    well as the finished fence when needed for pipe-lining optimizations.
> + *
> + * 5. The run queue object which is a container of entities for a certain
> + *    priority level. The lifetime of those objects are bound to the scheduler
> + *    lifetime.
> + *
> + *    This is internally managed by the scheduler and drivers shouldn't touch
> + *    them directly.
> + *
> + * 6. The scheduler object itself which does the actual work of selecting a job
> + *    and pushing it to the hardware. Both FIFO and RR selection algorithm are
> + *    supported, but FIFO is preferred for many use cases.
> + *
> + *    The lifetime of this object is managed by the driver using it. Before
> + *    destroying the scheduler the driver must ensure that all hardware
> + *    processing involving this scheduler object has finished by calling for
> + *    example disable_irq(). It is *not* sufficient to wait for the hardware
> + *    fence here since this doesn't guarantee that all callback processing has
> + *    finished.
> + *
> + * All callbacks the driver needs to implement are restricted by DMA-fence
> + * signaling rules to guarantee deadlock free forward progress. This especially
> + * means that for normal operation no memory can be allocated. All memory which
> + * is needed for pushing the job to the hardware must be allocated before
> + * arming a job. It also means that no locks can be taken under which memory
> + * might be allocated as well.
> + *
> + * Memory which is optional to allocate for device core dumping or debugging
> + * *must* be allocated with GFP_NOWAIT and appropriate error handling taking if
> + * that allocation fails. GFP_ATOMIC should only be used if absolutely
> + * necessary since dipping into the special atomic reserves is usually not
> + * justified for a GPU driver.
> + *
> + * The scheduler also used to provided functionality for re-submitting jobs
> + * with replacing the hardware fence during reset handling. This functionality
> + * is now marked as deprecated since this has proven to be fundamentally racy
> + * and not compatible with DMA-fence rules and shouldn't be used in any new
> + * code.
>    */
>   
>   #include <linux/kthread.h>

