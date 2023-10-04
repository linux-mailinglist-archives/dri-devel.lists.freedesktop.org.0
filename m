Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1BE7B8710
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 19:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D5010E39F;
	Wed,  4 Oct 2023 17:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F8110E39F;
 Wed,  4 Oct 2023 17:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696442245; x=1727978245;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jKsfmr7DjmzOJld6nX7IGk+XT7heKkMu4dAE8YYTBFQ=;
 b=KAUEP39zuGoB0hEefwNJe9X/C6Bpoh+4TybjufKSxVruUVTEPSsWd5DK
 BKXFI1O7zm6EKnHNnGWX9zWDFGTaeFzNPwKvaTE/KolS+cGB7LMEo83xf
 VWELEE4fHMHVcQfGFUoX4cY8EgOKC7x9GCPsV/J1bKtVlQinhy3rZrRfL
 MOaA9sCVWOCCVbD72BjKCfSuGIEDMC0/7k22b2EXRfrgFi+/s9cE+NvLu
 Wscwm2CqaAjazS3m4wOjMWBMpw9CcymMvoqkdEg5swDt9eNCttUx7mPfF
 yfRUqV4YTjRcxTVXhW1s5F1uYyczHD2HQ3yTruOe3Z0s5OUuD5hCQvp8j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="382119541"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="382119541"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817209557"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="817209557"
Received: from binsumax-mobl.gar.corp.intel.com (HELO [10.249.254.31])
 ([10.249.254.31])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:57:10 -0700
Message-ID: <bbb235037b02336a8c69271d5ff97c69b2e8b597.camel@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v5 4/6] drm/gpuvm: track/lock/validate
 external/evicted objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch, 
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith@gfxstrand.net
Date: Wed, 04 Oct 2023 19:57:06 +0200
In-Reply-To: <74d79ced-e811-bed9-6fb0-db694428c10f@redhat.com>
References: <20230928191624.13703-1-dakr@redhat.com>
 <20230928191624.13703-5-dakr@redhat.com>
 <e4e68970-c7c9-55e2-9483-01252f38c956@linux.intel.com>
 <6b16ab6f-b1a2-efdb-04bf-5af4c3de381b@linux.intel.com>
 <6489f31f-8929-3e59-fbef-a22049cccbe3@redhat.com>
 <36233651a7675ab894134e41fc711fdcc71eefec.camel@linux.intel.com>
 <74d79ced-e811-bed9-6fb0-db694428c10f@redhat.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-10-04 at 19:17 +0200, Danilo Krummrich wrote:
> On 10/4/23 17:29, Thomas Hellstr=C3=B6m wrote:
> >=20
> > On Wed, 2023-10-04 at 14:57 +0200, Danilo Krummrich wrote:
> > > On 10/3/23 11:11, Thomas Hellstr=C3=B6m wrote:
> > >=20
> > > <snip>
> > >=20
> > > > > > +
> > > > > > +/**
> > > > > > + * drm_gpuvm_bo_evict() - add / remove a &drm_gpuvm_bo to
> > > > > > /
> > > > > > from the &drm_gpuvms
> > > > > > + * evicted list
> > > > > > + * @vm_bo: the &drm_gpuvm_bo to add or remove
> > > > > > + * @evict: indicates whether the object is evicted
> > > > > > + *
> > > > > > + * Adds a &drm_gpuvm_bo to or removes it from the
> > > > > > &drm_gpuvms
> > > > > > evicted list.
> > > > > > + */
> > > > > > +void
> > > > > > +drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gem_object *obj =3D vm_bo->obj;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 dma_resv_assert_held(obj->resv);
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 /* Always lock list transactions, even if
> > > > > > DRM_GPUVM_RESV_PROTECTED is
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * set. This is required to protect mu=
ltiple
> > > > > > concurrent
> > > > > > calls to
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * drm_gpuvm_bo_evict() with BOs with =
different
> > > > > > dma_resv.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > >=20
> > > > > This doesn't work. The RESV_PROTECTED case requires the
> > > > > evicted
> > > > > flag we discussed before. The list is either protected by the
> > > > > spinlock or the resv. Otherwise a list add could race with a
> > > > > list
> > > > > removal elsewhere.
> > >=20
> > > I think it does unless I miss something, but it might be a bit
> > > subtle
> > > though.
> > >=20
> > > Concurrent drm_gpuvm_bo_evict() are protected by the spinlock.
> > > Additionally, when
> > > drm_gpuvm_bo_evict() is called we hold the dma-resv of the
> > > corresponding GEM object.
> > >=20
> > > In drm_gpuvm_validate() I assert that we hold *all* dma-resv,
> > > which
> > > implies that no
> > > one can call drm_gpuvm_bo_evict() on any of the VM's objects and
> > > no
> > > one can add a new
> > > one and directly call drm_gpuvm_bo_evict() on it either.
> >=20
> > But translated into how the data (the list in this case) is
> > protected
> > it becomes
> >=20
> > "Either the spinlock and the bo resv of a single list item OR the
> > bo
> > resvs of all bos that can potentially be on the list",
> >=20
> > while this is certainly possible to assert, any new / future code
> > that
> > manipulates the evict list will probably get this wrong and as a
> > result
> > the code becomes pretty fragile. I think drm_gpuvm_bo_destroy()
> > already
> > gets it wrong in that it, while holding a single resv, doesn't take
> > the
> > spinlock.
>=20
> That's true and I don't like it either. Unfortunately, with the dma-
> resv
> locking scheme we can't really protect the evict list without the
> drm_gpuvm_bo::evicted trick properly.
>=20
> But as pointed out in my other reply, I'm a bit worried about the
> drm_gpuvm_bo::evicted trick being too restrictive, but maybe it's
> fine
> doing it in the RESV_PROTECTED case.

Ah, indeed. I misread that as discussing the current code rather than
the drm_gpuvm_bo::evicted trick. If validating only a subset, or a
range, then with the drm_gpuvm_bo::evicted trick would be valid only
for that subset.

But the current code would break because the condition of locking "the
resvs of all bos that can potentially be on the list" doesn't hold
anymore, and you'd get list corruption.

What *would* work, though, is the solution currently in xe, The
original evict list, and a staging evict list whose items are copied
over on validation. The staging evict list being protected by the
spinlock, the original evict list by the resv, and they'd use separate
list heads in the drm_gpuvm_bo, but that is yet another complication.

But I think if this becomes an issue, those VMs (perhaps OpenGL UMD
VMs) only wanting to validate a subset, would simply initially rely on
the current non-RESV solution. It looks like it's only a matter of
flipping the flag on a per-vm basis.

/Thomas


>=20
> >=20
> > So I think that needs fixing, and if keeping that protection I
> > think it
> > needs to be documented with the list member and ideally an assert.
> > But
> > also note that lockdep_assert_held will typically give false true
> > for
> > dma_resv locks; as long as the first dma_resv lock locked in a
> > drm_exec
> > sequence=C2=A0 remains locked, lockdep thinks *all* dma_resv locks are
> > held.
> > (or something along those lines), so the resv lockdep asserts are
> > currently pretty useless.
> >=20
> > /Thomas
> >=20
> >=20
> >=20
> > >=20
> > > > >=20
> > > > > Thanks,
> > > > >=20
> > > > > Thomas
> > > > >=20
> > > > >=20
> > > >=20
> > >=20
> >=20
>=20

