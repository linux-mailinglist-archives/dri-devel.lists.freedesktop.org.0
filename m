Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB2088DE2E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664CB10FB45;
	Wed, 27 Mar 2024 12:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RscrJ9xR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B86910FB37;
 Wed, 27 Mar 2024 12:14:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A3F086150C;
 Wed, 27 Mar 2024 12:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755CBC433F1;
 Wed, 27 Mar 2024 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541650;
 bh=X7l99WhoB2MTgcPR++Lj4wqVxklSCBuzWJMFmG/1UXs=;
 h=From:To:Cc:Subject:Date:From;
 b=RscrJ9xR90Tk1daZJoJ06CLy7j4o7caNmhBa/uQURC1ihtZPMFnB6aG1IgXLBpHJy
 HcGdE3e8ei4tBfVZgvxmLX+o97qoIgYriAro7wRks3aV30LPVgSMkOzeEYCQGDyyju
 kaA0rAr1/epW8C3xhplUuSf1Wy+KpHi5DWKaTKKAFMXRaNxjvUWy4irTlYeB0zbX30
 MHiEtn2bKSJ65sfAGn61tSZcK7R9UJaRbEHQsVQvJ3thfCw5yaI0dOjZu4T0rPcWfn
 xd4jaJJ9H1qymzXo5GyUUGz5X3xQEWuZCG1cV1LYVkpeEV/NUR1oOwa1KAA9clKC3m
 VrWaMXZXjS+Mg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	nicholas.kazlauskas@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Duncan Ma <duncan.ma@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Fix idle check for shared firmware
 state" failed to apply to 6.1-stable tree
Date: Wed, 27 Mar 2024 08:14:08 -0400
Message-ID: <20240327121408.2830884-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 3d066f9547dd58329b526db44f42c487a7974703 Mon Sep 17 00:00:00 2001
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Date: Wed, 21 Feb 2024 12:27:31 -0500
Subject: [PATCH] drm/amd/display: Fix idle check for shared firmware state

[WHY]
We still had an instance of get_idle_state checking the PMFW scratch
register instead of the actual idle allow signal.

[HOW]
Replace it with the SW state check for whether we had allowed idle
through notify_idle.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Duncan Ma <duncan.ma@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 613d09c42f3b9..958552a8605ff 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -4847,22 +4847,16 @@ void dc_exit_ips_for_hw_access(struct dc *dc)
 
 bool dc_dmub_is_ips_idle_state(struct dc *dc)
 {
-	uint32_t idle_state = 0;
-
 	if (dc->debug.disable_idle_power_optimizations)
 		return false;
 
 	if (!dc->caps.ips_support || (dc->config.disable_ips == DMUB_IPS_DISABLE_ALL))
 		return false;
 
-	if (dc->hwss.get_idle_state)
-		idle_state = dc->hwss.get_idle_state(dc);
-
-	if (!(idle_state & DMUB_IPS1_ALLOW_MASK) ||
-		!(idle_state & DMUB_IPS2_ALLOW_MASK))
-		return true;
+	if (!dc->ctx->dmub_srv)
+		return false;
 
-	return false;
+	return dc->ctx->dmub_srv->idle_allowed;
 }
 
 /* set min and max memory clock to lowest and highest DPM level, respectively */
-- 
2.43.0




