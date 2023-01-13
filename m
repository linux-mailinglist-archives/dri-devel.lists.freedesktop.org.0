Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E6E66A6D3
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 00:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EDD10E227;
	Fri, 13 Jan 2023 23:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C8110E212;
 Fri, 13 Jan 2023 23:15:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGNlQtiv3RKWW4S3t6jCVkArAr+ekp30lCdLODsxBbTyd9GeRmJHOlYwJNKhNkhr86HtyUyDnmhnym2EQFm3VkTnDvSDq8JfqLEfcqM/fZiY+OxPApAvrt6BFrTilcr+TvWQHwQFiBzoWxoVH/d553vIv4QhUy8BFKC9z+KVtofpFXDwYt52LXC9vq7Naaeh+jQf+LXhuY+pPmReATxQbDLEWJA2ORabv14Eur0oR94V6XPjIe8YjyasYrRXiadZ3BLw/KvHWxVR4zPcYelcnN7xT9uAtP50/PxyDDmNOL8a9EdTyhvMBt0dfwVoVkKyJIzdLaVBbwCUv+Fh0/NQ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0u+oC3zMekkR+FWbvFCG0Va6GLgoanEvR5kDVkUXlo=;
 b=eS7Z7/lhTf9g/qN/igmI4QxBk3U0Vq9/akGlMWxI3WE1IIBMPiSax87A62ETOmt0geNtlaS7hy/oBtk8w1f9KcwamkagRsbb0K4k9iARt09H4lekIWbW3PV6l0strnxrci6pAEPhAOw365pbSrmwo4hd3wU/VDj/50Md6vyrPHVJJMzOyUFUlX2lXY69o827NC2m78NjX/B0TuWWeoMPLCdVrvUrqXX3wC8fsnk6jEsr6VQw5TiHcs9gFcyS6FxoOs6nBtxu2r6kwzcThZIwq0BuMgtZRazIB4bPQ0xGpRxRYAeEuHdgaLt4X5Cfrz7Y5HICpp2yczJksiszwjoC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0u+oC3zMekkR+FWbvFCG0Va6GLgoanEvR5kDVkUXlo=;
 b=ATNYyLBVnSGH//Aq6kz78Wj2C8vW/d+bOk3E9tnqS8YFJjqkAiarnQEK596Ny10eSSNBf7sTDNZqSKsDFSMO6EvBJLNfB6wNS8cUJaIslOEvnCuUn6JwKp5D3YqVpc5bOt2aWYIkD+cjVD84U9Di8ki+b2a0u7Y039BX7cXM+8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB7331.namprd12.prod.outlook.com (2603:10b6:510:20e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 23:15:37 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411%5]) with mapi id 15.20.5986.019; Fri, 13 Jan 2023
 23:15:37 +0000
