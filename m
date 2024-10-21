Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118FB9A5AB4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E6210E412;
	Mon, 21 Oct 2024 06:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JozP/6ES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8E710E412
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcLWGPEJUVV58CRBdrDgbIPSDE/YyhKNgNv1wKXx2SG/AV8GzFnjyXMLE1KJLK2cWPyaPE+SuK0+ZkRNmAQLExrjbQFgsckSatUT6vWNCeydFsYryMEk9ipL6uBO6N1VYJkScW1znko6dHY4fW6jyxHMIXGWlAEe+qmEqLM3lpRzQS5Q/sqJXc++7qtX+obg8nh+VNkdAnj7sj4JtnAotL9A5p7xtHnkDKvdKURxJQKeuojf1jXwa6gqvGtyoPB13EWWGy4htb1Qq8dbXqIJIARLQOHpAs7ImVKB0/b2hwMRIFsPAZkQov1TMIuY1c9h/GALmYXJP8gCs3pRW8pAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1buX1yMSBwMTNJzNx6IMvplt4J4WhZF3jsTCKKII20=;
 b=wuJzyPlNBXKAPxxEwx1fp2UAWSd20dJxYV57lszvTxxLkzlPml4ZXoSW2e9EeT/IliKSvrinV1NLXOpKXqLBhz6J2fagAHjhxAtDLNJapozNxo1oZ+09G+ulw5Gru6AyiWpZ7sbnfA5NaZFAmja7pYfL6zB+WDKRW6oyq2uuzpSt7//jPeQ8oAG4nyZQW37mwr68OXZRSFhmPg+aLvOzMLhsrotNhSP6MsTo3Vz6GSDCroEn1PLGPj3Cq57i1mLZb+llAY58xuU6cLlkjlerov89Xc7lkCXBpqmCBJRODxH7pNFOo0UA9IKEkULKNd2xzU7Bi+h7sg9AgJQ7IFmCRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1buX1yMSBwMTNJzNx6IMvplt4J4WhZF3jsTCKKII20=;
 b=JozP/6ESRwoSt55SaTQWfJDG7Q6LOOBOqM4diwGE5M+QgGJ/cdQCcPpo/5SM7S+RxS9wbnd1ae7TV/lNA8o/FB5vYu1xiN9NJu8WhYCAIPS0bIcRMJieqokpKk5dYAZ+u9kaAx8RxL93GFWvoR9n/QBRmGwFekgGECpez0s+ZgfFXhgQt1UnWD24MvLT+KCPzK9W4xB89/MvNIYlYSAagbl43fm1CyFB1MXmxJjiIuq5ZfU7Z/76uOkyyPleZ1gtNj9x8w2hCxQiJR7KXK2HAQPOGA+vdd28PfFNBwEKra1NeraJCSktZPUE6b/kAFpYr0ha0Ay0QRt+YX0OiI++wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7374.eurprd04.prod.outlook.com (2603:10a6:800:1ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 06:46:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:46:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 08/15] dt-bindings: display: Document dual-link LVDS
 display common properties
