Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B479BE031
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 09:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B6010E675;
	Wed,  6 Nov 2024 08:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=thalesgroup.com header.i=@thalesgroup.com header.b="aRNhYknY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Tue, 05 Nov 2024 14:44:38 UTC
Received: from esa.hc1631-21.eu.iphmx.com (esa.hc1631-21.eu.iphmx.com
 [23.90.122.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364CA10E5C0;
 Tue,  5 Nov 2024 14:44:38 +0000 (UTC)
X-CSE-ConnectionGUID: Vq02H0HXRLq7ZZzlilO7wA==
X-CSE-MsgGUID: MEilz9DuT0eaTuihfmGHxA==
Authentication-Results: ob1.hc1631-21.eu.iphmx.com;
 dkim=pass (signature verified)
 header.i=@thalesgroup.com
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="21627455"
X-IronPort-AV: E=Sophos;i="6.10,215,1719871200"; d="scan'208";a="21627455"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thalesgroup.com; i=@thalesgroup.com; s=bbmfo20230504;
 t=1730817448; h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=o9Vc5ob2XHcxtObi7LqU5Blt1DnixNEvcsEGSma0b9s=;
 b=aRNhYknYPOD3sgaqivT6XFdeZPAHTO6tsJ6O8vXCC0ERGwcxu3qQfZ4W
 fNTBq6ds2arMl8TyOqYq+6y7atS8R4eAUQPQ1mp+O1QMlQ64WA+3hZU5j
 T8CujKGqZs8YjHEQSvOwsiqRzw/EL8ruPunnvKxq0mn2FFpBgmyIBfFYS
 yjMBWbocQraHvI7+cEu6xfvHiNhIhX7mK0hPzBYCrLb/N/5a/i0LGvp3x
 eA7jbzwRXyHpVitjGZb2/u3lDGCLMnNyetYyh02xW5gworxfaXGlFUio5
 wFtpTe1GCcr9beaG1nf237vXLVcMw70pZe+6bDqwgX+BsiGfUnt1MRGod Q==;
X-CSE-ConnectionGUID: NpaAbpEEQfKN9Cfjfv13MQ==
X-CSE-MsgGUID: AzbzTHI8TmKWilH2n4Zeng==
X-CSE-ConnectionGUID: jZ31JfBtQsi7KpjpS38rQQ==
X-CSE-MsgGUID: lV6Tz9o0Rj2ASal+F0ozYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33983816"
X-IronPort-AV: E=Sophos;i="6.11,260,1725314400"; d="scan'208";a="33983816"
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
Subject: [PATCH] drm/etnaviv: add optional reset support
Thread-Topic: [PATCH] drm/etnaviv: add optional reset support
Thread-Index: AdsvjVFvm5nmXEwsR6+Q63EAaSdekw==
Date: Tue, 5 Nov 2024 14:37:26 +0000
Message-ID: <0825fa6ad3954cda970b42c25b45fb0d@thalesgroup.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-nodisclaimer: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 06 Nov 2024 08:18:14 +0000
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

Signed-off-by: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>
Reviewed-by: LENAIN Simon <simon.lenain@thalesgroup.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 29 +++++++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnavi=
v/etnaviv_gpu.c
index 7c7f97793ddd..f698fec50343 100644
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
@@ -13,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/thermal.h>
=20
 #include "etnaviv_cmdbuf.h"
@@ -1629,8 +1631,24 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gpu=
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
@@ -1643,6 +1661,8 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gpu =
*gpu)
=20
 static int etnaviv_gpu_clk_disable(struct etnaviv_gpu *gpu)
 {
+	disable_irq(gpu->irq);
+	reset_control_assert(gpu->rst);
 	clk_disable_unprepare(gpu->clk_shader);
 	clk_disable_unprepare(gpu->clk_core);
 	clk_disable_unprepare(gpu->clk_bus);
@@ -1876,6 +1896,9 @@ static int etnaviv_gpu_platform_probe(struct platform=
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
@@ -1883,6 +1906,12 @@ static int etnaviv_gpu_platform_probe(struct platfor=
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

