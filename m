Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A503D97A088
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 13:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2000210E045;
	Mon, 16 Sep 2024 11:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HjRm2IKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051E510E045;
 Mon, 16 Sep 2024 11:50:38 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-374c3eef39eso2630384f8f.0; 
 Mon, 16 Sep 2024 04:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726487436; x=1727092236; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6jGRvXVMGdePQHhG3fO+IlX30rkXzl5Uut8rlTChYPk=;
 b=HjRm2IKv1ByMH4OEUXb2XQAaF+Fh8hUBZkWZsNJGOfqsFNrhCgQ8VTDDcjlhmJrXVw
 R1EVBh00jrAIkmm/2maV/nQPw96aGN+ICohJ0eEq836PIwiRI48jjBfVuR7zlgy0xevN
 xD8ccFGJFymYckhO9ioDX9c5z7aQZzxQGVX1GccyzK7Xs4fMb9Ee+3HfZNeD0Pk8pERY
 JJ85vSyc62We3p7IGxThUg3xBML0aXaEy1wYO+K60wxfQuBtF1Yn7FtbsY2fGX/A/AeF
 Th3XCm8oC4lt8iLPCCkWYo0Rk6xsTrvG+gxSdqSgVoodUBkxfFQPamtF1vyZG+9T3dZj
 UIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726487436; x=1727092236;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6jGRvXVMGdePQHhG3fO+IlX30rkXzl5Uut8rlTChYPk=;
 b=LwAfp7q+HVPr+I/tqOwZHuP7xJvumf1O0bTcqxi9cjkYlbGelUdcc4fwOQ5v/VJf93
 RELiU9Q/1IgMkUArU7d8/qUHDKgrExkDDcvHID1wsy/cqNneWX+w4cobCBgtz0deiv6h
 9/GEwGPsI9zys1qSB/eifmd2UiEbyYHofK2dakIIH6snrxKlzro/uIFVTUeFFygenpGB
 cvehkz3HSqvEF1jHsMXDgUwgl1Jtrgh22zxBeGUu+K/1eGM2fm+FExObAmS55r/UtogY
 v/LGqr1Tsr3iv4uWWGmgGe6eJH7CcpUsFuBCfMiI2j/1wboj34V4oIGtwt8nN8ZflTA+
 BgcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHCGMlkvPAFtcVWgpekZUaPwEUdJ0q2qebqtd/mY3e5Hg74dRkjH6VyGVPyvutqEmWg+BO+liB6I4t@lists.freedesktop.org,
 AJvYcCXXCniZZBIBXHG5kSmoiyaIx5O2SboLJf73ThBdHc4gFc9evjARGJR7mC541QnyZQXZ9RdXIWko@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIjqwEDsi/GOfjRHGAE+Iuu1dUhtMDg+czxcQvOSLCuyEMOzWo
 NUO6UaDIsiO/AAKvdSZDToWDpSeOkA7QIhsLevJ1jx8tKr0obVBr
X-Google-Smtp-Source: AGHT+IGu2LuFR3m8+u+RM+tFl4Oaovk7CjDKfOsDhjAn5A8AsspZvgbhE5wJsq0qfRqGbNXhgeKSqQ==
X-Received: by 2002:a5d:5747:0:b0:374:c4e2:3cad with SMTP id
 ffacd0b85a97d-378c2d5b237mr7888045f8f.52.1726487435239; 
 Mon, 16 Sep 2024 04:50:35 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73f97d6sm7025317f8f.52.2024.09.16.04.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 04:50:34 -0700 (PDT)
Message-ID: <e6fcc9c2-01ea-4cb1-9df3-b015227bdced@gmail.com>
Date: Mon, 16 Sep 2024 13:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/sched: Optimise drm_sched_entity_push_job
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240913160559.49054-1-tursulin@igalia.com>
 <20240913160559.49054-5-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240913160559.49054-5-tursulin@igalia.com>
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

Am 13.09.24 um 18:05 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> In FIFO mode We can avoid dropping the lock only to immediately re-acquire
> by adding a new drm_sched_rq_update_fifo_locked() helper.
>
> v2:
>   * Remove drm_sched_rq_update_fifo() altogether. (Christian)
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++++----
>   drivers/gpu/drm/scheduler/sched_main.c   |  6 +++---
>   include/drm/gpu_scheduler.h              |  2 +-
>   3 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 6645a8524699..aff79055643f 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -514,8 +514,12 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   		struct drm_sched_job *next;
>   
>   		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> -		if (next)
> -			drm_sched_rq_update_fifo(entity, next->submit_ts);
> +		if (next) {
> +			spin_lock(&entity->rq_lock);
> +			drm_sched_rq_update_fifo_locked(entity,
> +							next->submit_ts);
> +			spin_unlock(&entity->rq_lock);
> +		}
>   	}
>   
>   	/* Jobs and entities might have different lifecycles. Since we're
> @@ -615,10 +619,11 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   
>   		atomic_inc(sched->score);
>   		drm_sched_rq_add_entity(rq, entity);
> -		spin_unlock(&entity->rq_lock);
>   
>   		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -			drm_sched_rq_update_fifo(entity, submit_ts);
> +			drm_sched_rq_update_fifo_locked(entity, submit_ts);
> +
> +		spin_unlock(&entity->rq_lock);
>   
>   		drm_sched_wakeup(sched, entity);
>   	}
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index f093616fe53c..d0ee0ba75a86 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -163,14 +163,15 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
>   	}
>   }
>   
> -void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts)
>   {
>   	/*
>   	 * Both locks need to be grabbed, one to protect from entity->rq change
>   	 * for entity from within concurrent drm_sched_entity_select_rq and the
>   	 * other to update the rb tree structure.
>   	 */
> -	spin_lock(&entity->rq_lock);
> +	lockdep_assert_held(&entity->rq_lock);
> +
>   	spin_lock(&entity->rq->lock);
>   
>   	drm_sched_rq_remove_fifo_locked(entity);
> @@ -181,7 +182,6 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>   		      drm_sched_entity_compare_before);
>   
>   	spin_unlock(&entity->rq->lock);
> -	spin_unlock(&entity->rq_lock);
>   }
>   
>   /**
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index a8d19b10f9b8..38465b78c7d5 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -593,7 +593,7 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   				struct drm_sched_entity *entity);
>   
> -void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts);
>   
>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			  enum drm_sched_priority priority,

