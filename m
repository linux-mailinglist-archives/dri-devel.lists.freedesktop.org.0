Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1917D6979
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 12:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AA610E59E;
	Wed, 25 Oct 2023 10:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807D610E63A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 10:49:46 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ADE27660731F;
 Wed, 25 Oct 2023 11:49:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698230985;
 bh=9Tz11dV1gF0knOECb4CmRHRhrmCR7btgyLRsf9oipxs=;
 h=From:To:Cc:Subject:Date:From;
 b=XMHQ/lu2klLU+B4oEWjXysMybAukvNjzrEsnN9hr53/HTq1YluCERrAL2wjoeNi74
 l+FI7+M9qp+Fk3wBaZYqgI0JdLG0ZKj5hDYGBSYITpDGD6z2ILDTH/ERfv8lh++DUd
 evnPHO/MQhGpG2xJUOz/SKqre0ZipRzs5IXbbhPdx72nKGsfv5B9xDka9LjM7ZLEcm
 WgB/7Hw44JxYkEhHvaulUumQl3tCmQqduHEbWjy8hgqSf84Flsj5warXCP31p63nq5
 M7zPPqiCAgwQshKuzoJ0I8RbMWEtUsKFUrTBXSJamJnGftGE2U9eccewFQYKfmkOAH
 14SkEm/DXGrAg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH] drm: mediatek: mtk_disp_gamma: Fix breakage due to merge issue
Date: Wed, 25 Oct 2023 12:49:40 +0200
Message-ID: <20231025104940.140605-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the commit that was sent to the mailing lists was fine, something
happened during merge and the mtk_gamma_set() function got broken as
a writel() was turned into a readl().

Fix that by changing that back to the expected writel().

Fixes: a6b39cd248f3 ("drm/mediatek: De-commonize disp_aal/disp_gamma gamma_set functions")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 2fada9d6c95f..52c752bc5f41 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -203,7 +203,7 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	/* Disable RELAY mode to pass the processed image */
 	cfg_val &= ~GAMMA_RELAY_MODE;
 
-	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
+	writel(cfg_val, gamma->regs + DISP_GAMMA_CFG);
 }
 
 void mtk_gamma_config(struct device *dev, unsigned int w,
-- 
2.42.0

