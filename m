Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A4DB47821
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7526B10E41C;
	Sat,  6 Sep 2025 22:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8981710E60C;
 Tue,  2 Sep 2025 09:05:21 +0000 (UTC)
X-UUID: f056b9c287db11f0b29709d653e92f7d-20250902
X-CID-CACHE: Type:Local,Time:202509021702+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:bac2d166-d185-437e-9dc0-16ec6f6871bd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:6493067, CLOUDID:0f66d23fdd1b665893fc7a0fe8b5542a,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
 :0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
 R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f056b9c287db11f0b29709d653e92f7d-20250902
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
 (envelope-from <xialonglong@kylinos.cn>) (Generic MTA)
 with ESMTP id 1325050762; Tue, 02 Sep 2025 17:05:14 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
 by node4.com.cn (NSMail) with SMTP id 980C4160038C1;
 Tue,  2 Sep 2025 17:05:14 +0800 (CST)
X-ns-mid: postfix-68B6B34A-3201431671
Received: from kylin-pc.. (unknown [172.25.130.133])
 by node4.com.cn (NSMail) with ESMTPA id BE459160038C0;
 Tue,  2 Sep 2025 09:05:13 +0000 (UTC)
From: Longlong Xia <xialonglong@kylinos.cn>
To: yuq825@gmail.com,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH 1/1] drm/sched: Use KMEM_CACHE instead of kmem_cache_create
Date: Tue,  2 Sep 2025 17:05:11 +0800
Message-ID: <20250902090511.2447679-1-xialonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

Use KMEM_CACHE() instead of kmem_cache_create() to simplify the code.

Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
---
 drivers/gpu/drm/lima/lima_sched.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
index 739e8c6c6d90..b079ac198d59 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -28,9 +28,7 @@ static int lima_fence_slab_refcnt;
 int lima_sched_slab_init(void)
 {
 	if (!lima_fence_slab) {
-		lima_fence_slab =3D kmem_cache_create(
-			"lima_fence", sizeof(struct lima_fence), 0,
-			SLAB_HWCACHE_ALIGN, NULL);
+		lima_fence_slab =3D KMEM_CACHE(lima_fence, SLAB_HWCACHE_ALIGN);
 		if (!lima_fence_slab)
 			return -ENOMEM;
 	}
--=20
2.43.0

