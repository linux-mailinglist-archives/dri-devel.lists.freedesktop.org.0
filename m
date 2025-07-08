Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC76DAFD6C2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 20:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C0010E06C;
	Tue,  8 Jul 2025 18:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDM4AyOe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF90C10E06C;
 Tue,  8 Jul 2025 18:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752001062; x=1783537062;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jLJweYZS9tBBCKw5udeQInU7BWT3QZzlNSVkFEX2xQk=;
 b=LDM4AyOeE5cT87hAvbgrWWB9h+6KrOcN93B0l1Uuk6K9a/Wf/XwvmQwe
 fn/k/90/kgU/hrLdgiG6V6p93B6uWJCfXtg8IwTZbOEA5UVvaSFsd312j
 bvZwPVW4HYaNAsOzjuUdhj+ZKQNP7Kb6JE2MtXopNw9vH5v3a9ehKQCYs
 6zDpN/c17C85IBmaHV26UvF7fzE9citm0YnePiFBDCu/okVo7Yb3NwDr5
 Ntxt9/ivxcRO+zymHkJzr1ka1FPlRL9zDCFcWcH8qkECg8JXBu61aaoc8
 xmviGMlyH1i7zF/sKli5xy6esSPoNuiDKVoTXQf2U6q1VgfiGGicdsU67 g==;
X-CSE-ConnectionGUID: +Kg4uO2kTImVDzKu3oEmiQ==
X-CSE-MsgGUID: 3GRYdCdnRd6kZpLd/DtjKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64946321"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64946321"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 11:57:41 -0700
X-CSE-ConnectionGUID: gTHOUM/zTPOL2qJ3ZKRX5Q==
X-CSE-MsgGUID: 92QS9bqVTLWHKGH1ntUlPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="160107672"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 11:57:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 11:57:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 11:57:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 11:57:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K39MtKKcrW/0mOh3IDnmN+l22SVtPf5b5ffiEwrJNASyAVCT1JChrnbzwYBAzEe5nFMBfVdXXpXD0JEfSPwlhW5uRhcR1c7xeOEVHZoX71YJBQkdpytgAQhAPMeToRhCh6TqefYZvbWkpLJtpwXZVlWwo+V783/C+biS3xXGxa/tK3TxkFwSi1cAUWZ5Rh6f/4lHtK1893o+2TpIhJ4fdtXw6A3yYy+6uvrcKa9q7/Cf63e4xJrqbCgCBPZ1gy8LLLetqKpkqSv26aXX+3kQlOlxQvDcsNxEPXUJnEEyQagAGrBGmwKmOyBAscLnr685S9ZYnSqM0YDF23F/ub30Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uL4rWsDnywZpcTmxL7v7XA/V4F5nW17lb2QIChMmbM=;
 b=edif5V5V+/9eel0smyC4BkZtUlYwxE0ipRk8mbrxjWafdyPBz2EJxzs/2UwxywifbuRUkZRXzM1JWElLTLkrTOX+cxPwxkKiRTtNobHg2fvAjxfOjxblcvH/oKa4jV9IWdXyGccVt/3X+dtRjsv/a5pwANtpo/hkYpid0Jou9KY76UhcjlJEFl0O/sMd+BxnJ06MlusFqiLqEbOZd+vRIpGuat6Nkj3pSqd4hCZKX7G7Ap7ElTi2twtCBkYNeOEkCH/9+TTXQRVSHNSe/z7hvkkLxJIcqnufLJpOq+QaT6CfxyS+xuhoixrAedxN6D4bv0PrHqzDjfppXWWmac1A7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 18:57:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 18:57:18 +0000
Date: Tue, 8 Jul 2025 11:59:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH v6 14/15] drm/sched: Queue all free credits in one worker
 invocation
Message-ID: <aG1qdbfImvGlDW/O@lstrano-desk.jf.intel.com>
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
 <20250708095147.73366-15-tvrtko.ursulin@igalia.com>
 <cb140d4e-01cd-4cd7-bd7c-5c10b44cf98f@amd.com>
 <95da8a36-8231-4578-ae74-35c8ba7f6972@igalia.com>
 <93c27eec-3c4b-4897-ae85-a2eed266a6b7@amd.com>
 <45c0665d-6b1b-4ba0-a770-8120cfed951e@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45c0665d-6b1b-4ba0-a770-8120cfed951e@igalia.com>
