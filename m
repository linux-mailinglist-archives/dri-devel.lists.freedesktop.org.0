Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F31D64FF79
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE1410E1C3;
	Sun, 18 Dec 2022 16:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F91610E1C1;
 Sun, 18 Dec 2022 16:02:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B7E360C58;
 Sun, 18 Dec 2022 16:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB11C433EF;
 Sun, 18 Dec 2022 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379376;
 bh=cKcs5UaNh9wdeK8ZKEnxZS5PGWlb87e1zZzIcQ7tstg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jGLZYr0OnJ6j5+InjrzcV8oRH7aX2lZO8pG/Phd8ajxADlhOYGGiExoMz6p+Vvoi5
 UBwZi7a6dH7GgXQmH8SjnKtYSQFen81CHav5Gh+J8GyYqRbgC9kj4ypkCOs7c9NEDu
 ssSmU6vPvOkashwIoHIQBPfe/W6BAgDfgS34/MXZ/QEwKJ1wpa1rsN5GVcNCtoVlXQ
 8FenuR4oCcP6gmssaBuzNgLyzwJRT6vPt8p0tKcsmLFWsC6b2bOHL8EaxbiZHLRifQ
 tY2DWLlpCJV2K7kLhvuNF7uK3T+u3hbR4yZiFHRGlYZ92Gj9q38IfTxHMhKNG2Ulq7
 k+GqVgkYCvTEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 15/85] Revert "drm/amd/display: Limit max DSC
 target bpp for specific monitors"
Date: Sun, 18 Dec 2022 11:00:32 -0500
Message-Id: <20221218160142.925394-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160142.925394-1-sashal@kernel.org>
References: <20221218160142.925394-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, ian.chen@amd.com, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, Jerry.Zuo@amd.com,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne.Lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 colin.i.king@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hamza Mahfooz <hamza.mahfooz@amd.com>

[ Upstream commit 6803dfd3a69ccb318772463a86e40929fd4fbac7 ]

This reverts commit 55eea8ef98641f6e1e1c202bd3a49a57c1dd4059.

This quirk is now handled in the DRM core, so we can drop all of
the internal code that was added to handle it.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 35 -------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index f0b01c8dc4a6..f72c013d3a5b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -42,39 +42,6 @@
 #include "dm_helpers.h"
 #include "ddc_service_types.h"
 
-struct monitor_patch_info {
-	unsigned int manufacturer_id;
-	unsigned int product_id;
-	void (*patch_func)(struct dc_edid_caps *edid_caps, unsigned int param);
-	unsigned int patch_param;
-};
-static void set_max_dsc_bpp_limit(struct dc_edid_caps *edid_caps, unsigned int param);
-
-static const struct monitor_patch_info monitor_patch_table[] = {
-{0x6D1E, 0x5BBF, set_max_dsc_bpp_limit, 15},
-{0x6D1E, 0x5B9A, set_max_dsc_bpp_limit, 15},
-};
-
-static void set_max_dsc_bpp_limit(struct dc_edid_caps *edid_caps, unsigned int param)
-{
-	if (edid_caps)
-		edid_caps->panel_patch.max_dsc_target_bpp_limit = param;
-}
-
-static int amdgpu_dm_patch_edid_caps(struct dc_edid_caps *edid_caps)
-{
-	int i, ret = 0;
-
-	for (i = 0; i < ARRAY_SIZE(monitor_patch_table); i++)
-		if ((edid_caps->manufacturer_id == monitor_patch_table[i].manufacturer_id)
-			&&  (edid_caps->product_id == monitor_patch_table[i].product_id)) {
-			monitor_patch_table[i].patch_func(edid_caps, monitor_patch_table[i].patch_param);
-			ret++;
-		}
-
-	return ret;
-}
-
 /* dm_helpers_parse_edid_caps
  *
  * Parse edid caps
@@ -149,8 +116,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	kfree(sads);
 	kfree(sadb);
 
-	amdgpu_dm_patch_edid_caps(edid_caps);
-
 	return result;
 }
 
-- 
2.35.1

