Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FCB67E93D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 16:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9A510E9A2;
	Fri, 27 Jan 2023 15:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE34710E99A;
 Fri, 27 Jan 2023 15:17:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mc9lAAC4UGmxSnRJIqZyNfs9wUTO9B2nE0Rh/qslUlPSUSIbxGHPML/Tdi4a83KhisHSXqn0HYHIkXwQL/V6d9dDHfjLQXz2zPACATkqO6fbbNbOiEbCWym+uCvvfolfkXS+pZ2vpgv1v9UzKbdKT6iGp5vGzGFI+OQ3rKGP1jNGr8+vG0Tl70vbGja4nRR1l3AMOiHKk0EN3xVwDT6diaVYdKPrPJL9HVveDxw8Kg4mGQO+u7tGnfwHJc1c4yfN4xUBzGq6hcrGYkZL/2OV76JojJ6urMSxQiSXjax1xF4zUDPCm6j4b357W7/+RkgKOLkZuLUP0Sz5haSMUwoPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hx7G3N2qMcCUFA/OtsEFWISP3B6azwkB+qsGE/IARL8=;
 b=mCigm7+hAGCrlaH66gkQzdhipq2uGTRF5IHhAlEPDF4uYl5mPEBS5Qa2RwFBw7zVeFl1LU0F9KxWNAPHudNqsvJoIoyHb/5/jGej9IjYozPGjwiu/lKklueg6/gUrh3Bno4fLXtZIQYpM6YODEwopGGIvO9q1U4SkxxBuMmSMsdQ7yz4sjcX8Vb2UPKSJZk/8bBiMs4o9o9bni69o31dNn6/o07OvR2fy92Q5612m0Hfs6gtjim0vIwANrHYxJDLLPsX0bXjpuzFZYYC4RuU4krrgM7umF8B+UF9Mu8dfQY4hgJUSrVcsfUo/865aWvBchVOLS3PQylgm9hrs+1hoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hx7G3N2qMcCUFA/OtsEFWISP3B6azwkB+qsGE/IARL8=;
 b=jiIwMpGbuO1sLqVxWrDUkD9dNbKs1dAoaas8zZaNtvfH303vv4V75lntuOLFZ7rVVN0kPwobb04wpW2YiUgsoMjxjTE26E//1X6CeMP+yPbTjl+FHfaUEgetxIWg9Z8M3angPkJ4p9ZfW4ieBsjaho+KIy+eZ21bjwfeE+TNcyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4323.namprd12.prod.outlook.com (2603:10b6:a03:211::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 15:17:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Fri, 27 Jan 2023
 15:17:14 +0000
