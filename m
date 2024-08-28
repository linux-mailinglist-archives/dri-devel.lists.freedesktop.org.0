Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B5961DDB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 07:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036E910E12D;
	Wed, 28 Aug 2024 05:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="L4Cc2ZWQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC4A10E4A3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:11:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDCbiKl5KSyHvXQZ80VoLYhOc8qkov0EoPSGSU9Qsrb+4/Z9vyTXknb+oYCErD5Ct1wGmkXF8aY9fkPZt7nFSg8ViGYkUqAEY+deLLETLq516vBdRo/im5ah3ooXnF1+Qq8PxbtLBSO33lcLDLPMrGPr2bBXWyRgHHiMToJZ7/fQi5CsJUArzUPfDu5ws+6ZR9DCS1gNmEMJdRKaDUKqxpU2i2BQOGd3vJf+tJy+IytWv3FuGmxidVYawsdWEHmicBCFt6kSrekgHgDDodz1tawAVxIJGLc8rXYbnEJLabgsPy/bRjjQvbIFfXWOtlAxZId2NQAVPWyH408LEb0ylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORL7Ei7RO9BhbM+8A2l1JbcbUgiECuz/HB0fToj+DdE=;
 b=m1/8qt9CJXUNzVyMPpI3r4tXSl6HyaFqEBZlLvfEpVyRVDoQoVtb7INMH/QZtKHS6bAvfQbQZ/faP/WYDBg7qslhGVMDYOk5ZEj/rEhliOl2oLLSGRJxYyaL1fjF0QcmIA1noo13m9LVwp4HSAih1+QvtqgOHTeBY2xH7xKukr7wTEQtSQwEWYfsg4V7CXZlsOlAFfIAKGe3ks/WC/C7MILmIDvMu/rY+T/p2Glq5a5X2hiXmBipoGz/UL55cv7upGmzvYicPCB6V4yiQv/SjTAQ4qQO1KJ/3artYhUUXRK4KEYbJcMswSG2j1/hg5+V+hbbnuoZycIVyrQKKYbdNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORL7Ei7RO9BhbM+8A2l1JbcbUgiECuz/HB0fToj+DdE=;
 b=L4Cc2ZWQ9QclCJtUpXjaKH/P0o63GgYXCIzC3JESOuGYFYS/nJpaPMkbCXeIce/0xzKMwty5xzxEiS2WCEgM5eJKCUMIgsuaxOhDnVwpdortXZ4IFEjMA4ODbTv1trSTUWjvZCf8cWZmPrKPlhflGpNNl8+ZpZewaqtrlc1FsiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11955.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 05:11:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 05:11:19 +0000
