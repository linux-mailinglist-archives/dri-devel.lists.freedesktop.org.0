Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A4466A69E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 00:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911FE10E219;
	Fri, 13 Jan 2023 23:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B4210E01F;
 Fri, 13 Jan 2023 23:00:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6aVa7HfCvDbyCwfD4s+felD6K7HmenQrkMjX9TQ17VNzyqDXq1szKCnKNVMrxgMsUAfxvNi4+wbqqmaYRkKivXyNx+Pas5B6XkaTYPB9TzkPjtlcFdgaOt/Ihc3JYC/2n7kmtIuWWDwZZ6mhMU5jeQuo6gLByVWUdAHeuE+/9FGg1JtGzsVDSsDSFAFsB2ndGXoHjY5Wb0SM4QJd7Zv5PVLcZ9HAembfoYG76RSsG7R3HzcjNLtOD73EAhFv6JZycwkwdeNi5OKyqWskGXw9UFdCeWUMoCYChSx01Y09wyzv7Tm0p1otBHadluLp6hSEhpBDrKGYTEJ4+hPRuj8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bghx0SkgAtxbGSYqX/H2u+KU/y9JpxWJNbdq/dutbc0=;
 b=TXvUJpmjPpQhU0vxNnGZC1qJf1o7yaFj3zBCE0d0gCxL+R9tY9EU93eEjNk3LKx7dJJfpUDO1iAGmQB/sZ896khFHncuxxLiqHgFtc1eGNd8guALTkX3AGysI7DapoK95HvDODkXYEl6756/TH+y/A2Po8vhEaJQUuxHpHcYu8FAfOeEddMbd5M+1gBCZQN0svIIm+iybt6+xpSaVUyjLwKXcwoM7vYdCUuE/aR5EL0/ZsRVyYVEyl9LmUaW9qbKI5AMvtyoXkpYJkLngN4hKzAFZOJ/Ms2Wcrc9FcrKxdCTdc7nC5YyBRj3asK/fqF4woI/8FbRpAF6sggb13mzsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bghx0SkgAtxbGSYqX/H2u+KU/y9JpxWJNbdq/dutbc0=;
 b=4iIk+w0JRSpOusVxApWh88u+wHlUQKspE/08ysfrkOL9Vz8bn8/K5RQoNs9vs6JhQQuaNiY+cFmswC8RvWKgw8/rVUI4OqMZYVbrn/55Ejuj8aka2LTasAQFfFSlCoeIAvjw/hsIMWqc69XrL+x7OG/RRW4RU4Hy0ShysFwxN7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2602.namprd12.prod.outlook.com (2603:10b6:5:4a::11) by
 SN7PR12MB7274.namprd12.prod.outlook.com (2603:10b6:806:2ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 23:00:44 +0000
Received: from DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b]) by DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 23:00:44 +0000
Message-ID: <1437874c-4b4b-191f-4486-de6ac69e99cc@amd.com>
Date: Fri, 13 Jan 2023 17:00:41 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-2-Felix.Kuehling@amd.com>
 <cab37a40-9737-1b77-3a3f-87965d4c70b2@amd.com>
 <9b5b20e0-e04b-f7f6-9459-42d5a4bb44c7@amd.com>
