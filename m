Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047C0225893
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9FC6E1B9;
	Mon, 20 Jul 2020 07:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CC46E2ED
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 14:55:45 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id o1so6703361plk.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 07:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=JhozfdhLXF25sgeLwG3I43yp2GQj9yDJ2yrtleTdVEk=;
 b=qR+fm0jDr7Q79FiBIK32p+0uQczt6CFCDc0YuA4Ot9zL1qZCYOwFuka32Mei1u4It4
 dWMV5S9jE5RQCPWUKTphT6o5mJrF/GWS0OoRA5ATqE3zAPLbEaHWiRe+98UdA8ua8kK3
 BEQO7YOSvmHW6pjjvAkPrCtbPqrSQFDoxuJmnO39mZQ4/YjvRgsfs0pWnmLVN3fwLKUZ
 Ynrp5+zM5SQFjJkxIubp0n3zU8V0X0ZX11mrHbu3jv8jNLiDzEsl1BeNXjhChguoD2dz
 BWwTaNwtPvDDeGuA1EX+1xfRtvgynDamZ6Q+zb9UVjhGVGs0M+8i8V9SEsKO6GUF9lZI
 AWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=JhozfdhLXF25sgeLwG3I43yp2GQj9yDJ2yrtleTdVEk=;
 b=liAnOV90HqXjse3WEy/4i27203ilGZIJOJHKBrba5BPoCH15CExmBWEBrKb/9zpKHx
 376ruWoW1Tto/9AgESRvT+4WDPAhbbNRhgY0hnoTL6U7IURUw4e7gtMXA5tCdkLo3ciQ
 LfngOAk6aitoYnbrbStgVxPmCFv9VSnAmCdcWdgIt2gioGp71eqcmakNlPlP8FmVE0Zu
 zVH/zWWij9vWI8AN2Eit00wVOtlgRXxms4iSzvpehaGegS0OEQcKxTJmsFZxhjLb7aR4
 pRprNXGcQ5KMf9neHCbT7ohgmu15OFFWh6JhgXCYiX/4J5bvq2Ir1LQH/KX59TgB5U3Z
 pMDw==
X-Gm-Message-State: AOAM5310wIlUtTWruMWfqASbV45lEesjp02MEImg4d0xXanhZqROI4ag
 QaZAHa59gjfHFeD9msHHNns=
X-Google-Smtp-Source: ABdhPJzkd2EFzbibEEM0x0ynDv7/gmyd/pVHHYKFaQORhEFoq2cdXqwb5UCTIjJ72BYFnlQp2f/9uw==
X-Received: by 2002:a17:90b:1292:: with SMTP id
 fw18mr14611981pjb.3.1595084145483; 
 Sat, 18 Jul 2020 07:55:45 -0700 (PDT)
Received: from blackclown ([103.88.82.25])
 by smtp.gmail.com with ESMTPSA id e195sm10817993pfh.218.2020.07.18.07.55.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 18 Jul 2020 07:55:44 -0700 (PDT)
Date: Sat, 18 Jul 2020 20:25:31 +0530
From: Suraj Upadhyay <usuraj35@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org
Subject: [PATCH] drm: core: Convert device logging to drm_* functions.
Message-ID: <20200718145531.GA21897@blackclown>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1523476972=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1523476972==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Convert device logging with dev_* functions into drm_* functions.

The patch has been generated with the coccinelle script below.
The script focuses on instances of dev_* functions where the drm device
context is clearly visible in its arguments.

@@expression E1; expression list E2; @@
-dev_warn(E1->dev, E2)
+drm_warn(E1, E2)

@@expression E1; expression list E2; @@
-dev_info(E1->dev, E2)
+drm_info(E1, E2)

@@expression E1; expression list E2; @@
-dev_err(E1->dev, E2)
+drm_err(E1, E2)

@@expression E1; expression list E2; @@
-dev_info_once(E1->dev, E2)
+drm_info_once(E1, E2)

@@expression E1; expression list E2; @@
-dev_notice_once(E1->dev, E2)
+drm_notice_once(E1, E2)

@@expression E1; expression list E2; @@
-dev_warn_once(E1->dev, E2)
+drm_warn_once(E1, E2)

@@expression E1; expression list E2; @@
-dev_err_once(E1->dev, E2)
+drm_err_once(E1, E2)

@@expression E1; expression list E2; @@
-dev_err_ratelimited(E1->dev, E2)
+drm_err_ratelimited(E1, E2)

