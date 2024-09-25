Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A66B9869F9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 02:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EA810E12A;
	Thu, 26 Sep 2024 00:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="FgFNZSPi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A4A10E12A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:00:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoBe6XHDEpSd4FeL3fOUv+4l0CRmDvEW8DOstOLPGbLpBOFQd9kt+OEkYGAeY3byX5/x3TRa9o39W11QDIdt2UM+QLWnKNKBzrZgpj2BR4UDwAEoazzmOr+MBkTYNIgd7+FelPu3L7YoLam9ha3vAu7hPf7+AWLTmn8OqvmOtkhrmuuJu+ihIiU83vwMXwt9BLKpf3fdE2Y7HkYZIHQcTEOxrjz1iNeXOvt0VufFKRdhyWuO2mbdI3iJziMfLLqzqrqFFfB7yJXtNOzSkqJSTRBkihSCODNpqA1oI9rPBLLvluu+c7JuikGX3q+uksmowC1m6wq2nFkr3eODhrroYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r16qzp9K4woRIS6tr7zWrTGHV4SZ91rSOmPWxOFY25U=;
 b=cveq/JGuhZfwkiqPOeUTz0VHIt+CCSQ9frdkex4c1UmNwnuVrPMNFnzBjLllwSZOwseSUiVz9ktXYDtxdgdnCsjFIxf/KHfJs+H7X/VnBlS2ubyhBHwHWTc4JFMcucf/gfqZWmyzOVYtQIIcK/SwPEg7tZ9f0LDj/Kj7oJ+jUWwdMRSC8vcFQ5LWAHrubhA5djFnpTFum7DMWAgLkQDgyJPlEbKcCQbYoGpuetWqXTDjD1HocxWE7+D3GFn3Z7HlOyQ+trqyO5oJ01MaY2NcJ5NjzkkugHFaPSiLwqSirx7B1KKM6ObH/BUSIB5GkngUC5EQM1PlQe371Phdgkxx0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r16qzp9K4woRIS6tr7zWrTGHV4SZ91rSOmPWxOFY25U=;
 b=FgFNZSPiegvBfjigTarb3z3x9cOtTUpUpU1tniQSQrnbMe4BnR4CzkdjtzfULTq9V/D7SXTZ+EpZ79rX3der0SL02fZOQ6dtQ1Y222yYRDMjjHu26E53TKAqZgHBjTEn0LxrwJERTBc8CTARRglf4U6STFgEd9+TOEuaSUmCiK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB13322.jpnprd01.prod.outlook.com
 (2603:1096:604:310::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 25 Sep
 2024 23:59:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:59:55 +0000
Message-ID: <877caz9tdw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v6 0/9] of: property: add
 of_graph_get_next_port/port_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:59:55 +0000
