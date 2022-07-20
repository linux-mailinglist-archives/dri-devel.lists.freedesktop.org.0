Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339957B21B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AA110F32F;
	Wed, 20 Jul 2022 07:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50085.outbound.protection.outlook.com [40.107.5.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7FD11332F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 07:50:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQKhj0GHm+XLQ2l7Vkdgnt3/dviMuZQWMQua/vhQyBEvSxF2KJe7bNSzwTD8oPa6oXXKEwOXG7A8kL+o0dTapXZJZD3pEcQvxdXAftJwfOkqlQFElX8XMpBlpTiC6QopN++NlRdQqamalmafq74P2GGxQVn3VsILZJkkgaqDwQ73OAmxl0xBFRzi2dV7NxgwtofUAkcQPfwzIHFQMAp1Eav2bJv2Q1rI/H+ur4bBbauF/eDDLrPpqpEUSCTxG6EeT9ixJ029GsUDRYPu1n9YOdK8Tf9/Hxj+4Vs3083cMUcPmBqXWUVMg7QNY7KSbypPhymKw00MzYKYsDQU2ajMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJ7Eap7WLFaJVZgn2+k+8cfiCm0VhITsnC7hFM7X+sY=;
 b=SjtajtvIppL9AsbmstLJEBNEOSIAZ20JGEzz8TPirJ196Sy8yEIDHPSBFf9N+/lIgPLc3kGinY8lA7ZJ7jl4dC1QQToAHo30aJYMGdMTluj6APllDXHT7DC1Veh5N1mwNNfAV9xbjY8BJx5qSqIlvtqOpzCrFttmmdRV+GKbtRI+LHrsrofrmhn22GNXiK5VkAhzujU2anvdjiTJOC+eedtiSBFXuOm83ulfM+wxXQ6cUNIxrU61nMOtAouAJAsZ29wA8D0ggL0KLrRMsaoHZqGJiaEa9PtEAx7X9Y3v9y9IGpNWeuD/F/emGQOXUd7Ichy91g/5iDU2G6MXev7MJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJ7Eap7WLFaJVZgn2+k+8cfiCm0VhITsnC7hFM7X+sY=;
 b=HHI7psMJC2ozjba9/yvvFGx2r9ScUrdbC1liWfNzsRfDfp09HB9zV7EfQvrHzzEdnZ7DljjQijn6/EJAmv18VSj/PyoM82nQ+r+d1X9vZD0iL4ALw1NTYyBsm5NLBZWvF/0IwEVIxBo38Eym+7EI2BPAavopFfRn+vuKT+EuhZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by AM9PR04MB7700.eurprd04.prod.outlook.com
 (2603:10a6:20b:2db::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 07:50:32 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::95d3:800b:30e9:603b]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::95d3:800b:30e9:603b%5]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 07:50:32 +0000
