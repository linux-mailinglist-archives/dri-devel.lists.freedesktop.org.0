Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCAB6FFA48
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 21:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8AB10E5E1;
	Thu, 11 May 2023 19:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B108E10E5DD;
 Thu, 11 May 2023 19:38:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 306286510D;
 Thu, 11 May 2023 19:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0DFC4339B;
 Thu, 11 May 2023 19:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683833906;
 bh=32Dyk/hnYKXbkSTD+0XGzrBbDpEETte5HuuCckT159c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MLF0C6ve2dKFFNSaPLfTmfBJtVBXGmpenB1RXnh3m40KcwxVkXScb1bTjZ5RhI9A/
 0B0yEQ97KtOuAKRORcD5v3d8NJgOdW6nuty6iiTsFokQukx6/U+dZIg0QWanMirv8n
 so3xrmVIm98RZQ5bjY61g4+Vrd+dpddt18Jt/XQ34r54lDlaPJ+/Zhy0troFACR30x
 rS032EukqsV3R5t0IVXHF0WeISZXZAGFhnh+Z84Fr2yQ33t7Czv8Isxm++/ETKDH8f
 qqlo8Fw1W0aHzRJymvJ9lAeaK4xprZINPD+TVFXSAo+XUpOR/o+kFFy59p+hm2xfsK
 LdWgWsq8oP1iw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 05/11] drm/amd/display: fix memleak in
 aconnector->timing_requested
Date: Thu, 11 May 2023 15:37:48 -0400
Message-Id: <20230511193757.623114-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230511193757.623114-1-sashal@kernel.org>
References: <20230511193757.623114-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, stylon.wang@amd.com, sunpeng.li@amd.com,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, hdegoede@redhat.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, aurabindo.pillai@amd.com,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hersen Wu <hersenxs.wu@amd.com>

[ Upstream commit 025ce392b5f213696ca0af3e07735d0fae020694 ]

[Why]
when amdgpu_dm_update_connector_after_detect is called
two times successively with valid sink, memory allocated of
aconnector->timing_requested for the first call is not free.
this causes memeleak.

[How]
allocate memory only when aconnector->timing_requested
is null.

Reviewed-by: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a01fd41643fc2..5dced13f4ae8d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3094,9 +3094,12 @@ void amdgpu_dm_update_connector_after_detect(
 						    aconnector->edid);
 		}
 
-		aconnector->timing_requested = kzalloc(sizeof(struct dc_crtc_timing), GFP_KERNEL);
-		if (!aconnector->timing_requested)
-			dm_error("%s: failed to create aconnector->requested_timing\n", __func__);
+		if (!aconnector->timing_requested) {
+			aconnector->timing_requested =
+				kzalloc(sizeof(struct dc_crtc_timing), GFP_KERNEL);
+			if (!aconnector->timing_requested)
+				dm_error("failed to create aconnector->requested_timing\n");
+		}
 
 		drm_connector_update_edid_property(connector, aconnector->edid);
 		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
-- 
2.39.2

