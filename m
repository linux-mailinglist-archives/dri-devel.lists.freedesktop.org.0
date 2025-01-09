Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7497A06FDC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9921710ED21;
	Thu,  9 Jan 2025 08:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2KncfNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F1810ED0C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736410942; x=1767946942;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eQJDttO/EIq9n3/7cRpPl9S3CaLHYIhnwYjhgRESoDw=;
 b=f2KncfNGhFP1eWjEzEOXo/3IFTXAXnJKMSZaE1QemCO6yKpfcThGgIJv
 eNEJXFS/tTOrY5SUFkjRerpaGzPfB1E0C7AOLfHtRO6X9s4M4BW9B3Od4
 8CpwM3NzPOxthHiX2zPe6HayWWgVgSHQQ9d9yMF7QfWYnrueTIumEKmYd
 MrZ5m/uTcPvaCrqIlU5eDtBxdMM0JMW2PDpWQsaPoLsqZQNVCPSdczJa7
 on29eOez2EG7AbZTdB+BYsOhM5c5RRshHE/D5Ya4rpNFup8rlLkIx7oB7
 vLVcsKelTHNUdi6UgRK9nsf3o9lknDoJ0Ir/bM09CtXxgVAcKwWhiqSCX A==;
X-CSE-ConnectionGUID: 5AfgzL6JQD6T0qIYCCDa5g==
X-CSE-MsgGUID: dOAtnNuMQPONBWa68bhujg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40339156"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="40339156"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:22:22 -0800
X-CSE-ConnectionGUID: AC1L8rYVSPKDUGlz+is5+Q==
X-CSE-MsgGUID: yCiorFKLRwCXgqFL0T/2jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107955210"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:22:20 -0800
Message-ID: <231e2b39-aeab-4dba-95f2-aaf73ad0dfaf@linux.intel.com>
Date: Thu, 9 Jan 2025 09:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] accel/ivpu: Separate DB ID and CMDQ ID allocations
 from CMDQ allocation
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
 <20250107173238.381120-2-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250107173238.381120-2-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

This will allows -> This will allow

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 1/7/2025 6:32 PM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Move doorbell ID and command queue ID XArray allocations from command
> queue memory allocation function. This will allows IDs allocations to be
> done without the need for actual memory allocation.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_job.c | 88 +++++++++++++++++++++++++----------
>  1 file changed, 64 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 7149312f16e1..98e53cb38ecd 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -83,23 +83,9 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
>  	if (!cmdq)
>  		return NULL;
>  
> -	ret = xa_alloc_cyclic(&vdev->db_xa, &cmdq->db_id, NULL, vdev->db_limit, &vdev->db_next,
> -			      GFP_KERNEL);
> -	if (ret < 0) {
> -		ivpu_err(vdev, "Failed to allocate doorbell id: %d\n", ret);
> -		goto err_free_cmdq;
> -	}
> -
> -	ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &cmdq->id, cmdq, file_priv->cmdq_limit,
> -			      &file_priv->cmdq_id_next, GFP_KERNEL);
> -	if (ret < 0) {
> -		ivpu_err(vdev, "Failed to allocate command queue id: %d\n", ret);
> -		goto err_erase_db_xa;
> -	}
> -
>  	cmdq->mem = ivpu_bo_create_global(vdev, SZ_4K, DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
>  	if (!cmdq->mem)
> -		goto err_erase_cmdq_xa;
> +		goto err_free_cmdq;
>  
>  	ret = ivpu_preemption_buffers_create(vdev, file_priv, cmdq);
>  	if (ret)
> @@ -107,10 +93,6 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
>  
>  	return cmdq;
>  
> -err_erase_cmdq_xa:
> -	xa_erase(&file_priv->cmdq_xa, cmdq->id);
> -err_erase_db_xa:
> -	xa_erase(&vdev->db_xa, cmdq->db_id);
>  err_free_cmdq:
>  	kfree(cmdq);
>  	return NULL;
> @@ -233,30 +215,88 @@ static int ivpu_cmdq_fini(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cm
>  	return 0;
>  }
>  
> +static int ivpu_db_id_alloc(struct ivpu_device *vdev, u32 *db_id)
> +{
> +	int ret;
> +	u32 id;
> +
> +	ret = xa_alloc_cyclic(&vdev->db_xa, &id, NULL, vdev->db_limit, &vdev->db_next, GFP_KERNEL);
> +	if (ret < 0)
> +		return ret;
> +
> +	*db_id = id;
> +	return 0;
> +}
> +
> +static int ivpu_cmdq_id_alloc(struct ivpu_file_priv *file_priv, u32 *cmdq_id)
> +{
> +	int ret;
> +	u32 id;
> +
> +	ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &id, NULL, file_priv->cmdq_limit,
> +			      &file_priv->cmdq_id_next, GFP_KERNEL);
> +	if (ret < 0)
> +		return ret;
> +
> +	*cmdq_id = id;
> +	return 0;
> +}
> +
>  static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u8 priority)
>  {
> +	struct ivpu_device *vdev = file_priv->vdev;
>  	struct ivpu_cmdq *cmdq;
> -	unsigned long cmdq_id;
> +	unsigned long id;
>  	int ret;
>  
>  	lockdep_assert_held(&file_priv->lock);
>  
> -	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq)
> +	xa_for_each(&file_priv->cmdq_xa, id, cmdq)
>  		if (cmdq->priority == priority)
>  			break;
>  
>  	if (!cmdq) {
>  		cmdq = ivpu_cmdq_alloc(file_priv);
> -		if (!cmdq)
> +		if (!cmdq) {
> +			ivpu_err(vdev, "Failed to allocate command queue\n");
>  			return NULL;
> +		}
> +
> +		ret = ivpu_db_id_alloc(vdev, &cmdq->db_id);
> +		if (ret) {
> +			ivpu_err(file_priv->vdev, "Failed to allocate doorbell ID: %d\n", ret);
> +			goto err_free_cmdq;
> +		}
> +
> +		ret = ivpu_cmdq_id_alloc(file_priv, &cmdq->id);
> +		if (ret) {
> +			ivpu_err(vdev, "Failed to allocate command queue ID: %d\n", ret);
> +			goto err_erase_db_id;
> +		}
> +
>  		cmdq->priority = priority;
> +		ret = xa_err(xa_store(&file_priv->cmdq_xa, cmdq->id, cmdq, GFP_KERNEL));
> +		if (ret) {
> +			ivpu_err(vdev, "Failed to store command queue in cmdq_xa: %d\n", ret);
> +			goto err_erase_cmdq_id;
> +		}
>  	}
>  
>  	ret = ivpu_cmdq_init(file_priv, cmdq, priority);
> -	if (ret)
> -		return NULL;
> +	if (ret) {
> +		ivpu_err(vdev, "Failed to initialize command queue: %d\n", ret);
> +		goto err_free_cmdq;
> +	}
>  
>  	return cmdq;
> +
> +err_erase_cmdq_id:
> +	xa_erase(&file_priv->cmdq_xa, cmdq->id);
> +err_erase_db_id:
> +	xa_erase(&vdev->db_xa, cmdq->db_id);
> +err_free_cmdq:
> +	ivpu_cmdq_free(file_priv, cmdq);
> +	return NULL;
>  }
>  
>  void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)

