Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD96148B5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 12:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC1C10E386;
	Tue,  1 Nov 2022 11:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CB410E38E;
 Tue,  1 Nov 2022 11:29:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9630B615C9;
 Tue,  1 Nov 2022 11:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DCDC433D6;
 Tue,  1 Nov 2022 11:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667302153;
 bh=3jXtpSIwEXAW4EAq4OZoPSPi8/gX8DtutC4ENnfdEM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q6SfJeeC+m1Q0l+pNOooRVEisJhLwdzeXO54fbR9q5+iIV6mFh0WdOfpRhwR2dE/7
 z12ium+mUJcRPQGm9oNKfZZ5ViiCn4qW4RtWxfpgmXHTFFuAziZf1aDtoXPupI5AW2
 TYK1hrjc+7/EhuF6fjQ+3au3N9GwaP613jkYaEcASefJEEJpLp7cBgpMZPVw7TgEY+
 jbk7uGYBdxWDpidlQUUVtmZIIey6Ga9oZNFbFu8iWa2r9G6eIHrJTG85JiiJvX944+
 INfTPC39um/KOGTA8tlBScxinlmvDncsfiCqfY26s1UQ8A32k5HBYqdT+OBG57p3FZ
 tXWsjlvmCVsFw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 30/34] drm/amdgpu: dequeue mes scheduler during
 fini
Date: Tue,  1 Nov 2022 07:27:22 -0400
Message-Id: <20221101112726.799368-30-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101112726.799368-1-sashal@kernel.org>
References: <20221101112726.799368-1-sashal@kernel.org>
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
Cc: YuBiao Wang <YuBiao.Wang@amd.com>, Sasha Levin <sashal@kernel.org>,
 Jack Xiao <Jack.Xiao@amd.com>, yifan1.zhang@amd.com, Felix.Kuehling@amd.com,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Graham.Sider@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: YuBiao Wang <YuBiao.Wang@amd.com>

[ Upstream commit 2abe92c7adc9c0397ba51bf74909b85bc0fff84b ]

[Why]
If mes is not dequeued during fini, mes will be in an uncleaned state
during reload, then mes couldn't receive some commands which leads to
reload failure.

[How]
Perform MES dequeue via MMIO after all the unmap jobs are done by mes
and before kiq fini.

v2: Move the dequeue operation inside kiq_hw_fini.

Signed-off-by: YuBiao Wang <YuBiao.Wang@amd.com>
Reviewed-by: Jack Xiao <Jack.Xiao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 42 ++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index f92744b8d79d..2dd827472d6e 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -1145,6 +1145,42 @@ static int mes_v11_0_sw_fini(void *handle)
 	return 0;
 }
 
+static void mes_v11_0_kiq_dequeue_sched(struct amdgpu_device *adev)
+{
+	uint32_t data;
+	int i;
+
+	mutex_lock(&adev->srbm_mutex);
+	soc21_grbm_select(adev, 3, AMDGPU_MES_SCHED_PIPE, 0, 0);
+
+	/* disable the queue if it's active */
+	if (RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1) {
+		WREG32_SOC15(GC, 0, regCP_HQD_DEQUEUE_REQUEST, 1);
+		for (i = 0; i < adev->usec_timeout; i++) {
+			if (!(RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1))
+				break;
+			udelay(1);
+		}
+	}
+	data = RREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL);
+	data = REG_SET_FIELD(data, CP_HQD_PQ_DOORBELL_CONTROL,
+				DOORBELL_EN, 0);
+	data = REG_SET_FIELD(data, CP_HQD_PQ_DOORBELL_CONTROL,
+				DOORBELL_HIT, 1);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL, data);
+
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL, 0);
+
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_LO, 0);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_HI, 0);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_RPTR, 0);
+
+	soc21_grbm_select(adev, 0, 0, 0, 0);
+	mutex_unlock(&adev->srbm_mutex);
+
+	adev->mes.ring.sched.ready = false;
+}
+
 static void mes_v11_0_kiq_setting(struct amdgpu_ring *ring)
 {
 	uint32_t tmp;
@@ -1196,6 +1232,9 @@ static int mes_v11_0_kiq_hw_init(struct amdgpu_device *adev)
 
 static int mes_v11_0_kiq_hw_fini(struct amdgpu_device *adev)
 {
+	if (adev->mes.ring.sched.ready)
+		mes_v11_0_kiq_dequeue_sched(adev);
+
 	mes_v11_0_enable(adev, false);
 	return 0;
 }
@@ -1251,9 +1290,6 @@ static int mes_v11_0_hw_init(void *handle)
 
 static int mes_v11_0_hw_fini(void *handle)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	adev->mes.ring.sched.ready = false;
 	return 0;
 }
 
-- 
2.35.1

