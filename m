Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615C766399A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 07:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5EB10E544;
	Tue, 10 Jan 2023 06:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2043.outbound.protection.outlook.com [40.107.8.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C80510E544;
 Tue, 10 Jan 2023 06:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7cXS86e/fFd+4UmmBbqeWCWqtq4hCMaGWNwnGLcpbFYkqYc4qq4kHr9DUf5rEmnJ490XhEmNPgQj/dzGUsdxvQiDEv1y/Ik/pL9ytbwmqlmAXHMb9rOhyNnIp1msG9mpV3ta0T/jrWaxmlacnroezRj+N0MlXCrlWCxNNWvqDsGekgvFOma37P1Cj+6qwWvFJpP3HoL9xBOau0iJrwBAxN5z8tO8736Q7ox0EnHUphKP1IHEUdEoeHH+OTKqOGQzlTukS1ra2Bx/Xn9ySJL5w+lgTiKyhJrZTcql+oARFh7kg9hvFHkSNe74A7BJdxn/aicNrHq2/PZNHo1U2mpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mx359cZl4hZK2a48xEsAq4Tl4CBNZZpuGFy1afnICAU=;
 b=PdeFUF79KXBBstvYo2biQliSNnpuDt3XFoV/uOHLD4pwRRKnkvoBaQnmsKizr17fdBm39DRXs5ON8xn/VilhlhiJ5D3eetkouB+JHEJPB6eWbAJ28O3tk8LPQfDKHXatSV8OSdVw2q/7Wj7QuCwx1Ci08Ta+6j7Lfv0RQ76sB9P0eIFGMNnHGzSGcAP+9bQvUvA5uRr/Fxt03hLJDBWxs2XmUseNwZHYI+m8riP+zQFs21OAlxGsbRncIWtvgBTOiRKQsaEus+Ivgb/RlyddC2L+h6pMoGtSsGTevxuaPrzjH7hmcYCkzElRQl0dgzO5/8qkYnUhRjrBShV2tYaSnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mx359cZl4hZK2a48xEsAq4Tl4CBNZZpuGFy1afnICAU=;
 b=OnflrgL8X4BEaRcMclv6CCqPdMLKmZgj/qq/uO7Hv4nqoYFm6SDxmJlE6pJKGIfV9iWCHecedNSi4BuW+IzdeoDKHmyFw4EtE5y4MxCiqK/PNwp89C9W4TXiSDYNId5WtooN7ENWr+GpfOdWqfANLLfTF5H0CNesMCYscrDn/xM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by PAXPR04MB8621.eurprd04.prod.outlook.com
 (2603:10a6:102:218::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 06:57:16 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::738c:a9cb:7b8b:4033]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::738c:a9cb:7b8b:4033%5]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 06:57:16 +0000
