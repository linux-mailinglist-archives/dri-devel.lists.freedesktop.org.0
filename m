Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE5398D38F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 14:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943A410E1CC;
	Wed,  2 Oct 2024 12:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VCYqg4dw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D5110E1CC;
 Wed,  2 Oct 2024 12:45:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohsHQEmXYzrmpPAsW/sjDqQtY9o5Ba6BlHllEOh2O2+F26GHokHadcZJ8YWOjU0EGD6ornnVEUul5Z5uyl16UJr5pZc9NpFAoWZ97aRYwHgwrg8jU5Kr89GXxXmKmFN32olmSQAwCYMAV9VS8fdJONZbgPZAUjHcgeqyYrrsS9bBA9nDRIjazaDEu145v/+Fa3bgLBYY/wD6xsK6F208b3SfuS4WRNXoF8erPp+f06SEqqmpxIHXKVOqWqyj9BukNMu9E+lBUXwOFIGKsZG5Iv+KY7zBqBJa25oJo4GNcXUK0HAp/wzTY+YiaTYLg8BWX1BoH6V7ZNSr2DnzIHk7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NX4JSFnPhhXKbmBug2agCDKZU/QHR93zVusOyTf3t04=;
 b=CTO7UBNLPnfa8ACydBPFsUc9Ii1jaWoU2bpIcdJAZOhHyqTCJwRCh+U6RK4ONfif1VTFtczbGW5iGOz7L70Ixz6104/s7JIllNoLygNWJ2mIrGrn8Kx6kU4bxyvtV3ppB7pR7QusvH6QQs902XCRJfpWsAGo3o5Z8+rPHqjwgGo8xB//TAm9A+FpjA+EZUGTipBEJ46aQi3Ui6iyB6OIt2Uir4ZLR6drEH9XWNcJ1CdAdp94CvmC64x1FYBM0oQAVW1fZuGFyKrGPvvaaIy0CB68EMOOJwtB/E2IwmFePvY6HDQtgHcZyYb0TMSLq//4gGp8npSEOPcaiVzFwcbMsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NX4JSFnPhhXKbmBug2agCDKZU/QHR93zVusOyTf3t04=;
 b=VCYqg4dwzIGOCJQmV6/WxmGzd94xRTY76gVyDDPXPw+lNUkdXSE6EHwTSCMlnb/V44n0KXTwP1Rj8xaILOlUxEpwsF0JT5gVXaZ0X95XGyTmg/kJEzUUGu/1Fgo9o6fTs0RJSfJHX82mm93CTBPUPGR8ajh9vdzPkjciPH0qPJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Wed, 2 Oct
 2024 12:45:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 12:45:53 +0000
