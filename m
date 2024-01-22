Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619C8365FE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 15:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C00610F27E;
	Mon, 22 Jan 2024 14:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2C910F27E;
 Mon, 22 Jan 2024 14:57:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4A1C9B80E70;
 Mon, 22 Jan 2024 14:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3613CC433F1;
 Mon, 22 Jan 2024 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935449;
 bh=EnjL0ke689RMfd+PkpdMwleJrNruYu3f6vIsAHbu2XA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tFpjpdxDcKtSM2GA2SVUy/XyfC6iKC4MBz+WAnGHPZz9+UGCSr+4AXzMUTm66FwJu
 ypJ+HrgoSBwSRNblZBpmhaMqGY41N6FtPN4myanSP3VpqSr9sKK+bqzf1PQIe1tjEI
 /HJTDuFV0xo0eZs2sArg/Ung+RKKM5yz0BMPpcJs6762LGfHrZ6HBLu+YqBiWClthz
 JVZbQjVjPv3OqYEdCs3zhV32w9pMAaTTf/caYz4Dn9exZftR0/qMnI5qSC81nI91HW
 9rCyEHUm/9VQbo3Q8vIyB3Onp9QVkLc0U2EqDrmRkqaPij2nc/CSWmdmmaT8Ia4LcP
 UheYNPrxX7APQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 20/88] drm/amd/display: Fix Replay Desync Error
 IRQ handler
Date: Mon, 22 Jan 2024 09:50:53 -0500
Message-ID: <20240122145608.990137-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Sasha Levin <sashal@kernel.org>, ilya.bakoulin@amd.com,
 dri-devel@lists.freedesktop.org, sunpeng.li@amd.com, airlied@gmail.com,
 qingqing.zhuo@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 chuntao.tso@amd.com, amd-gfx@lists.freedesktop.org, wenjing.liu@amd.com,
 Bhawanpreet.Lakha@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 hersenxs.wu@amd.com, Dennis Chan <dennis.chan@amd.com>, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, Robin Chen <robin.chen@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dennis Chan <dennis.chan@amd.com>

[ Upstream commit dd5c6362ddcd8bdb07704faff8648593885ecfa1 ]

In previous case, Replay didn't identify the IRQ type, This commit fixes
the issues for the interrupt.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Robin Chen <robin.chen@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Dennis Chan <dennis.chan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../display/dc/link/protocols/link_dp_irq_handler.c  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
index 0c00e94e90b1..9eadc2c7f221 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
@@ -190,9 +190,6 @@ static void handle_hpd_irq_replay_sink(struct dc_link *link)
 	/*AMD Replay version reuse DP_PSR_ERROR_STATUS for REPLAY_ERROR status.*/
 	union psr_error_status replay_error_status;
 
-	if (link->replay_settings.config.force_disable_desync_error_check)
-		return;
-
 	if (!link->replay_settings.replay_feature_enabled)
 		return;
 
@@ -210,9 +207,6 @@ static void handle_hpd_irq_replay_sink(struct dc_link *link)
 		&replay_error_status.raw,
 		sizeof(replay_error_status.raw));
 
-	if (replay_configuration.bits.DESYNC_ERROR_STATUS)
-		link->replay_settings.config.received_desync_error_hpd = 1;
-
 	link->replay_settings.config.replay_error_status.bits.LINK_CRC_ERROR =
 		replay_error_status.bits.LINK_CRC_ERROR;
 	link->replay_settings.config.replay_error_status.bits.DESYNC_ERROR =
@@ -225,6 +219,12 @@ static void handle_hpd_irq_replay_sink(struct dc_link *link)
 		link->replay_settings.config.replay_error_status.bits.STATE_TRANSITION_ERROR) {
 		bool allow_active;
 
+		if (link->replay_settings.config.replay_error_status.bits.DESYNC_ERROR)
+			link->replay_settings.config.received_desync_error_hpd = 1;
+
+		if (link->replay_settings.config.force_disable_desync_error_check)
+			return;
+
 		/* Acknowledge and clear configuration bits */
 		dm_helpers_dp_write_dpcd(
 			link->ctx,
-- 
2.43.0