Message-ID: <19873c87-5d01-30dd-84d2-ced61b236fa0@amd.com>
Date: Fri, 13 Jan 2023 18:15:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Content-Language: en-US
To: "Chen, Xiaogang" <xiaogang.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-2-Felix.Kuehling@amd.com>
 <cab37a40-9737-1b77-3a3f-87965d4c70b2@amd.com>
 <9b5b20e0-e04b-f7f6-9459-42d5a4bb44c7@amd.com>
 <1437874c-4b4b-191f-4486-de6ac69e99cc@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <1437874c-4b4b-191f-4486-de6ac69e99cc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::21) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 88a1d356-385f-47b0-d9e1-08daf5bc1454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXOxx2X5tqGm5oXOYi4Bsn8EtsKCArdpMFkJHigVGTQU6FzRBg6xapZfcdwz2U2RufCSTHX3nU3Za9ThPNNZtD/bUCWYOCxMQ+o3d/y565tKejKLU8WM4cSt0UaeJZICyCYESd4bCNTcNzeizzyPf4WwQ5vLS8F8/+OYIEaq+kGxBUwzJaAjEMu4ITw0SJNaftZ+jluNdnmshrNEefAp3fJxLNt/L0KdGp0/Fjban5HpP5YhIL9kyOHg1j9MuOWVayI7iU1U/xKHCGwyYN2RV5Vfdi+IiQgmF9HWdPpYHjiamQMj7EJuVrQO1Z5Wk8xMAIFPJ7AseaAMnU+KLaIasecgYMZMKEg5cl0oaYHgEWDtQ9UrvrANwi1KanPvJb8osJq/7WAKOb0B+7TKCzg7oORqQUP4sIY818xNcAMpLDPkmJ3Zwh6q0S2D2EtH18FPNWDZ2Gi/4HgqNEQcgibLedytRWfrbonUJkqKbXfrvDSBimKN4XhjW1kv73bY+J8WWWY3NZ8VYI9VzVS5zUoMU2zUC6p/8lMGji3tB7w0/d0AnG1cTM1sKmp13zHsrsvVVwuwhV0zKJZxxXwXZ1BRVt5B07+C6UCR0x+5nRmQG9D+g3bFw+4FYVxoOawP8CaHmB8RNpuiK+hqyA101WE3LAz6OgxSDhe7AZ9c4lW2LVWnqNorOkjde3YnlSL9IpjEIZFlLeQKGeE+kmiMPYyoeaz0vRkWAid68ebLGUULaxg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199015)(31686004)(66556008)(2906002)(44832011)(5660300002)(36756003)(450100002)(66476007)(2616005)(8676002)(316002)(36916002)(4326008)(53546011)(41300700001)(6486002)(478600001)(8936002)(26005)(6506007)(6512007)(186003)(31696002)(66946007)(86362001)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW42aXZKUlk1bzZHTzVUZ3J6MXBkVEZHd1pucmw3UjRRVlE4WlhMN1EzaUh0?=
 =?utf-8?B?bVpTRUtvOE15WjREQm1kUGVCMGtBTjZwQjJGemFpOHIxMUVnNHkxS0JwZWNz?=
 =?utf-8?B?S3dvdGhnU2xjbmwwRklLZHFScTg2TUVoVkdpU0U0bHBiQzlPS29yMGljWjFT?=
 =?utf-8?B?UjhITUZqT1kycGt4Y045eXU5R2YyVkkvYVpVcElYRmFmeldkNDhzZUYvekVV?=
 =?utf-8?B?cFZPSGFIZEZ3MkdtVDJ1UE9XOE1DQVBWRVFKYlFoU1VRTUhwbXJwQ25zTXV2?=
 =?utf-8?B?Q3h0UDEzem1MZTA1MnlCNWUyeHVUZmM2U2RaSUVIbUZTK0V0WUVsdVQ5RzBu?=
 =?utf-8?B?N3c3b0VEaG1YakYrNjVYUm90Y0JWMTMya05rMFJ0TEhjelk0SG9yMG9rYXJM?=
 =?utf-8?B?SkpCK2JGQTk3N2UxMjVkR3RlNFgyN1VOVnlKWjBVV1R0K2Y3SGNOWXJwZG9F?=
 =?utf-8?B?WFprNk00YnBTNWVnb1lyVmg3L1hVem53YjUyNUpWOWRBeXIwUnZPZEdLYS95?=
 =?utf-8?B?VkN1ejY5OGtpcWdSclpZQzFRaEFwTFFsR3BkdFFFZG50Y0V2M21RMUpvWDlW?=
 =?utf-8?B?SGV5aVpHVVhKeXV5WUVGUWlVbTFTc1hTdTQ3S1N0WVdqUXYreDZuMU9SOThm?=
 =?utf-8?B?YzlNd3VMQlprUWlVRXRKU21icFJkVjZSclZ6ejh4UDlRZEVUNXN6eDZvN05D?=
 =?utf-8?B?YjhlcnFLYnh0NU5zQ21PNTRib1pWbi9tYWZWQnZlOWhBVTFSS3g5MnZjdnJN?=
 =?utf-8?B?ckhJL25ZY2E3K3cyRU8xSElKVlJTdUpZVlpSSmlsa3FsdUNKZ0E2VTFZY2Jv?=
 =?utf-8?B?MTkwT3ZxOFJSeEs5UWlwclc3Tm9NYlA0dHN1dUp1Q21ZSlFKaVYvbGFNYXhN?=
 =?utf-8?B?U1huTUNwK05DNksyeGFXS2F0US9TaWNjaTNzeGZiU3RKMXlsUkRDVVBBMGJT?=
 =?utf-8?B?azM0eXhWM2ZQcTVxN3I4NVVMMlZPU2R0T1ZlZlpyS0F2Y0dBVEpvYmN2R0po?=
 =?utf-8?B?N0JhUmNHbXZiWnFMUHErMGsza1pqRjJqZTFQVHFBVjB4ZmRudUdZeG5zRVF3?=
 =?utf-8?B?Um5lSDNGRzRNSit5c1RiekpPdmthWUFIKzFNcGFxRnRVMXdxUGZpSm1KU2tE?=
 =?utf-8?B?bk41a1VxdVoyOVdESEwrVStrT0JpSlNhQzlOY084MVducGpSR3ZKT3hRcVgy?=
 =?utf-8?B?T3JSb0FOaFR3c01QU0R4eG95cGNNWGIrZTFEL3N1a1lBbytCZVFDajRoMmZO?=
 =?utf-8?B?OS83bDQvSE1uZi9JSUd0SFpyZmV3Q3RlT1FyVnBlS2ZaR0FnN1NlRExMNnhk?=
 =?utf-8?B?amdKdlpUc1FHRzl2a3lzRlk0WkVKWmsrNmJVVUQrNFNkNHBqTldPTUFHYlcz?=
 =?utf-8?B?T3YxbnorMUlGc1BKNUpmUmhJL2NrMnVXUVB3cXQ5N3dHWUpkM1c2VmdYMzB0?=
 =?utf-8?B?YWJPTHIyNFdNZDl5eW84R1NRVmdBeGdlVWVmRnhWeHFBYVo2Tmdsa3BKTzJE?=
 =?utf-8?B?MDR6ajE0QktGNHo3b3FhVERrNTNVTEhVcFR5YmZqNTJTNlI5Z1dLZUpXNC9w?=
 =?utf-8?B?QzdHRm1mZ2F2QzBWY0RWcGdxVHBnVkRPbGY2SGl3K0J6RHp3UFBMd0RzWkc1?=
 =?utf-8?B?VlcrOVJSRS85dVZzNXBmZlBZcE9JTHc0U3N1enlZek9TNERaOEVFOVNxY2lh?=
 =?utf-8?B?eXl4MVZMdEREODFTOWdCOTN5NzZObUxRa2FnWDIrZ0NSOC9hOUNVMUp1TXVJ?=
 =?utf-8?B?ZnBvc3I1a2NTSHF2Q0RyeFhYUXp4WENYQnJMU3FPaDBuajFwVGpLbFZXMWsw?=
 =?utf-8?B?b1Q5citsTyt3OFpzZlFHUjdLSHNHWXYxOE5sNFhtK3F2OHBWRE1qY2NjWnRr?=
 =?utf-8?B?dzBiM3ExeCttaDIrVjBPcnJXbndidlZrV28zTXhLNU1sb1ZvTkJuaSsweC9r?=
 =?utf-8?B?YnhIVEk1QU4rdURZZ3BLL0pEbTRuZm9ZRDV2aUQxQk5oUjJSem5GNHFpU0R3?=
 =?utf-8?B?VDZvZzhlbU9XU2VoVi9xWXhTTHA5TVVhSG03cHNWYnNaR3lWMk1WQjVCd1FX?=
 =?utf-8?B?Y3FUejZ5Q3VKVitnSEhLRExIRGZSUzhDS3F1bE55Z1BNUldqV090YzBHK3Ez?=
 =?utf-8?Q?Wdzpf6JYvUx7eBByoQgSonmit?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a1d356-385f-47b0-d9e1-08daf5bc1454
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 23:15:37.2139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsIioU7Oso0zfTFbhJHi4IMZJg7t8tgOBrVaZ4LSOibzW8ziHXn9rQKcvtR6IR5K8bD9GBfXOhdgk9uiXB8GuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7331
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

