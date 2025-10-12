Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F0CBD0A6F
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05BF10E197;
	Sun, 12 Oct 2025 19:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RiPI7Qnu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AA910E197;
 Sun, 12 Oct 2025 19:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760296128; x=1791832128;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S3fG/vef0UcdMbuJgMeE+XiojrxEIBNw7+Cd7S3xSkg=;
 b=RiPI7QnuOYv4EsFwF6sJYGnx1xcLOmxtTaXEAtHu9RLgorDf1VawMrIq
 ppTopFGuXdyKsfUTanc/6KTXEoozMvEx8AKE/Xcd52VIykUgL9SWf6O54
 aUueMC2zOXXbZajKMuX8NfsYEOc0GEd+Vh1vFPXZLPkl3f3WKy5txySD9
 ywTomBQiZiYgK1Hdd9zbKVbFrwUSKX8/vlhNsSCZf6zgoJarZkGOb0Bk8
 Oa4m9HQnmpS/bB/A0SlA+rqADuCZ4ZkSZSiJJgbSG56vn+a2y/wV6Eoe0
 raM7UwiFaZIIKuquWcXc1nqXKqKMnlw9XTIJA4LidQcqcpiXPVRXQuRsE g==;
X-CSE-ConnectionGUID: YT2msOjKQ3eZ1TyQi6mQ6A==
X-CSE-MsgGUID: CnoC9ofrQA6K/yYgLvSJcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62480769"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62480769"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 12:08:47 -0700
X-CSE-ConnectionGUID: dbohqvjIR56oCjrvb0UeIg==
X-CSE-MsgGUID: tcYHTEYZRImq3jfIKpSuSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181435545"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 12:08:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 12:08:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 12:08:45 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 12:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEryC4jqiOLWDmPHkR3RZM4OkuvWD8kbTQPq/8t3e3Bs/l4SqCk4KZriARFPJzcfnjLYHch2VDA1Hpcce8kcnB7fAYAKVdFaTyZPl5ag73FHXMDAbcZHTMsHQpFN3t3e461opOYC2s08EAC9DR+v+gwM44y0ZZfNCjXWxcfssKtDndt7zWHqz8AO5TYPBshJQ2y5h79e3YUOpt6Epk4iIrirIMc8zr6C0I8hNKy4oavyEBTNrvYyLBvLWW1TdlHm/k/naKcNZ+14yAin7Voxo8BJOU1oV0bcNEwgOjp/0PNeIimUM3RCYdxjWX6ePfLefI4LIqSVZ4Z22ppK2F0S5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=St/Z8dYtqf/WnAOcAy/chUtTo4iJoxOwiGdXtW42KtQ=;
 b=YWI+WvZ/Cg9m4M4YqJgvb99qXElj6s0iZ77bZXwbVZ4kJc7kBfZ/+AaaHyNh7xMow2P3R+rxmPoIHCATXw4d5FnYylpzm00hHKJABJlQXT31i8MZZfT011m800YEC3TuQ5HL6b0YzNm2JHsm3rs53IZa+KZhp0v1YEEQki0y/orJTJZzs8hpc420m/0QfM9Eg49heKuBNEhIr0SAq1Bnwqd0FsDnTtn+rHRr5Rkg39oO9A1TED426Be2ZTAgPHImPDszLiZO0cOXkpL6wiSuW4Hd+l6R/gciHtR8Xk3dCEnOtw3JC0yqkdeHzDQ+QI0Bb5jMSHoDrPLA/jUz5xPvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 19:08:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 19:08:38 +0000
