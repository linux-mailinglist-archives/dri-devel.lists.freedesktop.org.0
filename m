Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B2F9C2227
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B7810EA12;
	Fri,  8 Nov 2024 16:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=thalesgroup.com header.i=@thalesgroup.com header.b="LBvUxVwv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc1631-21.eu.iphmx.com (esa.hc1631-21.eu.iphmx.com
 [23.90.122.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8C310E9BD;
 Fri,  8 Nov 2024 14:00:22 +0000 (UTC)
X-CSE-ConnectionGUID: fExaHpHaRq6KMv4OzF8QUw==
X-CSE-MsgGUID: irzIaqunS/ieGEssPbc27w==
Authentication-Results: ob1.hc1631-21.eu.iphmx.com;
 dkim=pass (signature verified)
 header.i=@thalesgroup.com
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="21903967"
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; d="scan'208";a="21903967"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thalesgroup.com; i=@thalesgroup.com; s=bbmfo20230504;
 t=1731074421; h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=EE9tBFBFd3mh1SD7uzfbGKLYqBxfml1THD7ynL3J6gg=;
 b=LBvUxVwvUrHzPYjHZ+fCEcCSjH9tSKCORkN/cB9SBIoC0Ih0z8R/e2+y
 1O0DPk/cJGXGcMQri3i2F72vC0jkgQPtxphhIbyN6nES1d3fHnJ3+Yo1v
 hdOILknkR70TpwFx8eE1W6BTM39vMHjRJCVGiEFN+FR64jetWwSMFxtg/
 5X/6+zPrHUryhkHBHC2xA/fl74CoZ9ZCzwqa77EnoPhSS0eop/VV+56WF
 mdGf/8XQa/IGeu3YZxe86XmqZPeEZlvcWRSzWY86MiimNfnfd3mbTNvr+
 9JDmhmMKINCxmfMb/6obZehbpk8rlyiHgahEu2gdXd47k2MumbtZw6WAt w==;
X-CSE-ConnectionGUID: 25JRx62TQR+14TWRMaizJw==
X-CSE-MsgGUID: KUEoTu7URxS3mNoEqANzhQ==
X-CSE-ConnectionGUID: B2LIapG6QcW74amwA6yqsg==
X-CSE-MsgGUID: yAeelpCZSymhiU6uXUOSYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34531874"
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; d="scan'208";a="34531874"
From: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>
To: Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, LENAIN Simon
 <simon.lenain@thalesgroup.com>, BARBEAU Etienne
 <etienne.barbeau@thalesgroup.com>, LEJEUNE Sebastien
 <sebastien.lejeune@thalesgroup.com>
Subject: [PATCH v2] drm/etnaviv: add optional reset support
Thread-Topic: [PATCH v2] drm/etnaviv: add optional reset support
Thread-Index: Adsx5YIJONFfGHrTSZ2tfemyyzgnnQ==
Date: Fri, 8 Nov 2024 14:00:03 +0000
Message-ID: <dc139d10a4184d289c9ffd1d308c0db1@thalesgroup.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-nodisclaimer: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2024 16:33:34 +0000
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

Add optional reset support which is mentioned in vivante,gc.yaml to
allow the driver to work on SoCs whose reset signal is asserted by default
Avoid enabling the interrupt until everything is ready

Signed-off-by: Philippe Lecointre <philippe.lecointre@thalesgroup.com>
Reviewed-by: Simon Lenain <simon.lenain@thalesgroup.com>
---
v2:
- Add missing include of irq.h
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 30 +++++++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnavi=
v/etnaviv_gpu.c
index 7c7f97793ddd..3e0c5dd9f74b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2015-2018 Etnaviv Project
+ * Copyright (C) 2024 Thales
  */
=20
 #include <linux/clk.h>
@@ -8,11 +9,13 @@
 #include <linux/delay.h>
 #include <linux/dma-fence.h>
 #include <linux/dma-mapping.h>
+#include <linux/irq.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/thermal.h>
=20
 #include "etnaviv_cmdbuf.h"
@@ -1629,8 +1632,24 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gpu=
 *gpu)
 	if (ret)
 		goto disable_clk_core;
=20
+	/* 32 core clock cycles (slowest clock) required before deassertion. */
+	/* 1 microsecond might match all implementations */
+	usleep_range(1, 2);
+
+	ret =3D reset_control_deassert(gpu->rst);
+	if (ret)
+		goto disable_clk_shader;
+
+	/* 128 core clock cycles (slowest clock) required before any activity on =
AHB. */
+	/* 1 microsecond might match all implementations */
+	usleep_range(1, 2);
+
+	enable_irq(gpu->irq);
+
 	return 0;
=20
+disable_clk_shader:
+	clk_disable_unprepare(gpu->clk_shader);
 disable_clk_core:
 	clk_disable_unprepare(gpu->clk_core);
 disable_clk_bus:
@@ -1643,6 +1662,8 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gpu =
*gpu)
=20
 static int etnaviv_gpu_clk_disable(struct etnaviv_gpu *gpu)
 {
+	disable_irq(gpu->irq);
+	reset_control_assert(gpu->rst);
 	clk_disable_unprepare(gpu->clk_shader);
 	clk_disable_unprepare(gpu->clk_core);
 	clk_disable_unprepare(gpu->clk_bus);
@@ -1876,6 +1897,9 @@ static int etnaviv_gpu_platform_probe(struct platform=
_device *pdev)
 	if (gpu->irq < 0)
 		return gpu->irq;
=20
+	/* Avoid enabling the interrupt until everything is ready */
+	irq_set_status_flags(gpu->irq, IRQ_NOAUTOEN);
+
 	err =3D devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
 			       dev_name(gpu->dev), gpu);
 	if (err) {
@@ -1883,6 +1907,12 @@ static int etnaviv_gpu_platform_probe(struct platfor=
m_device *pdev)
 		return err;
 	}
=20
+	/* Get Reset: */
+	gpu->rst =3D devm_reset_control_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(gpu->rst))
+		return dev_err_probe(dev, PTR_ERR(gpu->rst),
+				     "failed to get reset\n");
+
 	/* Get Clocks: */
 	gpu->clk_reg =3D devm_clk_get_optional(&pdev->dev, "reg");
 	DBG("clk_reg: %p", gpu->clk_reg);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnavi=
v/etnaviv_gpu.h
index 31322195b9e4..8c181191755e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2015-2018 Etnaviv Project
+ * Copyright (C) 2024 Thales
  */
=20
 #ifndef __ETNAVIV_GPU_H__
@@ -157,6 +158,7 @@ struct etnaviv_gpu {
 	struct clk *clk_reg;
 	struct clk *clk_core;
 	struct clk *clk_shader;
+	struct reset_control *rst;
=20
 	unsigned int freq_scale;
 	unsigned int fe_waitcycles;
--=20
2.19.1

