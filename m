Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0531031E741
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 09:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141AE6E82B;
	Thu, 18 Feb 2021 08:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84ADF6E82B;
 Thu, 18 Feb 2021 08:07:04 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id d8so3583573ejc.4;
 Thu, 18 Feb 2021 00:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=BhYFMp+dmrNWlirS2Iba8fZAV1JhsdecXhJVj6aJUxI=;
 b=QzEpvrsKsbqsq+in/HNhYL1KS/YOQ759yg9vMcY4FiLTYr3UlCgkbMlR3e3tguEx2+
 aaLJ14RxNcEQ2tUMvizCR/3RDS9FUtPGjH5lQc7WLl7c3iXemNPDTGI/6FDc9eLdKXQw
 4ysyLWR38Qi45u6JcPNeRR0nEwAQemzKbfZqDPSZmJYC2wbwN64Z4WOqnVec7RFvldQt
 LLUmI39C8C4ac4pHzHRv00dD3PgDc6h1Gm3qR8mZ7BS9ibp1a4HJDIrPlyfXm6Ztk7rn
 8nG4wXH9yOg6uhiQTNE12pqjZWhllABAH9Hu/TmsPxf1h+KM1M5oqaDaeyP9BxcS2568
 +MUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BhYFMp+dmrNWlirS2Iba8fZAV1JhsdecXhJVj6aJUxI=;
 b=esrLzeGGSEXB4Dkp5SLA1xR61Y+Lx2LzBjYHjls0RVrvgKwYO1f0nrDnDOM4+Erd6e
 KLk4RKmqxjH+ftR+4vMoZEZA+vLDHOL+aWJpWEkw7PK4JHmpK0Tt5dR0LkoIPUcUhI7j
 9B5dbGzZ+mBqNyPvCfYS6MDoFTB+bZkmMx3mboiuZ7ZbiUD6I5SYRruk5JxLWY+X3sqA
 wJygZs4vZLGv8DpG/2an1c8QfiB+2dHQjr042IznyzbMieqS5VZbuTHAdkgHEHxowTYQ
 ndQjH7ZicK1ttFDJV00iLmr6lXHapyuiFaDLAPzimB54VKgLjMmcc/DjBVg5/CQcC6pw
 /OnQ==
X-Gm-Message-State: AOAM533szl0UQ+rAxzv6dJhYFMNR0r8if1sLTM113097C2PgmzsnGSnd
 qhHQNW5Jnu5rcrTmaGMz2C3xxvgA8RUhvQ==
X-Google-Smtp-Source: ABdhPJxL13DYhGct0BX/OKexkTjxb3TjY9tHq3EUV23c8vxPlHVeVlqTd5kNxMWHgo/qYVHYSGcH/g==
X-Received: by 2002:a17:906:d71:: with SMTP id
 s17mr2935751ejh.126.1613635623208; 
 Thu, 18 Feb 2021 00:07:03 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:e2a7:31f6:576:887?
 ([2a02:908:1252:fb60:e2a7:31f6:576:887])
 by smtp.gmail.com with ESMTPSA id k2sm2063702ejp.6.2021.02.18.00.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 00:07:02 -0800 (PST)
Subject: Re: [PATCH v2] drm/scheduler: Fix hang when sched_entity released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <bc2c5ce4-a641-8a5e-bd7b-11174c883e99@gmail.com>
Date: Thu, 18 Feb 2021 09:07:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 17.02.21 um 22:59 schrieb Andrey Grodzovsky:
> Problem: If scheduler is already stopped by the time sched_entity
> is released and entity's job_queue not empty I encountred
> a hang in drm_sched_entity_flush. This is because drm_sched_entity_is_idle
> never becomes false.
>
> Fix: In drm_sched_fini detach all sched_entities from the
> scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
> Also wakeup all those processes stuck in sched_entity flushing
> as the scheduler main thread which wakes them up is stopped by now.
>
> v2:
> Reverse order of drm_sched_rq_remove_entity and marking
> s_entity as stopped to prevent reinserion back to rq due
> to race.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 908b0b5..c6b7947 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -897,9 +897,40 @@ EXPORT_SYMBOL(drm_sched_init);
>    */
>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   {
> +	int i;
> +	struct drm_sched_entity *s_entity;

BTW: Please order that so that i is declared last.

>   	if (sched->thread)
>   		kthread_stop(sched->thread);
>   
> +	/* Detach all sched_entites from this scheduler once it's stopped */
> +	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +		struct drm_sched_rq *rq = &sched->sched_rq[i];
> +
> +		if (!rq)
> +			continue;
> +
> +		/* Loop this way because rq->lock is taken in drm_sched_rq_remove_entity */
> +		spin_lock(&rq->lock);
> +		while ((s_entity = list_first_entry_or_null(&rq->entities,
> +							    struct drm_sched_entity,
> +							    list))) {
> +			spin_unlock(&rq->lock);
> +
> +			/* Prevent reinsertion and remove */
> +			spin_lock(&s_entity->rq_lock);
> +			s_entity->stopped = true;
> +			drm_sched_rq_remove_entity(rq, s_entity);
> +			spin_unlock(&s_entity->rq_lock);

Well this spin_unlock/lock dance here doesn't look correct at all now.

Christian.

> +
> +			spin_lock(&rq->lock);
> +		}
> +		spin_unlock(&rq->lock);
> +
> +	}
> +
> +	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
> +	wake_up_all(&sched->job_scheduled);
> +
>   	/* Confirm no work left behind accessing device structures */
>   	cancel_delayed_work_sync(&sched->work_tdr);
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
