Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B5A43237
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 02:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC8E10E507;
	Tue, 25 Feb 2025 01:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="PBEkZn9l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315B910E507
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 01:03:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFVE2jRMK2AsuJ0eJlQtN9w9cKy9tTTiChUmUNC/N3kGvG+jIOe70ePusDcAvdMCdSYvoe95FMopoTyNGmwSPKiqiV9tiPv3xnKCNFiZQVyxr2Tc/NDRz0l51oHnkl/c7XNUS54c1lptcnZcdpAlqAaWZyYe4RpaKI5o/CuVbUUMTOJeBNPOzKUlYyWIgJSSdLmoNMT+f0sHJH8H+AmV73dnB4oRaZQGqPn26Av73tK9ICcQabuAwqSSxEgvY8dzcvGjCwuOkx+yt+8pef1LyWEGcz+CV35m7qAxmsjli8ZYQbX5gX2oL/9X0vUIFz4sHs5XVE7M7mdo5m1p6JkcHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OclM4P3YFre4Ac2ytLDm6a6I7vf47rmzb3Q+obcjUME=;
 b=v7xiI8sCZBAi7HZoQIlfErBE/CmKCFm4/6RqsiJM+YQow0yYvyrpJgT9ikEiQjuSf2GLs0iLZmw3FAg6Ow90fk9aQj8vZKZUuOlb8PGwvPyucplbjeAz81ZRD0vnPFY2ZlytJ81F16w0rTt5vGSUPU2sHEcEmwBs8TVDxbMPzkGs9hdgo+LpCqrGnxpMfP9FikwXS6u19vwR4VRli0aXcKuI5Cxhp1BNwp9M0rRIBgTOeGubK9gtdyn28rhkuFyWPPFOCLTrYHGNJr4lbKXIHdyRtXWOJOkwg7ZGNdzeb21J1K7UPm2WwwYVuZoRxIXFycqtd97J+M0x5wBFsQmiPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OclM4P3YFre4Ac2ytLDm6a6I7vf47rmzb3Q+obcjUME=;
 b=PBEkZn9lFfvpuGqUu4nnO0J4i7o14SSXYAOGwc+1tAwZY51LeQok3p0UVdAVkoYT7hzxpn5Tu99edu2Wa05lG2GgGYVVl47TCeF8rSq7NCj/fajszPuidbwV6i1nTKklHLtpAZv6RMG/ZhO1vRVNtxsmEUndGRuGxRbhe0JsVdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14819.jpnprd01.prod.outlook.com
 (2603:1096:405:257::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 01:03:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 01:03:36 +0000
Message-ID: <87frk2sumw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, linux-kernel@vger.kernel.org,
 Algea Cao <algea.cao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, Niklas Cassel <cassel@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 FUKAUMI Naoki <naoki@radxa.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
In-Reply-To: <4988041.31r3eYUQgx@trenzalore>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
 <BA73C4A1-C680-4748-9CE1-4B3B19A14261@gmail.com>
 <5E535D58-AEFF-45A4-A1EA-1FA282F366AE@gmail.com>
 <4988041.31r3eYUQgx@trenzalore>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 25 Feb 2025 01:03:35 +0000
X-ClientProxiedBy: TYBP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14819:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e02aba0-fca4-4bd9-af6c-08dd55383b5c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZRatsoYXNTSMW/LIZNIQz7lSUUUDaTBUuaALKg7T77AMFF0lEZXQBRNSL/mC?=
 =?us-ascii?Q?YEQKhvD9szgalzwROI7itWXDAaAkIBKmAsR5iocStSGSC27oLFtgL2wXduLR?=
 =?us-ascii?Q?IscWDBzKmcsyRRQ2c2aCgAJW3ARsZTIOSj4uCbRc8L3u1yQiyD6qekgBCwPF?=
 =?us-ascii?Q?RJQB9iuzrT7bDI1E8d1jR36ifissD3AU3xoVV8T5+rGdozlHOXUkoMsjftG1?=
 =?us-ascii?Q?FphGbDZVZlIQOsEbgDKHFQQk2RnmfwDqy6toFkISnfLejcz0O52xt44r769l?=
 =?us-ascii?Q?whqlP2AoX49IC4ObO0QQhG6CbhNwP5V0jy3Sw95A3VMt5LOrGSGmUgOdOA05?=
 =?us-ascii?Q?73CprYIsjZtqP1tfIKoduEm67fHg7XzYor5a+EnUsqIw7NNn6jb9jNkw8NhH?=
 =?us-ascii?Q?DsZD5skLb4b4DGU9oV/7l5DdlZt9ZSps+R4U9ahGZEJNeBczKw+q6s+pvQNl?=
 =?us-ascii?Q?5yBiqVecEAx66iIm2HwCt/QEUWlzvxGbncP/a7gPWDackrvUEMYFPzJr6dso?=
 =?us-ascii?Q?QyIEJwhcHHXSEbrbtezzeHM6eNXnFJlAexrbM7TF240cDVik776aPjkhlSeZ?=
 =?us-ascii?Q?JRAh85OB6LYWC6HXXoxwAlV5B30392fkd8KEx4FvBD7uWioHK5s32viKM4PC?=
 =?us-ascii?Q?nmSJmXufifVdzok9fvtZ5pQHTUq0lNiSJka3SHvo/YxhqP7Jmmxu5lE4R4dG?=
 =?us-ascii?Q?ZkRks2poNBuurRQzsStBBvm2p3Vp5D8aRq09xyRBGyJ0W1RKPMZfCj/cSSCK?=
 =?us-ascii?Q?RiIGN11v0ysOQe+mYF75L+NNhpmBoAdhl1wFjPeqxUJwmjk8ZMHUm5dDF0U3?=
 =?us-ascii?Q?YM5M5moMGLGdfRUeTHKxGY9/kguDdCQiFtBAvvqnL65f0tFrnxTDvm6VgxTW?=
 =?us-ascii?Q?a1oDCkuxa2rf2sb2xPqCQtf9u95bSv6PScebtdbafd8sUGW/KSU8ahEoSKni?=
 =?us-ascii?Q?obMRktqGt7Q13op1nCKTxKDicOAHETwrUujcMIFbaIwqAwDcAaUIvJFC37ET?=
 =?us-ascii?Q?1GMAT8cLVDWH9dcl29OmgkaCAXI/hA9e1ufstLgpq1ezjspDSDoXv//CuxzY?=
 =?us-ascii?Q?yjHHMIboFRii4HnYti/dCa8vGH/j+chQ17aTM6pMmtk5JUdc4xf+1GoD7Vi0?=
 =?us-ascii?Q?YX0PkVTGR5oqH+ROT5coe+uWNwt1DW5oOTrOJ4jT1abfdytKBn7t8N8ZTPoR?=
 =?us-ascii?Q?tSqDwszsrQb5Nh4qZlZhxXuVD9t4frpahznoDmH00WFAwyquUUcEHrFhLF9j?=
 =?us-ascii?Q?CSUOLQqdQvZAfms8ypPWq8Lx7UjjtdtbbNuPuUwiUEhwSm9viCII90Kv4e8n?=
 =?us-ascii?Q?elhLMb2aG5aqArQlATCcszHWxPj1Dw/o+hMq8k2e1X/b2z4laLeFqLt/W4NW?=
 =?us-ascii?Q?1WbNDxPKdHzKmZPeOluy5RnX7VAuc61OcFiV0xpFA19FdvTJi093WapoNJcK?=
 =?us-ascii?Q?W/xFOJfcIzV5hNNTE9cz8ITSsDHDCPdx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+dB6o5K3eXor0wxaynAtvH6QMmm/gfJe56rj5bUls5Z6h6FSnIpQsar7J5P1?=
 =?us-ascii?Q?KJfFpHZIIoyQLPdBe2Wt6w4gQsxFEloJ5NY5sT2NeZHaNgrFBgclnJqS99B1?=
 =?us-ascii?Q?gh7GBU/nUlqrouDa0y2zSNnlXCJTFn2dqf+xZGzO/v7vy4TiVs0NI2Q/lMS5?=
 =?us-ascii?Q?O8mHmypwpwBQLZMlD1gDnoFzkdncRswrMMOkIMjFA0WFQeqhh9n5pQPj/89V?=
 =?us-ascii?Q?U7itp6lQZQwjneuWrnNbAUSnZ6Xh+1v6gdVTXB58BPbq0MdVEmoHXxxDQKQY?=
 =?us-ascii?Q?QgCN1f3zx/zeuETbEBEtsezf4CGHERGVfZi5jvsJcdoljHMugQ92LOwqx2o4?=
 =?us-ascii?Q?wr2yde85rnjCUfNHFW/gBuKwmEvXl52KDaqUNhpXYYCgeMKpCNGzZ2CKydOK?=
 =?us-ascii?Q?dkEvpk7CIliRshGOQJ6a3pBYQ1oVkvt88PXyxKFAGPLK9aGPmjObESSNggg6?=
 =?us-ascii?Q?gsxAUT4tNNhdZd2A5TdpjXAj4HxBOHdNp2lFkX8DIquDkxhc9nsupLLUd2U8?=
 =?us-ascii?Q?VTPhMyUWUdOvKLXIU35WLFEaMh9DFOp1ktSTHxHJP2ob2IFznJBb18n5KX7t?=
 =?us-ascii?Q?nFnk2Uo2ypaXs/uv9etq7knnnFIlm2hyauMw2/8uFFTneIWDiJIXls2ibXYC?=
 =?us-ascii?Q?PO37VE0JYTvxbZYy+fG3o20+LehyEGNEAXaVq8K85431kDI2cMThEk5wILL+?=
 =?us-ascii?Q?K8AL+KepE0RCdc8y7qhxNM2ZOwHSXM/fa2MZaZeSV9MT+IcDyPgO/2qU5nTg?=
 =?us-ascii?Q?WQ92mr2meOpGz/KrBx2O5eDxZhkgTWzNP2qK9weuGY+2B/WlJwuBKw3CZaXc?=
 =?us-ascii?Q?7lrxx7uYclY6m9oSkvODefGyWL96eUIDJ29o/gvpCGj/6pHzc+bhUcXWwpWF?=
 =?us-ascii?Q?r04u4G271DESjHo2FKwdXvLryqZZa2StR+hec2FLJTFys+N5/3K7l+l+fMfA?=
 =?us-ascii?Q?jTIQf5ANfMLTo9dIMvM2wzHUsLQX2Frcale+SQe0dMjX+2EdUWXySsRixzbI?=
 =?us-ascii?Q?oaAgnlrldsOCEdqL6+L7/zN4Yp3FC4h1eX/MsC/FnApSiINGX1rMwolpog1e?=
 =?us-ascii?Q?+udVgn37WYcRUAD0YygNlwyDPCtfgIBIRj+5dhk93cTnEsVjn7xAXJv9u+go?=
 =?us-ascii?Q?V53ep3evVvemCq0NoSPXtbyxIVTR52MGVFcFyNMDowzSQqitDwKiy//6VGRy?=
 =?us-ascii?Q?KV8wWy/X0E1coHaDjpU4uaihTQnJ/hRoV1qXWGsBZFAPDznn1sBMsy204zUl?=
 =?us-ascii?Q?y5gf5fTdugwl3PVX1rRr80bYN5kQnRyYIiRikEiLWT/U3vCdZbYnsro6UwVA?=
 =?us-ascii?Q?3YaqzL4HSqYCroJrVa7iEa+DGpN/49c8o0WaEPqGQIuQqdTRaiyowgrjDmlh?=
 =?us-ascii?Q?McecWkdJBgXan6CobHn8KuxyX8/PlfXX3TRdcj5Yp+dW3KrNv9RPLgIGvwRg?=
 =?us-ascii?Q?5oND1tYY4AhY3etXvSSjxQCIXtKawAFmrDHzPVu8p1DX9yQCb1u02VgfYtjS?=
 =?us-ascii?Q?1ns+ozhTtOLXMOW8cEHvMYuz/nQAIVciM4kl7MG3NcGL1/u+ESsom3l74ciN?=
 =?us-ascii?Q?PJoi+7vjjzRl8XfzHy643RBSw+XHzQVnewj0k0HuLukCWo2c8sKry3z1OWZ/?=
 =?us-ascii?Q?kmUl8lQhAWysV9pvvqZ/uVE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e02aba0-fca4-4bd9-af6c-08dd55383b5c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 01:03:36.0723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4F9ZA1CV/DvioWJCSQxDB15mNdGOd/63snCr0/ET+ANkusrlRPWskAXxTPhO7TZenHEdVkDjHOG4AHHYGWqKebKp9+GPYluYTdyX3QxiQb2c52ojGET7805JiiVg8wR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14819
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


Hi Detlev

Thank you for Cc:ing to me.
Sorry for my late response. Monday was holiday in Japan.

> I'm really feel like simple_util_clean_reference(card) in simple_probe() 
> errors path should not be called anymore, since
(snip)
> I'm adding Kuninori Morimoto in the to list of this thread for extra input
(snip)
> Especially those commits:
>       ASoC: audio-graph-card2: use __free(device_node) for device node
>       ASoC: audio-graph-card: use __free(device_node) for device node
>       ASoC: simple-card: use __free(device_node) for device node

I got same report from our test team. I'm now tring to solve it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