Date: Wed, 20 Jul 2022 10:50:28 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Liang He <windhl@126.com>
Subject: Re: [PATCH v2] drm/imx/dcss: Add missing of_node_put() in fail path
Message-ID: <20220720075028.ywp5p25rrrexw45w@fsr-ub1664-121.ea.freescale.net>
References: <20220714081337.374761-1-windhl@126.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714081337.374761-1-windhl@126.com>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AS4P251CA0030.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::18) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01478f11-cb10-4b2b-e50a-08da6a2485a9
X-MS-TrafficTypeDiagnostic: AM9PR04MB7700:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/Av2e3AKkkkoNE2hdFjhAbOItpWuZR6NG377AlYtwuoKiXTvohkgqeFFT50pAMgAT1mAzKG16j50QUsEtD9eQZcT29e4c1xUQbcP49ybshyjA9Go9vG2yshiHlRryazC965ybrs1WYU+g4J6LpY1n/xUlV17Zcy1UXVCMHUJiQeOuzTgDoX7b3Se2+d3F9U3bBWAVP2oVkblMePr5jOEeCTl4aMPKmBNQUHdr0VdkHFznwOSUjr8eHdndXVsFNAYN2FaPoWtWzDmncGZAKdrfBb3nLnJqgx8IZGFR4wsJXaqSH7kjU9Qf4mp1XYXJC+Fo/hVgjConZjABCwIior5mYwHmKJMZna51bKybc3ytluAYtFsser3BuIIS9s5Ox6HPeCY6ZuZWOMKe/RmDyFhnAYjgfxtPYrbYaI0ALCy1q/N8iTmTambbFcx+3nsYJTIJp6fXhj+eNogB4uiM2ykuPke3/x9sij9+ewDPAte2awvwGbwENoI7smm7JYrltD83WAc2AWe8Pew6QMGJapRWnH0gZHBh0oZLwaVzirYyLc4FKSCUJZCAXK9y5pkqCfHoVQoJmNhJFYaEbioAodF2N8lgNbUhDiMCQrzdldHj0x067Lx2CtBsNLU89xCtaUM4+8i3nEr9OFjoUS/QnAHDNO14HJ86+T8URMYR5ytGWOciPY2QAg/8s4I3V9ZL+HayIAyGAV2/HPEse719J59gamxJbc4VXlXjvAI2QEQrHnASbG12FKWfENIlCQIsvzmsp2sbcXavn72joWOrISVCF17kbt9igqZ435lQ4bi2kQ1EwJmmYnt2SrxKADjsKrKi5Ybw4QjqNsdgxxMfRSys6aAZasK/AxK4Ifq8KfDrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(6666004)(52116002)(9686003)(966005)(478600001)(1076003)(41300700001)(186003)(26005)(66476007)(6506007)(66946007)(38350700002)(6486002)(38100700002)(4326008)(83380400001)(5660300002)(8936002)(6512007)(44832011)(2906002)(6916009)(8676002)(86362001)(316002)(66556008)(525324003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2BJAhcDeBKkCIpmQU1b4QEWIb2UgZmC/YktlMxVltwpWIn3BLTOTTlELFLxP?=
 =?us-ascii?Q?1QRE4Z1Np5wDWJSWwWUhdJKh+9W75hlrbRJBVdoy3DQtK/+5PeQAJ/aDpQrq?=
 =?us-ascii?Q?n+W30X2QJD3t8GDmYsPWWJf/XARGBp0qj9RzcuzBNV9JRbajpf63VNbYiKFy?=
 =?us-ascii?Q?pFX1mEuwydgXdW2jmCLgqP5wr5/TlN2Hw1JkBasGYe3ctqQZbaAzMmKsu0sR?=
 =?us-ascii?Q?g6FTlZ0qO+ELCqBUYCoLCFIQX8uysDzNnnv4sKg1mJ4ng7HQTR7CONwUCn4P?=
 =?us-ascii?Q?zPWHSaC6tZIIowPJAAwQLqZRuvilLESxGByjY3svepcuN0JJy8/ySpR3snWX?=
 =?us-ascii?Q?yVQFzYNTEWmnw1KCZYkQqHWd1Nl/uiqeedoxMU91lTdKMuUXFlEJM1Pp/ddH?=
 =?us-ascii?Q?uCXGVwxXW/YH6SwwOR5oz8qRmo5otaouTFcnkwWqvj/NDZa/WhkGpPHiroi4?=
 =?us-ascii?Q?4+WRjVsLNyLxk2xT4EcXLpXmQCNCjeuYqXrcJuUa2Djy/tUoWFFUWm/rBNAO?=
 =?us-ascii?Q?CcNvinqgt5RIbYraNDoUq/gA1Dki92AIF5EnCYnXki56ao0k3rSEOFL+KIIk?=
 =?us-ascii?Q?FNh9c1te7lV0mWcuAnOC0T9ohNpKxH8EuuULJaD0SiCn1/BuXinIxsX51hKl?=
 =?us-ascii?Q?ixl+WRuSvf70PCtff2l0zW31MMEgrxqC2cPQFZ6m1OC6XORVJCQH4ZA3MdQ4?=
 =?us-ascii?Q?R7gb19n0ScpbO8D6sreGtUIYGVmpeuYgKF3ph+kWoK5DPN57S/mMjS0GS7U6?=
 =?us-ascii?Q?xlSG8qptlEvj/zWcp9It9j/EuGCXOAmQKYT/MRQcsvOb03gAVzbJnjfR7IZ/?=
 =?us-ascii?Q?hQ0ryBDpWUXti/x2G3f8XO9pzDtDLDf6kTVjXURjRhluNcdFvCKuTU0U94J3?=
 =?us-ascii?Q?/03FQ2spMzw64WCZgwZ/3e9UUQJRGtGsm/mGYlDDseumyLg1sPQLh50Qx74/?=
 =?us-ascii?Q?7+Ora8L+1j3wT6eotqyHTSrmFU9n8oayJlrgc+hlVHrBSjdsgJbGdLFTB2VI?=
 =?us-ascii?Q?65c6YbF9RyjPzZ1MEdOPseKeXq2Ndq97QptZriAG2q75g35Cot+H+Kb/VDGJ?=
 =?us-ascii?Q?9B68gLsMZhPPUE1yySKJbspm7Usk9ZThGoeSI04MLjQbf/A2CeORmTNJ9Bic?=
 =?us-ascii?Q?+UASSS+PkiKUsLG+hRywoicuNEuLmJGJVAQjBlJlG86GTrk6hKosgym6VzCz?=
 =?us-ascii?Q?M26Tmjg0q3N/qFjeoVAA6vmYenxjb1lWOKM3ih2/ewZ8Dhq0f+Ry2EgZK42a?=
 =?us-ascii?Q?bg9kwysi7iGQZBj5qftKkjimYbN33xWPioh9cnv9/LYNyY5deoBlZDkEDbNu?=
 =?us-ascii?Q?lJyUl13xjqWEunoSTzGEBIoMGgVusKCb+EetsZNsf6cvnixAHlhiQh2pJzIW?=
 =?us-ascii?Q?Lsi5btOzy1WguBAS1o9VrlSWNVhau1W83EMNb9vfVNcodyJ79OfEuYI2yIeL?=
 =?us-ascii?Q?ENd8afp5zBOE9FOCYWNebm+EtBcrNYI6q7mVnBZMQjfeHS0fyUGkE4JfOC+d?=
 =?us-ascii?Q?R0tLKx3oetJRuyrrVpI7hBa9HuVw9HT8vz42jKc8NRR04OsIbQN4I+MKn1rd?=
 =?us-ascii?Q?BY5vh7FnxYz2bDQLrIcncplVJfoLdrX1SVOwoIP2Z6t+UC+oZPyavSwC/7+S?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01478f11-cb10-4b2b-e50a-08da6a2485a9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 07:50:32.4592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66ps5lnx+NjhlLunoKY8Za+vT0H6NzGyUWjxZrUqCZL0Mym7DI571cii1GCOLl9S88gFD9X0eNcU89/5Bas5GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7700
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
Cc: airlied@linux.ie, shawnguo@kernel.org, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 14, 2022 at 04:13:37PM +0800, Liang He wrote:
> In dcss_dev_create() and dcss_dev_destroy(), we should call of_node_put()
> in fail path or before the dcss's destroy as of_graph_get_port_by_id() has
> increased the refcount.
>  
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Signed-off-by: Liang He <windhl@126.com>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Applied to drm-misc-fixes.

Thanks,
Laurentiu

> ---
>  changelog:
> 
>  v2: add of_node_put() in dcss_dev_destroy() advised by Laurentiu
>  v1: only fix bug in dcss_dev_create().
> 
>  v1 link: https://lore.kernel.org/all/20220707023214.307451-1-windhl@126.com/
> 
> 
>  drivers/gpu/drm/imx/dcss/dcss-dev.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> index c849533ca83e..3f5750cc2673 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> @@ -207,6 +207,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>  
>  	ret = dcss_submodules_init(dcss);
>  	if (ret) {
> +		of_node_put(dcss->of_port);
>  		dev_err(dev, "submodules initialization failed\n");
>  		goto clks_err;
>  	}
> @@ -237,6 +238,8 @@ void dcss_dev_destroy(struct dcss_dev *dcss)
>  		dcss_clocks_disable(dcss);
>  	}
>  
> +	of_node_put(dcss->of_port);
> +
>  	pm_runtime_disable(dcss->dev);
>  
>  	dcss_submodules_stop(dcss);
> -- 
> 2.25.1
> 
