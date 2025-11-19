Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0943AC6E39B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 12:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DAF10E5D7;
	Wed, 19 Nov 2025 11:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="wN0JWP6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013063.outbound.protection.outlook.com
 [40.107.201.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7A610E5D7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 11:29:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvam+RqVa+SZiKTPZTNgARi74vv7j2eJuYPKovvPbP8htuj5n/Dq5XTX5Adb5Nkvj8wq3to7UKnjeXEWKAvcGKjX1IocubThrffMp5+KH3IQTGl7Hi6nK5YzWohNxIw4IhhoeU7ZFw4C8gjobYPpXbVOdk/YQcXbkbLcK/M7SCiu9vNWJjeecE3WY6wJx8I7vNcRUIRfOETBYITTOqdwxfGn5H5z3/emxHc/PX3vKwKmyenD+6GF/SjqgkAzMCs3QpYQ0a6Aeyt1Hp9/HMafZ3imWizgnKovyEo50KYVa7IWPnb88MV6R1SRC20mqbO6lVr3viWLUIgHCpHHoApXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaBx7W77mnC/sNdEpkaoSaNod5CY0260wqhfzXSSWEM=;
 b=K4poajWqA0t11dcQvyjnb9IQ9UE2OBpE8F6WzmyJ69rNX1bN01piFf8WJA+PCxj4nhI+3ygjqI2lEwEhRW3+/ELuivHcWB3Mq/TLHZtAcC+ZETGzkXOSVsRm9ho4znTtc6UJnhxUbia6M/+AHW/xvuEx4CtRPU6hwX8L17e2NWty0E/hVPOh6bruS+wqwbdnFiDKltDHiX1SWE32N0OzN2E3XAxV63ytrAtTvVEX2+5fxVLjy533RoOtttHAd0FveI+EFuoiOZOIL9ygvIVDCVzb0rgbqoTQ2rtOZ51lwI5Ea8gsF8Ew7uUKtzdXgbDM+AaBj3kBjz1hLHKNdjbwfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaBx7W77mnC/sNdEpkaoSaNod5CY0260wqhfzXSSWEM=;
 b=wN0JWP6xc+airz/X/ltIcb9UiG89WwBmobF9aoQnNqxvzsI15HW1UUjTH+MjMdaaJfzJQa/UtGQI4W8WSFz8C9a9+h/jwuD56e1RUvmRLjwSQ80gN5VSVgJFJ4wKw3eU9c93WxqYObjB89bqiSmfAKqDrIoEQLfYkbVOR4X24FQ=
Received: from MN0P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::16)
 by DM3PPF5CC7476E1.namprd10.prod.outlook.com (2603:10b6:f:fc00::c2a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 11:29:29 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:52b:cafe::70) by MN0P223CA0010.outlook.office365.com
 (2603:10b6:208:52b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 11:29:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 11:29:27 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 05:29:22 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 05:29:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 05:29:22 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJBTHwi1803780;
 Wed, 19 Nov 2025 05:29:17 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <s-jain1@ti.com>, <h-shenoy@ti.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/bridge: cdns-dsi: Set bridge connector type
Date: Wed, 19 Nov 2025 16:59:16 +0530
Message-ID: <20251119112916.2854262-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|DM3PPF5CC7476E1:EE_
X-MS-Office365-Filtering-Correlation-Id: 921e43e1-13dd-435d-ecc8-08de275ee60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FjvOTSRPLztHzwFzrF50rzOf5SH95MH01uNIeCofLRU9aRfKhnsvuLnNLYwD?=
 =?us-ascii?Q?oyuF3YTzcDZU4cgGAypKLbiyqnKt/58GwXas1qMja5hpatlmzchBAzH9DUhp?=
 =?us-ascii?Q?7CPjeQCEIXatvGSd1KsiwMaAQdMoUoKfaqbCu2nEyEEzlpjG9li7rRbqfKhL?=
 =?us-ascii?Q?f7GLV417wUHB/m9iBIxdOkLqdk5RUk96XSUM7hY5yVcSuJjlq/bQLH5V7s+h?=
 =?us-ascii?Q?UMihO6kOhDl32MYGPOtggH7BySCq5nqz5hplh7Rso0ruEMKfu6pZnHvpa315?=
 =?us-ascii?Q?oeNo0Nov6jaWtvgB8LQevP46mYyb4H83dS3shdV7TzwRozz4JmE0JhF7/SMx?=
 =?us-ascii?Q?GUojVDABvB+q93jHC3j/ozFBOjDHJebzWlTvCz8lFoghXsUgD+gC1jsaOYJ+?=
 =?us-ascii?Q?Ji6vEpNqo4T7/yEl4XO37I12xVM0g9BumbhWCCuvJ4QqX6j4nK352ltWguQY?=
 =?us-ascii?Q?MY24WM43WuqEg/LNtSMlMqJOZEJXZqedVz1uiL2BzTbsnaPmSVgCYMpPNR2D?=
 =?us-ascii?Q?FnXALruz8Nj/K49IFfyo+r1s62JBJU6xHbnT6ofTorflw9OAA8gq1/5QhECZ?=
 =?us-ascii?Q?2isvt3XDo1KDoHfGdxDVZpaGNc5TpDTiHbrfrSaiwrM2Mj6UuXBU/4dUZKqE?=
 =?us-ascii?Q?jCAiInquW+eAtBDZo95dUu7xRBkFCqACGkXILZ0+EcKhwAXXjKJxPoKKKqge?=
 =?us-ascii?Q?VEuGLswBFOxS2weY6fFlHD14yw/V+PEFSPPT8mBBePipk+ynzCWK9lxnNCXE?=
 =?us-ascii?Q?sJqgAZ6sJI2THaRSxlZf2M8c8662ZAgWpdusMws48rfiagztSaBsjX0iYubd?=
 =?us-ascii?Q?3c65FMl2T9kCELcwLD6cUzYx3wJAlqhPQUCaFWiK8g3CfDPZMEthKoAFY8Bb?=
 =?us-ascii?Q?+dRt/ePNtN5qaefhm9E/NhZ5wjToYhrx0Q+A/xgXy5Nt/14HIMXU144xQf2o?=
 =?us-ascii?Q?mWkMpkV3SbaK2p/JqdaQhhHBS6r9JGdnuWe0IuJIJGSdJgLCyCjAHrrnhDeD?=
 =?us-ascii?Q?vyuLibHnKDoNudO4LmU2iOeVLa7/s1leDvLy4cAx/FzDG/4Vtc++tAdJzV8n?=
 =?us-ascii?Q?1tXFA7R4XbbEvFRiiUgPHmy7xLDkFdzZjsKj7BWVVtrS6p+m5oKNgcdjv2cE?=
 =?us-ascii?Q?x9q2+iGmj2Jdj37HUSkaYU0v2GqA2JMitkEXuiLi86CWGWUQsoqHHIF2Mm+e?=
 =?us-ascii?Q?LH33cSDSa3/CgyawUCS1WgNK5OYnyhGofeVtmJfVQ1yuv9gwkZ8XSG5GDHG7?=
 =?us-ascii?Q?ZGjWfN9lfaKO8Mff6F/+hI2JAq7npryp92t0UWO0/zXCgDJe+8FTTWckPsWM?=
 =?us-ascii?Q?aQvJ2YAbbvBDp9Ib8hTbAQvHV2yZoVO3YkrtXhP/PcXfhEdKORyWZZAsPTRa?=
 =?us-ascii?Q?oJBwHTwFEPucdqfponzXiRPd/Cu5uWX7OPnWxrMbNDrU/D7Q2uODc4ejYmVd?=
 =?us-ascii?Q?JGihQsNT4ahiE0o5in7kMYgbY/+TykHB46DGGT9nODdYy9ufVtWHmBOCQxV1?=
 =?us-ascii?Q?7ir1N7w9ga3dQaooxh4EzlBf4r7hZZd+0RzO66Mlnt7eAL7FBSWIao34518s?=
 =?us-ascii?Q?dyGRKYoAKfjWgbqzCWmxREbyP2lKOPJr1JOd6J0h?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 11:29:27.1997 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 921e43e1-13dd-435d-ecc8-08de275ee60b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5CC7476E1
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

Set the bridge connector type to DRM_MODE_CONNECTOR_DSI to properly
identify the DSI connector in the display pipeline.

Without this, the bridge connector type defaults to
DRM_MODE_CONNECTOR_Unknown. Hence, to get correct bridge type set the
bridge connector type to DRM_MODE_CONNECTOR_DSI.

Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 09b289f0fcbf..84b5a0cdf722 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1323,6 +1323,7 @@ static int cdns_dsi_drm_probe(struct platform_device *pdev)
 	 */
 	input->id = CDNS_DPI_INPUT;
 	input->bridge.of_node = pdev->dev.of_node;
+	input->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	/* Mask all interrupts before registering the IRQ handler. */
 	writel(0, dsi->regs + MCTL_MAIN_STS_CTL);
