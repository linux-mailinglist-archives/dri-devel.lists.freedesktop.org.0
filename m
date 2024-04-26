Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5182F8B2E42
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 03:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B90D10E8C7;
	Fri, 26 Apr 2024 01:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKe79Hs9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B237810E8C7;
 Fri, 26 Apr 2024 01:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714094626; x=1745630626;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XDR0EdQKYg991GV5GKbnhEc1dgA15N2W8nrelC/tewE=;
 b=BKe79Hs9PCb8DKrUrcm7WAoDo1QAwXEspDjLwDb+XnczJQVhOnK/3a64
 Tj2NX5UVh61U0yQ1lxhhHR2wxWx7EnIqc7SCbDbo0sdMXXyuWW3laNnKH
 TwfCWoHb+2jEFG9iBxxddLOL56m53OwpIhv3VIvPoB1v/mH0ZIz5RgoYH
 FNybrl2QZGxyaadElPyMPmnYb8SLvYiMKM7AIpGzSfkTfOYQbKOQfJJLI
 04eLOwPgwNNsE9ECRFguBMCVVxc3D1Fp6zedyR4sjEJid1jDgA3DRKUD4
 YG/aCvzfAKomNdIzL+ZlTr8t7qWUagGVY3YAfinadH1oM+eF/N8dMFoUf A==;
