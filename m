Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C231A9D3397
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 07:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F6410E395;
	Wed, 20 Nov 2024 06:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2123.outbound.protection.partner.outlook.cn [139.219.17.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0260510E080
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 06:34:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9pzfPbScqWFzuFGLrnA5BE+Ziw7caqKqK6plYhlSkOcSu9UjyPomZ4dzDgoPoBym2SHz8gjOxQJGnvpKZNFDpQqrOYemBPLr8XRr1bEUvWcTJSTkH7lfCZlWNYlL9mim9f2DqUymFu+Hv304sryI58IVyMbMMK6Z4yEsc/uJ7Yo78V1I3SXptLRuoyZBWgn14psRKtEinc/kjVOldewWRtQHKkUTueKYxTJs/VPa0wzVmS538UqcIiqCXE4nLC5Q6Lz0cIpM5MnT71uZffa5BuNJ0DCxfBJ0yxkCV1qxfjtoROX9GvmlDKc5NCSA/SFtYHQmm/skSx1j7x/7VWZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCu+KQx1TPSXiLQGRz2tY7lkBV//tFOnquO+eTJYlhE=;
 b=ADSGeqE0PyPVxf/xmQGavqE7X3xzARZ31QR0xxH7AMuFevJY2CpLrlH4ypvEBPS68fTaR+dzb3Diu9kZZb1UNKpRhgi6AZC29rW9iq/gpGB2hV7yci8pz8ma/nfon6cJG/rkkswFC/cJYnPGYbCpRS+BoLNT0v/3D7KzzQ/Um/jotm03U6W4cFvTwWX+3XWqs7zgt+T0yMSyDewe+xUu79gmNz6VUF+ARcrc+ei39r7JzWuXnsLHHmseBT+6V/LAAHzBDB1OdcrVKNh3ZIdec03BredM1JZY1yK02PVuxqw5yxsDRiUlpdwHFpEIKjO1itzmZ0k1yVNuKQH4K3mIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6) by NTZPR01MB1100.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 06:20:28 +0000
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 ([fe80::512d:38d7:ed9f:dfbe]) by
 NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn ([fe80::512d:38d7:ed9f:dfbe%4])
 with mapi id 15.20.8158.023; Wed, 20 Nov 2024 06:20:27 +0000
From: keith zhao <keith.zhao@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 william.qiu@starfivetech.com, xingyu.wu@starfivetech.com, kernel@esmil.dk,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
 keith.zhao@starfivetech.com, jack.zhu@starfivetech.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/9] drm/vs: Add Base API for VS Mode Configuration
