Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFzvBlxee2kdEQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 14:19:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB62B0501
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 14:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3714510E871;
	Thu, 29 Jan 2026 13:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XCTPONrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A243C10E05A;
 Thu, 29 Jan 2026 13:19:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIbZlLMHhhdQb2Fg82/ICcvzua53d4lQmRCWgh91Yl6vTE0ghvIIbpJgMX/8R8JYN+QICZFDZz0O82LEXKXTl+cE6PS/N9fOWAnwH+NrJBhYwWVDuWqHnYx7usnwdf4UNTjVZr29VXLGdeQZLFGJq5WZXaNjfOtkvgFYz/n/fDrYTpS/uuns1Tw0OjyW4qSXSQ2+EatFhwlvgNXGQnJbB8LTfIM/6hTcgu6I7oAscfwbOkCdBXurEdOxba+ewniP3uo2FtohTJOMjhUuC8rgHwe3DEmppqVzeAjOzX/5nmWbc2JLx+AuSJsJ8wSR55HGGXunW4A+0l9V4vEw3Qmr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIpgTO+ByTkXmEb0rPvl6v2z8jw67AxeHmILWR/yLbk=;
 b=LlyK7ouBVJN9FQFj2itBZ7HacJKJ/gmXkB88kyG5qbR+dW/GfrJbd2D2LlesxJHKKZSFYjbGdaYVRs5LPVJ2auObW5E7i5rOIw9BqTO7JP4nIMcnEAa6IdYySqYTa2qddIojjvthQHfXb/VXdzulu4BNrMrXRnTiij95jKlcMWs0IxqWANm/Iz0DjndegYSckkQAJrjc5VnQfi7RVsTMD1biQ06aKYIuiZ4AFuwzAq3ip7z6ujgy1HGoy/J5SXBfeMZxxWhoOYembtcnBSfq/JmnYX4Fq2FeUOfOrDEVpSqBVFCb6UWQoQSWdWYd7DkzzJ26n5hnQP9aYiIQUJWnXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIpgTO+ByTkXmEb0rPvl6v2z8jw67AxeHmILWR/yLbk=;
 b=XCTPONrVeOHze6tZsZL5UNRl0HMVz8OhC0HwSKiYHaU6sEqNx2HzoFRSM8IZsJFxFrlXzk9BNSso2TXys+vogKqv5J/sLzjebbtSHXLlhydgDgN5ssoTLFRjrdVwhySgNz1m6LuGZuAL6uFRaSIYSxH/e1gg+3x/qRHn37UkM7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by IA0PPFACF832414.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bdf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 13:19:12 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%4]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 13:19:11 +0000
Message-ID: <794705d7-84aa-41da-b028-9b9fb29318c8@amd.com>
Date: Thu, 29 Jan 2026 18:49:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/buddy: Optimize large alignment handling to avoid
 unnecessary splits
To: Matthew Auld <matthew.auld@intel.com>, christian.koenig@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20251211122319.2054-1-Arunpravin.PaneerSelvam@amd.com>
 <b2aa28aa-ce9c-4948-9bed-289700f4eb4a@intel.com>
 <b8640bf9-1c00-47da-a659-ce79a7af67e3@amd.com>
 <db877e44-a548-4a25-971b-d9a7729701a4@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <db877e44-a548-4a25-971b-d9a7729701a4@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::10) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|IA0PPFACF832414:EE_
