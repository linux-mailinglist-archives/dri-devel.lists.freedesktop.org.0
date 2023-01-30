Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F1680E63
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 14:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732F110E23E;
	Mon, 30 Jan 2023 13:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D1D10E247;
 Mon, 30 Jan 2023 13:02:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FH7TI5mKDzIBlGQvInM8xd27Iuuif2oyRvoVhSHI9/qEKCgQ2rf55j6+fTHmZ5ur4gkGsVpmj6BR91vCA9oHcFcG53N2npL9DhtnwgXIAJQm722XSL2GyV1FGiKdp9Xjn/wqkis9PL3b1gCW/u90ZAFLrQ64byQ9qWmm0Ot9ofl1Rn3d5pt5coUc+rVFY0/vHfLaGQQ8yuJwR0dGl1H4xCHMC/UCJqQQX4iNZeUGaibxwl4Zwcpc+mJ3HgcLCGe4usPiE8UFuTPPC7jKQtsGAJzxx4j6cG0xOO/i0aHCsiPJ8e9baOFWlLhQkur/Ej2Oi6jp69MGYsrp8zVbqpTIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7htTHqqT7UWF7IT0s7av154or6g1XPJM/wfy4tnnerc=;
 b=JpOmHuqVp852opyUmZwDCDo/B/lZdMK59HTg80e5ClSUIEJHnwD9rVQTsHO6fY3gQW5eIzgg2lUs52faPtD34FnTcUu+AEcjczYe9i1FHtWHl/PI6eWTeXyzwUl59HTAuZ+1unICgPSguJaRFFh0S1PShegaGsNKM3dGG+TR0kVjBTAUeJQ+HeELUbZjUpcCvBIWh5grhIa40TgHj8HIG0c1Wlt3cHN9nGKqF76gamqxyC3aTUkOe5dNyIOnmsziCCFGz6KoOgKkKvZ/cmFQOE4T5nqe1+yQz0NaH6v0x1XuZ16oc674byOgOVUGhj8UcCIurrCqWlVDQXMDG9HCNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7htTHqqT7UWF7IT0s7av154or6g1XPJM/wfy4tnnerc=;
 b=kaDtpNGVcPn3Ghz5rsA79nwUkuJMteyyFBRI9OfrXCzEitIZQQlb0xlQLmhSE2jNbKwvkSwUFngq+5J+Kz8El6EB1Bk8m0zq8jcaK98v7f2UYRmzv5QMofJSpwPH4IPxpJC7aqeKekmMsdAOrc+fDCEaFknaddb/QUjlp5N2/TE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL0PR12MB4881.namprd12.prod.outlook.com (2603:10b6:208:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 13:02:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.030; Mon, 30 Jan 2023
 13:02:40 +0000
Message-ID: <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
Date: Mon, 30 Jan 2023 14:02:37 +0100
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
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL0PR12MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: e371458c-079e-42e1-d583-08db02c24466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yNzWi5OYkc0tH4PRbjLVMSxiBTSVNFGnRwgbpb8YyJQPNMsESXY7eiuRu2aVzhOWamHNniHbbYplU5sqOPXkBnTgaIxRRHMg5det904wwZ4RUhjiANl5sZud5V2qXi2hdYdX7X84JpdgsyQYidPLusi9e1mAg7eehyrZ+wd/2GkT42ATAuUq0j1avy+VTCqI9JkgNwVTDe+WYhHVynFIJkzUL/C0VfRbzGKLpeqJEwHjgSudy0uZFvhNEMKpMgDK0cVA8J02miSY/0DCv9Edkt3zCmvfpWaj9kbUkp6c8oaoXkcxJYFAod3edSMEtSLQtLOzidu+w42HDsWwPnOyizanaq6CHu40ktH4uz0YfvmqShY7Iqg8j9RZBB+xnRNVe5YsHPbiSgTWZ4czSHhFmPU92Bb+es7/fNOjDXfc8Du8luamiwR7rOWiY5nrsN8xno4m6H1Ftrxb26l6sz9BDh05XJuZgZAR1XzcMtwYFVFRpzZ0nCaRLgCufpaDNnviPYh17bUNZBbPOBSFM2qdRfglQ6IHIeNi3fxaKJb8Myu94lhkdXk/jjEeIGVAFPcZhZDZ/2EgJbszbWbGAL4u+y/JTD0w8kOBW2fIEf/ejsAVobWpsGVQx8K/fkMMjG9ZaZ5UzBPaEH//TeohKZJ/o2CAkY8K2m00/A1mnAXUwd0RMqNoYyODQ2b62x9GbBgn4cKZUwZJjCk7SKiea82OBW6y9aqAnT+sVehUCp3cVI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199018)(8936002)(41300700001)(31696002)(30864003)(86362001)(5660300002)(7416002)(83380400001)(66574015)(2616005)(110136005)(316002)(66556008)(66476007)(66946007)(38100700002)(4326008)(8676002)(6666004)(6512007)(26005)(186003)(6506007)(53546011)(36756003)(6486002)(478600001)(66899018)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTVYZHhSY3lOcWVUUXlObGVTV25pRlJrdFRVQnF4SXBsOWpCSUV5SzEwSUF3?=
 =?utf-8?B?Umw0NXI4TXpqRCtoY1BZcVQ5NDdFbHdLeXVCbjJNK2ZMWDJWakZuOEhYY0hn?=
 =?utf-8?B?K3ZiSGh2QWNMcGRpOUlnNnEvWUxvL1Jtb0ZMdm9QU0pSQ2dac1BwSk5LYTRE?=
 =?utf-8?B?MkZEeWkyQ2NWS2x5Zmdjc28xZWZuSURGUTd1a2dlNGZuUy9MYU1UN2VFMkNj?=
 =?utf-8?B?Q1BTSzJTRVVnU3c0eDhJU3hYbGlXMGhyNGVROUUvcTBEc1BBTWczOEx0Qmxt?=
 =?utf-8?B?RGc3T1QvZHQ4OTZKZ1B2a2FtTjhMd25GcThCYW9DRENBQzVBME9rODF3bHRC?=
 =?utf-8?B?YVpnQmR6RDdpQjRiRHRnbVh6bHNvQ3BHS0F6ODAxandHa0IzN1YxYVJjVzho?=
 =?utf-8?B?bWxodVB1bkJUUVIrQjBZZmc1QmVHSWlIajRJYU5rN0ZDUUR2WDU1RnhqSENR?=
 =?utf-8?B?eDZ3RTluUTZlWDBTYjVZbU5rZng0R1g3dEtUTDFpNUxpUnh6MklBeG1YS0Ju?=
 =?utf-8?B?aDN1ODl1V0VnRkVBK3RrQzkxY2Z1SWpKZnk1QjZtOHYvYVYya2NxVHkxeVB1?=
 =?utf-8?B?WHRZQkJ6R3JMalRMRUhnOVNyTVVvSnIyQzFBWXRFZk83QW9VODRXeTVrcVht?=
 =?utf-8?B?SWtKNzRtRVBJQk1RblFCM1ovSHBPNmxmM2VmSnRDNUdyWEMyMDFXYVNDUlQ1?=
 =?utf-8?B?VGJ4U0duMU53QytGUUtrdVdjV0lhUDhaVDN0V0lTalAzbkxleDd4U3pvVFlv?=
 =?utf-8?B?ZTQzaU9iTzZISXJNbnRTNGNQR0oxbndQbUVvZnNLRnM3YUhrMGx0TGRaY0RL?=
 =?utf-8?B?ZGZ5Vmx6dkFRdDB1QVVicTVaL0tic3U3ZEJaZ2xJRkVsV1g5S25yOUs3M2ND?=
 =?utf-8?B?RWJoSWwzWlB6Y09mZkV2QnY3SjU2QU5xY3pFNWNtSllXSEF3MDM5bTJQNkFv?=
 =?utf-8?B?eHE0aGlTbEVsa1hlT1ZhTm9JSGxOWU5Nbit2RTZoU2w0UDd6NmVuQUtpTU9O?=
 =?utf-8?B?dXZDQWFTbVJjM2JjWjBwLy9VcEh4RVVXUTg5Nkg5M1Fwb3RnNTk0WmRCWGZy?=
 =?utf-8?B?NHlxenoyTFRzcnBYOEx6MlJsSGx4RHRCWlpVZUhUK1BnemkyY0NDWGx2ZjU1?=
 =?utf-8?B?bkFEeDdabXJVSUJkVnJDOWM3STRUL0Y2TXJZdUNjUmY4VFMzRG8yaUVORlM1?=
 =?utf-8?B?Z2JRV3hubVNoOEhNR3ZtWVl5Yk02TDBYbFpzcjA2bzFFY0QxRDlaZHRUdWFj?=
 =?utf-8?B?OTc1SnJxVnoxUDVmdnc2dmFnTUhOb25hTDB6aGtnU0JqYXJpdlF3QmFNTkFY?=
 =?utf-8?B?by93RDB2UUNCY1dCYU9ZazdFK0M1c2ZaSEh6K1RYZVJlMUdUOUZKYVhneHFX?=
 =?utf-8?B?d3F0WW1Id1dBRmd4QVFLcUZuR1FJbE1ZVzNYaHlhbTRFQVpobkJMbnFpako5?=
 =?utf-8?B?SmFlNXZXUUZNSVdjOUNGTHZybzN2Z3IrcGVGZTd1SVRzT1JlKzJ3RDI2MVhU?=
 =?utf-8?B?YUhEeERqMnF5NCtZL0pkbTRxSFowTFVwK0RIRjBDSFIwbHA0L3U3VExGdEU1?=
 =?utf-8?B?d0NzSXJPcWpnUTZOZkdZLzZZRlZMNm1OL000Z1Fpc0d6dlJkSUpRcWVDRWxl?=
 =?utf-8?B?U2Rjd2ZEbjEwSU5idUE3clJMQVA3N2h4QmlsV25PT1BjSjhUTHhucjlQZWNW?=
 =?utf-8?B?WEFHNlhUS29LWHF2MGYzalUxeUdHTFNmMVpQWm1qcWw5M0pva2pRM1FKL2k5?=
 =?utf-8?B?WWVwNkh1SzEyVExBd1Y3dHJoNDlHbTVKK2g1ZklYQUlKRTNEK09ZSG5tOTc4?=
 =?utf-8?B?TG9ZV0hzN21IYmxQOFBzMHlHRXBwV0VZSWJJajBPdjAra09DdTVuTGtyWkNQ?=
 =?utf-8?B?c1FjTlNPc1F2TnhQODF5SmNIaDB5aWVleDdZQjJMd2hLQUJRNGptZWFKZXc1?=
 =?utf-8?B?ZVNvdXRUWmpCYk9ZWWRyaTFUMDZ5N3QxMDhzWkFhN1VFckNiTy9BYjgxMW56?=
 =?utf-8?B?ODY5Q0pzUHI1bGFmaklaYWpqYy9SWjBFY0oyalhEUjdYVGZ4YU5wUFZFOGpJ?=
 =?utf-8?B?U08rWGkyditrTGdXZ083UnZqYTdkNFAzM0VNM1VodXNYUGJGT2czcHZITlla?=
 =?utf-8?Q?ea3ti0nl+sRRC5GFbqyhtK1Iy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e371458c-079e-42e1-d583-08db02c24466
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:02:40.1620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9apuNZiCf6ZmRFp9+L6J+Pzsx884BW61o94pFvaZi7n2iv8PB8IaywtA7ryOCysL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4881
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

Am 29.01.23 um 19:46 schrieb Danilo Krummrich:
> On 1/27/23 22:09, Danilo Krummrich wrote:
>> On 1/27/23 16:17, Christian König wrote:
>>> Am 27.01.23 um 15:44 schrieb Danilo Krummrich:
>>>> [SNIP]
>>>>>>>
>>>>>>> What you want is one component for tracking the VA allocations 
>>>>>>> (drm_mm based) and a different component/interface for tracking 
>>>>>>> the VA mappings (probably rb tree based).
>>>>>>
>>>>>> That's what the GPUVA manager is doing. There are gpuva_regions 
>>>>>> which correspond to VA allocations and gpuvas which represent the 
>>>>>> mappings. Both are tracked separately (currently both with a 
>>>>>> separate drm_mm, though). However, the GPUVA manager needs to 
>>>>>> take regions into account when dealing with mappings to make sure 
>>>>>> the GPUVA manager doesn't propose drivers to merge over region 
>>>>>> boundaries. Speaking from userspace PoV, the kernel wouldn't 
>>>>>> merge mappings from different VKBuffer objects even if they're 
>>>>>> virtually and physically contiguous.
>>>>>
>>>>> That are two completely different things and shouldn't be handled 
>>>>> in a single component.
>>>>
>>>> They are different things, but they're related in a way that for 
>>>> handling the mappings (in particular merging and sparse) the GPUVA 
>>>> manager needs to know the VA allocation (or region) boundaries.
>>>>
>>>> I have the feeling there might be a misunderstanding. Userspace is 
>>>> in charge to actually allocate a portion of VA space and manage it. 
>>>> The GPUVA manager just needs to know about those VA space 
>>>> allocations and hence keeps track of them.
>>>>
>>>> The GPUVA manager is not meant to be an allocator in the sense of 
>>>> finding and providing a hole for a given request.
>>>>
>>>> Maybe the non-ideal choice of using drm_mm was implying something 
>>>> else.
>>>
>>> Uff, well long story short that doesn't even remotely match the 
>>> requirements. This way the GPUVA manager won't be usable for a whole 
>>> bunch of use cases.
>>>
>>> What we have are mappings which say X needs to point to Y with this 
>>> and hw dependent flags.
>>>
>>> The whole idea of having ranges is not going to fly. Neither with 
>>> AMD GPUs and I strongly think not with Intels XA either.
>>
>> A range in the sense of the GPUVA manager simply represents a VA 
>> space allocation (which in case of Nouveau is taken in userspace). 
>> Userspace allocates the portion of VA space and lets the kernel know 
>> about it. The current implementation needs that for the named 
>> reasons. So, I think there is no reason why this would work with one 
>> GPU, but not with another. It's just part of the design choice of the 
>> manager.
>>
>> And I'm absolutely happy to discuss the details of the manager 
>> implementation though.
>>
>>>
>>>>> We should probably talk about the design of the GPUVA manager once 
>>>>> more when this should be applicable to all GPU drivers.
>>>>
>>>> That's what I try to figure out with this RFC, how to make it 
>>>> appicable for all GPU drivers, so I'm happy to discuss this. :-)
>>>
>>> Yeah, that was really good idea :) That proposal here is really far 
>>> away from the actual requirements.
>>>
>>
>> And those are the ones I'm looking for. Do you mind sharing the 
>> requirements for amdgpu in particular?
>>
>>>>>> For sparse residency the kernel also needs to know the region 
>>>>>> boundaries to make sure that it keeps sparse mappings around.
>>>>>
>>>>> What?
>>>>
>>>> When userspace creates a new VKBuffer with the 
>>>> VK_BUFFER_CREATE_SPARSE_BINDING_BIT the kernel may need to create 
>>>> sparse mappings in order to ensure that using this buffer without 
>>>> any memory backed mappings doesn't fault the GPU.
>>>>
>>>> Currently, the implementation does this the following way:
>>>>
>>>> 1. Userspace creates a new VKBuffer and hence allocates a portion 
>>>> of the VA space for it. It calls into the kernel indicating the new 
>>>> VA space region and the fact that the region is sparse.
>>>>
>>>> 2. The kernel picks up the region and stores it in the GPUVA 
>>>> manager, the driver creates the corresponding sparse mappings / 
>>>> page table entries.
>>>>
>>>> 3. Userspace might ask the driver to create a couple of memory 
>>>> backed mappings for this particular VA region. The GPUVA manager 
>>>> stores the mapping parameters, the driver creates the corresponding 
>>>> page table entries.
>>>>
>>>> 4. Userspace might ask to unmap all the memory backed mappings from 
>>>> this particular VA region. The GPUVA manager removes the mapping 
>>>> parameters, the driver cleans up the corresponding page table 
>>>> entries. However, the driver also needs to re-create the sparse 
>>>> mappings, since it's a sparse buffer, hence it needs to know the 
>>>> boundaries of the region it needs to create the sparse mappings in.
>>>
>>> Again, this is not how things are working. First of all the kernel 
>>> absolutely should *NOT* know about those regions.
>>>
>>> What we have inside the kernel is the information what happens if an 
>>> address X is accessed. On AMD HW this can be:
>>>
>>> 1. Route to the PCIe bus because the mapped BO is stored in system 
>>> memory.
>>> 2. Route to the internal MC because the mapped BO is stored in local 
>>> memory.
>>> 3. Route to other GPUs in the same hive.
>>> 4. Route to some doorbell to kick of other work.
>>> ...
>>> x. Ignore write, return 0 on reads (this is what is used for sparse 
>>> mappings).
>>> x+1. Trigger a recoverable page fault. This is used for things like 
>>> SVA.
>>> x+2. Trigger a non-recoverable page fault. This is used for things 
>>> like unmapped regions where access is illegal.
>>>
>>> All this is plus some hw specific caching flags.
>>>
>>> When Vulkan allocates a sparse VKBuffer what should happen is the 
>>> following:
>>>
>>> 1. The Vulkan driver somehow figures out a VA region A..B for the 
>>> buffer. This can be in userspace (libdrm_amdgpu) or kernel (drm_mm), 
>>> but essentially is currently driver specific.
>>
>> Right, for Nouveau we have this in userspace as well.
>>
>>>
>>> 2. The kernel gets a request to map the VA range A..B as sparse, 
>>> meaning that it updates the page tables from A..B with the sparse 
>>> setting.
>>>
>>> 3. User space asks kernel to map a couple of memory backings at 
>>> location A+1, A+10, A+15 etc....
>>>
>>> 4. The VKBuffer is de-allocated, userspace asks kernel to update 
>>> region A..B to not map anything (usually triggers a non-recoverable 
>>> fault).
>>
>> Until here this seems to be identical to what I'm doing.
>>
>> It'd be interesting to know how amdgpu handles everything that 
>> potentially happens between your 3) and 4). More specifically, how 
>> are the page tables changed when memory backed mappings are mapped on 
>> a sparse range? What happens when the memory backed mappings are 
>> unmapped, but the VKBuffer isn't de-allocated, and hence sparse 
>> mappings need to be re-deployed?
>>
>> Let's assume the sparse VKBuffer (and hence the VA space allocation) 
>> is pretty large. In Nouveau the corresponding PTEs would have a 
>> rather huge page size to cover this. Now, if small memory backed 
>> mappings are mapped to this huge sparse buffer, in Nouveau we'd 
>> allocate a new PT with a corresponding smaller page size overlaying 
>> the sparse mappings PTEs.
>>
>> How would this look like in amdgpu?
>>
>>>
>>> When you want to unify this between hw drivers I strongly suggest to 
>>> completely start from scratch once more.
>>>
>
> I just took some time digging into amdgpu and, surprisingly, aside 
> from the gpuva_regions it seems like amdgpu basically does exactly the 
> same as I do in the GPU VA manager. As explained, those region 
> boundaries are needed for merging only and, depending on the driver, 
> might be useful for sparse mappings.
>
> For drivers that don't intend to merge at all and (somehow) are 
> capable of dealing with sparse regions without knowing the sparse 
> region's boundaries, it'd be easy to make those gpuva_regions optional.

