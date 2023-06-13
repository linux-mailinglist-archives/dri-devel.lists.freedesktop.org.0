Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C2972E1B4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4923710E3A7;
	Tue, 13 Jun 2023 11:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568F310E3AB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:32:21 +0000 (UTC)
X-UUID: f1abb01c09dd11eeb20a276fd37b9834-20230613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=S6XTbHxnm6PfKAa2YHQWP9kAdBWbvJgtpEZP096N6H8=; 
 b=SV+OrFdtKI5AgecHLFeLK0lxDJg3slR/doZEt313ZUd7AAnYgEPdmv7u8a3BZWq9UAD/DdOckElTzXf/RqJND1ghjTilZeCy5yu7cWVQiZ4DS33F8a2NGZNuSLKywwv2zc33rse2juZ+bZwBY/fMe/baLrlyIBuCJVXhGUbEJuw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:30a54cb5-dd22-4495-82da-a5f742ddeec0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:cb9a4e1, CLOUDID:4b46ef6e-2f20-4998-991c-3b78627e4938,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f1abb01c09dd11eeb20a276fd37b9834-20230613
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2001279133; Tue, 13 Jun 2023 19:32:14 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 13 Jun 2023 19:32:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 13 Jun 2023 19:32:12 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>
Subject: [PATCH v2 4/4] drm/mediatek: Fix dereference before null check
Date: Tue, 13 Jun 2023 19:32:10 +0800
Message-ID: <20230613113210.24949-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230613113210.24949-1-jason-jh.lin@mediatek.com>
References: <20230613113210.24949-1-jason-jh.lin@mediatek.com>
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Null-checking state suggests that it may be null, but it has already
been dereferenced on drm_atomic_get_new_plane_state(state, plane).

The parameter state will never be NULL currently, so just remove the
state is NULL flow in this function.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Fixes: 5ddb0bd4ddc3 ("drm/atomic: Pass the full state to planes async atomic check and update")
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 1cd41454d545..4828ffa75467 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -122,11 +122,7 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
-	if (state)
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								new_plane_state->crtc);
-	else /* Special case for asynchronous cursor updates. */
-		crtc_state = new_plane_state->crtc->state;
+	crtc_state = drm_atomic_get_existing_crtc_state(state, new_plane_state->crtc);
 
 	return drm_atomic_helper_check_plane_state(plane->state, crtc_state,
 						   DRM_PLANE_NO_SCALING,
-- 
2.18.0

