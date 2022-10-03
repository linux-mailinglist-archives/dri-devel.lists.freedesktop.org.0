Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550715F349D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 19:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB6B10E444;
	Mon,  3 Oct 2022 17:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D040D10E3AF;
 Mon,  3 Oct 2022 17:35:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ln2YVAKWfjqWX2s9c5iee4Mc7BDf/VqU0+pV5En6zgpIPWz3baFIgotnO1NKBBt5J0yt9Z1MXes4ksY3GPCRPNvmEPUIPLhc8DJhEvk6ASlI4yK0hhJFQvTyg7J9EHmuymvLPxa5OfoS/RrNiDx9Edf2pVn+nyU4higj/vXPKsqejECNPM+o6buB9dug8Sgt9462B1qXng+OPxEvX7RsYIoAGQ1bLj+wITSM8Adl46VrzwxIJDECCkAf8zTNlJ0tUJw0IGeK+k+HhfNGiOvCk4GeaxKfvw4iNSm2KM/i6s4c+NG1U5vf2qYcmSmTwUCZcmFXQ+/L5Tq5II4bZvHlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NF7dfQKeSqh8ynhquhZrh745V3KeR78SBykcC4p6liE=;
 b=T6b2vpV2CA7UnXvmQwzcJuE4ebGPZmejKzrI6uPp/sV2CAcueHT+epfxddmGIuM4/b23wat5pfSRfdr6zP1bgXEr9U/272UgwQQ4P14+1+VQDvSMKylP5+sRi+ewVAudvN5tMt9Oy4UzKGFuHPHlHhV63JYhQv/VRwZNF6J/Fu7OZhAOloUoZoUb/kAPDzE07YL7hq4qOMrSc9b/h903FasoQu7s1s85lDISYdegW8KFQdELO+5hYTVmEZ26dFc6uZlYWEWyuCS3JBZ+oQ/VNIG4h5nOIMRPpTi1Js1dvlvh5G3Pr33IHbfcMNBIW2abxj8ZhNQqOdo/jlGJhOBmqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NF7dfQKeSqh8ynhquhZrh745V3KeR78SBykcC4p6liE=;
 b=2jF3GaDERdc2HXvR+BJMQi8kY6k7/OpD+EGzVfOiKYd7emE/w8fJlh+mf5JPrIKTTJJkg83dCLDogh67J+UuyniUR9Yssjy6NZ18hcIrpW8qBW+cgq5kYDqDpyJHqzUBKlvvOeTUkiiJfA/0jF6sQSxJ825LseG1ZhMEc9r6Pew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB5016.namprd12.prod.outlook.com (2603:10b6:a03:1c5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 3 Oct
 2022 17:35:01 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013%5]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 17:35:01 +0000
Message-ID: <55f267cf-eef7-f2e9-d174-9653f1c04b59@amd.com>
Date: Mon, 3 Oct 2022 13:34:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/8] mm/memory.c: Fix race when faulting a device
 private page
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
 <d3e813178a59e565e8d78d9b9a4e2562f6494f90.1664366292.git-series.apopple@nvidia.com>
 <2193303e-84b9-d0a1-b121-d2a145fcc43a@amd.com>
 <87pmf9y9st.fsf@nvdebian.thelocal>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <87pmf9y9st.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::24) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BY5PR12MB5016:EE_
