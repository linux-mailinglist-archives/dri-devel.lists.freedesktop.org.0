Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE5A7B0CE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D592510EB64;
	Thu,  3 Apr 2025 21:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOBXRxLG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F29310EB63;
 Thu,  3 Apr 2025 21:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743715450; x=1775251450;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NPSiu85J/MB9wTUbAoGI5cJPxTK0BqXQ3saDUdT4Skc=;
 b=gOBXRxLGLUevwBjuWii383VahYXrP4GTPik/D0RVpAkMrf2yhGMm7Fhh
 HoXfU1vQfx9KlZzDfwyZztxAD2NSnYTFHSqbXTWNuhqfEs3gC3qTe6jGt
 Ngu3aJaI1Z6l9q73UHTq0LZD6uMEOa7lH1C4UdVIKDny/JChCavvJrn+A
 yeSxhYkdkmDLGBZKgBQcV05WXIgi+Cz+HKjElAgWbG1DiCns/4RkUa+Uy
 XnUJkorAGauEvm5Vw5j81k4ytAJLY0oJLtn2La7vdZExKMw1zjcj1v7G9
 juNK9zKz9eyD7mVdjFhmN+8oZY25YvWi9FYnzaG0dwaP/l4KPvbADI4fR Q==;
X-CSE-ConnectionGUID: SeHpfmYqTqOI90VDHOXVkA==
X-CSE-MsgGUID: NdVyI3sIQpWzOeN+ugAqCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45164461"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="45164461"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:24:09 -0700
X-CSE-ConnectionGUID: DFAojDgETOegRR+Zx3TX/A==
X-CSE-MsgGUID: kIdSphCeQ8uOb4tGRND8rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="131258831"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:24:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 14:24:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 14:24:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVlUOK2nHQtw+EOVmIIAoNIuaBchYBhNm4X/4hzin3KCoj5ZKF85d9GAYXOquYsmJrVLjMAfgIJJK9rPMiloghrpet/9KNszzkW6/brO2mXJhCxW/8zhPL1SETW3JUWyFg36NdcUsK26J7WUBL5dnaqj4rIQj+PErPqo5oRgSJpijQ4QKVw59z/oQfWlUWKCEFayq94qg1hsKQJ7LxolrbEH7wF4+egC9fqit7ylq3RBmd8fWbKFyP7HyobdxfqmV6WOglByGM4Ia5d677uhf4ack1YYWaTlV3sctd4Co29r511gUVa59G6QdZ2enatWKE8ButZJtjB6xv5aSlbJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2NhI9gVHj07N+mEA8fui9hcthtSszuDNHPpXQXupeo=;
 b=Mt0i4umbpbQ6EdMCdeuKh0sfOnrME6HEmlnE2G3Wf46skcs2l3VaXUOX3+syF37ctRmqkx+Kxk2NJvoMQPsAN2XDYpKV4XnqxoghwyV9wKvpOFXthAsh63nNw7+f8D5EkYn0Xb9Hj+LRI6QH4O1wSeDreUAOEZP04NuqjoG88CxtabV7F59CUozizXMJ9OuL1QOBPgprqSZ6saedyWBnS38VBs4UT1DffkHYAka5v/GYzRPRTW/YlVWcyMoLCphpMa96AiHF4zaBhAbPQWZIErrWEpUQagIjnED9xFfWlBIMnqjVT1QwS165moUoDzMEGkJ81o8aiU5MNSd+/5AETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7954.namprd11.prod.outlook.com (2603:10b6:208:40e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 21:24:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 21:24:05 +0000
Date: Thu, 3 Apr 2025 14:25:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 7/7] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
Message-ID: <Z+78wBNpgGG+D7h9@lstrano-desk.jf.intel.com>
References: <20250328181028.288312-9-matthew.auld@intel.com>
 <20250328181028.288312-16-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328181028.288312-16-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0213.namprd04.prod.outlook.com
 (2603:10b6:303:87::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 516899ee-8eb9-4567-3549-08dd72f5dce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rAWyGbBfOZh3TdLYhGqoVq48RooJojBvLcyEFTiugmxaNtOHeBZqULXMMw?=
 =?iso-8859-1?Q?EIkhm6f7D1qXnzkdf8VR8T7DPw6GzCzVY0+DhNDZw5xjeOBnW2+eKcRBud?=
 =?iso-8859-1?Q?g1ymlKJALslpkIueJ/TCYrRTPYyc21pEaxBg2huUqjOwhyIhBihyBhLgBz?=
 =?iso-8859-1?Q?aXzGBvuusteoGWBgScpeGICRxBOyvfF5IB1vx0fVJsCqrEOIw2fd5OIQ4l?=
 =?iso-8859-1?Q?RV9HSOWyVO6pJNrwda5k0ai0D4XANPAFE0IbNe7SRlRVl+cOfbDcDA7ziI?=
 =?iso-8859-1?Q?cxcbUCAciGJjVbnuQi2mQquKz+6E7f37lWqoAZJbe/3vPlSBJ48jCiBJ78?=
 =?iso-8859-1?Q?FZrcFG19XzRl7VrSI0lnR5M/SqwqcWJSkpWxUGdJn4biRL8A/jSbjNopeQ?=
 =?iso-8859-1?Q?n8n41zgzy2ontMZXKQhFgW78ZB7z1seXuo32R6kesyAthXg0+r6Ok4lhKY?=
 =?iso-8859-1?Q?ZbmaQjbNNdDvUVrC083eBylgynVgArrDaWBLoZ1EyUAprAth8DLpePsqWa?=
 =?iso-8859-1?Q?nO+zH/hX6OS7NM2eeUJ1w1UUrdbNtCUM+Q5x3ifowBoxhT0LpikkI6QkYk?=
 =?iso-8859-1?Q?yZ0gLGSTtDaYdqEcmmFJAiFoDRnd89NdPq1g770gRHJ7wMDj5XrFaSYwNt?=
 =?iso-8859-1?Q?/C/Eyrp6UulIjbvFMYyeQxmJ7RihGC0C3AuQGSPNT0RNkbkGpwBQrOWM7J?=
 =?iso-8859-1?Q?Ie66mfrTSorROwZcdK/7TjxvcTKRfK0d1NkVEuEFalV+uz/0+wU4PvQpxn?=
 =?iso-8859-1?Q?411tFfVvCSk1ZWldrahJyREpmGEhh8P3faGtt/9iQJrJLKRxxY4b48ptHt?=
 =?iso-8859-1?Q?kgfDOfQ1c3qv9jaWV5knmEzQ/Af1FqewD2am3rYOl/7hL+pXd1IXr7cgxs?=
 =?iso-8859-1?Q?k5V4tpYe3b3ev3rRrAmbvHg84ntxjoW7xgQIsT+wDAJjXBRBcm4/e/7EEj?=
 =?iso-8859-1?Q?DXaxXmIhGg3eVXQkGRKpmHmbtwMsHjQ4IxSorCs/SDUR3RYc1OJyvSQ40T?=
 =?iso-8859-1?Q?TAwB9tpk2dIrsoM8wpeKC3k2rVHWSZJ0aiia5/8Zv9hD89bgXxvmLq29JU?=
 =?iso-8859-1?Q?mCox3dvYurPE+h2c/tNrMV9dr2SCSpThkYhhv5DIpmFLmM6yp1AsTeRWz3?=
 =?iso-8859-1?Q?S6ylz66+t9ynlCS2pdVltGHFANiJqAR3xq83iHK/N2doxgHvvlTNY9PuZU?=
 =?iso-8859-1?Q?4fUsM6n7rCAW20luV/e+JTyfBAQfUzZoSyKDn+tulu5KCccu33AIzi82Tf?=
 =?iso-8859-1?Q?G6JIWY+FJFQ1pb8kaUeLwe6ZwRAuUoL4Kam5JSyLRSYDJ7WogEZesU+BjX?=
 =?iso-8859-1?Q?s2iPAbnBentzR9WWS+cHSV7aJALVRau0pHY2G2AqZA02pE4PMwW//Wr2P+?=
 =?iso-8859-1?Q?NWJsHaem8I6+oitSNVIydcSG7f5cQUsGqhNUkR0Ny1Xs9Kf3pyNFNMCDbB?=
 =?iso-8859-1?Q?PUuZ2LhCoOLFVWPA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Msti+I3j5cIJco8AVdt8+H8YfyuIKRHM/onjl2OhoLgWhtcVqgj6oby/cw?=
 =?iso-8859-1?Q?nUvKY6yHfT6SLoIyWdAPc6Kw6nMUIHIo/8e7DSopexQ3CwhZfSJd5+5Zic?=
 =?iso-8859-1?Q?roXPyjalxkNI/YkIHwCa5whUoGSWz2dRqWw7YcpPWc6XfLTKqqyweF6nrt?=
 =?iso-8859-1?Q?248VH9mmHzxE1sYjXrxa6pERItTrdPk4vPASd3fwGFHfFd77cXZnPyXQV0?=
 =?iso-8859-1?Q?kqctTlsf5vCLfqlVHXGYnODIyXjw8Rd160/jMa/ViLop5fSAlmLzAFQx/Y?=
 =?iso-8859-1?Q?gvVE2A2wXYCIzMWkXXDF2X3NvCZF78/4/vEdiYGosMxr1LLxPK0IEFkBU0?=
 =?iso-8859-1?Q?DJqmvAwQp/gsXT7lxv9qLo/GowLU6nZe+e25BbxJqTE/gz958PSQ8WJBPc?=
 =?iso-8859-1?Q?oCb/iYI8Ms/+GxJtUDEudXGSmiOEZRbhNe5nVq25WJje89DqFEyYKHvIt7?=
 =?iso-8859-1?Q?IQFH9B6V/416bcu5ElBLxukMcXH6QD1qHgAdlaPtq8/V5p2j+9LyEfXteL?=
 =?iso-8859-1?Q?qFgMCINwlluNHCphhGwrGAMdyzjHtx29D8fs6K73jfecUAy91y0qmlQlLV?=
 =?iso-8859-1?Q?C4Agf9Ax2IZNQ5H/HNTwHLFZ3zLnWLNYh+7t4UaBZ2mdA07kVspc91A0km?=
 =?iso-8859-1?Q?M44lVri8VSmLgajI58f9mWjfsCWEWjNlWo57zNJLRMHzZ0iWQHEHYKlZgj?=
 =?iso-8859-1?Q?T4NO9pTeGdOLi5YTOdcUqXFkrcDiidKTLdIKRi2au+IRAHayI7UFQakIRc?=
 =?iso-8859-1?Q?sKT7EfJvVc2JvfSdip5pIMxKuhHtL1rno3+blaDsVHIycV4ma9+L0aUyyA?=
 =?iso-8859-1?Q?hBw2Y0Uzq7iyPxHPOYWbqIAyXLow0aL7GUumNtj3UUG13hVEDoNfYqidV3?=
 =?iso-8859-1?Q?7xoLfiYnWX+F5LhNZcfsaJ8546Rg4hw+u0OpG/+jStlSOA2GdOB/WvO4PA?=
 =?iso-8859-1?Q?pHAKgi1xSrNPBeoQ8lBHDcFRtQwUeC5NK3lbmAw17NhAqQfVm42asd0enu?=
 =?iso-8859-1?Q?5J2EcJkQ6hUmPRlAAsR41M4rDxRtOm0hzI7HO6Fm3Uc+W1RpFBIoGbMCPD?=
 =?iso-8859-1?Q?ldV1SzCg4Ch07gYaBkNmoVix94l5qmndUo7o2VXYBZYmCL+rhYUwCGDZ3M?=
 =?iso-8859-1?Q?kf5fe/wruFSycLi7Q3IVkJZTYGLQWwZG0rsC4sNM6JfQLiCXqshE8mI5SH?=
 =?iso-8859-1?Q?WvE8U7jhw8f68sXJeT87jDYV09s6/CQgI4VtP+/ZqJgtcIdAdJWSAw9qx1?=
 =?iso-8859-1?Q?+WCWyNFuEnFvyNDBFn9Z01RrYVsqZpmU1kU1FNOFp40q61fa8fDQhxgUzt?=
 =?iso-8859-1?Q?IvJolnLnKknxRS9Yz+v4dnREvwAPuVagHd7vFAAGgLCUOCoUXByy5USjs/?=
 =?iso-8859-1?Q?jhkwFvVwWtwW380EIh6mzQjjT4b1t/NkT1coXFEr3gV08w2ohSb/zX2cCy?=
 =?iso-8859-1?Q?p20HUnFY/3yhe1geg11rBsiC6HWOWz7xIT8JI1RhgG/z+iy+lAfC9zpygr?=
 =?iso-8859-1?Q?0RtPIZvcRintaIknvVYE7ZwbnLFdP2ypmOxRsesSrPuXw+8yb3K/4ySXAN?=
 =?iso-8859-1?Q?/OMKENpN1KOZkd9yrJYOKrtIUN7O1SRM5pX3lxmwqIEgKWPNuSiLVxhX4c?=
 =?iso-8859-1?Q?etKkY/R5moBx3XKrZs5DafocV0j2n/a7G6UQx4EBIfZ0BOKu2T5zIfrg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 516899ee-8eb9-4567-3549-08dd72f5dce7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:24:05.6907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFzzH6l6UdVzZDIkg4TXujGq9qq02+MQEBjqjO3sF20v6I0kZmkB9PjbNte5zzAyq4AnPY+0s97qtSLfKdQQog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7954
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

On Fri, Mar 28, 2025 at 06:10:36PM +0000, Matthew Auld wrote:
> We now use the same notifier lock for SVM and userptr, with that we can
> combine xe_pt_userptr_pre_commit and xe_pt_svm_pre_commit.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 95 +++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index b097c91e2e02..947b82aa19a6 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1396,7 +1396,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>  	return err;
>  }
>  
> -static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
> +static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  {
>  	struct xe_vm *vm = pt_update->vops->vm;
>  	struct xe_vma_ops *vops = pt_update->vops;
> @@ -1409,55 +1409,40 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	if (err)
>  		return err;
>  
> -	down_read(&vm->svm.gpusvm.notifier_lock);
> +	drm_gpusvm_notifier_lock(&vm->svm.gpusvm);

Also any reason not use xe_svm_notifier_lock / xe_svm_notifier_unlock wrappers?

Matt

>  
>  	list_for_each_entry(op, &vops->list, link) {
> -		err = op_check_userptr(vm, op, pt_update_ops);
> -		if (err) {
> -			up_read(&vm->svm.gpusvm.notifier_lock);
> -			break;
> +		if (pt_update_ops->needs_svm_lock) {
> +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> +			struct xe_svm_range *range = op->map_range.range;
> +
> +			if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> +				continue;
> +
> +			xe_svm_range_debug(range, "PRE-COMMIT");
> +
> +			xe_assert(vm->xe,
> +				  xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +
> +			if (!xe_svm_range_pages_valid(range)) {
> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> +				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> +				return -EAGAIN;
> +			}
> +#endif
> +		} else {
> +			err = op_check_userptr(vm, op, pt_update_ops);
> +			if (err) {
> +				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> +				break;
> +			}
>  		}
>  	}
>  
>  	return err;
>  }
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> -static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
> -{
> -	struct xe_vm *vm = pt_update->vops->vm;
> -	struct xe_vma_ops *vops = pt_update->vops;
> -	struct xe_vma_op *op;
> -	int err;
> -
> -	err = xe_pt_pre_commit(pt_update);
> -	if (err)
> -		return err;
> -
> -	xe_svm_notifier_lock(vm);
> -
> -	list_for_each_entry(op, &vops->list, link) {
> -		struct xe_svm_range *range = op->map_range.range;
> -
> -		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> -			continue;
> -
> -		xe_svm_range_debug(range, "PRE-COMMIT");
> -
> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> -
> -		if (!xe_svm_range_pages_valid(range)) {
> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> -			xe_svm_notifier_unlock(vm);
> -			return -EAGAIN;
> -		}
> -	}
> -
> -	return 0;
> -}
> -#endif
> -
>  struct invalidation_fence {
>  	struct xe_gt_tlb_invalidation_fence base;
>  	struct xe_gt *gt;
> @@ -2255,22 +2240,12 @@ static const struct xe_migrate_pt_update_ops migrate_ops = {
>  	.pre_commit = xe_pt_pre_commit,
>  };
>  
> -static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
> +static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops = {
>  	.populate = xe_vm_populate_pgtable,
>  	.clear = xe_migrate_clear_pgtable_callback,
> -	.pre_commit = xe_pt_userptr_pre_commit,
> +	.pre_commit = xe_pt_svm_userptr_pre_commit,
>  };
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> -static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
> -	.populate = xe_vm_populate_pgtable,
> -	.clear = xe_migrate_clear_pgtable_callback,
> -	.pre_commit = xe_pt_svm_pre_commit,
> -};
> -#else
> -static const struct xe_migrate_pt_update_ops svm_migrate_ops;
> -#endif
> -
>  /**
>   * xe_pt_update_ops_run() - Run PT update operations
>   * @tile: Tile of PT update operations
> @@ -2296,10 +2271,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	struct xe_vma_op *op;
>  	int err = 0, i;
>  	struct xe_migrate_pt_update update = {
> -		.ops = pt_update_ops->needs_svm_lock ?
> -			&svm_migrate_ops :
> -			pt_update_ops->needs_userptr_lock ?
> -			&userptr_migrate_ops :
> +		.ops = pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock ?
> +			&svm_userptr_migrate_ops :
>  			&migrate_ops,
>  		.vops = vops,
>  		.tile_id = tile->id,
> @@ -2419,10 +2392,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  				  &ifence->base.base, &mfence->base.base);
>  	}
>  
> -	if (pt_update_ops->needs_svm_lock)
> -		xe_svm_notifier_unlock(vm);
> -	if (pt_update_ops->needs_userptr_lock)
> -		up_read(&vm->svm.gpusvm.notifier_lock);
> +	if (pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock)
> +		drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
>  
>  	return fence;
>  
> -- 
> 2.48.1
> 
