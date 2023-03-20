Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7F6C0710
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 01:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D62B10E0D5;
	Mon, 20 Mar 2023 00:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE84B10E0AB;
 Mon, 20 Mar 2023 00:54:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BC05611E3;
 Mon, 20 Mar 2023 00:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843C9C433EF;
 Mon, 20 Mar 2023 00:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679273651;
 bh=o2hSVSgxLu9H00c5eClJaIkDhqs030/SP8ijcu8C2BU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ed39Um3RcwmCVjyJJlC/QGFTGc6QmZJsk3H6X6t66+v1W/d8H8cb5d+ysE7SWdUsH
 OLttwpVa+XVh9YvKUFwleCQPCsKCpUtkeLHRxwTuoWvWi7LW9PSmBS/uHlBxyXlGCk
 Ptf8aYUy3CcUBqdWsdQJCCzKX7imd65qj+JoPnKKfCA3TMj246xu17V4JeEyU4UTV1
 pYyzyYlfKW12a2bFFfve9KTt3NlfZTMhSwRHkDlSk8EYVe7/WKb4hL9syJFoZfm+t1
 0SMMCQwS51eUE8nYstrgwfd/6Ty1sCVTTBPzNM4l4LQ3UxNcFxkKfcXU38eh1lSAxY
 uV8GYqEsHd/Kg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 30/30] drm/amd: Fix initialization mistake for
 NBIO 7.3.0
Date: Sun, 19 Mar 2023 20:52:55 -0400
Message-Id: <20230320005258.1428043-30-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320005258.1428043-1-sashal@kernel.org>
References: <20230320005258.1428043-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, Thomas Glanzmann <thomas@glanzmann.de>,
 amd-gfx@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit 1717cc5f2962a4652c76ed3858b499ccae6c277c ]

The same strapping initialization issue that happened on NBIO 7.5.1
appears to be happening on NBIO 7.3.0.
Apply the same fix to 7.3.0 as well.

Note: This workaround relies upon the integrated GPU being enabled
in BIOS. If the integrated GPU is disabled in BIOS a different
workaround will be required.

Reported-by: Thomas Glanzmann <thomas@glanzmann.de>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Link: https://lore.kernel.org/linux-usb/Y%2Fz9GdHjPyF2rNG3@glanzmann.de/T/#u
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c
index 4b0d563c6522c..4ef1fa4603c8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c
@@ -382,11 +382,6 @@ static void nbio_v7_2_init_registers(struct amdgpu_device *adev)
 		if (def != data)
 			WREG32_PCIE_PORT(SOC15_REG_OFFSET(NBIO, 0, regBIF1_PCIE_MST_CTRL_3), data);
 		break;
-	case IP_VERSION(7, 5, 1):
-		data = RREG32_SOC15(NBIO, 0, regRCC_DEV2_EPF0_STRAP2);
-		data &= ~RCC_DEV2_EPF0_STRAP2__STRAP_NO_SOFT_RESET_DEV2_F0_MASK;
-		WREG32_SOC15(NBIO, 0, regRCC_DEV2_EPF0_STRAP2, data);
-		fallthrough;
 	default:
 		def = data = RREG32_PCIE_PORT(SOC15_REG_OFFSET(NBIO, 0, regPCIE_CONFIG_CNTL));
 		data = REG_SET_FIELD(data, PCIE_CONFIG_CNTL,
@@ -399,6 +394,15 @@ static void nbio_v7_2_init_registers(struct amdgpu_device *adev)
 		break;
 	}
 
+	switch (adev->ip_versions[NBIO_HWIP][0]) {
+	case IP_VERSION(7, 3, 0):
+	case IP_VERSION(7, 5, 1):
+		data = RREG32_SOC15(NBIO, 0, regRCC_DEV2_EPF0_STRAP2);
+		data &= ~RCC_DEV2_EPF0_STRAP2__STRAP_NO_SOFT_RESET_DEV2_F0_MASK;
+		WREG32_SOC15(NBIO, 0, regRCC_DEV2_EPF0_STRAP2, data);
+		break;
+	}
+
 	if (amdgpu_sriov_vf(adev))
 		adev->rmmio_remap.reg_offset = SOC15_REG_OFFSET(NBIO, 0,
 			regBIF_BX_PF0_HDP_MEM_COHERENCY_FLUSH_CNTL) << 2;
-- 
2.39.2

