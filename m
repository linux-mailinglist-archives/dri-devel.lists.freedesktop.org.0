Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84193866819
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF24A10E368;
	Mon, 26 Feb 2024 02:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7B310E368;
 Mon, 26 Feb 2024 02:19:50 +0000 (UTC)
X-UUID: 4546ceb75acc42a9b2151b68aacf51a8-20240226
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:e41c192e-b886-4454-bc77-1e6bcaeef539, IP:10,
 URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:20
X-CID-INFO: VERSION:1.1.37, REQID:e41c192e-b886-4454-bc77-1e6bcaeef539, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:20
X-CID-META: VersionHash:6f543d0, CLOUDID:42c032ff-c16b-4159-a099-3b9d0558e447,
 B
 ulkID:2402261019466BTZH2M6,BulkQuantity:0,Recheck:0,SF:66|38|24|17|19|44|1
 02,TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:
 nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 4546ceb75acc42a9b2151b68aacf51a8-20240226
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <chentao@kylinos.cn>) (Generic MTA)
 with ESMTP id 1034945641; Mon, 26 Feb 2024 10:19:44 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 7A78CE000EBC;
 Mon, 26 Feb 2024 10:19:44 +0800 (CST)
X-ns-mid: postfix-65DBF540-285856213
Received: from kernel.. (unknown [172.20.15.254])
 by mail.kylinos.cn (NSMail) with ESMTPA id 43257E000EBC;
 Mon, 26 Feb 2024 10:19:41 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: lucas.demarchi@intel.com, ogabbay@kernel.org,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH] drm/xe: use KMEM_CACHE() to create xe_hw_fence cache
Date: Mon, 26 Feb 2024 10:19:12 +0800
Message-Id: <20240226021912.1779715-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Use the KMEM_CACHE() macro instead of kmem_cache_create() to simplify
the creation of SLAB caches when the default values are used.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_=
fence.c
index a6094c81f2ad..cd258e0ccdf3 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -20,9 +20,7 @@ static struct kmem_cache *xe_hw_fence_slab;
=20
 int __init xe_hw_fence_module_init(void)
 {
-	xe_hw_fence_slab =3D kmem_cache_create("xe_hw_fence",
-					     sizeof(struct xe_hw_fence), 0,
-					     SLAB_HWCACHE_ALIGN, NULL);
+	xe_hw_fence_slab =3D KMEM_CACHE(xe_hw_fence, SLAB_HWCACHE_ALIGN);
 	if (!xe_hw_fence_slab)
 		return -ENOMEM;
=20
--=20
2.39.2

