Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2420AA14C56
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C776F10E0B7;
	Fri, 17 Jan 2025 09:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPbQSUju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D16010E0B7;
 Fri, 17 Jan 2025 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737107258; x=1768643258;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qi/CUmhhbGYliVJkprsNP1ZwBNXtJ8kWyFXEaYP9WIM=;
 b=LPbQSUjul/GsyBNqDh9AIRKPAdOKoclkH5KsCGxGLUJt/MNLjpXHbfba
 82rH/lMwz6W92Bp28m5XlbJCNKXFRW6UOPv8EA8SDLde8DqAfe0Cjg0Q7
 lvML4bWgt5Qp9x7uyWh27Xsh2oSp02NKJ1cp7Zs3dAmdyNMuZWYx4TCib
 IOGmXm36LPfu3Zt5MoqSexiPJE6OFsfexzTy+adn8a5Nr9sSgB5UFt7mY
 0FK7bv7sqIMSxrgahUwbPDQ9K3eaSg75YEcxJH+2qTKGthuF6GdgTREqq
 VXvD6dRWb2Sk+/VMsnTTD7gn99bssqfIUfozgihbztoUYc3g+N/mudsCW A==;
X-CSE-ConnectionGUID: fBhGaSHNRFO4zcXQerGlbg==
X-CSE-MsgGUID: P0vUSxGiQCuf41QWksM6Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="54945122"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="54945122"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 01:47:38 -0800
X-CSE-ConnectionGUID: 6AL7hbh1QFCAeoMIbm97hQ==
X-CSE-MsgGUID: 7g1alLG0SkmgUaXVKBG40g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="106306309"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 01:47:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 01:47:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 01:47:35 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 01:47:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IN5MiDlWVIjtozG/R5oeegQjV0R1HO/TZQfnC1oyOvYHEJhGSOGSN/E4DqokR/GfcVRtuftdK50H6nVxfeqT1Dnf7fMpuKtlsYvN9Xzx1lQL9wn2zO9M7m8gIBE71X1Ycf0kqFPkhNqCWpPQcQmu28J0lC6GjLfZjRm+LCzhSQGfBV51DJU96Wx35Bs5OKrRaiRz/wQgAhsZVl+lxTeURgwPoaVae5KPXtPim7W8bJXROpwfjePS9xyQXVvloauJnK+oOA4kKtQQAzjIQ6CMCAOvfupyX4gYFeVuhwLXT6lHGbiln4X7njo4yUgWfXKRggiP+vxmMcYg/ksxV49VJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5y/Nh6FbGnD8h5JYipkXiMPlekHOH7LLAugml9MmlyY=;
 b=YdHyH7KIzZ0qi6wY6pwCt20Cv3Ai7udzoAroxrLp55d0IX/YbNIL16bqFJ3cGo3ixclobBR8Kfanxq3cs+Z5nNVCvfFJKdFhVu8egVgsM0LSodYOula4cUpNSL59OyhQsAXWpza2yRMk8cQBDBcY+x9JmOkzqwZw+gUYgfeTZ+j0nhO9RZyyswfXEX6HRkJl0Q+D4ctgU2lj2EHHGbe6W4YLFccC+0VRGDAPRN4gYfyU+ElkR/dSFQnpmvsM3VvEo2P6mg7CHOqmAEU9l79LvNeJqJwTkbHLDpoaS7+RuYNAtH80GgB0mWiR6+Y2qRsYVK3TAg9lrVcDwNIYrk5Wrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.17; Fri, 17 Jan 2025 09:47:19 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%4]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 09:47:19 +0000
