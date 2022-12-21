Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2E7652BAA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 04:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054DF10E422;
	Wed, 21 Dec 2022 03:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A867A10E027;
 Wed, 21 Dec 2022 03:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671591660; x=1703127660;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=ngIptXVnxZMIe4OUDAY5u4LE/bWGVw3oiibRWxIuKl4=;
 b=n18zwGiLowolA8DGOyPXeA1oWgFCtRqecwolloDAZhx53wMA1e+KgiTQ
 r3VQHs9k4vFkT5ziVBCByUtY2hkxI+1qkKaWkd2c43Rk4KTV0BVojSB9a
 8efNP81X9Tmg3yB7Ec0zuhRVAIm5kFAFApr51/2i61o6DsoNLbyk9qXv4
 cZALisoPgrL2ejcyfhKMQptNG5RZrrixEoU6Pru0BchYGGnaTQ0viaVR1
 r6ozM+U1Z6u+IRX+QxxZJxkoRwKNGva0vXaUZixc2VhEAganUzrI0xXjT
 HDrKWAxYMcOMv9llV/rDHFymeQRgo5CXtS7oBbMijUqCQGYE6AFW+ofxT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="317407628"
X-IronPort-AV: E=Sophos;i="5.96,261,1665471600"; 
 d="asc'?scan'208";a="317407628"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 19:01:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="758359486"
X-IronPort-AV: E=Sophos;i="5.96,261,1665471600"; 
 d="asc'?scan'208";a="758359486"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2022 19:00:56 -0800
Date: Wed, 21 Dec 2022 10:58:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zheng Wang <zyytlz.wz@163.com>
Subject: Re: [PATCH v5] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
Message-ID: <20221221025857.GG30028@zhen-hp.sh.intel.com>
References: <11728bc1-7b59-1623-b517-d1a0d57eb275@intel.com>
 <20221220094014.1128207-1-zyytlz.wz@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="iRaAnoDFBoP0sW/E"
Content-Disposition: inline
In-Reply-To: <20221220094014.1128207-1-zyytlz.wz@163.com>
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


--iRaAnoDFBoP0sW/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.12.20 17:40:14 +0800, Zheng Wang wrote:
> If intel_gvt_dma_map_guest_page failed, it will call
>  ppgtt_invalidate_spt, which will finally free the spt. But the
>  caller function ppgtt_populate_spt_by_guest_entry does not notice
>  that, it will free spt again in its error path.

indent

>=20
> Fix this by undoing the mapping of DMA address and freeing sub_spt.
> Besides, leave the handle of spt destroy to caller function instead of
> callee function when error occurs.
>=20
> Fixes: b901b252b6cf ("drm/i915/gvt: Add 2M huge gtt support")
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> ---
> v5:
> - remove unnecessary switch-case code for there is only one particular ca=
se,
> correct the unmap target from parent_spt to sub_spt.add more details in
> commit message. All suggested by Zhenyu
>=20
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
>  drivers/gpu/drm/i915/gvt/gtt.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index 51e5e8fb505b..4d478a59eb7d 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
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
>  		sub_se.val64 =3D se->val64;
> =20
>  		/* Copy the PAT field from PDE. */
> @@ -1231,6 +1229,18 @@ static int split_2MB_gtt_entry(struct intel_vgpu *=
vgpu,
>  	ops->set_pfn(se, sub_spt->shadow_page.mfn);
>  	ppgtt_set_shadow_entry(spt, se, index);
>  	return 0;
> +err:
> +	/* Undone the existing mappings of DMA addr. */

We need a verb here for Undo.

> +	for_each_present_shadow_entry(sub_spt, &sub_se, sub_index) {
> +		gvt_vdbg_mm("invalidate 4K entry\n");
> +		ppgtt_invalidate_pte(sub_spt, &sub_se);
> +	}
> +	/* Release the new allocated spt. */
> +	trace_spt_change(sub_spt->vgpu->id, "release", sub_spt,
> +		sub_spt->guest_page.gfn, sub_spt->shadow_page.type);
> +	ppgtt_free_spt(sub_spt);
> +	sub_spt =3D NULL;

Not need to reset local variable that has no use then.

I'll handle these trivial fixes during the merge.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

thanks

> +	return ret;
>  }
> =20
>  static int split_64KB_gtt_entry(struct intel_vgpu *vgpu,
> --=20
> 2.25.1
>=20

--iRaAnoDFBoP0sW/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY6J2bAAKCRCxBBozTXgY
J4GiAJsFOKAdtGPzsQN3CVsAcH45M9QuNQCdE4KWAAIn09n29aAGm2FukS+JhgE=
=xGqD
-----END PGP SIGNATURE-----

--iRaAnoDFBoP0sW/E--
