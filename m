Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65851A5B917
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 07:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C653110E123;
	Tue, 11 Mar 2025 06:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hlqCPBvZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC1510E0C5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741673834;
 bh=+c3rP9l5bYRgyQgzqdBiyBHNs0Vnao3tQSZD7Jt0tYs=;
 h=From:To:Cc:Subject:Date:From;
 b=hlqCPBvZMIIR/XIcU/pmYxeSrxXNRMeqE9xR9QTJ4wXTEUxs3Y5jTim9sw3HRYpoo
 G9Cn9/HfnD3xKt+3i25/+u69Cp8WQdO2kILlNGOm0ZQQzj2WZiCegRAcj3h4BfjBgo
 VaEMtjKwNyMgXHqC/wI4Gi0ru52KWtdJYM2pMqESWC7BDS+FL1uGabefiNeANI4YDQ
 meYujK8q04Tv57hsOWrV2qC21mWV9/qEC7fYfV0Z/6oRhzSUIglMjB9katfKwnTNME
 0x5hVGViqbiWqg/agYeAKgAPkvrxm8tXPrzRFGCaEh+7Y5ZI+BbWGjm/RbKMKfQtvT
 dh/bFTY9YsGpw==
Received: from localhost.localdomain (unknown [103.163.65.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D1F9617E05C1;
 Tue, 11 Mar 2025 07:17:12 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, nfraprado@collabora.com,
 angelogioacchino.delregno@collabora.com, daniels@collabora.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: defconfig: mediatek: enable PHY drivers
Date: Tue, 11 Mar 2025 11:46:59 +0530
Message-ID: <20250311061703.16850-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mediatek display driver fails to probe on mt8173 and mt8183 in
v6.14-rc4, with the following errors:

mt8173:
platform 1401b000.dsi: deferred probe pending: mtk-dsi: Failed to get hs clock
platform 14025000.hdmi: deferred probe pending: (reason unknown)
i2c 1-0008: deferred probe pending: (reason unknown)

mt8183:
platform 14014000.dsi: deferred probe pending: mtk-dsi: Failed to get hs clock
i2c 4-0058: deferred probe pending: anx7625: fail to find dsi host.

Enabling CONFIG_PHY_MTK_MIPI_DSI=y in drm-ci resolves this error,
but mt8173 still fails with,

[drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
panel-simple-dp-aux aux-1-0008: DP AUX done_probing() can't defer
panel-simple-dp-aux aux-1-0008: probe with driver panel-simple-dp-aux failed with error -22

Enabling CONFIG_PHY_MTK_XSPHY=y and CONFIG_PHY_MTK_HDMI=y in drm-ci
resolves this issue for mt8173.

So enable these PHY configs for mediatek platforms.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f25423de383..09aedc3447b7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1573,6 +1573,9 @@ CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_MTK_TPHY=y
+CONFIG_PHY_MTK_MIPI_DSI=m
+CONFIG_PHY_MTK_XSPHY=m
+CONFIG_PHY_MTK_HDMI=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
-- 
2.47.2

