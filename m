Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531365B4927
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 23:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC5510E2D2;
	Sat, 10 Sep 2022 21:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607CB10E2D0;
 Sat, 10 Sep 2022 21:17:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC06F60DD4;
 Sat, 10 Sep 2022 21:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84386C433D7;
 Sat, 10 Sep 2022 21:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662844649;
 bh=O8LyJ2dh77oOAtphyWd2GJpRCqwx+s/ZIAoEibIkxp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BaxxWCO22RKZL52Q6OLitw866MMydMWtq6yDkIjP0EB1a+6/4KiY9+jCCafYebFLS
 BuULkneZjdZSvVyEABuCF1hLafldFbUH9aOkyc32/aTrbeGzsQnxPfNwPmqn2efNCM
 AvnGe5LnWjbzVgQhuAdeU3GPO826lFl6oEPVSgWfDStu0MVXzqBLFDivCxMyn8GWdr
 4quZYAqzhGC/G2J3DWj1m04FzdgVa7nwik9opb5fuiJ4U3vJYhSd9TLnuojVPgtmFX
 aRWIb9rfjdrKzj0Rg7gNlYWmhX6qJBxQWRTg9GGPeR6vuM4Trt0IR0YjwPCsLW5INx
 6eNXY696zmJDg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 28/38] drm/amd/amdgpu: skip ucode loading if
 ucode_size == 0
Date: Sat, 10 Sep 2022 17:16:13 -0400
Message-Id: <20220910211623.69825-28-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910211623.69825-1-sashal@kernel.org>
References: <20220910211623.69825-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tao.zhou1@amd.com,
 Chengming Gui <Jack.Gui@amd.com>, guchun.chen@amd.com, airlied@linux.ie,
 Bokun.Zhang@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Likun.Gao@amd.com, candice.li@amd.com, john.clements@amd.com,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chengming Gui <Jack.Gui@amd.com>

[ Upstream commit 39c84b8e929dbd4f63be7e04bf1a2bcd92b44177 ]

Restrict the ucode loading check to avoid frontdoor loading error.

Signed-off-by: Chengming Gui <Jack.Gui@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index e9411c28d88ba..c50f0d336e158 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2372,7 +2372,7 @@ static int psp_load_smu_fw(struct psp_context *psp)
 static bool fw_load_skip_check(struct psp_context *psp,
 			       struct amdgpu_firmware_info *ucode)
 {
-	if (!ucode->fw)
+	if (!ucode->fw || !ucode->ucode_size)
 		return true;
 
 	if (ucode->ucode_id == AMDGPU_UCODE_ID_SMC &&
-- 
2.35.1

