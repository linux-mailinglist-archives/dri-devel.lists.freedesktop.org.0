Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037FBAAA38F
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6942110E609;
	Mon,  5 May 2025 23:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T7KIfAmu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E948510E608;
 Mon,  5 May 2025 23:16:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 24BAE43A72;
 Mon,  5 May 2025 23:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D86EC4CEF1;
 Mon,  5 May 2025 23:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486980;
 bh=pyPTH/DOzKzqdUSvj1Ae5wZXHcTD0V0QcNG9wBEnlyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T7KIfAmuyLFVqsUhnuQ98X+ZD/D7kiC+IjsNdiRj1/4OUUnam2OISCWFPo+5bQnY7
 FUUeuUa9SFkEGqBXugOzJIfKhwJegtTWWjaEeJAExPcDv+VCfaK/an+lOu8+ve6N59
 0p9IU+RgTCLAlX5gfFdhyJDNmy8HJ2cxlfST73DHdjDowGXuBzgcDEtO1wMWyDjFCf
 2sSZXUfdocHmIWFLCELc8pS9T4oVOef5z84IbGd6yAGXb6qj8oIBub/NeZS+MsXRlh
 wOBEd6TrhyJd7Cal/dqA9oW0ELrkcL+f33zo1MTyunQujlF2IL0KqCTyKUcoOAhpyN
 LCrZqHc9A1YSA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charlene Liu <Charlene.Liu@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, hamzamahfooz@linux.microsoft.com,
 Daniel.Sa@amd.com, alex.hung@amd.com, rostrows@amd.com, Wayne.Lin@amd.com,
 Syed.Hassan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.15 090/153] drm/amd/display: fix dcn4x init failed
Date: Mon,  5 May 2025 19:12:17 -0400
Message-Id: <20250505231320.2695319-90-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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

From: Charlene Liu <Charlene.Liu@amd.com>

[ Upstream commit 23ef388a84c72b0614a6c10f866ffeac7e807719 ]

[why]
failed due to cmdtable not created.
switch atombios cmdtable as default.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Charlene Liu <Charlene.Liu@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/bios/command_table2.c     | 9 ---------
 .../gpu/drm/amd/display/dc/bios/command_table_helper2.c  | 3 +--
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
index f1f672a997d7d..d822cc948bdf2 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
@@ -103,7 +103,6 @@ static void init_dig_encoder_control(struct bios_parser *bp)
 		bp->cmd_tbl.dig_encoder_control = encoder_control_digx_v1_5;
 		break;
 	default:
-		dm_output_to_console("Don't have dig_encoder_control for v%d\n", version);
 		bp->cmd_tbl.dig_encoder_control = encoder_control_fallback;
 		break;
 	}
@@ -241,7 +240,6 @@ static void init_transmitter_control(struct bios_parser *bp)
 		bp->cmd_tbl.transmitter_control = transmitter_control_v1_7;
 		break;
 	default:
-		dm_output_to_console("Don't have transmitter_control for v%d\n", crev);
 		bp->cmd_tbl.transmitter_control = transmitter_control_fallback;
 		break;
 	}
@@ -409,8 +407,6 @@ static void init_set_pixel_clock(struct bios_parser *bp)
 		bp->cmd_tbl.set_pixel_clock = set_pixel_clock_v7;
 		break;
 	default:
-		dm_output_to_console("Don't have set_pixel_clock for v%d\n",
-			 BIOS_CMD_TABLE_PARA_REVISION(setpixelclock));
 		bp->cmd_tbl.set_pixel_clock = set_pixel_clock_fallback;
 		break;
 	}
@@ -557,7 +553,6 @@ static void init_set_crtc_timing(struct bios_parser *bp)
 			set_crtc_using_dtd_timing_v3;
 		break;
 	default:
-		dm_output_to_console("Don't have set_crtc_timing for v%d\n", dtd_version);
 		bp->cmd_tbl.set_crtc_timing = NULL;
 		break;
 	}
@@ -674,8 +669,6 @@ static void init_enable_crtc(struct bios_parser *bp)
 		bp->cmd_tbl.enable_crtc = enable_crtc_v1;
 		break;
 	default:
-		dm_output_to_console("Don't have enable_crtc for v%d\n",
-			 BIOS_CMD_TABLE_PARA_REVISION(enablecrtc));
 		bp->cmd_tbl.enable_crtc = NULL;
 		break;
 	}
@@ -869,8 +862,6 @@ static void init_set_dce_clock(struct bios_parser *bp)
 		bp->cmd_tbl.set_dce_clock = set_dce_clock_v2_1;
 		break;
 	default:
-		dm_output_to_console("Don't have set_dce_clock for v%d\n",
-			 BIOS_CMD_TABLE_PARA_REVISION(setdceclock));
 		bp->cmd_tbl.set_dce_clock = NULL;
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
index cb3fd44cb1edf..e0231660f69da 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
@@ -79,8 +79,7 @@ bool dal_bios_parser_init_cmd_tbl_helper2(
 		return true;
 #endif
 	default:
-		/* Unsupported DCE */
-		BREAK_TO_DEBUGGER();
+		*h = dal_cmd_tbl_helper_dce112_get_table2();
 		return false;
 	}
 }
-- 
2.39.5

