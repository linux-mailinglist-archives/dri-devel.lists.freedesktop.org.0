Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545F8B1C90B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 17:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D11E10E059;
	Wed,  6 Aug 2025 15:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="TLY9csgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013024.outbound.protection.outlook.com
 [40.107.162.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B956510E059
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 15:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oS6BAk3/8bSeCEiicYGMU98tBd1PLEQK4l5EqHaw6V7NYw0LMyVq3A5kzi2nROUIw9x2jM7zbpwJ4rWnQx3LDbvoWAkHg2nL8tRpMuTuWFEUUnSnQFyqeZH+L5fCX3boMUhVnUBwkD499DOenW45JK2DuuY5yOjVj2qWMmhU8WLtXPrM+Ub5FMef1IN1GQlqHXZLOhhCSaG29Che+P+uT1WhPUX3hTAV7N6Thv6wJUGBRqaPiBcsKaKFEiTqPBkQASgKCPfqN9/mKWTlP3943qYhSVg0voGTNR1Vd8fVpXiSofEGahzdxbzkghUeSfEFsiDt3pFI8Q8BEV+Xt5wKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KEbADkKfkp7+7C8LHT8w+0VtctSItJOj0nw/CjpAsQ=;
 b=h0slgpQjUVBm5CS3IUCyDktOoTH3h2lrL39slMeoCA6Kwxlu9FYExXOp5Jy5IGThP/7/DJ2d/Y41ef/LHv/ucNIdhHGucM8Quyh5+XjSjX44kqjBC/HD6ZL/hv28X+w2nwpxdzDNHM5sniIfpi48iG+CsBBhAebZs9vyAVJycdRpiw3eCYaMuwdTOl20aay0Uxly/9TaYQ47LTNTraue17/C+zVCGei4KL7/PABZ7x63i1lLIuLQ642x2KYUog2g5Ivb9VhbIRAa4qEK/h1LYob/bbZQa8lRvV71m8LE6bGBCYlO/4iopL+iULUG0kojv8ICvOy55tqCPAh3JZluaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KEbADkKfkp7+7C8LHT8w+0VtctSItJOj0nw/CjpAsQ=;
 b=TLY9csgG5EeG4YihuTnjCRZuCNkGcJv72tpv3R422bEh9ir+5H/5OntmHJIHKV5886SuEs5fKZLrm7sRn6oPEmfKklekqnAHC3CydS+kDhb5hfur1clvjiAynUflKKWTKe0QNIYYWHZpih2iDVl6kpol7hhZGFrXKWqhqstXa5Al5Jl48hfi+1SaXKFh7ComfLRzpLhWi8ez9fpNgsaDFdrTnhyEvGx5wcORmVEoFwK1M27KB73cAI53wwvSZGolCE2ULBM6LRXAhp2zAlLXuFuzvKGStQvwutNGhSOiY5FUYZ9cMFg32MfNDIT5hHFjku4Oy6cFqzapSuB/15iXUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7611.eurprd04.prod.outlook.com (2603:10a6:10:1f4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 15:43:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 15:43:57 +0000
Date: Wed, 6 Aug 2025 11:43:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandor Yu <sandor.yu@nxp.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/9] drm/imx: Add support for i.MX94 DCIF
Message-ID: <aJN4Ns+Vt20Q2UIj@lizhi-Precision-Tower-5810>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
 <20250806150521.2174797-6-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806150521.2174797-6-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: PH7PR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:510:33d::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: b975b1e7-3b04-427f-a0ab-08ddd5000e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lT0L1TwiSr6tj71hjLYdoRQsWGXrPtkmOcDOOXN1dD80RhA6668gvFj/Glfr?=
 =?us-ascii?Q?HdphPevAUDm5Z0hwvzmRAyY8uesvHhZlqGj58HWIr0GIBaEo7+hZVAdKm0Gw?=
 =?us-ascii?Q?Bbpymj98koc0eKme19yxY3CY3omxagfURBlzRuGgGVqk1SlrZzi3eFJL2RRU?=
 =?us-ascii?Q?kflgX5xBvxCTPzTjjxfmsw3c1PT9hgQS8hEVqMZLwoYjKfV4cVWnLvAxcGLY?=
 =?us-ascii?Q?06EzZSfZ1okRbg3rRjxq6EQUoTQGyBlB+/k4BArGu+Q85aGvJ+CRpaYuWpGq?=
 =?us-ascii?Q?BHw1tE3gZUmpyd0O8VYda0o5INiOffNfPUEoHyvY2DDip4Hyt2rusmkx8M5Z?=
 =?us-ascii?Q?CjTmUsdoYyx/upCr0zvi98GqapSaDWSs43uKUDY32IZsarxN4Wq5rNKXr1uj?=
 =?us-ascii?Q?wvImn4hXFDk0fuKvfqh7UoYmct6htbRzw8pQHPlG0ttfMmA4gCCK+MrgXC/+?=
 =?us-ascii?Q?pSwWLX5pPtgYFCAkw67xfbzH15LkBFK0RGtnaWjXBM1J8+OnEGVZa6Ra6+p8?=
 =?us-ascii?Q?u2dsjdVQLbiKtrPYwANaKTEySFGqYKMj9U1pGs68P7y/FOlRo5illzwy9rNZ?=
 =?us-ascii?Q?HPfyXCUcxtd7P66Q71sHXloRSUK2NkHHubKK1oAIr6+iCaG8kFz+DwZG4IWg?=
 =?us-ascii?Q?vqBzpR3oNi2P+x/HXQo95QishAF7UKve1nXhJ66hEg3Wc/n7243sujHPd0HF?=
 =?us-ascii?Q?H8RNlRmJ2cyGSy01j1Pb7JWOaeh9CWLISvCBLF2NFP9a1WVCxe52xlmr/Awo?=
 =?us-ascii?Q?euEKs73nz/1gohdK9sccim0jbTlyR02hQeGhBiezE4j53nnP1EuZl7N3SKdM?=
 =?us-ascii?Q?QUJxGVBAPZoFg8XGEpUVXj0OKo35P0SBvakXF7UaDxGoUr+pE/GlvgKV9TlW?=
 =?us-ascii?Q?4nmqDyh36NqhnbI/T70zOnMAZ8EKmThvKXSXA1oj5VXLLdBM8SbF03oo7tej?=
 =?us-ascii?Q?NpmNG8Ov9BJGaJFGQu3m0yEB/9XTzcZWJfNlwWCrlOCHFPedVdsVgerP53RU?=
 =?us-ascii?Q?fAnpbOPSx7nA/6aAQ3SiMLiXC+rU3vqZMlLdFJTyfzGST2ubxEgvOUBvUFH4?=
 =?us-ascii?Q?MSIejkNX3bDRoDnExnBvVXc/tSrVmqWB5AtxohWFAEhkBcHJV7tB9jKEqJt6?=
 =?us-ascii?Q?Nl/OJZxYM/ssaSbIsGKBGoHm4s7acn0qBH5PwYosBvzjjCw+jv1B/+/0J+JH?=
 =?us-ascii?Q?LvYSVGgQoMplgReY1kFO5V8l0c4CESPkXvdS2TZKGdZvt3eI6czCOvMAZAcK?=
 =?us-ascii?Q?Tlr4dznGQRTIp4sHRnmZ0nzqj2Cbh9Zyj7nN8jxph0iPRy9Z1t0zRGOtq3Nq?=
 =?us-ascii?Q?eX3qL4QMvNatrMC9r6F5J8nMKV51kjnrhb3QkvOCcjPQ5BhQ+j+fkFly9tN8?=
 =?us-ascii?Q?0GNPl/leG0anBmWK+jiIReKRXAKmPJcNqLgL3cz5prJAGgkuN8j4grJ0nHo1?=
 =?us-ascii?Q?fpxjjl/nDX+kdTc6+FHw6BEEdwHk/Bc9nx7q9wJMgsOPW27H1HPMqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lrn1Cm9QqT0C9RLQKKvW7mXe+GIi7hgC5MotTmPnzXJTAAYXeq1POhRBEliJ?=
 =?us-ascii?Q?H6zknbhw0a4LOEb/mMDc+xKZ/RQQKyyjul01oIqKSW0eA3+IcW++uKWYZP8Z?=
 =?us-ascii?Q?0xyzh3jv9J7ZdMKhdrY7hNSjTRvTMkCnvycLi7mqCS+RzK/qw7ups4qtSY0q?=
 =?us-ascii?Q?BKtVdDH89oJU/MhoN4Q1J61extL3gh35ZhEuf8bfptKztR4Jl2Q1xaRAZbmr?=
 =?us-ascii?Q?GDJgR4zBs4fV7xSo5ZOlWOPdadM35mE5hjQiEKsIUwkq2v8cnG2qRb424AJu?=
 =?us-ascii?Q?v+ufkNzHDAWfFUGUunXY3B8FzstHvJPojerCcQbvEVkZ4ezKRwfL6u7xMUR9?=
 =?us-ascii?Q?U5BF4kyjOdQvczZ8fBeN7PnMYn2G0Mk3B/nncK8YkCSXvmA1JMlEskI8SVwr?=
 =?us-ascii?Q?RJoCXgEvKb1NabTE8T+D98wGsplnLFre1LObVPLBp/w6IoptMtdRQi+VyiX8?=
 =?us-ascii?Q?6RzMBphRoZbLYdU53Y9WYnLMBPp2YxM9m/my8w2r8hd20gntkYxtgN9vbVlG?=
 =?us-ascii?Q?UzfqbBq1mgVDUWt0QZD7kQj/1RHEUC7wxdNc/x4afg6JFI2jHWamNWHTwDIU?=
 =?us-ascii?Q?MoLwj90sV+kh410EUwGCfnf3dZV6iuiaHIXyEZW4dbQDwg5Wsv4/arrHYoF7?=
 =?us-ascii?Q?Ke2gdXwaZRP1oI/EbyoT6pXwTVOwEF0AwfXymMEZWYGTl2AgrfbWc5e10imf?=
 =?us-ascii?Q?M//ExyaHz7O6mb3Jy9FkdD0/VfDeGgBuOUKX2kG7SRBC7s/nmgqBWB5ZvuIi?=
 =?us-ascii?Q?Qmojhes9XxpEyyquZ5o+OLIcFWZLUaH9ZFIdzzqL4QjdzknskgtTd+erT0C7?=
 =?us-ascii?Q?NEWSPWujGsZcEdKimXAiFileVB9zEQOpcl08616MMwe66VryS/EjZIgVGoFk?=
 =?us-ascii?Q?z93RuFGWgG5qF5AWzFiWwARReoJzcZA4gGM3N4z7s985865LW8kE8k4krnXT?=
 =?us-ascii?Q?xZcyvtMKr0tqtsiTTt7st65S9/rJTOd7oqNdTLe34Ww2NiWOwjRGvGvUAAiI?=
 =?us-ascii?Q?onSKPgEBSMD1hHsw7utHoraHvRzq3btcLHaT4Gv+ZsvPFsGvktPtCptXPNpg?=
 =?us-ascii?Q?kCaWFpgBu6YqOvb+cn1tKzwbtCDLwLZBRWU/ztW27m71UCAzxkjxQ3SHZp71?=
 =?us-ascii?Q?2lgLqtP7kI85K0BTIJU9PWXHrS5Y1JjHv6wP2byR64F9xnVjhZc4NKop4FNi?=
 =?us-ascii?Q?er+CULaYaqWJnsd+jWXWbcHF/mUOpV8qHmjDle1kqJqZn5eJhMTqRo/prUmu?=
 =?us-ascii?Q?II1EswFmuqjiK3JRhdY0W/KkgwNL5oIleeQjB5Ur2G/2qmP4jWFkdlcOw0E/?=
 =?us-ascii?Q?2wki/w32DmA+ZIevIJsvt+3R+cBd+Kbv0jiNpaY3bVk44Ox2zod02108lopU?=
 =?us-ascii?Q?OFKKvNDTE9651Xgi12mPkqwNZmC1DwcST1umF7h4d3wu8CGTm9K26O6rEwW3?=
 =?us-ascii?Q?6+vXS0ltOFiUAA3MnbTS3BS8D3pYuGCTFqlT54EBPHhXOHsz3BjeCJywEPXd?=
 =?us-ascii?Q?4fNWcVZQuCnCZSYicv15CG4Mbn+RWYHtvkHTf232jDX8cxJs73TOkmMn9acu?=
 =?us-ascii?Q?DVhHjCAmZIHCwCeBO3EnyEL1sYQyjud4d9hOClRN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b975b1e7-3b04-427f-a0ab-08ddd5000e65
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 15:43:57.7692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o519TSpl8kDb3taiilkcGSVpSPNDekGS6aisLP58OBL1aLCNib2ONygVpfIG9XcDXqDL8voG3Cbl/4BB4xLwqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7611
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

On Wed, Aug 06, 2025 at 06:05:12PM +0300, Laurentiu Palcu wrote:
> From: Sandor Yu <sandor.yu@nxp.com>
>
> The i.MX94 Display Control Interface features:
>  * Up to maximum 3 layers of alpha blending:
>     - 1 background layer(Layer 0);
>     - 1 foreground layer(Layer 1);
>     - A programmable constant color behind the background layer;
>  * Each layer supports:
>     - programmable plane size;
>     - programmable background color;
>     - embedded alpha and global alpha;
>  * Data output with CRC checksum for 4 programmable regions;
>
> Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/gpu/drm/imx/Kconfig           |   1 +
>  drivers/gpu/drm/imx/Makefile          |   1 +
>  drivers/gpu/drm/imx/dcif/Kconfig      |  15 +
>  drivers/gpu/drm/imx/dcif/Makefile     |   5 +
>  drivers/gpu/drm/imx/dcif/dcif-crc.c   | 211 ++++++++
>  drivers/gpu/drm/imx/dcif/dcif-crc.h   |  52 ++
>  drivers/gpu/drm/imx/dcif/dcif-crtc.c  | 694 ++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dcif/dcif-drv.c   | 226 +++++++++
>  drivers/gpu/drm/imx/dcif/dcif-drv.h   |  84 ++++
>  drivers/gpu/drm/imx/dcif/dcif-kms.c   | 100 ++++
>  drivers/gpu/drm/imx/dcif/dcif-plane.c | 269 ++++++++++
>  drivers/gpu/drm/imx/dcif/dcif-reg.h   | 266 ++++++++++
>  12 files changed, 1924 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/dcif/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dcif/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.c
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.h
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-plane.c
>  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-reg.h
>
> diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
> index 3e8c6edbc17c2..1b6ced5c60b51 100644
> --- a/drivers/gpu/drm/imx/Kconfig
> +++ b/drivers/gpu/drm/imx/Kconfig
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
...
> +static int
> +dcif_crc_parse_source(const char *source_name, enum dcif_crc_source *s,
> +		      struct drm_rect *roi)
> +{
> +	static const char roi_prefix[] = "roi:";
> +
> +	if (!source_name) {
> +		*s = DCIF_CRC_SRC_NONE;
> +	} else if (!strcmp(source_name, "auto")) {
> +		*s = DCIF_CRC_SRC_FRAME;
> +	} else if (strstarts(source_name, roi_prefix)) {
> +		char *options __free(kfree), *opt;

need set opt to NULL here

> +		int len = strlen(roi_prefix);
> +		int params[4];
> +		int i = 0, ret;
> +
> +		options = kstrdup(source_name + len, GFP_KERNEL);
> +
...
> +
> +static void dcif_crtc_atomic_enable(struct drm_crtc *crtc,
> +				    struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, crtc->primary);
> +	struct dcif_crtc_state *dcif_crtc_state = to_dcif_crtc_state(crtc_state);
> +	struct drm_display_mode *adj = &crtc_state->adjusted_mode;
> +	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc);
> +	struct drm_device *drm = crtc->dev;
> +	dma_addr_t baseaddr;
> +
> +	dev_dbg(drm->dev, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
> +
> +	/* enable power when we start to set mode for CRTC */
> +	pm_runtime_get_sync(drm->dev);

Need check return value here.

> +
> +	drm_crtc_vblank_on(crtc);
> +
> +	dcif_crtc_mode_set_nofb(crtc_state, plane_state);
> +
> +	baseaddr = drm_fb_dma_get_gem_addr(plane_state->fb, plane_state, 0);
> +	if (baseaddr)
> +		regmap_write(dcif->regmap, DCIF_CTRLDESC4(0), baseaddr);
> +
> +	dcif_enable_plane_panic(dcif);
> +	dcif_enable_controller(dcif);
> +
> +	dcif_crtc_queue_state_event(crtc);
> +
> +	if (dcif->has_crc && dcif_crtc_state->crc.source != DCIF_CRC_SRC_NONE)
> +		dcif_crtc_enable_crc_source(dcif, dcif_crtc_state->crc.source,
> +					    &dcif_crtc_state->crc.roi, 0);
> +}
> +
...
> +irqreturn_t dcif_irq_handler(int irq, void *data)
> +{
> +	struct drm_device *drm = data;
> +	struct dcif_dev *dcif = to_dcif_dev(drm);
> +	int domain = dcif->cpu_domain;
> +	u32 stat0, stat1, crc;
> +
> +	regmap_read(dcif->regmap, DCIF_IS0(domain), &stat0);
> +	regmap_read(dcif->regmap, DCIF_IS1(domain), &stat1);
> +
> +	if (stat0 & DCIF_INT0_VS_BLANK) {
> +		drm_crtc_handle_vblank(&dcif->crtc);
> +
> +		scoped_guard(spinlock_irqsave, &drm->event_lock) {
> +			if (dcif->event) {
> +				drm_crtc_send_vblank_event(&dcif->crtc, dcif->event);
> +				dcif->event = NULL;
> +				drm_crtc_vblank_put(&dcif->crtc);
> +			}
> +			if (dcif->crc_is_enabled) {
> +				regmap_read(dcif->regmap, DCIF_CRC_VAL_R(0), &crc);
> +				drm_crtc_add_crc_entry(&dcif->crtc, false, 0, &crc);
> +				dev_dbg(drm->dev, "crc=0x%x\n",  crc);
> +			}
> +		}
> +	}
> +
> +	if (stat1 & (DCIF_INT1_FIFO_PANIC0 | DCIF_INT1_FIFO_PANIC1)) {
> +		u32 panic = stat1 & (DCIF_INT1_FIFO_PANIC0 | DCIF_INT1_FIFO_PANIC1);
> +
> +		dev_dbg_ratelimited(drm->dev, "FIFO panic on %s\n",
> +				    panic == (DCIF_INT1_FIFO_PANIC0 | DCIF_INT1_FIFO_PANIC1) ?
> +				    "layers 0 & 1" : panic == DCIF_INT1_FIFO_PANIC0 ? "layer 0" :
> +				    "layer 1");
> +	}
> +
> +	/* W1C */
> +	regmap_write(dcif->regmap, DCIF_IS0(domain), stat0);
> +	regmap_write(dcif->regmap, DCIF_IS1(domain), stat1);

Need move above two lines to just after read it to avoid lost irq.

> +
> +	return IRQ_HANDLED;
> +}
> +
> +int dcif_crtc_init(struct dcif_dev *dcif)
> +{
> +	int ret;
> +
> +	ret = dcif_plane_init(dcif);
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(&dcif->crtc, &dcif_crtc_helper_funcs);
> +	ret = drm_crtc_init_with_planes(&dcif->drm, &dcif->crtc, &dcif->planes.primary, NULL,
> +					&dcif_crtc_funcs, NULL);
> +	if (ret) {
> +		drm_err(&dcif->drm, "failed to initialize CRTC: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
...
> +
> +static void dcif_read_chip_info(struct dcif_dev *dcif)
> +{
> +	struct drm_device *drm = &dcif->drm;
> +	u32 val, vmin, vmaj;
> +
> +	pm_runtime_get_sync(drm->dev);
> +
> +	regmap_read(dcif->regmap, DCIF_VER, &val);
> +
> +	dcif->has_crc = val & 0x2;

0x2 need register field define macro for it

> +
> +	vmin = DCIF_VER_GET_MINOR(val);
> +	vmaj = DCIF_VER_GET_MAJOR(val);
> +	DRM_DEV_DEBUG(drm->dev, "DCIF version is %d.%d\n", vmaj, vmin);
> +
> +	pm_runtime_put_sync(drm->dev);
> +}
> +
...
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_vblank.h>
> +
> +struct dcif_dev {
> +	struct drm_device drm;
> +	void __iomem *reg_base;
> +
> +	struct regmap *regmap;
> +	int irq[3];

3 need define MAX_IRQ_NUMS macro for it.

Frank
> +
> +	unsigned int num_clks;
> +	struct clk_bulk_data *clks;
> +
> +	struct drm_crtc crtc;
> +	struct {
> +		struct drm_plane primary;
> +		struct drm_plane overlay;
> +	} planes;
> +	struct drm_encoder encoder;
> +
> +	struct drm_pending_vblank_event *event;
> +
> +	/* Implement crc */
> +	bool has_crc;
> +	bool crc_is_enabled;
> +
> +	/* CPU domain for interrupt control */
> +	int cpu_domain;
> +};
> +
> +enum dcif_crc_source {
> +	DCIF_CRC_SRC_NONE,
> +	DCIF_CRC_SRC_FRAME,
> +	DCIF_CRC_SRC_FRAME_ROI,
> +};
> +
> +struct dcif_crc {
> +	enum dcif_crc_source	source;
> +	struct drm_rect		roi;
> +};
> +
> +struct dcif_crtc_state {
> +	struct drm_crtc_state	base;
> +	struct dcif_crc		crc;
> +	u32			bus_format;
> +	u32			bus_flags;
> +};
> +
> +static inline struct dcif_dev *to_dcif_dev(struct drm_device *drm_dev)
> +{
> +	return container_of(drm_dev, struct dcif_dev, drm);
> +}
> +
> +static inline struct dcif_dev *crtc_to_dcif_dev(struct drm_crtc *crtc)
> +{
> +	return to_dcif_dev(crtc->dev);
> +}
> +
> +static inline struct dcif_crtc_state *to_dcif_crtc_state(struct drm_crtc_state *s)
> +{
> +	return container_of(s, struct dcif_crtc_state, base);
> +}
> +
> +irqreturn_t dcif_irq_handler(int irq, void *data);
> +int dcif_crtc_init(struct dcif_dev *dcif);
> +int dcif_plane_init(struct dcif_dev *dcif);
> +int dcif_kms_prepare(struct dcif_dev *dcif);
> +
> +#endif
> diff --git a/drivers/gpu/drm/imx/dcif/dcif-kms.c b/drivers/gpu/drm/imx/dcif/dcif-kms.c
> new file mode 100644
> index 0000000000000..69d999d178b0b
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/dcif-kms.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "dcif-drv.h"
> +
> +static int dcif_kms_init(struct dcif_dev *dcif)
> +{
> +	struct drm_device *drm = &dcif->drm;
> +	struct device_node *np = drm->dev->of_node;
> +	struct drm_connector *connector;
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	ret = dcif_crtc_init(dcif);
> +	if (ret)
> +		return ret;
> +
> +	bridge = devm_drm_of_get_bridge(drm->dev, np, 0, 0);
> +	if (IS_ERR(bridge))
> +		return dev_err_probe(drm->dev, PTR_ERR(bridge), "Failed to find bridge\n");
> +
> +	dcif->encoder.possible_crtcs = drm_crtc_mask(&dcif->crtc);
> +	ret = drm_simple_encoder_init(drm, &dcif->encoder, DRM_MODE_ENCODER_NONE);
> +	if (ret) {
> +		drm_err(drm, "failed to initialize encoder: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = drm_bridge_attach(&dcif->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		drm_err(drm, "failed to attach bridge to encoder: %d\n", ret);
> +		return ret;
> +	}
> +
> +	connector = drm_bridge_connector_init(drm, &dcif->encoder);
> +	if (IS_ERR(connector)) {
> +		drm_err(drm, "failed to initialize bridge connector: %d\n", ret);
> +		return PTR_ERR(connector);
> +	}
> +
> +	ret = drm_connector_attach_encoder(connector, &dcif->encoder);
> +	if (ret)
> +		drm_err(drm, "failed to attach encoder to connector: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static const struct drm_mode_config_funcs dcif_mode_config_funcs = {
> +	.fb_create     = drm_gem_fb_create,
> +	.atomic_check  = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static const struct drm_mode_config_helper_funcs dcif_mode_config_helpers = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +int dcif_kms_prepare(struct dcif_dev *dcif)
> +{
> +	struct drm_device *drm = &dcif->drm;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	ret = dcif_kms_init(dcif);
> +	if (ret)
> +		return ret;
> +
> +	drm->mode_config.min_width	= 1;
> +	drm->mode_config.min_height	= 1;
> +	drm->mode_config.max_width	= 1920;
> +	drm->mode_config.max_height	= 1920;
> +	drm->mode_config.funcs		= &dcif_mode_config_funcs;
> +	drm->mode_config.helper_private	= &dcif_mode_config_helpers;
> +
> +	ret = drm_vblank_init(drm, 1);
> +	if (ret < 0) {
> +		drm_err(drm, "failed to initialize vblank: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_mode_config_reset(drm);
> +
> +	drmm_kms_helper_poll_init(drm);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/imx/dcif/dcif-plane.c b/drivers/gpu/drm/imx/dcif/dcif-plane.c
> new file mode 100644
> index 0000000000000..54ab8edd11e0c
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/dcif-plane.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_blend.h>
> +#include <drm/drm_fb_dma_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_rect.h>
> +
> +#include "dcif-drv.h"
> +#include "dcif-reg.h"
> +
> +static const u32 dcif_primary_plane_formats[] = {
> +	/* RGB */
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_XRGB4444,
> +	DRM_FORMAT_XRGB8888,
> +
> +	/* Packed YCbCr */
> +	DRM_FORMAT_YUYV,
> +	DRM_FORMAT_YVYU,
> +	DRM_FORMAT_UYVY,
> +	DRM_FORMAT_VYUY,
> +};
> +
> +static const u32 dcif_overlay_plane_formats[] = {
> +	/* RGB */
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_XRGB4444,
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static inline struct dcif_dev *plane_to_dcif_dev(struct drm_plane *plane)
> +{
> +	return to_dcif_dev(plane->dev);
> +}
> +
> +static inline dma_addr_t drm_plane_state_to_baseaddr(struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb = state->fb;
> +	struct drm_gem_dma_object *dma_obj;
> +	unsigned int x = state->src.x1 >> 16;
> +	unsigned int y = state->src.y1 >> 16;
> +
> +	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
> +
> +	return dma_obj->dma_addr + fb->offsets[0] + fb->pitches[0] * y + fb->format->cpp[0] * x;
> +}
> +
> +static int dcif_plane_get_layer_id(struct drm_plane *plane)
> +{
> +	return (plane->type == DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
> +}
> +
> +static int dcif_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct dcif_dev *dcif = plane_to_dcif_dev(plane);
> +	struct drm_framebuffer *fb = new_plane_state->fb;
> +	struct drm_framebuffer *old_fb = old_plane_state->fb;
> +	struct drm_crtc_state *crtc_state;
> +
> +	if (!fb)
> +		return 0;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, &dcif->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return -EINVAL;
> +
> +	/*
> +	 * Force CRTC mode change if framebuffer stride or pixel format have changed.
> +	 */
> +	if (plane->type == DRM_PLANE_TYPE_PRIMARY && old_fb &&
> +	    (fb->pitches[0] != old_fb->pitches[0] || fb->format->format != old_fb->format->format))
> +		crtc_state->mode_changed = true;
> +
> +	return drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> +						   DRM_PLANE_NO_SCALING, DRM_PLANE_NO_SCALING, true,
> +						   true);
> +}
> +
> +static void dcif_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct dcif_dev *dcif = plane_to_dcif_dev(plane);
> +	int layer_id = dcif_plane_get_layer_id(plane);
> +	struct drm_framebuffer *fb = new_state->fb;
> +	u32 crtc_x, crtc_y, crtc_h, crtc_w;
> +	u32 layer_fmt = 0, yuv_fmt = 0;
> +	dma_addr_t baseaddr;
> +	u32 reg;
> +
> +	if (!fb)
> +		return;
> +
> +	crtc_x = new_state->crtc_x;
> +	crtc_y = new_state->crtc_y;
> +	crtc_h = new_state->crtc_h;
> +	crtc_w = new_state->crtc_w;
> +
> +	/* visible portion of plane on crtc */
> +	regmap_write(dcif->regmap, DCIF_CTRLDESC1(layer_id),
> +		     DCIF_CTRLDESC1_POSX(crtc_x) | DCIF_CTRLDESC1_POSY(crtc_y));
> +	regmap_write(dcif->regmap, DCIF_CTRLDESC2(layer_id),
> +		     DCIF_CTRLDESC2_WIDTH(crtc_w) | DCIF_CTRLDESC2_HEIGHT(crtc_h));
> +
> +	/* pitch size */
> +	reg = DCIF_CTRLDESC3_P_SIZE(2) | DCIF_CTRLDESC3_T_SIZE(2) |
> +	      DCIF_CTRLDESC3_PITCH(fb->pitches[0]);
> +	regmap_write(dcif->regmap, DCIF_CTRLDESC3(layer_id), reg);
> +
> +	/*  address */
> +	baseaddr = drm_fb_dma_get_gem_addr(new_state->fb, new_state, 0);
> +
> +	drm_dbg_kms(plane->dev, "[PLANE:%d:%s] fb address %pad, pitch 0x%08x\n",
> +		    plane->base.id, plane->name, &baseaddr, fb->pitches[0]);
> +
> +	regmap_write(dcif->regmap, DCIF_CTRLDESC4(layer_id), baseaddr);
> +
> +	/* Format */
> +	switch (fb->format->format) {
> +	/* RGB Formats */
> +	case DRM_FORMAT_RGB565:
> +		layer_fmt = CTRLDESCL0_FORMAT_RGB565;
> +		break;
> +	case DRM_FORMAT_RGB888:
> +		layer_fmt = CTRLDESCL0_FORMAT_RGB888;
> +		break;
> +	case DRM_FORMAT_XRGB1555:
> +		layer_fmt = CTRLDESCL0_FORMAT_ARGB1555;
> +		break;
> +	case DRM_FORMAT_XRGB4444:
> +		layer_fmt = CTRLDESCL0_FORMAT_ARGB4444;
> +		break;
> +	case DRM_FORMAT_XBGR8888:
> +		layer_fmt = CTRLDESCL0_FORMAT_ABGR8888;
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		layer_fmt = CTRLDESCL0_FORMAT_ARGB8888;
> +		break;
> +
> +	/* YUV Formats */
> +	case DRM_FORMAT_YUYV:
> +		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
> +		yuv_fmt = CTRLDESCL0_YUV_FORMAT_VY2UY1;
> +		break;
> +	case DRM_FORMAT_YVYU:
> +		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
> +		yuv_fmt = CTRLDESCL0_YUV_FORMAT_UY2VY1;
> +		break;
> +	case DRM_FORMAT_UYVY:
> +		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
> +		yuv_fmt = CTRLDESCL0_YUV_FORMAT_Y2VY1U;
> +		break;
> +	case DRM_FORMAT_VYUY:
> +		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
> +		yuv_fmt = CTRLDESCL0_YUV_FORMAT_Y2UY1V;
> +		break;
> +
> +	default:
> +		dev_err(dcif->drm.dev, "Unknown pixel format 0x%x\n", fb->format->format);
> +		break;
> +	}
> +
> +	if (plane->type == DRM_PLANE_TYPE_OVERLAY && yuv_fmt == CTRLDESCL0_YUV_FORMAT_Y2UY1V) {
> +		dev_err(dcif->drm.dev, "Overlay plane could not support YUV format\n");
> +		return;
> +	}
> +
> +	reg = DCIF_CTRLDESC0_EN | DCIF_CTRLDESC0_SHADOW_LOAD_EN |
> +	      DCIF_CTRLDESC0_FORMAT(layer_fmt) | DCIF_CTRLDESC0_YUV_FORMAT(yuv_fmt);
> +
> +	/* Alpha */
> +	reg |= DCIF_CTRLDESC0_GLOBAL_ALPHA(new_state->alpha >> 8) | ALPHA_GLOBAL;
> +
> +	regmap_write(dcif->regmap, DCIF_CTRLDESC0(layer_id), reg);
> +}
> +
> +static void dcif_overlay_plane_atomic_disable(struct drm_plane *plane,
> +					      struct drm_atomic_state *state)
> +{
> +	struct dcif_dev *dcif = plane_to_dcif_dev(plane);
> +
> +	regmap_update_bits(dcif->regmap, DCIF_CTRLDESC0(1),
> +			   DCIF_CTRLDESC0_EN | DCIF_CTRLDESC0_SHADOW_LOAD_EN,
> +			   DCIF_CTRLDESC0_SHADOW_LOAD_EN);
> +}
> +
> +static const struct drm_plane_helper_funcs dcif_primary_plane_helper_funcs = {
> +	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
> +	.atomic_check	= dcif_plane_atomic_check,
> +	.atomic_update	= dcif_plane_atomic_update,
> +};
> +
> +static const struct drm_plane_helper_funcs dcif_overlay_plane_helper_funcs = {
> +	.atomic_check	= dcif_plane_atomic_check,
> +	.atomic_update	= dcif_plane_atomic_update,
> +	.atomic_disable = dcif_overlay_plane_atomic_disable,
> +};
> +
> +static const struct drm_plane_funcs dcif_plane_funcs = {
> +	.update_plane		= drm_atomic_helper_update_plane,
> +	.disable_plane		= drm_atomic_helper_disable_plane,
> +	.destroy		= drm_plane_cleanup,
> +	.reset			= drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> +};
> +
> +int dcif_plane_init(struct dcif_dev *dcif)
> +{
> +	const u32 supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
> +					BIT(DRM_COLOR_YCBCR_BT709) |
> +					BIT(DRM_COLOR_YCBCR_BT2020);
> +	const u32 supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +				     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
> +	int ret;
> +
> +	/* primary plane */
> +	drm_plane_helper_add(&dcif->planes.primary, &dcif_primary_plane_helper_funcs);
> +	ret = drm_universal_plane_init(&dcif->drm, &dcif->planes.primary, 1, &dcif_plane_funcs,
> +				       dcif_primary_plane_formats,
> +				       ARRAY_SIZE(dcif_primary_plane_formats), NULL,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret) {
> +		drm_err(&dcif->drm, "failed to initialize primary plane: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = drm_plane_create_color_properties(&dcif->planes.primary, supported_encodings,
> +						supported_ranges, DRM_COLOR_YCBCR_BT601,
> +						DRM_COLOR_YCBCR_LIMITED_RANGE);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_plane_create_alpha_property(&dcif->planes.primary);
> +	if (ret)
> +		return ret;
> +
> +	/* overlay plane */
> +	drm_plane_helper_add(&dcif->planes.overlay, &dcif_overlay_plane_helper_funcs);
> +	ret = drm_universal_plane_init(&dcif->drm, &dcif->planes.overlay, 1, &dcif_plane_funcs,
> +				       dcif_overlay_plane_formats,
> +				       ARRAY_SIZE(dcif_overlay_plane_formats), NULL,
> +				       DRM_PLANE_TYPE_OVERLAY, NULL);
> +	if (ret) {
> +		drm_err(&dcif->drm, "failed to initialize overlay plane: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return drm_plane_create_alpha_property(&dcif->planes.overlay);
> +}
> diff --git a/drivers/gpu/drm/imx/dcif/dcif-reg.h b/drivers/gpu/drm/imx/dcif/dcif-reg.h
> new file mode 100644
> index 0000000000000..f918bbb6d2d15
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/dcif-reg.h
> @@ -0,0 +1,266 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * Copyright 2025 NXP
> + */
> +#ifndef __DCIF_REG_H__
> +#define __DCIF_REG_H__
> +
> +#include <linux/bits.h>
> +
> +/* Version ID Register */
> +#define DCIF_VER				0x0
> +#define   DCIF_VER_GET_FEATURE(x)		FIELD_GET(GENMASK(15, 0), x)
> +#define   DCIF_VER_GET_MINOR(x)			FIELD_GET(GENMASK(23, 16), x)
> +#define   DCIF_VER_GET_MAJOR(x)			FIELD_GET(GENMASK(31, 24), x)
> +
> +/* Parameter Registers */
> +#define DCIF_PAR_0				0x4
> +#define   DCIF_PAR_0_LAYER_NUM(x)		FIELD_PREP(GENMASK(3, 0), x)
> +#define   DCIF_PAR_0_DOMAIN_NUM(x)		FIELD_PREP(GENMASK(5, 4), x)
> +#define   DCIF_PAR_0_AXI_DATA_WIDTH(x)		FIELD_PREP(GENMASK(7, 6), x)
> +#define   DCIF_PAR_0_CLUT_RAM_NUM(x)		FIELD_PREP(GENMASK(11, 8), x)
> +#define   DCIF_PAR_0_CSC_NUM(x)			FIELD_PREP(GENMASK(13, 12), x)
> +#define   DCIF_PAR_0_CRC_REGION_NUM(x)		FIELD_PREP(GENMASK(18, 16), x)
> +#define   DCIF_PAR_0_BACKUP(x)			FIELD_PREP(GENMASK(31, 28), x)
> +
> +#define DCIF_PAR_1				0x8
> +#define   DCIF_PAR_1_LAYER0_FIFO_SIZE(x)	FIELD_PREP(GENMASK(3, 0), x)
> +#define   DCIF_PAR_1_LAYER1_FIFO_SIZE(x)	FIELD_PREP(GENMASK(7, 4), x)
> +
> +/* Display Control and Parameter Registers */
> +#define DCIF_DISP_CTRL				0x10
> +#define   DCIF_DISP_CTRL_DISP_ON		BIT(0)
> +#define   DCIF_DISP_CTRL_AXI_RD_HOLD		BIT(30)
> +#define   DCIF_DISP_CTRL_SW_RST			BIT(31)
> +#define DCIF_DISP_PAR				0x14
> +#define   DCIF_DISP_PAR_BGND_B(x)		FIELD_PREP(GENMASK(7, 0), x)
> +#define   DCIF_DISP_PAR_BGND_G(x)		FIELD_PREP(GENMASK(15, 8), x)
> +#define   DCIF_DISP_PAR_BGND_R(x)		FIELD_PREP(GENMASK(23, 16), x)
> +#define DCIF_DISP_SIZE				0x18
> +#define   DCIF_DISP_SIZE_DISP_WIDTH(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_DISP_SIZE_DISP_HEIGHT(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* Display Status Registers */
> +#define DCIF_DISP_SR0				0x1C
> +#define   DCIF_DISP_SR0_AXI_RD_PEND(x)		FIELD_PREP(GENMASK(4, 0), x)
> +#define   DCIF_DISP_SR0_DPI_BUSY(x)		FIELD_PREP(GENMASK(14, 14), x)
> +#define   DCIF_DISP_SR0_AXI_RD_BUSY(x)		FIELD_PREP(GENMASK(15, 15), x)
> +#define DCIF_DISP_SR0_TXFIFO_CNT(x)		FIELD_PREP(GENMASK(23, 16), x)
> +
> +#define DCIF_DISP_SR1				0x20
> +#define   DCIF_DISP_SR1_H_CNT(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_DISP_SR1_V_CNT(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* Interrupt Enable and Status Registers, n=0-2*/
> +#define DCIF_IE0(n)				(0x24 + (n) * 0x10000)
> +#define DCIF_IS0(n)				(0x28 + (n) * 0x10000)
> +#define   DCIF_INT0_VSYNC			BIT(0)
> +#define   DCIF_INT0_UNDERRUN			BIT(1)
> +#define   DCIF_INT0_VS_BLANK			BIT(2)
> +#define   DCIF_INT0_HIST_DONE			BIT(5)
> +#define   DCIF_INT0_CRC_ERR			BIT(6)
> +#define   DCIF_INT0_CRC_ERR_SAT			BIT(7)
> +
> +#define DCIF_IE1(n)				(0x2C + (n) * 0x10000)
> +#define DCIF_IS1(n)				(0x30 + (n) * 0x10000)
> +#define   DCIF_INT1_FIFO_PANIC0			BIT(0)
> +#define   DCIF_INT1_FIFO_PANIC1			BIT(1)
> +#define   DCIF_INT1_DMA_ERR0			BIT(8)
> +#define   DCIF_INT1_DMA_ERR1			BIT(9)
> +#define   DCIF_INT1_DMA_DONE0			BIT(16)
> +#define   DCIF_INT1_DMA_DONE1			BIT(17)
> +#define   DCIF_INT1_FIFO_EMPTY0			BIT(24)
> +#define   DCIF_INT1_FIFO_EMPTY1			BIT(25)
> +
> +/* DPI Control and Sync Parameter Registers */
> +#define DCIF_DPI_CTRL				0x40
> +#define   DCIF_DPI_CTRL_HSYNC_POL_LOW		BIT(0)
> +#define   DCIF_DPI_CTRL_VSYNC_POL_LOW		BIT(1)
> +#define   DCIF_DPI_CTRL_DE_POL_LOW		BIT(2)
> +#define   DCIF_DPI_CTRL_PCLK_EDGE_FALLING	BIT(3)
> +#define   DCIF_DPI_CTRL_POL_MASK		GENMASK(3, 0)
> +#define   DCIF_DPI_CTRL_DATA_INV(x)		FIELD_PREP(GENMASK(4, 4), x)
> +#define   DCIF_DPI_CTRL_DEF_BGND_EN(x)		FIELD_PREP(GENMASK(5, 5), x)
> +#define   DCIF_DPI_CTRL_FETCH_OPT(x)		FIELD_PREP(GENMASK(9, 8), x)
> +#define   DCIF_DPI_CTRL_DISP_MODE(x)		FIELD_PREP(GENMASK(13, 12), x)
> +#define   DCIF_DPI_CTRL_DATA_PATTERN_MASK	GENMASK(18, 16)
> +#define   DCIF_DPI_CTRL_DATA_PATTERN(x)		FIELD_PREP(GENMASK(18, 16), x)
> +#define   PATTERN_RGB888			0
> +#define   PATTERN_RBG888			1
> +#define   PATTERN_GBR888			2
> +#define   PATTERN_GRB888			3
> +#define   PATTERN_BRG888			4
> +#define   PATTERN_BGR888			5
> +#define   PATTERN_RGB555			6
> +#define   PATTERN_RGB565			7
> +
> +#define DCIF_DPI_HSYN_PAR			0x44
> +#define   DCIF_DPI_HSYN_PAR_FP_H(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_DPI_HSYN_PAR_BP_H(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +#define DCIF_DPI_VSYN_PAR			0x48
> +#define   DCIF_DPI_VSYN_PAR_FP_V(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_DPI_VSYN_PAR_BP_V(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +#define DCIF_DPI_VSYN_HSYN_WIDTH		0x4C
> +#define   DCIF_DPI_VSYN_HSYN_WIDTH_PW_H(x)	FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_DPI_VSYN_HSYN_WIDTH_PW_V(x)	FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* Control Descriptor Registers, n=0-1*/
> +#define DCIF_CTRLDESC0(n)			(0x10000 + (n) * 0x10000)
> +#define   DCIF_CTRLDESC0_AB_MODE(x)		FIELD_PREP(GENMASK(1, 0), x)
> +#define   ALPHA_EMBEDDED			0
> +#define   ALPHA_GLOBAL				1
> +#define   DCIF_CTRLDESC0_YUV_FORMAT_MASK	GENMASK(15, 14)
> +#define   DCIF_CTRLDESC0_YUV_FORMAT(x)		FIELD_PREP(GENMASK(15, 14), x)
> +#define   CTRLDESCL0_YUV_FORMAT_Y2VY1U		0x0
> +#define   CTRLDESCL0_YUV_FORMAT_Y2UY1V		0x1
> +#define   CTRLDESCL0_YUV_FORMAT_VY2UY1		0x2
> +#define   CTRLDESCL0_YUV_FORMAT_UY2VY1		0x3
> +#define   DCIF_CTRLDESC0_GLOBAL_ALPHA(x)	FIELD_PREP(GENMASK(23, 16), x)
> +#define   DCIF_CTRLDESC0_FORMAT_MASK		GENMASK(27, 24)
> +#define   DCIF_CTRLDESC0_FORMAT(x)		FIELD_PREP(GENMASK(27, 24), x)
> +#define   CTRLDESCL0_FORMAT_RGB565		0x4
> +#define   CTRLDESCL0_FORMAT_ARGB1555		0x5
> +#define   CTRLDESCL0_FORMAT_ARGB4444		0x6
> +#define   CTRLDESCL0_FORMAT_YCBCR422		0x7
> +#define   CTRLDESCL0_FORMAT_RGB888		0x8
> +#define   CTRLDESCL0_FORMAT_ARGB8888		0x9
> +#define   CTRLDESCL0_FORMAT_ABGR8888		0xa
> +#define   DCIF_CTRLDESC0_SHADOW_LOAD_EN		BIT(30)
> +#define   DCIF_CTRLDESC0_EN			BIT(31)
> +
> +#define DCIF_CTRLDESC1(n)			(0x10004 + (n) * 0x10000)
> +#define   DCIF_CTRLDESC1_POSX(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_CTRLDESC1_POSY(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +#define DCIF_CTRLDESC2(n)			(0x10008 + (n) * 0x10000)
> +#define   DCIF_CTRLDESC2_WIDTH(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_CTRLDESC2_HEIGHT(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +#define DCIF_CTRLDESC3(n)			(0x1000C + (n) * 0x10000)
> +#define   DCIF_CTRLDESC3_PITCH(x)		FIELD_PREP(GENMASK(15, 0), x)
> +#define   DCIF_CTRLDESC3_T_SIZE(x)		FIELD_PREP(GENMASK(17, 16), x)
> +#define   DCIF_CTRLDESC3_P_SIZE(x)		FIELD_PREP(GENMASK(22, 20), x)
> +
> +#define DCIF_CTRLDESC4(n)			(0x10010 + (n) * 0x10000)
> +#define   DCIF_CTRLDESC4_ADDR(x)		FIELD_PREP(GENMASK(31, 0), x)
> +
> +#define DCIF_CTRLDESC5(n)			(0x10014 + (n) * 0x10000)
> +#define DCIF_CTRLDESC6(n)			(0x10018 + (n) * 0x10000)
> +#define   DCIF_CTRLDESC6_BCLR_B(x)		FIELD_PREP(GENMASK(7, 0), x)
> +#define   DCIF_CTRLDESC6_BCLR_G(x)		FIELD_PREP(GENMASK(15, 8), x)
> +#define   DCIF_CTRLDESC6_BCLR_R(x)		FIELD_PREP(GENMASK(23, 16), x)
> +#define   DCIF_CTRLDESC6_BCLR_A(x)		FIELD_PREP(GENMASK(31, 24), x)
> +
> +/* CLUT control Register */
> +#define DCIF_CLUT_CTRL				0x1003C
> +#define   DCIF_CLUT_CTRL_CLUT0_SEL(x)		FIELD_PREP(GENMASK(0, 0), x)
> +#define   DCIF_CLUT_CTRL_CLUT1_SEL(x)		FIELD_PREP(GENMASK(3, 3), x)
> +#define   DCIF_CLUT_CTRL_CLUT_MUX(x)		FIELD_PREP(GENMASK(29, 28), x)
> +#define   DCIF_CLUT_CTRL_CLUT_SHADOW_LOAD_EN(x)	FIELD_PREP(GENMASK(31, 31), x)
> +
> +/* FIFO Panic Threshold Register, n=0-1 */
> +#define DCIF_PANIC_THRES(n)			(0x10040 + (n) * 0x10000)
> +#define   DCIF_PANIC_THRES_LOW_MASK		GENMASK(11, 0)
> +#define   DCIF_PANIC_THRES_LOW(x)		FIELD_PREP(GENMASK(11, 00), x)
> +#define   DCIF_PANIC_THRES_HIGH_MASK		GENMASK(27, 16)
> +#define   DCIF_PANIC_THRES_HIGH(x)		FIELD_PREP(GENMASK(27, 16), x)
> +#define   DCIF_PANIC_THRES_REQ_EN		BIT(31)
> +#define   PANIC0_THRES_MAX			511
> +
> +/* Layer Status Register 0, n=0-1 */
> +#define DCIF_LAYER_SR0(n)			(0x10044 + (n) * 0x10000)
> +#define   DCIF_LAYER_SR0_L0_FIFO_CNT_MASK	GENMASK(9, 0)
> +#define   DCIF_LAYER_SR0_L0_FIFO_CNT(x)		FIELD_PREP(GENMASK(9, 0), x)
> +
> +/* Color Space Conversion Control and Coefficient Registers for Layer 0 */
> +#define DCIF_CSC_CTRL_L0			0x10050
> +#define   DCIF_CSC_CTRL_L0_CSC_EN		BIT(0)
> +#define   DCIF_CSC_CTRL_L0_CSC_MODE_YCBCR2RGB	BIT(1)
> +
> +#define DCIF_CSC_COEF0_L0			0x10054
> +#define   DCIF_CSC_COEF0_L0_A1(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define   DCIF_CSC_COEF0_L0_A2(x)		FIELD_PREP_CONST(GENMASK(26, 16), x)
> +
> +#define DCIF_CSC_COEF1_L0			0x10058
> +#define   DCIF_CSC_COEF1_L0_A3(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define   DCIF_CSC_COEF1_L0_B1(x)		FIELD_PREP_CONST(GENMASK(26, 16), x)
> +
> +#define DCIF_CSC_COEF2_L0			0x1005C
> +#define   DCIF_CSC_COEF2_L0_B2(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define   DCIF_CSC_COEF2_L0_B3(x)		FIELD_PREP_CONST(GENMASK(26, 16), x)
> +
> +#define DCIF_CSC_COEF3_L0			0x10060
> +#define   DCIF_CSC_COEF3_L0_C1(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define   DCIF_CSC_COEF3_L0_C2(x)		FIELD_PREP_CONST(GENMASK(26, 16), x)
> +
> +#define DCIF_CSC_COEF4_L0			0x10064
> +#define   DCIF_CSC_COEF4_L0_C3(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define   DCIF_CSC_COEF4_L0_D1(x)		FIELD_PREP_CONST(GENMASK(24, 16), x)
> +
> +#define DCIF_CSC_COEF5_L0			0x10068
> +#define   DCIF_CSC_COEF5_L0_D2(x)		FIELD_PREP_CONST(GENMASK(8, 0), x)
> +#define   DCIF_CSC_COEF5_L0_D3(x)		FIELD_PREP_CONST(GENMASK(24, 16), x)
> +
> +/* CRC Control, Threshold, and Histogram Coefficient Registers */
> +#define DCIF_CRC_CTRL				0x20100
> +#define   DCIF_CRC_CTRL_CRC_EN(x)		(1 << (x))
> +#define   DCIF_CRC_CTRL_HIST_REGION_SEL(x)	FIELD_PREP(GENMASK(17, 16), x)
> +#define   DCIF_CRC_CTRL_HIST_MODE		BIT(21)
> +#define   DCIF_CRC_CTRL_HIST_TRIG		BIT(22)
> +#define   DCIF_CRC_CTRL_HIST_EN			BIT(23)
> +#define   DCIF_CRC_CTRL_CRC_MODE		BIT(28)
> +#define   DCIF_CRC_CTRL_CRC_TRIG		BIT(29)
> +#define   DCIF_CRC_CTRL_CRC_ERR_CNT_RST		BIT(30)
> +#define   DCIF_CRC_CTRL_CRC_SHADOW_LOAD_EN	BIT(31)
> +
> +#define DCIF_CRC_THRES				0x20104
> +#define   DCIF_CRC_THRES_CRC_THRESHOLD_MASK	GENMASK(31, 0)
> +#define   DCIF_CRC_THRES_CRC_THRESHOLD(x)	FIELD_PREP(GENMASK(31, 0), x)
> +
> +#define DCIF_CRC_HIST_COEF			0x20108
> +#define   DCIF_CRC_HIST_COEF_HIST_WB_MASK	GENMASK(7, 0)
> +#define   DCIF_CRC_HIST_COEF_HIST_WB(x)		FIELD_PREP(GENMASK(7, 0), x)
> +#define   DCIF_CRC_HIST_COEF_HIST_WG_MASK	GENMASK(15, 8)
> +#define   DCIF_CRC_HIST_COEF_HIST_WG(x)		FIELD_PREP(GENMASK(15, 8), x)
> +#define   DCIF_CRC_HIST_COEF_HIST_WR_MASK	GENMASK(23, 16)
> +#define   DCIF_CRC_HIST_COEF_HIST_WR(x)		FIELD_PREP(GENMASK(23, 16), x)
> +
> +#define DCIF_CRC_ERR_CNT			0x2010C
> +#define   DCIF_CRC_ERR_CNT_CRC_ERR_CNT_MASK	GENMASK(31, 0)
> +#define   DCIF_CRC_ERR_CNT_CRC_ERR_CNT(x)	FIELD_PREP(GENMASK(31, 0), x)
> +
> +#define DCIF_CRC_SR				0x20110
> +#define   DCIF_CRC_SR_HIST_CNT_SAT_MASK		BIT(13)
> +#define   DCIF_CRC_SR_HIST_CNT_SAT(x)		FIELD_PREP(GENMASK(13, 13), x)
> +#define   DCIF_CRC_SR_HIST_SAT_MASK		BIT(14)
> +#define   DCIF_CRC_SR_HIST_SAT(x)		FIELD_PREP(GENMASK(14, 14), x)
> +#define   DCIF_CRC_SR_HIST_BUSY_MASK		BIT(15)
> +#define   DCIF_CRC_SR_HIST_BUSY(x)		FIELD_PREP(GENMASK(15, 15), x)
> +#define   DCIF_CRC_SR_CRC_STATUS_MASK		BIT(31)
> +#define   DCIF_CRC_SR_CRC_STATUS(x)		FIELD_PREP(GENMASK(31, 31), x)
> +
> +#define DCIF_CRC_HIST_CNT_B(n)			(0x20114 + (n) * 4)
> +#define   DCIF_B_BIN_CNT_MASK			GENMASK(20, 0)
> +#define   DCIF_B_BIN_CNT(x)			FIELD_PREP(GENMASK(20, 0), x)
> +
> +/* CRC Region Position, Size, Value, and Expected Value Registers, n=0-3 */
> +#define DCIF_CRC_POS_R(n)			(0x20214 + (n) * 0x10)
> +#define   DCIF_CRC_POS_CRC_HOR_POS(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_CRC_POS_CRC_VER_POS(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +#define DCIF_CRC_SIZE_R(n)			(0x20218 + (n) * 0x10)
> +#define   DCIF_CRC_SIZE_CRC_HOR_SIZE(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define   DCIF_CRC_SIZE_CRC_VER_SIZE(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +#define DCIF_CRC_VAL_R(n)			(0x2021C + (n) * 0x10)
> +#define   DCIF_CRC_VAL_CRC_VAL_MASK		GENMASK(31, 0)
> +#define   DCIF_CRC_VAL_CRC_VAL(x)		FIELD_PREP(GENMASK(31, 0), x)
> +
> +#define DCIF_CRC_EXP_VAL_R(n)			(0x20220 + (n) * 0x10)
> +#define   DCIF_CRC_EXP_VAL_CRC_EXP_VAL_MASK	GENMASK(31, 0)
> +#define   DCIF_CRC_EXP_VAL_CRC_EXP_VAL(x)	FIELD_PREP(GENMASK(31, 0), x)
> +
> +#endif /* __DCIF_REG_H__ */
> --
> 2.49.0
>
