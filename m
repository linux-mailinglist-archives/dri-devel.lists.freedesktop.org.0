Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E46F848CC6
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 11:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B47F10EE30;
	Sun,  4 Feb 2024 10:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="qOuqQPqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2071.outbound.protection.outlook.com [40.107.104.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E241310EF64
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 10:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIJwC4yCH4dEf4F2Gfp9/OKcU6o/vnN40lwHtyRDUqZSsOiBa4PlqXEP21pGT1n2Oa5SYpGF5QkkM6mwbWUugYiPqOcyb/1tPLpDARCedkJvhUL5F1UxJpdNO0FE3hCXIVRbIss+WtWPU7zBgqFsM+nLlHmFe5qkLLNp3VKndcuGHunkPDHXPb4Er9/+M3WIpQSr3xhkr7JMw5bm3tpRjgAOWRoCvdbR4sXcYDwPs1f8URbAwRlZlArsyZYnz+fMUCyZvsTrwpmXGllpLnRzeQ8e3Cx/OAwo77AfTB/nqri80PZ0EatUbFyIp8FW8JW2T4YU0no44O8TfCHUrFuYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMPZd+QoxWfyGO/rFbFo4huGGwOeXiBhB2uOpeLL3Hw=;
 b=HoInj7odjfDj6hqyBD+Ai1hZxcGnxq7Ve2ceDx4e2E47+5H2lznPPFV1ZI9iSlFLzkMwe3Na9k013lf6a/LtGeZhRL0Eodrl8AueQ7BVk81v1Fq9V9h4X8OaxOsFlsBqjoIOWzRyZrYbrXMZwMc7WPMgGkq4LomOevHijIa9xZ2mSIPlqrwEBBd9a4Al/8OLPcvhH9x2CYcrWrZiiQD5qp7rEntHqZaaXH26xmDWOzqOTDoN1Z811GxlfSaZm8jrMQKfMxsMVk4ZktDdCQEAgqhXM+8SJZ6SvYKa1pXvpxu4riAwT8rq06sR12hHRxSC1eXunuz+rTcs8yP5YIzfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMPZd+QoxWfyGO/rFbFo4huGGwOeXiBhB2uOpeLL3Hw=;
 b=qOuqQPqxfq68CcprlzblHj/HbXnmgLyChZlQUPYAdPQffsuL7EV6+LFJ/5cpuBjszYi38AiMUqW8inLaU67YSZ1U1rbk9YUAmjVFGMoGJJFVEk/ZA2c4iivx+nrQ8ueJ+CMeSNcXNhdXSxykQSNU/vf+aLGVJueihlb8rCYmINs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Sun, 4 Feb
 2024 10:23:26 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9%5]) with mapi id 15.20.7249.025; Sun, 4 Feb 2024
 10:23:26 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v13 5/7] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Sun,  4 Feb 2024 18:21:50 +0800
