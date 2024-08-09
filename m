Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB43394C91C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 06:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C5810E84E;
	Fri,  9 Aug 2024 04:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="NrSHjMaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1412810E84E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 04:22:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieQPqjRM7R1jy7koM+UmytId+/eOwOZsbAOzKBEMVTNzmQO/sMyVLvbxvhqF2ygQsl6oC8WVZABX9QO51u+eB8HIuNjdT0HWKNqH5FM+L+0EMODuN36YGJWExvSb/kVraiY7IiyNfKmgpWGT1df5aS2Sj09f9FgD3Zqzv4XkLgUBJnzzF41gY973WfUWbsbn2ewIqeJureNL0OgnnN5Q5NxHELsrFvk/v1t3P7HNB+aXKNdoPl6s8tfhkUdmF39wmXy1DQOIx9BvOUzYLFFb5C60U19UHV57KcZFFpu7CJPZDdPI+oXaJ5Csc3eDl4PKaJ81/h7XPElVufYuVemCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpFTF1GlukPO/8Bq6o1bb8GrIrcSjPZTTyY06HzNDdE=;
 b=EFzFltV+JMYc5DvHXVS1VgcIvzwFUA4bRqTYFnzoIUgoXxrZSiEDl36HLPKzSIxoNNBy1/SsQ7eHELVFk1P3o0g5SzY9RYs6vB/usqGiJt7NjVrxyOwnm3BuA333R1c4JOMgXLNMcnFdMOG7FmEBm8B+xE1BDUPYHUjDlbueaVyBLg1wEno2qtNCV/EtBsVc1LSeK+hcGZHrlFMPukEa0ml/UnxpolGTOMoX2V053GtYkRQlvPXO65reFd2HOvxzp+vZX4clp+ff0JpMolYImJ19LEH/uAx7NqhJ1MkVJOMHnDdOhYcdACJrpqhOHDKi1ctft4nOi0gmxZkQnBQzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpFTF1GlukPO/8Bq6o1bb8GrIrcSjPZTTyY06HzNDdE=;
 b=NrSHjMaZbIABpbkHvjnkeXdPU9wQvGnEoIb+3Q+EfTtXWs58piZN56zr92vm6tF01VYUW153UJ2ydzhNYvJN9Pj/HoSQ/15rQqFNqVBbQp+WxkYITbLVOAheCaEaDbxsnriNALqsPCpFGsD7FFrNwRJGciYhneokLk88ceSbIEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13048.jpnprd01.prod.outlook.com
 (2603:1096:604:334::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Fri, 9 Aug
 2024 04:21:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 04:21:56 +0000
Message-ID: <875xsa8gws.wl-kuninori.morimoto.gx@renesas.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/9] of: property: add
 of_graph_get_next_port/port_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Aug 2024 04:21:55 +0000
