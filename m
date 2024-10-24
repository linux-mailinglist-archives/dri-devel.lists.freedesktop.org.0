Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43579AD9A8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 04:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C8C10E88C;
	Thu, 24 Oct 2024 02:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="fO9252pH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B8F10E88A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 02:20:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elfEu45SRwPIBqcaVXwVUvp8w2O7C7akQWMXLutRe4IFyhY8lgUqZ6UEOKQ/8dpiJb54S4Svf0iVOCGVsoLqtUS65Wb/REqu8lTarWkD5yrnCXOaf31RGjFKvN2U46UupURt5kb9f4TWjS/KOgMO9pa1m7EQyiLMY1Dbku+v2IEPHb4k34KwPTDlgiWt9CYlRB6MfN4acljYOfcft408tdJhQFEaKf4hAw803mFy9ZjnH36vZu6h7/kCK5IrcCAsV8V3UCJSO7ILWy6d6VOgQRzjg5oUgZs88U3BuCBDeOAykj70Gzq2+3LMmIgEmxsoqzhXw9qdBfdAoJRFaESLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5cb4M7eUBjK5KW9qCtDhESRSmafWUFz/dmuWH0OZuA=;
 b=juV88VCvzD81kVIV1LtRyoH954yYBxJyi6bRJs4f1+ubrsWWgvImHy06D9CAKCK2olwa+Em06E/ehWcxvHjWRIxqdRylqnpyqpsgb7OuqSlZTU8BcEuhwIuqsn5fq+XzbKcl9LGL/h434LS4Sc94mh69PyN/FajsM0nOpO/AJUn6Q/kteFuM12Ciy6imyZXkUHfKg0uHyk308SAogqZyFngmf64qtPWm4MKMKO+TezVhbN0XiJOXrNikzF/Y7ZHGBcd4uNKdIMWvk4UGG2HQDttCVHTQyqxdxJwjQu3p77ngZ0e9hEgokUK1tjNB5BNZHyd8u4O8tdcy2z4VhucQzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5cb4M7eUBjK5KW9qCtDhESRSmafWUFz/dmuWH0OZuA=;
 b=fO9252pHfwqmYYOoF47cmhkWLMPFBrNpVuLqVOSf1zlWrzQKqhe+ISIIdz/M1oWAkrE6Tl5+sKBWpTWEi748gtwby2ip9DpGwz1v2Ooq18is6ilx1eaLii6coiI4x+PnS+KojUdo+6T37fi45gX4PsoApEOGQZK4njXz0LIpdXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8629.jpnprd01.prod.outlook.com
 (2603:1096:604:187::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 02:20:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 02:20:11 +0000
Message-ID: <87iktib5t0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 3/9] of: property: use new of_graph functions
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
In-Reply-To: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
References: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 02:20:11 +0000
X-ClientProxiedBy: TYCP301CA0075.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: ca17f91f-7b42-42c0-fada-08dcf3d2637d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lP0H5HYhbnux8gnOOr9HGa2+ze7ZBEZan5vfTcB61WtY8JMIGhEXYcFdUnPx?=
 =?us-ascii?Q?Ac1wAJPK4KJPIfViTTt23WK+4kxltu6bVBcT93C5XL+QguheV2esRZGXPaT1?=
 =?us-ascii?Q?aOebUU54cc8jHYWbcjZs9Qb7uZ0rZvFoiwUorRT7A886KbZjGViUkjLw72CO?=
 =?us-ascii?Q?RjSYNLjUQYHplAl1cg3SoNB4Ci7ZTxRok7oxzpzCZHC+XIUyvTz7T2r1S8T5?=
 =?us-ascii?Q?cQfReKT6ZK2tlEAff8OA7qWnJWPExJAgL2BBPW7pQzpfLJ98EpZgHfyzTLBu?=
 =?us-ascii?Q?Tn+T5pHN+ORE9VY5nccM7AusBo8WdAoIye0P0WH2fq91hJT0eh4H7tE9uWvR?=
 =?us-ascii?Q?hvejT9fH5keXU76uMOPnQv91TMxogcAaD2UL+f4KRAfViClQ5QF5rDYbPRnI?=
 =?us-ascii?Q?C3Bn75yne2G6CIBoIjnNwN7WZEmnC+M68h6NTzRYA7EiEkKkqN44g8b4pOBQ?=
 =?us-ascii?Q?E51A/5nfGj6HsUjvyxCmffIpD7azP/R0jLieNHh5EIjnT3L1eo3AP+AvDljd?=
 =?us-ascii?Q?uTVMB8ss6XOGe/ABVz4MEyTSgs9EO8wqmlcGCN2FVfQkZlsNBEM4cV7q5LVp?=
 =?us-ascii?Q?Yj3A4W9z0r7HjOkL4IUi5MeB0MM8D+YMz4uoVUX1nUYR0U6/eze10KYEy+Au?=
 =?us-ascii?Q?q1ZpAt59fDBz8IUUcbM/ZXBq/9kZxsaXT53gnKtgLdx4BekZ55F8nSB3YrAA?=
 =?us-ascii?Q?b15hTiVE1mDe5CrmShTDwDxnsY4aIWSCe80O1kwW/SfPlaUniL0K68uhZuF3?=
 =?us-ascii?Q?t2VU1PcJ8e2DO7p3qsqZZivk7N8PfmTQBfj98K1bQ4iRycRaKSfPE0OaEVJy?=
 =?us-ascii?Q?n8VG1emYAg0xE62P6//pHtfIeiJLL6IO2B7NwDYIJLWjm9EpsqyF3O7Tjiuc?=
 =?us-ascii?Q?/0CzOJH2DM8kTs+JRX0iI8vVHKpzDYH8wXJBRMbd5qPrudmf2X5NXr2OTghT?=
 =?us-ascii?Q?lYVYn/n7bBaYUKpBJVgN9cPj2oTKndExw49UCy7D+tOkUjcP95xLYnYSYpiM?=
 =?us-ascii?Q?tQF2jXEowuV7yYDwoensWT8mAgprIrNGub7fSdC9QBazmTJuyOChmnBYDmiF?=
 =?us-ascii?Q?iGSc4V9csZv8oOYh6DzYfoHB0H1DnHQWUJ+nbdrE/2HKQPB1wDZp3YYaR5yr?=
 =?us-ascii?Q?VFsTvYqHFrFSN9EUSagmAKV/XL1EM7FEreDLRMjgFBvdQ3k7zd/YkoG02oC3?=
 =?us-ascii?Q?vHMnnQYhfWdasd50PJo8xd0ugOBqGpP/kLpZ8Xs+yRYQsu5RupEOfbe/4jdk?=
 =?us-ascii?Q?ByhJoZeGYSKhypSfgkvN+meE2V7AJa6n/fAWD+NcLtNxmlkN923nS/d+/6vs?=
 =?us-ascii?Q?i35tXTIrQsZOBC1Ja/kD+ARNd/+9h5961QgDL7TqswyLylJhpjjr9T6PkdVp?=
 =?us-ascii?Q?isYECS+67SCA1wIwzGyZrHGCgfEh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r/HDKUNCKe/pXZY03z67YcirYuZmCcSM/ZhK3qh14QuevfBVSFSEvppj9iEy?=
 =?us-ascii?Q?3eMsnyomxzzFJPMNMdYmw+zkxf/RrxLLl82CQMrG9KQv2eUjia4VUcunphCi?=
 =?us-ascii?Q?xUDFOAYS81xzka4PVNBMPW63b0Ktdl+0/TAcqsRxTZzdpRBAejD4WsnROvc3?=
 =?us-ascii?Q?YVe5Dha+NfEHa33xhZG0SFASyLR6N7wf9QGW4sp/wHXTngstGupinm41R8lF?=
 =?us-ascii?Q?aEU12xQvqr5IpHpy4CqX2kVfKGQLuQH0mn9B0dY84kZwh8xs8DnfPRFBMaC8?=
 =?us-ascii?Q?Olcq2kHrK613wTksemOJTovho1hR6Fo9UdF+9dsmJncwpZ7xlN4YuEEg+JtG?=
 =?us-ascii?Q?4wT49V/2DoPyXRIp7ax+y4W5Y21TNnWNxLKCq+sTiFrP4fvXCtGXfI5zT1QQ?=
 =?us-ascii?Q?nJFIAU7HvRo+0aidRTRdWFcsbNVG+aHgI1Ko54Xr3/i/WTYqFP8fEsN+a1od?=
 =?us-ascii?Q?7HgSEaw10pH50ndU0p4FCNhhvg1Lb3uzyFcLpNpOfwEKWAZ50eVGiERYTY45?=
 =?us-ascii?Q?hB6+c5S7tHb/Ga80uSi9J46ZUzL4Ci14vgqOvz8eW2QHGMPNKAqf+FDL2yLZ?=
 =?us-ascii?Q?8cIZaGr+P5lel0lCGheb4kE5hSUuiXfZ9UuzAkuY3Ctmjp+nzVj0A9HX+6/G?=
 =?us-ascii?Q?C0MTPKvTVc4zoT/xACYy3iwjh/kTVXfDtBFk8B/F53sLh1Iga0y1H26Lq2ut?=
 =?us-ascii?Q?BQK10TVS1oEscbXflY46F/e+SbspXRCVi9BY819FXveUjRpkjlXXZL821O1Z?=
 =?us-ascii?Q?AqN8GdL1FApp3SkfQoxz92Ypmt7AdABesiAXbNCtoElptjtPLITW/stfjlhc?=
 =?us-ascii?Q?mUrLmv+iOTuOiJPqnrYJqfvnKnOVnBChw2Z5JazKeTdN6RcirXZlsvM5WDbS?=
 =?us-ascii?Q?FL1XwIEAmsvi7J8otrdBM2In1np9uLN61RiO4p4Ppy4B8SVh0ZQWBbKFiyYS?=
 =?us-ascii?Q?6g/3jsfuZEc0slonJr9IK91N9b5tpN8PzANyvXrl3o4jZLEl/IRB1qfL0NHX?=
 =?us-ascii?Q?v0VYtBHTnqzF0mhlDSPCBBIboQU31/gCZbR+jp92LXIZxcF2QIjddX6Y+jf9?=
 =?us-ascii?Q?K2zGdGHkxPHCsIaE0TRRLpbpP3hIMoIWHV8BgTV8R2f1BjvLMR76+xW0dsgQ?=
 =?us-ascii?Q?aDjQyYLjzfeBSPTbxvurl+oEBp8fnVbN5Afufospb7BzoMjIdMR3dq1xx5pC?=
 =?us-ascii?Q?8EZIwZRryNJskY2YIOvGzEUhJL5PnEFly7w16UOBN8tzsea8gHx9/q7HWzob?=
 =?us-ascii?Q?y85PTU/H8aOUvYDuNtJzWs6FyjDRUtw8FVT2A/2tmMlK7XmhjKoJTK7SFSz0?=
 =?us-ascii?Q?qvgxHVewm9ookGsVtZRS776HgzL17/IQtTJaoYgpo5GQZYR9DKOM8xyI0aWo?=
 =?us-ascii?Q?MbXJ8YxgYd2Fgtpfwu+YWgV280j8Qts84rcnGkExdBRF5A+kESFwgfKORPun?=
 =?us-ascii?Q?pk3C509Wr+QK1qhcEMJLPSbqckNTUVNcWoXwQM+NJExtzWSVj3dmm1S7LjiB?=
 =?us-ascii?Q?XJkzim8bAK6SxpOs+GBYHXFs/wNC61ku8aUrkn6BEQ8+HiClIekRAmlo3Mgz?=
 =?us-ascii?Q?MUYIYF6PBgz2OD+WdqNsc2j9xWe/Nn9+mpLYLr9LetCQZ35COqHqQWAwTV5e?=
 =?us-ascii?Q?vtvjdZMVjtxUd2lyfm8ephI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca17f91f-7b42-42c0-fada-08dcf3d2637d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:20:11.8695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgRNAaPQuN5aFrQ7klKsgBmkVfhJmhmM8RBiSQNJ01rJJD/+OAz4UT5RP1Rrl47SyrI7ekyneo40vTIa1DihnIQdcRkwglgfRq1gaFyQ1WvsiUkycLiHEHBIXgiGfxC1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8629
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
index fcc609a17fe35..94175289b518a 100644
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

