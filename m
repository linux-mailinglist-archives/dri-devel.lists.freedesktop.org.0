Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EB56211D0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F43C10E445;
	Tue,  8 Nov 2022 13:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2054.outbound.protection.outlook.com [40.107.105.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8899210E43F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 13:02:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXsk1Du5/ifcvdFB8jgVY8+h4JntuI6rKEmF3pSMiX+2NRJWW4CQFkOU6gtoc399equiFnOsIBn2VKx6SqeIM9Ly3JS3SZqVV0DycHapaqughTR1T1Dp4dWwNONl16HzqpeMakVx/UntB5g/BCx5wdnAcn1qYSY+jzzHVsIW5plB/MSwZ705oujDZ5+idElnNN8R0uCx9BjK2IGZjlXEAtd2mlFMzF4FnFJewwoK9xHC8GvzcHZk+O2WjDrOO4pNyoxXgpOaXdUfp7Ibpz43C6iXzRJ2+uvZ19r+78gpt0YFXCQRtbVv7DxGe8LDWY6y+z0trIZt0n8FcooU5xlDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTN7Jc3Zc38GQ3ayKQtixae403E/m/DoU75OgujxD9s=;
 b=hWRQZzWQjMqC46kfEtvGF0KO5WHRYAySAh4VXMoGI3tM5JMP7lV5mdm9wcy7KTt/0UFIE+YBKSD8IINv63N+YzuLlN32WF3SXsgvJOm30aR6XWmsQIChxsrLKw0PAFrSkniaMIbb7K/GSoUuZe0VZeqCl2o+4Ts/6eX028BiOo0WLGKI2pBxWDFt7SCNVHTiCxX8E3gRVTI+rwgRyx4BWDB9Q21MEBILci8FTtgXySpSq2tjPsjZNQLnUlQG/DxVD/5JShNpjaTBJaaKZmZLrOaTzw431NfuYPywHMyIzrSEmV3sVJ8F4PhkukRDysTlt9vtngd70CmV+EiSZGehBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTN7Jc3Zc38GQ3ayKQtixae403E/m/DoU75OgujxD9s=;
 b=kqu71B/jKd63naiqEjsx0rEWfq3Hdyol6aeY/OECfRYhn+r9Jnhq8/uPsbp+Ob2h6KiSQQ/C0c+GkNKb3F6FNcCwxs+LK6I2m/lBb7SKqUaRV4Y6HtcDwC3rUR1Ort9COe5kF90WcwsTrmN1mI3K6eoLIWKDWrJ1FthTwV2W8pc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB7059.eurprd04.prod.outlook.com (2603:10a6:208:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 13:02:19 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%4]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 13:02:19 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, vkoul@kernel.org
Subject: [PATCH v3 07/10] dt-bindings: phy: Add Cadence HDP-TX DP PHY
Date: Tue,  8 Nov 2022 21:00:10 +0800
Message-Id: <31ddc1508e01618db62bb9421d15745d525a6d10.1667911321.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667911321.git.Sandor.yu@nxp.com>
References: <cover.1667911321.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc8cee2-a89d-4bf4-5251-08dac18977a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82ytNwslIbi7sBnY7Eg+bU+WKHxCVsjV8GAaCO5rpm5T1f8am+g7XPfR2mWChtNgBqrONL1S8TXmo/mmoqtrqZRUSt/RCt4cVHeLYAUW33Wla0cRFnx1KxM0YL4OMfUSez+kjJgcrYR/TMothqf9mXs/PdhsEkTZt+6hNIlzkuHTXdkUv9dEKgUznHbNaPachtmO88r/fxHO1xX4HsNYcZRUrvxH/XIMHWYjfWzStXx/onwLON64FYgiP54LHGdEIsBk64V8Rrq3zUug5ZrOCWSgK/RVgwZmd39MFu6Jvj/q3z/ehaa+lKS1YWicmXyFwJsPSFaYke6hNxiBeGq+RaR1lNSNXYG8W0qsnyRcf5Mzg6aNDv6VgaHfSuNrOxXC5brRHfBd2WZo9E3ASmXeFuFrW/Kd9j0QhuCtr1mTE9AP2gtYAUzq6YB0KEMFDLaOV+L2+O8dUyr8udZIoO9t9jn3rIIKzgO96AsuXGfcwduz6JzE2bZjCt2RjUNWCzUFhBi6YF4rOjNcGcAMEAifYFP5zET3C9/fe9Q9MRwhqj1KduhSXSTPc9rGLLYrChfYxbTDoNLGf5SSl5sTIW6xhmPrueYMeUXNn9BFP/gT5AdaPeXaKrQtaoP1azEqFGIch7QFLkP281gPQ+jgfVHbsMGj6fZuNmWtGj3YhZszsILBpCqXMQHF+38GKTbD9YCtn1dAe3GdqFMi7uGXzESnBDxldK+sZdIDGlUYkasVbRko7TvKv4+mk9TlDUwssae3Qq7YBBBjdx8chCtqvYwxTdgJ9qL7Jb2YI5IihoCx46fmj/z36Apx2SJlm+ScKdgF20CldDI8IjeMSLH4ZZHeFRr1SAzr5EUl1fP0J9PQGDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(86362001)(921005)(26005)(6512007)(41300700001)(6666004)(478600001)(38350700002)(2906002)(38100700002)(36756003)(2616005)(8936002)(186003)(7416002)(5660300002)(8676002)(66556008)(966005)(6486002)(4326008)(316002)(66476007)(83380400001)(52116002)(6506007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/8u3ynXW6KasoW+zTwrp/J9yboSQx5A4E4pFNRcpzTgy8oLSyWPh2N2xAWwA?=
 =?us-ascii?Q?1dot05P+NGgNsaL6RFrb1cZvwMooCPTh/OdxrGTdugi0TleqCg3icRbwq+ej?=
 =?us-ascii?Q?yq6dVzYBYnGZz9teN4VgT0sHNfmULiL6RlI31m0eCV8ujC/xpXfkqUaZHmc8?=
 =?us-ascii?Q?Jn0XIo6I5iZjIfnlYm+s9WzPdHGpBYXy5JozM6A3Wa3JLHpUpkgBnur/5E3x?=
 =?us-ascii?Q?cEHqlV9IrmxgtxMLSpnArs2LYHlAkMHb101pTihQKwxabVZ+mdiIHVWSA39s?=
 =?us-ascii?Q?atfvJdeC4MPp2rCtDQD9fr6XoXaAbk/9Pz9P369LrBAcIhKhGTvJ4a7k/V/Y?=
 =?us-ascii?Q?RHoyK9jwObMNf1/0vVWH3/HrUynektcR2Bg/MrCZeueyFfDiisQzvRSYdfCB?=
 =?us-ascii?Q?Judq0v0OSoA2G8JDKxjho/bRGRWAOBeKZcW+QtGr4vl2kUzchFweC9RgrzrA?=
 =?us-ascii?Q?5pkqX2g9STnenL3p5CLUStxi9I8Jp6ZQ1Ulyg44yxTtFa1/65CCotu5RCaea?=
 =?us-ascii?Q?eEtj+9mC0x1SGo1ERaosBiHlvqzdBPje0DabXz8XULHwq0GBf2dGPBTtyRZP?=
 =?us-ascii?Q?geuIn0Lr3JeRUDdH/O1C7tMduefiqIgxMgRcr6TNSOuBi2z+TbQzgaIGp8q0?=
 =?us-ascii?Q?ojxVka7ObeLW6m4Q1eO0cOFXwxuYB0dlqK6GxgziPll8ir8lAiw7kzc5g62i?=
 =?us-ascii?Q?NahKb9anmko5ziiYJIGy3xT1m5QQKgD1SEJzD5v39z6TVWnkh3cQ/iAmq+us?=
 =?us-ascii?Q?v6ZPHmI/f0ZpYXi1D8m6O6OZ3yuBklCGDpgOkNbB9oV8RE6GpF+jKBVs7/j4?=
 =?us-ascii?Q?LBZphslm08o5ifyHwKbTekLYZnc0TjTizqzPQnHnm3dZAFsO8UHR2xV6lma0?=
 =?us-ascii?Q?8e74RutM6u6aChiFNbi71N44Z0pOgEQ+6G9GHWqptWWGuj57+OwuFh9fPsjs?=
 =?us-ascii?Q?+JwC6KP44NitdN74X8u4cGVPzENGdT+aH4n8LjMGYEeB9FqgsnoeZdF+xF6+?=
 =?us-ascii?Q?9EEaejcibivw288JJ7c5xHhshHgYqwFBtNPCJCLf6aDva7F+5D/uLHkuAVPR?=
 =?us-ascii?Q?zRrd5qDlGs+XnjsXtQHE54YtIoRUwm9cv/8WMlfNobSlYapmJBjdtedYyR9n?=
 =?us-ascii?Q?34PxIM9lJkTVzr+37B+Ybf4ofOvJlZTDltohYKKr0AKtry1ZLY+L9mdjDdPL?=
 =?us-ascii?Q?qgBGwogIShAQ+/GxEZtGXXitMX9wuBUJjhJdvAQrkfsoOnT5u7DFtUWlpSJF?=
 =?us-ascii?Q?clD3Y4oNM/S5jfUkFnTF7+quXoPG8aLLUxLdIskLXcLQmMJAMFiKvoRulLD9?=
 =?us-ascii?Q?HJMjZ6WiQpjMcdDuNQelbo2s9HWhweSBOuvFcnigjzCD1EjSX0VH9xyw+Doc?=
 =?us-ascii?Q?HiJcyFv0T6+javDGjc6pk3hx4q+cwGmIesZjQde04ua0oGucwBS6BboFdWv1?=
 =?us-ascii?Q?wlyMFLHS8zFQ1/L8SVkH50v+38shoK/Xe/Ixwfn+R2w5GaOYs4nvi4yFsFT1?=
 =?us-ascii?Q?HNIE380w0gdBhGDzxJMn959Kt7Fzk/SpTppNQDJ5a5vzL3hMEcVig+EgPUBm?=
 =?us-ascii?Q?T1OKrFgNaSc885yKzQl8yikBC5xnNbWO+4X2nl3S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc8cee2-a89d-4bf4-5251-08dac18977a9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 13:02:19.0643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhTDQux4LhdKvIfH8RzgOCdrq5oZhkpJK9tMwRuttcQiom9V+Lb4/YuHu927l61JlbuecKZ41AT2O18WZ+1vcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7059
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
Cc: oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 jani.nikula@intel.com, tzimmermann@suse.de, s.hauer@pengutronix.de,
 javierm@redhat.com, penguin-kernel@I-love.SAKURA.ne.jp, robh+dt@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Sandor.yu@nxp.com,
 shawnguo@kernel.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Cadence HDP-TX DisplayPort PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../bindings/phy/cdns,hdptx-dp-phy.yaml       | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
new file mode 100644
index 000000000000..8f9b8ba7d1c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
@@ -0,0 +1,66 @@
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
+      description:
+        PHY reference clock.
+
+  clock-names:
+    items:
+      - const: refclk
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
+    #include <dt-bindings/phy/phy.h>
+    dp_phy: phy@32c00000 {
+        compatible = "cdns,hdptx-dp-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>;
+        clock-names = "refclk";
+        cdns,num-lanes = <4>;
+        cdns,max-bit-rate = <5400>;
+    };
-- 
2.34.1

