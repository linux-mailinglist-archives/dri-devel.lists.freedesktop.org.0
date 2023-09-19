Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C5A7A6196
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 13:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6230F10E398;
	Tue, 19 Sep 2023 11:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C2E10E10F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695123873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x5pwn72HQRzsVFwPaRta5T6PBnbYzefmc+nMyv5CIgg=;
 b=L8e75JJhOpq65AT6AgB3FlFgbius5H2VrY3Kt/7lWOsrkk8HVCafvVjyEX9ESmS4/0iezu
 mvXAA0niANQNLEhUWxQNxmDvmXTzvPg7nJus2FADc6k3DTi3QqZPifgXrjLlg6Uztb5P0l
 Zqh+xPuN2tv48BtioOSZtxclg/aT64Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-_PETTuXUO0efeLYhFig6kg-1; Tue, 19 Sep 2023 07:44:32 -0400
X-MC-Unique: _PETTuXUO0efeLYhFig6kg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94f7a2b21fdso404922266b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 04:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695123871; x=1695728671;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x5pwn72HQRzsVFwPaRta5T6PBnbYzefmc+nMyv5CIgg=;
 b=homLOiB28vvWTQXPvQc5N8IwMzn87limOdZP701kZZznzlHus0ASH5FUawKXju6suU
 RDCRAwwcWSl7AFzUn03WYfjWm5CbItxeURI70hsTSmCleAN6Qbu0gc0YnzTof/SuD0N7
 XWM2fLyfwpi/HB0HjBUmIbKYR7qSWlZ84yx7WkCU3qJAEgJqZnpkcHPI32JITMwM1jdj
 qb4+dqn/2d0QrYJvSrw9WYmR+QxuF+bfC0Iv/k6y888UmJITqENh1F0hwJWtgYRe/RaP
 eedj9bWKpA0K31NbH4hlV6lumCG9hqk4BkkXSf2kgiXPM9OeuMp0LMCTeB2UBoOKrYY/
 XXFg==
X-Gm-Message-State: AOJu0Yyqp4QAoJUUQUNR9hchZi7XPqgF6teaC/dsW9rxN1d7iple+Mte
 ov5wy2vbFxxw4bsdiSR83pAHsG4D/HWleaeJn1Fj6ONN5v/JOmLcqgtauGvn/99e6nAeeiZ6YnM
 0kiFO7WiMPDJ7MK92Qcl/2k+f6M/Y
X-Received: by 2002:a17:907:2ced:b0:9a9:e858:e72f with SMTP id
 hz13-20020a1709072ced00b009a9e858e72fmr10380678ejc.45.1695123871409; 
 Tue, 19 Sep 2023 04:44:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELPiuH2JGuaH0W0ls9v0iJdmS/GLmnx2FjMcFju9VG6E3ysZfi7X2AMaZX4S8exsxPeTdTWA==
X-Received: by 2002:a17:907:2ced:b0:9a9:e858:e72f with SMTP id
 hz13-20020a1709072ced00b009a9e858e72fmr10380651ejc.45.1695123871061; 
 Tue, 19 Sep 2023 04:44:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 bj26-20020a170906b05a00b00997e99a662bsm7572235ejb.20.2023.09.19.04.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 04:44:30 -0700 (PDT)
Message-ID: <7739a88e-28e9-27fb-8d2a-4f294fdfe672@redhat.com>
Date: Tue, 19 Sep 2023 13:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 00/10] DRM scheduler changes for Xe
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230919050155.2647172-1-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, mcanal@igalia.com,
 Liviu.Dudau@arm.com, luben.tuikov@amd.com, lina@asahilina.net,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

On 9/19/23 07:01, Matthew Brost wrote:
> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> have been asked to merge our common DRM scheduler patches first.
> 
> This a continuation of a RFC [3] with all comments addressed, ready for
> a full review, and hopefully in state which can merged in the near
> future. More details of this series can found in the cover letter of the
> RFC [3].
> 
> These changes have been tested with the Xe driver.
> 
> v2:
>   - Break run job, free job, and process message in own work items
>   - This might break other drivers as run job and free job now can run in
>     parallel, can fix up if needed
> 
> v3:
>   - Include missing patch 'drm/sched: Add drm_sched_submit_* helpers'
>   - Fix issue with setting timestamp to early
>   - Don't dequeue jobs for single entity after calling entity fini
>   - Flush pending jobs on entity fini
>   - Add documentation for entity teardown
>   - Add Matthew Brost to maintainers of DRM scheduler
> 
> v4:
>   - Drop message interface
>   - Drop 'Flush pending jobs on entity fini'
>   - Drop 'Add documentation for entity teardown'
>   - Address all feedback

There is some feedback from V3 that doesn't seem to be addressed yet.

(1) Document tear down of struct drm_gpu_scheduler. [1]
(2) Implement helpers to tear down struct drm_gpu_scheduler. [2]
(3) Document implications of using a workqueue in terms of free_job() being
     or not being part of the fence signaling path respectively. [3]

I think at least (1) and (3) should be part of this series. I think (2) could
also happen subsequently. Christian's idea [2] how to address this is quite
interesting, but might exceed the scope of this series.

I will try to rebase my Nouveau changes onto your V4 tomorrow for a quick test.

- Danilo

[1] https://lore.kernel.org/all/20230912021615.2086698-1-matthew.brost@intel.com/T/#m2e8c1c1e68e8127d5dd62509b5e424a12217300b
[2] https://lore.kernel.org/all/20230912021615.2086698-1-matthew.brost@intel.com/T/#m16a0d6fa2e617383776515af45d3c6b9db543d47
[3] https://lore.kernel.org/all/20230912021615.2086698-1-matthew.brost@intel.com/T/#m807ff95284089fdb51985f1c187666772314bd8a

> 
> Matt
> 
> Matthew Brost (10):
>    drm/sched: Add drm_sched_submit_* helpers
>    drm/sched: Convert drm scheduler to use a work queue rather than
>      kthread
>    drm/sched: Move schedule policy to scheduler
>    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>    drm/sched: Split free_job into own work item
>    drm/sched: Add drm_sched_start_timeout_unlocked helper
>    drm/sched: Start submission before TDR in drm_sched_start
>    drm/sched: Submit job before starting TDR
>    drm/sched: Add helper to queue TDR immediately for current and future
>      jobs
>    drm/sched: Update maintainers of GPU scheduler
> 
>   MAINTAINERS                                   |   1 +
>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   5 +-
>   drivers/gpu/drm/lima/lima_sched.c             |   5 +-
>   drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c          |   5 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.c       |   5 +-
>   drivers/gpu/drm/panfrost/panfrost_job.c       |   5 +-
>   drivers/gpu/drm/scheduler/sched_entity.c      |  85 ++-
>   drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>   drivers/gpu/drm/scheduler/sched_main.c        | 491 ++++++++++++------
>   drivers/gpu/drm/v3d/v3d_sched.c               |  25 +-
>   include/drm/gpu_scheduler.h                   |  48 +-
>   15 files changed, 495 insertions(+), 220 deletions(-)
> 

