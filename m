Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC696ADF785
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 22:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2EB10E93A;
	Wed, 18 Jun 2025 20:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkl+d1zp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E8010E93A;
 Wed, 18 Jun 2025 20:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750277779; x=1781813779;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4RXjqEyvMK84tVx1ROzO+kk4sjUeEeAPDoQPhdpnQXE=;
 b=jkl+d1zpmwhG9n5z7Xy1f8cQBAdYGv5M+jCo40WOVFAXLWKpxj+/vOEW
 0vIqEz25UfuwAv5fpcp4VKlF2vNZ/wfGKFheqeKDUy4b+lNqtGuaHHdpG
 iGAO2L51+oYEyQ8uUpU9CHnnRLKpqhkOnRZcr2bOgvpUK44brP2d4JCTB
 49LOxco3P7Cke/G5QM134D3cHwnPUFZ4MpDfLTXm69Fe5UQFZixyCg8Cq
 yL3m+01pN34IxpjHi4g0lhXaIw63rBL2vzhU7hmEpLkv+uRPKKZhmRYKz
 cAwa25i17dIUykcTTe+XeOeCsGUMALcdF66DYxLJyPLevd/qnojJ4gJc2 A==;
X-CSE-ConnectionGUID: A2sy4/axRxmmYYya6vEtGw==
X-CSE-MsgGUID: Oq1u0N6TTz2YpOOT2pm7Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63195000"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="63195000"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 13:16:18 -0700
X-CSE-ConnectionGUID: yB4LEPxIT9mwk9Z5+4aTOg==
X-CSE-MsgGUID: boyuqVEqRm6cDpXZI1LprA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="149989614"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 13:16:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 13:16:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 13:16:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 13:16:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tnzx0GfubLPR2lRWcz7h9ENVL1ZQT4Vm0n90pmxHYQahaogwH/12mLTOin4OnWCRCEQOrWDulBPCgGLF6WnM14BTbe+z9ydIQOdcYj+0okO/2i60qGB5ZCGbnIyWlft/fACYsg72Y+Sz+sD3H0g+Spxqolwyfzih2NyicdrQa/sySXeiRqJY9CDiNViw8tWNUE6j/1mdwDsX2CWPgCA02Y/ZyBHxaKJtYKV1LVv6EvorxTjiajfk2i/FzyXqKIK5/k6XOXH0HD4xyOC/xiJgMM8TZvPVUkGO1KNf5COd11NkPS3yyXZzSGKXz8OVZN9tqkPRPc7vuIdXXQMwh1xNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdKUPstX1D3MmIhntXmVs9CEECFap2HvTTCPdYvp0tk=;
 b=Eqe+dVetegW6Kv7mEiO6jaOARc0pEbiC8hhSdbo6x2fksLVoZlAJgvL9y/JubaboG3rAsZ7PxX1npe3ZDqszLKLoM9zwI5i9yjgnin1wNzztnSnaAUtykno/ANbq60AWHY+9LjVZw1pnBY14UMv5QUdb62wxWS+beQJzxT75sV+8t4q/2dNYt/LXnEcvDpZTYaOxwiWRMyQXVwxyJ6M7U/M79lMhsmQSjmS6iWTPuiVoQnbvAMLew3vkzvgvlR59mQD4ZVe75xccAnpwDsfG8qoJviSFKeHz01e8a3S3waY35lukli1nifqzHxeU/enJA2PyJcScB8ZXay3QW+biEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB6938.namprd11.prod.outlook.com (2603:10b6:930:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 20:16:01 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 20:16:01 +0000
Message-ID: <31a5a8c3-0114-4471-968f-aef0b6d91be8@intel.com>
Date: Wed, 18 Jun 2025 13:16:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] drm/xe/xe_late_bind_fw: Introducing
 xe_late_bind_fw
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-4-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250618190007.2932322-4-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:180::15) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fbd0c1e-2045-4161-1b6f-08ddaea4f223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDVMdTFUNnBLYkhnZUt4TlplcXBnZTFTL0VrSUpLeklIa0R0T05FTG15RUZ2?=
 =?utf-8?B?N2R5b2VNVlZJUnl3N0tpSTc5dTRVNmtCc3p6RFQ2ZU5HbUcrcTYwSm91ajMw?=
 =?utf-8?B?VFkwYnk4dVp1aDRhZ29PZklSS2FleFE2ekp5dnZxVkg0L0JnTHp3UGR3Qkgy?=
 =?utf-8?B?bTJPZUV5WThBYStadGtPUW1XeVBuZ3lrRGZ6blNlRFlSS0QyWEdIVUJxQ0Va?=
 =?utf-8?B?ZGpaRVBSNmRoZDNVekllZ25aem0vYTNpZEZjWmtYdzdPc0RIaVdIT2Z4eVJ3?=
 =?utf-8?B?WW83a0ZRTDZCbThvQ2tSdXcrQWlmV0hYQlpud1U0U1pMbXlaaUt2VzdVK1l0?=
 =?utf-8?B?UXgzb3JZdjU5ZlByZG83bnJsNTdsMzRleFpXS0YzMlkrUzhYM3loL0RoYzBX?=
 =?utf-8?B?TXYwdFVxKzhRbUh1TUdGcmxEaGhOVnQ0Y3UrUU1UYStMSkVibkV5S1RJY3Q1?=
 =?utf-8?B?OVJPbXAwYTlGVEZVTk1yS05iQzNiKzBmV0F3RDZjUWRnQko0MjFXd3Z3QnZH?=
 =?utf-8?B?N3N5WGpsdEhsa05YQWZUOGZNZkt6MGxyaFF3QmpXOGZIQ3pMZFp5QTNXTll4?=
 =?utf-8?B?SlZZTG9wODNLNDhOOFFFUGU2VUpMdGZVNld0TXVMNlpCb2hjTVI4ZVpybFVS?=
 =?utf-8?B?dXkxVE9uOGozYTBuV2ZpR3VJZFh6S0c1YnJPRmErbWdFOFZWcmdqdVNwNGFP?=
 =?utf-8?B?OTlQQnNCZlNmZ25md0drMkl0aUkvNXYxQUtkcnZweVNVVGJ6QkJzRFRtR0Nu?=
 =?utf-8?B?WjJVNnl3VDdodXd1N2tSTk40RlVjbjU0a3JuQjd5dlZIMmRQeEQ1Z2I3aVlK?=
 =?utf-8?B?M0M0N20wQStPWVhWZzYxVHNLYmJvSURmbFhTdXdDTUEzR1NpTnV1REdlOWQ1?=
 =?utf-8?B?cTJ6SW9zR25iVGVhblNJbmd3WXdHZFI3U3dzajRKa0JNVHdUN3FmS3QxeFpM?=
 =?utf-8?B?SGt1a3J4WVRobkdKUzRuTVdYOVdjSnloMCtyN1Qyb3VpWkRhOXFWNHRNMGM5?=
 =?utf-8?B?Ymo5VCtQL0ZwS0hPdEl2Q3lDRExwb2l4bmxHRmIrOEUrYk5BY0h2VkwxZnpx?=
 =?utf-8?B?d2c4S0FRQndBcmVIZWxTZXloMktnTGVzVnRsSlVrWlBkc1NnK2lBdTB5TFRH?=
 =?utf-8?B?YjN1QnAwajZVM254MjNnRVRFZndKZGMwRmgzLzZTTU5xYWJ1akVEMHBKZHps?=
 =?utf-8?B?MWlvRGdoT0tTb1pNbkFxckg4bU4xV2xZVktkaHdkQkxtaHA2Sk1DeHk4ZHd4?=
 =?utf-8?B?aE5HTWNsb2RsV1NnTktYNlVwQ2RsMXhPaXRJcHFOb2R2OGtmWkV2RUt2aEsw?=
 =?utf-8?B?a1dUc0t1OCtPT2xSL2JYdTdNcGttTmZJbDg3bkFDUlBrbnQvdC95VG9DRVo3?=
 =?utf-8?B?aGNFbzJ4OERsQXNpQ09zVzBBakQ3bURWYi9wL0tpU3ZXdU1rV3lBRG9yTWxn?=
 =?utf-8?B?dlhTQ29lMkJmS282RXpDeGpRcE1MRWJ3VEtXcElwUUp1cHBWekhmcHBmWXly?=
 =?utf-8?B?ZER2UVBYejkvNVBhRE55aE5tZmlLSk40bmd6S0dscnZJVThFdGQ3dUFLM3Jv?=
 =?utf-8?B?UHlBcDU0ZHc1ZTd6T2ZBVnFiUm9kMm1IL21mZ0dLeUZsWW1JT2NhK1RUZGlF?=
 =?utf-8?B?QmhzdXFpVWtBNzN0Ymd6eEJ2dFZOMmF1ZTc0a2VCM1h3N0RQNWt6Q2JCS01k?=
 =?utf-8?B?K0g5UkFvL1RDSXZ2VUNyQkxQaXYyRHlnbHJ1bUFWNVlOQzE1dFN0aFlzNzBJ?=
 =?utf-8?B?c2hWQURLbnRvc09YSnkrY3BSbWptTmhoejVLMnQwNm9QZmpKYU54NWFJQWZF?=
 =?utf-8?B?dEdwcHQzd2FqY0pVRVBOeE83Y0tCODlwNWowbFMwYS9rN1VrSlBkOGdxcFdW?=
 =?utf-8?B?Ri9QUWxKaC81ZGxRTmoyOFNyeFhyUWdJVVR4U1VjYy9DdVhHb00wL0pvVjdr?=
 =?utf-8?Q?JiCJTs1KvzM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVVQMlNUSE5kcWhKWHEzcWZFOGNpQytLTGN3UmpOQ1FyUWxnMTl2VDVPWEoz?=
 =?utf-8?B?TDJkdGhPdjhtWTZWckdoNVlnMmFpTDJ0Ym5KM2sxVzhpekVzT0RXUVovYUpu?=
 =?utf-8?B?NWdqSTNmRW1adlVnZnJBbkYyR3Q4OEE3dzJxMkRmMHcwK2hjU3lPL3lGWitK?=
 =?utf-8?B?Q1VxZEVqT1p2dzNEV3JGZE1FUkdPOUJpR0tWM2tFTXp6WXh1OVdMUHZ0QUdQ?=
 =?utf-8?B?dGN2WVZqUWdJUUNsd2pqNTFramVvN3d5eWtkTWw0aUFUc05jYlUwUXdKUklz?=
 =?utf-8?B?Zi9zVFFMbnN1bkJTSlJZMXUvUm1EMDJ5a2RmMEhQMXU1YStGVWRyV1paS1pZ?=
 =?utf-8?B?dzlJaTRXQ2ZZYUh2SmVrbm81dmpPTTdtdEZwbnloaUVDQ1dzNWtBRGpMdGFy?=
 =?utf-8?B?VXFRSXdSYjh5MnJSY0NYSXBQd0VQemdFdXphVkgzeTR5aUhTaE5JdU9ZMjlP?=
 =?utf-8?B?RTBjVlUrMFpERXpHY0RzOUU3eC9CK2tOQTM0VzBFbjMvdG0yNHZRNWFjZmJB?=
 =?utf-8?B?bHRSMTNndzVNYlVFQXpKOTZTUWc3K3FUSitDOU8zMHNEK200UUZpYWV5VTVY?=
 =?utf-8?B?T3hpUWVwTDRxZHpGdmdUN254cVBoY1hsUHZoL2IreW1laUxHdXJ4aTZsVmpv?=
 =?utf-8?B?Z1p2YUtJWC9IbTRtMVRoV3Q2N0NUTHE0TnUvcy9Lbncvc3IxejQzb1JnTkdY?=
 =?utf-8?B?UUgrdlVNVlNXMWVmeWc4QkFaSW1ta0swc1VWMVQvOEpzdHdTdTg2TWE0a2tr?=
 =?utf-8?B?T21lcDRNcDRxcFVWRUNFYUpsVHVCb01wQjBKZVppTzhKVEtpcjduWWs2bURh?=
 =?utf-8?B?THBROVFiUGtLYXhCL2FPeW9CcEVoTUI3WTNYSXNQMklPcTMrNERWZXZqQVAv?=
 =?utf-8?B?Q0Q2d2lpWitLR204eVNoeUJuM2ZaRDRxT0E2dUN6YVBxQnM2ck1NRW1FWlNK?=
 =?utf-8?B?dFhPYlR3b2liSkZNVlVWdGI4bDYzSkRUVCs2bEU2SHRKSkZwVzhMZFp3cWpn?=
 =?utf-8?B?TkZRalpQb21rMlMvblcyeXFDYit5R0JGZFpDUHBYU2J5V3FHd0w4L0ZZR095?=
 =?utf-8?B?a0xiU2pTN0laTGhNRzJ2MDJxZmdRV2FpUHZzblJJWDFEbWhidWVqVTBSS3Ew?=
 =?utf-8?B?Ry96dm80NzJVSVVCWFNhWEdDdnFES1dYNG9zVzE3ZnNZQVdHV3NaWHZlYU9O?=
 =?utf-8?B?Z2JSZHhjYnR2Ritpa3NCVWxKMG1MMHRVVHNIbFZhSVZsREFwR3JjWm85Wmtt?=
 =?utf-8?B?QndkM01ZWVBwTzFjeldOSXJsNERESlNKaUJGRE1iV2N5RHBBMVN5L1NHTUs5?=
 =?utf-8?B?ZTRJS3VmYjZERm5sRXR3TGNMSjJiTU8yZkcwQStQZ3BJV1Q0T3N3WXdRV1Bz?=
 =?utf-8?B?OU85M2x2bzlGczBNWlQxbndhclhIVmVPZFRnNjVJaHlnbXRvQUQrUTR6Tzhz?=
 =?utf-8?B?M2lKTDRrSmhYMFV1N0lXa1IwT0F4cjgwZTNrd0JiOHE2ZldZdTR0N1R0S25B?=
 =?utf-8?B?RW91bTIxQ1J5WDQ4UERHMTU4UHhzOXM4OFdYZWx0QTk2a21rdDljUUcxUURB?=
 =?utf-8?B?VmFWY08zT3EvNkdjZFZiMXArbVR3d0o2OFVFeHNDNXlVeVZ6V1BML0NMWEhS?=
 =?utf-8?B?bUsydTBMK0VyQy9KZFNVWGp0UUJrVkVyd1pNbmxTTHN2cFhVL1IzNkZLaExh?=
 =?utf-8?B?TVZQY3Izbk1zY1JSYnVvcG1aN20vUmg4Szk4Z2QrU29MT3l2Z1A0ZGJqMDZu?=
 =?utf-8?B?YkxObG11OTNrYmJuT0dkWllJcFNKRlVDTnA3SXFDSU5mamFiQmlJaG10MnFH?=
 =?utf-8?B?ay8vT0FsR0xaRDVrZTQxanR2L0JHUXlJOXhXOVZyWmhmaEdQanJicFZyTzM5?=
 =?utf-8?B?cGhCc0JGL0d0U2lVOHBpRHlKalM1NXU4WnI5YXFKRXdZRWxUTGs3YUxWcGJT?=
 =?utf-8?B?eE9qd1RTVlRZbFYwTkgvRVhobnZ3MCtrMkNKTGRFSFQxdWx3SVhkeVl5UUR1?=
 =?utf-8?B?S2Q3ZTd6MzN2YkZBVndJRUJ6alpCWDhpRWFCNk91a2o3R1BxdFZ6TmNhc2F5?=
 =?utf-8?B?ZE1pd3RXOTh5MGNqNmZXM0ZIZmpGSTZPRk5qck0xb2xsZHhnOSt5U2ZzMFg4?=
 =?utf-8?B?R1k2M013S3BmSlBUMk9IRDMySUh0ZDZpNENUa1dPaVVZTWNZVSt6UllmNllE?=
 =?utf-8?Q?0XrayxpAwJfbcCmGuhbpcHE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbd0c1e-2045-4161-1b6f-08ddaea4f223
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 20:16:01.7792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIgO7aE7jGZ31fkwslnceZrB70nXBVMPFAg2Yo4oas0j58RMykEc2UrdDOOBUmOKRnqOyMPd/ZXcGuDjT8OZpWqmDBVO1pm1ZYz7Loz5xNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6938
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



