Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0990A972B14
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 09:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C08910E731;
	Tue, 10 Sep 2024 07:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l5wqoJ/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FA510E730;
 Tue, 10 Sep 2024 07:43:40 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-374ba78f192so3070924f8f.3; 
 Tue, 10 Sep 2024 00:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725954218; x=1726559018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FrlnuOGbE3/jD0mKWDJ0SbkbzsZFxQ0jXYoeSrOzRTs=;
 b=l5wqoJ/POPWEpLncZjgHqeS8okTxeg345C2RCxKX0PzZHgDnTrDphOXsBydRefQZlp
 cS+GDEipqmliaixO42kTgYcjXyhfhuTKFLckomfGTVxfXICxXmsUP0YeQL2UaCBP+6I0
 EouSGNpOza5zXdPhgHjY+nzlGQNmqROFFW0HJQSVh6fzG+Bxqrl2X5DytkLSTYiMJjIh
 /YCY2YS49dcj+x8RHBNoSv6W0LGsIxaQ2eK8IpgEgBVYkwqsDl73EySfEEedjzb8UEw1
 gqGoh2Rqi92L1w1ykAmdxDMucplH7AZCwG21FOKx/s7pdc0kWN9+UzukSOUG8muV1KkW
 uZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725954218; x=1726559018;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FrlnuOGbE3/jD0mKWDJ0SbkbzsZFxQ0jXYoeSrOzRTs=;
 b=ECC2FrfNQdkSB4yyYtfNZe7qFp2gnlQjRZ+6YlU7lDwe5MQWwadK3pf37kaMJD0LyK
 Y2GFHX9/okllGbw0AT9TggNnBAn7A3u71SGjGzvfQqXhvb9KIeGfbexWWk3h+z2MxeLF
 78VDsEw6W7ivGIEEn/LZctDEPwvOHukNOrlltc/GiYSrZnL4LK78Z9SaNpzbF8TMiF8J
 jEOA8LsxDkGPKcf546qvICPUofqRlD9fe6CAobxGz4fXWzOsPkebbgbU1L4aOJbbZ3vg
 hYwIcKuIywd00LrBIxjBZtlQp/lgaFLq4DXW4lUBG22xMdUap5ReX8rbQihzLPiUIXer
 LsEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWitKzIlOXI87nS2hzmeNONlxx82xeimviDGRB2ecIWx7xF3MTQP++4MGGgX0lIt+9/cOZNH20eqeuv@lists.freedesktop.org,
 AJvYcCXDJroMuk0u1kvm0NYR2q/nXC2YvpciXHG61MRScI50i9J5BskpywTU+z2JPT/hbylTfvij4GmN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiPoZ1H4ONHASqk8v1aHvplV8VhroVLZl2izhza4LtKE34z+Hd
 EmZraT4pC/P9YVIqySZGE0S9AxQklLMjnQTBXOnQKtXqFJM5nc5p
X-Google-Smtp-Source: AGHT+IGCG6IFrUeothqN13k/Kz4AkFspY4On6g/qAPTWlFA/ip2SFfSLWyD/6dgQYLU7cFiSfRs6WA==
X-Received: by 2002:a5d:668b:0:b0:371:8e0d:b0fc with SMTP id
 ffacd0b85a97d-378896122afmr8418493f8f.35.1725954217618; 
 Tue, 10 Sep 2024 00:43:37 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564a2a5sm8043976f8f.17.2024.09.10.00.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 00:43:37 -0700 (PDT)
Message-ID: <6c188161-9ac9-4093-b257-cbaf0146a02b@gmail.com>
Date: Tue, 10 Sep 2024 09:43:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/sched: Add locking to
 drm_sched_entity_modify_sched
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Stanner <pstanner@redhat.com>, stable@vger.kernel.org
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-2-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240909171937.51550-2-tursulin@igalia.com>
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

Am 09.09.24 um 19:19 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Without the locking amdgpu currently can race between
> amdgpu_ctx_set_entity_priority() (via drm_sched_entity_modify_sched()) and
> drm_sched_job_arm(), leading to the latter accesing potentially
> inconsitent entity->sched_list and entity->num_sched_list pair.
>
> v2:
>   * Improve commit message. (Philipp)
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: b37aced31eb0 ("drm/scheduler: implement a function to modify sched list")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: <stable@vger.kernel.org> # v5.7+

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 58c8161289fe..ae8be30472cd 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -133,8 +133,10 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>   {
>   	WARN_ON(!num_sched_list || !sched_list);
>   
> +	spin_lock(&entity->rq_lock);
>   	entity->sched_list = sched_list;
>   	entity->num_sched_list = num_sched_list;
> +	spin_unlock(&entity->rq_lock);
>   }
>   EXPORT_SYMBOL(drm_sched_entity_modify_sched);
>   

