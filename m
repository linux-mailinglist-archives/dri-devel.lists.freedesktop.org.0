Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F23ED7E4E37
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 01:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0F110E305;
	Wed,  8 Nov 2023 00:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347A810E305
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 00:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699404079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ULxckgGYYImBGgSsj6S7x6ndPnlaJduz5EJX6IrAtLk=;
 b=fpav8E4n+PevmRYug/WqGTzaw7YpnP2bdhxVXffZzU6i4QrrFinLL5nii74qI6NpVE+6cV
 uyFd5yw2dNCQE/Jp7MuRsYqxxNQyYPcDbnGOXOz8lOk6UqTDRUDms2rW+MhotR/INCjdbz
 b8AR9v2FIZlTSwYWnCMn+J7geN6EV7k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-qmAu_WWzOxGVeOuW2S7-Ng-1; Tue, 07 Nov 2023 19:41:18 -0500
X-MC-Unique: qmAu_WWzOxGVeOuW2S7-Ng-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9e27cc6dbedso90193366b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 16:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699404077; x=1700008877;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ULxckgGYYImBGgSsj6S7x6ndPnlaJduz5EJX6IrAtLk=;
 b=Y8Ue+YyJbwHOo07WU00yz+272R4mbDisf9vJyCUSnoyMeQTEaNzFSCxr2ZgKp0Rb41
 hCQYjo8vrT7LMQ/NoxoNEkCFJkEYqFK/lrJe5N1tXQOmM36jdJqACW2i7KkJK68xQMUB
 cF4m0VN9AML+/Qda2x1RndUBhfDrxUC2yhco2QKtLWnmO8212IJ05ePExm+yCPrUY1iP
 As6vaM0IkFm8a18YzGp+sbvnyH8etdqzZStLC7kn6Cwti0AOFKY/cdbi9kKfZ58s1cyB
 wJqLgUX/7XOD7+aim8ZjNpsHowb/e+MYo027CFQH6ZytKcK7UHWVJV0DQA1z8FSmyRRF
 nCTw==
X-Gm-Message-State: AOJu0Ywg7XFSsc0WRPPYAyqXM6CUQ37lJ+2+UgYFcYBCLhCqLDYsjTr5
 LNfKDYIvITvvvP9OxT7jy8b7qCpL/7OIVI62Y/qf6hPXwnmF4IMsaByoT58FbSljx2g4U8w9iiA
 hGzVx8g8HG3rA+nAnfP0gb7ZlN6Bv
X-Received: by 2002:a17:906:4fd5:b0:9c6:19ea:cdd6 with SMTP id
 i21-20020a1709064fd500b009c619eacdd6mr223142ejw.50.1699404077096; 
 Tue, 07 Nov 2023 16:41:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeIke/9qVB1P0AK+TqehFPvCXSh1gC9WGNqeD7FlKtCj3gjO4A3yYfrm1wFeukEIK860aTMg==
X-Received: by 2002:a17:906:4fd5:b0:9c6:19ea:cdd6 with SMTP id
 i21-20020a1709064fd500b009c619eacdd6mr223126ejw.50.1699404076682; 
 Tue, 07 Nov 2023 16:41:16 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a1709062e8e00b00997cce73cc7sm200762eji.29.2023.11.07.16.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 16:41:16 -0800 (PST)
Message-ID: <70fb8d33-6b39-433f-8fa3-76883001ed68@redhat.com>
Date: Wed, 8 Nov 2023 01:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
To: Luben Tuikov <ltuikov89@gmail.com>, tvrtko.ursulin@linux.intel.com
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231107041020.10035-2-ltuikov89@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231107041020.10035-2-ltuikov89@gmail.com>
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
Cc: matthew.brost@intel.com, robdclark@chromium.org, sarah.walker@imgtec.com,
 ltuikov@yahoo.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/23 05:10, Luben Tuikov wrote:
> Don't call drm_sched_select_entity() in drm_sched_run_job_queue().  In fact,
> rename __drm_sched_run_job_queue() to just drm_sched_run_job_queue(), and let
> it do just that, schedule the work item for execution.
> 
> The problem is that drm_sched_run_job_queue() calls drm_sched_select_entity()
> to determine if the scheduler has an entity ready in one of its run-queues,
> and in the case of the Round-Robin (RR) scheduling, the function
> drm_sched_rq_select_entity_rr() does just that, selects the _next_ entity
> which is ready, sets up the run-queue and completion and returns that
> entity. The FIFO scheduling algorithm is unaffected.
> 
> Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
> in the case of RR scheduling, that would result in drm_sched_select_entity()
> having been called twice, which may result in skipping a ready entity if more
> than one entity is ready. This commit fixes this by eliminating the call to
> drm_sched_select_entity() from drm_sched_run_job_queue(), and leaves it only
> in drm_sched_run_job_work().
> 
> v2: Rebased on top of Tvrtko's renames series of patches. (Luben)
>      Add fixes-tag. (Tvrtko)
> 
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 16 +++-------------
>   1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 27843e37d9b769..cd0dc3f81d05f0 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -256,10 +256,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>   }
>   
>   /**
> - * __drm_sched_run_job_queue - enqueue run-job work
> + * drm_sched_run_job_queue - enqueue run-job work
>    * @sched: scheduler instance
>    */
> -static void __drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>   {
>   	if (!READ_ONCE(sched->pause_submit))
>   		queue_work(sched->submit_wq, &sched->work_run_job);
> @@ -928,7 +928,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>   void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>   {
>   	if (drm_sched_can_queue(sched))
> -		__drm_sched_run_job_queue(sched);
> +		drm_sched_run_job_queue(sched);
>   }
>   
>   /**
> @@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   }
>   EXPORT_SYMBOL(drm_sched_pick_best);
>   
> -/**
> - * drm_sched_run_job_queue - enqueue run-job work if there are ready entities
> - * @sched: scheduler instance
> - */
> -static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> -{
> -	if (drm_sched_select_entity(sched))

Hm, now that I rebase my patch to implement dynamic job-flow control I recognize that
we probably need the peek semantics here. If we do not select an entity here, we also
do not check whether the corresponding job fits on the ring.

Alternatively, we simply can't do this check in drm_sched_wakeup(). The consequence would
be that we don't detect that we need to wait for credits to free up before the run work is
already executing and the run work selects an entity.

- Danilo

> -		__drm_sched_run_job_queue(sched);
> -}
> -
>   /**
>    * drm_sched_free_job_work - worker to call free_job
>    *
> 
> base-commit: 27d9620e9a9a6bc27a646b464b85860d91e21af3

