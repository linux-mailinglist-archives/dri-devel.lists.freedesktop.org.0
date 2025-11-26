Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913E1C879AD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 01:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9CC10E4CA;
	Wed, 26 Nov 2025 00:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnjF68ca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF66010E4C1;
 Wed, 26 Nov 2025 00:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764117459; x=1795653459;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IL5/mc7x/nbdCSGAEPbErckZVmX4NSP7UBx17ZwdVoY=;
 b=AnjF68caDXBh9XmP2Ah2Oo3sUSrvvahkLjJddq6pOYxn3dUiWQTOFE35
 nddz/GS9pv/P6wVT7ZLowWf5lgfuHHLahIgDy4xwmt7nk2qRfsRwKNt9A
 6HFxVph17Hsc9ncQUf14FE4s9K9K717z2NCULX2EnpzEqaSxZ2PLqvJgn
 ii1jp3TMkFVXq+hifGsY68n5qRdO6+wQ+nY9hpbZoNpERL2K/9q2mBvoX
 q59Hh+dem8LMy4NBL5xL8yag/VmN/Hx/b4Loqbdhwjj5cuWVstvUALqYh
 cK8mjvmE5dPGy3Mw+IrNsWm2IGRxK3vj5fMVSp08I3v0fq2MfULnEi/iB w==;
X-CSE-ConnectionGUID: aLW8NGScSDa6Y5uIKD8/Pg==
X-CSE-MsgGUID: rvS6AzJsR++a/ECMeITSLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="53715253"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="53715253"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 16:37:38 -0800
X-CSE-ConnectionGUID: L2bVa7rASvmJqqBR5DbwKA==
X-CSE-MsgGUID: jZbWvOIsR0KU4sWIL0Maig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="193019345"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 16:37:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 16:37:37 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 16:37:37 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 16:37:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQDhnAB3lIlze8qzhOUqZ1FF1nS48/Ft9Obc+Vyy5ffspjytXqgWWHRoFFNOam3gQtVmBTIXlmI2CXRVM8Egt1KDzITORO2o0CzzX9DjWw2f6Api+LikkXC+K9u67niP0AtEz/4HUqyYrT2J0T2d33VtweEHgySiM2XuzonloqSAunZfW89yPaM+3sfgcOJM+XNp0Q1C2TbBuKcqz9MPhGwIlJ5RiNjqnKKbLl+Na9Fc9BgiI0VxU8WXPShsmEVvL/UkgVb01jz+K636otJQYTyznP3xz10zLfTXImOrt2wCREJ4eac/1VHlDhe+X3l/5Kh4YCXHvC17deDnWZsruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+ybbZRDXeZI6qolQIBeplr0iCik+Kjb1esOrspX3m4=;
 b=nW5hcN9ATu6izfSSP15WQc5rU2KtLKVlu2xV0pCMcvIdWKfc7kh+bsrVUb88BCLprAbEhOtdSLAMYw/5sn+o4EJTpTL3Df8Mi5qiVq0TiR9VhIsoJPTy1nLVbjCEngG+vus7o/IlQFY3/WJ02/mm3o8YmIg6CgFv2JT0i4XloQvGPBzSuXcZAeHcW+YK8BX3BL39K2zUPTdNBT9lkv8raEuzTdzOEjGL7aQACZ4nokM60q6+0rg709bvlLHxAGYLwb2T5dlWrjxxciK1mcFwKUIr6yXyFh7vFKX2AD4yMv8JoBZgOuyGkxKen6zbElm4V/SV6YcsS/Smeqva8VQ4fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 00:37:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 00:37:29 +0000
Date: Tue, 25 Nov 2025 16:37:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 10/17] drm/xe: Pass a drm_pagemap pointer around with
 the memory advise attributes