Message-ID: <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
Date: Fri, 27 Jan 2023 16:17:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi interfaces
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BY5PR12MB4323:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ddfc5a0-77fb-487b-de2f-08db00799222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mBWDwUeuj8O0LN4jLQnIw6mIloU2WuZihZrdWldA+XXtSJQcRyR0I8tFrrv5HbcsSrOup7FHR5SwVIgEGmoydJuu4MNpDBy7ayAh3OYv6izBsw2CmcNaW4j3Jb0MYxWZtmY+cROi2Efg8w53f0paNFaZKWDD8VFUBiTIHKUzqpxQsPdbRPHGbtUsq0doZrq662D//fsORucy11zY5iRjN2RMoC2HgRc6G6uaT1gUQPrWILKfD5j4sX773YycegpXugflVtmKZ//eEGey/r0CScVeRk+VrSD21F0ERk+5dsqaWnBxdH7IPj79AoBA8VSz4fHUp+x30LWGnCUxKfRn9rIa321P71Tzx4vzZvknDMse/W6h0KvZKTLfu81GT/MPEw0IcWXUYuLLtMCO1G+85+9t5/fnLyLPAC+c+h41lqjd9hw5EcudJ5YmHduFMYC27imcuT/ZNrKFnJaKn4G8CrdhJ/WmedGgFWD/uJlM0vqQXZhCg3GUy8VSV7n6kvd0nZLM80NJKi4bapnDbtaWVUtqB0XMVTrxBZBhIJhpAHgThwnUpwz70WtAs+NamfTut6BAwlfEbNbgwQBZadm8DyxM743odfDlno02G1drazNGcwpHuBhbSgif9AFaxssf/rIP15E+AizOVoH1dP8asQb4Cam6ngznM7Pk4Y1AaO+fCpJSu4U8Qmk1sE2RquWTE1Z73WpyryRJHZHrxzeybjcJoUAXT8RhbGQo+++oMV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199018)(2906002)(8936002)(41300700001)(7416002)(5660300002)(6486002)(478600001)(186003)(4326008)(6512007)(8676002)(31686004)(6666004)(66899018)(6506007)(86362001)(83380400001)(38100700002)(2616005)(66946007)(66476007)(66556008)(36756003)(316002)(110136005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clNFa2JWTjFVQW1abnVkLzJyUWZsZk9sLzg5OHRtbElXTnB6R05xZWZoaDAy?=
 =?utf-8?B?NmFseDB6eTJTVW1tTGZWazZnSEdXdTVjbzhhUWtRTzhXMlFFRWhPbnBOaFlL?=
 =?utf-8?B?TjhWckJrb2lmNHFVOVlyc00wN3o5TXVVM0pMbURWYkJxSkwzYnNTSi81TlBM?=
 =?utf-8?B?TkJXSkxDeGJUUE1XcWlRZlgvOGNzVFZmakZON0pFUjFiYUdRSmRRbmgwY3dp?=
 =?utf-8?B?S0E5TFM1SmJIVld4dVJoOXRNaXNOWkJyRC9SVjdsMFM2aDhOQ3BoMVllWmRV?=
 =?utf-8?B?UUt5VVphZHlTREhtNGZHS0VDY28zNnZCblBGVHJCZ0JYUUpNOWRsbERLK2RJ?=
 =?utf-8?B?Y2hhNER6eHBuRjdqN3grUEpmWTZtK2YrVVRDRFQyTVpRS2JrT00wamY2aFdC?=
 =?utf-8?B?cEtUcXBEM2RpTUxyZWU1WG9ha3hVdGlPblB4MzRzNWRwYjRzak5MZEIxNUZ5?=
 =?utf-8?B?RUFlSEkrZXdWV2JQeWtseldXNzFwSWh0VDRIMzdYdklOaXZIRGU3QklRNU85?=
 =?utf-8?B?RDRDenhvRnd4ekFxNjZCeEthR1M5T2xoUDYxclBjc1NIS05pWHVyV2JBM3BL?=
 =?utf-8?B?SUQxRWJnSmxzWmoyMDdxNkhnNjhoRjRPaU5CY0hML3dTNTk1WWI2RDQvMDBP?=
 =?utf-8?B?YTgrOGsrdU5ERmJjRlJDaVo5Zzd2dGNXQm9OMnpqUHEyc2NxT1M2MlUyZW5u?=
 =?utf-8?B?YWp4OTYvbC93MnlUeWhabUJUSmZGNVRJQW1HdFpGS2lCN0R6bmsrNk9mWnV5?=
 =?utf-8?B?c2ZQc1lxV0hWdnNQcVNMUHR2T1F6Qk5EU2t6Q1dpRTNEVDM3WllyVHl5VHlW?=
 =?utf-8?B?a1hiM1FPTjJ1OHg5QnFhSUhERG9pQnVwK3owS3d2aGpKUVFFSEtCYmhGa1J5?=
 =?utf-8?B?SERsbnVQTk5nRGdJT3RQcFRwc0N2M2hmVW4wTVlQN3Rrd0RFdGJHei9VRU51?=
 =?utf-8?B?NTFxekI3RlNiOHd1eWJqSW05cEd1OGphVUxJdG5WNXIwbkVYUFR3Y2VCRVZv?=
 =?utf-8?B?MGNRcVF4WUM0cHBrNGFGTEhoNDhvTkszZkowM21qUzZyWTBIY0lVMFVkeXBX?=
 =?utf-8?B?Uk9WT0dVVmxVUER6ZzZnVG41dmRzZDRGbGR6NlA3VGQ2Q3M4cFFKN2NoSEMv?=
 =?utf-8?B?TUxrZHdDYlNCZlp4Snk1Zy9BcnpGcUVLZDdvQ3FXWFZrMVBWRzlrQldWcTFr?=
 =?utf-8?B?OXNCcjFzYkVEQ1A4QzdjdWJCWi9wWW02QzdHTnlIM0prdHJrYkdFMmFBUjRS?=
 =?utf-8?B?ZUpRanp5Rm5VQ1RBZXFwemZwU3hnTGdHSUJVaUhKQ2NyR0VLYlI3STBQU3pJ?=
 =?utf-8?B?TDZhVnZTSWxCUDhzZEthQ0RPMzZEcnd4RHkwVlVIeE8zNWlLOHVxakUvS2Vk?=
 =?utf-8?B?Y25hZ3RoKzBZVHZsL1VCWlZYU1RCSXk2eHpmT0p1cGM2T0pLTGpNZGZIaFZG?=
 =?utf-8?B?UVRXUGdMOW1nUUlicGduVXVPYStmMjh6eGhZckRxaW9VSSsvZkxZYm1LOG1L?=
 =?utf-8?B?cjlkM1JMSm1seXduY1lrVXlWTXpYNXBrKzFveFo1NVNmV2lSbTlZTGhnK1Ny?=
 =?utf-8?B?N0lncGVxeWVXT0hpSCs4MXNva2dJbmxGanZGNVZmZXRVMDJ6MVkvc0lNWEpB?=
 =?utf-8?B?dVdVM0VjL1IrNHZ3SEhzZ0JHVTlmUDlWeGpyZ3hjRERzNjVySnFmY2JIazdy?=
 =?utf-8?B?ZVQwN3g4OGtQZTFBVy9jeEdFcWMwNTNXK1NOVjdpMEUzUnpHUEljaWRGYzBP?=
 =?utf-8?B?V0NwOWwwZUdXbkM3dysyWElzRWtTVDNyQjJ0c3ZKcW1FV1ZZNWwwcjJETVY1?=
 =?utf-8?B?NWNUekVkK1JrS0JPWTFmaDR3YlpEMGx0UWFzVmFHVjRXS3lrUjZheUJzNUk3?=
 =?utf-8?B?NXFkRUY1djVWa0YzRlFKLzByb0R3Smk0S254cHNLT3lHSzFyaUxsU3pBTFQ3?=
 =?utf-8?B?b29JVFZYS3Fsc1lCRGtOZkY2UDlXS2dsZThuZ2o1Qk5SNEMremdxNFA1MVdr?=
 =?utf-8?B?bHRpdVlDR1JSRmZvamtINkhYMkxHV0ROd01kZEd0ZnNaa0NJdWsxU0ZtcFRz?=
 =?utf-8?B?SUM0UWh6U2VpSWc2MFVmWkxqWVUrditFeUtHS2dQVUljdHVYeU8vUGVDMmx3?=
 =?utf-8?B?KzJNdzVGcHRadnpxYnJ3RFJKNzFCM29wS1FZOTZMQzc5VVhQWEovOXVBRDNj?=
 =?utf-8?Q?iYiHatqYWL2UpooNMcqFNOft3IfJHWBfDnma7B7W4n0A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddfc5a0-77fb-487b-de2f-08db00799222
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 15:17:14.8514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Phd1YTTDbEwwK2edbY5cRdQ5GwSYaVqzTX/s+qbE9nISE3NC/o0YPHOYT5QUqSfQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4323
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
Cc: corbet@lwn.net, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bskeggs@redhat.com,
 jason@jlekstrand.net, nouveau@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.01.23 um 15:44 schrieb Danilo Krummrich:
