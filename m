Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A5496B10A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0F710E248;
	Wed,  4 Sep 2024 06:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="V/HHIpoc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFB210E248
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:10:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzLmbBEATDznAhL8coDjskldsuhIYwAdyX8/yGYtJYffoukR+SMMoBCEJsnJVqDEis8Crrf8zsG2o4od9JWai55e3bG5/lPeUTLTjnCdjzOcxUhtnMIgm6BKNQDLm/lIUBdPOSqL8b9sZZ3GI2xB9fi22BzCBMRlQoEZ9aAKK1Nb8jsum9437NOnCczUR1xuteLCFhHj3oWC0WgjVCP2tDaC6MdXW9wraK20xV3go8kT4XRdcnOSOiANH7BjYdjkA3wkS6ON35pjUFe3Az6ztQkb+DT2hraqyShALqBffNw4htCVhDm37SqHAYz7apZLw5Yxd6dc6FWRkCgSW1kZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZ7MSSuEtXzSVh8muvkP0VG50JwLfB5kY7ZEGSQqudk=;
 b=lHLzfDl3NVAIxd7j12lTlrGTv7u3uaXY+GQ+onXNpnTPZipFpltSDPPugxx+kCfon4UlaID0CO7Qs1YH8bM95TPhhsKPoGKQogoch2e+EVKaiOr5LOO+EavcOu/om9fwvMvsPagsmjOx8/oLpUoh0B5OVLxYbR0d6zjROhs86W8cOMiZAYYwuZy9EhgrNLwyJzoxf4s8BT3tkUl9AxkPzPqehbU1r2+8zamu9Wvm1lh72tfHjD87HWrv681+RSujia/afbfSxjSj9JO2LDzxd1v0n5jD1dHigYmPTQy8zaEFxxrgEIPyJ6kB0gMmMqgp9AmyS4wpaDgR3H3cR7vi+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZ7MSSuEtXzSVh8muvkP0VG50JwLfB5kY7ZEGSQqudk=;
 b=V/HHIpocXRkI40HAQCFkGxBf044FGJJxqlePtq2fwail/zT1mB2kGZHUkSI3WgNDaz0mLIwx/IFTi6UVWibrWpUNO1PCS43hT6m+vX6OLwflg/cmAUnAtlHZi9NowZ6CU5MTbyzFOCTCTaXDESd13/9X1H2pF6/13PebJprJb7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6338.jpnprd01.prod.outlook.com
 (2603:1096:604:e7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 06:10:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:10:47 +0000
Message-ID: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
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
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 0/9] of: property: add
 of_graph_get_next_port/port_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 06:10:46 +0000
