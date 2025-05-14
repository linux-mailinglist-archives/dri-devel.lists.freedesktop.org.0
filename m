Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A895AB6A15
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 13:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737B310E3B9;
	Wed, 14 May 2025 11:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehz8YxW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6010E10E2AA;
 Wed, 14 May 2025 11:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747222399; x=1778758399;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zzXLz4QgrpoV3JCgHnuQ3kmkcMepPPL64N7sndvp+fg=;
 b=ehz8YxW2aAXuJ0+Y2gQyPGBdTsPrlavxhbMLXUYLCiVDlh1+1NxfZoFj
 uHtlob9jeJFE07qvmPir22XNCyvn7Y0CvTx4Ig83pVc9Ot2TRtIaG58C/
 4o6DFVcAL31dyMnyrAWQBKr1vCZSsYYhPAJaD/KRauTOzyBuZ8BczZbRc
 AD1tsNEj/uCc2E1CzF5IDFaCVbuM6Ty556WF1PYhm/jvmBFdrRyWXgfB8
 V+ErfQB0pOegra+xjCSCsm4dcXWJWaqve6he7MIXfPl0dZyFYMHCe5moU
 VGrXRYPYwvBQwJL7e5VVGu0AmbCR5MOpoY5Br83lC8iAs+sexqCzcb358 w==;
X-CSE-ConnectionGUID: dFBg46KaTZy1AB75M+xBGA==
X-CSE-MsgGUID: Pkx0HIxPSaed/rAdfLUdIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="59746248"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="59746248"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:33:16 -0700
X-CSE-ConnectionGUID: +Q3uLaPuQNaVDGoO89bRmg==
X-CSE-MsgGUID: jQr+GlbbQymlOWKx3Dic5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="138507704"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:33:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 04:33:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 04:33:16 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 04:33:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kt4lskFqWGQMXnKwzXEPYBjR4rj2mOGPrONujkEVFzDhMsP5MoY4DcBAiKZkeBTupDX/oUT000xEmWuRWHVrPMac4BHj/zf+PfMzfWzseQfmwJ/btBBnBxPrHdJAtaj7nVHAD97B1bikDc0Kc8paCBO+7GuKE76UIOyBU31eF9HL3y74CKil8ICbneW+3+dkYgKFIm/2YMcY1NdPCY3gVzBVoHOVAQ5zLWqDRGNTLyNWEzAsMHjfJVokY0pQkIOK0lkpZiLrgR7604ip1zbe0JKqKyNUQuIjvwPbUbLFLWAjo9J1/DJjnokdWYJKSHC6Eo0K7z5K8jpv6J9w0QO4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4SJa+n9dtiQWLfCXAlhcZFJ507bHF6pdmPf7qNLI0A=;
 b=eKr+PM5q+clqDzrgvjkde0AWqQhIjOory8R/QTu1QalN+2aIGbKvR8/lMb9WJ4GApgckvnAshZ9+YzNPQP/GsRAwniXLJ7GMOn1NIQRgisvqSi76fKo0HjQDsZ5eJboieNPUHSTYNm1vA5yReK8TZfo1m7yiqQqqXTjjIsTwNZAEmjSaT7HE1awLkhicjsYVSZKvqUImXEZDEuHFou8rwJg/WoHCbLb85JRdFbshqPAjBUs7y93NmRoZSdXUEceScLIw7bqIkrgoZpkVT9dqgtID/LbrnPgIPyEOZJiebL+6yOie1YabUyrbaKyS7KkdBWv0DtLQWJR23Wg3DgpfTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB4915.namprd11.prod.outlook.com (2603:10b6:303:93::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 11:33:12 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 11:33:12 +0000
Message-ID: <f058def6-32d5-4690-98ca-03f4d7dfef0f@intel.com>
Date: Wed, 14 May 2025 17:03:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Revert "drm/i915/dp: Reject HBR3 when sink doesn't
 support TPS4"
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <dri-devel@lists.freedesktop.org>
References: <20250514084356.1558407-1-ankit.k.nautiyal@intel.com>
 <20250514084356.1558407-2-ankit.k.nautiyal@intel.com>
 <87v7q3h5nb.fsf@intel.com> <87r00rh3kp.fsf@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <87r00rh3kp.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::19) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB4915:EE_
