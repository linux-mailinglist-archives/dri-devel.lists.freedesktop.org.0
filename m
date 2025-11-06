Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC19FC39F9F
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 11:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCF510E86F;
	Thu,  6 Nov 2025 10:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="RSQ6VQfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FD810E86F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 10:00:16 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so570210f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 02:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762423215; x=1763028015; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4/Zq2ZMLTkW/3rjXrb4929ZqxG9YuHUsxu8QuLD1NzA=;
 b=RSQ6VQfh/AYyEpTQhCp8huyTeIe2Wf1Z0LYy3NDgv90L/dRow0FSyfO5MEdvLXXPMJ
 Ur5G4BPRCrULQKTI9eCqbdKw9WNKrLcSyHj4jMtD1I8773JqAcAFXSZ45guyz5MANcOB
 XzXvAPYcXL2tS6ghol3PFwcdasbA/hf65X9gzfOB3+89scu2opj1HgVqGQOkmCZjFzkD
 GL0/zKF0q6jb37QCdDVLYGoNyFw8dxsLasULD1Vm53TgoR2cy7O3z2YO4OcQf+gxw/gV
 s6L9Kbg+U7dcUkYgN0s1UmKlcH70nZaUK8C7UatAVIRhKy/nSEW7aafj0xO2UzW0Mvt+
 k2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762423215; x=1763028015;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4/Zq2ZMLTkW/3rjXrb4929ZqxG9YuHUsxu8QuLD1NzA=;
 b=suNl3DUng6IllnPMtdhP3tYwcInmZqQMZMe3EcpgbLIQFswRpwkpkFadKBZGe2UJT1
 +gV7ruiCuQ02mZDmdlIzyyfiG8ytlbwhxNk6CD3YboqHfVAzkLkEC/QZT1rGgHftkKc+
 26oRjJpQ3gQvZGYFRV9hJyo2O3CMm1AGY6nZKAcZb1K3tmR1n2K2kmdyNf7lTqn22N1Y
 N/wdNRP5pmAncSsbsjOjAIztKC1u4R/xF7ydrbfiJ33acsu1C+x30YZzBWvkOrnsnsSB
 +Y5heNOL25nDpAuZ18Ld4Sy+OhMXYFX9tKMAdOV2ik2V4IIhbMF5YENsQZ/rgfDKwkry
 8LUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBSJei0x7NpIqqb3o4it5G6nWlBD9B6GBI5NxNt4Z0mbKjHAMEY6q0OEoC/Xr2T/Q01F6NADMtEOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7mTnKom9UtbHqjhbuMmVAe+fIW2QSD2S7q4R/FBcO9kfv2q0m
 P+CDxgDxp30Unbz17kGY2Vl1arQafGqwsifDeVsIN7Mz7tm5pUjtU0YrbeHOa0zlNA0=
X-Gm-Gg: ASbGnculPLnDKjuf3vsK2GTwUX0NblqAoZzIcRm8pVW6RtFT/c6o2/qLDabUsoUnEsC
 plqh8FKPAl6xoQVElFGm7SBerAAQV9va/4Nc7N37JG1w9kT+L7ZfyXG3Teib2yWerr5L1aB6gcD
 Y9cOkQzRIRvoe5vAJe1zc+n8w6Gss+SUkAuBZdMkwvCgb9fGY3cH50Jw7am5VHS+P31qvfuBgMD
 eLAdrV9UqXPHloRfrImY33NuJdt9SsiOXhZ7symnANMB7G4UQCWTSjiBuAio35c++bf/ydVQitx
 3iVQi14hjsSsKDQOf8InA4iexo7wPRzFUhUHVrC1lOQ1+NwjFGvDqkpoPlAB+Z4o76qGxsddT6F
 BTJdMYisDNTBflbXj5dPqwwljkM0a9n50QjYiRRvmqey++TmTVgNf0rwLxpKgfrvUJix4uIq3hM
 /Nl6R4wI05xHshExdh82cmdb5Mo5M=
X-Google-Smtp-Source: AGHT+IEZKVyRG59cakGUG/uu7olGLVJjMN0xfbpmUq5+ampqbuf/q1ePNFMJ6cguRcdgyKCUSlBC+w==
X-Received: by 2002:a05:6000:210c:b0:429:8daa:c6b1 with SMTP id
 ffacd0b85a97d-429e3308887mr4652869f8f.38.1762423214827; 
 Thu, 06 Nov 2025 02:00:14 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb41102bsm4118122f8f.17.2025.11.06.02.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 02:00:14 -0800 (PST)
