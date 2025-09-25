Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1BEB9D573
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 05:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E8910E277;
	Thu, 25 Sep 2025 03:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="esa5USfc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A9110E277
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:55:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzs1FWKhixKolNN3m7PNhJsg4mQz477ok7ievF5Wj7/VySMXYvhxsM/Y2C9Hy5cTtnwNsOjMNHNvvc2yyb8l05N1fcLmBULjBLbNXHwOrofg3nqzsvJvB5GYFX2S6I6frf5JGRqi/UeTIGBM27KkpVcqPL26kug+o+JKDibCM6jkElIjV6aLDk4PT6QAoHRiWkRokYoFnzHnd3I+RJcimiutJa++56M5RoiUlh2n7jNbpAgirI48DTdrfCCtPnkKEjQZY5MbDxjwR/7Opj7G0PPJVofmed1mGNPXCNg4PpJPu/2HDSQd6HdEE+aR0XG5Jyp93zSLQodMf/h7A3Ytzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOhGroItePw4U9DriVeyJPe7o/7CEICYbLHFToaiWPE=;
 b=OuPbGsHlmFI1vlXiJaXyJ/h1nsk4MnukNWZp7rQhWoGCUo7RKn75xLky8EvTS6ghtAGJEUZ5C2IZX36AGaX0DXupI4NB3JAnLGgfRVe8xvhXT5aiPr+2PoZyXHkV2/97jw+jtAVGCOqqW0iHoN2epnp5WC9aAPkiBM1NcgkTh8iENRAY7LKyjSMrDn5P8+QuzBrZFoZw8B41BCY+DR94v3xAvC1R3oorVbQpA5++/SUL8MLyI71msaGNBvEGzzePXztO+85KHU4rvVBqYgY0WOV3LJ+xj8B5OVfnub2dGB61yeDzENFh4bGL4nNpq1KYvGV5DWWmRRLIzUrcYIBv4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOhGroItePw4U9DriVeyJPe7o/7CEICYbLHFToaiWPE=;
 b=esa5USfcX2dCjmjLA0cS5wW/13GwRM7DxsFeuZwGfa+4yP2nClnIvGeGQYXsyoxFCnkcRDpFdlgkR4vcKBwSWmSAOI3plnQOvsh+/e5tTKHhDiKhY6G384V1Hp6lNjlevA3GSICJTauasI3jYv3ssx7sAYwlzYYFUujKzlAG3aU7GpPSzCobI92SCUWuBdW5o+wgpDuASozpakP/lXatJyBTbKJ76CTpgTe0fL0+MdAQCzAEc7O9OqsBAJtj1p50VFpDgwEm+n7mBZVu/V2/J0WjXHeTy+lryWxOR/z2HdPsB1S5wDvp7XvDetG9bJltyJEKlYB02rpxfTsMha1/Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM8PR04MB7267.eurprd04.prod.outlook.com (2603:10a6:20b:1df::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 03:55:33 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 03:55:33 +0000
Date: Wed, 24 Sep 2025 23:55:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/14] drm/imx: dc: Add DPR channel support
Message-ID: <aNS9KwQpH1z+TC1s@lizhi-Precision-Tower-5810>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
 <20250923-imx8-dc-prefetch-v2-7-5d69dc9ac8b5@nxp.com>
 <aNLnBbSr5BGDvmsG@lizhi-Precision-Tower-5810>
 <eb070dbc-1e8e-437a-b519-69709b3feae4@nxp.com>
 <aNQNn9EwZzCjapB6@lizhi-Precision-Tower-5810>
 <215aff22-7923-4925-afa9-7663cd524b42@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <215aff22-7923-4925-afa9-7663cd524b42@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0364.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::9) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM8PR04MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f290d57-06bc-4cbb-dac5-08ddfbe76055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?baMgfN5/Yum2ikgzGSCCGBAelY0D2QpZhRkd5Vd8o2IWHPArjH1eP19dB/FM?=
 =?us-ascii?Q?2ezfM5lMbGE6cqpNJRpVGy31G9L52r4Bk77p+r6leCWvP6R0DRF9p5cMDupP?=
 =?us-ascii?Q?B46gA9yJjcUJIlFTaIodl2HgzEgS6yB6D9Mb+1Z4PawzqPtLfsmLWOFGhl73?=
 =?us-ascii?Q?BeLPY3m+VcA9+RHvqoE7XUnFEBxLVkvroRFSaVciKoEKCdI31Mb//dUqYkmn?=
 =?us-ascii?Q?9cbGUlG13Dhc0fKMJehkNFdvT8/rUfX6geVvlKqepWHOHttzdTulCK1ehnM+?=
 =?us-ascii?Q?/gjXYkFpRiNs50ZSycSaM9gKyFub+ESBLCLeLkh/VDUqmvyYLSLy03orDt+b?=
 =?us-ascii?Q?nsVEz0ta/fnR0NIsUF+u1Hg5wnRr5S6OVHYmY67t5RCX4utJuLOrEzxmGe6f?=
 =?us-ascii?Q?yVuQy6sD4Q95EAD5NVxCG/UuyTVabVFp5BOJ1ynv8Va0oz/tlFhpkOYGJ8qX?=
 =?us-ascii?Q?/VshTkMvBa8AcHI4KdcegRl5KBzzRHYuLZtRfPHvZYkEUQIEqPVGUc6mscea?=
 =?us-ascii?Q?5rVnY2WWXYq992Bqb1GYcivdR40pGj6Rm5axw1RYBT10pNMunZs9rHJhsi8R?=
 =?us-ascii?Q?6AuDBntubBO5rcHcytL9T65ghDJDJHLxP6+YlBSge/eX+YbW0T1eIFvijDLO?=
 =?us-ascii?Q?gMt99VebhSHf09tfw8QO16C1kB8C7KtFOi8w8d/Jf3sc32DfxAOiH0NGMxdf?=
 =?us-ascii?Q?GA6DX/hxQu1PdykmkxbpIW38Cv7QvdM1Xsb8+/xpqKvr48M7o6YwHhvTqszl?=
 =?us-ascii?Q?OQP5CxxmZfzUsx2HOshpipygXyUkpnMT6wc9An43hdudRhr6jkdDng8FiLJZ?=
 =?us-ascii?Q?8cDbqdiLluU7ES6OJvf6fTeRZoQnaORUNGUvbJ0tSv6xTawqmkwoEbCqMpoQ?=
 =?us-ascii?Q?+SnN13tDJbg+sshLK//10QyspbebH2Cq/GL13gBLg8j3I+JCQ8xYf2zCcboe?=
 =?us-ascii?Q?rSM1wpIohXLHbCQjHCoC2tkTgXASI7oTlMEa28s2Dye7oHUHuiAm79rE+Fgb?=
 =?us-ascii?Q?cAbd71KndnpN74feQuRO/vmhTrSm9LmZ3nFcV5nQgJZkKyx7az3NERO5snVj?=
 =?us-ascii?Q?bDtCnJErMp8K5DgaR8VpAjuxPD1QatjyMH656OccaXxFo1OJnZEmes+DOXC2?=
 =?us-ascii?Q?fEj7ApDroHMhNn3Iv40smI59YkBXgA0BD6MeVHjGpFGZIvG2XU5zLNFVXu1v?=
 =?us-ascii?Q?pzsFTH3/9gtyTOXnUcato1x3NlsHSKgvAHluFBw7/ZJzy8ogFSINFDvK5Tel?=
 =?us-ascii?Q?XTekOMMbJWHLROKGPR4vm6G4YwAZEzVT0w3ufnLYHzooI6aizaiHTyCG5fvq?=
 =?us-ascii?Q?vZTDRF2FlZ0ROfyshSTNuUWmsoSMf/QavJrhxO3ofAL6je+f5hIAKNwDrfXf?=
 =?us-ascii?Q?VnnWT16soNaziXnRJPH6zSCKnCROOmbOxidjaIWiCaH43mS4Ojz3D3fU577l?=
 =?us-ascii?Q?i5TABdvvcETbOLtAlC8c+YARPfqJi/NOFHv2KAeWnx/Z6HZd4RGVng=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZkujK5YdZ6wIlZPTv5WnCGPBorJYuBqeFd2gWwp0siUlba5/fJZHEv+vqNRv?=
 =?us-ascii?Q?3om1CX2BJZ46FKE3im/w6BgHPNrX0qhOMJxp7DE/xJ2I9ry5LR/zU+grGOok?=
 =?us-ascii?Q?6jG2hHTOjhEth46DJqkiyiHVprjMtgqKCfi7hl9Wlt71/TWy6GbXiEl8MfqO?=
 =?us-ascii?Q?34ubo/L0hzzb3X9roq7sHAK5z+QFaNz7mIgz+WmqbD6yqXQ8oDBSEQTNbtYZ?=
 =?us-ascii?Q?waXzyE1qvtraZO/4mH86w9A7pmKHIwoWvnK8A35AmynNPaynsM7kSARh+xQC?=
 =?us-ascii?Q?rANs1btn3QZ9HQ+Des9Xw5AqTRcw41NZP0jr/IHeQIWB/1QM5AlWJRku+6yL?=
 =?us-ascii?Q?t3HfnRU21UoSb2CiWRnS69qZ9+6hmaqW4C8k8akYYRRn+0nr8KTyKGEc6A4i?=
 =?us-ascii?Q?C4CbHTPjvd43GVEtCOvDO3BKPV5FmvOncrpTNGSYkrhJaprjBtiwwabNDXl+?=
 =?us-ascii?Q?F3+9FsVct9xIFoy4fPzNgnn4RsfTI/i+KeeYbyR+Xy9tfsi3NG8qTCFX3lDn?=
 =?us-ascii?Q?yBuRfNhxdrAi8is3EMn0wC/Nhh/Bvo8FkDmBX3BhcB4ip/OL2cnQChigCk0R?=
 =?us-ascii?Q?dp756/UiJ9QwvXWZaUdfICsQdd1rjGZ2fIaO4jiN8V7NYp26GHjIwS9xsh+D?=
 =?us-ascii?Q?YJc8WeGoetLUQBaAaWL43TPECsCGaTw0joUwTCJncsN52XJpkHIkCqahmVJl?=
 =?us-ascii?Q?q3cuyMl1TPdkSIqzUV7aXThdUhRc/Fbp3it1D2JVyfJc4AciAtrX7ICBGqm/?=
 =?us-ascii?Q?M+BHVnRVwuUtnKxt7ONIdYZE74rszQTOFw4ZuR5Z9DMH48AQjLCwSVIz2P7J?=
 =?us-ascii?Q?yC9JijjejEi1t/s44m7twPwnI3CJvpTXY8bCY5S5+qPqyiBM6KK9ncvqZdfa?=
 =?us-ascii?Q?92yiBACxXQ+oeWZHPuWGTebOj5yEM5ak8v9fbeSqP1xgLTAF3avxW7LSTPj2?=
 =?us-ascii?Q?Z0Vrt9WykVWBPyW5pt0qARXbj7nXZhcjFLGxIH2T9aeX/cIIcAQ8avfUWlNU?=
 =?us-ascii?Q?Uu3d6MJOBj9QskFFFOUanC8zUxqu/kHk6EYCm7YmZXgy+ZYyGQUWKROy5aNf?=
 =?us-ascii?Q?RBnWXA5eaEBXIDiTYdyohyA2Ow7xISkmBwAm0JA2/03FZ4yVdRhdWcAfphXf?=
 =?us-ascii?Q?qHDVl0Bri4NRBGFEWd0KGIVxdjFRL9InkLUzzl1eTm/Whzrz84A4NB/YY0KL?=
 =?us-ascii?Q?DvCcZJQ8ioyyscVBh5nXSzMfWnnfEdKTZflzhrbWhtyz6pMLkCHM3HVHwng4?=
 =?us-ascii?Q?5Mwz01doZN8qq6QpHXjn2IyzcSuPOdPV6N8KcGnfwjqkOb6mSa069/oOtkY2?=
 =?us-ascii?Q?24fBXjRyakyoU6DWDv/fKoEuUCq5T/4pYbby3Xmhdv09rBlM2OpiycLpE8ep?=
 =?us-ascii?Q?2lPrvFit0sICZOBdfirB8Cgb6N+8jtoqIJDACjEFfDT73dggVGz86Z+j8C5Y?=
 =?us-ascii?Q?oNf2TQAY3IuVzWRzzWUJ6zWCB8VLVOjq4Y0dgXZsJtlEXNYsKv1iRVMcLRyK?=
 =?us-ascii?Q?BDeZaISGCDAdE1fTIXFKOnAT3V30EkZKo1QN1rtZadoWeWqbimnzZdd/RreR?=
 =?us-ascii?Q?fkwoU3Pj8dXQptKD3/0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f290d57-06bc-4cbb-dac5-08ddfbe76055
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 03:55:33.0883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgbOE870fjR0/jkzECj+OS2zEioOpQ/Rk4ZrtQuhQidwdO8YSHLhtTz8DpZ5REurtWQTiUBkWDMkpDQ3ZWCo8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7267
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