On 6/18/2025 12:00 PM, Badal Nilawar wrote:
> Introducing xe_late_bind_fw to enable firmware loading for the devices,
> such as the fan controller, during the driver probe. Typically,
> firmware for such devices are part of IFWI flash image but can be
> replaced at probe after OEM tuning.
> This patch binds mei late binding component to enable firmware loading.
>
> v2:
>   - Add devm_add_action_or_reset to remove the component (Daniele)
>   - Add INTEL_MEI_GSC check in xe_late_bind_init() (Daniele)
> v3:
>   - Fail driver probe if late bind initialization fails,
>     add has_late_bind flag (Daniele)
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                |  1 +
>   drivers/gpu/drm/xe/xe_device.c             |  5 ++
>   drivers/gpu/drm/xe/xe_device_types.h       |  6 ++
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 93 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_late_bind_fw.h       | 15 ++++
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 39 +++++++++
>   drivers/gpu/drm/xe/xe_pci.c                |  3 +
>   7 files changed, 162 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f5f5775acdc0..001384ca7357 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -76,6 +76,7 @@ xe-y += xe_bb.o \
>   	xe_hw_fence.o \
>   	xe_irq.o \
>   	xe_lrc.o \
> +	xe_late_bind_fw.o \
>   	xe_migrate.o \
>   	xe_mmio.o \
>   	xe_mocs.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7d9a31868ea9..13cf5f90d09e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -43,6 +43,7 @@
>   #include "xe_hw_engine_group.h"
>   #include "xe_hwmon.h"
>   #include "xe_irq.h"
> +#include "xe_late_bind_fw.h"
>   #include "xe_memirq.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
> @@ -889,6 +890,10 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	err = xe_late_bind_init(&xe->late_bind);
> +	if (err && err != -ENODEV)
> +		return err;
> +
>   	err = xe_oa_init(xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a504b8ea6f3f..facafe2eea5c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -16,6 +16,7 @@
>   #include "xe_devcoredump_types.h"
>   #include "xe_heci_gsc.h"
>   #include "xe_lmtt_types.h"
> +#include "xe_late_bind_fw_types.h"
>   #include "xe_memirq_types.h"
>   #include "xe_oa_types.h"
>   #include "xe_platform_types.h"
> @@ -323,6 +324,8 @@ struct xe_device {
>   		u8 has_heci_cscfi:1;
>   		/** @info.has_heci_gscfi: device has heci gscfi */
>   		u8 has_heci_gscfi:1;
> +		/** @info.has_late_bind: Device has firmware late binding support */
> +		u8 has_late_bind:1;
>   		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
>   		u8 has_llc:1;
>   		/** @info.has_mbx_power_limits: Device has support to manage power limits using
> @@ -552,6 +555,9 @@ struct xe_device {
>   	/** @heci_gsc: graphics security controller */
>   	struct xe_heci_gsc heci_gsc;
>   
> +	/** @late_bind: xe mei late bind interface */
> +	struct xe_late_bind late_bind;
> +
>   	/** @oa: oa observation subsystem */
>   	struct xe_oa oa;
>   
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> new file mode 100644
> index 000000000000..52cb295b7df6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/component.h>
> +#include <linux/delay.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/intel/i915_component.h>
> +#include <drm/intel/late_bind_mei_interface.h>
> +#include <drm/drm_print.h>
> +
> +#include "xe_device.h"
> +#include "xe_late_bind_fw.h"
> +
> +static struct xe_device *
> +late_bind_to_xe(struct xe_late_bind *late_bind)
> +{
> +	return container_of(late_bind, struct xe_device, late_bind);
> +}
> +
> +static int xe_late_bind_component_bind(struct device *xe_kdev,
> +				       struct device *mei_kdev, void *data)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
> +	struct xe_late_bind *late_bind = &xe->late_bind;
> +
> +	mutex_lock(&late_bind->mutex);
> +	late_bind->component.ops = data;
> +	late_bind->component.mei_dev = mei_kdev;
> +	mutex_unlock(&late_bind->mutex);
> +
> +	return 0;
> +}
> +
> +static void xe_late_bind_component_unbind(struct device *xe_kdev,
> +					  struct device *mei_kdev, void *data)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
> +	struct xe_late_bind *late_bind = &xe->late_bind;
> +
> +	mutex_lock(&late_bind->mutex);
> +	late_bind->component.ops = NULL;
> +	mutex_unlock(&late_bind->mutex);
> +}
> +
> +static const struct component_ops xe_late_bind_component_ops = {
> +	.bind   = xe_late_bind_component_bind,
> +	.unbind = xe_late_bind_component_unbind,
> +};
> +
> +static void xe_late_bind_remove(void *arg)
> +{
> +	struct xe_late_bind *late_bind = arg;
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +
> +	component_del(xe->drm.dev, &xe_late_bind_component_ops);
> +	late_bind->component_added = false;
> +	mutex_destroy(&late_bind->mutex);
> +}
> +
> +/**
> + * xe_late_bind_init() - add xe mei late binding component
> + *
> + * Return: 0 if the initialization was successful, a negative errno otherwise.
> + */
> +int xe_late_bind_init(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	int err;
> +
> +	if (!xe->info.has_late_bind)
> +		return 0;
> +
> +	mutex_init(&late_bind->mutex);
> +
> +	if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
> +		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
> +		return -ENODEV;
> +	}
> +
> +	err = component_add_typed(xe->drm.dev, &xe_late_bind_component_ops,
> +				  I915_COMPONENT_LATE_BIND);
> +	if (err < 0) {
> +		drm_info(&xe->drm, "Failed to add mei late bind component (%pe)\n", ERR_PTR(err));
> +		return err;
> +	}
> +
> +	late_bind->component_added = true;

