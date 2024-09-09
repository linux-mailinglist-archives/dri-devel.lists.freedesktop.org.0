Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6299724AE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 23:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E889210E6D6;
	Mon,  9 Sep 2024 21:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhdqERav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C918710E6D3;
 Mon,  9 Sep 2024 21:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725918813; x=1757454813;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aFfx2VT/roaQgZcNSItJL0vYjeWghwPYE6gPysDxpwY=;
 b=KhdqERavh5EDy8K/7pffw/XK11JnTeW1RLT8t0W1YHkism5kpafCq1Ma
 XKrgLRkqcV7vLmFR7MipxbIXM3SU7RVt16NAktmdoAu1MGkyrpB4dTATf
 TNQUFwRGAw6qk9Wn27ceWAZVEUQKAEOBhELRxZD30uFfSaRPfQDLMZvt1
 j/qTloIZDCA64DbiHXsP6+hj9JCBXOug3cjxjGxRy0jB7WUEvzzvE7zol
 Bch4peVDttqVIx6tPERreItuCotBn/S7s3tkfmGnh6HbXZAT8RiqBkHF/
 GsbiO4bcapC+RoUjq4ytXg8TJfB+ZS863VIcyc3UTyFJcl2oqfVCGXIRM g==;
X-CSE-ConnectionGUID: mXby+5fqSnmc6of0BCocqQ==
X-CSE-MsgGUID: m+wJUEmzQmOzqbyPFoEFQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24140825"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="24140825"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 14:53:32 -0700
X-CSE-ConnectionGUID: DC1rtsjQSVOCUqzvsX0IlQ==
X-CSE-MsgGUID: M+H7c/OiQvaiaW6CRlsdHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="90089820"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 14:53:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 14:53:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 14:53:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 14:53:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 14:53:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3LG1vWNA/mZnkDDNYxd5pjXRnTg2i+h0fpbe+uQzCxzKOq9ZzV3nHo737+9G7Fqfe+46hAfQGL2/Y1Qq9hpFZ09wg0bTEMjA1200+nUKHNpSUCFQCfF1qHCtAzHCMKcgI3zVdFD8QLRr9cBYEqmObtEeVYzsM8w+drv+X20MyElvf+si7UZUrA58rs4s9tDzBgOxlsWlaOESlD0VjwHfyG6NaOAkEK0MFPkPHSROXJ00QpCC9dBF3yjj5XOeJ1BgHRyuUboTLvCItDfHqvkXSF6wI0+w0xr2zICg9Q4DyrtywgrTDEbSBI1SeP11Sw8n8B6hxs6StA/uSps+juocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cry5OLpR2Bw/6in+BgvxZl0jYC+cIDpP1w/UXGzVCbo=;
 b=lCJMJzTttLhGnq3pQlcYr6D4W5gz/thSX6sKPRwO7L51FBrlMA9cmeDFn75MmKZhSOda3iQq/b6ZTeJDUDMfgvzSmF8/JdiiXBzdPxm+DtknZVkwfWrOBBQzOIdmUVsV36WEODciy9kNjqFODYaWDDPP45rXiWVWtWbve+kVe+ymIKAiCCc8lZfa43aoG3oP43Jw4vMChac9iMk1U0Kzpvh6r/6x0uXt2BXELf7wrZsJPKjvUmGopMhpi+pebEYTEaEBKun2qrAbZ/678WesYhhdrQkblxtGGC9FzKkD2a5/rvph/i8f4o/NnKQjm6+xztor5rXAf4DPm5mSKUs90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 21:53:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 21:53:28 +0000
