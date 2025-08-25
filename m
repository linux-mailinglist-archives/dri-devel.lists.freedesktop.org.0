Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78015B33C99
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 12:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B5A10E426;
	Mon, 25 Aug 2025 10:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ef8udeK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3448B10E435;
 Mon, 25 Aug 2025 10:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756117602; x=1787653602;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=fZHVRDMy1e1z4MX0ODTixmpYN0INWm5rPVLkeqfueoE=;
 b=Ef8udeK9ZbrQICKGL9a/Fm00gYY0uB7kzjwc6vOFZvZa78eg6kIGJb78
 jaNqRok0W5nT5qE7ZkDynMP+aXE93yuF/sHRE6dGPGSg4y4wQjjOc9VG/
 ynFvHhIAjHEUTFW9fTi07ACAqRdYqcXivhlLKKRk++7wTWg28lH6SbImp
 IMtG7Khe3L7CZKDMQ46mGC1c6WTiE33K8bIC8U0fnw+ZZNbGXa/mUej4N
 /0dsOpQ8SW2uKp4ecevUdZp29TdkN70w9eZZ0s+Ozh9Fa0W1+GNrazz/H
 vvrmBcB2q/WoBiaAZJ0L8bBkbSIrYqNqBn6O+PS9pRvw578VgTDd9g73n w==;
X-CSE-ConnectionGUID: xGRHZJEFSYSIBt/bZ/Jp+A==
X-CSE-MsgGUID: kbbeMghmSeGPnacCnErW5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58395919"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208,217";a="58395919"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 03:26:42 -0700
X-CSE-ConnectionGUID: w5N3iDaoSraCP7faMhsJlQ==
X-CSE-MsgGUID: Uj0hnW3SQG6k+XMEcuqcug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
 d="scan'208,217";a="169162958"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 03:26:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 03:26:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 03:26:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.54)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 03:26:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUTj8EQC8MBPeVZ4m7UJdxAMP2bSNveNNYgJhX5M/CBbOGWtxSJPJnIF1SNIpGyHsEY3EBPT3pZfDBMP7+u+e9ybnPiYhD3eY44xiDWvsRmk2Z6dnI9ElQyh+qDxiGRLhqnPC2VbYcyt9cZ5g9yIbRp7UxBLJyt1/OFOxL4JqyS9OJklddcvRvHiibAfZpGRO5wk5r01tnLx5PxJjoCClPaQJLSkqJ7t0rdsOgEKSlJcjRkYV3OraeGD10c1nwsBdRHsad//nT6m7Lp/hc/JI49NIGcETe+7fmz6pDlcz4hO71ZCkLeDChR1UGAur+5nztLN8stvtBEij65CdR7N0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5z/FZ67/RItgliKUyTPqIkO/Pc9x/YF0YKfvTA5j/Q=;
 b=xzy45MCjaiUKGU3zvGuW0noHI06KsKxYIUlENx6pVWsUa9NA7CWeKKuxkfBIZGM/r+q+SSBAi+KtnWBCPutB0g1atU72V8MyWD/OZPV0tIRgbBYXmkLEYh0+12QMrFRAKv7mMDDSoknj45kNEwbwFpM4wnZEK5X1zSWgcp4dztFb4TPFg8Gwj/tuM1tSkx2PUL6vvn3SqjQkiFoFScpD53KfuBhZIg3lZ72YR2JyVhFPxTCJhbOwQUqk3vJiujxe1VeFcMdjabRW84TnC1i006kEeizHyX7nRRul6jcf6btwiy9Ep69AtBqwqpde1/yZz1db6VttSpNm/CigFv0QGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 25 Aug
 2025 10:26:38 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 10:26:38 +0000
Content-Type: multipart/alternative;
 boundary="------------yRZV6W4oZS3zHysEBPTckbUy"
