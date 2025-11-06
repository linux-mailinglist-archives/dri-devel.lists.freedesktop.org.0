Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DD2C3B655
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAC110E8DC;
	Thu,  6 Nov 2025 13:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="cBU1ZIZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azhn15011003.outbound.protection.outlook.com [52.102.149.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E3F10E8DD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:47:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fR+uc410mlGxGqfFOilOFt9BqkfXNDfphAB5Va7WbliIiSaEPk21/T67N8H3sr9ya/P8ZvSEUBUowIMjic0/Z1LvPDEDal9HIAX5sDN9cmwPpZWeifJHM4i1spK77irPG4OpeTgXgayK7MhkUXseNAiIUcpHzvIkaS/7O1l488pLzrpiNZPEPlSLY48EgLZw5J7bOaEnY+t6fAUQZVY1ZAttdeLAlmBa+P4Euve14csB040ozT6pHuK0Y71RtzWzWwJE5zmJNDTwvFgXASWrARuiR2MqHIG/1Qr4uAkckqRpRNKxtByG+46YKPWHiqW13rQQwt+z4Hxz5UrC5m6OyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duJDXO+fhq+Rv21gThwiydO2ou+qKnc0zaGOo2+tdHM=;
 b=eBCPZKdtNXEAyM1vf57xoUVWLpDxqVYQvYfE3Q8OtkAOCjL2P01gC73UE6sxFPvqFqd0TS9j936AxvPMrV7ovyGFqFHy0PU68SXUNAz/JD/ZF1SUsHDL1Vy9efQjq+nOcNu8xLA6WJSfO/4E7Rn/ynemZhP63Hoqv847rr1Mg6gvBOD9fu+o478d76/WJLXStuWAHXnn/GguBrDHmXsqhAZRDbHQaROHgeEeiEhQpiJ4mwF/l0yBJf09WMSkQrwpOJAsHzLN3Gc/rmCbqlX2KhfS5+1TVgZAtt+OeGYF6AFWzK0AfLE4R5ZHLB/WNT0krS4mgpbpTxLqxIzy+w4HxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duJDXO+fhq+Rv21gThwiydO2ou+qKnc0zaGOo2+tdHM=;
 b=cBU1ZIZMzWcNlVy7WZDLkZ1xwVoGgoLKLHGVnI2mfQGwbXZsQwRlTxE+CbkZvH34LH5yiMuB9Kfc7N8xp9zsxLADhRoV5/lCMyVh+BuRFwIBRJb/jxKF+VXMAQpt/tPvLZbvmaTYyamQptoXMn310UjE+c7133uNu2ZK/zIexe8=
