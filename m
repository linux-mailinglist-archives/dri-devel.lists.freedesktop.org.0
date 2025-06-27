Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275BAEB346
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D37B10E9A3;
	Fri, 27 Jun 2025 09:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GHBKmwEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE98310E9A1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:48:04 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 343A15867F9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:12:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C297E4386C;
 Fri, 27 Jun 2025 09:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751015575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L7fZpMVkmYAEU87VQqXWQO1HeEQH6mE1SXHh1/zzRxw=;
 b=GHBKmwEFxxxUf204Igbit+fVKXB/i4CgSQnqJim+d8BBbCRRn4bEMrftM+fCs4HcQEUf/C
 atBdh9EPgLk/pEu24LhjsKOTf4zi3Q8PR5vl2j7iPBsq3fsw1vpiuHptJhvYb5KFevPkrZ
 VwCrFOvwMTayEPjTHYRZkIUkmsw0q+oNgEFwexLinuHCwuNcDj94dlhxqUr6E6NJVSc4SV
 Hqf6HPDgUfEKUAmxxJHt/k8bW0PE1baKKdeMOkTo1hM1/9tnqROu4Gqmcc8AHRRiNMC8r7
 WhiRJuLUFdNVvQzVhuf6Wul4mmvJpQKzvt+68cO1gaztg0G8A5HAKYoXbUPz6A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 27 Jun 2025 11:12:37 +0200
Subject: [PATCH v5 6/8] drm/vkms: Change YUV helpers to support u16 inputs
 for conversion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-b4-new-color-formats-v5-6-94452f119c72@bootlin.com>
References: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
In-Reply-To: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=18390;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=K3Y7qrKaEMb0Rhv4E+FnFIZvLv3NCLUlzzrFNhA16zM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoXmCNYHMmt5kaoN/HUm0VvTF7KUof8lrELQ2wK
 yiOka+9E/KJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaF5gjQAKCRAgrS7GWxAs
 4v7LEADV3O2HAbD1sPSESWb/TN+eUZkz/EIuPFm0SA0czMi9rmdDMt/S7o/Np+RximayHzGmvFq
 f8ZTaUwlo+fw/7BA0uxbtQuulo/r9Jnzed93nEl1U4dxZh1z5hxal7YBsx3nKv4Q6Kx2oKi0xyW
 UqzSUp8TnazXPyQLhJ7XT04Fpl3AXnq7FNkiy7xgZJ4FjtRxtTocMUXlZeFXXBm2BRSBx5F9gHP
 zQ5e1D4XFUM6HwPPCe7OtrLbnDVwyJ1nV9a5n7YqHvGUD2TBgIp+o6QoJv0sCE2Sud2XCXWah2i
 +WimycKQPVPCIjNRSCqCdkwBSMz4C+10ftp7SqZ9cLVXwO1SGlYOqye4kD1ed4MN29CPRrrexBP
 uxeIr2T76UKCWvokMoSV0THWVd+BVg4/hCLPWTeutsPFzO+CuGO2kzeWm/MaQZtuzHl9hiyZEV6
 HdwuyG4XtATUYBADWCxNSUv0qYhmMLcVqpyIlJk49OhBoQReUiATKtaml6UYjIk2lBj4rTMRx9M
 aeiWdID7Bcd5AMcp48UF5Hb53fHFU/SEZn2S4cg62rtpxi59u/NfhCeRO/AeVCIExjNPneahj5l
 7KL34KmEnNEMR63+jMXCYgW+nxFumoL4GAoU7WN2AP1LZHWhZrEukI6F9tB482vYaFUGmnBeXLM
 qhagvUeIjLuOKFg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelfeekffffkefgffejueejiefhieffleelhedvvdetvdffvdfghefhfeevhedtheenucffohhmrghinheprhgvrgguthhhvgguohgtshdrihhonecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdeijegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepmhgrihhrrggtrghnrghlsehrihhsvghuphdrnhgvthdprhgtphhtthhopehsihhquhgvihhrrgesihhgrghlihgrrdgtohhmpdhrtghpthhtoheprghrthhhuhhrghhrihhllhhosehrihhsvghuphdrnhgvthdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehti
 ihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepjhgvrhgvmhhivgdruggruhhthhgvrhhisggvshessghoohhtlhhinhdrtghomh
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

