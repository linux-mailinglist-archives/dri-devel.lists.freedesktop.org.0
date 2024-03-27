Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6359E88DE9F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DE410FBA4;
	Wed, 27 Mar 2024 12:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LvWuVDX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF77E10FBA1;
 Wed, 27 Mar 2024 12:17:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2299061515;
 Wed, 27 Mar 2024 12:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A92C433C7;
 Wed, 27 Mar 2024 12:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541854;
 bh=rbfDrddplKEBc78G+emDnzYQbvlYfaYHFyuBflOcgZc=;
 h=From:To:Cc:Subject:Date:From;
 b=LvWuVDX5woBRcNSqQavuXUBxitUWosBeXhLNrYgX6ActN3n+RU5nvX59OcMABLUXQ
 E6Y1fzx5jO36K4kuVzzpC7mwgaVpu8/TbF/XAhSDzvpItfkaUuU7rYc2nYk5LUXV2X
 n0Quf9P2sk7Mh6wPIhF/EY0XfJjPYT9NGtxZSd1dQxEn7wTOBQ7GRrgeRa5SjVDMVc
 WNtkyw0aWIIJcFldkDxp/kHsiAAIdGd2P8E6ZX4qpb7Y9fAUTquCfAc+oc0LUJWTsm
 TekvN/tPBLoangLMb/ik1lkcPVOZQd1Etzjfi8gbWhEczmThpbtHZ6hlYEmCtDqZ1b
 vnHrOmbPNCi0A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	Wayne.Lin@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Align the returned error code with
 legacy DP" failed to apply to 5.15-stable tree
Date: Wed, 27 Mar 2024 08:17:32 -0400
Message-ID: <20240327121732.2833618-1-sashal@kernel.org>
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

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 3b84525544be4ca0481110263a6d73eb00741cf3 Mon Sep 17 00:00:00 2001
From: Wayne Lin <Wayne.Lin@amd.com>
Date: Tue, 2 Jan 2024 14:20:37 +0800
Subject: [PATCH] drm/amd/display: Align the returned error code with legacy DP

[Why]
For usb4 connector, AUX transaction is handled by dmub utilizing a differnt
code path comparing to legacy DP connector. If the usb4 DP connector is
disconnected, AUX access will report EBUSY and cause igt@kms_dp_aux_dev
fail.

[How]
Align the error code with the one reported by legacy DP as EIO.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index eaf8d9f482446..85b7f58a7f35a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -979,6 +979,11 @@ int dm_helper_dmub_aux_transfer_sync(
 		struct aux_payload *payload,
 		enum aux_return_code_type *operation_result)
 {
+	if (!link->hpd_status) {
+		*operation_result = AUX_RET_ERROR_HPD_DISCON;
+		return -1;
+	}
+
 	return amdgpu_dm_process_dmub_aux_transfer_sync(ctx, link->link_index, payload,
 			operation_result);
 }
-- 
2.43.0




