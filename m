Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2401988DD99
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344AC10FACE;
	Wed, 27 Mar 2024 12:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PEeYUfDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEDA10FAD6;
 Wed, 27 Mar 2024 12:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 142D7614CD;
 Wed, 27 Mar 2024 12:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76BE4C433F1;
 Wed, 27 Mar 2024 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541389;
 bh=rkdqF7LbDGTK3X3bGgq1lZqzEgq6frDciqHqmJHSVFE=;
 h=From:To:Cc:Subject:Date:From;
 b=PEeYUfDZFfiTM10t+qw9YZ8vxq+SkVeQzgfudLdPe84DhQ5WI5Uq578xdZlgjxZt/
 YEXi7PONMuUh8AGhRie/TmCXOg01NB15Zk92Ntlkt6PAdvhLczhoSAxuOfCZyy0yae
 +KMGWnAkGG+DwtPYWhrQPqVXN7KkX8XZez+xVUKAk8DigWIRI6SBczyfaQlIy5WDQn
 MigzVnZdfi3/ysDbqJE+G3r/8q9J075SPQiNKl80t5ZmaCz5SSLiRD5ybIck+Epw3l
 IHbBY9Ie9gGBJQDEHYFkBf8o8uACK+Wj22dsIlGeSshKX8mdJM4/5x+GxLTzmrZFF7
 0qXP3xe0e/ynA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	ilya.bakoulin@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Clear OPTC mem select on disable"
 failed to apply to 6.6-stable tree
Date: Wed, 27 Mar 2024 08:09:47 -0400
Message-ID: <20240327120947.2827350-1-sashal@kernel.org>
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

The patch below does not apply to the 6.6-stable tree.
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




