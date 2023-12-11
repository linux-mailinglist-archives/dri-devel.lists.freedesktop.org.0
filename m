Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D91480CBB0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 14:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7692610E406;
	Mon, 11 Dec 2023 13:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48A910E3FD;
 Mon, 11 Dec 2023 13:53:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C09D612AC;
 Mon, 11 Dec 2023 13:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAB8C433D9;
 Mon, 11 Dec 2023 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702302825;
 bh=NXBnlBnAK5VH1xe11LnSdcoEO4WXNeFKs998K6Ux3e8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i1/Q5I/zK/7OQth177uZ0xyTpbId58dSH9DEokQGi43/k/7KxQeOeRt1WVwruzPjL
 5S6EOnLL7a0oJAmq6/r9NhGq93M6IPbTPmOG8KiDOOyQ8UmROG4PXcBndf/FQFl4Qm
 2tvOWE/CQaxlMEQjCCud2GNzxpWxxPhKysJP8nUXBdWMZpNi20kVnT2vog+kJzPWPh
 pX4r5D5vZNKqiH+QAzAvlSEbVlm40enKO3FbhOhLMFbr/Ee1G/wVTHODXwKGoAH7sl
 dyGnwasbKAeDCqRxu0SCdrwcTqPcAlu5Oivn9xsceZeo6CHNvIYrMVbfBkhOVuf02c
 cvtn/+yi6bcgg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 39/47] drm/amd/display: Add monitor patch for
 specific eDP
Date: Mon, 11 Dec 2023 08:50:40 -0500
Message-ID: <20231211135147.380223-39-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135147.380223-1-sashal@kernel.org>
References: <20231211135147.380223-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.5
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
Cc: Sasha Levin <sashal@kernel.org>, mikita.lipski@amd.com,
 Ivan Lipski <ivlipski@amd.com>, dri-devel@lists.freedesktop.org,
 Sun peng Li <sunpeng.li@amd.com>, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, aurabindo.pillai@amd.com,
 hamza.mahfooz@amd.com, Wayne.Lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, srinivasan.shanmugam@amd.com,
 christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ivan Lipski <ivlipski@amd.com>

[ Upstream commit 3d71a8726e05a35beb9de394e86ce896d69e563f ]

[WHY]
Some eDP panels's ext caps don't write initial value cause the value of
dpcd_addr(0x317) is random.  It means that sometimes the eDP will
clarify it is OLED, miniLED...etc cause the backlight control interface
is incorrect.

[HOW]
Add a new panel patch to remove sink ext caps(HDR,OLED...etc)

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Sun peng Li <sunpeng.li@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Ivan Lipski <ivlipski@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 4b230933b28eb..87a1000b85729 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -63,6 +63,12 @@ static void apply_edid_quirks(struct edid *edid, struct dc_edid_caps *edid_caps)
 		DRM_DEBUG_DRIVER("Disabling FAMS on monitor with panel id %X\n", panel_id);
 		edid_caps->panel_patch.disable_fams = true;
 		break;
+	/* Workaround for some monitors that do not clear DPCD 0x317 if FreeSync is unsupported */
+	case drm_edid_encode_panel_id('A', 'U', 'O', 0xA7AB):
+	case drm_edid_encode_panel_id('A', 'U', 'O', 0xE69B):
+		DRM_DEBUG_DRIVER("Clearing DPCD 0x317 on monitor with panel id %X\n", panel_id);
+		edid_caps->panel_patch.remove_sink_ext_caps = true;
+		break;
 	default:
 		return;
 	}
-- 
2.42.0