Date: Sun, 12 Oct 2025 12:08:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 04/26] drm/xe/pf: Extract migration mutex out of its struct
Message-ID: <aOv8soJ5lN+uLhOA@lstrano-desk.jf.intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-5-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011193847.1836454-5-michal.winiarski@intel.com>
X-ClientProxiedBy: MW4P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a06d5a-90b4-46db-a1e1-08de09c2bfbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzlWQ0tXNTZsdlJyaFZVSVROT2FqcDRJMm1QNmVRNlBMbjl0RVhWcDdqU3Q4?=
 =?utf-8?B?enNSc0ZGaDRvT3hXSmRwVEwzbHRCZWp6T0VvYXIzdnFGYWFGUGRueHJ0cGVK?=
 =?utf-8?B?aC9aU0xEaXBSeFExWTM2Z0R0ZG5pVnJpdVZhUU1FbXRJaTN0VllTaVRTZDMx?=
 =?utf-8?B?Zk5CYkk0SytYcHFWTDhVQ3dGbnJPdndVbS93MGJFMU5ZYjJKZm4xMzFETkJD?=
 =?utf-8?B?K0dRV2FGQ25RSzNFdStsMnUxN3BYQndEeUQ3S1ltYWs0dmtlcE90TG1MLy9o?=
 =?utf-8?B?UFVOb1hRd1oxbkRxank2TXJZdkluK2UzMlU0Qm1yUXJ3Yit0emJCWmIxYXRW?=
 =?utf-8?B?NkZWUlhQeWcwMzNyTW1DMmUrREtSYTlJaU93cGxjb3h1eDZpLzVmRlplT1dD?=
 =?utf-8?B?WUQxNllib0VmQTJEZEdFZVlTRHJqNHpoNDFnSlRqeEdUMGdlVXdwSUlLMGdY?=
 =?utf-8?B?ekwwL2k3THplRXdZS25NOHphYVA4c0l6U0g0Nk9uYXlhSUVYUmZla0dNdUpP?=
 =?utf-8?B?b2Z5YWtMdW9adWJQMTFxYVByOFlYK1RkTis4cHpxN2NsTW5oOFVTU1NUMW13?=
 =?utf-8?B?cnNSSUJWU2FGbGw0c3pZdzBLQlNUcXR0dVpaVnZUREFRcEsrMUtxOXpQb2RP?=
 =?utf-8?B?Y1ZmdzhaN202UE4zV0NBczZEOUd2WmJSajRiZnl6ZVJpbWdMckNHbEJPNFhL?=
 =?utf-8?B?V2pNcE5iNU9aZGVwcHdZWTZ5b0swTUFDV2xZeXpPTXFhajRkVFhtb01KT0Fa?=
 =?utf-8?B?cEI3N3FrZnQ1OHJ1VExBR2ZoUkNpRmYxaUlFQUowM3ZXTnA5U1NsVnVIWmxK?=
 =?utf-8?B?V2RVenVrcmwvaFF5UnM4cURHWHZEMENYcmE3ckQ5ZmluLzJNeFV4UDNsVERh?=
 =?utf-8?B?NzRFTitFUTVZWTAwQVhrVzFjeTJmUnQ4UW43ZGdGNDZlM2VFRGtkaVNzcHlH?=
 =?utf-8?B?VTdYSDQ0MkdzYlFRaVZseTRxZHdoQjZvNWhSRzBDSHFSSWI0S3VxZnFVcDVR?=
 =?utf-8?B?bWI0Qmc1aUs3dkxOaUZNL29zS1NaMnFKS1JUMnMvZ1BwaEhHWlU0YmJyblBS?=
 =?utf-8?B?c3VpYjM2MDNybUphemRzazNnTG5qbWIxNk8yMEZGWGhFUHJWcWxPNDhvck42?=
 =?utf-8?B?RGhxVlRHMUVNU0wrOWwwL0s1dW5hVEhsaXZ1Z0VLWWw3Vk12SlhlZ2t6ZjV3?=
 =?utf-8?B?dDk0b3ZpVGdwK1l2TkhOdGZZNk9UbkhmbnNHUkJ0MnJIcm4vOGxuODhPNzlB?=
 =?utf-8?B?Z1AzOTVXRmpzQXlZZ1hBbFBmb3pFdDJmZlp5eFkreDk0SWlKd2tQNE0vbS9Q?=
 =?utf-8?B?V0pzUFRRNTZwMm1rVmFSZDluSjZSWFcrZ1NZNjdwRHZDNHErc1EvN0t1dm1j?=
 =?utf-8?B?dWtTZWh4bzdDWGVUeENnZ25hKzVTTTlCUHdYN0s5a1BGcEFpMks2MzdQVC9l?=
 =?utf-8?B?SkZRQnppN3pnTVZEZkl0WTRyM3pIanpxM24xY3R0TG5vWU5iYW9kNTdHbW5S?=
 =?utf-8?B?c1hqakJMdGdpSGtTbE9kSDNKckhrengzT3JYNDNIQlljbENUWVFYMXpwNm90?=
 =?utf-8?B?S1Z1WU9tMWpnTFBIVytCSml2WlcvTjkxZC9HWGJhUFpLZmFYQWsxb0VVOXJx?=
 =?utf-8?B?U1IvLzc1RXV1YUc3d2YxU2sxTmpVSmRNT3N1RWQ5TzFEb2VYU2d2cysrYm1p?=
 =?utf-8?B?aDc0SkErTGZrdEJLcjEraWNWL2kyU0toUUphSy9EWUpiejg2VEJVaGZXQlBD?=
 =?utf-8?B?b3cyeWhlOUoybE1iRmhEcTNLTmZxVkxiVnhHSnF6OHpuRExNcXdUT2tYQkhI?=
 =?utf-8?B?OVhRelZvSDIyN1FmNmlRUXFpT0d2SC91eEp4b0NydXRFUm1lUmpmZkU3VS91?=
 =?utf-8?B?LzJDZnNyOEswRndCWmVCUkpuZlBGSFVMTWI1TWxaeGJwV3ozTkw1djVHMk4r?=
 =?utf-8?Q?mZ4TTSgxQhkFvMBqjoeIJL+/WSy+SVgI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SER0MXFMTmhHWUFOZUhNbjkwVGRjQ0FuWFRTdmswQ0lib0NQcklMd1U4c0Rs?=
 =?utf-8?B?a1BmR1ZSOVhXbmY4TUlyQlZPaFR0cDUxeFhRanEwd2hmMWVPRDVvUVhMZDNY?=
 =?utf-8?B?SWtTVDhiUnVwQlQyMmZkd2pZWlZjdGRkdENKSmx4c1IzWWZseE13Y3ltcVk0?=
 =?utf-8?B?RXZ5Q1drdFVjRDIyZzVxRC9NTnJUYVpkVEg3UjR1VkhXU0J2aENzMGhiS2s1?=
 =?utf-8?B?S3VVZlVwb1E5SnZYb1hoZDAyTkRNSTQ4NlNMRGoxM1NsWkhlRjBqdW0vQktZ?=
 =?utf-8?B?NSs2aE8wK0hhbmwxK2xOaEdQUVo1OXRvMSs0dytSbEpQMVBGeTVoYlFncGVt?=
 =?utf-8?B?eVUzbG9iWDlzeDJFbG84cWlNUHlIS1VIWTJqU1VSdkU4dEVCOVltT29xcFRH?=
 =?utf-8?B?d1d2L1p6U0RmWlZIUzZHUjA5UWhHb3JaTk5xSW5mRkNxRjhSRXYzQWdBU3Rh?=
 =?utf-8?B?R3prWEp2bXRrcThkMUNVckhJNW12ZVVqZHVHTjlCVGgyY3lZcUtmeGl5WDBE?=
 =?utf-8?B?c3JwbFdOV2NMYmoxeDd2WlJOeGcvWitMY1JxYVl5S2JTS1p3OCtrNG9oUXgx?=
 =?utf-8?B?Q0tMSXJObUJieHVpbmVHZHlYL2E1Z2JUUUk0MDV2eW5sRTZyUEhvUUIxbkE2?=
 =?utf-8?B?NHc2d1kzZEk5YTRMUVQwaFZtZkxPNnU2eXh2N0J1V0Y4SnQ4NTc5MkxYenBq?=
 =?utf-8?B?MGlMWkhDd0JRckJTUjY0UHI2ditGWFN3eWR2MkFWY2NPU2puK0hxMjNyUElB?=
 =?utf-8?B?Z3lsWm10WU5VZ2tQbzhPbCs0eE13UWFVMEV2S0pPdFZMZUxuYytyRWd2NlF3?=
 =?utf-8?B?RFRkWnJFTjRKSW1WSVFzSVVrT0VrUUUyV1REMXhaUndUR0JuemplazFIT2d0?=
 =?utf-8?B?Y1hhQjVpdHFwMFBrRllGREVNRGplaC9INDBxRkMrZlBNTDZ1OWhlbkFCbUZH?=
 =?utf-8?B?Z2FPSXpMMDMyeVdlb3ZVQlpqNjBibnoxbWFYc3hBKy9vZ2t0NXM1WkU1N1Np?=
 =?utf-8?B?RXlPZ2dxSmZDM3hIZ3lrbjd1Q3MvelhlRkJ4RUdFT3RaUWFZcDJtUllnZ3BX?=
 =?utf-8?B?ZWNLT21NT0ZXSlRwb0F5azc2K0RjT3BoOVV6S1h6blFCMjN0dzFVQWN1THJJ?=
 =?utf-8?B?ZEZneFRLaDhOa1VlWFhlSWlNaDIva0NudkxZMGNBN1JId1J0M0x1RW5FM1dy?=
 =?utf-8?B?T3lrMnM1NnZDMDZpNUFUTDFFQzlFbFowZmM5SVZMSUozM1BDclFmTktBbG1H?=
 =?utf-8?B?NE0rMFJXaHNOUlBvODN0M1RFK1M0ZW5iRTkrOTAza0tUOHZyQm8xSkRTTXFE?=
 =?utf-8?B?UXA4NTN1TjhUd3hEdlBPVHIyb0x0Tnh3WWwzMnFsRHZGeTBjS1ozeGtQamxy?=
 =?utf-8?B?UHVkdFc0OW5uV2VFZlRSeDA0T0tBemV4UmZ2bys4dmFvZ0pIZmJ2OWY1eXVa?=
 =?utf-8?B?bzVYWmpyWUVZNG41dFdZSDg2T0luNnlQSlhOUFB5WVNqdnNwYmdrdWlyRGM3?=
 =?utf-8?B?Sk90YkNZeXNCRGhEVlU0QnRzK1VkOGdtQlowUFlJQm1TTGlrSk1YOGZyRDBz?=
 =?utf-8?B?T1BVd3ZnZTNha3l5N3ZwcUlaREkzSlZFL3pmL2wzQ2plR2FuaDVBeHlvaElE?=
 =?utf-8?B?bjdqK096MHdqMWNvL1duR0FmUmRoRXBxMDlDd1BkV0lBM2VWblNVRzI5Y3NM?=
 =?utf-8?B?My9UMDhJU2czd2tZdFVZQVhvR21Md0QxWjhzZ29CT05uamNGWjdoa3BnSDgr?=
 =?utf-8?B?MDYrZWdKZXh3UXQ3d0NLcldlQzAxak9Qb2tqRUdpSjFRSkh3Z21pU25uN0hE?=
 =?utf-8?B?WjZVWExoVFpmbDFVNXhCeWlHMkZXbGNGWHZCMk9TR2xwNzBvOEpJejdQNkt0?=
 =?utf-8?B?UUhBY3RDQzViam9qTDcvaWxEOHNLQkVUZUJhUUswQkFGT3lQRU9adWhhUnUz?=
 =?utf-8?B?R1RicnpXM2JBMHUwT1E2RHl6VzVsQXZFZTFLWU8wd1BXc0lRck9uZjBvM25J?=
 =?utf-8?B?QnVNNFhVcVNYclJBWi9nNVc4d1o2eFJpWU5mTDVwNDVPUzlkQWpvd2craFdE?=
 =?utf-8?B?UDE3OEZXV2N4cTlhb3NSZ0pFRnRieHUyN0dtUzZYdDg0RnNxZmhQdWpjUmJB?=
 =?utf-8?B?c0w3b1EwQnkyU2NnRjl6V3ZKZkJOKzVNRUVjdjVZVytqSytWdEIyVlNqMnRP?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a06d5a-90b4-46db-a1e1-08de09c2bfbc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 19:08:37.9441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2Lu+mOE6g7GoRUBliOfesobqbVcSdRCZzFotpY1eaIa58oSeL78VODI86BMkPTzjs2P+nogkXBNFKn01685qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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

