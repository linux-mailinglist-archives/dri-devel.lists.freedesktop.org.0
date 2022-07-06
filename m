Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC2A567BDD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 04:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1622F10E167;
	Wed,  6 Jul 2022 02:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2090.outbound.protection.outlook.com [40.107.93.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E3710E167
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 02:30:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0CT6qPuuRwZWKDq9ky7FyTpvPGYl53u57MRCgqkfdAFe2CvFTF+nJfQPWT8nUSr2WkAtZXobT1mPRce0S27/J+4p1fG0vFD60P/ZSZIsB0g+ookqwqifMHwE/Ou7v2dmpsNWgi+BpQ5feMiSyFADHi45ISA0gAbV705j4Q0DOYRstxIlLgu+E78fH2mguEpFX2UgwYdDn/teBYGC9ecSpoVAg9OR2dzV1fzazkiQxxNpgc4W8KlnKLkAbHQhlwnpBgqVO/4Uo8ePMnOQiLLhJBmC+/Agw+yps6wjb+nCYTwoUaUOmhGo7aTcntVc7bHbz513oyUpEbdu+hOZfSwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmTQ9XLotVw8W/6aqe9ZBkXzMf4rPOa/Wc6pkvS/kV0=;
 b=Uj9evLMdAQfhVIygrxL8OCUdGLNhu5U+h0JuNlLeQ9ZfpVQQnhMguUTlaWRt1UljN3Bu0rZ88MSG20/a0cvxocyKjh2Vw/fSZAK/FadrOviTNQHhTbF4iWJolkitFO7FeT4+uD3982dcUwGMUJqBlixvXrVuv+d+OsEucG2sgIO5RBcYjUkrpZPE9++YXyZmnwsKTQlr7IvemJBH7V0hoscGLdO8d/nZ2yGc8WuKYI/IV9OqRwp+2y2JQBkRDoXbBGEJjkZIREVS6QrthIWz+Ykt1mN3QB17UmYGySyftlcMYNi1k2mHGjdu/ebIZhS1KVb1kbI5TKcqzSkDuCfwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmTQ9XLotVw8W/6aqe9ZBkXzMf4rPOa/Wc6pkvS/kV0=;
 b=UIXpFkEX75a2N2e3X4WAN+27N1n+QLKoKKPe3DUbKZTjLsltVPiMm+sP/odI8xpypydAgSv5J57UP6lZI2tszRTx0eBVT4CiZqLYQRDn31/WjeuwVy/qoGR4C6hLktjgnHdWttJCXWQSJg1YGdTv1i4N6dDbFRiXpatQJnWKNkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CY4PR0401MB3523.namprd04.prod.outlook.com (2603:10b6:910:90::37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 02:30:51 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::ec96:5112:c2d5:9377]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::ec96:5112:c2d5:9377%8]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 02:30:44 +0000
Date: Wed, 6 Jul 2022 10:30:40 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 2/4] drm/bridge: anx7625: Use
 pm_runtime_force_suspend(resume)
Message-ID: <20220706023040.GB2357796@anxtwsw-Precision-3640-Tower>
References: <20220629160550.433980-1-hsinyi@chromium.org>
 <20220629160550.433980-3-hsinyi@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629160550.433980-3-hsinyi@chromium.org>
