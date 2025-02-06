Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68602A2A2E9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 09:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D494510E7EC;
	Thu,  6 Feb 2025 08:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 971 seconds by postgrey-1.36 at gabe;
 Thu, 06 Feb 2025 03:51:33 UTC
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDBE10E41E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 03:51:33 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YpN1n5ljzz1l0ZW;
 Thu,  6 Feb 2025 11:31:41 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
 by mail.maildlp.com (Postfix) with ESMTPS id 79BA2140391;
 Thu,  6 Feb 2025 11:35:19 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 6 Feb 2025 11:35:18 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <dri-devel@lists.freedesktop.org>
CC: <libaihan@huawei.com>, <shiyongbang@huawei.com>,
 <prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH] drm/hisilicon/hibmc: Select DRM_DISPLAY_HELPER for the
 helpers functions
Date: Thu, 6 Feb 2025 11:34:37 +0800
Message-ID: <20250206033437.56384-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Mailman-Approved-At: Thu, 06 Feb 2025 08:05:28 +0000
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

From: Yicong Yang <yangyicong@hisilicon.com>

DP stuffs of hibmc are using DRM DP helpers, select the Kconfig for
dependency. Otherwise with below configuration:
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_HISI_HIBMC=y

Below link error is met:
ld: Unexpected GOT/PLT entries detected!
ld: Unexpected run-time procedure linkages detected!
ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.o: in function `hibmc_dp_aux_init':
drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c:163: undefined reference to `drm_dp_aux_init'
[...]
ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_get_adjust_train':
drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:129: undefined reference to `drm_dp_get_adjust_request_voltage'

Fixes: 54063d86e036 ("drm/hisilicon/hibmc: add dp link moduel in hibmc drivers")
Fixes: 057e77972556 ("drm/hisilicon/hibmc: add dp aux in hibmc drivers")
Cc: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
index 93b8d32e3be1..249ceac71b19 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
+++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
@@ -4,6 +4,7 @@ config DRM_HISI_HIBMC
 	depends on DRM && PCI
 	depends on MMU
 	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
 	select DRM_TTM
-- 
2.24.0

