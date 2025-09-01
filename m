Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AA6B3DDFA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 11:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3DD10E3E3;
	Mon,  1 Sep 2025 09:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="rqUsbGxL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4E910E3E3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 09:20:51 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45b7ebe667cso23957285e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1756718450; x=1757323250;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/i2gIUiAfrzVhbMVW7hgRdlp0nqG5Gm3oFBzPVSe5+Q=;
 b=rqUsbGxLi+axD8J79f4kS5pRW6G10pTVePM6FrtkaRLspy0pUB1gIIVZJKwch/9QRi
 jccFz/AvCtcE45aZUCHpPLo7NmG2uTEyEE3mEllshDUntlgIAJyshGgG3l7IHTEiAeJo
 qKPAdcs+KCSRVFIwzc5zy9bLTXSF7KtfaBioQCrJi+8q688FgQC+3TVK96n3bycdavZU
 eXeoyQqVI+Wf252hDAMyJ7Z/tuyPKP7z+AJzhl/bOzBjrENi+d1CJP3zOo29iaqo8hB9
 /56ySg0z5gPJkHB9MIKawa/GiMxoUViwSQOfphMieWrcqR+jlQV63RQtPuhRVrCAJkBj
 xfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756718450; x=1757323250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/i2gIUiAfrzVhbMVW7hgRdlp0nqG5Gm3oFBzPVSe5+Q=;
 b=F21BxIJ+znuD07rnoEecRIBENna3Km9yJkb1eiSGzO5wV0SlISlbN8FRFT/moyn93x
 d5fSqyyF3OFJewrgg9JYjcga1f6QOnTq+CJRBIOX7gpZJ9NECBcZU2Zg0eETVcfomqdS
 wek2sVWIXf3Xkr9Ttaab7IpgdWrwJkuHnbyfO1IdWjgp0t9EoMP2t4hr9UHCFAgLGZ1g
 +pqRWzhnsF3Szwh5SEBvqCx9ZoNwONln8FOZtU32/5o3E/zOumIryIgx8mIWxGX0gyev
 vjgC2EIBCrnUhAStQuCtKHqmyTaBt4Ry2ZJ6GJSXOilJJrR49zckuVi3m8D/AJCaGB4b
 Zy8A==
X-Gm-Message-State: AOJu0YwtsPgR2m64csPCgr58gj9r5RBr9SbNrvAlAca843RA109vIF6R
 b6atqsFWbCuW+V2Buz5j8QkrzHBd1zJ8C1L+FuDGH/Ng9X1wvL4Mgb2vVhxVhFJOCIY=
X-Gm-Gg: ASbGncvyXZwIw49cHHxTMpl+S86leHR7D5nVroUfBLoQEjwAYG7khUqU6XlPsNXG7dc
 OlCkOYqZeihqzi7tF6LP0DpgxIN37lNW0YR+o5ZrDcZW6RMnDtbveyUBL7wmUo0z1qHSToMbAhM
 L6pc1FacWg0J9qM8V2cfNAfpqizLrOndNM20wtocPbwnRk6sBqMiE90grYGoqBfWmlP45XCOqwL
 +NXXr/rUvDT5HIk6PGWAebOos2xApmOVx/4ixV9FFtH3XQbZnMHSGNQjQlEiwZlfOk0TnE7Aldn
 yapCD1dtYdutcVqvJRzzO5yUSfdLGb5uPT3OA1do60pJPNisggEklZq8E3zCDa7oVMAG9FEpIUf
 cZGwUVtmYq70ei0b6CKye1segev7FU+Q5M8UNZm6JBv4GSeZuPyZEq4Ji
X-Google-Smtp-Source: AGHT+IEH7k+cTl4AENULt4iJEeeg1UjQsogXwQIwX4M0gFMtTFyb8n5rmxYFOvzuieQyQ8wYdo+xZw==
X-Received: by 2002:a05:600c:a47:b0:450:cabd:b4a9 with SMTP id
 5b1f17b1804b1-45b8557ca38mr50081145e9.29.1756718449534; 
 Mon, 01 Sep 2025 02:20:49 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d15f7b012csm11224695f8f.63.2025.09.01.02.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 02:20:49 -0700 (PDT)
Message-ID: <abb776bc-5b13-4db7-9421-59259119b859@ursulin.net>
Date: Mon, 1 Sep 2025 10:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/sched: limit sched score update to jobs change
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
 <20250822134348.6819-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250822134348.6819-2-pierre-eric.pelloux-prayer@amd.com>
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



+ Tomeu and Oded

On 22/08/2025 14:43, Pierre-Eric Pelloux-Prayer wrote:
> Currently, the scheduler score is incremented when a job is pushed to an
> entity and when an entity is attached to the scheduler.
> 
> This leads to some bad scheduling decision where the score value is
> largely made of idle entities.
> 
> For instance, a scenario with 2 schedulers and where 10 entities submit
> a single job, then do nothing, each scheduler will probably end up with
> a score of 5.
> Now, 5 userspace apps exit, so their entities will be dropped. In
> the worst case, these apps' entities where all attached to the same
> scheduler and we end up with score=5 (the 5 remaining entities) and
> score=0, despite the 2 schedulers being idle.
> When new entities show up, they will all select the second scheduler
> based on its low score value, instead of alternating between the 2.
> 
> Some amdgpu rings depended on this feature, but the previous commit
> implemented the same thing in amdgpu directly so it can be safely
> removed from drm/sched.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 5a550fd76bf0..e6d232a8ec58 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -206,7 +206,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   	if (!list_empty(&entity->list))
>   		return;
>   
> -	atomic_inc(rq->sched->score);
>   	list_add_tail(&entity->list, &rq->entities);
>   }
>   
> @@ -228,7 +227,6 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   
>   	spin_lock(&rq->lock);
>   
> -	atomic_dec(rq->sched->score);
>   	list_del_init(&entity->list);
>   
>   	if (rq->current_entity == entity)

LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Only detail is, I did a revisit of the scheduler users and it looks like 
the new rocket driver is the only one other than amdgpu which passes a 
list of more than one scheduler to drm_sched_entity_init. I don't 
*think* it would be affected though. It would still pick the least 
loaded (based on active jobs) scheduler at job submit time. Unless there 
is some hidden behaviour in that driver where it would be important to 
consider number of entities too. Anyway, it would be good for rocket 
driver to double-check and ack.

Regards,

Tvrtko

