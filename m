Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09CDAB8E41
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 19:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FF010E04A;
	Thu, 15 May 2025 17:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lXmvDAdx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3290D10E04A;
 Thu, 15 May 2025 17:55:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5DF1BA4E37F;
 Thu, 15 May 2025 17:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EDFC4CEE7;
 Thu, 15 May 2025 17:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747331740;
 bh=i4vifiLNuSWbBlEZtxR9KslXnjVvRyWQaBDzgJm5B4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lXmvDAdxxNjrtLgut5C+OQvJ9QNFlC6IZslGuhoUtfZhRhcfLHQjN6BX88VsRS4wd
 s23zrN8105s+CCsJI8JN5KU4DCMnSW7LLZeBIczC9tXup++DMDrcsvONiNFuhKFUhi
 xYg96IdRj31xN58rjtWSNGgMgJG0dHWc3Mw07zfhZuqVdglFcWujp5wapWVhyf9K+A
 ecTGCmL1w17qRi1rduUGfPHEg8p35O9bxuBMYgTy9UiZPZi9zte9exJTknvfWbZ0cI
 pm1NRaax9I/hv1mrS1urvtBnkHdb5PmbYNf9iIyaxS7zFf1mDjV/zlxFfEUtxAQZnL
 rVM4yXMiHGrWA==
Date: Thu, 15 May 2025 19:55:34 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
Message-ID: <aCYqlvp_T77LyuMa@pollux>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux> <aCWueFzx2QzF7LVg@pollux>
 <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
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

On Thu, May 15, 2025 at 10:35:21AM -0700, Rob Clark wrote:
> On Thu, May 15, 2025 at 2:06 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Thu, May 15, 2025 at 10:54:27AM +0200, Danilo Krummrich wrote:
> > > Hi Rob,
> > >
> > > Can you please CC me on patches for GPUVM?
> > >
> > > On Wed, May 14, 2025 at 10:53:15AM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> > > > msm_gem_free_object()") for justification.
> > >
> > > Please write a proper commit message that explains the problem and the solution.
> > > Please don't just refer to another commit and leave it to the reviewer of the
> > > patch to figure this out.
> > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
> > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > >
> > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > > > index f9eb56f24bef..1e89a98caad4 100644
> > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> > > >     drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> > > >     drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> > > >
> > > > -   drm_gem_gpuva_assert_lock_held(obj);
> > > > +   if (kref_read(&obj->refcount) > 0)
> > > > +           drm_gem_gpuva_assert_lock_held(obj);
> > > > +
> > > >     list_del(&vm_bo->list.entry.gem);
> > >
> > > This seems wrong.
> > >
> > > A VM_BO object keeps a reference of the underlying GEM object, so this should
> > > never happen.
> > >
> > > This function calls drm_gem_object_put() before it returns.
> >
> > I noticed your subsequent patch that allows VM_BO structures to have weak
> > references to GEM objects.
> >
> > However, even with that this seems wrong. If the reference count of the GEM
> > object is zero when drm_gpuvm_bo_destroy() is called it means that the GEM
> > object is dead. However, until drm_gpuvm_bo_destroy() is called the GEM object
> > potentially remains to be on the extobj and eviced list, which means that other
> > code paths might fetch it from those lists and consider it to be a valid GEM
> > object.
> 
> We only iterate extobj or evicted in VM_BIND mode, where we aren't
> using WEAK_REF.  I suppose some WARN_ON()s or BUG_ON()s could make
> this more clear.

There is also the GEM object's list of VM_BOs, are you using that?

Anyways, I don't agree with that. Even if you can tweak your driver to not run
into trouble with this, we can't introduce a mode that violates GOUVM's internal
lifetimes and subsequently fix it up with WARN_ON() or BUG_ON().

I still don't see a real technical reason why msm can't be reworked to follow
those lifetime rules.