Date: Mon, 9 Sep 2024 14:53:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <francois.dugast@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 1/3] drm: Introduce device wedged event
Message-ID: <20240909215323.GC5774@mdroper-desk1.amr.corp.intel.com>
References: <20240906094225.3082162-1-raag.jadav@intel.com>
 <20240906094225.3082162-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906094225.3082162-2-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec3efa7-a668-45c6-18e7-08dcd119d633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zSayf5seicPrc+ce9v3NOGAxi2oMKIJRYTvJk0UcfHUy1lXYBMaqznPqdanq?=
 =?us-ascii?Q?7pylxqk5fIAQkddl2HYPaKM3xdjaq3Ia73KrqlJ967w8Z/xkr73ccBgmBOPz?=
 =?us-ascii?Q?rbMCgsXVqYwFYN2gqGxkSDMrde/w/DuLi/SGoQS2huYYZkl2KdEJvcxMzrPv?=
 =?us-ascii?Q?85uoiqtubXuOhVW8IgMj/Su8VOpatstz0LlCnw0qHQKnWqNiVF8MA9OtTwjr?=
 =?us-ascii?Q?ObxRZhjOS85QdqnTF3Qppi3xcgIFB+0xmrO0I9TlVf27HGyHkPV/q65PUesi?=
 =?us-ascii?Q?nfRENocZoTdbhbFiCH0OxO2UjfB2UEi+VQ0y/sS413ScewV6pFQ8UuzqW1tl?=
 =?us-ascii?Q?9exqGV6LfoIiGMdfQ46Kj8FeX65Rd44/tTTsN79zSL3jNZrwYu2MIXLAyLHt?=
 =?us-ascii?Q?LWU9PvF3M1DWUzO7I02YAPtCqE9aQA2bKWGxFtLKqxQ+HIcvWyuEqoyQsTTr?=
 =?us-ascii?Q?Bo3VWt+2/Yy5vO4fZsh/ntvYCKm9VfB9rk/i/dYDYyIxlyLApg6Qm0r2fAVa?=
 =?us-ascii?Q?wRIu5BHn7xlGqWQPAvapFRNOZVn5ZV710SZy92TK3mx6FrRnIcMrMyUXtmcU?=
 =?us-ascii?Q?Ei1bUiHye6FnunDF3qaP9iBjFTIBYgIuxCAgg+y2OH5mbukZ+G8B4ruCnRTP?=
 =?us-ascii?Q?rGsXEMu8oSPBa38TWnCO8ZTEr7+3RLb+ceJc4/ll4RQ8L8W/f4tRHRIm750d?=
 =?us-ascii?Q?0VIAV5KGTm5QtUIipNOKapj7YS9SoNgfkk+GQ33ugxN/lRdsQRvg6UqdnqOI?=
 =?us-ascii?Q?tveXYW1shcjP9pwQN297PxAoyngh/BNtVPK8mnT0dbIgYTQFu+6/cxY8ImZ4?=
 =?us-ascii?Q?UChw6NCu/mtOA8JK99yZQGz76gQ704ArHS7L3vZKzVF3GtFuZwZJOcwCFSk9?=
 =?us-ascii?Q?T0idIUs215Ye7YmlfAelIudhi3FQU5LQuy9VqVoqq0iBG25346x+T+J5dER4?=
 =?us-ascii?Q?8Gi8hU6OLNbW2LaUQR6rb9fFI87g/qdYI2j51IjwztyHIT+IXnBxq+XA4oH4?=
 =?us-ascii?Q?AnnaTp5Bo+/axXXIMQ4+QGv+I4Mu1/rIfTb3GHAF+YZo0wyv9yq+J6b2IFXA?=
 =?us-ascii?Q?FTSEJq7pNJbHfP8FbJYsehe7snjxypztt3SO6WvUG5lOQ9qgShgrZfJbnNWj?=
 =?us-ascii?Q?FOn7O+6s3REepngkHiQ1kRYHvl5NwCumFwVMiutXRZf4yOgJTT2548nbcUYN?=
 =?us-ascii?Q?nP6Zn+DbEA5DLiHGj1dOqpbbZP8H252Sl1bqlq2k8MBUZQWDWddCnfruTLmE?=
 =?us-ascii?Q?k63xCYoJTzlwX9AjQoHQIWOGaMQeJkmq4kgZj7y2sa39rxRuJc+iGNzAXi5u?=
 =?us-ascii?Q?cxmC+5HyZF+HAJGSUeO1lUEi/OF8tt35mlbcpiX8nWgpQw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y1E3wMq4QxNIlcw6Qu+5w+iU6Nt4p+pSoIMMtFNucJRDki0Wj7gPipGAzYLi?=
 =?us-ascii?Q?MKg//qNtqun/SAzDMtJZfut0jrVL5gvEDthDRu6mCnBx8exVgCGTCosA3yZa?=
 =?us-ascii?Q?pi6AfUDEWiNpPZnsjd4RyDQZDXjrKoHFRXEwiljn/UXrll7yrNXjSAGXpxBZ?=
 =?us-ascii?Q?GdyW4P/7Mhys1EILPAfozfiGYs0MEWrz537x2CYfZMqr5rxe0CHkLn5oGK+I?=
 =?us-ascii?Q?Yv3hv1LjhqiirqmaeC58YVpmPWnIk2ytqN4pJJgGYCs380iCCFgkzWnb7iWN?=
 =?us-ascii?Q?0HYWluFr7Y4C89EPZp8z1n3/cQmwb6bGx4YfM2ispOyyvmlzATWlreb7eVv2?=
 =?us-ascii?Q?K736kNaW2yFXWRuwYcqNjB+SJPEZ/OJJAAZIVdk3uQfQqr3nACcW93T8d22d?=
 =?us-ascii?Q?ms1z/hT53ZOmS4n8Btd8+oVKI3yF5dx8Scxe2daHA/KVTd1gZamEZX2PSRFN?=
 =?us-ascii?Q?YuhFXKohug/AoI3mwL9q/b8UyR1J4Maz6iISiLLamiudkEAaZcu+RKnyRq4q?=
 =?us-ascii?Q?+5l05i4Sgovpcgr0zxCeY8G9my9GhjeKRbFx0JfnaUsleNxpP/1KJ6UUUxOF?=
 =?us-ascii?Q?mwVsQekcNdOyRqjwdDvHALlv5JpzABTEIZTby8QVWb/2peSyDc/VQF+lUfd9?=
 =?us-ascii?Q?4QAcNuxkFtfIYmJv1xKrIHhZt9NoK+mUFYu/QJ7FRkIoDYEg52vyRJqxcI7T?=
 =?us-ascii?Q?+e+V74SXlSLTR0YlK1HPbgqmE6jLSkCi9Hq+VFeheZQpxgDZszZ7Te6qR6yW?=
 =?us-ascii?Q?O+o8x7a5z07F4tGT2hONrQ5FeAnHCSpLm3go/pEFbDpFPaT4N7KqjVneNqaI?=
 =?us-ascii?Q?WFd7MR1tzy9DiocO8By7tyCsLhnVNapkMNkzigGUVKOLVTgX5R5WsRS4FQAr?=
 =?us-ascii?Q?kbCxiXSU2iTRtKFf7FubMGZjkTk24nR6KOEdaz3yEP3+ciLcACBtMFtrnVOT?=
 =?us-ascii?Q?lyEd0YlFBphZCtWUWo4JVIdBB2N/7GuWsiJtgY+iHc0aEApRDwbR0CfghcMM?=
 =?us-ascii?Q?b7WcM38xMSXjJiItErsLBBT8vJp+VwNCId16em+z/8XqaHkQqCLQdfcrSw3B?=
 =?us-ascii?Q?49j1KH3W2usI7gnZGq5wCJp653uTjF2cXzMA6r7U3z76bP5Al99iZtTRyCTo?=
 =?us-ascii?Q?0vtTQj55Feykk2PBIkgcqFfmiftVSjWUpY8VBbY0Dtv8QBh4wetX3UF1WR+2?=
 =?us-ascii?Q?05AJxryI11kiMWodQIe+x8tibcGarDnjvBRxPGsZ69gAgtPFWDBEuCYqYR7D?=
 =?us-ascii?Q?owkeSPfNOyfq/xIB7RW21eHG5SY1zJ0d0FXbAagKntpzQiVVXItANOzoJbN/?=
 =?us-ascii?Q?nLQoI9XfJG80BxKlaVQ6gCrETWRw1esnMs8lvsbCbXkkNE2uGubKYC82HNAl?=
 =?us-ascii?Q?vuhxotsnksbb+oFZBPaFmUiamZkfvqrX8ij8u4cabOHj/Dq6FEbHPpm5B4Qd?=
 =?us-ascii?Q?Cbnch2pKNRWS0oQDku6LVtylIjIUy8EceuWsWi08xcxEzX3SwmkSnO8BcRQ/?=
 =?us-ascii?Q?Pd5SmUV90Mjp0nfEJg8EIGCCtNENPDeos/qgoWxVc8aHiJHaSJ2vMqGzmhEw?=
 =?us-ascii?Q?oCqo1AkXvaqjX1rN0CTPU7nA3rY03UYEl93N+9eHzvzxLzrkJ6ijJZb1ihq8?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec3efa7-a668-45c6-18e7-08dcd119d633
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 21:53:28.7643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MK+4lJGTuZG1HNtSuMm3HxHwri4DufWytmr6NUAsnAi7dIdKkVWv1SMQpCuxipwM+MdDygdp7dNI6lVnUu2mIbIooMsW4r8Z5uCv5cK91y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8256
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

