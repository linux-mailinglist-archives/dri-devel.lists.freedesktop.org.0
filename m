Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9FF2040A2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 21:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AA56E8CB;
	Mon, 22 Jun 2020 19:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1E56E8CB;
 Mon, 22 Jun 2020 19:41:00 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q5so5532147wru.6;
 Mon, 22 Jun 2020 12:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rr6iocEv4oH0EjL1OiRgqRFhQ7fPgcRkYGyaAyLkEq0=;
 b=anyHKTzMlJ3ha/2dYvkoG2aghSHLSuxsmURcNbOqzOah4uolKP0Eo+XMRZsEhVtN8n
 hF+XXgyJde8Bkyy18Y0+ogXncaekv0u+PXlPl1DhSO06qYHehILVUNMzQxzyPjxH67+D
 Xn+fjgBZ36C9AvrSrgMLOHz3v93vBk/68bDXEEdWoDrBzUhmZRr4boxn5k0XmwwGMFz+
 XvyD14XcYRGCuEXtuUVxMQPXpd47dGrV11YZ+ef7Rbzt0IrS+Uv3oXTeyIuLU2iByiob
 bYwhq3kWiKDUXJcqnr1l2vlbgsDXXalTT6hUFkiSXr2Ndsoptp8db2JMzjgp6pYTrjIT
 7JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=rr6iocEv4oH0EjL1OiRgqRFhQ7fPgcRkYGyaAyLkEq0=;
 b=fhxRwJl15Biop6pkesNK0Diis59DdEKY/mfxcsWK2DYDOpkbh+Fjo2xRZGgvuZtz3L
 c1kQJ5k+NiWWmRdfTMqYexrjU6hHZIBUqsT5ZRyRZqHMLBlCwFOUoFKBg3FHOlea94GI
 BlP+ya7hCA1xhnk6GJWYUk4WOnwARw4yWvYCorEQGAR4YJf33jA5CykIfpf/9GIowQqz
 +1JznqmNewEv8K6BkgtxRTvm01ASbTE/aZ+u4rxs+wXN9ml9yvt/MzVxbydY/HNylj4n
 4AQrAxk36I0ICbgZ/D9EqsZr8e1xF674s8B8ddUSH8zSJvFtljNDziUy1F5ic98gaYpw
 2Ysw==
X-Gm-Message-State: AOAM5323GVmlqvcvaWAXBUqjh+V6zT3VjdFIZzTijFAScIczdkcHDFKc
 gKdTyFb2128u5qGTqbdbsGyPJ5In
X-Google-Smtp-Source: ABdhPJzvRLoSHmdO0tK1dQCGyiQRgQLsblKIk4UEhdst8gyD5KvABg6uN8ZPOSkomV6P7a2kyH5hYg==
X-Received: by 2002:a5d:4611:: with SMTP id t17mr19837619wrq.243.1592854859392; 
 Mon, 22 Jun 2020 12:40:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t188sm645202wmt.27.2020.06.22.12.40.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 12:40:58 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] drm/amdgpu: Fix sdma code crash post device unplug
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-8-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8b27df86-c4c9-8e98-e525-993a3e00ee00@gmail.com>
Date: Mon, 22 Jun 2020 21:40:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1592719388-13819-8-git-send-email-andrey.grodzovsky@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.20 um 08:03 schrieb Andrey Grodzovsky:
> entity->rq becomes null aftre device unplugged so just return early
> in that case.

Mhm, do you have a backtrace for this?

This should only be called by an IOCTL and IOCTLs should already call 
drm_dev_enter()/exit() on their own...

Christian.

>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 8d9c6fe..d252427 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -24,6 +24,7 @@
>   #include "amdgpu_job.h"
>   #include "amdgpu_object.h"
>   #include "amdgpu_trace.h"
> +#include <drm/drm_drv.h>
>   
>   #define AMDGPU_VM_SDMA_MIN_NUM_DW	256u
>   #define AMDGPU_VM_SDMA_MAX_NUM_DW	(16u * 1024u)
> @@ -94,7 +95,12 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
>   	struct drm_sched_entity *entity;
>   	struct amdgpu_ring *ring;
>   	struct dma_fence *f;
> -	int r;
> +	int r, idx;
> +
> +	if (!drm_dev_enter(p->adev->ddev, &idx)) {
> +		r = -ENODEV;
> +		goto nodev;
> +	}
>   
>   	entity = p->immediate ? &p->vm->immediate : &p->vm->delayed;
>   	ring = container_of(entity->rq->sched, struct amdgpu_ring, sched);
> @@ -104,7 +110,7 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
>   	WARN_ON(ib->length_dw > p->num_dw_left);
>   	r = amdgpu_job_submit(p->job, entity, AMDGPU_FENCE_OWNER_VM, &f);
>   	if (r)
> -		goto error;
> +		goto job_fail;
>   
>   	if (p->unlocked) {
>   		struct dma_fence *tmp = dma_fence_get(f);
> @@ -118,10 +124,15 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
>   	if (fence && !p->immediate)
>   		swap(*fence, f);
>   	dma_fence_put(f);
> -	return 0;
>   
> -error:
> -	amdgpu_job_free(p->job);
> +	r = 0;
> +
> +job_fail:
> +	drm_dev_exit(idx);
> +nodev:
> +	if (r)
> +		amdgpu_job_free(p->job);
> +
>   	return r;
>   }
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
