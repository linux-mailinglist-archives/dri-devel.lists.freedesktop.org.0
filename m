Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D387A05B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 01:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E9010F333;
	Wed, 13 Mar 2024 00:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kCNLM9FW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6104410E5C6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 00:55:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h18PV9dsKQh7pxW6qNxAvjafCN/0893JOVAPf5ZCgnPQ4fCmZJddLW2dX//yaSRFL76wcCtu2H1VmZwmEoRXVWFk2JhZZ//0OQeWYRVgLW9DisnwXdC0UISaJOdUeueFhoM/LpzGmUdtXAx/PDaoaBFItj5FTRyoplJvToOYRy6Q+H3tzC9h4UecbOdCNP+Rq+iS+JNg9IU9ZxUzwZqoCgBSoMu5zdDlcvW6218pNInVndZ87UDieRHWe9pZluBn2/T69Dsk7O+SHX9FTO63cckjYW2GhJme68pHzW2SmMUEZr4Pr2jLf9d7p0tpr5NyRq18uPTXaASsdmI4G3bBfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvVwBLMlSU9YWMtY4tx0B3I3ictykDRn2LYjaW7J9Vg=;
 b=CeCYiBacihstSw4WPDjuAzKZPuqasZRdgvxBR/3khSzMqYKm+RiyI0Q4OCEsXS7wMRhWSrcWNgy3KEoVkj3IjJ1OK/aNO35SNjVYG1oRyqxzgj59YtLmOe+U5SaKhByps/M5vR9kXLrpDFN/pBUIW6O4fHitbKsXE70UMK1NxrhOYede0jALGtku4CQu8T4Krjp+KB1pFoogcyY1mvd7ykfbM6c6Q7FaROD94+R+7eVHzRbUlOG1zgU2M+nSahZ94rbgcsc4YZldV4W+azyKDduVbWBuTk77h8BUGgSVCs6fqwN0/M/3CF1n3Mw3EFNFMUGrLRuV4Qm2Xp9aiJ5M8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kwiboo.se smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvVwBLMlSU9YWMtY4tx0B3I3ictykDRn2LYjaW7J9Vg=;
 b=kCNLM9FWGU3xwUxQqXhUP9M2cZvuL86K0yIhhoGD1h2WHU3sBzlBqMsaKy1/cuZg1QBctiOxTsc2MrZmUec/0t0KTpfPli0f+FDBof3KUp5Vh6ZYkW1uwuf9UIdQHABRwx2vkbIKMVxdqFRdiMmrTDrrXHyjBUTwi5MM17lB6Fg=
Received: from CH5P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::27)
 by DS7PR12MB8203.namprd12.prod.outlook.com (2603:10b6:8:e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 00:55:10 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::e8) by CH5P222CA0006.outlook.office365.com
 (2603:10b6:610:1ee::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18 via Frontend
 Transport; Wed, 13 Mar 2024 00:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Wed, 13 Mar 2024 00:55:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 12 Mar
 2024 19:55:05 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 12 Mar 2024 19:55:04 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Tue, 12 Mar 2024 17:54:59 -0700
Subject: [PATCH v2 2/8] drm: xlnx: zynqmp_dpsub: Update live format defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240312-dp-live-fmt-v2-2-a9c35dc5c50d@amd.com>
References: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
In-Reply-To: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB03.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|DS7PR12MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9ba767-5dec-4700-7bf9-08dc42f83ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTFfUv2YaolUmVFDzhBTWLhEBuEqS0kJYpA6KOspzIUmwyPcv8ZaDmUA33eS3KWffbkLq2aqk+T5TaEPrS+t7Pgu385q6fs6ae8+HLdZDpuRpCgWHA8IM/yGWNr7LUxApQ34yEAf1ROlnTcjXlHkm6RPxc1HBfc1SvZW2d8QaPhwnTtj6cF8FNYDEdOc+WkIwSnT/CT8vR/ojjFRpIOKA1pQIs4tjozWozmLEqeqoI2YnBWPQjb5poF5G+0F1KdH3yIYmjJhdg5KRjOgdzH66aftBnnmyrbmjgDIkopGvAkDxF0iw6XtaDpR1mWdS5MN0BaGgnxO9v4wnX1lDUii4IQaI8Dpwgg0KpfjBQNTHAr+Rs8lXRG7e3pnwh/GU3Gja5Il9+msk85NdL3ukZVK3zdsscssx1hgXv3gF9+DV8ZCk6wGSEwx1zy6miulIf6rDs4V6MJP62mJlaLnPLICmKO8YaR7VoqR3QeG0h6f3pWJm78Y3roN71ZODqNXV94Qog6BJv7+C5qpce/MQvnIpyfk8bFpT8CCrvZtJ1monovFYdC8zcJftYkOAm+hXkqk/Lk5zuxgqA7dm63APKjqbK+vpVT6/i0guIFxixYbWdZ6xP91nxeanxokBLdktXSzUVIw2hr2rIFIcKC55vfLwDrDxI7REkK30Jec74Vp7n7+v4wU6j57gYcZtZfavboaytLDhY8Uwq4V//Q0ZL8pAswFTahNliif3iaWjp6O35SwPXf9Zcsnz/ZBmv3dh1WNSxYy1PMbXmqbFA+uGBPRXA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(1800799015)(7416005)(376005)(36860700004)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 00:55:09.9362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9ba767-5dec-4700-7bf9-08dc42f83ba8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8203
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

Update live format defines to match DPSUB AV_BUF_LIVE_VID_CONFIG register
layout.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
index f92a006d5070..fa3935384834 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
@@ -165,10 +165,10 @@
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_10		0x2
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_12		0x3
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_MASK		GENMASK(2, 0)
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		0x0
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	0x1
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	0x2
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	0x3
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		(0x0 << 4)
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	(0x1 << 4)
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	(0x2 << 4)
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	(0x3 << 4)
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_MASK		GENMASK(5, 4)
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_CB_FIRST		BIT(8)
 #define ZYNQMP_DISP_AV_BUF_PALETTE_MEMORY		0x400

-- 
2.25.1