Message-ID: <aSZLxvMpAt1al7IW@lstrano-desk.jf.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <20251111164408.113070-11-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111164408.113070-11-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:303:b6::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: a5656531-53c5-448d-6782-08de2c83fb01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?e7sIio7sD+Irn5z2klvCnztCufN088UHIE9+7MJB3YH/EbqdDSNnSeUaQh?=
 =?iso-8859-1?Q?90RjDmZsrR0TYKalQr/bTAHf/cGrzu+Dsns/k6v+uQY8rYQmchPCyjXbLX?=
 =?iso-8859-1?Q?9uNr4v562fbJM4jgUAnZM1clYVhTRGe9K+VRREjbQhoZ4cBUYSpg/NypY/?=
 =?iso-8859-1?Q?p4M3GF9ez7mVcS+mSjVkYuw9YgACLs2zpfKLPs4kS3zvbe0rvlVbI84BhD?=
 =?iso-8859-1?Q?Fv5h5IIgQwHrNuMFf5WpY97Li0D3N2ikOFqycwZkJB6E6Skh0d8E4EB5+8?=
 =?iso-8859-1?Q?vSg0MVmoyNlEufxGZmZw08voYD+Ei3r5eo1DmHnyPlEYj+5gh1UFn45Pwf?=
 =?iso-8859-1?Q?zhdochCjYHSaqJ1GOaGpuC0qEdmAh/nD84ICWnGs90DlzpO2H5AwRn85jL?=
 =?iso-8859-1?Q?IyHaZ3pWV9mFvpHqH0qgyQ4edl8K0CzVRKqgOnuWfI6k8ODFd8OJmij2u5?=
 =?iso-8859-1?Q?2xnGOXICGeG5zlgq8jZhUunMXgaGEVzBq9hf2qwgj5tPsUNgkaq+LyYUHR?=
 =?iso-8859-1?Q?p13xCau7rLdrEhGBVxiBZV7euxEUJKFrg/npdWxV4Tn5+BJqTn6Ur18Vhh?=
 =?iso-8859-1?Q?d98YZY4WJL0oRWmH8yai148XDXM61NSJ7UoJWBvKWF+vAnYxxRhqzncDuE?=
 =?iso-8859-1?Q?bl3315VoB6hSiyj5via+mrQhHhnOlJzv+4cR+eV70RCnkBRaD/KtSuC1/E?=
 =?iso-8859-1?Q?/YVhCu+1IJ8yn8j1kaSgbH3d7gbSrujzn1eO7EAp0oNC974rZEvaOkvziI?=
 =?iso-8859-1?Q?AiB0c1TdIecMncOWkC8+grZJcwVrjtN+wEqxGP+r3C4a8mxzqdHV2kqejg?=
 =?iso-8859-1?Q?Mz8v/U5rgK2fwGTq/jHXcOKa+DMSpqxLxrwXTIFyPmFo7mcZCv+YXOwU1M?=
 =?iso-8859-1?Q?YOt2WyO11vCnRhu2BAWhUgbAosye0Y4/qWVsl2U4E7hLD8C+wkaTDN7TLr?=
 =?iso-8859-1?Q?vLZyKvByr0VCKVOfqIBflqshzNqlornIt/YoiJ5u7RrVQjHr/EhYNqf01s?=
 =?iso-8859-1?Q?wZxgJqMYtOqx9mRiJW+PwMHa0HmsztD/VJ+ITlUWue7Isi7uxgx06xbOLm?=
 =?iso-8859-1?Q?1y1wJm/f5kjIVYOZQaCG7Xh8iOawrjbnhQTKIXqAx9VXAXN360PKdeI/p1?=
 =?iso-8859-1?Q?HwKG1ZpbPdQV6DRCZUKJBQ9/wzOUiyDo8stKCaPXYXojLmzoWoZn4QcZA3?=
 =?iso-8859-1?Q?oN0JgSfGqOn/2Oz/n21+Tw9m/IGchOzKfxw7IC3g6FbjdXBMVP/J7aaSJ1?=
 =?iso-8859-1?Q?twbofV8lr7j6p9T12APnRSbc6MmRnQ/QVwpE3dexKjEGefGNu/37sJMLzr?=
 =?iso-8859-1?Q?aurMNjJYP1XiLQpVHFHj0ZbVt29EUzgeEMzLHaS01ziMM1e8KrwwBQ7ZDX?=
 =?iso-8859-1?Q?A2TPh8E14WMPj/g+WwTpQTnwaTBuE0s/ZG/qA4zEc5o+tb1RlJPYV/or+k?=
 =?iso-8859-1?Q?NQUscNs7MhuOfBNCkjylvnddwLAX+6B7EFPb/dW2YNykO85CM0o0K2ARZe?=
 =?iso-8859-1?Q?t9wNXsVlhgo3HOToPaTVGo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xOFrkglL2snjt0UI7nkUGv3uV0o9xfe6uOzw1Er7pvczQt9LouY63PfGZb?=
 =?iso-8859-1?Q?LYRS/lPFzVbm4ZcR1dn/LizdZEWwQJKqkZqJBe6oq1THCO53hFTE6LALYU?=
 =?iso-8859-1?Q?glX6x79SQZZji6VMiadZnPGE0O0KNWfuA0mGeAKqrpfBLAufDh6geIDM5r?=
 =?iso-8859-1?Q?G7J5UHXJL0+cKpt4aHC7puDRknJLyb4FUwSyInX3O0bFBlUpviI5a16TNu?=
 =?iso-8859-1?Q?cPn4ugx8CJ+I+iZPqs+aVYVOBiNeOpQxEFHnr9x210eKuGuyQqeAgodDZD?=
 =?iso-8859-1?Q?Q4KqVTzUIL0s9dE/byRFlv6SUuV+ecv9Hu8XUf0mdjfMdQdOoqPXEPJBHk?=
 =?iso-8859-1?Q?YTpVdkiDgT9TumkTLcxlP4iat9mD3DAHzF4zQcxNsxnDGvpX3zzOpzzuEh?=
 =?iso-8859-1?Q?hZqPA6C78CSNkFG2aJX7Cvs3qz1EspcX5Ti4f5UxS3glQ/t8nQgNXKRF1E?=
 =?iso-8859-1?Q?zHo5rbeiahrXQqUk7zqM0Em3YSb4qayzyBNVtudx1cnB3SA1GHO4suHtqg?=
 =?iso-8859-1?Q?bfakVFxIjrUI1bYCPVtOQEGnnDR7vLvJiI33hCvdgJxlt65m12C+uT23TA?=
 =?iso-8859-1?Q?ely8msBKV8WWCQe9zQxkZG/NY6xE4h6uEqTkHtMdUbTgYH/MCKJ8nkg+yk?=
 =?iso-8859-1?Q?KnfB3qRwKIC5OLokUVYLSCuU8/mh1pilKUAgyy1ePDwDUSDhp+h4Okmz1/?=
 =?iso-8859-1?Q?dOolEcaEI426/NSZQG9+VqkS/mA60T8ZLLijP02LBArrMlI1X+GaXFbebc?=
 =?iso-8859-1?Q?Zg7koi66x3izPHAMdYKr1YZZ4xCV2HZla+QY01skJDCOa0GlMEEQAIpcPl?=
 =?iso-8859-1?Q?NNDol9UfRbkff3v9FO10d6d2/vP73oI6owg52fTAYIGXUnnGe8jmVeC1kk?=
 =?iso-8859-1?Q?EHl/+1JkKY3ETLRvLdNtO+lcqjLM1VC9PrJYHDkBRCElhA0kZhTd6Fsp2S?=
 =?iso-8859-1?Q?Yw16ds5fMx1yTCNaJLldETm5+69sbjzKFR+HuwVs8mu3hB/27asYYf9TAo?=
 =?iso-8859-1?Q?5uruAkxbRVt1G3EZjOTPN+xSWBvOsn4g3uUByTbj/hEcP8B2J/5/efzLhE?=
 =?iso-8859-1?Q?Ob0L6jjQNF+GnrrcrWtNj+vTkbGJDomoxntWZ7uhBCFENhoU+YlHbbsGQk?=
 =?iso-8859-1?Q?wzE3VOTeBALhCWrLFnpsGbpuy+HX8+2WK5K4nkPBd48cwGz7g9QMmpV7BL?=
 =?iso-8859-1?Q?Xji8+ZgbHILFg9R74QlaLSPFCK4zYNdiFEdUKz2DhCXxXe5Wou8aebGMH0?=
 =?iso-8859-1?Q?XATl8qZPVkgDNGX8Te7+t47uUr9VVYsh490YCMtnD1Tf8rIiKGbl2fFCcL?=
 =?iso-8859-1?Q?Uv6RdfxQBNCEc7lVyCegJRMH6lcm31mT8JwUPTM1tOFr+ydM1oL9LP6avn?=
 =?iso-8859-1?Q?7D/lYzqvYzNCeIAzNhSLRQrIrnWpmaAufzvqyVsJvUMCe1esmUpGZ2YswE?=
 =?iso-8859-1?Q?6KFxbqbrQbf33GGrmf/OD8GVdor20QB0qUZgsEmsQsujAtlkDFxXNVjrWO?=
 =?iso-8859-1?Q?3bOHSZASjtX2EiJc3tlRC855dVtXbrdhr0yj7KoZgpztLcR011aUov340g?=
 =?iso-8859-1?Q?Shc6iQiphX1d2ZBk/mdeW9gsvYvhzPYuaFJWVUDNsIzO/7VXZcCzjYUIB0?=
 =?iso-8859-1?Q?dZZVdJsVEfkOYl2OtDYWj3O4AkmNQPHUuBPewUEKyeXjEMtYfcQD2Vxg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5656531-53c5-448d-6782-08de2c83fb01
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 00:37:29.8081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiRxtkqx6Hqw6kAMj8/cT6FGOK1gtoBsLrCC8bl14oqEeObZmCluSHAPt1hoL0+R/LITTQQIiN87xmkBxpTR1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

