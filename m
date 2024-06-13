Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D387907118
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 14:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF2F10E129;
	Thu, 13 Jun 2024 12:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sJvxgZNf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74C210E129
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 12:34:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHOaZYJzJ39G1uflNBbYMPtmBNnolF8Q8Wn1PVtt430ZqsF32kl6IprtPBpQ68BmzoGlWrouySU4aKIcUlyhQHai5TAVU8PmeroPw+BC5YGOLpSb8QAYY5AK3i3yvdJUt/EuKLlsmkzO4cy2iX5HnaPgIisovIN707FkoJ8fChBUdMJjzBk0LUWND94NILum2+LyjKqryl4/SrNjitJbBkkfcXgPCC/1t6X7fRSB3s8Zpeqv/kDBs4aJ+x+MG0pbTAEQmZ2evCwRh44din40I2cku3U4jvqJyuhnaOc3gT236MauaRWX8W+X1/uH5lDcX4FYDlStMM8IoPwsR4aQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UlvISsL9syuOBqGxiGS9QaDv9QWmS3pQ/qWWepvdVI=;
 b=EE9eiEyxWhc4vcKWKCFgd8PXn7jZYOhyoaQRTOjwuCFVVS8dQJVYX0xAxk3ZcOuEBg7puTMZTcPDsYh2zx3djmnAWqMc6XVUia7oNRHOOqLpD/GrdFf/ff9PRXiHtn2eMVLk46ajulrXEpo6LqcyPpmkcbIdV5I6uJgkH9XnQ0vcn583wnweINicOYujbBp9v8TeOGla18HoXnvlBwhRYOd8PD90bubf8/FaaKigNz8Sl60WSXeccG0KisS3xsjrpoWlaHbuFhtGMMKjZVmpD/D4rabGOEPSRBrtjimnsIBeqrqtep7tf6i2p+tgy3svJyYFnp3J4Ewl1+kcuIBf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UlvISsL9syuOBqGxiGS9QaDv9QWmS3pQ/qWWepvdVI=;
 b=sJvxgZNfm/2C+fRRYYYSZgvNr8F7exJmJHgtvqA64jZK7xeuYmsnLuMTbZxjsVHO+W3pg9KnYNpqtpKr+f+KfgCw8vzIvYBr0h6b6uVQUUJaQKPshnkcH9sVtEDgyPic6kLfnpQfbNyH3Y0Now4/LY6R4lg3ReseoTGNFh8r51E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by PH7PR12MB5829.namprd12.prod.outlook.com (2603:10b6:510:1d4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 12:33:59 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%2]) with mapi id 15.20.7677.024; Thu, 13 Jun 2024
 12:33:58 +0000
