Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2460C02C09
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 19:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB15810E934;
	Thu, 23 Oct 2025 17:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGHkyXV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6327510E934;
 Thu, 23 Oct 2025 17:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761241080; x=1792777080;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BWltu0/2nTjb032X/G1Z7VnHbXl11yhTm9aMyIL0gbY=;
 b=oGHkyXV9leFmR1mY3wLSHOLMmP7td9DRlEzocfKGPN5q/wZ/27L2ro6P
 DKm+Xs5vXliKL4vvDT7RlQ9kvzdjhR76mNnqEKvYqXR4kECKXbTj0OhGR
 XuxA/Nrsrt7S/K0e8EwThTdEOKsG6WxX5bkCxrHO8B3I9y7SjYGBluS/l
 GXJzKK6xexifH+heLqNs31WId4kn6VV2PEVFHZ89bqEv4MirPB04B/sdy
 6Mw3+3eHqY7iPaD29Vfa8ARjbqe6Ly12VvLFy4Vo6M1u2ayb8rPqmTSSC
 vNYVIK6e9dkYMBZEOrSQCHN3EBIL+PSbV6iCvwWwEqS74o1YO4L3JxvEd w==;
X-CSE-ConnectionGUID: +Rod3YktRuCdhG3F3vydlA==
X-CSE-MsgGUID: F6fMkTVsTO6i6nfsgwZyEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63567842"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="63567842"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 10:38:00 -0700
X-CSE-ConnectionGUID: DXkr89KdTkmpcJkK6IHqEw==
X-CSE-MsgGUID: xAf8R4vCTMKLZWa7c+/lvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="188510585"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 10:38:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 10:37:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 10:37:59 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 10:37:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLlP4DD+F5To2EHDpC8o5yASvGQkFuYtdS+7UuJBcZoJGyDF4uDhQRfa7uKIzS8DQJkw5NYKdcBfjkziXLF5ge3Bm9m41Vl55/AktxDWx/QnDWgROApvvhWKVca4H3Ax3mWnJ83uuiDSIclXYmccBnq3fdYq6I5B3lvV+Es4+lx8e3KYs+BeVrfZs6/gnoqmsgoeLmEpnFkl3f+n+AY2v9Hb9mgAlNoGMQaO4qJuavD/WLh1+hsaqippUn+V92lhSmrDNWqbEqtLcRJ4gOAiXRDCizt1kAsIpg2jnbSTO2u8bZwh+zTWv9vkYaDeb59tkisM07cZ91WN4/siuk1EjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrgbKWTMRz3tDCSXj/GysUStWFEQAFHlbXh1VzLoi/4=;
 b=wnGXRBrOp7gfm2MP2K1TFq9/qnLgd2ktoQ3c54i49tbL6DeeR6VxbW4eMgghnKCMa6zn1g0otf3LKudaowol6Gbb0x+gu88Tq0hLbHsFa/SXBOkjmZF3SNAxrV3b2yu28MaWN1c8+YSVxCCiKmxR7OM2aK0hoHlYIZLfAbhMafhdpV88hlGe5JU4Q0CM0GbIAtXWxLVJlpKwQTYAL2/wRWDnKWVqxwubgugDB8lWY2Ze7B1mj3y7VURhKnRiy4NZhRRFyRNCH0eklBqnoVzvDYn4jaBxXfkNTfxwgA/mz7ZsXT/RFSaBsCK9umstKX/bvHYeqyn2+854kaJZWQWecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6944.namprd11.prod.outlook.com (2603:10b6:806:2bb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 17:37:57 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 17:37:56 +0000
Message-ID: <687d4d54-09d6-4e30-921b-66c0e9bd0d51@intel.com>
Date: Thu, 23 Oct 2025 19:37:48 +0200
User-Agent: Mozilla Thunderbird
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 11/26] drm/xe/pf: Increase PF GuC Buffer Cache size and
 use it for VF migration
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-12-michal.winiarski@intel.com>
Content-Language: en-US
In-Reply-To: <20251021224133.577765-12-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIYP296CA0001.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 2008c787-5e0f-4dc4-0f68-08de125ae68c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDJaUFNJYm9XK3RONVc0MUVEdVo1Z0xhdmdCSzR0eUZVNmJrc2tXdDFoUEJM?=
 =?utf-8?B?K3lrb0VYTXhid2w3ZllUQTBocXNMK0ZQQWNQNjZta0RrUTkxWHlSSjF3VnJ6?=
 =?utf-8?B?TmhXVktkajBhc25ldEZaSG05SUdxVFJjSmRmeXBsT244cjBybncya0ZjcFNK?=
 =?utf-8?B?c2MxdzZOek1reFQ2cTlVcFppQ0lDbmtGWTJ4MkY3dmNIUkl1NER6YUpWNGtp?=
 =?utf-8?B?ckErMGNJZTcySkE4Sk1jT1VLc3d4RXVDRXBEWGJPWVlxTDNPWWxIa3NMUTJz?=
 =?utf-8?B?OEd1clVPUXRxR2ovUHFhREYwN29JamZkY0R6YzZDSzg2RVIxRlg1YytBcnBU?=
 =?utf-8?B?WVBqNXZxY25HMUx5YTNTcDFGY2x3SHFxSGZIWHA1VXRzZjBCckdHUlFUY2lO?=
 =?utf-8?B?T2JQWlR3Ni9VM1RLNHY1b0FVU0V4QXN0NW9VdjRGV1FCMEZpRVBGdXpmVVFq?=
 =?utf-8?B?SGcwSUNDRVdVVmRZN3dJc3ZTb0JBRjNqY0phN28zenA3aVNxVjVXdkthTnRW?=
 =?utf-8?B?b0xMR29wdXAxY1JhYlB1a2tScXJpV1VNdXk2dW1vNmplcGgxWEhVS1gyakpF?=
 =?utf-8?B?RmRkQkdrZHZJY2tLMGo1Rm9HQTZLSW9Id3gzTFJic1Y0dUhYaUFRSjNGeWlV?=
 =?utf-8?B?WDRrdHFxMk9rS2IvbHRvNjIrc3hHVGJkTURYZzhNMEIzb1JFTGpqOGk1NnVr?=
 =?utf-8?B?Z09oUkdqbTYreXZOcktuVDZXQjJ2T1VMc0lTWmJrNzA0L2pMbHM3ZUhINzVV?=
 =?utf-8?B?bW01VlBCMlhHMlV2Qlk5amVpSUd0dlEwTWRWUHpQd0ZydW0wOVRWcFQ1SXpv?=
 =?utf-8?B?aUxTRW12dFphMHJwd21hZno4WS9PWldPbW1FM21FTTlTaXNxbWdYLzhJa0or?=
 =?utf-8?B?UHpGQ1RLY0lZNk15WjlvSG1xNGVrR1BhMC84S0h6Qzc2aDVSb2YvOWk3ZFN2?=
 =?utf-8?B?eVJSUlJ0eUxqdXQ0OXVSRFViUjUvc3J3cUk0WXV3bmdoY2dGL0laT2Q4R3pz?=
 =?utf-8?B?RkkxNVptcytITVovZUVQdldqR0EwMEtwOVRjbkNPb0hCanV0T0lkamRzQUYr?=
 =?utf-8?B?TjRoZDZlelNVTkRzZUs4N2xzdzNWUU5jTEkvdnFoSWNhSC9QcjFLWmVyanlw?=
 =?utf-8?B?SHFUQ2tSZFhLMzRZZitCek5aYmlqVkdtY20vZDBlcTVycTR3K3hnOStmOWRW?=
 =?utf-8?B?TlMrYTgxWDBoN1Q0dUZaWjdxVWNBUWY4OXk1WUhFQisvaHNGSUFWcy90Ynl0?=
 =?utf-8?B?Q1A4MThZZmw1UU1LY2EwUFBJWEJyYzRHQjBPTDFlNlJ6Ykd2TUFtTFJwa0E1?=
 =?utf-8?B?RHhZWGVTU2ZFS2dGaXk0MXBpK3JZZHdqR290VW1hTWdadUlHSmpUUTNJRjFr?=
 =?utf-8?B?eHNBbXNSRXhlaWhHUDVBVSsxZXBDWEVhaThkazR4eFhrT2paaC9VT0hWdlZN?=
 =?utf-8?B?dHZvRWM0YUkxSWdhK0IvR29IS3pBTEl1M3h3M2h0TjAxK0xwUGJ0MGJHZjY2?=
 =?utf-8?B?algxdExxakhZYkF6U2ErNTNDY1AvMGFOeVEvdkxBUzhhWU1PWkFTVWtrTlA1?=
 =?utf-8?B?N1hZM2VyS21KbUJrWWI3Ylhpd3o1NjJSSEJHRzlxa0pjcHJhTXNSTVl6ek5J?=
 =?utf-8?B?d1IvRVkweHNac0JRUG9Dd0w2SDR2VitGOWVrUVpIWWlXaFJPbmhhREI5cE51?=
 =?utf-8?B?bTc1cW5UVnliV0VyeTZ2RVdOMENuSHY2VE5jN3ZGaVJtOUhkNEc0VHhjY0dJ?=
 =?utf-8?B?WXNJWVdVRWdjVkxhYWVSeFk1bkJoc0pqZHhaR3NlWDBRWGhwZ0h1NUl6aW83?=
 =?utf-8?B?WXQwQjFHOTFINzJFWHkyeGpFaXp6eWwwcFpvNnVFcGZQejRKME4vSU5kU2Z4?=
 =?utf-8?B?aFNhYVFBTG1TdHRSNzU1NFlmV25xV1hoQ2ZqbytqSFRlTnA1N0JBcFgrdUVp?=
 =?utf-8?B?TlZjZEdzZ3M2eGVuRFlhZVRidGRKeXFldjRLd1pRWFdGanI4MEQrdlVFQkcz?=
 =?utf-8?Q?hepX9UZSHgUlwhuIT0/M0s4Msfe0Xo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1A4U2NuVVJnV0s4TmxkQ1lHRWdTSXNyTzYxQzJVdUs5K0M4em5LZnVraWhm?=
 =?utf-8?B?ZjBzc2JIWk5KVGgvWnByL2tmTlg3UHpTUFpWd3pRcVhyUW1tcllKV3lhRzdi?=
 =?utf-8?B?UXUzNkpBUStOakdUWCtWd2hFTlhCUGxkWmgyaTlaS2ExTHNoL0VFa080L2hE?=
 =?utf-8?B?alJDdXRXZXZpWHlGelZISGZUcXBnb3QrTnhmdjc4NUlSQVNaeFQ1OUlRcEk2?=
 =?utf-8?B?bXlCZU95QklQUkhyNnFJSC92eHhLR3UwSWJYTkdTcFN6TTcwNStWSUpzMG9D?=
 =?utf-8?B?eDlWdmFHRUhNQVozMDFZMjgzTFlMWVNJd09GbW05UVVHU254cmZ1R3UwTjNa?=
 =?utf-8?B?eVhQcFFRaGMvdzNzcThoL3pBSThJVENkdTgxUWQydmhDME1QWFYzQTFuRDFW?=
 =?utf-8?B?S3ozYzlkV1VnbEJjcjNxb1h6a2gwU1FLU09ZQm1uMjgvdzgxMk1qMmdkN1Bv?=
 =?utf-8?B?VFRZYmY0dTFCc0QyNHp3WHphU0prV3JmU2NPN0xvY2d5M014MzFqQVpTRUxo?=
 =?utf-8?B?K2VTL2UwSDFaSURuUERDdWZETVVOQUQ3a1pIMkdJblFwSnM5eUJ4cjA4OHk0?=
 =?utf-8?B?bDByZUM0QWgzYUg4NVVLZDQ3N2U3czRya2lxS2QyNjZEQ3YyWktmRllKejI3?=
 =?utf-8?B?cDQxZnF6MGxBa25idVlJUUtJTEE2YXNKbEhwSWNsUHR1NFB5Uno3OEsza0c5?=
 =?utf-8?B?N0M4R0xmb1NDdW53SE9KSWd1WWJGekRQMUtPbzJ1Qnhrank4djc3NDdKWUJl?=
 =?utf-8?B?citrcDlRblVxTkduSTN0VGhOTTN4NDJzK1V5OXJCeUhUNzMzQjVKOGJxVHFC?=
 =?utf-8?B?Q1Z1Wkc2YzkvZHZQcGNxa2w0Wk8xdDhqb1VocFBjRkJzV2huWUV4YTAzNkV1?=
 =?utf-8?B?YUVwOFN6TW5YVzZtZkhIeUgrRDY5cEUzY0FLUnRXcWxKbkcwUk9YSWhCRVJU?=
 =?utf-8?B?cHNXcnlQOHlMMGdVbGxXS1F0MG1OUU5YRzFvbkdDTnlOOXhOajZZR1dhYk9v?=
 =?utf-8?B?YjhPek5LT2wrT0NiT0U3Z2svanNYSzIyYmlNcUxOcHF4M1N4WXRaMEV6U2M1?=
 =?utf-8?B?WnVyQ0d2UUtSaVVDUi9WN2JzOEJUN2JBT0RORHhYNkxTNWtHNjFZZGE2M1VQ?=
 =?utf-8?B?dHdNd3kvS1RqS2F0UVVVK1piTWpWWktKV29ZL0NZVElpR2tGbEFYbGJEUWd4?=
 =?utf-8?B?M0QySWNFZlRTUmNsWUI3Zlk4SWd5YlJFYlZuanErWGcwQ1J1YlMyL1A2NnNT?=
 =?utf-8?B?ME9OZkZIYzRaNldLOUVDc2NFZ2xkU1BuejFFRldjR0lYUUZjWlVzL2M5bnJr?=
 =?utf-8?B?S2VDUlVFK0xTeklzbDU2YjAzU2I5dmloRWJZWG5vbUNqdHFWdlpMVWJlYWRL?=
 =?utf-8?B?VENwS2ZZU1pvVVliQzBhSCtZQnBnOXJ3RWdTRHlGaDZUQUo5cS9QT0h0WVUw?=
 =?utf-8?B?VFk5QUJIaEdqSGRBUzQ1UG1xcVNtNGhTMHhrMi9kRjRXSFZKOXNvR3RKWTVa?=
 =?utf-8?B?R1RZZGhQWGN5SHRZc3lsZCtacVE4bVlyVm04S1J2anlLdFB1VWZHNnV4Q29h?=
 =?utf-8?B?dG03UkFKWjV2L3JFYTF0SEswUEJrY3p0WlZhK2kzL0VwWkxtWEhVTjR1OFZv?=
 =?utf-8?B?MWM5ekpMWEs5NXpIOWpINGdiZnJYcW1tTzdVZUtEMjhNYlhoSzArN1Zqdi9K?=
 =?utf-8?B?dXh4MWkrWXBzY09oTHlCWVFIV1BPNzhCQjU2TS8yL2h5eHBlVVNoN0pveEJT?=
 =?utf-8?B?VGtOTUdFb1BYbEQ4TlN3eEd2N1BuUCtNYjIyOXgwV2VONjVhc0Z0OGN5RXNq?=
 =?utf-8?B?TStDQUhKWDJmdEFMTEFhTU52RWpuWHhxc0tBRE50RzZoUkNJRmR5Zzg4dmw1?=
 =?utf-8?B?NHhITmhSeGhWYUdXbU9nbjBJVWNwMzNUYTJxTjFLSlAwa052QnEwMFV4VUVZ?=
 =?utf-8?B?aUFXL0xsS290MWlMZUlONFJEQkdybFlpbGVjRHc3ZW5PWUVYZGlzZDhWU2NW?=
 =?utf-8?B?SFFoNDREWVh3c3BPTDVEcVRrd0cxcFFhZ3p6QVVRYmh6WjJaait4SE1sbTBW?=
 =?utf-8?B?UXVJWlM1Z296eEtaMm9OejFPV0pRRjZWQXE2QUJNVjFnbVdLbzV1dWxLN1Jo?=
 =?utf-8?B?TmJKM1RNRHQrZ0lvWEIzV3VNZHhMNWR3eGlRNWdBcXRqek1sdzZhQzJlaW5i?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2008c787-5e0f-4dc4-0f68-08de125ae68c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 17:37:56.8450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTIxMdhywJFrtd/cfKycpAlpM30mQodWjU58Lu5MoCasLRb50ttUEEHtcYOb2s8rgxqQOYAFOxipvrNiD3CChghEEyDCdscnDmQFGdAihN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6944
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



