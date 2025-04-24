Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9497A9AF19
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6911310E803;
	Thu, 24 Apr 2025 13:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h+WMpM67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BFA10E800;
 Thu, 24 Apr 2025 13:34:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C700568455;
 Thu, 24 Apr 2025 13:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6456C4CEE3;
 Thu, 24 Apr 2025 13:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745501678;
 bh=Ep8K/g6VuToes51lb5CKD1nUivYncvjh5+GzmIyT6y8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h+WMpM67Dqp9i75rxlhOqiat5HBC9sFwdDi/1tMbT4VhguTa2TbBUg28+Jquf+TR0
 bn8qtyrpQd1aGqQzS+GzTBPrPQK9SIB1lB7W8rh3qg2yJjm8yJ8C2pwc/MJQtwoSPn
 fjx8BRI2jG3/2lc+obPmotjw3J2exELJMAAkO1akSoRON0ODYwOEVjYVLV002/iIsP
 4uTvMzkw8Fwp0pJZfF0n4bEVSJC0C3u8t2z4poerunI9ymPM5iFxG41Xv+3D1RAR6m
 2J43ZPPsD9nmnQhAv7ueg+BQdrHV4W+AYEwopdzweZqj0223eWk5z1iPzOpHinnR8x
 8+4mI0e9DeoWA==
Date: Thu, 24 Apr 2025 15:34:33 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 4/4] drm/nouveau: Check dma_fence in canonical way
Message-ID: <aAo96dnXwFBxx8as@cassiopeiae>
References: <20250424130254.42046-2-phasta@kernel.org>
 <20250424130254.42046-6-phasta@kernel.org>
 <609c8b1a-d7a9-4667-bd6c-1455c639fcd0@kernel.org>
 <a27a0a01fa2bf5f328ee762b7dd84dffd18fa664.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a27a0a01fa2bf5f328ee762b7dd84dffd18fa664.camel@mailbox.org>
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

(+ drm-misc maintainers)

On Thu, Apr 24, 2025 at 03:25:55PM +0200, Philipp Stanner wrote:
> On Thu, 2025-04-24 at 15:24 +0200, Danilo Krummrich wrote:
> > On 4/24/25 3:02 PM, Philipp Stanner wrote:
> > > In nouveau_fence_done(), a fence is checked for being signaled by
> > > manually evaluating the base fence's bits. This can be done in a
> > > canonical manner through dma_fence_is_signaled().
> > > 
> > > Replace the bit-check with dma_fence_is_signaled().
> > > 
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > index fb9811938c82..d5654e26d5bc 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > @@ -253,7 +253,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
> > >   	struct nouveau_channel *chan;
> > >   	unsigned long flags;
> > >   
> > > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> > > >base.flags))
> > > +	if (dma_fence_is_signaled(&fence->base))
> > 
> > This is only correct with commit bbe5679f30d7 ("drm/nouveau: Fix
> > WARN_ON in
> > nouveau_fence_context_kill()") from drm-misc-fixes, correct?
> 
> Yup. Otherwise, this series can't be merged anyways, because patch 1
> depends on it.
> 
> The cover letter says so: "This series is based on this partially
> merged series: [1]"

Well, the series may be based on commit bbe5679f30d7, but all patches from the
series can still be applied independently.

Only patch 4 depends on this commit in terms of correctness.

But that's fine, I think we can get drm-misc-fixes (or the next -rc) backmerged
into drm-misc-next.
