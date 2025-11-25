Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1362AC8610E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 18:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE2610E556;
	Tue, 25 Nov 2025 17:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="peEAt+tZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011044.outbound.protection.outlook.com [52.101.52.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFB710E555
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 17:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXwbUQId1qXU8Im5i+w8AtfNH7FkshXlzCngQeUUQ8wyFZPWJKeIKOcHMLyt3fHr5YJM9Ys31Zx1yYIGLIibcXk9+iQqmmqWk0dcGsxvkSBjg45XAWJPy3mnhLtDAyBqAhx+WWRLJo/GFS1VpIy+83wtcsg7r27FjTPvwnbvuopi39h6UOQvCej8S/qh9rm36bSLDnNOchzTTnK8V7AUBuwu5re7gPQhuBlKEQEH378rY+5f/ZXQ9egsSSkwoGupVzUpnBGRWC8cP2VlQRhNd+ZJcRJMyQo7X7R1SKh/g5TVrJ0XDpIMxB04AF/JMN/PVv4mpSCEdH6+DuINK0lvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=014YnDae3mCGR8rmahPSYYxIu+tSeKHu2aadcMQTHvE=;
 b=KluVKJLEBxkWsT4/HaitiZljLYPwWl70cCHwF3G6zlapFbip0sLhus71OE7WFSlhYzSF0zjAawbqIp0nMAm4XjjDHNQILV3mn+GLXxyiL6J7FRWtg5tOJOjEnzB9zZUhGJFjPJAMrM5tpinlfJpCv/hwcN7XJQVr9tdeNF6CiMSQX9HuOLBB8KhKpLp1hD3KlaS/5DZdMignkiWmuENTk8onhJqxj5dTOSu550VQMMXV4jp2XfczRQv5FVxe55qTXqFUGDlu7XQqBvALo6sHfw+jSqdwoyrYOnz6OjzNjFH1q03aAv248ZX2QSMR+CujndykaKqtIHIERiq4wmbd4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=014YnDae3mCGR8rmahPSYYxIu+tSeKHu2aadcMQTHvE=;
 b=peEAt+tZNkU+vKHAqw3PbYlpVfcbFQIyoPmPQGk7k6cLNfZupyooek9wiNNbYqgtq3Pa+a3N97yGOvkX9zs87UH9JOHfQY+E8t8kvR5Er/3BHjTZFLxydEx8Kc8yzgTn70gV4zzc/fDDCDa8dVeAB9WU+rqpr1icqyn36vTqqIM=
