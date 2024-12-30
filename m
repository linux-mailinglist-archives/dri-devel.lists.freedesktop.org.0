Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A861C9FE201
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550DE10E034;
	Mon, 30 Dec 2024 02:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CO3LwjaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C947810E452
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:27:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+w29KoGHIvH0WIZvTKhhnqPv6QaMlN05RYauZdoNbZi2Xq5swAKRticnBbPq22Q0y08RAogNPGxU8lfkeQnivyLwK43Sl9U27NvyV4HxojwQHkl9nFP3qIp0Hy/CXvYHKJpfnrorBB71uZyumQWGsMrdoiSbPzVQtxHuL3lkRK8S18F3RQK/wHMnV2Xm9/IF55au1JsNyzAtBuSIKqbfUH5A4T3Pv9kmJXJSIMKDfu5bjSYppHDIYyE1swumllBtZCqyrt/jszKRzU/1gek05/onZmagClkdRp4OGi1+ce2vm+aduncxqi/Eeyjt3I4EtbkI1ki3rOf/x4+Vq4dMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnfNrGNaEnbJKChVIhC8E9eGi19LElKuwqiiPqzcKc4=;
 b=iyWKfazSviBSfp0lzk3q74dFFw9tc+Z488ArNoQYaJttPiRp7p+myWiviW3kDdPt9JMKfvNFU87ummEHhoJxm2oSeIRpGldXeDcAjBuC4t7DZUGPpY6GjyZledhnbFgP2V44fPCwr4vY66pIZPoAxzFSqnND5VdHnqKv124YlXh2xD4Y/T/YrVAmX+uNGTuuma0JIiO/sKrfnFSRjoMYjxDlu2rbboHnZvs4pAGsU5GqH9S52BOXMqEpX/06OouCJH29SCyPgboNkIWi4WF4r7mzhSOqh/BkETkJLgLUDf1HFBxi/wUmg6AI35hGbWoVmqoQCNeSI+dM2CCl9Ah2Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnfNrGNaEnbJKChVIhC8E9eGi19LElKuwqiiPqzcKc4=;
 b=CO3LwjaAiTdn6hs3IdvJbCuBWk5oRNwSsov/o3gq8xh7yCe/BIA/AwFmIBPql8IOD4IgEOepU281v+6TwIcev23NI82059y+f4hRkg+frqBRaubTh2DX/SWq2vubiY2Unq0D/lmuIJ8bpjNJu31bU4wTzUNfDC9etuLURth7GpKoxF6fVaAfQGVVKqqPxcHupLhDoEisC1fuMyweO+VvxBkCM8GnrVfzi+ECY2r9LqmUvbHQphu6DiApJ++WmpRJGRXmL6gFcQecBYSL6adwVv/YQ/Q+/O4QCRSe7AUpHppb2yoMsrSXYMyxxmPZRW29e39wOrGq+kiQsP3ttXpEGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:12:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:12:58 +0000
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
Subject: [PATCH v8 07/19] dt-bindings: interrupt-controller: Add i.MX8qxp
 Display Controller interrupt controller
