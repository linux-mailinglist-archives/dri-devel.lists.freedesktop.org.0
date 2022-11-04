Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE05E619140
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 07:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1E710E6B1;
	Fri,  4 Nov 2022 06:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130043.outbound.protection.outlook.com [40.107.13.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B6110E6B8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 06:46:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fesphYgiYXnRQ6iMlNfQMwh5r1PW15wgveH9ozu2+hOxzShKanFibnrranxge6xXwcqfM2goWGW2nWdWXh2WuagF+rTKJqRAwzYFrznQhajQq1oPIqiHZcjTKV0J9TvP4OXmO9jKJ0DrqbGk5hGP1oXaSKwaDl80EVstsYY1KFjLRG+0SSTbMY+0Y/OFhhQfuatOdQFZHWEVgQ6SoctY2+ixkXNqwNC085p1vl6INEzpKHrjEkGAQrtOmGC57BjycE365wd4C7KWsRnPeODrfUE+YRR5XEhcUCC7YsO/hcU8RQRWSlf//VNmVoC/ZE4nAszIbbTrSAaZp8DGTiyWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duNWFFZrQ2saakIVQn+3vIVxprhQerDx0XGKLR76W/4=;
 b=T/7cbM6c1THt0atsGx+aSnqvwl1cgFxXaVqyeyICPAbDgzecpQAgkRgukNgBdLj6rRpo5ZuamwsbrDIbnIIokADcQBg4lyfU2tIzA9OOtmUoV6wyxrss825Oo2UKMVsEyZi+L+V8pgHAnAhvu0Zj3CW/IcyayNk3Sq0GmP5v4wNTj/I55i6a8IUcfDY0Pz3v4qrrspOF+8NcBeeAcm+ng6kDEP552WzxoE/BoiWv7nKqkHx3HpVJo3IefsYYOusdbLfr7SU9KWRzDflOH++vAMBC9a4z3TJR5qriZAmooSapXd5KHVCEsyPqLs5ScWmjSQkBkBNQ8ruVsYlydzdpRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duNWFFZrQ2saakIVQn+3vIVxprhQerDx0XGKLR76W/4=;
 b=rFfhlsIugoS2d6zpgs823JdWAK55t4PMYNQ3vsQjAkDJxSx9SQY991pgfQjJScSLR1O8HeI/x9ElGg7yX+X1gOqI/lGudVdNvudXK6U3n2XrYqcIReRVgGcW5jI3aMsPlvYDHYM6Xtjw3UXwr7Z512nk1ToTKShjYOgI9XI+7Dw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 06:46:47 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::88a0:57d8:2a57:3f4f]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::88a0:57d8:2a57:3f4f%9]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 06:46:47 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org
Subject: [v2 02/10] dts-bingings: display: bridge: Add MHDP HDMI bindings for
 i.MX8MQ