On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> Contiguous PF GGTT VMAs can be scarce after creating VFs.
> Increase the GuC buffer cache size to 4M for PF so that we can fit GuC
> migration data (which currently maxes out at just under 4M) and use the

but the code below still uses 8M

> cache instead of allocating fresh BOs.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 46 ++++++-------------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  3 ++
>  drivers/gpu/drm/xe/xe_guc.c                   | 12 ++++-
>  3 files changed, 28 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 4e26feb9c267f..04fad3126865c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -11,7 +11,7 @@
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_printk.h"
> -#include "xe_guc.h"
> +#include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_migration_data.h"
> @@ -57,73 +57,55 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
>  
>  /* Return: number of state dwords saved or a negative error code on failure */
>  static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
> -				     void *buff, size_t size)
> +				     void *dst, size_t size)
>  {
>  	const int ndwords = size / sizeof(u32);
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_bo *bo;
> +	CLASS(xe_guc_buf, buf)(&guc->buf, ndwords);
>  	int ret;
>  
>  	xe_gt_assert(gt, size % sizeof(u32) == 0);
>  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
>  
> -	bo = xe_bo_create_pin_map_novm(xe, tile,
> -				       ALIGN(size, PAGE_SIZE),
> -				       ttm_bo_type_kernel,
> -				       XE_BO_FLAG_SYSTEM |
> -				       XE_BO_FLAG_GGTT |
> -				       XE_BO_FLAG_GGTT_INVALIDATE, false);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
> +
> +	memset(xe_guc_buf_cpu_ptr(buf), 0, size);

hmm, I didn't find in the GuC spec that this buffer must be zeroed, so why bother?

>  
>  	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_SAVE,
> -					 xe_bo_ggtt_addr(bo), ndwords);
> +					 xe_guc_buf_flush(buf), ndwords);
>  	if (!ret)
>  		ret = -ENODATA;
>  	else if (ret > ndwords)
>  		ret = -EPROTO;
>  	else if (ret > 0)
> -		xe_map_memcpy_from(xe, buff, &bo->vmap, 0, ret * sizeof(u32));
> +		memcpy(dst, xe_guc_buf_sync_read(buf), ret * sizeof(u32));

