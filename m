Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B47D7AE4B2F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5208310E438;
	Mon, 23 Jun 2025 16:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oeccqc1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0669D10E432;
 Mon, 23 Jun 2025 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750696940; x=1782232940;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wSI8r6xRf07K2Jms1Va/uNraZ2//hZd+bgRYyzwOlfo=;
 b=Oeccqc1tQFfjV9NrVyWqoVdxtj3+uN0fDNURljKZmu9SOkYCvDPZkz/6
 izUggxMzLzOsoSK5bRwmVBuwIfRbBzHn6tvDM9GtQalQmIohp+qsxe3CL
 ROG4YIlkAsCMo6Otqgw+vR+BeEWg+rzmK0nNhJdvZTP3cdijhCaYiYL8e
 UjUFZkR/R32riO0G2BSk06V+CZ1ceutt8swqXdHoYNqKRHsjxGhS/j2Bh
 o8siBul56F4d2TMbJotEw5BzL+OmXPgk9dlVXq9w9jWEJEiOd3i47+ROm
 75BN31H9yvDkOoO7Bjgw+C3bC9/d6kx3rogRDNp9DIqK22PzC19ZQMPXU A==;
X-CSE-ConnectionGUID: WJkT2HvCTfGZmIHrBHvCPg==
X-CSE-MsgGUID: rkVuBEAOS9+EpKcVbEtnIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56720161"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="56720161"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:42:19 -0700
X-CSE-ConnectionGUID: CIhRgqZ7Sii8Z0Cv0sGXtA==
X-CSE-MsgGUID: WPOvOQBxSN2qAkKlrHVeZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="188868727"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:42:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:42:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 09:42:18 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.40)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:42:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzomF1rFL3GZKF58f6vsiNMTm1Ttc9oaNAW5TrZhgVSXRnxNlVgd8MwEerLqeXoc3xNUbQlBB0Qzz2Y0wNX5gYCrqo03O5VfDt3qIGHiy7Pecbu58mwlPAc7a1lVWzzgDvxCAZWS2f2cbLura8c/bRBiIos/8FZVyaX9QRPOo1tAaWafVQnGuFTLUKA8hYLQwk4T92UodPoeeqO+9CENBpPaOnF5hjyZFF8p0HPhGG1A4kXotBZhtcMfxUNaxzJQMf7ZbM1tSuiTYnc37i7+kW9i0MTM8Ceoxs1mXUobRqBF0xfgNJoCGPIHX5RUUZ40Nc247Pi/z3ep0VPMjyAxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJMc4gsIBFt5nkkGzOQXeijkQbvFyT0AtFq4qNKu34M=;
 b=mvsxvBkz0XjTIHtmHy91K/K+VN/VCgIIXVtz4bxgCQwK1VOtorxoa1zHNg3iSxFs6OUgkqGprVrBchFSunw7ucgrrxjwoQDU4NA+tMftkKPgTap0TDKnY/85X9W+JPZNu3mAfa0PV5y+c2NParNq1DtFpjRi1Zm5OyIfy3CeqfwOyc+ygeT3peB6A9QepE34PZ8ErfABSvaUJLsKFCmTPmjHOyS5fWyIertsV1RMDl/eoKCboFEBsOUtXkoIEHWcNi36Le7i2flhiz4JvDJWeq2zPY8vaXbRVL1NxqoMuai2NWpD9yDc7UKo9cVAgdF44cVrvOxFkXFLauF8o0hmlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 23 Jun
 2025 16:42:14 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Mon, 23 Jun 2025
 16:42:14 +0000
