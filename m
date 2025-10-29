Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB4BC1D9D5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 23:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D359F10E867;
	Wed, 29 Oct 2025 22:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6TS6pIO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F2810E867;
 Wed, 29 Oct 2025 22:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761778109; x=1793314109;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SQ499/qZJrk9stqoHvGr1dcEqvhEE1uUeHsVq7S9PqA=;
 b=D6TS6pIOvHftmaLpLuOg73LiR1Qktu3l66bWGPmuArzprVK6YmPIaZCJ
 PQ3+KzsunXVjNvDyym8NAbWZVSzywmO/Q4fmSg9usHMScUvpMp6UxA2HU
 L967JOielXjiVJG7VLD6m3NqXBLlIf5yxOEtRJXCLi5WTvFtzBedwGjXo
 2+0JMEB+/x+i6qpcH816bJ0p1BhU8eA9Rbth5oJMm4QQDR5cc2pGv9FVD
 MUfYRTCoNJJ8snCMsdk/j6/7acWareRyUkLnrKMQLzK9I/E+nuEwLJc0z
 o7HeZzLsXuzLQ7I95kokrhKiM6WNsM0nxVt0/67qnHbHQfAoBgwlYM7a0 A==;
X-CSE-ConnectionGUID: m1WM0LNRS2aeXpU/8f65wg==
X-CSE-MsgGUID: OHVXE5ipTuS/zLDC08Oreg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67773710"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="67773710"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 15:48:25 -0700
X-CSE-ConnectionGUID: syenstaJRgmw2rakkUt+8A==
X-CSE-MsgGUID: oBIe+QljRP2QEuXwprrgCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="184986151"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 15:48:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 15:48:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 15:48:24 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 15:48:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKg7PcvbVQfX+ojXlA3I9nLeq5cm+9qsWGL80NioS6R5tkJSdO4CCh1+HjOWJOSe2zSTKOpERGSyisuTHMKozfnjkVEAzmy4DiHrX+Iovrb3JH1HP8DpODq2Lcbq97kwPXqpTqncObIlqk5UtpEQI0z3Cc8Uzobo78Q5s4jH2zYE9ecc65cBn7Wsc2M7Ni7nCeoo12E2ENNI4poUFQOUBmHvir4+89U3NaKeHfZM/mE8x+wAKtNegzFm9D/+JJTCzK79Ekja1lq7YJyB01rD/gCDJ+6JMAR40SPWvIqBtJE0enm+pGkbIbD4NVs5Q99O8RHyDLiKxVpsmmJqMt4ILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tg/HF/9M4nwm2Xs3gWbkOpRQ3tHE8Ktyr8T3CdFZlQ4=;
 b=nLNcbtIclsV4jbnchv3TVp62zvktxTaK5a+iu4S8RUX6IS+6RBmkmKfz0SAcmnGzivkyOQUa5z0/onB8lK7TNJMLjgkCmZfE6NR04P+yeXfa0IgSMsXRHFC/erg9OMz+aGnCQ6SPE8zMSGdKeGS34SMdzYFew2y+pQhJMEZlItOKjzOZQ06mCuKjG/z8Iu5xKEQ67NL3P2mRYbzf9OAEhp67Uzg8R0I7YWAAJW/090yfBO5UG4crESpXttNSh0hLSLW1P0j/0T1T23ijUAgzjJ62L3G3/JD3pJbiswwnKTss6Ek5KqQWr8wlJF+ds/vD8p7qKWUW6cTxGVXUPXBVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8238.namprd11.prod.outlook.com (2603:10b6:610:155::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 22:48:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 22:48:20 +0000
Date: Wed, 29 Oct 2025 15:48:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 04/15] drm/pagemap: Add a drm_pagemap cache and shrinker
Message-ID: <aQKZsTXr61cx+JBX@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: ed520377-b671-4514-1ea1-08de173d41f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?56HIGSqo1EQA9p1X6265mpJHRWdUFz3QcYVVsrRjkaGx/chem2mWBkXCpr?=
 =?iso-8859-1?Q?zwltWAEJ3akVFchIsJe2HmqdF3xvgLiSW4wkLAschCO2piqZtla8bD5HjL?=
 =?iso-8859-1?Q?NQweNlrGrU+Oa4zEEY51TFfgY0oXmSgZOJI1U53umH0HUxTBezbMrHwCDL?=
 =?iso-8859-1?Q?kmWcncvVj4ufh8LbOeDEGQIouepbIGqDTKH/znAd+5Vph/Qxn+Br+YREhh?=
 =?iso-8859-1?Q?JYDKMj9WrAS9Z+cfA+7PBXRl5JyC7dHdcmIPHiYsUZCrPNOQDOFCvgyIn9?=
 =?iso-8859-1?Q?uLUu2Q0W2Xmxp7JWSkFKi1b7wcjSYrwwT8/3A7DeBUj/RQ8wQS0bT3Fq5v?=
 =?iso-8859-1?Q?aeEqMTrFz38eHzIEFf0BYLzXcVkThQAPOnLeU5gIobqaw5+yckcxjzuSsC?=
 =?iso-8859-1?Q?D95usNCwH7txHWSRNkVRpwKm8f9WBb/PZqd8EfXg2sLTnTWZ+7aqcZlSt6?=
 =?iso-8859-1?Q?HY5+QtEpfd2TzDnMOJA2xXlS4ierp2b1DSje6rFQSzD6oq6jJoJ6FeVdXW?=
 =?iso-8859-1?Q?149hKUjAvtP05Hy++f0+edg5Us3pEHAYj/ynv/1OTcwPO2ZJB8MGystM4j?=
 =?iso-8859-1?Q?MhWao3x398us9N72Zl7SonMuyVufrDskfEY5pSUo7nTH3wjbpDm9jPCX++?=
 =?iso-8859-1?Q?gaPGft2oL8tB44+7m4Xc/4jPwhHjIL+MIaHKtj5WTdLA15JR+2xTaJbdiT?=
 =?iso-8859-1?Q?FBmjWP+LXE+29FNm/A2IPiaqb85iJjE75N6snllO33XoNqZ7ioTEUpwyfL?=
 =?iso-8859-1?Q?pLeOH69JsDHEA+IJJH269mPEjEDg7bzuu7LmtUIosdKRD6iYt90hU7qqzO?=
 =?iso-8859-1?Q?Pq3TSvRoFoWmV1FXaFZXKxG/hmyw9wrcbTYIz+wMCgEBVcf695Mdqtc+hQ?=
 =?iso-8859-1?Q?1uMfJc5eP5bMKs+pDh7L3pei5inLAmBZOCJ7rm3vpTlaRPyhjqztFowHP9?=
 =?iso-8859-1?Q?VXO4NiM0cYapZgHyqw/0uqzlbpuOBPwr9CmbmbGO+w1N+HyZ0SFB3S0Puq?=
 =?iso-8859-1?Q?VewRXyWFDISYntA0B1TdBtx324hetwQ6mGEsMPzuYKwUIoXwvfPu+UpMAQ?=
 =?iso-8859-1?Q?S36CDnJOBjwRr2vPM6+jCNlcBH7FSFxK2SqbEyvT6ePKWEAy43mD+C2r9y?=
 =?iso-8859-1?Q?L/zslNmJPHYxNVqkz8QchzPbVEIwms/Dp6zIgE2c6hzZmu67pcQ8Eir0EQ?=
 =?iso-8859-1?Q?EvtODCtKfLC//vMzSrKq4kDAmNO6+7majLWXCQNt9CM/7xHUDZ1LqACp0t?=
 =?iso-8859-1?Q?CFS2f8Yte8AecBiwe/ePmONcrreL5SIqW51l0SNVu3PhbXnlJ2y9oRVorD?=
 =?iso-8859-1?Q?afN69mPG+grwP7fhKHFAJaqkjp6k793Miw4b8Wd6LgbWy87s6DXpozGoDe?=
 =?iso-8859-1?Q?qXKK9ppIjEQV6lt9qRpo+zzuhZu3FCdMB+3mol4NBmxzOAc2pA28EX/wdg?=
 =?iso-8859-1?Q?CKdy7zryVRFXh/6E9U7YVsbfiV9MfK2AnUcuP3gbW1xrhUCchsP64WY8Kv?=
 =?iso-8859-1?Q?oykHEBqnNbTEYRp/CB/re7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Q8qG48PVdFQEySiDOTcQ/Rcou2d8HOGBbsNikPWL160DWr09b47LvNE47y?=
 =?iso-8859-1?Q?ywb9o7X2CyYluM+Fsk0ALTmyuUWGEORQLSb2JXq6fWwsoYp4cPF7vsiv4D?=
 =?iso-8859-1?Q?fZWWEXfnjqVcd3wdhLuDCR4LL/g34N6aBhnfO2l1CTfEewZYLC2e4i2xAl?=
 =?iso-8859-1?Q?g7CApEv4dWvzy1ggtlaHYguLDI4T7i4WW5TEb+JNUvdXCMpr2b8iMyGcUQ?=
 =?iso-8859-1?Q?RrnmF1/fjflmTWwdwssKvdZ0hM39gELaZAwbPtxEJNaGGftO5fj+FVicd7?=
 =?iso-8859-1?Q?ku0zRawOVpGUgDuyDcxbJvqapgjneLyEFZybGVRhyqfBpExOap0YXHB6wz?=
 =?iso-8859-1?Q?LQPfwy+aytoobiHN6bqCbelYaku8nJZVCi8tLHS6/YK/o3Vw3QvyNZBc8m?=
 =?iso-8859-1?Q?WGrH6YXNc2ThnANc6eUGqkYusoz0vguuWBRZqS8B2mzMPZ0/httQJ9a9sN?=
 =?iso-8859-1?Q?UfpmEOwQdvSTWjw8tI23Bym5f4WKefXZ35UFumJH9Lu7Evzpung/hmMKFf?=
 =?iso-8859-1?Q?kuHpe4ax5gCH72FJ675BUfYFOd+7QDnpO/5nrmAC1GEPhh8Etm7XxZTO7F?=
 =?iso-8859-1?Q?yUhroH6Z8S6niPAiL8SD4dkQ/QhpJZn8Aj6xORh9C1noQKgYFNTNHfiIo1?=
 =?iso-8859-1?Q?5R7UZ8RdFW9ELvl5s+/imDlRh6iNnzMtF5m58ksOhzyvxCwcHMylA3y/pl?=
 =?iso-8859-1?Q?vofq+BR4yo2oO1ljywB+T4HqGwRWVVXwqmK7jou1zRaF7V+ReCmh3vgRug?=
 =?iso-8859-1?Q?1VzT0Nmsm2aXZNAJiiiJ/ndZ6ek9mViu0P/kjA1thMFjE//FnfJ3OFerrI?=
 =?iso-8859-1?Q?OU45IDt2LRggavo7jqeGBEM3+GrJ5DwylyfcfhaPfkQrZonMOq/6A+uXu6?=
 =?iso-8859-1?Q?D2vYv+/LPp5RUURAYKHjRaf4desN+767ckCUHtjG1HUSLATFU3g+aRWmji?=
 =?iso-8859-1?Q?UVKLl+3UYpxwtlFcbqeu8hKLg1KRiu2a9IptcEUDUmM+QTZd1jGr7aIOYL?=
 =?iso-8859-1?Q?gxy2EPFa/lcsdmHLQObQSpo3tZbxYiVG9td134mG7atBW7cOsEmlBD9Gsc?=
 =?iso-8859-1?Q?cljftwUjYLVfsx54wBs1tycxAY3UKx4aNLxKB1zHa/BIQEo/WSAclkJGKS?=
 =?iso-8859-1?Q?zVnRFyc4SMDU8cYxWsQvSCau5uziv5oSqH0St4IT8Lhgs8RQ4FbzuUPgBD?=
 =?iso-8859-1?Q?jrH5NdBrlcycqAbi0qPryHklWS/z0ylh6gYL/LwLV1HH6Br4rP9Q0ca4cB?=
 =?iso-8859-1?Q?l7JkvDw0oovlJS2BU9kukGI7jBfSvHzTLtzCmkARe69xgHM1+MJB91X1na?=
 =?iso-8859-1?Q?+Kj7s1gwC02ksEh561l8MaiGOevzlyunEskHlCmNt4ynCILrb4C2ATNU1X?=
 =?iso-8859-1?Q?7nQ4bPs1gTw/FZXOiGkXiNWe0r9ui+RYglR0m3l9NU65GHpDE29Bm9cTmf?=
 =?iso-8859-1?Q?vaWy53qKLIWsLXMh1xEvqWim3Q4db2E7Px0csb7F3NzvKVqK359Ge2Ojwo?=
 =?iso-8859-1?Q?LGwMhnnbKjfTvqEEMFTn+MoFzd+r5G4MJxIJeFleyW5/A/Ej0SGd272Tt1?=
 =?iso-8859-1?Q?h8fLiOwnh1+uH5rRH7TfjSi7oh0pkJd7a6Qyr9j/4P3LASCO5CXmbyQji6?=
 =?iso-8859-1?Q?zQYINlHm1pzIS2CLc9YolZ39U34o2BDPfnGJnkikH+LhBoONs3aMaFWA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed520377-b671-4514-1ea1-08de173d41f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 22:48:20.2845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1X7B4iKthZ228lnbWsxTwLxC24xsypxJW3p4A0Wysv8yTcosKHXHLBjOck2i68S8lJeefCpTjqD5XU15WAObkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8238
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

