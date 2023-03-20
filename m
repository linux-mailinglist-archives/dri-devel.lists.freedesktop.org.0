Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1256D6C0727
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 01:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3283210E0DD;
	Mon, 20 Mar 2023 00:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854EB10E0DD;
 Mon, 20 Mar 2023 00:55:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D4619611FE;
 Mon, 20 Mar 2023 00:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F708C433EF;
 Mon, 20 Mar 2023 00:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679273707;
 bh=dP8MKAIz+hzlwbkB+IquFyYQGS6Da7JzwgrSPP86ulE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YbF0BOlB4Fl97XetgSB9wOhWsffhm7FRRR30pral7NG3IMYiRP5meSd40dJDhijeT
 0SvaF+juvlxxZ9uokFr2Bx4EviUNIsa2L41rjuEXA2QWZ+qNCq2gcEus6ANye+qEEE
 Sh1taSffcAmrEc2RMpXIJXq+A3QiVdzgdMAlCzP9pnSJz1JnU3QGzV7HYwf7Sn2PY+
 YZWcL/w3kpeGxG/CQWo+3YrbsWt0bRAO2wRhepqyD/PlKNTlSRf7V4AFMtc9T1mGt6
 kXeXD3M8jeIF7eufNJCWAtVWEaIDeZzn6YN+f0UJVOHFBkQZ1cydeYYmmBrbRgi/Qr
 2PCop3oYzZ7yQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 26/29] drm/amd/display: Update clock table to
 include highest clock setting
Date: Sun, 19 Mar 2023 20:54:08 -0400
Message-Id: <20230320005413.1428452-26-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320005413.1428452-1-sashal@kernel.org>
References: <20230320005413.1428452-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, oliver.logush@amd.com,
 Swapnil Patel <Swapnil.Patel@amd.com>, sunpeng.li@amd.com,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Pavle Kotarac <pavle.kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Swapnil Patel <Swapnil.Patel@amd.com>

[ Upstream commit 2d99a7ec25cf456cd3680eb314d6454138e5aa64 ]

[Why]
Currently, the clk manager matches SocVoltage with voltage from
fused settings (dfPstate clock table). And then corresponding clocks
are selected.

However in certain situations, this leads to clk manager not
including at least one entry with highest supported clock setting.

[How]
Update the clk manager to include at least one entry with highest
supported clock setting.

Reviewed-by: Pavle Kotarac <pavle.kotarac@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Swapnil Patel <Swapnil.Patel@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../display/dc/clk_mgr/dcn301/vg_clk_mgr.c    | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
index 24715ca2fa944..01383aac6b419 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
@@ -529,6 +529,19 @@ static struct clk_bw_params vg_bw_params = {
 
 };
 
+static uint32_t find_max_clk_value(const uint32_t clocks[], uint32_t num_clocks)
+{
+	uint32_t max = 0;
+	int i;
+
+	for (i = 0; i < num_clocks; ++i) {
+		if (clocks[i] > max)
+			max = clocks[i];
+	}
+
+	return max;
+}
+
 static unsigned int find_dcfclk_for_voltage(const struct vg_dpm_clocks *clock_table,
 		unsigned int voltage)
 {
@@ -572,12 +585,16 @@ static void vg_clk_mgr_helper_populate_bw_params(
 
 	bw_params->clk_table.num_entries = j + 1;
 
-	for (i = 0; i < bw_params->clk_table.num_entries; i++, j--) {
+	for (i = 0; i < bw_params->clk_table.num_entries - 1; i++, j--) {
 		bw_params->clk_table.entries[i].fclk_mhz = clock_table->DfPstateTable[j].fclk;
 		bw_params->clk_table.entries[i].memclk_mhz = clock_table->DfPstateTable[j].memclk;
 		bw_params->clk_table.entries[i].voltage = clock_table->DfPstateTable[j].voltage;
 		bw_params->clk_table.entries[i].dcfclk_mhz = find_dcfclk_for_voltage(clock_table, clock_table->DfPstateTable[j].voltage);
 	}
+	bw_params->clk_table.entries[i].fclk_mhz = clock_table->DfPstateTable[j].fclk;
+	bw_params->clk_table.entries[i].memclk_mhz = clock_table->DfPstateTable[j].memclk;
+	bw_params->clk_table.entries[i].voltage = clock_table->DfPstateTable[j].voltage;
+	bw_params->clk_table.entries[i].dcfclk_mhz = find_max_clk_value(clock_table->DcfClocks, VG_NUM_DCFCLK_DPM_LEVELS);
 
 	bw_params->vram_type = bios_info->memory_type;
 	bw_params->num_channels = bios_info->ma_channel_number;
-- 
2.39.2

