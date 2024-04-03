Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A849897B0E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 23:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2A0112F4C;
	Wed,  3 Apr 2024 21:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QEC8hw5A";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6285C1128A8;
 Wed,  3 Apr 2024 21:50:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 15A2D61228;
 Wed,  3 Apr 2024 21:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95A6C433C7;
 Wed,  3 Apr 2024 21:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712181006;
 bh=SP4msZUFJx8klsXbWCjsYY2lIA9gXSOSDUCfZVuKKiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QEC8hw5AsBGcYyKOy12lg6WfvOBCK5NRFTUjVGeDpY01S8wJ6mXjwoGYengqBxouu
 SFmdUiqbrB4sH6bBfSmEuuFWoqHoP76t01P8mzytRVhMexaJqGPVlr7MnwJ+ILhf+r
 wyABbPmuKyD94BRvmfpJnWSG8GCSyoQ/kskFvkBWuQkmtNZSW0JTYAAkCBXpE6VGeM
 A/C/iJ9jygutUhpoJfJGYh8v1JDD6jQCGYYuVTbrjxpzZ2CrKSK/QOrnSEGUlur/1l
 S4PflX8on/BcOhXEN1JGq4A+adNuF4KQfS82qmSOjc+UDeoTelabBB6Yd3aBzah27r
 8eRA6Y7QOYMew==
Date: Wed, 3 Apr 2024 23:50:00 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: John.C.Harrison@intel.com
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org, 
 Zhanjun Dong <zhanjun.dong@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Fix the fix for reset lock confusion
Message-ID: <qj2pjlseayq3py63gowsh6g555dxxcdloqzdhdj62ys7xosdps@czwft67ldxdb>
References: <20240329235306.1559639-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329235306.1559639-1-John.C.Harrison@Intel.com>
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

Hi John,

On Fri, Mar 29, 2024 at 04:53:05PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The previous fix for the circlular lock splat about the busyness
> worker wasn't quite complete. Even though the reset-in-progress flag
> is cleared at the start of intel_uc_reset_finish, the entire function
> is still inside the reset mutex lock. Not sure why the patch appeared
> to fix the issue both locally and in CI. However, it is now back
> again.
> 
> There is a further complication the wedge code path within
> intel_gt_reset() jumps around so much it results in nested
> reset_prepare/_finish calls. That is, the call sequence is:
>   intel_gt_reset
>   | reset_prepare
>   | __intel_gt_set_wedged
>   | | reset_prepare
>   | | reset_finish
>   | reset_finish
> 
> The nested finish means that even if the clear of the in-progress flag
> was moved to the end of _finish, it would still be clear for the
> entire second call. Surprisingly, this does not seem to be causing any
> other problems at present.
> 
> As an aside, a wedge on fini does not call the finish functions at
> all. The reset_in_progress flag is left set (twice).
> 
> So instead of trying to cancel the worker anywhere at all in the reset
> path, just add a cancel to intel_guc_submission_fini instead. Note
> that it is not a problem if the worker is still active during a reset.
> Either it will run before the reset path starts locking things and
> will simply block the reset code for a tiny amount of time. Or it will
> run after the locks have been acquired and will early exit due to the
> try-lock.
> 
> Also, do not use the reset-in-progress flag to decide whether a
> synchronous cancel is safe (from a lockdep perspective) or not.
> Instead, use the actual reset mutex state (both the genuine one and
> the custom rolled BACKOFF one).
> 
> Fixes: 0e00a8814eec ("drm/i915/guc: Avoid circular locking issue on busyness flush")
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Looks good:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
