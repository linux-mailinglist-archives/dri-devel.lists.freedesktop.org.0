Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C07532127
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 04:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B7810E00F;
	Tue, 24 May 2022 02:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCC710E00F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 02:45:55 +0000 (UTC)
Received: from kwepemi500002.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4L6dqM1S1zzDqKf;
 Tue, 24 May 2022 10:45:51 +0800 (CST)
Received: from kwepemm600018.china.huawei.com (7.193.23.140) by
 kwepemi500002.china.huawei.com (7.221.188.171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 24 May 2022 10:45:53 +0800
Received: from huawei.com (10.174.176.88) by kwepemm600018.china.huawei.com
 (7.193.23.140) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 10:45:52 +0800
From: gaochao <gaochao49@huawei.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dianders@chromium.org>
Subject: [PATCH v2 -next] drm/panel: Fix build error when
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m
Date: Tue, 24 May 2022 10:45:51 +0800
Message-ID: <20220524024551.539-1-gaochao49@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20220523060658.737-1-gaochao49@huawei.com>
References: <20220523060658.737-1-gaochao49@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.176.88]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600018.china.huawei.com (7.193.23.140)
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
Cc: zhengbin13@huawei.com, seanpaul@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gao Chao <gaochao49@huawei.com>

If CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m,
bulding fails:

drivers/gpu/drm/panel/panel-samsung-atna33xc20.o: In function `atana33xc20_probe':
panel-samsung-atna33xc20.c:(.text+0x744): undefined reference to
 `drm_panel_dp_aux_backlight'
make: *** [vmlinux] Error 1

Let CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20 select DRM_DISPLAY_DP_HELPER and
CONFIG_DRM_DISPLAY_HELPER to fix this error.

Fixes: 32ce3b320343 ("drm/panel: atna33xc20: Introduce the Samsung ATNA33XC20 panel")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Gao Chao <gaochao49@huawei.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v1->v2: fix Signed-off-by name
---
 drivers/gpu/drm/panel/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 38799effd00a..4f1f004b3c54 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -438,6 +438,8 @@ config DRM_PANEL_SAMSUNG_ATNA33XC20
 	depends on OF
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on PM
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select DRM_DP_AUX_BUS
 	help
 	  DRM panel driver for the Samsung ATNA33XC20 panel. This panel can't
--
2.17.1

