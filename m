Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D8AA595AC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 14:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580A310E44A;
	Mon, 10 Mar 2025 13:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="RquPjEZ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2E210E44B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 13:11:01 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A55uUD006364;
 Mon, 10 Mar 2025 13:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=b
 lxvlkzfk1ZB0JXyBb0DLY1ci/spKFIpqWQP6Pv6qkY=; b=RquPjEZ0GjebSBN2K
 ZCxTLBaqjZQxfdJFmAJ7rUiiRYYQnFZckUy97N+HvNpfMmopHfTec9eJ66XPABS1
 o3rA4aQBokmrezAUGuCrCYLYvW39k8R5vJJrhNC530feT9WUsw71OZFIwDuZ/UwE
 l0E/CN6nguSWNEIMI5tBl32ZPlBYQoUeuFcTf4nt+6UeQLIFSQPSWNPc6xGm5brz
 VKBIliUmIgLESSnkxqfCILDtPWNuxChC6hUlIlUX6+7D0fhDtJaZa2e9Gok6vTJm
 b8BmztIS9ZaHdP+JhUdND586XtW+3ZpV2MgFIOjTUmoj6tqlLY8mtrtGDkPBtGqE
 8PN9g==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 458ev09erv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 Mar 2025 13:10:48 +0000 (GMT)
Received: from Matts-MacBook-Pro.local (172.25.0.133) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 13:10:46 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 10 Mar 2025 13:10:29 +0000
Subject: [PATCH v3 05/18] drm/imagination: Add power domain control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250310-sets-bxs-4-64-patch-v1-v3-5-143b3dbef02f@imgtec.com>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
In-Reply-To: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, "Alessio
 Belle" <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7005;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=I78rUUIMRE8+5CV2wa+/8KlAt2XJHriIKGjSOUFajBo=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaSfe3Lhaa0iL5NZisGnhMhK3rIZjvOrhJVLYrcfKVi2m
 1suOHB6RykLgxgHg6yYIsuOFZYr1P6oaUnc+FUMM4eVCWQIAxenAEykRJ+RYaeUdZfZw4Xdu/te
 PH/9WNTZ4Y9N2RFP5907Tr1n9t3+bAUjw8G22HVhMgVrdrNmWjo2t1w8yxbfWqe46fvP0KzSi8L
 8TAA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=67cee4d8 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=Iu228gY9Y64KKxsXE-4A:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 9DuQdVpJwgiFpsyURADCE8DvESh8G9OF
X-Proofpoint-ORIG-GUID: 9DuQdVpJwgiFpsyURADCE8DvESh8G9OF
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

The first supported GPU only used a single power domain so this was
automatically handled by the device runtime.

In order to support multiple power domains, they must be enumerated from
devicetree and linked to both the GPU device and each other to ensure
correct power sequencing at start time.

For all Imagination Rogue GPUs, power domains are named "a", "b", etc. and
the sequence A->B->... is always valid for startup with the reverse true
for shutdown. Note this is not always the *only* valid sequence, but it's
simple and does not require special-casing for different GPU power
topologies.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v3:
- None
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-6-3fd45d9fb0cf@imgtec.com
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-6-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_device.h |   8 +++
 drivers/gpu/drm/imagination/pvr_drv.c    |   7 ++
 drivers/gpu/drm/imagination/pvr_power.c  | 114 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_power.h  |   3 +
 4 files changed, 132 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 6d0dfacb677b46a880f37f419dfa7b67c68fe63d..2dd8a8885fe07078896d669d822525fb2b7bab51 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -18,6 +18,7 @@
 #include <linux/bits.h>
 #include <linux/compiler_attributes.h>
 #include <linux/compiler_types.h>
+#include <linux/device.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -131,6 +132,13 @@ struct pvr_device {
 	 */
 	struct clk *mem_clk;
 
+	struct pvr_device_power {
+		struct device **domain_devs;
+		struct device_link **domain_links;
+
+		u32 domain_count;
+	} power;
+
 	/** @irq: IRQ number. */
 	int irq;
 
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 3130193f8fffc185e630a293be53374bdc4b7ce0..ac4f5855c5692f0956862cebdbf76b16d8da9a81 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1411,6 +1411,10 @@ pvr_probe(struct platform_device *plat_dev)
 
 	platform_set_drvdata(plat_dev, drm_dev);
 
+	err = pvr_power_domains_init(pvr_dev);
+	if (err)
+		return err;
+
 	init_rwsem(&pvr_dev->reset_sem);
 
 	pvr_context_device_init(pvr_dev);
@@ -1450,6 +1454,8 @@ pvr_probe(struct platform_device *plat_dev)
 err_context_fini:
 	pvr_context_device_fini(pvr_dev);
 
+	pvr_power_domains_fini(pvr_dev);
+
 	return err;
 }
 
