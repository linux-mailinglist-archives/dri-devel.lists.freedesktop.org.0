Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C20A2B9BE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 04:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD7B10E1BE;
	Fri,  7 Feb 2025 03:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8Qn7Cdo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5F410EA10;
 Fri,  7 Feb 2025 03:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738898911; x=1770434911;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oFt3aUm9P7Lh1uDcz6BMf+GB2lzsBM2qnloBOzHcr6E=;
 b=C8Qn7Cdo2iNQfhYOJZXu5XQk5t0hExhwW7H/jHct5kwSXt4Iyw2CUTpr
 lQpL8B8AIVsE9e3xCHWR2egey0wHZdchxsGEPITFxdTemmV19bqDX2+/w
 h75lT0Odd3ADlbVR6Mw4aR5cgAA9CYvLNycTjOcbbOFjswK5Ov/vM5AJ6
 R2cKsUlYohXnLpmTqrBtk3R34IZeuWcoTEUUQyo0L88A1sCMC55QxuYCh
 BOdryHySZNvIZOPnd3Nh8AWi1jfZDupln9K301kS5NibeEaS8PioXRZqd
 ga3U4yzhCt2zs/WPMw06SKes1zR8JxJ1JWkhRWUzQfPtMsvpeuCqj6T7/ Q==;
X-CSE-ConnectionGUID: ry3a/8yeTXKPiHpa92qcjw==
X-CSE-MsgGUID: xDn/wrriQ3SaRk54UtRm7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39646754"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39646754"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 19:28:30 -0800
X-CSE-ConnectionGUID: +U9alI2aTGSvAwG37Qc4fg==
X-CSE-MsgGUID: NDuD/24eTjq+lbNJqSYleg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134646154"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 19:24:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 19:24:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 19:24:25 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 19:24:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEXQAgfEudK9SgMYDFqwWiKw8g51Op7Yn2eAIxdD1+3n+o+I3FVEU3wYzV2PQ1lTJ6GYq+NKGE4SNS/A0JUjI4OP8YlH9cKQMU7uhPLfAKu7HlXcRoJT5k+3hQPPQS85cv7K+NTj9b09ZmqiGXxjlimXQnsiqdl9B1k2PWc+AYilzLuUndCC0qmTNt9zfFWC4VHIJoyPeQy+M28COigpNi1Dx08nSUsbj8yuLdP+3DWT3JZ1DEUqYOMBQK7ZdFmrY8xikJLyenqFHcUKv6p3Ddwtqj/msYSpVwQCBEyeUpZxG4JPk47qdjubR807GgIV9CFvMaLKIlGCrynpKbFEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gC9Nx5AraMIMiz0hOr7jo+A1ZdVwz6OSBn6FtfZ7uhI=;
 b=IlU/RPsbvvjrE6Ew7Tpu5iKV33E5j8aw3wwKQkJccnIeI4Dnu1BRo1Lp4R2F4vCWDqoR/4D6nGc9SuGHAl0Rln9qI6UdbxzUnvEyhWMZxS/yM3uXLFxq4kT+9AVLv44e+tnPm/Y+xZv+eL7ErpK3ih6sQx+xA4WxkUksgBRYJ23t+/uT6KYAXOwsOZGY5ttQbvnJMy3flmWnleF+8ppIUgAGfc+iMk+UdXQxO3v0t33Zcuqyr21WoHGD4TCFuubppXoFvQx7d9M/w82y7A+4kC9S5nY6QihfVBKNibExavwYpn0sOujDJmEfvQUChHBRVR29qyUP49hZg1lmXQ6pTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 7 Feb
 2025 03:24:14 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%5]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 03:24:14 +0000
