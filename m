Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD26C3EF6E9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 02:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE136E28A;
	Wed, 18 Aug 2021 00:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8DE6E24E;
 Wed, 18 Aug 2021 00:35:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dByYGdzKU5MF4cEt5HVZPbmlEGIjVngVoH/EoXPPQOKF4CVpzC0aJxSvAeltlx17MseLu2RBR93ufpeq0llSZUlezkteqgm7TZgCtot1HXJvQU64jzvR/8b3iK/zPvFAWP4lSJ5uHTys2td/ul6DynqFWLq/msg7BoCVJ296GTdCdKyJ5ArqRUQkMRGDWI4Psl7WhdgbGvw51k5QbqoDqRFxnetzTlQnBv+4Ll6/loFpmJD7BJL7ncnJqHYI3Esof9bL2gCahMO43FHf+SXUgg+dWbcKVLupHRaZrkcyqLqTl2+5aTTh4j+LeDqHYRiF5DiiI8euCg72c12JZCclOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzOvNKempSaYMhzraH53SUoQWUB+wJ5jmIhnfA6t3fE=;
 b=AcynHHhbz/EOY/o3R0uq8wbJWLDptS52P1GdUNU5mZ73pQ7jm7GM7csKE63EhRpiSdg/Eg+Y8sbZnP34/91w8wktQk+Q3whTKYV4d5HsBrbvHJxSzQviCbhbpD11hyNN3dOO9nrBKryYFxWCOA+UygSDrZ1/OHo80eRWwjTmrlO8Dgpp+Y8aXAf91Bcy8Dh4QVVgnA3h+LJuB1gAJcNlO6JCVomFpAQ4Gm8mQEKXMan2QQDyHpVWXvICEF/ivN3K4ivZjOA+r7Bv6nLoiYs34H4FLxoDR45xM1N+y7Dx1nkkNGdzUqFXgCfTDGXgKI5Kad9+bAlyNCUl20V0i/f53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzOvNKempSaYMhzraH53SUoQWUB+wJ5jmIhnfA6t3fE=;
 b=f7gKcQP/+9qh4Hx3cl7IaVxFzXAwqTZaxMY3MRo4T7hLkenb+6Ud3sJyP5BYG4gKSdrexD4aa9/722P46dYGCuBOmMUXWAQlWyXxAOPRCod1oP8Zp3j9SGurUzW14QMhB62uLbU3B30dR2cPM1ZNIT2emgGCT6EP3wVn2N1WgVk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5180.namprd12.prod.outlook.com (2603:10b6:408:11d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 00:35:24 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%4]) with mapi id 15.20.4415.023; Wed, 18 Aug 2021
 00:35:24 +0000
Subject: Re: [PATCH v6 02/13] mm: remove extra ZONE_DEVICE struct page refcount
To: Ralph Campbell <rcampbell@nvidia.com>, Alex Sierra <alex.sierra@amd.com>, 
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-ext4@vger.kernel.org, 
 linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jgg@nvidia.com, jglisse@redhat.com
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-3-alex.sierra@amd.com>
 <7b821150-af18-f786-e419-ec245b8cfb1e@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <393e9815-838d-5fe6-d6ab-bfe7b543fef6@amd.com>
