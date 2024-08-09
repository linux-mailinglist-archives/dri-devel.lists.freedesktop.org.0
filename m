Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBD594C92C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 06:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045FF10E853;
	Fri,  9 Aug 2024 04:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="EXIzGHr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C23D10E853
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 04:22:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFNTxjH8BvVeB5wOylXfoOvwrc0qw504jAN32+68x/HQ8IPgZg5TEKmNmC+NkdDopEdnPpNIHFeUXce6q/A7bYp8CyEoKsNT5n+OFxLmnlgNJMC+O7CiIl8HQ2/58Z7oom8bTsRcxHJOI67K6KeK14D/oiFMyedxPQvKK35ChX4AfJczQjCEmRIcJGtRFy5P2cOTTNFvkZF1ugPDkE6hjdtQITmrt2y24EcWtWpHiVwE5vebdtPDPqrbkqbh9kv8U7B8bywptHOcxAHmvd4mCxvsxqQDDukaYji4GqSryzAi0lVt9ImuC0iSi6P0I7a7dWUCPssMSXRAYouGCs6Beg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnM/bVJH/7MwtVBHhQABMeeqNeBOZIi/dXjU+gs2Who=;
 b=qb5UCQxmJSPrhGO1MoFFcfaSGbmvfkulgg3CKRRrHyvk1lui7bdReQxqrYSRCaKCEwmIgn+O8XcIW34lRg8ADLSx4JLIq4g/FFaAVZ6SSu4vgEH/mJykrAPe7MRwqPgswUZ6/C64Ut5alxlmfGkkwnKtz09Ivw7PEMOFTbWKvHKMvexVgoD4d0EHNZlkh8k8TlhA3l7+Sl1U6Nr06HOkBcMtN8npdKGBgs060Is+9zWMdPFnV7agMagePZaI+YELwdxMgfx+7U5VTr1iZoiNIZ75wnZW645E445h9Hug1B4ZAX/2TUxeDOL0vmHlxxcBZuVFsFeexOojlUqmaGZ/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnM/bVJH/7MwtVBHhQABMeeqNeBOZIi/dXjU+gs2Who=;
 b=EXIzGHr8pHvYZ9XPkdRHXTDbKpJnn4dpwjLEqcqG5zRT0fteSQ4HuZBIjxSDA9VZ1OmjpdXTb9RrlvwKy3QHTKHF3f+vP1FN04SIgI/SWCzq8mnrXEt0NRHwotCzNSIuXFAQNUkHOmpelEysQgwYRG08n6wyyC+n35rBgJiHWKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9639.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 04:22:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 04:22:44 +0000
Message-ID: <87zfpm72b0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/9] ASoC: rcar_snd: use new of_graph functions
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
 linux-sound@vger.kernel.org