Date: Mon, 21 Oct 2024 14:44:39 +0800
Message-Id: <20241021064446.263619-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 8247aab9-e1a3-4676-5964-08dcf19c2099
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nQLk5xIhXFX7cKx5GDhrOJLEo9k5msmXNig49WEukkMHPa5SaDoxgcObiw/q?=
 =?us-ascii?Q?cMW/F895YDebv6JiqIzOCshthQMssyZaFBnR0rLR16cD4ASyKt1DHPp1Ok8k?=
 =?us-ascii?Q?Tx30Zfrok/6maubTOB3eF3GwZU4aOccmH8njm0ik/kTe9nVYunUaWm8y4qpT?=
 =?us-ascii?Q?5fL+Gzib/tUOmW2YdgrYWPl1oQFohgDT6iwXgMlOlygWOjh9VVjGxNjKzNjE?=
 =?us-ascii?Q?FpvEEyBwmjGFAmB2OcDif/jRtqB+ZgEX0iw4JIgHfL8WZVzhOSWQimjXNbFb?=
 =?us-ascii?Q?73hNX1iDkqVzCzFYNgYKfGrxJpj21natX2mSeEAt1Ka814We7iF6AmcQWxEj?=
 =?us-ascii?Q?pkLPHBwtARo72v17q+/hE2dXMAGKb8QT33iWblGuMK5n5n2czl6wrMGq6/u7?=
 =?us-ascii?Q?ohPEIQncrXt3Ty9rbdOvMqyq1Pxr+5OfAmZsZ2jikV5EVPR1BddHZr5rHl5k?=
 =?us-ascii?Q?VqP75AIr5ypXTt/SDTLnRylqq6CF0ejmvV1neAKy5UGndIaQnOWF4/fL5fP5?=
 =?us-ascii?Q?857pC1M43JnbHRo61TTj33R9dKavZXN+LdKLbH4oRzKTL8h/sJf/7XoGIdNq?=
 =?us-ascii?Q?C5eNKp6GfW03M0p5RttApJgSxGmfHQYr/Nqwrkuc/0zPknh02G1Fq7rgP/+A?=
 =?us-ascii?Q?VaiGqglV2BhC3Po5cDaFZfnD8BF026rAlPz/PeyZxgCP8Vw4l8MVbD2ilX4+?=
 =?us-ascii?Q?8dBNxjd+P+SUb8J4HsKz/ypMP+hWBlvAuznddRT2Jj0SxBh1KszEfmP7LE74?=
 =?us-ascii?Q?UJYRmbKPXe5XT0XqzQRidTu4PMWBxGLKFpyL76HbH7tuH0Mpo1VqVlcFqVqV?=
 =?us-ascii?Q?BOD+dES2eOEKBiPmWWAsbj5B+CPzbtUpoUKvrw5/NwJVhAbz9MTY/TyUlUZ2?=
 =?us-ascii?Q?9S9d0e/3mn9zlFtbBA0DuPtekSlbQngUCgVe/q6hPmgjoIsYn+blJyWXVYQ/?=
 =?us-ascii?Q?AZkPWloxcAqhEK+kExZBHpYIf9qwO4oiw0058PwVmjN2ZoRx218MguCrsMPQ?=
 =?us-ascii?Q?oAj3mSyusMzLxMoScxmW8hqS6/tQ3txTax+wvBAxHw8+TJz2Tw7o61B7Wrh/?=
 =?us-ascii?Q?n5wF4TFEc+EudNNHcFi0t8A/PlFCWGywXYEyLm36CRu8pmGjyMXPgFGmkOtJ?=
 =?us-ascii?Q?SiQ7vO6vC9BxkTumbMSkQhXQQ5tiuq3nR2TDEzGIQFLvLWiu8IKvdY40HEb4?=
 =?us-ascii?Q?DbS1dRGPnsTKO5vV1doFoogrZPtmmzN8Idqfpw97horuyKfB719IimbHkwS8?=
 =?us-ascii?Q?gK25LEMjDTOVN2a1+qvDnwSGGSQhmKEIhJE3mRCKPp55QlpRCVmSFXTLQymp?=
 =?us-ascii?Q?TJp6pqmfb6qw2PbCHOe5F19A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S2BKxWbAtEdD5J75aFOL8Mz7aryd4251DMSJCMeSWvQiSV+bbtBLOoOnfKEs?=
 =?us-ascii?Q?P2PLoKF+KvrbVvI7uCoIeb3U2Qg8RnfZhkBsedl+8kc748aj3FyE6bolk+YC?=
 =?us-ascii?Q?roo5AsiF6zZxtP3T2lORPNFJTAltfEeraAYjoyYkSIIsVsK5T7kNhxT51XYT?=
 =?us-ascii?Q?3qnLqb50t0aKJAuHX07RAqHk5sjzYELGXK5l8WAl4DOqiLCBENF6mnjSqzUy?=
 =?us-ascii?Q?CuKnulHsin1CNZ1b8c51/SbJvS5RH/k19HM6uzBAqagQcLz4eQNRlY7rVG3R?=
 =?us-ascii?Q?zNW7oH5jyCvNBHLGwPP2PvY1bXNZPbrjUma4ttz3qOW5AzeDp2Ms20o+lj+5?=
 =?us-ascii?Q?4X2X5cuDWwKmm1GeINRQnKHCMOOgOTwyawZoP9G/iEFhlyiedpaa0ZsFUyvX?=
 =?us-ascii?Q?rLelbjTR69Cj1nOrcAwVFakzwFpkzRzHzbQzZ+MCiha1pzBXaJhNXOCwLF5R?=
 =?us-ascii?Q?uF7/SgwecHWMnaImwtn1dH9K0yiMK1FWxtkQvrtIRkEyVb9K7Am8DEslmP+6?=
 =?us-ascii?Q?DbUk2TxYjpR4W3SsKL+Uvgx6iCG64+tukLD5j5f6LuT5oyCcPg80J3oDWjhX?=
 =?us-ascii?Q?mZbyv083zvwAYtyGbtg6WeXenL9xMTODxAsOccif6oC78xhPa928+FaKtXup?=
 =?us-ascii?Q?PVZfoGJkwBjv25WjW3WlvdSRPjvc0NJgxX5O9+tZ3nXPV7lOWKMTojcRtRGt?=
 =?us-ascii?Q?rnMlTcMl5DyoIWZQBvrgA4dz+OGK/0rW9ZLHVWTEZVmqJJjjWen+YJURWXrP?=
 =?us-ascii?Q?iA/qBzkuo4WTk0AOTca8SaxORUYX7vKcfFbTY6njgDLaH7c4ggFac/A2N9Hn?=
 =?us-ascii?Q?FenO+uuvJlMeZMqlv1CQCpCWaRx+lyvFvimQFvmztWQjXM1HQAbBy7t+fmes?=
 =?us-ascii?Q?NeiI+TykSyCf4NdzEBCRJUGneAONOMZJMk72mf3yb2i6SxNolO5bgG/gYffE?=
 =?us-ascii?Q?sZVeKZeA10huMemDlO+7JjCyADO1oftgGD0WqIlVJX7bGQ+oDJbdiacl4/qK?=
 =?us-ascii?Q?alYrC16DWM+FIM/VqNWOLZ2z3YK6TNeNhPy4eztlzCikRJJJyXB37Ry8T4uM?=
 =?us-ascii?Q?W1dkIT96WRyaMxaAr78XNmlX55B20ZPpvs3Tzbdyy8Y8aye2GZA9OSaKnIrX?=
 =?us-ascii?Q?q3l98UgAf2xzzJ5dOP8E4Td/M+pL94X7oQVNpZskaF+SNxru2NBs4ffTqpGE?=
 =?us-ascii?Q?kI+arzlei5aKIbX4cMs+PtAXckHsX28F0RZEZzY247R2S73fiIoTUVTEHeFu?=
 =?us-ascii?Q?5knDM0svPtEK/NaoL4CsKjZEiCgL1AhhlSR5X3Z4WXjBq6AaK35bSVxvsbtI?=
 =?us-ascii?Q?NK1MFQ5mR0AyK5VGg7oCEX6FxaieZ2Fwdy3QAU/GaO9TVz+LDPkiEgR74HBs?=
 =?us-ascii?Q?kZAyu9tkG+jeq1vE/oqj2VL6GCw0c7jfBgbSXPg5ol/q3xOIc3nswB+rQP7S?=
 =?us-ascii?Q?iZeSshbI0RmuMzEGVokUsE8TZE/LaOddQCwkb2hK9OssbiIpji4TFSYwcUUR?=
 =?us-ascii?Q?CKdBLtrqSFom/xjJuxIp5lfbtiE2fEjnIiCKWihJUUnStrd6ALhIoR7wsQQz?=
 =?us-ascii?Q?gp5yJqfsFgB8lqGaWBZ6Vf6mi9cOrfaYY/dLeCQZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8247aab9-e1a3-4676-5964-08dcf19c2099
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:46:44.6862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCkN97LeU425pam5UJCyeJb8ka9wHtMUZBUiaDNVYdxToDfTgnWQ5dVkzk/iGWUdA9uV26DFIDl4D3EC6Q/IMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7374
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