Date: Mon, 30 Dec 2024 10:11:55 +0800
Message-Id: <20241230021207.220144-8-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 58b7352a-9922-4a7c-8f58-08dd28777a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hrmz4GJrQl5lnP0JWiLVSP/Nt3j1JbWRRIFk3qtDQKf7aFx162v7N8ejwSFE?=
 =?us-ascii?Q?u0Ht8y5ql3VovhfEqzOoJKXP3xRDwAmzhaKnUhDQqNALAhLmuNgsF7QZf50P?=
 =?us-ascii?Q?i6C1C5DsaBDdcs69AVsmtKnMtbL1bJT/KUjS4C2DqLjbw6t1H07lZ8PzlY4d?=
 =?us-ascii?Q?lzPVDNZJTVPGSXS1+vL2EL8+DscZVGijzLmrNEx4BQI0iI54Apy+r6mtRO7X?=
 =?us-ascii?Q?uFA9qFr6IFizpQM8zogpS51iRpv9ovk526/u7TGq96hFJM2/g2VlEOpy/kZc?=
 =?us-ascii?Q?veWEQpoSf1s6XmQVT4C9oygmkC2P9J207N+GFfgfD6t5PsX/E/G1x4/I2U5p?=
 =?us-ascii?Q?Ck1jUXDALcv9Mj1WwyWHXC0NMYYT6/1b4SrPS5+mr4PLB+ywwf0duThAsvDA?=
 =?us-ascii?Q?OWk+4gvOCTRLbNKVLAOhLrX7q474sK2CvoNL0xnuj/RnLk4D4F2qZNj168ox?=
 =?us-ascii?Q?02ErGrD1FwxOMFFbAC/EhdKP2ZB+NAWQAsN0rwRP84ONuv4El7ObU/6y3+o5?=
 =?us-ascii?Q?3z33QlOm2vYOKpwU6dtq/xQRY29gtNhnw7hJE+Da+Wr/dMnnpzC2Q/OGXyQ8?=
 =?us-ascii?Q?nZfs2d7Qrxpg1TCQEKq1PlkcH/YDvvEd+2ndUz0A8+eYiVvLAfmoEFuJnxLf?=
 =?us-ascii?Q?GUF3cnuQtRqzDe74cCuT5D2JSfk3S1QEaxDlgY2cQI8r9b6fkxZQM+iSpixT?=
 =?us-ascii?Q?grUiQDK1M86IUQCWcGt3bTbzN3nXsl4VPSh1LnJjWY4Y6OfptQXeAyMwhgyA?=
 =?us-ascii?Q?Dlkf5BgObn2AC6R6CcTOx3XR/jyYZUu5YR35dy984sFu9GhvNHA5wo/+do8J?=
 =?us-ascii?Q?TUlhp0MDwC3k0r2giyRWRe1DIVPVqLdP/U7ICd1AbCpDTbSQBpj6JkQOec+M?=
 =?us-ascii?Q?X+6q+HOMCBGupDtVr2WPmV6C9E1iF9KoHV1w4Sh2kjaediFrBlMCC+5tHyco?=
 =?us-ascii?Q?euKRwuOXWIjlKpIlZSNcz6WSZjTrLxUcLdIBxFrct6QIvLuIEUHSAK8WPLT1?=
 =?us-ascii?Q?xo+DlRSnGRkhG846JDN9G79hGkTymlxpfRc1H9/J8f4gipI9VXV+sng7bGtX?=
 =?us-ascii?Q?dU10g8XRAMN6duCpWOrZInTcsh3Z7zBH81vMqdRNUP8akjzPLdt398h0V99Z?=
 =?us-ascii?Q?/b2zGVxjYFTAiCQ0jZT6y8YNEFuNDd67WPeGExPOUUeIvnFH/2WIab0quxQT?=
 =?us-ascii?Q?lm3y+MR1+ByafkhMIGbWqe7l93W8D8AjxhWU27t97x9gvgY7tcQBtA1w94uj?=
 =?us-ascii?Q?rwxz7S48RSug+5K8aWanz3oPQaGG1cOCvwEauKVQuTRdshpyduyb75SvJyPQ?=
 =?us-ascii?Q?EYNqm48EVhnfy+m4zoJsmAn3N1t81GsV3wnr7puKdqsL7oRXVvY4Yz9ILlza?=
 =?us-ascii?Q?cJ4aItviIet5PykK5yKGNwVLwHK5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v/hHiEjXB013sa5fAUceAe1zju4Zs5Hvap6PGXCDe/+99UVgrU24ntyM1uN2?=
 =?us-ascii?Q?OS0LSmHnH8PyEyXBLhhrqYKjxXupYIhPJ83dOVITpNkW8uIErXG2yQ4OeTAY?=
 =?us-ascii?Q?mvT6JWTV5dMvImLZWWtvZjy4iUV14Vabd6TDK/xm4ZFQg7AQBgm8QJlOWnVl?=
 =?us-ascii?Q?3KrxxDgAq216WFpfGV741qUzeOvRzzwNHHw0jVn5dDukKAkNSIKiGnICULmg?=
 =?us-ascii?Q?1Pj0QmAXYgAD0NLQVrDs6ZWyFwIzWidwLMyWh0lnMrZNPHhKA4Hb54kB9RjV?=
 =?us-ascii?Q?SJDVACTq8GKh+ynPo2LybCrTBvrrRcp6v0aUdMAieoD6MztOolzBUpiQP47v?=
 =?us-ascii?Q?lPIYMfMS37iGb9xT1yk/D1oEaKsjMUvYhNpVbDwPNYa1k0h6lvAGxX4BXHCv?=
 =?us-ascii?Q?bLBTUlSrQpbL9LyPCO+JgRgD87rdhpRilQEbWnJkHWwvXf970cPozuXN6Wj2?=
 =?us-ascii?Q?1DgJ2HMxYPQHN2Yu1yIlIAsAEH9K7kLeGPC5lZitFWT/wRpK3YRfVC0PA9ei?=
 =?us-ascii?Q?68tPAzgp18E6rOPmGMUKLggG2DfPMDr9DsZYIbPXo7vSlCMMA7alMvd23r0S?=
 =?us-ascii?Q?z6EdNMFiUG1d6hDIOYSP69ggdvPrNOqlZBjupidCxSCYHeZA/UI5zbdw761P?=
 =?us-ascii?Q?WQeM2BaUqrPG0MXJiwai7xFOxSSvFnv+e/wZ44EZa7ygsJAopHyWpBdBvlYS?=
 =?us-ascii?Q?/jI67kdQgnAGz9PXTwoGfWjcKfW6UfpadTOcVJ1pFu1k6khLQKzmj0EkyDwC?=
 =?us-ascii?Q?hcLWSYPSVSgIyxcYpCh8qTjiPaUPU8vFYA1o2L9t5ckFR+dDyJA1mbJaeJ8i?=
 =?us-ascii?Q?IxUiq1IhikJn5pohdmC+CcxVeAZba81pqtiM5FeDNe51Sz7ML8Bk9YIRZr9O?=
 =?us-ascii?Q?jrmFqkCpsW/5ugNMmo4fCUEO6QWDB+hEyIkSxFPoKZvC9Nw0kvUJcLocT62b?=
 =?us-ascii?Q?CjyY36XZUhZPFJq/a3k0OZzUFscQu7OwixBl+5n1CJ7YKK+FR8Z62oLrkTqK?=
 =?us-ascii?Q?RQN5lGkrZOea71E0iRorxNTPqafAye+mfNsGZrEuJLolsXh7sJAPa/pNTy3B?=
 =?us-ascii?Q?VEIgGmWz7ZhIusEd0vUWX70P5xyVMFQTwyPH2Jk8oFwZDDPQqUGLUi7Q90RA?=
 =?us-ascii?Q?KaacAXjhYYZWIi9x73AEaUVgZZeaDChUutlMwUWgGozcZrnAkdfqhumMKZEo?=
 =?us-ascii?Q?HAEaAmQnJsJPT23V8uvE/qwN/C/q/I9d+SDo6fE77NEp+5N1d/JRSBTggrp/?=
 =?us-ascii?Q?n8+O1R6oiPFUN1sJTS8/yuyh1Q+pGLqGwzXBvJl7krwJa9ReyrLZUNy/cQLa?=
 =?us-ascii?Q?S48RAQ6NOljJXfnnk2NWKgx1epOFV5u7ZKxofYuHxOrOhP4e7fviTCzS142a?=
 =?us-ascii?Q?HSeR4MlsutQTrb3BQ4keMTH89HJ9k8SCp+vKAuWOe+LgfRSAzJZXgC2ARNoy?=
 =?us-ascii?Q?h9Sb9ur1hPK1pBkojrHYakOjndNqAC8iwAeYdIJknV/NuPQL2+XawCbSPyVv?=
 =?us-ascii?Q?V9oySA3tlF37SNJdkM5u8iG1ps2xTLqxJIKa/PVljipidA4ZahftOqs066lr?=
 =?us-ascii?Q?jDOxvZcB3JBh/lMwV3odPU5J/T5Nke99iZu83uPS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b7352a-9922-4a7c-8f58-08dd28777a83
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:12:57.9898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPLOx2pFB0n3Xz52myE4bhnCF4pz8OaGKU/JefeupV+rqHzYjxDguvNVG8tqZgfEHxptVZSRo20HhkLz8zL0eQ==
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

