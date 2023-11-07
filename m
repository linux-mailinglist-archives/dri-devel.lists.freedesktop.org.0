Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAD07E368C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 09:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3B110E4CC;
	Tue,  7 Nov 2023 08:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBB410E4CB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 08:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699345106; x=1730881106;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Mz+Ys8rk8++gARgzlF3f7ui8yBdoD2m6kjQgKYjw3wo=;
 b=EXiUJST2WCJhtNi87mlJYClInCa0ByKb6ds29aGUMvWyqPg/sBscb1UB
 6u+9i+SMWupEgaNvHh36/4X9IE0MCqHMdsqwPaUJBl1JwTDh8GEuvBNz3
 nqEEXPeZdPVBVC/4Kdiki4/qtRfda5cEfXZ1iDzWg6ymzCO4UFrR2m5N4
 uWBB8D4yuvRspe6ATrXb40L7KYVDJm/pABLssvIrK5gGvGb66GG2NHjgK
 DHbOsl9CRf+6Gvhy+tFt0Ym/u/PXQd6zlIFS9ZkyIQxLF1WQX0OqbVHZ/
 CY6GBRgVDH/B0qhwbfQ6sCmIWgM5nZr24hRo1CDgguXDJwhlsSz4vyUjc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="420564125"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="420564125"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 00:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="936073155"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="936073155"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.78])
 ([10.217.160.78])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 00:18:24 -0800
Message-ID: <fffcf3a1-128b-41e4-a3e1-8aac3ae88b9a@linux.intel.com>
Date: Tue, 7 Nov 2023 09:18:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix compilation with CONFIG_PM=n
To: dri-devel@lists.freedesktop.org
References: <20231106130827.1600948-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231106130827.1600948-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-next

On 06.11.2023 14:08, Jacek Lawrynowicz wrote:
> Use pm_runtime_status_suspended() instead of dev->power.runtime_status
> field that is not available without PM.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_ipc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
> index a5fb2e5e824b7..88453762c9d53 100644
> --- a/drivers/accel/ivpu/ivpu_ipc.c
> +++ b/drivers/accel/ivpu/ivpu_ipc.c
> @@ -6,6 +6,7 @@
>  #include <linux/genalloc.h>
>  #include <linux/highmem.h>
>  #include <linux/kthread.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/wait.h>
>  
>  #include "ivpu_drv.h"
> @@ -315,8 +316,7 @@ int ivpu_ipc_send_receive_active(struct ivpu_device *vdev, struct vpu_jsm_msg *r
>  	struct vpu_jsm_msg hb_resp;
>  	int ret, hb_ret;
>  
> -	drm_WARN_ON(&vdev->drm,
> -		    vdev->drm.dev->power.runtime_status == RPM_SUSPENDED);
> +	drm_WARN_ON(&vdev->drm, pm_runtime_status_suspended(vdev->drm.dev));
>  
>  	ret = ivpu_ipc_send_receive_internal(vdev, req, expected_resp, resp, channel, timeout_ms);
>  	if (ret != -ETIMEDOUT)
