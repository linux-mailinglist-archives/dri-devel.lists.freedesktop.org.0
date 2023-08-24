Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11642786438
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 02:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D05410E2C9;
	Thu, 24 Aug 2023 00:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AE110E106
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 00:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692835746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9YTLgom4LLXkDbipBsYHevhLp8X2PuC5uyFIQGQUY8=;
 b=N5gUdbfN0QwXLS20wzobOxTvRBfgEvZuCM5YGhox1v5jXH6h0qxX/4+9L5cGCfRnZvBD41
 VKpF9FNHkCTPGgW8N5x1mOS61X7zyd4iGPrRM9oi52lwr4NovyM0izZHx31xnUPa2q0lwv
 1X2/YgXz2Ox8kCSmN+0H+GxhGg+CFJs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-YUWBMBudN3yAqTBr-CiF5A-1; Wed, 23 Aug 2023 20:09:03 -0400
X-MC-Unique: YUWBMBudN3yAqTBr-CiF5A-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a355c9028so431486166b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 17:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692835742; x=1693440542;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q9YTLgom4LLXkDbipBsYHevhLp8X2PuC5uyFIQGQUY8=;
 b=Sf+STPASq0VkFB0Hwe/NGkW0WzrGp971o35kG+fQrBGsQYbX5IMdzc6AZd/jx3BAw7
 wz54hApoDmow5ZiK8Jn6Vox/gldQBL06OC2SUha/gRSq/1Hmrp+vc7NnwzTgVJH7TxUx
 v5gGTrU0wlLstCVn06O/xo+clbt7NMUn3MfRgPSX/isRNpyiuQv/X48KUqyAAJ6TIXQd
 duQRNbhd7BlcbgUx9Ln6yyAuW8ki7hP2A4N1r0YSrY10gFN5f419c2cv0XtgnN1g78J3
 ykFLzST8qMPNvEtQ7XVMzUQLXu4mnM6lqst7TgRGrYE0dl7LFzt0wAd94AZwTTkzsBTq
 La6w==
X-Gm-Message-State: AOJu0YzmfxR7AR7dPwKZLQhKtprw50CpoN3WXkCaB7jVObC4wy1V+c9X
 uB+m8UHcMtsrt6VncFEF+n+R2u4TAP4tHgWXegm/2mzqDT/RmBTazbUDBX7v5UvNmc13Emk5CXb
 Dgsjl6fjDziwWItm55BA88PBTelwO
X-Received: by 2002:a17:906:150:b0:9a1:d79a:418e with SMTP id
 16-20020a170906015000b009a1d79a418emr2539331ejh.40.1692835742238; 
 Wed, 23 Aug 2023 17:09:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsSyEdQ5ocz51eEwfpOfkEQGYm/87Y7r3ybAiFHh/d9QBfxgKPJ7p5w9hqFsyhIfHUsDMc6Q==
X-Received: by 2002:a17:906:150:b0:9a1:d79a:418e with SMTP id
 16-20020a170906015000b009a1d79a418emr2539316ejh.40.1692835741947; 
 Wed, 23 Aug 2023 17:09:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a17090614d600b009a1c05bd672sm2741765ejc.127.2023.08.23.17.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 17:09:01 -0700 (PDT)
Message-ID: <748c267c-1ede-876a-1cac-c864fb37e3dc@redhat.com>
Date: Thu, 24 Aug 2023 02:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/9] DRM scheduler changes for Xe
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230811023137.659037-1-matthew.brost@intel.com>
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

Hi Matt,

On 8/11/23 04:31, Matthew Brost wrote:
> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> have been asked to merge our common DRM scheduler patches first.
> 
> This a continuation of a RFC [3] with all comments addressed, ready for
> a full review, and hopefully in state which can merged in the near
> future. More details of this series can found in the cover letter of the
> RFC [3].
> 
> These changes have been tested with the Xe driver.

Do you keep a branch with these patches somewhere?

- Danilo

> 
> v2:
>   - Break run job, free job, and process message in own work items
>   - This might break other drivers as run job and free job now can run in
>     parallel, can fix up if needed
> 
> Matt
> 
> Matthew Brost (9):
>    drm/sched: Convert drm scheduler to use a work queue  rather than
>      kthread
>    drm/sched: Move schedule policy to scheduler / entity
>    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>    drm/sched: Split free_job into own work item
>    drm/sched: Add generic scheduler message interface
>    drm/sched: Add drm_sched_start_timeout_unlocked helper
>    drm/sched: Start run wq before TDR in drm_sched_start
>    drm/sched: Submit job before starting TDR
>    drm/sched: Add helper to set TDR timeout
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   3 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   5 +-
>   drivers/gpu/drm/lima/lima_sched.c          |   5 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c       |   5 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.c    |   5 +-
>   drivers/gpu/drm/panfrost/panfrost_job.c    |   5 +-
>   drivers/gpu/drm/scheduler/sched_entity.c   |  85 ++++-
>   drivers/gpu/drm/scheduler/sched_fence.c    |   2 +-
>   drivers/gpu/drm/scheduler/sched_main.c     | 408 ++++++++++++++++-----
>   drivers/gpu/drm/v3d/v3d_sched.c            |  25 +-
>   include/drm/gpu_scheduler.h                |  75 +++-
>   11 files changed, 487 insertions(+), 136 deletions(-)
> 