nit: given this usage, maybe one day we should add optimized variant that copies directly to dst?

	xe_guc_buf_sync_into(buf, dst, size);

>  
> -	xe_bo_unpin_map_no_vm(bo);
>  	return ret;
>  }
>  
>  /* Return: number of state dwords restored or a negative error code on failure */
>  static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
> -					const void *buff, size_t size)
> +					const void *src, size_t size)
>  {
>  	const int ndwords = size / sizeof(u32);
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_bo *bo;
> +	CLASS(xe_guc_buf_from_data, buf)(&guc->buf, src, size);
>  	int ret;
>  
>  	xe_gt_assert(gt, size % sizeof(u32) == 0);
>  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
>  
> -	bo = xe_bo_create_pin_map_novm(xe, tile,
> -				       ALIGN(size, PAGE_SIZE),
> -				       ttm_bo_type_kernel,
> -				       XE_BO_FLAG_SYSTEM |
> -				       XE_BO_FLAG_GGTT |
> -				       XE_BO_FLAG_GGTT_INVALIDATE, false);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> -
> -	xe_map_memcpy_to(xe, &bo->vmap, 0, buff, size);
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
>  
>  	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_RESTORE,
> -					 xe_bo_ggtt_addr(bo), ndwords);
> +					 xe_guc_buf_flush(buf), ndwords);
>  	if (!ret)
>  		ret = -ENODATA;
>  	else if (ret > ndwords)
>  		ret = -EPROTO;
>  
> -	xe_bo_unpin_map_no_vm(bo);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index e2d41750f863c..4f2f2783339c3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -11,6 +11,9 @@
>  struct xe_gt;
>  struct xe_sriov_migration_data;
>  
> +/* TODO: get this information by querying GuC in the future */
> +#define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M

