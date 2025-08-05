Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BB0B1BA82
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 20:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BC210E2AD;
	Tue,  5 Aug 2025 18:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q5RcZ6QH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABA210E2AD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 18:55:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 02DC4A56745;
 Tue,  5 Aug 2025 18:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01573C4CEF0;
 Tue,  5 Aug 2025 18:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754420128;
 bh=USC2EESxnOmf+5Qt9CEKOEaMZtDjkRdle8CeVvzYKDY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q5RcZ6QHUV5xlr+bghIaMGbyvF1XtVKH44DCLXVw7u48YYL0r4CNsxWwakt/ySXvz
 o1/rBKuppFLtsZc8vJtMiAcbYrT+cx1jt1RJJlBO4YsDI9YUIwLya2+OaimSmJ+QDD
 Adf3HAsk3yfG/iBvxe2G22K+7WzNYllIJp7h1qkiDoi9bpxKREnXLc91dyOyEh4kzq
 CY0OsY3JCPhweIKYODY7RKPxJVuLJuelVDbDBFtjaDPO1S7xLzx/SjCWLJxZi5eSnq
 1dTiLJAjfJfUdgCkrZP9Kx4Fm+/xv+Fsl+FjCvSiGBux4dAgVCD85VdtPojt7EQz27
 UQtdQhgL8i3qw==
Message-ID: <8d877db5-3c16-44dd-8be8-eb3dd0130fc7@kernel.org>
Date: Tue, 5 Aug 2025 13:55:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Unify pm and rpm suspend and resume
 callbacks
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20250803191450.1568851-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250803191450.1568851-1-lizhi.hou@amd.com>
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

On 8/3/25 2:14 PM, Lizhi Hou wrote:
> The suspend and resume callbacks for pm and runtime pm should be same.
> During suspending, it needs to stop all hardware contexts first. And
> the hardware contexts will be restarted after the device is resumed.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

(I had an email transmission mistake, sorry if this is recieved twice by 
anyone.)

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/accel/amdxdna/aie2_ctx.c        | 59 ++++++++++----------
>   drivers/accel/amdxdna/aie2_pci.c        | 37 +++++++++++--
>   drivers/accel/amdxdna/aie2_pci.h        |  5 +-
>   drivers/accel/amdxdna/amdxdna_ctx.c     | 26 ---------
>   drivers/accel/amdxdna/amdxdna_ctx.h     |  2 -
>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 74 +++----------------------
>   drivers/accel/amdxdna/amdxdna_pci_drv.h |  4 +-
>   7 files changed, 73 insertions(+), 134 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 2cff5419bd2f..910ffb7051f4 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -46,6 +46,17 @@ static void aie2_job_put(struct amdxdna_sched_job *job)
>   	kref_put(&job->refcnt, aie2_job_release);
>   }
>   
> +static void aie2_hwctx_status_shift_stop(struct amdxdna_hwctx *hwctx)
> +{
> +	 hwctx->old_status = hwctx->status;
> +	 hwctx->status = HWCTX_STAT_STOP;
> +}
> +
> +static void aie2_hwctx_status_restore(struct amdxdna_hwctx *hwctx)
> +{
> +	hwctx->status = hwctx->old_status;
> +}
> +
>   /* The bad_job is used in aie2_sched_job_timedout, otherwise, set it to NULL */
>   static void aie2_hwctx_stop(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx,
>   			    struct drm_sched_job *bad_job)
> @@ -89,25 +100,6 @@ static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hw
>   	return ret;
>   }
>   
> -void aie2_restart_ctx(struct amdxdna_client *client)
> -{
> -	struct amdxdna_dev *xdna = client->xdna;
> -	struct amdxdna_hwctx *hwctx;
> -	unsigned long hwctx_id;
> -
> -	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> -	mutex_lock(&client->hwctx_lock);
> -	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
> -		if (hwctx->status != HWCTX_STAT_STOP)
> -			continue;
> -
> -		hwctx->status = hwctx->old_status;
> -		XDNA_DBG(xdna, "Resetting %s", hwctx->name);
> -		aie2_hwctx_restart(xdna, hwctx);
> -	}
> -	mutex_unlock(&client->hwctx_lock);
> -}
> -
>   static struct dma_fence *aie2_cmd_get_out_fence(struct amdxdna_hwctx *hwctx, u64 seq)
>   {
>   	struct dma_fence *fence, *out_fence = NULL;
> @@ -141,9 +133,11 @@ static void aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
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
> @@ -151,15 +145,19 @@ void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx)
>   	 * and abort all commands.
>   	 */
>   	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> -	aie2_hwctx_wait_for_idle(hwctx);
> -	aie2_hwctx_stop(xdna, hwctx, NULL);
> -	hwctx->old_status = hwctx->status;
> -	hwctx->status = HWCTX_STAT_STOP;
> +	guard(mutex)(&client->hwctx_lock);
> +	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
> +		aie2_hwctx_wait_for_idle(hwctx);
> +		aie2_hwctx_stop(xdna, hwctx, NULL);
> +		aie2_hwctx_status_shift_stop(hwctx);
> +	}
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
> @@ -167,8 +165,11 @@ void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
>   	 * mailbox channel, error will return.
>   	 */
>   	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> -	hwctx->status = hwctx->old_status;
> -	aie2_hwctx_restart(xdna, hwctx);
> +	guard(mutex)(&client->hwctx_lock);
> +	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
> +		aie2_hwctx_status_restore(hwctx);
> +		aie2_hwctx_restart(xdna, hwctx);
> +	}
>   }
>   
>   static void
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 3474a8d4e560..6fc3191c3097 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -440,6 +440,37 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   	return ret;
>   }
>   
> +static int aie2_hw_suspend(struct amdxdna_dev *xdna)
> +{
> +	struct amdxdna_client *client;
> +
> +	guard(mutex)(&xdna->dev_lock);
> +	list_for_each_entry(client, &xdna->client_list, node)
> +		aie2_hwctx_suspend(client);
> +
> +	aie2_hw_stop(xdna);
> +
> +	return 0;
> +}
> +
> +static int aie2_hw_resume(struct amdxdna_dev *xdna)
> +{
> +	struct amdxdna_client *client;
> +	int ret;
> +
> +	guard(mutex)(&xdna->dev_lock);
> +	ret = aie2_hw_start(xdna);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Start hardware failed, %d", ret);
> +		return ret;
> +	}
> +
> +	list_for_each_entry(client, &xdna->client_list, node)
> +		aie2_hwctx_resume(client);
> +
> +	return ret;
> +}
> +
>   static int aie2_init(struct amdxdna_dev *xdna)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
> @@ -901,8 +932,8 @@ static int aie2_set_state(struct amdxdna_client *client,
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
> @@ -910,6 +941,4 @@ const struct amdxdna_dev_ops aie2_ops = {
>   	.hwctx_config   = aie2_hwctx_config,
>   	.cmd_submit     = aie2_cmd_submit,
>   	.hmm_invalidate = aie2_hmm_invalidate,
> -	.hwctx_suspend  = aie2_hwctx_suspend,
> -	.hwctx_resume   = aie2_hwctx_resume,
>   };
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 385914840eaa..488d8ee568eb 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -288,10 +288,9 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>   void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
>   int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
> -void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx);
> -void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx);
> +void aie2_hwctx_suspend(struct amdxdna_client *client);
> +void aie2_hwctx_resume(struct amdxdna_client *client);
>   int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
>   void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
> -void aie2_restart_ctx(struct amdxdna_client *client);
>   
>   #endif /* _AIE2_PCI_H_ */
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

