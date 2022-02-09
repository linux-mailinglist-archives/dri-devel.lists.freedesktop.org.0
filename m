Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BD54AEB96
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C9F10E3FE;
	Wed,  9 Feb 2022 07:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5679C10E444;
 Wed,  9 Feb 2022 07:57:56 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y17so1471035edd.10;
 Tue, 08 Feb 2022 23:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vN6g4v0I0Zsd5t3dW1ILZrebdUOm9AKkr7ttr5tkTio=;
 b=OXQFPKuxLgg+C+4NZU96SgtN22QbxcsDChYevZ0xeAfxiKx4fSjNt0uAb0ZiIXnFKm
 98646FNAeFHqZhrcHCImvyQbVTgvZ8CHCCwMjV9h+tQGBmxI+fP8TW3k+taardXaNbCS
 q/lA9orqgF1IJW5S+HFsaBWHoBw0VZcL6iT/SBKHjz/ylABJ1Oh8+09D3/34acjVMTrB
 PUfTks/GZD6H+gyO67NdqnHCYg3iYt/b1lE68bnR1NtLxyQb0XYv70LgmgJGt2XAzBsu
 pgDgwwGg4FcBctultQ5gzOAfQ4ycFQ3Kn8S9lxGwuosOIPVxIQYzqGwVsU36zBOW0yVn
 qjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vN6g4v0I0Zsd5t3dW1ILZrebdUOm9AKkr7ttr5tkTio=;
 b=gSVMPprYNoM0JxEGzMbGZYHPaMkvZGRyLY1Y3o8YsmkPpTqmmQH9xLI5OSKPZF9cgu
 QtT4CgUU9/m/zNXQV4C9OsCaAOk/l6cvHDDzagtXgRUYWESJK3t73mzdfnamDzgE3QjN
 unzmFAPKJjGg8Sr2ow8WRp2wCmRiWmjgQ2/xAVHwXcQZstsDRAC4R2Ia0D5suxQ9wjl9
 S0EwqBSRQK3Y8CNbLKK3wstxnwP0NTSQbZ1n/sOnCqK6JmdhvCiRfXpcE1/HtAfrZZlH
 Yoh7Huc+eV2eAuS0ITluzgZd9NZOtuO6X4wcDsiAVogDXZSz+H5+7StCox+iOikRF2wu
 fCrg==
X-Gm-Message-State: AOAM532015+UPXyvrbYDhtrnP6T3aSRYeyFjbsauVKvln3pM2obzYh7n
 qnKhlqfcC1mgefim89At/d0=
X-Google-Smtp-Source: ABdhPJwb2qv3Cu17K/+oqJ0rzOQpLtQJXaC+4H1q8QEp3GQW42rIrF0OjkcSPdfadBcgj0E2zO5iDg==
X-Received: by 2002:a05:6402:2995:: with SMTP id
 eq21mr1121270edb.61.1644393474718; 
 Tue, 08 Feb 2022 23:57:54 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa?
 ([2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa])
 by smtp.gmail.com with ESMTPSA id u3sm5857661ejz.99.2022.02.08.23.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 23:57:54 -0800 (PST)
