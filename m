Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7B6AB81FA
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE5010E7D6;
	Thu, 15 May 2025 09:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OND4TY4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EC410E7D5;
 Thu, 15 May 2025 09:06:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 512584477B;
 Thu, 15 May 2025 09:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A383EC4CEE7;
 Thu, 15 May 2025 09:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747299966;
 bh=KVY2YR7khCYNOCGLba4NVihio2a5hTYB8gCPwnroNdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OND4TY4xJq4Hnv4qPFKzx89EsiDAYuzN/vQh+XCTq1XkESWagGO7QkZWuyq6aH06x
 0nfBBBBAQoV9ELVRL60bJoCLtuj+W5tucWLqRMarMn8pXSkc08c4f0LSmKU5wwqwQM
 6KrtbXvA6YxpgjnOtDcqP50HnMkk3MFBdDfIg8WZTFxZmYjtUyz93jDpTjaFH5SCRW
 XmkZgcIHjdCD6K3RffNQSUED2duOj/IuG5bxjFKswmvsNIXwsEEY/t5JtwKoRjURb1
 1C9xR5VrKixOOnwk91no+2nJ+/e4MlX10zDAQZGEifuttyKzsUTjNP/0GyxbiRkv2W
 NgMEwTOey4Slw==
Date: Thu, 15 May 2025 11:06:00 +0200
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
Message-ID: <aCWueFzx2QzF7LVg@pollux>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCWrwz2IF6VBUi4e@pollux>
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

On Thu, May 15, 2025 at 10:54:27AM +0200, Danilo Krummrich wrote:
> Hi Rob,
> 
> Can you please CC me on patches for GPUVM?
> 
> On Wed, May 14, 2025 at 10:53:15AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> > msm_gem_free_object()") for justification.
> 
> Please write a proper commit message that explains the problem and the solution.
> Please don't just refer to another commit and leave it to the reviewer of the
> patch to figure this out.
> 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> 
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index f9eb56f24bef..1e89a98caad4 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> >  	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> >  	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> >  
> > -	drm_gem_gpuva_assert_lock_held(obj);
> > +	if (kref_read(&obj->refcount) > 0)
> > +		drm_gem_gpuva_assert_lock_held(obj);
> > +
> >  	list_del(&vm_bo->list.entry.gem);
> 
> This seems wrong.
> 
> A VM_BO object keeps a reference of the underlying GEM object, so this should
> never happen.
> 
> This function calls drm_gem_object_put() before it returns.

I noticed your subsequent patch that allows VM_BO structures to have weak
references to GEM objects.

However, even with that this seems wrong. If the reference count of the GEM
object is zero when drm_gpuvm_bo_destroy() is called it means that the GEM
object is dead. However, until drm_gpuvm_bo_destroy() is called the GEM object
potentially remains to be on the extobj and eviced list, which means that other
code paths might fetch it from those lists and consider it to be a valid GEM
object.
