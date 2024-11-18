Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6AC9D082F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 04:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FD910E009;
	Mon, 18 Nov 2024 03:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="T2cO3pTv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A8E10E009
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 03:36:56 +0000 (UTC)
X-UUID: 58ed2766a55e11ef99858b75a2457dd9-20241118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cY3M3paXFjVnDGLWR8LPQPj0vfaZVh7x56FlJ8YtW2M=; 
 b=T2cO3pTv2a0Qc1O8poWjwhgLhb2ULeXeLuUDMNeAPyrjtafIBDHAHpJKGBrL+nn1MvCQ7+PimcKI3UJswvVgHPGade8MiVhEdE3Zpab36IqI9grdn+WwAUOiv2gCa8p4GfScrYzo/AACcft26uY8Eb/H33ssvzgQ0pYR6/i3WWY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43, REQID:e278a9e6-4638-4b23-9043-b0752622208a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:ce19b8a, CLOUDID:1f4e3c07-6ce0-4172-9755-bd2287e50583,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 58ed2766a55e11ef99858b75a2457dd9-20241118
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 655924059; Mon, 18 Nov 2024 11:36:50 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Nov 2024 11:36:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Nov 2024 11:36:48 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
 <fshao@chromium.org>
Subject: [PATCH] drm/mediatek: Add no pending_planes flag checking for
 mtk_crtc_finish_page_flip()
Date: Mon, 18 Nov 2024 11:36:46 +0800
Message-ID: <20241118033646.31633-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.865100-8.000000
X-TMASE-MatchedRID: 7f0W3vGS/J7ww+sel1EBgVPjo7D4SFg4uoYFb0nRiqP82ks92f+GmsB6
 rnzzylDrRB4o3Hb/MDAMSPrY6IbTu7gFJkVTA0wMliwpJdZauwcrHkgIan9a0QLlYq1KzQi/vFf
 PytWHA2khXi7xgp14qwG2ORx9Eyap3CtEsOTZxuKO0rt0LpQGeX0tCKdnhB589yM15V5aWpj6C0
 ePs7A07YFInLyeDAoZT/btC4l4MdyAqm8NWtwXUqO4Pry+YzMezUn+SItISnpfe/9937fRFg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.865100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8A16D88748D68549294F33BBDA61DB44C457C9A4610B3EA90DFB2FE95C43F3332000:8
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

mtk_crtc_finish_page_flip() is used to notify the page flip that has
been completed to the userspace, so userspace can free the frame buffer
of the last frame and commit the next frame.

However, mtk_crtc_finish_page_flip() cannot guarantee the GCE has
configured all the display hardware settings of the last frame.
This may cause the display hardware to still access the last frame
buffer released by the userspace.

So add the checking condition of no pending_plens flags to make sure
GCE has executed all the pending planes configuration.

Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet is done")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index eb0e1233ad04..b03b9102ff90 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -113,7 +113,8 @@ static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 	drm_crtc_handle_vblank(&mtk_crtc->base);
 
 	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
-	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
+	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank &&
+	    !mtk_crtc->pending_planes) {
 		mtk_crtc_finish_page_flip(mtk_crtc);
 		mtk_crtc->pending_needs_vblank = false;
 	}
-- 
2.43.0