On Sat, Oct 25, 2025 at 02:04:01PM +0200, Thomas Hellström wrote:
> Pagemaps are costly to set up and tear down, and they consume a lot
> of system memory for the struct pages. Ideally they should be
> created only when needed.
> 
> Add a caching mechanism to allow doing just that: Create the drm_pagemaps
> when needed for migration. Keep them around to avoid destruction and
> re-creation latencies and destroy inactive/unused drm_pagemaps on memory
> pressure using a shrinker.
> 
> Only add the helper functions. They will be hooked up to the xe driver
> in the upcoming patch.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/Makefile           |   3 +-
>  drivers/gpu/drm/drm_pagemap.c      |  79 +++++-
>  drivers/gpu/drm/drm_pagemap_util.c | 426 +++++++++++++++++++++++++++++
>  include/drm/drm_pagemap.h          |  53 +++-
>  include/drm/drm_pagemap_util.h     |  25 ++
>  5 files changed, 569 insertions(+), 17 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
>  create mode 100644 include/drm/drm_pagemap_util.h
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index c2672f369aed..cdca68fd9f23 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -107,7 +107,8 @@ obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
>  
>  drm_gpusvm_helper-y := \
>  	drm_gpusvm.o\
> -	drm_pagemap.o
> +	drm_pagemap.o\
> +	drm_pagemap_util.o
>  obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
>  
>  obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index fb18a80d6a1c..5ca5b2b53bc1 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -8,6 +8,7 @@
>  #include <linux/pagemap.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_pagemap.h>
> +#include <drm/drm_pagemap_util.h>
>  #include <drm/drm_print.h>
>  
>  /**
> @@ -578,7 +579,7 @@ static void drm_pagemap_release(struct kref *ref)
>  	 * pagemap provider drm_device and its module.
>  	 */
>  	dpagemap->dev_hold = NULL;
> -	kfree(dpagemap);
> +	drm_pagemap_shrinker_add(dpagemap);
>  	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
>  	schedule_work(&drm_pagemap_work);
>  	/*
> @@ -628,6 +629,58 @@ drm_pagemap_dev_hold(struct drm_pagemap *dpagemap)
>  	return dev_hold;
>  }
>  
> +/**
> + * drm_pagemap_reinit() - Reinitialize a drm_pagemap
> + * @dpagemap: The drm_pagemap to reinitialize
> + *
> + * Reinitialize a drm_pagemap, for which drm_pagemap_release
> + * has already been called. This interface is intended for the
> + * situation where the driver caches a destroyed drm_pagemap.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int drm_pagemap_reinit(struct drm_pagemap *dpagemap)
> +{
> +	dpagemap->dev_hold = drm_pagemap_dev_hold(dpagemap);
> +	if (IS_ERR(dpagemap->dev_hold))
> +		return PTR_ERR(dpagemap->dev_hold);
> +
> +	kref_init(&dpagemap->ref);
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_pagemap_reinit);
> +
> +/**
> + * drm_pagemap_init() - Initialize a pre-allocated drm_pagemap
> + * @dpagemap: The drm_pagemap to initialize.
> + * @pagemap: The associated dev_pagemap providing the device
> + * private pages.
> + * @drm: The drm device. The drm_pagemap holds a reference on the
> + * drm_device and the module owning the drm_device until
> + * drm_pagemap_release(). This facilitates drm_pagemap exporting.
> + * @ops: The drm_pagemap ops.
> + *
> + * Initialize and take an initial reference on a drm_pagemap.
> + * After successful return, use drm_pagemap_put() to destroy.
> + *
> + ** Return: 0 on success, negative error code on error.
> + */
> +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> +		     struct dev_pagemap *pagemap,
> +		     struct drm_device *drm,
> +		     const struct drm_pagemap_ops *ops)
> +{
> +	kref_init(&dpagemap->ref);

The above kref init can be dropped as drm_pagemap_reinit does this.

Matt

> +	dpagemap->ops = ops;
> +	dpagemap->pagemap = pagemap;
> +	dpagemap->drm = drm;
> +	dpagemap->cache = NULL;
> +	INIT_LIST_HEAD(&dpagemap->shrink_link);
> +
> +	return drm_pagemap_reinit(dpagemap);
> +}
> +EXPORT_SYMBOL(drm_pagemap_init);
> +
>  /**
>   * drm_pagemap_create() - Create a struct drm_pagemap.
>   * @drm: Pointer to a struct drm_device providing the device-private memory.
> @@ -645,22 +698,14 @@ drm_pagemap_create(struct drm_device *drm,
>  		   const struct drm_pagemap_ops *ops)
>  {
>  	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
> -	struct drm_pagemap_dev_hold *dev_hold;
> +	int err;
>  
>  	if (!dpagemap)
>  		return ERR_PTR(-ENOMEM);
>  
> -	kref_init(&dpagemap->ref);
> -	dpagemap->drm = drm;
> -	dpagemap->ops = ops;
> -	dpagemap->pagemap = pagemap;
> -
> -	dev_hold = drm_pagemap_dev_hold(dpagemap);
> -	if (IS_ERR(dev_hold)) {
> -		kfree(dpagemap);
> -		return ERR_CAST(dev_hold);
> -	}
> -	dpagemap->dev_hold = dev_hold;
> +	err = drm_pagemap_init(dpagemap, pagemap, drm, ops);
> +	if (err)
> +		return ERR_PTR(err);
>  
>  	return dpagemap;
>  }
> @@ -1023,6 +1068,14 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  }
>  EXPORT_SYMBOL(drm_pagemap_populate_mm);
>  
> +void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim)
> +{
> +	if (dpagemap->ops->destroy)
> +		dpagemap->ops->destroy(dpagemap, is_atomic_or_reclaim);
> +	else
> +		kfree(dpagemap);
> +}
> +
>  static void drm_pagemap_exit(void)
>  {
>  	flush_work(&drm_pagemap_work);
> diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
> new file mode 100644
> index 000000000000..e1a1d6bf25f4
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_pagemap_util.c
> @@ -0,0 +1,426 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_pagemap.h>
> +#include <drm/drm_pagemap_util.h>
> +#include <drm/drm_print.h>
> +
> +/**
> + * struct drm_pagemap_cache - Lookup structure for pagemaps
> + *
> + * Structure to keep track of active (refcount > 1) and inactive
> + * (refcount == 0) pagemaps. Inactive pagemaps can be made active
> + * again by waiting for the @queued completion (indicating that the
> + * pagemap has been put on the @shrinker's list of shrinkable
> + * pagemaps, and then successfully removing it from @shrinker's
> + * list. The latter may fail if the shrinker is already in the
> + * process of freeing the pagemap. A struct drm_pagemap_cache can
> + * hold a single struct drm_pagemap.
> + */
> +struct drm_pagemap_cache {
> +	/** @lookup_mutex: Mutex making the lookup process atomic */
> +	struct mutex lookup_mutex;
> +	/** @lock: Lock protecting the @dpagemap pointer */
> +	spinlock_t lock;
> +	/** @shrinker: Pointer to the shrinker used for this cache. Immutable. */
> +	struct drm_pagemap_shrinker *shrinker;
> +	/** @dpagemap: Non-refcounted pointer to the drm_pagemap */
> +	struct drm_pagemap *dpagemap;
> +	/**
> +	 * @queued: Signals when an inactive drm_pagemap has been put on
> +	 * @shrinker's list.
> +	 */
> +	struct completion queued;
> +};
> +
> +/**
> + * struct drm_pagemap_shrinker - Shrinker to remove unused pagemaps
> + */
> +struct drm_pagemap_shrinker {
> +	/** @drm: Pointer to the drm device. */
> +	struct drm_device *drm;
> +	/** @lock: Spinlock to protect the @dpagemaps list. */
> +	spinlock_t lock;
> +	/** @dpagemaps: List of unused dpagemaps. */
> +	struct list_head dpagemaps;
> +	/** @num_dpagemaps: Number of unused dpagemaps in @dpagemaps. */
> +	atomic_t num_dpagemaps;
> +	/** @shrink: Pointer to the struct shrinker. */
> +	struct shrinker *shrink;
> +};
> +
> +static bool drm_pagemap_shrinker_cancel(struct drm_pagemap *dpagemap);
> +
> +static void drm_pagemap_cache_fini(void *arg)
> +{
> +	struct drm_pagemap_cache *cache = arg;
> +	struct drm_pagemap *dpagemap;
> +
> +	drm_dbg(cache->shrinker->drm, "Destroying dpagemap cache.\n");
> +	spin_lock(&cache->lock);
> +	dpagemap = cache->dpagemap;
> +	if (!dpagemap) {
> +		spin_unlock(&cache->lock);
> +		goto out;
> +	}
> +
> +	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +		drm_pagemap_destroy(dpagemap, false);
> +	}
> +
> +out:
> +	mutex_destroy(&cache->lookup_mutex);
> +	kfree(cache);
> +}
> +
> +/**
> + * drm_pagemap_cache_create_devm() - Create a drm_pagemap_cache
> + * @shrinker: Pointer to a struct drm_pagemap_shrinker.
> + *
> + * Create a device-managed drm_pagemap cache. The cache is automatically
> + * destroyed on struct device removal, at which point any *inactive*
> + * drm_pagemap's are destroyed.
> + *
> + * Return: Pointer to a struct drm_pagemap_cache on success. Error pointer
> + * on failure.
> + */
> +struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct drm_pagemap_shrinker *shrinker)
> +{
> +	struct drm_pagemap_cache *cache = kzalloc(sizeof(*cache), GFP_KERNEL);
> +	int err;
> +
> +	if (!cache)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mutex_init(&cache->lookup_mutex);
> +	spin_lock_init(&cache->lock);
> +	cache->shrinker = shrinker;
> +	init_completion(&cache->queued);
> +	err = devm_add_action_or_reset(shrinker->drm->dev, drm_pagemap_cache_fini, cache);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return cache;
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_create_devm);
> +
> +/**
> + * DOC: Cache lookup
> + *
> + * Cache lookup should be done under a locked mutex, so that a
> + * failed drm_pagemap_get_from_cache() and a following
> + * drm_pagemap_cache_setpagemap() are carried out as an atomic
> + * operation WRT other lookups. Otherwise, racing lookups may
> + * unnecessarily concurrently create pagemaps to fulfill a
> + * failed lookup. The API provides two functions to perform this lock,
> + * drm_pagemap_lock_lookup() and drm_pagemap_unlock_lookup() and they
> + * should be used in the following way:
> + *
> + * .. code-block:: c
> + *
> + *		drm_pagemap_lock_lookup(cache);
> + *		dpagemap = drm_pagemap_get_from_cache(cache);
> + *		if (dpagemap)
> + *			goto out_unlock;
> + *
> + *		dpagemap = driver_create_new_dpagemap();
> + *		if (!IS_ERR(dpagemap))
> + *			drm_pagemap_cache_set_pagemap(cache, dpagemap);
> + *
> + *     out_unlock:
> + *		drm_pagemap_unlock_lookup(cache);
> + */
> +
> +/**
> + * drm_pagemap_cache_lock_lookup() Lock a drm_pagemap_cache for lookup
> + * @cache: The drm_pagemap_cache to lock.
> + *
> + * Return: %-EINTR if interrupted while blocking. %0 otherwise.
> + */
> +int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache)
> +{
> +	return mutex_lock_interruptible(&cache->lookup_mutex);
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_lock_lookup);
> +
> +/**
> + * drm_pagemap_cache_unlock_lookup() Unlock a drm_pagemap_cache after lookup
> + * @cache: The drm_pagemap_cache to unlock.
> + */
> +void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache *cache)
> +{
> +	mutex_unlock(&cache->lookup_mutex);
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_unlock_lookup);
> +
> +/**
> + * drm_pagemap_get_from_cache() -  Lookup of drm_pagemaps.
> + * @cache: The cache used for lookup.
> + *
> + * If an active pagemap is present in the cache, it is immediately returned.
> + * If an inactive pagemap is present, it's removed from the shrinker list and
> + * an attempt is made to make it active.
> + * If no pagemap present or the attempt to make it active failed, %NULL is returned
> + * to indicate to the caller to create a new drm_pagemap and insert it into
> + * the cache.
> + *
> + * Return: A reference-counted pointer to a drm_pagemap if successful. An error
> + * pointer if an error occurred, or %NULL if no drm_pagemap was found and
> + * the caller should insert a new one.
> + */
> +struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache)
> +{
> +	struct drm_pagemap *dpagemap;
> +	int err;
> +
> +	lockdep_assert_held(&cache->lookup_mutex);
> +retry:
> +	spin_lock(&cache->lock);
> +	dpagemap = cache->dpagemap;
> +	if (drm_pagemap_get_unless_zero(dpagemap)) {
> +		spin_unlock(&cache->lock);
> +		return dpagemap;
> +	}
> +
> +	if (!dpagemap) {
> +		spin_unlock(&cache->lock);
> +		return NULL;
> +	}
> +
> +	if (!try_wait_for_completion(&cache->queued)) {
> +		spin_unlock(&cache->lock);
> +		err = wait_for_completion_interruptible(&cache->queued);
> +		if (err)
> +			return ERR_PTR(err);
> +		goto retry;
> +	}
> +
> +	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +		err = drm_pagemap_reinit(dpagemap);
> +		if (err) {
> +			drm_pagemap_destroy(dpagemap, false);
> +			return ERR_PTR(err);
> +		}
> +		drm_pagemap_cache_set_pagemap(cache, dpagemap);
> +	} else {
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +		dpagemap = NULL;
> +	}
> +
> +	return dpagemap;
> +}
> +EXPORT_SYMBOL(drm_pagemap_get_from_cache);
> +
> +/**
> + * drm_pagemap_cache_set_pagemap() - Assign a drm_pagemap to a drm_pagemap_cache
> + * @cache: The cache to assign the drm_pagemap to.
> + * @dpagemap: The drm_pagemap to assign.
> + *
> + * The function must be called to populate a drm_pagemap_cache only
> + * after a call to drm_pagemap_get_from_cache() returns NULL.
> + */
> +void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap)
> +{
> +	struct drm_device *drm = dpagemap->drm;
> +
> +	lockdep_assert_held(&cache->lookup_mutex);
> +	spin_lock(&cache->lock);
> +	dpagemap->cache = cache;
> +	swap(cache->dpagemap, dpagemap);
> +	reinit_completion(&cache->queued);
> +	spin_unlock(&cache->lock);
> +	drm_WARN_ON(drm, !!dpagemap);
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_set_pagemap);
> +
> +/**
> + * drm_pagemap_get_from_cache_if_active() - Quick lookup of active drm_pagemaps
> + * @cache: The cache to lookup from.
> + *
> + * Function that should be used to lookup a drm_pagemap that is already active.
> + * (refcount > 0).
> + *
> + * Return: A pointer to the cache's drm_pagemap if it's active; %NULL otherwise.
> + */
> +struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache)
> +{
> +	struct drm_pagemap *dpagemap;
> +
> +	spin_lock(&cache->lock);
> +	dpagemap = drm_pagemap_get_unless_zero(cache->dpagemap);
> +	spin_unlock(&cache->lock);
> +
> +	return dpagemap;
> +}
> +EXPORT_SYMBOL(drm_pagemap_get_from_cache_if_active);
> +
> +static bool drm_pagemap_shrinker_cancel(struct drm_pagemap *dpagemap)
> +{
> +	struct drm_pagemap_cache *cache = dpagemap->cache;
> +	struct drm_pagemap_shrinker *shrinker = cache->shrinker;
> +
> +	spin_lock(&shrinker->lock);
> +	if (list_empty(&dpagemap->shrink_link)) {
> +		spin_unlock(&shrinker->lock);
> +		return false;
> +	}
> +
> +	list_del_init(&dpagemap->shrink_link);
> +	atomic_dec(&shrinker->num_dpagemaps);
> +	spin_unlock(&shrinker->lock);
> +	return true;
> +}
> +
> +/**
> + * drm_pagemap_shrinker_add() - Add a drm_pagemap to the shrinker list or destroy
> + * @dpagemap: The drm_pagemap.
> + *
> + * If @dpagemap is associated with a &struct drm_pagemap_cache AND the
> + * struct device backing the drm device is still alive, add @dpagemap to
> + * the &struct drm_pagemap_shrinker list of shrinkable drm_pagemaps.
> + *
> + * Otherwise destroy the pagemap directly using drm_pagemap_destroy().
> + *
> + * This is an internal function which is not intended to be exposed to drivers.
> + */
> +void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap)
> +{
> +	struct drm_pagemap_cache *cache;
> +	struct drm_pagemap_shrinker *shrinker;
> +	int idx;
> +
> +	/*
> +	 * The pagemap cache and shrinker are disabled at
> +	 * pci device remove time. After that, dpagemaps
> +	 * are freed directly.
> +	 */
> +	if (!drm_dev_enter(dpagemap->drm, &idx))
> +		goto out_no_cache;
> +
> +	cache = dpagemap->cache;
> +	if (!cache) {
> +		drm_dev_exit(idx);
> +		goto out_no_cache;
> +	}
> +
> +	shrinker = cache->shrinker;
> +	spin_lock(&shrinker->lock);
> +	list_add_tail(&dpagemap->shrink_link, &shrinker->dpagemaps);
> +	atomic_inc(&shrinker->num_dpagemaps);
> +	spin_unlock(&shrinker->lock);
> +	complete_all(&cache->queued);
> +	drm_dev_exit(idx);
> +	return;
> +
> +out_no_cache:
> +	drm_pagemap_destroy(dpagemap, true);
> +}
> +
> +static unsigned long
> +drm_pagemap_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct drm_pagemap_shrinker *shrinker = shrink->private_data;
> +	unsigned long count = atomic_read(&shrinker->num_dpagemaps);
> +
> +	return count ? : SHRINK_EMPTY;
> +}
> +
> +static unsigned long
> +drm_pagemap_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct drm_pagemap_shrinker *shrinker = shrink->private_data;
> +	struct drm_pagemap *dpagemap;
> +	struct drm_pagemap_cache *cache;
> +	unsigned long nr_freed = 0;
> +
> +	sc->nr_scanned = 0;
> +	spin_lock(&shrinker->lock);
> +	do {
> +		dpagemap = list_first_entry_or_null(&shrinker->dpagemaps, typeof(*dpagemap),
> +						    shrink_link);
> +		if (!dpagemap)
> +			break;
> +
> +		atomic_dec(&shrinker->num_dpagemaps);
> +		list_del_init(&dpagemap->shrink_link);
> +		spin_unlock(&shrinker->lock);
> +
> +		sc->nr_scanned++;
> +		nr_freed++;
> +
> +		cache = dpagemap->cache;
> +		spin_lock(&cache->lock);
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +
> +		drm_dbg(dpagemap->drm, "Shrinking dpagemap %p.\n", dpagemap);
> +		drm_pagemap_destroy(dpagemap, true);
> +		spin_lock(&shrinker->lock);
> +	} while (sc->nr_scanned < sc->nr_to_scan);
> +	spin_unlock(&shrinker->lock);
> +
> +	return sc->nr_scanned ? nr_freed : SHRINK_STOP;
> +}
> +
> +static void drm_pagemap_shrinker_fini(void *arg)
> +{
> +	struct drm_pagemap_shrinker *shrinker = arg;
> +
> +	drm_dbg(shrinker->drm, "Destroying dpagemap shrinker.\n");
> +	drm_WARN_ON(shrinker->drm, !!atomic_read(&shrinker->num_dpagemaps));
> +	shrinker_free(shrinker->shrink);
> +	kfree(shrinker);
> +}
> +
> +/**
> + * drm_pagemap_shrinker_create_devm() - Create and register a pagemap shrinker
> + * @drm: The drm device
> + *
> + * Create and register a pagemap shrinker that shrinks unused pagemaps
> + * and thereby reduces memory footprint.
> + * The shrinker is drm_device managed and unregisters itself when
> + * the drm device is removed.
> + *
> + * Return: %0 on success, negative error code on failure.
> + */
> +struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm)
> +{
> +	struct drm_pagemap_shrinker *shrinker;
> +	struct shrinker *shrink;
> +	int err;
> +
> +	shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
> +	if (!shrinker)
> +		return ERR_PTR(-ENOMEM);
> +
> +	shrink = shrinker_alloc(0, "drm-drm_pagemap:%s", drm->unique);
> +	if (!shrink) {
> +		kfree(shrinker);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	spin_lock_init(&shrinker->lock);
> +	INIT_LIST_HEAD(&shrinker->dpagemaps);
> +	shrinker->drm = drm;
> +	shrinker->shrink = shrink;
> +	shrink->count_objects = drm_pagemap_shrinker_count;
> +	shrink->scan_objects = drm_pagemap_shrinker_scan;
> +	shrink->private_data = shrinker;
> +	shrinker_register(shrink);
> +
> +	err = devm_add_action_or_reset(drm->dev, drm_pagemap_shrinker_fini, shrinker);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return shrinker;
> +}
> +EXPORT_SYMBOL(drm_pagemap_shrinker_create_devm);
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 5cfe54331ba7..4b9af5e785c6 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -9,6 +9,7 @@
>  #define NR_PAGES(order) (1U << (order))
>  
>  struct drm_pagemap;
> +struct drm_pagemap_cache;
>  struct drm_pagemap_dev_hold;
>  struct drm_pagemap_zdd;
>  struct device;
> @@ -124,6 +125,25 @@ struct drm_pagemap_ops {
>  			   unsigned long start, unsigned long end,
>  			   struct mm_struct *mm,
>  			   unsigned long timeslice_ms);
> +	/**
> +	 * @destroy: Destroy the drm_pagemap and associated resources.
> +	 * @dpagemap: The drm_pagemap to destroy.
> +	 * @is_atomic_or_reclaim: The function may be called from
> +	 * atomic- or reclaim context.
> +	 *
> +	 * The implementation should take care not to attempt to
> +	 * destroy resources that may already have been destroyed
> +	 * using devm_ callbacks, since this function may be called
> +	 * after the underlying struct device has been unbound.
> +	 * If the implementation defers the execution to a work item
> +	 * to avoid locking issues, then it must make sure the work
> +	 * items are flushed before module exit. If the destroy call
> +	 * happens after the provider's pci_remove() callback has
> +	 * been executed, a module reference and drm device reference is
> +	 * held across the destroy callback.
> +	 */
> +	void (*destroy)(struct drm_pagemap *dpagemap,
> +			bool is_atomic_or_reclaim);
>  };
>  
>  /**
> @@ -135,6 +155,10 @@ struct drm_pagemap_ops {
>   * @pagemap: Pointer to the underlying dev_pagemap.
>   * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
>   * device referencing.
> + * @cache: Back-pointer to the &struct drm_pagemap_cache used for this
> + * &struct drm_pagemap. May be NULL if no cache is used.
> + * @shrink_link: Link into the shrinker's list of drm_pagemaps. Only
> + * used if also using a pagemap cache.
>   */
>  struct drm_pagemap {
>  	const struct drm_pagemap_ops *ops;
> @@ -142,6 +166,8 @@ struct drm_pagemap {
>  	struct drm_device *drm;
>  	struct dev_pagemap *pagemap;
>  	struct drm_pagemap_dev_hold *dev_hold;
> +	struct drm_pagemap_cache *cache;
> +	struct list_head shrink_link;
>  };
>  
>  struct drm_pagemap_devmem;
> @@ -210,6 +236,11 @@ struct drm_pagemap_devmem_ops {
>  			   unsigned long npages);
>  };
>  
> +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> +		     struct dev_pagemap *pagemap,
> +		     struct drm_device *drm,
> +		     const struct drm_pagemap_ops *ops);
> +
>  struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
>  				       struct dev_pagemap *pagemap,
>  				       const struct drm_pagemap_ops *ops);
> @@ -228,9 +259,9 @@ static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
>  
>  /**
>   * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
> - * @dpagemap: Pointer to the struct drm_pagemap.
> + * @dpagemap: Pointer to the struct drm_pagemap, or NULL.
>   *
> - * Return: Pointer to the struct drm_pagemap.
> + * Return: Pointer to the struct drm_pagemap, or NULL.
>   */
>  static inline struct drm_pagemap *
>  drm_pagemap_get(struct drm_pagemap *dpagemap)
> @@ -241,6 +272,20 @@ drm_pagemap_get(struct drm_pagemap *dpagemap)
>  	return dpagemap;
>  }
>  
> +/**
> + * drm_pagemap_get_unless_zero() - Obtain a reference on a struct drm_pagemap
> + * unless the current reference count is zero.
> + * @dpagemap: Pointer to the drm_pagemap or NULL.
> + *
> + * Return: A pointer to @dpagemap if the reference count was successfully
> + * incremented. NULL if @dpagemap was NULL, or its refcount was 0.
> + */
> +static inline struct drm_pagemap * __must_check
> +drm_pagemap_get_unless_zero(struct drm_pagemap *dpagemap)
> +{
> +	return (dpagemap && kref_get_unless_zero(&dpagemap->ref)) ? dpagemap : NULL;
> +}
> +
>  /**
>   * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
>   *
> @@ -284,5 +329,7 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  			    struct mm_struct *mm,
>  			    unsigned long timeslice_ms);
>  
> -#endif
> +void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim);
>  
> +int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
> +#endif
> diff --git a/include/drm/drm_pagemap_util.h b/include/drm/drm_pagemap_util.h
> new file mode 100644
> index 000000000000..292244d429ee
> --- /dev/null
> +++ b/include/drm/drm_pagemap_util.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +#ifndef _DRM_PAGEMAP_UTIL_H_
> +#define _DRM_PAGEMAP_UTIL_H_
> +
> +struct drm_device;
> +struct drm_pagemap;
> +struct drm_pagemap_cache;
> +struct drm_pagemap_shrinker;
> +
> +void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap);
> +
> +int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache);
> +
> +void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache *cache);
> +
> +struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm);
> +
> +struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct drm_pagemap_shrinker *shrinker);
> +
> +struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache);
> +
> +void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap);
> +
> +struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache);
> +#endif
> -- 
> 2.51.0
> 
