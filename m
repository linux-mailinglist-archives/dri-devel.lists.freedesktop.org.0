Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAA665F7E6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 00:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779B510E05B;
	Thu,  5 Jan 2023 23:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F176310E05B;
 Thu,  5 Jan 2023 23:50:49 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Np3BX0dFyz4xyp;
 Fri,  6 Jan 2023 10:50:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1672962645;
 bh=gBdBSj5Iy4byy5P3B7qjh7Q4ryrNCeA8npWOwiFvaL0=;
 h=Date:From:To:Cc:Subject:From;
 b=MNBjSVtvnV1NkMBbtX5EF1PA0V363PEJGPOXNW+uUM8ciQsZumNnB+iGIjVugpWnV
 0WktG4s/WjW85fj8W2QB47l08IWqLNm2ZzVN1CvRZVKMNiK3OorjzPzkx5nYYn+pvG
 DL3tqC+uuG7TVeDFDnzhN4KDYNExI4u+r+OntTCiqnZp3YiS13raK7Lem+LqLM2mRx
 LszvPVcE1Oz2f0gcuRMvNeAPz7TbzkdF7owEFVYnnpMHWXzin26Yi8NPgBHBSebqwk
 AbvrAoz1AsqGi9P7pPlWWAYAoo9WQ2RIHUZ7Gd2Sr/jIwlNYgRN9HXNsst+IF4Mxs2
 5aF6tiXT/Mrsw==
Date: Fri, 6 Jan 2023 10:50:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20230106105042.6d7ccb97@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QAyr59Alq2_HP3mLSseczH.";
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shuah Khan <skhan@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/QAyr59Alq2_HP3mLSseczH.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/tests/drm_format_helper_test.c

between commit:

  a52a5451f43b ("kunit: Use KUNIT_EXPECT_MEMEQ macro")

from Linus' tree and commits:

  f21d62c9ce3d ("drm/format-helper: Store RGB565 in little-endian order")
  175073d694cd ("drm/format-helper: Add conversion from XRGB8888 to ARGB888=
8")
  56119bfb3914 ("drm/format-helper: Add conversion from XRGB8888 to ARGB210=
1010")
  10cd592e639e ("drm/format-helper: Add conversion from XRGB8888 to 15-bit =
RGB555 formats")

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

diff --cc drivers/gpu/drm/tests/drm_format_helper_test.c
index 567c71f95edc,f71dc0fe08a1..000000000000
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@@ -375,12 -560,108 +560,108 @@@ static void drm_test_fb_xrgb8888_to_rgb
  	iosys_map_set_vaddr(&src, xrgb8888);
 =20
  	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->=
clip, false);
+ 	buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / siz=
eof(__le16));
 -	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 =20
+ 	buf =3D dst.vaddr; /* restore original value of buf */
  	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->=
clip, true);
+ 	buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / siz=
eof(__le16));
 -	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected_swab, dst_size), 0);
 +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected_swab, dst_size);
  }
 =20
+ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
+ {
+ 	const struct convert_xrgb8888_case *params =3D test->param_value;
+ 	const struct convert_to_xrgb1555_result *result =3D &params->xrgb1555_re=
sult;
+ 	size_t dst_size;
+ 	u16 *buf =3D NULL;
+ 	__le32 *xrgb8888 =3D NULL;
+ 	struct iosys_map dst, src;
+=20
+ 	struct drm_framebuffer fb =3D {
+ 		.format =3D drm_format_info(DRM_FORMAT_XRGB8888),
+ 		.pitches =3D { params->pitch, 0, 0 },
+ 	};
+=20
+ 	dst_size =3D conversion_buf_size(DRM_FORMAT_XRGB1555, result->dst_pitch,
+ 				       &params->clip);
+ 	KUNIT_ASSERT_GT(test, dst_size, 0);
+=20
+ 	buf =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+ 	iosys_map_set_vaddr(&dst, buf);
+=20
+ 	xrgb8888 =3D cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+ 	iosys_map_set_vaddr(&src, xrgb8888);
+=20
+ 	drm_fb_xrgb8888_to_xrgb1555(&dst, &result->dst_pitch, &src, &fb, &params=
->clip);
+ 	buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / siz=
eof(__le16));
 -	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
++	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+ }
+=20
+ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
+ {
+ 	const struct convert_xrgb8888_case *params =3D test->param_value;
+ 	const struct convert_to_argb1555_result *result =3D &params->argb1555_re=
sult;
+ 	size_t dst_size;
+ 	u16 *buf =3D NULL;
+ 	__le32 *xrgb8888 =3D NULL;
+ 	struct iosys_map dst, src;
+=20
+ 	struct drm_framebuffer fb =3D {
+ 		.format =3D drm_format_info(DRM_FORMAT_XRGB8888),
+ 		.pitches =3D { params->pitch, 0, 0 },
+ 	};
+=20
+ 	dst_size =3D conversion_buf_size(DRM_FORMAT_ARGB1555, result->dst_pitch,
+ 				       &params->clip);
+ 	KUNIT_ASSERT_GT(test, dst_size, 0);
+=20
+ 	buf =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+ 	iosys_map_set_vaddr(&dst, buf);
+=20
+ 	xrgb8888 =3D cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+ 	iosys_map_set_vaddr(&src, xrgb8888);
+=20
+ 	drm_fb_xrgb8888_to_argb1555(&dst, &result->dst_pitch, &src, &fb, &params=
->clip);
+ 	buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / siz=
eof(__le16));
 -	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
