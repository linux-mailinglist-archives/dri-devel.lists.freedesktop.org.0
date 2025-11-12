Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A525AC50AC4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 07:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9431E10E6A8;
	Wed, 12 Nov 2025 06:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yosjfc9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6348510E06A;
 Wed, 12 Nov 2025 06:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762927637; x=1794463637;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3cNPcHR/r4PsbIHj+1ToKqnbm/slDRjBZLXlUTqf3uY=;
 b=Yosjfc9wx6/idHsDCARIw0iL4+jNSiVwwgxcIr31L6yKHDLNENYzfNUn
 dgNnuKgcxRZS+Vko2MOK8Rvw8kiUDZr2hcDun9ANd6fKnl6CIEDDeXBJC
 kWHlNCKo4KyIg4XADstYlXI3KkS74ZGbIIqgaUaiLdc2C8v7kM3/H3Hzh
 9zUvCu6qEwc/LeMv/FTRGvLVRFk/KpB+pJs9WHxEremaIYw+8hj8bU6MO
 UVLS68G66AgTfdFiLe3wDT8da3mfDobkBSeJ4mItt/Gbi+UFY93QDKuCJ
 aHZTXkAnAral0rx+TJ60/nBCaoZC8Sr+5+PYjVUEC1XvVOI9T+YmYWe7R g==;
X-CSE-ConnectionGUID: QgBuOU4WQyGO78Cd2SVS/A==
X-CSE-MsgGUID: USrDfxbxQc+CguHpHvu7Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="63991147"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="63991147"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 22:07:16 -0800
X-CSE-ConnectionGUID: 3cj8tSSfQ/+GPWD6cZl29w==
X-CSE-MsgGUID: k2s0D2OISq+3vlsa32iLUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="194115486"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 22:07:16 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 22:07:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 22:07:16 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 22:07:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkEQ7vfeB5oUKiMqtVAxOVITIF6BXE5OVGUJcGD9Ug+aOC3h2r+91quKVDv7iSCji3QaenrGIq/F1uPj01HaR8txLHcBaQkrtmHZW7C40Z3v9+W59UwKai1jCOUltUnSBdjB0zQ/ET6Z7R8lSL7Pd/D1UCX9zulPUTgWfgRZDixGT1IQV18OvOFdI9vkoivX/8Y0TWKWCD3FWX3J0etnxYo1eUUVmm0hVB5mt/rSY8ORUJstqGkx/QJIVs+/xDMf6o4Vo08ChIwBvmVkd35oAWxgNJtP6xXeNYDvJ9KwK/L1MPkyAOzNtzS5caD7COMsTg71mAHDxFt6JrZCwA8iew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HECooAuE6LtlItCehOoDCAZML+R4nx8UZx0ZZinLtnE=;
 b=WOrT428LmO5WozTBJPmd3uWIDVg8m3id1Sv0kmHN8kdaPo8cLR25/gQGK/FMXE0oK2xkGAEmlqdWYtITtk8KXkSR+Qkv5Oyqjal0gl1WAGw3InFQ98EWdcQgGAgSxcVc96BBn+6qtTL0yejSXIUlbSBjX5fJEzZWKeweYfqG/9TYL7rvlizjzACSz2A1A6z9kxIVZGQN1/cc8wiAFqamM12P4ZDdGXmtiyQZTX8fhYFl1dM0wDdRxhvuGrFLMGxG+k8YYVAABXTgQOjeNLZMPMER9/wWtkKIh0M2llS2gW92o71mYg/ZlBC7m7Oa5JAEMqB6O2gxNqB6bEnGxQa/pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SN7PR11MB6947.namprd11.prod.outlook.com
 (2603:10b6:806:2aa::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 06:07:14 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%8]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 06:07:14 +0000
