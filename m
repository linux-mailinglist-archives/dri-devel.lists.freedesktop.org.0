Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB00B8A52D8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 16:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02B91125F7;
	Mon, 15 Apr 2024 14:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L4jm1pF4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A312E10FD41
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 14:16:23 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6eff2be3b33so933719b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713190583; x=1713795383; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QfWZ6p4Ra3V5a1g7hJEFDN7tbjxd+ey9ZnLhDNNg/5k=;
 b=L4jm1pF4k/giJwsfIz59+tE0Lr/siNHObs8EXe0ytgUJcy6HDz1pLk82Cdmd9L2lLv
 PN+KC/2+2J7m0hp/2nBZ0nFKszKfmbk8fpcLLRDqkHDJLKu5UMu8k+MBEhac5JlQkBYn
 6E1Y+15vqJFUtZty3CnE/IQbYq8N2iXvnEy3wDI9nIl4odE0xXx3wkt6Bxrp5kjX06V1
 ZGQWb+MtBax2N035pAjJ89nVFKv0gs5zmF9aOWbkGYAJPXj9gaJx2HUO4xRCblgcsBQ+
 k8IOtiVzjKEadfv8jIHuEZ65NrpBKsYHTDbk3GbG9bZAWTD+YEHNXP58eKy+V/nFWhbs
 IcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713190583; x=1713795383;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QfWZ6p4Ra3V5a1g7hJEFDN7tbjxd+ey9ZnLhDNNg/5k=;
 b=JEnbIUxMb3lmcr3+PqA+5JxRyXmSdg64VxkVnCDnT4SbaUHdAHS5NneLm2w/uT1711
 dRQwpK/mpmABASQMBCqoggcItG/DrHWPEfZgDLPL7D2psOqjq96aBPulmBJr9YdSr+Kc
 /lc/xs99+Ok/7YNoFl5lc5Zeu2nD4yDgSqdSfwvLRLbNob9o/rku7oI5IIJKCto0xYZm
 99HufxBgh1mE1YVN0lm1Rhxq2E6xlHh1oS5izcE53/47VHdqt5okr+W2MCGgjVhJww1c
 bEGkg0pfJwrjW2doCIH3RL57W5IuYBsDy9Fdo+Rugb8ozPpRiDQGz9x3YY0Xqt9AoGHE
 zSsQ==
X-Gm-Message-State: AOJu0Yx3GE8OW5eAGaZIgK0lHeI2cJA7MLZuayoqg58BxF4WzNzK6ack
 YSiREegbTY34DUtqWC+4lZMg3QDHpAoIp3+0mM1Z0qkVkcBuvdte
X-Google-Smtp-Source: AGHT+IHx7ybRjl1lX/qgj18sR8Rm0HIVycuQyLLVmCr1H4BxvhQQKLOseYfd8ym1djHwIJvXLoSI2Q==
X-Received: by 2002:a05:6a00:1406:b0:6ec:d76b:6fac with SMTP id
 l6-20020a056a00140600b006ecd76b6facmr11387342pfu.12.1713190582734; 
 Mon, 15 Apr 2024 07:16:22 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056a00181000b006ed9760b815sm7237942pfa.211.2024.04.15.07.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 07:16:22 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 59A891832065F; Mon, 15 Apr 2024 21:16:19 +0700 (WIB)
Date: Mon, 15 Apr 2024 21:16:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 pekka.paalanen@collabora.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 3/3] drm/fourcc: Add documentation around drm_format_info
Message-ID: <Zh02sk_NAy6eMSCt@archie.me>
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
 <20240409-google-drm-doc-v1-3-033d55cc8250@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/AhLcWdqLXTIlsLz"
Content-Disposition: inline
In-Reply-To: <20240409-google-drm-doc-v1-3-033d55cc8250@bootlin.com>
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