X-ClientProxiedBy: TYCPR01CA0098.jpnprd01.prod.outlook.com
 (2603:1096:405:4::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13048:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bdd633f-2b2b-41ea-12fa-08dcb82acdc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HNsCYzZWfcRj5Q0gG2IYpWglx+OjpD/BANC6SrV0uMXD8sFJfKHAZjnuA2Af?=
 =?us-ascii?Q?Y/c1pax4MJ5q4mjrglabPY2s5uWjYaTyjwgpvvx5FLbNsZYxCz9N3x0jI1vN?=
 =?us-ascii?Q?20pkcw4ScLCpFhtiUVksJNImPSsqD/mAEiCvu93ev9sd57N72TPYFr7dz47G?=
 =?us-ascii?Q?m225aa6b1VYgqYgOikk+T4/YUMYaHDpAcrTow3WzhqzjhlbejTJX+C9s+Yeu?=
 =?us-ascii?Q?b87juWoHqdtcQCPHB9NBMIYaWZqoNbJSuBPmFs6s8rCoc0XE/3I3R2giuNLb?=
 =?us-ascii?Q?Mr1ix5O/jkvbykBPxGVt/SmrIERtFSPPNuYDnqnEECCB3yVI2j4O53T9x15P?=
 =?us-ascii?Q?H1NJR4OKUIpy4oZiGhlvrSKbxctV3/6Lyf4xoVpP8S7lqy7bmJgizECdepX6?=
 =?us-ascii?Q?69fWwDrJsKKEV7u3SfYJNZTtP/Hj9pEEx0qB6nGdeMHl3aqaSm6MJuggaso3?=
 =?us-ascii?Q?ZaWT103HI8ILsmnAr6RQBhb9e86yS9z3RcBnYQcXSyGGs2EIDZLoHcf3VKMa?=
 =?us-ascii?Q?QOdXt7rwRB5tWNXWj0Ke5bnQoDnqoY3Gh6m8wbZvZVE2PMbglFlln+Gw/DbG?=
 =?us-ascii?Q?vhoxJblPZE36jcyu3H5ZO3O/Sop+132kKNQsgA/zMh4DVapR0nGvUPCj2FpY?=
 =?us-ascii?Q?3aWvf8UbayWIjZwESB71eHlRvTX81I2FynikMa68XUDooMMc73I46gnistDf?=
 =?us-ascii?Q?NmbuRK942RcgLg1Vx1q5fA24DT4I3r5E6Ya1MURuZUs72EMu4qM3IPeiyjF/?=
 =?us-ascii?Q?erpqpz/N8ADhSnAcB/nBg/B3zEoRsV9pG4pxxODInF8noHqWUpeL21zaYYq3?=
 =?us-ascii?Q?I2a+Hn7ODcH6D99pr9TNN6o4BDH7v4Drf+vgeqPKE8QDKR1UknPYytXvqSvY?=
 =?us-ascii?Q?3URcY7dclXV+27MdFhoM9GMxtqVBK4uquAYrmCBH7Ubv9eg2QfoQqSE5KUTR?=
 =?us-ascii?Q?ljqTlKuu0zCjDHWM2nBUNqOrskuAyEoxa9L8t8iLJi13rC8RzBmwgZMEL8NI?=
 =?us-ascii?Q?bHapBe0RVdoaQf6O7Ur8+Kgrnh896rgCegCuUrWtq7pOygyD+lKGD41OV8ij?=
 =?us-ascii?Q?2IqYc91eP3ZTr1UXyHmNgDp+bf0ofIrtjSFGoXZn4QM8ijRACrXqeHaSwVU0?=
 =?us-ascii?Q?7aRzl3aFXjSS3QVoSfiMDO8mzMjg9m9mJkJvi4iYhoFaHcAy95pZ3ULuWdY9?=
 =?us-ascii?Q?UIg2SFl4HbIhVQ+0OyBmbRwgwwb43CrcJYAOSMBJLHLzciTDkkaslYbvAiik?=
 =?us-ascii?Q?Y9lnlCXtCooQ84qOhPS+9eCDSrpGc1pqPtZoz2VRDnVF2RehfmN2Q6hiuour?=
 =?us-ascii?Q?2UjwHFU9kFWbY+D2myI8MeBepaQWEsiBB12xeWbe8FNLRMQnA9TL7Zjgxhk1?=
 =?us-ascii?Q?vL23EGF/RnB7Thq14SMz+NoEJttMmlgUgKrBDQkdDaW/T9+k+V/ElLpE/5on?=
 =?us-ascii?Q?g1SKusnIVEo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f3FYhEWV+dnxALCTKnBaO9n7IF9MZa/kuqlDUKYaHeZ4V6qTMBvgQaTC5fy1?=
 =?us-ascii?Q?bBlxXMCnP478wCqiyxqlOFNcTVkx8C2yyM8E9UJykmqCeLEEWHblTuHRnlSj?=
 =?us-ascii?Q?zEanYW1eHk1VdWqensjjMwGS4ZC0Xfy05wGPaIpXPYs9hFqiGSoQzXWQGfRt?=
 =?us-ascii?Q?fm4ZDtWme8Pcee8zl3gLAOW7bgduE+u6xMFRA/bXmLJuyoh0kGBk4i9I5OQn?=
 =?us-ascii?Q?8fGjfT04HBrQnTMQ2qDqPLBfGAJMO+/woq5xKAqNc/oNo6EEL5CUTBVHHXvw?=
 =?us-ascii?Q?5WH6A9NhrB+zoad11xxgEGMP4kcF0O5WZlocPVvI9zUwhkWYe3pzzRl0Mhoi?=
 =?us-ascii?Q?8DNqMrJGSHLHk0pVwNyXHosiIAy3rlmMbcIiYx8Qy9kJLv3ttFdL7PZxOku1?=
 =?us-ascii?Q?jZ1ezZ+JB/IclVvVjBkI6PmUkKAReY3PMeedKTNdyDmAdy2mTl/xfJ7YgzYG?=
 =?us-ascii?Q?uE95Ij9iDeAtxrdXjN94cXTuWMv9xAXC16rcnqkQfP6+/1u+bdZ4I1UwaiMt?=
 =?us-ascii?Q?eLYZB9uODf0hs6NzFhDwSmH7ShcmRnDGc4bx699eo0LsnViCPTQfRpCC5fFT?=
 =?us-ascii?Q?Lk5hsD+vdvwmKsqDQ6mrPfSGL2l0LAngkrYQeojjNbroNR9rTcNGdE6Bb6AG?=
 =?us-ascii?Q?onk1lDKKPTn/yl9VBFqgbGh4kEOGZx4arVf0PqJTqGh6Kaa7sJ2jjTg6/wU8?=
 =?us-ascii?Q?19xgntXV5J6nfUI35ohI2OECeAvv/QSwPbxEeH0/Ww5M1wCQJEGAAQLHq5Az?=
 =?us-ascii?Q?vcx430RkXabvaOud5uKjv9uQhAZisQ+rXhUWEfJopJsBvVGKKSro6ZDFo8W+?=
 =?us-ascii?Q?w6/ZcFNSoacHT3mkR63M8RF2RjzsuxLqPyZYHkEqSiT2N5TBfnYmJuZR2sQF?=
 =?us-ascii?Q?sWsjIP9dgRw4sw7nBtYbZvSWg9V9SZ2yljzVQWyQCgbi3CX33v6YjEpGMED5?=
 =?us-ascii?Q?O6vkrlvCjwh7lWlMXuBm+irJgydsTzt9m9njH+oWpseIZlRH6w3oWGWYFysn?=
 =?us-ascii?Q?Gw2eQ6C0RCEkBRabs5aXQjLa7i5FtsQ370e4VeBZKvri2puxYyL1X67WTuUI?=
 =?us-ascii?Q?28oyyuXBqNwyMwG/dQGZ0hb//Wzy3rjqvSX9hhWfneipOq3MNAgsx4wyW/5g?=
 =?us-ascii?Q?KTaebsqqXpe+q1/ePPHEk8cjKvx6lNxWPIH3/lzexqIZjRCyrA+MiOFEHdY1?=
 =?us-ascii?Q?ntQVcsbzSoNohEtLbHDHOGY4A7k4U3SGt2ZUjzJrcOrRrA3TTzGhdWR3o9Yf?=
 =?us-ascii?Q?3nTxhIP7mWGJTliDmVtwZ6r3MA5AaBUl5LRVuRWqPtjuHXrFaCKUqxQYxtx6?=
 =?us-ascii?Q?90DkOFGtBzqxMP4k77i7tkmQzxD8fBnVjyTymTbcorwggVXK20VYMjHGor8u?=
 =?us-ascii?Q?iXE0qLWJan1nMLM3onhkCeVpBCV1aIr1dcH3Fep5uzcoZMz5pGhQcFnKl6EX?=
 =?us-ascii?Q?XLC0fJalRjCN0mj4mYWi/Nvp5Fw+PiqfYFTMaM34CGeWKi71REQtxgfSThS4?=
 =?us-ascii?Q?WG3/tr+jFjkNWn7oMXyrFnuOjfyIKoP2if6Wy0GwPmX2NaLKmx6IXLZC7NUb?=
 =?us-ascii?Q?7PKFdPrzNUlArUq8+UyKHmuoqxbGRjvDxvX0OOSm8om/FXSOygWh/nYJJAyw?=
 =?us-ascii?Q?sBxKQTAgQq7qYFGfstwLFok=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdd633f-2b2b-41ea-12fa-08dcb82acdc5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:21:56.1146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtAWNIbxQE9EWf16UK7wMyA8Ehp4pTrnnjrXBBzSn4CSw13MU0EvuIIE56yvMkDQ+P1M/k9lxBWLvg71UzIg/oBwOgbU4GQaiROXiKT7kQOrgy6XeaBGtvcwIzBi0+LU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13048
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


Hi Rob, Saravana, Tomi

This is v2 patch-set

I have been posting to add new port base for loop function
as below steps.

[o] done
[*] posting (A)
[@] this patch set

	[o] tidyup of_graph_get_endpoint_count()
	[o] replace endpoint func - use endpoint_by_regs()
	[*] replace endpoint func - use for_each()
	[@] add new port function

Because posting [*] patches are under progress, and it and [@] patches
are independent, I try to post this patch-set.

Current Of-graph has "endpoint base" for loop, but doesn't have
"port base" loop. "endpoint base" loop only is not enough.
This patch-set add new "port base" for loop, and use it.

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
 drivers/media/platform/xilinx/xilinx-tpg.c    |   3 +-
 drivers/of/property.c                         | 110 +++++++++++++++++
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  66 -----------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |   9 +-
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
 include/linux/of_graph.h                      |  66 +++++++++++
 include/video/omapfb_dss.h                    |   8 --
 sound/soc/generic/audio-graph-card.c          |   5 +-
 sound/soc/generic/audio-graph-card2.c         | 111 ++++++++----------
 sound/soc/generic/test-component.c            |   4 +-
 sound/soc/sh/rcar/core.c                      |  12 +-
 14 files changed, 246 insertions(+), 160 deletions(-)

-- 
2.43.0

