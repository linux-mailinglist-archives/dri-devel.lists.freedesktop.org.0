Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820F1A4E11D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F6B10E5FA;
	Tue,  4 Mar 2025 14:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WnnqUW7W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD6810E5F7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:36:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06406442E6;
 Tue,  4 Mar 2025 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741098995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=itW/Kdo3+beQ75wEt1HlHRfjEyJMbCzo+HOagsl1x3c=;
 b=WnnqUW7WrPa44nGffs7tuZGvKYME1C+0FYDIzwKbEvWTjI5gojVBY/T55BZUwYc9XTdbdX
 n0gCKLRVU8LIC2Ha0jUzJ0qR2vUlkibvp3Y2+WWRswafjleUSoGo32EAxOSFymbYB5dqVC
 OdqJvTzhSIezcVruzy6DEA+h/6zfZ5dXUYFTTSbnL8mC2GlVkK1j9pt5qYp00zcqBl/ziX
 5qOrobAnfn01Li9+7T1lyF9ICigs9BrUlAho+yLLfNuJk5n7sXjkx7q769Bcf3+xSFvvU7
 /+di/U29QY9D37u9buhXp5YwBFFvqjf/b9WOcs/8Y3DaQs//DMSzmiB4VZ+m3Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 04 Mar 2025 15:36:29 +0100
Subject: [PATCH libdrm 1/2] util: Add option to change the color for plain
 pattern
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-color-option-v1-1-be521604fbff@bootlin.com>
References: <20250304-color-option-v1-0-be521604fbff@bootlin.com>
In-Reply-To: <20250304-color-option-v1-0-be521604fbff@bootlin.com>
To: dri-devel@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3104;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=sibSiAxJT/m859YBtOQWxFKJ1oNO+vAY85231p1B2rI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnxw/xsMpJjyRfg7IUTHr+8kveMNnijosvrhcGF
 Hahc1j9wGeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ8cP8QAKCRAgrS7GWxAs
 4v53EACu0e8nkk5OFA8PjJ908y64xoNrRJNZTr9Ek239K4ba7a6goNwrrEteTDKlYfB/ovNMPtt
 8n456vP2dHOUxHwL6ujOXFfjQbvU4hvTMhyHHqb1zORkZOMp1hRFAmP+anM6Mc1yUo2ZvRqmeh4
 vMoHdwh3xs6SyLkno1cHubxZMOSbg2E5Dlyi9zwkd9xPfa5aOpPr2uOaC/0aLa4INqPHGz24EQo
 wcqpP8fXX3GpYMTnx/U55852sdZ/C47n7MaXkSiek1fFnZnPoHcpVJrFOaTDF05I0n5ML9xQPZI
 MGUgmmSUkElK+OweTgigt4A+tPcI5CVZgMPgeCIfh4tp2fGq/OiHfd68c8O3HpybFlgW3Sagwvn
 XhUCWGAMRk4ktNfVxpzQX3PDWkmnJKHKnggY+XvYl7o9mIcD/pLPEfbxiyd10KNaqy0YGBTG9fF
 q3lfsu6csFnYcZjukaMgTffBXF7dteEGGWnLdZsWw+V4xXzq4VkbPVGLeIXKAQ5IHg79vprOPMw
 qBfAxqIMwnWsnU2Sd7si9++inkvvgQF1yWL7Fg0Px3QhRcu3L3M2oqwNuSP1onJCr+CM2VYPvWn
 Em9V8zvQrrHvh5e+QeiDUg6rJYRKguamNX+X98O7+Ci5ORn0egGUC5yigSqwRx6MADyYZf3ed9S
 837hfVFooWA7lug==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludejvddrudekrddtrddungdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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

The plain pattern can be useful to debug some color issues. Add an option
to configure the color for the plain pattern.

Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/modetest/buffers.c |  2 +-
 tests/util/pattern.c     | 19 +++++++++++++------
 tests/util/pattern.h     |  1 +
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/tests/modetest/buffers.c b/tests/modetest/buffers.c
index 165b95295644..03a6d424f102 100644
--- a/tests/modetest/buffers.c
+++ b/tests/modetest/buffers.c
@@ -386,7 +386,7 @@ bo_create(int fd, unsigned int format,
 		break;
 	}
 
-	util_fill_pattern(format, pattern, planes, width, height, pitches[0]);
+	util_fill_pattern(format, pattern, 0x38383838, planes, width, height, pitches[0]);
 	bo_unmap(bo);
 
 	return bo;
diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index e5f20c50b5d8..e2847c5457af 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -1719,18 +1719,24 @@ static void fill_tiles(const struct util_format_info *info, void *planes[3],
 
 static void fill_plain(const struct util_format_info *info, void *planes[3],
 		       unsigned int height,
-		       unsigned int stride)
+		       unsigned int stride, unsigned int color)
 {
+	int i;
+	char *p;
+
 	switch (info->format) {
 	case DRM_FORMAT_XRGB16161616F:
 	case DRM_FORMAT_XBGR16161616F:
 	case DRM_FORMAT_ARGB16161616F:
 	case DRM_FORMAT_ABGR16161616F:
-		/* 0x3838 = 0.5273 */
-		memset(planes[0], 0x38, stride * height);
-		break;
 	default:
-		memset(planes[0], 0x77, stride * height);
+		for (i = 0; i <  height * stride; i += 4) {
+			int j;
+
+			p = planes[0] + i;
+			for (j = 0; j < 4; j++)
+				p[j] = (color >> (j * 8)) & 0xFF;
+		}
 		break;
 	}
 }
@@ -1862,6 +1868,7 @@ static void fill_gradient(const struct util_format_info *info, void *planes[3],
  * Supported formats vary depending on the selected pattern.
  */
 void util_fill_pattern(uint32_t format, enum util_fill_pattern pattern,
+		       unsigned int color,
 		       void *planes[3], unsigned int width,
 		       unsigned int height, unsigned int stride)
 {
@@ -1879,7 +1886,7 @@ void util_fill_pattern(uint32_t format, enum util_fill_pattern pattern,
 		return fill_smpte(info, planes, width, height, stride);
 
 	case UTIL_PATTERN_PLAIN:
-		return fill_plain(info, planes, height, stride);
+		return fill_plain(info, planes, height, stride, color);
 
 	case UTIL_PATTERN_GRADIENT:
 		return fill_gradient(info, planes, width, height, stride);
diff --git a/tests/util/pattern.h b/tests/util/pattern.h
index e500aba3b468..23e11c0f58b8 100644
--- a/tests/util/pattern.h
+++ b/tests/util/pattern.h
@@ -36,6 +36,7 @@ enum util_fill_pattern {
 };
 
 void util_fill_pattern(uint32_t format, enum util_fill_pattern pattern,
+		       unsigned int color,
 		       void *planes[3], unsigned int width,
 		       unsigned int height, unsigned int stride);
 

-- 
2.48.1

