Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9709FAA88
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA0410E347;
	Mon, 23 Dec 2024 06:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MrXge4mq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2612::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A245510E347
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:42:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIx/izUbFCNyBXHA2sRy4A8PeIorE4CKsTE0CSETT0eSQlfciAVkZW+jFVz4on+nitYpxvewecK5XFSx38zEOXZlKlmUmESEhzxXKsAVaQF+lxrkN1/qI7yBJQxzQzYEb2vveyQZVjSbHBP9WJxVRTib8zuxEQVdo6NivLaUtgpHt78BEgRQf3buVv3Aw3PjONm44V7DZVw81sZIKBboF++9uNiIangBsNWm46GnrYYNf1yT8xjUBVisOYWHE9Uilt7+Ryo9X63UCcPFpjsWDV3i4q8RBpAe/XzefqYaVx0u/e6b0QYdIhUvzew5A/4xVIVlPvK1/Fs+fsHYmSzT4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkeD2TziSnLiWIku6IEI0ox9ta1hXeA9u5BiRvqefGM=;
 b=tOIh6RfI1Mmk0HylW88V/1uhgo+JwIbP+5RWyVsaZHvNpIJHaDKpzjAM3Wbg9JHbKkJpf5muEJiXDvCmMsXCCzkYYpH9xDos+FGbCG5ReHuWXxo7z31f2upi3CV+pbpJK597iF+0x5UHkbcBFOwCkqi1pmok/sDY9a6AbHUD0zgfNTFBspJCD2vYb/8mjGyWlMjgi9A1uZNVexzVemGf1y1Mdmt/zjUCJXqrgvhlxLLt6pTVNhPu3LchricAWhvtyXh69WOnKheRExbRlhwqfWH1oDlR0OAk4+3mXepqs0Cj8hfm7B8uAi1mQeRAZXEiOUS4fboKcveYCGZPMlhmGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkeD2TziSnLiWIku6IEI0ox9ta1hXeA9u5BiRvqefGM=;
 b=MrXge4mqkOuXFSIa7/4XFmOPHdCBLK4+OMmIXwmiKVURqADZVbyBlOjC+bUIYlcJNS0p+0Iy5w8SILj/AVs53Xxstb5gQs1UZ6o+DjwuEqwN3rE/qdp40Iy1tAe8LTvZGp9zUd73y6zV9ET2xU7aK20JonfJ4hsB/LP4fypEx0hzP1mIcokkoGBPXTIR2ZClWaRXoGKWiVPPBASCoSnsjx+GEzGDGV1K6bzw675NBiynnmNeKz5TDrPMZQ34aqoSvl88U8aKOLLBPTmAwPYqt/id2c2XedHXbRdQlmpMqdCpPcRhnvdGPqjazDzCsl6g0qvRNCtAJl2Z2jaJJ3ozdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8986.eurprd04.prod.outlook.com (2603:10a6:20b:409::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 06:42:16 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:42:16 +0000
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
Subject: [PATCH v7 04/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller pixel engine
Date: Mon, 23 Dec 2024 14:41:32 +0800
Message-Id: <20241223064147.3961652-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223064147.3961652-1-victor.liu@nxp.com>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: bd53824c-0d1a-4af6-5184-08dd231cf09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?//kRZaXgS5w/KMJXuyN/D0Y5owr3OaWuhqZVeJjVQmtBoNJF81fkl2TLF0xF?=
 =?us-ascii?Q?FWAd8FpieREgzK/UZuLS+CxnqgeDt1TKmARrOgQu/UR02t/eHPANwU0Lxyht?=
 =?us-ascii?Q?8gdeF48L+RWsQu6/k+/BK+7D7/aTrKOOhkusdinZvrUdLDevmyYagwW5HJop?=
 =?us-ascii?Q?y32aVBdbVIWOxI17A+vqu3Ynx5IxQcn8Ob2zpS6tF7/UW1WluLCBrnNurYB2?=
 =?us-ascii?Q?FCrFYomDu2YaIj8JVCnfda6joD7bTq54MhzLVx98TDeQ3ewNI320D4pIsfox?=
 =?us-ascii?Q?nQG+STXz5pilfewYD0yzAAf3au4+ktETHRNrPycDopyIt6ifSWyCRUVCJt7m?=
 =?us-ascii?Q?fY2HU8AoNPTudKNjs5tuhOFY35GxkHD4drFzLc1KicXfVMJmB3EnIyI5gfK4?=
 =?us-ascii?Q?EDy9XmAsN2LPSSZ8qWGVac54ILoYnHdDnFSn93yCfg9L3HGPVmRqxyBx87to?=
 =?us-ascii?Q?iZLXfIOssK0vjZsGPm2PqDOTOAbDm7EeXKzk4uE9o+FaKHi3sWmsgi71v9TR?=
 =?us-ascii?Q?OHmzVTTzPj8MB7OaU5IKT5VhTXEbGmdAYVPc2wmafc2iGhJCCvOjFf8qnvqr?=
 =?us-ascii?Q?SWi+dmXv9CTdD22VE8n5nSaeMotTPpKafbBzk2DvgtZbePmGAUBL118ynqmo?=
 =?us-ascii?Q?78fh3Bu5wX16GPWSwmnlpl6j2HBA7cgvRUsI6IQ6BmOG+k7OQptS1LD9rpqr?=
 =?us-ascii?Q?tM3a6FZJoG5o2icAGQQKZMTjWWsZrD8jJfCYLJySJ+SbuMD2uy4uR7F145Z0?=
 =?us-ascii?Q?wajPzUVYz25DbcGjLKCGxFr1EJlE8gaDueESlvwyVnTcuQJkvhAZoNI6S/GN?=
 =?us-ascii?Q?Ghwm1TjwyVaBXz+zUTQ5VpknqgD/W7r1v4WFSzDdPwIf4glANXkBIU8ials3?=
 =?us-ascii?Q?ql5DZbFS3kS5YEQPgUScmpzl3k850UlFMO9Rh6TecrRo1xqpPOy7BEnI7oN+?=
 =?us-ascii?Q?Mh82OAQ9r498vNKj94qn5t6fO3QJALnmSFaXtiB/7mijJL/5D2z51DqiZLVo?=
 =?us-ascii?Q?MHAfVsxod4Mz3AEmX4kY/2nZm4R/p6w+switY6L0Bp1GqfJuDfK9wz1X3VwW?=
 =?us-ascii?Q?czyYHaoqGggVwXzvwTHFoMjIcXavSG7MTJp9WdQD28OWHjPAuSJXm4XPYrkS?=
 =?us-ascii?Q?sP7I/TqqXqiUcoh/hZORDB6FZIp+nXgb4sO682TcDN5RDaCI6ebrbadItNQl?=
 =?us-ascii?Q?uFUA+7C6QdNOJumA8yXgNr4BrIQRGK/Z0vcOIlB0/Gb50Y8VbrnUpFlVLIn8?=
 =?us-ascii?Q?0dqug3yB3wenPv2O9xW2L61T3VaX8qULqSi51bkFfMvH8zOuMLz1KOnt3u1z?=
 =?us-ascii?Q?qx8Wr7aO6GUhZD5S3z/yGiDR8MJljC5SUZbi82+C58lPwSAyZGCSO+K+uKSK?=
 =?us-ascii?Q?IKKBwWa9J8ealq5vShsSENsaMd4s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aGFbNNepzEmzCFiWLxF4WrE18fcw+wj0n62x4c7bI5yJONHkmPzGEREXEFLq?=
 =?us-ascii?Q?QtUYnZ1rfDwRHwZUnbJe+uAsoqo7HaiEBUjF3SK3Fc3MKLnhxaoKOvuEfz+w?=
 =?us-ascii?Q?lNrs1u6MRO996/D5n2bHm/0zm4z+79T0ZRIeTP0ZISI+j1Igg4M5O+LkVTmG?=
 =?us-ascii?Q?3sMTXmrvJsbammQg1HkRZUp+kfOx0APMjereA1GEzCFGIMyAjBuSfl36OeYI?=
 =?us-ascii?Q?HdmCQpz/FZo8zBhrfreTB0pxj6DlUHyevDrfrYNblIgUSadss855JUHoUVHL?=
 =?us-ascii?Q?VFpXh1doADd9CQXbKubQIQuzS2+d/Bk4sdwTC66JxN/n6BtqQ+UYu9HjIP95?=
 =?us-ascii?Q?dzAzK0Rh7/GBGlMJ0tgCunn+NPJddDNAjgHxbgnYCEfq+higzqTp5gPvvM/6?=
 =?us-ascii?Q?aqELtBEWTDeTiZeC1ZrtLbjARbPDPldiMlB2J3qeDy18IJNVz/i9WKzTCiWp?=
 =?us-ascii?Q?o06CHwvh+NnJYrtq9nM/a9sFOfkOIBChuBdCWTdT3XbN769E0TKOMbcwpdLp?=
 =?us-ascii?Q?AihXTAoUcSialb7QkTzQAtuiMZacIBFv3QooEH1552iEuKjAxdofLjhR8kta?=
 =?us-ascii?Q?NALuPIiMC0S1qZKHxXgbUrTtg4w1EiqB/mEpobTH3Ols5b/QUBLoQOD8O92v?=
 =?us-ascii?Q?TmlrYCWtbVO8H+E/Ma9ND3x5JhEZgUhJLgtOZFfy3xjQJ99wDS2/u0M/DkM9?=
 =?us-ascii?Q?c8HVNYNbElkMx6Uz4cS6z9GL/7CB1Z7DC7yXUjlHOY3bWeDLgP/yZQFEnHhq?=
 =?us-ascii?Q?heAo4Kd1geCgLC1Ka5nNQpIcuhYUJPsatboUB/BVslLQgaeTcQBwozvsyVxD?=
 =?us-ascii?Q?1w2fKs3OxlFwB1+DIYUC/JJ5XHF4jFY+p/D2a1eyfOckxjGS6vtLa8me2Xc8?=
 =?us-ascii?Q?+orCNTThdMOFoU6L4rDCSb0jN7b+Nni/bOaY311MWZQTTJCH7TB5GCwsakDt?=
 =?us-ascii?Q?ZsPpgKMA0jidYgRDN6bffg3N+z1yqkwMO+kQ140WBLOmeI6Es4w7KqACDv6w?=
 =?us-ascii?Q?2tkm8AWZkktgWf1CIiV8R6yJ9dCcf2TL7dIX1TZ62f97LEXOBMjUGfWKsgwi?=
 =?us-ascii?Q?9wwYgiHuytGosuCJnn4UuKHnJxcKgPN9e94oqBlQDo6C126dLRsz9bjQFVe0?=
 =?us-ascii?Q?lLuxatG9EE1hL78XUpSYwW7ToN2ZVl45zM9l9hoNYLv3StiLLJ9B4Ln+qc7T?=
 =?us-ascii?Q?9ykp6VWZhyj3vyz4nZlQPUlS5pD5SCDIW1xn4tggM/T8cYZXHT8fy2QYBaW7?=
 =?us-ascii?Q?hX0qpQjsStyLkpKK8gbkU96JEHBawFEKjFJrc386ITurmVrOCDrNxwBL8y12?=
 =?us-ascii?Q?pmUAQyhnNCg9bA1MXq7o9VvT8WiQxhGehG8zi6jAbczHwiWmEOUS6qUQJJxf?=
 =?us-ascii?Q?Y9QA309d4h5oe+U3J/Z/KrlEGjPeL0DOjK9sEamr9ruAxNEgeThJ3Y7DRNOc?=
 =?us-ascii?Q?3sZQvEvRAB1/Bs1/BbbwCaRUucEwvTMMdWQijA6ebny7cStRnn2jz9Tv/vjh?=
 =?us-ascii?Q?71CXyXPIOcwY1LPT+FjlyYB00nSVl3k09Njc1mXVDjWjb67xIfw5TmUXDY+O?=
 =?us-ascii?Q?GkFKGKwzbteGqiM6whR+nWQKlAgUm5vPjDNhVBHd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd53824c-0d1a-4af6-5184-08dd231cf09b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:42:16.1094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJUvjoRTXmLJJ5mCkLosPdXFcyBiPIzBUuLVbqiKUjgoU9DKMgbWaf0Vt9wD3Nt5VSOjEMiycXzvQw5SwcSunw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8986
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
---
v7:
* Add instance numbers to pixel engine internel devices' compatible strings.
  (Rob)
* Drop some Rob's R-b tag.

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

 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 273 ++++++++++++++++++
 1 file changed, 273 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
new file mode 100644
index 000000000000..668c9c9eccb5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
@@ -0,0 +1,273 @@
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
+        enum:
+          - fsl,imx8qxp-dc-constframe0
+          - fsl,imx8qxp-dc-constframe1
+          - fsl,imx8qxp-dc-constframe4
+          - fsl,imx8qxp-dc-constframe5
+
+  "^extdst@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - fsl,imx8qxp-dc-extdst0
+          - fsl,imx8qxp-dc-extdst1
+          - fsl,imx8qxp-dc-extdst4
+          - fsl,imx8qxp-dc-extdst5
+
+  "^fetchdecode@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - fsl,imx8qxp-dc-fetchdecode0
+          - fsl,imx8qxp-dc-fetchdecode1
+
+  "^fetcheco@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - fsl,imx8qxp-dc-fetcheco0
+          - fsl,imx8qxp-dc-fetcheco1
+          - fsl,imx8qxp-dc-fetcheco2
+
+  "^fetchlayer@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchlayer0
+
+  "^fetchwarp@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchwarp2
+
+  "^hscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - fsl,imx8qxp-dc-hscaler4
+          - fsl,imx8qxp-dc-hscaler5
+
+  "^layerblend@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - fsl,imx8qxp-dc-layerblend0
+          - fsl,imx8qxp-dc-layerblend1
+          - fsl,imx8qxp-dc-layerblend2
+          - fsl,imx8qxp-dc-layerblend3
+
+  "^matrix@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - fsl,imx8qxp-dc-matrix4
+          - fsl,imx8qxp-dc-matrix5
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
+        enum:
+          - fsl,imx8qxp-dc-vscaler4
+          - fsl,imx8qxp-dc-vscaler5
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
+            compatible = "fsl,imx8qxp-dc-constframe0";
+            reg = <0x56180960 0xc>, <0x56184400 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@56180980 {
+            compatible = "fsl,imx8qxp-dc-extdst0";
+            reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <3>, <4>, <5>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        constframe@561809a0 {
+            compatible = "fsl,imx8qxp-dc-constframe4";
+            reg = <0x561809a0 0xc>, <0x56184c00 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@561809c0 {
+            compatible = "fsl,imx8qxp-dc-extdst4";
+            reg = <0x561809c0 0x1c>, <0x56185000 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <6>, <7>, <8>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        constframe@561809e0 {
+            compatible = "fsl,imx8qxp-dc-constframe1";
+            reg = <0x561809e0 0xc>, <0x56185400 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@56180a00 {
+            compatible = "fsl,imx8qxp-dc-extdst1";
+            reg = <0x56180a00 0x1c>, <0x56185800 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <9>, <10>, <11>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        constframe@56180a20 {
+            compatible = "fsl,imx8qxp-dc-constframe5";
+            reg = <0x56180a20 0xc>, <0x56185c00 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@56180a40 {
+            compatible = "fsl,imx8qxp-dc-extdst5";
+            reg = <0x56180a40 0x1c>, <0x56186000 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <12>, <13>, <14>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        fetchwarp@56180a60 {
+            compatible = "fsl,imx8qxp-dc-fetchwarp2";
+            reg = <0x56180a60 0x10>, <0x56186400 0x190>;
+            reg-names = "pec", "cfg";
+        };
+
+        fetchlayer@56180ac0 {
+            compatible = "fsl,imx8qxp-dc-fetchlayer0";
+            reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180ba0 {
+            compatible = "fsl,imx8qxp-dc-layerblend0";
+            reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180bc0 {
+            compatible = "fsl,imx8qxp-dc-layerblend1";
+            reg = <0x56180bc0 0x10>, <0x5618a800 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180be0 {
+            compatible = "fsl,imx8qxp-dc-layerblend2";
+            reg = <0x56180be0 0x10>, <0x5618ac00 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180c00 {
+            compatible = "fsl,imx8qxp-dc-layerblend3";
+            reg = <0x56180c00 0x10>, <0x5618b000 0x20>;
+            reg-names = "pec", "cfg";
+        };
+    };
-- 
2.34.1

