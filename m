Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC49B49069
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 15:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A3D10E52F;
	Mon,  8 Sep 2025 13:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7DrKFw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B825D10E52E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757339681; x=1788875681;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=iN2/lQ++ZDF+izGUll/I6adfFDW2jaPw93X0MLkqja8=;
 b=M7DrKFw73fi3e4Q+fmsjEKYrPsZe3dqLpCeVaR3yhfdwCb28dcIP23nD
 bhBiv+NayXh6Q2JEEpn7EioiVdofuR/qJjINmj6CuqFKxdiR7YS1xNIYM
 hQLxv1ExYHkTtz519KyTg4iELWw0XMKe47UlXxyAuL3voNnvikmjuGi8n
 xIYzoFiDrTdZq2zYqbn/5n5bHfZNxRHwq1g139PAHpYiTbKONO57CP0Bu
 LQuK3rMmKuc1viLGjXcnHiM2OuYL0Yz50O7whgedQYNwg6Qxh6dJvr86Q
 4wKLLca3YIgGaRcC0LgqfO2YDUTwBlon+fdxGxQA5vsGtxiR2beHzwh/f Q==;
X-CSE-ConnectionGUID: Qojdc7jwQD63Lr25AcsFSA==
X-CSE-MsgGUID: HDBLq2W+QqKM52ytyM7HCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58636167"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="58636167"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 06:54:41 -0700
X-CSE-ConnectionGUID: RhE2Gfh7QSOyr/2x3p+/xA==
X-CSE-MsgGUID: IG9biy9DRrG4F1E2IYMzFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="173254002"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 06:54:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zilin Guan <zilin@seu.edu.cn>, maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, Zilin Guan
 <zilin@seu.edu.cn>
Subject: Re: [PATCH] drm: Use kvmemdup/kvfree for EDID data
In-Reply-To: <20250905151156.844758-1-zilin@seu.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250905151156.844758-1-zilin@seu.edu.cn>
Date: Mon, 08 Sep 2025 16:54:35 +0300
Message-ID: <2040b1e245eb0166079ff985c52775e9ade9eab5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 05 Sep 2025, Zilin Guan <zilin@seu.edu.cn> wrote:
> The drm_edid_alloc() function uses kmemdup() to copy raw EDID data,
> which can be loaded from firmware. A problem exists because the firmware
> subsystem uses vfree() to release its data buffer. This implies the
> buffer may be allocated with vmalloc() and can thus be larger than
> kmalloc() typically supports. Since kmemdup() uses kmalloc() internally,
> attempting to duplicate a large, vmalloc'd EDID buffer can lead to an
> allocation failure.

Real world EDIDs are usually under 1 kB and if the user provides a much
bigger EDID via the firmware loader it's okay to fail at the allocation
time.

BR,
Jani.

>
> To fix this mismatch and robustly handle EDID data of any size, this
> patch replaces kmemdup() with kvmemdup(). The kvmemdup() function is
> designed for this scenario, as it can safely handle a vmalloc'd source
> and choose an appropriate allocator for the destination. The corresponding
> free calls are therefore updated to kvfree().
>
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> ---
>  drivers/gpu/drm/drm_edid.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index e2e85345aa9a..97142bfc45ad 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2530,13 +2530,13 @@ const struct drm_edid *drm_edid_alloc(const void *edid, size_t size)
>  	if (!edid || !size || size < EDID_LENGTH)
>  		return NULL;
>  
> -	edid = kmemdup(edid, size, GFP_KERNEL);
> +	edid = kvmemdup(edid, size, GFP_KERNEL);
>  	if (!edid)
>  		return NULL;
>  
>  	drm_edid = _drm_edid_alloc(edid, size);
>  	if (!drm_edid)
> -		kfree(edid);
> +		kvfree(edid);
>  
>  	return drm_edid;
>  }
> @@ -2568,7 +2568,7 @@ void drm_edid_free(const struct drm_edid *drm_edid)
>  	if (!drm_edid)
>  		return;
>  
> -	kfree(drm_edid->edid);
> +	kvfree(drm_edid->edid);
>  	kfree(drm_edid);
>  }
>  EXPORT_SYMBOL(drm_edid_free);

-- 
Jani Nikula, Intel
