Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08648889D6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 04:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B9410E53C;
	Mon, 25 Mar 2024 03:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="RlwiPfR0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2057.outbound.protection.outlook.com [40.107.113.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D134F10E527
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:05:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUA/e9WTrbsbMW05CCNlnYBoP9yZQZpaGHmxl3Bps1OQAbm6Dzqe/L4ax/jmcBPSpyTqArYr4R0IxXfRruWfInER9sY9TY6qdZaIrLM5C1mHu16yqh+kyc4ZtVMFmjn/obMbucvFoptFRlzOeFe0K9WSUMyTxY7jSwVj+NEfmX5lb/JyQk+L++jxZ6EcAOLhCd3y6hdGUD6RVbDdDXCTt8OWkbQqp1kJdyFqRa9Uy56fseH9s3vZchjiV5dnGn0oYhXpFKih5DBFarAVl2o4UHTXcAxZ4eRjLFKfWc3/uE+0lZig0Zo59BTRMWDsslB/cW65MRfSMf2CwH9yDtVtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bbQqXVHzVGktvMbxdHS32qeD6T/q73gw92h0AbcRqI=;
 b=aUVSV9O0BvOIlf5NwBXOmROxCsnIfDr1KXx9O5h3cIpnJVJ6BrSX8QV2aZgTj4xKTywOjM94DjQzvF2sER3Aew/swZuVoS+T/mIT+D4ZnR+gRFB6sFWBaeNLkzV6ZpkRAJBbdJHF23wO06yFfW9K5d0RxEIwCNBcQVSPqiBwSBXJgtpddGloanYtkHRgnxQ2kZJ8SEVbhqKLikywLa3m+66aQY11gml9dVVfV4oEFyGyFgSc+5DQjNSvMjcXsS52fD3WYmf5w/E8XrUgvwJSRxoQ5TjPwzWLbyRawMgtUnSeMNdAZ+1FjLpvAdKTQC3Eqmk3s72GZqSi5cUfrkvCNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bbQqXVHzVGktvMbxdHS32qeD6T/q73gw92h0AbcRqI=;
 b=RlwiPfR0K1fk+OlDwPC637UNVOb4gcyUfhPOhHJcHJwXK9dLRia6JaTzBMxxvLmH4vsPKqY/f8UUylejJtl5w8/b75D/0Y/YaF9puBzbOEolWoTGf8eJIqlHq+WbGY1uT23aUjTB1Eo5w9kfkyFDXuupU3xsHocHHyA34cpCAx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6966.jpnprd01.prod.outlook.com
 (2603:1096:604:12d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 03:05:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 03:05:16 +0000
Message-ID: <87zfun57v8.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
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
 linux-staging@lists.linux.dev
In-Reply-To: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
References: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/8] hwtracing: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 03:05:15 +0000
X-ClientProxiedBy: TYCP301CA0068.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a55b77-2e65-40d6-e4f1-08dc4c786550
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDxrdGGZGxhrOfBhmSub+1Ko1ThA/ZnaNfXgNMmVlHBAmbBUARxFnvMKZI6RuQTqe+Xki5jjlRCPLzWQlCWtUkgFfecLLEzmTGwouXBQjN+iQf50Ha0MqpuBImq871x2qVmQRcjvtnoYFyh1qxesc+C6giaVi/Sq5S4MYd9XQPrAv3QAfwl9tAkI9NKXDjTnf1brcZ+PhA10dSVe4euyZihMs0MDDisSQUmXDjKfs2qWPsHe/Y+DdkXvyz0YIs+RRG8TNgjHWWGnX9t0qWRPZ+7vUPGP1IhPGkMeUEfrMyMAG1dVeClmmHcE7gSOXmoClC7Hz8yf/tOo2gxcK5LQm+e+mrNxD1Fp4hFnIe4fV+RtzBZWpHeMcjsd4xGjXkHK3JdV4rlc/RvRn/pbN8Hkj3BP3fyqhHv/QwkzYJq1wcJai9hf8cBrA9b4W3UiH7HQzSxgG8tnoAw6Y1qHPykNpnkyCCAX9u/nXaZ2ipNkfMCZnOag0g69PUUvZiOqrRc16L1FA1OFFJXZKeMb/ptbYp5X9JbtlmlUnbUisZNZq9o8T3h4TRL9y8K7JM4zjqhqekvFsr9mZKGVqccOrwvAklBt3Ebrtj/ZnOr00GaDLzr/L2Ksl0NkiTqtHpvJD5A4PVHz0g9OkZ8Zswj2uc0pW+75ZDOEl47AW31OMZ9+Y/euQLcyKFy5Tk8yFU1EElQ4iMDXKK5uVgdOaJSIIf9Vj3zyN8nBHpzrl0UXPXjr6x8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(366007)(376005)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TuD39Egpir1QeNBaHckNjVFGQxtWqHq2BoTh6vPt0HtnDUrYYQGzLqwKUALN?=
 =?us-ascii?Q?HqeCOPB39UGk47ByV5zuLQF4kTZS2LIY49iOk9Y+6cmlT4eiZWY1ydGr6HYu?=
 =?us-ascii?Q?ZpiApvWFNICrWVnNUfBSeQS6zOCEu3+zDXsxn54T74eetd0muibl1aVPOd0w?=
 =?us-ascii?Q?YPFh6LiFvufJytcNtefMYSVSZlTZ/lCvjQtcNlzD5p6zGmQBwwYYDWAfuse2?=
 =?us-ascii?Q?JjTtni7FLIg5ry5hezOXYnh+Z/uUm1YNZpC/tHGzOrg2zvlcR0ZmAqlbNb9a?=
 =?us-ascii?Q?A0OsZBAbhYsQiQY8LMvjseCOLzdp4oU8llRHLJVk7cJMJaNuE/MfjStpLcI7?=
 =?us-ascii?Q?JxyrGos/61cV3JeB7EXdTGLJRirgaoSUOjbyfGLXhK7YpRFP8pr1gW2f/VBM?=
 =?us-ascii?Q?BxPUwCCzPg3QtjpuHgw3ZOYcit+mK6pKvSGHhmxse7go3yMwA85idYSkMsXr?=
 =?us-ascii?Q?8SqJr7fm/cQNlaeBqG9B43JTCumsi634slG9T42q7izvpyCCLA2LjHrcYafQ?=
 =?us-ascii?Q?v/nH8FLxD9ly4EWnNCj0sEbgYJ7mmSjTupAdC9buPK9oEOHejmPxkT0USlsr?=
 =?us-ascii?Q?oXdBrvsSZnwvQP8j24wob9SrRKLR2r/2qWqyk3LlSkOO+BUMpGyQ5vrJuVjQ?=
 =?us-ascii?Q?Q6tu5vKLvcdIxRPB3sTO+L8Fowb119OyG65q6Bnl4q6FapFonvP0pp628O9m?=
 =?us-ascii?Q?9vbxug8dlmKFz2K5t6ZKOe85D0SqEYfp6oGp/aCERTW7/yRyTRFg1NCjGbI4?=
 =?us-ascii?Q?gmemMTnbETvYJyv2VqID9Azfky6zMiNt7sh8i86KmUIrYWl7/q/dKZzyueT1?=
 =?us-ascii?Q?Q9Br63/HEBIJ2kN2Wloh7/fNmdOZYwVcdCnhEA7pWKfzDozgZ/M+AA/o6dSU?=
 =?us-ascii?Q?oUAnx02zS1y1vBq4d3tu5GcWvC6FIXo0iAOKEJ9loWwhaUmiOQuXyNGvSvoE?=
 =?us-ascii?Q?fjiRX+FmmzrViXGWAH6X/MnjISmgwM2Tfmum41l/59qkgoncPqncCozKzixZ?=
 =?us-ascii?Q?ejx3X3d7XxLfozJDA2/aG1LX36MPHBARWBCFU5D22B1aEpB0P/KoivKGbgCJ?=
 =?us-ascii?Q?K0QFWgdfH9r6PgMBzAsonJbYTHY/1KxPdf9VxyQaUHXds5Cpl34hn05JMXuI?=
 =?us-ascii?Q?VPdWe5hlCVRrJbCSzx8qx93Z7a3W4CCBVYaW+0o9Zvi5jBOR/8LL/hIxDVHB?=
 =?us-ascii?Q?9unBxz96oJmVy3bBIxkgJj87LMX53Sk2O1pConfg7gLYh764LfE2wEPUp7pG?=
 =?us-ascii?Q?0MxFi0Txb2rua1DGx6ULAibTiBGzPNZnxo/D9prftQm6+IOKF2XftDOL7oO3?=
 =?us-ascii?Q?/hDwf9nyYbEQiL0Vk4MffQQKjKS4woFrOU0gfLmTB8rgUSExVLIfnjb/8QPU?=
 =?us-ascii?Q?zFTCnJInAQZ/9hcG/VT2MBoMRhGrjg4oEHNT3jy4y8NJhfC91V2xX6pTY84E?=
 =?us-ascii?Q?gvxFw72nkEZAt8reRhmSpyj94yl4l9EzhernKvtb42ZhilDYTeYcgOKdopHR?=
 =?us-ascii?Q?db6TGDKHes4lNfSaNpthM7mOwv+y45SZBTb4XRk/VArVCFN9cJ8pT40HP4cd?=
 =?us-ascii?Q?ujmUVyx2e8fN/ueMo/m7y0XCUNfTMeN0lFEthP9vlP9O3kQO3vCsf8eaILOH?=
 =?us-ascii?Q?9FK6/KHNLGrhoeS7Y2xAbVI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a55b77-2e65-40d6-e4f1-08dc4c786550
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 03:05:16.0403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJ0MsNKF8QKJbxghPCYcrUx2UGtHQk2Tw37JB2Kpy9yyDlF8Oz/kyJaA85mXzifbMRA13rH4HiJran8PvWGhDTzKL+A/t+eTG8pVyKzuoSnFjyZZUakaHvscg7TymtJt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6966
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
---
 drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 9d550f5697fa..e9683e613d52 100644
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
2.25.1

