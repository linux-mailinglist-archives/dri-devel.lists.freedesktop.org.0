Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9F456294D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 04:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26BE10E029;
	Fri,  1 Jul 2022 02:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20087.outbound.protection.outlook.com [40.107.2.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA36910E029
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 02:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y70T+gs4aRWMakpBGki6zKwrQlgM+mAPV+w9MFmI1BQSWBz/VI7T4LL/kEA79ECh+SKYvf2qN1Ursrhd/Qw7ON+p6duuSEUFXoHbyDr/GI8eD33JneRMpEIbyglm+WjFwKlRB+LDh9tQfgC2EqAp8YaDHBGQ2O47nA6dT+obkbD50YuSJTwkNnvvtTDiqps6wWK96wSdGVhTuGo6YmDvxJPOKveOmxbPxZpAIPuxXxkS7qnbSo5ECR1Uykx8xSpsjV1LI/Rm0MF5OGfeaUR9dSiYBzyWi7JtFv3X9mYBCttbMHokbVMdqbeWYC9fLL82fx76KkX/CyMnT1p9qs711A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6yJOlUJ2gX0zpFdmg5XZ7p7wxqk+B9DpUaVD6pGGQc=;
 b=YXJGDOXKtnhwSxMHR7dze7R3tCR+SSyXC4EBQ1aZjblGlwqixzOzAVjF+/lc3rMC8ek3BNgdS1wtProb5O61bn9SwkN/G4RTDUpDovH2W5EaL1CDVAB2cOa1P3L3vAO8BgquzwpLg3zUUbFWjvF5QMAxQBcKHT/UqE/V8W495o8D4cz6NeVHxig4HrTyd2PDiRzj0E3P5mQtbCFGW+udvaugHEw+wfRg5wZZsksvnEHxB/RT4Cbeb61sA/LRqnimq2u9TXiGcVMlmyJuCBOhL77+zgjlQmGJcHroH6v9y7Bz9EUorCZr9OsOXrGTZGjz/eRORc+2YyeHHJSY2F1pbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6yJOlUJ2gX0zpFdmg5XZ7p7wxqk+B9DpUaVD6pGGQc=;
 b=ZARC+dOjLhEwRFIN4rWBzEJ2HyNSXTTMfujmNxHnaWEskNV2YfDrSBuK/7LEoNm9uZIYXHhz67mz6Mgw4WKzFAb4ouA0x9qzgvfNz8ZNq9NAsZaJet0S9AiBNyguBy9zzyXURmbOIKXTTdeJyYwvNDRtXQC7i32LMWqYXLWnVnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR0402MB3602.eurprd04.prod.outlook.com (2603:10a6:208:1f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 02:56:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%6]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 02:56:02 +0000
Message-ID: <f9a50012f0c2977e994669629b38c9d01a7bc91b.camel@oss.nxp.com>
Subject: Re: [PATCH v6 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
From: Liu Ying <victor.liu@oss.nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 01 Jul 2022 10:55:58 +0800
In-Reply-To: <3ebb3f00-d17c-35b0-6214-66393221fa6f@denx.de>
References: <20220624180201.150417-1-marex@denx.de>
 <20220624180201.150417-2-marex@denx.de>
 <2179a7f82a45e5af836ca5bdf28f10cdbeecaf55.camel@oss.nxp.com>
 <3ebb3f00-d17c-35b0-6214-66393221fa6f@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c9f06ae-0b3c-4af8-176b-08da5b0d3b55
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3602:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iq8Bgh3O+MLfPHAao08Ady7iwSUKee4dKO2vGDeB1Igq0pX8/5Zicar6afnyGo0HPfU8/I3VT9XgDvL9hs8RupcW8WkzmYQ/spAkXkqd1hdYDHIpv4HGb5vZYosk48FmvRPqg7sXZZg4M2Wr6sYFOhI6c121to0Nuy1GV70wobkIC/6DJxpsL/1ZYJwmG4aNwbSP5kZQ14gYs/ahXjel8WQY1wLd4l63TS4LPmYzd94Kb7FOYpfcHFjfntow8WdPWjkahCamp3Hbo6ritKHSNEcGDVQpHYwAPeBOSCjBxRYI1mohu+h7sYvGXPSFIndu8Xmy+wB6C3Lie8KFANwraxFNQcXZZGmFiTDx0Qjg8lmYE0QfwAEjMWRWbCqm47lmjwlR2K9z4g7d/L5iKc8HmdlOS0FbAzPtvrNZtG5koWw3lO+FF7O8tfO2UK9viL6YxkIOgKuHDYeNeArN3J1ZbtgsvTn1tTP7pMyAK0lu9m1uhuqRXT7UDSTYjgSiM6ODgmptMoPFl68g9/3ed7KS1EEfuXq3w+ov62RZe0HwixpbTlI7HdPxQERxz6CFxBoTs7l1AieXC9TYttPwf2acelhVIdG9KhdKMr/0bXi6k4bjjFb9BKkGlZ5C/LSJf/PC0FJ2N1Gsx1M0b8Hov56cpJ1+mSChcqDeScusVUP1tf5BtFvQQG+nFlswVPnl7W3xtfrFvj+ijpKwrQPbW/OsFbtvK2MqyEH6l+Pb5Io2+qYWP0RNFXMWyYwmC8PCE2uQB6x7aCZGdiZZii6+o0XZ8eHKcv+iQXEemUpVFqbm1pWYR3Kl+a05lUTOcIDolU/X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(53546011)(38100700002)(52116002)(38350700002)(83380400001)(26005)(186003)(41300700001)(2906002)(316002)(6666004)(6506007)(6512007)(6486002)(86362001)(5660300002)(2616005)(478600001)(66476007)(66946007)(8936002)(66556008)(4326008)(54906003)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXUwbWhhMDRndFdCSXdGTThRem9HZTUwQWV5SktqV2t5WEtwaVVRM29JWDRx?=
 =?utf-8?B?UUxmelJJdFBwSVk2Y2s0dzFLRTVzdmFPamp2eUVod0hzSVFmamlqakVmSGhK?=
 =?utf-8?B?N0pzNnB6ekxVV1JvVDRhcTI1WmtBTUlMVHVIZldwOXRtRnF0T1RLeWhJZk41?=
 =?utf-8?B?Z1k5OHRFMGluQVdscTFISEUrL1FPQWoydHBrTSsvVUhlOWlSeFZLRWhIdnkz?=
 =?utf-8?B?WWhWd0FoMEdJQTRNVWJMZFRCa3lIbGJlUlByUDJ6dXJXdmd4S014YytiRk1C?=
 =?utf-8?B?aE4vYzRlUExNclRGT0JWenlRcE1sUlloKzlENTdJbG0rTjRUVTFNWVV2OFZR?=
 =?utf-8?B?MkpTeHczQjA5OVVWRmR5WngxUFVGcUVQWGxzVk96ZGlyUkZJTnMwSnJFb3Q2?=
 =?utf-8?B?eXJWWVdWaUhHTytJOU9UdVdoY1cvdEFLcWM3UUQ0SFFDOTJEcW5yUFZra1pR?=
 =?utf-8?B?Q0FTREZzcVh3Q1FVOHVEbTNVaGNLenV3RXNtTWgvK094MlBvdEZMWWtMRHUv?=
 =?utf-8?B?SHZZRVd2dnZQR2QwL3RqM0tZSEV6ZDh5SXRTdTMybE5PV0tPRlMzUHFHQjUr?=
 =?utf-8?B?d1h4MUxLNXZFZUVka2VBSzFoQndPZUZvQXFVTVBrdHFjamRXRnB2WDFkdUlY?=
 =?utf-8?B?c0JpZnlQTnNDd0w1UkJubFBLKytNMFYxdkN2dmt1dmdnQit4S0YvRW8vK1A5?=
 =?utf-8?B?aERDY01zb0NxWWozd1RicjQycUdQeEdhWk5jajFsR1B5ZlMwMUFYcHlhV3BI?=
 =?utf-8?B?VjdQckJJWThtVFNidW55NGFQbGtUTUMxZHhUMUpZeElDWFBmSnlaYTlDTDEy?=
 =?utf-8?B?dFM0RmtwK1FsZldXZVBmaVpCeGM0Y08yZWpZcmdRTmZOMm9nbEtOMEx2Myt3?=
 =?utf-8?B?L3dLcjhqbFA4K2pYRndLaVN5NzNtRUNxZGpXeVRRYTRMQ1JGSkxoa3NHem1H?=
 =?utf-8?B?bUN6Z25OenlSY096MUNsdFlkTjd2QkZTUFc3M1lVVWVnU1c5dExxbSthTTBT?=
 =?utf-8?B?Qk5iMHJRcXFuTjVXaHlxOFZrV3Y2b213TnExZ1g5dDF4ODgzancrRWQvTkdO?=
 =?utf-8?B?RDlNZmFkZ1JZRkRONkphU0JSY0h1NmNGTmdPdHJWNnVMQUFadnNOdDNRK3Mz?=
 =?utf-8?B?cmR6dzdKSmxmcy8rSEJPNDdTMHIyM3NUWHdQL1RTcmlteDRkaG1TM3pWU1JR?=
 =?utf-8?B?U1JCdlZzeThvRVQrWFY3R25nMWtubElWVnRwWTlRL0RZRGJ2cVpHK1VocUJL?=
 =?utf-8?B?dExFb1Ayb2phU01xbnVRcURzTWsreVF0emVwRTJEVjl1VjBxdzdZZk8zTlg2?=
 =?utf-8?B?aTdTUkJYK3BaTGFHSFc3dFFYMWU4Q0NkamtXcXdXSDBCaEVlYkM5U0NLWWV0?=
 =?utf-8?B?V2QvVUFGc0hFQkx3MEVLY25uVnh3bEgwMWE0aWFvUTg0Zmo5bG5HZnJzYkJ2?=
 =?utf-8?B?QU9SdkRpUVFVRlNJVTdvSkgvRExYMzR2SFFsV3BjaGhrc0s5Qmp2VklMZDM2?=
 =?utf-8?B?eENvR0xpb2c3NGtweDNYWkU1VEJOL3JtTEJabldQbHZNT1hpekZvb0liclg0?=
 =?utf-8?B?c2RDQkIyWjFlcGR2RFc0UTh2emJKb0JoRnhtWExYTzRDcjBRY0R2aUFRNFpB?=
 =?utf-8?B?L09nd3k3RmpTcGpscXR6UmM4T1Y0eEtXaEswTmZXQ1JhRXVBVlg1cFptSnU3?=
 =?utf-8?B?WHdsZEVvWCtjWVRMY3Q1U0xveDJFQnF5VnczOXczWXpmM1hUa3RrYVovTmZF?=
 =?utf-8?B?Z3IwbGttNDlVeEk1SDF1NnBBSkc1ZXZ4c0t4UWVpNzNEc3pPK01nYnFBR3lr?=
 =?utf-8?B?R2MvZjZGL0hycUhDM0xmSjVIak1RSVRIRWRNV2RKM3dGSnV4SSt4S25QMkRU?=
 =?utf-8?B?SVJ0a0lTa1V2a0hndzdqbm1VZWsxc0N4THY1NVU5RlJ0ODhzTU1EUHdoQ29V?=
 =?utf-8?B?b3V2Vmx0KzlEUEl5c0d4MmRDaG1ST3llNGpMczRzSmZ0RHlPVkcrTmVlYW84?=
 =?utf-8?B?dU9lN0NEZEh6QkxuKzc5U0t3alhkS3NabGlyaHMyK0pJWWhWZm9rSXYzTEF2?=
 =?utf-8?B?TmR5QkFqRmhqL3dhMkNoUDg0Yys1L3FqaXN6cCtVRWZaMU5laHhONGZCUnh0?=
 =?utf-8?Q?dntsHYwG2zknG+HrTH7V3QXhC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9f06ae-0b3c-4af8-176b-08da5b0d3b55
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 02:56:01.7293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xubc+46HMyKULxNaGSfSVJq8wWmPDJ1p/D9SeIH2XJZXjPjmSMB9CNIDIzKhcYjTSrPU2jQze34PhyLBB0HvVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3602
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, robert.foss@linaro.org,
 Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-06-30 at 22:47 +0200, Marek Vasut wrote:
> On 6/30/22 10:30, Liu Ying wrote:
> > Hi Marek,
> 
> Hi,
> 
> > >   drivers/gpu/drm/Makefile           |   2 +-
> > >   drivers/gpu/drm/mxsfb/Kconfig      |  16 +
> > >   drivers/gpu/drm/mxsfb/Makefile     |   2 +
> > >   drivers/gpu/drm/mxsfb/lcdif_drv.c  | 341 ++++++++++++++++++++
> > >   drivers/gpu/drm/mxsfb/lcdif_drv.h  |  44 +++
> > >   drivers/gpu/drm/mxsfb/lcdif_kms.c  | 483 +++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/mxsfb/lcdif_regs.h | 257 +++++++++++++++
> > 
> > The mxsfb-drm driver is in the mxsfb directory as a successor of the
> > legacy mxsfb fbdev driver. The fbdev driver is for i.MX23/28 lcdif.
> 
> That mxsfb-drm is also used on iMX8M{,M,N}

Right. But i.MX23/28/8MM/8MN LCDIFs are basically the same. i.MX8MP
LCDIFv3 is a completely different display controller. That's why
'fsl,imx8mp-lcdif' is not added in mxsfb_dt_ids[].

> 
> > So, in order to avoid confusion, maybe don't put the new lcdifv3 driver
> > here. I would choose to create a new sub-directory in
> > drivers/gpu/drm/imx and put it there. The full path can be
> > drivers/gpu/drm/imx/lcdifv3, which matches the IP name(as called by
> > design team).
> 
> It also matches the NXP downstream vendor kernel paths.

Yes. I don't see any particular issue with that path.

> 
> > If people don't like it because i.MX23 lcdif version
> > register reads major version3, drivers/gpu/drm/imx/imx8mp-lcdif
> 
> It cannot, because this IP is also used in iMXRT.

IMHO, 'first SoC name + IP name' clearly tells a IP without confusion.
It can be used as the directory name.  Not sure if i.MXRT or i.MX8mp
comes first from design PoV.  I think 'i.MXRT SoC name + lcdif' is also
okay. But, i.MX8MP LCDIFv3 will be the first LCDIFv3 supported in
Linux, so it seems 'imx8mp-lcdif' is fine.

> 
> > can be
> > an alternative, though longer directory name. I tend to use lcdifv3
> > since separate directory(imx vs mxsfb) hints totally different display
> > controllers.
> 
> We've had this discussion about naming/placement before.

Yes, in v1 review cycle, AFAICS. There, people did have comments on the
directory to put and too generic namings. 'Lets postpone this
discussion until the technical bits are settled.' was mentioned.
And, at this time point, I don't think it's sufficiently discussed
yet. 

> 
> Placing the lcdif driver into mxsfb would allow code deduplication 
> between the two drivers, that's why it is in mxsfb directory.

Well, again, i.MX8MP LCDIFv3 is a completely different display
controller...  Boilerplate code for things like drm dev registeration
is kinda trivial.

> 
> > >   7 files changed, 1144 insertions(+), 1 deletion(-)
> > >   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.c
> > >   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.h
> > >   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_kms.c
> > >   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_regs.h
> > > 
> > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > index 13ef240b3d2b2..75b5ac7c2663c 100644
> > > --- a/drivers/gpu/drm/Makefile
> > > +++ b/drivers/gpu/drm/Makefile
> > > @@ -130,7 +130,7 @@ obj-y			+= bridge/
> > >   obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
> > >   obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
> > >   obj-y			+= hisilicon/
> > > -obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
> > > +obj-y			+= mxsfb/
> > >   obj-y			+= tiny/
> > >   obj-$(CONFIG_DRM_PL111) += pl111/
> > >   obj-$(CONFIG_DRM_TVE200) += tve200/
> > > diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> > > index 987170e16ebd6..873551b4552f5 100644
> > > --- a/drivers/gpu/drm/mxsfb/Kconfig
> > > +++ b/drivers/gpu/drm/mxsfb/Kconfig
> > > @@ -19,3 +19,19 @@ config DRM_MXSFB
> > >   	  i.MX28, i.MX6SX, i.MX7 and i.MX8M).
> > >   
> > >   	  If M is selected the module will be called mxsfb.
> > > +
> > > +config DRM_IMX_LCDIF
> > 
> > Perhaps, choose a less generic name here in case yet another new IP
> > with similar name in future... Use DRM_IMX_LCDIFV3?
> > 
> > > +	tristate "i.MX LCDIFv3 LCD controller"
> > > +	depends on DRM && OF
> > > +	depends on COMMON_CLK
> > > +	select DRM_MXS
> > > +	select DRM_KMS_HELPER
> > > +	select DRM_GEM_CMA_HELPER
> > > +	select DRM_PANEL
> > > +	select DRM_PANEL_BRIDGE
> > > +	help
> > > +	  Choose this option if you have an LCDIFv3 LCD controller.
> > > +	  Those devices are found in various i.MX SoC (i.MX8MP,
> > > +	  i.MXRT).
> > > +
> > > +	  If M is selected the module will be called imx-lcdif.
> > 
> > Same here. Use imx-lcdifv3?
> 
> The mxsfb LCDIF also supports multiple versions of the LCDIF IP (v3, v4, 
> v6 at least). So calling a driver LCDIF v3 is about as confusing, since 
> you cannot tell whether it is the iMX23 LCDIF v3 or the iMXRT/iMX8MP 
> LCDIFv3 .

IMHO, if this driver is in drivers/gpu/drm/imx/lcdifv3, then people
tend to think it's a completely display controller(not related to iMX23
LCDIF v3). So, from code PoV, confusion is not that considerable. From
user PoV, imx-lcdifv3.ko could be confusing, not sure. Maybe, use
imx8mp-lcdif or imxrtXXX-lcdif?