Message-ID: <f1d8b7af-8933-455c-a6fd-cae935ff24f2@intel.com>
Date: Mon, 23 Jun 2025 09:42:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] drm/xe/xe_late_bind_fw: Reload late binding fw
 in rpm resume
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-7-badal.nilawar@intel.com>
 <2c4f410a-3abd-4abc-84c8-13e7e3b40a73@intel.com>
 <a8d2605c-930b-4eeb-8e4a-1aa9bbfbb960@intel.com>
 <6733693f-64b2-47fa-97ba-4ebba3edef35@intel.com>
 <bb2f68ff-e7bb-40ff-94bd-8ac7cab422ed@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <bb2f68ff-e7bb-40ff-94bd-8ac7cab422ed@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: e2983ec9-7be8-49f7-7504-08ddb274e8b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG9YMWRsUnRtdmZtS0JhcHVMYUd4RFlOQm9WMzZ2eGFpM05TOG5veVArZGJi?=
 =?utf-8?B?amFsVFdXMjBxcC82TVh4UXl5Si9CSUpxc0Y5YXVMNmhkNUhKbnVqN0V1VmtI?=
 =?utf-8?B?VlVkcktQZk9veCs2RlI3MnFyVXlLc2dSdlhhTFBOeGR6dkJUblB2RXJ5aDc0?=
 =?utf-8?B?Q3BMcGpXa2Nac2NSRVJPMXdXYW9ld3VGQU1hSlY4OUFZbmVhdkxyd2ZtMjBn?=
 =?utf-8?B?Wk1oWkxGYXREOTFSMXlRWWZta0xFVEtTMklYSkxVTmh2WkV3a1BoMzF2WHdn?=
 =?utf-8?B?c1gvSXVRdmFoZjhsMWNaTjVRNnpVcytxc0F1VU9BelorRTJLVTE4NWxadURC?=
 =?utf-8?B?QTJCOUJ6NnZEN0VrVytod0pwTitRazgyVkhXV200VlVzMlM5UG02OElSN1pF?=
 =?utf-8?B?UDZrWGVub3MzWnRKNm5PbXdxRjlRUnNDb2ZiRGhoTmVaN3pRUmttakFFd21s?=
 =?utf-8?B?czZmcktFTDZvKzh4bjVYL1BsVnY5R3FDVHFxcHJxeWErWThuU1JtZzZpalk1?=
 =?utf-8?B?UkVHQ1Y3dWdiTFQvN3Ftd0xJOU9VbktvMnJMbVdVeERkTERSNng3MU5yUlNa?=
 =?utf-8?B?UkltSk54eDd3a1oxb2g4MWlhTmlSWlI1RGwvR1doVjlIaldNN0ZPc1ZQT29L?=
 =?utf-8?B?VlErLzlDdmJwKzRrR2dFWXJuS1FYZCtaaXZBNG5NY2J0UFRlbHlpUUNnTnh1?=
 =?utf-8?B?UzZWN085Ymw0SHdWZUt4YTEyYThpUnh1S2EyakgvbFNIZDVKZGFLNW1UMy9y?=
 =?utf-8?B?ZXBYYTBNSUwyUHhMT3Q5bVQ3V09jVitHZ1FKN3VhdFJsWndiNHdpZ2pLMHJy?=
 =?utf-8?B?SXpiK1F2UVJlQk52WmFhS2ZJaEc1Yko3VGZsMHh2TnIxYnZrc3pGbE9SVE0w?=
 =?utf-8?B?UEI5aVFvY2NZeCtOS0d3ZDBvTSs1VmovUEo0bEJLazU4UU8vbXZ0bTNGOTFa?=
 =?utf-8?B?N2FnQzU3VlZxcnFYdGprYkpvTlcxWDQ2cDQ4WUVEdnRTbzJObGpzbnFoNDZk?=
 =?utf-8?B?NXZBWWprRFdhRWw5eE5tMi9WMVVhZW1hbUZPc0RadlhHMVduRXQvSlRwdk10?=
 =?utf-8?B?dGRKSzNzYUlRNm1OT0IvcGNtVXVZdzQ4d1NVb3ZOZkFKRWFtUE9QdHV0L1F0?=
 =?utf-8?B?emFIN3E5UFVaK3lsU1d6MHJTK1dVTjdvaW9Bek1MQmNHYmFlSVpTcjRrbEhL?=
 =?utf-8?B?WkNncjdsV0VNTDFGb0NMK1NjbzVtbFhGT0prNnhBOEZVRW9WQ1JRamZVYU04?=
 =?utf-8?B?S3dtQnhKaEVOdG5JdldZblBYK01KaGtKZm5GT0IzZm0rbEIxc3EwZDdkSTQy?=
 =?utf-8?B?UnRkZk5iL28yOGxZdzJZLzFxQTUvOFBrdGpQNXVhb2w2bU5DUWZTVG9NS0p2?=
 =?utf-8?B?TS8vODRxbUN3WkdaZmltWnhGcWk4MWZqOEkza21UZkhWWi91cVY3azVTSGxY?=
 =?utf-8?B?WlJBcXNvOHRNc0tGNTZBUUxtNjRkTjVFeGRlVmlydlB1MytySVpDcWMyaDVC?=
 =?utf-8?B?TllHa2xhMFkyaDd0enlIb0dnMEVDbEVlNXVmUzBPK3U3VmNMNkJ3SE1ZT1JD?=
 =?utf-8?B?bzZGeXUxbFpIU2x4ZzJONkE3SmFoQ0ZPa2tEV0d1bjQrMjNGSG5ra2R1UnBs?=
 =?utf-8?B?QlljNW0xZVdxTXVhblNxbnVsRW5vQkJWNjBwU3EwcTltdzUra0s0QUozbWpE?=
 =?utf-8?B?cDBkQVJLRmt6UHNGR3YxY0gwVlduU2JybDJYbFg5N2d4K1gyQ3gzSWQ5OXpR?=
 =?utf-8?B?Yi9BMjFVZUtTN2pRYzBwYU1JNWZFbUltMXdNUVhIVXNpZ254R1ZvWHcyOVhM?=
 =?utf-8?B?NGExMnA1bmRhM2JXVlZVV2ttWC8vY3hIVXdnQ0hSaGRLMW1lcC9iekllejhZ?=
 =?utf-8?B?Zkl2WjdmTHV5RWIvczZZT1ZuNWozc1duckNPVTBLLzN3UkNMR1ZhM0JGMmht?=
 =?utf-8?Q?ytD49D8mhw4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnJ3T052dEhNNXR1Z0RqY3JBNUlHWW4rUldrMnlycHF5MllDUWtiUkxVSDE2?=
 =?utf-8?B?T3pmcjd1aERRcVRHWkVUbHNpU2lkUDVOdy85U3NwclczRVJEbncrcEVNSjdn?=
 =?utf-8?B?Y0RXajJWZ0E0dldwRnVoS0RKdnRpWndRWlRMM2Z3M0EzWVFKOGwrMG82Z0Ir?=
 =?utf-8?B?Njl3RkFkRnBSbEZSZFZIaWpHKzFEY1RoVU9yeVZIVW5HZ0xCQ2RLVzAwelA5?=
 =?utf-8?B?NWdocXdMdzlTdTRDc3BlWTZKdnpLUWNwYlkyOUk0SHhYWWttSDJ2elAvSEVY?=
 =?utf-8?B?OGV4V0NZWjJnVFhLTmRPSU1WNE81c3NOSlJjQ3locSsyN2U0K0xsMGdGc2Rq?=
 =?utf-8?B?cElYcU5TYVdOcGt4c2tnYmtRZGpLT1FLanN3SW8weVZVK2N0VzFjOXNJbVlj?=
 =?utf-8?B?bmJGcmJET3RLOHBqaXNjSDZ6dEhEUTlScVI1TzNQMjFqdldzL3MvM0ZBQkdt?=
 =?utf-8?B?c0U5cjlDUWpEaVF3NDZlUFRuTDY4eldlTG9xMG52dHdKS01zazJEY3RaZWdz?=
 =?utf-8?B?ejExNkVCN2ZIYko5a2RuL3R3QlVwQ1dDa01oRUJzK0l2ak9rYnVJa1hWVjAv?=
 =?utf-8?B?UW5CTGFoTFFLNFcvUUM4VUhiM0FPRURvSGE0a2xWUGtTVGFNcmZ6U1BiM1lS?=
 =?utf-8?B?SmVVN1pQa3JCVE5yT3pBRFBZVnJJNDI4a0c1TGNJbjAzR2I4UmFQRjF1aTVX?=
 =?utf-8?B?TmRYQktiK2VRV1kxQXhCMTdmaGNxSGRIOVRBSUs0TDRTZkloMTdZaFZTUFY3?=
 =?utf-8?B?QTRSZFBaZzJ1bXRpRTdiN1gzbjB0MEVOTy9SQTVPWFNGUkM3bXFGNUhQTGhP?=
 =?utf-8?B?NGtpTTMzTm9TR2x1V0lVL1BkOWRBOFpqUitaSzBwSlp0c3hJZjQ0eE5KQ0tz?=
 =?utf-8?B?NHd3NkZwMjBsZ3pCZ25neHlYK1NKZ1BXT1VTTFFBYVhVdUthUjgvSmc4b0Nx?=
 =?utf-8?B?WWpyWVVMLzhZbW5zMUQwd0RFL1VIVVIrcHlHNHNEclRIL0R0WUxvMEhCaUxu?=
 =?utf-8?B?dEF0ZnN2a1JxY2EyMm96UVF1Q0RSWjV1WndsNGFUVXdLdnRETlFRVjU2L3l1?=
 =?utf-8?B?T0xqaWQyS0s0RHpkSDhJUm9TZm9GVVpvb013U21iZnY1YnhQV043cGFqQ08x?=
 =?utf-8?B?SVZjWjJyaGVSL2xGTEdvOG5xbnVTZU00ZnFHTlFhQ0VGbmgzRmZwUXowcFBi?=
 =?utf-8?B?N0hYTjgrU2R1b2JGMmRnN0VabHNXSnQ5UEl4YXUxZUFFM05wVVdCaVRmYnRQ?=
 =?utf-8?B?TUw5SWMyZGl6TTE1dnlLam5ocFRjRlllSHlxRTd0U1k5SUgxdFdDYXRRZU5z?=
 =?utf-8?B?bDRhalRKWHZZbTk4cHlTU2lmRVo2dEVXNHYxZndXTmpSRHowK2pjeEpCL1Bv?=
 =?utf-8?B?cXRWZXdoaHZLWlNxNCtyampXV2RLOVZtQldsck9wRW5NK3c2aU1oTDJyam9s?=
 =?utf-8?B?bVJGUnk3SU0xNGhTNXpXQnFtcStiN256TWlhZ3NvTzFLd0x5VkxBOEx6OVhx?=
 =?utf-8?B?S21BTzRHWDJNakNFcFZHM1R5YUYySWZ1Y2JML0RBMWZVRnhmdCtpb3oveWlu?=
 =?utf-8?B?VWNWaHNMRnB4aVNhNnN0VXRwQ2ZQbHFJUXI3QmsyTWxkeTUzWWp5SzFSQWlp?=
 =?utf-8?B?czRoYzhaMyt0N0FLV3BtaHVvNVBjSU5CMDc3SUFJZXNQck9kWWhSV2RpZzhJ?=
 =?utf-8?B?YU1MWlN3aGFTOFlMTHRwNTRjYmZuSmxyMXMzVFpBMytVSmtrcFJRSTRpOENZ?=
 =?utf-8?B?V29mUk5VWk5NZGlYVGZkd2tiN05DUjUvUFRzeUNuSlVJcHlEbFhzN3R4TjYw?=
 =?utf-8?B?ZWFkWm4yTHVGMmNKQ2duZXZVRzVXYjY2NFNSOVZTdzB3N1Q4MzFkb0VHTXlU?=
 =?utf-8?B?VVlNWnl2eVNSbER4ZDJZMXdJQWxWWC9iWDdwNHFjTmV6eDZTK1BKS1l0VkEr?=
 =?utf-8?B?Y0t4a1NBSkdtYTVaU3VJNm9Va3UyUm1ZVFdIYVFhMnJLSURiemQxQkd6bzZn?=
 =?utf-8?B?aG5OWXBDa3RmRHRIZklqU1puM2JLeVpSSlRVQ0VyWkx6NCtBZ2s2UmNkQkFB?=
 =?utf-8?B?dm5JaHpOSUFZanN4WVdKdXpvcnBhSFNCYUVLcXd0dWgvTzlrNGZaTkU3TDRH?=
 =?utf-8?B?aTB2WjFlbWtqc0ZrNU1CU3Y4QW1Xa0RDSDJ0RHk1cm8zQUVDL0VNdUtrZklx?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2983ec9-7be8-49f7-7504-08ddb274e8b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:42:14.7835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYQi2Nlmv++VVz4iwvg+C3ioT2hnN8YtDpXBzzIHS8/AQ+U10ZpslccAVtkLk+h4k8Rd81Ljwqonxk59DqB8hz6bOX14sWguIfyxg6EDreM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
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