Date: Wed, 20 Nov 2024 14:18:44 +0800
Message-Id: <20241120061848.196754-6-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120061848.196754-1-keith.zhao@starfivetech.com>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0059.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::26) To NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB1050:EE_|NTZPR01MB1100:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f877aa-58f3-468e-f678-08dd092b6cf0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|41320700013|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: xSiR5e9f8yRkoX9Z9sf9WuGrmch89SfVjz892QEWqeAqJiidrUTPlSRFPS2I5E8HF7k0uUvY68vwayml0bLiYr4sTGNuCRlZ4VXxeqfodMFNklIkkMHA3bnMnR3lPvAkKmlhLJcEEzhnOLaMsgTxJQCO6VY3GAGtwxtytQmVphxgUhrgWxI6LdUX5UjDUOHKa/wMyVBWDMtd25jQSkKqu7hoL9WwhlNdpxWGl2t56eTabTxvP9ssE0ZvLXNyssOn6jvGIEbYM8bu7nXk2juAF3JMso188jJtNv/72Tnc8gLm8W9VA7Pmhrc5ulNP3bbNOvUjm5bzRRyhVFc5RSAGoJxP4GVbpAMLY9Xdsr6KTtpZhuwDXGQPI3UzZVSRdVfNxymHkY1WVfZj9A3IYbvZ0lyy90L5J1M7xd8hoCFXIUMjKd/ElkYcBeZR3jsqTeS0SOskbA9XAXzRQzZMYxtvHXxSBrNidgQzRn06J9c/6CNc5/ESl9z2y5LCswK312cwRi0MvElEtQl4LIvhxwuAP99bnV8RlzboA8yq18Y+YDvX9M9TQQ3X3VoeI1ex97UvL98gXYFAGty1Vdy6UwUpZgu7RLkqlAYb9zmftvwp4krim4o0YtO20F8IMxm/x527
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(41320700013)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5xj0nxzFcqXfwO1dOgEggzEU07R5kl9U9849UAFJl0Znhu6a3td2y5HWrVck?=
 =?us-ascii?Q?T0R5EO/GyP+9zNf5ozv2/WT1b6m8vEvX0ztwoVRM3k4bVYt8E6eSFTf+P1c3?=
 =?us-ascii?Q?kO9QTTX5x56xbjlPCo2DCJxGiendMu5EvfH9u/otEDOCd8FkiHZxPXvwKLRj?=
 =?us-ascii?Q?J0Wa6SFW6IZFS8p1s8sA+lGOmz9hQnnt/bQigpzihXvzHy14X9hOCTTg0Eb8?=
 =?us-ascii?Q?okYhiVcJmFO+4X53hjaTmERjvtseLdqD6e07pFG/oBNCsYhmshjfHTX44zN5?=
 =?us-ascii?Q?PisQ/lU2hzckRLEsN5wGo65bcI9OWjWJqawcBFoBgunQfDXsrfo0jqTBdtTQ?=
 =?us-ascii?Q?Ih+GUHkLBrzOVyK/N+DZAbrGKWtU8uzwpPahgUoohGzRCpawXJZ+ZJ7tS1px?=
 =?us-ascii?Q?lFon/TTfGZ4Zu+m7ooit1BVcNBsZZ9WIAAEi4xdJSeseGLkHpJwqXmkoPOB7?=
 =?us-ascii?Q?BoKrxRGMviW6LuQEHr68wyVhpU2iL2ZEXn1lI+JGeyrCpTMymSxITol1TWmW?=
 =?us-ascii?Q?Gwi17KG5aFx+OQnxCS+41YI8dTLaiN1TzkIMDIiDsfeKZDApCAccYacN7zMW?=
 =?us-ascii?Q?1i+mLysM1Kwgu40wkdsXlRqgNKccEYGpfNTi7HQ1bd9hZsqVqo0dSLMBNCgB?=
 =?us-ascii?Q?yvK/Jzrs/wb2axptBWsDdau2UJMG4fVY836wcjvGICQBHU7BrQKJRHo8kssu?=
 =?us-ascii?Q?gHJ/zmfxCGMziJATZcCvGxoOSPCyokf2F14L5k3yuQ9Bs48YotCi4ajXmbED?=
 =?us-ascii?Q?gIIG1EbCp3n1pw/Yz28Z9tTDvr8vWcpzK5bOsCtGemdAVNF4GDCS7FuNPrf0?=
 =?us-ascii?Q?i4Md3qjNr8+3grSWfp7cblif7QEJfE8Xtw+JrLwQj3FmmAkvlp9OVZcqaKWG?=
 =?us-ascii?Q?2WZ+ERG2w0PcyD63Esd34cHrU2D62CMpmYVtWRu6LeDoafiglAJkDoQ6V0UB?=
 =?us-ascii?Q?ncHv4sjwE1L4gOM+qKD8ncI8eOf/HXnY9p5eFGpycRWquVaijtZaacjsdg8M?=
 =?us-ascii?Q?nQR/w8yRJfwIwK9CQlHz3NhifeGLun+Wt1O7yJ1jesESqLTlO+WwekdTMDNO?=
 =?us-ascii?Q?mG5tq/6FXgjeSXhoqNpkyke71I2yqpPjXSXjn0w5hqwcI0V/2/gc/Wm+40WJ?=
 =?us-ascii?Q?HcIGMsuVESZabocNeTx1IpvCpA+QF7OXtxlDl3eQ31o80DQmrApWcjF//8bC?=
 =?us-ascii?Q?C1Ujzzb4IGmHm5uRKIxd0Y2se2judRgxJTpZx141jUq4ww5YimgMydOlgWTj?=
 =?us-ascii?Q?rtaXNR/ukSFGYsJ25+ikU8D1jYSDnthJBv5DC8Lc+Ji+Ypge4ufFNAMGVyKP?=
 =?us-ascii?Q?P7jmIhHTuuRJXN2ZhFv28yFALKM+HUjonHw3TqldaORGo4KL0wJ9+qEtMhkL?=
 =?us-ascii?Q?gwEKmmp/GFppsqKQMdnJZGqN0alq6NlIG46Fp6YJPB/xAL/baklV0NgfkD9n?=
 =?us-ascii?Q?o4qFnUFf8p360lObcBUsfvWL7XSVwgZLxqgXwfVsYqxrDlvBUWOvXvVovIjd?=
 =?us-ascii?Q?oYnvteo6xz+/OxEi0IuLnxkgq/SLTRkIjah88LBKE4OHz+HDO5shkYf8Ih5x?=
 =?us-ascii?Q?GkaWt6X92VawUbBwt8A75sXr4UO9U0C+Kp9koGuhNtENsTdqD2rSiHWnieVu?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f877aa-58f3-468e-f678-08dd092b6cf0
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 06:20:27.4107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjffdVfBlNtpbirTUyREcfOQS28VohGVcGpJYS/VUH+kDm1pWPOa1xMJtybPTiDOrABvFR2dpqJwHGuP0E/eFhQ7JRPMzIG7QqnR2LrtAIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1100
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

