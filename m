Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B66B33C14
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 12:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FC610E386;
	Mon, 25 Aug 2025 10:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AqpU7GO7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC37B10E441;
 Mon, 25 Aug 2025 10:00:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 559C6437AD;
 Mon, 25 Aug 2025 10:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D260C4CEED;
 Mon, 25 Aug 2025 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756116016;
 bh=Fj8WcsTEN8ypaUOHaZhHs2tXFkvjzLaxbEsj34azQG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AqpU7GO7gqGSDHnXqL6mVbDaU771+tmh4hhJztonsJHNTxtOMoX+EFKc8nQvE5FQN
 G8LIoKOqD3QE/07pIaKKhdpLW5+IC0lMSFTfUQvROh4LH+z1RquDzown+vn5F5C/NI
 P3V29qhZ/rtxaT3Cr3c3uT1x6xAUF5+WwIzEFopf9Pvmx7RbftbUKCJ9cRK2/FU26F
 siZ8WTK4cEehnc2NDNwxsZAvBemxcMpSAODaCnIiP8u5gowjsEqkTBtvMZwb03Z6zu
 7Mhs+Cg3WL2D/NpXNMh/uY6BQ9G91OIii/SOtiDbRmVkpCsRozvE43ZV6828wLc4yE
 oc3oJGdBNDcsQ==
Date: Mon, 25 Aug 2025 09:00:12 -0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2] drm/i915/guc: Add synchronization on interrupt enable
 flag
Message-ID: <lmfc6jvlzgmd3xy7ed7rwk2yp66o572hnp7wmq7t4qlenzwv56@izbw6hrdkfa2>
References: <20250822141356.3775250-1-zhanjun.dong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822141356.3775250-1-zhanjun.dong@intel.com>
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

Hi Zhanjun,

> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 75e802e10be2..21804eec8320 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -20,7 +20,7 @@
>  
>  static void guc_irq_handler(struct intel_guc *guc, u16 iir)
>  {
> -	if (unlikely(!guc->interrupts.enabled))
> +	if (unlikely(!atomic_read(&guc->interrupts.enabled)))
>  		return;
>  
>  	if (iir & GUC_INTR_GUC2HOST)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index f360f020d8f1..48148cb6cba0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -100,8 +100,9 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>  			 gt->pm_guc_events);
>  	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>  	spin_unlock_irq(gt->irq_lock);
> -
> -	guc->interrupts.enabled = true;
> +	atomic_set(&guc->interrupts.enabled, true);
> +	/* make sure interrupt handler will see changes */
> +	smp_mb();

Are we sure we need the barriers here? Can you please explain
better what you are trying to achieve?

My idea of barriers was to use in order to avoid converting
everything into atomic, which doesn't necessarily mean that it's
the best solution, it was just a thought.

But maybe I misunderstood your intention.

Andi
