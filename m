Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D34945F2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 04:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C0C10E293;
	Thu, 20 Jan 2022 03:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD2210E1A4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:00:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpAYGNNXJa2DBFwcTU6iJi+RGIaD5w3i43HzHgzV/RHofnzzT00VTanYIywpyQMfagP4eE6Penta5mb8rANpX+UVdAoQ/v448jlXyCkRJQ8GJ8joaceEXBVWfUjUiZeeUoFhTVCyorNy4IftWlZjh07OFls9YzJ4VfQuIATNEnc2PVfEvQj1K0WK9Qpjrm8+7ZtdvssO9b2QJXYNG6q1RSDHfSifwXtMa1cfHni3iZ8qyH2XbR1tjdUNpPXNc94SMZhb+mbjDh4uUtFI8PrdKVfTwgK1NVSjpr5hw8k3AuyboMKQuFgiHKicHOs2AJAFXdPyu3ywNEcqxapYUhC0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMj01ajPBpWx5ev/RK2eW2F8kMpzQRF9eeP/VR0CHgo=;
 b=ROldc1bUNr+1kArgkRrQbu6P7J335ySgria/ZK7FL95anPxlY3fxVOUiRHGB4Hqn1j/NdmfklF4CjW1DMJKZBaUfrING9CTVwtuwX9rRbJfKEshnjwN4L5iVDwFpMCn0WAj6vkLZthMV/RyrZ5QgZ1XQ0n7YUEehCdTe0NTjBsPWPKe7j8d0NnrOuLdNZzVgTwq+JV5W9HHMybFJnhuRKA/M0uyKGqf62xXniCIbNAIpOvo141ly7nBjZaCLdzQ2DelrV4HzrGFQyF93PW/nQ5iJQE+eqAcYHNiIxt25TZOPzG6ybEvHW/T/D13qAOHz1oT3YQ0LfZyPOYh2/XBymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMj01ajPBpWx5ev/RK2eW2F8kMpzQRF9eeP/VR0CHgo=;
 b=SKge1wAHB9n2uF2ltIPsTlYSjp7/+paUEyQ/HEU3GCsLmZbP+HHM8pjGRxfidZ8jBOzE9enQC4qWL81NytwbubwTVnjjoTFjC/YLU+K80g6HWtE5lKHQZ+puZpWxFJiVF1f2KMfLlgDVglft2OV0QCaXf3OaVApyu5rwv4RhlSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB5552.eurprd04.prod.outlook.com (2603:10a6:803:cc::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 03:00:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc%3]) with mapi id 15.20.4909.008; Thu, 20 Jan 2022
 03:00:40 +0000
Message-ID: <c371d737fd5e7e19e966d7aec42da0c3edd9a556.camel@nxp.com>
Subject: Re: [PATCH v2] phy: dphy: Correct clk_pre parameter
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, Wyon
 Bi <bivvy.bi@rock-chips.com>