Message-ID: <781beb40-b04f-91f4-44cf-5ac47a56a665@gmail.com>
Date: Wed, 9 Feb 2022 08:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v4 07/11] drm/amdgpu: Rework reset domain to be refcounted.
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-8-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220209002320.6077-8-andrey.grodzovsky@amd.com>
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:
> The reset domain contains register access semaphor
> now and so needs to be present as long as each device
> in a hive needs it and so it cannot be binded to XGMI
> hive life cycle.
> Adress this by making reset domain refcounted and pointed
> by each member of the hive and the hive itself.
>
> v4:
>
> Fix crash on boot witrh XGMI hive by adding type to reset_domain.
> XGMI will only create a new reset_domain if prevoius was of single
> device type meaning it's first boot. Otherwsie it will take a
> refocunt to exsiting reset_domain from the amdgou device.
>
> Add a wrapper around reset_domain->refcount get/put
> and a wrapper around send to reset wq (Lijo)
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 44 +++++++++++++---------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 40 ++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 35 +++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 29 +++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  6 ++-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  6 ++-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c      |  6 ++-
>   9 files changed, 140 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 540a38fe5cd6..cb9764513df8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -813,9 +813,7 @@ struct amd_powerplay {
>   #define AMDGPU_RESET_MAGIC_NUM 64
>   #define AMDGPU_MAX_DF_PERFMONS 4
>   #define AMDGPU_PRODUCT_NAME_LEN 64
> -struct amdgpu_reset_domain {
> -	struct workqueue_struct *wq;
> -};
> +struct amdgpu_reset_domain;
>   
>   struct amdgpu_device {
>   	struct device			*dev;
> @@ -1104,7 +1102,7 @@ struct amdgpu_device {
>   	uint32_t                        ip_versions[MAX_HWIP][HWIP_MAX_INSTANCE];
>   
>   	bool				ram_is_direct_mapped;
> -	struct amdgpu_reset_domain	reset_domain;
> +	struct amdgpu_reset_domain	*reset_domain;
>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index e3c0ec684a85..d61bc0a0457c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2316,7 +2316,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>   
>   		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>   				   ring->num_hw_submission, amdgpu_job_hang_limit,
> -				   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
> +				   timeout, adev->reset_domain->wq, ring->sched_score, ring->name);
>   		if (r) {
>   			DRM_ERROR("Failed to create scheduler on ring %s.\n",
>   				  ring->name);
> @@ -2439,24 +2439,22 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>   	if (r)
>   		goto init_failed;
>   
> +	/**
> +	 * In case of XGMI grab extra reference for reset domain for this device
> +	 */
>   	if (adev->gmc.xgmi.num_physical_nodes > 1) {
> -		struct amdgpu_hive_info *hive;
> +		if (amdgpu_xgmi_add_device(adev) == 0) {
> +			struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
>   
> -		amdgpu_xgmi_add_device(adev);
> +			if (!hive->reset_domain ||
> +			    !amdgpu_reset_get_reset_domain(hive->reset_domain)) {
> +				r = -ENOENT;
> +				goto init_failed;
> +			}
>   
> -		hive = amdgpu_get_xgmi_hive(adev);
> -		if (!hive || !hive->reset_domain.wq) {
> -			DRM_ERROR("Failed to obtain reset domain info for XGMI hive:%llx", hive->hive_id);
> -			r = -EINVAL;
> -			goto init_failed;
> -		}
> -
> -		adev->reset_domain.wq = hive->reset_domain.wq;
> -	} else {
> -		adev->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-dev", 0);
> -		if (!adev->reset_domain.wq) {
> -			r = -ENOMEM;
> -			goto init_failed;
> +			/* Drop the early temporary reset domain we created for device */
> +			amdgpu_reset_put_reset_domain(adev->reset_domain);
> +			adev->reset_domain = hive->reset_domain;
>   		}
>   	}
>   
> @@ -3640,6 +3638,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   		return r;
>   	}
>   
> +	/*
> +	 * Reset domain needs to be present early, before XGMI hive discovered
> +	 * (if any) and intitialized to use reset sem and in_gpu reset flag
> +	 * early on during init.
> +	 */
> +	adev->reset_domain = amdgpu_reset_create_reset_domain(SINGLE_DEVICE ,"amdgpu-reset-dev");
> +	if (!adev->reset_domain)
> +		return -ENOMEM;
> +
>   	/* early init functions */
>   	r = amdgpu_device_ip_early_init(adev);
>   	if (r)
> @@ -4016,6 +4023,9 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>   	if (adev->mman.discovery_bin)
>   		amdgpu_discovery_fini(adev);
>   
> +	amdgpu_reset_put_reset_domain(adev->reset_domain);
> +	adev->reset_domain = NULL;
> +
>   	kfree(adev->pci_state);
>   
>   }
> @@ -5241,7 +5251,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   
>   	INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>   
> -	if (!queue_work(adev->reset_domain.wq, &work.base))
> +	if (!amdgpu_reset_domain_schedule(adev->reset_domain, &work.base))
>   		return -EAGAIN;
>   
>   	flush_work(&work.base);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 02afd4115675..91864947063f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -96,3 +96,43 @@ int amdgpu_reset_perform_reset(struct amdgpu_device *adev,
>   	return reset_handler->restore_hwcontext(adev->reset_cntl,
>   						reset_context);
>   }
> +
> +
> +void amdgpu_reset_destroy_reset_domain(struct kref *ref)
> +{
> +	struct amdgpu_reset_domain *reset_domain = container_of(ref,
> +								struct amdgpu_reset_domain,
> +								refcount);
> +	if (reset_domain->wq)
> +		destroy_workqueue(reset_domain->wq);
> +
> +	kvfree(reset_domain);
> +}
> +
> +struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum amdgpu_reset_domain_type type,
> +							     char *wq_name)
> +{
> +	struct amdgpu_reset_domain *reset_domain;
> +
> +	reset_domain = kvzalloc(sizeof(struct amdgpu_reset_domain), GFP_KERNEL);
> +	if (!reset_domain) {
> +		DRM_ERROR("Failed to allocate amdgpu_reset_domain!");
> +		return NULL;
> +	}
> +
> +	reset_domain->type = type;
> +	kref_init(&reset_domain->refcount);
> +
> +	reset_domain->wq = create_singlethread_workqueue(wq_name);
> +	if (!reset_domain->wq) {
> +		DRM_ERROR("Failed to allocate wq for amdgpu_reset_domain!");
> +		amdgpu_reset_put_reset_domain(reset_domain);
> +		return NULL;
> +
> +	}
> +
> +	return reset_domain;
> +}
> +
> +
> +
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index e00d38d9160a..cc625e441fa0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -70,6 +70,19 @@ struct amdgpu_reset_control {
>   	void (*async_reset)(struct work_struct *work);
>   };
>   
> +
> +enum amdgpu_reset_domain_type {
> +	SINGLE_DEVICE,
> +	XGMI_HIVE
> +};
> +
> +struct amdgpu_reset_domain {
> +	struct kref refcount;
> +	struct workqueue_struct *wq;
> +	enum amdgpu_reset_domain_type type;
> +};
> +
> +
>   int amdgpu_reset_init(struct amdgpu_device *adev);
>   int amdgpu_reset_fini(struct amdgpu_device *adev);
>   
> @@ -82,4 +95,26 @@ int amdgpu_reset_perform_reset(struct amdgpu_device *adev,
>   int amdgpu_reset_add_handler(struct amdgpu_reset_control *reset_ctl,
>   			     struct amdgpu_reset_handler *handler);
>   
> +struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum amdgpu_reset_domain_type type,
> +							     char *wq_name);
> +
> +void amdgpu_reset_destroy_reset_domain(struct kref *ref);
> +
> +static inline bool amdgpu_reset_get_reset_domain(struct amdgpu_reset_domain *domain)
> +{
> +	return kref_get_unless_zero(&domain->refcount) != 0;
> +}
> +
> +static inline void amdgpu_reset_put_reset_domain(struct amdgpu_reset_domain *domain)
> +{
> +	kref_put(&domain->refcount, amdgpu_reset_destroy_reset_domain);
> +}
> +
> +static inline bool amdgpu_reset_domain_schedule(struct amdgpu_reset_domain *domain,
> +						struct work_struct *work)
> +{
> +	return queue_work(domain->wq, work);
> +}
> +
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index 89b682afe821..eb06322d2972 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -32,6 +32,8 @@
>   #include "wafl/wafl2_4_0_0_smn.h"
>   #include "wafl/wafl2_4_0_0_sh_mask.h"
>   
> +#include "amdgpu_reset.h"
> +
>   #define smnPCS_XGMI23_PCS_ERROR_STATUS   0x11a01210
>   #define smnPCS_XGMI3X16_PCS_ERROR_STATUS 0x11a0020c
>   #define smnPCS_GOPX1_PCS_ERROR_STATUS    0x12200210
> @@ -227,6 +229,9 @@ static void amdgpu_xgmi_hive_release(struct kobject *kobj)
>   	struct amdgpu_hive_info *hive = container_of(
>   		kobj, struct amdgpu_hive_info, kobj);
>   
> +	amdgpu_reset_put_reset_domain(hive->reset_domain);
> +	hive->reset_domain = NULL;
> +
>   	mutex_destroy(&hive->hive_lock);
>   	kfree(hive);
>   }
> @@ -398,12 +403,24 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>   		goto pro_end;
>   	}
>   
> -	hive->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-hive", 0);
> -	if (!hive->reset_domain.wq) {
> -		dev_err(adev->dev, "XGMI: failed allocating wq for reset domain!\n");
> -		kfree(hive);
> -		hive = NULL;
> -		goto pro_end;
> +	/**
> +	 * Avoid recreating reset domain when hive is reconstructed for the case
> +	 * of reset the devices in the XGMI hive during probe for SRIOV
> +	 * See https://www.spinics.net/lists/amd-gfx/msg58836.html
> +	 */
> +	if (adev->reset_domain->type != XGMI_HIVE) {
> +		hive->reset_domain = amdgpu_reset_create_reset_domain(XGMI_HIVE, "amdgpu-reset-hive");
> +			if (!hive->reset_domain) {
> +				dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
> +				ret = -ENOMEM;
> +				kobject_put(&hive->kobj);
> +				kfree(hive);
> +				hive = NULL;
> +				goto pro_end;
> +			}
> +	} else {
> +		amdgpu_reset_get_reset_domain(adev->reset_domain);
> +		hive->reset_domain = adev->reset_domain;
>   	}
>   
>   	hive->hive_id = adev->gmc.xgmi.hive_id;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> index 2f2ce53645a5..dcaad22be492 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> @@ -42,7 +42,7 @@ struct amdgpu_hive_info {
>   		AMDGPU_XGMI_PSTATE_UNKNOWN
>   	} pstate;
>   
> -	struct amdgpu_reset_domain reset_domain;
> +	struct amdgpu_reset_domain *reset_domain;
>   };
>   
>   struct amdgpu_pcs_ras_field {
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> index 5869d51d8bee..6740eef84ee1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> @@ -32,6 +32,8 @@
>   #include "soc15_common.h"
>   #include "mxgpu_ai.h"
>   
> +#include "amdgpu_reset.h"
> +
>   static void xgpu_ai_mailbox_send_ack(struct amdgpu_device *adev)
>   {
>   	WREG8(AI_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
> @@ -308,8 +310,8 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_device *adev,
>   	switch (event) {
>   		case IDH_FLR_NOTIFICATION:
>   		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
> -			WARN_ONCE(!queue_work(adev->reset_domain.wq,
> -					      &adev->virt.flr_work),
> +			WARN_ONCE(!amdgpu_reset_domain_schedule(adev->reset_domain,
> +								&adev->virt.flr_work),
>   				  "Failed to queue work! at %s",
>   				  __func__);
>   		break;
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> index 5728a6401d73..e967d61c7134 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> @@ -31,6 +31,8 @@
>   #include "soc15_common.h"
>   #include "mxgpu_nv.h"
>   
> +#include "amdgpu_reset.h"
> +
>   static void xgpu_nv_mailbox_send_ack(struct amdgpu_device *adev)
>   {
>   	WREG8(NV_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
> @@ -338,8 +340,8 @@ static int xgpu_nv_mailbox_rcv_irq(struct amdgpu_device *adev,
>   	switch (event) {
>   	case IDH_FLR_NOTIFICATION:
>   		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
> -			WARN_ONCE(!queue_work(adev->reset_domain.wq,
> -					      &adev->virt.flr_work),
> +			WARN_ONCE(!amdgpu_reset_domain_schedule(adev->reset_domain,
> +				   &adev->virt.flr_work),
>   				  "Failed to queue work! at %s",
>   				  __func__);
>   		break;
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> index 02290febfcf4..531cfba759dd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> @@ -42,6 +42,8 @@
>   #include "smu/smu_7_1_3_d.h"
>   #include "mxgpu_vi.h"
>   
> +#include "amdgpu_reset.h"
> +
>   /* VI golden setting */
>   static const u32 xgpu_fiji_mgcg_cgcg_init[] = {
>   	mmRLC_CGTT_MGCG_OVERRIDE, 0xffffffff, 0xffffffff,
> @@ -551,8 +553,8 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev,
>   
>   		/* only handle FLR_NOTIFY now */
>   		if (!r && !amdgpu_in_reset(adev))
> -			WARN_ONCE(!queue_work(adev->reset_domain.wq,
> -					      &adev->virt.flr_work),
> +			WARN_ONCE(!amdgpu_reset_domain_schedule(adev->reset_domain,
> +								&adev->virt.flr_work),
>   				  "Failed to queue work! at %s",
>   				  __func__);
>   	}

