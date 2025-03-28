Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79119A74517
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 09:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED6610E998;
	Fri, 28 Mar 2025 08:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nppct.ru header.i=@nppct.ru header.b="K94onynM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 489 seconds by postgrey-1.36 at gabe;
 Fri, 28 Mar 2025 05:33:56 UTC
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD6F10E16E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 05:33:56 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 0CEEF1C2440
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 08:25:40 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:to:from:from; s=dkim; t=1743139539; x=
 1744003540; bh=QKLjGWpoY6vF1d2h8C/5Hete+LF1GwTt151HrxzTtW0=; b=K
 94onynMcU5Yd6oxaAmfGN0PKkNNzM6CJnLYGsDuU9ZSZvhLehgy2LZvTtAs0Gfdg
 JVuBBc1cNuFQW5jr9RpxhcX/iYzwjYCm1z/ufxktv3UB3uXu5B4cEQTI/AEu40zy
 Pi/Ah7bLh93cmLlTiGBN090YHBOTlN1yUQIBn6u9FM=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jCamqpyRqhzw for <dri-devel@lists.freedesktop.org>;
 Fri, 28 Mar 2025 08:25:39 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
 by mail.nppct.ru (Postfix) with ESMTPSA id B42BE1C242C;
 Fri, 28 Mar 2025 08:25:25 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Alex Hung <alex.hung@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Subject: [PATCH 5.10/5.15/6.1] drm/amd/display: Avoid overflow assignment in
 link_dp_cts
Date: Fri, 28 Mar 2025 05:25:11 +0000
Message-ID: <20250328052512.1206068-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Mar 2025 08:10:26 +0000
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

From: Alex Hung <alex.hung@amd.com>

commit a15268787b79fd183dd526cc16bec9af4f4e49a1 upstream.

sampling_rate is an uint8_t but is assigned an unsigned int, and thus it
can overflow. As a result, sampling_rate is changed to uint32_t.

Similarly, LINK_QUAL_PATTERN_SET has a size of 2 bits, and it should
only be assigned to a value less or equal than 4.

This fixes 2 INTEGER_OVERFLOW issues reported by Coverity.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[ Alexey Nepomnyashih: backport fix dc_link_dp_set_test_pattern()
 to dc_link_dp.c. ]
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 3 ++-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h     | 2 +-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h  | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 82b747c0ed69..4a70cbd05bd9 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -6159,7 +6159,8 @@ bool dc_link_dp_set_test_pattern(
 			core_link_read_dpcd(link, DP_TRAINING_PATTERN_SET,
 					    &training_pattern.raw,
 					    sizeof(training_pattern));
-			training_pattern.v1_3.LINK_QUAL_PATTERN_SET = pattern;
+			if (pattern <= PHY_TEST_PATTERN_END_DP11)
+				training_pattern.v1_3.LINK_QUAL_PATTERN_SET = pattern;
 			core_link_write_dpcd(link, DP_TRAINING_PATTERN_SET,
 					     &training_pattern.raw,
 					     sizeof(training_pattern));
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index 296793d8b2bf..6703be2fc157 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -715,7 +715,7 @@ struct dp_audio_test_data_flags {
 struct dp_audio_test_data {
 
 	struct dp_audio_test_data_flags flags;
-	uint8_t sampling_rate;
+	uint32_t sampling_rate;
 	uint8_t channel_count;
 	uint8_t pattern_type;
 	uint8_t pattern_period[8];
diff --git a/drivers/gpu/drm/amd/display/include/dpcd_defs.h b/drivers/gpu/drm/amd/display/include/dpcd_defs.h
index b2df07f9e91c..1b073e9e7b11 100644
--- a/drivers/gpu/drm/amd/display/include/dpcd_defs.h
+++ b/drivers/gpu/drm/amd/display/include/dpcd_defs.h
@@ -76,6 +76,7 @@ enum dpcd_phy_test_patterns {
 	PHY_TEST_PATTERN_D10_2,
 	PHY_TEST_PATTERN_SYMBOL_ERROR,
 	PHY_TEST_PATTERN_PRBS7,
+	PHY_TEST_PATTERN_END_DP11 = PHY_TEST_PATTERN_PRBS7,
 	PHY_TEST_PATTERN_80BIT_CUSTOM,/* For DP1.2 only */
 	PHY_TEST_PATTERN_CP2520_1,
 	PHY_TEST_PATTERN_CP2520_2,
-- 
2.43.0