X-MS-Office365-Filtering-Correlation-Id: 7289fec3-e018-4f91-e222-08daa5659973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mS16v/m4vozCL9E7UC/MRxiCWCMD2/ZF7JdKfpsVpAj/f31Aebb4mooqfNEB0vvXVtCSpFoR1V5DE5X8YckS/LYU6PYG7omBXTMrtiJZHtyClbIBw13q88ZuT8qQ/xVIpQceDdL0dQ6h8oXqEDD/HxDrY9Zc7Zv7BEDBH/LsL871BdoQgzADlqFzh3LR2PCoi+YN3JDQ4TDf3P6EIhmLtndpSxDNXt2cAPbvDHyew/yOBOT/to4iPefg9+fFdvcAuYL/Px5MfvVg5HgyJ8GOFobkEa1RdINS9U3Ji/bjFTRxcqVmoVLSO1MD+Vt5SYkyWil9NoeBlUdCC5znKm1pxBC7djoTnE+mfqi3038GvOROZBRqirT+TK92t9JNCORsNqrixpH7b4EmHyuvy86ydU3GPY7wN0ml2pAeGc/B4H8reeRzSvCeMdCLhwKJIAw/CIltIRN9C+LyyHr8ccRywxxtMLsoAeQ77DHhFMtQ3xxU7ZoSndxpRoh148SDufrWZjDg38vtqEvB9VtQwSXyS6jmm3akq9ybqOtt6SjzuqTe99Eq/Sws8om7eIorLDTOViHwYK3/o3+d+56VKSDwHRRK/3Sq//r46o/DCCZwBTjCfXaQz2qCC3Y4jDKzteTmVh7QPzmB0ffbbOfcXY+by0vEZm9uh41HeJ/6KkMHDiUUUnUlk5djKing0d0OzbthGPbaUTz39Bsc4Mqlj2WbOnGkndFQgtDOpQt12It8cbC7BcLBKkYD4z1M5mRw+UzO+bsudueqoaXGzoR5VITJy+rVh8lk8hUdygi2cB9V0h4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199015)(38100700002)(86362001)(41300700001)(83380400001)(2906002)(6512007)(31696002)(53546011)(26005)(316002)(54906003)(6916009)(66476007)(6506007)(8676002)(36756003)(4326008)(186003)(2616005)(6486002)(7416002)(66556008)(44832011)(66946007)(5660300002)(31686004)(66899015)(30864003)(478600001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXR6Tk9BQVRaOUFsK3JtNDJzNElRakVRWTMzb1huaEcrUE1lMXNTcWlXUHpp?=
 =?utf-8?B?SS9YYzZLZVRoZFZ0ZkJyRDVvMmxQSmhKckpzOGNjZTBpM29pcXl4NG16WHpD?=
 =?utf-8?B?NUxXSW41Y0x1a3d4Sm9QVStLcytuQlBydk81V1dFTlRHMXd3VWRSamxTWnlS?=
 =?utf-8?B?aTNQNWI4WU01b252MTBVUytnOVJXeEp5eXZBR0RmTldUeHNDQ0UybnBHTyta?=
 =?utf-8?B?RnpwSDk1YTk5UEZ0ZS80YUhtQ0FiUXRpVmVDdnlGdmVROEFXWkNMR01RUkw2?=
 =?utf-8?B?QkNBOG1wRzRGTXp0OEpjS2UyTFpBdDFGazB0aTdIVXAxUWlsdFFRaDRsbSto?=
 =?utf-8?B?N3R3ZUJCZTBNR3dOZG44VlpqRWlTSDQwOWFuUVl5MW5rdksxbXpVa1Q2ZVVj?=
 =?utf-8?B?djhBaVR1ZEJRSXR1a2tPSmJsYlBBakkyc3g4aWZzYVpGUnpPQWsvQzZKVnd1?=
 =?utf-8?B?dkp5ZzFwVTl3SXBLTldLanFNQUJoQTR3NWxOemN5UDFNT1E5cHZua09YaDBp?=
 =?utf-8?B?ZVNZRnRRNURlRzV6TkxSc1YxbUduNmozT05ZYk1lQ3M1TEZwSmtCZFliZ09w?=
 =?utf-8?B?UUorRkQ4bG8wa0oraGtSWDdCRXZxZytENGIyWFFkUkxvamU1TElaTzFtZHBk?=
 =?utf-8?B?d2Yray9ySG9sTHlHN3REcU5tNGd4eEV1T1orWjY3dXNCQnpPTVBIVzMwbWZW?=
 =?utf-8?B?L1Y2Q25aV0E0b1BER01YZzljckZ6eVZDQk8vOWpHczVDVmNVQWU5Qmd6RTVu?=
 =?utf-8?B?Q3ZFOXpId20va1lqVmgyUUtnUVRESXpqRWZaTjNvbEQxTlNSL24waitEWkg1?=
 =?utf-8?B?czBtbnhUYlNiNWFtZTFTdm41VHFENjkxbXZVUW96cmlQaUJ4RmptRFdRMXNV?=
 =?utf-8?B?MlVtbHNOV0ZVUnJValpqVFJUWkVsVS9ON042VTY5YjI4NFlrK01UUnNnYWFk?=
 =?utf-8?B?dmxwQUhLK09Jam5VZitrTHQzcHVjUjd0bmJNMU9uVytTVER0ejNPdWZ3OVJY?=
 =?utf-8?B?VWxGL05oOThETE9jQ0RiR0QyMFBCd2NacFZyVzd6RnBUajdwSzFNZ1k0TzU1?=
 =?utf-8?B?OG9USkdRSWdEYk1JcGE2TFpqTVpTcnptNzhkL2dTUFdZOE1WS2NLUG5JZi9i?=
 =?utf-8?B?YjA3RUNlM0p5QjNkM0p5OU9lOU5IbDNla2ErY25EblFwSndOZUZXQTUxTlpX?=
 =?utf-8?B?UExhR0ZYMlNSZXZEd0o1UzY4V3c2V2pxZ0NvOWR6N1JONnJWalBvMWhiMm5W?=
 =?utf-8?B?OG1iM3BTR2xZL0Z5cENNRVplWmZscDdtZ3daQWwwb2E5QlVkNTdCV3FWTWlT?=
 =?utf-8?B?a2NQSWVJZ3U5aStiS3RtRGZySFpGWEJQem1yeTZxYkljNVVObTlZZGRyclRy?=
 =?utf-8?B?THZCM1VnMTU2S0luQjlSUlBBREFlcTUzeXNSQnppZ2hDTzNpRGh0V1JVTmZn?=
 =?utf-8?B?ZEZMWUkxQW9FcTFXNGt1ckRtaXVwbEhXZmU4RzRTcEdsVG56TG8zNUdGRVhx?=
 =?utf-8?B?aVQ4d0ZTbkljNTg4R1gwdnpObUs1K1U5WGM5dDVKOFBldlFoYnUrYjNLVDE3?=
 =?utf-8?B?V3pvNkQzNHNSelp0d2NqemlRdlQwaFRJb0syaElCK1BwZVNONVhoOHpKZjZF?=
 =?utf-8?B?NGg2dWpIWk00TklRTUxudFZlTVFXd1IvK2lSbEl1cnB5RFJiV3JUZE0xcnow?=
 =?utf-8?B?a0t3Vk9vRE93WThoWVJsVyswbW9uNDFzVnJFRFR1SkVHOTN4SHVuK2E0SG0v?=
 =?utf-8?B?MU5aVGJEOHN5S2Q0cmhPcFc2U0tjMWRxdDcxS1JETSszQncvV2RZb2thRmpp?=
 =?utf-8?B?ZFB5Z1A0UXJVZTg0NUNqR1B2Zk1NSHJIalJ6VDdvZXhuNzAzVDdld0Q0Q3o2?=
 =?utf-8?B?alRNSmxSNElrOGVSVWpkaVBXUjRKTC9kQm9XT0ovc2E5V1hodTJJbHB2cVBX?=
 =?utf-8?B?NGE2SVFTUVNZY3NtcFNCR20zaTBLdC9pYWVQbWh5bzd4aXlhc0JkdkZZRFA3?=
 =?utf-8?B?U2hVSVBGSmNMaVVUcXBNQ1hKRTNvalhMbUpGU2VKbXIxbE1FcmJFYWRSUXFD?=
 =?utf-8?B?M2Q5WmZ3Y3pGU25Zb2VSTXJFbjhFWVFlaWovSnh4UWE4Wi9WcUQvSHl6UGVh?=
 =?utf-8?Q?HQIi/hMKB9q178cGWBLU47upY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7289fec3-e018-4f91-e222-08daa5659973
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 17:35:01.1916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6R4XcllTgv9JIMqRnn+HeogqGB0QGphI9O+xB0k6fCKgaP+9fnIrJKWRH4vdP5HVid3jlH6pvhTuNntVZaDkaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5016
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-10-02 um 20:53 schrieb Alistair Popple:
> Felix Kuehling <felix.kuehling@amd.com> writes:
>
>> On 2022-09-28 08:01, Alistair Popple wrote:
>>> When the CPU tries to access a device private page the migrate_to_ram()
>>> callback associated with the pgmap for the page is called. However no
>>> reference is taken on the faulting page. Therefore a concurrent
>>> migration of the device private page can free the page and possibly the
>>> underlying pgmap. This results in a race which can crash the kernel due
>>> to the migrate_to_ram() function pointer becoming invalid. It also means
>>> drivers can't reliably read the zone_device_data field because the page
>>> may have been freed with memunmap_pages().
>>>
>>> Close the race by getting a reference on the page while holding the ptl
>>> to ensure it has not been freed. Unfortunately the elevated reference
>>> count will cause the migration required to handle the fault to fail. To
>>> avoid this failure pass the faulting page into the migrate_vma functions
>>> so that if an elevated reference count is found it can be checked to see
>>> if it's expected or not.
>> Do we really have to drag the fault_page all the way into the migrate structure?
>> Is the elevated refcount still needed at that time? Maybe it would be easier to
>> drop the refcount early in the ops->migrage_to_ram callbacks, so we won't have
>> to deal with it in all the migration code.
> That would also work. Honestly I don't really like either solution :-)

