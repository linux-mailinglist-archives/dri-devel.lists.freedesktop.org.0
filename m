Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D56567BDB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 04:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434F110E154;
	Wed,  6 Jul 2022 02:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2096.outbound.protection.outlook.com [40.107.93.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546F110E154
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 02:29:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcERXzO0X8frw4iGox3F5UoJt0P/cqLyTLXYFsEK/Yg7nusvzZjEr06wDBos2cdeJ9dmCUfC+74InAvBr2goNPSO9d/E+NJN59zVCBn0jZniEg6EXUEMzxaJErqHMh/rzXDQtqiXd7W6FRp+uxUwAA6rEOFLYsd7kHOQorW7LiAUp/Zdu3ggovHjP7ov5tfqOLlDJDABxHHMqvDEl8q/VJyCxLNQrLJL5+zYnx4NaEzuiaBhTOgps3KqFm1vEFmJ4FwDWgHxmGbAFJQBGIgfz1psoZxwRc/LFkg+Am6CCQEgJNz56pTEL0eMFnT18XFeurBCZwjHbRiRQNuChyGd5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoaWDcRx33jUNRKyR55AITG70MQHmB2wFJgEc5+UDVw=;
 b=N6n+tFUOV3RBExXTA77GNBta9EHNVqq4EYI8VbCT2GZrUvpK4dkRkhmJQdMmdyiAUTVYN8jUauNkXhyNX56f1aC/1XWAsKJ8uOlNH5jy42hAup66mR/O3F/Bek8HE22djNrjAywTqVQgeHLhzeKnOS792uL7zLclLal2EthJYyDQqG0+RJVPYJvHXE3HMbzhzitZ+aG2Dxj1rx1U6S9ZxfnA/wh8+zfa6a252d4C5sBx3Tqmy1N/Ww7kygDL1H0boKSG4XgEBxaRXLNDiuIM1CdcDVQ/1115gS3X8NYTskW0x4J6CMQ+e6xhbLaYErsNMc7/7oDUrnN60xK50y+C7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoaWDcRx33jUNRKyR55AITG70MQHmB2wFJgEc5+UDVw=;
 b=BKzxM/tTeEsBqEX9XpJ9zYnnAfs11bEwh9gXxTilt2JhZKipit6vYYmjN/cwOs4TbCphly9+k4WuK647mbE++AOY0CXuxV5kHI3Q6pQhpAwN8Pi9A1ce2UxBiBXMY02TPuammrXhcMFdzV6mOShDd6tUa6ScMNWKBwXX49+2rVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CY4PR0401MB3523.namprd04.prod.outlook.com (2603:10b6:910:90::37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 02:29:35 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::ec96:5112:c2d5:9377]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::ec96:5112:c2d5:9377%8]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 02:29:35 +0000
Date: Wed, 6 Jul 2022 10:29:26 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 1/4] drm/bridge: anx7625: Convert to
 devm_i2c_new_dummy_device()
Message-ID: <20220706022926.GA2357796@anxtwsw-Precision-3640-Tower>
References: <20220629160550.433980-1-hsinyi@chromium.org>
 <20220629160550.433980-2-hsinyi@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629160550.433980-2-hsinyi@chromium.org>
