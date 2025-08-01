Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E0B17B33
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 04:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF5E10E2D7;
	Fri,  1 Aug 2025 02:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fg7BvQBm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C0510E2D7;
 Fri,  1 Aug 2025 02:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754015361; x=1785551361;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rpIxKj55h6vMKHly2DTsWUmzGRLFzAU7PhmcF+eXDno=;
 b=fg7BvQBmAjkJO1wvb/kl/lPxIT0zCfNuJ74K4u3JEmN7Ku1yarhKeYeY
 eM3mq9QUyigGR2oymBG9b3TkbldM7OZcsuFOxxkMUz5zBG2nQ+lfnsioL
 oFG7liH7RlLF/qtG58ZI8egWAPnLqBrdQhVpb/zY+2e2rEv1fXy02QVs4
 O2c7FhaK1ZJBqetoFi3Y7Ir0BLS8zZG6DfMmKPuqXeklakLKyZrbIExcw
 2vrCw37gHyvbYWQq/DdH7YyBNfttY7O5a7OUMqOUch1Jj29rkAWRyVyvk
 1kVERphuIxueVQh4cMIpfW/hNmNeZii+fWklXc6Kxyv8rdMh8p2hLR+aY w==;
X-CSE-ConnectionGUID: +ZI/lpHUShyMD2r52dIs4g==
X-CSE-MsgGUID: MWpDzjkFSleNQqmo3ox8sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56438350"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56438350"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 19:29:20 -0700
X-CSE-ConnectionGUID: Nmq3XE4/QwyvKYpt9xiFnA==
X-CSE-MsgGUID: 0ra1B3xySSCVN+/VecI5lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163350188"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 19:29:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 19:29:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 19:29:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 19:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUoBCVZaUlHzWMhW+bJ2KvZT1qwRWjyhkPL5MVS1/g6cRSJ80+rwGXwQVsBoowLW46FPSKDvm5pPJiVRtAm/vqzuNR6e2TE49fd0KdJEBh/V5Ms6qdueCVga89GRysizAN0dkcm2MDNT8gS2yL+/IXMv40r+2dDyR1I8EQK1dSEHq9388O/6OBBUyD7X7ajy/AULJHzfgEONeuE6a3ggn8LfQ6SmdMaO6OBYfkeSEbrDgtWekOGfXd8fGQZr2g/XXQ4isqSpQxDKviaaqva5P55k65TkDE3XQytVLHc+doeWDD2ecNKdRs28qlP6e8ulIf1EMe9Rbw0spHTk77JPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAXrEwMqnAbiWxxOH7Lz+BFCiwXzRHIghR1abKBbJC0=;
 b=GhDgjFCrVsRXjpngmsp7A6Oe0z/lsnRK/QxmcUAZ6OaxmhUoTG2GcxEKNbDWrY2SfvT2yQcGH1lEDvmHErhhQITw5MleQRT3MvqJ9NQ5Tir4ldi8JVtTbzIsvW8q9APN4HGW7ygPbyPPIZaZXS3EPVVz+wyahFhsVJ144Q7eAacMmHGIrn0Elgsfai+pACVVu8rpFP/qe/AKboDV+syshdm5dJB9ZC1LY5SZ7uTL9XKMtEXzuRwZQqqNGAIATuPOagD7DnTPRIMqeILA1xeuBbkGPyUUHxQd/2i2M5trCw6F90+ejeuv3Sx8734piajqX1/kFI3en9FGe2ZW5OlKoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Fri, 1 Aug
 2025 02:28:36 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 02:28:36 +0000
Date: Fri, 1 Aug 2025 05:28:23 +0300
From: Imre Deak <imre.deak@intel.com>
To: James Jones <jajones@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/nouveau: Pass along the format info from
 .fb_create() nouveau_framebuffer_new()
