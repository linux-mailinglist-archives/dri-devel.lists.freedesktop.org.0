Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 047E7619147
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 07:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F90B10E6BA;
	Fri,  4 Nov 2022 06:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88ACC10E6C3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 06:47:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgVTaRm4qGci7TTUsgOv/hBnffkdzWocZ9QaelY1sZuDuoI/uXAfbE9RZBOO/SdMENQTPjk4ccqw7iOUqeLVNkkwgIEhPeshfPFEgFG9tL89X2nqUhZ1DMmh1xzWca2d/vwXq8BZE3IoH78poX/40Dy/qtRj+39LI0YXOi6K4t9fVE67fhrOQvY7us5TEYUFGcJTLFEgOakDiVK9RbgxGLOyez33WRRWJuAq3facct1izZK3E01hFZc9+kYwqYswaQKFCkpvrsLkLpiH2jfFA8CRqdIHX3Iz0EGyW2QS0gfBHmQKrw8azRUjzovoQaa+Dl4UusH1/AU1CbAjnxIxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aS6MOWsgSSCMzucgwE5rDFn2pVEBGzrYCT0DjRJmaz8=;
 b=W88Cm6dQ/bLCbGSnv/FQ7QySmQiOIP+L2WmBn0RYzGeQoDtxyQ8CiBliLJk0JLdb9DukxhdQ/SNHkHO+5SLtz5FcfEBSINNFUPkenvghWMNqEe2CW+t6OzTsVdLJauv82VKv7NXZoedT+ZWRh9YSnzJrt0XOln4jy5j7UzotpwDuPhXyGElzfQ1DmqgIfbaHqIe9R/w+cwHVCP2eEaDB5lthFRtM7mcxkkdIoB2jN1yPLCBGVoTYpaH2PZwQr6Cq998Yyj7G4He3jqlKIeysoGlKXqXqAjkW0W47nXpPBQUOU5iORp4n6jfTnYn5TGPSPjGHva4FDH0N4OImWXqLhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS6MOWsgSSCMzucgwE5rDFn2pVEBGzrYCT0DjRJmaz8=;
 b=mrFGI6U6iMI/UNSdC9bNEITXrN3IO8Dd0/4ZdXUlRUT4zINOXhLTX7eLW2IHg8qPViT4DZ4irGZbBsMoQdOccSY3fSxJye8SDYDm2DKVJHLilJcYHOASNibgo2QOgcC1g8yLTxkuIYEYGpStMmpK2nZ+3ERJBsHkA2wx0TAF7vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 06:47:10 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::88a0:57d8:2a57:3f4f]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::88a0:57d8:2a57:3f4f%9]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 06:47:09 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org
Subject: [v2 05/10] dts-bindings: display: bridge: Add MHDP DP bindings for
 i.MX8MQ
