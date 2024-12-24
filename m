Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA5C9FC12F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 19:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D592710E280;
	Tue, 24 Dec 2024 18:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPJL0cAl";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B4510E217;
 Tue, 24 Dec 2024 18:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735064004; x=1766600004;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Th+It2QeWQEuVSv4u8uwMomhNMXE0ZcrwVWHzk6JrVM=;
 b=SPJL0cAlQPDNswvmAw4jmlvQqmAZACTfs4iW9jlHQHsf1MEwx7ZLLOmo
 EsQP4XCK5RfH/waPy+pBG2K9SvzPrF3vGRPULOWs4/r2Y+84t83AxFtOq
 mrQtGJ+lFp7tyUCQXpYjwyf7l7exd8as1UW5+zRtfcZ8JXVmIkVBgP2Z+
 fuHS5niXQK7ARI6KORKWawF4nBMw8UX4dWItTNw09WX66ZY61gIZA33OF
 gjNz/4s5IuicBs36wJO7AKBRcQ1byuw5iDGhjOBd1WMfpSSMWLDqRv40L
 qU3I/AYbzGjYF0vmdv6Grf5DdQ+sDu+Dy1n2wE2ITaZXK62nlZRMyIhFy Q==;
X-CSE-ConnectionGUID: CPqUsqeuQlSZEERN/n+vjA==
X-CSE-MsgGUID: tb6rQ68zQZ2KlQM8CbRR0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="23124535"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; d="scan'208,217";a="23124535"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2024 10:13:23 -0800
X-CSE-ConnectionGUID: HdR7gDaxRkq+LKGy+UKaCg==
X-CSE-MsgGUID: QcSd9MfNSAWufZRl5F4bJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
 d="scan'208,217";a="104393643"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Dec 2024 10:13:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Dec 2024 10:13:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 24 Dec 2024 10:13:22 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 24 Dec 2024 10:13:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDtDs2o4lo0b3KFrQ2dMWGsAFperX3eW4HvaGBvWj5bHRXtlNq+1bovzkuj2eXP+HAj0lXqOzQ1R53lLi6DnmLp9Jjm/CDjVY54k1GrXOxv2VQHm1vkseOxWGZY79LhH1PIEkSmuZyz58LkeJOGO3kVoM6qWFO+tLlK6dXxCO1M/DRMxqOtyxfeN05Q4m5bT7uFx9sE8IX5+gHSwkitYRZowpQpFF6XrXxjJZ67myVanAmqxf94Ou+BDf+1HCGzXRfPDYzBa0XEKg3T11HFGDO2a+hTFxyCxBx4eW/fZG0YPOi9NeVMvQ1jW7nOdMUGf9QW/8yiEMtUpTdgciMN3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+cAJd0XK0dbjQ2Gypk6K45Gqihu0lLJeWYjaiPuGc0=;
 b=hmaVuXglpJPeYS/LhAylrVQViPmTFAha50xOtfAUPAKzsaG0X27+FdJYfewUscOhJS4325zoEl8NTp68hrVuE3QDgpK4fAElPSf8TI/muAy1fLe8f7sB0zuJz9wXE3ev6X7TegoZip30vvGPy4ApEeeY4UeOS5gBGbNA6LoEaepGkfzHo5EILGjIsSS4WOAOerYoMnbz5rRBMCSXjk7p0yT05qQ/8xUHdb5nH8VHR8R8nrkiYbud0JXajjbufJeqxXT2FcYFZAs9Bf7GD1IeTNpfvpoemN4JOwxr9tCUZSdB4ePq2VV4GBVYmGExhs/kdkqh8SO/zh2exSSmKIR2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 18:13:16 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 18:13:16 +0000
Content-Type: multipart/alternative;
 boundary="------------6sN0seTS0tM4ZlysV5lPwrFc"
Message-ID: <16414d38-e5ae-4bc5-9b22-a2a7a928264b@intel.com>
Date: Tue, 24 Dec 2024 10:13:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Add debug print about hw config table size
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20241221011925.3944625-1-John.C.Harrison@Intel.com>
 <27c27339-cde3-4028-99e5-deb574c091ec@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <27c27339-cde3-4028-99e5-deb574c091ec@intel.com>
