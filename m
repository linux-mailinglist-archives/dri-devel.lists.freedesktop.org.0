Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C055485ED
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 17:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752B910E15C;
	Mon, 13 Jun 2022 15:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1157 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jun 2022 15:13:08 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90A910E15C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 15:13:08 +0000 (UTC)
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LMDyG6wVxzRhyT;
 Mon, 13 Jun 2022 22:50:30 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemi500015.china.huawei.com
 (7.221.188.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 13 Jun
 2022 22:53:45 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <andrzej.hajda@intel.com>, <narmstrong@baylibre.com>,
 <robert.foss@linaro.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm/bridge: it6505: Add missing CRYPTO_HASH dependency
Date: Mon, 13 Jun 2022 23:06:53 +0800
Message-ID: <20220613150653.1310029-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500015.china.huawei.com (7.221.188.92)
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
Cc: zhengbin13@huawei.com, gaochao49@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver uses crypto hash functions so it needs to select CRYPTO_HASH.
This fixes build errors:

drivers/gpu/drm/bridge/ite-it6505.o: in function `it6505_hdcp_wait_ksv_list':
ite-it6505.c:(.text+0x4c26): undefined reference to `crypto_alloc_shash'
ite-it6505.c:(.text+0x4c6d): undefined reference to `crypto_shash_digest'
ite-it6505.c:(.text+0x4c7d): undefined reference to `crypto_destroy_tfm'
ite-it6505.c:(.text+0x4d69): undefined reference to `crypto_destroy_tfm'

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 8ffd601e68f9..1afe99dac0ff 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -94,6 +94,8 @@ config DRM_ITE_IT6505
         select DRM_KMS_HELPER
         select DRM_DP_HELPER
         select EXTCON
+        select CRYPTO
+        select CRYPTO_HASH
         help
           ITE IT6505 DisplayPort bridge chip driver.

--
2.31.1

