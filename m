Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9C52FC6A5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 02:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422056E898;
	Wed, 20 Jan 2021 01:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC93D6E890;
 Wed, 20 Jan 2021 01:28:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F267D23600;
 Wed, 20 Jan 2021 01:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106081;
 bh=43J9ib7DYwnIzys8Sy8GNZzppLD1sxHAZ4RSltgwTko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UaqIgtVLnjdci8w+gqMKbx8yj9/CCB9HcNTfyhxZ7ILusnbdwZiAIJZlPEU11LqaN
 V8Gc1go93fPjB3Gc+N/W+PNqQ32a7iLLOwbtcMT+xYM9Q05jcXvU5dc9Btj/sqOLNn
 8Bok61EIGYAmh2VZmHIPPew4ASq3+KTLnuMitWZIOwIwhm+6lmOXS3DdRT2TNCI2ge
 HUR2bk9ITI2B+c+9riwyJTPB2PZkJorQHa8SvyYN+MPVfyQseLHe3fjYqwVp8y3FzA
 pddoa594dn2mDnTSIoMi+kLUlvmRmx2I3sYU1pwi8XIPNNNKigOAXIcu2lV6rhb61+
 VF42glXDt1Tvw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 15/15] drm/nouveau/kms/nv50-: fix case where
 notifier buffer is at offset 0
Date: Tue, 19 Jan 2021 20:27:40 -0500
Message-Id: <20210120012740.770354-15-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012740.770354-1-sashal@kernel.org>
References: <20210120012740.770354-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

[ Upstream commit caeb6ab899c3d36a74cda6e299c6e1c9c4e2a22e ]

VRAM offset 0 is a valid address, triggered on GA102.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 4 ++--
 drivers/gpu/drm/nouveau/dispnv50/disp.h     | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 1bb0a9f6fa730..fbe156302ee86 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -131,7 +131,7 @@ nv50_dmac_destroy(struct nv50_dmac *dmac)
 
 int
 nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
-		 const s32 *oclass, u8 head, void *data, u32 size, u64 syncbuf,
+		 const s32 *oclass, u8 head, void *data, u32 size, s64 syncbuf,
 		 struct nv50_dmac *dmac)
 {
 	struct nouveau_cli *cli = (void *)device->object.client;
@@ -166,7 +166,7 @@ nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 	if (ret)
 		return ret;
 
-	if (!syncbuf)
+	if (syncbuf < 0)
 		return 0;
 
 	ret = nvif_object_init(&dmac->base.user, 0xf0000000, NV_DMA_IN_MEMORY,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 66c125a6b0b3c..55205d23360c8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -68,7 +68,7 @@ struct nv50_dmac {
 
 int nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 		     const s32 *oclass, u8 head, void *data, u32 size,
-		     u64 syncbuf, struct nv50_dmac *dmac);
+		     s64 syncbuf, struct nv50_dmac *dmac);
 void nv50_dmac_destroy(struct nv50_dmac *);
 
 u32 *evo_wait(struct nv50_dmac *, int nr);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
index f7dbd965e4e72..b49a212af4d8d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
@@ -68,7 +68,7 @@ wimmc37b_init_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
 	int ret;
 
 	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
-			       &oclass, 0, &args, sizeof(args), 0,
+			       &oclass, 0, &args, sizeof(args), -1,
 			       &wndw->wimm);
 	if (ret) {
 		NV_ERROR(drm, "wimm%04x allocation failed: %d\n", oclass, ret);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
