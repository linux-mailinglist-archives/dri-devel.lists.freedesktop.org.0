Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F18B1AF4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068A911A1A5;
	Thu, 25 Apr 2024 06:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xOIO6W/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C5911A1A5;
 Thu, 25 Apr 2024 06:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPjcRMZqSzrMtIzZINf5JYtJxtMs8r7WBulfzBNqCTNO0t3lsvbca64wBvYzd4sfNF5w89Iam2KVuEgLb19piywbLwPenLLS0Ze24Gz8+DhuE9GdNluZMNsXApWIBy4U1Gz69VN1gN8i/nhkyyRjX3rILIjIx63Flx2MISTAnJMwQ+bsTg2jZ+nWzhGwLanwo5PhSoZFqOFCqrZ83TGEI0DBeAkTipetCauASzhR41WafqhhG12PifQN20vcN+MJb7be/lGIA9Gn+iEJBLSXqkefn+ijHuZGVdEZfmG9OXbDu6VSbrHRDhlKXFWCZZbsi1H10PZZLacrUfBPlijU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpJZDymjLhfVFBbHAHWl5K+1CyIskP3gGuljTgbv9/U=;
 b=Ax0Dpx9Xw/w9XpvD2sQFquhMPZNIhAIZdE7eFiXXsQBoXoFFNy1Y0+aZLRFWwGz7AygWTWz1Roz4+0ed4ogH6dVsk9xa1t3rrs6Gu9t22G+1DPcmkYnmJy3ClBSMkc56n+cP88bzX0z71QFvzlCej3WgwnQkN/pvVuC/OutSAzlXazY/3231WaILKOx8YPG1oJTVROBnq7rRlDBpqhLpObRMENtL/r4FKHdNw+D1tf4fLYWVmgJ4GGoPYKoUzgviToiU7+VT0FgqUolPT7usIQeABHygqY16aEiP/7SsSPvVHE5N53+1x3R9vVM/Z6rN3HZbuHHUrlH0rfvmb2RbHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpJZDymjLhfVFBbHAHWl5K+1CyIskP3gGuljTgbv9/U=;
 b=xOIO6W/KNJnODSZlcnbipK/Krh3wjDVgQLDtTR61ZuV0svMQ5ymJY3UE8tocFX8AxgbNMK7IocDElt/EjQs6yH6CMuHECYooVK+EWp+G9koF0gc01y+IiSgMoDQ+uW/mAeO6RCwx5MKkEQq+cVtSwnh6lslS0in0KOeWPVBuyMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW5PR12MB5623.namprd12.prod.outlook.com (2603:10b6:303:199::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 06:25:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:25:20 +0000
Message-ID: <7a112162-8fae-418d-a58e-bf12713b8e7e@amd.com>
Date: Thu, 25 Apr 2024 08:25:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/18] drm/amdgpu: Don't add GTT to initial domains
 after failing to allocate VRAM
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-11-friedrich.vock@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240424165937.54759-11-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW5PR12MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ccf9870-e3d5-4cb4-0aa2-08dc64f07b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEQyQkxHWFVxbnpSSlVHbTBMcGpTajZEdFAwK0dqb0xLL3FDRk5tMEM2aUMy?=
 =?utf-8?B?U3pEUnZ5dEQwUWRlczU4a3N3eVVCY2RRa2RNaXp4NWxQN1lmNmJEdnNIczhU?=
 =?utf-8?B?aGs3VkJQa1YzYURVUlNuTnc2WTVndVdKOW5KbHUxWGRDc1pLbDdUNXdnbE1k?=
 =?utf-8?B?RThaSkRFQUF4UlM4WTMxZWdUeUlUbnIyR09uYUJzWWc3Mm5CNmxJTXhLNmxB?=
 =?utf-8?B?V2FVVW4raFcyOWJtOUIyTDRUZ0t5ZFhDRTRTd0IxSUROdW5WQXN3dFl6TnRj?=
 =?utf-8?B?N3Q5b1JCUDdkVzdlQlZsSjgzeEhZR3ViQVRxcUJMSzlobUtxY1FlRjdSaFQv?=
 =?utf-8?B?WU9WL2FFSW5obkduY1Q0VENuMCtLcjFaa1I1c2xOY0l5SnkzMFVFUVZSWTNR?=
 =?utf-8?B?Z2ptdTIxMnNzbUxuYTk4aGpQb0NodHhYZC9EL2FvbU4xR255YkVkSzByc1lX?=
 =?utf-8?B?TVJFTWtMMHdZYjRjQ1EvSGFWdDlIWGtaKzNLc2owWXlUZk55aHFzSk1aS3Ns?=
 =?utf-8?B?NkN2azc3VUpWdjdCaFRzMjhML1NXd1Y0MjRvTE45a2RaMjl4cHpoNXFkR1pZ?=
 =?utf-8?B?YXE4L2dLWUJwSXd6Y0RLakFmT0FTSG43RW5MeU5mT1R1YktsSUR4YjF1ejBF?=
 =?utf-8?B?aHJ5TTUwMVpORGpXME0xTXEwdm4zUXN6UVArc3RqSDNWM2NmZ0NLaGNJWHdH?=
 =?utf-8?B?UUcwL0ViWTA2QTgxY0RnMkxaWXN4RFc5aGFwWG5ZbEVVWEZkMGxCalVhV3Nv?=
 =?utf-8?B?N0k2M0hOZVgwYWhSQWZwZTFDM1RBUG8zZ2tWaEFVSW40QnpwWWRlMldkbXFK?=
 =?utf-8?B?eDIza2YrZGYrUzRoWEJ2M1ZVZnVFQ1ZGb3F1TmtPZmdRUmRkUG96Mk1HRTdN?=
 =?utf-8?B?SVhNSmozc2laTFoySFAwMEprbXF4QVE4M3hhNlI0OXZXd2dwYUgveEhUaUt3?=
 =?utf-8?B?VXYxTUVJRW1FaUY4UU9jOGJ5OVY4Qll0NnZwUkNzVm9qSDZQaTU0dFN6K3ZW?=
 =?utf-8?B?bzAzVnM5ajMzTEdnd3E0T1VLdkhLR0NkWEtibjlJNVBucVJEM01KRlR6Y09O?=
 =?utf-8?B?TzBHVmlpZk1vbnVWYzlNcEV4bS92Z0Y2VC9LNldZWkpnMXo2eEk1NlhWQ29y?=
 =?utf-8?B?UU1PQXhlWkdWVWR4N3JXUTJsRFd4NnV3ZTVoRWtoME82VmxjNUNxNUVqWDc0?=
 =?utf-8?B?WGhkQUEvSXNyc08vTHhaSk1kREVFVWw2dmk0cUdJbFJjTUsvZEJFUjN3bHFR?=
 =?utf-8?B?Q01Wb3hzVG1obDU1UzJkbEF0TVprU3ZlSFA1bDFLRWRDdTlZVUNHZjk2UitG?=
 =?utf-8?B?YTNKNWo3SWZUZFBRL1VNTytuVmxSYnQxN0liUnFGZXFpNXFya0F6VXh0eUFI?=
 =?utf-8?B?NlNVQzdGZ0VSL3BJdHFuVGxkWU50RHJvL1V0Z3RmODZVOVB5VWdtQm5IV042?=
 =?utf-8?B?YTQ0NUFOUklnM09TQ0I1UE1PdGJVRnMxQTgxUEhJSDdnakYxNXl5cjQyOFlC?=
 =?utf-8?B?K1JCTXpVd3pLMDF6SDNPSXNaMnJDbTJqNEQvc3pWMy94UUJVR2VnUytMWVlE?=
 =?utf-8?B?RFRIQkdLbUtoQWxKWi9Gc2xiV1E0UlNVMzNIbnR3T3IyazZlMlN2U3d6N0U2?=
 =?utf-8?B?SXdvS3lIQ3ZWb1JQMTZmdXJqeE9WUmllYmlxbXZGRUl3T3NpcnRYTDJpQTlW?=
 =?utf-8?B?VW1EY3p4dmJnQnR2Wkl2bkVaL3c3L3doeHNqbXFwWDJIWFBBZXJ5OVRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1Zxa2U4UzlQTVh5V3ErWm1uMk45Q0Mvei9Ca3NPdy90bXdmYUVyREp5MnZr?=
 =?utf-8?B?UXI1ZHhVQnJQaUxjemkxVDUrR0JVZWlwWVp6VWZpQXU5eTRLS2R2QnVVQ2VG?=
 =?utf-8?B?RTd2bTVLaGd1Y0Z4ZEN3UEdzWlgyd25KQ0UwcGZ6Um02am40bHpQRWhLWlF0?=
 =?utf-8?B?Rm9YRE01d2NqM1ZXQWpxMDRvOWwwTGhlM0ZaTCs4R1o5cDBybFozR2ZzZTQw?=
 =?utf-8?B?ZmpXZFkyM3Njdytaa0Vic2xveVFZMFJwc1JnMWxIMEVkdUFSemdnUHFUQ0pC?=
 =?utf-8?B?alZpSjhJZlduN1ZKRlhBQmNhT081ZmZTVEdwakFnZUgyMDFBMml4U1NPWkc0?=
 =?utf-8?B?ZEVtYmtFNG9xcmpEM0Rtb2had0k2L3hJVFZVOFBTRC9LZ1RFTDRaRU5CREJ1?=
 =?utf-8?B?R05yR2FQWnVLNGZLczJoRkdlQ011d2VjRythNDEyTENDUm9OSXVNNFVsNUhv?=
 =?utf-8?B?RmRWdUxvaW53NnM5eGtYNU1XUnZPTWxkUWU1WW5FY0FTZm5RQ2E0Z2lHV0tz?=
 =?utf-8?B?Q1pIcFlXT2JRMGtrelBPaC9TYWtrRzBjUkNnd3ZNZnFxTENva0xPOXBWbm5p?=
 =?utf-8?B?aU8yVjFlNEhJVTNnZUE3bGg1djZwYkF5c3lzS2x3Z3ZVL09ldlJBbWM1cU1Z?=
 =?utf-8?B?MGw3Mjl5TjFxbGlESlJWdEpSZ1A5R1VGZmYyaTk2bnJ4OURzeXgyVi9YVWtM?=
 =?utf-8?B?Yy9oazg5SVdPZzVJOENaR05KdjQxazBhdDE1Mms1L0p1U05QMmpQVFc1TWhX?=
 =?utf-8?B?SjN1dkxYRzZFWUJpOWlES1BMbFpJMEhyQ09JOGV5dEVnV1BWcWhZMWtHb1Ex?=
 =?utf-8?B?LzAyUEFSNGk5YzhZSGtiSzhJb3ZpanZ6UTcvNzBQYWhWNUdSZmRSa1NmZWxN?=
 =?utf-8?B?VllNSlBxYjBtQTFQTEx3Z2MyZjdZaW9uZmRtVWxOd2d4RUZEN3FGT01HZGQv?=
 =?utf-8?B?SkEwazVlU2lWZU1FNnlybE9aQS8wMGp6eHExRWpzYzEwLzBvODZqN3BVVnhx?=
 =?utf-8?B?dEdLZHV1WlVFd0NwNHVGYldVaEhncE4xTVF3RGV2Q25qWnMxYXlVdEMvMmQw?=
 =?utf-8?B?L1VZWHB4NWhJZklaa0RUQ3dKci9ydUF1QVUxZ0ZWYTNFOUp3REUwSmRUb2RZ?=
 =?utf-8?B?eWtFZVRpUEdGZURXcS9MenhpNVNSU1NLYzNpbkZXd2N0dlhqeHM0TmFydTlx?=
 =?utf-8?B?UG9WYnowS3czSWxiazFiTnJJQ0xwQ2Z0UHU4eVlyMFFZMkxBWHE3VWlRbXRk?=
 =?utf-8?B?b0E1RkJlbnF3VndHTXlwMzZ1dGI4Sm9LNVEzaVBMSE44TFluSTFtUENuN3JB?=
 =?utf-8?B?N1NRYzlqNE1VNFJpNkFNYUNIajM0dmZnR25YRHBLak1WS08zUTRmaWZxQjRq?=
 =?utf-8?B?ZkhuajJIMll3aWxMRUZlcndFYWRvcXg2VjFlci9VK2RYKzhoVjJrSnZhYi9q?=
 =?utf-8?B?b3ErTEdXazcvN0s4a2drd1NOenZNNjlxeEJxbkdOZG1oTGxkSG1VcEZEbmdU?=
 =?utf-8?B?Wnd3azhMb212Y2ZqY1k3eGV5OUJsT2RQc08rQUhCdElRMGpvSjd4ZVdERStE?=
 =?utf-8?B?YTVMS2tEdDlXREJCQmc4RDBaRjRuZjVjK2RYK2NiUnFCN1d6TXFEbGJBOERv?=
 =?utf-8?B?U2ZCckFHSk9BU2pSRWFFMkJSR3JwVGZ0R0NXdE9teThXNkNHR3VRTityT1FX?=
 =?utf-8?B?YTNObU5mNkFVV2ZnVG1WTHRlY2xZUkZpMjV4Vi9ZVU0zU1JPU2ZpMldoK2Fm?=
 =?utf-8?B?K3R6SThwamlNMFJqbFc4RDJlMk8vVlUxQkRsN1k4cUE2d1d5RTc2alRHeS9Q?=
 =?utf-8?B?MnhCcXhIL1FVZXBpYzJyd2VlZG91ZlUrYnpKOGxCaDNxaW40eGlrRTlEbUNu?=
 =?utf-8?B?Ym1qMkpicll6ZTJtS25oRDRBWTQ0cjBSOWU4UXZncjF0NnFDVTN0N0dkYW41?=
 =?utf-8?B?YW14ckpQTFRpUS9hUnNtY3F1Uklid1QvTy9GVC8zdWhJKzNYT0lhZVBIVkpt?=
 =?utf-8?B?V3owN2JJaGNCcldSRVN4ODltVmhsK1V5MElzMWdQak9zeXpoWENuNERhamV0?=
 =?utf-8?B?bWRZMlZnUmF1aTVPTWxjTEUwUVFoYWZTR1IzdFd6TlJrQktnYm1Td2hxN3FH?=
 =?utf-8?Q?4Ehd9KgQDgrEZn33GF4CkaRps?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ccf9870-e3d5-4cb4-0aa2-08dc64f07b79
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:25:20.7125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeMIu8M7VCXAkDsrbpn/v4/vZfxLVoXt28v5lB0C/DS5FDKx1uFaWX/6xk7Ml27A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5623
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

Am 24.04.24 um 18:57 schrieb Friedrich Vock:
> This adds GTT to the "preferred domains" of this buffer object, which
> will also prevent any attempts at moving the buffer back to VRAM if
> there is space. If VRAM is full, GTT will already be chosen as a
> fallback.

Big NAK to that one, this is mandatory for correct operation.

Regards,
Christian.

>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 4 ----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
>   2 files changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 6bbab141eaaeb..aea3770d3ea2e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -378,10 +378,6 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
>   			goto retry;
>   		}
>
> -		if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
> -			initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
> -			goto retry;
> -		}
>   		DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %d)\n",
>   				size, initial_domain, args->in.alignment, r);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 85c10d8086188..9978b85ed6f40 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -619,7 +619,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   			  AMDGPU_GEM_DOMAIN_GDS))
>   		amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
>   	else
> -		amdgpu_bo_placement_from_domain(bo, bp->domain);
> +		amdgpu_bo_placement_from_domain(bo, bo->allowed_domains);
>   	if (bp->type == ttm_bo_type_kernel)
>   		bo->tbo.priority = 2;
>   	else if (!(bp->flags & AMDGPU_GEM_CREATE_DISCARDABLE))
> --
> 2.44.0
>