In-Reply-To: <875xsa8gws.wl-kuninori.morimoto.gx@renesas.com>
References: <875xsa8gws.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Aug 2024 04:22:44 +0000
X-ClientProxiedBy: TYCP286CA0358.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: dea819a0-5db5-487e-cef5-08dcb82aea92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eewj0mtYeuLtDRUo7bnrr9dK5KW3YVnD8byggA6S2ogbfXs4Mu9/skOGI3Iw?=
 =?us-ascii?Q?WWp/umoWllPbRlysckZQOTm6k3Z7+BscZsW3pZOp7F9ztZLDLHaes0bAbb4W?=
 =?us-ascii?Q?WhqRDm5IS/yAsAQa9fLz/7PmjSOZNBD8zIwTUjLJjwzbxc0dqopbXOYoyS9d?=
 =?us-ascii?Q?2XLgVViaPr8e04Uh90qA1qT11zwRFnqBGND/GeBRA2tWOyjuudwpZMQKMwvQ?=
 =?us-ascii?Q?gD4wbS4hLzkjr1rUDCIiYT72wmAa2TgArdqvZxIeKhu0SCEHoIjS1YBsiw85?=
 =?us-ascii?Q?eCPLJzNlq0HrTVoJjwIPDmESdN0veDAWfLGGYtKFx6QD2KK+DOOxvDwFe9hq?=
 =?us-ascii?Q?unr1pc8vMWjJL5qji8xKtcK0fHR4ZOvyhjzKn670ywo45O/I4GDMIiQTX69i?=
 =?us-ascii?Q?PCHLAhQu7Z3YGU8hC6VD01lu6AnqVN3lC2U5q13gstY5xtb6PgN+W1/EpqBL?=
 =?us-ascii?Q?oqBtxldDUtJC0XX0Vi2ipFcxjmhK0dqojeCgsLq4Mnx2XzOD8dTZD8Yxv89H?=
 =?us-ascii?Q?7bYNWTmYCuIQ23AhqBbUWaNev2YiuFr5CPInkY9nfJ7ru37mzqDIYTrOPuXx?=
 =?us-ascii?Q?8bTnkJdbZi+R5gvCn0qBdFy9KXnMXcmumRQHCc1ERaigaOfQCaPEpMZW8hGO?=
 =?us-ascii?Q?slSNg2/LYhqeYKoeR2hXz4HXMHlLA/d7EtnlFXyYfp0prR6P0+UxSQfPTnC2?=
 =?us-ascii?Q?QNWBAou/EdV1K0izxkB/lRqACQ89T0y7wrasbuvVl9uyvpGE9HU1sccUUOTB?=
 =?us-ascii?Q?Po2MlZcAclao6p1aKeG+QPnwEBIIzRvVp4f6PGzSLKquerwIMm/pFs909PEv?=
 =?us-ascii?Q?OF8tpngFcDYJsRYJM556cQjdBKVbhLmGKElra46f7R4ECxWaFlDErTkwsZFZ?=
 =?us-ascii?Q?9hu+RkfTjAoLnbgyCf1Wo2hO2prhW8arSy/YszsKDDrWOxyVPNpe71x8UaqL?=
 =?us-ascii?Q?2DUqHzY1iqQNz9VBMzWayQboV6QyAKc1foI90oB8ckpLcwvigriXXw5IlabI?=
 =?us-ascii?Q?PZUyYCBUSvvD6eIkGASMl4SIAne3Q7eVjU3lbQtmG5HHZlA5OzwI3aK7lR65?=
 =?us-ascii?Q?h4S10mMA3MBJWlG14f1uHEy9JBvu1z44GruC6TMVyA22bvxobTfUsKNSrZPG?=
 =?us-ascii?Q?2sYdN1MdyievJyhfc0ENNDq7EMVZwuP8eOmAe1KgeXRZdOhE6qH9KG7AjWrC?=
 =?us-ascii?Q?0BElF7Y+GQXofK3JqWiBMLian4xBHLpyoIruVUJllnb6rylwDboPDkJCRDg+?=
 =?us-ascii?Q?HVleySGC9pstIzua6NLieoXUrfzMRZ1pNXf5iSi7qKTHPK6MIf1RhezWJ4Dj?=
 =?us-ascii?Q?JTUe2VZkp2d/zkNdT817I+jxphajxL0rPDqPUTlyTxrnejBTzPv6cn5VzKtU?=
 =?us-ascii?Q?AJtQV5yKjbQVmZrO3czndTOh9kfHakh6w7X9A78ToCEQ8gxTIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C/LqmRyN727eznM5oRi0lLp1SEvynAm/xmp5H5Niw8K4vL2R5T61WwL0gpRY?=
 =?us-ascii?Q?33BMam5X9Hvbw6/854D8D8/TtRXw0d6NKOEEUdsnxwfCTyoJgjL2Z9Ql+j/Q?=
 =?us-ascii?Q?NfnkyQ46EXL8tUYqU+cbqK5VdfXuow4iLxXqL5jSLU7yFXnMwms+bnTNNZrm?=
 =?us-ascii?Q?8VjB95T5jLhjz1ENsnggbTGeTzSaCn5bEyua+Zn/P5eU0xNgz5hCvzuRVcF4?=
 =?us-ascii?Q?BSlSQuEOJEmR1gxcRjwIh+RjvBr9NwVtJ5SHvML2dLRcEyAtj0FGB8Z/Dv3A?=
 =?us-ascii?Q?yig4BGZ2jOyX9IwSBXGsKC0hK88IKvtrmgNGSgEGFQVPnTpnDrXwWZBnogag?=
 =?us-ascii?Q?EWxk091iHsNnsX6apFJm/Scz6p+FophMJogPV5BBrcUngKeeBVEbxegg07ep?=
 =?us-ascii?Q?E05oV0v3OkPbsbv+rvzf8MGjjj/aLvfheUWvAdQRdqSwj3Z0cR4DkMhtFnb3?=
 =?us-ascii?Q?CQ3E/SPnSMmKIqGp/uPJ/3L1zJCMmLS9M9sOEfpf3yfNExvxM8Ret2D7qenj?=
 =?us-ascii?Q?NIi3erX9Mcf047nCByrc7BOR3EpBsAOlUfahnj3J1gfGA++AjHspueWdujRK?=
 =?us-ascii?Q?y19ZEXVwEkUBIgdA8/gPrNM7NBWkouBzD4QcniKDMIEEF4ogUleP0Qy4V3V5?=
 =?us-ascii?Q?qcRzO8r9J+WCwRHbYvlVjSGTRwF8bkDPQyxw9tFo5xpGwD4edm+FJ0gH0/7O?=
 =?us-ascii?Q?raU/FE3F5TyX+xuL0o/01x9ChjISCRO4p0dH9MhwO8n2UiY9ydsf+qGqmLNo?=
 =?us-ascii?Q?gus92ypSkg34lf31/zFtMVbfyZruSKsm8eeLm3lNFcLdyHwW9T7CillfGUem?=
 =?us-ascii?Q?6+NeB5cyAVQRwejXLkpxOJ54agQ/WnsDlSLLz7aHZPziqRt1jiX066AznQom?=
 =?us-ascii?Q?3zCAlqxbBO4s12QjzKm9jmRPqBsuc8qnA1WF+0Hh9WmdMp7jRqkwOHa5rwDN?=
 =?us-ascii?Q?/NMzYUUYR/jjDLzZSzJunECErQMl0S+B8O8AF39q48MIxe94pMfNEO0039Qp?=
 =?us-ascii?Q?Vtac1msObhVUhhQsAPkdhak8M5VLn8wGFRYLVG6MjkDEW5DFXBwSDNn/7IJO?=
 =?us-ascii?Q?pW3CWtdZmip659yGXfNOR40O/WadJ22pO7yHE7/1n2gcyW61ALCjwvK4OBR8?=
 =?us-ascii?Q?3nzrxjqyX8m7aCTIGmd9kWb0MzeQaz0drFy4n/WW+7IvXplJDzDjGleUCyhn?=
 =?us-ascii?Q?jFCvYOkJsQ5kptLiFjFtm/zfPtaeqNKyUZzubmjTtTIdcf+MEjwWpwIE517g?=
 =?us-ascii?Q?aZVuqwQSE4l8DtfznI9D8nTG32vHaKDKRxo2eFrNbWRdMffMVoatgINNaTSw?=
 =?us-ascii?Q?PFbXm9IOSJuLZxy6Wb26aS+lBI/yoKO8YivHe30pY3ap6e9kbnQ8J+9UJZp3?=
 =?us-ascii?Q?jaUaCg0YyrskXs83w8fGuJRvo9twWyE6mWwlgrlaFDIMmbxtfpiobcvEGy6G?=
 =?us-ascii?Q?htwwGOPeUv5kTGRkY8YWeOADG/dyiga4QbK+KeGyegsHGvFhEfWD2qT3d69+?=
 =?us-ascii?Q?64OiA1bICYYnRPO/vy6XZcENttI1ZBID0MEgxmq/UOi9AXzgA6bm9UoWOtS0?=
 =?us-ascii?Q?kcf92RX2FHZiZ/rmn6V5XIFGda99LxmKiD8qqdxH3CLUhfE3VbX7lJfNHY4y?=
 =?us-ascii?Q?b1K4tw2g7jSs2lChvVTDcS0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea819a0-5db5-487e-cef5-08dcb82aea92
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:22:44.4304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWJFQs5Nh9J6iUbroDZAGjfBkNgtaXdJKGpcEKyWGmDDG8RgFPVl7V1M/3S9wvNOW+a498op2jDT+9JL3eIfQ9TKPyewNgmhfFpoFxhyRGBVsAhIYfMCBat/ZUZ27LYQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9639
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
 sound/soc/sh/rcar/core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 63b3c8bf0fde..eb146cf836eb 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1294,11 +1294,8 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
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
@@ -1506,10 +1503,7 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 		struct device_node *ports;
 		struct device_node *dai_np;
 
-		for_each_child_of_node(np, ports) {
-			if (!of_node_name_eq(ports, "ports") &&
-			    !of_node_name_eq(ports, "port"))
-				continue;
+		for_each_of_graph_ports(np, ports) {
 			for_each_endpoint_of_node(ports, dai_np) {
 				__rsnd_dai_probe(priv, dai_np, dai_np, 0, dai_i);
 				if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(priv)) {
-- 
2.43.0