X-MS-Office365-Filtering-Correlation-Id: 730006f1-cd7f-40a2-d698-08dd92db1ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0xUWjJCc21SVm9XV3B2c1IwYUhCcCtRNVJySE01dTlaNW9BZDlueWN3Y1FJ?=
 =?utf-8?B?Y0ljc1pySFcwZEh0OExEMmRLTGF2RzlXWVdheHliaTB5NU9tQVhTTE4vbzZ2?=
 =?utf-8?B?Y1NxUDhxVnFwRXRnK2FqTG1CV3ROY2Ztb1pWb21yN2ZPNjlvbG1jTHRWcFRC?=
 =?utf-8?B?c1NFdllWRzNLMWkvTVoxR1pOVUFQWHRHazIxWERnUS9wSkNIWS9XZ2EySFpl?=
 =?utf-8?B?aGRpbnVBR0l5VnVVdEVjV29DeXNKYnJWN3FtWXljYTd6UW1LdHdEdk82MHAw?=
 =?utf-8?B?OWZISWZGV2hNZmVwNHFqSWs5WFZBNUlqaVVlYk1palpCUEZaMFhtSlNYOUQy?=
 =?utf-8?B?ZEZpMkc2ZElra0ROQVpPUEpkbVJneUdWTldMUkp1V1dWY2VUa3Y5T2FLUkVa?=
 =?utf-8?B?UHpTWXkySEJZTTd6NTRkVjk2YWQ3b3FXMFZNWDlLeldXM3I3ZG9pcVFTOFJw?=
 =?utf-8?B?TTdyK3gzUWtaTkVIc2tRUE52QTFnUlVJbzRRd1l2ekNTNkc3aDJVWDZpNTFi?=
 =?utf-8?B?SnlQV2xZdGxNWGduQSs2RVdta1JXci8rUGhlMWlRZTNDaSsyUUY5U21XTDRG?=
 =?utf-8?B?UEU1MkErQ2EzVGE5QXM3OUtwa05kOXRMMkgraGZHQlhDeTRGcXdkOTM4LzZk?=
 =?utf-8?B?OWZ0T2d0Q0tNSHpENkhXT2lvN0NaQTZaM1l5bS9ST0xPcjVTb242ZkhJQXE3?=
 =?utf-8?B?UVZEUW5ZaGNoVGRPaHAvQ1YxeGFVSUF0VXcwVTlndjQwdWNoUVBBUGh2NnJw?=
 =?utf-8?B?cFk0bGZ1eDVYZUNHU2hyVVQyR0dTd21hMG9qK1k5bWNzM1I1NFdvNWJTdGxp?=
 =?utf-8?B?UWZ5V2tkZ3FpY0JYWTBXbjh1cy9NVzB0OUVBaTVkZ0xaOXp2NGdEUEJaUjJt?=
 =?utf-8?B?UGNrVGNDMkE1Nk0wRVJxZmM3OUhicVRaeU1uaVJpZGtjWFdFTzBGWDFjOWdQ?=
 =?utf-8?B?QzVYcnNtNVBmZHFqRm5NSEtrWkZORXVWSzc2d1lmNndJZWFIdlNCaDR6M0RB?=
 =?utf-8?B?bWYvdW5RSWZqcjREVXd6Z2JMcjdsMW9nMlcrYTBETHY2RmE5cDRMQ3l0a0ZU?=
 =?utf-8?B?NnFSMm9Kb0NISnFlNENwQVRkQnJzWjN6elhUREFBekR1bGZ6REp6OEl2SWQx?=
 =?utf-8?B?NUVITHVqMnlwVzAzSCtMMlhwQTRPTzloR084ZnNmK3ExVEd5Mzk3RFNZTXBT?=
 =?utf-8?B?anpwd2hmeWZHZTc3Q0dEajYwa3JQbm54empZNytmamUzdUJvNkgyZDBiUmdM?=
 =?utf-8?B?K1JZWkJ5b2Y2Qm16NmdxSjN6STVXSVIzNEMxMXh4Q0hFckUyZFJpdTNOZFBs?=
 =?utf-8?B?azlpVG11Nm5XMjFUZ2U1REl4RG9YNkRnL0FZN29HSDl5eG1oZjBGV1BXbXV3?=
 =?utf-8?B?T2xKRU5Dc1NOOGtmTWlqR0JWd21LRkF5eG10Wnp5a0VsK2N1cGZKMWk2VGFp?=
 =?utf-8?B?NVBGOVpUR2hTUTRpQWVicHIzQytwL3N0NWZwZ0EvaUZ4M3VteTU3VVNFOU8v?=
 =?utf-8?B?K2hUaksxRjRGaW4vdDlHM3lMMWJOdDVyczB3dXFJRFNUSndQM3RBanowWG1y?=
 =?utf-8?B?aFoyZ01qMVRNNE1CM0JKU3U1Q3BOQmVURUJlV1VQTjQxSmlaWDJHaC95Ujlt?=
 =?utf-8?B?TVc5ZGh0M1BldXQ5UGFHL0tHdzYza1ZXOGM1UmlaSHVlSUxqY1hhT0sxVVY5?=
 =?utf-8?B?b0h1ZSt5Q1lvZGg5Z2V2NHFJOXZZNmt5YjdleWVQRlQ0Z005VkNkY3ByclFM?=
 =?utf-8?B?MmpaZ1VvTlFadHFBK0NKSnZpNGJ3ZlJIc29MWHBBQXI5WS9ZMnEyVVZ4WldO?=
 =?utf-8?Q?JgbXtDtpIUTUZWjfKFoPRtG1512sTfB1HWXoA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b29mNnhkVjhPa0Rpa3RjWW41UkdZVmx2T0IxNTZ3K3g3YmVDTW5IMzB5OGdn?=
 =?utf-8?B?MkNJQityTXZidEJEOERoMWlxZTBkRnhOUUIvVTJPMmRaTzZQYmpScHZ4QnJa?=
 =?utf-8?B?Y1Z6bmdhMnFTTTEwQWFIL3lvUHpZOURYZkhxcis5bXVsL0FSZTdLR0FWd3pv?=
 =?utf-8?B?ZUQ2eU5WR2tYc1hPZTRuZ3dRZlRaNTIxTmpDMHkzcFFzZWpUd1VMOVdvaUZl?=
 =?utf-8?B?ZjhjQnN3Y2UwYUhkSHVpbXRhNk9WdG41UlFoakZyQXltV3RNSmRPOE5RbG5Y?=
 =?utf-8?B?WHl4QUx2MFhYZVh3RmQzWllLdU9tbm9lSzVFMElSVkxaQzljSUlkekxvTzVo?=
 =?utf-8?B?dzdOMUFacm1pSW16S3pIVG8xbHBoUE43S28zNHg3ZUZ5NC9UVXh0TFYrc1VP?=
 =?utf-8?B?Sm1LVXlRNFhzNXk1akgyWHlRM1kydllwY3lEcVZVVEFzYitsRTF5Y1haN3dh?=
 =?utf-8?B?WjdvcGJpTnJqOTRnMElTeEpUVXN3WUN6OXhOUUlOblpmUHBlTW05SVhKN2lL?=
 =?utf-8?B?V3QwRVI3Q0FMQmJQMUpDcjNkK21sRFBCTWRWTEFXOUhraldUQU1KRkVlRTZo?=
 =?utf-8?B?cElLeFo4MlNlcWVxM1V0OS9GL1JhSWZHQ3dBMG1yMmtYdVpoU3A5ZndiQzBU?=
 =?utf-8?B?QmZoVC83WHlSV3JoQ0tjMUxqNVc4TVhDYWozN3JJb1FNTlVHeXZhb2QwbHdB?=
 =?utf-8?B?ZHR5N1ZTSzB5azAydVJKN0tCODVVcGZlTHhoYUZTOWFZS1JBNG9GVitnSWJW?=
 =?utf-8?B?eGVQZm94V0NGcFJWSjZxcnl4WnJoZEdta3dmbDBmZkNqcmF2ckJTK2diTWNF?=
 =?utf-8?B?UTBoL3kvVFdzMmpHWTgyd0lscERZeHc4QkNKMExGdmMvMlBmUEladVJuWWpM?=
 =?utf-8?B?blF4V2s1eFYyWERNdmdUK0E4UHJvVEFuYjJQSGNEYXR0V082OXBidk1WaVNr?=
 =?utf-8?B?VUoxUFFvdFFpUk1IK1lpcUZjeFhlZ0FQQ0Vna3ZnUmZteUZpRkxIREZycnlu?=
 =?utf-8?B?emExYUkxNndDZGV2YWlyWkNhYTJzZGlhbzl0TkNscWZkWlhDNlkybTd1aDR0?=
 =?utf-8?B?ZzJXTGx0OWkwSWh4NWQzUXYzSzloN1pDc3hpbFYrQm5JMVNVY3pST3R5eTRS?=
 =?utf-8?B?eVozSUhVdFdEZjVrRDh1bzZ4eG80bE55Q0wxb3c4V2l5VURpdGJ3Z3B3dFFp?=
 =?utf-8?B?Q3M1TjJsRkZRZ3VNeXUwZWtpMjdSMmZoanA4UVN5NUFXb1FIdHpMMjBCTnVm?=
 =?utf-8?B?Q1JibVdiNmgyMWQyTklzdG1GUDMydW1FVDU4S3lyR1lMeFB1WUNHRjR2aWQ4?=
 =?utf-8?B?cHBFV05pdjA0WmRkQWZBQlgrTmlqL0hucEE0TzdoaGRndWxMMmRTTXh0YTI2?=
 =?utf-8?B?VzNnMlVFbjZ5ZURqa1NmeEpvRzY0SHlTczJHUkthWXY4VExsOUcyU0NTaDM3?=
 =?utf-8?B?KzJyZndIOUZiV1hxODVsa1p0dUNFZC9JUWUvUnZFQmMrcDhQVFBDTVlWR1Zy?=
 =?utf-8?B?Z1ZMUFQ3RGlHbjNrWVdIN3o0c2RmN1JxYXRna2lIUUxrZk5NRHRsUVJkaEFs?=
 =?utf-8?B?REZxVE10ekhRem0yZFZOQ2MzUm8vbHZQV09SK2duOERxUk1jZHVidnp2L2V0?=
 =?utf-8?B?MUJwcks2djFLREpLbDIrVit1VGM5UTNYNUcrR3k3dSswcUV6WTlOaGxvRkV5?=
 =?utf-8?B?eUt0SkEzQk1TUW5yREp4cWE1VUJvdFo0T3RNTTBHU1E3cXptbjhIcFRKSmJt?=
 =?utf-8?B?MHZGOG01YlpTSmpPSHg2YTVDOURoL0hLTDRXaU4ybG5OUHVPZ1pCcU1PWmZV?=
 =?utf-8?B?VXpwWXFram1wQzRCamhEOWFucC9xRVNIKy9Fa2YvN1p3L3BuK3hEdnRCcU1q?=
 =?utf-8?B?bmlEWm1lSkh0VmNGVEkrazM1Ukc5OVFoWVRpa0VFQnRtTFArR01sS0FiS0Ro?=
 =?utf-8?B?QlJJVVBTNHd1ZFY0NDRSa3g0RmRmMkdUL09sM0dGZG1TQlQvM1d1K29yU3V1?=
 =?utf-8?B?Si82Ly9MZ0xhZ0xxZld4bVZuOWhJM3drVnh1bEIwcjFhdWRhUDM0UjNuWmJa?=
 =?utf-8?B?alhZZTNwNjQveHlOTjMvaWp1eGVUc2VYVFZ6ZTIzcGJ6ZjlEU2pBa3lrRlJG?=
 =?utf-8?B?dFhHZ0Z3ZERDclZFTFEzd1J3Z2MyaTRCRldtdDhVVFhPVElmclZabmFsU2pM?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 730006f1-cd7f-40a2-d698-08dd92db1ba3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 11:33:11.9371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36qKRCdudF3BugS4Beud8KnDRRqidJ/nJ7bzlYTopWD4PCojRhUyppoqDcaLOL2N9Zlh3UqyNb8J8xjc2aTelL7IE+mCU0mkyqwW1wtbv+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4915
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


