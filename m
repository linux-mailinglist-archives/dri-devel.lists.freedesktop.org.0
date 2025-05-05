Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC8DAAA342
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFE110E5F0;
	Mon,  5 May 2025 23:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ulz3lqEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEED10E5ED;
 Mon,  5 May 2025 23:12:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 812FD5C00B3;
 Mon,  5 May 2025 23:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9E6C4CEED;
 Mon,  5 May 2025 23:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486719;
 bh=TbJ6vTwCvQR/FzOhw+PeOhkfU5Pj1/ek0z5v8QzODss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ulz3lqEdrEhB2NSyb/5i2Fnt0dSe7jEvtv/zI0fYX8DJjnflbZTnLwTeyYEuclIW7
 BQnccJ2LySKcU9d883FM6ubiYIj6O9OD5vZHkfVsrGFBKk4eVs/UNf0f92Ot68KC+L
 WL1cQ2HwsZFZtwn2QktgrKqgRa/pM0hUYHQk3KyVQ1A5+GudZ9Tq1qMSdyrl0TgIKA
 6kvAog2rG94tHef22nvKUBJfi1aaXJfby4kI/enn6u519C2hFsCksS7OwlssXj2xGF
 P5z9pYFIWeiAhmEIxhwB8Z4WQY/ebYK/CwHgYMPhooBnqHqK05/gUkFIemGapU97lC
 SKfhLEv2IWpSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jiang Liu <gerry@linux.alibaba.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 Hawking.Zhang@amd.com, sunil.khatri@amd.com, le.ma@amd.com,
 candice.li@amd.com, YiPeng.Chai@amd.com, Feifei.Xu@amd.com,
 kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 170/212] drm/amdgpu: reset psp->cmd to NULL after
 releasing the buffer
Date: Mon,  5 May 2025 19:05:42 -0400
Message-Id: <20250505230624.2692522-170-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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

From: Jiang Liu <gerry@linux.alibaba.com>

[ Upstream commit e92f3f94cad24154fd3baae30c6dfb918492278d ]

Reset psp->cmd to NULL after releasing the buffer in function psp_sw_fini().

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Jiang Liu <gerry@linux.alibaba.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index f8740ad08af41..a176b1da03bd3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -484,7 +484,6 @@ static int psp_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct psp_context *psp = &adev->psp;
-	struct psp_gfx_cmd_resp *cmd = psp->cmd;
 
 	psp_memory_training_fini(psp);
 	if (psp->sos_fw) {
@@ -511,8 +510,8 @@ static int psp_sw_fini(void *handle)
 	    adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 7))
 		psp_sysfs_fini(adev);
 
-	kfree(cmd);
-	cmd = NULL;
+	kfree(psp->cmd);
+	psp->cmd = NULL;
 
 	psp_free_shared_bufs(psp);
 
-- 
2.39.5