X-CSE-ConnectionGUID: TgGC8ONNS+C/O8BYmjKaXg==
X-CSE-MsgGUID: PXG7DXFGRUqL2xvfCg+I7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20507522"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="20507522"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 18:23:45 -0700
X-CSE-ConnectionGUID: Ed6E1JeeS9+qWTnzusnewQ==
X-CSE-MsgGUID: oHpeuxHKTZGoruKpZkGEXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="29744881"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 18:23:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 18:23:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 18:23:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 18:23:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 18:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtDNcK7dQvVNy9/8HrG869Krdq2SderYawCxAYSl378C3lv+JV4OoXLYoVYaw6J//7JXa7TxAhnFzF/acyuodi9AxYGZxEnhy8aL/7T9397qMdtotLwp2nVeIECsw7lOzXzf5CHXdfAFt0O5mhy48+FDDnqm+Ldq+9i6G3rWHVNxT1oDSe9PeNmv4SkdBcovoZGS4ReG9tsNeWXamLBCHLkarDkqp1fdntwTS5H4h7/t1Vx1riXI/+yOw5BDXlIwK0kY2/T5emiczs7/CYWPDn/NFRsMCAtsHZMFO7pvE1DgtGTzrqXlS7bYYBGeNBwFZR7oqypHPPGcejrEFAtVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhqkjlOXY9hV+A2uugTbfsKvPrvevZDqylWBYe85hBE=;
 b=hxLTAJG7FC+FNfqTkOMnJIJ/hmArXvGx+3VVfRTTCJCJSePT3d3t9cZwfmg3aoMmNSiiFTZq1lP5XpTAh1aW+C8qHKQ1sWer45piZy3RkTGV4Dbf/c+AFMMv6cVqEFo3FlCC4ImPmCIIKvJQJ8DHCEh2ylsRgdTzsE812O5Khiz0a8Gt/Zs8FYD7YPrOOHk+vUGT2rqc7czRTKHMLuKMTwBWX4mSusgtsxE4sXZPEuFfz6gA/PrBI9g2L79AKMH2TorwhVkI3YYupLVgS/qnmAm9NddlpfblHXKTKlGkhLFPYVY21iDQSernXz4134+EUR7cQUN9Inbo04pBXtj/pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6484.namprd11.prod.outlook.com (2603:10b6:208:3bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Fri, 26 Apr
 2024 01:23:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Fri, 26 Apr 2024
 01:23:42 +0000
Date: Fri, 26 Apr 2024 01:23:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/9] drm/ttm: Use LRU hitches
Message-ID: <ZisCGEsqlypxJgfG@DUT025-TGLU.fm.intel.com>
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
 <20240416100730.6666-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240416100730.6666-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: cc37e7c8-6f9b-4fec-d4fb-08dc658f822b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?r/GHOGIzQlht2EPAc0RQRVc21ZGAMPiXstNzYp0F+83BBFeUHz2UPJjdSO?=
 =?iso-8859-1?Q?Xop1EinFSldPNK5TfnZYTiV1S5zVfbMr5gtUJM/QO6fe7PC1qOBmsto+Ds?=
 =?iso-8859-1?Q?wpExJcJLsp4efeh/UAhYdoMqPfGK+eBc5rqvhqepavw45jfa6gnFb2a08m?=
 =?iso-8859-1?Q?hE0Eyjl0qAGNz8IN1HzCmm+SSomU7Mn23F1lYx5E+JWPUp2KcWwcpuzSUv?=
 =?iso-8859-1?Q?+T47Ghy+2WUEMWO1B5A0qL6mUCJ0nuLsrM0ZIU11iLBP1JslpGj2+nycxs?=
 =?iso-8859-1?Q?s55DKnWIs9zcP9JR8c07WW2J2mlYeODGEQj6NtIjSQBOz2YCmSaCpeh6Xj?=
 =?iso-8859-1?Q?KxExH2K4suf0TFfa8198JBMRJEPXzng69C4AvsBHkYiEBeakCGhbqyhURs?=
 =?iso-8859-1?Q?iA7fyNaJxc0LDen6dh9dLOGcvxToy8M/SXRhmxDZwLlwrptimElSfWkTnr?=
 =?iso-8859-1?Q?9w+vonFqp+bCCzw+Xr9qkgBxN5OELnMyXOdhLybwFqnSaD32slgerBOJcV?=
 =?iso-8859-1?Q?k6boY/GBsGD9bf7jXuUaPsjrlIIEgJV8EgCnxj4GhP8G3gsXMAsJATXEup?=
 =?iso-8859-1?Q?N6B2Ui+auPyD6AiuEWULuQKOOeybq3catfsox1UKb2IT4ue4bB4MNA1r7F?=
 =?iso-8859-1?Q?o9m1r6pszD+gvpcIes73Ldu0w49MnKUYY9cqQA0LY+NimnUzYvYxBGz3Sb?=
 =?iso-8859-1?Q?940yWK8Yo+VTPuI8siLaKHNP5t4u5qtcSDMgcuDKNO6eUELTPQNj239bnA?=
 =?iso-8859-1?Q?QQ4SSF01FvHo0yAbytZ2Xi+Y/Go2qnix85Qu5U5QCxgtx536Y1lsJxTnBS?=
 =?iso-8859-1?Q?0hkdZimPE5606Qjzd3AWeNITfCYs2aE4eTcAEgKAkKyUNL+wfqF4wL5xPZ?=
 =?iso-8859-1?Q?LYozdVE2fTHr2tIlFXAvAJBLlsQlpCdjouozRl/1onn/EBbI5ltns6lROm?=
 =?iso-8859-1?Q?ztq10W6BP2I4Vu33ieRTJfKC+EFhkuT7mxJ/wLMRkqFaqHx0rNsdFim4CQ?=
 =?iso-8859-1?Q?ozj8L8lxleig+8GN+MrOciL/ASMax9sV8yka+/ingnJEKFGlE0ELx1HYE6?=
 =?iso-8859-1?Q?9Ao+t9EmbvM41sRSvPTGWMG/gdBl/OOrJX45ejZbCefO7EpJS7AySd6RP+?=
 =?iso-8859-1?Q?jFNnDpSAlQi3729h7Ow3kpAYEjrAIS/3JS5ePyDZMfS0n1KCzmh162yh7U?=
 =?iso-8859-1?Q?gpD+n76CrsJilufIDdG6WTOcln5NkUrEib3HnRKD+lR0Xqre45FTbWgM7k?=
 =?iso-8859-1?Q?Lcmad36nO5SlsDT3PnfoZIPpi3dvlOsZMb7IQqNUHow+Ls7Lr3sSQb8VsT?=
 =?iso-8859-1?Q?Osy58EAurRnwvbjylF5F+TCH3A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IpUth5BO7wXoPrSAqqut2Z3eXKeQRXk0QjFeopO8ezyUMPb2ztYl/3JNqY?=
 =?iso-8859-1?Q?H7aFjgjMWwwO96bGHmad05GVzyikBRDbjfC1319DxPHvV3lE8rdFItNVY5?=
 =?iso-8859-1?Q?yXjqWw/471oBE6SrIUkVaQJQI4PNLg5d69Qu24F/bvz8kyj3JOm4+zN1Te?=
 =?iso-8859-1?Q?Ket+gNCHb7DJxPG61QeSPrHlCPuxSnrGj2jCu8UloSHZhCszsCxDbDACIn?=
 =?iso-8859-1?Q?vfpa9CzZDQ8tqiElLGDHM91z36mtAkKpLawqhl/cn8FOw5c+w+FTihSq+D?=
 =?iso-8859-1?Q?4S3GLPJfGaKqNAMxpQU4JUB6ZzKhlNwgR95XLocjLvhzGkfMaesE8IFDP6?=
 =?iso-8859-1?Q?ECnTcMvbLqLm6zyVTxKbsAc8ZHL8UV8NoGqiBJTgQ+y9vIdL5MBlpAvXUQ?=
 =?iso-8859-1?Q?aZnRIOwhxMkQgglQjH3U+ppKjaFGFQ3aX3nZbpEqbrRKQxgBDQ+TObZru2?=
 =?iso-8859-1?Q?DwBbqT7XR9flVMGgkaC2uwgw4u2VW/AfuR70PcaT3qwHQeHuaFceYBIjX+?=
 =?iso-8859-1?Q?gMFnFeHnqA9l3hY3v4HTbdmE8RRJoty0mrPU1xpHZzEYNMjL6T1aeTwIeM?=
 =?iso-8859-1?Q?6AN4hKlX1tzJeccDOnyJ2wrIXjN6Su/fLxULHiodyI9WPVvcyzw5JgdLAa?=
 =?iso-8859-1?Q?QHWThAxUhx+/pNJ+2TzxZcTfADOQdnviFIFK/P7Cy3ffMLQbr2M1NA3WPe?=
 =?iso-8859-1?Q?kvUHuCyye5AHllI9j7s8QShSDEP1GsDJ++YxGALkaPottVB4QffaJYGviY?=
 =?iso-8859-1?Q?Wsh5Ja/3PSKoJ8K3DAvB8K6Abdt5nN7GSECHb1Rh0nyx8FkC/O17ce8AQb?=
 =?iso-8859-1?Q?fapWZOujTSzAwJqNYr7zFU6mZAbRTTiD087K8WWiKRTQReafXQLVL5nj2E?=
 =?iso-8859-1?Q?4roSrHyTlTUo+swUfCgLJyPXdeoqg4lrWM/mNa0JlD12WN1FnuchfNNYjR?=
 =?iso-8859-1?Q?/VFV5YgvD4Qz/BorBKPoW/iLUMoOTK9grFtrh1UNpkPwXD5S8jkx2is7ZL?=
 =?iso-8859-1?Q?TddJWE2ldJKp8n0tn3fw9+yqnwJSqctrMiSS7W1hVxU3kIj7HOK4fQSqDs?=
 =?iso-8859-1?Q?8LwX+ljnxwqhV/FziDQT80+mAPVkQsA3zoQQU0fzv5IIIm+fTnsyRLA8/K?=
 =?iso-8859-1?Q?D3s8sbY8DzVsedv1sEcPsCVqtzrXHIJGadpiCizkuggrLV5ydQShxC6W8B?=
 =?iso-8859-1?Q?l8CmY9CZlycsc1e5dhzG2vh5q28BKBSwMHYde/wTfrZ2ZCPfupo0qNCXid?=
 =?iso-8859-1?Q?2kM7Q59QlwgGSQ///ITcicsfx/FFBlfLYxYgUwhq+zAm4LhYg1Y0VrZOJ7?=
 =?iso-8859-1?Q?5SE7bYK5WlxOZlv3H5V2SZLPWerlCNBQoYvbres9ApSZPdzrwbianAna8z?=
 =?iso-8859-1?Q?kKlAIqxIIRCvbDXjUzH1C7m9X/1R1tePPWlmpDNZUQRgvs1XTpQuosW4yU?=
 =?iso-8859-1?Q?P63w0DHeVI43nYvCd8WxWn+yvxTwaqfL6VVRXE7Oe4UQdCBrFJyPTfdbAB?=
 =?iso-8859-1?Q?cGnHSnq9hACUeVFj7wJTIQd4ObxPP07xujYXvV5he+QYIj2vDJ0t5msxkK?=
 =?iso-8859-1?Q?CPmQyhUsOxAvb5qLzR/WQk0YFCrvi61Z/1mjm8ARK4a2JY+XJoGJHwFnNw?=
 =?iso-8859-1?Q?+ubTVzWh9FCB1S+4zkAHUTzcmvMDj8M8JmZtn8Yq2oWoF+Ii/xLRdgdA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc37e7c8-6f9b-4fec-d4fb-08dc658f822b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 01:23:42.0154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMG11d92txsr17Dq37ATNIqR8Ci1CFk/d+0AiZg0MQO5vew92aXF5us3oGR3RvnEB2fCh8Z7FObASMhUCz0jLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6484
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

