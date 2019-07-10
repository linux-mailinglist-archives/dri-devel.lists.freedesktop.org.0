Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC4663F07
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 03:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0638991A;
	Wed, 10 Jul 2019 01:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8068991A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 01:53:13 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g18so700420qkl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 18:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FKfKo9B1CRcLmq9txqUh+s6WgoiWvagwqjoqjlaktJU=;
 b=LHqgQlYGoxIR6R3condMQDeyJ0IJl3rL27/dhVw/SrDq1MgsOFRDqa1JIVlsffHlVg
 BmlLsOmZYemXB4ESDRRWgis0d4nP5fGkq83X2qokJR+xAIVu5/HGr3pvgiJs43+XxMDo
 zVKa/nWqMXU71Ccw5U3PTaHaXH66rAgeobTBvu0Hm4LG81F7rrcZli+Tdy0TSSZSGQ4U
 VDf8PKfiaGKqpcWRQ4Y5/NxpBMGFixC3PilMiQVyMkkZ2VfXT9wDNydTcCyX1M7Cb19W
 j3PZAMfaUn7+fTTuRlFQLU9KCpICBXSGX2btV0ExXl+BtJJJtOb5YdJU1bksLNbiF4HF
 UWIQ==
X-Gm-Message-State: APjAAAWRqVoDZ8yO005E1mJMofV9QR1o3c+qzg8b++c1nes9QLruV9H1
 oLJm9pIkG6OkxUd1n56N1jA=
X-Google-Smtp-Source: APXvYqyZjtPAFXEGx7q45BTzK4GpDZO61jVLHi6J+VWw6K/jS1ABqei5HrMR7yozVU/yyBtdt5MQYg==
X-Received: by 2002:a37:6a87:: with SMTP id
 f129mr21369566qkc.183.1562723592266; 
 Tue, 09 Jul 2019 18:53:12 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.22])
 by smtp.gmail.com with ESMTPSA id q9sm374109qkm.63.2019.07.09.18.53.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 18:53:11 -0700 (PDT)
Date: Tue, 9 Jul 2019 22:53:06 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>, Simon Ser <contact@emersion.fr>,
 Oleg Vasilev <oleg.vasilev@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH 1/2] drm/vkms: Rework blend function
Message-ID: <c5fc1e8ae57cc3a2818a92e74b5eda5becaa1cf3.1562695974.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1562695974.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1562695974.git.rodrigosiqueiramelo@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FKfKo9B1CRcLmq9txqUh+s6WgoiWvagwqjoqjlaktJU=;
 b=Ir1ZXekjheKQ6toSOnazwLGOvTBSlwDXx8BzQTcnNzWqkj1klkMDDPjRiG1Ahlgtl3
 jQPJEWcO+vtuySDBjAO6ffP7pg6ge85idG5UlKT6GWr2Ufa++K0UJ++76BoyxVvyCiEc
 IWeU0AqvzWTlqPQzhbaOZ4jiEkfIKrgv3r3WI46sLu4pPTorgswp4fh0XzdkJsrFmZSf
 G+6wcLqi11dlqMa/6W/ytbQO3lvCgrG7mNoGczFNW4BsQM2KllSsXEzUZAhhHQ8a6HCK
 syvttwtUXn4VTJL01gLUKBsPBXOjOowQSlUr5f0WN9PPW6T4i7XMabpHcGuxmthum5dE
 slww==
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
Content-Type: multipart/mixed; boundary="===============1295170859=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1295170859==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5lmqct4xe5d662r5"
Content-Disposition: inline


--5lmqct4xe5d662r5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

For combining the cursor into the primary plane, vkms invokes a function
named blend which iterates in both buffers and ends up by copying the
cursor into the primary buffer. This patch, rework part of the blend
function to prepare it for using the alpha channel for blending.

Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Mamta Shukla <mamtashukla555@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 39 +++++++++++++++++-----------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vk=
ms_composer.c
index 2317803e7320..fb106964d8bf 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -15,6 +15,17 @@ static u32 get_pixel_from_buffer(int x, int y, const u8 =
*buffer,
 	return *(u32 *)&buffer[src_offset];
 }
