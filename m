Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64D28CB086
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 16:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F8B10E876;
	Tue, 21 May 2024 14:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCmfN3ty";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6892210E84A;
 Tue, 21 May 2024 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716301828; x=1747837828;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+8aeYzEQLcQmsrEU5MLq5px/3ze1q5hQUJcr02mZuaI=;
 b=VCmfN3tycnqip4t0E2/0h1aA+KcVFj/EMsBeQNxAMu2iqbDvQYqE3wvW
 PwOaB6viTMHnbv8FyBKQ+IJrFd8x51Xz84j9rDikjRzjhgJMi65SHmNz4
 RBdYhx5wuAW6hQY0nMfymbToqjY9H+o3SFSLlWqBzg3kHBIx/S/fpO7nX
 X3nwkRq7TYBuul7kqRnLcF312oqiEnXfCXyaXJR5gcXPd+EDZeXqOJeWY
 CCIlb8rRK7pRrGjVwQWGPHijWu2j+X1PTqm0+L7k72eAAgSXh5PQcS6Jz
 /qOUV2+lnUZon4MsXmxOP/PzM7psjt/KJMTy6KqlAHh8fU5D8tUNZWJxm g==;
X-CSE-ConnectionGUID: 9L7w2GgjT36Qvqw4Iyz7rg==
X-CSE-MsgGUID: vQE4aunqTK2acrRLB0Paqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16327644"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="16327644"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:29:58 -0700
X-CSE-ConnectionGUID: Lj+nor6CQzGE4aXIV0gj8A==
X-CSE-MsgGUID: YBZDNKnHT8qwlVA4C5Et+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="64165562"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 07:29:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 07:29:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 07:29:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 07:29:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZK1NDIbthzM7awRKB+Zn4eaygSc5Uec98lkZFKUDk/XoHBdG4IOCPX1ulf1isKE/KmcA9l88ixgd+rIXJjksDhvkig7/GODFvpGYMug3H5ZEAGWmkBBxz0568qrNZ6TJk5PlylWTyWlEWiRtTiDfEJ/3H9n+NSngm+iOPdoyaKddvzyqEAccP2qOdxBAi/PM8lGp2B2+OJ74wkVRlqeOzUpj5zcxcOaKE37CrLbRQurdadn6vbvYh4fNRiWGgMeu3avNxNt0LdKuMGrk/UvnsPSj16k97SKeIwUm0O9dAjaasfATZEGDLttzi5Sp5E8ar8yW4QPylSZreE6H8sUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8aeYzEQLcQmsrEU5MLq5px/3ze1q5hQUJcr02mZuaI=;
 b=Aq4Tqq7iu5S75sDVGwYYYP9l/CFOsn1GIqWXwBaMPaMdnCXDOtn6vujdoh0azZ6OmfYMcs00M8Hi2CcJB7OBaHsqUUXel2d++S1dzB7J3uYsWONcZTvTWw3DYRD8zGNP8j9mQjcm4lU2gD6JBdd1rWRzK5HUL2Mg5nr75AaCKT2OtFrcvp6rJgFZEVG6LkIExjSn5zGimVG0RG/GNcKKyJYOlhFz00oTIX9PVXaLUhU6doVdE8scDUpN81CgCqOdXFZaEVEwTCX4bbfKhGoU6p9MJBFXfS7mDZIp4uUP+H42OqNsL8bISuPcDWm7zxMOBLUXngrxJMRpcFTWlWKHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 14:29:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 14:29:55 +0000
Date: Tue, 21 May 2024 09:29:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] nightly.conf: Update drm-intel URLs, add missing bare
 ssh drm-xe URL
