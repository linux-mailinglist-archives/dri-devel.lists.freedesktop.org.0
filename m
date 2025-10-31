Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B670CC24F37
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 13:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117CF10EB1F;
	Fri, 31 Oct 2025 12:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q956q7xZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011050.outbound.protection.outlook.com [52.101.65.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F76E10EB1F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 12:15:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxvZOXPxOIWSVOd4z3WrT3der+QCRI+CAJgtiR+j/MjpP1Ajdixx7dX/e++yo7sRu8Grt0BaMRc22sQ8maeqDJx8VNzlCsenX/VsTJ89+4amhEdD72dvtGnlYhv6u1CPwqsZGnn+8TrzKE+qL59rycOZ2peprlZGLk0qqK5XBPSjwmekk8hWOQG+jx45VLb6esi/n/jgAKBaV57X5s5SuC7knOetVZAXfHZi5CptP1iyCwVUasB0zyG9oq/NkH/FujfUusSo+2OsQPH1fvJhlYvO3GXBQqJ+ejaXNIxhqaw/NLMJWOeJy6wyj8e3JrE2c7b7D/Tj+z2tbVlcER1nTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVsCfc1i04KJKXIFgLyUZy2LpuLmGRcqCNslItO+6ZQ=;
 b=lFzbiV+zDLFxrujkKoubRy+ST/SIefcPqb/1FdqG2zKcTpj9NTjH6Ebu+CNEBjxFcU9BcL5N2VyCSEddRpG38cOW3qacfGLZB0TV11ndw/3ymOb8jZcmKOQmrfDR5MyJYI8t+O3bne4jBkcO/Mi3+nzi5dQJJe8KN0wLf0+/MWr8sNgb4Ga+DzttJu5VM7wPyPauURYd+rOuikL2YSbSX0m73eesHdEJNSB2EQWbmadYUvMtZ4bNkcPudbcHov+xYB/6DnTNhGOO8oghVaLk1crY9nJq8WL838P9dfn4qYd/e6lGyshigKDKygUkMi9hpPfRA/5pR+gR/DjylyJBYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVsCfc1i04KJKXIFgLyUZy2LpuLmGRcqCNslItO+6ZQ=;
 b=q956q7xZFAsSsouo+iybowRtkgo6twxgCwvKHapk+reCQWYHtzXPbQlTLuS9sVZ6CzL/4lfYKIUiEk4XuI1sf3yz8i/noJdirvlA18eQJ0UO+eHAXW5wTULqY6OgUCWfLM3FSs96FjoHR2x79HgoCdOeAlhDFJF1YOTVAJGIOczkcQsKdjOdGJKa/h4XGWhy+7c5+peA6Lp/mf+7kZgOZBvjitHAfJ2q2ftbDaEk/TzZViG9WdwtHXPAxrs1TQJoduGsFGJmKxaNMgVPqid5IqcLrqcYkmg6xDKOiogaox2IKXKNPimO86AOP/bBqjzMAjMnf4TSGwCIJqEBSuyCTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PAXPR04MB8750.eurprd04.prod.outlook.com (2603:10a6:102:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 12:15:28 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%7]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 12:15:28 +0000
Date: Fri, 31 Oct 2025 14:15:24 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/9] drm/bridge: fsl-ldb: Add support for i.MX94
Message-ID: <zvwxrnd64a2ho3wc2zyzriwrk5uvmhfluqqph6jne7vrelzlxi@uynwtcc4huny>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
 <20250911-dcif-upstreaming-v5-3-a1e8dab8ae40@oss.nxp.com>
 <DDWD5P3SKWMV.1LITMN6MAKGMA@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDWD5P3SKWMV.1LITMN6MAKGMA@bootlin.com>
