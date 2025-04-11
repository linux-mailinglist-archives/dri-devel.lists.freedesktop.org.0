Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4276EA8584C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 11:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FC210EB49;
	Fri, 11 Apr 2025 09:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+vw8jca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BADD10EB49
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744364857; x=1775900857;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=L24nH7a2bxQTyPXpSzray6UF4aofFiBht76knYF5NoE=;
 b=H+vw8jca8eJUaHGRv/rqVpMFsTJeHAaMF66lSdNlF2XifUljlbpBxBqS
 odO0TNXu92AVzh7v49VLWfhjR46zIgU0OLBKZqPvODhSQBCfYspcA3cOH
 ra019pZJDXu0ChDVt1568OUBOwyHnupSwdnwks3mFg/Q4J+Y3wrq89ZKY
 lVMlmk/0V7vtGahYj5AAw2Dz0ZZJoEnEoHSDYHDUvYBsvy3YbIQ2yu7bT
 cbk86Y8mCgrAy1NQ87uJbESE+IQNehYWmxOO0KXD0Of95dehH8VEhkFWR
 SUJW0Dou94IX0Zu4Xs/ocyh7nTjbK7zyNytUKl9mFB0nvzzN9k7M/mhBg w==;
X-CSE-ConnectionGUID: kFncZ0aJRP6/u25iIEAczw==
X-CSE-MsgGUID: 6Nm8ce6LSbOcGcry8cpdSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="33524528"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="33524528"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 02:47:36 -0700
X-CSE-ConnectionGUID: uP6A3AHsRke2RGrSddr+8A==
X-CSE-MsgGUID: p6941vahTqyvoqD2MCWqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="133911052"
Received: from mariuszg-mobl2.ger.corp.intel.com (HELO [10.245.113.161])
 ([10.245.113.161])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 02:47:35 -0700
Message-ID: <af27871b-126c-406e-af90-f2ee895bba1c@linux.intel.com>
Date: Fri, 11 Apr 2025 11:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Flush pending jobs of device's workqueues
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com, lizhi.hou@amd.com
References: <20250401155755.4049156-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250401155755.4049156-1-maciej.falkowski@linux.intel.com>
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

Applied with updated commit message to drm-misc-fixes

On 4/1/2025 5:57 PM, Maciej Falkowski wrote:
> Use flush_work() instead of cancel_work_sync() for driver
> workqueues to guarantee that remaining pending work
> will be handled.
> 
> Fixes: bc3e5f48b7ee ("accel/ivpu: Use workqueue for IRQ handling")
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_drv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 4fa73189502e..5e3888ff1022 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -421,9 +421,9 @@ void ivpu_prepare_for_reset(struct ivpu_device *vdev)
>  {
>  	ivpu_hw_irq_disable(vdev);
>  	disable_irq(vdev->irq);
> -	cancel_work_sync(&vdev->irq_ipc_work);
> -	cancel_work_sync(&vdev->irq_dct_work);
> -	cancel_work_sync(&vdev->context_abort_work);
> +	flush_work(&vdev->irq_ipc_work);
> +	flush_work(&vdev->irq_dct_work);
> +	flush_work(&vdev->context_abort_work);
>  	ivpu_ipc_disable(vdev);
>  	ivpu_mmu_disable(vdev);
>  }

