Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE2B7D2963
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 06:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA3110E13D;
	Mon, 23 Oct 2023 04:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3FD10E076
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 04:45:57 +0000 (UTC)
X-UUID: 0b81808c715f11eea33bb35ae8d461a2-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=P8YVDxyqFUMPUtEmRu4vRhBkKU6+xIuJD/plS6PwPgI=; 
 b=j4LS5EJb/0J3hv7dWICVuGWUxj6uq5UQJhubw9sFlwqmAGhsHoEUWLZFArda9Nwfjf8ilKJ4MQhEv+faB6PDC+xLzLV7OMdzagnWAMjDuUdZ9tfJp+x3Z/OPnf6gGnnewHS/6XLvsDdCRzWhQbVADhYHqBip/cENispfygIhSU4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:6d0b37e4-fe78-4758-b961-29f1920ba613, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:230e8294-10ce-4e4b-85c2-c9b5229ff92b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0b81808c715f11eea33bb35ae8d461a2-20231023
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 256381834; Mon, 23 Oct 2023 12:45:52 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 12:45:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 12:45:50 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Subject: [PATCH v2 04/11] drm/mediatek: Add secure identify flag and funcution
 to mtk_drm_plane
Date: Mon, 23 Oct 2023 12:45:41 +0800
Message-ID: <20231023044549.21412-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.953300-8.000000
X-TMASE-MatchedRID: tiRXYRqWr+sXSulpnju2H0hwlOfYeSqxEbxKVXd70tXfUZT83lbkEAte
 +Pua94rgIAIDm5vZWu4+PHq8e3nI3h8TzIzimOwPC24oEZ6SpSmb4wHqRpnaDv34F7bMpQx9hin
 ct4EsDwcwVAe/hvF/RWd+CkOAbYQn3xRUQILtibZkqeK1RJU6ff/9fS95GkA7CM4wutSD8b/iL/
 CRDFHgmkma3zYT97IFAYfQIAUhBayZvmCbKVb49sZL6x5U/HridGByp+zdaDg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.953300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B920E7C245E869F6B14B1E4E5850A351487F07F818549A40F778C0E1737481862000:8
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
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch
 Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add is_sec flag to identify current mtk_drm_plane is secure.
Add mtk_plane_is_sec_fb() to check current drm_framebuffer is secure.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 99aff7da0831..fe60e20a6e1c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -33,6 +33,7 @@ struct mtk_plane_pending_state {
 	bool				async_dirty;
 	bool				async_config;
 	enum drm_color_encoding		color_encoding;
+	bool				is_sec;
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

