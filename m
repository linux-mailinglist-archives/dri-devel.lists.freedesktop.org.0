Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE21BEAB2C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C7210EC92;
	Fri, 17 Oct 2025 16:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="hQXiHEHg";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="lj1oZQFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C577910EC8F;
 Fri, 17 Oct 2025 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760718487; bh=poaIqRqvW/uM6YSuZpkgeWn
 8oXL5zJSPHa0GURysBWg=; b=hQXiHEHgbNGumN4uXpV4/QfOhrrJYnQTiZYptd3kmnbwfH21NV
 gTg+0dehgMMYuRAaaOSxv6zstyW2s4vxzy6bT9Nbgi7r9L4LoHPM4NIjYmP12a/nj1RoXm3kYJJ
 +u+Gr3YqyhkO4cLk8BvVMMhOOzMMJViBphul/+9WLRYkyd+3/HqXHVlRqoIn3tMq/Jgv7R0FTD6
 VZfPM6vYOgZ2bgSzzIOgb+U6x01xPKf0z/CfYWGFxFGNtcW/r78KYt8u+gQhAx5gzB0X02HODpR
 ICpFifwURi85sz8Jnwn2WODzWHugEWQc70p7Y70mXOGK+/2+jq0/7gPea7VKKwRKl/A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760718487; bh=poaIqRqvW/uM6YSuZpkgeWn
 8oXL5zJSPHa0GURysBWg=; b=lj1oZQFjZZbnx7CmhOCMZqlySVx9AnTa8jFvbWHCJ+IetpHg0F
 rwQ4t8cbVg1AUpFWpoBUHuDkKCAHdCovqiCA==;
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
Subject: [PATCH v5 5/7] drm/edid: for consistency,
 use mask everywhere for block rev parsing
Date: Fri, 17 Oct 2025 18:27:34 +0200
Message-ID: <20251017162736.45368-6-iam@lach.pw>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017162736.45368-1-iam@lach.pw>
References: <20251017162736.45368-1-iam@lach.pw>
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
index 8ea20b1c6921..38f9d628e2d6 100644
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
index a1dc4331c4cb..4fa39989e446 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6903,7 +6903,8 @@ static int add_displayid_formula_modes(struct drm_connector *connector,
 	struct drm_display_mode *newmode;
 	int num_modes = 0;
 	bool type_10 = block->tag == DATA_BLOCK_2_TYPE_10_FORMULA_TIMING;
-	int timing_size = 6 + ((formula_block->base.rev & 0x70) >> 4);
+	int timing_size = 6 +
+		FIELD_GET(DISPLAYID_BLOCK_DESCRIPTOR_PAYLOAD_BYTES, formula_block->base.rev);
 
 	/* extended blocks are not supported yet */
 	if (timing_size != 6)
-- 
2.51.0
