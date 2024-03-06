Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C25A874100
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3231134FA;
	Wed,  6 Mar 2024 20:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="JZYrCyhu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABA31134F9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:03:46 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Tqk012NgDzDq8y;
 Wed,  6 Mar 2024 20:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709755425; bh=aJDZ4Vxhj0c8mxaTvf8OfzINnVswHkVDwaZ4BftVAO0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JZYrCyhuwaxxvwBmTWhTbdwqX+yxQfSBhbOKo8LCyht1hV3D+3qC0oaNLnJIHVnn9
 k3El+VABMgfJlqtz/QhtvkSlofZ7N6hdiNS7EU0pQOB3j+5UfOhNBBdvY4pcOSPCvC
 jR9rUVynAMVSt7YuhVcjbD+sNJtXdQmQV4V0LGJo=
X-Riseup-User-ID: DADEB8FF0353ACC6617D59334D8182D0B118D71F27E0E6AC0D010F7BF29A0ECC
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Tqjzw1r4LzFvr9;
 Wed,  6 Mar 2024 20:03:40 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Wed, 06 Mar 2024 17:03:10 -0300
Subject: [PATCH 3/7] drm/vkmm: Use drm_fixed api
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-louis-vkms-conv-v1-3-5bfe7d129fdd@riseup.net>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
In-Reply-To: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com
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

With the new 32.32 values it makes more sense to use drm_fixed functions
than trying to recreate the wheel.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 54 +++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 55ed3f598bd7..adde53cdea26 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -191,32 +191,34 @@ VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
 						  struct conversion_matrix *matrix)
 {
 	u8 r, g, b;
-	s64 y_16, cb_16, cr_16;
-	s64 r_16, g_16, b_16;
-
-	y_16 = y - matrix->y_offset;
-	cb_16 = cb - 128;
-	cr_16 = cr - 128;
-
-	r_16 = matrix->matrix[0][0] * y_16 + matrix->matrix[0][1] * cb_16 +
-	       matrix->matrix[0][2] * cr_16;
-	g_16 = matrix->matrix[1][0] * y_16 + matrix->matrix[1][1] * cb_16 +
-	       matrix->matrix[1][2] * cr_16;
-	b_16 = matrix->matrix[2][0] * y_16 + matrix->matrix[2][1] * cb_16 +
-	       matrix->matrix[2][2] * cr_16;
-
-	// rounding the values
-	r_16 = r_16 + (1LL << (CONVERSION_MATRIX_FLOAT_DEPTH - 4));
-	g_16 = g_16 + (1LL << (CONVERSION_MATRIX_FLOAT_DEPTH - 4));
-	b_16 = b_16 + (1LL << (CONVERSION_MATRIX_FLOAT_DEPTH - 4));
-
-	r_16 = clamp(r_16, 0, (1LL << (CONVERSION_MATRIX_FLOAT_DEPTH + 8)) - 1);
-	g_16 = clamp(g_16, 0, (1LL << (CONVERSION_MATRIX_FLOAT_DEPTH + 8)) - 1);
-	b_16 = clamp(b_16, 0, (1LL << (CONVERSION_MATRIX_FLOAT_DEPTH + 8)) - 1);
-
-	r = r_16 >> CONVERSION_MATRIX_FLOAT_DEPTH;
-	g = g_16 >> CONVERSION_MATRIX_FLOAT_DEPTH;
-	b = b_16 >> CONVERSION_MATRIX_FLOAT_DEPTH;
+	s64 fp_y, fp_cb, fp_cr;
+	s64 fp_r, fp_g, fp_b;
+
+	fp_y = y - matrix->y_offset;
+	fp_cb = cb - 128;
+	fp_cr = cr - 128;
+
+	fp_y = drm_int2fixp(fp_y);
+	fp_cb = drm_int2fixp(fp_cb);
+	fp_cr = drm_int2fixp(fp_cr);
+
+	fp_r = drm_fixp_mul(matrix->matrix[0][0], fp_y) +
+	       drm_fixp_mul(matrix->matrix[0][1], fp_cb) +
+	       drm_fixp_mul(matrix->matrix[0][2], fp_cr);
+	fp_g = drm_fixp_mul(matrix->matrix[1][0], fp_y) +
+	       drm_fixp_mul(matrix->matrix[1][1], fp_cb) +
+	       drm_fixp_mul(matrix->matrix[1][2], fp_cr);
+	fp_b = drm_fixp_mul(matrix->matrix[2][0], fp_y) +
+	       drm_fixp_mul(matrix->matrix[2][1], fp_cb) +
+	       drm_fixp_mul(matrix->matrix[2][2], fp_cr);
+
+	fp_r = drm_fixp2int_round(fp_r);
+	fp_g = drm_fixp2int_round(fp_g);
+	fp_b = drm_fixp2int_round(fp_b);
+
+	r = clamp(fp_r, 0, 0xff);
+	g = clamp(fp_g, 0, 0xff);
+	b = clamp(fp_b, 0, 0xff);
 
 	return argb_u16_from_u8888(255, r, g, b);
 }

-- 
2.43.0

