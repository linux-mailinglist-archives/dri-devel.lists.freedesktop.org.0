Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED89D38101
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 00:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC2189823;
	Thu,  6 Jun 2019 22:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3323D89823
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 22:40:47 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w13so10882eds.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 15:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=phnCWAxvmUCyTW6c5t2uUP0p/ctzFwDLw8hDVCeBb+I=;
 b=Pe6ydPqHd/cIuo4x1CN8V8GelxZk9XMOSAQq90dG1GC+4WfhFQA8TxSrRdrOZoqb0Y
 /xYFC38SUVQaWsrUkozK+4XZh2E7Md9NLldQfW4sNxlHxfYmQ026hYJmpHAFPo6I4bze
 X5iJflmrkOYPE4su12JsudRsJdqrEN5x+OlcWv28Qg9yT9TmWP24VSTSEe8ztN4740/u
 BMlbOxP9MEsx7XRrjP47T7Zl/DsGpsdPq79WEOwtNQke/bj3wYmn8tYc8gSG4F9o3cIw
 7o0XgaM766Z8wvORe0tLZhwnKrhb+a0cuvuK4esPW5BdifMqSaeEVI79LrRU6A5usUSP
 Bhmw==
X-Gm-Message-State: APjAAAWM/xlCpUqjbn1BRVNh4DJ/gQy79aQhE29XSkpP+Go9Es8Wwmed
 AMuDMke3QuTxhNC8LP/Hkh0=
X-Google-Smtp-Source: APXvYqwd34GV/ljRusChb3NlKnkx4KXjGhPS4IEWP75EI54kblA3z2OYq/LyXOQnMuR/LmkDu7L3MQ==
X-Received: by 2002:a17:906:2890:: with SMTP id
 o16mr18236138ejd.80.1559860845759; 
 Thu, 06 Jun 2019 15:40:45 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id f13sm60065ejj.7.2019.06.06.15.40.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:40:45 -0700 (PDT)
Date: Thu, 6 Jun 2019 19:40:38 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Brian Starkey <brian.starkey@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/2] drm/vkms: Use index instead of 0 in possible crtc
Message-ID: <e3bc263b273d91182e0577ed820b1c4f096834ec.1559860606.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1559860606.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1559860606.git.rodrigosiqueiramelo@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=phnCWAxvmUCyTW6c5t2uUP0p/ctzFwDLw8hDVCeBb+I=;
 b=U+UmNgMJ383xno5xjEYhVlJgAAsmxRbAfZpqQ619BoqL7fIbXRBOjRPTaw0/j8CKKX
 VKG1i/PbbbMLuIO29fXI494Fa/qc5/KlqfV9WDEenibnqqsRUDl9J7mPNUb0K9+cC91/
 0Q8SgwIgOzNGElWxZSyyaxlBUbB4KYl9mfWXg2QU2kBqbaKN1XzKfq/G2DC0deWmyFSa
 7N1V1D6hL876838zbl30hfQ3Yy9A2sI+OfZgWKPGn222hvPhSC3A9VHujtwFDWOYIIEB
 0CM2sfEDQ4MVtWlAoI/L9oT6CJPZbXkhZK0JXQfCueZdvRlJhQ55bwcUxJ1iPcx9Bt7K
 NOew==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1283558243=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1283558243==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fku5dw5gt3ggyzpv"
Content-Disposition: inline


--fku5dw5gt3ggyzpv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When vkms calls drm_universal_plane_init(), it sets 0 for the
possible_crtcs parameter which works well for a single encoder and
connector; however, this approach is not flexible and does not fit well
for vkms. This commit adds an index parameter for vkms_plane_init()
which makes code flexible and enables vkms to support other DRM features.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c    | 2 +-
 drivers/gpu/drm/vkms/vkms_drv.h    | 4 ++--
 drivers/gpu/drm/vkms/vkms_output.c | 6 +++---
 drivers/gpu/drm/vkms/vkms_plane.c  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_dr=
v.c
index 738dd6206d85..92296bd8f623 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -92,7 +92,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.max_height =3D YRES_MAX;
 	dev->mode_config.preferred_depth =3D 24;
=20
-	return vkms_output_init(vkmsdev);
+	return vkms_output_init(vkmsdev, 0);
 }
=20
 static int __init vkms_init(void)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_dr=