Date: Tue, 17 Aug 2021 20:35:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <7b821150-af18-f786-e419-ec245b8cfb1e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::29) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YT3PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:86::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 00:35:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d8e2769-2812-4023-9c68-08d961e01194
X-MS-TrafficTypeDiagnostic: BN9PR12MB5180:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB51800F4FD7EAC20516E5B16F92FF9@BN9PR12MB5180.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZSCPBaAgLwJwO35L5e7MI4LVrXn/StgT9M/MuxbNu5uyLiQ0p2AOVQPkaIhLB9PHpPjgP1UhsiYWhnAIe75oJB7OQb2dzp6GeX2Dm/f/MwxjcDlZHG94bQ/TR3ZyMIHvMogFAr+J45hqeSTZYIA4yx0g2p/V67E1NmB5Yf5nSA7zwnbD8e5m+yqsZqKlrNu8OjIGVRMVDFiuPkiPZP+X7Vzh5Wdv2i1hHpiOgtAQbzY1vKYdJtDwE4n5fTO/oOVhtHkfROZzYntpbNMndSNMVCNzuTgpX9oqUhQZwND15ysDG754/qQ3QWzvFfRy+/6F7xY8XrNoe9w3hqHqqKKVyRU6h7Jdjiy2NnWgAIiYQicVzWh0G+0alZDLyhcpyUh8o1XZlw79qSf4RXVwzC4pcYxUzYLaIhuTH1kOO67F8RPc6IC2XQD+UckABxNNH6c6KnKKdIcW8E2MxnrIGrDmpfI4rCZyIZnhntcJCntgCLdTYUo4no/dnr51wmLblBsevLy5SGhg04QREqnUlF4oWusQ4ltjOulvL/bZBE0TZLIP2CckHVceWxqiCT4gQBhaXrDVoUWqV+2GbK+SCcouTBuSk+GviHnWR0pQgwIuAC6omgHnAfwjDavgkTfWSOEHF0bFUPqyENIKTrAwj98oSWsJDrRUxiTtj/y7gMYndl1SKjZTqlZdJ3i8tGio/Ds63q/PdBaJW5TI2sLn3Ecx/2Yrp2FORivJbu4d4WIEfDS//0kbUDpXtcWXujZ0mSrK0WdUdAkNM/gni2l56t/a7LUsEy8JAGwoPzJJTPflIehcDJFBsy2GdB0O5yA8XX4z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(966005)(2906002)(31686004)(53546011)(478600001)(110136005)(66946007)(66476007)(66556008)(16576012)(5660300002)(83380400001)(86362001)(8936002)(316002)(2616005)(36756003)(38100700002)(6486002)(31696002)(7416002)(956004)(8676002)(4326008)(186003)(44832011)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDRrS0Q5elBLUUtHMDM4aHI3RWFDdkpZODhzQnphWmIzZjFLYXRNbi9ONXN5?=
 =?utf-8?B?bGIwWVdaWkRwazc3b2s3TG9BWlVYQmptditKUHFWL0RCbUg2MWdqM3N2ajBw?=
 =?utf-8?B?OGRGcHdtQkJXWGtLbE43NGF6T3gza0VQUEkveTNFV0Z3ZlVCQnpYOUJMaHNt?=
 =?utf-8?B?RGNRTlp0VUZPM29Va2xwZVZaVXRRMHhvN3Y1MDlSQlJJUlZhY3AreTlTa0dN?=
 =?utf-8?B?SUxkV3hwNlkwNEtZZ2M1Vm92SjNPZStNL1dBTVZObjFRUkJOT3Uxek15aENW?=
 =?utf-8?B?bXdzeW5mTjduRFc3d3Jna29CSnZMZnNoTWdsd2I1NTRhOTNCSElYdzN0bThm?=
 =?utf-8?B?bGVYUDQ3R3k4QWFGdWw2ZEFnZnRFd004OG8xeUNOU0NsQlV1d2l5dGNOYkdo?=
 =?utf-8?B?SVF5NjRYOUpMWDRNaWFZTVZzdWlzSzlvaFdkS0lhV1lUR2RkbUVIcU80MmpM?=
 =?utf-8?B?SldGNWI5ZjlhbVdaV2gxM3c0Vm90aVV5TE9wMlZsYU1JYjVxOUxUUnYwTmhY?=
 =?utf-8?B?MFVKWlRDak9hcmRVYUY5aXpOVjl0ZHY1bVFOQXhicWRzU044anhYNVR1dHdZ?=
 =?utf-8?B?VThUTmlsU1FBcXQ1ekFaM0k2MVpybjdXUkdFbUZ6cXdFeW5YeGc4NllsWEU3?=
 =?utf-8?B?TUR3RVBPWXdPTjJFZkZBR3hQRStUa29CZVlXQUtDaEpIMmZGR0ZVWHVvUlNz?=
 =?utf-8?B?Z1F4ZFVDUGNKZ0tRaVo4Z1RlMHpKTThVUiswN3RWQXFCbFl0czNrQ2dXOVNj?=
 =?utf-8?B?aW1TVTJmRFlpbnRFdTYyeEhxdFM1V0xoUE1wMmMyYVgydFpwSGtqSGNnT3dz?=
 =?utf-8?B?RXh1Q3RFa1VwU0xmeHRYcXJmR1VEMXQ3ZS84T1YwaFJ6dWRnd3kyQzF1YW1p?=
 =?utf-8?B?RXlnYUJpaEFoNFNzMXp5MFJoamxIVTQzSUtjZS90M1V2R1IzeEhVc0o2SGVl?=
 =?utf-8?B?ZDhTNGxxc1lOVndTMzUzcEZPeUx3WGY0a0d1eGpFVWpTL2JlOWFZNllrNDkz?=
 =?utf-8?B?VkJPalRHNFVneWpoYmJEZ0RNTWY2d3pHK2JOSTZ6a2NBQ1NKYlZDdlhyTHhv?=
 =?utf-8?B?NTJwWTRPVUpkY1BKbHVycGFKR2tNcXpuU3JtSW13TEJnVGFnbkp2YzFtVnJv?=
 =?utf-8?B?ZEt1ZUFCOWdJd0hTYUJXbTZvN2ZzRis5NXlkRFM1ZlpRbEJjamVHanlWQzY5?=
 =?utf-8?B?NFgwYUh6QTNORGFmUkJvMWlkRE5pT1pxajBQVk1nU3lqeHhCMmFlLytHNEx4?=
 =?utf-8?B?K09WdjYzcW9uakFwRlRldXhSbjZwUzhjUEpxUGd0dzNZNG91b1FpWWZzSkhY?=
 =?utf-8?B?bkZRcnlHWmUwNU0wdzVxbGlhdUcwb050N0JMa25saUtEQkdubHF0STd5RW9v?=
 =?utf-8?B?S1UwckFaQUxSQlZrU1l5clptL2t2QWlnTkFDMHljQnM2ZWk4T25hTWtWRVN3?=
 =?utf-8?B?QndySjZrSmN4N3p1ZC9EWTdWdTFxVllNTGZNS0dzaGFhTHFHRHZ0MmxESHRC?=
 =?utf-8?B?ZVc2V3JPUGx6SzIwR245NjBXZFc2SEkyT3NHeXBsUXZuZFluTHIyS3dHVEN1?=
 =?utf-8?B?cmdHdnFzVXAvWHdXbWtlS3NEa29Dci9oaUdqc3h3eVB5WFVNdzNLeVJ6M1pZ?=
 =?utf-8?B?TmxtbXVxUXFDNXFPaHEwNEpqNFM2ZFBkZDRSMWQxeitvNjVwUlE0M2pKcGNa?=
 =?utf-8?B?eUlHUUlCWExaMVROSHBHdjBFS0Y5NmdiaUFJcy9tR2pMV05xZEg3UmhPU0xF?=
 =?utf-8?Q?ormf2GUV8NSetp4L2zOCqsCpIsHtDkfu4URjPqf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8e2769-2812-4023-9c68-08d961e01194
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 00:35:24.5893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kWSSSsw8drnbwIwcjGLROjNj/5eLrNwYQEQf/s1r5100GjIHM7eX6x6dvU/ZPCNPCeKybYxLzkXUudFlcgkig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5180
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


