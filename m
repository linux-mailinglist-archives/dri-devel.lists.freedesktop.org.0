Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ADAC0E2F3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD9310E06C;
	Mon, 27 Oct 2025 13:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Av7EdndH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B500310E06C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761573293; x=1793109293;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hj5GdA8M90iaMIRtUEi+JTcmlnAi36XCqohD895Rv2I=;
 b=Av7EdndHEuxA14cQRUcJ0wDsqcUThDTg34ZD+pbelunWTg3oknswFfFL
 PyPNMsvHBWl1t86gsqfNFlle2PauNlsSjIwzOKyBt9mlCIvJwPpTYRBaG
 IEfk0H80vn+yJY5IYrYLOqOqO8TpjLBCXxF4+fg6T3PKbzzGQDsTEQxYu
 +aJnNkMNXufGn4xGpropgIpY9AWiWzBfSDLc6uDxBWK0LNze3Mzk4eBxc
 nLBeFambxyXMwoV5aEzE0EZvR9ZDO3Tq+ifKw5Y8k+yerwYhdPl183GMb
 0P7tOMrew+gJhf2N1N7jmgrdYu/ibaoAGA39EtJgSTSGH5gCMFTsSwuxh g==;
X-CSE-ConnectionGUID: ipu2elFeTnyI35Pu73Em3g==
X-CSE-MsgGUID: T0YaxhWBTLCUZDKwST8eTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67486131"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67486131"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:54:52 -0700
X-CSE-ConnectionGUID: a9My5zK5Q2uFvguq7roqvA==
X-CSE-MsgGUID: mzWKqT19Rg6bKubUbjcy8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185807837"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.245.81.7])
 ([10.245.81.7])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:54:51 -0700
Message-ID: <2dae873e-7b98-4d36-8c9e-4c263f561818@linux.intel.com>
Date: Mon, 27 Oct 2025 14:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] accel/ivpu: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
References: <20251027133956.393375-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251027133956.393375-1-sakari.ailus@linux.intel.com>
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

On 10/27/2025 2:39 PM, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_job.c | 1 -
>  drivers/accel/ivpu/ivpu_pm.c  | 2 --
>  2 files changed, 3 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index ba4535a75aa7..4eb7287cd083 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -1114,6 +1114,5 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>  	mutex_unlock(&vdev->submitted_jobs_lock);
>  
>  runtime_put:
> -	pm_runtime_mark_last_busy(vdev->drm.dev);
>  	pm_runtime_put_autosuspend(vdev->drm.dev);
>  }
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 63c95307faa1..fe6f93af6ab0 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -359,7 +359,6 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
>  
>  void ivpu_rpm_put(struct ivpu_device *vdev)
>  {
> -	pm_runtime_mark_last_busy(vdev->drm.dev);
>  	pm_runtime_put_autosuspend(vdev->drm.dev);
>  }
>  
> @@ -428,7 +427,6 @@ void ivpu_pm_enable(struct ivpu_device *vdev)
>  	struct device *dev = vdev->drm.dev;
>  
>  	pm_runtime_allow(dev);
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  }
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>  
