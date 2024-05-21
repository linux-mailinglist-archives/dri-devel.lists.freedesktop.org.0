Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F213D8CA677
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435C210E215;
	Tue, 21 May 2024 02:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE8E10E051
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 02:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDvf08b3mYfLZqMxLL/YU/cAuzI+YgriLKHVlP22sjIQA3MBomL8XBSG24hZfmgSJU0Gi/9+rMrF0ngHkldh/NvSgBTjGNNst7cE8hWaffgi+R1rrBYaD5TEj5Emg9oKyEdLEFTr2wM9QC3ty0BqP5ozusqS/N56gWv4bdntL1dIV9WLVrwRK0eqcORetB57TdxgK1tA8NOzNq8eGlnH3/MBgguf+JPdBu1ep3x1iUqmhV9JNNKpjq4t+/6m6OpMG9Asueoaf7iXsILKLwF0daKTs+Hzz6xNfZIuVhtdQO2asrUdmLjTBXeqZnTbPNOVZiNGX2AUWNEYRrqgUwNhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5VUIs5MMdlJBghMXADd8XuNM290vTkawbPugNbSF5c=;
 b=ljGx9q7j0sRSB6nEJm/FHbxzwkZPrdYd4eW9T0/5avrHr+niRE3U6evA/Ot6oTs1eVLi49ET+oazDDSPpAsM2AO5McKZORLNv0XsCAVPrVKtIxEeLDq93kH/Rb++ZXKQFugryHzEeqnH06fvBpeX4sXX7JJmXv3hSX+dVeppNZkiDaGRQcDAu8ZxGSFqbhHzPGOFyXmSKIz6tI3lf8gHrdQZjuVRU63SAAZOG495tg49nNzLEJOC7HZoE+eBHBxvI00nKa0AKFAPBVmwgraGfAC/4rdpBjPf5NYn0LDhKe32dhdp/bWbEktv+ettmNdH2e6cfgk2hOHv5dCLqT96Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) by ZQ0PR01MB1255.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 02:58:26 +0000
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 ([fe80::39be:8ed9:67b7:adc6]) by
 ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn ([fe80::39be:8ed9:67b7:adc6%6])
 with mapi id 15.20.7472.044; Tue, 21 May 2024 02:58:26 +0000
From: keith <keith.zhao@starfivetech.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 xingyu.wu@starfivetech.com, p.zabel@pengutronix.de,
 jack.zhu@starfivetech.com, shengyang.chen@starfivetech.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 keith.zhao@starfivetech.com
Subject: [PATCH v4 01/10] dt-bindings: display: Add YAML schema for JH7110
 display pipeline
