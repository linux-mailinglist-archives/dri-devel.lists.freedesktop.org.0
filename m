Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EEAA2F225
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 16:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2367A10E5A4;
	Mon, 10 Feb 2025 15:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Xvkc1wq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE88410E5A8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:52:38 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38dc5b8ed86so1900520f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1739202757; x=1739807557;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pwcghbDLhfpEKI26qkNX4Y8A/7H6gZuyW/uIEoD0XHE=;
 b=Xvkc1wq1qVE8+VHoNG6ear5zud4l7TD/3M4FRRdzOM0lbZnoWCGM5jdOBH34g/H8xN
 6A6OIaR9niqOF0J3Z7rZKwlyjU+Loh/xo0iK9j+FH5zGY85/WXAVpkWksLEMiGsl9OGV
 BEj1YF3RyLLv9v0lzARwV5sdFzttJCixa7NIwFSOLXdZwdqdADmptUScfoYpPq2WXF/r
 qsHNTxZpzQmRZhMQKT5tZ30pOtUDlWJLri/vIaI7QoRErCkbsaNy9t9Id/WT2QsPC90Y
 m6/kfbZa/YrtmcN33IJo62Ej9OHYUstpzdbbA5GXvScG/y599dHJE2RA3yfiwYnyjLvO
 3hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739202757; x=1739807557;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pwcghbDLhfpEKI26qkNX4Y8A/7H6gZuyW/uIEoD0XHE=;
 b=kVl6ccGPnip+DCjdZIT60FfZochh4dmQ49QyCoTMpMFO1iLYzEMHIF7k8+92hQZFYU
 F2auBRBr1ExIBqwWm///mnOVf2iVnM0Aj0ZB3TYRSEU9uuc9M5e+ByuAOpInN7P+t8y+
 wOCUfxHXBvr1AcJrTbDCLSdGo+vhSn65KvF9/Ac+58dYIU9j7TzkHnlq7bqF4nhb8UtK
 FTgYdo74roOmFiFiV5AtkrgDQph4q65xawvSPgV8ORTQGPFIHIIGqaMzpDz+X4xQFvhS
 eT4/pXgseyXptoN0/NIxJcQarim2veSoxA3gjVkKRoBR6IFmrhObMNEYZ7U6ZSapHBgo
 zo9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrVMiHmRnThCcYDGgbcmboTuaQM72OIR39N3ENvq2YEf/TK5LBPAo0FYpn1ddC0YOaMyujbp887BA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwP4MftjfNfRBYvNR9rH+OSbFNZfZ8la18dCyslzscmudDjmIbA
 LJZJy2Jir/OL25PtUGsATR4jxVDAODlXBsoOcn4L7KX9NcDcGDXPBGZHIUoPWXA=
X-Gm-Gg: ASbGncvX1C6w7lBVDF3OOstkxVGprZUU/IsIJt5QpmSjtBUlTjkWzt6cHJjtj+kpZLf
 j4RQy8RGqAPfl2J6AWkwWdXgk0TT+8DgSn1KvAxBhB+rrFpEXzgKHlMwQP7MGzqvQtd0llVvtnk
 W94ox7LcXUs3XxcihkUNzULiOGDPb9AJ/5ao2RQCg8LYx1qeQpB9HsPwK5QWSBATDG9zynUO7zy
 0oY9JnvGg3D9sT3uVtpuiMFrLpsGeHT0JHhfBJPyxgYy0LAtD/S/mCM2Bb089R5VVT8ZdONq9hS
 9TFmSpWkysxOQQc1U56qAcX5DdqcMC0=
X-Google-Smtp-Source: AGHT+IEGOFGcXaagghoiZrtFqwpV0sDrO7e3NQ9lVK6/2NzWEtMCQ2D8esE/k6+VcKNG+ZVSQyP+jA==
X-Received: by 2002:a5d:6d0b:0:b0:38d:dffc:c151 with SMTP id
 ffacd0b85a97d-38de41c3d0cmr52236f8f.48.1739202756935; 
 Mon, 10 Feb 2025 07:52:36 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dcae129sm148183925e9.17.2025.02.10.07.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 07:52:36 -0800 (PST)
Message-ID: <2ec2a848-90f4-49bc-aaaf-8eb256f271db@ursulin.net>
Date: Mon, 10 Feb 2025 15:52:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Replace sleep locks with spinlocks in
 fdinfo path
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250210124203.124191-1-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250210124203.124191-1-adrian.larumbe@collabora.com>
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


