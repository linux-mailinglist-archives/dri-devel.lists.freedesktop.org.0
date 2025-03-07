Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EC1A56803
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 13:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFFF10E187;
	Fri,  7 Mar 2025 12:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZpTaY4hX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1ADC10E183;
 Fri,  7 Mar 2025 12:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741351276; x=1772887276;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OMHjOLhEFun8vHXZ5sQZVjl7VVnL664ayJTfVsuXMVI=;
 b=ZpTaY4hXtq70WP/4nh9tpG8nC4/hbiFbBq6/CLIG2Xpb3Oirx8gNnQrE
 0FF3f8KKV5RBQPSa6SGcHcwKrDyKXpXkHfZ6bvfZrt7mnulglttyFKWb+
 JoTjXATarOm50leqpEKYYayDx3mC9yL2gKWPMNbZjmjhQ+AV2ShNB4OT5
 wFapNHN0YUXeC4jwod2D7mSDtT6RifSMVvrwi20JY6u/Z1CXYgL3HVe2N
 M2oGFL97MMRc2htLs/VlpfSimGUCLelEeu2t0iFsr7GYQxqGJUeZ9T5OA
 jGX9Sik5FHL9yehwTGka+v/X10rp4hKUNPosCaZA2eof2maUmE5zNhsyV w==;
X-CSE-ConnectionGUID: UTIGIa0dQFSVxdr7mnsHLw==
X-CSE-MsgGUID: lRiBBCJKQRKW44gQa2A9ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46323184"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="46323184"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:41:15 -0800
X-CSE-ConnectionGUID: W+gpwsZFRBCTxjMWivw/fQ==
X-CSE-MsgGUID: uJZH0wfgQ/yj9x6X3JFBSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="119311731"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:41:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 04:41:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 04:41:13 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 04:41:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLIxtjxIvBixnxUEmjuxS+vqihboMR+gGlnFI+B5KyaflDo99dZcfJc1Bh5xVfYHLbq7FR8Z8KOBz9reCothq2lR3shpEm6pQk5dF+brS7yXIIrZQh5KTCo56ODVa9P7ojBjq8txxcEm45EtFccsRS4bXSu3kemu/Z84ehR3D5tVbqLNPnPCtwTRdtQTQqyeyHCWh+71WqE9ovf59dqsUKGfVBHEOFbMTxAB+j9Ftjj4Q8F3nXS0xXduxkVbW1avw6nzpROJDjetEckerHi8v7bTAIpKWt+BwhevGfmhQ0OxvPLCZl3RV0ZFXSz9+d2ENZPzJfKwQSgBskUy/7gMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/BHKftyDt2pCwMpWfi1C79MOV/CCg/mRxtLVX/BrY0=;
 b=lVp0Hv0E8aFgZjLq3gq4wig33rhQcI/mJpmXcrM0+b1js4AjiegCpqkLoxISKlMbFuBPpW3g8+zl1mDhtIhb9xAvWcgvpJu/cD1EzlFOTj37ELlKTQwfgPn89gTMpiGvYLzdYYaAX03Pi8sVInNVKSyaPR2o5kEojlmuakJ9G5D02TS1BL4Cpb2lZokaU4Mk6Qo7bofBnjGgCQSkUhdw0PrIQEvVCxG7S/JCWQQC9+bwPi8TrCZcM1RO3F4jxCc4d40pZkG6blyAiiRQPm7Zfo9sE4PhFQe2NZAxE3LTptbwIcHRw6SvDXGneC0jZFXalUHd9x8625v6/HjA9DFJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.19; Fri, 7 Mar 2025 12:41:06 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%2]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 12:41:06 +0000
