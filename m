Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F6388432
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 02:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647ED6ECC4;
	Wed, 19 May 2021 00:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985676ECB6;
 Wed, 19 May 2021 00:59:24 +0000 (UTC)
IronPort-SDR: zdpdcVncITMZ83RE+mdMiCvY+KGP5IACscnFMcf6zddiS4FSFEzCB0fcUX12zXXaGmZMYIOf21
 aO0ktaje+iVg==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="198907150"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
 d="asc'?scan'208";a="198907150"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 17:59:24 -0700
IronPort-SDR: ZFNJ9v34KyZjQJ7nCbHzT5pveXBRaduyRWjC7Ze6IW4PnyhTW0DGIz7gDmzXQw63WrjvY/ozdB
 CXgUXaIT8E5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
 d="asc'?scan'208";a="461017066"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 18 May 2021 17:59:21 -0700
Date: Wed, 19 May 2021 08:40:12 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/i915/gvt: remove local storage of debugfs file
Message-ID: <20210519004012.GF4589@zhen-hp.sh.intel.com>
References: <20210518161705.3697143-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="WRT3RXLOp/bBMgTI"
Content-Disposition: inline
In-Reply-To: <20210518161705.3697143-1-gregkh@linuxfoundation.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--WRT3RXLOp/bBMgTI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.05.18 18:17:05 +0200, Greg Kroah-Hartman wrote:
> There is no need to keep the dentry around for the debugfs kvmgt cache
> file, as we can just look it up when we want to remove it later on.
> Simplify the structure by removing the dentry and relying on debugfs
> to find the dentry to remove when we want to.
>=20
> By doing this change, we remove the last in-kernel user that was storing
> the result of debugfs_create_long(), so that api can be cleaned up.
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
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 65ff43cfc0f7..433c2a448f2d 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -88,6 +88,7 @@ struct kvmgt_pgfn {
>  	struct hlist_node hnode;
>  };
> =20
> +#define KVMGT_DEBUGFS_FILENAME "kvmgt_nr_cache_entries"
>  struct kvmgt_guest_info {
>  	struct kvm *kvm;
>  	struct intel_vgpu *vgpu;
> @@ -95,7 +96,6 @@ struct kvmgt_guest_info {
>  #define NR_BKT (1 << 18)
>  	struct hlist_head ptable[NR_BKT];
>  #undef NR_BKT
> -	struct dentry *debugfs_cache_entries;
>  };
> =20
>  struct gvt_dma {
> @@ -1843,16 +1843,15 @@ static int kvmgt_guest_init(struct mdev_device *m=
dev)
>  	info->track_node.track_flush_slot =3D kvmgt_page_track_flush_slot;
>  	kvm_page_track_register_notifier(kvm, &info->track_node);
> =20
> -	info->debugfs_cache_entries =3D debugfs_create_ulong(
> -						"kvmgt_nr_cache_entries",
> -						0444, vgpu->debugfs,
> -						&vdev->nr_cache_entries);
> +	debugfs_create_ulong(KVMGT_DEBUGFS_FILENAME, 0444, vgpu->debugfs,
> +			     &vdev->nr_cache_entries);
>  	return 0;
>  }
> =20
>  static bool kvmgt_guest_exit(struct kvmgt_guest_info *info)
>  {
> -	debugfs_remove(info->debugfs_cache_entries);
> +	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME,
> +				      info->vgpu->debugfs));
> =20
>  	kvm_page_track_unregister_notifier(info->kvm, &info->track_node);
>  	kvm_put_kvm(info->kvm);
> --=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

--WRT3RXLOp/bBMgTI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYKReZQAKCRCxBBozTXgY
JwTEAKCDGxm/Bg4Px7VakIDfjEMhT+c5+QCfRp0gD/H6l4GaSyK+9Khgoa1vDk8=
=1eoh
-----END PGP SIGNATURE-----

--WRT3RXLOp/bBMgTI--
