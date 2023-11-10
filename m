Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F017A7E75A2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24EB10E38A;
	Fri, 10 Nov 2023 00:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF50210E390
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 00:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699574621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qsqwq5z2481kz8T1FvyyoVjuh6lkbadJXDhGwlhhIuQ=;
 b=ASSGlgdCeDyc3dQG77ztIE3vdclOBKGr/cethKPsyOd8Ks5mAzO0NswZLL4qrgBqRUl+Oq
 OhYAC56JzXBLmUzSNzSA4AmTtC3N6vLGX+T/phBgd/LXg1dmdOlV66yy+VMH3dvPr0ZGc0
 bJvRRceJ7V0E7lJsVOvuxXAedtuirL8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-7oxU3DrWMyWMp891F6NS7A-1; Thu, 09 Nov 2023 19:03:40 -0500
X-MC-Unique: 7oxU3DrWMyWMp891F6NS7A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32dee12c5b4so696792f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:03:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699574619; x=1700179419;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qsqwq5z2481kz8T1FvyyoVjuh6lkbadJXDhGwlhhIuQ=;
 b=CDXbQHwhVXNy/TvRjFSw4m8dMGN9H7CoXvifoEdaWxTnbcw4iTdJB/laCqKcRYvnPy
 TK82+fDIK7c2REGXT2r3rg4ZihR2colSCZq8YTRTaJT8oJVVV6WxhWh4QLNQ1LW2NYoC
 SggTAoEwp/LnbObOQZU3oramDQ6yfvhMgvYawhCPTOvMQPazYKAkGeb+VcF//XrbrnpU
 Aqq7FrrY+GPx/DxOvDKttD5xTnbNh2fl4F8/x5DgWeUOE8RdbjRSZl9MBboDEB7fxu7g
 t0liLZDp+xMIdQG2DzRCRtiC1kHnr9Twj69bv4DqBopJnQSVeO6ibFQ7n8YgAcuvnQs6
 yADA==
X-Gm-Message-State: AOJu0YzulNmw596x+t7sV2pbHrOo1KsbvCt7bUrp6VlXCEcbjtvZHFJa
 szWF2XSgUhiiuY5Ag1RuY96qJmLH86jCD7r0us4McWSqSzo73ZpbwJ4DPfzXORXZcpTnLemnqhu
 U6nGRFY/ESOXFo3WWL9O2lSjDMfaa
X-Received: by 2002:a5d:47ad:0:b0:331:3505:5d40 with SMTP id
 13-20020a5d47ad000000b0033135055d40mr3094987wrb.59.1699574619208; 
 Thu, 09 Nov 2023 16:03:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEng5P1+RG7or6KCR3Xp1ER+lMQu+HqJ8xsvjvdI1leJVPwGo3m3cIFy+5z0qRkJK5BhGinKw==
X-Received: by 2002:a5d:47ad:0:b0:331:3505:5d40 with SMTP id
 13-20020a5d47ad000000b0033135055d40mr3094974wrb.59.1699574618890; 
 Thu, 09 Nov 2023 16:03:38 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a5d6945000000b0032fdcbfb093sm725357wrw.81.2023.11.09.16.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 16:03:38 -0800 (PST)
Message-ID: <e369a52a-68d2-4d3d-a5f4-ec03a6ce68fb@redhat.com>
Date: Fri, 10 Nov 2023 01:03:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Qualify drm_sched_wakeup() by
 drm_sched_entity_is_ready()
To: Luben Tuikov <ltuikov89@gmail.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231110000123.72565-2-ltuikov89@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231110000123.72565-2-ltuikov89@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/23 01:01, Luben Tuikov wrote:
> Don't "wake up" the GPU scheduler unless the entity is ready, as well as we
> can queue to the scheduler, i.e. there is no point in waking up the scheduler
> for the entity unless the entity is ready.
> 
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> Fixes: bc8d6a9df99038 ("drm/sched: Don't disturb the entity when in RR-mode scheduling")

Reviewed-by: Danilo Krummrich <dakr@redhat.com>


> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
>   drivers/gpu/drm/scheduler/sched_main.c   | 8 +++++---
>   include/drm/gpu_scheduler.h              | 2 +-
>   3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index f1db63cc819812..4d42b1e4daa67f 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -370,7 +370,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>   		container_of(cb, struct drm_sched_entity, cb);
>   
>   	drm_sched_entity_clear_dep(f, cb);
> -	drm_sched_wakeup(entity->rq->sched);
> +	drm_sched_wakeup(entity->rq->sched, entity);
>   }
>   
>   /**
> @@ -602,7 +602,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>   			drm_sched_rq_update_fifo(entity, submit_ts);
>   
> -		drm_sched_wakeup(entity->rq->sched);
> +		drm_sched_wakeup(entity->rq->sched, entity);
>   	}
>   }
>   EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index cd0dc3f81d05f0..8f5e466bd58239 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -925,10 +925,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>    *
>    * Wake up the scheduler if we can queue jobs.
>    */
> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
> +void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
> +		      struct drm_sched_entity *entity)
>   {
> -	if (drm_sched_can_queue(sched))
> -		drm_sched_run_job_queue(sched);
> +	if (drm_sched_entity_is_ready(entity))
> +		if (drm_sched_can_queue(sched))
> +			drm_sched_run_job_queue(sched);
>   }
>   
>   /**
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 754fd2217334e5..09916c84703f59 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -559,7 +559,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>   
>   void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
>   void drm_sched_job_cleanup(struct drm_sched_job *job);
> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> +void drm_sched_wakeup(struct drm_gpu_scheduler *sched, struct drm_sched_entity *entity);
>   bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
>   void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
>   void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
> 
> base-commit: f415a6078f640ab15bae34d3c6a1d8e6071363de

