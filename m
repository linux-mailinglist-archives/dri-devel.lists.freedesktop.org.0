Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06B4C3B99A
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AD810E8E9;
	Thu,  6 Nov 2025 14:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="dWagYD6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azhn15010055.outbound.protection.outlook.com [52.102.136.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1B510E8E8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:13:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfoPGzPfT8a95eGWZtkLQ6qwFXk12kW1LAqylx8RuG95Jsu8Q71SSmmL8Gq0aV44HW392EGecm+zMV7paTpad4jq9gTM6E/eKCf6HDE2chRiuaYbrqwAoNiC2E53SbHX6eLMsULrJdc4bz1sjpZbuFGzE3zs7mglfDLBjg/I1tqZ1ALG7FdcAIy5mLxymPsaZUahlm12uQX0Rl0Ha79997ELrfq7EeNq/SMTEk7WoDE3ETvfoe+Qk4ZWjvo/SIxSbg1M2deSeko+IHjiWmKt03pna3L3rJovf/CzWPr+VZ4ijRtHsNyRp1n9LAj2TJ7Iqp16Ed2uP2w2rt0QlgmEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niNE352IkGkIrvc5Dyg3+WvbmS/2kObJo6TSjxa1OBs=;
 b=APFjHqAJNnJZd52/S5V18ucrVZJ64GfNSub4Txa06i5dWDH6eeFule96nsV5YhpdXCUWiK0n/UDAVjH8hDqS+Pr1dY/ghwFXx/lw5Gjz4rOJdk8oS4utGwVHlNDe4c1uL9GQIwSL5qUvaBPQdc21BZp9QkBmBjRu5YKRQ/lP6O8p3VvwW49ugF29oUbQSGMtoz/mn+RzjeiVfh2VMV7Xd6hTGsY+bqBZfw6qkubbFOb3xpzuBFu7BnQaB0EPx85JTfj0BqqS2wPIMIXo4DtS22vAo8iu/nZKUpBIA0ODT0HkhFhOmHhljIzu2TgWq0VVdjEn8hDwuhFObN2heVCwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niNE352IkGkIrvc5Dyg3+WvbmS/2kObJo6TSjxa1OBs=;
 b=dWagYD6jcztcp1/Tcr9+uAr6DKgmzfm3Z+JTuZhLlx7RHw0uEXTZ5HjOSeNkHxdizxrTL/nV6kbDRkfRCwze6iUxZWihRQP+D2ekJqfSMJWHN39wCgYabeLVuEOdh4y6Oa4vjcOTIaJE2swmETJQ2LciIse57PxEIRBFkGGLJBE=
Received: from MN0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:52f::27)
 by SJ2PR10MB7583.namprd10.prod.outlook.com (2603:10b6:a03:537::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 14:13:03 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::bd) by MN0PR03CA0020.outlook.office365.com
 (2603:10b6:208:52f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 14:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 14:13:00 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:52 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 08:12:52 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6ECREQ1335893;
 Thu, 6 Nov 2025 08:12:46 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
 <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
 <louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v2 3/5] arm64: dts: ti: k3-am62-main: Add tidss
 clk-ctrl property
