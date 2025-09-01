Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA3B3E062
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 12:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074F410E41C;
	Mon,  1 Sep 2025 10:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzIZ17Kj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E59C10E41C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 10:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756723147; x=1788259147;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dRSrFAqLbSzEqpAHrRj6aOyVqMt0Rv9RbSRogviT0iM=;
 b=gzIZ17KjOjLi769xJW9hiVNkbbzNOY1EVGvPIufRbnt+9EVKY64k5mZd
 MuvJKNvCu9ZPtKyu53HhBbA4lbEV31S6G72Q1t80aREFLCByrO5bRaJO6
 CP89ywEHj5ttr9ZVLGLVIkOnlrkZnVz9wbbGIOyCC4NZU5PaJhFIyxhfn
 VP/gfxngKRfwWnatVqkZz6YhXI6yyfCJvsYT+FGfSDnR8seKnKs3/cAxT
 ZMkNafZqpoWNzH+ZeRcHvoWeW6pu0hIVX1RmSUMNApP3s0T7uKLM3EbWn
 LzBdJW51UPMaod2VPK2V2zH2TOr51Tf6dalkWDZa5o/HB9Fe416TttIri g==;
X-CSE-ConnectionGUID: b0atfZamTQGz/TynRTRinA==
X-CSE-MsgGUID: masALdJpTaaHPrgrhtXwGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59043936"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59043936"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:39:06 -0700
X-CSE-ConnectionGUID: OA3WSyxMSp+dZk3qckImAw==
X-CSE-MsgGUID: 6P65j512TA6zP8voTdwUhA==
X-ExtLoop1: 1
Received: from dmilosz-mobl.ger.corp.intel.com (HELO [10.245.252.194])
 ([10.245.252.194])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:39:04 -0700
Message-ID: <8f45c329-256f-4e26-89be-6c410d0b7788@linux.intel.com>
Date: Mon, 1 Sep 2025 12:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Prevent recovery work from being queued
 during device removal
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>, stable@vger.kernel.org
References: <20250808110939.328366-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250808110939.328366-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-fixes

On 8/8/2025 1:09 PM, Jacek Lawrynowicz wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Use disable_work_sync() instead of cancel_work_sync() in ivpu_dev_fini()
> to ensure that no new recovery work items can be queued after device
> removal has started. Previously, recovery work could be scheduled even
> after canceling existing work, potentially leading to use-after-free
> bugs if recovery accessed freed resources.
> 
> Rename ivpu_pm_cancel_recovery() to ivpu_pm_disable_recovery() to better
> reflect its new behavior.
> 
> Fixes: 58cde80f45a2 ("accel/ivpu: Use dedicated work for job timeout detection")
> Cc: <stable@vger.kernel.org> # v6.8+
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_drv.c | 2 +-
>  drivers/accel/ivpu/ivpu_pm.c  | 4 ++--
>  drivers/accel/ivpu/ivpu_pm.h  | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 3d6d52492536a..3289751b47573 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -677,7 +677,7 @@ static void ivpu_bo_unbind_all_user_contexts(struct ivpu_device *vdev)
>  static void ivpu_dev_fini(struct ivpu_device *vdev)
>  {
>  	ivpu_jobs_abort_all(vdev);
> -	ivpu_pm_cancel_recovery(vdev);
> +	ivpu_pm_disable_recovery(vdev);
>  	ivpu_pm_disable(vdev);
>  	ivpu_prepare_for_reset(vdev);
>  	ivpu_shutdown(vdev);
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index eacda1dbe8405..475ddc94f1cfe 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -417,10 +417,10 @@ void ivpu_pm_init(struct ivpu_device *vdev)
>  	ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", delay);
>  }
>  
> -void ivpu_pm_cancel_recovery(struct ivpu_device *vdev)
> +void ivpu_pm_disable_recovery(struct ivpu_device *vdev)
>  {
>  	drm_WARN_ON(&vdev->drm, delayed_work_pending(&vdev->pm->job_timeout_work));
> -	cancel_work_sync(&vdev->pm->recovery_work);
> +	disable_work_sync(&vdev->pm->recovery_work);
>  }
>  
>  void ivpu_pm_enable(struct ivpu_device *vdev)
> diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
> index 89b264cc0e3e7..a2aa7a27f32ef 100644
> --- a/drivers/accel/ivpu/ivpu_pm.h
> +++ b/drivers/accel/ivpu/ivpu_pm.h
> @@ -25,7 +25,7 @@ struct ivpu_pm_info {
>  void ivpu_pm_init(struct ivpu_device *vdev);
>  void ivpu_pm_enable(struct ivpu_device *vdev);
>  void ivpu_pm_disable(struct ivpu_device *vdev);
> -void ivpu_pm_cancel_recovery(struct ivpu_device *vdev);
> +void ivpu_pm_disable_recovery(struct ivpu_device *vdev);
>  
>  int ivpu_pm_suspend_cb(struct device *dev);
>  int ivpu_pm_resume_cb(struct device *dev);

