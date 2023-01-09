Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D670F662B0C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 17:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5654D10E19C;
	Mon,  9 Jan 2023 16:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C363810E19C;
 Mon,  9 Jan 2023 16:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eog4izySKgbxweSgxq1BBqh9T88N29z2DZpZxLJrlZ/vg1oaKDPYT6hVcr6S1ox/XcWjwzAtybvXnVG7bmu4bbgVVq2BzaPjOyLt7DzxaI9HBQwjziMwOG7iBZkTUwaog657bOr+oyV6MpVcWklqeIdxpTRqbPm1i7BNkwXVT4NawVT/PAjNmorFH8A39dJvdTru0GnJIxWJjS95qvm0yTZTJ2tRmaSo6aQ7k3x0l7B4eIa+rGpCeqi74fse/2LL27gJt4hNKdCEIKAXRN8H5w4QQW03guD8mVzRT5gG1tapIb607EFJEr51tYA7dWoF8iuWDGVsiW2//+zLmv7IGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeLhaays3PUukQgNCgSoX/pYGu4CEYNNLZtRaq14+70=;
 b=Zjlpn+l6HMQWkj77rmtBgXOGLVggKLWD+fNqIkadg4GYzk5x+HrFGfBv4j9vOSW7eSL+IGYWVfxlzjxhRnlfz2FQHIQ4ONac2vsLTl51KSQguXK+9dn1nAbJy+9PFAEsgUkYX7EkXmjAXEG2vV+pUR818Aj8/8A/7hmYcPb5C6j2iIHUygcJe/R0JBq+NVG9NwceybT3b+6BHy/SaBHN0p2AOhZdcwF5/YH0wResNk92A+GowLaVI1UMEjQS4PTigZ/0ugYZ86FcPyvhDSN5ktFSOhXwwT+l3R2k6Z1gK4unq8VeJy5uqnsOhn4Ef+RwPFaqSTMB9jRnZue2hCIDTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeLhaays3PUukQgNCgSoX/pYGu4CEYNNLZtRaq14+70=;
 b=ZSTQnFCE53053rRt9hEOzWgdOAIFWMvrV93OLRK3BkImEfcO2kJJUMOAKhfG5I2HM8IP7vfAG9FOXIer6sMs7KWAsZnuTIlHLpt67tqiwWEpAHTE+JKUvZacd0QHYe2U90nWqWjNwcml26fdzRiR8Oo3+P1KqdwscIME1T7fp1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by PA4PR04MB7840.eurprd04.prod.outlook.com
 (2603:10a6:102:ce::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 16:21:45 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::738c:a9cb:7b8b:4033]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::738c:a9cb:7b8b:4033%5]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 16:21:45 +0000
