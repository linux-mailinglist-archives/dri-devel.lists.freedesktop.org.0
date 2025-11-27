Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66E1C8E803
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 14:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDCE10E74D;
	Thu, 27 Nov 2025 13:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CeKkfLKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11A510E6DA;
 Thu, 27 Nov 2025 13:37:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D198360141;
 Thu, 27 Nov 2025 13:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83865C4CEF8;
 Thu, 27 Nov 2025 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764250642;
 bh=I4PdYzRN+MTqsZDHBCDDkw07FlKUWJA4d9AsRMAWLio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CeKkfLKKq6G2UJMAEwwq2lg7VIxz8nzuVel8G7pTAuyH6g3qCqjQ8JbVJCTgKB5Am
 NCMVptKu378LkF7MM+L9dGF3qY6Pju+zikBlcD/BNdZgkdfPZcfhSndlNaMDRlZfcd
 cIGOWkJaxaMGt6jRIXFnZd6JLo27vPLyU9BlbPlkZ/1fRNDi0nsotRreRw8EWTltxZ
 WRA5KtbghLMHzz8Q81GXthn0Ikzfp+vFn20tyCC121ThWqzKt3GgD3JdXjuE4s3EAM
 JkIKVKDFSw2nhbiITA524q66FbPbAuvlxU+b07DAfBkefVMCGnTnrhW26qvWO3Vhme
 0YABbqiV2F/nA==
Date: Thu, 27 Nov 2025 14:37:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>,
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
Message-ID: <q2kvwmnxomqlcx7zgvlvyhupduytfubcu5vghuf6ztrdaq55pb@gq4tg7qughun>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-5-phasta@kernel.org>
 <nrrk4kug6a42fztx7ryuz5bk6uy7roiszjhiivlvtrw3uvunps@wn44moyetzff>
 <aSeTsINKklqqJyIs@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSeTsINKklqqJyIs@lstrano-desk.jf.intel.com>
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

Hi Matt,

On Wed, Nov 26, 2025 at 03:56:32PM -0800, Matthew Brost wrote:
> On Wed, Nov 26, 2025 at 11:56:57PM +0100, Andi Shyti wrote:
> > > @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> > > @@ -93,9 +92,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> > >  		spin_lock_irqsave(&irq->lock, flags);
> > >  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
> > >  			list_del_init(&fence->irq_link);
> > > -			err = dma_fence_signal_locked(&fence->dma);
> > 
> > why don't we do
> > 
> > XE_WARN_ON(dma_fence_signal_locked(..))
> > 
> 
> IIRC the above statement can compile out. So the patch looks correct to me.

you have defined XE_WARN_ON as WARN_ON that should always
evaluate the content and, depending on the configuration, it
prints the logs or not.

What I don't like from this patch is that we end up checking
twice for the DMA_FENCE_FLAG_SIGNALED_BIT bit.

Thanks,
Andi