Date: Fri,  4 Nov 2022 14:44:52 +0800
Message-Id: <0e1f631c22207c6af41ea512be85213b3953b44f.1667463263.git.Sandor.yu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 81b3e8a5-c0a9-4e10-d470-08dabe3057dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y5qiU8AV99d+Un+baBzX8pbRr4SwXvobXLCFH5ifS7Cc5b4k7E0yQeiAfI9eQoASag88R+6MIoJvmurOCyC1uFwa1xnZCtGZf5NhK5G9k3EvIWk9B3mOp4L0qzFAVpHHn3zZGxWdSbj0OFyUZa4ASt4f4nrQpeU3KgqB+O8vBqgtPa2fCaeeMFFh5G3NA0pIY4uiSZlkPbLBeFVY0MHOkp8Yl8v8XEUyCiRCCJm+0UCnP38TIMA8pPlmgOKz6isGqAsKJckoHyLqpezEBrhx7utMp/lLg85oUYgWKrVKMb9C/qPI2+5tmt5Y820X9CmFlAk6sKy6oX0awE+vUEGxQP5ZJbBHm5LzZhaS7GOhmbAEhONR0hLGD6wjnPco0ngemHXJG5/C2YKxyFG+RFxu17NG/2oz6QDWo8Bze1MG5+SJ2VEabFYATgTVc4RiVGQ0z/mqf8zzojIshRdp8p6GJ8ibEA/hM5O1HSkJ4pHRVdUhksHRUB6sdyDzzh5mS6/WI+o4d1nOXnq6smhhQM2Ic3RcVtIn28wo1Q3CrdVGFF9VhLRH84tPOxfaOW4SP+7WyY6Bn9IFxgdyVknOE9nYdO6U8nJiWT+NdqEIklZ8WuAyWhckrcR6N9cDCsTadXcRPCO/DyjodbtqDzl+fIDZy3vCVbNwNOJ/Oj6S3kqxxSlS1g19ERhl7tPN+WkdZsme2QOQB3itAxbVyPGoAVat965h3E/jZNrMUqJABF/SziA2MyEUVzlZ5S3ykxmXsuKumIUBmDqD0fIKPQTd5nQTenT/vBYQkEoyuzU6e/xZ/3EFljoP0gCCV9QDZ4ox2Lthm8WDcnpAMz0zmINDbCit4p8N7zsigoYeAOYQoGLaqrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199015)(316002)(8676002)(38350700002)(7416002)(5660300002)(66556008)(66476007)(38100700002)(4326008)(66946007)(36756003)(8936002)(41300700001)(83380400001)(6666004)(921005)(186003)(2616005)(86362001)(6486002)(26005)(478600001)(6512007)(52116002)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3PUrFlAnX5psc1FB0PmXh1LIu/fehwq0dRno+79+vz0yuAQTTMkSA+9clSi2?=
 =?us-ascii?Q?xHe+7SLIpd0fPTkzsKwiTk3TYwl/S9cWFHVznvDMigKR5wzQ8jO3e7HMzvEz?=
 =?us-ascii?Q?GTmuIlvWuBIvqbb3l55gbT4rOMNjaYUHPAkwTWl1dy/fhXyc/KuHg6YbLjyg?=
 =?us-ascii?Q?A+zVXwmVkJhXs7YWjrVBaXniDpSrkK0mPMVFBCjA+nZ82Oh0gaSwRTL8i463?=
 =?us-ascii?Q?Qn9ApJcFVAyA3CgfSXJfs5uQN4F2xoJcZK6P0FVBQna4dt+W5OgZrq5+mHxu?=
 =?us-ascii?Q?NhOXse/Gvaaw5jGcKYd/IT5lPe2kG7YCaCsLOlXxZcD1ICC3pc1oOqYUipRc?=
 =?us-ascii?Q?KHQh7c75h+7Bngn6OpuXlqAYRkSu8FgDv7X6rQWHJ1QiMXjJWU7U5vbpqSbb?=
 =?us-ascii?Q?BzqFDKU8L5MySfo7w7Epp0ZaYPyIABzUA97y3c16UWF+16Nz5xgbOgoHrodm?=
 =?us-ascii?Q?ISlQCbKgaOqh0rdn0JUiaagLMvF9KlQV8YhqjUzLNTUpCpLMz77E0ZU3X28j?=
 =?us-ascii?Q?pgAOqbcf17iehrxXdTMZggtbIr/eUjE+7nJkztOyDAmbQ/ixbwhQdd+mnHij?=
 =?us-ascii?Q?UAmQfCckAoGMxOX1zF+bz8vj+2f7cG6379luCTxaKFiWMgb8jyaU0ldlCkjt?=
 =?us-ascii?Q?ftYU18HqLmHKQUkSfQ8k6ENPhNjboV6R5MeVX9UCmp4uwOxivDcKwUsXn9BH?=
 =?us-ascii?Q?FzBQkdMy/LJjBApPJ9f7GHs0ssAndzxRyQ4vBj5c4Kyw2KYsoldwID8+7woT?=
 =?us-ascii?Q?58l7LwOetbdYL/z8ntmsItwLqTwtmLORRCHsjYR6ljV6PzTSTxtTPNg2byjh?=
 =?us-ascii?Q?1STWa65DfbULLymSI/im/fR9HhubvJOGVoY6qJLphaYHaor43ui0W7LnIWyS?=
 =?us-ascii?Q?CmP4+T2Ki7cxdIOXOpnwKlFKX0YP0OvAw3GT2SLZiOsJ0GBNfaXqkJWfE/LP?=
 =?us-ascii?Q?7mZAKao04jXX0NMWlskdVCvZGxUoxzcPyhRi1pe/N4Di3y2/tdlmTEQIIorr?=
 =?us-ascii?Q?huIcdvsBUJstVDTELUFada96gk7QvB/EIuc0V6p45Utc5zwaqfHhbTJtuF9j?=
 =?us-ascii?Q?DmNlsPpccbwOGeVfBEkYYKcw0SJVjsjhFCuwSqMWyxv8+N9H33Je3NsZuhHW?=
 =?us-ascii?Q?KgoRkEtzfgrURYbpXMxsIAx5uEfVrd3PqE5rlMz/0oxT1xsmx/UdmusIYx4I?=
 =?us-ascii?Q?8zNFAnlzvvvV6m3ZlB+hvY91noHZsckPnufaGsQ7PLHdZ4tMXwimguAyaeu4?=
 =?us-ascii?Q?lX+v88c4bmcAzvDn6ysWL2qLavFpWgTW4t0k+fEQn3nM2XBsyXq3JHSXrs+h?=
 =?us-ascii?Q?2J0z3KZPsdKph0SX/2ONIBpvVvCe/13LFekjPQLlorSQCSaAicUX4QFO/Oj3?=
 =?us-ascii?Q?IoVPp8NcTA5cc/ekgD2ijipRRThRB5qIzgmW7H4G3SJ36KEoGwh1AwfPGQL7?=
 =?us-ascii?Q?DfwHdRckYJGg0pWF8FzybWh/MqbQ7WKGXYNEzThyCq/fdTYoSH08622gvcTd?=
 =?us-ascii?Q?gS1y0DhdFXGbMCbwmOdZuKskmD7453ZjLC8bwg8FF9nv2XLhhcTUr12TPuvM?=
 =?us-ascii?Q?RgqcgyeyPJ8qnA4Bhg0u9N58GC1vE8h0KlUCWSFN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b3e8a5-c0a9-4e10-d470-08dabe3057dd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 06:46:46.9928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPQmgKhH1Cqh/g3keHmzbz+HJHlf4IHaDxbP3cBvw9LCiSS12kLdeksyDMWloFONmprqzoXqgFZSDKTB+kqSRg==
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

Add bindings for i.MX8MQ MHDP HDMI.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
new file mode 100644
index 000000000000..b2a769d4cb82
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
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
+    items:
+      - description:
+          Memory mapped base address and length of mhdptx apb registers.
+
+  phys:
+    description:
+      phandle to the HDMI PHY.
+
+  phy-names:
+    items:
+      - const: hdmiphy
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
+        compatible = "cdns,mhdp-imx8mq-hdmi";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        phys = <&hdmi_phy>;
+        phy-names = "hdmiphy";
+
+        port {
+            mhdp_in: endpoint {
+                remote-endpoint = <&dcss_out>;
+            };
+        };
+    };
-- 
2.34.1

