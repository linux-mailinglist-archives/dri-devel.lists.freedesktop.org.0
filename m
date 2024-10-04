Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE2499003C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 11:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D35F10E250;
	Fri,  4 Oct 2024 09:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEWQI4tB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C11910E250
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 09:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728035487; x=1759571487;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3LUO0pHMJ3gRHY4MyWGlnNe62Y1yIsb3N3CnA/PN4oE=;
 b=KEWQI4tBwr+HYFEEwujy7a9GgDjH1jYzJYfFa7QwOygIgE46CyjBqaBj
 PUIJidmRU+XrCqwU8hUwUXl8pf3+nJBrOm1ArEse89aKm5k2koRInM/PR
 YxfDfI3wlzFXJwi3GCRAC2ViMO/p8qSJHd1HC3vu3OMzlHZkP4z63eBsH
 PlXDvaAxJTmP7rzahYZw1KK+TprgJalpESrc+C9wZAOU2c2wO+mPsiWLc
 XVYRrceKtQZGwkDpl/U98I7PBu9TAeJ1hggErWdsYfdyPLkGdnOyrl2V1
 zRSkoMcCpjtPcr5wG9lQElaqPwEnmmmKAXyOeCh7KsL4NE7bYx2mVFuA7 g==;
X-CSE-ConnectionGUID: fDtBa9MMQQiyGxkcmVMrXQ==
X-CSE-MsgGUID: 51mKLL0NR7mKsYnF05m2lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37857074"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="37857074"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:51:27 -0700
X-CSE-ConnectionGUID: Y5rIj9jKRhm4IQsEd8A2cQ==
X-CSE-MsgGUID: roxSG5krS9aluXR9MFaXtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74332813"
Received: from anugen2x-mobl.ger.corp.intel.com (HELO [10.245.64.247])
 ([10.245.64.247])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:51:25 -0700
Message-ID: <5e16f232-7aff-46a8-9fad-a6703f095482@linux.intel.com>
Date: Fri, 4 Oct 2024 11:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/51] accel/ivpu: Switch to __pm_runtime_put_autosuspend()
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094111.113368-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241004094111.113368-1-sakari.ailus@linux.intel.com>
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 10/4/2024 11:41 AM, Sakari Ailus wrote:
> pm_runtime_put_autosuspend() will soon be changed to include a call to
> pm_runtime_mark_last_busy(). This patch switches the current users to
> __pm_runtime_put_autosuspend() which will continue to have the
> functionality of old pm_runtime_put_autosuspend().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_drv.c | 2 +-
>  drivers/accel/ivpu/ivpu_pm.c  | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index c91400ecf926..4140ff55a4e6 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -104,7 +104,7 @@ static void file_priv_release(struct kref *ref)
>  	mutex_lock(&vdev->context_list_lock);
>  	file_priv_unbind(vdev, file_priv);
>  	mutex_unlock(&vdev->context_list_lock);
> -	pm_runtime_put_autosuspend(vdev->drm.dev);
> +	__pm_runtime_put_autosuspend(vdev->drm.dev);
>  
>  	mutex_destroy(&file_priv->ms_lock);
>  	mutex_destroy(&file_priv->lock);
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 59d3170f5e35..643854e51fa0 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -143,7 +143,7 @@ static void ivpu_pm_recovery_work(struct work_struct *work)
>  
>  	kobject_uevent_env(&vdev->drm.dev->kobj, KOBJ_CHANGE, evt);
>  	pm_runtime_mark_last_busy(vdev->drm.dev);
> -	pm_runtime_put_autosuspend(vdev->drm.dev);
> +	__pm_runtime_put_autosuspend(vdev->drm.dev);
>  }
>  
>  void ivpu_pm_trigger_recovery(struct ivpu_device *vdev, const char *reason)
> @@ -303,7 +303,7 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
>  void ivpu_rpm_put(struct ivpu_device *vdev)
>  {
>  	pm_runtime_mark_last_busy(vdev->drm.dev);
> -	pm_runtime_put_autosuspend(vdev->drm.dev);
> +	__pm_runtime_put_autosuspend(vdev->drm.dev);
>  }
>  
>  void ivpu_pm_reset_prepare_cb(struct pci_dev *pdev)
> @@ -339,7 +339,7 @@ void ivpu_pm_reset_done_cb(struct pci_dev *pdev)
>  	ivpu_dbg(vdev, PM, "Post-reset done.\n");
>  
>  	pm_runtime_mark_last_busy(vdev->drm.dev);
> -	pm_runtime_put_autosuspend(vdev->drm.dev);
> +	__pm_runtime_put_autosuspend(vdev->drm.dev);
>  }
>  
>  void ivpu_pm_init(struct ivpu_device *vdev)
> @@ -381,7 +381,7 @@ void ivpu_pm_enable(struct ivpu_device *vdev)
>  	pm_runtime_set_active(dev);
>  	pm_runtime_allow(dev);
>  	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_put_autosuspend(dev);
> +	__pm_runtime_put_autosuspend(dev);
>  }
>  
>  void ivpu_pm_disable(struct ivpu_device *vdev)