Date: Tue, 21 May 2024 18:58:08 +0800
Message-Id: <20240521105817.3301-2-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240521105817.3301-1-keith.zhao@starfivetech.com>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::29) To ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1047:EE_|ZQ0PR01MB1255:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a9bd704-9c9c-4091-1f94-08dc7941e2d4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|41320700004|1800799015|7416005|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: n2h6KG2idrbtjLH3cJrOZlvC3/zpleNsoJzW3tkBtC8tGqzFfjQXlBM6lH7i69g9M3plRsnlvSfL5dCqhcPGrKCElMxceb7jnQvXrRHsK8VoqkQ+gs/CMwC2Ho/ofWxeG3/kc0TqDLfGSbTwVQfxAd5Rdxvb6lUUCJ+OXIqEG+Jkz74HX5t3JwqAjf0wnJR4qYFVqytaH/HFfPh5k87VdoQYXVtz9RBp7UdludA8uBXL2vtJUjXTzSyLFRUssLDvnRr5Odzh885OyDm58PkAXtW6zUW06P4ciETtWRQVH/OCAYJdNwBY/kYaje/1evF3Ei/EFe/YZa9EvVtyBqLTglxTj3pKzvy+02tJmhy9lxayRwzc82shL/iLXAiy0hdj82n6Gw3mUbaMjM8Fd4Uf2RiFJnFY2PiNI5XzovhRpAX111pENaJNPqXt0xnr9O4mQrwy+4vPf3z+6DJ/6o9T7h8XaEKQDuA5piyIDIrUS92y9RpnkWWlJLlctQfcdLbswpMmWPzKqchlz/5W8TPvVgXFUFDxJoIPEp2g5nmSyB525RoK9VCADaxcrWLpRP1bDzbIaJDAmzGEKIqD2Mev3YpjvP+vMtb5yeqXJ4ZqzU5T0kqU7D89/msokFNIaw3ZxnCUd7QWBKcs3fZq/hUIwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366007)(41320700004)(1800799015)(7416005)(52116005)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BuR1p1pSS4aaMoRyH50CHuQ4U72whXbfr7+BlvFAmVMv1HYkOpid9/W+AD9O?=
 =?us-ascii?Q?Tm1G4puPBJTR5lwNwm1P7suBSHyhbaxYRP1yW8OfhBIuonW/JS68TxAfDzjo?=
 =?us-ascii?Q?6to1Fhq4vcdRAC39havT2sCF1OdHug448vveF/h7sgf5rRfkQPOv1MmKkhx3?=
 =?us-ascii?Q?dDQWIEntLMh1kzETXYIF861jopGDuUmpgT8W7Z893JZ8QeNe3SRpWhb99mx6?=
 =?us-ascii?Q?kzCgnOrluQfnSXsSMlFasEpVnEH0lg3Si1vWIT/5U3Zv941VNUl+u7E+nBv6?=
 =?us-ascii?Q?SrW6XzTbMhFdPv2w68MPkzvjs5jRPuRxArPGH39xLDopeDRSPYSGEI9dHmD8?=
 =?us-ascii?Q?sRUKreedFfuZmngXk782faiVvyItSLOMrUZvI8j3Nu5ybG85CBMrFRFT0Jjr?=
 =?us-ascii?Q?bsw3vCXmXvqxTSqq9lJMNuU2a23U3McAnrG51KxE0iPoscdLjA21ftLIkwSx?=
 =?us-ascii?Q?7Prsep3brZcXElAcD+v7nB2pIL5esPUvxajqRDEOgtjSP7opF+5+4yHB+tzj?=
 =?us-ascii?Q?A5RVqgKOyYNkeosqiVqD9yiB5KhPdLC0HOXevU89fieesx5VTpzxish1L5f+?=
 =?us-ascii?Q?cA9tUGkkpDlbl9Q0+vSV2E3T2i+1WB6aKAkPWUYa1cOgLn1syowjYm+fx/pl?=
 =?us-ascii?Q?QWQXdTpKF5Iuhg29k9HBvVGRIk1mNYPFNyVg0EmBKl2AxVCTfVqOj1Xj2nTP?=
 =?us-ascii?Q?cznMQOgYUUNhW15QepeFEZKZIiEbHvJx4aJAHHhhp/6f3DPPDkS9xv8ikvkp?=
 =?us-ascii?Q?jzk95+G/m0hZcIaTGFM8nVvlZxKmegrNU+Ct8716Qv3DmdiGpGPBUL8xPSch?=
 =?us-ascii?Q?bv6Wz4nzoIe35sI2OA18DfNgGK3FxdL6swfZM6T9YSShGIoW5SHlnAuFb+KN?=
 =?us-ascii?Q?ytHogfeAMlk2TI7HC7aex+y4icV1sAE+cvOz97XDWANkC99KrYZj9kzqhiTe?=
 =?us-ascii?Q?tZwpLkYLFi3dDYcah+1TjPZL4WeFM0j536ncSqf73dBnARUwuL3QZpcihmzu?=
 =?us-ascii?Q?nSNrFGzCkCRVqDWQMe6GbDjdY5pWuRn+91BOYncxxHFfxrVPJY5IB2bizw++?=
 =?us-ascii?Q?baJNP78nPZj2WfBVVeiIVs82dkyvx+5gazy4ASSQOuY9zimpEUDL1vfbZ1cM?=
 =?us-ascii?Q?kS4iMPH59WkeFDQVNsws5V0qOD0JKlWsOtzFGvbNnut6qoWKD7MDoCtz4Dvo?=
 =?us-ascii?Q?agm0J/moXc5eu9DrEm/CDAOKFL9SakVgVmwciTEeuDJbOs0uQJ3uLzUot58q?=
 =?us-ascii?Q?0weU//jQ0WpCy7L0p6KYjMbbfqjdB3qoqrZMZ9ls6aUtSfmpk43xB3XBKQ6O?=
 =?us-ascii?Q?KCp7Hd1znHAw4wCU021wDdlmQTOoJb2cRHyI4jp6YrfW2F8bvWnt0eKW2FOb?=
 =?us-ascii?Q?U3xxO2jEPyNjS5Xuq822JihAAFzayaeJ3h1Md2pGAj9BBonQIWy6BopCjQQQ?=
 =?us-ascii?Q?xxD9tDLFv5+LhZglDr8in2jIwaSeBaHuXOyI+BH4VnNChunLd90BVIgydt4V?=
 =?us-ascii?Q?auk/WgmjT3CgfvZJgmn2/SHh1n3TFQlHngnFcG5tOMgugyfaxIIz/lTfLJzt?=
 =?us-ascii?Q?T0/pzEyR4zfKeBa71bwrjwQZccH3jHybPyCgTJBMW4XwzofsghP2W2YFYBxV?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9bd704-9c9c-4091-1f94-08dc7941e2d4
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:58:26.5977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ij55wm/vMphgWFYssISW5nuOES20StNfwQdRiMC0eKRB3pjy1y/WaHMiY/t/Hp15n8bf0YxKdcUeO92pCbvagAzTqpTCoA6F55i8WoSiIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1255
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