On Tue, Apr 16, 2024 at 12:07:23PM +0200, Thomas Hellström wrote:
> Have iterators insert themselves into the list they are iterating
> over using hitch list nodes. Since only the iterator owner
> can remove these list nodes from the list, it's safe to unlock
> the list and when continuing, use them as a starting point. Due to
> the way LRU bumping works in TTM, newly added items will not be
> missed, and bumped items will be iterated over a second time before
> reaching the end of the list.
> 
> The exception is list with bulk move sublists. When bumping a
> sublist, a hitch that is part of that sublist will also be moved
> and we might miss items if restarting from it. This will be
> addressed in a later patch.
> 
> Changes in previous series:
> - Updated ttm_resource_cursor_fini() documentation.
> v2:
> - Don't reorder ttm_resource_manager_first() and _next().
>   (Christian König).
> - Use list_add instead of list_move
>   (Christian König)
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c       |  1 +
>  drivers/gpu/drm/ttm/ttm_device.c   |  9 ++-
>  drivers/gpu/drm/ttm/ttm_resource.c | 94 ++++++++++++++++++++----------
>  include/drm/ttm/ttm_resource.h     | 16 +++--
>  4 files changed, 82 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 6396dece0db1..43eda720657f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -621,6 +621,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  		if (locked)
>  			dma_resv_unlock(res->bo->base.resv);
>  	}
> +	ttm_resource_cursor_fini_locked(&cursor);
>  
>  	if (!bo) {
>  		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index f27406e851e5..e8a6a1dab669 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -169,12 +169,17 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  			num_pages = PFN_UP(bo->base.size);
>  			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>  			/* ttm_bo_swapout has dropped the lru_lock */
> -			if (!ret)
> +			if (!ret) {
> +				ttm_resource_cursor_fini(&cursor);
>  				return num_pages;
> -			if (ret != -EBUSY)
> +			}
> +			if (ret != -EBUSY) {
> +				ttm_resource_cursor_fini(&cursor);
>  				return ret;
> +			}
>  		}
>  	}
> +	ttm_resource_cursor_fini_locked(&cursor);
>  	spin_unlock(&bdev->lru_lock);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7aa5ca5c0e33..22f8ae4ff4c0 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -32,6 +32,37 @@
>  
>  #include <drm/drm_util.h>
>  
> +/**
> + * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
> + * @cursor: The struct ttm_resource_cursor to finalize.
> + *
> + * The function pulls the LRU list cursor off any lists it was previusly
> + * attached to. Needs to be called with the LRU lock held. The function
> + * can be called multiple times after eachother.
> + */
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
> +{
> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> +	list_del_init(&cursor->hitch.link);
> +}
> +
> +/**
> + * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
> + * @cursor: The struct ttm_resource_cursor to finalize.
> + *
> + * The function pulls the LRU list cursor off any lists it was previusly
> + * attached to. Needs to be called without the LRU list lock held. The
> + * function can be called multiple times after eachother.
> + */
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
> +{
> +	spinlock_t *lru_lock = &cursor->man->bdev->lru_lock;
> +
> +	spin_lock(lru_lock);
> +	ttm_resource_cursor_fini_locked(cursor);
> +	spin_unlock(lru_lock);
> +}
> +
>  /**
>   * ttm_lru_bulk_move_init - initialize a bulk move structure
>   * @bulk: the structure to init
> @@ -484,61 +515,62 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>  EXPORT_SYMBOL(ttm_resource_manager_debug);
>  
>  /**
> - * ttm_resource_manager_first
> - *
> + * ttm_resource_manager_first() - Start iterating over the resources
> + * of a resource manager
>   * @man: resource manager to iterate over
>   * @cursor: cursor to record the position
>   *
> - * Returns the first resource from the resource manager.
> + * Initializes the cursor and starts iterating. When done iterating,
> + * the caller must explicitly call ttm_resource_cursor_fini().
> + *
> + * Return: The first resource from the resource manager.
>   */
>  struct ttm_resource *
>  ttm_resource_manager_first(struct ttm_resource_manager *man,
>  			   struct ttm_resource_cursor *cursor)
>  {
> -	struct ttm_lru_item *lru;
> -
>  	lockdep_assert_held(&man->bdev->lru_lock);
>  
> -	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
> -	     ++cursor->priority)
> -		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> -			if (ttm_lru_item_is_res(lru))
> -				return ttm_lru_item_to_res(lru);
> -		}
> +	cursor->priority = 0;
> +	cursor->man = man;
> +	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> +	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
>  
> -	return NULL;
> +	return ttm_resource_manager_next(cursor);
>  }
>  
>  /**
> - * ttm_resource_manager_next
> - *
> - * @man: resource manager to iterate over
> + * ttm_resource_manager_next() - Continue iterating over the resource manager
> + * resources
>   * @cursor: cursor to record the position
> - * @res: the current resource pointer
>   *
> - * Returns the next resource from the resource manager.
> + * Return: The next resource from the resource manager.
>   */
>  struct ttm_resource *
> -ttm_resource_manager_next(struct ttm_resource_manager *man,
> -			  struct ttm_resource_cursor *cursor,
> -			  struct ttm_resource *res)
> +ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>  {
> -	struct ttm_lru_item *lru = &res->lru;
> +	struct ttm_resource_manager *man = cursor->man;
> +	struct ttm_lru_item *lru;
>  
>  	lockdep_assert_held(&man->bdev->lru_lock);
>  
> -	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> -		if (ttm_lru_item_is_res(lru))
> -			return ttm_lru_item_to_res(lru);
> -	}
> -
> -	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
> -	     ++cursor->priority)
> -		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> -			if (ttm_lru_item_is_res(lru))
> -				ttm_lru_item_to_res(lru);
> +	do {
> +		lru = &cursor->hitch;
> +		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru)) {
> +				list_move(&cursor->hitch.link, &lru->link);
> +				return ttm_lru_item_to_res(lru);
> +			}
>  		}
>  
> +		if (++cursor->priority >= TTM_MAX_BO_PRIORITY)
> +			break;
> +
> +		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
> +	} while (true);
> +
> +	list_del_init(&cursor->hitch.link);

