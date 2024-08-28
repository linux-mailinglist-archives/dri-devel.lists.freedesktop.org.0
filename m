Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333D961DE8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 07:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117F310E49D;
	Wed, 28 Aug 2024 05:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Q91f6b+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFAA10E49D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:11:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZdhg3HqoT1iMCjOHZeqKtIRCeQ2562nxzEexI8cFn/AQzFYPQXviAVJfYse6yjXtaU7mxFRmkqQzMDleDDpXnVgRZs8YnG8BzShgMNs+JmY5e3kL3gOevxPq1DUhoEpmspiJMcjutOu2CQdxlyCgguqDFmty/lW5+LdboHvXyx6Rx6Tj4VKL0JWKgGc+5K6RofgH6ktZsbCmmmogOWjL1+wxVNC7Ha4zMJJYKqVlOKfg5TIfJB8ltjCDBSpllRH3ZRO6b51JZLBy7dC6FttjWUyBG6DX/jDfxX1VxShVvhS8EJdn4JZm2yMC2LtXf9bwX6aiebUGGO5Pm3YMfQQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvJInUuNEUe4jRcgs+FO2MhQ+2U/Xyt2piTiOMROnOo=;
 b=qu1WAgG3hPmykGQOdt5SgYfRbHKqCQjOEn5JCUGQs4E4XtqqLw26c+BleiQEuOtb3cpj7hADBj+kA77ugO/LbQ+VOe3qzIYsucet9OSAMAi/EC1vGrn9TQd9MQ8Hbd6CN+zyaJeIRn019yhwFWuCsBBA3p5QsUh1tlm1A14KlUM/XwdwTm1BzPIqnJRlMk5aGYQ+ghr3DWIQi7HzHh1ZTP7wX+p6WBtuu/jdSekzllvXucW6TwonK8phpkxzzSb/o/pRgvf3YthkPVAh5ZRwtBG5bM4ig6HAFpURcSaRq1Do6YW/DH6wCf+t85VTyZfdPHGzFBrqLvmz5y8krtQr8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvJInUuNEUe4jRcgs+FO2MhQ+2U/Xyt2piTiOMROnOo=;
 b=Q91f6b+2Zm9I118JkpGYJjlRvt/7DZAlmBqu6VPyQ1CUCC5JB9YISiG9Axs3uE65vW4kGAzWdocN74MT7MkSwWdVQOks7kGajFsORs97gpDhc3eevTFadqxlgGHkgkoFtIAu47OCWgdFsw1qjNqHIRhzGi8/6kGJ/paptNzRaVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11955.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 05:11:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 05:11:49 +0000
