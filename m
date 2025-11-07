Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EDFC40692
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FD310EAF1;
	Fri,  7 Nov 2025 14:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Gk2GyG1W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40D110EAF1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:42:24 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-477632cc932so3639255e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 06:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762526543; x=1763131343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7prOgZ8tel5yXZ1o8muDswYilsSv/7VLhnLi/dbDFKk=;
 b=Gk2GyG1WWRE+bdeww/utah2K+rrUZvZ9iGudHfRaPrXgyoHNpI1zIkb21WudJ16wb3
 XZp1Xc47hDvP14/IpiD2zbFb2ymbAJpu4eKNA8ngaZFWy3zRgQI33Gh5nLPiSeFLn/Ad
 ez97lUW9uVJsw4b4Z1UE/E7yadnHwzMFqb8RuKqp+eWDbAlLSy+yEkpO0/W1PI5waIqO
 lzb490B9to4S/Q1cc6mPgArR6jNODoye+CRLA7bbEWbSRyj7fFLOkDk5d0T9k3+kR8Yw
 1dxXtlKC8TgTdO3T4xoE2GvWsiLuitMWDdcCjwJDQ8mgGmdCcLR8EMsYkB+ziqB4dpoR
 CVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762526543; x=1763131343;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7prOgZ8tel5yXZ1o8muDswYilsSv/7VLhnLi/dbDFKk=;
 b=A1uUpO+ZDjlfD++qazjIajQP7/aGhOUJ2L3LULs4vzTcRAc8T1GwLQkB7pi0kQgC+k
 iSmlRQVTy1B3qKeqtMWC5qmcK+UX9BXEs+tH02W6k1M2U7gpWDkok5uU9X75QyC1beyO
 xpD9q3ba1++W4aajZZdu5XTmR+8sa8c2PVVzk4XNCUfAEFXwImW18i5vIRIODqSxC/0m
 obyH+mTI3YjCVkqDswVDHWvTkJRs7IVesBVhe4IRfOWo6VOOaPa0PDtpFX4uZMjr4/BZ
 vqGpWt+hw0glk1QBUTHS7zlLpB2jbMny1//y0OWiF65/tfArjTexcOaTBZdim4Pp8r+p
 08yg==
X-Gm-Message-State: AOJu0Yzhg/Qpdvc1hSlW9XWyqn7uXldZdVGA+5nfm5AQglKhcvYngN5q
 UX34aln4qZiuapUeQAlMq2eH4FgTBP8djbghY+3+hBO7YQhFHjJrrjf3aK0SfVNWR38=
X-Gm-Gg: ASbGncs+cLQ2vL87HwFGcBvegr6JFmZjcwqP+ZgBiFzYUHbHsi0KUWNpxQTPzrx8RwT
 4A57D1fq9bOoJIGvAWQAvM7j78PExSNziuBRwXOI5p1l8LAhcvpd748NjC6WWXKfEF7596N6Ath
 AgFcPH1sYeYXhRjQP9WCoCTyw+59MMcWpvd1HZvC7TESSF6cSn119D20i6lO5BnM4tXD68SjfZX
 cw+1fecHeBm9NaDDxEOFlILd0Z7OMNnx39HiQFcD8/JEUWMECC/6+BpLs7oQz0HFZSE+qaEodhb
 gkn7L1eM/d2ZI+WhmntdVd45IM8xFDQccVs47fbRCAvQ4lqQi6/K0WbwSZP20l+3UqQjwCtbSm9
 oM/bmac1XLJFaM5/7cP6y+Im22cPCmG0c890zg9xzUuD9Gu6/tKWgJYHiIW4qWpl8rYO3owDYHL
 MSliuZpF7EC7UQaXB5biPGSraUN6CgsftvtbSBiw==
X-Google-Smtp-Source: AGHT+IFkEE4UDmmRrIx59Og0BV5rIttUH98hXp8gThHGY47mG53iV90+MszFRauDaM04dctxkf46hw==
X-Received: by 2002:a05:600c:3105:b0:477:63db:c718 with SMTP id
 5b1f17b1804b1-4776bc93508mr24815935e9.16.1762526543053; 
 Fri, 07 Nov 2025 06:42:23 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4776bd087b1sm61344375e9.16.2025.11.07.06.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 06:42:22 -0800 (PST)
Message-ID: <c4a10ad7-22c0-412c-a456-d2dd0f049ac9@ursulin.net>
Date: Fri, 7 Nov 2025 14:42:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Don't crash kernel on wrong params
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251107125508.235449-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251107125508.235449-2-phasta@kernel.org>
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


On 07/11/2025 12:55, Philipp Stanner wrote:
> drm_sched_job_arm() just panics the kernel with BUG_ON() in case of an
> entity being NULL. While drm_sched_job_arm() crashing or not effectively
> arming jobs is certainly a huge issue that needs to be noticed,
> completely shooting down the kernel reduces the probability of reaching
> and debugging a system to 0.
> 
> Moreover, the checkpatch script by now strongly discourages all new uses
> of BUG_ON() for this reason.
> 
> Replace the BUG_ON() in drm_sched_job_arm() with a WARN_ON().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 1d4f1b822e7b..3bf4ae0ca4bc 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -857,7 +857,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>   	struct drm_gpu_scheduler *sched;
>   	struct drm_sched_entity *entity = job->entity;
>   
> -	BUG_ON(!entity);
> +	WARN_ON(!entity);
>   	drm_sched_entity_select_rq(entity);

void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
{
	struct dma_fence *fence;
	struct drm_gpu_scheduler *sched;
	struct drm_sched_rq *rq;

	/* single possible engine and already selected */
	if (!entity->sched_list)

Still the same end result.

I believe best practice is to simply not have BUG_ON's followed by null 
pointer dereferences since they add no value. Ie. it should just be 
removed and not replaced.

Regards,

Tvrtko

Regards,

Tvrtko

>   	sched = entity->rq->sched;
>   

