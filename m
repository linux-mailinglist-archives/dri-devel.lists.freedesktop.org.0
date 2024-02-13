Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B285232F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 01:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D93B10E4E2;
	Tue, 13 Feb 2024 00:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UdorAmTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42C810E665;
 Tue, 13 Feb 2024 00:20:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2FC63CE17DF;
 Tue, 13 Feb 2024 00:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FD2C433F1;
 Tue, 13 Feb 2024 00:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707783619;
 bh=MhB09uoLchKIFVZv5NlKqSE86si9+K7vvDsEosL4XD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UdorAmTmfyiMFu3ccCHFeQnK6OmucxHVOB3OfSqQivfJ7ZznLdUzRJQ2qQTR0zQUf
 gTokOIlLBQyk3y0zkrbOppHJWd8rRPu7ETSnpjLgNnSLPNtm2sVuXX6MdrWl4i5+LL
 PHB3sBUqb8080sWaP7OEyVutOp9pXzzxAq2l48aHOSSEsENgRPGgaj0eEz9cq02t7c
 kh2EoPcCpHoYpcu5N6U/3dvB3cnQ3Wuhv15zHewXMn6cxgR+Yq4kw8wykXuLf7nr08
 LcynmIX4OwSFIKlDJeP8MMscFnp7qb0T6ZZjN3/aeE1lobUX4Ani3tNGkxpgNszIUl
 L1S6/fsGlsMkA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, le.ma@amd.com, Felix.Kuehling@amd.com, James.Zhu@amd.com,
 tao.zhou1@amd.com, asad.kamal@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.7 53/58] drm/amdgpu: Fix HDP flush for VFs on nbio
 v7.9
Date: Mon, 12 Feb 2024 19:17:59 -0500
Message-ID: <20240213001837.668862-53-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213001837.668862-1-sashal@kernel.org>
References: <20240213001837.668862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.4
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
index 25a3da83e0fb..db013f86147a 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
@@ -431,6 +431,12 @@ static void nbio_v7_9_init_registers(struct amdgpu_device *adev)
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

