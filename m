Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5615185EEC0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 02:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F0310E7CD;
	Thu, 22 Feb 2024 01:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p9xfLe9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3A610E83F;
 Thu, 22 Feb 2024 01:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1708566373;
 bh=kVrGOOZuytddGaVDzynxhTBC+xSsBONQgK1rFjcI04M=;
 h=Date:From:To:Cc:Subject:From;
 b=p9xfLe9y7O7o0L6JZJQ5hAr2E99eXt+g6UpwFee0zcavelR1U27Ab9wUvsmaKKl59
 FbKmXLlvHNonmahWbvcR2/LaifvRYgXsytCBd8qIsVZVV6Y/yJM2VQFxhvhgxV8QHc
 Z3vFZxaS4uEADvVKzzjrE/S2Oi6IspQprrwbMFrTTQGSH8ek8HAkg5tiLKDw8xyMrg
 oW+RF6MIM2qtJ7M86ZCzfUdR8TFK5CUkLLTdfp51YRBsdm0cvQrCB2hQJnHSpONbtJ
 LDpWqIHzldxOk705KDX8LENUsQ3/n3DLqW9sxcNFKOZiRflsMFi/NW4vWxKqbIEibV
 Y7Ody1d1q0Tpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TgGFc1GpTz4wb2;
 Thu, 22 Feb 2024 12:46:11 +1100 (AEDT)
Date: Thu, 22 Feb 2024 12:46:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240222124610.383e1ce3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E=U/0=a4mO7C/s62y_fF+mJ";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/E=U/0=a4mO7C/s62y_fF+mJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:47:6: error: redefinition of '=
rzg2l_du_vsp_enable'
   47 | void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
      |      ^~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h:18,
                 from drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:30:
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:72:20: note: previous definiti=
on of 'rzg2l_du_vsp_enable' with type 'void(struct rzg2l_du_crtc *)'
   72 | static inline void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc) =
{ };
      |                    ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:61:6: error: redefinition of '=
rzg2l_du_vsp_disable'
   61 | void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
      |      ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:73:20: note: previous definiti=
on of 'rzg2l_du_vsp_disable' with type 'void(struct rzg2l_du_crtc *)'
   73 | static inline void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)=
 { };
      |                    ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:66:6: error: redefinition of '=
rzg2l_du_vsp_atomic_flush'
   66 | void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:74:20: note: previous definiti=
on of 'rzg2l_du_vsp_atomic_flush' with type 'void(struct rzg2l_du_crtc *)'
   74 | static inline void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *=
crtc) { };
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:76:19: error: redefinition of =
'rzg2l_du_vsp_get_drm_plane'
   76 | struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *=
crtc,
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:75:33: note: previous definiti=
on of 'rzg2l_du_vsp_get_drm_plane' with type 'struct drm_plane *(struct rzg=
2l_du_crtc *, unsigned int)'
   75 | static inline struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct r=
zg2l_du_crtc *crtc,
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:302:5: error: redefinition of =
'rzg2l_du_vsp_init'
  302 | int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node =
*np,
      |     ^~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:66:19: note: previous definiti=
on of 'rzg2l_du_vsp_init' with type 'int(struct rzg2l_du_vsp *, struct devi=
ce_node *, unsigned int)'
   66 | static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struc=
t device_node *np,
      |                   ^~~~~~~~~~~~~~~~~

Caused by commit

  768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")

I have used the drm-misc tree from next-20240221 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/E=U/0=a4mO7C/s62y_fF+mJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXWp2IACgkQAVBC80lX
0GxnZwf/arzy84++smzTe8LIY0swpYvN291/uBVHEhzoDCRQ+Nca/CjO6K5G9k5k
5ZUGFiePuEDX98lphTb9l/98ftUtXwSOzx93YGuvM9yDK0Fec6F3fhuYnbp8L0/a
iLbZbIs1l+0W+Xodk+uUyiI/fCFmD3lmZEa0e1La2i//5do/nGdB95lOm71HJPG7
24+Xx046XUBMqXX1TC7bE7D0qx0ZJgoMEj7vNWCf4a6SQ1gr4KcjxkoUFrZo18XK
goLTS8Ytg9jiIE3uCOkr+kMjbP9WrhcC1AqJVK6TbgzhpFN4zqyDkaorXFol2ha3
pwy/IyslkvihfNBmKIkqoDSwAPBk3A==
=28hk
-----END PGP SIGNATURE-----

--Sig_/E=U/0=a4mO7C/s62y_fF+mJ--