Date: Tue, 10 Jan 2023 08:57:12 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Message-ID: <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org>
X-ClientProxiedBy: AM0PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:208:122::22) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3902:EE_|PAXPR04MB8621:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca58e5a-6bfd-4e9f-f442-08daf2d7e88a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yNyN4zRKve084AnlFnKnhLbW7+uoigXMM+SNIHbycaqaXJ4hYMXXzYeP9ROICJNwKVklpyaCm6mBcOc2F8PgCNBkDIdJnJC6zJR9OCH3p08spYEGAKRCiLsqtHGvb5HqtZ9UuTrQtZ2JGxxzj9xpHE6h+caqJQ5eTtIEbWeIakjSY6CxUgXxn7lW7T3oMiDmk+h85X1DOlQAhNWx1UUV5oJTDOuQYVPZc55J2gsYFBT1im+NeAo0mYejor93IPwOlQ+3xBfm1AP+jLgDJxSB0jMi3YXYBl2/9/CXFiqJgaiSKOZz1hbOGcAcu741KPPwOLoEvFN33ARtPSaMypP0i2L/uEJxklqWEpO8FDgMoGxiHz6I0lSRQN4V7TBOeqBvs7p52x8wiU0BXJtmoUUAxhCCCMz8n0BxyfD6XticTD9136hBFg2k51PdHlW7mfsaZJB8HNa8GJkuKjkwYR8Vzj1mU/9Zfx270lHZzVDwrkfZ1nvtp9TC5AyQxqMP23r0dMXsRH/YZ86t216JTbxbV28wNdJ8o9q6F6epD2Ljj41R2msCpszEWK7Zh7ib7bElrI8zrmhZPvGZuGwvYYIQcep3khdoyVsR2gtkLTG/BYPRg5v4F1F133Sf1qCX4vJw1UgRC0idUQIqxWbvYq+Cxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(8936002)(2906002)(5660300002)(45080400002)(41300700001)(7416002)(4326008)(6916009)(8676002)(66556008)(316002)(66946007)(66476007)(44832011)(54906003)(26005)(9686003)(6512007)(1076003)(38100700002)(86362001)(186003)(83380400001)(478600001)(6506007)(6486002)(53546011)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xDKH4u/PqWgz3AEV3dULz3P6lTBW2chaUQ40u9iE9Beig1NWnJ/SBRAa1+P/?=
 =?us-ascii?Q?qd6gGVXuNfYHQobi3NBJT+Ldshc9rBmHTSajEpIHVwIe+ABWRsWYGACrV9RA?=
 =?us-ascii?Q?GWZd+cdBRLlxo0uCTfTD76JS63NmMxr+zE22QjHL7V2yjS+1Eq9wdxM/t59n?=
 =?us-ascii?Q?7TrCRlW2/SVqdQnIuOt/AsFhJAw82+WDqYGdKnjSZuRcQds81jCHA8b13ar1?=
 =?us-ascii?Q?TG6kl+2aOaXykwjoCDv+qLXLAvXwInRct6m5ooWCHPd31hnlL8Vn9JljYf6r?=
 =?us-ascii?Q?+wKA6uyUpnP/20V0BGGidJlYUgTu/njB/SoSHC+//R8r1dHr5+yd/x52XJDy?=
 =?us-ascii?Q?nKal9YzXQE//gV2q510jxySYLfW7skXHF/SGVPww97LtS/0JFJhLFV87RoLz?=
 =?us-ascii?Q?Eu70NiZtKnxxXeYt40oT4+Hn98TZBv66wKhhE7+APUmSNu1752Wf3u+m+KIV?=
 =?us-ascii?Q?FkGDOhDAZiyIWtuF+fTT+ZqTf9t3xNHj5m+j0T3e2x8Ozhyf5A5E5qKPdLc8?=
 =?us-ascii?Q?QicIyzdDF401i9AkjbKUwES6nHgCY7E/7MKOrc9N7ZqesfMU79BaPR3u3JVQ?=
 =?us-ascii?Q?HxkYJ1bA1tuceHvzTvl1oNxYr29lwD06MGBcvNcdE/QZGd/mzoRJlUhrEeLW?=
 =?us-ascii?Q?/kKF6B4hGAqgg5KCUxlfkRCPGz29Tghksx3bNnL2xYa1psFj9Sq9w0oodWXb?=
 =?us-ascii?Q?7v7xXtJWqx2Nt79XdFxohZrqAuFrPA8VC6852ZAyDZHwMMZZGSMs6YWwtFeE?=
 =?us-ascii?Q?c6A12mjn4wP6/zzKWl5aabJU0rf+e5FZyxTNXnl54NQN+qhTiOzDb7yqqnUI?=
 =?us-ascii?Q?T2xnxCdaaB727IK1/XJ/F7a/MHQbQg/9L1peoT6sJUNoQpcVQeU5xszF2NQT?=
 =?us-ascii?Q?WXS9aqPhrFLKszah/GqS0E4kTOH40LxJggLk/h9dVBuVMc1nLaMMnNdSqGJs?=
 =?us-ascii?Q?RSGuer4nTK+rHYlRGV1DZT0dcMT5zRmm7CRiEmVqY1Fn2BCzyq/I0jHtjifF?=
 =?us-ascii?Q?DY58YMEOwmwJE2ShP4puQbns6Ca94a1AsG6VcXm7j25j9zcLLu1/6g1k42r0?=
 =?us-ascii?Q?CDZXJcXNPXG+AkSZDSIIGLk7g7eJUcfrFGB1FEpNqpvU3l9U6ZX50fc1+M+5?=
 =?us-ascii?Q?OzV9bdlnmaYaCxuHdSgi4sr++AVahaHD2TvY9KewEwi7/Aq3dFd07ZSmpSm4?=
 =?us-ascii?Q?Q2zD57HBBIb7YeoU+V/p9FXfVe+Q42/lQPy71rVYmDHY5JoaR72egyMhgqTM?=
 =?us-ascii?Q?cTbet1nLUuDXTH9clpXSuNzR5BcjObMLnvP5LEMy/2EYzkQSvfITsUO9rWC2?=
 =?us-ascii?Q?PSrnTplA/UeexTHmea0oVmE29FKY9dEO2cXsKToxMPJgAhnonmX6ueXorqgo?=
 =?us-ascii?Q?hSIilIOciI6s+LX+VNcYhIQOaL10mG4CukfgoHHbFl/iA7vDaDgdD3fnzkvu?=
 =?us-ascii?Q?WU2vqgwBJQQEWKmMtmSNrm5BXSHrTBtCtVlG0YYzoX5eAk7HnP4nUkpB5oWV?=
 =?us-ascii?Q?SQznGrvX4z8OHHKodIsADbgTzO5qdJaEFSdzaVaxEvmi2GMQR/SpUIRHMb3v?=
 =?us-ascii?Q?mGkQSvanS9SLVU5e91N15TiWqxPOWvTOXCbHPrph+YzU97rHwnNr1euWaPmx?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca58e5a-6bfd-4e9f-f442-08daf2d7e88a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 06:57:16.6219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASH73FG+lD9MgO+DUigwqFZBuvS6QkEaiFxDBFJi2OGoSnJGdtvX4RAn/9W4q2cpyDC2fp29sqDTXfifv1o41A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8621
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

