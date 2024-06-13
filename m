Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B40A90792C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A83910EB2F;
	Thu, 13 Jun 2024 17:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KR4lkfVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DB310EB22;
 Thu, 13 Jun 2024 17:00:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFEneJCtYdW+O6LEUC2s7ijWawimK815ulZ0XcfxJoPEcRoecmqXhaQxOOIezAcPZLqIBqI96pVw+4NOwWROjtqhisZv+Hl+2MbFytpMU2MVTmuisdl+hh6L3ncVDpLqQJ84UJM9RUwgdy/42CHn/wG/fJZC4rR/q9FdZzo5SJl5TRh8UwAO1NhMrXQuIfMUwyeOz4I4ohw2Muf7i5Psz9KmMGg5MV5qizwLf8Eh41rkbjbQbmhtTkaNctM43l1SP9PrdA9udj1I7O7LTaZ9vU6WedfGsBVkQw/1bHv3SQq0tR8Ty72N7rvMtoZYNAWLe+Qn1UdE6jVu9GmZ8cD5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75YrCojF5xB7KCzVHie7EonGAF5wXXnqVg0JOQb07rE=;
 b=UvldcpgUvjQ/cgkxgtbzsMMFZTLy5rkiwmOZhnG6pl284K+FSd+KWRHBBgw10HpaXynTnl+AlJZgmQ3ENtzpGZvGnZYXtHrPY/OCVurce4mFkbNpvtwFAz12bhrKx1bhNK9l00geAky51LvXyupcp5VEaGvsmO5kL4DKM7WDyOb7T5ZPdxX8oxD2d+XTUnIZ9LSyeSJ7/rFriwp11v83RKrL/1ebhxjTU3n7JDYFK2lSo+IUiYhRO4/YYR7LT7/Dv4ZNz/GiGduVqFd2OLxgxos7Z0Q1rDdAu2CcmGqtDgX0m1e4THe0MmwscaWPON6NFkHRJOzkPGzHAFfHh3j4HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75YrCojF5xB7KCzVHie7EonGAF5wXXnqVg0JOQb07rE=;
 b=KR4lkfVWS3DnjBuFWvryo2H7tCFIU/r7XVxeiqOYr6G5EZAy1ZzY+GPhZLH/9d5KPndXXv1sjejSOjlL8aUJNQs80KNpyMVe69n44mVNQ2pCQk7g44s0p16lfKRpYRSSim8MWsfNd/ISGG3VWrVNZ+Fj6kcyDA+LC9pf04r8usShXC7SnEXUmzfFOlkpj8YCkIkUayUhnKWxmGJ8Jz1d8iNx3mhlR32KuTJHzYuFbOeNwSy6nkALoKXKUyFMcn7bd7S5TeJh3P64MEKiS96moXvHVkLKCZ4RrjZhgn+ij+oyLoJ+my5K7+wmIX8geZCUMMWZEArNpH0WgJG6xPSvOg==
Received: from SN7PR04CA0066.namprd04.prod.outlook.com (2603:10b6:806:121::11)
 by MW4PR12MB7238.namprd12.prod.outlook.com (2603:10b6:303:229::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 17:00:17 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:121:cafe::1c) by SN7PR04CA0066.outlook.office365.com
 (2603:10b6:806:121::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:00:02 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:00:00 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 17/21] drm/nouveau/nvkm: move pci pm ops from drm