X-ClientProxiedBy: MW2PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:302:1::24) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BN9PR11MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: e1470ce5-ffa4-449c-4cbf-08dd2446a30e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajAyak1iWU9WaTBqN25pZkxycVlkY1c4RXp5VlpHZWs0ZTVsVHlqd3B3UEl1?=
 =?utf-8?B?YlBRaDl1K3M4ZkpHVkYrRHc2SEFCZk9ueTFmTEhaV1d3V1AxWHdaQVJQNjEw?=
 =?utf-8?B?czRscWNVT3RQcDlEYVUxVUc3ZnA3Y2lzakJFUUg5bkQ1ZHhrN0k3WUZDZ2R3?=
 =?utf-8?B?cU4vcXZBbURhd01JZ0wzcVhtTWN4UFBpL1QxbWZBc3FzS0M0MVRDTXhvQito?=
 =?utf-8?B?Zk1YQ01BOVF5cFJmZ2JUZ1NSa3htazdTRWVkSGlaVXZVYUpYTDR0a0hxbzhE?=
 =?utf-8?B?bXVNQmlnTktHdldRQi9CYVhzTWxlZEU3NWFMSklCSDFYeXJFSHgwdE1XTUR5?=
 =?utf-8?B?U1FpVHVkQ0hLVTBBdmFmMzNuUU15SmpzVWlGZVNTMmdnRE8xbndJNFNwMlZt?=
 =?utf-8?B?SEgzN1JKdlZMQ1BRYURqV2dCMWtOaVFISGpzRWREc3pITE5HRlZpa2tsTW1N?=
 =?utf-8?B?K3JZTHkxdVV2M2tnUHk5V3lTa0dKRjJNSXkxTENQa3RLdWJWNkJaT3lwR2Rm?=
 =?utf-8?B?TWM1dVBaT2VuRDFDeldtYjk4TDBhSXkwNklRMEJ4d200eTJQTEozOThtZDBK?=
 =?utf-8?B?WmdGV3ozZ0NzZE0wM2VBZVBpSCtVRUxrMVpWejhKZ2k1YUJMdUk5cUJlL0Vm?=
 =?utf-8?B?OEdsQkQ3SFhkenk3QVVrTkh3NzhtOXpFdld6RndMMkg4ZkI1QW1nV0ZITi9R?=
 =?utf-8?B?dzduNmFHekFYenZxTFpRdmo2dFd4Q1kxTmd2Z21uZS9CL2w0MTh5VU85MmM0?=
 =?utf-8?B?MWtNcHlKanNVeXVHUGhlNXJaVktwNWFZZHNpSU9RcVd0cGpGbkp4NFNEUjF1?=
 =?utf-8?B?TmdoNm9lNFpvZGlSUEpsOGFLZ0FRYW9ITlFBdldhVDRTVnExM0hxL2hlN09t?=
 =?utf-8?B?V3pabHUrUTJlOUppS3RiVUpMWGRDdldVQTFnZkVSU04rTlNaOW1QRVdHOU43?=
 =?utf-8?B?aitWNEtSNW0xYXM3OGJ5bWFWUHZGZVpCVWxsS2h3bFBIVE1VSU1Jc2p4RmVo?=
 =?utf-8?B?MldpSXlDSWxwQ1cyaG1vZEo2VVBLK0g3NlliU2JJTFlqWWRua01sOXdqS0s4?=
 =?utf-8?B?YjU2Z2lMbHBYQUd4RW41RFdKeFNHaDFGMFhKaHgvRnliQlBIMlNMZ21IUlpM?=
 =?utf-8?B?U045ZGN0MFMxMFYwYThjZUxXK2pCNGlOTFdPcElrSG5RbnhKSzRWbW5JYUxY?=
 =?utf-8?B?TDdQNWE2UmZ4a1JseFF1VFVTaXdEYm5USHhHUW5IQS9QRml1RGZ0YmJMSU5o?=
 =?utf-8?B?eDYrK3Z5UUJoeGNoWVUrbHI3emdGL0U3RlZrd3BoTTNUR2hIcjVRa29sKzg5?=
 =?utf-8?B?YmhWOE9uSEF2NEE0VzRiOHZIWE9HOVJNQjdJSjlONTNtVmJaZG0yU1R3NUdp?=
 =?utf-8?B?WTZpbTNySFUrVy93WCtEOWJaY2xRZlRNaC9qT2xGbC9xNnIzTE1aSUFxVFk3?=
 =?utf-8?B?aFpFbTFoai9zNWIvc003cDMrNmhZSGNGTGNiL09mR2VVUkdDb1hzU21ZVldX?=
 =?utf-8?B?Y1FyNnFyUUVyOERiTEEwYkFFYU5xaDI3aGUzWlZ6MGtmWkVXR3kzUFQyWE8z?=
 =?utf-8?B?cVVjTnVLWWJrTi94SDYxT0lJL3VRQWRwWFBXU01kNVdUNERMZlFEeVJuM1J4?=
 =?utf-8?B?YUgzSUFrY2p1eXF0cUF0T0FTWHZYYVlmUVBCMnRZcDZzempNTDhlbFhSekFk?=
 =?utf-8?B?L1FIejJiS0o5R2NoWWtGUTNNSWNqRDkydWhsbUZyRjBsYUpXQzRqRnNGbTNy?=
 =?utf-8?B?NWdBamxpSlVnTU1vTnNYV09KNDk0U0hOTUQ2cmdNMzBkQndjREZJSmd1eWhU?=
 =?utf-8?B?aTZMalRWSWQvOVVkbnF5Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1Fsbm0ySmR2eGRnOVMzL0xZd3Jodkp3UDdTU2h5ZnVoRXZ0MnBvVE5yRlZU?=
 =?utf-8?B?Y29nUEFQdThZQ05LbEJ3K3AxN0NiZmFRcm9hR2dtc1NNNmVUQXZORmEraWQ0?=
 =?utf-8?B?bzFST2loUGREdEZmVFk5UEdETGxYWVZlcVlhemMxb0lUL09lSzFpbmpmeTdk?=
 =?utf-8?B?UVpVWnV3SU1HblJXMXZyK1FiRUoxWGtSS3NUN2wxanhaeWRCQnY3OXpwWU5V?=
 =?utf-8?B?Q041bjdtdW1nOFBVV2wrWGhhSW5SUkNhOXE3N0hPQXdVNnNsN3VXWmlycCta?=
 =?utf-8?B?ZzRVNmp6RkpET3BzaldCd2RxZmRsMndqUmRSU0tpOGRzVDVBUlFYemRMM2FZ?=
 =?utf-8?B?blZBellLbFBNTERGRzBzMlZMQkkzNVExTW16YUNGT2R4dWlEVnBHUDVwcmkw?=
 =?utf-8?B?dVBERmQ2QXUxcmdheW8yWDVwcXYyNVJXK3NQRkhqM3o1MHZXTjdEWmRidmJz?=
 =?utf-8?B?YUZ5bFVlOTJyNDNoT2F5Z1A1K3pkZTR6akE4aFRxZ2xDMEJERWptS2pYaUNC?=
 =?utf-8?B?SjNTd0k2ZzFDUmtMQWFjWlk0dEYrTEdlZWFET3lkaGhEcERnOStzbklJTE1P?=
 =?utf-8?B?NjFsakc5d1owdUJkdFdENXBTYjYrSDVncnhNdnpRRzI2bXNRVlRSTGtndXow?=
 =?utf-8?B?TTRKOS9mUmVwVS8wcTc1YmI2VWlpeHB5QlQrNEhHZXVCbUtMd2RDSXFKazhr?=
 =?utf-8?B?UnppS0JuWm1Xb3docGR6dlNBeEVIMi9JaGlSeEFpZWQwQnJQL1lwQ0FnQ0xE?=
 =?utf-8?B?Q1RFUlA2ZTBhTEdlUDV1aVhkWDVlZk4rUk1Odk1vdTJ1N0tkaHowQXBRalJL?=
 =?utf-8?B?MXFuZFgyQ3JHWEcyVndkOXJJallScU1mT093cDJTZ0hsc1NNSFZZRkhDc2Fu?=
 =?utf-8?B?R2djT1VFSEs5Z3gyRldZYlBWQVpzdk94SFBXa0Y4T1pyOTNoVENUdzVrMFo2?=
 =?utf-8?B?TzEzK2E5NEptMFJxUVFiSXZNR1RFR0pyclAwYVdzTlB5UXJORlpkZVZzR0hS?=
 =?utf-8?B?SnZ4dnlvblIwZnVSVDdhTDBUcENnb295eGtTRXJuS3E5dUZNU1owNERsSjcv?=
 =?utf-8?B?NWdvVGFhZHYzTTBqb2t1RGxvYXhQSDI4NnUrSnRCckwrSkVBcjZ4aTA2OW5N?=
 =?utf-8?B?Qk8zTXEyUVl0TEptZmxONHNLd3YvWWxhTEdBVDNnTEY4SWtza0ExSEk0YXR1?=
 =?utf-8?B?RDZXVjFzbmZOcEZtNUI5N1MzWURySHJiL3c4OElEaHFrWkFLNGR4c1ZUdEZM?=
 =?utf-8?B?RUdLNklVR01qRG1aRDljWUFwMGMyZkpMVjNhclpNZjk5elZoM2NSOTF0YVAz?=
 =?utf-8?B?U3hodW5BT0daWUdqTGhYRytEcTluU1ZSZlFaOW50YkZxYmFaeGZpbXNveStt?=
 =?utf-8?B?T0wxNktTSjRQd1l5WFErQ3hQV0NEWitJbm8zbnZmbm83UUJjaTluUzNTWVdH?=
 =?utf-8?B?d0xSTGU5V3ovVzZUUE9YYU9iTnphVHBXSkZ0ZHNRb3VNSEFUUDE5c0c3cEg2?=
 =?utf-8?B?SXdvbVdBa0Y5UGtYcHI4RTFQQUNzdFhQaGdmcEJOUWs1b05wZnhsbE52UjBR?=
 =?utf-8?B?M3dxUWZiaWNQRjNTNlcwU1NhYTMwenJwZGhsMzBQaWRqYjRiWmt0NUplWmV6?=
 =?utf-8?B?SHBTK1VBVzJTOEI4TExEOUxINGNCNDVneWI5eUM4RWl3RGtSbUZueWE1YlUv?=
 =?utf-8?B?b2x0RWZvVTdtK1BxY0tGcDFtQkh6L3VicytocHQ2eGNGZkRNQ2RBajBlMkR3?=
 =?utf-8?B?M0VTWlQ2MFZOcEpESGFRRjQxUk54dUV2MFdKRGZyMmE1S05lcndUbko4dlhB?=
 =?utf-8?B?NnJTMk9DUm9EWmlEK0dPcmxtUUFJL0U0NmJoQUpJQjNRcUNYZmZQVGtRWTJn?=
 =?utf-8?B?cG8vZ2xVZktiNVlJSUEwc0RNL1VERFZaenBja2NzYldUSzQxWjNOSXp5OFpG?=
 =?utf-8?B?cWVjc3FocXFEbGlyUHVEZXFadm5XdVJhN1A3SmlFaXRQYWtWR2xWU1pjL1Bx?=
 =?utf-8?B?NTFYdXRtMm9iVHE2Mmk4VGdaeGNCOFZjd2dGUlF6SjVMa2p3ckdmRVhWZTQ3?=
 =?utf-8?B?VEFST3BiYldUcXZwSC9BcldETkQxTzlsM1FOWkFTRC8zbkJYaEV0R0ZWQXV6?=
 =?utf-8?B?d0NZWXByM0FVNkZEL1k1Wlh0d3ZZeXMrVGt6VlRrTmZTVGlQWHBxNWJOc25F?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1470ce5-ffa4-449c-4cbf-08dd2446a30e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 18:13:16.0295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDMifrZXYAGU4kDAxDjluNnDBDkG+rjyCUtttxh/qZgfp2kRovJ++ma4ZKzmPug02FeqKjlC3a2d1w7q28KFfFDSt6HEKIPRY+vCmlN/Wlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5257
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

