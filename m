Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C6AD2499
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 19:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE0E10E3DE;
	Mon,  9 Jun 2025 17:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EyJbgMZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627C710E14C;
 Mon,  9 Jun 2025 17:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749488666; x=1781024666;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EJfgcoPkFl3xEXWAxE5vnkJFiC7I3nj5+gpEM+RXBAc=;
 b=EyJbgMZj8h7Kw1S8pqdcUdO3tambyjol1H2SRHYoz/jpgQgK3wMYnguf
 fZccd9lqOwxoSZBp99gVF+RjY0Sh11NnPMaLptVS1mTmi0FeouCwYFNLh
 gxCrLMcAtJDzuUjwa48p/Eb7zHAcONOKCI6YEI6dCwUrKkHbP4OpeZJGC
 t1WhVWfVlv4EWszmDAncnKSyXyntoctwImgWwypL0nE3XmCXO4TYhgYV4
 k+q8Dz3oZ5o2bR8x/Tpa4Z7fWV8NGIs1nFikZwK3da0H24ZcIrt1lPIcp
 f9mo4yA/9eGQtqhUY87Y+SVeO1opnNqrm2Hv6K6+YQXtVK8F3XbhjVZ0t Q==;
X-CSE-ConnectionGUID: /ybjqLv7TymsYvnRIEereA==
X-CSE-MsgGUID: okrZK7LNTwSNO2sW7qf1tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="76969577"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="76969577"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 10:04:26 -0700
X-CSE-ConnectionGUID: wtOAgIQKSICWuBeMbvFtVQ==
X-CSE-MsgGUID: GGsMPwXCQqOTqBiLI2PP4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146487895"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 10:04:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 10:04:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 10:04:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 10:04:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7dOd3F0VLM1ggd/VOSj3a8gv19zJNDYr1LmijdbndiQoqu0sH333n667Cp+tyT6pVyMp51Aa+12EZNvRUhUJsNApDjWcVaokLmIRR+2qZv0BhNXwpJ9PlFoFK5icRRokqAJav+cGF6fBqoraWqnTLI4VFx+QU9f04Y6wZKGpt0aa8UQvTNEC5erW0SSqvW3Dr6ZyeoBrK0+dtFzvMupdWYRyxpwQMP9Ck++tGxSgQ0r0ozTmm/ZmhaoMhpkZOORTS2f7X+NQkGKxItAQXXzJz5k3SB5tOLnmRx/MXdXpcwPZ9o4wIMZJDiIwe2nrTXlUMsr2SV+8Nx5TuULMzZzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4dW4480jb0Xr7pyM8PDgsnYX2zyEhDjLKlYpOE+oSU=;
 b=efgal6e9QYQt3LJvo3IXC6L7ztJh5WBDwkT6CuoCaghrRNd4Sv/bdRmdVQmRATtlyHgfqH9BVGrkpUZDhwgaOGKHRbRcDUR1tmq4WAdxsp7K/g90yR63EmZE7jjVWRB/05R7lYzrjIed6YR2sEIh9RxFkDWa6qsCdRT+LWnfiUnd4p0TXP6mtoyvZuO57rzFQ8Z2JHjoRPuMTGqVETUVp85mU97DjLeIa0d8HrM8RgCntGD17ecOkAPBbDhFNUoO+CwrtYDCl9a3pCpyOEE7fxn35mfK+pUK4eGvvnUH62LgjcL1zxXtfp95fkPF9o9N+3fQddkawhl7deP7w/ITXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF4AE904FD9.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 17:03:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 17:03:41 +0000
