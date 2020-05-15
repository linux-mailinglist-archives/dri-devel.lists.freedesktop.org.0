Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B701D4663
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEF16EBF9;
	Fri, 15 May 2020 06:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2103.outbound.protection.outlook.com [40.107.244.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E4A6E115
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 05:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyEuX+LeYlTWa7PKN8brfEjkkMTW6cmpvqFMuPr9AztXDMpW2s5JdDQWwyC8J8bkKZpbbSDKU0nQHhgnjcTbiF6z6NSYYAiBZpxtN/53Kg9sMGB4c2iCdxRRBChNlcEYEPanD1HLk0uMUgG2ZCMz1YrXHN5uFRsBO1oO0nxB63WXajFVCWk6B7KkHVspyQpc6PxrGSZAx42fCRjV2vxwE8+bi7rXE1pEOA9AqWPpvwlX+5ot+d8qBv0K8Ny/lCdXvQAKdQ9dMh+Co/4YJookSBT8NRdqJ0wjC+oonGl4V0FfwhUxEXQVfgCAadfIgep34QCdWtNnrTAvgpfY8m9Emg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cwqbvv8QcEVow6I7FbphHs1hFgKwk2phXjRDkPn6Wjg=;
 b=LF6tHn7S7YGTR3+OMGdRFnPeF/pA/ZlC8UYdmhhOtG7Hmhwr2s8ir1EC08y5qa9L3ON7qNXVQvtIZrNy0qmjq4zcLugkg3atjaYtjY/GbxIXrkpggZjWURlr+JsHiseKEK76cIysjB8OxvDGR1mwdTWbShpuFe2JbYjDtuEX4k2xQcG+RfADaklSpDXXyAMBeDjdaKxHa0u4nrcujW0mp/LDb8ohjwxNf/d8NYiDUTjRl1pWM81At6fI7BRdN4mcsh5pv4aDJc+3wd5V6wSzJ4uh3y2V7dBasdhrkm1bF3Ng62MuEzLX7K4cKOSeVvsGhGA3MTwF0tViB8fhkDQ8rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cwqbvv8QcEVow6I7FbphHs1hFgKwk2phXjRDkPn6Wjg=;
 b=hDRLiKohHDZUKFF7kxLeWKLdfzUQ726GU/yJqHQssaHoea8KI/DQjmP8iunE881z2duA6bvataHrhNEY+C/ymEMAIohiJKnfKFzq/gVjiqkzgnl+wSdSDnjsa+3IzYlmUsVOYqfI8jDQGQQWIlNW7jfvTKFo1M+QRaamXaNrmuE=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6519.namprd04.prod.outlook.com (2603:10b6:a03:1d5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Fri, 15 May
 2020 05:49:27 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 05:49:27 +0000
Date: Fri, 15 May 2020 13:49:20 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v11 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter DT schema
Message-ID: <393386c0a18753cb4b3f695348fe506a192ea82a.1589511894.git.xji@analogixsemi.com>
References: <cover.1589511894.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1589511894.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:202::32) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR0302CA0022.apcprd03.prod.outlook.com (2603:1096:202::32) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3021.11 via Frontend Transport; Fri, 15 May 2020 05:49:27 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32c9e1e4-5ada-4f75-0123-08d7f893bad4
X-MS-TrafficTypeDiagnostic: BY5PR04MB6519:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB651931F010FFF6BF969E4378C7BD0@BY5PR04MB6519.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n6tBr2HwZMYPJuGo9JPtb+cVGS1hAEW+vLxMC2d1aHTsMEfee4JQQgGhqNXpddODq9sVQN+44uNH0j9uda6R1hM0Qynoz/obPQW4FpUyu+S86A7NJX3UWaGFtYmGQ8huM9z/gm4+U1LT40BPJe45bTeyy3l1IUBtFmYmxEKKaCURmKzVWhOBeBPm/1NGK4YQ59fhg5XTZ72sFVdcwX4ZNGQhr0dTG5AjVPMiJ2L38bX27H01vKw3TXObJII6orBUwyKfbegOpttR9H57muvd/Inb9TaTDYeWsIL/AbGyc7ebu3bi+BWGgQXXOz8f12ON6LJFGiihX6pxId6yneUthnTluhZHROR4rgZfZxp87+TmNwDuCx3gJ/+gHJoCZKkpAPPgDqSUr5hfzYoj/ZdasPtXBsRzYhyGkGlhHLjhHZaewuVnUKMJn0KwW2+rgJuAwnnZZWN1uxvRCohxpXeWITZf2rjQ7aGjF8mGTjyz3ilLE7BEl92DnlaWgIJUs1beBj4e2OKXBUFROCvrdT4moA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(366004)(39840400004)(136003)(396003)(346002)(16526019)(6666004)(107886003)(5660300002)(186003)(26005)(86362001)(36756003)(8936002)(8676002)(6486002)(7416002)(2906002)(4326008)(66556008)(66476007)(66946007)(110136005)(54906003)(52116002)(2616005)(956004)(6496006)(316002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 74YHCnfyWTVYjjpBZaOJCx888EUCt6rIAjWMd5fclM3IACwRCvWgRahpxEG7t4nKpAE3iaav9keXCvdX9Gd9SoZ1cr4JkrOZSckYeIZ1RPPfObVYBAG6cilT3JfwWy01dGEpKXwIAMCr8qwDMPZ9Peg+/SImGP6Z/bDfV2ZBDop6N70UpAwlwWmGaDC7PwdwT7fvnXBqlzMbR3cJ3IgMVRkXkugvB5iqlc4EYVVnWwSHAXAMRtpFhK0mIAf/xmmzScpxsimFBZp0kKHlymgqZ7rNOu+ApukogidiCOnMnVueivbe+I/AbIka8p3KOQZ7jXT5oT4Q/pqmVipRk9sKpl2lJg5muSP1LcEaC1gWGiQ/+ZRxxt4uQlmqpH/CJ66g3ln2O6C6rY+0N91AOxotgK2aRVIgPZwI8egfXIdb20pzBJQ0qcjUHEelKqkFUQQhUEDsC2u1rR8qrzV37SUYxI7TjwzHhgch4ymPI61yCha1P+o1N9MLOITyJB6kAIS+
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c9e1e4-5ada-4f75-0123-08d7f893bad4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 05:49:27.7857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKyjhjX34MfdYn3j5fKBqnkPKi5treLZtPsBBaIAY8UgGDMNfKl2RWO2zjKzgbRZ+kcgoEbmgyULq9ZKpvndDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6519
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

anx7625: MIPI to DP transmitter DT schema

Signed-off-by: Xin Ji <xji@analogixsemi.com>
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
