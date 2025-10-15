Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5C7BDECA4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922E610E7EA;
	Wed, 15 Oct 2025 13:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GxbiH3xN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9ED610E7EA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:42:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4709243AB0;
 Wed, 15 Oct 2025 13:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E7CC4CEF8;
 Wed, 15 Oct 2025 13:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760535754;
 bh=wkUxCeKS5tD0TM2Xa5rZwhjOYyIU5mX+q32xBqCtYNc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GxbiH3xNbpYXlckAKeEZI2Vy25AQTsCbLGPTjeuIwpiKq9LBuFrZFvvRHWoRKge48
 zo7y/NnN6CVk1CGkU1BOxGCEvAOV1hd+hmgyDeik1S9GpudoDZm1YFYuncZQUuG5Aw
 l54fqsddOjch6OC2KrjiG4h4EhM3AqU+P417M4W2BcF+pZrSQPkqsp9dOYsbxvAy6k
 1MD9e0klNimLpH0iy7CCYij/fTBGzBwUMKO/9lMvV6ziHV4I3P8jx4lqUX7RzbTDek
 q9n/EYJJ7W7lr0jyTGsYakgDYpK4eTOx917wxo63rxya76tncX+fXD7l5MlxXAs6A1
 Shx3UhTqYGo+A==
Message-ID: <4e64ba7c-18d6-42e0-8fb1-dc03ae0cfbd7@kernel.org>
Date: Wed, 15 Oct 2025 08:42:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Support getting last hardware error
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251014234119.628453-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251014234119.628453-1-lizhi.hou@amd.com>
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