Message-ID: <5da7167e-c3da-43f7-a809-bc68f2180e8e@intel.com>
Date: Mon, 25 Aug 2025 15:56:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: Define user readable error codes for atomic
 ioctl
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, <naveen1.kumar@intel.com>, 
 <xaver.hugl@kde.org>, <uma.shankar@intel.com>, <harry.wentland@amd.com>
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-1-13a0e8f2c581@intel.com>
 <8f24c0051cab99aa5f399dc3b6eb6dd2fb1e8b6c@intel.com>
 <12e88f43-98eb-43aa-931c-edac88d650aa@intel.com>
 <419591dda7158b3d56c40aac0df86ca499202676@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <419591dda7158b3d56c40aac0df86ca499202676@intel.com>
X-ClientProxiedBy: MA1PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::18) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SA2PR11MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: d027fe1e-2742-43ba-5f6d-08dde3c1e017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blhDRGZGVEZrUHVkWWFPZXdOL1Nib0l6V1ZPQzVGNEpaN1ZoaE03RGRGbzBM?=
 =?utf-8?B?YzdjYWt5TThCbWtsamR0TTVtT084L2MvMnFmditSSEFZSVJJdGN5amVFeFYz?=
 =?utf-8?B?OVJaVlhiSjR5RDZ4YTZNVDd1ODZaNU41d1NDR3F4QW1BWDdFWndaeGJWc1ZV?=
 =?utf-8?B?b3M2ZCt5VVY1TEZkcmtCUm0wdTlTb3hSNWFVYzZEN0tHdUhFVHB0dkhJeEcr?=
 =?utf-8?B?bFlPQWxCcmFYbFp4dXU0MC9yVEZVR3Y0Ymc2RUwwK2pyNGttVFRucC9BMkh5?=
 =?utf-8?B?QWVRY2FxYjFJdTY3ckpIVFJRYWU5OHpsTnNITExETFZ6L1NOSTFDdzVnOFNE?=
 =?utf-8?B?OGZ3ZENRRjg2Kzg4Sm5hRi9aTC8zQnJQdUJ2ZlNCd2hhRjNLcmdIWVlTbkFs?=
 =?utf-8?B?cFVFWElsdzM2NWdLNDRmbmpBdU9Ub1dSemhEWS9aLytxN24zeklZd0Vkbjlj?=
 =?utf-8?B?ZU9nSmkvS2l4bGVwRnpXVVd0N2NrcklrTE5PRnFwRS95djdNeG4wZmVKYTNG?=
 =?utf-8?B?bEFNR0VrVFJJVzdLQy9CclZDY282QThzMXQ2RTUyY3Z4Y1pCZ24ramxsL1Qr?=
 =?utf-8?B?OVBKWUJUc3YwQmI4TUtUNFo2MXRSVTEreHVobjY4Zmd6cUVSTGFNRlZza0Zo?=
 =?utf-8?B?THJnK3IvSjNXN3JWRWovUTVVZnl5enhLRmUxclJkeG5SN0Mxa2hSSjZXVHNI?=
 =?utf-8?B?eXVYSWtJU2NJNHJKMTd6dlI3L2hXa2tDcTZjcjdYaDNRZFV2Nlp5M0VMcEdh?=
 =?utf-8?B?OVVmcy96bk1nR3p3UXgwenVRbVFtelZpM1dWWFFWNFVoVEJZRE4zeUhVWEpz?=
 =?utf-8?B?SmdjT2QxWEx4d3V3UWRsTVNHUUI2aEk0SElVZ0lOWE4rMjlmZjkvWHd5VU9O?=
 =?utf-8?B?elNKWGRIY1dWUkZWamJEc1BvVER4YzVBK1NkYTdZQ3VOelZ1bkhMQmR6Ti8v?=
 =?utf-8?B?b0JldWxodko3ekRpSk94M2kxVnlPdkcxL2FBbSs5ekdWV280TnRsRjhpaHlr?=
 =?utf-8?B?TnROb3RTRzFBOWxoVkdOa1FQZG9hc1FGTnFkY3IwWU55cEhZQlFEbjdOZGVk?=
 =?utf-8?B?YlcwOGdFZmNPdDNtcEdkMTVNNzRoNFF6cE1JN2FnQWdVZGlvVkdiTnVxSVV0?=
 =?utf-8?B?dUsyMGw1N1plRlpVcDVtWGFhOG9wRnM5S3p6c2FZZ3BqbkJsMDMrVWVkZ1NN?=
 =?utf-8?B?WE9TYmJtV3hGNVphNnBIUUtjeUJKUTJ6S1hFYkpwSjgxaVAxOVEvSEg5TzRP?=
 =?utf-8?B?dmhUMjRpK2Z6TW8yeGdjcWUrL1BIOVNPUVN0REdGWnF3MDRYS0huYklYNTFt?=
 =?utf-8?B?VG12M0NjdzRic1o5bWVvWXdFVzZtQVJUbXZrUTdvKzJtWHZRbW4zSE1oSGM1?=
 =?utf-8?B?bUFWaktpRC8zenNHMWtkZjZ5R09CYzBjYmVDV09rNmdIRlgwUXcyeVZUd1Zs?=
 =?utf-8?B?djZ5VkVnU01OYnNiR1V3VHlVUktUb0tiRXhFK3IyVXl6NENrL2pBNmVid2Qw?=
 =?utf-8?B?WWp6QUJzeVdscFF2YTZrOVkxSWpTUzdwK3dXdnRLUlg0TXZYZitFalRDdWc1?=
 =?utf-8?B?K3VJQXNwdHJ4K1JMaDVxblhmVUFSMUtnL01IbGFDNDJ6S09KVm1RcUdad3BW?=
 =?utf-8?B?MFVFdnhZOU5hTk4wTm9MclBDaUtPcjFRTVo3RUt0R2I1Q0MrYldCVEJJcm5m?=
 =?utf-8?B?ZGU3dWFzcDZzYnh5bExiNVAvWGcyWTE2RnNnaVlWNGVsSGZWZDZ2VTg0ZnZ0?=
 =?utf-8?B?RC9QQlpST2dkSUNVQjdBYlhQOGVDbGRJamprWUZrcVdTY1Brc2hlQ3dhcmY3?=
 =?utf-8?Q?p6JTfiUCETtSuPavaxPllaPD3jxLwPChs+PKM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlJ2eW4yeU5IQ1YwZnRHS1RFVE9xeEMzRlNIeHowMDMvVHc3aFAva0ZsS29j?=
 =?utf-8?B?NnVieXdzUktmNmRsWGlvNytLZlpCUnk3bW1OTVd5SjlQM0NTbm4yM2h1OGJ5?=
 =?utf-8?B?QnE4MVNNMjFscHhnSlhFUGp0NXdHbjltY2hnVm9GSXUxWU4wcGZuRlV6dnU5?=
 =?utf-8?B?SEx4YUdsSGJwMmNDRjBxSWlHeUE1aGEwQXR2VHh5WGZ2cGdDL2VUYXVaOTds?=
 =?utf-8?B?ZUxEbTNDRitmaS8yaU40U0I5SWxqUVYzQnRUeFhkenY3dkN5aW5XODI5c1Ev?=
 =?utf-8?B?djVmUUNieHJtcWtLQkdSc3pRRzVFUHpmYlB5OUZpYzNGdHRZR0hhVUpmRzdp?=
 =?utf-8?B?ZjF3cXV2TzZncjhXekc1MmtONVQwNTNqbTdZRVhBSWNTMEJFRmZLQitQNENJ?=
 =?utf-8?B?aERQVEJoS3JPd0RCdW13cUxVUVZSa3RlVE5YNklVdkRFNVN5cWlhY252ODEv?=
 =?utf-8?B?Z251WHZZdEIxNWtZd295azVCUU01YXZMKzJyOFVEbk5tSThNOUZ0U1FPdFls?=
 =?utf-8?B?NnJTYkExQ3o4K053aHBVNE5zQlBOZFh6a0ZsVkRMekIyeGw3eTA1cFZjVXF1?=
 =?utf-8?B?Y1Vrcm5pZGYyUlhWYU82dlNxQmpDbU1yWEVGajh1M1VoSjk1VFlxOWRjYzBI?=
 =?utf-8?B?OU5ESHByenVWaDRneFFmcHdYMGFqZkxrQ1RFVG12Zjg3YktMRCsvaW9LaFU1?=
 =?utf-8?B?MzBzSHRxQ0MxWll1MVQ5YnF2RGp6QjB4bXVjWEZ6aGpHRVpwajVJRHF3dXNC?=
 =?utf-8?B?b3JkWFZWOC81MnJsTnZNYXQxSHhodFcwRE9FNEtZczJpRnBEeWVuQ0pGcTd4?=
 =?utf-8?B?VDdJQWlFdVg2cTNvM2VpUlNZOUpiTUpCbHliUFcvQ1o0enVadEl6dnlJRmxY?=
 =?utf-8?B?dGtaV21iY0crMnVnL1U5N2VRYUd0RThic0JJL1QyNUtQc2g3S0oxRkF1bjlm?=
 =?utf-8?B?VG9ZQ0xLMzl0NFZLYXZjN3R5bWMrSFJoM1dzQjdTci9PcFp6d3AzK3ZVWnYy?=
 =?utf-8?B?dTJLbXlsbTQwRUpHUHhpNXpVNGNuQnk3K3BCYUVLdWx0S2RmM0E3MjJBYm5X?=
 =?utf-8?B?WW5jdi82a1dmQlE0VFVEZjFQdnRaNEJoMDg0SkxFcjJ5aTg3V2YyMzFyK0RD?=
 =?utf-8?B?eVhPTXpKRE04bHRDc1NTY0hLQTE3bS9NVEY3OGczdDlMdkwxa2hJTEQzbXIr?=
 =?utf-8?B?WGw3R2Y0cGhPUXFBZU9DdUF1OXJQR0lCRWUxdDRsZFYwUHJ0QzdlNFNHSEE5?=
 =?utf-8?B?RUFwdXpPVHM2bTFVTHJsZXRhOThyQjQzT3E4eHZWUnhONU85ZmdFbC9GbFFD?=
 =?utf-8?B?MzhlM0NUUG91aWRSU2czemNZam5QNGFzdS9Pa0tzcldMN3FaUlpRd3I5OUE5?=
 =?utf-8?B?OFZKUHdtV0RlMm1tSVVhY3FySUpIZVIvVDNmTFdKcm9jN2w4akNzRjhjQXY1?=
 =?utf-8?B?cWFyVG45eDhadDNialllTm4wdGdxRHZNQ2pMSEFHTnZkaGZyMHhyeHRudnhp?=
 =?utf-8?B?VzAvK3pxdUNqVUtpeWh5enVQcEt2ZTd0eUg0NnRsTWZxOXlXZmhHVGRkdmZ4?=
 =?utf-8?B?eHNPTnY4Y1pMb3ZUL3lSZlZGL3lZVGxjeTM1Z0NKdytZTmxRRzhRekVLQ3o3?=
 =?utf-8?B?RjN3VC9JVno2ZWkxNzZYakdiQ3ZkaVZFdUhNejdPZWxkeXh0WFVMNXdlTEhn?=
 =?utf-8?B?U2ZzMDduZWR3Y2VMejR3SzNNd3V4UXZpaWJOTkN6ei9Gd1BuK0dMVGZFR3hH?=
 =?utf-8?B?bUluVHlrWlQvMTNBSUt6UFU4alI4NzJTZWVyNHhOL21NSExlaUF2WW9tZFo0?=
 =?utf-8?B?K1hEeXp6OFdsUldJM1lyY2xNVkJpV293QWl1UDNoM3JkZFU0YXhoNGJCS01m?=
 =?utf-8?B?R2ZiaFhiZUhqb2w3YTBKeHJHY1pDMGYyRWtPMGtqVEFFb0xKNkhLMGxqWGlI?=
 =?utf-8?B?Y3FGdk9pQW5aOFJjTVhTcE9pWkdjcVNsU2Rla0taVUVDN0wweTZQakpObXdh?=
 =?utf-8?B?SUtEeG93WFBQbzl6K2wzcXFsa3g2c2hRZmxxb0VzelFyWUFIT1FQZEc1TTk0?=
 =?utf-8?B?YzN4eUNCUjYyWVRHODlvZHpUNnhSYVM4dlkxZTR1Z05tWWhtLzg5OXlFQzdS?=
 =?utf-8?B?ZUt2bENzQ1Mxdld4Sk85R1NBYjh2MEdBc2VwL2ZaZFZwQzRRWDc1dDdBWFQ3?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d027fe1e-2742-43ba-5f6d-08dde3c1e017
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 10:26:38.5820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nw8KMxGBgMcHmDQ8EqYc6JQWrB/Nh33dzjyEiO8Qs9aeS6pKz61F/VTcYzKrTfbGRMr9J6SHUmQoS8BjgKBew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4938
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

