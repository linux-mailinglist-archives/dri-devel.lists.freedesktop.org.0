Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F28838C84
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4584A10E725;
	Tue, 23 Jan 2024 10:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4CB10E725;
 Tue, 23 Jan 2024 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706007084; x=1737543084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zXeAHTyBlabnk6f3lqgjSUeWSTZ7yqX1csNml/X3v7U=;
 b=S8ozjn9cIxWQpiJcLxzBpycAi43SBLpRKRgkuHPvWbz1DpuMFnRen6kH
 QMxyYYnzjzXzuAJLi8AHJTtkemgeB+ltbr7NaMM8oBtOU9ndjpjfFiszk
 oPWLRI7+WsIjwKjpzMZgErqce6xBq7bBRhxyMBFSfoZR1cFWDeb5XrKdv
 zbOj4ulyf/on7MNborFEEIWro5+fkHVMhRhfDu7gzKdSvYL2qREEyANU3
 dXsDooKmbKq4Aw+V4KZKBaDNFIMa+fEgYQk4G1uoIRqphpoX0xDboUXjd
 0qJzw6bd60zQcr6ZrGQm9Cc8LLypGBZUBiCCQY8Rrszsz1gh6qXvrdeqo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="377466"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="377466"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:51:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="27975528"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.0.222])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:51:19 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 1/3] drm/i915/vma: Fix UAF on destroy against retire
 race
Date: Tue, 23 Jan 2024 11:51:15 +0100
Message-ID: <2216168.NgBsaNRSFp@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Za7Zkn2-jYEvz8Vo@intel.com>
References: <20240122141007.401490-5-janusz.krzysztofik@linux.intel.com>
 <20240122141007.401490-6-janusz.krzysztofik@linux.intel.com>
 <Za7Zkn2-jYEvz8Vo@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

Thank you for review.

On Monday, 22 January 2024 22:09:38 CET Rodrigo Vivi wrote:
> On Mon, Jan 22, 2024 at 03:04:42PM +0100, Janusz Krzysztofik wrote:
> > Object debugging tools were sporadically reporting illegal attempts to
> > free a still active i915 VMA object when parking a GPU tile believed to=
 be
> > idle.
> >=20
> > [161.359441] ODEBUG: free active (active state 0) object: ffff88811643b=
958 object type: i915_active hint: __i915_vma_active+0x0/0x50 [i915]
> > [161.360082] WARNING: CPU: 5 PID: 276 at lib/debugobjects.c:514 debug_p=
rint_object+0x80/0xb0
> > ...
> > [161.360304] CPU: 5 PID: 276 Comm: kworker/5:2 Not tainted 6.5.0-rc1-CI=
_DRM_13375-g003f860e5577+ #1
> > [161.360314] Hardware name: Intel Corporation Rocket Lake Client Platfo=
rm/RocketLake S UDIMM 6L RVP, BIOS RKLSFWI1.R00.3173.A03.2204210138 04/21/2=
022
> > [161.360322] Workqueue: i915-unordered __intel_wakeref_put_work [i915]
> > [161.360592] RIP: 0010:debug_print_object+0x80/0xb0
> > ...
> > [161.361347] debug_object_free+0xeb/0x110
> > [161.361362] i915_active_fini+0x14/0x130 [i915]
> > [161.361866] release_references+0xfe/0x1f0 [i915]
> > [161.362543] i915_vma_parked+0x1db/0x380 [i915]
> > [161.363129] __gt_park+0x121/0x230 [i915]
> > [161.363515] ____intel_wakeref_put_last+0x1f/0x70 [i915]
> >=20
> > That has been tracked down to be happening when another thread is
> > deactivating the VMA inside __active_retire() helper, after the VMA's
> > active counter has been already decremented to 0, but before deactivati=
on
> > of the VMA's object is reported to the object debugging tool.
> >=20
> > We could prevent from that race by serializing i915_active_fini() with
> > __active_retire() via ref->tree_lock, but that wouldn't stop the VMA fr=
om
> > being used, e.g. from __i915_vma_retire() called at the end of
> > __active_retire(), after that VMA has been already freed by a concurrent
> > i915_vma_destroy() on return from the i915_active_fini().  Then, we sho=
uld
> > rather fix the issue at the VMA level, not in i915_active.
> >=20
> > Since __i915_vma_parked() is called from __gt_park() on last put of the
> > GT's wakeref, the issue could be addressed by holding the GT wakeref lo=
ng
> > enough for __active_retire() to complete before that wakeref is released
> > and the GT parked.
> >=20
> > A VMA associated with a request doesn't acquire a GT wakeref by itself.
> > Instead, it depends on a wakeref held directly by the request's active
> > intel_context for a GT associated with its VM, and indirectly on that
> > intel_context's engine wakeref if the engine belongs to the same GT as =
the
> > VMA's VM.  In case of single-tile platforms, at least one of those
> > wakerefs is usually held long enough for the request's VMA to be
> > deactivated on time, before it is destroyed on last put of its VM GT
> > wakeref.  However, on multi-tile platforms, a request may use a VMA fro=
m a
> > tile other than the one that hosts the request's engine, then it is
> > protected only with the intel_context's VM GT wakeref.
> >=20
> > There was an attempt to fix this issue on 2-tile Meteor Lake by acquiri=
ng
>=20
> please do not confuse the terminology here. MTL is 1-tile platform,
> with multiple GTs (1 for Render/Compute and 1 for Media).