Date: Mon, 9 Jan 2023 18:21:40 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Message-ID: <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
X-ClientProxiedBy: AS4P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::14) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3902:EE_|PA4PR04MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f3f63d-f181-4d55-4d32-08daf25d998c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7o7WMzGcIVcXiVdBn+PVZH7jyeKsP9Stkl46tLxN99ObZCJZhE4s1VRmDuc4A13m7/SvDMpXk78irIw1uE/V4GoZ/X2TNl+iXaBVzvvt6RdpC+VYCclDDP3cLITnGvtsuUxGdqRH5pInB3H78Ug40jnKkMQ4Jy3YanrBlBv/ZWGP5PSxdr9hr1ccDMfNt4KsGoCtNiw0HpqIB8bndUTHKBBs6+ASfs0SW+d5a4DVukUKlDnZOlHRWeNZYHJ5g0sZk51bJTxUBVOODFoTvQajLFpB8VBoWg0TVljRlBJBl+D3Je+yO3yrNecelMrFH7f9Uc0ZnhG0D02VQHF+KFgffh/S8xrBybqIMqoaHceuwKCr27Q212f3MZk0AvCNlh9/pdrUwoKy2IUAUZOf3vkVAgtyyW65eb05H9JyvZv8mBDm8nm9hAEo7dEiF19p7C89L4SQpa8fdk83Qbvn8uHjIqgvvivV9Uyjin9MEu98zqfGRjsEy4XIInQAiGKsELvl71KEi7AhKYXCNzyMWjVMIP2F9m5EayEpyVHczu8Nl5JtsGS7UBUPGXRvVFCpdFPk6BQtfAQpnTyFv0ndS4j9E38r9lBtxbmyd+YC0+Ck7hJV3W8Zk0slS3k7xseHQ30DRlS/CF1FzMdySNghW1Sopg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199015)(478600001)(6506007)(6486002)(6666004)(1076003)(4326008)(9686003)(186003)(26005)(66476007)(66556008)(6512007)(8676002)(6916009)(54906003)(316002)(83380400001)(86362001)(38100700002)(41300700001)(66946007)(7416002)(5660300002)(2906002)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/PjlJDxu8EWb7nfC9m0aRk5EngF10H2W8SU6KeN4SYtIW7gQ4fDYF56MchB5?=
 =?us-ascii?Q?beD0EEXQX065DB7mlpGGVd7DxwKgqv5p+X2VfjvXfipRoss1gd38rbAaWvkK?=
 =?us-ascii?Q?pOuHNPoBQ3pdkmHvp7S9qUGRl95/PZtqeeluxriVd+FThYx9I2w9NKCyIItL?=
 =?us-ascii?Q?HrIgkQqKSfJpkQ9eKcJFlcd/hEgDJLW076whROrl50jgfKa62oFR45Ybgb5q?=
 =?us-ascii?Q?nIC9kEhg2Z3FcP08hUlbdYTqc1wAGTAGPmJ1DYysS1t7K8cZ7D2V7hh+eKNi?=
 =?us-ascii?Q?9OdWzTPR7xd5IyHll1CBAeTOR1oabwlyQtLce5ulGCgVrd+t6zaODTwU8E+k?=
 =?us-ascii?Q?szaDxw4vtliL7O7CQQehJsimV773zaXYvnVbfWiBO40Y8ayJn9ELNr0gfjVO?=
 =?us-ascii?Q?N39KlyWzIHoRZWd6g5ckIMv23mvKQcqpSn+3YH+Gbfir2Qf0LjSEbyx6UtYJ?=
 =?us-ascii?Q?Qdry+hwpgaZQoBU35UcDVr4vjerqRIQ5yeUud5JL2NXJSTZFBB5tvhZu+FdA?=
 =?us-ascii?Q?7tlAjyZ0q8xcrRBFjtVFqWGK+6qSaWXug6wbuMk0uXiyjfiNXfoxnxwoua5D?=
 =?us-ascii?Q?EjODJvkDZ9UNedR9ACNL3QWE1WjpMXXcgAQqjFuaMVvCNZzAbd/d3N3WrqLV?=
 =?us-ascii?Q?aXhdN8lQaYwOtedMFeRHRXN0S17mfVeZxLqLvYGZA6feM4yNuFhjO5OH33yO?=
 =?us-ascii?Q?L9dmF81hFq/KvX4yUd1dA7zqK432WrTrFwmGGkegalmxPcD9sZ/+kTogwJD/?=
 =?us-ascii?Q?LDw5nJ1uP7rWpRCSm0BNarvlQazAKEnB3dVcD+32HQSEarMKrlM8TysNX7L7?=
 =?us-ascii?Q?RGo6S8HVF9qIkHrbDQADQxuEUnsjO0QVUDVHn4rfzH0rhSHUTUmEVHfc917M?=
 =?us-ascii?Q?DA6SSiD2BxKps3ja8S9x6cCLav/leYPEjFZqXY7P0DfwcmdA1D+7StC25Rdd?=
 =?us-ascii?Q?mwD/NHA+f/lOJ27cNfW5SVdLj8Wr8ikdw/fuT1eYCb5PFzrc0Yp0CTmsjV35?=
 =?us-ascii?Q?5oQIpdbGiX+JY4YnaIwXbtpziUN0PggCO6vgpGR6YSP9Ltenu4GdtcirEXqK?=
 =?us-ascii?Q?2CDm5uIJYJJZ/gBLxKFM3GkKkJfh7b8bAbdH3q+WVRh8x/FDGhno7UPQyUuJ?=
 =?us-ascii?Q?S3wpf0U5EeeS1ocjalVXj6NRk/9pa2OAZ+FtpgeY8mWTJklK5i2Sfua390sn?=
 =?us-ascii?Q?T99eaC4hQ2uPj6F/d2l8UC+D7UUaZaHVU07vvIMOUyhB36i94y8BkRJXtxl9?=
 =?us-ascii?Q?L/f1PWymNDeHywHv/KWWBfysz5r/u8FF+o82hVWQOHTDDu2XnBxF2puIljiD?=
 =?us-ascii?Q?PNWDSd08mUpuH2XDFX4nczJ4BTpZxWv+PFR+BrUBYmYh7EafrxTiPke+F/hs?=
 =?us-ascii?Q?X0AUZxyJvP2GLRZI6WReK6vIqVehe9OqZEGGxgbpfC1GRdjUEriqfmtqMu4R?=
 =?us-ascii?Q?/gKGtXjYDg5tX0iHw83D4ePhglhqAh1kE4Vv84RlS7H0cEq+c0f/iYo1e3QH?=
 =?us-ascii?Q?w6YIm15EXj60nryPpXJ+RkHIh+NUIzSda5/BHVeaQcv9LSJz308u5s1P42WT?=
 =?us-ascii?Q?WjFxf0oBStgW8LKXBXxhoyiqGnBsY347zLOvJr+1VdC0ZQxT5zeLWlQOAgox?=
 =?us-ascii?Q?uQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f3f63d-f181-4d55-4d32-08daf25d998c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 16:21:45.3335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVqCVzmORgEZ59MhCxotsZdIQW+rk6iIJpF5SaQeEo9I2ak42+8tz+atjVyITWIGI9BvuT949iCLpbLbOQORgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7840
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

