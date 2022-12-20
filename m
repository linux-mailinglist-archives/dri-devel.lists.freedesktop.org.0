Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6E0651C4F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 09:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBD510E06B;
	Tue, 20 Dec 2022 08:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB84C10E06B;
 Tue, 20 Dec 2022 08:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671524697; x=1703060697;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=3Saonc4e64Y8dqAWVhyrq0LeRdHBKmGol/AJz6kvzNY=;
 b=gcpfe8IFTGL+YdqrSXgcpCWdk40WNHhN7u6zLPjGzK7XMIIX9aS4w8E7
 GwyeFfgfISzee55irzWegnxP64DO2ypqJ0cs2zgeKxXepvRzwygsMHlwH
 62C30eSWEyAcGIewkvE0rdovKPJz7nADy13ZbavkW+9sl8rNvXwdsjYUy
 lwHBkgrQ7njjpvxNPvxXD0aAmHANaQAW5G8uD/jaaaaTlD/KSPqdF0sos
 BMFP+ItKpWOVRfeFLifeMamTpma8b8vkkbwiI96dAtw9nQ5RDPImRCWuV
 Q0jZInWBNM4tYdJz0Sr9FUEz7dYHupsC9kyY82gJ9eL2KjYV0ZgMNCnne g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="405809674"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; 
 d="asc'?scan'208";a="405809674"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 00:24:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="683329366"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; 
 d="asc'?scan'208";a="683329366"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga001.jf.intel.com with ESMTP; 20 Dec 2022 00:24:52 -0800
Date: Tue, 20 Dec 2022 16:22:55 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zheng Wang <zyytlz.wz@163.com>
Subject: Re: [RESEND PATCH v4] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
Message-ID: <20221220082255.GE30028@zhen-hp.sh.intel.com>
References: <11728bc1-7b59-1623-b517-d1a0d57eb275@intel.com>
 <20221219125204.1001149-1-zyytlz.wz@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="c7rykKtsZvepKFKR"
Content-Disposition: inline
In-Reply-To: <20221219125204.1001149-1-zyytlz.wz@163.com>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: alex000young@gmail.com, security@kernel.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 hackerzheng666@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 1002992920@qq.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--c7rykKtsZvepKFKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.12.19 20:52:04 +0800, Zheng Wang wrote:
> If intel_gvt_dma_map_guest_page failed, it will call
>  ppgtt_invalidate_spt, which will finally free the spt. But the caller do=
es
>  not notice that, it will free spt again in error path.
>

It's not clear from this description which caller is actually wrong,
better to clarify the problem in ppgtt_populate_spt_by_guest_entry() functi=
on.

