Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5449ABCF9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 06:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9690510E16E;
	Wed, 23 Oct 2024 04:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="BctFF5Cn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFB010E16E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 04:40:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCzwG0hqKAKiyja52xy4LBh9Dss5pa/O9on0Q028097zUy+1EOU1KLSX4wOw+afp8alqW7hXfCVWr+PoptmTkZkzRxkJpeeFCxQLhSKxgnYv0XM6c688mKQfeV4Xv6XN6T2vS6GkiOmm3uO+wDXBKUghkt88q58t1W5JUQAjwZanWVvn8oz0fxjZnWRz7q7E/5eBxEm6lIcjwB8MSdahNCxjV4Fz30A81hi8zESyADiHQx0ueVSOtT2j2cLgQV6/7kmwkRcm4oQHN0YQVR0B/o2JVvluZJz5UzJ0mEHYgWD0BNTTePpyfLFD56SRH1B1aqBN21bmCPXm9a3kLZXEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgiMPR0EBgZWTD1c9FQFtxpwC5M4DmcOT2oWlJ+mD3g=;
 b=FDeol6Xx3nnQrd8NEGjykiI0lhdf/E6QyK2cjw1Hnh8orTgHllPiYh3tbTH7NsN9VDH4yM0VsCu3KI7hGNwG8vRpkXLTuq8kD/s6psN2GPSOM1bFgjC6FLXTM2izg15AeKlxwRQ5c03EcRtoBkKeNU+BGVKflEciSJekmjmTzNpDmxigI8c7nGpnZIRbVIRPpNGx876t4MDAIoUiXUSRjD8No4z/BUQ0F/IJIdHiibyqOUIKpBhJ9/VmZX8UKdPaVx26Pet8vOuYSKejdH95ZJeJjH2//ABE/jUWHBMQiPnN3ck56zl98+zdHsqg/FEUlTGxJB4coitTpsUmjvAmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgiMPR0EBgZWTD1c9FQFtxpwC5M4DmcOT2oWlJ+mD3g=;
 b=BctFF5CnKvz9SjAiFzUaAkKHXFNA3vjpZcR3aQ5mWoz+9Bylcgi09EdsB/Lh1hq6UdaPlEla6ZbWHcKMJ0+jX5pRg/dsBank2N7l01V5KTkY8zMTW8E9gQhJAYqI2Gh/sSlosBydxnh71HzXT6bQ3YcoR44zXFf4RICtqf8R294=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6784.jpnprd01.prod.outlook.com
 (2603:1096:604:135::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 04:40:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 04:40:45 +0000
Message-ID: <87y12fwhwy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
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
Subject: Re: [PATCH v7 1/9] of: property: add of_graph_get_next_port()
In-Reply-To: <ZxYiD5CCzcrwbD1o@valkosipuli.retiisi.eu>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
 <87v7y2rqwf.wl-kuninori.morimoto.gx@renesas.com>
 <ZxYiD5CCzcrwbD1o@valkosipuli.retiisi.eu>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 23 Oct 2024 04:40:45 +0000
X-ClientProxiedBy: TYCP286CA0142.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 472e419c-d79c-4e30-0675-08dcf31cdc06
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|52116014|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mpLaZGyGMfCYh4U5yabKPcMeN9eQuQeUdf0uNqg5KwZdIW4USs5r3Vk2dxTx?=
 =?us-ascii?Q?8IXLwFaw9FFLBYEaFV6qy2PrP09YLSsxEnQju+tMWFsmJJ/kesADy4Zgiwzj?=
 =?us-ascii?Q?M6Slv39NHZw7MDBRBTdJA8GvGkFqk/SgZ+bEANyw3HarhDRBXwyuoefQgsve?=
 =?us-ascii?Q?2xtq5Wlp56xVYAN4mJngxOAIjrxVoODRiEy859aWtjNnYrHwiJieEhrlpXa2?=
 =?us-ascii?Q?BJYo6OUiec8aIXjH3H/AFaYc9R9GT9IuthgDXEoGK3rzcMDmjhBkUWqR3lna?=
 =?us-ascii?Q?bEoMWCXWmuZlcGnBfOuYcUHJDiO6MT7+Dar4B1XTMNLMV3C4dzTUXioOHh3D?=
 =?us-ascii?Q?xnTqNUUlw1fEZDSO8JGZ3Jwy2U+l6qYvPpSoXhUw+isdfYBpUxe3Yc+CQAVm?=
 =?us-ascii?Q?bDeKq+3FCEeiL6rdP5yHOu5ZOdU/a0Laxf7qz1uy/PBDiXtnkgmmZzjlztNm?=
 =?us-ascii?Q?kri8kvT3L3JmWe6bbGRaYhYtzEanc8sP1rjkVs6QGB/circza1NmIEOeRKVq?=
 =?us-ascii?Q?sicCoVEe5/9JSzlwI6GRZbLjpMY+w9B0Cl14Q3MVBgVfKAIgPitbNeoHXE+Q?=
 =?us-ascii?Q?MZHEDs+ftG5P2F3Wrg7RN/u8xFWGefb7bypflgDgT6PRQzUiZS93wVHgWG7C?=
 =?us-ascii?Q?B8xxUg30kWljaGBT1RMcl4THbwJHovZA7wiGq01oNkqv/Al/OA6lxAIVE9c8?=
 =?us-ascii?Q?83S3iJeQikcyhiTnxgMSdMODmb86jFv+BDomMyDJXFrCXyo4jwWSR7xXVZ1u?=
 =?us-ascii?Q?YNjpFbLb8Ojb0ctAZF1AvUDp9nKVH+/3vLDStFOAnplKx4Mp9oEAjD2rlxsW?=
 =?us-ascii?Q?8hALtnnVgk0e5p7rFuAMhxJ5uDMrmBcywE7N1CeTfIE65tPQlLLK8AQrow4g?=
 =?us-ascii?Q?mGllQY/BjrQbvHO1GSUJIuh+63pv6DK957er7f61ATw3kCTZQEYX3RMD6Xlc?=
 =?us-ascii?Q?amBIDSIPBSyoe21Pv0fN2SB6/Xh7QPEpJs13k0R9i32Yqyf8iF/0iUJ1CNT2?=
 =?us-ascii?Q?UmTN1nIG7hpE613Lk+Y0l4qjN+nh+mEazzWExrI5gbxcNnau7se9587/DwSe?=
 =?us-ascii?Q?nJLPQmndKrYl5SFkPPv0d6+AmcK2tzAyt2eWbjJBgkZ6jp8HyawOPS6TqsOM?=
 =?us-ascii?Q?be4lSozuEj5UUd8F8t0j3BIV3bTNPCiLwUFh21Khcmb40FNwUGl77l9V2fE1?=
 =?us-ascii?Q?Fpamx7ikaJH3Iqs8fLrhwpneDMjC+0Jga2YpwBWP/SugwKxQRbaVRyfLrneL?=
 =?us-ascii?Q?vPx33M7YX+zyAdisfe28meAniTiex2zufcxj35XFECoDen86hUEDrKY/vXzE?=
 =?us-ascii?Q?ZDKQ8FcXk2nkIV9es76gTMnr+3q8DW1Lrm+gKAUJ1b+qGqxV0/AE+L1u+qOR?=
 =?us-ascii?Q?aZpsCjw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5vd7RjDRFaCDWV25NQEU6QA/wAeVVqzHomKzepaCuIPaHXxNu9iqcWR8LRTJ?=
 =?us-ascii?Q?AnRxrWMlOemh3i+RIkG5cE5M+jcTsieXVrUGXuDvuP50aadCl6QT69yEtNly?=
 =?us-ascii?Q?tnbxiWtqUfuBFvfXcpt9UlQb9H9Ti061SiginyM83tdT1YgK7jWBws+3jPKJ?=
 =?us-ascii?Q?+TvELqgdTiJ5nB/64issf/zBpsaaLfOotFppui/RQKglQzj6gvkup/DyQeiU?=
 =?us-ascii?Q?EAqKLtCPBj2+ZKLHd672T8468KNFgPcBs2uV9dbwC80shjz3zy3YEcHxGcD0?=
 =?us-ascii?Q?FIbCubuaEjGCd4UgGXWkRLUlHBBim7aRNsqoHk6sqLqymqE9rVzv1/ynZALa?=
 =?us-ascii?Q?xnDhvfZeyw9WB+2cGaufH2sbDUouDn3OUvypwuL3A7a4+CPzZeSIo7NzQtu7?=
 =?us-ascii?Q?yl2VLAS1+dCgnblAjhAEc9F3Y7JK1/sx7TT4tjLTWpjknHgcVMsiNGEJHMFf?=
 =?us-ascii?Q?dw9XLqitIZK5yg/03wnrKA2P32FZFYMitkuBKfSL6DKm93FYfWVXAsXcfODF?=
 =?us-ascii?Q?yXI5iIYsYc6wMsMrwRynYNUo2DOD2T/vWjk23cG3JxkinDz7ZUEDGlZS6DFe?=
 =?us-ascii?Q?oJ2OCMIuuKJHjCcLssUgWM3S8rcjzq6PSFxOXRq5cDsWQOZHoWuizgoWDc8N?=
 =?us-ascii?Q?YdohQW4oTxjW+WGoey7U5HeMtIKdl4nTr/S3jrwPVbkI9M8ikrrBDvcchbuV?=
 =?us-ascii?Q?AN+NuzxR3Ehqhy5MX4gFS63E05SAG5XOtbscm/A9ol6fiseKXVpZMjXXFZHQ?=
 =?us-ascii?Q?GmQMca2Vda7sB7dhz7vSrqlNj7U+HiZaTBArbce4rntXOwcBJXLgsCJZq/fo?=
 =?us-ascii?Q?1BejzdLlJp0pMtLxCjuZdOa/5x9GXLOfzdYQm/YtXGP7hYgQ31wbIO2gGYkk?=
 =?us-ascii?Q?rD5kEsgN/TVHZzshFAqlWVYVrqEbiu9RuNBoNa4y7GeFbK8M67NwwOhMkRue?=
 =?us-ascii?Q?jzx03hXe3gSoKLuOciNvHovko5JA6m52/KBVEy/swXVxLRb51RVyyqims7TL?=
 =?us-ascii?Q?hX9G2VVP+2tkC2/dIlRt3/1VpMw1fExP5+l609ytPU1Gvr1wGyL6AG4J6GrF?=
 =?us-ascii?Q?9STCCVf56F+sMEZ6u2ZnK5SJUjLBbsNLacU4QycNlvygyil++7ULOmKyKE9V?=
 =?us-ascii?Q?U8yU2IPdtrEGaFB/66mkauUiMjXBIiANxtyzGsuQegx0D8zW9tdoTajh88Th?=
 =?us-ascii?Q?QC1m32Dq0o0zMtqj32BkpuDKkkNO9ie223CV0ALg35VWWDaJO4OFBw23fbTK?=
 =?us-ascii?Q?OPWevRTUU4NsWTFiLRMBXWmzDz3IsOgvKYBNKOm/IVBoRKIaEYRhS1lY9vv2?=
 =?us-ascii?Q?4xhTa2fKm24nZzbuyKaT5ORXa3Ko150hS8pqP7dGnflzU5sjtM/gNEKJzmYn?=
 =?us-ascii?Q?H5bU6auaddePaayLigKKqfrv1kriVcoAoDQgKMddZTW06c6ogqLGZ1mNtxhX?=
 =?us-ascii?Q?53DE5COTE80/eKwzNiPnGKtqweX0Q3RGuhJc5vIBivdzHzzocBP+qxqozswt?=
 =?us-ascii?Q?CUM/hoBFCoY36I4nNZtWb4aCXlvonZzjZuKOHJid21kdreQT50xwgUjgbwv2?=
 =?us-ascii?Q?7BqLjp6L3vIQ9c7RCk7FK8KRlHXmJEx2GKKCs6V4RQ2WFr65DhSyEc81ANI2?=
 =?us-ascii?Q?ca7332LRkoYSxuW0G1trm2s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 472e419c-d79c-4e30-0675-08dcf31cdc06
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 04:40:45.7047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nL+/9lieCKTWTwIYxE72h1XqJyAJqsFx5HclKOxu7uys3e746Jq3VDN49T1mrPkZ8y03l6pCeqDCkouwKnI4kWGZ+ZNzQ3gWGS2ypaXWfwtyCoTf/1KrsE936rssc2YI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6784
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


Hi Sakari, again

> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > index 11b922fde7af..6a5d27dd0c64 100644
> > --- a/drivers/of/property.c
> > +++ b/drivers/of/property.c
> > @@ -630,6 +630,43 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
> >  }
> >  EXPORT_SYMBOL(of_graph_get_port_by_id);
> >  
> > +/**
> > + * of_graph_get_next_port() - get next port node.
> > + * @parent: pointer to the parent device node, or parent ports node
> > + * @prev: previous port node, or NULL to get first
> > + *
> > + * Parent device node can be used as @parent whether device node has ports node or not.
> 
> This line should be wrapped, no reason to have it longer than 80 chars.

We can use 100 char now on upstream ?

	commit bdc48fa11e46f867ea4d75fa59ee87a7f48be144
	("checkpatch/coding-style: deprecate 80-column warning")


Thank you for your help !!

Best regards
---
Kuninori Morimoto