JH7110 SoC display pipeline includes a display controller and hdmi.
Dc controller IP : Vivante DC8200 Dual Display
HDMI IP : INNOSILICON HDMI2.0

As the INNO hdmi ip is also used by rockchip SoC in the driver code,
the innosilicon,inno-hdmi.yaml schema containing the common properties
for the INNO DesignWare HDMI TX controller isn't a full device
tree binding specification, but is meant to be referenced by
platform-specific bindings for the IP core.

Signed-off-by: keith <keith.zhao@starfivetech.com>
---
 .../display/bridge/innosilicon,inno-hdmi.yaml |  49 +++++
 .../display/rockchip/rockchip,inno-hdmi.yaml  |  27 +--
 .../starfive/starfive,dsi-encoder.yaml        |  92 ++++++++++
 .../starfive/starfive,jh7110-dc8200.yaml      | 169 ++++++++++++++++++
 .../starfive/starfive,jh7110-inno-hdmi.yaml   |  75 ++++++++
 .../soc/starfive/starfive,jh7110-syscon.yaml  |   1 +
 MAINTAINERS                                   |   8 +
 7 files changed, 396 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
new file mode 100644
index 000000000000..8540174dcaeb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/innosilicon,inno-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for Innosilicon HDMI TX IP
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+
+description: |
+  This document defines device tree properties for the Innosilicon HDMI TX
+  controller (INNO HDMI) IP core. It doesn't constitute a full device tree
+  binding specification by itself but is meant to be referenced by device tree
+  bindings for the platform-specific integrations of the INNO HDMI.
+
+  When referenced from platform device tree bindings the properties defined in
+  this document are defined as follows. The platform device tree bindings are
+  responsible for defining whether each property is required or optional.
+
+properties:
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Port node with one endpoint connected to a display controller node.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Port node with one endpoint connected to a hdmi-connector node.
+
+    required:
+      - port@0
+      - port@1
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
index 5b87b0f1963e..589dedfcbee0 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
@@ -16,12 +16,6 @@ properties:
       - rockchip,rk3036-inno-hdmi
       - rockchip,rk3128-inno-hdmi
 
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
   clocks:
     minItems: 1
     items:
