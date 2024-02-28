Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E886A5C2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 02:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C2810E0D9;
	Wed, 28 Feb 2024 01:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606A710E0D9;
 Wed, 28 Feb 2024 01:44:44 +0000 (UTC)
X-UUID: e372564b6c6346f5a530e4e7c953ba67-20240228
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:88b45a86-72ae-420f-8cae-71d289904034, IP:10,
 URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:20
X-CID-INFO: VERSION:1.1.37, REQID:88b45a86-72ae-420f-8cae-71d289904034, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:20
X-CID-META: VersionHash:6f543d0, CLOUDID:494be480-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:240228094440JA95B6XN,BulkQuantity:0,Recheck:0,SF:66|38|24|17|19|44|1
 02,TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:
 nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: e372564b6c6346f5a530e4e7c953ba67-20240228
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <yaolu@kylinos.cn>) (Generic MTA)
 with ESMTP id 1595601688; Wed, 28 Feb 2024 09:44:37 +0800
From: Lu Yao <yaolu@kylinos.cn>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/amdgpu: Fix assignment errors in 'si_common_early_init'
 functions
Date: Wed, 28 Feb 2024 09:44:35 +0800
Message-Id: <20240228014435.7234-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

uvd_ctx_rreg/uvd_ctx_wreg correct value requires function pointer.

Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/si.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index a757526153e5..455d49f7bd9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -2032,8 +2032,8 @@ static int si_common_early_init(void *handle)
 	adev->pcie_wreg = &si_pcie_wreg;
 	adev->pciep_rreg = &si_pciep_rreg;
 	adev->pciep_wreg = &si_pciep_wreg;
-	adev->uvd_ctx_rreg = si_uvd_ctx_rreg;
-	adev->uvd_ctx_wreg = si_uvd_ctx_wreg;
+	adev->uvd_ctx_rreg = &si_uvd_ctx_rreg;
+	adev->uvd_ctx_wreg = &si_uvd_ctx_wreg;
 	adev->didt_rreg = NULL;
 	adev->didt_wreg = NULL;
 
-- 
2.25.1

