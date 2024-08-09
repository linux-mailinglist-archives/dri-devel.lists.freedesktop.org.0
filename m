Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0479A94D2E4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 17:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7328110E947;
	Fri,  9 Aug 2024 15:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UQntnsT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2085.outbound.protection.outlook.com [40.107.101.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DF710E946;
 Fri,  9 Aug 2024 15:03:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gmum4+GBQG80rlASAzIXZR4KT9mVoLeAqlNE/15/ASP4GXvwIsoFBvZEXSAXK+qL5vUpe/7V2ghU1odx5lC20w57YueosNhI03iTXU3NStggctaTa2/CDQ7HMHQY6eQndRuqp+o5I82/4YdiPsBRySHLlYnojTegKrfeU8KyHvAa0giexNtRVlc1y+bR9Hp9ZJ65r+gLaBxVDYwZySIiopfWtqZz8d7XE9GyT8kF73q/Zy5cxA3n9COpv/x7C2A34N9fAg1CKdPWM63hmKwbaFKxCvbIw8b6BRqv6t7mQScn2lHEB2/TsrLYcfISunec5cX2RLN272+v2nRjJ6RmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNdGtTGLYFjQVxvX5ut0IHppu6A7Fgg+hz1WGEZJx9c=;
 b=NgIw0czQF5z836WFgpX+rJ6+z8llWCaFTVKh4h7ePwct8DvmwagfgHLQKubYhpCNX85lAU4sY8b/2hZ98uGYOHKQiad6TLUOKQeCAm2yv3mLBQBqFGrVdhktKoUkx8XlY+uhaIvGQsO0tAG/VPQeECaDNeMe2KvbvEwp1SI5u8SoQHRvsGfGX1BM8JPy4RFFIZtjmeqJckPylkk7sYLCMehAzMxgiAC/CEK0pMV2QcvtFaU+ti4PW3oVbQ0YEn8l3Nf43cNU/NmXteEfHMyAvUU8QyG53vSR3E2RnC40Ko2BpDpM5GJYU/X7n4MkPgK3QW5MqiV0sUbUeHGrtVFPtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNdGtTGLYFjQVxvX5ut0IHppu6A7Fgg+hz1WGEZJx9c=;
 b=UQntnsT//nqAp6R6kIjPYHdLGgHU9iY1yyIASDLFdBOTyCw7L0g1LpZ8fZlTT1/4XYZXpn4mABNlJmF+DMySbJNv+Er177x/ZzNSl74hLCk/yjTLWd3JBU4cy3qWKtrVsYyruB6Ro37M4SeD/KxwlC5RGdf4CHAQqMYAXjr22s0=
Received: from CH2PR12CA0025.namprd12.prod.outlook.com (2603:10b6:610:57::35)
 by BL3PR12MB6570.namprd12.prod.outlook.com (2603:10b6:208:38d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 15:03:47 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::57) by CH2PR12CA0025.outlook.office365.com
 (2603:10b6:610:57::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17 via Frontend
 Transport; Fri, 9 Aug 2024 15:03:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 9 Aug 2024 15:03:46 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 Aug
 2024 10:03:45 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Alex Deucher
 <alexander.deucher@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>, "Sam
 Ravnborg" <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <stable@vger.kernel.org>
Subject: [PATCH] video/aperture: match the pci device when calling
 sysfb_disable()
Date: Fri, 9 Aug 2024 11:03:27 -0400
Message-ID: <20240809150327.2485848-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|BL3PR12MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 42037397-a901-4cff-e3bf-08dcb8847811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BmRTn6HjY2cJYylSZobwdK4ibUnXcXCinW2v+GNZmBQOV/RWEbrb1B2xPQCU?=
 =?us-ascii?Q?bql1pUagHF3uAt10NaDF4RyOcKpLNqslF7aSGf1whyBv5BvoAiH7npr+MBa8?=
 =?us-ascii?Q?PROEsM55WU8mGCBxAKfIny/ods3KD9qqqse+uK1JiPlhLYkArIn2B8pTF1yv?=
 =?us-ascii?Q?sDFiJIlAUZ/MJ/OdmpA57/oKhkRJwDRw8xilnha1XRtw9qACCW9Kr2eO75zq?=
 =?us-ascii?Q?KYNgjI/nKKs9bIjMSXFyfPNSZxwRT3Bnot56CIbaxg8ZJPMbOLG8Eu6v0NmV?=
 =?us-ascii?Q?FC/TPNik1WimLU7N3gVMymXz0iZQJYexZADn3q683oDln9wdfZDLqQnc9EuG?=
 =?us-ascii?Q?OXElrWYHQS1ujZf9hbhG+wfM4iEAUDO+PiLwI4/7659ByVTVi/p9BJXaok8T?=
 =?us-ascii?Q?j6I1c5rMra0jTJyrwJd2u5r2TactkSoSUTHtlrVz7Ij6IHEnWi06U413e+2p?=
 =?us-ascii?Q?BfVi+CWa1mu3Gi1GoAZNEUKKB4NVIu+Kwd6E2RfnVjE0smxWzu+P+z7D1xrI?=
 =?us-ascii?Q?jyfLpT6UHeJ327ZdD9MEV0/vIA5HpDqjWLnEaixPQN63hnSLdKQgUlk7qM9A?=
 =?us-ascii?Q?d9Qa8kzdE+sSmTq+S/HISt4YsA9eJISBSoF5C2oH1488/D3/Drpvk4hViUBq?=
 =?us-ascii?Q?D92F7UvFDepCCB4lnL/9IVVpT/3iMlB1n9ugVJMQFLY9NwKZ+zMvFGsrdHGj?=
 =?us-ascii?Q?0rcTda8HTWuqGu+jh6HwRt0asY7k9f5uycygHiQLLz+XexuH7JCUXOpzgUKf?=
 =?us-ascii?Q?/bHzRYXim1Q3Kca97DFMXSQB9pzY47MXm0cm7y44Jaw75SIXL9lkptZ3kwKX?=
 =?us-ascii?Q?EcKOg75yli8bESYbG39tI7mj1To+7X+BVBl2P89YBedLtkKmXju0DNeNYnd/?=
 =?us-ascii?Q?X5BMiUzyPp2duv11/tHjMsjikWdVGcW8bIKHJMw5Xg7PoGI72UO3d863ovZl?=
 =?us-ascii?Q?vxt1AM7B+cJPn0Bc9sUeZWIF+56VgjhQwhK/ipc74YOCvbpLGJlya7T1zpEa?=
 =?us-ascii?Q?SQpQ5yoWkwcifoaqFQn6IRLim22zkEyjPxa3ECuEmHvVQX6T0ppPFmrob85z?=
 =?us-ascii?Q?xxzWf++lGXpHVrHKdupTVymcTdpoAcEkVg9bEHZYC7Rt/kpZMdzyYM51aKt5?=
 =?us-ascii?Q?1ZOCYokcTbQ4m+Ed1bgAfK7YpRPYXRtS3qDSttZ9hUgdSFNviZ6bUI20W609?=
 =?us-ascii?Q?ZoX/He+/XaknhvSUokbKFKdGToxDh3uZupwTDvrSgxTZ9jmMDoafawP3BlF1?=
 =?us-ascii?Q?iRRz05qAqTdknhN3hkluFgZ9nx1hSaW5FSehn6G7e8R+6Q+BNQvMIjeHk29A?=
 =?us-ascii?Q?4lf0vwYz7ezCt57QF4PE1iTvJdAxr2qwRD4X4sgfjAv7mtbjn69OClhKTbkF?=
 =?us-ascii?Q?7AGwq6EZ/KYEQQTmkOflnRbhYsSw9Gl/vY/fzg/xKSzVeA2NkT4g9QLDpOWE?=
 =?us-ascii?Q?G7SXVvhRy7Ws8XVMXmBL6c4PYG48S3TJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 15:03:46.8462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42037397-a901-4cff-e3bf-08dcb8847811
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6570
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

In aperture_remove_conflicting_pci_devices(), match the pci
device determine whether or not to call sysfb_disable().  This
fixes cases where the pimary device is not VGA compatible which
leads to the following problem:

1. A PCI device with a non-VGA class is the the boot display
2. That device is probed first and it is not a vga device so
   sysfb_disable() is not called, but the device resources
   are freed by aperture_detach_platform_device()
3. Non-primary GPU is vga device and it ends up calling sysfb_disable()
4. NULL pointer dereference via sysfb_disable() since the resources
   have already been freed by aperture_detach_platform_device() when
   it was called by the other device.

Fix this by calling sysfb_disable() on the device associated with it.

Fixes: 5ae3716cfdcd ("video/aperture: Only remove sysfb on the default vga pci device")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
---
 drivers/video/aperture.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 561be8feca96..56a5a0bc2b1a 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -6,6 +6,7 @@
 #include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/screen_info.h>
 #include <linux/slab.h>
 #include <linux/sysfb.h>
 #include <linux/types.h>
@@ -346,6 +347,7 @@ EXPORT_SYMBOL(__aperture_remove_legacy_vga_devices);
  */
 int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
 {
+	struct screen_info *si = &screen_info;
 	bool primary = false;
 	resource_size_t base, size;
 	int bar, ret = 0;
@@ -353,7 +355,7 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 	if (pdev == vga_default_device())
 		primary = true;
 
-	if (primary)
+	if (pdev == screen_info_pci_dev(si))
 		sysfb_disable();
 
 	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
-- 
2.45.2

