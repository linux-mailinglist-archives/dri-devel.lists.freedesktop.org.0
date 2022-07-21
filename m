Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CC157D26E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 19:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D21218AA7D;
	Thu, 21 Jul 2022 17:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1623F14BD3F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 17:27:34 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DD84A6601ABB;
 Thu, 21 Jul 2022 18:27:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658424452;
 bh=Jh+MlVqOqL9qKgG98dGWwY/Of15G6iLMIOH710td1SM=;
 h=From:To:Cc:Subject:Date:From;
 b=cayjJKtQwMz2Rn6isFsbHQLUnPG5gkgRifmNaeGhfEyIqF5wkn8W9ec+CT3UKaLo3
 hti6Z2gjaW588AK2Zy3kfucW7qVMpylIcHDFviC0FJqs2IHqvZ6j88ojd0U/HLkDWy
 csRXO0pTonVcJK0lxLhuvMxtjvogs6tpEDChwxa4jg2nBfEh0N2tjR4UTYeEXRwpsU
 GnqyqK4huOn84Y6EntLAqy4hhimFYLVfrS3qXHOKWKwWlK4axoLcdrzoIAw6MN9y5s
 KRfzDXhgifHXM1okNdwOE7dZzVU0nDtjzfDuPo3mWl2PupKe6bPykK1p6xu5xsetFy
 lZkXlDXEMKo6Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH] drm/mediatek: dsi: Add atomic {destroy, duplicate}_state,
 reset callbacks
Date: Thu, 21 Jul 2022 19:27:27 +0200
Message-Id: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
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
Cc: jitao.shi@mediatek.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, xinlei.lee@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add callbacks for atomic_destroy_state, atomic_duplicate_state and
atomic_reset to restore functionality of the DSI driver: this solves
vblank timeouts when another bridge is present in the chain.

Tested bridge chain: DSI <=> ANX7625 => aux-bus panel

Fixes: 7f6335c6a258 ("drm/mediatek: Modify dsi funcs to atomic operations")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Note: The commit that has been mentioned in the Fixes tag should
      *not* have my Reviewed-by tag, as the author changed it but
      erroneously retained the tag that I had released for an
      earlier version of that commit (which was fine, but the new
      version broke mtk_dsi!).

 drivers/gpu/drm/mediatek/mtk_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 9cc406e1eee1..5b624e0f5b0a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -808,10 +808,13 @@ static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.attach = mtk_dsi_bridge_attach,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_disable = mtk_dsi_bridge_atomic_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_enable = mtk_dsi_bridge_atomic_enable,
 	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
 	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-- 
2.35.1

