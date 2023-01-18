Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 139266716EE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9631310E369;
	Wed, 18 Jan 2023 09:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2079.outbound.protection.outlook.com [40.107.103.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4EC10E238;
 Wed, 18 Jan 2023 09:02:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEB5grP9RtHiCF21/5oEko5EfVf45Ppe2KDaDnnf0nAoZzxKXYrEFpRAXgxkgV2FrDZkPm2r2E54ROATsgX6rLxWga/w0JJESysXPCqrxO09C+1/bz1Ee8e4W2TUZhWsoQ5LVhyGzu9/TYsiQAK2qfLOseRtcBtKEsVoe/1UOQShPd6rJPGgk7SRZukyiUrq18P+nkkfmK7kP1tscrEqroBJmAyDYzqOAKl7HkKJgw/QfXwAC5NxDGobcIf1xGckPRR4/pYoVK1ohp63olABwKvAQhT9L7BtfXRSOIUcGUQTfrLr2nfY9DTjStldyjr1EGvNHn6P0TYbzet4zX9nZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3X4MOXMaHq7iIhB5BJfLgek47ZFXU48dDrVUCltiQ4=;
 b=gLZUdcxdhnIVDfs8u3tLT1CttyAJoT2nkUBafGUT1c5Wnmv+OJiWlXSDMQNH8kTdY13d24cdZk1QgpfZuO16zOI/yyMRn/bmtoMDFjSAgoU2NLjqzHR3bxWjeqkf3DT/c9KjA86t+ZPBXapmcyrRPWd0JA5HU6eKBNUDJjLiTz7ZYMvALkUiosGR/HR2enskIqEdkA/tKScahcvVZf7tyBlpuVW43OT0htU78TPwFNfDdBIskvQiRbQaBAqxrZmLuVkK/Mcsh8hILkHzWjP4pxIUhWsk2xJ1EvVm8fHKsWpcxHlwxdrIxV45GiyhMUN7MmSbxJI1FzAjCZxSq/c3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3X4MOXMaHq7iIhB5BJfLgek47ZFXU48dDrVUCltiQ4=;
 b=LWnXLr6YqGr0scFg+IKPwEbGa+EqHHAIxRG4KalmYG5J+zSJdxjOz1iTA8GsjH1Elrj7HIuWFDUMEYtKLwYpnr90N3NynBLpZHfG4bPalq8UUBNdjttKQupVsCS0dqLN23A7o4k+d8cHFr/Xxy5EiQYAPVAnA72MhZbZcTp3/FE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by AM8PR04MB7745.eurprd04.prod.outlook.com
 (2603:10a6:20b:234::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 09:02:52 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::738c:a9cb:7b8b:4033]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::738c:a9cb:7b8b:4033%5]) with mapi id 15.20.6002.013; Wed, 18 Jan 2023
 09:02:52 +0000
