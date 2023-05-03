Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1526F5B68
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 17:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F004410E309;
	Wed,  3 May 2023 15:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2109.outbound.protection.outlook.com [40.107.249.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBF710E309
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 15:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy8gHBThQkafBkRZf6I/lcuLFsIhvugk8ZLLLKZnTOpclCTJjS75YYNpY9KpaE43TEPm/nST98x1hpR1V6iTp90lmXDDoxN5CuSCotjSadKQwQ4Wx1bWyGikwAlxRG56Algew1A/Ix4VRM0bLpHcI7eY72y34JtJ27zwabt/oaEUprfEanN2pU37RyE3sZIBVW3q2xxAVAdLEr26rv/UlavSfGVxC51XhY0sRfxPjRQnbCqn4kHWZZFSMEj7ajIrX+b9lbshl67AnCVnoVsRXGe/Fm3e1KTb64TUE+eYNSkZdJ2ogh9urXszUnNoDG3O7a/uQGIswdnbnAPN5nBIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDXVNOLNsQZfg8J0xy47IhFK/gbQ5SDlpTmyhqwh1wo=;
 b=X+HHpF4IkJKO+FiEUzg9Y7wVb18+WRpPVDUCc7gLcdXsAJBKNGqFdIQVJZS6uvNJkc0w4ODYjyxLOokPB2/3shDK1TrlEOGGapAmi/zOmO7QePrOio9ZPw9rfdxuCFLqToR0HhnN7BrJaY+uU6RBljBez4npOOcFnLsOlnET30gsqDigG/vGd/JbxgmEYI22evYg3jqF9C/nN9BcDq7Moe/YNaiOQZpVGWhaQIbyngj5nf9OEJGxc+tvswK4qbHoQoNHhZW4urkWeuIUL5158L378R+8fFXSuaVheUqxusm+BRO6t8dLGzYY63O6/EHsbHQfT2xBBBXgfQTZxqNK3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDXVNOLNsQZfg8J0xy47IhFK/gbQ5SDlpTmyhqwh1wo=;
 b=JKpnDYsc1jGBFJPCTKP2PnkXuDDFwNplUCTjjjp40rC3eda67i5YAF/3Yw//TOadqdRrxVUacA2Sjq/p8XzW+2sJhhBAhvyPSU1fyEYOltmsSteio2UvA2PS+YM1pK6oE5udFkTQ81JBWzdIOYdQR+zmyAh1m56M6uIlb3llBsw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB9PR10MB5258.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 15:39:50 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a%2]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:39:50 +0000
Message-ID: <3f6be15d-24b2-5608-831c-f15cb7d7cdd2@kontron.de>
Date: Wed, 3 May 2023 17:39:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 5/7] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
Content-Language: en-US, de-DE
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230502010759.17282-1-aford173@gmail.com>
 <20230502010759.17282-6-aford173@gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230502010759.17282-6-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::10) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB9PR10MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: 06279892-5743-4ebf-2a6c-08db4beca1ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3uqZewQB/V5rwlAm+atNC8vkQkqsHCvYYFNcv1xrJU3RDefeUpuRMX3mBURjm7Qf6tOIRLMkqBWq09DHbgUx1iozipHMSgJTS+gT9m5jHaroWX52nwo9dRGieaeIM0fo8Lozaz5ozgq1ndDCDltVa62n9idWwai6EjY29+9PRTkRk68Z2Tc6KcNmUUULZc6BwQnVlmIeiM6pyQwqruWvINe3+EgyjCM+dYwSn0Ggnc1q1RiKJFm2z7Ee5I+fgjFfzvkEp/T/R3QO2qnKBP/uO6aO+w1izI5bUub3CLGzajdZakiyFciMAeB9s5SJbatTd4w58DjcFW1z3aBn7pqSkF1wEaX7vP2KcYJ/FpXYELi25tJ0Gf3t+VJMphhylvt+LlNGEMM+5BGkqOKIESZrLMVJaHI+VIMh1KjTCItl0KdIlrEmZSAeNxbiSZNgd+NWDqL8eiUdoUUUUusxbzmVroA4BSuldv01BqMY/iCh4SlAM31MTjqx67FgIRN2csWWrJexO513AMhIzXO21nRyI6AZdTF3NxS6t4GwRYrwmk2ZXBPyKvIkxSU8qLUSFhSL53XTDL8opiHjK7iQCnEYrrkuaC93FzC44A5M+1znyRzTOX05zvMqH/PHMfB21lAyA9rFwIGdfYjewqHEJ32asg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199021)(31686004)(31696002)(86362001)(36756003)(38100700002)(83380400001)(26005)(6486002)(6512007)(54906003)(186003)(2616005)(6666004)(478600001)(53546011)(6506007)(8676002)(41300700001)(66946007)(66476007)(66556008)(4326008)(316002)(8936002)(44832011)(5660300002)(2906002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2FWY0crTW9sVjk1RlBNT1lINFlHTWtCbmhSVCt1S01qYnN6a3o4cEY5bURo?=
 =?utf-8?B?dHI2KzRaUVE5RFl6eEg4R284c2VZblRMTmFLVGZxZVZaVzZDQjF5WlZkMGNK?=
 =?utf-8?B?QzB6T21Hc0w4OHpBYmpBZm9EY1ZHUTJveThhcjlyNTFwMk44Sm1wMXlSaXl1?=
 =?utf-8?B?YWp4ekFoWjk4MDNqeStKSjhGWGtGS0VhbnUxVHZmQkNWWmptK2xSSFNMME9U?=
 =?utf-8?B?bWxTM1hIOUwzWE01eXoxY0pmZzBhbEhGeldJWXFuRVhsYmFOUFh1VUlFZEQz?=
 =?utf-8?B?Qkt5cFpVSnBjQTdEWEh1V3RSdGNsTnlxeUEzUVo3Rko2M1lpejJKc1ZuSUdt?=
 =?utf-8?B?SCtJSjRtdVBBR3ZPdi9MdjdGVVdKaHJkNWlUUHhTd3hyT2FoY2IvNVQvVUYy?=
 =?utf-8?B?S1BmUW5ZZTBGM2wzOGR3ZmtwNVlrb0tjZW8vcW9NMGxYc1ozVGdSV1JicFlv?=
 =?utf-8?B?MTlodEhPSW0wU3laN2tHbXVlR0xUbDk3eURMYkJtOERlOUx5anlrYXo0WnJV?=
 =?utf-8?B?NUc1TXdkUnJLM2VCMUJGSU1FMmxKbm9NVXF3cHFHRFZPOWpMUDdjZ29Tekxa?=
 =?utf-8?B?SGNWTDlYTmFtL0dvQlUzUFc3ZmJqTWlSSGd3b2lEZGRPbmMyaDYwQXh6SVBy?=
 =?utf-8?B?cE1oNGg4djdEQW1jZ1ltUDY2ZURLT3B3WTdRZGw3Q2IzT0VzbjJLR2p5cnJ5?=
 =?utf-8?B?T3dOdDd5d2x5dnFmWkJvQjFJazBtblRkbDJKMWJLUlBuTTJDVG1PZ21IQ1BS?=
 =?utf-8?B?ZzNpOVZsK3JOOWF4N3ExTDVLTnFjL1RYdThWR3hSR2FHb0ZCSk9iV2krMXZW?=
 =?utf-8?B?clhYT09OMWNWZGFkN1hRTDhoeEFiSGV3Tyt0c0ZQS2NRV3l5NVVJVlVDamRU?=
 =?utf-8?B?cERMbEtEZzFzY0JXWjBPbUtMbHJuYnZ2RG5Bbmd1TnVNdFlyT0EybEIvY2I1?=
 =?utf-8?B?TEtvbkRWV0JPSnEraG1mT1liRWxMbzlNSFpBV2ZnUEVNcTVxdWFUdVBBQWhq?=
 =?utf-8?B?VUpKU1I3SVZRYmhkM05qV2dQSmZwUitsMCtpZml1QzVXOVJ0V1ZkUTQ0NGw3?=
 =?utf-8?B?WXpBbkNDVHZXVm1pOCtDbTRKK01lSituSEsyUnVFTFp3N2MwV3lNdXliQnlQ?=
 =?utf-8?B?SnVkU0tkR0FmWEtLMStYcXcvdWFvTDZUdk0wbjB3ZW1JYmhpcmw0by9YR0JG?=
 =?utf-8?B?TFhuSGZBd20rRkZpVDhnU0Q3M2VEVjk4UVBwMGRBSW1lQ3d5NFd6d0lZTFMw?=
 =?utf-8?B?SDMyVk5ta1E3TzVzblRISUV2c1RiTEg0eFZVZ0g3bVZXellaYzBTOVNiNm1I?=
 =?utf-8?B?dU5jcjVqYUVJVURKcjZkdk9ITk4rU2Y2Tyt6OUpsZENSaVdGd1RSUTlEckVi?=
 =?utf-8?B?OGNJaGkrRjlFVUpBVDdWQWJNcGIxZzdTU1lhb2dsRFAzeTE2bUNZMEExbFl1?=
 =?utf-8?B?SG5QY0s5RCtPbG9vWXFOcVhUNlVnWk1NZnh3KzRtWno0ZUdIRUJxU3JGNCs0?=
 =?utf-8?B?eE5qdi9XK1puOVV5a2RWVVJnbDYvZTU0T21yb0t3aFVOb0EzaWo2cG80TGNB?=
 =?utf-8?B?MjFQelVmSjRRWmp3TmVGM25kbE5pRU1IMHBaY09WNG00TjVuRXk2eGEyQ1Rk?=
 =?utf-8?B?SUs3NitmZFdGRFpOMHl6QlkzdW9SbGp3RDArSUlSSCszVDdJZnEzaUl3YytG?=
 =?utf-8?B?NDdtclFlWE9kYjQzSDByUUJNYTNVaVlGd3lRSGpaaFUwNkt1eEtRMEU5U3lJ?=
 =?utf-8?B?SlV6U2lBMStEZGh2elV3UktSR25rZlkydjY0QVg3ZUNNT2hwempsYkl6SHY3?=
 =?utf-8?B?ZHdkTHZvT2liNThRN1NuWjRuNVZoa3Q4c1kxdGNCSDg3aXQ1a1Y0ZGJ1V2Ni?=
 =?utf-8?B?aE1XVjdYbGFQdEZlM2V0TE1iVGNNa3JIQm1sM25DL0NqdEcydlZWNGVoaW9G?=
 =?utf-8?B?TDhJMFNjbjB1QkU4QmtBZVdOdDAyYWRaV0lPVGphSzNCUDV5bGh0VVo1WVlG?=
 =?utf-8?B?bi9VMFgvZEhjcjNvcm94eFpxVnpuOUx2WlR2YjlGenNaSnJDNzd0SE1IS3JY?=
 =?utf-8?B?eGFFV3JCaktZNVlTcW5SbGlzSnJzVE53VXJwNzVjemtFQ0RMTk5BUDFTd2lq?=
 =?utf-8?B?VEVyOXFlcTZHNmFKR2EyV2EzTFVDZ01hY3lFRmY3RXdsZWxKU0RsZVRxVkMy?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 06279892-5743-4ebf-2a6c-08db4beca1ea
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:39:50.4940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQ/hUx4+FtZVc6KWuIdtw/5hGhcLCOtqUAzHJUi8JKyHrq5s/UUNm6dXNJrXMF5J54WZsQw5byYcUrmX4tWkZ0HTyuiC5Bp9y8C5f9ABrx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5258
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02.05.23 03:07, Adam Ford wrote:
> The DPHY timings are currently hard coded. Since the input
> clock can be variable, the phy timings need to be variable
> too.  Add an additional variable to the driver data to enable
> this feature to prevent breaking boards that don't support it.
> 
> The phy_mipi_dphy_get_default_config function configures the
> DPHY timings in pico-seconds, and a small macro converts those
> timings into clock cycles based on the pixel clock rate.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

A few nitpicks below, otherwise:

Tested on Kontron BL i.MX8MM with SN65DSI84 and ADV7535 bridges.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 79 +++++++++++++++++++++++----
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 70 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 2dc02a9e37c0..99642230a54a 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -18,9 +18,7 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/of_device.h>
>  #include <linux/phy/phy.h>
> -
>  #include <video/mipi_display.h>
> -

Unrelated blank lines removed above!?

>  #include <drm/bridge/samsung-dsim.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
> @@ -218,6 +216,8 @@
>  
>  #define OLD_SCLK_MIPI_CLK_NAME		"pll_clk"
>  
> +#define PS_TO_CYCLE(PS, MHz) DIV64_U64_ROUND_CLOSEST(((PS) * (MHz)), 1000000000000ULL)

Should macro arguments PS and MHz better be all lower-case?
Also, MHz is actually in Hz, right? So it should be renamed.

> +
>  static const char *const clk_names[5] = {
>  	"bus_clk",
>  	"sclk_mipi",
> @@ -487,6 +487,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
>  	.m_min = 64,
>  	.m_max = 1023,
>  	.min_freq = 1050,
> +	.dynamic_dphy = 1,
>  };
>  
>  static const struct samsung_dsim_driver_data *
> @@ -698,13 +699,50 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
>  	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
>  	const unsigned int *reg_values = driver_data->reg_values;
>  	u32 reg;
> +	struct drm_display_mode *m = &dsi->mode;
> +	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> +	struct phy_configure_opts_mipi_dphy cfg;
> +	int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
> +	int hs_exit, hs_prepare, hs_zero, hs_trail;
> +	unsigned long long clock_in_hz = m->clock * 1000;
>  
>  	if (driver_data->has_freqband)
>  		return;
>  
> +	/* The dynamic_phy has the ability to adjust PHY Timing settings */
> +	if (driver_data->dynamic_dphy) {
> +		phy_mipi_dphy_get_default_config(clock_in_hz, bpp, dsi->lanes, &cfg);
> +
> +		/*
> +		 * TODO:
> +		 * The tech reference manual for i.MX8M Mini/Nano/Plus
> +		 * doesn't state what the definition of the PHYTIMING
> +		 * bits are beyond their address and bit position.
> +		 * After reviewing NXP's downstream code, it appears
> +		 * that the various PHYTIMING registers take the number
> +		 * of cycles and use various dividers on them.  This
> +		 * calculation does not result in an exact match to the
> +		 * downstream code, but it is very close, and it appears
> +		 * to sync at a variety of resolutions. If someone
> +		 * can get a more accurate mathematical equation needed
> +		 * for these registers, this should be updated.
> +		 */
> +
> +		lpx = PS_TO_CYCLE(cfg.lpx, clock_in_hz);
> +		hs_exit = PS_TO_CYCLE(cfg.hs_exit, clock_in_hz);
> +		clk_prepare = PS_TO_CYCLE(cfg.clk_prepare, clock_in_hz);
> +		clk_zero = PS_TO_CYCLE(cfg.clk_zero, clock_in_hz);
> +		clk_post = PS_TO_CYCLE(cfg.clk_post, clock_in_hz);
> +		clk_trail = PS_TO_CYCLE(cfg.clk_trail, clock_in_hz);
> +		hs_prepare = PS_TO_CYCLE(cfg.hs_prepare, clock_in_hz);
> +		hs_zero = PS_TO_CYCLE(cfg.hs_zero, clock_in_hz);
> +		hs_trail = PS_TO_CYCLE(cfg.hs_trail, clock_in_hz);
> +	}
> +
>  	/* B D-PHY: D-PHY Master & Slave Analog Block control */
>  	reg = reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_LP] |
>  		reg_values[PHYCTRL_SLEW_UP];
> +
>  	samsung_dsim_write(dsi, DSIM_PHYCTRL_REG, reg);
>  
>  	/*
> @@ -712,7 +750,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
>  	 * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
>  	 *	burst
>  	 */
> -	reg = reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
> +	if (driver_data->dynamic_dphy)
> +		reg  = DSIM_PHYTIMING_LPX(lpx) | DSIM_PHYTIMING_HS_EXIT(hs_exit);
> +	else
> +		reg = reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
> +
>  	samsung_dsim_write(dsi, DSIM_PHYTIMING_REG, reg);
>  
>  	/*
> @@ -728,10 +770,17 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
>  	 * T CLK-TRAIL: Time that the transmitter drives the HS-0 state after
>  	 *	the last payload clock bit of a HS transmission burst
>  	 */
> -	reg = reg_values[PHYTIMING_CLK_PREPARE] |
> -		reg_values[PHYTIMING_CLK_ZERO] |
> -		reg_values[PHYTIMING_CLK_POST] |
> -		reg_values[PHYTIMING_CLK_TRAIL];
> +	if (driver_data->dynamic_dphy) {
> +		reg = DSIM_PHYTIMING1_CLK_PREPARE(clk_prepare)	|
> +		      DSIM_PHYTIMING1_CLK_ZERO(clk_zero)	|
> +		      DSIM_PHYTIMING1_CLK_POST(clk_post)	|
> +		      DSIM_PHYTIMING1_CLK_TRAIL(clk_trail);
> +	} else {
> +		reg = reg_values[PHYTIMING_CLK_PREPARE] |
> +		      reg_values[PHYTIMING_CLK_ZERO] |
> +		      reg_values[PHYTIMING_CLK_POST] |
> +		      reg_values[PHYTIMING_CLK_TRAIL];
> +	}
>  
>  	samsung_dsim_write(dsi, DSIM_PHYTIMING1_REG, reg);
>  
> @@ -744,8 +793,17 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
>  	 * T HS-TRAIL: Time that the transmitter drives the flipped differential
>  	 *	state after last payload data bit of a HS transmission burst
>  	 */
> -	reg = reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_HS_ZERO] |
> -		reg_values[PHYTIMING_HS_TRAIL];
> +
> +	if (driver_data->dynamic_dphy) {
> +		reg = DSIM_PHYTIMING2_HS_PREPARE(hs_prepare) |
> +		      DSIM_PHYTIMING2_HS_ZERO(hs_zero) |
> +		      DSIM_PHYTIMING2_HS_TRAIL(hs_trail);
> +	} else {
> +		reg = reg_values[PHYTIMING_HS_PREPARE] |
> +		      reg_values[PHYTIMING_HS_ZERO] |
> +		      reg_values[PHYTIMING_HS_TRAIL];
> +	}
> +
>  	samsung_dsim_write(dsi, DSIM_PHYTIMING2_REG, reg);
>  }
>  
> @@ -1337,7 +1395,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
>  	samsung_dsim_enable_clock(dsi);
>  	if (driver_data->wait_for_reset)
>  		samsung_dsim_wait_for_reset(dsi);
> -	samsung_dsim_set_phy_ctrl(dsi);
> +	if (!driver_data->has_freqband)

samsung_dsim_set_phy_ctrl() already contains a check for
driver_data->has_freqband

> +		samsung_dsim_set_phy_ctrl(dsi);
>  	samsung_dsim_init_link(dsi);
>  
>  	dsi->state |= DSIM_STATE_INITIALIZED;
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
> index a1a5b2b89a7a..76ea8a1720cc 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -62,6 +62,7 @@ struct samsung_dsim_driver_data {
>  	const unsigned int *reg_values;
>  	u16 m_min;
>  	u16 m_max;
> +	bool dynamic_dphy;
>  };
>  
>  struct samsung_dsim_host_ops {