Received: from BN9PR03CA0799.namprd03.prod.outlook.com (2603:10b6:408:13f::24)
 by SN7PR10MB7047.namprd10.prod.outlook.com (2603:10b6:806:349::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 13:47:17 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::eb) by BN9PR03CA0799.outlook.office365.com
 (2603:10b6:408:13f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Thu, 6
 Nov 2025 13:47:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 13:47:15 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 07:47:11 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 07:47:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 07:47:10 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6DkqDZ1301720;
 Thu, 6 Nov 2025 07:47:05 -0600
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
Subject: [PATCH v2 2/5] dt-bindings: mfd: syscon: Add ti,am625-dss-clk-ctrl
Date: Thu, 6 Nov 2025 19:16:49 +0530
Message-ID: <20251106134652.883148-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106134652.883148-1-s-jain1@ti.com>
References: <20251106134652.883148-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|SN7PR10MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 707ee5cc-ba7b-4cfd-9fd3-08de1d3afef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|376014|34020700016|36860700013|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CWBeH3gAQjWS1cYCjmp6Nr6B+HnSjS+lWZdiZ0jcx0/vfltcbfQRyM1Ck9iv?=
 =?us-ascii?Q?X6OvwupNexSr7BWhyR8ZCHoQR3dAemhhc632qPJonhvuGgKXaaWkAIRv+9Di?=
 =?us-ascii?Q?CHqI9GyQPFkkJpTWYP7s38jqrAdkFOMNp/lklcWlXoD2uECyJjoX0ruk+WUn?=
 =?us-ascii?Q?uckHiXpvg1IvZb6Gh1HmfAVGgTUcFOu3C1z6jvmD46ImZrN18e4hntfzuJjI?=
 =?us-ascii?Q?VKtjL3Ss2usMVSVSJV+fW58fHPtdMzpAGWDm2gDaBFq/tcyCrEI/pNwG/J9d?=
 =?us-ascii?Q?rmo/lOGCwtzmHyRMZ7h+tBxgvviXkLwELWYW6Jy+iVwVJGoCQWSd34Dke28B?=
 =?us-ascii?Q?hdTOS2EYR685LhO/XFYNvLmMzWHYlik/nXCB40mJS73P6Wd1BT+0Wg4d6hMN?=
 =?us-ascii?Q?dnUT6MfYEyOzHIJ+PZ5tgZWTG5UGDRPTqGMen6mcbHTLXujlSEMoDqhbGgIV?=
 =?us-ascii?Q?Bm7c79ji/wBBbakXEAv0mAvUJCEmBXxOJojR4gkAvd4ZaP1GZ1bxxXLJJvJn?=
 =?us-ascii?Q?ZsFWlAFmC0+WBC1xsRt1ZWWGUw2BnKJg/Qm00u/BSr0ipfFOBvH45U2JxpGd?=
 =?us-ascii?Q?gV8aN9a7dsUZFfVX5TZGnAlhhYO7cdW1tdfizPx5dpSfO0kjhDFwEv/I0DVC?=
 =?us-ascii?Q?HbVzIhLUxxS5k93+UWM2wBbVDjZL5yOrTE6OtaOG2dy5MWM8hmfHU0Gf51Ql?=
 =?us-ascii?Q?83yj1U/7d0Qx6ZjosNOxzH1whJJJnmkGg336YS01JcrBp1I4op5Jeum9Cj0b?=
 =?us-ascii?Q?WIpUotI0aOoM8jF5+WtKSRrLyCuhQWzPI7FbdoTTv28XJ3MZcGmJtkAr0cwf?=
 =?us-ascii?Q?AWYwluzTx576RfhR/JD3j6TTipjnXOyMJWTPnhErpjzelO0Mk2YViKCtsW8D?=
 =?us-ascii?Q?IvC+aPvgSn+dI+C4OY1ibhh7yV9zeq2k5vO1QQM83/nj5SxoAEvYZ5BSQ/ZM?=
 =?us-ascii?Q?+3h7oy5xEYcWH7YbO0pr7TpnFs9dE8NqxyeyB4RvWbTDR8JGT3iZHAHoTKje?=
 =?us-ascii?Q?JmWfbq7KPc7jAQ+IUZnpyxtxe5TQNiS3ZXKnwcizs7yji2kUCSKIxNeQuwxn?=
 =?us-ascii?Q?O2fxMJDF/woVumQ5aFoG29MijxROPHiKPu8+fbQrfy0pG46jGwBUkplIZ/9W?=
 =?us-ascii?Q?rQwZVGcv3U670W618rlcq7G7EINXn5i8SM+egW/gE7iRsy0oZJxovNjrjdP6?=
 =?us-ascii?Q?aRCp3fvsHCI0zM+yT2SAYTUam9Zs/S5H7K4la5iCf0uzNL8fSG2tWnZ3BF6I?=
 =?us-ascii?Q?CN0HtGojFPFYCN+LbN/VzCvPTgI7jfTRLZkl9JoEHlevhAmITGXpd5mv57fj?=
 =?us-ascii?Q?m+UXww5RlpcjrtjcyPaLcIotgDvEFO4Jk6ssB/4nMluBhNpxkgCMN9hGvYr9?=
 =?us-ascii?Q?8HI4rgxWZ8n9aOFZowqRl+QClu3RXzUsy5OoJ5F/V9tghZcO5AjAfMgmfjLf?=
 =?us-ascii?Q?ipttnQy4oZDrnYHrJITwHTgVLxZU9ANvfhsErPIHj0rkS7OjRb3meLkXybDX?=
 =?us-ascii?Q?L8ccHOCMqTPrmVpxCWfCIH7fw0pICYlko4y7WTuwQRFg5IFFxKgoXbPjkf/d?=
 =?us-ascii?Q?ZKP8dXCFq6+Vz36ZtzfYuPG9dRVXoVmyz8Csiq1q?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(34020700016)(36860700013)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:47:15.4901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 707ee5cc-ba7b-4cfd-9fd3-08de1d3afef6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7047
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

The dt-bindings for the multi-function device (mfd) syscon need to include
ti,am625-dss-clk-ctrl. On AM62X, AM62A and AM62P devicess, the display
controller (tidss) has external registers to control certain clock
properties. These registers are located in the device configuration
registers, so they need to be declared using syscon. They will later be
used with a phandle in the tidss node.

Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
Cc: stable@vger.kernel.org
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 657c38175fba..2dace701b9a6 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -123,6 +123,7 @@ select:
           - ti,am62-opp-efuse-table
           - ti,am62-usb-phy-ctrl
           - ti,am625-dss-oldi-io-ctrl
+          - ti,am625-dss-clk-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
@@ -232,6 +233,7 @@ properties:
           - ti,am62-opp-efuse-table
           - ti,am62-usb-phy-ctrl
           - ti,am625-dss-oldi-io-ctrl
+          - ti,am625-dss-clk-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
@@ -260,4 +262,3 @@ examples:
         compatible = "allwinner,sun8i-h3-system-controller", "syscon";
         reg = <0x01c00000 0x1000>;
     };
-...
