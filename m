Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F140595A524
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 21:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BAC10E699;
	Wed, 21 Aug 2024 19:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hyeVxLuO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2543210E60A;
 Wed, 21 Aug 2024 19:11:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9PKMy89YXJ/Lr3ja/I3+IfE+lnVsi9kOZmcpS2/UuKz2lLlMBSF4S0DbtRavehPgrP355ipSE8lncZIDeHLgtqVKz+iDiNHE16SWh+4rE6eEgrOA0mEYFrjsq3ZnOWF1X7Do1OY/ZA3jvZU01V9w+wDkZKN/u82SUuI+SEucQalUWHvpjj3i38renRckKZSSHzMiCHqlUawrXBVnrTcfqLxLDKo/MzzqI8T2UTY3v1fO7P7JHQown7Eu8Ty/+LHTygoVTCKyKeLMguDTTP2PBZauEqoK/Jlwlbts/1navdJRMLKQapvSJpRKsLHJdlpB+DmxKWclCwG/02kZ+jlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXZbR5hVCoVRZAkviYGDA0Ei+Af7qU0uM0ZIVZmenwQ=;
 b=Hp7ikBSnSGoIKw4U+uQsMjy4RgUEoTHq+UJ9ZXAUnyI71ZycY6h8b2qLwT5kdIL1rN7DyWMKryqZuXPZa5fQkr//Shu2D+rhEdkanPocOco97npbzmJWcfIH56wDf/Zs0zFv0pUYiFMLASzBYmtZc1B3zSBL4SY2qiIhzef/MVyq9CUK9IY4K9OGUDmMGnvMtRl6DtiEDYuczTIrc+uzHfqW+DSLmROUAK5BYyGobMhlhSJlmxCo0AD8DbJfWmVKgfmCuqp+t7ZTpZzVAmzQPoBw4UItTkiQoVEC7k4OdZUGCg3qnrP8WpYHdsjMgitTxE59MxggElb9UxEImbvy4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXZbR5hVCoVRZAkviYGDA0Ei+Af7qU0uM0ZIVZmenwQ=;
 b=hyeVxLuOtZU1NWdltxFzUMv8EBige2nu0/8Fgo5OF6Er40/Ypl5Y1OZ1M8NoZNDDTqzMYwhwsT3GlCcwpPdWGNTaG+fcU7ekU0b82VPHWyNUtbvHhNDdOwcEaLeyBJqbUWaUOqGsxN9AJvetlewfIzxtKzjH4reSY9aimqfE//0=
