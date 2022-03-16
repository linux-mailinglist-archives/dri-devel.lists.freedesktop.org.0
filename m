Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CAD4DB1C2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 14:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C2410E5B8;
	Wed, 16 Mar 2022 13:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A393510E5B5;
 Wed, 16 Mar 2022 13:43:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJDH9NIsuTTvVnweWMloFeleJzYPQF5NxdsMxTXBSJlvqjCmI68huWaD8ml1h+V1YSpHlhUBiu/S3jTRgWvp5C1SahvbJiQxCltin6Lo+ieUxIkNIbmyhjNsSdaftsdnlvfrrY6DFO2wmhYFBXGsbe+gfGDP9WXIc2mGOwASq+X7FXtT/Tyc7WqDzvWsKanjg8hV0IrUh10JdFu9eKhWRcgObQlM374IHVNXTDyKU7NcPbFSlDBpJAIDMISSCKQbIJcSBBVt7WRbaYSjtxCNSKpTyat4s7Fb2rgZ5PadMHKgW5tUm173BE+ga+98rNKBpfwKv8Z/D3of44RAMjM2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ymY/0Fk3tdHA6qdpLIr9NlUcEQDSbf51PHWUe5nAJU=;
 b=ZjJviPfMv5HLSd2EnEfsk77cHQl4c8Odop+smrkTlMCrhrm9L4BFTbA7vqFZVGDhjCtnLccxoHp9D8PkZiXW4jIcCRWs0hAYYMde9nN0lG6cF1PYwwHvaMBLLLI8IZXcIeP8/87NF8lILd3OT/n5ESeOqpn92gd11pAQPTvzVMRqMulz5EAQk3Xy0SbBNMaI/AHQAPsCLoTACP/pbk4wnEOM/CpdRBohgsqK14tv4nrcudT8aWUgvJ3Fn+uMkRyAbtpZd+HlRfrnZLEGeYvkJXS4pnXKW+OeORu/QYCtaXDT+WtUw8nHjFy4k6U3fG6Tz5LMQkIjyu0jlG2WThEBxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ymY/0Fk3tdHA6qdpLIr9NlUcEQDSbf51PHWUe5nAJU=;
 b=mtGnHliV7U9LSl7imBLgPuO5Wrw1XkNw3ubLS6VeVZY58ECQoM9dRAA5Jcb31OkXWLaM3TMjERO0OUp+5oV3Lt2sTwrdMkDX2ytVN3ZxxESNT2lY9n3dSMD57S4W390rsL5z0GPvb1DvjqS+DFNMR6CYwQ58SGYj9K0TgAS5Hfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5064.namprd12.prod.outlook.com (2603:10b6:208:30a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Wed, 16 Mar
 2022 13:43:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 13:43:47 +0000
Message-ID: <2b5816aa-c082-b03a-c7a0-e4351e8e4e5a@amd.com>
Date: Wed, 16 Mar 2022 14:43:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 5/7] drm/ttm: add range busy check for range manager
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220315180444.3327283-1-bob.beckett@collabora.com>
 <20220315180444.3327283-6-bob.beckett@collabora.com>
 <2918e4a2-3bb8-23e0-3b8c-90c620b82328@amd.com>
 <1eef3b71-ef7c-24d1-b0d7-695fc1d2d353@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <1eef3b71-ef7c-24d1-b0d7-695fc1d2d353@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0067.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::44) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73e2584c-584d-4c86-ff78-08da0752fee8