On Sat, Oct 11, 2025 at 09:38:25PM +0200, Michał Winiarski wrote:
> As part of upcoming changes, the struct xe_gt_sriov_pf_migration will be
> used as a per-VF data structure.
> The mutex (which is currently the only member of this structure) will
> have slightly different semantics.
> Extract the mutex to free up the struct name and simplify the future
> changes.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c       | 4 ++--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h | 2 --
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h           | 2 +-
>  3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index ca28f45aaf481..f8604b172963e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -122,7 +122,7 @@ static bool pf_migration_supported(struct xe_gt *gt)
>  static struct mutex *pf_migration_mutex(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> -	return &gt->sriov.pf.migration.snapshot_lock;
> +	return &gt->sriov.pf.snapshot_lock;

By the end of series this function looks like:

 14 static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
 15 {
 16         xe_assert(xe, IS_SRIOV_PF(xe));
 17         xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
 18         return &xe->sriov.pf.vfs[vfid].migration.lock;
 19 }

And...

grep snapshot_lock *.c *.h
xe_gt_sriov_pf_migration.c:     err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.snapshot_lock);
xe_gt_sriov_pf_types.h: struct mutex snapshot_lock;

So 'snapshot_lock' isn't used at the end of the series. Maybe drop this
patch, delete the snapshot_lock in the patch which restructures the
above code / remove the snapshot_lock usage.