X-ClientProxiedBy: TY2PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:404:a::36) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 252a6ac8-868a-451e-aa53-08da5ef7873d
X-MS-TrafficTypeDiagnostic: CY4PR0401MB3523:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dppION7+0e5SZadecL4vq0IitaFK4NqUgkbnrO0zllDJ7tcA68jqy9HF/66gieCGUltHbWEj5Jn48beGwdrRzHAKeViUOI6376I2FWoM1EVlhcSyOAVj+qZZJA88wn544Op/ZBzYCY2a8Rf811aPYyly3Es+g95VQgCITbMy/zsDDvRPkwNqpkYCRw+SmajND+nRcjI00PHwSksWnBOT6J+wwad2ceswHrQmsRAeedFDIVRHqi1XS4ehqMN1ks+T9nilrKID0li1DU/2klrbAVJX+DEBDgF8y5EDHmg8uzehYWdryjC35cqwL5L5g8N3CLUGx91ANa21rqlLd6zV0Pmxy+Oo3xx2ymhwpL07I+TNHdUI6iDuLOF3bsh646K0WkZTlSlBfsrg/198hBJGAqUDO3Hxosci131oMzMJpOklm1n4AuYt1r0gm5LK+IMkaX2IhhSiIqWU0zoES7GzW3Fx78wdUbWeLchOaQmS/C7Fy3Wq1ES12OY1vrKLO9h+WzsdocFkyUCGYUeflq8Z3RyjqgyepIvcxe/Qf9OT+sCVpFeRzd3RL5nxbZizrpA8JVt6mcH37PXR3AnRylq3HnAi13QpJVpAnXDsxV2mBT0JMgUpL5eZyBathLLOo6QN3Cl7DgMNstVR1XSFQ+/W+Q4C/xK1SelY57RoaUkFfzDYsG6HQw1se/JN/vWq1uB8qszx+DD9dIsOqZo0wZqieI/10GW7MUXlQisGCjFr0b9qLCn+ihtq7TxoZ/lb4sosNZUSIFxaXlkuzsBiJcPUKrLeNL+IkEGX3SSep+MsyNSuw7bBnx/crWK/ZCLk857B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39840400004)(346002)(376002)(366004)(396003)(136003)(1076003)(186003)(26005)(6916009)(6512007)(9686003)(54906003)(83380400001)(2906002)(6666004)(52116002)(8676002)(7416002)(66946007)(55236004)(316002)(41300700001)(66476007)(6506007)(66556008)(33656002)(38350700002)(38100700002)(8936002)(5660300002)(33716001)(4326008)(6486002)(478600001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YBL0MKwaQ0tfdyPE0eZY730+uOEXrbSG9C4hCe+FxXPXMJx+VLq8xFildcbp?=
 =?us-ascii?Q?ysC+V1/l0+veVmyBgvQMRtQgeVYgrs/dwA9Hc6bJHmik50qh4C9kQnIMB/sU?=
 =?us-ascii?Q?HV5IvvbXt6WIsyhT7NK+mCS9w+ggfzQYGtaVhgnYEQMMthSE2QLHp4QNqIfh?=
 =?us-ascii?Q?kNLsZm3LsF+WU7eeWtsnfY4eVJmNU7cerwDukroD2RjHEj7W/3bFhAcTr5KH?=
 =?us-ascii?Q?v5MIYD++B2Tx0aKugg46sLQOlRvKYD4RfQLy8uokEvF2BReC+bVgLYsRpNP9?=
 =?us-ascii?Q?725I3tpnep41eku911pXHZAJFQoOcG9npNhTEAWDunuD3pNXq3y4q8Ae6EhM?=
 =?us-ascii?Q?cCqJx+ox4sigdGVsgrUtjgP8Sts8SsHz1EQxLMxEvAhdJWRG5vyUod6bMSNU?=
 =?us-ascii?Q?c8LHaUnNsC9/wnwsKCdNg9ip54HhrNtFPTCJQCuXJeKbVwy9K+Y/ovh6s6oI?=
 =?us-ascii?Q?uX0gxsnK977y5z8dk3OUuDB9qQLFx+Jy0XYYOfFmRse1jLMz+Ao5ig3oMwb7?=
 =?us-ascii?Q?7gwLcsyYU9NNTZa4UpxSMcFZ5uYKAVwsM2mSQZnuna2neZwxOk4Pw/TQ7HoF?=
 =?us-ascii?Q?JwtoL/znWbK+3ExmhakCAdkkO184pNAZLCXl06SnwRuANW4ypNOpfkXPQdnY?=
 =?us-ascii?Q?YZy8J4m2gB1O446+4kOzuVMPsdTt6PKdo7/QW2AS3FK+FYvVcGMn46UxdqL6?=
 =?us-ascii?Q?qmcc3qlt4bV/+guEKYyITQzj372Q0eXzuRbhLM3jkPaGaWwPksrXrrQui/jW?=
 =?us-ascii?Q?F1+wzkfRakpcovpUj30CATbSmyDdx+JuewOBqJC48vHKkzmVQrd/RrqnwtuL?=
 =?us-ascii?Q?aGebXDmMSaLAytnsz4lhvBFatvkNQmksX77KSsiwqfhBrGUF9NCiaG26AsXV?=
 =?us-ascii?Q?kr2BOV/0/FkBG2QM7ycUaoCXF6ZfOA7mPpkwEXJCHSQwZW/hAwxh2+2VKXgi?=
 =?us-ascii?Q?DomTvkWWHR4tWZHektRcWv7uDitErFKC0jiZZrID5oWQ+409XPSrplJjto0s?=
 =?us-ascii?Q?y53NNa3mPqV2B+PrvNGzpqcwh2txTyVBcY9rNEUXlK43vEsotLfCJLivofkh?=
 =?us-ascii?Q?Pt96b1WDawz98HvX6jOj7Z9Ln0WvPEU3aEKZGmO/hCohiUtyRF9hbCGRyTlv?=
 =?us-ascii?Q?bml4nWkMetXkGTfP6qmPhfDH8TKWepQhlzP8NeEfl/WkevU24EkLg2Ayz+Zt?=
 =?us-ascii?Q?soyOs4DOXUkfsPxlNLNYDxqlbXNzSPlFsoGO0dGtRysn2FZZMjpf+QeACbbH?=
 =?us-ascii?Q?Gu/iRljcBAbxDPZwgv2UzcIvXFMa8ZeZfKDtd6MC23MUzNxfia9MeE53kcR1?=
 =?us-ascii?Q?JR/9/QgiU9a5Hl9FiMTLct8wQJWlunbIyYw0vqx5uxNC4NDnyT/UFYOaUhty?=
 =?us-ascii?Q?AcX+6U1gA/+9+BKia3BL/oCisZKH3T0ptmfCRUkamIKXvJHp60lLx4wSTTEu?=
 =?us-ascii?Q?9Be5ZlVavvqYUzf7YmDAQz2SxNE+MBh90QSKIOZKMqggwXj3FX3/D18QC0FP?=
 =?us-ascii?Q?3cVrqgN+mDH6CkZE15E0w8xHt+0cgEyBcOcn0QfalrBP19vkVdg6Adi7+NwY?=
 =?us-ascii?Q?2IcAswM/hh6ZXgooJcuD11kRR/UkTb9X0R7s9MzJ?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 252a6ac8-868a-451e-aa53-08da5ef7873d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 02:30:44.7757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJTh9VXihIwsmvviq8Igmi3auvP3kW95orjwof8DK8/6FIANy1q4VeHdh3YWpCwyiMOIRDDSl/68c60ecWL+/Q==
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

Thanks,
Xin
On Thu, Jun 30, 2022 at 12:05:48AM +0800, Hsin-Yi Wang wrote:
> There's no need to check for IRQ or disable it in suspend.
> 
> Use pm_runtime_force_suspend(resume) to make sure anx7625 is powered off
> correctly. Make the system suspend/resume and pm runtime suspend/resume
> more consistant.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 33 ++---------------------
>  1 file changed, 2 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index f89e8151475f7..478f5af381c7d 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2504,38 +2504,9 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused anx7625_resume(struct device *dev)
> -{
> -	struct anx7625_data *ctx = dev_get_drvdata(dev);
> -
> -	if (!ctx->pdata.intp_irq)
> -		return 0;
> -
> -	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
> -		enable_irq(ctx->pdata.intp_irq);
> -		anx7625_runtime_pm_resume(dev);
> -	}
> -
> -	return 0;
> -}
> -
> -static int __maybe_unused anx7625_suspend(struct device *dev)
> -{
> -	struct anx7625_data *ctx = dev_get_drvdata(dev);
> -
> -	if (!ctx->pdata.intp_irq)
> -		return 0;
> -
> -	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
> -		anx7625_runtime_pm_suspend(dev);
> -		disable_irq(ctx->pdata.intp_irq);
> -	}
> -
> -	return 0;
> -}
> -
>  static const struct dev_pm_ops anx7625_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(anx7625_suspend, anx7625_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  	SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend,
>  			   anx7625_runtime_pm_resume, NULL)
>  };
> -- 
> 2.37.0.rc0.161.g10f37bed90-goog
