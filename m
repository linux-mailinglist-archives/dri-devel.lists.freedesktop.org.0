Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3668E94888E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 06:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF15010E04D;
	Tue,  6 Aug 2024 04:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="cubo4W6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F46910E04D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 04:58:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pO9gptSOUMwGA9xO9g3BY1EBETpGeNSNhjwXeQuJsHIHcSyPRRslsFVdILZo4dlWrYYfZBt2wRnNphbinp4BlhsFgc7BNa8alJEqZUd/OityImSAvrUTn1Fl7Jj6ZFfmbgDj+bzFKjADH8w0GHjNuGBO99+Om90PYEnH7ARkIFJ7BBJmYSDu4RinxZlnePJJWVoWEk1i2nliuvWyOh+X4ZfJtZKgmZpSBdzsSJvwl5f6ZA5Y+gBfibBSwH3QbFI5GeyAR9x5zCkbZAqvAQQtmHZJ6TLqNa9NR1/gONxg8GttqgF9KpLRs8Ltw+xwZikRkVAhcMRy1jU4ZUJeN4Z+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8nD/5uyNe2wLHkJARAqr0/7o/rZUI6BDU20ibOgI6E=;
 b=StJnOMHicbPsFUltpXHWfy3M8gagj4KR68pN0MFyeUgisMt2UUgEpqLTxZlD0WxfVC/E+V05Iqe6ksd2iPTOMGL1cKI74MdY+vKP9VIVlLPIrZh1a06ZYot2pfOn/fAX/iSMAxcOYmAt/cux+P2yD/9zTKMp1gtCnCmX7XbZnaBUrJuSTOJIk2dSSxxpTXIzxad6onsQ8uZV0IK0Z4tn4XUA7EgRs67bCS+8gYdeCNO4upNBl9XGTflumH7ZPhAm5Zcf3fOBBBmyb+6mjpar0ckhGm/JhvmNK1lA5SZZFSpjNCsrEYVUnZAlstTn/78sy1LtKeHcYFDfshiVUKadNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8nD/5uyNe2wLHkJARAqr0/7o/rZUI6BDU20ibOgI6E=;
 b=cubo4W6kZnovnFmoQgmXg0lHPQirwK8RWu/cBegUJZBaM8EXYvwkDSK+T1JprRtbVA2pOschmR32IVTtyuQBY9bfROCRKfFpMo3jwAT9jz8vO4apdJfsCTT5dYRzN6b6FTk7pGIpwIYIXdvJrFla+hgaiyt9NNUsbqg3n0sKb6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6380.jpnprd01.prod.outlook.com
 (2603:1096:400:a1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Tue, 6 Aug
 2024 04:57:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 04:57:57 +0000
Message-ID: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
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
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/9] of: property: add of_graph_get_next_port/port_endpoint()
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 6 Aug 2024 04:57:56 +0000
X-ClientProxiedBy: TYCPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:405:4::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce5ab19-471e-46eb-671a-08dcb5d4568a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bIbzxOMsYRcp2+aneaYO9u3FGNuKTFQ959w32Ex2Qf1bJFqDB5LgqtGp6FAG?=
 =?us-ascii?Q?KLCFyKx4syM4LtxgqectlOnEc0OSaihP/K3NTxs7MQCmn8jD0TTRNt5V6EoD?=
 =?us-ascii?Q?mFzlZx9LxM3IXy14lF+51QsR8aGrCIKlWGCWts9CFhWdrdo5uTfiCvWvG5qo?=
 =?us-ascii?Q?H5muYoAA1z1Zja1KApPb6HFxk8+vumTnYa1kkZx8p104q2y/zIKqfmRTyWu7?=
 =?us-ascii?Q?bJkPxLRyYsl2CQtMsGVi9kdCjMCollwdlprD3J+ectSyE8nN4PErbLE2qyn/?=
 =?us-ascii?Q?/0lMaj4PR6dYDjcu9x94MaYAdJS4oLU9brQjwdZJJGiUhYVHTjUc53BDuUCX?=
 =?us-ascii?Q?lTnXZzgoVHOgmn5K0KtZKoM3+7oZPzWh3Avt9rHXvgRo7cSIUA2fah1T9gBf?=
 =?us-ascii?Q?femOevbM8z1GeZ1cNdujDEwCpPhftXO8MSHj+hgnIRUCKv3hs4ea26YEpne1?=
 =?us-ascii?Q?76GkG0gcl06b+F7j3yzqJMpG4/21Kw+g9vO2UwOOrfeihLAaAP5CsmydMNg8?=
 =?us-ascii?Q?Iya9/ype3ussOFKXZ/nm56He0dMvb+a9MsO0HG4jvFdUFQswyuagpQDU3k/8?=
 =?us-ascii?Q?G7BaZ0BX+zqO3hNzy0BITFMAamApEv452e6r6PRl2bwq/E48Vw6V/U1XiOLf?=
 =?us-ascii?Q?SPodbdfRZtJXxITWvhWrTlD7ffZURsiUyRXAiufr5a9r5odzCiTaACxn7u1W?=
 =?us-ascii?Q?hlakfMH2KwjQtXUMiTq9q5JcZHYSvEUVaPNGaiE5xABn3J6AS5w1RL3ZrhaY?=
 =?us-ascii?Q?Jf6/P6sJlZHKczbR2kDroytDTigRf2+X/erwXxrdTfrqZMh88ddYoZ9vlARk?=
 =?us-ascii?Q?fYehnLoX8DZQA8ELvS+l9+arOmntf8qUp2F99Ab5ZZyqTM1kBSJB9lM4bN8t?=
 =?us-ascii?Q?aTp6ZpcM1uINXgEDKIoWJCzzV+on4RcYlmVEnjXHJn5yPjmWU0DJGc5N/BAz?=
 =?us-ascii?Q?nJ4HIGMWkdEc1V8i6hA90x5J7fOqV28Z/qWNrsYa89gEVtGj7cTV89KkiM3C?=
 =?us-ascii?Q?tsi3cj7XNQtIvTJRR8l5UhXiLno/QV9rpcnl4barcE0C+1hnsbM83wLZ2kpI?=
 =?us-ascii?Q?FP6Qqjg53jUleDPVruHvLukKOPYMTPO//NW7fbXhQWtga+aIQ7jQlUWBhMbP?=
 =?us-ascii?Q?LUBVHJ+ftFXc36CT/2gWOO6fNyBjODhXiiDW4tuAdXSPuBZe6udVs5xuhowm?=
 =?us-ascii?Q?b/uv2bTKMzJkPI524ExAUhjR8R28RFj5NTN4oUVI0VeR7rC/gsIERgc5/pOp?=
 =?us-ascii?Q?ke/KntkQh8zhittYthdjv98TXcIwzgEKS2K5y6AGV1kCwltepM8IlH0zW7Iw?=
 =?us-ascii?Q?8tQq6UltSPtvjxZWhP3jUP+CtRpYak28tQY52bBBVi9HmXVVXhdeeE6Hj81f?=
 =?us-ascii?Q?usnSMRFjo5e/7CVoJMPLV7LvbmCV4rF7B1fcL7eKiBPOThRBtRgmzDJZ9Jll?=
 =?us-ascii?Q?srT/q598lFk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1V+Ookv4dpwnFFb7anNMiFAzSnw9qMCeE7cA54fmmc0l+dhwmABSxJKmjqZr?=
 =?us-ascii?Q?SvqgTQizJByxn/oZPmJm0zfRAD9MY2N6SuqnpzZZOCpnQBBt+VVMnO7y5AS0?=
 =?us-ascii?Q?gKcNUuDTyN5s1loHSstZacSM4+b2TgJKeSX5DxSqLAw0qUgf5t3zktJTujKD?=
 =?us-ascii?Q?P70kfFjdi+b1YUkfdkoo5lMWXuRn67YxSG/2sDHmzCOQ77K9vwFHcQKzYcQ3?=
 =?us-ascii?Q?itfJ4s2P7+Aztfx3OMmOk9O9JXoZ56KpliKRFXkKC2EmhtAFVFu0f/T1acOb?=
 =?us-ascii?Q?lk23ramWJAe2T26csAYypLDtX7OwlA/7FbYF5IBHIoDAMipyO8zlvkrC7NQR?=
 =?us-ascii?Q?of7M0Vgxd0fbxwkhC5vJqdF4VZau3v8XB5DTBZAlYILapHvGWPNb16atzORZ?=
 =?us-ascii?Q?oxUAwwQUrf3dQtAyVrv3rAG5s++2T/z7tSTNmGSLYXcftMtnbfD/XnDh00Re?=
 =?us-ascii?Q?JILKvz1L8siby8NV/i7374u3W2sF8lAd8dYo/RVftKjlL6NmwSZoJdb53zRV?=
 =?us-ascii?Q?7xDN2OJCwgkscQRfvOt7axoXLsbFHnNuP0eqAK01J+qRproSsrjk6O1rg0ba?=
 =?us-ascii?Q?zAYu4VAtQgtequXxtrwXhGYjplvaumbp5pU+nCl2uuzNJCQjU/olj2YZIYX0?=
 =?us-ascii?Q?o0wPqJC68ma06Xsb/c5ez4x7XeOeMaHx+avV0ZGYrJ82X33EFXcMpIeA/Hsa?=
 =?us-ascii?Q?1sM8VAVX5Ig3CG8WvEFhrpJRKctgKk8akO9AbYAk/z7i/vUBAud5dGeI2PCH?=
 =?us-ascii?Q?qFthtSBeGViSl5+c+2ZqvH9JrXgrBTsJ4Lm/xmUdwoHaxtenLVMLyK96b7Wk?=
 =?us-ascii?Q?dlHU4murXpjjrBCOjtAQSuZWX0SeqzdDo98mbq6YftN/wnn549I3XEj4WRin?=
 =?us-ascii?Q?4f7jgxIDFMrTTLGKFH3x5UYuTv8AW867HYIDxWG8rLlDaqaOe+TT9c7FBvCR?=
 =?us-ascii?Q?P/bW5IIr6MIdCAeZf18Vur65N6KAt59P0dtHo6e9ad7bi4I3U/f1NiVUjDhj?=
 =?us-ascii?Q?021Bnx0aWobX+Bwr4Em1S/zrH4j641SOyf7d/tEQqv/oc2nyBg4hotqFtbMH?=
 =?us-ascii?Q?Cq5sx7iKbtJvDaH2ECa4B1j2UDih5i6ESsGc9nMxAFs2Le+9MVTSqiDOznY/?=
 =?us-ascii?Q?8D2itOSVHKrK7e7qlxsLMUdXn4/N5UHndBGp5lq2Ae7b9AD0MxDaiRNNXhYb?=
 =?us-ascii?Q?1xPKTP2IP0d+vOEHIZQu81P7avXk6naNy86A7O4KXSh+6QUbthvGme3YcdfU?=
 =?us-ascii?Q?IgM0QfHsHt9O087XKBL/HneRwWQx5humRqCiBqnKVtHwnDG23Z2csM04s12n?=
 =?us-ascii?Q?Gmwd48CtVfyM93zwLsP2Dci51K+r/RMFG1cpfr1yaMCPCVOnwqqYi7xeOQPP?=
 =?us-ascii?Q?spPYxtCFoO+xoXlj3u8a6Sx99BUWdzXPNDgFL7bpR4O4x2qANrLVk5n64g4P?=
 =?us-ascii?Q?00v5s3v05Nol1nDvjgUiUfj9jgNgS9waiKONOKl0DEf2mMpXyOIYkJydddyT?=
 =?us-ascii?Q?u3M4aAkSwhrbWLxryUXsZyoyC/EWMTKOz1+Sq5Hnmn/sEXeypDzcpd/g3E7f?=
 =?us-ascii?Q?CAMI4bmi8IqgJYmUKoF5hhGyiVzK0S/NO92s4GLnLnTia+UD2P3cTAfqyL3q?=
 =?us-ascii?Q?nPbEz5L8sc5OuEWhHrruykg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce5ab19-471e-46eb-671a-08dcb5d4568a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 04:57:57.0941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6EOrTwJspgcDOnyPuDMlTQe00ai8+0uc7+f/bq7HPTYj4PT8Kgo1DLal6zyrjwo+IxSYc/h1CRJv0uPHX/HOZQ8MaNfbLWenmg8J3/99l4a5dW6BAH/5yKwWneUbN1S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6380
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


Hi Rob, Saravana

I have been posting to add new port base for loop function
as below steps.

[o] done
[*] posting (A)
[@] this patch set

	[o] tidyup of_graph_get_endpoint_count()
	[o] replace endpoint func - use endpoint_by_regs()
	[*] replace endpoint func - use for_each()
	[@] add new port function

Because posting [*] patches are no update during this few month
(I'm keeping re-posting), and it and [@] patches are independent,
I try to post the patch.

Current Of-graph has "endpoint base" for loop, but doesn't have
"port base" loop. "endpoint base" loop only is not enough.
This patch-set add new "port base" for loop, and use it.


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
 drivers/of/property.c                         | 108 +++++++++++++++++
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  66 -----------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |   9 +-
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
 include/linux/of_graph.h                      |  67 +++++++++++
 include/video/omapfb_dss.h                    |   8 --
 sound/soc/generic/audio-graph-card.c          |   5 +-
 sound/soc/generic/audio-graph-card2.c         | 111 ++++++++----------
 sound/soc/generic/test-component.c            |   2 +-
 sound/soc/sh/rcar/core.c                      |  12 +-
 14 files changed, 244 insertions(+), 159 deletions(-)

-- 
2.43.0

