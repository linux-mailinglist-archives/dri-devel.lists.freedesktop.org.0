Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BB4ADCEEA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4655F10E331;
	Tue, 17 Jun 2025 14:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F2Fg5CnB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265D710E331
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:10:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BA8C062A1F;
 Tue, 17 Jun 2025 14:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B66C4CEE3;
 Tue, 17 Jun 2025 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750169445;
 bh=h/mgp9A4Cdb1y4wnoba8PjQx1Zhxgyk1hRev/3ZeAuY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=F2Fg5CnBoiadAoDPsCPoZhQwSCPkuJLn/e1uVKTCMnfOv21b5ug8fDAC6GNEKcY3B
 qUSBV/V/7egoCEWOlKrkBjN6+POhJtDz6wIDFqDO6HVlp2ANX3FOQe37JiX2x2CUrD
 R0jZ043diAKoznqXl4DP2QfD/wmJOaoWz78DXIqGZp9EQksu2YEZ3pN/UvdXkBWlco
 YExvEN261vgqBgM9qXR2f2VT47TzalIWFUIC15yg4DnoNhFtsrlAoZNsZdxjuUxe0K
 eSotaVgVkNkszp4mt4D22HuFa0+CYEFC4XpxvEizzhYhjlvSBeA8NnWkTmFfzrn+x7
 VMpdpXSqvbk4Q==
Date: Tue, 17 Jun 2025 16:10:40 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v2] drm/sched: Clarify scenarios for separate workqueues
Message-ID: <aFF3YIAFkgsAKvQV@pollux>
References: <20250612144953.111829-2-phasta@kernel.org>
 <aFFy5aG1eOeMU44S@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFFy5aG1eOeMU44S@phenom.ffwll.local>
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

On Tue, Jun 17, 2025 at 03:51:33PM +0200, Simona Vetter wrote:
> On Thu, Jun 12, 2025 at 04:49:54PM +0200, Philipp Stanner wrote:
> > + * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
> > + * theoretically can deadlock. It must be guaranteed that submit_wq never has
> > + * more than max_active - 1 active tasks, or if max_active tasks are reached at
> > + * least one of them does not execute operations that may block on dma_fences
> > + * that potentially make progress through this scheduler instance. Otherwise,
> > + * it is possible that all max_active tasks end up waiting on a dma_fence (that
> > + * can only make progress through this schduler instance), while the
> > + * scheduler's queued work waits for at least one of the max_active tasks to
> > + * finish. Thus, this can result in a deadlock.
> 
> Uh if you have an ordered wq you deadlock with just one misuse. I'd just
> explain that the wq must provide sufficient forward-progress guarantees
> for the scheduler, specifically that it's on the dma_fence signalling
> critical path and leave the concrete examples for people to figure out
> when the design a specific locking scheme.

This isn't a concrete example, is it? It's exactly what you say in slightly
different words, with the addition of highlighting the impact of the workqueue's
max_active configuration.

I think that's relevant, because N - 1 active tasks can be on the dma_fence
signalling critical path without issues.

We could change

	"if max_active tasks are reached at least one of them must not execute
	 operations that may block on dma_fences that potentially make progress
	 through this scheduler instance"

to 

	"if max_active tasks are reached at least one of them must not be on the
	 dma_fence signalling critical path"

which is a bit more to the point I think.
