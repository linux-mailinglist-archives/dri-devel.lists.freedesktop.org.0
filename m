Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8CB977FB6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 14:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9359610ED08;
	Fri, 13 Sep 2024 12:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="pXWg9eQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9024610ED08
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 12:21:17 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42cb6f3a5bcso11317595e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1726230076; x=1726834876;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C2xf8rE0I0Vf7hYWniCA9aZSnwb/1pY5PjnZIFr0SCw=;
 b=pXWg9eQpWUXJabxbJRds9BHoCRxxmWHVQ5AMGfrZlayphhIpPjoVL70vw25r4axnwW
 5BMUVwEjtzDILv/WpJu1onGCAZnAxmzc9O4KHSmoRnZO/CTp/feldFBGWmibgetaxyTq
 JvNNFWvp12wbyZFP4UgZiSz+BdSzikiHB0N0hXsgPOR5pgQaVPOLkJ3eSQNWXrjrU2eA
 01TxPM1ruJ6gzv1wJup+IJ3ELj2MBMKeuAErOOjwEzu2Gkpo9INEQ2sQBWA1GxbTYL/8
 CkJwTtNiLh85o3KoCWn4/e9If8+TLYcDkk/0dVToP3xoVelY74yta9jeQ2/NHfHjuqd9
 2MzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726230076; x=1726834876;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C2xf8rE0I0Vf7hYWniCA9aZSnwb/1pY5PjnZIFr0SCw=;
 b=LkjA3jjHT/6IIM2wcj0R9+aYtFoh1C75+Wz491ch/ZRcZ4vphJx7inPoIuvvQUPBYx
 +IrAVm0N2t3ZcH0JlQTrDAiSoXvFpqgFc+kMdbqT1DvLLZY37E1RfSr1+HOk/5i/Am2K
 dwdaXoLwGx4eTQoK/75e7h31xC0fgwCAgDqv1yb1oQ/mSghe+BiKUnIc41tyVjhWkqpN
 cBD8sRlDlzgoJg/R9VFAo7QQJsfJGMQfdsgkOh1QAmGTWuEtTCsU4QAyOL8TZBS7MPbB
 Y81GDGjqvklzGJ76RlyBCzRjKE+VqEwrpkQROa2dUE8IchPZZtwDpMGDUTlTbwgs7TRh
 1lFQ==
X-Gm-Message-State: AOJu0Yz44MMrLx+CLkdHyZttdpADAH8PsG+V78fqI3GvjgDdBB3NjWJD
 Z7nkIQqUPoAvi/abkJZW+ls5AWco64nDDwq6aKISiF9f3N8BS97/Nhck5fxxEjA=
X-Google-Smtp-Source: AGHT+IHIKarTEBaRn58s3UvWoCwjM6vihgga95P3kKVtfHdcVOOvOS/CWQUaLXKidGqAASKMpnC9CA==
X-Received: by 2002:a05:600c:4590:b0:42c:bb58:a077 with SMTP id
 5b1f17b1804b1-42d907221a9mr26390825e9.14.1726230075344; 
 Fri, 13 Sep 2024 05:21:15 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b05d6fcsm22995435e9.15.2024.09.13.05.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 05:21:14 -0700 (PDT)
Message-ID: <4e85edc5-a155-460a-b470-aa7247b83230@ursulin.net>
Date: Fri, 13 Sep 2024 13:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/sched: warn about drm_sched_job_init()'s
 partial init
To: Philipp Stanner <pstanner@redhat.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240828094133.17402-2-pstanner@redhat.com>
 <20240828094133.17402-4-pstanner@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240828094133.17402-4-pstanner@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/08/2024 10:41, Philipp Stanner wrote:
> drm_sched_job_init()'s name suggests that after the function succeeded,
> parameter "job" will be fully initialized. This is not the case; some
> members are only later set, notably "job->sched" by drm_sched_job_arm().
> 
> Document that drm_sched_job_init() does not set all struct members.
> 
> Document that job->sched in particular is uninitialized before
> drm_sched_job_arm().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> Changes in v2:
>    - Change grammar in the new comments a bit.
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++++
>   include/drm/gpu_scheduler.h            | 7 +++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index b0c8ad10b419..721373938c1e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -781,6 +781,10 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>    * Drivers must make sure drm_sched_job_cleanup() if this function returns
>    * successfully, even when @job is aborted before drm_sched_job_arm() is called.
>    *
> + * Note that this function does not assign a valid value to each struct member
> + * of struct drm_sched_job. Take a look at that struct's documentation to see
> + * who sets which struct member with what lifetime.

First sentence is fine, but the second I don't see the those details in 
struct drm_sched_job. (And I am not saying that they must be listed. IMO 
at some point it is better to have a high level overview than describe 
the lifetime rules with individual members.)

> + *
>    * WARNING: amdgpu abuses &drm_sched.ready to signal when the hardware
>    * has died, which can mean that there's no valid runqueue for a @entity.
>    * This function returns -ENOENT in this case (which probably should be -EIO as
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 5acc64954a88..04a268cd22f1 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -337,6 +337,13 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>   struct drm_sched_job {
>   	struct spsc_node		queue_node;
>   	struct list_head		list;
> +
> +	/*
> +	 * The scheduler this job is or will be scheduled on.
> +	 *
> +	 * Gets set by drm_sched_arm(). Valid until the scheduler's backend_ops
> +	 * callback "free_job()" has been called.

This is interesting - I was not sure where lifetime for job->sched is 
defined and couldn't find it browsing around. Where did you find the 
clues to tie it to the free_job() callback?

Regards,

Tvrtko

> +	 */
>   	struct drm_gpu_scheduler	*sched;
>   	struct drm_sched_fence		*s_fence;
>   
