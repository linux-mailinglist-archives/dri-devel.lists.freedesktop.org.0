Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNRlHj67imlmNQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 05:59:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D75B5116F0F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 05:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8AD10E4B0;
	Tue, 10 Feb 2026 04:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOrBX3dF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD0D10E4B0;
 Tue, 10 Feb 2026 04:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770699579; x=1802235579;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zBi2pw/dMVXyCY1N/OoyBDwWMtS2VM3JmtsY6wYz9+o=;
 b=AOrBX3dF97P7O0m+g883OQqxlXtVvVKdZH2H7pQV9UWPUv7IzS472g92
 MjwuBaOmaS2CT20H340kOfSzjxX6SLhjGFudcvPxwL9NBYT5Zfkkk46r+
 4xrGDOihNJl61fuRhKpyfiasIfUVdm/MxHxtx8KKxQF9RiTEmj8oGMpbV
 Q+4OoKT12MH88pJg5nAinEwGeVt5QEvwFhku67RdWfetiehwOEJnQxrSR
 8umkNoNgBFm0wiGpI2fr9O4+zZuSBnLgXvxQOG3dO/zNL3nEFxK59ZiVl
 Mtp93CHjqZoa4ngMoZbtwWVGFRWN99hj6Ax2xMDkd73F9zlmHTZkE0opO g==;
