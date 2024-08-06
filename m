Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD08948898
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 06:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6AC10E2EC;
	Tue,  6 Aug 2024 04:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="QNHSCQZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D94D10E2EC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 04:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICcMRJEt42+BpjxrPBxJflgT4wKE+9QvlyRVrf7fxrp4uDYOGuu/18tq3D3dBdgFjlr14lIOLVQZF0hmZrd47ZD+MuXdJDi7JZu329VwpoushE6T3pbU64PmZcDjKwKYliVG0Ew0jf7MGP/AaVNWu6SdaQnxvio0Mfo+ne1BuLfjROcMrjeUsOQiuAyzPvu6HQ9cvW7FgQiBRUkfiHfy42obJMZiJbITqGE/jSz0vpkviXOweyAwbmFo1rHL6Ik55BKOB4ztdR8Gj5tvDcBUSvEwBk5qypr5QsERsvbOAepYzvVzp9T/vX8ZJ/ZGIKf7LGBdWqUK8fzpBgiq/i4kFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGlg0CkyULW8ujQcwtS7IKQWgI1PLv32S0wuLSWvm9s=;
 b=n0L/oYjBwSAAuYeCWS7EXhrH8H9SGWy6Ya+wcVlzai4xKpDryWaF6kLlIsjipXM3sTIQeAczl4V8CPvEe0Rifb+eHmBKSIwtUqYXajdRqOgLpi6xvrjsHpHxjHFmXmJf1yJJjzU/KyJ8MNt6qHH+3tJaXTpxkVS17fKrVl6N1Umi/c3kmE20fX/HgX1W2LFLviQfUuqUfr7rmMXTe2j/HDHQ9uLz+ZuyjEDIrNL8Qz+3opP0+oPuSrhCyej2skSHFmqtbD+mk6xu7LoupS0K0ziFr17s707CL7iJpp52BsDtMdyy2WUWO8/kEZkNFq259GPmQegjJKHnX2UpI3mT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGlg0CkyULW8ujQcwtS7IKQWgI1PLv32S0wuLSWvm9s=;
 b=QNHSCQZfGcvxdp7sal+mfvLP/XVzXAXtMIvufz2bJEulqKUug+NG0vcZAENCJ+aGlCY+1TZMBRR3B1WFAU1zx7eEnNl8CfpVdg9tLfItvOVxHlieWbdnAOAF5n7uSEZbJfKAlHVIAOM/F1/UPkabSl2tRLKAbGU49epIRmnqJfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10409.jpnprd01.prod.outlook.com
 (2603:1096:400:24d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 04:58:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 04:58:34 +0000
Message-ID: <87ikwew8li.wl-kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge
 Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
 <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Takashi Iwai
 <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-sound@vger.kernel.org>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
 <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Takashi Iwai
 <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-sound@vger.kernel.org>
In-Reply-To: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/9] ASoC: test-component: use new of_graph functions
Date: Tue, 6 Aug 2024 04:58:33 +0000
X-ClientProxiedBy: TY2PR04CA0023.apcprd04.prod.outlook.com
 (2603:1096:404:f6::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2d3f5e-bf9d-4288-9760-08dcb5d46c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UbUJurPE9Wpkoogtrk7AhQG5msuhNSXhxrZ3fX+F8e8fHhNqoNYSymLb03lO?=
 =?us-ascii?Q?kBbYmFtFd+72qACH5Ur1Y1nHYbe/daHbfV4LYXFrt/ic7ftVsJ5sHqCPCoWv?=
 =?us-ascii?Q?lfrS/LsQIb94E4Vn7Rkhs4EZ9t8GwJnHrZqs/wIpFZy6SBodXmuWPR+sfx7Z?=
 =?us-ascii?Q?YA//ff9PLte3JhipkcAqi6zPdiK3bttkL2Lxc68qcfxVn/A1qL1AlgYCYmTY?=
 =?us-ascii?Q?6OZk27BKLe30SfNUQ0SbnHqmFFUy3UIrcOv6ahlOMZw9DVh3yOnW4f8QueMG?=
 =?us-ascii?Q?4PR4xWkuRtWeMdPTgZyZYtYpv3KVKa3Ge/0/ofV7JM2LC6GX/oZfX53PscUR?=
 =?us-ascii?Q?R2n+YFVehWoIlXSqeOum78MpkKKKKhZLQZeHUlhYrLGl7om96134SbeG1WAB?=
 =?us-ascii?Q?QlZ7nultGHdOkj3pYNpkoo07uEsTXajVns01Iwshk2jrCWab+rc+d2mB2k37?=
 =?us-ascii?Q?KoaBkOBD5gXlEJdqasBpZ1J/u9p70fbU71lDhm6czn72s1BGkupowfo1CbO/?=
 =?us-ascii?Q?sWuOnpGCXgbsQN9j0ZwD4345eqLjag1p6KXtYuPhDEwagarqzrQ6h0CI4vhR?=
 =?us-ascii?Q?lliFaaj/L1XBfVL5zdQt5wy74bQIMlUiSoZ2Swyz6izgsprQgtwmlgZ53Zpf?=
 =?us-ascii?Q?VS7zjQZh8iLfbdZNkkqqCJllmcaIz9ZYp5AeDEXewcnPkfbyItxolE+VwNuo?=
 =?us-ascii?Q?a/I9VoLAiHyGpxr8WVR7U/VrSw9aSaZuE09fcsWIH0zESnUIBYOEfa8RsBWg?=
 =?us-ascii?Q?20//k+0EfnIRIuYRAeieeZhCd9KQTu15Xr0fUJksVNw++1euUVSVBW1vnT7F?=
 =?us-ascii?Q?JITjAca3v47L9T90wL0hc3HI9+8ms1rlIIbA+C7TxrNIKe/6Ip6SHFkIKKiw?=
 =?us-ascii?Q?+1Svg1u5NMTtacU/2p4dzxIlPE2dvxGlg1pMib6Yue2oksJghEqkKTyVfVwR?=
 =?us-ascii?Q?nUuKYmiuxQF9SVzI6ljzupwXmHUoGCukziantIeZKabeP0eqJDhhKIAwhnzD?=
 =?us-ascii?Q?cKTeZQio3/ft0TKTgL/zxU6LmUPpmnrYjsKxPSYBYuG96CyafS1tZIGESMs7?=
 =?us-ascii?Q?w5+qIF5GhMfnCcWlgg2dnf0tsigBuBEL4g7QtJC2sG3Yk9m2zDTwNGOeNUuE?=
 =?us-ascii?Q?WFldJ+zhv0hCFwLPN1ZYKv7oBGaA+ZQqc5vQg6EH+LvURn7YZH75KnRtEiLK?=
 =?us-ascii?Q?5o6+BffPgAiwTDkXOrVBRGoD8fySlVXqshoCtR4S+tYIVeHmPWwLAMouMRJE?=
 =?us-ascii?Q?9obiBS+nda8fCJQzn/nMGAhicIOm/2tBC1XtvSoH8Q39ZsABebQrqybHh6Y8?=
 =?us-ascii?Q?liMk+R+FarPcdS7oVKHZbKj0Gsk0fFrpw0ma2wqwH29lbDZGPpeFY4AXMAwS?=
 =?us-ascii?Q?/jqZJ5tyiOlb9Hrn71eQsN4LEXKFuQWKSkT2ywBbgBcWJr+6Zu+yJ5uZJBLq?=
 =?us-ascii?Q?50UrL7h0dsM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HAktsz3sk80k7QicCxXbqRqKLcJnYgFB43z8J02ND6qpTYXHbyWmqraYX+Cx?=
 =?us-ascii?Q?PlddaTnInntXk/qt+EVfx5roE1zzC4wmaQKIeOC87MYJaQErr9quGRnpFFOV?=
 =?us-ascii?Q?x/cWpR35z1CYE30LeUOr87FUGxmU47Ro2POXx4bnt4FwGoMW2CMYnU4OGEEt?=
 =?us-ascii?Q?YxIoH8hR8vmLM4xG1jk056zXKUKHj/MlOOAF2WYmgQ2wAgG30w0bYpQIJckh?=
 =?us-ascii?Q?TYdKdPaQnI5Mu4ixqNyFCKRIP5x3YYk3n5zb8d7Rb1CSpEZKtVBVR+qoLi+a?=
 =?us-ascii?Q?TfKa7TQ0jnDNsNz+wrOQOP5R0gn1hrFir0Us2fxugOAYH+otPkKoZ1MOtdET?=
 =?us-ascii?Q?EvG6K/x0wpprKS0T2fGW7BC26qg6/y2LMbGv9bjsMUFyMGtk6wt7HOgwB9Fq?=
 =?us-ascii?Q?nN0ZmH+YvImDdhsWj5K10gb5KejOXiGD6CdrfkzwKUkRK1k9q66rxKQ33pKa?=
 =?us-ascii?Q?0evqV9Rkpq5DTAov9NI4AH6P8w2Q09L/zRFeuLC27XcSCm31ruwbF3g6WRKy?=
 =?us-ascii?Q?QAsgBQioPZA6W9KZvk5WvFyv9xHKTDGp4LmLBwlHvP6yJbaageVH8t2Jv8CO?=
 =?us-ascii?Q?PNEeRPnkSyPRjpKyesvIXoOTd8fg00PybGYTcZAEdWARX0h9LyyaIXH8e1Lr?=
 =?us-ascii?Q?GTI+OzqqK9Tm4N/w46kZIGcsSFr4Mb6U/9mlW+yLx0R9aZT+clQgQOQHE01Q?=
 =?us-ascii?Q?Y/Mfwct7BwR9L/3+YDDkPKugmV20YSFHVZm0Gwaam2inSb30Fde1tPtLaMlG?=
 =?us-ascii?Q?T7dpLuv4a2V2alD8SP2GdgZmoKzG1ET8xjP1qo1hzQoajJ1UWE0ZUUPVCbqv?=
 =?us-ascii?Q?+aEAOMg/EqfghQZBQYKLYqoWX2drgieGh7A3t0FTAhCNktfc9WvAWnurkp85?=
 =?us-ascii?Q?DN4Ii0nYxAblSgvfdrh0xmYYiWKpfDddIjkXAcIBSgvMAufuYmcC4GsTUItW?=
 =?us-ascii?Q?oSlVurNcApnKU6sax7DiT2n6j5Itrbe6zINDRQkI+Z7XjoIPHdjhmnYh3u9l?=
 =?us-ascii?Q?0MoowWfNGKwbad2nyRy+BNK6uvHs4TYaYsQNp3h8zFWQohHPN9O7rj9ntVND?=
 =?us-ascii?Q?hDYChQM5Dgoc8dUdUe8/riItyoLsZ3RUBgtXdAb7Wp8HN4YZKtDgkcrq2/MU?=
 =?us-ascii?Q?M0/8IenbNHspH66G1XQOxTGWgNVPnbCVyNp3btdiZVoTWTLWi1WNiztwiZe7?=
 =?us-ascii?Q?qMaYT2JOs2Pgh6/3XIZgAzaysx+R1YCqHHzVQKnCLVn1hxMjJnd4bds3sRki?=
 =?us-ascii?Q?W6yMmAXLEHxbyKF5GsYreHc3iQax5CPkVo1m2utYj2rjBFodOS7n1pzrjgu3?=
 =?us-ascii?Q?cWwAXmMsVbig4v8ircavnw9vtx12Rs0Ln//btXlgTLywgMMpIpP2PF1a0kbl?=
 =?us-ascii?Q?8/5Q0kC0371wa0ZnVwurHDgd8pGCzTHe6MRiaQY3HLf2StWc2zDqeLJZrLg/?=
 =?us-ascii?Q?QdEuT30AdXOKyigwdcwuzAB5k+fF2edGHFzs0HJPyt5khZPgrXJ79O/Dl0hJ?=
 =?us-ascii?Q?GUlum8+mA9YZFBBPJFo+R2f0AnTmMNjDDVnP3m2VfwEjSDQ5RAvmNw2fLyAf?=
 =?us-ascii?Q?xZ/7S4d4CiphHM4vLkJwNx3az9L2ub6jYaQeSs0gA4p9Vfbdl0MldA16T2Mu?=
 =?us-ascii?Q?p6z68knngWJRPHJiBZOJQR0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2d3f5e-bf9d-4288-9760-08dcb5d46c9c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 04:58:34.0671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pukEHgKHAj+CIhsMwiQQXGtgfagVXU27YTMdP0y3K2wxIICkAia/WRy+nr1U+th7GroWn9s+oGPF5zgks9Y/DjZkSk2C5QD9bD0DpfyT5A3Ie/GAdcee/ZqqRcFdeEFb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10409
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

Current test-component.c is using for_each_endpoint_of_node()
for parsing, but it should use "port" base loop instead of "endpoint",
because properties are "port" base, instead of "endpoint".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/test-component.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index e9e5e235a8a6..6f75da9f86e6 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -600,7 +600,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_endpoint_of_node(node, ep) {
+	for_each_of_graph_port(node, ep) {
 		snprintf(dname[i].name, TEST_NAME_LEN, "%s.%d", node->name, i);
 		ddriv[i].name = dname[i].name;
 
-- 
2.43.0

