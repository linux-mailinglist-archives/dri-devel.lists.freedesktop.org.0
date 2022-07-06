Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E467567BE4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 04:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B9210E5C0;
	Wed,  6 Jul 2022 02:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2107.outbound.protection.outlook.com [40.107.220.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F2110E5C0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 02:33:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vytanh2Y4V63Q4g8abRnKw/fIP69hKdMwHBTSZ2CC21+8PnoWFf9BilPXt/9rwyDFeevB/EdCrDSm+hDlQDD7IqTcgr6zTARFSrKgsPsyDTcfi57vyqkJGAJGqCEm8JhbXHF4bh5OvViCjMvvhA4u+KxMg+Wde50wV4s7Dc4AbbUjMVbMt/aND11/3OudMySg/wvgBwtImPChp1sX2+02n3vzyVa9Yl/1LWHXl93uwHtEnzS4xgXF5+Tby8FdkDnFUkAiSxl33PL68K2W0TNe5u9bI3Jr0QvaLwAke2IKYLp8BjdT9vPQM8QCxzD/22XaBkinZyxP+tcK99NwCQl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UE+8LaoHBHFb6H+zpWS51Fh3PbGFxxT9MnSernos2xI=;
 b=W/7VdNtbHgGt4FlozBsTcS8K60wqsPOHrp7r7FJlZuA3SjpZOaq06I9r1itK8B7VavPNH4ZrzoIFB/x2GKT+8wE18uy0LCBnni5q46dllGlWFFz7bnuA8jaquYkq3UfwmzaZgCjVylI/KBqYajl9JDIICrAz4ptALRAKw3QJ4Mv7FB9JjLoYK3wQzDM7pcz6jyVkRP0v0CQ/zDMqaNRMTic3y2x6/tBxkG7kFV7hcU/Bu68FsqOQ6BRCRWPTMgk/uzGnKZ2rI2MzrpJ3iR5DtjDMiCUMJe+YdEpDXlGmStNs3d+TQhk8Gobid/WLLKjYMlduwxY/PlVmp6f3apt3ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE+8LaoHBHFb6H+zpWS51Fh3PbGFxxT9MnSernos2xI=;
 b=j4bTAHyDN3H1cCwHxQgqOw3wykwRaSm0PhGodQYAQl9eu5EYc1ivRd3X0YnWf6s57PLxvvQ8XAJIh/BdwvjOT1EobHTBpAz5zm9QqFs6J6C7xM0U44Z8zsjJdjNCMOoQIQL8U3dug3ffENcw4ZsCQqjGO+seOaJr48ZtoTN0O3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BN6PR04MB1077.namprd04.prod.outlook.com (2603:10b6:405:3e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 02:33:01 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::ec96:5112:c2d5:9377]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::ec96:5112:c2d5:9377%8]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 02:33:01 +0000
Date: Wed, 6 Jul 2022 10:32:55 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 4/4] drm/bridge: anx7625: Add wait_hpd_asserted() callback
Message-ID: <20220706023255.GD2357796@anxtwsw-Precision-3640-Tower>
References: <20220629160550.433980-1-hsinyi@chromium.org>
 <20220629160550.433980-5-hsinyi@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629160550.433980-5-hsinyi@chromium.org>
