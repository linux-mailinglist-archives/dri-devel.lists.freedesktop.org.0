Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C94EC31E7B
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4915C10E630;
	Tue,  4 Nov 2025 15:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="rRvzELIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE7E10E630
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:45:16 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-426fd62bfeaso2360533f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 07:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762271115; x=1762875915; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MU3pD6Ak1vTLZlOdxmRnnMcgwMZHtJbCz25e7swEzM0=;
 b=rRvzELIVZjAbtza++vutSQSpZtnpaWXaQmfA/mOmSfnosOsl8+j9fjKa0x3fNpefVp
 No+tbDemI/9bcO3JptYXTkkqDFSQVUDyb91JoPBUI1CBUH95w/xujeovcr/Qax9Xtnrg
 sgF4hNhA/gm+KbGtGZwMlj3i0tsQ7oAl7BtLTRC27iPlBf/y7lashK45+ygwZfHhop7V
 phEqr42HlNmIIHSabYJhJAQ266h66e/ULeg2uLHrnPu2J1fi28whEyVADC0AXBP+yWE8
 OMFXvMR6ER+nV0TVYEExstFi3Uieyp/Ku8YhtFrPAeOdB3zuuHFdR1z+fu3G36txlJmJ
 57wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762271115; x=1762875915;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MU3pD6Ak1vTLZlOdxmRnnMcgwMZHtJbCz25e7swEzM0=;
 b=povr10ZMHxO1jAKQtWmp3a1y3DmSYYkOrINuW5mCAujnx7jkAoGlete4zIaHLzphjS
 Tiz1cNPJekj11Uft1vxdsbR06Yw0iZc+z4QQdjWKv4C9M6hJ+xktndjQamTzzXKG6fFo
 F8XU62oeILbuXhr9Gq6XZbsZ5bgFy96Vub47tgzmrblsUotcKfkQgGAQPwPsUUmKqfSy
 xXazS92xbYoZktxeiYiJ1BnfYlZTzzxgnRiPSJjf/sHaZOBVMcvZNueqK+cV5s/zm6YZ
 Dv0J+Aic/B4eO05KBUxydDjl8CCUXqDRRArL1IpTH8quhdY07jii+bzzaZdHL9LG7Vm4
 BgwQ==
X-Gm-Message-State: AOJu0Yw+gYoiSILSgIPk/femkM9SXxrQYaZ0bu7ka4fPsuejrj4srs/a
 +F2YKJF8LErxFM0gfmcydluxWXB91N0ez6O2EGaGT71M4JIgUBOei7QJUE/oI3q52Co=
X-Gm-Gg: ASbGncuqpcdmhYdAY3mtRgSPHskK6+wH9XwpgkHLwxXnChYqZI6ryHRICi05hFKBoYo
 6Hp6OARpw2GPENZ+dGnFzimeDmHkSmeJWP4FmX1tb9MS1f6F5UuLY/C6uD+Jf3LITtvtxmlzsYa
 ihv2Kj6/iOytLm0Z6YJSt1LOWS9fLeYfcCyyal4OP8wj7MntgRiZ9tjYyICe9o24r15/2iU3D6W
 E/E7Y64lt9mCFW1YCvGPNkHTHvdMm6857E3Jh/RyD1GDZ6gXoKx+hrVl0JT4RCvltbR0BTrec8t
 ZJt5do6qKiWI2Sfvuwk3VSgge5HWmPZm9XsxGHAMz3L5hq0EzQ+1QeiCUaXcZbx73bdUu5frMbu
 Ky6Mc+BWgSQP4kYsdGxuAJTTlrePHa/vM20XdQcVKwzewqXRtFSu8hhWEWa0+3E78Nb+34E4GHt
 /LfQgNct+pmYk/1PPo
X-Google-Smtp-Source: AGHT+IH/lyY8ZmxJ/JN9aGLoK7fGAWyVPaop+WkvcaIXG+D07wyki9kR2f7ofWQihI55IEqTo8vRYw==
X-Received: by 2002:a05:6000:659:20b0:429:d1a8:3fa2 with SMTP id
 ffacd0b85a97d-429d1a84015mr6200886f8f.48.1762271114682; 
 Tue, 04 Nov 2025 07:45:14 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc1fdae2sm5385620f8f.41.2025.11.04.07.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 07:45:14 -0800 (PST)
Message-ID: <9eaa0f79-1b45-44fd-961e-f6447e538acb@ursulin.net>
Date: Tue, 4 Nov 2025 15:45:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] drm/amdgpu: independence for the
 amdgpu_eviction_fence!
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-14-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251031134442.113648-14-christian.koenig@amd.com>
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


On 31/10/2025 13:16, Christian König wrote:
> This should allow amdgpu_fences to outlive the amdgpu module.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c | 3 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h | 1 -
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> index 23d7d0b0d625..95ee22c43ceb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> @@ -167,9 +167,8 @@ amdgpu_eviction_fence_create(struct amdgpu_eviction_fence_mgr *evf_mgr)
>   
>   	ev_fence->evf_mgr = evf_mgr;
>   	get_task_comm(ev_fence->timeline_name, current);
> -	spin_lock_init(&ev_fence->lock);
>   	dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
> -			 &ev_fence->lock, evf_mgr->ev_fence_ctx,
> +			 NULL, evf_mgr->ev_fence_ctx,
>   			 atomic_inc_return(&evf_mgr->ev_fence_seq));
>   	return ev_fence;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
> index fcd867b7147d..fb70efb54338 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
> @@ -27,7 +27,6 @@
>   
>   struct amdgpu_eviction_fence {
>   	struct dma_fence base;
> -	spinlock_t	 lock;
>   	char		 timeline_name[TASK_COMM_LEN];
>   	struct amdgpu_eviction_fence_mgr *evf_mgr;
>   };

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

