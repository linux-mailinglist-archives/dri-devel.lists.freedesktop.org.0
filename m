Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F7C63A21E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 08:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DB810E1EA;
	Mon, 28 Nov 2022 07:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2040.outbound.protection.outlook.com [40.107.8.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CFB10E1E8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 07:38:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2VThmoU3gGDP6SEuebpih/lCnzaYRL/qehwanVpgmejAuHe22J33kwYL24pMqrP2/KclpDfhW1WyxTiSetTD8g4t6c5+c8/7rQQxJr3k9n/NmoKSaZ9zDX+ZJT4eOoFwOPSX78PF2t5ICpj9CbWccX619dEl63uyZKCPSXfFvbPZM4B6jjAMa8LpYt9zAKRk0/5Ci/qnACk0pN3xYhBvMRfAZUz4FtgvuRzd9ajEMjUo5cksICd6W0zKUGmzs4/+SVf/lMT8+7j0B89B0H87XgLYz40RwDj3RvBoAruB5Frzk6NsFx+1JJPFX6P57Qcsp30YQbST8mKFX+i05UgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h64WEwofDgq+ctHjuTVJnHdzfiMCL6SDnIf+E60KxDA=;
 b=J+hyg7GLHEIgQjgya/zejx6WlXt8cz8piwKzs6hVFvLhUdqgf1pnBEJjoH/G3/LMNk4lGAY5ONNheo4lDxD3Qev1doRdvB0968XY6Zwe4DwMWeOMnRmO+GSEzYF91T0+0YDuuXJ3OE6EBIMJpja55/RBMIapvQht372gik7x/jeix7mYPQ65+B70SiBYE19ljvIneTzOBSkC7rR+0pY8iSY695pDNfg1ZuMG+R3VUodha5t0pV/AUooAQeO7IFGqaK6T43UyBXsYBft8xxsXQeGQ4AKgroFVI7+IskFXv2zBqGMBAnPDbAecF3YJjQ0FOcUrCnSUuCHcHiDE1FUViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h64WEwofDgq+ctHjuTVJnHdzfiMCL6SDnIf+E60KxDA=;
 b=qq06rJHLftwwYqnipYR0NLZrDbFTpRpbj/xbcayxeaFuPDuY6k/qRWacuUjEsmcLkDXZD42cRZSNVigsp8KTLoe7f6bA0QE9Ck7WQy83+6J1rafyIxGka6P2MhqbzO5WYbuD39iCPf/+5FIrWFVW9c+/Ey+lrdhtb1wIJAXtjAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB9511.eurprd04.prod.outlook.com (2603:10a6:20b:44b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.15; Mon, 28 Nov
 2022 07:38:38 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400%6]) with mapi id 15.20.5857.022; Mon, 28 Nov 2022
 07:38:38 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v5 07/10] dt-bindings: phy: Add Cadence HDP-TX DP PHY
