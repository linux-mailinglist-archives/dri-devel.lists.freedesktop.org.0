Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6AB668EE1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 08:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDAD10E997;
	Fri, 13 Jan 2023 07:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64E610E997;
 Fri, 13 Jan 2023 07:12:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUj0AcwKXSwgmMygjoopJlEHcT4ucF/hODo7nM/wCUw8uJFxQgVm7Lq7KEylfA7YuzKY9n+p8dKuFpcobhCc0fSzDWbj5F2CiaGWwifLvYHzNEpGExdoY4JZci4XaYKDvMDrutK669xqCxFVgb2jEhIDHnIIKpbFm2CMTrDcx7DJVI5yndFOrJ8pGCJ24G1haKtLhWqf3DD1JKWCMmepRItWOoefe1l2ukBq0SR3J77eHcdELzeDW6KCryHVTYIYqbXfHxl16J62T5dwejrwXUuIFaLDr/MNabn3PJo1936KG+8dHe04G4aeV0Endkv/IPN7m45WjtC05/dqBUzKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dZoP2v9tIOjZrhfMI1hxvWy+urzoJIhpYuMoTTL6K8=;
 b=A8rEC9KqsXTlYYvC0yOk7GQun+fi/SI4cWgS8GfLluxz63eW5GnopxGmw5EX/dXtWTCSWDlthLrVqaXQt1u4KvMJ8Y1mKss4awgJojkxejR9l+Fe2/p4otqaCQQpphpw3M3N7Gr2cR4RS2kh0qwShNTEuRGp97r3w1hMgC5Haai3kzYSz13yCxc6wDh1/gMmusuBFSUP4xHDiBSaQZv00e4rV6oVABB5Vot4fYNGMugvOATfx1axWQ7+s0DXjfY8R3DV/5hfpI1BxU65qN2oxe0kBes4uRTTzVCFnOHF9V3Ho+Wnmzqa73WiRhc+z5jFyp20JMDDYBf4Nw5iBk4x0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dZoP2v9tIOjZrhfMI1hxvWy+urzoJIhpYuMoTTL6K8=;
 b=cs2lLGfwTDppq5TXwpTnVpEzjHO2xtoeYYT+m6UksUKLtQrUz4YuKlngBg9xoatr/XrlFrIh8L3tUpWeFL765Xi74X7MRh2Ev9MNglHXCM29XhBOLFZAyLhtbC8wlCG589HiGdgyeoFoNf/crnWLnGh6l+O02hW8G1pYXQqCaoo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by DB9PR04MB9377.eurprd04.prod.outlook.com
 (2603:10a6:10:36b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 07:12:23 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::738c:a9cb:7b8b:4033]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::738c:a9cb:7b8b:4033%5]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 07:12:22 +0000