X-ClientProxiedBy: TYCP286CA0256.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB13322:EE_
X-MS-Office365-Filtering-Correlation-Id: c881c422-84a7-4d6a-1a52-08dcddbe2783
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o3/NX2n4bNii+GGNVf2mmPssKqMJTJ4ZX7xOuErNHwdxSsJBQEAo2D/JDBh/?=
 =?us-ascii?Q?vP6m7i+rlluB06ERSUHByMUQftYFQ4slqZZG1AwUHWp3WDm1YV48GJXsH3RJ?=
 =?us-ascii?Q?WakTWpf57Rvq7seCwqK4IvDr75V7ptrf91GuaMOStl8AKzNCNZbOdyWwSLZX?=
 =?us-ascii?Q?DJ+Pc1T6rUW6SwwwTVu2/zU1WlwYv7v1uZVZuh637cBt7e/XxLqfIgfQm+xv?=
 =?us-ascii?Q?f03X24NLkUoAhm4IPA+nC8wDKNRSmF4JMr9dtAIS6gyQ/T/Ueee1ZIn/tBYP?=
 =?us-ascii?Q?CV7hD0sS1ebs/exXYd8ZstD9TONb5CduvdykQCjKCkin44cFBI6tJw4DEwKi?=
 =?us-ascii?Q?kf6p+LuAxeG3vfDBVKePUvJKBM1vw+AzM36b8vPt9CRY70thVBdEFqm3wuef?=
 =?us-ascii?Q?Cm885ss85veXTiVg24MgvUf9KKbyeBmGMF2KnaIoGcVXegV75bWzzfoBdYxk?=
 =?us-ascii?Q?q5KTpHidwiti13hUMZv0n4RngR3+Qu6W1JgNCY2tarmzwA9EQCqMOGx03l51?=
 =?us-ascii?Q?+gCJBCMycz/zhnEkX9jjf0YWZ18Js3fWigw1fHq4of+hAZPVxpBEMPEXNdM/?=
 =?us-ascii?Q?GlrW+FzQM6foAF4JvTt4yybY0FFCsvmFB3AdT3dc3G5/yHwYGwi4JEl0AX/x?=
 =?us-ascii?Q?POMabWrnSqFe9CAQFq+1rLZXU1CDJUk0/gBPoGy+KVlmeCwhbTlodn0c9Q3A?=
 =?us-ascii?Q?6BvmRbfoCbCPDynhHZs7yQmmlCPj/HFxWDzwQzT0R1YA/JPPjTwkonaEEfcS?=
 =?us-ascii?Q?KLs1eGPcKRbxI0lKycoLQ44wrxExPnbzb0GwuGdJYNDtMrMtXA9ufLr0qEZS?=
 =?us-ascii?Q?BlgytIRNhvyLKOma/XsuuezM7g3xNsalBSWD0oBhskgTYR4BRTdDWKpR6TwX?=
 =?us-ascii?Q?FquoJFJ5FVFiOXnRozmtgV8vYXPTTAqa7sjB4wyszbEJUr/AEEywNWDJCK02?=
 =?us-ascii?Q?+gPXMHdz384RvzY2blF67QSZ6wWO2ouWFuVnRbJb3IELtSEHnFfnGHIUuRRc?=
 =?us-ascii?Q?zwt1E1whefKwqKgOSxGcG4GncfwNFtIEM52QhcNhJlhkYyeDo1jMeD/EF9R6?=
 =?us-ascii?Q?vfqrm0/mzWRsuo+DV4/q9Z0WXSajsUw8Y+k6jsIXMzJc0OaEPEXrWVJTnevm?=
 =?us-ascii?Q?FBDD0C7bNjbeKv8FgKGKLp9rlPQakll4LvZtOil2erISw0KlDt6b4SN4qy/c?=
 =?us-ascii?Q?2SL+eZ4RkcVl7syNy8VlVbHT9MGJvuKJwfsOOxMDgbyK/k5WZLdkSBbi2bmB?=
 =?us-ascii?Q?bpzFbQLEI8MXXi5fqIXYHg3yV3ytRTVYvSf9n3Ccq0U+L/XDdGv0dQoJ9ZIQ?=
 =?us-ascii?Q?iT6smy4STBWG4Dy+OWwrZ++qCxHe1jLZuwFBYFdzHMFl5K1HRdsg8u78KvtN?=
 =?us-ascii?Q?4KK2/Jc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8BNl4UAY7kLA3ZkP3PAG2XqAjqevWKxhqquYWexa6jYN0xGWFzccJXmMHx7T?=
 =?us-ascii?Q?cv2WmHU+FM0ZvvSyUlpHNItDycDR305tXFSkKT9V/hhn/yFrs09sK57QJNqv?=
 =?us-ascii?Q?xStAA7rzL9g8cnAFj7/TNpU3rRwkmzA87bn0T0ToM4LSQx9CsJoAXlAUSBt0?=
 =?us-ascii?Q?w3FpPhj2ojd/ePyAI/p4bVOFBafkxhgoYzyNr0sNzEVMH2q41N1RvILLU/x6?=
 =?us-ascii?Q?Of6OdwXyaaHZEwwC84aroMzKw0wnVNnzcbsAprWK95VTKAOwpEUnuHwnbfjR?=
 =?us-ascii?Q?5hrd31OnfKqMPKQkbJUkkQTKsHfKE2C9ip0RewsgU3wydRMQl7L+RKHgppL6?=
 =?us-ascii?Q?2R3ZCYvmEvoHhnM3T+jJDQ1L8Y23bfS2wKTbS2GaL11toY4rliVEf68mGSz8?=
 =?us-ascii?Q?7AiQUpUFSts11Mabl4UumfpDU5oZEc7QEsPlSsS+gfQXmTWdaslwZfZdltvv?=
 =?us-ascii?Q?NxV9TlvdByLwS7yghbgCFKQIaWhQqGh2Ltmpjwi3IpjqlHb8tYjLwew7jHWL?=
 =?us-ascii?Q?0PXL/LqF3Q3/HbGuVLnRBbzIr55ShNuZgy5TjkXnKGx3wXyd6inMzrFakvgP?=
 =?us-ascii?Q?pSJaaBDinEE9wFP3P1ZwkpiE+7Qa2d9LfB/LK59vTFJePCeldnIGH6QHIoDj?=
 =?us-ascii?Q?QAfIIO3rVY8/TAcNddD3sAb0Eg2i51eD9g+cy0LnxEKjOYQAKJsfK3ikEbMy?=
 =?us-ascii?Q?UHlySCvf1hG9Tin1Krg2dYIvD7dqfuAnJGSI1Du8QwqwALJwFDXZwwSUawGa?=
 =?us-ascii?Q?Kalb1PcWUiG+m96tZOMZ8Gm25dRiE542SPGwaVnYgM+J0feNzve1wJWM3x+G?=
 =?us-ascii?Q?nZSvxhvMGIrxtfwtd4+pga4WgdX5Z+CkP5/rKFN/FcnhKURzVos+w8EcAJvG?=
 =?us-ascii?Q?pVvl28xp0ZzkRIZWJrMVs+8FD/85YveEYrot5NCsYe3zsrjvxnVhkCDY7yCl?=
 =?us-ascii?Q?8olt10QrMQ6Wb+qytl4HHJHmr6qsm6Zw40yCyXmhmI0+eGAENarwpCxQ2+yw?=
 =?us-ascii?Q?VBZZu4hMrTVV971uxMwaPHN7vxtazKVEnbf1HPUXbXoAAtX8mdgKXu378ccq?=
 =?us-ascii?Q?ZO9a25yE5kPCgLM72gvCpyM1/NehkF8xxzxYlX1hyiYY9Y3ARXXFsv3Y+A6l?=
 =?us-ascii?Q?afFGVo1cjntD7PrLPtQZtTFoRzUvdenD7wiJY0CA+Bb+3S1lTz8KUct9lArN?=
 =?us-ascii?Q?W1VRmMUBWBO8BYqAZTqHgpE5gP1VALEiLhwNJjwg1rsEf7FEvAJ9hzcz73TK?=
 =?us-ascii?Q?yRw6DjLMPfUyp9XQBLccKEo7rQIEXxeLmGZni3ZCV0mCOPxNgErES7NVwQbn?=
 =?us-ascii?Q?PfSiZX2abEJxnlucrMiqOpmq5pvxUVhlJdgxZ3D0uNQXzlA7USv79T7K1pLK?=
 =?us-ascii?Q?laCv4ighaqpfJlW9YqZN7eNcy1g+Nrt4ONObWv5h2QyOoiJL9Ejc25Vhnu21?=
 =?us-ascii?Q?VprfkZ7rK9tWpMVOReIUcAiQlYTij63PW5t6ajNvG8ZltjxthMnLYrFs0Y8D?=
 =?us-ascii?Q?FQbTx1hYr1MWYCifIp/cDkZYZuSfrN7jTGD1WXN3I5vNcgN8oA7JJtxxwYev?=
 =?us-ascii?Q?uMWmkgZkhO7Fuj5RsjMseuH724UiSbELtZHCLhOvZNpiCCRI0anfPanN0wMp?=
 =?us-ascii?Q?rj3od9h0PuzEmUqWOlz6eaI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c881c422-84a7-4d6a-1a52-08dcddbe2783
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:59:55.7633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCNRecMqJmCMfMX0hYoRt+yLnHhVxUhY+MD0IPEnaxR2s1wEmzAbQesOkaX0HhwNsy501VlYoEhdwM9RiFLOp6xUclYzTr+UKLOKVHh8G1mqpy1i1gyktjzkhgeSLaGR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13322
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