Am 2021-08-17 um 8:01 p.m. schrieb Ralph Campbell:
> On 8/12/21 11:31 PM, Alex Sierra wrote:
>> From: Ralph Campbell <rcampbell@nvidia.com>
>>
>> ZONE_DEVICE struct pages have an extra reference count that
>> complicates the
>> code for put_page() and several places in the kernel that need to
>> check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't
>> need to
>> be treated specially for ZONE_DEVICE.
>>
>> v2:
>> AS: merged this patch in linux 5.11 version
>>
>> v5:
>> AS: add condition at try_grab_page to check for the zone device type,
>> while
>> page ref counter is checked less/equal to zero. In case of device
>> zone, pages
>> ref counter are initialized to zero.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>>   fs/dax.c                               |  4 +-
>>   include/linux/dax.h                    |  2 +-
>>   include/linux/memremap.h               |  7 +--
>>   include/linux/mm.h                     | 13 +----
>>   lib/test_hmm.c                         |  2 +-
>>   mm/internal.h                          |  8 +++
>>   mm/memremap.c                          | 68 +++++++-------------------
>>   mm/migrate.c                           |  5 --
>>   mm/page_alloc.c                        |  3 ++
>>   mm/swap.c                              | 45 ++---------------
>>   12 files changed, 46 insertions(+), 115 deletions(-)
>>
> I haven't seen a response to the issues I raised back at v3 of this
> series.
> https://lore.kernel.org/linux-mm/4f6dd918-d79b-1aa7-3a4c-caa67ddc29bc@nvidia.com/
>
>
> Did I miss something?

I think part of the response was that we did more testing. Alex added
support for DEVICE_GENERIC pages to test_hmm and he ran DAX tests
recommended by Theodore Tso. In that testing he ran into a WARN_ON_ONCE
about a zero page refcount in try_get_page. The fix is in the latest
version of patch 2. But it's already obsolete because John Hubbard is
about to remove that function altogether.

I think the issues you raised were more uncertainty than known bugs. It
seems the fact that you can have DAX pages with 0 refcount is a feature
more than a bug.

Regards,
  Felix


