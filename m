Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C286F8306
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 14:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7CA10E077;
	Fri,  5 May 2023 12:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2047.outbound.protection.outlook.com [40.107.104.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F6C10E077
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 12:33:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=errvu7zG72B6/Sn+LxXFs0dHrmD3AI+O6QGbYfyiNNRHTHXeu+XJsqvqftLeVKZbKisDzZ4epS5rdcvLOAMeP5o4A/mTJfb4w3lJLgrSlPQEskeGSJjmuuZItBKKUuinxYvj3RsD3lnDKPfHqalOP5yRalh4BoBA0qWTMO7vtj80ikJ4Ypdr3DctmFe6/y5iH7wbKUc7I1tCFqCDGNsV+lgAWdWG9toT9U4egGLOe05ittbGOb4bDlLrzH/S7ePDoz66+kSZJWoTLRh6mGaly2xS5lpvE3ieN4Jlhen8LmCsP04zbdQgH8/OYEam8Wowe1ujrAoOwQOcd3etwTH8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1K0X5weAr7PsQQ609LUGPTnTthOF9eIPObJxmD8tc0=;
 b=NMFZT9cGvHIYsKzH/9t4ErTirS+T+CEpnFyt7lZnmrKJuD7meun9ep+ZGtlR3zw6aetbFCD6/ZQ2LjELXn4P34WfXtr5JdxZEHbkdTCeotlHRalmBW2D6txwoLk1/7XRmPSeKa/7oaXQoz1hcOR7JcmPq19T0SXSWv9bn/JByVFj1zPUfrimrJLZgX+53Ir9Dh2HeSut8GtfbNdSeXy31G6/EbHntbPH98tMGepFSwUfzd0UyH9QcMEgv7jwQJdgX49svTxyvpZIOASoqm2ZzLGSWjO+A8CgoZcCIEwofcN7U/1GwppvrM7tpW3yXqK5T3Jg6lHlLocwmULpIdfoBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1K0X5weAr7PsQQ609LUGPTnTthOF9eIPObJxmD8tc0=;
 b=O1GkVtF73CUiRUvAEb3JBhnJV8DQucxAQuy1tfv2ex93BVR8Xm+6/Mk/c8ybNrbLupowVG1B81dttwxMUO7UBEAtQA07HULGmgn4BnFQUByedyslAOnS+9EH9uZOedsrwz9+iL/PF41UZyBKHRHEEvNW+o/6GwhPdhCJf8COj1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAWPR08MB9568.eurprd08.prod.outlook.com (2603:10a6:102:2f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Fri, 5 May
 2023 12:33:40 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::77dd:14e4:a772:d85f]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::77dd:14e4:a772:d85f%4]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 12:33:40 +0000
Message-ID: <a9ec6c19-0f1d-25eb-2841-352b24ff36e2@wolfvision.net>
Date: Fri, 5 May 2023 14:33:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/13] drm/panel: sitronix-st7789v: avoid hardcoding
 mode info