It looks like there are some issues with this patchset... :/ I just
fetched the drm-tip and, with these patches included, the "Hot plug
detection already enabled" warning is back for i.MX DCSS.

After a short investigation, it seems that we end up calling
drm_bridge_hpd_enable() from both drm_kms_helper_poll_init() and
drm_fbdev_generic_setup(), hence the warning.

There are drivers using the drm_bridge_connector API that also call
drm_kms_helper_poll_init() followed by drm_fbdev_generic_setup(). So,
they might experience the same behavior, unless I'm missing something...
:/

Also, even if drm_fbdev_generic_setup() is not called in the driver
initialization, the warning will still appear the first time the
GETCONNECTOR ioctl is called, because that'll call
drm_helper_probe_single_connector_modes() helper which will eventually
call drm_bridge_hpd_enable().

Any idea?

Cheers,
Laurentiu

On Wed, Nov 02, 2022 at 09:06:58PM +0300, Dmitry Baryshkov wrote:
> From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
> DRM driver do a proper work of calling
> drm_bridge_connector_en/disable_hpd() in right places. Rather than
> teaching each and every driver how to properly handle
> drm_bridge_connector's HPD, make that automatic.
> 
> Add two additional drm_connector helper funcs: enable_hpd() and
> disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
> is the time where the drm_bridge_connector's functions are called by the
> drivers too).
> 
> Changes since v2:
>  - Fixed a typo in the commit message of the second patch.
> 
> Changes since v1:
>  - Rebased on top of v6.1-rc1
>  - Removed the drm_bridge_connector_enable_hpd() from
>    drm_bridge_connector_init()
>  - Removed extra underscore prefix from
>    drm_bridge_connector_en/disable_hpd() helpers
> 
> Dmitry Baryshkov (7):
>   drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
>   drm/probe-helper: enable and disable HPD on connectors
>   drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
>   drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
>   drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
>   drm/omap: stop using drm_bridge_connector_en/disable_hpd()
>   drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
> 
>  drivers/gpu/drm/drm_bridge_connector.c   | 27 +++-------------
>  drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
>  drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
>  drivers/gpu/drm/imx/dcss/dcss-kms.c      |  2 --
>  drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
>  drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
>  include/drm/drm_bridge_connector.h       |  2 --
>  include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
>  8 files changed, 59 insertions(+), 81 deletions(-)
> 
> -- 
> 2.35.1
> 