From: "Chen, Xiaogang" <xiaogang.chen@amd.com>
In-Reply-To: <9b5b20e0-e04b-f7f6-9459-42d5a4bb44c7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR15CA0018.namprd15.prod.outlook.com
 (2603:10b6:610:51::28) To DM6PR12MB2602.namprd12.prod.outlook.com
 (2603:10b6:5:4a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2602:EE_|SN7PR12MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7bedd4-a9ce-4688-251c-08daf5ba003d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qRL7wkdylZzIE0Fk7Ou4h+AHJXDA386RJ/s/z6Xae45v/LAPoX+kty285L3eXXYIEmQVRt5zpw1kIIXzdYa0/fdo083jUNP/AnwRyMom5yEzFG4pNgDdcGsv3ikyInM2Jz1ipQ69Xmcp4wcV9/Q+uuOeb52ZnmiFzMhpH6clt851BOKf6Meiz1O2xrYLf8o9bjJf7UaOGAtq5wIVo3SvOTztGVKECLwZfrSgZs+dqBLFQIOaOnPFigDSoPQF8R7GRwrmBksImSMLOAwHGmlBq1fI0OQl4Mm1x6xtOk/igjl/CEEzWYAcQEUapjfberxyPMHgXHHNnYNy24yQXEe+Hb4lzzIDnE0RUivfen/ST2kvypVlX7vdlhllaABxoiwn5Sz3bkTd3NsvGepPtEKxHGMB8/2ih32MSCOaotKTpZCszy3NUR9qcT8Km6QgjqZlbv8NIcsAQYWFX1lhwrc9C63MeG0YCfx3wrVAk7sJeHgzyoXElgsx9VJlciF0MBjl7da9zNNpyAKoK4mc4nmg4Vd4bE7X8ta5hxhvVloiGAskcMDPOyVT/xjkSh28AzADK133g8HxfFZVnPLZSt2skFj41+5/sEr3vLmP4wRUFu8E2pFNSng6Vf39ZWAMnprt+u++zGwureTqNw9w7F1yrVDG2YO2sgHh4Doh6IKmOjf7TFrC4o21EMXEeuBnVTCJAWZokYb3ehQ+HjrPzXMzSm1STk2AP8Nh1IODqWL/2+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2602.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199015)(36756003)(86362001)(31696002)(8936002)(6486002)(5660300002)(4326008)(83380400001)(6506007)(26005)(478600001)(186003)(6512007)(2616005)(6666004)(53546011)(38100700002)(66946007)(66476007)(66556008)(8676002)(41300700001)(316002)(450100002)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlI2YURRT1Vkb1BHeGZ0SW4ycmo1eVM2RlpNek9Sc25IU25nL2NhZkp6ZTNJ?=
 =?utf-8?B?SGFLT1RuNm04L0x6WmJiWm9EdXBNOExwNm9FekNtVlR1OFJHNXBFdnVlZTVP?=
 =?utf-8?B?aFY1M2pFWWh5dWpmbGRNM2dMRGRlWEFCS0tTUHNyR3AxSEdkTDRTMTFKVDgw?=
 =?utf-8?B?SGNvbytMYW4zb1hSZi8zTE0rc1hOL25tRDU2UTRUZktMVFJYTkt5aWRkSnB0?=
 =?utf-8?B?Nk9sOEExTURlSiszQ1hXbHMxblpiVmtRS0sxWHo5VXk2RHVkWEZ2OElOZVAw?=
 =?utf-8?B?RXQ1cy9lV3F2OWtSbktWbUNSNnZ6UU9FU0lHKzF1UGhScWtOeEtyMXNyRkVn?=
 =?utf-8?B?dXF6WFdOdDVJNjRtenVvU2RvbVlrV3RDWE5pWHdvdXJDdmNab25hd0prZ2cr?=
 =?utf-8?B?MVZBYXBNYWZGVGoyY09nRmJNOGpyZWtZRlM4U1BBV3lpRWc5cGZJYWc0OGtQ?=
 =?utf-8?B?cFpScUlMeHlqN2tTVTBqdTlEcVVhQ3BzOEZublNJME1QRmd1Y0plOFpXd2di?=
 =?utf-8?B?eTNaNjFrYmN0cExTbkt3VmxlaytNVlJuNVpTN0sxMysvQnl2VmdzY29RWWtJ?=
 =?utf-8?B?SXhsYktFaGNrcnFHcktPUjRRMHVrMUl3ZGtLdytDUDF0NDhkZCsvRVZGN3U2?=
 =?utf-8?B?RFlUeVZwRVJ0VnU5SFhoU0dsTTNUdzI3bjJaOW1iNCt0Y05hMVNOdEZiTEo5?=
 =?utf-8?B?eUYreTNaTjNXVmhMOGxaa0ZQRkdMT2hWclNrSkgrSks4dzFZd3R3ODB2VXp3?=
 =?utf-8?B?SE5yQ0J3K0tFTmd3WXRLMjNXRzJKdXFxM2lpdG5EejQzVWxJNmN4bS9zTy81?=
 =?utf-8?B?bVdUVmlKVDVKVlRrSDdaREVLZlcrUVdjTG1GM1o2dWVzT1d2N0FDRk1mWWZ5?=
 =?utf-8?B?dnBjTVdFTFUrUTVndWp3bEd0S1lVS3FLaW9weUVJR051ay95aG5DSFE2Q0Nj?=
 =?utf-8?B?bFdwSTlMQ3MzZXRqamlqRUxSa1MvMFVNQXlnVU1FV3dPMURYVXBydERqQlZ5?=
 =?utf-8?B?YVJ1VTVQOW5SNXlqVitNcEE4STdCTEtNenVjTlFQRTJRZlZIZXhTcCtnSkcw?=
 =?utf-8?B?NU03dGZJL1plTmdUekMwQXFRYlJxaTU5ZzFmR0dxTnF5cnFzT01xa1VqM05v?=
 =?utf-8?B?eDEwUFJNYnN2TFZyU2J5K0hxdmVGTlpjQnRXb1p0T3VuakZHVEhLdzNRNFFI?=
 =?utf-8?B?ODBqSTJCRUo4WVJEY1ZMQ0Juck5pZzM2aWE0ZHRFWnEvSE5CNkt0eGlOYktt?=
 =?utf-8?B?bDkzNUI5MnJ0SjJjU3BZamNoUzY3UE9tdmRlanpIR2Qxeml5TnVxa1FXVlp4?=
 =?utf-8?B?QTF6VWJlVklTSmpmT01GMVdsRURpSzZuNytzbU0rcUZHbWV4WjJ5ejUwa0Zk?=
 =?utf-8?B?c2hHQjk1MG9ybnU5dFZaV0svY3dEdjRyVEpmaWtsNXl5K0xQY0NTSEpxQmpO?=
 =?utf-8?B?a1NrWWtrYzRmMWdqOXIxUnVNeUJkZ3ZTdkprK2YvQXo1V0Y4MTMyL3hhNDVF?=
 =?utf-8?B?VHBpMTM2NXViWG15dTQ5aUJMUjRMcnA5STIxRUMxNzNHS1pBbkluTEltWnlI?=
 =?utf-8?B?YWF2WmxETFB3SGtwVStRRlZ3cXZ6ZHk0TkZRTHJkVlRIZGQ2VWtBRVJaT1hB?=
 =?utf-8?B?NE1maGg4Q0NlYTV6VE9aZEFITVRqdDBQSDhvWmg3YkdVclYvWHJPU2llcERC?=
 =?utf-8?B?K1RDcjJHNW9lYnJVTEJJclRQV1RCMWlRaVBkdDB5U1BEMndoekNEMEFRam9s?=
 =?utf-8?B?bDcyb28xYW9VUmlDbkptSmpLdEQ0RjkyM0trc2wwdTA4VVVNUmlqQmxmVTY3?=
 =?utf-8?B?eTVjK00rd200MzRyZVNnT3IxU0FRajlWQy9NRWIyTERyZ1JjU3Z0ZEdDT0dB?=
 =?utf-8?B?MDN6MXhseXhKd0ZBVVM3R1UzSUYyZmV3cXhmWThUNXRLN1dGbzdWMTduSUQ2?=
 =?utf-8?B?MDVxYkVIRmJvZWJOSlAzNEpoVVlUNStKeWtsVzRjSld4aVcwZjgzQk9NSjJo?=
 =?utf-8?B?NEdmTkpoK3FLc3pFeEMxeFV3UmlBdmVXWlQ3cXNTYWtDVi9zcjgxQjlTa2d0?=
 =?utf-8?B?NnkwSTU0N0duOHNIOXYyWWNKZ3Y0M0RnTm9RdkZaMnFZY2RZK3h5YU1nSGli?=
 =?utf-8?Q?sUiw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7bedd4-a9ce-4688-251c-08daf5ba003d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2602.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 23:00:44.4482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mOeh0FD3Hw023sh5J/fo/op2aKHTOthPvtFmX0H+fDTSNE0RpG1K1iHJcr1dhP5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7274
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/13/2023 4:26 PM, Felix Kuehling wrote:
> On 2023-01-12 17:41, Chen, Xiaogang wrote:
>>
>> On 1/11/2023 7:31 PM, Felix Kuehling wrote:
>>> Use proper amdgpu_gem_prime_import function to handle all kinds of
>>> imports. Remember the dmabuf reference to enable proper multi-GPU
>>> attachment to multiple VMs without erroneously re-exporting the
>>> underlying BO multiple times.
>>>
>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>> ---
>>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 
>>> ++++++++++---------
>>>   1 file changed, 21 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> index 6f236ded5f12..e13c3493b786 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> @@ -2209,30 +2209,27 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct 
>>> amdgpu_device *adev,
>>>       struct amdgpu_bo *bo;
>>>       int ret;
>>>   -    if (dma_buf->ops != &amdgpu_dmabuf_ops)
>>> -        /* Can't handle non-graphics buffers */
>>> -        return -EINVAL;
>>> -
>>> -    obj = dma_buf->priv;
>>> -    if (drm_to_adev(obj->dev) != adev)
>>> -        /* Can't handle buffers from other devices */
>>> -        return -EINVAL;
>>> +    obj = amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
>>> +    if (IS_ERR(obj))
>>> +        return PTR_ERR(obj);
>>>         bo = gem_to_amdgpu_bo(obj);
>>>       if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
>>> -                    AMDGPU_GEM_DOMAIN_GTT)))
>>> +                    AMDGPU_GEM_DOMAIN_GTT))) {
>>>           /* Only VRAM and GTT BOs are supported */
>>> -        return -EINVAL;
>>> +        ret = -EINVAL;
>>> +        goto err_put_obj;
>>> +    }
>>>         *mem = kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
>>> -    if (!*mem)
>>> -        return -ENOMEM;
>>> +    if (!*mem) {
>>> +        ret = -ENOMEM;
>>> +        goto err_put_obj;
>>> +    }
>>>         ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
>>> -    if (ret) {
>>> -        kfree(*mem);
>>> -        return ret;
>>> -    }
>>> +    if (ret)
>>> +        goto err_free_mem;
>>>         if (size)
>>>           *size = amdgpu_bo_size(bo);
>>
>> Hi Felix:
>>
>> I have a question when using amdgpu_gem_prime_import. It will allow 
>> importing a dmabuf to different gpus, then can we still call 
>> amdgpu_bo_mmap_offset on the generated bo if 
>> amdgpu_amdkfd_gpuvm_import_dmabuf also ask mmap_offset?
>
> The mmap  offset comes from drm_vma_node_offset_addr. The DRM VMA 
> address is allocated when ttm_bo_init_reserved calls 
> drm_vma_offset_add, so there should be no problem querying the 
> mmap_offset. Whether mmapping of an imported BO is actually supported 
> is a different question. As far as I can see, it should be possible. 
> That said, currently ROCm (libhsakmt) uses only original BOs for CPU 
> mappings, not imported BOs.
>
> Regards,
>   Felix