X-ClientProxiedBy: AS4P190CA0029.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::19) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PAXPR04MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3fab71-3945-460c-a41d-08de18772d90
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LJHf8p0u8l5Byyz9R2KR8oTPuHZqZWHUL+JFHNfZgUAwpzMh0EboNb+xqqM9?=
 =?us-ascii?Q?Tc1zvG5/OaxT2cYmfRoIVUFfAQERKBRrrrIpQjWdImTdQzz8wMkg2d4QPf1N?=
 =?us-ascii?Q?oFC4lxMdRGOnixXuoYRUG4cd/mb9jkcHJKw8JYIF0nYkBHPZ61AudL2Bl+Yg?=
 =?us-ascii?Q?dJnTBHWtwtvrJfnbZ98ks9c1+eYzQslqz+xRU8UZ4dFhnkLvFVQKl1jguoJI?=
 =?us-ascii?Q?8MIXi22jtlTEC38/EMO/MjA/u0C/AsRincGe/lnVo/so8+SlTwNpptBeR50t?=
 =?us-ascii?Q?v7SYIDLbfH/a4ovtMIv4tHemvWXEPdGEsJrbBhJUJIsU4TQVVAMuxQEV+lsB?=
 =?us-ascii?Q?f58fSbDL5399gskZGEOY8hINpaancmM0Us+4wfICuVc4Tj0Gh2qJZ9mp278y?=
 =?us-ascii?Q?1W7vK9AoHHL4sx6NSlvz86RCkeoFngJwW5BmXtyVagW5jt/UVLDb9CQRNOuM?=
 =?us-ascii?Q?vIkHsk0OV3p24hejmBV8yqhY7bYyB6+URAWyrIIxTDRdURAhDknavc7mWcNs?=
 =?us-ascii?Q?B5/fgKdXCJlcimpUDM4bIQg71zIFzooFZ6AGl2SjT0cN/wOJIB+JtdW4Pxty?=
 =?us-ascii?Q?MDAOu8CgdLPT9zjM1uEf36kFx6WBk+OFGoJ/t3q/bPd2aqTqMzsTwOCJUYg+?=
 =?us-ascii?Q?0W4FK6HuRusk3c0RccqjSEHZtwBnMv1SDh7DSMM/k35TxQ95ax0/rdQxvNvF?=
 =?us-ascii?Q?N1JprZ0uLx9Qtp8xxYq2mfacC8+Jpl/94R81oHC6ErOeCczayLEsqNkNg1Mr?=
 =?us-ascii?Q?bKw/RTceAccmgIZpou0jMkossLFVsSHWUDucAIFUb8gnKYltS6gJpaVOG8WM?=
 =?us-ascii?Q?hSJYTmp5zKCBGHXBUiE8XM9Dquvoayb21orzvFWDQNZG4K9WgjsZkR9Q0jE+?=
 =?us-ascii?Q?vJfraOuc4etop/JtEr6jsKVYTho3YzpUOftFkg0GrT71vp/uxqnV6yhdnYY8?=
 =?us-ascii?Q?Bj4bIr9MhCGA2VJ2hrf4YC/Bfzjz+1crilqN78GT8c6yMHGninCCCGeCsyu2?=
 =?us-ascii?Q?CyK0IAylh4EklivoEjKeXOqGTmUyLuzSBjwBgjIsiIU81hhv0W9bbLecFErM?=
 =?us-ascii?Q?4lwRBXAwLKDQVMjOxfXhqHP0WqUw9oPbRzfL/yS7hK4gPp/J+A7LlG4Nh3ex?=
 =?us-ascii?Q?d55X1065eeQnIqIqsh6c6e2PTte+p823LwwfB30nireRxxg8jLwa7x8PvixL?=
 =?us-ascii?Q?pG7xka4TBnKdgfHBGeYlHkNrjIOaPLSPbV+mqkX/dPWDoeT86mXDwfg6GMud?=
 =?us-ascii?Q?qXSeQ7LXFRhBYdfzlT1FoxqmTDSNS0X04SNSnin7/SstDUP/CZjnpi+FL1tB?=
 =?us-ascii?Q?x1kNFWQjrEDPqYjqLSYfdflrcYZSmdhQDlT90w7nfdRrsXhl2GOryp95Ta8Z?=
 =?us-ascii?Q?rlTmTV8Woow4ewKeyoyS6GpTaD7AQH4eKJS9kE7IsAGUmXxfUA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W7agVmLTRV5Gr55vD75GxEE81HIknxSe/U1QXIkibBM9C0YIlJeJQojoCDmr?=
 =?us-ascii?Q?GZ694dobiDcEh0W4OrJ0mIAujeBTdiumSqVp7rTFPAyVRqDGT2OCpdQEA0rj?=
 =?us-ascii?Q?WabCQpXqowsYoE3NvZ+MZd2IfI/14X17GKXbWq57UmarnIzi2IixjvzAxhiP?=
 =?us-ascii?Q?bfHk2A+G5vvYFntLHkbna20rMzv+5O+yOdk7RJA7NgMXR8gDBhcTAfBydbU7?=
 =?us-ascii?Q?vXjexRWW3DDlY00SsG5zH1gV9dLhH9dqGqMIt5sdd8wtluUlbf4kL2l57rlz?=
 =?us-ascii?Q?DE2R3cKq/qGF+s0L+Fy8WnfIU8VVnjju83NEaDTB1J7RxvVs7qRVy9TKizRm?=
 =?us-ascii?Q?tMieatnm2dUF8t+lSWlxWZBtrciqWdMff/hd7w2GegOCT4NZeF6tumj3zydI?=
 =?us-ascii?Q?VoSUdwiqongpz/FVO4gYWFFb12OpF1LagqWTiGyFjSuf3cCjYnsixfQxJjir?=
 =?us-ascii?Q?7LWrt2GIwj1txpWCHVQMSqN5g7mS6WU7IfUo0aKts78+v9tl1s3qzXA+uqSo?=
 =?us-ascii?Q?nI4ZEuhk3JvF1CgYwLZGqsQrV4e+bReUwh5fAlFzn/4ER/ao7do44AsW3a6T?=
 =?us-ascii?Q?tj3PdAx8iF57ge2bZyYPgGlsFEVFeIu2+BISHrrOhr0nJfqk2tgxFMJ4Dv2d?=
 =?us-ascii?Q?SESToP2sIMUp+S5dMtyu95XYTBZtMeCTJJ//2aPy2glmGc3KnBKA3EZ2U+zn?=
 =?us-ascii?Q?g2fBxd9nsfEK1WCFElg9BuS7k7vwMa40vRLIxwuV//pd/hBlD8r55BaksIdK?=
 =?us-ascii?Q?Qbba8Z6w1Ics8tJi3dvm4k9MJXTV8b9WaoxVQ3tF+Fie9xqaRtdTpuMqYzPh?=
 =?us-ascii?Q?yINeh4ftVz8USEIYWYDFdKdUd487waB77ZTDmZy6JErTXRuFS58thKGtvGqu?=
 =?us-ascii?Q?0vi5mr3tmS5M3A4auRGxUlXDyQRvHpmW6J1bGh67kzbtIR7e0b8ezSClgDpj?=
 =?us-ascii?Q?DI8xBWBn9g9YmLPTc9oyYsvgdUKqUNdlm6WNkakdrrwoOy38JbBMAbk86C0B?=
 =?us-ascii?Q?YMtpM1+X34G+jnwZb+l8WYff9HC6q8Ainpghh/SQSsYh36YdXp5fZQfzsW7w?=
 =?us-ascii?Q?mKLLkyaJV4CgBXw9G6HAwKHTY0BOnpPHdLAdQHAAcIaMzuH3jfF5pcUYJtV1?=
 =?us-ascii?Q?W1wqbAbUPStv1oa84qTSteJXDxfNN3AV7oBauCP2uQn0OebX+QkDzk/Mv9u6?=
 =?us-ascii?Q?yDciRTwKcYymnd1yokDFfRwcqLeNpPGDsPnR7qPxmEVIH3qW21LBpE/5GZkX?=
 =?us-ascii?Q?odk0HvqqhjJ+l9PMDUY7khzHS5eDIrkQIVzK5MuxQkpxGZIgNjQco5B9G5E1?=
 =?us-ascii?Q?9CZu6UjIcud0kdSo9ia0a/fuKUm/e2Efuk1AYpU5LiyyviaH5taQVOnYQAzE?=
 =?us-ascii?Q?N4RcFkLmJFZTeLeO29oMzCVPmw1ZDtStD4OcZRSJusw6E8VVewx3OSIoiEQn?=
 =?us-ascii?Q?66jfhshtUGlbZN0f8vQsMJZypVDFzKwoF8fRw4UocoS8Uyo8Prw6053ElGrG?=
 =?us-ascii?Q?M1t73WYHbN1nXriBD4q1zgS5sixyKfS2Y6SkZ2+1II5Hf8UzqU9AjbUFDMQd?=
 =?us-ascii?Q?yjUQsmzkP3vS0CAjGQv8X5riijbFAhK9PSZ2qYZ1RCVhyTZhuuKAPVIU4tBr?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3fab71-3945-460c-a41d-08de18772d90
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 12:15:28.0413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2e7SCgjpaDz4TFo5kNZwG91VXCOkyNGtOpctKmzu5CYnfw3nN1sGKuyGGchqSQ3juuHxP9hx6BNVS0HJ8aJqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8750
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

