Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJHUOC2LjGmHqgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 14:59:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84604125061
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 14:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD33310E609;
	Wed, 11 Feb 2026 13:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRGingTV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F60A10E084;
 Wed, 11 Feb 2026 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770818344; x=1802354344;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UZSFPxVIIzTMrBE2rQpk1lJoW0v+1rKN/7HVLBmo/tk=;
 b=bRGingTVybGTsfUAWj0DGGWRxABo3QeXra5E2bKCWccmY6kCUDz0+4W9
 LCoK1OJxp2Xw9XC9dvC9VYgW185cMk4RVAVT5dYXIdvokeMZj4NH/btfa
 RXNlEPPC0ttlnj4LIpDu7eEHkdTLYqbL7p4qQssiIeHeI2D1IQb3ZOSeb
 U3V+u1IPGqsKTk4Uy7JjrjEQZc2Nl4G/1fHIA+Tu/iJsMmNRWMeDSof+l
 iIERJTpaAAF3iNn0v46rWQxim0bxgBA+dqnZ72nAwusQb5C4KddZuOTvj
 VsVvPglG5eMVeL1g07IR3N2ne24Twq2bUEam57JxGIP93iVS5isKYBGnO Q==;
X-CSE-ConnectionGUID: ZbGbUEBNTRCDd7DJ6AdAkA==
X-CSE-MsgGUID: 3RfjQS6aSdym+hMUJX6slw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="82695044"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82695044"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:59:03 -0800
X-CSE-ConnectionGUID: DUpe/Q6eTWKojdeJyENdnA==
X-CSE-MsgGUID: wL4lVM1ySKWitSsoNwcKwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="217221045"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:59:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 05:59:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 05:59:02 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 05:59:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5KvtjRnWTiTee3i0OXWBWoDi4to0eiOWJLZ/mUpNstnkm5oaxqjTGdf+M8CDFkQnRIEKOlHlohO/XfvbJvTvliPUvkdDso67NaRxVnTmWKOljjUbEkX2xntMkLlkMWymd2+DrabieiPg1/OW54GQ0jOhVZbH/TLvDeEg8OALHAGcRXmnGHEGc4E/wspQ8rEUW3dccYjPKCjI7N6SK3QW9jh6as3eq6BNhxgqJXPNHPxfJWk9pD0En51MnX7n8sBQKGaGD+FUJJcX5mgFHRwUjsW3hetBIDg7N7B6RMgU/cNlpKTrkTy04mAfkV6n57bAJxjKjXsbknD5ZhPfwvMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCZSYcx3maxwawzAdhHGWw/guPKas2pJWz0o6QXb3Ts=;
 b=YxkVblO+EBfC97yCe65DicMEXAKuy/GRRSx80OpXJHDXzVeGTHQoHT4+w+7EGHDxttwQkBrm2FWt1U2L9Z13S5ScC1fnoDIG5vnP852d0MKWr8ObKKzw8dT5QIGCK0/t+Go/oYQmTWrm7NElLn0WU7miikpt7jMwptCFKAmpKfIsKsPQR36k5FFR8j2+31Pm7d0h4EYf7lkbIyZe/I7Z/VVfoV7xaY5fhtFmpexcusrokjJSRzi20ousIEt05uGk+AwNU9WdHrbU6E+c7uzysh8e+XKK/ZzdXVuR9Qk3MA0OaT3kKNOy7d4SmflQZCNf3TvbmZ68o3CD+02qHKh66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB6667.namprd11.prod.outlook.com (2603:10b6:303:1ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 13:58:57 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 13:58:57 +0000
Message-ID: <fbc231ff-0f00-40ba-afa0-ef8f016e0e90@intel.com>
Date: Wed, 11 Feb 2026 19:28:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 0/7] Async Flip in Atomic ioctl corrections
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <342abb15-95e6-4ed6-8b86-a900c0f403a4@mailbox.org>
 <IA0PR11MB730722B84E81A0CC9BF80275BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <d1e6ad38-06bf-4139-966d-312bc728225c@mailbox.org>
 <83e50bd4-de11-4298-bab9-7a5255b0c5ca@intel.com>
 <dd0a089c-6591-4fc3-b14e-5acc1c59cf8e@mailbox.org>
 <IA0PR11MB73070E28F07D2BA29C5D5473BA63A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <7c83329b-a730-4e3f-b6d1-c41db4df3bd9@mailbox.org>
 <bebe5a45-85b0-4124-bc8b-c94527d00663@intel.com>
 <04f79a47-8237-4170-9729-f5d0ce104921@mailbox.org>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <04f79a47-8237-4170-9729-f5d0ce104921@mailbox.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::12) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|MW4PR11MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1b936d-8388-4198-bc1b-08de6975b324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWlnUUhSaVorTkZQZGkrN3VZTEprb0JodVJ6KzdJbEh0WGhWRmxiZ2Qxekxq?=
 =?utf-8?B?VFcwWTlIWFloWkxpRkdhNjBXa2J0NkdyeDFVbzIzWlhTT0tZcERjcTdQcHIx?=
 =?utf-8?B?TXhXVWNIQ1BSNytTanZKZjZsMUp2a3dnODdESjZTSVRTcjJNTFY1b2ZtaUFo?=
 =?utf-8?B?OFQ1R0FMODdhYmhZanpJZ3BaODhTa1BxeTZZTlJQMkVoSnE0dWtvS1FoRnc4?=
 =?utf-8?B?U2FZRFV3RTFEWmtaRFpNbU8yMDZPbXZDcWU5cjBnV1VQenNCVmNEOWR5UnhB?=
 =?utf-8?B?TGZ3aTlBOHVUYmliWE5SSTVhWmRBUFkzVDFBOEg0UGFIVHVsNGZrU3B1Nkpl?=
 =?utf-8?B?MkY4Q2NjdG1ieGZxZTYySFZ0ZWphVVdEbzN1ejBFcis1REJiYVA2Qm5xRS9X?=
 =?utf-8?B?eTQ2M2sxVHc4SmJnbXQyQ2NsNytyMUtvNFJQWjdPQjZWUFlCcVhzU1o3RjlP?=
 =?utf-8?B?M0FpSjJNUWlIN05VV0d5OXE0MWRHREhHaW8yZTVuWUl6eXkyTGQ4MTBxczY1?=
 =?utf-8?B?VmwxWm1xY0pyTjdiQkwwelZVZjh3cGcydFVKVDFIU0tJL3hnTm81dEExMERk?=
 =?utf-8?B?TTVBOVNOTVgzQlBzdFdvczJyN2RmQ3hJV0FKSVJtdUhreGp6S2VWUDFoNFJN?=
 =?utf-8?B?T1dUSjZpODlYdGJyZnpYYWxJWkZoWFV0WHQyS0dNR0pRdE9KOFBIQ3ZVLzNI?=
 =?utf-8?B?SGFTWWtuczFFZEs3THpWMmtyY2FNbEFwUjA1VTBUYklRUndiR0QrTWxkSWFt?=
 =?utf-8?B?cVJtdFduRWs5eG5lYThUT3dkRGxoTGhZb2ZveW1CNENMbkdpK1FjSHQvb0Vs?=
 =?utf-8?B?dmthSTNUUis2Wm16bk9aZEdEYkdTWkQwajV6WFhsbWNxZkZFT1IyOHg3V2cw?=
 =?utf-8?B?Wk5BUUFDKzlJczVkbCtSNlNHRndQaERwa1RVQ0JhdzgzK21BVkNob2lESDFC?=
 =?utf-8?B?c2tROG9YWFZRMVZpVlZ0UlVmeFhxU3ZYYkpERGVCUXBvbGdjUjljaXZ0NXVF?=
 =?utf-8?B?WTZmSXRWaVZNa1hpUndrN1FEYjR4MWY4WHRCQWJ6dmE4TGtxUUkrRVpTSlpB?=
 =?utf-8?B?VWRnV0JpTktPRlV6a3o5eVI2elJ0SlNGYjR2b3MrZFZVUjVCYjVGKzFRT2hI?=
 =?utf-8?B?aXVRdG1SdkM0OTM1a1dWZTExNEYzanNLdVhDVTVpaWIvMUFTcmtrV3EwZzhG?=
 =?utf-8?B?MjRTelY2YVppc1NFSi9KS1ZlMFFJYVNubVBwc2ZLYTJIR1JNZ3BTVnVVOGhq?=
 =?utf-8?B?a1RyZkhpSWJ0WnlGQ09QcnAwSXZqaFhvRXBBa25YY1lKK0FTSGF0QkR0dUFQ?=
 =?utf-8?B?Sk1xNjkvbjRySEUvRE1uWmJJVjdMNkRhMC9La0Foa2psNXlVVTJyQTczQWJ2?=
 =?utf-8?B?UzZvT05MV2VTL0ZXRE4yWXZOVzF3VG1hd2VTSDMvaUNuYkdGNVFsSTRWUnpX?=
 =?utf-8?B?SEtiNWgwNGFCK1UxSTNaelRNdmVvY3J1dlFqYTViSmxjWHozMnNPRzYxK2hr?=
 =?utf-8?B?TnpBQUFKTks2Z0h2VzlXS2hLTzZPdVMvY2tSL1pLdkVBb3FmMlJhcEUvTnp4?=
 =?utf-8?B?MmNFYUZ6OWZ1YmJCQUxWZ1VaUXlDVGxVR1gzR1JVSkd4b3prOGQrbEhvbjJ3?=
 =?utf-8?B?Ti9tWDI0b0xiQjZ1eld2OEFLaXZPUWNFbXBuaWhJeXFHY3hGSnQ5RFM2aHVz?=
 =?utf-8?B?YnJ0SzRIajlzSDVGZmRJMzluNVZYbnVRWi9wSHlTa3A2b1owOVFOaW1TOGI4?=
 =?utf-8?B?QXpGb241cWw5bXhQWEdGZHVOVEpXcXV0YkFtaHlxSnJ0YkVyQzJoN1lJOUxo?=
 =?utf-8?B?R3JOZXArVlZNdU9WNDZMSTFJSzhDRkJXRSt2cHhnZHNBcUU5dFdLSnVhQk5k?=
 =?utf-8?B?VFZ6d1hnRW1XQ3lEUG9NM0Q2OHBsa2RSWlYrYVpjK2poTXIweGRNb2xnL3Rl?=
 =?utf-8?B?Y2NQOFUzQmlCMXVsVTljNG94VmtlVnZ6dDJ6NHNIWFlzRXB0QURTVWxzOENu?=
 =?utf-8?B?eDloN1I2WHFUTjE4L0Jua0Vlakg4SkMvZ1d6UzJRZGtsVk1OWUVERTk4aEd5?=
 =?utf-8?B?RmhCYlhMQWx0OFZUVXg1OENaT2hPeWdJTnNMdkxXcWNPQkNBdlJiZVE4NmUy?=
 =?utf-8?B?RlFMa0s2Ulhma004eFl3dGZVVGxYeGIwTEpiRHMzT3pZbk44eG5zM2ZxNGpK?=
 =?utf-8?B?UWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXNxb0liU3pBT2JvMS8vVnVJTVpXandhRm90L2J5c3hsblRLUDQwTWRBY2o2?=
 =?utf-8?B?aU5lajVXUnVOWVNmY2tGKy9PMXljVTRHeldPV3ozWDZkanVjdkdtYW9ta1pj?=
 =?utf-8?B?ZVRhd2NhVUxSeDF1aVBVYVl3WGZuMDgySTEzWFZJWjIrQ1JBK0tXNXZQUi9q?=
 =?utf-8?B?VVBTM3hXY2hON1BUNWRkRWZXZkp1NDF6U0xneWUxSURraVZPTGsxWHVxN0dQ?=
 =?utf-8?B?SlcwQW9MY0dXa3dJcG5rZHM1d3M5VWlqWFhwcTBKRWlGQVdyR2d4dHhMM2V0?=
 =?utf-8?B?enNqTVlWVWcwa1NQaVVUNlEzQmdMN2xUc3krMDA4djU1VVY5eXNTUXFqaTNR?=
 =?utf-8?B?UHNEUVJkbDE4L3FJbUd0SHBxVmo5MGZlczNzOWlhWWg3US90ZktCc3RjZHpB?=
 =?utf-8?B?b3UvSHBaam1xUFJyVVZnanBZemtMZUFHYkQzU3ZhNkM3Q0x3TFVwcXJLdGg4?=
 =?utf-8?B?c3hsenlCY3NjNWJIMlBDTEowL2lzaXdmYnFrcmxGRnF6S25YWHpCM0NiZ2VZ?=
 =?utf-8?B?bURMUjZmelhTMTBYUnlvRXQvRFNPQzU1eDd2WXEyMmpUaGFkV01NWDBXMk5x?=
 =?utf-8?B?OW5ocXJmc3dJaG5BRGNCVW9LL1RadWJxbmxlaTJzR050VzNHODE4aHI0SkRt?=
 =?utf-8?B?MnlCZHEwSUY3MmREc1ZYcEhFOWtocGQ3TkxpRWtHckNjdW85aHhjQzdva0Jy?=
 =?utf-8?B?R2Ztb2NoZFUwVkRuRkk5L3hlenk1WEpkUlFFYTVJYld2a2R6bjVVak51eng4?=
 =?utf-8?B?Y01VczVFUU9NbTBLZGpCeit5K0p6dFduYTk5WWUxMWF5STBkSWFUb1JTRDdr?=
 =?utf-8?B?a1N0RHRrTkRIYk5jNWtsUTA1UEFicWFWS1E0K0xWa2F2U2xIOWZLTHIvd29L?=
 =?utf-8?B?NGtpTmFudHFZZVRKUFV6THg4TEhhTHU2d3ZOcmJySlZyWWVhcG9rYTUzdm5Q?=
 =?utf-8?B?WkY4UDVFV0pnRDlPQm5pcGNMQUwycjBQV2ZqKzRwQ1NiVHRKRkhjaGQvMVY2?=
 =?utf-8?B?aEFMM1IzNjYyM0ZoT1hlVGNlLzVZMVRyWFBtYkVINXlobG9jSDVBZFBhUGRn?=
 =?utf-8?B?YzhLNkN5RWRVSE9kNHY1T2YyelphK2hhSHVhVlIrUlByeHRxK3lUYllqWGpr?=
 =?utf-8?B?VlR3ZTFzV1RucTNpZUtNQnhGOW83V0x4V1JLaTZMNStEc1R0NDdReERQWm01?=
 =?utf-8?B?S0hGYWEvS09uMThrZ21FQ2hSakg0MHhMODA4MTBISFdCODMvNEFacHF4eW10?=
 =?utf-8?B?YjhIa3NnaDhocG9kQW9UREMxS1UyUkt1SVg4S1ZvMXBJNFJzZ0tDNXc0eW52?=
 =?utf-8?B?TkdqdkZOZnJEU0lqSkZycTc3aVhXUzNOMFppOXNNUTI0R0RDRzJHZDYwNGFm?=
 =?utf-8?B?a2EwblFKcnp1ZmZLdFlCTnhwUEJKaCtaQTd0eWtra2ZyL2hDcFhxZ3pzaEFm?=
 =?utf-8?B?RHdnN0FlVkZsSDloa2tpVWZTVktMUndqR1BQZ1JZUERJM0ZHUE5ESFV3M3Vo?=
 =?utf-8?B?L2hsbCtrbDZiN3p2Q2ZMM2VCL2lDQit6OEZhSGFneGQ5K29sbXUzTWZ1OSts?=
 =?utf-8?B?TmZSaC9zNWpDYVoxUDA5NlNacTlUbjNHVlVDaGpORzlyN0NLTHc1TWJBdkhv?=
 =?utf-8?B?d01tUzdKL1lPdlJPdFVnTTlWclZESDI3ampHU2dUbFlwRGY3V2VXMGhHc29x?=
 =?utf-8?B?WUtPcS9BZmhJQVVpSDMyT2dwaVdYMW1qNFo1Y1daTVNQME1CRDBzaFdxNGFZ?=
 =?utf-8?B?VUluRmY3WGdXN2dGamFKekNLelFLVm1xOVdtbktPRGM0RzNkTVo1ZWYrdHQw?=
 =?utf-8?B?aDlFUHhyVlkzd29UT2xkUkZWWWpvc09aN2thbGVoY3hrck5BWmRQZU9yejN2?=
 =?utf-8?B?YzBiOWIrb3Nxc0dJcnR0U0N3ZTFYR0NZQk9OcnNuNXZyTU9tVngvcmMzTVFi?=
 =?utf-8?B?T2YxQ21Dcy9KSkJFZDFlMVV5QWtXNmZhbG92bExJeG94REdJOHFHcHBscVRU?=
 =?utf-8?B?eEJEWndHTHhud3U3dTBDRy9naHpSdy9URDRqc29vY201NVZzMFNPVmY5TERH?=
 =?utf-8?B?TXFuazNKa1FiWnB6M2c0WTBUNjRlenJLcFV4UFp6QjdmNDJBUEsraUs4UlNm?=
 =?utf-8?B?SEVUbVpBRWErazlDQkZOa3RiQWJEbVZnaVp6b2wrcW4wNnpnZWhsbHE4RTNK?=
 =?utf-8?B?dUZBcWRvUzB6ME51TUNqVHcwK1RtWnpMTWNWK2pPS0ZVdFRHWitLTG9zVjZL?=
 =?utf-8?B?aUdKYk5qVlN6NWowT0t1RkxaUzJtakM2VGFaeFliQmhvTWtEejBiRG9QU0J1?=
 =?utf-8?B?UUxHQWpKRWFEcndlQnRCRDJxYzdyM3pvSnpEejRVbzEzT3lJQXlXQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1b936d-8388-4198-bc1b-08de6975b324
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 13:58:57.4699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKvQ6yusj+v0BGrs3i2nsjFbfgAxA1n1E1O4YKltxBdHY7YpgTVQAX2+m73ZhIBFSZwR3zwSIW/cw48vBHl5aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6667
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[mailbox.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,igalia.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 84604125061
X-Rspamd-Action: no action


On 11-02-2026 19:21, Michel Dänzer wrote:
> On 2/11/26 14:38, Murthy, Arun R wrote:
>> On 11-02-2026 14:27, Michel Dänzer wrote:
>>> On 2/11/26 06:48, Murthy, Arun R wrote:
>>>>> On 1/12/26 09:23, Murthy, Arun R wrote:
>>>>>> On 09-01-2026 16:52, Michel Dänzer wrote:
>>>>>>> On 1/9/26 12:07, Murthy, Arun R wrote:
>>>>>>>>> From: Michel Dänzer <michel.daenzer@mailbox.org> On 1/8/26 10:43,
>>>>>>>>> Arun R Murthy wrote:
>>>>>>>>>> struct drm_crtc_state {
>>>>>>>>>>            /**
>>>>>>>>>>             * @async_flip:
>>>>>>>>>>             *
>>>>>>>>>>             * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the
>>>>> legacy
>>>>>>>>>>             * PAGE_FLIP IOCTL. It's not wired up for the atomic
>>>>>>>>>> IOCTL itself yet.
>>>>>>>>>>             */
>>>>>>>>>>            bool async_flip;
>>>>>>>>>>
>>>>>>>>>> In the existing code the flag async_flip was intended for the
>>>>>>>>>> legacy PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
>>>>>>>>>> As per the hardware feature is concerned, async flip is a plane
>>>>>>>>>> feature and is to be treated per plane basis and not per pipe basis.
>>>>>>>>>> For a given hardware pipe, among the multiple hardware planes, one
>>>>>>>>>> can go with sync flip and other 2/3 can go with async flip.
>>>>>>>>> FWIW, this kind of mix'n'match doesn't seem useful with current
>>>>>>>>> UAPI, since no new commit can be made for the async plane(s) before
>>>>>>>>> the previous commit for the sync plane(s) has completed, so the
>>>>>>>>> async plane(s) can't actually have higher update rate than the sync one(s).
>>>>>>>> That’s right, such mix and match flips will still consume vblank time for
>>>>> flipping.
>>>>>>> Does a plane property really make sense for this then?
>>>>>> As per the hardware this async flip is per plane basis and not per crtc.
>>>>> That's not really relevant.
>>>>>
>>>>>
>>>>>> Not that I am trying to clean up this. Recently AMD added async support on
>>>>> overlays as well for which  few other hacks were added. The checks that we do
>>>>> for async flip were all done in place of copy the objs/properties, but it actually is
>>>>> supposed to be done in the check_only() part of the drm core code. This was
>>>>> the limitation with the existing implementation.
>>>>>
>>>>> Those implementation details can be changed without changing UAPI.
>>>>>
>>>>>
>>>>>> As per hardware the async flip is associated with the plane, hence changing it
>>>>> to a plane property.
>>>>>
>>>>> A plane property would only really be needed for mixing async & sync plane
>>>>> updates in a single commit. Since that's currently not usefully possible due to
>>>>> other restrictions of the UAPI, the DRM_MODE_PAGE_FLIP_ASYNC flag which
>>>>> affects the commit as a whole is fine at this point.
>>>>>
>>>> Sorry for getting back late on this, took some time to collaborate all the feedbacks.
>>>>
>>>> We can depict the below 3 scenarios based on the discussions so far.
>>>> 1. KMD can allow a mix of sync and async only if there is a disable plane req on sync and no plane update on sync flips along with async flips(maybe on multiple planes).  KMD will send the flipdone after sync plane disable is done. (Basically flipdone will send at vblank)
>>> What would be the point of allowing that? The compositor can't do the next commit before the sync plane has turned off anyway, so it can just as well do that in a sync commit and the async plane updates in separate commits later.
>> For an async flip to start, the 1st async flip will consume almost a vblank time, so if compositor does a sync flip on a plane along with sync flip to disable the plane, the next async flip will still consume a vblank time. If KMD allows disabling of a sync plane with async flip then we can overcome this.
> The HW limitation you describe makes frequent switching between sync & async flips infeasible anyway, so it's doubtful that an additional sync flip before async flips would really make a difference in practice.
>
> So this would essentially complicate the UAPI to avoid a vendor-specific issue, for dubious benefit.

KMD doesnt convert the 1st async flip to a sync flip, its just the time 
for flipdone on the 1st async can be upto a vblank time. If from 
compositor there is no such case to accommodate a plane disable on sync 
flip along with a async flip then will drop it from this series and will 
only keep the cleanup and adding of a new plane property for async flip.


Thanks and Regards,
Arun R Murthy
--------------------

