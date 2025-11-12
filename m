Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F187C5103A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6639310E6C1;
	Wed, 12 Nov 2025 07:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mvqv+hzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F002910E6C1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762933944; x=1794469944;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z7ECwSyrzCS6qCfNF2E93+hEtjn+f65AzQGy3NJtj94=;
 b=Mvqv+hzjTHxQWTEXGwHjEg0LVI6BCrMviIJ3DToSv67zSeIwRQEei3VI
 AlIkUOKqjfxlmonJgt1whDLjzlOLMPvRPI2duDzfisr2I5mtmAgRYsQTH
 PDAm1CY6bVqVAv7B3aygVhQrIqAAChUp7lWeZ7dm3PxDoDFaEbWgFLs6j
 G9I8NbUAAhTsyWM71kNK4vabDe+WQL+HC5PNY1zq01vjd+GD0GfhueSjJ
 k1peFQlx1DmC1RKaCKVu87aGTamHy99V8N+WgMAPs5qSQFdFYUxeYvaBF
 +UNNQzVAXulfNDWyV/6x8wzkGxEJro18xn/ReNkKB68szaggQY6QMl/Pu g==;
X-CSE-ConnectionGUID: ASePG3oJRy+gxL7uP7ToHA==
X-CSE-MsgGUID: hvAWM3EmSI64F7mwTib/2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64698370"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="64698370"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 23:52:24 -0800
X-CSE-ConnectionGUID: BLUrT2apQLiQyzJp6qAqzA==
X-CSE-MsgGUID: GKZKrKtFRSSMZzmkmIAbfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="193266764"
Received: from unknown (HELO [10.217.180.97]) ([10.217.180.97])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 23:52:25 -0800
Message-ID: <df771345-655c-4edc-8780-126a1bb9d5b4@linux.intel.com>
Date: Wed, 12 Nov 2025 08:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix warning due to undefined CONFIG_PROC_FS
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251112071911.1136934-1-karol.wachowski@linux.intel.com>
Content-Language: pl
From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
In-Reply-To: <20251112071911.1136934-1-karol.wachowski@linux.intel.com>
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

On 11/12/2025 8:19 AM, Karol Wachowski wrote:
> Change #if to #ifdef CONFIG_PROC_FS to fix warning reported by test robot:
> drivers/accel/ivpu/ivpu_drv.c:458:5: warning: "CONFIG_PROC_FS" is not defined, evaluates to 0 [-Wundef]
> 
> Fixes: 63cc028484ab ("accel/ivpu: Add fdinfo support for memory statistics")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index ce7dbd473059..3d6fccdefdd6 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -455,7 +455,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
>   static const struct file_operations ivpu_fops = {
>   	.owner		= THIS_MODULE,
>   	DRM_ACCEL_FOPS,
> -#if CONFIG_PROC_FS
> +#ifdef CONFIG_PROC_FS
>   	.show_fdinfo = drm_show_fdinfo,
>   #endif
>   };
> @@ -472,7 +472,7 @@ static const struct drm_driver driver = {
>   	.ioctls = ivpu_drm_ioctls,
>   	.num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
>   	.fops = &ivpu_fops,
> -#if CONFIG_PROC_FS
> +#ifdef CONFIG_PROC_FS
>   	.show_fdinfo = drm_show_memory_stats,
>   #endif
>   
Reviewed-by: Andrzej.Kacprowski@linux.intel.com