Content-Language: en-US
To: Sebastian Reichel <sre@kernel.org>
References: <20230422205012.2464933-1-sre@kernel.org>
 <20230422205012.2464933-9-sre@kernel.org>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230422205012.2464933-9-sre@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0017.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::27) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAWPR08MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ed4fe3-9bdd-4a47-c583-08db4d64f4d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B+Fuz8twaa9pRIefs7vQysm6ne6/ubwMRB0VVUz8y4agWqWRf5P4ImsCvtE2xEziIvfy5CZ2KmM5V855+gea9XNp68BP3vxKjsJTRYoUlkPEv59WaRT2d6g/9GhSmyUDRHC9D/v/YlLvWmxgkLt6/N7EEJBATxvWeJDsvZjrc9RbrLpwwu1vbdZvLpQT6MaFqda69qhdIZ5tRtbDNfUVDmF0mzKK5fk8+VKhPn7G5LLgXTaNVxAyGPWE6NZdULwgCf1WtLxXceIs9fU9cTe2mpLmuD8iKMZ3YsQ1cKJvfssH5IgOLho0p2g5AvXKvqazA36wTynUZXjt5Ox/Cp3y/4mBl8Nq7fTXqy8lqhwZU8JxickYoF9UF2ldXZECjnroxzRoISN/A8VnHK6i7mJo6gZYhkhVkK7kpp3R51EPG8cfsTYcNFNYuKxlVwLn7VRlkPSTSzsgPvqDXz+YvKHeM5J7FUx0P1iZtDxhLg81jBjFuM4LWcgI5trB7g+P4t9cVKGcC9h4HwA1it5LNiF8KdvR4ysNd5DZF2l6gGwl8Vj4HLIpNN7LCsOz68tuPV/4GpmhR0XkTqSXW5zQIlXUjinu/ugjHn53b9TwW+0ei6pPWv75szd7/1Kf7doAWyOiDuHn4dxpaUVVdwkGIf7h0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39850400004)(366004)(136003)(346002)(396003)(451199021)(2616005)(31686004)(478600001)(38100700002)(83380400001)(2906002)(31696002)(86362001)(54906003)(66946007)(6486002)(66476007)(66556008)(316002)(6512007)(6506007)(6916009)(53546011)(4326008)(7416002)(36756003)(8936002)(8676002)(5660300002)(41300700001)(186003)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXBPekE3NDQyTEZIcnlsUHZxdUtkcExYQzVpU2VFRlNWSm9scklIaFh5V1gw?=
 =?utf-8?B?UmtZNjZ0cVFFNTBpWmpCVXVyV1ZDOG5mVnBHN0Z2c0JxTzBWWjZZZWVxU0Rm?=
 =?utf-8?B?dy9YVXJyM0NGRXFVOUpSQUZ4dVBYR3ZrS2V4NDRYT3RwTlBZZlpMT01rWHZw?=
 =?utf-8?B?T2JocUQ1U1hVUFQrM3FSUU81UTJyYitxZnkwRkhwbDFKWEFRVTFCNFVhbTll?=
 =?utf-8?B?YWg3UDJxbkNPZUE3KzRsM2pVbGhXUk9VRjFKR2UraFVKWjhyS2pabDRiaGcy?=
 =?utf-8?B?cFhQQkJuM082YWdyNStmMC9IV0UvYWV3WkZSdE1qc3ZtTXViZDJrQnIzVE00?=
 =?utf-8?B?OFpvUWl0aTNjL3o3OFNaUTdPZERGemVGTGxNMlV3emNxbUM1b29YOGcyZ0NR?=
 =?utf-8?B?M3l6WTlTOEZLTnlNakxjSFlPMEhkYlRjdEF4YTlweUw4TTM4OU9Qa3RUenpM?=
 =?utf-8?B?SXZJZWJybFY2cU04d0loVzQ0MTBZeVY2VWZObzB3YlFQNjhHeHltWjUrcFF0?=
 =?utf-8?B?c21TR1JwUDB0aFgxUENWczhlcjUzM2s1by82bW4xQ1RCOHNQSFduTzBUa1h4?=
 =?utf-8?B?QUxOazE4djNxOFV6VURJQ05RTzZ4MUNvNGJycXZLcFJVVDJlcVpwODhSTmhs?=
 =?utf-8?B?Q05Ob2RCRHFOelhrcVZOa21wQklTeHpLc1I1aU5PZ05PQVppdVBYcHp3OEVB?=
 =?utf-8?B?MEF1Nkk3RTNnUmZINHVXR1p1RVRTRzNjbTFvMG9oWUdEMGd4aWUzT2ltWXBX?=
 =?utf-8?B?TWxIbGtIRzZXM0FOamk4dUVZVkljRUxrSkVlY3hZSVdOU0hBZHQ5cGlFS004?=
 =?utf-8?B?UTZ6RkJpSnIxVHlGcXJFbW42SmhPMUxyekwxODZhai9lcWxRQWIvTDdFZWxW?=
 =?utf-8?B?M0dkdVdQRlJ1M2wxZjVhMzlrRHVYc2U4bjROY1ErZTE1blV5YTNlUWUySTVF?=
 =?utf-8?B?dS95eUZBQWw2SW8zSE5jUjNZYVc4SkQwSVNEUWNPSVZtdi8xdUdvMFVQN2VL?=
 =?utf-8?B?YnFGUXFwek1ncGdnRHFjajRtYkpqN01WOHZSSmhpcnoreFY1dXBYSzFRTVln?=
 =?utf-8?B?algwd3pQclZjQTlpa3M5SjJ3czNna0w2R3VSVW5NczhheUl1VlJRRHRmSUJN?=
 =?utf-8?B?WDM4TTgxOGd3OGtuYU9aWVNNVWV4bVQzU0VYS0tuRWNlWC9SbURhUDEzRXR5?=
 =?utf-8?B?ZC9HMDdLSjdCUmJKQ3JNeUF6NzJaUHkxR2VhaDlDdEdJWlNydU1WdHIzSW5y?=
 =?utf-8?B?cGRZWGhNSDJxMzRoa3k0aFg5d1FLdlVOT1NHTVkrSm5LQzh2RXhNUm9Ta3VE?=
 =?utf-8?B?VlAycnNnbnZzNG10S05HZTNHWFpHUEVQUWZUMEkyRjd1cHJkSC9wdEZTb3BM?=
 =?utf-8?B?ek90T0IwSnppaE44bU1KTzZEOHZTRENDdGZ1aVJqVTJ0R2tEcWMxZk1kT2pj?=
 =?utf-8?B?QnY4V2ZWY21BV1ExL1poNHJuZDA3d1VSZFVId1FPM3IxV1dRWG5tS0Yyd0NB?=
 =?utf-8?B?YVZmN0xtUE4wRjJoVHhaL2svRk1reUpzUjFyTytIdStBRkp6ZS9uZXhqNFcy?=
 =?utf-8?B?ZUUwVHp3ejBOcm1SdzM4ZWJmUlQwTDc1M2doajAyN0hZYUltSVBaQks1R1I5?=
 =?utf-8?B?WVROelZucTJsZENZY1BsWUg5d0ttSllta0RWazVkbDhDd2F6YmZKYndBMWN3?=
 =?utf-8?B?NHUvbGFsNEM4bkZ5N3QrM2VXQlIvUGlTU2RPUG5PRlpiQlJFNmZ3ekFPcDIr?=
 =?utf-8?B?anhWY1R5MTIwcWZsMWd0RVoxeGxPQ0xXcUlWcFBGd1VMMUxmMTBTOTFGQUpC?=
 =?utf-8?B?QnlTWXBIWFJwN3c0clB3VkUrMmFPWTdOVERYRm92ai9qM2twSkFabi9qMnBF?=
 =?utf-8?B?UGxIcmRMSXNKcUo5NUFiNTVEUUhJNFU4MHJ3bjlQNVRmTC9NV1VDL05NS0tK?=
 =?utf-8?B?YVBnYS9iOGk5L3dQUXRKUU90RExzYUJ2RmJSZDJITGNET2xiNUtaL0wxdy91?=
 =?utf-8?B?T1MvSDQrZVpHR1BpcUxUOVQ0U1AyQ2tMZnpSelMxZHB1QmZqOU5YbzhJQklm?=
 =?utf-8?B?MHcxV3E4a09Bd0hLNzh1dmw1VXBzVS9zVFNPQ2FJUHpqZXlvWnFBQTZTcXEy?=
 =?utf-8?B?UjdMeExEOUlVamRFUjJOMEwwbWJOQkRzOEJieVlCSnR3YnhtWUVwcnF3N0lT?=
 =?utf-8?B?M2hBRTB1cjg3dXUzN09IT3dITXVuZ0Zvak5JWkZlSDNaV0QvdXZJazE1dklN?=
 =?utf-8?B?b2E5MWdaZDlSYStqUHVzSzV0S05nPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ed4fe3-9bdd-4a47-c583-08db4d64f4d8
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 12:33:40.4386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+RWGqu/FaAgatHusc4KBEtqDN23lOFUskYbnS0ls9bCBd9VgqfUrCpBviJj5USeaj7HzIkkaE+u9keF8gjx0pAAqI+0j/1Ymxp4Eb4usvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9568
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

