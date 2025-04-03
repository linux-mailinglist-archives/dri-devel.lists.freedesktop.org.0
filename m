Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A92CA7B053
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACED310EA6E;
	Thu,  3 Apr 2025 21:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQxoe9K7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBD810E11E;
 Thu,  3 Apr 2025 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743714878; x=1775250878;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XVDHM4gSFw5/B5AeUiPi+DdvLlsYT1tshd8vLxE0Ztk=;
 b=CQxoe9K7ClqJTHtL7zSF4vnT5vX5C6WOtW2t/cVxMfSUbxPSVf2hg/Ov
 Q2qHfmFSNzY5QIT1hSp6p+KJQMrLn1E0VJM22kp4SNk5z3F16DeonZBoX
 wAAtk0PRrW83KqwNDjs65WvfdePN/0JwYTlJO+Pl+a7u8Pj99n9ChDxVe
 cyJR5b4TmyzqLysXJk2StGfqtmdjias6LVUm2RS7DvT+VASXeUsnmtBy3
 FgBg1F5hRgXlG6ZBHS7BsWR9A9ChAx0OCw/jZ5DzT2ygun+WkGqx/80QG
 K4JR7yH0r6k4tPIYyuk54P84unkIc7dmd95qPBDD2hIq8f6LWxxyPoHB5 A==;
X-CSE-ConnectionGUID: /jMpCPWdSoGBz20UAoO5VA==
X-CSE-MsgGUID: +mBQoSI5T5OU7tl2dcnsHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45162918"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="45162918"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:14:38 -0700
X-CSE-ConnectionGUID: mCkwFpJyRLiYrcgnDDxkEg==
X-CSE-MsgGUID: ddAw3Sx3QcOjfMUOXQxV4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="131984869"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 14:14:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 14:14:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 14:14:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:14:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1zuXPaR2iYuabtgbuzfo6hCFQKMMRWEfUUkn0YN52Eohh9FXqQIZZcjgjgOoMzLV0nbaMwAN3fxAwhHiZAltDH4Bsp5MsfqGmsXIJAlLxnzrvaXca5c5X64DV3xVe+ovXMONeRhcg01C4WrilQRxxc2sYABIvcXRiZVlM59r0T7bV1YNqXThoR+cwjNhbKLwsAM4c+P9KRlGo41o9QX430IIn1eQt3JbzCq7XGNTu0zmvCtfnTZnbOuJYgMTt9zGftw4d8x9jZLvE+S/d+lKgtgwcd44YOJpU4YciVHqOFUF7wTtMBLu5zAEuJK52HCHbYWNt8mmaV3wt0n0a34EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zzgx3HxWkXd2/e2xVl3JsWlO9lZthhNaegzjHGcsB7E=;
 b=Lbvdwy9Txgs8DwF0rmfM43oBdeyJFRRNpJ9v6EaOUCDV5Ezn1MfQ2IEWQBs9M72rYYGjg25RQ4PBbIBPRwgoCY/HRkz9IzaLpaG2uLV6IZRYJeHvL9VIWkW1oX33ZvqF/t1yKIvHwDB0tA00MVmKiIROzVe38zLB1nw4mqUJLyJGnWeXSW0CpeuU27R840D/fJaCnY6CpxweDlsaiM4MUdSd1iv/mBGAceS3O0ZKoyoeBxVKWMHMN6H0p663kf02/WurTURU7wDke2lLWE3EkcEvkskaeegsumQZv8KWw5iBzhwk5/6L4IN1tWZUwsydoVz5AYYxzw8uOHUkD26U+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 21:14:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 21:14:33 +0000
