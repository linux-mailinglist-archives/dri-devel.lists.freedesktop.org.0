Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEB4ABDEBE
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F9010E569;
	Tue, 20 May 2025 15:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eCM8v5H/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310F010E569;
 Tue, 20 May 2025 15:21:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1A8BB5C3C42;
 Tue, 20 May 2025 15:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F08EC4CEEA;
 Tue, 20 May 2025 15:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747754502;
 bh=2I2RLcNJVt/tlKlu1Lp5Cs9pa3vOTjYe6mYV0vz+MNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eCM8v5H/xpVdc2gVJZlOwPG+UMmK+4RJnJxxC34EGCueMramyU65Fyrzi0aEUGRlK
 3EgKIf8lYiDo7exi9dWoDkpeTsbQbKwgWL01yRvMv9vOHoXpv0s065EPa2kTgKEK2w
 u/YjO+nOJUNr1xaUjQOOfuUVN3cFPL1v7F/EwxnbQ+HvFNkQ+zBA7Do4Ip/anjkqW6
 /1IzPhnxCZMIrOcq1FN7m8Lmq3c4TTkGS8aJfTMDABODrsgKBpfaiIoWHJzlT2XlyA
 NRL3B7FLW4vO9Cfxq9Q4F200jKL+CSSu1ltjUB8B4Q3gxX8MBaCOOjw6YVxWmf3C7l
 2hmPhx2oStpGw==
Date: Tue, 20 May 2025 17:21:37 +0200
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
Subject: Re: [PATCH v5 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
Message-ID: <aCyeAb0vnQqPVbiz@cassiopeiae>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175348.11924-2-robdclark@gmail.com>
 <aCwt20O7SH1zQLlV@pollux>
 <CAF6AEGvhxeCAz41F72hq=V3aD38jm+aUQqX3GwaOR4uzZGn6hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvhxeCAz41F72hq=V3aD38jm+aUQqX3GwaOR4uzZGn6hg@mail.gmail.com>
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

On Tue, May 20, 2025 at 07:57:36AM -0700, Rob Clark wrote:
> On Tue, May 20, 2025 at 12:23 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Mon, May 19, 2025 at 10:51:24AM -0700, Rob Clark wrote:
> > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > > index f9eb56f24bef..1e89a98caad4 100644
> > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> > >       drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> > >       drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> > >
> > > -     drm_gem_gpuva_assert_lock_held(obj);
> > > +     if (kref_read(&obj->refcount) > 0)
> > > +             drm_gem_gpuva_assert_lock_held(obj);
> >
> > Again, this is broken. What if the reference count drops to zero right after
> > the kref_read() check, but before drm_gem_gpuva_assert_lock_held() is called?
> 
> No, it is not.  If you find yourself having this race condition, then
> you already have bigger problems.  There are only two valid cases when
> drm_gpuvm_bo_destroy() is called.  Either:
> 
> 1) You somehow hold a reference to the GEM object, in which case the
> refcount will be a positive integer.  Maybe you race but on either
> side of the race you have a value that is greater than zero.
> 2) Or, you are calling this in the GEM object destructor path, in
> which case no one else should have a reference to the object, so it
> isn't possible to race

What about:

3) You destroy the VM_BO, because the VM is destroyed, but someone else (e.g.
   another VM) holds a reference of this BO, which is dropped concurrently?

Please don't tell me "but MSM doesn't do that". This is generic infrastructure,
it is perfectly valid for drivers to do that.

> If the refcount drops to zero after the check, you are about to blow
> up regardless.

Exactly, that's why the whole approach of removing the reference count a VM_BO
has on the BO, i.e. the proposed DRM_GPUVM_VA_WEAK_REF is broken.

As mentioned, make it DRM_GPUVM_MSM_LEGACY_QUIRK and get an approval from Dave /
Sima for it.

You can't make DRM_GPUVM_VA_WEAK_REF work as a generic thing without breaking
the whole design and lifetimes of GPUVM.

We'd just end up with tons of traps for drivers with lots of WARN_ON() paths and
footguns like the one above if a driver works slightly different than MSM.
