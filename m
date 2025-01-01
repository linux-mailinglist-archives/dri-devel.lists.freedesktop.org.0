Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1149FF2B7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2025 03:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0619F10E053;
	Wed,  1 Jan 2025 02:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 01 Jan 2025 02:04:03 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C75810E053;
 Wed,  1 Jan 2025 02:04:03 +0000 (UTC)
X-UUID: f3739570c7e311efa216b1d71e6e1362-20250101
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME,
 HR_CTE_8B
 HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
 HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
 HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
 IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED, SA_EXISTED
 SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
 CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
 GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI, AMN_C_BU ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:00d7d4d2-412f-437b-a14a-9d9e806fd293, IP:20,
 URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-11,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:34
X-CID-INFO: VERSION:1.1.41, REQID:00d7d4d2-412f-437b-a14a-9d9e806fd293, IP:20,
 UR
 L:0,TC:0,Content:0,EDM:25,RT:0,SF:-11,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:34
X-CID-META: VersionHash:6dc6a47, CLOUDID:c962db3edbf0472f98c095c96c7f3521,
 BulkI
 D:250101095635DSZNSNZN,BulkQuantity:1,Recheck:0,SF:17|19|25|44|66|78|102,T
 C:nil,Content:0|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC:ni
 l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: f3739570c7e311efa216b1d71e6e1362-20250101
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw.kylinos.cn
 (envelope-from <yaolu@kylinos.cn>) (Generic MTA)
 with ESMTP id 682118992; Wed, 01 Jan 2025 09:58:52 +0800
From: Lu Yao <yaolu@kylinos.cn>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Cc: felix.kuehling@amd.com, shashank.sharma@amd.com, tvrtko.ursulin@igalia.com,
 zhenguo.yin@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/amdgpu: Add null pointer check before task_info get and
 put
Date: Wed,  1 Jan 2025 09:58:30 +0800
Message-Id: <20250101015830.63570-1-yaolu@kylinos.cn>
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

This patch add null pointer check for amdgpu_vm_put_task_info and
amdgpu_vm_get_task_info_vm, because there is only a warning if create
task_info failed in amdgpu_vm_init.

Fixes: b8f67b9ddf4f ("drm/amdgpu: change vm->task_info handling")
Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index c9c48b782ec1..65edd74bd944 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2336,7 +2336,8 @@ amdgpu_vm_get_vm_from_pasid(struct amdgpu_device *adev, u32 pasid)
  */
 void amdgpu_vm_put_task_info(struct amdgpu_task_info *task_info)
 {
-	kref_put(&task_info->refcount, amdgpu_vm_destroy_task_info);
+	if (task_info)
+		kref_put(&task_info->refcount, amdgpu_vm_destroy_task_info);
 }
 
 /**
@@ -2352,7 +2353,7 @@ amdgpu_vm_get_task_info_vm(struct amdgpu_vm *vm)
 {
 	struct amdgpu_task_info *ti = NULL;
 
-	if (vm) {
+	if (vm && vm->task_info) {
 		ti = vm->task_info;
 		kref_get(&vm->task_info->refcount);
 	}
-- 
2.25.1