X-ClientProxiedBy: TYAPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::35) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca6347fb-6f94-4aa0-d894-08da5ef7d86c
X-MS-TrafficTypeDiagnostic: BN6PR04MB1077:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ivpLYauLzz2jMmyLyU65cghhaaq5ZOvVVejAU2S6mBEqfYzXbRCES/ZI5uSG1CsbaDxInxz6f9uUiLZG8EKDLOVNR1zNweG6qDjJHsd+SVTkz4XvlnZ9sYSQappWyN71ZyA15UwwRwxQpC0ghWN9DRUAdC+CODbEHuLdy8k3BvkFxX9K6NgNUhEu1k8wnpbaBAi5DiUKpE7BsSePjijjvuKff9UvT0j85pNHk35/ydflXohg+wTMDYoajroN/FErvG2M71sRRkZ7wrjJPllRmuXgpwFBhJsCVFX6Ad/25ItxeetC6yfhd9YBy7lgiSbLCy8C4BENgM+L9OdvZ5QvSXapxD3lUIOmlCGiM/ESYsYPaky0wavrEU/9p+DzdHsdjBWSs0wyHAHSW/CO0MwrV1Gy+Apjh0SjqYSNhoRXkVfyCaaRxJGBkJ8V1wcQ6op/eXqcx9LB2YTjLVcOQQl0OxCsmcRdaW7beKXyOdMCNXYkqu4wUxvJjITDTkUNThAcM9O9WNi55XF74ETAvvA6XbL1TL/cgz3lVp45/Y0Em1FZHfXLc5XCpamM4DS3tAg5v3gasLxnm8Dv6IJllvjNw9hMYPk1KDi4SfmvEHNPUGwPxr71OoWSWwQ/IazpGLCQt9NWpzff05Agf3I7dTxdHwLf/BmFa4HUlWE7Hsm2BiiGF/R7zaHznY0xeI0/rt2ai7GbuPKreDZs6pE0WqFnQozac8B9nWSm+XGqkq58Ba8PRAY1e+vV4SEo1X/pUva5sJZtFWcq7e3uGdCZkPKfbzEikc8qH4Y2sxpjjkpWD+gNqTyWBu30ydanZ4l6d4la
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(396003)(136003)(366004)(39840400004)(346002)(478600001)(86362001)(6486002)(2906002)(33716001)(38100700002)(316002)(8676002)(4326008)(66476007)(66556008)(66946007)(38350700002)(6916009)(54906003)(5660300002)(8936002)(7416002)(1076003)(26005)(33656002)(6512007)(9686003)(41300700001)(52116002)(55236004)(6506007)(186003)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5S01dHVRcf7EEi6fqBQoY00XzMb9h0SKArL1B8Wc8d7Zrh4m6EfpHewKAU5P?=
 =?us-ascii?Q?jkaUezT88EmbmH0CNg0LoY1QIkMiDvuK1avJi4xEmIsibR2QFO/I7/rTDbfs?=
 =?us-ascii?Q?PhUgrsgHwDYRmaWdqckH4o056qAALrrSCB092PhAC+hvECCOl0oHTDHovnLh?=
 =?us-ascii?Q?6SHMvrRjhglzyzgIOOgC3K+9vkluZmBzRY4jF/rVHwLqktg+0vzI3gVW0+62?=
 =?us-ascii?Q?JDZWy5GOOpyAaVsEBFsZJ0u9ankTAGIQ9YGtRQbF5sAYeoP8NSjRBB2Unl0K?=
 =?us-ascii?Q?Twe8VTAbvB1eTTVhirzqqyP1jWdwrhZzVWA4aIo9dxoDBlhuc4JBM/WVVIFg?=
 =?us-ascii?Q?/cxCeYGaC4hFoOiXqusPNdJ9Obe9Zs9CfEdvtMU8v9zn5wVTKtUY8aLdYHk3?=
 =?us-ascii?Q?0aL2p0HaryAj9xoh8cJhuMQantufyr7h0gaevAL5u/BkGHH7h/o8csRo9u1P?=
 =?us-ascii?Q?uD/PpwF42MuGvKon24U6fqRnALmFUmLN8jocGjH0J0YoKvwSr6AKJOVNUxqQ?=
 =?us-ascii?Q?oynY4QhKU3YQihVOoOfCSEYj+EXkHFpsulBfuQIugN/Xi+QZMb9D3TfxOAl1?=
 =?us-ascii?Q?xXyR2KffD7lg0Z3Iw16ddojXD+dTcUC0x86ZUA5I3wsWIvt1Xd+t2bdjFEYv?=
 =?us-ascii?Q?GVJpkLQ2ZMFBAYRDpkJtRxBKtlQEaceENBTLGFBaVCltosCqJxKRdAd7JMxb?=
 =?us-ascii?Q?lZkazS+Kg7tzJWsKdYPZ4N19LM+RQEQ9MYupSPufeblvCSQhC1cLX0LD6xyG?=
 =?us-ascii?Q?V3WkrUZA8iciXjTxu3GZZVmlM8nrr1hsc2sHUlynK5oKiuKxSsQBiq2sPYMG?=
 =?us-ascii?Q?3j+bxovLGHy2xfeZAKTL/8VZdNarYMBemuTEn/JdSS5HktcPXRnlOJMrSNbD?=
 =?us-ascii?Q?z4HXuBGmnDP065DGT0L7zqayFXe5vhRLUXTr+4Yeig+bakWpz2rmyjE9Q9IY?=
 =?us-ascii?Q?8tSmckoKCSV7xHxb8Mdg+8BHEi86O2CND6yDk9QabQZWjCY33Szx03qw1bt3?=
 =?us-ascii?Q?bPsvYZZdNVNG6TUCu9CqUEvK95T71LgQsOMVSzMh4kI3iY36fh3Qjpsfgt/W?=
 =?us-ascii?Q?EOE3LWkTn2+yJTijQIrESHp8JfeNgDCpmW50i3TEKA48vGdzxQKZyGmiAJHj?=
 =?us-ascii?Q?oFlEihn4vEU+y2PamtSmQqf+OTGabS3D/xupkHDaT7FeyA88A5TZDTU3xjys?=
 =?us-ascii?Q?AlKrz0G9f9da3bYCNtioFnrlT3Qinv9Q+/U+jXd6pU3jELJ/jPOl0pxIXxgn?=
 =?us-ascii?Q?kbsuqLfZ+WTYPqiJy8U1Ar8TePKIiq5eBxpRu3IKWNQGUQdixj3NBasQJ0Ra?=
 =?us-ascii?Q?v9ipyOjLhwTj77ADaLll7YM5IoiDxIyNMqXweGYwVqPedPFcS2x7Srh2xoKs?=
 =?us-ascii?Q?yoPtoeLVUPJCf5rJRzoK1RV8q6EfdfATsem9AdDW9kkhyKOBTp0fi1aG3R/y?=
 =?us-ascii?Q?aoPmRu30RhHnw6CE7aWoC06d28k7LXHS4xLuHsQvD7LBql25/Gb0Wa7a9Yb7?=
 =?us-ascii?Q?YfTjVCJk0TVrmh0i9jzwrTVQMAG1coo5hP6r44jJj65pL1rbYSnZBL5y92oN?=
 =?us-ascii?Q?QLOGE7mFCsD+ucl1tz7mSCAVTcaeWUBelQYWRYcJ?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6347fb-6f94-4aa0-d894-08da5ef7d86c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 02:33:00.8697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgwqpVF9P8wlJ/s8h8rCnrVFvr0MEl4SjfDN1mYkZJXfi0NheBVPF7nvSKotx1ukjui74GXoALcDzfIP4wYoWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB1077
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi, thanks for your patch, it looks good to me.

