Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD8C544404
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94120113D67;
	Thu,  9 Jun 2022 06:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50051.outbound.protection.outlook.com [40.107.5.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA00113D67
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwOxPFB1WqZBk+g0nqRScO0aJEsiUkmMbh4WZNmgJR4qJya4oLuHaMW0g4L5cVgFvRw9HzKUY5lpwB/u4OC3KIIGlgnZ07IB2NC54kE2gmMaxbym0zUY/UxeCQfh7jWpJV7k0k9uSU/fX/qqJDU+pU1YgMc0nWFA3v1SC90XxMsGzxo3YNMbEB1Hzt5FqqqEab3ObibuhvkgENmrX6YJpBWxmDWSE8nNty/9XWB+OTtq4FY7OeLA79r3AOco3/FzIZvp2V5UlomMn6Qy8Q7qtm7GW1Mgklu+iDN2bmHSOFWllUce1p0ychpiF/oWkVsPVShXtwpK4bFjxaumquxGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGMCFkE5UKzvfv/uX2zuCd//zUK1ZgRhdIRETpeS6yA=;
 b=fdTpnr3q9f6xTk4Y93u1ZXsWwaMenpFtHcxqj5du2NNTZIWUGaetYvdFoBh1m4KCicN5Y6ty1JRCyNCney+MOzxjGpkoTMceC+ZLCWaPXf9u/Srl+DKgqcO6EI6kYn4lYgsUUi0SHH2j3Q/3GH9gQO/JUsnVXqj/ivBKwBSb+ry5bapYJtQEtJFWKf8zwtDnv+9MWBY0wAN80hj2VDuiySZemRgoL+ulQvPQAGTHKCICojG1dzFEr5C+PBwAQ/l+ZFEMOtU6RaQTL+6DKWDEi1CIzK5mK40875RKi5C9Xgt5Y55oOYRr30s02eWdqZ8RpNU6ZvsHn83+XS77IpMgJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGMCFkE5UKzvfv/uX2zuCd//zUK1ZgRhdIRETpeS6yA=;
 b=NZIskhGtBQd+OKuQJDoLUEAnRkpyLOD7A+0zjv8zLoeL0jZM+5ljWAwYAT+VAT5hJtgbSxGLZIJl7D6RPbubTQiGGBf1x80W9fJpOkFvlp5KxByoNH+AFBlPd5BdaSrWDdVJAwdgIQTy/GQuxdji/MKz4YMLwoxb0QEVep75+wA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB5280.eurprd04.prod.outlook.com (2603:10a6:803:5f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 06:48:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:48:10 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v8 01/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Thu,  9 Jun 2022 14:49:18 +0800
Message-Id: <20220609064931.3068601-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609064931.3068601-1-victor.liu@nxp.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cc8759b-a47a-4283-b9f2-08da49e404ad
X-MS-TrafficTypeDiagnostic: VI1PR04MB5280:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR04MB528011FEC0F8ED7B74A826E098A79@VI1PR04MB5280.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aAy8HmCaLfIccdExDroJDY5TQ5WI14LX6R+qcHnB6l3gfUl/yiamdTJ6jKf4nbWX5mTnOX2dP4fFbqtrCx3w56SN39zGlipxjr0ZxrPPO6r2fuNqxOm0ua9nejLDKhedDst5P/cj8ULBt59bkY7Q8s12xLkIg5U3WGpmewKdONH6QFXZhSDFJvhrZQ0fLP2b+PoeanENJTqh8jGxUmOzqQEm0NBxGRbWiLBBnyhi2wXez8BCK16NiqbCDG5PZ/lhsrqPoNIooEv7rQ5NrVUDMzjCpQtjno85JW94m6ccLzJ3VJX5PxH1LMMzS/yXch5yl6qyET5tx/fHnTnGo4q7wtUwrjaVKugUzez5yQ9p4YzLpCt1YqAfRulScNTenl7MZwZe1ETDJMDUiOEACBSuqVE1NvVi1Z63jrFTcrLyeEoDclsJk554fRi21DVUnmwcs7K2FDrOZYYPFEZmHo4jRr0jH45WdPIFajzAFOcDnmUlk60A/K9wLGgsZD6Ap0wtNRsRPUETrCswDsWnPFO3KcBliCxqhcGHp/JPjUw7L0XpABU4NYM/nQZvXmXJ+Ix3EJiCzh6G+06tTOJE0+EsGhl3mE/oR0inpCpPwVy9bnD2cgR7ybRIP1KvtMXLZennQUFkI6drUNSsl8wM4N8RpvTX9M1eoU0gKN1nD5uOQZYSCK/Fe4rVs+CMzJopF1b73BGlPYsZe7ax8TIQQSUsNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(186003)(83380400001)(38350700002)(38100700002)(6506007)(36756003)(2906002)(52116002)(316002)(6512007)(508600001)(66946007)(6486002)(2616005)(66476007)(66556008)(8676002)(4326008)(7416002)(5660300002)(8936002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F303XoTCpfXJ4SFFzJWBqMorokBmVlFEmQGEcPd4BVjMB9fq64pOzAd2BtPl?=
 =?us-ascii?Q?sm4jKBhUMtVPEwpoU/blV5dvNOWEu5p8MsAITHlN7za407zjxcI0SFnOVSV1?=
 =?us-ascii?Q?EmnuCj+JPJxw68HwH4YVsBfF6qOuLwDzB1ZCcGt1/5Ajc0Ru13opMV1QAaUe?=
 =?us-ascii?Q?Gxm2HjMbDyYlv4UBuexFFsK+zTyvEO2OG6ovGmSGCiijXzBeduUXkfFts6GN?=
 =?us-ascii?Q?cEs0Zh4JgJXmg/PdWl2VqGbCmfMksI9uk5ZLAsKHrVqg0kxMlUyQHc/2Q+4k?=
 =?us-ascii?Q?5zDKZTOq5bV73JF7HhqCSSWs1W48PL1bsHVQ/JtJnoEY4cs2SDNdfUNgC7qK?=
 =?us-ascii?Q?e9MNJCfIpRm8XYGW0dgZp85aiMUZczf5NsaOxhWrYlK8k7OY5ZEQzIEtrE0P?=
 =?us-ascii?Q?hzS8rcXnpyymXCVpHuRRmgksVrkoerE2QjUzePrUxOsAG6OKi4vcg+1bGQWE?=
 =?us-ascii?Q?kfrHmdwIFs7w8tdCsrCyBHVQp/z2rXLzit9k0cpJW6XyREja0tQrzVFduWXi?=
 =?us-ascii?Q?Y3VOHxEZDvUHZUtULKgEc46gn6WY0MqT8Hy4xLUAMyx4AGeBARs+RDaMbfpu?=
 =?us-ascii?Q?mGAi3RUYe7kaSE/efvdO9RNnIoklVIsvFqUHqXpN3oh5nuqIEB47rqwwjXuG?=
 =?us-ascii?Q?l3WTD6fL7f4yL2jWH3BLQiPtwO8V9SdmYulbUi3ykKlb/LqsHS+eLinJ/VB/?=
 =?us-ascii?Q?mI9vSftTFfQAFFtHkMGmYywiOmB4e+/9fvOlGhsGvpfRmX8yqRtWTaRDf0b5?=
 =?us-ascii?Q?92T2cZRisBgozobATjFaRSW8Gzy6dOHhpBk01PYNrR1sDkw3s/YfCFq5MarX?=
 =?us-ascii?Q?WITvRCuYQD20x5S/zqm9WtqyyPUgZkPzvQyog0cH0J4te5fYejzBjXVBu7Cu?=
 =?us-ascii?Q?nuMioPbDlX33qs3raP7Jks2Si07VWDbBoWFGcd+gnCXSNtpPuD7FMTm9HPz0?=
 =?us-ascii?Q?yoQZLe18wNZN86kOlAymgVoBR5GBd9w6EXY4lw8bG/aYsxUx5dg286miLW5j?=
 =?us-ascii?Q?7tWx3VqlJNCWJlkF2En2POyVI7oDV5RSs9RhB6bXKCm1chKLkgW/O7IzIp5+?=
 =?us-ascii?Q?/A9wfA6LfHsogADrVtGTIXq4HqkL+v9OHfS6+A2hQIGXFuH66OS/kczRbDjc?=
 =?us-ascii?Q?E4AidespEKlfQ+JWJ7K83J0Tthvi8qF9MNMFLoWfpKT257vZ73kIHzOz3N7+?=
 =?us-ascii?Q?FZ2qAdJEb7hV/3ln0lcoRreh5KCngLRFL/uJk2DLkvvddaoQqhhD4Ewd0oIf?=
 =?us-ascii?Q?+g5XvQFxE4HR9U4Vd/uBpvKu3i6HqGf9pqAFcah5MN+M4OAx2iXBtwagFbTZ?=
 =?us-ascii?Q?nWMR/Cz2zKn59QvDOWkWFVwFFBz/RzisfYXpUGfhDPk7ksecFHgBpt4TiWSh?=
 =?us-ascii?Q?YnfvXFZ1qaqGF9qDcgMpzd/XlUQpx9apJwierw+L0gajq2jaVzfWrbHStVTq?=
 =?us-ascii?Q?cpl6OiWGLVhj2BPJldiQmEazsiEftMqB/Lwiwfz0i/Jn2nrEr8Gp7vlI/fBj?=
 =?us-ascii?Q?HKJMM/4uXQs0d9qzkGKg4Am8Ox1jQic3XHf/BwTc9BucFeQZAVPu/3gOUve9?=
 =?us-ascii?Q?3FiV5233I8iMRHY2SifO9gyUsAcBiiFpDCwGHCSH8HLWoNQRCXQ8pzccRr0I?=
 =?us-ascii?Q?cuqWl9xoxCs22wPjikdIqefB28gl4X4yUWS7s95ENwtClbz7Cu/CTMiOaM4I?=
 =?us-ascii?Q?zln36qVpzd/oA86QmA5uJwwojDMQB7ZcRZ7dtzCQJfAwfi07CxhWAZkQ9LZA?=
 =?us-ascii?Q?HpAip9SuFw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc8759b-a47a-4283-b9f2-08da49e404ad
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:48:10.8711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdiOHjGOqTcojznuYaYeTLJzy45JsEs93apyX71SZmWFtZpG4lzTm8n/I/yrdKohk7AeGB9hnLn119SctWhJ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5280
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds RGB666_1X30_CPADLO, RGB888_1X30_CPADLO, RGB666_1X36_CPADLO
and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp pixel combiner.
The RGB pixels with padding low per component are transmitted on a 30-bit
input bus(10-bit per component) from a display controller or a 36-bit
output bus(12-bit per component) to a pixel link.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* Add Laurent's R-b tag.

v4->v5:
* Add Robert's R-b tag.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 include/uapi/linux/media-bus-format.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 0dfc11ee243a..ec3323dbb927 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x101e */
+/* RGB - next is	0x1022 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -59,9 +59,13 @@
 #define MEDIA_BUS_FMT_RGB888_3X8_DELTA		0x101d
 #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
 #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
+#define MEDIA_BUS_FMT_RGB666_1X30_CPADLO	0x101e
+#define MEDIA_BUS_FMT_RGB888_1X30_CPADLO	0x101f
 #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
 #define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
 #define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
+#define MEDIA_BUS_FMT_RGB666_1X36_CPADLO	0x1020
+#define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
 #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
 
-- 
2.25.1

