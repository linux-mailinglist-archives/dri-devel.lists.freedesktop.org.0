Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF609652B2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 00:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C633E10E7A0;
	Thu, 29 Aug 2024 22:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHB4a0uA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C575B10E7A0;
 Thu, 29 Aug 2024 22:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724969666; x=1756505666;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FMLzZoUuTfh2Pm1U2MBpxpfl/8Iz5iamigkYg/tq2Ek=;
 b=bHB4a0uAKOg7Zza1WbjzAcDU7ji5GmTrOw8nr0cgcAi9RlhU2CNzIoaI
 GETxQTxiOqgLiGE2eHc1PtsKBPZfkSi8JL3hNFhqro5gqcLcb5jI3ZZsg
 KnuXsbaQdBxcHOahO8dhOpTBKS/laphXggxIdLyJFJCnvNoFBVUqVynJP
 Uo8kMZWoEENLR+IGpNlXySEYDJ70qCoiijCwl29O2io0bkndZIVlJBMYq
 rWD8peARbuznjVFW8Ps6KXhRfbBbv66DHwaU7vbA5vA4q1b6iaegyEUlT
 4fhLfBOFEUHvdm4BgcSuDG+8VNtAsM5gHqvrhAIdUZScu9shm/GSFeLtK g==;
X-CSE-ConnectionGUID: BEtGQ9t3S7KGsdf9PyHuJA==
X-CSE-MsgGUID: 20xE7J3gRWeS6Ve8fp8lXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23783246"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23783246"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 15:14:25 -0700
X-CSE-ConnectionGUID: dTiWKTfvTfSZP2HSnvJkfg==
X-CSE-MsgGUID: LmLg5LuXQkGn8SQh8j9JiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="64451882"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 15:14:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 15:14:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 15:14:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 15:14:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 15:14:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1UrYlIWgUtANn4j/6xnCDIv69rn20c+vBT5sxqrBR8UjatmrPvHPkA/EgwaVOCv3+cfzfhPVw982XhSvkRBsv+3sM3DB5lL3S8qF+GK+Nowg+jQ94qfhV7GTqC70P6BziL45ow87fxezOnfykAi9S5CyR6fYhUWsX49UTbnDzfm/trIFIOhmdz2ojrm4FMkAI8GUpbRkfjm+uP8tOyTYEgywe91X1K9nh5ERABZ7aCArwQeCzGEfDRSTNJiravPn3JlLOAhxpXtYnGV65Gy365nG9AqZw6ZM+R+XSgGOGqpWv2Py7C9mH2DMd+q8R8hDnFGqncLXi2d2g7jYmh0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+27z7Rp0u4cVZmb+jNFobpaBuSfTpLKVckSBsBQIhU=;
 b=COBkt3vrwlL/n5rjwdKcHr5zuPaY8aeEOP6M0aqtqbph2HOxR9k5Nf6aAsSh85jKyCktR2SaXTAk8bjQqL5fBoWih3odMKyx1yRchHuPkZm/dajhEEo/d83Tr5UNd2Vn2Uh2lR1ZRr9jIZ93W8pDymLbFef2bSyPH06b+P4NQcDvpEY0K4wVrZJWYrFOoFFG7BawJ1ErY9cvK1JMByEurSXrg4EJl0SkQEH/M3cWoF7GRPXrUeSYQf6ZTWcMZJXomOxUXFqMSePUW8kkSEwxIm6E2yec0PfHiZr8IRSHqj9s2/Mr6cvgD32Bi0h9B4LSFHhxFXyIlKs483FwGN8ZxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4535.namprd11.prod.outlook.com (2603:10b6:208:24e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 22:14:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Thu, 29 Aug 2024
 22:14:21 +0000
Date: Thu, 29 Aug 2024 22:12:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <matthew.auld@intel.com>, <daniel@ffwll.ch>, "Paneer
 Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Message-ID: <ZtDyZceN6asCzSHT@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
 <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
 <ZtBVXjNf1xAQOHHR@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtBVXjNf1xAQOHHR@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4535:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9587f1-4adb-4255-b177-08dcc877eee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8Yv5n7A/Hg8mm1hluBpMRhLP4mfwHlYUZW4QZ+iMcrJEEpBzTEMiHhmGf2?=
 =?iso-8859-1?Q?TQOCXwWgEoVO7nl7Mw8kGZ3OpwJ3ugreI3dVAQu1W6tCBHNCWeOOksH/ui?=
 =?iso-8859-1?Q?XflgGfSCBb4zMisOm4nkv+877Qv9nM+9mWWZew6CKPX6cpbhbsVUcClCuv?=
 =?iso-8859-1?Q?OVFWxs/moz42bKDFNDsOzHe30KKsn0EW4IQScs3dkA9KmQ/cE7dU43C8JM?=
 =?iso-8859-1?Q?aEakc9lpEtALWCyaLmpJJ6bmwZ/r1eyR+K8pB27Ec8R76uipg7UXOKZawj?=
 =?iso-8859-1?Q?4nIng/tp7+bb3QrSB0Jg/a2M8FLHJW3mDoD2iFPjgnsSi/e/zul6GHZeic?=
 =?iso-8859-1?Q?F0fubBCz1IJeB7WDrj/t5MQDFqaT2a97uFj0JrBHzHHc2IKunnvoQVdxh4?=
 =?iso-8859-1?Q?/0vjvjGcUdMyzmJ06XI5h8Vt8KRt4745RWxNwufQ2WaS6WrpjjhCw17YTS?=
 =?iso-8859-1?Q?/c6vOxlPUwHfv22I0AfmOnIlCC68o0b0b45amAaritwg0Hl/UgC3Kzp2Tc?=
 =?iso-8859-1?Q?Nb7474doAy4WaXA9UeySmM/RHVBNB1Yb8uuarMWpXU7iAoFn4eeBM9GA91?=
 =?iso-8859-1?Q?8agBj4B8SNFzfmZFfxA7TjKiDp1aBjYFuKsJMfHG6veF3n9BCcVX/fnkdU?=
 =?iso-8859-1?Q?5cDOR5W5XVOjWVvmEBaQ8xS4zYAjzxBkAimRd1nBe//DOKFG9NuMmVpeKC?=
 =?iso-8859-1?Q?4pEfn1LJ37NZ81BI3Jb0nlQuh04+FrsBzEZ77a3EUo7OpbeDrehEpowIre?=
 =?iso-8859-1?Q?PaApxB6OLukFrBcLz6FpSU67KCR2HuM7YLp2uROtKPftbSfcOZz/d2Z8dX?=
 =?iso-8859-1?Q?/7eHz6XGWN42GJTiBkgW6eCvL8+8uoOh2PTLc259XwB9TWN8FHu8hkSviI?=
 =?iso-8859-1?Q?+CeMIWIFU7/AD1yyCk20e0kaYs+tYbs5xuZlt3+0Ubbwn/7SiNLaB91FCr?=
 =?iso-8859-1?Q?skAjXXTCjgJt8cTtSx+qxHfT/yEUZtvDlTe4Ppacl4uL/FgDFgDLzfcH2c?=
 =?iso-8859-1?Q?nnfiABqNU20hKDCMDV9ayhOOjYwD/LKEVrmmpremJtJ2MLT1yRheJSb3Fw?=
 =?iso-8859-1?Q?VaVfbT9fxdcqlz2cE/M74w0QjZlC+6c6G/UUaB8q/Nh5bNcdErh6gJ5v1d?=
 =?iso-8859-1?Q?bE5tllOTrh12aMiJNRji8zfXQlta3xX0eUV3y6LQbPxZ8bxfs8c+8+RFHg?=
 =?iso-8859-1?Q?jDQF/Qn80Jjy+ZzUt1LULJoe6f4j1ABUueTt3gYVlNY91qlcAZP24GgqkX?=
 =?iso-8859-1?Q?zT6qVKyWU7pFQHpPIyEn1+g0bm1eseDnanZfnTcRLQ2vPXt0iUeM9bGZV3?=
 =?iso-8859-1?Q?H2hY137l6/IZYJXZ1edFUf/BvA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ylpkTKDmEGFsw4iTAopOxk6nQViRLgf5PZSJZ19lW9pt9hpdeciAbBxorj?=
 =?iso-8859-1?Q?sxHH5H5jvTTZGmsP1PilK2gOgZsSmUERqdV+LeyoGhAKMECWy1YqaH4BSs?=
 =?iso-8859-1?Q?rlrU42RJVbp3CZXpS0/5pXsiuMdoX3xCGNP2+gUiBirOPnYBbEkdYIMVLg?=
 =?iso-8859-1?Q?m8xHiRCpJhTJYWt1elBbs4pBd6qYoZFsMqOJHRHyMBKTtcywITG3pLH+yp?=
 =?iso-8859-1?Q?9zl+eZ3TyslmrdmNgph6vCaNRnaaPCO2z6VKT7ZFUp5iEkGqKNxImjEv01?=
 =?iso-8859-1?Q?QU6zuWOiM0QpLGwFyT+4ZRXa8a/+1kSffxwzXLclpHqNHbrJ/JUAO50bD8?=
 =?iso-8859-1?Q?A8k4ieoMvIoWWfE2XZ1AfHU5fGBAK8FHqTTc2tn1lNVXcOtELzyCUjqueF?=
 =?iso-8859-1?Q?IFJ/vDRF1ijN4L66MP68tHa7bQUEzvggaHJjVryll7WRC5hsa6U69OcMyI?=
 =?iso-8859-1?Q?xuK7Hzo0WHqhuvjJgy5gufqJ4ZtPmg1vzJLx8hBpEqVL7dNiaSm2cU+bpe?=
 =?iso-8859-1?Q?mnUwLpiAEGf8b2T+Hh4rZam3JxJ3KkXKiTNtfGvu8boSdfDEtRzi7sgJUC?=
 =?iso-8859-1?Q?5J0wM259UEeD08f+xnzHK48njIAdJW6UuswldUxVDNXWm2S8InpQaQEJMb?=
 =?iso-8859-1?Q?jQcITCQYbbB1XDZG/calgIoNeFk5gECwzN7tpHml5m/jtgP+LOSskGINmf?=
 =?iso-8859-1?Q?OexyFON01bZCM5CXUePWnk3CsK/eEgok8/kwqViSNAiC+JzsDRlD6ZH0UL?=
 =?iso-8859-1?Q?sT7PEmB9yiei5eGKC1+hlcmfCc6T39gPEXJgiPQkEMC4gMEB4wDz2Gh/8o?=
 =?iso-8859-1?Q?Ja8MUbZBipcKc90JhUnghlhw8fyLL1cQ2zy8Re+jUZ+wnMMvEO1a4hOvUd?=
 =?iso-8859-1?Q?mWQLPUoWNnYZGZtSVLk/Tun6dDm+HYHTzp5Zu8xXCkAivd6LohLFMxIRGz?=
 =?iso-8859-1?Q?chlZQxQcbcgP4Hxr9VQ4V1lx6FLuMNTgLQPF5cGhEtEyjoi77hGvp98RhL?=
 =?iso-8859-1?Q?G7oFgQTYqQq4ATuGFWrcGvSp+aBZA8tER1w/aOcprA+ILRB2/Tn/tA8IUw?=
 =?iso-8859-1?Q?clgX8p/5MBhiHmAV1ut12ydvEPxki88l9X3XHfdCBq2Cy5TXtV24C2Gk7k?=
 =?iso-8859-1?Q?cVefn7fq9E+K6CIqDCjO0jHw2Fv8vTTdgkARV2O/2H+fjnpJZRSCVS4qFj?=
 =?iso-8859-1?Q?sNsg79MuwhfjN0p+KJs0MNJPF4G0vJyLOuHJL4YgHV/LKIGpRXYwY4glBJ?=
 =?iso-8859-1?Q?ciiV5tnt1vTeyoRPIywoTa3VA1YvkIhIbDiTp0tF8Mef4edunEtv5exqv4?=
 =?iso-8859-1?Q?+rjlKC+xWHysQTy7jf+ZTjCPIKZ2UXtfwIhQvHo4GJOzxSMHbuLNVCtMWE?=
 =?iso-8859-1?Q?6Tlg7A+onpx3FmVEElk4I7Ix7GVbGvAzKfWb2PSPfrsYMrNfwj50sQyNR5?=
 =?iso-8859-1?Q?Iw+myn9J3PNCkkMprkLmuVnN8YooS2L2MpboOUg5BsOC3I3ihPB5e78dgA?=
 =?iso-8859-1?Q?8FwiLbUCl3zA5yirFf9fpWAx4B62eLi4/KD0fIyfcX1I6YWnYJP/P4h89P?=
 =?iso-8859-1?Q?NDoKTjAkDUHLkDxhE46/q3WpwMdjE2akJqRCzklOHTg+ahdXvtixdE9dSp?=
 =?iso-8859-1?Q?P9X4uvew/vALIyPfzDWygFM/hAJ/4+pIgSDBL1gr9fLaZsI6Gw7eZXew?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9587f1-4adb-4255-b177-08dcc877eee7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 22:14:21.5522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HtmF6oHrHVeCdlHSszeir1DPWZuCo1H4AhuAHhDkB2jOUaQnFZdXGelh+Lim65UdIUUGhZFnpIfcCnU7HwauA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4535
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

On Thu, Aug 29, 2024 at 01:02:54PM +0200, Daniel Vetter wrote:
> On Thu, Aug 29, 2024 at 11:53:58AM +0200, Thomas Hellström wrote:
> > But as Sima pointed out in private communication, exhaustive eviction
> > is not really needed for faulting to make (crawling) progress.
> > Watermarks and VRAM trylock shrinking should suffice, since we're
> > strictly only required to service a single gpu page granule at a time.
> > 
> > However, ordinary bo-based jobs would still like to be able to
> > completely evict SVM vram. Whether that is important enough to strive
> > for is ofc up for discussion.
> 
> My take is that you don't win anything for exhaustive eviction by having
> the dma_resv somewhere in there for svm allocations. Roughly for split lru
> world, where svm ignores bo/dma_resv:
> 
> When evicting vram from the ttm side we'll fairly switch between selecting
> bo and throwing out svm pages. With drm_exec/ww_acquire_ctx selecting bo
> will eventually succeed in vacuuming up everything (with a few retries
> perhaps, if we're not yet at the head of the ww ticket queue).
> 
> svm pages we need to try to evict anyway - there's no guarantee, becaue
> the core mm might be holding temporary page references (which block

Yea, but think you can could kill the app then - not suggesting we
should but could. To me this is akin to a CPU fault and not being able
to migrate the device pages - the migration layer doc says when this
happens kick this to user space and segfault the app.

My last patch in the series adds some asserts to see if this ever
happens, thus far never. If it occurs we could gracefully handle it by
aborting the migration I guess... I think the user really needs to
something a bit crazy to trigger this condition - I don't think the core
randomly grabs refs to device pages but could be wrong.

> migration) or have the page locked (which also block the migration). But
> as long as those two steps succeed, we'll win and get the pages. There
> might be some thrashing against concurrent svm faults stealing them again,
> but they have a disadvantage since they can't steal dma_resv_locked bo.
> And if it's still too much we can stall them in the page allocator.
> 
> So it's not entirely reliable, but should be close enough.
> 
> Now for bo based svm the picture isn't any different, because holding
> dma_resv is not actually enough to migrate svm mappings. We still need to
> hope there's no temporary page references around, and we still need to
> succeed at locking the page. And the migration code only does trylocks,
> because that's it's deadlock prevent algorithm if different migrations
> needing the same set of pages, but acquiring them in a different order. So
> we win nothing.

Ok, maybe my statement above is false...

Wouldn't be the only time this falls is if another migration is in
flight (e.g. CPU fault) and they race? Then the eviction will naturally
happen via refcount being dropped from the other migration. I guess I
likely need to update my eviction code to not free the TTM resource if
all pages are not migrated.

> 
> Worse, if dma_resv does actually hold up svm migration and reclaim, then
> we potentially deadlock because that lock is for a bigger range than
> individual pages (or folios). And the core mm assumes that it can get out
> of a deadlock bind by (at least stochastically) eventually succeeding in
> acquiring/locking down a single page.
> 
> This means we cannot use dma_resv tricks to give the ttm world an
> advantage in exhaustive eviction against concurrent svm faults. Or at
> least not more than we can do without by just stalling svm faults that
> need to allocate gpu memory (but that must happen without holding locks or
> we're busted).
> 

I'm a little lost here on the deadlock case. Do you mean when we try to
evict SVM BO we trigger reclaim by allocating system pages and can
deadlock? Doesn't TTM already have this dependency when evicting non-SVM
BOs?

> So the only benefit I'm seeing is the unified lru, which I'm not sure is
> worth it. There's also a bit a lru design tension here, because for the bo

Well also not rewriting the world...

Matt

> world we want objects that are locked to stay on the lru, so that the
> competing processes can figure out who has the winning ww ticket. The core
> mm design otoh does isolate pages and remove them from the lru when
> they're acquired, so that they don't gunk up other processes from trying
> to make forward progress and are better hidden. Which reduces temporary
> page references (from lru walk) preventing migration and stuff like that.
> 
> Cheers, Sima
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
