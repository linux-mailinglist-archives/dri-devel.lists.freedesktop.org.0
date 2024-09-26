Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA572986A10
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 02:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0411910E874;
	Thu, 26 Sep 2024 00:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Az9IIVsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010023.outbound.protection.outlook.com [52.101.229.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1056810E874
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:00:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAj9+mUOntkxsLKEb1TjyoenrM4IYf5Ix1dPC9+LiyWSoYoHCYkzzCF3l7E1albWJ01hjjMEY6byxKsBrBxsnihoQQC+s7c2nx8Va/4A9D6mgrrQ/As9V+Hc2mMHlCL9QKRs06QYfJlG8iYYvpJjrR8MWlyCfVktEJ4EmDm1k8g87KJxDuR3hCHJStGUhf49JmSl94rtDT4FG+XTRzzQMXGUIkItC4tJm9wQgFajhlaEe+VZpmi04h+DYF9hhGam9y/rudBVY1ZJpD/+z6vRPtJe4ST0EnkX4REGwjLFmeQc4p31k2q6vfrGkf3uG1BcAjoVOESUrzZUOcV4IDJ+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSnStjZ8WKcPDrgOADlCc4YL8xML+60DZSrHpdifn6I=;
 b=e0L1WFdRrbvuUshCZTpU8W3U4QvLM1atxuJ6UqELmPo+ndyJuHztfUh4RkIs/4VSTKaVuMDxStTK6Am6m/ERDzu88USDT3fDcl44BdnM4dD2dEpSllo4btDQKtmW7ZtSU1fmhrI9LMmTSxAF0faoqmqm/+Ccoj4KPFgfxja7pDxDbM+2lvxS7jm92u9zniukMq1MHdwRQ683VgEafu2dx8fS2lfUoL6d1AulpmHu78Ee5wP44Bc6WmnIzVMmFoBojtATQMtMqVR3dF+0fNr5rM2yia53cdJs/Z3s4U2ja7Z3cy8K6TU/jh6ryytyMXxuzKmXvspmudMPqk6xBRSAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSnStjZ8WKcPDrgOADlCc4YL8xML+60DZSrHpdifn6I=;
 b=Az9IIVsuWUHBz4mMEIR82Smj/kh2UzcWNhbiFqTMKbN9X8tQKnTEw6VbnJhlSXh175GrYmbEiMIV7cpSMtFiCofG5VzRqkTkJg7SieKA2c6p8qrdejZF5RxPpWvQykUvgBVZN9jgJVugmf9GBzdKWFXMVcMBXca+KsfU6gQGatc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB7353.jpnprd01.prod.outlook.com
 (2603:1096:400:c6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Thu, 26 Sep
 2024 00:00:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Thu, 26 Sep 2024
 00:00:36 +0000
Message-ID: <87zfnv8esb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 5/9] ASoC: audio-graph-card: use new of_graph functions
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
In-Reply-To: <877caz9tdw.wl-kuninori.morimoto.gx@renesas.com>
References: <877caz9tdw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Sep 2024 00:00:36 +0000
X-ClientProxiedBy: TYCP286CA0302.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 04421646-71fe-4f3b-d325-08dcddbe4005
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B5jGYJLZl5glBAPjkXSE2KtLKn8hc6XIPXszVbLv39IMJin7fi/uGVRHE43y?=
 =?us-ascii?Q?nd5NVZu6op7Oy5ewR1yK+6ijsMlQnvf1ps2IG14yzVh/qY+EBtJRzjWc8n+n?=
 =?us-ascii?Q?C2O4XRzbu9lwfJNU+JURUDF9YUkz3xecJx/OIj9VqsGypqQ/Rq8IDgbWmWLl?=
 =?us-ascii?Q?SX7HWWRGo9BRudDXJxj/OX84yGAEAOS1W6EK0WKVgmlRGfR+kLbV4PMF1i4a?=
 =?us-ascii?Q?grcHV8lXzFl9Uwl0ohkd26N7WIuGLOjwevohNn4O9rtuqTYOj/asU6JrDA3L?=
 =?us-ascii?Q?SsJtZ2o58nz7XhuwQcUpjV/sCbPYPFV/k8CAExF1gka/RZXF7Hcckk0m4sPL?=
 =?us-ascii?Q?l+KmQGyt5oVKLlmWCHv6+8Iem9nSpJb55AubKRLa3/KY3uevxQTC8RFDYFs7?=
 =?us-ascii?Q?SnwSLr+TixNVYrj94GmajhU7iQ2fmEC9UkP0p/n7+CCC6dZ/Orm3tXIgKpbZ?=
 =?us-ascii?Q?oReW2si9A89rKANgqHLNOpdCPzY5TVAcnX06lyWBXOW8qyOWBH2CrwoyjvF9?=
 =?us-ascii?Q?Rbg5Tv1GYTgh06XkoJ7hAairJ9d9t4JDeYfojmzlPJZWhTuA1a/zYEtasemD?=
 =?us-ascii?Q?8J3QiFR8Z82uPQC96qmt0FlZnMbXXTKAaPCrmGeFKEPXdjGx0cGuPxyABbKW?=
 =?us-ascii?Q?Az0+I/UObfmNQ9lEGhnNlI7wfyDBjz+oM4KlQvrOegaXqDNDG2/2t14iV1/c?=
 =?us-ascii?Q?5hd3HU/07Bk9D5CK2Io65mRP9Dih8RCCvm8BTybsARZCrwbZCvf8UeHO6ihz?=
 =?us-ascii?Q?StWcGv7ThmrtU94pJnw4e0YaMeWIJdVX5nFNcR6zMr6OmwT9pRdDEFNy3nec?=
 =?us-ascii?Q?WwNlN5ShzjXb2jGWJxRQq7wRpaXlDjT3wA++b9YnWg7WnNrylgusU3vlZdgB?=
 =?us-ascii?Q?hc2O9hwgCir49M3vfapkdemSjl5P+L8axbvDnxd2nUnrtlAdWqGWHB+dyPAU?=
 =?us-ascii?Q?6IM6+5oAuN0+/f0hbHxeojF4IdqxMefoGlIZFqB1dQl99/ex6P6snmrJulD0?=
 =?us-ascii?Q?ZB14anz9wddt6ylA4LBQ54KLmuoswOe2c5WRlihl6yOWV1MNmlmqJXUU1m6X?=
 =?us-ascii?Q?BkhUbfX0YYhON6Fm+xvFB5O8mcz8IUH5MNwNX7I2VWdxmpSBaf9mIeOpu8kZ?=
 =?us-ascii?Q?irtk2NBT1lCdEoUQQZxvbvmIuBsTld9iVjovR+omcOipBshy9VfaQem3RdPI?=
 =?us-ascii?Q?Fxns9UyZLVB3k0kyvNj/EeDqSzMDR6r017dGE9tEfaI0KZjpKHSYpPjGrGXc?=
 =?us-ascii?Q?SCK4s8f4Ns4eQb8la4zh0BqwY8LSTpENjFIYKlqkzLcKJ+YuS2/DUYH+kRco?=
 =?us-ascii?Q?KfncXANA12E9KvUjYxhXMjrN+AbR0eW80wsf1P+typCnLMhg+MwI0dI465jK?=
 =?us-ascii?Q?yT+Qex78BsHYzvMsiv5Ou1CypN7wv3eTLWej6Ba6rtZDxqHMhQzJ1LqL/Tah?=
 =?us-ascii?Q?/82QoOw5wjA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GOEqQ3689Pq0zXFewdPd3NjIsz+wz8nehvR+to09K9EWGIx1dceoOYDnN32T?=
 =?us-ascii?Q?N2sXuVft5wnOuzMFEy/NTESYO5bwopqGoLkY7Eq7Yvm4327qAJycc/jOMymL?=
 =?us-ascii?Q?DcBuCEqe7D0fDsTYfg45q5SkYLAhwjLrNF6Aslzo0NILoiPNWO0CyLsQpHme?=
 =?us-ascii?Q?VX0mat4qxBwIIvbXTCetmnzbRpNnXOREgcNE99euRPLE5a6PnI1U3tV266k6?=
 =?us-ascii?Q?KiwhKTO2ChWt/z1q2l0k0MsepK9r/55qUzC+zK8MkX0ZDuokSIhQ6Kz6UcXj?=
 =?us-ascii?Q?WYSHyEuR8rjauBVIP8wzSxjGswII9aOI9QUhdZYm+Jid+qibyWdWVsTTflJd?=
 =?us-ascii?Q?eSMAYVMfIFbeIUObDaUzFQEAOa1/MVCMsXxyQ2MlAbr1izUebCRDdveT8Ydh?=
 =?us-ascii?Q?ZLi9uQSYze6tjEq3B8p4WK8ds9U51E57bLkiFB5/aelujXUPfx8IVrDirgFC?=
 =?us-ascii?Q?4XkZmjgTgYo8p7RmkvVtVEawk58c463tzI7u1Q7G2kfGavhaqc3ILSc/oHb7?=
 =?us-ascii?Q?wVj80Q/RqkN8v4gCG8RzNO3EYjwGkBw9rDVVczg6itmr7GwS4WGyY9iJYsvI?=
 =?us-ascii?Q?cozY3HQHbGdPpHqDoXFz6OpdDj/HcWX4tKApUu6Z3jjzPy03jNNq3wznyn2D?=
 =?us-ascii?Q?AfXXJygTQiQslsQE/BpZu/wj/eLb11zOKIviC52o8a80jv9TlyYKvIwZC6yP?=
 =?us-ascii?Q?53F2yIhUYZu1wy/49R7ME2Ud68JWdNCnrtMV/XEKlfptFRCyRDh5KSSzjDnb?=
 =?us-ascii?Q?J7MRx51iQgrWnww+g5gXA5AEEMzc73MdE+EoIf76HUyNT5tSuRATcaLXQFk6?=
 =?us-ascii?Q?le7oo0/0H9trQhVBac52rSY5a1DRIRP36dMaG5svD52JJ/Gu2wXbotLhYaOu?=
 =?us-ascii?Q?6YvaSeWwUrxqQsv/bQtdy1NP084IVoGCjpjNYSBOlOUHWcGKoujQPyPxLpan?=
 =?us-ascii?Q?+q6hKInPV6iBwfewIhKRa0EMjOMvWuCXHl+BrvwNyWoVqKNq3jkytzX23c54?=
 =?us-ascii?Q?nw5Y1titb+0+LsHS952PaRrt4Nn0/ueCFQhqiFOcdpKKQKXTr2bSKHFsUx3D?=
 =?us-ascii?Q?mnbLZgs6rRJHypVTRtx0IBYFZyVzO8S0FZMoKaHIL5z70XmaYPIdIO8wuo/S?=
 =?us-ascii?Q?hsPTJ8PaAMmm2Xy2M5xQgRfqM8sRR7oGBNjrWPGUGysuOe4l2esd5B/JCuGb?=
 =?us-ascii?Q?4p7/Y/F2LSmDvgPBxvTpJyawIESsqh2FBTcVkQDESwqrV1U4/556Ar9Ul7rw?=
 =?us-ascii?Q?usAuNAOQ2YHG4ShYiZ/wam3VtVUHGu39jD//bsJKNBZRBqY8qZ0qD0VnlYQa?=
 =?us-ascii?Q?/2DgMFGPtc7pQ49VPLy69S13mpEGv7nb7G/v/ualELOaCNprEWlKzIMFq0Mb?=
 =?us-ascii?Q?nhZz8OXwqzvgwQbgi5Y7TKp8chhYVoodBgaPNMLjrlomfOKH55QgiN6JyUPR?=
 =?us-ascii?Q?XjB7/FgQDZpdlyWRyx20S6pAMMwZAVEA80bpWCMoNEBo+AGwRm+Yn3OhEhj8?=
 =?us-ascii?Q?L6GB+dgtIHe9svJdX0/5NCioydkb4D1SjDIAaaR5lKhZGqI9yHPP9wSfb6Yv?=
 =?us-ascii?Q?6XpRmFLnR6E28CpZQNb7D05tGh0l+LgXyJaklhWDpeO58wfaaVKNxx21q6T2?=
 =?us-ascii?Q?ntQY6PzPzD5KUWSs2i8vY4Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04421646-71fe-4f3b-d325-08dcddbe4005
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 00:00:36.9216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F44cDCBK/Y5JELMztu2Wh8JPAphj8KqqCC0VZtFVqj2T89BTU3FNbUEI7yfaIZaNs6HYkQL6vk/Qx7ku2veCBrGAMeXn3ato+UdESn0hH149q9F1QvRjPeyk4Vv5FFNt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7353
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

