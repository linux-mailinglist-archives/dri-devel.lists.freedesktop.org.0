Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20560CFF2DC
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 18:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8014810E5F9;
	Wed,  7 Jan 2026 17:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="V3bEA+sB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012000.outbound.protection.outlook.com [40.107.209.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0385A10E5A9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 17:45:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQb5+Ipx8YQ88ltKMwLPiP6GEmfxKhcz8WBY6pLZ3xjGbiIiD0SYwqmnKWds8fqP6hJfSnNBbmk6L8UN1VyUo66h1r6MUVef/pgX/oTOhYPndTpbAtAkiqTT0rktiYaVO12oJqbRz4xNq8Kkj/TMWGh/H//tAPQIfKYp0TRgBRqKaDFoqNzCFfEtHBfPGwE4h12hxnNijPMhaUxv6XX4GPL5FuHFEPxNHBs1VyV7y8l5dnOLp6BECNnKFUeuG4bfZNHWkczaoLRkGbnsTZgXcfxkAVedmEA4tMSKqTf4Rir0cbySjZzOQf3grVRgXhHfamtGGqNomTLV7mL2WyYLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1z2erY2GQHqYgLsUIWjRG0ei8U4Yr68L0s+eWiR1IN8=;
 b=gdXYbvqtqe1H3LduhKABiS1PTRNA33i/tqSi7wA7isIJ/cqbEaQdJJzbE8ElqR+ZWt/qatzd5kHTaaIQpfA/iN7nl12IOGUgBvhXveqQICGkOHR4yQKUO6RRBiNgv2EIX3VoiIK+/WZdz3uZQEwNoQopLM9Icp4J9mQfrnK3KQldJ9WGZosh+0qobiIQfK4hQBowAck38L42NfIwymssOUFTJhzjFDgmPANRQXDpn+Lbpfxr1BSFfYft+hHgAl9QxFiATVdXJX54dUJKL83SlJDUCyUT3YnTA6dGlVd2NCtQR59IDQXAsXBJxPGBXiUzn1F3WMZfMg2ibhViarUsag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1z2erY2GQHqYgLsUIWjRG0ei8U4Yr68L0s+eWiR1IN8=;
 b=V3bEA+sBVJjyxgsQCcAhTTUGdUwtXgucuuGHt9f4CB70h1Xe76tDkCJaZidRcKNNi83hyeQXpMXTlg9LNTL6tIH0Yo8rMVFdHpKdAu7WNdsI6d3wYFvQowY9hFVc9zUrfAaKw0e0xVEVzhZoKS3jPTNFXNNdvn49AxoTeodaWYk=