Message-ID: <890216ca-e30c-4573-a9ef-14ed1e39ae07@intel.com>
Date: Fri, 7 Mar 2025 14:39:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/xe/xe_vm: Add per VM pagefault info
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20250304170854.67195-1-jonathan.cavitt@intel.com>
 <20250304170854.67195-4-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20250304170854.67195-4-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI2P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::18) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: d4526cac-61aa-4cca-bd55-08dd5d755405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjM2YmM5M3BNZHVKQUpYVms3UlZxdFhzMGplMWJaM3BnenJ4NGtpRzdxK3hl?=
 =?utf-8?B?cnpQWHlwQjBpcVpzR0hsbzZSZ2FENnRtUEdSUXdJQzV4a0RDMGdsOEtlMWVz?=
 =?utf-8?B?anVQV21qRGxIUms3bU9VWXRwNmxxNWNBMGlzUmM3WnQwUnM0TXlnRTh2YkM5?=
 =?utf-8?B?SExNZys4UVRselVJYWZUaUVtU2xYNEJwL3l1SzJDaXpQaGFSdFluazV0bm5m?=
 =?utf-8?B?TkR4YjN3YWg4b3NEL210L1VHY0lEaFNQRDJ6TzlMdCtlZitwR21GM24vZGlz?=
 =?utf-8?B?Y0NCeWZOa0hZQTRTTHBxZGE3MzZ4aWNrY3licnBRbE1aR2lZTWJFUDNSZHNJ?=
 =?utf-8?B?VnlFZ0w5cWxXTzVSNmpqME10VzAvdlZocDUvOGphaVJ5WXRlZDdWRXBmcW9L?=
 =?utf-8?B?dTVLUVRIc1Fmby85NFN6T0xIYTk3dHVBd1orMmNUb3gyaHlDK2xOUUFEWXdR?=
 =?utf-8?B?czZrdm04WGtPdi95RE8zOVhwS0xHcUIxYXNlb0tmTDhyMWtWdk1IRG9UVDhm?=
 =?utf-8?B?eEhxWjVzL0pGa0VKK2p1bVFId2I1UjhkU0wzM2JvWW9MNk5XTTB0dmp6eFhk?=
 =?utf-8?B?L0J4aUZYQVUyL1ZQS2svQlh3R21FQTJRbC9ubHlUUVhNZjF0QnBSYmhrM29Z?=
 =?utf-8?B?MHdIaFlYNFFMVzFLditZUXVnV255UE5xaWJRbXpLZFVxZ2tYRWJhM3ZlQVln?=
 =?utf-8?B?Z0tCNTdnSHh5aXY3eWcxQlIxMkRkT0piMUxBZkpZS1V6WEttRXU0NEVQbDB0?=
 =?utf-8?B?aVQwa0lQaVZnWjFjTXpYV0h2bXZ1NUpFbzJMaXZPTnF4VTBQWTBKaFlLdWpa?=
 =?utf-8?B?RjdVRUJOUmlnOFA2bVN3Q0J5VXRSWFlqZXVTTFZuU3dYMllEcG5EWUQzODJ3?=
 =?utf-8?B?YWJsMzNic3lnUGY1SE8wWStvaUdNRmdEUmFkMWVQVExCM0dFM2VwaDVya1Ba?=
 =?utf-8?B?OC9qeUpHMmNDL0p0amkxdnRmSFA2b0tkTTU1UVRHVUU5QUZIQTNWNjRmOEQy?=
 =?utf-8?B?QVdxTjIwVHpSZ05uV0ZOU25JdVBBNUYwR2VUcTN6THV1bk5qcVU0eUVwV0Qw?=
 =?utf-8?B?QW5aZkoxVU40d1FZVytxcWpucW1aNXV4OGN2QnBSK2FUVmNFTFUvYTY1b2RG?=
 =?utf-8?B?TUVxSWVMbzBBbGdISUxsdE5QOFRqaGgvSExVVzhjazhJZkdreTJoYld1RGx5?=
 =?utf-8?B?UXhIZ29SSlYrZWZhSXNxM1RHMmJKblZvdk4yWkFqUWZtWUkzQjc5dXNhZENZ?=
 =?utf-8?B?QTBjZng2dGpmN2U0cFlGQkxxbWMyUXAwYzROSlRUYzJsTlYrQms5STZFc0I0?=
 =?utf-8?B?aHRSRTJQeHlYaDRSbkNyOHl2QUVTSkhjelJxQzVhMFk0cXRDRmFETFZSbm4r?=
 =?utf-8?B?dWFibG1IRUljb3pKUm1IbWZkcXg1WlJlUVJ3M2VEWEtIdExkOUl4aElqaGZB?=
 =?utf-8?B?WHBzcGlNU0JaOWl5UUVkWis3ZUU1dGV1Q0RJMTQ0WTBEWHJZSWJHb0Y4cmEw?=
 =?utf-8?B?Qy95VGtGOVpxOXNBcFp1UzdydS9tUXB5NS9CVDhib2VFSVJ5czhxSGlIN3FL?=
 =?utf-8?B?ejFxT3phZFVIYW1iek5BSkhaUzdVZzk1WTdLRUlIUzBQR0dUM0tCOUVxWENO?=
 =?utf-8?B?NUlrVHNvelFCM01mNW5lOVBucFpQa2JuSFZkaFo0OWRBd2RIUVJGeGlneE9W?=
 =?utf-8?B?VmowWEszMUV4NkJPV2JMcU9UNUoxb20vNzJ5ZlpKYWdUaXRqYVBJcjV0MEJu?=
 =?utf-8?B?QVZpTFNRbi9jZGRpVEEvZmQwMndkNGRINkVQSXdOU1k4d08rOHBCRmZoOE9D?=
 =?utf-8?B?Q3lRdXEzZUVZQkJSRk1LOFFHRmZHajdVK3Y2bzdNVDNSSnIwbDZSNkl6ck9k?=
 =?utf-8?Q?QzYZh9d8UL/bc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVV2YmhXemNVQzV1RTJLUzNQWEhzOG0xZ1lnTGxybnpVdTJFVzFGNWlyRXRx?=
 =?utf-8?B?NDcwZmZuVXdRa3A0czBPSTJRT05iNUMrTVBXOFZmSW51Q3dBRWNPN2ZHRW95?=
 =?utf-8?B?dzVaRmVFeDJNdGJkRHp1MnlNMlVPSDBVWmFZVm01eVFzankva3lta0tiVENi?=
 =?utf-8?B?NmpneDhyd3dSOEtlZnpLbStEVVAyVWhqUk4ya1MybEhiaDJNdytQckcxWWlw?=
 =?utf-8?B?eVRTL3UyVTdwTG0wS2dSc2VNMnVrM1FqZ3J2RFVtaUhoZnBrUDNRRklQcDhI?=
 =?utf-8?B?M0lhQURLSkZtV25OY0RsZGVFdHF1NG40a09tQzJ1VklnWC9vTFlaQ3FoNG4v?=
 =?utf-8?B?dGNLekc3Z252SDBRUlFPajNrZFhpZ3ZkUkNuTENjNFBrOHU3dmRXaUZrQWl5?=
 =?utf-8?B?USt5QkpSSTVoVXJmcFFacGpydVFNRHZubkNxR2pTSy9KbWd2aTg5bC9YSjB0?=
 =?utf-8?B?bWZBeVM2WE9WVGVnL3c4QTNhc2M2SE9jdEFRc2s4WnBPVW1ibjdReHkwakFS?=
 =?utf-8?B?YTl4VmFpbkZWbWMyTXYwcDdRWC9zdkt0aDhtNUdlcnVXeHlMTWpoRjZSYXFk?=
 =?utf-8?B?Ynd0TnJpMUdYMUNhMDVvVllvUW9oWE83cGxseHFtQldNK0x1MmkxTkwxQkRR?=
 =?utf-8?B?NzZjMmdyY2gvaE1oT0hZaE9zK015QXhjdEk1NnVGNjZ3K1RsL1huZnRKaTdD?=
 =?utf-8?B?c3BIcjlrRUw4Z3lxcFBBRUs4bG5PbmhOdmxOZjV5dUo0Y2xaeTlNYjJSREhU?=
 =?utf-8?B?MnZ3WWdJRkVHT0UyQXg4SkRla3dKSnJiQmlJOVNVc0RndE5XcEFYbXY3YjNN?=
 =?utf-8?B?dm82bVU5TkNFM1RINHNSMnNvWTk3OUlxRUtjanRTaTRHbVBrUVdUcVNLZlJ0?=
 =?utf-8?B?Wk50WWs3OVhnYzE5M2R4M2trd1VHMzRpbDhJU2hJbmhrN210bmFrZHdGS00z?=
 =?utf-8?B?N1d2dE04VlJjVTJtdTNEUnZBRGRTdllRT0laaVI5WnhjYTkweS9zb0lxeldZ?=
 =?utf-8?B?Mml5MmNPS3BCZjA5RzcxOHhRWnc5SUJ6SUt1andDMUxnejFwWG9GUExGYUFX?=
 =?utf-8?B?V043bnpoOU5ZMi85UXFCUmtoRDJwbFczZnIvdjJXUVJDbzlFQmtwQmZIb2N6?=
 =?utf-8?B?SEFEckhPS0E0RUZzdzc2L2Y3a0ZpTlBLME9BMjdTRzJ4bHAvaW53RUEwcjdm?=
 =?utf-8?B?bVBqUHpsdW5EakFQZUNBMWg0VStWRnp0SmtmZHhKa0wyNWJOWmxTZWNCUFZn?=
 =?utf-8?B?SjIrbEQ2OFpISXB6QUFneW1TYTFTQ3AvOUVOOWdmLzRPUG1WZlhhQzAvQVoy?=
 =?utf-8?B?ekkxY1JJL3ovZVNwQ2VyeFc2NE1rUzdOemlQQ2w5L25IUzlNc1AyN1M2V0JG?=
 =?utf-8?B?Vnc0RDV0N0EyN3BsRjNQWjhrQ3ZseXFvcWVoRUpZQk9ML2JZNTh1NmRhNkhO?=
 =?utf-8?B?cXZVZGNlREV0ZmlSMXZZbUFjZjUvbUw4Ykw3dElxVXRuUmtyN1ZUR0hNRTJE?=
 =?utf-8?B?Y2RnTUNJZzJiT2gvUDRuWml4UDcrOCtRMnB0QS83VWQzT3pENTErZXU1WHFa?=
 =?utf-8?B?SGY0d05FWjNpd2ZKZXhuSUJXbUJGdlRFTFE3czVORnN3VGVYbktwQWFxUGo1?=
 =?utf-8?B?ZlVWQmk2eFZRRE5IdjM5QlhSN2k3TUtDcjY0eUREMkl0MDBjbVFiQ09PK25i?=
 =?utf-8?B?R0srcXBoNnkzSE1WSXEvQVVxSS84RXZkZUN0dWRhd09Mb0hpanh2SzNuYkRB?=
 =?utf-8?B?aklJWjlaWVVxTjVwU0ZQcitSZkl4L0FrMlNOUnRidUJHdXcvQVh6bmxxMUs2?=
 =?utf-8?B?OWt4WW1senJmODR4azIwZ09wZlRLbmJhMTRZQmZPUWlWN3dBa290T2xMRDl2?=
 =?utf-8?B?bG8xZGY3OGNlSVE0Rjd0TC9OaXYvZUxEQXg1L3gxbFI1QUVzYk1CVXFXY0xQ?=
 =?utf-8?B?L092U20vNk5Cd1lpTTg1Q0JxSVR1cnZBM3A1S3BHQlE5RG8wZkNickFxZldT?=
 =?utf-8?B?TDVJQWxEMGJkUUVBTUdkZzRXUTZmQjRoRERWdHRFU3lCKzF3NDlxc3RKUldk?=
 =?utf-8?B?djFXR01MTEtrcWtMY2ZPNWg2TURpdDYxT0lhM21ZUkI0NkNBeCtXWm9RTTJD?=
 =?utf-8?B?clp1ODdlbDZMTnl2Y2cwUGN6UkhYS2tYSDJFRnhFY3ZJMzJUbisxZmNEa3Mz?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4526cac-61aa-4cca-bd55-08dd5d755405
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 12:41:06.2563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9C0bM/e6jBNeONeDffiV+H40JYmxZOV3T+QPAKBqhwxh3+YOBoSChXNXJgL4JTF2Kq6VOLDEq7IEguLLhr0ZwOnd13482xxsFQ35Jb091aM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
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



