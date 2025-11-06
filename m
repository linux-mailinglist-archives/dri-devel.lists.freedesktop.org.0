Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE92C3B98B
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D6710E8EB;
	Thu,  6 Nov 2025 14:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="RwFILzwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azhn15010017.outbound.protection.outlook.com [52.102.138.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6A410E8F1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:12:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzmEmeCcrhdKehbdIKVq0lTRfmZuJEQ/iLEdjEIjIrSaTYwvWuH0Znz20DppDiy4hAfMwXrF5BV6/vAROIs+UFdaLrVY6iRnK7wl8dyUvhimY+0c81Y2Pqb6maMfsTIHIUND71W0UTpuDWEy6H70qfw1yAGbnvYu8KjRrCw08Fwx8MU4sZDuc6hB51pEz6HM+iidjpaaL9uwYXiWY441l62xrBbVum5t6473ICoengO9gSnXeAFXCZHSxSCCJDMxJr3zZTcLOPdOy8hEAcPoh8qDGePm6HgAGdY+Rmr6XLO8ouJdpnLZmoXGSvrvQKavA3+C7JJp6HhKdcx4tSWVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duJDXO+fhq+Rv21gThwiydO2ou+qKnc0zaGOo2+tdHM=;
 b=ZE8tPBiaABivo0uvCUlHIkQdpIIWj1hrBTU9itnSJDeJoxQVKFcFDmb0YcUm5AvLWmnSNviPYz6DhXamCwrXtW+z+NDlrXMPkem/t9usQcMt7eO8scgOTQ2JcGymtcpQPtGEOJULoe/JSkSWd1XqcwqEgEwapyNK8hqBPSX+JQii2kV+zLC4M6SZzAYpC96pICAgmSVkXsDYjKQXe1rGY0ZJ61C4z5BaQgRDKqre9Ad1rNwCl0dj6s0k0lLebIMzv6tlkcIzLn1MkQ9pxQtAWnMKXfMtUGrav/A2JayXk91kEbhPKMxgNvKdW1/DQLfvJHIpTFfhlbxiBuVZmNCmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duJDXO+fhq+Rv21gThwiydO2ou+qKnc0zaGOo2+tdHM=;
 b=RwFILzwfSM5UmucPDYeuGpuaSgiKXEhfDUhBjLFkSdMz5Jto/gkRK/tm4esOKmNZNHbxNI0JGG0E8dQG/K7FDFLnAgiuxgEm+DNLPlMG518hv2ZO1atKmKRwUNf7qu52ZX02KQDGCU1KF3f+6Jao7JDYka33YK73Z2SFOdAe3fw=