Date: Thu, 20 Jan 2022 11:00:26 +0800
In-Reply-To: <20220119023714.1498508-1-victor.liu@nxp.com>
References: <20220119023714.1498508-1-victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30b5a95d-1779-4dfd-c3ca-08d9dbc10aa6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5552:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB555202E741AFA686BB9CF2F6985A9@VI1PR04MB5552.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EK9DhlgfONIb7eclMLHGtH/hBfkNKrAaKPDxUCCCQ9cyqdGkBKMcsTZcKE+58V8uzFBL3EYXyuWlAEbhhu976+LDqix0X+zJOtywtMgDVSau+h8AvNTvqXDYRYYFYhmpUMZaXaX3usfQihl1+4m+1J5fNfBVbKWS8VYmJlJpBGDiNlXGFWrD8UVIKPpiRDd7sx9gY8Ws/vUlIwTqGI2QCsvF1ndhsrIkgazU9ZY8rmvB8cEofD7eJRhCikXX7hukbKgd6H7hVqMdLAs28QNxGoqE01ZXPKkevDGxwBDdYJ0HYsbwz6yFeFC3bJ+MHcFmcxPm13+P3nynTtRMNxurrUimETPrfFk57ZV/bcM2EUP69Zl207JmUPBRhOAJDcPe3sCZwSkBOMyiS3AxzEvFWMHt2Hi4GAxnDITlGXkvT4xwc0xPZTVLTDpZspomW1du6BcCcDzFigmpWkIu/Ed3uJiMf8QQDtZIpbDL566k8Hw/gc/FaaiUFBe7B8FJW+/pcg49ejCr3z9o2WvMLKqibQWqcm0cfL+wyYJKMdJFtGdcce23DkAsoCCop/o99eZEYAvCr+hgD1DEpDlLgxInlfI6UBi2BIN6rUYDhGpP4BsxBTP6PShoG1Su9cVYM4mS6MuWT25IkNSypasdyC7FwsbnjJDJ9ixelAA7pE19Sk6gGeJ7cD5B1GhHK3rLtC+QOkgzi6Xnp2Yixw6JYSO7Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(5660300002)(86362001)(316002)(38350700002)(54906003)(6512007)(66556008)(66946007)(6486002)(4326008)(66476007)(2906002)(6506007)(8676002)(83380400001)(6916009)(186003)(52116002)(8936002)(36756003)(26005)(7416002)(508600001)(6666004)(66574015)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWd1OUlDY0xFNDQzdTdRMjE1OERkTGVPaHZRaDJ1OWhWbVY4VU42YzQrc2tR?=
 =?utf-8?B?V3cyTThRNVlEUW5YQXcwMlVqK3ZMeHNJdU4vVzJKUllhUHJNUURMN2tiWTQ1?=
 =?utf-8?B?S05iTDFJMGhFc0ZHZ1pnQXRVdHhXeUROUmZVN25xcUlRd0hKOEdIMTEycU9o?=
 =?utf-8?B?SkF0YVVQSjNIQVowQWtTMDdUVnVPV3lsemhxRHdaVm9wVk5TRUlCMVlqdXF4?=
 =?utf-8?B?bmtUR2hWemRqd1lWR1laRXFFTEFiMDRmRnRlTjF3S3RpMVEwSlJzS21tRWRr?=
 =?utf-8?B?eGZIMzdyNFppYUU2T1NjeXN3cmQweWFrNWZXV2gxK1lBbmtla0V2LzRnYTJZ?=
 =?utf-8?B?RHg1MldZS2hEWk9GTjkzRWZIZm1LYkN6WXpiT2E3YjNUZEpLQjlXcVZ4RW15?=
 =?utf-8?B?d0kxTDhudE5MTFBUTmk2MC8yb0dvNEp1ajhET2RBcW5qRWV6c0twMUR1bVFE?=
 =?utf-8?B?MkR6SVp3OEpYNGJ5RDZjeVI0SURjSUxvWjdmbGNsb3E5d0haTEdROHptTDNW?=
 =?utf-8?B?Mk9oTkZNdXpxbXM0ZDlCRXZMa3RpRkhKNTdWcFRNNENwNW5XemNPcW9OWFU4?=
 =?utf-8?B?NkxJcXR0UFFoTzhPcmJ1MnpNYVBCemZKOFFDTW5mVExsMW5lZ1RMOFhYdi9R?=
 =?utf-8?B?OUNXZFJmUWQ2cFpZWXNVQmttVjJiU2oyRExYcFdaRHZILzBzVklrZGNjWVRQ?=
 =?utf-8?B?dHBFRndtMUN0aWhyZ2NlaTI2OE5EMFQyMFl1YlI4ZVRrdkVWUmlPSHB2QjFt?=
 =?utf-8?B?U2lrbVlxcnBrQU9hRk4wZmE1eDZ2TXpVK2lBUHpCS2k1ODZHTUhuT3U0eWQ5?=
 =?utf-8?B?WFdjUEZnSXFlZVZrdCtWUTVDV3kzRVBxeDBIc0pnNHljQkhzcVhjakljSC9C?=
 =?utf-8?B?NEVhVE5FcFpFV2V6dEdiQWlJMks0NE14SHB5SXNGR3FNRWJUbHFVeWFOa25E?=
 =?utf-8?B?NW9OQ1lyOE1uU2orTTU4bkFURG5ZYU1BZUQ3aEJYVTNZOC9Qak40YkROTUsy?=
 =?utf-8?B?S2dIY25hSGRRM08yWkxjRVBlMGVMTFNYTm1wRXNQTG1PVmJmcVV3TnlOY01R?=
 =?utf-8?B?bzFRV2VnQ0JKdHUxdG55YkpNelQveTFTNTMwdWplUUtSTTN5R01DTzdadHZB?=
 =?utf-8?B?VzZLTjF0czRtQXpyVjAzb1BPM2FDQ29pLzFzYmRzd0Z5WGpOd1dKQ3pMY2cr?=
 =?utf-8?B?MWpZcml3b1JQL3llc0YrQnd3QWl5akNNSUNIQnJ5ZHNldVFLbkxqK2RETDhO?=
 =?utf-8?B?MTcwUkJFZE1DSHc1bnBPVVBPUU9BYzNSWkh6N09rcmhKblpnZDEyTC9zUFhB?=
 =?utf-8?B?eEFZbU5YSlZxNFl4aVpVZXVJWnJ2SmRwY09MUTVPRnUyNUZ6bTZKdzg0Nkwz?=
 =?utf-8?B?T3duU200N1dyK3pLemhwRkorYkhjVzJXVVc0L1pEWjBUUkNPbEVOSUJnby8v?=
 =?utf-8?B?RmVrQnZQL1E0SjM5bE5KRnNzTE9wZks5OUhlengvN2phajZwQm1XejFDRVEy?=
 =?utf-8?B?Q3JkeDZuY0prNk1xNmV1eE1sYWNsbUxJR1JkU1pUdkVtbWFoRDBXR0Q4aXY5?=
 =?utf-8?B?aWJFRjVrNUlRNWRJZXdxdGFtWlRxN2ZmZ3NNV3VGamx2akpubEFhQXdQRjkx?=
 =?utf-8?B?bTBkVVAzbjV6RkpYS1dISWMvenJmVU83aEVQR0VPb09NR2x6N0NXRGt6aCtK?=
 =?utf-8?B?ei9nWHJBNzJWSGlCY0tmMUZjRkF5NU11VGhyZll4K0FGazhPRXcvVVRwTkF2?=
 =?utf-8?B?aXV2SjZBYTl6cU1XNE9BN2Y2cVh5QXBwT2VXemFuMVQ2UTZmOUxZN3ZMVkIv?=
 =?utf-8?B?YVU5YUNCU1dnTXdVMjlGTVBqa213TTVkdjZyVXVFVW1YeGxDRG0yWURSM1dj?=
 =?utf-8?B?WHNJalhOZEcvenBQVm0vOUQzWVNGUmxYN2ZwVkoyUUtyL21CdmJMb3VsRnBN?=
 =?utf-8?B?MzM2anZoR3FIM3Z4U0F1TXpLdTByVUJYNUNjb1NSQVNmWHNRZFdObDl2a0E1?=
 =?utf-8?B?cjJaOGdiTFl1YWIraHJUSDFMTWpyNEpyTkFtUnhpbXVySTVCNjIvclB1QWI3?=
 =?utf-8?B?VUIvOE85R293U1E5N2RyRzdLWHp1UmZEbTU2L2k1clR4NmFiR3lhT3pDem45?=
 =?utf-8?B?MmpmN3dBMGFHc2F6VitHTGtUdG1Hb1NLMjVjN1JOZG0xWS9ydWpOR2VJSFcz?=
 =?utf-8?Q?FiTd4RprR/iJlSDTLa318l0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b5a95d-1779-4dfd-c3ca-08d9dbc10aa6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 03:00:40.6475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVC95ur+6RwNLWgenzfAg59/vx3uVGx4G5B5HdVbyUNWINjupT+S1n29o7DaUq744grDxAZGXuOKhzeUndOevQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5552
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko, Wyon,

