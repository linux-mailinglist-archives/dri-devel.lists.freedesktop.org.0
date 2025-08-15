Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF1B2881F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 00:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE59310E9B8;
	Fri, 15 Aug 2025 22:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYqskcfA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FF410E295;
 Fri, 15 Aug 2025 22:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755295221; x=1786831221;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NctTyrugcnQ7GiYzx5xcGYTAU7h6kGlci9Y+NQnxcB8=;
 b=iYqskcfAJYbCUY4rEWfewI1OxqF0K6f3W5gywwzPABu8Ja+S5jzJ9dtf
 NWPYaZaaLw+LDTG4ODJO7HwjFOxMjk2uj5rP1B5jprlR81jZeElaawSXp
 ZVnOKI/anglgaOZAPRmM0MI4Ny5C+aISzFOg2E3gUNbS9zUhhjBOTUdVP
 9tnTzz9xaByMc1poadt7y0P6Rv+CPY4A3jqqi0z+vzDeaK9xUjLP60aB0
 7NLgCi9k9Xz18AzZtGSBAUKYdbWuDqRifDCMV+y07Pdym7jk9Rv2YTmpr
 WNUb7GiPzVZky5FMLPWm0mjJtI49ObvufxZL7KpmtLO0J4iEm2ShC1NgF g==;
