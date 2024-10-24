Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3EC9AD9AA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 04:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16D610E889;
	Thu, 24 Oct 2024 02:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="LPIbXswe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D6A10E88E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 02:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kjq1NsJRS5SoNyvBCoqbv6zSx70dMtSNhsDfoXQ+v+dyXY1N3hvpkSs8aQdu5K0z+c60zDTQlf0K6o1NAa4QJAR8t3WbhM7ZxQU5D1a6U4BqO0hKwjViYTV0atXqQhcMzS/8OyVdgtlIg2BqrwHSWdg48X6zuAPNntRbnmqzqUNa7pn5/bx74Z1fSE558v5AR32Lli4hmF6DCWwXQudQ80eLik0E/kD19j1eVdyyJ8i5/IPjFSgt4EBVWOC3eFMZc+/OZOI1gadVKLreYdqjTsp8wkIOOTEjmm0cHoYQwvexVmIlakFQpcR2z4DgEBGnrixcAi+pUbAJdZpxViM1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSnStjZ8WKcPDrgOADlCc4YL8xML+60DZSrHpdifn6I=;
 b=mkZIm8hEcTAgAimbCmjM3pBOCe8032FFS2ulX3o+ftvHYxXbZW0qcEXaYhWVLNLFXMA97yvpfbw0AkcHXJPtK4VNnQNWKUngDQlWigbQbWp4z1e55MzAaCLJvirGTeS6eEaqe/fOjidSoCLllZ/mdwDZ6PDh5t1LIXn19EGVzBqYnbpj8gykL5rudIlEi4fq2Khd2GgTF7MboxaFPkfzNCh39VY89PyVJaR4whEqxeBr7vTLJcKoujN4P5mRlD2Se8C5AtRrsF+CYSeDqnORiSwYchJFyJbdYfixL25NiO5Qi1I8/3pBKVBWFUQCDbNflboeM6EymfTrKt5q6YKLMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSnStjZ8WKcPDrgOADlCc4YL8xML+60DZSrHpdifn6I=;
 b=LPIbXsweiEuF1BKE1lthqFuX0Nz6+UQFtiesHNBSidtUjKX5/q39LCXAZ5Bu3lEzzx6SGxNlWZhq9RQeY6tmHf4NnWT0UEO501Q6gJAFRtREYFUfmcDTnlWVuOtx30y/p5hMR/zy8NJoCBRTn26uPeNM0d6SWJed5tNHF0HQ5uQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8629.jpnprd01.prod.outlook.com
 (2603:1096:604:187::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 02:20:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 02:20:21 +0000
Message-ID: <87fromb5sr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 5/9] ASoC: audio-graph-card: use new of_graph functions
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
Date: Thu, 24 Oct 2024 02:20:20 +0000
X-ClientProxiedBy: TYCP301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: defb9b9b-f855-4628-7838-08dcf3d26927
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VKsILg2cYcLAncm9DRPzJd36sIKLiKbzsBGSyVCL6apFPmFQSwu4Wo1cG7C/?=
 =?us-ascii?Q?07aKRrc+ffXKK1OiOBO7+H7b/DGY80fVhaA+ZDeI9ySsEkW6ObrrpEapxgez?=
 =?us-ascii?Q?hnnQkpjhRL/5FwJIMMDKdpE7CWd4L5xrP8cYfmJ1qLt+Sh+g4rr9wP9M22Cx?=
 =?us-ascii?Q?S6vNf/KMN9cEchW2zb+sP/xNeY4eBTa+iTZyLB9uoQjjjpJ+qjFEKpIyZ7q0?=
 =?us-ascii?Q?buPI9m+XX/cH5yWe9uclBeP9lChkmwouyDvbnY9mEkkiF8sISH8VE/vHlRHz?=
 =?us-ascii?Q?I/avFpkOVdenhn25eWbkr6q3XxdSP1V1+McRrxYSxmI1sqTFZx9WujZGE1ke?=
 =?us-ascii?Q?WyYIBCgL2xuIUA/g7v3MYMo3vwmTbSoEXAhTka5xQBorz7KmR/QWIz/mUToN?=
 =?us-ascii?Q?BeVc4DYyXMsGDq7TnTLfqk3RM3g1emlMaQRajhvvOU/HL1C/udDt3J0qpPGH?=
 =?us-ascii?Q?fdsnn4ZucCMz/7uNcgOfxbN+ti3eVPPPjJBhvw8uIkVn+lr68rpiJgmSnj2Y?=
 =?us-ascii?Q?027bTnGiXggBA5yevAmZ2r6ha9DhU6DF+RvXTw+NRkXeMChVp7hssuuoXpkv?=
 =?us-ascii?Q?gKzJPpqXJxnUe0Jy844uHViUZvpGKqgl/yXqtiUn8cs29PhYfs7w2M2cwd4q?=
 =?us-ascii?Q?kNGYpE0PF40WVQpTqPcCj1seTn3d/tQvVpV9VGglWSjidyfApFFtRZFJwQNS?=
 =?us-ascii?Q?R4snJQIplaGH5m0Fj8jAw/Ilnju7DGd6WwC2dceHXPqqncnnQaFDj3vq6s8G?=
 =?us-ascii?Q?HF0DXYwFS7KQQAidAtafPRh18EkWb671X5vthWQWYlJw4uZy6Mor4QQ02sqf?=
 =?us-ascii?Q?By93tMnv5pPnCsfP8I5A7diVo8eVBN7O4sOK3kj5HnwCCIPse4yIn7KZgcab?=
 =?us-ascii?Q?esm/q1EBCNDKJ0Bi3+zArJ60u0zTh82ZRRvtZIr9jcXazVeTqVEw17zGt+Oj?=
 =?us-ascii?Q?6CXlV4Pas+kGfVWUMXzOz05JhpAL8lOwT7ZF8jghaezSBNg7EzFoeW8gBWk4?=
 =?us-ascii?Q?xLERK+uo1nYbz4TaPVZL3I+N0d0xpGqNRDXT9txgnUI7tH3v6n/57pKcbcXK?=
 =?us-ascii?Q?BhArOGTctPddbEzh8dnF6KWWDByKJpihySQgbxdjTHJmKUB8jBF94z3gJZ8D?=
 =?us-ascii?Q?hythJTNtSRX/0sZPfm3VCclvcC5BQUTtR5Ma0/oEmdIjmyL1TjaOBSPNHYNl?=
 =?us-ascii?Q?aGOe8qXZGLmnBMkUfvfa+zToDkr2TDWO6K72islyTwKjz6o8L++5wZYj87U0?=
 =?us-ascii?Q?OoCOxtWB/sR4qO8CafKbi8fnoSG29hajZRkMCtcsUY50mnrz/Tbct60U5CI8?=
 =?us-ascii?Q?wt9ze3y3LXfimAApeihua6R91EYqfjVbEMaBeKh7gqsxBj6uColguNJIG/Ks?=
 =?us-ascii?Q?2TgHlCdzsBpPGpt9X5QnMWCoCTwy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hpAg+s7t1YmfqPAMmFc93VjY2gU/M0b+n+gNv16IfT4k8cHtS5S8kByv44qz?=
 =?us-ascii?Q?B5lG0YnA2+DU0VjuSXIwLvk1mzAYOrpvtAF3rZXtQ2Ux+mXwRdhrHYHig8d7?=
 =?us-ascii?Q?8N4Zey+Zs3xYjCacCgzc5jHS7c0X+W1FRR0Uba8UmmfRqMQ42fUea0YLspEL?=
 =?us-ascii?Q?dTG+KUqIJCWYyaYbtuHXYOMvow+Intge45Q6mjvj4Y1hjqM+/KWJcDiLY0t8?=
 =?us-ascii?Q?AVMoH04aNnrxMddoSZ7/7Fe9RMrMmo2p9u8TYauvIeTar/ooJE/vFt1NqTm3?=
 =?us-ascii?Q?R7XSLonCv1Ug8dj0Q8pjJi6pVL5Y9TuC7SLGqaHEhVuQf6+a9WgMJa+msgnL?=
 =?us-ascii?Q?gmY+TYqODaziXE8lGhX0xcU4+YwhpcXgus6SFWBLH5d8Vf+o8LnYaijAc5x2?=
 =?us-ascii?Q?reL70DHtBfHkDRXVHv4RrGI0EzXn8ox1PVmBwHq++qDt5gFfigs4kDeYcYPa?=
 =?us-ascii?Q?UxNOtPy7mYBodsMZWcBJjNbyHXDn4CBglCdmCqj5h8p9i8r8SwpX8aJ9tZSp?=
 =?us-ascii?Q?xsbCRMpTpf5/ntoQf3moVrxRy2L01helEFUF0+MCZPZMYULTBnOj4f4MYDXw?=
 =?us-ascii?Q?VQpy/1wS5Nrs8Eoel6m/4NZwRXLyWub3cVYnsx7FklvQpK+NOQ0nk3Gwivqt?=
 =?us-ascii?Q?xrMZo97TduDaoX3bjIqYJpcreRR/+70gKMrH+ScRYku6ggTPF02Fqx0KDMAD?=
 =?us-ascii?Q?MlwTEZ3YXeAzOw/6Uko6YIGvXYTre4xRxoDIl2ww+G8bpDK67zzCA+iJfvI8?=
 =?us-ascii?Q?h7Vs3fINuk1yY5DSwcFgLy7fVGSNsj17cRhzNdmvUtz23l1T4YLwTOxI4UFt?=
 =?us-ascii?Q?7sPA7Y/J0KkQZT9IJOUwf92qBKFwV0S+rcOqGClWm/i3u7S41yytA6s0fDMI?=
 =?us-ascii?Q?y/4J4GPiyFpfa4xGkGwz1oHQqb1Mo9clJREf7YzjUke7H62WqYNkYkZLMh+b?=
 =?us-ascii?Q?QWMeqUBSFMvHKJZCLqHzTweHvTEi9KrcnJ04LSdZRLWPN3jjKNsE0eMcBeCu?=
 =?us-ascii?Q?SuqMrOlioxJQrEL1GaLXBMtmUFeskHAk72mGrXJtLb9Yh8goXSB00LlYeZkR?=
 =?us-ascii?Q?u9s6zVEQGd8DYyawb1B5sAGYCfXVQWCdBQwyuL0+4vf3RCdb2A576kRz/5pU?=
 =?us-ascii?Q?+9K+knzCmu/5WnXAtpMLQXMQRQTmyxk89ayJstF+OgDerTdEqw2v4IVJIi+z?=
 =?us-ascii?Q?tLMYaYgJluVc7Vx4X5t7ZK4e1vKvCNmkMVzmNmtYm5+jMhxWjNHPaqOYmFz8?=
 =?us-ascii?Q?P17qo6ytkvlzMoA0/BzOVMzRcGk/5JHl00i66iEr5xS7BW/4N3zpn0BKgE2g?=
 =?us-ascii?Q?agJGkqtfrSISRJhLckwYOsZnvTf21yFaad4mWPRk7OSf/jMhQLzejcJ1DqRt?=
 =?us-ascii?Q?qddCmmJPXKtoVsTRbEI9dm4s3N+8NFyFnRpDgK5azfyjCi4XkG1hvPcLqKC+?=
 =?us-ascii?Q?5UWg6KD5VUQlMGwpdH6ycj6WaV+p5uGLQyX/fPoO6NDvE8R18TC6bIiOY3xy?=
 =?us-ascii?Q?esu6zIKCNgtNkx7d2OsNuNQfhSEqVzJ3xM/iXeQGOKduvSFe9D2YIcuVUoUN?=
 =?us-ascii?Q?x4m+9dUXkrJPncNT+bSCYzRJHmLAKBjxt3xbGosoDNPjATAF8HYLAuLWat/V?=
 =?us-ascii?Q?3N0ro1LReKo8KAAkyD9jk6Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defb9b9b-f855-4628-7838-08dcf3d26927
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:20:21.3888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrR2Z9UBdVMEPYzEzmouJEY8AKHaKxVQkbKqZEyBs66SX/p2/LvyNvzao/skk2HE54bTTfsaOI1kLCuHxsZ/xlfATX1M0qbLHybinxhxbzz+7a3cXmUG888SBiBYUnHR
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

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/audio-graph-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 4b384475b9726..7655425a3deb1 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -372,7 +372,7 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 		cpu_port = it.node;
 
 		/* loop for all CPU endpoint */
-		for_each_child_of_node_scoped(cpu_port, cpu_ep) {
+		for_each_of_graph_port_endpoint(cpu_port, cpu_ep) {
 			/* get codec */
 			codec_ep = of_graph_get_remote_endpoint(cpu_ep);
 			codec_port = ep_to_port(codec_ep);
-- 
2.43.0

