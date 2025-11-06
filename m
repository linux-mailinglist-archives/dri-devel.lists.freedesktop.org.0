Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1883C3B66A
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1710810E8D2;
	Thu,  6 Nov 2025 13:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="NwG24bTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazhn15011023.outbound.protection.outlook.com
 [52.102.140.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0650F10E8DE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:47:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXx79PA82MyGNHdBwAWZaN1+ID1pZ8gTzVkPS4zqzh2f40VTZ0jBOxGQYeklNWKH/voJP5TSjGAT5nknxpsmXG9xi84QvZT2Aahro88FL5Ubx5n69pD07vhemmEf+a+m1iwB9nYex6JNXfB9XuwB/d3gWcsvk++MZMaLq/XIDeINdzCK/JcBTJkGecj41ERmWKVQVgBGMdA1DiiWgMyFdsKaFyhyRwXO/M1e5ACy5qSr9uKLWzKqx5Yvr6BpoX2bgxbv4+GwBpKvA8FVG5aJKdmFRHMN8pPOWpqT3gCutxq4/VtU7DCHV3fDQR8ojK2bYK2E+fQNwsNo1244J3WXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvjQ34tEKk6TlSM12t43K0+W3g5wjGZVzj6ghfXpzOE=;
 b=GXhISSBXDx/seEJlT8H5TbDr3bE7k2pJE9t7O9XXB1WDE62nsQUJqb2ActcYRuNQJUx+ZwVA5M8hTZnVvMbIMjxK2FgUduiL0f2fEQdsQu2Pd7Y3XvhezvvYgynGn35Oe+7YCbVzwYvU/FoPu2M2NZUax/ZPDf7/bSvgyZuEXaXtthRcNSXOcLNEhvcKAGD6OeeDbmicJX/TUpD7iSwcSmHDJe1F4N94iC8bIqpb1Mmk3i598/fnUh4e6L4URBqms/U6AeecBvbdgafkR/BJxZEfpu0c0/s+FD0EhkOxDftsZrduZyqVD6dXcTgha3Ld2QMprfHMnRFH3NoqtwpV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvjQ34tEKk6TlSM12t43K0+W3g5wjGZVzj6ghfXpzOE=;
 b=NwG24bTINHBZKfbBdvmB5/MmWzQhnsvlzHHbGBanS5WOvpx29gryFjqmiN8Dkl0q8KMAfMUYXCJLCA/J7SqmL35hxeCLVAOVeVevYjO46cTFdOZJC9fyz2BCZKmLEUsNxja7Sip/XC1rS1FweW6mo1cmm9hlvbD2FnP7Y1AZw6Q=
Received: from CH5P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::26)
 by PH0PR10MB4598.namprd10.prod.outlook.com (2603:10b6:510:34::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 13:47:26 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::2f) by CH5P220CA0005.outlook.office365.com
 (2603:10b6:610:1ef::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 13:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 13:47:26 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 07:47:23 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 07:47:23 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 07:47:22 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6DkqDb1301720;
 Thu, 6 Nov 2025 07:47:17 -0600
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
Subject: [PATCH v2 4/5] arm64: dts: ti: k3-am62a-main: Add tidss clk-ctrl
 property
Date: Thu, 6 Nov 2025 19:16:51 +0530
Message-ID: <20251106134652.883148-5-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106134652.883148-1-s-jain1@ti.com>
References: <20251106134652.883148-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|PH0PR10MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0dc3f3-fff2-42a6-378d-08de1d3b0554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|34020700016|36860700013|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LVdbGlBiVGhr3Ixfg+Y1prrL711pWvK14iHkpVR4YlL0J2zlc/PNEGGChXST?=
 =?us-ascii?Q?vhO9pVm97ywy5b8WgM6z/sGQ1Ntcvj6s/ntt8FsS11HGj7Ic1HwgxE9vtj7b?=
 =?us-ascii?Q?vGZj6E961mnVRC87c8ZrdGTOsdH3H9SBZ3QjftIC3kg2SmyxagIm6Jn4V5xW?=
 =?us-ascii?Q?HFwJ56gjUTdusJuA0XIFq0ypRYGXTE6DK1L15PVh2Uqvehjyiodqy8UEBD3w?=
 =?us-ascii?Q?GLdyQ10H3bTiiIUiAnbCVPMAdLqAYFLO8WkuJdzUYYjnI+Y19PkvSKEoxOJw?=
 =?us-ascii?Q?RdyMOQmdDZPZEdJt+fPgYIIXVnerpaZp32mtF3T8Y7DCv+XwGyDvx7UV6jYf?=
 =?us-ascii?Q?rFE8NiLTE1Pp7p6W6h0yv/S9ibMp6Wq1T/Tx9ivew17RaBCoo1Ny8n8FegZN?=
 =?us-ascii?Q?+bOu8CDrM/rXHqEmtpFzAZRPBlfZenzbj5f/W+RGH5YNDkWu8vMMqs0j76Sv?=
 =?us-ascii?Q?6iN7Y6DF9DVl1LZws2GoBAM/3Yy834Cs0AW9d4M6t11luqrfUCE2FocRd05R?=
 =?us-ascii?Q?wDHVTP93Xpyy5Y9K6PC+XHhefQNq4O7p0D+fVmkNpy1F6DdZ5uNbSfD7B61Z?=
 =?us-ascii?Q?KICKPhkUwodPeby+QKQz7ULc58mQ9BUHsvrlYU2ARB87vUO/iTtmHnL37+jT?=
 =?us-ascii?Q?/6lsLTD54KrKDgmRfXoJVlhHMwmevP03Uy7Ygg0OrTiVcf0URMcjy+Od9ucx?=
 =?us-ascii?Q?uFvDXDbPbT1xxQQ0Tu1whvmBcuWZzLDWfALDY7gjiRU+C0dvkyp/s75lN3Uz?=
 =?us-ascii?Q?0gXFJ1DMzdxpOK7KxpfDRWkVUfDElcSWVg8MR4bFBwt1xjbKz/PHQ/V+uzD0?=
 =?us-ascii?Q?tP9TNjpugKncQAOXAOKtArwzr7U7AKaeW6ZOrWt2U2nRZIghdUXyBrPjinPJ?=
 =?us-ascii?Q?IK78kMVW9tskOdxWIAR9kWqjUfcrZz6GDs/pgAnjLstB/Kf/zfOI+H1sFggm?=
 =?us-ascii?Q?SAdRfw/XH/tuplgK2LLCI2Bg2UNrsYb3c76iN0eoW6ENbc0CoNgFIxN3gbdG?=
 =?us-ascii?Q?eXQb0hULecNTpMX/djFrLKlFzclKQTIY/yiyICjJ1ScxPPL2tSH4mirgW6eC?=
 =?us-ascii?Q?XDrCyWHOW3u8Vb47ri+3HWsb/PVeXuI+RvvsZ2apntPHIdW66qjzuorX1aKR?=
 =?us-ascii?Q?36EfnSrXMrCihP6yVMQ+Xfxs23xC57pzmilnQy1jWc7wZCHPxz4EmCAGeTLQ?=
 =?us-ascii?Q?qCLS/+f0YK4Ep8JgKv8cjTGQo+3gSrY0ts3M3MjVxGNdSSoKUmtVEoPvfb6Q?=
 =?us-ascii?Q?Vp4ZXTkp4raHkAkRhZkblG28aF8J+Ki/dWBj2SJVw8BNOZ9pzCUopXW0Lspx?=
 =?us-ascii?Q?HoRmm8fXsHQkAV/zU/f/foUlfNqDHOxgO8HYaPsXwGZ9uCM57RF+0Y8VVZdc?=
 =?us-ascii?Q?9Bv6Dror3LZtEGgwwNoAJrdoT7WxMqXMCrpAabe2siUc4d0JTI33b9NcYvs3?=
 =?us-ascii?Q?yW0ojZyXeuz46cL8dXkqArtRNfhWmlptsDfNfhUO+sMHozJtTIQ+RGGEUBDE?=
 =?us-ascii?Q?mTrVRIlxWPHuhVjiAWTjP+f10fMluFcDIag14R5dzTAw9noYebQsFgX3w6L+?=
 =?us-ascii?Q?RT3g5hR1T3zB/jiPslZQyUcVJlJiV/lZZ4r1EMfp?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(34020700016)(36860700013)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:47:26.1835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0dc3f3-fff2-42a6-378d-08de1d3b0554
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4598
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
