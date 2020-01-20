Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8291142367
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 07:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DCE6E59B;
	Mon, 20 Jan 2020 06:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6053C6E598;
 Mon, 20 Jan 2020 06:35:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jan 2020 22:35:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,340,1574150400"; 
 d="asc'?scan'208";a="226972871"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.14])
 by orsmga003.jf.intel.com with ESMTP; 19 Jan 2020 22:35:21 -0800
Date: Mon, 20 Jan 2020 14:23:30 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: [RFC PATCH 2/4] drm/i915/gvt: remove unused vblank_done completion
Message-ID: <20200120062330.GB14597@zhen-hp.sh.intel.com>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
 <20200109171357.115936-3-julian.stecklina@cyberus-technology.de>
MIME-Version: 1.0
In-Reply-To: <20200109171357.115936-3-julian.stecklina@cyberus-technology.de>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hang.yuan@intel.com, zhiyuan.lv@intel.com, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0339202945=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0339202945==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.01.09 19:13:55 +0200, Julian Stecklina wrote:
> This variable is used nowhere, so remove it.
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
>=20
> Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
> ---

Thanks for catching this.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/gvt.h   | 2 --
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 2 --
>  2 files changed, 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 2604739e5680..8cf292a8d6bd 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -203,8 +203,6 @@ struct intel_vgpu {
>  	struct mutex dmabuf_lock;
>  	struct idr object_idr;
> =20
> -	struct completion vblank_done;
> -
>  	u32 scan_nonprivbb;
>  };
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index d725a4fb94b9..9a435bc1a2f0 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1817,8 +1817,6 @@ static int kvmgt_guest_init(struct mdev_device *mde=
v)
>  	kvmgt_protect_table_init(info);
>  	gvt_cache_init(vgpu);
> =20
> -	init_completion(&vgpu->vblank_done);
> -
>  	info->track_node.track_write =3D kvmgt_page_track_write;
>  	info->track_node.track_flush_slot =3D kvmgt_page_track_flush_slot;
>  	kvm_page_track_register_notifier(kvm, &info->track_node);
> --=20
> 2.24.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXiVHYgAKCRCxBBozTXgY
J7O4AJ48ARBfZBHass37yOR8ijzI27ZMOACffEnlES5GbM0gcAfSIxey2K4EXZo=
=xnFl
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--

--===============0339202945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0339202945==--
