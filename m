Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F477EA146
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 17:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E40A10E382;
	Mon, 13 Nov 2023 16:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDCA10E37E;
 Mon, 13 Nov 2023 16:30:18 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-408425c7c10so37849945e9.0; 
 Mon, 13 Nov 2023 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699893017; x=1700497817; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TrgwIpCr3cCz+wMfmli2lw8x6mUCbDU3/IRrq0WSMkE=;
 b=ToE/9Hwbooq4BQQgaQzDYiqYz0lESsCbla6ObJdp/psNImmF27torvps9Y5TADKgxM
 HbiJjCoZw4/cIf6HFQ8EuInps+rsTAOkZrc0dw2tSsdsJxKzxt3gKgbISUblFn9uwEE2
 9dpzrmgRd2ZWGGGupRxRA/OUFOpEssJ9spEvZjoQCEHl/A6BGztWFntASsDW8XygHX8G
 me2iWUo1mlyX5lr+Yqal026a1nz+hm5V+OIz/Ge5gnSlot62akXilyaaPmb3SM8lSQa1
 L47ipyhE60n1ZRg4WjaLMik0b4NhwknCfrPRj6Y/XS3j4k8MQZTs5XBFfRrrCzMiVwmX
 VJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699893017; x=1700497817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrgwIpCr3cCz+wMfmli2lw8x6mUCbDU3/IRrq0WSMkE=;
 b=V5UfTLPfyn7MstZ0AZipvTCUFYMz3A93Sn3d55Q5czI78T5H7dWYHtUjeXHUxPjlvA
 WZJkw52xsbR8+MrJarkc/Uj6W48H/2Hyv7bIkOnFplhqw+nEqzcf8hk1WUWGdxDYpaBf
 gpsYbit40+zaJBfZcg9n/xYblQSMXKiRQDCFfIdVXE6194as91NsgKRRw8fYibVd3Dox
 ik+q74p3AHtkFc2bQJMUOlRfJVhgLlv1TQrSvZcN/96KjKaIDPn9U3H/mRura6/2iwIn
 +oyFvNCgiJApHlaKhefamJDtVHTzCKky1dBupN14G35Dy17kQ8gRrNOIaiEw7t8pBc9A
 N+BA==
X-Gm-Message-State: AOJu0Yz3DqB4agCJNNj7cqIylJ2O/ybvdF+Hz5JvtdREoA8ChqUb/Vjy
 PYrD9ejLTe1GoFsOgixTyQ4=
X-Google-Smtp-Source: AGHT+IE0J8cRqw24bIVALelxvDPrWhyLK1LYW38NqvfVI5ixoJpqk8RyUKoNA1ilNWXAHcnnA3J8Lw==
X-Received: by 2002:a05:600c:5023:b0:40a:2796:618f with SMTP id
 n35-20020a05600c502300b0040a2796618fmr6040257wmr.40.1699893016796; 
 Mon, 13 Nov 2023 08:30:16 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b0040596352951sm14441920wmq.5.2023.11.13.08.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 08:30:16 -0800 (PST)
Message-ID: <f416899a-da4a-4ad3-9aa6-a133d797f9af@gmail.com>
Date: Mon, 13 Nov 2023 17:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3] drm/ttm: Schedule delayed_delete worker closer
Content-Language: en-US
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20231111130856.1168304-1-rajneesh.bhardwaj@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20231111130856.1168304-1-rajneesh.bhardwaj@amd.com>
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
Cc: alexander.deucher@amd.com, Felix Kuehling <Felix.Kuehling@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.11.23 um 14:08 schrieb Rajneesh Bhardwaj:
> Try to allocate system memory on the NUMA node the device is closest to
> and try to run delayed_delete workers on a CPU of this node as well.
>
> To optimize the memory clearing operation when a TTM BO gets freed by
> the delayed_delete worker, scheduling it closer to a NUMA node where the
> memory was initially allocated helps avoid the cases where the worker
> gets randomly scheduled on the CPU cores that are across interconnect
> boundaries such as xGMI, PCIe etc.
>
> This change helps USWC GTT allocations on NUMA systems (dGPU) and AMD
> APU platforms such as GFXIP9.4.3.
>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> Changes in v3:
>   * Use WQ_UNBOUND to address the warning reported by CI pipeline.
>
>   drivers/gpu/drm/ttm/ttm_bo.c     | 8 +++++++-
>   drivers/gpu/drm/ttm/ttm_device.c | 6 ++++--
>   2 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 5757b9415e37..6f28a77a565b 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -370,7 +370,13 @@ static void ttm_bo_release(struct kref *kref)
>   			spin_unlock(&bo->bdev->lru_lock);
>   
>   			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
> -			queue_work(bdev->wq, &bo->delayed_delete);
> +
> +			/* Schedule the worker on the closest NUMA node. This
> +			 * improves performance since system memory might be
> +			 * cleared on free and that is best done on a CPU core
> +			 * close to it.
> +			 */
> +			queue_work_node(bdev->pool.nid, bdev->wq, &bo->delayed_delete);
>   			return;
>   		}
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 43e27ab77f95..bc97e3dd40f0 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -204,7 +204,8 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>   	if (ret)
>   		return ret;
>   
> -	bdev->wq = alloc_workqueue("ttm", WQ_MEM_RECLAIM | WQ_HIGHPRI, 16);
> +	bdev->wq = alloc_workqueue("ttm",
> +				   WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_UNBOUND, 16);
>   	if (!bdev->wq) {
>   		ttm_global_release();
>   		return -ENOMEM;
> @@ -213,7 +214,8 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>   	bdev->funcs = funcs;
>   
>   	ttm_sys_man_init(bdev);
> -	ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, use_dma32);
> +
> +	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, use_dma32);
>   
>   	bdev->vma_manager = vma_manager;
>   	spin_lock_init(&bdev->lru_lock);

