Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC6F31E164
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 22:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0992D6E7F1;
	Wed, 17 Feb 2021 21:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CC66E7F1;
 Wed, 17 Feb 2021 21:32:06 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id n1so8264187edv.2;
 Wed, 17 Feb 2021 13:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=n9TThVfm7XGHUZh72r86WUebAr+kwLSoKjjjAsDTRUU=;
 b=TRHqGrUg5rrFJxfPOq5Geh3lwb8kt9UlEuzJLMJe5wN9jUgLHx8YQnfB70bF5YVB7R
 ydlTSdseIxrVf4TCe2jGU9xdoDpHLmQbEyhbemK5PQRRdEMzmz41VRgaXdQCHxMOuhFG
 pfEETLfVj0qd0baJLkJbdaspJ1F5s1lmK7LIWQhMuhwTbRgHp7lyq0uuJ4DYwdm4WZE9
 FCxe2YYT/orLmMSDn+MFuj1oDiT5LU4jZisTGlJZ0+PuU5E9G6ux/P+p2ntZWnnJRCNI
 wZCjA/UwACleOMPB7fAae8dKNYJb/mgXy98zOr5nulFaefuRt3UVmtNfEhRuvUN6txqc
 kZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=n9TThVfm7XGHUZh72r86WUebAr+kwLSoKjjjAsDTRUU=;
 b=UTB8UxrOfH1yAcLB1wiQrhiLQZMQ16Lcj0w8cWcKhZHcSF1hsbMo+kM5clbrlun4ew
 YmQGajcvwObxeJaLDxJk2cdWJ4fOi3MZrEXtFj1oZbZNIo3CTsPqlCX95QpKw8AvX9+w
 SGkYvMPQMTzGDkQslrciODkyizK+H1GuCUZghP+BV5vdvxyMOnDwUrYGAo8W0EOkrw7l
 sj1iq+3ONeFJd4N9jjQZsEM38m5r8wrD5Zc6IzVxPDqMg3PqX0Ym+CkRiq5QLakUtMJW
 kkWma/vFrX3Y58XDr7zKdplvYeZa5RY9EUDbANV3ojePv9wYcBRHltG7u2VDNljmgL31
 OJlg==
X-Gm-Message-State: AOAM5323S1EgzB3xXm5v7A7MO01HArV+y4CIxH9LW04htTBWmh8XmQSD
 QkoPDDQbEXjiTvl0EoaNPRvIojqvidoMZQ==
X-Google-Smtp-Source: ABdhPJx+dsefu7OMAbBFLBZefZpyv6/UNrrSiU34hrRReU6/f4nprssJ2H2ODrdWPUfiBWvBbCWtxw==
X-Received: by 2002:a50:ec97:: with SMTP id e23mr765162edr.265.1613597524945; 
 Wed, 17 Feb 2021 13:32:04 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:a062:ccbc:1dde:867b?
 ([2a02:908:1252:fb60:a062:ccbc:1dde:867b])
 by smtp.gmail.com with ESMTPSA id e22sm1746855edj.54.2021.02.17.13.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 13:32:04 -0800 (PST)
Subject: Re: [PATCH] drm/scheduler: Fix hang when sched_entity released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613495262-22605-1-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5d8f4e4f-fa2f-037b-d288-b4286e23e77a@gmail.com>
Date: Wed, 17 Feb 2021 22:32:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1613495262-22605-1-git-send-email-andrey.grodzovsky@amd.com>
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

Am 16.02.21 um 18:07 schrieb Andrey Grodzovsky:
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
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 908b0b5..11abf5d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -897,9 +897,40 @@ EXPORT_SYMBOL(drm_sched_init);
>    */
>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   {
> +	int i;
> +	struct drm_sched_entity *s_entity;
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
> +			drm_sched_rq_remove_entity(rq, s_entity);
> +
> +			/* Mark as stopped to reject adding to any new rq */
> +			spin_lock(&s_entity->rq_lock);
> +			s_entity->stopped = true;

Why not marking it as stopped and then removing it?

Regards,
Christian.

> +			spin_unlock(&s_entity->rq_lock);
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
