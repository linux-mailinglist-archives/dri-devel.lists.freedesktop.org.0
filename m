Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7477A932
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 18:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7440510E0A8;
	Sun, 13 Aug 2023 16:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F20D10E0DF;
 Sun, 13 Aug 2023 16:11:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2F0363AFB;
 Sun, 13 Aug 2023 16:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14A6C433C8;
 Sun, 13 Aug 2023 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691943067;
 bh=cy50LwjIM3cmlivfNAPOdLSRAFubxXvi0p0oosUSsLc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YN9Sp9g7EBgHC3EMAYVwNe6V0FOewSA1ZNzOz84AiBioolwqSoPMXRMdmX52wLIDB
 C8PpM2H+cWa+qkcQ6f3DfhuwzHt5qQTEErvWqfyGADKfitteNgtvZ3sVlzkNXe/Y0Q
 oskSIYwgzoaLMf2UqcPkUzGQA/wvMSLbk5fLtQnzpn6+mxv8x6QnhvXxDwgFO3fcJ+
 TkTP+CPl/oZXaTu/MlTGb+Ro+rsgY2RS0fqjS6Ki32kNOo1X/3p+3SSK+XSEWne4+n
 BPRbiPxYYOPBAfWQ3+5qmDqIJBc3AJVKWq/bN5H+678f6G4BUkVY1NVg9r1xrKyz1w
 JP2bDWryuT2PA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 19/25] drm/amd/display: Exit idle optimizations
 before attempt to access PHY
Date: Sun, 13 Aug 2023 12:09:30 -0400
Message-Id: <20230813160936.1082758-19-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160936.1082758-1-sashal@kernel.org>
References: <20230813160936.1082758-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.190
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
Cc: Iswara.Nagulendran@amd.com, wenjing.liu@amd.com,
 dri-devel@lists.freedesktop.org, Jun.Lei@amd.com, Jingwen.Zhu@amd.com,
 Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com,
 Leo Chen <sancchen@amd.com>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, Alvin.Lee2@amd.com,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Xinhui.Pan@amd.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 zhikai.zhai@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Leo Chen <sancchen@amd.com>

[ Upstream commit de612738e9771bd66aeb20044486c457c512f684 ]

[Why & How]
DMUB may hang when powering down pixel clocks due to no dprefclk.

It is fixed by exiting idle optimization before the attempt to access PHY.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Leo Chen <sancchen@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index e33fe0207b9e5..53e8defd34751 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -1682,10 +1682,13 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
 			hws->funcs.edp_backlight_control(edp_link_with_sink, false);
 		}
 		/*resume from S3, no vbios posting, no need to power down again*/
+		clk_mgr_exit_optimized_pwr_state(dc, dc->clk_mgr);
+
 		power_down_all_hw_blocks(dc);
 		disable_vga_and_power_gate_all_controllers(dc);
 		if (edp_link_with_sink && !keep_edp_vdd_on)
 			dc->hwss.edp_power_control(edp_link_with_sink, false);
+		clk_mgr_optimize_pwr_state(dc, dc->clk_mgr);
 	}
 	bios_set_scratch_acc_mode_change(dc->ctx->dc_bios);
 }
-- 
2.40.1