Message-ID: <c02af65a-4b5c-47d6-b1b0-6216fd0e3e0c@intel.com>
Date: Wed, 12 Nov 2025 11:37:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] drm/pagemap, drm/xe: Add refcounting to struct
 drm_pagemap
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dakr@kernel.org>, "Mrozek, Michal" <michal.mrozek@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <20251111164408.113070-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251111164408.113070-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SN7PR11MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: fcead7f2-d0dd-4e33-5a1e-08de21b1b9d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFNzeFIvVkhBOSt4aW9qQUI3UUdzOFpKeFRIWUJXSmhrV1VzY2JETEd0c2Za?=
 =?utf-8?B?dEtzazRiRnFqL0xwNk1ybTdha2dsV1RUSnp0em1zbVNtdllFenBacldwSHpS?=
 =?utf-8?B?TVBVa0xmaE83bzFtdWw4NXUya2wweVZlVW1tRDNZc2lLM0l2b0FIdExKS2FY?=
 =?utf-8?B?cDYyNmcxQjVvRGpCMktpemdhdjVqK0JLY1cvTmJEMFB1alRSdnlvSW5UaDhY?=
 =?utf-8?B?ejJxK2J3T2NzWVQxcHNKNUtVc2g0TmhwY3haai9FOEpoS2Y3VXdKR1BOSEVP?=
 =?utf-8?B?bVYzd1VHVkJmTGdrUHpWZTZMK3lhUVMvdlZkUUswWWdNZ0NRODhTMUc1Yktp?=
 =?utf-8?B?M0F3c21DckUybGRQSzBwcTU4dSsxSWhlaHpJaC9RM0EyU1l1eExBSUlmS0lI?=
 =?utf-8?B?N1M2bWdva0ZDY3Q3c0lyNjZEV0ZER0ZZWWhtcmx0ODRIdk5wR1IxdS9SL0xQ?=
 =?utf-8?B?NTFsdEk4RHF1TkNBd2N3T09KbzZOcEtBSlRpTWlyRGRiYmJRRXdpZ0ZpbXNx?=
 =?utf-8?B?Um92cGxrYkVmTmNQSjE4N214K1VubkwyV1FDNEczd1BjTllPYW1iY2g2THNR?=
 =?utf-8?B?Qkc1Q09jOUgrRzZSYzN1T2tVNWtteXhoRWsvWldqVzlPRjl6ZVl4cXNqYUh5?=
 =?utf-8?B?aldISlNQRys5RkdQU1RBWVBISmJua2xieERPK0pQS3p0a3JWYmxuMEFvd09t?=
 =?utf-8?B?SFo1VkZvYUlJTGxOZkY3TXhncnkvMXNLeGJLQmR2NmpjY0FONE9HV1ZseE1a?=
 =?utf-8?B?c2ZqM2dDZzB4M1FnZUxxdDl2M0RyVlZJcTVLT3V2cU1HWkVTSy9LN1FEdGtr?=
 =?utf-8?B?L2RwWWZaV3Bzd1Q2K2JiNVI5TjhqNE9VbE9kWFozQkF5RXM1d0x1TjBZVmYy?=
 =?utf-8?B?SGtpN1hiSDQ2cU9rWXF6VXVlczJLbjdndjA3RktMcE90WGE3b291Sml6NlFj?=
 =?utf-8?B?V1dVRzRTOSsyL09yeXBtNGFLd0J1QjYxNkRLdnNJcDdEUHIzRzBoUDF3Z1FX?=
 =?utf-8?B?a0hrdlc2USt1Qk5vRkE0Y05KakFjSUthSGp3WWZrUGxrSFVvQkVMMDRhQkRy?=
 =?utf-8?B?OHhIcktWNjJFNlVtZWN0V0ZRbWxsTnhWTGVmb1gvc3BRZnhYY2xZUEFrRTVw?=
 =?utf-8?B?Tm1wWFBkcFlTR0pqTFZNZjR6dHZpZTY4UXQxU2hhY05Wc2JWRnZmNURXUXkw?=
 =?utf-8?B?NGR6OE1aN1hnSlpLRkx6UGtUdGVYcnF6WkFwKzh4TmRsc0NKeGVtWG0vNUpn?=
 =?utf-8?B?T2FVUHlvRHNvWlZkQXpiVG5sTEgyZ0V3VHU3dERMZ25wSlRtQ09nSXQ2T1Aw?=
 =?utf-8?B?Q3prT2tGR3RzTjVOZWQ3UFVDZFJPTlRkWFBOa3g3RzdCdXhEZ3h6RHdVcVp0?=
 =?utf-8?B?TFI0TlNXaEZBQnhWdUlTeVhNelMwelgzMXdnd1VMRGlUYUdObTNrbWt5RE1S?=
 =?utf-8?B?a0pzcEdTbnc2U0FrK2RGOWQxbEgybmZ4Vllrb3dFUGYxc0RSNys1bDR1bGFh?=
 =?utf-8?B?eFpPbzNQM2UwUFY5aC9VeFNRenF1ZENJNTZuSjZUZTVwME91cW9Vcmw5QmJm?=
 =?utf-8?B?WFNxT0NxWHJzd2EyR1NBUWNpYkVIQ0lxR3pPSWZKT1RpbFhLUUszUW1XVUtS?=
 =?utf-8?B?UVJvbFYyTW9qUHlnNCtPYkhWN3NJejBTVnhWUlArU096NnF3OUl3MENRN1Y2?=
 =?utf-8?B?R0YwakRGZENVa2E3a05KeFpON3d6STV1amNFY2FYNGZqZ3lQaVh1aWwwdVh5?=
 =?utf-8?B?c1JuR3hkaFd6WGQvOWc4OHNTWTZOcDBaUHczak92N2wxV2gyMzBiMlZYSHN3?=
 =?utf-8?B?UUg1WGxhWlYxM0dhNHM5MzJzemJya200U1FUTzVxc3RIY2FZUGUwQ0pTUGMx?=
 =?utf-8?B?VVNoVUNzeVlBTWJZckNBWXVtZXpFNzFOVEp6dGV6dmY4SkZTUU9DK0xHVm9x?=
 =?utf-8?Q?NSujw1t6retO2V2LIbSquN5h9porMiMc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjRDRVFXLzMyVmVoanY4S0xQdVAzdFZLUmtqNlFtVU1qV1JML0FNR2VCSkZE?=
 =?utf-8?B?Z0xtaE9oWHFrelRCNW1DMENFREkxUUpKRHJjSlJ0aFF2UXFTdXFhQnVYVy8w?=
 =?utf-8?B?OGZHaVdSaXEwYzNXTExEOFMxbjFxTWxhMGRyTEFqVTh0K3JLd1o4YStabjR4?=
 =?utf-8?B?YTZCOWU1YnJzOXB4NlBYeG1LL2tTTmFGeXU1WDRlZ0FwMGU2WmdaRUdsS1pV?=
 =?utf-8?B?VTYxczY4aHhoZEFDSzBRNEUzTnFFdDZoSXI1b1IzNW91OVF2TnFUOXg2YmhN?=
 =?utf-8?B?dWlCQkQ0NkY2ZVdGajFwMFRyWEUwQzBoSHd5ajhEdUdzRGhpRWx0aWlpVHVh?=
 =?utf-8?B?UDlEb2FLZG93c290TDhwTTlSVS9NNDdoUEEyMG9McU9ETVgrT1JKVnIxMVk2?=
 =?utf-8?B?VzR2Qmp6YTJ5bHBKbktHY2RBTERpUXBBL3RLaWZack0xajdrVlJaNzFXUWJy?=
 =?utf-8?B?OHpHajlVdjF5Vk1MNUkzSndIcEFUN1Q1QXF6bVV2TzVReE5Rb3VscVV4Sk45?=
 =?utf-8?B?V0Z6L1VXNE9ENjZpbFFXbjNkdlVDL29NMnQ3aDF3bmZpZEFSRlhFRVUrSThG?=
 =?utf-8?B?dWY0Ui9yK2lsNkRRUzBwem5PYUw3RE91WTAyVGhXeU9Yc3hRa2dsMUplZEtQ?=
 =?utf-8?B?QVdBb1FRWVR1YzBWK2d4bUxSa3JYakJJdGphZVdiQzRBZjArdTl5ZlNxM2Yx?=
 =?utf-8?B?UDRXRy9lMmNJK3ZkL2trYTVaT3I1K0tzYy9TOWhTVmkrclRZTFdpbkdreE12?=
 =?utf-8?B?eGg5RlJ2dHN5WVZQNWFBRzRWMnp4b2NVWnd5TVVsSjhIY1Q3YUtnYi82Uzdl?=
 =?utf-8?B?WW1Kb1BWTjZvanplR0lIUVNxSUxFZ0JhbDNXRkFqTGxrU21QSkZtVXJWODVC?=
 =?utf-8?B?c211MTcrSkpMYWhJaC95ZDJPTUpNODZ6dE9DbE45bUM3SHVVMTY1UEZrNHF3?=
 =?utf-8?B?ODBIV3RWQWRmTnI3aC83ajhNSXdNRlNpQmZkY1lyQ1pWK2NhYk9ZTXFxa3NY?=
 =?utf-8?B?UG5xc0RpRytKcmZmQkluUDB0ZlpIa25KbitBeTFWRkNjb3VDaXB0Rm55T3V3?=
 =?utf-8?B?MnMrQXBFUTJGTjY0TjBhNTdXeE5TMytuNmdtWW5vbW1rSDJHT1daTlRvdkxH?=
 =?utf-8?B?ZDk0Tzh0WkQ3STVtcHgxc2p2bU5wVzVyRGRTNWZ5Wm9JcW9OZmxoVnE4dFJS?=
 =?utf-8?B?RzhTLzRmLytIVTk1Q2NWOXIySVVwMEJVeDRLS29jQmQxOEhNa3dKVDZiR1A2?=
 =?utf-8?B?Y094bncxZGI3YWZjQW8zZnMrQllSaVVaRmFBcURkME54aTFETlNQRzJiZUpP?=
 =?utf-8?B?YmRhVThVK2lub2FJQ1Y0NHc2VkI5N0NMd0QvK3cwSTFmb244Q1l3T095ckN4?=
 =?utf-8?B?QUJlL0pRelJhL0ZBaVNWTUEyaFdZNlQ5dnZaZGhzNmhzU1l1V3pUbUpZWFFX?=
 =?utf-8?B?NTVPTXk5S2pDeHovZXJDTTlxbmM2eWxsVEljcUtOU3c5Tjg5VnZ3YWp2NEoy?=
 =?utf-8?B?WDNGNXZjMmlSa1Z5R0w4dmZuUVFZWlJXZHYreGZzejc3bTJPcmM5U0prcEZx?=
 =?utf-8?B?aWFRRWNhYkxEdWR5eS96OEtZVWs5NWZ6V3N5UkdFZDAyUTdFQnFqMjZpcXR6?=
 =?utf-8?B?c2NXSDllZDFwWEoxVUZzQ0pZTGwzQWQ0enlyeERLUjRRdkdmdXRXNWVVS09o?=
 =?utf-8?B?Y0d2M3hUUTA5emkrM2NoNDJTRmpSTGZyMHdLRFdxdVd3dkdIcldjbzdEMDFV?=
 =?utf-8?B?T0RCcm80bldsQThiem16WWVzaFNzZVZEcGpqMUdkblFDZVNrM3kxZWo5ZXRF?=
 =?utf-8?B?bEhkWGNmb0ZvWUhOWFNYUENKRW5qUG1zUGlXMFFPSS9HK1hyUlFFeWV4Q2Ji?=
 =?utf-8?B?MFllakl5UFRNanU0YnpEWXNGeWtQcHBFcHJqYzI5SFovMmp1VWJXVXI0NWxj?=
 =?utf-8?B?eWdtMGZqR0dWVFU3b2tvVEhObldTKzEwcTlpamVsaksrc1B1U0JNd0ppdXhv?=
 =?utf-8?B?ZjltcjRMZ2lnU3cvd0p5RkRwRGh2QWFKS2kwM2lLWWxEd3dPWXBjdmx3ZnRL?=
 =?utf-8?B?RzNWcnZTNVJSRksvM1FSRWhrbFdmbk1FcTh5cjFHMnN3ZlVIeHA0eHJzem1G?=
 =?utf-8?B?YlVFbVpiSlV3ekpJdng4N1E5MlhXMVk2eUNJUm94N3BoK3R3bldvVUdjRTgw?=
 =?utf-8?Q?01SHzV7SX+B3rxSIUKsjaZw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcead7f2-d0dd-4e33-5a1e-08de21b1b9d1
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 06:07:14.7433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YRfmFNBL82HN4PKmLs2i290w1JWDxcn2w5DBF661buKM+bya+oCJV4T9IzsgcBasnDGd6XEU8Myuk2HwPOH9/75uourdIO0dlm+BcIBmSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6947
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



