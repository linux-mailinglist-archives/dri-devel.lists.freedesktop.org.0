Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D628CA681
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26CD10E6BC;
	Tue, 21 May 2024 02:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1419710E228
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 02:58:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEXClifMsBX5kAMEo30YxRO/QSy3zMJ/UK3iyqNfgRatXn9qXz/WREZestd8N7/JImFYWgz8isoUB/PcS7hcpmY3G46PTY8XJ0HZxnp9UjIflRHqxyFzW/xaB7FZKtzQlU7XrmDJYPRJiFSc9ebfjc5mRMMomQ4oF79sXIPldS7Gb9qyZM6Z/vXEmdHhGbO5fUYwyCrrQxxOtPawlNN75cfTh8TfQExDqdxG4SdB4bdhyXXhpfd1+ytEg6eXVaQ0NPcW2TbFWBlAJ/08HkTsxyLyI3uqc0OIiF++XJpYhYfPs15hSflqVFYlLSWWlIn1ps1U43t0z0th/SWHXei82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApQx65Uq/nJ6PhVgzQi3lKuYgz09IZ3/dwIw664cNls=;
 b=TSeCSpF44zS0IOjdWUxUl+XuOZ0biKb4X1TTKqrveqDVxez0vsn1zgLxc51b2lh1X7unL0xe5/jOI6/jF+rto3MY0S1/mnK56RL3mJszpAExuDGyWitrGj5Q6Pkoz0Igbqvapvsg5fI0gQ5+qYEMh+xqUnmmB9sX/0sAecxIkuLupjQJa/dWlCHq+wqw8b0Jt8IQBFjpBHkf24euz7j7aUPKh3pbslWyJBTQQ9ASY/Pb9WyFAJabPoi4u4+iG40QL15rEz9T032iN/M+Dz1Jcx0OtxxmIgpVUhIPPyySDkkGRzi1Oa7jXQa8c9x8QLLXkD2WrBqSLITvBgSWU9EfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) by ZQ0PR01MB1255.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 02:58:30 +0000
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 ([fe80::39be:8ed9:67b7:adc6]) by
 ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn ([fe80::39be:8ed9:67b7:adc6%6])
 with mapi id 15.20.7472.044; Tue, 21 May 2024 02:58:30 +0000
From: keith <keith.zhao@starfivetech.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 xingyu.wu@starfivetech.com, p.zabel@pengutronix.de,
 jack.zhu@starfivetech.com, shengyang.chen@starfivetech.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 keith.zhao@starfivetech.com
Subject: [PATCH v4 04/10] drm/vs: Add hardware funcs for vs.
Date: Tue, 21 May 2024 18:58:11 +0800
Message-Id: <20240521105817.3301-5-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240521105817.3301-1-keith.zhao@starfivetech.com>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::29) To ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1047:EE_|ZQ0PR01MB1255:EE_
X-MS-Office365-Filtering-Correlation-Id: cda4fd93-d43d-4423-87c1-08dc7941e4d3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|41320700004|1800799015|7416005|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: GsKi38QmMrPM5ziIdCzJOwqHq0lfmnXNSXxdSSxCPlKV+T8MEzwIJ0ivSWjasMpaO6QiYKDgHJGkT4PdJwKNU2V7mfiaB0I3ILuFhZjP8dIM0LeUoRDYMeFyX3DKkYXTTTUj7UZKU0Gmbv03XQqg5eMn2FFUsyjkBu3njfYbgYeSj9AwVk9cgshpKxfLLmGxhZE3vGFCvoejLrqY/BO2OhgQvA4+4+0E7QWHTV7syJNW+1+Ae/GwoVRgE9px5d9nmckzwCarQqBwnbrF/XLD86NUKqbotv4lmuHmlN4XZ/bTJSZEFTqCTHMmnXjydRd4MAEHFGo9pHIHrsP4ZR/svi+W48SjRhIYV5jNZiQ5iVNdpNQQiGSLNQ7Wl18Ja82uTlT2A3qZmX6zz/Bz2pYt2kwwmhlX8rfRrffhD3vHhPSm7palrShzAHCgng/JQUZnVd13Pc//6btjvc3zfYcMwpLegQruZk7VBbFtR5v0CBTigSFRq/sdN97FxaKKi4209KxgvJr5eesMr6c4mVCPsHm4+p+JAleUI+ef/FdtXI41dgdwhnfRMrrc8IU6p2rkEpTtEx1S493seaeYfSbVijtOC5lRZNGxGwhvxCYeRp3li8xPG1stkWKC8//UHICqFpvFJCDJSRtd0iRg53UBYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366007)(41320700004)(1800799015)(7416005)(52116005)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ejVOXr8s/yra8x47+CqRGQGOww0Wbd5Jzzj0HncT33JW2CPWOcE14KIP/8dr?=
 =?us-ascii?Q?byaoD8XhApp3Ee7dU60+uKLEo9Nb3fM2GyC8OCBMQPNdza/KWRFqH98kg8ZI?=
 =?us-ascii?Q?t4atTQqzxefy0XpBwOa5kpfAUJsPywdGgeQmjQ/2GQPBMKsaMkKnW0BUvDGF?=
 =?us-ascii?Q?6R8hC7NiNyT1vpuGqYMS/2D5lDwU8/l07BUJVhWgORyt9SIHdu906S8nnW9M?=
 =?us-ascii?Q?FjYbH3z49tF0ZjeDifNa1Ljj3nnGm8KB4XHKqdgv7uabFIvMooRoRsKeJzhy?=
 =?us-ascii?Q?39wDs30bllIxt3IxNCb6L8XFRTLAqVLmeAAPafANSpjkucWTU7qFmH8lmpuf?=
 =?us-ascii?Q?OHlM6sHslorK9G8vln6fjrMxM04AbDFo/ZYQCeKJvj88e1hC8xAZo/z8ua2v?=
 =?us-ascii?Q?x7AT04U5mT0ulWru8p4yOgxFDAyUIhctAe13IpGIk1mETGPKeYSqEhdU0/3M?=
 =?us-ascii?Q?v/A7+VP1bH/wFDC12Ow9RxA7t47kfU9ifSRNciNX+Y2u/VbImG3MF9yYYjgN?=
 =?us-ascii?Q?3+5K8TbMHNyPE0pxxLDVqQ3E6YncDQpIqdO3lxNl8dQEZDuEfKyIZ6Zp+G2e?=
 =?us-ascii?Q?33PwCqmF2TSSwD+v759FcXRdxONIqQ0EN+Vmh6qDHW5vwrChEhKc5POb8+ec?=
 =?us-ascii?Q?ENEp9y7+LjMGWN6ksK98uHQtvmsV16mP7bLS77Yp7pqmlCo4UjHI7QGqBmKo?=
 =?us-ascii?Q?ACJA6E6NY20PirFqMhGHadp8FMCUxTjz9LwqbP5jeDmFtV5HWCUfKwm5t1Jg?=
 =?us-ascii?Q?UzIiHkFqVYv51yhhIM+K7obskdaRP+jrl4IVQcqQ1KTwqNMwtU/ZkWJ5sPHB?=
 =?us-ascii?Q?j0XuU5C+oWuO/vCje+71eopp36KoGmGcxs5im8U0iDheB/1wWWYpVSUR+0dg?=
 =?us-ascii?Q?ELHjv7ji0DJPuu04d6zX/dwAB4WlSwojTlD7BHILSeMLHPQJWUinMIhu70nz?=
 =?us-ascii?Q?HkRZ5NPDJvBVzycDxr75ogLwW58wP6DpTbdV1YCh3syYuWcN4fA1xUq8MnbA?=
 =?us-ascii?Q?C2NSgkqD1ylhvWN7cEquK1QiWMdCbPwh8oKkO075pff6FnHIGC2WM+S6KRZq?=
 =?us-ascii?Q?AMGrvQAKKnSKOyRRL8ak4fjxxkFFoHhBLGUJf1Ziw+QnEYhuHaCmKFNIGKBA?=
 =?us-ascii?Q?0Pbsr4TbH3UKTlnV9yhQ8lxctiClrApkGQnoGpBvRzVjzVI21tvY5E0wwHFr?=
 =?us-ascii?Q?STGOGOe8Dgtx69dHQjOHycYWRNwh3ECOaJLxIoGNrsg66IZTsRBu2nXD9nJX?=
 =?us-ascii?Q?zh3FpUtKlu5FOHiVpaRB+x/9gnbpI0tu9aIZtsLghKDgN7NW3YkUkd0H30vF?=
 =?us-ascii?Q?Q4L5aHVhAk6a31oVX3JRa3uso9GaNx6gQJFnOIlMB1IRw+LYgFGkjivumYNp?=
 =?us-ascii?Q?iL4IRJ51M6cRDyjBMDLbilrz9zvgeWEm6kjzJUF153tZ4rBmiZSLzKDDClFr?=
 =?us-ascii?Q?wE4VZ4q1Edbvjc+PYLu6DTb9tpwknLc1Etuy33WjGCi++thD7WQTlgvRFeFa?=
 =?us-ascii?Q?yGyWtrEZdLGThPOLCdeOKpd0SHoVN9btRWTB6T2JH5I/rX3MDW4Hrgi7DZsQ?=
 =?us-ascii?Q?IC5GwrhbQ+3RUUH0aGsBqt7AWikzyk3JXAz1roPtLIg0H+UsHQNcOcO0Duie?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda4fd93-d43d-4423-87c1-08dc7941e4d3
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:58:29.9976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +teN81CXgOzQueS3CE14dDv/8/AFOUxgwblv0Ij9q9s47b/+WRSmrvnclzGAwGulpANaHvSGfouAmD2BOydvAostC28idp8Eb5XTZ2dbcZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1255
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

add hardware base api for vs drm

Signed-off-by: keith <keith.zhao@starfivetech.com>
---
 MAINTAINERS                            |    1 +
 drivers/gpu/drm/Kconfig                |    2 +
 drivers/gpu/drm/Makefile               |    1 +
 drivers/gpu/drm/verisilicon/Kconfig    |   13 +
 drivers/gpu/drm/verisilicon/Makefile   |    5 +
 drivers/gpu/drm/verisilicon/vs_dc_hw.c | 1060 ++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc_hw.h |  493 +++++++++++
 drivers/gpu/drm/verisilicon/vs_type.h  |   84 ++
 8 files changed, 1659 insertions(+)
 create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
 create mode 100644 drivers/gpu/drm/verisilicon/Makefile
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cf2d66f88a83..9cb376f76f74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7156,6 +7156,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/starfive/
 F:	drivers/gpu/drm/bridge/innosilicon/
+F:	drivers/gpu/drm/verisilicon
 F:	include/drm/bridge/inno_hdmi.h
 
 DRM DRIVER FOR SYNAPTICS R63353 PANELS
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 026444eeb5c6..5413d87ef1d6 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -423,6 +423,8 @@ source "drivers/gpu/drm/sprd/Kconfig"
 
 source "drivers/gpu/drm/imagination/Kconfig"
 
