Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB526D5B9A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 11:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A290E10E14A;
	Tue,  4 Apr 2023 09:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA2E89153;
 Tue,  4 Apr 2023 09:09:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8630HxQxjDsfJnu//2GYqykv9KMHPzJtUARLfpTirLkMvDmcl7QkvgIXQA5JwE+FlIYTh2XzpTg4+Mgwhv7b6RTRdXIWG5xHkoSq3ML/fiaTB9hUKpTS99x8a6RFAS+qYRXqV5HJApL5oGrRu98sYRYUXJTXepEwsh2CKhuoIomjCcdylN0YeJTCqJTTeY5Lztpk0BZtixWkHmX4j3z5cOS7mBgjfCoMfmnINjGAMVbKM3E4mBGuN6fnC2ZbptBMUsaD2gNwoK/drDs0E9x3tsCG0JFjy19//x/hpGuBp/tRU4fJr/dtTkAYpHnCt1c7wzTkA/Ice+ulgbQwhMFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yipvJyn2IJbdBYLKppmEHNkn16axZr1vcwTQ+MzXc+A=;
 b=B1rEriRLEBWWYVPr43xL/0RZBPF7dVXgE8T6KgZvtlbYlismcfOJELkVFSg/W0XVjawRh9Y3f3trxTDu5Eai5FOf+kq8j/8Vjpg2xCz8l0rvso9hEfIb4HdtpEYviLgJmhhcr5izVpw/Wp55280anAajSyns+fwUlXyKLk1v8TXwV5QRfKLEPDsn4Sx13/TiGOliyoUktz8ypaS3pmNWEQA5ab0GULEYsA/JdiItegfRVpahN1u0nC0nbWndmj/e6XUEGkszaqQxIRJpOAGubJjzOpl3+l7hiI3fbPaqKV4ULWd3dH2lavB7BHk5k3iyI+Mo+wGjq908U5x7bg+Etg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yipvJyn2IJbdBYLKppmEHNkn16axZr1vcwTQ+MzXc+A=;
 b=fsVs6JJtT3SSyTCG8d+Jyf/F6poK33IW8ObbgI26Iq0/m47i3RMoKMHlUiBgREsUa8Y3OaTg8j5XI72Z9np0PAJrlmvicMRk2rsSOXbtKO4W7as1/WJJH2+nznR1QrDrFrThdEdM5rQVhEkUww6aaXnwlLoPatouufZBQ/AH9ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB8264.namprd12.prod.outlook.com (2603:10b6:208:3f5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 09:09:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 09:09:57 +0000
Message-ID: <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
Date: Tue, 4 Apr 2023 11:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230404002211.3611376-9-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a49581-d256-425b-7ede-08db34ec5c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GGjcy4FxtG0ryY2g4CUaVSN+CAPKf+ngKZhd2/YjXimmtNqmuXOy0ljHM9sy4TuqC0+f8ep6mWZLrzXIogn7mk3OvvhPIJyd9CKXvi5JIO3cXBiN3tNXY0bXmfTHWZf79vBlU5X57CdtFNqYnhlzyCKziwwg6rMyIYNgPC4yxd+19ItpAYbX19HnTo4f9v5efWmwQOUP6qegNV4cl/2plZf49y1RbHyKtQOBaYCiUYS6RulH0eMWk7BZS2FJkm7k1ujynkquV7Eg/bohcs7dPGqjsNd3ckedz+0a4BaNAElELSDW2dXgxyJpWkpNKL2W4hQbkwGT/6lNgfAEmOBsID3RMcTIMqNEHiwwiIFPG5RfqcP0RcY1GNEaPF5LdCHYviAHvfJWq54HHh2lWReL8RX+Vm8nXL5GqG6mk/kDInVA6XUGq4tztOkBKF3E2hE3hsLP4jDntUOxxa3+N2KYHadafMIvoR+V99ynuWQ1lohApK9X8ONDoFddc4Sb4fiE5z3aMXzeLH/9h8N/mjobBNCudlcUmYrYsDMBc7WvXto3VZSqiyHcBNuWPeYOVcStgp5VqiQu581f98VJQjguYiPFhEMvbWxyMvhvfe7V89wGlCtI4BfvNU1cbvSygcraQbbb6iGZvJmmw3YRVakdOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199021)(4326008)(66556008)(66476007)(66946007)(478600001)(8676002)(8936002)(316002)(30864003)(5660300002)(7416002)(38100700002)(41300700001)(66574015)(186003)(83380400001)(6486002)(966005)(6666004)(6506007)(26005)(6512007)(31696002)(86362001)(36756003)(2906002)(2616005)(31686004)(66899021)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1lJR01acjFaY24rMmhNRjJ6d01ZdlNtYzJpUVBQdStJeDg4WUF3MEVXeTB4?=
 =?utf-8?B?ekFuQTVsN0JhZE44OGlsVnc3OEN5d1Qyelh5VnYvckRGRGNZUlNlQ2RxUEl4?=
 =?utf-8?B?dXBBdWtVRUJCTGx3aGRoRk0vbkpvbUwrUjdxSEJIcHFVb2VNRTBXZGQ2Witr?=
 =?utf-8?B?R1gybTYwUG9yblRHTDcrdmU3bWZkNXVzeGlDeDFaRjNhOFJqWnhabDZsK3F6?=
 =?utf-8?B?Zmd4T0dBZ2JqMk4wM3p0S3AxZ1VUZmFWVGE4SU5IQVpPencyVVQzQUhaaVRM?=
 =?utf-8?B?dnFTTElWWFBZT1FubnNMLzNSa2dwRm02WG1XanBvSkNqZStWQit2UDFtak9j?=
 =?utf-8?B?d1BIeDh6Z25EQXJjNDN0QXVKd1lGVHlUNnFxN1VLOGdVSTBmbVJ2NExBdTAx?=
 =?utf-8?B?cW5xWDZLVGJveXlPa3FmOWxyNTY5QmZycTlURzUrTmRlZGl0ZFRYTG5yUHVz?=
 =?utf-8?B?QldhQnpxVjBkZGNHUEtwRjFzZUl1N0xqUXF1d1lWdTY5bnBZNll3RTYwbXMv?=
 =?utf-8?B?dVpZSUdFTHNBSUJ6dzdIZDBxUWRpT2Z2ZnRXMTdpQVBvR2pYY3pjY1o2clk2?=
 =?utf-8?B?RXV6QUpLVGRLOEJSVFF0ZTVDekREUWZZaE1jQTNrSEtuUU9leUZBV0Ezb0lQ?=
 =?utf-8?B?R0Y1Z2NrVW11Zk8vdVhFVWltc1lkbnpDUENUaXdlbEtPR2xDNzJXbXkzSHR2?=
 =?utf-8?B?aGhJRndqNlZWYXdyOHo2d0dpeEF5SXpKNWY5S1hNdjV6a0xIbUFoWWpvRDNi?=
 =?utf-8?B?YTc4YVNDaXZXZmVVanNRWnZWcXhicEZtNHlkSGhyYlY2cDZhL0xBNVFZeU9y?=
 =?utf-8?B?UGxaVllEWDF6VzNUUTg2T3BjcEh2MlZVamlyTWhGZkpqNEtKWVRTaU5IV2Rk?=
 =?utf-8?B?cDZpc3dMSGF2YTdKNUlKSGlvV2M1VFNXbzlKckFXcFhpNHoxdW1XVFpHbEpF?=
 =?utf-8?B?MFAyK3kzVThvT05MUDJGRkhTeFlIV1ZUQ2JnSjY2WkRFdUtubXk1b3NJN1o2?=
 =?utf-8?B?NXhxanpycitJTUZmd3dmTnpIWEozWFUrR2lMeXQ3YTZpSjh0bFBHZGlPb3F0?=
 =?utf-8?B?dTFBRlpFTFVSZEFYTm9tTENmdHJQN1dKdHRQUjJrL0ViaEN2RUhPWFlOa2E5?=
 =?utf-8?B?WDFLQ25yaFRha3FNVkdhZzhScThVbEFxQjhIY0g0L0dYL0FpODc2Y3JuYW9C?=
 =?utf-8?B?aVNld1gwMmJmeUVLS1ZKdzA3eUNkbnF0M3ZNNzJRbWtUYXZhQzNMTHdxbUJE?=
 =?utf-8?B?TmdMY25CVWZaam9Sakx3TUluSmtFOGFKM1pUT05LRGUyWTdtaDc2NXVYbjBC?=
 =?utf-8?B?b1VsMlBLeUpOdUFRZ25nVkp5bVErclVCMC9pRUMyYmMvbTdxYUpjM2FOcmhY?=
 =?utf-8?B?WmY5aTZyMjdoa1E1ektUYTB4MUxzdGw5NERjaHdLcTlVL1hyQmJyZktudUxP?=
 =?utf-8?B?Zkh5cDNUZUFtVGF3cTZmZ29IaXRMMXJSaVBTbStMMHd6Mlg2cENMcE9BT2kw?=
 =?utf-8?B?eklCUTRvR3hXTGlSTHNVRW11QXgxRjBwd0ZDcXpjTGF4Z3lRZUc5ek9ZbjJs?=
 =?utf-8?B?TUZxbzhNa1QvMWRoM1ZKMXFLTzJGN0lKU1dFU2cra0hmWCs3aUZKTFpNZUNH?=
 =?utf-8?B?aHdRd2Flbjd0RWlOQVdmblVXL1ppNkRRMUtEdFJwckhUM1NCaElTUWIwSlNx?=
 =?utf-8?B?ZGwxUzhhZGVQZHYxNTNKSy9LWDloQ0NqNGpBbmx2SDRwdWJNbXRFQ25RVE40?=
 =?utf-8?B?cnZjZlBaSDN4eXZPQng3c1dnRVRRZ3NPS1FZOEdPc2dCY2hMV1c4MDg2WkMy?=
 =?utf-8?B?NEdWNldZT1czUmpEQitDT2tQbzBqQWVKK3hEWkZjbTdodTYyU0M3T2k0Titr?=
 =?utf-8?B?UHpNRWVHdVpvZGlzZHpVTEZ2ZUdmVmQvaXNpRExHeFVrN2lGNURLOXV6bjBS?=
 =?utf-8?B?c3RHSjdiclhKQ0FOTE5NUXdOcmV2Z3k5d0VPallKL2wrbzRZblhMZ1U5ZkJy?=
 =?utf-8?B?Ymo5bEZJTGg0enc1c0JEVnJ0NWp3R2JxYU9OM3V6ek1NQkpIK3FTQjVDTmV2?=
 =?utf-8?B?ZWZIQUUwaEtRWlJjUGsyYXViMEkyaEZBNU5xYkZrdks1bkFiQlIyYjBWUWpW?=
 =?utf-8?Q?Q3ta+YrsrdwZWBx/T11r0t6sv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a49581-d256-425b-7ede-08db34ec5c34
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 09:09:56.8472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qeqiP2xNzioodejOyiz4bxB9uHeB9Cli5IetXXntuZcRrUoY1AfFx7Bd+Y7Dcwk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8264
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, boris.brezillon@collabora.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.04.23 um 02:22 schrieb Matthew Brost:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> For long-running workloads, drivers either need to open-code completion
> waits, invent their own synchronization primitives or internally use
> dma-fences that do not obey the cross-driver dma-fence protocol, but
> without any lockdep annotation all these approaches are error prone.
>
> So since for example the drm scheduler uses dma-fences it is desirable for
> a driver to be able to use it for throttling and error handling also with
> internal dma-fences tha do not obey the cros-driver dma-fence protocol.
>
> Introduce long-running completion fences in form of dma-fences, and add
> lockdep annotation for them. In particular:
>
> * Do not allow waiting under any memory management locks.
> * Do not allow to attach them to a dma-resv object.
> * Introduce a new interface for adding callbacks making the helper adding
>    a callback sign off on that it is aware that the dma-fence may not
>    complete anytime soon. Typically this will be the scheduler chaining
>    a new long-running fence on another one.