> [SNIP]
>>>>
>>>> What you want is one component for tracking the VA allocations 
>>>> (drm_mm based) and a different component/interface for tracking the 
>>>> VA mappings (probably rb tree based).
>>>
>>> That's what the GPUVA manager is doing. There are gpuva_regions 
>>> which correspond to VA allocations and gpuvas which represent the 
>>> mappings. Both are tracked separately (currently both with a 
>>> separate drm_mm, though). However, the GPUVA manager needs to take 
>>> regions into account when dealing with mappings to make sure the 
>>> GPUVA manager doesn't propose drivers to merge over region 
>>> boundaries. Speaking from userspace PoV, the kernel wouldn't merge 
>>> mappings from different VKBuffer objects even if they're virtually 
>>> and physically contiguous.
>>
>> That are two completely different things and shouldn't be handled in 
>> a single component.
>
> They are different things, but they're related in a way that for 
> handling the mappings (in particular merging and sparse) the GPUVA 
> manager needs to know the VA allocation (or region) boundaries.
>
> I have the feeling there might be a misunderstanding. Userspace is in 
> charge to actually allocate a portion of VA space and manage it. The 
> GPUVA manager just needs to know about those VA space allocations and 
> hence keeps track of them.
>
> The GPUVA manager is not meant to be an allocator in the sense of 
> finding and providing a hole for a given request.
>
> Maybe the non-ideal choice of using drm_mm was implying something else.

