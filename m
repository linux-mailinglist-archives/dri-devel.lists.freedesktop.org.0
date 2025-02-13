Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB10DA33E1C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 12:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E66610EA65;
	Thu, 13 Feb 2025 11:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYNpnKfu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD4910EA65;
 Thu, 13 Feb 2025 11:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739446256; x=1770982256;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WN7UzDuIU0Nu1l8vFQcqffHypnSpH/2Vkocj5zZeLjk=;
 b=CYNpnKfurXOn4o1IyUZzaKgykFbDx1v/XaS5CeeU3UvFdd7ywuS/5WV/
 YW7ZEr0H0qbHMsNmzYV7jX6bSA2GmIqLJPfjddrnkKr+7BmK+5giAq2V9
 x84OFJPaybOG7IxtPUVSVN6zSoNk3hLABde2+aUEwXIaAgBOGyejY9cjR
 RFwCqlzaENAZq81pfHHkKrQbujOtKbPpd2JRQ8D/hAWVIcaEVmhrOI3kt
 8EAu3o6GlBjp3Li5y483pGw6Oa7oj0JMan1HA/IQgqal7wao9Um3ROwmQ
 sRlqJWLWhVJ+1KOUrHUMhUwYcrXNO4k+mTy9FdqilEr1y3uLzR+bFZ4Rc g==;
X-CSE-ConnectionGUID: Hs0isz/QS22DMEAh109DeQ==
X-CSE-MsgGUID: FCkHpepMQCCcMcX8z2/psA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40294269"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40294269"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:30:55 -0800
X-CSE-ConnectionGUID: WzMwQGVDTBCf89jcJvE7CQ==
X-CSE-MsgGUID: M4bQ9BRnSC+XXkLIH91dXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117230616"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:30:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 13 Feb 2025 03:30:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 03:30:54 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 03:30:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pq8DLFcmRuHrSBiIcLh/BHMTIrr7joRDDCRJPpPxWYp+Ei4+YUOq8Hl9+xTNjw6W4qaD0FQEgimp755bl2rvzS7AP1s/ceWVQF/XqqAsm9W6/9JsiXV2J0nSnROUn9poU6RrzOeJyoJPL1DSbM96mjzxedMhEoSJABnGy/4nUffQAIM8Pv4cng2p3TTRidFdi+1JdUfVcK62fVKr1f6ZHAysUvZspH01CpTWKHfZy5a2uB1kw/1tLkQk4XDocVtOs4dgCaJlq3joKg+7y7iDD5Fhc3XKJ4A5dHGgOqitHKVWg9NFa+56QpxpFuAKWITHoWPdls6rIJ8H0x+c6gUr3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICsoSXi50eWQemzlav+IIxJUgEdx+ULtUmOnjsATApg=;
 b=IK4PhADrn+FWesamx5WbwrZbktT7zn0CXN+Mwz3dt1IsOoWbnzY9RxAbWsMlXZrwYUo1n2/ujeEEWmoIZJnmPYuy0CVGXMQSf6JY5PtiyHiCu9si1ooREXRBPBexc/w2BrUA6F/1gX5kaZV5knfQ1tBEjhgX3/dJrSqPPrZShQpqQg1/uDqMEPBr6Mo3e6qmrRn0bjrZVXTN3f+WhFYb/rDejWqP+A69OEwHj/A44nrrtvUMAwW89S0b/Vdp0HE7DGkhTi9VOCR5Qavm6TW976Mfs8XVhXNmnqnPeuyXSgNxVh4Lppy9mMat+i4fiRL8N3Kez14RoFC9Hy1ujkErWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.23; Thu, 13 Feb
 2025 11:30:51 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 11:30:51 +0000