Date: Thu, 6 Nov 2025 19:42:25 +0530
Message-ID: <20251106141227.899054-4-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106141227.899054-1-s-jain1@ti.com>
References: <20251106141227.899054-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SJ2PR10MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b717ee-0fa2-4f35-636f-08de1d3e97d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|34020700016|36860700013|7416014|376014|1800799024|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8OPW2CtZ2pWTyEwOUmYq/PHjsEmHic3fwmGohT5S2D+cvDci+47in/fcJk4A?=
 =?us-ascii?Q?mCstN5zpmMBAqTkPPRS7tFptvONImVAhBqFhSN/Nsd9QhgOrBY/dY5f8H1+O?=
 =?us-ascii?Q?3vV7lgiCiq0KBcv3hNVGZW1oQTyjvpuepQJkVVEZ8V2Zjg9t9W/t+qIrJjNQ?=
 =?us-ascii?Q?eQ5amj48Sx8P4iUVuzWxScjfvzFk/odQgDBxMMK6ri3FN2eE6wxTkY6B77pf?=
 =?us-ascii?Q?hDS8MMzCQtIH6khjk7ZG+BBBhJww48m3l8lpc4ufzb29doxVERcnO+oQ0g5C?=
 =?us-ascii?Q?KG3x4ouORpXTULV5BJJHiyOYzIiq60cY4gHR7XZPOUB3dUUg6GGWjcF7NIEu?=
 =?us-ascii?Q?OKrR+AKrNByEZRdR0popIC8uoYw57u9snawnjKucvmI5Ten+kH5+5NO1KF+U?=
 =?us-ascii?Q?fgNHayIg70c0FVtABp+MyQVgOAiOTHNnp/nzeNV56+sO3xBLTCbA5DI6JBKx?=
 =?us-ascii?Q?ErsoTfmKSKcwLuNgSsRXGvTu9bE0vG7oH5/VqpZmUMT6TLBs1X5tFPdJaM1n?=
 =?us-ascii?Q?tYkMcUjFJX519XqCtGgWSVV/hnM7x/OuRJnhBueuXyvqPiVzS3EHcCiUYwzU?=
 =?us-ascii?Q?r3TV+7okE9LZwBLz+3qPF+XFwE5NiOfWfdYNL+YHDHfZy62+L+7CpDSqhckF?=
 =?us-ascii?Q?FG0uTulmcCjfrKnbmUWwz5dK0878n/LEIhjoCP2HsU+n1Ju/qfkF0R9lrhLe?=
 =?us-ascii?Q?k81T8gYCpE8qttLd3SLE14FgY/8bStGd5U6xcW+nqTgm6bcMqkpckx3x31ct?=
 =?us-ascii?Q?RzZ2xJiEDTYIID+psvLNc+T5tVgOgEprBQjiO5MPA/DdcXmIpY2EBf5+jGRm?=
 =?us-ascii?Q?2aHYrjCRxIVxKaln1fWtdBeMo36dPgh2zPOEbIcFE5UTaHRntvRzqunOAIQk?=
 =?us-ascii?Q?SHCDWUKTl/lQuquMRgQXrjQdJc5dtxPx11WUKb1FLbpZoCp2SX1nokC29WNq?=
 =?us-ascii?Q?ph073whE68xNc3bjxWVOnglDpV+ocejZN7UF41I79wXmnW2efnGGqHxGMW0l?=
 =?us-ascii?Q?JZTS+T1RhWPRgRqHyABU0pTsRy0VxHevTU2OObqFdlTBP6LXGrwIUmYJQT+1?=
 =?us-ascii?Q?DviB9qYJBX98sW5X8ETm2qXJOTBaBu5EwXRYEgZbVuJg9xils8faG6lr0vJl?=
 =?us-ascii?Q?4+7Iz36H7SpdE+P5eFv5kwomL6S20tLOXl3SpkzZYqee5yndy2LgKWwR4piN?=
 =?us-ascii?Q?VX+3OA6x/wN8k/22oxw1PmTZSiumwrbuA+xykq2KbQ/xcD47eh8VcbU8wd24?=
 =?us-ascii?Q?cZLMBn6ytYlmxd4sMyy091tn2YU3p/MULhiDPIoJzf0PtZhTaxReiNyZWZYG?=
 =?us-ascii?Q?B+aU1X5seak4fWVabVyGyW2w/wH5wAUCYt9SCl0fA49h3Mg3457R4+ZOrYLx?=
 =?us-ascii?Q?XI3r2rm1xQhQAeqgfJCT69qb3qlZxNep/NeP8AKYG3jewum2I7nZyl5L/FoC?=
 =?us-ascii?Q?ZLdt/lFYmCuv4k/aT7IlDQZQ84jyue5wwF7bLRD7EcAC8exe7TrcIs5BGDQs?=
 =?us-ascii?Q?IVditEhGNm8TSFa3yY1WWEj1UHRbUJiW5MMYafSIjtyYiPnSOnFVlgWCsD/P?=
 =?us-ascii?Q?fuqwto1IrfCYWMSBenbiyFJfjHswp2Sglv2WFgCt?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(34020700016)(36860700013)(7416014)(376014)(1800799024)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:13:00.4654 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b717ee-0fa2-4f35-636f-08de1d3e97d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7583
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

For am62 processors, we need to use the newly created clk-ctrl property to
properly handle data edge sampling configuration. Add them in the main
device tree.

Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
Cc: stable@vger.kernel.org
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index a290a674767b..2b6c033ae393 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -77,6 +77,11 @@ audio_refclk1: clock-controller@82e4 {
 			#clock-cells = <0>;
 		};
 
+		dss_clk_ctrl: dss-clk-ctrl@8300 {
+			compatible = "ti,am625-dss-clk-ctrl", "syscon";
+			reg = <0x8300 0x4>;
+		};
+
 		dss_oldi_io_ctrl: oldi-io-controller@8600 {
 			compatible = "ti,am625-dss-oldi-io-ctrl", "syscon";
 			reg = <0x8600 0x200>;
@@ -801,6 +806,7 @@ dss: dss@30200000 {
 			 <&k3_clks 186 2>;
 		clock-names = "fck", "vp1", "vp2";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+		ti,clk-ctrl = <&dss_clk_ctrl>;
 		status = "disabled";
 
 		oldi-transmitters {