Matt 

>  }
>  
>  static struct xe_gt_sriov_state_snapshot *pf_pick_vf_snapshot(struct xe_gt *gt,
> @@ -400,7 +400,7 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  	if (!pf_migration_supported(gt))
>  		return 0;
>  
> -	err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.migration.snapshot_lock);
> +	err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.snapshot_lock);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> index 9d672feac5f04..fdc5a31dd8989 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> @@ -30,8 +30,6 @@ struct xe_gt_sriov_state_snapshot {
>   * Used by the PF driver to maintain non-VF specific per-GT data.
>   */
>  struct xe_gt_sriov_pf_migration {
> -	/** @snapshot_lock: protects all VFs snapshots */
> -	struct mutex snapshot_lock;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index a64a6835ad656..9a856da379d39 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -58,7 +58,7 @@ struct xe_gt_sriov_pf {
>  	struct xe_gt_sriov_pf_service service;
>  	struct xe_gt_sriov_pf_control control;
>  	struct xe_gt_sriov_pf_policy policy;
> -	struct xe_gt_sriov_pf_migration migration;
> +	struct mutex snapshot_lock;
>  	struct xe_gt_sriov_spare_config spare;
>  	struct xe_gt_sriov_metadata *vfs;
>  };
> -- 
> 2.50.1
> 