Date: Thu, 3 Apr 2025 14:15:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 3/7] drm/gpusvm: pull out drm_gpusvm_pages substructure
Message-ID: <Z+76hJ4ZF1u/bfkF@lstrano-desk.jf.intel.com>
References: <20250328181028.288312-9-matthew.auld@intel.com>
 <20250328181028.288312-12-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328181028.288312-12-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:303:b9::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b877a7-8845-445f-2a25-08dd72f48802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?iOsVsJfAhVPZmVY+twUKJ7fKksoCdbemFlvJ/53VUkOPQsbNywmQnLVhvK?=
 =?iso-8859-1?Q?kXFkMFmDxN1hrgxmvZDOTdM8agkRlpeNca/eejEZoFB5B1BgZmRM4XRY3V?=
 =?iso-8859-1?Q?VqLB5DFORiwY9qGwytjhPajWLUSluXg7EGDDMJm9x8futBSB6sALDYZQyw?=
 =?iso-8859-1?Q?Zx2ZhPgv6A/ytWPNg06S2lJOWt5CLGJ8EbN3GUKsKb7wq11zmvzSHK5sID?=
 =?iso-8859-1?Q?S9wt0hXH2mXmywdZCp8pUsK464zz/6yAiP1DR8OawCuNczWsXaTuVtuGOi?=
 =?iso-8859-1?Q?2KCBc8Nk4kou9gQ1mglcW0mXpO4dPG9CeiNJgQp8yRDRfOjcm8OjSjzkrP?=
 =?iso-8859-1?Q?3tvM+8Q80+o6O5KLGVvKNf0tpHdO6mDdauu2w3iwZO5FVRA7tN7/8Rmek6?=
 =?iso-8859-1?Q?D3glwCcZh37gtYUMot5NtBtI8OjTViEYJSIGSKuR19drLyOhsFS0Y2lphl?=
 =?iso-8859-1?Q?Ok6i/MF9NqLAmmKM8SshAGHLDKCD22xsNge+qbZGSUHOdMkkgurm0i5NnV?=
 =?iso-8859-1?Q?SvtbtAHE4LahapbcsKIEdMJ4gCxIPdHs5Zxaf/SlEvx+y59QSj1pFsKPwk?=
 =?iso-8859-1?Q?QuxRO80XiQqUAVUFW3etIZzFd+wEb9rQE65E6cH7y8hiow7whXqV42vAap?=
 =?iso-8859-1?Q?/Yq5wBuovYT8XZtfj/GZ+amn80MZjI9I2ruFiJJ5tQbpLgPYvPAvFwx+6K?=
 =?iso-8859-1?Q?4kV3jU2E0QF437Jkp3HjW9PTXiNcyS9+459a2GnfsghvmQp85fdElYpwp9?=
 =?iso-8859-1?Q?oVYbIS0ELR3r33+eZpROifM6bnI8rp+oH8b0TLukwSOaCpvno7zaB7THtb?=
 =?iso-8859-1?Q?a9OOxV06WclHWY8l+FRBFu2x16U08kO/fCEKzp0oPL01h9KofGC8vRsy4J?=
 =?iso-8859-1?Q?WgYrHMdCe6dRHQGCMlcf+/UcsiY3ZvCfUlM5mYuXYVYbHP8SxKu9aA7Tyz?=
 =?iso-8859-1?Q?KkDyNcP+4uOHEm8zY7Xc7LHaN2O92Dw4PAzuythiKT/S8o6p1rYTtW1iIC?=
 =?iso-8859-1?Q?3A79vRkmQlMWcBDXfssyCXJy9zrO5uUKEPe9etOIVtAPz39vNpXVA4b3Gp?=
 =?iso-8859-1?Q?mrXloNHSX77KwocI6Jz6hIGHvvQNhH/2kv9h3iQQuKOsEbV94LdJapKep1?=
 =?iso-8859-1?Q?vt5KmnlvCiaVr0f434Y+piqyHXn9ybTzJfdBmxuyJ1Y+CGVb1irgUBqjeO?=
 =?iso-8859-1?Q?etmjwpfwwd39OFX9Pd9ncTLZSheSTZLrDOzE0iNR2c3kZGc0EimgEJql9Q?=
 =?iso-8859-1?Q?dDQWV2od4/2Ddvv07j4MuB5KqYorIwoXJlKIjpsKTEYonPrNuFoweR3PGm?=
 =?iso-8859-1?Q?Ry/FTS+VNx8KHPOppPxU0qPdISvxTTxpnRkFIFqcP6Mnz1RL6vn+7bE661?=
 =?iso-8859-1?Q?bA/bZlDPuoSTMngHaG12DJNwDErQvyFgW8Dszu9YJaS7LTcQHWvWiJQfSk?=
 =?iso-8859-1?Q?CKyGD0LBrTovshzD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mMJUhoOD+zcpsAdIb/eU8vPz4ZJDD0p+yaS0l/BNyGLnRgzsuFss9nVpj7?=
 =?iso-8859-1?Q?x0gdCJq91UAy/D2MBs+yeqkRVRqMNoqqx0XKmBkTnqlA+FNZ2edyhARc1v?=
 =?iso-8859-1?Q?BRGUj7KSYTIxTRcvaywmwzApEUCKAmhwVkSN0E80eI1fZa9/t73ABRkCR5?=
 =?iso-8859-1?Q?bCGnSkwW3stNYYoFTO9xX4vVFfR/3X4IxQCU1B0xaM7o8bgxpJHpqVyicq?=
 =?iso-8859-1?Q?jl2Ktq7p9XszJgU91fb49y3sddtGTBtdgGlwai875tNRPtwNzSroIDmHdM?=
 =?iso-8859-1?Q?9nBBmAYYYZs9oFM908r+m+Pv5girDTrmZlpHmKgWDy+VI+cDQMIsRhhruB?=
 =?iso-8859-1?Q?sGcol5gGXeR1sqNyEGdwGB2X8w0JOnVEv9wmgHOuWM+HBdQeAlUcf3Jz2s?=
 =?iso-8859-1?Q?bmmfeGsZvpWW12bZDr5yXOB7xXQuVBOJsyH/G5atvbd3Qrn5G7vHf1AZWo?=
 =?iso-8859-1?Q?8D8Nw/DArtr/X6cPIgZDo59O9ijUivm4G79CHcrQ8Q4Ei7pb8noGpnWeRw?=
 =?iso-8859-1?Q?T4WRVbBcLLJzO6vgQIKeAUhmYjuztqFiTsMGNxZ05+7Iag56CBkheQqaRM?=
 =?iso-8859-1?Q?ZdtoeWyxLn5TZ6ax5OvUmwFZNAD5IOL/vpV6WsvdXcsZavyUdOzi+h09ep?=
 =?iso-8859-1?Q?NdfWKS2UeM5XQLgnNouARnWClWV1dYqO5fRPbloUAdRevtMXY0Vd7vmTcX?=
 =?iso-8859-1?Q?YY74+K1eAkGdc7Gcq5QMgGEWrkZPAz3zuFGRwtasyqTTG2Hf2TrPQN3L1c?=
 =?iso-8859-1?Q?z+fAB04Da7FVM+vNPgKfQwrWn1eRlziBwwgQKqIXVFEIBSsOjRkvrAwAiX?=
 =?iso-8859-1?Q?X4Ns9DscR7IMFc9+JG6UA85/g1b45WNkrfHgv+/n2bQyFMBC0MOhCVaLVB?=
 =?iso-8859-1?Q?CU/jxSVPLxXE9qMuUEfQfv9OhDmEq1EKEdaB+KpNgPabZesiDn0FxOofDE?=
 =?iso-8859-1?Q?MdkKMfi98VkYCUMIce7f2812EvOltEtjtg97YBkFKYZ6P4KOwmMLNWCPZU?=
 =?iso-8859-1?Q?HMrIVhMGoLVUCDgJLJZHVvmcCzmv98mIxUQXVxLHUx49J45+4vIgKxE3+L?=
 =?iso-8859-1?Q?pHPjF3WGNv2WQwUimh1DL1kh9ZCqPrDEuF9ZJg+plCy9NrDVpfbTt6PDMH?=
 =?iso-8859-1?Q?dQbMBPgz9xm8Mt3IQ7nhmH7/o8cpjahIBSraaNV7jKcgrTZj6ecAb4Sd6Y?=
 =?iso-8859-1?Q?caMctpmavcQFoZ3q1K+/2vOe/nHlctvgbXg8r7L6uLJ5wqf22RuJmJakR0?=
 =?iso-8859-1?Q?MHjAV+aCTldLow0n5AfVH1g91xBRsYy4z1BC4qaRJx/LZJhzDZVUw375l9?=
 =?iso-8859-1?Q?lbU3hGLHqgOjrWRQIBjIwnEidroJhc4ucPg3Wm3eDUzV/FALS+wHm+5pcX?=
 =?iso-8859-1?Q?9ozDbML4Xuc8kZcE2oPFwtl9RvReSe02BTkIhjK4KytPl8t2SMMuKbllyj?=
 =?iso-8859-1?Q?QN4xpLUgWL+K8nlQQK6MbFjyn5R4GUibQJTf+C1b9kvrpkw2c4udUT0ApM?=
 =?iso-8859-1?Q?dOIdw9m9OD7x+m59lSJQ//epGNtR7/iANG8EF5NmguMUiSLWASG+CNTpoS?=
 =?iso-8859-1?Q?ssXTKctXlETtDGy+tL6RZYo8axCkZyVnaBS+2MWCKUTD8KiQ7UAbJlckN7?=
 =?iso-8859-1?Q?faqMus2JVl8KVJs5+Ja6rUzlcBpH3RempuBkIcRUTfz9m7NLXdzEqbUA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b877a7-8845-445f-2a25-08dd72f48802
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:14:33.7606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+Hd9DPwg8PgGIahfbosw6JaingDb93aB/Z9ndzqkTxywWWiKs1guCzbMrLPnM5g89i7iBzSjv9/mo0sCVly2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
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