On 6/23/2025 9:11 AM, Nilawar, Badal wrote:
>
> On 23-06-2025 20:56, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 6/18/2025 10:52 PM, Nilawar, Badal wrote:
>>>
>>> On 19-06-2025 02:35, Daniele Ceraolo Spurio wrote:
>>>>
>>>>
>>>> On 6/18/2025 12:00 PM, Badal Nilawar wrote:
>>>>> Reload late binding fw during runtime resume.
>>>>>
>>>>> v2: Flush worker during runtime suspend
>>>>>
>>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
>>>>>   drivers/gpu/drm/xe/xe_late_bind_fw.h | 1 +
>>>>>   drivers/gpu/drm/xe/xe_pm.c           | 6 ++++++
>>>>>   3 files changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>>>>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>>>> index 54aa08c6bdfd..c0be9611c73b 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>>>> @@ -58,7 +58,7 @@ static int xe_late_bind_fw_num_fans(struct 
>>>>> xe_late_bind *late_bind)
>>>>>           return 0;
>>>>>   }
>>>>>   -static void xe_late_bind_wait_for_worker_completion(struct 
>>>>> xe_late_bind *late_bind)
>>>>> +void xe_late_bind_wait_for_worker_completion(struct xe_late_bind 
>>>>> *late_bind)
>>>>>   {
>>>>>       struct xe_device *xe = late_bind_to_xe(late_bind);
>>>>>       struct xe_late_bind_fw *lbfw;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>>>>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>>>>> index 28d56ed2bfdc..07e437390539 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>>>>> @@ -12,5 +12,6 @@ struct xe_late_bind;
>>>>>     int xe_late_bind_init(struct xe_late_bind *late_bind);
>>>>>   int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>>>>> +void xe_late_bind_wait_for_worker_completion(struct xe_late_bind 
>>>>> *late_bind);
>>>>>     #endif
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>>> index ff749edc005b..91923fd4af80 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>>> @@ -20,6 +20,7 @@
>>>>>   #include "xe_gt.h"
>>>>>   #include "xe_guc.h"
>>>>>   #include "xe_irq.h"
>>>>> +#include "xe_late_bind_fw.h"
>>>>>   #include "xe_pcode.h"
>>>>>   #include "xe_pxp.h"
>>>>>   #include "xe_trace.h"
>>>>> @@ -460,6 +461,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>>>>       if (err)
>>>>>           goto out;
>>>>>   + xe_late_bind_wait_for_worker_completion(&xe->late_bind);
>>>>
>>>> I thing this can deadlock, because you do an rpm_put from within 
>>>> the worker and if that's the last put it'll end up here and wait 
>>>> for the worker to complete.
>>>> We could probably just skip this wait, because the worker can 
>>>> handle rpm itself. What we might want to be careful about is to nor 
>>>> re-queue it (from xe_late_bind_fw_load below) if it's currently 
>>>> being executed; we could also just let the fw be loaded twice if we 
>>>> hit that race condition, that shouldn't be an issue apart from 
>>>> doing something not needed.
>>>
>>> In xe_pm_runtime_get/_put, deadlocks are avoided by verifying the 
>>> condition (xe_pm_read_callback_task(xe) == current).
>>
>> Isn't that for calls to rpm_get/put done from within the 
>> rpm_suspend/resume code? This is not the case here, we're not 
>> deadlocking on the rpm lock, we're deadlocking on the worker.
>>
>> The error flow as I see it here would be as follow:
>>
>>     rpm refcount is 1, owned by thread X
>>     worker starts
>>     worker takes rpm [rpm refcount now 2]
>>     thread X releases rpm [rpm refcount now 1]
>>     worker releases rpm [rpm refcount now 0]
>>         rpm_suspend is called from within the worker
> rpm_suspend is not called within worker. First device will move to 
> idle state, then via auto suspend flow it will be runtime suspended, 
> all run time pm state changes will happen from rpm worker.
>
>>     xe_pm_write_callback_task is called
>>             flush_work is called -> deadlock
>>
>> I don't see how the callback_task() code can block the flush_work 
>> from deadlocking here.
>
> flush_work, as per my understanding, will wait for work to finish 
> executing last queuing instance. It runs the worker from the same 
> thread it is being flushed.  So how deadlock will happen?

My bad, for some reason I was convinced that we were doing a sync 
suspend, instead of going through the rpm worker. You're correct, no 
deadlock here.

Daniele

>
>>
>> Also, what happens if when the worker starts the rpm refcount is 0? 
>> Assuming the deadlock issue is not there.
>>
>>     worker starts
>>     worker takes rpm [rpm refcount now 1]
>>         rpm_resume is called
>>             worker is re-queued
>>     worker releases rpm [rpm refcount now 0]
>>     worker exits
>>     worker re-starts -> go back to beginning
>>
>> This second issue should be easily fixed by using pm_get_if_in_use 
>> from the worker, to not load the late_bind table if we're 
>> rpm_suspended since we'll do it when someone else resumes the device.
>
> Yes this makes sense, I will take care of this in next revision.
>
> Badal
>
>>
>> Daniele
>>
>>>
>>> Badal
>>>
>>>>
>>>> Daniele
>>>>
>>>>> +
>>>>>       /*
>>>>>        * Applying lock for entire list op as xe_ttm_bo_destroy and 
>>>>> xe_bo_move_notify
>>>>>        * also checks and deletes bo entry from user fault list.
>>>>> @@ -550,6 +553,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>>>         xe_pxp_pm_resume(xe->pxp);
>>>>>   +    if (xe->d3cold.allowed)
>>>>> +        xe_late_bind_fw_load(&xe->late_bind);
>>>>> +
>>>>>   out:
>>>>>       xe_rpm_lockmap_release(xe);
>>>>>       xe_pm_write_callback_task(xe, NULL);
>>>>
>>

