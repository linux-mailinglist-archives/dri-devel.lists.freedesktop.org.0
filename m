Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9946B26DD8B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964CA6EC2D;
	Thu, 17 Sep 2020 14:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2114.outbound.protection.outlook.com [40.107.220.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C396B6E997
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 08:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRgO2ZHjpBjYZcVdTlZjnTxzbkY/IvvgRWVkCih/cp5ehbiMgez1M3eoGCZb9F9BFcMYaw0bEb05+JbbuhGMRHaO3ZkEZeqYHgXDX0eCbvPQef0DShZ14PMQKLqweB+bJjEcHMYrldY2Cr36unFe3ZNyEZBZxibcBibkqNsu//m2Awm3QHGswUViGKz730hACnlK6/528O+YBmIjys8Lr2nwXPCpxWjVjmyMo6yM04SZNRH6L0bOo4cPbg4lFnEfAagf+uiQd3f0xXscoHAO7zrvKKf/rXdCA5yO8+frb3rNBA+V2/S8M2hvjknXsoPROpjaEvw6Zc7iBiC33Dcx9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2l02bwqOJcFgzvXOM1FKabFhPQkV7mDdw5aOX8Ym6k=;
 b=bD1zYMZinHJdId4fupW6FI6Tc9+m0LXCb/WnGvT7aCA9LvU5JRsFj2zZiWfxNJ95W/RVHjDmvJKF6ESTk4wywnD4xOUdRpjZ3wPaxG41niYupGgbIjg824XBM1ZsUBj8fJhMM2cFp8veCldWXilylTXWCkMMfmt9hFoQtnaS9dOFvW3c8AUR2cIIU3ila3QcpiqqJCbXzZ5yRCTChgxN+O6RsJfw9GBAIbo2zCfWT9Iuc8DD/wJjegwwdS+1KiAOSvTEJcK1hA/KJL553KUhkUhIAOO+xk0Hzk/GJBamk5OAWNARM0RDhc6B/vxal/15HGVfqTJpNk6iS+QCWWin7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2l02bwqOJcFgzvXOM1FKabFhPQkV7mDdw5aOX8Ym6k=;
 b=3b4PqR5baI+kuHk1auQ3+anyUqkDDm4HOMZNigBeILP4TOjLHhvVvlVwigvGuUMDNVgvu9y8R6bZlaogN3dsZvjubMgJBddncjIUIsRyowF7a/7HL4UUxvxQW3cc7wlXAL/WghNPUtkAx1RRo/Go12d+Qh4PNEwsTzLKbGwAyxo=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4902.namprd04.prod.outlook.com (2603:10b6:a03:4e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 17 Sep
 2020 08:20:52 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::1dc0:7d4b:9820:e68]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::3c04:982f:7d75:779e%7]) with mapi id 15.20.3370.019; Thu, 17 Sep 2020
 08:20:52 +0000
Date: Thu, 17 Sep 2020 16:18:37 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v16 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter DT schema
Message-ID: <bafa02aa50c5c29b3336ca6930c406150a3c60d2.1600324895.git.xji@analogixsemi.com>
References: <cover.1600324894.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1600324894.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HKAPR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:203:c8::14) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (114.247.245.146) by
 HKAPR03CA0009.apcprd03.prod.outlook.com (2603:1096:203:c8::14) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3412.6 via Frontend Transport; Thu, 17 Sep 2020 08:20:51 +0000
