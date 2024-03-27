Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E267A88DD23
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0F810FA6E;
	Wed, 27 Mar 2024 12:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R8/UQEVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0A510FA6D;
 Wed, 27 Mar 2024 12:06:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AFC6B61511;
 Wed, 27 Mar 2024 12:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A69DC43390;
 Wed, 27 Mar 2024 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541218;
 bh=+Q15N+AszJCtEVBpLBjor9AZ5fEtsE232l8UHtQEhwc=;
 h=From:To:Cc:Subject:Date:From;
 b=R8/UQEVo7L//iv1f27KjC2f8E4doYjodKUltcxY7o7wOXyiqE4ieev+gHHaPEQfHA
 Mm4deoFRFpQbY+WZHMzcLm0zpKgdqt7qLrpx+J44VPkFVj7rhteARvMwlkLnAFpeZq
 w8LPgr93xgGLUvFrGL+syXQoSTv0wvWEsKFT+ceOpAcieG53H0qrhy6OnC4AQnjUiS
 erNs7zPAkyx7h+HF9w4aEOnBGLQXhEUR7KbtoE8vA7QKBvJT5yO7A6B3WeiB5EgiDY
 Lkb2MAIwlWoDw6XqhPCvMSnSXPiiaADtmznE/ja8zIn/2dzBPXONKNPaRFQEVvl8tW
 yqt3URwjtGLSA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	ilya.bakoulin@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Clear OPTC mem select on disable"
 failed to apply to 6.8-stable tree
Date: Wed, 27 Mar 2024 08:06:56 -0400
Message-ID: <20240327120656.2824902-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 6.8-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From b4e05bb1dec53fe28c3c88425aded824498666e5 Mon Sep 17 00:00:00 2001
From: Ilya Bakoulin <ilya.bakoulin@amd.com>
Date: Wed, 3 Jan 2024 09:42:04 -0500
Subject: [PATCH] drm/amd/display: Clear OPTC mem select on disable

[Why]
Not clearing the memory select bits prior to OPTC disable can cause DSC
corruption issues when attempting to reuse a memory instance for another
OPTC that enables ODM.

[How]
Clear the memory select bits prior to disabling an OPTC.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Ilya Bakoulin <ilya.bakoulin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c | 3 +++
 drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
index 1788eb29474b4..8234935433254 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
@@ -173,6 +173,9 @@ static bool optc32_disable_crtc(struct timing_generator *optc)
 			OPTC_SEG3_SRC_SEL, 0xf,
 			OPTC_NUM_OF_INPUT_SEGMENT, 0);
 
+	REG_UPDATE(OPTC_MEMORY_CONFIG,
+			OPTC_MEM_SEL, 0);
+
 	/* disable otg request until end of the first line
 	 * in the vertical blank region
 	 */
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
index 3d6c1b2c2b4d6..5b15475088503 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
@@ -145,6 +145,9 @@ static bool optc35_disable_crtc(struct timing_generator *optc)
 			OPTC_SEG3_SRC_SEL, 0xf,
 			OPTC_NUM_OF_INPUT_SEGMENT, 0);
 
+	REG_UPDATE(OPTC_MEMORY_CONFIG,
+			OPTC_MEM_SEL, 0);
+
 	/* disable otg request until end of the first line
 	 * in the vertical blank region
 	 */
-- 
2.43.0