On 2023-01-13 18:00, Chen, Xiaogang wrote:
>
> On 1/13/2023 4:26 PM, Felix Kuehling wrote:
>> On 2023-01-12 17:41, Chen, Xiaogang wrote:
>>>
>>> On 1/11/2023 7:31 PM, Felix Kuehling wrote:
>>>> Use proper amdgpu_gem_prime_import function to handle all kinds of
>>>> imports. Remember the dmabuf reference to enable proper multi-GPU
>>>> attachment to multiple VMs without erroneously re-exporting the
>>>> underlying BO multiple times.
>>>>
>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>> ---
>>>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 
>>>> ++++++++++---------
>>>>   1 file changed, 21 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>> index 6f236ded5f12..e13c3493b786 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>> @@ -2209,30 +2209,27 @@ int 
>>>> amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>>>>       struct amdgpu_bo *bo;
>>>>       int ret;
>>>>   -    if (dma_buf->ops != &amdgpu_dmabuf_ops)
>>>> -        /* Can't handle non-graphics buffers */
>>>> -        return -EINVAL;
>>>> -
>>>> -    obj = dma_buf->priv;
>>>> -    if (drm_to_adev(obj->dev) != adev)
>>>> -        /* Can't handle buffers from other devices */
>>>> -        return -EINVAL;
>>>> +    obj = amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
>>>> +    if (IS_ERR(obj))
>>>> +        return PTR_ERR(obj);
>>>>         bo = gem_to_amdgpu_bo(obj);
>>>>       if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
>>>> -                    AMDGPU_GEM_DOMAIN_GTT)))
>>>> +                    AMDGPU_GEM_DOMAIN_GTT))) {
>>>>           /* Only VRAM and GTT BOs are supported */
>>>> -        return -EINVAL;
>>>> +        ret = -EINVAL;
>>>> +        goto err_put_obj;
>>>> +    }
>>>>         *mem = kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
>>>> -    if (!*mem)
>>>> -        return -ENOMEM;
>>>> +    if (!*mem) {
>>>> +        ret = -ENOMEM;
>>>> +        goto err_put_obj;
>>>> +    }
>>>>         ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
>>>> -    if (ret) {
>>>> -        kfree(*mem);
>>>> -        return ret;
>>>> -    }
>>>> +    if (ret)
>>>> +        goto err_free_mem;
>>>>         if (size)
>>>>           *size = amdgpu_bo_size(bo);
>>>
>>> Hi Felix:
>>>
>>> I have a question when using amdgpu_gem_prime_import. It will allow 
>>> importing a dmabuf to different gpus, then can we still call 
>>> amdgpu_bo_mmap_offset on the generated bo if 
>>> amdgpu_amdkfd_gpuvm_import_dmabuf also ask mmap_offset?
>>
>> The mmap  offset comes from drm_vma_node_offset_addr. The DRM VMA 
>> address is allocated when ttm_bo_init_reserved calls 
>> drm_vma_offset_add, so there should be no problem querying the 
>> mmap_offset. Whether mmapping of an imported BO is actually supported 
>> is a different question. As far as I can see, it should be possible. 
>> That said, currently ROCm (libhsakmt) uses only original BOs for CPU 
>> mappings, not imported BOs.
>>
>> Regards,
>>   Felix
>
> The mmap_offset is actually not returned to user space. I just wonder 
> if here we should get mmap_offset of imported vram buffer if allow bo 
> be imported to difference gpus. If a vram buffer is imported to same 
> gpu device amdgpu_bo_mmap_offset is ok, otherwise I think 
> amdgpu_bo_mmap_offset would not give correct mmap_offset for the 
> device that the buffer is  imported to.