> 
> > Similar comment applies to the entire driver - less generic name.
> 
> [...]
> 
> > > +struct lcdif_drm_private {
> > > +	void __iomem			*base;	/* registers */
> > > +	struct clk			*clk;
> > > +	struct clk			*clk_axi;
> > > +	struct clk			*clk_disp_axi;
> > 
> > i.MX8mp RM mentions that clocks are pix_clk, apb_clk and b_clk.
> > Why not use them?
> 
> That's only because the DT bindings are aligned between old and new LCDIF.

I remember I suggested a dedicated DT binding doc for i.MX8MP LCDIFv3.
If people are ok with one single doc, then why not respect the RM and
check compatible string to set different clock-names?

> 
> [...]
> 
> > > +	switch (format) {
> > > +	case DRM_FORMAT_RGB565:
> > > +		writel(CTRLDESCL0_5_BPP_16_RGB565,
> > > +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > +		break;
> > > +	case DRM_FORMAT_RGB888:
> > > +		writel(CTRLDESCL0_5_BPP_24_RGB888,
> > > +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > +		break;
> > > +	case DRM_FORMAT_XRGB1555:
> > 
> > DRM_FORMAT_ARGB1555?
> 
> Why would there be formats with Alpha channel here ?
> Because of the (unsupported) overlay planes ?

Because the RM says it's ARGB1555. When overlay planes are supported,
userspace doesn't want to see alpha component accidentally takes effect
when it is told to use XRGB1555.

> 
> > > +		writel(CTRLDESCL0_5_BPP_32_ARGB8888,
> > > +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > +		break;
> > > +	default:
> > > +		dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
> > > +		break;
> > > +	}
> > 
> > lcdif_set_formats() is called in lcdif_crtc_mode_set_nofb(), so no fb,
> > which means the framebuffer pixel format should be set in plane
> > callback.
> 
> Do you have iMXRT and are/or you able to test overlay planes with this 
> IP (the overlay planes which are currently not supported) ? Or is there 
> any other iMX which has overlay plane available ?

I don't have any i.MXRT SoCs. I don't have any SoCs to test overlay
planes, either.  Seems that there are i.MXRT SoCs are/will be supported
by Linux, so overlay does need some attention.

Regards,
Liu Ying

