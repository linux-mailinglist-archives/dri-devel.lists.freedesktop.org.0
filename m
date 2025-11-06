Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32414C3B997
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B59310E8E8;
	Thu,  6 Nov 2025 14:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="OrJp/mhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazhn15012043.outbound.protection.outlook.com
 [52.102.146.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4634910E8E8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:13:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXimBz3I0kdBDnycoL/xfP4QCCj40J1TA7JLQ4EGzI75FqdN6yRyKjW4LOFyDSXl/9M7wz805dlc4u5zXJsasY97Eubq+/y6olGcRNY6qjCynzjXhrtMbCNAPNp7ofsz0gkYfLmIwbjQHJejLEHuLXpZYSCxYPfxafCUtnfgVCUmqAnJ8nHxdnPf3QNvNajxfZC107uEt9Ub+fKC/y3RjqSzXRFT9yBkRpFwe7gT55tLtWl7Y6D447mPbr5NGlTDGo2AGmgcnrzx/fHWipAU4wbKtYK6XI1XkctbF65alue6y19mIJy6/evlS+H2i2WA9oxhNJltVmu0lGdm9IYFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvjQ34tEKk6TlSM12t43K0+W3g5wjGZVzj6ghfXpzOE=;
 b=mD9tqdEBKHP3Uuy/cHu2gJjDG9/VpT7L1eOKBEBjXTEEXowTtxFXdKihGPd0dLIc3kKjxR9gFbtAApF0Cy5ruIDrOxAk1AYZU+dIWKV+GQrXxGjpvBr316/uKUXwyeAGjPK3xp+Rpqp653CpiJ2cDWvJrOuB4Yo2PVaY2LMANKqkk57g7LNegZm+t1AkwKSjTf+Lt7FA9b41jpTNguv27mkvUrWcB4PDrgriKAHog0XwOD/ODBWgBsjZa5tTVcC2B+0yfZbbA1Ko4gxPXpvXAtb43rDACJDSxyK2B+vWzl+Nr6XlKe2OkcIr/NV/zNg3iaxZWTgA/0VBYKTIuJmKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvjQ34tEKk6TlSM12t43K0+W3g5wjGZVzj6ghfXpzOE=;
 b=OrJp/mhHjIWPPPTgsuR5zB9fUzMhnXBIOM+xyST1PYtYDNTu4tO/i/t1tkJ3no4gLDp1rPHoJykD5l6pG4M3oy2lDBEfCzbsjlKaVTditTHKdZ++F4WpHXbM/Zc2GUuLvHvX38Hyr+H2YlVA/ExC4DzTR6+dwavlLVp8mfhqL1M=
Received: from BYAPR08CA0017.namprd08.prod.outlook.com (2603:10b6:a03:100::30)
 by IA1PR10MB6781.namprd10.prod.outlook.com (2603:10b6:208:42b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 14:13:03 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:100:cafe::8b) by BYAPR08CA0017.outlook.office365.com
 (2603:10b6:a03:100::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 14:13:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.0 via Frontend Transport; Thu, 6 Nov 2025 14:13:01 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:58 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 08:12:58 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6ECRER1335893;
 Thu, 6 Nov 2025 08:12:52 -0600
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
Subject: [RESEND PATCH v2 4/5] arm64: dts: ti: k3-am62a-main: Add tidss
 clk-ctrl property
Date: Thu, 6 Nov 2025 19:42:26 +0530
Message-ID: <20251106141227.899054-5-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106141227.899054-1-s-jain1@ti.com>
References: <20251106141227.899054-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|IA1PR10MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 61555a7e-58fd-400a-fac4-08de1d3e98a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|34020700016|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t5+vPqkV7yb7kUbl3KYo+SahJmk4G6AWzasQWicUy6jhYhfno2ChRs/INLub?=
 =?us-ascii?Q?OKzRzWv88crj38klJzlVPdfpJgi+X2P8JGOs7f9tilJYU1FB/7A0Um4Yw+EA?=
 =?us-ascii?Q?S4KLASsSdTpKrwx4q4Cf0Hwh8TE+N9oM28OMHrEyUGO0IIsNWIPvhRKnajbW?=
 =?us-ascii?Q?plm/qMq58o9RNSBp2LPs1c7H0lMKk+anq64KyPtUmrK1QGI3MIXLgVzipv8r?=
 =?us-ascii?Q?KYiCcrBsJ+RtDliCGebL/CtS87ooVCWnUGlE1cTSEjtB+27PbvM7zZXS+9qX?=
 =?us-ascii?Q?BxU27zFhrr8wvTFosPLhkfbPTdQJAAHOGjjmr5p6WOkUqsXbojIgWo3J+CBR?=
 =?us-ascii?Q?lRqhyQx1VyhCF1oxqJ3L6OBpijpX9UnwD3NAqEXqOrQ+iyZUyhuaIZDN9s7v?=
 =?us-ascii?Q?ofQRJTtQ2LZtmj9HO6fyGEUUvjs/cgAm3sQe3R/BDwPg1Tt3Mi68VFYw2mBw?=
 =?us-ascii?Q?wCnFphcOpY+QkuwycX3KfyWVZkPv8s9VmuBkOx5drBYUhOc/HU0D0+6vX931?=
 =?us-ascii?Q?GuQxuU1eXS33m2+sXV+gblZFR7Y4tSnEIdHNQzig1ar/esApluoTihCFGlWD?=
 =?us-ascii?Q?PaMi2vkxExYNgB/tI8fkU14t1DQYR1bHsZV6A16/Bf/USYp4A78aMXAbZ8Ew?=
 =?us-ascii?Q?e0MFU4smVmtfKNUn6v+Ry0chYICmggG9/Hz6+9oYpuMhb/LHRmAAU6i62FPv?=
 =?us-ascii?Q?9gHApboAa0a48RgrUDztVNEBbQy3hkJaNen+qjz3FIg9eNpdv3lOjb055/YZ?=
 =?us-ascii?Q?/ifTil2tgyU8M6uTxDVlSu50NfB94BbjZQIkYF78+wcQsyZigY+WVP9CTPeK?=
 =?us-ascii?Q?BS2f8D7PQPZSiW43Y6aRZPEQSqiGKscqStnnAlGJwwzVQRgpMLSDT4SXhlTJ?=
 =?us-ascii?Q?+Cwpr9z7uRo5OX4yVBWNsBvNMX6k1C3vGectjwWwNnCFS5wRJ4HfU0r2yxaW?=
 =?us-ascii?Q?kGCSOLeC1umZqum5KIV5oNO4m1vGa4sJXEd75LfrikAuQ+tpPReZKwR4/NG/?=
 =?us-ascii?Q?gyapFosnFOinoNWCd3yzRlZ7K2yvTDFChFYnXskUevMxiXj79lEB//NoVQjr?=
 =?us-ascii?Q?cxGNpZ/b6wJMCCTU4L4UfFoAnkY0sSLWGw7Mqn15Rjx37pHcbgVQ7jrKDeWf?=
 =?us-ascii?Q?4Nh5JfLbvtS+c4JomfZBf5q5wm9yLoP66tH76KMlzqIFtBaYzzUC2R1mmLUT?=
 =?us-ascii?Q?CegD3mqb5D6PUeyMeLxNPeGHiWYDXMsrXOeW7zTW9GETb/ceQMvmoFYOllr+?=
 =?us-ascii?Q?x/pcKMMXbFrpu1MswisK2OT9WrigfozZ1Zbxm6MsnrfcDfA/RumSlkv8H8k1?=
 =?us-ascii?Q?whEp+S2OSQaN99W1L6wqz4mwsbH8fOFfxA033NMYsCe4qg8KCdeyEVfnxoE/?=
 =?us-ascii?Q?IVhaDjZkimEupQaws7fvyCJonYq9Qxsg+LQ6zerS6//rzOF1nhVTV3nno3qx?=
 =?us-ascii?Q?Z/5O8raEtTWVhjtxwhZoHaaLUtPzDOO5h1IPsFXgh9YzTxQ1GL6ruONeW6jH?=
 =?us-ascii?Q?VLQGLLP22vJ9KE9yYWHYGqYJRHUfCcxfJrv+kULvqZNP6TMjiqCNxD/28hZW?=
 =?us-ascii?Q?/MCYXZ1uLeNke+kGCNDN6uiz6nPzf+BSPxAfZXPk?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(34020700016)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:13:01.8387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61555a7e-58fd-400a-fac4-08de1d3e98a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6781
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

For AM62A, we need to use the newly created clk-ctrl property to
properly handle data edge sampling configuration. Add them in main
device tree.

Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
Cc: stable@vger.kernel.org
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 9e5b75a4e88e..15a9ee35dbce 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -77,6 +77,12 @@ audio_refclk1: clock-controller@82e4 {
 			assigned-clock-parents = <&k3_clks 157 18>;
 			#clock-cells = <0>;
 		};
+
+		dss_clk_ctrl: dss-clk-ctrl@8300 {
+			compatible = "ti,am625-dss-clk-ctrl", "syscon";
+			reg = <0x8300 0x4>;
+		};
+
 	};
 
 	dmss: bus@48000000 {
@@ -1136,6 +1142,7 @@ dss: dss@30200000 {
 			 <&k3_clks 186 2>;
 		clock-names = "fck", "vp1", "vp2";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+		ti,clk-ctrl = <&dss_clk_ctrl>;
 		status = "disabled";
 
 		dss_ports: ports {
