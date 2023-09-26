Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2105E7AE8C4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 11:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7386210E388;
	Tue, 26 Sep 2023 09:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA1810E384;
 Tue, 26 Sep 2023 09:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695719898; x=1727255898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KneAb0S+m+iYRbwqBA9rAbD7+wrrqEvmyHgL9DakO84=;
 b=nJLvwj8WOnXzzXNET/AerD5JutaMJLaPHQnl4PeX6e6XqPRv2W06bKV6
 GzIadzDnwd7KkJQ+dtwbbNBMMSj48OyEhsPIHsrV3S854d9gDe/49NeZi
 6PaiGMVwUFGOyHgVnfx3DF6upAghR9K+sXFCN+nXaTkwVPhVfUsqUyyuZ
 AzEzrkKQNM0QNA0tZX+guEFP6sVplDPt5RmSj8I2lwy/IJ9BHHbP3teZZ
 5MSsnAtdPd+i6IO7kmUrCv9lCx49g7bJI25Ze+Wn1gOT3APJ2w5XwDFBT
 7MTRyK22ApTemLHP8OBQvxzEI0RQTD0lAeZLhrnfD9mNym66E821RmEmU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360903521"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="360903521"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 02:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="778072187"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="778072187"
Received: from jliew-mobl.gar.corp.intel.com (HELO intel.com) ([10.213.158.52])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 02:18:11 -0700
Date: Tue, 26 Sep 2023 11:18:03 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Do not disable preemption for resets
Message-ID: <ZRKhy6QcQ28Z2cPT@ashyti-mobl2.lan>
References: <20230705093025.3689748-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705093025.3689748-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
 Intel-gfx@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> Commit ade8a0f59844 ("drm/i915: Make all GPU resets atomic") added a
> preempt disable section over the hardware reset callback to prepare the
> driver for being able to reset from atomic contexts.
> 
> In retrospect I can see that the work item at a time was about removing
> the struct mutex from the reset path. Code base also briefly entertained
> the idea of doing the reset under stop_machine in order to serialize
> userspace mmap and temporary glitch in the fence registers (see
> eb8d0f5af4ec ("drm/i915: Remove GPU reset dependence on struct_mutex"),
> but that never materialized and was soon removed in 2caffbf11762
> ("drm/i915: Revoke mmaps and prevent access to fence registers across
> reset") and replaced with a SRCU based solution.
> 
> As such, as far as I can see, today we still have a requirement that
> resets must not sleep (invoked from submission tasklets), but no need to
> support invoking them from a truly atomic context.
> 
> Given that the preemption section is problematic on RT kernels, since the
> uncore lock becomes a sleeping lock and so is invalid in such section,
> lets try and remove it. Potential downside is that our short waits on GPU
> to complete the reset may get extended if CPU scheduling interferes, but
> in practice that probably isn't a deal breaker.
> 
> In terms of mechanics, since the preemption disabled block is being
> removed we just need to replace a few of the wait_for_atomic macros into
> busy looping versions which will work (and not complain) when called from
> non-atomic sections.

looks reasonable, few unrelated questions

> ---
>  drivers/gpu/drm/i915/gt/intel_reset.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index e2152f75ba2e..6916eba3bd33 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -167,13 +167,13 @@ static int i915_do_reset(struct intel_gt *gt,
>  	/* Assert reset for at least 20 usec, and wait for acknowledgement. */

is this /20/50/ ?

>  	pci_write_config_byte(pdev, I915_GDRST, GRDOM_RESET_ENABLE);
>  	udelay(50);
> -	err = wait_for_atomic(i915_in_reset(pdev), 50);
> +	err = _wait_for_atomic(i915_in_reset(pdev), 50, 0);

wait_for_atomic() waits in milliseconds, while _wait_for_atomic()
waits in microseconds, I think you need to update the timer.

Do you think we might need a wait_for_atomic_preempt() macro?

	err = wait_for_atomic_preempt(i915_in_reset(pdev), 50);

Thanks,
Andi
