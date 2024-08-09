Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671E94C927
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 06:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F3610E851;
	Fri,  9 Aug 2024 04:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="iFvnxf2p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E931610E851
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 04:22:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wral9Xmtcuk3Orj5PRbX7+w4bXeiVHY8heNSQ3JCDo+5KDy8NrUCc3Rh87ub4vDpOqC16bI4dFJcCIO1FfksJgdYC4eOUV/zL2fQDcbfu7VSKibAhjmH2p592UeZCFtCGjftjLerxqZPHHCIKpmGLufvvgfPt99PexmXXgzwcbXCslQGk1pZ3/qUKsHWb302GVf5xBtQ2lOpTFza8JeF8cBaOgHmFlyNr0YJ3Av0EkQrxo8StzY5zsNUrhmga83f//PvOBZnBaMH1Qquhe+1Qqe2OGpIhD0s9aO7NEQqrntrNutXERQte1JS4pctboaRa6iEzeLzISIHgZGmod04yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1oY0qoi/gJg9xYf1gx9k0f5cIYZLqGIIdG5ovK6TzRE=;
 b=YmBvqp3TI6QqcilvQD0/r4LRKz2vvweUWOg9CJoGgTH/G/5mzYxlwPr2dD6pPM+Nzzr/MG+Qd2xkqs/WKcyuVeEUwWQTyXoltHu3cdriP4DJM6Nr0XurL4TDqgxdqkbMnLH54ub4FEk7vfX8LtdwaQfNMT5wfpWvOOOQLIwZAZEjKGdvJ5BUS7ZoLmPz6JRk8UzVJdHgO70XduLM2GTW/5HzUvbWCNKoC3QSvVWACJ6pcHrsCMRl4DMty0SVAzYra3r639svDNZackzfwM2Oqa/8rLxW+6cH8df/PkYVV2YI42J2XTNoCJuXI5wCYea/JpalMb7kTt1+loHa2arFNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oY0qoi/gJg9xYf1gx9k0f5cIYZLqGIIdG5ovK6TzRE=;
 b=iFvnxf2p7XPNOqJuYrWboiJ+N8S5JoBh3PFoDWy6/BlWg8TxTcjcrCEfTUvEhGl5D2/X097LStLyW4zGhNhAC518ynlgrMvfy1LiUcETwCxrNjYs4vyWiPhC8L7CObSLXttkYccq80izY4WGpFTEoPjxXU/WpuV8jyGmBtZfKck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9639.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 04:22:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 04:22:39 +0000