X-CSE-ConnectionGUID: csuXgn8ORmy3M1agoWMNfg==
X-CSE-MsgGUID: 7rDtjXGaSHuUEAyY5/twZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61431292"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61431292"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:00:20 -0700
X-CSE-ConnectionGUID: 0NY3mN0aTam3+VpVL/WneA==
X-CSE-MsgGUID: 2WlK8U6OTHO+xAeyr4fRgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167487023"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:00:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 15:00:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 15:00:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.86)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 15:00:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqsdrEPHzV0ERqUpqNnS2kZKtmOe/Qvz57IeLdxlLjni6YnYoIRUmGQI54tCVi5mxXjKOmwge56D0tCe4hPBXduvcCi/qNOl37guE0xPMvG5c8pUqjaocOuQsqd4fkXegnxALb9abWt7eGWNfV1Qzu7h4I7nUMst8wjbEIT6cLQAFuYdSJ7Mw2+8bCFYPj2AjIm3fbyt2L/8K1TjIFyXSvH8Bt8550G5SbsZ7t8rx51+VXUkERT6jLUALDZf/hSo5yo09NFgzHUFMCW6bPGK22Mxi2YoxdszGNm92Wb6WV3ZkcpeVkHKw3tzr9gu80xyol5UKX2ykSvl1ZwzZEOwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dwyjq24uhq7/ftKRvdyJYGTWZfXYPPQBIpv0rTCvOLk=;
 b=dbR00x/PhTZPUInLdGgYOwGrJPbP9NaoUy2k+KXfn3bFvLEiA/KI/p0jmGdnu2s+w7eZeEsdXIEpqQWTUi1QVFTCwtqLTdkHLg2dOX97I/+JOQclIWjShv4/BhLIdY7UTXck6Zc6mj38xgajXflR3jzzfhs/4GTMy+XOplmh8oGESWTxtoe9oGIe5Lhs/1KCg5Hhu3OaB1o+UnNo25mkdle12XuTxXEkJoGjjV5ooClc7rWEPBGbUQuNI8LkUhqzKKAEUtYvIZaFJlROXRwuEBxGsZKwdmfFTxm4uXk5na71OT0u4Ue/qVbMExm+2RukYLQjPsLw2TgLIGc9hGMffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by BL3PR11MB6316.namprd11.prod.outlook.com (2603:10b6:208:3b3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 22:00:07 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 22:00:07 +0000
Date: Fri, 15 Aug 2025 18:00:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, <Ruhl@freedesktop.org>, Michael J
 <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>, Anshuman
 Gupta <anshuman.gupta@intel.com>
Subject: Re: [RFC v5 4/5] drm/netlink: Define multicast groups
Message-ID: <aJ-t4lgSp86uB81b@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-5-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730064956.1385855-5-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::48) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|BL3PR11MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: 27186c75-bd74-4df9-0efc-08dddc4718c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EBaPuF/G45JL0jYmS5BqxkdqO0yYxWquyaE9ViPfWJB9v88GhCwFNsbrSC4h?=
 =?us-ascii?Q?YwzglgF3ii9YmJJOFJCcoXyg2dBseN4m8vtT4z4j9X3Nqsb7AIPAGhrrC10T?=
 =?us-ascii?Q?IzDdKmMe+tvSS78mpSICRzbpVW5/ggg9wH1fb8DYgnnsv0B8s5/62eCWHBnr?=
 =?us-ascii?Q?+keGC16ZYxLC5/ftaCF+qOKsvi4dLiDvETQOHq5qS/qOcGLSz0w1TlpakgqZ?=
 =?us-ascii?Q?cwKdJXStSdWi1wK9g28bE1HQAwwGr4yIyO00t7LqDX1QhndJo39zZnzm5nwm?=
 =?us-ascii?Q?MLzYjErZJ1WiiVpcNSaCC0f+JLCVzouhrKDY0bqFr1+KCpNZ3LCwgCqm0123?=
 =?us-ascii?Q?VUQgjqqVC2wfCQQCqhl7tM4cY+PvwJZ2eQ2jo5RW7Ad5S6GFnqTtylCVTSLp?=
 =?us-ascii?Q?8Vnu7FCu2V3PPNkFB4ni46qfvJ8gPnEoQbGzzvEHUPXn4PCUEGLks+Xr6h+7?=
 =?us-ascii?Q?OPR13CCfG4lHZyn9fbd/co2d2yRqy0TYkZUxI4TRtT7cBD8WPIUhCRFhq1C3?=
 =?us-ascii?Q?LimvAj91ygG3M5T85ctPhe5adzONOn5PAHnGOXp/SsfQoaDjqiUoOkDoQrVZ?=
 =?us-ascii?Q?Alu6NKExsnzn29LkvFa84JBmJlEncW+s9llvVJsk5C7nLLvA0HwYUgbFcyuz?=
 =?us-ascii?Q?jwBckJ/Yr6dOKXF4GDK8dnDgjKf32jNALyferojK/QGboycR/5PxHoXLh82F?=
 =?us-ascii?Q?2ke6blx46BwOW/lAv0qRfrbrOfT8LEV5qhziz1X2xZEm9TAZqn27Qp/GfV8s?=
 =?us-ascii?Q?qS8JShzrN3fiSpIzHjkwWun0fUHyWRIuU4tb1aHElIxJBb+Vb6bnuaBjdIC2?=
 =?us-ascii?Q?49MlgdlVhLK79z4Us/s6WqHGaM3pKwhFwN8MGHiha6rGX+WEdPRslplxstsy?=
 =?us-ascii?Q?az8eC50TWVXhBHL72uGEpj/T38djULfJD0nHZu/GsRmZtO8TU4kolJTGognv?=
 =?us-ascii?Q?K9JLVxcTc1w5PCvnvVNjMDmRz8QzDwdFvzcX4I0Ilauw2yrNJPZDTndyNOF0?=
 =?us-ascii?Q?Hez/kOwTFfCwTXLr+t5T2TPXVeoFaIlf8UzaB+07qaXiq7OPP+zGSHot45h1?=
 =?us-ascii?Q?pMyablWs0fIrC2uDjBblT4KLFLNA4X1dJ/iZkLbzpOPrtmOn7R+DBS9C0gDu?=
 =?us-ascii?Q?vDDVR3lgidL3rsWogyjL3+2svM2Uj15AtpV10JuE6UgH3H/S7KsMiJF6WF0e?=
 =?us-ascii?Q?msYwpfUEXjJUJJmWW4SuMOJiXlK04swz5ISSQGRPEad/phdjCW+AxU1am49J?=
 =?us-ascii?Q?dAUmxmDOyjJAYCPtSLSoTDkkihIVtHZtU3un8R7f5dXy4KQ4aaem+4BoVRiY?=
 =?us-ascii?Q?zxngbohSZHmbVtiqAaZEeMRVB+1FM+/ip4m+yXwnJc5S9bHSH/t9fbGntATI?=
 =?us-ascii?Q?9GDIeedYS6a547dxL2r4cj/yZ68g9s6WmgwZYl3XMF1OJLXoPPreLMM8gZAW?=
 =?us-ascii?Q?jy8U9X8EiPs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lHJwPkUHAInig/7/zHmm4umb+AUKsXSmCbYFFwBXIa15LPTUVKhWsEFvA4x1?=
 =?us-ascii?Q?2qpvzhKzcrPjPRaIvgEcAUyeA/wpB8Qux9VvNXraWaUjw3s6xTSDpnPuRKI8?=
 =?us-ascii?Q?CuTkfWxaxp5/SmiOqkoEQoQjaxV1xMM1668MsqjP/6NCq3V0CbLr8N0ot4bZ?=
 =?us-ascii?Q?xMZxnt7+j+garXcbCSFL9a4gMlHCFBfbhaT3ZHv9nekCvWNGz3+9EjoPaSW4?=
 =?us-ascii?Q?Ff1U4zQtydvWpv8zx2BYCCq6llwGWzHBDHG4d/nxfezyclb5vNB1PaHXxPrU?=
 =?us-ascii?Q?afbZg47o7eYVI/5uvQP/5eD/5uoPP+5H6Ke9vrteeCOlLe3qwajSbVeXqTX6?=
 =?us-ascii?Q?HCMi+D/SzCd9bo25mY6/SDakRq18aW25k9eZ/4YXDj2qZL9REg+TRW7iUYOE?=
 =?us-ascii?Q?WZPSzIZhdlMb3xmyVSlAkJIGKSfcMZw7dGq8Qk3LDyI6siAIqfxE9pPcwWnt?=
 =?us-ascii?Q?pyuT9Z+Wim5l0zcHg+zRP+LMV7rCENiWCZd/lrGEYC0T1M0myTHS/TKWlWSX?=
 =?us-ascii?Q?McX/U8GUtOH2zQVqbQWxQDV7HRfBr8INWiVtjxAVWaD+bwota4bRetWJx5Kn?=
 =?us-ascii?Q?8Nz0JTPDYgu5YwW/ORy4IyEMNGm5wOWkisjqbzfJKrxORlN+CuB0YZpTBOjl?=
 =?us-ascii?Q?6mmV3S4VRQfvXtxy6BX1gK4Lu5+WBqWT042Zwt+8lKOOjOhWu1eMNUqGxFYR?=
 =?us-ascii?Q?h6OqqVY0AP9wqNxOJLt2RHw9TjEtqp2nFrwQg5bxfJiK7PfXtgT4Zqn/Ot1u?=
 =?us-ascii?Q?/onigLvuHbBmZMy8aoUahoLIszeZwTaqdNaAZ1KrL3xHop8RlUxB1RH3FJfF?=
 =?us-ascii?Q?b1eKEUsDUvSqtzhT7yJEiaKMpcb8VRQ426c6sy71JJkJkmB08PUT5o6qCITb?=
 =?us-ascii?Q?yP+AT99sCiaE+UBiMK91QkZulXVpRNSCKGvcmxEzj3kqLaLqAVsf91XYt5BY?=
 =?us-ascii?Q?yGLuHfOBiKxKpacc5z55tXswMErsXegQ6GUhernWDjwuPO1rFVA7cZ/NNdv1?=
 =?us-ascii?Q?r9919EpU4XL2SyBXKTndQTfxmMkxibLVtByvvXLU4X+Iqo7qnONsBxc/2rnt?=
 =?us-ascii?Q?emNviLyzX9xFE+kRvszcUw9o5/qx8/i9U2ugq/v98j0iweq+lNzNw1XWZinu?=
 =?us-ascii?Q?AOXlcyMN8FcE7K/XgnUKvxpU2xvI24iNEXXQaPgpiCC8VufFqh7B3nex4Trq?=
 =?us-ascii?Q?Y5ST+ijLSMzqYX1GDfYA2/doAzQjVxR+KBgwbN+y5RNAeu1v4CspzVc/KWTn?=
 =?us-ascii?Q?PlGnMHHJWr4dB4ZZ4p+vC830Ar/cdOBwva2ZNYKuTFF/oapgNwAcVCuaPoaH?=
 =?us-ascii?Q?L7xjWDdSgBd4eaoMJfnt9J5Pliv5JZ133rjspFt3vJYXjc+g4ehQJVe6QPv+?=
 =?us-ascii?Q?oKy9EOe4dwbWJA4wIjKHmSZeCM4mw/lxDOhES8azXGQ8AqYhsn2ENrANlU6+?=
 =?us-ascii?Q?s7WkVHpmLTl2dRHtbg93/ZyOs8Uco5L29zDn7HUUGFl/r5cyzxpQU8MFJnMD?=
 =?us-ascii?Q?A5xpIzflZHsQ2iZ2kr3Pjc19rvXcmTV8Zpy3gY66U448GPa/5FZOdCGlrfvm?=
 =?us-ascii?Q?5m4duBNd7fLYy5h3vmLUbbYgXeygsPI0Bb5m9t8ui6a5tAdKhafJuQLMa0YB?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27186c75-bd74-4df9-0efc-08dddc4718c9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 22:00:07.5493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYLS3nn9TGoQcHh8AZigXJ0VMAvsch3bf90XKBlYRxZ2EsXp9+kdNR4/duVUKMFZHMQ/axUCQPStn0oSx/fPvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6316