Message-ID: <aIwmRwgOa3-YAhna@ideak-desk>
References: <20250731234104.25243-1-jajones@nvidia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250731234104.25243-1-jajones@nvidia.com>
X-ClientProxiedBy: DU7P251CA0016.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::31) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c30eb0e-bf7d-4a88-5d38-08ddd0a31e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rhqYoYDpTMmlkjh7YK3/mIdPjOd1uDlbfFGpx5lbxrC1PWYT+yGd+uefkI?=
 =?iso-8859-1?Q?MMEa8p2Xjeo4Iq5LHnSORZDV6PZraLrkr8tFgbqn3YZ5CdN5HCIFGale7B?=
 =?iso-8859-1?Q?ycrfW4Xv16FrMkMTll9TVEu/dHtywwp1FTrKuckzC6bsYEz+VzIeIpig0M?=
 =?iso-8859-1?Q?BJ5NziyGTJM71xZ2eGexRayDGcZQHn2fc4cQPz8r3RisrbElUd96pNdcQz?=
 =?iso-8859-1?Q?dNC9MZkk3npa4o5Ys3Bx4mKezwZRwIBvAyMPYeEL7nrB2bci/H9Xlaflrh?=
 =?iso-8859-1?Q?6fLi9bgE2KPWlstL/dtHWVSclJeotm7DRxl/AJ4rP38JY2j72RvvL9geOE?=
 =?iso-8859-1?Q?2wqj5Ia7+lW88yJT3PlYxpUjXx36zBMgub3enSzv3gSRQ7VRKdydvawK2M?=
 =?iso-8859-1?Q?iXZ5BzsSB0yskmpFRz7cpscfltau1hd506x3avjZ1DhpPMDy3iLi+zGz1o?=
 =?iso-8859-1?Q?wQAqF1eFWtJWPN1E8ppwc0aFv7Q1tCgUIwXYlR3DVeePAovQY0v3wRph2U?=
 =?iso-8859-1?Q?VAhvSreXBzT890OS273M61gPJMQ63WM589wdBj3ZAv7bGhxnEghPxhQMu5?=
 =?iso-8859-1?Q?XBWjfmQtYdmUGkPc1oTrhp2jfMpEAixKYmnQxy59KrU6OPEuw7Rv/PFSvY?=
 =?iso-8859-1?Q?Vyb0eDAa4nr/WBHEW54SEhGpz/R1IPvSf/ZAV6eXvRnvi64TOJvv8F2oC8?=
 =?iso-8859-1?Q?fsvDknASp/OHaV0lQx2PPxLPzbe/8BiNdNWDVAN2yHpGN3nNYZ9lKb1fvf?=
 =?iso-8859-1?Q?QJZKwKZ3jzIi3PKfomsFjKnQ0B2l2gfShVFBDodWyMb54XFdwd5hi6jesa?=
 =?iso-8859-1?Q?e/QjaN0aJkzOf4qocKEsoii+bMyZdTVstl3iN+Mq16MtO9oKOPaX8X2bpj?=
 =?iso-8859-1?Q?n4pGHrE21w/lw+iTDaGRmDVXlj942kVbZYxud02uo0OlaMeEulScmbUux8?=
 =?iso-8859-1?Q?zvIgcGZBAe5bEoTQl2e1+oJD4zlUB0ZVabPEGAnQcvp7zqwWoxaYb2ajTm?=
 =?iso-8859-1?Q?iJ2efoEec4DWTK8jRuOWOG5YdFpaIhvQSkVUjV60lVrtXjKEjpfZzGQMC7?=
 =?iso-8859-1?Q?3g+xjC9ctfnyxuTz0nPMcvbmVMT25u9sqJi4cWWKsldsjzb+OSQfmuHtdu?=
 =?iso-8859-1?Q?QIz1LpAd59in+vIzZT8mHRBAQVzIf7s7T3b+luQfeqt/AGqV42SCkwcIlo?=
 =?iso-8859-1?Q?O2IamE2U82XKkbTLn4HVdanvGJEHBWH6kb72s2CLKNQJ2VJ67gQWYIYGuS?=
 =?iso-8859-1?Q?HS5I1BiUHtym8kHNGyBgQiJvkzcGfjsnaL09zlbuHJHx3trVut+28kDfr0?=
 =?iso-8859-1?Q?+EFdT8XI0hEI2z/e0SOXYFVzUoEosZwi8X1WRwAB5m7qGtGn27C4u4l+E4?=
 =?iso-8859-1?Q?GVRrNcBvRipS5UnlR0iQ7+lBqaossg4b50rw3FsFK/Qf730NEjKWmsXBGn?=
 =?iso-8859-1?Q?qwK2W0UI4LJuCAaQBItpmYs2ihutfAwN3wIqasVIP9BesaFdcCt7xeYOB1?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kAmot435/JiIgww+nX0HgcFG5sqWV0D+yCjkfsxvCeWUz152gK4ghILlr8?=
 =?iso-8859-1?Q?5AsmRlLMdV4k/IIMn2irBmjPivY6sWIxrY1CVa2najvxcF1qhMjLXLjpGA?=
 =?iso-8859-1?Q?FwHaJb2RsH1V4GSMtbGwLJN+FN5sG6Co5/LiK91j/5v8zbqiS5gcoLxho7?=
 =?iso-8859-1?Q?Wguc7J0JcpSUvA6DdpifrO4hfYkAhFrVc3yzEUVYDnqYVueUhel4GGV2ZL?=
 =?iso-8859-1?Q?hFhxnyUMiEIsBzl+qEzeC09CT2Tg162cVYwjLuq20hxmoDlnG+xKMziEcL?=
 =?iso-8859-1?Q?+bYPwk9FZKZhA3XvGbZ8xAyRkhjp3pKKGiKvm9MYVZGcNE0dFmxt9cS0pz?=
 =?iso-8859-1?Q?GeD/bzQqFR0yBq9g3iQ16m1iP6Ue78Fpm5GH4b6+hYlPrrHZpWW8zNJXqn?=
 =?iso-8859-1?Q?XGyaCW+sbOrfL/p6Y/r3Y7lScycADWCNmm8g9qEinTD4II3oZ5BefupDc/?=
 =?iso-8859-1?Q?kZT3Z8Y4Fkrzc7PgL8dQGkGuSorIJm2atBb2GJvjF8QDOEtT4dlVc8tcav?=
 =?iso-8859-1?Q?93SQVxlajBNhY6hsUQVGbF75wDmpOCA2XgNg39dx4vYuricEZHobLHVJf2?=
 =?iso-8859-1?Q?MNbud6p47jxd2sLyWzh5DH/Y/w0R09Lth3m3J6vwXaIOWJDRog1syzXEw8?=
 =?iso-8859-1?Q?HmYttCV3SfWuA/+d2FoGTJNzP6L39SJZUxVvcMU8hIoh1Q3oo6LEC2pDQ/?=
 =?iso-8859-1?Q?fCfOe6aj+CMFUtu3Mo8SrEIpEs2Afk0X+8+97D3YOYjtczv5IPcX1Vf8LG?=
 =?iso-8859-1?Q?XN4TTDvtG5Ecu6JYV5jKnMTcyd4VZi3dwtUPFXndMX4lx95JnPjfBwbJtZ?=
 =?iso-8859-1?Q?CxRwU5BNl3AExqw4JWb03R3w/0ErgGacNAUlhOxrt5TkaEbtbwYM3Cttlq?=
 =?iso-8859-1?Q?lJZ/gTSq53BklIJ2wGTrQpifG3+WA6ksa8luU/jCfGJAL7By4P48wt+xBf?=
 =?iso-8859-1?Q?IE5a1cflxZrNcm5elMdL3nm4ZZZNQyCJYIxMv6lLw3nARmOrHUz//LT4Zg?=
 =?iso-8859-1?Q?iWq3tRhb/wS1SJkDloiEusopHCxBMQ06VgEA9z0v5e1cB3ag4aJ/pZa4pH?=
 =?iso-8859-1?Q?R1kPhGhPEpZPMcnN1IU8FQj11UB54Cb4wqvuRWunNo9LWOzFxR2iDlimI8?=
 =?iso-8859-1?Q?Etpk3nUxdXYBhGRlq6pjxplornZNygFnFeZs2AVgTJf4H/9xnZIK5s5+3b?=
 =?iso-8859-1?Q?mO9/GfrLhsuLkYITdQDPf/XGoCivIx8iz0Dmwn7eFPhte87nRipn3ZqGTS?=
 =?iso-8859-1?Q?G7FLUTH9itSVja22VMslVVwB1rvkdBPVOeRfH92ZxoRZc4L9LZ8Qk3uI/W?=
 =?iso-8859-1?Q?xDS15VjmbVRT0CNmFqdS2REqCyo6rqRT+3Qd7Xn9hLIRR45y36GQy8gQm6?=
 =?iso-8859-1?Q?U/ZAwbXQTVc9ztqhYM5qw1CdoUF2L8TfzhA0Z+gbzl4PYbVHtkUJy+JxOF?=
 =?iso-8859-1?Q?Q80Nqw7lqyNIqwqwayRbxveIJmnhGxNv4BxAhkRBOrKQZP/dqfjy4VoaAA?=
 =?iso-8859-1?Q?O8CncpdwLWXe26jqOp0Xh/uoUwaWys6meA3/QPWSYTxSzx6dzosqy8nNCt?=
 =?iso-8859-1?Q?h2s6jxQvCkXDumXjPZ2dzXYFt1nDzp/FpuL3PugMqsjLsCdjJq5HlFwBZM?=
 =?iso-8859-1?Q?oKThcqZ34bwxMwlYB8E8DvQ3pnf2NJLJkazBPJlVPjqOdSLSFshchZ/HZA?=
 =?iso-8859-1?Q?8Hq2HrYImznBjnWl5ggVq2y3IzkdHdMDOlVm6ugS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c30eb0e-bf7d-4a88-5d38-08ddd0a31e06
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 02:28:35.9935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5AI74ZROughHSdS/xa3TRLCdGOlOwlZ6mk47B99nqU/XmzuGNVC0hCHhTOAiIgr8dR71AEbz4glgDZsi4/Ekw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 31, 2025 at 04:41:04PM -0700, James Jones wrote:
> Plumb the format info from .fb_create() all the way to
> nouveau_framebuffer_new() to avoid the redundant lookup.
> Also plumb the format info from there down to
> drm_helper_mode_fill_fb_struct() as required, avoiding
> a WARN_ON() and failure every time this path is used,
> e.g., during fbdev init.
> 
> Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
> Signed-off-by: James Jones <jajones@nvidia.com>
> CC: Ville Syrjälä <ville.syrjala@linux.intel.com>

