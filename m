Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9BDC7906F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 13:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694E010E030;
	Fri, 21 Nov 2025 12:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="D+nLTCFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011043.outbound.protection.outlook.com
 [40.93.194.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF14710E030
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 12:34:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1/+IKZUfnyS5m+MrQuwpDWbQdjcrWStQSDp6uLDgdsFMeQt5M8+IKCnG073JbnE80pMU13Ug5Jpc/GVUgUVubQ7GWr2Q9lAOv8PLTe1WdHeVk9Yz0TO8/vxb82HbDUtE3YeAwKmOLjV8lRI7OhxnhsoHw0jQsfkY41qz39fLwX53+Vn7swfTGylvbhMj81dT5hq6B9lOfHroqmr/dCjYwSetBy7vJW8MYOyrYQaLfRflOmxYKgi8fsvDychXG83xz5whHo08tTsTBZ7vVcOeWzs08A7y/d3zdrlpQldDWw1/RQ2WZNmBEx7GCJ3/YDHf3fBKNEe+MD0DMwROv6yuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAp2HpwPftxCbVbXXrGhgG8CHJgmE7K+DkriNsujAaQ=;
 b=QC54y9EARb0RHNvffyK/4ZEgmXRaYE7vXLbheXZSyYjOiSDqabwfFzrlozmHncv82Prl7NyXLN9TmaKKcfQ9YhKqtCu77HnPe0nef/OuKENKAZj3fITgsjfIfqN8GhGozAMqw36lwgYY6288K09j1q7oSPB2Xi2lySzSjm1lwUIEUdmnEQfzQmztC9hDRaPXteuXFE6gMrJYq/9BKNwDWyN7rNOnZlA0whyliwHrJmxq7gi6eIYrphugCewibNxKWagHBXiw4hElpCZR0P1vWDzzM4Yda4szFwibnJR9/Xm1X5n5DWtH5iuVICUDSIBAf9Vje2uf0jm3uriTwh80CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAp2HpwPftxCbVbXXrGhgG8CHJgmE7K+DkriNsujAaQ=;
 b=D+nLTCFgV+LkH2ElBkLufPOe9LqfGrAYheHliv15e7uQ/VQ4Xpao3Qy5rgf5mt29X/CoeXM0RZDdUpqPEVGOOfyRluYE6ZYfoMLR1Ivdr3ae53vxGyKkskqEQdUyI50sYXX7l9rmg5VxlT5EjNXZXt5DuKtZYL3hrWB3B12xpwY=
Received: from SJ0PR13CA0061.namprd13.prod.outlook.com (2603:10b6:a03:2c4::6)
 by DS0PR10MB7956.namprd10.prod.outlook.com (2603:10b6:8:1bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 12:34:48 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::e9) by SJ0PR13CA0061.outlook.office365.com
 (2603:10b6:a03:2c4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Fri,
 21 Nov 2025 12:34:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 12:34:47 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 06:34:44 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 06:34:44 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 06:34:44 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALCYb201273539;
 Fri, 21 Nov 2025 06:34:38 -0600
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
 <pthombar@cadence.com>, <nm@ti.com>
Subject: [PATCH v3] dt-bindings: drm/bridge: Update reg-name and reg
 description list for cdns, mhdp8546 compatible
Date: Fri, 21 Nov 2025 18:04:37 +0530
Message-ID: <20251121123437.860390-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|DS0PR10MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: e85b6a97-ffa5-4602-b027-08de28fa5b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jSw5quqd5d5xZP44PCYpKjGihQzWoANLmlvVHF09oxykbD+1Dit3BGxxEQ6K?=
 =?us-ascii?Q?+qWwbOKlmpmoCxEHFMvyqNbEMAFssiuQyNI/zMryw34jbLdCdHO6r8SciNWe?=
 =?us-ascii?Q?hPYdgrxJnRCoCEqpeF+mf23BG9m6w9d180ojsACjT6FzEZX947tNCVDnhiXz?=
 =?us-ascii?Q?Lk1MHc+bj+2VcbXJ2PE/tUMLn99He+Krr91pwFBMaTVp5j7DT5MDT6+yt+Tg?=
 =?us-ascii?Q?s1Hs55r32LNQE3sDNh4tHCAtLVUMVDh+06v459gHxPzDtyALLBadSUgUBEQF?=
 =?us-ascii?Q?H5J3LDCe2WfWJzbui+7PzDCzGs6BLMcsJ7QnUznMFWKCcOVgvwkb70WzNOG4?=
 =?us-ascii?Q?pcCOekN2yOrNRRfUn5Ck5k98bhADIUEDVFB/SJmEIyVBWzw/Dg/A9+pHMNk9?=
 =?us-ascii?Q?IR4AdmJVEd0ybaGrvSWRxroDRH2gVlBLCQA/tm9h3HkOO2PfBrE4nndct2fc?=
 =?us-ascii?Q?vHT/mRfnMWng4bZ7vtrLA/TL+BZ2CeKB2S8lsosdNPzdkLojIpvfObEGWhMV?=
 =?us-ascii?Q?+Dw6GIRMhLxpdXEnPefy+KrDRaHu/G7FYuUpH+pHl+BHs++EaXRyVlYtXj14?=
 =?us-ascii?Q?RgUFPJo3q4setAFguMGJTjTm0v3mda9Csyh/aqAxCtfm33hXPZnrbFEfZNyY?=
 =?us-ascii?Q?O9L8EsthwF9B0hkmDsUZM78iiPWO7zR6yHlJysSiIjJn0N8B8IL0TiK16TfG?=
 =?us-ascii?Q?VLtN7XY1vABiqrQs21M3BiGKdAEq7/sSYzxR0S2onOktm6hSeZa9xr6IxJic?=
 =?us-ascii?Q?hmqIvPkBfXgbxrYG+nk649grvoOHoj5Qhf7jTRibEO3Jiq3y7R6Pb8fAzgcu?=
 =?us-ascii?Q?4eGjQlD0ce75hzgs68dml81ccLMv9sHcAE5BlAkFOozLNy9TVX9H0d+VPN86?=
 =?us-ascii?Q?qWrtYKZa3PbDiGgzsiMCHJY2wDkstUp3TTH4qqS5KnxqWo0OIAEMkHOPWC/I?=
 =?us-ascii?Q?myZAeJRk5V/Rf8deKFpn+MQb4pG4D9FrAsU3/oaWuu94IBA9alYdzjMhOGnI?=
 =?us-ascii?Q?MbsyDIHtr55UCHmJb1wpwIwV9a5wemyXeZzFzzKS/eP5ehwJq+6/LiDX+FvE?=
 =?us-ascii?Q?EybWpHjWEWgmvoETMyK38BWbXLp9qyL+u3fVx3bVmU3raJNZFpGd5sep4JJ2?=
 =?us-ascii?Q?xrUNzJ5cM+Ljx5nCuMjtxELNGw6CAtB9tGFbgcv7z7DxJ8vjN2RoZvQ3Vkxz?=
 =?us-ascii?Q?ZB047hdlxytfkPTbsW55VOSPCd6sQXMF91i96g1xwYxaaYylYrkEToYgKDnk?=
 =?us-ascii?Q?VasvLZxIoCt5NJvFoXav8/A5wN6F555678jC2qGJeeQ3XrBQpQRVjOaqKUD2?=
 =?us-ascii?Q?uLnXkLpTVmzlbeLJjLM1c1DklyeWIBrcx3VCfTDHmb+P1OiVipVmZUB4hLN0?=
 =?us-ascii?Q?PgGZqvJADOEY9MjZB4tNC6gXF7QrfPyhfK2Kr/n0/i+aI9F7keP+4asAnxm6?=
 =?us-ascii?Q?SSw0TJk1Z8bFFWaD71QHjHkP71BPsIIvnYcWpj/Ls4SK6Tc/V8LgWEH1Y4Qa?=
 =?us-ascii?Q?W0KdpKuCtILAStNzhOFQ2CSDYWkcN1vsEcV7UbmWWdc+jple+JZ+ARiO9nHH?=
 =?us-ascii?Q?jkpbNcKGdPY2e2UtrRJZIpVWurnHQWQ5/NSN4/QW?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 12:34:47.4529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e85b6a97-ffa5-4602-b027-08de28fa5b80
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7956
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
compatible. The j721e-integ registers are specific to TI SoCs, so they
are not required for compatibles other than ti,j721e-mhdp8546.

Update reg and reg-names top level constraints with lists according
to compatibles.

Move the register name constraints and reg description list to the
appropriate compatibility sections to ensure the correct register
names are used with each compatible value also adding the DSC register
to make bindings align with what the hardware supports.

Fixes: 7169d082e7e6 ("dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP")
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---

Links to some discussions pointing to need for a fixes patch: 
https://lore.kernel.org/all/20250903220312.GA2903503-robh@kernel.org/
https://lore.kernel.org/all/d2367789-6b54-4fc2-bb7c-609c0fe084d3@ti.com/

Link to v2:
<https://lore.kernel.org/all/20251119122447.514729-1-h-shenoy@ti.com/>

Changelog v2 --> v3:
-Add the reg description list and reg-name list in top level constraints
using oneOf for either of compatible.
Logs after testing some cases: https://gist.github.com/h-shenoy/a422f7278859cd95447e674963caabd9

Link to v1:
<https://lore.kernel.org/all/20251107131535.1841393-1-h-shenoy@ti.com/>

Changelog v1 --> v2:
-Update the reg description list for each compatible and add register space
for dsc to make the bindings reflect what hardware supports although 
the driver doesn't support dsc yet.

Note: j721e-integ are not optional registers for ti-compatible.

 .../display/bridge/cdns,mhdp8546.yaml         | 85 ++++++++++++++-----
 1 file changed, 66 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index c2b369456e4e2..632595ef32f63 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -17,23 +17,45 @@ properties:
       - ti,j721e-mhdp8546
 
   reg:
-    minItems: 1
-    items:
-      - description:
-          Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
-          The AUX and PMA registers are not part of this range, they are instead
-          included in the associated PHY.
-      - description:
-          Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
-      - description:
-          Register block of mhdptx sapb registers.
+    oneOf:
+      - minItems: 2
+      - items:
+          - description:
+              Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
+              The AUX and PMA registers are not part of this range, they are instead
+              included in the associated PHY.
+          - description:
+              Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
+          - description:
+              Register block of mhdptx sapb registers.
+          - description:
+              Register block for mhdptx DSC encoder registers.
+
+      - minItems: 1
+      - items:
+          - description:
+              Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
+              The AUX and PMA registers are not part of this range, they are instead
+              included in the associated PHY.
+          - description:
+              Register block of mhdptx sapb registers.
+          - description:
+              Register block for mhdptx DSC encoder registers.
 
   reg-names:
-    minItems: 1
-    items:
-      - const: mhdptx
-      - const: j721e-intg
-      - const: mhdptx-sapb
+    oneOf:
+      - minItems: 2
+      - items:
+          - const: mhdptx
+          - const: j721e-intg
+          - const: mhdptx-sapb
+          - const: dsc
+
+      - minItems: 1
+      - items:
+          - const: mhdptx
+          - const: mhdptx-sapb
+          - const: dsc
 
   clocks:
     maxItems: 1
@@ -100,18 +122,43 @@ allOf:
       properties:
         reg:
           minItems: 2
-          maxItems: 3
+          items:
+            - description:
+                Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
+                The AUX and PMA registers are not part of this range, they are instead
+                included in the associated PHY.
+            - description:
+                Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
+            - description:
+                Register block of mhdptx sapb registers.
+            - description:
+                Register block for mhdptx DSC encoder registers.
         reg-names:
           minItems: 2
-          maxItems: 3
+          items:
+            - const: mhdptx
+            - const: j721e-intg
+            - const: mhdptx-sapb
+            - const: dsc
     else:
       properties:
         reg:
           minItems: 1
-          maxItems: 2
+          items:
+            - description:
+                Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
+                The AUX and PMA registers are not part of this range, they are instead
+                included in the associated PHY.
+            - description:
+                Register block of mhdptx sapb registers.
+            - description:
+                Register block for mhdptx DSC encoder registers.
         reg-names:
           minItems: 1
-          maxItems: 2
+          items:
+            - const: mhdptx
+            - const: mhdptx-sapb
+            - const: dsc
 
 required:
   - compatible
-- 
2.34.1

