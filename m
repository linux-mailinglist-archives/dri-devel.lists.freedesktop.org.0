Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B4F773911
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 10:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B2B10E3CA;
	Tue,  8 Aug 2023 08:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A87110E3CA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 08:34:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfacjWR6sHpsciyMxnSeClszPmGsqETFxN7OAWcrvKMDySy7pk9xJpx9GElg3NpL3zliuQsNNw0sENeYbFbBZtwFApLK5pqrKGq1iXdDerGsww9GopCZerdd+yQ63ueP+1JvKbtDoPjSet8/FDVaDL+a/aocGJJtqZmfxqMPYSQ6MMtzAWsKrH08O2eNPAO7V75RV7dcGb/pK+JLNUFUOQJWtgUbq6nbtL4E2XXbQtByEanSZkzL1dbr0ZLvkTPf73UWJiBQe8toTuVZpf4rZ3pwx0Xm1/HZ/A86SOiVYcwsIE1KDG3WnR+U6Wjw5dICvE3Ml8IMFD4/mYaIcIbROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7yt4tIqHRnYQsaQLC4K5Q1ygFBRFKKMW2c2+Jqh8yw=;
 b=BezStC0eKsq3VjldIdbO5QxeOE8P0aW7KFOsWVEpnAYGuPyLeh3B9RVVmzBOHh1OcNE9wtEf5Qj1IIsK2ohZQKKgOx4RxY1rK24SaX8/qqbcfOJc3hK7euEHVqq3v2wxG1xW3JeqsV6CZsX6JFp8zjzlN9ghhexV4+b0s5O5jF+qEi5TdmV1k1QKYXNtNOJLR7F5P0o3Zq868h04mtbRzb+wpr0lkCz1roJnhWwFvBYt9EYkaNNrU0e5kMwmpLAx3rMcykd2g4Q2yEG6uc+rQjlq4spKjo+ELCpkUzQmd7mlPGjr6nwjMXjpUVt0NJI1SNdAuI+D34EGObEATVDebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7yt4tIqHRnYQsaQLC4K5Q1ygFBRFKKMW2c2+Jqh8yw=;
 b=A/z1aq6vjNGodIs3nAFShXAA8PBK4hnjFzKEtq1V0rDDW/IFfZDWGyA/Oxo/YsLSvd2UNd1U+NOHY9pQid/tt2AOLXv4J8w2PNckVDLkqfl9cMbVTncrq0i9h4PGhXxXdIVsvdJ1kD8/Wokwibufb3qTvAoa8zgQN3rVsLfX5RE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI1PR04MB7198.eurprd04.prod.outlook.com (2603:10a6:800:126::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:34:06 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:34:06 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v8 5/7] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Tue,  8 Aug 2023 16:32:41 +0800