Date: Mon, 28 Nov 2022 15:36:15 +0800
Message-Id: <beb1dae2a08595a6b9a6b6028ac994faa207d4bd.1669620155.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669620155.git.Sandor.yu@nxp.com>
References: <cover.1669620155.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c77c4c-b339-4c3f-4407-08dad1139025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8O0cM+IvDORKk1zxHaTIOmAWoSJu5Ykd34wsabP82be2VGvLOV+pG4zzQKdkQt7jC3uSqqqTfx5vsNwX4deI+qzpEFxdv9naYZcs1egG9KtFt8aMucedemmquZhDPOMMXrenVqkis5cyjzLMg1rWSi+D/4tA7Aq5JOfMW+nAXUoO1X0JDQWuGgDwisjyy43z56J6s7ZYb5qtZWFWCTXXPPAdyfSNchZBy5Hdf9wUNQauFD/XDsOuiNBXYTssY8EhNi7zU3Z21Ojy+iCMnrpn84SrgsWy75tJFM5Cl9bbMIqqrdgAjtsJcE6hJVBdnRs3JmtxiSuSnLW8sdZtCOVAoL+B+AX9nWRN9STp7W1yWb1Cmr0q4oxrD2G30foUAM+UsZrTOH7nDeNSS23XM9whzh8aBjHAdaymEwmhrvxRl1gD+CiJzsc/SczPzj1fVIr1PXs0TPrDYe7XC7c1mW0zebAfWQDz+k0d7e2Vf/Dx3RDpXwA1Qh9osALsA9CfuIFUbuQElyaCtJiAQUDHZuHYrc0Ag04BRUf4BNFEVreJankfBQQmVcYN4x56+bstUeBzYJRfAGMKBPm7Ryv68GPq0a56ctQepeXMKM4ICS0+tdIj7QVWHHi+NcOqRt6WCmdtaEEMbGGrY1imkjG/HWq3yLp804RKPkeYPQ0btddVNj7GXIBiCasXWKk9QnjM2rxtQqXj4kEAEHh4WBMmPHZDPeZx9Jt2qzZ/ro1zz5F8Ma+edowWAoX5IkbxNfl5DI++aUc1K3UnlK3edetJq6vRlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199015)(26005)(66556008)(921005)(38350700002)(86362001)(38100700002)(5660300002)(8936002)(8676002)(4326008)(7416002)(186003)(316002)(2616005)(66946007)(66476007)(2906002)(83380400001)(478600001)(6666004)(52116002)(966005)(6506007)(6486002)(41300700001)(6512007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Y0y1fvU/+1DT68LSUen6vnQHd4RfFX2y+I2L1oNalZ4SyAnY2bXcjrBz2bZ?=
 =?us-ascii?Q?OrVugmaeqvnjo/pihIhPr+p1eiun7zzqMMW3/q8Ueds0bSRqvWvfh4mRfZWh?=
 =?us-ascii?Q?w8ZX7hc8RxGO0okLOoOrsreWoQkohaMtl7IfSU7QymXX2wJgTPeoVCHvZ3pf?=
 =?us-ascii?Q?tCVAD8jdce/4bp43+Gm1iGqGm3ac9zptOkwRP5zqYRtzurAVKZ34R5QKLeul?=
 =?us-ascii?Q?3x39/9ORglZTi+u/aqOiCpT+d/jFg4BH5T5/Dvon1G2b2Eh954xRq8Pxi7Mr?=
 =?us-ascii?Q?7Lu6EaARVhKw804kKHHFiXal+V/N/8zSrl6qSgyjm4FtNHL9qjUJqyLSNKuW?=
 =?us-ascii?Q?NYht/xC0Tdb5wS6xm9pF8ikCzCM+zvDIpjb5Ih05cHxsPdhoRIWuVJVD81jp?=
 =?us-ascii?Q?ARn3p+/4ggnPxUsVvqZNvlM7ytI/k5gpMzLZyRgqNwtZKunIsD29jwHK51Xx?=
 =?us-ascii?Q?6F3IGQRymkClnwpI2ETXiGrfNNdPmlDSo4jnMqCNnFDUjD8HvFPjHRwnapZB?=
 =?us-ascii?Q?WAQWGbAnwOexYNTbb2FSI5xcTEB5kI1ALfJXZ85e09R3kuzJfUbfc/IFRfQA?=
 =?us-ascii?Q?ByTmJrrMVT8TCIHdiEaRkqUDUr/1fnfFCeHLYfpWqOebCL9OzzqlKrcbMXKk?=
 =?us-ascii?Q?1TUQcsn9VsPYSqdz+yOVhHYBjooR5k7wMRXcsBtXmd6AF9gv21CKjjnGOyGW?=
 =?us-ascii?Q?zdfuXuE9zt/82F7NuTLuBUvmvpjEpLhgX2G6z6jvCWlL28iEBJpU/Mlnf1Vw?=
 =?us-ascii?Q?X85cvb/0oySgvou+CAZzqGGGOQXJJL/zaLjAJXyrRx5foTE7l+ut1r4SQp/f?=
 =?us-ascii?Q?tRkgm/HPlW17t6ya2yhBng8qXyz7DWZYWjNoHFrmEb3Z0DsIEPVXWn+uHSh5?=
 =?us-ascii?Q?lkDJgIcCAki4fKbNqeHZL8HFPPu9jeCRFwSHuDkfpJJd/QPkAIF33A4lcxTO?=
 =?us-ascii?Q?U+6fnJhUIPybqcjDZEw183I4ZwRow6eqUxeUJqVdPT3b+fBSTjxIo8DytA2u?=
 =?us-ascii?Q?mf6SZhhgJbb6HfGYi2yeXiojXHl/3/z5AYLdXqr/TQSROu+cBlhCgs4BYE/m?=
 =?us-ascii?Q?hsEN0sEk5Nh9xp4S7pCGVxie1QYHmfnFbEo2rSsZqFPW82E6uu2kM/4gj6Xx?=
 =?us-ascii?Q?Sl4cECmP6I74xcl0jek37qanmLsHT4Y766VJjSpg1X30K7rpS0w8Vx2W0SAt?=
 =?us-ascii?Q?Q8bbVs+PK501goVcaocx+SonwRWXNgy+s84CRjYSYmH2n9fPtBg075F2gO1z?=
 =?us-ascii?Q?T6efK7RKQgft16ucfsfhOk3LAZVY0sJP8Mrz0eiCM0os3PviaMeT7xDAdJQQ?=
 =?us-ascii?Q?sRxm4aT4WBQxNTVesXzO8gAi9nEyy1bVQZ27xdRazAVkLvTMnvpJk68S/F/K?=
 =?us-ascii?Q?RmZmdblLQXgEJdioj7sae3VE8sLGJhcSAZc0MvRFZ5Mn3uP0rAY8CFnrvoJW?=
 =?us-ascii?Q?Y5dNEAyTtk6zHufZwLxAU4KrymfvOlHnWcv/hZUFImgKV3YRFw0zhCEB3DtB?=
 =?us-ascii?Q?0x9weDoAGOvGNtt4mTqBAvlUg4TfsZ4Zko+MTiNabnP29N5CpnnrdG18iYd2?=
 =?us-ascii?Q?uALZ+O+w4eVJnfWv30xf3FMl+NNyKX4fgpmmcgPd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c77c4c-b339-4c3f-4407-08dad1139025
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 07:38:38.1166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ao/j8VXVGnUrvdZ4Y9ctTR539CMTvIzCzRqmi7BLR3LpY8+GE3rgXUeNGp+pnstrIzU/rVgyebLBxZRE4a9Kmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9511
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
Cc: oliver.brown@nxp.com, Sandor.yu@nxp.com, linux-imx@nxp.com,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Cadence HDP-TX DisplayPort PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../bindings/phy/cdns,hdptx-dp-phy.yaml       | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
new file mode 100644
index 000000000000..f4f741150c12
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cdns,hdptx-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence HDP-TX(HDMI/DisplayPort) PHY for DisplayPort protocol
+
+maintainers:
+  - Sandor Yu <sandor.yu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - cdns,hdptx-dp-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PHY reference clock.
+      - description: APB clock.
+
+  clock-names:
+    items:
+      - const: ref
+      - const: apb
+
+  "#phy-cells":
+    const: 0
+
+  cdns,num-lanes:
+    description:
+      Number of lanes.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3, 4]
+    default: 4
+
+  cdns,max-bit-rate:
+    description:
+      Maximum DisplayPort link bit rate to use, in Mbps
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2160, 2430, 2700, 3240, 4320, 5400]
+    default: 5400
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/phy/phy.h>
+    dp_phy: phy@32c00000 {
+        compatible = "cdns,hdptx-dp-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        clock-names = "ref", "apb";
+        cdns,num-lanes = <4>;
+        cdns,max-bit-rate = <5400>;
+    };
-- 
2.34.1

