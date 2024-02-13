Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBBE852349
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 01:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4F510E66C;
	Tue, 13 Feb 2024 00:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wm4Q5C6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2727A10E66C;
 Tue, 13 Feb 2024 00:22:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9DAE76101E;
 Tue, 13 Feb 2024 00:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FBFC433F1;
 Tue, 13 Feb 2024 00:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707783738;
 bh=aMAgC0uSzdSH+LBgNOd4d9/zLeS3JaOvXR7L7AeKLpU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wm4Q5C6vYN4lIG3+4aomy5V5thYCbVPdhb0o0XJETHYMTjO3fgMlGw/bTwLpC1Ltu
 wqB6L4qKQ8f9QHhpUzBDbCRUESi/dE0vSqldNh/7KjcRwW7P+WDRSnJ2KWX0IzdAci
 aN/KKZk5uTS0bpEhmIJMPBePXvggVjs+9kGdXPG8mvLlt8dBwltf1EHyCz6OihnTdZ
 UwfBXZ6evUT/jIVGsnrHT10bYR/XFf8n7ro7XbtPW9yYCXw5bXNigC8gOMmGIv/83l
 oVfoVFxatnaor31m16O0vm15YUecIVJSP2mQW5wgjlpJ2PaJeTwdV9dW/aR2tqy+ol
 8jePbBqlcn4Gw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, le.ma@amd.com, Felix.Kuehling@amd.com, James.Zhu@amd.com,
 tao.zhou1@amd.com, asad.kamal@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 46/51] drm/amdgpu: Fix HDP flush for VFs on nbio
 v7.9
Date: Mon, 12 Feb 2024 19:20:23 -0500
Message-ID: <20240213002052.670571-46-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213002052.670571-1-sashal@kernel.org>
References: <20240213002052.670571-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.16
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

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit 534c8a5b9d5d41d30cdcac93cfa1bca5e17be009 ]

HDP flush remapping is not done for VFs. Keep the original offsets in VF
environment.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
index ae45656eb877..0a601336cf69 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
@@ -426,6 +426,12 @@ static void nbio_v7_9_init_registers(struct amdgpu_device *adev)
 	u32 inst_mask;
 	int i;
 
+	if (amdgpu_sriov_vf(adev))
+		adev->rmmio_remap.reg_offset =
+			SOC15_REG_OFFSET(
+				NBIO, 0,
+				regBIF_BX_DEV0_EPF0_VF0_HDP_MEM_COHERENCY_FLUSH_CNTL)
+			<< 2;
 	WREG32_SOC15(NBIO, 0, regXCC_DOORBELL_FENCE,
 		0xff & ~(adev->gfx.xcc_mask));
 
-- 
2.43.0