The mmap_offset is actually not returned to user space. I just wonder if 
here we should get mmap_offset of imported vram buffer if allow bo be 
imported to difference gpus. If a vram buffer is imported to same gpu 
device amdgpu_bo_mmap_offset is ok, otherwise I think 
amdgpu_bo_mmap_offset would not give correct mmap_offset for the device 
that the buffer is  imported to.

Maybe we should remove mmap_offset parameter of 
amdgpu_amdkfd_gpuvm_import_dmabuf since we do not return it to user 
space anyway. With that:

Reviewed-by: Xiaogang Chen <Xiaoganng.Chen@amd.com>

Regards

Xiaogang


>
>
>>
>>> @@ -2249,7 +2246,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct 
>>> amdgpu_device *adev,
>>>           | KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
>>>           | KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
>>>   -    drm_gem_object_get(&bo->tbo.base);
>>> +    get_dma_buf(dma_buf);
>>> +    (*mem)->dmabuf = dma_buf;
>>>       (*mem)->bo = bo;
>>>       (*mem)->va = va;
>>>       (*mem)->domain = (bo->preferred_domains & 
>>> AMDGPU_GEM_DOMAIN_VRAM) ?
>>> @@ -2261,6 +2259,12 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct 
>>> amdgpu_device *adev,
>>>       (*mem)->is_imported = true;
>>>         return 0;
>>> +
>>> +err_free_mem:
>>> +    kfree(*mem);
>>> +err_put_obj:
>>> +    drm_gem_object_put(obj);
>>> +    return ret;
>>>   }
>>>     /* Evict a userptr BO by stopping the queues if necessary
