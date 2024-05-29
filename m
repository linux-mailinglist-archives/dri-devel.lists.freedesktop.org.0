Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475EB8D4207
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 01:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBE411A999;
	Wed, 29 May 2024 23:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="HizSIB3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2089.outbound.protection.outlook.com [40.107.114.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE8E113670
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 23:39:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nItl+zbQc1/y1GHd/0P7pkXjWyoMvUH6LUrk66X9r8jZK6S9bpXFTrfRDBcs5oR1A1zFT8DYGhlWYlVIFnH0PWnjOoOFd9odbt5UIWkCRn7AqhLHPpTjbt10+r8DOyD++XQu2+Kguxd+pqnf8t3xP/4XuHdy3vO2ndN4LkfyrBD4lpSdZ6ZDNPTwdoVRkQx94QoDOEFLyOTmtZHtIW/xNMdI34xXv4tnThuT2R6WevlYGlaiomdhNdjgkx7WJwKCR0ePeqb08WITTEw8u6TyM3Kw29r3F5WI8gIxScPTlAu+2ye/26TfKbAR+EMJvtQEA2sY6DxnMERxkVnx0ZZmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmlraVJP1GFD3K7oLsB1JsQmnCknMZERiovVDEZVmRg=;
 b=YCii4zZm1QuUN/09c6GiC622bCPs4jhWwUMm8ZUwjlyGAEUNN3KHfUziPBWGtEInNrISxabAsOlQ3jSaEKeFgnfi8PppLzDcHF3g8h8Ac3nxsvokD/FeAFdTDx1TfCnzRIW08pVn9NLU5JgCFiGG6Le+cflpb1WkxI/lGEBfOvxlWkE+FJ6ChOCpqLNQGKA8t769h//N+WRF6KV4b5FjLCMWx4cYzc9FHPrvAwc0vZdZJBubJwR5NoPuhgRsdkwZmlsZcouIBfw/hvt8MGLYmZhiiDk1oxaCg4LN9Job9D0nH2Wq7Z5PEobMLkqKdmJfA4TXHDlO+HaWU7oQkhoaYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmlraVJP1GFD3K7oLsB1JsQmnCknMZERiovVDEZVmRg=;
 b=HizSIB3p8GQXZ5ubEwWjvQMiv+ckl3XP49bgkIUEoHYwCK4i8S9diMusedYYc4U4d/pMlJ8A9P61NXWmeLVIFabZy+Oc6Q7Sj8y66wacw2q4qL3HAA84R6Aro6CyGJE2ICNEr+bK7tSm7X0zFQjtBq6vVGNTqANm/Vw9rhLjFUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10362.jpnprd01.prod.outlook.com
 (2603:1096:400:24a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Wed, 29 May
 2024 23:39:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 23:39:46 +0000
Message-ID: <87h6egqjb1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 prabhakar.csengg@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 2/8] hwtracing: use for_each_endpoint_of_node()
In-Reply-To: <7fbf421c-6477-4fc4-93a5-10e2788522c4@moroto.mountain>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
 <20240529004047.GB1436@pendragon.ideasonboard.com>
 <7fbf421c-6477-4fc4-93a5-10e2788522c4@moroto.mountain>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 29 May 2024 23:39:46 +0000
