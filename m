Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E596E977F00
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 13:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF7310ECF7;
	Fri, 13 Sep 2024 11:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="hl/pEL5C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4530610ECF7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 11:56:30 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4280ca0791bso19816605e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1726228588; x=1726833388;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b28g9Qh6wbp8sFAAmBj0WXV4vMJYAGNB1czPJCNOJh8=;
 b=hl/pEL5CEfG/TEoYPXdNc0NfSrzGbx883foGTJtcy54adS0e2Zm50zTfbYdjwAq3rT
 8fobyEOMtkyEJgHLjgt0TUZE8Ze/sbF8Uf7Ok8SyD9ltjbG0MjXiEB1E/k5PPBohRNQa
 CD0Dpd/+ay1rKmSgrUldHnilEt9J62z3W8xiFW0a/BYrqdCXXJSZxo/yloe4TwarmZDM
 //g06pceBhaXv4KoA/r+gVBppwsy9W6FEZYNeLuWCh8WFyJjjF4hG0zKmYRJ2yv2Lo7f
 LiX7k3WMv9JluywzEMa9DAVuqF3CTnXsVpsIn/a8d9jNBcW4EkQmL5LIdzGc8+wXAlsK
 /Osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726228588; x=1726833388;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b28g9Qh6wbp8sFAAmBj0WXV4vMJYAGNB1czPJCNOJh8=;
 b=nDOW4y0gkd7F9TZitn4FpF5Dy7ErG91VsTClvxPqnVn0is0jsOLbseS6GIyMsCh1L/
 zgVXID4gpywIQZykVjEF3ApdlEY1vsS9J+q/rvlYSisC50L32etWHVJWvcjkjedpBVH4
 f3c7i1NiAv+TBDW77goQWCOzF0h/sTcRdCGI7LWa3eailLR3fV7OFR/ylgHv6f0ycqvX
 /5FDDRYy1FMvhQTlvm0qs1Sdyxie2KCvmRHEtv+evj8xavcWD2ej28wpvTIkOEdE6aQX
 X50pt499qKJgum/nEp6/PhgOchCnOMIf0pgxIBe+spzKDnBP+pr3TwrXlLainmI0IUBh
 HFug==
X-Gm-Message-State: AOJu0YzmVmpxMQZwotLaY+3sPkmbcgWZc+OWHzNCxfd60/eq3HtXoI3q
 7EC1zQy4fLP605OoV7FCufOPXOiyBsM9TWuz9C2rv5wBLuW1ztbBzSAM/PmecNo=
X-Google-Smtp-Source: AGHT+IHcUXeBZBOEM+H7QN71Pqp8IN5OgZbq+vY6D+e8DBFynITqywYcxExRNOpgBMESa2uv7BiL6g==
X-Received: by 2002:a05:600c:19ce:b0:42c:b4f2:7c30 with SMTP id
 5b1f17b1804b1-42cdb56ae9bmr50228735e9.23.1726228587234; 
 Fri, 13 Sep 2024 04:56:27 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b05a6f5sm22478835e9.4.2024.09.13.04.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 04:56:26 -0700 (PDT)
Message-ID: <92a123f1-73c9-45a1-8e0a-af72dd0a70e7@ursulin.net>
Date: Fri, 13 Sep 2024 12:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/sched: memset() 'job' in drm_sched_job_init()
To: Philipp Stanner <pstanner@redhat.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240828094133.17402-2-pstanner@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240828094133.17402-2-pstanner@redhat.com>
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


Hi,

On 28/08/2024 10:41, Philipp Stanner wrote:
> drm_sched_job_init() has no control over how users allocate struct
> drm_sched_job. Unfortunately, the function can also not set some struct
> members such as job->sched.

job->sched usage from within looks like a bug. But not related to the 
memset you add.

For this one something like this looks easiest for a start:

diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
b/drivers/gpu/drm/scheduler/sched_main.c
index ab53ab486fe6..877113b01af2 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -788,7 +788,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
                  * or worse--a blank screen--leave a trail in the
                  * logs, so this can be debugged easier.
                  */
-               drm_err(job->sched, "%s: entity has no rq!\n", __func__);
+               pr_err("%s: entity has no rq!\n", __func__);
                 return -ENOENT;
         }

Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable 
number of run-queues")
Cc: <stable@vger.kernel.org> # v6.7+

> This could theoretically lead to UB by users dereferencing the struct's
> pointer members too early.

Hmm if drm_sched_job_init returned an error callers should not 
dereference anything. What was actually the issue you were debugging?

Adding a memset is I think not the best solution since it is very likely 
redundant to someone doing a kzalloc in the first place.

Regards,

Tvrtko

> It is easier to debug such issues if these pointers are initialized to
> NULL, so dereferencing them causes a NULL pointer exception.
> Accordingly, drm_sched_entity_init() does precisely that and initializes
> its struct with memset().
> 
> Initialize parameter "job" to 0 in drm_sched_job_init().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> No changes in v2.
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 356c30fa24a8..b0c8ad10b419 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -806,6 +806,14 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   		return -EINVAL;
>   	}
>   
> +	/*
> +	 * We don't know for sure how the user has allocated. Thus, zero the
> +	 * struct so that unallowed (i.e., too early) usage of pointers that
> +	 * this function does not set is guaranteed to lead to a NULL pointer
> +	 * exception instead of UB.
> +	 */
> +	memset(job, 0, sizeof(*job));
> +
>   	job->entity = entity;
>   	job->credits = credits;
>   	job->s_fence = drm_sched_fence_alloc(entity, owner);
