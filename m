Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45674C9CF3C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 21:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA70B10E6C4;
	Tue,  2 Dec 2025 20:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GhFzY/01";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E20810E6BA;
 Tue,  2 Dec 2025 20:47:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1A39443CB2;
 Tue,  2 Dec 2025 20:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED27C4CEF1;
 Tue,  2 Dec 2025 20:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764708464;
 bh=l/Jj51vowNeSgGS/dVU8jWz01C1souuTfKbOaYrX4Zw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GhFzY/01zRShkLRPXj7D07dHNmqvz7x/CthRRa9Game+42RtJbNA84bYbyacAAj2H
 hgZNPVj95sBKnLrN4fQe8t0L+8KUbTeZ6aTHaMmtXFOj0n7u51Rz6oN0OVu31qYUZn
 sfSfUBmiNgQtIq5dkFrpRA9sAhpZXWHW07aPRNIzwxW2WUgIZTpgxO4qHgAmDZjpT2
 DRGZK7OMMhXXkbONvZPpULEbovh27zcJoXZRaOz7Zi8xcsO/W+9bXruKY3+28dZSvj
 nFD4qn7aFlmdSzkTIYi4UN4Hj4+i3hKPpfM0o/+ZAhUZaWJEuZ/NLpjFBvAhfryYoo
 myO1V0GpMrMKg==
Date: Tue, 2 Dec 2025 21:47:39 +0100
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 4/8] drm/xe: Use dma_fence_check_and_signal_locked()
Message-ID: <fdb7dhdrquapw4cb7oa23rpzl6dkzbnotc3otxntruf3a5hvca@szamkxwcjvfc>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-6-phasta@kernel.org>
 <aS3uycB40j2CptOf@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS3uycB40j2CptOf@lstrano-desk.jf.intel.com>
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

> > @@ -93,9 +92,8 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> >  		spin_lock_irqsave(&irq->lock, flags);
> >  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
> >  			list_del_init(&fence->irq_link);
> > -			err = dma_fence_signal_locked(&fence->dma);
> > +			XE_WARN_ON(dma_fence_check_and_signal_locked(&fence->dma));
> 
> I think XE_WARN_ON can compile out in certain builds. Best to leave warn on logic as is.

I don't think XE_WARN_ON compiles out. It should always evaluate
the content, then, depending on the build, it prints debug logs.

Andi