On 11-11-2025 22:13, Thomas Hellström wrote:
> With the end goal of being able to free unused pagemaps
> and allocate them on demand, add a refcount to struct drm_pagemap,
> remove the xe embedded drm_pagemap, allocating and freeing it
> explicitly.
> 
> v2:
> - Make the drm_pagemap pointer in drm_gpusvm_pages reference-counted.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
> ---
>   drivers/gpu/drm/drm_gpusvm.c       |  4 ++-
>   drivers/gpu/drm/drm_pagemap.c      | 51 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_svm.c        | 26 ++++++++++-----
>   drivers/gpu/drm/xe/xe_vram_types.h |  2 +-
>   include/drm/drm_pagemap.h          | 36 +++++++++++++++++++++
>   5 files changed, 109 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 73e550c8ff8c..1f96375d1f2b 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1038,6 +1038,7 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
>   		flags.has_dma_mapping = false;
>   		WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
>   
> +		drm_pagemap_put(svm_pages->dpagemap);
>   		svm_pages->dpagemap = NULL;
>   	}
>   }
> @@ -1431,7 +1432,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>   
>   	if (pagemap) {
>   		flags.has_devmem_pages = true;
> -		svm_pages->dpagemap = dpagemap;
> +		drm_pagemap_put(svm_pages->dpagemap);

Dont we risk a UAF for dpagemap if svm_pages->dpagemap is same as dpagemap ?

> +		svm_pages->dpagemap = drm_pagemap_get(dpagemap);
>   	}
>   
>   	/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 22c44807e3fe..4b8692f0b2a2 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -538,6 +538,57 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>   	return -ENOMEM;
>   }
>   
> +static void drm_pagemap_release(struct kref *ref)
> +{
> +	struct drm_pagemap *dpagemap = container_of(ref, typeof(*dpagemap), ref);
> +
> +	kfree(dpagemap);
> +}
> +
> +/**
> + * drm_pagemap_create() - Create a struct drm_pagemap.
> + * @dev: Pointer to a struct device providing the device-private memory.
> + * @pagemap: Pointer to a pre-setup struct dev_pagemap providing the struct pages.
> + * @ops: Pointer to the struct drm_pagemap_ops.
> + *
> + * Allocate and initialize a struct drm_pagemap.
> + *
> + * Return: A refcounted pointer to a struct drm_pagemap on success.
> + * Error pointer on error.
> + */
> +struct drm_pagemap *
> +drm_pagemap_create(struct device *dev,
> +		   struct dev_pagemap *pagemap,
> +		   const struct drm_pagemap_ops *ops)
> +{
> +	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
> +
> +	if (!dpagemap)
> +		return ERR_PTR(-ENOMEM);
> +
> +	kref_init(&dpagemap->ref);
> +	dpagemap->dev = dev;
> +	dpagemap->ops = ops;
> +	dpagemap->pagemap = pagemap;
> +
> +	return dpagemap;
> +}
> +EXPORT_SYMBOL(drm_pagemap_create);
> +
> +/**
> + * drm_pagemap_put() - Put a struct drm_pagemap reference
> + * @dpagemap: Pointer to a struct drm_pagemap object.
> + *
> + * Puts a struct drm_pagemap reference and frees the drm_pagemap object
> + * if the refount reaches zero.
> + */
> +void drm_pagemap_put(struct drm_pagemap *dpagemap)
> +{
> +	if (likely(dpagemap))
> +		kref_put(&dpagemap->ref, drm_pagemap_release);
> +}
> +EXPORT_SYMBOL(drm_pagemap_put);
> +
>   /**
>    * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
>    * @devmem_allocation: Pointer to the device memory allocation
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 894e8f092e3f..a3f97cf9c254 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -860,7 +860,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>   				      struct mm_struct *mm,
>   				      unsigned long timeslice_ms)
>   {
> -	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
> +	struct xe_vram_region *vr = container_of(dpagemap->pagemap, typeof(*vr), pagemap);
>   	struct xe_device *xe = vr->xe;
>   	struct device *dev = xe->drm.dev;
>   	struct drm_buddy_block *block;
> @@ -1371,7 +1371,7 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>   
>   static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
>   {
> -	return &tile->mem.vram->dpagemap;
> +	return tile->mem.vram->dpagemap;
>   }
>   
>   /**
> @@ -1481,6 +1481,15 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>   		return ret;
>   	}
>   
> +	vr->dpagemap = drm_pagemap_create(dev, &vr->pagemap,
> +					  &xe_drm_pagemap_ops);
> +	if (IS_ERR(vr->dpagemap)) {
> +		drm_err(&xe->drm, "Failed to create drm_pagemap tile %d memory: %pe\n",
> +			tile->id, vr->dpagemap);
> +		ret = PTR_ERR(vr->dpagemap);
> +		goto out_no_dpagemap;
> +	}
> +
>   	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
>   	vr->pagemap.range.start = res->start;
>   	vr->pagemap.range.end = res->end;
> @@ -1488,22 +1497,23 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>   	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
>   	vr->pagemap.owner = xe_svm_devm_owner(xe);
>   	addr = devm_memremap_pages(dev, &vr->pagemap);
> -
> -	vr->dpagemap.dev = dev;
> -	vr->dpagemap.ops = &xe_drm_pagemap_ops;
> -
>   	if (IS_ERR(addr)) {
> -		devm_release_mem_region(dev, res->start, resource_size(res));
>   		ret = PTR_ERR(addr);
>   		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
>   			tile->id, ERR_PTR(ret));
> -		return ret;
> +		goto out_failed_memremap;
>   	}
>   	vr->hpa_base = res->start;
>   
>   	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
>   		tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
>   	return 0;
> +
> +out_failed_memremap:
> +	drm_pagemap_put(vr->dpagemap);
> +out_no_dpagemap:
> +	devm_release_mem_region(dev, res->start, resource_size(res));
> +	return ret;
>   }
>   #else
>   int xe_svm_alloc_vram(struct xe_tile *tile,
> diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
> index 83772dcbf1af..c0d2c5ee8c10 100644
> --- a/drivers/gpu/drm/xe/xe_vram_types.h
> +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> @@ -72,7 +72,7 @@ struct xe_vram_region {
>   	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
>   	 * pages of this tile.
>   	 */
> -	struct drm_pagemap dpagemap;
> +	struct drm_pagemap *dpagemap;
>   	/**
>   	 * @hpa_base: base host physical address
>   	 *
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index f6e7e234c089..2c7de928865b 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -129,11 +129,15 @@ struct drm_pagemap_ops {
>    * struct drm_pagemap: Additional information for a struct dev_pagemap
>    * used for device p2p handshaking.
>    * @ops: The struct drm_pagemap_ops.
> + * @ref: Reference count.
>    * @dev: The struct drevice owning the device-private memory.
> + * @pagemap: Pointer to the underlying dev_pagemap.
>    */
>   struct drm_pagemap {
>   	const struct drm_pagemap_ops *ops;
> +	struct kref ref;
>   	struct device *dev;
> +	struct dev_pagemap *pagemap;
>   };
>   
>   struct drm_pagemap_devmem;
> @@ -202,6 +206,37 @@ struct drm_pagemap_devmem_ops {
>   			   unsigned long npages);
>   };
>   
> +struct drm_pagemap *drm_pagemap_create(struct device *dev,
> +				       struct dev_pagemap *pagemap,
> +				       const struct drm_pagemap_ops *ops);
> +
> +#if IS_ENABLED(CONFIG_DRM_GPUSVM)
> +
> +void drm_pagemap_put(struct drm_pagemap *dpagemap);
> +
> +#else
> +
> +static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
> +{
> +}
> +
> +#endif /* IS_ENABLED(CONFIG_DRM_GPUSVM) */
> +
> +/**
> + * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
> + * @dpagemap: Pointer to the struct drm_pagemap.
> + *
> + * Return: Pointer to the struct drm_pagemap.
> + */
> +static inline struct drm_pagemap *
> +drm_pagemap_get(struct drm_pagemap *dpagemap)
> +{
> +	if (likely(dpagemap))
> +		kref_get(&dpagemap->ref);
> +
> +	return dpagemap;
> +}
> +
>   /**
>    * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
>    *
> @@ -246,3 +281,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>   			    unsigned long timeslice_ms);
>   
>   #endif
> +

