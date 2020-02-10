Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B511585F4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 00:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B73A6E25C;
	Mon, 10 Feb 2020 23:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BD36E25C;
 Mon, 10 Feb 2020 23:09:15 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e41e25c0000>; Mon, 10 Feb 2020 15:08:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 10 Feb 2020 15:09:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 10 Feb 2020 15:09:15 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 23:09:14 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 10 Feb 2020 23:09:14 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.40.102]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e41e29a0000>; Mon, 10 Feb 2020 15:09:14 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/nouveau: Fix NULL ptr access in nv50_wndw_prepare_fb()
Date: Mon, 10 Feb 2020 15:09:43 -0800
Message-ID: <20200210230943.2874-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581376092; bh=3RQBM41F/QlWJuyJ4Z1DOYgO4df796fPaFDbX16n2l8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=W3aHayK8A1cFACH+15DqmN7hP8gf8ff4eccS04AxxRFuqeHLh6Ps/beApvdTxsxnD
 /J2YJ6ZFlsXpub9tdhJbKn4UNZpmi1+tuny6nIwpktfXw1zAyabcEVhQiVkSbMj45h
 yVAjeZNoTha4in3ulHcUnS31N4UZOF3gxwOpQWnHPJeiEI9Yczjy1bHRiyk6EDmKrg
 iKcQQpTMV2FmE7W05aO+JskK51JB76pzjS8tQsbJZ9MeFs1BqCrSXD9uSrR06p4swG
 QdvpQ4RaWBjsmXwGYmV047F+crxgu07ssJ373lTYbKod7Ra1c389tO8yrkIln8QgTm
 x97b86oYNQbxA==
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
Cc: nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes a kernel oops when loading the nouveau
module with fb console enabled after the change:

  drm/nouveau: Remove field nvbo from struct nouveau_framebuffer

state->fb may be NULL in nv50_wndw_prepare_fb(),
so defer initializing nvbo from its obj[] array
until after the NULL check.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 4a67a656e007..68c0dc2dc2d3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -490,7 +490,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nouveau_drm *drm = nouveau_drm(plane->dev);
 	struct nv50_wndw *wndw = nv50_wndw(plane);
 	struct nv50_wndw_atom *asyw = nv50_wndw_atom(state);
-	struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
+	struct nouveau_bo *nvbo;
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
 	int ret;
@@ -499,6 +499,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	if (!asyw->state.fb)
 		return 0;
 
+	nvbo = nouveau_gem_object(fb->obj[0]);
 	ret = nouveau_bo_pin(nvbo, TTM_PL_FLAG_VRAM, true);
 	if (ret)
 		return ret;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
