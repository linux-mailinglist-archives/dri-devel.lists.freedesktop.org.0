Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54427B1842B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747C510E88C;
	Fri,  1 Aug 2025 14:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iruLuDfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125BE10E88C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754059731; x=1785595731;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4aTYOtvGvyeRYelP+ciu4gLIvTbVYyxY77M62iEFa7U=;
 b=iruLuDfY/0v2wFkqwL2X4h9VSM6fwRRWpNcM4FfD4YdWXGw+3H26HwO+
 Sa46HaSkaroZJPzHckDKP12P0wSrl/UWewou4W6JPkrRvxNBTjHbYmcM+
 +ghPcKEeNpm2WaI8NlVVIk3mjnqTFimC2A8sVpYj7iPSKwGwGqjiprQLD
 ezUMZjrLLUSL/gCnawTGN2IgSwB2+xWCbOMx1AcQW9Qq0AJc/elrbGMXa
 ekOmXAWCmiYuULoKqu2AUiLO4PTPuSwichmc3mtPen7K/Oa8n8gsJepdg
 aKsdKwQwhDAyVeuGQgpWe1yN/NRoV5hnfV5ZYHmBxDxIdC386eQE/mhee A==;
X-CSE-ConnectionGUID: BP45SBYnRqOrFsNmnJOPAw==
X-CSE-MsgGUID: uzkUOPrLTeWbaIWQ1cX8aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56297357"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56297357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:48:50 -0700
X-CSE-ConnectionGUID: TYHM6LT3SnSH9XKnKtkRkw==
X-CSE-MsgGUID: EmC0+ROvSd2rJ2rFSthKqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163933885"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.84.158])
 ([10.245.84.158])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:48:47 -0700
Message-ID: <84335bcc-b7a6-4a4a-ac80-2bd6062e2dd5@linux.intel.com>
Date: Fri, 1 Aug 2025 16:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Unify pm and rpm suspend and resume
 callbacks
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20250731163550.960686-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20250731163550.960686-1-lizhi.hou@amd.com>
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

On 7/31/2025 6:35 PM, Lizhi Hou wrote:

