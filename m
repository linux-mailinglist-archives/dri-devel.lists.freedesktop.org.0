Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F13469ED74
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 04:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D6110E195;
	Wed, 22 Feb 2023 03:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C2410E195;
 Wed, 22 Feb 2023 03:30:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqh3SBV+oWw+L9ANr9o5EKEUwDYvQlHrm2uWGv3C6rve38+L7wpQee6uJLXkFtVGv4XqRmsKcHJmugBttDWkjDVzcyaVBTFBbcIPHnGrkUpEV7NdLd0798d2AdRVKacY7A/dSV825h8VT1/eQ9aQ/FTNfD39hxV91aWNbyisbx068Ei83ROXervqRJAJQOjxxOLRPBWOI6rngUgIswpcTb1mIWs+gHbMhujP77EIIkXNkuykI+VKBOZidCyUNq92QaB3UY2qy5ZzEhqS3xWxRZld34NuipVLO4hNEvSpV9IJuW9GrgQ1/rt8amO/s0nQTEgzRdQzvFxtcNyFEvdeig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtVIca4aVGubJFnwGaMoyvp7Hwfd/xdHzo2YM4Z1qOI=;
 b=ZCwGZSFCFxdgE9dsNXS9F6nhcTnWXGNFQYko67J3BbP99B7pc9gq+/5MhfaRTmSSrnXKV4OU7rSdMdBNU6BNo2NkUtKagAztfS2sdOta2v8hV9G6Z62JOAkYQoMo6avYUgaNKtfJooobNvsaQeyrWcNxkr580QKH/f2wCmJjRb2N6YLFeMiDc1hZ6PUsnzKD9mKBS6CKDxs50X+h4mKLQzrlQ2z9hB+RJubxejMdOcqzCH3k4m22pueyrJYFOYwhSppW7EgkqGck80UMN0vHxDYahJmbvFqbYojpfJOA9wr+P+xqiz4ZjdIiHDotPOiM85GalEK/vrBBxKcQqcLqaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtVIca4aVGubJFnwGaMoyvp7Hwfd/xdHzo2YM4Z1qOI=;
 b=hJ73aL86ThjRYxe/nVXjdOG4jGSDMjsEkO6w8zrCxSMODVVHxArDYijaYtHLs5DeSONstHcGkXIsgGIuJSAQSXMLM4FlmEB2NXbGZNI5IMEDcZ7yDfpSGehg9SyE62qVdj8qYSybN7lFFjJPRD352Y2BGqHaj8pFXLqlj29OIhM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS7PR12MB8419.namprd12.prod.outlook.com (2603:10b6:8:e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 03:30:54 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da%5]) with mapi id 15.20.6111.021; Wed, 22 Feb 2023
 03:30:54 +0000