Message-ID: <6c0387d0-1979-48ae-b9ff-49e00a459438@amd.com>
Date: Wed, 2 Oct 2024 14:45:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/ttm: Change ttm_device_init to use a struct
 instead of multiple bools
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Zack Rusin <zack.rusin@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Sui Jingfeng
 <suijingfeng@loongson.cn>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20241002122422.287276-1-thomas.hellstrom@linux.intel.com>
 <20241002122422.287276-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241002122422.287276-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b5202e-a846-476b-d944-08dce2e02696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0V6VWpuRkdVemd3MHZOL1FYMHdmd0xyRVppYi9SeXFyc1Y0UG1mM2hFdEo1?=
 =?utf-8?B?NlJOSGV1RHhrbjA2Y3lTdytpVW1GMjdNOUJUOExLWFJnbEFMeGhrT21yTjhu?=
 =?utf-8?B?SnFTMmFJWVBUakI0d2JIR2dYa05FdWtKOWFuZ3VkLzNwU2tPRkZ0UDJ6ekRi?=
 =?utf-8?B?RE5OS3VYMkZrV1lXNHVwYU1yTEloTWRQRTJzVmNaQTNsalA1U1NmaFUwdWF1?=
 =?utf-8?B?TUhMU2VXK043cGxFeng3VU5kRzlyeFFaSW1TWVZvdTd2NHpWdHRWMXpDWnBu?=
 =?utf-8?B?YjIvWjRRa1VTSU5iNkl5a0tEUlZvOEZ5Q0NMVjVQSm5Od2ZjUHVxOW45dEdK?=
 =?utf-8?B?c1VMSVNUcmRwZktEUC9JRWtic2NlZ0pKL3NCZWcvMW5SbkI0U2tPVjM3dnpR?=
 =?utf-8?B?T0hKUUpCcS9lQjduWFZmNzVnaU93Z2o2ZnFnbE5BQnBHUExzQkNCOWVPY1gv?=
 =?utf-8?B?c0ZEY2dablVXOTJwQmZYUmZLT3Q5aDhUQ3VpSnh4NzZGZGtNb0lTSE1CK1JM?=
 =?utf-8?B?VDFKQ1JTR25XdyttRW9wUUY5NE56OWw3NHZMU3ptb2s0MXVNbllpQmNBTiti?=
 =?utf-8?B?bXNEbUh4eVhVQys5SVgxU0tpV09oTTZmSnpUQVpadXk1Ym5XQWU4ZEVLcUxD?=
 =?utf-8?B?T3NDb2NVQ2xpVzRQeDFQOG5vdFFLelA1Ujdza0dMUXBEMkpEWG1wZnlmb3dC?=
 =?utf-8?B?aGZHUTFEcnN1bDlFK1hLemxPUVBoSzlRSFVzQ0YzaHU4ajBMcGovZGZGNW9x?=
 =?utf-8?B?UTVJcW9jVEVnUTEvRVYrYnQzWjgwL2VlOG1tRVFQaXZ2NGdIVHI4UjhXVmdo?=
 =?utf-8?B?eEpVYTNSWExrN3RqM1oyUHVETlR4aWswY0ZmVDVtc0M1M1pzVzN6U29HWERo?=
 =?utf-8?B?WTRQRGs5bVREOHREa3FsTmVjV016c29SNGFoWDF6S3R5TWYrbGs2K0ZuaW1D?=
 =?utf-8?B?enRubDJvL2l3d2hIOFQ2N21Na2lobm1oc0pMSEdQU3YrODk1NlFrM3JRTUVn?=
 =?utf-8?B?c25EUkNsbUloR2NUYWwzNkxlVGQ5MjdvWjZURUdUVVZoUmpZWFpTSzE3akxF?=
 =?utf-8?B?dnc4SEZVZGFPVC9zS2kxUVczU1Z0SVVWNklwMU9MV05mcVVsaXVwM0Rycmxa?=
 =?utf-8?B?bUVPUEtWS3JzSEVsMmVLbU01d05DeFdZTlV3SDVjT1RMSFhnL1BRUVAxQ2VS?=
 =?utf-8?B?MXZPRG5Ca3FlRHdiaG9wUWZmR0lNenZ0Z3JtVFd3bEhxYnRKZm95Z2FNNVE3?=
 =?utf-8?B?WStGQXEwTUl1L2gya2wrbE4xc0tBa1lwdi92ckFxQzFLVGZURktWTFR4bDJC?=
 =?utf-8?B?NGhwZDJGZlkxZjlKaXpDYXVESkE4dko5SWZtRE9JNklUZDFrQ1JCTk0vMU5j?=
 =?utf-8?B?M1Q0bE5jWFN1WnJpMzVVVDRRMWxmQldEMGlIMXYrdmZwck9wNkNQV1ByNkZB?=
 =?utf-8?B?Um1hR3NQamVNb0NlZllubVpsNWIrRXIzVFRCUTVyZ0NONEE4YlE4ME1CZldD?=
 =?utf-8?B?bFNsaDBsZ0l4VjNabnVheU5IN3JUVHF4TGRWMW5lZk9xVm9ZZ1gxZXFwbDZs?=
 =?utf-8?B?ZWVJYUk3cFZDUGhkYnZONHk5RktHT2FHcUtSTndFKytrS0h0WlBoT1lLdERk?=
 =?utf-8?B?dHVJMFVuaGtCV0FDYlBsamxxaC9CNVZzT1hubk55RDhWeGlCTHpaM2ZHNHY3?=
 =?utf-8?B?OTRCcHNzd2RhYVZRdE5qUEVmRXM0cHNiTWxiTEwvWlFuRWlSWTRXKytRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWtwQmt4VDNtRkpLUm8wMXRBM1VIa2ZRRjdLc3QzZHZnWWk0K0MxcjllaVds?=
 =?utf-8?B?MUFudVNzMEZsei9mc2lzTyt2K2RiWjhwREs4WGlEU2pmb2U1T1l5TXRXZVJO?=
 =?utf-8?B?L3lrcmRTUlVOdHIxUFlsa3VESWNsb1VXQnh0SmlQOWN2NVhzVFdFN1JTSk1B?=
 =?utf-8?B?cDV6ZnZuUzRuOHFGaVl0czJ2dzN4bWNlMEJMTndaNDlDMHQwOTJWZEN2MXYz?=
 =?utf-8?B?OExJdW1tY1N2OXpYQ2dlOTIrMmVUZDE2TUdtVytNaWYyY29wd3BIZ0NxQkdU?=
 =?utf-8?B?amxrd3NJSDdYa1JSeUlTaUljb2tndWFTRmFHTVNUUTdxNCtyUjRHTE90MmpN?=
 =?utf-8?B?UlkzclJONy93cGZVS01BZHFtdDdEYUtsajJPMUkvR3EyOFQvSDVWNU5IKzJH?=
 =?utf-8?B?cmNLSEdXMk95QTE2dDJuMGZrbldQSkNNUHYydEZUOC84cEJIMldFcnhramc0?=
 =?utf-8?B?ZmZ1SVF0WVFYY0hnKzZZVGpjSjM0NnFEMlQxQWF1VUU0aWM4eW9SMHQwUHEw?=
 =?utf-8?B?WTBnMDdqN3VyallnbTJyVGs2djhwV0h4RGlsZUhXQ3NBVUFUcFJQMnpPSUhT?=
 =?utf-8?B?TTlUZit1MnVOSXROdWtjUDY1YW9ONzRkRmF1RkJGUHZBMkNEMXFvWWRxVXZ4?=
 =?utf-8?B?KzNsa29kQ2pBZmNJalRUY0RaeEtrYVlNMitCQjBOWmJTUFNqcFVvRGJrQnB1?=
 =?utf-8?B?L0xOVXZhUUR0aHNvT3JZUFN4WWZyT2JpN21xeFh0M1hpRFpPUG5YWkJmS0JY?=
 =?utf-8?B?VGN2K0tPRmRVUDZVQzlnam9pd1hQb251MkRHU0s1RGVKazNkUGtjdnI3WVRv?=
 =?utf-8?B?d2xqQXh5eW9TSC9FMlpIK2VhK1YxNHJtL3NSSktmR2pHcUNxTml6eHhKb1pY?=
 =?utf-8?B?cWxsZjZKYTk0RFdHaWY3bENFZlBwQ3FPdGx1NmZ3cC9RUXlubWFobGQrM3Ew?=
 =?utf-8?B?ak5CVHBvN0lMeHZaS0JhL2ZLNmUxUEpOcXRoQjJHMkhvM0ozTXhOMWNQSHQ3?=
 =?utf-8?B?bEE3MVBta21YQXdKNmN1eGpTMDNmUHNtekY2TEZ5OG1QSWxoWXBtdERZSmdG?=
 =?utf-8?B?UHdCQTBONUlrclNpTEQ3YUU2YXlsNFRaMU4yWUMwSUI4Y0lheHFPUzBQQWhV?=
 =?utf-8?B?OUhlaG1INE1iQUx3Z0o5MzhEak9MU2cxanFza05DcGx6U2ZUUVFtT2xLamNK?=
 =?utf-8?B?SVlPRmZ6aVpwT3ZIeVNYZDA0eCtLNytISTdWdmVDY2VyMEJrLy8rMFdkUVVv?=
 =?utf-8?B?VnNXM24xVm5WVVVRTlcvcytmeXJuZ3hwRzFlR0s5SEtHbWxsWXd1bmpidFZX?=
 =?utf-8?B?QmRuVGZRdExHRFk1QkxwRDJ0K0dBS2w0ZHJjb2U1VVo4ZTIzcUJSTkFwWmNB?=
 =?utf-8?B?NDNGNk1XbkJCL3dwRWUxUkcwc0FrR20wMS9QaXhiTm9HdjVYSGZFUEtzekFY?=
 =?utf-8?B?ZSszNjJQYXpzbVdSWEorWldKd2xJQVk5UFo3Q1I0dWdPSldpSjlBeXo2RXhE?=
 =?utf-8?B?THU0ako4NUJYZDlTbWIrbG5INE1teWJodDJVdFEzKzh6cGxnMzYxa2NDc2tK?=
 =?utf-8?B?SUtOeHBTZDJEUG0rc1RDMGR4c04rTjNsMFpWTTJYTGw4Smc5Mk5ueTZiYzF2?=
 =?utf-8?B?M1BIQlpUUGNXVEZTOW1YekhEbG9nMFhsRERZTll3cGlwUVV4aXBQQU1ZVGFR?=
 =?utf-8?B?ellKUUhnZlFlRkIwS2g5NytzOFc2ZW1mbUZoNS81MFpzVDNiaWswc1dNY1Jz?=
 =?utf-8?B?UE84TytHNW90TjdDUGJFUXpVY2RrWUdRNnZDUmJ2OW1yMUNBOHJGY0hGcWRX?=
 =?utf-8?B?ZVZoa0VmMkdxVVJmRm5rV21VbmdBNTlTYXZRYWw1cWN0MjN4Z3d1WWpYQlBQ?=
 =?utf-8?B?L1piVFVSYXNrTmdoNFFzbkxhQ09TeEdJamFtbVlsbzhTNmdEZVBCK2VUS2Rp?=
 =?utf-8?B?N2RQMFZacWlpKzdLYXhZcENBMy93cXJvSDRuMUxhR3RXcUEveVJLcTBlN1lq?=
 =?utf-8?B?dE0xTFh1dEdXaVFtdEszMlJLeERsbWVhOTlBdEdOWmYvK0pyNG5aNWdTZG1G?=
 =?utf-8?B?MnNxbGdVNitZdUptL01hUENEajB4WUloeTlsUHFobXlvS2UrRG5Ia3Y4dmZt?=
 =?utf-8?Q?qcyO+qUp1SiGNcS+j3qHvqakd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b5202e-a846-476b-d944-08dce2e02696
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 12:45:53.0504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8hJXTBaS1WPcUlNH33G7VuExJxas4HehKTBi5QcC9VWecAD/d14w2UVybCNXiII
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961
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

