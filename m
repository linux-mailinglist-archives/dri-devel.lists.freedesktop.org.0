Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F070AC24D2
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 16:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084A910E805;
	Fri, 23 May 2025 14:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BXjOvPel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C3610E805
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 14:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgwO7q6HxJVQpH2PNdME0jqhqm0KWXJsNsKeXmU5WqvZccUbQkLpDI1hYP7EU+5M4BolXr7I36rMlkW870rv54SaM4sMCJdDhTCFJ5bllIID0IjuqW0dhAz0nne/dovVMa8bs7k3+yijc2gk28+rV/I9Pw9gkkarwZDdedv5vGz5a0gmvQD06isAOfQTjuuQxIzq41MmMcFS5yE5V6OZ8+qQsVdQcE4PX44e0R92F9jdErFSJ5rp7frlSHE3TSP7O8MzzozwAXNXqikvZ9q5zERaSIFhBC5x8pzoe0W2fpTkLYvz3OaFlmBxkkn8nq8ru1JlMgui2u4AB4541FoNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sF1vOiZ8qYgMeBPsv5N4KAaHHZJJhBSruIP+bWVPD5k=;
 b=hVsix7upKrozHMUAK/nM9bFcAlYirqtF8u3VHYO3x01g6kCIeQxJIH8MONqIgMxxPtyIqgQdaMvsn4J+DXWMrSTSg8gwt4ffgm4w9/EmN7veX68JjlIFerbwWAkqpn/aZp8Ut1OtEYDeeyQX24pA9mluh+K0OGHN9NkCKu+KczSA+ExG/ytUTCcXuIicS4OnXJst5xtB/Ve9+aBWcchz514j3At/YcHoohr+huCFNnEnrBjEiAVvlkczgHClKqP78bTNkgZv8vsittGPGVvRBvdMf/MuXCs6QkMo41FsiUi5isXeulv3p3jHMkmJKInfVvdqSFstrgDfm77hyk+75g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sF1vOiZ8qYgMeBPsv5N4KAaHHZJJhBSruIP+bWVPD5k=;
 b=BXjOvPel7/A0B1XRzz+pDFzWQk2cBVunPlKawpI8vtsuEraf/WW/y9nyk8txBvQUtwD/otD0p6CbKp9RKottU6P9e9iQATROBKqXJ0yW10dfdvmQF4796vRhFnmYi/4zcwEZfDZAelmROkx/71V4AUZJS3Ji6ZqIr1OFkaIX5vQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYRPR01MB14157.jpnprd01.prod.outlook.com (2603:1096:405:220::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 14:16:34 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.021; Fri, 23 May 2025
 14:16:33 +0000
Date: Fri, 23 May 2025 16:16:17 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
Message-ID: <aDCDMdhJIFa-4qVX@tom-desktop>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
 <174778079318.1447836.14176996867060604138.b4-ty@oss.qualcomm.com>
 <TY3PR01MB1134687A2A762FE803EFA04F28698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAO9ioeUf_nQXfP490fDx0Ord55z6EsR+3SOhcee2B-ymewkuCg@mail.gmail.com>
 <aDB8bD6cF7qiSpKd@tom-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDB8bD6cF7qiSpKd@tom-desktop>
X-ClientProxiedBy: FR2P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::12) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYRPR01MB14157:EE_
X-MS-Office365-Filtering-Correlation-Id: 89740aa0-a678-4252-30af-08dd9a046bc8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aQ/b6JfbWU3/TfoMA5bG/SWHh5gjBV2UvXGZMc4nyCFrbnZPgg/V2qSTL6sR?=
 =?us-ascii?Q?1jYAnBHAwkAMX18/4O+4+M3xrCdAgNykEBEF32xoE79Ra7q0nD1L0LDzZjLh?=
 =?us-ascii?Q?gV6tDGAnH/2139qqJLBNKmKdlzdECayvaS3VzFHyxZEzsdVa4hBncWKScMJx?=
 =?us-ascii?Q?0CMJoqGmku+9S9rHBFLBgkTHwV4s/Zq+Ywd0qKco7MXVWThLIARsh1g5DLpt?=
 =?us-ascii?Q?RBpxbZEhMkosRPStB8z2m2ogHSrWec9bh7w2oQXzoERol715qCJYs5IQTVVC?=
 =?us-ascii?Q?gBEiSEoqf4wL8U9fFNGNp29qIKK1CmPMZ2tl7ryFdhBxzL6puq7xM11qZABR?=
 =?us-ascii?Q?uLxwI6qBNkPy8yq+i8yYGj6NwskcFNQrySBhK03nQln7hR/iGSbFrVbLTIf6?=
 =?us-ascii?Q?MzFC5idEFGBfw9AhxmdXRbjTABQEVOArhq709echuCatQmO9rEjxt1NkrJU0?=
 =?us-ascii?Q?boM+aEDIrveBXOD1NMRPkem79l0xpQY3IusCDSyDSICuR8iP2TMFC+fqLypY?=
 =?us-ascii?Q?783S7PfQ97NQy8pnLwSeMcUqWEwr+yTEucqa22tdQeKnoyp2mhYHlTYhmV7T?=
 =?us-ascii?Q?YBxSO0biLS1f3gx158UG92Jj6dXyKAT97+g7UFs05gLo0LQ7GEUuTLePd89z?=
 =?us-ascii?Q?+Qxr6EoO1af6FI7T7xZeg9+/wYisy1gcChxZYOubPDzy3e28062aYjJ8J91e?=
 =?us-ascii?Q?ldPTViELFfG/s+Xpb9FFH0SxQal6t9+VaCE8G5/o1yXsvcC0F6aGOV/EBPxm?=
 =?us-ascii?Q?GoHZmr/9ItsQRnhw1eTCqB5o0slKLizG2m/FTpjDVJKY5CypTuLVCStKyN38?=
 =?us-ascii?Q?tbnDPjvISi8FU3ev5QMzWBGhpjnG0kN25zx9C10GTMGI/S1Judtrekx/A/O2?=
 =?us-ascii?Q?AeVBqMfUaxm35uSvF4txCxyzWkm+GYyRS10MGULPqiwJgxSyN5O6j43eqgSv?=
 =?us-ascii?Q?FE6ayZeVPHUX1f927oDlRq83xtT8rgUWHbeeWhgc5rJZcSCakjuOZHgRLOED?=
 =?us-ascii?Q?AsRRL3Lhkcno2oajxAwSJlUv7hfJbmQQha5VfmVpSObaZrqpb4s85yhM1Vx+?=
 =?us-ascii?Q?ssgTq+8P7N+sToZSCna/kIbf8/mLNRt9zlJVMvpRx/KGCYA2yQWLIETiiHQ2?=
 =?us-ascii?Q?1LnuCnLSZQwFyuW7xqIaegpI2JQ9SBW5A3SEeBOk0ARyC/zPSLLGonkWXvAz?=
 =?us-ascii?Q?x0KN7Vz3x1A0mvTckLMdyhtON7Bq6JBwpBS2M537Nj7klFksm+wdOraJKACR?=
 =?us-ascii?Q?Tgr7JmmLN/NO2ccls2jtv9bkBFJu95MZipDCToICyT9giEav7KxDMhVg1yet?=
 =?us-ascii?Q?ANhJc9YO/G46jag3pYbbhHJNDx6nzLDP4TfTYm9bqLWcere748hx4oRRsjtk?=
 =?us-ascii?Q?axUWR/hr2fJ3e2N1eY+Oa0Ycxc4/wYb0lvVzBMaqNroJoUPYP9Igz7mXnWBa?=
 =?us-ascii?Q?R0b2bcE1TOXNqB7BmSmRAirVPX/sceRlbCcgluMK4LtbVhUVcPjNMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hDbjgXSFOUFGfYmKRdtASdGaZdh3VFBd3pCMWVqnC67UAgL/KjryaeJzSD1k?=
 =?us-ascii?Q?lPqChS+MIu9SooCuKLHVWRGK3fZdsRqFcx4YJk2EdcDNgDHSm2Fk8Xv+ldO9?=
 =?us-ascii?Q?Ud/lz3xowBZMUAihUZv+Huzd7Me/Gpko0GMdjkPt86SbBr2NCdkmgVcZDx5y?=
 =?us-ascii?Q?q8p7WOL4Cw+1PRwQoTYhyuwFnicRi6o+X2hUZluMGOGEOtOkGbabfC89YJF+?=
 =?us-ascii?Q?2ifY8CtZHq4mWKeCAeO8GpnVmScZjU3zN1x4Cn6jVi2zx+7qFc8IVNx6o7di?=
 =?us-ascii?Q?p97qQoX/5f/gO99XS+YicC8opP49DcrIlP6PMc6iPSL3X3bpn3ByM82GBFrI?=
 =?us-ascii?Q?Ot+fXBGTi9aO6PCnSHztdSumwk7r9vhfQaAVZGSjBDhuxf3cnGJi+CaHeTTn?=
 =?us-ascii?Q?oTn8gO7Lv30SeZi0lGw5fuMNB2rnT4arWwO3JGlZz6+DA8WlaR+m05fRqUv1?=
 =?us-ascii?Q?Cr7aWHcWgIachW2U2SqlKHiKaHC4+1wSYLvtAloQVhWKHc7t3XFJ6fKSmuAh?=
 =?us-ascii?Q?z9/QO1OVmlp+1kzZ75fT94xpiN8ZCTmAwZCun2GrFeuG9v2My/a+tv1gMzw6?=
 =?us-ascii?Q?FTBExSz6XQaQ7f7cS79F9T4e26L9wzl1dEATpMsoz0JAqMRJkhiQnLS6RP1C?=
 =?us-ascii?Q?qbembgupRAe9knLjqOv8nIpm+AlyHFMZXzjFGvmFPgaquK0Vs4mhTCeeosiZ?=
 =?us-ascii?Q?hnNymJK7fWRJoeCsAw4kA2eWh7lnWbDkBm/9QrPWvx3a32FyA6M1fagGx1R9?=
 =?us-ascii?Q?DZ1vklRGzN02mpnpbG+iRsOiXU1FEH7qiA7GwZoHu4JL3nlxOvIdc0mNq07E?=
 =?us-ascii?Q?TZQu8v9BVkgpYMdISzH9qLB++fPOfwfd+HxK0W/5eYvqx90Sss/irka8PPh0?=
 =?us-ascii?Q?REoDjen05xAAphcB/fcLv5kU0El/7ofwtdiDrTxZikhmO9dOPgDQN4cgbniP?=
 =?us-ascii?Q?/I4WdCCFg0NpjHcF//LnZgxascy+0KFMduWeyb0Zab3MEWQNfFrsPv+o6K10?=
 =?us-ascii?Q?YI+cweJBSgWh1s5D/V+zaRAe+UJIIZt4jnDl3+5xdXC+Od3uDBAayG3N8/MC?=
 =?us-ascii?Q?r06dDpgEV4FUcmHINMSnr+sTiySma6mcxsgZEzSvA+IGKKxsr+aXEEhAqUUd?=
 =?us-ascii?Q?7ftOHYN3sGOSFZKjHBRvLNjmweGVM/Iqhk1oyXE2EiPDdrnxgOwIwuQfSo24?=
 =?us-ascii?Q?2mu85b6LAawEsiFro2X/Wd00KhJbPPvozwl1rZx4Ki7LpF6Ht9k2QFlBRHRh?=
 =?us-ascii?Q?EgR9gAyvMQOfvO1SbE77cLW4Nvsym88slODDPm4QrewEec4jeci5r4ogg2oP?=
 =?us-ascii?Q?xTPPJtOFIFWkNPL8LeB5MXk97ZNZLCU7frbozpbKViFBg7HBlxetBReGyVf/?=
 =?us-ascii?Q?IHsGTNvCzwn08vYIj2Qg1P+fBheRcC1SJvk6i4ux+Xk27JuXQf1OBF5iPYiG?=
 =?us-ascii?Q?fpBtw/pFErKNBZ45bIv2B68RLc7VQQq08ISESAjSb40rJ1OTfsa7vAQtk6vh?=
 =?us-ascii?Q?M9XtjK/Y0uYqJTSS2YzLv9UL1AHn+Mns/9NIq59tX6ITLyjz/ybuYtwbkAnu?=
 =?us-ascii?Q?WJAh2bdrrbv1dxLQZlsMjUiSM1MNulKOX8vY6sCfB/ngm5Vg/vbwyTF/qRGq?=
 =?us-ascii?Q?1sDO/FFYoXNNUfXjXDTvqV8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89740aa0-a678-4252-30af-08dd9a046bc8
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 14:16:33.8730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhcJIVz1ESdWZYDxAqSool5xtChoi+kK0oloFjwpjdFMHnVrqtsgL8gX2djNtmIJ00eN5NL4O1D7WGRalkW1gctWHfUaPXhOyG+ObQmAWAxBKAx9uC4r5utk6Uc9OHkb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14157
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju, Dmitry,

