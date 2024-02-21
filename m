Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FCC85D522
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 11:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40AB10E6CF;
	Wed, 21 Feb 2024 10:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329B310E6ED
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 10:05:38 +0000 (UTC)
X-UUID: 6c386430499b4389a9f0883f1c0d84e6-20240221
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:3f8f4e42-865d-459e-8215-6035bc0ce356, IP:10,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-5
X-CID-INFO: VERSION:1.1.35, REQID:3f8f4e42-865d-459e-8215-6035bc0ce356, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:5d391d7, CLOUDID:0df7a480-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:240221180024PLCRANR9,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|66|1
 02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: 6c386430499b4389a9f0883f1c0d84e6-20240221
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <chentao@kylinos.cn>) (Generic MTA)
 with ESMTP id 1480455945; Wed, 21 Feb 2024 18:00:22 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id EE804E000EBC;
 Wed, 21 Feb 2024 18:00:21 +0800 (CST)
X-ns-mid: postfix-65D5C9B5-768232112
Received: from kernel.. (unknown [172.20.15.254])
 by mail.kylinos.cn (NSMail) with ESMTPA id 0AE6BE000EBD;
 Wed, 21 Feb 2024 18:00:20 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH 1/3] drm/amdgpu: Simplify the allocation of fence slab caches
Date: Wed, 21 Feb 2024 17:59:05 +0800
Message-Id: <20240221095907.172408-2-chentao@kylinos.cn>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240221095907.172408-1-chentao@kylinos.cn>
References: <20240221095907.172408-1-chentao@kylinos.cn>
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

Use the new KMEM_CACHE() macro instead of direct kmem_cache_create
to simplify the creation of SLAB caches.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_fence.c
index 70bff8cecfda..10832b470448 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -61,9 +61,7 @@ static struct kmem_cache *amdgpu_fence_slab;
=20
 int amdgpu_fence_slab_init(void)
 {
-	amdgpu_fence_slab =3D kmem_cache_create(
-		"amdgpu_fence", sizeof(struct amdgpu_fence), 0,
-		SLAB_HWCACHE_ALIGN, NULL);
+	amdgpu_fence_slab =3D KMEM_CACHE(amdgpu_fence, SLAB_HWCACHE_ALIGN);
 	if (!amdgpu_fence_slab)
 		return -ENOMEM;
 	return 0;
--=20
2.39.2

