Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297D1B97889
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 22:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7971710E1BF;
	Tue, 23 Sep 2025 20:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Xh98IO6G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2B010E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 20:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYvlcgqMgEj4GuuNJZImHaPjJ4SbSVAQKA89d0CjaaHwPhqhRzP7YLnpCzaFTrjJuvkMNaXCS1huJu5daVtHNnAFvqLiWka3tWR1LCmMn4+JvYfjhYVr0Y+8Usz/MBOj5edb8JbF3RFOnPHNe1o66laMNEngt8A/XnxANSXF0xGF1fyJiu+4VBOvbi2wLJJkFGzx9oMvtbCKfBDfkN11hweAGAcd/pzuT5Is85rY8flxMZikh55lT3G3gB0BEdTAPVOCHPd3O/zNwC606h2y9XfHJXDd/VKcyVPzmrJWb2nb1l26j3kKVYngKEIjxjf6vIXSswQSf4ZGtqnsEXobow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymfGQpQJzkQ0wMe6hi2xKFeQEhyW9YtHndZe5tjn5D0=;
 b=b2qi4rjB//MFuXfQoaR+ZNq3Agm+aJqC4rvMiQCxRCs65b8t+Xj1KzU1XmhX5uMZiCuIEr+KLgx26Pth4ddbK5aDlZaLJ8GqylnLXM0wppL+WKUngvZ2m3IbXZKScIpcmt2tBaidiRYgqg38L6Fy+nmgDYfYW7BtI/j+DATeCVqhhpSvq6dTvohELSf+2zcMAsgLNBqhuOPa6tVowbpH1PtunBtY9ChJ54Wqu29s4g715d8lcfrEaAb3As4DCaSs2PxzvQmpcARZmj9uT0A6vyxAKlW1mxehPi7h6qbb3ub0+Lv/2COouO8YX2rEgH54tZWGtTHOozbyU/nCMymTIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymfGQpQJzkQ0wMe6hi2xKFeQEhyW9YtHndZe5tjn5D0=;
 b=Xh98IO6GeBm3DN7DdcUbfK4aw7vCHsvFgqf13yTu7TEMdtH0PuxfUQqi5musOVW1VYxGt8V/pnuWb8c/ZJp4IldYya8mqDhOD0+MMOqcAAjmhWGxzwTxdpfcOsrWD1mxrD8OzWkp4oEnrv144NHYILsg5++A49u82k2cbCGN0sWJd8MpPER0oVHaV3ykATgiIs/cn9JxwjU5K0ka6cRUPapEsCqhBr5DNXngHaGmiNobtmdVTPSPdA70Q/Xag4VYYVCk3vCiOdrWfqduq+VDQfKToDMYVfLQaOJGFRNinU+HszWt37Cy/+609kNNTWDYP5Mu6BoNS7ThHZjGfw2Eog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DB9PR04MB9428.eurprd04.prod.outlook.com (2603:10a6:10:368::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 20:56:05 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 20:56:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: display: bridge: convert
 megachips-stdpxxxx-ge-b850v3-fw.txt to yaml
Date: Tue, 23 Sep 2025 16:55:48 -0400
Message-Id: <20250923205549.200670-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0167.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DB9PR04MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e665f4-ef51-4326-25ca-08ddfae39c81
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OOX3pC9u/sXQc1gNEhHzaapQS8IRKpnCLRpwyyMrJ4RR5UVeqHC4eQfz+QWB?=
 =?us-ascii?Q?83OYZKiIzfmuxQ+IrVeNxdM92JdbiFisgofNCmpHfcY/zfLKZk6nPdLa1mln?=
 =?us-ascii?Q?ehKYMQheJcpp1Y4LLaDonmht3o0ZirA5itaexOAq/1XQrSWHfW99CDa3IDKR?=
 =?us-ascii?Q?wHZqqhMQ1AJBI1jE2F0eL1f3FzXySs1bSVLKGBsjIYrqnfEexd9o5AVANsgN?=
 =?us-ascii?Q?DTPxC4R8PpkhGDYKrrLZ3SqFDXtFDh3/8omfJ39jlM2ZthskZhzoUMETplz8?=
 =?us-ascii?Q?vAcDFlT9gl+aP7jk0EpSjKw7dtxyqmJi4g7rq4y/Zf5glE4hPkL7YSzX/VCd?=
 =?us-ascii?Q?fDxVKK5VfUqGfHcIAJ48ijuPKbO9W07Wm78LR8Ar1wXRLfvE0M+taiyJTFIk?=
 =?us-ascii?Q?l90o700LxlbmrtaQXcjIoJ64B3kqFxNLwMP7Lq/8H0veQPQr7yrTTTqbdjkc?=
 =?us-ascii?Q?zg79z2CWbOcV42wyNeyI+PnK73n/XLoBJOYczK5piUVktraLv7jOy1C1fCe4?=
 =?us-ascii?Q?ToIqKW0Z3+GShv02ZGyBUMisxLckEOMJe+8ebvnXqTyuvRQqPMYZuiUrM2NU?=
 =?us-ascii?Q?WOwkh+KeTelL3xNd3Ay1W+xI1ObtjGIE3VrtKDCgN4AC4JtEbH/GAT3vGgY+?=
 =?us-ascii?Q?PthDq1sttuM9beHtoqW3xUPgr+DJVSAP4VVaycRUQxL7emvdLhCnCPyAIzVe?=
 =?us-ascii?Q?vvpaZroCh2Vi9kYW6XnCh5y6hvDz9yBC/jvcVqWGe/Be8XZT3dxiqHBpjaEr?=
 =?us-ascii?Q?2iCZ/o2D8ODfYx5C/9SiNnBI0Aa4u2g0SO7WPvoekS/bZz9+dhH4txXL/TeO?=
 =?us-ascii?Q?9kFwsEYCzagPjubrTfOPjT+NJwaruGN8X3pmxuSExB2zjA0A2PFYCoMcjqnl?=
 =?us-ascii?Q?/rxLsst+hjkGl3dX60LEUG2kCvKJMC7jTM4bhKhzYAZU/eLgXMJt4U/QPwY7?=
 =?us-ascii?Q?gpQaFf3tewefC0yhKCURUGDNEpFrTYn1r/97KkU38IeKzc3ykPrvXdwcmZC5?=
 =?us-ascii?Q?6MvMo5XdRp1xdxUVDKfjzIbzwrTxSUnqM6LnNafoMNlBwK07M+rVj3yiwPl6?=
 =?us-ascii?Q?zHfmZeS6ars7kVeRbXy0O5ECwi1VdRTdOMTasu1kT/odN2KfK3jZMft28Du6?=
 =?us-ascii?Q?6njrRVAibAVOWakamWsyHooSOe/piM6X4/lz8h/TxDkrNBkY7nmnj5h7ZqVn?=
 =?us-ascii?Q?KdQGtVpXwUX9wSGdlIIgKMBhQhvkbhirrqQtsI2QL8w/vD5c8eq3Vhfly17i?=
 =?us-ascii?Q?lWpqC5ySbsx0mqzKn4HNCNA+vCH1c8VbNx6SDBpdth40hcUBkiN+Ob2hzkCM?=
 =?us-ascii?Q?6G2pJ/yPiK7J7rjW7z6IqmwOYCD2DGd5Efl2QDQa+7EhNCx1MD9xUsamUCdN?=
 =?us-ascii?Q?SzqLdFpaJVaU+MdIQPjcjFQAno/jEg61SfVu5DByVBjcs9P0w0bu9hBnXacu?=
 =?us-ascii?Q?+2rQZzbbvzMtGTM9xV2VDwVF5hRDOMbu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7fYcCLwUSgUs0J2OllQNFTOBn9EvOak679hhEEYD/y3UrOeidRw8bqMopc/?=
 =?us-ascii?Q?xraw6KXDd82Uaq8AyFcbteepaKEuiWSBIGCXcaaRqDOidOuB8Q/QzdAoJZcC?=
 =?us-ascii?Q?SSk6wtohWhLi53TsqZ7wqgLdsUJoI77I0FgSJPKXK1MVMhqwUlVDxfu7x9WF?=
 =?us-ascii?Q?GRq53kvuqHwmPTnR6mC43qcVu2QwzJSEuqzlxwizHzLmC/cS6UbXxv3fkI4z?=
 =?us-ascii?Q?lQDvfB+cC5/R+LS6FzP7qQHbdcuBu4zfaQv/k9FkEDpq0bOGkK68N6spxm87?=
 =?us-ascii?Q?skayg3gq3QRd2w6MY+IbjW/cGM+OxUcyFMdu8xd0r49kDM9NPKLocOopOcW2?=
 =?us-ascii?Q?MrZyuH6awxKo01BLzbcV7vRbR9U383wFEBIKFYopGG5vOtT3qTXLJYZLgVvC?=
 =?us-ascii?Q?m/HJMdrdWqWzqgTXRGZX4P7WpohHV5F0mlImpgkaRKa0B0eEBHi/7wlpD1eD?=
 =?us-ascii?Q?UDgcIRvWGadmQolSDplQKmBZ+t752JGEYs14JuPOdYED/iZwy6cdz/QFStHN?=
 =?us-ascii?Q?5uj7RYSOLEZpcj+OXa/bE5+spc8LD/3zHsctlsVyGpPssaVXf4zrZ8MzmCdf?=
 =?us-ascii?Q?rRU/+fSWo/cIQapeb+36KDIXKXqulsgG6w5mBGkaXH5z4GPY6Gyq7gF0p07U?=
 =?us-ascii?Q?hsujw5Ly/38GJ43odKYdVLTOc7P4s2Bfv1MdjKZpcH+N5yF8DP6ejcU5EyUS?=
 =?us-ascii?Q?9lDLutJiTBmDLNuRlfZLmv6oTWTo82/tWIFPhR/K99kiJDZ5K5MKR96W/56f?=
 =?us-ascii?Q?zogkDIGOqprB09zaPTR3sqVDlryqb4EKGqoeHbM5WGDnjBiaAmdUih7lbA7O?=
 =?us-ascii?Q?5AnrM1uaos7EUh7lZrkDAwJmdRgfG64+R5I0aRcIaC28JE1pQpG2s3ahTJ/8?=
 =?us-ascii?Q?Vzs02Anx8vL5vfr73oivl4jJqhZfDOKjyoFlDanM18f5BgHyTQbdAzkWJrGd?=
 =?us-ascii?Q?JpTET3Iq4UTsQ7GUxCEddBEA7h6nDUJnKs2iQg8GslKnNxEBqPZhw6rFsSc3?=
 =?us-ascii?Q?4YDuY4k1F296g4DRie15uCT/BMf4ktt86dblwbWBCcAtwqeidZguqK2QK8+d?=
 =?us-ascii?Q?3dCkg87Spg/VtUbUy+7TLdSQ9IBoExoMA1Vn7vhpwVfchcLLwxdixe/3k/Wr?=
 =?us-ascii?Q?vtrgvNcwCyHc0Zul9/6M0skcjWaH5hSEfq0QbKTLSLtE0yiU1K0V2jINhFu/?=
 =?us-ascii?Q?GNeQQG9fwCeOFztW+I7lfyXSWUqyZynS7ESskv6DNIimfQ3Yhpe5t1LBVstv?=
 =?us-ascii?Q?y2FAaOjgC78OYjJkM+bc3tOep5aN0J2jG+SRXOhwMlQIZY4EGQb9WK2UNblX?=
 =?us-ascii?Q?8gT8+HqNQKmvKupWYzJOVKAdNlrgIWNcAr5bkbISVbaH7c6cdARsdPY8H8T6?=
 =?us-ascii?Q?kCyzxtyOs9i1qHd/pTLdlc1qz65TH3embK/2mcGBZVSTgyY7N7vBpHFyVkAZ?=
 =?us-ascii?Q?ah0tjUYwusEazoR7ieQKHOX8phQ49NL39IxFuPKTCl+wr7npufJlEpXh/cht?=
 =?us-ascii?Q?VC8ePa8v/l+X9eb+bRBkVZPcG7STDxGLV8fLR55OGEoW3JwdfezkCDVX+WiP?=
 =?us-ascii?Q?YykGoooQoav1AMtiXn2Hf/TVdow+5QXwzk2OlOVc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e665f4-ef51-4326-25ca-08ddfae39c81
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 20:56:05.3057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxjAbuwMs1tHV1W2+eKJMh4qeZxGtGsaFCQ1nykwXchAYh+CjZzFtY1w17UZ4qpSuSZRGTmen4nqkTYwB5OdDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9428
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

Convert megachips-stdpxxxx-ge-b850v3-fw.txt to yaml format.

Additional changes:
- Only keep one example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add description for port@0 and port@1
- add both ports to required list
---
 .../megachips,stdp2690-ge-b850v3-fw.yaml      | 111 ++++++++++++++++++
 .../megachips-stdpxxxx-ge-b850v3-fw.txt       |  91 --------------
 2 files changed, 111 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml b/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
new file mode 100644
index 0000000000000..dfa6ff6f115e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GE B850v3 video bridge
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+   STDP4028-ge-b850v3-fw bridges (LVDS-DP)
+   STDP2690-ge-b850v3-fw bridges (DP-DP++)
+
+   The video processing pipeline on the second output on the GE B850v3:
+
+   Host -> LVDS|--(STDP4028)--|DP -> DP|--(STDP2690)--|DP++ -> Video output
+
+   Each bridge has a dedicated flash containing firmware for supporting the custom
+   design. The result is that, in this design, neither the STDP4028 nor the
+   STDP2690 behave as the stock bridges would. The compatible strings include the
+   suffix "-ge-b850v3-fw" to make it clear that the driver is for the bridges with
+   the firmware specific for the GE B850v3.
+
+   The hardware do not provide control over the video processing pipeline, as the
+   two bridges behaves as a single one. The only interfaces exposed by the
+   hardware are EDID, HPD, and interrupts.
+
+properties:
+  compatible:
+    enum:
+      - megachips,stdp4028-ge-b850v3-fw
+      - megachips,stdp2690-ge-b850v3-fw
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        description: sink port
+        $ref: /schemas/graph.yaml#/properties/port
+
+      port@1:
+        description: source port
+        $ref: /schemas/graph.yaml#/properties/port
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: megachips,stdp4028-ge-b850v3-fw
+    then:
+      required:
+        - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@73 {
+            compatible = "megachips,stdp4028-ge-b850v3-fw";
+            reg = <0x73>;
+            interrupt-parent = <&gpio2>;
+            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&lvds0_out>;
+                    };
+
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    endpoint {
+                        remote-endpoint = <&stdp2690_in>;
+                    };
+               };
+            };
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt b/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
deleted file mode 100644
index 09e0a21f705ef..0000000000000
--- a/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
+++ /dev/null
@@ -1,91 +0,0 @@
-Drivers for the second video output of the GE B850v3:
-   STDP4028-ge-b850v3-fw bridges (LVDS-DP)
-   STDP2690-ge-b850v3-fw bridges (DP-DP++)
-
-The video processing pipeline on the second output on the GE B850v3:
-
-   Host -> LVDS|--(STDP4028)--|DP -> DP|--(STDP2690)--|DP++ -> Video output
-
-Each bridge has a dedicated flash containing firmware for supporting the custom
-design. The result is that, in this design, neither the STDP4028 nor the
-STDP2690 behave as the stock bridges would. The compatible strings include the
-suffix "-ge-b850v3-fw" to make it clear that the driver is for the bridges with
-the firmware specific for the GE B850v3.
-
-The hardware do not provide control over the video processing pipeline, as the
-two bridges behaves as a single one. The only interfaces exposed by the
-hardware are EDID, HPD, and interrupts.
-
-stdp4028-ge-b850v3-fw required properties:
-  - compatible : "megachips,stdp4028-ge-b850v3-fw"
-  - reg : I2C bus address
-  - interrupts : one interrupt should be described here, as in
-    <0 IRQ_TYPE_LEVEL_HIGH>
-  - ports : One input port(reg = <0>) and one output port(reg = <1>)
-
-stdp2690-ge-b850v3-fw required properties:
-    compatible : "megachips,stdp2690-ge-b850v3-fw"
-  - reg : I2C bus address
-  - ports : One input port(reg = <0>) and one output port(reg = <1>)
-
-Example:
-
-&mux2_i2c2 {
-	clock-frequency = <100000>;
-
-	stdp4028@73 {
-		compatible = "megachips,stdp4028-ge-b850v3-fw";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg = <0x73>;
-
-		interrupt-parent = <&gpio2>;
-		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				stdp4028_in: endpoint {
-					remote-endpoint = <&lvds0_out>;
-				};
-			};
-			port@1 {
-				reg = <1>;
-				stdp4028_out: endpoint {
-					remote-endpoint = <&stdp2690_in>;
-				};
-			};
-		};
-	};
-
-	stdp2690@72 {
-		compatible = "megachips,stdp2690-ge-b850v3-fw";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg = <0x72>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				stdp2690_in: endpoint {
-					remote-endpoint = <&stdp4028_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				stdp2690_out: endpoint {
-					/* Connector for external display */
-				};
-			};
-		};
-	};
-};
-- 
2.34.1