Date: Mon, 9 Jun 2025 10:05:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 6/8] drm/xe/vm: split userptr bits into separate file
Message-ID: <aEcUS48jyMCCoPAH@lstrano-desk.jf.intel.com>
References: <20250512150637.61462-10-matthew.auld@intel.com>
 <20250512150637.61462-16-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512150637.61462-16-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0319.namprd04.prod.outlook.com
 (2603:10b6:303:82::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF4AE904FD9:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8bd849-0c5e-45fb-a74b-08dda777956e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ktIkUEtY/bxmiuYgpJUa0n6BmKqwUBLJLKB8QTvrTfUm4WTlIyvUlUF2sF?=
 =?iso-8859-1?Q?w9e1oD+TAvuQAxhd5PnBWKmynzl1KkKwU3/cexqRRo+USKEH5IpFe8fKnx?=
 =?iso-8859-1?Q?z5WZwwYOn2rQn2++53GN0G6yEleC+ifrDNH/G1+oyUohKF4kE4g4xNXyms?=
 =?iso-8859-1?Q?6zRgDjjapVX0tacpL+np8ThdiiuIHHxdoKGXKK99o+BlJyURFZtaMky8Gx?=
 =?iso-8859-1?Q?bi7lIiHWuLduf6togh17IrNSuex31MWmo3wXHIZUe6At/0CJtmp3NuGxqL?=
 =?iso-8859-1?Q?D8rKJ616QTH8YQ6hTyavIpgJ4FzFC16rqq7y9TG6xJ34TheRi4t8A1BWos?=
 =?iso-8859-1?Q?K/84krvMuwPstATmMiumC7+PJneTYN5kno7TxgtabZXATKd8RZ91wbxZje?=
 =?iso-8859-1?Q?nLUn0JcRN0nCwSfG6PaIDlUACu0bW1x9Oup7s/cEnyYZOsccUym9oPUxsF?=
 =?iso-8859-1?Q?2OsPWma6V4zvddfJgbGJW8g2x1QYGOi4xwnHeRCvpfpH4ywPdFDsoj51B2?=
 =?iso-8859-1?Q?TizrIGYA3WSdmgBzL09hS/h5gEwHQIGGxJStkLs36pUXD3Ez9TclCbNdXb?=
 =?iso-8859-1?Q?NG5D0fkbDdE3hm01glAuJjtRoAh3zTmNus+yJ+4REniJ78es7kOnh0iC++?=
 =?iso-8859-1?Q?nQLvEB7Udw75FZkh8q9r9ZNkyoxrsl1VDhBgjdY3IBOXiP+f3P2ySui/8g?=
 =?iso-8859-1?Q?1NOmi/5Kiy/VpuE1bkE97HQxmKDJpbbhCVEFvhLYbBl3OniAbIx9O1z9MG?=
 =?iso-8859-1?Q?2fHElXQxbCz9I2LmlsqYu39+iltnSZjyv/afnF2rHaZ2OTuzqgRq65QXMX?=
 =?iso-8859-1?Q?7iwa4dJfGprHAwMCszvVwHtY/rtm/yXcfvv2VyPHRxBkJAJUnHcCMYVnIr?=
 =?iso-8859-1?Q?/EmPDgTW/Rb3p93i1DRlfCYiEyLkJ3hpd11/teGH8sPQ5Ts9hNzUZ6QN2f?=
 =?iso-8859-1?Q?78LdZERzs9p1BMaCGFsZ6eelPscWytwYyzx7+poFFV31e3d+oDbIG1y3ua?=
 =?iso-8859-1?Q?+WI2g6/JIm66r9nfnHq/wokSKfS/T4KyCItOTr/UKr56qOO/Mxmu3ZUU9v?=
 =?iso-8859-1?Q?Vmpt/XWluA00p/xNvL3zwa3HYDe3fW+uILa1VnVN+Az24rstEqbWqsahkn?=
 =?iso-8859-1?Q?jdXR2RhpOkoS41AcUTZNn1wz6xJqLnlOKFEuEutSAkAya5RXK7psSl/G0o?=
 =?iso-8859-1?Q?gJpXfyQXnwp0JYkLwBR+CnvYXElWPGjlMQzjnVtp9wCzNIkquQPy5S3hxI?=
 =?iso-8859-1?Q?61Rn/Q9O8pp8niiWZcYfH2laXIxEJPrSJ4rMl33BkPCB0ZFyllMJgBi/lG?=
 =?iso-8859-1?Q?+4mGO7qjKp4DItVnFu/tEa0g8AjKtGu9/TZv5U+2V2gidKv/QB3nrwg17d?=
 =?iso-8859-1?Q?XIqkcpVe0jAqowUTdCzzADqgUzoggLDaBLMc3dtz65NVTCr7eOvIbrOU39?=
 =?iso-8859-1?Q?x6/DIIXmXVTXVQHv2y6xqdQFRUFYEb6qro8UNfFUXZHvY64msX1dnv85d2?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FeP98Zo9txgtVQ/cKf76/qVrvJkQc7r2xx/HcBZkhGxJ0zJ8EgXTnYPNBR?=
 =?iso-8859-1?Q?EW1pKACUw3f+W8VjBKZT6VR7v3sBzwGiWeUlo+fH9iqklFtmcJl39ad6Or?=
 =?iso-8859-1?Q?HQAr0WFRTeGpuq2qSyMn7CIf7F4PVlxzv4aA3YEN2jae5vIwADwqLV4gEu?=
 =?iso-8859-1?Q?ouFYVD/s6MGFBm2mehZm+oSkw+Nl7c6kZ341n2m16hnzvNYTO/EMW/aAmg?=
 =?iso-8859-1?Q?ZHc6rsAfGipk9pT+xJxShyjVErD57C53ldzcAHULdU5nD92kdg7lR2I7z6?=
 =?iso-8859-1?Q?SdFymTVVL084qgE4JhAFMmcyrTgEGjOvO9qQTbWgF/EoTcUf2wvpp6V8uL?=
 =?iso-8859-1?Q?AFiUXYOKaQBHwFlBxge+qY7Ihn+iVYiNA+T2IZMRMWrlNLVvOi0MAlYi3E?=
 =?iso-8859-1?Q?0vChb9xLz/GlY8phXpaAusqpQzIX1hN/Ecd4IamwTHiLNB4RN0ri5u5Ttp?=
 =?iso-8859-1?Q?E3Wml/XJmFvpNKwwzP+i0lPokleL4VjInwHxPqFM4NBRuXsTH1OaIl4fFE?=
 =?iso-8859-1?Q?sHt+25dbGbocJZ6W+1LLzNc/zPFSRux07mQ44nAc5YThvWF1PZVMuei5dD?=
 =?iso-8859-1?Q?SKMujw9o0pWVF50Ltp7KDnQVCCssEG2RzWib1zlb9CULTuKJMtZXWlLBEm?=
 =?iso-8859-1?Q?f2WhHfAZdeYJLKFCJLenLfAdHoA3iyBko6Yl3dSJDk4/fzT8qkbyW8m925?=
 =?iso-8859-1?Q?zbXFjNgtcr2LvdSvL6Ex1MS+0bEGBiTQAVW+DPQQ8u3br2iJ5L03aLDmkp?=
 =?iso-8859-1?Q?/G0+tNuflDvPPAA/+vIhCZEgnmE69uZpEgALymfIFuxsZQYsp8xurB+A3k?=
 =?iso-8859-1?Q?WRNQ5HoNDTmPUumR5JZK3EgNAHMlYuyQwznR2uRpj9GEvsEnlS71H9SEde?=
 =?iso-8859-1?Q?kOM7lxlrbwevzo7wTDSuVSeN+XjbYRdmaqsJyUD7VK+/9ch/1kdrr1pAEB?=
 =?iso-8859-1?Q?vuYx4CFmqBBi1GzA5F4dgQ+yq9RVuwmNc+Wu8LHQsW23EMdCUNhnEvmb8k?=
 =?iso-8859-1?Q?iO+dG2tOAxtsNVmUi9M5bKQmcJ+0eFAon/WV6JF9AV7jjH2EzKLEGNY/6Q?=
 =?iso-8859-1?Q?Faf0q2DBh9EKVgC1k9099IhVecV2hk3H9+hL2Ay/QrvyW7RRhd/LY0IKja?=
 =?iso-8859-1?Q?t6vkawB+CRVFjFuhz2CVDnwRd2cjGDNY3ne+q4jvQ8/fG1C5UDvndvIIn5?=
 =?iso-8859-1?Q?7l5+cZtD0CpOFH67Vk4Qf4J2pEPWGCTV64Gx7FWoE2xc9UYz5+NwVV6znI?=
 =?iso-8859-1?Q?fcFQQeMVBzQI57605B7NwOmB/ncj7dS2UUP9Ayy7s0qJWV9gLmEjl/bRMR?=
 =?iso-8859-1?Q?8QqmT3vdgaxRKsdjvCVS8jph8FxYb9VXF8eVVuVBpaHsXJHSK18vmqdkkm?=
 =?iso-8859-1?Q?Kiu28caqWXTXIFgN/VUdB1sPGj1d6H0bLMepgY9qXl5wyXGdkj9yHyAzRe?=
 =?iso-8859-1?Q?ANYbtkyQTjvQnFMnxv8GShA2zfPl/GAbvrowjuUJBWR6YJFbu5uQUzAT1w?=
 =?iso-8859-1?Q?4yRiMsNeIsP4E+XreroWtm8l0ucig7KbF5OePC6CDe4zLk23bUlVpdSyUi?=
 =?iso-8859-1?Q?GD8ztlchQ9N46cQqxM45nPTF45gSbdYLHTyRI4Rfm/l0NBjqSKbNEvZcNa?=
 =?iso-8859-1?Q?xg/WIpZFQnfO8tBiwYnS5VignT1XNhVRieXgJbIm3yBPRTL7wDXmbxSw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8bd849-0c5e-45fb-a74b-08dda777956e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 17:03:40.8862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EN7WZGFL3u4kYgGsCg1yjadBWi+9fS0R4j9D50emjxQJCD7REaaKFXX/dh/5dPqSbttmvQeBbFV+OFulnc8iNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4AE904FD9
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

On Mon, May 12, 2025 at 04:06:44PM +0100, Matthew Auld wrote:
> This will simplify compiling out the bits that depend on DRM_GPUSVM in a
> later patch. Without this we end up littering the code with ifdef
> checks, plus it becomes hard to be sure that something won't blow at
> runtime due to something not being initialised, even though it passed
> the build. Should be no functional change here.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile      |   1 +
>  drivers/gpu/drm/xe/xe_pt.c       |   1 +
>  drivers/gpu/drm/xe/xe_userptr.c  | 303 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_userptr.h  |  97 ++++++++++

We typically use *_types.h but I didn't do this for xe_svm.h either so
maybe a little unfair to nit pick.

Either way:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  drivers/gpu/drm/xe/xe_vm.c       | 280 +---------------------------
>  drivers/gpu/drm/xe/xe_vm.h       |  18 --
>  drivers/gpu/drm/xe/xe_vm_types.h |  60 +-----
>  7 files changed, 410 insertions(+), 350 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_userptr.c
>  create mode 100644 drivers/gpu/drm/xe/xe_userptr.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e4bf484d4121..10b42118e761 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -116,6 +116,7 @@ xe-y += xe_bb.o \
>  	xe_tuning.o \
>  	xe_uc.o \
>  	xe_uc_fw.o \
> +	xe_userptr.o \
>  	xe_vm.o \
>  	xe_vram.o \
>  	xe_vram_freq.o \
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5cccfd9cc3e9..720c25bf48f2 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -23,6 +23,7 @@
>  #include "xe_svm.h"
>  #include "xe_trace.h"
>  #include "xe_ttm_stolen_mgr.h"
> +#include "xe_userptr.h"
>  #include "xe_vm.h"
>  
>  struct xe_pt_dir {
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> new file mode 100644
> index 000000000000..f573842a3d4b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -0,0 +1,303 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_userptr.h"
> +
> +#include <linux/mm.h>
> +
> +#include "xe_hmm.h"
> +#include "xe_trace_bo.h"
> +
> +/**
> + * xe_vma_userptr_check_repin() - Advisory check for repin needed
> + * @uvma: The userptr vma
> + *
> + * Check if the userptr vma has been invalidated since last successful
> + * repin. The check is advisory only and can the function can be called
> + * without the vm->svm.gpusvm.notifier_lock held. There is no guarantee that the
> + * vma userptr will remain valid after a lockless check, so typically
> + * the call needs to be followed by a proper check under the notifier_lock.
> + *
> + * Return: 0 if userptr vma is valid, -EAGAIN otherwise; repin recommended.
> + */
> +int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
> +{
> +	return mmu_interval_check_retry(&uvma->userptr.notifier,
> +					uvma->userptr.notifier_seq) ?
> +		-EAGAIN : 0;
> +}
> +
> +int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
> +{
> +	struct xe_vma *vma = &uvma->vma;
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_device *xe = vm->xe;
> +
> +	lockdep_assert_held(&vm->lock);
> +	xe_assert(xe, xe_vma_is_userptr(vma));
> +
> +	return xe_hmm_userptr_populate_range(uvma, false);
> +}
> +
> +static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uvma)
> +{
> +	struct xe_userptr *userptr = &uvma->userptr;
> +	struct xe_vma *vma = &uvma->vma;
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
> +	long err;
> +
> +	/*
> +	 * Tell exec and rebind worker they need to repin and rebind this
> +	 * userptr.
> +	 */
> +	if (!xe_vm_in_fault_mode(vm) &&
> +	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
> +		spin_lock(&vm->userptr.invalidated_lock);
> +		list_move_tail(&userptr->invalidate_link,
> +			       &vm->userptr.invalidated);
> +		spin_unlock(&vm->userptr.invalidated_lock);
> +	}
> +
> +	/*
> +	 * Preempt fences turn into schedule disables, pipeline these.
> +	 * Note that even in fault mode, we need to wait for binds and
> +	 * unbinds to complete, and those are attached as BOOKMARK fences
> +	 * to the vm.
> +	 */
> +	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
> +			    DMA_RESV_USAGE_BOOKKEEP);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence)
> +		dma_fence_enable_sw_signaling(fence);
> +	dma_resv_iter_end(&cursor);
> +
> +	err = dma_resv_wait_timeout(xe_vm_resv(vm),
> +				    DMA_RESV_USAGE_BOOKKEEP,
> +				    false, MAX_SCHEDULE_TIMEOUT);
> +	XE_WARN_ON(err <= 0);
> +
> +	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> +		err = xe_vm_invalidate_vma(vma);
> +		XE_WARN_ON(err);
> +	}
> +
> +	xe_hmm_userptr_unmap(uvma);
> +}
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> +/**
> + * xe_vma_userptr_force_invalidate() - force invalidate a userptr
> + * @uvma: The userptr vma to invalidate
> + *
> + * Perform a forced userptr invalidation for testing purposes.
> + */
> +void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
> +{
> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> +
> +	/* Protect against concurrent userptr pinning */
> +	lockdep_assert_held(&vm->lock);
> +	/* Protect against concurrent notifiers */
> +	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
> +	/*
> +	 * Protect against concurrent instances of this function and
> +	 * the critical exec sections
> +	 */
> +	xe_vm_assert_held(vm);
> +
> +	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> +				     uvma->userptr.notifier_seq))
> +		uvma->userptr.notifier_seq -= 2;
> +	__vma_userptr_invalidate(vm, uvma);
> +}
> +#endif
> +
> +static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
> +				   const struct mmu_notifier_range *range,
> +				   unsigned long cur_seq)
> +{
> +	struct xe_userptr_vma *uvma = container_of(mni, typeof(*uvma), userptr.notifier);
> +	struct xe_vma *vma = &uvma->vma;
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +
> +	xe_assert(vm->xe, xe_vma_is_userptr(vma));
> +	trace_xe_vma_userptr_invalidate(vma);
> +
> +	if (!mmu_notifier_range_blockable(range))
> +		return false;
> +
> +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> +	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
> +		xe_vma_start(vma), xe_vma_size(vma));
> +
> +	down_write(&vm->svm.gpusvm.notifier_lock);
> +	mmu_interval_set_seq(mni, cur_seq);
> +
> +	__vma_userptr_invalidate(vm, uvma);
> +	up_write(&vm->svm.gpusvm.notifier_lock);
> +	trace_xe_vma_userptr_invalidate_complete(vma);
> +
> +	return true;
> +}
> +
> +static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
> +	.invalidate = vma_userptr_invalidate,
> +};
> +
> +/**
> + * __xe_vm_userptr_needs_repin() - Check whether the VM does have userptrs
> + * that need repinning.
> + * @vm: The VM.
> + *
> + * This function checks for whether the VM has userptrs that need repinning,
> + * and provides a release-type barrier on the svm.gpusvm.notifier_lock after
> + * checking.
> + *
> + * Return: 0 if there are no userptrs needing repinning, -EAGAIN if there are.
> + */
> +int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
> +{
> +	lockdep_assert_held_read(&vm->svm.gpusvm.notifier_lock);
> +
> +	return (list_empty(&vm->userptr.repin_list) &&
> +		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> +}
> +
> +int xe_vm_userptr_pin(struct xe_vm *vm)
> +{
> +	struct xe_userptr_vma *uvma, *next;
> +	int err = 0;
> +
> +	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	/* Collect invalidated userptrs */
> +	spin_lock(&vm->userptr.invalidated_lock);
> +	xe_assert(vm->xe, list_empty(&vm->userptr.repin_list));
> +	list_for_each_entry_safe(uvma, next, &vm->userptr.invalidated,
> +				 userptr.invalidate_link) {
> +		list_del_init(&uvma->userptr.invalidate_link);
> +		list_add_tail(&uvma->userptr.repin_link,
> +			      &vm->userptr.repin_list);
> +	}
> +	spin_unlock(&vm->userptr.invalidated_lock);
> +
> +	/* Pin and move to bind list */
> +	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
> +				 userptr.repin_link) {
> +		err = xe_vma_userptr_pin_pages(uvma);
> +		if (err == -EFAULT) {
> +			list_del_init(&uvma->userptr.repin_link);
> +			/*
> +			 * We might have already done the pin once already, but
> +			 * then had to retry before the re-bind happened, due
> +			 * some other condition in the caller, but in the
> +			 * meantime the userptr got dinged by the notifier such
> +			 * that we need to revalidate here, but this time we hit
> +			 * the EFAULT. In such a case make sure we remove
> +			 * ourselves from the rebind list to avoid going down in
> +			 * flames.
> +			 */
> +			if (!list_empty(&uvma->vma.combined_links.rebind))
> +				list_del_init(&uvma->vma.combined_links.rebind);
> +
> +			/* Wait for pending binds */
> +			xe_vm_lock(vm, false);
> +			dma_resv_wait_timeout(xe_vm_resv(vm),
> +					      DMA_RESV_USAGE_BOOKKEEP,
> +					      false, MAX_SCHEDULE_TIMEOUT);
> +
> +			err = xe_vm_invalidate_vma(&uvma->vma);
> +			xe_vm_unlock(vm);
> +			if (err)
> +				break;
> +		} else {
> +			if (err)
> +				break;
> +
> +			list_del_init(&uvma->userptr.repin_link);
> +			list_move_tail(&uvma->vma.combined_links.rebind,
> +				       &vm->rebind_list);
> +		}
> +	}
> +
> +	if (err) {
> +		down_write(&vm->svm.gpusvm.notifier_lock);
> +		spin_lock(&vm->userptr.invalidated_lock);
> +		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
> +					 userptr.repin_link) {
> +			list_del_init(&uvma->userptr.repin_link);
> +			list_move_tail(&uvma->userptr.invalidate_link,
> +				       &vm->userptr.invalidated);
> +		}
> +		spin_unlock(&vm->userptr.invalidated_lock);
> +		up_write(&vm->svm.gpusvm.notifier_lock);
> +	}
> +	return err;
> +}
> +
> +/**
> + * xe_vm_userptr_check_repin() - Check whether the VM might have userptrs
> + * that need repinning.
> + * @vm: The VM.
> + *
> + * This function does an advisory check for whether the VM has userptrs that
> + * need repinning.
> + *
> + * Return: 0 if there are no indications of userptrs needing repinning,
> + * -EAGAIN if there are.
> + */
> +int xe_vm_userptr_check_repin(struct xe_vm *vm)
> +{
> +	return (list_empty_careful(&vm->userptr.repin_list) &&
> +		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> +}
> +
> +int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
> +		     unsigned long range)
> +{
> +	struct xe_userptr *userptr = &uvma->userptr;
> +	int err;
> +
> +	INIT_LIST_HEAD(&userptr->invalidate_link);
> +	INIT_LIST_HEAD(&userptr->repin_link);
> +	mutex_init(&userptr->unmap_mutex);
> +
> +	err = mmu_interval_notifier_insert(&userptr->notifier, current->mm,
> +					   start, range,
> +					   &vma_userptr_notifier_ops);
> +	if (err)
> +		return err;
> +
> +	userptr->notifier_seq = LONG_MAX;
> +
> +	return 0;
> +}
> +
> +void xe_userptr_remove(struct xe_userptr_vma *uvma)
> +{
> +	struct xe_userptr *userptr = &uvma->userptr;
> +
> +	if (userptr->sg)
> +		xe_hmm_userptr_free_sg(uvma);
> +
> +	/*
> +	 * Since userptr pages are not pinned, we can't remove
> +	 * the notifier until we're sure the GPU is not accessing
> +	 * them anymore
> +	 */
> +	mmu_interval_notifier_remove(&userptr->notifier);
> +	mutex_destroy(&userptr->unmap_mutex);
> +}
> +
> +void xe_userptr_destroy(struct xe_userptr_vma *uvma)
> +{
> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> +
> +	spin_lock(&vm->userptr.invalidated_lock);
> +	xe_assert(vm->xe, list_empty(&uvma->userptr.repin_link));
> +	list_del(&uvma->userptr.invalidate_link);
> +	spin_unlock(&vm->userptr.invalidated_lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
> new file mode 100644
> index 000000000000..83d17b58ed16
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_userptr.h
> @@ -0,0 +1,97 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_USERPTR_H_
> +#define _XE_USERPTR_H_
> +
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/scatterlist.h>
> +#include <linux/spinlock.h>
> +
> +struct xe_vm;
> +struct xe_vma;
> +struct xe_userptr_vma;
> +
> +/** struct xe_userptr_vm - User pointer VM level state */
> +struct xe_userptr_vm {
> +	/**
> +	 * @userptr.repin_list: list of VMAs which are user pointers,
> +	 * and needs repinning. Protected by @lock.
> +	 */
> +	struct list_head repin_list;
> +	/**
> +	 * @notifier_lock: protects notifier in write mode and
> +	 * submission in read mode.
> +	 */
> +	struct rw_semaphore notifier_lock;
> +	/**
> +	 * @userptr.invalidated_lock: Protects the
> +	 * @userptr.invalidated list.
> +	 */
> +	spinlock_t invalidated_lock;
> +	/**
> +	 * @userptr.invalidated: List of invalidated userptrs, not yet
> +	 * picked
> +	 * up for revalidation. Protected from access with the
> +	 * @invalidated_lock. Removing items from the list
> +	 * additionally requires @lock in write mode, and adding
> +	 * items to the list requires either the @userptr.notifer_lock in
> +	 * write mode, OR @lock in write mode.
> +	 */
> +	struct list_head invalidated;
> +};
> +
> +/** struct xe_userptr - User pointer */
> +struct xe_userptr {
> +	/** @invalidate_link: Link for the vm::userptr.invalidated list */
> +	struct list_head invalidate_link;
> +	/** @userptr: link into VM repin list if userptr. */
> +	struct list_head repin_link;
> +	/**
> +	 * @notifier: MMU notifier for user pointer (invalidation call back)
> +	 */
> +	struct mmu_interval_notifier notifier;
> +	/** @sgt: storage for a scatter gather table */
> +	struct sg_table sgt;
> +	/** @sg: allocated scatter gather table */
> +	struct sg_table *sg;
> +	/** @notifier_seq: notifier sequence number */
> +	unsigned long notifier_seq;
> +	/** @unmap_mutex: Mutex protecting dma-unmapping */
> +	struct mutex unmap_mutex;
> +	/**
> +	 * @initial_bind: user pointer has been bound at least once.
> +	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
> +	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
> +	 */
> +	bool initial_bind;
> +	/** @mapped: Whether the @sgt sg-table is dma-mapped. Protected by @unmap_mutex. */
> +	bool mapped;
> +#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> +	u32 divisor;
> +#endif
> +};
> +
> +void xe_userptr_remove(struct xe_userptr_vma *uvma);
> +int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
> +		     unsigned long range);
> +void xe_userptr_destroy(struct xe_userptr_vma *uvma);
> +
> +int xe_vm_userptr_pin(struct xe_vm *vm);
> +int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
> +int xe_vm_userptr_check_repin(struct xe_vm *vm);
> +int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
> +int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> +void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
> +#else
> +static inline void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
> +{
> +}
> +#endif
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 79323c78130f..e5bf4ddc9d86 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -39,6 +39,7 @@
>  #include "xe_svm.h"
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
> +#include "xe_userptr.h"
>  #include "xe_wa.h"
>  #include "xe_hmm.h"
>  
> @@ -47,37 +48,6 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  	return vm->gpuvm.r_obj;
>  }
>  
> -/**
> - * xe_vma_userptr_check_repin() - Advisory check for repin needed
> - * @uvma: The userptr vma
> - *
> - * Check if the userptr vma has been invalidated since last successful
> - * repin. The check is advisory only and can the function can be called
> - * without the vm->userptr.notifier_lock held. There is no guarantee that the
> - * vma userptr will remain valid after a lockless check, so typically
> - * the call needs to be followed by a proper check under the notifier_lock.
> - *
> - * Return: 0 if userptr vma is valid, -EAGAIN otherwise; repin recommended.
> - */
> -int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
> -{
> -	return mmu_interval_check_retry(&uvma->userptr.notifier,
> -					uvma->userptr.notifier_seq) ?
> -		-EAGAIN : 0;
> -}
> -
> -int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
> -{
> -	struct xe_vma *vma = &uvma->vma;
> -	struct xe_vm *vm = xe_vma_vm(vma);
> -	struct xe_device *xe = vm->xe;
> -
> -	lockdep_assert_held(&vm->lock);
> -	xe_assert(xe, xe_vma_is_userptr(vma));
> -
> -	return xe_hmm_userptr_populate_range(uvma, false);
> -}
> -
>  static bool preempt_fences_waiting(struct xe_vm *vm)
>  {
>  	struct xe_exec_queue *q;
> @@ -299,25 +269,6 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	up_write(&vm->lock);
>  }
>  
> -/**
> - * __xe_vm_userptr_needs_repin() - Check whether the VM does have userptrs
> - * that need repinning.
> - * @vm: The VM.
> - *
> - * This function checks for whether the VM has userptrs that need repinning,
> - * and provides a release-type barrier on the userptr.notifier_lock after
> - * checking.
> - *
> - * Return: 0 if there are no userptrs needing repinning, -EAGAIN if there are.
> - */
> -int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
> -{
> -	lockdep_assert_held_read(&vm->userptr.notifier_lock);
> -
> -	return (list_empty(&vm->userptr.repin_list) &&
> -		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> -}
> -
>  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>  
>  /**
> @@ -583,201 +534,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	trace_xe_vm_rebind_worker_exit(vm);
>  }
>  
> -static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uvma)
> -{
> -	struct xe_userptr *userptr = &uvma->userptr;
> -	struct xe_vma *vma = &uvma->vma;
> -	struct dma_resv_iter cursor;
> -	struct dma_fence *fence;
> -	long err;
> -
> -	/*
> -	 * Tell exec and rebind worker they need to repin and rebind this
> -	 * userptr.
> -	 */
> -	if (!xe_vm_in_fault_mode(vm) &&
> -	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
> -		spin_lock(&vm->userptr.invalidated_lock);
> -		list_move_tail(&userptr->invalidate_link,
> -			       &vm->userptr.invalidated);
> -		spin_unlock(&vm->userptr.invalidated_lock);
> -	}
> -
> -	/*
> -	 * Preempt fences turn into schedule disables, pipeline these.
> -	 * Note that even in fault mode, we need to wait for binds and
> -	 * unbinds to complete, and those are attached as BOOKMARK fences
> -	 * to the vm.
> -	 */
> -	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
> -			    DMA_RESV_USAGE_BOOKKEEP);
> -	dma_resv_for_each_fence_unlocked(&cursor, fence)
> -		dma_fence_enable_sw_signaling(fence);
> -	dma_resv_iter_end(&cursor);
> -
> -	err = dma_resv_wait_timeout(xe_vm_resv(vm),
> -				    DMA_RESV_USAGE_BOOKKEEP,
> -				    false, MAX_SCHEDULE_TIMEOUT);
> -	XE_WARN_ON(err <= 0);
> -
> -	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> -		err = xe_vm_invalidate_vma(vma);
> -		XE_WARN_ON(err);
> -	}
> -
> -	xe_hmm_userptr_unmap(uvma);
> -}
> -
> -static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
> -				   const struct mmu_notifier_range *range,
> -				   unsigned long cur_seq)
> -{
> -	struct xe_userptr_vma *uvma = container_of(mni, typeof(*uvma), userptr.notifier);
> -	struct xe_vma *vma = &uvma->vma;
> -	struct xe_vm *vm = xe_vma_vm(vma);
> -
> -	xe_assert(vm->xe, xe_vma_is_userptr(vma));
> -	trace_xe_vma_userptr_invalidate(vma);
> -
> -	if (!mmu_notifier_range_blockable(range))
> -		return false;
> -
> -	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> -	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
> -		xe_vma_start(vma), xe_vma_size(vma));
> -
> -	down_write(&vm->userptr.notifier_lock);
> -	mmu_interval_set_seq(mni, cur_seq);
> -
> -	__vma_userptr_invalidate(vm, uvma);
> -	up_write(&vm->userptr.notifier_lock);
> -	trace_xe_vma_userptr_invalidate_complete(vma);
> -
> -	return true;
> -}
> -
> -static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
> -	.invalidate = vma_userptr_invalidate,
> -};
> -
> -#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> -/**
> - * xe_vma_userptr_force_invalidate() - force invalidate a userptr
> - * @uvma: The userptr vma to invalidate
> - *
> - * Perform a forced userptr invalidation for testing purposes.
> - */
> -void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
> -{
> -	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> -
> -	/* Protect against concurrent userptr pinning */
> -	lockdep_assert_held(&vm->lock);
> -	/* Protect against concurrent notifiers */
> -	lockdep_assert_held(&vm->userptr.notifier_lock);
> -	/*
> -	 * Protect against concurrent instances of this function and
> -	 * the critical exec sections
> -	 */
> -	xe_vm_assert_held(vm);
> -
> -	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> -				     uvma->userptr.notifier_seq))
> -		uvma->userptr.notifier_seq -= 2;
> -	__vma_userptr_invalidate(vm, uvma);
> -}
> -#endif
> -
> -int xe_vm_userptr_pin(struct xe_vm *vm)
> -{
> -	struct xe_userptr_vma *uvma, *next;
> -	int err = 0;
> -
> -	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
> -	lockdep_assert_held_write(&vm->lock);
> -
> -	/* Collect invalidated userptrs */
> -	spin_lock(&vm->userptr.invalidated_lock);
> -	xe_assert(vm->xe, list_empty(&vm->userptr.repin_list));
> -	list_for_each_entry_safe(uvma, next, &vm->userptr.invalidated,
> -				 userptr.invalidate_link) {
> -		list_del_init(&uvma->userptr.invalidate_link);
> -		list_add_tail(&uvma->userptr.repin_link,
> -			      &vm->userptr.repin_list);
> -	}
> -	spin_unlock(&vm->userptr.invalidated_lock);
> -
> -	/* Pin and move to bind list */
> -	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
> -				 userptr.repin_link) {
> -		err = xe_vma_userptr_pin_pages(uvma);
> -		if (err == -EFAULT) {
> -			list_del_init(&uvma->userptr.repin_link);
> -			/*
> -			 * We might have already done the pin once already, but
> -			 * then had to retry before the re-bind happened, due
> -			 * some other condition in the caller, but in the
> -			 * meantime the userptr got dinged by the notifier such
> -			 * that we need to revalidate here, but this time we hit
> -			 * the EFAULT. In such a case make sure we remove
> -			 * ourselves from the rebind list to avoid going down in
> -			 * flames.
> -			 */
> -			if (!list_empty(&uvma->vma.combined_links.rebind))
> -				list_del_init(&uvma->vma.combined_links.rebind);
> -
> -			/* Wait for pending binds */
> -			xe_vm_lock(vm, false);
> -			dma_resv_wait_timeout(xe_vm_resv(vm),
> -					      DMA_RESV_USAGE_BOOKKEEP,
> -					      false, MAX_SCHEDULE_TIMEOUT);
> -
> -			err = xe_vm_invalidate_vma(&uvma->vma);
> -			xe_vm_unlock(vm);
> -			if (err)
> -				break;
> -		} else {
> -			if (err)
> -				break;
> -
> -			list_del_init(&uvma->userptr.repin_link);
> -			list_move_tail(&uvma->vma.combined_links.rebind,
> -				       &vm->rebind_list);
> -		}
> -	}
> -
> -	if (err) {
> -		down_write(&vm->userptr.notifier_lock);
> -		spin_lock(&vm->userptr.invalidated_lock);
> -		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
> -					 userptr.repin_link) {
> -			list_del_init(&uvma->userptr.repin_link);
> -			list_move_tail(&uvma->userptr.invalidate_link,
> -				       &vm->userptr.invalidated);
> -		}
> -		spin_unlock(&vm->userptr.invalidated_lock);
> -		up_write(&vm->userptr.notifier_lock);
> -	}
> -	return err;
> -}
> -
> -/**
> - * xe_vm_userptr_check_repin() - Check whether the VM might have userptrs
> - * that need repinning.
> - * @vm: The VM.
> - *
> - * This function does an advisory check for whether the VM has userptrs that
> - * need repinning.
> - *
> - * Return: 0 if there are no indications of userptrs needing repinning,
> - * -EAGAIN if there are.
> - */
> -int xe_vm_userptr_check_repin(struct xe_vm *vm)
> -{
> -	return (list_empty_careful(&vm->userptr.repin_list) &&
> -		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> -}
> -
>  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  {
>  	int i;
> @@ -1215,25 +971,15 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		drm_gpuvm_bo_put(vm_bo);
>  	} else /* userptr or null */ {
>  		if (!is_null && !is_cpu_addr_mirror) {
> -			struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
> -			u64 size = end - start + 1;
> +			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>  			int err;
>  
> -			INIT_LIST_HEAD(&userptr->invalidate_link);
> -			INIT_LIST_HEAD(&userptr->repin_link);
> -			vma->gpuva.gem.offset = bo_offset_or_userptr;
> -			mutex_init(&userptr->unmap_mutex);
> -
> -			err = mmu_interval_notifier_insert(&userptr->notifier,
> -							   current->mm,
> -							   xe_vma_userptr(vma), size,
> -							   &vma_userptr_notifier_ops);
> +			err = xe_userptr_setup(uvma, xe_vma_userptr(vma),
> +					       end - start + 1);
>  			if (err) {
>  				xe_vma_free(vma);
>  				return ERR_PTR(err);
>  			}
> -
> -			userptr->notifier_seq = LONG_MAX;
>  		}
>  
>  		xe_vm_get(vm);
> @@ -1253,18 +999,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  
>  	if (xe_vma_is_userptr(vma)) {
>  		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> -		struct xe_userptr *userptr = &uvma->userptr;
>  
> -		if (userptr->sg)
> -			xe_hmm_userptr_free_sg(uvma);
> -
> -		/*
> -		 * Since userptr pages are not pinned, we can't remove
> -		 * the notifier until we're sure the GPU is not accessing
> -		 * them anymore
> -		 */
> -		mmu_interval_notifier_remove(&userptr->notifier);
> -		mutex_destroy(&userptr->unmap_mutex);
> +		xe_userptr_remove(uvma);
>  		xe_vm_put(vm);
>  	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
>  		xe_vm_put(vm);
> @@ -1301,11 +1037,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  
>  	if (xe_vma_is_userptr(vma)) {
>  		xe_assert(vm->xe, vma->gpuva.flags & XE_VMA_DESTROYED);
> -
> -		spin_lock(&vm->userptr.invalidated_lock);
> -		xe_assert(vm->xe, list_empty(&to_userptr_vma(vma)->userptr.repin_link));
> -		list_del(&to_userptr_vma(vma)->userptr.invalidate_link);
> -		spin_unlock(&vm->userptr.invalidated_lock);
> +		xe_userptr_destroy(to_userptr_vma(vma));
>  	} else if (!xe_vma_is_null(vma) && !xe_vma_is_cpu_addr_mirror(vma)) {
>  		xe_bo_assert_held(xe_vma_bo(vma));
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 0ef811fc2bde..c59a94e2ffb9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -210,12 +210,6 @@ static inline bool xe_vm_in_preempt_fence_mode(struct xe_vm *vm)
>  int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
>  void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
>  
> -int xe_vm_userptr_pin(struct xe_vm *vm);
> -
> -int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
> -
> -int xe_vm_userptr_check_repin(struct xe_vm *vm);
> -
>  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
>  struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
>  				u8 tile_mask);
> @@ -253,10 +247,6 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
>  	}
>  }
>  
> -int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
> -
> -int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
> -
>  bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
>  
>  int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
> @@ -300,12 +290,4 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>  void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> -
> -#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> -void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
> -#else
> -static inline void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
> -{
> -}
> -#endif
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 1662604c4486..65e889f2537d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -17,6 +17,7 @@
>  #include "xe_device_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_range_fence.h"
> +#include "xe_userptr.h"
>  
>  struct xe_bo;
>  struct xe_svm_range;
> @@ -46,37 +47,6 @@ struct xe_vm_pgtable_update_op;
>  #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
>  #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
>  
> -/** struct xe_userptr - User pointer */
> -struct xe_userptr {
> -	/** @invalidate_link: Link for the vm::userptr.invalidated list */
> -	struct list_head invalidate_link;
> -	/** @userptr: link into VM repin list if userptr. */
> -	struct list_head repin_link;
> -	/**
> -	 * @notifier: MMU notifier for user pointer (invalidation call back)
> -	 */
> -	struct mmu_interval_notifier notifier;
> -	/** @sgt: storage for a scatter gather table */
> -	struct sg_table sgt;
> -	/** @sg: allocated scatter gather table */
> -	struct sg_table *sg;
> -	/** @notifier_seq: notifier sequence number */
> -	unsigned long notifier_seq;
> -	/** @unmap_mutex: Mutex protecting dma-unmapping */
> -	struct mutex unmap_mutex;
> -	/**
> -	 * @initial_bind: user pointer has been bound at least once.
> -	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
> -	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
> -	 */
> -	bool initial_bind;
> -	/** @mapped: Whether the @sgt sg-table is dma-mapped. Protected by @unmap_mutex. */
> -	bool mapped;
> -#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> -	u32 divisor;
> -#endif
> -};
> -
>  struct xe_vma {
>  	/** @gpuva: Base GPUVA object */
>  	struct drm_gpuva gpuva;
> @@ -237,33 +207,7 @@ struct xe_vm {
>  	const struct xe_pt_ops *pt_ops;
>  
>  	/** @userptr: user pointer state */
> -	struct {
> -		/**
> -		 * @userptr.repin_list: list of VMAs which are user pointers,
> -		 * and needs repinning. Protected by @lock.
> -		 */
> -		struct list_head repin_list;
> -		/**
> -		 * @notifier_lock: protects notifier in write mode and
> -		 * submission in read mode.
> -		 */
> -		struct rw_semaphore notifier_lock;
> -		/**
> -		 * @userptr.invalidated_lock: Protects the
> -		 * @userptr.invalidated list.
> -		 */
> -		spinlock_t invalidated_lock;
> -		/**
> -		 * @userptr.invalidated: List of invalidated userptrs, not yet
> -		 * picked
> -		 * up for revalidation. Protected from access with the
> -		 * @invalidated_lock. Removing items from the list
> -		 * additionally requires @lock in write mode, and adding
> -		 * items to the list requires either the @userptr.notifer_lock in
> -		 * write mode, OR @lock in write mode.
> -		 */
> -		struct list_head invalidated;
> -	} userptr;
> +	struct xe_userptr_vm userptr;
>  
>  	/** @preempt: preempt state */
>  	struct {
> -- 
> 2.49.0
> 