v.h
index 81f1cfbeb936..e81073dea154 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -113,10 +113,10 @@ bool vkms_get_vblank_timestamp(struct drm_device *dev=
, unsigned int pipe,
 			       int *max_error, ktime_t *vblank_time,
 			       bool in_vblank_irq);
=20
-int vkms_output_init(struct vkms_device *vkmsdev);
+int vkms_output_init(struct vkms_device *vkmsdev, int index);
=20
 struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				  enum drm_plane_type type);
+				  enum drm_plane_type type, int index);
=20
 /* Gem stuff */
 struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms=
_output.c
index 3b162b25312e..1442b447c707 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -36,7 +36,7 @@ static const struct drm_connector_helper_funcs vkms_conn_=
helper_funcs =3D {
 	.get_modes    =3D vkms_conn_get_modes,
 };
=20
-int vkms_output_init(struct vkms_device *vkmsdev)
+int vkms_output_init(struct vkms_device *vkmsdev, int index)
 {
 	struct vkms_output *output =3D &vkmsdev->output;
 	struct drm_device *dev =3D &vkmsdev->drm;
@@ -46,12 +46,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	struct drm_plane *primary, *cursor =3D NULL;
 	int ret;
=20
-	primary =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
+	primary =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
=20
 	if (enable_cursor) {
-		cursor =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
+		cursor =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
 		if (IS_ERR(cursor)) {
 			ret =3D PTR_ERR(cursor);
 			goto err_cursor;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_=
plane.c
index 0e67d2d42f0c..20ffc52f9194 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -168,7 +168,7 @@ static const struct drm_plane_helper_funcs vkms_primary=
_helper_funcs =3D {
 };
=20
 struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				  enum drm_plane_type type)
+				  enum drm_plane_type type, int index)
 {
 	struct drm_device *dev =3D &vkmsdev->drm;
 	const struct drm_plane_helper_funcs *funcs;
@@ -190,7 +190,7 @@ struct drm_plane *vkms_plane_init(struct vkms_device *v=
kmsdev,
 		funcs =3D &vkms_primary_helper_funcs;
 	}
=20
-	ret =3D drm_universal_plane_init(dev, plane, 0,
+	ret =3D drm_universal_plane_init(dev, plane, 1 << index,
 				       &vkms_plane_funcs,
 				       formats, nformats,
 				       NULL, type, NULL);
--=20
2.21.0

--fku5dw5gt3ggyzpv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlz5lmYACgkQWJzP/com
vP/GWQ//c4M1YV33fWDqKX2AI2qcXLq01JsMyc1gEebKgdNrDbmUyy0i2sXYJTAV
e0xxvdE7fsg2LFOQWhf4SHh2qggffGzIq0uN45PSxqfIcm6E4YG+6UzgjDkKzly0
5Ak4lfkbIfJHtD2U1BrkBOTYzioP8pjGTCzMuYA1PWQKFbzVtqNQ6Krd1lEkukof
ppEHX9gVSg8APh9SbyOiINQWYMGYRQcEd9LUDs1vESvgrmPCJnfHKA5N1BXGfWd1
Jp1g0YYsl/uxbbKRDcx9l7XRAmb2EWVmGQMpgJRHpW0S2dpjGwYtr4Gvznk8PfCe
9B+OecaDWabkgOYpCaDi+DaFlhV5m4/6bN0vsPwAsEbk+kkjprvjM2aBdHyg89gJ
6an8pqmNc3GTy64aJivZzqOrYsEzSB+WI2OWE7NCUAvLIjfpvcEOqZ3tRloeiqRr
ONXeMQoCSyeboUK0HhoQtI6dFri9Owb4hQzurF7KHs/N/huINE1o/jQ2nijvLWdD
oHB10VAvx3J54VFcIxg0I6Tb20UW3zkMxSspETLpuk9fbcVQMCG7BvhTvXfSmqu1
VEEhyhHA60BBg89IJtzi0jBM+mfUtGzWgBYdJ4hyTC0wFKrg1Pp10QAF9004xLsU
euJQldoAXykA8MC+Wkt1hbL7sDNcXA+FCb7kcPbM/gFShgYCLXk=
=vnl/
-----END PGP SIGNATURE-----

--fku5dw5gt3ggyzpv--

--===============1283558243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1283558243==--