Received: from SJ2PR07CA0012.namprd07.prod.outlook.com (2603:10b6:a03:505::13)
 by BN0PR10MB4918.namprd10.prod.outlook.com (2603:10b6:408:12e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:45:49 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::47) by SJ2PR07CA0012.outlook.office365.com
 (2603:10b6:a03:505::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 17:45:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 17:45:46 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 11:45:41 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 11:45:41 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 11:45:41 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 607HjQlW1103883;
 Wed, 7 Jan 2026 11:45:36 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>, <s-jain1@ti.com>
Subject: [PATCH v3 2/3] drm/tidss: Power up attached PM domains on probe
Date: Wed, 7 Jan 2026 23:15:24 +0530
Message-ID: <20260107174525.1702585-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107174525.1702585-1-s-jain1@ti.com>
References: <20260107174525.1702585-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|BN0PR10MB4918:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f60222-10f4-4a1f-e0ac-08de4e1496a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YZDYiD/pcuA/oVSvRyMLdbW0BgfNHuOHA0L9HbMqvG8SNvLUv32tx1JcZeme?=
 =?us-ascii?Q?PnWtqZG70q13eQpX+vJKbQOYPgTSvNFdRaQDUihYhq7ZPy5O7Fs8yRHUNJrt?=
 =?us-ascii?Q?eYg0B8iLc4GSLzIi3wwlUFABEcvSBkDhgLG3sLD5xXNZpom1Z+Uhc+ew8Yg/?=
 =?us-ascii?Q?FcZxy8MJMxPtfkYvNxgmtMhQWjtuEHE5BAcVee5CtMI+MoPK5J3FVGyalqfs?=
 =?us-ascii?Q?WAIgQqQ4MiYLr1n08cMrUqpwjZDenOfc+1MBGE79XMijgj81mX6MdH4Gy9W5?=
 =?us-ascii?Q?oFi7qtejEty2h3Uh0AWcBkdmJ8gNe0PBtLY4sHEswYEbzB6NtIFLeHCe6Dcv?=
 =?us-ascii?Q?PSby7XH/yS0QuXmW8lGuNnkj1SYttTRy7Oyb8AcJ/i5/JzLlC/lwDaw8eIDZ?=
 =?us-ascii?Q?PBoPhOa/U4bvERHwxBH29uaQ+3GBsb3MfE/FAiuu7dO0131FZju8rF4gve5A?=
 =?us-ascii?Q?6MyoCm7Hu1WnHeGIdh/Qh8uDL77zViIo2BCSVqRocCw4l49BbOnpcP3VyKYr?=
 =?us-ascii?Q?FC2sS8mAd/MwM2BtvizEsCX1pC5XjzgIdOxhFJmvPOk5mqXJPbA7aAofTJnB?=
 =?us-ascii?Q?E/248pG0UqxsOPVU+SiWk+9Ptahkaj3mhSM9JrFBIAkZoSZvRz2mXVVRIW0u?=
 =?us-ascii?Q?r+gNo00cAXQ8fUiYdIqu4eIQslgs2/1dJPSr2/BHaSfWIgubKa0Ko+A9TSQz?=
 =?us-ascii?Q?TcGjCToTEIvmz5eASvSsWsNuGSP91zlS+ZrAxRB8EcpffCfj0tvclTh8sfPv?=
 =?us-ascii?Q?4HS7t+JBjaTdA4/VvVFxg2+JdPcQNpZBI+i15CPdEyNkgkoFNmwH/YMcquNv?=
 =?us-ascii?Q?uTgP+NUm5krRnMLjDzQKJUF+3mD8a5fS8y7our0gm1HuOv71eRsbbLXWN01C?=
 =?us-ascii?Q?goJZby4pqt7C4BI0GrqbkegoSSZQ9mNbojIFkP88Y2aqFQyv4j4ufyYTGZW+?=
 =?us-ascii?Q?hO71qBUWQk0Ke6J/45x2efI78TSTBbs5452C1rU+xAhLFUjieFPvnhDVZImN?=
 =?us-ascii?Q?cbTEMT+TDXuxjSnkuc0IxtdDQnQeQh3uPm91afvdqgYI1Uvdk+XeY5OR7IjG?=
 =?us-ascii?Q?boop27EQVFm3fD+DTfwzcaeKY//FzU7xiBoQ8CZWUZnHeNQE9FLE/JB5bAJG?=
 =?us-ascii?Q?/sifenBM2KTlYXvJrs1oGEEnTUuwObEAN7tm+IRX0ihf7xFL8I/LaJjUOGKM?=
 =?us-ascii?Q?7ONkIc1vF25B9VNEqFSgTUgBiCSt/8SODuE+HiaxdU5NYK78tRFT3csmNKY5?=
 =?us-ascii?Q?4WF4hV8WdjSH3ADhpvz8CPWjExlzPK0bONcUodX+DKQYM+0kxdq7crsaM3o0?=
 =?us-ascii?Q?rzz3DhgsfuyhpNwMCB0NjJztYjscLed+kLCG0c7d2lNEuYIehddOZ7pJotAb?=
 =?us-ascii?Q?YH9EvqR6qAm7xNR3G6h60nOwdCP9X5XvQTC03hKBe8VHVhSjLxn6o/AN1rb3?=
 =?us-ascii?Q?Jhzg+2JUmqGbX+poiYxBmJr4tvAHxQTLGYUCRrJvvNfN2avhCzfuiQ0clylP?=
 =?us-ascii?Q?mi7amg0h/tGXBkKoEPX7i8YJnvDc5YzaugNV2s5DZTyndAmmpebHaQqRp4wT?=
 =?us-ascii?Q?9cpvfaozqe22/Mnd86zPJH09rm9vX5eRQX61wFy1?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:45:46.5681 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f60222-10f4-4a1f-e0ac-08de4e1496a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4918
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
 drivers/gpu/drm/tidss/tidss_drv.c | 83 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/tidss/tidss_drv.h |  4 ++
 2 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 1c8cc18bc53c..33a10fba4325 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
 #include <linux/aperture.h>
 
 #include <drm/clients/drm_client_setup.h>
@@ -107,6 +108,68 @@ static const struct drm_driver tidss_driver = {
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
+		if (!IS_ERR_OR_NULL(tidss->pd_link[i]))
+			device_link_del(tidss->pd_link[i]);
+		if (!IS_ERR_OR_NULL(tidss->pd_dev[i]))
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
@@ -129,15 +192,21 @@ static int tidss_probe(struct platform_device *pdev)
 
 	spin_lock_init(&tidss->irq_lock);
 
+	ret = tidss_attach_pm_domains(tidss);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to attach power domains\n");
+
 	ret = dispc_init(tidss);
 	if (ret) {
-		dev_err(dev, "failed to initialize dispc: %d\n", ret);
-		return ret;
+		dev_err_probe(dev, ret, "failed to initialize dispc\n");
+		goto err_detach_pm_domains;
 	}
 
 	ret = tidss_oldi_init(tidss);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to init OLDI\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to init OLDI\n");
+		goto err_oldi_deinit;
+	}
 
 	pm_runtime_enable(dev);
 
@@ -203,8 +272,12 @@ static int tidss_probe(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
+err_oldi_deinit:
 	tidss_oldi_deinit(tidss);
 
+err_detach_pm_domains:
+	tidss_detach_pm_domains(tidss);
+
 	return ret;
 }
 
@@ -232,6 +305,8 @@ static void tidss_remove(struct platform_device *pdev)
 	/* devm allocated dispc goes away with the dev so mark it NULL */
 	dispc_remove(tidss);
 
+	tidss_detach_pm_domains(tidss);
+
 	dev_dbg(dev, "%s done\n", __func__);
 }
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index e1c1f41d8b4b..6625b989b815 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -41,6 +41,10 @@ struct tidss_device {
 	/* protects the irq masks field and irqenable/irqstatus registers */
 	spinlock_t irq_lock;
 	dispc_irq_t irq_mask;	/* enabled irqs */
+
+	int num_domains; /* Count of PM domains to be handled */
+	struct device **pd_dev;
+	struct device_link **pd_link;
 };
 
 #define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
