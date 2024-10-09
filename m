Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A784995D3C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 03:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF7410E626;
	Wed,  9 Oct 2024 01:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="RnCCnrk1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B356310E626
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 01:45:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s91hgBe9Ja1fsry+HELBkDcfUxXmD0U2N5gnqSfd05+Cx+VQ97K5YuWbORZYAkMf+bC/77+HL6aDKKQi+xeYliG4cqz1AIrtJNXqsQlHy/7Foiefs8h2n13vRay96Ce8o8rV1qwVy9QF3KDg/Zzx0vGMOnvDxBqgDIg0G7imPzmhQXNnNQrinYoFFQdZmXL4NQ2j6UvZUImAOerllzNMbGRRyLEa/M8TT5++EdwVM99nZoHkqqkTFsXaxk/imRwPjjd+X2BItuQhdxTQMeidUWgCGJEF/PiNa5+uC5J2BurfUQbU0V/wZtYmUcaDT8zJ0g3fHfZw9HFkfO2zvn09vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCQYjzRlD/dbDOC/L/E60JZMKdrk9KVawhDDbuptk7I=;
 b=JniGmn5xJfVccJ5GJK8PMVef3cDCKC4Y5CAvd1Y2NrEyuw8z4Q5Eot/Rm7GurKwYiZZ3KPoV0ElJY9BGD20e6z/t5DsnmRHLkSkXe/RCUishUsIacZWODdWY5HB8OW1TU0kVFduB1vevPigpKjMiWu5YCx3YfWcQ2NwDRPoiEOjjrL7+9Jj7NVR+P77T+dNzd0DSCRXxM+aQNp8aWveB6ci6R8ROxem3NsHhkSl/06+WRB/dgLA0ReN63amRoMJlfXwchLuTNTV67UVdDnswFuJlqSyL9ptJynMAc+e3/1u+nnbRpY5JJthME3o63rMiRvdVFqAiFakeW2FCZyRGXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCQYjzRlD/dbDOC/L/E60JZMKdrk9KVawhDDbuptk7I=;
 b=RnCCnrk12Pmp7WnmZYQRBUoDjaMGsNJ0afm6imSoUQn/UQVkweedWybeoFG0+UF5wO5v4KZBUVSB/OhZAdul4i/aNsDPzdgtaKGtYaZ0mEXjYf51rUCxFMgB84W4VmbQ36nXQrI8G8aWbxor1TUJdk1qJ0X4Bat9/424MuERTlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11140.jpnprd01.prod.outlook.com
 (2603:1096:400:3df::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 01:45:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 01:45:06 +0000
Message-ID: <87set6rqvx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 3/9] of: property: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
In-Reply-To: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Oct 2024 01:45:06 +0000
X-ClientProxiedBy: TYCP301CA0021.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11140:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d922865-a54c-4c59-6bc0-08dce804006f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+3FhqUvMHxYXeQEYoMGBwp39L5a78xCwnvbFyHI9FuFi6Lcs/U+Vnchhibc/?=
 =?us-ascii?Q?ypGwpm/QSzML+Acd3kheB1cqimBOnPeBmEVkgawnkNNGiVPUleQ606VqBtND?=
 =?us-ascii?Q?Tz25Mn2RimYmndi68RxYISpWYC9AwiEPiPvlGru4Kzprlb+iMJQsS9cEgXq+?=
 =?us-ascii?Q?u7+NhflA8LouCDebt9o4V1v1Lq0nqxhSZAI7jcTMI8PdwYa4s/jukGNl8gR6?=
 =?us-ascii?Q?KOs0VyquqtDrUYuvvJHS6rh4IFQqc7B6omzliueVUgCox2Ag1QZbtqMKUnEv?=
 =?us-ascii?Q?s9MRdajE2v9vfC97fB6G8dfNHcIxMeoD+I1piIJk3ij9NSjWQXy3LtMxaO13?=
 =?us-ascii?Q?cSt1QiVA52YY2RAIRoyJjIeP/eScVTMuKFQgpyPFmi0qkKoQ8hvIhhWvrDfM?=
 =?us-ascii?Q?+HvoY7QxejPh3rK5eIV7jVeLEKZMmRdB7pnxdhkVT6j6NNF61Vakh8LCR2oH?=
 =?us-ascii?Q?ana7ty3oEQBqitSX+fLNcoOCcM+2ENFSTNNdlHEIXZNcnFYJyTOkWVGDENPg?=
 =?us-ascii?Q?bzQRiY17sJLb9Z//4/N/Ld8/aaB+6CkuYjKU83jbr0ZdG0X95fDMSSwyDkdK?=
 =?us-ascii?Q?7Uij58aeRXd+wnd1U/L3nS6nVmlf1/FeVxQ8RNfsGtGFp5EO47/GzeBSwejy?=
 =?us-ascii?Q?dpm0m/8+5eAYex/35wFj1kF+nNuIpYkG1BH1bO4axe8o9VHTNRlBc2owQaSJ?=
 =?us-ascii?Q?aQHeLaP8606vryzta0UhSKQOX4yu+fxz9iM7dummJ3yrjglwOcebmBdypnzD?=
 =?us-ascii?Q?Rv7NkS+RRFLEUTp+Uq0IslrZIfLbQAcT5RzbDaH9t3iBLb//Y6G1MqfW+tpG?=
 =?us-ascii?Q?EiqKUQHR+sojONYp4vn/ZBh349njF0yTL/D82C08ZihLpHIm8Sy4wq9amf7s?=
 =?us-ascii?Q?lZGpuXE79kH7LM6LNe78LTWcIejEFJSOkqGWqiVu+Fe7J+QtYvkdtBRN6UMW?=
 =?us-ascii?Q?ITVR0+qFVT+HBYwdKUNq0nlAIclSzUZsRBgfbkFgsG3+i3pil5MVFsa5mH5x?=
 =?us-ascii?Q?vKT41KrlLVaLYRiCs/NsIgd0Da6ahjwV1FgZAfcXj2dF4KWDhQMx2/ztlWZ0?=
 =?us-ascii?Q?SqemskpMtD5zpSVGaFNc0ir5KCgoq2frT6WJU0UIOAsnRRddPYLVxzx2JP3f?=
 =?us-ascii?Q?zwKJ+PoVHh65lcdn2+UY/hG0oRuqDkrXhMLb0c/Gl8upsx7cEMYdSf12exBE?=
 =?us-ascii?Q?UY4oGuOHV9aKsr8wedSGn9t7OopwhD3OMYTJFJGE8AgArVkf7/UAES33SnVf?=
 =?us-ascii?Q?lf3bRxtdYc7UHwU5dJ9itSjHkc8htaPldpP+R0lRmLg2L/K0XRr4GYg4s84C?=
 =?us-ascii?Q?4ix5v5V3Dj7KzQpdBfvaAKj+PtfUwGN5euf1mOqxtq9tww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?srOYJAy0XwBNEaYL8mOBAa0wcpwQKNVcmybX4HiA0nvNaD3lY9D/h0km/u/D?=
 =?us-ascii?Q?BOdvWTjfld/hK2rf2euOhJV6FgNgjlKcrLzKBR3mfqDlLf6dJhfWiJ/VMu7g?=
 =?us-ascii?Q?EtiFF8a+YQzPjovLTtKeCac5+BUgHiyHtdj9WJpFXPciIBWwA88tRQ3rhMlr?=
 =?us-ascii?Q?vSRB73QkDtmduL8Fb+b1Wi6+KC8D4VKYa80IUDvb/TNh5oBGujrqgPBMOU8n?=
 =?us-ascii?Q?FQazgmXGNOtK37mvAbanOjz1uqSx75Rjh+l2D3YxIyIDIFdUrzkTveZpAY57?=
 =?us-ascii?Q?p+YiU7uTH9WVsXRSd8B7YJX8s0tYUahOcnm8xCOmkHegICR8Qyhb34hMaNNH?=
 =?us-ascii?Q?nYDFKfzuc0/yuVqxs61IGI6X8LxR1JWniAC/Ne8X2Z9DkyL4Ieu+7+Lbg2Do?=
 =?us-ascii?Q?cEjlxd/jYDUCxGZRcb1GGPIaBXFvx13yVxedpS3Okrzd85xSLOAaGrWJbfMe?=
 =?us-ascii?Q?svajhHzC/PECO0cZJ5S++IIP74hEcSikR5t1W0BKrfOB7QEDR/bUk1Zq/dy9?=
 =?us-ascii?Q?StYHS86+SjqT0idAPz0o9T3jvw50Hv9knU/ZAPzwLQZdBG9ZBsMSIxKbzItL?=
 =?us-ascii?Q?xrMR5JG3tHbVN1ynH4yIzpcggSm5DRJen7gTDxWo+t3cuhDuiyMVsYEZnQ/T?=
 =?us-ascii?Q?Ze+YlRBBTcICWh8kOWO6nnwQjgomK17BC8pHvXm9ZUJ5HRokKvOR1B1RImh0?=
 =?us-ascii?Q?j4eREu4aZkix9gun6cSJsFhMyCzJggyoE13rkmBmq4TsUWwV0VMoEVoEdLvl?=
 =?us-ascii?Q?spZOXpvIYqqlKEmOnSBILQpWQLrfgooNIdPNtbEsxVu/fusTqH49RsC8QnfL?=
 =?us-ascii?Q?tqIMoypi7MIJ69IUTpiCvgNQobdskz4r+gso3qhA7UmuCdnx9W0wlHeULw3g?=
 =?us-ascii?Q?+fdxO7fZOif9w/ATgkPhVj11Tfw4kt9EPzL5BH3w6pYB0CYQH3SwrVWiAx9Z?=
 =?us-ascii?Q?IFqW0KxZ0T5o21qJzruApB5NAut/M7hErmSGl5JSKXDWmtFfrnKjQaWjXuJ1?=
 =?us-ascii?Q?kWUEnHhTwIWyoH/2SMGpk55MSnJAxH0fZZfhMwALYgUbkPz6nH32anzVe2ai?=
 =?us-ascii?Q?lyQ/D0k5BTmBgtU2bcArZAf3PT6rXGwsc+Q2LIuiUanCfuSaWEGIbP2NDJf+?=
 =?us-ascii?Q?won7mz2/Sgy/fGrAXl+Gejo/nQqhgAEIGFICt4KCTfUvB71aajxfdSHy2aHG?=
 =?us-ascii?Q?6ZnroEYEXmzuM/DDScSXM1AASapz7np+P+shNFi5Eko1oBhD48318jeqkkDX?=
 =?us-ascii?Q?SB3pPt3ycc+jKLhi6AMKyyafJshG3CCLwRFLYBopLHKm/mCSp+JwQxvtFHKi?=
 =?us-ascii?Q?WoOo7GXoBk/GkoBCVpWTmDck/BLbgMXJU/MN9R7HneP3Suk61C840/EfJR3t?=
 =?us-ascii?Q?ELd54na+V3YZ3UjR2wrcPwyOoSLqdIZWP+zHlWk7SxHeAsW/4TbK54dOxeFk?=
 =?us-ascii?Q?HZY2IUqF6E7M6EVjmQoSul11xmDnW4gJIV/TLYqmuqT4cSWwdjpYjeCOzn/P?=
 =?us-ascii?Q?wygM4Y758nDViJK0qGEIbZec2YFupwFlrxyH8TVJoDODh4PNEnccb6oRORlb?=
 =?us-ascii?Q?0F5XO3Km1f+f4lEbxQbpNchnj3Df+v39xEWVKHT1tIuTfhA7CJgJEvnKJI6F?=
 =?us-ascii?Q?zapLMpPVAqXieOpyqpT+bxI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d922865-a54c-4c59-6bc0-08dce804006f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:45:06.5464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAztUCgX2rMa4jlSXipgsH9xVxEXea6PbJHPCF3r8nn4G8y9mn0To1KJsFg7Y8NB0V6CSgZN1FnK0y74juBsU/kAFmopGP8zGOrqtUqSBk0++AVgCAeZ8Q6GC5ECpusE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11140
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