> Fix this by undoing the mapping of DMA address and freeing sub_spt.
>=20
> Fixes: b901b252b6cf ("drm/i915/gvt: Add 2M huge gtt support")
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> ---
> v4:
> - fix by undo the mapping of DMA address and free sub_spt suggested by Zhi
>=20
> v3:
> - correct spelling mistake and remove unused variable suggested by Greg
>=20
> v2: https://lore.kernel.org/all/20221006165845.1735393-1-zyytlz.wz@163.co=
m/
>=20
> v1: https://lore.kernel.org/all/20220928033340.1063949-1-zyytlz.wz@163.co=
m/
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 53 +++++++++++++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index 51e5e8fb505b..b472e021e5a4 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -1192,11 +1192,11 @@ static int split_2MB_gtt_entry(struct intel_vgpu =
*vgpu,
>  {
>  	const struct intel_gvt_gtt_pte_ops *ops =3D vgpu->gvt->gtt.pte_ops;
>  	struct intel_vgpu_ppgtt_spt *sub_spt;
> -	struct intel_gvt_gtt_entry sub_se;
> +	struct intel_gvt_gtt_entry sub_se, e;
>  	unsigned long start_gfn;
>  	dma_addr_t dma_addr;
> -	unsigned long sub_index;
> -	int ret;
> +	unsigned long sub_index, parent_index;
> +	int ret, ret1;
> =20
>  	gvt_dbg_mm("Split 2M gtt entry, index %lu\n", index);
> =20
> @@ -1209,10 +1209,8 @@ static int split_2MB_gtt_entry(struct intel_vgpu *=
vgpu,
>  	for_each_shadow_entry(sub_spt, &sub_se, sub_index) {
>  		ret =3D intel_gvt_dma_map_guest_page(vgpu, start_gfn + sub_index,
>  						   PAGE_SIZE, &dma_addr);
> -		if (ret) {
> -			ppgtt_invalidate_spt(spt);
> -			return ret;
> -		}
> +		if (ret)
> +			goto err;

I think it's fine to remove this and leave to upper caller, but again please
describe the behavior change in commit message as well, e.g to fix the sani=
ty
of spt destroy that leaving previous invalidate and free of spt to caller f=
unction
instead of within callee function.

>  		sub_se.val64 =3D se->val64;
> =20
>  		/* Copy the PAT field from PDE. */
> @@ -1231,6 +1229,47 @@ static int split_2MB_gtt_entry(struct intel_vgpu *=
vgpu,
>  	ops->set_pfn(se, sub_spt->shadow_page.mfn);
>  	ppgtt_set_shadow_entry(spt, se, index);
>  	return 0;
> +err:
> +	/* Undone the existing mappings of DMA addr. */
> +	for_each_present_shadow_entry(spt, &e, parent_index) {

sub_spt? We're undoing what's mapped for sub_spt right?

> +		switch (e.type) {
> +		case GTT_TYPE_PPGTT_PTE_4K_ENTRY:
> +			gvt_vdbg_mm("invalidate 4K entry\n");
> +			ppgtt_invalidate_pte(spt, &e);
> +			break;
> +		case GTT_TYPE_PPGTT_PTE_64K_ENTRY:
> +			/* We don't setup 64K shadow entry so far. */
> +			WARN(1, "suspicious 64K gtt entry\n");
> +			continue;
> +		case GTT_TYPE_PPGTT_PTE_2M_ENTRY:
> +			gvt_vdbg_mm("invalidate 2M entry\n");
> +			continue;
> +		case GTT_TYPE_PPGTT_PTE_1G_ENTRY:
> +			WARN(1, "GVT doesn't support 1GB page\n");
> +			continue;
> +		case GTT_TYPE_PPGTT_PML4_ENTRY:
> +		case GTT_TYPE_PPGTT_PDP_ENTRY:
> +		case GTT_TYPE_PPGTT_PDE_ENTRY:

I don't think this all entry type makes sense, as here we just split
2M entry for multiple 4K PTE entry.

> +			gvt_vdbg_mm("invalidate PMUL4/PDP/PDE entry\n");
> +			ret1 =3D ppgtt_invalidate_spt_by_shadow_entry(
> +					spt->vgpu, &e);
> +			if (ret1) {
> +				gvt_vgpu_err("fail: shadow page %p shadow entry 0x%llx type %d\n",
> +				spt, e.val64, e.type);
> +				goto free_spt;
> +			}

for above reason, I don't think this is valid.

> +			break;
> +		default:
> +			GEM_BUG_ON(1);
> +		}
> +	}
> +	/* Release the new alloced apt. */
> +free_spt:
> +	trace_spt_change(sub_spt->vgpu->id, "release", sub_spt,
> +		sub_spt->guest_page.gfn, sub_spt->shadow_page.type);
> +	ppgtt_free_spt(sub_spt);
> +	sub_spt =3D NULL;
> +	return ret;
>  }
> =20
>  static int split_64KB_gtt_entry(struct intel_vgpu *vgpu,
> --=20
> 2.25.1
>=20

--c7rykKtsZvepKFKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY6Fw2gAKCRCxBBozTXgY
J/tiAJ0chKIsYFFlZBTo+ayrE7mCyhznbwCgjL5xMyVtruGCC953PHVeafhZWoY=
=8NeT
-----END PGP SIGNATURE-----

--c7rykKtsZvepKFKR--
