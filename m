Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E8983F4E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D4110E5FE;
	Tue, 24 Sep 2024 07:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ff8Xolza";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391B410E5FE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 07:38:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEMc6HaguUexRMZtpctNPih2DKx8x0/vcFlfzJ57pZ9c/m7RRB7+LLirGdRqlFBExxmJEuY1MrIuGATN6Tby29kXEZvoZLp13ZFnTfaQD7DyqCxJYQDqYiEQtBYzcjU8FilJuOaXybGwkqq2EQTQbwkAUVIO0W/7lmrtRthHBBRyxcIHXDOSnhaY5fHLBuH51Xn6pP1nvYCE3ooc7PdGtHk3JmWtU0AGMsjxBt1mzgBc2FHtbDPdHDl9TTMb67XVES2kENF0CIeBtLCbByhqTJqXekzhM0vzKuFM+qTd6Xpmx29dsNmMoNF7GMvP2SNUoj0U1qaC+/sXORgBKMzPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS/qI2erhQgyVixylp/FmM4gd3wvDvalrpMPIgvIWxA=;
 b=TM00v8mKDv5bdbEpvWmzmzAb+PQewXfx3JiSSbY5kVhrolxQoZX6TM1CNB0ZbM3VZE6r5toJQD1wrqT0i9L3X2NM+x63gH1zldp+pD8gipYwy/xYkCxAdomlNjTVxMlXPYXvQkXZkpLS3WpqTzcUBQIbSt1eyZBFfWsH0a8Ve8alsCwaW1egFRMo26UisEE2fG3gzHitcyKRjjsUnlxw12tsM1RnB5ISdKqLnyQpLTaQVJd706GoLDmql7tJ2ZlzqVbCjne26R5WH5UIpDprJ+U72zGeCnGG/WOIJnrs3+mnYepRcVYXkkXZQkC0X2zC9udHhjKeqbsxBO4h0U0LFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IS/qI2erhQgyVixylp/FmM4gd3wvDvalrpMPIgvIWxA=;
 b=Ff8XolzaMQnc45NTpS07QThSPTJqeqFNNDBA3WmqWj9jzemfNur3FkWA10IZZz2Ic5b1IDEdjUjBSHv4XA8HgXQRvDrEwtw9Q+fJZ1wU5a8G/d/Sovpdy9kTZi4vACpREZ05/0u4w3MFcAsxWToIxnOBQiAiyeITi/38MVbeCs9jd12pn/iYotfmt5DCu08SzIsK8y4ps8n56k1xbTTSVNYy2orEveRVejtXyW7jMzF5OgYYcgE3fqxdBTNlFoOMDjegvqlOvW9DVhpuem+vdIhTPaQPmp1RTu8/bFhfQIuiTuKTkv7Phy73M62R7KcDejuZ5MGJgx8wRtgL5rOcmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 07:38:33 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 07:38:33 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v17 5/8] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Tue, 24 Sep 2024 15:36:50 +0800