Message-ID: <8ca924c6-cea2-4bf0-9b4c-b216d11683fc@amd.com>
Date: Thu, 13 Jun 2024 14:33:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH REPOST] drm/ttm/tests: Let ttm_bo_test consider different
 ww_mutex implementation.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20240613064716.WxAIvb9K@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240613064716.WxAIvb9K@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0258.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|PH7PR12MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c6e84b-b14e-4cf3-98e2-08dc8ba5186d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|366011|376009|1800799019;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1R1MWVFaTNNWlIxeWJscUk0VHZWblJtZHJ3N2I4WjFLOWhURUhXYkZtS01G?=
 =?utf-8?B?YUFwZHlSellhV1JTbzZIR2Jxcmd2L2xKU3U2YnRueG0wVXRBYlcvVmUxdTd0?=
 =?utf-8?B?VFJEK3BTREQ5TDNXNlJKT1NwZmtweXRDVEc0WXN2SW5sQmpveWhaQjJNV1dW?=
 =?utf-8?B?dXFvMHlncktjMUNVR2xFMHNnbnVhTUJBWDJBVVdvNnU4MzV5Z0RXV2hXd1ho?=
 =?utf-8?B?RmZhWFFvdHcwU0REWTJWazBDSVZjeHhIa1lZdU1zWjNYYXBHTVRPU1VGQm1B?=
 =?utf-8?B?MGtJTC9QUmRRTGplTk1hSmFWdVZrem43VG5rUUVUWU5DZUlUOEJpTWpwSWF3?=
 =?utf-8?B?cEZYVEpYSVRPYVcwQnR0Ni9nMm5RNmdCaW9TRGswS080djJic2I4YzdVSHBP?=
 =?utf-8?B?ekRtNWpSUkltc0tiVmVhMW50em9Ca3RVNTlDYklvT2FJN3I4SDdRQnJpTkZJ?=
 =?utf-8?B?OXVENlc2dTVETkxZeVBOWUNVaFBlN2ovVzNJTmdDYlJUNHFPeVRFVm44UmVP?=
 =?utf-8?B?bk54dThwck5pZFZRZWZlYU1oQWZ3bkwzV24wRVh2V0hJcGdQeXJNMjVVN0Fp?=
 =?utf-8?B?eVJYb2NEeUlXWmw4QWIzaFFIZlJMdUp5MGZSbTYyMUVCWUJ5SkcwNWZreUt0?=
 =?utf-8?B?UjdTVE1OOEZyejhFL1VOdjN5M1BSMWkvMUFKRW1mampTRVJGYlNvbENBYlhq?=
 =?utf-8?B?SGlHYWNLQTJkUSsyRkp3dENEVEY3MmE2WXNtYjZqVmlSQTBSK1VZY1FBS1Uz?=
 =?utf-8?B?N3pnQ3NqSlZyZlFKK3RiNWZqK2prLzdBSDM3YlpmcG9DTlV1ajFidjBrUW02?=
 =?utf-8?B?VnhvS3BOUlNvMmptS2wzSCtQc0MwNjFYR09TQVlGYmx4dVZwWVMxLzFMb2Jz?=
 =?utf-8?B?eTVuQ3VvYllEcEdkc1pDUFptSnZRS2pkSHVoTGV3WkNkYllOSUtmditLMDRV?=
 =?utf-8?B?akJoNHd3UnlQc2VybmUvbzV3V0hNbC9ub1hrSWlDT2RFRGR6QlZhTGF5Snhz?=
 =?utf-8?B?UmJ3TDRydHhFS2RNTUlVSkFZd2Q0SEQ4am4xcWxsRlNoeGlxU2NBTDBkc3Ev?=
 =?utf-8?B?a0lpcmU1cytmdWh4WXA3d3J5dndpankycEhXamhuVFg0dE9SZzgzK0ZXRTNh?=
 =?utf-8?B?V3NVajQvWC9lTmphWkN2YnIybnBxcGFGVGowRWZOWVdJa0dtT2VnUk9Hb0o3?=
 =?utf-8?B?VTQxdThWY1dsZ25jVGZleVZhTStYR0Z2L1Q2Z0huVXFvZlgxa05IUE1iWVd0?=
 =?utf-8?B?aWxwZWlpTmpHWVlkRG96YWdPR0djUjdUcUhDSHQ3aHhDQzV3VFd0L1JUZGky?=
 =?utf-8?B?NzhqcysrMm1ucmg2VExiTUpMVkkxcHVTL09CYTFZQncyTzBpdVN4by95UHU1?=
 =?utf-8?B?cGF4VXRobGtiWWtnT1dLbXpEZGIvUDRNd0ZiUzhTbjMrZEtJcUdZSHl6LzZ0?=
 =?utf-8?B?YWlobEdlVGhnQlRlaHBTdUljR2QvTWxUQ3RqVC9FQlREYUkyM1h1UEFwQkt2?=
 =?utf-8?B?TUVMalQ2YXFQWWZ0S1VVakVBRnNPNFBhSmN1N3pKUmt2UUtIUjNESnNnQVNU?=
 =?utf-8?B?TDBReG9SREVETlQvdnpDcDdXbzRzVHYrM25uZDhBcHp0aWt2M2ovZ01ETk14?=
 =?utf-8?B?N3Q2UlRIMG56QWQ1TzB5MmtoMUxObzBtVkFLS1N6d2xMcFgwNXNpQ2dFc242?=
 =?utf-8?B?UmMvSkY5MmZoa3JubGxRVm5NQUZEdWY4VmFBeStLM0haeEFqRExVZ01RZjA1?=
 =?utf-8?Q?ig7+nmdmatji5K+hLA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(366011)(376009)(1800799019); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3J6dmNjb0UvZ2FGaGRTbWZNMGhCWmFTZkhpUWtXSlFCMDVWWm9ENmltZTNF?=
 =?utf-8?B?TFVzRjBySjZtWjlLck00amZPUU5ocG1jdjdNYnZBUlVGZmlYWmE4NERtWjM3?=
 =?utf-8?B?MnZnM2lsMHl1VkVVUmgyVXJxWHpMa21meFA3VTJVNzIrY3FBSWFUY3FNRGVz?=
 =?utf-8?B?S3lLYit3UVVHNFQ2QkxDME1PdU5FOUNwMHVZeEhCTm1xZUtZb0RIT2hONldW?=
 =?utf-8?B?WnZDYjF1azFMTnJjNlUxQmdLcFE4eThuTzFCRGs3ZXg0MnFzYkhmNDl0L0cw?=
 =?utf-8?B?dlBmS0RPTG1mTnIxSWJWOUd2Q29CaEN3VXZmSUtvMkljY2cwaWRWK3pwSHd3?=
 =?utf-8?B?d05pdzk4cW4vNDB0WEd1OW9kb3VLS3ZrUjVEeVUrUUZydFNucThYd3NRaGZp?=
 =?utf-8?B?QWNEc3FPMUovUThTUmQvSHcwRnZtOGFrUktIbXE4c3A0RGJ2YnUxYVRDS3dZ?=
 =?utf-8?B?WlhqSW9oQVVhNXhMaFd6RHJabHVudG5oQWpEN1pGZ0NMTUdub05KTnhLS2Y3?=
 =?utf-8?B?TkRJcE5sT3gvWjJ0aFVsS244ZGtET3JtaXVHN0hsVDRLNmNIQy96SzZFTHVC?=
 =?utf-8?B?b0ZKaFRKWE54Wk5zcWNlTHBSc3ZVU0VpUGJNZGg5a2s3Zm0vZTJnUngrSklD?=
 =?utf-8?B?cWFkTER4MnZ6bWxwQndCT0xYWnhDbzNDbUZ2SUxJZDc1MGxmM0c5VHcydGNU?=
 =?utf-8?B?dE1GalpPUTBHaDFzdFR2T1liY1ZxdVFlNDVGMmpHRkxNN3dKajY5VkNYREE2?=
 =?utf-8?B?dHVHZ0FjQ3g4bUZKajE4dk0wY3laSDdISlcrM2lHbXJnNGZyUmgvbENSa3Ir?=
 =?utf-8?B?cWd3QVZ2UWg4ZkNVUG96MmNodmVIVDA3ZlBxOFhLbWNrZ05PYWtVdG1ZbWlB?=
 =?utf-8?B?RkVvL3dJNkMzQ1hTL1Q3d083UEFKTDl3cno5ZXFPM1d2Tk1XWGJiQjd3L0Ry?=
 =?utf-8?B?OXF3Z1dmV1I2Mk1oTnh5aUxpM2J4VElFekVRR0NoVDZoNFh1YzFhUVVVRXA3?=
 =?utf-8?B?eTc3YnR5dklrOHJBbmtkWGgxOHBDTC9LTzJmZFRzUGtVbGZqWXBMcTBOVTFB?=
 =?utf-8?B?V1p2Zk85ZXJWdFpPaTBmOWY4Wjc3WVVtOWsyZ2JaMTZXVnNycVVJcyt1NjA2?=
 =?utf-8?B?akZoRHh5Ykg1MEQrNVJuTzlVWEpKam1LSWVTK2F6b3J2clFxb05CQkIxWmRE?=
 =?utf-8?B?Y29Fbk95RUVnbGpTMjZnSGh4SElRT2plS1BMeEdYSXNpcTRQOTdHbFp0ZTV1?=
 =?utf-8?B?cEd6YzZJUDJHem9KNUE2dlc4enZKb0N4bEtoa1J5bHpKdWgxWkY3eFovVGJC?=
 =?utf-8?B?YlRqQTByZXN5dEZwY0hNcDMwSWMybnl4dnBUYlh4OTdJc1EyeDE5aW9kOERE?=
 =?utf-8?B?dEk1TXB1Q0pXa3BMcHI3MndSN0p4elRTL2dWSHU2Z1hkWU5GMnZVNDE3dUxR?=
 =?utf-8?B?MmpTcnBPcXhDQnRLekdLNWhmR0hCWnE5UVhJUlYzR3RqOFh4RUJFVWFWcDRu?=
 =?utf-8?B?ZFp3YTVBOW9vZ3pZOGZBNm5XNHlCSlBOVlVqeWFrV0RkUEx5SVVGTUFmUnNs?=
 =?utf-8?B?NnpTc0dobjdvbXNHa21ndzdaQzZLaHorWE5LdTlBUERvSHZzclZDeTlzZlhy?=
 =?utf-8?B?MGJEMnROelFNWURqL21VcUUvWU5vcmppaHRLa0s0V1M3N2FqOVNVYXhMcUY0?=
 =?utf-8?B?Mi85TVM1OUJRaXJVTVhNZFpya0I0bnMyVHlYeDRMclQyNnJiSDJGK0R1dG5x?=
 =?utf-8?B?V090NDBpeElhK3BrMDVwZ1Zwd1FheTU3OGUzK0J2dnZqY0Z3S1d1ZG1HTEU1?=
 =?utf-8?B?WCtaTUtkemN0VWJvNllYdFB0R1NJVktlZDZieExQRW9BanBldzltejcvc3RS?=
 =?utf-8?B?cnYxZWUzWTJGRjd6dVUwV09haGZDSFpUejJ5aFdZRHJkaGw5dGxZVUl2Ynhr?=
 =?utf-8?B?WVlvRVFoaFNuUTNVUDl4YjVlQjY2c1hIQUVYSkZYZmdwZkxzbk94dkJoNGxR?=
 =?utf-8?B?NjBVMS9KaEdDendSYXJOSmhVRU5PdWV0MTBrYUdSdjdTdkdJMC9hSmpMZnIr?=
 =?utf-8?B?VEZKNU5LaWRwVzFTbGhVTUNjeHRmcHdsbzViZnpUbVBrVzZaTzVJUXcwdmtU?=
 =?utf-8?Q?UTfO9W8bKMsCUFqrsaeEkVGZ8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c6e84b-b14e-4cf3-98e2-08dc8ba5186d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 12:33:58.9285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdK0W/s9bZqBPTDZ6TyTP14xVb/OYY9Htem5qQ4XmElFOJSoWiGzmASUbl3FwvsN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5829
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

