Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55A3B1EA7D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 16:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C22510E94D;
	Fri,  8 Aug 2025 14:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Goosgq9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494FD10E94D;
 Fri,  8 Aug 2025 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754663981; x=1786199981;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FC2NuZUBTUXcPU+saCSDIDzr4te7iYdkuIYaQMBwC08=;
 b=Goosgq9Ak5ceUPejHOko3LNDe1NCtyRVhSTJWIt2PGz6PQE0Amd6y6Bf
 G2dICA8Ql2uoQshY/h7+98E62xhGmHBwF2yNXNKeWOpIJbg6e+JabV2ao
 H8I1PV/o7728g84cXjhGkYphfnxtbQ5bS1kFaQGQBJtM+wamT248iQOPP
 uaTqz71F76JrbABwjU8cWQA2xFEp63/j1Uq3bM+vD2B6ByimZ8izt+WRA
 sfxa9mn/5H0eGuPdK/KYrofocRPFsjgk9Oq5Dj2S89B6uIx2jprwGihOn
 tGD1XN5X8JUiLTppZWwDX0RqyufMKawfCs8MXN/84PKiIHkOWv18U4BQh w==;
X-CSE-ConnectionGUID: A6sVjP21RcS5r4f87BYqcw==
X-CSE-MsgGUID: zEuGd88xSeqIoD1/fnixEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="79571585"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="79571585"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:39:39 -0700
X-CSE-ConnectionGUID: cNcxJ3BIS+iDq3LkmpKQiw==
X-CSE-MsgGUID: +cLLnhvyS7OBY1Un9TyujQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="196164244"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:39:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:39:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:39:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:39:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3N63EwJXpgajhZpRBQQ+uywTNbH5GW76sHNSxlISrsvMWydPYzwtk6XvHw3G9o2GH+bzWtR5Zf11w9DuRYiZ/1YTlLHiox22V3j+QETHs+kme18Kc2iO5vHAdpz7pCihbxpVfNu8HIYnPdCsiqGztDiZrpjPPYePqtuvo2Znl93pGKw4+/RbsE5T6AVrrLjDT4AjwfZMmEDtZsq0W1dnfPB4b6PEPPXFt4oNaXw0UA4pTzygX5SM6wFl1+ISlDkpPxgIBMxmgXFY2qBo7ybviZv2QWBw3XR24p5bZ3kXjz/0Xd5w0adpcWZABfokVV40ae7KTy1APOAGohvOuAApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BO4ylGzsKXKlj56Vsgtz85MMgvPyXjvX8Fw61Vh/hB8=;
 b=rUIxNKliFBV14QcDl0QWusM1iL/XWPKrVpksP2X8I1BwTvnFGutzf1Ze/S8f8m8Bf8BvQ82TpMSvVUlzGRpBjpqNQYcT5Dx/5ybjM3DuJeq2jtl16GDl+mzWMrT/6pils1zrFOfteqG99uKdKpep2pWk+akeXTktBRD1iDdL8TWAhIND0YAYFUdSdvAbgII/t7/pGZO6bcDsMKfrRsLWVr5IEJlyebDrYy6KaO2GjhuqElOhkfX8nx0SkLOqpZax8fOuvl+dKbHFNZcC/C4tH6zVqR+aj8Dug7XAviuEXPjCr4o/kWPjwz6ySlds4t+N9h6eytSW1bPm4ixBuICMCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB8204.namprd11.prod.outlook.com (2603:10b6:8:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Fri, 8 Aug
 2025 14:39:29 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:39:29 +0000
Date: Fri, 8 Aug 2025 10:39:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
CC: <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <jani.nikula@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 7/9 v2] drm/i915: Clean-up outdated struct_mutex comments
Message-ID: <aJYMHYiluWXRJ6vk@intel.com>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
 <20250807170212.285385-8-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807170212.285385-8-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: SJ0PR05CA0168.namprd05.prod.outlook.com
 (2603:10b6:a03:339::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e12b535-a991-4841-73bf-08ddd68961b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tRxaSHveTw8q9Xv5NFIvkonb9pz+ioFhZmifV218ZEPmkV/8v2CRvbquSt4W?=
 =?us-ascii?Q?AeUPPadA+iX/rR7Qrm0WPtmoxeFH8+IsPwT2tu6PkEbsProQDA0ox0dNZrex?=
 =?us-ascii?Q?aSzwAE88SlacwVuXla2A7+vDVPcS+TAH/RLcSojIB4ucxgCRZgUwbclm+Pkv?=
 =?us-ascii?Q?+D3AUbB+uqz/sISHZgQT1+LyeLfoivxXzO5U8fhPZPXmc1pCdyvUfOZkqd+6?=
 =?us-ascii?Q?qZEi89XhJYJzBf4cUu08ZRYwlOsBolp6CV1O6KIHd5DMrSaAq4bH/e1xHwcR?=
 =?us-ascii?Q?ZUT4fJc72gmDqf/qUaYNeCmAAaY6GBXi8frfgowV9ZzSPFMsJVQbKA9F58NI?=
 =?us-ascii?Q?5MgmD1b+kzCnM+O/rZLv8S8/7HpFNsWNqoX7ZjWXzDgBtOKFiuSL6Opzdt8K?=
 =?us-ascii?Q?1NaXXMQ7MocrLumZkhfVJSfizvEGE3ISb8pdzE0jWNmkU6jNqBVDd1NSaV+e?=
 =?us-ascii?Q?uAAaeQKde9osNN6B3BZsbVVtf9kjPFXXvaF5lkiDOEIoJBP4cYZCXxDsLMEv?=
 =?us-ascii?Q?kY2wON0T8YDJu3lDOFTHLR4udG9fQoqRgSRZzMd6h1r1U9aaY3OpSayY6v3p?=
 =?us-ascii?Q?2c5K8lVOOWZnSb6Ar9Ay6Uac430KStZ2AhKLUpnXqBquugYpbqGVyQmrHzTN?=
 =?us-ascii?Q?8NdJO3p26IAJar/jUm6DvsPu1ufO+HTSO1+BicSH0dO98LSX7z9ELLoN8q1x?=
 =?us-ascii?Q?775xK2guMsBcrtJJnxDDDg+TXDp3gGF8wL1E9KZOF5wfVxGIcU5gpYky9NsY?=
 =?us-ascii?Q?yFJw/hEWkp/eMBx4QOaK/TAjihctaI+0Su8w4oJ6miR2DRoSz9o3fQnNVK4b?=
 =?us-ascii?Q?aaI7EmUxI9v3AqhSqy9Ab9cdUDIHaEgQ/yZTLCmETEFnFgB1pLHj3OpNCxGC?=
 =?us-ascii?Q?RUvAu8OiXt5eIdoC8nATNp8ze6iNPAur08YAk9f+YPBS0HHBK7RRAyz6wnQU?=
 =?us-ascii?Q?ITs5kTI/DJSPq4T+PnVBixF8tQcYQra9cy4pHD3URaInL/8lafyRdevYw0nt?=
 =?us-ascii?Q?Uf3fM7ksFfSMdNNMIMPOtHEwq/E3P6+2HZXCRFDfZuCBQll7XA3s1AJBxq9f?=
 =?us-ascii?Q?ZVr6tJfQuhwSyaaLd3cUAjmIgwBrPdVtSsGwZf6LtFyl5RhYiXV+fOW85FYA?=
 =?us-ascii?Q?iaqLJhbxg43IXo8vDOMgfbGaDeGNoDylS7ihguSBqJ3GJ4Av9dKzGswCYejl?=
 =?us-ascii?Q?BTpdYwEfngJ1YSM4JRjBM7FuDi/bF9/XSIXYhUk6pPh+2kPE4E8ywMcJoyig?=
 =?us-ascii?Q?gNQKywhKaxjoC4/5GsoUum8s6bQM/+yhRdXxY6XZvpfgp/MzVl/kBOsiVoAX?=
 =?us-ascii?Q?+KQMJDm+JDPQhYQTaSdi9wVEpi88fsPwE7tSv/VtVPwqioQn5OpRhYJi/OGj?=
 =?us-ascii?Q?IWdM4RAOfqimvfxahTOlu8aHZVB3NTwFcD3YTENGDSKcpRePos5+gcpGSpgx?=
 =?us-ascii?Q?/UPeefA1CJI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CkPIzUrRVAsi1LllnB8CAdsYc8X0VbKvvpx+sZG+JXWeRxgNAvN/IOdAfcGX?=
 =?us-ascii?Q?+0PYHtr3NL5afl4lUkzyCEx/IQcinvQGmLr7JHBFo3wn7e8d/b1Aj2BKI8pj?=
 =?us-ascii?Q?L8o+NWVExddUV6GeNcoCsXhMQ1qXG15JSevmcmAGUxv0yM/nOAnnVFsGj8De?=
 =?us-ascii?Q?5YzRH1lUG6VyQcoQfkjvWD9kKfoTXGQ5WNcOum5zCP99+Fl9N844GQp18f6D?=
 =?us-ascii?Q?uumhvnVTgCKLxkQ8tnQn3/KmACj1PFu/Yge9tfB1/JTpqJxP2lBQW+awDzZ/?=
 =?us-ascii?Q?firpV5jFv1XJIkF7LVPrsebnIlhKzL16EhtA0ezxYvSBjDETL2P58WsiYeki?=
 =?us-ascii?Q?7sMsx9z+dPcFxnWeDx6ql9JJ5ZXGXt7gFwnBL7FnsuKZr9S6jBLc+FN13l4f?=
 =?us-ascii?Q?tGDHdhhttPbVHqqfwBZqoAff401ozuq9ecfeMXhV+66lXUaOPUJU3qgu9e3I?=
 =?us-ascii?Q?JcceeamNKFwadACNcFNEh6lPeOGwjTepBAU9m1hH6RJGti094zE3DZbFaeH1?=
 =?us-ascii?Q?YcKkfoqFRIVt0TyLQTM6gQ6u/MHhku1DdhSG7H5dD8GLtWDWI5FUDW7hPEfc?=
 =?us-ascii?Q?TeODkYSyP00GxAKzLrh1LKloNHQOEIz94/Fkh/mIr8ZH0fabqsTvYxtfk0TF?=
 =?us-ascii?Q?0yFWFgg0qiQg2CjzLK218AFpyeemy7vapqt38lJjaANZToc7IdDCZHYucjKH?=
 =?us-ascii?Q?/bxFamjAIm7tALPlT89fOi+6HxpgsAM5m38yVqLW8pMCRoL5E+zkHxw5qxHr?=
 =?us-ascii?Q?PRzDYwFt6HK6FTiZAoA/Yx7nGIU/Yzf7RgUCPGo4tC/G5CIopiOrDgMPK7op?=
 =?us-ascii?Q?U4rzxntFOShHCL55+BH0C0+IYpEXC9k5Scyyk5LS/2Q1qQ8LUFsgT9tAsi8k?=
 =?us-ascii?Q?FxsvcWTv1oFF1lqVpUVI39lyFU4bSKLWuqCe9REfAdUafvMI8cbV2fvukSjd?=
 =?us-ascii?Q?pNoxbqfW8XvJ0KobKTDJwWaQOnNb/+xAQYVXLf7A78nLO/D9o+esUzpiwIXi?=
 =?us-ascii?Q?e7jwwnyJd0xtdTrI3dPKUREAIoBNEHUY8NdPcqMuRlBkQPEXZ5eO0xZO+tqb?=
 =?us-ascii?Q?A0xrQq8dUM5bQhig5XrwzPb4S17iyHvof2k3/UUqOecQaSDiAcN94t/aETjR?=
 =?us-ascii?Q?Rk2Y6hEWjjVHDmz4IUv64grhTrj6M1rkL0uo6V3AgBE1aZvUfDPM7L+F3JNx?=
 =?us-ascii?Q?7USWf6l4LhSreFmgnq4DNWEBrQLs1fFzVbVPRk0s/MXenBXvY7BwnowPAb55?=
 =?us-ascii?Q?1nqfXr2rwsQfUS+OP9P9i5DHbBvaBhKPKeIEAO8m2XS+3lwQA21h/taw8Qhd?=
 =?us-ascii?Q?zL2b7LDgA1QxN4sfkIEC5tAE1XH7IET+IenFrp8+lUT3wPE9OZFCXAbYbP1x?=
 =?us-ascii?Q?3PMBdaovR7+dyJXatbVn/SBrNIhESRW68cjHeSf9n/YVXr7tgh3BdwYilXHq?=
 =?us-ascii?Q?kQZAsbT8ODej8CCaIs379LGQF/4G3GbpsFMfldgSouwtm+UCz3ZPkIDbjux+?=
 =?us-ascii?Q?1m00h6zbvnHQsHJZOy9f+bKeIUxv44Fcgbt6ItO7xeRVlMMuGyWV9U78/yrc?=
 =?us-ascii?Q?EED5/HSrpzOrn+lfC7yy3bjL/QUYBJOwVNBAuVSJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e12b535-a991-4841-73bf-08ddd68961b6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:39:29.6750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2XxbqJlrNaMHiGuJ2eKE5sBqu+j5AYeXb9RVF8JuACWzFvAOAd5FzUFsez5TuFn9Cn43w60VNtjTStTb8ReEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8204
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

On Thu, Aug 07, 2025 at 02:02:06PM -0300, Luiz Otavio Mello wrote:
> The struct_mutex will be removed from the DRM subsystem, as it was a
> legacy BKL that was only used by i915 driver. After review, it was
> concluded that its usage was no longer necessary
> 
> This patch updates various comments in the i915 codebase to
> either remove or clarify references to struct_mutex, in order to
> prevent future misunderstandings.
> 
> * i915_drv.h: Removed the statement that stolen_lock is the inner lock
>   when overlaps with struct_mutex, since struct_mutex is no longer used
>   in the driver.
> * i915_gem.c: Removed parentheses suggesting usage of struct_mutex, which
>   which is no longer used.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_drv.h | 3 +--
>  drivers/gpu/drm/i915/i915_gem.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 6093dbaf4009..e8cb94962482 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -114,8 +114,7 @@ struct i915_gem_mm {
>  	struct intel_memory_region *stolen_region;
>  	/** Memory allocator for GTT stolen memory */
>  	struct drm_mm stolen;
> -	/** Protects the usage of the GTT stolen memory allocator. This is
> -	 * always the inner lock when overlapping with struct_mutex. */
> +	/** Protects the usage of the GTT stolen memory allocator */
>  	struct mutex stolen_lock;
>  
>  	/* Protects bound_list/unbound_list and #drm_i915_gem_object.mm.link */
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 8c8d43451f35..e14a0c3db999 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -847,8 +847,7 @@ void i915_gem_runtime_suspend(struct drm_i915_private *i915)
>  	/*
>  	 * Only called during RPM suspend. All users of the userfault_list
>  	 * must be holding an RPM wakeref to ensure that this can not
> -	 * run concurrently with themselves (and use the struct_mutex for
> -	 * protection between themselves).
> +	 * run concurrently with themselves.
>  	 */
>  
>  	list_for_each_entry_safe(obj, on,
> -- 
> 2.50.1
> 
