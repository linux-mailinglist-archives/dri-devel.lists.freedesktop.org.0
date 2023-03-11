Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6846B5BFC
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 13:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83E910E1DF;
	Sat, 11 Mar 2023 12:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B278F10E196
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 12:52:02 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PYjVV2CNrz9t60;
 Sat, 11 Mar 2023 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1678539122; bh=EU/oFBOVUgpw36DyJScG2/NMtHZZRKuBKPrQ8vjoLDE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CIb1I803aiTr0kCfAhW70cebsXj8FVnB/yd4aZ26d6vcY48p/NyFND4hH5Ar1lSJj
 dKQYbjGF4+Nwx0KeM4g+sO7hRxs2+ruIIa3lYKNmZJegPLxYZ5EzH7KLuxE3ey1Pkn
 7/4IlU5c/GGk8uKKbze4SqKG3/DibFBDzrvZNQ10=
X-Riseup-User-ID: DEB316794C0594CD4721FDBE013A3145FDD28066446E4AA964B9690195C698A5
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4PYjVR5DSfz5vW0;
 Sat, 11 Mar 2023 12:51:59 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/format-helper: Make "destination_pitch" test case
 usable for the monochrome case
Date: Sat, 11 Mar 2023 09:51:41 -0300
Message-Id: <20230311125141.564801-3-arthurgrillo@riseup.net>
In-Reply-To: <20230311125141.564801-1-arthurgrillo@riseup.net>
References: <20230311125141.564801-1-arthurgrillo@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, javierm@redhat.com,
 mairacanal@riseup.net, tzimmermann@suse.de, jose.exposito89@gmail.com,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This test case uses an arbitrary pitch size, different of the default
one, to test if the conversions methods obey.

