Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5037D9ADE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 16:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85A410E9B0;
	Fri, 27 Oct 2023 14:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D37910E9B0;
 Fri, 27 Oct 2023 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698415898; x=1729951898;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=F1oYnUoZzwVSCUOBDhckDQC+q1Fm0eZRJN/xfvsc2I8=;
 b=GDIBeb1ZovcXmAj8shZEtPK/5Q7jdvvaJYFPrhbM7rQjS29Qc+R+G9q6
 trg0z69HCooIGlwWbWm/tkFBvictVCL3SLOl9HTIp7FvtolFeGn91rVQR
 zUn25R2kkH1q2yTGBMXHtHXVQRAHqOYr97kEczWLHDGZLIheyDCN+w+8w
 kOqv6EYSbAkQJDB421KDKwes9eMEQT1Ky6cfyUPREOG8ozXH/mUWy+5/h
 2AxB68UXUcLBxuFBQL4Bj8RI5Uzm57ESH/pRrx6ObSFkdLmuNZU4JJjo3
 9tomjRRXig/y0N51oL0u2Dj/jxbB09nlJDDfcGFhekOh5TspUB5htWeLO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="391652796"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="391652796"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 07:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="753135193"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="753135193"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.18.37])
 ([10.213.18.37])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 07:11:33 -0700
Message-ID: <1e844f00-fc16-4788-8d90-ebe115eb9313@intel.com>
Date: Fri, 27 Oct 2023 16:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i915/perf: Fix NULL deref bugs with drm_dbg() calls
Content-Language: en-US
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231027140729.2505993-1-harshit.m.mogalapalli@oracle.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231027140729.2505993-1-harshit.m.mogalapalli@oracle.com>
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
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
 dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27.10.2023 16:07, Harshit Mogalapalli wrote:
> When i915 perf interface is not available dereferencing it will lead to
> NULL dereferences.
>
> Fix this by using DRM_DEBUG() which the scenario before the commit in
> the Fixes tag.
>
> Fixes: 2fec539112e8 ("i915/perf: Replace DRM_DEBUG with driver specific drm_dbg call")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
> This is found using smatch(static analysis tool), only compile tested.
> ---
>   drivers/gpu/drm/i915/i915_perf.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 2f3ecd7d4804..bb48c96b7950 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4228,8 +4228,7 @@ int i915_perf_open_ioctl(struct drm_device *dev, void *data,
>   	int ret;
>   
>   	if (!perf->i915) {
> -		drm_dbg(&perf->i915->drm,
> -			"i915 perf interface not available for this system\n");
> +		DRM_DEBUG("i915 perf interface not available for this system\n");
>   		return -ENOTSUPP;
>   	}
>   
> @@ -4608,8 +4607,7 @@ int i915_perf_add_config_ioctl(struct drm_device *dev, void *data,
>   	int err, id;
>   
>   	if (!perf->i915) {
> -		drm_dbg(&perf->i915->drm,
> -			"i915 perf interface not available for this system\n");
> +		DRM_DEBUG("i915 perf interface not available for this system\n");
>   		return -ENOTSUPP;
>   	}
>   
> @@ -4774,8 +4772,7 @@ int i915_perf_remove_config_ioctl(struct drm_device *dev, void *data,
>   	int ret;
>   
>   	if (!perf->i915) {
> -		drm_dbg(&perf->i915->drm,
> -			"i915 perf interface not available for this system\n");
> +		DRM_DEBUG("i915 perf interface not available for this system\n");
>   		return -ENOTSUPP;
>   	}
>   