> The suspend and resume callbacks for pm and runtime pm should be same.
> During suspending, it needs to stop all hardware contexts first. And
> the hardware contexts will be restarted after the device is resumed.
>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c        | 32 +++++++----
>   drivers/accel/amdxdna/aie2_pci.c        | 41 ++++++++++++--
>   drivers/accel/amdxdna/aie2_pci.h        |  4 +-
>   drivers/accel/amdxdna/amdxdna_ctx.c     | 26 ---------
>   drivers/accel/amdxdna/amdxdna_ctx.h     |  2 -
>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 74 +++----------------------
>   drivers/accel/amdxdna/amdxdna_pci_drv.h |  4 +-
>   7 files changed, 69 insertions(+), 114 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 2cff5419bd2f..7444117f0e17 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -141,9 +141,11 @@ static void aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
>   	dma_fence_put(fence);
>   }
>   
> -void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx)
> +void aie2_hwctx_suspend(struct amdxdna_client *client)
>   {
> -	struct amdxdna_dev *xdna = hwctx->client->xdna;
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_hwctx *hwctx;
> +	unsigned long hwctx_id;
>   
>   	/*
>   	 * Command timeout is unlikely. But if it happens, it doesn't
> @@ -151,15 +153,21 @@ void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx)
>   	 * and abort all commands.
>   	 */
>   	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> -	aie2_hwctx_wait_for_idle(hwctx);
> -	aie2_hwctx_stop(xdna, hwctx, NULL);
> -	hwctx->old_status = hwctx->status;
> -	hwctx->status = HWCTX_STAT_STOP;
> +	mutex_lock(&client->hwctx_lock);
> +	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
> +		aie2_hwctx_wait_for_idle(hwctx);
> +		aie2_hwctx_stop(xdna, hwctx, NULL);
> +		hwctx->old_status = hwctx->status;
> +		hwctx->status = HWCTX_STAT_STOP;

nit: You might refactor this status shift for maintainability to 
something like
aie2_hwctx_shift_status(HWCTX_STAT_STOP);

But that is just a nit, otherwise

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> +	}
> +	mutex_unlock(&client->hwctx_lock);
>   }
>   
> -void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
> +void aie2_hwctx_resume(struct amdxdna_client *client)
>   {
> -	struct amdxdna_dev *xdna = hwctx->client->xdna;
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_hwctx *hwctx;
> +	unsigned long hwctx_id;
>   
>   	/*
>   	 * The resume path cannot guarantee that mailbox channel can be
> @@ -167,8 +175,12 @@ void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
>   	 * mailbox channel, error will return.
>   	 */
>   	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> -	hwctx->status = hwctx->old_status;
> -	aie2_hwctx_restart(xdna, hwctx);
> +	mutex_lock(&client->hwctx_lock);
> +	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
> +		hwctx->status = hwctx->old_status;
> +		aie2_hwctx_restart(xdna, hwctx);
> +	}
> +	mutex_unlock(&client->hwctx_lock);
>   }
>   
>   static void
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 3474a8d4e560..8b6f17430d3a 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -440,6 +440,41 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   	return ret;
>   }
>   
> +static int aie2_hw_suspend(struct amdxdna_dev *xdna)
> +{
> +	struct amdxdna_client *client;
> +
> +	mutex_lock(&xdna->dev_lock);
> +	list_for_each_entry(client, &xdna->client_list, node)
> +		aie2_hwctx_suspend(client);
> +
> +	aie2_hw_stop(xdna);
> +	mutex_unlock(&xdna->dev_lock);
> +
> +	return 0;
> +}
> +
> +static int aie2_hw_resume(struct amdxdna_dev *xdna)
> +{
> +	struct amdxdna_client *client;
> +	int ret;
> +
> +	mutex_lock(&xdna->dev_lock);
> +	ret = aie2_hw_start(xdna);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Start hardware failed, %d", ret);
> +		goto unlock;
> +	}
> +
> +	list_for_each_entry(client, &xdna->client_list, node)
> +		aie2_hwctx_resume(client);
> +
> +unlock:
> +	mutex_unlock(&xdna->dev_lock);
> +
> +	return ret;
> +}
> +
>   static int aie2_init(struct amdxdna_dev *xdna)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
> @@ -901,8 +936,8 @@ static int aie2_set_state(struct amdxdna_client *client,
>   const struct amdxdna_dev_ops aie2_ops = {
>   	.init           = aie2_init,
>   	.fini           = aie2_fini,
> -	.resume         = aie2_hw_start,
> -	.suspend        = aie2_hw_stop,
> +	.resume         = aie2_hw_resume,
> +	.suspend        = aie2_hw_suspend,
>   	.get_aie_info   = aie2_get_info,
>   	.set_aie_state	= aie2_set_state,
>   	.hwctx_init     = aie2_hwctx_init,
> @@ -910,6 +945,4 @@ const struct amdxdna_dev_ops aie2_ops = {
>   	.hwctx_config   = aie2_hwctx_config,
>   	.cmd_submit     = aie2_cmd_submit,
>   	.hmm_invalidate = aie2_hmm_invalidate,
> -	.hwctx_suspend  = aie2_hwctx_suspend,
> -	.hwctx_resume   = aie2_hwctx_resume,
>   };
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 385914840eaa..6b21909841e0 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -288,8 +288,8 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>   void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
>   int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
> -void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx);
> -void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx);
> +void aie2_hwctx_suspend(struct amdxdna_client *client);
> +void aie2_hwctx_resume(struct amdxdna_client *client);
>   int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
>   void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
>   void aie2_restart_ctx(struct amdxdna_client *client);
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
> index be073224bd69..b47a7f8e9017 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -60,32 +60,6 @@ static struct dma_fence *amdxdna_fence_create(struct amdxdna_hwctx *hwctx)
>   	return &fence->base;
>   }
>   
> -void amdxdna_hwctx_suspend(struct amdxdna_client *client)
> -{
> -	struct amdxdna_dev *xdna = client->xdna;
> -	struct amdxdna_hwctx *hwctx;
> -	unsigned long hwctx_id;
> -
> -	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> -	mutex_lock(&client->hwctx_lock);
> -	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
> -		xdna->dev_info->ops->hwctx_suspend(hwctx);
> -	mutex_unlock(&client->hwctx_lock);
> -}
> -
> -void amdxdna_hwctx_resume(struct amdxdna_client *client)
> -{
> -	struct amdxdna_dev *xdna = client->xdna;
> -	struct amdxdna_hwctx *hwctx;
> -	unsigned long hwctx_id;
> -
> -	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> -	mutex_lock(&client->hwctx_lock);
> -	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
> -		xdna->dev_info->ops->hwctx_resume(hwctx);
> -	mutex_unlock(&client->hwctx_lock);
> -}
> -
>   static void amdxdna_hwctx_destroy_rcu(struct amdxdna_hwctx *hwctx,
>   				      struct srcu_struct *ss)
>   {
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
> index f0a4a8586d85..c652229547a3 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
> @@ -147,8 +147,6 @@ static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
>   
>   void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
>   void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
> -void amdxdna_hwctx_suspend(struct amdxdna_client *client);
> -void amdxdna_hwctx_resume(struct amdxdna_client *client);
>   
>   int amdxdna_cmd_submit(struct amdxdna_client *client,
>   		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index f2bf1d374cc7..fbca94183f96 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -343,89 +343,29 @@ static void amdxdna_remove(struct pci_dev *pdev)
>   	mutex_unlock(&xdna->dev_lock);
>   }
>   
> -static int amdxdna_dev_suspend_nolock(struct amdxdna_dev *xdna)
> -{
> -	if (xdna->dev_info->ops->suspend)
> -		xdna->dev_info->ops->suspend(xdna);
> -
> -	return 0;
> -}
> -
> -static int amdxdna_dev_resume_nolock(struct amdxdna_dev *xdna)
> -{
> -	if (xdna->dev_info->ops->resume)
> -		return xdna->dev_info->ops->resume(xdna);
> -
> -	return 0;
> -}
> -
>   static int amdxdna_pmops_suspend(struct device *dev)
>   {
>   	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
> -	struct amdxdna_client *client;
> -
> -	mutex_lock(&xdna->dev_lock);
> -	list_for_each_entry(client, &xdna->client_list, node)
> -		amdxdna_hwctx_suspend(client);
>   
> -	amdxdna_dev_suspend_nolock(xdna);
> -	mutex_unlock(&xdna->dev_lock);
> +	if (!xdna->dev_info->ops->suspend)
> +		return -EOPNOTSUPP;
>   
> -	return 0;
> +	return xdna->dev_info->ops->suspend(xdna);
>   }
>   
>   static int amdxdna_pmops_resume(struct device *dev)
>   {
>   	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
> -	struct amdxdna_client *client;
> -	int ret;
> -
> -	XDNA_INFO(xdna, "firmware resuming...");
> -	mutex_lock(&xdna->dev_lock);
> -	ret = amdxdna_dev_resume_nolock(xdna);
> -	if (ret) {
> -		XDNA_ERR(xdna, "resume NPU firmware failed");
> -		mutex_unlock(&xdna->dev_lock);
> -		return ret;
> -	}
>   
> -	XDNA_INFO(xdna, "hardware context resuming...");
> -	list_for_each_entry(client, &xdna->client_list, node)
> -		amdxdna_hwctx_resume(client);
> -	mutex_unlock(&xdna->dev_lock);
> -
> -	return 0;
> -}
> -
> -static int amdxdna_rpmops_suspend(struct device *dev)
> -{
> -	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
> -	int ret;
> -
> -	mutex_lock(&xdna->dev_lock);
> -	ret = amdxdna_dev_suspend_nolock(xdna);
> -	mutex_unlock(&xdna->dev_lock);
> -
> -	XDNA_DBG(xdna, "Runtime suspend done ret: %d", ret);
> -	return ret;
> -}
> -
> -static int amdxdna_rpmops_resume(struct device *dev)
> -{
> -	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
> -	int ret;
> -
> -	mutex_lock(&xdna->dev_lock);
> -	ret = amdxdna_dev_resume_nolock(xdna);
> -	mutex_unlock(&xdna->dev_lock);
> +	if (!xdna->dev_info->ops->resume)
> +		return -EOPNOTSUPP;
>   
> -	XDNA_DBG(xdna, "Runtime resume done ret: %d", ret);
> -	return ret;
> +	return xdna->dev_info->ops->resume(xdna);
>   }
>   
>   static const struct dev_pm_ops amdxdna_pm_ops = {
>   	SYSTEM_SLEEP_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume)
> -	RUNTIME_PM_OPS(amdxdna_rpmops_suspend, amdxdna_rpmops_resume, NULL)
> +	RUNTIME_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume, NULL)
>   };
>   
>   static struct pci_driver amdxdna_pci_driver = {
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> index ab79600911aa..40bbb3c06320 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> @@ -50,13 +50,11 @@ struct amdxdna_dev_ops {
>   	int (*init)(struct amdxdna_dev *xdna);
>   	void (*fini)(struct amdxdna_dev *xdna);
>   	int (*resume)(struct amdxdna_dev *xdna);
> -	void (*suspend)(struct amdxdna_dev *xdna);
> +	int (*suspend)(struct amdxdna_dev *xdna);
>   	int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
>   	void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
>   	int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
>   	void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
> -	void (*hwctx_suspend)(struct amdxdna_hwctx *hwctx);
> -	void (*hwctx_resume)(struct amdxdna_hwctx *hwctx);
>   	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
>   	int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
>   	int (*set_aie_state)(struct amdxdna_client *client, struct amdxdna_drm_set_state *args);
Best regards,
Maciej
