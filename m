Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8FCD2F184
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 10:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCA010E849;
	Fri, 16 Jan 2026 09:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="TUr5kwR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazhn15010016.outbound.protection.outlook.com
 [52.102.146.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1A310E848
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYCh//mVwHBPne+0tc0Mj6PNjENHNU2xWBEFhqu/qXW9uNFyrQaF/In70eEryoYohbMQTBUtTSsWSeKlSeEo/7C0FxA+bJrBFGyihqvO8UMrLM4DFkP+ZWuQKFm9E+cF3GTKOtIOaxCcxm7/exuYhsG332xFfvgkFqtSXAAmjJqtyBXx+eiWW/6U+6aOo/rWBm1n31TjiGtkkXHLxKKBZiQv4EXgytv3FWVEWG9HiDFI6B2lrIWHzWJJZJlbQAzUaSCCtL/MC3/9xH+emlBvaX++gDIXARnG6xq3q2dQtdlGedLMUuQM5XEwHaJDHhgbgxWi/fdzPC0PiFK9bwVRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgHQdbm26Z0U9jWSwsQQJ0Bp/3lUnidG4rtaWtKLJ5Q=;
 b=Nt3JwtQ9OtBw10WBj6+nBxXVlMooJJPa2y6LnwxJubgzttUhth9IDANnNMSviZ4beeGCEAOb9oExoFz66XZAFXHscrk+4MToHrB2qrAAAnfOyjBZg4p3HRIy5zEz0j7NQ6lgKRN3qFCW+of8qdtMTQkEe/ceHBX1+Q91efgAVMSh5BCQQ/E4luYFY8qy3ObJGjKtCQJP/3IpkzEMOrGXwtgZUscEC1gTRqb3W9B8dwRktKu0ADGilmv4kXo2gUDSnbGCRfx/NNB8U8whizlJ+IfavQjnSc6kCPa3bm3XEhZT0OmnXZMKNLmdgXvujGQjRAAe+kIQtomwcyq+SL8dzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgHQdbm26Z0U9jWSwsQQJ0Bp/3lUnidG4rtaWtKLJ5Q=;
 b=TUr5kwR31+votQqFVhB7wmyK5JFjrs1Qe7HTOxB75/WxuntKE0q6LQggOXa16hsHKakX1783ugfuc1P+z5EwATgpQS1JOxczrHeibB/gq6GIBUCTgIt9EIGT0m8Nkuz5MmwMLshVrVw6O2yh4OxYHmLp/BjPsMiutQFIrEsSDyQ=
Received: from SA1P222CA0154.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::27)
 by DM3PR10MB7911.namprd10.prod.outlook.com (2603:10b6:0:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 09:54:27 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:3c3:cafe::87) by SA1P222CA0154.outlook.office365.com
 (2603:10b6:806:3c3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.9 via Frontend Transport; Fri,
 16 Jan 2026 09:54:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:54:26 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 03:54:25 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 03:54:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 03:54:25 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60G9s6SV2958972;
 Fri, 16 Jan 2026 03:54:19 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>,
 <mwalle@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>, <s-jain1@ti.com>
Subject: [PATCH v4 2/3] drm/tidss: Power up attached PM domains on probe
Date: Fri, 16 Jan 2026 15:24:05 +0530
Message-ID: <20260116095406.2544565-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116095406.2544565-1-s-jain1@ti.com>
References: <20260116095406.2544565-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|DM3PR10MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: 7983504b-1778-42df-9e1b-08de54e53bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|34020700016|82310400026|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5KTuuao+zn2iJMJGQuwBCmFzAigbw++TYM3vkDugIQ9nH0/S2SudATSNQ+dO?=
 =?us-ascii?Q?CXkck0iW9ApCMlhLl0AtqXUMSThGJ5GQXkhp2/JU3O8ru4DdRdqE3SEDblaL?=
 =?us-ascii?Q?USeMwBMs1n7LNwzMDZc1I0BUrWQ/AwPxKVTqgelF4cCWyV9PH8lKYEVaHRs1?=
 =?us-ascii?Q?txLpQrwc+MwQWu9KaEe2EsuaTqhi28ept4gU+993elBumnomrbXrSaD9IYXw?=
 =?us-ascii?Q?RP0n75dRJr2scXyI+LXUFFlKR6CNHrJvkbIz5Uxc/9dZ4gFpzkGNYIgAcRRf?=
 =?us-ascii?Q?G/l8nysrPTku7F5jzBEMsIxI3hjfbHoKZdGlMo9j8ZEejVFi60Bp0QX6rZ+k?=
 =?us-ascii?Q?21Zs+d2r6dhwdoxqBzDafBVD7ZvY83PAtuAp1DsSb40wSv9w4kg2V3hd5Q6X?=
 =?us-ascii?Q?HcNv4t1aIF4Xj1dc1/raN4K7MJ0RNDzqKQ8MHSNWG6VTNGu9DuDW1HHcKzNl?=
 =?us-ascii?Q?a3rP3A8dIE7+BRh5y80nptxkGaAzO6uh2m/x+K+89AYsvP73Nn9DWC+qQolM?=
 =?us-ascii?Q?mYYWEZV+OCzF3J3C/NlIhsgWNfIVlcJXSIIL9aB4bvb4IfQ7egL50VmNsXYt?=
 =?us-ascii?Q?OzOBR1J6soBFuRcQMYiy8j9Wv9QwdYfnvU1UWd6CoNC3xNlIiltQD0R7fh4V?=
 =?us-ascii?Q?I/mOVOh248ox64TcbaivmHIAh9Rygchxhs+NMzZFDY4UbQsHDawMgRRTOTaZ?=
 =?us-ascii?Q?ZP4WMe1uV15/vtk/JISIPaLltIOHWuazc87p0mIqnzo2flHx7qPMkz3GPRh0?=
 =?us-ascii?Q?K+fZlhfUVHP8/PynK5t4Hojk20Xgq6RkSqfsApUmbAQJEfkQrRWHDo4zhZGI?=
 =?us-ascii?Q?RC02QloXtC4m9N9UDQnaH4cgJ1UW2v8AQ8RyjTy2mQnOvDYMsNLhgO9FmUCN?=
 =?us-ascii?Q?8tJNluOq2McD6xJ6LtNkgu53PAevB+El0n7/7zdND1NauhKRvYRGMT6o15cj?=
 =?us-ascii?Q?Jxk3jfntVvpk8MG3rBEObumRyK3rvTy9oBD3eEZhXWgrljq9apObchGLsd3O?=
 =?us-ascii?Q?PUsG/n4TE5ovoA+/LShbZ/wWgQD/1HwPlMGS4fuvd0ZoBaBO1LGfwCBYtZBo?=
 =?us-ascii?Q?H23pQdPRpq2zHrtDA+cc3ig275zqy6Vo8KWotIY6BQ27uw4d41yEmiVlHDpP?=
 =?us-ascii?Q?lt3H4tDVpq21B75wUly2x+2ylpPyum2Aoccu9bI8M1qaozajo+BCZAUYUR9/?=
 =?us-ascii?Q?5C+c/OptSKDrkZmSrIxFxEMJszcGL8Siqz5Qd1Zw1RfBU2iLzXiSpG0V/JI/?=
 =?us-ascii?Q?Qb6Jdq5d9wpR64ib8IOaluftPv5mCjnKH6zbMoRaICfyjIgrt6NzJ3KXhxir?=
 =?us-ascii?Q?r36iowXqEi6arwbZJLiwKi1ivyouRMnx/jBtQXy/dNSBliowfwQQ+q4TS7z5?=
 =?us-ascii?Q?emCCx8dE4SZWocp8VSgu9kUSXYmRjE/H9o8IJn3Z8/3Jl/PoyQ+ZdHNtgRk6?=
 =?us-ascii?Q?dVvbSmaCtWmIWHtQpAnCGOn9VBPybrU97NTbXdixyVRhbI66c/IKRVVpPITu?=
 =?us-ascii?Q?P8qLKo6SAWZqaAZ3WSfJ3YhzGduBdD7QgCrWEtWnLhF3DACQUnOihoHzu/QL?=
 =?us-ascii?Q?6Tk/3XYFRlHlfDYF9H+IvJ32exaOD/Bqh7PSeFa85noMye7HelewpO260+cT?=
 =?us-ascii?Q?39JuwnVxEASoRCTb6bcMJ/9m5bFcxuHq9+oT7+fG5ovnfRw6MdrYupmezERL?=
 =?us-ascii?Q?8lf3SgVyZ2YRus3ETEKUBp7swVk=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(34020700016)(82310400026)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:54:26.0724 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7983504b-1778-42df-9e1b-08de54e53bd9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7911
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

Tested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
[j-choudhary@ti.com: fix PM call sequence causing kernel crash in OLDI]
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 82 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/tidss/tidss_drv.h |  4 ++
 2 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 1c8cc18bc53c..93e0c34c73aa 100644
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
 
+static void tidss_detach_pm_domains(struct tidss_device *tidss)
+{
+	int i;
+
+	if (tidss->num_domains <= 1)
+		return;
+
+	for (i = 0; i < tidss->num_domains; i++) {
+		if (!IS_ERR_OR_NULL(tidss->pd_link[i]))
+			device_link_del(tidss->pd_link[i]);
+		if (!IS_ERR_OR_NULL(tidss->pd_dev[i]))
+			dev_pm_domain_detach(tidss->pd_dev[i], true);
+		tidss->pd_dev[i] = NULL;
+		tidss->pd_link[i] = NULL;
+	}
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
+	if (tidss->num_domains <= 1)
+		return 0;
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
+		goto err_detach_pm_domains;
+	}
 
 	pm_runtime_enable(dev);
 
@@ -205,6 +274,9 @@ static int tidss_probe(struct platform_device *pdev)
 
 	tidss_oldi_deinit(tidss);
 
+err_detach_pm_domains:
+	tidss_detach_pm_domains(tidss);
+
 	return ret;
 }
 
@@ -232,6 +304,8 @@ static void tidss_remove(struct platform_device *pdev)
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
