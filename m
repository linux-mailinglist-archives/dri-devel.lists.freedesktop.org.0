Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1DE537CE2
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDA910E9B0;
	Mon, 30 May 2022 13:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (unknown [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C86110E9B5;
 Mon, 30 May 2022 13:41:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A16960FC6;
 Mon, 30 May 2022 13:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F123C36AEA;
 Mon, 30 May 2022 13:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918097;
 bh=hNsuAn+9pufZEh6kmLrx7j6VD2duSU6sqeBA0OR8Qe0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lLtdw+4BRN9Qhfcve6zk4lpTlCEnXNBR2FCjtowFDKLOwlyRaO69gPKvAjYPufdRl
 L297KtZQcCps61tYpjb1m/i2KbjYNFWEjJo4k5klwZoD5kC1f3A1xFaV1JhWwOCp7X
 NEOSWJXQ0diwCMfQ45K//lnOJaaEd0fm1GVyh09n1wNzO3a3ytWiXC1dGryFpP84bL
 pPq3pie3nLD5HOI1KmSjdgCZMO8W5ER23CvbMl/vbNg2TXTBYpRQXi2nql6TBObE2f
 bNPCzUBzPCv6ffZe4+mVHqk3j1c2/prggmQ3Bk4dLJDpODeTWfUGoD0go8czs1fqLB
 QHjyEBfbAeRHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 058/109] drm/amdgpu/ucode: Remove firmware load
 type check in amdgpu_ucode_free_bo
Date: Mon, 30 May 2022 09:37:34 -0400
Message-Id: <20220530133825.1933431-58-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133825.1933431-1-sashal@kernel.org>
References: <20220530133825.1933431-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie, lang.yu@amd.com,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 Alice Wong <shiwei.wong@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Likun.Gao@amd.com,
 candice.li@amd.com, john.clements@amd.com, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alice Wong <shiwei.wong@amd.com>

[ Upstream commit ab0cd4a9ae5b4679b714d8dbfedc0901fecdce9f ]

When psp_hw_init failed, it will set the load_type to AMDGPU_FW_LOAD_DIRECT.
During amdgpu_device_ip_fini, amdgpu_ucode_free_bo checks that load_type is
AMDGPU_FW_LOAD_DIRECT and skips deallocating fw_buf causing memory leak.
Remove load_type check in amdgpu_ucode_free_bo.

Signed-off-by: Alice Wong <shiwei.wong@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index abd8469380e5..0ed0736d515a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -723,8 +723,7 @@ int amdgpu_ucode_create_bo(struct amdgpu_device *adev)
 
 void amdgpu_ucode_free_bo(struct amdgpu_device *adev)
 {
-	if (adev->firmware.load_type != AMDGPU_FW_LOAD_DIRECT)
-		amdgpu_bo_free_kernel(&adev->firmware.fw_buf,
+	amdgpu_bo_free_kernel(&adev->firmware.fw_buf,
 		&adev->firmware.fw_buf_mc,
 		&adev->firmware.fw_buf_ptr);
 }
-- 
2.35.1