--------------yRZV6W4oZS3zHysEBPTckbUy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 25-08-2025 15:14, Jani Nikula wrote:
> On Sat, 23 Aug 2025, "Murthy, Arun R"<arun.r.murthy@intel.com> wrote:
>> On 22-08-2025 16:07, Jani Nikula wrote:
>>> On Fri, 22 Aug 2025, Arun R Murthy<arun.r.murthy@intel.com> wrote:
>>>> There can be multiple reasons for a failure in atomic_ioctl. Most often
>>>> in these error conditions -EINVAL is returned. User/Compositor would
>>>> have to blindly take a call on failure of this ioctl so as to use
>>>> ALLOW_MODESET or any. It would be good if user/compositor gets a
>>>> readable error code on failure so they can take proper corrections in
>>>> the next commit.
>>>> The struct drm_mode_atomic is being passed by the user/compositor which
>>>> holds the properties for modeset/flip. Reusing the same struct for
>>>> returning the error code in case of failure can save by creating a new
>>>> uapi/interface for returning the error code.
>>>> The element 'reserved' in the struct drm_mode_atomic is used for
>>>> returning the user readable error code. This points to the struct
>>>> drm_mode_atomic_err_code. Failure reasons have been initialized in
>>>> DRM_MODE_ATOMIC_FAILURE_REASON.
>>> At the moment, I'm not (yet) convinced any of this will work, even as a
>>> concept.
>> km_flip test in IGT has been run and is working fine with these patch
>> series. Also
>> the existing kms_atomic test with atomic_invalid_test has been modified to
>> test this error code(https://patchwork.freedesktop.org/series/153330/)
>>
>> Am I missing anything over here?
> Having a few tests in IGT does not mean a non-trivial userspace
> (compositor) can use the information in a useful way.
>
>>> Even so, I'll comment on some of the choices in the series.
>>>
>>>> Signed-off-by: Arun R Murthy<arun.r.murthy@intel.com>
>>>> ---
>>>>    include/uapi/drm/drm_mode.h | 42 ++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 42 insertions(+)
>>>>
>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>>> index a122bea2559387576150236e3a88f99c24ad3138..f0986a3fe9a7d61e57e9a9a5ec01a604343f6930 100644
>>>> --- a/include/uapi/drm/drm_mode.h
>>>> +++ b/include/uapi/drm/drm_mode.h
>>>> @@ -45,6 +45,7 @@ extern "C" {
>>>>    #define DRM_CONNECTOR_NAME_LEN	32
>>>>    #define DRM_DISPLAY_MODE_LEN	32
>>>>    #define DRM_PROP_NAME_LEN	32
>>>> +#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN	64
>>>>    
>>>>    #define DRM_MODE_TYPE_BUILTIN	(1<<0) /* deprecated */
>>>>    #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN) /* deprecated */
>>>> @@ -1157,6 +1158,47 @@ struct drm_mode_destroy_dumb {
>>>>    		DRM_MODE_ATOMIC_NONBLOCK |\
>>>>    		DRM_MODE_ATOMIC_ALLOW_MODESET)
>>>>    
>>>> +#define DRM_MODE_ATOMIC_FAILURE_REASON \
>>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_CAP_NOT_ENABLED, "DRM_ATOMIC capability not enabled") \
>>> Please don't add macros that expect other macros in the context. They
>>> become very confusing. Just pass in the other macro to use. See MACRO__
>>> in include/drm/intel/pciids.h for an example.
>> Here we are mapping an error_code defined as enum with a corresponding
>> string
>> using the X macros.
>>
>> Anyway will have a look at the macro in include/drm/intel/pciids.h
>>
>>
>>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_INVALID_FLAG, "invalid flag") \
>>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC, "Legacy DRM_MODE_PAGE_FLIP_ASYNC not to be used in atomic ioctl") \
>>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY, "requesting page-flip event with TEST_ONLY") \
>>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET, "Need full modeset on this crtc") \
>>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_NEED_FULL_MODESET, "Need full modeset on all the connected crtc's") \
>>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE, "Async flip not supported on this plane") \
>>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED, "Modifier not supported on this plane with async flip") \
>>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED, "No property change allowed when async flip is enabled")
>>>> +
>>>> +#define FAILURE_REASON(flag, reason) flag,
>>>> +typedef enum {
>>>> +	DRM_MODE_ATOMIC_FAILURE_REASON
>>>> +} drm_mode_atomic_failure_flag;
>>>> +#undef FAILURE_REASON
>>> This is a uapi header. Do we really want all of that macro trickery here
>>> in the first place? What's wrong with just a plain enum? (Or macros.)
>> This is defined as enum. We have two separate list one for enum and
>> other for error message(string) but  upon user adding a new
>> element/error_code in the enum, there can be a possibility of missing
>> adding the error string. So have linked enum with the corresponding
>> error message/string so both are at a single place and upon adding new
>> entry will be easy for the user.
> I think the overall point is this:
>
> a) If the messages are fixed for each enum, there is no point in passing
>     that message across the ioctl. Userspace can map the enums and
>     messages directly.
>
> b) If the messages are not fixed, I see no point in having the above
>     fixed messages at all.
>
> c) If the messages are not fixed, but you want to have default messages,
>     the messages do not belong in the uapi header at all. Hide them in
>     the kernel.
My intention was option C, wherein have a default message and the driver 
is free
to overwrite the default message string if required.
I agree in that case doesn't make sense having it on uapi, will move this
inside the driver.
>>>> +
>>>> +#define FAILURE_REASON(flag, reason) #reason,
>>>> +extern const char *drm_mode_atomic_failure_string[];
>>>> +#undef FAILURE_REASON
>>> Data is not an interface. Don't expose arrays like this. Who is even
>>> going to know what its size is? Again, uapi header, where does it point,
>>> what address space is it?
>>>
>> Sorry missed adding documentation for this. Will add in my next series.
> Documentation does not fix the issue that data is not an interface.
As pointed out above will move to option C, and will get rid of this 
failure messages
in the uapi.
>>>> +
>>>> +/**
>>>> + * drm_mode_atomic_err_code - struct to store the error code
>>>> + *
>>>> + * pointer to this struct will be stored in reserved variable of
>>>> + * struct drm_mode_atomic to report the failure cause to the user.
>>>> + *
>>>> + * @failure_flags: error codes defined in drm_atomic_failure.failure_flag
>>> Flags? As in a mask of multiple things? Is 64 going to be enough for
>>> everyone, all conditions in all drivers?
>> Should be more that sufficient, this is an enum.
> Then don't call it "flags".
Done!
>>> OTOH, what's the promise wrt multiple reasons? Practically all drivers
>>> bail out at the sight of first issue, and it's usually pretty much
>>> meaningless to continue to figure out *other* reasons after that.
>>>
>>> And this brings us to one of my main concerns on making this fly:
>>>
>>> You bail out on the first thing, but you can't expect all drivers to
>>> check stuff in the same order. It's not practical. So different drivers
>>> will likely return different reasons for virtually the same
>>> condition. So how is userspace going to handle that?
>> Most of the error check is in the drm-core and these are common across
>> the drivers.  Upon drivers sending driver specific error code, the
>> compositor may not be able to handle the error code. But in cases
>> required compositor changes can be added so as to handle them. In
>> general the generic error conditions that are met by compositor and
>> for which compositor can take corrective measurements are listed down
>> first.
> I think we're going to need a handful of error codes for starters, along
> with compositor changes that make meaningful and benefitial usage of the
> error codes.

Sure will narrow down the list in my next version.

Thanks and Regards,
Arun R Murthy
-------------------

--------------yRZV6W4oZS3zHysEBPTckbUy
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 25-08-2025 15:14, Jani Nikula wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:419591dda7158b3d56c40aac0df86ca499202676@intel.com">
      <pre wrap="" class="moz-quote-pre">On Sat, 23 Aug 2025, &quot;Murthy, Arun R&quot; <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 22-08-2025 16:07, Jani Nikula wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Fri, 22 Aug 2025, Arun R Murthy <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">There can be multiple reasons for a failure in atomic_ioctl. Most often
in these error conditions -EINVAL is returned. User/Compositor would
have to blindly take a call on failure of this ioctl so as to use
ALLOW_MODESET or any. It would be good if user/compositor gets a
readable error code on failure so they can take proper corrections in
the next commit.
The struct drm_mode_atomic is being passed by the user/compositor which
holds the properties for modeset/flip. Reusing the same struct for
returning the error code in case of failure can save by creating a new
uapi/interface for returning the error code.
The element 'reserved' in the struct drm_mode_atomic is used for
returning the user readable error code. This points to the struct
drm_mode_atomic_err_code. Failure reasons have been initialized in
DRM_MODE_ATOMIC_FAILURE_REASON.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">At the moment, I'm not (yet) convinced any of this will work, even as a
concept.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">km_flip test in IGT has been run and is working fine with these patch 
series. Also
the existing kms_atomic test with atomic_invalid_test has been modified to
test this error code(<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/153330/">https://patchwork.freedesktop.org/series/153330/</a>)

Am I missing anything over here?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Having a few tests in IGT does not mean a non-trivial userspace
(compositor) can use the information in a useful way.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Even so, I'll comment on some of the choices in the series.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Signed-off-by: Arun R Murthy <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a>
---
  include/uapi/drm/drm_mode.h | 42 ++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 42 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index a122bea2559387576150236e3a88f99c24ad3138..f0986a3fe9a7d61e57e9a9a5ec01a604343f6930 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -45,6 +45,7 @@ extern &quot;C&quot; {
  #define DRM_CONNECTOR_NAME_LEN	32
  #define DRM_DISPLAY_MODE_LEN	32
  #define DRM_PROP_NAME_LEN	32
+#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN	64
  
  #define DRM_MODE_TYPE_BUILTIN	(1&lt;&lt;0) /* deprecated */
  #define DRM_MODE_TYPE_CLOCK_C	((1&lt;&lt;1) | DRM_MODE_TYPE_BUILTIN) /* deprecated */