@@expression E1; expression list E2; @@
-dev_dbg(E1->dev, E2)
+drm_dbg_(E1, E2)

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/gpu/drm/drm_edid.c           | 6 ++----
 drivers/gpu/drm/drm_gem_cma_helper.c | 4 ++--
 drivers/gpu/drm/drm_mipi_dbi.c       | 7 +++----
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 52b357e75c3d..6840f0530a38 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1844,9 +1844,7 @@ static void connector_bad_edid(struct drm_connector *=
connector,
 	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
 		return;
=20
-	dev_warn(connector->dev->dev,
-		 "%s: EDID is invalid:\n",
-		 connector->name);
+	drm_warn(connector->dev, "%s: EDID is invalid:\n", connector->name);
 	for (i =3D 0; i < num_blocks; i++) {
 		u8 *block =3D edid + i * EDID_LENGTH;
 		char prefix[20];
@@ -5298,7 +5296,7 @@ int drm_add_edid_modes(struct drm_connector *connecto=
r, struct edid *edid)
 	}
 	if (!drm_edid_is_valid(edid)) {
 		clear_eld(connector);
-		dev_warn(connector->dev->dev, "%s: EDID invalid.\n",
+		drm_warn(connector->dev, "%s: EDID invalid.\n",
 			 connector->name);
 		return 0;
 	}
diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem=
_cma_helper.c
index 06a5b9ee1fe0..8d7408a78aee 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -105,8 +105,8 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct dr=
m_device *drm,
 	cma_obj->vaddr =3D dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
 				      GFP_KERNEL | __GFP_NOWARN);
 	if (!cma_obj->vaddr) {
-		dev_dbg(drm->dev, "failed to allocate buffer with size %zu\n",
-			size);
+		drm_dbg_(drm, "failed to allocate buffer with size %zu\n",
+			 size);
 		ret =3D -ENOMEM;
 		goto error;
 	}
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 0e55d8716e3d..a7a611894243 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -225,9 +225,8 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer=
 *fb,
 		drm_fb_xrgb8888_to_rgb565(dst, src, fb, clip, swap);
 		break;
 	default:
-		dev_err_once(fb->dev->dev, "Format is not supported: %s\n",
-			     drm_get_format_name(fb->format->format,
-						 &format_name));
+		drm_err_once(fb->dev, "Format is not supported: %s\n",
+			     drm_get_format_name(fb->format->format, &format_name));
 		return -EINVAL;
 	}
=20
@@ -295,7 +294,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *f=
b, struct drm_rect *rect)
 				   width * height * 2);
 err_msg:
 	if (ret)
-		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
+		drm_err_once(fb->dev, "Failed to update display %d\n", ret);
=20
 	drm_dev_exit(idx);
 }
--=20
2.17.1


--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8TDWIACgkQ+gRsbIfe
745pWA/9ExbZ9agqMiLhzz6+X1u+RaqPP5sE+RuqMvyRSAloo92oKni6+CGwTwL9
RsITIeOi4io0gHFOY/1ZkFIxF+PhBJsmwx75+mGHxxJGENt+SR91aZXH5xp7bq8s
7bx0knRJKgRbJHjznx1INzw7McNUouBkbuajwXhuGubMv6zCawqM9JVfaU2ZZE0M
ckj7FsgCcJpDhzPGXhhgv6XbisBFN2tkPdfJzkVkKN3j04eKqUPwzGwwuUfQSoRM
yG5UtBLigtto3i9uyJ3Ngj15fvgAVTziLCR6Q2uH4m+VOhpkqxfGSPaZ5GdDVWcV
/PnlE4Yg8KAHU81dHHi4VjiIiNsW+IO3m49clEw/hRqs/kTXE3d50o+up96/YYyc
d7xYGWJ6PqaQKx0ehYMlx0I/NxG0ANwR3J0BLEr17mX2KXdRcH2IJIS2Ajl7hG3B
kkoFfrXoQ972zwLzoCLoZHHT6FN7KFUQ2CMqidh4Qwa1q7vHZu5xFFwir1noAFa6
AEif/dvU3mz+BS2FtnJHOLROc6Q/4hNqyDdYw10ZAS1MdiGtjk6GLl4jp28k72qv
AacyYt9gR9GsO4tci9MhasWd2lypg+YGlyy4yFiA334+4ovg5I40CTbN2A13lEPs
m61tDwxIqpG5zk+8ti6hITlIXSL1NrALsWe7JiUsH8kD6i/RKUk=
=7v4W
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

--===============1523476972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1523476972==--