On Fri, Mar 28, 2025 at 06:10:32PM +0000, Matthew Auld wrote:
> Pull the pages stuff from the svm range into its own substructure, with
> the idea of having the main pages related routines, like get_pages(),
> unmap_pages() and free_pages() all operating on some lower level
> structures, which can then be re-used for stuff like userptr.
> 
> v2:
>   - Move seq into pages struct (Matt B)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 66 ++++++++++++++++++++----------------
>  drivers/gpu/drm/xe/xe_pt.c   |  2 +-
>  drivers/gpu/drm/xe/xe_svm.c  |  8 ++---
>  drivers/gpu/drm/xe/xe_svm.h  |  6 ++--
>  include/drm/drm_gpusvm.h     | 53 +++++++++++++++++------------
>  5 files changed, 76 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index e0c8d450752a..c3d70403fbcc 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -811,8 +811,8 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
>  	range->itree.start = ALIGN_DOWN(fault_addr, chunk_size);
>  	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
>  	INIT_LIST_HEAD(&range->entry);
> -	range->notifier_seq = LONG_MAX;
> -	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
> +	range->pages.notifier_seq = LONG_MAX;
> +	range->pages.flags.migrate_devmem = migrate_devmem ? 1 : 0;
>  
>  	return range;
>  }
> @@ -1140,15 +1140,16 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  					   struct drm_gpusvm_range *range,
>  					   unsigned long npages)
>  {
> -	unsigned long i, j;
> -	struct drm_pagemap *dpagemap = range->dpagemap;
> +	struct drm_gpusvm_pages *svm_pages = &range->pages;
> +	struct drm_pagemap *dpagemap = svm_pages->dpagemap;
>  	struct device *dev = gpusvm->drm->dev;
> +	unsigned long i, j;
>  
>  	lockdep_assert_held(&gpusvm->notifier_lock);
>  
> -	if (range->flags.has_dma_mapping) {
> +	if (svm_pages->flags.has_dma_mapping) {
>  		for (i = 0, j = 0; i < npages; j++) {
> -			struct drm_pagemap_device_addr *addr = &range->dma_addr[j];
> +			struct drm_pagemap_device_addr *addr = &svm_pages->dma_addr[j];
>  
>  			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
>  				dma_unmap_page(dev,
> @@ -1160,9 +1161,9 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  							    dev, *addr);
>  			i += 1 << addr->order;
>  		}
> -		range->flags.has_devmem_pages = false;
> -		range->flags.has_dma_mapping = false;
> -		range->dpagemap = NULL;
> +		svm_pages->flags.has_devmem_pages = false;
> +		svm_pages->flags.has_dma_mapping = false;
> +		svm_pages->dpagemap = NULL;
>  	}
>  }
>  
> @@ -1176,11 +1177,13 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
>  					struct drm_gpusvm_range *range)
>  {
> +	struct drm_gpusvm_pages *svm_pages = &range->pages;
> +
>  	lockdep_assert_held(&gpusvm->notifier_lock);
>  
> -	if (range->dma_addr) {
> -		kvfree(range->dma_addr);
> -		range->dma_addr = NULL;
> +	if (svm_pages->dma_addr) {
> +		kvfree(svm_pages->dma_addr);
> +		svm_pages->dma_addr = NULL;
>  	}
>  }
>  
> @@ -1291,9 +1294,11 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
>  bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
>  				  struct drm_gpusvm_range *range)
>  {
> +	struct drm_gpusvm_pages *svm_pages = &range->pages;
> +
>  	lockdep_assert_held(&gpusvm->notifier_lock);
>  
> -	return range->flags.has_devmem_pages || range->flags.has_dma_mapping;
> +	return svm_pages->flags.has_devmem_pages || svm_pages->flags.has_dma_mapping;
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
>  
> @@ -1311,9 +1316,10 @@ static bool
>  drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
>  				      struct drm_gpusvm_range *range)
>  {
> +	struct drm_gpusvm_pages *svm_pages = &range->pages;
>  	bool pages_valid;
>  
> -	if (!range->dma_addr)
> +	if (!svm_pages->dma_addr)
>  		return false;
>  
>  	drm_gpusvm_notifier_lock(gpusvm);
> @@ -1340,6 +1346,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  			       struct drm_gpusvm_range *range,
>  			       const struct drm_gpusvm_ctx *ctx)
>  {
> +	struct drm_gpusvm_pages *svm_pages = &range->pages;
>  	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
>  	struct hmm_range hmm_range = {
>  		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
> @@ -1409,7 +1416,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  	 */
>  	drm_gpusvm_notifier_lock(gpusvm);
>  
> -	if (range->flags.unmapped) {
> +	if (svm_pages->flags.unmapped) {
>  		drm_gpusvm_notifier_unlock(gpusvm);
>  		err = -EFAULT;
>  		goto err_free;
> @@ -1421,13 +1428,12 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  		goto retry;
>  	}
>  
> -	if (!range->dma_addr) {
> +	if (!svm_pages->dma_addr) {
>  		/* Unlock and restart mapping to allocate memory. */
>  		drm_gpusvm_notifier_unlock(gpusvm);
> -		range->dma_addr = kvmalloc_array(npages,
> -						 sizeof(*range->dma_addr),
> -						 GFP_KERNEL);
> -		if (!range->dma_addr) {
> +		svm_pages->dma_addr =
> +			kvmalloc_array(npages, sizeof(*svm_pages->dma_addr), GFP_KERNEL);
> +		if (!svm_pages->dma_addr) {
>  			err = -ENOMEM;
>  			goto err_free;
>  		}
> @@ -1465,13 +1471,13 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  					goto err_unmap;
>  				}
>  			}
> -			range->dma_addr[j] =
> +			svm_pages->dma_addr[j] =
>  				dpagemap->ops->device_map(dpagemap,
>  							  gpusvm->drm->dev,
>  							  page, order,
>  							  dma_dir);
>  			if (dma_mapping_error(gpusvm->drm->dev,
> -					      range->dma_addr[j].addr)) {
> +					      svm_pages->dma_addr[j].addr)) {
>  				err = -EFAULT;
>  				goto err_unmap;
>  			}
> @@ -1494,7 +1500,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  				goto err_unmap;
>  			}
>  
> -			range->dma_addr[j] = drm_pagemap_device_addr_encode
> +			svm_pages->dma_addr[j] = drm_pagemap_device_addr_encode
>  				(addr, DRM_INTERCONNECT_SYSTEM, order,
>  				 dma_dir);
>  		}
> @@ -1502,16 +1508,16 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  		num_dma_mapped = i;
>  	}
>  
> -	range->flags.has_dma_mapping = true;
> +	svm_pages->flags.has_dma_mapping = true;
>  	if (zdd) {
> -		range->flags.has_devmem_pages = true;
> -		range->dpagemap = dpagemap;
> +		svm_pages->flags.has_devmem_pages = true;
> +		svm_pages->dpagemap = dpagemap;
>  	}
>  
>  	drm_gpusvm_notifier_unlock(gpusvm);
>  	kvfree(pfns);
>  set_seqno:
> -	range->notifier_seq = hmm_range.notifier_seq;
> +	svm_pages->notifier_seq = hmm_range.notifier_seq;
>  
>  	return 0;
>  
> @@ -1718,7 +1724,7 @@ int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
>  
>  	mmap_assert_locked(gpusvm->mm);
>  
> -	if (!range->flags.migrate_devmem)
> +	if (!range->pages.flags.migrate_devmem)
>  		return -EINVAL;
>  
>  	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> @@ -2247,10 +2253,10 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
>  {
>  	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
>  
> -	range->flags.unmapped = true;
> +	range->pages.flags.unmapped = true;
>  	if (drm_gpusvm_range_start(range) < mmu_range->start ||
>  	    drm_gpusvm_range_end(range) > mmu_range->end)
> -		range->flags.partial_unmap = true;
> +		range->pages.flags.partial_unmap = true;
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 82ae159feed1..9ac9291baeac 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -701,7 +701,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  			return -EAGAIN;
>  		}
>  		if (xe_svm_range_has_dma_mapping(range)) {
> -			xe_res_first_dma(range->base.dma_addr, 0,
> +			xe_res_first_dma(range->base.pages.dma_addr, 0,
>  					 range->base.itree.last + 1 - range->base.itree.start,
>  					 &curs);
>  			xe_svm_range_debug(range, "BIND PREPARE - MIXED");
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index c7424c824a14..be077766fd73 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -17,7 +17,7 @@
>  static bool xe_svm_range_in_vram(struct xe_svm_range *range)
>  {
>  	/* Not reliable without notifier lock */
> -	return range->base.flags.has_devmem_pages;
> +	return range->base.pages.flags.has_devmem_pages;
>  }
>  
>  static bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
> @@ -59,7 +59,7 @@ static unsigned long xe_svm_range_size(struct xe_svm_range *range)
>  	       (r__)->base.gpusvm,					\
>  	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
>  	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
> -	       (r__)->base.notifier_seq,				\
> +	       (r__)->base.pages.notifier_seq,				\
>  	       xe_svm_range_start((r__)), xe_svm_range_end((r__)),	\
>  	       xe_svm_range_size((r__)))
>  
> @@ -135,7 +135,7 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>  	range_debug(range, "NOTIFIER");
>  
>  	/* Skip if already unmapped or if no binding exist */
> -	if (range->base.flags.unmapped || !range->tile_present)
> +	if (range->base.pages.flags.unmapped || !range->tile_present)
>  		return 0;
>  
>  	range_debug(range, "NOTIFIER - EXECUTE");
> @@ -783,7 +783,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	range_debug(range, "PAGE FAULT");
>  
>  	/* XXX: Add migration policy, for now migrate range once */
> -	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
> +	if (!range->skip_migrate && range->base.pages.flags.migrate_devmem &&
>  	    xe_svm_range_size(range) >= SZ_64K) {
>  		range->skip_migrate = true;
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 3d441eb1f7ea..8bc83de87250 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -84,7 +84,7 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>  static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
>  {
>  	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
> -	return range->base.flags.has_dma_mapping;
> +	return range->base.pages.flags.has_dma_mapping;
>  }
>  
>  #define xe_svm_assert_in_notifier(vm__) \
> @@ -112,7 +112,9 @@ struct xe_vram_region;
>  struct xe_svm_range {
>  	struct {
>  		struct interval_tree_node itree;
> -		const struct drm_pagemap_device_addr *dma_addr;
> +		struct {
> +			struct drm_pagemap_device_addr *dma_addr;
> +		} pages;
>  	} base;
>  	u32 tile_present;
>  	u32 tile_invalidated;
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index df120b4d1f83..1b7ed4f4a8e2 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -185,6 +185,35 @@ struct drm_gpusvm_notifier {
>  	} flags;
>  };
>  
> +/**
> + * struct drm_gpusvm_pages - Structure representing a GPU SVM mapped pages
> + *
> + * @dma_addr: Device address array
> + * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
> + *            Note this is assuming only one drm_pagemap per range is allowed.
> + * @notifier_seq: Notifier sequence number of the range's pages
> + * @flags: Flags for range
> + * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
> + * @flags.unmapped: Flag indicating if the range has been unmapped
> + * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
> + * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
> + * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
> + */
> +struct drm_gpusvm_pages {
> +	struct drm_pagemap_device_addr *dma_addr;
> +	struct drm_pagemap *dpagemap;
> +	unsigned long notifier_seq;
> +	struct {
> +		/* All flags below must be set upon creation */
> +		u16 migrate_devmem : 1;
> +		/* All flags below must be set / cleared under notifier lock */
> +		u16 unmapped : 1;
> +		u16 partial_unmap : 1;
> +		u16 has_devmem_pages : 1;
> +		u16 has_dma_mapping : 1;
> +	} flags;
> +};
> +
>  /**
>   * struct drm_gpusvm_range - Structure representing a GPU SVM range
>   *
> @@ -193,16 +222,7 @@ struct drm_gpusvm_notifier {
>   * @refcount: Reference count for the range
>   * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
>   * @entry: List entry to fast interval tree traversal
> - * @notifier_seq: Notifier sequence number of the range's pages
> - * @dma_addr: Device address array
> - * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
> - *            Note this is assuming only one drm_pagemap per range is allowed.
> - * @flags: Flags for range
> - * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
> - * @flags.unmapped: Flag indicating if the range has been unmapped
> - * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
> - * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
> - * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
> + * @pages: The pages for this range.
>   *
>   * This structure represents a GPU SVM range used for tracking memory ranges
>   * mapped in a DRM device.
> @@ -213,18 +233,7 @@ struct drm_gpusvm_range {
>  	struct kref refcount;
>  	struct interval_tree_node itree;
>  	struct list_head entry;
> -	unsigned long notifier_seq;
> -	struct drm_pagemap_device_addr *dma_addr;
> -	struct drm_pagemap *dpagemap;
> -	struct {
> -		/* All flags below must be set upon creation */
> -		u16 migrate_devmem : 1;
> -		/* All flags below must be set / cleared under notifier lock */
> -		u16 unmapped : 1;
> -		u16 partial_unmap : 1;
> -		u16 has_devmem_pages : 1;
> -		u16 has_dma_mapping : 1;
> -	} flags;
> +	struct drm_gpusvm_pages pages;
>  };
>  
>  /**
> -- 
> 2.48.1
> 