Message-Id: <20230808083243.3113192-6-Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808083243.3113192-1-Sandor.yu@nxp.com>
References: <20230808083243.3113192-1-Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI1PR04MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: c984e156-cb37-49d2-0863-08db97ea3a6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sliPOGN+8d4xZmG3Zbo+dgE0L5RGtD+Dl8DUbYRY0Hk1jQzuvKbRrK3hYBf9+a56fDrCx8aCe/l7p+O83glIl9rjlDEH0U4T3EhJr33jtaPn1+UnAwIImKbJuGQ4/RGGdckpHVhw/S12HTMdIrmP6EW9O1pp++GXnlz+H868BsfPv+76dQrvrWuskKuZC7QfowvrURiCFmMr1c+nlW2CId3hkxWLZG4PkQmDUMbBX0t4u2IPJ04YQLjFoAfjP24lCcHjugBmF228TafB5cLCXja468bSijf5sQGP5V2TbH+2pvum3pAwCf6vqYQ8d+mVDzW/quqObtX//7L8J6hSuEt5PkP7R92Q9XBM10Y0LJE4M0cZ28AqAoApmX3ubkfW6SU2FV7dka/afJm1MLMisUg4ngZS8MqU/fJHpEzK+1BGdXACogIaVXWAA6ceS/IcRM9kK7w7VEjU4lf5PovtA8smjeyr7TJ4WhqYeY9+FmbAG/fcC9SgINfvBEe1g6YxtIRv3vDFiAE2cqu3/dFn/F6BiYKeGf3W/qCrT6YZUIbUVhS2X67RTpTFRNHcYSQT1jkaY/vtJyfSaE8BS8mvIM+9BwmPLnrVorL+wSixkL1aPCUQ8nGIPzFyoZx3GVBjG4fwT61iyD+QQDDhL3/Vt+EL5EgkSxT100NW4JAeGsJ2LLrZuVvCClshD6MVxvKi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199021)(186006)(1800799003)(83380400001)(316002)(66556008)(66946007)(41300700001)(6506007)(4326008)(66476007)(1076003)(38350700002)(38100700002)(8936002)(26005)(8676002)(6666004)(7416002)(6486002)(52116002)(5660300002)(6512007)(966005)(478600001)(86362001)(2616005)(921005)(36756003)(2906002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/iC316B0Mh8SrnYbyEcMdwC4ohsGEzowHhjihAu4nCRAsHo5FMFH/ecLDDrb?=
 =?us-ascii?Q?tD6jGZuUxvaqHNy4FrDffPWzZvX6g6MwhZC6j5/8QgtBuEJ3Po8Lb1EJ40c4?=
 =?us-ascii?Q?Ln62sty5i7xvrs0BfIGKED9AToh4HyXq3JTDeWiuAwcbjGJ+p/LFks5ZIKjW?=
 =?us-ascii?Q?yFxYC9I22wCyJEDqUmf6wI64GSIedJWxiM3uLuaF6BJI87Qie5lSI+euQFLK?=
 =?us-ascii?Q?8pzjU6CQsYCOK8+Pc6Q7prCp7kSgwyfJDmqWrdX/UIxFkjtQCsZJfKCCmqtq?=
 =?us-ascii?Q?sON7IkBza7W1O7pk3e/GUI3vBKNKGwizSBSZVMPEICxkLz5R24QWuvWthq2v?=
 =?us-ascii?Q?YzucADf6oV5/vPyhwHbI1XbBm8i9a4iVX/N/6k+a75jpThBRX3LEb6V8FkdW?=
 =?us-ascii?Q?c4N54qYzs15okEv1K/ggMzRjzMSi/0Zxv9sCSyexi8o0L6aLHMI1ldwajqyt?=
 =?us-ascii?Q?H2y0pkI/urmqZ4Vw9QbMDk3ZOw9dCr72I2sL1Y/ek8xkxK8WdZ3IXIp4j+d0?=
 =?us-ascii?Q?qpIzoBMp69P+vLNTqWDOQE+LDXs/uv5VN6xyVyeUNoKIP6UOilE5O++4m3Ar?=
 =?us-ascii?Q?udV3a/toDsJq+oV5B5KrUprKQeXllVQFgdJwBQEW+iJdX+NzP5IqiI1UgsFY?=
 =?us-ascii?Q?1Uc5Jg12KQ7d5N5zN+w5pXiLIdkusb8RhRCUYkkq9v+YQBadMAB7nMT+QwlJ?=
 =?us-ascii?Q?15DDrL7ujkQyxXlJfbmD9eD9syt25lay4Y7tICSQGmoW6GO61qTxBUI1KsTt?=
 =?us-ascii?Q?lotxMTF6YUq1DQc9bYbSF/NWPMxmN1VhUzYfcVs1I+bII5kD7HKswxuGOOcG?=
 =?us-ascii?Q?4jPtnMebOSePVjwl2rgoIGHlQLZ/evSnYoosygHo2o1rhrIFfwTqYgrJfksd?=
 =?us-ascii?Q?vmT5sf6JhO5OPY0MmDTrFSBG6KFg7XK8N1tSxZDbiEyqmny4WTSP1IVHE4MX?=
 =?us-ascii?Q?m8QmOo/Jb3NcKaVYY4f6iXaYljbDWFwa2eTZjKdHY3KlzCETUnpVwt8m9cBD?=
 =?us-ascii?Q?FIjuLJICr0yue46w6/uUJn+up4hkUSX2t73u2HMWV2LzehALuyI+OZg9cijE?=
 =?us-ascii?Q?PoRC0OhYNafxF7WlS4pWhUCzqRF7bQO3A3VxLKW9YCot/fUAtw+RzuP7z/vk?=
 =?us-ascii?Q?S6waBzbczbM+7i9UqxvtbNMbaClXJ0HPpAqR4pex4XjTXigH+jO4ORAdsy2t?=
 =?us-ascii?Q?APahWXbCisMKtqYhd3ruy3QcBL6kI8gVL1YCIeRTRcA/M2j+5tcy1QvsBOHx?=
 =?us-ascii?Q?X02cCdWH8c/1qgg7/NQY3SczEjA+A0wXNt7o2ctlFx9XhBtr6O/mh9d45FY+?=
 =?us-ascii?Q?1nkxSgIXmq3Eqny4PM1t+CG9NqN7nvadV2F9RZt4wuoMHAYkWgZFON0fO/6R?=
 =?us-ascii?Q?8Iebnp80eZ7s4y+RLFt8PaMk+ZS5tLscs9IQiJxaohiASVhyX+MksjcE9L8W?=
 =?us-ascii?Q?wzevK9PHHFyX3mkTEGPBuXCUkMdAGc4RPmMYs5MO38HS6uNXw4g1GY1hemKj?=
 =?us-ascii?Q?5CIPCxpKV1oIExhWBfzQEeKMyRVjx+ttJH+8p0vCFLQ8bT7mP5AdO5a12Eae?=
 =?us-ascii?Q?goEdfCADZAKqHvADGv70JTxNdxBCgbQVUt5z+wLH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c984e156-cb37-49d2-0863-08db97ea3a6f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 08:34:06.3777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iL5Ez92jj/coX01gAGEoMAOKFwDbzzfEW2hf1dBWFvyCkEtWpKMEAtpY0ItaIWOAMvy4xphntDk5X9NwU2qwyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7198
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, Sandor.yu@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Freescale iMX8MQ DP and HDMI PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
new file mode 100644
index 000000000000..917f113503dc
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