Message-ID: <5e2a1bf0-5a21-a4e8-22b7-8345049335a3@amd.com>
Date: Tue, 21 Feb 2023 22:30:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] drm/amdkfd: Fix an illegal memory access
To: qu.huang@linux.dev, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
References: <ea5b997309825b21e406f9bad2ce8779@linux.dev>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <ea5b997309825b21e406f9bad2ce8779@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0294.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::18) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DS7PR12MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efb0f33-bb27-4b46-da5b-08db14853418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2A0h6GrCLPmYnE/GcLZmkul0sA7rHMnZjEvFp8Pkjcj1kvSg5rFFDe5WFX0Uk2NP5qNKDqlLnBN0otA93iy4Csij4CQwD3brJFpDf6MlysHnampk+V/EWdsusiu54aplooGRbqvSHlwozIMZJ091XxFNgTe31OhK8+hSR2Nl2ymTQj2e4hsR9iI5TqGEAd5As+FWuYokopOvo7kzWFy05QwqO4ImrMAu2H81/2m4Vut2rZGwzhRJIumDQJpvfuXTLcpAGkFZbPYQ/tfodYzwBPDYVcVRTZZgZ/cQLGAGiIN2opvRJXpZxGoxZWzojdTHisyBW8kDB3mHwdRxstkC0XE9nDiNeg8tSGWoIfNHibbrQF4PZJBPqhQQseMAdZJ+KQv31hfTnKo23tatnhD0wn25kr6nKRzQ8lb5BgrTfSF2gqYMxCOzijeL+wfZtWaVTijlYMsTlUL1S7JzjYGA+ElPXgrfGT4jkcNR0qJXTYryW2dFEDiXFOtV/kfDB42x++3b9vpx5XHdoD5lHh4HBt9sWZHMPy+VNVbPlAhs0Pg/8qLpLe/oSwq0sFvC6OdfMYrW0yKmBM3sJngSm6gRgPQ4Yl47G8IGRBOMUnLg9C4ddbb9qsM0u5L5d4C0MG8KyrBAfR5UmCCoP0uIRm56gySjyNtuixxpsJ901ETNuowmQ+jzIYu+/PquicQTzOTkWoc27YQUrko8Sb+R6rYNO0HIIIRS44boF5OcvI5IZcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199018)(31686004)(186003)(6486002)(26005)(4326008)(66946007)(66556008)(8676002)(66476007)(5660300002)(36756003)(8936002)(83380400001)(6512007)(2616005)(6666004)(6506007)(478600001)(41300700001)(316002)(38100700002)(86362001)(31696002)(44832011)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0MvZU15SWJtNFM5dEQ1QW1SUVYvVmZiUjNRTVZnWXBxblZsak51UldQdm83?=
 =?utf-8?B?djBoZnNqN3lXOFZWVUZYM1llZFJzZmIxUHJqdllCWWIwM0hka29WYjRDeDBN?=
 =?utf-8?B?Y3BZWW5DWmZuVytNbU40MVpwbFJSYW8xYXFiNTBuZlBTZGE1QXFnM09pdVM3?=
 =?utf-8?B?QVZEamNUczJUMWwwTkFYS0ZCc1MzRFhJNG16Q3dpb1dXMWRCekpBZTRnZnlM?=
 =?utf-8?B?bEI2VFVCNFFwWTNneU1GZG5LQ3RYL21ub3dYWHNRbFJHejF1RWhwcVhoYmRQ?=
 =?utf-8?B?MnpKZXB5WDNYK3VBUHFNZGV1NGFIL1FXbXZYOGRvUENlaTVibHVtaW1xbjRE?=
 =?utf-8?B?bVlqdm5RY1JXVHVpMmxGYnVnYmJ4WitEazBoczhmSG82UzZGaVJUN2QzVGds?=
 =?utf-8?B?MFlqZEtpa3VCaGI1TXdOMi93MEZUV0Z4dXpkTjNZLzZXcmZhbkpRbWt2ekxB?=
 =?utf-8?B?bmFwUzBmejdCQysrT1FJeFRyc3JmN2lrZUJkcFI1U2FucTU1cUxLQVVUMWtK?=
 =?utf-8?B?ZWRDVmpyV29hTDRBRTF1ZS8rZXl2VFRLSkJjd2ZVVzNlcE5xK0c0NXMyOGZC?=
 =?utf-8?B?WmpxWml2UDZCTXhIUEhjb3VlTFlzTFNFNU1RdDltdGgzUkhpQ3Q4eFR1RXNq?=
 =?utf-8?B?Y0p6cnZVekxZNCtNWGZIakVKdUV3NjhreTNNTlo3Y1RINVlFam1ROTJhREVT?=
 =?utf-8?B?MzMyMmFlL3VxNDhJYVpaYmE5TDI1NkkvMWxCWjJXQzBYQ2VyQU1pdXBRTndG?=
 =?utf-8?B?VUJ0N1RWZW9kQ3BGemUyN3FLdENzem1TcmZBZEJhT2ZnbWxUV3VzUG1SYXpy?=
 =?utf-8?B?bFE0TzRaVks0OFFUZVNpZ3VqUmZYeXdUc0FhZUlHTWo0ZG5PTThTRlVtS3ZS?=
 =?utf-8?B?L1lpYS9XRjJzeU4xQStIV3c0T3VQZG13cVhrcEtaZEVJZDEzdUNpVkxOcXBP?=
 =?utf-8?B?R3I3QTBOSmV1RXdsaTM5cGNsSVl0SzUzN3c3QWN5ZlZjSWRzK0p4by9sdmlS?=
 =?utf-8?B?b01QVTVvaklmd2RlTjc0V0E4OWYvTFQxbHV4cHhQMklIaWVFZmxEQ045RkpK?=
 =?utf-8?B?NGxsVHViaDJZKzlJZ2szRHN4eW5iVldlQlZPaFg4K3BqUUUzT0xCM0hPSmhR?=
 =?utf-8?B?WXd3L2lBdkVzTFI2NFJVK3RrcHZUdVJzd2lnR2NTS0FxdXllVmtIVlFTY1ps?=
 =?utf-8?B?UWtQT0JqaGV5UlBvZ3hLZ2ZCVERqakFvTTRCRkgxMDhWWFhFVUVKSld0V3Ev?=
 =?utf-8?B?UlQ5OXYyQjFWSEpkamVmVjBWanQ0b3ZLaDZPZWlnRTA1d09aRVNWOTFHei96?=
 =?utf-8?B?RE9oN1Bla1M3c3JzV1lDL1ZJMi9QeU9FVW1lT2Y3Z2VUVmEzTzd3MGJlSFIx?=
 =?utf-8?B?UWhyWWJKeDhXTDF3b3phUzYxbkVzM2RQQytLUEFFeElnQ0dIb2ovSW1RN2xh?=
 =?utf-8?B?SVF2MWFINHRwcndFQnVIVmFWUHVwWlF2REJsdldFaTRHMmoyMWQ3UTRRdWQr?=
 =?utf-8?B?ZHB2ektuNktqVUFIczQzZjQveW4zOG1Xbm9uVUJzWEpoSmJsL0FhZS9CVzVK?=
 =?utf-8?B?UXp0Y2VTUjBpbnNqNmI5aFpkOE9tT2ZubFRxMWRpcTJRbnA2N0pZQ21PaFh4?=
 =?utf-8?B?MG0wTVg1QXgrV1VjTHRGMG45ZzN4Njd6bVdXQnFNRmVvYlpqaXZNbjF3OFl0?=
 =?utf-8?B?NTRvMGU4dVF6eEVleFBzb1dsbWp3ZkJJaTlPb3lrSk4zWEwxWVJtTStDQ0JE?=
 =?utf-8?B?aEh6Y2R6ZGJGMG5QYW5oTDZOZXdndGx1UVFwS2N0M1ByRnh3MnR1VDRaNGR4?=
 =?utf-8?B?TlBjRHk4M2VUVjl1OW9idVh5OGpaUTF6Wk5lYUcwT3l4dHhLSnByNkFZN09o?=
 =?utf-8?B?UWlLUkZaaThCQkdMQ1hKQU5BdFhQOXBBSjZEOUp4UVhLeG84WTJ5RXZFRUZO?=
 =?utf-8?B?YThmRE1LQW8raWJEbkNuMVFrdUIwem5UMDg0Q2lqaHk1U1hNajhRd3ZhRStD?=
 =?utf-8?B?TWllNXRNUTgzSkN2Z0tlNEhoR2IveFhGUVI5R3Exem1RMEMwakZ6UFhOeDM2?=
 =?utf-8?B?RS9NVW9Pb3NBbEl2bk96ZnI0OGVBeW1Wck41a0xBeC9SOTJjMFZWNmYwcEZF?=
 =?utf-8?Q?C+36xCYufyKNluLghZmKMf4Ov?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efb0f33-bb27-4b46-da5b-08db14853418
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 03:30:54.1870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xu9+Bgv7Fz4TMTANvX6KEYCUCMmJLf7Gp0r2Yy1sCj0tu4aWB1rPzPj1OCwtxV3FYyXzCjVENaj+CcbIcIpnoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8419
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
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2023-02-21 um 22:05 schrieb qu.huang@linux.dev:
> In the kfd_wait_on_events() function, the kfd_event_waiter structure is
> allocated by alloc_event_waiters(), but the event field of the waiter
> structure is not initialized; When copy_from_user() fails in the
> kfd_wait_on_events() function, it will enter exception handling to
> release the previously allocated memory of the waiter structure;
> Due to the event field of the waiters structure being accessed
> in the free_waiters() function, this results in illegal memory access
> and system crash, here is the crash log:
>
> localhost kernel: RIP: 0010:native_queued_spin_lock_slowpath+0x185/0x1e0
> localhost kernel: RSP: 0018:ffffaa53c362bd60 EFLAGS: 00010082
> localhost kernel: RAX: ff3d3d6bff4007cb RBX: 0000000000000282 RCX: 00000000002c0000
> localhost kernel: RDX: ffff9e855eeacb80 RSI: 000000000000279c RDI: ffffe7088f6a21d0
> localhost kernel: RBP: ffffe7088f6a21d0 R08: 00000000002c0000 R09: ffffaa53c362be64
> localhost kernel: R10: ffffaa53c362bbd8 R11: 0000000000000001 R12: 0000000000000002
> localhost kernel: R13: ffff9e7ead15d600 R14: 0000000000000000 R15: ffff9e7ead15d698
> localhost kernel: FS:  0000152a3d111700(0000) GS:ffff9e855ee80000(0000) knlGS:0000000000000000
> localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> localhost kernel: CR2: 0000152938000010 CR3: 000000044d7a4000 CR4: 00000000003506e0
> localhost kernel: Call Trace:
> localhost kernel: _raw_spin_lock_irqsave+0x30/0x40
> localhost kernel: remove_wait_queue+0x12/0x50
> localhost kernel: kfd_wait_on_events+0x1b6/0x490 [hydcu]
> localhost kernel: ? ftrace_graph_caller+0xa0/0xa0
> localhost kernel: kfd_ioctl+0x38c/0x4a0 [hydcu]
> localhost kernel: ? kfd_ioctl_set_trap_handler+0x70/0x70 [hydcu]
> localhost kernel: ? kfd_ioctl_create_queue+0x5a0/0x5a0 [hydcu]
> localhost kernel: ? ftrace_graph_caller+0xa0/0xa0
> localhost kernel: __x64_sys_ioctl+0x8e/0xd0
> localhost kernel: ? syscall_trace_enter.isra.18+0x143/0x1b0
> localhost kernel: do_syscall_64+0x33/0x80
> localhost kernel: entry_SYSCALL_64_after_hwframe+0x44/0xa9
> localhost kernel: RIP: 0033:0x152a4dff68d7
>
> Changes since v1:
>    * Allocate the waiter structure using kzalloc, removing the initialization of activated;
>    * '(event_waiters) &&' in the 'for' loop has also been removed.
>
> Signed-off-by: Qu Huang <qu.huang@linux.dev>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_events.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> index 729d26d..bb54f6c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> @@ -780,13 +780,12 @@ static struct kfd_event_waiter *alloc_event_waiters(uint32_t num_events)
>
>   	event_waiters = kmalloc_array(num_events,
>   					sizeof(struct kfd_event_waiter),
> -					GFP_KERNEL);
> +					GFP_KERNEL | __GFP_ZERO);

This is basically the same as kcalloc. Why not just use that? No need to 
send another patch. I'll fix it up on my end and apply the patch to 
amd-staging-drm-next.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

Thanks,
   Felix


>   	if (!event_waiters)
>   		return NULL;
>
> -	for (i = 0; (event_waiters) && (i < num_events) ; i++) {
> +	for (i = 0; i < num_events; i++) {
>   		init_wait(&event_waiters[i].wait);
> -		event_waiters[i].activated = false;
>   	}
>
>   	return event_waiters;
> --
> 1.8.3.1
