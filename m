Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC916C40114
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 14:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC5A10EABE;
	Fri,  7 Nov 2025 13:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="pp4mOISA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA1910EABE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 13:15:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQO6oFW/fznTRmBOUJ9hyEZLc2bEKhe8Po3XG7SybHEIz2CR3F7LtOK2ZEc3K56IUfCGJzgZp6LMMBtYF6sDlh5p8k6cYYTnx7KO7dl9Rk/wdFXMkoYIp7nWN2hBlBH1urF3nyYoAT/jIwf/tY2PFfIwZBeCe9ukMtUMIVvJDaixfWZdDaB0I7TH6y6Xtyu4u6cmsZyoL52ixzSshLdF0Yjlq8IaSlAw1qIYndt69EpKkqSNcHDoYhnzpTyk1j9FxMaQVxqG5PYsksnfuSoRWyEfFTny108coFEE3gqIY5r7hAOIEka4maCF5NbOgjNlDWuYksWxOI6jtuUtjfDsrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnur47W2Hj5Oc2O6hsEwu9MIE7LahAVQ9oHgH5oQGbc=;
 b=yUW3zQbN/ROzE1d+Aw23VVLIc2dnSPjpf2zI6tGpw/s1JoyxHK7koWkzYHiMWjDabylJnRrqfBDF8Q4YOzo3RUbqDrScpc4o/nzIgU1PFVr6XUlX1rbSdIYJ0uFRhZPcl5rGyqvHj3g+wiULzJXFWNQzFBPDQJzmgATN4PFVkutui32pG9qztXhpOBgDaJAbQrYPBBf7E9GxFj0BjCGyPOfEZDrPr9D9QHkdFVEfPymupBKyj/8UpvKjfvLawj6IO2ug5kqDs0ougmIvbMq2ydbS2M259gkCUc7XMNe+T6Nje+4l6ztpRuz4KuuIQucMB0MxkDIN4g0VWDgvpdkbqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnur47W2Hj5Oc2O6hsEwu9MIE7LahAVQ9oHgH5oQGbc=;
 b=pp4mOISAIzE++t+1Am0Ca/6dhCcxDRv5jApL//zY7cXkd3mSl98iaI0ImbgIvdwomWlk8OI+TZhLDHDLhLeomtWdCfcBnHVkmiCY5myDA1uS0psvLZehNoLaqBNi+7BHsx/0XGPI7JsDXnLH3ZN4Wu++00+U2N8q+RZ6IBuqvgk=
