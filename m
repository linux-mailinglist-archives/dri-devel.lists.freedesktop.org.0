Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C444C53929
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 18:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5BD10E0F2;
	Wed, 12 Nov 2025 17:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D0110E0F2;
 Wed, 12 Nov 2025 17:04:48 +0000 (UTC)
X-UUID: af970e5abfe911f0a38c85956e01ac42-20251113
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME,
 HR_CTE_8B
 HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
 HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
 HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
 HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP
 DN_TRUSTED, SRC_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS
 DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF
 GTI_FG_BS, GTI_FG_IT, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
 ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:5ea7b5bf-b2d2-49e6-bfcb-634d4a9bd88c, IP:10,
 U
 RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-INFO: VERSION:1.3.6, REQID:5ea7b5bf-b2d2-49e6-bfcb-634d4a9bd88c, IP:10,
 URL
 :0,TC:0,Content:0,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:5
X-CID-META: VersionHash:a9d874c, CLOUDID:aadf697c3eae803522b2be0009bd78f9,
 BulkI
 D:251113010444QKF7Z84X,BulkQuantity:0,Recheck:0,SF:10|66|78|102|850,TC:nil
 ,Content:0|15|50,EDM:5,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:
 nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: af970e5abfe911f0a38c85956e01ac42-20251113
X-User: hehuiwen@kylinos.cn
Received: from localhost.localdomain [(220.202.195.89)] by mailgw.kylinos.cn
 (envelope-from <hehuiwen@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 1474637080; Thu, 13 Nov 2025 01:04:44 +0800
From: Huiwen He <hehuiwen@kylinos.cn>
To: robin.clark@oss.qualcomm.com
Cc: sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
 abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Huiwen He <hehuiwen@kylinos.cn>
Subject: [PATCH v2] drm/msm: Fix NULL pointer dereference in
 crashstate_get_vm_logs()
Date: Thu, 13 Nov 2025 01:04:11 +0800
Message-Id: <20251112170411.479243-1-hehuiwen@kylinos.cn>
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

crashstate_get_vm_logs() did not check the return value of
kmalloc_array(). In low-memory situations, kmalloc_array() may return
NULL, leading to a NULL pointer dereference when the function later
accesses state->vm_logs.

Fix this by checking the return value of kmalloc_array() and setting
state->nr_vm_logs to 0 if allocation fails.

Fixes: 9edc52967cc7 ("drm/msm: Add VM logging for VM_BIND updates")
Signed-off-by: Huiwen He <hehuiwen@kylinos.cn>
---
Changes in v2:
- Simplify the failure exit path as suggested by Rob Clark.
- Link to v1: https://lore.kernel.org/all/20251020113708.7403-1-hehuiwen@kylinos.cn

 drivers/gpu/drm/msm/msm_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 17759abc46d7..e23f70fbc8cb 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -348,6 +348,10 @@ static void crashstate_get_vm_logs(struct msm_gpu_state *state, struct msm_gem_v
 
 	state->vm_logs = kmalloc_array(
 		state->nr_vm_logs, sizeof(vm->log[0]), GFP_KERNEL);
+	if (!state->vm_logs) {
+		state->nr_vm_logs = 0;
+	}
+
 	for (int i = 0; i < state->nr_vm_logs; i++) {
 		int idx = (i + first) & vm_log_mask;
 
-- 
2.43.0

