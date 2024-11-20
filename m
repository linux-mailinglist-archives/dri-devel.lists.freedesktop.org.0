Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250049D34F8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 09:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EDB10E3A6;
	Wed, 20 Nov 2024 08:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUrZHQyg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69DC10E04A;
 Wed, 20 Nov 2024 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732089867; x=1763625867;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rSXBoRYky2Zt3fv7ZJ4+urwWHLrE7062r2FEdBhblWA=;
 b=PUrZHQygqJ1x+WmaztQ88Cp+Ca+Kzftk9DeiyX38gIrD9Ltwm5B5p0sG
 i/Akb2XhXv5hkwtK/PccoiIQa0LtebH45B27nM5yei7Zk61PryVJU9/Hy
 L+1w68WujZqzLHclkOwAuY6DwFjxyt78wEUxPLkLIK529IFQAcR0l8H7E
 /p0gj+ha8tOxVG8scUJ2SSf1RMQHDJICihvscSVlFzYbey70nwkiEt8CA
 Ndq/ng9UVj+HYs+OfCOW8CphjiEqNCWa5f8BzQ7ggYzF7ZsSh4j+/dbOc
 7n2iKYaRp0LxS9dZ3+/KGts4/KgFEt8lsR+d8vzf5UExmPIaA7GtfcDtN g==;
X-CSE-ConnectionGUID: owdcpddcShWWISQQPvrTAQ==
X-CSE-MsgGUID: qXJS+BQTTEGkbDJQckL4VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="34987590"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="34987590"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 00:04:26 -0800
X-CSE-ConnectionGUID: LcOTUCb2R2KzCVoRnpfxgg==
X-CSE-MsgGUID: laJkZaXKRwS8SY9VNFkSqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="89777015"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.14])
 ([10.245.246.14])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 00:04:23 -0800
Message-ID: <240db5a176901eaa08a869c20415476c21c95ae7.camel@linux.intel.com>
Subject: Re: [PATCH v2 16/29] drm/xe: Add migrate layer functions for SVM
 support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Wed, 20 Nov 2024 09:04:20 +0100
In-Reply-To: <Zz0ab2pm5epu++Z3@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-17-matthew.brost@intel.com>
 <ffaf905b4c8b6c408e036ea69dd7cbb51735619b.camel@linux.intel.com>
 <Zz0ab2pm5epu++Z3@lstrano-desk.jf.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-11-19 at 15:08 -0800, Matthew Brost wrote:
> On Tue, Nov 19, 2024 at 05:45:27PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > > Add functions which migrate to / from VRAM accepting a single DPA
> > > argument (VRAM) and array of dma addresses (SRAM).
> > >=20
> > > v2:
> > > =C2=A0- Don't unlock job_mutex in error path of xe_migrate_vram
> > >=20
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 149
> > > ++++++++++++++++++++++++++++++++
> > > =C2=A0drivers/gpu/drm/xe/xe_migrate.h |=C2=A0 10 +++
> > > =C2=A02 files changed, 159 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > index cfd31ae49cc1..d7b6636286ae 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -1542,6 +1542,155 @@ void xe_migrate_wait(struct xe_migrate
> > > *m)
> > > =C2=A0		dma_fence_wait(m->fence, false);
> > > =C2=A0}
> > > =C2=A0
> > > +static u32 pte_update_cmd_size(u64 size)
> > > +{
> > > +	u32 dword;
> >=20
> > dwords or num_dword?
> >=20
>=20
> num_dword
>=20
> > > +	u64 entries =3D DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > +
> > > +	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
> > > +	/*
> > > +	 * MI_STORE_DATA_IMM command is used to update page
> > > table.
> > > Each
> > > +	 * instruction can update maximumly 0x1ff pte entries.
> > > To
> > > update
> > > +	 * n (n <=3D 0x1ff) pte entries, we need:
> > > +	 * 1 dword for the MI_STORE_DATA_IMM command header
> > > (opcode
> > > etc)
> > > +	 * 2 dword for the page table's physical location
> > > +	 * 2*n dword for value of pte to fill (each pte entry is
> > > 2
> > > dwords)
> > > +	 */
> > > +	dword =3D (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
> > > +	dword +=3D entries * 2;
> > > +
> > > +	return dword;
> > > +}
> > > +
> > > +static void build_pt_update_batch_sram(struct xe_migrate *m,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_bb *bb, u32
> > > pt_offset,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *sram_addr,
> > > u32
> > > size)
> > > +{
> > > +	u16 pat_index =3D tile_to_xe(m->tile)-
> > > >pat.idx[XE_CACHE_WB];
> > > +	u32 ptes;
> > > +	int i =3D 0;
> > > +
> > > +	ptes =3D DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > +	while (ptes) {
> > > +		u32 chunk =3D min(0x1ffU, ptes);
> > > +
> > > +		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > > MI_SDI_NUM_QW(chunk);
> > > +		bb->cs[bb->len++] =3D pt_offset;
> > > +		bb->cs[bb->len++] =3D 0;
> > > +
> > > +		pt_offset +=3D chunk * 8;
> > > +		ptes -=3D chunk;
> > > +
> > > +		while (chunk--) {
> > > +			u64 addr =3D sram_addr[i++] & PAGE_MASK;
> > > +
> > > +			xe_tile_assert(m->tile, addr);
> > > +			addr =3D m->q->vm->pt_ops-
> > > >pte_encode_addr(m-
> > > > tile->xe,
> > > +							=09
> > > addr, pat_index,
> > > +							=09
> > > 0,
> > > false, 0);
> > > +			bb->cs[bb->len++] =3D lower_32_bits(addr);
> > > +			bb->cs[bb->len++] =3D upper_32_bits(addr);
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +enum xe_migrate_copy_dir {
> > > +	XE_MIGRATE_COPY_TO_VRAM,
> > > +	XE_MIGRATE_COPY_TO_SRAM,
> > > +};
> > > +
> > > +static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> > > +					 unsigned long npages,
> > > +					 dma_addr_t *sram_addr,
> > > u64
> > > vram_addr,
> > > +					 const enum
> > > xe_migrate_copy_dir dir)
> > > +{
> > > +	struct xe_gt *gt =3D m->tile->primary_gt;
> > > +	struct xe_device *xe =3D gt_to_xe(gt);
> > > +	struct dma_fence *fence =3D NULL;
> > > +	u32 batch_size =3D 2;
> > > +	u64 src_L0_ofs, dst_L0_ofs;
> > > +	u64 round_update_size;
> > > +	struct xe_sched_job *job;
> > > +	struct xe_bb *bb;
> > > +	u32 update_idx, pt_slot =3D 0;
> > > +	int err;
> > > +
> > > +	round_update_size =3D min_t(u64, npages * PAGE_SIZE,
> > > +				=C2=A0 MAX_PREEMPTDISABLE_TRANSFER);
> >=20
> > Hm. How does the caller know how many pages were actually migrated?
> >=20
>=20
> This is an intermediate between migrate_vma_setup and
> migrate_vma_pages/finalize. The number of pages here is based on mpfn
> returned from migrate_vma_setup. The migration for individual pages
> may
> still be aborted in migrate_vma_pages/finalize. In this case both the
> old and new page have the same data, dso migrate_vma_pages/finalize
> can
> pick either page.

I might be misunderstanding, but I meant if npages is, for example,
which is 16MiB of data, but the above min_t reduces that to 8MiB of
data. How would the caller know?


/Thomas

