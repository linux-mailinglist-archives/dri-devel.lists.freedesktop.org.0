Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9A9AF1169
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 12:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FAD10E6C1;
	Wed,  2 Jul 2025 10:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cAJgh0pn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7154F10E6C1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 10:14:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+BAkXseIIaA3m23gayV8/bCXADR6i+JNxEKPjMv5JVhm12x98dl+KLCVGyFgXFBdMWVq2E1XY4hUZrpD8WUJKWmBVx0qQvjMMDwnPJk8cBVB17tvm2qfLEl8qKAh1BAa8Rw0neKyPbpPNWcGFwHiju9DwaCi388ieyo5MDj1QmuF9TkloMB/jCY38j6/9V5YOjI2GqlTKpDHX+Qg/z1jgiJfNYja8j+AQHxjgOEIJmgVMbrjzhVztl8H1+IU7aeAuuZ5enI0E7wJnFenSGM2LWr+3EZtr8KOh8QqccnbTvOaVkEcPWrDAYAnLhchIVtMSHuI9fs88WGqym2W6+xkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwkcPUSKQDPKvWGQWyKE49uZTTdX6EKQfQ84Wd2jURk=;
 b=f7QB4DrgNJ5duIvcSovEMeyaGCDJeXN6NhYi1aZH6FJ0IyJzinzmKAGRd5Hr2eA3iG0naRFBW/oATX7ULZVfHiAjxwQOvLiiDI+1Oz2h2txs08rLbuBtRkHzv0bXxC5e8J99Wm6q148Gd8Iv33IrgXQc+NU4/gsQZ7kXW6TG90ggU4N/RuYi8e/FstntZsZE28d4d9t7bmnbPwZmynbkVCMpIedeMuv4SSjFzvHMd6jx+PhZbik7gH5XUAsdnAFGoIhdM8NmtPgWGmsa2rflLX+H5kStNPigdoXAEbH4oTEDAHijPydPA+CH5TrhGYhwU78aps56TwaKLw7wJFgyhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwkcPUSKQDPKvWGQWyKE49uZTTdX6EKQfQ84Wd2jURk=;
 b=cAJgh0pntrAKKlWHT7Ql2dMvc/1SvkIjejXseFOa9mG0wQ/41H5XLAdaDC2HlTyuLgqv9x9HbScg8FHe31rzxG/J+zwa+6JaOkPbYtdPFALLkI+EQ/5C2uyzwDdUOMybBAKtbITuATuZ4EC2p/5LYxOifNjq6yzqePvzzbvqqcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB9001.namprd12.prod.outlook.com (2603:10b6:806:387::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 10:14:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 10:14:55 +0000
Message-ID: <21bb2afc-4edb-4e45-91fd-9cfb33cac1c7@amd.com>
Date: Wed, 2 Jul 2025 12:14:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/ttm: remove redundant ternaray operation on ret
To: "Colin King (gmail)" <colin.i.king@gmail.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702092541.968932-1-colin.i.king@gmail.com>
 <e3cfe3dd-5edd-ef67-6651-62ecf31cd4ad@crashcourse.ca>
 <4ae91081-a7fe-4937-b416-6b439a4010bc@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4ae91081-a7fe-4937-b416-6b439a4010bc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0324.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b20d510-ac88-4600-c789-08ddb9514a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlozUDFNMVBWbHppRjRyb3hPd1FjU1lscVcvS1Jlc3gyanhwMlVwanFTVGJp?=
 =?utf-8?B?eXMvR0RTWmFlRXd2aUh2a29mUHZSZkxWT0NoNWhnSStSWXROdzdLc3ozTFJD?=
 =?utf-8?B?eTdDSE1tRjZGc0lldDgvRHVlL1dyNGxxR1QyK2R1cEl4eHJlU09IWW5XR2FN?=
 =?utf-8?B?ZWtqRGMrbXlxNWp6alo5T3Vsa09WeFhhcGlQQ2pRQ3JUVjY3c3hVU05jNVpM?=
 =?utf-8?B?eFJuVmpobndkT00xWXNXcUhObkhOallid1YySzNBb3oxeWFBMTRVU0JUQjI3?=
 =?utf-8?B?SWRSQm5sdStFQUpRWWhpYnJrYnZic1M4MDIrcWo2L1FjK2lQUktEMEV3T3FM?=
 =?utf-8?B?ZVBvblZkOXFVcW9PRTF3Vks2QndGOENRM0dKMDk0K1NCaVlYUXp5NGpwYzJs?=
 =?utf-8?B?a2Y2cjgybnMrWTBaZmhlY3NJUW1zZFZ3aVZaT1BodEJkOXdzUEhyRllZeTRE?=
 =?utf-8?B?RWFkU045WVh6bXlTT0dUQ0ZPL3BIbmV0TXIzMEU1d1N0bnloR05SbS9lQUNH?=
 =?utf-8?B?TmlMZ2dRV0NvdGlvcEw4MVMxYjFqZWowR0FzbEVuRjBlb0x3L2J2azBzaSs1?=
 =?utf-8?B?UWR2U3dpdkE3NjBqdEljSWJSODQ0c1h4WktVY0dINEhaWmQzeVZPZWxmNERS?=
 =?utf-8?B?dFM5RnNkK1MzNzRTOFlaNzVaTkNzbzNYTlA1Ym8wV1ByVHd0bHpBR3I0L2xi?=
 =?utf-8?B?Wlc3ZHhBYkprdy82Q3p2RW1ha1dlOXJtTnQyU0hwMlZUMEZmWUphMkpmL0k2?=
 =?utf-8?B?d0J6UVIyOTV4MTZiWXFRams5cWRZSlJnWDFlNGRGcC9KNHFUVDBSVHJXRllj?=
 =?utf-8?B?QTA1OE1zdm9BQ2hyd0EvUE1pdVRGSm1jd0ljNVA0TnJicXpHalgwSzNFRENW?=
 =?utf-8?B?aE91eFlTM2w3ck9zVUFKcFV6NXZ6OVh0cXVTdWM2UFNjbXhOUkFMWUk1SUxl?=
 =?utf-8?B?S211dGo4WmxJL2N3c0NvTlgydytsV0hqclRmTTdIVTd2M2hiQWVXR09oMWZM?=
 =?utf-8?B?bVZtaVJkL1I4NUNsTGx3ME9xb0pIV0VxT09FTS9tWmhNK0k1bUcxdHZ3eSs2?=
 =?utf-8?B?SGlkbjhsenpwRGdvS2hJejFLdmZhdHBOU3VCN3kydVQ0RUYraFBLMU11MFlh?=
 =?utf-8?B?cGdMMVRtNldoajBQSVBIMElvaFhqYXd5Y3RUYTRkZWJoLzRUeTI5K0xBVGNx?=
 =?utf-8?B?U0VrYkR2M1NvUnZzS2ZPQUVRaFZZcnFQR3FqZWlpanh2NFZNTnZrY1VDSEpE?=
 =?utf-8?B?c1ErWEJDNTlybHpTcG11d0NYbDlnRmRkUFY1aSt6KzNxRStwSW9FRFNRcWx0?=
 =?utf-8?B?b0ZBM1J4NkNNa1ZrQmxad08vZVNzT3Y1WW40UkpEN1B3SnpDRmtmbTZhVEk0?=
 =?utf-8?B?MzhVMHk2ZmFaVVhGTjdEL2pmVHBKbTAwMmVvTUprVGJOU2MxQjdkZnB4WW1E?=
 =?utf-8?B?Znh6SGRZLzg1elZ5cHBKcVNjUHk3ZzFJckltWEtCUmdtcjl6czk1K1FkbkY2?=
 =?utf-8?B?cWo2cHN5VnpXSmxiaGN1ampxRklNV0pFMFZNU0gwd0NVMVpFc2JLL0I5WEJX?=
 =?utf-8?B?SW9HWE4xNTJoeVVGV0xxSmZUZTB0ckJPOUVUejVtaGYrbXJtcEtQUzJEWFIx?=
 =?utf-8?B?Z2hpYUNRS2p6OW5adTMyVjJhY0NnUUdJRGdlZDZjZFNTb1BCSzhKb3lUUEN0?=
 =?utf-8?B?NXdleGY4L2hjb3NvbWhLUFNTMlhzdGlrMUxDd0MxcTJjN0s0V2thaHo1L3RG?=
 =?utf-8?B?SHB5b3BkNGVRRHR2WTc1T1ZORUFENW8rUWJsQ0Zldis1VUhvclRrZ1Jtcnh0?=
 =?utf-8?B?dlVmNlJreDEvMEhSSlJhNk9acTJhN1AxODZEK3BrYVg1WjlUTzdaVysrUUcy?=
 =?utf-8?B?d0VtQU9lMURGcTh3aHZQcXQ0U1hzc2s0S01xWUZySFkyR2QwVHQzbGhSN1Vx?=
 =?utf-8?Q?P9C5Pw774PY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGFXNktvVXpMOGEyeXBTZXRaMGRsVm9LRXQ0WHhIbzJzTlJFV3BtUkJDSHJr?=
 =?utf-8?B?TlZVejRNVnBjSmo2enlUdWwwWEsxME9iOXdjR0NZYlB3NFJuTlZzUzB1RlA0?=
 =?utf-8?B?MjRzUWZ0TTJUSnBXaUFvNHRnVExaSFg1dmxtZmZxcGM2aFJ1bFd0bE9laXNQ?=
 =?utf-8?B?MVA0ZnZzL3A3OUVHZWFZczhtTnZaYzVhZDhnTVBmM2FJT1p2bXl5eDBYM1Vj?=
 =?utf-8?B?MEZQVHcxTm0yM2Y5QnBwcHlaTERQRnJJYVZMdjN0NDlzSFBsa3Z1QzVpQXVO?=
 =?utf-8?B?ZFZwbmMxT21Rd0FGMjVHWDZ3Uy82YjZhSHRhVG1xc3BiaTNhU3FJTjBBKys4?=
 =?utf-8?B?N2JqTFYvNzNyZm5OZ2cyMFZVV2ZwQUhPL3ZQcjI5czhzbDBmbWorRUQ2ZUFX?=
 =?utf-8?B?RW93NkJaNXkyZ3ZsN0w5N2ZwOFNGYnhjY3VIdkc5M29pTWhQZkR6UVo3Nk0w?=
 =?utf-8?B?T3lxUXRRTFcwc2JNWVJhVWxBZzBoNm9TWWZlb0xMRkV2OGJhZ1BqS1pPYjdv?=
 =?utf-8?B?UEtzR0lXQjdWcmNCUnptdnl2SHdtcnQ3STV3aUFOcERkQm5YMEk2cXY1c3NJ?=
 =?utf-8?B?citiMXc2c3FVTjA3OWhTMEdaL29JdFJzSUx2SW16YkE5WGI5clhxSDYyZU4v?=
 =?utf-8?B?V2x2bHlNZTdPRUw4UjJoWUk3MVkvWitNN0JIUlh4aDBiRjlWMDFCMEk5Yi9X?=
 =?utf-8?B?K21ZcE52eGFmVEk5OERpVVVjNU5hUzJEcWh0Z1hpQkpWMzVUL1B4K2hyK2pP?=
 =?utf-8?B?cDgybFhGSWJHQm8yckIxLzBValo1dGRaOGRnSENMc2JveXVORU04N3NEcjQ4?=
 =?utf-8?B?WE5PNDhYRTlSQkg0U21CQmdJS21sSDNzMlBudHFTRnF1ZUdtZTJPdjhQc2Vx?=
 =?utf-8?B?TlU5OCtuZ09nOUxTYjJjS1ZndUZCVlM5MU53VGVkOUFHYVhRRGtZamVsV1Bl?=
 =?utf-8?B?cnIrZE1uUksrMEwzalBnQ09MWWs4V1hPTDUxakMzb0dnUjRoSHpEOGFaTFNs?=
 =?utf-8?B?aldrZzhkZGxtempGaDFkV1h4enZzY3Y1SktrS05TNzZPWmlWZDlpUUVTVE9P?=
 =?utf-8?B?MUdYRkJUOEZqOEdmdVozRU5SaEpFOUM2SENraXh2VTFKOVY1V3lLaFNGUTNl?=
 =?utf-8?B?STRPNyt4dGhwcUUzakdDT3RPY2ZITks0aTVwbDhxMjB6MGI2UlEwRkhoRDNE?=
 =?utf-8?B?VG9EZmRWN3NMM2ROWHd3b2QzRVBMaGtVcFVsMHNBZFRvOVlKdlNXdVQ5UWpC?=
 =?utf-8?B?ankrWW1FcEFKQldIbmJhNUd1VkNwV1VaelhsQ1JUUVpxT2d5S0Z4NVFiZWlz?=
 =?utf-8?B?WE5TZ05Fb3k3Q0hjVXVUUkh0cC9pTGpkNERmUUowZjIxM0hlWDZVZmp6c0FT?=
 =?utf-8?B?SlBTL2JJQnZ1R0xhNWhieURNMFFGZklyY1ZMaytQRmJnTDlzMitlNUV6SnVv?=
 =?utf-8?B?TVZsNWc4elJ1SXozV1pVZUNkT3R4eDlKNVZ2cVA2cGlqYkxJekYxbWdBYkVH?=
 =?utf-8?B?czFvelJ2YUpocTIwZ0ZiQk80OE5XMUkzS0VoNFhKSnU2akVLdkxsNUkyTS9o?=
 =?utf-8?B?NlQzK2s4WFFNalR2SUlxMXBvZUNpWk9haVRqWWM1VFNBQlY5bFduMFdEYW5T?=
 =?utf-8?B?LzZ4aUd6RTJGVUw2K2p5Q0tiZ0NodTJPOFZwNnJWQkl0c2E0SkNsS2lKRFB4?=
 =?utf-8?B?KzNoMUJOQmdhTks1TlZjMitONG9BMzl4NGx1SVYyeWwxakxhK29WbXd0dFdZ?=
 =?utf-8?B?MFNyS0l5RXozK3BsTTBMZGxWSnVFcnNEUHJhWDlURTRTZHoreFN4bXloUG9X?=
 =?utf-8?B?MUY4N0RLMTNKMWJaYU9rZGtCWCtjOFdDVjNLZEVHSDMvSVVIRUxyZ2RNOUNz?=
 =?utf-8?B?eG5kMGNqbGp4ZUMxeVRhWHRtbCtPTXcwVmtiRzRwREh2VDhRcmZSSml3cThz?=
 =?utf-8?B?SXllb0RNa3dGbXMzT2ppSDdVK2VaL3ZDVWJVampzajA2TEJSa3dkemdTQnhZ?=
 =?utf-8?B?UnFWUDFrSWEwcjlGZ1hVTWM0ZVN0eGtObjVjd1RnUjZZekxGbVFPT3plc284?=
 =?utf-8?B?ZW5IWDRkZXBxMFlVM2lZNkhuYk5yc3R1akJRb3M0Z2RSd3ZXU0gvZU4vTmZH?=
 =?utf-8?Q?htug=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b20d510-ac88-4600-c789-08ddb9514a6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 10:14:55.1158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPxlMZyAOlgpY44OQIequ4ss8O5VGXWk7kQCnX3s4KbMGunWpgUGgpE0fD3M8D7u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9001
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

On 02.07.25 11:43, Colin King (gmail) wrote:
> On 02/07/2025 10:42, Robert P. J. Day wrote:
>>
>>    subject has typo, should be "ternary"
>>
>> rday
> 
> Good catch. Can that be fixed up before applying the patch rather than me sending a V2?

Thomas or me can take care of that before pushing.

Christian.

> 
> Colin

