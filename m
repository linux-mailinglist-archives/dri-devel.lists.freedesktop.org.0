Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E38C5B97E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 07:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FEB10E9B2;
	Fri, 14 Nov 2025 06:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="dZ22dB8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012057.outbound.protection.outlook.com
 [40.93.195.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0781310E9B1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYBiVAa4XuO8DrlVzpAqvpJAzVb0MEnqIPXwkEhppnb9tUZ2U/O5CAtLRFDyySfR9dQ4gU3XlmLL6ZPxQmv6T9RYA/6iiCEIvsbddnaIrn0n2jtA02OqsJLMyYLm+j3Nfa21fvYKLJdisvWViOlktJVtxnUCin9fG04rp6HeB3PcJWg6BnOs9cxyC5CnW8mGSN0isDHbck66y3N+Nlbi/y/yWfycIDXGachw05/TGg1R0TQJhDowZ8iAYX9nZH1g2R75qPdWXQ3zVyGaT2jh/d+usfcp5ZRnvMIImmxFesCprcUndien0FyqponkVvXhI8C4xtyyUPlrjslTfA/ndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWrW74iN9Oi2L3kISfBeAsStyi3+HY1Mvpd7mmaAQQ4=;
 b=mWJuttfG4InwBn9FEujNqo5D5a5n8ykt4RNSfxRYuMzKWIgORY3zdh7dYdzhtN5VtAvETyMJYqtQlpEnF03amqEUCr+VZWmX3ZwwBxk4IvcZSvNuZdN0YDGOROpBvu+n8uWtkVuTj6ATkeyC81cxyR4u1pDGZGYkd7eWjbB6vXNT02oud+V1nhgWbkBpFJwqPAaVfTMA9VaVbTRbvngGJgbVt20H+o/Hm6oOxz+/ICiXEWjKszRAQDl1MTt/9JBRm1nN2SBzqEBln0HtegRymmn4C1cO0mkAmxMCpUDsXxAlPa0Cdc4bEW1yvRSXAZs8xveaV6nueManKhu+WgkJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWrW74iN9Oi2L3kISfBeAsStyi3+HY1Mvpd7mmaAQQ4=;
 b=dZ22dB8ijJJIEBlov3Q9DPh76PD1lzCAHI1UrRCdoxnRVo879cScjPECqO6j3TsbSj9SleGpNG84ErXGjZBhrOrzu7FIEYiLBEKHcniOxnphd8JrDaFh9oIxaqzpbO9yh2tecTsSRUxE0zQyMQ9My9sJa3FQU0mUhX/8mGnnReA=
Received: from DM6PR14CA0065.namprd14.prod.outlook.com (2603:10b6:5:18f::42)
 by DS7PR10MB7177.namprd10.prod.outlook.com (2603:10b6:8:e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 06:43:57 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:5:18f:cafe::19) by DM6PR14CA0065.outlook.office365.com
 (2603:10b6:5:18f::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 06:43:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 06:43:57 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 00:43:53 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 00:43:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 00:43:52 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AE6hbsV1539554;
 Fri, 14 Nov 2025 00:43:48 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>, <s-jain1@ti.com>
Subject: [PATCH 2/3] drm/tidss: Power up attached PM domains on probe
Date: Fri, 14 Nov 2025 12:13:35 +0530
Message-ID: <20251114064336.3683731-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114064336.3683731-1-s-jain1@ti.com>
References: <20251114064336.3683731-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|DS7PR10MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: fd036f6d-4e36-42d0-a445-08de23492fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qt5XTjwg/Gy7IknNxQ2amb1CsInYmgD5LhnEjUa09+D8RYLkugrumfP/lKle?=
 =?us-ascii?Q?HC+DPDJj9KWz+CIoUR1X0JMRNIC8cWXfeMZbekXqWxliqUzsYz8v3XLBILp8?=
 =?us-ascii?Q?4jOzJ1hmsibOKmLZ5ih/yv0DLIKWUba2hJkZjhtG4MToJYcvJXgZHpVHiKKI?=
 =?us-ascii?Q?f0R0+AeXDpdkUeu3rTBv4JcvpCo85OGfFP/MbuRPBrGF1Sb0+mr8rT3c1LaY?=
 =?us-ascii?Q?v9zccJHuveO31odYQpLdVd3NlrWJzyf1sCO2FiEDjK7Nw9wS/r6uuiBFc4Un?=
 =?us-ascii?Q?TQrQHtLVYl73j7UjFUPzQVPqQLM9NEzErEUrRONy1Jz0HpF25tXdBaIIGXuE?=
 =?us-ascii?Q?SikTUdDreTgeQZa/L0rcBbri4n/Okc3CJaTHB3CM9PeI/12qX+/iw5L7L6Qg?=
 =?us-ascii?Q?NGiMF+sVwnIfYcJ+xH36AE2t2USPE1UogdytIRsghkoSqqPEB4YEwS57tM0F?=
 =?us-ascii?Q?HO4uaNnexcH4q0VvmNJvDtSQhVRh3vajbrSzSHNtfjef3iPbBA6sx9k0AUgL?=
 =?us-ascii?Q?BOO3BWy0Q0vLbWAx45lulVJAJTVDXXqJjSArZdJlk5DcEyDQaiBYDKUyIDbN?=
 =?us-ascii?Q?tQL6FltzGfxyL2SjfETtml1FXc8/vvZafWvddJ6wB6YBbW0BDXlA8ASAocUI?=
 =?us-ascii?Q?6yxsaS5lS+0XDWsQ4EWNU01VebEFHIuzb4iThrokM/4KamIVSCLodTxdsq0E?=
 =?us-ascii?Q?lUI5dI8wPl82L3oTYja2DdiGipNp1TmhDbMb1BDLBIMZs/JftQPOQFBL30ut?=
 =?us-ascii?Q?HiVoZM5ehbiDeJsx2atNN189u3lqhbg2jTDpPCEruRtY31da+xZ8wf+Jv0jt?=
 =?us-ascii?Q?EKGoTFc20T0GlEAcFzw9sXxZfaHshq5E9igN55zsp60swB9T3DVnJ09F1Enl?=
 =?us-ascii?Q?I5KZbgz/iJ0hWCZoBpSfWLsBxzaoIjjZ7C7TbLb321LqjKmYYDN2efr8Lbp8?=
 =?us-ascii?Q?bpy+EbmYP00ICOBAS7/m3Y2e76mBVnUwM6Js1GDsE+zyqLlmuEOcGqdreFmu?=
 =?us-ascii?Q?OkesFRkwx0GY2SsOuYCSBMrjwuGITYAmv1PTjGDsCt1KvVyrpx3eosl9ggrp?=
 =?us-ascii?Q?w1NVpyayXfc8N5dF9tDnRLuUKSsdtUM+yFvN4yJjIO8WQTRg51nvFi5sQ174?=
 =?us-ascii?Q?JEkJxHgV7uBKjeafRpmmfH3lAubY6FjwuqIVFKPckKeTt03zihaEYW7UYIJc?=
 =?us-ascii?Q?bLdKnPpXu2PzrFaCODL9tebHHis7b7mtdjlNRaXINNTQMJLYPcQhgc+RVSn1?=
 =?us-ascii?Q?xRELS3iuwXKpBWgJIH7nWdUq3kfIxGz5FSmaicQT3t9r7jc1stLfVtMxGnoQ?=
 =?us-ascii?Q?JpvqXo8O/ih0+fQwD+LLib/0WMDwW0HplJjg10ep8Zp9ReegmVBVnWe63MXI?=
 =?us-ascii?Q?N6U4zpPcbRz6AhqUCrjGfYRijHtjijtU172QWsX20URGKzsH8tZegPY0l78P?=
 =?us-ascii?Q?KYj8bqOmLyl77sX6NyWiM3ZzgcWC3iqh4LjjqwOkXhWM20WqwJmcBRSOUMNl?=
 =?us-ascii?Q?ktpn4JX1/MpT1xiYgetTwgVsqTtsfK3OBUAEvjebXwumSZ/hKUYulz0olQCT?=
 =?us-ascii?Q?I476+mBVHCPSqNoeX58sDfXdc0WxvZ+dQIOO1njq?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 06:43:57.1581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd036f6d-4e36-42d0-a445-08de23492fa3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7177
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

From: Devarsh Thakkar <devarsht@ti.com>

Some SoC's such as AM62P have dedicated power domains
for OLDI which need to be powered on separately along
with display controller.

So during driver probe, power up all attached PM domains
enumerated in devicetree node for DSS.

This also prepares base to add display support for AM62P.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
[j-choudhary@ti.com: fix PM call sequence causing kernel crash in OLDI]
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 88 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/tidss/tidss_drv.h |  4 ++
 2 files changed, 89 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 1c8cc18bc53c..50158281715f 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
 #include <linux/aperture.h>
 
 #include <drm/clients/drm_client_setup.h>
@@ -107,6 +108,72 @@ static const struct drm_driver tidss_driver = {
 	.minor			= 0,
 };
 
+static int tidss_detach_pm_domains(struct tidss_device *tidss)
+{
+	int i;
+
+	if (tidss->num_domains <= 1)
+		return 0;
+
+	for (i = 0; i < tidss->num_domains; i++) {
+		if (tidss->pd_link[i] && !IS_ERR(tidss->pd_link[i]))
+			device_link_del(tidss->pd_link[i]);
+		if (tidss->pd_dev[i] && !IS_ERR(tidss->pd_dev[i]))
+			dev_pm_domain_detach(tidss->pd_dev[i], true);
+		tidss->pd_dev[i] = NULL;
+		tidss->pd_link[i] = NULL;
+	}
+
+	return 0;
+}
+
+static int tidss_attach_pm_domains(struct tidss_device *tidss)
+{
+	struct device *dev = tidss->dev;
+	int i;
+	int ret;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct device_node *np = pdev->dev.of_node;
+
+	tidss->num_domains = of_count_phandle_with_args(np, "power-domains",
+							"#power-domain-cells");
+	if (tidss->num_domains <= 1) {
+		dev_dbg(dev, "One or less power domains, no need to do attach domains\n");
+		return 0;
+	}
+
+	tidss->pd_dev = devm_kmalloc_array(dev, tidss->num_domains,
+					   sizeof(*tidss->pd_dev), GFP_KERNEL);
+	if (!tidss->pd_dev)
+		return -ENOMEM;
+
+	tidss->pd_link = devm_kmalloc_array(dev, tidss->num_domains,
+					    sizeof(*tidss->pd_link), GFP_KERNEL);
+	if (!tidss->pd_link)
+		return -ENOMEM;
+
+	for (i = 0; i < tidss->num_domains; i++) {
+		tidss->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
+		if (IS_ERR(tidss->pd_dev[i])) {
+			ret = PTR_ERR(tidss->pd_dev[i]);
+			goto fail;
+		}
+
+		tidss->pd_link[i] = device_link_add(dev, tidss->pd_dev[i],
+						    DL_FLAG_STATELESS |
+						    DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
+		if (!tidss->pd_link[i]) {
+			ret = -EINVAL;
+			goto fail;
+		}
+	}
+
+	return 0;
+fail:
+	tidss_detach_pm_domains(tidss);
+	return ret;
+}
+
 static int tidss_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -129,15 +196,24 @@ static int tidss_probe(struct platform_device *pdev)
 
 	spin_lock_init(&tidss->irq_lock);
 
+	/* powering up associated OLDI domains */
+	ret = tidss_attach_pm_domains(tidss);
+	if (ret < 0) {
+		dev_err(dev, "failed to attach power domains %d\n", ret);
+		goto err_detach_pm_domains;
+	}
+
 	ret = dispc_init(tidss);
 	if (ret) {
 		dev_err(dev, "failed to initialize dispc: %d\n", ret);
-		return ret;
+		goto err_detach_pm_domains;
 	}
 
 	ret = tidss_oldi_init(tidss);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to init OLDI\n");
+	if (ret) {
+		dev_dbg(dev, "failed to init OLDI: %d\n", ret);
+		goto err_oldi_deinit;
+	}
 
 	pm_runtime_enable(dev);
 
@@ -203,8 +279,12 @@ static int tidss_probe(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
+err_oldi_deinit:
 	tidss_oldi_deinit(tidss);
 
+err_detach_pm_domains:
+	tidss_detach_pm_domains(tidss);
+
 	return ret;
 }
 
@@ -232,6 +312,8 @@ static void tidss_remove(struct platform_device *pdev)
 	/* devm allocated dispc goes away with the dev so mark it NULL */
 	dispc_remove(tidss);
 
+	tidss_detach_pm_domains(tidss);
+
 	dev_dbg(dev, "%s done\n", __func__);
 }
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index e1c1f41d8b4b..6eb17cb32043 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -41,6 +41,10 @@ struct tidss_device {
 	/* protects the irq masks field and irqenable/irqstatus registers */
 	spinlock_t irq_lock;
 	dispc_irq_t irq_mask;	/* enabled irqs */
+
+	int num_domains; /* Handle attached PM domains */
+	struct device **pd_dev;
+	struct device_link **pd_link;
 };
 
 #define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
