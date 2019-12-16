Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080C011FC45
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 01:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337936E185;
	Mon, 16 Dec 2019 00:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6DD6E185;
 Mon, 16 Dec 2019 00:46:16 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47bjJ55jptz9sPT;
 Mon, 16 Dec 2019 11:46:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1576457174;
 bh=UxPIgZrYv0zF0/z/QGfijrsRDlv9g3XeuR8qlLwB+dY=;
 h=Date:From:To:Cc:Subject:From;
 b=X2uSaKKPAv12JWHQBdP8IbB79Nk0UEUBrQpUGun5bWj9fWwXh2MbqSULOle52Cr2o
 AnJKsZFr1okzVOkrYOQiUqhjJ607l+Upia6/2i5IYceZWbQ/eolGCxJAET3Z3VcblH
 DEI9uRHHYVHrQok0vFLaEnJC19vH69c92SWQJQPZGCT0FwuofEizufULmpJ/tuY/+k
 dmZIiBIv+ODdwz8wT1zBIQqyCFReBCVTgYbYJiaq6LgXA6u52G0bYEIFJP/A/qMooa
 cHVpSPXjg8zpYzijzvqG0UsqO4Gviiln13hfLLYcr4JzE4J1FBVu7Vnx6QC+PR/p1n
 RYnrBWUkPSCcA==
Date: Mon, 16 Dec 2019 11:46:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20191216114612.75915893@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0847928854=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0847928854==
Content-Type: multipart/signed; boundary="Sig_/_4VJCAk4GWF7pJuyxlBPMP=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_4VJCAk4GWF7pJuyxlBPMP=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/drm_dp_mst_topology.c

between commit:

  14692a3637d4 ("drm/dp_mst: Add probe_lock")
  3f9b3f02dda5 ("drm/dp_mst: Protect drm_dp_mst_port members with locking")
  6f85f73821f6 ("drm/dp_mst: Add basic topology reprobing when resuming")

from Linus' tree and commits:

  f79489074c59 ("drm/dp_mst: Clear all payload id tables downstream when in=
itializing")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/drm_dp_mst_topology.c
index 273dd80fabf3,1770754bcd4a..000000000000
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@@ -74,8 -61,13 +74,13 @@@ static int drm_dp_send_dpcd_write(struc
  				  struct drm_dp_mst_port *port,
  				  int offset, int size, u8 *bytes);
 =20
 -static void drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 -				     struct drm_dp_mst_branch *mstb);
 +static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 +				    struct drm_dp_mst_branch *mstb);
+=20
+ static void
+ drm_dp_send_clear_payload_id_table(struct drm_dp_mst_topology_mgr *mgr,
+ 				   struct drm_dp_mst_branch *mstb);
+=20
  static int drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr=
 *mgr,
  					   struct drm_dp_mst_branch *mstb,
  					   struct drm_dp_mst_port *port);
