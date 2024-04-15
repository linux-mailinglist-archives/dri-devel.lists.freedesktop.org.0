Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D7C8A5383
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 16:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2DC112601;
	Mon, 15 Apr 2024 14:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NPDgZbf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EB3112603
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 14:28:25 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6eddff25e4eso2706648b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 07:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713191305; x=1713796105; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dCR27t1hGGufnpVnvCmoWaIgC3EfAz+l4DjDvpX/Ib0=;
 b=NPDgZbf19Th32GmDWe5fqLHXJAF8xYlLIx+1EBElCjeJ0J8EV/U6SxiRFQEzAdFaMM
 MjJQRvpT934vqKGrJa5bRHooabB1ih9zFIzUIdWQ/VYbe5ePJB1T+BhJ7C5IqH6Yw9fH
 aNQI/J+795PDurD8QRyt2WbQWz7N5yNs8cD3NmFc1dllv7yqeClN0YkZBtPffaFULqy3
 rUa39ajj24XDv8+84SUCt9yg78bVe4JO82gWtMQ+wmI5OQ9WAqG7fYUq83/c+/N1r9u8
 Szp1TLV/3fXV4CR/gs8+XoXi+2bCpJEwuUKb39UB5JPuu6eBMfaAcNbnJjMlqTGC30uQ
 3IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713191305; x=1713796105;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dCR27t1hGGufnpVnvCmoWaIgC3EfAz+l4DjDvpX/Ib0=;
 b=FeskCjNPsgcP3ofkRHAGTKKyvObgr6AydBDXH6AeJmaBL5baI3qaWKkRrnG/BfXslK
 LzKnZYQSaQOYjGzH1mCubvB3mq4hD0BINZ72XbMeIcthnpRC7uIbI/b2vk5LOeqMM2nC
 37DMqT1a+mxlJadJDlEjxeA9kyAT9gdZSGB/8r7+rNSExZEoHmFB7xPJVsjqndg386ma
 pnxE74A0JJ9HpFsgKZd/qcxXQw0X237PPtgL8XRUi/QCLfroXYKZ2aHpIJuJKKGZ5gUC
 SOS2JlnGlR6J/NSF1GV9LJsPncLXgxuoRa0HpqweVK2uAFIBwU+25DaWDrbM9bjR8xT5
 z9FQ==
X-Gm-Message-State: AOJu0YwyNCOd+5ilOtJBbcFsKvhnJZ3K58BIP7G3K0Q2whWwlVUb78+e
 YCgF1KaFPAfqVb42gq7ZHaMK6S6Ina2Zn3vHHGCxKT8yzWOcc8Lo
X-Google-Smtp-Source: AGHT+IEZsOXWoubXFpf8Vkx3wtYoY3Jn51Rk7KaombfQH8gQhzRsZEy2LZRoH/MX2zdMWNSfl4NpvQ==
X-Received: by 2002:a05:6a21:398f:b0:1a9:fe63:90f0 with SMTP id
 ad15-20020a056a21398f00b001a9fe6390f0mr3568262pzc.53.1713191304871; 
 Mon, 15 Apr 2024 07:28:24 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 y25-20020aa78059000000b006ef97508163sm4349905pfm.37.2024.04.15.07.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 07:28:24 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 9C0131B5EF086; Mon, 15 Apr 2024 21:28:22 +0700 (WIB)
Date: Mon, 15 Apr 2024 21:28:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 pekka.paalanen@collabora.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/3] drm: drm_blend.c: Improve
 drm_plane_create_rotation_property kernel doc
Message-ID: <Zh05hqtB9owzjjez@archie.me>
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
 <20240409-google-drm-doc-v1-2-033d55cc8250@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j3zP2GZ4OPkidsR1"
Content-Disposition: inline
In-Reply-To: <20240409-google-drm-doc-v1-2-033d55cc8250@bootlin.com>
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


--j3zP2GZ4OPkidsR1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2024 at 12:04:06PM +0200, Louis Chauvet wrote:
> @@ -266,8 +257,41 @@ EXPORT_SYMBOL(drm_plane_create_alpha_property);
>   *
>   * Rotation is the specified amount in degrees in counter clockwise dire=
ction,
>   * the X and Y axis are within the source rectangle, i.e.  the X/Y axis =
before
> - * rotation. After reflection, the rotation is applied to the image samp=
led from
> - * the source rectangle, before scaling it to fit the destination rectan=
gle.
> + * rotation.
> + *
> + * Here are some examples of rotation and reflections:
> + *
> + * |o  +|  REFLECT_X  |+  o|
> + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> + * |    |             |    |
> + *
> + * |o   |  REFLECT_Y  |+   |
> + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> + * |+   |             |o   |
> + *
> + * |o  +|  ROTATE_90  |+   |
> + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> + * |    |             |o   |
> + *
> + * |o   |  ROTATE_180 |   +|
> + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> + * |+   |             |   o|
> + *
> + * |o   |  ROTATE_270 |+  o|
> + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> + * |+   |             |    |
> + *
> + * Rotation and reflection can be combined to handle more situations. In=
 this condition, the