On 5/14/2025 4:17 PM, Jani Nikula wrote:
> On Wed, 14 May 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Wed, 14 May 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>>> This reverts commit 584cf613c24a4250d9be4819efc841aa2624d5b6.
>>>
>>> Some eDP panels support HBR3 but not TPS4 and rely on a fixed mode that
>>> requires HBR3. After the original commit, these panels go blank due to
>>> the rejection of HBR3.
>>>
>>> To restore functionality for such panels, this commit reverts the change.
>> Which panels? References? Bugs?
> Regardless, on another reading of the specs, I think the commit being
> reverted was misguided. TPS4 seems to be required for HBR3 on DPRX, but
> not eDPRX.

Yeah TPS4_Supported bit seems to be not defined for eDP.

For the gitlab issue 5969 [1], the rejecting of HBR3 rate avoided the 
10bpc which I guess is not supported for the panel mentioned in the issue.

 From logs, the VBT had capped the bpp to 18, but GOP used 24 bpp. Edid 
advertised support for 36 bpp.

Without the commit, 30 bpp gets picked up and the issue was seen.

With the commit (After rejecting HBR3) 24 bpp was used and the issue was 
resolved.

I am wondering if we should limit bpp or the rate for the panel 
mentioned in gitlab issue 5969[1].

Also should this be an i915 specific quirk? Or something like quirk 
introduced in patch#2 [2] of the series?

