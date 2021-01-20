Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52342FC695
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 02:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A806E887;
	Wed, 20 Jan 2021 01:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71C96E415;
 Wed, 20 Jan 2021 01:27:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B051223138;
 Wed, 20 Jan 2021 01:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106059;
 bh=RccCsQNVx20yPJGFohhUuMJI9emhkI0B9PKi9OPEaC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nNNufJzSMtF6AyiJVU93I4Yf9MxF7vndHtC2M8Y9WndYSmf1TdV2J/rk8CrQQ+N4q
 6DHN8fvhdQG8UmrG0SftOfwNjaPRyyEQ6uLNGgga4M4B9RBPPE88zSXxUWhyeff3qd
 H2aRuCY8BQ1YI2AUSUpNb170U0C1u52NF/JRPz9OgnPXzdvfgBDnPrM2DpuoE7Txv5
 D6GthYK8VCD6lOv+Z81G6pXw6kXOb7h/ib8MVcEmmv09H9M0RgOIvu2sYC12go2yuh
 pksS9IPxc4A7FNTh17na80GYgg5spEFq0jL2zRDTvH60KWFopW7qwMY7mK8Q1vo+iK
 ilDBQ/nsF0Rdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 26/26] drm/nouveau/kms/nv50-: fix case where
 notifier buffer is at offset 0
Date: Tue, 19 Jan 2021 20:27:03 -0500
Message-Id: <20210120012704.770095-26-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012704.770095-1-sashal@kernel.org>
References: <20210120012704.770095-1-sashal@kernel.org>
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
index ee2b1e1199e09..daa79d39201f9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -132,7 +132,7 @@ nv50_dmac_destroy(struct nv50_dmac *dmac)
 
 int
 nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
-		 const s32 *oclass, u8 head, void *data, u32 size, u64 syncbuf,
+		 const s32 *oclass, u8 head, void *data, u32 size, s64 syncbuf,
 		 struct nv50_dmac *dmac)
 {
 	struct nouveau_cli *cli = (void *)device->object.client;
@@ -167,7 +167,7 @@ nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 	if (ret)
 		return ret;
 
-	if (!syncbuf)
+	if (syncbuf < 0)
 		return 0;
 
 	ret = nvif_object_init(&dmac->base.user, 0xf0000000, NV_DMA_IN_MEMORY,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 7c41b0599d1ac..284068fa6d007 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -70,7 +70,7 @@ struct nv50_dmac {
 
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
