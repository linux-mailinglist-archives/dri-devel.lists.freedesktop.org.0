Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF724A5822
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBFE10E6EA;
	Tue,  1 Feb 2022 07:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CD710E952;
 Tue,  1 Feb 2022 07:56:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHlqAIpBhyRtBdtvdJkNqg/O/H4z4fCHrmWwl+XgNRSxKOsqo1N5Ovxc6+Jv6BaKfR/ApbzWyPmD+j6v3CqDda1pDase1+4fCXp/QyyhjcOz6yz7//ZyTbuYxtqzWQyJYvSg4rxixKrjF8rDq/3clQYBVao0skliPnu+ggQvrsHckJPBxu/Vuxf7o8eY5Eb47KMAGtc9yIOqalOdAjfvyaRsTBigpQAOwwlxgjhMu0+CClBOvIhTYG3Z8F2V9AMQpEpY5MSYB39610N2PyFOuHR15lReCfAfESvuQNb8jL4nKGvZqPugrxyQ7+0z2xxk5QkIleQhVRqjQ/w/HfPL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQbl0utcsInwkPllsS4Y/kzZowQg55At9NTCPY73+Cw=;
 b=ZAAB7p7amXZKD+nX5E1dMNp53jEWYnHrPi/7XY1HTZBpF4y879ND4Dj3zkBmp7MWtn697U5NBbSbscvIzhu3AzeIKi9Z7tG2OPsrddwF3NBAhKMXVFJj/C0IFPNdmDpFHLO2T/s3eZohzaDVBGoaubKQzZKROYDSVEqFgvxZm0UxDkiiEkRGs1bMAi4QgMGcDwjwC4WFf17XoIvAGGtbaBULYtguKre2jhsnVuqZVCG5d9iEuOon+LomZUPRtvjGGlM1RDvAu9XqC/LV10OOonIc0X33LIRAkkyldy7NOyrAixUtMisKrkaSoGAJquwySIPQVC5/IR2OiUBIrCoQDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQbl0utcsInwkPllsS4Y/kzZowQg55At9NTCPY73+Cw=;
 b=LbI2PaqEhzuFkjx+kj5Y6n3goxmqQyUKCEa+nyaDc1+aj0f0oc/kYtFGC4ZwU1zIDsrsf2OKVnAP3Fm2Mqgs2x6mxnwPKi8s2q1Gg+qHYa55ExewJ6FeWXbpojUL9c9LF7mcG5NJ7sypZOIw0qTsCFxGm4aqLfvcGAbaLGRk0KM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3371.namprd12.prod.outlook.com (2603:10b6:5:116::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Tue, 1 Feb
 2022 07:56:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 07:56:23 +0000
Message-ID: <7cdc2d3f-df52-f7a9-15bf-fe4bc01d3c4f@amd.com>
Date: Tue, 1 Feb 2022 08:56:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [BUG] gpu: drm: radeon: two possible deadlocks involving locking
 and waiting
Content-Language: en-US
To: Jia-Ju Bai <baijiaju1990@gmail.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch
References: <d5e4460f-7e26-81d2-2efe-6f47760b78d2@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <d5e4460f-7e26-81d2-2efe-6f47760b78d2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0050.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7f6231c-aba7-4258-0a79-08d9e5585700
X-MS-TrafficTypeDiagnostic: DM6PR12MB3371:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3371F2320CC6DC492243AEC183269@DM6PR12MB3371.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pXS1LB7MJBQUxhv8COisTYumkZc7b4AQonAy1dQMfvSwFFxqz9SBqMrvbSf5F6J6+C3TsUHRuxbAS321+nwp2kfKZBcEIkMRJZkeUmwCZKSz/wde3A8h07jO7g9/JVcWISsduPi3dwV5N2qVrXMrsaALqXs6snYlBcOFutsvbxSEzV1twXszolWOqdw1vaWSLbiBuMrmNqpGBuhhm6UapI+vH74TiaXH0wBSfLJB4bPF5sCY0p3K/6PltHrca5HHh4mAxeH2riNVfbCR2vPpJlI9lbWyxC3mwclBcmnMc8isFppbRTuZ6422vbpVDxgpTMS11C6/+fLWwaVTLU+61/CA2DmdsL/v0pnM64+BBJCzQnrzztgQyp+5rfTtu6+RT7beetJMsf6+pF3Yw1IASAmrky6P4PMT7xEUQ9NbkKyYrm1o3DRvT9PuqUBRIErNpdT+PVInkDPWkWj/iXdCGK2HPwdo6eOLR13LLUy+letPbeifw8EOJXAVOuvrmQNEOYZfUAI86j89mhXViT2ZC/gWncJ2S0HFrFw0ikU8K2upoGkKu0uKavFV3as3g9gyDXDlEMbnJMdPcNGUJYd3rPXytTLrJgFRWz8pBRxQVKflNSkHspE0JcIlQu2H1AnE6dPejLunIEd7ySEDtU9DbG/I3meuJFqqNXcIoqXUwO42+V1sND4vJ1LcAA7fFzj1JiHHqQhXqFB7ZR0P9saqZ8PSvRmTwfvTTM2DemcVpLCzVRv8LsXoRBf321Ok+GGo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(2906002)(186003)(83380400001)(6506007)(38100700002)(6666004)(66946007)(31696002)(36756003)(86362001)(316002)(66476007)(8676002)(8936002)(4326008)(66556008)(31686004)(6512007)(6486002)(508600001)(5660300002)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2U0NHBEeXVKSmhLajJqWkVUMkRYYnl0VzJUZHpjWm9FMXFpYVlRZk02MmhF?=
 =?utf-8?B?Vzc5enB3dklvMCtrZFFvdURXcDI3WER3Rm5Ua2lVV2xUUHk5MGs2QmxGbzB5?=
 =?utf-8?B?MEc1Y1VGTUlhTVE4VWM2dGhMalhLQ0hScE9GcjhleUtMakloN2E0WVFZWEFS?=
 =?utf-8?B?aUd5eW16M3luc2JrcU9EYWVVTWdOSzF0czI2K2xCKzl2VzEyQmNVdmhIaGh0?=
 =?utf-8?B?c1JJYXpyNnFXeng2ZG1hYVU1K0d1VWNjS3BMRjB5ZzdyV3d3MjhKOUg0U3pZ?=
 =?utf-8?B?Z3hkK2M2V2pHZFZUTllhOHM4NmZPQ1FXTTNISzJ6V01JTkI0NW9CbUxGd1lv?=
 =?utf-8?B?YzMzODRtdVUxN1JqSk5ldGRlb0xDclkvWjR2MS9LTmNWcDdoQy9DckxCaW5O?=
 =?utf-8?B?MUZkOVlNdGM4R0ZyUHNtQlgxRFhhNUVqd2Nqb2Z2czM1WGN0bmM3ZU50QkJl?=
 =?utf-8?B?YStKS3UzcndBMlIxMnRlRXdaT3FqUHJRbEZHeWd2aWlvaGhtNWVNM0VaUWVr?=
 =?utf-8?B?a0I0d2Rkb0F2UkFWTTg2Tm84NFBKZWZXajRyUjVKYU5rR3UzUTZ4YUFTR2ZY?=
 =?utf-8?B?Zlo0c3k2MnpUTURQZ3p3S3kxREU1cGFiQ3VvYXJ5d2IxYndwT0xLOTZuWlhZ?=
 =?utf-8?B?eUVvVnJ2aXpCVWx1S1N2TktqbXlqcnViMW5vY2RkQ2UwM0c3cHFOL2IwdUho?=
 =?utf-8?B?WHowL3psU0k1Qlg4U3FBamZDeVNVVHZqUlBrYUJPSEpmdW4yUldXREtMNndZ?=
 =?utf-8?B?cXVGcHVUcjFhcTh4VUNRcksreXM3ek1uRkVGeDlST0l5RmJ0cXNBTFFjZjM3?=
 =?utf-8?B?NUZ4dm9jLy9EcjdvSFJISjhDdEI1M0dKcDBXcGh6NU5IM3FJSDR0dFlXS04w?=
 =?utf-8?B?WStqTjZyUUVYOGFEeU45MXlQTU5zVFZodEVaTjVMenNIWTdlMGIwV2ZtNE0r?=
 =?utf-8?B?bFVrcURNRitKUFhRSkFwMEFHWmhxSUptWWw2dFlZYlBiYkJzZWdtdFBmOU9i?=
 =?utf-8?B?dnNuaUJFbElQWVd1R2NPTCtwU2M4WE5MenZkZlFCSERHdjhrRkJOUlFmL0du?=
 =?utf-8?B?NDZja2U5WXloYXdlOUJmd2hvR0RPRHA1S2ZrR3JJNUdMRW43a0tvYkdaWm5Q?=
 =?utf-8?B?YWNKYjNBMnpPZENvU08zU2F3Sk5YaUFlbXRhdTlEZWpWeUU5SWFjV2E3TFNT?=
 =?utf-8?B?WUw4NmdrUGp1SkQrY0VtUk9nVWFydWREdDNwQzFWZFlicXExbE82eVJEUkxN?=
 =?utf-8?B?amloTzZLWWJKUFNvZEhZdDNRNEdxWGNGUWprYVNLRzlqcFJvZnIxalpCRE43?=
 =?utf-8?B?RDFpeEM5RzAyK2xZeUdva3hRb0RoSThQNGtqSk96b3R6dm9DRHRWK1hLZ05l?=
 =?utf-8?B?d2tsMDVQTmw4cTdXbkdQbTh4V1VNdlJ0YWg5ZUlSeGE1SWUxRXhpQlJSMmVq?=
 =?utf-8?B?aTRBM3pKbzc3SEVZdzRIV3M0dzB3N1NadWM2bjdtVWRIT2R0MWNySDZhTEtG?=
 =?utf-8?B?V0RlcnJMaHFtLzFnZytMMWpzeVpXc1JhTVFic2pUdUd1S3RJMHJoMEVnTGky?=
 =?utf-8?B?ek9pSVBvQ3dDQ1hRL1pldElySEIvWnZQRW1vTUIzOHMra0pjaXcwK0laQlBW?=
 =?utf-8?B?NDJ5Y1RKcHpDenlVUnFkUU9VQXBvZmtBS0Z5R0ZZZmlhSTFxNnFTcm9LNEpk?=
 =?utf-8?B?NkV5T253NldEKzQyaHAwbGJndjNpd2pFQXg5SytwL090dk5aWURtYUV2NkNG?=
 =?utf-8?B?S3FiS1J4TFRmbzBYRWRBNmdyS2xGMHZzcExaai9jZDNsaCtXRjlHNERhL0NR?=
 =?utf-8?B?VGIvM3UvWUJkam5FSDlXbHR2dkhsM1BENUdac1JiVC9SQ1BzeTZrL1BTNnIv?=
 =?utf-8?B?VU00a1lRYVoxbHNSTWFIdExNWE9DMzllMWt1bFpPWTA3VU5ROWhZUzRtQllG?=
 =?utf-8?B?MXQvNGZFRUFBcFNVVlk3NHhvZmZ6VnhmNHB3dkI3citlQTFra3R2QWxFcUky?=
 =?utf-8?B?NDBZVjRZTnBQVE5CbnV3MnJncHRnQ0pLVTdOWkNKT050SXhEcDh6T1ZGUUFZ?=
 =?utf-8?B?QUhtaTF5RG5LM2FQRTNUTnR2SnUwUnpSMGo5UWVwVmZIUHg3MHF3WW9pdGdo?=
 =?utf-8?B?Wno4OUw0eStwQ2RtejNBOUVMNmptN3MxaklXMkpEVEU3dFJWRVV0WnVCUEpp?=
 =?utf-8?Q?5gOC8zH8F7um/Qw4Tsdeyh0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f6231c-aba7-4258-0a79-08d9e5585700
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 07:56:23.1170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TJ4PN2Ls8jgrwfbSLs3Jj/H+K2ixc5UDSeG8cDnn2qQ15Gf4LYN21kcNl2/RgeN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3371
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jia-Ju,

interesting that you have found those issues with an automated tool.

And yes that is a well design flaw within the radeon driver which can 
happen on hardware faults, e.g. when radeon_ring_backup() needs to be 
called.

But that happens so rarely and the driver is not developed further that 
we decided to not address this any more.

Regards,
Christian.

Am 01.02.22 um 08:40 schrieb Jia-Ju Bai:
> Hello,
>
> My static analysis tool reports a possible deadlock in the radeon 
> driver in Linux 5.16:
>
> #BUG 1
> radeon_dpm_change_power_state_locked()
>   mutex_lock(&rdev->ring_lock); --> Line 1133 (Lock A)
>   radeon_fence_wait_empty()
>     radeon_fence_wait_seq_timeout()
>       wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)
>
> radeon_ring_backup()
>   mutex_lock(&rdev->ring_lock); --> Line 289(Lock A)
>   radeon_fence_count_emitted()
>     radeon_fence_process()
>       wake_up_all(&rdev->fence_queue); --> Line 323 (Wake X)
>
> When radeon_dpm_change_power_state_locked() is executed, "Wait X" is 
> performed by holding "Lock A". If radeon_ring_backup() is executed at 
> this time, "Wake X" cannot be performed to wake up "Wait X" in 
> radeon_dpm_change_power_state_locked(), because "Lock A" has been 
> already hold by radeon_dpm_change_power_state_locked(), causing a 
> possible deadlock.
> I find that "Wait X" is performed with a timeout MAX_SCHEDULE_TIMEOUT, 
> to relieve the possible deadlock; but I think this timeout can cause 
> inefficient execution.
>
> #BUG 2
> radeon_ring_lock()
>   mutex_lock(&rdev->ring_lock); --> Line 147 (Lock A)
>   radeon_ring_alloc()
>     radeon_fence_wait_next()
>       radeon_fence_wait_seq_timeout()
>         wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)
>
> radeon_ring_backup()
>   mutex_lock(&rdev->ring_lock); --> Line 289(Lock A)
>   radeon_fence_count_emitted()
>     radeon_fence_process()
>       wake_up_all(&rdev->fence_queue); --> Line 323 (Wake X)
>
> When radeon_ring_lock() is executed, "Wait X" is performed by holding 
> "Lock A". If radeon_ring_backup() is executed at this time, "Wake X" 
> cannot be performed to wake up "Wait X" in radeon_ring_lock(), because 
> "Lock A" has been already hold by radeon_ring_lock(), causing a 
> possible deadlock.
> I find that "Wait X" is performed with a timeout MAX_SCHEDULE_TIMEOUT, 
> to relieve the possible deadlock; but I think this timeout can cause 
> inefficient execution.
>
> I am not quite sure whether these possible problems are real and how 
> to fix them if they are real.
> Any feedback would be appreciated, thanks :)
>
>
> Best wishes,
> Jia-Ju Bai
>

