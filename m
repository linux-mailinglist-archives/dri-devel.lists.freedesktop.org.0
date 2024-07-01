Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F77791D61D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 04:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5F510E280;
	Mon,  1 Jul 2024 02:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="PJn9yCj6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7FC10E280
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 02:32:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/vNI27WLfZ+Kkcz1GNgpsxBMC8F/G97qZG3qTd+cR8gOolooqMJLwmml6kpmXj8cyA8xGRLhRYRikVx6wmFjbPb7UMA7QiAXYBZPTS2swCdx/edJrwhrCS4pYaTulwCPh39zwlEH1OBpZvC4iDI7LLiiUFplPPHr1LOQX63Nmcc6vnhQekPG6Xkh7p8iDUzsZUb7jL6CjuGvMZ9f1hvPPW5t/R0gzjv3u6s+Ydm5wzEu2uVaXoarEGZakBRrjP/+995YS6xAwl+getU/PIO3UANqh19+DdxMQSUvAGiFsPqYv1FeoFOvpc0ajHwHpP0Zp0b3MWJOv0NmvZzVVZRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qQYdnzwgiJpwqNy4G9/w3ekIk9sqx4o5YOeurQuIcM=;
 b=A29TMtZZHEFaO1qX4sxXrUmMgTNzc24IB/FMsxcHHxFpkVnd57VBq6b5GiX/3Xhskx2Jo4gi8N/PniD2rojyYjCHAFPrDzqqkX7TsPn117jsxHtAhPG+VcSfGFGPPL0/l+I2ADa0ftQISWg/tCtW8vUgLSyG80jtpzRslHjI+XOok1IoAAyq1TCVqwtbly0fWoYVtdD9PMH8WfHLQ6YdzfMOy1hxXaeX382Jy6WJ8knTm/l/qFqiYQYwWONz3vJGcyZGwvmPQ8UHILYS8ODtKyCa3HCvR0OU/3PRFV7Udlrjsxt2GVu/bQf2Rto+mjUj/OwzFmPzbOYfF82qvAsCmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qQYdnzwgiJpwqNy4G9/w3ekIk9sqx4o5YOeurQuIcM=;
 b=PJn9yCj6VKFrYrkh9ZLZzCXkKwqu/ayld82P/DcTKd1Bp4Y4p/dVp1GnVxrjNHrROlpDMCdHvKiI9GnhGwsu/GJWL9I3DJVJl2hYt1MEM3vU+zuSNtv1p7PXFpCQ//KfQefeL/XYmNMdwzBLpgSToc1sYed2mMd6+T9PtxScR4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9627.jpnprd01.prod.outlook.com
 (2603:1096:400:193::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 02:32:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 02:32:28 +0000
Message-ID: <87a5j1970j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 2/7] gpu: drm: use for_each_endpoint_of_node()
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
In-Reply-To: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
References: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Jul 2024 02:32:28 +0000
X-ClientProxiedBy: TY2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:404:a6::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 016432cc-ffb5-41f7-c588-08dc99760d3e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DGlB2Z5dy/F5TDMFr3wQq6UOoRJdAYDq4iB0VWumF/Vk7JIq9J1piDwk9UqI?=
 =?us-ascii?Q?//apQYD/nFvi73/tGLCWt3iiTXE3ttu2hVpJeTE3Ra/Mc5rS9Gag+/b6BMsa?=
 =?us-ascii?Q?xx3xitsZqIv44eCGMAJSADAhhKrTNFWwX60a8Dw9C1y4yUhOFOOcdQaRuemb?=
 =?us-ascii?Q?AgulVvaZ+pkhTCPwftsoltWCLamUxyhE6f+lAddzuISPd9FEmEHyL7vczb31?=
 =?us-ascii?Q?Y4tb/rZLsK7myjFtLEq4aNZs9VC7t/Te/0zw3MWATfqYGBRasPofPPCYuGRR?=
 =?us-ascii?Q?44hmQ/A+0JjOFYQz5rNWJ9M52wJ0ObKZQ9CvUpS0Fg1iXlOqj7X28D+5H5Yx?=
 =?us-ascii?Q?v2HLfzA9VnY3ozSklIj6Gz2EV1lC1REYF9GDDVWCBT9IGrjbfDSm1pxsU/gF?=
 =?us-ascii?Q?8Ku+bS41VScDYArYZmlktvB0wrPfCee2GXwfTYtpE9+8JZgCHNRvilZvYVnu?=
 =?us-ascii?Q?BT4eNkowNVvnvSi5T2kkxKJyX94QGL9Gp1w4TLDY0wXT8+o7X0B/ZK+Un0wc?=
 =?us-ascii?Q?Knw2P1p6/TTI4Dd9n1EizrpNgNZ94nsEJfWrGu/s98yu2kr+3NTyY4mzGzGg?=
 =?us-ascii?Q?hf53mcJjPfiTLzZZdifi5zwrUuuxWJyxa18FO7YEyjAnyOx7eAFKw1+gWsaK?=
 =?us-ascii?Q?7RXBrSvt2MkmLAB5vOldEHk40SEx59rrkL+6+us19umP8GuOKene+s6b5tZ5?=
 =?us-ascii?Q?+dCCBizDhqbkaJwbiKB5MrQ83/RiM3xDgJP0hhCqmheFLPz37I88tPMIgAIg?=
 =?us-ascii?Q?jkDpfmoeMT+16jBmUpmN+M7kbmbzsuSQUY66OheHjFFsI6a8QPpYzgj6v2Ub?=
 =?us-ascii?Q?PC/ynJ8MQUMUlHcvhN/WNicdG0Si7WL+JtWN2EU1tMF0OQr4Qi+yfjDmGD2l?=
 =?us-ascii?Q?nRW+z+JcRDEpZ68YFCWKjv5bg4ldi8O0u10JMkYq4xDN3Ms5ni3U0hHZGCzV?=
 =?us-ascii?Q?u76PMmz7rYM+WPSbIJKnxB/XMKgnM+zWogsFGUPM2i8C5OQ15frDFrPUBcJM?=
 =?us-ascii?Q?QLjQhko+zXh3Peh9q4LAXVVwyViD4Ozfymgb+Qa9SYaOwFxfPEjITZP+cCSH?=
 =?us-ascii?Q?XAjEYS9MMomnt8zxMUyiuw8qIHlyQ8/J5kwdzJ0XQY266xLU3mJ+9KcKFUCL?=
 =?us-ascii?Q?WxKjy0YzOnNTc20IcNZeJ3jeJEAOeXKX24FZFbjxwJz0kFNKsVzngYZVSKv1?=
 =?us-ascii?Q?Qc93RnQ0VQB6vs9quXBcovNZvlamG7UW6bcbQTt1rCRHxyHp2ZvnfoeIdR3x?=
 =?us-ascii?Q?UXzzy+mBmQtRxzflYCPugIC7/cbuIfYvnMJyc0d3FHkJib+ovc4yocxa/FfW?=
 =?us-ascii?Q?4WtIThPtCGWP37ASVR2FCpiC6uVUaKExDAeBa5ix5yDV9KkDicC0nkllZRJq?=
 =?us-ascii?Q?aZdkbE5H6KrXKrgbkTp+WDTIA0FLyYgLsYzti3sWXYihYIg5jFHbhofumFKK?=
 =?us-ascii?Q?QVXDERW4Jlc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SZEAeq87b6UMmxlkQ2+fLKFdeznc9q5MFAKDfRoZz64axSUdoIG76wWEBqkB?=
 =?us-ascii?Q?u2FDevHf6Lltl8ZfqeSb/uNZ1vNOY4zdnAMHyJa/89YFMdWbaDZ5y/VIl2D1?=
 =?us-ascii?Q?C5E+zpNqlSSnUXetsX0mSyA7HtH2cYHBiBqVemCRcGaOUyAu3nyI+MrQZX6H?=
 =?us-ascii?Q?AcYl0t1m7bSW5uHGIHIAQr9xI4VIDMYeZNaHJPOyqG97bexf3+JH9YxI5kwY?=
 =?us-ascii?Q?yzIcD610NaZouc78M401S8/j5qQqQJ6ciaCX+v+NdzB3QNQ8NI3YOuPpM3Af?=
 =?us-ascii?Q?614IwIr2nsQELAZCH/UNoJ+3hfoyeHAGmBk68AG0w77hWS3qLOggqg9ac5R8?=
 =?us-ascii?Q?BwuDg40s99HMnDngqVlQkjxRKRkbesI3mba4mz2XeWQwiCWjzH4RBG1l388/?=
 =?us-ascii?Q?7CSyKsNVvMwGd2BWAIkouLuXvt4S0+wzQX44/z+J5LM/mOqGMlgX5D3Ii8w8?=
 =?us-ascii?Q?BQGOyV8ZspDIff+2WyzAYhy8S8E8CFc22MODHX06bIVmBmCuka0VaM/643Fg?=
 =?us-ascii?Q?7lejUc11aGnQRHlZocr3MYjCtj0ehzc4vjn+AfRSxyxAe9czaQFY/4DpjT8Y?=
 =?us-ascii?Q?/lxxoNzhsM03lwtt++PehUGvyEGKV41lyo/T+SQaQL9l5DgwaFQzlj9cnTgX?=
 =?us-ascii?Q?Omz1015sZ1iH+KfD8639AXSIz9ZKX/IEtnciAradALfRIXHzEymserPcsGZ0?=
 =?us-ascii?Q?a4P+bton8jJPcOOGdRE3eST+N9HmixaPNmx2xGcr7sXytPdj0Fk5wKY6uOSB?=
 =?us-ascii?Q?EZyIAevMQgPVXtJAH/03JJW9TUOByWnYQPUgbMnxioeNVe7ot+8V/kU5ifUW?=
 =?us-ascii?Q?2eati4MJeCVeiFGX3y9N3aBX12XfAw06Nj+oxZ16mHQ+QhLCneYOMwZFFlFR?=
 =?us-ascii?Q?SrlEWBnjNvE11awFIjk232brlhBGk3qUIRuJ0aB1uMXBpJIJLCwrtIid1+bo?=
 =?us-ascii?Q?rnW+MVVW8vpWP/2ZHSNMAr1HRXliX/O9HNCMuNjCdSZIAsMpHAnbs7D4fukB?=
 =?us-ascii?Q?+M/mXLPogSxZBOLl0eH3iqx2LkBczzaj3DL4VmdWN91B6U4kaolwB6IVbEFD?=
 =?us-ascii?Q?A/z6i36DdD8dZFEetoyyYAv8N5HfPobCSnwuLQ1HdcSqMLqPGXmVsRmNDg5a?=
 =?us-ascii?Q?3TRHgmG4cQsCoMvCJLuHF3mojLeIb8V4tGD3b42JLhrTZNj/A3ZHhvbYxfm6?=
 =?us-ascii?Q?ki2bJhwIByG+TotahQ8DD68zRzES2VOwUD+KBq/XwY6fQ8dS55OpEaopRVEb?=
 =?us-ascii?Q?dgGVO3SpYEZ/RQrrqAXj7FOvKQG+nqS09GYphcvptHD2Zvn/U0TZ578st3N7?=
 =?us-ascii?Q?oZ8/jZj7pcPzqED6DdmeLEo6v9jgiN7HRIlpR7W26BczKvakJQ851HZONmnN?=
 =?us-ascii?Q?iXHBxDmq4cLrTDU4GPEtxyGm54ToSHPH4t6G3x7sdwGXeWsdjom8zD3848qz?=
 =?us-ascii?Q?2Y779IqfrDQ04UZDmi9BtgelGShyzo8r4Oo/qvRPEpErgqJx1Z7Sr4d7DXx6?=
 =?us-ascii?Q?iqE2vf9IeYRRdSx+X3G7RYLT55p7S7j1x2OeFsP1c8TG6GbI465pMXEX2x29?=
 =?us-ascii?Q?cGcKhtcDDOmqCzUqgFc/9Mo4nCFMKxs6k+FgV9l3Jfn8GVoaeuWoidx98aft?=
 =?us-ascii?Q?uxvnGxK/RRswrwk8QwL7OcQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016432cc-ffb5-41f7-c588-08dc99760d3e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 02:32:28.8736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOikd2MRU6dQEHNHvwk4MKhzLIgCdpl7WPC2RcAI60Jyx6A4H7UfDc3dQoWetHeVkCktqXYBTwArusI4whw4TXfxz7hmw6EA6lK/SaOXXxN/DDmIZ3+IMq4kIKJI0G2c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9627
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
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 050ca7eafac5..5f8002f6bb7a 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -242,8 +242,7 @@ static void omapdss_walk_device(struct device *dev, struct device_node *node,
 
 	of_node_put(n);
 
-	n = NULL;
-	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
+	for_each_endpoint_of_node(node, n) {
 		struct device_node *pn = of_graph_get_remote_port_parent(n);
 
 		if (!pn)
-- 
2.43.0