Message-Id: <b125ac1fdd7d0cd3eff0852b81365f3e5d43a798.1727159906.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727159906.git.Sandor.yu@nxp.com>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6fab00-53f3-4797-b251-08dcdc6be4b2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uXCbgkg3O+r4DwFMkh4r8HgkiOuN9WwUodg0sMgxYkWPE62/KZIgOZBDS51X?=
 =?us-ascii?Q?Zu78A+CJcdvMD3GPqjZHAmCnrYP9EBj+s0pmdEhfP2+3w+jVxccC49evqp68?=
 =?us-ascii?Q?nLAS9emsrIBJpxAE/i0PsiHI7dMcuL8REwrpLBph1eTck63LfDrGI6+haxxI?=
 =?us-ascii?Q?+KfWU57KxZG9UYERI6s7EX51f+xEOkIcLCLx83gKWyPsnEwmeJE3nF6FrX8p?=
 =?us-ascii?Q?c8tD3/PUQFxGTWqNfzKscFgukyOhH0+cjRNu1Ik8Gn3qvkcWziNx3qXWUTMR?=
 =?us-ascii?Q?8JWFyNTM5ahAMAaydW36B59KTRSSn6sBszAOhpg+8Q5z4r7RJO5TbAH72e3A?=
 =?us-ascii?Q?MzvAN8om/VGgulbSx7Rfuy63A9zCzXdZPjpl3BGmd6N9gJu7qPjx8ZLbeDqD?=
 =?us-ascii?Q?ciwCAlolGAtOT/+SJybJ9yUQ/pWdkiTvH1gj8SUByZhx9jDJKFuxEVsHMRTS?=
 =?us-ascii?Q?hMoi9IIafayyouf1NGokOzfvfVCO0yMJQNnGB7HqT1Ikk00meK4Zug80K2gP?=
 =?us-ascii?Q?fO7Ocm8b75kQoZJ6JEKeKlc7zimMsvDT/xI78/tq0UzgYaVBosCiq53KSiOP?=
 =?us-ascii?Q?E0c3sSgAshGlPSefWu/8DoOgalQpFY4wII/+G0fqvTICwhEMm4UQ2NMC1aG3?=
 =?us-ascii?Q?sE6XYTyhbEYhcm5i3i97nsOPL6Jj+iWkSyPZzQDWLIizzzpJF1Jc6KijeFOR?=
 =?us-ascii?Q?Kh/B7HSxuT+gSO0R6k3czvEkHAkTjOFh+uxKYI6h2imZovI2D4Ru4n7YxroY?=
 =?us-ascii?Q?Fz6FXJUp5LeXFGhXb+CzWdJGoh6Nb5q4U0Hg/OFpARWbq11prYmSW6c6NgrZ?=
 =?us-ascii?Q?RnYdYu1n4LgXETQI4stXdAshZOrdYI3lInZZyoKkHDlRCUL4MlzfDARHqGw8?=
 =?us-ascii?Q?5IwzS16vpPn2lrDWWAH8QLRXKcJnHitwfxnj/3Rll7A2N9cb+uOfhzXRcMO5?=
 =?us-ascii?Q?wtH7Z68jl1QrE0vM0B7f1MehcqcQ3hkUnZWNihSNrvUnyUrwgJjgwYaMDlhL?=
 =?us-ascii?Q?HbhX7I+dRTWL63XW/NWWVcRQpO13Sy3zTXMECY5GaqTkXvJvvmLw+aEBj3gr?=
 =?us-ascii?Q?OAYhqAOrTJshUzsR8TPlRdDdAhUmZf88WWx6sgcraA8yuStwy4VQmqASy7FF?=
 =?us-ascii?Q?XshAEAZOkUvtqJworYrkctr+wLLtBmruDX43qV9x7935oA7Pv++SHU+osIuI?=
 =?us-ascii?Q?2ckP2hqdLeW+UzPbbzNSCW0RVkSfXBMXbmNpf71sKX0Vgm2aDOXA1O3x3Bqw?=
 =?us-ascii?Q?3hT6hgDq1z49ww6DebDsDvg+KWkSEyJtUkufprfnQ5CcLtKSHM7fowbwpIcE?=
 =?us-ascii?Q?Z4OJLNErUCVbHTIQkbw6bSOFjrXfWyvGGCrwenvTgZkRtIKbHgrdkyx+XiXV?=
 =?us-ascii?Q?IhS5lYA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OFR7FH+SVObTY74zldMgslazDW2QT+AaNKku45us7/849ipzS1y4Tz7e555G?=
 =?us-ascii?Q?C0SOpjsSZogBo7032RH/T6f19Ht3Vdz29GW86EL2IL5GeKkE+LwiAOe6Cjn8?=
 =?us-ascii?Q?d+IN+1XyITvHHe2PStc+DQVNPb1wAovsZHclaIw0tf1EHBvyyQ3MRdDhuRim?=
 =?us-ascii?Q?ZfPecS6+fYvwzY0o8A7HySKbjYyxApwxGaTgSOJTkgJYOaWNEmDUs0UOmgSq?=
 =?us-ascii?Q?aCIuEDL0/MQ9PWs07fvaF9OuDEGnL/NW2tlH0AV+bfjO5dPDoRGTjIiQ+ilV?=
 =?us-ascii?Q?ly1jXo9Ebeix2gbL3WUAVnOn3kxVwwz0l5ETvXn9vvxlsE1/BaAJu5k/iIiN?=
 =?us-ascii?Q?bPm4OGBi/9jQwKj0DWgmpHhCLGKGHnNkXSBE4adn2jy98vy0aSK3CFSXXPtU?=
 =?us-ascii?Q?hRKaHa79HZi/+37DBdwYK2GWJrYwSAh4fLTLf+nlZNQszFHU9i772RrRe6oO?=
 =?us-ascii?Q?iA2DNAP96AihrcNi951D8/UZADzD01L7pJzgrmkVh5z06BpVxZOCG3InbBHu?=
 =?us-ascii?Q?hYPpCCB2+MfQCNgIpzuSy/IT1LuySdWiXWjoWjmBCZvcWVnngAt8VirCXqfg?=
 =?us-ascii?Q?JFMVmidzlAeMqBRhsaQ2a3JhpNYJ5WhAkYGux+U1z6ngP4FS8/0EQRR4FASm?=
 =?us-ascii?Q?3H5twsx17Ehkgpe+UCKqLRKjrp9CRowcXyLEtZAn2ZL8NR5RDuTj/6B1imx5?=
 =?us-ascii?Q?6UG1GlQ8WgJLCCLiMv0myRd5MyvOHv+7meqcZqPru+9jLtxY7TyGhl64whSB?=
 =?us-ascii?Q?S7c9thXMkVdXCvNIqGsN9nDQO3uObmDmEou5ofHHViNjM5C6q28dCgGANR3L?=
 =?us-ascii?Q?As9pO7rztLuA7d2WOwUyZci8HPogB41fUB95uf5aVN5mmJhBcy7gFst1smGz?=
 =?us-ascii?Q?9lJiw0NAeSRLpZlWMXm/ptAuHhVDUDvVo8S8ryKqHlKhzLTHYvonh/PcW3W4?=
 =?us-ascii?Q?WTiyB5aXlrt9h1oV3CjYMkvbhcWyDCpNJE4T9fcZGrvkwo7S8Achf3ng27q3?=
 =?us-ascii?Q?nm57EMBXltiUm2XwIM4XYXLAyOWxWQQNBE/wXZNDQgPIbfTDkCCV/6ZbfZcp?=
 =?us-ascii?Q?KRB+bMeewRc6Sl2xkzp4gKxK7KXO5aeVavY4uw8+Kc7lLchp2PsR17bFHXSk?=
 =?us-ascii?Q?JQZljRdKKNWu/hTNZkT8qU36uWXBOFNibLH7ZkKOIakQ2PXdmyWZRdldFhyF?=
 =?us-ascii?Q?bZjyrSpmcIGzkD9IOeUEvTp6/CuxgiBNilWdqSz0Kb8cO1RZLgBohQAcujgt?=
 =?us-ascii?Q?9G3kUD1NP2lHO7/BtCK5mJu9MvIbhFHyTe4CYDOz3rl5sFwOV9LsE0qnPQWp?=
 =?us-ascii?Q?h9d3dOy33NltRY2EtGmmoOcyDwgf5lBQXg+ra3hoc6bBF3t/XrqNLt5QE8vp?=
 =?us-ascii?Q?GYqElqlQhIFrsTuySDAdRzeDBCamGf8HIyE1ElSU3q46DfRm3IEKbZKIUEqx?=
 =?us-ascii?Q?5dCBmlusRrCdtdELlrf/S6Q8HwWnagXg/nIJZzut/m9QWgWw1ouFwhVKpy9h?=
 =?us-ascii?Q?bERwory+o4cCuElACKQHJDQ6E+L9W8YB5PsrN4tLxQFgxdWLmhwOC5XqrRzw?=
 =?us-ascii?Q?By3wF14Zp363/dIUkJrspWUMOmUQW5Wrd3in3uOw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6fab00-53f3-4797-b251-08dcdc6be4b2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 07:38:33.8361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRetUTJCW8sIy3Bg5ms4haDV+OZBERtdAIbQgkaMqtbSgXW9TQsiS5F5s1GabsmJITUiHGtY4w/aGxHW6w2i2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881
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
v9->v17:
 *No change.

 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
new file mode 100644
index 0000000000000..c17a645e71bad
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
@@ -0,0 +1,51 @@
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
+    const: fsl,imx8mq-hdptx-phy
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
+        compatible = "fsl,imx8mq-hdptx-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        clock-names = "ref", "apb";
+    };
-- 
2.34.1

