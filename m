Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C1963A217
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 08:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E62010E1E3;
	Mon, 28 Nov 2022 07:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAE210E1E8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 07:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eH0V71n9Ja7xKlUM3DwouQxVX9eS3O1c5U/4SbA+MySNTcKAq0DTkvu3MRZk54ye0bIbWtPH8Xu/LgFOUFBuleuQjcy0aw+yKVVcVtLJQ7IqUyiOYxJj18u62vgeU0kzt4UFPnagjoWbWQpb0AHa/XsTz7pwrlSyLwU7A+ixM35FMiT4o/4iEOeZKp/EDcOaGMBh/EH6a2lSiMhIuPmSFyhMahd3LulBVF+PDki9UoZZjo7dav/+z9zmT/H7rNriu4xZu2DhoLBzMWj29bo11OxSNaY5BeSXZWivUMCurkkDIqUCxKj55SU+iCK0zo0qpuxxLrh31NvFxYnwD3QruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diwjDJdmoLaEguwErnznmHAENyeZFTmaHBzXJvZMBNk=;
 b=RT2kJCL+biLx5VPaDSsUhoi2B5i6CTg9Cvcz7FxSBGn5DPChvCIJxdmAQHYPoR2SebT46lFZyzR5bshx82jMP0d1ENiQJb6l/NbMhX3GxlR/+j4QyqQutSXdy/1NREvpK+yhDrilv0zNVdCFe1exwF0GBFcMIKRnreYIwBw08105Jbf4od8h5bcWYDnibHzh8O5/WKannpHk4NdMYhQqdFinLLXcWjXLnfGtutRdORbMHke2yFsV7KZaww/BUKS9+D0iW41TT6DDcHyZzIwb8uHONYTUdpBEu7ob/HOwmUmjqraTtpaemkU5sa7uVNmkQKPKyI9V+Y+h0/rKX7NtRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diwjDJdmoLaEguwErnznmHAENyeZFTmaHBzXJvZMBNk=;
 b=S0ZSzDmUCG6xux1DoHBuBrTGu+atnQccDoDts8NhBZBvmW/eevGW2lNV06T6bK6lzyyWX8uAhM0kiQqsrLluAdO9HLw9KoJK5yQFlhor2tRgqlyymRodQRh06x4mcmQCpbHGDccfSXnWlH670XNMAW/t2+7K34P9quQgsaanVJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB9511.eurprd04.prod.outlook.com (2603:10a6:20b:44b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.15; Mon, 28 Nov
 2022 07:38:22 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400%6]) with mapi id 15.20.5857.022; Mon, 28 Nov 2022
 07:38:22 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v5 05/10] dt-bindings: display: bridge: Add MHDP HDMI for
 i.MX8MQ
