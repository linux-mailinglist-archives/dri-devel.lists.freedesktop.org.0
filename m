Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0467CAF4CA
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE3010E4A2;
	Tue,  9 Dec 2025 08:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TD1mmFEb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8999610E4A2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765268933; x=1796804933;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Mv6T5zf9LHts0wh3KflA3z7Wqw3aIm2dAzqubs+XCEo=;
 b=TD1mmFEbPDc5YQhjMPGukKhp/bai5RyaCuhR10XMKv2h9IxvZWSEaBNp
 ANOBEqFQtHkZiwMy9od9WpmmuNLQkIoGWFs/snVvh4A2qSAIZVakobGv7
 KgCgtcJpIkzDe6HHFU0Ui4pOztsIg/EloBgx623g/mgaXVs+xm/jX/Bnb
 /iSVgbq9x5YZ5312Iv0kh1X21MQqmvF0LjzM0PufwMdfwCGs7WTIzv1ff
 715Nw50eUYZcVmM4SQGLgRocw4D6dOlzeCc9yrATlvuPhpwSDfibpzW2I
 I7ngRQSx4/zB/u6/cICjeN1s4ZfGxH/ZSqMgs8+W/tUbspm/JPwdg0WhO A==;
X-CSE-ConnectionGUID: fm104hcHQRy4hCQgTZgAZw==
X-CSE-MsgGUID: p2mjblL0Q6isB8Uz9GKltw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77543990"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="77543990"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 00:28:52 -0800
X-CSE-ConnectionGUID: vC5tN71uSMKXEIJmnj6B8w==
X-CSE-MsgGUID: y32AJgWWTxO5aKxtFBUd7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="195771180"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.94.253.247])
 ([10.94.253.247])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 00:28:50 -0800
