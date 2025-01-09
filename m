Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBF5A06FF5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE6E10ED22;
	Thu,  9 Jan 2025 08:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OthSJwUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD6010ED22
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736411328; x=1767947328;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=h+/Cu7tTgavSnczvbn86nr5iKJSppfTKmd3failoo3g=;
 b=OthSJwUWuLcLC4Ed0olhjZTaA3D+XZUoqGn2MORWA9SDGLSdYPG5A4/Q
 krbYZbZTlmrBoNmoKOToDgaIOZWm8kvmNiWQIc2MAqkqaT+tmi6mhvZm2
 J0NWsQgQ76Wupbkk98tVaMOtrDMGHGtcBSYklLu0TUv4BxNR4nXLJ/FZf
 v6hMN1DV6M64m3KAjzg5daTGycflWTxFFQv+mtYSQfjC2hlWxtQ+FUgVY
 NsITio4brIA6arC54tREqakoV72v0BbgklflmGZDE1bXinkHUhxkr4rGa
 oA1aYbT/Fvi1Tc5x35hcOQhPnuSiRGGCI5Nby5nJDEdtCWEuZ4CKk88Kb A==;
X-CSE-ConnectionGUID: fFBZacn8RHOm8aQTj47jwg==
X-CSE-MsgGUID: 3dLi877XQ+SAV03xDMRrEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36680957"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36680957"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:28:48 -0800
X-CSE-ConnectionGUID: +RvwZw2uThuYcYRb3Ii/+g==
X-CSE-MsgGUID: jMNSCRspTU+qVP3p96QwrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107382689"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:28:45 -0800
Message-ID: <5e3355d4-d0f2-4b1a-adab-376a1390ed4d@linux.intel.com>
Date: Thu, 9 Jan 2025 09:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] accel/ivpu: Fix locking order in
 ivpu_cmdq_destroy_ioctl
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
 <20250107173238.381120-11-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250107173238.381120-11-maciej.falkowski@linux.intel.com>
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

On 1/7/2025 6:32 PM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Fix deadlock caused by inversed locking order in ivpu_job_submit()
> and ivpu_cmdq_destroy_ioctl(). Both functions operate locking
> file_priv->lock and submitted_jobs_lock.
> 
> Unlock file_priv->lock in ivpu_cmdq_destroy_ioctl() before calling
> ivpu_cmdq_abort_all_jobs() function which locks submitted_jobs_lock.
> That way locking order is maintained:
>  1) global submitted_jobs_lock first
>  2) per context file_priv->lock second
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_job.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 37ea92eb4b25..c694822a14bf 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -883,7 +883,7 @@ int ivpu_cmdq_destroy_ioctl(struct drm_device *dev, void *data, struct drm_file
>  	struct drm_ivpu_cmdq_destroy *args = data;
>  	struct ivpu_cmdq *cmdq;
>  	u32 cmdq_id;
> -	int ret = 0;
> +	int ret;
>  
>  	if (!ivpu_is_capable(vdev, DRM_IVPU_CAP_MANAGE_CMDQ))
>  		return -ENODEV;
> @@ -893,13 +893,16 @@ int ivpu_cmdq_destroy_ioctl(struct drm_device *dev, void *data, struct drm_file
>  	cmdq = xa_load(&file_priv->cmdq_xa, args->cmdq_id);
>  	if (!cmdq || cmdq->is_legacy) {
>  		ret = -ENOENT;
> -		goto unlock;
> +		goto err_unlock;
>  	}
>  
>  	cmdq_id = cmdq->id;
>  	ivpu_cmdq_destroy(file_priv, cmdq);
> +	mutex_unlock(&file_priv->lock);
>  	ivpu_cmdq_abort_all_jobs(vdev, file_priv->ctx.id, cmdq_id);
> -unlock:
> +	return 0;
> +
> +err_unlock:
>  	mutex_unlock(&file_priv->lock);
>  	return ret;
>  }

