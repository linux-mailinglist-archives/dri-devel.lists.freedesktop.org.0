Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C890A87661
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4FB10E240;
	Mon, 14 Apr 2025 03:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="K0w8NtH/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013020.outbound.protection.outlook.com
 [40.107.162.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4B610E240
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:50:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvJGI295+xmHe19QXbcWC7cFABDQ7JQRF3esixtg6cVAxcK0j7o9BdPMuAMt8C4A7YYwJQmMAb17TIqLQTNzXPj1hTBA+0bDUWkt2RWluR7lhHRY7DeYSZA2kHt4ox8MvPDCwEWdxGhWd7ubEPKnYbLK+rptO8oii56tAXYaZN992oSbC2qPCy7bUZOwSGeNjq4EtvefdDUlMDjrlBc94m0P9kCkzCqbaYZ0gCHUGE4dI3tVJ0sXXxjYp3ZDxLgLZGDLr/Ua3Q3IyNkFUDYIwvsGbi3FW1SkdoRXcmkVO4zbfRH1wZRlq2C+BrBF0ovBlY3l1py/C2wTpUurxIAdwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTjQY9XiFy4vm21FP/BDTpP8RY0TJLXfRn0Ms9w/2U0=;
 b=qDccHkKaNy3tYiszYt08FynLTooOaaMQNQEgQQnEESYeF8IamfA7eKadMQKy5pVmD9iiggL2FWK2+pDs7M7iGJOSkqBexKTab93TxjiTYQ2uSD5NOHnXxUU4fZsuELP8Jir4if6rANiUCVQEJuJeoVLqVdzlnz4KC/XxP45QOWfwpKnlEHJfJJ5dWGZnh8JkEa3P2wHU5eEAftzmrYnpcj81gJkdeBamhhfyXIEc0dt/v896WQZsWVFduLKyPd+s5jvdm+7hX2mMlBXnSPsGak2kG9wTl2l98i4fk5TtPLw9AsJgSRktMayBF29U9RAiktmcvyxp2N1EpEwf2FmC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTjQY9XiFy4vm21FP/BDTpP8RY0TJLXfRn0Ms9w/2U0=;
 b=K0w8NtH/N4PKzPUei93hRKukt1V9vcXeEuKGiSE01YxQIyk9LE7PPodoAJNfBiqQL2jehfM/UmJe8ZuR+m2z9L93DcfDFXt+afmD+oGjVLsSskChgKNOWsLB9MdVqKOk2X79h6PHN4Dm8/BJ6wVSiIWmFjoFHyHoXSWtKh2OisopAstnviUu6wYMwNFLvqwkdR1sPMIBZFAGac0+XhEnpK4y8fFjMyOjzXUaeF3eZ32BBQP52zznevpvyEdrkCIXn5iA62k0bSkesn1A7YL7m5e/y2jjMAisrqOUm7LtpauN8n/Ekbf8/1X3gajv75F7WPUKI2rHuhTMt51E61oYew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:50:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:50:05 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, Frank.Li@nxp.com, lumag@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, dmitry.baryshkov@linaro.org
Subject: [PATCH v9 05/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller AXI performance counter
Date: Mon, 14 Apr 2025 11:50:14 +0800
Message-Id: <20250414035028.1561475-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1cc88a-75b5-426b-de88-08dd7b077190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vDb7dqZj8FSbnOT0AfP/yKs7GgQsfHZEbq99D4FJKT4HinLDmusOOkcyK4/e?=
 =?us-ascii?Q?Tc4yVqDNEs/00D8d8VV/nPyJMPE9dFzPSRZpzKwzKIg+zK9NsUVCQRcXsROQ?=
 =?us-ascii?Q?pwyILyLwUgsvTEKbURSKXcsjRVl06DqPNSTX9nb1lwJbl9b+2WYKt+2UqFeM?=
 =?us-ascii?Q?+BuTkJjRVDiLvX1yciH2WbTYL00ur89H0puYZiGUeK+/HC2m6nYTdrceItxV?=
 =?us-ascii?Q?49NBvb1wtrA69PzkdGuCTfPU2AyDyfcx2NIURe+5Z0cjAJ2eNd1Sm9Q7Yx0N?=
 =?us-ascii?Q?WGj9VDqIxnzE9DdLG4/MpNjR1Wbp9Ryrn0GSY3jgNOAqSi9WTZGE/+c6foi0?=
 =?us-ascii?Q?oZcz2S1NaHDqXgiR289F5R9YYEQKvC1vPSwzC7p3haO34d6OxGTk6xvPErKs?=
 =?us-ascii?Q?qKUwGZmDDUWkrUyNeCXZkMDJD7t2fbBYqJda/yJjBwICGF5iB6srTEyA3+Wn?=
 =?us-ascii?Q?uNpXJsRYiHPVhEXdAw26T+dja9ruJDoMQSBBtPkn7+oettyinlW00EWkE6RC?=
 =?us-ascii?Q?Y8veFLxgXNHBxx+g7sVhFuVhnuiZ3kJOhDKCmIZIQHitFmuBez5rHkLFn+m5?=
 =?us-ascii?Q?HK1hQpJ12dUOSYuaeALeUUX2SHVpMCuLUxbJdBuE5M+3e+wQR1kbfcA76eFi?=
 =?us-ascii?Q?KhiqIVsJedZqUSwNQLeb8wifJu/iTLMLbmqaMFgGa03XbqsAALouz6SZOjG1?=
 =?us-ascii?Q?hVHdPiUhrBTvHNcLA1TLW31AkDt4yl6uQQqQDG/lKRnRPPLaQ6sU9MxiQmAA?=
 =?us-ascii?Q?jNjTjt8MI492eczIUCxOrFg6SQ5FDlqXrtYJAW/7nRraNbJ7DomMHirfuen5?=
 =?us-ascii?Q?r0vhfbBK+F0WaTxJq+RBhykzVaP6R3CSy0qu1wFdEOiVgVtxjXt4+levNTYf?=
 =?us-ascii?Q?CjkiUN8eGOvpJXUSo1JtCMiMYFJNie8eDfpBsmrHLtNp0BdCyXhFGIBQl21+?=
 =?us-ascii?Q?44J8su6mrQ3DAaOOYX5NoaHdapEewbCwAmS10RsJWilUsi2cA8ND+CgaSAaV?=
 =?us-ascii?Q?xHcuK03JhxI+4gcTvPqsgUlSFmf5wt0K78tW/xqBd/612xeu8y1TYxp4VvYj?=
 =?us-ascii?Q?35I1Z81Mnb4qILEjUJ89DRNVk8N/lyZoVoW77a7O6L9iIh+ff3a64Pf80//s?=
 =?us-ascii?Q?unrtOXoOOwnPky+1GQnw3dzJ7DXUE8LjloqkGK4lwP0ngU1tnCc5vBxXydtj?=
 =?us-ascii?Q?QABC5u3Jv61diVOhTVcv3bLC2PPM28Ajq8vpvnyOwQrq9ZTcuWPY7NMYwuuH?=
 =?us-ascii?Q?Ql5D1ZZsOWCwLOIgVtQ9xwMYQbJak/3LzsX5PZppV0FKfJTbWj9npvigEEa4?=
 =?us-ascii?Q?12R1LH2izQwUllRWfrUTrMPZ0OzwAawbKACTe0/TGviIcsg9In2fuljjvFSq?=
 =?us-ascii?Q?/hiGBb6BuW7zW08mtqvlmEwyJguridUBKLKBKTIXcQ05jueDlCT96M75jLEf?=
 =?us-ascii?Q?/V3uduCATrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jEjqdty8BaMzYpeAn4p2m6HGz23oeru3iYahTUMGGVdJN2D16/oIy+Zjyc8t?=
 =?us-ascii?Q?mOfVNavq0EYYwW816QTJiRvc2lxUUAO0TwxYkCMF1FZicypTUuHnPqHIY/t3?=
 =?us-ascii?Q?AInsF+eA3I//qF61iIGMKTzvCorQ/F1qWZMBc3z3yHSyEL3qKFiAhD5agHm9?=
 =?us-ascii?Q?aG2v31qBgvqb8MEPc1W3jivQOg+uqLFu1RKURcLv1WC3e0ZHdmI1HvYSMy5G?=
 =?us-ascii?Q?UIzLaINEuXQCTIUKVCutR41hu8dpHDRuc/RZCVGw56val1bvkQOIfAUYcXU0?=
 =?us-ascii?Q?fKTEQUvGWJI7huVgr9iTWTWvveHB2oc5nX739KZyw3Bqh6aBrahHjrAtZTlL?=
 =?us-ascii?Q?fRZpFF4Epib+9DBIBNHBxYFWKl22OQIIHEYs4ZcRA39KN75/c1y66ux/aOHu?=
 =?us-ascii?Q?G+ADOD7FlYyp7ibxumSsbUU3opY+POigQyh2kVSxIW9tP1H5ypdOkBUm8nDH?=
 =?us-ascii?Q?YVN1TT/Nti3oWxIYUCSVTCYjfrxJEqC/+Kh18honpGWR94tgsszJJU4T6YRQ?=
 =?us-ascii?Q?v05G694xs0D0hR0q6ORI9LDKoI6HTMya/jP5W+57fSYWVqb3HdqswheTZ3R/?=
 =?us-ascii?Q?dkiMMm9GpaUI+6Wy2jr3JcFrA2KUF6giih6tffv2g+cI8NIRQLLI68j2U/D4?=
 =?us-ascii?Q?Zj1ndAfoXaYHjFWRkiiCyBWUeguJ+dXYO9OAy3HrYdw+8NRxQZPOtjBst/db?=
 =?us-ascii?Q?tc0zXi7X0cXWZ9YRjzHsXlLnckDRwylOKhLWG2BeRsYfZdzwahx+hO0iBOdD?=
 =?us-ascii?Q?p0WbiDWWSDWBH8lu2xTriNS1egFPXZJ5wannJN3QME18lui2BsX1Eio90il0?=
 =?us-ascii?Q?I3R/n75y04H4PLa1EppZ0wMVBJ3M6W0GeCGWRBQKLYIuHfIpOyokzv7R0LIG?=
 =?us-ascii?Q?0hyPwgedP7MVzro0Zh6Uqfx4L1lIX/sHbXAe2stvzf0Xi3OfDshr6ET9MVgC?=
 =?us-ascii?Q?z0SvQbulqdwpxfwlpF7WmKeQrJ2RWtCd/0fScq5o7shMgRyfEMJGD/vIBES2?=
 =?us-ascii?Q?O6LdjaW47WPuNBg8BtddD3I6cHThYbqQ34qHaO8I6P+eN07t2Q98SK4lj8+V?=
 =?us-ascii?Q?k0K55hbj+rWnqd+c+YXkcvQDGgs6ttXc1vhrvddlN3HX7jtBpP6N7RVV1IUA?=
 =?us-ascii?Q?ot4R1cCbwQBNSMYwNnMtbD3QJFTwruDxEyLSMO8n4v2ooLzR4mRRH0TIxzrn?=
 =?us-ascii?Q?9P8haxJioAU/20HLSYBTRGRlPg9IkcXy/EOkskHHbdv/8hPx9Pff9zkBIH+o?=
 =?us-ascii?Q?uYM9THqGKpM8MgvNaeBkfonDuCulLvtMt8gySE/AucZYXlGSgKfBlp1h0x9B?=
 =?us-ascii?Q?inGGxxRkN9+psBW6e5VBnQIA5GDIHumc6gW5nHCSBx51EZCBV+tI1r/9UfFj?=
 =?us-ascii?Q?ahVGpSqQb/dKzbyBjKkT1gP+CSlKbdKnjyPKtGS8dWJjchRzipcda95Kr3NL?=
 =?us-ascii?Q?UNWhc3K1Dygqajubnsiv6hUlTjx8q0P+oguQBvdJwBeXmU99IaSZCjWk47AD?=
 =?us-ascii?Q?AppG+mQB8nlrHhHMA0XtKFMd9JOznA79Zm+1xl8zNZyZro9Dfq1O15yOvtSt?=
 =?us-ascii?Q?Kxczp2UYDEAVuZDx/PsF+FoEhP24NQ872emO86qV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1cc88a-75b5-426b-de88-08dd7b077190
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:50:05.8636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cF81T7U0oWTA0u8Fsd+f14uSOfC6Ge2fgDh+b37ZgURCOI2EPrXfZ8WE957JKaujFWHIwpbuDy9AAa8QXyja+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803
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

i.MX8qxp Display Controller contains a AXI performance counter which allows
measurement of average bandwidth and latency during operation.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v9:
* No change.

v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* Collect Rob's R-b tag.

v3:
* New patch. (Rob)

 ...sl,imx8qxp-dc-axi-performance-counter.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
new file mode 100644
index 000000000000..1d6501afc7f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller AXI Performance Counter
+
+description: |
+  Performance counters are provided to allow measurement of average bandwidth
+  and latency during operation. The following features are supported:
+
+  * Manual and timer controlled measurement mode.
+
+  * Measurement counters:
+    - GLOBAL_COUNTER for overall measurement time
+    - BUSY_COUNTER for number of data bus busy cycles
+    - DATA_COUNTER for number of data transfer cycles
+    - TRANSFER_COUNTER for number of transfers
+    - ADDRBUSY_COUNTER for number of address bus busy cycles
+    - LATENCY_COUNTER for average latency
+
+  * Counter overflow detection.
+
+  * Outstanding Transfer Counters (OTC) which are used for latency measurement
+    have to run immediately after reset, but can be disabled by software when
+    there is no need for latency measurement.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-axi-performance-counter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    pmu@5618f000 {
+        compatible = "fsl,imx8qxp-dc-axi-performance-counter";
+        reg = <0x5618f000 0x90>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+    };
-- 
2.34.1