On Wed, 2022-01-19 at 10:37 +0800, Liu Ying wrote:
> The D-PHY specification (v1.2) explicitly mentions that the T-CLK-PRE
> parameter's unit is Unit Interval(UI) and the minimum value is 8.  Also,
> kernel doc of the 'clk_pre' member of struct phy_configure_opts_mipi_dphy
> mentions that it should be in UI.  However, the dphy core driver wrongly
> sets 'clk_pre' to 8000, which seems to hint that it's in picoseconds.
> And, the kernel doc of the 'clk_pre' member wrongly says the minimum value
> is '8 UI', instead of 8.
> 
> So, let's fix both the dphy core driver and the kernel doc of the 'clk_pre'
> member to correctly reflect the T-CLK-PRE parameter's unit and the minimum
> value according to the D-PHY specification.
> 
> I'm assuming that all impacted custom drivers shall program values in
> TxByteClkHS cycles into hardware for the T-CLK-PRE parameter.  The D-PHY
> specification mentions that the frequency of TxByteClkHS is exactly 1/8
> the High-Speed(HS) bit rate(each HS bit consumes one UI).  So, relevant
> custom driver code is changed to program those values as
> DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE), then.
> 
> Note that I've only tested the patch with RM67191 DSI panel on i.MX8mq EVK.
> Help is needed to test with other i.MX8mq, Meson and Rockchip platforms,
> as I don't have the hardwares.
> 
> Fixes: 2ed869990e14 ("phy: Add MIPI D-PHY configuration options")
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Guido Günther <agx@sigxcpu.org>
> Tested-by: Liu Ying <victor.liu@nxp.com> # RM67191 DSI panel on i.MX8mq EVK
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Use BITS_PER_BYTE macro. (Andrzej)
> * Drop dsi argument from ui2bc() in nwl-dsi.c.
> 
>  drivers/gpu/drm/bridge/nwl-dsi.c                 | 12 +++++-------
>  drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c    |  3 ++-
>  drivers/phy/phy-core-mipi-dphy.c                 |  4 ++--
>  drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c |  3 ++-
>  include/linux/phy/phy-mipi-dphy.h                |  2 +-
>  5 files changed, 12 insertions(+), 12 deletions(-)