X-ClientProxiedBy: MW3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:303:2b::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: c9fa4988-df8c-4cd6-c390-08ddbe514328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3ppTlRFZ3k2WU0vemVuMkx6d0YyOHBPOHp3dHhCckdrNFQ3ZVVKd3d4TE5o?=
 =?utf-8?B?ZHpJRjFRNXdOR3RIdENmOEMvRFN1K0IyQzNPVXI0Z0RBOFd2SVJTNUkyd0wy?=
 =?utf-8?B?Y2hoUHFtc1EwZFRFM3lQWVNCZmxUbFVaRHRhWFZ3a05ZSlFJcy9EUHJmRTRV?=
 =?utf-8?B?dU91RWlDSlZnaE1TVk5BRS9oTmVZOHQzeU4ycTdpWUlRR2xIYU81MFAwRExO?=
 =?utf-8?B?aWVDeXZOM3NIQ0RJMFR1dlNhc21IMk1TdHhVN3hCMFBDWjdIS3gzd1gxTjJM?=
 =?utf-8?B?cXNueHBYWkUxMncwZmsxNDhxUjhKcWp0cmJ1T25FQWlXWTQ3NG5Wc0pUMkJz?=
 =?utf-8?B?Z2REaG80UGhZUXN0MHlBblJ1MlJmNHQyVnhaNmEvN3JsdTRmMzVyRGs5WDZo?=
 =?utf-8?B?V2NFVUdna2RDNGRxZklKK0I3U1ZqZ1A1MWltMjAzODNBeG5rTVhwV1pwUWZO?=
 =?utf-8?B?OWZpeEVWSndPU2N1RDZzcHJkQ1ZQS2hvaHd1QWpkemFMUDh0WGxCazIyYmZj?=
 =?utf-8?B?M1IrR3JDUWd5cXJWeW9obWNoSDM2bGlMOHRneW54MS9SU3pVWEs3cEtRQXNC?=
 =?utf-8?B?OFFiOU9ONVk0ZEtrYVVBdU9pM2Y0S21FTjJTc1E1VzArM2trSVBiRjhZaG5T?=
 =?utf-8?B?YXp5VTNjS2M3LysrNEJ1RXh5NHptVk9SQXZoOExtWUhPZEppb2d5ajJvaWc3?=
 =?utf-8?B?VGs1SldyN1VpNWx0OUtQOW16NlYrb0hFeXpmWk5jdENFcVZaejAwelJPb0VC?=
 =?utf-8?B?TWpEWDg3aHd2VHVVNWFTNUt5N2hLL1ltcnZoa015QTB3L21mc1Fsb2ZNMjhJ?=
 =?utf-8?B?SkN4cVBSUmd1Rlk3a05uZUozZTRoTHgxOEEyWFJTUDZDM0d0L0FScE0rRFVR?=
 =?utf-8?B?aDVBYXdRRkp6K2tDVHk5N2c1R3FrYzZwaWwyKzh6cnJmaWEyWTVrWCszZ0Ju?=
 =?utf-8?B?QVFzbXpvQ25PdzgxeVZyaTlIYTlJQW1uRHJtTjg1QVk0cUs5M3R5THY4RHlU?=
 =?utf-8?B?RktnSWxST2hDRmEyUnU1eXBmT3A3NExDZlE3bzZBdkRiL1VVcStTd0pPRVhX?=
 =?utf-8?B?dFdtRWYraGJ4alhvSTgzOEN3eTAxbFpKc1NTandWSkUyM3ZrRnc3N0F0U1I3?=
 =?utf-8?B?SG9hYTdJMUVmeDlMT2RSaStuL1gwMmpIN3lpYlZmdzI5ZEpZbmpBTFNyYjc3?=
 =?utf-8?B?czFGUk50SDNBTFJrUHlQZjFZRzJpS3ZyMHRDamI0NnV0YmRWVXFCcG9XdXQz?=
 =?utf-8?B?UkdqVUgzNm9CU1hiV1JSbTRVaDE0SUxnaGN1NE5LWDkrTHVlN1dhUitnWlI4?=
 =?utf-8?B?Mm9Ub1RieGoraXZkRDBEOVFxb1doakZXRG4yTXFhMFdMYzNGOXA5bDYwc0lo?=
 =?utf-8?B?QjdGYUJjM0g0bWI0Yk1xVFlLZ3pRL0laMUgwYmFITXRFR3JXS1hkR3RIZExr?=
 =?utf-8?B?MDhQNjgvUTJ0TU9raVpaZ2Uvd2hsUy8xOXIvU01kMlRkaUhYZzNMMVNUYzda?=
 =?utf-8?B?ZGNLKzFhYWtZOXQ1Y2xER0Jud09nUTM2ZEd4dW53R2NBcjROc0dsenFocWNu?=
 =?utf-8?B?S2MvTkVwdDJxODlDdUVROS9WWjZtSkhGQ09McWxZNmQ3d09XYzl4TDJNT21C?=
 =?utf-8?B?ZUoxZml4R0p5a0ExWUwya3EwOGJPaWNXbCs4bW5TcjlXckI1dVhzR1hvbTBN?=
 =?utf-8?B?dzhob1AwZ3VsejRybTU4cmJZSHJLTERWam9uK041bHhPUWo3WHhGbXJxMFVQ?=
 =?utf-8?B?ZlJ1RG9BbzVzZGthS2FENUFnVDBRZTVFU0x2c3MzNE1DNUNLZkRJOS9xTzdE?=
 =?utf-8?B?WU1Od3hWd2pKbFo0cXFobmZmWHAzVzJvUG5vTTN0NlEreFVOZFYyeUIydUNv?=
 =?utf-8?B?aDlqWm42ZGdoOVlRSXJtc1I2YnRPcTNob0wvQzdPbGVUWHZCKzZvaS9La0hX?=
 =?utf-8?Q?FSDgWsYk5qU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEM1aDJ5bnIzcmZBc1lMY1BRdnJha1kyN05wSGM0TlRXeEJQWHFleGl1SGQr?=
 =?utf-8?B?VFlGTnk3eFl5L3dWMlNER0d1SW5DVTFlTUsxMDRPV1p1TEdYT1lsdHFsekM0?=
 =?utf-8?B?Ri9hbnJBNW9rOTNHcXRqTS9POTBkN2s2STl3MXFRb1llS3ZMVm9UWFhHeWNk?=
 =?utf-8?B?UUNKMWkyWWI1OU1KcXlvRXJkVUxmTlBiWktrcTg1M0ZPb2pGelZSYTBNT1NZ?=
 =?utf-8?B?ZUh2K1hjY0xVcFhMdGhXcXREL2pwYkhQL08yc0R5RXdidUVyaW9PWGhWU3Mx?=
 =?utf-8?B?R29JQmZTdFd5Wk0rZHJpOHRYcjlEdGlCNjU2UHBEZEkvdERMMEJ6MDlhMEVL?=
 =?utf-8?B?dS9LLzEvUDltQnpaV2JlUFFNWVNZdHNudi9Ia2dKdC91azRWcVk1U2FDcjRo?=
 =?utf-8?B?N1h3Z1RGVm11UXd3eSsxRnZjZEcraUdXdlVrNzdicEFiS0tQYWEzSTJnemw5?=
 =?utf-8?B?alFCWlVjaUwzTWt3VjRWTjJMM3h4bkdCc3BKUmMzclJLakJrWDJkRHRKb095?=
 =?utf-8?B?SVBad3czM2ZuM0doRlJZdHhZUWkrdHZ4ckJGZ3M0UEF1MElSa05HOEF2NHVV?=
 =?utf-8?B?cjNLKzlscDNmTXBIZXJOZ2g3cVNHcjJOajBtVjFNY3FKUWJTb0FwMXJJWjVl?=
 =?utf-8?B?Ry84MUc2T2RaVUFIOUxIZWRQMHNuSDIzTkVkN05ucy9tamtSY0I1aTBxbWc0?=
 =?utf-8?B?REEyb2Z0WWQrOHN0ZFFmdS9ING4rcmhuWlB5cjRpMTMxVWV3V1VZVHlDclY0?=
 =?utf-8?B?L2VKdGpFcnpSTTdrQzVqL0Z3K2t3UjNCeTE2cXArckY2QUpRcW8zaTFJL08z?=
 =?utf-8?B?QmZ6azQyaE10N1ZXNWsxWkg4eXB3aGptSTMwOW1XMFNLalU5Rm9JYXFRalpv?=
 =?utf-8?B?clBJVDFYaStTbHo0L053L1hwSkhNOFY1S3ZVU0cwb2lVb2cyUnMyMDZwYTNK?=
 =?utf-8?B?aSt1UFozZUU4Zmt3YkQ3enRldG1tVFdlUUI1d2IrZS9RbjlucWtmcE1Idmcz?=
 =?utf-8?B?K1F0aktUMGdrWmdBWUVIcXQvZ2hoNHFXSGpPQU84VitQaXFRMXI3QmhoTHZE?=
 =?utf-8?B?TXVLUklGZjBuSEZyT2szOVB5bVQvOUpCeXNZd1preWZIc2xUUEV1ZVZWczY5?=
 =?utf-8?B?ZzByTkhqLzBSMXZNYldLVHozMmpoVTlzQ2FSbnFLcG51TUQydzVGYWZUS3Fr?=
 =?utf-8?B?RmFqb0x0WXVWNEMvQ1pKTHZtVnZValA4SmhXNW9VaERkanBMUDFOS2d6a1g4?=
 =?utf-8?B?TTlJNzRYWGNLVXh1T2ZPWStoVkFUT0l5UG5kVGpaTFYzVENUekMveGFSb05X?=
 =?utf-8?B?NjFaR2NLMUp2Q1E5T3J5SFp3QWdnNG1TQ2ptMjlydTVwblFBc1JVV1NIbWxa?=
 =?utf-8?B?ai9xQWVkVFJqS1NNdFV2VXZCbnhhTy9UYUtwZ0tGTGZEckMyMXhpUXJpSExE?=
 =?utf-8?B?RDR6QWQ5RXNHSE1wdHozNFBaSzdFb210eVZiVysyV1hhQ0t1Mk5Wd2JjV0Nn?=
 =?utf-8?B?THZZV0RqbmgzTmtGVmNoaERNanNBb01rMExsRm5BS0RpTUZVcUIwd2Y0bkI4?=
 =?utf-8?B?clkwVlVERktYa2UrVTBLakhRanJtTHFhSUMvQ0ZjVm1oNUtSc0dFaWkzMWNq?=
 =?utf-8?B?VGdtRW1ISG1JVVlBQ0ZKdm96MGpZUXZGbnJsUHRJVVpwdG1wclhnVlh5czNS?=
 =?utf-8?B?MnFSUnZaRW53aDZOaVBuWkNyVG1mbHNSMnJ5Vkk1c3EzV0hLZFo4M3diZjRa?=
 =?utf-8?B?elJNTmp6OFdqOEg1eHFBSWhiOWsrQk1CR291a2FtTGJPMlo4dXRTenowNHRE?=
 =?utf-8?B?TW03S2cyTGNxWlFtcG42SEpheG5BTjB5aWZuNVlhOTdOUHdJNFZGWisvdDYv?=
 =?utf-8?B?NkZiMnIyZW5iN25LOXh2cHdRWlphRXJISW54dzFBNytSbjVPZUQ4SXRBK05t?=
 =?utf-8?B?RTdxcmRJS2x1RU5Eck5RUXVTbzVuUTIxN2YrN3k1U2FUemhZOGdIRHMxcWpp?=
 =?utf-8?B?THJBOVJWdXNtbXF6T3R5enhEdTZjVTE3dU5Ib01IcEpxai9acUtONHBhRVk4?=
 =?utf-8?B?cGlpMC9keDByNUNTblI0MFdoaTdheXVtRWwyRGxLa0tjY283d2FHR0pWeXhT?=
 =?utf-8?B?SnRHc3lNQkdKdEtkbFVqdnZRVHBzYlAreGpBK2twdlk1NkpLWDFlbEdBbSth?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fa4988-df8c-4cd6-c390-08ddbe514328
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:57:18.5982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSeCZz8GRgC8P0c7Z2LkXTclluZWxViHG7KI6u9aETvYqa2K50bnIU26x5b/uH9DSCfupcnto7rBOL3Mqb07Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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

