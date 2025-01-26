Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FEDA1C920
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB90610E3FF;
	Sun, 26 Jan 2025 14:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GgLjkV6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E1610E3FC;
 Sun, 26 Jan 2025 14:55:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0DCA65C429B;
 Sun, 26 Jan 2025 14:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CE6C4CEE7;
 Sun, 26 Jan 2025 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903351;
 bh=DbRbu2Eok980IsJKoXz0VGAWjwu7B8uSxCNJX8/iE60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GgLjkV6kvxbXoxuNGdpGj/suLdU1FdFTdTwjWBGAOdTe5pXIpealt0Nu7K7qBJ8oL
 l6tT5VIwaUSezwRBuDVuIzd5QYr8SDbnenyGdnN/TUebi+a1SPBVQiNjynSyf6KUFQ
 x08KyUdR8zZB1HKdXLGgaL56OkqJSFnZpWNB6+6IpyinhxDcand/ATEFiq/byY16FE
 pfGYUEVA3O/v87jgjXUUTmyyXm2gg9QKX2qAPhVeDHehKKDTWHKqY5BsuhO345t+Bv
 YKdQ7Eui3MosR6fRaiGiSOOaiKfX4AL4SPjZjn+8PDjh3GPM1A/msWmEgy6FGcV1a/
 qOAhcTMMa0kzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philip Yang <Philip.Yang@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, Hawking.Zhang@amd.com,
 kevinyang.wang@amd.com, lijo.lazar@amd.com, boyuan.zhang@amd.com,
 jesse.zhang@amd.com, Jiadong.Zhu@amd.com, tao.zhou1@amd.com, le.ma@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 21/31] drm/amdgpu: Don't enable sdma 4.4.5
 CTXEMPTY interrupt
Date: Sun, 26 Jan 2025 09:54:37 -0500
Message-Id: <20250126145448.930220-21-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145448.930220-1-sashal@kernel.org>
References: <20250126145448.930220-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
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

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit b4b7271e5ca95b581f2fcc4ae852c4079215e92d ]

The sdma context empty interrupt is dropped in amdgpu_irq_dispatch
as unregistered interrupt src_id 243, this interrupt accounts to 1/3 of
total interrupts and causes IH primary ring overflow when running
stressful benchmark application. Disable this interrupt has no side
effect found.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index c77889040760a..4dd86c682ee6a 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -953,10 +953,12 @@ static int sdma_v4_4_2_inst_start(struct amdgpu_device *adev,
 		/* set utc l1 enable flag always to 1 */
 		temp = RREG32_SDMA(i, regSDMA_CNTL);
 		temp = REG_SET_FIELD(temp, SDMA_CNTL, UTC_L1_ENABLE, 1);
-		/* enable context empty interrupt during initialization */
-		temp = REG_SET_FIELD(temp, SDMA_CNTL, CTXEMPTY_INT_ENABLE, 1);
-		WREG32_SDMA(i, regSDMA_CNTL, temp);
 
+		if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) < IP_VERSION(4, 4, 5)) {
+			/* enable context empty interrupt during initialization */
+			temp = REG_SET_FIELD(temp, SDMA_CNTL, CTXEMPTY_INT_ENABLE, 1);
+			WREG32_SDMA(i, regSDMA_CNTL, temp);
+		}
 		if (!amdgpu_sriov_vf(adev)) {
 			if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
 				/* unhalt engine */
-- 
2.39.5

