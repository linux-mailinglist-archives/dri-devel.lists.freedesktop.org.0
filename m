Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6BE7C6287
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 04:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED4710E3CE;
	Thu, 12 Oct 2023 02:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F10F10E3C5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697076150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWHGrZD0JBBe3c9P3AuEujHxhmDUTF21R+mIWfAE9D4=;
 b=MxlgxgLaIK3JXFIfTc4uzikY5TLsYGnLszPfDsP7PCN3rmaSqOa4oU6L4PsU6fpSFe/qVj
 nx5m/R3jg+rFh0cskiPThgdmOY+mhgpxErbgWcZxwrXf/2gNK/ZOpB8XciJ0xSTJW4jM8r
 2t1g3lNcZHu5rkppjaQYnaMrNpn0ojQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-ziSEDbGEO-KzAJaPXX9HEg-1; Wed, 11 Oct 2023 22:02:19 -0400
X-MC-Unique: ziSEDbGEO-KzAJaPXX9HEg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9b65d7079faso24402566b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 19:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697076136; x=1697680936;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWHGrZD0JBBe3c9P3AuEujHxhmDUTF21R+mIWfAE9D4=;
 b=WvQU7IJAPolGmZoFVb6AsYORQWNNuJfcaIxFFUnV9EQGjqQzRzXrKSg99GJ9mN6A6w
 Oty8svO0mY6mppHwda7BwmWPRKGU6Bw7KPdsQVvbxdd7u5QoRJp7BywcvoUXCMe7fwqo
 Hu98ZaokwGXh9H7L+Ff+Ky1/APKqYk4VqmIZQsYii84mimfRYJstB/VJMt+5UCH0Gan8
 uFD7aRkIwPwftprloTo8wCpq9ng3E92q172MkVnli5rhJlVJHBR2jqdINf3hhT9TsUpr
 r76ScW7CmKdBMkkVhTRF9WhfUETcY1sfN6BUfKw53l06cEarYkRFcQa39gHGkrbqh2hV
 SSHQ==
X-Gm-Message-State: AOJu0Ywr2noBZ9cegNhykJna1FSLGVPPgdcnhnLTC1fl8zU3O2X8ARGl
 ZNdKWgVc+5MrSUjahpL96QgKV82dM7w5FD5gqeSf0+zn7PuNXMR+QQyGq0O6ji28aejBF60JIHQ
 tyYtGK0m61HUuJ4XZmIznfTtun9Z3
X-Received: by 2002:a17:907:1dd8:b0:9ba:13f1:5a6f with SMTP id
 og24-20020a1709071dd800b009ba13f15a6fmr9455708ejc.75.1697076136207; 
 Wed, 11 Oct 2023 19:02:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxgEFj0g7tAODuIFGv+HPdRhUdlLYjzWLhTAQNZeGACjgpLu5Z67pO50/DcBHfMhfIfbiNSA==
X-Received: by 2002:a17:907:1dd8:b0:9ba:13f1:5a6f with SMTP id
 og24-20020a1709071dd800b009ba13f15a6fmr9455685ejc.75.1697076135865; 
 Wed, 11 Oct 2023 19:02:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 jp20-20020a170906f75400b0099bcb44493fsm10542068ejb.147.2023.10.11.19.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 19:02:15 -0700 (PDT)
Message-ID: <8c01bab9-6a70-fedc-211d-b22c7340f8f1@redhat.com>
Date: Thu, 12 Oct 2023 04:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 0/7] DRM scheduler changes for Xe
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231011235826.585624-1-matthew.brost@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231011235826.585624-1-matthew.brost@intel.com>
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

Can you please address my comments from V3 and V4?

https://lore.kernel.org/all/076891e9-b2ce-4c7f-833d-157aca5cd44b@amd.com/T/#m34ccee55e37ca47c87adf01439585d0bd187e3a0

- Danilo

On 10/12/23 01:58, Matthew Brost wrote:
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
> 
> v5:
>   - Address Luben's feedback
>   - Drop starting TDR after calling run_job()
>   - Drop adding Matthew Brost to maintainers of DRM scheduler
> 
> Matt
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel
> [2] https://patchwork.freedesktop.org/series/112188/
> [3] https://patchwork.freedesktop.org/series/116055/
> 
> Matthew Brost (7):
>    drm/sched: Add drm_sched_wqueue_* helpers
>    drm/sched: Convert drm scheduler to use a work queue rather than
>      kthread
>    drm/sched: Move schedule policy to scheduler
>    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>    drm/sched: Split free_job into own work item
>    drm/sched: Add drm_sched_start_timeout_unlocked helper
>    drm/sched: Add helper to queue TDR immediately for current and future
>      jobs
> 
>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   5 +-
>   drivers/gpu/drm/lima/lima_sched.c             |   5 +-
>   drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c          |   7 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.c       |   5 +-
>   drivers/gpu/drm/panfrost/panfrost_job.c       |   5 +-
>   drivers/gpu/drm/scheduler/sched_entity.c      |  86 ++-
>   drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>   drivers/gpu/drm/scheduler/sched_main.c        | 506 ++++++++++++------
>   drivers/gpu/drm/v3d/v3d_sched.c               |  25 +-
>   include/drm/gpu_scheduler.h                   |  48 +-
>   14 files changed, 499 insertions(+), 233 deletions(-)
> 

