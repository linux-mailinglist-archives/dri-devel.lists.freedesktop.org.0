Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA16F47ABC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22918891EF;
	Mon, 17 Jun 2019 07:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DDA891F9;
 Mon, 17 Jun 2019 07:23:40 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 00:23:40 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga008.jf.intel.com with ESMTP; 17 Jun 2019 00:23:37 -0700
Date: Mon, 17 Jun 2019 15:21:37 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] i915: gvt: no need to check return value of
 debugfs_create functions
Message-ID: <20190617072137.GA9684@zhen-hp.sh.intel.com>
References: <20190613133419.GB6634@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20190613133419.GB6634@kroah.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============0631307933=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0631307933==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I8PrZ52jkgMwZ8Ef"
Content-Disposition: inline


--I8PrZ52jkgMwZ8Ef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.13 15:34:19 +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.

Looks fine to me. We'd follow this idiom.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>=20
> Because there is no need to check these functions, a number of local
> functions can be made to return void to simplify things as nothing can
> fail.
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpu/drm/i915/gvt/debugfs.c | 47 ++++++------------------------
>  drivers/gpu/drm/i915/gvt/gvt.c     |  4 +--
>  drivers/gpu/drm/i915/gvt/gvt.h     |  4 +--
>  drivers/gpu/drm/i915/gvt/kvmgt.c   |  3 --
>  drivers/gpu/drm/i915/gvt/vgpu.c    |  4 +--
>  5 files changed, 13 insertions(+), 49 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gv=
t/debugfs.c
> index 8a9606f91e68..fdd9058ab8f2 100644
> --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> @@ -189,36 +189,19 @@ DEFINE_SIMPLE_ATTRIBUTE(vgpu_scan_nonprivbb_fops,
>  /**
>   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
>   * @vgpu: a vGPU
> - *
> - * Returns:
> - * Zero on success, negative error code if failed.
>   */
> -int intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
> +void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
>  {
> -	struct dentry *ent;
>  	char name[16] =3D "";
> =20
>  	snprintf(name, 16, "vgpu%d", vgpu->id);
>  	vgpu->debugfs =3D debugfs_create_dir(name, vgpu->gvt->debugfs_root);
> -	if (!vgpu->debugfs)
> -		return -ENOMEM;
> -
> -	ent =3D debugfs_create_bool("active", 0444, vgpu->debugfs,
> -				  &vgpu->active);
> -	if (!ent)
> -		return -ENOMEM;
> -
> -	ent =3D debugfs_create_file("mmio_diff", 0444, vgpu->debugfs,
> -				  vgpu, &vgpu_mmio_diff_fops);
> -	if (!ent)
> -		return -ENOMEM;
> =20
> -	ent =3D debugfs_create_file("scan_nonprivbb", 0644, vgpu->debugfs,
> -				 vgpu, &vgpu_scan_nonprivbb_fops);
> -	if (!ent)
> -		return -ENOMEM;
> -
> -	return 0;
> +	debugfs_create_bool("active", 0444, vgpu->debugfs, &vgpu->active);
> +	debugfs_create_file("mmio_diff", 0444, vgpu->debugfs, vgpu,
> +			    &vgpu_mmio_diff_fops);
> +	debugfs_create_file("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
> +			    &vgpu_scan_nonprivbb_fops);
>  }
> =20
>  /**
> @@ -234,27 +217,15 @@ void intel_gvt_debugfs_remove_vgpu(struct intel_vgp=
u *vgpu)
>  /**
>   * intel_gvt_debugfs_init - register gvt debugfs root entry
>   * @gvt: GVT device
> - *
> - * Returns:
> - * zero on success, negative if failed.
>   */
> -int intel_gvt_debugfs_init(struct intel_gvt *gvt)
> +void intel_gvt_debugfs_init(struct intel_gvt *gvt)
>  {
>  	struct drm_minor *minor =3D gvt->dev_priv->drm.primary;
> -	struct dentry *ent;
> =20
>  	gvt->debugfs_root =3D debugfs_create_dir("gvt", minor->debugfs_root);
> -	if (!gvt->debugfs_root) {
> -		gvt_err("Cannot create debugfs dir\n");
> -		return -ENOMEM;
> -	}
> =20
> -	ent =3D debugfs_create_ulong("num_tracked_mmio", 0444, gvt->debugfs_roo=
t,
> -				   &gvt->mmio.num_tracked_mmio);
> -	if (!ent)
> -		return -ENOMEM;
> -
> -	return 0;
> +	debugfs_create_ulong("num_tracked_mmio", 0444, gvt->debugfs_root,
> +			     &gvt->mmio.num_tracked_mmio);
>  }
> =20
>  /**
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gv=
t.c
> index 43f4242062dd..8f37eefa0a02 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.c
> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> @@ -375,9 +375,7 @@ int intel_gvt_init_device(struct drm_i915_private *de=
v_priv)
>  	}
>  	gvt->idle_vgpu =3D vgpu;
> =20
> -	ret =3D intel_gvt_debugfs_init(gvt);
> -	if (ret)
> -		gvt_err("debugfs registration failed, go on.\n");
> +	intel_gvt_debugfs_init(gvt);
> =20
>  	gvt_dbg_core("gvt device initialization is done\n");
>  	dev_priv->gvt =3D gvt;
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index f5a328b5290a..b73c7e63b2d5 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -682,9 +682,9 @@ static inline void intel_gvt_mmio_set_in_ctx(
>  	gvt->mmio.mmio_attribute[offset >> 2] |=3D F_IN_CTX;
>  }
> =20
> -int intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu);
> +void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu);
>  void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
> -int intel_gvt_debugfs_init(struct intel_gvt *gvt);
> +void intel_gvt_debugfs_init(struct intel_gvt *gvt);
>  void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
> =20
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index a68addf95c23..3c26fb28a2d1 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1798,9 +1798,6 @@ static int kvmgt_guest_init(struct mdev_device *mde=
v)
>  						"kvmgt_nr_cache_entries",
>  						0444, vgpu->debugfs,
>  						&vgpu->vdev.nr_cache_entries);
> -	if (!info->debugfs_cache_entries)
> -		gvt_vgpu_err("Cannot create kvmgt debugfs entry\n");
> -
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index 44ce3c2b9ac1..d5a6e4e3d0fd 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -420,9 +420,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(str=
uct intel_gvt *gvt,
>  	if (ret)
>  		goto out_clean_submission;
> =20
> -	ret =3D intel_gvt_debugfs_add_vgpu(vgpu);
> -	if (ret)
> -		goto out_clean_sched_policy;
> +	intel_gvt_debugfs_add_vgpu(vgpu);
> =20
>  	ret =3D intel_gvt_hypervisor_set_opregion(vgpu);
>  	if (ret)
> --=20
> 2.22.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--I8PrZ52jkgMwZ8Ef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXQc/gQAKCRCxBBozTXgY
J45sAJ9UT9JlKO8X7fshut6D0+sO3rtGDwCgi8/J5dlNW33XxlnZnTPldLqPEIg=
=mrig
-----END PGP SIGNATURE-----

--I8PrZ52jkgMwZ8Ef--

--===============0631307933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0631307933==--