Am 02.10.24 um 14:24 schrieb Thomas Hellström:
> The ttm_device_init funcition uses multiple bool arguments. That means
> readability in the caller becomes poor, and all callers need to change if
> yet another bool is added.
>
> Instead use a struct with multiple single-bit flags. This addresses both
> problems. Prefer it over using defines or enums with explicit bit shifts,
> since converting to and from these bit values uses logical operations or
> tests which are implicit with the struct usage, and ofc type-checking.

Ok, that style is new to me. I've mostly seen defined parameter flags in 
the kernel.

It obviously has some advantages, but do we have any precedence in the 
kernel for using that approach?

Regards,
Christian.

>
> This is in preparation of adding yet another bool flag parameter to the
> function.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: spice-devel@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: <bcm-kernel-feedback-list@broadcom.com>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: <intel-xe@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  6 ++++--
>   drivers/gpu/drm/drm_gem_vram_helper.c         |  7 ++++---
>   drivers/gpu/drm/i915/intel_region_ttm.c       |  3 ++-
>   drivers/gpu/drm/loongson/lsdc_ttm.c           |  5 ++++-
>   drivers/gpu/drm/nouveau/nouveau_ttm.c         |  7 +++++--
>   drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c           |  6 ++++--
>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 16 +++++++--------
>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  3 ++-
>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 16 ++++++++-------
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 20 ++++++++-----------
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  6 ++----
>   drivers/gpu/drm/ttm/ttm_device.c              |  7 +++----
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 ++--
>   drivers/gpu/drm/xe/xe_device.c                |  3 ++-
>   include/drm/ttm/ttm_device.h                  | 12 ++++++++++-
>   16 files changed, 71 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 74adb983ab03..e43635ac54fd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1853,8 +1853,10 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>   	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
>   			       adev_to_drm(adev)->anon_inode->i_mapping,
>   			       adev_to_drm(adev)->vma_offset_manager,
> -			       adev->need_swiotlb,
> -			       dma_addressing_limited(adev->dev));
> +			       (struct ttm_device_init_flags){
> +				       .use_dma_alloc = adev->need_swiotlb,
> +				       .use_dma32 = dma_addressing_limited(adev->dev)
> +			       });
>   	if (r) {
>   		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
>   		return r;
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 22b1fe9c03b8..7c3165b00378 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -931,9 +931,10 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
>   	vmm->vram_size = vram_size;
>   
>   	ret = ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
> -				 dev->anon_inode->i_mapping,
> -				 dev->vma_offset_manager,
> -				 false, true);
> +			      dev->anon_inode->i_mapping,
> +			      dev->vma_offset_manager,
> +			      (struct ttm_device_init_flags)
> +			      {.use_dma32 = true});
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
> index 04525d92bec5..db34da63814c 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -34,7 +34,8 @@ int intel_region_ttm_device_init(struct drm_i915_private *dev_priv)
>   
>   	return ttm_device_init(&dev_priv->bdev, i915_ttm_driver(),
>   			       drm->dev, drm->anon_inode->i_mapping,
> -			       drm->vma_offset_manager, false, false);
> +			       drm->vma_offset_manager,
> +			       (struct ttm_device_init_flags){});
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
> index 2e42c6970c9f..c684f1636f3f 100644
> --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
> +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
> @@ -544,7 +544,10 @@ int lsdc_ttm_init(struct lsdc_device *ldev)
>   
>   	ret = ttm_device_init(&ldev->bdev, &lsdc_bo_driver, ddev->dev,
>   			      ddev->anon_inode->i_mapping,
> -			      ddev->vma_offset_manager, false, true);
> +			      ddev->vma_offset_manager,
> +			      (struct ttm_device_init_flags){
> +				      .use_dma32 = true
> +			      });
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index e244927eb5d4..5f89d2b40425 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -302,8 +302,11 @@ nouveau_ttm_init(struct nouveau_drm *drm)
>   	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
>   				  dev->anon_inode->i_mapping,
>   				  dev->vma_offset_manager,
> -				  drm_need_swiotlb(drm->client.mmu.dmabits),
> -				  drm->client.mmu.dmabits <= 32);
> +				  (struct ttm_device_init_flags){
> +					  .use_dma_alloc =
> +					  drm_need_swiotlb(drm->client.mmu.dmabits),
> +					  .use_dma32 = (drm->client.mmu.dmabits <= 32)
> +				  });
>   	if (ret) {
>   		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
>   		return ret;
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 765a144cea14..ced4c60c4650 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -196,7 +196,7 @@ int qxl_ttm_init(struct qxl_device *qdev)
>   	r = ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
>   			    qdev->ddev.anon_inode->i_mapping,
>   			    qdev->ddev.vma_offset_manager,
> -			    false, false);
> +			    (struct ttm_device_init_flags){});
>   	if (r) {
>   		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
>   		return r;
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 69d0c12fa419..2915473e4956 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -684,8 +684,10 @@ int radeon_ttm_init(struct radeon_device *rdev)
>   	r = ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->dev,
>   			       rdev_to_drm(rdev)->anon_inode->i_mapping,
>   			       rdev_to_drm(rdev)->vma_offset_manager,
> -			       rdev->need_swiotlb,
> -			       dma_addressing_limited(&rdev->pdev->dev));
> +			       (struct ttm_device_init_flags){
> +					.use_dma_alloc = rdev->need_swiotlb,
> +					.use_dma32 = dma_addressing_limited(&rdev->pdev->dev)
> +				});
>   	if (r) {
>   		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
>   		return r;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index f0a7eb62116c..8a2ab90c6e8f 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -251,7 +251,7 @@ static void ttm_bo_unreserve_basic(struct kunit *test)
>   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>   
> -	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   	priv->ttm_dev = ttm_dev;
>   
> @@ -290,7 +290,7 @@ static void ttm_bo_unreserve_pinned(struct kunit *test)
>   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>   
> -	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   	priv->ttm_dev = ttm_dev;
>   
> @@ -342,7 +342,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
>   	resv = kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>   
> -	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   	priv->ttm_dev = ttm_dev;
>   
> @@ -394,7 +394,7 @@ static void ttm_bo_put_basic(struct kunit *test)
>   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>   
> -	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   	priv->ttm_dev = ttm_dev;
>   
> @@ -437,7 +437,7 @@ static void ttm_bo_put_shared_resv(struct kunit *test)
>   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>   
> -	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   	priv->ttm_dev = ttm_dev;
>   
> @@ -477,7 +477,7 @@ static void ttm_bo_pin_basic(struct kunit *test)
>   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>   
> -	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   	priv->ttm_dev = ttm_dev;
>   
> @@ -512,7 +512,7 @@ static void ttm_bo_pin_unpin_resource(struct kunit *test)
>   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>   
> -	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   	priv->ttm_dev = ttm_dev;
>   
> @@ -563,7 +563,7 @@ static void ttm_bo_multiple_pin_one_unpin(struct kunit *test)
>   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>   
> -	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   	priv->ttm_dev = ttm_dev;
>   
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 1adf18481ea0..c69b9707e6d2 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -1044,7 +1044,8 @@ static void ttm_bo_validate_busy_domain_evict(struct kunit *test)
>   	 */
>   	ttm_device_fini(priv->ttm_dev);
>   
> -	err = ttm_device_kunit_init_bad_evict(test->priv, priv->ttm_dev, false, false);
> +	err = ttm_device_kunit_init_bad_evict(test->priv, priv->ttm_dev,
> +					      (struct ttm_device_init_flags){});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   
>   	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> index 1621903818e5..9415c7b76e3b 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> @@ -25,7 +25,7 @@ static void ttm_device_init_basic(struct kunit *test)
>   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>   
> -	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   
>   	KUNIT_EXPECT_PTR_EQ(test, ttm_dev->funcs, &ttm_dev_funcs);
> @@ -55,7 +55,8 @@ static void ttm_device_init_multiple(struct kunit *test)
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_devs);
>   
>   	for (i = 0; i < num_dev; i++) {
> -		err = ttm_device_kunit_init(priv, &ttm_devs[i], false, false);
> +		err = ttm_device_kunit_init(priv, &ttm_devs[i],
> +					    (struct ttm_device_init_flags){});
>   		KUNIT_ASSERT_EQ(test, err, 0);
>   
>   		KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].dev_mapping,
> @@ -81,7 +82,7 @@ static void ttm_device_fini_basic(struct kunit *test)
>   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>   
> -	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   
>   	man = ttm_manager_type(ttm_dev, TTM_PL_SYSTEM);
> @@ -109,7 +110,7 @@ static void ttm_device_init_no_vma_man(struct kunit *test)
>   	vma_man = drm->vma_offset_manager;
>   	drm->vma_offset_manager = NULL;
>   
> -	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
>   	KUNIT_EXPECT_EQ(test, err, -EINVAL);
>   
>   	/* Bring the manager back for a graceful cleanup */
> @@ -162,9 +163,10 @@ static void ttm_device_init_pools(struct kunit *test)
>   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>   
> -	err = ttm_device_kunit_init(priv, ttm_dev,
> -				    params->use_dma_alloc,
> -				    params->use_dma32);
> +	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){
> +			.use_dma_alloc = params->use_dma_alloc,
> +			.use_dma32 = params->use_dma32
> +		});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   
>   	pool = &ttm_dev->pool;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index b91c13f46225..24706fabb1c9 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -114,8 +114,7 @@ static void bad_evict_flags(struct ttm_buffer_object *bo,
>   
>   static int ttm_device_kunit_init_with_funcs(struct ttm_test_devices *priv,
>   					    struct ttm_device *ttm,
> -					    bool use_dma_alloc,
> -					    bool use_dma32,
> +					    const struct ttm_device_init_flags flags,
>   					    struct ttm_device_funcs *funcs)
>   {
>   	struct drm_device *drm = priv->drm;
> @@ -124,7 +123,7 @@ static int ttm_device_kunit_init_with_funcs(struct ttm_test_devices *priv,
>   	err = ttm_device_init(ttm, funcs, drm->dev,
>   			      drm->anon_inode->i_mapping,
>   			      drm->vma_offset_manager,
> -			      use_dma_alloc, use_dma32);
> +			      flags);
>   
>   	return err;
>   }
> @@ -140,11 +139,9 @@ EXPORT_SYMBOL_GPL(ttm_dev_funcs);
>   
>   int ttm_device_kunit_init(struct ttm_test_devices *priv,
>   			  struct ttm_device *ttm,
> -			  bool use_dma_alloc,
> -			  bool use_dma32)
> +			  const struct ttm_device_init_flags flags)
>   {
> -	return ttm_device_kunit_init_with_funcs(priv, ttm, use_dma_alloc,
> -						use_dma32, &ttm_dev_funcs);
> +	return ttm_device_kunit_init_with_funcs(priv, ttm, flags, &ttm_dev_funcs);
>   }
>   EXPORT_SYMBOL_GPL(ttm_device_kunit_init);
>   
> @@ -159,11 +156,10 @@ EXPORT_SYMBOL_GPL(ttm_dev_funcs_bad_evict);
>   
>   int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
>   				    struct ttm_device *ttm,
> -				    bool use_dma_alloc,
> -				    bool use_dma32)
> +				    const struct ttm_device_init_flags flags)
>   {
> -	return ttm_device_kunit_init_with_funcs(priv, ttm, use_dma_alloc,
> -						use_dma32, &ttm_dev_funcs_bad_evict);
> +	return ttm_device_kunit_init_with_funcs(priv, ttm, flags,
> +						&ttm_dev_funcs_bad_evict);
>   }
>   EXPORT_SYMBOL_GPL(ttm_device_kunit_init_bad_evict);
>   
> @@ -249,7 +245,7 @@ struct ttm_test_devices *ttm_test_devices_all(struct kunit *test)
>   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>   
> -	err = ttm_device_kunit_init(devs, ttm_dev, false, false);
> +	err = ttm_device_kunit_init(devs, ttm_dev, (struct ttm_device_init_flags){});
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   
>   	devs->ttm_dev = ttm_dev;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index c7da23232ffa..fbf0d3984f25 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -28,12 +28,10 @@ struct ttm_test_devices {
>   /* Building blocks for test-specific init functions */
>   int ttm_device_kunit_init(struct ttm_test_devices *priv,
>   			  struct ttm_device *ttm,
> -			  bool use_dma_alloc,
> -			  bool use_dma32);
> +			  const struct ttm_device_init_flags flags);
>   int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
>   				    struct ttm_device *ttm,
> -				    bool use_dma_alloc,
> -				    bool use_dma32);
> +				    const struct ttm_device_init_flags flags);
>   struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>   					    struct ttm_test_devices *devs,
>   					    size_t size,
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index e7cc4954c1bc..0c85d10e5e0b 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -174,8 +174,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
>    * @dev: The core kernel device pointer for DMA mappings and allocations.
>    * @mapping: The address space to use for this bo.
>    * @vma_manager: A pointer to a vma manager.
> - * @use_dma_alloc: If coherent DMA allocation API should be used.
> - * @use_dma32: If we should use GFP_DMA32 for device memory allocations.
> + * @flags: Flags governing the device behaviour.
>    *
>    * Initializes a struct ttm_device:
>    * Returns:
> @@ -184,7 +183,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
>   int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
>   		    struct device *dev, struct address_space *mapping,
>   		    struct drm_vma_offset_manager *vma_manager,
> -		    bool use_dma_alloc, bool use_dma32)
> +		    const struct ttm_device_init_flags flags)
>   {
>   	struct ttm_global *glob = &ttm_glob;
>   	int ret, nid;
> @@ -212,7 +211,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
>   	else
>   		nid = NUMA_NO_NODE;
>   
> -	ttm_pool_init(&bdev->pool, dev, nid, use_dma_alloc, use_dma32);
> +	ttm_pool_init(&bdev->pool, dev, nid, flags.use_dma_alloc, flags.use_dma32);
>   
>   	bdev->vma_manager = vma_manager;
>   	spin_lock_init(&bdev->lru_lock);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index cf7a89d002e4..7ff7e5d7a9f3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1049,8 +1049,8 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
>   			      dev_priv->drm.dev,
>   			      dev_priv->drm.anon_inode->i_mapping,
>   			      dev_priv->drm.vma_offset_manager,
> -			      dev_priv->map_mode == vmw_dma_alloc_coherent,
> -			      false);
> +			      (struct ttm_device_init_flags)
> +			      {.use_dma_alloc = (dev_priv->map_mode == vmw_dma_alloc_coherent)});
>   	if (unlikely(ret != 0)) {
>   		drm_err(&dev_priv->drm,
>   			"Failed initializing TTM buffer object driver.\n");
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 09a7ad830e69..f9317f56ff9c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -320,7 +320,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   
>   	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>   			      xe->drm.anon_inode->i_mapping,
> -			      xe->drm.vma_offset_manager, false, false);
> +			      xe->drm.vma_offset_manager,
> +			      (struct ttm_device_init_flags){});
>   	if (WARN_ON(err))
>   		goto err;
>   
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index c22f30535c84..1534bd946c78 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -287,10 +287,20 @@ static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
>   	bdev->man_drv[type] = manager;
>   }
>   
> +/**
> + * struct ttm_device_init_flags - Flags for ttm device creation
> + */
> +struct ttm_device_init_flags {
> +	/** @use_dma_alloc: Whether coherent DMA allocation API should be used. */
> +	u32 use_dma_alloc : 1;
> +	/** @use_dma32: If we should use GFP_DMA32 for device memory allocations. */
> +	u32 use_dma32 : 1;
> +};
> +
>   int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
>   		    struct device *dev, struct address_space *mapping,
>   		    struct drm_vma_offset_manager *vma_manager,
> -		    bool use_dma_alloc, bool use_dma32);
> +		    const struct ttm_device_init_flags flags);
>   void ttm_device_fini(struct ttm_device *bdev);
>   void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
>   

