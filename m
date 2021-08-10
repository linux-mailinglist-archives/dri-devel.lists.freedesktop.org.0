Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782223E5CE0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 16:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A3E6E039;
	Tue, 10 Aug 2021 14:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0B86E039;
 Tue, 10 Aug 2021 14:15:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96FB960F94;
 Tue, 10 Aug 2021 14:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628604954;
 bh=mLwimhvPJUaM0AzE3Rie3EShPwzzNOWD2+XmNKUdug8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bg0ApHyrpF6vIXdGLpztjfImK4DzpHyrab/h75NbNJFKqB0ZuDm7DvkpjqavnbmFU
 FZS/+ljByP8fHxGmM+petpu+cc4tZZQo9X3BMo5g7soNIaiCHuLnGM5UPYTG3qUTA7
 OTfPax769XNgUsJ/yrkSdsk75lZF/xUk1DMzI3ui9KFzCkP9dt5UNCaBcnWOy7OkZp
 6xmph6L+KwlAskOynlNZnVE9pl5aGJAD1OkRDPwiLGUwdvlN/F/BFk/h9Od8Ycxj3L
 isf/Qy9FYdr1I3xPXnyImXTHQFTxBKx5PLEdDZh/9/eR33V5kXnRxRk6Ax1TT3rvhK
 BMNDgOwVuNziQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yifan Zhang <yifan1.zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 12/20] drm/amdgpu: fix the doorbell missing when
 in CGPG issue for renoir.
Date: Tue, 10 Aug 2021 10:15:30 -0400
Message-Id: <20210810141538.3117707-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810141538.3117707-1-sashal@kernel.org>
References: <20210810141538.3117707-1-sashal@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yifan Zhang <yifan1.zhang@amd.com>

[ Upstream commit 1c0539a6fc8a4a4b77278e35d763073890de96b9 ]

If GC has entered CGPG, ringing doorbell > first page doesn't wakeup GC.
Enlarge CP_MEC_DOORBELL_RANGE_UPPER to workaround this issue.

Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index fb15e8b5af32..ac3a88197b2f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1271,6 +1271,16 @@ static bool is_raven_kicker(struct amdgpu_device *adev)
 		return false;
 }
 
+static bool check_if_enlarge_doorbell_range(struct amdgpu_device *adev)
+{
+	if ((adev->asic_type == CHIP_RENOIR) &&
+	    (adev->gfx.me_fw_version >= 0x000000a5) &&
+	    (adev->gfx.me_feature_version >= 52))
+		return true;
+	else
+		return false;
+}
+
 static void gfx_v9_0_check_if_need_gfxoff(struct amdgpu_device *adev)
 {
 	if (gfx_v9_0_should_disable_gfxoff(adev->pdev))
@@ -3619,7 +3629,16 @@ static int gfx_v9_0_kiq_init_register(struct amdgpu_ring *ring)
 	if (ring->use_doorbell) {
 		WREG32_SOC15(GC, 0, mmCP_MEC_DOORBELL_RANGE_LOWER,
 					(adev->doorbell_index.kiq * 2) << 2);
-		WREG32_SOC15(GC, 0, mmCP_MEC_DOORBELL_RANGE_UPPER,
+		/* If GC has entered CGPG, ringing doorbell > first page
+		 * doesn't wakeup GC. Enlarge CP_MEC_DOORBELL_RANGE_UPPER to
+		 * workaround this issue. And this change has to align with firmware
+		 * update.
+		 */
+		if (check_if_enlarge_doorbell_range(adev))
+			WREG32_SOC15(GC, 0, mmCP_MEC_DOORBELL_RANGE_UPPER,
+					(adev->doorbell.size - 4));
+		else
+			WREG32_SOC15(GC, 0, mmCP_MEC_DOORBELL_RANGE_UPPER,
 					(adev->doorbell_index.userqueue_end * 2) << 2);
 	}
 
-- 
2.30.2

