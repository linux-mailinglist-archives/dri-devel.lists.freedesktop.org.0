Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77528C8FA44
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 18:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7697B10E838;
	Thu, 27 Nov 2025 17:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c0KfnE/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E93510E16F;
 Thu, 27 Nov 2025 17:19:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E8C8840645;
 Thu, 27 Nov 2025 17:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF0EC113D0;
 Thu, 27 Nov 2025 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764263970;
 bh=+8mv6i8YDqflMNXf6rSyL0ngsI4DSuUXQc+IAsMcIoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c0KfnE/yW9mBtNrtCv44gXHVw6SA0/m6sGRU7msy3eAgPWadTZyvHIkYKGNDUnM7W
 28ftgpbYM2BNqaIQH038Kl27gGXNVq7FV/E7oQRx3VLgZ6RFLtdff8s2iwtizMjgcg
 xeQzJCXOCOTb0EatsXDdloTWKGrDRCysTipTKHEftdjOa1ssf4m16kgkv0UgbXYc+4
 odbVSb8qMOxIkoimUTTcrsI13GEY0gYhIUAaRjZPomLyF0JlNFjl6w6aanfeYFQfA2
 lkq/9R63TZDx3yK+SxPvcsaAr1pNoICpg/TmokPgvFqSNd8ZcRbmaDKmPvRKVOfZ9s
 rAI1CjOpXsKAA==
Date: Thu, 27 Nov 2025 18:19:27 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: phasta@kernel.org
Cc: Matthew Brost <matthew.brost@intel.com>, 
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
Message-ID: <enlnwawk3qtcbgfm7dmuyefb4tx3hxsrmzozkabpeixxsi3y24@pukuuth2zlke>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-5-phasta@kernel.org>
 <nrrk4kug6a42fztx7ryuz5bk6uy7roiszjhiivlvtrw3uvunps@wn44moyetzff>
 <aSeTsINKklqqJyIs@lstrano-desk.jf.intel.com>
 <q2kvwmnxomqlcx7zgvlvyhupduytfubcu5vghuf6ztrdaq55pb@gq4tg7qughun>
 <63274dd281ac94f2680a4aa91f541de82435fda5.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63274dd281ac94f2680a4aa91f541de82435fda5.camel@mailbox.org>
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

On Thu, Nov 27, 2025 at 02:51:39PM +0100, Philipp Stanner wrote:
> On Thu, 2025-11-27 at 14:37 +0100, Andi Shyti wrote:
> > On Wed, Nov 26, 2025 at 03:56:32PM -0800, Matthew Brost wrote:
> > > On Wed, Nov 26, 2025 at 11:56:57PM +0100, Andi Shyti wrote:
> > > > > @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> > > > > @@ -93,9 +92,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> > > > >  		spin_lock_irqsave(&irq->lock, flags);
> > > > >  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
> > > > >  			list_del_init(&fence->irq_link);
> > > > > -			err = dma_fence_signal_locked(&fence->dma);
> > > > 
> > > > why don't we do
> > > > 
> > > > XE_WARN_ON(dma_fence_signal_locked(..))
> 
> because it's impossible because the series is about removing the return
> codes from the dma_fence_signal_* functions.

oh yes, the last patch. Sorry, I went on reviewing and lost the
final target from sight.

> > > > 
> > > 
> > > IIRC the above statement can compile out. So the patch looks correct to me.
> > 
> > you have defined XE_WARN_ON as WARN_ON that should always
> > evaluate the content and, depending on the configuration, it
> > prints the logs or not.
> > 
> > What I don't like from this patch is that we end up checking
> > twice for the DMA_FENCE_FLAG_SIGNALED_BIT bit.
> 
> Depends on what you mean by "we". The Xe code checks it only once, with
> dma_fence_test_signaled_flag(). The dma_fence backend checks it yet
> again, as it always does, to avoid signaling a signaled fence.
> 
> That's not racy here, however, because the fence lock is already being
> held, as evidenced by the current usage of dma_fence_signal_locked().

I haven't said it's racy, I just didn't like that we are testing
for the DMA_FENCE_FLAG_SIGNALED_BIT twice. On the other hand,
with dma_fence_signal_locked() being void, I wouldn't know how to
do it better. So that I guess it's fine.

Andi