Message-ID: <12b146c2-e652-4031-9438-99b00ae6f477@intel.com>
Date: Fri, 7 Feb 2025 08:54:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/33] drm/xe: Add SVM init / close / fini to faulting
 VMs
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-10-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250129195212.745731-10-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::13) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: b95bd9a2-e8b0-4b0f-1893-08dd4726e576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d29SYXZXeUlSa0I5WlZYSGtpZXIvL2xUQ0g2SG1ab2hpZGRvSjl0Ym9SYXVk?=
 =?utf-8?B?WWN4aTNzU1N0VHJKUjdySkNQUkRMVmZnR28wUS9WZElxUGkzRVJDZXhDdXBD?=
 =?utf-8?B?TmYxM0NVaUtIQXBORWVrdU5WekE0a0VYQVZ0aUtsUzZwU1M3dStEZVFjQVU1?=
 =?utf-8?B?SENjT2M3Skd0ZjVSQ3Z4Y0UySTQ4OWRKR1VwUWJGZlA5V1o2czZja1Z3bFpF?=
 =?utf-8?B?TEhCQnRONEppdXpUZG4zOVN3bTBIM24vQytiL1R3YlNuREFhaWJWMGVhQitP?=
 =?utf-8?B?SFA0MXJybjdTdkZQUmp6K0MwTnZCdmlnZUc2TldnRThYejAvWDZTdEVNRmVC?=
 =?utf-8?B?RzdHOGwzNXdSaGdUVmdJai83UnBTM1hIajdGUHZYOVhvMzhRN1l4eGd1emRs?=
 =?utf-8?B?NWVENlRkZ3lncm9XM2FOdDZZeTR4dDdmU2poSGpaUDM4a0hnQld0VWF1S1JK?=
 =?utf-8?B?NXd5RFg0bUVPOVFEbk5HQkdaMm1Nc1R3dXQ1VGczc1pLL0c1UjdmTXRsRmpn?=
 =?utf-8?B?NTJUcFZrd3RIN21pK1JveDdkeGI1a010QjhydTRsRUdkdWhyUlFxVVNxTzd2?=
 =?utf-8?B?TEEwdzM5OVlsWWR3Y0ExQTVmSmYrWXF4TWpMSWcyMHY0cG54RVZ2N29QWEJP?=
 =?utf-8?B?bkRNUTU1V3drVjB2VHNXVDY5aHh5Z2oxVHExdTB0VytkNWUzSVhUVVltcGhy?=
 =?utf-8?B?cm9IN01EM2p5UmRKUi9pYUgxOTkrNUtqRjB1clNwbGs3eXVlU203djlVMmE2?=
 =?utf-8?B?Ykp0dFRoTndKWkFGTklFTjZmWW5DUEtmRmIwUW4vSFlKQnhQeStCa1VCaCtW?=
 =?utf-8?B?YmlTWnJYUmR5ZHloeTRUS0JBS2xHVUhGYklxU2VMSVhiRmdCUGVCNGdxUUVu?=
 =?utf-8?B?WW0ya1hsdnJWVVVDaG45bjlKWmx2VGk2VmpZTjJ6VjVreitpSjNKMG5VNlVl?=
 =?utf-8?B?Z0h0blA0RFYveVpXbVQ2SGNZNzVPMUdEVEwxVlRLSWtLT3hHMWJCRU1oTUUx?=
 =?utf-8?B?TWRmY0hzQVJCbnFTSlR0U0pEdlNwUjVuSVBKQnpPcXRienRXNE9XSkRmaWFS?=
 =?utf-8?B?TmRPS1N5eUFwOVFHUUFNa093S2hOWUFMUCtNbCtTNnFJbTh4ZDFDdWwvQUQw?=
 =?utf-8?B?bDNmQmVoVmZJTzhjbU1GbVByZXE5MktKeEE5UXlmVGI4STVua3Y1a2g1N3F5?=
 =?utf-8?B?V0dpS04xb1AzUU83dUdaYUVYZC9QWVFzOVNyN1d0QlpNc3g3WE1QZUlVSTE0?=
 =?utf-8?B?Y2JxT2owcUpDV2JaU2hpZzBaZUV2YTRoUS83WUdiYTNMYzhvVEZNY3pHV0Zp?=
 =?utf-8?B?S1djVXphQVFrSVdZbTc3cGNKSktrMytPVjNGWnZZeVBScHpZNCtGSmt2Nml0?=
 =?utf-8?B?c2p2MHhRcjRaUU9kTVZoZmtlcWdON2laZlRSWEpzcHA5VTFtbHJiUDJSalRt?=
 =?utf-8?B?K2ZJR2twWWRjNHRJeHJKME44YWdPczd5d3BXQVB0aVRoeWxoelBCOG8zRGZG?=
 =?utf-8?B?bWdxZndPZXpHSE5sQTVZOEd3MmM1VTROMWx4eFJ6dGNDM25qRjJ4S2RseGZu?=
 =?utf-8?B?a1liZElqWHFFV0dPRXFtNGRKZG9RNFowY3hTRjlKRVp2RWFCQ1JXYWRINWVi?=
 =?utf-8?B?N0VQdFhoMTk0WWVDVHNtZ3VIcTF3RGhWb0hDSWpoMys2ZG1WdG0zTFBBOGlH?=
 =?utf-8?B?d25FWkp2MDhNZjlkQm55blUzdnNPZTdkNmpBOUxSaTVWa1pmaHo1dDlwRzJj?=
 =?utf-8?B?NWJSemlrOEliUmhhN2tSY25ObHArUVlibGJGVHZrOU5MTHlZeE9QNGp1dWl0?=
 =?utf-8?B?VEpjbFhDZWF4V1VFZzVkRW13RmpuTzR6dUxUM0s5eWhYektxSTl0eFZCYWRU?=
 =?utf-8?Q?nwQpXPizHxQD9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHVJWjJiaVp1dVlYYnpKcCs4S002N2VCZjdPMVRsTWJISHpFZUhxeEFtamZj?=
 =?utf-8?B?dHhIODJ0N042NjY4T1R4VTl5dnRXWVcwU24yMzhTeW16L0k0czhrVFhENVI2?=
 =?utf-8?B?eU9HMG5yQU1JTEhxckNERFRFby9DOHBlYkw2NHAzbHQ1NHdyVXVscEFBL05v?=
 =?utf-8?B?b0lvT0N5NlVhVGhtSmxMaTQ2aExKUzVFUWVWZTI1NjFNb2VWS1NtNmRkaGZW?=
 =?utf-8?B?cFIyZnBUR0hxQWdSNllKRHUvUjRjZndjcVV6Q2IwUE9DU1FmNjRXRnlnVlFa?=
 =?utf-8?B?SHNLVngzZnBiOFhieTBJdVUwOFhjTDJ2Y3Nlcm1hMC9XdVJvNlkvVFhwZXU2?=
 =?utf-8?B?RGdQNDRnVmhMV1FCZmtZemlWbnNDL2g2TDNpLzV4dXRCa2o1cjJPWmV3dkI5?=
 =?utf-8?B?QVNyajZxb0JoZ1VIT3ZMKzcxY052NVNnaHBIOWc2NG9NNjE3eVQyWVhHVzhS?=
 =?utf-8?B?WE4vYmZ3MGgwTFZmQTA3T3h1RDEzL3VIUlRpMys4c3VmUU1TdkZkd1JVUVM1?=
 =?utf-8?B?cUU4aU53Q0dOekQvUitqWnlSa2x4RnZKOGNSMnFWNmpvS3lpbGN1VkJDY3FR?=
 =?utf-8?B?QmlTbi8wMEc0UnVhZk1TOURDay9EYW9PcTdPMjJBd1hoQlhzU0VpVjdRaXJJ?=
 =?utf-8?B?MDhleDRnYUtaOXVnRTJaYW9wc2pKZUxpMHRsWEtFVXRkNWh3Z01Ha2plM2pv?=
 =?utf-8?B?N3ExdFNjOWR0dlREMGFiYi9lb0NYR0xnUTc0RWFPK0FvMGUwU0hNaUJKUXdV?=
 =?utf-8?B?WDBrUW9NbHlRaUhOVmdLT3JaM3lLT1NWMVduaU5UcmZZUmpxLzlhNlJ5b1Qv?=
 =?utf-8?B?NU0wREU0MWpsSHVDb3g0RjI5SURqMWR3a0x4aDRkeDY5ZWo1ZEdodFB0Tm1m?=
 =?utf-8?B?WW9jVWI1cCtqN252NHJCVmQvak5FTE1BcXUzMUhxb0NUbkRCYlhsazNvNmpI?=
 =?utf-8?B?OWlIK0pLZnFSbWlTbTZIbytMU1BBOE5NMGx3WjNZdWRhUzdzVTlPOFhvZjhG?=
 =?utf-8?B?Q3I0Nm1vZ1pHdERvYTVTMVJVaVI4dnppVVpUZitac1ZPbmpLZzJzWnNlWStp?=
 =?utf-8?B?OGtLRXRRRmhxOEFSYXZuWHMxOE9ZdkpxL0RGcGhtMFFsb204T0pHUUxoTWZJ?=
 =?utf-8?B?clNhY21KY0tLTC9jbDNuNkczczd4NkZ2MjFZeTBsOGdmZHk4Tk55bUxZY2kx?=
 =?utf-8?B?U3RxbkhlOCtndnV4RUdiYW03blU1Z2JYNFBtTFhPMWYxRUw4dFBqUFZScVp1?=
 =?utf-8?B?ZFZWWXgzWVdnTE9PLzh2VzFWV2M5dnMyM0x5M25NNDMwMHd2M2h3Nm5JU0la?=
 =?utf-8?B?cytYOGMza09QQUlJb2hsZTFBeElaazFmNUN1V1RTU2FpTmJrTWNPRFZRR3ZO?=
 =?utf-8?B?UlovMG9lTm0zbXBIVkRQS0hqVnJmZVQwTGpVNXBTVUlhSklxb2d5TWVkUlJ2?=
 =?utf-8?B?LzhEOUVGMjVraHQzMXhCckV1bkpJTUZLUkxiUzBOYnNMTXFqdEM1Z2JkUThj?=
 =?utf-8?B?czRPNndrNFNXWE9lVW0zaWxEN2RyVFJhYVN2RGw3bTNoV2RCNThyVFV4K0h5?=
 =?utf-8?B?VGJGblNld05uSWQxNGp0RGhPU2NaUFFwRW5obkM4dWkySUU4WVhSeUt6RUR2?=
 =?utf-8?B?U0o0SlBlakdQVUUzWHVyajgrNm82VTRkUzh2dlRiSnpaS2tLTm90Y1hNK1Z6?=
 =?utf-8?B?K0Vybkl2NWs3dk1iaUU0U0V2TGtyN3paR0pHYXdvUFR4SzNuNDlPQThxOTZw?=
 =?utf-8?B?RDRpRzVQQlduaHdpcDNnVXE1NUNtem05eno3OGcxVUZpcXF1TTlhTExKcUsw?=
 =?utf-8?B?bkNEYkczeGJYQmFlUjVMcHo1SmZ2MWV6L2t1Smtac0NBL21GQ2ZNOGNUVU1U?=
 =?utf-8?B?VHRLWUhaTU4waUZNNmYzZkNXNGNMRjJzUnVOK3Jmd1d6MUc3YlBsMzJWRHdx?=
 =?utf-8?B?R3hDR3g2eDA2emQ0ejNCdGQ5cnZDUXV5ZVVpS20yMUdpMEk4MWlRdGtMQmF0?=
 =?utf-8?B?UVpRaUZhVzRRN2tTRmtoT2dPL2hUeWRrUGdXWEJPR0lHcDV4cGxzRVRCeksr?=
 =?utf-8?B?aE5lc2pRTEExQW1WTEovVVlhZVhkbE5aZXptbjNYZjdGV1NLazJaR2ZxRXBC?=
 =?utf-8?B?UUNhNkQ0UXBsaWZySkVEcXdlV2RGTmZWSW9YdnM3M29vQ1hrcnZ6WFJGTms5?=
 =?utf-8?Q?KP0KRVXXL1M02o1NmzMonO8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b95bd9a2-e8b0-4b0f-1893-08dd4726e576
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 03:24:14.3964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpROg5J37cTJ83ioFheOxZfrRe5VRmm5WSEfULt7/q4tSpEzJIqi1oxe6VeUUtywkIafUnvVy2fmhh/VRf0BmRXnu6BSmgkNK+ail1dN5ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
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



