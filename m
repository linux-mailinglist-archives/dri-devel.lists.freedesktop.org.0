Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHshH8arb2miEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:22:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251AD4760D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873E810E628;
	Tue, 20 Jan 2026 16:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvedBG3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7891B10E635;
 Tue, 20 Jan 2026 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768926145; x=1800462145;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HMbzc1wL9X2VX9vsn3aizZlTrr5t3M0GCJWxwOCHAAg=;
 b=cvedBG3d+u9BP5WX5kbilmk2Dm01BmU7CR2k7ilnzyYaYl/3LPBIh9va
 zcK0AldXhVkz0Ap54IeCJk0JIozVyqezrbwsuhdSxb98gsUTAcLClH1cQ
 8f+VbZKc3ZsYxlMCBPGcg+ik6ew2iieDWz9467sOOvZYDifHYuIhE+TdI
 NiKK3LIdFexdxpjVMpKDrKM1sbZ2+5Uvl7GfeRkb7YnS+IQa69EPGwwb/
 LPlhFFS460GFfugOKnSEl4SxnrCC9XDSpAM2rC+Xx8vRWVPZdr9K9vhX7
 LhVwA2+RjcI3IHw/Le4Md7cWK4IS/SkCI8yRa7sh/sJB2xKr11YfFJ/NG g==;
X-CSE-ConnectionGUID: 23EUUYVXR5SK0O2f8CEhbg==
X-CSE-MsgGUID: 70UDvSKZTN+mMeqUszxyxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="73994492"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="73994492"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:22:24 -0800
X-CSE-ConnectionGUID: 361p19D7TraP3O/ph6tTuw==
X-CSE-MsgGUID: 4OfBKqKpSIS3PdzFHw35KA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:22:24 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 08:22:19 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 08:22:19 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 08:22:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rcp8+fqSevvltWu1fwVzLpROkJKCUCSprD7l8OaBWzQe9gHQIIQCGjNQ4BwFV1I83oUdoUiXd090ALp4ofW++G2r1v9BM1bB1O591FlND3aDStwfiWGMbL1/vq1/INks1/0LhQRz7Fn5sqV9uQsWHiiv0te0O94d0qKHVdBsdH+j0yHsmh7uheeChKC3N++Wolkd183YLa5v4dQeKpTJVb1s5MG4tnRGfJOfZq9iF/fkQypgGyGq94jZdvznCLRonc8MYZ7h69uPLpqAC9E6YLm19cKiFqeSMNI7kkF/7yqgzau96yoK4rfPi8QIILTDoCXvuALv5xPyAobbXsAZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bX7BZe4pEz40Nln9BbBPBwb0mUc1X30MkN4KTi9Us6o=;
 b=MXK1m9ZrhzT9IDDrndV+Six/1256o3su28b5k/GBKPmiS35xVIITa4nBIy2qPvlGvfGc6UpBLLi3k097795Fc+4Vi24LlJZGNFRCYwnX89tnnbOM36BTC54K7bGgDpfgCWdDAswZi1G+//00EVTpLMhKr8KVSUPih2xEGa1bK2sYlZXUeAJNrBtVIc197kmKDYnN2RCfDOC8sA+aVVI48XzyOsZRt4tQGUPsfQhZgmct90Wysy7uXYZQw1vhmCfiS53EdnT145TWTmwoZueFbRiud1GMxiFuSeg46NZGuHhB4p2GUdqmEF0D60m+gKo/m5rs4HXNgRtmTqGzuJG5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by LV1PR11MB8818.namprd11.prod.outlook.com (2603:10b6:408:2b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:22:12 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 16:22:07 +0000
Date: Tue, 20 Jan 2026 16:21:57 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v2] drm/i915/selftests: Prevent userspace mapping
 invalidation