Dual-link LVDS displays receive odd pixels and even pixels separately from
dual LVDS links.  One link receives odd pixels and the other receives even
pixels.  Some of those displays may also use only one LVDS link to receive
all pixels, being odd and even agnostic.  Document common properties for
those displays by extending LVDS display common properties defined in
lvds.yaml.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* New patch.  (Dmitry)

 .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml

diff --git a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
new file mode 100644
index 000000000000..0ac4c06d0a17
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dual-link LVDS Display Common Properties
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  This binding documents common properties for LVDS displays with dual LVDS
+  links. It extends LVDS display common properties defined in lvds.yaml.
+
+  Dual-link LVDS displays receive odd pixels and even pixels separately from
+  the dual LVDS links. One link receives odd pixels and the other receives
+  even pixels. Some of those displays may also use only one LVDS link to
+  receive all pixels, being odd and even agnostic.
+
+allOf:
+  - $ref: lvds.yaml#
+
+properties:
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: the first LVDS input link
+
+        properties:
+          dual-lvds-odd-pixels:
+            type: boolean
+            description: the first LVDS input link for odd pixels
+
+          dual-lvds-even-pixels:
+            type: boolean
+            description: the first LVDS input link for even pixels
+
+        oneOf:
+          - required: [dual-lvds-odd-pixels]
+          - required: [dual-lvds-even-pixels]
+          - properties:
+              dual-lvds-odd-pixels: false
+              dual-lvds-even-pixels: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: the second LVDS input link
+
+        properties:
+          dual-lvds-odd-pixels:
+            type: boolean
+            description: the second LVDS input link for odd pixels
+
+          dual-lvds-even-pixels:
+            type: boolean
+            description: the second LVDS input link for even pixels
+
+        oneOf:
+          - required: [dual-lvds-odd-pixels]
+          - required: [dual-lvds-even-pixels]
+          - properties:
+              dual-lvds-odd-pixels: false
+              dual-lvds-even-pixels: false
+
+required:
+  - ports
+
+additionalProperties: true
+
+...
-- 
2.34.1