@@ -1157,6 +1158,47 @@ struct drm_mode_destroy_dumb {
  		DRM_MODE_ATOMIC_NONBLOCK |\
  		DRM_MODE_ATOMIC_ALLOW_MODESET)
  
+#define DRM_MODE_ATOMIC_FAILURE_REASON \
+	FAILURE_REASON(DRM_MODE_ATOMIC_CAP_NOT_ENABLED, &quot;DRM_ATOMIC capability not enabled&quot;) \
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Please don't add macros that expect other macros in the context. They
become very confusing. Just pass in the other macro to use. See MACRO__
in include/drm/intel/pciids.h for an example.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Here we are mapping an error_code defined as enum with a corresponding 
string
using the X macros.

Anyway will have a look at the macro in include/drm/intel/pciids.h


</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+	FAILURE_REASON(DRM_MODE_ATOMIC_INVALID_FLAG, &quot;invalid flag&quot;) \
+	FAILURE_REASON(DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC, &quot;Legacy DRM_MODE_PAGE_FLIP_ASYNC not to be used in atomic ioctl&quot;) \
+	FAILURE_REASON(DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY, &quot;requesting page-flip event with TEST_ONLY&quot;) \
+	FAILURE_REASON(DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET, &quot;Need full modeset on this crtc&quot;) \
+	FAILURE_REASON(DRM_MODE_ATOMIC_NEED_FULL_MODESET, &quot;Need full modeset on all the connected crtc's&quot;) \
+	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE, &quot;Async flip not supported on this plane&quot;) \
+	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED, &quot;Modifier not supported on this plane with async flip&quot;) \
+	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED, &quot;No property change allowed when async flip is enabled&quot;)
+
+#define FAILURE_REASON(flag, reason) flag,
+typedef enum {
+	DRM_MODE_ATOMIC_FAILURE_REASON
+} drm_mode_atomic_failure_flag;
+#undef FAILURE_REASON
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">This is a uapi header. Do we really want all of that macro trickery here
in the first place? What's wrong with just a plain enum? (Or macros.)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">This is defined as enum. We have two separate list one for enum and
other for error message(string) but&nbsp; upon user adding a new
element/error_code in the enum, there can be a possibility of missing
adding the error string. So have linked enum with the corresponding
error message/string so both are at a single place and upon adding new
entry will be easy for the user.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think the overall point is this:

a) If the messages are fixed for each enum, there is no point in passing
   that message across the ioctl. Userspace can map the enums and
   messages directly.

