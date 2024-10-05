Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24907991598
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 11:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FFD10E028;
	Sat,  5 Oct 2024 09:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="isqM7jJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED8010E028
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 09:52:45 +0000 (UTC)
X-UUID: 8e3ea30882ff11ef8b96093e013ec31c-20241005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HR8KGUmuFMG2sMTuvNJl9B/Mgl9O1+VFdQr6NXGDgcc=; 
 b=isqM7jJSQvcMaKSwIAOaXM1nUx2QBtwNSiqX/Bd0+RfRUY880bOJHQkDjOIV2xq9+lcHbsxq99z/WXE0i7UbHRStOlu6tXyjlEhD2unfbmJWL20kcrMFmKaBl+bhayIyA3u4f/L+xkIAknm8JFgFqdZ7oD+kDWsfBuPIC9NZ5LQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:9062ceb3-3647-4747-b96c-8a35e7ffedb6, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:18c8c764-444a-4b47-a99a-591ade3b04b2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8e3ea30882ff11ef8b96093e013ec31c-20241005
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 868117363; Sat, 05 Oct 2024 17:52:38 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 5 Oct 2024 17:52:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 5 Oct 2024 17:52:36 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Adam Thiede <me@adamthiede.com>, Yassine Oudjana
 <yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] drm/mediatek: Fix XRGB format breakage for blend_modes
 unsupported SoCs
Date: Sat, 5 Oct 2024 17:52:34 +0800
Message-ID: <20241005095234.12925-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.330700-8.000000
X-TMASE-MatchedRID: auvC3QTXpfluEQe6SEvnwbMjW/sniEQKKx5ICGp/WtE0QmmUihPzrMLW
 UULKqUw6o5qw/iFKtvbzrL9jlOCHAYpsQeZV7e/esTcWkxuDrdLmELBDcs0dnZy1Yc8tPkV90S+
 TvGOUgqLrDONdwADMfYAy6p60ZV62fJ5/bZ6npdiyO81X3yak89tr2uEa5q7ZGMXmXH2H4ryBxo
 by+cqa46Ag6c6nq6DYgoxkRN9FeHp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.330700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0440B8C83F3F2410F268DA0AD1D3FC737721B3F4A49D082B60D1DF1DB68103AD2000:8
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

If the constant alpha always set, the SoCs that is not supported the
ignore alpha bit will still use constant alpha. That will break the
original constant alpha setting of XRGB foramt for blend_modes
unsupported SoCs, such as MT8173.

Make the constatnt alpha only set when setting has_alpha or supported
blend_modes SoC to fix the downgrade issue.

Fixes: bc46eb5d5d77 ("drm/mediatek: Support DRM plane alpha in OVL")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 28 +++++++++++++++----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 703cd3f6c6d3..de3addd89442 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -494,19 +494,25 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 
 	con = mtk_ovl_fmt_convert(ovl, state);
 	if (state->base.fb) {
-		con |= OVL_CON_AEN;
-		con |= state->base.alpha & OVL_CON_ALPHA;
+		/*
+		 * For blend_modes supported SoCs, always set constant alpha.
+		 * For blend_modes unsupported SoCs, set constant alpha when has_alpha is set.
+		 */
+		if (ovl->data->blend_modes || state->base.fb->format->has_alpha) {
+			con |= OVL_CON_AEN;
+			con |= state->base.alpha & OVL_CON_ALPHA;
+		}
+
+		/*
+		 * Although the alpha channel can be ignored, CONST_BLD must be enabled
+		 * for XRGB format, otherwise OVL will still read the value from memory.
+		 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
+		 * affect the result. Therefore we use !has_alpha as the condition.
+		 */
+		if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE || !state->base.fb->format->has_alpha)
+			ignore_pixel_alpha = OVL_CONST_BLEND;
 	}
 
-	/* CONST_BLD must be enabled for XRGB formats although the alpha channel
-	 * can be ignored, or OVL will still read the value from memory.
-	 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
-	 * affect the result. Therefore we use !has_alpha as the condition.
-	 */
-	if ((state->base.fb && !state->base.fb->format->has_alpha) ||
-	    blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
-		ignore_pixel_alpha = OVL_CONST_BLEND;
-
 	if (pending->rotation & DRM_MODE_REFLECT_Y) {
 		con |= OVL_CON_VIRT_FLIP;
 		addr += (pending->height - 1) * pending->pitch;
-- 
2.43.0