On Tue, Jul 08, 2025 at 04:31:31PM +0100, Tvrtko Ursulin wrote:
> 
> On 08/07/2025 14:02, Christian König wrote:
> > On 08.07.25 14:54, Tvrtko Ursulin wrote:
> > > 
> > > On 08/07/2025 13:37, Christian König wrote:
> > > > On 08.07.25 11:51, Tvrtko Ursulin wrote:
> > > > > There is no reason to queue just a single job if scheduler can take more
> > > > > and re-queue the worker to queue more.
> > > > 
> > > > That's not correct. This was intentionally avoided.
> > > > 
> > > > If more than just the scheduler is using the single threaded workqeueu other workers, especially the timeout worker, can jump in and execute first.
> > > > 
> > > > We explicitely removed submitting more than one job in each worker run.
> > > 
> > > I wanted to ask why, but then I had a look to see if anyone actually does this. And I did not find any driver sharing a single threaded workqueue between submit and timeout.
> > > 
> > > The only driver which even passes in the same workqueue for both is PVR, but it is not a single threaded one.
> > > 
> > > Or perhaps I misunderstood what you said. Could you please clarify either way?
> > 
> > You correctly understood that.
> > 
> > The argument was that submitting more than one job in a worker is simply not beneficial and other work items can jump in and execute.
> > 
> > I have no idea if that is actually used or not. You would need to dig up the discussion when we switched from a kernel thread to work items for the full background.
> > 