Date: Fri, 14 Jun 2024 03:00:09 +1000
Message-ID: <20240613170046.88687-18-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240613170046.88687-1-bskeggs@nvidia.com>
References: <20240613170046.88687-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|MW4PR12MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: a02f8748-0598-4377-fbf9-08dc8bca4cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EqJpod7TgksTIOG/ccLtEgEhLUVySVkv6E5ovwMIrm5ZVw3pc4e+IPAH4oT4?=
 =?us-ascii?Q?RO7+vsK6RI1T3RmFJl8hD1ilBkrMvoEttbA1loFKkhT2LlU96Hcyv5hWBKE3?=
 =?us-ascii?Q?jS7bVUaUcH9WGmvTBPQkLibTPf9YtKnRaf1U98TqNG71etJLuU9uYM48rnA1?=
 =?us-ascii?Q?C48ps94Kmi91i3BZ7NDvVEiK2AXbhV374T2fP/dDLiQesEQ6hQgItCb6njAK?=
 =?us-ascii?Q?KRhit2F0tK+NyG+XJPBbmgjgJK92kcfzho5O6sAQxd82uuuOYfYeastS4N53?=
 =?us-ascii?Q?yDJeZCyilvHwr2ZCpBrIgny3faA8P5JdRBSCDvqec+D/FtbK5pHn96VCHnUp?=
 =?us-ascii?Q?+vpIQE2yus7yS1L9xY4Ko/ztjgBVNH6WO6CYOpFtqgW8boJtbd42ZlqtYaBx?=
 =?us-ascii?Q?fLdhbulRSs7Gg8O5c8Hdf+SyJEwU0I76XizHs9IjUJIvzMnyLIVoiZYi9nSM?=
 =?us-ascii?Q?QiNtbZvir3nG2HZbUlBidCOdn0ppPUqrFKYHPkAxVjv5UgpodTd0LpFPeDSv?=
 =?us-ascii?Q?yzvbXOlWwXSQMRbjgWzvYuhzkvy4kcz2BhgZ5roeoISxJu2NcF41j/1COVB5?=
 =?us-ascii?Q?ArlJr3Tch2en9i8gL6xFEDBUzjgFf736sOHwNHA12bUtfhxUrXVg96ClPywY?=
 =?us-ascii?Q?JRqtlf2mnV+hbolB+5M03DKgZ5T30FuZpYre3khZI3THja8V8c8LT/jWKaPY?=
 =?us-ascii?Q?cb+iKjK9XFMPQ78pXD9p4TZmuVLwL62eC3fs0jJqYRHMpuQS0bhVW3BJn7Ch?=
 =?us-ascii?Q?FZErIIhgdHLC77qeonW6Qu/w3XFq8tEa+UbbqNo7UyUnQF8cAE0XpsJwvAvy?=
 =?us-ascii?Q?bXdU63mKhH/S+GPrfsWSpSouptCqF7j8ZJfy8nAiYG2gOpjOjtmojXa2DQw0?=
 =?us-ascii?Q?qBxKHdHFWTEZ3mPantpSdiAKEPCcR0jIL6pJkaHPeqIhv3zzcCH8QQzv+eQi?=
 =?us-ascii?Q?Oq7LEGa0CTHEyERvDFtXxFuQt1WIDAgdAn93DFRktKw3wzM4xhC5OPIGZxkM?=
 =?us-ascii?Q?bS1etY/Rhj162/0Ex5gD2aEIqarqTRZsgyibi4R0d1NW1+kY/a3lEVgprPbU?=
 =?us-ascii?Q?xo28Q0yh8VmjSefQx65a/BhpwqUGncCIUWTnxfYGbEIYUbR3NrYXuHhDSPKK?=
 =?us-ascii?Q?aR0aXRwxMZHnQ/a5kFg31EcY4GwxcT1FSC52GzbCZ2wM6d/xo+OGVy6W+dm+?=
 =?us-ascii?Q?WsA5mSx1vE643uOFu90Afi+6yTR00bYOBpQo+RC7xBbyVXG1kCnnBPDxhF5M?=
 =?us-ascii?Q?ctpqzD/dmWKIWcrMxoX4hN3K0sft5MEro9UbmROFn3cB1FHz7lSMlOyKmw+i?=
 =?us-ascii?Q?jzkbsHxCtL59nMYf2LIFat+eHGG3plxQH37koe5fcErIwqi/3oodEgHHR99E?=
 =?us-ascii?Q?dKQn/N8C3TrbuVGYEl2z+u1icv5H6H3Zs1HP0boIyw+83F1azg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:16.5394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a02f8748-0598-4377-fbf9-08dc8bca4cc2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7238
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

Moves the PCI-specific portions of nouveau_pmops to NVKM, leaving the
DRM pieces where they are.  The NVKM functions are called through the
the nvkm_device_pci_driver struct from DRM for now, but will be fully
separated once the DRM driver is implemented on an auxiliary device.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_acpi.h    |  3 -
 drivers/gpu/drm/nouveau/nouveau_drm.c     | 24 ++-----
 drivers/gpu/drm/nouveau/nvkm/device/pci.c | 76 +++++++++++++++++++++++
 3 files changed, 80 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.h b/drivers/gpu/drm/nouveau/nouveau_acpi.h
index be1b218cb921..b4c7ae78cedc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.h
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.h
@@ -5,13 +5,10 @@
 #define ROM_BIOS_PAGE 4096
 
 #if defined(CONFIG_ACPI) && defined(CONFIG_X86)
-#include <device/acpi.h>
-static inline void nouveau_switcheroo_optimus_dsm(void) { nvkm_acpi_switcheroo_set_powerdown(); }
 void *nouveau_acpi_edid(struct drm_device *, struct drm_connector *);
 bool nouveau_acpi_video_backlight_use_native(void);
 void nouveau_acpi_video_register_backlight(void);
 #else
-static inline void nouveau_switcheroo_optimus_dsm(void) {}
 static inline void *nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector) { return NULL; }
 static inline bool nouveau_acpi_video_backlight_use_native(void) { return true; }
 static inline void nouveau_acpi_video_register_backlight(void) {}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 76eddf172bb5..aa54aee23814 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -901,11 +901,7 @@ nouveau_pmops_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, PCI_D3hot);
