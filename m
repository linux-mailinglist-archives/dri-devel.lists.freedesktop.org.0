Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7194276FB2B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828CC10E6B3;
	Fri,  4 Aug 2023 07:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6769810E6A6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 07:29:04 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AAA4066071BB;
 Fri,  4 Aug 2023 08:29:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691134143;
 bh=sMSXWGMzRY15n7GP2+/uJ71airFfgmnnXjt646sPTj8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iqZfSylJV4GtvmL7oED7wG4r4kBsy/pRa+iYrHa6/pEsBw0l0YB8eZiZDtn4gIj3x
 S03ZZNNdyyEXbrnMoV0pNmF7YjJagOpp0lFu43fU9rZSk+caIX1aBnH/gjypHaRV/8
 ygjQG7CW1W9laxBW3hEXCe7EhI3Gbe5a3lIypjcj330VSB1+uecL8s1jd4Z1LwWO5i
 VDeTVW+uwwQQuJGdOgIXbQQiKASWf4SGSBF26Qz5o/LvyUgvB3GJx7VvsaV95SH+c4
 Mrs1qVWrw5rwNKSRKXFqRnVoPOd+GRkQdaaByKgV+n1Rh1iFYX01sGr0nY5xy4LiIq
 487nvC+X3Db8Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v10 07/16] drm/mediatek: aal: Use bitfield macros
Date: Fri,  4 Aug 2023 09:28:41 +0200
Message-ID: <20230804072850.89365-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, ehristev@collabora.com, wenst@chromium.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the code more robust and improve readability by using bitfield
macros instead of open coding bit operations.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index e2e4155faf01..bec035780db0 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -18,6 +18,8 @@
 #define DISP_AAL_EN				0x0000
 #define AAL_EN						BIT(0)
 #define DISP_AAL_SIZE				0x0030
+#define DISP_AAL_SIZE_HSIZE				GENMASK(28, 16)
+#define DISP_AAL_SIZE_VSIZE				GENMASK(12, 0)
 #define DISP_AAL_OUTPUT_SIZE			0x04d8
 #define DISP_AAL_LUT_SIZE			512
 
@@ -56,9 +58,13 @@ void mtk_aal_config(struct device *dev, unsigned int w,
 			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+	u32 sz;
 
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, DISP_AAL_SIZE);
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, DISP_AAL_OUTPUT_SIZE);
+	sz = FIELD_PREP(DISP_AAL_SIZE_HSIZE, w);
+	sz |= FIELD_PREP(DISP_AAL_SIZE_VSIZE, h);
+
+	mtk_ddp_write(cmdq_pkt, sz, &aal->cmdq_reg, aal->regs, DISP_AAL_SIZE);
+	mtk_ddp_write(cmdq_pkt, sz, &aal->cmdq_reg, aal->regs, DISP_AAL_OUTPUT_SIZE);
 }
 
 /**
-- 
2.41.0

