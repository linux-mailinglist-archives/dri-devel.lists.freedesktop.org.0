Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB21C53A21
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 18:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B734410E0C2;
	Wed, 12 Nov 2025 17:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7B910E091;
 Wed, 12 Nov 2025 17:20:00 +0000 (UTC)
X-UUID: ceb250d6bfeb11f0a38c85956e01ac42-20251113
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME,
 HR_CTE_8B
 HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
 HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
 HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
 IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP, DN_TRUSTED
 SRC_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
 DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
 GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:0bf9be2b-6375-4dc2-9421-be126dd8db82, IP:10,
 U
 RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-INFO: VERSION:1.3.6, REQID:0bf9be2b-6375-4dc2-9421-be126dd8db82, IP:10,
 URL
 :0,TC:0,Content:0,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:5
X-CID-META: VersionHash:a9d874c, CLOUDID:394edc65d7854e1d9a3c2af0a673f48f,
 BulkI
 D:251113011956PDO1GP7J,BulkQuantity:0,Recheck:0,SF:10|66|78|102|850,TC:nil
 ,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
 ,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ceb250d6bfeb11f0a38c85956e01ac42-20251113
X-User: hehuiwen@kylinos.cn
Received: from localhost.localdomain [(220.202.195.89)] by mailgw.kylinos.cn
 (envelope-from <hehuiwen@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 434298174; Thu, 13 Nov 2025 01:19:55 +0800
From: Huiwen He <hehuiwen@kylinos.cn>
To: robin.clark@oss.qualcomm.com
Cc: sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
 abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Huiwen He <hehuiwen@kylinos.cn>
Subject: [PATCH] drm/msm: fix missing NULL check after kcalloc in
 crashstate_get_bos()
Date: Thu, 13 Nov 2025 01:19:47 +0800
Message-Id: <20251112171947.486220-1-hehuiwen@kylinos.cn>
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

The crashstate_get_bos() function allocates memory for `state->bos`
using kcalloc(), but the vmbind path does not check for allocation
failure before dereferencing it in the following drm_gpuvm_for_each_va()
loop. This could lead to a NULL pointer dereference if memory allocation
fails.

Fix this by wrapping the drm_gpuvm_for_each_va() loop with a NULL check
on state->bos, similar to the safety check in the non-vmbind path.

Fixes: af9aa6f316b3d ("drm/msm: Crashdump support for sparse")
Signed-off-by: Huiwen He <hehuiwen@kylinos.cn>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 17759abc46d7..a9b5f5106ebc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -287,16 +287,17 @@ static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submi
 
 		state->bos = kcalloc(cnt, sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
-		drm_gpuvm_for_each_va (vma, submit->vm) {
-			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+		if (state->bos)
+			drm_gpuvm_for_each_va(vma, submit->vm) {
+				bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
 
-			/* Skip MAP_NULL/PRR VMAs: */
-			if (!vma->gem.obj)
-				continue;
+				/* Skip MAP_NULL/PRR VMAs: */
+				if (!vma->gem.obj)
+					continue;
 
-			msm_gpu_crashstate_get_bo(state, vma->gem.obj, vma->va.addr,
-						  dump, vma->gem.offset, vma->va.range);
-		}
+				msm_gpu_crashstate_get_bo(state, vma->gem.obj, vma->va.addr,
+							  dump, vma->gem.offset, vma->va.range);
+			}
 
 		drm_exec_fini(&exec);
 	} else {
-- 
2.25.1

