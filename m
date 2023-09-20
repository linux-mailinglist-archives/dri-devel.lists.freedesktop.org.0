Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF5D7A6FFF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 03:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8D110E2BE;
	Wed, 20 Sep 2023 01:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF10610E2BE
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 01:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1695172332;
 bh=naroMBErSn2t3KbKYiTgYiGNYwV6PHYlOn96MGhMVbU=;
 h=Date:From:To:Cc:Subject:From;
 b=eQhvCkGQy6/Zb2WjeJo7Q0LxmIDUIvRrFY3Vv9TAIwmeq0MYlPuzrgfJffsVYAToE
 mU8tGlAN/uCQhcdWBDbg2hh8080qBybcRGIu9srJg8Mu/29jGnl9Qpv9iNKd34GgQF
 fbssHai6RLXbVsIb8eypLsQM2l1UQCheHX6a/wCcaWcTUbi2memdDNPwSWFV+7zI37
 WAE3/gULCeuT2Pa5MBg6Orm61rPdfFo88ZLx8MukYpErYU+AqoojpCdAAVGE2zgY0a
 qXyRAZy7d4G+cnreP6M4soU9Yoa4ZSZ9Z9X6AblzWHOwg1PWzQydRTDh7S9cvuEoXZ
 kggzWQdIXTxag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rr0qw0Fyhz4xGM;
 Wed, 20 Sep 2023 11:12:11 +1000 (AEST)
Date: Wed, 20 Sep 2023 11:12:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20230920111210.505e5daa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o52gEQ/sgnm94h5t6ow.E0z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/o52gEQ/sgnm94h5t6ow.E0z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/nouveau/nouveau_connector.c