Thanks for the v2 of your series. Looks great!

One nitpick though: you seem to wrap the patch message lines at ~50
characters sometimes, which is awfully short.

Another comment below:

On 4/22/23 22:50, Sebastian Reichel wrote:
> Avoid hard-coding the default_mode and supply it from match data. One
> additional layer of abstraction has been introduced, which will be
> needed for specifying other panel information (e.g. bus flags) in the
> next steps.
> 
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>  .../gpu/drm/panel/panel-sitronix-st7789v.c    | 24 ++++++++++++++-----
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index a6d6155ef45c..29c2a91f8299 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -108,8 +108,13 @@
>  			return val;		\
>  	} while (0)
>  
> +struct st7789_panel_info {
> +	const struct drm_display_mode *mode;
> +};
> +
>  struct st7789v {
>  	struct drm_panel panel;
> +	const struct st7789_panel_info *info;
>  	struct spi_device *spi;
>  	struct gpio_desc *reset;
>  	struct regulator *power;
> @@ -160,16 +165,21 @@ static const struct drm_display_mode default_mode = {
>  	.vtotal = 320 + 8 + 4 + 4,
>  };
>  
> +struct st7789_panel_info default_panel = {
> +	.mode = &default_mode,
> +};

Shouldn't this be "static const struct st7789_panel_info default_panel"?

(Same holds for "struct st7789_panel_info t28cp45tn89_panel" in patch
13/13.)

With the comments above addressed, feel free to add my

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>

to the whole v3 of your series.

Thanks and best regards,
Michael

> +
>  static int st7789v_get_modes(struct drm_panel *panel,
>  			     struct drm_connector *connector)
>  {
> +	struct st7789v *ctx = panel_to_st7789v(panel);
>  	struct drm_display_mode *mode;
>  
> -	mode = drm_mode_duplicate(connector->dev, &default_mode);
> +	mode = drm_mode_duplicate(connector->dev, ctx->info->mode);
>  	if (!mode) {
> -		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
> -			default_mode.hdisplay, default_mode.vdisplay,
> -			drm_mode_vrefresh(&default_mode));
> +		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> +			ctx->info->mode->hdisplay, ctx->info->mode->vdisplay,
> +			drm_mode_vrefresh(ctx->info->mode));
>  		return -ENOMEM;
>  	}
>  
> @@ -359,6 +369,8 @@ static int st7789v_probe(struct spi_device *spi)
>  	spi_set_drvdata(spi, ctx);
>  	ctx->spi = spi;
>  
> +	ctx->info = device_get_match_data(&spi->dev);
> +
>  	drm_panel_init(&ctx->panel, dev, &st7789v_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> @@ -389,13 +401,13 @@ static void st7789v_remove(struct spi_device *spi)
>  }
>  
>  static const struct spi_device_id st7789v_spi_id[] = {
> -	{ "st7789v" },
> +	{ "st7789v", (unsigned long) &default_panel },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
>  
>  static const struct of_device_id st7789v_of_match[] = {
> -	{ .compatible = "sitronix,st7789v" },
> +	{ .compatible = "sitronix,st7789v", .data = &default_panel },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, st7789v_of_match);