Hi,

On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
> Hi,
> 
> On 09/01/2023 18:21, Laurentiu Palcu wrote:
> > Hi Dmitry,
> > 
> > It looks like there are some issues with this patchset... :/ I just
> > fetched the drm-tip and, with these patches included, the "Hot plug
> > detection already enabled" warning is back for i.MX DCSS.
> 
> Could you please provide a backtrace?

Sure, see below:

------------[ cut here ]------------
Hot plug detection already enabled
WARNING: CPU: 2 PID: 9 at drivers/gpu/drm/drm_bridge.c:1257 drm_bridge_hpd_enable+0x94/0x9c [drm]
Modules linked in: videobuf2_memops snd_soc_simple_card snd_soc_simple_card_utils fsl_imx8_ddr_perf videobuf2_common snd_soc_imx_spdif adv7511 etnaviv imx8m_ddrc imx_dcss mc cec nwl_dsi gov
CPU: 2 PID: 9 Comm: kworker/u8:0 Not tainted 6.2.0-rc2-15208-g25b283acd578 #6
Hardware name: NXP i.MX8MQ EVK (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : drm_bridge_hpd_enable+0x94/0x9c [drm]
lr : drm_bridge_hpd_enable+0x94/0x9c [drm]
sp : ffff800009ef3740
x29: ffff800009ef3740 x28: ffff000009331f00 x27: 0000000000001000
x26: 0000000000000020 x25: ffff800001148ed8 x24: ffff00000a8fe000
x23: 00000000fffffffd x22: ffff000005086348 x21: ffff800001133ee0
x20: ffff00000550d800 x19: ffff000005086288 x18: 0000000000000006
x17: 0000000000000000 x16: ffff8000096ef008 x15: 97ffff2891004260
x14: 2a1403e194000000 x13: 97ffff2891004260 x12: 2a1403e194000000
x11: 7100385f29400801 x10: 0000000000000aa0 x9 : ffff800008112744
x8 : ffff000000250b00 x7 : 0000000000000003 x6 : 0000000000000011
x5 : 0000000000000000 x4 : ffff0000bd986a48 x3 : 0000000000000001
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000000250000
Call trace:
 drm_bridge_hpd_enable+0x94/0x9c [drm]
 drm_bridge_connector_enable_hpd+0x2c/0x3c [drm_kms_helper]
 drm_kms_helper_poll_enable+0x94/0x10c [drm_kms_helper]
 drm_helper_probe_single_connector_modes+0x1a8/0x510 [drm_kms_helper]
 drm_client_modeset_probe+0x204/0x1190 [drm]
 __drm_fb_helper_initial_config_and_unlock+0x5c/0x4a4 [drm_kms_helper]
 drm_fb_helper_initial_config+0x54/0x6c [drm_kms_helper]
 drm_fbdev_client_hotplug+0xd0/0x140 [drm_kms_helper]
 drm_fbdev_generic_setup+0x90/0x154 [drm_kms_helper]
 dcss_kms_attach+0x1c8/0x254 [imx_dcss]
 dcss_drv_platform_probe+0x90/0xfc [imx_dcss]
 platform_probe+0x70/0xcc
 really_probe+0xc4/0x2e0
 __driver_probe_device+0x80/0xf0
 driver_probe_device+0xe0/0x164
 __device_attach_driver+0xc0/0x13c
 bus_for_each_drv+0x84/0xe0
 __device_attach+0xa4/0x1a0
 device_initial_probe+0x1c/0x30
 bus_probe_device+0xa4/0xb0
 deferred_probe_work_func+0x90/0xd0
 process_one_work+0x200/0x474
 worker_thread+0x74/0x43c
 kthread+0xfc/0x110
 ret_from_fork+0x10/0x20
---[ end trace 0000000000000000 ]---

Cheers,
Laurentiu

> 
> > 
> > After a short investigation, it seems that we end up calling
> > drm_bridge_hpd_enable() from both drm_kms_helper_poll_init() and
> > drm_fbdev_generic_setup(), hence the warning.
> > 
> > There are drivers using the drm_bridge_connector API that also call
> > drm_kms_helper_poll_init() followed by drm_fbdev_generic_setup(). So,
> > they might experience the same behavior, unless I'm missing something...
> > :/
> > 
> > Also, even if drm_fbdev_generic_setup() is not called in the driver
> > initialization, the warning will still appear the first time the
> > GETCONNECTOR ioctl is called, because that'll call
> > drm_helper_probe_single_connector_modes() helper which will eventually
> > call drm_bridge_hpd_enable().
> > 
> > Any idea?
> > 
> > Cheers,
> > Laurentiu
> > 
> > On Wed, Nov 02, 2022 at 09:06:58PM +0300, Dmitry Baryshkov wrote:
> > >  From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
> > > DRM driver do a proper work of calling
> > > drm_bridge_connector_en/disable_hpd() in right places. Rather than
> > > teaching each and every driver how to properly handle
> > > drm_bridge_connector's HPD, make that automatic.
> > > 
> > > Add two additional drm_connector helper funcs: enable_hpd() and
> > > disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
> > > is the time where the drm_bridge_connector's functions are called by the
> > > drivers too).
> > > 
> > > Changes since v2:
> > >   - Fixed a typo in the commit message of the second patch.
> > > 
> > > Changes since v1:
> > >   - Rebased on top of v6.1-rc1
> > >   - Removed the drm_bridge_connector_enable_hpd() from
> > >     drm_bridge_connector_init()
> > >   - Removed extra underscore prefix from
> > >     drm_bridge_connector_en/disable_hpd() helpers
> > > 
> > > Dmitry Baryshkov (7):
> > >    drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
> > >    drm/probe-helper: enable and disable HPD on connectors
> > >    drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
> > >    drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
> > >    drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
> > >    drm/omap: stop using drm_bridge_connector_en/disable_hpd()
> > >    drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
> > > 
> > >   drivers/gpu/drm/drm_bridge_connector.c   | 27 +++-------------
> > >   drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
> > >   drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
> > >   drivers/gpu/drm/imx/dcss/dcss-kms.c      |  2 --
> > >   drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
> > >   drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
> > >   include/drm/drm_bridge_connector.h       |  2 --
> > >   include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
> > >   8 files changed, 59 insertions(+), 81 deletions(-)
> > > 
> > > -- 
> > > 2.35.1
> > > 
> 
> -- 
> With best wishes
> Dmitry
> 
