Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB0CAAA2B3
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30ED410E5C7;
	Mon,  5 May 2025 23:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S6nm6vIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AE710E5C7;
 Mon,  5 May 2025 23:04:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7E670A4D305;
 Mon,  5 May 2025 22:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73BAC4CEED;
 Mon,  5 May 2025 23:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486246;
 bh=DeY8uxQA1x9ocfmMil2jLWQfLGARUOIkI3MCrBHp49g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S6nm6vIly6nigL3nm22+vo9D9lOshcOFolQ0YbXw3tqxF0AQmroFjZLJZ4hXo1lp4
 u2ad7KOBlFZPUIGPRv5UPN9S+3E4yezhOCRVlAeoKZ/A5bMg+Dk1DoWjrBLR8HP/1z
 brTGCNf3ELD4oglUWhVAuOIj6z8EsFx3g+AdqxlGCxJ6Yl9k+Beyh9QiHuXMw9aW6b
 02bnF09NDGALib6QSBa5Y2xmNDWXdbNyDjFGpj7BXGm+BsEuc+BWwh5gRZp3dbywJ+
 B9G8AnUWGSBTPZXN7nQ5x3qtsHyN18WC11YXuezMjc6b126Ue/1jiFslg2N2rBaF1c
 BFgVFJLCqN4rg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jiang Liu <gerry@linux.alibaba.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 Hawking.Zhang@amd.com, sunil.khatri@amd.com, YiPeng.Chai@amd.com,
 candice.li@amd.com, le.ma@amd.com, Feifei.Xu@amd.com,
 kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 224/294] drm/amdgpu: reset psp->cmd to NULL after
 releasing the buffer
Date: Mon,  5 May 2025 18:55:24 -0400
Message-Id: <20250505225634.2688578-224-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index 6a24e8ceb9449..a4ab02c85f65b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -506,7 +506,6 @@ static int psp_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct psp_context *psp = &adev->psp;
-	struct psp_gfx_cmd_resp *cmd = psp->cmd;
 
 	psp_memory_training_fini(psp);
 
@@ -516,8 +515,8 @@ static int psp_sw_fini(void *handle)
 	amdgpu_ucode_release(&psp->cap_fw);
 	amdgpu_ucode_release(&psp->toc_fw);
 
-	kfree(cmd);
-	cmd = NULL;
+	kfree(psp->cmd);
+	psp->cmd = NULL;
 
 	psp_free_shared_bufs(psp);
 
-- 
2.39.5