X-ClientProxiedBy: TY2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:404:42::22) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bfbaba0-cc8b-4623-b8e7-08da5ef75db7
X-MS-TrafficTypeDiagnostic: CY4PR0401MB3523:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1c8Yaevjb3kPkb5y3xQJTI/EO11+jCDjMOVSqSjCas7i+01gmIqy9OwEmbDkCde2EF2HbhmB/TZV92hLcp9W1i2SMlITzD4SUsY7x73JZcHvgc3lqvZf454DFMY81lL+WOIUSQrHK69UmCuQ5dXIGwkbts9ljtTwJ0EHv3X3UDbNJRI94DwQwgxcKxL/gWKrnqi2asD2zZ1NqQUKeEvOJycgdqO4X++erTgK5GwZQ3TRQLYFF7LSKV6HQVzSAjgSq2S8heMQjWBCUyov9/q8qwmvf8NjyYOu3nrSMtDRkC4nw2Af1ZxB3al69gmH+3eCcfVrgNw499LqmEfI5eKO3U5bC5veK5ecZmBsNadlHDjy37tbHWJVQZ7KV/kmGlGuEr9wcQkP30ThP3wcr72Qq1eTuGy7KVA/Lcg5MrgM4yQ9B14pvnFNsm/9tqLdYafY8TKMUIG9Mzh9bcrUZnEltDHrb3N8iEOcwHsw0hgDeds7NYbRrmkqqjslkpiOvDzD4tteRU0fQH2M+3wzA7pviUzDz4TiXt8PqoGOUfbio8x+A4wzNKjIg5pOWZycb0gD/FYSBfZ8rwaGITfMm7EQU62hewmxzZTswM+9qhjBrTIwSZabVpkt9TCd3Hng7gf3piYr1XFX4JNnBiObp54H6OeHpEq50vcXU9ySMq8WarRZ4RaupIbzZ9FwD2Q2S7dFZ1rmjGxHAw6u4k7Y0M3ptei7UKPOj/JzfswM3hduZyF3ogKulbVVeL9EYzvcZKmJ5XwK4dkfQ94qeJJIEUb9k+EqcC2x3Mo7lbmH4/VPUm16zChnK1V+pNvZaX9MNw1CKgx2/tnwwO9cUlFP3+lThQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39840400004)(346002)(376002)(366004)(396003)(136003)(1076003)(186003)(26005)(6916009)(6512007)(9686003)(54906003)(83380400001)(2906002)(6666004)(52116002)(8676002)(7416002)(66946007)(55236004)(316002)(41300700001)(66476007)(6506007)(66556008)(33656002)(38350700002)(38100700002)(8936002)(5660300002)(33716001)(4326008)(6486002)(478600001)(86362001)(70780200001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f1GDtp9Rr26ZC+W0GNu/3cdXhwa/o94ceD8EJmGa3rRxhWQGiBAVyhjSYDbw?=
 =?us-ascii?Q?1MXXz45XStO4N7jFflbqUuqXJlT+ty7xFew9GWs+LkG4CDF/NdnIDlKaKnbP?=
 =?us-ascii?Q?s8jJsA6SzdYb8XyeVAwuCwgAJ2Qk4pQ8KH8MbC1ADKDYrbagN23LyhuJP9ud?=
 =?us-ascii?Q?ISA+7awgGJOIyL7FPUiMcygpF7v+mmsnxZAtDtUsEXBYU6FihzXZsF+HodJ4?=
 =?us-ascii?Q?RILhVhdqGlmguLZp+2EtM38FIYLctwB0yCZxDdVwPhYEs/TBcLUeRedqrQiO?=
 =?us-ascii?Q?oqa9DbSxQx4F954nQJFw00/4+1JoTsrRpsUM7gGW9WcMymUtL7V89ZHIHRcK?=
 =?us-ascii?Q?x2QpRdWidVLPLdri6QtTO4GZFCvCtAEzDaKEuIEPcv0T/JNBR31rXjEXon9j?=
 =?us-ascii?Q?L2nZ+T4X9kkYrKaHwwEh+OcAHV09/+DvB017ZGmxw3v1+hA5p7Klwe6FpvQ4?=
 =?us-ascii?Q?02KGPhA4naOM7FVb7LqKyRRZpjfZR3oS9tndz/aAUW1WzdQ4j7iodBV5krVI?=
 =?us-ascii?Q?rQucliW0W+jlo++g2QToMraBKHqYUWq1ghc6JNC1VbEKZb/xoilsdOKgc1IX?=
 =?us-ascii?Q?G44tdL1ulsrBZTUP2jO12XN9PtkwAN9jtCb2byQ1gedb5Hby/JQYjmAww7CD?=
 =?us-ascii?Q?BsRFDnuiGaRWXdb7/YUPXUsvVVshqLA4hPaDBbmZVwLJoNagRaOJV34QDMh4?=
 =?us-ascii?Q?+NmRXL9j/74CLMudCDaNzHx+7coioHSTw/bnkpwsIJ3Wy5QfH1cLJ85+3JhK?=
 =?us-ascii?Q?C+grvBDUZS8om1g0CWaI4vXVBBM/cFHVNvEBbVWxJHuhY6/f45/rfWUOvAFm?=
 =?us-ascii?Q?rAI6O0vxZENDaiZ//7+TGJcs+rFGG0lDStjQeYNvtQUM+kAibyr4Q22rGthB?=
 =?us-ascii?Q?PRjNXIum4GA9cpPSQAw4KH3zrcCtv++F5a8tXVRZKrBzzesf4F4eBI3t4pMT?=
 =?us-ascii?Q?yhaw2UHN/szyyys0+wQNu1Q8Y1eC8vrgSXVVHLscLNLAWG2RASUq5Iy+2BJk?=
 =?us-ascii?Q?1RxNxHuhuJwBX966w/XmUWcECJ5oE4mMB8J/v5yq1dMrRlKWw/x6TRz5eP7X?=
 =?us-ascii?Q?+yEwldf+24t9KOJVwkcPhpJp1Xs59mTVmLNU1F+M8ngaP7rojfwKSGLfPVAI?=
 =?us-ascii?Q?DF3NJa7EQh4d5Aufe9J3kj5+Fww/PkrUyKVSN0RiOqnXyHaXdKEsQ0yqNota?=
 =?us-ascii?Q?bae/l+Mo/WHaYlTyzbT3OE1OHauD1YFPVvMSGaWReJUe+UfXXDUBFMzZ3qFU?=
 =?us-ascii?Q?RQ0QShfPVtjFRKX9gm1WPaz+k70wejrxBtfmoujKqSw2r/GeKDiqEJNcF8tV?=
 =?us-ascii?Q?0gShUVxyZIjIHJPWA/OUYBJXoUt9ljakkASdGnD2qK/C6M0sjd+AtgO1HDAV?=
 =?us-ascii?Q?S4Ib0eiSp3jD/npnIrDyj3g8ci8r7cZlklLw4eqeiw7SM34O0+i0JkALIw1n?=
 =?us-ascii?Q?JInPe8m4QiaYzq/C99ca4SJlEm1VtY+OE++NUIfnEJvDIZPr/bzAKFBFEvNt?=
 =?us-ascii?Q?zCir18+wFUhHrNgizSjU4oYYvRlKy12CrIRrrRDl9I4Qz7A7hKKPfJ5VP1rW?=
 =?us-ascii?Q?bFT4+qczU24eo9GV72YiaO846Vl9vzRCbwQUw6FA?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfbaba0-cc8b-4623-b8e7-08da5ef75db7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 02:29:35.1569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2QMDFcAczkBiYJQ2iNIuo98qyT0IHoGWqj38f09dgSn9Me4V+nxNk97V5zjOknMZh3IX86g7tgbI9d37iciBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3523
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

Hi Hsin-Yi, thanks for your patch, looks good to me.

Reviewed-by: Xin Ji <xji@analogixsemi.com>

On Thu, Jun 30, 2022 at 12:05:47AM +0800, Hsin-Yi Wang wrote:
> Simplify the resource management.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 96 +++++++----------------
>  1 file changed, 27 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 3710fa9ee0acd..f89e8151475f7 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2436,82 +2436,44 @@ static const struct drm_bridge_funcs anx7625_bridge_funcs = {
>  static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
>  					      struct i2c_client *client)
>  {
> -	int err = 0;
> +	struct device *dev = &ctx->client->dev;
>  
> -	ctx->i2c.tx_p0_client = i2c_new_dummy_device(client->adapter,
> -						     TX_P0_ADDR >> 1);
> +	ctx->i2c.tx_p0_client = devm_i2c_new_dummy_device(dev, client->adapter,
> +						TX_P0_ADDR >> 1);
>  	if (IS_ERR(ctx->i2c.tx_p0_client))
>  		return PTR_ERR(ctx->i2c.tx_p0_client);
>  
> -	ctx->i2c.tx_p1_client = i2c_new_dummy_device(client->adapter,
> -						     TX_P1_ADDR >> 1);
> -	if (IS_ERR(ctx->i2c.tx_p1_client)) {
> -		err = PTR_ERR(ctx->i2c.tx_p1_client);
> -		goto free_tx_p0;
> -	}
> +	ctx->i2c.tx_p1_client = devm_i2c_new_dummy_device(dev, client->adapter,
> +						TX_P1_ADDR >> 1);
> +	if (IS_ERR(ctx->i2c.tx_p1_client))
> +		return PTR_ERR(ctx->i2c.tx_p1_client);
>  
> -	ctx->i2c.tx_p2_client = i2c_new_dummy_device(client->adapter,
> -						     TX_P2_ADDR >> 1);
> -	if (IS_ERR(ctx->i2c.tx_p2_client)) {
> -		err = PTR_ERR(ctx->i2c.tx_p2_client);
> -		goto free_tx_p1;
> -	}
> +	ctx->i2c.tx_p2_client = devm_i2c_new_dummy_device(dev, client->adapter,
> +						TX_P2_ADDR >> 1);
> +	if (IS_ERR(ctx->i2c.tx_p2_client))
> +		return PTR_ERR(ctx->i2c.tx_p2_client);
>  
> -	ctx->i2c.rx_p0_client = i2c_new_dummy_device(client->adapter,
> -						     RX_P0_ADDR >> 1);
> -	if (IS_ERR(ctx->i2c.rx_p0_client)) {
> -		err = PTR_ERR(ctx->i2c.rx_p0_client);
> -		goto free_tx_p2;
> -	}
> +	ctx->i2c.rx_p0_client = devm_i2c_new_dummy_device(dev, client->adapter,
> +						RX_P0_ADDR >> 1);
> +	if (IS_ERR(ctx->i2c.rx_p0_client))
> +		return PTR_ERR(ctx->i2c.rx_p0_client);
>  
> -	ctx->i2c.rx_p1_client = i2c_new_dummy_device(client->adapter,
> -						     RX_P1_ADDR >> 1);
> -	if (IS_ERR(ctx->i2c.rx_p1_client)) {
> -		err = PTR_ERR(ctx->i2c.rx_p1_client);
> -		goto free_rx_p0;
> -	}
> +	ctx->i2c.rx_p1_client = devm_i2c_new_dummy_device(dev, client->adapter,
> +						RX_P1_ADDR >> 1);
> +	if (IS_ERR(ctx->i2c.rx_p1_client))
> +		return PTR_ERR(ctx->i2c.rx_p1_client);
>  
> -	ctx->i2c.rx_p2_client = i2c_new_dummy_device(client->adapter,
> -						     RX_P2_ADDR >> 1);
> -	if (IS_ERR(ctx->i2c.rx_p2_client)) {
> -		err = PTR_ERR(ctx->i2c.rx_p2_client);
> -		goto free_rx_p1;
> -	}
> +	ctx->i2c.rx_p2_client = devm_i2c_new_dummy_device(dev, client->adapter,
> +						RX_P2_ADDR >> 1);
> +	if (IS_ERR(ctx->i2c.rx_p2_client))
> +		return PTR_ERR(ctx->i2c.rx_p2_client);
>  
> -	ctx->i2c.tcpc_client = i2c_new_dummy_device(client->adapter,
> -						    TCPC_INTERFACE_ADDR >> 1);
> -	if (IS_ERR(ctx->i2c.tcpc_client)) {
> -		err = PTR_ERR(ctx->i2c.tcpc_client);
> -		goto free_rx_p2;
> -	}
> +	ctx->i2c.tcpc_client = devm_i2c_new_dummy_device(dev, client->adapter,
> +						TCPC_INTERFACE_ADDR >> 1);
> +	if (IS_ERR(ctx->i2c.tcpc_client))
> +		return PTR_ERR(ctx->i2c.tcpc_client);
>  
>  	return 0;
> -
> -free_rx_p2:
> -	i2c_unregister_device(ctx->i2c.rx_p2_client);
> -free_rx_p1:
> -	i2c_unregister_device(ctx->i2c.rx_p1_client);
> -free_rx_p0:
> -	i2c_unregister_device(ctx->i2c.rx_p0_client);
> -free_tx_p2:
> -	i2c_unregister_device(ctx->i2c.tx_p2_client);
> -free_tx_p1:
> -	i2c_unregister_device(ctx->i2c.tx_p1_client);
> -free_tx_p0:
> -	i2c_unregister_device(ctx->i2c.tx_p0_client);
> -
> -	return err;
> -}
> -
> -static void anx7625_unregister_i2c_dummy_clients(struct anx7625_data *ctx)
> -{
> -	i2c_unregister_device(ctx->i2c.tx_p0_client);
> -	i2c_unregister_device(ctx->i2c.tx_p1_client);
> -	i2c_unregister_device(ctx->i2c.tx_p2_client);
> -	i2c_unregister_device(ctx->i2c.rx_p0_client);
> -	i2c_unregister_device(ctx->i2c.rx_p1_client);
> -	i2c_unregister_device(ctx->i2c.rx_p2_client);
> -	i2c_unregister_device(ctx->i2c.tcpc_client);
>  }
>  
>  static int __maybe_unused anx7625_runtime_pm_suspend(struct device *dev)
> @@ -2723,8 +2685,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  	if (!platform->pdata.low_power_mode)
>  		pm_runtime_put_sync_suspend(&client->dev);
>  
> -	anx7625_unregister_i2c_dummy_clients(platform);
> -
>  free_wq:
>  	if (platform->workqueue)
>  		destroy_workqueue(platform->workqueue);
> @@ -2754,8 +2714,6 @@ static int anx7625_i2c_remove(struct i2c_client *client)
>  	if (!platform->pdata.low_power_mode)
>  		pm_runtime_put_sync_suspend(&client->dev);
>  
> -	anx7625_unregister_i2c_dummy_clients(platform);
> -
>  	if (platform->pdata.audio_en)
>  		anx7625_unregister_audio(platform);
>  
> -- 
> 2.37.0.rc0.161.g10f37bed90-goog
