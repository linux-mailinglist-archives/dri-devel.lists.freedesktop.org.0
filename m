Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9F4961DED
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 07:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF41110E49F;
	Wed, 28 Aug 2024 05:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="FWjf1mid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDD310E49F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNps9HmhdklcdTOxMb+GYjVV8xK/st9ZrZaOn7fOSx9MU9eybWh8jkN0hdLBDiz87E7qk/M5rUwyTrw1Xlf3YLO1ZLs3EOVWjp+t2segFW+EORve8u1wzvwC0eM+yBplzzcmzo8r+NPV0YbjTL/ygeSQmOlwi35TNfEl4OxjnGnIK4tK7+Bq0C8DjthSMvNv9HgHMZkSK6VND9KP0HfGwC/Onq2jGHi2jJvRdAESiAnDBIUz34eXA3otfkLgIByT47DmsDuEAFJ9EAVHdj4o6IcbRnFRtAdffnHTpr22tyuO8obKLFFdIYIBhZZTBvV4NodtUdQarKGkXJd9uBIH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSTy3OP81bOUWiIaiLJlHM2sjNqpFXTV3MWJ/ljI3OM=;
 b=kg2qrEHi/8aIDNwGCcOygDP2Dal8aszELB6LqhNDyvZoXGrQvLbWGVlHCDzP4dQ12QSDTz/+PqKJYl3iqbnHa13fENGgTpUqMxzs3kBwtPyjXq1A3Bo9kPQ85nRKFXgLGB76yZuZYyBTXSIWKQoyP6Sn07mLgmahuQUb0WzIuk1EcXNkW5OB85LdYyquD4uJisMfO3OSi865pfqz15FviDAN7K1X+F8qHptqAW/jiSnfR7gOEE2fVkF63DjG7SZdhTx606eg1UNZb+1dUtcgAFwl8p7qcxoTrkV+HSi6NLhP1JbjMZOwwnjabnsBgb8ZNWKQdQcwuvzV9PeZDH/uwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSTy3OP81bOUWiIaiLJlHM2sjNqpFXTV3MWJ/ljI3OM=;
 b=FWjf1midR+LodzwTuHADcVHWgoGc0Vllq0KEYvuYjXdn8nZHRjMEp5aH/GdUltADlM9OuYOECHwWAdICPC0IM8X53aQNmvv/rwDeVh1odqC4hi0wqUTsHaFaHZBxquf7iF6dfNXnAE+htR/HkAi3a54ndJbayxmu5XIZ3JSixb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11955.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 05:11:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 05:11:56 +0000