@@ -40,24 +34,6 @@ properties:
   "#sound-dai-cells":
     const: 0
 
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          Port node with one endpoint connected to a vop node.
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          Port node with one endpoint connected to a hdmi-connector node.
-
-    required:
-      - port@0
-      - port@1
-
 required:
   - compatible
   - reg
@@ -69,6 +45,7 @@ required:
   - ports
 
 allOf:
+  - $ref: ../bridge/innosilicon,inno-hdmi.yaml#
   - $ref: /schemas/sound/dai-common.yaml#
   - if:
       properties:
@@ -95,7 +72,7 @@ allOf:
       required:
         - power-domains
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
new file mode 100644
index 000000000000..07aa147a9db1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,dsi-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: starfive jh7110 SoC Encoder
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+
+description:
+  Device-Tree bindings for simple encoder.
+  Simple encoder driver only has basic functionality.
+  the hardware of dc8200 has 2 output interface, and uses
+  syscon to select which one to be used.
+
+properties:
+  compatible:
+    const: starfive,dsi-encoder
+
+  starfive,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to syscon that select crtc output.
+          - description: Offset of crtc selection
+          - description: Shift of crtc selection
+    description:
+      A phandle to syscon with two arguments that configure select output.
+      The argument one is the offset of crtc selection, the
+      argument two is the shift of crtc selection.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          The first port should be the input coming from the associated dc channel.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          The second port should be the output coming from the associated bridge.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+        dssctrl: dssctrl@295b0000 {
+            compatible = "starfive,jh7110-vout-syscon", "syscon";
+            reg = <0x295b0000 0x90>;
+        };
+
+        dsi_encoder: dsi_encoder {
+            compatible = "starfive,dsi-encoder";
+            starfive,syscon = <&dssctrl 0x8 0x12>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                /* input */
+                port@0 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <0>;
+                    dsi_input0:endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&dc_out_dpi1>;
+                    };
+                };
+                /* output */
+                port@1 {
+                    reg = <1>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    dsi_out:endpoint {
+                        remote-endpoint = <&mipi_in>;
+                    };
+                };
+            };
+        };
diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
new file mode 100644
index 000000000000..a28dfdd471b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-dc8200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STARFIVE JH7110 SoC display controller
+
+description:
+  The STARFIVE JH7110 SoC uses the display controller based on Verisilicon IP(DC8200)
+  to transfer the image data from a video memory buffer to an external LCD interface.
+
+  pipe0 binds HDMI for primary display,
+  pipe1 binds DSI for external display.
+
+          +------------------------------+
+          |                              |
+          |                              |
+  +----+  |   +-------------------+      |   +-------+   +------+   +------+
+  |    +----->+  dc controller 0  +--->----->+HDMICtl| ->+ PHY  +-->+PANEL0+
+  |AXI |  |   +-------------------+      |   +-------+   +------+   +------+
+  |    |  |                              |
+  |    |  |                              |
+  |    |  |                              |
+  |    |  |                              |
+  |APB |  |   +-------------------+         +---------+    +------+  +-------+
+  |    +----->+  dc controller 1  +--->---->+ dsiTx   +--->+DPHY  +->+ PANEL1+
+  |    |  |   +-------------------+         +---------+    +------+  +-------+
+  +----+  |                              |
+          +------------------------------+
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-dc8200
+
+  reg:
+    items:
+      - description: host interface address and length
+      - description: display physical base address and length
+
+  reg-names:
+    items:
+      - const: host
+      - const: base
+
+  clocks:
+    items:
+      - description: Clock for display system noc bus.
+      - description: Core clock for display controller.
+      - description: Clock for axi bus to access ddr.
+      - description: Clock for ahb bus to R/W the phy regs.
+      - description: Pixel clock for display channel 0.
+      - description: Pixel clock for display channel 1.
+      - description: Pixel clock from hdmi.
+      - description: Pixel clock for soc .
+
+  clock-names:
+    items:
+      - const: noc_bus
+      - const: dc_core
+      - const: axi_core
+      - const: ahb
+      - const: channel0
+      - const: channel1
+      - const: hdmi_tx
+      - const: dc_parent
+
+  resets:
+    items:
+      - description: Reset for axi bus.
+      - description: Reset for ahb bus.
+      - description: Core reset of display controller.
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: core
+
+  interrupts:
+    items:
+      - description: The interrupt will be generated when DC finish one frame
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          channel 0 output
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          channel 1 output
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+    dc8200: lcd-controller@29400000 {
+      compatible = "starfive,jh7110-dc8200";
+        reg = <0x29400000 0x100>,
+              <0x29400800 0x2000>;
+        reg-names = "host", "base";
+
+        interrupts = <95>;
+        clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>,
+            <&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
+            <&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
+            <&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
+            <&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
+            <&voutcrg JH7110_VOUTCLK_DC8200_PIX1>,
+            <&hdmitx0_pixelclk>,
+            <&voutcrg JH7110_VOUTCLK_DC8200_PIX>;
+        clock-names = "noc_bus", "dc_core", "axi_core", "ahb",
+                  "channel0", "channel1", "hdmi_tx", "dc_parent";
+        resets = <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
+             <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
+             <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
+        reset-names = "axi","ahb", "core";
+
+      crtc_out: ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dc_out0: port@0 {
+          reg = <0>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          dc_out_dpi0: endpoint@0 {
+              reg = <0>;
+              remote-endpoint = <&hdmi_enc>;
+          };
+
+        };
+
+        dc_out1: port@1 {
+          reg = <1>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          dc_out_dpi1: endpoint@1 {
+              reg = <1>;
+              remote-endpoint = <&dsi_enc>;
+          };
+
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
new file mode 100644
index 000000000000..bfd7dc41fc14
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-inno-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Starfive JH7110 Innosilicon HDMI controller
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+
+allOf:
+  - $ref: ../bridge/innosilicon,inno-hdmi.yaml#
+
+properties:
+  compatible:
+    const: "starfive,jh7110-inno-hdmi"
+
+  clocks:
+    items:
+      - description: System clock of HDMI module.
+      - description: Mclk clock of HDMI audio.
+      - description: Bclk clock of HDMI audio.
+
+  clock-names:
+    items:
+      - const: sysclk
+      - const: mclk
+      - const: bclk
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
+    #include <dt-bindings/gpio/gpio.h>
+    hdmi: hdmi@29590000 {
+      compatible = "starfive,jh7110-inno-hdmi";
+      reg = <0x29590000 0x4000>;
+      interrupts = <99>;
+      clocks = <&voutcrg 17>, <&voutcrg 15>, <&voutcrg 16>;
+      clock-names = "sysclk", "mclk","bclk";
+      resets = <&voutcrg 9>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          hdmi_in: port@0 {
+            reg = <0>;
+            hdmi_in_vop: endpoint {
+              remote-endpoint = <&dc_out_dpi0>;
+            };
+          };
+
+          hdmi_out: port@1 {
+            reg = <1>;
+            hdmi_out_con: endpoint {
+              remote-endpoint = <&hdmi_con_in>;
+            };
+          };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
index 0039319e91fe..cf9b657d0e8a 100644
--- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - starfive,jh7110-aon-syscon
               - starfive,jh7110-stg-syscon
+              - starfive,jh7110-vout-syscon
           - const: syscon
 
   reg:
diff --git a/MAINTAINERS b/MAINTAINERS
index c675fc296b19..8881652bb8b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7148,6 +7148,14 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/ste,mcde.yaml
 F:	drivers/gpu/drm/mcde/
 
+DRM DRIVERS FOR STARFIVE
+M:	Keith Zhao <keith.zhao@starfivetech.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
+F:	Documentation/devicetree/bindings/display/starfive/
+
 DRM DRIVER FOR SYNAPTICS R63353 PANELS
 M:	Michael Trimarchi <michael@amarulasolutions.com>
 S:	Maintained
-- 
2.27.0

