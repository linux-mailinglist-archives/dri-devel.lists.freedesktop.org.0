Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39246211C3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13BC10E43B;
	Tue,  8 Nov 2022 13:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130078.outbound.protection.outlook.com [40.107.13.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3BC10E43A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 13:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPi5+tFjtz1M4i8MFH2j7/mCbGvDgS8frnoXFFfSg7zgKXVYvOhs/t3I4cEgKp3zIrIIXGCtiwgxzYdWgAq/fVRDHcD0qwGE3zzl/lh2lRz2lMQbP31c7strHT2KhXvR26cU8SvTRDCOPVBZq/bY66LO14mY5jcPGWMZ6uXK8gYagbFo53S8k2B/znRqQO2NlPUXvHgpSscnFRi/Udf/09+5FRuWlcHdRM9zPyCm1oGnakvlLqga13EV7rs11ltujQ2r6MWOc4AAO+pi9q+At9xWmf9xpV9sQx/unMETCeiMwmJ7DCgAIzd+lCchVdot0AFzuVfyLFJxS3h1vbDGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6W4A/rcdPSCUOVboIwV5PmEr/hwry3p64n4pydxEoY=;
 b=M8kZAWzWhbxGKhOCQFO454IqFa7kOqsTvbZcOUqrjTylPMwBqtKTkDMYZc3qyY+2EykX4t4RwmMeugImu4qNOKO6EiU9hxxDs5zGPM2YCFXVyDuT/t1r92MWvPUc0lJ8tR8A/XjopB5yTwusN8AONz+3yahXYD0gm0dXzAfwrSVK2BC1shtf2hqgrkBJu3SODxCd1+x4jCGR4rugk5UJzg3Uuy3CDhuhnpUwBHU+OeMjaYG6KOdG2knVxm4AUmp3Xnpz4YpUlps4HsNpFBwVih5WoQvBPe1vdKuaoZIC5iNZmcFQ89Irw9QljvnuOa1O3WTR80poCAzQyFB9WdRB5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6W4A/rcdPSCUOVboIwV5PmEr/hwry3p64n4pydxEoY=;
 b=iFvDond+L8IzlJIxDC3i/McubkX4zradXm8kPm5XLOFrBM2eOG0KHxnR58Q12N0fuz1jeQiMpkLmxnrIm68QnHpbqfE9jrb1Fkl4HfizpbF0ZXe7DMfONkAAwTjnNktaETnv707cCKuNboi8GBTx93qYKtmvKF6l2831MWX6kZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8895.eurprd04.prod.outlook.com (2603:10a6:102:20e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 13:01:42 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%4]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 13:01:42 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, vkoul@kernel.org
Subject: [PATCH v3 02/10] dt-bindings: display: bridge: Add MHDP HDMI for
 i.MX8MQ
Date: Tue,  8 Nov 2022 21:00:05 +0800
Message-Id: <9ccf53cad7f735f985f4ca37b3b0159ef78a2103.1667911321.git.Sandor.yu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: 142297c5-c437-4f05-e311-08dac1896161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lCyMPoVVC9sQMv/wNa9uotwRkP3WMLJaPPGJge8norLRMZrT5gY4292JgVsJ5sPqiDjq1AxuRtnNY0s0/7WpB6XxiJdVJ0ObQDoV7wBA95BBw6FAn2AyFLBCxu5F9aI/KzFfGuqHPhqY3cJdxJxyHqjwr16qMczAKB+c/S69KctpjVHzTvTqEqjs2XHSGTC+eHfCh71Lvv6MMPxcllaQRjN6CdkkRbUKHSZ2vi1CIqGHLqaae8oh48SQftZsn0I22K3O141gUrVXkgmb4xcDaiBCDAECWlin4mfMFLl2pJ3SR2zglD5BmzYxJ6Bbvg/kQ0fHj3bO3bPVzyHTCo55vayq77Svuk+lQFG4ltzfxsxD+cWEdRLMDlL5lhAgAUZ6DkPZKgTvSfL+z/Kv62zW2LWw7OYvUfECYnW8UiJ9KU90IeRpGb6pzso0/FgMQhcIuctuk9PlgF0rQqYrIWDA/zJnJ+KdkBPUlpGDKzjcu5N1qBW7cdIT3rK/J2BDaGPrEdwF1vgRfoV0xnwLOe7py0OhNxImHjjwI9FFMs9ykhz6+MLgC7YD27z30cK8dwING0PpdZbkxrpDzeUAkJRSTHh66e+knwwVpy8mqQy87vdIJqsBxeDlbll+JvnilTBdM7T/O+93VFMCjVD4bhxZyDbE9Vy/DR2fvA21CtTCH/xJtnYMnnAZP3a4tmbm8T4dMSrIoZ6UTbNRsAWC/5HnyuhGMcz89EcprpV1u23JTCRDoVmzJ6tK5RdmGgAasF09M9zBpjr7eSJa0nMqudei3DAUlcqr96UouJV1vU7/DgSimdAclN5vJ3hqgwldE3g5vAQ43fVVPukbtvAVK8Kzdlv+ewoF5XZDdDgNC6vixiQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199015)(66946007)(38350700002)(4326008)(66556008)(66476007)(921005)(8676002)(316002)(86362001)(8936002)(2616005)(5660300002)(41300700001)(6506007)(6666004)(6512007)(26005)(966005)(2906002)(478600001)(83380400001)(186003)(6486002)(7416002)(52116002)(38100700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s5vEzLZrvAQ7onsqnSiLRNe2QUysMRK5JMtsXn82+ZIkkNaAxHc9Ycw7XOxb?=
 =?us-ascii?Q?xjZS+5W4nQpKAFPE7guCAlJA4AfeOiES7RHtVjaIXfJBbA8DF8UvEF0EQGoP?=
 =?us-ascii?Q?FNJ2BXK3q1Rcy/f42NHYDxfzWMQZGsnZZ0RULjXKRXgLvaga+ldH6aYpAJ79?=
 =?us-ascii?Q?oDBJzsWc8Mvjp/2OO9GIBcj88XkefpQb7QNGhacxCkCoIfvY61tfdOlRXCzG?=
 =?us-ascii?Q?Vm/sFI7Xz9Ka9A/Hb4c9FDc6BBMsgOvosWNoEjdj9NvBRBsODkVI16Ilcwlf?=
 =?us-ascii?Q?UAnqisl/X4raNZlrvLTYSJL3E14J8tvsqmfNjSNuCF36rbLGY6zVUooJUhgN?=
 =?us-ascii?Q?GKHfKWTtrgkVCu6+zFiEu3pOAw6sxkDqcwHBSriBxAbzy3J+PtWaA3aLHySD?=
 =?us-ascii?Q?F/zSHvGkMJ/zB2FGKId92ndofCuJ4d29KFsJrsdnOeLbBAHXNEfV9NlrHM6E?=
 =?us-ascii?Q?uqo8T3BLiFcCNIkoEX6a+3hJghn3DMHcdWI8uQRfh9LGKu2NU8gWyXsb9LhH?=
 =?us-ascii?Q?YxOzPfqTHbRU3CFhUuv8eprFGMvr3mxsVuB/oOpJN+76OXNJsz53SI9BIKoL?=
 =?us-ascii?Q?SxG25buO6src/saQJI7B6tNOu6K2zOMnQapWdf6XGaBuZvRLGNK7IvzlfUpx?=
 =?us-ascii?Q?BuBOcbgpLt6eAZsLASmNU5BaHjLn2zE5EA0VkMUIreO3dhLkIvdPVFH8v7uq?=
 =?us-ascii?Q?VfJ1j5DRH50+RePERGmSAuMvH9wXIUmgjHxWkfNcCa9AAmSxB7pNeRX2da2W?=
 =?us-ascii?Q?+/U3FD8JasqQx8CoBZi2RYh/f+PurV/kTy0zponMUlyzkoF5mjncfj34jZv+?=
 =?us-ascii?Q?YY2RyM7/Ekl1im8tfnmhhKYjpbd6RXb6vyo6L8hPFOppEp2LqFZsBLTbWTrH?=
 =?us-ascii?Q?mHeJfJFr8owkNtjv494tycZx2zTemXvIzABsfkIIPoiJMzVIHWvVnGiNaRwz?=
 =?us-ascii?Q?xGC0vqFzcGvbTDlF6dJOgUhvp0+NFYJt4s9sdPBWkoxHbKDm9y3FhXvrK96r?=
 =?us-ascii?Q?62I5mqNAfrRi/4/0OfWy9OitZ/890XDWRgPiW0IqCtLzhwsCsyR5wd7/6qns?=
 =?us-ascii?Q?/t/j0YGHiHUbgMF5Xm5ktc7E4+RmnDa7l65ljBIM+O7zvOntG+R/bRhO2tgS?=
 =?us-ascii?Q?m7aVf/otpbIBsKnfDwXbF0D8D3cRYW9VjZz9jRswkfhkmjvBsIxF052n007+?=
 =?us-ascii?Q?MRrwOLDM/51a30Y8IvWy5PNVt5iqd5TVTtfjZ6SGPKSyRKAQNxfx5dSKzUsl?=
 =?us-ascii?Q?OQoFUQZ/D9z8+6LAu0LwMGkOZ63lJpV5Np8oZHnuTiJIB8gvmxopV5+Uc87D?=
 =?us-ascii?Q?s/xd7Rx7E///QOl/M/PEtOj84ey4uSiqYnXAxn0Yuu2S+OyakY4rEcy09AjL?=
 =?us-ascii?Q?acweg7H0PIwWvF1YChLp+zkMEL5qsq9mjEbVVEYTT564teoN8+lk+7ddp9Mf?=
 =?us-ascii?Q?9/DGjEdE9SY10nUccKll/ZxP807QleM9I0os7gmz24xhKS1Jwi9fniAWanQV?=
 =?us-ascii?Q?5by2dzSfMdJNKwwG8bvhOE5MYGGGAAaPjJiaMrSsR2L6oyeDigsLTs90ZaQd?=
 =?us-ascii?Q?cbzIeqzh1ajvkVEAwAJIoHSLlS/up4mFp9bpoYtA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142297c5-c437-4f05-e311-08dac1896161
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 13:01:41.9063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VBo6HS4veA9RMFZQuE9QhXkTfw2Jh/oAKXMOEJ3OCMDGdbdgxrF9oFysE4VbG/F5sx14V+JbalhUorLzlSe1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8895
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

Add bindings for i.MX8MQ MHDP HDMI.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
new file mode 100644
index 000000000000..8c0afef157aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP HDMI bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  The Cadence MHDP TX HDMI interface.
+
+properties:
+  compatible:
+    enum:
+      - cdns,mhdp-imx8mq-hdmi
+
+  reg:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
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
+      A port node pointing to the output port of a display controller.
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mhdp_hdmi: hdmi-bridge@32c00000 {
+        compatible = "cdns,mhdp-imx8mq-hdmi";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        phys = <&hdmi_phy>;
+
+        port {
+            mhdp_in: endpoint {
+                remote-endpoint = <&dcss_out>;
+            };
+        };
+    };
-- 
2.34.1

