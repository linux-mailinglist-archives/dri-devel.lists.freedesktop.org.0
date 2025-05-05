Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C814AA9F8A
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C42A10E46F;
	Mon,  5 May 2025 22:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UDTMmnfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE0910E473;
 Mon,  5 May 2025 22:24:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B9B5A629C6;
 Mon,  5 May 2025 22:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B96DC4CEEE;
 Mon,  5 May 2025 22:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483861;
 bh=M+HgMlX14NMgVFFSOwLP5oABcTLZTU1WSxrW0tLSHFo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UDTMmnfECLYrwzikR/kGUYU3ns231YW+48F4jhPF7wlQSIRgpY8Q0y0VljMcpOMPo
 JWWUCASxvRrj3KCkurz9dxGz9+MZK8NiHBqc64HaJ6EvshzQNtCG/u2GaA/UPUPAAq
 rfR7rl3e+LuBMlRz9TlQZlN4nV21Nq7lRzxmvWmCIl3DZgyfv6FgtQRoA5VrULhUGp
 GAAr0yvXnQeL6FCMPH5319+A5dbyAz528zqcbv6E7g89byLRANB2bWTzq6nVwqNCBw
 B1skH5CxiH9fi1grb8eGiwUReHhULekT6TqLJfz/wvBcvOQnIdEu7AqO4o0lXDPn2V
 YhdA2MniTnVSw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dillon Varone <Dillon.Varone@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, dillon.varone@amd.com,
 chiahsuan.chung@amd.com, joshua.aberback@amd.com, Cruise.Hung@amd.com,
 alex.hung@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 251/642] drm/amd/display: Fix DMUB reset sequence
 for DCN401
Date: Mon,  5 May 2025 18:07:47 -0400
Message-Id: <20250505221419.2672473-251-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Dillon Varone <Dillon.Varone@amd.com>

[ Upstream commit 0dfcc2bf269010a6e093793034c048049a40ee93 ]

[WHY]
It should no longer use DMCUB_SOFT_RESET as it can result
in the memory request path becoming desynchronized.

[HOW]
To ensure robustness in the reset sequence:
1) Extend timeout on the "halt" command sent via gpint, and check for
controller to enter "wait" as a stronger guarantee that there are no
requests to memory still in flight.
2) Remove usage of DMCUB_SOFT_RESET
3) Rely on PSP to reset the controller safely

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Dillon Varone <Dillon.Varone@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dmub/src/dmub_dcn401.c    | 47 ++++++++++++-------
 .../drm/amd/display/dmub/src/dmub_dcn401.h    |  3 +-
 2 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c