Well that's pretty much what I tried before: 
https://lwn.net/Articles/893704/

And the reasons why it was rejected haven't changed.

Regards,
Christian.

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/dma-buf/dma-fence.c | 142 ++++++++++++++++++++++++++----------
>   drivers/dma-buf/dma-resv.c  |   5 ++
>   include/linux/dma-fence.h   |  55 +++++++++++++-
>   3 files changed, 160 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f177c56269bb..9726b2a3c67d 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -111,6 +111,20 @@ static atomic64_t dma_fence_context_counter = ATOMIC64_INIT(1);
>    * drivers/gpu should ever call dma_fence_wait() in such contexts.
>    */
>   
> +/**
> + * DOC: Long-Running (lr) dma-fences.
> + *
> + * * Long-running dma-fences are NOT required to complete in reasonable time.
> + *   Typically they signal completion of user-space controlled workloads and
> + *   as such, need to never be part of a cross-driver contract, never waited
> + *   for inside a kernel lock, nor attached to a dma-resv. There are helpers
> + *   and warnings in place to help facilitate that that never happens.
> + *
> + * * The motivation for their existense is that helpers that are intended to
> + *   be used by drivers may use dma-fences that, given the workloads mentioned
> + *   above, become long-running.
> + */
> +
>   static const char *dma_fence_stub_get_name(struct dma_fence *fence)
>   {
>           return "stub";
> @@ -284,6 +298,34 @@ static struct lockdep_map dma_fence_lockdep_map = {
>   	.name = "dma_fence_map"
>   };
>   
> +static struct lockdep_map dma_fence_lr_lockdep_map = {
> +	.name = "dma_fence_lr_map"
> +};
> +
> +static bool __dma_fence_begin_signalling(struct lockdep_map *map)
> +{
> +	/* explicitly nesting ... */
> +	if (lock_is_held_type(map, 1))
> +		return true;
> +
> +	/* rely on might_sleep check for soft/hardirq locks */
> +	if (in_atomic())
> +		return true;
> +
> +	/* ... and non-recursive readlock */
> +	lock_acquire(map, 0, 0, 1, 1, NULL, _RET_IP_);
> +
> +	return false;
> +}
> +
> +static void __dma_fence_end_signalling(bool cookie, struct lockdep_map *map)
> +{
> +	if (cookie)
> +		return;
> +
> +	lock_release(map, _RET_IP_);
> +}
> +
>   /**
>    * dma_fence_begin_signalling - begin a critical DMA fence signalling section
>    *
> @@ -300,18 +342,7 @@ static struct lockdep_map dma_fence_lockdep_map = {
>    */
>   bool dma_fence_begin_signalling(void)
>   {
> -	/* explicitly nesting ... */
> -	if (lock_is_held_type(&dma_fence_lockdep_map, 1))
> -		return true;
> -
> -	/* rely on might_sleep check for soft/hardirq locks */
> -	if (in_atomic())
> -		return true;
> -
> -	/* ... and non-recursive readlock */
> -	lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1, NULL, _RET_IP_);
> -
> -	return false;
> +	return __dma_fence_begin_signalling(&dma_fence_lockdep_map);
>   }
>   EXPORT_SYMBOL(dma_fence_begin_signalling);
>   
> @@ -323,25 +354,61 @@ EXPORT_SYMBOL(dma_fence_begin_signalling);
>    */
>   void dma_fence_end_signalling(bool cookie)
>   {
> -	if (cookie)
> -		return;
> -
> -	lock_release(&dma_fence_lockdep_map, _RET_IP_);
> +	__dma_fence_end_signalling(cookie, &dma_fence_lockdep_map);
>   }
>   EXPORT_SYMBOL(dma_fence_end_signalling);
>   
> -void __dma_fence_might_wait(void)
> +/**
> + * dma_fence_lr begin_signalling - begin a critical long-running DMA fence
> + * signalling section
> + *
> + * Drivers should use this to annotate the beginning of any code section
> + * required to eventually complete &dma_fence by calling dma_fence_signal().
> + *
> + * The end of these critical sections are annotated with
> + * dma_fence_lr_end_signalling(). Ideally the section should encompass all
> + * locks that are ever required to signal a long-running dma-fence.
> + *
> + * Return: An opaque cookie needed by the implementation, which needs to be
> + * passed to dma_fence_lr end_signalling().
> + */
> +bool dma_fence_lr_begin_signalling(void)
> +{
> +	return __dma_fence_begin_signalling(&dma_fence_lr_lockdep_map);
> +}
> +EXPORT_SYMBOL(dma_fence_lr_begin_signalling);
> +
> +/**
> + * dma_fence_lr_end_signalling - end a critical DMA fence signalling section
> + * @cookie: opaque cookie from dma_fence_lr_begin_signalling()
> + *
> + * Closes a critical section annotation opened by
> + * dma_fence_lr_begin_signalling().
> + */
> +void dma_fence_lr_end_signalling(bool cookie)
> +{
> +	__dma_fence_end_signalling(cookie, &dma_fence_lr_lockdep_map);
> +}
> +EXPORT_SYMBOL(dma_fence_lr_end_signalling);
> +
> +static void ___dma_fence_might_wait(struct lockdep_map *map)
>   {
>   	bool tmp;
>   
> -	tmp = lock_is_held_type(&dma_fence_lockdep_map, 1);
> +	tmp = lock_is_held_type(map, 1);
>   	if (tmp)
> -		lock_release(&dma_fence_lockdep_map, _THIS_IP_);
> -	lock_map_acquire(&dma_fence_lockdep_map);
> -	lock_map_release(&dma_fence_lockdep_map);
> +		lock_release(map, _THIS_IP_);
> +	lock_map_acquire(map);
> +	lock_map_release(map);
>   	if (tmp)
> -		lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1, NULL, _THIS_IP_);
> +		lock_acquire(map, 0, 0, 1, 1, NULL, _THIS_IP_);
> +}
> +
> +void __dma_fence_might_wait(void)
> +{
> +	___dma_fence_might_wait(&dma_fence_lockdep_map);
>   }
> +
>   #endif
>   
>   
> @@ -506,7 +573,11 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>   
>   	might_sleep();
>   
> -	__dma_fence_might_wait();
> +#ifdef CONFIG_LOCKDEP
> +	___dma_fence_might_wait(dma_fence_is_lr(fence) ?
> +				&dma_fence_lr_lockdep_map :
> +				&dma_fence_lockdep_map);
> +#endif
>   
>   	dma_fence_enable_sw_signaling(fence);
>   
> @@ -618,29 +689,22 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
>   EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>   
>   /**
> - * dma_fence_add_callback - add a callback to be called when the fence
> + * dma_fence_lr_add_callback - add a callback to be called when the fence
>    * is signaled
>    * @fence: the fence to wait on
>    * @cb: the callback to register
>    * @func: the function to call
>    *
> - * Add a software callback to the fence. The caller should keep a reference to
> - * the fence.
> - *
> - * @cb will be initialized by dma_fence_add_callback(), no initialization
> - * by the caller is required. Any number of callbacks can be registered
> - * to a fence, but a callback can only be registered to one fence at a time.
> - *
> - * If fence is already signaled, this function will return -ENOENT (and
> - * *not* call the callback).
> - *
> - * Note that the callback can be called from an atomic context or irq context.
> + * This function is identical to dma_fence_add_callback() but allows adding
> + * callbacks also to lr dma-fences. The naming helps annotating the fact that
> + * we're adding a callback to a a lr fence and that the callback might therefore
> + * not be called within a reasonable amount of time.
>    *
> - * Returns 0 in case of success, -ENOENT if the fence is already signaled
> + * Return: 0 in case of success, -ENOENT if the fence is already signaled
>    * and -EINVAL in case of error.
>    */
> -int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
> -			   dma_fence_func_t func)
> +int dma_fence_lr_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
> +			      dma_fence_func_t func)
>   {
>   	unsigned long flags;
>   	int ret = 0;
> @@ -667,7 +731,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>   
>   	return ret;
>   }
> -EXPORT_SYMBOL(dma_fence_add_callback);
> +EXPORT_SYMBOL(dma_fence_lr_add_callback);
>   
>   /**
>    * dma_fence_get_status - returns the status upon completion
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 2a594b754af1..fa0210c1442e 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -292,6 +292,7 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
>   	 * individually.
>   	 */
>   	WARN_ON(dma_fence_is_container(fence));
> +	WARN_ON_ONCE(dma_fence_is_lr(fence));
>   
>   	fobj = dma_resv_fences_list(obj);
>   	count = fobj->num_fences;
> @@ -340,6 +341,7 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>   	unsigned int i;
>   
>   	dma_resv_assert_held(obj);
> +	WARN_ON_ONCE(dma_fence_is_lr(replacement));
>   
>   	list = dma_resv_fences_list(obj);
>   	for (i = 0; list && i < list->num_fences; ++i) {
> @@ -764,6 +766,7 @@ static int __init dma_resv_lockdep(void)
>   	struct ww_acquire_ctx ctx;
>   	struct dma_resv obj;
>   	struct address_space mapping;
> +	bool lr_cookie;
>   	int ret;
>   
>   	if (!mm)
> @@ -772,6 +775,7 @@ static int __init dma_resv_lockdep(void)
>   	dma_resv_init(&obj);
>   	address_space_init_once(&mapping);
>   
> +	lr_cookie = dma_fence_lr_begin_signalling();
>   	mmap_read_lock(mm);
>   	ww_acquire_init(&ctx, &reservation_ww_class);
>   	ret = dma_resv_lock(&obj, &ctx);
> @@ -792,6 +796,7 @@ static int __init dma_resv_lockdep(void)
>   	ww_mutex_unlock(&obj.lock);
>   	ww_acquire_fini(&ctx);
>   	mmap_read_unlock(mm);
> +	dma_fence_lr_end_signalling(lr_cookie);
>   
>   	mmput(mm);
>   
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index d54b595a0fe0..08d21e26782b 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
>   	DMA_FENCE_FLAG_SIGNALED_BIT,
>   	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>   	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> +	DMA_FENCE_FLAG_LR_BIT,
>   	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
>   };
>   
> @@ -279,6 +280,11 @@ struct dma_fence_ops {
>   	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>   };
>   
> +static inline bool dma_fence_is_lr(const struct dma_fence *fence)
> +{
> +	return test_bit(DMA_FENCE_FLAG_LR_BIT, &fence->flags);
> +}
> +
>   void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   		    spinlock_t *lock, u64 context, u64 seqno);
>   
> @@ -377,13 +383,23 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>   #ifdef CONFIG_LOCKDEP
>   bool dma_fence_begin_signalling(void);
>   void dma_fence_end_signalling(bool cookie);
> +bool dma_fence_lr_begin_signalling(void);
> +void dma_fence_lr_end_signalling(bool cookie);
>   void __dma_fence_might_wait(void);
>   #else
> +
>   static inline bool dma_fence_begin_signalling(void)
>   {
>   	return true;
>   }
> +
>   static inline void dma_fence_end_signalling(bool cookie) {}
> +static inline bool dma_fence_lr_begin_signalling(void)
> +{
> +	return true;
> +}
> +
> +static inline void dma_fence_lr_end_signalling(bool cookie) {}
>   static inline void __dma_fence_might_wait(void) {}
>   #endif
>   
> @@ -394,9 +410,42 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>   				      ktime_t timestamp);
>   signed long dma_fence_default_wait(struct dma_fence *fence,
>   				   bool intr, signed long timeout);
> -int dma_fence_add_callback(struct dma_fence *fence,
> -			   struct dma_fence_cb *cb,
> -			   dma_fence_func_t func);
> +
> +int dma_fence_lr_add_callback(struct dma_fence *fence,
> +			      struct dma_fence_cb *cb,
> +			      dma_fence_func_t func);
> +
> +/**
> + * dma_fence_add_callback - add a callback to be called when the fence
> + * is signaled
> + * @fence: the fence to wait on
> + * @cb: the callback to register
> + * @func: the function to call
> + *
> + * Add a software callback to the fence. The caller should keep a reference to
> + * the fence.
> + *
> + * @cb will be initialized by dma_fence_add_callback(), no initialization
> + * by the caller is required. Any number of callbacks can be registered
> + * to a fence, but a callback can only be registered to one fence at a time.
> + *
> + * If fence is already signaled, this function will return -ENOENT (and
> + * *not* call the callback).
> + *
> + * Note that the callback can be called from an atomic context or irq context.
> + *
> + * Returns 0 in case of success, -ENOENT if the fence is already signaled
> + * and -EINVAL in case of error.
> + */
> +static inline int dma_fence_add_callback(struct dma_fence *fence,
> +					 struct dma_fence_cb *cb,
> +					 dma_fence_func_t func)
> +{
> +	WARN_ON(IS_ENABLED(CONFIG_LOCKDEP) && dma_fence_is_lr(fence));
> +
> +	return dma_fence_lr_add_callback(fence, cb, func);
> +}
> +
>   bool dma_fence_remove_callback(struct dma_fence *fence,
>   			       struct dma_fence_cb *cb);
>   void dma_fence_enable_sw_signaling(struct dma_fence *fence);