Reviewed-by: Xin Ji <xji@analogixsemi.com>

Thanks,
Xin

On Thu, Jun 30, 2022 at 12:05:50AM +0800, Hsin-Yi Wang wrote:
> Move hpd polling check into wait_hpd_asserted() callback. For the cases
> that aux transfer function wasn't used, do hpd polling check after pm
> runtime resume, which will power on the bridge.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 33 ++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 59ddeba33652b..ea5a0b86fe52a 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1443,23 +1443,24 @@ static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
>  	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
>  }
>  
> -static void anx7625_hpd_polling(struct anx7625_data *ctx)
> +static int _anx7625_hpd_polling(struct anx7625_data *ctx,
> +				 unsigned long wait_us)
>  {
>  	int ret, val;
>  	struct device *dev = &ctx->client->dev;
>  
>  	/* Interrupt mode, no need poll HPD status, just return */
>  	if (ctx->pdata.intp_irq)
> -		return;
> +		return 0;
>  
>  	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
>  				 ctx, val,
>  				 ((val & HPD_STATUS) || (val < 0)),
> -				 5000,
> -				 5000 * 100);
> +				 wait_us / 100,
> +				 wait_us);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "no hpd.\n");
> -		return;
> +		return ret;
>  	}
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "system status: 0x%x. HPD raise up.\n", val);
> @@ -1472,6 +1473,23 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
>  
>  	if (!ctx->pdata.panel_bridge && ctx->bridge_attached)
>  		drm_helper_hpd_irq_event(ctx->bridge.dev);
> +
> +	return 0;
> +}
> +
> +static int anx7625_wait_hpd_asserted(struct drm_dp_aux *aux,
> +				     unsigned long wait_us)
> +{
> +	struct anx7625_data *ctx = container_of(aux, struct anx7625_data, aux);
> +	struct device *dev = &ctx->client->dev;
> +	int ret;
> +
> +	pm_runtime_get_sync(dev);
> +	ret = _anx7625_hpd_polling(ctx, wait_us);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return ret;
>  }
>  
>  static void anx7625_remove_edid(struct anx7625_data *ctx)
> @@ -1741,6 +1759,7 @@ static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
>  	}
>  
>  	pm_runtime_get_sync(dev);
> +	_anx7625_hpd_polling(ctx, 5000 * 100);
>  	edid_num = sp_tx_edid_read(ctx, p_edid->edid_raw_data);
>  	pm_runtime_put_sync(dev);
>  
> @@ -2378,6 +2397,7 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
>  	ctx->connector = connector;
>  
>  	pm_runtime_get_sync(dev);
> +	_anx7625_hpd_polling(ctx, 5000 * 100);
>  
>  	anx7625_dp_start(ctx);
>  }
> @@ -2497,7 +2517,6 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
>  	mutex_lock(&ctx->lock);
>  
>  	anx7625_power_on_init(ctx);
> -	anx7625_hpd_polling(ctx);
>  
>  	mutex_unlock(&ctx->lock);
>  
> @@ -2589,6 +2608,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  	platform->aux.name = "anx7625-aux";
>  	platform->aux.dev = dev;
>  	platform->aux.transfer = anx7625_aux_transfer;
> +	platform->aux.wait_hpd_asserted = anx7625_wait_hpd_asserted;
>  	drm_dp_aux_init(&platform->aux);
>  
>  	if (anx7625_register_i2c_dummy_clients(platform, client) != 0) {
> @@ -2617,6 +2637,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  	if (!platform->pdata.low_power_mode) {
>  		anx7625_disable_pd_protocol(platform);
>  		pm_runtime_get_sync(dev);
> +		_anx7625_hpd_polling(platform, 5000 * 100);
>  	}
>  
>  	/* Add work function */
> -- 
> 2.37.0.rc0.161.g10f37bed90-goog
