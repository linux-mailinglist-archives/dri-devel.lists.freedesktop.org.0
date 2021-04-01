Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16006350C6E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 04:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDC86E07D;
	Thu,  1 Apr 2021 02:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451946E07D;
 Thu,  1 Apr 2021 02:13:52 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9mvJ6zshz9sVt;
 Thu,  1 Apr 2021 13:13:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1617243231;
 bh=DN2c7zg0o8Dw4cOnwZThU1cjsLPDtkhUjdXr14ceT8A=;
 h=Date:From:To:Cc:Subject:From;
 b=Kdz8/Hu1tGHDnb+crfrKLuuXUO/p0OsiD33YJAQHictxKtB6kw3BTmvanOLsTouW6
 3rZ+1HS9JPTHJYzDs2tkGnNE8YzvAGJ6ZcSp+H2LXEqGT4A4qQ/oFgEpq/88dCuSJU
 7nH8Q6Y7uf8AvpxzgAW59zJy+upp6zreSrXqvjcbKkZU7Lls5j7CkFM1MGEUHIyfMa
 q9p8iFUT1wmS9f5C9w4J7+oWLquKIAkO4mosyCGJi7PqtDlPTbb+r2osk3vp4CB9sp
 xFJXW1Yt5nxJNIcfk8TaFH+HnEA7zDnlnTfVK0k3fx6Gi1a/H5AmFaA8RpA5ns1t2f
 Y10m64O6hC07A==
Date: Thu, 1 Apr 2021 13:13:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, Dave Airlie
 <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20210401131346.0d522e75@canb.auug.org.au>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0177846073=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0177846073==
Content-Type: multipart/signed; boundary="Sig_/di/G_V1lKbpO20F+h0lKXEe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/di/G_V1lKbpO20F+h0lKXEe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_display.c

between commit:

  1b321026e213 ("drm/i915: Pass ww ctx to intel_pin_to_display_plane")

from the drm tree and commit:

  61169987c4d9 ("drm/i915: Unify the FB and plane state view information in=
to one struct")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/display/intel_display.c
index aa524eff20e1,bdb2adb4d748..000000000000
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@@ -1185,13 -1094,13 +1112,13 @@@ retry
  		 * mode that matches the user configuration.
  		 */
  		ret =3D i915_vma_pin_fence(vma);
- 		if (ret !=3D 0 && INTEL_GEN(dev_priv) < 4) {
+ 		if (ret !=3D 0 && DISPLAY_VER(dev_priv) < 4) {
  			i915_vma_unpin(vma);
 -			vma =3D ERR_PTR(ret);
 -			goto err;
 +			goto err_unpin;
  		}
 +		ret =3D 0;
 =20
 -		if (ret =3D=3D 0 && vma->fence)
 +		if (vma->fence)
  			*out_flags |=3D PLANE_HAS_FENCE;
  	}
 =20
@@@ -11363,12 -10508,20 +10536,12 @@@ int intel_plane_pin_fb(struct intel_p=
la
  	struct drm_i915_private *dev_priv =3D to_i915(plane->base.dev);
  	struct drm_framebuffer *fb =3D plane_state->hw.fb;
  	struct i915_vma *vma;
 +	bool phys_cursor =3D
 +		plane->id =3D=3D PLANE_CURSOR &&
 +		INTEL_INFO(dev_priv)->display.cursor_needs_physical;
 =20
 -	if (plane->id =3D=3D PLANE_CURSOR &&
 -	    INTEL_INFO(dev_priv)->display.cursor_needs_physical) {
 -		struct drm_i915_gem_object *obj =3D intel_fb_obj(fb);
 -		const int align =3D intel_cursor_alignment(dev_priv);
 -		int err;
 -
 -		err =3D i915_gem_object_attach_phys(obj, align);
 -		if (err)
 -			return err;
 -	}
 -
 -	vma =3D intel_pin_and_fence_fb_obj(fb,
 +	vma =3D intel_pin_and_fence_fb_obj(fb, phys_cursor,
- 					 &plane_state->view,
+ 					 &plane_state->view.gtt,
  					 intel_plane_uses_fence(plane_state),
  					 &plane_state->flags);
  	if (IS_ERR(vma))

--Sig_/di/G_V1lKbpO20F+h0lKXEe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBlLFoACgkQAVBC80lX
0GzJDQf/Zj2FxULHG8tLJnXTPDYUnx2GHpvyaZX+FJqoUX+NEAiGA/ezJg6+kg96
Fq2tsRU0iIMQPS5T5yO48zSQGFgZBII7Za4ldWpylthI51WY+Fd8kTsyrr8+qQbL
dDIljAzrpG/YpLxrf1GmUUKkvs1lYk/TBlKPy9jDijIv45zKZUoIcXjAG8whjCUw
X+SCxtVRhpVihgskd4hk96hgNnZsVMf3DH7sLhOhjZjStk2kU9S3JtUhd/ltphFy
8vqhKEBr8kkjldyxLhjK/sPlmz9TWJHAX7hNUDSmt0XWiFS2L8DKFkZLG8Fc4Sph
wKyJ6Wx1Vn7WXg+ANstDlSNc9nNhDg==
=S/li
-----END PGP SIGNATURE-----

--Sig_/di/G_V1lKbpO20F+h0lKXEe--

--===============0177846073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0177846073==--