-	udelay(200);
-	return 0;
+	return nvkm_device_pci_driver.driver.pm->suspend(dev);
 }
 
 int
@@ -919,12 +915,9 @@ nouveau_pmops_resume(struct device *dev)
 	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
 		return 0;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	ret = pci_enable_device(pdev);
+	ret = nvkm_device_pci_driver.driver.pm->resume(dev);
 	if (ret)
 		return ret;
-	pci_set_master(pdev);
 
 	ret = nouveau_do_resume(drm, false);
 
@@ -973,12 +966,8 @@ nouveau_pmops_runtime_suspend(struct device *dev)
 		return -EBUSY;
 	}
 
-	nouveau_switcheroo_optimus_dsm();
 	ret = nouveau_do_suspend(drm, true);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_ignore_hotplug(pdev);
-	pci_set_power_state(pdev, PCI_D3cold);
+	ret = nvkm_device_pci_driver.driver.pm->runtime_suspend(dev);
 	drm->dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
 	return ret;
 }
@@ -995,12 +984,9 @@ nouveau_pmops_runtime_resume(struct device *dev)
 		return -EBUSY;
 	}
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	ret = pci_enable_device(pdev);
+	ret = nvkm_device_pci_driver.driver.pm->runtime_resume(dev);
 	if (ret)
 		return ret;
-	pci_set_master(pdev);
 
 	ret = nouveau_do_resume(drm, true);
 	if (ret) {
@@ -1008,8 +994,6 @@ nouveau_pmops_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	/* do magic */
-	nvif_mask(&drm->device, 0x088488, (1 << 25), (1 << 25));
 	drm->dev->switch_power_state = DRM_SWITCH_POWER_ON;
 
 	/* Monitors may have been connected / disconnected during suspend */
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
index d454d56a7909..a66cb9d474d5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
@@ -1620,6 +1620,81 @@ nvkm_device_pci_func = {
 
 #include "nouveau_drv.h"
 
+static int
+nvkm_device_pci_pm_runtime_resume(struct device *dev)
+{
+	struct nvkm_device *device = ((struct nouveau_drm *)dev_get_drvdata(dev))->nvkm;
+	struct pci_dev *pdev = nvkm_device_pci(device)->pdev;
+	int ret;
+
+	pci_set_power_state(pdev, PCI_D0);
+	pci_restore_state(pdev);
+
+	ret = pci_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	/* do magic */
+	nvkm_mask(device, 0x088488, (1 << 25), (1 << 25));
+	return 0;
+}
+
+static int
+nvkm_device_pci_pm_runtime_suspend(struct device *dev)
+{
+	struct nvkm_device *device = ((struct nouveau_drm *)dev_get_drvdata(dev))->nvkm;
+	struct pci_dev *pdev = nvkm_device_pci(device)->pdev;
+
+	nvkm_acpi_switcheroo_set_powerdown();
+
+	pci_save_state(pdev);
+	pci_disable_device(pdev);
+	pci_ignore_hotplug(pdev);
+	pci_set_power_state(pdev, PCI_D3cold);
+	return 0;
+}
+
+static int
+nvkm_device_pci_pm_resume(struct device *dev)
+{
+	struct nvkm_device *device = ((struct nouveau_drm *)dev_get_drvdata(dev))->nvkm;
+	struct pci_dev *pdev = nvkm_device_pci(device)->pdev;
+	int ret;
+
+	pci_set_power_state(pdev, PCI_D0);
+	pci_restore_state(pdev);
+
+	ret = pci_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+	return 0;
+}
+
+static int
+nvkm_device_pci_pm_suspend(struct device *dev)
+{
+	struct nvkm_device *device = ((struct nouveau_drm *)dev_get_drvdata(dev))->nvkm;
+	struct pci_dev *pdev = nvkm_device_pci(device)->pdev;
+
+	pci_save_state(pdev);
+	pci_disable_device(pdev);
+	pci_set_power_state(pdev, PCI_D3hot);
+	udelay(200);
+	return 0;
+}
+
+static const struct dev_pm_ops
+nvkm_device_pci_pm = {
+	.suspend = nvkm_device_pci_pm_suspend,
+	.resume = nvkm_device_pci_pm_resume,
+	.runtime_suspend = nvkm_device_pci_pm_runtime_suspend,
+	.runtime_resume = nvkm_device_pci_pm_runtime_resume,
+};
+
 static void
 nvkm_device_pci_remove(struct pci_dev *dev)
 {
@@ -1787,4 +1862,5 @@ struct pci_driver
 nvkm_device_pci_driver = {
 	.probe = nvkm_device_pci_probe,
 	.remove = nvkm_device_pci_remove,
+	.driver.pm = &nvkm_device_pci_pm,
 };
-- 
2.44.0