index 39a8cb6d7523c..e1c4fe1c6e3ee 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c
@@ -63,8 +63,10 @@ static inline void dmub_dcn401_translate_addr(const union dmub_addr *addr_in,
 void dmub_dcn401_reset(struct dmub_srv *dmub)
 {
 	union dmub_gpint_data_register cmd;
-	const uint32_t timeout = 30;
-	uint32_t in_reset, scratch, i;
+	const uint32_t timeout_us = 1 * 1000 * 1000; //1s
+	const uint32_t poll_delay_us = 1; //1us
+	uint32_t i = 0;
+	uint32_t in_reset, scratch, pwait_mode;
 
 	REG_GET(DMCUB_CNTL2, DMCUB_SOFT_RESET, &in_reset);
 
@@ -75,32 +77,35 @@ void dmub_dcn401_reset(struct dmub_srv *dmub)
 
 		dmub->hw_funcs.set_gpint(dmub, cmd);
 
-		/**
-		 * Timeout covers both the ACK and the wait
-		 * for remaining work to finish.
-		 *
-		 * This is mostly bound by the PHY disable sequence.
-		 * Each register check will be greater than 1us, so
-		 * don't bother using udelay.
-		 */
-
-		for (i = 0; i < timeout; ++i) {
+		for (i = 0; i < timeout_us; i++) {
 			if (dmub->hw_funcs.is_gpint_acked(dmub, cmd))
 				break;
+
+			udelay(poll_delay_us);
 		}
 
-		for (i = 0; i < timeout; ++i) {
+		for (; i < timeout_us; i++) {
 			scratch = dmub->hw_funcs.get_gpint_response(dmub);
 			if (scratch == DMUB_GPINT__STOP_FW_RESPONSE)
 				break;
+
+			udelay(poll_delay_us);
 		}
 
-		/* Force reset in case we timed out, DMCUB is likely hung. */
+		for (; i < timeout_us; i++) {
+			REG_GET(DMCUB_CNTL, DMCUB_PWAIT_MODE_STATUS, &pwait_mode);
+			if (pwait_mode & (1 << 0))
+				break;
+
+			udelay(poll_delay_us);
+		}
+	}
+
+	if (i >= timeout_us) {
+		/* timeout should never occur */
+		BREAK_TO_DEBUGGER();
 	}
 
-	REG_UPDATE(DMCUB_CNTL2, DMCUB_SOFT_RESET, 1);
-	REG_UPDATE(DMCUB_CNTL, DMCUB_ENABLE, 0);
-	REG_UPDATE(MMHUBBUB_SOFT_RESET, DMUIF_SOFT_RESET, 1);
 	REG_WRITE(DMCUB_INBOX1_RPTR, 0);
 	REG_WRITE(DMCUB_INBOX1_WPTR, 0);
 	REG_WRITE(DMCUB_OUTBOX1_RPTR, 0);
@@ -131,7 +136,10 @@ void dmub_dcn401_backdoor_load(struct dmub_srv *dmub,
 
 	dmub_dcn401_get_fb_base_offset(dmub, &fb_base, &fb_offset);
 
+	/* reset and disable DMCUB and MMHUBBUB DMUIF */
 	REG_UPDATE(DMCUB_SEC_CNTL, DMCUB_SEC_RESET, 1);
+	REG_UPDATE(MMHUBBUB_SOFT_RESET, DMUIF_SOFT_RESET, 1);
+	REG_UPDATE(DMCUB_CNTL, DMCUB_ENABLE, 0);
 
 	dmub_dcn401_translate_addr(&cw0->offset, fb_base, fb_offset, &offset);
 
@@ -151,6 +159,7 @@ void dmub_dcn401_backdoor_load(struct dmub_srv *dmub,
 			DMCUB_REGION3_CW1_TOP_ADDRESS, cw1->region.top,
 			DMCUB_REGION3_CW1_ENABLE, 1);
 
+	/* release DMCUB reset only to prevent premature execution */
 	REG_UPDATE_2(DMCUB_SEC_CNTL, DMCUB_SEC_RESET, 0, DMCUB_MEM_UNIT_ID,
 			0x20);
 }
@@ -161,7 +170,10 @@ void dmub_dcn401_backdoor_load_zfb_mode(struct dmub_srv *dmub,
 {
 	union dmub_addr offset;
 
+	/* reset and disable DMCUB and MMHUBBUB DMUIF */
 	REG_UPDATE(DMCUB_SEC_CNTL, DMCUB_SEC_RESET, 1);
+	REG_UPDATE(MMHUBBUB_SOFT_RESET, DMUIF_SOFT_RESET, 1);
+	REG_UPDATE(DMCUB_CNTL, DMCUB_ENABLE, 0);
 
 	offset = cw0->offset;
 
@@ -181,6 +193,7 @@ void dmub_dcn401_backdoor_load_zfb_mode(struct dmub_srv *dmub,
 			DMCUB_REGION3_CW1_TOP_ADDRESS, cw1->region.top,
 			DMCUB_REGION3_CW1_ENABLE, 1);
 
+	/* release DMCUB reset only to prevent premature execution */
 	REG_UPDATE_2(DMCUB_SEC_CNTL, DMCUB_SEC_RESET, 0, DMCUB_MEM_UNIT_ID,
 			0x20);
 }
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h
index 4c8843b796950..31f95b27e227d 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h
@@ -169,7 +169,8 @@ struct dmub_srv;
 	DMUB_SF(HOST_INTERRUPT_CSR, HOST_REG_INBOX0_RSP_INT_EN) \
 	DMUB_SF(HOST_INTERRUPT_CSR, HOST_REG_OUTBOX0_RDY_INT_ACK) \
 	DMUB_SF(HOST_INTERRUPT_CSR, HOST_REG_OUTBOX0_RDY_INT_STAT) \
-	DMUB_SF(HOST_INTERRUPT_CSR, HOST_REG_OUTBOX0_RDY_INT_EN)
+	DMUB_SF(HOST_INTERRUPT_CSR, HOST_REG_OUTBOX0_RDY_INT_EN) \
+	DMUB_SF(DMCUB_CNTL, DMCUB_PWAIT_MODE_STATUS)
 
 struct dmub_srv_dcn401_reg_offset {
 #define DMUB_SR(reg) uint32_t reg;
-- 
2.39.5

