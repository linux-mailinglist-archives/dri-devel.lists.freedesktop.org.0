Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BED49F317C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 14:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF83E10E675;
	Mon, 16 Dec 2024 13:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlvzALOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20F210E3F7;
 Mon, 16 Dec 2024 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734355627; x=1765891627;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NHkVxeVwoHYntBeXZsUurxKxKJ/skboPhqoNSkxYx7Q=;
 b=nlvzALOMUnX+snqitwD+lkD/Pyb8mSSe2HsS/wO46RvFrfRGt1mg4RXn
 hfuCBGW8UllrysMYau4aJDlABsmW2C+fTYYUb98WRgMr8OoCLTdO2Fi7U
 dW2lHinH0xBlhpvQK0C6FzIHEfsVM2pInXCoVaA4wz18zEmQ4Fz1y2g3k
 9X6JLGji1cEM4Fw1II6pdK+Q+pS0bzhIusYkVIiCxb8VUDv3fNB3e477H
 EGw/cldUqkoS7IUfydtwT2bigaK+F2lUvYvGLjZtgTO8bXUMelHCQO5B2
 xiRUyKnojsn+WhwA7Y+Cu18LZuXCp42m0+D9wBxFVA7FKq9VRyc4Iv0LV g==;
X-CSE-ConnectionGUID: 5EH17+X9Td+WExDv8K38cw==
X-CSE-MsgGUID: GXzCdeVrQ9GzTAeUrnqcpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34471891"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34471891"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 05:27:06 -0800
X-CSE-ConnectionGUID: 6PkEdychQFGSDDojrnypzA==
X-CSE-MsgGUID: /KJiMXnEShSz3w37V17eqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="96963056"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.2])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 05:27:03 -0800
Date: Mon, 16 Dec 2024 14:26:58 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Use preemption timeout on cleanup
Message-ID: <Z2AqomipvnhZ0r1y@ashyti-mobl2.lan>
References: <20241213190122.513709-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213190122.513709-2-janusz.krzysztofik@linux.intel.com>
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

Hi Janusz,

...

>  	for_each_gt(gt, i915, i) {
> +		struct intel_engine_cs *engine;
> +		unsigned long timeout_ms = 0;
> +		unsigned int id;
> +
>  		if (intel_gt_is_wedged(gt))
>  			ret = -EIO;
>  
> +		for_each_engine(engine, gt, id) {
> +			if (engine->props.preempt_timeout_ms > timeout_ms)
> +				timeout_ms = engine->props.preempt_timeout_ms;
> +		}


the brackets are not really required here.

> +
>  		cond_resched();
>  
> -		if (intel_gt_wait_for_idle(gt, HZ * 3) == -ETIME) {
> +		if (intel_gt_wait_for_idle(gt, HZ * timeout_ms / 500) == -ETIME) {

where is this 500 coming from?

Thanks,
Andi

>  			pr_err("%pS timed out, cancelling all further testing.\n",
>  			       __builtin_return_address(0));
>  
> -- 
> 2.47.1
