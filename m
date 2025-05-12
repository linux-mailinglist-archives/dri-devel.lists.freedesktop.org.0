Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB45AB30C6
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 09:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067B710E2EE;
	Mon, 12 May 2025 07:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="mH7tNZWs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0863B10E2EE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 07:52:32 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-440685d6afcso46326405e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 00:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747036350; x=1747641150;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y6dV607UHZMlya+8fS0IcgPOSDSCXxkhRJBLWphOTew=;
 b=mH7tNZWszaOgjc8guoyL9KQCwlEZTmfLaknqFE/UPkpMCjSxZ31LdVJRisr3ueoO0q
 vQCZGQUw6NADyxYl9tBAoX2KX6XHi1bCqhhUG0vwXRluC34zrezyXz8VoMaw/nsiihxM
 2ZDLyrbojYlsxlTGn+iVc3HQovS/b3jZ/BOGO4mVsXgYh1a1uTev7mW9vg4BZgvrHbVr
 FkN7DkoCgcWdctzS1nW/SsE6M8HdcUIGIGDHluoqe6DOUZBpB4bCI1MUbTid1cbxEzyT
 MQNwwySF+zXNpnJ7siXtE7sAalQJ1/prDNjDHYnS443+faXyPS/sYf3grUnmu2Htugyh
 A39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747036350; x=1747641150;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6dV607UHZMlya+8fS0IcgPOSDSCXxkhRJBLWphOTew=;
 b=HPfYSerYuvbrmN3hxP8ThrEW446gW7J1HOY9IdNPxmIWs6/GqyA2AXCbkpcJwuKM53
 542rBHUPEeq1KKZUBnYfkteFESpnswDN6i18Aswsc9rS6+0mXu43zOnVwia2HiqxSWiv
 9QPSX6asHpysVfj/blgVt2s699dxhboQEnWCOym4Hs6zO7k32hLmgZNTYEr38rbOED9J
 iU2lRV9DZaj9/fjzim1Yx2OQa7X4ERJHdP+71vXXRq+p4kL0Nxc7s6xllsAvEIHplhag
 0kqyKTFIJ+as3q1g0GMULMm9weNgMB6xvPKdsba2tpOeCMRYRGUSiJCVhih7BTRMuto/
 YLUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz/avKEVZ30XahrI34PyB6EDFkpGsU2EO9wS/h3m1SkHAVAQ91t70elWPejH0mJRQl5r/3lmnrvS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV9/SYN1g8QZCRxGWt76PTYAkXqdmpixNJ3HhnJ1p0Z1+skfzS
 Ys1d8quCl29aghfnfr0ksFab27jCTm7cfT3z9ouIiH4ZjgsrTsy4ElBChZZbp7A=
X-Gm-Gg: ASbGncvl1zvV/8FLPMbAEJ0BYdP3LbURU20RppDOIbFEPkNMPxkjRG6mZzxBSltsvRt
 Q+Av2A1+xJ8fHF4A8Uj/Bg/dn0p7WZ2JJGHS0uJ2Y3m/Jd02DxzNaL+/h4l8LK6boAnt22qDuqA
 gZm7miuLHU/xQMuBgqWzkL6bL+SAmMSNt55MuDUgwdVRvVwv0O9XJWEbe39ZbCP4lde0BlUVTuh
 jutNtkB072joA865rbDlfzX4p6fOXMsRSqZ69bYBHdiD3YGmJ+7mejPFVPjvCClY55H47LPLchl
 3WphrTiUZv4somPO4899G0TnrtJ579jz40p5SayD/NOAW+/O+r+hpn1aoztCoJtOxQ==
X-Google-Smtp-Source: AGHT+IEcQ2vTdjkVJJfeqWwpeF5uH1q35HnkAVFXZV3V/18SxGeFROcAXX7AmB5sQ2NYa+ldDl7y7Q==
X-Received: by 2002:a05:600c:b93:b0:442:e109:3032 with SMTP id
 5b1f17b1804b1-442e10930dbmr53828855e9.24.1747036350182; 
 Mon, 12 May 2025 00:52:30 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67ed1c9sm116203075e9.21.2025.05.12.00.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 00:52:29 -0700 (PDT)
Message-ID: <a3b3e8d2-ada8-4b34-91d4-e9dc22b83b46@ursulin.net>
Date: Mon, 12 May 2025 08:52:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix UAF in drm_sched_fence_get_timeline_name()
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250509212936.490048-1-robdclark@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250509212936.490048-1-robdclark@gmail.com>
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


On 09/05/2025 22:29, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The fence can outlive the sched, so it is not safe to dereference the
> sched in drm_sched_fence_get_timeline_name()

Funny I've been working in the same problem space:

See 
https://lore.kernel.org/dri-devel/20250509153352.7187-1-tvrtko.ursulin@igalia.com/

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/scheduler/sched_fence.c |  3 ++-
>   include/drm/gpu_scheduler.h             | 11 +++++++++++
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index e971528504a5..4e529c3ba6d4 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -92,7 +92,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>   static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>   {
>   	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> -	return (const char *)fence->sched->name;
> +	return fence->name;
>   }
>   
>   static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> @@ -226,6 +226,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>   	unsigned seq;
>   
>   	fence->sched = entity->rq->sched;
> +	fence->name  = fence->sched->name;
>   	seq = atomic_inc_return(&entity->fence_seq);
>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>   		       &fence->lock, entity->fence_context, seq);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 0ae108f6fcaf..d830ffe083f1 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -295,6 +295,9 @@ struct drm_sched_fence {
>           /**
>            * @sched: the scheduler instance to which the job having this struct
>            * belongs to.
> +         *
> +         * Some care must be taken as to where the sched is derefed, as the
> +         * fence can outlive the sched.
>            */
>   	struct drm_gpu_scheduler	*sched;
>           /**
> @@ -305,6 +308,14 @@ struct drm_sched_fence {
>            * @owner: job owner for debugging
>            */
>   	void				*owner;
> +
> +	/**
> +	 * @name: the timeline name
> +	 *
> +	 * This comes from the @sched, but since the fence can outlive the
> +	 * sched, we need to keep our own copy.
> +	 */
> +	const char			*name;

With drivers such as xe, fence->sched can indeed be freed, but so can 
sched->name, so it is not safe to store a copy of it. AFAICT only safe 
way is to simply give up on the real names for signalled fences.

Could you see if my series fixes the issue in your use case? I *think* 
by using the driver/timeline name wrappers I did catch all external 
access points and made them safe.

Regards,

Tvrtko

>   };
>   
>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);

