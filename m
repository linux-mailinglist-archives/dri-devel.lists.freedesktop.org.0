Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E89CC8F40
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 18:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1AC10E8C5;
	Wed, 17 Dec 2025 17:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="fwCPkhnW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B319310E8C4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 17:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765991056; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Jzgx6lqJR14JQih6FJdnyOcRHLbOCDxbzeEjWYAWViyh9xuYdhx+6eJ7m9CD1HnK7gIcPn6skUNUJnhgpayNQS3MXvvwIjRd1hSnqq+S34IKtxBhLuwh/4RcPNmtMcb9neImJGDaIsLB8LW+mJldjHTZVhmELWZHlYsSZDxF37Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765991056;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=oGj1Iz8fP7j1sriJri6rEXbeQOcxivFvgqwECO6b/Kk=; 
 b=GZk50L67nxhR6wmRUtdZgQxTTZgbwDj31hMO4JOzoI2zbJn/jRHpzz5J5stsekUTjgDoMxaPZIKzwGx0g2hbC7NANOEsQBRxgjif1QrIzTBTPbTxExp/JMKvtbluuxzYJK4RNRkluYtvTWHtk10MxAVNe3pAfgQ1HdPybbA4l5Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765991056; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=oGj1Iz8fP7j1sriJri6rEXbeQOcxivFvgqwECO6b/Kk=;
 b=fwCPkhnWAV8gqlC/LquoK+DfvZ/wQtXxFvtqHlAbDwH0bf/CWTYXExm+HrUbp+Ss
 X53RpplfSNh8v2XOX9aJiHn83p2Afd859SDtaFHtT8VHpMTeSQkjwgcvB4FidLAWkwu
 Hdgw2e8kGGFbobsnKMq9YnQ5zARpGO6a/XBLWClk=
Received: by mx.zohomail.com with SMTPS id 1765991055390303.7583910605715;
 Wed, 17 Dec 2025 09:04:15 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 17 Dec 2025 18:03:29 +0100
Subject: [PATCH 3/4] drm/panthor: Implement reading shader_present from nvmem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-mt8196-shader-present-v1-3-f6f8f3aa1e93@collabora.com>
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
In-Reply-To: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

On some platforms, notably MediaTek MT8196, the shader_present bitmask
in the Mali GPU register for it has cores enabled that may be faulty.
The true shader_present bitmask is found in an efuse instead.

Implement reading shader_present from an nvmem cell if one is present,
falling back to the Mali register if it's absent. The error codes are
trickled up through to the probe function so that probe deferral works.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c | 63 ++++++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 87ebb7ae42c4..eb44c8b108aa 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 /* Copyright 2025 ARM Limited. All rights reserved. */
 
+#include <linux/nvmem-consumer.h>
 #include <drm/drm_print.h>
 
 #include "panthor_device.h"
@@ -109,7 +110,52 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 	return "(Unknown Mali GPU)";
 }
 
-static void panthor_gpu_info_init(struct panthor_device *ptdev)
+static int overload_shader_present(struct panthor_device *ptdev)
+{
+	struct device *dev = ptdev->base.dev;
+	struct nvmem_cell *cell = nvmem_cell_get(dev, "shader-present");
+	ssize_t len;
+	void *buf;
+	int ret;
+
+	if (IS_ERR(cell)) {
+		/* On platforms without this cell, use the Mali register */
+		if (PTR_ERR(cell) == -ENOENT)
+			return 0;
+
+		return dev_err_probe(dev, PTR_ERR(cell),
+				     "Failed to get shader-present nvmem cell\n");
+	}
+
+	buf = nvmem_cell_read(cell, &len);
+	if (IS_ERR(buf)) {
+		ret = dev_err_probe(dev, PTR_ERR(buf),
+				    "Failed to read shader-present nvmem cell\n");
+		goto err_put_cell;
+	}
+
+	if (!len || len > 8) {
+		ret = dev_err_probe(dev, -EINVAL, "shader-present cell can't be length %ld\n",
+				    len);
+		goto err_free;
+	}
+
+	memcpy(&ptdev->gpu_info.shader_present, buf, len);
+
+	kfree(buf);
+	nvmem_cell_put(cell);
+
+	return 0;
+
+err_free:
+	kfree(buf);
+err_put_cell:
+	nvmem_cell_put(cell);
+
+	return ret;
+}
+
+static int panthor_gpu_info_init(struct panthor_device *ptdev)
 {
 	unsigned int i;
 
@@ -143,13 +189,18 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
 		ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
 	}
+
+	return overload_shader_present(ptdev);
 }
 
-static void panthor_hw_info_init(struct panthor_device *ptdev)
+static int panthor_hw_info_init(struct panthor_device *ptdev)
 {
 	u32 major, minor, status;
+	int ret;
 
-	panthor_gpu_info_init(ptdev);
+	ret = panthor_gpu_info_init(ptdev);
+	if (ret)
+		return ret;
 
 	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
 	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
@@ -172,6 +223,8 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
 		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
 		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
 		 ptdev->gpu_info.tiler_present);
+
+	return 0;
 }
 
 static int panthor_hw_bind_device(struct panthor_device *ptdev)
@@ -218,7 +271,5 @@ int panthor_hw_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
-	panthor_hw_info_init(ptdev);
-
-	return 0;
+	return panthor_hw_info_init(ptdev);
 }

-- 
2.52.0

