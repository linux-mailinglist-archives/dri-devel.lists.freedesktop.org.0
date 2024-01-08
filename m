Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830AF826B0F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E23810E207;
	Mon,  8 Jan 2024 09:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD8D10E1F9;
 Mon,  8 Jan 2024 09:46:21 +0000 (UTC)
X-UUID: 88c7ec6b451c482cb8107aa0b946676f-20240108
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:286c5e78-a4fe-4060-8c6f-ac9c8d68c380, IP:20,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-INFO: VERSION:1.1.35, REQID:286c5e78-a4fe-4060-8c6f-ac9c8d68c380, IP:20,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:5
X-CID-META: VersionHash:5d391d7, CLOUDID:bd3fed2e-1ab8-4133-9780-81938111c800,
 B
 ulkID:240108174111OIUGN40H,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|66|1
 02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 88c7ec6b451c482cb8107aa0b946676f-20240108
X-User: lizhenneng@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw
 (envelope-from <lizhenneng@kylinos.cn>) (Generic MTA)
 with ESMTP id 647686786; Mon, 08 Jan 2024 17:41:08 +0800
From: Zhenneng Li <lizhenneng@kylinos.cn>
To: Marek Olsak <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 2/2] amdgpu: change proirity value to be consistent
 with kernel
Date: Mon,  8 Jan 2024 17:40:52 +0800
Message-Id: <20240108094052.171721-2-lizhenneng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240108094052.171721-1-lizhenneng@kylinos.cn>
References: <20240108094052.171721-1-lizhenneng@kylinos.cn>
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
Cc: Zhenneng Li <lizhenneng@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In libdrm-amdgpu and amdgpu kernel driver, there are only such priority level:

AMDGPU_CTX_PRIORITY_VERY_LOW,
AMDGPU_CTX_PRIORITY_LOW,
AMDGPU_CTX_PRIORITY_NORMAL,
AMDGPU_CTX_PRIORITY_HIGH,
AMDGPU_CTX_PRIORITY_VERY_HIGH

If priority value is not the one of the above data, the kernel will treat it as invalid.
If you set prority to HIGH or VERY_HIGH, please make sure the process have CAP_SYS_NICE
capability or DRM_MASTER permission.

Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
---
 amdgpu/amdgpu_cs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/amdgpu/amdgpu_cs.c b/amdgpu/amdgpu_cs.c
index eb72c638..d6d768ba 100644
--- a/amdgpu/amdgpu_cs.c
+++ b/amdgpu/amdgpu_cs.c
@@ -57,6 +57,7 @@ drm_public int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
 	int i, j, k;
 	int r;
 	char *override_priority;
+	int32_t override_prio;
 
 	if (!dev || !context)
 		return -EINVAL;
@@ -66,9 +67,16 @@ drm_public int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
 		/* The priority is a signed integer. The variable type is
 		 * wrong. If parsing fails, priority is unchanged.
 		 */
-		if (sscanf(override_priority, "%i", &priority) == 1) {
+		if (sscanf(override_priority, "%i", &override_prio) == 1) {
 			printf("amdgpu: context priority changed to %i\n",
-			       priority);
+			       override_prio);
+			if (override_prio == 0) {
+				priority = AMDGPU_CTX_PRIORITY_NORMAL;
+			} else if (override_prio < 0) {
+				priority = AMDGPU_CTX_PRIORITY_HIGH;
+			} else {
+				priority = AMDGPU_CTX_PRIORITY_LOW;
+			}
 		}
 	}
 
-- 
2.34.1

