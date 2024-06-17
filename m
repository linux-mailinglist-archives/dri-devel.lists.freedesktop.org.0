Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34F290A108
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 02:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D987C10E0CD;
	Mon, 17 Jun 2024 00:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="R8NAThNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070.outbound.protection.outlook.com [40.107.113.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FB710E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 00:59:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfxWBW+476M+uE3O3efU5T9PYgS0sd3cxhM1KXD87CJMTFLeK2rcxSMOTIqZpy5NI0vbMKC7yeoHQqOt5N28ji5pnKUU6seoKAPrDDIkBZWRFzMaH+wzwh9+116nD5MMdreIzHwOP0gmB8C1iEg8ETixYY2HFW2zC1J+ultq6rEfUz4/C1BVdG1MAZrOsymTHW4r0Gj5kRKYUKk3YRGcj0I1UoONHvwPCau5tkQrO97Wjsn/G1TQcMbce7RrDNBfy/i7hQS96hww5IdpAgsaLb9zsh0OGgiopEt5gErEil7XN8C6C+6XkBP6om8rG9Pozfl/MWRhLdfhoiA0ChxDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REllXbKiXbTph1LoY5sZTemVlDAhDPlDjVQgZtSkG30=;
 b=Chp5H2oOwHM7etQkKQX/x+ddY28KCkkoT8vbVwOOFYwI55p2snhZCVUyoU1w49Gd0tPyocC5piUVfGYl4vhs8d5IYt7i8NGqgvgKF4A3Xp3KUy3jO+KSPYNjfAvAB08c8mLPKTu9Akfys8fUASbWg5aqOSNjEEymHUIFfckwiAwnv/drkS2Qgofso2RKPhabHWjSLaRZVH2JNM6iWSHdlAGKqi4hB2ZsGqFOLefqf3fFQoKCVZKLEpBfeyxx3KRPYudP9BGPCMicDX3UZqgrIioWBlEOaTEtV4u8T7+vXjZ5yJydFoW6jwpYIIHcF73PMfNQOaaDVP70Ptnlb2jO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REllXbKiXbTph1LoY5sZTemVlDAhDPlDjVQgZtSkG30=;
 b=R8NAThNnItzALlE7V4pMkbkF5WVZY3Zw4wSelVNC1pSM+/ZeHG7KFqd4SsWKhZpzI36TgP2ad1a81521fHh95Pk+gkYuVn4TY13ZioavuzmaCbQPExDvJBkPSeM3QcQlXXANBCSSUI0yrbxfczcvLXW0iRMZG+b9mwgNgEYyzBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8560.jpnprd01.prod.outlook.com
 (2603:1096:400:13f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:59:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:59:03 +0000
Message-ID: <87r0cws7u2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 resend 3/9] hwtracing: use for_each_endpoint_of_node()
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:59:02 +0000
X-ClientProxiedBy: TY2PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:404:e2::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c37d009-aee9-4f98-4923-08dc8e68adf9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v6NQ1HJZCrKnpOA5gYAiCxaCUCDgcyqwF8yKhINsby6TIkTtc8SArUHS6FzC?=
 =?us-ascii?Q?6jgR8eCe4QgWgC6yUFG3/hg1pet3w6BXK8D5tNegRiuD7zlzSOdNRzFvcj2z?=
 =?us-ascii?Q?q1UI6yXDmYhQBEcj6p8mZiXLrmx/HcZfLPXQziQ8gJn7tOfQipBE1DPuyfMz?=
 =?us-ascii?Q?8WIBQTUI+cBmhXm7zdnuXcmxcOo7xbxbbD6YiVFdbHX3cz1g1eCrnAifAizC?=
 =?us-ascii?Q?yjp8ytI7gA0B9hTCoEN4uJkWYyGJ2ANA33zlKQNdJ6iYfr3PwpCa/ZnbBZ3P?=
 =?us-ascii?Q?tKSoGugqye9330Eus4B8zBBChlSmne/pCOS0W0KSlvyPdlOmMPTeaIMGxzQ7?=
 =?us-ascii?Q?+Nsd9JZFJt6RKjmr8uBXHFe4/+ptJjoGSY/pj5uMtou1jTv/vbuOzUY2JEyy?=
 =?us-ascii?Q?IYb/xhNq0K8MaDwJHgPtfFNlNXEyEKsuAWuKzS0Nb1y2ugAgnql943dLv691?=
 =?us-ascii?Q?ZF1/HAAOx4JZmC+QJt8RJW43qt4ewNUxNPRf0wyBBevf+eFVbTebb6pcWkmU?=
 =?us-ascii?Q?Jk2LVm1EU6uMhhz371+Q+hi7YUHUax9WXDzHz5bI/QSP5oFiD+3lGeLpSDw8?=
 =?us-ascii?Q?GriqZLmPrzXsQolPVg7Rzh5ujoYXElZAatn+h3yVoPSmme2l+uA/g/iGVHg8?=
 =?us-ascii?Q?fyNm9n/o1UH/8CilCak+3UJPj999iIQWG/VbuNDpkjJqtIhAsL/pQeiQXMHl?=
 =?us-ascii?Q?qMjXv64iS0J1m5E3xKnYtT28HJMeoWaP5MLUJKVrc9cTXlUNiRm4PQEvSht7?=
 =?us-ascii?Q?uTmQvcJPLI/y8TuMCVNSoj7zXf1KNyTjJfoEp9WiWtiBPKWMUXACHJvynrnm?=
 =?us-ascii?Q?BPg15Zq7O4P237TmdRcM8kl9+CqUDFMH8lkiRJY5XMPP8zbACo9Wr0CuLlu7?=
 =?us-ascii?Q?ozhIOtEZeHhSV6lrXBhBALzuz7J3yY1vQ+YkMFIupMVumn4Ye/RsVNVDqGF2?=
 =?us-ascii?Q?/+ZQQeVy5xs05x27VLTrm2mJ4kO9lBtBPevpOWiuLJ1hwNxk0vz/rOq5vPY9?=
 =?us-ascii?Q?AKljDw8zg7cYKZh30ZUF1daukPKVHJBY/siJlfn7gIXbRvoEw8643kUZvNVW?=
 =?us-ascii?Q?LzqXPstdMz9slxhUJEmIAisEzYwlK6bA0exATMeiQZlQxhOSVmC7S9Mbpf3R?=
 =?us-ascii?Q?xVqZvnZsQIXB6laAxGoNRn4voPhb8Fcn/RkBmW9nyyB58MhSmBGWolZ9eXN4?=
 =?us-ascii?Q?WfcH1gYxxq+5vtpZ01q+uWT57oVb51CPvXpTd2oFjfreoQpzupxB330zGByT?=
 =?us-ascii?Q?hROkYc1bc0mO028nQeyp0RQbOoI642FlaKF4QeZtT3fWA8A0XOdI+BNNLVpv?=
 =?us-ascii?Q?qyGkaHkfiowiJ5AxNccN3nno/aVWsBKtpP5oX05uwTB8Kh/6qIsMfMGMaq99?=
 =?us-ascii?Q?o7zfkboDKGOKHzVtWWKK/v47AkQ6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w7pLIttDjzI7S7KlecPQ7VRPbqrKROM2iDTlNnCfDALZFV6DNVKpAJlyEGZm?=
 =?us-ascii?Q?6opwk/YW/V+FDb671t/Jk/DdOyXOCDqJQYBkTSPaITZByi4meFMZxeIMBcjq?=
 =?us-ascii?Q?Aovu6xi/YZVmYhdmQfiDa9Ox70vBAMIUD74qSEfratVU39zCZ/+gKlLVrDFB?=
 =?us-ascii?Q?NqF+m1tlGmL4VuiMEgp31nhA63Jf73AT89ehv1dW78ec5EpTpahi8LZbXBIg?=
 =?us-ascii?Q?WseTalL2vDQEoqdgSc2h2+TQYAjMe4j9DgFgeX6Vli8vdqwctY7dm/Aszd9j?=
 =?us-ascii?Q?82ERnkHhmeo6PMXzmTI0MF5S4OG6vsUMfh1mGtGH0fqAJ0rFnI0cST1wT2YP?=
 =?us-ascii?Q?ooqmIQmHXzpobF0RG/uDHZGuwwTRhHJodCFT4Q3jfRJvH2L5+jTOcv6derxY?=
 =?us-ascii?Q?dsYXP+4QUBpkAFwdJZH3/MU3erUgg4a6wzONcjq6dXvCZUuN3xm70NyyN9W8?=
 =?us-ascii?Q?upnCw/FTBWzpbk6BdGuYcW0bSDreGPbuZjiqZxO0b9NXKz+0EBoLEoD+i1S9?=
 =?us-ascii?Q?fBNr98+9QQCyJ1DAtBMutIaqCkpBzAL5OpF0Bu1OE9VzaexgKQDt45GWlgs3?=
 =?us-ascii?Q?v/iwLS+lRKwI3zQD+unjX0/3p0+ukv1eRD6kvtWyUIJM+TG3xj7iKju6W1+U?=
 =?us-ascii?Q?sra4MR023B3e4O5UFvTHSZbEetM+X6f37LNU5C2yQsOxQUMlqArxkflK3rlY?=
 =?us-ascii?Q?XeNAJdOdc6F5qAF9VbA26yH3kxKN9NSiNUx92X80bi+EfAwwkwRtSycv7m4Z?=
 =?us-ascii?Q?TvYKzXEs4awHGsCHKuEpEMjHPMHGjPBI1lxFR9Zbpd440U213HyQSOR2tH/P?=
 =?us-ascii?Q?hGDD6ZF8xhMSCTiMGupi7iOb1ANNyHPrvJ5te4yHwZsWo15gTUndzIlTmEKe?=
 =?us-ascii?Q?mLdxUbkW7/2SV7c6/8xdlq9KttetYzlZbYh8KL5Jni4FXe0KPUT+9nirHNZA?=
 =?us-ascii?Q?DXoiKh5qivU+Xt7RuC2Wh1rvLMp9eqL01RcI3CNScA8fAugviYVhsrtyIiJZ?=
 =?us-ascii?Q?vXqWCT2Bndr2wp7nsndAweUEsDo6K1mfxZ31hudyNt3eg6Y17+8k3VWwMOrY?=
 =?us-ascii?Q?Y7bTFlZl03hpUAm4mUSciWSkLbarPay875Y7UFfBOCArGRh+TSCXv5f5lF0D?=
 =?us-ascii?Q?98r0d9eYBIO+hoiwf53RoIwBFISR3LmHMvzrvrO+j9dmQS5PftIUCkfX9hjq?=
 =?us-ascii?Q?52Ri3E7WKpkLGFSf5sgLl2v1czJJ0VdCjHi0CpRyc+PEkML4aVdKBy1Fs+V7?=
 =?us-ascii?Q?LPyB9B6qHulZ2TfDVYdZvyI2ausC/k0phuf1nvfeY/lErJquldCtV4n1tfL8?=
 =?us-ascii?Q?+SsEiD6Tis8wsMKg8cOIcOf0VLZevbhGqwDDJIt2UPFRTjvmw4MYlSXEiJPE?=
 =?us-ascii?Q?Tn++v6KXBjDHy0hHHdfqVlp/BBQ9tXKDR8KXtW7Rey+hiLx7LHlVx4p/mRal?=
 =?us-ascii?Q?Rn+yeeaE/kHmcE6Z0ubriD8VfRjl+HImYGLFmoulaJrC/lo7Yz3gyB0Ixi6J?=
 =?us-ascii?Q?EqTKZaBc7tp42gp4NPrgqEKue09g179WYQ6BAqUrIE9X5rs38pSjeYofbiXr?=
 =?us-ascii?Q?hbifCiQpK6vO9fqTPuEzZv/M/H7OTsCqn03f9pOmkZzsL4nyjtNa/HJqvrB+?=
 =?us-ascii?Q?UL+bIog8K1KvpEn8SQr4weQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c37d009-aee9-4f98-4923-08dc8e68adf9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:59:02.7628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CeeV0aW6GH2xh06C3w+988UQVjRDgEfax6o8BKQIq8++twbDoJNcCjsZImUMB+Su79w+GsigMErXUed+2ZUfGD2EoT7KNXPGDZt5hGJkFOTmaUPhUsDsS+/pIwRzXKo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8560
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

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 9d550f5697fa8..e9683e613d520 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -275,7 +275,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 	 */
 	if (!parent) {
 		/*
-		 * Avoid warnings in of_graph_get_next_endpoint()
+		 * Avoid warnings in for_each_endpoint_of_node()
 		 * if the device doesn't have any graph connections
 		 */
 		if (!of_graph_is_present(node))
@@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 	}
 
 	/* Iterate through each output port to discover topology */
-	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
+	for_each_endpoint_of_node(parent, ep) {
 		/*
 		 * Legacy binding mixes input/output ports under the
 		 * same parent. So, skip the input ports if we are dealing
-- 
2.43.0