Date: Fri, 13 Jan 2023 09:12:18 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/probe_helper: sort out poll_running vs poll_enabled
Message-ID: <20230113071218.kzlb5rdbdipopr2o@fsr-ub1664-121.ea.freescale.net>
References: <20230112154247.1532202-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112154247.1532202-1-dmitry.baryshkov@linaro.org>
X-ClientProxiedBy: AM3PR07CA0071.eurprd07.prod.outlook.com
 (2603:10a6:207:4::29) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3902:EE_|DB9PR04MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: 017659c4-bc1b-421e-d189-08daf53583ae
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f3cqbmvsp8VaR0nTEQAWM53m9UhXWPKgsfCMcACXQ2bhdkvztd4YW4W3z2n0rNfzPWpwoe/1/Z15ZuA0JzPGURqzKX84sfaNhXUc9NYK3sL4fNX58wlrhodTLVhFAR3cXd/BW+Qa0Ro3Cwr0UOmdL6VO4Jvq2WBOzct9DnJsVBvn6KZvZxMDjr955zVb7+HdK2KQdH8eIsR0Q8WdiQvlpT7+6ir2QFXEwWZzmPKeSYEUHCBmcXCtjCfGM786gS/JiGhvryHed2V3d8lido0RbXrQHJgOBOT0Grn4yzVTxOS/pAdztsbiVI/AqSY3WmAQjDXNWc9QmUkzTHyT+2ReRi33pG19vcWz2UFEGjqo9iCavfVnY5HwkpuJ5WHL3p4pOHcbxUBFXI+L7Htq+b9faj3u9GGM8Xs2/PEmPP9MQDXwNo2/UiYpfA8DfYtkGHfz7Kd+MotHYU5pj/9pGA7h9Ddv0BaVjld2TMsFQU1S4XDkdV1sQa9C5oDbD31yKKQ3VOv2I/YvQkggmRxudpAcRJ+5NtDWekLUA73y2T6bsn57i0/L+jsqg6tGNgypLP7UsJ8ch5WpdKMbJbRBDjhymwcPQScw5qLWPXAD9FPGFSzdReAKc11HE32WbjP546Dq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199015)(6506007)(6666004)(7416002)(6916009)(5660300002)(2906002)(8936002)(83380400001)(44832011)(8676002)(66476007)(6512007)(38100700002)(41300700001)(9686003)(4326008)(45080400002)(6486002)(478600001)(26005)(66556008)(186003)(66946007)(86362001)(1076003)(316002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wMKuPC6yp0mrwY5/ivuc5DSMbZglXG/T8apIESAV6C5nH5z3JVr3qhzHINYe?=
 =?us-ascii?Q?sMubYTtBtKBam+Mvt8vM/gXNVxVBc4TMCwo9R/0Y/fzJy/uI4aRnRerowyxD?=
 =?us-ascii?Q?yyM8Ha7AO0a6JBB6LKZKqM39mqo40m2v7Eh1GlQ4O7UtpYQSCzuLqbNp02w8?=
 =?us-ascii?Q?9sVY1DBNwhmj141uT6TPWrVaplI9uNSEKCRErF5p15QlGrgtTWYDspK42EYy?=
 =?us-ascii?Q?Vg5b1CLXOLcbzwP24nOCoOTwb65Sp59QT0IzPbLpAE+nA5jnFKXShi+Uurii?=
 =?us-ascii?Q?olaeX8UaSLfm0BARkZQtlA0YvsAYoUq85TuXL3z0s2Fm3O4kzd+OLiVGt/ex?=
 =?us-ascii?Q?EGy29rWrPLFYP9ok0Alxydr2gECHiiG2k/3inAtaalxdfMYDj3/+2yfDPZme?=
 =?us-ascii?Q?N10+s13TXtle6WlrUUBKBnQSL9UEaFfvrQdDlXz0Ke7d4SA87P9qYmniNETI?=
 =?us-ascii?Q?Q59QYGltF46KqSoGvzCdn9QFKZvDxBCA2sNjD7fannDHbGKuQcPhsQIA3EEv?=
 =?us-ascii?Q?kI/WgMBbSsbvGkYQSid5D0P8HjnG/Le7owVSYfJ+EM2eVNbP9r2vJOSolEIH?=
 =?us-ascii?Q?7WZZhfhp/s8eM0Xjr/+ZwIKnDmO31pN/c5ZWkfztmLH/LuMqAZGRTxzEjx2D?=
 =?us-ascii?Q?KRhBXRLnEfKkar+hKC0vBRECmmTVoY/r07VsISBooHCFTYBVSHdUa1y+Eatw?=
 =?us-ascii?Q?bGFQjkIbRMjWJzrVHErHTv4/9kr3cEJYVlzOf94zP9LI8tQQBqWBvhybeTbo?=
 =?us-ascii?Q?ylPSt8jRHl4xyg7Lb9ijSEBfiECIo/O0lPjauD3SqtQtGLgczqGEC675lVz8?=
 =?us-ascii?Q?hMh+BWbjbWsNPtltWk6TtFF1Z7GtidK6xf2xQIvZXo5AoWxXRA5sKExF3VSY?=
 =?us-ascii?Q?hpNq79gjFvxbrL1oPGD5hozaPtYP78NoqCCuO2TQ7fOxsI1tWOzoNGDRjMY9?=
 =?us-ascii?Q?UFFtUtNOr7tXx1leidBfzAu3HuWmXy4F5ndMfNc3bGiAE+keM4ThJ7ki9OiU?=
 =?us-ascii?Q?bLP0QOqi327lL8UG8Yo/Lh2pmeEWeE4jXnUqqKhaP+owaMAHvd/4ZU95FT5M?=
 =?us-ascii?Q?Z0+M7+H+6AvIdYVNiWWXF8BQLX/UpQGz69w+tLXNp7CP9dGkTwcJ+aRUVr+Q?=
 =?us-ascii?Q?TddrM+V28UfBBVEQ1EVPiPje0f2b0613D86zMz8a+jo4HGZv+YjP8XR+n0ut?=
 =?us-ascii?Q?4A67akvMmK3Ptz6xCEyKARZXqvpWMVL+Mj0y2iqxtItPHyJBht/31PfheUke?=
 =?us-ascii?Q?TzahQwxX5Dsr3V4xMvZe9R/jFSD3Qgs+3HtKHy5PzoYVGPmVpdFx/yU1BXWm?=
 =?us-ascii?Q?SH5jY8utWxTnmYutSdgUDk8TgY4uYebBeha3ulq/rvmcJ0uPj9Cn/0yTQdBL?=
 =?us-ascii?Q?6pm/dl1m0xNzIn+qbsZl0s9trdbPo7evoEM6ve/RUSQTz2FosXfQ9nDQCs1U?=
 =?us-ascii?Q?EpXlopCdA/SHKcti9/4Wuw663kyo5thtlRGjGr/d40QMO8FEQ6dihxaE7t2y?=
 =?us-ascii?Q?63r/isUv5AE9LsfIuhziFkfpS2hkgYc/Ov2FmAtoitiwXB5XfwzSDVMKKEPy?=
 =?us-ascii?Q?FXHw0lkI9ln2loiwvAoGbz+xNHrfALleqTkunGno5HBHw0YotKzH2B6O0d4e?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017659c4-bc1b-421e-d189-08daf53583ae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 07:12:22.5814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mT1QbdMSaBdaNAYW8lBIKN7f6qGy2v3YGAgEEZlsg+TNK+Fr1pP8DpJKXdN8OvBz8SiF5+mgo4RH7H4WMPAnpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9377
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Thu, Jan 12, 2023 at 05:42:47PM +0200, Dmitry Baryshkov wrote:
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
> This fix the following warning reported after merging the HPD series:

s/fix/fixes/

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
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 110 +++++++++++++++++------------
>  1 file changed, 63 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 7973f2589ced..ef919d95fea6 100644
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
> +		if (funcs && funcs->disable_hpd)
> +			funcs->disable_hpd(connector);

I believe this is not right. You probably wanted to use enable_hpd
instead of disable_hpd on these two lines? Otherwise HPD would not work
at all.

Thanks,
Laurentiu

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