Then we agree. :)


> I didn't like having to plumb it all through the migration code
> but I ended up going this way because I felt it was easier to explain
> the life time of vmf->page for the migrate_to_ram() callback. This way
> vmf->page is guaranteed to be valid for the duration of the
> migrate_to_ram() callbak.
>
> As you suggest we could instead have drivers call put_page(vmf->page)
> somewhere in migrate_to_ram() before calling migrate_vma_setup(). The
> reason I didn't go this way is IMHO it's more subtle because in general
> the page will remain valid after that put_page() anyway. So it would be
> easy for drivers to introduce a bug assuming the vmf->page is still
> valid and not notice because most of the time it is.

I guess I'm biased because my migrate_to_ram implementation doesn't use 
the vmf->page at all. I agree that dropping the refcount in the callback 
is subtle. But handling an elevated refcount for just one special page 
in the migration code also looks a bit fragile to me.

It's not my call to make. But my preference is very clear. Either way, 
if the decision is to go with your solution, then you have my

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>


>
> Let me know if you disagree with my reasoning though - would appreciate
> any review here.
>
>> Regards,
>>    Felix
>>
>>
>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>> Cc: Jason Gunthorpe <jgg@nvidia.com>
>>> Cc: John Hubbard <jhubbard@nvidia.com>
>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> ---
>>>    arch/powerpc/kvm/book3s_hv_uvmem.c       | 15 ++++++-----
>>>    drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 17 +++++++------
>>>    drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
>>>    drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 11 +++++---
>>>    include/linux/migrate.h                  |  8 ++++++-
>>>    lib/test_hmm.c                           |  7 ++---
>>>    mm/memory.c                              | 16 +++++++++++-
>>>    mm/migrate.c                             | 34 ++++++++++++++-----------
>>>    mm/migrate_device.c                      | 18 +++++++++----
>>>    9 files changed, 87 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>>> index 5980063..d4eacf4 100644
>>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>>> @@ -508,10 +508,10 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
>>>    static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>>>    		unsigned long start,
>>>    		unsigned long end, unsigned long page_shift,
>>> -		struct kvm *kvm, unsigned long gpa)
>>> +		struct kvm *kvm, unsigned long gpa, struct page *fault_page)
>>>    {
>>>    	unsigned long src_pfn, dst_pfn = 0;
>>> -	struct migrate_vma mig;
>>> +	struct migrate_vma mig = { 0 };
>>>    	struct page *dpage, *spage;
>>>    	struct kvmppc_uvmem_page_pvt *pvt;
>>>    	unsigned long pfn;
>>> @@ -525,6 +525,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>>>    	mig.dst = &dst_pfn;
>>>    	mig.pgmap_owner = &kvmppc_uvmem_pgmap;
>>>    	mig.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
>>> +	mig.fault_page = fault_page;
>>>      	/* The requested page is already paged-out, nothing to do */
>>>    	if (!kvmppc_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
>>> @@ -580,12 +581,14 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>>>    static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
>>>    				      unsigned long start, unsigned long end,
>>>    				      unsigned long page_shift,
>>> -				      struct kvm *kvm, unsigned long gpa)
>>> +				      struct kvm *kvm, unsigned long gpa,
>>> +				      struct page *fault_page)
>>>    {
>>>    	int ret;
>>>      	mutex_lock(&kvm->arch.uvmem_lock);
>>> -	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa);
>>> +	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa,
>>> +				fault_page);
>>>    	mutex_unlock(&kvm->arch.uvmem_lock);
>>>      	return ret;
>>> @@ -736,7 +739,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>>>    		bool pagein)
>>>    {
>>>    	unsigned long src_pfn, dst_pfn = 0;
>>> -	struct migrate_vma mig;
>>> +	struct migrate_vma mig = { 0 };
>>>    	struct page *spage;
>>>    	unsigned long pfn;
>>>    	struct page *dpage;
>>> @@ -994,7 +997,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
>>>      	if (kvmppc_svm_page_out(vmf->vma, vmf->address,
>>>    				vmf->address + PAGE_SIZE, PAGE_SHIFT,
>>> -				pvt->kvm, pvt->gpa))
>>> +				pvt->kvm, pvt->gpa, vmf->page))
>>>    		return VM_FAULT_SIGBUS;
>>>    	else
>>>    		return 0;
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>> index b059a77..776448b 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>> @@ -409,7 +409,7 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
>>>    	uint64_t npages = (end - start) >> PAGE_SHIFT;
>>>    	struct kfd_process_device *pdd;
>>>    	struct dma_fence *mfence = NULL;
>>> -	struct migrate_vma migrate;
>>> +	struct migrate_vma migrate = { 0 };
>>>    	unsigned long cpages = 0;
>>>    	dma_addr_t *scratch;
>>>    	void *buf;
>>> @@ -668,7 +668,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>>>    static long
>>>    svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>>>    		       struct vm_area_struct *vma, uint64_t start, uint64_t end,
>>> -		       uint32_t trigger)
>>> +		       uint32_t trigger, struct page *fault_page)
>>>    {
>>>    	struct kfd_process *p = container_of(prange->svms, struct kfd_process, svms);
>>>    	uint64_t npages = (end - start) >> PAGE_SHIFT;
>>> @@ -676,7 +676,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>>>    	unsigned long cpages = 0;
>>>    	struct kfd_process_device *pdd;
>>>    	struct dma_fence *mfence = NULL;
>>> -	struct migrate_vma migrate;
>>> +	struct migrate_vma migrate = { 0 };
>>>    	dma_addr_t *scratch;
>>>    	void *buf;
>>>    	int r = -ENOMEM;
>>> @@ -699,6 +699,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>>>      	migrate.src = buf;
>>>    	migrate.dst = migrate.src + npages;
>>> +	migrate.fault_page = fault_page;
>>>    	scratch = (dma_addr_t *)(migrate.dst + npages);
>>>      	kfd_smi_event_migration_start(adev->kfd.dev, p->lead_thread->pid,
>>> @@ -766,7 +767,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>>>     * 0 - OK, otherwise error code
>>>     */
>>>    int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
>>> -			    uint32_t trigger)
>>> +			    uint32_t trigger, struct page *fault_page)
>>>    {
>>>    	struct amdgpu_device *adev;
>>>    	struct vm_area_struct *vma;
>>> @@ -807,7 +808,8 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
>>>    		}
>>>      		next = min(vma->vm_end, end);
>>> -		r = svm_migrate_vma_to_ram(adev, prange, vma, addr, next, trigger);
>>> +		r = svm_migrate_vma_to_ram(adev, prange, vma, addr, next, trigger,
>>> +			fault_page);
>>>    		if (r < 0) {
>>>    			pr_debug("failed %ld to migrate prange %p\n", r, prange);
>>>    			break;
>>> @@ -851,7 +853,7 @@ svm_migrate_vram_to_vram(struct svm_range *prange, uint32_t best_loc,
>>>    	pr_debug("from gpu 0x%x to gpu 0x%x\n", prange->actual_loc, best_loc);
>>>      	do {
>>> -		r = svm_migrate_vram_to_ram(prange, mm, trigger);
>>> +		r = svm_migrate_vram_to_ram(prange, mm, trigger, NULL);
>>>    		if (r)
>>>    			return r;
>>>    	} while (prange->actual_loc && --retries);
>>> @@ -938,7 +940,8 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
>>>    		goto out_unlock_prange;
>>>    	}
>>>    -	r = svm_migrate_vram_to_ram(prange, mm,
>>> KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU);
>>> +	r = svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU,
>>> +				vmf->page);
>>>    	if (r)
>>>    		pr_debug("failed %d migrate 0x%p [0x%lx 0x%lx] to ram\n", r,
>>>    			 prange, prange->start, prange->last);
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
>>> index b3f0754..a5d7e6d 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
>>> @@ -43,7 +43,7 @@ enum MIGRATION_COPY_DIR {
>>>    int svm_migrate_to_vram(struct svm_range *prange,  uint32_t best_loc,
>>>    			struct mm_struct *mm, uint32_t trigger);
>>>    int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
>>> -			    uint32_t trigger);
>>> +			    uint32_t trigger, struct page *fault_page);
>>>    unsigned long
>>>    svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
>>>    diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> index 11074cc..9139e5a 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> @@ -2913,13 +2913,15 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
>>>    				 */
>>>    				if (prange->actual_loc)
>>>    					r = svm_migrate_vram_to_ram(prange, mm,
>>> -					   KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
>>> +					   KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
>>> +					   NULL);
>>>    				else
>>>    					r = 0;
>>>    			}
>>>    		} else {
>>>    			r = svm_migrate_vram_to_ram(prange, mm,
>>> -					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
>>> +					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
>>> +					NULL);
>>>    		}
>>>    		if (r) {
>>>    			pr_debug("failed %d to migrate svms %p [0x%lx 0x%lx]\n",
>>> @@ -3242,7 +3244,8 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
>>>    		return 0;
>>>      	if (!best_loc) {
>>> -		r = svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PREFETCH);
>>> +		r = svm_migrate_vram_to_ram(prange, mm,
>>> +					KFD_MIGRATE_TRIGGER_PREFETCH, NULL);
>>>    		*migrated = !r;
>>>    		return r;
>>>    	}
>>> @@ -3303,7 +3306,7 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
>>>    		mutex_lock(&prange->migrate_mutex);
>>>    		do {
>>>    			r = svm_migrate_vram_to_ram(prange, mm,
>>> -						KFD_MIGRATE_TRIGGER_TTM_EVICTION);
>>> +					KFD_MIGRATE_TRIGGER_TTM_EVICTION, NULL);
>>>    		} while (!r && prange->actual_loc && --retries);
>>>      		if (!r && prange->actual_loc)
>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>> index 22c0a0c..82ffa47 100644
>>> --- a/include/linux/migrate.h
>>> +++ b/include/linux/migrate.h
>>> @@ -62,6 +62,8 @@ extern const char *migrate_reason_names[MR_TYPES];
>>>    #ifdef CONFIG_MIGRATION
>>>      extern void putback_movable_pages(struct list_head *l);
>>> +int migrate_folio_extra(struct address_space *mapping, struct folio *dst,
>>> +		struct folio *src, enum migrate_mode mode, int extra_count);
>>>    int migrate_folio(struct address_space *mapping, struct folio *dst,
>>>    		struct folio *src, enum migrate_mode mode);
>>>    extern int migrate_pages(struct list_head *l, new_page_t new, free_page_t free,
>>> @@ -212,6 +214,12 @@ struct migrate_vma {
>>>    	 */
>>>    	void			*pgmap_owner;
>>>    	unsigned long		flags;
>>> +
>>> +	/*
>>> +	 * Set to vmf->page if this is being called to migrate a page as part of
>>> +	 * a migrate_to_ram() callback.
>>> +	 */
>>> +	struct page		*fault_page;
>>>    };
>>>      int migrate_vma_setup(struct migrate_vma *args);
>>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>>> index e3965ca..89463ff 100644
>>> --- a/lib/test_hmm.c
>>> +++ b/lib/test_hmm.c
>>> @@ -907,7 +907,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
>>>    	struct vm_area_struct *vma;
>>>    	unsigned long src_pfns[64] = { 0 };
>>>    	unsigned long dst_pfns[64] = { 0 };
>>> -	struct migrate_vma args;
>>> +	struct migrate_vma args = { 0 };
>>>    	unsigned long next;
>>>    	int ret;
>>>    @@ -968,7 +968,7 @@ static int dmirror_migrate_to_device(struct dmirror
>>> *dmirror,
>>>    	unsigned long src_pfns[64] = { 0 };
>>>    	unsigned long dst_pfns[64] = { 0 };
>>>    	struct dmirror_bounce bounce;
>>> -	struct migrate_vma args;
>>> +	struct migrate_vma args = { 0 };
>>>    	unsigned long next;
>>>    	int ret;
>>>    @@ -1334,7 +1334,7 @@ static void dmirror_devmem_free(struct page *page)
>>>      static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>>>    {
>>> -	struct migrate_vma args;
>>> +	struct migrate_vma args = { 0 };
>>>    	unsigned long src_pfns = 0;
>>>    	unsigned long dst_pfns = 0;
>>>    	struct page *rpage;
>>> @@ -1357,6 +1357,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>>>    	args.dst = &dst_pfns;
>>>    	args.pgmap_owner = dmirror->mdevice;
>>>    	args.flags = dmirror_select_device(dmirror);
>>> +	args.fault_page = vmf->page;
>>>      	if (migrate_vma_setup(&args))
>>>    		return VM_FAULT_SIGBUS;
>>> diff --git a/mm/memory.c b/mm/memory.c
>>> index b994784..65d3977 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>> @@ -3742,7 +3742,21 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>>>    			ret = remove_device_exclusive_entry(vmf);
>>>    		} else if (is_device_private_entry(entry)) {
>>>    			vmf->page = pfn_swap_entry_to_page(entry);
>>> -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
>>> +			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
>>> +					vmf->address, &vmf->ptl);
>>> +			if (unlikely(!pte_same(*vmf->pte, vmf->orig_pte))) {
>>> +				spin_unlock(vmf->ptl);
>>> +				goto out;
>>> +			}
>>> +
>>> +			/*
>>> +			 * Get a page reference while we know the page can't be
>>> +			 * freed.
>>> +			 */
>>> +			get_page(vmf->page);
>>> +			pte_unmap_unlock(vmf->pte, vmf->ptl);
>>> +			vmf->page->pgmap->ops->migrate_to_ram(vmf);
>>> +			put_page(vmf->page);
>>>    		} else if (is_hwpoison_entry(entry)) {
>>>    			ret = VM_FAULT_HWPOISON;
>>>    		} else if (is_swapin_error_entry(entry)) {
>>> diff --git a/mm/migrate.c b/mm/migrate.c
>>> index ce6a58f..e3f78a7 100644
>>> --- a/mm/migrate.c
>>> +++ b/mm/migrate.c
>>> @@ -620,6 +620,25 @@ EXPORT_SYMBOL(folio_migrate_copy);
>>>     *                    Migration functions
>>>     ***********************************************************/
>>>    +int migrate_folio_extra(struct address_space *mapping, struct folio *dst,
>>> +		struct folio *src, enum migrate_mode mode, int extra_count)
>>> +{
>>> +	int rc;
>>> +
>>> +	BUG_ON(folio_test_writeback(src));	/* Writeback must be complete */
>>> +
>>> +	rc = folio_migrate_mapping(mapping, dst, src, extra_count);
>>> +
>>> +	if (rc != MIGRATEPAGE_SUCCESS)
>>> +		return rc;
>>> +
>>> +	if (mode != MIGRATE_SYNC_NO_COPY)
>>> +		folio_migrate_copy(dst, src);
>>> +	else
>>> +		folio_migrate_flags(dst, src);
>>> +	return MIGRATEPAGE_SUCCESS;
>>> +}
>>> +
>>>    /**
>>>     * migrate_folio() - Simple folio migration.
>>>     * @mapping: The address_space containing the folio.
>>> @@ -635,20 +654,7 @@ EXPORT_SYMBOL(folio_migrate_copy);
>>>    int migrate_folio(struct address_space *mapping, struct folio *dst,
>>>    		struct folio *src, enum migrate_mode mode)
>>>    {
>>> -	int rc;
>>> -
>>> -	BUG_ON(folio_test_writeback(src));	/* Writeback must be complete */
>>> -
>>> -	rc = folio_migrate_mapping(mapping, dst, src, 0);
>>> -
>>> -	if (rc != MIGRATEPAGE_SUCCESS)
>>> -		return rc;
>>> -
>>> -	if (mode != MIGRATE_SYNC_NO_COPY)
>>> -		folio_migrate_copy(dst, src);
>>> -	else
>>> -		folio_migrate_flags(dst, src);
>>> -	return MIGRATEPAGE_SUCCESS;
>>> +	return migrate_folio_extra(mapping, dst, src, mode, 0);
>>>    }
>>>    EXPORT_SYMBOL(migrate_folio);
>>>    diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>> index 7235424..f756c00 100644
>>> --- a/mm/migrate_device.c
>>> +++ b/mm/migrate_device.c
>>> @@ -313,14 +313,14 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
>>>     * folio_migrate_mapping(), except that here we allow migration of a
>>>     * ZONE_DEVICE page.
>>>     */
>>> -static bool migrate_vma_check_page(struct page *page)
>>> +static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
>>>    {
>>>    	/*
>>>    	 * One extra ref because caller holds an extra reference, either from
>>>    	 * isolate_lru_page() for a regular page, or migrate_vma_collect() for
>>>    	 * a device page.
>>>    	 */
>>> -	int extra = 1;
>>> +	int extra = 1 + (page == fault_page);
>>>      	/*
>>>    	 * FIXME support THP (transparent huge page), it is bit more complex to
>>> @@ -393,7 +393,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
>>>    		if (folio_mapped(folio))
>>>    			try_to_migrate(folio, 0);
>>>    -		if (page_mapped(page) || !migrate_vma_check_page(page)) {
>>> +		if (page_mapped(page) ||
>>> +		    !migrate_vma_check_page(page, migrate->fault_page)) {
>>>    			if (!is_zone_device_page(page)) {
>>>    				get_page(page);
>>>    				putback_lru_page(page);
>>> @@ -505,6 +506,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>>>    		return -EINVAL;
>>>    	if (!args->src || !args->dst)
>>>    		return -EINVAL;
>>> +	if (args->fault_page && !is_device_private_page(args->fault_page))
>>> +		return -EINVAL;
>>>      	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>>>    	args->cpages = 0;
>>> @@ -735,8 +738,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>>>    			continue;
>>>    		}
>>>    -		r = migrate_folio(mapping, page_folio(newpage),
>>> -				page_folio(page), MIGRATE_SYNC_NO_COPY);
>>> +		if (migrate->fault_page == page)
>>> +			r = migrate_folio_extra(mapping, page_folio(newpage),
>>> +						page_folio(page),
>>> +						MIGRATE_SYNC_NO_COPY, 1);
>>> +		else
>>> +			r = migrate_folio(mapping, page_folio(newpage),
>>> +					page_folio(page), MIGRATE_SYNC_NO_COPY);
>>>    		if (r != MIGRATEPAGE_SUCCESS)
>>>    			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
>>>    	}