I think Christian is capturing the gist of the discussion. I originally
had it coded the way Tvrtko did, but got pushback and switched to the
requeue approach. If I recall correctly, at the time the default
workqueue was a system WQ, which we definitely didn’t want to hog.

Now that the default is a dedicated worker, this is less of an issue.
However, technically, a system worker could still be passed in—though it
shouldn't be, since the WQ should be marked with WQ_RECLAIM.

I don’t have a strong opinion either way, so I’m going to stay out of
this one.

Matt

> > But in general to do as less work as possible in each worker and then re-submit it is usually a good idea.
> 
> From the point of view that the single work item invocation shouldn't hog
> the worker, if the worker is shared, I agree. But what we also want is to
> feed the GPU as fast as possible, ie. put the CPU to sleep as quickly as
> possible.
> 
> If we consider drivers with dedicated workqueues per hardware engine, or
> even per userspace context, then especially in those cases I don't see what
> is the benefit of playing the wq re-queue games.
> 
> Anyway, I can park this patch for now, I *think* it will be easy to drop and
> will just need to rebase 15/15 to cope.
> 
> In the meantime I have collected some stats when running Cyberpunk 2077
> benchmark on amdgpu, just to remind myself that it does happen more than one
> job can be ready to be passed on to the GPU. Stats of number of submitted
> jobs per worker invocation (with this patch):
> 
> 		1	2	3	4	5
> gfx_0.0.0	21315	541	9849	171	0
> comp_1.3.0	3093	9	2	0	0
> comp_1.1.0	3501	46	2	1	0
> comp_1.0.1	3451	46	2	0	0
> sdma0		4400	746	279	481	7
> 
> This is for userspace contexts only. Quite a good number of three jobs
> submitted per worker invocation.
> 
> Kernel sdma appears to favour deeper queues even more but I forgot to log
> above 2 jobs per worker invocation:
> 
> 	1	2	
> sdma0	8009	1913
> 
> I can try to measure the latencies of worker re-queue approach. Another
> interesting thing would be C-state residencies and CPU power. But given how
> when the scheduler went from kthread to wq and lost the ability the queue
> more than one job, I don't think back then anyone measured this? In which
> case I suspect we even don't know if some latency or efficiency was lost.
> 
> Regards,
> 
> Tvrtko
> 
> > > > > We can simply feed the hardware
> > > > > with as much as it can take in one go and hopefully win some latency.
> > > > > 
> > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > Cc: Christian König <christian.koenig@amd.com>
> > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Philipp Stanner <phasta@kernel.org>
> > > > > ---
> > > > >    drivers/gpu/drm/scheduler/sched_internal.h |   2 -
> > > > >    drivers/gpu/drm/scheduler/sched_main.c     | 132 ++++++++++-----------
> > > > >    drivers/gpu/drm/scheduler/sched_rq.c       |  12 +-
> > > > >    3 files changed, 64 insertions(+), 82 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > index 15d78abc48df..1a5c2f255223 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > @@ -22,8 +22,6 @@ struct drm_sched_entity_stats {
> > > > >        u64        vruntime;
> > > > >    };
> > > > >    -bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> > > > > -             struct drm_sched_entity *entity);
> > > > >    void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > > > >      void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index 35025edea669..1fb3f1da4821 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -95,35 +95,6 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
> > > > >        return credits;
> > > > >    }
> > > > >    -/**
> > > > > - * drm_sched_can_queue -- Can we queue more to the hardware?
> > > > > - * @sched: scheduler instance
> > > > > - * @entity: the scheduler entity
> > > > > - *
> > > > > - * Return true if we can push at least one more job from @entity, false
> > > > > - * otherwise.
> > > > > - */
> > > > > -bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> > > > > -             struct drm_sched_entity *entity)
> > > > > -{
> > > > > -    struct drm_sched_job *s_job;
> > > > > -
> > > > > -    s_job = drm_sched_entity_queue_peek(entity);
> > > > > -    if (!s_job)
> > > > > -        return false;
> > > > > -
> > > > > -    /* If a job exceeds the credit limit, truncate it to the credit limit
> > > > > -     * itself to guarantee forward progress.
> > > > > -     */
> > > > > -    if (s_job->credits > sched->credit_limit) {
> > > > > -        dev_WARN(sched->dev,
> > > > > -             "Jobs may not exceed the credit limit, truncate.\n");
> > > > > -        s_job->credits = sched->credit_limit;
> > > > > -    }
> > > > > -
> > > > > -    return drm_sched_available_credits(sched) >= s_job->credits;
> > > > > -}
> > > > > -
> > > > >    /**
> > > > >     * drm_sched_run_job_queue - enqueue run-job work
> > > > >     * @sched: scheduler instance
> > > > > @@ -940,54 +911,77 @@ static void drm_sched_run_job_work(struct work_struct *w)
> > > > >    {
> > > > >        struct drm_gpu_scheduler *sched =
> > > > >            container_of(w, struct drm_gpu_scheduler, work_run_job);
> > > > > +    u32 job_credits, submitted_credits = 0;
> > > > >        struct drm_sched_entity *entity;
> > > > > -    struct dma_fence *fence;
> > > > >        struct drm_sched_fence *s_fence;
> > > > >        struct drm_sched_job *sched_job;
> > > > > -    int r;
> > > > > +    struct dma_fence *fence;
> > > > >    -    /* Find entity with a ready job */
> > > > > -    entity = drm_sched_rq_select_entity(sched, sched->rq);
> > > > > -    if (IS_ERR_OR_NULL(entity))
> > > > > -        return;    /* No more work */
> > > > > +    while (!READ_ONCE(sched->pause_submit)) {
> > > > > +        /* Find entity with a ready job */
> > > > > +        entity = drm_sched_rq_select_entity(sched, sched->rq);
> > > > > +        if (!entity)
> > > > > +            break;    /* No more work */
> > > > > +
> > > > > +        sched_job = drm_sched_entity_queue_peek(entity);
> > > > > +        if (!sched_job) {
> > > > > +            complete_all(&entity->entity_idle);
> > > > > +            continue;
> > > > > +        }
> > > > > +
> > > > > +        job_credits = sched_job->credits;
> > > > > +        /*
> > > > > +         * If a job exceeds the credit limit truncate it to guarantee
> > > > > +         * forward progress.
> > > > > +         */
> > > > > +        if (dev_WARN_ONCE(sched->dev, job_credits > sched->credit_limit,
> > > > > +                  "Jobs may not exceed the credit limit, truncating.\n"))
> > > > > +            job_credits = sched_job->credits = sched->credit_limit;
> > > > > +
> > > > > +        if (job_credits > drm_sched_available_credits(sched)) {
> > > > > +            complete_all(&entity->entity_idle);
> > > > > +            break;
> > > > > +        }
> > > > > +
> > > > > +        sched_job = drm_sched_entity_pop_job(entity);
> > > > > +        if (!sched_job) {
> > > > > +            /* Top entity is not yet runnable after all */
> > > > > +            complete_all(&entity->entity_idle);
> > > > > +            continue;
> > > > > +        }
> > > > > +
> > > > > +        s_fence = sched_job->s_fence;
> > > > > +        drm_sched_job_begin(sched_job);
> > > > > +        trace_drm_sched_job_run(sched_job, entity);
> > > > > +        submitted_credits += job_credits;
> > > > > +        atomic_add(job_credits, &sched->credit_count);
> > > > > +
> > > > > +        fence = sched->ops->run_job(sched_job);
> > > > > +        drm_sched_fence_scheduled(s_fence, fence);
> > > > > +
> > > > > +        if (!IS_ERR_OR_NULL(fence)) {
> > > > > +            int r;
> > > > > +
> > > > > +            /* Drop for original kref_init of the fence */
> > > > > +            dma_fence_put(fence);
> > > > > +
> > > > > +            r = dma_fence_add_callback(fence, &sched_job->cb,
> > > > > +                           drm_sched_job_done_cb);
> > > > > +            if (r == -ENOENT)
> > > > > +                drm_sched_job_done(sched_job, fence->error);
> > > > > +            else if (r)
> > > > > +                DRM_DEV_ERROR(sched->dev,
> > > > > +                          "fence add callback failed (%d)\n", r);
> > > > > +        } else {
> > > > > +            drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > > > > +                              PTR_ERR(fence) : 0);
> > > > > +        }
> > > > >    -    sched_job = drm_sched_entity_pop_job(entity);
> > > > > -    if (!sched_job) {
> > > > >            complete_all(&entity->entity_idle);
> > > > > -        drm_sched_run_job_queue(sched);
> > > > > -        return;
> > > > >        }
> > > > >    -    s_fence = sched_job->s_fence;
> > > > > -
> > > > > -    atomic_add(sched_job->credits, &sched->credit_count);
> > > > > -    drm_sched_job_begin(sched_job);
> > > > > -
> > > > > -    trace_drm_sched_job_run(sched_job, entity);
> > > > > -    /*
> > > > > -     * The run_job() callback must by definition return a fence whose
> > > > > -     * refcount has been incremented for the scheduler already.
> > > > > -     */
> > > > > -    fence = sched->ops->run_job(sched_job);
> > > > > -    complete_all(&entity->entity_idle);
> > > > > -    drm_sched_fence_scheduled(s_fence, fence);
> > > > > -
> > > > > -    if (!IS_ERR_OR_NULL(fence)) {
> > > > > -        r = dma_fence_add_callback(fence, &sched_job->cb,
> > > > > -                       drm_sched_job_done_cb);
> > > > > -        if (r == -ENOENT)
> > > > > -            drm_sched_job_done(sched_job, fence->error);
> > > > > -        else if (r)
> > > > > -            DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> > > > > -
> > > > > -        dma_fence_put(fence);
> > > > > -    } else {
> > > > > -        drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > > > > -                   PTR_ERR(fence) : 0);
> > > > > -    }
> > > > > -
> > > > > -    wake_up(&sched->job_scheduled);
> > > > > -    drm_sched_run_job_queue(sched);
> > > > > +    if (submitted_credits)
> > > > > +        wake_up(&sched->job_scheduled);
> > > > >    }
> > > > >      static struct workqueue_struct *drm_sched_alloc_wq(const char *name)
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
> > > > > index e22f9ff88822..f0afdc0bd417 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_rq.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> > > > > @@ -197,9 +197,7 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
> > > > >     *
> > > > >     * Find oldest waiting ready entity.
> > > > >     *
> > > > > - * Return an entity if one is found; return an error-pointer (!NULL) if an
> > > > > - * entity was ready, but the scheduler had insufficient credits to accommodate
> > > > > - * its job; return NULL, if no ready entity was found.
> > > > > + * Return an entity if one is found or NULL if no ready entity was found.
> > > > >     */
> > > > >    struct drm_sched_entity *
> > > > >    drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> > > > > @@ -213,14 +211,6 @@ drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> > > > >              entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> > > > >            if (drm_sched_entity_is_ready(entity)) {
> > > > > -            /* If we can't queue yet, preserve the current entity in
> > > > > -             * terms of fairness.
> > > > > -             */
> > > > > -            if (!drm_sched_can_queue(sched, entity)) {
> > > > > -                spin_unlock(&rq->lock);
> > > > > -                return ERR_PTR(-ENOSPC);
> > > > > -            }
> > > > > -
> > > > >                reinit_completion(&entity->entity_idle);
> > > > >                break;
> > > > >            }
> > > > 
> > > 
> > 
> 