Message-ID: <33cb3eb0-9dd6-4723-afcd-18d76f3e3eff@intel.com>
Date: Thu, 13 Feb 2025 17:00:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 29/32] drm/xe: Add SVM debug
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-30-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213021112.1228481-30-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: c4bf44ec-d8d8-495d-206d-08dd4c21deb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGNhQjBmS3c0UDFwQy9rVHFwbnhKNjFFOHRWKzFvbWNTVkoyTCtjdC9OQ010?=
 =?utf-8?B?VTRuYkVzVTJFUnBPZlBwZlRhVXNkemFpa25tQVFTTzJsK2FSZGgvb1FlQk5V?=
 =?utf-8?B?aVg4OG1IS21mY2hudEdQcERrRXMwZnoyRHVTYUhLODYvb0s3N2wxRVlmN1ZF?=
 =?utf-8?B?Znl0RktvM2JxMExGb3YyVitkTDlvamJkOElBNDNST3d6WldYNk8xVUllVmxl?=
 =?utf-8?B?bmRhNjJnNWk1bldhZ0lLd05YeUhsUTFMUmRpOHY2T0ZobWZzdkZ4bVJTUG5h?=
 =?utf-8?B?REdCY0JlVWlIMTgzZStNMUhSUFBKZ3FIVzRURnc0TWRBRWI2YnBzeFk5YklK?=
 =?utf-8?B?Q3hQRW9TUnBjNCtaNjBseC95Z1Y5ZjAzSGh2MU9MZWlxRXoxWXRkVUFmRnNH?=
 =?utf-8?B?M3VQQm9wOG1uanlEVWFGcEI5NGh3VVRpNWRqby9mQzNtYjhoTllLKzZRRkd0?=
 =?utf-8?B?azlKTm0zaUpTN3kwZkNXN0luZ1B0WEZzNFFUUWpIVGRXSWcyZ2MwZHRzN1V6?=
 =?utf-8?B?Y1JRWjdsQnMzNXJ0M1VPSnFIRUhlbXNRYmtBYmpnWXQxdFBMMFhCRG9hK0xB?=
 =?utf-8?B?VFkvd1c5SDJOYytraDNVbmpHZUhoTEttN0VtUDJOSGFEQ2laM2RLaFRwWENV?=
 =?utf-8?B?Sm41aUNBU3c0QndWSkJIQ0xKZWlyQlNxU2NmSE9KU1NRczdYYmdjczk1aVpQ?=
 =?utf-8?B?dWhpTzg2QSs5SVlteWNWczR2TGJGNEIyNUZOSHFlTWRsL20yWWtERU1aVnpC?=
 =?utf-8?B?TVF3Q09DV0dWUjEyZzdmVGFFbEFMNThia0wzREJYbXgvYkZWSGliUHpjVVFP?=
 =?utf-8?B?eENqbFVSbXNIQmJPRFF2SUJtOHFlRzk5bjRUZmdRRlUwQXh2bXZyK2pQYzNa?=
 =?utf-8?B?QkVNUWpmdy82YnBMQmNtdWdYWmtlWGROUmhXQ2svSGNRQSs1SHJKcGRUd2FR?=
 =?utf-8?B?aEFEVEtSY2Z6eExld2xLR0Q1ZXFoMkdtQXlLc0x2elJDZFJTV25lbXl5eHl5?=
 =?utf-8?B?SHIxVVRJeEVxcmpWOExyM3hTUFRBUHB0eUdrTGZCQThpSER3OGFDT3lNNHJI?=
 =?utf-8?B?TVNGTW1hN3hleXNmRWwxNVl6cVFYZnRZSy8zT1IzOWVsSDJmQUxESEkrR3pj?=
 =?utf-8?B?eGNLQTRIZnhYaXc3M2U1ZTBmSlM0MUN6dUlkOTkybGZBWnFDMmtrQVNqVHRq?=
 =?utf-8?B?Ums0RlZrYXVIZlQvWVBIVGF2UlZNUkhmQ0NUWnkxekljRWtoY0RmdFFvTW90?=
 =?utf-8?B?aUhCeitNcUY5RklMQ29RNWVBSTUyc1dLanRWL2lQZkp5VGQxME9IZ0RRcVJ6?=
 =?utf-8?B?cEJ5ODQwbGNUem0wbHdjRFdhemFnTS9IYlVCcFk2QmRKS2NzVnJDdWN0Vjdz?=
 =?utf-8?B?ZklHMkRCOTRISGxyTUdXWHZjUHNFbVVDaU45ZUlRbExWdUxvTWg1RW9MR3BG?=
 =?utf-8?B?ZG4zaXJNNU9oZUp4Q0UyWjU0TlZMd3ZtcldWZENNSU5GME01QXhiM0JkbWt3?=
 =?utf-8?B?elIrSUdxN20rUEdCR3pLZW83UWNOdUxnM2x3dTZBNFNTb2l1b0RZUEk5cW8r?=
 =?utf-8?B?RFpGcFp2ZEZBYU85L09GL0VBKytWcWZiVkU1K2hyTkUwRDA5Z0NSRm1tbTF0?=
 =?utf-8?B?L1I4VUFTVCtjK2dva01RaG5ONjBsQ3QrUHlYY2ZJOUNnZlhmMzJydFZnMGhK?=
 =?utf-8?B?UWRxcVZ6YjNtY2FWeUhYYm4wOHZDODV2SkZDeFdLcFVSSFM0RUdDWndITmlw?=
 =?utf-8?B?ekZPT1FUSDU1TWJRRmlBRUtsTm9DR0EyWmFmUk5Kc1NrUlVtM20rZzVsTFov?=
 =?utf-8?B?V0VZcDRxYnJta21xbVNOSDJVSkVBMDBPMkJsMFU3L1RmdXoxelFQZHJ0Rnhl?=
 =?utf-8?Q?jLYJ72fVZ8yG8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGEzekZobER5Z3ZTUElqWFFEYWlNK1B1YzZVZ0RzYWdSVk9PRGtKZlZEemlU?=
 =?utf-8?B?Q2wrVzAvcXVhenk5RUxZb3Y0Rk1pMm9jdmM0a0dVdjB1RnNqUDcwY2dhRmZH?=
 =?utf-8?B?bTZ1MlhFVFA0Y0FqTUtwZHRwWUs3dFNnb3o2eDhaN2NTaWpUWllVQWZXazBE?=
 =?utf-8?B?YXpid1VCMXNIbkVvT0ZOSHFnejNmMXc0WGNqWmN4Q0xyMmptVWNmMVdsM0w4?=
 =?utf-8?B?M0tvSEVJaUxWL0VQZDZFY1p1d3VudXFpc09tTDZoYk9ZcEZvM0xNeXk0eFZ5?=
 =?utf-8?B?c3FhWE9IVk42a1ZyWEY2WTBUT1dlNUh0MWU3ZXZHTnZuNTFYUkhibDd2REFk?=
 =?utf-8?B?RkNYaUp3SStFbVRDeFlmY2VXTGdEcVFJemNhMnkxSjNuT0d3Y09jV3lHNTNQ?=
 =?utf-8?B?Qldva1ZBTU92QlRaTTFXTkQxNlE5Q3h0MHZRQ1ZLdUFPS01Sa0NLNEtadTVs?=
 =?utf-8?B?eU5YOXdoSCsxRkMvbjUxWXdEU0x0blFtMXY3S01XYUlWOCtia1JsWjJ0ZGtr?=
 =?utf-8?B?L0sxdVBsV05YZzNYOEFwOEE1dFZwL2tDYml0Y1JDTlgwY2ZySEdsaVNycklY?=
 =?utf-8?B?ZDl4MWkwU1p6VklSdCt2U2dHR1g1c096TTJhRG1RYlhXazdkbU5ZbXpDK0Qw?=
 =?utf-8?B?bkQ1d0FMcjg1RGNPUWZueStibmEyODJWL1YyUFh1cjZpZU1uNjgvWmIxakUy?=
 =?utf-8?B?aDFEM2p3c0NZbG16alY0UDMwOGF0MjFpZERVTlI5cUdlRWU3ZnhpR1k1aVpm?=
 =?utf-8?B?djAvNWl6dGNvajhKL0pKQ3d4em9xT1hCVW50SHZwS3N0WEIzSVM3QlMvcERk?=
 =?utf-8?B?ZlJHU3l4Y3RRbk4ramlaK2p2NW1nenBVM0dqNDRyWFVZS0Ztd2Z4RXhqVmFM?=
 =?utf-8?B?TldrcTBubC8wNE9PeWJNWVEvclVJMlZPL0RaR0RxMzU1T3hEL0Q3Nk5PL1Va?=
 =?utf-8?B?aTFlTlBHTURFci9WUkdNcnU5c0hHY1UrNTNDSmJDVWUyTURHVTlydzhMdGRt?=
 =?utf-8?B?b1BiWHJ3RS96MGFKWXdFanVtTXc5L0w4enlkanY5U25IbTRzd2dZRFRSckkw?=
 =?utf-8?B?bVBhQ0NHS09mQnNyeUMwMnBtT3NzNW1yT2ZqdW9HbGlYV0ZkRHd6UHEvSjFM?=
 =?utf-8?B?S2hrUUdaTWt4dEt4cWNsMm92ZnNFdlhUbllJK2xWaytRbEpQbDlYNVNEQ0VE?=
 =?utf-8?B?UmhKdWFTVXV1cmg3VGN6NDVBeVBwenEwUnNJbW45QVlSREVGNktSU2huNnZB?=
 =?utf-8?B?OElrc2lSVHcvZDM3Z2ZkUmxBMFlZN3lCMXBWYTVFalJOTDloZ1oySzdudit5?=
 =?utf-8?B?ZVJEdTducW1NRzgyZU5mT3RXUVVMcmNqOGNmUlk2S3hvd1pTTWgxNmIwR04y?=
 =?utf-8?B?ZlpiT3BBRkkvUGdXQWM5N212Rmk4alF1L095aFhPeWYrSnM1MnJCUGxWV3ll?=
 =?utf-8?B?dXV0Um9vMXVtUENYUnErSFBWUFFlS0d0b3Nod0lvVlgwc0pXdS9wRkVmM050?=
 =?utf-8?B?Vzc3Sy93YmIvN1VTS21LTVpWODQxMlBhd0xVMUMwdERBbG9XcXZzWEcvdm9I?=
 =?utf-8?B?R3d4OFZGKzVxR0NSSUY2R25OLzg5eGZaZW5aNU1kL2hFQ0F3cWhObW12ZlZH?=
 =?utf-8?B?Q01ra3BoWXdycGNnNlNUMjFHMFJIUkdwRXFiNFZHRlJIb0hPNlczM1BFZVZW?=
 =?utf-8?B?NWRTWlJyNWhPcGFPQTIvL0xLRnBKek4zN0tVejZKS0tHUEVaNDVPWnk3MGNS?=
 =?utf-8?B?L0dTR003UWlwYkZHUEx1UWlVQ0paUDF4WTdQSlZvSzUyZEY1eXdyZWhSbkY4?=
 =?utf-8?B?bTEyUm5xVERDU2tWaEc2WXpscTV5S09GTmZHVURKS3k4TGc1Q2pPei9XM1VT?=
 =?utf-8?B?eDNqMUc5RVg1Tkl4cmhtaWh0ZDYwTlljcHEzUXpuMitXM1d6akc5Q3RWazZL?=
 =?utf-8?B?Zm5TNU8wWUVSUWNpMTlpeDFtdlByckptZzZiMHp0V3JQRUMrd1hnWnZzK254?=
 =?utf-8?B?NGhxTXQzeEdPRFo1aVVEZzg3RmpRWWJjTUFHZXZqaFJReEQ5MFA1dUVlK2FC?=
 =?utf-8?B?NndKU2QrQ1BLWXUzZ3h5aWpjSUF5ZHNtQXRNMlVZN09IbXhVMTA1bXFUdjdl?=
 =?utf-8?B?RXdBU1NKdUhoYjlFUU4xV0pRR3lYY1JIUkdsWlJ0YWs0N2lFVXQ0T1hKMGFP?=
 =?utf-8?Q?jEPtsF0m8UqrsxLSnCi2mIE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bf44ec-d8d8-495d-206d-08dd4c21deb6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:30:51.3384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZrsPB9q6nNJz+PVxrEdQmoD0w8dC98SF/MSaYZZAbnbJN/4wdO3lWNUT/ByBDYceFjadWxhdNj8uaDbVtRzrXNlrRWcULF1N+b9iiMlP4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
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