[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5969

[2] https://patchwork.freedesktop.org/patch/653510/?series=149005&rev=1

Regards,

Ankit

>
>
> BR,
> Jani.
>
>>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5969
>> This is a reference to a bug that got closed by the commit being
>> reverted. This now breaks it again, can't use the Closes: tag here.
>>
>> Since the original commit was backported to stable, I think we're
>> probably going to be screwed if we do the revert + fix in two
>> steps. Maybe we want a fix in one go, and backport that to stable. Idk.
>>
>> BR,
>> Jani.
>>
>>
>>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/display/intel_dp.c | 49 ++++---------------------
>>>   1 file changed, 7 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>>> index 91a34d474463..97cf80372264 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>>> @@ -175,28 +175,10 @@ int intel_dp_link_symbol_clock(int rate)
>>>   
>>>   static int max_dprx_rate(struct intel_dp *intel_dp)
>>>   {
>>> -	struct intel_display *display = to_intel_display(intel_dp);
>>> -	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
>>> -	int max_rate;
>>> -
>>>   	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
>>> -		max_rate = drm_dp_tunnel_max_dprx_rate(intel_dp->tunnel);
>>> -	else
>>> -		max_rate = drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
>>> +		return drm_dp_tunnel_max_dprx_rate(intel_dp->tunnel);
>>>   
>>> -	/*
>>> -	 * Some broken eDP sinks illegally declare support for
>>> -	 * HBR3 without TPS4, and are unable to produce a stable
>>> -	 * output. Reject HBR3 when TPS4 is not available.
>>> -	 */
>>> -	if (max_rate >= 810000 && !drm_dp_tps4_supported(intel_dp->dpcd)) {
>>> -		drm_dbg_kms(display->drm,
>>> -			    "[ENCODER:%d:%s] Rejecting HBR3 due to missing TPS4 support\n",
>>> -			    encoder->base.base.id, encoder->base.name);
>>> -		max_rate = 540000;
>>> -	}
>>> -
>>> -	return max_rate;
>>> +	return drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
>>>   }
>>>   
>>>   static int max_dprx_lane_count(struct intel_dp *intel_dp)
>>> @@ -4272,9 +4254,6 @@ static void intel_edp_mso_init(struct intel_dp *intel_dp)
>>>   static void
>>>   intel_edp_set_sink_rates(struct intel_dp *intel_dp)
>>>   {
>>> -	struct intel_display *display = to_intel_display(intel_dp);
>>> -	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
>>> -
>>>   	intel_dp->num_sink_rates = 0;
>>>   
>>>   	if (intel_dp->edp_dpcd[0] >= DP_EDP_14) {
>>> @@ -4285,7 +4264,10 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
>>>   				 sink_rates, sizeof(sink_rates));
>>>   
>>>   		for (i = 0; i < ARRAY_SIZE(sink_rates); i++) {
>>> -			int rate;
>>> +			int val = le16_to_cpu(sink_rates[i]);
>>> +
>>> +			if (val == 0)
>>> +				break;
>>>   
>>>   			/* Value read multiplied by 200kHz gives the per-lane
>>>   			 * link rate in kHz. The source rates are, however,
>>> @@ -4293,24 +4275,7 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
>>>   			 * back to symbols is
>>>   			 * (val * 200kHz)*(8/10 ch. encoding)*(1/8 bit to Byte)
>>>   			 */
>>> -			rate = le16_to_cpu(sink_rates[i]) * 200 / 10;
>>> -
>>> -			if (rate == 0)
>>> -				break;
>>> -
>>> -			/*
>>> -			 * Some broken eDP sinks illegally declare support for
>>> -			 * HBR3 without TPS4, and are unable to produce a stable
>>> -			 * output. Reject HBR3 when TPS4 is not available.
>>> -			 */
>>> -			if (rate >= 810000 && !drm_dp_tps4_supported(intel_dp->dpcd)) {
>>> -				drm_dbg_kms(display->drm,
>>> -					    "[ENCODER:%d:%s] Rejecting HBR3 due to missing TPS4 support\n",
>>> -					    encoder->base.base.id, encoder->base.name);
>>> -				break;
>>> -			}
>>> -
>>> -			intel_dp->sink_rates[i] = rate;
>>> +			intel_dp->sink_rates[i] = (val * 200) / 10;
>>>   		}
>>>   		intel_dp->num_sink_rates = i;
>>>   	}