X-ClientProxiedBy: TYCPR01CA0172.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c02ed20-3b5e-4498-7057-08dccca8515f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|52116014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pS7wTLGahc0Za8BDJKa7zIOKRTJx9r5TqlI3MJvC9LDnKnUzW44NPJ6IQSVH?=
 =?us-ascii?Q?vRYYQDz2eed8Oe99YoP156b8uMjsFhyk58OaijQzrQdiBcNuzsFmXyKr3EXL?=
 =?us-ascii?Q?rmbhrrZRRURvwo38yPEa9YMgAAE+Y9eQOrysvm8qLxD4uGlc+Gmwmfp33Tb4?=
 =?us-ascii?Q?NawWF1OnZheD2v5R4i9fBE0HyxElzj+ZebqN3Fg4inPhsybdCutU4cKl4kdb?=
 =?us-ascii?Q?Klrx+J296Im430vj+eYsntlelXiocTpOGcZm/nC9nctpxrKLSKCecquz2h+g?=
 =?us-ascii?Q?pmqDRCocMYo9Y7X2+dq6InDTkswn7ChBKQHKeFRWb0JiIDF496/IQVJozyhO?=
 =?us-ascii?Q?Vyvwl1nY04s4HGxnAZ3BwPMC5n6bnOBklriKkSP9jnIuf8dUnZaBimUy/SH3?=
 =?us-ascii?Q?ejwc3ekrtAKXxNwoQOreVu+VQAfNTHSnADMKQS8SpgFgr0pADQEiQtEdpRDF?=
 =?us-ascii?Q?vkyQwm19F0+7UpGz3glofZg43aoQzteAUW0RlEQaoThh+m98ICTKKkb1Qpwj?=
 =?us-ascii?Q?ffHtJC94IpNdDqGugQkVldKkD2NJM4NZiHvb1THe9PfNPKbCozCeqDf+p8uy?=
 =?us-ascii?Q?ABGOwi4npNZPZUgZFAJnqWxSxJRHNLFmXHvasSZF3bMnbdXuMC6xch05/83R?=
 =?us-ascii?Q?yKUOrxVQCcc1VUBo/fcQj/EAA7PhTmR+ghNY+ywoec5HXv7Gw1vpI2DGO6/i?=
 =?us-ascii?Q?i9LZjQwAI2paIUslDTTt+QOBE6MFeaqtMZPkxfM+vtZdXJwO5aGNPbryPnJs?=
 =?us-ascii?Q?qsToEhrX4Ra8ab5lCyf5v76a1yJ4U0ySu2bFG+8S7Db3aUeLgudNJMS46f9X?=
 =?us-ascii?Q?j55PMalndfXxcEC/FACUucwAYEJlYnh/KeVnhjlTAUu/sm1fhDg9hQlaZuve?=
 =?us-ascii?Q?eLXvkinGA0TlPqGIpSTsWIJm0MV1ASunrTkfB+5TpepkjQexI/WtxzRNT6Ta?=
 =?us-ascii?Q?K8qwTRfrYCunz7dB72zxYI+hFMr8R0/DB+AZ/EHPwFjfM5uJnoRkXjLACbNu?=
 =?us-ascii?Q?qtboB6pF3Ow828WnkOTvPzl/6vG+0h5kXnrI1CLjHV9ntP1d5hcF9p3e8kAt?=
 =?us-ascii?Q?1cdR+p9W9j7iCysao/9dtjM8LAuaKg4+Ucdnzdv+UdNg4l/l3e9ylJ2gM7LQ?=
 =?us-ascii?Q?NGzeHBh7kzvWD1GoU4QoY6cxTV4gDq9EJEzRqsqJTX/560I9hNd1lbwRifOO?=
 =?us-ascii?Q?p9urX67enOUn1ONsf3EiJm5yUSCNXY0tFfW/XOTnDv1gf1W2XJ/auFp57okq?=
 =?us-ascii?Q?1qLhRXf2sGsVbxXOYNPWUXD8rFkvFTahrfPp/tAuL14FqHO+/a0l25D7rqzw?=
 =?us-ascii?Q?V80TPWNdv5Ta9cG/w/UlHns1yxESbKwuSbOYx80cGJAzpkUipGC5bWbWtk9+?=
 =?us-ascii?Q?ltocmFohh0Fbf4hqkkyQPmdqIF5RxGbnmvVWlbql376MQmSgdytIpkkrrwe8?=
 =?us-ascii?Q?fVREV1CCHkA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(52116014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?peaWUHd0yZhDL9H1tuZmCqUM/UlPS84u3fecCFxSAn1VxOCc8mwJp9Pi6dxV?=
 =?us-ascii?Q?vQQX2EB8urchW9GPRuArLoPn34X2K/8p33lILN+Tfw/GUqdo1ALaIt3qkEqv?=
 =?us-ascii?Q?0Bh7JudRYgUpSN3WJBYk1yGqEfEZAwc21EzqXZqlrcIz7tuf4rDLkNf3eFXE?=
 =?us-ascii?Q?WhG6h+9y/yrCIfxmtuYtVEX0WQexIlRk78eMCF2ulA4RCMrtmFHqVhokPqqS?=
 =?us-ascii?Q?EEzilsJjsZiln8RwIFnMl+usueEa3/nMoOrUX/6SA10tGjcXlchd3jHUSZt8?=
 =?us-ascii?Q?AREOxF+LAZNWx3HyiJtAogqZc725krQs7WtQsh0wzYOlDdi1JBmeE499uxK2?=
 =?us-ascii?Q?46e2UWYkxs66kH7u9r2yxqYmFzyGL168oUeEoWIELicblqM/1PJakBlP+j6U?=
 =?us-ascii?Q?KfhisISawlmiRE02gEx5sBH+3iNouN+XzY22zHzzYSBlnBYdx3mlMUv5ckz2?=
 =?us-ascii?Q?8A8Hg8WWEEtlSKFyTyvdQkzDXyTlhn5c0foj6Ogo7+nyCavswA2SsYf/wY2O?=
 =?us-ascii?Q?BKR4MQzyOLkpFCJhFLSB43T/Sw7as8G2/NFvkA14FB+Zc/cd00AEZqpbLKHT?=
 =?us-ascii?Q?S8udnKJlV1qKGNxMm3m6o6Ud5kRuBEHIL0XG6nd71/bYET2GK35uBIIEsKWQ?=
 =?us-ascii?Q?Hiy7yLdLA6ytWkfi44Dhh7LuDQr1uInI81vIJoBKdyjAB4IzW1E+7GSe6ARH?=
 =?us-ascii?Q?UGfPiBLNPopvjauzs1/uBnsXy7wrPCLp2aKtfE278jYNabb4SX+8BizZS4Nm?=
 =?us-ascii?Q?G/jgGPpqpAa6NuMoNAQvUKu029O3SPt3hFsLaQ+AzVFpfRJfv08NXw+gLkud?=
 =?us-ascii?Q?Tro6pWvOGTSK9BVUHZWBQoYvDlkCAYp3cIzbxcu+vw7VC6Yx8DqNpJvQzbzS?=
 =?us-ascii?Q?RjF4Rq0jHqrvfc+BCG7KZvkXU550Zo6EzFLrwH835WqmIalZ7VTXMqb/0Zig?=
 =?us-ascii?Q?kKCSYNvoYVW0ZYa/Lt952QRii6syJUyE0VdZZKhYlvXYeuxeXl4fcLcRnAQn?=
 =?us-ascii?Q?lMFjSZNX1sZoFwSWsVf6hqVrWKLEwryHkdRBmU3ooInBIUOHQxdLM4bVH791?=
 =?us-ascii?Q?o/rpfdtj3y5scBnaeQc1FDfSdp5MMPD4afueBt9L0EN69ODwIUmLIJ0BRJPj?=
 =?us-ascii?Q?MmK0f7eFBHJN6Zb9kFwQF7akoZhOgKdcXM3YyrPf5gcYjcpuImhShMMDVFjr?=
 =?us-ascii?Q?F31U68LOmbK/3rBm/PAst0oImEDDNTf7CI6h8uZ6Kr+FhIPWFS0wDLdYfx9u?=
 =?us-ascii?Q?qydxmhAZjNlov4pcHeJw7g6fHdKUSq02P7qqMJWjz0GfI1UPt7mG7TylrMUz?=
 =?us-ascii?Q?oYYNVyDSr+sBVxoYpNx30ZWcoYX9MC7yxGnmuxtGRSnWiNwQtRFCfkEIMeiI?=
 =?us-ascii?Q?4duZHEHQfe3n1Ya3zcINriYcslF8YywZ2SX+YcWTF6G/oQCD42lxoN7DgZqN?=
 =?us-ascii?Q?7sFUNbCEe+WTeYxXXLIOwmDlKgrnAVK4kn5NfrGkMLJjnf8knwKx8J0B1Upt?=
 =?us-ascii?Q?dN57O+USIJTW2DNdyPaa8xsqMO8+5IlJv7EO+18lEcV9mpVUC9Diztf9PaE0?=
 =?us-ascii?Q?VepYlSJ9/XOvpYwoacCU5zLOSHMA0T4b/WVjddN5J8Rxz0fT18e83oN6Rt7q?=
 =?us-ascii?Q?bgoPw5AoU2DKHA0Y95+4c7U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c02ed20-3b5e-4498-7057-08dccca8515f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 06:10:47.2692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61YQAMZLVcCaoz9L2r5dYK+jnbegS9UyhTxBuwvpTaGeSQOuQbXaSZejM1gDqyYEbnCOM4fRC6U12V2jt16DYnLooi0T8wXVLwiRY/GVtvjkiQurbwmTHkHO6PpYEniP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6338
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

This is v5 patch-set

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
 drivers/media/platform/xilinx/xilinx-tpg.c    |  13 +-
 drivers/of/property.c                         | 154 ++++++++++++++++++
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  66 --------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  15 +-
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
 include/linux/of_graph.h                      |  71 ++++++++
 include/video/omapfb_dss.h                    |   8 -
 sound/soc/generic/audio-graph-card.c          |  11 +-
 sound/soc/generic/audio-graph-card2.c         | 113 ++++++-------
 sound/soc/generic/test-component.c            |   3 +-
 sound/soc/sh/rcar/core.c                      |  21 +--
 14 files changed, 299 insertions(+), 188 deletions(-)

-- 
2.43.0