On Fri, May 23, 2025 at 03:47:24PM +0200, Tommaso Merciai wrote:
> Hi Biju, Dmitry,
> Thanks for your comments.
> 
> On Fri, May 23, 2025 at 09:37:19AM +0300, Dmitry Baryshkov wrote:
> > Hi Biju
> > 
> > On Fri, 23 May 2025 at 09:17, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > >
> > > Hi Dmitry Baryshkov,
> > >
> > > Thanks for the series.
> > >
> > > Looks like, After this patch, when I change resolution using modetest it is not working.
> > > Monitor is showing out of range/No signal on RZ/V2L SMARC EVK connected to ADV7535.
> > >
> > > Not sure, I am the only one facing this issue?
> 
> I have the same issue using RZ/G3E Smark EVK connected to ADV7535.
> I found that switching back to the old:
> 
>  - adv7511_mode_set()
>  - Using also old .mode_set = adv7511_bridge_mode_set,
> 
> Implementation fix the issue on my side.

Diving a bit on this issue I'm seeing the following:

root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
[   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
[   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000

root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
[   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
[   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56

Same result but I think bad timing:

 - old: adv7511_mode_set() is call before rzg2l_mipi_dsi_atomic_enable()
 - new: adv7511_mode_set() is call after rzg2l_mipi_dsi_atomic_enable()

What do you think? Thanks in advance.

Thanks & Regards,
Tommaso

> 
> Thanks & Regards,
> Tommaso
> 
> > 
> > I have been testing the series on db410c / adv7533, but something
> > might have changed between the testing time and the present time. I
> > will try checking it next week.
> > 
> > In the meantime, you can probably try comparing what gets programmed
> > in adv7511_mode_set().
> > 
> > >
> > > Modetest works fine with 6.15.0-rc6-next-20250516, where this patch series is
> > > not present.
> > >
> > > Cheers,
> > > Biju
> > >
> > > > -----Original Message-----
> > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Dmitry Baryshkov
> > > > Sent: 20 May 2025 23:40
> > > > Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
> > > >
> > > >
> > > > On Sat, 17 May 2025 04:59:36 +0300, Dmitry Baryshkov wrote:
> > > > > Currently it is next to impossible to implement CEC handling for the
> > > > > setup using drm_bridges and drm_bridge_connector: bridges don't have a
> > > > > hold of the connector at the proper time to be able to route CEC events.
> > > > >
> > > > > At the same time it not very easy and obvious to get the CEC physical
> > > > > address handling correctly. Drivers handle it at various places,
> > > > > ending up with the slight differences in behaviour.
> > > > >
> > > > > [...]
> > > >
> > > > Applied, thanks!
> > > >
> > > > [01/10] drm/bridge: move private data to the end of the struct
> > > >         commit: fa3769e09be76142d51c617d7d0c72d9c725a49d
> > > > [02/10] drm/bridge: allow limiting I2S formats
> > > >         commit: d9f9bae6752f5a0280a80d1bc524cabd0d60c886
> > > > [03/10] drm/connector: add CEC-related fields
> > > >         commit: e72cd597c35012146bfe77b736a30fee3e77e61e
> > > > [04/10] drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
> > > >         commit: bcc8553b6228d0387ff64978a03efa3c8983dd2f
> > > > [05/10] drm/display: add CEC helpers code
> > > >         commit: 8b1a8f8b2002d31136d83e4d730b4cb41e9ee868
> > > > [06/10] drm/display: hdmi-state-helper: handle CEC physical address
> > > >         commit: 603ce85427043ecb29ef737c1b350901ce3ebf09
> > > > [08/10] drm/display: bridge-connector: hook in CEC notifier support
> > > >         commit: 65a2575a68e4ff03ba887b5aef679fc95405fcd2
> > > > [09/10] drm/display: bridge-connector: handle CEC adapters
> > > >         commit: a74288c8ded7c34624e50b4aa8ca37ae6cc03df4
> > > > [10/10] drm/bridge: adv7511: switch to the HDMI connector helpers
> > > >         commit: ae01d3183d2763ed27ab71f4ef5402b683d9ad8a
> > > >
> > > > Best regards,
> > > > --
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >
> > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
