Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1BE567BDF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 04:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B3710E328;
	Wed,  6 Jul 2022 02:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2129.outbound.protection.outlook.com [40.107.237.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3E710E328
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 02:31:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cM2t9CbcXs7EjA0OJzQgrXJ9JKClYzfPJ0rObCXRcWm3CVBbHsOi3S9hg+BTbWc08JPUqsN2Oe5qj6Qv6B18EU9Rz3m6Av/SSKkUFwsb7zycMMeXSmYbEav17Gra3HemcFYG0wtfnLwHy9WTN/127J8LH7ufnfMP1VwjEmhmhe1/ojehCg4ibdb11MmGtAlX1UXfK+HClTIrbN5QajelAFdhgq64r6+KbYMNcbwBSh9rOQn/086oiKJ88ZPPuye2lAqOwcYyVqO+WbOBuOR4ltv3qsE2RZ0lcrj42YRXbG356JbVPJAQtgIyEu8AlFG9b0km8RnL9uwfRpdMEjAMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9BWavt2uu5ZYDpNVeGJVGawnJtIBk8QYY/HSJfuH3Y=;
 b=a/TvIDe8RoEnHyyv+rd3JkcdjUpo+9a0dAiC70A6hb6OHHcvCsGjasLI5JYil2ZY0XP6ECJ9Dc84G4UXot6oZe1eO4y1JdJAniwKRU7wqTVHwfboy55eq5F5s/+Mj0MzaFv2Y+UPsLzySKIliINkczR+uiMVgoGuemawPUEfgjcXvv2re4/WP9WzbBCife4HCDqpjpJRpx1En8pZm8gDOxpQ7HP2MSvc/B8dyWggb56FbVw2rl5XIAwrheOqiPDoo78NabNOU6vCORDXV4J+Hb2FGMaF8rNOQMuVuHIAWFSAYqcc/XK8C1AsRN+aJSXt1iG73hfCKkgI8UkbQ0lyRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9BWavt2uu5ZYDpNVeGJVGawnJtIBk8QYY/HSJfuH3Y=;
 b=Gagqq5JeOa8rrNpBHxDRsjaObFLxJuQUQexF0SzbLSqCrgy70KoXJ5fLaHEdN4uhRXcM943MB0wzuFg1P60TvlHMv2QESWo3YCZw22ua7kFfr9w4lIgdG8XETemYYaWpRU8Z7aQwgbYSv+faQ5iWme0gWp87dR0ajN5ns3hV1TE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SN6PR04MB4224.namprd04.prod.outlook.com (2603:10b6:805:32::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Wed, 6 Jul
 2022 02:31:53 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::ec96:5112:c2d5:9377]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::ec96:5112:c2d5:9377%8]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 02:31:53 +0000
Date: Wed, 6 Jul 2022 10:31:48 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 3/4] drm/bridge: anx7625: Fix NULL pointer crash when
 using edp-panel
Message-ID: <20220706023148.GC2357796@anxtwsw-Precision-3640-Tower>
References: <20220629160550.433980-1-hsinyi@chromium.org>
 <20220629160550.433980-4-hsinyi@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629160550.433980-4-hsinyi@chromium.org>
X-ClientProxiedBy: TYAPR04CA0019.apcprd04.prod.outlook.com
 (2603:1096:404:15::31) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b0ca321-f717-49ec-7b0c-08da5ef7afeb
