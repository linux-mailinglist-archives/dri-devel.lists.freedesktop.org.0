Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70345C0C75A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AA810E41A;
	Mon, 27 Oct 2025 08:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xq78jmZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C83910E40F;
 Mon, 27 Oct 2025 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761555287; x=1793091287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r1lJYngvb57RnBjq+A+Z/xP3yiz5xt87pZsZWlgFAjI=;
 b=Xq78jmZjqAbm3FnsLttllRCaajQqYATk6T7VRvJ390PJfNwiRrriiaqj
 EIMnKIlBPMUklBJUFhxplEq6NFme1FbOP4eLUgFRQJ5Uurd+tGorYxaxj
 A5RVTaMeq83157foYrK7XkxRFxl+/tmcMxwrKD9jsezcrtzK9Bd/sTcBi
 KOg4VpPFkOKn77ESKqE9a5Wrl1CuJB3WmkcRptKwwuCfbL5lC8g3kmwLH
 BUFsF7v0vF9XUBRVCl8gcC/3afc9Wu4BdQC8aWuSx/uFflusLG7pvxgZT
 ypFszmNiC2FWraX/VwKL+2trEFwXFU1qu7C5fZqnKPIEXS2r4nyY5br8U Q==;
X-CSE-ConnectionGUID: 9JrCs79hTc6DC0wGSEFmvA==
X-CSE-MsgGUID: Yr8uTXbQRO6IswBh55wHIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74304826"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="74304826"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 01:54:47 -0700
X-CSE-ConnectionGUID: tF5RBNYDTA+TItnAaom5YQ==
X-CSE-MsgGUID: en/pWqNUTwmCCXp5ABVSHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="189032326"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.39])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 01:54:44 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Defer signalling the request fence
Date: Mon, 27 Oct 2025 09:54:41 +0100
Message-ID: <5020576.GXAFRqVoOG@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251024170313.135544-2-krzysztof.niemiec@intel.com>
References: <20251024170313.135544-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi Krzysztof,

On Friday, 24 October 2025 19:03:14 CET Krzysztof Niemiec wrote:
> The i915_active selftests operate on an active attached to a mock
> request. This request is created during the test, and a fence is
> attached to it for the test to control when the request is processed.
> However, because signalling the fence happens inside the same thread as
> the test, and before a call to __i915_active_wait(), a race condition is
> created where if the request is processed before the aforementioned
> call, the active callback will not be called.

For me your commit description still doesn't clarify why this patch is needed.  
Please describe the selftest expectations and explain what's wrong, in 
general, or the context of that selftest, with signalling the fence before the 
call to __i915_active_wait() and the callback not being called.  If possible, 
provide an example excerpt from system logs.

Thanks,
Janusz

> 
> Defer signalling the request's fence, so that the request completes only
> after the test's call to __i915_active_wait().
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_active.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/
i915/selftests/i915_active.c
> index 0d89d70b9c36..a82a56c3eeb6 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_active.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_active.c
> @@ -74,15 +74,25 @@ static struct live_active *__live_alloc(struct 
drm_i915_private *i915)
>  	return active;
>  }
>  
> +static struct i915_sw_fence *submit;
> +static struct delayed_work __live_submit_work;
> +
> +static void __live_submit_work_handler(struct work_struct *work)
> +{
> +	i915_sw_fence_commit(submit);
> +	heap_fence_put(submit);
> +}
> +
>  static struct live_active *
>  __live_active_setup(struct drm_i915_private *i915)
>  {
>  	struct intel_engine_cs *engine;
> -	struct i915_sw_fence *submit;
>  	struct live_active *active;
>  	unsigned int count = 0;
>  	int err = 0;
>  
> +	INIT_DELAYED_WORK(&__live_submit_work, __live_submit_work_handler);
> +
>  	active = __live_alloc(i915);
>  	if (!active)
>  		return ERR_PTR(-ENOMEM);
> @@ -132,8 +142,7 @@ __live_active_setup(struct drm_i915_private *i915)
>  	}
>  
>  out:
> -	i915_sw_fence_commit(submit);
> -	heap_fence_put(submit);
> +	schedule_delayed_work(&__live_submit_work, msecs_to_jiffies(500));
>  	if (err) {
>  		__live_put(active);
>  		active = ERR_PTR(err);
> 