Date: Fri,  4 Nov 2022 14:44:55 +0800
Message-Id: <aa8e5153d0ad12a2039ce44039f9ecf39e4a39d0.1667463263.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667463263.git.Sandor.yu@nxp.com>
References: <cover.1667463263.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0194.apcprd06.prod.outlook.com (2603:1096:4:1::26)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 95170429-9e92-449c-0667-08dabe306586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0nk0U/71ox23HI8edk1a9Bton/mMMQE1VR2ffkAIgBGLMrmBoQv4koPY8KTqhjZx8rmfEpgJISKtjesYB5h6/ME3qKYQWA1IxqUQ/tLTA92Nfrzp3BFq7a4KKjPLzxrb5Pv2uo1IN8iGYAl9d6bjhW0NbvOhBTwNSvR+1M2mPNxgtpVdD24uwnd8Y+pvkhi5Vhc5LRpCmBo5Xn5XNGnW2bRY4pDL1AWEkp/tbSNXlnemLnYzFtvcyoqmShfyiGZcrJ5DY7jJ3O2dW7y4mi8b84ah/ScgqUxe8U/nXbKy00SUkvrRR1PSHJ7vh2OHW+NWff4df5fOECdZrxYFUpcU4TdPxk7g6U6RIwuQtHVYNtnOpS2F21Bf9KGdnxsxYUQgIqR2gp1d8uYMsA8hUawhl7ogqUqcHq6HK6xYyF5Uamgx0xHIcPk7Puy431QjLAkJYSk1YqoC5iG3ygRf+LvbUf04LjjJW6Up87qRRD5gp/GmGRmoCr7MbQgFL5tOu/wyFnCQwTu3ZnvI+xN/vpRcYHkzrgR8U3aWUjSp5GhelBpC4dNH3IfM63wxACTbEJGmHEyAHSHM1D0TLYksd0rQWyFBFoYhkbZBZEbQYota5CnoonWVZLAtzQN1a2WYS1GQzPL+vSFSO5gXTETZyZV7ud2oXdNU7Nyd5dHqgFrZKAGC0w/vyVKcAAbmZiAAe60Qa57RGNME7+D5+ZB2W+S8OYh1G0l8QnnjG8NMZlurmj9nHQeTCKzvlJYKH4+nhzWDFZMixQ4lh2hzojWaidUvL2WsSwrDfCXVlHhsbYqPlgRAhxm84MvmVBUS+M+EM2TweT8ZYJ4NuktUF3cgoXN1l1tknrXZin28sCZB7KUjEwU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199015)(316002)(8676002)(38350700002)(7416002)(5660300002)(66556008)(66476007)(38100700002)(4326008)(66946007)(36756003)(8936002)(41300700001)(83380400001)(6666004)(921005)(186003)(2616005)(86362001)(6486002)(26005)(478600001)(6512007)(52116002)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wOYzSxm1Ab1Eq0kYvKSDPi3jGs4RFcGF0dKhoKN344ECNJE5RsxT9EZHWjSe?=
 =?us-ascii?Q?A0WMdHuLZq8PWVb9flTx8ab+HyiArmG3OQ/ZlYoFQ2+Wc5FCyW+Xf40F+K5/?=
 =?us-ascii?Q?qgWExfFiURMLTpBWoWQymlJ9pelNCRyawQ7z7d5q1pU8TumBMJghBGbru7EU?=
 =?us-ascii?Q?HUC1wH9fWPUNtEKN6whTJYg8kGD8UkaH1Pk0yUYwpcd0My4SXXqWqKAwpO0f?=
 =?us-ascii?Q?zmaVvQL6+qrG889yCpmYnR/J+oQOJHufdlsAtWeCkWjbWTV682Zseg40UHwt?=
 =?us-ascii?Q?k5T/gYN6vBPUAv36NtjAhZtfoTgYfnoLcbT8iofcpcKYd6R62nprfgT0ZxJK?=
 =?us-ascii?Q?BOvaIeiGJvFTF1R7YAuM2Wx9MFVmDK68+3UzH0igzB3fUOumExcTXjzpYqel?=
 =?us-ascii?Q?FIPZXfhcVYZTD4lcVN/L2Cuh69WyAMd6YYdGSQR/oZmQ86aqL1kOMZf3Lnan?=
 =?us-ascii?Q?eiBbwOZTh0cV1LuD1bvcQgpnp7rLkzSXoA8mJVMw/w52BlrFIO173caxlXRj?=
 =?us-ascii?Q?M48ldFtS96jqPUEBMeRi5M5NzmflPF6jdVEcYyxNAw1dg8DR63bVrkc278X/?=
 =?us-ascii?Q?eUj1L55guqapLCPhVD8N78HTtq1TqN8NXSe8lkyCB9ZCTva90SeH5uPvnLhB?=
 =?us-ascii?Q?zRas5RjTKUJsRbszi6MDjSAB6defTuUih/sKXQWcd8MnwiosjKbUUvQV8fwE?=
 =?us-ascii?Q?URU919TXGzTcfM/Zog3uraG7eAmyFe6prEtRjUnSC1NFfC+wCS0XLL8fykTl?=
 =?us-ascii?Q?ImPSQQPRsWfyyz2oH3jQz8ppyyY6ysY2rlLiLdQs9zB7fSD2LGsP1MgTehJV?=
 =?us-ascii?Q?BErlQrj4NsAMGvyhKxtLXy+n91c0/ATRJhrgs2tE9vYFrXEKSXBbG8VSAPhu?=
 =?us-ascii?Q?Pf2TZLbUhpmH+OgxydkdGlpTN+Joxw6dpOubUEI24LOyqJKk3cevxOLDW61P?=
 =?us-ascii?Q?MURGEpsctf+x8hbleBLkFxRg2yBcj9OZyMNXZKaanC624Yk/jIS2VW3b84dk?=
 =?us-ascii?Q?z4WNoeV7WKe86GjuTtje3CtqbbMws7RYHCLEL+znk7AkkaxWacd9nXspWfg7?=
 =?us-ascii?Q?u11mBNxvcAy8xepitjBqsGDglTa0YGEgCCBvuBOCB2MQihnlUpXVCNGnJDGX?=
 =?us-ascii?Q?gYiEg45+xVd06FfB3QBdV2/vtcAZEIcflCxVSDHX6KSd/t2fLi48s8vzf1dN?=
 =?us-ascii?Q?NPMfBCrgXJdnVl9XP44jWP3mc8/UyRF6nuhLDYJC2pxoo/PcbxSZSVAIzuue?=
 =?us-ascii?Q?tLljPuqeZcCFpeifku7brZ3Rdu20NWNB3xMWJJWZ20pZZLDthajbL3bVFV/6?=
 =?us-ascii?Q?Z8wn/Q/U1ySH6dWR7il2ZzS9a/kPB1kdrrWK6lZjU/lVEMCKUgxFFTCoc0HJ?=
 =?us-ascii?Q?DFYtMXbqB/3KSH3iDMoaqdmQQV5qF1WJx143wzG9oftkEAwUDM++Wv2Iedcu?=
 =?us-ascii?Q?Utrd2oecAcsd6/I0N+7JmU96ub0/gKs1rBWRg+xNAhVL0K9GPNxj273TlzFI?=
 =?us-ascii?Q?XX7YnQ77HkGULe9OgolWeg5CC1yXxL5W0TETSekD+8UihcWqIqWNrouE9DgR?=
 =?us-ascii?Q?ph4EL5c+sZ4rXi8ZIobg2arA3t109NXKFeb86iIE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95170429-9e92-449c-0667-08dabe306586
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 06:47:09.9054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgPXhVBhpSverZk6FmlgiNKSMclPqpP2BIB0CnfCir0fFkG44kqeJ3gT7zzAJAEAjwxOJYGNygQZRW8n8XKOFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081
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
 shawnguo@kernel.org, p.yadav@ti.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for i.MX8MQ MHDP DisplayPort.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../display/bridge/cdns,mhdp-imx8mq-dp.yaml   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
new file mode 100644
index 000000000000..06ed881247ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/bridge/cdns,mhdp-imx8mq-dp.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Cadence MHDP Displayport bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  The Cadence MHDP Displayport TX interface.
+
+properties:
+  compatible:
+    enum:
+      - cdns,mhdp-imx8mq-dp
+
+  reg:
+    items:
+      - description:
+          Memory mapped base address and length of mhdptx apb registers.
+
+  phys:
+    description:
+      phandle to the Displayport PHY.
+
+  phy-names:
+    items:
+      - const: dpphy
+
+  interrupts:
+    items:
+      - description: Hotplug detect interrupter for cable plugin event.
+      - description: Hotplug detect interrupter for cable plugout event.
+
+  interrupt-names:
+    items:
+      - const: plug_in
+      - const: plug_out
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node pointing to the output port of a display controller..
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mhdp: mhdp@32c00000 {
+        compatible = "cdns,mhdp-imx8mq-dp";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        phys = <&dp_phy>;
+        phy-names = "dpphy";
+
+        port {
+            hdmi_in: endpoint {
+                remote-endpoint = <&dcss_out>;
+            };
+        };
+    };
-- 
2.34.1

