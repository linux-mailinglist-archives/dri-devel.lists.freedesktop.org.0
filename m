Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBEC7F30BE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 15:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230CB10E4C4;
	Tue, 21 Nov 2023 14:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F3310E4C5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 14:29:47 +0000 (UTC)
Received: from notapiano.myfiosgateway.com (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A4BE76607314;
 Tue, 21 Nov 2023 14:29:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700576986;
 bh=5REf8+1qSAKeSFYSM/vLqpdzS7hrFNmkWP0nRiEB5h8=;
 h=From:To:Cc:Subject:Date:From;
 b=jvN8W1ew3AdczFCVEQhQUsivssXtNz+fUumVKei73te07h7RAbtR3bCUWH2aGI09x
 YVb/yGlRLVFmkr+4Run+wZg+eY94dz3sMOan0Sl+kZhu8n0qkI3LJvNzRvsDvO7tAR
 6aoPYDtsNQmyQW2UzFLPvv4D79sXAkhS7ZN6zNv3DcxY9l339xpKIBj13WaflXEMyH
 op0yemRLAV6wMggWkDoror+JQnuolnuinVRElXXSzgVb/GSdeFxFYiTNADeQAyOhTa
 PcIgguoRtgUzbFYikOiWTSoKWp9Aub9C0uBi0pMfla2rLLOxfMgMuR7Bf1PlwpoPmE
 u38NSnrci9mrQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2] drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency
Date: Tue, 21 Nov 2023 09:29:27 -0500
Message-ID: <20231121142938.460846-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Guillaume Ranquet <granquet@baylibre.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mtk_dp driver registers a phy device which is handled by the
phy_mtk_dp driver and assumes that the phy probe will complete
synchronously, proceeding to make use of functionality exposed by that
driver right away. This assumption however is false when the phy driver
is built as a module, causing the mtk_dp driver to fail probe in this
case.

Add the phy_mtk_dp module as a pre-dependency to the mtk_dp module to
ensure the phy module has been loaded before the dp, so that the phy
probe happens synchrounously and the mtk_dp driver can probe
successfully even with the phy driver built as a module.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

Changes in v2:
- Added missing Suggested-by tag

 drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index e4c16ba9902d..2136a596efa1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2818,3 +2818,4 @@ MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
 MODULE_AUTHOR("Bo-Chen Chen <rex-bc.chen@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
 MODULE_LICENSE("GPL");
+MODULE_SOFTDEP("pre: phy_mtk_dp");
-- 
2.42.1

