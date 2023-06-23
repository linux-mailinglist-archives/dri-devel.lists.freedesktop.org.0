Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D1F73B120
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027CF10E5DF;
	Fri, 23 Jun 2023 07:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B30F10E5DF;
 Fri, 23 Jun 2023 07:16:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbmPbOWd6poep/xWwo7IQoKtf5r2pq7SrRzOFtHMnc3cyQtvUhviaSa3qWuh7HKfizlo5HK3/VWGsbeTpr1fLDmIbuzF6Cjgjmax+pTj8aur7M7OoVF9KgPTvox1iHF35VOH8bE48Niceae8CRiv3C62Q/8/5HyiyxV/xPqLhY9x5tn3PEuwKTwSWOtp2nndOzXZrw+QQdRBocCebUCCDhW4yHwoQcjXhAnPlYQ10DEFUXL0X4YhmnjIXGeA4Fvz+LFGLH+84BMuparLGLx484D2GX9dOi3g3YKrJ8jT/2aZXQxRrlr9KrWiBp1agVZjNETw1aNgvkTLLK/HAkRCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqgeyka321mpZtu9ZJCBOB+yJsk2eLJkUAyCTVGJk5I=;
 b=kzuO6rmMfBjrNyqZ8i5angWP9rs7AGMZiQTUzOH2iCxVE727s0QeY6fl8JkfAV0mffbfe6yaFos20GiYFUxdBoLMmI7+co4PRnK4dgVi1qXVLtkuP5vgqy3tLHZL4BAFtlfoDTEEsqRz+KWSlnRaWvMyhbHfo8HPFh8yTGvwYavGyzGYsYnfovMwFlGOVNp/6r7ubIqQBKrMBwojPZgIINgVMr8N5zPwiL9FLjmX5z4zRBG3EACxHeIAurx9rzpVsDr9vlIH0gIsFrcYw/5wyE1lBU+wonWTB1tCrCE19u7V/n0B4eZsa3uT7v8CLJzg2OGb/zEw38hi7q6f81tc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqgeyka321mpZtu9ZJCBOB+yJsk2eLJkUAyCTVGJk5I=;
 b=F8ovIMIVwsuRq8tbw/DxX0oxXirIY+9yIhc4YSzZWb+5BlK61vC9q/KEDf6DztM1w/Lhtj9sCu8T/hqN9ya4pFPedOSFvH6SkQVAetNRFhua9NgxSZ+B7PtQ6H7foEi6M9nwbbUbnECmoTiH27oS906tSFXSYhYlEe1aRlGdA3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB8347.namprd12.prod.outlook.com (2603:10b6:8:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Fri, 23 Jun
 2023 07:16:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 07:16:20 +0000
Message-ID: <4a52ac7c-19ba-8906-5902-fbf75673bf59@amd.com>
Date: Fri, 23 Jun 2023 09:16:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
 <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
 <a8edf75b-e0f7-a6c7-7d29-f0d39923549b@redhat.com>
 <41aecd10-9956-0752-2838-34c97834f0c8@amd.com>
 <bcde7ea3-fbab-3a18-e810-64b6589ddb18@redhat.com>
 <86ef9898-c4b6-f4c0-7ad3-3ffe5358365a@amd.com>
 <c1f05169-dec0-22ee-52fa-c8070678394e@redhat.com>
 <2f502150-c1f8-615c-66d9-c3fb59b8c409@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2f502150-c1f8-615c-66d9-c3fb59b8c409@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: af6da362-7c2e-45e8-d435-08db73b9be10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MI7SX9pkGSAlzN5r3nOjFehdz+9fzBua6UgQK/oJssSPwJ1isJ9mW5ADD78VnYzFwm9HeccJ/1k8Dte/fwOZUZwW2IHxk+5fKhFHo0X5iCNrEI3AL2HIBJ4aG44IB0LZ4CmK8oHPil/exzup1NXp5DU4i4FlXV3/6JM0TULqd8tjbbmya6TiAvYnm0TJRaT6NFLY3TV9043pxsZGn2BXfwdA3Zm9EczNmRAx6iW/2o6A+bxIP6mS6dDFQ3QeSwMkhV+IJZJ0e6q2CYlnnBpieu+hlzrsIBUE9GOM2iRuqRgKXf+h9yrgnofTj0tjFlMOyadY9aaRny8X1IGVRg0v2bCAI2PkkAvF7r8sXMByLWFfHednf7WIuFxYuPevMw3QTdncrHaLyIw3VO0JeztsIyFJZtnCuV7jKMavio8QvrpfkutPyyVv7RqzYem6RG9/J3ux7G/rg3Gy0IuhGNBBLR+g0uc4FcOmzWpoEq3bkIT7th7UL3aXGTzhcGwc85EatCii+AwRmioFybVZgRdefaEwd9nHvevMqW0yRDX3Z9IiY0kDu5cwkkJ9iFJ0P2TJTjofzZPldb9ml8jdpJqnJTIcJkqf+f+lqvOJh4hbq0MXPvt4C+Fsas5Es8TeR0qZ3QwIw0D9PfQ0D1bwJWj3rmpZZwwn23wSW6sJgucxKOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(53546011)(38100700002)(921005)(6506007)(83380400001)(66574015)(186003)(6512007)(2616005)(7416002)(41300700001)(8676002)(8936002)(5660300002)(36756003)(6666004)(66946007)(6486002)(478600001)(4326008)(66476007)(66556008)(31696002)(86362001)(316002)(54906003)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUZEeC96L3RQTEVNSkRQZXZJY01IbWtDY0kxbFY5TUNxVVViNDNPQ1R4Wk05?=
 =?utf-8?B?clFXR2RFb3M3NU50TmV4d2ZNcWYyTnRlV3d6WWs2N0QzWXVIbzhTWi9wajBN?=
 =?utf-8?B?WTZEV1ZOSmVNRFFWVU9lQXJGMGFSM3A5WkdFcExWek1QbW93M2J2dDhwTVk3?=
 =?utf-8?B?VTQwV055S2Z1NHMyRWsyaGc2SFovalZjZU5BVGpzQmpSSTI0cVhhTEJMRHpr?=
 =?utf-8?B?L3ZvNmZGOGdCaFpIdXQrYlZsblRRalplVHkxczJLd3JSdEc1aDN3ZEsrdDlC?=
 =?utf-8?B?dEVzK2h2VlFsUERTQWgrR0NqaU1iME16bW1VcENYUGI2dzgwUHdDeThrbG1D?=
 =?utf-8?B?S1FLM0hlcVNueTJJZ054ckx1eDc0WityY3lQRCtjRlNXa1RFdVk3OWNDeW02?=
 =?utf-8?B?V0doaVRrTmdabnNFajlPeTJUamZHd003R3ZJbjRGT1lVM1NQUVFDZmNlSnM0?=
 =?utf-8?B?anFXZTdDdkE0WENQK1pDbkh0OGd2bUZGRU5jazVwMjBGc0d0a1BoUWVOdmJH?=
 =?utf-8?B?bFdrVE1xclUrSW1oSFFBZFdwVEw1MHFjcnVyU0VQTEdEUHV0eFZOUlFaeGx3?=
 =?utf-8?B?dWhTTjZ4cGNleVlRSjNHUjFzb3VsTHVFNE5uUkNHZlhwK0dKRGRpQTlOVzk4?=
 =?utf-8?B?dmVxNTRYREU5bEJ5VnY1eTRORTJWTVFIdDI4S25YTU9PcjQxSk9YSjhnUjB5?=
 =?utf-8?B?L2FkTXJQeVUwSXdqajhGYUlVdEVaaG5Pc0Y4cXNnTEkzajZBL25hTWd4b2Yw?=
 =?utf-8?B?cS94cHdYcTVzWE11T3c4aUpXZ3QwWVZCSjZzTWxTN2lFTGY4WnpDTDZ3UG9T?=
 =?utf-8?B?Z3J1alJhZllmNGpOYmRRdGlnTEZVaGpVWDBDUDU2dDRvME5mMkFQZlUrMEhK?=
 =?utf-8?B?RWYxNVAxMWNtUGRZZTRza3A1akYvazBDNUhUMEplVEtZNTArekJ5RlhMYzlt?=
 =?utf-8?B?Sk05QWwveVAxVVN2RmJjV0l2NVBZSGpkQUNUSXI2MlQyQUJWNER4b0JydzZS?=
 =?utf-8?B?UTJqdURPSStyVVVVdytKZlRuOWw0ZTFvWE1aL3F2MmxvU0dJTVZybnVlSnha?=
 =?utf-8?B?azhHcnhSaG5kWXF5b3RFSTdGcXMzaVN4dUpzOUFmZktBcWgvWWNITklmTGdr?=
 =?utf-8?B?d2J6L3NKQ1hNNHR5emtlUXNSVUV3SitoMFBudjJ0U0dyK3gvWXk5U2UzbXBV?=
 =?utf-8?B?MDZDL1ZyWk9zdlRPaml2Skg1b0NJSEpBY0pxanhEWUg2d2IvRGExdlB1ditk?=
 =?utf-8?B?dkZrZlJQNkVFTEl0d3A1YWZLN2ZNamR3NVlFWmNvMWdXR2lyNmRpY2lyNEs4?=
 =?utf-8?B?eTFIUUVIMzBrYnFQSTg0NHcyeStWeUVKamZzMUhhNzg2dnkra00rNDFFbHVD?=
 =?utf-8?B?RkgvNnpwVEFVSjFpTzlwVzZzVnZRVEpBc2RSTTRTMDF3bEVld1V2eEVkV0xi?=
 =?utf-8?B?REVxV0xqYktSWXlYaW5wV08rNGFaQjBkQzB1SjVNRkJTeWthZHlQQk9DeXlF?=
 =?utf-8?B?Uk1ya3hJOElCZ1d1ZUNDVndCRkcyUlZjbkhtZTFoeGIyWVRpYlFVOU9aTUdD?=
 =?utf-8?B?UGd4aXlEZ3B2b3VCbmp3ZHBpdERWMklnSnp0bWllemJ0YmhhTm1BVkpmK1lG?=
 =?utf-8?B?K0JGTmVwcDMwUXQrcjUrNGR4OXprQ1hyK1Z3ZVdJZmJCK0FGay9CT3VwQ01W?=
 =?utf-8?B?azNyL1hYZk94dnV1akIva3E3Z1VTdnNjV0NPTW9ITE1mR2UyWVhnN253UHhn?=
 =?utf-8?B?SVVUTElKelZxNnFmdndXS2NBRUZRMTFhN2lva1VKMHh2YTBqVHYrazJ3TXlS?=
 =?utf-8?B?dzI4R2h5TU9qRHpONGs0RTJmOEIwd2hpL3pjUkhxZEljY1FIU1FoRmJiN2Q3?=
 =?utf-8?B?TWNQV285RkRJZmEzaG91UHhSb2JIUEJqUWtaU2RBNnc1ZjhENDVCcmU5MXZ5?=
 =?utf-8?B?RmlucGJwbUZJUUdoSGcwdEZBOGE2akxTd1pLN2xVM3JLNjJJOTBTT2c0TVlw?=
 =?utf-8?B?cFc2MzlnWWVGeHZ2UUtVK2JtTEM1YUkzYnMvY0RhWTNFVncrajByMzMxWEg4?=
 =?utf-8?B?ZUUvMVBYZGg3R3Z3L3dZczJNYUIxSEU2RXhTUG5zaWsvNjkrdXVJZkVWTm0x?=
 =?utf-8?B?RnVTQ1BuS3A5TEZCU1FFbExwWG1PbGo5a2ZvUjFpMlduSGNUd3gycFo0Uk8v?=
 =?utf-8?Q?lMoZJkt4U3RivcJZJpD05AWJ3Mp3Rw6Lww+qz6/XYxWT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af6da362-7c2e-45e8-d435-08db73b9be10
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 07:16:20.2254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2jl5JSjXaTnwP+zAporxzG8yiSJQEoLttJAvPL9IV9e8m5bk5moZesRJM+UHx0e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8347
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Donald Robson <donald.robson@imgtec.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.23 um 17:07 schrieb Danilo Krummrich:
> On 6/22/23 17:04, Danilo Krummrich wrote:
>> On 6/22/23 16:42, Christian König wrote:
>>> Am 22.06.23 um 16:22 schrieb Danilo Krummrich:
>>>> On 6/22/23 15:54, Christian König wrote:
>>>>> Am 20.06.23 um 14:23 schrieb Danilo Krummrich:
>>>>>> Hi Christian,
>>>>>>
>>>>>> On 6/20/23 08:45, Christian König wrote:
>>>>>>> Hi Danilo,
>>>>>>>
>>>>>>> sorry for the delayed reply. I've trying to dig myself out of a 
>>>>>>> hole at the moment.
>>>>>>
>>>>>> No worries, thank you for taking a look anyway!
>>>>>>
>>>>>>>
>>>>>>> Am 20.06.23 um 02:42 schrieb Danilo Krummrich:
>>>>>>>> [SNIP]
>>>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>>>>> index bbc721870c13..5ec8148a30ee 100644
>>>>>>>> --- a/include/drm/drm_gem.h
>>>>>>>> +++ b/include/drm/drm_gem.h
>>>>>>>> @@ -36,6 +36,8 @@
>>>>>>>>   #include <linux/kref.h>
>>>>>>>>   #include <linux/dma-resv.h>
>>>>>>>> +#include <linux/list.h>
>>>>>>>> +#include <linux/mutex.h>
>>>>>>>>   #include <drm/drm_vma_manager.h>
>>>>>>>> @@ -379,6 +381,18 @@ struct drm_gem_object {
>>>>>>>>        */
>>>>>>>>       struct dma_resv _resv;
>>>>>>>> +    /**
>>>>>>>> +     * @gpuva:
>>>>>>>> +     *
>>>>>>>> +     * Provides the list of GPU VAs attached to this GEM object.
>>>>>>>> +     *
>>>>>>>> +     * Drivers should lock list accesses with the GEMs 
>>>>>>>> &dma_resv lock
>>>>>>>> +     * (&drm_gem_object.resv).
>>>>>>>> +     */
>>>>>>>> +    struct {
>>>>>>>> +        struct list_head list;
>>>>>>>> +    } gpuva;
>>>>>>>> +
>>>>>>>>       /**
>>>>>>>>        * @funcs:
>>>>>>>>        *
>>>>>>>
>>>>>>> I'm pretty sure that it's not a good idea to attach this 
>>>>>>> directly to the GEM object.
>>>>>>
>>>>>> Why do you think so? IMHO having a common way to connect mappings 
>>>>>> to their backing buffers is a good thing, since every driver 
>>>>>> needs this connection anyway.
>>>>>>
>>>>>> E.g. when a BO gets evicted, drivers can just iterate the list of 
>>>>>> mappings and, as the circumstances require, invalidate the 
>>>>>> corresponding mappings or to unmap all existing mappings of a 
>>>>>> given buffer.
>>>>>>
>>>>>> What would be the advantage to let every driver implement a 
>>>>>> driver specific way of keeping this connection?
>>>>>
>>>>> Flexibility. For example on amdgpu the mappings of a BO are groups 
>>>>> by VM address spaces.
>>>>>
>>>>> E.g. the BO points to multiple bo_vm structures which in turn have 
>>>>> lists of their mappings.
>>>>
>>>> Isn't this (almost) the same relationship I introduce with the 
>>>> GPUVA manager?
>>>>
>>>> If you would switch over to the GPUVA manager right now, it would 
>>>> be that every GEM has a list of it's mappings (the gpuva list). The 
>>>> mapping is represented by struct drm_gpuva (of course embedded in 
>>>> driver specific structure(s)) which has a pointer to the VM address 
>>>> space it is part of, namely the GPUVA manager instance. And the 
>>>> GPUVA manager keeps a maple tree of it's mappings as well.
>>>>
>>>> If you still would like to *directly* (indirectly you already have 
>>>> that relationship) keep a list of GPUVA managers (VM address 
>>>> spaces) per GEM, you could still do that in a driver specific way.
>>>>
>>>> Do I miss something?
>>>
>>> How do you efficiently find only the mappings of a BO in one VM?
>>
>> Actually, I think this case should even be more efficient than with a 
>> BO having a list of GPUVAs (or mappings):
>
> *than with a BO having a list of VMs:
>
>>
>> Having a list of GPUVAs per GEM, each GPUVA has a pointer to it's VM. 
>> Hence, you'd only need to iterate the list of mappings for a given BO 
>> and check the mappings VM pointer.

Yeah, and that is extremely time consuming if you have tons of mappings 
in different VMs.

>>
>> Having a list of VMs per BO, you'd have to iterate the whole VM to 
>> find the mappings having a pointer to the given BO, right?

No, you don't seem to understand what I'm suggesting.

Currently you have a list of mappings attached to the BO, so when you 
need to make sure that a specific BO is up to date in a specific VM you 
either need to iterate over the VM or the BO. Neither of that is a good 
idea.

What you need is a representation of the data used for each BO+VM 
combination. In other words another indirection which allows you to 
handle all the mappings of a BO inside a VM at once.

>>
>> I'd think that a single VM potentially has more mapping entries than 
>> a single BO was mapped in multiple VMs.
>>
>> Another case to consider is the case I originally had in mind 
>> choosing this relationship: finding all mappings for a given BO, 
>> which I guess all drivers need to do in order to invalidate mappings 
>> on BO eviction.
>>
>> Having a list of VMs per BO, wouldn't you need to iterate all of the 
>> VMs entirely?

No, see how amdgpu works.

Regards,
Christian.
