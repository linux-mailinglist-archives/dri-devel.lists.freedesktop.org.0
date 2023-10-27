Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88CD7D9EF4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 19:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6D810EA20;
	Fri, 27 Oct 2023 17:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F76010EA20;
 Fri, 27 Oct 2023 17:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698428308; x=1729964308;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5JgsC4GZg9gDVZXuMx2csQQc1LKj5KoYBp4nu6PMc0Y=;
 b=N3PIu6ikfoDH1XfR/BADhPVUjFGLFoIIrbrPglsUw837oRQBmaQJ5E+I
 Ba1hyJxgsUrJoV6RvvErZN/7wX+75JKwFPy9MWm3M+LpFAL+jHbX6GzUO
 DhxHkRHQ1gVZnryyul2g/miOOvn4q7zoN59y7+KqmWmiA2yxmljkonBBU
 kRj4V+8JmlKMvjtwzshB6Cfu/NGkbJ/kDc5x4v3bQHofzDJaAcbUqgG8N
 +EY5kvDQIINAgl75U0cUyf3uma10p+uHR4iIijETCY4AagNP5fQFUZreJ
 HpsLQ/7T0+KR9DOjR3Uy8lObXw+H8PvWGX97cjFst+NNXuMJz6xkUCNop A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="378188584"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="378188584"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 10:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="788862211"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="788862211"
Received: from dhanlon-mobl1.ger.corp.intel.com (HELO [10.213.221.114])
 ([10.213.221.114])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 10:38:23 -0700
Message-ID: <29c2bf2b-82b1-457d-ba42-29b0b30ecf32@linux.intel.com>
Date: Fri, 27 Oct 2023 18:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i915/perf: Fix NULL deref bugs with drm_dbg() calls
Content-Language: en-US
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20231027172822.2753059-1-harshit.m.mogalapalli@oracle.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20231027172822.2753059-1-harshit.m.mogalapalli@oracle.com>
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
 dan.carpenter@linaro.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/10/2023 18:28, Harshit Mogalapalli wrote:
> When i915 perf interface is not available dereferencing it will lead to
> NULL dereferences.
> 
> As returning -ENOTSUPP is pretty clear return when perf interface is not
> available.
> 
> Fixes: 2fec539112e8 ("i915/perf: Replace DRM_DEBUG with driver specific drm_dbg call")
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> v1 --> v2: Remove the debug calls as they don't add much value and
> -ENOTSUPP is a good enough return value.
> ---
>   drivers/gpu/drm/i915/i915_perf.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 2f3ecd7d4804..7b1c8de2f9cb 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4227,11 +4227,8 @@ int i915_perf_open_ioctl(struct drm_device *dev, void *data,
>   	u32 known_open_flags;
>   	int ret;
>   
> -	if (!perf->i915) {
> -		drm_dbg(&perf->i915->drm,
> -			"i915 perf interface not available for this system\n");
> +	if (!perf->i915)
>   		return -ENOTSUPP;
> -	}
>   
>   	known_open_flags = I915_PERF_FLAG_FD_CLOEXEC |
>   			   I915_PERF_FLAG_FD_NONBLOCK |
> @@ -4607,11 +4604,8 @@ int i915_perf_add_config_ioctl(struct drm_device *dev, void *data,
>   	struct i915_oa_reg *regs;
>   	int err, id;
>   
> -	if (!perf->i915) {
> -		drm_dbg(&perf->i915->drm,
> -			"i915 perf interface not available for this system\n");
> +	if (!perf->i915)
>   		return -ENOTSUPP;
> -	}
>   
>   	if (!perf->metrics_kobj) {
>   		drm_dbg(&perf->i915->drm,
> @@ -4773,11 +4767,8 @@ int i915_perf_remove_config_ioctl(struct drm_device *dev, void *data,
>   	struct i915_oa_config *oa_config;
>   	int ret;
>   
> -	if (!perf->i915) {
> -		drm_dbg(&perf->i915->drm,
> -			"i915 perf interface not available for this system\n");
> +	if (!perf->i915)
>   		return -ENOTSUPP;
> -	}
>   
>   	if (i915_perf_stream_paranoid && !perfmon_capable()) {
>   		drm_dbg(&perf->i915->drm,

Thanks for re-spinning it so quickly! LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