On 30-01-2025 01:21, Matthew Brost wrote:
> Add SVM init / close / fini to faulting VMs. Minimual implementation
> acting as a placeholder for follow on patches.
> 
> v2:
>   - Add close function
> v3:
>   - Better commit message (Thomas)
>   - Kernel doc (Thomas)
>   - Update chunk array to be unsigned long (Thomas)
>   - Use new drm_gpusvm.h header location (Thomas)
>   - Newlines between functions in xe_svm.h (Thomas)
>   - Call drm_gpusvm_driver_set_lock in init (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile      |  1 +
>   drivers/gpu/drm/xe/xe_svm.c      | 73 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_svm.h      | 17 ++++++++
>   drivers/gpu/drm/xe/xe_vm.c       | 12 ++++++
>   drivers/gpu/drm/xe/xe_vm_types.h |  7 +++
>   5 files changed, 110 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_svm.c
>   create mode 100644 drivers/gpu/drm/xe/xe_svm.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 328aff36831b..a078a8895ec5 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -97,6 +97,7 @@ xe-y += xe_bb.o \
>   	xe_sched_job.o \
>   	xe_step.o \
>   	xe_survivability_mode.o \
> +	xe_svm.o \
>   	xe_sync.o \
>   	xe_tile.o \
>   	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> new file mode 100644
> index 000000000000..79da859f02b1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "xe_svm.h"
> +#include "xe_vm.h"
> +#include "xe_vm_types.h"
> +
> +static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> +			      struct drm_gpusvm_notifier *notifier,
> +			      const struct mmu_notifier_range *mmu_range)
> +{
> +	/* TODO: Implement */
> +}
> +
> +static const struct drm_gpusvm_ops gpusvm_ops = {
> +	.invalidate = xe_svm_invalidate,
> +};
> +
> +static const unsigned long fault_chunk_sizes[] = {
> +	SZ_2M,
> +	SZ_64K,
> +	SZ_4K,
> +};
> +
> +/**
> + * xe_svm_init() - SVM initialize
> + * @vm: The VM.
> + *
> + * Initialize SVM state which is embedded within the VM.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_svm_init(struct xe_vm *vm)
> +{
> +	int err;
> +
> +	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
> +			      current->mm, NULL, 0, vm->size,
> +			      SZ_512M, &gpusvm_ops, fault_chunk_sizes,
> +			      ARRAY_SIZE(fault_chunk_sizes));
> +	if (err)
> +		return err;
> +
> +	drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_svm_close() - SVM close
> + * @vm: The VM.
> + *
> + * Close SVM state (i.e., stop and flush all SVM actions).
> + */
> +void xe_svm_close(struct xe_vm *vm)
> +{
> +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> +}
> +
> +/**
> + * xe_svm_fini() - SVM finalize
> + * @vm: The VM.
> + *
> + * Finalize SVM state which is embedded within the VM.
> + */
> +void xe_svm_fini(struct xe_vm *vm)
> +{
> +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> +
> +	drm_gpusvm_fini(&vm->svm.gpusvm);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> new file mode 100644
> index 000000000000..49cfd938aa17
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_SVM_H_
> +#define _XE_SVM_H_
> +
> +struct xe_vm;
> +
> +int xe_svm_init(struct xe_vm *vm);
> +
> +void xe_svm_fini(struct xe_vm *vm);
> +
> +void xe_svm_close(struct xe_vm *vm);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dff10dfa9c69..bc34e6738c8c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -34,6 +34,7 @@
>   #include "xe_preempt_fence.h"
>   #include "xe_pt.h"
>   #include "xe_res_cursor.h"
> +#include "xe_svm.h"
>   #include "xe_sync.h"
>   #include "xe_trace_bo.h"
>   #include "xe_wa.h"
> @@ -1504,6 +1505,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   		}
>   	}
>   
> +	if (flags & XE_VM_FLAG_FAULT_MODE) {
> +		err = xe_svm_init(vm);
> +		if (err)
> +			goto err_close;
> +	}
> +
>   	if (number_tiles > 1)
>   		vm->composite_fence_ctx = dma_fence_context_alloc(1);
>   
> @@ -1549,6 +1556,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   	xe_vm_close(vm);
>   	if (xe_vm_in_preempt_fence_mode(vm))
>   		flush_work(&vm->preempt.rebind_work);
> +	if (xe_vm_in_fault_mode(vm))
> +		xe_svm_close(vm);
>   
>   	down_write(&vm->lock);
>   	for_each_tile(tile, xe, id) {
> @@ -1617,6 +1626,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   		xe_vma_destroy_unlocked(vma);
>   	}
>   
> +	if (xe_vm_in_fault_mode(vm))
> +		xe_svm_fini(vm);
> +
>   	up_write(&vm->lock);
>   
>   	down_write(&xe->usm.lock);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index f6855e4fb9e6..aa075d5e7a3f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -6,6 +6,7 @@
>   #ifndef _XE_VM_TYPES_H_
>   #define _XE_VM_TYPES_H_
>   
> +#include <drm/drm_gpusvm.h>
>   #include <drm/drm_gpuvm.h>
>   
>   #include <linux/dma-resv.h>
> @@ -140,6 +141,12 @@ struct xe_vm {
>   	/** @gpuvm: base GPUVM used to track VMAs */
>   	struct drm_gpuvm gpuvm;
>   
> +	/** @svm: Shared virtual memory state */
> +	struct {
> +		/** @svm.gpusvm: base GPUSVM used to track fault allocations */
> +		struct drm_gpusvm gpusvm;
> +	} svm;
> +

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	struct xe_device *xe;
>   
>   	/* exec queue used for (un)binding vma's */