Message-Id: <dba21f64c916eab451a04bdae24cce4980ca9101.1707040881.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707040881.git.Sandor.yu@nxp.com>
References: <cover.1707040881.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1610af-ddd9-4654-cd7a-08dc256b52e0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDUQESttJWD3kPurYUlv/QpsjzgKuN8gntIujbDDbtpJW4lVPHWMjLcU4G7qQHh3ujHaYD0kLkWhw7arF0O5JNXkScwejdTEruzp8DvDv33ZKd4OeYIAVZD8PMAl7/LQQrPHMjOdxzveZrDkim8zE1MYg9qn+ryu2hk7pHT0SKS++Uk6NozxHa6A546FarL5hqBIOcyOxiqIbruUcNPRMBhwuU60DpgqmvR6uJLolevZDKauf2pUs/kIfXgq2yafd0l56LXJdnE0XRBjx27Wsv7UlJRf3QA7mWglSvvRM1+AGctBcf5xMd1pX84ib6+ttGuAJaZ5p4pnmygw6mJCDpJW8oOdJjI7exEAFppvzf2N2YUmk2dtuXcNaYTViKyvkI6sx91jNO/UzMifm4xN38juamfK/hWi65ULGTlBAuG5V0MZ9Q5eoYNyj/2WVT+ynaGE9HpcMfiRVWxmOoxcHPnUQOVbTMOYzFlCMYQf1xZqQZ6osPi6DEnlKraU8/x84YIGHiQL+cdFmpPWZUF2XwYrWLlctByyFbdBDxdJTKKCdUcuER7y5UTbK39/1kpeUKHRtMrmN6hLTKHq8hkLfsrelPQKTn9UphhSwwTNBzTV5VRrU3jtVBAI5OJkSEf1CnynpQm3kwBQ5peqbTVjNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(396003)(136003)(366004)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(83380400001)(26005)(2616005)(6512007)(86362001)(6506007)(52116002)(478600001)(6486002)(966005)(38350700005)(66946007)(66556008)(66476007)(4326008)(8676002)(316002)(8936002)(6666004)(38100700002)(36756003)(41300700001)(2906002)(7416002)(5660300002)(921011)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D71aN1MFEMs5nMIRCNqZWLG86KWGb7fO9dGomj7/2WIoxN+DbBPbM9bdXLQ0?=
 =?us-ascii?Q?9CPrIf/xOZVjTB+Ari0jrc6YZXUJuQlxMWFcXfm3qAiQvyZSmgcxmoD77BeC?=
 =?us-ascii?Q?nthgGQ+Fw1i6IgKAuoVHGSeZp67hUUUmBb7yw/ywwIoNwwknt/GDHarfwyko?=
 =?us-ascii?Q?j4KzHAdKyLwAJmlfoOqBvCdPV7BG3Itcej594MEDHzakJGoAcv+Gp2K17qhH?=
 =?us-ascii?Q?tcrQL/BW9KzcjySzApfYsb88ePuVrrhf5We5GB/3+HHU8DPrybS1QEN6sGfA?=
 =?us-ascii?Q?fLI+eQViPiQfNuWOqK49nms/OcPTgsk5hrB/o7CEEp8VJgWgwTOHWX0XcnqF?=
 =?us-ascii?Q?tq3UvuxRWTIQI2N0jyUbG/m1qd6dCw+oIrZ1niEQC0Jg9JIDAdc8fzAi+4bc?=
 =?us-ascii?Q?1h3fPsxCvUTfM6pgVCd0n17UyM8NrrvfZ/J5nCTaW9GRQO/AbxBnOY18SYVd?=
 =?us-ascii?Q?D8HcXfdy7sx4GryYnBBNXTDZb+0Q1mEdlu1/8m2HlpKdi5/qtZwUw0gqrSl2?=
 =?us-ascii?Q?1NhiGfD+D2oBt05U/BQ9mCKHv9nfhBkMQE+McaPxcvBYN0Z3XERHSOeDcp3Z?=
 =?us-ascii?Q?zYekyQcP2GfgKeq7C1Pt/+nD10ZTfhs+/GnK51if4N/vZ1KLKAaJDpNx+sbt?=
 =?us-ascii?Q?Xuxm7GzPNfr2nl53K6aEx6nDeXFBnd1I0PZ5nkoAix8tLYn4QmtH5L2pft07?=
 =?us-ascii?Q?FGAwio+OGlzgYw1p7YLWwlocir5H40bAKDGNwZzwUTGwAtdiw3m3RwaWvsH1?=
 =?us-ascii?Q?yleu3xgh8h1zzrqT9Tucp2GL3Avd7OjrX7kVMAS/pcccJ0npmt4/wl8OvF5c?=
 =?us-ascii?Q?+JO6Dyv8U5GYdu43dTS89Y4nNVrYTjy40YpBRVbb4a6534lH8n39iPg/7YTg?=
 =?us-ascii?Q?rOi8MRM8AO6VX9f36DvKMMI23i+vH9v2nH+BBjLprfOc2kJFg3sb7F7EQAi0?=
 =?us-ascii?Q?llsNXGgHgNF3bgeaPEXUkuK1hEbXty1UqB/J4HpxQOF4ZvT0Wio4CsUpimlC?=
 =?us-ascii?Q?E8ZxmyxFu2IYci4VYgQifnBUu04iIkGOQXoMp73wzrR2qRcq6fJF0pb+mU4L?=
 =?us-ascii?Q?LpmCSgLV18EbK7zJ6mbJ9hLV9RtWK20X5joSVHkPO2iOUFAfIsSM4ywMgrwK?=
 =?us-ascii?Q?9fVb7olH+fWl+zjkPAd4NTZMgwiJixhpvXIHvYuSH22bcwtB4kpt/ZYuMAeu?=
 =?us-ascii?Q?hkH1VEVdn2qJOSXH3sf7petD+eDMjSj0OMHHav3+DWHJb0Pe302z5Tvifrn5?=
 =?us-ascii?Q?cOBZaLux7HnkStImR2Xpn33R+AlDNV91xnc/bul9dbCV64K26T89TLZsX4ia?=
 =?us-ascii?Q?Iba4XgA8M0lUdyinuvZt4S9j+Mr4Pm8XE6yyEiz12/Rrs9FUzAiSkUM7mJ2X?=
 =?us-ascii?Q?bFB7CCFoR6shx83ksfugiXL4Vjy2wQoGiuD+F8Xp2PzXnCMJtyU4w6pSKtBQ?=
 =?us-ascii?Q?y6rP2JxHUbB7JK/OoTdTKNIYJ7WXxtGSnc6TInou+MmFkWgJd4JpZUAXwr3H?=
 =?us-ascii?Q?eE6xlaiC/rMM1TwOwAHDdxXgOII1isqkA9fvnfjMVOsHNJPhWCr+PTLhW9Sh?=
 =?us-ascii?Q?N1Fq1PQJ9/j0DCIhzFIvhdEWa/Ic9/aCPFnpsFd4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1610af-ddd9-4654-cd7a-08dc256b52e0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 10:23:26.4843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21ycETjj44qUu59qRg7rMnUPuBk/GLOFaf2otSBKlo+YOglbCFzYgDeY/HhR4MNJOfK4eFtN9dJDdkZEglWVcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
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

Add bindings for Freescale iMX8MQ DP and HDMI PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v9->v13:
 *No change.

 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
new file mode 100644
index 0000000000000..917f113503dca
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,imx8mq-dp-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
+
+maintainers:
+  - Sandor Yu <sandor.yu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-dp-phy
+      - fsl,imx8mq-hdmi-phy
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
+        compatible = "fsl,imx8mq-dp-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        clock-names = "ref", "apb";
+    };
-- 
2.34.1

