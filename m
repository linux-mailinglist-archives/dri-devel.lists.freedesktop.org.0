Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93142691F3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 18:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5ACD6E4DE;
	Mon, 14 Sep 2020 16:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B40A6E4DE;
 Mon, 14 Sep 2020 16:45:19 +0000 (UTC)
IronPort-SDR: nVKKkbPNkSiRXna/tWofZFavsoYsLUdLldfFoJDT9GU7Crbp/aayxl732M4uddfNcvxCG7jnvY
 z56craFeoF7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="243942489"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="243942489"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 09:45:15 -0700
IronPort-SDR: Q1puHls1IccRwMKDmUtPGqXO9BU+sBJUwBdtnEPqyHMVSgXoGdyM5FGTZMGcMwNb8Q5FNOFXqE
 aYjUIcI43dVw==
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="306240559"
Received: from matancoh-mobl2.ger.corp.intel.com (HELO [10.255.198.45])
 ([10.255.198.45])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 09:45:13 -0700
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/gem: Serialise debugfs
 i915_gem_objects with ctx->mutex
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20200723172119.17649-1-chris@chris-wilson.co.uk>
 <20200723172119.17649-3-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <5e7f2c00-c72e-46ff-defe-404b5a847a02@linux.intel.com>
Date: Mon, 14 Sep 2020 17:45:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723172119.17649-3-chris@chris-wilson.co.uk>
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, "Nikunj A. Dadhania" <nikunj.dadhania@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/07/2020 18:21, Chris Wilson wrote:
> Since the debugfs may peek into the GEM contexts as the corresponding
> client/fd is being closed, we may try and follow a dangling pointer.
> However, the context closure itself is serialised with the ctx->mutex,
> so if we hold that mutex as we inspect the state coupled in the context,
> we know the pointers within the context are stable and will remain valid
> as we inspect their tables.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: CQ Tang <cq.tang@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: stable@vger.kernel.org
> ---
>   drivers/gpu/drm/i915/i915_debugfs.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 784219962193..ea469168cd44 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -326,6 +326,7 @@ static void print_context_stats(struct seq_file *m,
>   		}
>   		i915_gem_context_unlock_engines(ctx);
>   
> +		mutex_lock(&ctx->mutex);
>   		if (!IS_ERR_OR_NULL(ctx->file_priv)) {
>   			struct file_stats stats = {
>   				.vm = rcu_access_pointer(ctx->vm),
> @@ -346,6 +347,7 @@ static void print_context_stats(struct seq_file *m,
>   
>   			print_file_stats(m, name, stats);
>   		}
> +		mutex_unlock(&ctx->mutex);
>   
>   		spin_lock(&i915->gem.contexts.lock);
>   		list_safe_reset_next(ctx, cn, link);
> 

Hm this apparently never got it's r-b and so got re-discovered in the 
field. +Nikunj

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
