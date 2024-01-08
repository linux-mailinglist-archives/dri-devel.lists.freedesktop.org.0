Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27836826B0E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7185510E1E2;
	Mon,  8 Jan 2024 09:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 08 Jan 2024 09:46:19 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49BB10E1E2;
 Mon,  8 Jan 2024 09:46:19 +0000 (UTC)
X-UUID: 0194aff85b42445fb4cd05c6b8915c12-20240108
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:895988ca-c91d-48e2-b272-9200b13a11ca, IP:20,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-INFO: VERSION:1.1.35, REQID:895988ca-c91d-48e2-b272-9200b13a11ca, IP:20,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:5
X-CID-META: VersionHash:5d391d7, CLOUDID:b93fed2e-1ab8-4133-9780-81938111c800,
 B
 ulkID:240108174111PW07QMQM,BulkQuantity:0,Recheck:0,SF:17|19|44|66|38|24|1
 02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 0194aff85b42445fb4cd05c6b8915c12-20240108
X-User: lizhenneng@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw
 (envelope-from <lizhenneng@kylinos.cn>) (Generic MTA)
 with ESMTP id 286747945; Mon, 08 Jan 2024 17:41:08 +0800
From: Zhenneng Li <lizhenneng@kylinos.cn>
To: Marek Olsak <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 1/2] amdgpu: fix parameter of amdgpu_cs_ctx_create2
Date: Mon,  8 Jan 2024 17:40:51 +0800
Message-Id: <20240108094052.171721-1-lizhenneng@kylinos.cn>
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
Cc: Zhenneng Li <lizhenneng@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to pass the correct priority parameter to the kernel,
we must change priority type from uint32_t to int32_t.

Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
---
 amdgpu/amdgpu.h    | 2 +-
 amdgpu/amdgpu_cs.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/amdgpu/amdgpu.h b/amdgpu/amdgpu.h
index 9bdbf366..f46753f3 100644
--- a/amdgpu/amdgpu.h
+++ b/amdgpu/amdgpu.h
@@ -896,7 +896,7 @@ int amdgpu_bo_list_update(amdgpu_bo_list_handle handle,
  *
 */
 int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
-			 uint32_t priority,
+			 int32_t priority,
 			 amdgpu_context_handle *context);
 /**
  * Create GPU execution Context
diff --git a/amdgpu/amdgpu_cs.c b/amdgpu/amdgpu_cs.c
index 49fc16c3..eb72c638 100644
--- a/amdgpu/amdgpu_cs.c
+++ b/amdgpu/amdgpu_cs.c
@@ -49,7 +49,7 @@ static int amdgpu_cs_reset_sem(amdgpu_semaphore_handle sem);
  * \return  0 on success otherwise POSIX Error code
 */
 drm_public int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
-				     uint32_t priority,
+				     int32_t priority,
 				     amdgpu_context_handle *context)
 {
 	struct amdgpu_context *gpu_context;
-- 
2.34.1