On Fri, Sep 06, 2024 at 03:12:23PM +0530, Raag Jadav wrote:
> Introduce device wedged event, which will notify userspace of wedged
> (hanged/unusable) state of the DRM device through a uevent. This is
> useful especially in cases where the device is in unrecoverable state
> and requires userspace intervention for recovery.
> 
> Purpose of this implementation is to be vendor agnostic. Userspace
> consumers (sysadmin) can define udev rules to parse this event and
> take respective action to recover the device.
> 
> Consumer expectations:
> ----------------------
> 1) Unbind driver
> 2) Reset bus device
> 3) Re-bind driver
> 
> v4: s/drm_dev_wedged/drm_dev_wedged_event
>     Use drm_info() (Jani)
>     Kernel doc adjustment (Aravind)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 20 ++++++++++++++++++++
>  include/drm/drm_drv.h     |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 93543071a500..cca5d8295eb7 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -499,6 +499,26 @@ void drm_dev_unplug(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_dev_unplug);
>  
> +/**
> + * drm_dev_wedged_event - generate a device wedged uevent
> + * @dev: DRM device
> + *
> + * This generates a device wedged uevent for the DRM device specified by @dev,
> + * on the basis of which, userspace may take respective action to recover the
> + * device. Currently we only set WEDGED=1 in the uevent environment, but this
> + * can be expanded in the future.

Just to clarify, is "wedged" intended to always mean "the entire device
is unusable" or are there cases where it would also get sent if only
part of the device is in a bad state?  For example, using i915/Xe
terminology, maybe the GT is dead but display is still working.  Or one
GT is dead, but another is still alive.

Basically, is this event intended as a signal that userspace should stop
trying to do _anything_ with the device, or just that the device has
degraded functionality in some way (and maybe userspace can still do
something useful if it's lucky)?  It would be good to clarify that in
the docs here in case different drivers have different ideas about how
this is expected to work.


Matt

> + */
> +void drm_dev_wedged_event(struct drm_device *dev)
> +{
> +	char *event_string = "WEDGED=1";
> +	char *envp[] = { event_string, NULL };
> +
> +	drm_info(dev, "device wedged, generating uevent\n");
> +
> +	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_dev_wedged_event);
> +
>  /*
>   * DRM internal mount
>   * We want to be able to allocate our own "struct address_space" to control
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index cd37936c3926..eed5e54c74fd 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -489,6 +489,7 @@ void drm_put_dev(struct drm_device *dev);
>  bool drm_dev_enter(struct drm_device *dev, int *idx);
>  void drm_dev_exit(int idx);
>  void drm_dev_unplug(struct drm_device *dev);
> +void drm_dev_wedged_event(struct drm_device *dev);
>  
>  /**
>   * drm_dev_is_unplugged - is a DRM device unplugged
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
