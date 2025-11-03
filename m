Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBF7C2B0DA
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB8710E100;
	Mon,  3 Nov 2025 10:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oacx2Qbr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C4310E100;
 Mon,  3 Nov 2025 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762165825; x=1793701825;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k0CgR92e9TvxfabGjsjQyikdGT/W/DI17WR+jvWJCx4=;
 b=Oacx2QbrfmKCaafzMTIe1+xix9K1bHsUn5V222keoh2//sbsjULlxOUf
 kjAPeUol+RMMsS8GgrMWp/sSw8bZ/CeFZIq/9PvbOPceePQe9qiOGS30m
 1HbezMnuBYPaD6AHRRFrg+8Nmf6fIh6qX3RgUQb6CPHcZ8J7NBBck6yib
 ul3TdLmGvavzFp1VVQHvuwDNzoRcmJm56X2AzXuV9lmEFGBjHQLAJA3E/
 QG0ltEpns5JTNIYIGsaSB4FY/9m/yaVyo9fxAyJEQU6wUtvkyobQ9r8J4
 e0lVDNZm9EBY1f6BqEzf5hN1GI3SOGhcwaigecaIVsYDeKUxeF9lk1Wa7 Q==;
X-CSE-ConnectionGUID: gietvUnZROiN7rRaeKj7oA==
X-CSE-MsgGUID: 3DyXamDvQVSb0Zs7JP5uCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64141337"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64141337"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:30:24 -0800
X-CSE-ConnectionGUID: sv5cd3F/Qc+PW76B/y4n3A==
X-CSE-MsgGUID: HPiJPRIoTv+CmkcB/EG9vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186785789"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:30:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 02:30:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 02:30:24 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 02:30:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bktUqye5qmN/XsLaCgzf9OWgw6R0/PNTcDNkPERomSZ7/DIPWjc2/m6wYpSePs4neLepSUdX+07hlISIJTzDmFNxDqzqMb7bWFQBCTIfB2F7BMnWNN6mpVY/RwOcHVPGfzA6wgqwUidP62p7xWxqiDt4pwycr84w5LvoGskjm0PcQnrvhLaDNr5jpo7hsT0E6P7p+aRB0wWqbjeXI1F8pIa0/5sPZp58J/8Q/2hc94EOQFDnwCANVaB0nlUTnAlYGLV2BfZqcJBwmRb4NDSwyHGZgrfUm9mZkOKx2sAkda9+tjawbLfobNWOK0xKcQu1IknOsSCIHzTJV0hn7VUGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nC8RImrW/I8e5Qk94mCy16512INVV1bhX1x3qzrs7PQ=;
 b=o6OobvDmRC0FJEHkRRwLI5oAqyEy10Cwk2+eMAmx/zCyUhUgZRIAcRMX1RJyib/VrgBiWsoTIDxD4UHAH5eLaONJUv4wfvXl2JHuZUl+DYae+ZoHte6/A5Vd8wWrVRmuG/UzB2cgx8gNud/1zbMUOxt012WFWgx5Mj7/CISnGekbLATOyPtawh7bcsxwlemZwZamML1xC3RImxCkSvxZqR7ApkBGEUo+8vfUfwIZu+rWlq5kAz8/w0LGxSzaE0rmxtNxwE/iJYw1j2S9elbp64WGv0gsuJiRVw768nqvHMln7f78Tz0S3Mj0UoxYwMMXeWpCFdQK6N0iZ3okwkp0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 3 Nov
 2025 10:30:17 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 10:30:16 +0000
Date: Mon, 3 Nov 2025 10:30:04 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 2/3] drm/i915: replace use of system_wq with
 system_percpu_wq
Message-ID: <s7jsq4mbpkpon3stlizr3mc2nnwpvngmzvnqzfbeg252ua6gto@ohb7js3ufmmt>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251031100923.85721-1-marco.crivellari@suse.com>
 <20251031100923.85721-3-marco.crivellari@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251031100923.85721-3-marco.crivellari@suse.com>