--/AhLcWdqLXTIlsLz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2024 at 12:04:07PM +0200, Louis Chauvet wrote:
>  /**
>   * struct drm_format_info - information about a DRM format
> + *
> + * A drm_format_info describes how planes and pixels are stored in memor=
y.
> + *
> + * Some format like YUV can have multiple planes, counted in @num_planes=
=2E It
> + * means that a full pixel can be stored in multiple non-continuous buff=
ers.
> + * For example, NV12 is a YUV format using two planes: one for the Y val=
ues and
> + * one for the UV values.
> + *
> + * On each plane, the "pixel" unit can be different in case of subsampli=
ng. For
> + * example with the NV12 format, a pixel in the UV plane is used for fou=
r pixels
> + * in the Y plane.
> + * The fields @hsub and @vsub are the relation between the size of the m=
ain
> + * plane and the size of the subsampled planes in pixels:
> + *	plane[0] width =3D hsub * plane[1] width
> + *	plane[0] height =3D vsub * plane[1] height
> + *
> + * In some formats, pixels are not independent in memory. It can be a pa=
cked
> + * representation to store more pixels per byte (for example P030 uses 4=
 bytes
> + * for three 10 bit pixels). It can also be used to represent tiled form=
ats,
> + * where a continuous buffer in memory can represent a rectangle of pixe=
ls (for
> + * example, in DRM_FORMAT_Y0L0, a buffer of 8 bytes represents a 2x2 pix=
el
> + * region of the picture).
> + *	The field @char_per_block is the size of a block on a specific plane,=
 in
> + *	bytes.
> + *	The fields @block_w and @block_h are the size of a block in pixels.
> + *
> + * The older format representation (which only uses @cpp, kept for histo=
rical
> + * reasons because there are a lot of places in drivers where it's used)=
 is
> + * assuming that a block is always 1x1 pixel.
> + *
> + * To keep the compatibility with older format representations and treat=
 block
> + * and non-block formats in the same way one should use:
> + *	- @char_per_block to access the size of a block on a specific plane, =
in
> + *	bytes.
> + *	- drm_format_info_block_width() to access the width of a block of a
> + *	specific plane, in pixels.
> + *	- drm_format_info_block_height() to access the height of a block of a
> + *	specific plane, in pixels.
>   */
>  struct drm_format_info {
>  	/** @format: 4CC format identifier (DRM_FORMAT_*) */
> @@ -97,13 +135,6 @@ struct drm_format_info {
>  		 * formats for which the memory needed for a single pixel is not
>  		 * byte aligned.
>  		 *
> -		 * @cpp has been kept for historical reasons because there are
> -		 * a lot of places in drivers where it's used. In drm core for
> -		 * generic code paths the preferred way is to use
> -		 * @char_per_block, drm_format_info_block_width() and
> -		 * drm_format_info_block_height() which allows handling both
> -		 * block and non-block formats in the same way.
> -		 *
>  		 * For formats that are intended to be used only with non-linear
>  		 * modifiers both @cpp and @char_per_block must be 0 in the
>  		 * generic format table. Drivers could supply accurate
>=20

Sphinx reports htmldocs warnings:

Documentation/gpu/drm-kms:357: ./include/drm/drm_fourcc.h:74: ERROR: Unexpe=
cted indentation.
Documentation/gpu/drm-kms:357: ./include/drm/drm_fourcc.h:83: ERROR: Unexpe=
cted indentation.
Documentation/gpu/drm-kms:357: ./include/drm/drm_fourcc.h:93: ERROR: Unexpe=
cted indentation.
Documentation/gpu/drm-kms:357: ./include/drm/drm_fourcc.h:94: WARNING: Bull=
et list ends without a blank line; unexpected unindent.

I have to fix up the lists:

---- >8 ----
diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index 66cc30e28f794a..10ee74fa46d21e 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -71,8 +71,9 @@ struct drm_mode_fb_cmd2;
  * in the Y plane.
  * The fields @hsub and @vsub are the relation between the size of the main
  * plane and the size of the subsampled planes in pixels:
- *	plane[0] width =3D hsub * plane[1] width
- *	plane[0] height =3D vsub * plane[1] height
+ *
+ *	- plane[0] width =3D hsub * plane[1] width
+ *	- plane[0] height =3D vsub * plane[1] height
  *
  * In some formats, pixels are not independent in memory. It can be a pack=
ed
  * representation to store more pixels per byte (for example P030 uses 4 b=
ytes
@@ -80,9 +81,10 @@ struct drm_mode_fb_cmd2;
  * where a continuous buffer in memory can represent a rectangle of pixels=
 (for
  * example, in DRM_FORMAT_Y0L0, a buffer of 8 bytes represents a 2x2 pixel
  * region of the picture).
- *	The field @char_per_block is the size of a block on a specific plane, in
- *	bytes.
- *	The fields @block_w and @block_h are the size of a block in pixels.
+ *
+ *	- The field @char_per_block is the size of a block on a specific plane,
+ *	  in bytes.
+ *	- The fields @block_w and @block_h are the size of a block in pixels.
  *
  * The older format representation (which only uses @cpp, kept for histori=
cal
  * reasons because there are a lot of places in drivers where it's used) is
@@ -90,12 +92,13 @@ struct drm_mode_fb_cmd2;
  *
  * To keep the compatibility with older format representations and treat b=
lock
  * and non-block formats in the same way one should use:
+ *
  *	- @char_per_block to access the size of a block on a specific plane, in
- *	bytes.
+ *	  bytes.
  *	- drm_format_info_block_width() to access the width of a block of a
- *	specific plane, in pixels.
+ *	  specific plane, in pixels.
  *	- drm_format_info_block_height() to access the height of a block of a
- *	specific plane, in pixels.
+ *	  specific plane, in pixels.
  */
 struct drm_format_info {
 	/** @format: 4CC format identifier (DRM_FORMAT_*) */

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/AhLcWdqLXTIlsLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZh02rgAKCRD2uYlJVVFO
o/AIAP9nAjuvp2Syyy0KsbDw+mAbk2nVyjWPoMzlKnG+nYAn3gD/fAP+e2p93os3
hY0n5qJZp+AlZtoBCoICJkxphd2UCQM=
=NyHa
-----END PGP SIGNATURE-----

--/AhLcWdqLXTIlsLz--
