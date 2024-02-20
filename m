Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C7E85B59E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 09:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E0910E262;
	Tue, 20 Feb 2024 08:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TsrOgZSw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA51310E220;
 Tue, 20 Feb 2024 08:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfNp9QokiSkEH9CG+Nr/zz/KifodYEIP/jfG4A5bG/+P7tFNXNpwoyDfSugiu8VlW9N/LO+Bdwtmc9qVCWbAOoArxS6OYQ7H/a+eqX1LZ1K6M5/EzwmKhxNqmfZEWkcRQdqOnE/IZ6/GJ44peUYn4Zc1BpEpZZcyMQB65verqtAb477Ml5dJam/4Xi2hAawiAePhlGiSDdcABZDg9VxCia4FQu0B2Jj9WtRgQwl58P9BJauA1zMrgBS79QRiaE4rZvVGdFkiNTEqe/5rUfdbRorjHMtyd7aB4UllBpCzmxxVi0QTBVtyuzpCCXM9WqLEY5WgsNLHRK2G2q0u2rmaoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Pxmi53D8ZrO9pXhr3zzK0VK6SMevtIBo28Rh/lqIyc=;
 b=LP8f6XjIWoHJIf7O9tuinz+O88zpqpV83ga+xcLPXIBsqV7AluShyaLve2r+GQlFdMofJVxl+30fFd6DXiZGSdHHCzbfu/UpSwd/6mDzJ/7IMoltIRhIYyu4PSNiytyphiGaqwdPjD1XVdAJh7WBcN8kUwzYc5yeZMcqufPktebh2x8eDQ45rCXPRGau5gbqqKbrfwOmA3LLU85QYpmRjQUjgysg9J7tZnLdYsAKDNNENyqs1BRO7obrWwQWnvcE5jeYUebGfVm1TbtTDE1xTNuiC/G1A6InV1mBU1rnZgkIf6vqjN+wV5gcsAm+dO21D/XMlAp40bbmMtygs6kLQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Pxmi53D8ZrO9pXhr3zzK0VK6SMevtIBo28Rh/lqIyc=;
 b=TsrOgZSwiK6FfgGMsBsYVJeyYTyDXz4yV8lSHGq9ywTHuiyQMMV70RZ7qmJJjyeS0czeuvT+Dm92pBO0B3dSSO/yxBYx0Iihdrf52WMMkSg7R6dU908VeR7agglNmGigEXLyV+e3xI6DzVa+OKLJgrLesVcGHxTMLJUyUNHzEJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB5625.namprd12.prod.outlook.com (2603:10b6:303:168::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Tue, 20 Feb
 2024 08:42:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 08:42:03 +0000
Message-ID: <29df7e26-d7a8-4f67-b988-44353c4270ac@amd.com>
Date: Tue, 20 Feb 2024 09:41:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: Call mmiowb() at the end of
 radeon_ring_commit()
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
References: <20240220074958.3288170-1-chenhuacai@loongson.cn>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240220074958.3288170-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: 5866ded4-3626-4330-325a-08dc31efcf9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /g7exSPQNrvmCa40JZkqVJiCs49u3GqQg1kbXfs+Oq2p5cvmxlOKTgm1WInMtICJJiizBH6h5sHG5Q+xYO2VI5J1iLyiL7WNAvZXvLC6PwBHOAoljrFbw+r3uu9ePKvehq9et7Ihss4G9bMhYLE0PXz2+G6cl4dHXtguhTGkXm8wstu4ufqDyPEaIa5kgcvID9jRJ/fSx5mqP79Jjb6zrht/W1mC7nRkTChxxe/nDYkVuMl6MutLM7Vswkc91yo0RF5/o1F69G8wLdDp3cJgfNTvUJhhcRxnLAgxNQVPACH8T6H0eQAHvCMzVTqflqvaSjoKPKtxcg4ldUup3Lkf7D9K4SRANitk/M4UvXlJ5SD9RG+OOZrAGC/KVzFEHYayVTGnUK8QIsu4BatthquLYu6FNaIZRq2ODkYZZp7XlGVOP8XxIO+mt5dm90weMK50CrV36DOWhzcf5Kr2nsvclQ4MJdzFtWZQFp3iMoprTm5qGPXcC7cSlzhCJHv8nOq2zk5Ijx633mXIuMoWNWt9+fuDwlDYkxxHj3/FYy8wpUU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWplTjFCWGthcGhycSs5d2lNbmlPR0t1QW42TEpRaEJWNHZOZFlVeFpiSXRV?=
 =?utf-8?B?TlNKeGlmeDF0YUJla3B2YXRraVg2MmNtYW9TeFovdE1tRlR1MzBTRDNVUzF2?=
 =?utf-8?B?YUVzR3Jvdmpsa3U1SVBRbG5xOXQ1bXdlajVPRFhtL0ZKY2poNUhha1NGd3h3?=
 =?utf-8?B?TVB6dStzbnQ4ZnJZVGEyL1ZOMHArR0Z1RW1PdW5TZjZXTXZYTDRuYUhvS0FZ?=
 =?utf-8?B?am1DY2QwbzdJbUpTQ0s2Q2dOUHNVNkEvd252MmlaUFk1UmpFNU13M0ozMzdN?=
 =?utf-8?B?a3UzWVR6RFpvOUxRYVJ2SEtOQmhEeWd3TVY5K1NZenNlL2thN05ERU9HZmdE?=
 =?utf-8?B?dS80M29pQ1NTdHZjK20waGtSRThDVnZyQnRYSHU3TVR0aUtsYW5EN3JNSmw1?=
 =?utf-8?B?c0pPVTFrRU56ZXl6a1hOa0dQM0x6UFJNZkJ3ZEp0cURaNG54cnc0RDMrMS9F?=
 =?utf-8?B?R2pkT2cvNmtNWk5IZHRKcFRPVDZlcUNESnh5bHdGTjV5cGViL2JXbU42NExL?=
 =?utf-8?B?T3VXNmNJb2c2QklBUzIrMHdJcmhkR2k0REZnL3FITUUyR1E0Sm01bFZaNkRr?=
 =?utf-8?B?Nk5Nclc1a0o4N2R4ZUNqTS9IN2sxWjJINXhPNDAzZjg4SDJlNmJJaDFHdEVz?=
 =?utf-8?B?L0Q0YzduanRPcXRnbERpZHA4cGwrUUxNdVEyTmRkbDZzMUhwNDNYUm9UY1ZQ?=
 =?utf-8?B?cDBxbzVOSHlTUUNXbVlrS1NhQytwSE5YVGZUcCt2ang4Q01uRUFoK1ZjVTJC?=
 =?utf-8?B?YWh4VG9veW1vY3E0R0xGbGFVUXhmZjRRV09YVDBDMkZTQ2t0eVNQZE03eDhG?=
 =?utf-8?B?aUc3cE1HWlBWanBRYWNSVmg0RnpQZUJKT0Vhc1NEQ0grM2xEMURrNVVVdlZn?=
 =?utf-8?B?R3hVaFhBcG42aDgzYnVYYkpFWC9xcFkySldGbkxnR2VTdm5USEdqZ09vdlJQ?=
 =?utf-8?B?UUp1OHB5NXM0aXgyZExqTFA1Tk0xTldPN2JVQmxEc21jSUo4OG9lUXVBeEl0?=
 =?utf-8?B?MXdmR20wNG1HU05COHFHd043bTFJd3JTZDNQL3kyWElUNXIzV3luVi90M01s?=
 =?utf-8?B?RGs0THlzRjdCVlJudTVGYlhQS3QwY3dVZUF1MFNPWXZQQTROSWV6NW9Maml1?=
 =?utf-8?B?N3RqOHh0dFZmSUliY2psZGszZUEyUnh6ODhkZW43TjZPS2s0WHY5YUg4dVk1?=
 =?utf-8?B?QWI0SU1tdmZMa0IyRlRjR0h2RGMrZGpaeGpxQnE2VHl1ZkswbHUyYlBSdjR3?=
 =?utf-8?B?WU9LZTQvdnlReWpERGpmWjJWd2RxOHBLVmx6NWQ4dHZSR0czZGJSZVdSbUNp?=
 =?utf-8?B?SWprZWlMS21SZVJtMC9UV1gxSHVaYmxzb1BIMW9wNjNRdHV6ZXp3S1JxZmVy?=
 =?utf-8?B?L3EvTGJ5MFA3SWxydEhZeWtvWWI5YmZFQ3k4WkhHWkhhMDJ2UjQzSnhxK3dD?=
 =?utf-8?B?bDdXMUlsR0NXTWRsYk04MGl0Wnk3cTlRUjhHZExzdVpqUmlaQndsTFNxRTZB?=
 =?utf-8?B?SVlXdkRVTEJKcXBCMGtkRWg4WEV1U2s1UWR4bTVvNG9Rd2tTeGtRRXp4L09i?=
 =?utf-8?B?MW5MdWRndndYSklBSUhHblN3UWdPTTIyeFYvRWdOUzFhVEUvVTNuQ1pRd3hy?=
 =?utf-8?B?QVlLd3hJL3BHd0FoZ3pKYVdRMWRaUy9nTGZlZkduMlNtRElaK2FEbFhNd1dP?=
 =?utf-8?B?NHB1SklhL1hYV0dsME02TVhFUy81L0JFQzRZK0J2NURzcFJXTjViZjZrTVR6?=
 =?utf-8?B?ZHJ5b05xdDVxT1BncFdWNXpJak02NHgzWFlNN3k2M0FOazNIOUVKZU81Q0pv?=
 =?utf-8?B?OWJhejJFb1Fnck1vc01DNWFobE1hWkM2aXhta0hwUnpuUWdYUytLeG56Q20z?=
 =?utf-8?B?endlZUtkRVpBTnhNNGtreGZYOWZFM2pqcWNFU2p0c3RTdzlVNXF2TXZJQm9W?=
 =?utf-8?B?NEVoYTlXeDNGUXRxb3RzUzl5TUNnSS94T3cxWUdBcVJVZ092Zzdoempmbmxi?=
 =?utf-8?B?SlBITEtTZ1BKc0dCVG5DaGNlZk56MlBTOFkyeFQrU2ZsRElRcEV3dnlHT3ha?=
 =?utf-8?B?b0pyOS82bFNFMXYyRTdkN0ZzL1k2RFRMZjRtWmZHSUhkaDhxNS83dGJpNS9n?=
 =?utf-8?Q?V0q4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5866ded4-3626-4330-325a-08dc31efcf9f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 08:42:03.2415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hb6UwOfhWeQ91Dmvo+Lxoy08QcjmoY94KLAiz0ry3xUynHZb8do3DeWIE9KPor2V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5625
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

Am 20.02.24 um 08:49 schrieb Huacai Chen:
> Commit fb24ea52f78e0d595852e ("drivers: Remove explicit invocations of
> mmiowb()") remove all mmiowb() in drivers, but it says:
>
> "NOTE: mmiowb() has only ever guaranteed ordering in conjunction with
> spin_unlock(). However, pairing each mmiowb() removal in this patch with
> the corresponding call to spin_unlock() is not at all trivial, so there
> is a small chance that this change may regress any drivers incorrectly
> relying on mmiowb() to order MMIO writes between CPUs using lock-free
> synchronisation."
>
> The mmio in radeon_ring_commit() is protected by a mutex rather than a
> spinlock, but in the mutex fastpath it behaves similar to spinlock and
> need a mmiowb() to make sure the wptr is up-to-date for hardware.

Well, if your hw platform can't guarantee that MMIO writes are ordered 
then I would say you can't use radeon in the first place since this is a 
mandatory prerequisite for correct hw behavior.

Doing this here as a workaround is just the tip of the iceberg and 
doesn't really fix the underlying problem.

I strongly suggest to change your writel() implementation to include an 
mmiowb() instead. If that is to heavy weight than at least the mutex 
handling should be changed instead of adding platform specific 
workarounds to a platform independent driver.

Regards,
Christian.

>
> Without this, we get such an error when run 'glxgears' on weak ordering
> architectures such as LoongArch:
>
> radeon 0000:04:00.0: ring 0 stalled for more than 10324msec
> radeon 0000:04:00.0: ring 3 stalled for more than 10240msec
> radeon 0000:04:00.0: GPU lockup (current fence id 0x000000000001f412 last fence id 0x000000000001f414 on ring 3)
> radeon 0000:04:00.0: GPU lockup (current fence id 0x000000000000f940 last fence id 0x000000000000f941 on ring 0)
> radeon 0000:04:00.0: scheduling IB failed (-35).
> [drm:radeon_gem_va_ioctl [radeon]] *ERROR* Couldn't update BO_VA (-35)
> radeon 0000:04:00.0: scheduling IB failed (-35).
> [drm:radeon_gem_va_ioctl [radeon]] *ERROR* Couldn't update BO_VA (-35)
> radeon 0000:04:00.0: scheduling IB failed (-35).
> [drm:radeon_gem_va_ioctl [radeon]] *ERROR* Couldn't update BO_VA (-35)
> radeon 0000:04:00.0: scheduling IB failed (-35).
> [drm:radeon_gem_va_ioctl [radeon]] *ERROR* Couldn't update BO_VA (-35)
> radeon 0000:04:00.0: scheduling IB failed (-35).
> [drm:radeon_gem_va_ioctl [radeon]] *ERROR* Couldn't update BO_VA (-35)
> radeon 0000:04:00.0: scheduling IB failed (-35).
> [drm:radeon_gem_va_ioctl [radeon]] *ERROR* Couldn't update BO_VA (-35)
> radeon 0000:04:00.0: scheduling IB failed (-35).
> [drm:radeon_gem_va_ioctl [radeon]] *ERROR* Couldn't update BO_VA (-35)
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/gpu/drm/radeon/radeon_ring.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeon/radeon_ring.c
> index 38048593bb4a..d461dc85d820 100644
> --- a/drivers/gpu/drm/radeon/radeon_ring.c
> +++ b/drivers/gpu/drm/radeon/radeon_ring.c
> @@ -183,6 +183,7 @@ void radeon_ring_commit(struct radeon_device *rdev, struct radeon_ring *ring,
>   	if (hdp_flush && rdev->asic->mmio_hdp_flush)
>   		rdev->asic->mmio_hdp_flush(rdev);
>   	radeon_ring_set_wptr(rdev, ring);
> +	mmiowb(); /* Make sure wptr is up-to-date for hw */
>   }
>   
>   /**