Message-ID: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v4 0/9] of: property: add
 of_graph_get_next_port/port_endpoint()
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Aug 2024 05:11:19 +0000
X-ClientProxiedBy: TYCP286CA0316.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11955:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdc2bcb-31f3-4ee2-23df-08dcc71fd9e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q2Tn3yb+jvkqqkQCY4UtP1TUEwZXLxRROsNgUi0jl7JSdx5fpsGXxLt6JEKU?=
 =?us-ascii?Q?lzwYDZbSqp3uUSIp9u5uECfCWAOqkrh7FLsbrWkeOFOBf5BuA/hb77rOJ5Y7?=
 =?us-ascii?Q?ZPa3XUPIFlk3Djir4Vi5iLTtgS+ZFYwEWEPQ7hp/k0hfYaJxvLawxiOkOH6I?=
 =?us-ascii?Q?XoJLq/LXZE7FxdRihxYMGhhAwW7ndPgWQ5khEHpsvgBRcx54dq4yfwSsJuvZ?=
 =?us-ascii?Q?gGI45nZXA2KllTvw+38R/5M6Ckc5kUEq8PD6m4l5k3BioBXcn1AZ7kbWc1mz?=
 =?us-ascii?Q?dbjphN/TpPdqaLUTPZuOR3fLG4iUSi862RFRiCmClLgYMiOzCdHcHpgr6Eg8?=
 =?us-ascii?Q?4ABTwYQymxPm0zq6AURXIipruESiP5JsUbeHPFGjnxECo8tjNesadTWL1WCb?=
 =?us-ascii?Q?s2tOgPbFZxgTv8fdx9Y/y9TH2kTkdBaBoaystro6TkLLbfm1OpLUF/OiUwL5?=
 =?us-ascii?Q?Uo1m2ALKNdqw0VOu/dUqbjqRPQNGuQ3jCPCx07zsEkUw2IBfYF0SdA/a98mc?=
 =?us-ascii?Q?mCJ2EtcN0VZ8cHCSEiic2mSUHo3hp2fstG9bbhpP/zQW6pjtCS48DPNlH/TI?=
 =?us-ascii?Q?Bz418JkNPfOZRhIK2VZixuADuWh2rirg+UCK8ZA0NIxvzIXAGW7nsQFOU9DQ?=
 =?us-ascii?Q?WxskS/FMxihUNbw6nYdSBE4AlzcqZ/IO2Mr/4FfKpnEl3+DR5eQSsFfa9bTA?=
 =?us-ascii?Q?VMhjkOmTZj2vByv98Kz4gG+Bl2wW7NBqSvhmKvh3y2y60t88AXLIpz/nQhsn?=
 =?us-ascii?Q?2yJUjOJMc4H4rdgwu2K12QnVR/8IZOD8JqnLD34WiHbv/0tPBtBxB0bLzLA5?=
 =?us-ascii?Q?byX/z79/sV0nvcopAiF9t7QVIMKYHsIrPg1Ceb8Wkau0Acvp10uEwnclWKT7?=
 =?us-ascii?Q?aa8GnjzGoETrRo6J0AjalPLy+FAZpP0gAPFs899ziPojtI4HR3qs7oX2wie5?=
 =?us-ascii?Q?wsxqOQfsaG+cImz27j2Svo0Ow03TkFun9Q8Eja1L6+BxPfIHZNzs3cfH6qLO?=
 =?us-ascii?Q?c5173D+jYkS8RAhWx64nLX4yztYRd2w+gIV2ri9gKsyzyNFa2C65Aey5DpJC?=
 =?us-ascii?Q?h4SMA0TM6F17w0vDObTsn4AQrP0Z167nK5ku6YEE8xChjeAGD9/RHGNT1jCc?=
 =?us-ascii?Q?DWY7wV5V6f5mI2ORs6BH5Q2t+yK4zoWslFBv2F1y1GKy6ugJtcsTHNh158Uv?=
 =?us-ascii?Q?NbZNJPXfdFu+Mi4UmrnvXJr+N0d4A/nYYxjTSMhS7BLMfR7a81sW5bspFNzU?=
 =?us-ascii?Q?/C7IvjpEQmqypn7gCFRfSSy/8foc/sq68Tyx+/5CIcpxuG/LrVc/ru7Gv6vo?=
 =?us-ascii?Q?Ro1R8W0QNUI8EGWT72B1R7+hDUjf+Eyws7CThSIOW21yPw/CBntDh6Cgybqy?=
 =?us-ascii?Q?8K7DraI9hXhGKWn4F7BH0L4MeGd4RolUbx2aIm1O1q7WUWlqFXv47s3b46S/?=
 =?us-ascii?Q?Higt1tFQYVM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jO1Rb+VFNRdbyRgbzk8G/kq6YUx2tiVVc0QsTs7suhPUg57Ii+hxROhIBb/3?=
 =?us-ascii?Q?YxzZ6JIwQZgfRG92z3UmS2nw6uleB83vrcdIJsQKAV8Me5DJv+v4JXIWRK1Z?=
 =?us-ascii?Q?antHRfh5weGf5oU10WmI4bS8JpribsN82BCfwssH+18GFng7D3bfhtTx8mF8?=
 =?us-ascii?Q?Et4jT6K2fjAgN0bhmeucGhVZGm2LL6jp6KgSGOBGVCS6SdizytjctHfWt2Kd?=
 =?us-ascii?Q?kLzvIx2eOVz6nwXtlCADiePgEpyRL4pigdqge91Gr2sGOENgw0eeAXL7N0d7?=
 =?us-ascii?Q?dqxe66IhFRCojfoajujY/PaQ1aBQ803BErXzwNgE604CGZ3e5Am4Epa8trtH?=
 =?us-ascii?Q?b5boLKhIlTzKGp5hT6CxoPAPJNaN0IkYpDDRAefAy7fjdXdxYObWtAeVKAta?=
 =?us-ascii?Q?qG/9AAcjMYS254nPNXYYl7/Lx3AUu0O7braPclzWWRIn0HcBo8W6g553w/2L?=
 =?us-ascii?Q?SFMO+G+Q6RjodEy74jUc8SY+AQydxhoVQaVzCdrquaQYVAqh7g68v6QMydf6?=
 =?us-ascii?Q?N9zQ/C0P66890VqxTPMAwXIU2XBgB1YcKilibjy+c8aGF+O7FZfv4hROoWO6?=
 =?us-ascii?Q?8pBxnNaUEu+fEzcahMo8xf+DZ+CRNo6Rct/3P2ni1flmu9aBJrPkNPcvD3nD?=
 =?us-ascii?Q?JcaaZTxU8MueifWkhnmqZstYQ/2l0Z7QWRO/qDr7TGFUY2Dp4M8/GBlIPS9o?=
 =?us-ascii?Q?AsiQXpbYTpf2xCvKL2aYv6gAVGW855KVbs8Cs2cS1LrricEPpmt5WW2rNlOq?=
 =?us-ascii?Q?rV+ZHKtp1PwKozb3Qkp4fZ7554qsUfcXXVbC7aOadYJV2RwkgPxdzY+ek96Q?=
 =?us-ascii?Q?offZWQgAI1S5BvseZqvZdYO50aHpRCxKXM2YYMJkOWt6bC1Y3UtQ3Kmd0rc+?=
 =?us-ascii?Q?sSVuY5MQkoYcGpjzNSVj7hIeBL1a2SXP2y6vX0xfmIzuHnfjSMheYHHJEi9N?=
 =?us-ascii?Q?lyKgwRMlG106a/gwnAcbYthBuv6No8jMXy/emMuYbOYK68vlq1CHYqNeims9?=
 =?us-ascii?Q?aorVDESiSGoljDw5v5piZc45Z23kW03hQC4vKVV/54n/uLzwjrZ5ztRyY5Np?=
 =?us-ascii?Q?9gO8707s3aEXvvgov1MCeV7tcWf5lSTvc7tSO0INb/MfgPTmMuFHKfmK4Lb2?=
 =?us-ascii?Q?RYgZG/VlMPFVmQI98MUwrvjujdAgKcJBzk4CGxv3ieLT2sXmNx2bFjtZStUQ?=
 =?us-ascii?Q?/vFCMhu4Xdtz+eMqeHe2SsRep7DTF9pf9f8hByj8qPvcqe5sjfWYhWPkwYgd?=
 =?us-ascii?Q?lIkxIK+722HETv9vCjCkZfAGAN50Xw1M3nZ1Jw9sEWF2VMAWx6Kzb7z04sJp?=
 =?us-ascii?Q?NW5fgYEfGLyv3+tz6PFrxo2HbNtTFQrISSNagvy+VetqvMUXl9kjuGsrXcTY?=
 =?us-ascii?Q?HLD/5ZpAf6r216xtDin+MM01yAk45JizXAy1TUcGjdCLJKypoE8Bfa+ibjuA?=
 =?us-ascii?Q?rm2fF0wRvXQxXyFNScKkaeu0ujFuqUm8C4uK8CASN86b5CF4Pvb9tLTNWPxM?=
 =?us-ascii?Q?55qY1SGsFD89lfRedk3yjb1tLWovY0UUi5qyPiHhZ8IMpEclsGJF7dTIRFDr?=
 =?us-ascii?Q?pEZvMzJ3+PqmOuolVI2XSrbBiOksn4rx03JsApi7cXViC7/T0//NkJnHxHH6?=
 =?us-ascii?Q?1U2dpQUClFC0KdZUf0qk600=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdc2bcb-31f3-4ee2-23df-08dcc71fd9e8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 05:11:19.4519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oo18zBEwWk+psBDsiUcBv2BoyrKIbtY/7IKdAntrhCop3c2p95AZHG5uLrSfVn0yJ7fBY4iNDQrBa1JD58PcjnPJ5n1tq3nmX6TgUgHLdnFndip7yj7utXh/NYh5adMx
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


Hi Rob, Saravana, Tomi, Laurent, Sakari

This is v4 patch-set

Current Of-graph has "endpoint base" for loop, but doesn't have
"port base" loop. "endpoint base" loop only is not enough.
This patch-set add new "port base" for loop, and use it.

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
 drivers/media/platform/xilinx/xilinx-tpg.c    |   3 +-
 drivers/of/property.c                         | 140 ++++++++++++++++++
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  66 ---------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |   9 +-
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
 include/linux/of_graph.h                      |  70 +++++++++
 include/video/omapfb_dss.h                    |   8 -
 sound/soc/generic/audio-graph-card.c          |  11 +-
 sound/soc/generic/audio-graph-card2.c         | 113 ++++++--------
 sound/soc/generic/test-component.c            |   3 +-
 sound/soc/sh/rcar/core.c                      |  21 +--
 14 files changed, 283 insertions(+), 173 deletions(-)

-- 
2.43.0