I posted this change already:
https://lore.kernel.org/all/20250728101603.243788-3-imre.deak@intel.com

> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 9 +++------
>  drivers/gpu/drm/nouveau/nouveau_display.h | 1 +
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index e1e542126310..805d0a87aa54 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -253,6 +253,7 @@ nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
>  
>  int
>  nouveau_framebuffer_new(struct drm_device *dev,
> +			const struct drm_format_info *info,
>  			const struct drm_mode_fb_cmd2 *mode_cmd,
>  			struct drm_gem_object *gem,
>  			struct drm_framebuffer **pfb)
> @@ -260,7 +261,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
>  	struct nouveau_drm *drm = nouveau_drm(dev);
>  	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
>  	struct drm_framebuffer *fb;
> -	const struct drm_format_info *info;
>  	unsigned int height, i;
>  	uint32_t tile_mode;
>  	uint8_t kind;
> @@ -295,9 +295,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
>  		kind = nvbo->kind;
>  	}
>  
> -	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> -				   mode_cmd->modifier[0]);
> -
>  	for (i = 0; i < info->num_planes; i++) {
>  		height = drm_format_info_plane_height(info,
>  						      mode_cmd->height,
> @@ -321,7 +318,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
>  	if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
>  		return -ENOMEM;
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
>  	fb->obj[0] = gem;
>  
>  	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
> @@ -344,7 +341,7 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
>  	if (!gem)
>  		return ERR_PTR(-ENOENT);
>  
> -	ret = nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
> +	ret = nouveau_framebuffer_new(dev, info, mode_cmd, gem, &fb);
>  	if (ret == 0)
>  		return fb;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
> index e45f211501f6..d569240df354 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
> @@ -10,6 +10,7 @@
>  
>  int
>  nouveau_framebuffer_new(struct drm_device *dev,
> +			const struct drm_format_info *info,
>  			const struct drm_mode_fb_cmd2 *mode_cmd,
>  			struct drm_gem_object *gem,
>  			struct drm_framebuffer **pfb);
> -- 
> 2.50.1
> 