Date: Wed, 18 Jan 2023 11:02:42 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] drm/probe_helper: sort out poll_running vs poll_enabled
Message-ID: <20230118090242.qyxvfbce5uinqio2@fsr-ub1664-121.ea.freescale.net>
References: <20230117233905.1662645-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117233905.1662645-1-dmitry.baryshkov@linaro.org>
X-ClientProxiedBy: AM0PR02CA0189.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::26) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3902:EE_|AM8PR04MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 70dd7aa3-796a-4e7d-2cd7-08daf932c5f2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rEnmCwL82SWcOP6whgO1H8ecBFiA1SpM8vH7+MHBcENLPLO2D+qNyW5ZgAWkaNl9DATIrUJoouUIRFqP54Ghq9C7j3nY4iHPf+xjt4wM5IYDYV6lN9LHPlGaCiTl5wirKv+1qgHfWdQqzsIAODXfQH5u/mvlx7gJR5X0RYtMeVbBN16bz/rmerqp6Id4ZiYdH4TssfB5ut13sCjPPKG/pbksTiQVVlKH3U1ONO5vrUNLvZa6yCDnDgFU7vHhDVcrCafHEy99RqeXvduqRHm2k2VjoEwCSmMSXIKZ5GE9bIcbHctWcRrc4me1bbtznhqZCRJmjb+rMTNJZV3PqLaRAnhBoZCO4euU1EZbPfx2Avfi/HfaUvwXGXDJLPrPO1brr4IcxEstC3CsHwioK5rOzhNCkAezIdpQXjvZzYAA/9trnE2I0pDZP/9gSjwW5jYApMweEhvT1kq2zz+6vBNh89OdcxVuk1jlf90rtgUrw+FZcZ+WYNdTyQNBy+QBDWSIaNW3CiqCP4aT4kMaH1MnFcnHs7PDUN+KwUKp9FYQj66s+6NQXewo52dkrJw8/zzgDZktpZ0gS5jr1F4mKUeCMAegzsMdglhojHi3BNa2AvpwxltoNDELwN3IwCB42sHg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199015)(6506007)(6666004)(38100700002)(45080400002)(6486002)(54906003)(1076003)(186003)(9686003)(6512007)(26005)(478600001)(316002)(66556008)(66476007)(5660300002)(8936002)(83380400001)(4326008)(6916009)(8676002)(41300700001)(44832011)(7416002)(66946007)(2906002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KcJBXYGr2UVhlcmQduKmH/HKL0Ttu8T37rN+NRD34ro8xtJ9LGFbIskuzGxv?=
 =?us-ascii?Q?WICn2zHgwkjCucTel03d00+CUh+kvQlLnFHBCZsNy6U7pD4WEVBcEHh2ee3y?=
 =?us-ascii?Q?CiaJbvpEKQl9sHD3UBd4WpW8d7LIZMSFG/RZDbKXCXYpob8zA6/ti5Td20G7?=
 =?us-ascii?Q?A5hm+k+/fhGpUvNbdXgJcas5ht5d/QFM6r6lk1EQheKANxIPYdTdtCgvmsDB?=
 =?us-ascii?Q?llqxMJQ9b88A8dqAKtO0/zaytuJpwQJPw5BJMQFDIt9wsWOZZ7IyrjfviCfX?=
 =?us-ascii?Q?UKMGpfcllsBF1Dk1uHFZr1k33iF0cNqUZWDIO4DCIrK1oAilAOGpJsLZK3wO?=
 =?us-ascii?Q?TSt5LBsM6Yfy9273nz/2z39BtgTqTRX06oXx6zYKqcg04gvjAGM5jmVTpWSC?=
 =?us-ascii?Q?CvnhEqExe/0+4Ew5fBDGRAOKiEUSZGSpZhfFxgqX/h/c/Nwig7f0rwmmrf93?=
 =?us-ascii?Q?7J8BHgAaqZK8LujexsglovJrYlb7pH6NwATM/UfnZWZPseN5fCcnIgeQ6Y5p?=
 =?us-ascii?Q?eT74bHxYH/IZ8yZBVfuIQVn2aoQxxUFFjkm9gotsRN0ZtqJG4Wet6ErwKlPs?=
 =?us-ascii?Q?WtF6uQ9ShUbxGFMeneAcyb6q3/eUkza8qdF1k4YbzOHNnMhj0cfrc32y3xIv?=
 =?us-ascii?Q?XqA9aF11+Nn4OIlHD/HdPyECNNylGYOrAvGyg0cwIPVNny2QQ8xQ73g6iQm1?=
 =?us-ascii?Q?JVjFprx3Fo9ed8F1PIdhheqj2f5S/YVS700zHhR5eSNqNBDXr6D0HghiSrwd?=
 =?us-ascii?Q?j8bXjhPe5Kj/9bkLVuK580cwQggDd/nMegHIF3JM3EbzyydmBHhU8czRKUt4?=
 =?us-ascii?Q?k8VEY4O7WQJU2r3ED3zFs1gA2XzCudwWA4hrNQ24PrjmALfxvj8xZ5KUOyOD?=
 =?us-ascii?Q?6KRmgPwudwZANhZ6zOimZCoX1SDU2NrTwSivXk7197hkSixKbjkrv7/5t6X1?=
 =?us-ascii?Q?PFT7QVFobuV/UKxpuuJe+NwKqjuGC5CXlCD9m14KVqTLA3M+SdlrEgDSyyEL?=
 =?us-ascii?Q?2uZEBe/wN48rGPCCJjnBnQPcVpKvDTFsgaurpqO13uCgth403r9izEk1ejCV?=
 =?us-ascii?Q?K8mh4A5Eo4bcUAYydF8dJU7L71WdCWELS17TtupFrnIgxnYOLD/R1XfKCXqd?=
 =?us-ascii?Q?oOnSkJZxALlKdyPt5q8pTZCAyoYNvedl9z6dI3w1woYIyufZH1VvUk8LAcWV?=
 =?us-ascii?Q?UZnNkMI8OJa8tQ6eov5bnXtTS/PBCcC/ZRdGWz1/odqJZe2Muabhj00t+w76?=
 =?us-ascii?Q?baCHQVOJUuDoi64IFGxRMOd7MQOG03KRA3F4cVnDaMWsKLU7+52EquHrnkR7?=
 =?us-ascii?Q?SIunlLfPpzeb5wYydC+Mc3Ruiev43+REcNmhRXHds5qF5gsZRWQtQ7kKIi9e?=
 =?us-ascii?Q?d8oTmDyp7OioP/wI3K9iz8GhXdDsDLvmTmhQF+ALUztYKz/JQMM2pxH+AYpC?=
 =?us-ascii?Q?lVVgnrWdtTtl0OBsqZ3A0+qxiY7BqBNkgkfsqX08ndx2tONX1iuS3eSOi4jr?=
 =?us-ascii?Q?lm9J+BaECi5aqeK9/vRizyfDZhIA8Rf61lXWfMD+5+R1JkoZIlcF2M0sQS7e?=
 =?us-ascii?Q?w6efIKa3bCnI55VpltW/3ixiC73Jr4FcUCBRVDkyBiPUT7jFUC6ds4ohLXfS?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dd7aa3-796a-4e7d-2cd7-08daf932c5f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 09:02:52.1945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJ/MlF38bPsHsUjXgG7gv+ULxTmkZCbjmOmT7TiHwp6l/qGtRMpHYiT8CVEuuFX6xfnXZzEvkkUVNnSznBQ/gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7745
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 01:39:05AM +0200, Dmitry Baryshkov wrote:
> There are two flags attemting to guard connector polling:
> poll_enabled and poll_running. While poll_enabled semantics is clearly
> defined and fully adhered (mark that drm_kms_helper_poll_init() was
> called and not finalized by the _fini() call), the poll_running flag
> doesn't have such clearliness.
> 
> This flag is used only in drm_helper_probe_single_connector_modes() to
> guard calling of drm_kms_helper_poll_enable, it doesn't guard the
> drm_kms_helper_poll_fini(), etc. Change it to only be set if the polling
> is actually running. Tie HPD enablement to this flag.
> 
> This fixes the following warning reported after merging the HPD series:
> 
> Hot plug detection already enabled
> WARNING: CPU: 2 PID: 9 at drivers/gpu/drm/drm_bridge.c:1257 drm_bridge_hpd_enable+0x94/0x9c [drm]
> Modules linked in: videobuf2_memops snd_soc_simple_card snd_soc_simple_card_utils fsl_imx8_ddr_perf videobuf2_common snd_soc_imx_spdif adv7511 etnaviv imx8m_ddrc imx_dcss mc cec nwl_dsi gov
> CPU: 2 PID: 9 Comm: kworker/u8:0 Not tainted 6.2.0-rc2-15208-g25b283acd578 #6
> Hardware name: NXP i.MX8MQ EVK (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_bridge_hpd_enable+0x94/0x9c [drm]
> lr : drm_bridge_hpd_enable+0x94/0x9c [drm]
> sp : ffff800009ef3740
> x29: ffff800009ef3740 x28: ffff000009331f00 x27: 0000000000001000
> x26: 0000000000000020 x25: ffff800001148ed8 x24: ffff00000a8fe000
> x23: 00000000fffffffd x22: ffff000005086348 x21: ffff800001133ee0
> x20: ffff00000550d800 x19: ffff000005086288 x18: 0000000000000006
> x17: 0000000000000000 x16: ffff8000096ef008 x15: 97ffff2891004260
> x14: 2a1403e194000000 x13: 97ffff2891004260 x12: 2a1403e194000000
> x11: 7100385f29400801 x10: 0000000000000aa0 x9 : ffff800008112744
> x8 : ffff000000250b00 x7 : 0000000000000003 x6 : 0000000000000011
> x5 : 0000000000000000 x4 : ffff0000bd986a48 x3 : 0000000000000001
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000000250000
> Call trace:
>  drm_bridge_hpd_enable+0x94/0x9c [drm]
>  drm_bridge_connector_enable_hpd+0x2c/0x3c [drm_kms_helper]
>  drm_kms_helper_poll_enable+0x94/0x10c [drm_kms_helper]
>  drm_helper_probe_single_connector_modes+0x1a8/0x510 [drm_kms_helper]
>  drm_client_modeset_probe+0x204/0x1190 [drm]
>  __drm_fb_helper_initial_config_and_unlock+0x5c/0x4a4 [drm_kms_helper]
>  drm_fb_helper_initial_config+0x54/0x6c [drm_kms_helper]
>  drm_fbdev_client_hotplug+0xd0/0x140 [drm_kms_helper]
>  drm_fbdev_generic_setup+0x90/0x154 [drm_kms_helper]
>  dcss_kms_attach+0x1c8/0x254 [imx_dcss]
>  dcss_drv_platform_probe+0x90/0xfc [imx_dcss]
>  platform_probe+0x70/0xcc
>  really_probe+0xc4/0x2e0
>  __driver_probe_device+0x80/0xf0
>  driver_probe_device+0xe0/0x164
>  __device_attach_driver+0xc0/0x13c
>  bus_for_each_drv+0x84/0xe0
>  __device_attach+0xa4/0x1a0
>  device_initial_probe+0x1c/0x30
>  bus_probe_device+0xa4/0xb0
>  deferred_probe_work_func+0x90/0xd0
>  process_one_work+0x200/0x474
>  worker_thread+0x74/0x43c
>  kthread+0xfc/0x110
>  ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> 
> Reported-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Fixes: c8268795c9a9 ("drm/probe-helper: enable and disable HPD on connectors")
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I gave this a test and the warning is gone. Also, HPD works as expected.

Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Tested-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Cheers,
Laurentiu

> ---
> 
> Changes since v1:
> - Fixed drm_kms_helper_enable_hpd() to call enable_hpd() instead of
>   disable_hpd().
> 
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 110 +++++++++++++++++------------
>  1 file changed, 63 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 7973f2589ced..04754bb7b131 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -222,6 +222,45 @@ drm_connector_mode_valid(struct drm_connector *connector,
>  	return ret;
>  }
>  
> +static void drm_kms_helper_disable_hpd(struct drm_device *dev)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_list_iter conn_iter;
> +
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		const struct drm_connector_helper_funcs *funcs =
> +			connector->helper_private;
> +
> +		if (funcs && funcs->disable_hpd)
> +			funcs->disable_hpd(connector);
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +}
> +
> +static bool drm_kms_helper_enable_hpd(struct drm_device *dev)
> +{
> +	bool poll = false;
> +	struct drm_connector *connector;
> +	struct drm_connector_list_iter conn_iter;
> +
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		const struct drm_connector_helper_funcs *funcs =
> +			connector->helper_private;
> +
> +		if (funcs && funcs->enable_hpd)
> +			funcs->enable_hpd(connector);
> +
> +		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
> +					 DRM_CONNECTOR_POLL_DISCONNECT))
> +			poll = true;
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	return poll;
> +}
> +
>  #define DRM_OUTPUT_POLL_PERIOD (10*HZ)
>  /**
>   * drm_kms_helper_poll_enable - re-enable output polling.
> @@ -241,26 +280,14 @@ drm_connector_mode_valid(struct drm_connector *connector,
>  void drm_kms_helper_poll_enable(struct drm_device *dev)
>  {
>  	bool poll = false;
> -	struct drm_connector *connector;
> -	struct drm_connector_list_iter conn_iter;
>  	unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
>  
> -	if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll)
> +	if (!dev->mode_config.poll_enabled ||
> +	    !drm_kms_helper_poll ||
> +	    dev->mode_config.poll_running)
>  		return;
>  
> -	drm_connector_list_iter_begin(dev, &conn_iter);
> -	drm_for_each_connector_iter(connector, &conn_iter) {
> -		const struct drm_connector_helper_funcs *funcs =
> -			connector->helper_private;
> -
> -		if (funcs && funcs->enable_hpd)
> -			funcs->enable_hpd(connector);
> -
> -		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
> -					 DRM_CONNECTOR_POLL_DISCONNECT))
> -			poll = true;
> -	}
> -	drm_connector_list_iter_end(&conn_iter);
> +	poll = drm_kms_helper_enable_hpd(dev);
>  
>  	if (dev->mode_config.delayed_event) {
>  		/*
> @@ -279,6 +306,8 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
>  
>  	if (poll)
>  		schedule_delayed_work(&dev->mode_config.output_poll_work, delay);
> +
> +	dev->mode_config.poll_running = true;
>  }
>  EXPORT_SYMBOL(drm_kms_helper_poll_enable);
>  
> @@ -567,10 +596,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  	}
>  
>  	/* Re-enable polling in case the global poll config changed. */
> -	if (drm_kms_helper_poll != dev->mode_config.poll_running)
> -		drm_kms_helper_poll_enable(dev);
> -
> -	dev->mode_config.poll_running = drm_kms_helper_poll;
> +	drm_kms_helper_poll_enable(dev);
>  
>  	if (connector->status == connector_status_disconnected) {
>  		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
> @@ -710,8 +736,12 @@ static void output_poll_execute(struct work_struct *work)
>  	changed = dev->mode_config.delayed_event;
>  	dev->mode_config.delayed_event = false;
>  
> -	if (!drm_kms_helper_poll)
> +	if (!drm_kms_helper_poll &&
> +	    dev->mode_config.poll_running) {
> +		drm_kms_helper_disable_hpd(dev);
> +		dev->mode_config.poll_running = false;
>  		goto out;
> +	}
>  
>  	if (!mutex_trylock(&dev->mode_config.mutex)) {
>  		repoll = true;
> @@ -808,30 +838,6 @@ bool drm_kms_helper_is_poll_worker(void)
>  }
>  EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
>  
> -static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
> -{
> -	struct drm_connector *connector;
> -	struct drm_connector_list_iter conn_iter;
> -
> -	if (!dev->mode_config.poll_enabled)
> -		return;
> -
> -	if (fini)
> -		dev->mode_config.poll_enabled = false;
> -
> -	drm_connector_list_iter_begin(dev, &conn_iter);
> -	drm_for_each_connector_iter(connector, &conn_iter) {
> -		const struct drm_connector_helper_funcs *funcs =
> -			connector->helper_private;
> -
> -		if (funcs && funcs->disable_hpd)
> -			funcs->disable_hpd(connector);
> -	}
> -	drm_connector_list_iter_end(&conn_iter);
> -
> -	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
> -}
> -
>  /**
>   * drm_kms_helper_poll_disable - disable output polling
>   * @dev: drm_device
> @@ -848,7 +854,12 @@ static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
>   */
>  void drm_kms_helper_poll_disable(struct drm_device *dev)
>  {
> -	drm_kms_helper_poll_disable_fini(dev, false);
> +	if (dev->mode_config.poll_running)
> +		drm_kms_helper_disable_hpd(dev);
> +
> +	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
> +
> +	dev->mode_config.poll_running = false;
>  }
>  EXPORT_SYMBOL(drm_kms_helper_poll_disable);
>  
> @@ -886,7 +897,12 @@ EXPORT_SYMBOL(drm_kms_helper_poll_init);
>   */
>  void drm_kms_helper_poll_fini(struct drm_device *dev)
>  {
> -	drm_kms_helper_poll_disable_fini(dev, true);
> +	if (!dev->mode_config.poll_enabled)
> +		return;
> +
> +	drm_kms_helper_poll_disable(dev);
> +
> +	dev->mode_config.poll_enabled = false;
>  }
>  EXPORT_SYMBOL(drm_kms_helper_poll_fini);
>  
> -- 
> 2.39.0
> 
