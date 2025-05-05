Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59679AAA1DB
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFC410E572;
	Mon,  5 May 2025 22:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fo68soao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D76510E572;
 Mon,  5 May 2025 22:52:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 25C47629C3;
 Mon,  5 May 2025 22:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239E4C4CEE4;
 Mon,  5 May 2025 22:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485548;
 bh=oWGPC7/7Y2jTJLRveUSGLzf+umKCPcm32U+xNhZ4HhM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fo68soao4zPcFaEm8+jfQ+2fkVw/WPvvpQtVVNxTm9gt2KfJtoFcR+8yGzddHkOXi
 zQEsCvondrDLwuJch8ZbD0wZcZ3MdPxjO3G3Vf8CAki7VhM+B1I/GJ5LDny/35AhoL
 GLaMaivOodVACXN3nZFkEV1hkjg5OILrClum+rkfqeIRdpv++3YkA41I1O1h1pQFmX
 cDg+ewn5ehS22yu7Ptq6AOvNUvg3C4Tu8OqzQ2MLCNZYcGlBTf24r6/i1J/83Hd236
 qBrycav0K/wAAy+abzS1ILSPYj2C5HDAqwirLgMgSuk2BXD9OjyKB4C3haGy42RddA
 ZfhIudL5+nqNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Asad Kamal <asad.kamal@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 kenneth.feng@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Hawking.Zhang@amd.com, kevinyang.wang@amd.com,
 Jesse.zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 366/486] drm/amd/pm: Skip P2S load for SMU
 v13.0.12
Date: Mon,  5 May 2025 18:37:22 -0400
Message-Id: <20250505223922.2682012-366-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Asad Kamal <asad.kamal@amd.com>

[ Upstream commit 1fb85819d629676f1d53f40c3fffa25a33a881e4 ]

Skip P2S table load for SMU v13.0.12

Signed-off-by: Asad Kamal <asad.kamal@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index 55ed6247eb61f..9ac694c4f1f7a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -275,8 +275,9 @@ static int smu_v13_0_6_init_microcode(struct smu_context *smu)
 	int var = (adev->pdev->device & 0xF);
 	char ucode_prefix[15];
 
-	/* No need to load P2S tables in IOV mode */
-	if (amdgpu_sriov_vf(adev))
+	/* No need to load P2S tables in IOV mode or for smu v13.0.12 */
+	if (amdgpu_sriov_vf(adev) ||
+	    (amdgpu_ip_version(smu->adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 12)))
 		return 0;
 
 	if (!(adev->flags & AMD_IS_APU)) {
-- 
2.39.5

