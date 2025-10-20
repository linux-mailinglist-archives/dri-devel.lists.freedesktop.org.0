Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B29BF0F40
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 13:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D8310E292;
	Mon, 20 Oct 2025 11:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Mon, 20 Oct 2025 11:42:36 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B631B10E29A;
 Mon, 20 Oct 2025 11:42:36 +0000 (UTC)
X-UUID: 2883f10aada911f0a38c85956e01ac42-20251020
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME,
 HR_CTE_8B
 HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
 HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
 HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NAME
 IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP, DN_TRUSTED
 SRC_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
 DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
 GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:9e0a14a9-ab98-4269-b939-fd4775a0f249, IP:10,
 U
 RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:30
X-CID-INFO: VERSION:1.3.6, REQID:9e0a14a9-ab98-4269-b939-fd4775a0f249, IP:10,
 URL
 :0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:30
X-CID-META: VersionHash:a9d874c, CLOUDID:5827c87bff38bde25837b5837f87607c,
 BulkI
 D:251020193614H7E4RRCI,BulkQuantity:1,Recheck:0,SF:17|19|25|45|66|78|102|8
 50,TC:nil,Content:0|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BE
 C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2883f10aada911f0a38c85956e01ac42-20251020
X-User: hehuiwen@kylinos.cn
Received: from localhost.localdomain [(220.202.195.150)] by mailgw.kylinos.cn
 (envelope-from <hehuiwen@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 252442399; Mon, 20 Oct 2025 19:37:28 +0800
From: Huiwen He <hehuiwen@kylinos.cn>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Huiwen He <hehuiwen@kylinos.cn>
Subject: [PATCH] drm/msm: Fix NULL pointer dereference in
 crashstate_get_vm_logs()
Date: Mon, 20 Oct 2025 19:37:08 +0800
Message-ID: <20251020113708.7403-1-hehuiwen@kylinos.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Oct 2025 11:56:55 +0000
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

crashstate_get_vm_logs() did not check the result of kmalloc_array()
before using state->vm_logs. In low memory situations, kmalloc_array()
may fail and return NULL, leading to a kernel crash when the array
is accessed in the subsequent loop.

Fix this by checking the return value of kmalloc_array(). If allocation
fails, set state->nr_vm_logs to 0, and exit the function safely.

Fixes: 9edc52967cc7 ("drm/msm: Add VM logging for VM_BIND updates")
Signed-off-by: Huiwen He <hehuiwen@kylinos.cn>
---
 drivers/gpu/drm/msm/msm_gpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 17759abc46d7..51df6ff945d2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -348,6 +348,12 @@ static void crashstate_get_vm_logs(struct msm_gpu_state *state, struct msm_gem_v
 
 	state->vm_logs = kmalloc_array(
 		state->nr_vm_logs, sizeof(vm->log[0]), GFP_KERNEL);
+	if (!state->vm_logs) {
+		state->nr_vm_logs = 0;
+		mutex_unlock(&vm->mmu_lock);
+		return;
+	}
+
 	for (int i = 0; i < state->nr_vm_logs; i++) {
 		int idx = (i + first) & vm_log_mask;
 
-- 
2.43.0

