Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638EF31458F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 02:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4366E43C;
	Tue,  9 Feb 2021 01:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8266389DA7;
 Tue,  9 Feb 2021 01:23:46 +0000 (UTC)
IronPort-SDR: y0AbROcGA4lWJuinDmR12d18pW85/Y4l29SbLrH8MV8owYD1lhVJesOgkiQHawvPvVEMVKaxTv
 8xveFMbz7oEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="178300637"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; 
 d="asc'?scan'208";a="178300637"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 17:23:45 -0800
IronPort-SDR: y+jeXAsnNmZV6FvzVTPdNbgBq1SCupULaKJuXGMmiokZpuvDu8VVocQPqeiT6RBQ1tBYk2t0eg
 VQzWsvQWIXIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; 
 d="asc'?scan'208";a="398603670"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga007.jf.intel.com with ESMTP; 08 Feb 2021 17:23:42 -0800
Date: Tue, 9 Feb 2021 09:08:17 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yu Zhang <yu.c.zhang@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gvt/kvmgt: Fix the build failure in kvmgt.
Message-ID: <20210209010817.GC2043@zhen-hp.sh.intel.com>
References: <20210208185210.6002-1-yu.c.zhang@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20210208185210.6002-1-yu.c.zhang@linux.intel.com>
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Content-Type: multipart/mixed; boundary="===============0069828610=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0069828610==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline


--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.02.09 02:52:10 +0800, Yu Zhang wrote:
> Previously, commit 531810caa9f4 ("KVM: x86/mmu: Use
> an rwlock for the x86 MMU") replaced KVM's mmu_lock
> with type rwlock_t. This will cause a build failure
> in kvmgt, which uses the same lock when trying to add/
> remove some GFNs to/from the page tracker. Fix it with
> write_lock/unlocks in kvmgt.

Thanks for the fix! I saw Paolo has already carried one
in -next, so we are fine.

>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 60f1a386dd06..b4348256ae95 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1703,7 +1703,7 @@ static int kvmgt_page_track_add(unsigned long handl=
e, u64 gfn)
>  		return -EINVAL;
>  	}
> =20
> -	spin_lock(&kvm->mmu_lock);
> +	write_lock(&kvm->mmu_lock);
> =20
>  	if (kvmgt_gfn_is_write_protected(info, gfn))
>  		goto out;
> @@ -1712,7 +1712,7 @@ static int kvmgt_page_track_add(unsigned long handl=
e, u64 gfn)
>  	kvmgt_protect_table_add(info, gfn);
> =20
>  out:
> -	spin_unlock(&kvm->mmu_lock);
> +	write_unlock(&kvm->mmu_lock);
>  	srcu_read_unlock(&kvm->srcu, idx);
>  	return 0;
>  }
> @@ -1737,7 +1737,7 @@ static int kvmgt_page_track_remove(unsigned long ha=
ndle, u64 gfn)
>  		return -EINVAL;
>  	}
> =20
> -	spin_lock(&kvm->mmu_lock);
> +	write_lock(&kvm->mmu_lock);
> =20
>  	if (!kvmgt_gfn_is_write_protected(info, gfn))
>  		goto out;
> @@ -1746,7 +1746,7 @@ static int kvmgt_page_track_remove(unsigned long ha=
ndle, u64 gfn)
>  	kvmgt_protect_table_del(info, gfn);
> =20
>  out:
> -	spin_unlock(&kvm->mmu_lock);
> +	write_unlock(&kvm->mmu_lock);
>  	srcu_read_unlock(&kvm->srcu, idx);
>  	return 0;
>  }
> @@ -1772,7 +1772,7 @@ static void kvmgt_page_track_flush_slot(struct kvm =
*kvm,
>  	struct kvmgt_guest_info *info =3D container_of(node,
>  					struct kvmgt_guest_info, track_node);
> =20
> -	spin_lock(&kvm->mmu_lock);
> +	write_lock(&kvm->mmu_lock);
>  	for (i =3D 0; i < slot->npages; i++) {
>  		gfn =3D slot->base_gfn + i;
>  		if (kvmgt_gfn_is_write_protected(info, gfn)) {
> @@ -1781,7 +1781,7 @@ static void kvmgt_page_track_flush_slot(struct kvm =
*kvm,
>  			kvmgt_protect_table_del(info, gfn);
>  		}
>  	}
> -	spin_unlock(&kvm->mmu_lock);
> +	write_unlock(&kvm->mmu_lock);
>  }
> =20
>  static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
> --=20
> 2.17.1
>=20

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYCHggQAKCRCxBBozTXgY
J4FcAJsFxkXndfIuWXcRxMohV8DLfSmIbwCeNihYVZJrpZ/nzUK+LJJnAinbtbE=
=YD2h
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--

--===============0069828610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0069828610==--
