Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD0B4DC344
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 10:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D149B10E770;
	Thu, 17 Mar 2022 09:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8082910E770
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 09:47:34 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KK2Ly2Nx7z921l;
 Thu, 17 Mar 2022 17:45:30 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Thu, 17 Mar
 2022 17:47:31 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <andrzej.hajda@intel.com>, <narmstrong@baylibre.com>,
 <robert.foss@linaro.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <hermes.wu@ite.com.tw>, <allen.chen@ite.com.tw>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH -next] drm/bridge: it6505: Fix build error
Date: Thu, 17 Mar 2022 17:47:24 +0800
Message-ID: <20220317094724.25972-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If DRM_ITE_IT6505 is y but DRM_DP_HELPER is m, building failed:

drivers/gpu/drm/bridge/ite-it6505.o: In function `it6505_i2c_remove':
ite-it6505.c:(.text+0x35c): undefined reference to `drm_dp_aux_unregister'
drivers/gpu/drm/bridge/ite-it6505.o: In function `it6505_dpcd_read':
ite-it6505.c:(.text+0x420): undefined reference to `drm_dp_dpcd_read'
drivers/gpu/drm/bridge/ite-it6505.o: In function `it6505_get_dpcd':
ite-it6505.c:(.text+0x4a4): undefined reference to `drm_dp_dpcd_read'
drivers/gpu/drm/bridge/ite-it6505.o: In function `it6505_dpcd_write':
ite-it6505.c:(.text+0x52c): undefined reference to `drm_dp_dpcd_write'

Select DRM_DP_HELPER for DRM_ITE_IT6505 to fix this.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c86f5be4dfe0..1b8721a7a6df 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -78,6 +78,7 @@ config DRM_DISPLAY_CONNECTOR
 config DRM_ITE_IT6505
         tristate "ITE IT6505 DisplayPort bridge"
         depends on OF
+	select DRM_DP_HELPER
         select DRM_KMS_HELPER
         select EXTCON
         help
-- 
2.17.1

