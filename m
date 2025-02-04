Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31438A26CF2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 08:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328D610E2B2;
	Tue,  4 Feb 2025 07:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kAm0HRrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2050.outbound.protection.outlook.com [40.107.95.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F041C10E2B2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 07:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgNN7kMMjG6OLSBKmLQhtRm4EtpKtcMZ8jkcQj1kq5eoOvH1KVGOfG6mT+u9TZ4vI0tipyoNSeFJ9pCMvb1RYQGsDWdM+YcBn2tLbL72BF1txSo51sQfxTa25baT7nGD5K2wvNIRdJcAu2hrqK+JwcCiXIGeRHnKtqhwzyunyu+bdNSlNd08N6D9N0p5avKWbPE4aa4cL9S96brd9crgaF5uLTFpw6si0LfRx+uI78k7g6z+LIutNVs24cDIMeVddCDUDGbEiI5YJQWxe54XrvcrhdunJ/cAI/3qClgC+unMj4SvlKTU90NbKDy+CkK4SK/pbEszIM4SC/1KG6DmJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WY+mdfwH95O3p9c7W7/fzWF3hH3iTl2gw68rIfGxY6A=;
 b=Li9VRpW+njfCzyJUbgZkSBt2L657tc0YfFVO+Lb2EQrA2xZP4WWASQwu3Tb2n/jCNeGUO0VlRQPakaQftnsUJEnxs/KSiUg/GlnHxliUyPBnK8UkoCBH/6gAXNb67m5rng3Ec2MRcwbwcNxGrsm4pDZjv13CQTAe9Z5NzHoabV/BOknqx+Aca71JcgF+48Ms/GZekbJZ4L0doD4ZZrtYyF+SKn6ZcpubhQUFGcVW8Wj6qrDeZnIfVfgrQtVFib6UjGn0iDVRGETHkPWsOxyGNifjlkcXalmVKkDhFHdFlZQJI6mT/3GJFgcqwaBbGGWqaMOnnDCCHQDagJTlRFOxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY+mdfwH95O3p9c7W7/fzWF3hH3iTl2gw68rIfGxY6A=;
 b=kAm0HRrrOIhuhxdhb8cu/4F34m1zkK5UlVkkmHw+WwBzRfMuBCHJ0BxdNj5va0ST9UGO1MgffL++J9SlJKsc+Ip5GZFRz+piCUBu3NrpyGpK/Zqk05LFPPparjT+mO6UkOfCCzcECY3U2F2OHqfPlnfbO3Xvpmhtyq/TEP40u/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8270.namprd12.prod.outlook.com (2603:10b6:8:fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 07:59:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 07:59:14 +0000
Message-ID: <bea1a3a0-c6d4-4941-9dd9-73f0756ef17b@amd.com>
Date: Tue, 4 Feb 2025 08:59:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: use ttm_resource_unevictable() to replace
 pin_count and swapped
To: Zhaoyu Liu <liuzhaoyu.zackary@bytedance.com>, ray.huang@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250126093256.GA688734@bytedance>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250126093256.GA688734@bytedance>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e1d743-7035-4156-d4d7-08dd44f1d0e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3JJRkxhaWpKQnJwaHltNjNhZU9VOGVMWXNRSkxpZzR1WjZYM2tjaTdkd2tw?=
 =?utf-8?B?YnI2MU42b3FnaXhTMmFJMkFuc3ZuclY2bTBXUk1vVXJYMzNLbi90SFhJSjlo?=
 =?utf-8?B?OVIyRU5HdDZicGdsdm94Y1J4cTRVeThrTGZ2U0pRazE4b1VYeEZ3N0FPOGxB?=
 =?utf-8?B?b1l6T3RMbWdsSndJb0M1Tk9lc1RoNm15TXVadndNMDRtaHViVUtmTjVYTExz?=
 =?utf-8?B?cUtsckdBY2JCcGIzanJNZmZPcURkZ1NkUUhFTnlPQmpGQW11MjkybXgvN0VY?=
 =?utf-8?B?VmcrODdoWmRTNUJnVzdLRTIwMkgyUUtlbk52cEZ2dkVjZlJIbEc5L0NzdnBi?=
 =?utf-8?B?d2xuRW1zRkRGWnpEcGh6Wld4aFBEUUxWQmZTcjVmUElvd2pGWjNYUU5EeGRN?=
 =?utf-8?B?Mk5GaGw0Y3Jxc3BubUNNbnMxU1VpL3hqaGZDbVdQMzgwWmo4UFJDNXpaN0Uy?=
 =?utf-8?B?d0lXc3ZrYnZhaUdNMlQyOGkrWWw1ZElLUSsvdDZzT1NJWE5CSGQwZjNlV09R?=
 =?utf-8?B?TEQyRDcwY0R6OVFJR0d6dVZ2bTJEU1JDam40VUlHKzFDaTZuYjlwcnlJb3A3?=
 =?utf-8?B?Wk9ldlBvZmNZNGJ6U29abkpQazlqNVV4Zm1KRWtmVlBZVmJmRXdDU1gwSFRK?=
 =?utf-8?B?WGpKbVovcjIxQVFpRnp0ekY2cFE3UlRJQ0hhd2RXcVk0ZW1xb0NoK1o2aGsz?=
 =?utf-8?B?R2ZRc3ljQTRLMGVmMmN5S2U0SzRUSFNmQnNoajl3QTFEcUx6U0VlcWxtMFh4?=
 =?utf-8?B?emNZMTRsQlQyamc3NGlka2d4b3dVMjdTNHlreExRdTYyYzRveHNVT2FsVmwv?=
 =?utf-8?B?K0hOUmtJUW1MdTYzTzRDYXhrVFFsYjloR1VxZ0lyeldWV2Y1L2FLSmdjU2ND?=
 =?utf-8?B?SkRLUU5NN09zNjNEVm1sZ1ZUUWVPVGw5Ukc1ZVBxZ3JUeCtBK0lBcGUwZ1FR?=
 =?utf-8?B?azI3dlovb0tuNk9Ia1Z4cnpGM2JQT0NVR1NzVlN2ZW5pVnl0d3NpMmFyNUp2?=
 =?utf-8?B?VWFTcFg2b1JMT2txN0hiQ0M2R0QveHdpZUk2eWxtYXBTR3l1dUkxQ1VmU3pD?=
 =?utf-8?B?TXpXUFpRQjNTcXMzSFdiYlFzd3BabnV4TmdjVkNjUmNnaUtFM1BlbW5CT1N5?=
 =?utf-8?B?VldVaTg2Y0dlZkh6UXAwQlRseUhRTHhQeERnRjJPUldJNnV0cmdRb3l3WGhm?=
 =?utf-8?B?b2ZLWWVYbGl2UlFMei9TT0FQZC9GODZPMEpHTzFOZjh0VDhGNEhlaHQvU2x4?=
 =?utf-8?B?cUhNd3p5enpFeTZyRldISGowZFROSHJIS1lzRitISzEyTFpTT1BJdFVvUGIw?=
 =?utf-8?B?T2NOL210NHBlOUpJTlV6QkZtWUljQ1pZZ1pXYmV2YVBqaHA1SFVvQmY1ekw5?=
 =?utf-8?B?ZG1JeGZtM2xYbXpObGpjMGpLRm15OUpCTVFvMENWVklqeERGRzBMbEg1UEVw?=
 =?utf-8?B?SU05Q2lKWDNONDBodGdFdlUrdmdjSHZucURvTGNlRzFQdnBZTWdaUW5nQkFC?=
 =?utf-8?B?cGh4cDg4ajFpQ05ld0JwNEpjbEtnMWFaMzg0blhBUktYYlhvN1h4eTlWb2U0?=
 =?utf-8?B?VGFvQ24yVDVIaTVJcGp2clRjc3RCdFEwTFFUSTJndUxlaHo2MkVPa21sOXJR?=
 =?utf-8?B?b0lRYnFZcnBaYS9JTlZ5d2JPd3M5SFhYNkZTSzJwVk4rY09vblU1UHhHaTJG?=
 =?utf-8?B?WE9jRDZhQ0x4N0xWUlpwVEh2UVVRTCtnNFA3bWFXQ2VoUXZKRzl6SWd2aUEy?=
 =?utf-8?B?bFd0bWxINDBuN1hWVWhPZUpoOEZoa2pxNVRvN2dGY1YwTTNjY1R2dUZBeWll?=
 =?utf-8?B?TGZMclFqMEh1S2N6RXNlUmkwRWNZN3pQV2J0aXdDMlFnNWhrR0VIWjBWNmg3?=
 =?utf-8?Q?HkkM1F+JwXj69?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0RlTzZONncyOW9QQVVvTkxMSThwWjZNUGJ2d1Q5VWN6QmdYWTBVckZYcnh6?=
 =?utf-8?B?UmpQNkt2d1o2bVlHMk9jUG5HN0xKc3N2MEp0VndPWTRBNkJzSzZUaDYrNCs2?=
 =?utf-8?B?aFRiUHJ3S29zZWU3NnB1VjBET29vMWpoYUNyTG5GRXFZSEY2bGU1dU81cTJK?=
 =?utf-8?B?dC9lYnVwYWZEWVYySW80TnY0amR6YjdoWHM2bk95UzFlQS8ramovQnYrb2xN?=
 =?utf-8?B?bnlIM2NjWFJTM3dqZ2NhZEdtaDhXUFBrV09nQWp1Q0NNSEU0azE4WXJwV2NF?=
 =?utf-8?B?amZmZ1hYVXpxcURvVGZCNDZSMmV2RWZJT0lwVGthUWtaNGZodnN1cUpCbTNV?=
 =?utf-8?B?MkhLYnJqdFQ5WmdpTkdEMXprWHpxZEE2Rit6OTN0OWVwRFF1ZlJId1NqK3l3?=
 =?utf-8?B?VGlBUXVKQWNTMnVSVk43dlkyVU5yTjFOZzRmTVM2dWZ6Q2REaFg2MzFldDJw?=
 =?utf-8?B?UVV2WTZIMk44VlJyMHNZeC9aT3d6Szd5d0FySFgyNE1GRHdPK1EzdHJkdk16?=
 =?utf-8?B?d2U2b1pWT3Y0QlhLczRFaDRFL2FEZ21RTjNiTmpxMFBvVzRHRHJuSlhrTkto?=
 =?utf-8?B?azRGOWpla0VXQitldUtQL0drcmt0b0dXT1RHbi9LWTFHejJQS2JXOERrdzF1?=
 =?utf-8?B?K2NWeitSRTY5Qm9oV0FLaU1MT2prWFp5a0pEUThpeC9iNHIxVm5xSTl6NnVy?=
 =?utf-8?B?L0NpbW82dGg0TFFaTGZKd1ZkeDlzdjBZK0JBZStDdnFyQ3g5bXdieEdWNllX?=
 =?utf-8?B?OFFLK2JyUisxQUZtYnVKUDdNc2IvWForUVQyN3ppWUlia284bURRVlpkUldm?=
 =?utf-8?B?OWo4L2VNT3c4MmNTcThVd3pleTlaajdhM2xDUDdhZ0lkUDJLSTFnaDhmb2tU?=
 =?utf-8?B?bU1YbTlzekJtSFF3TXIrUHZFY1RPcjNuMU1oaWN3THhrUkpiSjNiK1dDTlQv?=
 =?utf-8?B?K3pXUlpTQk40KzhMUk9YZmgvalRwK3pab3djN0dKWnEvbDc2UWJueVR1eVFE?=
 =?utf-8?B?NXlMeWxYVXBnOGNySmFsS2F5RWQxY3A2aEcwaVY3Z29yVzBhQ2RxOEQxQit6?=
 =?utf-8?B?dThkK3hmZk1GL0NFaWZFa1hrVE5CNGZXbWZwN0x6b2JlTENRZWNrNnB4T2FL?=
 =?utf-8?B?RWxhTXNDL2xOOTg0ZHRmazhzT2VFYmxSeG5QWUMwcGthUWMwaGpNc3pycGhS?=
 =?utf-8?B?b1BCejVWWForT3RkWkRDRURlU3IvS0FtcWZSVnV3OUF2ZHBnWGhOdUlEQW5F?=
 =?utf-8?B?ZWRYL3VpcFNKbG1sV0YyeTlaM0JVbzNvRWlVZXo1bDRWK0VoNHZXZHdMNXNv?=
 =?utf-8?B?NDN6Q1k1TURnbUx1Z09FUDRWa1NPWkdBa3JuS3lFdExOcnZWYmJBTGp0Y2Q2?=
 =?utf-8?B?UDM2dG82U1pmQXo0aHpieUFjVkZoMmdxeWhJaysyeGtQRUZiS2phcG9tajhq?=
 =?utf-8?B?UUIwNmwxcGFMaFEveGxqb3VqZXVkcFUwMW05enE3bDdrMEVoY0lZcklhK0Z0?=
 =?utf-8?B?WTdCTVJ1Q204MFQyMEJQTXFIL1BDZDFOQ3k0ZzRIVFcrYVY0YVFocTlUWTZI?=
 =?utf-8?B?NDVDS0o0OXFIWlJTbHRyOG5QZ0UzdGZXaXNzZTN4TU5qUEF3TlFmZlJMZE5w?=
 =?utf-8?B?YzZrQkFJQXhaVDBWMGZRRkVYS0hzMXZ3anFrK2xocmRSbEY2WjUzWEFqOTAv?=
 =?utf-8?B?NnNORVk1dHA4cU50S3NrTmJjZ0pRb2M4OUtaeEcxNzJBcEppN21NTW9udzJI?=
 =?utf-8?B?c01waFJNVHpMNVZvUXhUdVU2WXFmZC9reTNRbkZXamk1NkJzckdKVXVmckIz?=
 =?utf-8?B?ZWpIYWpTcjBtcXJlWHVXRm9sTEM2ZXQxSnp1ZkFDZ2Q4dUdTSU9xTXdTVkZv?=
 =?utf-8?B?QkZ3QXlrQUJNdEFUcU0yRW9Qa3MydmhpSnJEeTRPbmhmOTUyOTJmS0ZEaEtY?=
 =?utf-8?B?Tk4wVjE2YmJNR3p1MG9CckcxLy9IVzN4ZkZSWFc5ZDVGRjZjblY3aFVXWkRG?=
 =?utf-8?B?UXJzVkI4bUsydVIyY0xEUVJzaTR3WUgwSGNveDdxeC9oWnNyUzBzUk9PeTRn?=
 =?utf-8?B?TUxRbHpGR2NHZWJtQUhhNUhYOVpmdTNPbkpzM3hYTEVYRnBvcUVmV3grKzcr?=
 =?utf-8?Q?YKxFt11krpbRhkB2JoDu+D7AF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e1d743-7035-4156-d4d7-08dd44f1d0e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 07:59:14.0584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9Y+fjFoxeGPC+o9/NOwZp285IQtCDMjKPWqKHfFYCwBzW5VBVczQ9LzBFExly5J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8270
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

Am 26.01.25 um 10:32 schrieb Zhaoyu Liu:
> TTM always uses pin_count and ttm_resource_is_swapped() together to
> determine whether a BO is unevictable.
> Now use ttm_resource_unevictable() to replace them.
>
> Signed-off-by: Zhaoyu Liu <liuzhaoyu.zackary@bytedance.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

I will pick this up for drm-misc-next.

> ---
>   drivers/gpu/drm/ttm/ttm_resource.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index cc29bbf3eabb..a8f9f7ed6c6e 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -252,11 +252,16 @@ static bool ttm_resource_is_swapped(struct ttm_resource *res, struct ttm_buffer_
>   	return ttm_tt_is_swapped(bo->ttm);
>   }
>   
> +static bool ttm_resource_unevictable(struct ttm_resource *res, struct ttm_buffer_object *bo)
> +{
> +	return bo->pin_count || ttm_resource_is_swapped(res, bo);
> +}
> +
>   /* Add the resource to a bulk move if the BO is configured for it */
>   void ttm_resource_add_bulk_move(struct ttm_resource *res,
>   				struct ttm_buffer_object *bo)
>   {
> -	if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
> +	if (bo->bulk_move && !ttm_resource_unevictable(res, bo))
>   		ttm_lru_bulk_move_add(bo->bulk_move, res);
>   }
>   
> @@ -264,7 +269,7 @@ void ttm_resource_add_bulk_move(struct ttm_resource *res,
>   void ttm_resource_del_bulk_move(struct ttm_resource *res,
>   				struct ttm_buffer_object *bo)
>   {
> -	if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
> +	if (bo->bulk_move && !ttm_resource_unevictable(res, bo))
>   		ttm_lru_bulk_move_del(bo->bulk_move, res);
>   }
>   
> @@ -276,10 +281,10 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>   
>   	lockdep_assert_held(&bo->bdev->lru_lock);
>   
> -	if (bo->pin_count || ttm_resource_is_swapped(res, bo)) {
> +	if (ttm_resource_unevictable(res, bo)) {
>   		list_move_tail(&res->lru.link, &bdev->unevictable);
>   
> -	} else	if (bo->bulk_move) {
> +	} else if (bo->bulk_move) {
>   		struct ttm_lru_bulk_move_pos *pos =
>   			ttm_lru_bulk_move_pos(bo->bulk_move, res);
>   
> @@ -318,7 +323,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   
>   	man = ttm_manager_type(bo->bdev, place->mem_type);
>   	spin_lock(&bo->bdev->lru_lock);
> -	if (bo->pin_count || ttm_resource_is_swapped(res, bo))
> +	if (ttm_resource_unevictable(res, bo))
>   		list_add_tail(&res->lru.link, &bo->bdev->unevictable);
>   	else
>   		list_add_tail(&res->lru.link, &man->lru[bo->priority]);

