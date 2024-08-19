Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE6957107
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8798D10E289;
	Mon, 19 Aug 2024 16:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NYQl469m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D340F10E289;
 Mon, 19 Aug 2024 16:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSN/jFIjT7gCReo4jC4K6HjeRQVs+XwWMI752dRe88FgMke6bl/NmLmjZAnqjK8vHJLJbqtx/KyTojcmPWUcVeTQGJuJIMOoi3xB5W6Ke1Dt/GsFkbTcPYUdJBGHdl6wMab8ke+eMq3hS9oMsK+dGK/6caNW1oe/D5MWN4JBrLdRKZkfKWQX/Tq1ZePt24BY8nm2hrGq6D72EjaWepRKuRQvdoweyVS/kVRsxy4mbCyqr4tmdL3htYxM+cx0aHhRACS+V8toabyBhVggucE7vdBeEihqsp6S7H5mCGAVX9G0febdo+bhWsqhi+rJpLus3jcfAN2Y0DRO4gEjYcYScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PxLcUwNB8AKLDdmoy9incMyhYZV8myCMN5JNsXnvQI=;
 b=NjzxnUODZNOWIyWc16H5W6d2mFp32DB2CeEr+paWzMdnmCOuD3n1xNQhXapQ3b2ZTGV5dEfUiqtu5ZvAkbAt5JzEviI8rlHH+GD/gb9nuJxVwpPxFAYrGepmAs8Ne1aUFgMk/Am6rm/NJ/wTN4lhImZka91njh5dBoz4SwH2OvPyxDnyaVASP1S/VDkpdoP4BCYqF3P9XPqJlwI9U1eoPQKkpUBvfWFNhfbYB3abUHgRhhOnN3XG68RCxJ1UyawjnwMG1uHKx7+2Ynt+qJTH0xfYMrCi1yFX5I8+H5xlcVni5Nj3NZnYP2Kw6ecoS39/df/2oGnLJGdLzAtqo/l8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PxLcUwNB8AKLDdmoy9incMyhYZV8myCMN5JNsXnvQI=;
 b=NYQl469m0Qbowz8wK+igzUZXkNovtWeUKC8T+yzFK2c4KfDhbNDtcLI623paawKssIXVhuy/OcZH/3ZgSznbihe80U/bTSdr1zfzZG+KDG3DSKczqjM2SUPJWaq9MbbzwQx6ProzB6WcQTqCq9PD7hWE6ABG3kZKlTmHAxQ7yBU=
