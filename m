Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC91F218057
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FBA6E88B;
	Wed,  8 Jul 2020 07:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA276E075
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 16:36:24 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id d4so20249616pgk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=P+tEcuvDANaU3TFunPyWDY6whSvjt/qMfIX+MZZgXbo=;
 b=VEc5z4hgiiI3ZAzjq0KOY/WOP0UxDZ+hWick5n4yRumfLVVQEcBqt2cyhYsRbxbFPx
 SJbjYxUfoam3g90qUeF4oMPa/OQFa0AJ2jL24fCMzIan6hiHK+1+Vq029EDc/Zlby8Vt
 udPbyjjFuK0oKp1eljurXkOCeaj5IDFhr7x2h7ht70mbGNblCxWqFax6P4ooahnHPYfU
 wWhuCWmdHczaLn8t744/RHpRKyCcDo2tkrr0/1IwlwAxq7+GG6wlBrJ5U+4PXeiBTZBz
 rl3xbkLBWe8WbpQ2mFSEssH3o+QJC1IbB4ylG/Oggt0urgotGfLPiosbro8nVmyVNFbC
 JgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P+tEcuvDANaU3TFunPyWDY6whSvjt/qMfIX+MZZgXbo=;
 b=T3Z7grtS8wKg8OnULez9D/T94uf92PuzMXSUrd5ZahtO6qbY1f/O+utR3hY+Wl9/f/
 m3Sns2mP2pt4vdlZgiyTNOhJIUrhl8+ePYuv/EX/fFqQfSkNbgZUkvlj804dF34KmlOq
 uvy12hPYbf4+rPoHlX/Nm2MRR5kq6ZuF/cc9ZEnVUwymapt6FpZ49Zaju/iSKgrkQCk/
 hCxioElOamPMAC3zFB7q2GZ+jkNmxO7txVoX0ZUzXx/vkFp6oGReysairAGSTq4ikjyl
 kE/hd+hMFOejSJceFFlWsNZf04/TNq6tG20OGaFRYQb7RyRRpUumk00rYhVU1uI4rB3t
 TTxQ==
X-Gm-Message-State: AOAM531cha+2Bm7M0T9Y99jROfcYvh2q6rUdzZx9Fh75n4qKsdO3uIG+
 RdTBumV+oUM00+2P6XSYrrA=
X-Google-Smtp-Source: ABdhPJzHQmKoJIE1rCFwDMK3xXHpbwCQt+33rQ1Uu18muRkY/5KyR1c/K96qcJhDAtnHZBK8FFFgOw==
X-Received: by 2002:a63:e23:: with SMTP id d35mr44007529pgl.435.1594139783774; 
 Tue, 07 Jul 2020 09:36:23 -0700 (PDT)
Received: from blackclown ([103.88.82.137])
 by smtp.gmail.com with ESMTPSA id u74sm1444074pgc.58.2020.07.07.09.36.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jul 2020 09:36:23 -0700 (PDT)
Date: Tue, 7 Jul 2020 22:06:09 +0530
From: Suraj Upadhyay <usuraj35@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/4] drm: mipi-dbi: Convert logging to drm_* functions.
Message-ID: <20c4bdc75f610aea8c779aa075483e04f47b719d.1594136880.git.usuraj35@gmail.com>
References: <cover.1594136880.git.usuraj35@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1594136880.git.usuraj35@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Content-Type: multipart/mixed; boundary="===============1936913612=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1936913612==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Convert logging of errors once from dev_err_once() to drm_err_once().

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 79532b9a324a..ccfb6eb1a29f 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -225,7 +225,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer=
 *fb,
 		drm_fb_xrgb8888_to_rgb565(dst, src, fb, clip, swap);
 		break;
 	default:
-		dev_err_once(fb->dev->dev, "Format is not supported: %s\n",
+		drm_err_once(fb->dev, "Format is not supported: %s\n",
 			     drm_get_format_name(fb->format->format,
 						 &format_name));
 		return -EINVAL;
@@ -295,7 +295,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *f=
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


--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8EpHkACgkQ+gRsbIfe
744s7Q//dlnhywxEYAxmGVUZ1YniixJpFNn6Mvebnv/oUm/1HK3ryCrCLpaE+aZG
/PzqnkGBPg4k8GwlG5ho7pcQaEo74iWw0SuBnlo7M4MqaZqkB58/+uoD1CKTeQ5M
X62OosJ1jGcrQCAQYKH4vKkStgzPGB0pvByiNfzfVEsNtrWzMoxNnLluaEDOxXFR
IUXreuk+tSEmidaXWx+zXxo0E85VHTCHtiLK1EeDUPDBX70ErcfIXyHZxWMbwP3F
KqHJIaRQZ62J8t/TzB5KNROraZiB+9/glg8qK43YcK3TUOJJn0zjCOdKDeTcUz+z
R0qVsLta3bpd2BUxyA6uVQjfSxi/f9LKHF5692fSw+oE+yeALL90q4ZIj/6z/NRs
xLzg8GEu5KA2+fUFXZos0q5DZnt0kB/iYqs7sJTgh6Gc7qBBPgNjWzXkd8Qk2oKJ
FYG3ieO8HFXgEuB+aYz3FgZS/sv7ygwG9BbJvwFY3JI2fqlxZJKK1knu3TBSRwwz
eUWQrtiwcbhePCu9lRSmuXM/v0tiHE6QzEV0LrPlTeC6rqHZG3p37y/s7KWkECWd
DiGShUhbRUuUBilYvJC86YcwM8Q/1O9chJrSLAkLUCEcDAwiXMPeLDzszxVx/dPe
3YRAAttDmeuwuRj0afn8wSimBTiduB9bnurGCZddgadYZgU4A8c=
=zKPq
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--

--===============1936913612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1936913612==--
