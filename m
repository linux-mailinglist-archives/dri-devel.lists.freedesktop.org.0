Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2E29FE1C9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B6910E340;
	Mon, 30 Dec 2024 02:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="oNHBkCd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2069.outbound.protection.outlook.com [40.107.249.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D81610E340
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:12:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOrzCHmqrhZUlkoIADE8JYCScgrUQC/exI28jT68NQIQtm/XZOOU1D7LR2Naes9K7AS6jO318aOU0O0OO6o+ymnOEq7LQ3KHO/yF7NeNWM082Qc/uRYRSjj2mAV3das6CifXGCLseERC14H8FIP4lCadZHTUrRC+5mGBY7IBxAS5P1GzRGHeYyjUU0Gx7G8j5iDFkOpUmk2c3FjGWftOOoJhjLOyXSsOPIBfWgjKKBzgxYnSxnfWRMudRIyw325K4NR+Riqlq0ZjDPD0GlePXx1UdSZA/hI/HavtEfzHSY2LmRs1TLTwovCBr2VuLVHmVL9eyS6hnxTV7tlam0W12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhVH+uavPK00UU8Lblr0wp9jmGulosufDNQkJszlsCs=;
 b=VvOhLIytTavL6+8Ey4XLrg+1cGQQsMc32ZN7BA9cuGlkj/gzFoU3j7Tj0G9q1D1JMEhC4F7pgju6AgVtpK7xBIEhfXWcJ4RKBukVt9dXXVH/WvcYYxQ4+38n3xMpS+CacXc2Z8Qdi5q7OsJEy+CbWlAKmR0jJpomQsBgDWky7zwqTQe1KpN8TNpgUmnTNXxtfoDjEbDl7z2YxMyRXLWks0lgDV/8/0kCHheED/6OMusUcnaA+iMQm84sArwnM2fKdCMqYlyGte9niQryJPQulJce9utBx2f/c1frpOkpmurJQ70RIsBmR26wDzdiUGXehYV9T5XjUxVelMl7IsGyqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhVH+uavPK00UU8Lblr0wp9jmGulosufDNQkJszlsCs=;
 b=oNHBkCd0VACN5B8d08CB64hThRPd3YF5iMEWpqIEnKDyDcNWRuZaKDY5TJsaRiCQwot1oOUEUM9oenJ+NqHFVgZHkWoesqEH4Yd+iFVernfPpQsGQl9DU3UsgsMnp2mKmKGl23r4SwOyvCwTWPvRyF4uFAhUjruAKytg5AS2FzylyjChCaCHdZ+L4VQGspJOs3ncyX/hVSrij0cUj5USYLrYnCy4/Z4D/k0L5hkkNycyuK8EH1BcGcz99Bgi6t55CYSBT6+z3pNkPJ/fWiItDMfibFEa54mwt+FI30crfcK3sAaAyML4CH+7580vj0+vjbOEEr4SomV8AO73nTL3BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:12:35 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:12:35 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [PATCH v8 04/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller pixel engine
Date: Mon, 30 Dec 2024 10:11:52 +0800
Message-Id: <20241230021207.220144-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230021207.220144-1-victor.liu@nxp.com>
References: <20241230021207.220144-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 4175609a-acfa-4851-c2c8-08dd28776cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qvmv+29svJcnt5mcHZ9mUXSUddsCRmKoVMgEMokqh4lSyAuKT3ATyURltGqn?=
 =?us-ascii?Q?JIwdRnidOoDW2tcNsmxNGWU6v2WE1bKEBxWB7H36mETMmq8at64FRRndNavD?=
 =?us-ascii?Q?1NjLf4IHjXYWAUfAwx2Xg5fAbyZrlPIfyxmeY1mVpT6HymrAb20sMqsg+rMT?=
 =?us-ascii?Q?ZM6s0GGZFB/wZY1h/VJdCC5KtK3l4hlVOBb7AMKQe4u6FzEUdiGoHCAqNWid?=
 =?us-ascii?Q?MasAISqsSGSPZLqrHrPrOeUlmur1SbY/Ir3ayV+cGw7dKnsA7PKFMrj+TveM?=
 =?us-ascii?Q?ms+ONJ5muJ7CpA8Q9dkcbSqASyPxipcTdaGrMrWjfi4MgsXoJyfzUnE8+4oP?=
 =?us-ascii?Q?ARc66Koq2/VhrWzAuySXx1J5vOd57NhtugLknRqMK8jtfg9vu7E1En5dRRh1?=
 =?us-ascii?Q?5IQtG2e6pJXMz4n5GWmBUGC5oKfXGcqnFsQwRxRjk5LDymU4wmLapt8pUIde?=
 =?us-ascii?Q?a+D08362CS94xeKqzPRXCOUOvO3Eu/pSs3Ir9MiOI/DO2VjBDQQpz3in+EdA?=
 =?us-ascii?Q?FU/wZ8ANVQ1rV2Ac0QMNV89C8KLRzxkDRfPI1UPD1QY3z0fUl0Sh5pM2YT6K?=
 =?us-ascii?Q?KknAkMWAvVqBV1mnmd8Yfjome2a8gmVSXsolNarT/UUJFCceeq2rmh8DKr19?=
 =?us-ascii?Q?HOUH1uvRMpTeTJtDXtjruHq/MeILGd0XOMSNxBGmy5v8oWVmw2gKPqDVenB+?=
 =?us-ascii?Q?EEjGGt+bICV7f7O5KOxxTcXuG6obK+lxvP57cxniSD8z5QTtd5JOKQt9mUAl?=
 =?us-ascii?Q?DFSDjnz5y2fXgVSONcSjIpZWlCht//gEM/FZvG5Ij626dbwtcpxYA3+Scl7O?=
 =?us-ascii?Q?sKdVeOfANN7e5QZrHMDrLgXVa2xRJX9OS+VMe38qskBXq5mh6YLr9Nek0gSj?=
 =?us-ascii?Q?X94HmMdqJhg+GRUs30GF1MPDXs9NGWujCWNtm6aby+AeweU1wl6tta9Csgw3?=
 =?us-ascii?Q?WSToSl7txRbF5YWbORnqZwE8onuCJuwUtCK/0B8WZLMy5dWBdNEWwEzWjK+L?=
 =?us-ascii?Q?Wp6fyIrzWXghdHyNh+4ffiQnNLIVrU6D6qu33Gy0RlUYJDQBRZt9UTcpcCcj?=
 =?us-ascii?Q?zFkZIBIzkYW35U9zUcwlQbsZkkwx5dWy7QpzmEx26AehV+WH0XNX5DEdIRDe?=
 =?us-ascii?Q?nsYFi1QqdxQ/AM9tu1GMEaXmHlaauwwUiE65+2nK7fm4GzCQ5bvSdyOZuWm8?=
 =?us-ascii?Q?1BpvSMMtJLzPi9ERuHxqItR347QaehtgydY6eeCxy6aj0GHkf6XuYAOCJ/Rd?=
 =?us-ascii?Q?kHqGZmRE0CrCDhCH0kPVGTJAbSrFR/ioZGGBauKoxPJny7bNgfk4dOquq200?=
 =?us-ascii?Q?8748Dq1N7vUEmJqGYodVCIdkcd0pYAs2BwBAV0cYqRFfjWObFZCGXJtB18sh?=
 =?us-ascii?Q?et1HOgvVfAGs5lDgbyXB3vPTjZSM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PHpFg+S9UxLGWJ4FUdI1SOm+QbUgrqDKdjn8cEq3dZ9tlz4hlzU09SZLy7Ke?=
 =?us-ascii?Q?SSmajLfpC3rgOkckgXTmgF/Lxj2eAts9pXE79i6mkAfXcUeH1ZYa0VNT7/NO?=
 =?us-ascii?Q?capLdZEoPYz2xQYM+tuNnDrkL7RHicodOBkwUNXiPB5QABDJjX1hbwXCdIjX?=
 =?us-ascii?Q?5ezxCPBRi7eDMfG6u8HD/LdV4EC8KZkuGcPr5nIbud67pKqV6jTYkap98/zm?=
 =?us-ascii?Q?lvQ8cyMoia9rQW0y+yB+s1BnIT0BsIxOVJzF3euaPrOPcHHXFl4GNrrTvdtI?=
 =?us-ascii?Q?iw6RPEy/m053vY8A1iHwFBprgaGLBp4oFTDty5nHQjewprGXo77z77rS+2Qz?=
 =?us-ascii?Q?srljoXKpWXt9XAwEK48GHgGPD8D3JqZqcmsjX7j2c8+hPUwN/cBrud+h0Nuw?=
 =?us-ascii?Q?2cgZDHX/Mcu3P0FlgRc9NAogYkgnwH0LAnvnjfBpapCxmhOlZuhVOGLfQ1fv?=
 =?us-ascii?Q?fuRbhulxPG0bjzr2U2Eug33gbd7PIMtEliIloc3dBTBSle+5TdVsJUHAWBrx?=
 =?us-ascii?Q?CeaTKdRVb3l6i0k0j5wIbEd69ZtBjoCvUafFIJzHTYN/xHl26u+9SMvod1RT?=
 =?us-ascii?Q?gZWwRDmmoOuSoHEp46xhJCP6q7thdJQUL1cAvLfs/o5691Y7bV3COS9aB/nd?=
 =?us-ascii?Q?QU6jKW0POsliVlo9KdEJL8paG/kOuXJm2E1xfWf0q1wNc7JJscwwiytnk+Ih?=
 =?us-ascii?Q?P2eBsOfjgRj/DPTohos9B9plxCk6he95jMNuOueKyXXRV9K323qqO71E3Eoh?=
 =?us-ascii?Q?7QPFKjuzrUp5HftthffHGiqB1Gm5UlZsFi/UthCTfV4XWEWbj61HgC00HOmF?=
 =?us-ascii?Q?3rj35/5DWKRcZ4/4LxTYiUt1/8P7xw0rjIdRYbozASUd2zhssnh/C6AfDJVN?=
 =?us-ascii?Q?63UC63x91XsTzRe2eSEbgKEXHfIJq3PYNNuhHRzmAENTWMh2xarUPFYgLDKu?=
 =?us-ascii?Q?HtOyFyPw9Nvf3pGcipxoNlO2kH/us+F1A2TwMlp4PWFZjZ3i28CIi+5FRV/m?=
 =?us-ascii?Q?7pXnsxwt0t+zm1ObTCe3adaZMp2D5/pk9pyYv3sKxntoy/wtkix/h0/zCSam?=
 =?us-ascii?Q?muNrj2xbtaLTphMAofcMzS9zz3b1GWUwDXEl31OApbN+k4D0zE4NWg6aO9DU?=
 =?us-ascii?Q?jjoEI4vTIEbCGTCp2nsbTP58mIRQXHWQo2PgErg9zhuGXL4DxmRXVRcYEuJH?=
 =?us-ascii?Q?7MC/eayl271sOlWus16u9EiIKWqXmDd+pUJK+zo9vmB5A+9835Pr+R81lqeF?=
 =?us-ascii?Q?JRXD9WTi8kHINgFeSLh/7OHm6880Bij3CtknbZNyLO4JDFVlWVIcaKaTtwXu?=
 =?us-ascii?Q?eg5ziFMEh0RD0a6tDmTjFXABm2Ov2MkeKQGghI5J/8+cmjD7eapuItQDFvQR?=
 =?us-ascii?Q?W+35Ydj3KXSkZf+ZSC5I8KlJrDu4Fi11744/5SSgnfSYdZQB5RQKJbFn2E6V?=
 =?us-ascii?Q?FjguIPha+RM7ddOjwVd/KrUU8xwok0wPtPgFipo5qD0NxuaPOp/l4tGxjNfv?=
 =?us-ascii?Q?DN28YdLgD1rHNgTGDshJ9AKimwvTqsMu/COtiwY6YslQegjtxhi85/A4lBwp?=
 =?us-ascii?Q?Tzs18Wya2snFcngt2Nj8Ps9bYf8Bqr00eAlMrn+j?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4175609a-acfa-4851-c2c8-08dd28776cde
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:12:35.1279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvyrZDF2FyrJLN8iEQlx+me1RkHGiYPZ1rh9x7EDB7IbiN3q01e7XIEsu1zIbGiFrcC56d02Q+WjNmKwfqSc9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9821
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

i.MX8qxp Display Controller pixel engine consists of all processing units
that operate in the AXI bus clock domain.  Command sequencer and interrupt
controller of the Display Controller work with AXI bus clock, but they are
not in pixel engine.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v8:
* Drop instance numbers from compatible strings. This means switching back to
  the patch in v4. So, add Rob's previous R-b tag back. (Dmitry)

v7:
* Add instance numbers to pixel engine internal devices' compatible strings.
  (Rob)
* Drop Rob's R-b tag.

v6:
* No change.

v5:
* No change.

v4:
* Collect Rob's R-b tag.

v3:
* No change.

v2:
* Drop fsl,dc-*-id DT properties from example. (Krzysztof)
* Fix register range sizes in example.

 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 250 ++++++++++++++++++
 1 file changed, 250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
new file mode 100644
index 000000000000..633443a6cc38
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
@@ -0,0 +1,250 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Pixel Engine
+
+description:
+  All Processing Units that operate in the AXI bus clock domain. Pixel
+  pipelines have the ability to stall when a destination is busy. Implements
+  all communication to memory resources and most of the image processing
+  functions. Interconnection of Processing Units is re-configurable.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-pixel-engine
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^blit-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-blit-engine
+
+  "^constframe@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-constframe
+
+  "^extdst@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-extdst
+
+  "^fetchdecode@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchdecode
+
+  "^fetcheco@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetcheco
+
+  "^fetchlayer@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchlayer
+
+  "^fetchwarp@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchwarp
+
+  "^hscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-hscaler
+
+  "^layerblend@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-layerblend
+
+  "^matrix@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-matrix
+
+  "^safety@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-safety
+
+  "^vscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-vscaler
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    pixel-engine@56180800 {
+        compatible = "fsl,imx8qxp-dc-pixel-engine";
+        reg = <0x56180800 0xac00>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        constframe@56180960 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x56180960 0xc>, <0x56184400 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@56180980 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <3>, <4>, <5>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        constframe@561809a0 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x561809a0 0xc>, <0x56184c00 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@561809c0 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x561809c0 0x1c>, <0x56185000 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <6>, <7>, <8>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        constframe@561809e0 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x561809e0 0xc>, <0x56185400 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@56180a00 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x56180a00 0x1c>, <0x56185800 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <9>, <10>, <11>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        constframe@56180a20 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x56180a20 0xc>, <0x56185c00 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@56180a40 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x56180a40 0x1c>, <0x56186000 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <12>, <13>, <14>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        fetchwarp@56180a60 {
+            compatible = "fsl,imx8qxp-dc-fetchwarp";
+            reg = <0x56180a60 0x10>, <0x56186400 0x190>;
+            reg-names = "pec", "cfg";
+        };
+
+        fetchlayer@56180ac0 {
+            compatible = "fsl,imx8qxp-dc-fetchlayer";
+            reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180ba0 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180bc0 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180bc0 0x10>, <0x5618a800 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180be0 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180be0 0x10>, <0x5618ac00 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180c00 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180c00 0x10>, <0x5618b000 0x20>;
+            reg-names = "pec", "cfg";
+        };
+    };
-- 
2.34.1