X-CSE-ConnectionGUID: bjdMi3JcTKa5XR7NIAfAZA==
X-CSE-MsgGUID: 5KpwU6tkQ5a36paKCC8q2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="72003763"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72003763"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 20:59:38 -0800
X-CSE-ConnectionGUID: aYlAROUcQ7CuLP9v4dnMPQ==
X-CSE-MsgGUID: ThBAHzZvTciFCjTgbvWybw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="241833343"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 20:59:38 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 20:59:37 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 20:59:37 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.64)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 20:59:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqSZ5qOwGqP4bEPlJFKVTB1rVpqG+zv10NMjAKDOToCS6C2No23gSzbdsJD9CFx//GIyiadBZo+z97SCEN3deOtkSvmTrSbLVtEvu+0HaRhYyAWrj4EPBEJh4uwxpgIXwHQidI/QasXDaRxKUzhtPzCcy0+me3B/LDbO9GV+cj0GyvIyn7M6AM5QcAHxGQq99LxG4iqY4PR1IRf1ZCN4tol4yjATkwfYSuKJJIfVd6X5qUdLYTUO3HZEjHI35kk9ACQy/IXu/5OIGMc3aAmm4IB9q7puRoV3fxmxjmw28ZQ2mrL00r9XX3T6FGqMiqOY11x/5NqjTo/tG5tpzVOLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNA8bZhNoQs+4ERVD7+IONc4LjJvNVn92AIWUeolS6U=;
 b=I0JTjke4rr1nppbSMPX1WoxNyrmCi7LLrA7LM7/mOfS8/UxF9iIu6TgKi1MDhpZ5ArEg5Z9wcKxtTp/nIxpUsT96Mpz/8NSAIjA/0MJiSJOj62FdlsJHd9vYvJjfCrrDLTrfXaCcYxMtzVDZLs4M9i7GpmxsM0QGC1nVz2BDggoqDdXwFGnal2IibWgRk6cxIUdfRHJlIHVs0Dukn0kkgZXPF8fZRLvZSBryL8xrkwim1Y/DskMrYI9srTXFsdVhhReyc1aKojqe5OPI0wzqPPeiV46ZAsQcUdNo/H/ztySNOuFTYqWmByq5F+dPI3Mu+zc2gME7qDn6yT3K9ziNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7345.namprd11.prod.outlook.com (2603:10b6:610:14a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Tue, 10 Feb 2026 04:59:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 04:59:35 +0000
Message-ID: <d04c0c10-6142-4614-85a1-f564e686bd70@intel.com>
Date: Tue, 10 Feb 2026 10:29:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm/xe/xe_hw_error: Integrate DRM RAS with
 hardware error handling
From: Riana Tauro <riana.tauro@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260202064356.286243-7-riana.tauro@intel.com>
 <20260202064356.286243-10-riana.tauro@intel.com>
 <aYRVLYCqT9_SKX8k@black.igk.intel.com>
 <ce578a81-920d-4f5f-92aa-6f251aa3625f@intel.com>
Content-Language: en-US
In-Reply-To: <ce578a81-920d-4f5f-92aa-6f251aa3625f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 96857b24-0013-4ab3-e885-08de68612f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXo3MnphQzV4Vkw3ZVllRFhHOGpBTWZCUEEyanVSV2laQTB3MmtIQVdwYWE3?=
 =?utf-8?B?bTlMNzMxOERwNlBwQ1dqZW1UV2JSTnlCeE5pc2dzVmxRL0NKWUYvTU9Kelhy?=
 =?utf-8?B?dXA3VGFWckxUZzQySWNYUXpML0xpTmlWS0VqdzYzcXlKN1RTazB3djZlMUJM?=
 =?utf-8?B?YjdjOGNQUHhoSUhRZkxhSzFzZXcwV3E4TXZaRzVCRnFMOTJRRllWdmlndzlH?=
 =?utf-8?B?OGEyeWZ3cjNxN21pcVVONm5mUFhmeUh5QktRQVZoa0pSOVhhd3plMnhLVTMz?=
 =?utf-8?B?YVdVRnN6YllWMXh4ZS8yRWk4UzVQaWU4OUpxRkVKRmFkSVRHbWptWTQyQTJ3?=
 =?utf-8?B?Y0Z5eVp6TzJuK2lheXBPcS84eTVFWEhFbDJ1TmNud21hMGNoY0hONS9UNDEv?=
 =?utf-8?B?Rkk3SWRsN0FOY2pWSjBtME9DaXZnN1ZRLzZ5OFEyNExoUDA5R0dQcGxGREti?=
 =?utf-8?B?Z0VCWTIzd1VndkpRQ1dCcm9iZ0U2NWx5MlJaaW9iY0lVT0NzOXp2ZFhCbkFC?=
 =?utf-8?B?amg1T2pjNUtGck9tazRaUStKVjRxOWNIOGVHeERMeXFHZmdUOW5QK0Z2ME5M?=
 =?utf-8?B?L05nY2I3WDFMSTVXQnVXQWs1dGxjNGl4Y3BnNDdteHZXaEdjNCtoK3RlbmJp?=
 =?utf-8?B?eDZ5STV3ekZ2cGtvN0tsTW5LNHZmajBQV28wOXlIOXBmQVcxUUdvUUYvNDc0?=
 =?utf-8?B?SUlPanR3MFlVaUdpR0Qva3d2S1o1NVpsQStKbytWN091aDZnc3UrTG9uQTNh?=
 =?utf-8?B?NVVXQXRpbFMrWDM3TUYxNHZwbWZ5VFFleHFuVStXS0pBQlFOVnFQVlRFWjFt?=
 =?utf-8?B?VEw2cldiQVdSMzVyM0NpdnpobTZXUWZtODdteTdLdmQ2ZDBXemtoQ3BSSGYv?=
 =?utf-8?B?cjBtYXg2NDZxMFRzK3JTSnZBY2x4OE9RZXJBOGMwU2ovNXlhaDgzTlZRZ25u?=
 =?utf-8?B?bCtzdk5RRHplVmUvL2lPVi9YQ0pWTStuRXpQYXJPN1poNUVFaVI0c05lZ1Rt?=
 =?utf-8?B?Tjh0NXA1NW1zQlNjR2x5Ny9sQ2hBRXFoU2NTaEFzWlp5ZDNSczNGdWhRYStu?=
 =?utf-8?B?L0lFKzVOcXh6M3Q5ZUVPeS9NRWRXRVpvYk5mZTlNbnlkNmkyOTdNazU3Tkxl?=
 =?utf-8?B?c3hibmx5cXFNR1ZtUkVtbXFuS3ZFWmdmaDFmSmZZcStmbWVEL05sdDR4SVpU?=
 =?utf-8?B?TzVYUkhyOXoybkN5OTh2emo4NW45djVWTU5ObDBYcTY2RzVtYnFNNysrcXcr?=
 =?utf-8?B?SkgzWUlJak5WcUFhM2x6d2krTyt4TjVMaVhEVjVDdkpOdy9sZFRYSkhCUDh2?=
 =?utf-8?B?MDRPalNJT1lVWmxXbUJEVVNWL3l6NjVEck1QeFp1b3hzVGxtSGFWaHZHZ2ly?=
 =?utf-8?B?TE12a0V4bDB1VGQ5WlFsY1p3NjRXbWZwc3hrcUFNbUdoaElOVlh0Z1IvcXZk?=
 =?utf-8?B?QXVSNWxmbDdJWXIyQTlDU0dodTUzQUJpMWxwelFWcFZNSFl1c0c1NDVoWG4y?=
 =?utf-8?B?TkJ0b2VKMlc0MEwrVTJLSklJV09tL2UyeFJZaFIyc0JWTzJ1T1FvTXlYVG95?=
 =?utf-8?B?T0xFN3BYa1puY2NPSmpuYWw2SHU2WTFsQ09jNWhOcjlITVdsREdyNVpXV0Rj?=
 =?utf-8?B?eGhPOU5OQTNia0hsNGRYOE5oYy9Xa2h3VWxRamx0cXhEOXFUVXVTMXJ1dTBX?=
 =?utf-8?B?UUxmb2hQTHUvWnArZWtqR1RzaWJUbjRWaTNqeGx5WlpiYm1QRVhWcEdZSDd4?=
 =?utf-8?B?cjRudFlhSmllQmUrbmZZdi94RXJQWUxLY2hkOWc5a0xJbi9TaDZXNEI5LzhB?=
 =?utf-8?B?TEk3aTZIK1gzdldnTHB1SVZBbm9tSEF0UVlEbERicjlRdUNMSVltNEdJeHZK?=
 =?utf-8?B?SExJSDFpQ3cxaHBveGRzTWdDSUx0anRlRXM5emVEYitlMkxKUW5WbkFQTmQy?=
 =?utf-8?B?MFBHeEw5Z3hXWkdmQTRQN1JoYjdhRlVDRXFLUjNaWDNrN1JJZXB5aWMrSXpQ?=
 =?utf-8?B?NFRxUTFRVjU0d051V0hia25LQlUzMFl2cm12cXF2S3NEVTVycy9Ya0wwaUEy?=
 =?utf-8?B?bmV3Qkg2UGN5VktadmlPczFIQ2xiaC95dkplZnp5eFhiRC9tSFhEbk9Ic3d3?=
 =?utf-8?Q?oHy4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M01jcmJFb2pZemNKZDlwc2JWdmJhSU14UGpZMi8vK3R2U0drUzJ4VFkwNDRw?=
 =?utf-8?B?VmtjRVMrMkN4QXJuaG91emhYUzhTWjF6dWxHT0RhV0NLLzg5bDN5NzdtbjNr?=
 =?utf-8?B?QUxmcGFqVzE2anpJcTNDMlN5dEZwR2hDQWcxTE0wWUtraEt1cCsrMXJOSHRN?=
 =?utf-8?B?TWlndnc3SWtjNWdSUHFGdGNtTlB2Q2ovbEkycGhZdkpXUDd5d0dBMFFKbWxs?=
 =?utf-8?B?NkpnYWs1SmxaODkxSFZvVFRValE1L1Z3T1NUcXhuYWpQSzFhWTVKSlEvMHQ4?=
 =?utf-8?B?eXN0d2xnYTJJSFl1RXBjbURxcTA4TmYzVUxPZWozR041Y1h1TkdnQ1VkTG84?=
 =?utf-8?B?dXR3QXE3Zm4xVkxXd1BVOFZmRS83QVZsclp5VFFNNDEwb2M3L2wyRitkcHU4?=
 =?utf-8?B?YVk3VnJkaTc1Y21QM281ejN2U2JtcE9tc2J3VmdhQkNmRlZYT0dTL3pjM2tN?=
 =?utf-8?B?NDBqTUJ0ODdweXBhcGh0SFpLNjVzV2pjeUtqNk5ZYlFyc2lLUy9YZ3A3dm9l?=
 =?utf-8?B?TlFDVlN3enMyYU9yTHJZMlVFNWVncUtlR09HMzFmY1pJdUxmVE5DRTFITFR5?=
 =?utf-8?B?N3J6aVhGclNOVFdMUnhleDJTQnJjVWd3WGZHbEF5SzFicnJWODk1c1NoNlQ3?=
 =?utf-8?B?UzJvV0g0cUhnaG5peW03dHY0eVVWTzY0UUdFMjFDaTVNNUpZaVBmd1A2NXd2?=
 =?utf-8?B?VDBmR1ZrYmxyU2s5NWNpU3dpTzFaZllXZFNpTHFkdm1ZTkdveHNrUHVMME4w?=
 =?utf-8?B?UEZqU3ROOThZQ0NjZmRBRUhldDZBRCs5U0ZZTlAvRGQzS1cxa25lV3lkZXpC?=
 =?utf-8?B?VzNTcWVjVkhiWWxPK25WTTcrcXBmVmMxUTRDRVplMExrRkNHMUdwTTBqeDBa?=
 =?utf-8?B?UmxZekpRSW9WTEk0ZE4xbDFTTlhzeTA2SWNCNG80YWZBQWNaMFI1Ty9SQVJr?=
 =?utf-8?B?dG9HM1ZVdENodTY2d0wrcDd2bnRPZlhsUzQ0RGVCV0xwNW5WTDBnV0lHeTNs?=
 =?utf-8?B?ZHFWMmIzODNXdFhzUEQyZTBZeUNkTkhqTGI0UEI4ajJsOUh1U2Y4WUc1VHp2?=
 =?utf-8?B?blRLbnRtSjIxeDlXZGZXVWxiNkFKWVlQbkgzVHpPSlhoNS9ZRjhCbHZodXdu?=
 =?utf-8?B?YnFOYzhTMTdRMUFJQU1EcDlna0VNUkh5RnRQV05wd0tJWG9zaWYraU5pQ1Bq?=
 =?utf-8?B?NEo0K25kTFJJOUdJbXJOOFZINXNNOTJJWVZvay9FL2I0QlNTUkZqU3V4eE8w?=
 =?utf-8?B?VlQ4Q2VoZm1KSFg4NWpzS1o0WTNaQzVYalBCYmVjZ2JIRkNBcWdUdUljMW9x?=
 =?utf-8?B?dEV0cUVHU1krZko1dUNlWlJVQ3BDZXhQaGRLQ0xyUy84UTF2Zk5rOCtDZVMv?=
 =?utf-8?B?RkliNWY5bG82Q0h3R2Jua1IvVlVsRUNJVFlOUlhGT1VWNUo2V2MzQzRiWGFQ?=
 =?utf-8?B?YmJGSGZHM3BzMzNVR25tcGpHWnEvWWhsa0NvK1JMakRCZnZjOXRybUhTRVV3?=
 =?utf-8?B?VzNDUkFLWFpyL1ZPV3M3UUJyUmM3MVRubElvRUs2OEhmUTVUZHcyNmNVYzcx?=
 =?utf-8?B?SUhrWkNhNEFCNTlwT0E1NzBsQ045NkQxMTEySDR5dHU3YjBlT0kwcThTQjQz?=
 =?utf-8?B?MDh3cElQUytFZDBBZzZNK0wwMjJFdVBRTkl5dFhZV0Nha09MWjdXWTZBY1g2?=
 =?utf-8?B?ZzBWdC9hVGVEU2dwblErcWRvTnA1aVk2RnRhSFB4ZHRGZ1B6QXFTTmM1cyt5?=
 =?utf-8?B?alZMeW1Xc2xxOG9oMEc4TVJka0svU2MyRDMwNkQwb0kzRlNBZVM1SlJDMVQz?=
 =?utf-8?B?VE50em95ekYwNTZLMzRlZElCcmhEN3JmM0FVYTc3NzBKMENGSmdYd1FvcEE4?=
 =?utf-8?B?Y1R2U2wyS2NNUUxLWUNkdmMyUDBnUlI0SmRLQU5hM2dhSDZ2Nk5MeStuZHMv?=
 =?utf-8?B?NUEyNEc0R1NSa21XOFR2T3FSbFNzemNWelY5Wm43aTNGQkx2RmUyaFpjbWt3?=
 =?utf-8?B?S0NOTUMycm5MTy94Ylk3NGwybjVSNDI2R0JjRSt1YmJJcWdRRElCdnVNdm5v?=
 =?utf-8?B?a3hTT3F3dWpwZUE1bVRjVEdNRnZ0RS8vWHFmSEQ3cWk5bnFLZ1BUOEpWSUY5?=
 =?utf-8?B?TmdkMng0WnZlaGdjRi9zVzhRUjlpclpNdjNaWGlPTENDdkEzRmh4YXQwbjMr?=
 =?utf-8?B?V1hiaEREUlhlTnMvZDNXRjFOZDArN2xDQWlQb3R1d0ZSaDlMTlFOaXNZSERZ?=
 =?utf-8?B?Q3FVTFAwRWttLzkzRlBpaUF1aVNlRVhkOEl3UjFrTEpsb1lVVmRsazNPQW9O?=
 =?utf-8?B?TDZwMW5mQXp6S1pjVHNyUVNwZ0I2b3JGK0tIY1dGUmFNNkJjRDZMQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96857b24-0013-4ab3-e885-08de68612f2d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 04:59:34.9268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sr/n+fMIPhJAZCLvp7Qm9nuJDiVftt48ORZ8Yg6KgOuj/Nr0eZWTbGRu9bKLyPnnuO0FtEJPr4b+oh03oxOuQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7345
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: D75B5116F0F
X-Rspamd-Action: no action



On 2/10/2026 10:28 AM, Riana Tauro wrote:
> 
> 
> On 2/5/2026 2:00 PM, Raag Jadav wrote:
>> On Mon, Feb 02, 2026 at 12:13:59PM +0530, Riana Tauro wrote:
>>> Initialize DRM RAS in hw error init. Map the UAPI error severities
>>> with the hardware error severities and refactor file.
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_drm_ras_types.h |  8 ++++
>>>   drivers/gpu/drm/xe/xe_hw_error.c      | 68 ++++++++++++++++-----------
>>>   2 files changed, 48 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/ 
>>> xe/xe_drm_ras_types.h
>>> index 0ac4ae324f37..beed48811d6a 100644
>>> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>>> @@ -11,6 +11,14 @@
>>>   struct drm_ras_node;
>>> +/* Error categories reported by hardware */
>>> +enum hardware_error {
>>> +    HARDWARE_ERROR_CORRECTABLE = 0,
>>> +    HARDWARE_ERROR_NONFATAL = 1,
>>> +    HARDWARE_ERROR_FATAL = 2,
>>
>> I'd align "= x" using tabs for readability.
> 
> Will remove the values except the start
> 
>>
>>> +    HARDWARE_ERROR_MAX,
>>
>> Guaranteed last member, so redundant comma.
> 
> Will fix it
> 
>>
>>> +};
>>
>> Also, just curious. Are these expected to be reused anywhere?
>> If not, they're probably better off in the .c file.

These are used in register header files along with c. So added it here

>>
>> ...
>>
>>> @@ -86,8 +78,8 @@ static void csc_hw_error_handler(struct xe_tile 
>>> *tile, const enum hardware_error
>>>           fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
>>>           for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
>>>               drm_err_ratelimited(&xe->drm, HW_ERR
>>> -                        "%s: HEC Uncorrected FW %s error reported, 
>>> bit[%d] is set\n",
>>> -                         hw_err_str, 
>>> hec_uncorrected_fw_errors[err_bit],
>>> +                        "HEC FW %s error reported, bit[%d] is set\n",
>>> +                         hec_uncorrected_fw_errors[err_bit],
>>
>> So we're dropping severity_str here? Did I miss something?
> 
> I removed it because uncorrected was mentioned in log. But removed that 
> also by mistake
> 
> Will fix this. Thanks for catching this
> 
>>
>>>                            err_bit);
>>
>> ...
>>
>>> +static int hw_error_info_init(struct xe_device *xe)
>>> +{
>>> +    int ret;
>>> +
>>> +    if (xe->info.platform != XE_PVC)
>>> +        return 0;
>>> +
>>> +    ret = xe_drm_ras_allocate_nodes(xe);
>>
>> Why not just
>>
>>     return xe_drm_ras_allocate_nodes();
>>
>> Tidy? ;)
> 
> okay
> 
>>
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /*
>>>    * Process hardware errors during boot
>>>    */
>>> @@ -172,11 +179,16 @@ static void process_hw_errors(struct xe_device 
>>> *xe)
>>>   void xe_hw_error_init(struct xe_device *xe)
>>>   {
>>>       struct xe_tile *tile = xe_device_get_root_tile(xe);
>>> +    int ret;
>>>       if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>>           return;
>>>       INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>>> +    ret = hw_error_info_init(xe);
>>> +    if (ret)
>>> +        drm_warn(&xe->drm, "Failed to allocate DRM RAS nodes\n");
>>
>> This is less likely due to any hardware limitation, so I think
>> drm_err() would be more appropriate here.
> 
> okay will fix it
> 
> Thanks
> Riana
> 
>>
>> Raag
>>
>>> +
>>>       process_hw_errors(xe);
>>>   }
>>> -- 
>>> 2.47.1
>>>
> 