Message-ID: <9e5abc5f-1948-4b18-8485-6540f84cdfd8@ursulin.net>
Date: Thu, 6 Nov 2025 10:00:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/amdgpu: increment sched score on entity
 selection
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251106093933.18859-1-pierre-eric.pelloux-prayer@amd.com>
 <20251106093933.18859-3-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251106093933.18859-3-pierre-eric.pelloux-prayer@amd.com>
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


On 06/11/2025 09:39, Pierre-Eric Pelloux-Prayer wrote:
> For hw engines that can't load balance jobs, entities are
> "statically" load balanced: on their first submit, they select
> the best scheduler based on its score.
> The score is made up of 2 parts:
> * the job queue depth (how much jobs are executing/waiting)
> * the number of entities assigned
> 
> The second part is only relevant for the static load balance:
> it's a way to consider how many entities are attached to this
> scheduler, knowing that if they ever submit jobs they will go
> to this one.
> 
> For rings that can load balance jobs freely, idle entities
> aren't a concern and shouldn't impact the scheduler's decisions.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 21 ++++++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
>   2 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index afedea02188d..953c81c928c1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -209,6 +209,7 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>   	struct amdgpu_ctx_entity *entity;
>   	enum drm_sched_priority drm_prio;
>   	unsigned int hw_prio, num_scheds;
> +	struct amdgpu_ring *aring;
>   	int32_t ctx_prio;
>   	int r;
>   
> @@ -239,11 +240,13 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>   			goto error_free_entity;
>   	}
>   
> -	/* disable load balance if the hw engine retains context among dependent jobs */
> -	if (hw_ip == AMDGPU_HW_IP_VCN_ENC ||
> -	    hw_ip == AMDGPU_HW_IP_VCN_DEC ||
> -	    hw_ip == AMDGPU_HW_IP_UVD_ENC ||
> -	    hw_ip == AMDGPU_HW_IP_UVD) {
> +	sched = scheds[0];
> +	aring = container_of(sched, struct amdgpu_ring, sched);
> +
> +	if (aring->funcs->engine_retains_context) {
> +		/* Disable load balancing between multiple schedulers if the hw
> +		 * engine retains context among dependent jobs.
> +		 */
>   		sched = drm_sched_pick_best(scheds, num_scheds);
>   		scheds = &sched;
>   		num_scheds = 1;
> @@ -258,6 +261,11 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>   	if (cmpxchg(&ctx->entities[hw_ip][ring], NULL, entity))
>   		goto cleanup_entity;
>   
> +	if (aring->funcs->engine_retains_context) {
> +		entity->sched_score = sched->score;
> +		atomic_inc(entity->sched_score);

Maybe you missed it, in the last round I asked this:

"""
Here is would always be sched->score == aring->sched_score, right?

If so it would probably be good to either add that assert, or even to 
just fetch it from there. Otherwise it can look potentially concerning 
to be fishing out the pointer from scheduler internals.

The rest looks good to me.
"""

Because grabbing a pointer from drm_sched->score and storing it in AMD 
entity can look scary, since sched->score can be scheduler owned.

Hence I was suggesting to either fish it out from aring->sched_score. If 
it is true that they are always the same atomic_t at this point.

Regards,

Tvrtko

> +	}
> +
>   	return 0;
>   
>   cleanup_entity:
> @@ -514,6 +522,9 @@ static void amdgpu_ctx_do_release(struct kref *ref)
>   			if (!ctx->entities[i][j])
>   				continue;
>   
> +			if (ctx->entities[i][j]->sched_score)
> +				atomic_dec(ctx->entities[i][j]->sched_score);
> +
>   			drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
>   		}
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> index 090dfe86f75b..f7b44f96f374 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> @@ -39,6 +39,7 @@ struct amdgpu_ctx_entity {
>   	uint32_t		hw_ip;
>   	uint64_t		sequence;
>   	struct drm_sched_entity	entity;
> +	atomic_t		*sched_score;
>   	struct dma_fence	*fences[];
>   };
>   

