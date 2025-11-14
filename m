Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B5DC5D3FD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 14:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA15E10EA68;
	Fri, 14 Nov 2025 13:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3zEibdlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013048.outbound.protection.outlook.com
 [40.93.201.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1633F10EA67;
 Fri, 14 Nov 2025 13:07:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/zvKJozlZ6LCk1JDqE0JQHKgj4oJ7xvplmdO7ecY4Ggq1/t6KnhEAWO5ncrKl8fFyzvcVyWPSO6GArVdubpY/FveFkvd3AVAC9qqhZwAWR3mc7Ebj4uKDQgUql1NHtVS7iMZNu2gSkQP3l3Gf4m/M/jUxq4C2jdD4rWrh/Yo1OHGE95EbYLg+itvp1PNYlqeOKBsAEkaXfrnFb0wS2TlIHKDACzD37aAVNWhEN9ZP8WWnAoNwD1N741y0/Y4IRxWG7+C6zoA9r0jeHUTFGHys8uGtXuWIhZXfmrrfjAYpQ8sg1N7U+u79Ld/8YIrGA/u75hswhpzDCd9EvkVnFz4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKb1jXkSEPeloYKO/ENk6pR6bEapBfxdCaBCm2OXrdI=;
 b=lNw2aRCUDuc7SkUQH8jotp43Uk7mCyf+j2CUDzbMWUPHI9S4+6xwIwmSnKb/oLpUfSXrrqlJ8wlc+FCXzMlR+LCDnZEGDMh1DwEBf64DIbD8DEH/7kR5aXDMaAgY+YZxgXXj8RM0cPwX7Lpmj4ymHyJNzH0F6BlNKuwzJ+hogYv4/XsuTfzgAC48xhAGEqI2/V5AnnPI1g/Zaf6Pg/PV5mTZVcy7EQ2OegmqXWHJdO4O/9r3GPMUVYRARUV9bOnbWaySejO/Z58bmufzzjEsocqbk1a3gT1jWhiDcrgKGt+jmafCPvXz9K8jIcGRJ2qOvbd9uajLjijPxDfERNdivA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKb1jXkSEPeloYKO/ENk6pR6bEapBfxdCaBCm2OXrdI=;
 b=3zEibdlgMMQMLbzgjIUx/vDfqZkBZg7bYrng0duvxfsABA29iY1AbeuNPfm3/RyKciSM/MClJ9BtocJxrQg1whCnZWmIGBfL+0v4BiEuvfikyq8AlQJ5O46k86WHdWK2JGDyG1IqJESuVToHMO1jjgKnd6Nwc7PoSiJ3dMpvtCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 13:07:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 13:07:50 +0000
Message-ID: <6469a0ce-89d9-42ad-867b-1d8094293e44@amd.com>
Date: Fri, 14 Nov 2025 14:07:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/20] drm/amdgpu: pass the entity to use to ttm
 functions
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-6-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-6-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0373.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 429ab0d2-31a0-43a1-5df2-08de237ed0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0xLM2ZkZkxwd01vNjlBU25XdWRtNXliZThKNXNUekJibG5Obk9HS0J6SFhB?=
 =?utf-8?B?ak9ubnQwbGNqTzlOcllHcS9SSzZFUVB0OEs5eGh6RTVLWjRrSlVlSnJRMExN?=
 =?utf-8?B?N1JKVFQrMWRqbWsyaFFRSXhPckVaeUhyR3h4dTJSQnZCNG5ocTF5UWo2Szkr?=
 =?utf-8?B?QkRYeDlwMFJ5ZTVaVkU5dzRLYUhxR0orS0t2bDY3K3hsdEwyZ3dSY0wwbFZQ?=
 =?utf-8?B?bVZKdUtvRlhiT0djVmUvbDFDN0FGbmNETzlnQTVmU0JEczBMZjZhVUZTUkVa?=
 =?utf-8?B?UnhvSmRTY0dlKzI5U2hLbHYzNDRxQWtWTit6OEcyc0R3Zk9zYTZoaXRkNjFB?=
 =?utf-8?B?WVd4Rk5EZVJkdFJJeXZudmozaDkxUkpCTDdteFIvWk9xdVNoNXdQV0ZFb2tu?=
 =?utf-8?B?R0JvZkZFdTV2bnZtdWczN3l3WDBNQWlNNm1GUDRweXdiMnc3MDU5OTR3cXpV?=
 =?utf-8?B?TFlVS1JpcjBmcHZWZlBQemJ0TTB0NXBQSFE4Vml1Q2tLTmpyNUoyNHg4eWI3?=
 =?utf-8?B?UWJDYnk5eER3ZlRQSEwrYlUrcWtWejk3SWlZVGQ2dG12K1VHZmhMSXJvSmxC?=
 =?utf-8?B?b3lpbm1Qc3ZmcTNrQ0gzby9mWHNieHgvbWx1Ym8wTG5NSldUUzluS2xFRVpn?=
 =?utf-8?B?R2syY21QMXZnZmVhbmFnS292TzkzdndUQlQweDYvSE5lV05DdXhDMXloMDJ6?=
 =?utf-8?B?ZzdMRTMxeit2ZEZGUE1BcUVmZk00c1FLeEdyai94cGV6VEF0aFZaY1AwMWNO?=
 =?utf-8?B?RzhzamFvdTRLSTNhRkpsZGZvTjhlZU5PcysvOElwdEtTV2pib3RMVlB1SFg4?=
 =?utf-8?B?NUtWaGNyNmhUbVlEeHRYbmt6WDY1c3QvUE9LcFhaU2p3elFkbDdJSjA4Q3Bw?=
 =?utf-8?B?Z0ZhWDd4RUxJR0Jjc2JPOVZNeUl4MFdBY3M0Y1JlQWNQaU1EWWR1Uk5qZGxO?=
 =?utf-8?B?NG5MejhSL3hXQXFnLy9sRVVwV0wwSEMyYW4wODZ4My9iU08rVlpacElkeWdy?=
 =?utf-8?B?ZW9YNFJjaXVVYmFIb05RbXZHWkFmS29Td2RwQUZtZVRmYUFkY2tIeHFGallj?=
 =?utf-8?B?aXZZNnphZEVPWGxLclBDTkgvUzMvVnFrMDY2Y1NSVGJTL2p1NjNHVDZQTnc2?=
 =?utf-8?B?Vll5WmI2NnkxaFdZOVdYUVM0R2tOL1IvbnVWWjN1TTZrTDlaNTJyOTNxVDJp?=
 =?utf-8?B?N3UwdW9ZT2RlVkhhdVlkYlpiaE50dWg1NytRb0o3K0dqbUxxc0I5Q3dTaHE0?=
 =?utf-8?B?cVFrdVR3b3N6UWhFam95RXc2ZXIwYml3Z3dVZ1RnUmVHSDdmMHhHb21Mb0N6?=
 =?utf-8?B?S1MwRTVOaGdrditpNkVFY2tFZk5jay9OTDhtOStOcUNITUZTSXY4aU8vUTBz?=
 =?utf-8?B?bkxpNC9iWkQ2YW1STG9iZFJtYUN6alZxWDdlcVVMS1A5ZjB6OFRyblorYVRJ?=
 =?utf-8?B?QnhKTXdWdFdFZEVSTXgvOU9pQ2p3MExkQzk2NUF5SXY3Z0t3YXVLV3c4dXVu?=
 =?utf-8?B?ZmFiQ0wyT05QVTNKYU5QVWExc3pkVThtWW1hdkVISzVwMUhIUU9HeUF1QXZP?=
 =?utf-8?B?cXV6dnl6V1BjRjhEaC9vUkhWSWpFMDg3dkVJZk4yTHhWQjVkWkI2ZzRMV0F1?=
 =?utf-8?B?cy9pTEdKVVQrQVVtOVR2MHFVZUthczNUTGJzaGV0S3BVbU5GTnJtd2plN0hT?=
 =?utf-8?B?a1M2Skw1eWtkTnRpdEMxL0l6UjFXMlhqekEwdTFLM3k0ZEZXTDNkMnZvd0JB?=
 =?utf-8?B?Qlp1dWFCL1oxb2FlV1QyZC9mL05vZE41N2xUeHVrV0tmN2ZYRGdHcFRFZE4z?=
 =?utf-8?B?NVFSWWxsRThhZXdNV09tYWIvT2tWWG1KY05LR2h0d3JacFYxSHlUZUliMXVJ?=
 =?utf-8?B?dGJwVXJrZHZrQlNYLzY0SXJoM1BDT3JOcnI4ZG9VU2N2Q0lEZ0hIUE42Z21x?=
 =?utf-8?Q?b/IAFmjo1mSa4O/CVBVdPYjdtR5K64e0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTN1ZjFCRjJVdXhtcGcyMFI3SnN0Njl4bUttREViWVJRdExGaFZIeDYrZXBl?=
 =?utf-8?B?NWpLWm5qRFdnRFhFMWRRKzNaaVBsMUFCTkRPVjBOeXZjQnhVdkxXUmMxcTRE?=
 =?utf-8?B?YmNrUUdQNEc2Zk1oaHN6UEFTOGdqQkJ6VnY4Tm4wN01TVGQ5K2lxdUVzQVVw?=
 =?utf-8?B?WFY5dTlxYU15djgwQXcyZ0VCc2JET2ZITk52UnROdy9jcUVQeEtFcTJTWFN0?=
 =?utf-8?B?K3hDcEhCaG9HSXJUYkdDMmFCT09PYlJ4UHlWSWphOVliWTRKOTBlVyttc1Uy?=
 =?utf-8?B?WUQwUXBCdjJWcDllVzN4VDBiUFdTWUFSSGsrR2hNOS83bVBVc0d1MVl4YkNN?=
 =?utf-8?B?ak9ZZXNKOW1KNnJ2Rm96eGlaVlB3MTEwOUJkY20raEZ2YUhuUGVEYXh2MUt1?=
 =?utf-8?B?ZmRHS0dPUzFHUEZYUHBtZWJsMEJPNFB6SUpzamNVVjh2K1YwSTdDUlpZdFVv?=
 =?utf-8?B?MUxYTmRNZGc0RS9PS3YwTzRqT3NSQ3BkVytzd1hrK2ZFb2VyMExQOTdWbjVZ?=
 =?utf-8?B?Tnk4OTNVcUFVc0JPcFNzdkF1MjNjSURMZmY5QjUzTGFndjVqbzA4WGJtVys5?=
 =?utf-8?B?cWx5UGJHbjNkK0FCZnpDZ0p3VGIzZEdKYUY2ODZGc05TbmJCT3YvSzNVdmth?=
 =?utf-8?B?aUhIMklxYW5BaHhLcmh5MVgzNWJscjNuSzNac1JML1pvQU4xQ1dtajhtOXJx?=
 =?utf-8?B?WWs1ME5uRGFwNmIrTFd0Z01qS0x6Rk5XRFNtVU5LUHlyODM1ek1VeTVCdWFw?=
 =?utf-8?B?Tnhxa0l5UXpJRWlqVGpkbUFGM0lVMzNPemRTWlBUVXY4Ujl0a2hLQlg4VlhW?=
 =?utf-8?B?UTVDNDBJWndUZkZXUEZHUkdESkxzM2FDYWc2MEJVRlFwd0lSSmM2KzdkaVg3?=
 =?utf-8?B?amFiTC8rWDh3c0hRWWpkVThMeXE2WEZUWVJRaDZzRFEvU0VTZ283SmUwdE5U?=
 =?utf-8?B?VWJxcEtVU0dXL21xYWFXQ0dYeGVWdDBOY2V6T3hVaW5ad25CcUdWOFZ5eHZR?=
 =?utf-8?B?YnVPdDdHdDJ5ZXpsMlJBbm0wTjJwcVEzckQzUEFaeGNUV0dldElLbWVadHUy?=
 =?utf-8?B?cXU5RFlmTm5FdnNnYm9wanlyTmI0N21JTDZjQ1dwL0dubmNCMlY5cTdRTHdv?=
 =?utf-8?B?ZlZTYnlaQ2NFcDlCdFdEaS81ZFFhTW94M0xrMXZiZWkvSGl2K2RwTTR0d0w5?=
 =?utf-8?B?QzRGcTVJRDB0ODN1SGlKZFRMZmdpNEljRVJDU1c4V0s1T0dPS1R4ekRrNkVH?=
 =?utf-8?B?aFNMaGIwZXdBT1NaUWJBb3k5Rzh3TjhXV3AyNGwvanVkWGExeTBNNHh5RUVP?=
 =?utf-8?B?VFZtY3A1ZWhuOENONlJSTkJJcktUWlBnUm5SRFk5YnNES3R3MU1tZ2NTQ3ZI?=
 =?utf-8?B?Z29uakoxMXpiVVRLZUlTNFJBSnFZSGd3RmRFWEhCMm1XTVNJQnNDUzluMmxE?=
 =?utf-8?B?OS84OStlRVJrbGJUcWNJOHNRRlhTVkp6WTUzWkhQZmNWa1NNaUlsbXlISUNw?=
 =?utf-8?B?RW1JU1NyZEZzUDlUQXMrbTlFUGZ1bXR6VVJtMWMvcmdJSEd5ZjNSWUo2cmVt?=
 =?utf-8?B?K1R2UTN1R2EzL0QxSlM1SFI5ZTlaczFHb2dYRmp0a2ZPcDM3dGorRlZXZ24r?=
 =?utf-8?B?c09qc3RJYzhrZmhaYTNEZU9JZ2tFVW1qajFaREVoTmF3K3RWcXdBS0M0MjZm?=
 =?utf-8?B?NVE0RGlhN1ZOamhaU1BYYTBmQStDQzdqZ1JEKzdOM1ZmNXJZZXNhcW5KQ2Uz?=
 =?utf-8?B?K0FQcDlnUjRhUnJaWS9ES2lycWdFRW1PTE8waWJwM3ZERHdTYUhneTZ5Tk44?=
 =?utf-8?B?c09lWFZwSFp3ZkRPdGpHdXRqOG5UZ3FOUndXcHdTeXNSQmFiallJaHhuU054?=
 =?utf-8?B?TUlCL09SUC9aa0NVQm8vZXdPTUN3TXU3Q1MvbTNUVDN1dFlhZHkzLzBtazA5?=
 =?utf-8?B?cVptajBPOUxsY0xkTlp5R0xFMUVxYkZvWGVOMnhic1JSVStmU216NFg3VUZp?=
 =?utf-8?B?ejFLYWZiTmh4WktaY21QUXlCVU9jUjcwNFBGVnpWaTFYclBxMjdlUStRS28y?=
 =?utf-8?B?ZlZKRzkvS213UmdzSXpjK1dQOVA5T3d6UUZ4TmpZdTNBS3JaSzFDTjJRcEJK?=
 =?utf-8?Q?tqkv8KF+4PNDHMM9g7WiI+skg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429ab0d2-31a0-43a1-5df2-08de237ed0b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 13:07:50.9027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9+ORSHlb53VyPvMUetsaD/r7myq46Ky9TluRbShsdXIT+04oQ+mtBMG3GnAGjT/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> This way the caller can select the one it wants to use.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 75 +++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       | 16 ++--
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  3 +-
>  5 files changed, 60 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index 02c2479a8840..b59040a8771f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -38,7 +38,8 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>  	stime = ktime_get();
>  	for (i = 0; i < n; i++) {
>  		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> -		r = amdgpu_copy_buffer(ring, saddr, daddr, size, NULL, &fence,
> +		r = amdgpu_copy_buffer(ring, &adev->mman.default_entity.base,
> +				       saddr, daddr, size, NULL, &fence,
>  				       false, 0);
>  		if (r)
>  			goto exit_do_move;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index e08f58de4b17..c06c132a753c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1321,8 +1321,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	if (r)
>  		goto out;
>  
> -	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
> -			       AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
> +	r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
> +			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 42d448cd6a6d..c8d59ca2b3bd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -164,6 +164,7 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>  
>  /**
>   * amdgpu_ttm_map_buffer - Map memory into the GART windows
> + * @entity: entity to run the window setup job
>   * @bo: buffer object to map
>   * @mem: memory object to map
>   * @mm_cur: range to map
> @@ -176,7 +177,8 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>   * Setup one of the GART windows to access a specific piece of memory or return
>   * the physical address for local memory.
>   */
> -static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
> +static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
> +				 struct ttm_buffer_object *bo,


Probably better to split this patch into multiple patches.

One which changes amdgpu_ttm_map_buffer() and then another one or two for the higher level copy_buffer and fill_buffer functions.

>  				 struct ttm_resource *mem,
>  				 struct amdgpu_res_cursor *mm_cur,
>  				 unsigned int window, struct amdgpu_ring *ring,
> @@ -224,7 +226,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>  	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
>  
> -	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
> +	r = amdgpu_job_alloc_with_ib(adev, entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4 + num_bytes,
>  				     AMDGPU_IB_POOL_DELAYED, &job,
> @@ -274,6 +276,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>  /**
>   * amdgpu_ttm_copy_mem_to_mem - Helper function for copy
>   * @adev: amdgpu device
> + * @entity: entity to run the jobs
>   * @src: buffer/address where to read from
>   * @dst: buffer/address where to write to
>   * @size: number of bytes to copy
> @@ -288,6 +291,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>   */
>  __attribute__((nonnull))
>  static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
> +				      struct drm_sched_entity *entity,
>  				      const struct amdgpu_copy_mem *src,
>  				      const struct amdgpu_copy_mem *dst,
>  				      uint64_t size, bool tmz,
> @@ -320,12 +324,14 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
>  
>  		/* Map src to window 0 and dst to window 1. */
> -		r = amdgpu_ttm_map_buffer(src->bo, src->mem, &src_mm,
> +		r = amdgpu_ttm_map_buffer(entity,
> +					  src->bo, src->mem, &src_mm,
>  					  0, ring, tmz, &cur_size, &from);
>  		if (r)
>  			goto error;
>  
> -		r = amdgpu_ttm_map_buffer(dst->bo, dst->mem, &dst_mm,
> +		r = amdgpu_ttm_map_buffer(entity,
> +					  dst->bo, dst->mem, &dst_mm,
>  					  1, ring, tmz, &cur_size, &to);
>  		if (r)
>  			goto error;
> @@ -353,7 +359,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  							     write_compress_disable));
>  		}
>  
> -		r = amdgpu_copy_buffer(ring, from, to, cur_size, resv,
> +		r = amdgpu_copy_buffer(ring, entity, from, to, cur_size, resv,
>  				       &next, true, copy_flags);
>  		if (r)
>  			goto error;
> @@ -394,7 +400,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  	src.offset = 0;
>  	dst.offset = 0;
>  
> -	r = amdgpu_ttm_copy_mem_to_mem(adev, &src, &dst,
> +	r = amdgpu_ttm_copy_mem_to_mem(adev,
> +				       &adev->mman.move_entity.base,
> +				       &src, &dst,
>  				       new_mem->size,
>  				       amdgpu_bo_encrypted(abo),
>  				       bo->base.resv, &fence);
> @@ -406,8 +414,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>  		struct dma_fence *wipe_fence = NULL;
>  
> -		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
> -				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
> +		r = amdgpu_fill_buffer(&adev->mman.move_entity,
> +				       abo, 0, NULL, &wipe_fence,
> +				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>  		if (r) {
>  			goto error;
>  		} else if (wipe_fence) {
> @@ -2223,16 +2232,15 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  }
>  
>  static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
> +				  struct drm_sched_entity *entity,
>  				  unsigned int num_dw,
>  				  struct dma_resv *resv,
>  				  bool vm_needs_flush,
>  				  struct amdgpu_job **job,
> -				  bool delayed, u64 k_job_id)
> +				  u64 k_job_id)
>  {
>  	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
>  	int r;
> -	struct drm_sched_entity *entity = delayed ? &adev->mman.clear_entity.base :
> -						    &adev->mman.move_entity.base;
>  	r = amdgpu_job_alloc_with_ib(adev, entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4, pool, job, k_job_id);
> @@ -2252,7 +2260,9 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  						   DMA_RESV_USAGE_BOOKKEEP);
>  }
>  
> -int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
> +int amdgpu_copy_buffer(struct amdgpu_ring *ring,
> +		       struct drm_sched_entity *entity,
> +		       uint64_t src_offset,
>  		       uint64_t dst_offset, uint32_t byte_count,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **fence,
> @@ -2274,8 +2284,8 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
>  	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
> -	r = amdgpu_ttm_prepare_job(adev, num_dw,
> -				   resv, vm_needs_flush, &job, false,
> +	r = amdgpu_ttm_prepare_job(adev, entity, num_dw,
> +				   resv, vm_needs_flush, &job,
>  				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>  	if (r)
>  		return r;
> @@ -2304,11 +2314,13 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  	return r;
>  }
>  
> -static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
> +static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring,
> +			       struct drm_sched_entity *entity,
> +			       uint32_t src_data,
>  			       uint64_t dst_addr, uint32_t byte_count,
>  			       struct dma_resv *resv,
>  			       struct dma_fence **fence,
> -			       bool vm_needs_flush, bool delayed,
> +			       bool vm_needs_flush,
>  			       u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = ring->adev;
> @@ -2321,8 +2333,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>  	max_bytes = adev->mman.buffer_funcs->fill_max_bytes;
>  	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
> -	r = amdgpu_ttm_prepare_job(adev, num_dw, resv, vm_needs_flush,
> -				   &job, delayed, k_job_id);
> +	r = amdgpu_ttm_prepare_job(adev, entity, num_dw, resv,
> +				   vm_needs_flush, &job, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -2386,13 +2398,14 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  		/* Never clear more than 256MiB at once to avoid timeouts */
>  		size = min(cursor.size, 256ULL << 20);
>  
> -		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
> +		r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity.base,
> +					  &bo->tbo, bo->tbo.resource, &cursor,
>  					  1, ring, false, &size, &addr);
>  		if (r)
>  			goto err;
>  
> -		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
> -					&next, true, true,
> +		r = amdgpu_ttm_fill_mem(ring, &adev->mman.clear_entity.base, 0, addr, size, resv,
> +					&next, true,
>  					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>  		if (r)
>  			goto err;
> @@ -2408,12 +2421,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  	return r;
>  }
>  
> -int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> -			uint32_t src_data,
> -			struct dma_resv *resv,
> -			struct dma_fence **f,
> -			bool delayed,
> -			u64 k_job_id)
> +int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
> +		       struct amdgpu_bo *bo,
> +		       uint32_t src_data,
> +		       struct dma_resv *resv,
> +		       struct dma_fence **f,
> +		       u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>  	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> @@ -2437,13 +2450,15 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  		/* Never fill more than 256MiB at once to avoid timeouts */
>  		cur_size = min(dst.size, 256ULL << 20);
>  
> -		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &dst,
> +		r = amdgpu_ttm_map_buffer(&entity->base,
> +					  &bo->tbo, bo->tbo.resource, &dst,
>  					  1, ring, false, &cur_size, &to);
>  		if (r)
>  			goto error;
>  
> -		r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
> -					&next, true, delayed, k_job_id);
> +		r = amdgpu_ttm_fill_mem(ring, &entity->base,
> +					src_data, to, cur_size, resv,
> +					&next, true, k_job_id);
>  		if (r)
>  			goto error;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index d2295d6c2b67..e1655f86a016 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -167,7 +167,9 @@ int amdgpu_ttm_init(struct amdgpu_device *adev);
>  void amdgpu_ttm_fini(struct amdgpu_device *adev);
>  void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
>  					bool enable);
> -int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
> +int amdgpu_copy_buffer(struct amdgpu_ring *ring,
> +		       struct drm_sched_entity *entity,

If I'm not completely mistaken you should be able to drop the ring argument since that can be determined from the entity.

Apart from that looks rather good to me.

Regards,
Christian.

> +		       uint64_t src_offset,
>  		       uint64_t dst_offset, uint32_t byte_count,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **fence,
> @@ -175,12 +177,12 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  			    struct dma_resv *resv,
>  			    struct dma_fence **fence);
> -int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> -			uint32_t src_data,
> -			struct dma_resv *resv,
> -			struct dma_fence **fence,
> -			bool delayed,
> -			u64 k_job_id);
> +int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
> +		       struct amdgpu_bo *bo,
> +		       uint32_t src_data,
> +		       struct dma_resv *resv,
> +		       struct dma_fence **f,
> +		       u64 k_job_id);
>  
>  int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>  void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index d74ff6e90590..09756132fa1b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -157,7 +157,8 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  			goto out_unlock;
>  		}
>  
> -		r = amdgpu_copy_buffer(ring, gart_s, gart_d, size * PAGE_SIZE,
> +		r = amdgpu_copy_buffer(ring, &entity->base,
> +				       gart_s, gart_d, size * PAGE_SIZE,
>  				       NULL, &next, true, 0);
>  		if (r) {
>  			dev_err(adev->dev, "fail %d to copy memory\n", r);

