Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6794E605B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 09:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0A710E852;
	Thu, 24 Mar 2022 08:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1207 seconds by postgrey-1.36 at gabe;
 Thu, 24 Mar 2022 07:30:54 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C609F10E7EF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 07:30:54 +0000 (UTC)
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KPGYJ60bMzfZH9;
 Thu, 24 Mar 2022 15:09:08 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemi500015.china.huawei.com
 (7.221.188.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Thu, 24 Mar
 2022 15:10:41 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <emma@anholt.net>, <mripard@kernel.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm/vc4: Fix build error when CONFIG_DRM_VC4=y &&
 CONFIG_RASPBERRYPI_FIRMWARE=m
Date: Thu, 24 Mar 2022 15:25:42 +0800
Message-ID: <20220324072542.1238122-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500015.china.huawei.com (7.221.188.92)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 24 Mar 2022 08:32:17 +0000
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
Cc: tangyizhou@huawei.com, limingming.li@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If CONFIG_DRM_VC4=y, CONFIG_RASPBERRYPI_FIRMWARE=m, CONFIG_COMPILE_TEST=n,
bulding fails:

drivers/gpu/drm/vc4/vc4_drv.o: In function `vc4_drm_bind':
vc4_drv.c:(.text+0x320): undefined reference to `rpi_firmware_get'
vc4_drv.c:(.text+0x320): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rpi_firmware_get'
vc4_drv.c:(.text+0x34c): undefined reference to `rpi_firmware_property'
vc4_drv.c:(.text+0x34c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rpi_firmware_property'
vc4_drv.c:(.text+0x354): undefined reference to `rpi_firmware_put'
vc4_drv.c:(.text+0x354): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rpi_firmware_put'

Make DRM_VC4 depends on RASPBERRYPI_FIRMWARE to fix this.

Fixes: c406ad5e4a85 ("drm/vc4: Notify the firmware when DRM is in charge")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/vc4/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index de3424fed2fc..640907945b5b 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_VC4
 	tristate "Broadcom VC4 Graphics"
-	depends on ARCH_BCM || ARCH_BCM2835 || COMPILE_TEST
+	depends on ((ARCH_BCM || ARCH_BCM2835) && \
+		    RASPBERRYPI_FIRMWARE) || COMPILE_TEST
 	depends on DRM
 	depends on SND && SND_SOC
 	depends on COMMON_CLK
--
2.31.1

