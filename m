Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CDAAAA39E
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E09010E60B;
	Mon,  5 May 2025 23:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ir5AZy11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE65910E60D;
 Mon,  5 May 2025 23:17:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5DAAC43D81;
 Mon,  5 May 2025 23:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF07C4CEE4;
 Mon,  5 May 2025 23:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746487036;
 bh=uBdoissBPpGSULb9insgyqATPgy7GITB84igV0I3bo8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ir5AZy11nZcAizCdGy+1r7A5a+fL0Ej4mdDkSyIMI2UHyfWjWgmdvkiQ6FJ5vjwEJ
 EFKytDhtJYTQTXQGc4CCxyR7W0mdkxN9J73hr3n/mIbE/ilI0QwN9psUFAiFWh0WZP
 8RQSgV+W4s/dqxL3lCtUdPfgoo/Ip07pt1C1HdsmwdVsbNh6sYSmnWIfgB9yruSDfK
 ZWbClV5DpO5CsKI36XKQdhwCeLU92VsARDc1StTV2FLwgi3YOZfkumZAlNWD/m6p2Q
 VTgDmWdbPB6vvYArGhRHF7EoKe8HNIPqN3WNfHbIXCdIoVC4+joh2YEDtirTU1XYlu
 4YpBr0+FlYt2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jiang Liu <gerry@linux.alibaba.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 Hawking.Zhang@amd.com, sunil.khatri@amd.com, candice.li@amd.com,
 YiPeng.Chai@amd.com, le.ma@amd.com, Feifei.Xu@amd.com,
 kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.15 121/153] drm/amdgpu: reset psp->cmd to NULL after
 releasing the buffer
Date: Mon,  5 May 2025 19:12:48 -0400
Message-Id: <20250505231320.2695319-121-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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
index a8b7f0aeacf83..64bf24b64446b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -353,7 +353,6 @@ static int psp_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct psp_context *psp = &adev->psp;
-	struct psp_gfx_cmd_resp *cmd = psp->cmd;
 
 	psp_memory_training_fini(psp);
 	if (psp->sos_fw) {
@@ -373,8 +372,8 @@ static int psp_sw_fini(void *handle)
 	    adev->asic_type == CHIP_SIENNA_CICHLID)
 		psp_sysfs_fini(adev);
 
-	kfree(cmd);
-	cmd = NULL;
+	kfree(psp->cmd);
+	psp->cmd = NULL;
 
 	amdgpu_bo_free_kernel(&psp->fw_pri_bo,
 			      &psp->fw_pri_mc_addr, &psp->fw_pri_buf);
-- 
2.39.5