Message-ID: <3zztbgcod4nqnh2ywwiembcqngtp7ib52wpv6x6fbb7brf2rv2@dfnmrbjlqsmk>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <5biajlwhi3oaep72si2dj2lhp2xwrpfa2gxqc2l36464uishjo@g26isdq64nv2>
 <3333011.vfdyTQepKt@jkrzyszt-mobl2.ger.corp.intel.com>
 <iblv3rpsvbxv5eic6i6nneanqdovuloprnksyxxgvkz5miwmdu@7usprrsui25o>
 <11414299.5MRjnR8RnV@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <11414299.5MRjnR8RnV@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|LV1PR11MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: c43dcadc-c626-40b6-d149-08de58400e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THZWSkNYVGZCQlJYT1lNRzY2R1JwQjMyNUI5ZVU0akt5akFpU0xkdE53N0RH?=
 =?utf-8?B?OThQNEhsY0RWZVhIU1k4U0NZNERnRmEwY1hrZ3dwMzc0dlNQZVBQcVFkM3Ra?=
 =?utf-8?B?VkFkZkxBU0tmRWxRbk9VWHg4Z0JWSEhab1NsZHFsd0ErVXhaNUtwNzdLSUUv?=
 =?utf-8?B?cXdNazRZcFNGYlF4VkFWVW5VdVJrazZ5TVRKa0NwR1lYMDJFUzlrbzJ0QWN1?=
 =?utf-8?B?RmdFUFJIMUpaZ1FwSHNOcFU3b2t0OFprLzlYRmh6cjVNaHZsU2dRK2FZV2NJ?=
 =?utf-8?B?YVptWnBydjNDdUlOazFVblFOS0dUK2N0d0ZkZExsMUZlZUpEU3luM2xZSjVY?=
 =?utf-8?B?TFBPamJ0d3c0dVJHTFZjYkxyK0I0ZGJRWXh4RW0yRWhvdzRuT3FqRXMyODhO?=
 =?utf-8?B?Lys1MW5zQ1VPemhMcStNZmVjdzJVcDJjMW51ZzRMZy9XMjBFVm9BMFNkQVRH?=
 =?utf-8?B?cURka3p0bENiR1pGNWNhczNkSmtxZkpXU1p4UVRWNHZWcGx5KzIxZUlNM3o0?=
 =?utf-8?B?aFZSTmlUQVVrZTNGY05aQ1BURmF2NWVEcTVQb09WQXBGTWFBVnR0a2JyTkdX?=
 =?utf-8?B?UjNuWFJiRjF6aWxMdjkxYy9UaGU4d1BxbUdzaWdDZ3h4dkNWa0FCa2h1ZllV?=
 =?utf-8?B?VmJuZGNqQ1JHZDdTSUprM2h0ZjBla3NCQ0tKYjlnVUpWQWRaMnNoVjhsZ2lk?=
 =?utf-8?B?d3BoVm5tM000NUI1YUVtRzl0bHJNQTdIZHM5Z1dIaTVVeENMYkJxaXRtVEp3?=
 =?utf-8?B?VTdGbHY4TnNZUTlKVHJBdW1DN0c0cmk4UFg1eGp2WVV2UmNKQ3lHc2krWFBN?=
 =?utf-8?B?M2lnMjJxNjhTZy9aam5CNTZSQUZ5aExqTFRGV3l0akhkcUlETlUwRFUxcGhr?=
 =?utf-8?B?WkhkTngwalpkZE84UGU4Zyt0T0JIcGJkdjNlSDZpZkE4MVpzWkplUS9vbFUw?=
 =?utf-8?B?UXN1NEFEQ1A1Ly8ycldDRi9TQkJqZ1orRnZSbWRYQjZENmh6dit4byt5Wldm?=
 =?utf-8?B?Z2RSbFZZMkVkNFVHN3BQRHFSaHMyZkdHdlVUZ1dwZlp0bnR2UEpqRWkva21o?=
 =?utf-8?B?Y2FNdTB3SEFoczdRbGpuR1ArSitNWTVJbFIyMG9YOW9TbTdZeDhMcVF5aURX?=
 =?utf-8?B?cm4vQ2dMVzBlbzg0WGNzbGdrVklTa2lHWmxEbkIrODV5bGdaTUg2Tyt1dUtq?=
 =?utf-8?B?Y2pleFlidnpKaUx6eVJOa29mai92RU8rZDgvQ2ZhQkp1SnlDUGNzTUc0ZUdD?=
 =?utf-8?B?RVJ3RktMUHR5bDN5ZVo1bnZMeVNQTTBVaTQzOHRJeGRYTmJTVDdCNVM1OWVF?=
 =?utf-8?B?R3ZQVnBJNTZjNFhUOHJLcWc5OHpKV1JWQW1TTnNYMG9LWDdiVDZqODZkNkN2?=
 =?utf-8?B?SmpHajlpWHF0VjdaV3BrMSsxOS8zdDh5YXI3bmVidUI2c1JmckRwWFJCT0xi?=
 =?utf-8?B?eHJva1hhZkR4dCt3ajlkMURweUM2TUdFTjNiMzV2VDZEdmYzczlycU1FWi8y?=
 =?utf-8?B?ZTNPbTJvK2dYQzQ3MlB2K2hwbEtCN2ZrazV2UHNhS05rc3dZZERVV3NMMGZR?=
 =?utf-8?B?UFBvL0Zubk9nL3lyZHV6Nk50WE1rNER5YkRVOU5yejdDZjdkR2M4M3dHdFdU?=
 =?utf-8?B?VHZGZHduUzlRNTlVV2FWZXhnQ1BzbzlaSnhwd2xpUTFXb2RYczZMclZjU0x3?=
 =?utf-8?B?M0VYNFhUMFl3STBXRHFSNFJjcDVFckNJRG9UQ2NOejNBMnBTeVEvMjV5Qnh0?=
 =?utf-8?B?UzA2T2J3cGZPaHVOMy81TDBTcHZ3K2Nqd1AwTDdNZ0tyZzRBcWczK1JrUmxl?=
 =?utf-8?B?dEM3SmVSVFI0UUwvRnErOGp1S0kvbjVENWVFTkRmMEI1UjR3WS9KWEM1UE9X?=
 =?utf-8?B?TTZMUjNtb21mbm5ubjV1SDAxbDJEbEZyei81RVJlOFVPdzBtRU5TUnhTc0RX?=
 =?utf-8?B?dXJsbjVWK0pObHkraFRpK3Q1UG4vMUs0VCtWTzFURnAwa3dNN0wwUTRMUzJn?=
 =?utf-8?B?SUhWS2VQb2NBT1ZVdGhsYTNRekxaTHVaZnhiMGFmR0hGVVVqZGYvSmsyejVI?=
 =?utf-8?Q?qA1jOE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFc2c0NabEZEd0RMOHNOVkh6UU9QWHJWVXAvR3lSNENMV3ZpNU1RMWNaNzF5?=
 =?utf-8?B?MFgvODQ0cG16bEVFbUNZTEFKaXh1SHorTmtNQWwyaDVDSFNPTDMvcTFtK0Nn?=
 =?utf-8?B?ZkViVHREZWVJREkrWUJMTEN0cnd1c1VtblBRWU1LYzI0ZStCU1ZTbDBwMW56?=
 =?utf-8?B?dXI4emJ3Zjk5SFQwMFdRM1hFaktKa0ZEKzJycldGWlpNL0NZbWxJT0JwaVJq?=
 =?utf-8?B?bWRzeVp3cGdOaGZybmx4MUFpam9WaXN4d3dMUFBnYTB3ZFF3dWw5azFZN01p?=
 =?utf-8?B?dmlHb2VVek5Rak55NG5WNWZxckQ1dDU3ek9vZ0x2RzYzby83dmhCWFVNZU84?=
 =?utf-8?B?RmZjdUFseDEvc01YYThvR012djV5N0ZJUzFPSWd2bTFWenZ3b3JMNGMxTDkr?=
 =?utf-8?B?RkVtSzdOT21KQUlxbkFibWswM0RadXFwTnRLUjYvbE5kTDRNRmVMdUpuMEtL?=
 =?utf-8?B?OVVseGY5UWtmRzNZTVVNb3BwVTFjOFNPd3dmU21HRGlEM1RkWGlMVWlneERo?=
 =?utf-8?B?QlpJa3J2VGdJRWdUc1E1OGw1RFRlTC9USjNIVTFIeEd6azdnS3k2eFVWTnoy?=
 =?utf-8?B?S0NGTkVCSGR1OXk0clJZaVhOYVF4UVJETURwQ0Q2Zm5kNXA5MzBjcVY0NmIy?=
 =?utf-8?B?bk1vZGxEbzU4b1h0Y1JoK2I4TFpPZVRuMldaVklRSFNONnlZbHA3OGpSaHdP?=
 =?utf-8?B?clNwTGZyWmRzdW1XOTkrYWxZbkNWeWFwYnVXR3hEVW13U2Z2R3ZsMFNna202?=
 =?utf-8?B?bjJMZ0FzQ0NGNEo0N1p1NU1JSzVGdGRmeXZUTStTRUFRSk9XTFZqcVNZVGMr?=
 =?utf-8?B?UStMd2FjcFA4L1lJbDNDTEFYWUVCZXlIbVFjWTVLbXU5dDMxNE1RL1JveVBJ?=
 =?utf-8?B?WUViTTBhRTdEbzBsMFhSUktCdnVGNTFOQXNFYWJBTGFIbnhSMFJhVTBrQWI5?=
 =?utf-8?B?WU5tZ01VYjV4K09nOHcxOEVVOGRnQXZ1TmVSV0dBTnVsSURudHBzc1VSWmhU?=
 =?utf-8?B?eGdsazloUWpWTEtwTGIwZnhKV3F0MHVIVGM4eDlYVFRTSjJRVld1SWZxMi9o?=
 =?utf-8?B?SVdqQzA5Y25haElJRDIvRXFjbU9ML3JmTktBMXZGUUtrUEtVdWxDSzlFQ2ZN?=
 =?utf-8?B?Z2kybUpreWMzbGUxYTFYSE9KRG14TldIRTJmTXBYMks5NmNFZWkvUFNDbXl4?=
 =?utf-8?B?L3dxWGRjZVdHRkVZb2dnVGs0VXRseWdGUUZ0YmMzQ2h0b2xZaDllRHZyc3Bq?=
 =?utf-8?B?c2Zkb1ZJejh1UHhpMGQwY3hGaVRqWUZBeGdpM0labXFEeU0vMWQvSHIrVU1s?=
 =?utf-8?B?RStSSFRRMDF0VE01b3dibXdMNWZHUDAvMnVJOVljQUZqMWtUenFkSHRUQ0Ry?=
 =?utf-8?B?SGcrNzRMS3NwUExFUlZneTlMbUxEejNEaWoyc3VxKzVoM0J3clNLNTdyZzNv?=
 =?utf-8?B?RTZOWWlZRk1EV1NDK1plQTJNNUZVMEJCcEVKYTYrMFZic3VkUFpGSC9BY1hO?=
 =?utf-8?B?cFpOd1FOOU1SM3lRN1laSk0wS0w4NmtoMG1ZL1N6RTMvYitweFkwYlprTjlj?=
 =?utf-8?B?L0ptNHN2MFhoUzgzZFJRRkdKMG1qZ0dWcTZVYllxZ1MxbHZ6M2NYUFJab3Zu?=
 =?utf-8?B?RkFzWERUZmJTOGFKcVBSdTZ3YktLZnpyVVduYkN3RlVNZkg2L2NxQWd3NmF4?=
 =?utf-8?B?ZWdTUlJVUm9YaXVxR2J3NVg2TThDdUZVWThFNWtZVGhDR1JjcTdVb0FVNW5U?=
 =?utf-8?B?UG5GeEQvWmJGM01DNk5oZkFscUtCWXJpTEtFcFlKSkhNcndHZTY3Wjgza3k4?=
 =?utf-8?B?WUcyY3U1cUVFL1hocmIzeTVnMDRZQzVLcG5EUjY2RGFOSXVHL2xHNXhwSzFi?=
 =?utf-8?B?aFZMSjJ5ZkEyc2ZNSDVna0wzUlFDQlJreTNsb0E5RDd1K1hNeWNQNDc3K3Bp?=
 =?utf-8?B?a1kwcUpiNUVZLzVuRW15aGdVZE51eDRxcjJKdENIME5tMjFGTzRuNmRDd3BY?=
 =?utf-8?B?bUpTVEpYalc4YlFCcHZXQmd6VGgwMnVjVjZNUFEvVGhrT3cwYlU5RE9wdzBC?=
 =?utf-8?B?bWNncVZGNTFJenBTa21zbHlKbHVBbDV4QkJlY3V0eUxOdHl5blQ4bFhuVHkx?=
 =?utf-8?B?MWxOZnUyWS9BSUdyZjJIQmhpWUl0WTZXbWU3cHNuMVNaRXNJelJkeGdoeUlU?=
 =?utf-8?B?OHd3R2NtTEUzdk5yV3oxM2VLbGI2Ry8zT25zUHpSMjFJME1WOFhtQ0pFTVNW?=
 =?utf-8?B?UHFLWmJSL3BCS3hZdHhOOEVkSG05M3hWdG94NEtPUnlvajIwV1hSd1crMjc1?=
 =?utf-8?B?Y0hBckNZWGlqQ3dldjI4ejhKemkwVm5sbzZwdTBJbWRFNWExMFlVZlVVeXFt?=
 =?utf-8?Q?R8/GwKNksAckv9q0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c43dcadc-c626-40b6-d149-08de58400e57
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:22:07.8707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Jjb7crIx9YPx23wsvj79MucSNewxkgCwSQJHcSeK1w/ptmz06Er7Toi7BIaoTLNIbwx7JVGyV2384+rV6N1aO+A/RsomD6I4sCFz6NIuY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8818
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
X-Spamd-Result: default: False [0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,intel.com:dkim];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.karas@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 251AD4760D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-01-20 at 16:05:29 +0100, Janusz Krzysztofik wrote:
> On Monday, 19 January 2026 15:56:06 CET Krzysztof Karas wrote:
> > Hi Janusz,
> > 
> > > Hi Krzysztof,
> > > 
> > > On Monday, 19 January 2026 11:16:02 CET Krzysztof Karas wrote:
> > > > IGT mmap testing in i915 uses current task's address space to
> > > > allocate new userspace mapping, without registering real user
> > > > for that address space in mm_struct.
> > > > 
> > > > It was observed that mm->mm_users would occasionally drop to 0
> > > > during tests, which reaped userspace mappings, further leading
> > > > to failures upon reading from userland memory.
> > > > 
> > > > Prevent this by artificially increasing mm_users counter for the
> > > > duration of the test.
> > > > 
> > > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
> > > > Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> > > > ---
> > > > During testing I also found out that this problem affects
> > > > another function, __igt_mmap(), which also utilizes userspace
> > > > VMAs.
> > > > 
> > > > v2:
> > > >  * use mmget/mmput() (Jani);
> > > >  * include __igt_mmap() in the scope;
> > > >  * change comments and commit message;
> > > > 
> > > >  .../drm/i915/gem/selftests/i915_gem_mman.c    | 24 +++++++++++++++++++
> > > >  1 file changed, 24 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > > index 0d250d57496a..82ab090f66c8 100644
> > > > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > > @@ -916,6 +916,13 @@ static int __igt_mmap(struct drm_i915_private *i915,
> > > >  	if (err)
> > > >  		return err;
> > > >  
> > > > +	/*
> > > > +	 * Get a reference to tasks's mm_struct to artificially increase mm_users
> > > > +	 * and ensure the kernel does not try to clean up the userspace mappings
> > > > +	 * of the current task during the test.
> > > > +	 */
> > > > +	mmget_not_zero(current->mm);
> > > 
> > > What happens if that fails?
> > This cannot really fail, it may return false, if no other
> > references are currently held, which has its own implication
> > that I overlooked:
> > if mmget_not_zero() returns false, then we probably should not
> > call mmput().
> > 
> > On the other hand, I observed that the issue does not occur if
> > mm_users is 0 since the beginning. The problem only arises when
> > we go from mm_users == 1 to mm_users == 0.
> 
> How can you explain those two different states (mm_users == 0 vs. mm_users > 
> 0) possible on test startup?
According to Documentation/mm/active_mm.rst:
'To support all that, the "struct mm_struct" now has two
 counters: a "mm_users" counter that is how many "real address
 space users" there are',
and Documentation/mm/process_addrs.rst:
'All VMAs are contained within one and only one virtual address
 space, described by a struct mm_struct object which is
 referenced by all tasks (that is, threads) which share the
 virtual address space. We refer to this as the mm.'
mm_users represents how many threads actively use the virtual
address space, so for value 0 that would mean nobody uses VMAs.
This makes sense, because the test does not perform operations
warranting user registration, we just hack the memory a bit to
get a mapping. The only thing that does not sit right with me is
whether we should be running the test with mm_users == 0:
 1) if the test breaks due to reaping userland memory, then
   that means something had to initialize this memory;
 2) if the number of users is 0 from the beginning, does that
   mean the test uses some uninitialized or already freed areas?

For the case with mm_users > 0 things work, because there is
already active VMA at the start of the test, of which reference
is held by another user (thread).

The proposed fix gets rid of those doubtful conditions when
mm_users == 0, but I am ready to investigate further to figure
out why the test would work without virtual address space setup
if there is a need.

-- 
Best Regards,
Krzysztof