@@ -1470,6 +1476,7 @@ static void pvr_remove(struct platform_device *plat_dev)
 	pvr_watchdog_fini(pvr_dev);
 	pvr_queue_device_fini(pvr_dev);
 	pvr_context_device_fini(pvr_dev);
+	pvr_power_domains_fini(pvr_dev);
 }
 
 static const struct of_device_id dt_match[] = {
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index ba7816fd28ec77e6ca5ce408302a413ce1afeb6e..19b079b357df78e8bcdecfa377fc9c05b6e8e4b0 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -10,10 +10,13 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/timer.h>
 #include <linux/types.h>
@@ -431,3 +434,114 @@ pvr_watchdog_fini(struct pvr_device *pvr_dev)
 {
 	cancel_delayed_work_sync(&pvr_dev->watchdog.work);
 }
+
+int pvr_power_domains_init(struct pvr_device *pvr_dev)
+{
+	struct device *dev = from_pvr_device(pvr_dev)->dev;
+
+	struct device_link **domain_links __free(kfree) = NULL;
+	struct device **domain_devs __free(kfree) = NULL;
+	int domain_count;
+	int link_count;
+
+	char dev_name[2] = "a";
+	int err;
+	int i;
+
+	domain_count = of_count_phandle_with_args(dev->of_node, "power-domains",
+						  "#power-domain-cells");
+	if (domain_count < 0)
+		return domain_count;
+
+	if (domain_count <= 1)
+		return 0;
+
+	link_count = domain_count + (domain_count - 1);
+
+	domain_devs = kcalloc(domain_count, sizeof(*domain_devs), GFP_KERNEL);
+	if (!domain_devs)
+		return -ENOMEM;
+
+	domain_links = kcalloc(link_count, sizeof(*domain_links), GFP_KERNEL);
+	if (!domain_links)
+		return -ENOMEM;
+
+	for (i = 0; i < domain_count; i++) {
+		struct device *domain_dev;
+
+		dev_name[0] = 'a' + i;
+		domain_dev = dev_pm_domain_attach_by_name(dev, dev_name);
+		if (IS_ERR_OR_NULL(domain_dev)) {
+			err = domain_dev ? PTR_ERR(domain_dev) : -ENODEV;
+			goto err_detach;
+		}
+
+		domain_devs[i] = domain_dev;
+	}
+
+	for (i = 0; i < domain_count; i++) {
+		struct device_link *link;
+
+		link = device_link_add(dev, domain_devs[i], DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+		if (!link) {
+			err = -ENODEV;
+			goto err_unlink;
+		}
+
+		domain_links[i] = link;
+	}
+
+	for (i = domain_count; i < link_count; i++) {
+		struct device_link *link;
+
+		link = device_link_add(domain_devs[i - domain_count + 1],
+				       domain_devs[i - domain_count],
+				       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+		if (!link) {
+			err = -ENODEV;
+			goto err_unlink;
+		}
+
+		domain_links[i] = link;
+	}
+
+	pvr_dev->power = (struct pvr_device_power){
+		.domain_devs = no_free_ptr(domain_devs),
+		.domain_links = no_free_ptr(domain_links),
+		.domain_count = domain_count,
+	};
+
+	return 0;
+
+err_unlink:
+	while (--i >= 0)
+		device_link_del(domain_links[i]);
+
+	i = domain_count;
+
+err_detach:
+	while (--i >= 0)
+		dev_pm_domain_detach(domain_devs[i], true);
+
+	return err;
+}
+
+void pvr_power_domains_fini(struct pvr_device *pvr_dev)
+{
+	const int domain_count = pvr_dev->power.domain_count;
+
+	int i = domain_count + (domain_count - 1);
+
+	while (--i >= 0)
+		device_link_del(pvr_dev->power.domain_links[i]);
+
+	i = domain_count;
+
+	while (--i >= 0)
+		dev_pm_domain_detach(pvr_dev->power.domain_devs[i], true);
+
+	kfree(pvr_dev->power.domain_links);
+	kfree(pvr_dev->power.domain_devs);
+
+	pvr_dev->power = (struct pvr_device_power){ 0 };
+}
diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/imagination/pvr_power.h
index 9a9312dcb2dab7d36ee8ff7f69e69d126c5469a9..ada85674a7ca762dcf92df40424230e1c3910342 100644
--- a/drivers/gpu/drm/imagination/pvr_power.h
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -38,4 +38,7 @@ pvr_power_put(struct pvr_device *pvr_dev)
 	return pm_runtime_put(drm_dev->dev);
 }
 
+int pvr_power_domains_init(struct pvr_device *pvr_dev);
+void pvr_power_domains_fini(struct pvr_device *pvr_dev);
+
 #endif /* PVR_POWER_H */

-- 
2.48.1