Hi Rob, Saravana, Tomi, Laurent, Sakari, Mark

This is v6 patch-set

Current Of-graph has "endpoint base" for loop, but doesn't have
"port base" loop. "endpoint base" loop only is not enough.
This patch-set add new "port base" for loop, and use it.

Unfortunately, new helper function need to call of_node_get()
if dts doesn't have "ports" node, so we can't replace existing
loop by new helper, because it is using "const".

I noticed that some developer posted the patch to ALSA ML and
its and [5/9][6/9] patch will conflict. I think it is better to
repost these to ALSA ML *after* main patches (= [1/9][2/9]) were
included to linus/master tree (?). (Mark, can you agree ?)
So, [5/9][6/9] wants "review" only here.

v5 -> v6
	- based on latest linus/master branch
	- [9/9]: fixed compile warrning

v4 -> v5
	- tidyup comments
	- [8/9]: parent NULL check was removed
	- [9/9]: use for_each_of_graph_port()

v3 -> v4
	- new for_each loop includes __free()
	 - comment indicates to use return_ptr() or no_free_ptr() if
	   it need to continue to use node
	 - each driver based on it
	- care "prev" leak on of_graph_get_next_ports()
	- of_graph_get_next_port_endpoint() indicates WARN() if port
	  has non-endpoint node
	- tidyup each git-log

v2 -> v3
	- return NULL if it it doesn't have ports / port
	- add visible comment on of_graph_get_next_ports()

v1 -> v2
	- add each Reviewed-by / Acked-by
	- tidyup/update Kernel Docs
	- use prev as parameter
	- update git-log explanation
	- remove extra changes


Kuninori Morimoto (9):
  of: property: add of_graph_get_next_port()
  of: property: add of_graph_get_next_port_endpoint()
  ASoC: test-component: use new of_graph functions
  ASoC: rcar_snd: use new of_graph functions
  ASoC: audio-graph-card: use new of_graph functions
  ASoC: audio-graph-card2: use new of_graph functions
  gpu: drm: omapdrm: use new of_graph functions
  fbdev: omapfb: use new of_graph functions
  media: xilinx-tpg: use new of_graph functions

 drivers/gpu/drm/omapdrm/dss/dpi.c             |   3 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c             |   3 +-
 drivers/media/platform/xilinx/xilinx-tpg.c    |  14 +-
 drivers/of/property.c                         | 154 ++++++++++++++++++
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  66 --------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  20 +--
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
 include/linux/of_graph.h                      |  71 ++++++++
 include/video/omapfb_dss.h                    |   8 -
 sound/soc/generic/audio-graph-card.c          |   2 +-
 sound/soc/generic/audio-graph-card2.c         | 104 ++++++------
 sound/soc/generic/test-component.c            |   3 +-
 sound/soc/sh/rcar/core.c                      |  21 +--
 14 files changed, 302 insertions(+), 173 deletions(-)

-- 
2.43.0