Received: from SJ0PR03CA0221.namprd03.prod.outlook.com (2603:10b6:a03:39f::16)
 by DS4PPF376CF97B3.namprd10.prod.outlook.com (2603:10b6:f:fc00::d13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Fri, 7 Nov
 2025 13:15:46 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::3e) by SJ0PR03CA0221.outlook.office365.com
 (2603:10b6:a03:39f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 13:15:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 13:15:46 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 07:15:42 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 07:15:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 07:15:42 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7DFZKs3021986;
 Fri, 7 Nov 2025 07:15:36 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <robh@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <airlied@gmail.com>, <andrzej.hajda@intel.com>, <conor+dt@kernel.org>,
 <devarsht@ti.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <h-shenoy@ti.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>, <krzk+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <sjakhade@cadence.com>,
 <tzimmermann@suse.de>, <u-kumar1@ti.com>, <yamonkar@cadence.com>,
 <pthombar@cadence.com>
Subject: [PATCH] dt-bindings: drm/bridge: Update reg-name list for cdns,
 mhdp8546 compatible
Date: Fri, 7 Nov 2025 18:45:35 +0530
Message-ID: <20251107131535.1841393-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|DS4PPF376CF97B3:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca42073-fddb-4887-1408-08de1dffc33e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BE8sy9rPgbZBgy9MYM88uQMpRmLxSB9+tDxcQFbq9l9SFoEBSW19uUrgbWwc?=
 =?us-ascii?Q?B+RJl9+7dDcdb5UTHVHeFlmXJIehrYlU/6NxAiGfeOCSr4f7Qn6BuNse16iw?=
 =?us-ascii?Q?c/Xsd3Vry4TuNCFCby0GXRzp6bY8lzs17ErJKl05W3RxCw23bVLpfZGy157O?=
 =?us-ascii?Q?ZMpXadNLCU6haLIWtwQqy4mHWnLIAnhYN+awc2dn2zYYew68I9wklrfeTjAr?=
 =?us-ascii?Q?8fDZ2k/Wgl/M/NT41dZpBLirnDLwuyO7TRwhmlT+WRk9v+o+5Fw0jPbvaEfK?=
 =?us-ascii?Q?/tSf6xfSfLAA7tf3dHLB3reug/emf9LtSjXm7D1VA/Ytd9fxvlTnUflZvQ7Z?=
 =?us-ascii?Q?UQ7MG1ieNPXXMqKnmr+7cALuKq+gonXKBnVdIMk6AtfJlpnhjhPSqJBGPigv?=
 =?us-ascii?Q?TsuerhjZ2GFCWpu4jb49GaoxEj3dncfV/NukMbt3xm/ZHpFzJ/Tl4Ht9PVNZ?=
 =?us-ascii?Q?YaWWHN2lIYUklSoUDQYxeBQGyv1CWLFV87UM4A5uNQcnt7MMgw6VnWlYYO0V?=
 =?us-ascii?Q?3rq75rfzZLOofAl5Fx7TmhTv6HcGoTiisEFYa4fAoO6Nw8ykPDokVnItXS8E?=
 =?us-ascii?Q?uzsj9uWXPVz8L1mvse4uh7CV5wf2sVWS5tI3wZdBfs4gEcukVmlQj0DbD3R2?=
 =?us-ascii?Q?4fp0PeE6ZboKKLD5r1cR6S32wfyuzeNQUaMAqYK7e0H1W3uFNdvfKEdEugEI?=
 =?us-ascii?Q?bxkSMs0BxuOjZ1tHB5L8+6tLlaMrfs0O1JZoxU9UaxooI1PYOQ0NgwmmoMWS?=
 =?us-ascii?Q?HaESkJXy3toVcPqv28MmScdjwSwq/iGlgvE//HfcKp5YxjbEXZwu8B/Itqnl?=
 =?us-ascii?Q?UBJRVWeVv6nSxNZwiO08fcsvC/c17rdLYOqO/VTsy9YdZdGa+d+dVPrpYHam?=
 =?us-ascii?Q?O1itisw57Hv1Mt1H/awk5t9TNLXFFVgL8YNiFNctvPVr9R/A9i1wr49fhNXM?=
 =?us-ascii?Q?bUPkKd4+RcdSubbm28to7dlVdpSBJQWQxlotf3gm+LmlqNLtv+6wUrj5pWnt?=
 =?us-ascii?Q?8q44GF7YkamNyb2vlTpbO7N1HSUhywdUE4Wltn1ntGA+RsQWMJdpAb5xtfeg?=
 =?us-ascii?Q?FJzMiqfqwoOr6ySCGlzjKbKdNwBDIMh5V5YI4jfzWhES6CFNlly1F7Ebbkto?=
 =?us-ascii?Q?e0qL1Ou7cbvI5OgD9vKhCrYr1G8QzdZci3i3laBreoq+oPKhjyHYlr4oiECh?=
 =?us-ascii?Q?rxyGiQKl01GPjzsAxZlbe167e5470XJAiG4BfKETpE2ag1hxXkm9cPoaMiy4?=
 =?us-ascii?Q?248RkOBjo8+lX6H+AFxudKkuaMS5PHBzu02+y3wy3Trd1EfJwp7ud+XLqOu3?=
 =?us-ascii?Q?q6F7heCQWsWlXM0/vf9fezWvMK8FYyG3kK1K3GPpxspIYN+jKsx+mLrObF2D?=
 =?us-ascii?Q?9BcgsWsnVW0736uCmLrOx1yWoh31FslPbXxM0dRcgZjE7KJy43Cti+mEWjBP?=
 =?us-ascii?Q?cZJTFhLy8X+IiHLjp3lPzmaWNSaiPwog39+4HYvegpqXFpxvNEJXT2X1rU66?=
 =?us-ascii?Q?uN+yKVkql6rDVQDgnsphHUMlbSXAd8fhqrrikgXvhDmXX9uwXS8a1kPCm1el?=
 =?us-ascii?Q?rMoIdsenhHjukrFzbRn4bjjqJQx0naNAZ3LicJob?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 13:15:46.1556 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca42073-fddb-4887-1408-08de1dffc33e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF376CF97B3
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

Remove j721e-intg register name from reg-name list for cdns,mhdp8546
compatible. The j721e-intg registers are specific to TI SoCs, so they
are not required for compatibles other than ti,j721e-mhdp8546.

Move the register name constraints to the appropriate compatibility
sections to ensure the correct register names are used with each
compatible value.

Fixes: 7169d082e7e6 ("dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP")
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---

Links to some discussions pointing to need for a fixes patch: 
https://lore.kernel.org/all/20250903220312.GA2903503-robh@kernel.org/
https://lore.kernel.org/all/d2367789-6b54-4fc2-bb7c-609c0fe084d3@ti.com/

 .../bindings/display/bridge/cdns,mhdp8546.yaml      | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index c2b369456e4e2..2fdb4f7108ed5 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -30,10 +30,6 @@ properties:
 
   reg-names:
     minItems: 1
-    items:
-      - const: mhdptx
-      - const: j721e-intg
-      - const: mhdptx-sapb
 
   clocks:
     maxItems: 1
@@ -103,7 +99,10 @@ allOf:
           maxItems: 3
         reg-names:
           minItems: 2
-          maxItems: 3
+          items:
+            - const: mhdptx
+            - const: j721e-intg
+            - const: mhdptx-sapb
     else:
       properties:
         reg:
@@ -111,7 +110,9 @@ allOf:
           maxItems: 2
         reg-names:
           minItems: 1
-          maxItems: 2
+          items:
+            - const: mhdptx
+            - const: mhdptx-sapb
 
 required:
   - compatible
-- 
2.34.1