Message-ID: <4b3b19a6-1569-4647-ae88-e5de496d4e0d@linux.intel.com>
Date: Tue, 9 Dec 2025 09:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Fix race condition when checking rpm_on
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20251208165356.1549237-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251208165356.1549237-1-lizhi.hou@amd.com>
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

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 12/8/2025 5:53 PM, Lizhi Hou wrote:
> When autosuspend is triggered, driver rpm_on flag is set to indicate that
> a suspend/resume is already in progress. However, when a userspace
> application submits a command during this narrow window,
> amdxdna_pm_resume_get() may incorrectly skip the resume operation because
> the rpm_on flag is still set. This results in commands being submitted
> while the device has not actually resumed, causing unexpected behavior.
>
> The set_dpm() is called by suspend/resume, it relied on rpm_on flag to
> avoid calling into rpm suspend/resume recursivly. So to fix this, remove
> the use of the rpm_on flag entirely. Instead, introduce aie2_pm_set_dpm()
> which explicitly resumes the device before invoking set_dpm(). With this
> change, set_dpm() is called directly inside the suspend or resume execution
> path. Otherwise, aie2_pm_set_dpm() is called.
>
> Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
> v2:
>      Removed drm_WARN_ON() from aie2_send_mgmt_msg_wait().
>      Revise the description.
>
>   drivers/accel/amdxdna/aie2_message.c    |  1 -
>   drivers/accel/amdxdna/aie2_pci.c        |  2 +-
>   drivers/accel/amdxdna/aie2_pci.h        |  1 +
>   drivers/accel/amdxdna/aie2_pm.c         | 17 +++++++++++++++-
>   drivers/accel/amdxdna/aie2_smu.c        | 27 ++++---------------------
>   drivers/accel/amdxdna/amdxdna_pci_drv.h |  1 -
>   drivers/accel/amdxdna/amdxdna_pm.c      | 22 ++------------------
>   7 files changed, 24 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index fee3b0627aba..a75156800467 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -39,7 +39,6 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
>   	if (!ndev->mgmt_chann)
>   		return -ENODEV;
>   
> -	drm_WARN_ON(&xdna->ddev, xdna->rpm_on && !mutex_is_locked(&xdna->dev_lock));
>   	ret = xdna_send_msg_wait(xdna, ndev->mgmt_chann, msg);
>   	if (ret == -ETIME) {
>   		xdna_mailbox_stop_channel(ndev->mgmt_chann);
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index ceef1c502e9e..81a8e4137bfd 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -321,7 +321,7 @@ static int aie2_xrs_set_dft_dpm_level(struct drm_device *ddev, u32 dpm_level)
>   	if (ndev->pw_mode != POWER_MODE_DEFAULT || ndev->dpm_level == dpm_level)
>   		return 0;
>   
> -	return ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
> +	return aie2_pm_set_dpm(ndev, dpm_level);
>   }
>   
>   static struct xrs_action_ops aie2_xrs_actions = {
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index cc9f933f80b2..c6b5cf4ae5c4 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -286,6 +286,7 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
>   /* aie2_pm.c */
>   int aie2_pm_init(struct amdxdna_dev_hdl *ndev);
>   int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, enum amdxdna_power_mode_type target);
> +int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
>   
>   /* aie2_psp.c */
>   struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *conf);
> diff --git a/drivers/accel/amdxdna/aie2_pm.c b/drivers/accel/amdxdna/aie2_pm.c
> index 426c38fce848..afcd6d4683e5 100644
> --- a/drivers/accel/amdxdna/aie2_pm.c
> +++ b/drivers/accel/amdxdna/aie2_pm.c
> @@ -10,6 +10,7 @@
>   
>   #include "aie2_pci.h"
>   #include "amdxdna_pci_drv.h"
> +#include "amdxdna_pm.h"
>   
>   #define AIE2_CLK_GATING_ENABLE	1
>   #define AIE2_CLK_GATING_DISABLE	0
> @@ -26,6 +27,20 @@ static int aie2_pm_set_clk_gating(struct amdxdna_dev_hdl *ndev, u32 val)
>   	return 0;
>   }
>   
> +int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
> +{
> +	int ret;
> +
> +	ret = amdxdna_pm_resume_get(ndev->xdna);
> +	if (ret)
> +		return ret;
> +
> +	ret = ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
> +	amdxdna_pm_suspend_put(ndev->xdna);
> +
> +	return ret;
> +}
> +
>   int aie2_pm_init(struct amdxdna_dev_hdl *ndev)
>   {
>   	int ret;
> @@ -94,7 +109,7 @@ int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, enum amdxdna_power_mode_type
>   		return -EOPNOTSUPP;
>   	}
>   
> -	ret = ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
> +	ret = aie2_pm_set_dpm(ndev, dpm_level);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
> index bd94ee96c2bc..2d195e41f83d 100644
> --- a/drivers/accel/amdxdna/aie2_smu.c
> +++ b/drivers/accel/amdxdna/aie2_smu.c
> @@ -11,7 +11,6 @@
>   
>   #include "aie2_pci.h"
>   #include "amdxdna_pci_drv.h"
> -#include "amdxdna_pm.h"
>   
>   #define SMU_RESULT_OK		1
>   
> @@ -67,16 +66,12 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   	u32 freq;
>   	int ret;
>   
> -	ret = amdxdna_pm_resume_get(ndev->xdna);
> -	if (ret)
> -		return ret;
> -
>   	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_MPNPUCLK_FREQ,
>   			    ndev->priv->dpm_clk_tbl[dpm_level].npuclk, &freq);
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Set npu clock to %d failed, ret %d\n",
>   			 ndev->priv->dpm_clk_tbl[dpm_level].npuclk, ret);
> -		goto suspend_put;
> +		return ret;
>   	}
>   	ndev->npuclk_freq = freq;
>   
> @@ -85,10 +80,9 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Set h clock to %d failed, ret %d\n",
>   			 ndev->priv->dpm_clk_tbl[dpm_level].hclk, ret);
> -		goto suspend_put;
> +		return ret;
>   	}
>   
> -	amdxdna_pm_suspend_put(ndev->xdna);
>   	ndev->hclk_freq = freq;
>   	ndev->dpm_level = dpm_level;
>   	ndev->max_tops = 2 * ndev->total_col;
> @@ -98,35 +92,26 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   		 ndev->npuclk_freq, ndev->hclk_freq);
>   
>   	return 0;
> -
> -suspend_put:
> -	amdxdna_pm_suspend_put(ndev->xdna);
> -	return ret;
>   }
>   
>   int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   {
>   	int ret;
>   
> -	ret = amdxdna_pm_resume_get(ndev->xdna);
> -	if (ret)
> -		return ret;
> -
>   	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_HARD_DPMLEVEL, dpm_level, NULL);
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Set hard dpm level %d failed, ret %d ",
>   			 dpm_level, ret);
> -		goto suspend_put;
> +		return ret;
>   	}
>   
>   	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_SOFT_DPMLEVEL, dpm_level, NULL);
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Set soft dpm level %d failed, ret %d",
>   			 dpm_level, ret);
> -		goto suspend_put;
> +		return ret;
>   	}
>   
> -	amdxdna_pm_suspend_put(ndev->xdna);
>   	ndev->npuclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].npuclk;
>   	ndev->hclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].hclk;
>   	ndev->dpm_level = dpm_level;
> @@ -137,10 +122,6 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   		 ndev->npuclk_freq, ndev->hclk_freq);
>   
>   	return 0;
> -
> -suspend_put:
> -	amdxdna_pm_suspend_put(ndev->xdna);
> -	return ret;
>   }
>   
>   int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> index c99477f5e454..0d50c4c8b353 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> @@ -101,7 +101,6 @@ struct amdxdna_dev {
>   	struct amdxdna_fw_ver		fw_ver;
>   	struct rw_semaphore		notifier_lock; /* for mmu notifier*/
>   	struct workqueue_struct		*notifier_wq;
> -	bool				rpm_on;
>   };
>   
>   /*
> diff --git a/drivers/accel/amdxdna/amdxdna_pm.c b/drivers/accel/amdxdna/amdxdna_pm.c
> index fa38e65d617c..d024d480521c 100644
> --- a/drivers/accel/amdxdna/amdxdna_pm.c
> +++ b/drivers/accel/amdxdna/amdxdna_pm.c
> @@ -15,14 +15,9 @@ int amdxdna_pm_suspend(struct device *dev)
>   {
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>   	int ret = -EOPNOTSUPP;
> -	bool rpm;
>   
> -	if (xdna->dev_info->ops->suspend) {
> -		rpm = xdna->rpm_on;
> -		xdna->rpm_on = false;
> +	if (xdna->dev_info->ops->suspend)
>   		ret = xdna->dev_info->ops->suspend(xdna);
> -		xdna->rpm_on = rpm;
> -	}
>   
>   	XDNA_DBG(xdna, "Suspend done ret %d", ret);
>   	return ret;
> @@ -32,14 +27,9 @@ int amdxdna_pm_resume(struct device *dev)
>   {
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>   	int ret = -EOPNOTSUPP;
> -	bool rpm;
>   
> -	if (xdna->dev_info->ops->resume) {
> -		rpm = xdna->rpm_on;
> -		xdna->rpm_on = false;
> +	if (xdna->dev_info->ops->resume)
>   		ret = xdna->dev_info->ops->resume(xdna);
> -		xdna->rpm_on = rpm;
> -	}
>   
>   	XDNA_DBG(xdna, "Resume done ret %d", ret);
>   	return ret;
> @@ -50,9 +40,6 @@ int amdxdna_pm_resume_get(struct amdxdna_dev *xdna)
>   	struct device *dev = xdna->ddev.dev;
>   	int ret;
>   
> -	if (!xdna->rpm_on)
> -		return 0;
> -
>   	ret = pm_runtime_resume_and_get(dev);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Resume failed: %d", ret);
> @@ -66,9 +53,6 @@ void amdxdna_pm_suspend_put(struct amdxdna_dev *xdna)
>   {
>   	struct device *dev = xdna->ddev.dev;
>   
> -	if (!xdna->rpm_on)
> -		return;
> -
>   	pm_runtime_put_autosuspend(dev);
>   }
>   
> @@ -81,14 +65,12 @@ void amdxdna_pm_init(struct amdxdna_dev *xdna)
>   	pm_runtime_use_autosuspend(dev);
>   	pm_runtime_allow(dev);
>   	pm_runtime_put_autosuspend(dev);
> -	xdna->rpm_on = true;
>   }
>   
>   void amdxdna_pm_fini(struct amdxdna_dev *xdna)
>   {
>   	struct device *dev = xdna->ddev.dev;
>   
> -	xdna->rpm_on = false;
>   	pm_runtime_get_noresume(dev);
>   	pm_runtime_forbid(dev);
>   }
