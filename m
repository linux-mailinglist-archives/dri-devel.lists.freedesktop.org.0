Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B02F7A9550
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 16:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D7B10E5CE;
	Thu, 21 Sep 2023 14:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580BB10E5CE;
 Thu, 21 Sep 2023 14:35:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYAFnbBIZfBigVJ8Akm3wbcAXdLO0Wol9x0q5kcGBK5AD6PdOR+5QfooZjB6b0GEQVHBOqLH2+EDF24W1RzSDrk0M5QoeXu2UPPLzbK6iVlhsTCB5DVJja8ntQJ2SNeO9BQWTB7482HBi40SujCl9QiVW0RP33qJY5+xLt29rrch5cH94jvt04/OxmRVhICw4JwO3GOvHqxsNf800vRppp1gy4oZaoNqgozqSp3qG5eX/LsC0y3B6K8JGohsnT7SaYpnb37Pkono62/jFOFz9iLOyhNxakCzubg9qpS7Urysff4ypxL5mtFIvyn/qs2UWA9CJCG94avQwzm7IwHBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kBgB248l0wNmD5upA0BY3Q9JCo9RTc6PIZ7qnOyBKg=;
 b=KVi1gkP0CoScC1XHQw7O3rTJSXu66j5YUQnqANdafYgUN1NjaKeLRlfgbv6rWSiHdDaAG2+PqBsMjfCcGEEKURiEU4qZtrFb5Lu8jXL+eQOo/kj7IvAHJFGIP7ocNkidFjNck2Sun6wLkQgQ+yt5nesrUjkvY6WDJNYQqTOva+x0B8hbS/KJ2GU1olXkkhi037/dCqlsaDmSElVVjryfagHLZ5K8sX5hHGZQbIkF5oM/DvOz9Q+ukowUUaRhEx+t1smNQcZR5xKazzilS5IeH99GSj2FEUDb6uG4AZ+7peAp38pvALiMdUBjmoXRjD6oANxF0Opank/S/bTH4gonKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kBgB248l0wNmD5upA0BY3Q9JCo9RTc6PIZ7qnOyBKg=;
 b=PVEQJLbKjXbzTo5I5M1Mpct4BI8q+2mMKQgGRIcS8dyiKnH+hWRciWeIaN9baZGox7DUUi5Tc80NtMiMVboAzTrRqXpDsIHc8KKq77BK5SSfVz+YxC+pd1kEu3laV4cFsSlqMySLbV+9rH+EbCKSmWw9DEBQ92azXYiUEvF7mtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5896.namprd12.prod.outlook.com (2603:10b6:408:172::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 14:35:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 14:35:03 +0000
Message-ID: <72ea51ca-f7b0-2e2a-b276-6c6c7413374b@amd.com>
Date: Thu, 21 Sep 2023 16:34:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH drm-misc-next v4 4/8] drm/gpuvm: add common dma-resv per
 struct drm_gpuvm
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-5-dakr@redhat.com>
 <7951dc11-6047-6beb-8ef8-98c862e26ec3@amd.com>
 <964a1bdd-549d-7850-9a8c-8278c4cd32ec@redhat.com>
 <20230921162510.10903d90@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230921162510.10903d90@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f966cbc-246a-41cb-5a0e-08dbbaaff0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WE35w0+Q6GhpYIzRDlXCRoIcY98YyqIsLu2ZlSbzAUC1ER4ClChxf9IZFHbDObMIc+URxVnpGYzAEg4hENTqvSkuG8hU7UNNbFdJl3YU7nZiZ70xaTfBJDWoJ3bNlxhDcvTUEh4DTzaZtnsSWvnIcjZb1KnLaSflIu8KoTeGy+ptWUh0AYq3pZBrOOi/INklk+25g1DRDIGWh6XmMm4jbxdZrVOUDqtxEkr0WZhdt8Hq2ca++LhiuJjcccu9Ws5xDjD7MtWowsIXjVMUEag6dsAPliKE4e8+sLwhEFbApFO1SWqgtxjwBcQ3nMmcvYoVEndDM1dLCePI6A/8QSCLLbfI+uBC/oc+1fHkHbuAVy/8L9rL21eS2/vsBn2mebwvvBkHI3Gmk+q3sz93fxoq6pA4mF/B2BHj6TgVsOqrMOuPuiLTR4WmJZk8VLH4Q64TONYl3imLXust1Lw2R8561Bkz6QxSj394zny4Ezn6A4ywNuffAf5GUMyd/dEkWog1Lzj6VE5XjrHM/4hz+nDi0vzAbhk8GbgmEIk8Z6mzXafhLvUG1cjzOgBYWDxBk9QbyfaFVYpf/5R16lzj5NxylNkg4CxBJXQLME3/RAQWjzZJjrZcGUYKYj3Fs0fX9VorXjag5itwT1mlbXqbbBs0Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(346002)(39860400002)(376002)(1800799009)(451199024)(186009)(4326008)(83380400001)(31686004)(6486002)(6506007)(2616005)(478600001)(6666004)(53546011)(36756003)(86362001)(31696002)(38100700002)(26005)(2906002)(8936002)(66574015)(6512007)(41300700001)(8676002)(66476007)(5660300002)(7416002)(66556008)(316002)(66946007)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWZTMS96TGlUamlpNTBoV294SnpaOFZHcFROTEZVR1NwcEZ5dUxrZHZzdENS?=
 =?utf-8?B?amxhRDhFc2w0OTh4SGY1S1JtOFlFd1ppQ1hWWHFsR1N3QmVJYW5wd1NZZnBl?=
 =?utf-8?B?VE5lSm5iaE5FMTFVUkhhMGNnQzhLY084cjQ0dElOSTk3WDM3WGU1dWNsTUlS?=
 =?utf-8?B?ZWpzSHdwOWxadHluNzNKVHZ2TjNGRmI3ZXZ5a2NzaElxRkpqbWxDZ1JkMGlE?=
 =?utf-8?B?a1l4MEcxUTVZaXBFMDJLbWYvNm14N280RlR5NVphZVRReElkejc3bXpCQ0ht?=
 =?utf-8?B?NU9IY05xQ212RndtVU1jTWphalVwV2VCckxKb1ZxYkw5eG9ZcVJQbTlTN3p1?=
 =?utf-8?B?R29NendVeS91MnR0WG5ENUJCeGF0Q2ZRb05lVVdLT0gxSTc0alpRZElLQjUz?=
 =?utf-8?B?VDF1K1JzNmVmNnRVb0ZXU3QraXZDYy9xN2ZMOVRjdEkyS0JGM0w3ZFFicHNq?=
 =?utf-8?B?OVhpQ2xEUFhmNllsdTI5dFFIRFY5NFRVVHlZK1BjNm5tNHNCUGVGbWRiV3A1?=
 =?utf-8?B?TmxtNVVhNFYwVlRLWlJGZnI0RmJScy9ETEJOdksrM0pldTJMRlpQRnd1ek96?=
 =?utf-8?B?RDRJcFk4ZjU1aHRLZlJoTTNTRUNiQ2xOY2gwMXJ6L2NxL3pXUWlTKzY1SUsr?=
 =?utf-8?B?eVBDbGJMbitOQmRKOXk5Nk4wNHdiUXpyZTlQWEhNZ01WVnI1SS9UeWpXcVJt?=
 =?utf-8?B?bkZlc045ditwUmNhOTVDZUVFVXpXZUlxS3phb3hyZlh4S3hVSU1qV2FWWStK?=
 =?utf-8?B?emRNRVJPZ1MveSs2eW5XVWRxUVFOWkgwYVd0Z2x1Tm85V3dRVXJWSDV5UU5r?=
 =?utf-8?B?Umo2c1dTRGk2UHN3S3JhdGFOZUJFZmFoTEJpdFE4NHhsU1ZwSFY0Wk1YWWZa?=
 =?utf-8?B?SFZkV0tGQitQaVJMUmlXZVJRQVNnZ01EYno3TVRXMWNvRlcxVnB3cjg1RGp5?=
 =?utf-8?B?c1JYb201SEJHZW4xdHMyNEp6ZS80aDJ4c2JQc1p6SUJ0N3p5S1J1M1RJMzBO?=
 =?utf-8?B?dkEvNHM2NHFwOUtQdkhya1JySVRBUVo1YU1XbDZGT0FtdzUwZWVGcjBGN0tV?=
 =?utf-8?B?cXR1K2QwaUd2Z21oYm8rZEVOTktWMkFPNXBzSWZwS2FBMXlQMm43Tk9VKy9X?=
 =?utf-8?B?a0V6UlZtYkxGR2FzMmxWbW1JVzVmbEliNVpnN0lKbkttcmgzanVsSXV6dHRt?=
 =?utf-8?B?VmpUVkZBQk1Ha01Za2JiTGR0K2Q0RGJROUc1dVhuVzMxc3V6NHZBSzExQ0VH?=
 =?utf-8?B?SmdXZlJjdzZvbkFxbmRKYjNPMnFDeWphZkkxRDczdFhBNitiTkZSaVlCc3pL?=
 =?utf-8?B?bnZnejV4ZkFqNVR6K3hSdGh2M0JvME5saGVHeVVvbnc1QThSRlJOKzYvcHNs?=
 =?utf-8?B?U2FRTlpGbXB2Yis3KzY1TjY1MEl5c2hyaE9sbzJET0EvWHo4M0NNMFc4Q0JW?=
 =?utf-8?B?cXpoeitSaU91dk16NDhMbXdnZHVyQWNBa3RwYlNBUWcxVThhdVQ2YWxsQ1dx?=
 =?utf-8?B?Y1I5U09BY2V5OFMrbnBUWER5ekFGZDVudGFWdVhTUlY1VE15SWxDck9pQXps?=
 =?utf-8?B?VDlrajF6ZERBYkQ3dmlaNjhlTEgwRy9UNGhMeXB4ZXFGakVTR2VyYkJvMzJU?=
 =?utf-8?B?UTV2REtYY2ZUbEN0REE5c216ZnQ5YklNVnNJeTZIdXZsbUk3V29tYWE0VFJV?=
 =?utf-8?B?NzRoeW1jL3A5emg3UmxUSWZQTFZ2TkZMM1hFK3VDY2EvVFoxeUtiQnhLMlVP?=
 =?utf-8?B?Q1FMOXNrSUV1SFlsTkFYWDY0RG5KV1lyMXNvTEc0bi9vVHBPdTAxdlJyZDZB?=
 =?utf-8?B?T2hjQmY2eU9uRXFaU1pCM0hkc0dCTWlHVnpoUkgvRGx2TUxwNlI3Tkc0TXpi?=
 =?utf-8?B?RHVReEk3Z3BUL0REQjFZUlFTQTJMbUFPVHVKc2l1Qk5UNStoMUdJME83aUEz?=
 =?utf-8?B?QU1TcTQrN2FSUjNwUU1RclA3QWxuNU9GaFBIdk5GVjUrWUNiWGZiQXBxQkNX?=
 =?utf-8?B?bFVJdkNMWWlscVNjbHFLUENjalc2SGVRQUMwUURkK1R1bFYzSUdhRzg1bHdo?=
 =?utf-8?B?RU5yZ0VvK0FYdThYSUllR0ozWGNiZlJrREtRUWh1Rk40YkY1cTVOVDJIVGor?=
 =?utf-8?Q?xXL93ljTeLtmRdDWc+uXOdvhC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f966cbc-246a-41cb-5a0e-08dbbaaff0fe
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 14:35:03.0572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKL/GDtc98FAiI7ffMHV+1BpB8XhVECEmyLkoILNC87CNMGd2B5DSaToM7YpBMfS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5896
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 21.09.23 um 16:25 schrieb Boris Brezillon:
> On Thu, 21 Sep 2023 15:34:44 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
>
>> On 9/21/23 09:39, Christian König wrote:
>>> Am 20.09.23 um 16:42 schrieb Danilo Krummrich:
>>>> Provide a common dma-resv for GEM objects not being used outside of this
>>>> GPU-VM. This is used in a subsequent patch to generalize dma-resv,
>>>> external and evicted object handling and GEM validation.
>>>>
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_gpuvm.c            |  9 +++++++--
>>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
>>>>    include/drm/drm_gpuvm.h                | 17 ++++++++++++++++-
>>>>    3 files changed, 24 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>>>> index bfea4a8a19ec..cbf4b738a16c 100644
>>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>>> @@ -655,6 +655,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
>>>>    /**
>>>>     * drm_gpuvm_init() - initialize a &drm_gpuvm
>>>>     * @gpuvm: pointer to the &drm_gpuvm to initialize
>>>> + * @drm: the drivers &drm_device
>>>>     * @name: the name of the GPU VA space
>>>>     * @start_offset: the start offset of the GPU VA space
>>>>     * @range: the size of the GPU VA space
>>>> @@ -668,7 +669,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
>>>>     * &name is expected to be managed by the surrounding driver structures.
>>>>     */
>>>>    void
>>>> -drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>>> +drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
>>>>               const char *name,
>>>>               u64 start_offset, u64 range,
>>>>               u64 reserve_offset, u64 reserve_range,
>>>> @@ -694,6 +695,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>>>                                 reserve_range)))
>>>>                __drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
>>>>        }
>>>> +
>>>> +    drm_gem_private_object_init(drm, &gpuvm->d_obj, 0);
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>>>> @@ -713,7 +716,9 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>>            __drm_gpuva_remove(&gpuvm->kernel_alloc_node);
>>>>        WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
>>>> -         "GPUVA tree is not empty, potentially leaking memory.");
>>>> +         "GPUVA tree is not empty, potentially leaking memory.\n");
>>>> +
>>>> +    drm_gem_private_object_fini(&gpuvm->d_obj);
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> index 6c86b64273c3..a80ac8767843 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> @@ -1836,7 +1836,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
>>>>        uvmm->kernel_managed_addr = kernel_managed_addr;
>>>>        uvmm->kernel_managed_size = kernel_managed_size;
>>>> -    drm_gpuvm_init(&uvmm->base, cli->name,
>>>> +    drm_gpuvm_init(&uvmm->base, cli->drm->dev, cli->name,
>>>>                   NOUVEAU_VA_SPACE_START,
>>>>                   NOUVEAU_VA_SPACE_END,
>>>>                   kernel_managed_addr, kernel_managed_size,
>>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>>>> index 0e802676e0a9..6666c07d7c3e 100644
>>>> --- a/include/drm/drm_gpuvm.h
>>>> +++ b/include/drm/drm_gpuvm.h
>>>> @@ -240,14 +240,29 @@ struct drm_gpuvm {
>>>>         * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
>>>>         */
>>>>        const struct drm_gpuvm_ops *ops;
>>>> +
>>>> +    /**
>>>> +     * @d_obj: Dummy GEM object; used internally to pass the GPU VMs
>>>> +     * dma-resv to &drm_exec. Provides the GPUVM's &dma-resv.
>>>> +     */
>>>> +    struct drm_gem_object d_obj;
>>> Yeah, as pointed out in the other mail that won't work like this.
>> Which one? Seems that I missed it.
>>
>>> The GPUVM contains GEM objects and therefore should probably have a reference to those objects.
>>>
>>> When those GEM objects now use the dma-resv object embedded inside the GPUVM then they also need a reference to the GPUVM to make sure the dma-resv object won't be freed before they are freed.
>> My assumption here is that GEM objects being local to a certain VM never out-live the VM. We never share it with anyone, otherwise it would be external and hence wouldn't carray the VM's dma-resv. The only references I see are from the VM itself (which is fine) and from userspace. The latter isn't a problem as long as all GEM handles are closed before the VM is destroyed on FD close.
> But we don't want to rely on userspace doing the right thing (calling
> GEM_CLOSE before releasing the VM), do we?
>
> BTW, even though my private BOs have a ref to their exclusive VM, I just
> ran into a bug because drm_gem_shmem_free() acquires the resv lock
> (which is questionable, but that's not the topic :-)) and
> I was calling vm_put(bo->exclusive_vm) before drm_gem_shmem_free(),
> leading to a use-after-free when the gem->resv is acquired. This has
> nothing to do with drm_gpuvm, but it proves that this sort of bug is
> likely to happen if we don't pay attention.
>
>> Do I miss something? Do we have use cases where this isn't true?
> The other case I can think of is GEM being v[un]map-ed (kernel
> mapping) after the VM was released.

I think the file reference and the VM stays around in those cases as 
well, but yes I also think we have use cases which won't work.

>
>>> This is a circle reference dependency.
> FWIW, I solved that by having a vm_destroy() function that kills all the
> mappings in a VM, which in turn releases all the refs the VM had on
> private BOs. Then, it's just a matter of waiting for all private GEMs
> to be destroyed to get the final steps of the VM destruction, which is
> really just about releasing resources (it's called panthor_vm_release()
> in my case) executed when the VM refcount drops to zero.
>
>>> The simplest solution I can see is to let the driver provide the GEM object to use. Amdgpu uses the root page directory object for this.
>> Sure, we can do that, if we see cases where VM local GEM objects can out-live the VM.
>>> Apart from that I strongly think that we shouldn't let the GPUVM code create a driver GEM object. We did that in TTM for the ghost objects and it turned out to be a bad idea.
> Would that really solve the circular ref issue? I mean, if you're
> taking the root page dir object as your VM resv, you still have to make
> sure it outlives the private GEMs, which means, you either need
> to take a ref on the object, leading to the same circular ref mess, or
> you need to reset private GEMs resvs before destroying this root page
> dir GEM (whose lifecyle is likely the same as your VM object which
> embeds the drm_gpuvm instance).

Yes it does help, see how amdgpu does it:

The VM references all BOs, e.g. page tables as well as user BOs.

The BOs which use the dma-resv of the root page directory also reference 
the root page directorys BO.

So when the VM drops all references the page tables and user BO are 
released first and the root page directory which everybody references last.

> Making it driver-specific just moves the responsibility back to drivers
> (and also allows re-using an real GEM object instead of a dummy one,
> but I'm not sure we care about saving a few hundreds bytes at that
> point), which is a good way to not take the blame if the driver does
> something wrong, but also doesn't really help people do the right thing.

The additional memory usage is irrelevant, but we have very very bad 
experience with TTM using dummy objects similar to this here.

They tend to end up in driver specific functions and then the driver 
will try to upcast those dummy to driver specific BOs. In the end you 
get really hard to figure out memory corruptions.

Regards,
Christian.