X-MS-TrafficTypeDiagnostic: SN6PR04MB4224:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y2FyF2P35u94LO77tBoKIl+Lt1bP9zSQ3CQybZqPoMf9z7ES5hx1SGpFz5D5aNADuJKpmuIdEx2t7C8/CO2cJg5gEewTQzyNw/AQ09hkdqaYHSS745M9dmcbMA1nzNViUB+eo0O7toxEfc3EOxL7QzIDG1zPKqevzolz9sIwarXYB8t5tV01p3obiVq/2+I4jsWzcNSwL+NXRQR8bBDpgZciePvpl2tjx5NodenCsSNx/mccvu4iz32akET8tLGIEOdiRYaUueI6P/IraS9z3kJ/0GETQDlxE9ycS8DtQs+nhnezh904XdNAdLkFrLE5GL8PxRjObOg8BvFBmMhPR2qqIjECcZRWL8IHGE/wWvwCx19KK7B4PnLaw58CBq1efJoiYeVjJsJt6DcpukvuJVJ0b/74bxGcuE/FUc4YzN66LVygud5S1SqNyQDm1B20Ew90hlDGmTfW0FzZykCq+k2OAPh8IJcMyHV8drOW73LkvfhdJUHQK4c6RKsF3pfnPjAyBe1CrfYCwDKdCLONhi4Ar2k0HPhW9ikiOCIgCUCMnYLEM+gh3HW1kjBwC6AttQIcPDavuUxa4JE0CBKEne1hckpgQw6b6KqdGgTyMn4QR2KWwWa2PvAB8ULrNWvoXueedUq4Efl455lF1p/E1W0W1umZL+xl5DqCuu7nrmHB+Hzx6/9j6Orfatery8054z/cTgcr+BiXyIf2DdjFuzZ90oGoeWcnUQhjiCmsoVoxc0FJrtPuGyVZ7MMKPaGGOG9oVI9kn1ZxvOOYjZMdfN7R1stqmDnMI4+zehGhmEj07ZfzGGARQMD5z/Hs+/pJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(376002)(346002)(396003)(39840400004)(366004)(54906003)(2906002)(6916009)(316002)(8936002)(6486002)(33716001)(86362001)(66476007)(33656002)(478600001)(1076003)(186003)(66556008)(55236004)(52116002)(6506007)(5660300002)(38100700002)(7416002)(6666004)(41300700001)(38350700002)(26005)(9686003)(6512007)(4326008)(8676002)(83380400001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2ewWd/b8agBW4Szyo9MFA8ISLL0Y+BUHd7pblhEG8NGsOx62lsnYToZ8ezgm?=
 =?us-ascii?Q?aI1ZXL2hFOFVxwXqr1Fu0b7h1qdZ9vdgznAgrNvoSSQe5osbT2k1zF6cAS8U?=
 =?us-ascii?Q?AuBzN9FrXsAi7hkUT4ikXnANs3JdAQmkT2NZzbB+SMv81IpQQBA5GT11WyVN?=
 =?us-ascii?Q?vxjqiWGV7LIxLAcgxTojkutVo5kx9uqbhIdr7aRreDDs0MlB65qESHP2BA76?=
 =?us-ascii?Q?GGuujpBaoeQS4TamiomndDKvpMja39cm8Pz61vvaWSBWYqYk1Hs8NxSNv2Tk?=
 =?us-ascii?Q?3tOgWg6yqujErijLtXpOFdoR6+gb5yfFgNbF6atPRDa3wn79SAlYytNA0xd5?=
 =?us-ascii?Q?TJ8J47WqsxsuTYUyUXDRfZgSVPtFs2PZ95Tk0mpkXikp8QlZaBaanySO7WD1?=
 =?us-ascii?Q?cc8UiIJxnK/m5wCH9tCkB1tSJNww78Wu01JWhNNJUuUcbr15EgNcb+ju+4Po?=
 =?us-ascii?Q?gbTF2ulMrnGeSisDQV+riaWwmLMk2bvEAWH1VGHXgXWnUrGLTE+HO+UdvtF2?=
 =?us-ascii?Q?Wxi0ei4/syENF+xCCD9FnF9o7xiG0BcNKoQ/yXS3GUpchOrwYVl1qBNexZNj?=
 =?us-ascii?Q?3rGpB3N5fjJ8SRNh+7gZNW9rV1BUQLpTDCSY058dlhGYkoDYGC6ZH2o+8lbC?=
 =?us-ascii?Q?UhDncIqqKFGk+OSuz6WT8LJFSloOG34yeKfWLDf34VmlDwrLte4KCHMTIFm9?=
 =?us-ascii?Q?EcpS9s0R/H8yjr5WuACn8F0UnzzACAtOlpbicXsnF2IzO/lI1V91xkirw3ZD?=
 =?us-ascii?Q?/OgzfnaG9QJs3Hc97ZolefBQzDNS2aKH7Ep0rjibIeO+lq8HvIk10j+1E/Mt?=
 =?us-ascii?Q?ie7oKNARTo+dEwbM+TJwqkSbNXFyyJF2C8PHxY9qj91IZ2znNmGK0uknjO0B?=
 =?us-ascii?Q?Yu2etKoK5fbD/UzMoDCTHuRMOwfam8EbLPYFFMIpTElccf12q16u1Snbhc8O?=
 =?us-ascii?Q?gFA9fPhO6KbL71uJOxNt7JDkX72l4I6iUuL2Jcoo+deWkLmr4SomeelfZ6+i?=
 =?us-ascii?Q?2tagLQ1suVMEMGrYTapiUtcr9W2RTaslk8eBSfWuqutePy1EiJohBMedcWqX?=
 =?us-ascii?Q?rtzK8EaVTdxQznzxiwFz3kWd5v3QfhI3EJi7iu+/S610+7uV+nDo0YtfCyiq?=
 =?us-ascii?Q?DGgoAZwGchN4AY4DDOI8yjhrekulB+nnRLsquJvzWMah5cYMmTSpuYn3mQJu?=
 =?us-ascii?Q?dN8BUiZvNOLFuv+IKDQ7v0yPX+VCzOofYQxReTloE29fNN4U/LTYzaT8T++0?=
 =?us-ascii?Q?YTHDe5FK5mhRLGZy0gYPm4GypAVHTx/eN3nneQwXucOT2JLrEg2GQVjZGzNe?=
 =?us-ascii?Q?xyYrov2igvexspQBXlPRG2+PTYtHqaDtJ50BLnCJaie21RrBb6MAL4F9k01H?=
 =?us-ascii?Q?ysG//qoQZ8bvP0YsC7C61lc4fYQ0L/FcjIaHnp6pUDRPTAYiaYlxo0Q/BVn4?=
 =?us-ascii?Q?dS8Rllpcn2tqijphAFt0/Y7dVRh4ZtcBDd+DHyzXo1CUthC5IygrZU9V46zF?=
 =?us-ascii?Q?jC+plOZo33pyrE6iBg0dSmr+UyVHaH1yi0RhCrrcPrtPLuZe8YjPA/uPxL5d?=
 =?us-ascii?Q?S/HjKg3KxFC+JdUdjIv5o9/PWFrFnod19v+afrv4?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0ca321-f717-49ec-7b0c-08da5ef7afeb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 02:31:53.0393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qUZDXrsuJQWsMkKaj8yscOEE7gfvS30Y6Qg4V0EFqjr9H8j27B3S3FuGofa5rdIYC5zp4dhLx1XEYpaUypXNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4224
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

On Thu, Jun 30, 2022 at 12:05:49AM +0800, Hsin-Yi Wang wrote:
> Move devm_of_dp_aux_populate_ep_devices() after pm runtime and i2c setup
> to avoid NULL pointer crash.
> 
> edp-panel probe (generic_edp_panel_probe) calls pm_runtime_get_sync() to
> read EDID. At this time, bridge should have pm runtime enabled and i2c
> clients ready.
> 
> Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through aux channel")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 478f5af381c7d..59ddeba33652b 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2590,14 +2590,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  	platform->aux.dev = dev;
>  	platform->aux.transfer = anx7625_aux_transfer;
>  	drm_dp_aux_init(&platform->aux);
> -	devm_of_dp_aux_populate_ep_devices(&platform->aux);
> -
> -	ret = anx7625_parse_dt(dev, pdata);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
> -		goto free_wq;
> -	}
>  
>  	if (anx7625_register_i2c_dummy_clients(platform, client) != 0) {
>  		ret = -ENOMEM;
> @@ -2613,6 +2605,15 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  	if (ret)
>  		goto free_wq;
>  
> +	devm_of_dp_aux_populate_ep_devices(&platform->aux);
> +
> +	ret = anx7625_parse_dt(dev, pdata);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
> +		goto free_wq;
> +	}
> +
>  	if (!platform->pdata.low_power_mode) {
>  		anx7625_disable_pd_protocol(platform);
>  		pm_runtime_get_sync(dev);
> -- 
> 2.37.0.rc0.161.g10f37bed90-goog
