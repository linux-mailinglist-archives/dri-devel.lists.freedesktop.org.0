Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDF285D2E2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865E310E0D9;
	Wed, 21 Feb 2024 08:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3A710E0D9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:56:13 +0000 (UTC)
X-UUID: 0aa368f3530545ed8de1e400171aded9-20240221
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:8dc1fbd6-5e04-4cb7-a59c-c0138488e143, IP:10,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-5
X-CID-INFO: VERSION:1.1.35, REQID:8dc1fbd6-5e04-4cb7-a59c-c0138488e143, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:5d391d7, CLOUDID:013b8b8f-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:240221165604J5OQ83PO,BulkQuantity:0,Recheck:0,SF:19|44|66|38|24|17|1
 02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: 0aa368f3530545ed8de1e400171aded9-20240221
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <chentao@kylinos.cn>) (Generic MTA)
 with ESMTP id 436310388; Wed, 21 Feb 2024 16:56:02 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 54D8BE000EBC;
 Wed, 21 Feb 2024 16:56:02 +0800 (CST)
X-ns-mid: postfix-65D5BAA2-127793529
Received: from kernel.. (unknown [172.20.15.254])
 by mail.kylinos.cn (NSMail) with ESMTPA id 89F08E000EBC;
 Wed, 21 Feb 2024 16:56:00 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: ltuikov89@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH] drm/scheduler: Simplify the allocation of slab caches in
 drm_sched_fence_slab_init
Date: Wed, 21 Feb 2024 16:55:58 +0800
Message-Id: <20240221085558.166774-1-chentao@kylinos.cn>
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

Use the new KMEM_CACHE() macro instead of direct kmem_cache_create
to simplify the creation of SLAB caches.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/sc=
heduler/sched_fence.c
index 06cedfe4b486..0f35f009b9d3 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -33,9 +33,7 @@ static struct kmem_cache *sched_fence_slab;
=20
 static int __init drm_sched_fence_slab_init(void)
 {
-	sched_fence_slab =3D kmem_cache_create(
-		"drm_sched_fence", sizeof(struct drm_sched_fence), 0,
-		SLAB_HWCACHE_ALIGN, NULL);
+	sched_fence_slab =3D KMEM_CACHE(drm_sched_fence, SLAB_HWCACHE_ALIGN);
 	if (!sched_fence_slab)
 		return -ENOMEM;
=20
--=20
2.39.2