On 3/4/25 7:08 PM, Jonathan Cavitt wrote:
> Add additional information to each VM so they can report up to the last
> 50 seen pagefaults.  Only failed pagefaults are saved this way, as
> successful pagefaults should recover and not need to be reported to
> userspace.
> 
The unrecoverable pagefault scenario causes a caterr or context reset. 
so It would be enough to store one uncoverable pagefault for providing a 
unrecoverable pagefault details to userspace. how do you think?

G.G.

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 17 +++++++++++
>   drivers/gpu/drm/xe/xe_vm.c           | 45 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.h           |  6 ++++
>   drivers/gpu/drm/xe/xe_vm_types.h     | 20 +++++++++++++
>   4 files changed, 88 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 07b52d3c1a60..84907fb4295e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -335,6 +335,22 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	return full ? -ENOSPC : 0;
>   }
>   
> +static void save_pagefault_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
> +{
> +	struct xe_vm *vm;
> +	struct xe_pagefault *store;
> +
> +	vm = asid_to_vm(xe, pf->asid);
> +	if (IS_ERR(vm))
> +		return;
> +
> +	spin_lock(&vm->pfs.lock);
> +	store = kzalloc(sizeof(*pf), GFP_KERNEL);
> +	memcpy(store, pf, sizeof(*pf));
> +	xe_vm_add_pf_entry(vm, store);
> +	spin_unlock(&vm->pfs.lock);
> +}
> +
>   #define USM_QUEUE_MAX_RUNTIME_MS	20
>   
>   static void pf_queue_work_func(struct work_struct *w)
> @@ -353,6 +369,7 @@ static void pf_queue_work_func(struct work_struct *w)
>   		ret = handle_pagefault(gt, &pf);
>   		if (unlikely(ret)) {
>   			print_pagefault(xe, &pf);
> +			save_pagefault_to_vm(xe, &pf);
>   			pf.fault_unsuccessful = 1;
>   			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 996000f2424e..6211b971bbbd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -746,6 +746,46 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>   		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>   }
>   
> +static void free_pf_entry(struct xe_vm *vm, struct xe_vm_pf_entry *e)
> +{
> +	list_del(&e->list);
> +	kfree(e->pf);
> +	kfree(e);
> +	vm->pfs.len--;
> +}
> +
> +void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf)
> +{
> +	struct xe_vm_pf_entry *e = NULL;
> +
> +	e = kzalloc(sizeof(*e), GFP_KERNEL);
> +	xe_assert(vm->xe, e);
> +
> +	spin_lock(&vm->pfs.lock);
> +	list_add_tail(&e->list, &vm->pfs.list);
> +	vm->pfs.len++;
> +	/**
> +	 * Limit the number of pfs in the pf list to prevent memory overuse.
> +	 */
> +	if (vm->pfs.len > MAX_PFS) {
> +		struct xe_vm_pf_entry *rem =
> +			list_first_entry(&vm->pfs.list, struct xe_vm_pf_entry, list);
> +
> +		free_pf_entry(vm, rem);
> +	}
> +	spin_unlock(&vm->pfs.lock);
> +}
> +
> +void xe_vm_remove_pf_entries(struct xe_vm *vm)
> +{
> +	struct xe_vm_pf_entry *e, *tmp;
> +
> +	spin_lock(&vm->pfs.lock);
> +	list_for_each_entry_safe(e, tmp, &vm->pfs.list, list)
> +		free_pf_entry(vm, e);
> +	spin_unlock(&vm->pfs.lock);
> +}
> +
>   static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>   {
>   	int i;
> @@ -1448,6 +1488,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	init_rwsem(&vm->userptr.notifier_lock);
>   	spin_lock_init(&vm->userptr.invalidated_lock);
>   
> +	INIT_LIST_HEAD(&vm->pfs.list);
> +	spin_lock_init(&vm->pfs.lock);
> +
>   	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>   
>   	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> @@ -1672,6 +1715,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   	}
>   	up_write(&xe->usm.lock);
>   
> +	xe_vm_remove_pf_entries(vm);
> +
>   	for_each_tile(tile, xe, id)
>   		xe_range_fence_tree_fini(&vm->rftree[id]);
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index f66075f8a6fe..4d94ab5c8ea4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -12,6 +12,8 @@
>   #include "xe_map.h"
>   #include "xe_vm_types.h"
>   
> +#define MAX_PFS 50
> +
>   struct drm_device;
>   struct drm_printer;
>   struct drm_file;
> @@ -244,6 +246,10 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
>   
>   int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
>   
> +void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf);
> +
> +void xe_vm_remove_pf_entries(struct xe_vm *vm);
> +
>   bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
>   
>   int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 52467b9b5348..10b0952db56c 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -18,6 +18,7 @@
>   #include "xe_range_fence.h"
>   
>   struct xe_bo;
> +struct xe_pagefault;
>   struct xe_sync_entry;
>   struct xe_user_fence;
>   struct xe_vm;
> @@ -135,6 +136,13 @@ struct xe_userptr_vma {
>   
>   struct xe_device;
>   
> +struct xe_vm_pf_entry {
> +	/** @pf: observed pagefault */
> +	struct xe_pagefault *pf;
> +	/** @list: link into @xe_vm.pfs.list */
> +	struct list_head list;
> +};
> +
>   struct xe_vm {
>   	/** @gpuvm: base GPUVM used to track VMAs */
>   	struct drm_gpuvm gpuvm;
> @@ -274,6 +282,18 @@ struct xe_vm {
>   		bool capture_once;
>   	} error_capture;
>   
> +	/**
> +	 * @pfs: List of all pagefaults associated with this VM
> +	 */
> +	struct {
> +		/** @lock: lock protecting @bans.list */
> +		spinlock_t lock;
> +		/** @list: list of xe_exec_queue_ban_entry entries */
> +		struct list_head list;
> +		/** @len: length of @bans.list */
> +		unsigned int len;
> +	} pfs;
> +
>   	/**
>   	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
>   	 * protected by the vm resv.