Message-ID: <1e2dc3b7-4c49-4372-b8ae-80829d502d88@intel.com>
Date: Fri, 17 Jan 2025 11:47:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/30] Introduce GPU SVM and Xe SVM implementation
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <1c737521-70d9-4779-a044-90a6fb223a5e@intel.com>
Content-Language: en-US
In-Reply-To: <1c737521-70d9-4779-a044-90a6fb223a5e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0123.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::20) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fbe18bb-a11e-4533-5776-08dd36dbeeed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGZGUEpoL2Z4SGFhcjZ0RXpTdHhZWm1HeDdxd3E3UmNwajhNTEFGL0tCZkpu?=
 =?utf-8?B?clhnUEExSkV2RmwyeGdQMm1uQ3FaRGtJMmluN1FGNVBKOGlycm5haGNCZzF6?=
 =?utf-8?B?bWFPVytlZ1ZaS3RkcWFDMDArSlVJTjExNTUvbmY5Z0MyNno4MEZDTklySXFP?=
 =?utf-8?B?eWdmRjNEUmVrb3hZNFlXNFdVZnhkRm93dW5LOVBQcXdhVnlkSFpURXVJK3NZ?=
 =?utf-8?B?NWdncW1DNE4yWGd3Z1FEOVRjYU5DQjhyQjNUdXJVVGpmQ2VvNkFtRWp6WDQw?=
 =?utf-8?B?ZTludjMvTUlSWk5XNHpXY1B3enZTVW90dEk3ZER0alBzMk54Yy9IZ3FUQWpw?=
 =?utf-8?B?U010ZUFTU2IvNGtncGJwR3JiWjJYd21HTGFhMEJ0VkZLVGsxNHFacWJnZ1NG?=
 =?utf-8?B?UFkwMmhrbExMQTZwVTBSbWdtdkNBbllnSURMa0lyUy9EZDNjbk5vTkNOWWxz?=
 =?utf-8?B?QWtMSkJ1b3lnN1FWeU9PVnZXNVZ0Y3I3L1Y3VDJQd21TYnVKajFBVTNReHA0?=
 =?utf-8?B?a2dndzJ5SStkQnlkbkR0Nk1aN3lYRHdEUm1qbWF3U0lFRVV6ZkVVeEFPa2VO?=
 =?utf-8?B?UzBiOG5DaFlYVjRnMkNyMHdGREZFS1BhUEUzN2pDZ2lyajVvdUc1TlFCOW9V?=
 =?utf-8?B?MFlJZXhwM1lvYnI2SEE2VEdXVFVBem1HSmtJdHVnYUZuMjU0RUJGaXE5cy9E?=
 =?utf-8?B?bmRlendiQXVxNXVNUjVGd3l1UWd4R2JER1RpUTNzVHRMRkpONzZxKzdHcjRO?=
 =?utf-8?B?U2pzclcwT2NhV0Z2RmZDSVQ2NWxQTFhFMDA1MVVpWHYxdHRnSHFjVmM0cW1O?=
 =?utf-8?B?cjVtbjNwWEtrdUVQZ05VU2h5T2F4cjE5TGR2aEdCb3pwcThPTlpNSEk0ODJt?=
 =?utf-8?B?UnN1Ump4SlZpYUpSczZ6bGdwd3VENkczVURDSmJaQjNVYmtlRTFudXdtYzI4?=
 =?utf-8?B?bWFrUGNxTVd5Rm1ndXhKcElQRnI2OWYzYUN1K0ZLOHd4eEVjVVovdVBUTmxS?=
 =?utf-8?B?eEovd0hSVWZHOStXM3FaMlJ5QW0vNXYwNU1NWEZiTjZJNi8zQXdNQnpkUllC?=
 =?utf-8?B?empQQ0w2bExzV3ZibzVEaEU2Y0RXd1piSnAxZUpOKzNGTTZUdzZHMUQ1OXZw?=
 =?utf-8?B?YWI4b253RndtLzNDYkdFMHpLZXhtUkZWM1BWSWwzVVlKRlJqUTNVdlY2UG9X?=
 =?utf-8?B?WTFST2ladVg3M1hhMS9KZDQxcDFveXBzamRuWFJoZjBJVld0ajlYNzVHVGtS?=
 =?utf-8?B?d3J3MnpESjlaQm9sa2JYWlYzcWhMUjV5bGRFS05jZm84NTdrR2FUR0RqWlhl?=
 =?utf-8?B?SlNJN0d1Yy9vekVhY2VRN1puZzViRW5aZjgxVmc3NDNTTzF6TEE5ZFZZZE9u?=
 =?utf-8?B?Zmt6Qm1mYnozMzQ2RXBzaUtnZ2JTQzMwbUxHa3hUZUhCK0JyU2N4b2h1QVY2?=
 =?utf-8?B?SmNhNlE3Y3lwSU9pOFVMZ2tYcSs0Nis5bjVaNnhJWlhmQVZwQm4vOGhLZUkw?=
 =?utf-8?B?SzFDcWh3cFVuSzFmWjBpRWgxQkRIM3ZEemZEZ1lGeDNiR250eGxpL1czVU5V?=
 =?utf-8?B?c0xxYmwyU0F6a2Y1VHBZZmFPMHlDUmtrMzVjL1VoenkrdHZla3l5aE0rL0k2?=
 =?utf-8?B?Znp5Q2owRFFvVFhNNGMwWmFDdVdjTkhVc1RXcHdDYVMyZDIyM0Erd1lwdDI5?=
 =?utf-8?B?QUVSNXRzUHVPbXg0a3QvbVE3Z21XMGNWdG1BUURVc3p4TWRUT093VEF4TkxU?=
 =?utf-8?B?aE9hT291aHNGS1FUNHdQWGJlOEtkc2NaVERiOEpoeHFwa0pRWlhaWllzWW5Y?=
 =?utf-8?B?eGpFZkFvamVOQ09admFUUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3d2bktvdTFnYmcxaXpLQWdrVmdnVkpNY1pBQkFONk5zTTNsb1V6Y3JLOHpV?=
 =?utf-8?B?dE9xY0RiWFlkSnM2VGdseXpFRFdRakdudGQ4N1pjUTl1WU1tUHJFRkZURWRR?=
 =?utf-8?B?WndJQXl0cGVFTDgwamZjYWQ5SXQ5RmUzTUFJeUhuampnTER0Q2JyeG10RDRU?=
 =?utf-8?B?dDRMUmlhdllWYmJ3L3NaS2RlTnVNUDg5d251VFp2Q3dYQXNnaC96ajQ4aU9r?=
 =?utf-8?B?UWRHMUxWNHZYMmlpTGcxUjgzNzdOUmcybERyekx1ZTBtZjVPTHlTdy9rTXFq?=
 =?utf-8?B?SWMzQmpQNkg4bFJGcUE0OS83QkNNeFcxS1ZVdENyUU1yNFhYckdGeEF2c1ZL?=
 =?utf-8?B?VlNmQnd5UnRIM2FIM3crcnVUSUFpemx2TDlOdTZGWW5EU2dkSnJvbGdYU2M1?=
 =?utf-8?B?R1ZsY0paUFdtSkJodE5FMzQ3OFlFQ2F5bDBqQ09LR3VodnpOUTllS25nbk5o?=
 =?utf-8?B?L1JhU3NueHJ0UmltYWhGYzhoRFlqVmlna0FhZkdkVUlHZWlIcjkwc01CL3B6?=
 =?utf-8?B?Q3VZQUhkODZncXVBVjJJZlJka0RuSDZJRlI0bmt2YzNHM1lwdjhROFRUamNq?=
 =?utf-8?B?NlVpN2E1OXpLMmd3a0UxOEJaSWRvNVMxR1V0d3RMRlZ6NHlwVUc2eTNMUHg4?=
 =?utf-8?B?WTRPc0xhZWdUMWFTNHBKOXQvbDFBQ0RYNjdDWitsRU5mT2l4TEsybStCZFVP?=
 =?utf-8?B?L0ZhcGhGRWs2dlF6SVAybkFSMi9uU2FiNkxEOUlVeE9LWTRHWU9OM29vSW9q?=
 =?utf-8?B?WmJtT29YRjU0UEVQcCtsRlBXSE12WUxXa25pKzZ4V3ZGYW9TelcvelJWMm1k?=
 =?utf-8?B?emJPTzBoY1hWRW9nQ3o3VC96YStuZlA0cWI0eS9ZeTdvTkMrK0VBdlNzRFBN?=
 =?utf-8?B?Q1hRYjVvYWQ5alVLbWJxMm5ZUXBhcmVGb1Fvb3lhRlB2Q21BKzJ2bnFncEVh?=
 =?utf-8?B?QlkzeENzcW5pcFB6Wld1WlVoYm5WQ29iekRXWGM4NExWaCttdWdvdDlqQ2V3?=
 =?utf-8?B?eFIrQ00rbkZRM3NpWDErOHlHNzU2bW9ycFpEMFU3dm1QM1phaUhIcVdXQnJo?=
 =?utf-8?B?c3ZBNWVkdHJQZFg5WHgzdVR5azNGeThoQ05VTC81b3ZQMHp1Yy9Cb09Bdisw?=
 =?utf-8?B?amRmb3lGOEYrcTRBVnZmaW04QWxqeWhLcmdPbmhRY3dTOWpMUTJDdjFMc25D?=
 =?utf-8?B?NVpvTWRtSk9VNXJUSFY2ejMvR1ZEbXg4Q2VsaWxrUXFaK0xFKzBpWk84VFlh?=
 =?utf-8?B?MnJLQ2xmR3cvaGI3d29iMVFOWU5PR2RTQXQzSkdKczlNaVBTTTFCek9iRjJC?=
 =?utf-8?B?ejVMMExKR29rdjVHUmRZQ3NHYWdhWVRWM1J4NUx3MWNPUmFPOVQvaUQvc3Ev?=
 =?utf-8?B?YitueVhId0w2ZytRVkZ3dHBjV2JCQTdzZkpJUjEvTkd3ZGdVNmRWUmx5allL?=
 =?utf-8?B?VW55ZjZJWER1MlR3U056VW9rMmliMFppNHlmNVdGanlVcVFWZnZubGtpYjBN?=
 =?utf-8?B?WEwyNlBSR1VXaHlmVUNoYUdQcUE5eVlyQ1N3QWxNQWE4d2lNc2c4ZlRSOVZn?=
 =?utf-8?B?TlBaYjZOWEQ2N0ZTR05MR040UjRXTUg5dFhrVjMwb0I2a3pCK0V1VE5ybjcz?=
 =?utf-8?B?U2xQT3p6cTdIMmd5bUtzYTk2NUQ5Ynhwb1ZIVlJCYlJkS3lVeTE3b1BCbkd0?=
 =?utf-8?B?ZDJyY3NPTkMvVXozU3dTMjNzWE1YblJ4bVRqK0hCTU5JWW9IL3VVZDNNUVM2?=
 =?utf-8?B?YTg4dHB6cTRiNjdTdWxjQkhwWkduOEsxc0N4bStUN1dOTVRsRzdJYjZJU2la?=
 =?utf-8?B?WUZRRDJpZ1lyV202b1Jhalo3bHhseTFFdlArRXF4V2RZbUpwZXNWTFRxazk0?=
 =?utf-8?B?bVA2K1NXOG1LQUErMjE1N1N5VitoRFZ2MDk5RlpOSk9wS1ZVeGxZTjBwMkVE?=
 =?utf-8?B?SGpWMFZtOHczdTZhVVU4NWRDZEpBb1BrWWFzcG9Vd1NKdjNseHdFUkNUL2x5?=
 =?utf-8?B?aktQQU9FYmgxa0I4VE1Ed2Z5U1VibVFsVGJ5VlBnQkhnQ3MzWWVjcGcvZE9H?=
 =?utf-8?B?ZTh1aVRpc0JZV2p0NC9zMGlLdVpBek5kNC95ellNcHhGQmtIZmp0K0grVy9J?=
 =?utf-8?B?U2hnQ0VtUmE5cEdDVG5velVSV0hTZ1NiYXJYaUI0bUlrTEMrM0VWaEpyTHF2?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbe18bb-a11e-4533-5776-08dd36dbeeed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 09:47:19.2165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akiuluprRaq52kXapVkiVlZ6NMrn7XqH7CeR0hfr3aVQIffMJoiAECP/4jNLDSZVLcvAf1hyXJz2qMWW52B20BmcOMWJds7eh3zZPPo0vGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
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