On Tue, Nov 11, 2025 at 05:44:00PM +0100, Thomas Hellström wrote:
> As a consequence, struct xe_vma_mem_attr() can't simply be assigned
> or freed without taking the reference count of individual members
> into account. Also add helpers to do that.
> 
> v2:
> - Move some calls to xe_vma_mem_attr_fini() to xe_vma_free(). (Matt Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Replied to wrong patch... Anyways for this rev:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c        |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c         | 34 +++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_vm.h         |  1 +
>  drivers/gpu/drm/xe/xe_vm_madvise.c |  1 +
>  drivers/gpu/drm/xe/xe_vm_types.h   |  9 ++++++++
>  5 files changed, 41 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 7db9eafec66b..4a3853a5cd64 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -329,7 +329,7 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64
>  	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
>  		default_attr.pat_index = vma->attr.default_pat_index;
>  		default_attr.default_pat_index  = vma->attr.default_pat_index;
> -		vma->attr = default_attr;
> +		xe_vma_mem_attr_copy(&vma->attr, &default_attr);
>  	} else {
>  		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
>  		       range_start, range_end);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2321e7c8ae76..27669f80b7ff 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -957,14 +957,37 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>  	return fence;
>  }
>  
> +static void xe_vma_mem_attr_fini(struct xe_vma_mem_attr *attr)
> +{
> +	drm_pagemap_put(attr->preferred_loc.dpagemap);
> +}
> +
>  static void xe_vma_free(struct xe_vma *vma)
>  {
> +	xe_vma_mem_attr_fini(&vma->attr);
> +
>  	if (xe_vma_is_userptr(vma))
>  		kfree(to_userptr_vma(vma));
>  	else
>  		kfree(vma);
>  }
>  
> +/**
> + * xe_vma_mem_attr_copy() - copy an xe_vma_mem_attr structure.
> + * @to: Destination.
> + * @from: Source.
> + *
> + * Copies an xe_vma_mem_attr structure taking care to get reference
> + * counting of individual members right.
> + */
> +void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from)
> +{
> +	xe_vma_mem_attr_fini(to);
> +	*to = *from;
> +	if (to->preferred_loc.dpagemap)
> +		drm_pagemap_get(to->preferred_loc.dpagemap);
> +}
> +
>  static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				    struct xe_bo *bo,
>  				    u64 bo_offset_or_userptr,
> @@ -1015,8 +1038,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	if (vm->xe->info.has_atomic_enable_pte_bit)
>  		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>  
> -	vma->attr = *attr;
> -
> +	xe_vma_mem_attr_copy(&vma->attr, attr);
>  	if (bo) {
>  		struct drm_gpuvm_bo *vm_bo;
>  
> @@ -4240,7 +4262,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  	struct drm_gpuva_op *__op;
>  	unsigned int vma_flags = 0;
>  	bool remap_op = false;
> -	struct xe_vma_mem_attr tmp_attr;
> +	struct xe_vma_mem_attr tmp_attr = {};
>  	u16 default_pat;
>  	int err;
>  
> @@ -4333,7 +4355,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  			 * VMA, so they can be assigned to newly MAP created vma.
>  			 */
>  			if (is_madvise)
> -				tmp_attr = vma->attr;
> +				xe_vma_mem_attr_copy(&tmp_attr, &vma->attr);
>  
>  			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>  		} else if (__op->op == DRM_GPUVA_OP_MAP) {
> @@ -4343,12 +4365,13 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  			 * copy them to new vma.
>  			 */
>  			if (is_madvise)
> -				vma->attr = tmp_attr;
> +				xe_vma_mem_attr_copy(&vma->attr, &tmp_attr);
>  		}
>  	}
>  
>  	xe_vm_unlock(vm);
>  	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	xe_vma_mem_attr_fini(&tmp_attr);
>  	return 0;
>  
>  unwind_ops:
> @@ -4406,3 +4429,4 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
>  
>  	return xe_vm_alloc_vma(vm, &map_req, false);
>  }
> +
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index ef8a5019574e..d328d31afe8e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -411,4 +411,5 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
>  #define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
>  	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
>  
> +void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index cad3cf627c3f..9553008409d1 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -95,6 +95,7 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  			 */
>  			vmas[i]->attr.preferred_loc.migration_policy =
>  						op->preferred_mem_loc.migration_policy;
> +			vmas[i]->attr.preferred_loc.dpagemap = NULL;
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 0d09a322199d..ca489aa7c652 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -20,6 +20,8 @@
>  #include "xe_range_fence.h"
>  #include "xe_userptr.h"
>  
> +struct drm_pagemap;
> +
>  struct xe_bo;
>  struct xe_svm_range;
>  struct xe_sync_entry;
> @@ -65,6 +67,13 @@ struct xe_vma_mem_attr {
>  		 * closest device memory respectively.
>  		 */
>  		u32 devmem_fd;
> +		/**
> +		 * @preferred_loc.dpagemap: Reference-counted pointer to the drm_pagemap preferred
> +		 * for migration on a SVM page-fault. The pointer is protected by the
> +		 * vm lock, and is %NULL if @devmem_fd should be consulted for special
> +		 * values.
> +		 */
> +		struct drm_pagemap *dpagemap;
>  	} preferred_loc;
>  
>  	/**
> -- 
> 2.51.1
> 
