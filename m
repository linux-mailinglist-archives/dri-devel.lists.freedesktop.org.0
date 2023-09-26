Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4045E7AEA4F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 12:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CD810E39B;
	Tue, 26 Sep 2023 10:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664DB10E39C;
 Tue, 26 Sep 2023 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695723992; x=1727259992;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hDw8X3rIiVGWuY6ofeu4CtUvl3RzNIqd+pL2zWvlE18=;
 b=R75gO2W8RqcLdCQcmCivsvl3n8/GOyMY6QGl09fqd895EL3QlyjW1t3Z
 rQEaNmUT9QNpvI8FASRdGNyzHbxL6OqfoRwWDvMVpOCXsy5Q+IfUiQ2Ei
 3Br5Rh5u/t5GhbjaMuc7WsK5L6tckxIM8SZOp9KXN6JBk5jNaGWWviF52
 cUgCIphW8A8P4VrYRlHW5uVv1DyIWb/f9uJYNyLrEMN5FoqF9CqGzBYWl
 2aD69pBlt5udG917EeaxkAy8LqwDn8oWSG7WO+7SYWhRb4SDtuEL/cZM2
 AbEqAcu5O2dRpgsCFWeTkNrnxVQnhJ086Gw95T2VcswEVNoQNLtrk8MqU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385382968"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="385382968"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 03:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="742311952"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="742311952"
Received: from jliew-mobl.gar.corp.intel.com (HELO intel.com) ([10.213.158.52])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 03:26:25 -0700
Date: Tue, 26 Sep 2023 12:26:19 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915: Do not disable preemption for resets
Message-ID: <ZRKxy49j17qgg14y@ashyti-mobl2.lan>
References: <20230926100855.61722-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926100855.61722-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Tue, Sep 26, 2023 at 11:08:55AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
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
> 
> v2:
>  * Fix timeouts which are now in us. (Andi)
>  * Update one comment as a drive by. (Andi)
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