+source "drivers/gpu/drm/verisilicon/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index f9ca4f8fa6c5..cb27092b1672 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -219,3 +219,4 @@ obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
 obj-$(CONFIG_DRM_LOONGSON) += loongson/
 obj-$(CONFIG_DRM_POWERVR) += imagination/
+obj-$(CONFIG_DRM_VERISILICON_DC8200) += verisilicon/
diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
new file mode 100644
index 000000000000..2d733f93439e
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+config DRM_VERISILICON_DC8200
+	tristate "DRM Support for VeriSilicon DC8200"
+	depends on DRM
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select CMA
+	select DMA_CMA
+	help
+	  Choose this option if you have a VeriSilicon DC8200 chipset.
+	  This driver provides VeriSilicon kernel mode
+	  setting and buffer management. It does not
+	  provide 2D or 3D acceleration.
diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
new file mode 100644
index 000000000000..7da54b259940
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+vs_drm-objs := vs_dc_hw.o
+
+obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/vs_dc_hw.c b/drivers/gpu/drm/verisilicon/vs_dc_hw.c
new file mode 100644
index 000000000000..69f020f8352f
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc_hw.c
@@ -0,0 +1,1060 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/media-bus-format.h>
+//#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_fb_dma_helper.h>
+
+#include "vs_dc_hw.h"
+
+static const u32 horkernel[] = {
+	0x00000000, 0x20000000, 0x00002000, 0x00000000,
+	0x00000000, 0x00000000, 0x23fd1c03, 0x00000000,
+	0x00000000, 0x00000000, 0x181f0000, 0x000027e1,
+	0x00000000, 0x00000000, 0x00000000, 0x2b981468,
+	0x00000000, 0x00000000, 0x00000000, 0x10f00000,
+	0x00002f10, 0x00000000, 0x00000000, 0x00000000,
+	0x32390dc7, 0x00000000, 0x00000000, 0x00000000,
+	0x0af50000, 0x0000350b, 0x00000000, 0x00000000,
+	0x00000000, 0x3781087f, 0x00000000, 0x00000000,
+	0x00000000, 0x06660000, 0x0000399a, 0x00000000,
+	0x00000000, 0x00000000, 0x3b5904a7, 0x00000000,
+	0x00000000, 0x00000000, 0x033c0000, 0x00003cc4,
+	0x00000000, 0x00000000, 0x00000000, 0x3de1021f,
+	0x00000000, 0x00000000, 0x00000000, 0x01470000,
+	0x00003eb9, 0x00000000, 0x00000000, 0x00000000,
+	0x3f5300ad, 0x00000000, 0x00000000, 0x00000000,
+	0x00480000, 0x00003fb8, 0x00000000, 0x00000000,
+	0x00000000, 0x3fef0011, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00004000, 0x00000000,
+	0x00000000, 0x00000000, 0x20002000, 0x00000000,
+	0x00000000, 0x00000000, 0x1c030000, 0x000023fd,
+	0x00000000, 0x00000000, 0x00000000, 0x27e1181f,
+	0x00000000, 0x00000000, 0x00000000, 0x14680000,
+	0x00002b98, 0x00000000, 0x00000000, 0x00000000,
+	0x2f1010f0, 0x00000000, 0x00000000, 0x00000000,
+	0x0dc70000, 0x00003239, 0x00000000, 0x00000000,
+	0x00000000, 0x350b0af5, 0x00000000, 0x00000000,
+	0x00000000, 0x087f0000, 0x00003781, 0x00000000,
+	0x00000000, 0x00000000, 0x399a0666, 0x00000000,
+	0x00000000, 0x00000000, 0x04a70000, 0x00003b59,
+	0x00000000, 0x00000000, 0x00000000, 0x3cc4033c,
+	0x00000000, 0x00000000, 0x00000000, 0x021f0000,
+};
+
+#define H_COEF_SIZE ARRAY_SIZE(horkernel)
+
+static const u32 verkernel[] = {
+	0x00000000, 0x20000000, 0x00002000, 0x00000000,
+	0x00000000, 0x00000000, 0x23fd1c03, 0x00000000,
+	0x00000000, 0x00000000, 0x181f0000, 0x000027e1,
+	0x00000000, 0x00000000, 0x00000000, 0x2b981468,
+	0x00000000, 0x00000000, 0x00000000, 0x10f00000,
+	0x00002f10, 0x00000000, 0x00000000, 0x00000000,
+	0x32390dc7, 0x00000000, 0x00000000, 0x00000000,
+	0x0af50000, 0x0000350b, 0x00000000, 0x00000000,
+	0x00000000, 0x3781087f, 0x00000000, 0x00000000,
+	0x00000000, 0x06660000, 0x0000399a, 0x00000000,
+	0x00000000, 0x00000000, 0x3b5904a7, 0x00000000,
+	0x00000000, 0x00000000, 0x033c0000, 0x00003cc4,
+	0x00000000, 0x00000000, 0x00000000, 0x3de1021f,
+	0x00000000, 0x00000000, 0x00000000, 0x01470000,
+	0x00003eb9, 0x00000000, 0x00000000, 0x00000000,
+	0x3f5300ad, 0x00000000, 0x00000000, 0x00000000,
+	0x00480000, 0x00003fb8, 0x00000000, 0x00000000,
+	0x00000000, 0x3fef0011, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00004000, 0x00000000,
+	0xcdcd0000, 0xfdfdfdfd, 0xabababab, 0xabababab,
+	0x00000000, 0x00000000, 0x5ff5f456, 0x000f5f58,
+	0x02cc6c78, 0x02cc0c28, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+};
+
+#define V_COEF_SIZE ARRAY_SIZE(verkernel)
+
+/*
+ * RGB 709->2020 conversion parameters
+ */
+static const u16 RGB2RGB[RGB_TO_RGB_TABLE_SIZE] = {
+	10279,	5395,	709,
+	1132,	15065,	187,
+	269,	1442,	14674
+};
+
+/*
+ * YUV601 to RGB conversion parameters
+ * YUV2RGB[0]  - [8] : C0 - C8;
+ * YUV2RGB[9]  - [11]: D0 - D2;
+ * YUV2RGB[12] - [13]: Y clamp min & max calue;
+ * YUV2RGB[14] - [15]: UV clamp min & max calue;
+ */
+static const s32 YUV601_2RGB[YUV_TO_RGB_TABLE_SIZE] = {
+	1196,	0,		1640,	1196,
+	-404,	-836,		1196,	2076,
+	0,	-916224,	558336,	-1202944,
+	64,	940,		64,	960
+};
+
+/*
+ * YUV709 to RGB conversion parameters
+ * YUV2RGB[0]  - [8] : C0 - C8;
+ * YUV2RGB[9]  - [11]: D0 - D2;
+ * YUV2RGB[12] - [13]: Y clamp min & max calue;
+ * YUV2RGB[14] - [15]: UV clamp min & max calue;
+ */
+static s32 YUV709_2RGB[YUV_TO_RGB_TABLE_SIZE] = {
+	1196,		0,		1844,	1196,
+	-220,		-548,	1196,	2172,
+	0,			-1020672, 316672,  -1188608,
+	64,			940,		64,		960
+};
+
+/*
+ * YUV2020 to RGB conversion parameters
+ * YUV2RGB[0]  - [8] : C0 - C8;
+ * YUV2RGB[9]  - [11]: D0 - D2;
+ * YUV2RGB[12] - [13]: Y clamp min & max calue;
+ * YUV2RGB[14] - [15]: UV clamp min & max calue;
+ */
+static s32 YUV2020_2RGB[YUV_TO_RGB_TABLE_SIZE] = {
+	1196, 0, 1724, 1196,
+	-192, -668, 1196, 2200,
+	0, -959232, 363776, -1202944,
+	64, 940, 64, 960
+};
+
+/*
+ * RGB to YUV2020 conversion parameters
+ * RGB2YUV[0] - [8] : C0 - C8;
+ * RGB2YUV[9] - [11]: D0 - D2;
+ */
+static s16 RGB2YUV[RGB_TO_YUV_TABLE_SIZE] = {
+	230,	594,	52,
+	-125,  -323,	448,
+	448,   -412,   -36,
+	64,		512,	512
+};
+
+/* one is for primary plane and the other is for all overlay planes */
+static const struct dc_hw_plane_reg dc_plane_reg[] = {
+	{
+		.y_address		= DC_FRAMEBUFFER_ADDRESS,
+		.u_address		= DC_FRAMEBUFFER_U_ADDRESS,
+		.v_address		= DC_FRAMEBUFFER_V_ADDRESS,
+		.y_stride		= DC_FRAMEBUFFER_STRIDE,
+		.u_stride		= DC_FRAMEBUFFER_U_STRIDE,
+		.v_stride		= DC_FRAMEBUFFER_V_STRIDE,
+		.size			= DC_FRAMEBUFFER_SIZE,
+		.top_left		= DC_FRAMEBUFFER_TOP_LEFT,
+		.bottom_right	= DC_FRAMEBUFFER_BOTTOM_RIGHT,
+		.scale_factor_x			= DC_FRAMEBUFFER_SCALE_FACTOR_X,
+		.scale_factor_y			= DC_FRAMEBUFFER_SCALE_FACTOR_Y,
+		.h_filter_coef_index	= DC_FRAMEBUFFER_H_FILTER_COEF_INDEX,
+		.h_filter_coef_data		= DC_FRAMEBUFFER_H_FILTER_COEF_DATA,
+		.v_filter_coef_index	= DC_FRAMEBUFFER_V_FILTER_COEF_INDEX,
+		.v_filter_coef_data		= DC_FRAMEBUFFER_V_FILTER_COEF_DATA,
+		.init_offset			= DC_FRAMEBUFFER_INIT_OFFSET,
+		.color_key				= DC_FRAMEBUFFER_COLOR_KEY,
+		.color_key_high			= DC_FRAMEBUFFER_COLOR_KEY_HIGH,
+		.clear_value			= DC_FRAMEBUFFER_CLEAR_VALUE,
+		.color_table_index		= DC_FRAMEBUFFER_COLOR_TABLE_INDEX,
+		.color_table_data		= DC_FRAMEBUFFER_COLOR_TABLE_DATA,
+		.scale_config			= DC_FRAMEBUFFER_SCALE_CONFIG,
+		.water_mark				= DC_FRAMEBUFFER_WATER_MARK,
+		.degamma_index			= DC_FRAMEBUFFER_DEGAMMA_INDEX,
+		.degamma_data			= DC_FRAMEBUFFER_DEGAMMA_DATA,
+		.degamma_ex_data		= DC_FRAMEBUFFER_DEGAMMA_EX_DATA,
+		.src_global_color		= DC_FRAMEBUFFER_SRC_GLOBAL_COLOR,
+		.dst_global_color		= DC_FRAMEBUFFER_DST_GLOBAL_COLOR,
+		.blend_config			= DC_FRAMEBUFFER_BLEND_CONFIG,
+		.roi_origin				= DC_FRAMEBUFFER_ROI_ORIGIN,
+		.roi_size				= DC_FRAMEBUFFER_ROI_SIZE,
+		.yuv_to_rgb_coef0			= DC_FRAMEBUFFER_YUVTORGB_COEF0,
+		.yuv_to_rgb_coef1			= DC_FRAMEBUFFER_YUVTORGB_COEF1,
+		.yuv_to_rgb_coef2			= DC_FRAMEBUFFER_YUVTORGB_COEF2,
+		.yuv_to_rgb_coef3			= DC_FRAMEBUFFER_YUVTORGB_COEF3,
+		.yuv_to_rgb_coef4			= DC_FRAMEBUFFER_YUVTORGB_COEF4,
+		.yuv_to_rgb_coefd0			= DC_FRAMEBUFFER_YUVTORGB_COEFD0,
+		.yuv_to_rgb_coefd1			= DC_FRAMEBUFFER_YUVTORGB_COEFD1,
+		.yuv_to_rgb_coefd2			= DC_FRAMEBUFFER_YUVTORGB_COEFD2,
+		.y_clamp_bound				= DC_FRAMEBUFFER_Y_CLAMP_BOUND,
+		.uv_clamp_bound				= DC_FRAMEBUFFER_UV_CLAMP_BOUND,
+		.rgb_to_rgb_coef0			= DC_FRAMEBUFFER_RGBTORGB_COEF0,
+		.rgb_to_rgb_coef1			= DC_FRAMEBUFFER_RGBTORGB_COEF1,
+		.rgb_to_rgb_coef2			= DC_FRAMEBUFFER_RGBTORGB_COEF2,
+		.rgb_to_rgb_coef3			= DC_FRAMEBUFFER_RGBTORGB_COEF3,
+		.rgb_to_rgb_coef4			= DC_FRAMEBUFFER_RGBTORGB_COEF4,
+	},
+	{
+		.y_address		= DC_OVERLAY_ADDRESS,
+		.u_address		= DC_OVERLAY_U_ADDRESS,
+		.v_address		= DC_OVERLAY_V_ADDRESS,
+		.y_stride		= DC_OVERLAY_STRIDE,
+		.u_stride		= DC_OVERLAY_U_STRIDE,
+		.v_stride		= DC_OVERLAY_V_STRIDE,
+		.size			= DC_OVERLAY_SIZE,
+		.top_left		= DC_OVERLAY_TOP_LEFT,
+		.bottom_right	= DC_OVERLAY_BOTTOM_RIGHT,
+		.scale_factor_x	= DC_OVERLAY_SCALE_FACTOR_X,
+		.scale_factor_y	= DC_OVERLAY_SCALE_FACTOR_Y,
+		.h_filter_coef_index = DC_OVERLAY_H_FILTER_COEF_INDEX,
+		.h_filter_coef_data  = DC_OVERLAY_H_FILTER_COEF_DATA,
+		.v_filter_coef_index = DC_OVERLAY_V_FILTER_COEF_INDEX,
+		.v_filter_coef_data  = DC_OVERLAY_V_FILTER_COEF_DATA,
+		.init_offset		 = DC_OVERLAY_INIT_OFFSET,
+		.color_key			 = DC_OVERLAY_COLOR_KEY,
+		.color_key_high			= DC_OVERLAY_COLOR_KEY_HIGH,
+		.clear_value		 = DC_OVERLAY_CLEAR_VALUE,
+		.color_table_index	 = DC_OVERLAY_COLOR_TABLE_INDEX,
+		.color_table_data	 = DC_OVERLAY_COLOR_TABLE_DATA,
+		.scale_config		 = DC_OVERLAY_SCALE_CONFIG,
+		.water_mark				= DC_OVERLAY_WATER_MARK,
+		.degamma_index		 = DC_OVERLAY_DEGAMMA_INDEX,
+		.degamma_data		 = DC_OVERLAY_DEGAMMA_DATA,
+		.degamma_ex_data	 = DC_OVERLAY_DEGAMMA_EX_DATA,
+		.src_global_color	 = DC_OVERLAY_SRC_GLOBAL_COLOR,
+		.dst_global_color	 = DC_OVERLAY_DST_GLOBAL_COLOR,
+		.blend_config		 = DC_OVERLAY_BLEND_CONFIG,
+		.roi_origin				= DC_OVERLAY_ROI_ORIGIN,
+		.roi_size				= DC_OVERLAY_ROI_SIZE,
+		.yuv_to_rgb_coef0		 = DC_OVERLAY_YUVTORGB_COEF0,
+		.yuv_to_rgb_coef1		 = DC_OVERLAY_YUVTORGB_COEF1,
+		.yuv_to_rgb_coef2		 = DC_OVERLAY_YUVTORGB_COEF2,
+		.yuv_to_rgb_coef3		 = DC_OVERLAY_YUVTORGB_COEF3,
+		.yuv_to_rgb_coef4			= DC_OVERLAY_YUVTORGB_COEF4,
+		.yuv_to_rgb_coefd0			= DC_OVERLAY_YUVTORGB_COEFD0,
+		.yuv_to_rgb_coefd1			= DC_OVERLAY_YUVTORGB_COEFD1,
+		.yuv_to_rgb_coefd2			= DC_OVERLAY_YUVTORGB_COEFD2,
+		.y_clamp_bound		 = DC_OVERLAY_Y_CLAMP_BOUND,
+		.uv_clamp_bound		 = DC_OVERLAY_UV_CLAMP_BOUND,
+		.rgb_to_rgb_coef0		 = DC_OVERLAY_RGBTORGB_COEF0,
+		.rgb_to_rgb_coef1		 = DC_OVERLAY_RGBTORGB_COEF1,
+		.rgb_to_rgb_coef2		 = DC_OVERLAY_RGBTORGB_COEF2,
+		.rgb_to_rgb_coef3		 = DC_OVERLAY_RGBTORGB_COEF3,
+		.rgb_to_rgb_coef4		 = DC_OVERLAY_RGBTORGB_COEF4,
+	},
+};
+
+static inline u32 hi_read(struct dc_hw *hw, u32 reg)
+{
+	return readl(hw->hi_base + reg);
+}
+
+static inline void hi_write(struct dc_hw *hw, u32 reg, u32 value)
+{
+	writel(value, hw->hi_base + reg);
+}
+
+static inline void dc_write(struct dc_hw *hw, u32 reg, u32 value)
+{
+	writel(value, hw->reg_base + reg - DC_REG_BASE);
+}
+
+static inline u32 dc_read(struct dc_hw *hw, u32 reg)
+{
+	u32 value = readl(hw->reg_base + reg - DC_REG_BASE);
+
+	return value;
+}
+
+static inline void dc_set_clear(struct dc_hw *hw, u32 reg, u32 set, u32 clear)
+{
+	u32 value = dc_read(hw, reg);
+
+	value &= ~clear;
+	value |= set;
+	dc_write(hw, reg, value);
+}
+
+static void load_default_filter(struct dc_hw *hw,
+				const struct dc_hw_plane_reg *reg, u32 offset)
+{
+	u8 i;
+
+	dc_write(hw, reg->scale_config + offset, 0x33);
+	dc_write(hw, reg->init_offset + offset, 0x80008000);
+	dc_write(hw, reg->h_filter_coef_index + offset, 0x00);
+	for (i = 0; i < H_COEF_SIZE; i++)
+		dc_write(hw, reg->h_filter_coef_data + offset, horkernel[i]);
+
+	dc_write(hw, reg->v_filter_coef_index + offset, 0x00);
+	for (i = 0; i < V_COEF_SIZE; i++)
+		dc_write(hw, reg->v_filter_coef_data + offset, verkernel[i]);
+}
+
+static void load_rgb_to_rgb(struct dc_hw *hw, const struct dc_hw_plane_reg *reg,
+			    u32 offset, const u16 *table)
+{
+	dc_write(hw, reg->rgb_to_rgb_coef0 + offset, table[0] | (table[1] << 16));
+	dc_write(hw, reg->rgb_to_rgb_coef1 + offset, table[2] | (table[3] << 16));
+	dc_write(hw, reg->rgb_to_rgb_coef2 + offset, table[4] | (table[5] << 16));
+	dc_write(hw, reg->rgb_to_rgb_coef3 + offset, table[6] | (table[7] << 16));
+	dc_write(hw, reg->rgb_to_rgb_coef4 + offset, table[8]);
+}
+
+static void load_yuv_to_rgb(struct dc_hw *hw, const struct dc_hw_plane_reg *reg,
+			    u32 offset, const s32 *table)
+{
+	dc_write(hw, reg->yuv_to_rgb_coef0 + offset,
+		 (0xFFFF & table[0]) | (table[1] << 16));
+	dc_write(hw, reg->yuv_to_rgb_coef1 + offset,
+		 (0xFFFF & table[2]) | (table[3] << 16));
+	dc_write(hw, reg->yuv_to_rgb_coef2 + offset,
+		 (0xFFFF & table[4]) | (table[5] << 16));
+	dc_write(hw, reg->yuv_to_rgb_coef3 + offset,
+		 (0xFFFF & table[6]) | (table[7] << 16));
+	dc_write(hw, reg->yuv_to_rgb_coef4 + offset, table[8]);
+	dc_write(hw, reg->yuv_to_rgb_coefd0 + offset, table[9]);
+	dc_write(hw, reg->yuv_to_rgb_coefd1 + offset, table[10]);
+	dc_write(hw, reg->yuv_to_rgb_coefd2 + offset, table[11]);
+	dc_write(hw, reg->y_clamp_bound + offset, table[12] | (table[13] << 16));
+	dc_write(hw, reg->uv_clamp_bound + offset, table[14] | (table[15] << 16));
+}
+
+static void load_rgb_to_yuv(struct dc_hw *hw, u32 offset, s16 *table)
+{
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF0 + offset,
+		 table[0] | (table[1] << 16));
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF1 + offset,
+		 table[2] | (table[3] << 16));
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF2 + offset,
+		 table[4] | (table[5] << 16));
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF3 + offset,
+		 table[6] | (table[7] << 16));
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF4 + offset, table[8]);
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEFD0 + offset, table[9]);
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEFD1 + offset, table[10]);
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEFD2 + offset, table[11]);
+}
+
+static int update_vs_format(u32 drm_format)
+{
+	u8 f = FORMAT_A8R8G8B8;
+
+	switch (drm_format) {
+	case DRM_FORMAT_XRGB4444:
+	case DRM_FORMAT_RGBX4444:
+	case DRM_FORMAT_XBGR4444:
+	case DRM_FORMAT_BGRX4444:
+		f = FORMAT_X4R4G4B4;
+		break;
+	case DRM_FORMAT_ARGB4444:
+	case DRM_FORMAT_RGBA4444:
+	case DRM_FORMAT_ABGR4444:
+	case DRM_FORMAT_BGRA4444:
+		f = FORMAT_A4R4G4B4;
+		break;
+	case DRM_FORMAT_XRGB1555:
+	case DRM_FORMAT_RGBX5551:
+	case DRM_FORMAT_XBGR1555:
+	case DRM_FORMAT_BGRX5551:
+		f = FORMAT_X1R5G5B5;
+		break;
+	case DRM_FORMAT_ARGB1555:
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_ABGR1555:
+	case DRM_FORMAT_BGRA5551:
+		f = FORMAT_A1R5G5B5;
+		break;
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_BGR565:
+		f = FORMAT_R5G6B5;
+		break;
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_BGRX8888:
+		f = FORMAT_X8R8G8B8;
+		break;
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_BGRA8888:
+		f = FORMAT_A8R8G8B8;
+		break;
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_YVYU:
+		f = FORMAT_YUY2;
+		break;
+	case DRM_FORMAT_UYVY:
+	case DRM_FORMAT_VYUY:
+		f = FORMAT_UYVY;
+		break;
+	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YVU420:
+		f = FORMAT_YV12;
+		break;
+	case DRM_FORMAT_NV21:
+		f = FORMAT_NV12;
+		break;
+	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV61:
+		f = FORMAT_NV16;
+		break;
+	case DRM_FORMAT_P010:
+		f = FORMAT_P010;
+		break;
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_BGRA1010102:
+		f = FORMAT_A2R10G10B10;
+		break;
+	case DRM_FORMAT_NV12:
+		f = FORMAT_NV12;
+		break;
+	case DRM_FORMAT_YUV444:
+		f = FORMAT_YUV444;
+		break;
+	default:
+		break;
+	}
+
+	return f;
+}
+
+int dc_hw_init(struct vs_dc *dc)
+{
+	u8 i, id, panel_num, layer_num;
+	struct dc_hw *hw = &dc->hw;
+	u32 offset;
+
+	layer_num = hw->info->layer_num;
+	for (i = 0; i < layer_num; i++) {
+		id = dc->planes[i].id;
+		if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1)
+			hw->reg[i] = dc_plane_reg[0];
+		else
+			hw->reg[i] = dc_plane_reg[1];
+
+		load_default_filter(hw, &hw->reg[i], dc->planes[i].offset);
+		load_rgb_to_rgb(hw, &hw->reg[i], dc->planes[i].offset, RGB2RGB);
+	}
+
+	panel_num = hw->info->panel_num;
+	for (i = 0; i < panel_num; i++) {
+		offset = i << 2;
+
+		load_rgb_to_yuv(hw, offset, RGB2YUV);
+		dc_write(hw, DC_DISPLAY_PANEL_CONFIG + offset, 0x111);
+
+		offset = i ? DC_CURSOR_OFFSET : 0;
+		dc_write(hw, DC_CURSOR_BACKGROUND + offset, 0x00FFFFFF);
+		dc_write(hw, DC_CURSOR_FOREGROUND + offset, 0x00AAAAAA);
+	}
+
+	return 0;
+}
+
+void dc_hw_disable_plane(struct vs_dc *dc, u8 id)
+{
+	struct dc_hw *hw = &dc->hw;
+
+	if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1)
+		dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX + dc->planes[id].offset,
+			     PRIMARY_EN(false), PRIMARY_EN_MASK);
+	else
+		dc_set_clear(hw, DC_OVERLAY_CONFIG + dc->planes[id].offset,
+			     OVERLAY_FB_EN(false), OVERLAY_FB_EN_MASK);
+}
+
+static int update_cursor_size(uint32_t crtc_w)
+{
+	u8 size_type;
+
+	switch (crtc_w) {
+	case 32:
+		size_type = CURSOR_SIZE_32X32;
+		break;
+	case 64:
+		size_type = CURSOR_SIZE_64X64;
+		break;
+	default:
+		size_type = CURSOR_SIZE_32X32;
+		break;
+	}
+
+	return size_type;
+}
+
+void dc_hw_update_cursor(struct dc_hw *hw, u8 id, dma_addr_t dma_addr,
+			 u32 crtc_w, u32 crtc_x, u32 crtc_y,
+			 s32 hotspot_x, s32 hotspot_y)
+{
+	u32 offset, size;
+
+	offset = id ? DC_CURSOR_OFFSET : 0;
+	size = update_cursor_size(crtc_w);
+
+	dc_write(hw, DC_CURSOR_ADDRESS + offset,
+		 dma_addr);
+	dc_write(hw, DC_CURSOR_LOCATION + offset,
+		 X_LCOTION(crtc_x) |
+		 Y_LCOTION(crtc_y));
+	dc_set_clear(hw, DC_CURSOR_CONFIG + offset,
+		     CURSOR_HOT_X(hotspot_x) |
+		     CURSOR_HOT_y(hotspot_y) |
+		     CURSOR_SIZE(size) |
+		     CURSOR_VALID(1) |
+		     CURSOR_TRIG_FETCH(1) |
+		     CURSOR_FORMAT(CURSOR_FORMAT_A8R8G8B8),
+		     CURSOR_HOT_X_MASK |
+		     CURSOR_HOT_y_MASK |
+		     CURSOR_SIZE_MASK |
+		     CURSOR_VALID_MASK |
+		     CURSOR_TRIG_FETCH_MASK |
+		     CURSOR_FORMAT_MASK);
+}
+
+void dc_hw_disable_cursor(struct dc_hw *hw, u8 id)
+{
+	u32 offset = 0;
+
+	offset = id ? DC_CURSOR_OFFSET : 0;
+	dc_set_clear(hw, DC_CURSOR_CONFIG + offset, CURSOR_VALID(1), CURSOR_FORMAT_MASK);
+}
+
+void dc_hw_update_gamma(struct dc_hw *hw, u8 id, u16 index,
+			u16 r, u16 g, u16 b)
+{
+	if (index >= hw->info->gamma_size)
+		return;
+
+	hw->gamma[id].gamma[index][0] = r;
+	hw->gamma[id].gamma[index][1] = g;
+	hw->gamma[id].gamma[index][2] = b;
+}
+
+void dc_hw_enable_gamma(struct dc_hw *hw, u8 id, bool enable)
+{
+	u32 value;
+
+	if (enable) {
+		dc_write(hw, DC_DISPLAY_GAMMA_EX_INDEX + (id << 2), 0x00);
+		for (int i = 0; i < GAMMA_EX_SIZE; i++) {
+			value = hw->gamma[id].gamma[i][2] |
+				(hw->gamma[id].gamma[i][1] << 12);
+			dc_write(hw, DC_DISPLAY_GAMMA_EX_DATA + (id << 2), value);
+			dc_write(hw, DC_DISPLAY_GAMMA_EX_ONE_DATA + (id << 2),
+				 hw->gamma[id].gamma[i][0]);
+		}
+		dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG + (id << 2), PANEL_GAMMA_EN, 0);
+	} else {
+		dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG + (id << 2), 0, PANEL_GAMMA_EN);
+	}
+}
+
+void dc_hw_enable(struct dc_hw *hw, int id, struct drm_display_mode *mode,
+		  u8 encoder_type, u32 output_fmt)
+{
+	u32 dp_cfg, dpi_cfg, offset = id << 2;
+	bool is_yuv = false;
+
+	if (encoder_type != DRM_MODE_ENCODER_DSI) {
+		switch (output_fmt) {
+		case MEDIA_BUS_FMT_RGB565_1X16:
+			dp_cfg = 0;
+			break;
+		case MEDIA_BUS_FMT_RGB666_1X18:
+			dp_cfg = 1;
+			break;
+		case MEDIA_BUS_FMT_RGB888_1X24:
+			dp_cfg = 2;
+			break;
+		case MEDIA_BUS_FMT_RGB101010_1X30:
+			dp_cfg = 3;
+			break;
+		case MEDIA_BUS_FMT_UYVY8_1X16:
+			dp_cfg = 2 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_YUV8_1X24:
+			dp_cfg = 4 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_UYVY10_1X20:
+			dp_cfg = 8 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_YUV10_1X30:
+			dp_cfg = 10 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+			dp_cfg = 12 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+			dp_cfg = 13 << 4;
+			is_yuv = true;
+			break;
+		default:
+			dp_cfg = 2;
+			break;
+		}
+		if (is_yuv)
+			dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG + offset, PANEL_RGB2YUV_EN, 0);
+		else
+			dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG + offset, 0, PANEL_RGB2YUV_EN);
+		dc_write(hw, DC_DISPLAY_DP_CONFIG + offset, dp_cfg | DP_SELECT);
+	}
+
+	if (hw->out[id] == OUT_DPI)
+		dc_set_clear(hw, DC_DISPLAY_DP_CONFIG + offset, 0, DP_SELECT);
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		dpi_cfg = 0;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		dpi_cfg = 3;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+		dpi_cfg = 4;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		dpi_cfg = 5;
+		break;
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+		dpi_cfg = 6;
+		break;
+	default:
+		dpi_cfg = 5;
+		break;
+	}
+	dc_write(hw, DC_DISPLAY_DPI_CONFIG + offset, dpi_cfg);
+
+	if (id == 0)
+		dc_set_clear(hw, DC_DISPLAY_PANEL_START, 0, PANEL0_EN | TWO_PANEL_EN);
+	else
+		dc_set_clear(hw, DC_DISPLAY_PANEL_START, 0, PANEL1_EN | TWO_PANEL_EN);
+
+	dc_write(hw, DC_DISPLAY_H + offset,
+		 H_ACTIVE_LEN(mode->hdisplay) |
+		 H_TOTAL_LEN(mode->htotal));
+
+	dc_write(hw, DC_DISPLAY_H_SYNC + offset,
+		 H_SYNC_START_LEN(mode->hsync_start) |
+		 H_SYNC_END_LEN(mode->hsync_end) |
+		 H_POLARITY_LEN(mode->flags & DRM_MODE_FLAG_PHSYNC ? 0 : 1) |
+		 H_PLUS_LEN(1));
+
+	dc_write(hw, DC_DISPLAY_V + offset,
+		 V_ACTIVE_LEN(mode->vdisplay) |
+		 V_TOTAL_LEN(mode->vtotal));
+
+	dc_write(hw, DC_DISPLAY_V_SYNC + offset,
+		 V_SYNC_START_LEN(mode->vsync_start) |
+		 V_SYNC_END_LEN(mode->vsync_end) |
+		 V_POLARITY_LEN(mode->flags & DRM_MODE_FLAG_PVSYNC ? 0 : 1) |
+		 V_PLUS_LEN(1));
+
+	dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG + offset, PANEL_OUTPUT_EN, 0);
+	dc_set_clear(hw, DC_DISPLAY_PANEL_START, BIT(id), SYNC_EN);
+}
+
+void dc_hw_disable(struct dc_hw *hw, int id)
+{
+	u32 offset = id << 2;
+
+	if (hw->out[id] == OUT_DPI)
+		dc_set_clear(hw, DC_DISPLAY_DP_CONFIG + offset, 0, DP_SELECT);
+	dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG + offset, 0, PANEL_OUTPUT_EN);
+	dc_set_clear(hw, DC_DISPLAY_PANEL_START, 0, BIT(id) | TWO_PANEL_EN);
+}
+
+void dc_hw_enable_interrupt(struct dc_hw *hw)
+{
+	hi_write(hw, AQ_INTR_ENBL, 0xFFFFFFFF);
+}
+
+void dc_hw_disable_interrupt(struct dc_hw *hw)
+{
+	hi_write(hw, AQ_INTR_ENBL, 0);
+}
+
+u32 dc_hw_get_interrupt(struct dc_hw *hw)
+{
+	return hi_read(hw, AQ_INTR_ACKNOWLEDGE);
+}
+
+void dc_hw_enable_shadow_register(struct vs_dc *dc, bool enable)
+{
+	u32 i, offset;
+	struct dc_hw *hw = &dc->hw;
+	u8 id, layer_num = hw->info->layer_num;
+	u8 panel_num = hw->info->panel_num;
+
+	for (i = 0; i < layer_num; i++) {
+		id = dc->planes[i].id;
+		offset = dc->planes[i].offset;
+		if (enable) {
+			if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1)
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX + offset,
+					     PRIMARY_SHADOW_EN, 0);
+			else
+				dc_set_clear(hw, DC_OVERLAY_CONFIG + offset,
+					     OVERLAY_SHADOW_EN, 0);
+		} else {
+			if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1)
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX + offset,
+					     0, PRIMARY_SHADOW_EN);
+			else
+				dc_set_clear(hw, DC_OVERLAY_CONFIG + offset,
+					     0, OVERLAY_SHADOW_EN);
+		}
+	}
+
+	for (i = 0; i < panel_num; i++) {
+		offset = i << 2;
+		if (enable)
+			dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG_EX + offset, 0, PANEL_SHADOW_EN);
+		else
+			dc_set_clear(hw, DC_DISPLAY_PANEL_CONFIG_EX + offset, PANEL_SHADOW_EN, 0);
+	}
+}
+
+void dc_hw_set_out(struct dc_hw *hw, enum dc_hw_out out, u8 id)
+{
+	if (out <= OUT_DP)
+		hw->out[id] = out;
+}
+
+static inline u8 to_vs_yuv_color_space(u32 color_space)
+{
+	u8 cs;
+
+	switch (color_space) {
+	case DRM_COLOR_YCBCR_BT601:
+		cs = COLOR_SPACE_601;
+		break;
+	case DRM_COLOR_YCBCR_BT709:
+		cs = COLOR_SPACE_709;
+		break;
+	case DRM_COLOR_YCBCR_BT2020:
+		cs = COLOR_SPACE_2020;
+		break;
+	default:
+		cs = COLOR_SPACE_601;
+		break;
+	}
+
+	return cs;
+}
+
+static inline u8 update_uv_swizzle(u32 format)
+{
+	u8 uv_swizzle = 0;
+
+	switch (format) {
+	case DRM_FORMAT_YVYU:
+	case DRM_FORMAT_VYUY:
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV61:
+		uv_swizzle = 1;
+		break;
+	default:
+		break;
+	}
+
+	return uv_swizzle;
+}
+
+static inline u8 update_swizzle(u32 format)
+{
+	u8 swizzle = SWIZZLE_ARGB;
+
+	switch (format) {
+	case DRM_FORMAT_RGBX4444:
+	case DRM_FORMAT_RGBA4444:
+	case DRM_FORMAT_RGBX5551:
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGBA1010102:
+		swizzle = SWIZZLE_RGBA;
+		break;
+	case DRM_FORMAT_XBGR4444:
+	case DRM_FORMAT_ABGR4444:
+	case DRM_FORMAT_XBGR1555:
+	case DRM_FORMAT_ABGR1555:
+	case DRM_FORMAT_BGR565:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_ABGR2101010:
+		swizzle = SWIZZLE_ABGR;
+		break;
+	case DRM_FORMAT_BGRX4444:
+	case DRM_FORMAT_BGRA4444:
+	case DRM_FORMAT_BGRX5551:
+	case DRM_FORMAT_BGRA5551:
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRA1010102:
+		swizzle = SWIZZLE_BGRA;
+		break;
+	default:
+		break;
+	}
+
+	return swizzle;
+}
+
+static inline u8 to_vs_rotation(unsigned int rotation)
+{
+	u8 rot;
+
+	switch (rotation & DRM_MODE_REFLECT_MASK) {
+	case DRM_MODE_REFLECT_X:
+		rot = FLIP_X;
+		return rot;
+	case DRM_MODE_REFLECT_Y:
+		rot = FLIP_Y;
+		return rot;
+	case DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y:
+		rot = FLIP_XY;
+		return rot;
+	default:
+		break;
+	}
+
+	switch (rotation & DRM_MODE_ROTATE_MASK) {
+	case DRM_MODE_ROTATE_0:
+		rot = ROT_0;
+		break;
+	case DRM_MODE_ROTATE_90:
+		rot = ROT_90;
+		break;
+	case DRM_MODE_ROTATE_180:
+		rot = ROT_180;
+		break;
+	case DRM_MODE_ROTATE_270:
+		rot = ROT_270;
+		break;
+	default:
+		rot = ROT_0;
+		break;
+	}
+
+	return rot;
+}
+
+void plane_hw_update_format_colorspace(struct vs_dc *dc, u32 format,
+				       enum drm_color_encoding encoding, u8 id, bool is_yuv)
+{
+	u32 offset = dc->planes[id].offset;
+	struct dc_hw *hw = &dc->hw;
+
+	if (is_yuv) {
+		if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1)
+			dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX + offset,
+				     PRIMARY_YUVCLAMP_EN, PRIMARY_RGB2RGB_EN);
+		else
+			dc_set_clear(hw, DC_OVERLAY_CONFIG + offset,
+				     OVERLAY_CLAMP_EN, OVERLAY_RGB2RGB_EN);
+
+		switch (to_vs_yuv_color_space(encoding)) {
+		case COLOR_SPACE_601:
+			load_yuv_to_rgb(hw, &hw->reg[id], offset, YUV601_2RGB);
+			break;
+		case COLOR_SPACE_709:
+			load_yuv_to_rgb(hw, &hw->reg[id], offset, YUV709_2RGB);
+			break;
+		case COLOR_SPACE_2020:
+			load_yuv_to_rgb(hw, &hw->reg[id], offset, YUV2020_2RGB);
+			break;
+		default:
+			break;
+		}
+	} else {
+		if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1)
+			dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX + offset,
+				     PRIMARY_RGB2RGB_EN, PRIMARY_YUVCLAMP_EN);
+		else
+			dc_set_clear(hw, DC_OVERLAY_CONFIG + offset,
+				     OVERLAY_RGB2RGB_EN, OVERLAY_CLAMP_EN);
+	}
+}
+
+void plane_hw_update_address(struct vs_dc *dc, u8 id, u32 format, dma_addr_t *dma_addr,
+			     struct drm_framebuffer *drm_fb, struct drm_rect *src)
+{
+	u32 offset = dc->planes[id].offset;
+	struct dc_hw *hw = &dc->hw;
+
+	dc_write(hw, hw->reg[id].y_address + offset, dma_addr[0]);
+	dc_write(hw, hw->reg[id].u_address + offset,
+		 format == DRM_FORMAT_YVU420 ?
+		 dma_addr[2] : dma_addr[1]);
+	dc_write(hw, hw->reg[id].v_address + offset,
+		 format == DRM_FORMAT_YVU420 ?
+		 dma_addr[1] : dma_addr[2]);
+	dc_write(hw, hw->reg[id].y_stride + offset, drm_fb->pitches[0]);
+	dc_write(hw, hw->reg[id].u_stride + offset,
+		 format == DRM_FORMAT_YVU420 ?
+		 drm_fb->pitches[2] : drm_fb->pitches[1]);
+	dc_write(hw, hw->reg[id].v_stride + offset,
+		 format == DRM_FORMAT_YVU420 ?
+		 drm_fb->pitches[1] : drm_fb->pitches[2]);
+	dc_write(hw, hw->reg[id].size + offset,
+		 FB_SIZE(drm_rect_width(src) >> 16, drm_rect_height(src) >> 16));
+}
+
+void plane_hw_update_format(struct vs_dc *dc, u32 format, enum drm_color_encoding encoding,
+			    unsigned int rotation, bool visible, unsigned int zpos,
+			    u8 id, u8 display_id)
+{
+	u32 offset = dc->planes[id].offset;
+	struct dc_hw *hw = &dc->hw;
+
+	if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1) {
+		dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG + offset,
+			     PRIMARY_FORMAT(update_vs_format(format)) |
+			     PRIMARY_UV_SWIZ(update_uv_swizzle(format)) |
+			     PRIMARY_SWIZ(update_swizzle(format)) |
+			     PRIMARY_TILE(DRM_FORMAT_MOD_LINEAR) |
+			     PRIMARY_YUV_COLOR(to_vs_yuv_color_space(encoding)) |
+			     PRIMARY_ROTATION(to_vs_rotation(rotation)),
+			     PRIMARY_FORMAT_MASK |
+			     PRIMARY_UV_SWIZ_MASK |
+			     PRIMARY_SWIZ_MASK |
+			     PRIMARY_TILE_MASK |
+			     PRIMARY_YUV_COLOR_MASK |
+			     PRIMARY_ROTATION_MASK |
+			     PRIMARY_CLEAR_EN_MASK);
+		dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX + offset,
+			     PRIMARY_DECODER_EN(false) |
+			     PRIMARY_EN(visible) |
+			     PRIMARY_ZPOS(zpos) |
+			     PRIMARY_CHANNEL(display_id),
+			     PRIMARY_DECODER_EN_EN_MASK |
+			     PRIMARY_EN_MASK |
+			     PRIMARY_ZPOS_MASK |
+			     PRIMARY_CHANNEL_MASK);
+	} else {
+		dc_set_clear(hw, DC_OVERLAY_CONFIG + offset,
+			     OVERLAY_FB_EN(visible) |
+			     OVERLAY_FORMAT(update_vs_format(format)) |
+			     OVERLAY_UV_SWIZ(update_uv_swizzle(format)) |
+			     OVERLAY_SWIZ(update_swizzle(format)) |
+			     OVERLAY_TILE(DRM_FORMAT_MOD_LINEAR) |
+			     OVERLAY_YUV_COLOR(to_vs_yuv_color_space(encoding)) |
+			     OVERLAY_ROTATION(to_vs_rotation(rotation)),
+			     OVERLAY_DEC_EN_MASK |
+			     OVERLAY_CLEAR_EN_MASK |
+			     OVERLAY_FB_EN_MASK |
+			     OVERLAY_FORMAT_MASK |
+			     OVERLAY_UV_SWIZ_MASK |
+			     OVERLAY_SWIZ_MASK |
+			     OVERLAY_TILE_MASK |
+			     OVERLAY_YUV_COLOR_MASK |
+			     OVERLAY_ROTATION_MASK);
+
+	 dc_set_clear(hw, DC_OVERLAY_CONFIG_EX + offset,
+		      OVERLAY_LAYER_SEL(zpos) |
+		      OVERLAY_PANEL_SEL(display_id),
+		      OVERLAY_LAYER_SEL_MASK |
+		      OVERLAY_PANEL_SEL_MASK);
+	}
+}
+
+static u32 calc_factor(u32 src, u32 dest)
+{
+	u32 factor = 1 << 16;
+
+	if (src > 1 && dest > 1)
+		factor = ((src - 1) << 16) / (dest - 1);
+
+	return factor;
+}
+
+void plane_hw_update_scale(struct vs_dc *dc, struct drm_rect *src, struct drm_rect *dst,
+			   u8 id, u8 display_id, unsigned int rotation)
+{
+	u32 offset = dc->planes[id].offset;
+	struct dc_hw *hw = &dc->hw;
+
+	int dst_w = drm_rect_width(dst);
+	int dst_h = drm_rect_height(dst);
+	int src_w, src_h, temp;
+	u32 scale_factor_x;
+	u32 scale_factor_y;
+	bool enable_scale = false;
+
+	src_w = drm_rect_width(src) >> 16;
+	src_h = drm_rect_height(src) >> 16;
+
+	if (drm_rotation_90_or_270(rotation)) {
+		temp = src_w;
+		src_w = src_h;
+		src_h = temp;
+	}
+
+	if (src_w != dst_w) {
+		scale_factor_x = calc_factor(src_w, dst_w);
+		enable_scale = true;
+	} else {
+		scale_factor_x = 1 << 16;
+	}
+	if (src_h != dst_h) {
+		scale_factor_y = calc_factor(src_h, dst_h);
+		enable_scale = true;
+	} else {
+		scale_factor_y = 1 << 16;
+	}
+	if (enable_scale) {
+		dc_write(hw, hw->reg[id].scale_factor_x + offset, scale_factor_x);
+		dc_write(hw, hw->reg[id].scale_factor_y + offset, scale_factor_y);
+		if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1)
+			dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG + offset, PRIMARY_SCALE_EN, 0);
+		else
+			dc_set_clear(hw, DC_OVERLAY_SCALE_CONFIG + offset, OVERLAY_SCALE_EN, 0);
+	} else {
+		if (id == PRIMARY_PLANE_0 || id == PRIMARY_PLANE_1)
+			dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG + offset, 0, PRIMARY_SCALE_EN);
+		else
+			dc_set_clear(hw, DC_OVERLAY_SCALE_CONFIG + offset, 0, OVERLAY_SCALE_EN);
+	}
+
+	dc_write(hw, hw->reg[id].top_left + offset, X_POS(dst->x1) | Y_POS(dst->y1));
+	dc_write(hw, hw->reg[id].bottom_right + offset, X_POS(dst->x2) | Y_POS(dst->y2));
+}
+
+void plane_hw_update_blend(struct vs_dc *dc, u16 alpha,
+			   u16 pixel_blend_mode, u8 id, u8 display_id)
+{
+	u32 offset = dc->planes[id].offset;
+	struct dc_hw *hw = &dc->hw;
+
+	dc_write(hw, hw->reg[id].src_global_color + offset, PRIMARY_ALPHA_LEN(alpha >> 8));
+	dc_write(hw, hw->reg[id].dst_global_color + offset, PRIMARY_ALPHA_LEN(alpha >> 8));
+	switch (pixel_blend_mode) {
+	case DRM_MODE_BLEND_PREMULTI:
+		dc_write(hw, hw->reg[id].blend_config + offset, BLEND_PREMULTI);
+		break;
+	case DRM_MODE_BLEND_COVERAGE:
+		dc_write(hw, hw->reg[id].blend_config + offset, BLEND_COVERAGE);
+		break;
+	case DRM_MODE_BLEND_PIXEL_NONE:
+		dc_write(hw, hw->reg[id].blend_config + offset, BLEND_PIXEL_NONE);
+		break;
+	default:
+		break;
+	}
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_dc_hw.h b/drivers/gpu/drm/verisilicon/vs_dc_hw.h
new file mode 100644
index 000000000000..63d8d153f57f
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc_hw.h
@@ -0,0 +1,493 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_DC_HW_H__
+#define __VS_DC_HW_H__
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <drm/drm_atomic.h>
+
+#include "vs_type.h"
+
+#define UPDATE(x, h, l)				FIELD_PREP(GENMASK(h, l), x)
+
+#define AQ_INTR_ACKNOWLEDGE			0x0010
+#define AQ_INTR_ENBL				0x0014
+#define DC_HW_REVISION				0x0024
+#define DC_HW_CHIP_CID				0x0030
+
+#define DC_REG_BASE				0x0800
+#define DC_REG_RANGE				0x2000
+#define DC_SEC_REG_OFFSET			0x100000
+
+#define DC_FRAMEBUFFER_CONFIG			0x1518
+# define PRIMARY_FORMAT(x)			((x) << 26)
+# define PRIMARY_FORMAT_MASK			GENMASK(31, 26)
+# define PRIMARY_UV_SWIZ(x)			((x) << 25)
+# define PRIMARY_UV_SWIZ_MASK			GENMASK(25, 25)
+# define PRIMARY_SWIZ(x)			((x) << 23)
+# define PRIMARY_SWIZ_MASK			GENMASK(24, 23)
+# define PRIMARY_SCALE_EN			BIT(12)
+# define PRIMARY_TILE(x)			((x) << 17)
+# define PRIMARY_TILE_MASK			GENMASK(21, 17)
+# define PRIMARY_YUV_COLOR(x)			((x) << 14)
+# define PRIMARY_YUV_COLOR_MASK			GENMASK(16, 14)
+# define PRIMARY_ROTATION(x)			((x) << 11)
+# define PRIMARY_ROTATION_MASK			GENMASK(13, 11)
+# define PRIMARY_CLEAR_EN(x)			((x) << 8)
+# define PRIMARY_CLEAR_EN_MASK			GENMASK(8, 8)
+
+#define DC_FRAMEBUFFER_CONFIG_EX		0x1CC0
+# define PRIMARY_CHANNEL(x)			((x) << 19)
+# define PRIMARY_CHANNEL_MASK			GENMASK(19, 19)
+# define PRIMARY_ZPOS(x)			((x) << 16)
+# define PRIMARY_ZPOS_MASK			GENMASK(18, 16)
+# define PRIMARY_EN(x)				((x) << 13)
+# define PRIMARY_EN_MASK			GENMASK(13, 13)
+# define PRIMARY_SHADOW_EN			BIT(12)
+# define PRIMARY_YUVCLAMP_EN			BIT(8)
+# define PRIMARY_RGB2RGB_EN			BIT(6)
+# define PRIMARY_SYNC1_EN			BIT(4)
+# define PRIMARY_SYNC0_EN			BIT(3)
+# define PRIMARY_DECODER_EN(x)			((x) << 1)
+# define PRIMARY_DECODER_EN_EN_MASK		GENMASK(1, 1)
+
+#define DC_FRAMEBUFFER_SCALE_CONFIG		0x1520
+#define DC_FRAMEBUFFER_TOP_LEFT			0x24D8
+#define X_POS(x)				(x)
+#define Y_POS(x)				((x) << 15)
+
+#define DC_FRAMEBUFFER_BOTTOM_RIGHT		0x24E0
+#define DC_FRAMEBUFFER_ADDRESS			0x1400
+#define DC_FRAMEBUFFER_U_ADDRESS		0x1530
+#define DC_FRAMEBUFFER_V_ADDRESS		0x1538
+#define DC_FRAMEBUFFER_STRIDE			0x1408
+#define DC_FRAMEBUFFER_U_STRIDE			0x1800
+#define DC_FRAMEBUFFER_V_STRIDE			0x1808
+#define DC_FRAMEBUFFER_SIZE			0x1810
+#define FB_SIZE(w, h)				((w) | ((h) << 15))
+
+#define DC_FRAMEBUFFER_SCALE_FACTOR_X		0x1828
+#define DC_FRAMEBUFFER_SCALE_FACTOR_Y		0x1830
+#define DC_FRAMEBUFFER_H_FILTER_COEF_INDEX	0x1838
+#define DC_FRAMEBUFFER_H_FILTER_COEF_DATA	0x1A00
+#define DC_FRAMEBUFFER_V_FILTER_COEF_INDEX	0x1A08
+#define DC_FRAMEBUFFER_V_FILTER_COEF_DATA	0x1A10
+#define DC_FRAMEBUFFER_INIT_OFFSET		0x1A20
+#define DC_FRAMEBUFFER_COLOR_KEY		0x1508
+#define DC_FRAMEBUFFER_COLOR_KEY_HIGH		0x1510
+#define DC_FRAMEBUFFER_CLEAR_VALUE		0x1A18
+#define DC_FRAMEBUFFER_COLOR_TABLE_INDEX	0x1818
+#define DC_FRAMEBUFFER_COLOR_TABLE_DATA		0x1820
+#define DC_FRAMEBUFFER_BG_COLOR			0x1528
+#define DC_FRAMEBUFFER_ROI_ORIGIN		0x1CB0
+#define DC_FRAMEBUFFER_ROI_SIZE			0x1CB8
+#define DC_FRAMEBUFFER_WATER_MARK		0x1CE8
+#define DC_FRAMEBUFFER_DEGAMMA_INDEX		0x1D88
+#define DC_FRAMEBUFFER_DEGAMMA_DATA		0x1D90
+#define DC_FRAMEBUFFER_DEGAMMA_EX_DATA		0x1D98
+#define DC_FRAMEBUFFER_YUVTORGB_COEF0		0x1DA0
+#define DC_FRAMEBUFFER_YUVTORGB_COEF1		0x1DA8
+#define DC_FRAMEBUFFER_YUVTORGB_COEF2		0x1DB0
+#define DC_FRAMEBUFFER_YUVTORGB_COEF3		0x1DB8
+#define DC_FRAMEBUFFER_YUVTORGB_COEF4		0x1E00
+#define DC_FRAMEBUFFER_YUVTORGB_COEFD0		0x1E08
+#define DC_FRAMEBUFFER_YUVTORGB_COEFD1		0x1E10
+#define DC_FRAMEBUFFER_YUVTORGB_COEFD2		0x1E18
+#define DC_FRAMEBUFFER_Y_CLAMP_BOUND		0x1E88
+#define DC_FRAMEBUFFER_UV_CLAMP_BOUND		0x1E90
+#define DC_FRAMEBUFFER_RGBTORGB_COEF0		0x1E20
+#define DC_FRAMEBUFFER_RGBTORGB_COEF1		0x1E28
+#define DC_FRAMEBUFFER_RGBTORGB_COEF2		0x1E30
+#define DC_FRAMEBUFFER_RGBTORGB_COEF3		0x1E38
+#define DC_FRAMEBUFFER_RGBTORGB_COEF4		0x1E40
+#define DC_FRAMEBUFFER_BLEND_CONFIG		0x2510
+# define BLEND_PREMULTI				0x3450
+# define BLEND_COVERAGE				0x3950
+# define BLEND_PIXEL_NONE			0x3548
+
+#define DC_FRAMEBUFFER_SRC_GLOBAL_COLOR		0x2500
+# define PRIMARY_ALPHA_LEN(x)			((x) << 24)
+
+#define DC_FRAMEBUFFER_DST_GLOBAL_COLOR		0x2508
+
+#define DC_OVERLAY_CONFIG			0x1540
+# define OVERLAY_SHADOW_EN			BIT(31)
+# define OVERLAY_CLAMP_EN			BIT(30)
+# define OVERLAY_RGB2RGB_EN			BIT(29)
+# define OVERLAY_DEC_EN(x)			((x) << 27)
+# define OVERLAY_DEC_EN_MASK			GENMASK(27, 27)
+# define OVERLAY_CLEAR_EN(x)			((x) << 25)
+# define OVERLAY_CLEAR_EN_MASK			GENMASK(25, 25)
+# define OVERLAY_FB_EN(x)			((x) << 24)
+# define OVERLAY_FB_EN_MASK			GENMASK(24, 24)
+# define OVERLAY_FORMAT(x)			((x) << 16)
+# define OVERLAY_FORMAT_MASK			GENMASK(21, 16)
+# define OVERLAY_UV_SWIZ(x)			((x) << 15)
+# define OVERLAY_UV_SWIZ_MASK			GENMASK(15, 15)
+# define OVERLAY_SWIZ(x)			((x) << 13)
+# define OVERLAY_SWIZ_MASK			GENMASK(14, 13)
+# define OVERLAY_TILE(x)			((x) << 8)
+# define OVERLAY_TILE_MASK			GENMASK(12, 8)
+# define OVERLAY_YUV_COLOR(x)			((x) << 5)
+# define OVERLAY_YUV_COLOR_MASK			GENMASK(7, 5)
+# define OVERLAY_ROTATION(x)			((x) << 2)
+# define OVERLAY_ROTATION_MASK			GENMASK(4, 2)
+
+#define DC_OVERLAY_CONFIG_EX			0x2540
+# define OVERLAY_LAYER_SEL(x)			((x) << 0)
+# define OVERLAY_LAYER_SEL_MASK			GENMASK(2, 0)
+# define OVERLAY_PANEL_SEL(x)			((x) << 3)
+# define OVERLAY_PANEL_SEL_MASK			GENMASK(3, 3)
+
+#define DC_OVERLAY_SCALE_CONFIG			0x1C00
+# define OVERLAY_SCALE_EN			BIT(8)
+
+#define DC_OVERLAY_BLEND_CONFIG			0x1580
+#define DC_OVERLAY_TOP_LEFT			0x1640
+#define DC_OVERLAY_BOTTOM_RIGHT			0x1680
+#define DC_OVERLAY_ADDRESS			0x15C0
+#define DC_OVERLAY_U_ADDRESS			0x1840
+#define DC_OVERLAY_V_ADDRESS			0x1880
+#define DC_OVERLAY_STRIDE			0x1600
+#define DC_OVERLAY_U_STRIDE			0x18C0
+#define DC_OVERLAY_V_STRIDE			0x1900
+#define DC_OVERLAY_SIZE				0x17C0
+#define DC_OVERLAY_SCALE_FACTOR_X		0x1A40
+#define DC_OVERLAY_SCALE_FACTOR_Y		0x1A80
+#define DC_OVERLAY_H_FILTER_COEF_INDEX		0x1AC0
+#define DC_OVERLAY_H_FILTER_COEF_DATA		0x1B00
+#define DC_OVERLAY_V_FILTER_COEF_INDEX		0x1B40
+#define DC_OVERLAY_V_FILTER_COEF_DATA		0x1B80
+#define DC_OVERLAY_INIT_OFFSET			0x1BC0
+#define DC_OVERLAY_COLOR_KEY			0x1740
+#define DC_OVERLAY_COLOR_KEY_HIGH		0x1780
+#define DC_OVERLAY_CLEAR_VALUE			0x1940
+#define DC_OVERLAY_COLOR_TABLE_INDEX		0x1980
+#define DC_OVERLAY_COLOR_TABLE_DATA		0x19C0
+#define DC_OVERLAY_SRC_GLOBAL_COLOR		0x16C0
+# define OVERLAY_ALPHA_LEN(x)			((x) << 24)
+
+#define DC_OVERLAY_DST_GLOBAL_COLOR		0x1700
+#define DC_OVERLAY_ROI_ORIGIN			0x1D00
+#define DC_OVERLAY_ROI_SIZE			0x1D40
+#define DC_OVERLAY_WATER_MARK			0x1DC0
+#define DC_OVERLAY_DEGAMMA_INDEX		0x2200
+#define DC_OVERLAY_DEGAMMA_DATA			0x2240
+#define DC_OVERLAY_DEGAMMA_EX_DATA		0x2280
+#define DC_OVERLAY_YUVTORGB_COEF0		0x1EC0
+#define DC_OVERLAY_YUVTORGB_COEF1		0x1F00
+#define DC_OVERLAY_YUVTORGB_COEF2		0x1F40
+#define DC_OVERLAY_YUVTORGB_COEF3		0x1F80
+#define DC_OVERLAY_YUVTORGB_COEF4		0x1FC0
+#define DC_OVERLAY_YUVTORGB_COEFD0		0x2000
+#define DC_OVERLAY_YUVTORGB_COEFD1		0x2040
+#define DC_OVERLAY_YUVTORGB_COEFD2		0x2080
+#define DC_OVERLAY_Y_CLAMP_BOUND		0x22C0
+#define DC_OVERLAY_UV_CLAMP_BOUND		0x2300
+#define DC_OVERLAY_RGBTORGB_COEF0		0x20C0
+#define DC_OVERLAY_RGBTORGB_COEF1		0x2100
+#define DC_OVERLAY_RGBTORGB_COEF2		0x2140
+#define DC_OVERLAY_RGBTORGB_COEF3		0x2180
+#define DC_OVERLAY_RGBTORGB_COEF4		0x21C0
+
+#define DC_CURSOR_CONFIG			0x1468
+# define CURSOR_HOT_X(x)			((x) << 16)
+# define CURSOR_HOT_X_MASK			GENMASK(23, 16)
+# define CURSOR_HOT_y(x)			((x) << 8)
+# define CURSOR_HOT_y_MASK			GENMASK(15, 8)
+# define CURSOR_SIZE(x)				((x) << 5)
+# define CURSOR_SIZE_MASK			GENMASK(7, 5)
+# define CURSOR_VALID(x)			((x) << 3)
+# define CURSOR_VALID_MASK			GENMASK(3, 3)
+# define CURSOR_TRIG_FETCH(x)			((x) << 2)
+# define CURSOR_TRIG_FETCH_MASK			GENMASK(2, 2)
+# define CURSOR_FORMAT(x)			((x) << 0)
+# define CURSOR_FORMAT_MASK			GENMASK(1, 0)
+# define CURSOR_FORMAT_DISABLE			0
+# define CURSOR_FORMAT_MARK			1
+# define CURSOR_FORMAT_A8R8G8B8			2
+
+#define DC_CURSOR_ADDRESS			0x146C
+#define DC_CURSOR_LOCATION			0x1470
+# define X_LCOTION(x)				(x)
+# define Y_LCOTION(x)				((x) << 16)
+
+#define DC_CURSOR_BACKGROUND			0x1474
+#define DC_CURSOR_FOREGROUND			0x1478
+#define DC_CURSOR_CLK_GATING			0x1484
+#define DC_CURSOR_CONFIG_EX			0x24E8
+#define DC_CURSOR_OFFSET			0x1080
+
+#define DC_DISPLAY_DITHER_CONFIG		0x1410
+#define DC_DISPLAY_PANEL_CONFIG			0x1418
+# define PANEL_RGB2YUV_EN			BIT(16)
+# define PANEL_GAMMA_EN				BIT(13)
+# define PANEL_OUTPUT_EN			BIT(12)
+
+#define DC_DISPLAY_PANEL_CONFIG_EX		0x2518
+# define PANEL_SHADOW_EN			BIT(0)
+
+#define DC_DISPLAY_DITHER_TABLE_LOW		0x1420
+#define DC_DISPLAY_DITHER_TABLE_HIGH		0x1428
+#define DC_DISPLAY_H				0x1430
+# define H_ACTIVE_LEN(x)			(x)
+# define H_TOTAL_LEN(x)				((x) << 16)
+
+#define DC_DISPLAY_H_SYNC			0x1438
+# define H_SYNC_START_LEN(x)			(x)
+# define H_SYNC_END_LEN(x)			((x) << 15)
+# define H_PLUS_LEN(x)				((x) << 30)
+# define H_POLARITY_LEN(x)			((x) << 31)
+
+#define DC_DISPLAY_V				0x1440
+# define V_ACTIVE_LEN(x)			(x)
+# define V_TOTAL_LEN(x)				((x) << 16)
+
+#define DC_DISPLAY_V_SYNC			0x1448
+# define V_SYNC_START_LEN(x)			(x)
+# define V_SYNC_END_LEN(x)			((x) << 15)
+# define V_PLUS_LEN(x)				((x) << 30)
+# define V_POLARITY_LEN(x)			((x) << 31)
+
+#define DC_DISPLAY_CURRENT_LOCATION		0x1450
+#define DC_DISPLAY_GAMMA_INDEX			0x1458
+#define DC_DISPLAY_GAMMA_DATA			0x1460
+#define DC_DISPLAY_INT				0x147C
+#define DC_DISPLAY_INT_ENABLE			0x1480
+#define DC_DISPLAY_DBI_CONFIG			0x1488
+#define DC_DISPLAY_GENERAL_CONFIG		0x14B0
+#define DC_DISPLAY_DPI_CONFIG			0x14B8
+#define DC_DISPLAY_PANEL_START			0x1CCC
+# define PANEL0_EN				BIT(0)
+# define PANEL1_EN				BIT(1)
+# define TWO_PANEL_EN				BIT(2)
+# define SYNC_EN				BIT(3)
+
+#define DC_DISPLAY_DEBUG_COUNTER_SELECT		0x14D0
+#define DC_DISPLAY_DEBUG_COUNTER_VALUE		0x14D8
+#define DC_DISPLAY_DP_CONFIG			0x1CD0
+# define DP_SELECT				BIT(3)
+
+#define DC_DISPLAY_GAMMA_EX_INDEX		0x1CF0
+#define DC_DISPLAY_GAMMA_EX_DATA		0x1CF8
+#define DC_DISPLAY_GAMMA_EX_ONE_DATA		0x1D80
+#define DC_DISPLAY_RGBTOYUV_COEF0		0x1E48
+#define DC_DISPLAY_RGBTOYUV_COEF1		0x1E50
+#define DC_DISPLAY_RGBTOYUV_COEF2		0x1E58
+#define DC_DISPLAY_RGBTOYUV_COEF3		0x1E60
+#define DC_DISPLAY_RGBTOYUV_COEF4		0x1E68
+#define DC_DISPLAY_RGBTOYUV_COEFD0		0x1E70
+#define DC_DISPLAY_RGBTOYUV_COEFD1		0x1E78
+#define DC_DISPLAY_RGBTOYUV_COEFD2		0x1E80
+
+#define DC_CLK_GATTING				0x1A28
+#define DC_QOS_CONFIG				0x1A38
+
+#define DC_TRANSPARENCY_OPAQUE			0x00
+#define DC_TRANSPARENCY_KEY			0x02
+#define DC_DISPLAY_DITHERTABLE_LOW		0x7B48F3C0
+#define DC_DISPLAY_DITHERTABLE_HIGH		0x596AD1E2
+
+#define DC_TILE_MODE4X4	0x15
+
+#define GAMMA_SIZE				256
+#define GAMMA_EX_SIZE				300
+#define DEGAMMA_SIZE				260
+
+#define RGB_TO_RGB_TABLE_SIZE			9
+#define YUV_TO_RGB_TABLE_SIZE			16
+#define RGB_TO_YUV_TABLE_SIZE			12
+
+#define DC_LAYER_NUM	6
+#define DC_DISPLAY_NUM	2
+#define DC_CURSOR_NUM	2
+
+enum dc_hw_plane_id {
+	PRIMARY_PLANE_0,
+	OVERLAY_PLANE_0,
+	OVERLAY_PLANE_1,
+	PRIMARY_PLANE_1,
+	OVERLAY_PLANE_2,
+	OVERLAY_PLANE_3,
+	CURSOR_PLANE_0,
+	CURSOR_PLANE_1,
+	PLANE_NUM
+};
+
+enum dc_hw_color_format {
+	FORMAT_X4R4G4B4,
+	FORMAT_A4R4G4B4,
+	FORMAT_X1R5G5B5,
+	FORMAT_A1R5G5B5,
+	FORMAT_R5G6B5,
+	FORMAT_X8R8G8B8,
+	FORMAT_A8R8G8B8,
+	FORMAT_YUY2,
+	FORMAT_UYVY,
+	FORMAT_INDEX8,
+	FORMAT_MONOCHROME,
+	FORMAT_YV12 = 0xf,
+	FORMAT_A8,
+	FORMAT_NV12,
+	FORMAT_NV16,
+	FORMAT_RG16,
+	FORMAT_R8,
+	FORMAT_NV12_10BIT,
+	FORMAT_A2R10G10B10,
+	FORMAT_NV16_10BIT,
+	FORMAT_INDEX1,
+	FORMAT_INDEX2,
+	FORMAT_INDEX4,
+	FORMAT_P010,
+	FORMAT_YUV444,
+	FORMAT_YUV444_10BIT,
+};
+
+enum dc_hw_yuv_color_space {
+	COLOR_SPACE_601 = 0,
+	COLOR_SPACE_709 = 1,
+	COLOR_SPACE_2020 = 3,
+};
+
+enum dc_hw_rotation {
+	ROT_0 = 0,
+	ROT_90 = 4,
+	ROT_180 = 5,
+	ROT_270 = 6,
+	FLIP_X = 1,
+	FLIP_Y = 2,
+	FLIP_XY = 3,
+};
+
+enum dc_hw_swizzle {
+	SWIZZLE_ARGB = 0,
+	SWIZZLE_RGBA,
+	SWIZZLE_ABGR,
+	SWIZZLE_BGRA,
+};
+
+enum dc_hw_out {
+	OUT_DPI,
+	OUT_DP,
+};
+
+enum dc_hw_cursor_size {
+	CURSOR_SIZE_32X32 = 0,
+	CURSOR_SIZE_64X64,
+};
+
+struct dc_hw_plane_reg {
+	u32 y_address;
+	u32 u_address;
+	u32 v_address;
+	u32 y_stride;
+	u32 u_stride;
+	u32 v_stride;
+	u32 size;
+	u32 top_left;
+	u32 bottom_right;
+	u32 scale_factor_x;
+	u32 scale_factor_y;
+	u32 h_filter_coef_index;
+	u32 h_filter_coef_data;
+	u32 v_filter_coef_index;
+	u32 v_filter_coef_data;
+	u32 init_offset;
+	u32 color_key;
+	u32 color_key_high;
+	u32 clear_value;
+	u32 color_table_index;
+	u32 color_table_data;
+	u32 scale_config;
+	u32 water_mark;
+	u32 degamma_index;
+	u32 degamma_data;
+	u32 degamma_ex_data;
+	u32 src_global_color;
+	u32 dst_global_color;
+	u32 blend_config;
+	u32 roi_origin;
+	u32 roi_size;
+	u32 yuv_to_rgb_coef0;
+	u32 yuv_to_rgb_coef1;
+	u32 yuv_to_rgb_coef2;
+	u32 yuv_to_rgb_coef3;
+	u32 yuv_to_rgb_coef4;
+	u32 yuv_to_rgb_coefd0;
+	u32 yuv_to_rgb_coefd1;
+	u32 yuv_to_rgb_coefd2;
+	u32 y_clamp_bound;
+	u32 uv_clamp_bound;
+	u32 rgb_to_rgb_coef0;
+	u32 rgb_to_rgb_coef1;
+	u32 rgb_to_rgb_coef2;
+	u32 rgb_to_rgb_coef3;
+	u32 rgb_to_rgb_coef4;
+};
+
+struct dc_hw_gamma {
+	u16 gamma[GAMMA_EX_SIZE][3];
+};
+
+struct dc_hw_read {
+	u32			reg;
+	u32			value;
+};
+
+struct dc_hw {
+	enum dc_hw_out		out[DC_DISPLAY_NUM];
+	void			*hi_base;
+	void			*reg_base;
+	struct dc_hw_plane_reg	reg[DC_LAYER_NUM];
+
+	struct dc_hw_gamma	gamma[DC_DISPLAY_NUM];
+	struct vs_dc_info	*info;
+};
+
+struct vs_dc_plane {
+	enum dc_hw_plane_id id;
+	u32 offset;
+};
+
+struct vs_dc {
+	struct vs_crtc		*crtc[DC_DISPLAY_NUM];
+	struct dc_hw		hw;
+
+	struct vs_dc_plane	planes[PLANE_NUM];
+};
+
+int dc_hw_init(struct vs_dc *dc);
+void dc_hw_disable_plane(struct vs_dc *dc, u8 id);
+void dc_hw_update_cursor(struct dc_hw *hw, u8 id, dma_addr_t dma_addr,
+			 u32 crtc_w, u32 crtc_x, u32 crtc_y,
+			 s32 hotspot_x, int32_t hotspot_y);
+void dc_hw_disable_cursor(struct dc_hw *hw, u8 id);
+void dc_hw_update_gamma(struct dc_hw *hw, u8 id, u16 index,
+			u16 r, u16 g, u16 b);
+void dc_hw_enable_gamma(struct dc_hw *hw, u8 id, bool enable);
+void dc_hw_enable(struct dc_hw *hw, int id, struct drm_display_mode *mode,
+		  u8 encoder_type, u32 output_fmt);
+void dc_hw_disable(struct dc_hw *hw, int id);
+void dc_hw_enable_interrupt(struct dc_hw *hw);
+void dc_hw_disable_interrupt(struct dc_hw *hw);
+u32 dc_hw_get_interrupt(struct dc_hw *hw);
+void dc_hw_enable_shadow_register(struct vs_dc *dc, bool enable);
+void dc_hw_set_out(struct dc_hw *hw, enum dc_hw_out out, u8 id);
+void dc_hw_commit(struct dc_hw *hw);
+void plane_hw_update_format_colorspace(struct vs_dc *dc, u32 format,
+				       enum drm_color_encoding encoding, u8 id, bool is_yuv);
+void plane_hw_update_address(struct vs_dc *dc, u8 id, u32 format, dma_addr_t *dma_addr,
+			     struct drm_framebuffer *drm_fb, struct drm_rect *src);
+void plane_hw_update_format(struct vs_dc *dc, u32 format, enum drm_color_encoding encoding,
+			    unsigned int rotation, bool visible, unsigned int zpos,
+			    u8 id, u8 display_id);
+void plane_hw_update_scale(struct vs_dc *dc, struct drm_rect *src, struct drm_rect *dst,
+			   u8 id, u8 display_id, unsigned int rotation);
+void plane_hw_update_blend(struct vs_dc *dc, u16 alpha, u16 pixel_blend_mode,
+			   u8 id, u8 display_id);
+
+#endif /* __VS_DC_HW_H__ */
diff --git a/drivers/gpu/drm/verisilicon/vs_type.h b/drivers/gpu/drm/verisilicon/vs_type.h
new file mode 100644
index 000000000000..30ccc2eda48b
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_type.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_TYPE_H__
+#define __VS_TYPE_H__
+
+#include <drm/drm_plane.h>
+
+struct vs_plane_primary_info {
+	u8 id;
+	unsigned int num_formats;
+	const u32 *formats;
+	u8 num_modifiers;
+	const u64 *modifiers;
+	unsigned int min_width;
+	unsigned int min_height;
+	unsigned int max_width;
+	unsigned int max_height;
+	unsigned int rotation;
+	unsigned int color_encoding;
+
+	int min_scale; /* 16.16 fixed point */
+	int max_scale; /* 16.16 fixed point */
+
+	u8	 zpos;
+
+};
+
+struct vs_plane_overlay_info {
+	u8 id;
+	unsigned int num_formats;
+	const u32 *formats;
+	u8 num_modifiers;
+	const u64 *modifiers;
+	unsigned int min_width;
+	unsigned int min_height;
+	unsigned int max_width;
+	unsigned int max_height;
+	unsigned int rotation;
+	unsigned int color_encoding;
+
+	int min_scale; /* 16.16 fixed point */
+	int max_scale; /* 16.16 fixed point */
+
+	u8	 zpos;
+
+};
+
+struct vs_plane_cursor_info {
+	u8 id;
+	unsigned int num_formats;
+	const u32 *formats;
+	unsigned int min_width;
+	unsigned int min_height;
+	unsigned int max_width;
+	unsigned int max_height;
+	u8	 zpos;
+
+};
+
+struct vs_dc_info {
+	const char *name;
+
+	u8 panel_num;
+
+	/* planes */
+	u8 layer_num;
+	u8 primary_num;
+	u8 overlay_num;
+	u8 cursor_num;
+	const struct vs_plane_primary_info *primary;
+	const struct vs_plane_overlay_info *overlay;
+	const struct vs_plane_cursor_info *cursor;
+
+	/* 0 means no gamma LUT */
+	u16 gamma_size;
+	u8 gamma_bits;
+
+	u16 pitch_alignment;
+};
+
+#endif /* __VS_TYPE_H__ */
-- 
2.27.0