Received: from BY3PR10CA0006.namprd10.prod.outlook.com (2603:10b6:a03:255::11)
 by BLAPR10MB4979.namprd10.prod.outlook.com (2603:10b6:208:30d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 14:12:50 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::8c) by BY3PR10CA0006.outlook.office365.com
 (2603:10b6:a03:255::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 14:12:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 14:12:48 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:46 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:45 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 08:12:45 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6ECREP1335893;
 Thu, 6 Nov 2025 08:12:40 -0600
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
Subject: [RESEND PATCH v2 2/5] dt-bindings: mfd: syscon: Add ti,
 am625-dss-clk-ctrl
Date: Thu, 6 Nov 2025 19:42:24 +0530
Message-ID: <20251106141227.899054-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106141227.899054-1-s-jain1@ti.com>
References: <20251106141227.899054-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|BLAPR10MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9bb355-127e-4b1d-faee-08de1d3e9091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|34020700016|36860700013|82310400026|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vw3rw18ycASn+v94codKdA40LzaGrvshAXE+0rCwDToEKkj35hHjqsOdvEcF?=
 =?us-ascii?Q?g8yJpMNVtp+tKmqeLzPu0yQCNxUZeROf128Q4n+ce7f/6GGkjIvFrqnWnG2w?=
 =?us-ascii?Q?0iq8M382BAdFZq4kjg4zqP27ea963VIiUxcoSLN03iK/XfSUyMySMiYdZmRp?=
 =?us-ascii?Q?Jr3igkPTQEGPKZXYlmnvE/1Xs0TrCrm1yiTw7L4ZN92nzyG2SgX0SoILuEXe?=
 =?us-ascii?Q?NDj/q8k0ZC8B6bg7M4b7asOhbooT3UIHXn4Y73Q9pefAqa32BwHyLEhRin+Z?=
 =?us-ascii?Q?O3ujwUHxsiv6x4QH4jUf1iQaLazleUB9DPs/OZkp0NcdD07sJxpeBhI0HT5h?=
 =?us-ascii?Q?txZv7mgzPgc4Pd8yTR59vaf4JPFxgR90wI54jiPWM7gjQ82Gd/MJOskWq3GT?=
 =?us-ascii?Q?Ivlhcx4aIYHFMc5ueksVhxSgwFEAX1tDp9O5H8N+kurD0KfLcoEGk0iciDlw?=
 =?us-ascii?Q?kCDB3h6INYO3AD/p4AglKZAJUvwlOIWeuvCzI04h5orR83s1lCDgrvgrg4aR?=
 =?us-ascii?Q?tprRR38H/3XHe+dtqHteQOtqeq6A+cbt7F//HnG8h2DIoKVtOAAckiTUO/0Y?=
 =?us-ascii?Q?5us7tWTTETUTrjp/O9keQkSeLIBBYD4ywuVfGoua6T5P0Qty9IxFADB5+3z1?=
 =?us-ascii?Q?t9f8rpydRs32noI980J6RvZnEnq/weKm+sRldz2B3hdxdv3JWtNuGMnuIfUR?=
 =?us-ascii?Q?+BNEPS+jvXepP9ATw6GY+/3nMAsqvfsf1vDlWAI3zA6K27zWetG6sUFuJYGY?=
 =?us-ascii?Q?TkxJOcR7qPanfMy3xf0pnNG5xu2/iHI39P0ZgfTK3jdWuEqYlRO2VEsYEtVy?=
 =?us-ascii?Q?7/TEoih0JcT/wSi3/E/gik783UqBilfAzTkFdvn6AtdZAHeLnBMmCIqE4MzR?=
 =?us-ascii?Q?aQANaDV1W7/KUO4qkxEyG8JHk4L0NqnJ1Mo7nVL/5CXnihgEd1E7xqiOo/A8?=
 =?us-ascii?Q?GhfGvYpaA4kHnruhHC/JykQtLf75acK29Cllbxmeok1PRxm8vf64EVJhTKQR?=
 =?us-ascii?Q?lmhYD9dC49QI3y8AJpR53inaNo030YtHVH+5kJiAZSLpzY+54dpimG+ogpy0?=
 =?us-ascii?Q?ueFPlnOurppUiNXAdWWcms1O/1oL8dHt2IkNVgwVUJW6iJLhpgXXHaYE2ijA?=
 =?us-ascii?Q?/F3+53JsM0L94XgDP9i+gxZET5euunOknJqVPLOYue489IcS+nKYPOntTxhY?=
 =?us-ascii?Q?Lugvm64v5jrD4v7ACwuN0Q2hHdxbTbj+cIJnnQtRiq5eho0qf0drG2ZYNbc/?=
 =?us-ascii?Q?4u2JdR7LG2vVCOIFNRJ/9dW1rWrb/ggehwYm7O4/gaiTwQlMu+ap4nzRzppk?=
 =?us-ascii?Q?nO4XWRjmiL6/Uiljeifh+5gxTZ4oT5+esC516qACnLkhvsidEG+zoIyw7XXB?=
 =?us-ascii?Q?tNsaagDXhY6nEAHgSAdpnHOEg/+Ih6p7JbWMW15PzTvjjVhOJ1c0pMrhCNx+?=
 =?us-ascii?Q?FdutkUxVaHMCF3ZrVhTSkLdGsbVT9yopecwBWmkpTRpbfVeJy85jQWU3+Zvf?=
 =?us-ascii?Q?y4EHSQlUtLzHA0Jh/6a6x7En4LBx/2C+YAZBbdoy+42CiGtxux6S+DMDibra?=
 =?us-ascii?Q?Zksvexo9GDtdYAhGtdiMrZlBM5q0r/z8nNJ5In+x?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(34020700016)(36860700013)(82310400026)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:12:48.2502 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9bb355-127e-4b1d-faee-08de1d3e9091
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4979
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
