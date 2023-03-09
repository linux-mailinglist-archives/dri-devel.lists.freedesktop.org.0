Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075C16B1A03
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 04:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D2010E782;
	Thu,  9 Mar 2023 03:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2352410E782;
 Thu,  9 Mar 2023 03:37:02 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VdRlr5N_1678333015; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VdRlr5N_1678333015) by smtp.aliyun-inc.com;
 Thu, 09 Mar 2023 11:36:59 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Remove useless else if
Date: Thu,  9 Mar 2023 11:36:54 +0800
Message-Id: <20230309033654.64762-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The assignment of the else and if branches is the same, so the if else
here is redundant, so we remove it.

./drivers/gpu/drm/amd/amdgpu/nv.c:1048:2-4: WARNING: possible condition with no effect (if == else).

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4454
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 855d390c41de..84803929f7d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -1045,19 +1045,11 @@ static int nv_common_late_init(void *handle)
 
 	if (amdgpu_sriov_vf(adev)) {
 		xgpu_nv_mailbox_get_irq(adev);
-		if (adev->vcn.harvest_config & AMDGPU_VCN_HARVEST_VCN0) {
-			amdgpu_virt_update_sriov_video_codec(adev,
-							     sriov_sc_video_codecs_encode_array,
-							     ARRAY_SIZE(sriov_sc_video_codecs_encode_array),
-							     sriov_sc_video_codecs_decode_array_vcn1,
-							     ARRAY_SIZE(sriov_sc_video_codecs_decode_array_vcn1));
-		} else {
-			amdgpu_virt_update_sriov_video_codec(adev,
-							     sriov_sc_video_codecs_encode_array,
-							     ARRAY_SIZE(sriov_sc_video_codecs_encode_array),
-							     sriov_sc_video_codecs_decode_array_vcn1,
-							     ARRAY_SIZE(sriov_sc_video_codecs_decode_array_vcn1));
-		}
+		amdgpu_virt_update_sriov_video_codec(adev,
+						     sriov_sc_video_codecs_encode_array,
+						     ARRAY_SIZE(sriov_sc_video_codecs_encode_array),
+						     sriov_sc_video_codecs_decode_array_vcn1,
+						     ARRAY_SIZE(sriov_sc_video_codecs_decode_array_vcn1));
 	}
 
 	return 0;
-- 
2.20.1.7.g153144c

