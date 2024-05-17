Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB88A8C87A7
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 16:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B79110EED9;
	Fri, 17 May 2024 14:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPAYDAQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5AE10E307;
 Fri, 17 May 2024 14:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715954412; x=1747490412;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A8jgIJtb4tQL965Td8qYgJavQdRas8UEkvgkOgxQs0I=;
 b=fPAYDAQnhGkrGvBo0xGq7XNXqkqrvGZXwmLcVnWqhAjY8n2Ap6G45NTF
 USzbBtmtN5aaW/JAxfJtyjvxWw58EvAxUZke3bAEr4jqk+hRt+HurS7LQ
 99j9KbqXwpIOcwH7bAa9JKpuIjLp3+ib+abfuKePRJu4MZdR+wVjCmKv5
 9orKK8dhQKodVOsfX6Od0J66Mk8QoSAJYANifoIloYXKFvUm3lK1ou5Mr
 1MYRWuOQzmef6pf7ti7P17eeSWk5+NoBlKJu4LUICIILzVAj9i7/bPxyS
 HjhWH7ynDLD+Hnn1zLv4vJmdJ33pPt9Eq7O33Cz8kzv+NHoVctnqSCzkW g==;
X-CSE-ConnectionGUID: lia2oUtNQKafOiEXTwQmTQ==
X-CSE-MsgGUID: HLqopI/nS4qv9SCK9Mp5xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12074516"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12074516"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 07:00:12 -0700
X-CSE-ConnectionGUID: XCwrNQNqScebi7KQzPXJ4w==
X-CSE-MsgGUID: GcJHKOsFQ7a5irN65iNZ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36602415"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.245])
 ([10.246.50.245])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 07:00:10 -0700
Message-ID: <e2a23879-c69e-4b57-a0a0-4c1ac81d9403@linux.intel.com>
Date: Fri, 17 May 2024 16:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915: Don't treat FLR resets as errors
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240517112550.251955-1-andi.shyti@linux.intel.com>
 <20240517112550.251955-3-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240517112550.251955-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Andi,

On 5/17/2024 1:25 PM, Andi Shyti wrote:
> If we timeout while waiting for an FLR reset, there is nothing we
> can do and i915 doesn't have any control on it. In any case the
> system is still perfectly usable

If a FLR reset fails then we will have a dead GPU, I don't think the GPU 
is usable without a cold reboot.

This is a serious issue and should be report as an error.  I think we 
need to create a HW ticket to understand

why is FLR reset fails.


Regards,

Nirmoy



>   and the function returns void.
>
> We don't need to be alarmed, therefore, print the timeout
> expiration as a debug message instead of an error.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10955
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/intel_uncore.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 2eba289d88ad..a3fa2ed91aae 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2637,7 +2637,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>   	 */
>   	ret = intel_wait_for_register_fw(uncore, GU_CNTL, DRIVERFLR, 0, flr_timeout_ms);
>   	if (ret) {
> -		drm_err(&i915->drm,
> +		drm_dbg(&i915->drm,
>   			"Failed to wait for Driver-FLR bit to clear! %d\n",
>   			ret);
>   		return;
> @@ -2652,7 +2652,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>   					 DRIVERFLR, 0,
>   					 flr_timeout_ms);
>   	if (ret) {
> -		drm_err(&i915->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
> +		drm_dbg(&i915->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
>   		return;
>   	}
>   
> @@ -2661,7 +2661,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>   					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
>   					 flr_timeout_ms);
>   	if (ret) {
> -		drm_err(&i915->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
> +		drm_dbg(&i915->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
>   		return;
>   	}
>   