X-OriginatorOrg: intel.com
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

On Wed, Jul 30, 2025 at 12:19:55PM +0530, Aravind Iddamsetty wrote:
> Netlink subsystem supports event notifications to userspace. we define
> two multicast groups for correctable and uncorrectable errors to which
> userspace can subscribe and be notified when any of those errors happen.
> The group names are local to the driver's genl netlink family.
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_netlink.c  | 7 +++++++
>  include/drm/drm_netlink.h      | 5 +++++
>  include/uapi/drm/drm_netlink.h | 4 ++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_netlink.c b/drivers/gpu/drm/drm_netlink.c
> index da4bfde32a22..a7c0a4401ca9 100644
> --- a/drivers/gpu/drm/drm_netlink.c
> +++ b/drivers/gpu/drm/drm_netlink.c
> @@ -15,6 +15,11 @@
>  
>  DEFINE_XARRAY(drm_dev_xarray);
>  
> +static const struct genl_multicast_group drm_event_mcgrps[] = {
> +	[DRM_GENL_MCAST_CORR_ERR] = { .name = DRM_GENL_MCAST_GROUP_NAME_CORR_ERR, },
> +	[DRM_GENL_MCAST_UNCORR_ERR] = { .name = DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR, },
> +};

this was the thing I thought for that 'monitor' but well, that can be ignored
and we can indeed leave this per error component. but I also don't like it
to be forced. It should be a driver definition and driver adoption.