Current of_graph_get_next_endpoint() can be replaced by using
new of_graph_get_next_port().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index bf15bed69e6a..7c1a8f36e314 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -717,13 +717,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 	 * parent port node.
 	 */
 	if (!prev) {
-		struct device_node *node __free(device_node) =
-			of_get_child_by_name(parent, "ports");
-
-		if (node)
-			parent = node;
-
-		port = of_get_child_by_name(parent, "port");
+		port = of_graph_get_next_port(parent, NULL);
 		if (!port) {
 			pr_debug("graph: no port node found in %pOF\n", parent);
 			return NULL;
@@ -741,7 +735,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 		 * getting the next child. If the previous endpoint is NULL this
 		 * will return the first child.
 		 */
-		endpoint = of_get_next_child(port, prev);
+		endpoint = of_graph_get_next_port_endpoint(port, prev);
 		if (endpoint) {
 			of_node_put(port);
 			return endpoint;
@@ -750,11 +744,9 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 		/* No more endpoints under this port, try the next one. */
 		prev = NULL;
 
-		do {
-			port = of_get_next_child(parent, port);
-			if (!port)
-				return NULL;
-		} while (!of_node_name_eq(port, "port"));
+		port = of_graph_get_next_port(parent, port);
+		if (!port)
+			return NULL;
 	}
 }
 EXPORT_SYMBOL(of_graph_get_next_endpoint);
-- 
2.43.0

