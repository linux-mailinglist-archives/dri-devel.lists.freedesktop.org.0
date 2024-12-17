Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FA79F5FFE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 09:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B038310EAE1;
	Wed, 18 Dec 2024 08:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=thalesgroup.com header.i=@thalesgroup.com header.b="GUpTgMck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc1631-21.eu.iphmx.com (esa.hc1631-21.eu.iphmx.com
 [23.90.123.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E16A10E211;
 Tue, 17 Dec 2024 11:36:15 +0000 (UTC)
X-CSE-ConnectionGUID: SJ/OOKH7Qpmpn++a6GiS8A==
X-CSE-MsgGUID: gQ6vE3HJS2e002ayTYNp1A==
Authentication-Results: ob1.hc1631-21.eu.iphmx.com;
 dkim=pass (signature verified)
 header.i=@thalesgroup.com
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="25129903"
X-IronPort-AV: E=Sophos;i="6.12,241,1728943200"; d="scan'208";a="25129903"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thalesgroup.com; i=@thalesgroup.com; s=bbmfo20230504;
 t=1734435373; h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=TD5JtJ2CP9uixpsc/oDUrpMauClPo34I9Wrt3XUOczw=;
 b=GUpTgMckTYH4IazAUpRsiPtjvDwwgGVK2wIf9qo1OlGc+7xq1lEb4hxl
 MAklz1hjXi8iZcAdd7MrIw/aUsjedGmGuNotQ1VoPHlYSk3Hd4acMj9/M
 JLVWFs19pAZ/Awn79lzJySw5fyC+pl+TNfODhxndlhM8DQjMH5s7pUuLr
 u4v8WAhufV6iuLI6JAUX1HSOlbYTJI1BAtpE5QlKdP0MKkdSlruEyn2Fc
 6la+kCw7gQ9eTBYZ9KtPIY1o6JaFm59xwnSTq4M62WDGcsHGv5Opq1hUE
 HP0X8o+rSNZ9bbBIRA8T0a3wQzbYY1wd421u4hUrTeNQva7t2b4QZP917 A==;
X-CSE-ConnectionGUID: 8E5OR/n3Tim3T20hqXeytw==
X-CSE-MsgGUID: M5qaJL3sS52hnV0qp6Gszg==
X-CSE-ConnectionGUID: /bhLdXNKTBG1cwQzZZTApg==
X-CSE-MsgGUID: gGjcmQmfQiWgACfXvEJgMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="37641209"
X-IronPort-AV: E=Sophos;i="6.12,241,1728943200"; d="scan'208";a="37641209"
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
Subject: [PATCH v4] drm/etnaviv: add optional reset support
Thread-Topic: [PATCH v4] drm/etnaviv: add optional reset support
Thread-Index: AdtQdTRCCPdja+p8TdeGkYsfNshIoA==
Date: Tue, 17 Dec 2024 11:36:11 +0000
Message-ID: <a0b07a6b542d47339584f05c45951b9d@thalesgroup.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-nodisclaimer: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Dec 2024 08:18:11 +0000
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

Signed-off-by: Philippe Lecointre <philippe.lecointre@thalesgroup.com>
Acked-by: Simon Lenain <simon.lenain@thalesgroup.com>
---
v4:
- Rework to match feedback
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 41 +++++++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnavi=
v/etnaviv_gpu.c
index 2d4c112ce033..cf0d9049bcf1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/thermal.h>
=20
 #include "etnaviv_cmdbuf.h"
@@ -172,6 +173,29 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32=
 param, u64 *value)
 	return 0;
 }
=20
+static int etnaviv_gpu_reset_deassert(struct etnaviv_gpu *gpu)
+{
+	int ret;
+
+	/*
+	 * 32 core clock cycles (slowest clock) required before deassertion
+	 * 1 microsecond might match all implementations without computation
+	 */
+	usleep_range(1, 2);
+
+	ret =3D reset_control_deassert(gpu->rst);
+	if (ret)
+		return ret;
+
+	/*
+	 * 128 core clock cycles (slowest clock) required before any activity on =
AHB
+	 * 1 microsecond might match all implementations without computation
+	 */
+	usleep_range(1, 2);
+
+	return 0;
+}
+
 static inline bool etnaviv_is_model_rev(struct etnaviv_gpu *gpu, u32 model=
, u32 revision)
 {
 	return gpu->identity.model =3D=3D model &&
@@ -799,6 +823,12 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 		goto pm_put;
 	}
=20
+	ret =3D etnaviv_gpu_reset_deassert(gpu);
+	if (ret) {
+		dev_err(gpu->dev, "GPU reset deassert failed\n");
+		goto fail;
+	}
+
 	etnaviv_hw_identify(gpu);
=20
 	if (gpu->identity.model =3D=3D 0) {
@@ -1860,6 +1890,17 @@ static int etnaviv_gpu_platform_probe(struct platfor=
m_device *pdev)
 	if (IS_ERR(gpu->mmio))
 		return PTR_ERR(gpu->mmio);
=20
+
+	/* Get Reset: */
+	gpu->rst =3D devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(gpu->rst))
+		return dev_err_probe(dev, PTR_ERR(gpu->rst),
+				     "failed to get reset\n");
+
+	err =3D reset_control_assert(gpu->rst);
+	if (err)
+		return dev_err_probe(dev, err, "failed to assert reset\n");
+
 	/* Get Interrupt: */
 	gpu->irq =3D platform_get_irq(pdev, 0);
 	if (gpu->irq < 0)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnavi=
v/etnaviv_gpu.h
index 4d8a7d48ade3..5cb46c84e03a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -93,6 +93,7 @@ struct etnaviv_event {
 struct etnaviv_cmdbuf_suballoc;
 struct regulator;
 struct clk;
+struct reset_control;
=20
 #define ETNA_NR_EVENTS 30
=20
@@ -158,6 +159,7 @@ struct etnaviv_gpu {
 	struct clk *clk_reg;
 	struct clk *clk_core;
 	struct clk *clk_shader;
+	struct reset_control *rst;
=20
 	unsigned int freq_scale;
 	unsigned int fe_waitcycles;
--=20
2.19.1

