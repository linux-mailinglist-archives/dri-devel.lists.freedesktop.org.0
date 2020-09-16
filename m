Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D382B26C48A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCAA6EA56;
	Wed, 16 Sep 2020 15:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2119.outbound.protection.outlook.com [40.107.93.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A449C6E39C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 09:24:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bF/Fj14Gs6JOcZIoax2dLiuVW0y3CmlcgU5Er5qSH3UpZSn5K4+hHo9pmstOCDFtFirROvONVxMlM+G9mRgDCmygdJGATtoUT1b438Wc3iCD+cB2JFbzk6nbwVccVcR7fV2Jb+u1A/axKJex0E0Sx8akkzFWV3xwfk5Cg+U2ACgCLMj5BNCcBwzw9tOzCV1qovGyQtkCoopk44vpe7GozEPmfz/4VFjhhm3vM6g4U8OzHYh921SJR6wwVBSSYKHwdcRMfBlmY2Mmc8su3sqAdQF9Qh5OtNCodhtzpwRPFfJvoymk6OUEs7+GNDE1/zfAwS+tzTls6EeymLfw057P/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2l02bwqOJcFgzvXOM1FKabFhPQkV7mDdw5aOX8Ym6k=;
 b=miQksYN16CT6qTOPD/vh2Saoj8hmGNtiPeYP+uPCRMz/8pVn5bBTrVjUwLxuWMIh6clC4WqztNSMz2QrPdtxH3mh/eoi7e1bkK77fst/Obs2W4bJlKNJfkMMsuukcSc7nfyUAXG9DJGP4Pr3IfU/w/Wk1g2eWZk/ZUt3tjn7LBkz5d2niO8UrRO35PtbUMoaA8r4RrzkRIInR8F9649gFXRph8MOUxZEuLlATS0vTAwSODmMZvlQmN+6jcwYRfjWao73qFaX4428S1VUVw6XfbaRQ/i8RQW7Jm7HAHn1UuhMxU4sKAtGC+dwtfrtezt4UrgrRX2OxtOyoLm8Urh9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2l02bwqOJcFgzvXOM1FKabFhPQkV7mDdw5aOX8Ym6k=;
 b=MapfaiCN6rfgnxxLyfkR1eQQq9YDcEIjcBgBfglqWB7a+4loJcTvhyoRhbWjbSZz6IyeFolXIoYsKU2nDSplPjN8beLCbtmhxgZI7YVgjkPRAkeo1EYU+itTgk1qFscrZk1eHSPTms3h1Xk9zVeY7SdFr/0MpEPxZIDu44M7Xjc=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4648.namprd04.prod.outlook.com (2603:10b6:a03:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 09:24:56 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::1dc0:7d4b:9820:e68]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::3c04:982f:7d75:779e%7]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 09:24:55 +0000
Date: Wed, 16 Sep 2020 17:24:49 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v15 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter DT schema
Message-ID: <eb234492d16805c9b3a1f5a56b161dc50be3ba17.1600239656.git.xji@analogixsemi.com>
References: <cover.1600239656.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1600239656.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HKAPR03CA0029.apcprd03.prod.outlook.com
 (2603:1096:203:c9::16) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (114.247.245.146) by
 HKAPR03CA0029.apcprd03.prod.outlook.com (2603:1096:203:c9::16) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3370.9 via Frontend Transport; Wed, 16 Sep 2020 09:24:55 +0000
X-Originating-IP: [114.247.245.146]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 602e8fe2-0e19-4294-54a5-08d85a225fcb
X-MS-TrafficTypeDiagnostic: BYAPR04MB4648:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB464864F59F3FB9ED3F3D3EFCC7210@BYAPR04MB4648.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/v0CA5PvQE5/VOpilnb/SmPwCnUyT8h7NnaaNxvt84iBqizU1ixIOQZslGOY3PynZPZArqXULf0z+aYyJ07nyIrgqe5ewYvWLtJ5RvJuqXWesd4NBlw9B3cO70QOV3pPdX2E4lO6gvk2ZVSRQcNxqtzwkyPUplEy6pmnC8qb4ECPgLoGQN8cwrqhlfvMGPFtCoAcMNkHmoyaGQi0ivn3zPFtSzTzJwrSOnCNYAuOY5n5t8NcRpqZwyFHSObXbK1ecUNuM5RrwokRiMNR6RHyuWXwDeEQaKLC5dTx0spB0JKgLBGrNyJB0nVi7ttqWnzfXxCZKP2YURstMBPlYH+/MwpRWQS392PYjDGn49Yq205QnsdwAz/1mAJSb/VGQ/zTSNs7qOBzB+M8GUZ77kNMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(366004)(396003)(39850400004)(26005)(66946007)(110136005)(2616005)(956004)(478600001)(4326008)(107886003)(6486002)(66556008)(66476007)(8676002)(6496006)(7416002)(86362001)(16526019)(52116002)(186003)(6666004)(54906003)(316002)(8936002)(5660300002)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: l7cJI5IrmyLlFUT/IwJAzJvyIqETktlXcIcYqeGziL3XntE8cTSkUwnqAgR7Rx5OmwbtbxIywElU5e+NTAh7BirT3Nqk+SNnX+ID/CVa+EgtW5oBmf3EVj+NdhGsOtlmdwc5A4Qgw+fnaql1giY3sH27qS/anGH0sYBhBQQMIryUE2Q+KDBBpJQSqTVZMsWErO9ZVcrL3XGvOm2tOktvHjNBDox6PKGNKwlO7+0jmfOid1unE/s1+9zDS/Ieby/lmmhQy1Pch6f87ySzDKt7SZP9DKOvmqWWf5ZltUXAiNORy1UI5mJf07bViapoBsupq77THDkDXotFGtC6pgMHaLvYUiweWCjiAW4xwwhwbQqzh4UEognjs+x0IHKBWlowmkl47Li3ss+xHlW1OrdXiStej+06Tf376eQLbdnwHVNnpH+/DTHR1lfgRYJudR++iTb5AhX6dQqIVbcxO0n2Z5YS7dU36bfRm1rTj45tEiyjAPglOmWkgPeu+NHUJRfRhxQdxHMylQUeppTxLnURkdgZfVnokZO6xww2f/n1fJp9Iqxx+yOJGmE5Y/o1cU4diRwvdTPukaua2UWwtSyLSmysqsx488bquBHpXoL02IfIcGFdW7vEUqB9ayWqlCZ8PquPpuojzLHOvhndd2ZMpA==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602e8fe2-0e19-4294-54a5-08d85a225fcb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 09:24:55.8799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CH9dvPvn9+//Es4d/7k4tT8Qz9/HFDTV1nsZurAlpbkjz9oFwbxXk+Gade3imas6e6CrMpMZ3kdKXf3UFCpNHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4648
X-Mailman-Approved-At: Wed, 16 Sep 2020 15:49:22 +0000
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
