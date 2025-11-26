Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62705C88575
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 07:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2286610E514;
	Wed, 26 Nov 2025 06:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="Z/tPye09";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="TJOxnYEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CC910E513;
 Wed, 26 Nov 2025 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764139913; bh=BssbELFqqiAfaHRY+tK0FRe
 AvQAlEWMvvRZcrNJOO/A=; b=Z/tPye09Uc9EH7Lib5u6kSEPCZpVILgwZbfqXjJFIHv3pDQhhn
 pY2gCHVDoNbYSYL0IKG8lD0xEzYeWymuZhOcDGfGTE5ExfPT835qodmLOboT8Vfats26vD+yoRn
 tgAwwTcHBSSwND9T3SYTfJTxJxNJT+r+UBiPTmamlRshw6Xrim7/mYCflHJa5+WJ+Qhatl20mjp
 Ep5Iv/QCdkU2EpPCATgBMyyDzC505olTbpsK50tIOAF7aUuMzhBQ/V/d9HRyPJIeekG/LnjLZDP
 R3TSFrT5EepiStoyw+gVfIIBO5lj/+1a/StTUAptGGJHyXJGxl9kKNx6Q4Y51MUa6Ww==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764139913; bh=BssbELFqqiAfaHRY+tK0FRe
 AvQAlEWMvvRZcrNJOO/A=; b=TJOxnYEWp93zdebRIUqEa9TnTyOEFQk6uaoVm2xA8yXzFwDmmE
 BF4/X5i3NbEh+BLhoEQCr+mjEEcQmPR8AdCg==;
From: Yaroslav Bolyukin <iam@lach.pw>
To: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yaroslav Bolyukin <iam@lach.pw>
Subject: [PATCH v6 5/7] drm/edid: for consistency,
 use mask everywhere for block rev parsing
Date: Wed, 26 Nov 2025 07:51:24 +0100
Message-ID: <20251126065126.54016-6-iam@lach.pw>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251126065126.54016-1-iam@lach.pw>
References: <20251126065126.54016-1-iam@lach.pw>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_displayid_internal.h | 1 +
 drivers/gpu/drm/drm_edid.c               | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
index 724174b429f2..55f972d32847 100644
--- a/drivers/gpu/drm/drm_displayid_internal.h
+++ b/drivers/gpu/drm/drm_displayid_internal.h
@@ -139,6 +139,7 @@ struct displayid_formula_timings_9 {
 	u8 vrefresh;
 } __packed;
 
+#define DISPLAYID_BLOCK_DESCRIPTOR_PAYLOAD_BYTES	GENMASK(6, 4)
 struct displayid_formula_timing_block {
 	struct displayid_block base;
 	struct displayid_formula_timings_9 timings[];
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 72a94b1713e2..7bdc99d5084a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6906,7 +6906,8 @@ static int add_displayid_formula_modes(struct drm_connector *connector,
 	struct drm_display_mode *newmode;
 	int num_modes = 0;
 	bool type_10 = block->tag == DATA_BLOCK_2_TYPE_10_FORMULA_TIMING;
-	int timing_size = 6 + ((formula_block->base.rev & 0x70) >> 4);
+	int timing_size = 6 +
+		FIELD_GET(DISPLAYID_BLOCK_DESCRIPTOR_PAYLOAD_BYTES, formula_block->base.rev);
 
 	/* extended blocks are not supported yet */
 	if (timing_size != 6)
-- 
2.51.2