=20
+static void set_pixel(int x, int y, u8 *buffer,
+		      const struct vkms_composer *composer, const u32 value)
+{
+	int offset =3D composer->offset + (y * composer->pitch)
+				      + (x * composer->cpp);
+	u32 *dst;
+
+	dst =3D (u32 *)&buffer[offset];
+	*dst =3D value;
+}
+
 /**
  * compute_crc - Compute CRC value on output frame
  *
@@ -50,7 +61,7 @@ static uint32_t compute_crc(const u8 *vaddr,
  * blend - belnd value at vaddr_src with value at vaddr_dst
  * @vaddr_dst: destination address
  * @vaddr_src: source address
- * @dest_composer: destination framebuffer's metadata
+ * @dst_composer: destination framebuffer's metadata
  * @src_composer: source framebuffer's metadata
  *
  * Blend value at vaddr_src with value at vaddr_dst.
@@ -62,11 +73,10 @@ static uint32_t compute_crc(const u8 *vaddr,
  *	 instead of overwriting it.
  */
 static void blend(void *vaddr_dst, void *vaddr_src,
-		  struct vkms_composer *dest_composer,
+		  struct vkms_composer *dst_composer,
 		  struct vkms_composer *src_composer)
 {
-	int i, j, j_dst, i_dst;
-	int offset_src, offset_dst;
+	int y, x, j_dst, i_dst;
=20
 	int x_src =3D src_composer->src.x1 >> 16;
 	int y_src =3D src_composer->src.y1 >> 16;
@@ -79,17 +89,16 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 	int y_limit =3D y_src + h_dst;
 	int x_limit =3D x_src + w_dst;
=20
-	for (i =3D y_src, i_dst =3D y_dst; i < y_limit; ++i) {
-		for (j =3D x_src, j_dst =3D x_dst; j < x_limit; ++j) {
-			offset_dst =3D dest_composer->offset
-				     + (i_dst * dest_composer->pitch)
-				     + (j_dst++ * dest_composer->cpp);
-			offset_src =3D src_composer->offset
-				     + (i * src_composer->pitch)
-				     + (j * src_composer->cpp);
-
-			memcpy(vaddr_dst + offset_dst,
-			       vaddr_src + offset_src, sizeof(u32));
+	u32 pixel_src;
+
+	for (y =3D y_src, i_dst =3D y_dst; y < y_limit; ++y) {
+		for (x =3D x_src, j_dst =3D x_dst; x < x_limit; ++x) {
+			pixel_src =3D get_pixel_from_buffer(x, y,
+							  vaddr_src,
+							  src_composer);
+			set_pixel(j_dst, i_dst, vaddr_dst, dest_composer,
+				  pixel_src);
+			j_dst++;
 		}
 		i_dst++;
 	}
--=20
2.21.0

--5lmqct4xe5d662r5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0lRQIACgkQWJzP/com
vP/ayw/+Itdrm1NoRlQmR54QNjAdScgLRFos2HfiesebqHZnyReyndZka1CAk6VZ
dvg24orUDjIIVFudeE5KdwK+td8x4/GH1ZMkKGOuuQ6fP4ays4E4qz7HUTB+TEEB
76VQohu7DslRLdnQGAEGmLep6nPIWB9xGQLmUP6RwpHCzKPiwy2rh0POXb1wTyXe
a9erHEUdmbV9/6wYt6HyTWVwEQSfNl2Hl5FBAT8m9jUy/qwmkscAPPLeEC/t7NCB
RPiCRp0jQkmBPIIwnBjZsrpYdXPsvMQohx8ershd/BMd+nl1czSpW+mx85Kgn9pK
Az2oFP4m3xUr3FGrMRzLIy1yMZfbTGxrZ8E+XP3d/G+v23AdVfzuwR7NidwgpxZa
lZx+Nv3mC60opqqyI+fTdDPIM+2go/sDCklo2BDCjFi/y+CYTkDDMUzh9qbdWZmB
hO3coGfBFSbKQc9X8OdPNM9RYqxYz3+G86lRq2T+/MS7gozWDzElzfvm7Om0wzBa
39WRY007Zqz2AoHYlYqD/Jnk+4So/ZpTbwlXeophUlb0Sg+Du/GcmVJavA7Q/1wD
Kv7/LcwNZae3nQt8WQpUBuvntf7b6vkInjDZDAv2Tv1jl5y2rA+MB3Lr61rmzViE
CHuu0dW4HB69L+hItS/x/CSGDCLFaZLwJ9eMlZwDQpHcYxN0Zkw=
=mndw
-----END PGP SIGNATURE-----

--5lmqct4xe5d662r5--

--===============1295170859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1295170859==--
