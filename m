Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89126F9F3F
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 07:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C2110E08A;
	Mon,  8 May 2023 05:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2044.outbound.protection.outlook.com [40.107.13.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A674210E08A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 05:53:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqhq0fa287zTbKI/yExq7STQCXo201S/MLumVSwBPpzswcgftJF/aJZGdKuoy1usjeTeNFONrxplwiBQFmOx/lw47LCCOn0ZuCa8bRPkby9dC96tZ1xNE1Mg5La9EXFxarkN7HKLnGT0IS18RUByQ76qao3QoIis7jwmBCVLr1vmsfSrcqQp0kLVz71EEy1N/W6M7aSE6rAe45k2rpPpE9NACD4jYvB6dltvqecH1FiBswTBecOsJLYOj0pQcezBwA8DLhLrU0qzeMsVCFiHdP4vorIy1ues4gY+qBd0PDVEIFxXYT5K2NGXFxU6F3d4tqv3oPlHLdp2XGE6rSNZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTqmd6wjKDTiYonnYhCMa3pTYWUODQo5SE5fXcvBTG8=;
 b=jdw/Lrrds/KWIta1ofk29iBdmBQf4pc2/F3eoqdax+skTJTXZFjAa2bG088VIK71Miicrwb6aD4qc0Jx2cIh+AZ53ZcIcnv3tESYGM8vMDdhuuGt/1ArqLAHttyszf5x2rA9oP4GABL3beUnCd8dpldpnEhFJW9/Jkj7h71ApRN4xwH8KmH/jLAf3qE8dgNLDr49AwmAJUxmwKfidHDKKZIbDBvLbpVh51CsQPHX10e3OQa6b8CF4BJ4StyEg0seMwTqsMrOHF4aG+Qyvl3bMZimqKCKhZf4O+DuU5jDW+WKNVfTcnuT27Rue8Ed0MGhJ/g/TKQkWqgfyY+guAKz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTqmd6wjKDTiYonnYhCMa3pTYWUODQo5SE5fXcvBTG8=;
 b=JKO1FVIvHxnzV21tLJhK2SPl1WV2WUolVdxYRkaKAVfxcmxHBRlmc9xazDpaW+34ffR7JH5GBl94NNzqna9X/yiIpjWS3TEVhulCcWFwviEVvHsBo9oxzwf+ODfWPnec/LrZSeoi1H4eqbNqGBQn5wa3Gw+rmnH8oqQGJxBWzio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8523.eurprd04.prod.outlook.com (2603:10a6:20b:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 05:53:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 05:53:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/6] dt-bindings: lcdif: Add i.MX93 LCDIF support
Date: Mon,  8 May 2023 13:57:35 +0800
Message-Id: <20230508055740.635256-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230508055740.635256-1-victor.liu@nxp.com>
References: <20230508055740.635256-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 05693f9e-36d9-421a-36f9-08db4f88827e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GNw7hpwz3C8fu4/A49kZUOy2zfh0Ugjg2bsQOD2AQOE+59tvJLNNANV44BmS2aZeKKPcxcbEUN5OQ9jI9M5T8uK4sJaI7lN1Zn97OSjr+eUPjgaJsmK0R3O17doumz9Pzve+XJJ/OhpWaxCdE+lzFZPeAoQRTO4CLXMffWH3Rh+mM37mYN8mvSXR/vH6UfVWTZVDUE9Tkj2QpMrxSsEPLkg/3GzZaygUBL3D4OPpTVvrGnjMqMt0aU2iiYUw3twSw8vgiXqj1VBypdmsnQieLbiv0LcuYwTY4A82iqdxOGlRvdc5lBl9ArnWq6stNkRXbSdgWPfXLMNBRRlqezf1UrP1GXnXMXPzgOEZJy7+vesPTRsvOhnesfgoGtGWUW5LWAZqcsiAf/gi9yTiLXt7JoxQuMVbrpZNfly0edEJLDMnihzz7j5vCMeWIiHYpYJ83KwZoL2rWa+QaS2sNDoI94PHDN12hdjDAhVd1HTUdRJ3gzE6vWAS2AjVGYuxvPljHYorouqud9RJJCyJzFMyJEdE9QqFE4CGY/qPoBGO4W3cFv9D2D0m61mzJnORUF00XPvmYwIkdD4EoDxrfrFqLYHewabJv51bhGmWJqK162fNJ/uMJr3p3clR3q8veQBf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(83380400001)(6666004)(52116002)(6486002)(478600001)(2616005)(6512007)(6506007)(1076003)(26005)(186003)(2906002)(7416002)(36756003)(38100700002)(38350700002)(66476007)(66556008)(66946007)(4326008)(41300700001)(8676002)(8936002)(86362001)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6ZG1IjuQejF5nrbBkWCRHwY7SI6sLdF0ywtRQFSWHuRjRXhIMoC02sgiATRc?=
 =?us-ascii?Q?Z8fX6HQyRWc28114XJkO4mmV0JRvNsCHxnSwJGSlTuTrFWuamZe+ntZKvmpY?=
 =?us-ascii?Q?ZeZg3N+iBouZE8vhfkhmDJ1NyZNObS3V7otw0JJiY2bzuuX3wS89bNaBVeEf?=
 =?us-ascii?Q?C1ZCjjbY942KtiJhggefKicdYyzjZgE3ii9EBX0vXah+lfKVqOU9D0ZHJAHn?=
 =?us-ascii?Q?YCzIVmqxenbmVLneewnVfm6MFEZ6h+Jt2BYpip5ci9KVtFC3inI5K5H8jAWj?=
 =?us-ascii?Q?f4uGScGP9g1U3AntxhPyh33Pa+v3IbNjsnTiAP24/Bu5ePu67E8ag4FnL3y8?=
 =?us-ascii?Q?t7607WpbDa+ONURIeIEp8Pr8MEZ/1w8gvBOHKaSUWs64npvTvGnjx6R5s78u?=
 =?us-ascii?Q?+8V4xRGIBcuPuoZTOrKk+kPQUXzMvYYLP7oROHWnR828v8D1GyMJcgsNDnP6?=
 =?us-ascii?Q?HLQkDyez7qWZm/mSezftlgLwYY5EcIFcKc+wR4cvoCz0WTDDOjmOXxQP85Z8?=
 =?us-ascii?Q?BjabWe4zV9Hd90rWLZgHyl0uxKfI0NPllybbhpCOaujqd/63hakwX/oVmoUM?=
 =?us-ascii?Q?PG5tYUxsYBvY5QSFy0entdtbH//h1w8bfEMViy7moAf5C5Itl2hw8XEL5pWC?=
 =?us-ascii?Q?0n3hbeyqc9K4oazVxrpkKYUiQGzlLFfekYDGGfCKWrfvYnix+xpnlIp+nMSD?=
 =?us-ascii?Q?NGwKa0mfnx8dBWzKtixziONFRKVUg8b0KEVzwGupGL8abXwnxBvM8u7/yzko?=
 =?us-ascii?Q?qx91fNSHG6iEkl9kjpkielYvK8W672mI5MFHZCIHdtJJdEqDkkvewQUmiStz?=
 =?us-ascii?Q?yVWPW3sLtfjdG1ON2fPsjhJmYJ20m44VF/p2RjognnzpzYoxq5MuCcO0fLOv?=
 =?us-ascii?Q?8bDWKHEHnvoTZV5zrxXt2qBlcuDpe2fdvSTuMA4ylUL1uZbuYwpdb2O3cRhG?=
 =?us-ascii?Q?wL5NlxZQscHqfcVHmXFbmLYoNMdfFEzsKD49rbeM5KnDgPK40g7JRAfyUYif?=
 =?us-ascii?Q?DTR99WQmChBgxn3aBH8KMB9gx5F5A1pPw3MLCIP+NG3G6FQoKhXN25Uo91r+?=
 =?us-ascii?Q?N4kkebNR6v+YoK4Qe39U0rCaq7RAW9JboRu4Pofe83/wVD6alNL9OAqCqJSS?=
 =?us-ascii?Q?4fCNjO++eZxD0U2LYzLvln9lgLWEDq4r8gF65KKIAatAvxP4mhQuDjtshR0F?=
 =?us-ascii?Q?OQUvMNfFznHDg0Jdxyer9vQU0Xbf+5G2AytljvJ/IJ5RqCk1e4gMtO5MYIpn?=
 =?us-ascii?Q?jISLRjgg7v6fj6vpNiGk2mN9zPFVgtur8llnRWtUl0WD8IA57bg8YD96xd+C?=
 =?us-ascii?Q?GQcIuQbsA/5wDk1coPtjBcgD9wXx+zVtfG+bcn7hzogQK4StTQIDAb3nNjIx?=
 =?us-ascii?Q?Bi+ndTDrd7fdqhJhBRJLYdBfN+1OBMk2aG1Kg0C/nopHr1iJXr0ey+FEEn9G?=
 =?us-ascii?Q?mJ48SOHtrHubT0SusqBfTLLye/v8S5kKPFxXOqBhOlxfVxodv/4Bq5FElyYb?=
 =?us-ascii?Q?vzxVmbGGQ9r+rbPwrz76PhydobkRaJABv84VBNukInhLP+ZIcmuPd2msKyGD?=
 =?us-ascii?Q?t5eEQ2luFJ1vyUAEAlH1UEfzQ+PevLN2uRPTlCAk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05693f9e-36d9-421a-36f9-08db4f88827e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 05:53:12.8951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0tTLWPOuUmA5XuyYiB1bthG7Btae6cIV42wf5/WGgb9O7ZuhXJJ/q+oV97zXKc9FueCTHhsnQle3IjooH2Cvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8523
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
Cc: marex@denx.de, conor+dt@kernel.org, alexander.stein@ew.tq-group.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 kernel@pengutronix.de, LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is one LCDIF embedded in i.MX93 SoC to connect with
MIPI DSI controller through LCDIF cross line pattern(controlled
by mediamix blk-ctrl) or connect with LVDS display bridge(LDB)
directly or connect with a parallel display through parallel
display format(also controlled by mediamix blk-ctrl).  i.MX93
LCDIF IP is essentially the same to i.MX8MP LCDIF IP.  Add device
tree binding for i.MX93 LCDIF.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4->v5:
* No change.

v3->v4:
* Add Alexander's R-b tag.

v2->v3:
* No change.

v1->v2:
* Add Krzysztof's A-b and Marek's R-b tags.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 75b4efd70ba8..fc11ab5fc465 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,imx28-lcdif
           - fsl,imx6sx-lcdif
           - fsl,imx8mp-lcdif
+          - fsl,imx93-lcdif
       - items:
           - enum:
               - fsl,imx6sl-lcdif
@@ -88,7 +89,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: fsl,imx8mp-lcdif
+            enum:
+              - fsl,imx8mp-lcdif
+              - fsl,imx93-lcdif
     then:
       properties:
         clocks:
@@ -107,6 +110,7 @@ allOf:
               enum:
                 - fsl,imx6sx-lcdif
                 - fsl,imx8mp-lcdif
+                - fsl,imx93-lcdif
     then:
       properties:
         clocks:
@@ -123,6 +127,7 @@ allOf:
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mp-lcdif
+              - fsl,imx93-lcdif
     then:
       required:
         - power-domains
-- 
2.37.1