Am 13.06.24 um 08:47 schrieb Sebastian Andrzej Siewior:
> PREEMPT_RT has a different locking implementation for ww_mutex. The
> base mutex of struct ww_mutex is declared as struct WW_MUTEX_BASE. The
> latter is defined as `mutex' for non-PREEMPT_RT builds and `rt_mutex'
> for PREEMPT_RT builds.
>
> Using mutex_lock() directly on the base mutex in
> ttm_bo_reserve_deadlock() leads to compile error on PREEMPT_RT.
>
> The locking-selftest has its own defines to deal with this and it is
> probably best to defines the needed one within the test program since
> their usefulness is limited outside of well known selftests.
>
> Provide ww_mutex_base_lock() which points to the correct function for
> PREEMPT_RT and non-PREEMPT_RT builds.

In general good that somebody is looking into this, but I can't even 
judge why ww_mutex would use rt_mutex in the first place.

So I don't feel well reviewing this.

Regards,
Christian.

>
> Fixes: 995279d280d1e ("drm/ttm/tests: Add tests for ttm_bo functions")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> Repost of https://lore.kernel.org/r/20240404102534.QTa80QPY@linutronix.de
>
>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c |    8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -18,6 +18,12 @@
>   
>   #define BO_SIZE		SZ_8K
>   
> +#ifdef CONFIG_PREEMPT_RT
> +#define ww_mutex_base_lock(b)			rt_mutex_lock(b)
> +#else
> +#define ww_mutex_base_lock(b)			mutex_lock(b)
> +#endif
> +
>   struct ttm_bo_test_case {
>   	const char *description;
>   	bool interruptible;
> @@ -142,7 +148,7 @@ static void ttm_bo_reserve_deadlock(stru
>   	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>   
>   	ww_acquire_init(&ctx1, &reservation_ww_class);
> -	mutex_lock(&bo2->base.resv->lock.base);
> +	ww_mutex_base_lock(&bo2->base.resv->lock.base);
>   
>   	/* The deadlock will be caught by WW mutex, don't warn about it */
>   	lock_release(&bo2->base.resv->lock.base.dep_map, 1);

