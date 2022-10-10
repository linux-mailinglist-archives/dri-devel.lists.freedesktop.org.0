Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06625F9836
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 08:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4585210E42B;
	Mon, 10 Oct 2022 06:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B60A10E40D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 02:02:42 +0000 (UTC)
Received: from kwepemi500022.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mm2B72QLdz1P70Y;
 Mon, 10 Oct 2022 09:58:07 +0800 (CST)
Received: from huawei.com (10.67.175.34) by kwepemi500022.china.huawei.com
 (7.221.188.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 10 Oct
 2022 10:02:38 +0800
From: Ren Zhijie <renzhijie2@huawei.com>
To: <laurent.pinchart@ideasonboard.com>,
 <tomi.valkeinen+renesas@ideasonboard.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH -next] drm/rcar-du: Fix undefined reference error
Date: Mon, 10 Oct 2022 01:58:56 +0000
Message-ID: <20221010015856.248029-1-renzhijie2@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.34]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500022.china.huawei.com (7.221.188.64)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 10 Oct 2022 06:18:14 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, Ren Zhijie <renzhijie2@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If DRM_RCAR_MIPI_DSI=m and DRM_RCAR_DU=y,
gcc complained about undefined reference :

drivers/gpu/drm/rcar-du/rcar_du_crtc.o: In function `rcar_du_crtc_atomic_enable':
rcar_du_crtc.c:(.text+0x1958): undefined reference to `rcar_mipi_dsi_pclk_enable'
drivers/gpu/drm/rcar-du/rcar_du_crtc.o: In function `rcar_du_crtc_atomic_disable':
rcar_du_crtc.c:(.text+0x3cf4): undefined reference to `rcar_mipi_dsi_pclk_disable'

To fix this error, add select DRM_RCAR_MIPI_DSI dependency to config DRM_RCAR_DU.

Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index c959e8c6be7d..23f6aa70f4cf 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -7,6 +7,7 @@ config DRM_RCAR_DU
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
+	select DRM_RCAR_MIPI_DSI
 	help
 	  Choose this option if you have an R-Car chipset.
 	  If M is selected the module will be called rcar-du-drm.
-- 
2.17.1

