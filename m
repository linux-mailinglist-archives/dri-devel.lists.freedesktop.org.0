Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39988985A5F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17CC10E9D0;
	Wed, 25 Sep 2024 12:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NPWfHMe9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4775010E9CE;
 Wed, 25 Sep 2024 12:07:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 526F8A440FF;
 Wed, 25 Sep 2024 12:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87059C4CEC7;
 Wed, 25 Sep 2024 12:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727266052;
 bh=LZFArz61I3bOyAfe/aCGyh4ciDiv1aeLyIAFGHdeI7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NPWfHMe9EI0Qk5z/kXNP9LQ8+D28A3fd2gKx9aseeiUQeTXwhVf3VodfvmSh4yNN8
 qgcLQwHK+/l6/HVHfhZADi2kG4iZWcmrK+bu18dZZ37LW75NTXHpZFt4yM2E02tiWz
 nkxpGX7mjW9zCxgDnPW7lINDLG7Flf/nSiIK6LPQHLML9pO+xMdsAPnKN8HbZ4Q5x2
 g219rbNUNdQyMoLZDOXt5sGlHQSwH9eJ25bw4GWOpCCG/NEBX0GId46tF0P6jGkD9D
 EV4no7wQUUq/ESJNMjvwkG84oAW19gUuBZy3uAlgK4kXdPLFTgN3IIjWABChbiFNJM
 iV7Nu9jD6r8Pg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, sunil.khatri@amd.com, Prike.Liang@amd.com,
 liupeng01@kylinos.cn, Tim.Huang@amd.com, kevinyang.wang@amd.com,
 pierre-eric.pelloux-prayer@amd.com, Hawking.Zhang@amd.com,
 lijo.lazar@amd.com, victorchengchi.lu@amd.com,
 Harish.Kasiviswanathan@amd.com, Jane.Jian@amd.com, tao.zhou1@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 156/197] drm/amdgpu/gfx9: properly handle error
 ints on all pipes
Date: Wed, 25 Sep 2024 07:52:55 -0400
Message-ID: <20240925115823.1303019-156-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
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

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 48695573d2feaf42812c1ad54e01caff0d1c2d71 ]

Need to handle the interrupt enables for all pipes.

Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c   | 44 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 50 +++++++++++++++++++++++--
 2 files changed, 89 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 0594eab666a9b..b278453cad6d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2477,7 +2477,7 @@ static void gfx_v9_0_enable_gui_idle_interrupt(struct amdgpu_device *adev,
 	tmp = REG_SET_FIELD(tmp, CP_INT_CNTL_RING0, CNTX_BUSY_INT_ENABLE, enable ? 1 : 0);
 	tmp = REG_SET_FIELD(tmp, CP_INT_CNTL_RING0, CNTX_EMPTY_INT_ENABLE, enable ? 1 : 0);
 	tmp = REG_SET_FIELD(tmp, CP_INT_CNTL_RING0, CMP_BUSY_INT_ENABLE, enable ? 1 : 0);
-	if(adev->gfx.num_gfx_rings)
+	if (adev->gfx.num_gfx_rings)
 		tmp = REG_SET_FIELD(tmp, CP_INT_CNTL_RING0, GFX_IDLE_INT_ENABLE, enable ? 1 : 0);
 
 	WREG32_SOC15(GC, 0, mmCP_INT_CNTL_RING0, tmp);
@@ -5772,17 +5772,59 @@ static void gfx_v9_0_set_compute_eop_interrupt_state(struct amdgpu_device *adev,
 	}
 }
 
