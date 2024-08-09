Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E1094C934
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 06:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD1610E854;
	Fri,  9 Aug 2024 04:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="mdJ0zwYg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B35610E854
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 04:23:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsFS5K7b7gk6IqIVNedaAxXByrp4FrSwfV+iYbXXIYzLiMgjs3jk56UJqAqxExbJbL3aSUwnWLTU85HGliap4QikEQQs1qpmiQqGhIhxvGNDf2lN2GH0zrrXNPlE1EmMDARt5iwd5NkMDeiUz4XTtydDA0K+5Sieey6kVoas4adNenuGca3P0Qh37cclG2FlCA7Qbk0VXUZksoNR5fEKRfESqOjr4s7cBSFaj1SiH9X8Woo5DmRSvUI/HStc2N/M57rocBvsfQEq39nFrHzmxx84HubCKJHomjyt6D45yR6wXJxfT901q5/qxujJ9kyB+E0bfnQdq3aDADDa2ASbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qK5GeS4438G+wuSpWRz4kw3OeJYBGQhsiwzGxzWZ9zY=;
 b=W6Asy736AAvPAUkwbjrU+6GVFnde3IdSnD2WXWwQxIrzTJfLTLytw1Jm2xyae3R6wh5/gbkJk6cWN5gxyKngk1+4gugai9JsXwsdzz5byYv1y8iT6RS5M2jwlmsAejpmJon7l8QhBnJJP9UpxZ9m+6nQTTvAo0EVRnIggA5Pg5agQ1ym/jIBaytxpmQYLKG4mAwXA/5k0xTcKjPuwjLy8g+aYQ0DbjEK3/0wytldDaNgdY3nNWbYukLx+7DrB3VxmOjZtzZ3HMgw8N7a6JahpnJLT8T4uXejl/A3KcWStH12Vl4Iw79We8LX3S9333oWt/69UdyGGucX7VAjvg9+yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qK5GeS4438G+wuSpWRz4kw3OeJYBGQhsiwzGxzWZ9zY=;
 b=mdJ0zwYgla9Lkvc/R+NRYhL/MZzUBDC1apMVWKw2/Oh0saVWTHKlBYwhObX5lWP7t82BzpuhxB1leInANnY39DaU6tNsolh7WRDXXERJvGMDEpmUHXC9BSbKY2b0PNZRRGbbyY8dVJcwzciWnoBDy/E0YJatvmd1qtV4ca+dGJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6400.jpnprd01.prod.outlook.com
 (2603:1096:400:98::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 04:23:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 04:23:02 +0000
Message-ID: <87y15672ah.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 5/9] ASoC: audio-graph-card: use new of_graph functions
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
Date: Fri, 9 Aug 2024 04:23:02 +0000
X-ClientProxiedBy: TY2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:404:f6::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fac36d2-4c49-4c50-82c1-08dcb82af578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KoZKWCcxh1FZvynaTJGS9O750Mmy+Ok1U4D4LGZ41bZvlad/zEzSEZY1/Lcr?=
 =?us-ascii?Q?QytgGegU+nBBGRIpOkKzoaYMVDCpsb+MyrDALf9GXKpzPT96SpbsEYvOWsdA?=
 =?us-ascii?Q?+S0G8qnRZv2LWUoQ9n7+37CUvldP8735fkvYShsLQ9hF8wXlK/IcR2U3/W1g?=
 =?us-ascii?Q?D1enzFwCqmqlQyy126En7vKup3uLt5j5c7og3/gfcNtdTBGQVBvKKHX6oKiD?=
 =?us-ascii?Q?jWkRl62n9S4C6XP+ZjBEYASO3zO/nogG/oWTAlW9VjnH9gIfOV7GojWqHMr4?=
 =?us-ascii?Q?bjusBgrILA558UB/6xsPnO5Oq8EdeP4w9YUxT3FZ8WOx+2KS6pMztufeYjfB?=
 =?us-ascii?Q?CcRkVYCw+GwUOK5it9oTEskDWa4dSBofabroD+7SswM3BIJRJL/pOUn7LLVl?=
 =?us-ascii?Q?ytphn7OhSjo/AT8htRoqaC3gJdjtDLzryz6XcuaiaEHVkrNAmSfs4VUTm31D?=
 =?us-ascii?Q?8hNS9JQb6FfBz9Tj40wGqwLk8M/okRaFBYDyTbGhkmbbU8TWVIfn79PA5PjP?=
 =?us-ascii?Q?o7pXlT7RsoV6sRGDYg/SmjEfzumxZQQ7hDBOAeq4A7a29NbyQqqM/yWWx6b7?=
 =?us-ascii?Q?wqXpZj7k4ZQGH2hzZ6PkRIqqqoe8KzGL5oa56LlxgQbgUihIBLgGfCCdk3R5?=
 =?us-ascii?Q?o/tiqezZdw2N0xK4S4GFLeWxfh2DK9k26CcQRhXWl3LfSencRQjIcez7AheL?=
 =?us-ascii?Q?9qixO7+cywzNnTVmTG0p0cqFDsrNV36P8WEP8BE1bhUoOy6iciFdA3LQFQPM?=
 =?us-ascii?Q?FxyzFnv1bIf1WHjDOswpRHrOCyS8nE9DFE63HpjRsJLTXId2G/AdThc4dq44?=
 =?us-ascii?Q?Bm5WXcvJduAHpw+x1/fPRWGRUMi0a/ez2UBPzpbhBKBXdkCs8Axf+Atl+Rti?=
 =?us-ascii?Q?X8gxZJTXHCcym2ZwgQx3UYNYk55JVsiI/qEaGJv9dM/Ek2CKcSl4OiFV+Gak?=
 =?us-ascii?Q?I1ELJKpTIn4A5cVUWY8sWB236Zjd9G8XEOWNj4HfDSqbkHxo4V8oGkv7oa87?=
 =?us-ascii?Q?Lwvq6//pyAgt1DhhWhT1sG5t781b7Pr22+CkMBwUZnU0+mLYmy5NRd2fVzra?=
 =?us-ascii?Q?kEM6b+T7oBhe4jPeb0bKNpiEVfmwfSK+Yc5W5gy49twVb+wT+SieltwG6qMK?=
 =?us-ascii?Q?4qkq7yBdyXSuuWKeDzWBc2MGyMZsTJ61bLyFm/V9Aisl7Qrg70hYzbOxgN5Z?=
 =?us-ascii?Q?SOJUVxqtP2Wr3TF5iz/aiaNjjpgTHEP9qZW7eUju/dCSkwrIHUpYIxgbfc3Y?=
 =?us-ascii?Q?CQRWohOXCitOgph1X3hu38bTZVv0LHdg1vDqJmT3o0/a981pkh+zw0eabGYO?=
 =?us-ascii?Q?+AvbjtLmX95h17Xb0RJUoDAs423DIvh+3DX2A7k2GDVOUZcR5DT9l+M3OEf6?=
 =?us-ascii?Q?LxZ64+8RxxGelmjKOfvCdTK8OoQ++9y+XyNzKU8td1mxjZPWKLR6e0YaVKpd?=
 =?us-ascii?Q?j+m2C7UZvF8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l4jhGplhiB6Y0limBwtQHlCL5BDaGfze5uAMB06JIBoPVQIZguRzOptF+lUg?=
 =?us-ascii?Q?BPZm0JexXApuiy8PaOzHp7VT1XJ08xlUmKS8E0T0r2DqksddUDVltSZOXFde?=
 =?us-ascii?Q?kYZItdSCD9/letrPulK8OY3bGMYEUbQRT+2ywJvg36BBd5bUu3HUg7fSizy/?=
 =?us-ascii?Q?d17dQUKJ1DYxi9IuQnGyTE1VdJL+uM/+/x/oHinwyGJFSYbEJ1y/XhGnjCfE?=
 =?us-ascii?Q?PzeDUnFOE4jn2rHltcb8vhc1K9SRi+CyQneBzW8QJ6Pm4SGjkcmwfpIMhfYJ?=
 =?us-ascii?Q?WMsGXdkfFAsFN1ts3e2Er6E6ULEKIOfSH+fnI+11h/hiL5OxfJGhKYZfwME7?=
 =?us-ascii?Q?qQgVAPCzgDRnk9ryn3AnqVQ4xEhfPnPoFI77yPZnMXGnkpEkAq0IWFXWDgkT?=
 =?us-ascii?Q?G7035owW4S4kQs0gZ+mhAC7rc61vrIJiO+mf6N49/7VUILheQShSJjSitaZ2?=
 =?us-ascii?Q?lel09YC3gbTyimgP+5EuVa4XkIczrOmkK70j4T/ahh7Kt0qJJd/chu5BdVQE?=
 =?us-ascii?Q?jFv7dyV6sf+ygbb87g25NUFdZNkJJFEB50siVP1Q+8VMGg+YWgl5XqPVShTT?=
 =?us-ascii?Q?3PK7mNctBNFqN7wcIFgFt2121bzlImTrH3vHeCyEwJyEoAzY9Tipy9qb42Jl?=
 =?us-ascii?Q?evBn1a3mHcN+i5aRF57Zuxf+GDvewPXhucmanZmFcjwJ67Ik31ANxK595Ozr?=
 =?us-ascii?Q?TFwaPHLlFMDRoCp84yMidVUbVr8UFHKVmDrxA09mhx8To3TBA96FTARAfnoS?=
 =?us-ascii?Q?1RDi+qmmCDlpy3hJAzlZc7ZCvyCnTVptapseWqXeuO9w/DMVu0Bs227B1Nth?=
 =?us-ascii?Q?Le6c+Z5NQZbLKpp4Aq4WUkx7wUQuQz60u5UMYVBZm4mXCN8pdO6ImO1doiFE?=
 =?us-ascii?Q?tl7p2A7dB1/K2jG9YiBlg/mLCC+Q76aqJpQm/Ij9S/nLNP3DCSQyApxwvQ0C?=
 =?us-ascii?Q?P7uZNHq3xu1MsMNUPhUn9dDd/6+yS7qjj6SKEvJRFiFfM0GVpIGvkzCPJJH9?=
 =?us-ascii?Q?FvbSkt/CR9V/ZFXAa+O/0CAO4ii/PzQrQG6TW6IFGSOABz10ubBl72CusIW9?=
 =?us-ascii?Q?K+lmPBGXp0XUn1+KT1wXfHCp5hcqn6x93c+ToZAB7MzXXiDmDnxPzvX0+qAD?=
 =?us-ascii?Q?2YJ2o/GOYk1+nUYkj+Kqe3PWOeaD2JE2YNvcP1IFKy7ykpv3aSgBUbJiEKYq?=
 =?us-ascii?Q?smoJdgU7MaVXD41XaK6dbeWQpw8PhOk6C3zTacSKZs+wjQQjhjkpViKtEzz6?=
 =?us-ascii?Q?lHeFNI7YGE8PeRRvnK/st6Rr++7ByN15uTlQRKcV/WD5su/Xq3NbsYg5wnSJ?=
 =?us-ascii?Q?ojcposnSAeo4jqrapz06Qmo3HNWhRAI25+/AJrGUWAWwLMnz8DYkV1FvcxwS?=
 =?us-ascii?Q?QyRV8u85/TEne781nCUrL7+hPlEtRoDWCmUPwI2Qv9qfjQNrS8NbyZ5i3VAk?=
 =?us-ascii?Q?/5CCu/4CgLYdJ5cnt1JEv9lpNy0lGM+gunLlEDiB6Ai6BN6fh2z1BOW3dOBS?=
 =?us-ascii?Q?yDRtqw8nV8AntVZ+7qUrrqy1h6gNt3brmpAkR9AW3wVzU0bkI6L4lv/T+xmk?=
 =?us-ascii?Q?SHNNLUbEmSJ2q2J4CG6jZTYy8xsbRG10ISnmxGHgyC3tFPds0fCCU+RFr72Y?=
 =?us-ascii?Q?ArJ+SrRPL2xmI0q/V9R2dK0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fac36d2-4c49-4c50-82c1-08dcb82af578
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:23:02.6943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: folpO/1Du11IA5cbclsJvRQ0vpNAhua4VnmKsJcoOj28zOecC7E+0X5XABIuW0njSkf0UVRJOe67pugc4UoIGXuIYzhL3a9RLVoBq7W0ATmjujtoNiwVKfWPicq7+0v8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6400
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
 sound/soc/generic/audio-graph-card.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 3425fbbcbd7e..040c271e13c6 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -376,10 +376,7 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 		cpu_ep	 = NULL;
 
 		/* loop for all CPU endpoint */
-		while (1) {
-			cpu_ep = of_get_next_child(cpu_port, cpu_ep);
-			if (!cpu_ep)
-				break;
+		for_each_of_graph_port_endpoint(cpu_port, cpu_ep) {
 
 			/* get codec */
 			codec_ep = of_graph_get_remote_endpoint(cpu_ep);
-- 
2.43.0