so it's 8M or 4M ?

maybe wrap that into function now

  u32 xe_gt_sriov_pf_migration_guc_data_size(struct xe_gt *gt)
  {
        if (xe_sriov_pf_migration_supported(gt_to_xe))
		return SZ_4M; /* TODO: ... */
	return 0;
  }

> +
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 7c65528859ecb..cd6ab277a7876 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -24,6 +24,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_throttle.h"
> +#include "xe_gt_sriov_pf_migration.h"
>  #include "xe_guc_ads.h"
>  #include "xe_guc_buf.h"
>  #include "xe_guc_capture.h"
> @@ -40,6 +41,7 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf_migration.h"
>  #include "xe_uc.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
> @@ -821,6 +823,14 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>  	return 0;
>  }
>  
> +static u32 guc_buf_cache_size(struct xe_guc *guc)
> +{
> +	if (IS_SRIOV_PF(guc_to_xe(guc)) && xe_sriov_pf_migration_supported(guc_to_xe(guc)))
> +		return XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE;

then
	u32 size = XE_GUC_BUF_CACHE_DEFAULT_SIZE;

	if (IS_SRIOV_PF(guc_to_xe(guc)))
		size += xe_gt_sriov_pf_migration_guc_data_size(guc_to_gt(guc));

	return size;

> +	else
> +		return XE_GUC_BUF_CACHE_DEFAULT_SIZE;
> +}
> +
>  /**
>   * xe_guc_init_post_hwconfig - initialize GuC post hwconfig load
>   * @guc: The GuC object
> @@ -860,7 +870,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_buf_cache_init(&guc->buf, XE_GUC_BUF_CACHE_DEFAULT_SIZE);
> +	ret = xe_guc_buf_cache_init(&guc->buf, guc_buf_cache_size(guc));
>  	if (ret)
>  		return ret;
>  