Uff, well long story short that doesn't even remotely match the 
requirements. This way the GPUVA manager won't be usable for a whole 
bunch of use cases.

What we have are mappings which say X needs to point to Y with this and 
hw dependent flags.

The whole idea of having ranges is not going to fly. Neither with AMD 
GPUs and I strongly think not with Intels XA either.

>> We should probably talk about the design of the GPUVA manager once 
>> more when this should be applicable to all GPU drivers.
>
> That's what I try to figure out with this RFC, how to make it 
> appicable for all GPU drivers, so I'm happy to discuss this. :-)

Yeah, that was really good idea :) That proposal here is really far away 
from the actual requirements.

>>> For sparse residency the kernel also needs to know the region 
>>> boundaries to make sure that it keeps sparse mappings around.
>>
>> What?
>
> When userspace creates a new VKBuffer with the 
> VK_BUFFER_CREATE_SPARSE_BINDING_BIT the kernel may need to create 
> sparse mappings in order to ensure that using this buffer without any 
> memory backed mappings doesn't fault the GPU.
>
> Currently, the implementation does this the following way:
>
> 1. Userspace creates a new VKBuffer and hence allocates a portion of 
> the VA space for it. It calls into the kernel indicating the new VA 
> space region and the fact that the region is sparse.
>
> 2. The kernel picks up the region and stores it in the GPUVA manager, 
> the driver creates the corresponding sparse mappings / page table 
> entries.
>
> 3. Userspace might ask the driver to create a couple of memory backed 
> mappings for this particular VA region. The GPUVA manager stores the 
> mapping parameters, the driver creates the corresponding page table 
> entries.
>
> 4. Userspace might ask to unmap all the memory backed mappings from 
> this particular VA region. The GPUVA manager removes the mapping 
> parameters, the driver cleans up the corresponding page table entries. 
> However, the driver also needs to re-create the sparse mappings, since 
> it's a sparse buffer, hence it needs to know the boundaries of the 
> region it needs to create the sparse mappings in.

Again, this is not how things are working. First of all the kernel 
absolutely should *NOT* know about those regions.

What we have inside the kernel is the information what happens if an 
address X is accessed. On AMD HW this can be:

1. Route to the PCIe bus because the mapped BO is stored in system memory.
2. Route to the internal MC because the mapped BO is stored in local memory.
3. Route to other GPUs in the same hive.
4. Route to some doorbell to kick of other work.
...
x. Ignore write, return 0 on reads (this is what is used for sparse 
mappings).
x+1. Trigger a recoverable page fault. This is used for things like SVA.
x+2. Trigger a non-recoverable page fault. This is used for things like 
unmapped regions where access is illegal.

All this is plus some hw specific caching flags.

When Vulkan allocates a sparse VKBuffer what should happen is the following:

1. The Vulkan driver somehow figures out a VA region A..B for the 
buffer. This can be in userspace (libdrm_amdgpu) or kernel (drm_mm), but 
essentially is currently driver specific.

2. The kernel gets a request to map the VA range A..B as sparse, meaning 
that it updates the page tables from A..B with the sparse setting.

3. User space asks kernel to map a couple of memory backings at location 
A+1, A+10, A+15 etc....

4. The VKBuffer is de-allocated, userspace asks kernel to update region 
A..B to not map anything (usually triggers a non-recoverable fault).

When you want to unify this between hw drivers I strongly suggest to 
completely start from scratch once more.

First of all don't think about those mappings as VMAs, that won't work 
because VMAs are usually something large. Think of this as individual 
PTEs controlled by the application. similar how COW mappings and struct 
pages are handled inside the kernel.

Then I would start with the VA allocation manager. You could probably 
base that on drm_mm. We handle it differently in amdgpu currently, but I 
think this is something we could change.

Then come up with something close to the amdgpu VM system. I'm pretty 
sure that should work for Nouveau and Intel XA as well. In other words 
you just have a bunch of very very small structures which represents 
mappings and a larger structure which combine all mappings of a specific 
type, e.g. all mappings of a BO or all sparse mappings etc...

Merging of regions is actually not mandatory. We don't do it in amdgpu 
and can live with the additional mappings pretty well. But I think this 
can differ between drivers.

Regards,
Christian.
