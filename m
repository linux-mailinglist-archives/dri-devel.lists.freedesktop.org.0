Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203DB7B8394
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 17:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC07610E0CC;
	Wed,  4 Oct 2023 15:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A5510E0CC;
 Wed,  4 Oct 2023 15:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696433392; x=1727969392;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NY9HB0zQGmhyY1YFpVA1//jEG21hilDIDTgq1LDfXtY=;
 b=D4XkU8W5sPUfLfIvB8RDwHGH5vgSPAhoMijxPLA1ZnOLVFM6tRnFf3NU
 1pRG998LzhPV2brdC7DEWoSoh/Bv8vAJ078fH9kT3Gc0gQWO8Hc7xm8V5
 eMewgpJu6C92Wwr/uiAtYC0F2qxiiNBrRd1xOs2VEf9MDIGa0lBqucm4G
 zOqUkT0C9ysjWuRnOKDu4cJ3X000pqJmvyRLN2F/OR2nZrxUfxqdCUs2P
 A1EyGd+2FDWAe38i3lM5FMsIfFWhQlftt/b7cDuhU3jS7b/3+Y9y3Nu7Z
 RHC9WC3Q6oILugss9N5O3EYjO2pIqS/jg7ybG2/D1kIFZAqEEh3dw/9WB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="449693839"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="449693839"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 08:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751348760"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="751348760"
Received: from binsumax-mobl.gar.corp.intel.com (HELO [10.249.254.31])
 ([10.249.254.31])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 08:29:22 -0700
Message-ID: <36233651a7675ab894134e41fc711fdcc71eefec.camel@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v5 4/6] drm/gpuvm: track/lock/validate
 external/evicted objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch, 
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith@gfxstrand.net
Date: Wed, 04 Oct 2023 17:29:20 +0200
In-Reply-To: <6489f31f-8929-3e59-fbef-a22049cccbe3@redhat.com>
References: <20230928191624.13703-1-dakr@redhat.com>
 <20230928191624.13703-5-dakr@redhat.com>
 <e4e68970-c7c9-55e2-9483-01252f38c956@linux.intel.com>
 <6b16ab6f-b1a2-efdb-04bf-5af4c3de381b@linux.intel.com>
 <6489f31f-8929-3e59-fbef-a22049cccbe3@redhat.com>
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


On Wed, 2023-10-04 at 14:57 +0200, Danilo Krummrich wrote:
> On 10/3/23 11:11, Thomas Hellstr=C3=B6m wrote:
>=20
> <snip>
>=20
> > > > +
> > > > +/**
> > > > + * drm_gpuvm_bo_evict() - add / remove a &drm_gpuvm_bo to /
> > > > from the &drm_gpuvms
> > > > + * evicted list
> > > > + * @vm_bo: the &drm_gpuvm_bo to add or remove
> > > > + * @evict: indicates whether the object is evicted
> > > > + *
> > > > + * Adds a &drm_gpuvm_bo to or removes it from the &drm_gpuvms
> > > > evicted list.
> > > > + */
> > > > +void
> > > > +drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 struct drm_gem_object *obj =3D vm_bo->obj;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 dma_resv_assert_held(obj->resv);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /* Always lock list transactions, even if
> > > > DRM_GPUVM_RESV_PROTECTED is
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * set. This is required to protect multip=
le concurrent
> > > > calls to
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * drm_gpuvm_bo_evict() with BOs with diff=
erent dma_resv.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > >=20
> > > This doesn't work. The RESV_PROTECTED case requires the evicted
> > > flag we discussed before. The list is either protected by the
> > > spinlock or the resv. Otherwise a list add could race with a list
> > > removal elsewhere.
>=20
> I think it does unless I miss something, but it might be a bit subtle
> though.
>=20
> Concurrent drm_gpuvm_bo_evict() are protected by the spinlock.
> Additionally, when
> drm_gpuvm_bo_evict() is called we hold the dma-resv of the
> corresponding GEM object.
>=20
> In drm_gpuvm_validate() I assert that we hold *all* dma-resv, which
> implies that no
> one can call drm_gpuvm_bo_evict() on any of the VM's objects and no
> one can add a new
> one and directly call drm_gpuvm_bo_evict() on it either.

But translated into how the data (the list in this case) is protected
it becomes

"Either the spinlock and the bo resv of a single list item OR the bo
resvs of all bos that can potentially be on the list",

while this is certainly possible to assert, any new / future code that
manipulates the evict list will probably get this wrong and as a result
the code becomes pretty fragile. I think drm_gpuvm_bo_destroy() already
gets it wrong in that it, while holding a single resv, doesn't take the
spinlock.

So I think that needs fixing, and if keeping that protection I think it
needs to be documented with the list member and ideally an assert. But
also note that lockdep_assert_held will typically give false true for
dma_resv locks; as long as the first dma_resv lock locked in a drm_exec
sequence  remains locked, lockdep thinks *all* dma_resv locks are held.
(or something along those lines), so the resv lockdep asserts are
currently pretty useless.=20

/Thomas



>=20
> > >=20
> > > Thanks,
> > >=20
> > > Thomas
> > >=20
> > >=20
> >=20
>=20

