Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B41898D9C1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 16:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79E010E752;
	Wed,  2 Oct 2024 14:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfuSmOwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024A310E752;
 Wed,  2 Oct 2024 14:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727878478; x=1759414478;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b8WXPRl/CwxlN6LZ24RGu4sVpu8fZwzAX+ZR5CNk+m0=;
 b=jfuSmOwo3BuD0JkrBH08new+wPB0OhajgU3BtnCGdftDaXqatHwHAan1
 fO4+8ZbcWrIpTNwMUbj625WLXGhtyO48Ceslsx5yXgFcxIMSGLQzhf8Xy
 2QgVe6vYgqXQiCBIJWO1tKMkfwbCfSDwWMrW9tHclTRmeQlUqzianotU6
 EteudFXACnsQrNM8n8ho7ry1eWY946UbcRfdSYqXWgHyLv6I8UkdDNHdD
 26wEiYi6fdfPh9D2Aggx5MvIfkRY860DQzaltEtlr3NV6zCRqNY5Q97cy
 6Ew/Y+82R5tmODQqyVjwgiw1Z0u2JS1oe5MsMruc/PmtQtwoCqKWcbhV+ A==;
X-CSE-ConnectionGUID: rpl/X37GTWSmmD5b7MN3ug==
X-CSE-MsgGUID: 3tXYslArSbqmQN/TUepzgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27174511"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27174511"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 07:14:37 -0700
X-CSE-ConnectionGUID: 6r1sqIRVRPewhkhXWFcErg==
X-CSE-MsgGUID: kAiyTGJkS+ySJN4oMmXjCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74825441"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.230])
 ([10.245.192.230])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 07:14:36 -0700
Message-ID: <fc505ca3-23bb-4f7f-b8bc-796dc1b1fb9f@linux.intel.com>
Date: Wed, 2 Oct 2024 16:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/sched: Use drm sched lockdep map for submit_wq
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org, pstanner@redhat.com, ltuikov89@gmail.com
References: <20241002131639.3425022-1-matthew.brost@intel.com>
 <20241002131639.3425022-2-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241002131639.3425022-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 10/2/2024 3:16 PM, Matthew Brost wrote:
> Avoid leaking a lockdep map on each drm sched creation and destruction
> by using a single lockdep map for all drm sched allocated submit_wq.
>
> v2:
>  - Use alloc_ordered_workqueue_lockdep_map (Tejun)
>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 36db5c7736fc..e32b0f7d7e94 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -87,6 +87,12 @@
>  #define CREATE_TRACE_POINTS
>  #include "gpu_scheduler_trace.h"
>  
> +#ifdef CONFIG_LOCKDEP
> +static struct lockdep_map drm_sched_lockdep_map = {
> +	.name = "drm_sched_lockdep_map"
> +};
> +#endif
> +
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> @@ -1270,7 +1276,12 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		sched->submit_wq = submit_wq;
>  		sched->own_submit_wq = false;
>  	} else {
> +#ifdef CONFIG_LOCKDEP
> +		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
> +								       &drm_sched_lockdep_map);
> +#else
>  		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> +#endif
>  		if (!sched->submit_wq)
>  			return -ENOMEM;
>  