@@@ -2515,15 -2179,15 +2533,19 @@@ static int drm_dp_check_and_send_link_a
 =20
  static void drm_dp_mst_link_probe_work(struct work_struct *work)
  {
 -	struct drm_dp_mst_topology_mgr *mgr =3D container_of(work, struct drm_dp=
_mst_topology_mgr, work);
 +	struct drm_dp_mst_topology_mgr *mgr =3D
 +		container_of(work, struct drm_dp_mst_topology_mgr, work);
 +	struct drm_device *dev =3D mgr->dev;
  	struct drm_dp_mst_branch *mstb;
  	int ret;
+ 	bool clear_payload_id_table;
 =20
 +	mutex_lock(&mgr->probe_lock);
 +
  	mutex_lock(&mgr->lock);
+ 	clear_payload_id_table =3D !mgr->payload_id_table_cleared;
+ 	mgr->payload_id_table_cleared =3D true;
+=20
  	mstb =3D mgr->mst_primary;
  	if (mstb) {
  		ret =3D drm_dp_mst_topology_try_get_mstb(mstb);
@@@ -2531,17 -2195,24 +2553,30 @@@
  			mstb =3D NULL;
  	}
  	mutex_unlock(&mgr->lock);
 -	if (!mstb)
 +	if (!mstb) {
 +		mutex_unlock(&mgr->probe_lock);
  		return;
 +	}
 =20
+ 	/*
+ 	 * Certain branch devices seem to incorrectly report an available_pbn
+ 	 * of 0 on downstream sinks, even after clearing the
+ 	 * DP_PAYLOAD_ALLOCATE_* registers in
+ 	 * drm_dp_mst_topology_mgr_set_mst(). Namely, the CableMatters USB-C
+ 	 * 2x DP hub. Sending a CLEAR_PAYLOAD_ID_TABLE message seems to make
+ 	 * things work again.
+ 	 */
+ 	if (clear_payload_id_table) {
+ 		DRM_DEBUG_KMS("Clearing payload ID table\n");
+ 		drm_dp_send_clear_payload_id_table(mgr, mstb);
+ 	}
+=20
 -	drm_dp_check_and_send_link_address(mgr, mstb);
 +	ret =3D drm_dp_check_and_send_link_address(mgr, mstb);
  	drm_dp_mst_topology_put_mstb(mstb);
 +
 +	mutex_unlock(&mgr->probe_lock);
 +	if (ret)
 +		drm_kms_helper_hotplug_event(dev);
  }
 =20
  static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
@@@ -2856,9 -2503,30 +2891,31 @@@ out
  	if (ret <=3D 0)
  		mstb->link_address_sent =3D false;
  	kfree(txmsg);
 +	return ret < 0 ? ret : changed;
  }
 =20
+ void drm_dp_send_clear_payload_id_table(struct drm_dp_mst_topology_mgr *m=
gr,
+ 					struct drm_dp_mst_branch *mstb)
+ {
+ 	struct drm_dp_sideband_msg_tx *txmsg;
+ 	int len, ret;
+=20
+ 	txmsg =3D kzalloc(sizeof(*txmsg), GFP_KERNEL);
+ 	if (!txmsg)
+ 		return;
+=20
+ 	txmsg->dst =3D mstb;
+ 	len =3D build_clear_payload_id_table(txmsg);
+=20
+ 	drm_dp_queue_down_tx(mgr, txmsg);
+=20
+ 	ret =3D drm_dp_mst_wait_tx_reply(mstb, txmsg);
+ 	if (ret > 0 && txmsg->reply.reply_type =3D=3D DP_SIDEBAND_REPLY_NAK)
+ 		DRM_DEBUG_KMS("clear payload table id nak received\n");
+=20
+ 	kfree(txmsg);
+ }
+=20
  static int
  drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
  				struct drm_dp_mst_branch *mstb,

--Sig_/_4VJCAk4GWF7pJuyxlBPMP=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3209QACgkQAVBC80lX
0GzZNQgAixkc+XQyJmgiP+Nw1do/xLVRHGfScFbR2Wvcy5YVnxcelFSauIQ8Bqv1
nQtlRZr7csYVye7HhwANXKY7QdCgf4lpRwff7YvOWA5QJn6zI00rvQClUXcRfXBT
NnT+Pzxabrh0MgLXwFsVyQAc/Uwrknzb8vSaE7jcwM5T7keFB7I/7OkyGReLlbsM
v1yuPdFLndQnP3OYCzeT728PcsZI8B8toJ8atS5XobjR1kKZ2cvUe0YaSUYrlOyR
nZFMNSje4varA/CGpJSN2sbhr2Qt7Im3FDOppR+7wY2yQUBVnKpH9MPjjG/P6nQJ
quzjLIlSWUnGNUZJjPebUcdc4LLkiQ==
=2UdF
-----END PGP SIGNATURE-----

--Sig_/_4VJCAk4GWF7pJuyxlBPMP=--

--===============0847928854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0847928854==--
