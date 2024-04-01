Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A124C89366E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 02:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C076B10EC4F;
	Mon,  1 Apr 2024 00:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="p8quwl96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF6110EC4F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 00:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/sYn1xa9o1lp+hDwfD62SrVaQeJ4LnLUhefvm0hMAPOzZs6tqn9v5Bzda0PsLdJ/vMTuk+QMGfqjBrPHafiRspaYueV4zSTGtWQr3x9aEv2HdfqkeZ5OmOd4gXwK1VLSF8LilpiR0e40ka6mSlCvlxPVAdo4qZYuHTv9mN9Wtl01Kc0FThJEUeNOTgMt058GrRoFmo9qkG/2huo5oM2Qt29ZXLjbQys8ryliux2EchkWI0vVShoeQ3wcitW2d6eXL/cxywAb5MsTHHIABxReSnjweQRorCkFOE+wfYLc+JjwZW7qWf4oh15X8ApsL94UYMFvpvz1VJ4pzNngZapUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bbQqXVHzVGktvMbxdHS32qeD6T/q73gw92h0AbcRqI=;
 b=iAJkfOb5TWvNzvxH4cK1TLXtDWtKThWkgIntLfHGeV1AQjqlZDvYTlWEo6lyWmxBodHNy/l0UPxfHAWKY5tll1hfVLHVOfO/2SVq4s9qdy9DQGl5u4H2XUcZJyrNzUGZpqvsXHQ07Az29VXiKmc+jR+AhDxh4Ur9OG93KUwJALkS6Zn0BQqrcmeL5vZARCuzIVIY4Z9llfIyaBVtGfOYpyZ+fTXAI7z0Yq20qNCYE27zmR/7q5+3YV4TeiEU55a7jbtCo3+ohfFiy+Kf7KIFLyv0O9QHUVS0MB7VXAs1d2y0q/zdEpytW87u7d9qlNKjYRn5i0esXLXKXruNbiQwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bbQqXVHzVGktvMbxdHS32qeD6T/q73gw92h0AbcRqI=;
 b=p8quwl96SpT4pWYbMFKdGaD2aW/BHsQ340VG9W0saInJsCnHZEzA5YoYLQk2k43pfWYsLewGz7rqtDubV28CqQ41d3QmPgD/MjWiUcEkRZ9/9PSFHDXsb/jsDwFomIiyNVZGPbgMmd0zDCdJhtlrr34QHajJxtUn/H465VT7RwM=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7826.jpnprd01.prod.outlook.com
 (2603:1096:604:177::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:05:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:05:44 +0000
Message-ID: <87a5meueuf.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
References: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/8] hwtracing: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:05:44 +0000
X-ClientProxiedBy: TYCP286CA0180.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7826:EE_
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8CuP2xPC3JSitKax8y6OSBGdo/AFsaVNO+pa9bniysqDWI6gwhox9dgKoblnMd8W3Bm2XRadsusaJZCaq0gFWv7nBVhgpKr122NwDrDjRKbmtI/8mdNxqYZUA3HTHTVbLQyPDC+8N5U3UVK9J3nJZX5C0yU0wVpizn5DGttt5XCJZXnZTlY11T9Zit4/0gWHrBdtUs+lw/EfoTYmyXmkGpIXPnyiQUFdQKhv5g+tgW0auprOp7QcQvLFkVoAF/bulSdd3e6qsSd8kNBJ8oahuvGaPV4f83s+A1vEnHkdaYCMVIBQb85e60i4Us+ge9sca4mQ2rU7MQz37eLU6vDGjN/DKm40WxvbrVe1etvuJNyRWX0fOf4f6BTcMLxHm3eEAw4FM8yVhmkNm0m+UPQPrF7hlKX2Cr9kyMDHnFUCHFsn100K8MCRvTJJOxd8sjYw+8hEv3OdupcIBskQis3cUKFd+eky4ajINdNEn6+xxD8OtQ2cTwk147I5k1cjvqCBCTYWe01mkeRlHUR/ibSq6+ap+6hG0g5iIbDcUMrD98EOwXYYodQ7XWjToDwLigiwDVYj2TIdhrCsSIkscJboKXBXiQjXU89v2SBQ5OIfgcBQqT7mb3dha7wFgArB9nm6Pe8yejkfdJc08AakqauxGf7Qql1iw8G3Ic4oPTObORh794wNxMpb1lti7oA8c4ZD12XGArSFEKydL2d9Bni5YaoP5w0xcSHer99+fZOTba0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DshqatcAcmBb30YHToF/DocQE4M+miBR9K8GfvHSUMzN8UuR8YJzbz5R+zkV?=
 =?us-ascii?Q?qvMJYwax8wYMOT4ZblwOJ99G3sjOAdsnK+EdGGqEsK26t5tOaPsJJ9SrsMiO?=
 =?us-ascii?Q?pTMUWGliK0S+THwHzQ2Wl69/CW1k9AHACOyU6VcfXThJDe6CTjWMi4bEJyVO?=
 =?us-ascii?Q?//kMxMPPo1Z1FNFI9Cnlcdvly5Jmtw6sLQQtzJiAflvTxpnBp9vhnrhrZn5j?=
 =?us-ascii?Q?SQ9Ne2JuX4KZEB7Y74klARbVS5rVjJQhiFDhCCnUnYTwElOtcB21mdRY3hWr?=
 =?us-ascii?Q?8E/c76PExYq1AC2wo3TA7SJJ82q8fKiOtL5yO5BE56ZBxlXEpsoIsuT+07bp?=
 =?us-ascii?Q?G5R5ORium1AGCDSeNk/NDc0sXGIdZBawynbu4qI64nBvIERQKwN+yd/S5oXB?=
 =?us-ascii?Q?oWiYbDIlr1jfkZ00PMVklrTGPlYMpHReVJ1DKFs7GOEXM4wx8QgTKhVQ2n8i?=
 =?us-ascii?Q?zpt2iuyssk5u9GibFP3fwEKF8S5aqCwMly6K5d5pVvQS7w4HuI2FlD06LwdK?=
 =?us-ascii?Q?RJhv8GFKqRHodwVYIE4RF0vlrEICNbY+qKWdo1kvORBo4Kc0ycQQH83tSvL6?=
 =?us-ascii?Q?8o1ewAtUF+EAH3BO8jXGWFFqAZ3PR8FfIV9cdGBfPEw0vVXzGAbfVUxgZTC+?=
 =?us-ascii?Q?D5QSaAKQQ2fTMKmosJATv4oupHFPyPvEFn9gGpVVoJHm/FLToJzKRSs8cmIp?=
 =?us-ascii?Q?078HZWdSizuGByjNWbDSOgipQ/1haElIPqZKeEgb/pyAfZ5K5gCzz3tulJux?=
 =?us-ascii?Q?ajPzSFniIA2FJvzFxVxbznWmIOvK5Hh0pr8ubtdtLviYJPmLVVMPAoirQReO?=
 =?us-ascii?Q?Q0qH4rNAHEvzWndIJbAHFG1iIOI52fjLG7ifUZhKnOzSxGBwhIeli7auLM6Y?=
 =?us-ascii?Q?nXtPqP8mowi2IETSrcIMAkyv9ZrUbz4MRW5U+OtWLVcpvgAgRDTBIzFzRlKF?=
 =?us-ascii?Q?MA0nPnjgF19i14UI911f0rjdqYzq++1rYjPbP2ZCQEDu34V0D0l995xnb5ct?=
 =?us-ascii?Q?JiEA+D1SekkBr4CAolAAPqleiuxbm3ZnfX4EWhl1Otq5AKXTIyg1Inmod+0V?=
 =?us-ascii?Q?FcqzzsvDEV5m5kJ9HDaopSz3F6FIO0HSnx4RDppPJ+yqWyVl0NUVMMfpYS67?=
 =?us-ascii?Q?oqoiLxt75PueVj5k7xtBhsp1DiyF/cE/sySoPi0dXUEmZGhffR9f14dsB2Ar?=
 =?us-ascii?Q?S6panxJhqZDfee1Nxcb4owoSOoflcIT+A7BPfCBkqcWenAh/SApICDfjllje?=
 =?us-ascii?Q?HFQ6JQ8fboh1hUc+RBKnNNSZfppx+Rw91+hLFFr26rnnzXv5hW42KqK1P/uI?=
 =?us-ascii?Q?rZJymKfRow8Je/PTwovkTTCq3BtbCvVHtqbvAdrRsk5sefvQegCNQD+8lHkP?=
 =?us-ascii?Q?4kDzdjtc7EeYgTphymUIDkhjaEPtvvXyCy2520NzBtrJi6jtvvj3dgUOojpz?=
 =?us-ascii?Q?Wj2dssD7hDvySWIrocF47F6zrv10I06kKmHugsDBobsP1kBwElpqp0CihHpF?=
 =?us-ascii?Q?ltGLDaJCFFGB+R7oarpx0v4yxZUgThZWIm97jqdW1+D7l/cSl3cJnertqUl3?=
 =?us-ascii?Q?01M4MxqfQdYrllatdUo3Bjd/yP8NwSSZxxNQSil/GeI7kIzNGApd/O5TuRtr?=
 =?us-ascii?Q?NJNDWjgLS6bQXixLvC1FjrY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b86dab-1369-4e39-d494-08dc51df7a0e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:05:44.8464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EY0Guv0/G89AZOxsGaijSuAUUuZXVnJ1gJJDyrOwQD7IEHYntdJy74AqTRy8yK83RtR89h9g8zmOF0NP/wnd+aB7eYDva7NqksWJey/hbwpWRq252bEmI3nCu3ui1F+3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7826
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