Change the "destination_pitch" colors to change the monochrome expected
result from being just zeros, as this makes the arbitrary pitch use
unusable.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 78 +++++++++----------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 041b3d2f100f..bfa47f8ffd09 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -323,104 +323,104 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 		.pitch = 3 * 4,
 		.clip = DRM_RECT_INIT(0, 0, 3, 3),
 		.xrgb8888 = {
-			0xA10E449C, 0xB1114D05, 0xC1A80303,
-			0xD16C7073, 0xA20E449C, 0xB2114D05,
-			0xC2A80303, 0xD26C7073, 0xA30E449C,
+			0xA10E449C, 0xB1114D05, 0xC1A8F303,
+			0xD16CF073, 0xA20E449C, 0xB2114D05,
+			0xC2A80303, 0xD26CF073, 0xA30E449C,
 		},
 		.gray8_result = {
 			.dst_pitch = 5,
 			.expected = {
-				0x3C, 0x33, 0x34, 0x00, 0x00,
-				0x6F, 0x3C, 0x33, 0x00, 0x00,
-				0x34, 0x6F, 0x3C, 0x00, 0x00,
+				0x3C, 0x33, 0xC4, 0x00, 0x00,
+				0xBB, 0x3C, 0x33, 0x00, 0x00,
+				0x34, 0xBB, 0x3C, 0x00, 0x00,
 			},
 		},
 		.rgb332_result = {
 			.dst_pitch = 5,
 			.expected = {
-				0x0A, 0x08, 0xA0, 0x00, 0x00,
-				0x6D, 0x0A, 0x08, 0x00, 0x00,
-				0xA0, 0x6D, 0x0A, 0x00, 0x00,
+				0x0A, 0x08, 0xBC, 0x00, 0x00,
+				0x7D, 0x0A, 0x08, 0x00, 0x00,
+				0xA0, 0x7D, 0x0A, 0x00, 0x00,
 			},
 		},
 		.rgb565_result = {
 			.dst_pitch = 10,
 			.expected = {
-				0x0A33, 0x1260, 0xA800, 0x0000, 0x0000,
-				0x6B8E, 0x0A33, 0x1260, 0x0000, 0x0000,
-				0xA800, 0x6B8E, 0x0A33, 0x0000, 0x0000,
+				0x0A33, 0x1260, 0xAF80, 0x0000, 0x0000,
+				0x6F8E, 0x0A33, 0x1260, 0x0000, 0x0000,
+				0xA800, 0x6F8E, 0x0A33, 0x0000, 0x0000,
 			},
 			.expected_swab = {
-				0x330A, 0x6012, 0x00A8, 0x0000, 0x0000,
-				0x8E6B, 0x330A, 0x6012, 0x0000, 0x0000,
-				0x00A8, 0x8E6B, 0x330A, 0x0000, 0x0000,
+				0x330A, 0x6012, 0x80AF, 0x0000, 0x0000,
+				0x8E6F, 0x330A, 0x6012, 0x0000, 0x0000,
+				0x00A8, 0x8E6F, 0x330A, 0x0000, 0x0000,
 			},
 		},
 		.xrgb1555_result = {
 			.dst_pitch = 10,
 			.expected = {
-				0x0513, 0x0920, 0x5400, 0x0000, 0x0000,
-				0x35CE, 0x0513, 0x0920, 0x0000, 0x0000,
-				0x5400, 0x35CE, 0x0513, 0x0000, 0x0000,
+				0x0513, 0x0920, 0x57C0, 0x0000, 0x0000,
+				0x37CE, 0x0513, 0x0920, 0x0000, 0x0000,
+				0x5400, 0x37CE, 0x0513, 0x0000, 0x0000,
 			},
 		},
 		.argb1555_result = {
 			.dst_pitch = 10,
 			.expected = {
-				0x8513, 0x8920, 0xD400, 0x0000, 0x0000,
-				0xB5CE, 0x8513, 0x8920, 0x0000, 0x0000,
-				0xD400, 0xB5CE, 0x8513, 0x0000, 0x0000,
+				0x8513, 0x8920, 0xD7C0, 0x0000, 0x0000,
+				0xB7CE, 0x8513, 0x8920, 0x0000, 0x0000,
+				0xD400, 0xB7CE, 0x8513, 0x0000, 0x0000,
 			},
 		},
 		.rgba5551_result = {
 			.dst_pitch = 10,
 			.expected = {
-				0x0A27, 0x1241, 0xA801, 0x0000, 0x0000,
-				0x6B9D, 0x0A27, 0x1241, 0x0000, 0x0000,
-				0xA801, 0x6B9D, 0x0A27, 0x0000, 0x0000,
+				0x0A27, 0x1241, 0xAF81, 0x0000, 0x0000,
+				0x6F9D, 0x0A27, 0x1241, 0x0000, 0x0000,
+				0xA801, 0x6F9D, 0x0A27, 0x0000, 0x0000,
 			},
 		},
 		.rgb888_result = {
 			.dst_pitch = 15,
 			.expected = {
-				0x9C, 0x44, 0x0E, 0x05, 0x4D, 0x11, 0x03, 0x03, 0xA8,
+				0x9C, 0x44, 0x0E, 0x05, 0x4D, 0x11, 0x03, 0xF3, 0xA8,
 				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-				0x73, 0x70, 0x6C, 0x9C, 0x44, 0x0E, 0x05, 0x4D, 0x11,
+				0x73, 0xF0, 0x6C, 0x9C, 0x44, 0x0E, 0x05, 0x4D, 0x11,
 				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-				0x03, 0x03, 0xA8, 0x73, 0x70, 0x6C, 0x9C, 0x44, 0x0E,
+				0x03, 0x03, 0xA8, 0x73, 0xF0, 0x6C, 0x9C, 0x44, 0x0E,
 				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			},
 		},
 		.argb8888_result = {
 			.dst_pitch = 20,
 			.expected = {
-				0xFF0E449C, 0xFF114D05, 0xFFA80303, 0x00000000, 0x00000000,
-				0xFF6C7073, 0xFF0E449C, 0xFF114D05, 0x00000000, 0x00000000,
-				0xFFA80303, 0xFF6C7073, 0xFF0E449C, 0x00000000, 0x00000000,
+				0xFF0E449C, 0xFF114D05, 0xFFA8F303, 0x00000000, 0x00000000,
+				0xFF6CF073, 0xFF0E449C, 0xFF114D05, 0x00000000, 0x00000000,
+				0xFFA80303, 0xFF6CF073, 0xFF0E449C, 0x00000000, 0x00000000,
 			},
 		},
 		.xrgb2101010_result = {
 			.dst_pitch = 20,
 			.expected = {
-				0x03844672, 0x0444D414, 0x2A20300C, 0x00000000, 0x00000000,
-				0x1B1705CD, 0x03844672, 0x0444D414, 0x00000000, 0x00000000,
-				0x2A20300C, 0x1B1705CD, 0x03844672, 0x00000000, 0x00000000,
+				0x03844672, 0x0444D414, 0x2A2F3C0C, 0x00000000, 0x00000000,
+				0x1B1F0DCD, 0x03844672, 0x0444D414, 0x00000000, 0x00000000,
+				0x2A20300C, 0x1B1F0DCD, 0x03844672, 0x00000000, 0x00000000,
 			},
 		},
 		.argb2101010_result = {
 			.dst_pitch = 20,
 			.expected = {
-				0xC3844672, 0xC444D414, 0xEA20300C, 0x00000000, 0x00000000,
-				0xDB1705CD, 0xC3844672, 0xC444D414, 0x00000000, 0x00000000,
-				0xEA20300C, 0xDB1705CD, 0xC3844672, 0x00000000, 0x00000000,
+				0xC3844672, 0xC444D414, 0xEA2F3C0C, 0x00000000, 0x00000000,
+				0xDB1F0DCD, 0xC3844672, 0xC444D414, 0x00000000, 0x00000000,
+				0xEA20300C, 0xDB1F0DCD, 0xC3844672, 0x00000000, 0x00000000,
 			},
 		},
 		.mono_result = {
 			.dst_pitch = 2,
 			.expected = {
-				0b000, 0b000,
-				0b000, 0b000,
-				0b000, 0b000,
+				0b100, 0b000,
+				0b001, 0b000,
+				0b010, 0b000,
 			},
 		},
 	},
-- 
2.39.2