> + * reflection is applied first and the rotation in second.
> + *
> + * For example the expected result for DRM_MODE_ROTATE_90 | DRM_MODE_REF=
LECT_X is:
> + *
> + * |o  +|  REFLECT_X  |+  o|  ROTATE_90  |o   |
> + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |  =3D=3D=3D=3D=3D=3D=3D=3D> =
 |    |
> + * |    |             |    |             |+   |
> + *
> + * It is not possible to pass multiple rotation at the same time. (i.e R=
OTATE_90 | ROTATE_180 is
> + * not the same as ROTATE_270 and is not accepted).

Sphinx reports htmldocs warnings on these transformation diagrams:

Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:265: ERROR: Un=
defined substitution referenced: "o +".
Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:265: ERROR: Un=
defined substitution referenced: "+ o".
Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:273: ERROR: Un=
defined substitution referenced: "o +".
Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:277: ERROR: Un=
defined substitution referenced: "o | ROTATE_180 | +".
Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:277: ERROR: Un=
defined substitution referenced: "+ | | o".
Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:281: ERROR: Un=
defined substitution referenced: "o | ROTATE_270 |+ o".
Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:290: ERROR: Un=
defined substitution referenced: "o +".
Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:290: ERROR: Un=
defined substitution referenced: "+ o".

I have to wrap them in literal blocks:

---- >8 ----
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6fbb8730d8b022..f2cbf8d8efbbbc 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -259,36 +259,36 @@ EXPORT_SYMBOL(drm_plane_create_alpha_property);
  * the X and Y axis are within the source rectangle, i.e.  the X/Y axis be=
fore
  * rotation.
  *
- * Here are some examples of rotation and reflections:
+ * Here are some examples of rotation and reflections::
  *
- * |o  +|  REFLECT_X  |+  o|
- * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
- * |    |             |    |
+ *	|o  +|  REFLECT_X  |+  o|
+ *	|    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
+ *	|    |             |    |
  *
- * |o   |  REFLECT_Y  |+   |
- * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
- * |+   |             |o   |
+ *	|o   |  REFLECT_Y  |+   |
+ *	|    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
+ *	|+   |             |o   |
  *
- * |o  +|  ROTATE_90  |+   |
- * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
- * |    |             |o   |
+ *	|o  +|  ROTATE_90  |+   |
+ *	|    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
+ *	|    |             |o   |
  *
- * |o   |  ROTATE_180 |   +|
- * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
- * |+   |             |   o|
+ *	|o   |  ROTATE_180 |   +|
+ *	|    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
+ *	|+   |             |   o|
  *
- * |o   |  ROTATE_270 |+  o|
- * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
- * |+   |             |    |
+ *	|o   |  ROTATE_270 |+  o|
+ *	|    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
+ *	|+   |             |    |
  *
  * Rotation and reflection can be combined to handle more situations. In t=
his condition, the
  * reflection is applied first and the rotation in second.
  *
- * For example the expected result for DRM_MODE_ROTATE_90 | DRM_MODE_REFLE=
CT_X is:
+ * For example the expected result for DRM_MODE_ROTATE_90 | DRM_MODE_REFLE=
CT_X is::
  *
- * |o  +|  REFLECT_X  |+  o|  ROTATE_90  |o   |
- * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |=
    |
- * |    |             |    |             |+   |
+ *	|o  +|  REFLECT_X  |+  o|  ROTATE_90  |o   |
+ *	|    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |=
    |
+ *	|    |             |    |             |+   |
  *
  * It is not possible to pass multiple rotation at the same time. (i.e ROT=
ATE_90 | ROTATE_180 is
  * not the same as ROTATE_270 and is not accepted).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--j3zP2GZ4OPkidsR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZh05hgAKCRD2uYlJVVFO
o1ViAQCpYUwFBWA1VJ9hNZykmFyvVHFiqufi3AfxQWmolU+5WgD/QCeVancsmMRC
Xu+Tf5kfiNJTrMQwSlF/2Dxr+StGagc=
=91C7
-----END PGP SIGNATURE-----

--j3zP2GZ4OPkidsR1--
