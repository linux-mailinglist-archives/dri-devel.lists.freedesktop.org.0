Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B29E7937
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 20:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FAE10E62C;
	Fri,  6 Dec 2024 19:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=thalesgroup.com header.i=@thalesgroup.com header.b="JowvWRHh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc1631-21.eu.iphmx.com (esa.hc1631-21.eu.iphmx.com
 [23.90.122.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575CA10E1E8;
 Fri,  6 Dec 2024 17:00:27 +0000 (UTC)
X-CSE-ConnectionGUID: LjzJYgpwRkef6KBvtNCeSg==
X-CSE-MsgGUID: 6oW8s5lnT6a8/73vpUsPdA==
Authentication-Results: ob1.hc1631-21.eu.iphmx.com;
 dkim=pass (signature verified)
 header.i=@thalesgroup.com
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="23273212"
X-IronPort-AV: E=Sophos;i="6.12,213,1728943200"; d="scan'208";a="23273212"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thalesgroup.com; i=@thalesgroup.com; s=bbmfo20230504;
 t=1733504425; h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=MMvxvcjwmGaoaI6TY+sGHOwLrNIxmnQoHv/0XjIcJL0=;
 b=JowvWRHhloGB8kjAWHht5nNizwpMA8nluIjexaK7y3ihdAOMcx4KN5ed
 vE4ijTD6Sv8Cou+iCHFnGs9/j7S2WWFTXw46D9oH/usrXLV6ttL1JqgFc
 X5QJJ+3BP7bPxsCjcbck7ca1tpswnsYcUGgLco3Wm1LRY3KmajN1LNMwR
 SsMmU7fSrB4lSyClH64L0JLBVWZyUkJD72kgKWZOCX7KW4id47qA+1ntq
 NcmO9FVgrGP4LqNFjQKFnxs8ZHV/fIlRtzA2+9nHxUfW6kxG7cJEPD8Ra
 NVgUZy0V3vR/zpwOCLaXYeFPgr3EX3DR4P17JTPiFH9eJBgKeOy2nbFpI A==;
X-CSE-ConnectionGUID: eh5xvLKnTtCmo1jJEDjh2w==
X-CSE-MsgGUID: ebRBKRevQcOmqQew0uK3UA==
X-CSE-ConnectionGUID: ivLhYqsyQXuhkMMHH+jcsQ==
X-CSE-MsgGUID: sFIkbeDeSBacDqZf3dN5sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="36858925"
X-IronPort-AV: E=Sophos;i="6.12,213,1728943200"; d="scan'208";a="36858925"
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
Subject: [PATCH v3] drm/etnaviv: add optional reset support
Thread-Topic: [PATCH v3] drm/etnaviv: add optional reset support
Thread-Index: AdtIAAvrmB6eEfCxSuiZypoaKXF8Jg==
Date: Fri, 6 Dec 2024 17:00:23 +0000
Message-ID: <afcb562602e54c969964a608e3b6494a@thalesgroup.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-nodisclaimer: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Dec 2024 19:45:35 +0000
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
Reviewed-by: Simon Lenain <simon.lenain@thalesgroup.com>
---
v3:
- Rework to match initial feedback
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 37 +++++++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  1 +
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnavi=
v/etnaviv_gpu.c
index 2d4c112ce033..1961ebac315a 100644
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
@@ -172,6 +173,25 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32=
 param, u64 *value)
 	return 0;
 }
=20
+static int etnaviv_gpu_reset_deassert(struct etnaviv_gpu *gpu)
+{
+	int ret;
+
+	/* 32 core clock cycles (slowest clock) required before deassertion */
+	/* 1 microsecond might match all implementations without computation */
+	usleep_range(1, 2);
+
+	ret =3D reset_control_deassert(gpu->rst);
+	if (ret)
+		return ret;
+
+	/* 128 core clock cycles (slowest clock) required before any activity on =
AHB */
+	/* 1 microsecond might match all implementations without computation */
+	usleep_range(1, 2);
+
+	return 0;
+}
+
 static inline bool etnaviv_is_model_rev(struct etnaviv_gpu *gpu, u32 model=
, u32 revision)
 {
 	return gpu->identity.model =3D=3D model &&
@@ -799,6 +819,12 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
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
@@ -1860,6 +1886,17 @@ static int etnaviv_gpu_platform_probe(struct platfor=
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
index 4d8a7d48ade3..0985ea548b82 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -158,6 +158,7 @@ struct etnaviv_gpu {
 	struct clk *clk_reg;
 	struct clk *clk_core;
 	struct clk *clk_shader;
+	struct reset_control *rst;
=20
 	unsigned int freq_scale;
 	unsigned int fe_waitcycles;
--=20
2.19.1

