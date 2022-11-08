Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F736211D5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B027E10E43F;
	Tue,  8 Nov 2022 13:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2084.outbound.protection.outlook.com [40.107.105.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C3710E448
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 13:02:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cd7n82ktJ7GUCig8bAPeysEn0hpJwyFfxxeiYm46kbHN+PZLuPjXmFVlFtnDT2yf5nPRhCO5CAhT5eNOhYpsilzG4w9I9x0vvSCNPhxLbBPDChy4wVaWr99/jApP3l2D3GzsslYAUSlmlb+1zKXQexYTp7/wdvmDTVz2VbPNRGuOMBr64u7Nm82O0sZRv7YiO3hKVAtiOyNR0NC84j2fqeiURKkACYg/PiepfME+ea98D3I/T/B3BdSW7ykOi4RctKawtvWD/l60SaZ90hfu50X3pYU5xTScJAdyKRIN9RLLb3J0dTxm3D9O1jwvpfFxWPE5WU+5DaUEWeK1Z4qh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nr1V+IDvnMPs3mg6E6BEElOgoUA3UvwajsE+gn2R4FE=;
 b=fUpKK0DDE7ZAaMvVppQEW4x6tvZviD1j7SfJ7SCQyLtbBXQuv9n/wMpseyh6OL80yTpssruyCMaW7FNV+PR/lZ+liY+91nUq3UbMv4NACTw3yZ4dARAw2DFoZSPxXsQ7AdN6dd9/Py+JX68nrZMta5RYn0pvTe7eWfXFIHmE8Qg/5GUG8M8PyEgpBHce1d/M0JkxqE5bUeAkWq9wc0jDHJewsxkTX8g4VLJhOvmISC1pePbc7Jyk+SprAXA4bVLK7po8s/f2uxqlfidTqBTffeiXezV6u6pQeZoeG0Lv7GkqcGHsBj4F0J0IKza7yS+wP9yWG/PqMhWGcoPnDOVCjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr1V+IDvnMPs3mg6E6BEElOgoUA3UvwajsE+gn2R4FE=;
 b=ouqn6JaS894dVHMFQI4WNMSAmyRyZpFc0cR+Iww8baNSPrmp0+qdty+NxvYWlN4P5iAXKhHpifriUIoGAQZlKCzyDtpyd37X2+FFbPDeFolXrZH98AeOSf63y2tOy0xCEM+nicfJZgyPLssIJS+Ne14KE9/0Pr/20Ta0qcrdZlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB7059.eurprd04.prod.outlook.com (2603:10a6:208:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 13:02:33 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%4]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 13:02:33 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, vkoul@kernel.org
Subject: [PATCH v3 09/10] dt-bindings: phy: Add Cadence HDP-TX HDMI PHY
Date: Tue,  8 Nov 2022 21:00:12 +0800
Message-Id: <a88409e6003fbb2a57df36ef4116a2cdb1c1eec1.1667911321.git.Sandor.yu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 76c01089-03f3-4e39-3741-08dac1898075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: me9LsHFQSQSRnr7y9t5EGSgHyJd2/91csDkGBeFifkBitQVvjIhqs/hUmO4DoJ/FLgKd5oOGba5n2Hq/MT6X0lyKu/1HNFqbkX2SYygg1v1oublBsFfdIxZPfBtN9f/PmKfp8q/PlPAgTbmlM3upeqFwg7xDyYr3XenV8VUwJEzmTeCwcbKa0M1jmZ8BUjW4/H7RTaw9hVQPXmmJ4Aye1Xm08vVSd53yJzKa7pLUCi5EWJ+k2+TrLt0pWpW9qHwzVNwaKqWFn1GCuXa9L0FsmEogoX5SN1Q2RylHKeuFs71TDWTmxTgk3u7RLgbLiu9BigzKlyoz/dsDlrq66Qn/tHmxJA8sHc9FjOhfMWKpV95r8EmyNzV5XS30TYc5/eWhYWLCgak80nNQ5ldAyIx0EGCw286TwV6S9riFBTcVxolOhJvgyoUMo6Scp42CeTQFMsOtgs3CFE1IS0QYvz6iXn5VAeUHi1BMB5UgBQL7xp1MAkfBCgTd57u9iKV/4+aL7zfAp/ACP6uFdeab8xQu13EgP3MBglkegZwMhKnl/h71itejDWQfT/nEbzkZ7yZmcpk3Gm5cqWxi5D40o/TxvqSZWOn7nTV9mgf6y9pa2hemWTDmgwSjUdvyH7t7nzKjNpvciuUjM3Pe9iz6JA79y/CM0rmfkcSFAi0aJ1oQlhHDvlhxhFlp6n5trqAndSzE6T5TZdHH8/3oy82fwROMtN1fyVu2nLCgPvlF1H6hNKR6kBrmKGJAXD46Q6ifR1p5VGUG+pCEbofGfUvtLNYmuMwKctri/CqMSrJ+2uZIVHaT85NfYhqo0343ejQHRr90vtcwOV+bCAObEZsybDRmf42k7gP39eYsyOHgOCapJJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(86362001)(921005)(26005)(6512007)(41300700001)(6666004)(478600001)(38350700002)(2906002)(38100700002)(36756003)(2616005)(8936002)(186003)(7416002)(5660300002)(8676002)(66556008)(966005)(6486002)(4326008)(316002)(66476007)(83380400001)(52116002)(6506007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ofy+TWEMIxK1KMSsTJL1tAiBDJ9itIouSgRn6BsV+OEhqSNrfRfCPX7Iwz8O?=
 =?us-ascii?Q?yaGrg8y7KVyKZwOC1SCYnBUU+yqCk3hLlgR/p3ac89VrWZgkeKHzz0DGvXfc?=
 =?us-ascii?Q?un+sW5jEq/me9c81X1Oi04tTH/c0qPumn8OWV+opYRVsxOE7mRvmDJE4QJ2x?=
 =?us-ascii?Q?OOnJTsStiS/fUWnlFvYxJSce7hQE5vqwXNtTKdiI3bDSsJc5kvtKagRkB2Q3?=
 =?us-ascii?Q?M5IUGWEiNL5z2O/JrqiiyzocQe945c4M7dwPuZHn7NKVasQ0XrS5bL1JVx+F?=
 =?us-ascii?Q?09inhh+J3HL9NlEHexDHrzXbVT7xC5U3l9iLHNNKfHN6HAXOpksstIs+oI0x?=
 =?us-ascii?Q?CWJwd1qeeZ9rweAaXw4AmxylChuoNYQAxmGpQXhvrhMW+CYsFEOTQJXKglA/?=
 =?us-ascii?Q?5EXWuc8Z/B23D1ZzJmmz5nibjdcursoqKHiWxa/GN6mdFRZTx3hAp4/QKOm0?=
 =?us-ascii?Q?PmLRPYCg7WMZjo3gdoQPRUUYF1C1wlxLT7otnHoBosLVfakRqg/NIjlEnJ18?=
 =?us-ascii?Q?WBicIvEawTjiAsC8atRPifJlTAaAg1jUYgaYaaQxElxRuIBHSbClyHO06S0v?=
 =?us-ascii?Q?Vmtgf7hPw8069fsGAF/SX4Vt9ltimDcK6g2SIR9HK1qk5FomPaVKbItSg3UJ?=
 =?us-ascii?Q?Jx+bEpTZHz5wG01B2d+W+mQF+jW8Dp2oIHgFYDIE7CVNq9bdxVPRQaL4OTOe?=
 =?us-ascii?Q?Ro4+NQCveitGy0YD2SKrqGA/iSZ8uCUCiTT1HsRIXbKNQAs0S+fTHPf0r1tm?=
 =?us-ascii?Q?b/rg/uxU9U/trMMsGA3nR6npz4gTautilToyxNLPl3fsnRTtJrRIKcvphLd6?=
 =?us-ascii?Q?rxb0Ek2tiOMq0mdpF+W64QqYdwp5WCy+HWS84g2valM9umsSKKjWNeCrWz9g?=
 =?us-ascii?Q?wgObeecFqCVOPnqEj/2Lki/zX7+U9D250ksrjXE6HyR+XIr0ojkPygY6nfFI?=
 =?us-ascii?Q?oEHuaGEqnRBj2ILwMy3C2Lkx6VrgVo6F1PzRrP2eEwk00FPr2bwdf6NlQUVf?=
 =?us-ascii?Q?iU617N9HhHUv2NIZiXNEi/Huazj+HWkIo2lrpaXmJX+YOc7bgdgQnnTRNql/?=
 =?us-ascii?Q?xBcl4YeDOY2HxzRBKiVpdqqYUtm810s3dwLy2ytVP8p6/VcKZMNa6fzVmF5D?=
 =?us-ascii?Q?NMg3As26YrDyuCfgcxbU9cWBYkW42yzwxvsJnS+ATw4/DUfNspW1sALzCzdx?=
 =?us-ascii?Q?g4yJhJfTQNGETUnZOb/JLFnXiPFV2qK7jdHCKI5PP3pI+mmdOeGJofMN+V01?=
 =?us-ascii?Q?/Sgp7MgOJq+jJ1Wbb1stDJ/b8yHBzATCOtNkAaLcS4lKnKN6YeVNDIQYEVMA?=
 =?us-ascii?Q?XjcRBnqnvyM4/Q6PAG13SbB0exbvKfjLDDSEECKthQWRgylqZIp2jp67Y9S5?=
 =?us-ascii?Q?20RVLglCwxCP7JCzqzES1j6hB0ppyb7J8YvrvekE86fk0UnS2kV1N/hF322X?=
 =?us-ascii?Q?9aj2kGIbEmK9L6nAaDMAMkN8jVIGhyRXcuS5ckPfvFkENGa5JCSaG8k/4rUp?=
 =?us-ascii?Q?Jvj80AGlaETkLr6sNRCtbwGMiWLTMdKB4cTRSSeDXQ+ueK/HKdi7eE132BN8?=
 =?us-ascii?Q?E9yDfrBH865K3Ep7zQJYIX2+Aq82qFryYHm7v/n+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c01089-03f3-4e39-3741-08dac1898075
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 13:02:33.8235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fW8QKizxSfa97meY5FTfikJX7YPUiYjKhxxXzNpdAKxZr9vD9301uRYGvWlLymKWcs/lJWgKAObP6MiKVf+BKA==
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

Add bindings for Cadence HDP-TX HDMI PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../bindings/phy/cdns,hdptx-hdmi-phy.yaml     | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
new file mode 100644
index 000000000000..c2ed17ffe6ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cdns,hdptx-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence HDP-TX(HDMI/DisplayPort) PHY for HDMI protocol
+
+maintainers:
+  - Sandor Yu <sandor.yu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - cdns,hdptx-hdmi-phy
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
+    hdmi_phy: phy@32c00000 {
+      compatible = "cdns,hdptx-hdmi-phy";
+      reg = <0x32c00000 0x100000>;
+      #phy-cells = <0>;
+      clocks = <&hdmi_phy_27m>;
+      clock-names = "refclk";
+    };
-- 
2.34.1