X-ClientProxiedBy: TYCPR01CA0020.jpnprd01.prod.outlook.com (2603:1096:405::32)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10362:EE_
X-MS-Office365-Filtering-Correlation-Id: 574948e9-76f5-468f-b477-08dc80389fb1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|52116005|1800799015|376005|366007|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BLsboinNFvhf3d0XZSPe3oxRcjndJCxsXA4nQnN3avpCWrJpodr10/AnxA+q?=
 =?us-ascii?Q?EFMuc2pHf/3lTH1MF6OwME7ri+UWjXv/mw5fscDfjMzhYnonrPdNyrwJdMiE?=
 =?us-ascii?Q?AJJ49wh0vKuDINHM76zTmQFcbPdGYQp6OgbtLDc1VbXJDYNTchdfqjyNE4DK?=
 =?us-ascii?Q?bcorIkcclgA3GXcNRIz/ak3Tnn8hKh0T9Xx83EZHuSsLuWPwnmfLn5V/bis0?=
 =?us-ascii?Q?d9eUC0+/svcdWEYwQSzwL4XRN400njy7TBk2qf9EePe+drbajUx/LthyFTWQ?=
 =?us-ascii?Q?kDKkZh6vR/rcR3v7OzbfgAPihYH+SCn0MsD2NYxBFS/umqHHdnml9OPu2hOc?=
 =?us-ascii?Q?p3dfvmaOBGG+HE8KAUq9q+rLM6i+WGSNTm3PJhR0fPXCB9CdOgJx+Rr67a+6?=
 =?us-ascii?Q?QUodSrhMzXrTT9uEwV3HKuSKeBFWmKRhlPCfFV9+2/Vy9nL6aR8a7Y/ujR+6?=
 =?us-ascii?Q?CkPb1EBOxmyVoXeoRa8Mtsomt775gxMJBQVF/ETv3AMbhAcnETCsuGEQIwUB?=
 =?us-ascii?Q?qWx9PxTFZcsAS6qKQslj9nw527Kt1ToapeTFOpNaUPFOde40T6MpCVyuph5q?=
 =?us-ascii?Q?McfNfxbmiDARsm+m8eJS9a1T/Gq+ocfHZzqyY9/EzEq0bXhBK1fgiSmDdjbM?=
 =?us-ascii?Q?BGe8FmiBbVvX6fUvv+EJw4ehIIPS41TsJjFSsQWKqbspFz6ZBZXQKs+rrO68?=
 =?us-ascii?Q?twJJFVtUACfyTvkkzd4dBIZT5AfAWx38MIcIeVNspWY/ddJs9dDhZqp6j7Ht?=
 =?us-ascii?Q?oTW8bjhNt3z8TgaRxxgNKkcjhQ2kqx45bVThB7p46rvSycmvhUWP3J9qT28K?=
 =?us-ascii?Q?xlzdQqbHW+dTWmirD6N5OPVLm2ivRgGeErc3vCtTveTivVF1XPvb9cq279Zc?=
 =?us-ascii?Q?e7dn4RZbYOL/gg2f9P4SUubXwOvhAW/fcKsNyGtqGinMfkx/IYIotlX8rEji?=
 =?us-ascii?Q?9qijBWPzn0vKV91WQK0AaLjLm69RW6NXwBNUL6Pyi/nRMPTymI58kzgGwJfa?=
 =?us-ascii?Q?LFhR8DjJIfEaRQ5ujVAFNQOyaHSYeV441K2nMEMBm+crBgxTrz7QULK17vfr?=
 =?us-ascii?Q?nKEh59hbzPa9a5tRBO2p56Gktf9vCeXHUds9ggLxi199L9aY3KIZDWcNLkiU?=
 =?us-ascii?Q?Z76tslDcG+mZ0fVY+UrFl6JmU0QZaKaGUY3VNbQKa74WPyPazYTY7Nw23U6L?=
 =?us-ascii?Q?w47EH0ts7jRxJtfNIfrOcdh7AtEvj5EIdDOGkxNZx6PRGACsxNH384viGqhx?=
 =?us-ascii?Q?Vbwpd5kdC86gTC9x5tgDJVt1HDW48JmuNn2m0+jHHBXzVYNwFhxPCFDmYCfp?=
 =?us-ascii?Q?ZG5JLC2cYhpczwhXDdl/sMAaJawS/lbifuVJ6XDNR/RnHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(52116005)(1800799015)(376005)(366007)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cpXFg7/Q7B6FZrNFOc7KbNKxB2IRaA0+kz9RieUD2db/xe5cl2gYd3zg8J/2?=
 =?us-ascii?Q?kbZs0XdjrIdzgcRTGSbO1UO78xhW9jkhtSfV3Bt98KIk0bk3zVpJ1ZSfM6kM?=
 =?us-ascii?Q?zeBMhrH9aEgbQ85TrT+1kc4LGg1ylVbQ3pcLMIJtHLn36w1s/4+787BCJslM?=
 =?us-ascii?Q?8qko50R3rs16dedDkrbcGCBoK0ErHEDe/7QGy0H+BK7Fv3bXqaUKSaRABTl+?=
 =?us-ascii?Q?wqWBkePINRdfoN/HO2CPAQBhBXUkJj5fQrLZwyhBzVH1uEixiqcbWgeVnq+H?=
 =?us-ascii?Q?d2+I7/JorSOuDkkK5PM5st8QsE8Ji/lCVi/R0VC2mUst1zYl9D8seDi8Br4t?=
 =?us-ascii?Q?nNFeSfVLnKMwquE3U3M8WXv15PazQZbFG4TPyxIxO1K+4Q0TG4N3Kq0PqpoO?=
 =?us-ascii?Q?ofPtDQeXOOtJ/MthII5S2L736yD9KHXDrFFA9USv2BqMTaAyjNb0xLDl+U3p?=
 =?us-ascii?Q?cuyV+c9WuZ5ERF2laS/UU+vHSMNpNQhO2jbCGu8PxgOtG7eEMtcLclAZvggJ?=
 =?us-ascii?Q?AkIxU6CDPM8sn0geFHI84GUvmimd15daEnW1SZsnCywcfzVyPd8WaUWdy3X2?=
 =?us-ascii?Q?y0LjcR+/gEI/mUvFsejfi/IksY1UJZmOVv0Wwb8Sf2yuML9vL4/moGkAgg33?=
 =?us-ascii?Q?WYusfADv0WZAbZsyTifl3f7vxB5XOXn0zCu3QIU47ixMKOirfowIbF9TY6CW?=
 =?us-ascii?Q?HGEUtxmHieDshLFIFf0jOkIt24QK4lJfyE9erZVEujuOXEQafjjIujt/LQmj?=
 =?us-ascii?Q?pQ6tIVn098W97LZThIxCdL3StMO/lw9QhPdaY06eZuC4eN7nRwa+URT3gHJK?=
 =?us-ascii?Q?DDrnVPOxxMgPB2OHISXiq8msSiLWZU/1bZ7SBX/8HqqNPBwFGN/eYD1Fo1Cx?=
 =?us-ascii?Q?jlYZuIOoYae4cI/Uh9SRAS9wX7a2oQ5yoTSIyMhShRQdBxFvjJOixbf8eomj?=
 =?us-ascii?Q?JLiIswlZA3GLEHkS3kBnm9T2FtmknOAH8NwKnJ4+s9qHuhXV8Fjv3WFDnAQG?=
 =?us-ascii?Q?7vj1Zfj7gLDx4erj4h1a3BGydTd86PcFYnLKJoaj+7Ul2+aDfvk0Erkoc3jf?=
 =?us-ascii?Q?M4vKJudU1oT6jin0yLdu0YBMOx03KAt5vA7+rBotKYw7zV2yorHDzXwTgFSw?=
 =?us-ascii?Q?0A+vfVdpjRjW/2RAuHBKUqg3CWdgvAoYSj9Q5kTWkE7CkobrpD/6AprR13kV?=
 =?us-ascii?Q?lY7/D41BeScJRcuNjj4EKyKLlkkMy7ncvS8/nt0EUKdFUMYSETldzFssai8g?=
 =?us-ascii?Q?LCEqJ7DD6SLWqlaOHkchgkeWDbeRvqLHJ4K1kfyOLoSmB+avw8TwDlj2pECY?=
 =?us-ascii?Q?/woBVIyOkPqvVD+Vywzp3RcHdhLOzBzD9YQjwuu3Q/gCL4GPisxzmHwVHvHx?=
 =?us-ascii?Q?9RBAYzAvoKaOtXu5AiDnIclMr43jSC0Zj4Tl10Qfzxo0USxv/YXi2NWMzQHw?=
 =?us-ascii?Q?h+jfL5n9hHQIQOdlD+2wVoRub6h5qh++r/muQAlJhctOMBUCkSG4JMw9knkr?=
 =?us-ascii?Q?0Mao7qcgiSHeE/JEGWPsIC+kC9F/spkXtl8+3bD0vaIqRLHJWHdH+jQbJp/o?=
 =?us-ascii?Q?8u3scAWqgmfgXZltlLj/EmhtLmaUnZNBOswQ10j/ZF661TbGF/gf//kg3anl?=
 =?us-ascii?Q?EWEAlFAxladZ+NULCxL4u8E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 574948e9-76f5-468f-b477-08dc80389fb1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 23:39:46.6686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +L5Fk9+Ko0RgjOZy+DWpVV/vDfOOJPRae47NDW6mbsWXAJZx0391VlQIMy4YdSqL0deVfcyhw5xv6ts4YheMyeRSqAbolFvI/eH2I7q/jYXmi5G8Xfh+zBlyJ+TDktgM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10362
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


Hi Dan

> Someone should create for_each_endpoint_of_node_scoped().
> 
> #define for_each_endpoint_of_node_scoped(parent, child) \
>         for (struct device_node *child __free(device_node) =           \
>              of_graph_get_next_endpoint(parent, NULL); child != NULL;  \
>              child = of_graph_get_next_endpoint(parent, child))

Thank you for pointing it.
I have noticed that _scoped() loop exist, but this patch-set
want to focus to use existing for_each_xxx() loop first.
Replacing to _scoped() macro is next step.

Thank you for your help !!
Best regards
---
Kuninori Morimoto
