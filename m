Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FCBC51191
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 09:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BDE10E6CF;
	Wed, 12 Nov 2025 08:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AhAzbxYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B268A10E6D7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 08:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762935975; x=1794471975;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DasY8f0vWEhT/9cLTNbLYwu6ARegUMIiUjO2+v+TZGw=;
 b=AhAzbxYb8BfrN6s+ELiX7LbTQ+/g+LDIlmg5BRrWHl8fcylCzWFp7hrD
 mtkgScU4S9byzIPWP4HwnxukdLkXunjR2dS1bX0qhw6e5SazVUdI5ZggL
 7Jj4eQDYeAkqGe5E9Zer4YJ4LQfyAN7oStEROJ+w9mDpGjkp2zotNf8XG
 oy5IkWf42HWaVGIlZLes9kXeHwpEkhWKclKWBb257cszpfn8L5txZ34B/
 xtvExew2z/BkHQagqqYLRLnU1AC8riUAlCmbmnCTiHBsdpv29JkQYbV0c
 F+P7piR9ykKYvoQjYM0zO36eUMohkcal9lOKohBswaTQS5JPXWLupeQHe w==;
X-CSE-ConnectionGUID: YWcNI6p5QRyQbcdYdwXtTw==
X-CSE-MsgGUID: s6XzkGXgT0WQHq7ZL7VeRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64875307"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="64875307"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:26:15 -0800
X-CSE-ConnectionGUID: GpZaxFznRS+IZLOFnxhzAw==
X-CSE-MsgGUID: 1ZSZg6QcQoWpzmpoUD4bbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="193403552"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.18.39])
 ([10.246.18.39])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:26:12 -0800
Message-ID: <694bc833-48c2-4da0-b635-92288f747d95@linux.intel.com>
Date: Wed, 12 Nov 2025 09:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix warning due to undefined CONFIG_PROC_FS
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com
References: <20251112071911.1136934-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
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

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

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
