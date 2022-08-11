Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F065F58FF6C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276A5B4350;
	Thu, 11 Aug 2022 15:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF87A10E751;
 Thu, 11 Aug 2022 15:29:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2EAEB8215C;
 Thu, 11 Aug 2022 15:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7824CC433C1;
 Thu, 11 Aug 2022 15:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660231794;
 bh=Kcc3+GretIhBYyl20guPmg+/oLg7fqLFLFv/C9EO0YQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hs4VMhDiZ19LEMbkWDz5wXNhS/p6wQfWq1poc2wdPVNXrEGLjcqRh2fRWcYhL6KWy
 APFm79+dgg1CZVNKHdajF7XVl31fLNdUh8EA0dUJpJoSMH+m5dbz1nAShoUQeAK1l+
 DzHNIoPWYPSrwRSCDGTOtDv2OsmfY59yhlgkj+Y+IejP+0F93RGyr9UR+33lVywZVE
 pwmUTDNZ7Jvca/CLtJU+YvTYHOfuLrpWQLzM+XCkyYikogArjrsonzHW1qLgxSyFQH
 QR7Ldlip4cH1IMaJx8L1/YfDbmykk4zgH5tYzEHnOiSdCKa6BFNRTY2rhnIt00Goom
 469HxeeEAAPvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 011/105] drm/amd/display: fix system hang when
 PSR exits
Date: Thu, 11 Aug 2022 11:26:55 -0400
Message-Id: <20220811152851.1520029-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
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
Cc: rdunlap@infradead.org, airlied@linux.ie, Rodrigo.Siqueira@amd.com,
 dale.zhao@amd.com, dri-devel@lists.freedesktop.org, Anthony.Koo@amd.com,
 Jimmy.Kizito@amd.com, Sasha Levin <sashal@kernel.org>, po-tchen@amd.com,
 wenjing.liu@amd.com, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Jerry.Zuo@amd.com, Anson.Jacob@amd.com,
 dharati.shah@amd.com, mikita.lipski@amd.com, agustin.gutierrez@amd.com,
 David Zhang <dingchen.zhang@amd.com>, Xinhui.Pan@amd.com,
 christian.koenig@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Zhang <dingchen.zhang@amd.com>

[ Upstream commit 6cc5c77300afbb285c4f41e04f3435ae3c484c40 ]

[why]
When DC driver send PSR exit dmub command to DMUB FW, it might not
wait until PSR exit. Then it may hit the following deadlock situation.
1. DC driver send HW LOCK command to DMUB FW due to frame update
2. DMUB FW Set the HW lock
3. DMUB execute PSR exit sequence and stuck at polling DPG Pending
register due to the HW Lock is set
4. DC driver ask DMUB FW to unlock HW lock, but DMUB FW is polling
DPG pending register

[how]
The reason why DC driver doesn't wait until PSR exit is because some of
the PSR state machine state is not update the dc driver. So when DC
driver read back the PSR state, it take the state for PSR inactive.

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
Acked-by: Leo Li <sunpeng.li@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc_types.h     |  7 +++++++
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 2ba9f528c0fe..f1f11b3c205f 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -657,10 +657,17 @@ enum dc_psr_state {
 	PSR_STATE4b,
 	PSR_STATE4c,
 	PSR_STATE4d,
+	PSR_STATE4_FULL_FRAME,
+	PSR_STATE4a_FULL_FRAME,
+	PSR_STATE4b_FULL_FRAME,
+	PSR_STATE4c_FULL_FRAME,
+	PSR_STATE4_FULL_FRAME_POWERUP,
 	PSR_STATE5,
 	PSR_STATE5a,
 	PSR_STATE5b,
 	PSR_STATE5c,
+	PSR_STATE_HWLOCK_MGR,
+	PSR_STATE_POLLVUPDATE,
 	PSR_STATE_INVALID = 0xFF
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index 1d4f0c45b536..f941aa107dc6 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -74,6 +74,22 @@ static enum dc_psr_state convert_psr_state(uint32_t raw_state)
 		state = PSR_STATE5b;
 	else if (raw_state == 0x53)
 		state = PSR_STATE5c;
+	else if (raw_state == 0x4A)
+		state = PSR_STATE4_FULL_FRAME;
+	else if (raw_state == 0x4B)
+		state = PSR_STATE4a_FULL_FRAME;
+	else if (raw_state == 0x4C)
+		state = PSR_STATE4b_FULL_FRAME;
+	else if (raw_state == 0x4D)
+		state = PSR_STATE4c_FULL_FRAME;
+	else if (raw_state == 0x4E)
+		state = PSR_STATE4_FULL_FRAME_POWERUP;
+	else if (raw_state == 0x60)
+		state = PSR_STATE_HWLOCK_MGR;
+	else if (raw_state == 0x61)
+		state = PSR_STATE_POLLVUPDATE;
+	else
+		state = PSR_STATE_INVALID;
 
 	return state;
 }
-- 
2.35.1

