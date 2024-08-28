Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B6B961DF5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 07:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2C310E4A2;
	Wed, 28 Aug 2024 05:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Idk7Z/nK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDAA10E4A2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:12:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otNjU0w5LT8tLNqd5AS74MJMlVyAXrqYKlitXDq5bAZbkF59ST67HFwrHkOiVBOXDoyMw2cjj5RBtg8yx8ANLfze8Ws3RTCqW/QmPgOPyHZ2IxM82ky/J7z1fIDAJfk/YyY/QXq2ELwcelN6bORmId1JxK9SVAWFypLzF7BRZO2iQ2MwBNyOAuhwUmuqfJMuLePpYMQPg+nVuVd785MAjs7brWPBWfJv4vvRf92E4vIrD3jnKHBnE/JM1qQgpFQiUT2EHg/dw40mJ34hMiP3NfyRVQuUuuTn6blH8hj0hYmP19awEjfmflfZ6u2+F1euG5GlbOXvIQG03VLprfMcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkJ0ltVTSz196uhSee9Ig9BdLX9O4PwwW/k2og7b4lU=;
 b=j6Akg7tvSAYNshTF6VJAABcDrovwO++eHtz/BTJZHBp/oR4qwgENotQoz87O4VIcIPGfFO8eqaiDx1duniIDQ6SS3znB01Lvx3kr8XAKJ1itfg1vq/tAU+wbNsEMZEtSKapunJRXDRnd6rsZ7PXBi2+c65CS2o93Ymazt31oc8c5udMmd6g/iVI8U571MLc3YpgQwytfllDkIoo/Hszp7FIKS7AzY0hISG/8gUU2zFupXrgw59rSwT/hdQdEPLlQ+gShR43f37gb7vGS1h6baLzJn4J0yy7trcrz8M5XOUrZ1OgSKP8LbMwBdi5q2ybnWgF3EKQmtTKXbTSfM6mJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkJ0ltVTSz196uhSee9Ig9BdLX9O4PwwW/k2og7b4lU=;
 b=Idk7Z/nKD36/s93jIdS2Pk8cY4LzadawbIhwgkDv798YotxXhvUAKG2TBnK0AJGwKyQsCtA6KSJuXrHqfTsXPlRqin/C2esYa8/85LYp+p7Nc05xS75fiOEsPSrREZAe/NY60098zHP4INZl/FiHqwWaZ1IIsAViRYw3jBxCXq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11955.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 05:12:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 05:12:04 +0000