i.MX8qxp Display Controller has a built-in interrupt controller to support
Enable/Status/Preset/Clear interrupt bit.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* Collect Rob's R-b tag.

v2:
* Drop unneeded "|". (Krzysztof)

 .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++++++++++
 1 file changed, 318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
new file mode 100644
index 000000000000..6985ee644a25
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
@@ -0,0 +1,318 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/fsl,imx8qxp-dc-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller interrupt controller
+
+description: |
+  The Display Controller has a built-in interrupt controller with the following
+  features for all relevant HW events:
+
+  * Enable bit (mask)
+  * Status bit (set by an HW event)
+  * Preset bit (can be used by SW to set status)
+  * Clear bit (used by SW to reset the status)
+
+  Each interrupt can be connected as IRQ (maskable) and/or NMI (non-maskable).
+  Alternatively the un-masked trigger signals for all HW events are provided,
+  allowing it to use a global interrupt controller instead.
+
+  Each interrupt can be protected against SW running in user mode. In that case,
+  only privileged AHB access can control the interrupt status.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-intc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupts:
+    items:
+      - description: store9 shadow load interrupt(blit engine)
+      - description: store9 frame complete interrupt(blit engine)
+      - description: store9 sequence complete interrupt(blit engine)
+      - description:
+          extdst0 shadow load interrupt
+          (display controller, content stream 0)
+      - description:
+          extdst0 frame complete interrupt
+          (display controller, content stream 0)
+      - description:
+          extdst0 sequence complete interrupt
+          (display controller, content stream 0)
+      - description:
+          extdst4 shadow load interrupt
+          (display controller, safety stream 0)
+      - description:
+          extdst4 frame complete interrupt
+          (display controller, safety stream 0)
+      - description:
+          extdst4 sequence complete interrupt
+          (display controller, safety stream 0)
+      - description:
+          extdst1 shadow load interrupt
+          (display controller, content stream 1)
+      - description:
+          extdst1 frame complete interrupt
+          (display controller, content stream 1)
+      - description:
+          extdst1 sequence complete interrupt
+          (display controller, content stream 1)
+      - description:
+          extdst5 shadow load interrupt
+          (display controller, safety stream 1)
+      - description:
+          extdst5 frame complete interrupt
+          (display controller, safety stream 1)
+      - description:
+          extdst5 sequence complete interrupt
+          (display controller, safety stream 1)
+      - description:
+          disengcfg0 shadow load interrupt
+          (display controller, display stream 0)
+      - description:
+          disengcfg0 frame complete interrupt
+          (display controller, display stream 0)
+      - description:
+          disengcfg0 sequence complete interrupt
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt0
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt1
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt2
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt3
+          (display controller, display stream 0)
+      - description:
+          signature0 shadow load interrupt
+          (display controller, display stream 0)
+      - description:
+          signature0 measurement valid interrupt
+          (display controller, display stream 0)
+      - description:
+          signature0 error condition interrupt
+          (display controller, display stream 0)
+      - description:
+          disengcfg1 shadow load interrupt
+          (display controller, display stream 1)
+      - description:
+          disengcfg1 frame complete interrupt
+          (display controller, display stream 1)
+      - description:
+          disengcfg1 sequence complete interrupt
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt0
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt1
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt2
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt3
+          (display controller, display stream 1)
+      - description:
+          signature1 shadow load interrupt
+          (display controller, display stream 1)
+      - description:
+          signature1 measurement valid interrupt
+          (display controller, display stream 1)
+      - description:
+          signature1 error condition interrupt
+          (display controller, display stream 1)
+      - description: reserved
+      - description:
+          command sequencer error condition interrupt(command sequencer)
+      - description:
+          common control software interrupt0(common control)
+      - description:
+          common control software interrupt1(common control)
+      - description:
+          common control software interrupt2(common control)
+      - description:
+          common control software interrupt3(common control)
+      - description:
+          framegen0 synchronization status activated interrupt
+          (display controller, safety stream 0)
+      - description:
+          framegen0 synchronization status deactivated interrupt
+          (display controller, safety stream 0)
+      - description:
+          framegen0 synchronization status activated interrupt
+          (display controller, content stream 0)
+      - description:
+          framegen0 synchronization status deactivated interrupt
+          (display controller, content stream 0)
+      - description:
+          framegen1 synchronization status activated interrupt
+          (display controller, safety stream 1)
+      - description:
+          framegen1 synchronization status deactivated interrupt
+          (display controller, safety stream 1)
+      - description:
+          framegen1 synchronization status activated interrupt
+          (display controller, content stream 1)
+      - description:
+          framegen1 synchronization status deactivated interrupt
+          (display controller, content stream 1)
+    minItems: 49
+
+  interrupt-names:
+    items:
+      - const: store9_shdload
+      - const: store9_framecomplete
+      - const: store9_seqcomplete
+      - const: extdst0_shdload
+      - const: extdst0_framecomplete
+      - const: extdst0_seqcomplete
+      - const: extdst4_shdload
+      - const: extdst4_framecomplete
+      - const: extdst4_seqcomplete
+      - const: extdst1_shdload
+      - const: extdst1_framecomplete
+      - const: extdst1_seqcomplete
+      - const: extdst5_shdload
+      - const: extdst5_framecomplete
+      - const: extdst5_seqcomplete
+      - const: disengcfg_shdload0
+      - const: disengcfg_framecomplete0
+      - const: disengcfg_seqcomplete0
+      - const: framegen0_int0
+      - const: framegen0_int1
+      - const: framegen0_int2
+      - const: framegen0_int3
+      - const: sig0_shdload
+      - const: sig0_valid
+      - const: sig0_error
+      - const: disengcfg_shdload1
+      - const: disengcfg_framecomplete1
+      - const: disengcfg_seqcomplete1
+      - const: framegen1_int0
+      - const: framegen1_int1
+      - const: framegen1_int2
+      - const: framegen1_int3
+      - const: sig1_shdload
+      - const: sig1_valid
+      - const: sig1_error
+      - const: reserved
+      - const: cmdseq_error
+      - const: comctrl_sw0
+      - const: comctrl_sw1
+      - const: comctrl_sw2
+      - const: comctrl_sw3
+      - const: framegen0_primsync_on
+      - const: framegen0_primsync_off
+      - const: framegen0_secsync_on
+      - const: framegen0_secsync_off
+      - const: framegen1_primsync_on
+      - const: framegen1_primsync_off
+      - const: framegen1_secsync_on
+      - const: framegen1_secsync_off
+    minItems: 49
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    interrupt-controller@56180040 {
+        compatible = "fsl,imx8qxp-dc-intc";
+        reg = <0x56180040 0x60>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+        interrupt-controller;
+        interrupt-parent = <&dc0_irqsteer>;
+        #interrupt-cells = <1>;
+        interrupts = <448>, <449>, <450>,  <64>,
+                      <65>,  <66>,  <67>,  <68>,
+                      <69>,  <70>, <193>, <194>,
+                     <195>, <196>, <197>,  <72>,
+                      <73>,  <74>,  <75>,  <76>,
+                      <77>,  <78>,  <79>,  <80>,
+                      <81>, <199>, <200>, <201>,
+                     <202>, <203>, <204>, <205>,
+                     <206>, <207>, <208>,   <5>,
+                       <0>,   <1>,   <2>,   <3>,
+                       <4>,  <82>,  <83>,  <84>,
+                      <85>, <209>, <210>, <211>,
+                     <212>;
+        interrupt-names = "store9_shdload",
+                          "store9_framecomplete",
+                          "store9_seqcomplete",
+                          "extdst0_shdload",
+                          "extdst0_framecomplete",
+                          "extdst0_seqcomplete",
+                          "extdst4_shdload",
+                          "extdst4_framecomplete",
+                          "extdst4_seqcomplete",
+                          "extdst1_shdload",
+                          "extdst1_framecomplete",
+                          "extdst1_seqcomplete",
+                          "extdst5_shdload",
+                          "extdst5_framecomplete",
+                          "extdst5_seqcomplete",
+                          "disengcfg_shdload0",
+                          "disengcfg_framecomplete0",
+                          "disengcfg_seqcomplete0",
+                          "framegen0_int0",
+                          "framegen0_int1",
+                          "framegen0_int2",
+                          "framegen0_int3",
+                          "sig0_shdload",
+                          "sig0_valid",
+                          "sig0_error",
+                          "disengcfg_shdload1",
+                          "disengcfg_framecomplete1",
+                          "disengcfg_seqcomplete1",
+                          "framegen1_int0",
+                          "framegen1_int1",
+                          "framegen1_int2",
+                          "framegen1_int3",
+                          "sig1_shdload",
+                          "sig1_valid",
+                          "sig1_error",
+                          "reserved",
+                          "cmdseq_error",
+                          "comctrl_sw0",
+                          "comctrl_sw1",
+                          "comctrl_sw2",
+                          "comctrl_sw3",
+                          "framegen0_primsync_on",
+                          "framegen0_primsync_off",
+                          "framegen0_secsync_on",
+                          "framegen0_secsync_off",
+                          "framegen1_primsync_on",
+                          "framegen1_primsync_off",
+                          "framegen1_secsync_on",
+                          "framegen1_secsync_off";
+    };
-- 
2.34.1

