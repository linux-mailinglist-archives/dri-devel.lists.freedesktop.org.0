Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C811E896C46
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B977F1129A3;
	Wed,  3 Apr 2024 10:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="leUtxoig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1C01129A0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:27:11 +0000 (UTC)
X-UUID: b6b1624af1a411eeb8927bc1f75efef4-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3M2zvem0LwT3kv4ohlCkP0bD7U+kKnTAwqL0rRGhQHs=; 
 b=leUtxoigQw0LTNLgKFyLKhMEva4Ziergo2PWHDvEYtll3eb9wzRMkDAULai5pLO26qiE8SEuIfnihWL7hopESn7izVrgoKEnoRfzPZ5S9q/otXYsBAfJWSytyx49MXjbgKR6Ei7vkezSCTPkzTZNskEJecFyFyo0AQX1PMkohfI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:31538846-8fd9-4147-9b0e-dd6f04d84b89, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:5371aa00-c26b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b6b1624af1a411eeb8927bc1f75efef4-20240403
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1834698609; Wed, 03 Apr 2024 18:27:03 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 18:27:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 18:27:02 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, Jason-JH.Lin <jason-jh.lin@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v5 3/9] drm/mediatek: Add secure identify flag and funcution
 to mtk_drm_plane
Date: Wed, 3 Apr 2024 18:26:55 +0800
Message-ID: <20240403102701.369-4-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403102701.369-1-shawn.sung@mediatek.com>
References: <20240403102701.369-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Add is_sec flag to identify current mtk_drm_plane is secure.
Add mtk_plane_is_sec_fb() to check current drm_framebuffer is secure.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_plane.c | 18 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_plane.h |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 5bf757a3ef202..021148d4b5d4a 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -210,6 +210,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	mtk_plane_state->pending.height = drm_rect_height(&new_state->dst);
 	mtk_plane_state->pending.rotation = new_state->rotation;
 	mtk_plane_state->pending.color_encoding = new_state->color_encoding;
+	mtk_plane_state->pending.is_secure = mtk_plane_fb_is_secure(fb);
 }
 
 static void mtk_plane_atomic_async_update(struct drm_plane *plane,
@@ -361,3 +362,20 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 
 	return 0;
 }
+
+bool mtk_plane_fb_is_secure(struct drm_framebuffer *fb)
+{
+	struct drm_gem_object *gem = NULL;
+	struct mtk_gem_obj *mtk_gem = NULL;
+
+	if (!fb)
+		return false;
+
+	gem = fb->obj[0];
+	if (!gem)
+		return false;
+
+	mtk_gem = to_mtk_gem_obj(gem);
+
+	return mtk_gem->secure;
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.h b/drivers/gpu/drm/mediatek/mtk_plane.h
index 231bb7aac9473..a7779a91f0a20 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_plane.h
@@ -33,6 +33,7 @@ struct mtk_plane_pending_state {
 	bool				async_dirty;
 	bool				async_config;
 	enum drm_color_encoding		color_encoding;
+	bool				is_secure;
 };
 
 struct mtk_plane_state {
@@ -46,6 +47,7 @@ to_mtk_plane_state(struct drm_plane_state *state)
 	return container_of(state, struct mtk_plane_state, base);
 }
 
+bool mtk_plane_fb_is_secure(struct drm_framebuffer *fb);
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
 		   unsigned int supported_rotations, const u32 *formats,
-- 
2.18.0

