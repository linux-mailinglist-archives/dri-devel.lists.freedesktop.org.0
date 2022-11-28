Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C2763A231
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 08:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5954D10E252;
	Mon, 28 Nov 2022 07:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2058.outbound.protection.outlook.com [40.107.8.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD20610E1E8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 07:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEenbYeJvpvtqTeYvi5gfQuw5+bSysCJF1qFb0CUkor0wFR18LFQjGbcdTkbTRPeMyaM76Zy9viSeRDnP/QFo6zTzM4kg6pMGR7vPJAtSXq4iKY2Yre3i4QZ+vxhIr1L9H4S+OAPPw6YMEeSUfTV5GfE5Ss6OO4Q8WL0/JsCF1bBuSMY0PYr8RPnxSCB7V0OnPpSy8Vf2SUN3L/ZDTKBi9Smcme3VD2/kHrgpHILLD8KU6wFE3TAWgf77puv90J8bwqqUbM7UU3CwQ+gT9tE4/07nt6MXRVRzrgoRhYT7CpfStyzp6U9KSa8TN63TYnvdOKqWTyGZmdIflqu8kLAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMptG3TVD2M2OHDRDc4ndsddNjJwE6SfQs5tEWY4NzY=;
 b=GeOYGWoRo6kL4myV7tZ9u9C2jFdgDZ9PW6pDZa8AoFeWrE/JsawOTgD0GDzeRRREb4QRt1N9PZipMpki+95MmXsL9xpKlAzgoUmz4MEMwegLtGTjKY/Z26yvgs+6Ayk9DiU+9KcvQiSNhTlZfVTTReMXagmJngiqGZnmStlJ7iP05iJBgOui9gC8nYOmiAZX6l/Ds11hKl93NhD7NkDhRyJM/ZiXqQeoEYCemlysvjbZ3TqRO3x/Z/OL/gl7wnlTD5gd68J+t9wLD2PVgDnMwbZECau0Lw8i7virAO2j1DVpCwNOZTxF2ix0xyvz1Ozyzdo9yWv3dfPIu+OWcDSrkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMptG3TVD2M2OHDRDc4ndsddNjJwE6SfQs5tEWY4NzY=;
 b=cVhK1fyWoOSAU0aplvvwraxjCzs4bJ9Ypkl6tyonTWjXk35MOSmx+1+jjFEktpN5PWtsi8oRL7RLG7Wr9g2IYNqNTRa9vk02CdXHfahSHfjVYIkqK4ztk8YeLP80uYjeS/a9LHbDFKbjXUm6uSmdG705sVlHX3ZukYGCwgwBsFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Mon, 28 Nov
 2022 07:38:51 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400%6]) with mapi id 15.20.5857.022; Mon, 28 Nov 2022
 07:38:50 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v5 09/10] dt-bindings: phy: Add Cadence HDP-TX HDMI PHY