Received: from SA1PR05CA0019.namprd05.prod.outlook.com (2603:10b6:806:2d2::26)
 by DM6PR10MB4201.namprd10.prod.outlook.com (2603:10b6:5:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 17:00:02 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:2d2:cafe::c6) by SA1PR05CA0019.outlook.office365.com
 (2603:10b6:806:2d2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 16:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 17:00:01 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 10:59:58 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 10:59:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 25 Nov 2025 10:59:57 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5APGxgbT3987080;
 Tue, 25 Nov 2025 10:59:53 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>, <s-jain1@ti.com>
Subject: [PATCH v2 2/3] drm/tidss: Power up attached PM domains on probe
Date: Tue, 25 Nov 2025 22:29:41 +0530
Message-ID: <20251125165942.2586341-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125165942.2586341-1-s-jain1@ti.com>
References: <20251125165942.2586341-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|DM6PR10MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c79afa-54c4-4c44-31df-08de2c4412c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QWurvNTr10AmnuAGQmyiJeEqGxqfpknNA8GqJbBjDvD9SsG+S/G2Sl5M9Jel?=
 =?us-ascii?Q?GZKBwMhb5VDg+oo1/TAdXC9VSsEtXdkVfHhLX6Z2qAHPN9OwUL+u/H5DIm3c?=
 =?us-ascii?Q?CN4rY42owEbl6HqGWEp8IThTfBJtgKgaLbx4eAkYhQ4z7HYgtYhjwdWwwXKJ?=
 =?us-ascii?Q?Htqa27ORbSHvqGhJG7cIUHwMO1PecT9UiLLLwhrf+VMHeXsxOWId2GrYiomn?=
 =?us-ascii?Q?Rwfnrz78EqPpxOSVDcv+0i2hlOX2syasi1/w86Ye2R188O9OLvWziOEIrHDg?=
 =?us-ascii?Q?StEsNuQcOZ1sVnZ8xg6cAjpq6uLekfXuqreABUmv6dO8eXeArktRwqjbe43m?=
 =?us-ascii?Q?b8fOo+ZK8IVy2MXJrP02u7kJN1lqHXPTXbYc8h91nQkNViTp1zT0DwPkomMW?=
 =?us-ascii?Q?6uucSt4HQOGKKyM6R/UUE1QuRuCRYrKH2N3Kd9mY3BxkenII+55fkRDl4YKu?=
 =?us-ascii?Q?BDFPVJpPlx/TaWAYl13OXuj7r1CROrf5Wu3v9ap+pvsbNAcqjx0d0iwmMHH+?=
 =?us-ascii?Q?rnegdifW3NrTiDk4jz0Uu8U18jZIUrC5L/a+vCZbNvi7kvGXfeEVru2MIOfU?=
 =?us-ascii?Q?x11qY6R6xp3xIdu8FipY0937bsKH5LiVo4O83mrN0rkP33b7NjyxLsJv7vG6?=
 =?us-ascii?Q?BahCVz/luMsO3XCrtkqGJTXTPF9hd7FysreDYAMbOks1/AGokTbXRBNuU641?=
 =?us-ascii?Q?qyiKVtD8f4bUWBewALnpowuzEsQjF2yYZl72LcamUq+KbDZcH/tYcfiJkeze?=
 =?us-ascii?Q?I3ysDv9ulMTW8MrsXt8xic4HP2wcql59djRVGTeavbvj6YlUQHqyU5nqqaKd?=
 =?us-ascii?Q?Qh+3mMFJVvSqmCD/QIbBU2NH9wf7ORn8Dvj6Mk7n1cgHtbbXvWqlH3D/ob6D?=
 =?us-ascii?Q?FUCATHF6zR2tKlr94AqB9KuzdDBcTW29Mw1bxNlsy+NJaeiEUDxzYFvWKbG6?=
 =?us-ascii?Q?p7Z4M4KKbzWPXwyKvXgyIs6H+CBrCcJGNgCVyE4yGDqHZf8mltpKr8fbgA3l?=
 =?us-ascii?Q?kL8dsCCqm/GqSySf0/yAV65yTlZm+WvFC6JgcXj9PM2U9ir3Qf0v1rI9n1VO?=
 =?us-ascii?Q?etAkKX07TbtsJCOLJ0o17CefUNI60ZIbBV4lvPL1bT0ey92zs7cJoWQB7wWV?=
 =?us-ascii?Q?7iIrtD1hcSVrwMG3oGNy4Zg1TGJ7ouJ43G7gHqkfDmDzZ38FLIKD+G31RrOp?=
 =?us-ascii?Q?PGlLXVs7ymchjJqK+Uaqyu9uRoeXUS/gUsd+2Np/GCX1mVhvbX9jI/+tIUnP?=
 =?us-ascii?Q?YevTrssN+/fX1K4A/k8JxiLVuJPi5i12s6i2i7eukAyjC4mMycO4YJ9uGE1l?=
 =?us-ascii?Q?jH1344HQ3tXDdQJnk1+3Wjg4WMNKwszioVEwlgaFiNVLr06aBGBT7RF+pnSK?=
 =?us-ascii?Q?/+Bl40uVD6pp/BeFVPJxbW+lt+85lzZm7drqnZTCn/F73tHie2JrCoQe9ko0?=
 =?us-ascii?Q?SPjFtpVVfhyxdrgvs+rkYN8eII4uRFwbOp0tS2nh3lAx2AHZ4J3OtcnXbfJV?=
 =?us-ascii?Q?QmvXTpn7Zr72KAiwwyQmFWF9mb9uN15ra8yc6Nj3EiCG7S5eH7UWbDdLeICY?=
 =?us-ascii?Q?OYFY5rmTq56njkNtXsRhV40nrhXIJ8jDSBHlOJ3U?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 17:00:01.6898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c79afa-54c4-4c44-31df-08de2c4412c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4201
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
Signed-off-by: Swamil Jain <s-jain1@ti.com>
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