On 10/02/2025 12:41, Adrián Larumbe wrote:
> Panthor's fdinfo handler is routed through the /proc file system, which
> executes in an atomic context. That means we cannot use mutexes because
> they might sleep.

Have the debug splat at hand? I am thinking it is not because of fdinfo 
reads, which are allowed to sleep, but has to be something else.

Regards,

Tvrtko

> This bug was uncovered by enabling some of the kernel's mutex-debugging
> features:
> 
> CONFIG_DEBUG_RT_MUTEXES=y
> CONFIG_DEBUG_MUTEXES=y
> 
> Replace Panthor's group fdinfo data mutex with a guarded spinlock.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")
> ---
>   drivers/gpu/drm/panthor/panthor_sched.c | 26 ++++++++++++-------------
>   1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 0b93bf83a9b2..7a267d1efeb6 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -9,6 +9,7 @@
>   #include <drm/panthor_drm.h>
>   
>   #include <linux/build_bug.h>
> +#include <linux/cleanup.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/dma-mapping.h>
> @@ -631,10 +632,10 @@ struct panthor_group {
>   		struct panthor_gpu_usage data;
>   
>   		/**
> -		 * @lock: Mutex to govern concurrent access from drm file's fdinfo callback
> -		 * and job post-completion processing function
> +		 * @fdinfo.lock: Spinlock to govern concurrent access from drm file's fdinfo
> +		 * callback and job post-completion processing function
>   		 */
> -		struct mutex lock;
> +		spinlock_t lock;
>   
>   		/** @fdinfo.kbo_sizes: Aggregate size of private kernel BO's held by the group. */
>   		size_t kbo_sizes;
> @@ -910,8 +911,6 @@ static void group_release_work(struct work_struct *work)
>   						   release_work);
>   	u32 i;
>   
> -	mutex_destroy(&group->fdinfo.lock);
> -
>   	for (i = 0; i < group->queue_count; i++)
>   		group_free_queue(group, group->queues[i]);
>   
> @@ -2861,12 +2860,12 @@ static void update_fdinfo_stats(struct panthor_job *job)
>   	struct panthor_job_profiling_data *slots = queue->profiling.slots->kmap;
>   	struct panthor_job_profiling_data *data = &slots[job->profiling.slot];
>   
> -	mutex_lock(&group->fdinfo.lock);
> -	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> -		fdinfo->cycles += data->cycles.after - data->cycles.before;
> -	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> -		fdinfo->time += data->time.after - data->time.before;
> -	mutex_unlock(&group->fdinfo.lock);
> +	scoped_guard(spinlock, &group->fdinfo.lock) {
> +		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> +			fdinfo->cycles += data->cycles.after - data->cycles.before;
> +		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> +			fdinfo->time += data->time.after - data->time.before;
> +	}
>   }
>   
>   void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
> @@ -2880,12 +2879,11 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
>   
>   	xa_lock(&gpool->xa);
>   	xa_for_each(&gpool->xa, i, group) {
> -		mutex_lock(&group->fdinfo.lock);
> +		guard(spinlock)(&group->fdinfo.lock);
>   		pfile->stats.cycles += group->fdinfo.data.cycles;
>   		pfile->stats.time += group->fdinfo.data.time;
>   		group->fdinfo.data.cycles = 0;
>   		group->fdinfo.data.time = 0;
> -		mutex_unlock(&group->fdinfo.lock);
>   	}
>   	xa_unlock(&gpool->xa);
>   }
> @@ -3531,7 +3529,7 @@ int panthor_group_create(struct panthor_file *pfile,
>   	mutex_unlock(&sched->reset.lock);
>   
>   	add_group_kbo_sizes(group->ptdev, group);
> -	mutex_init(&group->fdinfo.lock);
> +	spin_lock_init(&group->fdinfo.lock);
>   
>   	return gid;
>   
> 
> base-commit: 2eca617f12586abff62038db1c14cb3aa60a15aa
> prerequisite-patch-id: 7e787ce5973b5fc7e9f69f26aa4d7e5ec03d5caa
> prerequisite-patch-id: 03a619b8c741444b28435850e23d9ec463171c13
> prerequisite-patch-id: 290e1053f8bf4a8b80fb037a87cae7e096b5aa96
> prerequisite-patch-id: bc49bb8c29905650fb4788acc528bb44013c0240
> prerequisite-patch-id: 46cab4c980824c03e5164afc43085fec23e1cba5

