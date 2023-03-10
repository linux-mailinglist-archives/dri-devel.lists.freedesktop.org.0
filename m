Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDB76B5176
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 21:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481C510E33E;
	Fri, 10 Mar 2023 20:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A4F10E33E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 20:09:28 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PYHFh00r7zDq78;
 Fri, 10 Mar 2023 20:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1678478968; bh=irf73HML+0H9U7LgnXDd2lN1EprFhUw/kh+jMph6nq0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rYbAvmShSJClDUE2MOush/4I1TVlmbWdLkWra2eEn+Z3kW4Af9DtngeG/xhWt0aC3
 hEGFJH5OFxmXD3JrDX27a2df829PnvMR9e/HKpynlp9naDBZO6diI4hEXn0h01EWhT
 S1RJq4xmydTLS841JXPUNGEEygmxPCOKAhvLd/1A=
X-Riseup-User-ID: 7DADD0E63C6D11ABF869A7B0EBB3C9AE2F6F40B2F3E6EB69AD96EB3B47812C88
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PYHFd2FLTz1yPW;
 Fri, 10 Mar 2023 20:09:25 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/format-helper: Make "destination_pitch" test case
 usable for the monochrome case
Date: Fri, 10 Mar 2023 17:09:01 -0300
Message-Id: <20230310200901.216971-3-arthurgrillo@riseup.net>
In-Reply-To: <20230310200901.216971-1-arthurgrillo@riseup.net>
References: <20230310200901.216971-1-arthurgrillo@riseup.net>
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
index 00f7acd54828..5cc721655d28 100644
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
-				!BIT(0) | !BIT(1) | !BIT(2), 0x00,
-				!BIT(0) | !BIT(1) | !BIT(2), 0x00,
-				!BIT(0) | !BIT(1) | !BIT(2), 0x00,
+				!BIT(0) | !BIT(1) | BIT(2), 0x00,
+				BIT(0) | !BIT(1) | !BIT(2), 0x00,
+				!BIT(0) | BIT(1) | !BIT(2), 0x00,
 			},
 		},
 	},
-- 
2.39.2