+static u32 gfx_v9_0_get_cpc_int_cntl(struct amdgpu_device *adev,
+				     int me, int pipe)
+{
+	/*
+	 * amdgpu controls only the first MEC. That's why this function only
+	 * handles the setting of interrupts for this specific MEC. All other
+	 * pipes' interrupts are set by amdkfd.
+	 */
+	if (me != 1)
+		return 0;
+
+	switch (pipe) {
+	case 0:
+		return SOC15_REG_OFFSET(GC, 0, mmCP_ME1_PIPE0_INT_CNTL);
+	case 1:
+		return SOC15_REG_OFFSET(GC, 0, mmCP_ME1_PIPE1_INT_CNTL);
+	case 2:
+		return SOC15_REG_OFFSET(GC, 0, mmCP_ME1_PIPE2_INT_CNTL);
+	case 3:
+		return SOC15_REG_OFFSET(GC, 0, mmCP_ME1_PIPE3_INT_CNTL);
+	default:
+		return 0;
+	}
+}
+
 static int gfx_v9_0_set_priv_reg_fault_state(struct amdgpu_device *adev,
 					     struct amdgpu_irq_src *source,
 					     unsigned type,
 					     enum amdgpu_interrupt_state state)
 {
+	u32 cp_int_cntl_reg, cp_int_cntl;
+	int i, j;
+
 	switch (state) {
 	case AMDGPU_IRQ_STATE_DISABLE:
 	case AMDGPU_IRQ_STATE_ENABLE:
 		WREG32_FIELD15(GC, 0, CP_INT_CNTL_RING0,
 			       PRIV_REG_INT_ENABLE,
 			       state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
+		for (i = 0; i < adev->gfx.mec.num_mec; i++) {
+			for (j = 0; j < adev->gfx.mec.num_pipe_per_mec; j++) {
+				/* MECs start at 1 */
+				cp_int_cntl_reg = gfx_v9_0_get_cpc_int_cntl(adev, i + 1, j);
+
+				if (cp_int_cntl_reg) {
+					cp_int_cntl = RREG32_SOC15_IP(GC, cp_int_cntl_reg);
+					cp_int_cntl = REG_SET_FIELD(cp_int_cntl, CP_ME1_PIPE0_INT_CNTL,
+								    PRIV_REG_INT_ENABLE,
+								    state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
+					WREG32_SOC15_IP(GC, cp_int_cntl_reg, cp_int_cntl);
+				}
+			}
+		}
 		break;
 	default:
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index f5b9f443cfdd7..2564a003526ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -2824,21 +2824,63 @@ static void gfx_v9_4_3_xcc_set_compute_eop_interrupt_state(
 	}
 }
 
+static u32 gfx_v9_4_3_get_cpc_int_cntl(struct amdgpu_device *adev,
+				     int xcc_id, int me, int pipe)
+{
+	/*
+	 * amdgpu controls only the first MEC. That's why this function only
+	 * handles the setting of interrupts for this specific MEC. All other
+	 * pipes' interrupts are set by amdkfd.
+	 */
+	if (me != 1)
+		return 0;
+
+	switch (pipe) {
+	case 0:
+		return SOC15_REG_OFFSET(GC, GET_INST(GC, xcc_id), regCP_ME1_PIPE0_INT_CNTL);
+	case 1:
+		return SOC15_REG_OFFSET(GC, GET_INST(GC, xcc_id), regCP_ME1_PIPE1_INT_CNTL);
+	case 2:
+		return SOC15_REG_OFFSET(GC, GET_INST(GC, xcc_id), regCP_ME1_PIPE2_INT_CNTL);
+	case 3:
+		return SOC15_REG_OFFSET(GC, GET_INST(GC, xcc_id), regCP_ME1_PIPE3_INT_CNTL);
+	default:
+		return 0;
+	}
+}
+
 static int gfx_v9_4_3_set_priv_reg_fault_state(struct amdgpu_device *adev,
 					     struct amdgpu_irq_src *source,
 					     unsigned type,
 					     enum amdgpu_interrupt_state state)
 {
-	int i, num_xcc;
+	u32 mec_int_cntl_reg, mec_int_cntl;
+	int i, j, k, num_xcc;
 
 	num_xcc = NUM_XCC(adev->gfx.xcc_mask);
 	switch (state) {
 	case AMDGPU_IRQ_STATE_DISABLE:
 	case AMDGPU_IRQ_STATE_ENABLE:
-		for (i = 0; i < num_xcc; i++)
+		for (i = 0; i < num_xcc; i++) {
 			WREG32_FIELD15_PREREG(GC, GET_INST(GC, i), CP_INT_CNTL_RING0,
-				PRIV_REG_INT_ENABLE,
-				state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
+					      PRIV_REG_INT_ENABLE,
+					      state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
+			for (j = 0; j < adev->gfx.mec.num_mec; j++) {
+				for (k = 0; k < adev->gfx.mec.num_pipe_per_mec; k++) {
+					/* MECs start at 1 */
+					mec_int_cntl_reg = gfx_v9_4_3_get_cpc_int_cntl(adev, i, j + 1, k);
+
+					if (mec_int_cntl_reg) {
+						mec_int_cntl = RREG32_XCC(mec_int_cntl_reg, i);
+						mec_int_cntl = REG_SET_FIELD(mec_int_cntl, CP_ME1_PIPE0_INT_CNTL,
+									     PRIV_REG_INT_ENABLE,
+									     state == AMDGPU_IRQ_STATE_ENABLE ?
+									     1 : 0);
+						WREG32_XCC(mec_int_cntl_reg, mec_int_cntl, i);
+					}
+				}
+			}
+		}
 		break;
 	default:
 		break;
-- 
2.43.0