Received: from CH0PR03CA0348.namprd03.prod.outlook.com (2603:10b6:610:11a::23)
 by CY5PR12MB6201.namprd12.prod.outlook.com (2603:10b6:930:26::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.29; Wed, 21 Aug
 2024 19:11:52 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::2f) by CH0PR03CA0348.outlook.office365.com
 (2603:10b6:610:11a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Wed, 21 Aug 2024 19:11:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024 19:11:51 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 14:11:50 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Alex Deucher
 <alexander.deucher@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>, "Sam
 Ravnborg" <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <stable@vger.kernel.org>
Subject: [PATCH V3] video/aperture: optionally match the device in
 sysfb_disable()
Date: Wed, 21 Aug 2024 15:11:35 -0400
Message-ID: <20240821191135.829765-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|CY5PR12MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c374806-667d-4ffb-4aad-08dcc2151d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tmGzgOE2aFUjO7RmO9Hx2itIRoNZan0c9NtAhhhwQuEMPivPTCfRy3LAMnnL?=
 =?us-ascii?Q?lgpH/JwA7oSdlTK7e75IrM1grvguTKe2D/OUtN+Zq0LSY9acKF6S/EcH3ny0?=
 =?us-ascii?Q?SlFL+9zZ5Wf0HSw37oCbFajFVag2w6KjMMLBWnaGXK9m7c2Jv7thsjawixUs?=
 =?us-ascii?Q?0hYeVzi0qHvxFa4/a8ioFY+tfHDHgKlLqR9br3yqUB02sR7s/AeP3EOhYWSF?=
 =?us-ascii?Q?J9svlUlMdtx/H9gSmBoIFXFaZqYwrZaPP2Gh77KKGuLZViSQSRNnz627Kud6?=
 =?us-ascii?Q?VgJn3IKW9iBxS//eRqMUtOB0IfVPSQfJqxQzegpoxWPaae6Lbb+AwFeTOsXQ?=
 =?us-ascii?Q?ju9zWRWEMLLkO6fz4IRn7JPcXhOTbp8ELcnMmdM1qsYzOK9V+KPdYwpH9hOk?=
 =?us-ascii?Q?vIEpb/DGQs2kzTUi0jG5hveNOby66bHa1SVwu+re+CpzTNCQFIFThNYfTo3d?=
 =?us-ascii?Q?Lk65j5eHvHdPPbozHbt5PpZ5hAShmbYuq/pZwQQ70+dHhQD6nGgHHIQQG0yP?=
 =?us-ascii?Q?qmHhsyRGyzfR3rROBJx/J91RwdifmxTgAdJm+m5b04LnTDioX6nDrKduZCJ1?=
 =?us-ascii?Q?AIl5gTEcdzSPXefbIKTzLbdOzrnOaJUCLvkYvjQt6ZJg4fn8mxUGY1GEBoM+?=
 =?us-ascii?Q?C08pL8DcsYyGjv6+qPXKrT7KmnuvXYwxN5rb/WuVU7YjU+4GrQ2+UTcI2I0I?=
 =?us-ascii?Q?KnQZq18LJuuhMsJZ28iUU2llJltYHxTV5gEvV+sUcCh2NrRyJxsrkP+VUEwH?=
 =?us-ascii?Q?tgLF0JL9ZzQB5vwvCWH/3B2/Gssz5R2/0EENdoBKhqYoUeGoHoMpVe+nUV05?=
 =?us-ascii?Q?52rYi3PlpbJYjkEHvQrWqzeTPo65lA3G512ObNuipqjQG2iQkwzFjyLILJOK?=
 =?us-ascii?Q?JrS24X2ZYq06BBsO7OfB6ZEOC9f6b4PArdV31FPvDfiijxMnz2NTVObhg2Q7?=
 =?us-ascii?Q?WyNXcEtYgnAMLglBCsEUgy8OGdLeLYBBOwQNqcWqix7yt/v/C/ekdmIr7qjY?=
 =?us-ascii?Q?HjkyCa1hcLkWfaopsCVnYQZ+VlQaw+PBRaoIFa8/4RRl4b0WrIq80wFhmXrn?=
 =?us-ascii?Q?DYrSHlpoA0ir8kdpc5BGl/dS+tP+ZoxcoXe5Brza0AoP0fMYCd1CmX+g97mF?=
 =?us-ascii?Q?nf0VSXpbCJeGO5X8LEKcu0Z0HSxd2t2nr5D4cMCOAOMasVwXuR1n3pifnscu?=
 =?us-ascii?Q?MggD/5O/jgmJTa0yGJmaZC8N34HVcGmmuhk/K0dyHQJ/PXCdJUPdZeWIQcco?=
 =?us-ascii?Q?vD7lE48ynALmpPgVWCNIWCJLGZuPyrejXoKs3JDJPLzZyXi93pIXrOnCuS9a?=
 =?us-ascii?Q?MT/tW9U/24+xSyrDzAVBYIFv5145meLG8UQazTe0FZ1RVfGiKSFjMVBI3q5x?=
 =?us-ascii?Q?mF7KVoAWyNyLm4c8ShobewTqmCSrnUc5pCP9JUJH+9GULH2AX1yaFAsAwdm9?=
 =?us-ascii?Q?NDpqAucJHLX5JiY1zWVOI57EiJ06sRaR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 19:11:51.9395 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c374806-667d-4ffb-4aad-08dcc2151d3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6201
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

In aperture_remove_conflicting_pci_devices(), we currently only
call sysfb_disable() on vga class devices.  This leads to the
following problem when the pimary device is not VGA compatible:

1. A PCI device with a non-VGA class is the boot display
2. That device is probed first and it is not a VGA device so
   sysfb_disable() is not called, but the device resources
   are freed by aperture_detach_platform_device()
3. Non-primary GPU has a VGA class and it ends up calling sysfb_disable()
4. NULL pointer dereference via sysfb_disable() since the resources
   have already been freed by aperture_detach_platform_device() when
   it was called by the other device.

Fix this by passing a device pointer to sysfb_disable() and checking
the device to determine if we should execute it or not.

v2: Fix build when CONFIG_SCREEN_INFO is not set
v3: Move device check into the mutex
    Drop primary variable in aperture_remove_conflicting_pci_devices()
    Drop __init on pci sysfb_pci_dev_is_enabled()

Fixes: 5ae3716cfdcd ("video/aperture: Only remove sysfb on the default vga pci device")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
---
 drivers/firmware/sysfb.c | 19 +++++++++++++------
 drivers/of/platform.c    |  2 +-
 drivers/video/aperture.c | 11 +++--------
 include/linux/sysfb.h    |  4 ++--
 4 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 880ffcb50088..ac4680dc463f 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -39,6 +39,8 @@ static struct platform_device *pd;
 static DEFINE_MUTEX(disable_lock);
 static bool disabled;
 
+static struct device *sysfb_parent_dev(const struct screen_info *si);
+
 static bool sysfb_unregister(void)
 {
 	if (IS_ERR_OR_NULL(pd))
@@ -52,6 +54,7 @@ static bool sysfb_unregister(void)
 
 /**
  * sysfb_disable() - disable the Generic System Framebuffers support
+ * @dev:	the device to check if non-NULL
  *
  * This disables the registration of system framebuffer devices that match the
  * generic drivers that make use of the system framebuffer set up by firmware.
@@ -61,17 +64,21 @@ static bool sysfb_unregister(void)
  * Context: The function can sleep. A @disable_lock mutex is acquired to serialize
  *          against sysfb_init(), that registers a system framebuffer device.
  */
-void sysfb_disable(void)
+void sysfb_disable(struct device *dev)
 {
+	struct screen_info *si = &screen_info;
+
 	mutex_lock(&disable_lock);
-	sysfb_unregister();
-	disabled = true;
+	if (!dev || dev == sysfb_parent_dev(si)) {
+		sysfb_unregister();
+		disabled = true;
+	}
 	mutex_unlock(&disable_lock);
 }
 EXPORT_SYMBOL_GPL(sysfb_disable);
 
 #if defined(CONFIG_PCI)
-static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
+static bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
 {
 	/*
 	 * TODO: Try to integrate this code into the PCI subsystem
@@ -87,13 +94,13 @@ static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
 	return true;
 }
 #else
-static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
+static bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
 {
 	return false;
 }
 #endif
 
-static __init struct device *sysfb_parent_dev(const struct screen_info *si)
+static struct device *sysfb_parent_dev(const struct screen_info *si)
 {
 	struct pci_dev *pdev;
 
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 389d4ea6bfc1..ef622d41eb5b 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -592,7 +592,7 @@ static int __init of_platform_default_populate_init(void)
 			 * This can happen for example on DT systems that do EFI
 			 * booting and may provide a GOP handle to the EFI stub.
 			 */
-			sysfb_disable();
+			sysfb_disable(NULL);
 			of_platform_device_create(node, NULL, NULL);
 			of_node_put(node);
 		}
diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 561be8feca96..2b5a1e666e9b 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -293,7 +293,7 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
 	 * ask for this, so let's assume that a real driver for the display
 	 * was already probed and prevent sysfb to register devices later.
 	 */
-	sysfb_disable();
+	sysfb_disable(NULL);
 
 	aperture_detach_devices(base, size);
 
@@ -346,15 +346,10 @@ EXPORT_SYMBOL(__aperture_remove_legacy_vga_devices);
  */
 int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
 {
-	bool primary = false;
 	resource_size_t base, size;
 	int bar, ret = 0;
 
-	if (pdev == vga_default_device())
-		primary = true;
-
-	if (primary)
-		sysfb_disable();
+	sysfb_disable(&pdev->dev);
 
 	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
 		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
@@ -370,7 +365,7 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 	 * that consumes the VGA framebuffer I/O range. Remove this
 	 * device as well.
 	 */
-	if (primary)
+	if (pdev == vga_default_device())
 		ret = __aperture_remove_legacy_vga_devices(pdev);
 
 	return ret;
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index c9cb657dad08..bef5f06a91de 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -58,11 +58,11 @@ struct efifb_dmi_info {
 
 #ifdef CONFIG_SYSFB
 
-void sysfb_disable(void);
+void sysfb_disable(struct device *dev);
 
 #else /* CONFIG_SYSFB */
 
-static inline void sysfb_disable(void)
+static inline void sysfb_disable(struct device *dev)
 {
 }
 
-- 
2.46.0

