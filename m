Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6496A3703
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D3110E2FC;
	Mon, 27 Feb 2023 02:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBF710E2F3;
 Mon, 27 Feb 2023 02:06:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 38EF360DBA;
 Mon, 27 Feb 2023 02:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27360C4339B;
 Mon, 27 Feb 2023 02:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463562;
 bh=iZkBiJhWbPVE5XCtUNYSr1AQ3fgrW+1lcbf0WIblXFc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dBDYiESEIOxv7waa/5HsJjECKTvvL/jOtWpEdVBB8RWzqyn6O57d+4kE92DXvxjfx
 7t5RBL8Afh5QiRun9YOE2/n1WYkjMAsB/TYSE8jMsqP7uzPBh+nx7KfqFMAZj3qhtU
 ki6CQd0R6Aig83sHsdKSwOrJL3787BNvu3e+s62BQ1awpwEqWBQW+DQ1x8QjPDdqpL
 utumq1PlQ0GaYufneAI/wKBihHQc2TOc+zhqmoNjIAjLBaPeqcmWmLkAryylR8IDRo
 SG5ZBqrKCaj4Fcc8JfaKJYzGTpfEjiiO/ukYXxdO67cPKPBiAVprZAPnQ/J4kw+XUQ
 rM/jmJdPy6Lzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 15/58] drm/amd: Avoid ASSERT for some message
 failures
Date: Sun, 26 Feb 2023 21:04:13 -0500
Message-Id: <20230227020457.1048737-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 SyedSaaem.Rizvi@amd.com, Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit 3e5019ee67760cd61b2a5fd605e1289c2f92d983 ]

On DCN314 when resuming from s0i3 an ASSERT is shown indicating that
`VBIOSSMC_MSG_SetHardMinDcfclkByFreq` returned `VBIOSSMC_Result_Failed`.

This isn't a driver bug; it's a BIOS/configuration bug. To make this
easier to triage, add an explicit warning when this issue happens.

This matches the behavior utilized for failures with
`VBIOSSMC_MSG_TransferTableDram2Smu` configuration.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c
index 2db595672a469..aa264c600408d 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c
@@ -146,6 +146,9 @@ static int dcn314_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
 		if (msg_id == VBIOSSMC_MSG_TransferTableDram2Smu &&
 		    param == TABLE_WATERMARKS)
 			DC_LOG_WARNING("Watermarks table not configured properly by SMU");
+		else if (msg_id == VBIOSSMC_MSG_SetHardMinDcfclkByFreq ||
+			 msg_id == VBIOSSMC_MSG_SetMinDeepSleepDcfclk)
+			DC_LOG_WARNING("DCFCLK_DPM is not enabled by BIOS");
 		else
 			ASSERT(0);
 		REG_WRITE(MP1_SMN_C2PMSG_91, VBIOSSMC_Result_OK);
-- 
2.39.0