When the BO is imported into the same GPU, you get a reference to the 
same BO, so the imported BO has the same mmap_offset as the original BO.

When the BO is imported into a different GPU, it is a new BO with a new 
mmap_offset. I don't think this is incorrect. mmapping the memory with 
that new offset should still work. The imported BO is created with 
ttm_bo_type_sg, and AFAICT ttm_bo_vm.c supports mapping of SG BOs.

Regards,
   Felix


>
> Maybe we should remove mmap_offset parameter of 
> amdgpu_amdkfd_gpuvm_import_dmabuf since we do not return it to user 
> space anyway. With that:
>
> Reviewed-by: Xiaogang Chen <Xiaoganng.Chen@amd.com>
>
> Regards
>
> Xiaogang
>
>
>>
>>
>>>
>>>> @@ -2249,7 +2246,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct 
>>>> amdgpu_device *adev,
>>>>           | KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
>>>>           | KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
>>>>   -    drm_gem_object_get(&bo->tbo.base);
>>>> +    get_dma_buf(dma_buf);
>>>> +    (*mem)->dmabuf = dma_buf;
>>>>       (*mem)->bo = bo;
>>>>       (*mem)->va = va;
>>>>       (*mem)->domain = (bo->preferred_domains & 
>>>> AMDGPU_GEM_DOMAIN_VRAM) ?
>>>> @@ -2261,6 +2259,12 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct 
>>>> amdgpu_device *adev,
>>>>       (*mem)->is_imported = true;
>>>>         return 0;
>>>> +
>>>> +err_free_mem:
>>>> +    kfree(*mem);
>>>> +err_put_obj:
>>>> +    drm_gem_object_put(obj);
>>>> +    return ret;
>>>>   }
>>>>     /* Evict a userptr BO by stopping the queues if necessary