between commit:

  1b254b791d7b ("drm/nouveau/disp: fix use-after-free in error handling of =
nouveau_connector_create")

from Linus' tree and commit:

  8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm inf=
o")

from the drm-misc tree.

I fixed it up (I think, see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/nouveau/nouveau_connector.c
index 79ea30aac31f,94498c15b50e..000000000000
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@@ -1295,70 -1303,76 +1303,75 @@@ nouveau_connector_create(struct drm_dev
  	nv_connector->index =3D index;
  	INIT_WORK(&nv_connector->irq_work, nouveau_dp_irq);
 =20
- 	/* attempt to parse vbios connector type and hotplug gpio */
- 	nv_connector->dcb =3D olddcb_conn(dev, index);
- 	if (nv_connector->dcb) {
- 		u32 entry =3D ROM16(nv_connector->dcb[0]);
- 		if (olddcb_conntab(dev)[3] >=3D 4)
- 			entry |=3D (u32)ROM16(nv_connector->dcb[2]) << 16;
-=20
- 		nv_connector->type =3D nv_connector->dcb[0];
- 		if (drm_conntype_from_dcb(nv_connector->type) =3D=3D
- 					  DRM_MODE_CONNECTOR_Unknown) {
- 			NV_WARN(drm, "unknown connector type %02x\n",
- 				nv_connector->type);
- 			nv_connector->type =3D DCB_CONNECTOR_NONE;
+ 	if (disp->disp.conn_mask & BIT(nv_connector->index)) {
+ 		ret =3D nvif_conn_ctor(&disp->disp, nv_connector->base.name, nv_connect=
or->index,
+ 				     &nv_connector->conn);
+ 		if (ret) {
 -			kfree(nv_connector);
 -			return ERR_PTR(ret);
++			goto drm_conn_err;
  		}
 =20
- 		/* Gigabyte NX85T */
- 		if (nv_match_device(dev, 0x0421, 0x1458, 0x344c)) {
- 			if (nv_connector->type =3D=3D DCB_CONNECTOR_HDMI_1)
- 				nv_connector->type =3D DCB_CONNECTOR_DVI_I;
+ 		switch (nv_connector->conn.info.type) {
+ 		case NVIF_CONN_VGA      : type =3D DCB_CONNECTOR_VGA; break;
+ 		case NVIF_CONN_DVI_I    : type =3D DCB_CONNECTOR_DVI_I; break;
+ 		case NVIF_CONN_DVI_D    : type =3D DCB_CONNECTOR_DVI_D; break;
+ 		case NVIF_CONN_LVDS     : type =3D DCB_CONNECTOR_LVDS; break;
+ 		case NVIF_CONN_LVDS_SPWG: type =3D DCB_CONNECTOR_LVDS_SPWG; break;
+ 		case NVIF_CONN_DP       : type =3D DCB_CONNECTOR_DP; break;
+ 		case NVIF_CONN_EDP      : type =3D DCB_CONNECTOR_eDP; break;
+ 		case NVIF_CONN_HDMI     : type =3D DCB_CONNECTOR_HDMI_0; break;
+ 		default:
+ 			WARN_ON(1);
+ 			return NULL;
  		}
 =20
- 		/* Gigabyte GV-NX86T512H */
- 		if (nv_match_device(dev, 0x0402, 0x1458, 0x3455)) {
- 			if (nv_connector->type =3D=3D DCB_CONNECTOR_HDMI_1)
- 				nv_connector->type =3D DCB_CONNECTOR_DVI_I;
- 		}
+ 		nv_connector->type =3D type;
  	} else {
- 		nv_connector->type =3D DCB_CONNECTOR_NONE;
- 	}
+ 		u8 *dcb =3D olddcb_conn(dev, nv_connector->index);
 =20
- 	/* no vbios data, or an unknown dcb connector type - attempt to
- 	 * figure out something suitable ourselves
- 	 */
- 	if (nv_connector->type =3D=3D DCB_CONNECTOR_NONE) {
- 		struct nouveau_drm *drm =3D nouveau_drm(dev);
- 		struct dcb_table *dcbt =3D &drm->vbios.dcb;
- 		u32 encoders =3D 0;
- 		int i;
+ 		if (dcb)
+ 			nv_connector->type =3D dcb[0];
+ 		else
+ 			nv_connector->type =3D DCB_CONNECTOR_NONE;
 =20
- 		for (i =3D 0; i < dcbt->entries; i++) {
- 			if (dcbt->entry[i].connector =3D=3D nv_connector->index)
- 				encoders |=3D (1 << dcbt->entry[i].type);
+ 		/* attempt to parse vbios connector type and hotplug gpio */
+ 		if (nv_connector->type !=3D DCB_CONNECTOR_NONE) {
+ 			if (drm_conntype_from_dcb(nv_connector->type) =3D=3D
+ 						  DRM_MODE_CONNECTOR_Unknown) {
+ 				NV_WARN(drm, "unknown connector type %02x\n",
+ 					nv_connector->type);
+ 				nv_connector->type =3D DCB_CONNECTOR_NONE;
+ 			}
  		}
 =20
- 		if (encoders & (1 << DCB_OUTPUT_DP)) {
- 			if (encoders & (1 << DCB_OUTPUT_TMDS))
- 				nv_connector->type =3D DCB_CONNECTOR_DP;
- 			else
- 				nv_connector->type =3D DCB_CONNECTOR_eDP;
- 		} else
- 		if (encoders & (1 << DCB_OUTPUT_TMDS)) {
- 			if (encoders & (1 << DCB_OUTPUT_ANALOG))
- 				nv_connector->type =3D DCB_CONNECTOR_DVI_I;
- 			else
- 				nv_connector->type =3D DCB_CONNECTOR_DVI_D;
- 		} else
- 		if (encoders & (1 << DCB_OUTPUT_ANALOG)) {
- 			nv_connector->type =3D DCB_CONNECTOR_VGA;
- 		} else
- 		if (encoders & (1 << DCB_OUTPUT_LVDS)) {
- 			nv_connector->type =3D DCB_CONNECTOR_LVDS;
- 		} else
- 		if (encoders & (1 << DCB_OUTPUT_TV)) {
- 			nv_connector->type =3D DCB_CONNECTOR_TV_0;
+ 		/* no vbios data, or an unknown dcb connector type - attempt to
+ 		 * figure out something suitable ourselves
+ 		 */
+ 		if (nv_connector->type =3D=3D DCB_CONNECTOR_NONE &&
+ 		    !WARN_ON(drm->client.device.info.family >=3D NV_DEVICE_INFO_V0_TESL=
A)) {
+ 			struct dcb_table *dcbt =3D &drm->vbios.dcb;
+ 			u32 encoders =3D 0;
+ 			int i;
+=20
+ 			for (i =3D 0; i < dcbt->entries; i++) {
+ 				if (dcbt->entry[i].connector =3D=3D nv_connector->index)
+ 					encoders |=3D (1 << dcbt->entry[i].type);
+ 			}
+=20
+ 			if (encoders & (1 << DCB_OUTPUT_TMDS)) {
+ 				if (encoders & (1 << DCB_OUTPUT_ANALOG))
+ 					nv_connector->type =3D DCB_CONNECTOR_DVI_I;
+ 				else
+ 					nv_connector->type =3D DCB_CONNECTOR_DVI_D;
+ 			} else
+ 			if (encoders & (1 << DCB_OUTPUT_ANALOG)) {
+ 				nv_connector->type =3D DCB_CONNECTOR_VGA;
+ 			} else
+ 			if (encoders & (1 << DCB_OUTPUT_LVDS)) {
+ 				nv_connector->type =3D DCB_CONNECTOR_LVDS;
+ 			} else
+ 			if (encoders & (1 << DCB_OUTPUT_TV)) {
+ 				nv_connector->type =3D DCB_CONNECTOR_TV_0;
+ 			}
  		}
  	}
 =20
@@@ -1367,11 -1387,10 +1386,9 @@@
  		ret =3D nouveau_bios_parse_lvds_table(dev, 0, &dummy, &dummy);
  		if (ret) {
  			NV_ERROR(drm, "Error parsing LVDS table, disabling\n");
--			kfree(nv_connector);
--			return ERR_PTR(ret);
++			goto drm_conn_err;
  		}
 =20
- 		funcs =3D &nouveau_connector_funcs_lvds;
  		break;
  	case DRM_MODE_CONNECTOR_DisplayPort:
  	case DRM_MODE_CONNECTOR_eDP:

--Sig_/o52gEQ/sgnm94h5t6ow.E0z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUKRusACgkQAVBC80lX
0Gz/Jwf9EpFciQytMrB9EGPZlDQNNqcVzmXmhOf9lPP86jVE4c9drE/m/V3hI+HJ
+1rtkzxoagrKym44GM5O+lE0ojheWp0hDejTFjAqeBkMGoj/WAzxW7bb8gAjDXkd
NNUZcT1EmM9EfbBgH8fvBX2158atvl+82mOAlBpoT1jnEMnR3gQjer+rJN5leVlq
TEQl8CB0fkGjqaqTEt/AHh4Wv8/jM5CTrsTUqM3ZBz+ffD/zPYiEFA49PxQX8WHb
cllEMe1zIJsR2I//LPTFnmuvRIwC1Ws02STVlb5Sy1LTvbCDEJX1+TpGnuq+Hxl+
6oZ4vG+hqHnZCyxHLW8mlLVlJAdw8Q==
=BmcH
-----END PGP SIGNATURE-----

--Sig_/o52gEQ/sgnm94h5t6ow.E0z--