--------------6sN0seTS0tM4ZlysV5lPwrFc
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/2024 15:20, Daniele Ceraolo Spurio wrote:
> On 12/20/2024 5:19 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison<John.C.Harrison@Intel.com>
>>
>> Add debug info to help investigate a very rare bug:
>>    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385
>>
>> Signed-off-by: John Harrison<John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>> index b67a15f742762..868195c33f5b3 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>> @@ -7,6 +7,7 @@
>>   #include "gt/intel_hwconfig.h"
>>   #include "i915_drv.h"
>>   #include "i915_memcpy.h"
>> +#include "intel_guc_print.h"
>>   
>>   /*
>>    * GuC has a blob containing hardware configuration information (HWConfig).
>> @@ -42,6 +43,8 @@ static int __guc_action_get_hwconfig(struct intel_guc *guc,
>>   	};
>>   	int ret;
>>   
>> +	guc_dbg(guc, "Querying HW config table: size = %d, offset = 0x%08X\n",
>> +		ggtt_size, ggtt_offset);
>
> This seems to result in a double-log where the first print has no 
> useful information, e.g.:
>
> [drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config 
> table: size = 0, offset = 0x00000000
> [drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config 
> table: size = 752, offset = 0x00D05000
>
> Given that only the second log is useful, IMO better to move the 
> guc_dbg to guc_hwconfig_fill_buffer(), because the info needed for the 
> second print is available there and it is only called once.
I disagree that the first print has no useful information. It tells us 
that a call is being made and these are the parameters. We do not know 
what the failure is. It seems highly unlikely that the size changes from 
query to the next given that the table is a fixed entity. It is much 
more likely to be a caching type issue with GuC reading data the KMD did 
not write. If so, GuC could potentially read non-zero data for the 
initial size query and complain that data is invalid.

The intention is to report all calls with their parameters to try to 
narrow down exactly what calls are not working.

John.


>
> Daniele
>
>>   	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
>>   	if (ret == -ENXIO)
>>   		return -ENOENT;
>

--------------6sN0seTS0tM4ZlysV5lPwrFc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/23/2024 15:20, Daniele Ceraolo
      Spurio wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:27c27339-cde3-4028-99e5-deb574c091ec@intel.com">
      
      On 12/20/2024 5:19 PM, <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">John.C.Harrison@Intel.com</a>
      wrote:<br>
      <blockquote type="cite" cite="mid:20241221011925.3944625-1-John.C.Harrison@Intel.com">
        <pre wrap="" class="moz-quote-pre">From: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">&lt;John.C.Harrison@Intel.com&gt;</a>

Add debug info to help investigate a very rare bug:
  <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385" moz-do-not-send="true">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385</a>

Signed-off-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">&lt;John.C.Harrison@Intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index b67a15f742762..868195c33f5b3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -7,6 +7,7 @@
 #include &quot;gt/intel_hwconfig.h&quot;
 #include &quot;i915_drv.h&quot;
 #include &quot;i915_memcpy.h&quot;
+#include &quot;intel_guc_print.h&quot;
 
 /*
  * GuC has a blob containing hardware configuration information (HWConfig).
@@ -42,6 +43,8 @@ static int __guc_action_get_hwconfig(struct intel_guc *guc,
 	};
 	int ret;
 
+	guc_dbg(guc, &quot;Querying HW config table: size = %d, offset = 0x%08X\n&quot;,
+		ggtt_size, ggtt_offset);</pre>
      </blockquote>
      <br>
      This seems to result in a double-log where the first print has no
      useful information, e.g.:<br>
      <br>
      <div style="font-family: Roboto, Oxygen-Sans, Ubuntu, Cantarell, sans-serif; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span id="dmesg-normal420" class="dmesg dmesg-normal" style="font-family: monospace; white-space: pre; overflow-wrap: normal;">[drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config table: size = 0, offset = 0x00000000</span></div>
      <div style="font-family: Roboto, Oxygen-Sans, Ubuntu, Cantarell, sans-serif; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span id="dmesg-normal421" class="dmesg dmesg-normal" style="font-family: monospace; white-space: pre; overflow-wrap: normal;">[drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config table: size = 752, offset = 0x00D05000</span></div>
      <br>
      Given that only the second log is useful, IMO better to move the
      guc_dbg to guc_hwconfig_fill_buffer(), because the info needed for
      the second print is available there and it is only called once.<br>
    </blockquote>
    I disagree that the first print has no useful information. It tells
    us that a call is being made and these are the parameters. We do not
    know what the failure is. It seems highly unlikely that the size
    changes from query to the next given that the table is a fixed
    entity. It is much more likely to be a caching type issue with GuC
    reading data the KMD did not write. If so, GuC could potentially
    read non-zero data for the initial size query and complain that data
    is invalid.<br>
    <br>
    The intention is to report all calls with their parameters to try to
    narrow down exactly what calls are not working.<br>
    <br>
    John.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:27c27339-cde3-4028-99e5-deb574c091ec@intel.com"> <br>
      Daniele<br>
      <br>
      <blockquote type="cite" cite="mid:20241221011925.3944625-1-John.C.Harrison@Intel.com">
        <pre wrap="" class="moz-quote-pre"> 	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
 	if (ret == -ENXIO)
 		return -ENOENT;
</pre>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------6sN0seTS0tM4ZlysV5lPwrFc--