Yeah, but this then defeats the approach of having the same hw 
independent interface/implementation for all drivers.

Let me ask the other way around how does the hw implementation of a 
sparse mapping looks like for NVidia based hardware?

For newer AMD hw its a flag in the page tables, for older hw its a 
register where you can specify ranges A..B. We don't really support the 
later with AMDGPU any more, but from this interface I would guess you 
have the second variant, right?

Christian.

>
>>> First of all don't think about those mappings as VMAs, that won't 
>>> work because VMAs are usually something large. Think of this as 
>>> individual PTEs controlled by the application. similar how COW 
>>> mappings and struct pages are handled inside the kernel.
>>
>> Why do you consider tracking single PTEs superior to tracking VMAs? 
>> All the properties for a page you mentioned above should be equal for 
>> the entirety of pages of a whole (memory backed) mapping, aren't they?
>>
>>>
>>> Then I would start with the VA allocation manager. You could 
>>> probably base that on drm_mm. We handle it differently in amdgpu 
>>> currently, but I think this is something we could change.
>>
>> It was not my intention to come up with an actual allocator for the 
>> VA space in the sense of actually finding a free and fitting hole in 
>> the VA space.
>>
>> For Nouveau (and XE, I think) we have this in userspace and from what 
>> you've written previously I thought the same applies for amdgpu?
>>
>>>
>>> Then come up with something close to the amdgpu VM system. I'm 
>>> pretty sure that should work for Nouveau and Intel XA as well. In 
>>> other words you just have a bunch of very very small structures 
>>> which represents mappings and a larger structure which combine all 
>>> mappings of a specific type, e.g. all mappings of a BO or all sparse 
>>> mappings etc...
>>
>> Considering what you wrote above I assume that small structures / 
>> mappings in this paragraph refer to PTEs.
>>
>> Immediately, I don't really see how this fine grained resolution of 
>> single PTEs would help implementing this in Nouveau. Actually, I 
>> think it would even complicate the handling of PTs, but I would need 
>> to think about this a bit more.
>>
>>>
>>> Merging of regions is actually not mandatory. We don't do it in 
>>> amdgpu and can live with the additional mappings pretty well. But I 
>>> think this can differ between drivers.
>>>
>>> Regards,
>>> Christian.
>>>
>