X-Originating-IP: [114.247.245.146]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2849b505-3a6a-46bf-5999-08d85ae2972b
X-MS-TrafficTypeDiagnostic: BYAPR04MB4902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4902E44299E868AB3926D7EAC73E0@BYAPR04MB4902.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gbxCXUnkKGNwrGMa3GPQeYkbXxSpbzfCZZSNiiI9W2c2PsFiwhXwvfV+GCJ/GUTTEtT/qMLcFzW7hORmPB9BWSX0+Tt9DXaua/itelRxPC6oovaIyOj2q6UAsx0Fn4m5Xd7n3Sc7YZ0lIRu66FeThsRffWXgBl1NXDr77+vtzdxna4UT8cJOaJ0u8InXoAXMCUJRe/aM4QwlwMgSPgGzJfC8rp/U5HbEGRHxWP8Amtw/T+oadXYuJUILGgnacnUFOK6Z8c5QNXGRxSYq073oKVNrj4v0SwN85KPOHL3x9YC0RjMYpGmOlOcFgD52zb/6VYOC9/GwG02NWywuxEMBhL42A6dPtrCG/RvG167c3P33P2JbL8FxNxlI0NG+Rm8o1K1eJyDgxw+f3Nh4KwS1vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(39840400004)(396003)(136003)(36756003)(8936002)(186003)(316002)(6666004)(8676002)(2906002)(4326008)(86362001)(478600001)(16526019)(5660300002)(26005)(66476007)(6496006)(52116002)(107886003)(6486002)(110136005)(66556008)(956004)(66946007)(2616005)(54906003)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: rSaXH/9OXkFXtpkz8CCtZC2l5k9QH5LtmfBHsMcSjKXSbOx3tgKaOtZWLB2Wu9hTDQ030WPHG9tsXPheP+pMkDG2hBSeQOr083agfg5N5x+R49Y4tMBpLj7C1/JIGMRdPydI2sUMPBIrUb4d2jjZ2MAIpuWHrcKdM/Lr3UsK/N+ge/K/d+dGH5R4LUY9KQyt/roijYZxEvKNcrzg5bY9XG7KSWkCgKbmJkP3qoTLVCmvGwWOUf8oXIcQBwl9HrjVKPokvGB06e1PN71ymQUrixIJUs0vBRb1WkmRMlJHJe7y7krcAh6pGWgjgn0f4xZhviyhfpSPbknD+eT0dKkU3l0vPesuJMcAk5sGm1+ZRtD9sW4dbCJEUWTTbPlMxy/YY5Cj5Zt1M/lDgLAMZ+lAOt6x8tozKx3xxLt8kjYZ+f3rxRYIHeKVpePjW09Y/XnRzD/gqMpBgV95WgOe0X+VkFycEtVrr80MyEboLaRXtBsDdX/mfWPXlsBV4tIh+NwPOZyF1hzu8zyZY8/d0K5lGk44bM4lqi+ZNaeDH89eRtCk0JST1vYp65Wcc1DDYcgO2ZtKec3GPbsmX4Kp9+dkv+2LwqPEkF8wyV/AXJarKS65aTidoLuxV+8qXAjNlRAadAT6G5bjS8T5jq3baXEgDw==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2849b505-3a6a-46bf-5999-08d85ae2972b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 08:20:52.1788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwtfoIuW4YoU4d3y/XiejS4t5WPmoZc4sXVZaIt1RFVvIHIZtQTPx8tfMMW4U0qHU+hbJampMUYyyNEd6l2t4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4902
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:07:28 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

anx7625: MIPI to DP transmitter DT schema

Signed-off-by: Xin Ji <xji@analogixsemi.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/analogix,anx7625.yaml  | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
new file mode 100644
index 0000000..60585a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Analogix Semiconductor, Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Analogix ANX7625 SlimPort (4K Mobile HD Transmitter)
+
+maintainers:
+  - Xin Ji <xji@analogixsemi.com>
+
+description: |
+  The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
+  designed for portable devices.
+
+properties:
+  compatible:
+    items:
+      - const: analogix,anx7625
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: used for interrupt pin B8.
+    maxItems: 1
+
+  enable-gpios:
+    description: used for power on chip control, POWER_EN pin D2.
+    maxItems: 1
+
+  reset-gpios:
+    description: used for reset chip control, RESET_N pin B7.
+    maxItems: 1
+
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description:
+          Video port for MIPI DSI input.
+
+      port@1:
+        type: object
+        description:
+          Video port for panel or connector.
+
+    required:
+        - port@0
+        - port@1
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        encoder@58 {
+            compatible = "analogix,anx7625";
+            reg = <0x58>;
+            enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                mipi2dp_bridge_in: port@0 {
+                    reg = <0>;
+                    anx7625_in: endpoint {
+                        remote-endpoint = <&mipi_dsi>;
+                    };
+                };
+
+                mipi2dp_bridge_out: port@1 {
+                    reg = <1>;
+                    anx7625_out: endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