late_bind->component_added is unused in this patch, so it might be worth 
moving its addition to the patch that actually makes use of it.

With that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> new file mode 100644
> index 000000000000..4c73571c3e62
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_LATE_BIND_FW_H_
> +#define _XE_LATE_BIND_FW_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_late_bind;
> +
> +int xe_late_bind_init(struct xe_late_bind *late_bind);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> new file mode 100644
> index 000000000000..ef0a9723bee4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_LATE_BIND_TYPES_H_
> +#define _XE_LATE_BIND_TYPES_H_
> +
> +#include <linux/iosys-map.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_late_bind_component - Late Binding services component
> + * @mei_dev: device that provide Late Binding service.
> + * @ops: Ops implemented by Late Binding driver, used by Xe driver.
> + *
> + * Communication between Xe and MEI drivers for Late Binding services
> + */
> +struct xe_late_bind_component {
> +	/** @late_bind_component.mei_dev: mei device */
> +	struct device *mei_dev;
> +	/** @late_bind_component.ops: late binding ops */
> +	const struct late_bind_component_ops *ops;
> +};
> +
> +/**
> + * struct xe_late_bind
> + */
> +struct xe_late_bind {
> +	/** @late_bind.component: struct for communication with mei component */
> +	struct xe_late_bind_component component;
> +	/** @late_bind.component_added: whether the component has been added */
> +	bool component_added;
> +	/** @late_bind.mutex: protects the component binding and usage */
> +	struct mutex mutex;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 89814b32e585..d54d1d84e240 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -65,6 +65,7 @@ struct xe_device_desc {
>   	u8 has_fan_control:1;
>   	u8 has_heci_gscfi:1;
>   	u8 has_heci_cscfi:1;
> +	u8 has_late_bind:1;
>   	u8 has_llc:1;
>   	u8 has_mbx_power_limits:1;
>   	u8 has_pxp:1;
> @@ -348,6 +349,7 @@ static const struct xe_device_desc bmg_desc = {
>   	.has_fan_control = true,
>   	.has_mbx_power_limits = true,
>   	.has_heci_cscfi = 1,
> +	.has_late_bind = true,
>   	.needs_scratch = true,
>   };
>   
> @@ -592,6 +594,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>   	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> +	xe->info.has_late_bind = desc->has_late_bind;
>   	xe->info.has_llc = desc->has_llc;
>   	xe->info.has_pxp = desc->has_pxp;
>   	xe->info.has_sriov = desc->has_sriov;

