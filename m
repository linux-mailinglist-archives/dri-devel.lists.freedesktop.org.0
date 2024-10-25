Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521109B0434
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7150610EAF7;
	Fri, 25 Oct 2024 13:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 25 Oct 2024 03:56:26 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC57010E1ED;
 Fri, 25 Oct 2024 03:56:26 +0000 (UTC)
X-UUID: 629cda28928411efa216b1d71e6e1362-20241025
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:ae7975e5-53d8-485d-a6d9-ab93ee85b120, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:82c5f88, CLOUDID:e6841dc3a29fef6cc4c4d47c9684e538,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,URL:0,
 File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:N
 O,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 629cda28928411efa216b1d71e6e1362-20241025
Received: from node2.com.cn [(10.44.16.197)] by mailgw.kylinos.cn
 (envelope-from <zenghongling@kylinos.cn>) (Generic MTA)
 with ESMTP id 591682689; Fri, 25 Oct 2024 11:51:15 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
 by node2.com.cn (NSMail) with SMTP id BE1E7B804842;
 Fri, 25 Oct 2024 11:51:15 +0800 (CST)
X-ns-mid: postfix-671B15B3-636278766
Received: from localhost.localdomain (unknown [172.25.120.36])
 by node2.com.cn (NSMail) with ESMTPA id 02073B804842;
 Fri, 25 Oct 2024 03:51:12 +0000 (UTC)
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, zhongling0719@126.com,
 Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH] amdgpu/fence: replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Date: Fri, 25 Oct 2024 11:51:10 +0800
Message-Id: <20241025035110.10854-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 25 Oct 2024 13:32:50 +0000
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

Since SLOB was removed and since
commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache=
_destroy()"),
it is not necessary to use call_rcu when the callback only performs
kmem_cache_free. Use kfree_rcu() directly.

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_fence.c
index 2f24a6a..d047afe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -818,20 +818,6 @@ static bool amdgpu_job_fence_enable_signaling(struct=
 dma_fence *f)
 	return true;
 }
=20
-/**
- * amdgpu_fence_free - free up the fence memory
- *
- * @rcu: RCU callback head
- *
- * Free up the fence memory after the RCU grace period.
- */
-static void amdgpu_fence_free(struct rcu_head *rcu)
-{
-	struct dma_fence *f =3D container_of(rcu, struct dma_fence, rcu);
-
-	/* free fence_slab if it's separated fence*/
-	kmem_cache_free(amdgpu_fence_slab, to_amdgpu_fence(f));
-}
=20
 /**
  * amdgpu_job_fence_free - free up the job with embedded fence
@@ -858,7 +844,7 @@ static void amdgpu_job_fence_free(struct rcu_head *rc=
u)
  */
 static void amdgpu_fence_release(struct dma_fence *f)
 {
-	call_rcu(&f->rcu, amdgpu_fence_free);
+	kfree_rcu(f, rcu);
 }
=20
 /**
--=20
2.1.0

