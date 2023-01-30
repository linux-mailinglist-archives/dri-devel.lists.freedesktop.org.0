Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB52680E4B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9DF10E243;
	Mon, 30 Jan 2023 12:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745AC10E243;
 Mon, 30 Jan 2023 12:58:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcHXOkQzSL+xYONxlDm9puAMo17w4EDKUNYnYp7PEvxgPJlucQAq8j4+6wnUusNHLP9H3xeoHV9dSK9pFFBd2lwaUKUP+cUxjUkPH5HRu6uDIFGbm3pgF7cfklvKs20TVBLFK3mjRMNbgdwnWXc1Ymr9JaAQwNxcGDqQ4X9439y1JH4cEjxIJthTGuUOqkMOwqZlQ0pg6gE2hXphrO7JB0ffwreHbJZP0Ym/Cspe37w5MptP2ZCXkamvOnyVDCWtryJVaoS/Yattu53OBFzluHSJaxnHl7R3WD0x6rBAYJ/GwjRYB8r3za8ro3QOvKqiFTyvH7rLnsk7O473PoS8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImxAlzuQ4sUZpeX60QiCXG3d0rOR+4ISnYFb4s0J1FU=;
 b=VSE/OU2VjaaA5xwywH1GExT/Gg0h2fwB2ugfTvYd8CSY5jdJHy/cvZcw0LqRfxUuZLKlkUGZDqPxLhyw4oulDdwr0oar0ocdVpkmJ767GRkgO8i2MmQdfYVZwixbgfzLXwUTrk6uPe5Oz+68uXW6slLa6yM1Wm6sGf7iJQfCeMrzBhpRhVl5LXlDI+RbZHSGTyt7FeCFfbJBxzhwKV1aXJ6oEiGUsv4uZ8iEzRezGC1JP/wO8YTmmoeqWBU/DceeA2g5mzviGFkCtWS9UtTfh4q4Jt09QnlcVug8cUhIOELGB9ZQ/VgyXWqwHZ3DjOSAsICb2b8HmROak5qPrO8noQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImxAlzuQ4sUZpeX60QiCXG3d0rOR+4ISnYFb4s0J1FU=;
 b=qxtHOkAOtZYUwgCaXXUkU8gK3/D1s04QA15RsNwISLVck6Hmb2NfAtzHmCm+SLxj6U/crDrXaaqx33MDuBSNpA2izi29whCIAtDI6kcVwgUfARkPk7qMKUR1RAdifAJHmW2/B0L0dakSrPOY6XkfSpViu+MhaK+JZGU4kGxz8y8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7156.namprd12.prod.outlook.com (2603:10b6:806:2a7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 12:58:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.030; Mon, 30 Jan 2023
 12:58:35 +0000
Message-ID: <5e415baf-94d9-2723-3770-9a35f9fa6278@amd.com>
Date: Mon, 30 Jan 2023 13:58:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi interfaces
Content-Language: en-US
To: David Airlie <airlied@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <CAMwc25oGap_hEg5AquM_L2eH42PcG=pM3KPS6HNTNj-SzeHu+g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMwc25oGap_hEg5AquM_L2eH42PcG=pM3KPS6HNTNj-SzeHu+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9d9079-9e2b-449b-df7c-08db02c1b276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mALIb9AIdMTPzbNclxCYXXM1+y1pFiz5y2l9BeTkBAGMSo+13Z4lXs/mU94nh9DFBYZKL5Z+P/tEulVHbgmh2TzLZIPMbBP+EkAe5TlyivW8gIsEYBymPqKc0A7MiFtEzP4b/8veqxscr1etVgvrLNEDxXPOJ4BgkLZaeyjyt6SerDCrUf+55T5W9AAtIfc7hHeNWHvj9018r5UGr9IqxthLtNjmsHaVp7sPEvshlzRLLmjkprCvSv4Lo2/7HdaTYumpoKtKGDi0Xx6UIcMJbBa27RzRYJ7MFCUlREFvGabevIrbUN9S6lbgz18qrrXOHejA8hYYP4zJF7VO1PoosB6VvfEqSvv1BmZOQZj4GczJIsaxy8L16fQiAhtoi7lV9hUOgoYmvHwW/xebMXYcYDkyj7t1164VUKaWeC+cH1FTvvv3VTRveqtE4NQhT6OCcXH/jcT1pJwZDA31yCfPA9FVXJHhQV1Ym9pWnMUb/ZZP/lbUs1eK3r40NZjYmXzhbknbWXwuxWXWkJ/He4CYfgIOCG0g/qJwsCsA1AJ48yUirhfwFEtGIoqVMYIbakqW6x0ZkUUsT3T8c1CFEg//y/BRCv3gv4Y70Lc3p539HAbC57Z0mZ3UNfFrnVdr3VNRTjFXBzNp7r+lFuByN6Vu5LXvo9Gx6hN7mNvU4mUY4GJgvj/4mCAnYZCL71Ej8ltCtZaqVp/+J1fw5T0rF8oHAFWglij9q+OEzR7gUknxq6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199018)(38100700002)(8936002)(66556008)(8676002)(6916009)(4326008)(66946007)(66476007)(36756003)(41300700001)(86362001)(2906002)(31696002)(5660300002)(7416002)(54906003)(83380400001)(316002)(6486002)(478600001)(186003)(31686004)(6506007)(6666004)(6512007)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWNGZFFVbE5MUmsrc1lPWVlZaEl3dVVoWmRNamdDL3Z6KzdLVWJXV3h4QXEv?=
 =?utf-8?B?ZGpGMWRtNEMvMHAxL0p4TzJFQ21Db1BpTWJRajJ5QUNNMkZGRU5ibGlhQ3I2?=
 =?utf-8?B?SFNkdGk3R3VFZld5SHROSk8zQyt0ZHhVbjdkdGVIRzdDZ1BQbFNCSDRCbnEy?=
 =?utf-8?B?NXVCNFRGTDJreVpjQWl5TW85bUE0REpYdWJ5OG5qOGljNlpVK0RxUFVuckRJ?=
 =?utf-8?B?TG9OaGphWmFqSkt5Q2RYSXo3Sy9qbCtRRml6Q1lqZzdaRDNtVEtXNTlNckYy?=
 =?utf-8?B?ay9tN3c4TEtuYVlzcXpNRURTS29JQmMyZlNhQy9yMUkxTGdJRzUrSEpmVmJ4?=
 =?utf-8?B?b1ovTmhIdzhzNVBlVWFySWhGM0FENnluOXMrVUxRYUoyN3JaaXN2ampmbENQ?=
 =?utf-8?B?U1ZiRUtMd1duNWpodVF4K3lQdVNvbzc0UldYV3hrVDBSZjdmYldLRW8vejlk?=
 =?utf-8?B?VzhhRlVtcks0SlRmYmdpQXVSdmUyUDdPd2g0aldINHZpclByTWVkcFlUd2FY?=
 =?utf-8?B?ZmZZQjd3K3BZdmZ4YnFRR1Ftb2tOcTdtLzh5TEt5S0EzZHRUUzdaSEJFdnVF?=
 =?utf-8?B?OWs0UTlibDBYSFhTQW8rajlDekp1NnV1ZG1rU3Q4d0FEYUJzU3RneHE1emVs?=
 =?utf-8?B?VUZSRVd6djNxdDZiQWVFOHB1MC9sMStzQ2xSNWFVYVlxOU1GWVRtSHZNaFhF?=
 =?utf-8?B?SGI3TXpoczAycGFoYXNXdmUycktUcWN4c3FhdGJkQ0Zib0UwM0FGaU9BWnps?=
 =?utf-8?B?V204bmJYWUJsZHpGOGhjcGdNUzZsNEhlRWJxTEN4WStweG5YaCtCQ0N6SjVV?=
 =?utf-8?B?QkFhZS9hVDRweEJvS3h2OFBsSnhFRTd3OG5WUG5VYncxZjYva0tTeUxHenI4?=
 =?utf-8?B?MTZkczlzbm56UTU1TUwwb0pDajdPVGJDbzFPQkZKOEM1azVKTWZFOWFOekdR?=
 =?utf-8?B?MlREWUVHcEZESmRBVmZoZ0krTzFsMFk4anV3YU9rbWJ1K1AvZzdMbTZDWDZm?=
 =?utf-8?B?ZjZqQWx0QXYwb1hpNVlGaHFqZTZVT2tSV3M4WDY0VFR6UzBOenQ3MEwzaW5p?=
 =?utf-8?B?OHJ0ekVJa2VlWTcycElscUpta3ZzUERHaVVJMU5UdlBtTVdJYmVLa2I5V09M?=
 =?utf-8?B?TEZ6YWFlZDE5SjZUVElFbVE2QjAyQk5LM25hWTBIMFFXaWxENWZsOFlPQXFu?=
 =?utf-8?B?TkIzS3VJYjZvOFZJUEVTbWdWa1V0d2dsa2hUa0Z2ZGtabzVyUE1ZdE1MR1lz?=
 =?utf-8?B?YnYxV1ZyNnVFL0hvQldoRitKYVdVMCtSTXdiQ29uRzZlRHVlQ0pzWksxN25m?=
 =?utf-8?B?NlpVRGRzV1NyZzFFZThKQWIyaGJDL2FzWU15bitJODdkT0VJWjFrQy9UK3M2?=
 =?utf-8?B?U0RCR3JqOUozQ1JyN1ZLK0hGNjZJdWdQKzZ0bkdHQWtZb1B6VytJSFUwRXNV?=
 =?utf-8?B?d3hndjVTZXl2RVhid3o3Tm5aMVBDTUdwYlhhYmlWak11a2llams1cEdMeC9D?=
 =?utf-8?B?Yzd2TU9PMzk2UzYzV3h4Y1hxdjFOWjFmSVltd01CMDZtUS9OUVd1REN2b1lG?=
 =?utf-8?B?UzY1VXJObldzazNSM05hQzc4aDN5YzF3WUNjSk1STzlTS0ZoTnBaZVk1Ryto?=
 =?utf-8?B?YjVYR1pERUM2REw2K1IxN3NBVkJvL1JJakNnY1lvNUwrRk8yUmtCTWhjODVI?=
 =?utf-8?B?aFFvbnRERWErWVdqMGRFOU9LUy9RUStnTUtHTndmZUVqdG1wNnBDcWFIT3cv?=
 =?utf-8?B?SzBkUERVZEJLVlJXNEV0SnlnTG0wa2xtNkJSUUU5clZMeHk2MDZmNW8yeElO?=
 =?utf-8?B?WEp1U2hOZEtXdndINUR3aUlKUmNSMTFTcFM0b1hSN2hmTlRwOW1jMSt1SlJG?=
 =?utf-8?B?VzFJUitXYWFmMittSHRaYVF3Wm1MUGp6bFQzMG5sMVVhYTl1MnZIa1BuRWVz?=
 =?utf-8?B?NWNKbGVFSjZHSEMvanFYYkpsdEtTYTNSZVRXV25pbzZGeHgxM0JYdmtRbEVH?=
 =?utf-8?B?MXpyOXR1dVZBRjlZL3pVWGlJOGI4WFMwSmh2UnZoYW9mUWJxT3dGRFNqUHFF?=
 =?utf-8?B?M2F3MWVZYmNVTEp5VFdlM0FubmhnQkxPYTZ1R3cwckM1NnpiZ1RoWUtGTVhy?=
 =?utf-8?Q?ocDLiPnK9y8pRfyt5nGjjc08E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9d9079-9e2b-449b-df7c-08db02c1b276
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 12:58:35.1166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAIsQ9NKq8gCQBOKhgz4sT+k+o6TJ9kmF4mvJWu7ofpp2j+ru4AnGZbromQLOcCk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7156
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
Cc: Matthew Brost <matthew.brost@intel.com>, corbet@lwn.net,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>, bskeggs@redhat.com, jason@jlekstrand.net,
 nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.01.23 um 21:25 schrieb David Airlie:
> [SNIP]
>> What we have inside the kernel is the information what happens if an
>> address X is accessed. On AMD HW this can be:
>>
>> 1. Route to the PCIe bus because the mapped BO is stored in system memory.
>> 2. Route to the internal MC because the mapped BO is stored in local memory.
>> 3. Route to other GPUs in the same hive.
>> 4. Route to some doorbell to kick of other work.
>> ...
>> x. Ignore write, return 0 on reads (this is what is used for sparse
>> mappings).
>> x+1. Trigger a recoverable page fault. This is used for things like SVA.
>> x+2. Trigger a non-recoverable page fault. This is used for things like
>> unmapped regions where access is illegal.
>>
>> All this is plus some hw specific caching flags.
>>
>> When Vulkan allocates a sparse VKBuffer what should happen is the following:
>>
>> 1. The Vulkan driver somehow figures out a VA region A..B for the
>> buffer. This can be in userspace (libdrm_amdgpu) or kernel (drm_mm), but
>> essentially is currently driver specific.
> There are NO plans to have drm_mm do VA region management, VA region
> management will be in userspace in Mesa. Can we just not bring that up again?

If we are talking about Mesa drivers then yes that should work because 
they can then implement all the hw specific quirks you need for VA 
allocation. If the VA allocation should be hw independent then we have a 
major problem here.

At least on AMD hw we have four different address spaces and even if you 
know of hand from which one you want to allocate you need to share your 
address space between Vulkan, VA-API and potentially even things like 
ROCm/OpenCL.

If we don't properly do that then the AMD user space tools for debugging 
and profiling (RMV, UMR etc...) won't work any more.

> This is for GPU VA tracking not management if that makes it easier we
> could rename it.
>
>> 2. The kernel gets a request to map the VA range A..B as sparse, meaning
>> that it updates the page tables from A..B with the sparse setting.
>>
>> 3. User space asks kernel to map a couple of memory backings at location
>> A+1, A+10, A+15 etc....
> 3.5?
>
> Userspace asks the kernel to unmap A+1 so it can later map something
> else in there?
>
> What happens in that case, with a set of queued binds, do you just do
> a new sparse mapping for A+1, does userspace decide that?

Yes, exactly that. Essentially there are no unmap operation from the 
kernel pov.

You just tell the kernel what should happen when the hw tries to resolve 
address X.

This what can happen can potentially be resolve to some buffer memory, 
ignored for sparse binding or generate a fault. This is stuff which is 
most likely common to all drivers.

But then at least on newer AMD hardware we also have things like raise a 
debug trap on access, wait forever until a debugger tells you to 
continue.....

It would be great if we could have the common stuff for a VA update 
IOCTL common for all drivers, e.g. in/out fences, range description 
(start, offset, end....), GEM handle in a standardized structure while 
still be able to handle all that hw specific stuff as well.

Christian.

>
> Dave.
>
>> 4. The VKBuffer is de-allocated, userspace asks kernel to update region
>> A..B to not map anything (usually triggers a non-recoverable fault).
>>
>> When you want to unify this between hw drivers I strongly suggest to
>> completely start from scratch once more.
>>
>> First of all don't think about those mappings as VMAs, that won't work
>> because VMAs are usually something large. Think of this as individual
>> PTEs controlled by the application. similar how COW mappings and struct
>> pages are handled inside the kernel.
>>
>> Then I would start with the VA allocation manager. You could probably
>> base that on drm_mm. We handle it differently in amdgpu currently, but I
>> think this is something we could change.
>>
>> Then come up with something close to the amdgpu VM system. I'm pretty
>> sure that should work for Nouveau and Intel XA as well. In other words
>> you just have a bunch of very very small structures which represents
>> mappings and a larger structure which combine all mappings of a specific
>> type, e.g. all mappings of a BO or all sparse mappings etc...
>>
>> Merging of regions is actually not mandatory. We don't do it in amdgpu
>> and can live with the additional mappings pretty well. But I think this
>> can differ between drivers.
>>
>> Regards,
>> Christian.
>>