On Thu, Sep 25, 2025 at 10:58:27AM +0800, Liu Ying wrote:
> On 09/24/2025, Frank Li wrote:
> > On Wed, Sep 24, 2025 at 02:41:50PM +0800, Liu Ying wrote:
> >> On 09/23/2025, Frank Li wrote:
> >>> On Tue, Sep 23, 2025 at 10:07:57AM +0800, Liu Ying wrote:
> >>>> Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
> >>>> It fetches display data, transforms it to linear format and stores it
> >>>> to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
> >>>> a gasket between the RTRAM controller and a FetchUnit.  Add a platform
> >>>> driver to support the DPRC.
> >>>>
> >>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>>> ---
> >>>> v2:
> >>>> - Manage clocks with bulk interfaces.  (Frank)
> >>>> - Sort variables in probe function in reverse Christmas tree fashion.  (Frank)
> >>>> ---
> >>>>  drivers/gpu/drm/imx/dc/Kconfig   |   1 +
> >>>>  drivers/gpu/drm/imx/dc/Makefile  |   6 +-
> >>>>  drivers/gpu/drm/imx/dc/dc-dprc.c | 465 +++++++++++++++++++++++++++++++++++++++
> >>>>  drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
> >>>>  drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
> >>>>  drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
> >>>>  drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
> >>>>  drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
> >>>>  8 files changed, 522 insertions(+), 3 deletions(-)
> >>>>
> >>> ...
> >>>> +
> >>>> +static void dc_dprc_reset(struct dc_dprc *dprc)
> >>>> +{
> >>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + SET, SOFT_RESET);
> >>>> +	fsleep(20);
> >>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, SOFT_RESET);
> >>>> +	fsleep(20);
> >>>> +}
> >>>> +
> >>>> +static void dc_dprc_enable(struct dc_dprc *dprc)
> >>>> +{
> >>>> +	dc_prg_enable(dprc->prg);
> >>>> +}
> >>>> +
> >>>> +static void dc_dprc_reg_update(struct dc_dprc *dprc)
> >>>> +{
> >>>> +	dc_prg_reg_update(dprc->prg);
> >>>> +}
> >>>> +
> >>>> +static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
> >>>> +{
> >>>> +	guard(spinlock_irqsave)(&dprc->lock);
> >>>> +	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
> >>>> +}
> >>>> +
> >>>> +void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
> >>>> +		       unsigned int width, unsigned int height,
> >>>> +		       unsigned int stride,
> >>>> +		       const struct drm_format_info *format,
> >>>> +		       dma_addr_t baddr, bool start)
> >>>> +{
> >>>> +	unsigned int prg_stride = width * format->cpp[0];
> >>>> +	unsigned int bpp = format->cpp[0] * 8;
> >>>> +	struct device *dev = dprc->dev;
> >>>> +	unsigned int p1_w, p1_h;
> >>>> +	u32 val;
> >>>> +	int ret;
> >>>> +
> >>>> +	if (start) {
> >>>> +		ret = pm_runtime_resume_and_get(dev);
> >>>> +		if (ret < 0) {
> >>>> +			dev_err(dev, "failed to get RPM: %d\n", ret);
> >>>> +			return;
> >>>> +		}
> >>>> +
> >>>> +		dc_dprc_set_stream_id(dprc, stream_id);
> >>>> +	}
> >>>> +
> >>>> +	p1_w = round_up(width, format->cpp[0] == 2 ? 32 : 16);
> >>>> +	p1_h = round_up(height, 4);
> >>>> +
> >>>> +	regmap_write(dprc->reg, FRAME_CTRL0, PITCH(stride));
> >>>> +	regmap_write(dprc->reg, FRAME_1P_CTRL0, BYTE_1K);
> >>>> +	regmap_write(dprc->reg, FRAME_1P_PIX_X_CTRL, NUM_X_PIX_WIDE(p1_w));
> >>>> +	regmap_write(dprc->reg, FRAME_1P_PIX_Y_CTRL, NUM_Y_PIX_HIGH(p1_h));
> >>>> +	regmap_write(dprc->reg, FRAME_1P_BASE_ADDR_CTRL0, baddr);
> >>>> +	regmap_write(dprc->reg, FRAME_PIX_X_ULC_CTRL, CROP_ULC_X(0));
> >>>> +	regmap_write(dprc->reg, FRAME_PIX_Y_ULC_CTRL, CROP_ULC_Y(0));
> >>>> +
> >>>> +	regmap_write(dprc->reg, RTRAM_CTRL0, THRES_LOW(3) | THRES_HIGH(7));
> >>>
> >>> Is it okay to access register if start is false since
> >>> pm_runtime_resume_and_get() have not called.
> >>
> >> Yes, it is okay, because dc_dprc_configure() is supposed to be called
> >> continously for multiple times(OFC, fine for only once as well).  For
> >> the first time, start is true in order to enable the DPRC.  After the
> >> first time(DPRC is running), it is called with start == false to do
> >> things like page-flip(update frame buffer address).
> >>
> >>>
> >>>> +
> >>>> +	val = LINE4 | BUF2;
> >>>> +	switch (format->format) {
> >>>> +	case DRM_FORMAT_XRGB8888:
> >>>> +		/*
> >>>> +		 * It turns out pixel components are mapped directly
> >>>> +		 * without position change via DPR processing with
> >>>> +		 * the following color component configurations.
> >>>> +		 * Leave the pixel format to be handled by the
> >>>> +		 * display controllers.
> >>>> +		 */
> >>>> +		val |= A_COMP_SEL(3) | R_COMP_SEL(2) |
> >>>> +		       G_COMP_SEL(1) | B_COMP_SEL(0);
> >>>> +		val |= PIX_SIZE_32BIT;
> >>>> +		break;
> >>>> +	default:
> >>>> +		dev_err(dev, "unsupported format 0x%08x\n", format->format);
> >>>> +		return;
> >>>> +	}
> >>>> +	regmap_write(dprc->reg, MODE_CTRL0, val);
> >>>> +
> >>>> +	if (start) {
> >>>> +		/* software shadow load for the first frame */
> >>>> +		val = SW_SHADOW_LOAD_SEL | SHADOW_LOAD_EN;
> >>>> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
> >>>> +
> >>>> +		/* and then, run... */
> >>>> +		val |= RUN_EN | REPEAT_EN;
> >>>> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
> >>>> +	}
> >>>> +
> >>>> +	dc_prg_configure(dprc->prg, width, height, prg_stride, bpp, baddr, start);
> >>>> +
> >>>> +	dc_dprc_enable(dprc);
> >>>> +
> >>>> +	dc_dprc_reg_update(dprc);
> >>>> +
> >>>> +	if (start)
> >>>> +		dc_dprc_enable_ctrl_done_irq(dprc);
> >>>> +
> >>>> +	dev_dbg(dev, "w: %u, h: %u, s: %u, fmt: 0x%08x\n",
> >>>> +		width, height, stride, format->format);
> >>>> +}
> >>>> +
> >>>> +void dc_dprc_disable_repeat_en(struct dc_dprc *dprc)
> >>>> +{
> >>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, REPEAT_EN);
> >>>> +	dev_dbg(dprc->dev, "disable REPEAT_EN\n");
> >>>> +}
> >>>> +
> >>>> +void dc_dprc_disable(struct dc_dprc *dprc)
> >>>> +{
> >>>> +	dc_prg_disable(dprc->prg);
> >>>> +
> >>>> +	pm_runtime_put(dprc->dev);
> >>>
> >>> You call pm_runtime_put() in dc_dprc_disable(), but not call
> >>> pm_runtime_resume_and_get() at dc_dprc_enable().
> >>
> >> Yes, dc_dprc_configure()(start == true) is designed to get RPM and
> >> dc_dprc_disable() to put RPM.
> >>
> >> dc_dprc_enable() just sets PRG to non-bypass mode.
> >>
> >>>
> >>> Is it more reasonable to call pm_runtime_resume_and_get() in dc_dprc_enable()
> >>>
> >>> dc_dprc_enable()
> >>> {
> >>> 	...
> >>> 	pm_runtime_resume_and_get();
> >>> }
> >>>
> >>> dc_dprc_configure()
> >>> {
> >>> 	unconditional call
> >>> 	pm_runtime_resume_and_get()
> >>> 	...
> >>> 	pm_runtime_put()
> >>
> >> Here, as RPM is put, it's possible to actually disable the power domain,
> >> hence possibly lose all the DPRC configuration done between RPM get and
> >> RPM put.  So, this doesn't make sense.
> >>
> >
> > Okay,
> >
> > dc_dprc_enable()
> > {
> > 	...
> > 	pm_runtime_resume_and_get();
> > }
> >
> > dc_dpdr_disable()
> > {
> > 	pm_runtime_put();
> > }
> >
> > dc_dprc_configure()
> > {
> > 	pm_runtime_resume_and_get();
> >
> > 	if (start)
> > 		dc_dprc_enable(dprc);
> >
> > 	pm_runtime_put();
> > }
> >
> > Look more reasonable for pair get()/put().  after first start, ref count
> > will not reduce 0 by pm_runtime_put();.
>
> Then, as dc_dprc_disable_repeat_en() also accesses DPRC register, it needs
> the RPM get/put too?  Same for PRG driver APIs, dc_prg_{enable,disable,
> configure,reg_update,shadow_enable} access PRG registers.  Though adding
> RPM get/put to all of them should work, I don't see much point in having
> the get/put dance.

I don't think need change all.

you call dc_dprc_configure(start = true) to get pm_runtime_resume_and_get()

call dc_dpdr_disable() to put run time pm.

Just change to
1. call pm_runtime_resume_and_get() in dc_dprc_enable(), which call only when
 (start == true)
2. call pm_runtime_put() in dc_dpdr_disable() /* you already did it */

get()/put() pair in dc_dprc_configure() to make sure access register
before call dc_dprc_enable().

The whole logic should be the same as what your current code.

>
> >
> >>>
> >>> 	if (start) //look like only need enable when start is true
> >>
> >> I may add this check in next version.
> >>
> >>> 		dc_dprc_enable(dprc);
> >>> }
> >>>
> >>>> +
> >>>> +	dev_dbg(dprc->dev, "disable\n");
> >>>> +}
> >>>> +
> >>>> +void dc_dprc_disable_at_boot(struct dc_dprc *dprc)
> >>>> +{
> >>>> +	dc_prg_disable_at_boot(dprc->prg);
> >>>> +
> >>>> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
> >>>> +
> >>>
> >>> you have runtime functions dc_dprc_runtime_suspend()
> >>>
> >>> If runtime pm status is correct, needn't call clk_bulk_disable_unprepare().
> >>>
> >>> Look like call pm_runtime_put() here to let runtime pm management clks.
> >>>
> >>> otherwise, runtime pm state will not match clock enable/disable state.
> >>>
> >>>> +	dev_dbg(dprc->dev, "disable at boot\n");
> >>>> +}
> >>>> +
> >>>> +static void dc_dprc_ctrl_done_handle(struct dc_dprc *dprc)
> >>>> +{
> >>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0, REPEAT_EN);
> >>>> +
> >>>> +	dc_prg_shadow_enable(dprc->prg);
> >>>> +
> >>>> +	dev_dbg(dprc->dev, "CTRL done handle\n");
> >>>> +}
> >>>> +
> >>> ...
> >>>> +
> >>>> +static int dc_dprc_probe(struct platform_device *pdev)
> >>>> +{
> >>>> +	struct device *dev = &pdev->dev;
> >>>> +	struct device_node *np = dev->of_node;
> >>>> +	struct resource *res;
> >>>> +	struct dc_dprc *dprc;
> >>>> +	void __iomem *base;
> >>>> +	int ret, wrap_irq;
> >>>> +
> >>>> +	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
> >>>> +	if (!dprc)
> >>>> +		return -ENOMEM;
> >>>> +
> >>>> +	ret = imx_scu_get_handle(&dprc->ipc_handle);
> >>>> +	if (ret)
> >>>> +		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
> >>>> +
> >>>> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> >>>> +	if (IS_ERR(base))
> >>>> +		return PTR_ERR(base);
> >>>> +
> >>>> +	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
> >>>> +	if (IS_ERR(dprc->reg))
> >>>> +		return PTR_ERR(dprc->reg);
> >>>> +
> >>>> +	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
> >>>> +	if (wrap_irq < 0)
> >>>> +		return -ENODEV;
> >>>> +
> >>>> +	dprc->num_clks = devm_clk_bulk_get_all(dev, &dprc->clks);
> >>>> +	if (dprc->num_clks < 0)
> >>>> +		return dev_err_probe(dev, dprc->num_clks, "failed to get clocks\n");
> >>>> +
> >>>> +	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
> >>>> +	if (ret) {
> >>>> +		dev_err(dev, "failed to get SC resource %d\n", ret);
> >>>> +		return ret;
> >>>> +	}
> >>>> +
> >>>> +	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
> >>>> +	if (!dprc->prg)
> >>>> +		return dev_err_probe(dev, -EPROBE_DEFER,
> >>>> +				     "failed to lookup PRG\n");
> >>>> +
> >>>> +	dc_prg_set_dprc(dprc->prg, dprc);
> >>>> +
> >>>> +	dprc->dev = dev;
> >>>> +	spin_lock_init(&dprc->lock);
> >>>> +
> >>>> +	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
> >>>> +			       IRQF_SHARED, dev_name(dev), dprc);
> >>>> +	if (ret < 0) {
> >>>> +		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
> >>>> +			wrap_irq, ret);
> >>>> +		return ret;
> >>>> +	}
> >>>> +
> >>>> +	dev_set_drvdata(dev, dprc);
> >>>> +
> >>>> +	ret = devm_pm_runtime_enable(dev);
> >>>> +	if (ret)
> >>>> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
> >>>> +
> >>>> +	return 0;
> >>>> +}
> >>>> +
> >>>> +static int dc_dprc_runtime_suspend(struct device *dev)
> >>>> +{
> >>>> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
> >>>> +
> >>>> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
> >>>> +
> >>>> +	return 0;
> >>>> +}
> >>>> +
> >>>> +static int dc_dprc_runtime_resume(struct device *dev)
> >>>> +{
> >>>> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
> >>>> +	int ret;
> >>>> +
> >>>> +	ret = clk_bulk_prepare_enable(dprc->num_clks, dprc->clks);
> >>>> +	if (ret) {
> >>>> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> >>>> +		return ret;
> >>>> +	}
> >>>> +
> >>>> +	dc_dprc_reset(dprc);
> >>>> +
> >>>> +	/* disable all control IRQs and enable all error IRQs */
> >>>> +	guard(spinlock_irqsave)(&dprc->lock);
> >>>> +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
> >>>
> >>> write one 32bit register is atomic, look like needn't spinlock.
> >>>
> >>> Only other place use dprc->lock is in dc_dprc_enable_ctrl_done_irq(), which
> >>> write 32bit clr register.
> >>
> >> No, dc_dprc_wrap_irq_handler() uses the lock to protect register access too,
> >> so it's needed.
> >
> > guard only protect after it.
>
> scoped_guard() called by dc_dprc_wrap_irq_handler() protects register access
> too.

Sorry, I missed this part. I found at original patch.

Frank Li

>
> >
> > in dc_dprc_runtime_resume()
> >
> > +	/* disable all control IRQs and enable all error IRQs */
> > +	guard(spinlock_irqsave)(&dprc->lock);
> > +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
> > +
> > +	return 0;
> >
> > +static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
> > +{
> > +	guard(spinlock_irqsave)(&dprc->lock);
> > +	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
> > +}
> >
> > How spin lock protect register access?
>
> With the error and control IRQs, dc_dprc_wrap_irq_handler() and
> dc_dprc_enable_ctrl_done_irq() could have concurrent access to IRQ_MASK
> registers(though there is SET/CLR/TOG register variants, they have a
> shared read-out value).
>
> >
> > 1: IRQ_MASK <= IRQ_CTRL_MASK;
> > 2: IRQ_MASK + CLR <= IRQ_DPR_CRTL_DONE;
> >
> > 2 possilbe result:
> > 	1 happen after 2
> > 	2 happen after 1
> >
> > Frank
> >
> >>
> >>>
> >>> Frank
> >>>> +
> >>>> +	return 0;
> >>>> +}
> >>>> +
> >>> ...
> >>>> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
> >>>> +{
> >>>> +	prg->dprc = dprc;
> >>>> +}
> >>>> +
> >>>> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
> >>>> +{
> >>>> +	return prg->dprc;
> >>>> +}
> >>>> +
> >>>>  static int dc_prg_probe(struct platform_device *pdev)
> >>>>  {
> >>>>  	struct device *dev = &pdev->dev;
> >>>> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
> >>>> index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
> >>>> --- a/drivers/gpu/drm/imx/dc/dc-prg.h
> >>>> +++ b/drivers/gpu/drm/imx/dc/dc-prg.h
> >>>> @@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
> >>>>  struct dc_prg *
> >>>>  dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
> >>>>
> >>>> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
> >>>> +
> >>>> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
> >>>> +
> >>>>  #endif
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
> >>
> >>
> >> --
> >> Regards,
> >> Liu Ying
>
>
> --
> Regards,
> Liu Ying
