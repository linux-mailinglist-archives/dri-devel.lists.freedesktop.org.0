Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F08AAA062
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE13C10E4DA;
	Mon,  5 May 2025 22:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FVp29ebp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3358C10E4DA;
 Mon,  5 May 2025 22:34:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A9EEC61F1B;
 Mon,  5 May 2025 22:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D06C4CEED;
 Mon,  5 May 2025 22:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484451;
 bh=xbQ9eJGPBB3lRC4J/VGPKmPFiKUbGRPltUQOe3JUaMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FVp29ebpFE4H1aRoO2OBZexhrn0+iGV2uU997AF+F2XJ7j7JOQVEV6wo8SGcHkReV
 gDoVdREmeUzzqeFIfQjOcORdcyMzZDloWgJRzcQ1LX4rdgtM+v33Rrwkt4LhHFz1Rr
 tx13JJLtwH/OLKl/SiqJj8th2u0s3POMXYmMqFRmOi8VBrQQydobxIHUW1koskQF6R
 ko1sMP3zts7218uPgjdTN6e1KcLvro1EWWnomRi0N3KN1Z+RBt0BxXWlgHvNhrKA8y
 Zcx9TbKelR+7awp+63Qy+86x0g3uaGh5vGXGs35Agm464X9dg4NbSWo4w393BYLHSo
 JAbHxtB+f2NiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 tao.zhou1@amd.com, YiPeng.Chai@amd.com, zhigang.luo@amd.com,
 victor.skvortsov@amd.com, sunil.khatri@amd.com, boyuan.zhang@amd.com,
 alex.sierra@amd.com, le.ma@amd.com, shane.xiao@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 480/642] drm/amdgpu: Use active umc info from
 discovery
Date: Mon,  5 May 2025 18:11:36 -0400
Message-Id: <20250505221419.2672473-480-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

[ Upstream commit f7a594e40517fa2ab25d5ca10e7b6a158f529fb5 ]

There could be configs where some UMC instances are harvested. This
information is obtained through discovery data and populated in
umc.active_mask. Avoid reassigning this as AID mask, instead use the
mask directly while iterating through umc instances. This is to avoid
accesses to harvested UMC instances.

v2: fix warning (Alex)

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c | 42 +++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   |  1 -
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
index eafe20d8fe0b6..0a1ef95b28668 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
@@ -387,6 +387,45 @@ int amdgpu_umc_fill_error_record(struct ras_err_data *err_data,
 	return 0;
 }
 
+static int amdgpu_umc_loop_all_aid(struct amdgpu_device *adev, umc_func func,
+				   void *data)
+{
+	uint32_t umc_node_inst;
+	uint32_t node_inst;
+	uint32_t umc_inst;
+	uint32_t ch_inst;
+	int ret;
+
+	/*
+	 * This loop is done based on the following -
+	 * umc.active mask = mask of active umc instances across all nodes
+	 * umc.umc_inst_num = maximum number of umc instancess per node
+	 * umc.node_inst_num = maximum number of node instances
+	 * Channel instances are not assumed to be harvested.
+	 */
+	dev_dbg(adev->dev, "active umcs :%lx umc_inst per node: %d",
+		adev->umc.active_mask, adev->umc.umc_inst_num);
+	for_each_set_bit(umc_node_inst, &(adev->umc.active_mask),
+			 adev->umc.node_inst_num * adev->umc.umc_inst_num) {
+		node_inst = umc_node_inst / adev->umc.umc_inst_num;
+		umc_inst = umc_node_inst % adev->umc.umc_inst_num;
+		LOOP_UMC_CH_INST(ch_inst) {
+			dev_dbg(adev->dev,
+				"node_inst :%d umc_inst: %d ch_inst: %d",
+				node_inst, umc_inst, ch_inst);
+			ret = func(adev, node_inst, umc_inst, ch_inst, data);
+			if (ret) {
+				dev_err(adev->dev,
+					"Node %d umc %d ch %d func returns %d\n",
+					node_inst, umc_inst, ch_inst, ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
 int amdgpu_umc_loop_channels(struct amdgpu_device *adev,
 			umc_func func, void *data)
 {
@@ -395,6 +434,9 @@ int amdgpu_umc_loop_channels(struct amdgpu_device *adev,
 	uint32_t ch_inst         = 0;
 	int ret = 0;
 
+	if (adev->aid_mask)
+		return amdgpu_umc_loop_all_aid(adev, func, data);
+
 	if (adev->umc.node_inst_num) {
 		LOOP_UMC_EACH_NODE_INST_AND_CH(node_inst, umc_inst, ch_inst) {
 			ret = func(adev, node_inst, umc_inst, ch_inst, data);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 5250b470e5ef3..f1dc9e50d67e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1504,7 +1504,6 @@ static void gmc_v9_0_set_umc_funcs(struct amdgpu_device *adev)
 		adev->umc.umc_inst_num = UMC_V12_0_UMC_INSTANCE_NUM;
 		adev->umc.node_inst_num /= UMC_V12_0_UMC_INSTANCE_NUM;
 		adev->umc.channel_offs = UMC_V12_0_PER_CHANNEL_OFFSET;
-		adev->umc.active_mask = adev->aid_mask;
 		adev->umc.retire_unit = UMC_V12_0_BAD_PAGE_NUM_PER_CHANNEL;
 		if (!adev->gmc.xgmi.connected_to_cpu && !adev->gmc.is_app_apu)
 			adev->umc.ras = &umc_v12_0_ras;
-- 
2.39.5

