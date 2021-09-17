Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D6C40F35D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 09:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2F06EC0C;
	Fri, 17 Sep 2021 07:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355F86EC0C;
 Fri, 17 Sep 2021 07:37:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="245135628"
X-IronPort-AV: E=Sophos;i="5.85,300,1624345200"; d="scan'208";a="245135628"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 00:37:24 -0700
X-IronPort-AV: E=Sophos;i="5.85,300,1624345200"; d="scan'208";a="554499884"
Received: from shettiar-mobl2.ger.corp.intel.com (HELO [10.213.243.199])
 ([10.213.243.199])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 00:37:22 -0700
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: use strscpy() to avoid buffer
 overrun
To: Tim Gardner <tim.gardner@canonical.com>, intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <dc88e195-949c-bb46-b7d3-18e90df9b064@canonical.com>
 <20210916122649.12691-1-tim.gardner@canonical.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <77c6c991-b7b4-0362-63ca-17a801187f7a@linux.intel.com>
Date: Fri, 17 Sep 2021 08:37:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916122649.12691-1-tim.gardner@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 16/09/2021 13:26, Tim Gardner wrote:
> In capture_vma() Coverity complains of a possible buffer overrun. Even
> though this is a static function where all call sites can be checked,
> limiting the copy length could save some future grief.
> 
> CID 93300 (#1 of 1): Copy into fixed size buffer (STRING_OVERFLOW)
> 4. fixed_size_dest: You might overrun the 16-character fixed-size string c->name
>     by copying name without checking the length.
> 5. parameter_as_source: Note: This defect has an elevated risk because the
>     source argument is a parameter of the current function.
> 1326        strcpy(c->name, name);
> 
> Fix any possible overflows by using strscpy() which guarantees NULL termination.
> 
> Also correct 2 other strcpy() call sites with the same potential for Coverity
> warnings or overruns.
> 
> v2 - Change $SUBJECT from "drm/i915: zero fill vma name buffer"
>       Use strscpy() instead of strncpy(). Its a much simpler change.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
> ---
>   drivers/gpu/drm/i915/i915_gpu_error.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 9cf6ac575de1..7f246f51959d 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1015,7 +1015,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>   		return NULL;
>   	}
>   
> -	strcpy(dst->name, name);
> +	strscpy(dst->name, name, sizeof(dst->name));
>   	dst->next = NULL;
>   
>   	dst->gtt_offset = vma->node.start;
> @@ -1279,7 +1279,7 @@ static bool record_context(struct i915_gem_context_coredump *e,
>   	rcu_read_lock();
>   	task = pid_task(ctx->pid, PIDTYPE_PID);
>   	if (task) {
> -		strcpy(e->comm, task->comm);
> +		strscpy(e->comm, task->comm, sizeof(e->comm));
>   		e->pid = task->pid;
>   	}
>   	rcu_read_unlock();
> @@ -1323,7 +1323,7 @@ capture_vma(struct intel_engine_capture_vma *next,
>   		return next;
>   	}
>   
> -	strcpy(c->name, name);
> +	strscpy(c->name, name, sizeof(c->name));
>   	c->vma = vma; /* reference held while active */
>   
>   	c->next = next;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
