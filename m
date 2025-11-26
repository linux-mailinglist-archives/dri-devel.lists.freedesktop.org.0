Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A4BC8C432
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DCB10E718;
	Wed, 26 Nov 2025 22:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jomsD9na";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B2310E711;
 Wed, 26 Nov 2025 22:57:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 179B340342;
 Wed, 26 Nov 2025 22:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1719FC4CEF7;
 Wed, 26 Nov 2025 22:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764197821;
 bh=8I/xGxV7I8iD8HYdd979j/s++PDEKqXSxYMQBYTKWpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jomsD9nanJNdlCen2lyrewaNWmEapu0FwRBQWvsry8urtiF6ZeDM0xRtpsMucbriD
 NqyB137BJUVGP03Juyd+hMxguTgN4FfqevdbmNfQB0gO58r3Q44H/gUGci58dHTVei
 3OEJ2gFIcV4xw8GO6MgK/5JSwV613BaPzxS3dftlfNi7ujxvyzbwqa0lGj+qOJNklw
 SnwkHN1Y7NZO/jgie5BLBWfcOIb/REoPTc129j82R9KGwUKR2xYwSLhEoDd3B0tpOk
 R4CsGmMlDwXTsJbSu1Ive94vTPqf3N02svFAV3WRPBf87PlGxIiPOs1834EkfH+kkC
 l8a34+LFmWJCw==
Date: Wed, 26 Nov 2025 23:56:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 3/6] drm/gpu/xe: Ignore dma_fenc_signal() return code
Message-ID: <nrrk4kug6a42fztx7ryuz5bk6uy7roiszjhiivlvtrw3uvunps@wn44moyetzff>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-5-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126131914.149445-5-phasta@kernel.org>
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

Hi Philipp,

in the subject /dma_fenc_signal/dma_fence_signal/

> @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
>  {
>  	struct xe_hw_fence *fence, *next;
>  	unsigned long flags;
> -	int err;
>  	bool tmp;
>  
>  	if (XE_WARN_ON(!list_empty(&irq->pending))) {
> @@ -93,9 +92,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
>  		spin_lock_irqsave(&irq->lock, flags);
>  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
>  			list_del_init(&fence->irq_link);
> -			err = dma_fence_signal_locked(&fence->dma);

why don't we do

XE_WARN_ON(dma_fence_signal_locked(..))

instead?

Andi

> +			XE_WARN_ON(dma_fence_test_signaled_flag(&fence->dma));
> +			dma_fence_signal_locked(&fence->dma);
>  			dma_fence_put(&fence->dma);
> -			XE_WARN_ON(err);
>  		}
>  		spin_unlock_irqrestore(&irq->lock, flags);
>  		dma_fence_end_signalling(tmp);
> -- 
> 2.49.0
> 