On 13-02-2025 07:41, Matthew Brost wrote:
> Add some useful SVM debug logging fro SVM range which prints the range's
> state.
> 
> v2:
>   - Update logging with latest structure layout
> v3:
>   - Better commit message (Thomas)
>   - New range structure (Thomas)
>   - s/COLLECTOT/s/COLLECTOR (Thomas)
> v4:
>   - Drop partial evict message (Thomas)
>   - Use %p for pointers print (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c  |  8 ++++
>   drivers/gpu/drm/xe/xe_svm.c | 84 +++++++++++++++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_svm.h |  2 +
>   3 files changed, 87 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f8d06c70f77d..29ade504e1c1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -647,6 +647,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   		/* Move this entire thing to xe_svm.c? */
>   		xe_svm_notifier_lock(xe_vma_vm(vma));
>   		if (!xe_svm_range_pages_valid(range)) {
> +			xe_svm_range_debug(range, "BIND PREPARE - RETRY");
>   			xe_svm_notifier_unlock(xe_vma_vm(vma));
>   			return -EAGAIN;
>   		}
> @@ -655,6 +656,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   					 range->base.itree.last + 1 - range->base.itree.start,
>   					 &curs);
>   			is_devmem = xe_res_is_vram(&curs);
> +			if (is_devmem)
> +				xe_svm_range_debug(range, "BIND PREPARE - DMA VRAM");
> +			else
> +				xe_svm_range_debug(range, "BIND PREPARE - DMA");
>   		} else {
>   			xe_assert(xe, false);
>   		}
> @@ -1429,10 +1434,13 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>   		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>   			continue;
>   
> +		xe_svm_range_debug(range, "PRE-COMMIT");
> +
>   		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>   		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>   
>   		if (!xe_svm_range_pages_valid(range)) {
> +			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>   			xe_svm_notifier_unlock(vm);
>   			return -EAGAIN;
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index ea43dd00d226..8fd1750b5b04 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -12,6 +12,18 @@
>   #include "xe_vm.h"
>   #include "xe_vm_types.h"
>   
> +static bool xe_svm_range_in_vram(struct xe_svm_range *range)
> +{
> +	/* Not reliable without notifier lock */
> +	return range->base.flags.has_devmem_pages;
> +}
> +
> +static bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
> +{
> +	/* Not reliable without notifier lock */
> +	return xe_svm_range_in_vram(range) && range->tile_present;
> +}
> +
>   static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
>   {
>   	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
> @@ -37,6 +49,23 @@ static unsigned long xe_svm_range_size(struct xe_svm_range *range)
>   	return drm_gpusvm_range_size(&range->base);
>   }
>   
> +#define range_debug(r__, operaton__)					\
> +	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
> +	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
> +	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
> +	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
> +	       (r__)->base.gpusvm,					\
> +	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
> +	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
> +	       (r__)->base.notifier_seq,				\
> +	       xe_svm_range_start((r__)), xe_svm_range_end((r__)),	\
> +	       xe_svm_range_size((r__)))
> +
> +void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
> +{
> +	range_debug(range, operation);
> +}
> +
>   static void *xe_svm_devm_owner(struct xe_device *xe)
>   {
>   	return xe;
> @@ -74,6 +103,8 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
>   {
>   	struct xe_device *xe = vm->xe;
>   
> +	range_debug(range, "GARBAGE COLLECTOR ADD");
> +
>   	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
>   
>   	spin_lock(&vm->svm.garbage_collector.lock);
> @@ -99,10 +130,14 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>   
>   	xe_svm_assert_in_notifier(vm);
>   
> +	range_debug(range, "NOTIFIER");
> +
>   	/* Skip if already unmapped or if no binding exist */
>   	if (range->base.flags.unmapped || !range->tile_present)
>   		return 0;
>   
> +	range_debug(range, "NOTIFIER - EXECUTE");
> +
>   	/* Adjust invalidation to range boundaries */
>   	if (xe_svm_range_start(range) < mmu_range->start)
>   		*adj_start = xe_svm_range_start(range);
> @@ -155,6 +190,11 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>   
>   	xe_svm_assert_in_notifier(vm);
>   
> +	vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
> +	       "INVALIDATE: asid=%u, gpusvm=%p, seqno=%lu, start=0x%016lx, end=0x%016lx, event=%d",
> +	       vm->usm.asid, gpusvm, notifier->notifier.invalidate_seq,
> +	       mmu_range->start, mmu_range->end, mmu_range->event);
> +
>   	/* Adjust invalidation to notifier boundaries */
>   	if (adj_start < drm_gpusvm_notifier_start(notifier))
>   		adj_start = drm_gpusvm_notifier_start(notifier);
> @@ -241,6 +281,8 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
>   {
>   	struct dma_fence *fence;
>   
> +	range_debug(range, "GARBAGE COLLECTOR");
> +
>   	xe_vm_lock(vm, false);
>   	fence = xe_vm_range_unbind(vm, range);
>   	xe_vm_unlock(vm);
> @@ -400,16 +442,23 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>   			int incr = (match && last) ? 1 : 0;
>   
>   			if (vram_addr != XE_VRAM_ADDR_INVALID) {
> -				if (sram)
> +				if (sram) {
> +					vm_dbg(&tile->xe->drm,
> +					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> +					       vram_addr, dma_addr[pos], i - pos + incr);
>   					__fence = xe_migrate_from_vram(tile->migrate,
>   								       i - pos + incr,
>   								       vram_addr,
>   								       dma_addr + pos);
> -				else
> +				} else {
> +					vm_dbg(&tile->xe->drm,
> +					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> +					       dma_addr[pos], vram_addr, i - pos + incr);
>   					__fence = xe_migrate_to_vram(tile->migrate,
>   								     i - pos + incr,
>   								     dma_addr + pos,
>   								     vram_addr);
> +				}
>   				if (IS_ERR(__fence)) {
>   					err = PTR_ERR(__fence);
>   					goto err_out;
> @@ -429,14 +478,21 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>   
>   			/* Extra mismatched device page, copy it */
>   			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
> -				if (sram)
> +				if (sram) {
> +					vm_dbg(&tile->xe->drm,
> +					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
> +					       vram_addr, dma_addr[pos], 1);
>   					__fence = xe_migrate_from_vram(tile->migrate, 1,
>   								       vram_addr,
>   								       dma_addr + pos);
> -				else
> +				} else {
> +					vm_dbg(&tile->xe->drm,
> +					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
> +					       dma_addr[pos], vram_addr, 1);
>   					__fence = xe_migrate_to_vram(tile->migrate, 1,
>   								     dma_addr + pos,
>   								     vram_addr);
> +				}
>   				if (IS_ERR(__fence)) {
>   					err = PTR_ERR(__fence);
>   					goto err_out;
> @@ -613,6 +669,8 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>   	ktime_t end = 0;
>   	int err;
>   
> +	range_debug(range, "ALLOCATE VRAM");
> +
>   	if (!mmget_not_zero(mm))
>   		return ERR_PTR(-EFAULT);
>   	mmap_read_lock(mm);
> @@ -716,6 +774,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	if (xe_svm_range_is_valid(range, tile))
>   		return 0;
>   
> +	range_debug(range, "PAGE FAULT");
> +
>   	/* XXX: Add migration policy, for now migrate range once */
>   	if (!range->migrated && range->base.flags.migrate_devmem &&
>   	    xe_svm_range_size(range) >= SZ_64K) {
> @@ -731,18 +791,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   		}
>   	}
>   
> +	range_debug(range, "GET PAGES");
>   	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
>   	/* Corner where CPU mappings have changed */
>   	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> -		if (err == -EOPNOTSUPP)
> +		if (err == -EOPNOTSUPP) {
> +			range_debug(range, "PAGE FAULT - EVICT PAGES");
>   			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> +		}
>   		drm_info(&vm->xe->drm,
>   			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
>   			 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +		range_debug(range, "PAGE FAULT - RETRY PAGES");
>   		goto retry;
>   	}
> -	if (err)
> +	if (err) {
> +		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
>   		goto err_out;
> +	}
> +
> +	range_debug(range, "PAGE FAULT - BIND");
>   
>   retry_bind:
>   	drm_exec_init(&exec, 0, 0);
> @@ -758,8 +826,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   		if (IS_ERR(fence)) {
>   			drm_exec_fini(&exec);
>   			err = PTR_ERR(fence);
> -			if (err == -EAGAIN)
> +			if (err == -EAGAIN) {
> +				range_debug(range, "PAGE FAULT - RETRY BIND");
>   				goto retry;
> +			}
>   			if (xe_vm_validate_should_retry(&exec, err, &end))
>   				goto retry_bind;
>   			goto err_out;
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index ff43a6193536..1de3ade10fbf 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -57,6 +57,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   
>   bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
>   
> +void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
> +

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   int xe_svm_bo_evict(struct xe_bo *bo);
>   
>   /**

