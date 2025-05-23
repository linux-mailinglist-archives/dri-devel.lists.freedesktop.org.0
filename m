Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15D0AC2473
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 15:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C036110E2A9;
	Fri, 23 May 2025 13:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LRQio/G1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D6F10E2A9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 13:47:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAXJ9UwuRqSlmoDdRGBFbvfiD2hDSI32vWKbzxiJ9J4H9Nfn/bI+vBCQIkAh85R7CFmUiTMvUBi0xc2cM9zdYCyLKwm2/DutaEHvTACLNHz1ue4t7HnvOCEyho3SBF+1yjcGvs1luedROu4mdBXy2+b1xZedEE71jknsyZOKlrRcZUDNGSWJ2MH0slvwYnHnoh9pvg/VMKpI1QGnnPXlV/3eGlW8P63bR6G7uXFVC9yMMnKSPQ+iZzVkb4UbS/74Po8459PGRolWnE2EZXL+z4UsgOA0LU7bAZlCRggRAK5lKH1Dcd+qWVulozh5Kj6fOv7v4FfZUb6E/riyDTOwsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tr9cEUfIG8bfJeGswhP+5V0QZ3bwNbkqhjjlB50EtNw=;
 b=OgKpdjKNf1ltPHU55FptX/uHOoUUapeqfI5rtTRPOZ6577XhNkR4ajFaVG+PKVRzX49H42HNnn2b8fzCepzz3GhnEUMJzmHYnFqtLCxB32zwUcaJ9HE60h+0Ezl0/LeH53Wkm7bL/7ULjtStw1G3JhP/aL1PeP3e42q5Ge4nv8lalByBuszaAzW33w2ZJfYjGmYcX+74w3Bgcrq3iVkMW05Ny3Jjb1EihUIk/eqTLvSfwErmEy/It5wQEJ4NO45eXTgMaRdAOj+R5jHiF3VODQqlvjfpuuxWf3Umn5jqNlqQMXENfm7viBqnTiaF3VcZULpvxtmC9u7A5FFz7F5YIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr9cEUfIG8bfJeGswhP+5V0QZ3bwNbkqhjjlB50EtNw=;
 b=LRQio/G1llT4YV6oPdS7zcVSmKNUhtkL+remteHxAZB2UlkxFuiruxU3T23Q41AzRyYnCxiLtHZnl6BhrLrvzQibeOAdBZNYq1fsUkzvzFRNvLLm615dMwinR1gRojKVONfVDxUhXL2+9UzwIT8IPtLk4S2uCYhwHIDQC/ZxHdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYVPR01MB11364.jpnprd01.prod.outlook.com (2603:1096:400:36b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 23 May
 2025 13:47:48 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.021; Fri, 23 May 2025
 13:47:48 +0000
Date: Fri, 23 May 2025 15:47:24 +0200
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
Message-ID: <aDB8bD6cF7qiSpKd@tom-desktop>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
 <174778079318.1447836.14176996867060604138.b4-ty@oss.qualcomm.com>
 <TY3PR01MB1134687A2A762FE803EFA04F28698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAO9ioeUf_nQXfP490fDx0Ord55z6EsR+3SOhcee2B-ymewkuCg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeUf_nQXfP490fDx0Ord55z6EsR+3SOhcee2B-ymewkuCg@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0332.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYVPR01MB11364:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b355983-8408-428c-9cca-08dd9a00677c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HfGRJ36m7Bt5vaU018WXPcPpvQV5kFlKbx4I1WosfcPcyW5cSX6UvnoFsr1Y?=
 =?us-ascii?Q?gq8n5R+PWl+h1x78MXRE+ya3QpzXp0RBeTnhbMLWMY6IzOCpeMJqONFelGEQ?=
 =?us-ascii?Q?ZFBPiAkVKBH76pu/I7yW9YBQEyJXEyPO2AoL1ZMRM8Cv642rdsEtp37WZgz9?=
 =?us-ascii?Q?rnipJH9wuXdwOGMZvf5O7Ye/jCaz+bkopIVIp2FTGqjvSkm1CxfArvzVTUuQ?=
 =?us-ascii?Q?lV88BsctDWPrnVmq/YnWMXMW9/xtC7AZixbBtWUnoxVWWD4i4MAm7HlAyTnZ?=
 =?us-ascii?Q?cA8VrZLZ6z/CIiHJGDVqoE3gJL15t1p80GZ6HQbniW26v0kGeXiX1zqlD/cp?=
 =?us-ascii?Q?N8UdjKQMY0wO/bZq0RRVrfMeh6IjguUdxVcDRJLz5llJmIMzAMkoLabymjN7?=
 =?us-ascii?Q?qfKNG4pYXKfgfuajhvpKUqTRKeQjGgmeRBu7SnkLzqSxGCQDLSGY62RQ1PpE?=
 =?us-ascii?Q?AhgOs7gY0zLbRALBtqPrCyfhEn06CWkLF0/RnDv6WDALLxTihmLavw47Donr?=
 =?us-ascii?Q?YZx0ouPpTI+vsF6cXff/LH+2ZIwQqJpajDMFEHeR8lbFVT3MsKpn/8LfqyAj?=
 =?us-ascii?Q?YxpkrWhdBHIbDoIXLEfSthCPOWmjFoxQzD2CBKlQDPavFKuoVAk71Drb4NAN?=
 =?us-ascii?Q?iPrLT033SAjqqxEz6zdUulzLY8RJbeWgm+i4TRbqIII+zZIKmXu98qWi14/+?=
 =?us-ascii?Q?N7XS1zF94vn2D2XttUB9qe8JRKyfdidmkmMrv2fayousukDUz1g80pDSiDr2?=
 =?us-ascii?Q?w5ytq5XK5L90EueKVC/MW9ip9HTnFJ76ONA1s1B/FsP7xTeuAE2QUJ/Hk1Hd?=
 =?us-ascii?Q?P+7GxYQkXne+fZczk7svjU7nAlE8VspZzMHpUjnoaTZxPM4DekwuU81w7xq5?=
 =?us-ascii?Q?GfUmUvgsecAWFy69k3KuMOZkdWFWVhryhocETpwaCQ53qHZaT8CP2TcBwZ1u?=
 =?us-ascii?Q?XcGgN/Rhr28MOCSpKBTuqOPzirqanC3btanRiYnDqcTFuXI+O+MwMWee7ETg?=
 =?us-ascii?Q?3woJ/Ssmwg/m3qg6Y7zLUDA3lC8r8k7mWXf2AwOca55eS7HCY/GJMGENIJ0q?=
 =?us-ascii?Q?9PLTumwh+cUAV8qQRR7zGPTmhIMRQtkRmImabk9ayEiVyq8X5ozJo1FkNETr?=
 =?us-ascii?Q?xH0RrtIGF97xOgqS5aYEzszYHjjmloymKNHt/3LcCTE974B/FhbRyQ6yWHup?=
 =?us-ascii?Q?E7uAZDuxYADZDIIH9kMoTNGjr/xYioOsaC82BGuv8qOUHslrxojU/vauT4oI?=
 =?us-ascii?Q?cXJp/9gi2srGa+pvjigLINe9XKjTS7itrwx30wIcPrFzy6qw1RjwO9s2rOhk?=
 =?us-ascii?Q?vqnK/esv4bIItQ6x8EsOdXMFHkAwSRHBVTnw78aDByEA5VdrntbP++W8/WHQ?=
 =?us-ascii?Q?/QL0U3mlFQuJ2NxYWZ+ACr1TRfGfePXkwITVVsUYjXcGROE6PCqP7A0MImN1?=
 =?us-ascii?Q?l5XhE2iB/o7MWO0fPboKiiKMxZx9IMRHBXr+iQP4ejb6RwKlqfJKxA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cusm01OPJJmgxi2f6M51r94fX0ClWY+RwhulLnU+J/O2O/3dzlAWh+u7wnzD?=
 =?us-ascii?Q?UEsgHNeThsubzS4RcjoXKuRGFYvbmcMnDREfnI1DwhP/KeuUxzkZrgCIvOPu?=
 =?us-ascii?Q?IHyYa/BuYYP7+kGgwoHGB7881eMD56YgYd+5KfQXQgLhFqxcwbMhERTftR9L?=
 =?us-ascii?Q?l67ga9d5l91vnkqQ6VFCfY/Y7mEGL7HQBk3UnKaDuc33p1qOOlXB1q7dJu3e?=
 =?us-ascii?Q?o3bZIfU5P5lcIWR5RpVFv5CAG/c4VBWkxnk9fysWhMrftqBNjdGpQpKQ89Qe?=
 =?us-ascii?Q?BOH9A7uUxjgBv3h1R39QboolKgXXZbIlnNr0KIDRwcO7XppJjIRpvYIPjKA6?=
 =?us-ascii?Q?+bp9e3kj3QkTc0DJF8kTE7KIyG5p9xwbnUAo2DLKJ1U5oRnxAP47zbc6H4Q4?=
 =?us-ascii?Q?dayFYmQWoZwt5jgb+VQa8i0D/sAKtnz/wMcOAvihw8Py0XhrSBafnIe7Rxg2?=
 =?us-ascii?Q?JTv1eJUY0d/tKj7URH0btkkkWS3E0blCL3Z49jt0bq1qsUK+0/e38hIKdG3i?=
 =?us-ascii?Q?Y4DYNyQ61m8OtAfUEvL97TFcOLCJPyvoLFB58sLN5G3OpQCrPHUiL3VrazEA?=
 =?us-ascii?Q?KyS9/fRNlovhBTZaEddQHARXIlJKhD6XUWRMgUo1f+tgN5D/1DpSm2SYWhU2?=
 =?us-ascii?Q?L+cfPJOJVhppmC7tgFOCjsLiCSJky16AY+EsiV8a+wI8eM+75CxE9oc2qbkj?=
 =?us-ascii?Q?VQ9Cd3xyNlxmdUBKrnpIyP8unSAkRWioTCM75oiJslYHPrRsn3ElJvYnyuk4?=
 =?us-ascii?Q?rLbf2BwR4cMbrYpL7Nonhybliww0ntk4D1v8nN19AnWY9S908AQYkXuUyLRl?=
 =?us-ascii?Q?UFExs4dYXIIfXPuMrrJ5aEbM1ldzYiYBKqhSzNiZEC1T465Mp2iMHvXhhmqX?=
 =?us-ascii?Q?QyBiBVp5Ng45p4/5HhDfIBVY3+UD4uCplCpfFsmrcdnTJbDUFBuCHqX4mROA?=
 =?us-ascii?Q?kEczM55uqaNPZSIA93nVZUN/kJ6L8VyIa/rLKW31mKAf0te2UMVAvebgEuI9?=
 =?us-ascii?Q?EO/qE0rnZeGuJq1oKXm49GYYHamwCO3IM7JfirO+Vj1UMt7BkS+IpiQh9Daj?=
 =?us-ascii?Q?cDKJbb2ozccTMSqXhNy3ySeQedSAsxDWDw7nXzq+gZa+fEH90EfzjM++/kT+?=
 =?us-ascii?Q?Uf85lDV2LiameYFqPiKzPjnxwIa4fdhVU3bwqLg+6H8zlHegsXt3QvxwNmR3?=
 =?us-ascii?Q?BY9NwrjrYnpFyscIbON+6cx1QTSSn9sp3bJhi+cGdMEKuLDrSwt17x6YAtbB?=
 =?us-ascii?Q?MKHkpdCHOhkmW5f1YkkSjhpSUGJNAHFjjR0Vl9G7CDq0sBvfq8wW5G/IyhUz?=
 =?us-ascii?Q?eGnVO47TE/4ZYyqYHHaL1ma60sy5gLNKmC7aT+B48gdlU09b7fjj9M/iuxr8?=
 =?us-ascii?Q?+yMMLvd04QS+8pAlyvg0xZnL7QHB8gj/UxdBJ10JkUTNJdK6YqolxqoQTPok?=
 =?us-ascii?Q?5S+1Umv61hF0Wm36mmvzk3+oDThAk6eEoALaAkc7WrNWQnWehCS4M4Gn/4R2?=
 =?us-ascii?Q?FsFuhexn40Rp6Fh88eGfq8wtK5Wp5gGtConnf2KyNJturucNpDw/7PAGaSYC?=
 =?us-ascii?Q?TymhS5KHNK78XRdTqtzVbgR5RsQEYoWeLXOuhVDCXGAJ35+cv2UTYHUiukR6?=
 =?us-ascii?Q?HugvfJcMgYeB6HY/3xbEMew=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b355983-8408-428c-9cca-08dd9a00677c
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 13:47:48.7535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bso9zm96LzRRGOovvOhLiRrSMseRIZrD67+G6z2yKTbpOzOeYviyMcxq7R3U2KdZF2X7zyzIZSxXeKkMhf0eMcY0v9y4MYXiQ2osHFHuVbwEapGuXAgqT3hVRU6aEdtc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11364
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
Thanks for your comments.

On Fri, May 23, 2025 at 09:37:19AM +0300, Dmitry Baryshkov wrote:
> Hi Biju
> 
> On Fri, 23 May 2025 at 09:17, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> >
> > Hi Dmitry Baryshkov,
> >
> > Thanks for the series.
> >
> > Looks like, After this patch, when I change resolution using modetest it is not working.
> > Monitor is showing out of range/No signal on RZ/V2L SMARC EVK connected to ADV7535.
> >
> > Not sure, I am the only one facing this issue?

I have the same issue using RZ/G3E Smark EVK connected to ADV7535.
I found that switching back to the old:

 - adv7511_mode_set()
 - Using also old .mode_set = adv7511_bridge_mode_set,

Implementation fix the issue on my side.

Thanks & Regards,
Tommaso

> 
> I have been testing the series on db410c / adv7533, but something
> might have changed between the testing time and the present time. I
> will try checking it next week.
> 
> In the meantime, you can probably try comparing what gets programmed
> in adv7511_mode_set().
> 
> >
> > Modetest works fine with 6.15.0-rc6-next-20250516, where this patch series is
> > not present.
> >
> > Cheers,
> > Biju
> >
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Dmitry Baryshkov
> > > Sent: 20 May 2025 23:40
> > > Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
> > >
> > >
> > > On Sat, 17 May 2025 04:59:36 +0300, Dmitry Baryshkov wrote:
> > > > Currently it is next to impossible to implement CEC handling for the
> > > > setup using drm_bridges and drm_bridge_connector: bridges don't have a
> > > > hold of the connector at the proper time to be able to route CEC events.
> > > >
> > > > At the same time it not very easy and obvious to get the CEC physical
> > > > address handling correctly. Drivers handle it at various places,
> > > > ending up with the slight differences in behaviour.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [01/10] drm/bridge: move private data to the end of the struct
> > >         commit: fa3769e09be76142d51c617d7d0c72d9c725a49d
> > > [02/10] drm/bridge: allow limiting I2S formats
> > >         commit: d9f9bae6752f5a0280a80d1bc524cabd0d60c886
> > > [03/10] drm/connector: add CEC-related fields
> > >         commit: e72cd597c35012146bfe77b736a30fee3e77e61e
> > > [04/10] drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
> > >         commit: bcc8553b6228d0387ff64978a03efa3c8983dd2f
> > > [05/10] drm/display: add CEC helpers code
> > >         commit: 8b1a8f8b2002d31136d83e4d730b4cb41e9ee868
> > > [06/10] drm/display: hdmi-state-helper: handle CEC physical address
> > >         commit: 603ce85427043ecb29ef737c1b350901ce3ebf09
> > > [08/10] drm/display: bridge-connector: hook in CEC notifier support
> > >         commit: 65a2575a68e4ff03ba887b5aef679fc95405fcd2
> > > [09/10] drm/display: bridge-connector: handle CEC adapters
> > >         commit: a74288c8ded7c34624e50b4aa8ca37ae6cc03df4
> > > [10/10] drm/bridge: adv7511: switch to the HDMI connector helpers
> > >         commit: ae01d3183d2763ed27ab71f4ef5402b683d9ad8a
> > >
> > > Best regards,
> > > --
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> 
> 
> -- 
> With best wishes
> Dmitry