As mentioned in patch #3, probably use ttm_resource_cursor_fini_locked here.

Have an open pacth #1 too related this patch but this does look sane.

Matt

> +
>  	return NULL;
>  }
>  
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 4babc4ff10b0..dfc01258c981 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -271,15 +271,23 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
>  
>  /**
>   * struct ttm_resource_cursor
> - *
> + * @man: The resource manager currently being iterated over
> + * @hitch: A hitch list node inserted before the next resource
> + * to iterate over.
>   * @priority: the current priority
>   *
>   * Cursor to iterate over the resources in a manager.
>   */
>  struct ttm_resource_cursor {
> +	struct ttm_resource_manager *man;
> +	struct ttm_lru_item hitch;
>  	unsigned int priority;
>  };
>  
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
> +
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> +
>  /**
>   * struct ttm_lru_bulk_move_pos
>   *
> @@ -438,9 +446,7 @@ struct ttm_resource *
>  ttm_resource_manager_first(struct ttm_resource_manager *man,
>  			   struct ttm_resource_cursor *cursor);
>  struct ttm_resource *
> -ttm_resource_manager_next(struct ttm_resource_manager *man,
> -			  struct ttm_resource_cursor *cursor,
> -			  struct ttm_resource *res);
> +ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
>  
>  /**
>   * ttm_resource_manager_for_each_res - iterate over all resources
> @@ -452,7 +458,7 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
>   */
>  #define ttm_resource_manager_for_each_res(man, cursor, res)		\
>  	for (res = ttm_resource_manager_first(man, cursor); res;	\
> -	     res = ttm_resource_manager_next(man, cursor, res))
> +	     res = ttm_resource_manager_next(cursor))
>  
>  struct ttm_kmap_iter *
>  ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
> -- 
> 2.44.0
> 
