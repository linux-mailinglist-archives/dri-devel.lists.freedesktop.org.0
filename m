Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CBB8C398C
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 02:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE7710E309;
	Mon, 13 May 2024 00:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="q9ZNveTR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702B810E309
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 00:13:54 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715559232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e3pEj0WWodLS42WTaYGSsqEklXWqCa1MeU3yE8jdV00=;
 b=q9ZNveTRce1txu2wT/QMCvQF8h05xke4kbajjOEKNMXEiMDEBn1GGbSb5PjWYwTuEv7mlg
 MLsmTalfac1oB+TxkA4R3srQA8SWWIIkUowJBJJnh0MMounveE7o+UPxb17A3sG88aaSR4
 CrM769A5sVoVqqeQWZJT5JjMY5RaAvk=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 1/3] drm/loongson: Add helpers for creating subdevice
Date: Mon, 13 May 2024 08:12:41 +0800
Message-Id: <20240513001243.1739336-2-sui.jingfeng@linux.dev>
In-Reply-To: <20240513001243.1739336-1-sui.jingfeng@linux.dev>
References: <20240513001243.1739336-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

In some display subsystems, the functionality of a PCI(e) device may too
complex for a single driver to be managed by a monolithic driver. A split
of the functionality into child devices can helps to achieve better
modularity, eaiser for understand and maintain.

Add the loongson_create_platform_device() function to pove the way for the
mentioned goals. Pure software method, no hardware operations involved.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/loongson/loongson_device.c | 42 ++++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_drv.h        |  6 ++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/loongson/loongson_device.c b/drivers/gpu/drm/loongson/loongson_device.c
index 9986c8a2a255..b268549d643e 100644
--- a/drivers/gpu/drm/loongson/loongson_device.c
+++ b/drivers/gpu/drm/loongson/loongson_device.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 
 #include "lsdc_drv.h"
 
@@ -100,3 +101,44 @@ lsdc_device_probe(struct pci_dev *pdev, enum loongson_chip_id chip_id)
 {
 	return __chip_id_desc_table[chip_id];
 }
+
+int loongson_create_platform_device(struct device *parent,
+				    const char *name, int id,
+				    struct resource *pres,
+				    void *data,
+				    struct platform_device **ppdev)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_alloc(name, id);
+	if (!pdev)
+		return -ENOMEM;
+
+	pdev->dev.parent = parent;
+
+	if (pres) {
+		ret = platform_device_add_resources(pdev, pres, 1);
+		if (ret) {
+			platform_device_put(pdev);
+			return ret;
+		}
+	}
+
+	if (data) {
+		void *pdata = kmalloc(sizeof(void *), GFP_KERNEL);
+
+		*(void **)pdata = data;
+		pdev->dev.platform_data = pdata;
+	}
+
+	ret = platform_device_add(pdev);
+	if (ret) {
+		platform_device_put(pdev);
+		return ret;
+	}
+
+	*ppdev = pdev;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
index fbf2d760ef27..a2c6b496a69f 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.h
+++ b/drivers/gpu/drm/loongson/lsdc_drv.h
@@ -47,6 +47,12 @@ enum loongson_chip_id {
 const struct lsdc_desc *
 lsdc_device_probe(struct pci_dev *pdev, enum loongson_chip_id chip);
 
+int loongson_create_platform_device(struct device *parent,
+				    const char *name, int id,
+				    struct resource *pres,
+				    void *data,
+				    struct platform_device **ppdev);
+
 struct lsdc_kms_funcs;
 
 /* DC specific */
-- 
2.34.1

