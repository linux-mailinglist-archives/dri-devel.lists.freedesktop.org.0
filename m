Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088C0415F2E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 15:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAA989FED;
	Thu, 23 Sep 2021 13:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4225E6ED16;
 Thu, 23 Sep 2021 13:07:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="223877622"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="223877622"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 06:07:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="513966382"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.19.176])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 06:07:08 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH RESEND] drm/i915: Flush buffer pools on driver remove
Date: Thu, 23 Sep 2021 15:07:06 +0200
Message-ID: <70976479.RN2Pgac3cq@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20210922222429.GY3389343@mdroper-desk1.amr.corp.intel.com>
References: <20210903142320.216705-1-janusz.krzysztofik@linux.intel.com>
 <20210922222429.GY3389343@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Thanks for review.

On czwartek, 23 wrze=C5=9Bnia 2021 00:24:29 CEST Matt Roper wrote:
> On Fri, Sep 03, 2021 at 04:23:20PM +0200, Janusz Krzysztofik wrote:
> > In preparation for clean driver release, attempts to drain work queues
> > and release freed objects are taken at driver remove time.  However, GT
> > buffer pools are now not flushed before the driver release phase.
> > Since unused objects may stay there for up to one second, some may
> > survive until driver release is attempted.  That can potentially
> > explain sporadic then hardly reproducible issues observed at driver
> > release time, like non-zero shrink counter or outstanding address space
>=20
> So just to make sure I'm understanding the description here:
>  - We currently do an explicit flush of the buffer pools within the call
>    path of drm_driver.release(); this removes all buffers, regardless of
>    their age.

And also triggers release of the buffers' underlying resources (objects,=20
address space areas).

>  - However there may be other code that runs *earlier* within the
>    drm_driver.release() call chain=20

Yes, within the drm_driver.release() call chain, but not necessarily earlie=
r=20
=2D- that's irrelevant, I believe, ...

>    that expects buffer pools have
>    already been flushed and are already empty.

=2E.. since that other code expects not just buffer pools but resource=20
categories they consume (objects, address space areas) to be flushed alread=
y,=20
while some may still be busy with old buffers not auto-flushed yet.

>  - Since buffer pools auto-flush old buffers once per second in a worker
>    thread, there's a small window where if we remove the driver while
>    there are still buffers with an age of less than one second, the
>    assumptions of the other release code may be violated.

Correct.

> So by moving the flush to driver remove (which executes earlier via the
> pci_driver.remove() flow) you're ensuring that all buffers are flushed
> before _any_ code in drm_driver.release() executes.

And also flushed before some other code in pci_driver.remove() flushes thos=
e=20
other resource categories released on buffer pools flush, then completeness=
 of=20
all those flushes is checked in drm_driver.release().

May I copy-paste some of you wording while rephrasing my commit description?

Thanks,
Janusz

>=20
> I found the wording of the commit message here somewhat confusing since
> it's talking about flushes we do in driver release, but mentions
> problems that arise during driver release due to lack of flushing.  You
> might want to reword the commit message somewhat to help clarify.
> Otherwise, the code change itself looks reasonable to me.
>=20
> BTW, I do notice that drm_driver.release() in general is technically
> deprecated at this point (with a suggestion in the drm_drv.h comments to
> switch to using drmm_add_action(), drmm_kmalloc(), etc. to manage the
> cleanup of resources).  At some point in the future me may want to
> rework the i915 cleanup in general according to that guidance.
>=20
>=20
> Matt
>=20
> > areas.
> >=20
> > Flush buffer pools on GT remove as a fix.  On driver release, don't
> > flush the pools again, just assert that the flush was called and
> > nothing added more in between.
> >=20
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> > Resending with Cc: dri-devel@lists.freedesktop.org as requested, and a
> > typo in commit description fixed.
> >=20
> > Thanks,
> > Janusz
> >=20
> >  drivers/gpu/drm/i915/gt/intel_gt.c             | 2 ++
> >  drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c | 2 --
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/=
gt/intel_gt.c
> > index 62d40c986642..8f322a4ecd87 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > @@ -737,6 +737,8 @@ void intel_gt_driver_remove(struct intel_gt *gt)
> >  	intel_uc_driver_remove(&gt->uc);
> > =20
> >  	intel_engines_release(gt);
> > +
> > +	intel_gt_flush_buffer_pool(gt);
> >  }
> > =20
> >  void intel_gt_driver_unregister(struct intel_gt *gt)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c b/drivers/g=
pu/drm/i915/gt/intel_gt_buffer_pool.c
> > index aa0a59c5b614..acc49c56a9f3 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
> > @@ -245,8 +245,6 @@ void intel_gt_fini_buffer_pool(struct intel_gt *gt)
> >  	struct intel_gt_buffer_pool *pool =3D &gt->buffer_pool;
> >  	int n;
> > =20
> > -	intel_gt_flush_buffer_pool(gt);
> > -
> >  	for (n =3D 0; n < ARRAY_SIZE(pool->cache_list); n++)
> >  		GEM_BUG_ON(!list_empty(&pool->cache_list[n]));
> >  }
>=20
>=20