Message-ID: <874j752puk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 5/9] ASoC: audio-graph-card: use new of_graph functions
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
Date: Wed, 28 Aug 2024 05:12:04 +0000
X-ClientProxiedBy: TYWPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11955:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4cfee6-ca7d-4b79-d921-08dcc71ff4af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9dtUsMeq7gqRCokoS6yimRH8H+0jBpYZpIkazqyCzZjMrW7Zh2lyFFTPFUR1?=
 =?us-ascii?Q?Ih1AV06flYFd2vE0OPBisbPK5wajzHoF0uD+KcqcUVVOC6UhxRxPWKJqlxZh?=
 =?us-ascii?Q?7Oj7ZgQnn7gpVrDmzeccB+M8eGW6Teb4TE2ZK5QMXHrmLmFVg88Mh2SKmhLy?=
 =?us-ascii?Q?uXAyrpuxUk5E8/p4gwAI47x1Fkje6M0lwDeD3bWd5djTQe1XxmAVD1HOTNeQ?=
 =?us-ascii?Q?W3yPdAIBkPwwv8/IPm1W4jzM3j8lgj7m5OaLI0BlKHYId0OUVSWuApp0r/pc?=
 =?us-ascii?Q?1h5/NJSHfRgsjEfQUyhEZwbOUKtQKbeJcvAjcmS8wfDa4ItTxyAzDMavCqPL?=
 =?us-ascii?Q?yxuqRqK1LG+vuAHnoAOISycwqKdcIb5aV3tbh6HKeSxHiVRM/tCdpOQBCu00?=
 =?us-ascii?Q?7DLDxHXTzBadtM/K6egj443KQ+h03qIX+5b9qyO5xn6l6TsiabXIcb9P0rz8?=
 =?us-ascii?Q?g91UDDZ8uaYmNc6/5aohxVX2aRaUYpl8Q7sMXgtiATvxDZ6fxA8JLawEkfDT?=
 =?us-ascii?Q?1c16cKsmL30WABpjpTbAUKmpFczup4bZs4uNbxs9wkTfXQp6Ql16gFl/KkpL?=
 =?us-ascii?Q?X5vqDYdbk7YG9DOXLZpmhmY74r9EasHlLz70aOLf8LqWEWS7ueqE0FrbnxM8?=
 =?us-ascii?Q?aglMPQ+33Vx1x96saTEdx20fkOOOc/75w3P3Rkdnf18++urLKpcEkN28jI4g?=
 =?us-ascii?Q?AXEDzRCFEd372t3UwngpRLfWBrzwv+p7perMw3/XOAt8SUwpRBwSjGKT5lve?=
 =?us-ascii?Q?sbnfXOgT+UU2QNUmluTGL/vUUlVmqSehBxuoKpy2qHg/YEr26sDPUN81ZEiX?=
 =?us-ascii?Q?ZS7yV1QZUSd0Lv0KSBVc9cxYYFvbpSqSq99gIXSRUpveODod7Z0yGr+PQVVs?=
 =?us-ascii?Q?Yuc9ZftZ19ZmgqgqwW56y6W4nMSbIUYLX3wygiQjeDl/RZMAA2GHQFVn0MAi?=
 =?us-ascii?Q?lrzsza1EKIcWzdW3klhLtFjOGokrKyntjb1IRQXhmQg3CsnFV2eulj65mBIG?=
 =?us-ascii?Q?XNGGuISoNb415FRFy4L2/XTsVsbAeOwh/LnP2wVMIT+4H1QxU9uIdZcyFFq5?=
 =?us-ascii?Q?Yh0TBbsfZm90UQRciNTIv1pZ1i5jDzNEkt0x24dEcuCXdya12ZHUq779PqAo?=
 =?us-ascii?Q?jbrPPG50BAK7IHWeKe3t6jwQwwcuC0xaxF+S+nZZLcpiuqtX5GhEgzSFuEpN?=
 =?us-ascii?Q?RljFhKJxrWogZ2WWeBmRal+xtQOya3IH0JfRHS478EX+H4IsN3+eFQ0Pun9T?=
 =?us-ascii?Q?2aLgeExl+dC25UpBimioIx2YfesNAgNqboIzreY4gDT+dVsj2+Tznu03X06D?=
 =?us-ascii?Q?oLbTTmv66HF/58gtHLDB42h4HYfJoekOSji8Dg1IfMGA3neV69Qn6PW4J0oz?=
 =?us-ascii?Q?d9wy/MGi90w/9iXEGAk4+20mxtMEofgFp0OwTtoVN4gF5+u7LjPdHsbIBwXS?=
 =?us-ascii?Q?7Q4BMHhE72o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3VK+WfYoJ4ChqaOtFnkmZ6wHSGL6epTCFGXEpkMcuOchCeJbG99ApETWQG5p?=
 =?us-ascii?Q?mySvY6B1pMbjjRNj8rShoPsg5BjVTwTLTw0An14zg9/g5EDpoe+k7NfY4KDy?=
 =?us-ascii?Q?+H4biHVv7yrIqihpjb+MuqE7tlYc0TiXCImkhMv9HLPsQv19gGbzBK7fAz1e?=
 =?us-ascii?Q?aJc2yuEhR/l5Hv9L2k/+XiF4HgdPHMIzr1fmUSKK46hpakbkmW/00rVjimth?=
 =?us-ascii?Q?zF21BpJ9PyvETLt0S5u47xJIxmSbtSMbIPC0a0przigFEImgU7kDwya47nY2?=
 =?us-ascii?Q?udXBiuOrdTKw5w+siZdNCSUtBGTELlf5hbfTYw5aYrJ4pbhHfU8YsXm/HnP5?=
 =?us-ascii?Q?HvIHBt3t7ijZk2ZH4iVHA+RNyijEgV+W7TtqlRS/4KiDBWOpi3UktPObEuh4?=
 =?us-ascii?Q?WGwVkxEq3vMqby7dkot0YbejxdQ4AONLsdUUrxpMxwr1SNBIK3d8/bFYSJUJ?=
 =?us-ascii?Q?v7C7w8QMEC2BBpEqZOYL1cYWhIW1hehQ+iTrNCvExNlREazPhKxY9LPl+GQ2?=
 =?us-ascii?Q?P+Q99I30wlBqr0WUWhxA4+ejr6fBf2aVmwtyBbUW6LmEqID8Ex7Cea4eakW7?=
 =?us-ascii?Q?CNcATH/xWI35/U/3IG92Qfblm/nNRfRMS7zfX8sRGtrjuYTotWWGFsCf9maU?=
 =?us-ascii?Q?LZ5jlEdX82aEtONl9j9CCzA8qoKa9e1wEmH8x3Ddz/C2TlEMjrAmAAIPBHEm?=
 =?us-ascii?Q?+2yyyol1GgC7vyZxegOFoGNJM9xhozFGF/2KunV/0dM6wqX/b2pVUFBehNZP?=
 =?us-ascii?Q?bx8q1rgaF2DmCe/DOHGeifb9ylQuy9aRAXw0CFymfxa7GxK8W+q1xjT/n/JO?=
 =?us-ascii?Q?QEGThZMOABExwBPEuZpLpBUNreXJL6LjzbU0pgY6Nj2vU7UAvYxuv0wHiDRW?=
 =?us-ascii?Q?42+9OAdSCs1hNXVs6zVkAYbFAUkDiNvTAxAVDlK3kDtgriNQw2yJV77Pd6kG?=
 =?us-ascii?Q?+JQ8o5USS0BYAnyD+bd6RKdnjjWXSm8LRkvVog4CGJlJkVBcIFeCmG1sTJwe?=
 =?us-ascii?Q?TreBMFKSQTj57eUMoHsy7jhDH1LWfUPE0ndIPp+m6MaFwdZTjlZw7gK3Q2jm?=
 =?us-ascii?Q?7Lz2YozWwkH4fAWJIyvMlG8d9kbmnVudunhJxLzorykbQPYZVba/b/wWZ5Cn?=
 =?us-ascii?Q?B/R6IinLi6RSxbGPZAnX2CKSOlmdVHMsYJL2fLCyJGUlVZ0Y4KyoRORRVvk9?=
 =?us-ascii?Q?7Bq42qX6mENtRYxnvyHn9HXbHEpdFyFj5ZN5cpqL/r+FPyR2npW1YOVfXo0D?=
 =?us-ascii?Q?+BzzszKQM8z9TJb84UJXqNvcdiSaKRWNKt6vw3Vd2RmbpdV+pu+tAPQwU3oN?=
 =?us-ascii?Q?+QBgtukLHZrO2Qz1nRyXcnZPVHKYZHAowNNXS1ybaZ81f93oJ4wssjESEKMK?=
 =?us-ascii?Q?y+gaECwSV4f0ZBq/GPQMIkYVI1QT4YEYNgjcRUbFETNKd0y1Ar1L19cYx4EF?=
 =?us-ascii?Q?Q1A+I4mSQTdxk1U0UPIEA831DUlsC0qg8kUHdnzglB2hDLpwviINi8saoofJ?=
 =?us-ascii?Q?4XR/B9fdZVAiviTku68/E9Wy3xkXAjREiZs3YmSa9mg2DjIzzX7EarB9awyo?=
 =?us-ascii?Q?05QEQB16f/GsltYOiwvSZfh/xaDCTX6poYS13B9RJ1LKkoZxRT/cxVy7kziH?=
 =?us-ascii?Q?zpRRSEAd3hKJhiFr3AJWdL0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4cfee6-ca7d-4b79-d921-08dcc71ff4af
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 05:12:04.3494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vdc0pQxlxt+kde1qMEzA4g5rdatEzkFwPwKYHliBV8QVkVUJHp71PoO73IJRosLs1ORKL1grAa0bY4Q7n2+zwTZ2Dj3fMMED4iDKK1MvAisSXtRYgijQug/czIDzb28k
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
 sound/soc/generic/audio-graph-card.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 1bdcfc4d4222e..e7fd3d70ce091 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -361,7 +361,6 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *node = dev->of_node;
 	struct device_node *cpu_port;
-	struct device_node *cpu_ep;
 	struct device_node *codec_ep;
 	struct device_node *codec_port;
 	struct device_node *codec_port_old = NULL;
@@ -371,13 +370,9 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 	/* loop for all listed CPU port */
 	of_for_each_phandle(&it, rc, node, "dais", NULL, 0) {
 		cpu_port = it.node;
-		cpu_ep	 = NULL;
 
 		/* loop for all CPU endpoint */
-		while (1) {
-			cpu_ep = of_get_next_child(cpu_port, cpu_ep);
-			if (!cpu_ep)
-				break;
+		for_each_of_graph_port_endpoint(cpu_port, cpu_ep) {
 
 			/* get codec */
 			codec_ep = of_graph_get_remote_endpoint(cpu_ep);
@@ -408,10 +403,8 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 			of_node_put(codec_ep);
 			of_node_put(codec_port);
 
-			if (ret < 0) {
-				of_node_put(cpu_ep);
+			if (ret < 0)
 				return ret;
-			}
 
 			codec_port_old = codec_port;
 		}
-- 
2.43.0