X-MS-Office365-Filtering-Correlation-Id: ec6428ee-3f94-42fc-ae4b-08de5f38fdb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjhLUTI3YWl5eEs2N0JzV3JmRWsyLzgyOGhOR0FLaDZ2Q1IzaVRWZDNaWTha?=
 =?utf-8?B?Mkg5WDdwSnBPM1NoUGMrQmdzTmNDM0VZdWFUSjdESFJOcEV5dTM4SWEvaW9T?=
 =?utf-8?B?NW9iZGJ4NGVhR1lhcW5XSjBFUnh6TXFHSTFZMDVxdDBEYnZxTG5RZzlKbmJY?=
 =?utf-8?B?RGVJU0ZVeXN3V2tLd21mZ29BTzNqemlpSlRQVHpYN0Y0RGVKL3ljZm8rd1FD?=
 =?utf-8?B?dXJZODllaUhRUUNLdDdBWXdqaXU3M1RpSVd1VE5sU25sSnNHZHBRWW5zV1ZT?=
 =?utf-8?B?VGlBcWNIZmRzei9abWpUTVdYcDlDdGFEUGYyZWlKeHBWMVpoR0Nnc3BCQVkx?=
 =?utf-8?B?d1o3aitRTTBxNjlEWWloMFk4OUlSWkpiQ0IrWHJTMTZpdEJjaXhHOEQ3R3BK?=
 =?utf-8?B?Uy9QYzZmZVY5TFZhOU83NVZZQmhia0hJemQyNmE2OW1LcTZlZnRFZFl0ejd4?=
 =?utf-8?B?eXprUUtqNTdXZGwyYVF6Z2Z2bjFDUlAyOEhZS2hXUFVLN3k5RStLbUhXS2tS?=
 =?utf-8?B?Qk41NGQ4RHZvZ3V4VjlEMmI1VVZhcnRTcnZ0SXZqaTJsd1YvY1dhN0NZbHIy?=
 =?utf-8?B?ZmdmREJ1a3QySk1YT3c5aEVHeUs0NktmbGNPWkcvU2pIVjE2d1I4VkE0Rk9I?=
 =?utf-8?B?azJoWDVtT3FIUm1XcFArSGtDQlVnUGFTdFlZYzRDQTQ5UVc1R0tSay9TTTFw?=
 =?utf-8?B?UmNZN2JJdHFJWFVkVy9xZlpySGpyU0l6Um5XdGx3eDM4dmF0QjFTVEZJbVM4?=
 =?utf-8?B?T0NoN1dzaXkwTzc5YTNUZTdxNWRMc3hRdEVEYmlNWEhWWjhUbU8rTlYyM2VP?=
 =?utf-8?B?N2tGa2xZaEpFcXowSVVNanc1Ym8wbXp6UTYwTTZNSng3cjlHYVBQamFVd3F2?=
 =?utf-8?B?TU1seHpCQ25VbEpJbHM4cFpTR25QQnJxRllVcVhuSGVOWkgvNFJmeU1zMkxj?=
 =?utf-8?B?Q1dBakZxZTVtOFlab1J3V2RnSFZpak1LcmV5dVpEQkJLVVdWYTVwcWtvWlZu?=
 =?utf-8?B?bW9ldUtMTzBJZWxld3JJT25oVFU0VU40eXNRMHZUb0Q1L1ErL2xLVk9pVlRk?=
 =?utf-8?B?V1ZJYlVaaDhOc1FITEZhWmFKMGwzcnorL2RwdHliQ0tvMjVoaUxlMDNWVjhk?=
 =?utf-8?B?RjZnck0xdEt6ZzRITC9NUzhRRU5zOFozTzNGMWpneFNqSXZWanNMQkRadFNL?=
 =?utf-8?B?MElqcThpdENpNi9SQUJrMjR4SnBDUVdqejYvZ1JDS0xwSWJqTXNrQ0p1MVQz?=
 =?utf-8?B?TmNVK3NDeG8rd0xzdnYxMFpWblZGY3ZYS3o0eTQvaTY1RWFBMm5EVnN0OW1J?=
 =?utf-8?B?WmxxcjVpazIvV3pwWFU5Wi9peTJ2MExRNWVvc0JxYm1RMHpNV3pRbEFQTjFp?=
 =?utf-8?B?OVp4cE1xSTJtY2t0YzRvQVNBVERyK1c4SkxSMDF1U3A2QnVYZmlnWEdJM0Y2?=
 =?utf-8?B?alE5NHVOWW1SYi9oZW9pMUNVcW9UYVRtbjlIcEhsWXNwNEdjOW1ocUdmS2ow?=
 =?utf-8?B?aWViYWhZckgreElGREROdEJ0STdyT0hiaGFSZm1EWjFLV3NQaHJkYnR0K1VD?=
 =?utf-8?B?RFlaSWxMTEJ0YzJBVFpaY0doODkwV0ZNdU9KQmY5RGRWdXp0aHIvK25POWxj?=
 =?utf-8?B?RFVGNlFJcE9RTStqeUw3eExuQlpyYlJFdUpSdkcreUN2QXVMakFyWSs5STVF?=
 =?utf-8?B?R0F0NFZkS2s2LzQwLzVaNEQxV0JwYWg0cjl2QlZPUlp6cWx0M29RWGRYdVV0?=
 =?utf-8?B?VWFPeUJSSS9VbDJtYkNNRDM0MzhScythdGdEVTFGU2hqMElIbVR3bStjOTBD?=
 =?utf-8?B?Tkx5L2RaNXhSd01iUUxxUTJoUmc0cWE0OWczVFZZald1RkpXamJCQmREUDEr?=
 =?utf-8?B?QWg1OGwyNE45T1Jydno5bjBNT0JNWXJEMm5DdFhIOHFKV3dPUHF6VUZYVkJu?=
 =?utf-8?B?S0hJcFVlSFVrZmQ5Ri96Y0h1SW95cklVbzhMcGpWQ1pJTFNDdlZNZFI5VUNz?=
 =?utf-8?B?VTBrZFcrL2FWVEJlMU5JSWZZUFVZQytzUEVYMWNzb1Zid1l2RDY0VTFKMjk2?=
 =?utf-8?B?bEJDRE9jaGlYdDc0NnZFY0RzVmc5azRGOGVNT09MZW9DdnNHM2FvZ1NsdlI0?=
 =?utf-8?Q?NC5mKrkLMTtcbCkIfM28T45ns?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlBycDAwRzlPS0ZWbmEvR2dUbzRNKzFOZGF5cC80b0wyTUZ0WkRxZUZSL0N1?=
 =?utf-8?B?OXQ1bWt6eXRSejI4YVk0RG4xaUdQU3VqaFM1L2N3a0RJWVFKa25EODdlL0t3?=
 =?utf-8?B?UkJRRU5DdWlDRldpYm5xWldxeU1GSjc1NlF4NFliSFVaZitHT29RdU9NVFBD?=
 =?utf-8?B?UlorZzFIbk9zZ0VZbnhxVE9HdlBZbllRbkRsNEQzWG5Say9QaTRnRzd4STZZ?=
 =?utf-8?B?UkdJakhBcnlyaHp4UVM2c1ZSV09pcWZmVS93VVJyS0pGd3hHMUdlNmhDdTU5?=
 =?utf-8?B?US9zdCtTbEdCZWVjRHVQbVpGRkoxdE9DODZLT1hsell6ZTZMTnhGazJkZUd3?=
 =?utf-8?B?czlIVTBKZGpJNCt3enAvSjJLL2t2WmtkWHk1NnVjQ2xLTHlkRThxRVo0YWdv?=
 =?utf-8?B?ZEpXNHRZYzFxcnk0VjBkWFVHdFFnTU9vVjFJV05Sd01qcy9yWFBMckJTUFdt?=
 =?utf-8?B?SGthSU9UbHljQjRJdjlqSzJkWXY4aHdjcXR0N1FqcERzRjM1bGc4MmJwOGxU?=
 =?utf-8?B?UEJrZ1c3OE4yVnVkbE5DK1V0ZDgzb1h4QlkzY3JmMzdUamdGNFZNTkdqRzR1?=
 =?utf-8?B?OGdCTVh1ZnBCTERLZjVmYVpaVTI0SHhyQ0ZlTzlka0dCTE0yMHdZMWhleUZF?=
 =?utf-8?B?elZRZTlZZ1E0ZWFxOU9xcjNmdHVQL0h2aTBLTmxvalhHdWNLdFl5ZDZ1RE1k?=
 =?utf-8?B?YktUOFZzZ0xycG8rb3dJY0hGZjdFZjBsWFFNbGdZanpiUGpncU40TVRhUDBI?=
 =?utf-8?B?eUtGbzVvR1FmTjFGZlFHdmtOaWpqRm9KNnR6anYzMFdTaHQ1N2ZFVm1DN0lU?=
 =?utf-8?B?VEM2a1NKQjljV0JFNTFld1p5cmNtdDJtK2ZCZHpPOVYxVEhzTElTdk0wZXM2?=
 =?utf-8?B?UFJNb3M5eURyNEhoY1QwcE9aUnRhYm1zSlZJanNuMlhsVEN5Y2FBbFNJYlBY?=
 =?utf-8?B?MWVzUDNpYXhYTE95NnU1Q1lZN1oxZm53ci9OdVN5QXpBNzYrZkRkRi92a2Rz?=
 =?utf-8?B?aWdWNElxR2lmODduTmFCUWE5dmkxYjQ1TTVLR1o5azA4eVBVNWhWN2VaS1du?=
 =?utf-8?B?QkFSZmhNZmJ5czhrcnFtVjJld2hnUWZ5OWYybmNkR2duUUZLQ1JFWk1uVUlk?=
 =?utf-8?B?S2QwNHptTDBCY1RGWGFsbFBkMWIyS0NZeDF0d2RjZk56emtMdnViUkFtMElE?=
 =?utf-8?B?NzBCdGhXQnE0eGxaU1hQa1ZLVDJmUTBoMzJybWl3ZzcwZ2lqOFcvYnVzUHRn?=
 =?utf-8?B?SlJvQ1hJMnUzQWt4NkliQSt1akJKTzVCaWZNVkxmamlUZHovNTBsYVE5cXBs?=
 =?utf-8?B?Rzloby9EMVpIK2VpdWw3bktHR0tRaVd5U1dpV2gya0FUaFRTbjNtMmwxZ2l6?=
 =?utf-8?B?RmVuRU1mTlhMVVgwdFkwME1lZFI5cmFjcEMxdHVlZWlpYmJZcWxYckRjeG9C?=
 =?utf-8?B?bXpJcGl2VHNhNjMwMW9XSGR3RXhUak12c1dXeHArTzNRVTlKcm5XcmtYaUZr?=
 =?utf-8?B?YzQ1KzJNaXhnaWxWZW42UHdaK2lpdHBtM3ZwVit0SGxvWDV6YWpyajM0YWk1?=
 =?utf-8?B?ZGtpTUFaaTBib2o1VGc2dENlWDRIeURFWVREV0h1NmZRZy9SZmF4b3FpSWU0?=
 =?utf-8?B?cm1mVDJpSkVyVDVCRkh1Q0I0TE82ZUh6RUdNTWFpYlQxVjZPbFRDV1EzNEJ4?=
 =?utf-8?B?UmJUN2h6NWx0K2ZzRHVOYWdoVDBIRVdTeGYwNC9lSHZhUzNLY3V3cVdjQ2o1?=
 =?utf-8?B?ZDhheEdsN2kwc0dwZ2FpbHhrYTdVZ0g1alVVME15WC83MXJFWC92TURWMnFQ?=
 =?utf-8?B?K3hkZ2Q1M0d0SENOeUw3c1NwL2tvaTFzQnhPak1VTXdhd1o2TmpLVHVjRVBm?=
 =?utf-8?B?dWpMOVRoaWl4eE0vWWJjWTRQM3Znc1FCN1JTZC94NUFnTkVFaWh5RnMzSWNq?=
 =?utf-8?B?NDVYVUIzM1grRFY5Y1dKempIdUNON3BVUlBNamdYdTk2VTdzbFBQcWM3c1R5?=
 =?utf-8?B?N0dLMDFJOE9ROG0ybUdEcjhMVkRaN1F1NFprdHlMN3V2V0p3Ryt1Ym8rOWcy?=
 =?utf-8?B?eENDWlZxdGVMYUZ6dTNKdVkrUGdEeUUxMGRady82RGp0ZVhoNjZxNDJPVzJj?=
 =?utf-8?B?RjNwWnozellYeHZseFhac1R0T1kwYXR6UDZOcFRtYk9wREdhZHQxVERFT203?=
 =?utf-8?B?K0djYTI2TU5zbTJWUWpIRVB5WUdCMEJybmZ4VWx6RXZTczZPUXJoWWlwblNo?=
 =?utf-8?B?TUR1U0JiSjM4QlQ5eDl5UFlQK25Ob3pwOWFYdG1za1AvUmZlT0MyWVVMd2h4?=
 =?utf-8?B?SVhFdWNYc1hBOEx4dFdKalQ4Nk1UZXRDcURuanBhZU90YTBNb0lkdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6428ee-3f94-42fc-ae4b-08de5f38fdb8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 13:19:11.6471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7n1Hv+ckS3CUuvUaqzd44HtHuugJeBmTHQzR1lzFSJc16Koabsbzpix7zia68YovFdGq995pnMxwclQ4981zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFACF832414
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arunpravin.paneerselvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: BDB62B0501
X-Rspamd-Action: no action