[...]

> diff --git a/drivers/phy/phy-core-mipi-dphy.c b/drivers/phy/phy-core-mipi-dphy.c
> index 288c9c67aa74..ccb4045685cd 100644
> --- a/drivers/phy/phy-core-mipi-dphy.c
> +++ b/drivers/phy/phy-core-mipi-dphy.c
> @@ -36,7 +36,7 @@ int phy_mipi_dphy_get_default_config(unsigned long pixel_clock,
>  
>  	cfg->clk_miss = 0;
>  	cfg->clk_post = 60000 + 52 * ui;
> -	cfg->clk_pre = 8000;
> +	cfg->clk_pre = 8;
>  	cfg->clk_prepare = 38000;
>  	cfg->clk_settle = 95000;
>  	cfg->clk_term_en = 0;
> @@ -97,7 +97,7 @@ int phy_mipi_dphy_config_validate(struct phy_configure_opts_mipi_dphy *cfg)
>  	if (cfg->clk_post < (60000 + 52 * ui))
>  		return -EINVAL;
>  
> -	if (cfg->clk_pre < 8000)
> +	if (cfg->clk_pre < 8)
>  		return -EINVAL;
>  
>  	if (cfg->clk_prepare < 38000 || cfg->clk_prepare > 95000)
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> index 347dc79a18c1..630e01b5c19b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> @@ -5,6 +5,7 @@
>   * Author: Wyon Bi <bivvy.bi@rock-chips.com>
>   */
>  
> +#include <linux/bits.h>
>  #include <linux/kernel.h>
>  #include <linux/clk.h>
>  #include <linux/iopoll.h>
> @@ -364,7 +365,7 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
>  	 * The value of counter for HS Tclk-pre
>  	 * Tclk-pre = Tpin_txbyteclkhs * value
>  	 */
> -	clk_pre = DIV_ROUND_UP(cfg->clk_pre, t_txbyteclkhs);
> +	clk_pre = DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE);

For the Rockchip part, can you please give a test? Any comments?

We already have T-b tags on i.MX8mq and Meson platforms.

Regards,
Liu Ying

>  
>  	/*
>  	 * The value of counter for HS Tlpx Time
> diff --git a/include/linux/phy/phy-mipi-dphy.h b/include/linux/phy/phy-mipi-dphy.h
> index a877ffee845d..59a5e77ab409 100644
> --- a/include/linux/phy/phy-mipi-dphy.h
> +++ b/include/linux/phy/phy-mipi-dphy.h
> @@ -42,7 +42,7 @@ struct phy_configure_opts_mipi_dphy {
>  	 * the transmitter prior to any associated Data Lane beginning
>  	 * the transition from LP to HS mode.
>  	 *
> -	 * Minimum value: 8 UI
> +	 * Minimum value: 8
>  	 */
>  	unsigned int		clk_pre;
>  