Hi,
This kernel oops, which I reported before, was caused by my incorrect 
modification (incorrect applying of review comments) of this patch 
"[v3,19/30] drm/xe: Add SVM device memory mirroring"
( the kernel oops occurred because the xe_drm_pagemap_map_dma() and 
xe_devm_add() functions were built in the form of empty functions. )

This issue disappeared after proper patch modifications were applied.
So please ignore the previously reported this kernel oops.

Br,

G.G.

On 1/7/25 2:19 PM, Gwan-gyeong Mun wrote:
> Hi Matthew Brost,
> 
> After applying this patch series and the following to the latest drm- 
> tip, while testing[1] with the mentioned IGT, I faced a kernel oops[3].
> It makes prevent progressing of the mentioned igt tests.
> Could you please check the following oops log?
> 
> (1) apply comments of "[v3,05/30] drm/gpusvm: Add support for GPU Shared 
> Virtual Memory"
> (2) apply comments of "[v3,15/30] drm/xe: Add unbind to SVM garbage 
> collector"
> (3) drop "[v3,27/30] drm/xe: Basic SVM BO eviction" patch
> 
> The kernel config used, the entire dmesg, and detailed information can 
> be found in [2].
> 
> br,
> 
> G.G.
> 
> [1] used igt command: xe_exec_system_allocator --run-subtest once-malloc
> [2] https://gitlab.freedesktop.org/elongbug/drm-tip/-/snippets/7823
> 
> [3] kernel oops dmesg
> [   51.365230] Console: switching to colour VGA+ 80x25
> [   51.367772] [IGT] xe_exec_system_allocator: executing
> [   51.383611] [IGT] xe_exec_system_allocator: starting subtest once-malloc
> [   51.386066] xe 0000:00:04.0: [drm:vm_bind_ioctl_ops_create [xe]] 
> op=0, addr=0x0000000000000000, range=0x0001000000000000, 
> bo_offset_or_userptr=0x0000000000000000
> [   51.386171] xe 0000:00:04.0: [drm:vm_bind_ioctl_ops_create [xe]] MAP: 
> addr=0x0000000000000000, range=0x0001000000000000
> [   51.389429] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]] PAGE 
> FAULT: asid=1, gpusvm=0xffff8881775e9188, vram=0,0, 
> seqno=9223372036854775807, start=0x005584e8400000, end=0x005584e8410000, 
> size=65536
> [   51.389529] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]] 
> ALLOCATE VRAM: asid=1, gpusvm=0xffff8881775e9188, vram=0,0, 
> seqno=9223372036854775807, start=0x005584e8400000, end=0x005584e8410000, 
> size=65536
> [   51.389935] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]] ALLOC 
> VRAM: asid=1, gpusvm=0xffff8881775e9188, pfn=3126960, npages=16
> [   51.390048] xe 0000:00:04.0: [drm:xe_svm_invalidate [xe]] INVALIDATE: 
> asid=1, gpusvm=0xffff8881775e9188, seqno=3, start=0x00005584e8400000, 
> end=0x00005584e8410000, event=6
> [   51.390440] xe 0000:00:04.0: [drm:xe_svm_invalidate [xe]] NOTIFIER: 
> asid=1, gpusvm=0xffff8881775e9188, vram=0,0, seqno=9223372036854775807, 
> start=0x005584e8400000, end=0x005584e8410000, size=65536
> [   51.390948] Oops: general protection fault, probably for non- 
> canonical address 0x3fff88842fc80000: 0000 [#1] PREEMPT SMP NOPTI
> [   51.391624] CPU: 1 UID: 0 PID: 76 Comm: kworker/u17:0 Not tainted 
> 6.13.0-rc4-drm-tip-test+ #48
> [   51.392088] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
> BIOS 1.15.0-1 04/01/2014
> [   51.392527] Workqueue: xe_gt_page_fault_work_queue pf_queue_work_func 
> [xe]
> [   51.392947] RIP: 0010:zone_device_page_init+0x5d/0x240
> [   51.393228] Code: 04 dd ff e8 d5 d2 a1 00 5a 85 c0 0f 85 ba 00 00 00 
> e8 d7 bb df ff 85 c0 0f 84 9d 01 00 00 48 8b 45 38 a8 03 0f 85 ec 00 00 
> 00 <65> 48 ff 00 e8 aa d2 a1 00 85 c0 0f 85 0d 01 00 00 48 c7 c7 20 cb
> [   51.394247] RSP: 0018:ffffc9000039fb48 EFLAGS: 00010246
> [   51.394570] RAX: 4000000000000000 RBX: ffffea000bedac00 RCX: 
> 0000000000000000
> [   51.394950] RDX: 0000000000000046 RSI: ffffffff824c67b4 RDI: 
> ffffffff824e58f5
> [   51.395328] RBP: ffffea000bedac08 R08: 0000000000000015 R09: 
> 0000000000000004
> [   51.395709] R10: 0000000000000001 R11: 0000000000000004 R12: 
> 0000000000000001
> [   51.396093] R13: ffff888170fd8d40 R14: ffff88817f922640 R15: 
> ffffea000bedac00
> [   51.396472] FS:  0000000000000000(0000) GS:ffff88842fc80000(0000) 
> knlGS:0000000000000000
> [   51.396925] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   51.397237] CR2: 0000563d1f7ecbe4 CR3: 000000017c212000 CR4: 
> 0000000000750ef0
> [   51.397618] PKRU: 55555554
> [   51.397768] Call Trace:
> [   51.397904]  <TASK>
> [   51.398024]  ? __die_body.cold+0x19/0x26
> [   51.398238]  ? die_addr+0x38/0x60
> [   51.398420]  ? exc_general_protection+0x19e/0x450
> [   51.398678]  ? asm_exc_general_protection+0x22/0x30
> [   51.398942]  ? zone_device_page_init+0x5d/0x240
> [   51.399188]  ? zone_device_page_init+0x49/0x240
> [   51.399433]  drm_gpusvm_migrate_to_devmem+0x379/0x9e0 [drm_gpusvm]
> [   51.399768]  xe_svm_handle_pagefault+0x62c/0xa60 [xe]
> [   51.400110]  ? xe_vm_find_overlapping_vma+0xa4/0x1d0 [xe]
> [   51.400475]  pf_queue_work_func+0x1ba/0x450 [xe]
> [   51.400777]  process_one_work+0x1fe/0x580
> [   51.400996]  worker_thread+0x1d1/0x3b0
> [   51.401201]  ? __pfx_worker_thread+0x10/0x10
> [   51.401433]  kthread+0xeb/0x120
> [   51.401609]  ? __pfx_kthread+0x10/0x10
> [   51.401813]  ret_from_fork+0x2d/0x50
> [   51.402008]  ? __pfx_kthread+0x10/0x10
> [   51.402211]  ret_from_fork_asm+0x1a/0x30
> [   51.402427]  </TASK>
> [   51.402551] Modules linked in: xe drm_ttm_helper gpu_sched 
> drm_suballoc_helper drm_gpuvm drm_exec drm_gpusvm i2c_algo_bit drm_buddy 
> video wmi ttm drm_display_helper drm_kms_helper crct10dif_pclmul 
> crc32_pclmul e1000 ghash_clmulni_intel i2c_piix4 i2c_smbus fuse
> [   51.403779] ---[ end trace 0000000000000000 ]---
> [   51.404106] RIP: 0010:zone_device_page_init+0x5d/0x240
> [   51.404393] Code: 04 dd ff e8 d5 d2 a1 00 5a 85 c0 0f 85 ba 00 00 00 
> e8 d7 bb df ff 85 c0 0f 84 9d 01 00 00 48 8b 45 38 a8 03 0f 85 ec 00 00 
> 00 <65> 48 ff 00 e8 aa d2 a1 00 85 c0 0f 85 0d 01 00 00 48 c7 c7 20 cb
> [   51.405408] RSP: 0018:ffffc9000039fb48 EFLAGS: 00010246
> [   51.405725] RAX: 4000000000000000 RBX: ffffea000bedac00 RCX: 
> 0000000000000000
> [   51.406110] RDX: 0000000000000046 RSI: ffffffff824c67b4 RDI: 
> ffffffff824e58f5
> [   51.406518] RBP: ffffea000bedac08 R08: 0000000000000015 R09: 
> 0000000000000004
> [   51.406905] R10: 0000000000000001 R11: 0000000000000004 R12: 
> 0000000000000001
> [   51.407312] R13: ffff888170fd8d40 R14: ffff88817f922640 R15: 
> ffffea000bedac00
> [   51.407691] FS:  0000000000000000(0000) GS:ffff88842fc80000(0000) 
> knlGS:0000000000000000
> [   51.408135] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   51.408484] CR2: 0000563d1f7ecbe4 CR3: 000000017c212000 CR4: 
> 0000000000750ef0
> [   51.408877] PKRU: 55555554
> [   51.409047] BUG: sleeping function called from invalid context at ./ 
> include/linux/percpu-rwsem.h:49
> [   51.409528] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 
> 76, name: kworker/u17:0
> [   51.409976] preempt_count: 0, expected: 0
> [   51.410212] RCU nest depth: 1, expected: 0
> [   51.410435] INFO: lockdep is turned off.
> [   51.410648] CPU: 1 UID: 0 PID: 76 Comm: kworker/u17:0 Tainted: G 
> D            6.13.0-rc4-drm-tip-test+ #48
> [   51.411180] Tainted: [D]=DIE
> [   51.411338] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
> BIOS 1.15.0-1 04/01/2014
> [   51.411859] Workqueue: xe_gt_page_fault_work_queue pf_queue_work_func 
> [xe]
> [   51.412269] Call Trace:
> [   51.412404]  <TASK>
> [   51.412525]  dump_stack_lvl+0x69/0xa0
> [   51.412724]  __might_resched.cold+0xe5/0x120
> [   51.412956]  exit_signals+0x1a/0x360
> [   51.413150]  do_exit+0x122/0xbd0
> [   51.413328]  ? __pfx_worker_thread+0x10/0x10
> [   51.413562]  make_task_dead+0x88/0x90
> [   51.413783]  rewind_stack_and_make_dead+0x16/0x20
> [   51.414045] RIP: 0000:0x0
> [   51.414191] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> [   51.414595] RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX: 
> 0000000000000000
> [   51.414993] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
> 0000000000000000
> [   51.415369] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
> 0000000000000000
> [   51.415746] RBP: 0000000000000000 R08: 0000000000000000 R09: 
> 0000000000000000
> [   51.416123] R10: 0000000000000000 R11: 0000000000000000 R12: 
> 0000000000000000
> [   51.416501] R13: 0000000000000000 R14: 0000000000000000 R15: 
> 0000000000000000
> [   51.416899]  </TASK>
> 
> 
> On 12/18/24 1:33 AM, Matthew Brost wrote:
>> Version 3 of GPU SVM has been promoted to the proper series from an RFC.
>> Thanks to everyone (especially Sima and Thomas) for their numerous
>> reviews on revision 1, 2 and for helping to address many design issues.
>>
>> This version has been tested with IGT [1] on PVC, BMG, and LNL. Also
>> tested with level0 (UMD) PR [2].
>>
>> Major changes in v2:
>> - Dropped mmap write abuse
>> - core MM locking and retry loops instead of driver locking to avoid 
>> races
>> - Removed physical to virtual references
>> - Embedded structure/ops for drm_gpusvm_devmem
>> - Fixed mremap and fork issues
>> - Added DRM pagemap
>> - Included RFC documentation in the kernel doc
>>
>> Major changes in v3:
>> - Move GPU SVM and DRM pagemap to DRM level
>> - Mostly addresses Thomas's feedback, lots of small changes documented
>>    in each individual patch change log
>>
>> Known issues in v3:
>> - Check pages still exists, changed to threshold in this version which
>>    is better but still need to root cause cross process page finding on
>>    small user allocations.
>> - Dropped documentation patch, fairly large rewrite and will send out
>>    independently once finished.
>>
>> Matt
>>
>> [1] https://patchwork.freedesktop.org/series/137545/#rev3
>> [2] https://github.com/intel/compute-runtime/pull/782
>>
>> Matthew Brost (27):
>>    drm/xe: Retry BO allocation
>>    mm/migrate: Add migrate_device_pfns
>>    mm/migrate: Trylock device page in do_swap_page
>>    drm/gpusvm: Add support for GPU Shared Virtual Memory
>>    drm/xe: Select DRM_GPUSVM Kconfig
>>    drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag
>>    drm/xe: Add SVM init / close / fini to faulting VMs
>>    drm/xe: Nuke VM's mapping upon close
>>    drm/xe: Add SVM range invalidation and page fault handler
>>    drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
>>    drm/xe: Add (re)bind to SVM page fault handler
>>    drm/xe: Add SVM garbage collector
>>    drm/xe: Add unbind to SVM garbage collector
>>    drm/xe: Do not allow CPU address mirror VMA unbind if the GPU has
>>      bindings
>>    drm/xe: Enable CPU address mirror uAPI
>>    drm/xe: Add migrate layer functions for SVM support
>>    drm/xe: Add SVM device memory mirroring
>>    drm/xe: Add drm_gpusvm_devmem to xe_bo
>>    drm/xe: Add GPUSVM device memory copy vfunc functions
>>    drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
>>    drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
>>    drm/xe: Add BO flags required for SVM
>>    drm/xe: Add SVM VRAM migration
>>    drm/xe: Basic SVM BO eviction
>>    drm/xe: Add SVM debug
>>    drm/xe: Add modparam for SVM notifier size
>>    drm/xe: Add always_migrate_to_vram modparam
>>
>> Thomas Hellström (3):
>>    drm/pagemap: Add DRM pagemap
>>    drm/xe: Add dma_addr res cursor
>>    drm/xe: Add drm_pagemap ops to SVM
>>
>>   drivers/gpu/drm/Kconfig                     |    8 +
>>   drivers/gpu/drm/Makefile                    |    1 +
>>   drivers/gpu/drm/drm_gpusvm.c                | 2220 +++++++++++++++++++
>>   drivers/gpu/drm/xe/Kconfig                  |   10 +
>>   drivers/gpu/drm/xe/Makefile                 |    1 +
>>   drivers/gpu/drm/xe/xe_bo.c                  |   20 +-
>>   drivers/gpu/drm/xe/xe_bo.h                  |    1 +
>>   drivers/gpu/drm/xe/xe_bo_types.h            |    4 +
>>   drivers/gpu/drm/xe/xe_device_types.h        |   15 +
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c        |   17 +-
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   24 +
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |    2 +
>>   drivers/gpu/drm/xe/xe_migrate.c             |  175 ++
>>   drivers/gpu/drm/xe/xe_migrate.h             |   10 +
>>   drivers/gpu/drm/xe/xe_module.c              |    7 +
>>   drivers/gpu/drm/xe/xe_module.h              |    2 +
>>   drivers/gpu/drm/xe/xe_pt.c                  |  393 +++-
>>   drivers/gpu/drm/xe/xe_pt.h                  |    5 +
>>   drivers/gpu/drm/xe/xe_pt_types.h            |    2 +
>>   drivers/gpu/drm/xe/xe_res_cursor.h          |  116 +-
>>   drivers/gpu/drm/xe/xe_svm.c                 |  948 ++++++++
>>   drivers/gpu/drm/xe/xe_svm.h                 |   83 +
>>   drivers/gpu/drm/xe/xe_tile.c                |    5 +
>>   drivers/gpu/drm/xe/xe_vm.c                  |  375 +++-
>>   drivers/gpu/drm/xe/xe_vm.h                  |   15 +-
>>   drivers/gpu/drm/xe/xe_vm_types.h            |   57 +
>>   include/drm/drm_gpusvm.h                    |  445 ++++
>>   include/drm/drm_gpuvm.h                     |    5 +
>>   include/drm/drm_pagemap.h                   |  103 +
>>   include/linux/migrate.h                     |    1 +
>>   include/uapi/drm/xe_drm.h                   |   19 +-
>>   mm/memory.c                                 |   13 +-
>>   mm/migrate_device.c                         |  116 +-
>>   33 files changed, 5061 insertions(+), 157 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_gpusvm.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_svm.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_svm.h
>>   create mode 100644 include/drm/drm_gpusvm.h
>>   create mode 100644 include/drm/drm_pagemap.h
>>
> 