Message-ID: <cholsrq7njebasvtouqno37cr33lw3nt4x6qbwuvvbwahnheq2@6x5izk7p6epq>
References: <20240424113218.37162-2-ryszard.knop@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240424113218.37162-2-ryszard.knop@intel.com>
X-ClientProxiedBy: MW3PR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:303:2a::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 1343d969-d2ac-4807-5e8c-08dc79a27bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jSDeG05wWljOPms3Ob6JgQUY8Fhwtx6sD7wt0qfNcv1taUfpFUaThNszQUAy?=
 =?us-ascii?Q?F04m22AA/wrwjOC9xJuCOj/5NEBb8In7YO54d6v/efufxOUzRzuXBrLI2Pzx?=
 =?us-ascii?Q?SnCDFpm8SmiA7mCUi3OAxNRC/AFa5+z1/QTjsw9rEoJ47Fg2ryZhx9WMGoIC?=
 =?us-ascii?Q?ZBAC0w/XBkaXAYdqfY2s/VhLDCEsxf40NjDIusMEskiONPLVw811EWligUAG?=
 =?us-ascii?Q?JeIZaVr8Y3O0PKxNSa3MKkpBbuRdYRUABhdIci9XXEFBOjoqE6frEtwbpyEB?=
 =?us-ascii?Q?ddH0x7e1IjMKfLT44yP3lEj3AEaY653HIEtppcAzvHBIEkXrmaZLzYsp3mH8?=
 =?us-ascii?Q?urQxjyuipQmZ8RGmA/NW8uZixBx8TZo53VdmnLiBXLEH6tut4qH+1AsLAzKH?=
 =?us-ascii?Q?XoxiOdHS+cW3loK6D9iQ4DWa2CIMXtr9d0uBV09icnLIVmmhk/47DiaMu7bC?=
 =?us-ascii?Q?7wa62w9Nk4a3KcRfBy/k/f0Qx3tjo64+HxIu7XHCuexu0MW2NnUu+JqnHtMy?=
 =?us-ascii?Q?8kO6Zq42gTf7sx0nkooEuZKz2K6/TuA0frBcTmFS5WpzN43lM6kjlxNj/g2e?=
 =?us-ascii?Q?5K8Twmlh/T+VQO1qVL3haIWqNNqbN0fzEtzuwjJacvNqH/zhuuKUUlgRPyHU?=
 =?us-ascii?Q?kPYgwf4ehfgLiikNamy6ddFtiOk5zTzfejEfM1mU7I4aJTnco21vhVX5k01W?=
 =?us-ascii?Q?Nfy87VE9qPYGQRYF79RWmVM2ulVavDdPDZ5JYm76ZO4gLaiSNto1c6N2BXfZ?=
 =?us-ascii?Q?BWGr+2q+TO+l4kqct6YZAaoCwV8pQJRDo2ACdV4ey7QdAKSz8JpNhH98n8dC?=
 =?us-ascii?Q?A/6vm5JjxyfF1z7yUkqy3SBEBIa7el3/n0PHuXwSTtzyGvQk615iO8WBbuom?=
 =?us-ascii?Q?F5FjcsKlBrLHBm9unbyCHhgDphfW0WHlXg1KuCTdn1FQsXthQyQEkwYM4d3J?=
 =?us-ascii?Q?aZhcByWMB2PJ9UAemmnlrlHPE6OFvOEpohs2U0u+bLReG/PTUunzOs/gGivH?=
 =?us-ascii?Q?XZQknpD3Tphz0APikpCEkKNN99TYXmMyQwgn2/MPODSOf5KqBGVpENiSFY5r?=
 =?us-ascii?Q?Ig8zKtEi22uMFNR6JknhpkUP3NTuE0+3X4J2jUDrWgOwdbzNuHisG563wtRP?=
 =?us-ascii?Q?LXJxBDbyCb7P83QjII9WMBUoEexuZtF863wAwmTqi9OHulK7soNR2xh3frOx?=
 =?us-ascii?Q?wN6MSKyqf24i8qHrM8nNJq+Sk2UwoUkq4/ySJEy+B9iACoWaS52F+/lEjQrc?=
 =?us-ascii?Q?Z7s4zrqrGZpv/lYBdeOTBCub87EBVZ0H6YAcpRLzLA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8hmfvb8pgjaQg8yOWiIDnirQ+SpIit5BcbvmRAhbAgfi4dD9btyn4xsc9kWT?=
 =?us-ascii?Q?i5f/XajbneOb+ONRXVNs6DAkeoD81kuu4wL8gTmip8Q1ojn0T4Io3uzikZ6/?=
 =?us-ascii?Q?D+WVhIj2tjr2dKzQtxgTIFMiYkQUCOi23m/V+ren0OP4Drq8JlhxVFdEnW4L?=
 =?us-ascii?Q?h//363ea0nro05t3YWyjD3IC0XAghITZcQ1ixE2XJTK/OzZUvbCDaDpEoYPe?=
 =?us-ascii?Q?V7K8Ii4rS63IMyg+gB5lTP73BS+WjcJh4C9El9i9f7W9bfOVdHgdOOvOfYif?=
 =?us-ascii?Q?ZmMWKNB+YxAfujOS/7vWNm7XRrR2kW8Eq5laSodBCKhK1HnbGzQoKXLWSrD8?=
 =?us-ascii?Q?a8DdbtgTjNHoU2l1Mkd8L/+mhBGh0zhZz+YC8Z9jvSfbwZefXYT4eyed5iSJ?=
 =?us-ascii?Q?KeZGRn6ltlxlG4ETW25l4AFppsr9UyIecmcz1Tz5LNzzGxjQMmqguuGyeslr?=
 =?us-ascii?Q?5gn/o23CaVXcFN1hhYpEd4cV2we0zBSl/ZQ9h6PJI60xGfr4jl1SwOyph9xL?=
 =?us-ascii?Q?y3p6yj9GlLdJHhBLDBG3NtRTZoBbPVF7MtfBx9X72gtGQ5K11k0wrp72EedA?=
 =?us-ascii?Q?NexhMTDKbdKItQxKepDexTttPiyYFQzZRRdL0eTqDyF6ZbItDY9HJzqXOqaP?=
 =?us-ascii?Q?gId3bjwLqAWqEHi2+uTZDP62PuQMENgiuMLxD5nYgE2O6KbyMr6lyFlQHu05?=
 =?us-ascii?Q?61XtgXurrmj2DG52Hd8+ObmLYtDfJ6+fHgVlfphBgjr0+LtHOe8kBM1sO5SV?=
 =?us-ascii?Q?0Qyh8CEMT0Yo13ix80d4WhyFQpGcUJJ5U3vfCzHVUNu4bjgbls1QfDZcLSMp?=
 =?us-ascii?Q?T+HrQ75Ndw9BrQ5sWVxIlP/OrsH34BJLsyFaPb4Pn1iiURacv50QH3iATHPX?=
 =?us-ascii?Q?PwL5sR3CC0QLECd5FVUYLcPlAby8p7tpf8Yg7T2NpETniQozOtzpjuNW1AHv?=
 =?us-ascii?Q?eOdI1PjBClFXUVNkkQ/q228z334KfqhLMrbyL+O6MgFsKZUNMqy9BPAZnO7+?=
 =?us-ascii?Q?WLjltB2prCjVx8nRc3x120cMbIPqcoecQZTR91bKqINq9spYXSo4AuRK+FYO?=
 =?us-ascii?Q?CdUcJl5pGGsTjubLnt0ORRtoRZv3ecw+s0aca85MmIXkb/zjplZnjcFiylOb?=
 =?us-ascii?Q?sCKGtb54dUHP0ullra7k5dL54I6O9AXxiC+/2D7CRmZbkCwgCiHIDo8eeZza?=
 =?us-ascii?Q?LIYUOUvX3SZVa/NF4c1suQg+cDALQp7X0cGFDTOAb6XyWFy8vgSKy5SOexVZ?=
 =?us-ascii?Q?ICd69+Ql8GUKDQcVXRhixK5kuvjau5VxiGBqL1f8W+0E2DKX6/gGRzDUXfnP?=
 =?us-ascii?Q?3wTh7YHh2COK0z0A2ZNnNNSiH1m/auo788io1ynr1vjS17hh6f6QWx+WgkX8?=
 =?us-ascii?Q?fElzQwXQLLd4k1Bv2Pub5n2Hi1p82OhANY7OdaFwCPLYdNF46qC1Pmi9E3MY?=
 =?us-ascii?Q?dshghjetgGxP2kJx4dc1lCjaToE7E0G580LU5QSpqxT8fRVhqjrv52dGAtGi?=
 =?us-ascii?Q?i2qXUE5FfAAcEKkyZGvoV5JzRkA1En5JznqIpTmXr9Y9ct9zk/lPJhmaexo1?=
 =?us-ascii?Q?RqWCiBEjlL2b6Bg4fV9MEEBXo5INm32jnIhYVvl5Hx9Tc63kw7mc4HiPf6qH?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1343d969-d2ac-4807-5e8c-08dc79a27bca
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 14:29:54.9620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFVNFW/wfjvNSNoZkE4B8Pa3umMaeEFFiArAt4Xa4SfEFFUQBn8q8Jw0QsI77fRB9rl+0AOR+HlT8uX9EipBVcbiY2GtNt5wu+CNYgBUeEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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

On Wed, Apr 24, 2024 at 01:32:19PM GMT, Ryszard Knop wrote:
>- Switch drm-intel URLs to the new GitLab location.
>- Add a short SSH link for drm-xe for completeness with other blocks.
>- Add a missing tab in drm_tip_config for column alignment.
>
>Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>

Applied, thanks
Lucas De Marchi
