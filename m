Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1098BF8FC3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 23:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D8010E360;
	Tue, 21 Oct 2025 21:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eRd9u+dC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71F610E356;
 Tue, 21 Oct 2025 21:56:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4590143792;
 Tue, 21 Oct 2025 21:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0691BC4CEF1;
 Tue, 21 Oct 2025 21:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761083791;
 bh=tn/a6WHLadou31z535LBNqrmC7LbXls2FWTKbAvQB44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eRd9u+dCJ/osx7ugH9jA/vgDMJ4qfg7fLSAVYvCd02joXklysuKX78fnWaQV+vgk4
 t/r3vZXaPeXgKlMWM60T1InzHb8BD6S703rZmfcSUVHcVvNiDBf4MJj9oxgJqEMBTg
 33Hhhs7drXxn7juiKlXZqUofsXzMjboGC0W99Ie87RllxdUIf7j2mm9JUW4nJQA435
 riMSAIbQp5RYlnyuy6mgEAWJiH0/IN/8/6X6kxDY9QC2jS2dDvU+tAohh2vEbig0kQ
 E2WDbYVcpjXF/cI1QwlOZFF+p2LYuobBGhlkYLaZLkOuW3yiKevc/ItnxNvbbnqJ5y
 1Tj9wI0zMt3uQ==
Date: Tue, 21 Oct 2025 11:56:30 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 simona.vetter@ffwll.ch, christian.koenig@amd.com,
 pstanner@redhat.com, dakr@kernel.org
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
Message-ID: <aPgBjmIm6n9H-R_u@slm.duckdns.org>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021213952.746900-2-matthew.brost@intel.com>
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

Hello,

On Tue, Oct 21, 2025 at 02:39:50PM -0700, Matthew Brost wrote:
> Drivers often use workqueues that are in the reclaim path (e.g., DRM
> scheduler workqueues). It is useful to teach lockdep that memory cannot
> be allocated on these workqueues. Add an interface to taint workqueue
> lockdep with reclaim.

Given that it's about reclaim, "memory cannot be allocated" may be a bit
misleading. Can you make the description more accurate? Also, it'd be great
if you can include an example lockdep splat for reference.

> Cc: Tejun Heo <tj@kernel.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/linux/workqueue.h | 19 +++++++++++++++++++
>  kernel/workqueue.c        |  9 +++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index dabc351cc127..954c7eb7e225 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -553,6 +553,25 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
>  						1, lockdep_map, ##args))
>  #endif
>  
> +
> +#ifdef CONFIG_LOCKDEP
> +/**
> + * taint_reclaim_workqueue - taint workqueue lockdep map with reclaim
> + * @wq: workqueue to taint with reclaim
> + * gfp: gfp taint
      ^@

> + *
> + * Drivers often use workqueues that are in the reclaim path (e.g., DRM
> + * scheduler workqueues). It is useful to teach lockdep that memory cannot be
> + * allocated on these workqueues.
> + */
> +extern void taint_reclaim_workqueue(struct workqueue_struct *wq, gfp_t gfp);
> +#else
> +static inline void taint_reclaim_workqueue(struct workqueue_struct *wq,
> +					   gfp_t gfp)

Would a more direct name work better, maybe something like
workqueue_warn_on_reclaim()?

Hmm... would it make sense to tie this to WQ_MEM_RECLAIM - ie. enable it
implicitly on workqueues w/ the flag set?

Thanks.

-- 
tejun