X-MS-TrafficTypeDiagnostic: BL1PR12MB5064:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5064D9E3478A3909C11CFD4083119@BL1PR12MB5064.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QxBONsouVDu3n/e+kskxkU2yuy9DThftu1YNb3CA4MHXixMnDKKZ0mWvgd0cfP5ZDMOgWJmaGunnVLjORFmNpey8McvbABA5KbylAVHAuadwE/m5q90iEb/+f6mnNPe6k48pr2x2MaG42pCUJMbxviQeVc13a0S5W9SwVEhYtSiULxIWW1g9BqJftN3amAriN4O3/PBWTb0pdunm2FcpJc7QROscC4JEl6nhZNuodcCrB4v536CK5Cr75dpvslMF9vl/VRZ3XFR6LimHB5IoGdtkxBFoKToqA59mXAL7iw/0I/5guXM6AGVZVeCyjnfXUFcVYfjwUYLcAllJteyF7XXZW+ooyh1vu5/tjbw5sHypjPH5/JuIN/d8jFGu6DGOiCq373bQdS10aQ+uXh33Xj0cReyzuHJAhlFSjIkmupqnw0Q1yHpot54ml8ce0NuWUahCZC4/GH5O8Bv/hpLIRYUQFTW682GBvRj/bKJ2mFBL4ZMtxuqMVVbVSj5KbYXD+11E/Jnpbq+xvCb2BzEhRsWnrmGLrDPpGl+ijHNoAl7KJS1nHL0IOg2v0xlcaUzwJ2+aOBTVFGexjp5GgUgh3551T85ZQeta8UhMRUhBomuxe/AOOZlvJq7MAN+ge+OyoI5keI7xzkbRzipNs7D4aoqNu2xDr0KeGk4SqhlKJKhlp9spcR8YlTxMWAHLVQHsQuRL5SroJ6pqw+CF7pJnJP5goVwHZ9n830QX0j55Ask=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(316002)(66946007)(66556008)(66476007)(8676002)(2906002)(36756003)(110136005)(186003)(31686004)(86362001)(31696002)(4326008)(508600001)(6666004)(83380400001)(6506007)(53546011)(8936002)(6486002)(5660300002)(6512007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UENNbjVtMXRNbkZvVENwOXZSSGtvS21veGEreUx2REJvSUtmcFpnc2JMaWxL?=
 =?utf-8?B?dVAwSXdJSGFCbEx5cTF3NjNCeTlxRmNzcFJEQitkM1EzNmEzWE1nT2YxNGZh?=
 =?utf-8?B?SStmdkVGUitTOXNBbTFsaEtnOXRhWnVoaHdyOFRuVi9BUXE0Z3Y0Ym5Uc2hZ?=
 =?utf-8?B?NGZkQjV4VS9EZ3plakRVdkRmRktBVTlITUVwUVl0VnhJaTl0SzV1ZlN6ZVpG?=
 =?utf-8?B?WWwyYmxWR0hnODc1WnpWVml0c0pjdHVkcXZUSDNkZ1NBQnNaUEFNSlJob2JU?=
 =?utf-8?B?RlI1cktQK2poM0czQnEvTFZOYjFaN25YVUJHdHNXcmRPL001Y3c4Qldjb0tL?=
 =?utf-8?B?RnFxK2k0dXNUbkJpMlYwT2RaVTFleTBwaEFlUEpabGw5U24wL1RRZ3diMUNR?=
 =?utf-8?B?N3FTK2RZVG5EWURVWjcxdzNSd3hGZ1dCU2hQT1pYZzI3VFE2WExBREVkb0c1?=
 =?utf-8?B?WG5UQjlQSmlMcVh1T0NWN05BN25XbW9oakJLQjlkWVB0WjdvQ0paYXI4SVps?=
 =?utf-8?B?YXRONHNJZzJWY3JsVU5STXFKMkY1bGZnNkxaOGFUQUc2S2JSNjc2dnJDWmMy?=
 =?utf-8?B?cE53Ylc0VElDc3NsdlNSaTgwU2JKaUdXRlhxS0hYSTFPVCtrYTZvOW9sK2pO?=
 =?utf-8?B?ODVaMXRNbTNBQm5nUGE1NkcxVC9nblIwdVhxYlBxYmtkYnJreE1JZWx5dEYv?=
 =?utf-8?B?TXl6RnB1NFZrMjl3Wm9JbjlPWnVqWHY5eGhGVi9ueU1MQ3Jqejc5dkt2QjVQ?=
 =?utf-8?B?TkVYaVdkWUVYZmxnc1pLOGxnNC9iSUxIaE1QSkF1UDExOGh4cjZzM1JkRi9H?=
 =?utf-8?B?M3pNMGFqR0FzSVpzWlBNMGZOQ2ppdmxRdHBoVHBoWEtjaGpWVWdtYkcyK3Yz?=
 =?utf-8?B?UWRETERnMDZqTWlhZVBPYWFNRkVnbllIT2U2Lyt3R05OVWt4bGxLZGVNMmpF?=
 =?utf-8?B?blhqT1YrU1Fhd0ZNY0FiREFoczF5Tms4MnVvak03cEIzcHNGMHM5L2xEQlc5?=
 =?utf-8?B?c05lVFdLenpodjVXSlIyKzBwWmVOdEcvWlllWVRIM0JCMW0vQzQ1N3VndXps?=
 =?utf-8?B?cWhWOWU4emczdWh3NmhSRGRKdi9pQXlNcnZ1STNaN3hDL1lldGVEQTFSR052?=
 =?utf-8?B?bTlqL0NVcmQrWkhQWXlYVUZxMjBtVDN5Ky9GamU4VWJkNW9lRGFYKzJNeFdu?=
 =?utf-8?B?V1hJVno5Wm04ZzJRRkx0QWpVME56TWx3MzYwWmVNNEFhVHB0amU4UTJrZEgx?=
 =?utf-8?B?bU1Bb0RlVlBKa1A2ME9MVllMRzMrTklDQlF1MTQwR3kwVnY0LzdZQkNmUlpJ?=
 =?utf-8?B?anhHMnpmK3h4M0FtQzRxQVhESnlONGxSZTQ1dDBUQml1OGJyMXloUFZpeitQ?=
 =?utf-8?B?ZWJHT01oa3pCNjM0d3RiVHFkcnQ3VHV1aWc0UVVzdjN6bnZhazFnN1A5Q3VT?=
 =?utf-8?B?M1N4K3FaQWFKOEQ1OWtXWlBNMEpSb1N5ZHlSZUQ5VmlYY09IVDJ0dlJCeEs5?=
 =?utf-8?B?MUYxc3E5MDVYd2V1REYvVXRUWGVCVmQ0ME5xNDVZSXZ5WXpRQ0VkQ3c1VUJC?=
 =?utf-8?B?bFowSWhKVGZGR1NuaDJxN1Q5cDRXaTUyUzUySm1IcDJMRm9ReGJJVTc1Qnp5?=
 =?utf-8?B?R2taQk03UU0wTnZOU0pVLytwUUlXSTRmN0hvejNibFNjekE0Z1dobEhnQmZz?=
 =?utf-8?B?UllmL0hqa1NNWFBIdHNqNFZPZGQ3WUtrM0VsaTM2ekZLQ3U3ZWFjMko2ZUIz?=
 =?utf-8?B?MVhLdjFGWnUvSUVGZzFoaDBPZllTa2lrSkNDUHhpRURsTFlKcFNFblF4aUdi?=
 =?utf-8?B?bXg1U1U3dFl6NTNpSHhyQXUvYnJLWXFvQ0Nrai94WklYUlNhYm9yMU9qRjFw?=
 =?utf-8?B?MDhxTWJoN2dDQ21KaDB4RnNNRlZPcDE4WkRUSGFDeUpmRVY1Zm5UZHk1aXlM?=
 =?utf-8?B?emJCQnJVS1NTQjByTThBVUJaUmxvRmU4dGdmaW83WFROaGJWeDNNSlN2dmxO?=
 =?utf-8?B?ZE5aMUVzZFpiWGlqVUVVR1JpYTVjdGFRZlJEZEtKNUd2bDY2T1cyNHVHZE1L?=
 =?utf-8?Q?390LkJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e2584c-584d-4c86-ff78-08da0752fee8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 13:43:47.6116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXYDhoLJ4W0dr0htNkr2N/UsYSnT8+RdfILtq16IzxMRoy+M3kr/9XQNqTE0Q1xC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5064
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.03.22 um 14:19 schrieb Robert Beckett:
>
>
> On 16/03/2022 09:54, Christian König wrote:
>> Am 15.03.22 um 19:04 schrieb Robert Beckett:
>>> RFC: do we want this to become a generic interface in
>>> ttm_resource_manager_func?
>>>
>>> RFC: would we prefer a different interface? e.g.
>>> for_each_resource_in_range or for_each_bo_in_range
>>
>> Well completely NAK to that. Why do you need that?
>>
>> The long term goal is to completely remove the range checks from TTM 
>> instead.
>
> ah, I did not know that.
> I wanted it just to enable parity with a selftest that checks whether 
> a range is allocated before initializing a given range with test data 
> behind the allocator's back. It needs to check the range so that it 
> doesn't destroy in use data.

Mhm, of hand that doesn't sounds like a valid test case. Do you have the 
code at hand?

>
> I suppose we could add another drm_mm range tracker just for testing 
> and shadow track each allocation in the range, but that seemed like a 
> lot of extra infrastructure for no general runtime use.

I have no idea what you mean with that.

>
> would you mind explaining the rationale for removing range checks? It 
> seems to me like a natural fit for a memory manager

TTM manages buffer objects and resources, not address space. The 
lpfn/fpfn parameter for the resource allocators are actually used as 
just two independent parameters and not define any range. We just keep 
the names for historical reasons.

The only places we still use and compare them as ranges are 
ttm_resource_compat() and ttm_bo_eviction_valuable() and I already have 
patches to clean up those and move them into the backend resource handling.

Regards,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_range_manager.c | 21 +++++++++++++++++++++
>>>   include/drm/ttm/ttm_range_manager.h     |  3 +++
>>>   2 files changed, 24 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>> index 8cd4f3fb9f79..5662627bb933 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>> @@ -206,3 +206,24 @@ int ttm_range_man_fini_nocheck(struct 
>>> ttm_device *bdev,
>>>       return 0;
>>>   }
>>>   EXPORT_SYMBOL(ttm_range_man_fini_nocheck);
>>> +
>>> +/**
>>> + * ttm_range_man_range_busy - Check whether anything is allocated 
>>> with a range
>>> + *
>>> + * @man: memory manager to check
>>> + * @fpfn: first page number to check
>>> + * @lpfn: last page number to check
>>> + *
>>> + * Return: true if anything allocated within the range, false 
>>> otherwise.
>>> + */
>>> +bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
>>> +                  unsigned fpfn, unsigned lpfn)
>>> +{
>>> +    struct ttm_range_manager *rman = to_range_manager(man);
>>> +    struct drm_mm *mm = &rman->mm;
>>> +
>>> +    if (__drm_mm_interval_first(mm, PFN_PHYS(fpfn), PFN_PHYS(lpfn + 
>>> 1) - 1))
>>> +        return true;
>>> +    return false;
>>> +}
>>> +EXPORT_SYMBOL(ttm_range_man_range_busy);
>>> diff --git a/include/drm/ttm/ttm_range_manager.h 
>>> b/include/drm/ttm/ttm_range_manager.h
>>> index 7963b957e9ef..86794a3f9101 100644
>>> --- a/include/drm/ttm/ttm_range_manager.h
>>> +++ b/include/drm/ttm/ttm_range_manager.h
>>> @@ -53,4 +53,7 @@ static __always_inline int 
>>> ttm_range_man_fini(struct ttm_device *bdev,
>>>       BUILD_BUG_ON(__builtin_constant_p(type) && type >= 
>>> TTM_NUM_MEM_TYPES);
>>>       return ttm_range_man_fini_nocheck(bdev, type);
>>>   }
>>> +
>>> +bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
>>> +                  unsigned fpfn, unsigned lpfn);
>>>   #endif
>>