Hi Luca,

On Fri, Oct 31, 2025 at 09:27:29AM +0100, Luca Ceresoli wrote:
> Hello Laurentiu,
> 
> On Thu Sep 11, 2025 at 1:37 PM CEST, Laurentiu Palcu wrote:
> > i.MX94 series LDB controller shares the same LDB and LVDS control
> > registers as i.MX8MP and i.MX93 but supports a higher maximum clock
> > frequency.
> >
> > Add a 'max_clk_khz' member to the fsl_ldb_devdata structure in order to
> > be able to set different max frequencies for other platforms.
> >
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> [...]
> 
> > @@ -270,8 +281,9 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
> >  		   const struct drm_display_mode *mode)
> 
> I'd suggest a couple possible code style improvements here:
> 
> >  {
> >  	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> > +	u32 ch_max_clk_khz = fsl_ldb->devdata->max_clk_khz;
> 
> You don't need a variable to use it only once.
> 
> >
> > -	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
> > +	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 2 * ch_max_clk_khz : ch_max_clk_khz))
> 
> And here you can use the ternary operator to compute the multiplier only:
> 
> 	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 2 : 1) * fsl_ldb->devdata->max_clk_khz)
> 
> Up to you whether you want to take my proposals above.

I'm ok with your proposal. I will include it in v6.

Thanks,
Laurentiu

> The patch looks good anyway, so with or without those changes:
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Thanks,
Laurentiu