++	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+ }
+=20
+ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
+ {
+ 	const struct convert_xrgb8888_case *params =3D test->param_value;
+ 	const struct convert_to_rgba5551_result *result =3D &params->rgba5551_re=
sult;
+ 	size_t dst_size;
+ 	u16 *buf =3D NULL;
+ 	__le32 *xrgb8888 =3D NULL;
+ 	struct iosys_map dst, src;
+=20
+ 	struct drm_framebuffer fb =3D {
+ 		.format =3D drm_format_info(DRM_FORMAT_XRGB8888),
+ 		.pitches =3D { params->pitch, 0, 0 },
+ 	};
+=20
+ 	dst_size =3D conversion_buf_size(DRM_FORMAT_RGBA5551, result->dst_pitch,
+ 				       &params->clip);
+ 	KUNIT_ASSERT_GT(test, dst_size, 0);
+=20
+ 	buf =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+ 	iosys_map_set_vaddr(&dst, buf);
+=20
+ 	xrgb8888 =3D cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+ 	iosys_map_set_vaddr(&src, xrgb8888);
+=20
+ 	drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params=
->clip);
+ 	buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / siz=
eof(__le16));
 -	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
++	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+ }
+=20
  static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
  {
  	const struct convert_xrgb8888_case *params =3D test->param_value;
@@@ -407,10 -688,45 +688,45 @@@
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
  	iosys_map_set_vaddr(&src, xrgb8888);
 =20
+ 	/*
+ 	 * RGB888 expected results are already in little-endian
+ 	 * order, so there's no need to convert the test output.
+ 	 */
  	drm_fb_xrgb8888_to_rgb888(&dst, &result->dst_pitch, &src, &fb, &params->=
clip);
 -	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
  }
 =20
+ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
+ {
+ 	const struct convert_xrgb8888_case *params =3D test->param_value;
+ 	const struct convert_to_argb8888_result *result =3D &params->argb8888_re=
sult;
+ 	size_t dst_size;
+ 	u32 *buf =3D NULL;
+ 	__le32 *xrgb8888 =3D NULL;
+ 	struct iosys_map dst, src;
+=20
+ 	struct drm_framebuffer fb =3D {
+ 		.format =3D drm_format_info(DRM_FORMAT_XRGB8888),
+ 		.pitches =3D { params->pitch, 0, 0 },
+ 	};
+=20
+ 	dst_size =3D conversion_buf_size(DRM_FORMAT_ARGB8888,
+ 				       result->dst_pitch, &params->clip);
+ 	KUNIT_ASSERT_GT(test, dst_size, 0);
+=20
+ 	buf =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+ 	iosys_map_set_vaddr(&dst, buf);
+=20
+ 	xrgb8888 =3D cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+ 	iosys_map_set_vaddr(&src, xrgb8888);
+=20
+ 	drm_fb_xrgb8888_to_argb8888(&dst, &result->dst_pitch, &src, &fb, &params=
->clip);
+ 	buf =3D le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / siz=
eof(u32));
 -	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
++	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+ }
+=20
  static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
  {
  	const struct convert_xrgb8888_case *params =3D test->param_value;
@@@ -438,8 -754,39 +754,39 @@@
  	iosys_map_set_vaddr(&src, xrgb8888);
 =20
  	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &par=
ams->clip);
- 	buf =3D le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
+ 	buf =3D le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / siz=
eof(u32));
 -	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
++	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+ }
+=20
+ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
+ {
+ 	const struct convert_xrgb8888_case *params =3D test->param_value;
+ 	const struct convert_to_argb2101010_result *result =3D &params->argb2101=
010_result;
+ 	size_t dst_size;
+ 	u32 *buf =3D NULL;
+ 	__le32 *xrgb8888 =3D NULL;
+ 	struct iosys_map dst, src;
+=20
+ 	struct drm_framebuffer fb =3D {
+ 		.format =3D drm_format_info(DRM_FORMAT_XRGB8888),
+ 		.pitches =3D { params->pitch, 0, 0 },
+ 	};
+=20
+ 	dst_size =3D conversion_buf_size(DRM_FORMAT_ARGB2101010,
+ 				       result->dst_pitch, &params->clip);
+ 	KUNIT_ASSERT_GT(test, dst_size, 0);
+=20
+ 	buf =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+ 	iosys_map_set_vaddr(&dst, buf);
+=20
+ 	xrgb8888 =3D cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+ 	iosys_map_set_vaddr(&src, xrgb8888);
+=20
+ 	drm_fb_xrgb8888_to_argb2101010(&dst, &result->dst_pitch, &src, &fb, &par=
ams->clip);
+ 	buf =3D le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / siz=
eof(u32));
 -	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
  }
 =20
  static struct kunit_case drm_format_helper_test_cases[] =3D {

--Sig_/QAyr59Alq2_HP3mLSseczH.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmO3YlIACgkQAVBC80lX
0GwVgwf/Ze6gESdVkvgyFPq02EkSHntBrugZJkS+l24mxqMYW564sK0sDBlWKW7B
nfn7F0apo+ZmlGbfHY38kGBmpkvGqQKs4ptpCbwfA2KrbL4UtUIfG0k1groCqlse
IL32B1P3F3+uoYISCUxN28UXK6O9RjvtPJ5DbajSMrrB4Dm79U1drU5+zFtPhvXP
hZ1XKmaPaf8V0Uu0Dkfpjmc7Vo7lKHHj24ivi1Cw7mxGjUMtLVGOoI3Lrm1txbwV
Ng68PSjBV++1qkGDsbkROPsbVxL2fhN+JjqEAQvNMmg/FNxt9jumUM/2WBMKjTea
ztmLpKuBaAi8Hc/MFvJDjt/sXEqPUA==
=pF8E
-----END PGP SIGNATURE-----

--Sig_/QAyr59Alq2_HP3mLSseczH.--
