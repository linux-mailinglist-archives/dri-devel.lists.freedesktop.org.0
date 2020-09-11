Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B547A265900
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 07:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66ACE6E2DD;
	Fri, 11 Sep 2020 05:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915FC6E2D6;
 Fri, 11 Sep 2020 05:58:47 +0000 (UTC)
IronPort-SDR: nb9B+JAGwxyIdnwwq/hhG8ojwn95SwX9rHpiP8UgVe5rodBlShByllQbAy5eUKKOHDS+DXrcls
 fWhCRvVDjBKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="222899430"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
 d="asc'?scan'208";a="222899430"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 22:58:45 -0700
IronPort-SDR: Q402+VGaRmxhMWdHJGWqdRbUQWDkz5A9hlInK3bqLW8woPO4FQwk83QfYMDeXNGHJThOG9nxAI
 6UtL7nLTc5LA==
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
 d="asc'?scan'208";a="329643229"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 22:58:42 -0700
Date: Fri, 11 Sep 2020 13:39:23 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Alejandro Sior <aho@sior.be>
Subject: Re: [Intel-gfx][PATCH v2] drm/i915/gvt: Prevent NULL pointer
 dereference in intel_vgpu_reg_rw_edid()
Message-ID: <20200911053923.GS28614@zhen-hp.sh.intel.com>
References: <743818af-fa38-e31a-1780-84a6a7e72e25@web.de>
 <20200908181122.9100-1-aho@sior.be>
MIME-Version: 1.0
In-Reply-To: <20200908181122.9100-1-aho@sior.be>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1221702051=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1221702051==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8S1fMsFYqgBC+BN/"
Content-Disposition: inline


--8S1fMsFYqgBC+BN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.09.08 20:11:21 +0200, Alejandro Sior wrote:
> In the function intel_vgpu_reg_rw_edid of kvmgt.c, pos can be equal
> to NULL for GPUs that do not properly support EDID. In those cases, when
> pos gets passed to the handle_edid functions, it gets added a short offset
> then it's dereferenced in memcpy's, leading to NULL pointer
> dereference kernel oops.
>=20
> More concretely, that kernel oops renders some Broadwell GPUs users
> unable to set up virtual machines with virtual GPU passthrough (virtual
> machines hang indefinitely when trying to make use of the virtual GPU),
> and make them unable to remove the virtual GPUs once the kernel oops has
> happened (it hangs indefinitely, and notably too when the kernel tries to
> shutdown). The issues that this causes and steps to reproduce are
> discussed in more details in this github issue post:
> https://github.com/intel/gvt-linux/issues/170#issuecomment-685806160
>=20
> Check if pos is equal to NULL, and if it is, set ret to a negative
> value, making the module simply indicate that the access to EDID region
> has failed, without any fatal repercussion.
>=20
> Signed-off-by: Alejandro Sior <aho@sior.be>
>=20
> ---
> Changes in v2:
> - removed middle name of author to comply with git name
> - rephrased the patch description with imperative phrasing
> - removed useless paragraph
> - made a paragraph more concise
> - fixed typos
> - made individual lines shorter than 75 chars
>=20
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index ad8a9df49f29..49163363ba4a 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -557,7 +557,9 @@ static size_t intel_vgpu_reg_rw_edid(struct intel_vgp=
u *vgpu, char *buf,
>  		(struct vfio_edid_region *)kvmgt_vdev(vgpu)->region[i].data;
>  	loff_t pos =3D *ppos & VFIO_PCI_OFFSET_MASK;
> =20
> -	if (pos < region->vfio_edid_regs.edid_offset) {
> +	if (pos =3D=3D NULL) {
> +		ret =3D -EINVAL;
> +	} else if (pos < region->vfio_edid_regs.edid_offset) {
>  		ret =3D handle_edid_regs(vgpu, region, buf, count, pos, iswrite);
>  	} else {
>  		pos -=3D EDID_BLOB_OFFSET;

Thanks for reporting this! Sorry that we failed to do sanity validation on =
older
platform when enabling vfio edid function for all platform.

Could you try below one to see if it fixes your problem? Instead of refusing
possible read of edid, this fixes port number for BDW.

=46rom d5d9304b6bfdc31356fd2feb1ddbbf28073fe3d4 Mon Sep 17 00:00:00 2001
=46rom: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Fri, 11 Sep 2020 13:50:20 +0800
Subject: [PATCH] drm/i915/gvt: Fix port number for BDW on EDID region setup

Current BDW virtual display port is initialized as PORT_B, so need
to use same port for VFIO EDID region, otherwise invalid EDID blob
pointer is assigned.

Fixes: 0178f4ce3c3b ("drm/i915/gvt: Enable vfio edid for all GVT supported =
platform")
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/vgpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgp=
u.c
index 8fa9b31a2484..f6d7e33c7099 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -368,6 +368,7 @@ void intel_gvt_destroy_idle_vgpu(struct intel_vgpu *vgp=
u)
 static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 		struct intel_vgpu_creation_params *param)
 {
+	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
 	struct intel_vgpu *vgpu;
 	int ret;
=20
@@ -436,7 +437,10 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(stru=
ct intel_gvt *gvt,
 	if (ret)
 		goto out_clean_sched_policy;
=20
-	ret =3D intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
+	if (IS_BROADWELL(dev_priv))
+		ret =3D intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
+	else
+		ret =3D intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
 	if (ret)
 		goto out_clean_sched_policy;
=20
--=20
2.28.0



--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--8S1fMsFYqgBC+BN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX1sNiwAKCRCxBBozTXgY
J178AKCLWKo7RfqGXpQi9NqnMJIxrpwgcwCeIrbxnT+NeVSpEFsJHEnHt7VcFaQ=
=j8Om
-----END PGP SIGNATURE-----

--8S1fMsFYqgBC+BN/--

--===============1221702051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1221702051==--
