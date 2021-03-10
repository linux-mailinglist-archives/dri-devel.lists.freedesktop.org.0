Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31150333971
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 11:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92DE6E9E8;
	Wed, 10 Mar 2021 10:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130089.outbound.protection.outlook.com [40.107.13.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928DA6E9E8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 10:09:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QX2f2T6Dpf2CUKcpDmLNIbUJcRQY/JVv2CHNEf+8Z/ffiIEwGY9AgsrkFYBczbmEod7cnPvOTkM3nV12QFd/hXBo4d/AJvxyKGurdhp7BWc5hySepgXh9fkvWdvHzPKfsD4oRHIqm4LOk1gi/HTAyxs8EtDycTeAzy7W1yiZ8M3gb6Xxd5QDII/wVtOEl0BwCyZrMHRQXIJz7NJhy56nyaW/Kxszx7U0hMGN6nb0a8T18ehg/veDPY+gk/1FLWte08aAQ4I1NYakp6hikuJvkcRg4vnwfSi+GlYI5K4ydfwh18j3A73DGzvjQB7mWJVQb/MPW50KvNMagZs806QItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFZmWQs9Xj1dNrWU/yWuaf3fDd+hGBXTEET+3uLnoFs=;
 b=jwOLgguhl5XHhLZpZSPg1FVbYx/GPEnMlj7x5gusnX40od9WO3ainp8rcc1zqRqsCXwKS3i7A66G7Pu6hLe/oOkDoUDMQRsEv/YO3dnEcNxpjnX01GFaRy4bcwieLHiIbS7w4IxItTpZGjpLgQaTeM6Zs2kAAu0CzQ1dFCsFVybZyjOobd8HIsH12/FTth9vg6HMS8qFY3C6n11+5mcHHmcNZHgsXdy+nuV80yQH8SM7ynYrCA/dQP7y6TSrm4CkPE9/jREDRqrwnNIFLt2BiqJ+7Pl+9+uiFwzfmsew1uOngh1VqRTpc5hQctTSE07VEYMro7xvzKZLPzD+ugxoiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFZmWQs9Xj1dNrWU/yWuaf3fDd+hGBXTEET+3uLnoFs=;
 b=r406e5/HPzWN8PowBelwPYNzGqD22Uvf23hciEEfW23ZbeO85opbsnwbttGm5hgwdqQWeQy3xbCooaoF20ASRdKh1mvv1/IfoZ5VS0jQfl0BBCwyfa/WuoBBU/nHDrJIO1YxjOgpJGPhaL4m3jESOYpaVINTH5ielZ1SxtM6hms=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2318.eurprd04.prod.outlook.com (2603:10a6:800:27::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 10:09:04 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Wed, 10 Mar 2021
 10:09:03 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v5 01/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Wed, 10 Mar 2021 17:55:25 +0800
Message-Id: <1615370138-5673-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:202:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 10:08:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ff516364-9e51-42cf-cc91-08d8e3ac888a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2318:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2318250C2357AFF3DB3320D798919@VI1PR0401MB2318.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y2X6HJdgXGyhrksR7Tj+lhR13DJdkIKGEXbOBkcSUBaw1zgYAy0FMEBXLgQqogdGPKS6qyWbmLv781o6oftVBNDz32YkKSTIwJ5uHUPfG0T7pfVqF2AAdT8FICQufPMNpD+tlROkQ6f2y4CULilxsG9euxPpzvkP4GuOshWh/uRNWbt+Sg0ujiIhPc+UOb4Pn/Z93xzb3dNPQiZj1QgnGf74SKndAMrlzVuO3SPYwiQhFjWwVXqSqPvqz/jh4Tiucy4SkUUMHp91tEyD2F9dn6mQ59AQJGG3s0vk4WfKQ19ymt+/3925RqGOnRioY4VQaO8E4SjsF69Pa3LDH79In1MoZ0dUEV/hoTlKDyIviGu4bmV3JhMT7WeHazzdu/MSyTDqexBclC+J04CVPMM6N1tY4/J/erAm3mCD20p0bnMwN9vghWgsYic/fyeXnjAX3L0b4xBQIN9yVTCr9V/vIJxL3kdpWRmqERpgy07D/vpJIkl8y8KNj/Pbqrh4l9j7NYN3CVdL5vefAg39FybemM7rlJAQliOewXGVovslThmQ8rZ2I/fEI81MfI+zGRT5OSo63LQxSat1HPC0NngosQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(6666004)(66476007)(83380400001)(66556008)(8936002)(6512007)(2616005)(36756003)(6506007)(316002)(66946007)(69590400012)(956004)(4326008)(86362001)(16526019)(5660300002)(478600001)(8676002)(2906002)(52116002)(6486002)(186003)(7416002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+Eg3EMAR+bJL+INfLqxaXMW0ML5rHDGW2X5qk9skv2E0Dhc1QLJfb7+OJJiU?=
 =?us-ascii?Q?1OEMC7NRcyDdwp9LEa9nGKGuAwCTBHusAu/SpGt52TO3z0kgQEBUXuYSOEAY?=
 =?us-ascii?Q?LQp8Wm/pGouJ74rxN2tisY+C7vnfYKOAWvPgxvTziCgqt6lhrFqWOQ5TV+ik?=
 =?us-ascii?Q?C5G0ZYUPkXcl4gkHMpUkVuiiSmq3DXGSv5OFe9aPHlAnrCBIKBzoR6iM9ram?=
 =?us-ascii?Q?TBZsn1BiUpZ/Vce/k4f61CmNFij4jpJ+3HW/iFicTxVMK/6za1q+g/9dXKqo?=
 =?us-ascii?Q?zgMenegBPWIHQcudaAX/e9YS0ZzH8n9Icpm/Vfpfl3VjE6juTTZbLkzaQ9ZY?=
 =?us-ascii?Q?tyznOkOFWq12c4vLt/3CDTrjdT24Iumx+3DIbmFAIxhvS1ciD0VWpixDbJAs?=
 =?us-ascii?Q?fAojleSwqqV0jXR+mgdUh+92xgBJQCLZJQQPVt3KVc7K7PQphJ1zfmAfOFg0?=
 =?us-ascii?Q?2wUWZmIqWGDV78SHo1UHTB2lNi0xQ6X/yXyRbjZWLuvjYqPcI9iwRVFWUr+w?=
 =?us-ascii?Q?vx7pp9zmy4DjS7ggAP3Kh5KZkHl3lfDkq/TFhcyieMVVGQZS8lIje1gIrFqE?=
 =?us-ascii?Q?t8fd6DkSedQALVjYadY7R4uLXfC0IV67YlnxQ8SkuTjhHlFlSTVQdxl42xqb?=
 =?us-ascii?Q?XyyPxIPjZ+EUMYFfTwenf07kJuQuRk0Os2fc/iXxmuNLDDOkUKsaYDBlmZ7w?=
 =?us-ascii?Q?ZE1rQwBn3ZjgmHv8k9TtyjXv+41JlRvNgSCetW+PghHqyzdKtI6AsQHSbYYI?=
 =?us-ascii?Q?AC86FNAJm2rYZ2Gg/eOvSy4xxEWEZLva3nc409pIpXT9pVGaxh3380kelf4c?=
 =?us-ascii?Q?ncCqyhREjZ3FaZLjACG0tAQ0XwmiYgaXk5CvJjvyR5leGhIRf0DbNrV9t8QU?=
 =?us-ascii?Q?IfgBJ4JOggH3lO/0UHsKvxxEiGRW/s8wzfh4febmlGQOt9EuKLw+/czuWdAP?=
 =?us-ascii?Q?6/w4kvQbdfwQNU8asuihqyZDepRrccevy3gdLN2Yd+bmXLPtOxX8XLZo4SiT?=
 =?us-ascii?Q?CDtYJbwVRstSvXBgqZSEDANm+PP1xFJ5ED2cSl21qn/NMVw68Z5RavoAKwv4?=
 =?us-ascii?Q?wxwo5w+PKZ9u1dwZzth+3eL8ac8ZWWG/c2WEoWi6mUY2466aX72o0mSq54a4?=
 =?us-ascii?Q?HdHkWwkfGyL7OAc0zeuTep3anPj8fgIFaU/r+UtG6sOdxOgx0VU86goMoF1I?=
 =?us-ascii?Q?fF/TWwvuppX0nFsQZlzTVumlauO360COm/+80nqG3IWaOeTFNeJMEBgVr7Qu?=
 =?us-ascii?Q?qdwISUoljxHpSlRgITFohomO2uwxBM/N+wn9ryzIHEK4qQ8rEsd3cImksirM?=
 =?us-ascii?Q?ebwjrEdVtpB9oIx/mAKK+X+Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff516364-9e51-42cf-cc91-08d8e3ac888a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:09:03.9611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvZMmm+WkRA77kr6vI7Dxudvbj4IGh4i0AyJKtMsrhsOkbPI+csG1QsVNoGGhtM6kGbQcxArwzmdjKSZCNepqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2318
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, lee.jones@linaro.org, mchehab@kernel.org,
 shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds RGB666_1X30_CPADLO, RGB888_1X30_CPADLO, RGB666_1X36_CPADLO
and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp pixel combiner.
The RGB pixels with padding low per component are transmitted on a 30-bit
input bus(10-bit per component) from a display controller or a 36-bit
output bus(12-bit per component) to a pixel link.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
index 0dfc11e..ec3323d 100644
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
