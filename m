Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF05B7A9528
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 16:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4838B10E5BF;
	Thu, 21 Sep 2023 14:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C14C10E5BF;
 Thu, 21 Sep 2023 14:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VW7y06v32kc8lVKn8jJmcfyhVQCCc/GGh9DURJNsQDiF0ysO/gsxX6/FjpX12JvdT6wZLVy9ITlVlVuKjy2FHYcSd6UbAB/NfeBUnVK7n6XBSwDi1EKOqRVsXu81V9yO8Fgvq4xbED72PxHHxrqwPz2XBqMdgL1v1c0ZYwwYVIPWkeSb1T7VCGFsoCgQ3gClel2rc/erCyFdNY5qs7R0s79B9pEt7EmPIjXWzaFuDWrS1tjV/iK6U/2VAaqI7bu+znRsaqL96AnPza9B4XedaxHTeqw768y1JpnbDTTsqRyKMMq+uRLEn0CEsQfceWuNhg5x9E4U3DOkYdeUZQoU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHQgeMWlXpXtScZaX+CRA5sSkg+CIzwbWXgFqvZa1r8=;
 b=c3PcHQxQBEZfNV9LHAVYt75yVuVvNOga9V+TA0HDa4WOFNbxbQSO6Tv4h2HfifqoWCnkamhDcNMi908A11kfw/7rZGQJ2oFjI5JmIZkLA29Gj35HWW+MrGm8dq1j3QQigfZZkbZvKPjrrAkhsZK92EONiHE1MMAR9cc9Ag0UzgGckjsvnxuU5rN+4Bzub9399kOU1B6pFWlqunryo7VKSK5Nls7TqwJsZwzw2ubqcC1osoTw5o39FHAWywi4teZHqwXR4PeLRagy9fRJSpw7Ns9Ba+THBUj1MIOROOFn9nvGbFeWzReASNAzOe34OoSPHtSCyuogovr4rjfzgyTtEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHQgeMWlXpXtScZaX+CRA5sSkg+CIzwbWXgFqvZa1r8=;
 b=ZvtLf7N/qE5V7Iwo6JVemqOzBAILMKPNvWR+h6F4UlQ3zGkSYRrRkZn6Yh5DuQMIwsJG0V/1ByYoebmvxgX+G4KPst/dPecoMVecCyhL1YbMUxslZP93QD6PLN1wr0qRaZaBz+UVupveYUSYwD06RSzZZdi1lT7s7nb3jQzcRso=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4309.namprd12.prod.outlook.com (2603:10b6:610:a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Thu, 21 Sep
 2023 14:21:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 14:21:17 +0000
Message-ID: <d0cbf0f3-121d-ff37-3a0f-eca798d56e47@amd.com>
Date: Thu, 21 Sep 2023 16:21:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH drm-misc-next v4 4/8] drm/gpuvm: add common dma-resv per
 struct drm_gpuvm
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, faith.ekstrand@collabora.com
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-5-dakr@redhat.com>
 <7951dc11-6047-6beb-8ef8-98c862e26ec3@amd.com>
 <964a1bdd-549d-7850-9a8c-8278c4cd32ec@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <964a1bdd-549d-7850-9a8c-8278c4cd32ec@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4309:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c85ede-ee69-452a-a407-08dbbaae04f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ft5u+MXh7DDMNmpyFRYVsaXLWUQbU7nwI2kkGjCC2dcGgnN9NSJ0PTRYFsI8exzNmOywbjRrfwRjczhzbIIMiaqr0ynsCS3bKzExUxehvlArn/b0/g5348LENq7E/+xr3DdL+fo34cCLrx9zFrDKl/sOn+dzumPzrvoHN5p8mU9hlfU9jilUVVzNUzSdnxn3noevxPhO6zUh0tYzNyNL5SOZ22MaqB8W43wQTXXyY8Nu/M5DouhHzIOwufsq9okCjYCFA0z+4Nc8eBaglHIq1sx97KwdVTSIXRHtun4pa5Wc4o6uyMpShRK4MBzQ7mkuBKas4eb2IsQsu30q25uxv8CN19uDe4pTdhXR2s1cQKiEWewP5cgUu6dYNShRqd86NL7auIf9XVj70xN2lMS6OWtewWdwHGY+FMgFMYDKEpLBkh/ByRRcyHGSMdgBvXBXCu+OGPf6DVQkOBH/Se+bShitXykvzYRMpPpzNTCFLJtzWAc60rCeUM2iG+1VzMKETkxQf/lPbv1LhzjFxPhwh1MLB0FzotPBXl7EoQdUdr90zfdQZCP9PGIShw2/yS2Mu5rcT0CCJBcKj8Wo7Q7SYZnnRndS5PekzLLF9FtBr/F2HkaGyI4HenmSlt6q4Zxf8/+jaXF4q1nFoEew+OwepQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(186009)(1800799009)(451199024)(53546011)(6512007)(6506007)(6486002)(6666004)(83380400001)(38100700002)(86362001)(31696002)(36756003)(2616005)(66574015)(26005)(41300700001)(7416002)(66476007)(66556008)(66946007)(316002)(2906002)(5660300002)(4326008)(8936002)(8676002)(31686004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEZFcWJ5dnJYSFV1M1F2dzhGMCtRZzBQSlJKZXFtWTU4TmJGVnE4VzUyRUNq?=
 =?utf-8?B?WnpvL3FqYUtWZTZkUWpZY2k0RXBkbHNSMExCaTRPUzFDRHJwbEh0c2ZiQXI2?=
 =?utf-8?B?N1dSMjJoaXN5c3RyNllpQ0lwYW9JcnRLOEhPVWZrS1JUeEh2K2FvUEI5aktj?=
 =?utf-8?B?TE9kcHBIemFOVlB5QUQ3Umd5Y0tETmJPS2s2dEZzWExvdUJRc0JibEdmckNF?=
 =?utf-8?B?TnNMMjZPUnRyUEtsMmJzeWVUUVhwbUg2VjhMNHRNZGcvL3dvTEpkaXphYlBG?=
 =?utf-8?B?Tm5WWmd3VUxXYTdXdEpkcFgrSXpGSGxQRHVCTUp3Zm9HU283WXZvVW9GN3p4?=
 =?utf-8?B?Z1ZXbzFsOXJsMHZuRGpNR2Z2K21vaXlxalJDeWxxYXRJY3AvTGxOZGZXTnha?=
 =?utf-8?B?R1NNdFJ3QXArcHZOZ2NRRjdjU0xYd0hzNjBJV08wV3hEZFVIblZvVnpveHpl?=
 =?utf-8?B?Zkt0cTFSS0dKdzllMWFadS9CMVNyRFJpSkdMeFIwSytxVElyODRxMGtJRU8r?=
 =?utf-8?B?U2NuRWgvYUwvaHlnamNmV2UxWDZEZjRlOWNMajJYOHQrWDdVNjhVWmFSNk9F?=
 =?utf-8?B?bkdtM2JOc2wwYWFPeWZJdlpMVVpHdlZhbG1iT3ZGcUk0TDIrcTI4UW96RllJ?=
 =?utf-8?B?QUxxc200T0d4ZzJOL0pLVXVSQVN3eU4vUmpnZnNMUk5YWHlpMnBVWFpHbnlZ?=
 =?utf-8?B?azlISWgvNkd6MzNTc1RmNldVeS9PdVdtbDZYTk5pS0F2bTRZYVlaSC9mREUr?=
 =?utf-8?B?ZEVaT2UzcVo1aUNmR2FMR1RUN2t0YWRBZmhOeTlWKyt1c1lXZVVYMTE4Lyt6?=
 =?utf-8?B?TjFwR05aaWdRRW95NlNydmxsRGxoOCtjRHhwQ2RzbnJLQXZLeE9iNWQzbkFB?=
 =?utf-8?B?VlhwdHQxUzRSOFB0aU82VTM3N1VTNjJWMk5veU9Ob25RckJLS1NMTkFZWWtE?=
 =?utf-8?B?TUpZU2YvV3JxRVBBU3loWTV3YVI1alhjRGNsbVZyajlxNXpUZUxoNHdkK0Zm?=
 =?utf-8?B?ZlUrb3NYZmZJT1JnTnJEZlZmQXBja1Z3bXlNZDRWQ0xNb3dlTUNQcTVrVllQ?=
 =?utf-8?B?THBaNCs1NUsxNERaaFJnSk40RUtaZVVMWE1LemRHRldQbnVNSXp3YzdsOHdp?=
 =?utf-8?B?ajJLMlFOWmc4M3MzVXp6SHdPYkFmZ1Yxckpsa2ljK21ZNGpyZXZWbCtLdGh5?=
 =?utf-8?B?Qm5VdXMwVDIxTzRESmVJcVJvRHd4ZW9ZODl4UmVPS1dwc1g5WDNaL2dYMjNW?=
 =?utf-8?B?eHVYeEZ4T0xVd0NSd05TL3FwL0hhNnlDVDNGd3pCcUo0MWV5S1J3STlPZHZ4?=
 =?utf-8?B?djRVczhyaS9ReHQzRitTRzIySVhpY29tb1R6cnpGY3ZFWUFURTVRWXBCZEt0?=
 =?utf-8?B?alRYUXo1NHo5cmhjRGdrRitNMDdLck52djdFWGpLaExYM05EeHZTRjl6M0JH?=
 =?utf-8?B?Ny9MNk1EOEU4V21kU0ljUGg5bWt6cGhxY1U2Qzd4a0Vnc0Fqc0RIYVc0OS9J?=
 =?utf-8?B?NnlFaFAzVWxhVUc3dGlYWkI4Y2Z6RmRlRG9Zb1ptckpEdllqVWRJNHpaem01?=
 =?utf-8?B?MnJ1WjRWRjNrYXNHcm5XaWdQUXk4aGt1b1V5a0pOZW84VEhlNWxYZXovb0di?=
 =?utf-8?B?RHZCb0ZVZUFkWEFrWkRmRFdTUW5oQ3Y1WEphR1BTc2R2T2kxUW9ycktLRXlK?=
 =?utf-8?B?VFBaZ2hlaUVYYnRzNzRkNkxvOUFYb28yTXZOQzRLeWRBV0cvUzJ4emhqVUpK?=
 =?utf-8?B?c1FYdm5FUjd5WTdFZE9qQjhjZklNYzNXTlZwT2h0NFdyTFMrMzlHZlg0dmV5?=
 =?utf-8?B?RHNvbFZhYllrbWh1eVA0ays2UGFoYUMwMDMyb01Eb3ZzQTl5NnNWUCtsd0xM?=
 =?utf-8?B?Z2l0U2d2ZmJlaUlMR0lrOTcvazJoV0VyZDNoV0VVaWtKZ3YyWlhFa0JMVUFt?=
 =?utf-8?B?aTllM1hHQXlrbXlNbGIrdWlVWUVjTEUwUks4ME96aWVlUnRMOTVlUk81TDBl?=
 =?utf-8?B?OHRZRGZEOG5LVUUvbC9FQ3c2dmpzUHk1UUREelhCNUZPYzIvbHozcmtWczJG?=
 =?utf-8?B?WFZ1bXBLTlBHVG9ScFZZUFg1WlRnekFWUU1DeWFnYkpBcE1LM2Z6MU9lR3hs?=
 =?utf-8?Q?CO9E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c85ede-ee69-452a-a407-08dbbaae04f1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 14:21:17.5069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYV6ftUhFMg9TOaGzR94Z3LddNbK9MK5AC0GvOrzTBvQnbixiBALuS4/n/pjigQu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4309
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.09.23 um 15:34 schrieb Danilo Krummrich:
> On 9/21/23 09:39, Christian König wrote:
>> Am 20.09.23 um 16:42 schrieb Danilo Krummrich:
>>> Provide a common dma-resv for GEM objects not being used outside of 
>>> this
>>> GPU-VM. This is used in a subsequent patch to generalize dma-resv,
>>> external and evicted object handling and GEM validation.
>>>
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>> ---
>>>   drivers/gpu/drm/drm_gpuvm.c            |  9 +++++++--
>>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
>>>   include/drm/drm_gpuvm.h                | 17 ++++++++++++++++-
>>>   3 files changed, 24 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>>> index bfea4a8a19ec..cbf4b738a16c 100644
>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>> @@ -655,6 +655,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
>>>   /**
>>>    * drm_gpuvm_init() - initialize a &drm_gpuvm
>>>    * @gpuvm: pointer to the &drm_gpuvm to initialize
>>> + * @drm: the drivers &drm_device
>>>    * @name: the name of the GPU VA space
>>>    * @start_offset: the start offset of the GPU VA space
>>>    * @range: the size of the GPU VA space
>>> @@ -668,7 +669,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
>>>    * &name is expected to be managed by the surrounding driver 
>>> structures.
>>>    */
>>>   void
>>> -drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>> +drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
>>>              const char *name,
>>>              u64 start_offset, u64 range,
>>>              u64 reserve_offset, u64 reserve_range,
>>> @@ -694,6 +695,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>>                                reserve_range)))
>>>               __drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
>>>       }
>>> +
>>> +    drm_gem_private_object_init(drm, &gpuvm->d_obj, 0);
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>>> @@ -713,7 +716,9 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>> __drm_gpuva_remove(&gpuvm->kernel_alloc_node);
>>>       WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
>>> -         "GPUVA tree is not empty, potentially leaking memory.");
>>> +         "GPUVA tree is not empty, potentially leaking memory.\n");
>>> +
>>> +    drm_gem_private_object_fini(&gpuvm->d_obj);
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> index 6c86b64273c3..a80ac8767843 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> @@ -1836,7 +1836,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, 
>>> struct nouveau_cli *cli,
>>>       uvmm->kernel_managed_addr = kernel_managed_addr;
>>>       uvmm->kernel_managed_size = kernel_managed_size;
>>> -    drm_gpuvm_init(&uvmm->base, cli->name,
>>> +    drm_gpuvm_init(&uvmm->base, cli->drm->dev, cli->name,
>>>                  NOUVEAU_VA_SPACE_START,
>>>                  NOUVEAU_VA_SPACE_END,
>>>                  kernel_managed_addr, kernel_managed_size,
>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>>> index 0e802676e0a9..6666c07d7c3e 100644
>>> --- a/include/drm/drm_gpuvm.h
>>> +++ b/include/drm/drm_gpuvm.h
>>> @@ -240,14 +240,29 @@ struct drm_gpuvm {
>>>        * @ops: &drm_gpuvm_ops providing the split/merge steps to 
>>> drivers
>>>        */
>>>       const struct drm_gpuvm_ops *ops;
>>> +
>>> +    /**
>>> +     * @d_obj: Dummy GEM object; used internally to pass the GPU VMs
>>> +     * dma-resv to &drm_exec. Provides the GPUVM's &dma-resv.
>>> +     */
>>> +    struct drm_gem_object d_obj;
>>
>> Yeah, as pointed out in the other mail that won't work like this.
>
> Which one? Seems that I missed it.
>
>>
>> The GPUVM contains GEM objects and therefore should probably have a 
>> reference to those objects.
>>
>> When those GEM objects now use the dma-resv object embedded inside 
>> the GPUVM then they also need a reference to the GPUVM to make sure 
>> the dma-resv object won't be freed before they are freed.
>
> My assumption here is that GEM objects being local to a certain VM 
> never out-live the VM. We never share it with anyone, otherwise it 
> would be external and hence wouldn't carray the VM's dma-resv. The 
> only references I see are from the VM itself (which is fine) and from 
> userspace. The latter isn't a problem as long as all GEM handles are 
> closed before the VM is destroyed on FD close.
>
> Do I miss something? Do we have use cases where this isn't true?

There are multiple use cases where this isn't true. One example is 
memory management with TTM or drm_exec. The both grab references on the 
objects they lock.

Since this is eviction code it is perfectly possible that a GEM object 
is locked from a different VM then the one currently in use. So a single 
GEM object from a VM can live longer than the VM itself.

Another potential case is delayed delete where a GEM object might need 
to stay around a bit longer because of hw restrictions. This can simply 
be that we wait for shaders to end, but also hw workarounds where we 
need to wait some grace time before freeing things.

>
>
>>
>> This is a circle reference dependency.
>>
>> The simplest solution I can see is to let the driver provide the GEM 
>> object to use. Amdgpu uses the root page directory object for this.
>
> Sure, we can do that, if we see cases where VM local GEM objects can 
> out-live the VM.
>
>>
>> Apart from that I strongly think that we shouldn't let the GPUVM code 
>> create a driver GEM object. We did that in TTM for the ghost objects 
>> and it turned out to be a bad idea.
>
> You mean let GPUVM create a dummy GEM based on the drm_device from the 
> driver? What were the problems that were encountered?

See ttm_buffer_object_transfer() basically we created a dummy TTM BO to 
hang on the old resources for pipe-lining eviction work.

While that initially was a good idea because it speed things up quite 
massively it turned out to be a big maintenance burden because those 
dummy BOs ended up in driver specific functions and the driver tried to 
upcast them to their internal representation. That in turn of course 
didn't worked and cause very subtle memory corruptions.

KASAN was a big help to narrow those down, but we initially spend month 
until we figured why some random code was going south sometimes when TTM 
was in use.

I really don't want to repeat that.

Regards,
Christian.


>
>
> - Danilo
>
>>
>> Regards,
>> Christian.
>>
>>>   };
>>> -void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>>> +void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
>>> +            const char *name,
>>>               u64 start_offset, u64 range,
>>>               u64 reserve_offset, u64 reserve_range,
>>>               const struct drm_gpuvm_ops *ops);
>>>   void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
>>> +/**
>>> + * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
>>> + * @gpuvm__: the &drm_gpuvm
>>> + *
>>> + * Returns: a pointer to the &drm_gpuvm's &dma_resv
>>> + */
>>> +#define drm_gpuvm_resv(gpuvm__) (&(gpuvm__)->d_obj._resv)
>>> +
>>>   static inline struct drm_gpuva *
>>>   __drm_gpuva_next(struct drm_gpuva *va)
>>>   {
>>
>