b) If the messages are not fixed, I see no point in having the above
   fixed messages at all.

c) If the messages are not fixed, but you want to have default messages,
   the messages do not belong in the uapi header at all. Hide them in
   the kernel.
</pre>
    </blockquote>
    My intention was option C, wherein have a default message and the
    driver is free<br>
    to overwrite the default message string if required.<br>
    I agree in that case doesn't make sense having it on uapi, will move
    this<br>
    inside the driver.
    <blockquote type="cite" cite="mid:419591dda7158b3d56c40aac0df86ca499202676@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+
+#define FAILURE_REASON(flag, reason) #reason,
+extern const char *drm_mode_atomic_failure_string[];
+#undef FAILURE_REASON
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Data is not an interface. Don't expose arrays like this. Who is even
going to know what its size is? Again, uapi header, where does it point,
what address space is it?

</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Sorry missed adding documentation for this. Will add in my next series.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Documentation does not fix the issue that data is not an interface.
</pre>
    </blockquote>
    As pointed out above will move to option C, and will get rid of this
    failure messages<br>
    in the uapi.
    <blockquote type="cite" cite="mid:419591dda7158b3d56c40aac0df86ca499202676@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+
+/**
+ * drm_mode_atomic_err_code - struct to store the error code
+ *
+ * pointer to this struct will be stored in reserved variable of
+ * struct drm_mode_atomic to report the failure cause to the user.
+ *
+ * @failure_flags: error codes defined in drm_atomic_failure.failure_flag
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Flags? As in a mask of multiple things? Is 64 going to be enough for
everyone, all conditions in all drivers?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Should be more that sufficient, this is an enum.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Then don't call it &quot;flags&quot;.
</pre>
    </blockquote>
    Done!
    <blockquote type="cite" cite="mid:419591dda7158b3d56c40aac0df86ca499202676@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">OTOH, what's the promise wrt multiple reasons? Practically all drivers
bail out at the sight of first issue, and it's usually pretty much
meaningless to continue to figure out *other* reasons after that.

And this brings us to one of my main concerns on making this fly:

You bail out on the first thing, but you can't expect all drivers to
check stuff in the same order. It's not practical. So different drivers
will likely return different reasons for virtually the same
condition. So how is userspace going to handle that?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Most of the error check is in the drm-core and these are common across
the drivers.  Upon drivers sending driver specific error code, the
compositor may not be able to handle the error code. But in cases
required compositor changes can be added so as to handle them. In
general the generic error conditions that are met by compositor and
for which compositor can take corrective measurements are listed down
first.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think we're going to need a handful of error codes for starters, along
with compositor changes that make meaningful and benefitial usage of the
error codes.
</pre>
    </blockquote>
    <p>Sure will narrow down the list in my next version.</p>
    <p>Thanks and Regards,<br>
      Arun R Murthy<br>
      -------------------<span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------yRZV6W4oZS3zHysEBPTckbUy--
