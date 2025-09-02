Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3A8B47823
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFC510E41D;
	Sat,  6 Sep 2025 22:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B0010E1A7;
 Tue,  2 Sep 2025 07:28:09 +0000 (UTC)
X-UUID: 5beafbe887ce11f0b29709d653e92f7d-20250902
X-CID-CACHE: Type:Local,Time:202509021521+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:97ee494f-acb0-40a0-9c80-222f12790ab1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:6493067, CLOUDID:c673dd818662abbfa105d80fed711fdb,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
 :0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
 R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5beafbe887ce11f0b29709d653e92f7d-20250902
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
 (envelope-from <xialonglong@kylinos.cn>) (Generic MTA)
 with ESMTP id 2066057203; Tue, 02 Sep 2025 15:28:02 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
 by node4.com.cn (NSMail) with SMTP id 9844B160038C0;
 Tue,  2 Sep 2025 15:28:01 +0800 (CST)
X-ns-mid: postfix-68B69C81-361036971
Received: from kylin-pc.. (unknown [172.25.130.133])
 by node4.com.cn (NSMail) with ESMTPA id E2AAB16001A03;
 Tue,  2 Sep 2025 07:28:00 +0000 (UTC)
From: Longlong Xia <xialonglong@kylinos.cn>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH 1/1] drm/amdgpu: use KMEM_CACHE instead of kmem_cache_create
Date: Tue,  2 Sep 2025 15:27:59 +0800
Message-ID: <20250902072759.2386131-1-xialonglong@kylinos.cn>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_userq_fence.c
index c2a983ff23c9..51f51064685f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -37,11 +37,7 @@ static struct kmem_cache *amdgpu_userq_fence_slab;
=20
 int amdgpu_userq_fence_slab_init(void)
 {
-	amdgpu_userq_fence_slab =3D kmem_cache_create("amdgpu_userq_fence",
-						    sizeof(struct amdgpu_userq_fence),
-						    0,
-						    SLAB_HWCACHE_ALIGN,
-						    NULL);
+	amdgpu_userq_fence_slab =3D KMEM_CACHE(amdgpu_userq_fence, SLAB_HWCACHE=
_ALIGN);
 	if (!amdgpu_userq_fence_slab)
 		return -ENOMEM;
=20
--=20
2.43.0

