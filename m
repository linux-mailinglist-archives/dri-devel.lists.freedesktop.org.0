Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F4FCB8EA1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 14:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C593F10E2A4;
	Fri, 12 Dec 2025 13:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9x3Z2U9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E449010E2A4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 13:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765547176; x=1797083176;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5AjYJ+usLGldY0sqsj+QPEYvL8hFOcyY02OqJHrK/XQ=;
 b=I9x3Z2U9zEC8b60hgJ8A5mXBoLi7A2r/ssGYhs8mgddBLGjfUSoVe7v2
 GKCtoPQWjobG+Ii6SRafNg3Q/rm0VbYXTrLYnOtGACXrVedV2ij4MZKp3
 G8YhO6wlAcxUyOi41p85MGgakzNirjN+C/dGqU//AROuWEWp8UnL4ozi2
 LB/+/jwUM1BQomhlQH10zUcrRh+0oLtABKHHg9t7jD/RK0UBycEukNJ1n
 doIVYvDj7Bud6IlzFi+VMvHevRyRl/hZRW7O8Qiqhgsh8yLpn8oKtgq9x
 xP+fjauQ2OSuLRWhR26JuSVgCdrtPm2XYFp8DULIcOttJTvYeYt4p602/ A==;
X-CSE-ConnectionGUID: U06Wi1mpTvut/kPlLPCa1g==
X-CSE-MsgGUID: 8DNiMdiySbms9ILHY2WOSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67425411"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67425411"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:46:16 -0800
X-CSE-ConnectionGUID: jf15fWK2RxefXMkCuR2kYw==
X-CSE-MsgGUID: SqFyhRDCQTuLY/wGZ1dcpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="228148011"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.246])
 ([10.246.17.246])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:46:12 -0800
Message-ID: <d1f1bba5-3961-4420-8e99-8948089f374a@linux.intel.com>
Date: Fri, 12 Dec 2025 14:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
To: Karol Wachowski <karol.wachowski@linux.intel.com>, David.Francis@amd.com, 
 christian.koenig@amd.com
Cc: felix.kuehling@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 sumit.semwal@linaro.org, andrzej.kacprowski@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20251212134133.475218-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251212134133.475218-1-karol.wachowski@linux.intel.com>
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

On 12/12/2025 2:41 PM, Karol Wachowski wrote:

> Add missing drm_gem_object_put() call when drm_gem_object_lookup()
> successfully returns an object. This fixes a GEM object reference
> leak that can prevent driver modules from unloading when using
> prime buffers.
>
> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
> Cc: <stable@vger.kernel.org> # v6.18+
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
> Changes between v3 and v2:
>   - correctly add CC: tag this time
>
> Changes between v1 and v2:
>   - move setting ret value under if branch as suggested in review
>   - add Cc: stable 6.18+
> ---
>   drivers/gpu/drm/drm_gem.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ca1956608261..bcc08a6aebf8 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1010,8 +1010,10 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>   	if (!obj)
>   		return -ENOENT;
>   
> -	if (args->handle == args->new_handle)
> -		return 0;
> +	if (args->handle == args->new_handle) {
> +		ret = 0;
> +		goto out;
> +	}
>   
>   	mutex_lock(&file_priv->prime.lock);
>   
> @@ -1043,6 +1045,8 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>   
>   out_unlock:
>   	mutex_unlock(&file_priv->prime.lock);
> +out:
> +	drm_gem_object_put(obj);
>   
>   	return ret;
>   }
Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