Date: Mon, 28 Nov 2022 15:36:17 +0800
Message-Id: <2b9fc96b0340f05a2770ea2626e56e1ab6569dd5.1669620155.git.Sandor.yu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 7361a6db-aaa1-41e5-ef27-08dad11397ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ex8E5iGz8LQwpHdkCgaWv/GJTyDgx05j5lQNI76vfOwdScHyTxK8nsbu17xMQcbnvqk0DqwcD3u76myiRSpm1p3ZZi47QiauH8UkvYek0uar0aD+LgkkzLfpXBkbpAe9RSOfaGqc/AHnJ8wVARTHbruQ5HDlkPLlHOhKUKHlHjN2DUn4GrA1iPGqLtuD/sC+vPOjr8WFJo3SmSrwhs0O9NxNehenVLUUtdabSdRZs5UdP/bei8VXm8/EB43jyaRTO8P2ibx2QOBQIm9455W8afFxc/t1EiJiILNEA2yXWPe5p0H8P5Il8FFSWsJC8fNcB9d4OuPUXzEN62XwIWcXVH4awAvvozCJ2CORuUEuzuAFK7y22JZ9dHsv422k4vE2HLd8NnDqs+sVR87+z1cZyB0qKR22facmu+9T3gr/wdIvOPIJjtg6MJFuTtcZO5Aw6DNm6Rn43S/J7b0A7D+NPV5qNBJW1yT5Zwn3Xe3QkEyK+qG3il9fR1W4qkMDKO6J16FkbBUDtqrjZX6JlRMvdFDILD8JD3oEX9n48dMyXJQF+1u09uhvgjbS16vmvi9HOrv22RT56H2Mjzvp85rekexBxUtklTokVCmxj+dzBVRc8JLZjOf1nfIFbFiSUNl5Zr/B3ICqBJ96i9Fw8NNszVWoVm6Ye3KJrtCO0mI9AjKGXhWjePsW7e5DywaN0stxjlof4N656Ao48FDuaC2yOe5R7vauMbgIEceiSbsIjPDduJe55xQfn+rSpRVph0JrGV/VIKa8iHBqSLg8/uP3Rerkk7n3T/DlC3cyqBrzocs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199015)(38100700002)(38350700002)(478600001)(966005)(6486002)(83380400001)(7416002)(2906002)(921005)(186003)(6512007)(316002)(26005)(2616005)(86362001)(41300700001)(5660300002)(8936002)(36756003)(8676002)(66946007)(66476007)(66556008)(6506007)(52116002)(6666004)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TptJJcQDqKjS8XkovXXOG4AF560niDl6T64TnrJMylzMfDTX6IGJxm4sIkho?=
 =?us-ascii?Q?6Wq7hcp08YQCIh4NlLxzZlHyjd3duzmKhIHuaZ6YknybNSRhn3/A7p/qa8Xb?=
 =?us-ascii?Q?tHgTNX4HE77arfNFOU2ZiTf1aT9lD4G41lF3EN+1TUfy0rOAoUtV/ZnqvOfS?=
 =?us-ascii?Q?9jMOZK/si7p9YQZ1GqNKjdLkkDRjTbtDo0vx876E4HjuUsaFCsFX3vaCtwfO?=
 =?us-ascii?Q?v0nqrMV23oB4LLE0SY3t2CFfSAmbxwqsyqPRcG0iDY54b6zsQ4FeMBpDHhRB?=
 =?us-ascii?Q?ASQK0bOUH8JJRAziCMCbXDmbLN7mlTddpIvG98/LSYBOuTlsgpU28ebaJwzr?=
 =?us-ascii?Q?lAx1TU1fmkb2LWuBqbSxIPHGzZsRdOsktnJWanOSrbHa0Z4jsW9epbP4ZTS1?=
 =?us-ascii?Q?5055N+Jocjas75uJcLCsocoMvzl+tLp3i4spdVzwF7/S8T8BT0pd8vhiYVwx?=
 =?us-ascii?Q?YQx+Aeuyiur0LybRM+AvuCz09S0rXg0bAgcotdGOh8MtRQddMIAbzyknGCb+?=
 =?us-ascii?Q?NRI+d5ThKg4jjcK/4N1KwAvgc0henGfhdDlny9EjBb+lq0a0ylWlX6ktHBjh?=
 =?us-ascii?Q?bl0EAS1t3aMo43N2hoxiWr8GNbB5gB5l4BwdWCmPkKuUvhuKR2kaiva9gt/i?=
 =?us-ascii?Q?m2q9nJW6tC7d/bYZXOwGR5Mc7YwLOGo+3N8uREXjerMeKcjEfHKSKqfWbt74?=
 =?us-ascii?Q?IBhtqrKub1RIp0USpU2mYL6CEPVIpArlo5Dw7qbC/a4jL49gqv+rmKMQQ+VM?=
 =?us-ascii?Q?OF2xrJ3UzQ7IBJb4rv6kJy79S7GPJ1C1QeOVC9V/VhnuS7n7n2IxFfSoNBpu?=
 =?us-ascii?Q?SSqeWDnaABFl+SFFMFsRS+XeflYVb8vzlc/+sd6UaNyVISxOXIAk8bc5s07d?=
 =?us-ascii?Q?uKwqBwsxvyX3EKyrBdrWVNpiYqSx9pvYqdCxoPWx6YjaligfQ27WhdK7cpu3?=
 =?us-ascii?Q?4yxJNviW9FqckdZQgtMnwH7Cp6TVYyplwBzL6OZ/wHzf1ClrU6RyXZbdbYoH?=
 =?us-ascii?Q?j9ytHGW87xmK1YEmTi+Fn1hXSy5s+mdxMvHdT8cEz1kHIG04/BeCjh1WQzSn?=
 =?us-ascii?Q?X3eb61NrgPWi87pezlWJ4Potp6kwBArpmNw9N3PQcjakA93FAEJPl94w5NEF?=
 =?us-ascii?Q?jQeYM1OWCF9vT5tmTmNBUUSMNWL12Hto9er/f45ngWcl7q340B65LPiNI5G1?=
 =?us-ascii?Q?Ev/Y8ic0GSt/nlciLnJxht06eXIwPSCnMZCGk1C0eMWwySveg2KNwlps23uB?=
 =?us-ascii?Q?+CiRtfKO6Qa2zeOqZd4vp7lvPKhVlVm49s418tiXRaNCjfs7lbWf5AFAE6D1?=
 =?us-ascii?Q?y3Qxn6aaFKUnEm37mXl+hXWqTJ4xch6+W5SM+hxpjN67PT6+t/0TGvERPVu2?=
 =?us-ascii?Q?eCaJl88vfMaFXffSDWmXfkkOAuSpX8/rPXYWtK88XEcuQia5EUdW8Z7Sf8ET?=
 =?us-ascii?Q?kNeMliTZrnFikTpIXKs8Xn23j9/Been50dLQjcwagFHt1OjPJOWz603hIYt9?=
 =?us-ascii?Q?UT5Ilkhd8hpV8sya1REyi5gdugReTj+T0jKq3tN+k9isePydrnaUYCDDyj6O?=
 =?us-ascii?Q?yatHUXYJzOPW64p5qqxErkyHlWp7tNtZuyniEgD1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7361a6db-aaa1-41e5-ef27-08dad11397ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 07:38:50.9035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AL9/gGnOKNfiPFYxY7+Ll9oc0EO5PzgQysj3uf+HojgWSwhwHsRJOabg2Ted7d7l95OtFQoRdk0goFcYK5nzAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8366
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

Add bindings for Cadence HDP-TX HDMI PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../bindings/phy/cdns,hdptx-hdmi-phy.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
new file mode 100644
index 000000000000..9de824635a03
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
@@ -0,0 +1,52 @@
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
+    hdmi_phy: phy@32c00000 {
+        compatible = "cdns,hdptx-hdmi-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        clock-names = "ref", "apb";
+    };
-- 
2.34.1