Some YUV format uses 16 bit values, so change the helper function for
conversion to support those new formats.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 139 +++++++++++++-------------
 drivers/gpu/drm/vkms/vkms_formats.c           |  22 ++--
 drivers/gpu/drm/vkms/vkms_formats.h           |   4 +-
 3 files changed, 84 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
index 2e1daef94831..0ebb5352bb32 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
@@ -14,20 +14,20 @@
 MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 /**
- * struct pixel_yuv_u8 - Internal representation of a pixel color.
- * @y: Luma value, stored in 8 bits, without padding, using
+ * struct pixel_yuv_u16 - Internal representation of a pixel color.
+ * @y: Luma value, stored in 16 bits, without padding, using
  *     machine endianness
- * @u: Blue difference chroma value, stored in 8 bits, without padding, using
+ * @u: Blue difference chroma value, stored in 16 bits, without padding, using
  *     machine endianness
- * @v: Red difference chroma value, stored in 8 bits, without padding, using
+ * @v: Red difference chroma value, stored in 16 bits, without padding, using
  *     machine endianness
  */
-struct pixel_yuv_u8 {
-	u8 y, u, v;
+struct pixel_yuv_u16 {
+	u16 y, u, v;
 };
 
 /*
- * struct yuv_u8_to_argb_u16_case - Reference values to test the color
+ * struct yuv_u16_to_argb_u16_case - Reference values to test the color
  * conversions in VKMS between YUV to ARGB
  *
  * @encoding: Encoding used to convert RGB to YUV
@@ -39,13 +39,13 @@ struct pixel_yuv_u8 {
  * @format_pair.yuv: Same color as @format_pair.rgb, but converted to
  *                   YUV using @encoding and @range.
  */
-struct yuv_u8_to_argb_u16_case {
+struct yuv_u16_to_argb_u16_case {
 	enum drm_color_encoding encoding;
 	enum drm_color_range range;
 	size_t n_colors;
 	struct format_pair {
 		char *name;
-		struct pixel_yuv_u8 yuv;
+		struct pixel_yuv_u16 yuv;
 		struct pixel_argb_u16 argb;
 	} colors[TEST_BUFF_SIZE];
 };
@@ -57,14 +57,14 @@ struct yuv_u8_to_argb_u16_case {
  * For more information got to the docs:
  * https://colour.readthedocs.io/en/master/generated/colour.RGB_to_YCbCr.html
  */
-static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
+static struct yuv_u16_to_argb_u16_case yuv_u16_to_argb_u16_cases[] = {
 	/*
 	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
 	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
 	 *                     in_bits = 16,
 	 *                     in_legal = False,
 	 *                     in_int = True,
-	 *                     out_bits = 8,
+	 *                     out_bits = 16,
 	 *                     out_legal = False,
 	 *                     out_int = True)
 	 *
@@ -76,13 +76,13 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 		.range = DRM_COLOR_YCBCR_FULL_RANGE,
 		.n_colors = 6,
 		.colors = {
-			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
-			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
-			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
-			{ "red",   { 0x4c, 0x55, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
-			{ "green", { 0x96, 0x2c, 0x15 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
-			{ "blue",  { 0x1d, 0xff, 0x6b }, { 0xffff, 0x0000, 0x0000, 0xffff }},
-		},
+			{ "white", { 0xffff, 0x8000, 0x8000 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
+			{ "gray",  { 0x8080, 0x8000, 0x8000 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
+			{ "black", { 0x0000, 0x8000, 0x8000 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
+			{ "red",   { 0x4c8b, 0x54ce, 0xffff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
+			{ "green", { 0x9645, 0x2b33, 0x14d1 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
+			{ "blue",  { 0x1d2f, 0xffff, 0x6b2f }, { 0xffff, 0x0000, 0x0000, 0xffff }},
+		}
 	},
 	/*
 	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
@@ -90,7 +90,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 	 *                     in_bits = 16,
 	 *                     in_legal = False,
 	 *                     in_int = True,
-	 *                     out_bits = 8,
+	 *                     out_bits = 16,
 	 *                     out_legal = True,
 	 *                     out_int = True)
 	 * Tests cases for color conversion generated by converting RGB
@@ -101,13 +101,13 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
 		.n_colors = 6,
 		.colors = {
-			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
-			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
-			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
-			{ "red",   { 0x51, 0x5a, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
-			{ "green", { 0x91, 0x36, 0x22 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
-			{ "blue",  { 0x29, 0xf0, 0x6e }, { 0xffff, 0x0000, 0x0000, 0xffff }},
-		},
+			{ "white", { 0xeb00, 0x8000, 0x8000 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
+			{ "gray",  { 0x7dee, 0x8000, 0x8000 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
+			{ "black", { 0x1000, 0x8000, 0x8000 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
+			{ "red",   { 0x517b, 0x5a34, 0xf000 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
+			{ "green", { 0x908e, 0x35cc, 0x2237 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
+			{ "blue",  { 0x28f7, 0xf000, 0x6dc9 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
+		}
 	},
 	/*
 	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
@@ -115,7 +115,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 	 *                     in_bits = 16,
 	 *                     in_legal = False,
 	 *                     in_int = True,
-	 *                     out_bits = 8,
+	 *                     out_bits = 16,
 	 *                     out_legal = False,
 	 *                     out_int = True)
 	 * Tests cases for color conversion generated by converting RGB
@@ -126,21 +126,21 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 		.range = DRM_COLOR_YCBCR_FULL_RANGE,
 		.n_colors = 6,
 		.colors = {
-			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
-			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
-			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
-			{ "red",   { 0x36, 0x63, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
-			{ "green", { 0xb6, 0x1e, 0x0c }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
-			{ "blue",  { 0x12, 0xff, 0x74 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
-		},
+			{ "white", { 0xffff, 0x8000, 0x8000 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
+			{ "gray",  { 0x8080, 0x8000, 0x8000 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
+			{ "black", { 0x0000, 0x8000, 0x8000 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
+			{ "red",   { 0x366d, 0x62ac, 0xffff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
+			{ "green", { 0xb717, 0x1d55, 0x0bbd }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
+			{ "blue",  { 0x127c, 0xffff, 0x7443 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
+		}
 	},
 	/*
 	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
 	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
 	 *                     in_bits = 16,
-	 *                     int_legal = False,
+	 *                     in_legal = False,
 	 *                     in_int = True,
-	 *                     out_bits = 8,
+	 *                     out_bits = 16,
 	 *                     out_legal = True,
 	 *                     out_int = True)
 	 * Tests cases for color conversion generated by converting RGB
@@ -151,13 +151,13 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
 		.n_colors = 6,
 		.colors = {
-			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
-			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
-			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
-			{ "red",   { 0x3f, 0x66, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
-			{ "green", { 0xad, 0x2a, 0x1a }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
-			{ "blue",  { 0x20, 0xf0, 0x76 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
-		},
+			{ "white", { 0xeb00, 0x8000, 0x8000 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
+			{ "gray",  { 0x7dee, 0x8000, 0x8000 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
+			{ "black", { 0x1000, 0x8000, 0x8000 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
+			{ "red",   { 0x3e8f, 0x6656, 0xf000 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
+			{ "green", { 0xaca1, 0x29aa, 0x1a45 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
+			{ "blue",  { 0x1fd0, 0xf000, 0x75bb }, { 0xffff, 0x0000, 0x0000, 0xffff }},
+		}
 	},
 	/*
 	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
@@ -165,7 +165,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 	 *                     in_bits = 16,
 	 *                     in_legal = False,
 	 *                     in_int = True,
-	 *                     out_bits = 8,
+	 *                     out_bits = 16,
 	 *                     out_legal = False,
 	 *                     out_int = True)
 	 * Tests cases for color conversion generated by converting RGB
@@ -176,13 +176,13 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 		.range = DRM_COLOR_YCBCR_FULL_RANGE,
 		.n_colors = 6,
 		.colors = {
-			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
-			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
-			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
-			{ "red",   { 0x43, 0x5c, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
-			{ "green", { 0xad, 0x24, 0x0b }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
-			{ "blue",  { 0x0f, 0xff, 0x76 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
-		},
+			{ "white", { 0xffff, 0x8000, 0x8000 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
+			{ "gray",  { 0x8080, 0x8000, 0x8000 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
+			{ "black", { 0x0000, 0x8000, 0x8000 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
+			{ "red",   { 0x4340, 0x5c41, 0xffff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
+			{ "green", { 0xad91, 0x23bf, 0x0a4c }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
+			{ "blue",  { 0x0f2e, 0xffff, 0x75b5 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
+		}
 	},
 	/*
 	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
@@ -190,7 +190,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 	 *                     in_bits = 16,
 	 *                     in_legal = False,
 	 *                     in_int = True,
-	 *                     out_bits = 8,
+	 *                     out_bits = 16,
 	 *                     out_legal = True,
 	 *                     out_int = True)
 	 * Tests cases for color conversion generated by converting RGB
@@ -201,32 +201,32 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
 		.n_colors = 6,
 		.colors = {
-			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
-			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
-			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
-			{ "red",   { 0x4a, 0x61, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
-			{ "green", { 0xa4, 0x2f, 0x19 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
-			{ "blue",  { 0x1d, 0xf0, 0x77 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
-		},
+			{ "white", { 0xeb00, 0x8000, 0x8000 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
+			{ "gray",  { 0x7dee, 0x8000, 0x8000 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
+			{ "black", { 0x1000, 0x8000, 0x8000 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
+			{ "red",   { 0x4988, 0x60b9, 0xf000 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
+			{ "green", { 0xa47b, 0x2f47, 0x1902 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
+			{ "blue",  { 0x1cfd, 0xf000, 0x76fe }, { 0xffff, 0x0000, 0x0000, 0xffff }},
+		}
 	},
 };
 
 /*
- * vkms_format_test_yuv_u8_to_argb_u16 - Testing the conversion between YUV
+ * vkms_format_test_yuv_u16_to_argb_u16 - Testing the conversion between YUV
  * colors to ARGB colors in VKMS
  *
  * This test will use the functions get_conversion_matrix_to_argb_u16 and
  * argb_u16_from_yuv888 to convert YUV colors (stored in
- * yuv_u8_to_argb_u16_cases) into ARGB colors.
+ * yuv_u16_to_argb_u16_cases) into ARGB colors.
  *
  * The conversion between YUV and RGB is not totally reversible, so there may be
  * some difference between the expected value and the result.
  * In addition, there may be some rounding error as the input color is 8 bits
  * and output color is 16 bits.
  */
-static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
+static void vkms_format_test_yuv_u16_to_argb_u16(struct kunit *test)
 {
-	const struct yuv_u8_to_argb_u16_case *param = test->param_value;
+	const struct yuv_u16_to_argb_u16_case *param = test->param_value;
 	struct pixel_argb_u16 argb;
 
 	for (size_t i = 0; i < param->n_colors; i++) {
@@ -236,7 +236,8 @@ static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
 		get_conversion_matrix_to_argb_u16
 			(DRM_FORMAT_NV12, param->encoding, param->range, &matrix);
 
-		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, &matrix);
+		argb = argb_u16_from_yuv161616(&matrix, color->yuv.y, color->yuv.u,
+					       color->yuv.v);
 
 		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.a, color->argb.a), 0x1ff,
 				    "On the A channel of the color %s expected 0x%04x, got 0x%04x",
@@ -253,19 +254,19 @@ static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
 	}
 }
 
-static void vkms_format_test_yuv_u8_to_argb_u16_case_desc(struct yuv_u8_to_argb_u16_case *t,
-							  char *desc)
+static void vkms_format_test_yuv_u16_to_argb_u16_case_desc(struct yuv_u16_to_argb_u16_case *t,
+							   char *desc)
 {
 	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s - %s",
 		 drm_get_color_encoding_name(t->encoding), drm_get_color_range_name(t->range));
 }
 
-KUNIT_ARRAY_PARAM(yuv_u8_to_argb_u16, yuv_u8_to_argb_u16_cases,
-		  vkms_format_test_yuv_u8_to_argb_u16_case_desc
+KUNIT_ARRAY_PARAM(yuv_u16_to_argb_u16, yuv_u16_to_argb_u16_cases,
+		  vkms_format_test_yuv_u16_to_argb_u16_case_desc
 );
 
 static struct kunit_case vkms_format_test_cases[] = {
-	KUNIT_CASE_PARAM(vkms_format_test_yuv_u8_to_argb_u16, yuv_u8_to_argb_u16_gen_params),
+	KUNIT_CASE_PARAM(vkms_format_test_yuv_u16_to_argb_u16, yuv_u16_to_argb_u16_gen_params),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 5b50e8622521..03eb73f4caef 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -269,16 +269,17 @@ static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
 	return out_pixel;
 }
 
-VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
-							    const struct conversion_matrix *matrix)
+VISIBLE_IF_KUNIT
+struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
+					      u16 y, u16 channel_1, u16 channel_2)
 {
 	u16 r, g, b;
 	s64 fp_y, fp_channel_1, fp_channel_2;
 	s64 fp_r, fp_g, fp_b;
 
-	fp_y = drm_int2fixp(((int)y - matrix->y_offset) * 257);
-	fp_channel_1 = drm_int2fixp(((int)channel_1 - 128) * 257);
-	fp_channel_2 = drm_int2fixp(((int)channel_2 - 128) * 257);
+	fp_y = drm_int2fixp((int)y - matrix->y_offset * 257);
+	fp_channel_1 = drm_int2fixp((int)channel_1 - 128 * 257);
+	fp_channel_2 = drm_int2fixp((int)channel_2 - 128 * 257);
 
 	fp_r = drm_fixp_mul(matrix->matrix[0][0], fp_y) +
 	       drm_fixp_mul(matrix->matrix[0][1], fp_channel_1) +
@@ -300,7 +301,7 @@ VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1,
 
 	return argb_u16_from_u16161616(0xffff, r, g, b);
 }
-EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
+EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv161616);
 
 /**
  * READ_LINE() - Generic generator for a read_line function which can be used for format with one
@@ -492,8 +493,8 @@ static void semi_planar_yuv_read_line(const struct vkms_plane_state *plane, int
 	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
 
 	for (int i = 0; i < count; i++) {
-		*out_pixel = argb_u16_from_yuv888(y_plane[0], uv_plane[0], uv_plane[1],
-						  conversion_matrix);
+		*out_pixel = argb_u16_from_yuv161616(conversion_matrix, y_plane[0] * 257,
+						     uv_plane[0] * 257, uv_plane[1] * 257);
 		out_pixel += 1;
 		y_plane += step_y;
 		if ((i + subsampling_offset + 1) % subsampling == 0)
@@ -537,8 +538,9 @@ static void planar_yuv_read_line(const struct vkms_plane_state *plane, int x_sta
 	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
 
 	for (int i = 0; i < count; i++) {
-		*out_pixel = argb_u16_from_yuv888(*y_plane, *channel_1_plane, *channel_2_plane,
-						  conversion_matrix);
+		*out_pixel = argb_u16_from_yuv161616(conversion_matrix,
+						     *y_plane * 257, *channel_1_plane * 257,
+						     *channel_2_plane * 257);
 		out_pixel += 1;
 		y_plane += step_y;
 		if ((i + subsampling_offset + 1) % subsampling == 0) {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index b4fe62ab9c65..eeb208cdd6b1 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -14,8 +14,8 @@ void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encod
 				       struct conversion_matrix *matrix);
 
 #if IS_ENABLED(CONFIG_KUNIT)
-struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
-					   const struct conversion_matrix *matrix);
+struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
+					      u16 y, u16 channel_1, u16 channel_2);
 #endif
 
 #endif /* _VKMS_FORMATS_H_ */

-- 
2.49.0