X-ClientProxiedBy: LO2P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::22) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7793b8-eeea-4c1a-e514-08de1ac3fb1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTBNaklSdVdBS0MySkU3ZjBORVdDY1hXL2ozbVQyc3crSlBHVUFhZW9HWFE3?=
 =?utf-8?B?WUM3UFRsZUNpcnQ1amhJTHVnL1hIZEoxaHdpblVqK2prUU44dEVHbkl2UFJV?=
 =?utf-8?B?UXU4OEsxM2tXc0Y2WDFrYWluaktDcWxqb3RPSmp4bzQ2Y0VoOHJUMnlJVDdP?=
 =?utf-8?B?WVVrWXhMQUNpUTY4MVMvQnRrdG1hU0cyZ3N0MVBmdjdNUlVVS09DVzFiOWJt?=
 =?utf-8?B?c1Q4cU9iMjIvd1pXRWhZaHE0cGxaYjMyUkhsbUUzbm5SMklUR09zVVg4bFYr?=
 =?utf-8?B?UXlyZG1RQ2JSNnhtT2pjaTg5bkg4d2dJUHNFaTB4eTQvRVhkTkxEeXJvVTZL?=
 =?utf-8?B?cVFFbGRhWmxOUTdybFBvbTF4UWZjVXRjcm1qdzBCOXdHRk1iRWVrZXpiR0F6?=
 =?utf-8?B?Q0FPbmpIcC9KWTFsKzBqa2hFRytKVC8wSWp3UjNyV2hja3RCRXM2eDM4Mnpw?=
 =?utf-8?B?RmpBTjMzTER6WWg4K08wQVovMzVSUFhKL3JXaDNNVk9hdERMRGxzRVNXQW02?=
 =?utf-8?B?c2tGNjVUeEMxc0pRZTg2YTFCcDVPZDh1aHlaR3F5L2VsUXdzTTZyVldpZ2hO?=
 =?utf-8?B?REFhbGZjM1R1UXpUL0wwQXVCRFBHWWpGNk53VytyelM2VjFDVUErby9FM095?=
 =?utf-8?B?NzRYeXArMmo4ZEQzTlFBK3JRN25EY0JkY29ibEJGQi9QRnJ3TUV1RHhLWGgr?=
 =?utf-8?B?OGZaRTNKc2ZHWGFKaERDZW1CZm1seDRtczhra2Y5WHVqZ1EzK0N1bk1yVE5i?=
 =?utf-8?B?d2NST3pPWi94aDdIWkNRcmVkRHhZK0pwSWRxQ2kyeVYyNjdWYTkzODhHQkRT?=
 =?utf-8?B?eVhyYlVxS2xVVktJaHVSOUx4MlNaUnRYZUt0R0d1NHo0RHVKNThiK05hTVlj?=
 =?utf-8?B?d3liOGR3M1RCakIxMXZnVVVJOW1DckQ1M3hLUGxyREc0WDZQSGpzcm91Ymxv?=
 =?utf-8?B?Mk5IbmtldXdjSmNrMlVrQWtpVU1XclV2NUViSW9KN2hGcnBTa3IvdHI0eGZI?=
 =?utf-8?B?Y1hBMkQ2aHc5UmRrdTZZUkNoVUtvRVNoWVcydnp3ZXhIRVlzWVp3VUN1SHJv?=
 =?utf-8?B?NURNeTBkOGFQQmZWd2pCNmt4VHlJcCtsSnk3TzBiNzlXdm5BRVIyZ0RzTEU2?=
 =?utf-8?B?S0sxcG5heFZFNlhxbXNpdUFnb2xYSGlEbll2RlcwSGY1blFDT0M1dmJFMDdr?=
 =?utf-8?B?Z2ZaL2xMQUltZUpqSHQzWVJiakpid0NtV2poNnBZQUxZL2NvV3M4UDBrOXFO?=
 =?utf-8?B?aUZoOXk1UTJIdlhTYk5scGMrOUlHdHFBRnZyMDl0K3ZtTjZ0RkpWUFAzVllF?=
 =?utf-8?B?MGdNcnpLRmFVUTZXUVVqNWRkOFdWYm5UYmZZN3d6bkZFTE1OeTh0T1FDKzEx?=
 =?utf-8?B?aUdnVVAvWkIvMjd5R3o4MXBaMk9IZG9aNzAxWGNXazZZNENGZklJQXFOUVRk?=
 =?utf-8?B?a1JmWW1sUkZCQkFPY25ZNjZueU93S2VpRDJSWlJ2Q1pVU05nZnBqcmZIaFlX?=
 =?utf-8?B?aG4yNXQ5Z1QvVUpPNWNLL3pJYzZsS2NlY1d6M0MxUTA1N2hCak1NcG5JbWZH?=
 =?utf-8?B?aVF6T0cvV1pZa0Y4RWtOanVWRGxSU09UUzhLVlUzL1F3TFVkTnI0c1pvWTBn?=
 =?utf-8?B?NnRoL2UzTGNVS2VSU2tLQllqRkI2SUVCZlZTK3BmY0RFLzZRdTdWRkVUV0RK?=
 =?utf-8?B?R3NyaDBzTlg4QlNBUVhsTU1aNWpEQnpvYmtJTGJVamVJalE5K3NMbW9WSlZi?=
 =?utf-8?B?SHFDWHZVTTFpZEl6dmcvTEtsc2xGeDBvZENrclRIL2hMV0ZzbkROUmxQcEpy?=
 =?utf-8?B?ZWJDR2xKMlVIYm1IcmxUbUVOV1JqWi9GblNybFg0TEdIZmIvWnpyU2FjVko2?=
 =?utf-8?B?WU9RRXNySUhyK1JTZFQzMlBiWlMzdkREaWQyVTV3YjBreWZZT1czcGxFRWww?=
 =?utf-8?Q?zgTjBaNVsacEhEALV4WFYUGk6uwitRrW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2NwbVQ1dW9JcXp6QWlJZk92U1BkaXpqUHh0MEJseDUzMWNRWThlWTdBM2tN?=
 =?utf-8?B?V3cxQnMreUZxam9wd1Z5Q2E5OFZQRHUwV2haRGlPVXFHNElkRHIra2F5RVhm?=
 =?utf-8?B?K2JHYW9NNGdRYmlva3p6Y0ZtZWJmZnpTV2xkOUtRL2FuMm5CMmpQYzZueUVn?=
 =?utf-8?B?c0hDV01MUUs3cG1QRm5xY0hObmthanJsbTBGVkM4VjQrdUcydm9JWDRXU3U5?=
 =?utf-8?B?RlRuK0tBdERnTnRnWmhrS3FYU045dGRRKzZ3VUdaUHNqZ1NmZ2JpblVSV2ZC?=
 =?utf-8?B?OUFZaHB0YU5iYndLd0E1anJ3MHlTa2Q1aHJWcUViMlpUM2dpemhRb2dXZWdl?=
 =?utf-8?B?aEFTMlI0T0dsb1Jrb1BUZzNoSjIwbURoSmZTU0RSNWdFWUdhSFhrYzhGU2tE?=
 =?utf-8?B?a20zTjNRQnBmVU5YN3JLODFtR0RsbWJoWCtIa3ExemJrdEI0VXRlZWV3WHEr?=
 =?utf-8?B?bXo0TisvVkYwbjVrdEdXeDhkZzB4WmN2aDV5cWsyQjdyaVdOZE1ubWVXNGhN?=
 =?utf-8?B?bTFiWDYzc3BxQ3MwOUxJVGRDRllKbkNnTlNxWjQzNStzdFJ3bjNKSXBUSHBZ?=
 =?utf-8?B?T3RDUG0rdTA2aWFGbzZ3QWM1VmJLK3RhVXozRUVaK0tPcC9tbTI5NXJDdzJJ?=
 =?utf-8?B?d3NYdGNiZEVraFZwQUo4c1RLeFk2VXFKU0N6ajNzTTJsQUxpQ0dBbU1EbjRo?=
 =?utf-8?B?V0NZN3VZMlprV2lDZVhyMmQ0QjdrZVFBdi8wMGFSNG1Wby9vQ2ZGNjU4Z3Ry?=
 =?utf-8?B?MTUrb1hZc1BKdkNqR3dnL0FPblZNb1ZGcU5hOXVvZ1l4Sk9YTEoxbW9WUmov?=
 =?utf-8?B?OE5WWWd5R2FsQnJNWHRaZTRvQVBZZi92Wmx2K0M4SmJXV0kvVy9DL1FvUUZi?=
 =?utf-8?B?TnpLUm1tVGQrS2E3NVluaVZLS1AzRkxmZGJmcm8xTEJJZ1R0QXlaWHBYQnFI?=
 =?utf-8?B?ZmxFU1RoRnRiTWJNaEd0REZhSXBWTlRvdk5tbVZ2SWp4anRTZDlXcGpYcnpn?=
 =?utf-8?B?TE1aaENPSWNIVGpBUVFSL3lrTkhHYUkzYzdYUDdlNFJtZmYzYk5iNVFEb0FW?=
 =?utf-8?B?K2xmVjBFK1lHZ0M4bnZKanFVUEoyQi9rN3BGeHFCME54ZUdGZHNiczk3VFFN?=
 =?utf-8?B?eklKalVudmlkTzc5L3RmTmw2WFhNc3NXdXpKcEllYmtpUDVmT2F2WUVBWEpP?=
 =?utf-8?B?TzlEWEs1NHF2WVMxYXdRQmxBV2kxU04xT3hFUTVtZUxpS1BuYjBHKzdkK3JY?=
 =?utf-8?B?Ynk0RUpqTWd0N2JGSTloak8ydG1VM3YrZW9wa2VVZ1RERVFQUDNmaEJQL002?=
 =?utf-8?B?N3lVRjFtUURBaWQxMFpVMnhpbVFMSzRWVXpIdU8xUElwbEtWTDB0ZlZuNFgv?=
 =?utf-8?B?L3NlT3NnQzVoZ0xvcGFZekNUTkpRd2k5b2hsOHd4NTRNckttNXFXOCtyWWNP?=
 =?utf-8?B?TDJnRDA5MXhJQ3d4M2NOWEtFV2dJTDVGZFZ1VnhOUFRaSHMvVEhNVG1JalFK?=
 =?utf-8?B?N0toaVlKWGJnd1VIb29DWUNCM1M2Z2EvODBZK21VNDFXR3QzSEFaVGFsTTJw?=
 =?utf-8?B?VzhFeUU3VndVQ3JvQlE3YTY3alh4SWttS2E0RjJINWtESHVHQ1RlL1hCQyta?=
 =?utf-8?B?aWRZdU9oaE1VTU9EL2d4bk9SV0RCT0pYbzNhbWZCbiszcy81NmV4QVFlZXNQ?=
 =?utf-8?B?WVdTVUhZSEpDSlRWa2F1Z3AwK0NEcnV6OXdabFQyUzU0bnlkR1hrdWtXaE9L?=
 =?utf-8?B?SVc5RnJuOEpXLzZsQVJSalUvd3Rrb3hZRVk2V2hlK0prbTBZN1VHbVZIVGk1?=
 =?utf-8?B?MVAxZVhXeXZ4emQzbnh6NTQ5UzY1aC9mTGZadTArWEhscU9RdGQ3RXQ1QUV1?=
 =?utf-8?B?a3Rzc1B6Z2drYVQrRXhDZWEwcmt2a1BBcERMeDRhOVZxeWYyQ1NIbk1sRS91?=
 =?utf-8?B?ZXlVMVZjanJtNGpnUGFPS2hwQWJDMEJrWDhvU2l1ZzVsR213eUF1TTcxamov?=
 =?utf-8?B?VUpVODZHZ0ZGalQ3NkYyeGhnak9nNTJTd3o5UVpveGt2TkJZa3ppclVnL3Ba?=
 =?utf-8?B?aStlRWZpTUxXeHFVNnF0WUcyL28vMmM4QjJoeTlSb1VFSDBuUUNJc09UUTRX?=
 =?utf-8?B?amFpd1VGbVY4cldZR1lvRyszSG1vY0VMbGNKYlFPS0UxQWo1eTlid2lXaW9P?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7793b8-eeea-4c1a-e514-08de1ac3fb1d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 10:30:16.8511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKQFCtSwG6AjPH0cmIW1E/VkAwBzeRcaax3Ux1hs23TLDhaAI4LAk3VeljhWP3l08YKbnKhhsWTL12pag+DkAerp881egFiCwrL2p8QlJD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
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

Hi Marco,

you could be a bit more specific with your patch title:
"replace use of system_wq with system_percpu_wq in the documentation",
so that it is clear there are no functional changes.

> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistency cannot be addressed without refactoring the API.
> 
> system_wq should be the per-cpu workqueue, yet in this name nothing makes
> that clear, so replace system_wq with system_percpu_wq.
> 
> The old wq (system_wq) will be kept for a few release cycles.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---

[...]

-- 
Best Regards,
Krzysztof
