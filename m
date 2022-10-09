Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 515055F93E5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E1410E2B9;
	Sun,  9 Oct 2022 23:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437F010E2B9;
 Sun,  9 Oct 2022 23:50:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A517460C9B;
 Sun,  9 Oct 2022 23:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB97C433C1;
 Sun,  9 Oct 2022 23:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359423;
 bh=D57F51nhXs+6rwTKvULIB5lh9K58TqPulJrZALO2lFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RTELeqsV4IpYnlBcoO4JHI1C2vkJW2lb10mUBZyR5Ctfx2YVO6fQxQUK2WWdxSpIJ
 RASE4b47f0WQOhDZ3YH4hMb2FvoRP/khcct51GaIxj+CJtfeRxTnVqVMBzE74jsiFe
 xZPg6zudvg5rIr5NkjE/tnD36ODVUYbY3BZaHZYvDrX+31WZaUQeAZPKuqpJ4StVt4
 8zJn83THEtp/r1dxAZJprfYfKsI1T5KgGLyMzNfgvjgTdNR613CH1kWBCu44Ii51Wt
 ptLmoPn9po+A/Mj8W/DQksH+sNSVwHGEkdveXTLiGIOoKTHtJqk662H7+zrn7I8OGa
 tWKlPlbAgJArg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 14/44] drm/amdgpu: Skip the program of
 MMMC_VM_AGP_* in SRIOV on MMHUB v3_0_0
Date: Sun,  9 Oct 2022 19:49:02 -0400
Message-Id: <20221009234932.1230196-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009234932.1230196-1-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, tianci.yin@amd.com, Jack.Gui@amd.com,
 Horace Chen <horace.chen@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Likun.Gao@amd.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Yifan Zha <Yifan.Zha@amd.com>, evan.quan@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yifan Zha <Yifan.Zha@amd.com>

[ Upstream commit c1026c6f319724dc88fc08d9d9d35bcbdf492b42 ]

[Why]
VF should not program these registers, the value were defined in the host.

[How]
Skip writing them in SRIOV environment and program them on host side.

Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Yifan Zha <Yifan.Zha@amd.com>
Signed-off-by: Horace Chen <horace.chen@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c
index bc11b2de37ae..a1d26c4d80b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c
@@ -169,17 +169,17 @@ static void mmhub_v3_0_init_system_aperture_regs(struct amdgpu_device *adev)
 	uint64_t value;
 	uint32_t tmp;
 
-	/* Disable AGP. */
-	WREG32_SOC15(MMHUB, 0, regMMMC_VM_AGP_BASE, 0);
-	WREG32_SOC15(MMHUB, 0, regMMMC_VM_AGP_TOP, 0);
-	WREG32_SOC15(MMHUB, 0, regMMMC_VM_AGP_BOT, 0x00FFFFFF);
-
 	if (!amdgpu_sriov_vf(adev)) {
 		/*
 		 * the new L1 policy will block SRIOV guest from writing
 		 * these regs, and they will be programed at host.
 		 * so skip programing these regs.
 		 */
+		/* Disable AGP. */
+		WREG32_SOC15(MMHUB, 0, regMMMC_VM_AGP_BASE, 0);
+		WREG32_SOC15(MMHUB, 0, regMMMC_VM_AGP_TOP, 0);
+		WREG32_SOC15(MMHUB, 0, regMMMC_VM_AGP_BOT, 0x00FFFFFF);
+
 		/* Program the system aperture low logical page number. */
 		WREG32_SOC15(MMHUB, 0, regMMMC_VM_SYSTEM_APERTURE_LOW_ADDR,
 			     adev->gmc.vram_start >> 18);
-- 
2.35.1