Message-ID: <871q2y8gvl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/9] ASoC: test-component: use new of_graph functions
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
Date: Fri, 9 Aug 2024 04:22:38 +0000
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: f90d7454-78aa-4a76-44a6-08dcb82ae750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mO5yGr61ou1SSBAHHlFE69f/kkWoHE3G3a6bpRMWza2NoglBFTaf2Zf2vaYs?=
 =?us-ascii?Q?RTFxslz8PZ6OylP6VUVyoQIQ+p8BEckTMrykS6nkiwszb5ZeprzAbIYI7MT0?=
 =?us-ascii?Q?3WfhzYtSJgHrHo0c6wLo4feCTWWyblmR3QPKH4StnC9lNkIndteDGSDqd00a?=
 =?us-ascii?Q?63DkhUkWwFyscOluKzSvZaHZ2le4jHd1j9GNbRZlhCv2Sy7Qymi+5e0sWuBr?=
 =?us-ascii?Q?MAN+lN0tB9H4LdwJMWcxUDd/TIcnwNs9epAlLjOduiNLbIxPhQa/HkL9sdNd?=
 =?us-ascii?Q?ZTXP6xdzneWty8j9DS5k5DWRwMlu08tVuWAYi5kj6lmREg/MlaGoLwze7d3t?=
 =?us-ascii?Q?XUDPiVrvQTcRUwO0wwtwlI3e1/diVMCZ8s3jBA3O69VPCMJuXLOtyFBb27cm?=
 =?us-ascii?Q?lgJOdJW2G3p7giR83z1OPX7CXzDiAbE9AhYsvbTjhXGLKRcZfdDk6268IzCa?=
 =?us-ascii?Q?ccuGXgv2BqTt2QY5gAeLISSvoLFwL8SUc4eYZu+KDGaTpN6PO6aZ6eeNQiUP?=
 =?us-ascii?Q?MLGAKNnCbmmJZsNOuvpOaPx+vm55IYVjU7Pv6stY9AOc5xyfOFq8XR/FAHVu?=
 =?us-ascii?Q?6P/gneRviU1vSUvB0/DAurqSQdHwTDSeBOxj0GXPA9wRNwS8ujkWsn0ofhBD?=
 =?us-ascii?Q?wIgMfnyNkcPzgV2uN6FLmyd/8QUwjmQ7wapuSXR57K+cMGGXXev63+1hkBpt?=
 =?us-ascii?Q?aLJT+xTHqGHV5h38bswdHdtEEcaNJcPc/snCY8k1E0LvYUHBa5V5Kskgydab?=
 =?us-ascii?Q?0S/giZa2A0zSNesH44S3kh0wfE8D2GwYijmsk8sv6PR0vbnW1LA/jg66jMzB?=
 =?us-ascii?Q?As8smRX9qZ1YqU8A7WePa3XduLC7IWin+nm5O5klTYvi/kLj0a44jZgEVPYO?=
 =?us-ascii?Q?3H3ODvcIoh/WeIxat4bDRHUdAvK4MMKRQLEYjVQ/Upj8BhPALTWmLMdzWi3l?=
 =?us-ascii?Q?s2ZdBLxEuysaVLHrSNsj8ZpdFYm+lC16uwJgSa+e39viohJAYMbg7yAtXuQX?=
 =?us-ascii?Q?jigtWrYKlkrGE0cvF8SNGJG8hEcqRfWZiILrFkGptjXxXMp9jFLQH9pTv9f2?=
 =?us-ascii?Q?4Fia+zx28dMzJbkC+F930nRou388LFljbpPgdhHnmLP+o46UX50t1d+YRcvX?=
 =?us-ascii?Q?OMRMWskz8qNHxnfe7Pi1RcLA+TKbR/g6MAxyYH5tldF7pt+cNaxp6//l2DI8?=
 =?us-ascii?Q?BCbI1RhhOvzNVrdeyW2MMNrkBIPnoWZVop3TmscVBE0n5vFqStmk+P8kj2cx?=
 =?us-ascii?Q?KlI1mj+BEzG/j6ZQdI61QfB5h/b3ypMs1KJdrXZgaMABll3jRXhSqByDsqgX?=
 =?us-ascii?Q?RPlp30+xQB1x0YTfLOHgSqxDuCGtETqUCare85JzEavWFc6GT79KOi9MNWnR?=
 =?us-ascii?Q?kvOrFzgIJSxTo5s6TqC5Q2FX081Sk4RxXeZJw/4AsvRVx+rHf6MWxVEHM9+n?=
 =?us-ascii?Q?WwD+u5EqSbY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xxfu1B5NhdHXtWM+N/4IjYn3hl3PCtD6phVZekVcctqsMII5YGHhJ5CAmDPQ?=
 =?us-ascii?Q?RhPvYq8Xn9AiXF+6ZmzfWUWexI2ZxvVOk/19OZz1kolF+4ikqdOqDLmWQFA6?=
 =?us-ascii?Q?AZ7eppyzSL6GdmBHh7O/VWRgojwd7bhm677AAeg9205k3WmIx9QxvuO+Vufo?=
 =?us-ascii?Q?OE//V10o/y37xMx87qiIw9UpGRvd5nZE0cFALxDYf5/as6owG/dIwj8+Wp1L?=
 =?us-ascii?Q?nzootW7m4KAfoQbcrW/mQKRwRQ+Y9bo/YxNMo23FtjtzsrwfSS/5TGRS9d8G?=
 =?us-ascii?Q?uO8+IakN0XG5Sto7adgM2yB+WJeg9u8S/QcKbcaYM1mvpO4epJcu0yoSRs1c?=
 =?us-ascii?Q?SGYeFHtX6ou8jWcDryQOE3+FRtxrmyXePh9rjF9nlYhkjxWZdkEFtPshZUAs?=
 =?us-ascii?Q?wvQyl5H9+5KwRnHnIe5UbY+KqmBq0nz8W6bgw3vtWD4RHVIE5uzwAUIq51xb?=
 =?us-ascii?Q?KAn/ME1a0UC2c6bIpTXAyxqhPAhFxCsVtwbUP5yb/ySXF0Gq2QhLkfPRJdDU?=
 =?us-ascii?Q?ieoh1Y6vk9o+naPO2CSrBd7TYJpuKVfrNJBLelhCBA8Lun3awXIdEkbo2brs?=
 =?us-ascii?Q?YvzOJRtcgecnAsA4DBQhQ2H3zuTew31X6hFPnlFwoUOWeMYNj4ucLaMXR/l2?=
 =?us-ascii?Q?IevoRnLTBU9unlxp8ND0xzJM8sqkARa62M8jiNweHfWzl3nOE924nUqoCYze?=
 =?us-ascii?Q?H6sKfhx/KgGnWu1MuREBwa9pO1l1scGBA9ad6+pqKTu+SSMCeL0rSJLnefe4?=
 =?us-ascii?Q?/54RlRwZN8BDTZ9T85Bq6t8fG+kI10D8Ge6eKsB8G5FIQQlmt5XM6lg7rqOM?=
 =?us-ascii?Q?CjeiY7rEmUyfdBga8BLucrv3WFx+mgP21B5LJgC+m3Cbb4Qbk2UXUHytwqNh?=
 =?us-ascii?Q?m20WhlSDS8F5/48GT+qGjcxENMYocb+DrL/I6tlaQBT9OS23bFd5LLYmbMnl?=
 =?us-ascii?Q?OJc372BLrIaF1J8DsavtZ06n8RdEsgh8u+Q2bsuGuTZRNS91K7QXbJpZUqIX?=
 =?us-ascii?Q?OVeW/YUsL6giwHaikoar8tiIohM2SfNeDuK69ycZRmkxT1DXKO09m657+OJ6?=
 =?us-ascii?Q?Rz/qsOxW+txjvk2WX1ZG11csT0HaN+HOMmjg6kFnhKkGSRP9nLXw/W/s5wK0?=
 =?us-ascii?Q?5yEzM29eVOOoZqPClxKvxqAZHjJPn8REcC47F4S3Y2Aaerb9WuEdC1DotpaM?=
 =?us-ascii?Q?xm3x+urIrb9SScDKaHRgYIh/nYCkzwglSFOTTI88IJkOuCMKQP7h56C2VSE0?=
 =?us-ascii?Q?ibtvL6rhXg/z1G7Rz1QY/HjhXNkHUsCnmNYGFozI5v8fl+LuCELz3klFJpRZ?=
 =?us-ascii?Q?AHgTJwllFLUx+s3NAoS7/vij7BpwLb7TnSQJi2VmwqCA+ce+iJSr8GJKQUJL?=
 =?us-ascii?Q?edH2ZBMmlkHcgN+/rnCOIHxrG+kZu2/iUR4zv6IoaAeCIaqLN0iGhmRl66o6?=
 =?us-ascii?Q?rQfFR8p5Mb+Zs4ECCRt/fJAlPIV0GLnFchR0jlAZVjUxjWd1hFX5t23/t/9o?=
 =?us-ascii?Q?0IRKfldHr9FpcxLHos/6iea1RUef6Ka8KxJPH6DUB+bInbMgivxXwzTKkwdT?=
 =?us-ascii?Q?SGY1GDZPZbFTUhr6LZYDz/z9VSgnMPNvP2au3DQlwcPbStO4QF+ctKGU1GMS?=
 =?us-ascii?Q?2Byrk0uxv16EHkmI96NPoag=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90d7454-78aa-4a76-44a6-08dcb82ae750
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:22:38.9825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2+MPAOYqzzgffPaUX6yu4lGZLqga3LVfAG+hyYIF5Q+R/YmBKy1Qs3f+2qUrZ0f9xt0lk8fLq2dCYF420YbrJy2DM7SgqByJNaejPsPc/X5h4YCTWXriUBRMqLIsstH
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

Current test-component.c is using for_each_endpoint_of_node()
for parsing "port", because there was no "port" base loop before.
It has been assuming 1 port has 1 endpoint here.

But now we can use "port" base loop (= for_each_of_graph_port()).
Let's replace for_each function from "endpoint" base to "port" base.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/test-component.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index e9e5e235a8a6..36008f3a31b1 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -530,7 +530,7 @@ static int test_driver_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
-	struct device_node *ep;
+	struct device_node *port;
 	const struct test_adata *adata = of_device_get_match_data(&pdev->dev);
 	struct snd_soc_component_driver *cdriv;
 	struct snd_soc_dai_driver *ddriv;
@@ -600,7 +600,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_endpoint_of_node(node, ep) {
+	for_each_of_graph_port(node, port) {
 		snprintf(dname[i].name, TEST_NAME_LEN, "%s.%d", node->name, i);
 		ddriv[i].name = dname[i].name;
 
-- 
2.43.0