> +
>  /**
>   * drm_genl_reply - response to a request
>   * @msg: socket buffer
> @@ -156,6 +161,8 @@ static void drm_genl_family_init(struct drm_device *dev)
>  	dev->drm_genl_family->ops = drm_genl_ops;
>  	dev->drm_genl_family->n_ops = ARRAY_SIZE(drm_genl_ops);
>  	dev->drm_genl_family->maxattr = DRM_ATTR_MAX;
> +	dev->drm_genl_family->mcgrps = drm_event_mcgrps;
> +	dev->drm_genl_family->n_mcgrps = ARRAY_SIZE(drm_event_mcgrps);
>  	dev->drm_genl_family->module = dev->dev->driver->owner;
>  }
>  
> diff --git a/include/drm/drm_netlink.h b/include/drm/drm_netlink.h
> index 4a746222337a..9e48147d0d36 100644
> --- a/include/drm/drm_netlink.h
> +++ b/include/drm/drm_netlink.h
> @@ -12,6 +12,11 @@ struct drm_device;
>  struct genl_info;
>  struct sk_buff;
>  
> +enum mcgrps_events {
> +	DRM_GENL_MCAST_CORR_ERR,
> +	DRM_GENL_MCAST_UNCORR_ERR,
> +};
> +
>  struct driver_genl_ops {
>  	int		       (*doit)(struct drm_device *dev,
>  				       struct sk_buff *skb,
> diff --git a/include/uapi/drm/drm_netlink.h b/include/uapi/drm/drm_netlink.h
> index 58afb6e8d84a..c978efaab124 100644
> --- a/include/uapi/drm/drm_netlink.h
> +++ b/include/uapi/drm/drm_netlink.h
> @@ -26,6 +26,8 @@
>  #define _DRM_NETLINK_H_
>  
>  #define DRM_GENL_VERSION 1
> +#define DRM_GENL_MCAST_GROUP_NAME_CORR_ERR	"drm_corr_err"
> +#define DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR	"drm_uncorr_err"
>  
>  #if defined(__cplusplus)
>  extern "C" {
> @@ -50,6 +52,8 @@ enum drm_genl_error_cmds {
>  	DRM_RAS_CMD_READ_BLOCK,
>  	/** @DRM_RAS_CMD_READ_ALL: Command to get counters of all errors */
>  	DRM_RAS_CMD_READ_ALL,
> +	/** @DRM_RAS_CMD_ERROR_EVENT: Command sent as part of multicast event */
> +	DRM_RAS_CMD_ERROR_EVENT,
>  
>  	__DRM_CMD_MAX,
>  	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
> -- 
> 2.25.1
> 
