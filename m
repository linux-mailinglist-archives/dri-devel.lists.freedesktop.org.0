Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9712678723B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7B110E563;
	Thu, 24 Aug 2023 14:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE0810E563
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692888700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7o8FmS9ILXRLPo1u5nNYGJpJogRKnIzbXnVpr9mrPjw=;
 b=UmaH7qEx4eF+GLmNDQHHk3zvkCg+DOWWVpZYZQNH/YvKVkcohsXotK75nYIYHAdIypBecU
 26kCZb3Cdm/xFMA1R6Pm6H6o/G0cuHHe2R1ThAQetkNsbKGuc/LXOikIYXa/7wGAhCO+CJ
 kwfonCbmpDi5yrOg7CSnjcLrBROkYFU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-JzipfRAfND-VOlKQVPPN1Q-1; Thu, 24 Aug 2023 10:51:37 -0400
X-MC-Unique: JzipfRAfND-VOlKQVPPN1Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5231d9f9e53so4915729a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 07:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692888695; x=1693493495;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7o8FmS9ILXRLPo1u5nNYGJpJogRKnIzbXnVpr9mrPjw=;
 b=T1RZbWRufMLn9/8R8Ox5Tkas6z3QQLWPsHOcU53b9IFe4yMvPCRIc8vwkns6bT7SQw
 SSAPpWtjwRuA5hSU4y8GTLsbqzfMW5zZlkZGP1UMUkmgLt7By6tI8cjwoL2NKxw9cIOk
 YDYAzqlgIyASDET9bajaBI3wikj1dSQyalIdJPs4Vjugs1Y837KRNZ+8eLln7H6Ssi48
 InqkmXx8FGaZJETd/V+LgBlWHoGwl5TkVop8iBxZ67FLsykOKaOXTVM9ci5V5yCV8VOV
 u8Cdqrspc+rNWXwzrgOBa5Q8/+bICdluzjqqhfl2A8YE4VfhF/X7RGPZ91+iloVvl28G
 5cUA==
X-Gm-Message-State: AOJu0YzDpQcIYv2oFgLIZ2NNgvL7M0B2nTfQOZ0Ex2p+BWSGwveb2Ou0
 YIa6CeaItfcu7RA3/njL+eB968vnSXY5QqgK9SEKhkV+ls5+avFGfss4L877OAAQ13PQ1/wjysN
 CtarW3yzTrBkvTVN1ijiTxwLv41Au
X-Received: by 2002:a17:906:7691:b0:9a1:c39a:8bfd with SMTP id
 o17-20020a170906769100b009a1c39a8bfdmr5597926ejm.57.1692888695254; 
 Thu, 24 Aug 2023 07:51:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeDO8RRGYrxEyYcoyUdQLdXSYJyvNZ3g0aSSub2U0DLfFntA3wWoTPcvbRBh/ph2VdVlfrcA==
X-Received: by 2002:a17:906:7691:b0:9a1:c39a:8bfd with SMTP id
 o17-20020a170906769100b009a1c39a8bfdmr5597914ejm.57.1692888694906; 
 Thu, 24 Aug 2023 07:51:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 mb12-20020a170906eb0c00b0099bd5b72d93sm11113573ejb.43.2023.08.24.07.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 07:51:34 -0700 (PDT)
Message-ID: <fa7879ea-c07d-d41d-6a6b-cfb0a408107d@redhat.com>
Date: Thu, 24 Aug 2023 16:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/9] DRM scheduler changes for Xe
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <748c267c-1ede-876a-1cac-c864fb37e3dc@redhat.com>
 <ZObNNn8u8pf69IYh@DUT025-TGLU.fm.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ZObNNn8u8pf69IYh@DUT025-TGLU.fm.intel.com>
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/24/23 05:23, Matthew Brost wrote:
> On Thu, Aug 24, 2023 at 02:08:59AM +0200, Danilo Krummrich wrote:
>> Hi Matt,
>>
>> On 8/11/23 04:31, Matthew Brost wrote:
>>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
>>> have been asked to merge our common DRM scheduler patches first.
>>>
>>> This a continuation of a RFC [3] with all comments addressed, ready for
>>> a full review, and hopefully in state which can merged in the near
>>> future. More details of this series can found in the cover letter of the
>>> RFC [3].
>>>
>>> These changes have been tested with the Xe driver.
>>
>> Do you keep a branch with these patches somewhere?
>>
> 
> Pushed a branch for you:
> https://gitlab.freedesktop.org/mbrost/nouveau-drm-scheduler/-/tree/xe-sched-changes?ref_type=heads

Great - gonna pick this up to work on making use of DRM_SCHED_POLICY_SINGLE_ENTITY in Nouveau.

- Danilo

> 
> Matt
> 
>> - Danilo
>>
>>>
>>> v2:
>>>    - Break run job, free job, and process message in own work items
>>>    - This might break other drivers as run job and free job now can run in
>>>      parallel, can fix up if needed
>>>
>>> Matt
>>>
>>> Matthew Brost (9):
>>>     drm/sched: Convert drm scheduler to use a work queue  rather than
>>>       kthread
>>>     drm/sched: Move schedule policy to scheduler / entity
>>>     drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>>>     drm/sched: Split free_job into own work item
>>>     drm/sched: Add generic scheduler message interface
>>>     drm/sched: Add drm_sched_start_timeout_unlocked helper
>>>     drm/sched: Start run wq before TDR in drm_sched_start
>>>     drm/sched: Submit job before starting TDR
>>>     drm/sched: Add helper to set TDR timeout
>>>
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   3 +-
>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   5 +-
>>>    drivers/gpu/drm/lima/lima_sched.c          |   5 +-
>>>    drivers/gpu/drm/msm/msm_ringbuffer.c       |   5 +-
>>>    drivers/gpu/drm/nouveau/nouveau_sched.c    |   5 +-
>>>    drivers/gpu/drm/panfrost/panfrost_job.c    |   5 +-
>>>    drivers/gpu/drm/scheduler/sched_entity.c   |  85 ++++-
>>>    drivers/gpu/drm/scheduler/sched_fence.c    |   2 +-
>>>    drivers/gpu/drm/scheduler/sched_main.c     | 408 ++++++++++++++++-----
>>>    drivers/gpu/drm/v3d/v3d_sched.c            |  25 +-
>>>    include/drm/gpu_scheduler.h                |  75 +++-
>>>    11 files changed, 487 insertions(+), 136 deletions(-)
>>>
>>
> 