Hi Matthew,

On 22/01/26 20:32, Matthew Auld wrote:
> On 22/01/2026 14:13, Arunpravin Paneer Selvam wrote:
>>
>> On 09/01/26 22:12, Matthew Auld wrote:
>>> On 11/12/2025 12:23, Arunpravin Paneer Selvam wrote:
>>>> Large alignment requests previously forced the allocator to search by
>>>> alignment order, causing large free blocks to be split even when a
>>>> smaller aligned range existed within them. This patch switches the
>>>> search to prioritize the requested size and uses an augmented RB-tree
>>>> field (subtree_max_alignment) to efficiently locate blocks that 
>>>> satisfy
>>>> both size and alignment. This prevents unnecessary block splitting and
>>>> significantly reduces fragmentation.
>>>>
>>>> A practical example is the VKCTS test
>>>> dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000, which
>>>> allocates 8 KiB buffers with a 256 KiB alignment. Previously, these
>>>> requests caused the allocator to split large blocks despite having
>>>> smaller aligned portions within them that could satisfy the 
>>>> allocation.
>>>> The new design now identifies and allocates from these portions,
>>>> avoiding unnecessary splitting.
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_buddy.c | 205 
>>>> +++++++++++++++++++++++++++++++++---
>>>>   include/drm/drm_buddy.h     |   3 +
>>>>   2 files changed, 191 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index f2c92902e4a3..f749814bb270 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -23,6 +23,18 @@ static struct kmem_cache *slab_blocks;
>>>>   #define for_each_free_tree(tree) \
>>>>       for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)
>>>>   +static unsigned int drm_buddy_min_offset_or_size_order(struct 
>>>> drm_buddy_block *block)
>>>> +{
>>>> +    return min_t(unsigned int,
>>>> +             __ffs(drm_buddy_block_offset(block)),
>>>> +             drm_buddy_block_order(block));
>>>
>>> Didn't quite get this bit. Why do we pick the min between the order 
>>> and "alignment"? Say we have order zero block but is has 256K addr 
>>> alignment this just selects zero? What is the idea here?
>> Sorry for the confusion. I mixed up two concepts and I have sent the 
>> offset alignment only patch. Please have a look.
>>>
>>>> +}
>>>> +
>>>> +RB_DECLARE_CALLBACKS_MAX(static, drm_buddy_augment_cb,
>>>> +             struct drm_buddy_block, rb,
>>>> +             unsigned int, subtree_max_alignment,
>>>> +             drm_buddy_min_offset_or_size_order);
>>>> +
>>>>   static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
>>>>                              struct drm_buddy_block *parent,
>>>>                              unsigned int order,
>>>> @@ -40,6 +52,9 @@ static struct drm_buddy_block 
>>>> *drm_block_alloc(struct drm_buddy *mm,
>>>>       block->header |= order;
>>>>       block->parent = parent;
>>>>   +    block->subtree_max_alignment =
>>>> +        drm_buddy_min_offset_or_size_order(block);
>>>> +
>>>>       RB_CLEAR_NODE(&block->rb);
>>>>         BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
>>>> @@ -76,26 +91,32 @@ static bool rbtree_is_empty(struct rb_root *root)
>>>>       return RB_EMPTY_ROOT(root);
>>>>   }
>>>>   -static bool drm_buddy_block_offset_less(const struct 
>>>> drm_buddy_block *block,
>>>> -                    const struct drm_buddy_block *node)
>>>> -{
>>>> -    return drm_buddy_block_offset(block) < 
>>>> drm_buddy_block_offset(node);
>>>> -}
>>>> -
>>>> -static bool rbtree_block_offset_less(struct rb_node *block,
>>>> -                     const struct rb_node *node)
>>>> -{
>>>> -    return drm_buddy_block_offset_less(rbtree_get_free_block(block),
>>>> -                       rbtree_get_free_block(node));
>>>> -}
>>>> -
>>>>   static void rbtree_insert(struct drm_buddy *mm,
>>>>                 struct drm_buddy_block *block,
>>>>                 enum drm_buddy_free_tree tree)
>>>>   {
>>>> -    rb_add(&block->rb,
>>>> - &mm->free_trees[tree][drm_buddy_block_order(block)],
>>>> -           rbtree_block_offset_less);
>>>> +    struct rb_node **link, *parent = NULL;
>>>> +    struct drm_buddy_block *node;
>>>> +    struct rb_root *root;
>>>> +    unsigned int order;
>>>> +
>>>> +    order = drm_buddy_block_order(block);
>>>> +
>>>> +    root = &mm->free_trees[tree][order];
>>>> +    link = &root->rb_node;
>>>> +
>>>> +    while (*link) {
>>>> +        parent = *link;
>>>> +        node = rbtree_get_free_block(parent);
>>>> +
>>>> +        if (drm_buddy_block_offset(block) < 
>>>> drm_buddy_block_offset(node))
>>>> +            link = &parent->rb_left;
>>>> +        else
>>>> +            link = &parent->rb_right;
>>>
>>> Is this correct? From the docs it sounds like we are meant to update 
>>> the max alignment for each subtree on the path leading up to the 
>>> insertion? It looks like insert_augmentated will only do it if there 
>>> is something to be rebalanced.
>> AFAIU from the docs, rb_insert_augmented() updates the augmented 
>> value (subtree_max_alignment) for all nodes on the insertion path, 
>> not only when a rotation happens.
>
> Unless I'm looking in the wrong place, the docs for insert_augmented():
>
> "On insertion, the user must update the augmented information on the 
> path leading to the inserted node, then call rb_link_node() as usual 
> and rb_insert_augmented() instead of the usual rb_insert_color() call. 
> If rb_insert_augmented() rebalances the rbtree, it will callback into 
> a user provided function to update the augmented information on the 
> affected subtrees."
>
> Plus the example code they give for the augmented case also matches 
> this, so pretty sure we need it. See interval_tree_insert [1]. Also if 
> that is indeed true, then perhaps something to add to the kunit to 
> catch this case.
>
> [1] https://docs.kernel.org/core-api/rbtree.html#sample-usage

You are right. I am debugging the augmentation update path and working 
on the fixes.

Thanks,

Arun.

>
>
>>>
>>>> +    }
>>>> +
>>>> +    rb_link_node(&block->rb, parent, link);
>>>> +    rb_insert_augmented(&block->rb, root, &drm_buddy_augment_cb);
>>>>   }
>>>>     static void rbtree_remove(struct drm_buddy *mm,
>>>> @@ -108,7 +129,7 @@ static void rbtree_remove(struct drm_buddy *mm,
>>>>       tree = get_block_tree(block);
>>>>       root = &mm->free_trees[tree][order];
>>>>   -    rb_erase(&block->rb, root);
>>>> +    rb_erase_augmented(&block->rb, root, &drm_buddy_augment_cb);
>>>>       RB_CLEAR_NODE(&block->rb);
>>>>   }
>>>>   @@ -596,6 +617,88 @@ static bool block_incompatible(struct 
>>>> drm_buddy_block *block, unsigned int flags
>>>>       return needs_clear != drm_buddy_block_is_clear(block);
>>>>   }
>>>>   +static bool drm_buddy_subtree_can_satisfy(struct rb_node *node,
>>>> +                      unsigned int alignment)
>>>> +{
>>>> +    struct drm_buddy_block *block;
>>>> +
>>>> +    if (!node)
>>>> +        return false;
>>>> +
>>>> +    block = rbtree_get_free_block(node);
>>>> +    return block->subtree_max_alignment >= alignment;
>>>> +}
>>>> +
>>>> +static struct drm_buddy_block *
>>>> +drm_buddy_find_block_aligned(struct drm_buddy *mm,
>>>> +                 enum drm_buddy_free_tree tree,
>>>> +                 unsigned int order,
>>>> +                 unsigned int tmp,
>>>> +                 unsigned int alignment,
>>>> +                 unsigned long flags)
>>>> +{
>>>> +    struct rb_root *root = &mm->free_trees[tree][tmp];
>>>> +    struct rb_node *rb = root->rb_node;
>>>> +
>>>> +    /* Try to find a block of the requested size that is already 
>>>> aligned */
>>>> +    while (rb) {
>>>> +        struct drm_buddy_block *block = rbtree_get_free_block(rb);
>>>> +        struct rb_node *left_node = rb->rb_left, *right_node = rb- 
>>>> >rb_right;
>>>> +
>>>> +        if (left_node) {
>>>> +            if (drm_buddy_subtree_can_satisfy(left_node, 
>>>> alignment)) {
>>>> +                rb = left_node;
>>>> +                continue;
>>>> +            }
>>>> +        }
>>>> +
>>>> +        if (drm_buddy_block_order(block) >= order &&
>>>> +            __ffs(drm_buddy_block_offset(block)) >= alignment)
>>>> +            return block;
>>>> +
>>>> +        if (right_node) {
>>>> +            if (drm_buddy_subtree_can_satisfy(right_node, 
>>>> alignment)) {
>>>> +                rb = right_node;
>>>> +                continue;
>>>> +            }
>>>> +        }
>>>> +
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    if (tmp < max(order, alignment))
>>>> +        return NULL;
>>>> +
>>>> +    /* If none found, look for a larger block that can satisfy the 
>>>> alignment */
>>>
>>> What is the idea here? IIUC we are looking at some specific order 
>>> and we want some min addr alignment, if the above can't find any 
>>> subtree with suitable max alignment then we should bail and try the 
>>> next order? Why instead do we do the search again with the same 
>>> alignment below?
>>
>> Same as above, I mixed up two concepts. Please review v1 of offset 
>> aligned allocation patch.
>>
>> Regards,
>>
>> Arun.
>>
>>>
>>>> +    rb = root->rb_node;
>>>> +    while (rb) {
>>>> +        struct drm_buddy_block *block = rbtree_get_free_block(rb);
>>>> +        struct rb_node *left_node = rb->rb_left, *right_node = rb- 
>>>> >rb_right;
>>>> +
>>>> +        if (left_node) {
>>>> +            if (drm_buddy_subtree_can_satisfy(left_node, 
>>>> alignment)) {
>>>> +                rb = left_node;
>>>> +                continue;
>>>> +            }
>>>> +        }
>>>> +
>>>> +        if (drm_buddy_block_order(block) >= max(order, alignment) &&
>>>> +            drm_buddy_min_offset_or_size_order(block) >= alignment)
>>>> +            return block;
>>>> +
>>>> +        if (right_node) {
>>>> +            if (drm_buddy_subtree_can_satisfy(right_node, 
>>>> alignment)) {
>>>> +                rb = right_node;
>>>> +                continue;
>>>> +            }
>>>> +        }
>>>> +
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    return NULL;
>>>> +}
>>>> +
>>>>   static struct drm_buddy_block *
>>>>   __alloc_range_bias(struct drm_buddy *mm,
>>>>              u64 start, u64 end,
>>>> @@ -798,6 +901,69 @@ alloc_from_freetree(struct drm_buddy *mm,
>>>>       return ERR_PTR(err);
>>>>   }
>>>>   +static int drm_buddy_offset_aligned_allocation(struct drm_buddy 
>>>> *mm,
>>>> +                           u64 size,
>>>> +                           u64 min_block_size,
>>>> +                           unsigned long flags,
>>>> +                           struct list_head *blocks)
>>>> +{
>>>> +    struct drm_buddy_block *block = NULL;
>>>> +    unsigned int order, tmp, alignment;
>>>> +    enum drm_buddy_free_tree tree;
>>>> +    unsigned long pages;
>>>> +
>>>> +    alignment = ilog2(min_block_size);
>>>> +    pages = size >> ilog2(mm->chunk_size);
>>>> +    order = fls(pages) - 1;
>>>> +
>>>> +    tree = (flags & DRM_BUDDY_CLEAR_ALLOCATION) ?
>>>> +        DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
>>>> +
>>>> +    for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>>> +        block = drm_buddy_find_block_aligned(mm, tree, order,
>>>> +                             tmp, alignment, flags);
>>>> +        if (!block) {
>>>> +            tree = (tree == DRM_BUDDY_CLEAR_TREE) ?
>>>> +                DRM_BUDDY_DIRTY_TREE : DRM_BUDDY_CLEAR_TREE;
>>>> +            block = drm_buddy_find_block_aligned(mm, tree, order,
>>>> +                                 tmp, alignment, flags);
>>>> +        }
>>>> +
>>>> +        if (block)
>>>> +            break;
>>>> +    }
>>>> +
>>>> +    if (!block)
>>>> +        return -ENOSPC;
>>>> +
>>>> +    while (drm_buddy_block_order(block) > order) {
>>>> +        unsigned int child_order = drm_buddy_block_order(block) - 1;
>>>> +        struct drm_buddy_block *left, *right;
>>>> +        int r;
>>>> +
>>>> +        r = split_block(mm, block);
>>>> +        if (r)
>>>> +            return r;
>>>> +
>>>> +        left  = block->left;
>>>> +        right = block->right;
>>>> +
>>>> +        if (child_order >= alignment)
>>>> +            block = right;
>>>> +        else
>>>> +            block = left;
>>>> +    }
>>>> +
>>>> +    mark_allocated(mm, block);
>>>> +    mm->avail -= drm_buddy_block_size(mm, block);
>>>> +    if (drm_buddy_block_is_clear(block))
>>>> +        mm->clear_avail -= drm_buddy_block_size(mm, block);
>>>> +    kmemleak_update_trace(block);
>>>> +    list_add_tail(&block->link, blocks);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static int __alloc_range(struct drm_buddy *mm,
>>>>                struct list_head *dfs,
>>>>                u64 start, u64 size,
>>>> @@ -1147,6 +1313,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy 
>>>> *mm,
>>>>           min_block_size = size;
>>>>       /* Align size value to min_block_size */
>>>>       } else if (!IS_ALIGNED(size, min_block_size)) {
>>>> +        if (min_block_size > size && is_power_of_2(size))
>>>> +            return drm_buddy_offset_aligned_allocation(mm, size,
>>>> +                                   min_block_size,
>>>> +                                   flags,
>>>> +                                   blocks);
>>>>           size = round_up(size, min_block_size);
>>>>       }
>>>>   diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>> index d7891d08f67a..da6a40fb4763 100644
>>>> --- a/include/drm/drm_buddy.h
>>>> +++ b/include/drm/drm_buddy.h
>>>> @@ -11,6 +11,7 @@
>>>>   #include <linux/slab.h>
>>>>   #include <linux/sched.h>
>>>>   #include <linux/rbtree.h>
>>>> +#include <linux/rbtree_augmented.h>
>>>>     #include <drm/drm_print.h>
>>>>   @@ -60,6 +61,8 @@ struct drm_buddy_block {
>>>>       };
>>>>         struct list_head tmp_link;
>>>> +
>>>> +    unsigned int subtree_max_alignment;
>>>>   };
>>>>     /* Order-zero must be at least SZ_4K */
>>>
>