I didn't realize that "tile" is not the same as "GT".  I can review the who=
le=20
description and replace all occurrences of "tile" with "GT".

>=20
> Also you could probably avoid mentioning the other case here when
> you are actively trying to resolve the RKL's single GT case.

OK, but let me keep that part of commit description in the cover letter the=
n,=20
because:
=2D historically, the issue was more frequently reproduced in CI on MTL tha=
n on=20
  other platforms, and that was the initial scope I started working on,
=2D the full description as is better reflects phases of my process of=20
  reproduction and root cause analysis of the issue,
=2D the MTL case was specifically addressed by the former insufficient=20
  workaround which now I'm now proposing to drop.

> > an extra wakeref for a Primary GT from i915_gem_do_execbuffer() -- see
> > commit f56fe3e91787 ("drm/i915: Fix a VMA UAF for multi-gt platform").
> > However, it occurred insufficient -- the issue was still reported by CI.
> > That wakeref was released on exit from i915_gem_do_execbuffer(), then
> > potentially before completion of the request and deactivation of its
> > associated VMAs.
> >=20
> > OTOH, CI reports indicate that single-tile platforms also suffer
> > sporadically from the same race.
> >=20
> > I believe the issue was introduced by commit d93939730347 ("drm/i915:
> > Remove the vma refcount") which moved a call to i915_active_fini() from
> > a dropped i915_vma_release(), called on last put of the removed VMA kre=
f,
> > to i915_vma_parked() processing path called on last put of a GT wakeref.
> > However, its visibility to the object debugging tool was suppressed by a
> > bug in i915_active that was fixed two weeks later with commit e92eb246f=
eb9
> > ("drm/i915/active: Fix missing debug object activation").
> >=20
> > Fix the issue by getting a wakeref for the VMA's tile when activating i=
t,
> > and putting that wakeref only after the VMA is deactivated.  However,
> > exclude global GTT from that processing path, otherwise the GPU never g=
oes
> > idle.  Since __i915_vma_retire() may be called from atomic contexts, use
> > async variant of wakeref put.
>=20
> okay, this explains the first block of the patch below, but I'm afraid
> that it doesn't explain why:
>=20
> -     if (flags & PIN_GLOBAL)

That's explained in v2 changelog below, I believe.  I can add that informat=
ion=20
to the body of commit description as well.

Thanks,
Janusz


> >=20
> > v4: Refresh on top of commit 5e4e06e4087e ("drm/i915: Track gt pm
> >     wakerefs") (Andi),
> >   - for more easy backporting, split out removal of former insufficient
> >     workarounds and move them to separate patches (Nirmoy).
> >   - clean up commit message and description a bit.
> > v3: Identify root cause more precisely, and a commit to blame,
> >   - identify and drop former workarounds,
> >   - update commit message and description.
> > v2: Get the wakeref before VM mutex to avoid circular locking dependenc=
y,
> >   - drop questionable Fixes: tag.
> >=20
> > Fixes: d93939730347 ("drm/i915: Remove the vma refcount")
> > Closes: https://gitlab.freedesktop.org/drm/intel/issues/8875
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: stable@vger.kernel.org # v5.19+
> > ---
> >  drivers/gpu/drm/i915/i915_vma.c       | 26 +++++++++++++++++++-------
> >  drivers/gpu/drm/i915/i915_vma_types.h |  1 +
> >  2 files changed, 20 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i91=
5_vma.c
> > index d09aad34ba37f..604d420b9e1fd 100644
> > --- a/drivers/gpu/drm/i915/i915_vma.c
> > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > @@ -34,6 +34,7 @@
> >  #include "gt/intel_engine.h"
> >  #include "gt/intel_engine_heartbeat.h"
> >  #include "gt/intel_gt.h"
> > +#include "gt/intel_gt_pm.h"
> >  #include "gt/intel_gt_requests.h"
> >  #include "gt/intel_tlb.h"
> > =20
> > @@ -103,12 +104,25 @@ static inline struct i915_vma *active_to_vma(stru=
ct i915_active *ref)
> > =20
> >  static int __i915_vma_active(struct i915_active *ref)
> >  {
> > -	return i915_vma_tryget(active_to_vma(ref)) ? 0 : -ENOENT;
> > +	struct i915_vma *vma =3D active_to_vma(ref);
> > +
> > +	if (!i915_vma_tryget(vma))
> > +		return -ENOENT;
> > +
> > +	if (!i915_vma_is_ggtt(vma))
> > +		vma->wakeref =3D intel_gt_pm_get(vma->vm->gt);
> > +
> > +	return 0;
> >  }
> > =20
> >  static void __i915_vma_retire(struct i915_active *ref)
> >  {
> > -	i915_vma_put(active_to_vma(ref));
> > +	struct i915_vma *vma =3D active_to_vma(ref);
> > +
> > +	if (!i915_vma_is_ggtt(vma))
> > +		intel_gt_pm_put_async(vma->vm->gt, vma->wakeref);
> > +
> > +	i915_vma_put(vma);
> >  }
> > =20
> >  static struct i915_vma *
> > @@ -1404,7 +1418,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct =
i915_gem_ww_ctx *ww,
> >  	struct i915_vma_work *work =3D NULL;
> >  	struct dma_fence *moving =3D NULL;
> >  	struct i915_vma_resource *vma_res =3D NULL;
> > -	intel_wakeref_t wakeref =3D 0;
> > +	intel_wakeref_t wakeref;
> >  	unsigned int bound;
> >  	int err;
> > =20
> > @@ -1424,8 +1438,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct =
i915_gem_ww_ctx *ww,
> >  	if (err)
> >  		return err;
> > =20
> > -	if (flags & PIN_GLOBAL)
> > -		wakeref =3D intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
> > +	wakeref =3D intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
> > =20
> >  	if (flags & vma->vm->bind_async_flags) {
> >  		/* lock VM */
> > @@ -1561,8 +1574,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct =
i915_gem_ww_ctx *ww,
> >  	if (work)
> >  		dma_fence_work_commit_imm(&work->base);
> >  err_rpm:
> > -	if (wakeref)
> > -		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
> > +	intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
> > =20
> >  	if (moving)
> >  		dma_fence_put(moving);
> > diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i9=
15/i915_vma_types.h
> > index 64472b7f0e770..f0086fadff4d3 100644
> > --- a/drivers/gpu/drm/i915/i915_vma_types.h
> > +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> > @@ -264,6 +264,7 @@ struct i915_vma {
> >  #define I915_VMA_SCANOUT	((int)BIT(I915_VMA_SCANOUT_BIT))
> > =20
> >  	struct i915_active active;
> > +	intel_wakeref_t wakeref;
> > =20
> >  #define I915_VMA_PAGES_BIAS 24
> >  #define I915_VMA_PAGES_ACTIVE (BIT(24) | 1)
>=20