Message-ID: <877cc12puy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 3/9] ASoC: test-component: use new of_graph functions
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
Date: Wed, 28 Aug 2024 05:11:49 +0000
X-ClientProxiedBy: TYCP286CA0253.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11955:EE_
X-MS-Office365-Filtering-Correlation-Id: 848a4489-339f-4549-edf7-08dcc71fec09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C1XzWVYXbMfuKkTVO80BanJ7pW4h1lPrV62MXNqbDHpJnscM6qsOwo73Vcql?=
 =?us-ascii?Q?xM46Pk+Ncw61d8mwma7Qoyaz12Y2axUdNcoGsfi+c4im22PJN+YjxMnyj6xJ?=
 =?us-ascii?Q?Q4e2dBbUi/zxo83M5G7fkQoRFd93srU3dj4mqieMq1iSyFE41k67419VVKpk?=
 =?us-ascii?Q?3Hd8sdvLdKJV1HhjPT0bR+pT0fHk0PfyCSpEg37KwbSW0aNQ3vi10W+Mm3IM?=
 =?us-ascii?Q?KsqCirnLQDY5y8rT2KZyQ5sndG8uIHMHGybWkPEjRlEQNQpu19dyrYFKLDQI?=
 =?us-ascii?Q?PBxbB3g+9h6P3VVaaelHBQLBtcCLTexJJqE3kHLXk5ik9BSqmNKv8J7E0O5J?=
 =?us-ascii?Q?maKLfDaBzemDy8mJ5j5t86v/71Wf62FfoYuEDOLfjXXgGzJWc76fudqFyaGY?=
 =?us-ascii?Q?va4B/0Y6PbTgRGyGFvFLk3ZJLGnN0YiGzRvOTKHzHIfLtLqmMg60jX6ACWvC?=
 =?us-ascii?Q?J/lxNXLFFVUIXDLnK6JJjdpX/TZPwY98E0ZIbbYWLjPn7djK/JrMyt48Sb9r?=
 =?us-ascii?Q?aXUKSYTBGoFNmbxNjXf8SbkS0QwC5Thg8vN9RpM9xyE0Aqrg7zO1XNpZglXg?=
 =?us-ascii?Q?jinLXxGHrZ9tYanLceH9/JCCxNGE1U6317SrsRDefGy8Cl+EYr9yUa3QgRsw?=
 =?us-ascii?Q?jyYpLzdXVHB1xmh/s30ukK+KGVnVSKmdksCWEtx9ES4hOVpjWIiRsQ9333qt?=
 =?us-ascii?Q?93hl8ktSEfibMF9b6EdKg/wV4G/dqWZvBt2IQUU8EE+4Vn2j83S9XiIVYO9R?=
 =?us-ascii?Q?3avD70cOq3Z+3GlRVsBvLUYLp5sjL172CjEt4ni2F59zWNzJmTFnHe0EkGzK?=
 =?us-ascii?Q?JjgxCWIDyRgQd9OnN448fdMbCSkRfxIwZukoujnROl0R0Dmu9ngkKp7V5hKL?=
 =?us-ascii?Q?V+4+s8bEPheZ0iQ70wZb5JhlzjJWMCSwY1WCbjKTV2rsG2HMUgKMkKagN7wx?=
 =?us-ascii?Q?D+Dt+mP/Rq3pu/bJQ5VW9Y+RCAc15vPTozA114L6scwKzrsI1tGFq2bz9IKR?=
 =?us-ascii?Q?jF0stEevxmQJlzH+sr1ftXWHTB34wZ1HTKA3/oDxVPWPikcb9S3uQeaAAW/G?=
 =?us-ascii?Q?6iDvPkH2ydnJX6HGZdEu0eKXvhTh59XKMpj9ojmzNUZG8s0yJ4igNb1geoHh?=
 =?us-ascii?Q?ieGKzTZ2zZ88bcpdfrvm1NAMsCETQjnWpHtW1dxTMPPqJfvWI+eoxQDbDwz3?=
 =?us-ascii?Q?8ZFnmFBhbRwtUB22zVYbdIq4cxRTaCDICaV2xZhVJAOrlnCCYWpemvenl5H5?=
 =?us-ascii?Q?TFsMPuw5sj6BMH5X2T1OlFmCGYuzSrqKDTfTJSGu+r7LlNB1xOjULDz+5RX4?=
 =?us-ascii?Q?uzAcS0uc65NPS+JeZDOXJkF6FFIczmQV3l900lMAwQR8x100ErfRS+HwCSFx?=
 =?us-ascii?Q?4xvSC51fgCiszkRBkrNiHEb9pGT0HsJGBTrkEKUQcqiYATeU3LtkTaobKYy5?=
 =?us-ascii?Q?ACSfczFkTrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CSpKHcGOQUgrWuSaTfXOQHCOgDUhfa0w57GFb7RTGSyyaxvaXGosipP9fmyk?=
 =?us-ascii?Q?qoPPePV7e37ECcv5paT5nv4dkqEmcklKoy7E+SprXn0YZbXJSXf2qaM4as86?=
 =?us-ascii?Q?elPPwMBwIoXLhvKz7MM/DDJTxAQwHhpHQQILTwYZDoj5m4BC0y2YQRNoKOlt?=
 =?us-ascii?Q?fK2TOet3U0ZlJ9yA3eieczxQZ0sX8ka95p4m69EJ/1E5Xri22nRB8CKuYdmn?=
 =?us-ascii?Q?jpbWOBEY/HioFVkwecMo7GiClKN640KRaTh1NS/FSKbvdaS0ZcU0xq86t0B/?=
 =?us-ascii?Q?n6H4/KBDfolMRCflNP1EBixmB8aMchuE9YKtBEt2IBugwObijn853DkY11eN?=
 =?us-ascii?Q?xj50K8xDSwk3kMnwU7qb1vJdUHZUAIYeSo1pv+ulZaHUSlEG4AjXQSgLCe7N?=
 =?us-ascii?Q?eZCCoXLaeMk9u7Nt/p++SS04LW4HBTZAEfQATXlQA5tkHyk4EFVJyk9N3MXa?=
 =?us-ascii?Q?cth2bYWfE93TbMmXFYPy0KcCp5GHzAmIy0+TYBd82FP1qe5qH1VtTnkrPmim?=
 =?us-ascii?Q?Pc7/vEsaebsRkP0S1Q4h+xfqfux8F5VF+Cx1adWyd7Uq0P1rjY0wEWePIY4U?=
 =?us-ascii?Q?KgB8+UiN1xMMWW/za7kNB42ujEpESfMlIs7ZLKVwuzq0ORkjO9mx7WoH9qP8?=
 =?us-ascii?Q?G9bwv3iUAcMoAu4dxkhsTddUzuLfjU9mjTkDcuULRSgFzrZ3lTfG6MvVRZhI?=
 =?us-ascii?Q?wpxWwgV1kqiYDNWtiiHpCe5hJD5eYhnMxxh9LKloct2+37sgLLQKM/N/b5pF?=
 =?us-ascii?Q?Cj6Ok0BF0yoMxh0+r10GFgKAZrLYXNJTQTPFmsfqJCAej4ErEdt64F2UCvp7?=
 =?us-ascii?Q?WrAFIcF3Da1NLbtjf81ont47qUo9OLqjQsTQ608dxvLCe04sqTHM/8v4jr06?=
 =?us-ascii?Q?P1dBblTy0RupJ1d86hE/nlbXINCBaalJGgPtbbSsek9eBgrF2lA5W+yFBgG7?=
 =?us-ascii?Q?clgJXfu1ksYv4LSGPV3hpyW8RaXZQoBOexsl/PhEjO5FvNIoROoUShUEpfK8?=
 =?us-ascii?Q?BC5OcrYHygjlN7n5z8DTqw+mmnVDheIglwu+mvLn1RN/e7mpGTmge8jSWl5O?=
 =?us-ascii?Q?8qiWMkGmRXC18zGFyZ7/dwELY7EKs5ThfYJWL3TTe7USQaWE2aXnwXSkB53a?=
 =?us-ascii?Q?DZFTpxt6PsQN0gVofHY9FB8q12gwkHLlvHKTlAqGXup8+hzRDLuwvSpFYs/2?=
 =?us-ascii?Q?/gTNk5sWiTSO/3EDEjmPy0vQRTiU65A2cryisoIH+84sDVFcNHnfCujzJ/1q?=
 =?us-ascii?Q?vlRBP1Ia0A33j7595zVWu5a75djyiUj78cVJgdIKfKHJK9lsJ0BwbIArJW9C?=
 =?us-ascii?Q?D7wTWUg8cx2Oc4h4ZEe6goe96gLo4Iya55yxrVnEt+JpDGeHBydj0IU1z/gz?=
 =?us-ascii?Q?lkZTvMgGPu+QQzKA1OApafxNeoJ/2XkWW8jboD0Lz4LUwmVqNWusp/BjJk/Y?=
 =?us-ascii?Q?QfdDU83fxd10TvdBYwszz4qvC65kirfyXzpWOLy5tcbnv1zfFrxlsGw5vE14?=
 =?us-ascii?Q?kwSOeFdfXrAXQV2JWNpe1JO73+YV5YKA4SugB4bGcOduORKMP3Z4pdxP+NS8?=
 =?us-ascii?Q?fAp+YL7SCeqMxu6+LKRSVaCeC0IWFQ+5cYKMx9UfNzdn3XpTX1XXpNVymA4X?=
 =?us-ascii?Q?SOAYyeU7JWJA2hZZHb5HJlE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 848a4489-339f-4549-edf7-08dcc71fec09
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 05:11:49.8614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHQGx+je15kBRJC9VVsSxM/3rUAQNbIeAWdsgQOn4izlX6AOxCW1iSXcSEIrOoET8MEVh4KK+VxYy5AJwFtc4+knppu8IjrjXKbJMSt0VuN2O1EiNKtszyJe57tc6mh3
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

Current test-component.c is using for_each_endpoint_of_node()
for parsing "port", because there was no "port" base loop before.
It has been assuming 1 port has 1 endpoint here.

But now we can use "port" base loop (= for_each_of_graph_port()).
Let's replace for_each function from "endpoint" base to "port" base.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/test-component.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index df2487b700cca..521015d870854 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -521,7 +521,6 @@ static int test_driver_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
-	struct device_node *ep;
 	const struct test_adata *adata = of_device_get_match_data(&pdev->dev);
 	struct snd_soc_component_driver *cdriv;
 	struct snd_soc_dai_driver *ddriv;
@@ -591,7 +590,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_endpoint_of_node(node, ep) {
+	for_each_of_graph_port(node, port) {
 		snprintf(dname[i].name, TEST_NAME_LEN, "%s.%d", node->name, i);
 		ddriv[i].name = dname[i].name;
 
-- 
2.43.0