On 10/14/25 6:41 PM, Lizhi Hou wrote:
> Add new parameter DRM_AMDXDNA_HW_LAST_ASYNC_ERR to get array IOCTL. When
> hardware reports an error, the driver save the error information and
> timestamp. This new get array parameter retrieves the last error.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/accel/amdxdna/aie2_error.c      | 95 ++++++++++++++++++++-----
>   drivers/accel/amdxdna/aie2_pci.c        |  3 +
>   drivers/accel/amdxdna/aie2_pci.h        |  5 +-
>   drivers/accel/amdxdna/amdxdna_error.h   | 59 +++++++++++++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
>   include/uapi/drm/amdxdna_accel.h        | 13 ++++
>   6 files changed, 159 insertions(+), 19 deletions(-)
>   create mode 100644 drivers/accel/amdxdna/amdxdna_error.h
> 
> diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
> index 5ee905632a39..d452008ec4f4 100644
> --- a/drivers/accel/amdxdna/aie2_error.c
> +++ b/drivers/accel/amdxdna/aie2_error.c
> @@ -13,6 +13,7 @@
>   
>   #include "aie2_msg_priv.h"
>   #include "aie2_pci.h"
> +#include "amdxdna_error.h"
>   #include "amdxdna_mailbox.h"
>   #include "amdxdna_pci_drv.h"
>   
> @@ -46,6 +47,7 @@ enum aie_module_type {
>   	AIE_MEM_MOD = 0,
>   	AIE_CORE_MOD,
>   	AIE_PL_MOD,
> +	AIE_UNKNOWN_MOD,
>   };
>   
>   enum aie_error_category {
> @@ -143,6 +145,31 @@ static const struct aie_event_category aie_ml_shim_tile_event_cat[] = {
>   	EVENT_CATEGORY(74U, AIE_ERROR_LOCK),
>   };
>   
> +static const enum amdxdna_error_num aie_cat_err_num_map[] = {
> +	[AIE_ERROR_SATURATION] = AMDXDNA_ERROR_NUM_AIE_SATURATION,
> +	[AIE_ERROR_FP] = AMDXDNA_ERROR_NUM_AIE_FP,
> +	[AIE_ERROR_STREAM] = AMDXDNA_ERROR_NUM_AIE_STREAM,
> +	[AIE_ERROR_ACCESS] = AMDXDNA_ERROR_NUM_AIE_ACCESS,
> +	[AIE_ERROR_BUS] = AMDXDNA_ERROR_NUM_AIE_BUS,
> +	[AIE_ERROR_INSTRUCTION] = AMDXDNA_ERROR_NUM_AIE_INSTRUCTION,
> +	[AIE_ERROR_ECC] = AMDXDNA_ERROR_NUM_AIE_ECC,
> +	[AIE_ERROR_LOCK] = AMDXDNA_ERROR_NUM_AIE_LOCK,
> +	[AIE_ERROR_DMA] = AMDXDNA_ERROR_NUM_AIE_DMA,
> +	[AIE_ERROR_MEM_PARITY] = AMDXDNA_ERROR_NUM_AIE_MEM_PARITY,
> +	[AIE_ERROR_UNKNOWN] = AMDXDNA_ERROR_NUM_UNKNOWN,
> +};
> +
> +static_assert(ARRAY_SIZE(aie_cat_err_num_map) == AIE_ERROR_UNKNOWN + 1);
> +
> +static const enum amdxdna_error_module aie_err_mod_map[] = {
> +	[AIE_MEM_MOD] = AMDXDNA_ERROR_MODULE_AIE_MEMORY,
> +	[AIE_CORE_MOD] = AMDXDNA_ERROR_MODULE_AIE_CORE,
> +	[AIE_PL_MOD] = AMDXDNA_ERROR_MODULE_AIE_PL,
> +	[AIE_UNKNOWN_MOD] = AMDXDNA_ERROR_MODULE_UNKNOWN,
> +};
> +
> +static_assert(ARRAY_SIZE(aie_err_mod_map) == AIE_UNKNOWN_MOD + 1);
> +
>   static enum aie_error_category
>   aie_get_error_category(u8 row, u8 event_id, enum aie_module_type mod_type)
>   {
> @@ -176,12 +203,40 @@ aie_get_error_category(u8 row, u8 event_id, enum aie_module_type mod_type)
>   		if (event_id != lut[i].event_id)
>   			continue;
>   
> +		if (lut[i].category > AIE_ERROR_UNKNOWN)
> +			return AIE_ERROR_UNKNOWN;
> +
>   		return lut[i].category;
>   	}
>   
>   	return AIE_ERROR_UNKNOWN;
>   }
>   
> +static void aie2_update_last_async_error(struct amdxdna_dev_hdl *ndev, void *err_info, u32 num_err)
> +{
> +	struct aie_error *errs = err_info;
> +	enum amdxdna_error_module err_mod;
> +	enum aie_error_category aie_err;
> +	enum amdxdna_error_num err_num;
> +	struct aie_error *last_err;
> +
> +	last_err = &errs[num_err - 1];
> +	if (last_err->mod_type >= AIE_UNKNOWN_MOD) {
> +		err_num = aie_cat_err_num_map[AIE_ERROR_UNKNOWN];
> +		err_mod = aie_err_mod_map[AIE_UNKNOWN_MOD];
> +	} else {
> +		aie_err = aie_get_error_category(last_err->row,
> +						 last_err->event_id,
> +						 last_err->mod_type);
> +		err_num = aie_cat_err_num_map[aie_err];
> +		err_mod = aie_err_mod_map[last_err->mod_type];
> +	}
> +
> +	ndev->last_async_err.err_code = AMDXDNA_ERROR_ENCODE(err_num, err_mod);
> +	ndev->last_async_err.ts_us = ktime_to_us(ktime_get_real());
> +	ndev->last_async_err.ex_err_code = AMDXDNA_EXTRA_ERR_ENCODE(last_err->row, last_err->col);
> +}
> +
>   static u32 aie2_error_backtrack(struct amdxdna_dev_hdl *ndev, void *err_info, u32 num_err)
>   {
>   	struct aie_error *errs = err_info;
> @@ -264,29 +319,14 @@ static void aie2_error_worker(struct work_struct *err_work)
>   	}
>   
>   	mutex_lock(&xdna->dev_lock);
> +	aie2_update_last_async_error(e->ndev, info->payload, info->err_cnt);
> +
>   	/* Re-sent this event to firmware */
>   	if (aie2_error_event_send(e))
>   		XDNA_WARN(xdna, "Unable to register async event");
>   	mutex_unlock(&xdna->dev_lock);
>   }
>   
> -int aie2_error_async_events_send(struct amdxdna_dev_hdl *ndev)
> -{
> -	struct amdxdna_dev *xdna = ndev->xdna;
> -	struct async_event *e;
> -	int i, ret;
> -
> -	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> -	for (i = 0; i < ndev->async_events->event_cnt; i++) {
> -		e = &ndev->async_events->event[i];
> -		ret = aie2_error_event_send(e);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>   void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev)
>   {
>   	struct amdxdna_dev *xdna = ndev->xdna;
> @@ -341,6 +381,10 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
>   		e->size = ASYNC_BUF_SIZE;
>   		e->resp.status = MAX_AIE2_STATUS_CODE;
>   		INIT_WORK(&e->work, aie2_error_worker);
> +
> +		ret = aie2_error_event_send(e);
> +		if (ret)
> +			goto free_wq;
>   	}
>   
>   	ndev->async_events = events;
> @@ -349,6 +393,8 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
>   		 events->event_cnt, events->size);
>   	return 0;
>   
> +free_wq:
> +	destroy_workqueue(events->wq);
>   free_buf:
>   	dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>   			     events->addr, DMA_FROM_DEVICE);
> @@ -356,3 +402,18 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
>   	kfree(events);
>   	return ret;
>   }
> +
> +int aie2_get_array_async_error(struct amdxdna_dev_hdl *ndev, struct amdxdna_drm_get_array *args)
> +{
> +	struct amdxdna_dev *xdna = ndev->xdna;
> +
> +	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> +
> +	args->num_element = 1;
> +	args->element_size = sizeof(ndev->last_async_err);
> +	if (copy_to_user(u64_to_user_ptr(args->buffer),
> +			 &ndev->last_async_err, args->element_size))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 8a66f276100e..cfca4e456b61 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -924,6 +924,9 @@ static int aie2_get_array(struct amdxdna_client *client,
>   	case DRM_AMDXDNA_HW_CONTEXT_ALL:
>   		ret = aie2_query_ctx_status_array(client, args);
>   		break;
> +	case DRM_AMDXDNA_HW_LAST_ASYNC_ERR:
> +		ret = aie2_get_array_async_error(xdna->dev_handle, args);
> +		break;
>   	default:
>   		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
>   		ret = -EOPNOTSUPP;
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 289a23ecd5f1..34bc35479f42 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -190,6 +190,8 @@ struct amdxdna_dev_hdl {
>   
>   	enum aie2_dev_status		dev_status;
>   	u32				hwctx_num;
> +
> +	struct amdxdna_async_error	last_async_err;
>   };
>   
>   #define DEFINE_BAR_OFFSET(reg_name, bar, reg_addr) \
> @@ -253,8 +255,9 @@ void aie2_psp_stop(struct psp_device *psp);
>   /* aie2_error.c */
>   int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev);
>   void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev);
> -int aie2_error_async_events_send(struct amdxdna_dev_hdl *ndev);
>   int aie2_error_async_msg_thread(void *data);
> +int aie2_get_array_async_error(struct amdxdna_dev_hdl *ndev,
> +			       struct amdxdna_drm_get_array *args);
>   
>   /* aie2_message.c */
>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
> diff --git a/drivers/accel/amdxdna/amdxdna_error.h b/drivers/accel/amdxdna/amdxdna_error.h
> new file mode 100644
> index 000000000000..c51de86ec12b
> --- /dev/null
> +++ b/drivers/accel/amdxdna/amdxdna_error.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025, Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _AMDXDNA_ERROR_H_
> +#define _AMDXDNA_ERROR_H_
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +
> +#define AMDXDNA_ERR_DRV_AIE		4
> +#define AMDXDNA_ERR_SEV_CRITICAL	3
> +#define AMDXDNA_ERR_CLASS_AIE		2
> +
> +#define AMDXDNA_ERR_NUM_MASK		GENMASK_U64(15, 0)
> +#define AMDXDNA_ERR_DRV_MASK		GENMASK_U64(23, 16)
> +#define AMDXDNA_ERR_SEV_MASK		GENMASK_U64(31, 24)
> +#define AMDXDNA_ERR_MOD_MASK		GENMASK_U64(39, 32)
> +#define AMDXDNA_ERR_CLASS_MASK		GENMASK_U64(47, 40)
> +
> +enum amdxdna_error_num {
> +	AMDXDNA_ERROR_NUM_AIE_SATURATION = 3,
> +	AMDXDNA_ERROR_NUM_AIE_FP,
> +	AMDXDNA_ERROR_NUM_AIE_STREAM,
> +	AMDXDNA_ERROR_NUM_AIE_ACCESS,
> +	AMDXDNA_ERROR_NUM_AIE_BUS,
> +	AMDXDNA_ERROR_NUM_AIE_INSTRUCTION,
> +	AMDXDNA_ERROR_NUM_AIE_ECC,
> +	AMDXDNA_ERROR_NUM_AIE_LOCK,
> +	AMDXDNA_ERROR_NUM_AIE_DMA,
> +	AMDXDNA_ERROR_NUM_AIE_MEM_PARITY,
> +	AMDXDNA_ERROR_NUM_UNKNOWN = 15,
> +};
> +
> +enum amdxdna_error_module {
> +	AMDXDNA_ERROR_MODULE_AIE_CORE = 3,
> +	AMDXDNA_ERROR_MODULE_AIE_MEMORY,
> +	AMDXDNA_ERROR_MODULE_AIE_SHIM,
> +	AMDXDNA_ERROR_MODULE_AIE_NOC,
> +	AMDXDNA_ERROR_MODULE_AIE_PL,
> +	AMDXDNA_ERROR_MODULE_UNKNOWN = 8,
> +};
> +
> +#define AMDXDNA_ERROR_ENCODE(err_num, err_mod)				\
> +	(FIELD_PREP(AMDXDNA_ERR_NUM_MASK, err_num) |			\
> +	 FIELD_PREP_CONST(AMDXDNA_ERR_DRV_MASK, AMDXDNA_ERR_DRV_AIE) |	\
> +	 FIELD_PREP_CONST(AMDXDNA_ERR_SEV_MASK, AMDXDNA_ERR_SEV_CRITICAL) | \
> +	 FIELD_PREP(AMDXDNA_ERR_MOD_MASK, err_mod) |			\
> +	 FIELD_PREP_CONST(AMDXDNA_ERR_CLASS_MASK, AMDXDNA_ERR_CLASS_AIE))
> +
> +#define AMDXDNA_EXTRA_ERR_COL_MASK	GENMASK_U64(7, 0)
> +#define AMDXDNA_EXTRA_ERR_ROW_MASK	GENMASK_U64(15, 8)
> +
> +#define AMDXDNA_EXTRA_ERR_ENCODE(row, col)				\
> +	(FIELD_PREP(AMDXDNA_EXTRA_ERR_COL_MASK, col) |			\
> +	 FIELD_PREP(AMDXDNA_EXTRA_ERR_ROW_MASK, row))
> +
> +#endif /* _AMDXDNA_ERROR_H_ */
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index aa04452310e5..696fdac8ad3c 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -27,9 +27,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>   /*
>    * 0.0: Initial version
>    * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
> + * 0.2: Support getting last error hardware error
>    */
>   #define AMDXDNA_DRIVER_MAJOR		0
> -#define AMDXDNA_DRIVER_MINOR		1
> +#define AMDXDNA_DRIVER_MINOR		2
>   
>   /*
>    * Bind the driver base on (vendor_id, device_id) pair and later use the
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index a1fb9785db77..c7eec9ceb2ae 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -523,7 +523,20 @@ struct amdxdna_drm_hwctx_entry {
>   	__u32 pad;
>   };
>   
> +/**
> + * struct amdxdna_async_error - XDNA async error structure
> + */
> +struct amdxdna_async_error {
> +	/** @err_code: Error code. */
> +	__u64 err_code;
> +	/** @ts_us: Timestamp. */
> +	__u64 ts_us;
> +	/** @ex_err_code: Extra error code */
> +	__u64 ex_err_code;
> +};
> +
>   #define DRM_AMDXDNA_HW_CONTEXT_ALL	0
> +#define DRM_AMDXDNA_HW_LAST_ASYNC_ERR	2
>   
>   /**
>    * struct amdxdna_drm_get_array - Get information array.