This commit adds a base API for configuring VS modes,
which will streamline the setup and management of display modes
in the VS DRM subsystem.

In this implementation, we are using drm_atomic_helper_commit_tail_rpm()
instead of drm_atomic_helper_commit_tail() to ensure that
we skip planes related to inactive CRTCs.

This helps to optimize the commit process and reduces unnecessary overhead
when dealing with inactive display resources.

Signed-off-by: keith zhao <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile     |  3 ++-
 drivers/gpu/drm/verisilicon/vs_modeset.c | 31 ++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_modeset.h | 10 ++++++++
 3 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 7da54b259940..842867dad4cb 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-vs_drm-objs := vs_dc_hw.o
+vs_drm-objs := vs_dc_hw.o \
+	       vs_modeset.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/vs_modeset.c b/drivers/gpu/drm/verisilicon/vs_modeset.c
new file mode 100644
index 000000000000..0873a3465143
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_modeset.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) VeriSilicon Holdings Co., Ltd.
+ */
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+
+#include "vs_modeset.h"
+
+static const struct drm_mode_config_funcs vs_mode_config_funcs = {
+	.fb_create			 = drm_gem_fb_create,
+	.atomic_check		 = drm_atomic_helper_check,
+	.atomic_commit		 = drm_atomic_helper_commit,
+};
+
+static struct drm_mode_config_helper_funcs vs_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
+void vs_mode_config_init(struct drm_device *dev)
+{
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return;
+
+	dev->mode_config.funcs = &vs_mode_config_funcs;
+	dev->mode_config.helper_private = &vs_mode_config_helpers;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_modeset.h b/drivers/gpu/drm/verisilicon/vs_modeset.h
new file mode 100644
index 000000000000..bd04f81d2ad2
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_modeset.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_MODESET_H__
+#define __VS_MODESET_H__
+
+void vs_mode_config_init(struct drm_device *dev);
+#endif /* __VS_FB_H__ */
-- 
2.34.1