Received: from DS7PR03CA0185.namprd03.prod.outlook.com (2603:10b6:5:3b6::10)
 by CH3PR12MB8233.namprd12.prod.outlook.com (2603:10b6:610:129::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 16:54:02 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::ec) by DS7PR03CA0185.outlook.office365.com
 (2603:10b6:5:3b6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 16:54:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 16:54:02 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 11:54:00 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Alex Deucher
 <alexander.deucher@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>, "Sam
 Ravnborg" <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <stable@vger.kernel.org>
Subject: [PATCH V2] video/aperture: match the pci device when calling
 sysfb_disable()
Date: Mon, 19 Aug 2024 12:53:41 -0400
Message-ID: <20240819165341.799848-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|CH3PR12MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e63d4a-68a7-4730-07fb-08dcc06f8757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H3tsQu6fgBpaedg1ZudkaUbdkg0xjm8xnTHoFT03CDxO9W5oy2CNEbtu2qGV?=
 =?us-ascii?Q?/ILEpoDRgzOOIVnnOHuVUlBP28o5tcgh/l6da8W7q5JyRyAeoRzs4mPvULOZ?=
 =?us-ascii?Q?WJCSAE8nUE5V7E26+OE65laN4gjcbfdXSnE31n8ZrsHq3QqaNtnmcfifyUsJ?=
 =?us-ascii?Q?EsA0PpWirc/FC3yQdFqbSvkDOif2jlYiB9H00B/nV9ao/wB0hE690JHjqrq9?=
 =?us-ascii?Q?B+AO6UrR6ydyiD6QPPYGv4dheWSGVyJlsWjHQzOZH4YqWHGCCVRhJWdI99RP?=
 =?us-ascii?Q?5SU6T1G6/6rWeFmH9fOsOHcym35JTck+FyeuGB0hDs2hnGO8Ku3KFoNlzo/N?=
 =?us-ascii?Q?WJo0vGAgqZ45wYe+ZXBfQLhIgq0cEyscqxCZFkPoLyqK/5Lo4CiRgtxb4Mf1?=
 =?us-ascii?Q?c6jIly0Pzv0QuwTiXhHyRQYqcgWzVTaauLdqwX/kei2W0Dssb199ZRwe+hkC?=
 =?us-ascii?Q?TP1umYl6iz/niSmlsLErk8qXOn5tW9j05Lkf7BZ20AOJs2KhebOPSZ3x0ESO?=
 =?us-ascii?Q?K+awzp95sCDH62Gk8LZ1YWOf5StCVPDToyWI8o61euW1sWrU+2x8GFnVBqiV?=
 =?us-ascii?Q?1P7o7u7O8m8RfC90PO9wWbm5wuZvyFOgfmidnf/b00rpofgd8258mWZARByK?=
 =?us-ascii?Q?m9RAzwr0Eg1L5PNrxLPLdg/e39qC00SDg2yBVNKRtTPXd7HBmf1QLUjuZeul?=
 =?us-ascii?Q?2T48onvuzwnrXs5EMCZU4LlgBLAX0ChPsAP6pG7xdU7UWeJXgbNRrJYD64tD?=
 =?us-ascii?Q?fuTc4/Y+qdjFb5LIOQDrqYvM2eaYwZUSIoPMpnY4PlzCCvM0fp/Fpt5Mh8if?=
 =?us-ascii?Q?X5rMgSMhiyLo5jI/4KFZQq+lZfWnfFfLW+jj115lLhi+ZK2GXYoqPJzZx7jw?=
 =?us-ascii?Q?ygroTX2BVQFOxbEFqt9e9Zy3FwWly3WA1ua3YohTdwKfw+26+AC1QPmXZKn5?=
 =?us-ascii?Q?hqM2yOcXV4UgvM8BOZe48o4aMvbgL9GVmikn2cSfq+gwzUPQxsr1NqFcYHZ5?=
 =?us-ascii?Q?VJ+yEo1rEPN+/ClaTetB1P87iGvTlVcaujXK1Qku+grvnd9CPytypH3GnVeI?=
 =?us-ascii?Q?ox3jSIWOwSnb4+1z2/fAoOcVukfuxuwAS8gYSGg8yfcf2U0wBg43ksKkTufr?=
 =?us-ascii?Q?evq3JTaF7/qHHe7atsq+F/+xyll2JfQYgdon1bc4gW1ocjyyVKrj1iSqsZzH?=
 =?us-ascii?Q?czDVYxfCIiXAssjSj1fEkUtZXW6LDmoIcAmRNsEvDNx1bihfgq7GuSRlsFNn?=
 =?us-ascii?Q?pfCxuRzYTFyN1YZ8I/ohuf7lTzHyIPmEyu6j1Mh41m7nSdtEaBVWIhp/g7Gw?=
 =?us-ascii?Q?y77jsNvGADLDoEVlcp0EO0Yy2+gqpRf1/Ss90d+lX9sg2xTr2j5+OMzEUC0q?=
 =?us-ascii?Q?XX9b7PdAbadxP4oZjaZOIBitOun8tdbJ05BfqjKXF5eQRmDu31JGcHltoTsL?=
 =?us-ascii?Q?irQ0pfjiKBsEV11gRgle/CfaTBWl4ohz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 16:54:02.3048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e63d4a-68a7-4730-07fb-08dcc06f8757
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8233
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

Fixes: 5ae3716cfdcd ("video/aperture: Only remove sysfb on the default vga pci device")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
---
 drivers/firmware/sysfb.c | 11 +++++++++--
 drivers/of/platform.c    |  2 +-
 drivers/video/aperture.c |  5 ++---
 include/linux/sysfb.h    |  4 ++--
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 880ffcb500887..033a044af2646 100644
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
@@ -61,8 +64,12 @@ static bool sysfb_unregister(void)
  * Context: The function can sleep. A @disable_lock mutex is acquired to serialize
  *          against sysfb_init(), that registers a system framebuffer device.
  */
-void sysfb_disable(void)
+void sysfb_disable(struct device *dev)
 {
+	struct screen_info *si = &screen_info;
+
+	if (dev && dev != sysfb_parent_dev(si))
+		return;
 	mutex_lock(&disable_lock);
 	sysfb_unregister();
 	disabled = true;
@@ -93,7 +100,7 @@ static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
 }
 #endif
 
-static __init struct device *sysfb_parent_dev(const struct screen_info *si)
+static struct device *sysfb_parent_dev(const struct screen_info *si)
 {
 	struct pci_dev *pdev;
 
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 389d4ea6bfc15..ef622d41eb5b2 100644
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
index 561be8feca96c..b23d85ceea104 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -293,7 +293,7 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
 	 * ask for this, so let's assume that a real driver for the display
 	 * was already probed and prevent sysfb to register devices later.
 	 */
-	sysfb_disable();
+	sysfb_disable(NULL);
 
 	aperture_detach_devices(base, size);
 
@@ -353,8 +353,7 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 	if (pdev == vga_default_device())
 		primary = true;
 
-	if (primary)
-		sysfb_disable();
+	sysfb_disable(&pdev->dev);
 
 	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
 		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index c9cb657dad08a..bef5f06a91de6 100644
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