Date: Mon, 28 Nov 2022 15:36:13 +0800
Message-Id: <ee28481b28a8a38109b109956e9502221b5c97b3.1669620155.git.Sandor.yu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 897d9387-3491-4c2c-ba63-08dad11386c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KVRovZD0FSc7Z7UvaD0TPRokidX1zY+D++JhToVA6yBOAyoOIQfgBAaMtKUt0n00FgT7/PSAU6+Fg4OssyNICAW0PNmeEsC79+EuRCxMFqcuAkJ1LG6cr80y/hciu4LM5iuXChb7kzwRu3sdorm6/gXa6aBPUzd1+C8SsVYnqSZ08okRg3DNUpmOt7JUzxq3GvLnpocMmb8DegeMtUKukmFn6UBkP/Ysblzb9rim/rHIuCDUc0GnYRSCsVAolYj+sCNYRy/MVfBhEv/rJZ60NBGDno/5La/1kFZwlTxlwkWu25qNVSZeDVtv39SqAvPRWllSmD+qHGFT2tj8EZPHAyslXaftMucYKZ/hEk/pA3QJiwcucIUrSoSE+OINTw+zI66zoqI14r/3oLN0JzmbVciICilL/zGodlh406D8jJflaleDenxz41a+tdesm9p1z7ZJnRib0s2nln7W9tHcdD2xkq9nnw6kKJTTiwfnzjuD1s2bTsuFR9XxHd1LhN0Y52P1+tLWOvXSPPB7dFCvmatJcKPiriRZUCen+Oz95eqKo0Yfg1qEgwZb/mQ5CTQV22RftpqkGme4stYhLAsZCz6944SNg5CgdE9REfZx9TZBzspLikQ9n3FWvGs4tCzzip23RqbZDoXMraeJ6VX+SpcnamGNCOAnwXWDZjXHZsvGJvk5HMtZB+oSZbLgBM8bD1btUGSk0h5KrZIloAyA9VAlakr8GsoeDf6xAZFiz3VOSXADi7T4nMUz/po2/D3EUN1CT4C8ZRaEwf49bYwzYyluV/k2e+a3DLuluXLEW5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199015)(26005)(66556008)(921005)(38350700002)(86362001)(38100700002)(5660300002)(8936002)(8676002)(4326008)(7416002)(186003)(316002)(2616005)(66946007)(66476007)(2906002)(83380400001)(478600001)(6666004)(52116002)(966005)(6506007)(6486002)(41300700001)(6512007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F0pw+NqjdrDLPrM6mZq93+JzSksfQCFUsuKeUKfyBSzundAGB0JcG2sBFnip?=
 =?us-ascii?Q?9q4nCwmTgoUD93AlGRZfchvh4khgdu9lPGuZDaOPcPS2Jj2A0WRPJbtPLtHC?=
 =?us-ascii?Q?smHYNii7FDv+RoyJPXxQf76W0OCFF3pCkCfaxSxz/W7xQuMVMZAydnIwXUQ3?=
 =?us-ascii?Q?zkIPAPS/b8eVNuIMVmKZ1XEe3ueGz1BWWl8p3Y4xWMiYRr+eMQRSUebrT5tS?=
 =?us-ascii?Q?cZVrpxGf8r41mxfAGmtKEmVP0SvF3GbCkM+SYji0kdRM8TqSrBObIw8mY5YJ?=
 =?us-ascii?Q?+HofeCIvRpiH69A8PF2lz/YIw7do5J6xjNkSX4Au8QIwyDrBdqtEcLtg95qM?=
 =?us-ascii?Q?v/HanJ6SUWx8NhWhtfsB0F49pQ4MZDvxxUill/dIx/FGS9detjIZULwI+onV?=
 =?us-ascii?Q?TJqn1hmiybYZFSvWITyZE2dQXpbual4e4Z0i/KCHKd87yepgqx0GF3pzc7ba?=
 =?us-ascii?Q?ZFyIYlV74sPV+++B0dnwEoWMjNhc1WtEuz6vkt5kXytesAIXn5S7//l3xdwK?=
 =?us-ascii?Q?lBBBgTx2TSsvId5N95OZ3KN9CALcMVgVwMbHVhpXGKSAKSLL4KKOR1dst1rT?=
 =?us-ascii?Q?yoCZhE4nmm41/ShvgacE5hd6F88/tyvNJuazhOqDpLycdjTNOQ4ofra3JRwN?=
 =?us-ascii?Q?pcr5gQSSYMKJ0dpJNUgESIVRdZHRVsd8mgQmZGiUIn++BMp9lhDseIReCbzR?=
 =?us-ascii?Q?HhVA8uy66XAdey7OLc4J1gedQp1SxPrgSgtYc6zVm8JuwtR+Cvy+otouqswT?=
 =?us-ascii?Q?8Nrs8cch9KGaFWQo0b4k1lST8meEQd9aoeofxAW/bC+juV7nNubYQ/+hqiPt?=
 =?us-ascii?Q?vveobQUHbyCPvrlLI2qt867483WIUJqCj1MDG6ENZkCqrtA+7nvfKooxUP1X?=
 =?us-ascii?Q?Je2jxlApy1oydCAwCvAKESyjt3NNxVX7/WHsrB9fkqPoh/9Wk3UPiTcoJnsb?=
 =?us-ascii?Q?99ZWOiyTSW/0kjR8u56myLWH7vkQ53/UBCkleTZP7/rkPBLN+BdA8eP28b7W?=
 =?us-ascii?Q?/NpuZfNskEqsgZ4g5CyR4ia8plz361Xeq5JRO/spr2AcpoB4oN8o5S5fCm3I?=
 =?us-ascii?Q?ZwAuiDlA1JrfAIjj6Xbgtf4vnP6r6iqzpWh/Xt9LMDvm6MiW11W+Q5J2W76R?=
 =?us-ascii?Q?h8LHPp2v4XkmsVN7zenlb3WvjhzMWH+9Yy1XGoyQ8Wcg030CEu+yPN3Tv8x5?=
 =?us-ascii?Q?phZwZOuZz2RU+L8wgbDJj5gA93z6OAdtahQqWr0XpHdOqhjLwsGS4T0pahAw?=
 =?us-ascii?Q?xBsdQrbudVpV0bOiUaL+PBsGjnWi0W54EOSzjrrs5kmYmww0Bk4xgNRwxaFS?=
 =?us-ascii?Q?4ogniKDPyufDvaEPSYTRnEt9QJ/3JROHXfCFJ82dB/lZI56FejAzyeiEQBMt?=
 =?us-ascii?Q?Caoc73ddDR2DR1wUcACPfaX0cYuS15s9c6im6sPKzYSUrNJPdGLvzD//+V7p?=
 =?us-ascii?Q?C8HvgdUSPMWKuCsTGDUDHuJiDkbVmE5evZEdeB9TKiJoebpr7rMBjC7xR6xy?=
 =?us-ascii?Q?DHJZKsKQxqzxsCUwpOV8bGtXj7BHj+eYMV6vyHu4VpS8cjXafUwzp+oiqd+e?=
 =?us-ascii?Q?fjRlvSQAXNgzHAn7ZDDtD6FQ5sR+PE16l7yk/IVi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897d9387-3491-4c2c-ba63-08dad11386c3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 07:38:22.3622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMsbUjpwD4ELHw+7mHmE/J0l63/Od39jLI+l75+2AltER09r+R/XOO/2TGUldcF/d1RpH3Ep/n6bG8uDp6ZD3Q==
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

Add bindings for i.MX8MQ MHDP HDMI.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
new file mode 100644
index 000000000000..cca6954a84ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
@@ -0,0 +1,102 @@
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
+  clocks:
+    maxItems: 1
+    description: MHDP HDMI APB clock.
+
+  phys:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Hotplug cable plugin.
+      - description: Hotplug cable plugout.
+
+  interrupt-names:
+    items:
+      - const: plug_in
+      - const: plug_out
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port from display controller output.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port to HDMI connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+  - phys
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mhdp_hdmi: hdmi-bridge@32c00000 {
+        compatible = "cdns,mhdp-imx8mq-hdmi";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        phys = <&hdmi_phy>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                mhdp_in: endpoint {
+                    remote-endpoint = <&dcss_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                mhdp_out: endpoint {
+                    remote-endpoint = <&hdmi_con>;
+                };
+            };
+        };
+    };
-- 
2.34.1