Message-ID: <875xrl2pur.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 4/9] ASoC: rcar_snd: use new of_graph functions
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
In-Reply-To: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Aug 2024 05:11:56 +0000
X-ClientProxiedBy: TYCPR01CA0138.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11955:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df3315d-313d-42c5-853a-08dcc71ff02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LGIlfwvIC325lYEZS+v2MnkaB+7G7f0O3/XBL/pBhjfkxqtdkXrWX0WFmnCw?=
 =?us-ascii?Q?bbElHtIGeTgp6lkQvK96hCtTrNtYS1vpRZ6ygTOuFs8c8q9dHBkRsIz7q5Wt?=
 =?us-ascii?Q?XV80fbZEcExlCdKMSe1YytEGCIaFk9OFwtol+YBVBcs/0FgkyzPJn5ZHzSWk?=
 =?us-ascii?Q?a4Ddj66usJ5kFuTmJyfIsn0eNaS7Q6R4gTC9tORou4Wk3CPYObbH2K+WGRDl?=
 =?us-ascii?Q?Lk+evsu1gu49nz03KsmBhFBd6IdGwXkcmB+M3QV5V1PeoXid0qfP53TGebHR?=
 =?us-ascii?Q?P4dj7WGPhwp6R3vFh+noM9YwUCM35lcskfJWlYX3ptyTUV6eDR4WqNSZSfUF?=
 =?us-ascii?Q?6fNRucN6/709Us7pBvYj91CKBKsc13635TamrN+umSUK36gdWtPpVVf+9zMU?=
 =?us-ascii?Q?/tqYkZhTy3JfhXAcDsk/2GBLEtVYi0rJ8BlfoWew/BeE2j4o0Dg0VK3g8HwN?=
 =?us-ascii?Q?sYVsRdj8Jawi+7L7q6gYuDL7d+9zHTYHfQ9vacBQNV9Y621dqFjsxdBRC963?=
 =?us-ascii?Q?VcDzaPRUXwzzgNyzTsUvYOFdqJbEl9nNN547hSouwkB7hxDmmRmUkQucDgfE?=
 =?us-ascii?Q?38ypXxndais7d7jYxDTTseUuQa9ye/QPla0zA+m6yZ0Au9CxaCCE+wWV2935?=
 =?us-ascii?Q?4XYH3kICiGxPFlbiz58nYNfJvi/WmzCLyiWgx2BSAo8ZssnNllagypX/2EyQ?=
 =?us-ascii?Q?8WuJMft7LoEw678ZBRlNscdkrIVlh99h8r9yNEdStouZDctl3gtk2WqAsGEy?=
 =?us-ascii?Q?51wk0pmnRASQMl4M4Hchq12O9yAs/Bm4aB25nGydH8YFdZtd7bzkSaAI1C6n?=
 =?us-ascii?Q?UFXIdugphL7u7zaarPMv4hvzjfR9rKq3nc30AQgzKdX2LgHURsZLbcNxYrA0?=
 =?us-ascii?Q?KDNv/4qT8RUihiN2jQysBVcCE9EOuE64TuoThkhXXw1rNbhXJGnVG80AF8A3?=
 =?us-ascii?Q?6q+xm0wITPxbnEQcQ+7GzUYCenBlrsVtN6WhuH1YEZ4hzKAz5GMcwWOsn+QX?=
 =?us-ascii?Q?Pj3GsAvARBoFemUctBHXm+JrKBgNh2SMMlwn7QPsuv+T2MSfXQWNCoQS6tiF?=
 =?us-ascii?Q?EStuIwLh6S2jeffWcpstHpnBp1KDPv0Hw4rL2GwT4qE9BAKLpc6JxQzrMPAz?=
 =?us-ascii?Q?xES4KXPlpsg7jLMlQMd3NKq8+IneHwSJOqQFtNyBG4sZzo0DNl6A2JhckJfn?=
 =?us-ascii?Q?BIySFXqWMIKcLwQcbuyDDzPzI0ogoGQZ5dXkchnzq20FnJgkqmjRY8tUrP8R?=
 =?us-ascii?Q?teEv8y4DrtHF+WUQDxsgjI6zi0pTVvvZpFiJTMi4yKwBHwJfbW/1dl9soqWQ?=
 =?us-ascii?Q?MaIXUirTtIG7HV6/9C2HUP6zBiOb25POk4HCyrfKsW4tnC9CH6kbZYuE0yNR?=
 =?us-ascii?Q?Fy0ug5wdt0x4ag4GSKVSi24nlNZ0w4IU5vJdC/pFVAAycp9yCxkQkyAhQ/QP?=
 =?us-ascii?Q?H0tIOuYtubw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SDcbmqG09OtlqrDebfld+pn9ewxka2ZKeJKJnVna0DATWwdW3yjZWx5zPAbi?=
 =?us-ascii?Q?xeJGzjAHk54Z12DBnuN0hyzoCJ9RycfVYnrni+7Jx4d7/kyexWZynbruZevd?=
 =?us-ascii?Q?guw7rwjPPYolq7C/XzeOv1ECsC1UohMGl42Gat9lDd4yyQOu78T52Qv4b71o?=
 =?us-ascii?Q?FUiwVbCAhdPsbaht8k12LFaatPrsgqK/LpNXEqK1Qd9oI7BcDT2rj/1yI9+B?=
 =?us-ascii?Q?qwzpPYjv9kRC+OfE2iJaQ9KHlWHq04L4E7Uf67USBxbkgreA4hTHdrZw38aH?=
 =?us-ascii?Q?Q6o28M9zVRUczLQvzcTr8UOUatSXfL4k1P7zbUdqayBwpMoUI8YkzhFdCNk9?=
 =?us-ascii?Q?NBcLDhUv4RMB1SNjpdBE/A14VTf53Ct8KQC45qwOD3ajRAkXJmr+eSyafynL?=
 =?us-ascii?Q?5317QY9gv7TkgKF6wUHbLY1CPeV708U/LpqXGaD0L2sTQIu7N5O8G4exJEEG?=
 =?us-ascii?Q?+zhk8oR7C+4KSgB84zCjH92oCf/35l7BFjJBitYuCcbllV5ZqIn9235l6gZP?=
 =?us-ascii?Q?EiYbNrtNHnwHqeJcPVq0SyJcgzudGtei+wrxEWyHhwwaeL2M1cXOBgSxqWxZ?=
 =?us-ascii?Q?B4ePxLB5qdyq3EHdvzT9LUIR+OjgNfiE3jkXSbhxRqSmCasAYR3IVYSyMdBz?=
 =?us-ascii?Q?7ypkllgrzlZv+w5ewGefcGE+qmgXL17FvkcdjpE2YrEmnSU9DsIvJaoGIpWY?=
 =?us-ascii?Q?+F8DGmgt5gIAJQjGlOlliTUMREcv7E3o1jPuVy7PbGPoJAVrfcJCOSArLh0P?=
 =?us-ascii?Q?5Cw6+xO6MoLVci8w1ed6ifCZSiQB2sIQKHKGQ0KdWn+ioSK6kGpCcbV0Ed/j?=
 =?us-ascii?Q?lS680FBTl/SQjNYFoW0V/d/OrV/Xmlziz+jLZ9+qHaqq11gq5CoRRugFsV1a?=
 =?us-ascii?Q?CflrfGVrqtSRQd1JshIgtqJls3SqmL1orD/NdMQXWcVo4Khadqy3mNAtHDUu?=
 =?us-ascii?Q?0fCht+CMDGfEFyaEyYnBQsYUcjF9kBmnoTnl/tAssJgvyqeRevIN0n5JT7v3?=
 =?us-ascii?Q?+a2tpd5+fKcpx8LwMf2aHTIaO/cH2YzkyNnAUi26BGDarrD7uYVYfb7pQCYC?=
 =?us-ascii?Q?EMtyo7NCXHHAC6REqcmrljx6iAddgmWyJzWNwJ1HBszJW5wOcCO4uhviHUXD?=
 =?us-ascii?Q?6rEXm6i/fc3vnFYGOKzqbcF4d3A0YKOGq/pM7eL1oxy34xMLJ+3jA0Vz6X7L?=
 =?us-ascii?Q?NhZyl3/2ubK5S5FdOxqbnjtrfRiYhk+o6AcCeX8bDCRejz2IKBeYuxXh8JNa?=
 =?us-ascii?Q?kiEw3ITzyfXswGsYvjXeK9t0IHlud2/iIrptKbeBv0S8GTYkizv7g0EegjGF?=
 =?us-ascii?Q?CN/SZ2sDPKgGaji9JdBROlY8UKp4UF9vggS9mrO9w6WwaZDYJTN0iFbiM7LJ?=
 =?us-ascii?Q?bcRoiXBsBFacOWKX1NrRWfM6lNpzRGBnw2RyOfReatPKW5QzXDh8MYMltfu1?=
 =?us-ascii?Q?eE97wiqhmmFQL8TE1SHARFM+1iVFY7xjCJVlXPsWr2NGVXP+7Q3maaDhHOHp?=
 =?us-ascii?Q?n7BNpfuGUOz9u1adP9ROs40R4PVHAEgAImAQwTYzjuIYpoRPHHt2thGAS3Mw?=
 =?us-ascii?Q?ufvjkVDh0M5gK5WLdLhh1HLJiUewRcPCUOS5CUKC6dz88OnVfXfLs4sPVEC9?=
 =?us-ascii?Q?8Ju3Rq/hukoXJ8uHuPn/l+M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df3315d-313d-42c5-853a-08dcc71ff02c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 05:11:56.7869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLiUgIfs2Kw48bMAu4SN4kWKa3+838FUz6lN4r0A+9GLigbxPfVdmCHf2yvt9Kkrmufniup8gdhTb8ygtz6wBJVPUk8HkOXHwTHnddn+M5l8sstOm9wlWSfqXqRrT1Nv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11955
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

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/core.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 15cb5e7008f9f..281936ece760b 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1237,7 +1237,7 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 {
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *np = dev->of_node;
-	struct device_node *ports, *node;
+	struct device_node *node;
 	int nr = 0;
 	int i = 0;
 
@@ -1277,16 +1277,12 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 	/*
 	 * Audio-Graph-Card
 	 */
-	for_each_child_of_node(np, ports) {
-		if (!of_node_name_eq(ports, "ports") &&
-		    !of_node_name_eq(ports, "port"))
-			continue;
-		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
+	for_each_of_graph_ports(np, ports) {
+		priv->component_dais[i] = of_graph_get_port_count(ports);
 		nr += priv->component_dais[i];
 		i++;
 		if (i >= RSND_MAX_COMPONENT) {
 			dev_info(dev, "reach to max component\n");
-			of_node_put(ports);
 			break;
 		}
 	}
@@ -1486,14 +1482,10 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 	 */
 	dai_i = 0;
 	if (is_graph) {
-		struct device_node *ports;
-		struct device_node *dai_np;
+		for_each_of_graph_ports(np, ports) {
+			for_each_of_graph_port(ports, port) {
+				struct device_node *dai_np = of_graph_get_next_port_endpoint(port, NULL);
 
-		for_each_child_of_node(np, ports) {
-			if (!of_node_name_eq(ports, "ports") &&
-			    !of_node_name_eq(ports, "port"))
-				continue;
-			for_each_endpoint_of_node(ports, dai_np) {
 				__rsnd_dai_probe(priv, dai_np, dai_np, 0, dai_i);
 				if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(priv)) {
 					rdai = rsnd_rdai_get(priv, dai_i);
@@ -1502,6 +1494,7 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 					rsnd_parse_connect_graph(priv, &rdai->capture,  dai_np);
 				}
 				dai_i++;
+				of_node_put(dai_np);
 			}
 		}
 	} else {
-- 
2.43.0

