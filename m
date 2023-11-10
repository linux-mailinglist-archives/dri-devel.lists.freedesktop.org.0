Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D977E7A49
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 09:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEC310E949;
	Fri, 10 Nov 2023 08:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58EB10E949;
 Fri, 10 Nov 2023 08:50:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q49M4C+bBA1rPXcSS3ECqgXYOgixF1EXeNHQzeWsS3whrtTEkySL2usw+rV5l1cpGXzlZ/KYpFNQPQxpzUiStpDiC848NO8zY2qkYzW6Q9bqLFTDyAS44VwwXNs+etWHcjBa/RV6nSU549WjeWB254EU0IX9mY4fjnwZptK1tnDUBxxOzRGtz4ZqToCWle1ch0OBTCewaYH1Oar5XM0DMIIEw+ThiCJiwXkxtqfU1LCwe9rNGB1Te/acZpQ+XLe/AEhmQDO0FtL6bISMUyF8G6JFFIobNTm8lWQTyb4ovkp60kgiv+pqebFBgwChzL8/Vl/z6GUV0IBYAUaw1SdEHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8vqUX/54yowamv95EhsHxqJOrOCcAD8AmSA3q7KdVY=;
 b=MQWrFS6MfrsGwStwoAwbq0H+616nKHvXd5MYkBf/BoMvx4iZrnEyHNH19Nb5VfFDumIwkk3rpYo2dQqwW4FtvpDJCkO2FY1f6uJGXdf+9S0ray3dRSUlB3MB6n1cSLI95K0MABurywE32gWKj9HQ2Sqt+OXL22VTPtKQ1fdZC4FCZ2pyDcNQP9EvfJdQx39kbCWC8lF7AS3Xu2/Rimf9vB81zRwLyKBxEZwiKpSgaIjJluV/LGwRNh+lQqi6CiptYc6rq0MRFq3uIfVbaQyolz5cVX5T5qR9MrueLqqz3h+DXCtSk+yMh8QpWXzjBDd+AfcPH6X9EKXX+BOkbwAhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8vqUX/54yowamv95EhsHxqJOrOCcAD8AmSA3q7KdVY=;
 b=XubHO7tbglwL1Yw4BbqEJuImNn9ZhThFQDjgg1duMKA7y2wQv1A+dD3ndiKifj8ws9FeRfZ31996R6p+4YWxvH0eVm/RBCnaFBWgQG9els5h0+Rv0TNkgik6QIGNOvhRr34XUyI2tT/AwoK20KvfzwuFWb8xfCquRXBPYonwMIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5082.namprd12.prod.outlook.com (2603:10b6:408:133::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Fri, 10 Nov
 2023 08:50:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 08:50:25 +0000
Message-ID: <1d4ca394-ee0c-4617-adbe-1d47e295c8fb@amd.com>
Date: Fri, 10 Nov 2023 09:50:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com> <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
 <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
 <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com> <ZUjZFFtLM435tTxJ@pollux>
 <8e87d962-c80c-40d9-94d7-58b6cd9dd794@amd.com> <ZUj0DdYZUgjhcvf5@pollux>
 <6d3c48f6-a92d-49b3-b836-ee1bc95b56bf@amd.com> <ZUkXkJ+zT7OFGosC@pollux>
 <44bc28c7-05f4-4419-5183-453c4951aac0@linux.intel.com>
 <6c536c94-7072-403c-9c63-d932252fd66b@amd.com>
 <4532d9d5-4c5a-4639-8136-d3ba9995d7b6@redhat.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4532d9d5-4c5a-4639-8136-d3ba9995d7b6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5082:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d83d52-64c8-4354-41a3-08dbe1ca1495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SMLtGb9qf/3IqOIozALSpMVYby9m878qvUVbgb/kzVuAru9UKHeUvodjTDIXAs/jcRCJ/wwVdO9EKjDkFSA+mTApDP5LIbg1j1YNp56PmB7+rqvTlSz/T4TfrLpa9LxxOhGw3XHIy/34RpVURnj+1sc7j3XEqQ0ARyr5Fsir1T9eFp8zK3zYj1b3l8zjuZLPURByBbJ+DgMU4cq1tH/DQKFIQucRnAwecAYMyRtClL5aKQ8kqaKpRV7Ym+O0MqWmsocNkRP9VQ47Kk+HgHrty3K0WFXOGfTBnyYsUpJa08geiZJkIkSltQTipQ9+FwmfRtQ3Y9lCPt0ozYNWXMPOcfjJA43nznoNQwhUWlkQoceUi0It0Pb88M15stpLeWazcdugeVaW8mWHKeLaQlptJqATsj4sBgYo1iKLsKNYm2QaS18k9LN0bO0wTJl/LncqbZhK/Iy0yspuIGBR8d/HFq80K2t8dLakUvVC2z7oOuvLfl0vhgSXICeXk+gZraNyheW6Yt9hy8gWmWGhFz3/YSmOznVnXPmNrEt9jvG/FjV+D1htemRA0xOtFS9eN6uw3n9deOqkzQVYph8DcplSwQT0v+/5pognD+PPmJOGgANhw0WXyjeBTjIFzLgo6jzqRzubJO8rLG+nEGHp7Aw3Mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(366004)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(6666004)(6486002)(478600001)(6512007)(6506007)(53546011)(2616005)(26005)(36756003)(38100700002)(86362001)(31696002)(66476007)(7416002)(66556008)(8676002)(110136005)(41300700001)(5660300002)(66946007)(66574015)(2906002)(4326008)(8936002)(83380400001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVVKR1NNc2pmb3hCZ3c1alVwSnFwRGRGcGFpejQxYnAyMGt6ZnFySGhiQTND?=
 =?utf-8?B?TjhrSFZkajIwU2pyVUd1MzlIaUlLUk5ZQ21FbnRuUHpWMnphdTc1Y1NoUzRN?=
 =?utf-8?B?Q3M2MFpiV0c0Z1JKeUdxNlFydG9RSHpjN25kYUZLSjQxVG5xWWhpcW1zZFM2?=
 =?utf-8?B?bUtHTm5NNzhNbXVWSWNENklMc0d6R3pFL2RoR1IxQklZalNZNkwydVVuMVFL?=
 =?utf-8?B?dzVuMnRSWUhRcXhKMHQwNGNjbll4SCtERnhhWjlaZjdPOHpvd0xjbUVKT3hU?=
 =?utf-8?B?OHJFZlZ5RXhRTmJ2N2NiUysweDNlbXRFK05ybkJBODBlL2NPSTIxWUpucXZk?=
 =?utf-8?B?R3UxMm05Q1FyWFhNWWFSTkVNZjhIQlZ0NDVrYnFRUHd6bHB4UnNXMG9FRXZJ?=
 =?utf-8?B?NUFRZlZidXdZaEF4Z2pYZW1oMU1WeVJSdUNjbjN1RTg3QTUrV1hrMlREcm8v?=
 =?utf-8?B?ZE1HaVhUa2U3bXluUHRNdnhzUUdhTzMraHg0TldHM1I1MGdVdTU4M1NXTWk1?=
 =?utf-8?B?MVN1RmMyb3FvMFR5WFE2Q1hiY0hsZGlRMHRPVm1nNmNwYkpQZi9oT2xLZzdI?=
 =?utf-8?B?TGw0bjJYMmV0dTZZZjJuZWRoaXpMNDdJaDZxK3ZUWk9FM0JscGs4ZkE0bTlW?=
 =?utf-8?B?QUw4T0JYWUZkZWdZdFBKQzFEVXc3Y0U5WHp6QTVyVndQenUvSU9nTkoxVUht?=
 =?utf-8?B?ak84ejdYTVVDL2VGeWRsV3lBZW5CeUNyUUprYi85ZURqRmVVMGJWVGdQSDZR?=
 =?utf-8?B?SkM2VFRlVytSajdWeTZJTmYrNVBWQUFaZnpmY1M5Nmg1ekwrV3VHWUw2WFh5?=
 =?utf-8?B?MGVtV3VlS1crWlVHQVhyRTI4a2xzNlNHbXBCbHNZcnI0NTU1cmlUeWh5OHRm?=
 =?utf-8?B?bFFiQmdUMDVEZTN2SldraUdmSkR6TitSQUw5U3JCZ29KTzVPanFzWTdnN21B?=
 =?utf-8?B?OEtFcjM4SGlISndxWU9sRDlITWVXQXZFYjF6ejRpWUtJUE5vK3hML3dHTjgz?=
 =?utf-8?B?bUVkMklOMUorSEZGZXRBbm5TeGZzWDcwTXpHbEd6ekI0czA4ZUtPTURYU2lo?=
 =?utf-8?B?MVJaNGFOVVFOQm1nMjVWTHBuSXFCd2NwdjQ4RDkyY0QzRjlCK2F5MmNsSkps?=
 =?utf-8?B?TlA0c2hZWnVYQjZiZmZMM3poUStuaWtqWTRoRlVhcWc4cDd6cUVveFZYOSto?=
 =?utf-8?B?a0k5ekpKdnpyejk3WlF3NGx2V00vWVhmcWN0Slp0NFlkcXRJa3NneEt3bXY5?=
 =?utf-8?B?c2tUcU5lL245eHJIRk5iNXpXRXlVclZ1c0g0ZHcxazVJWDhTOWhGQ0t6SmVG?=
 =?utf-8?B?UUx4ZitKLzNiUkpaQ1Rqc3NsSVRjWUN1bi9wUGFmUERrZ0VGcDBndG1XVUZQ?=
 =?utf-8?B?NWR0VXNBcGp2Yms0ZEdZK3lxTUJxUHpzRzFtVW1WbzNXRUY0eHBJR1RSUDNZ?=
 =?utf-8?B?dC9WVkNLMkx5cVRPNHF3ZnU4dS9FMlh1NlZkS2l5Qisyd3lid0M0S09Xc0Zz?=
 =?utf-8?B?MnJaUTdQYkFYNlgyMUd6OXJwQUZSNzlJaTQzZmZWQ0lUTDk2R3NMMi9YelVI?=
 =?utf-8?B?dnFubEdoNlNPemY3WGlzajJheG84QTN1Z2E4Y21NbCtnbkNiVEZMS0FmS3px?=
 =?utf-8?B?QmJUdnZkb0V6UVVMbi8yOERaS0t4U1NaN0RWcXRDSUQ4bDBQMUNDUkJzaUMr?=
 =?utf-8?B?L3llY3lNUWxLcEhkZkwycW1QcnBUVXBhMytUd0xmTnQ1R0dsSHNYTml1ZHNl?=
 =?utf-8?B?eDNEM3ZtZW5hOTJFVWpjeFpjd0ZKWmg4eC91N1A1VkF6ajF5N0JLWWZJTkV4?=
 =?utf-8?B?d1FQQnFOV1ArcFpBUFlyNnRrTzJoK2lycmFQTWRqWEhTdkFETTNlUjVSTW5O?=
 =?utf-8?B?S1NtMjlxaEw0ejBicGZhTXdBWm90RGQxbGV3YzZqanlXOVJUb3lWeVlqU3Fx?=
 =?utf-8?B?ODBDSXZxK1RDenFJZHhDOExjZUZnSlRmTzczbmxYTnlYdUwzRWx0TkxNazBR?=
 =?utf-8?B?SXNtMGZpbW0zNnA0Z3Roc1FEdjRCUDJXT2pqVklVU3RCTmdPcG1meU1SNU40?=
 =?utf-8?B?NWxJOGwwKzhJSUdNVTE0SjIrZ3A5SUtqcXhJZ0ltTmFVWEx4ZE95N3QvTkFD?=
 =?utf-8?Q?W8Io=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d83d52-64c8-4354-41a3-08dbe1ca1495
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 08:50:25.3648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQgBKvqMEDNDaIer0uCYJyZk8IL5/h2SVLJnvY3xvT32UlowNA34ACG/iPNbyJg5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5082
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net,
 boris.brezillon@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.11.23 um 19:34 schrieb Danilo Krummrich:
> On 11/9/23 17:03, Christian König wrote:
>> Am 09.11.23 um 16:50 schrieb Thomas Hellström:
>>> [SNIP]
>>>>>
>>> Did we get any resolution on this?
>>>
>>> FWIW, my take on this is that it would be possible to get GPUVM to 
>>> work both with and without internal refcounting; If with, the driver 
>>> needs a vm close to resolve cyclic references, if without that's not 
>>> necessary. If GPUVM is allowed to refcount in mappings and vm_bos, 
>>> that comes with a slight performance drop but as Danilo pointed out, 
>>> the VM lifetime problem iterating over a vm_bo's mapping becomes 
>>> much easier and the code thus becomes easier to maintain moving 
>>> forward. That convinced me it's a good thing.
>>
>> I strongly believe you guys stumbled over one of the core problems 
>> with the VM here and I think that reference counting is the right 
>> answer to solving this.
>>
>> The big question is that what is reference counted and in which 
>> direction does the dependency points, e.g. we have here VM, BO, BO_VM 
>> and Mapping objects.
>>
>> Those patches here suggest a counted Mapping -> VM reference and I'm 
>> pretty sure that this isn't a good idea. What we should rather really 
>> have is a BO -> VM or BO_VM ->VM reference. In other words that each 
>> BO which is part of the VM keeps a reference to the VM.
>
> We have both. Please see the subsequent patch introducing VM_BO 
> structures for that.
>
> As I explained, mappings (struct drm_gpuva) keep a pointer to their VM 
> they're mapped
> in and besides that it doesn't make sense to free a VM that still 
> contains mappings,
> the reference count ensures that. This simply ensures memory safety.
>
>>
>> BTW: At least in amdgpu we can have BOs which (temporary) doesn't 
>> have any mappings, but are still considered part of the VM.
>
> That should be possible.
>
>>
>>>
>>> Another issue Christian brought up is that something intended to be 
>>> embeddable (a base class) shouldn't really have its own refcount. I 
>>> think that's a valid point. If you at some point need to derive from 
>>> multiple such structs each having its own refcount, things will 
>>> start to get weird. One way to resolve that would be to have the 
>>> driver's subclass provide get() and put() ops, and export a 
>>> destructor for the base-class, rather than to have the base-class 
>>> provide the refcount and a destructor  ops.
>
> GPUVM simply follows the same pattern we have with drm_gem_objects. 
> And I think it makes
> sense. Why would we want to embed two struct drm_gpuvm in a single 
> driver structure?

Because you need one drm_gpuvm structure for each application using the 
driver? Or am I missing something?

As far as I can see a driver would want to embed that into your fpriv 
structure which is allocated during drm_driver.open callback.

>
>>
>> Well, I have never seen stuff like that in the kernel. Might be that 
>> this works, but I would rather not try if avoidable.
>>
>>>
>>> That would also make it possible for the driver to decide the 
>>> context for the put() call: If the driver needs to be able to call 
>>> put() from irq / atomic context but the base-class'es destructor 
>>> doesn't allow atomic context, the driver can push freeing out to a 
>>> work item if needed.
>>>
>>> Finally, the refcount overflow Christian pointed out. Limiting the 
>>> number of mapping sounds like a reasonable remedy to me.
>>
>> Well that depends, I would rather avoid having a dependency for 
>> mappings.
>>
>> Taking the CPU VM handling as example as far as I know 
>> vm_area_structs doesn't grab a reference to their mm_struct either. 
>> Instead they get automatically destroyed when the mm_struct is 
>> destroyed.
>
> Certainly, that would be possible. However, thinking about it, this 
> might call for
> huge trouble.
>
> First of all, we'd still need to reference count a GPUVM and take a 
> reference for each
> VM_BO, as we do already. Now instead of simply increasing the 
> reference count for each
> mapping as well, we'd need a *mandatory* driver callback that is 
> called when the GPUVM
> reference count drops to zero. Maybe something like vm_destroy().
>
> The reason is that GPUVM can't just remove all mappings from the tree 
> nor can it free them
> by itself, since drivers might use them for tracking their allocated 
> page tables and/or
> other stuff.
>
> Now, let's think about the scope this callback might be called from. 
> When a VM_BO is destroyed
> the driver might hold a couple of locks (for Xe it would be the VM's 
> shared dma-resv lock and
> potentially the corresponding object's dma-resv lock if they're not 
> the same already). If
> destroying this VM_BO leads to the VM being destroyed, the drivers 
> vm_destroy() callback would
> be called with those locks being held as well.
>
> I feel like doing this finally opens the doors of the locking hell 
> entirely. I think we should
> really avoid that.

That's a really good point, but I fear exactly that's the use case.

I would expect that VM_BO structures are added in the 
drm_gem_object_funcs.open callback and freed in drm_gem_object_funcs.close.

Since it is perfectly legal for userspace to close a BO while there are 
still mappings (can trivial be that the app is killed) I would expect 
that the drm_gem_object_funcs.close handling is something like asking 
drm_gpuvm destroying the VM_BO and getting the mappings which should be 
cleared in the page table in return.

In amdgpu we even go a step further and the VM structure keeps track of 
all the mappings of deleted VM_BOs so that higher level can query those 
and clear them later on.

Background is that the drm_gem_object_funcs.close can't fail, but it can 
perfectly be that the app is killed because of an OOM situation and we 
can't do page tables updates in that moment because of this.

>
>>
>> Which makes sense in that case because when the mm_struct is gone the 
>> vm_area_struct doesn't make sense any more either.
>>
>> What we clearly need is a reference to prevent the VM or at least the 
>> shared resv to go away to early.
>
> Yeah, that was a good hint and we've covered that.
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> But I think all of this is fixable as follow-ups if needed, unless 
>>> I'm missing something crucial.
>
> Fully agree, I think at this point we should go ahead and land this 
> series.

Yeah, agree this is not UAPI so not nailed in stone. Feel free to add my 
acked-by as well if you want.

Only keep in mind that when you give drivers some functionality in a 
common component they usually expect to keep that functionality.

For example changing the dma_resv object to make sure that drivers can't 
cause use after free errors any more was an extremely annoying 
experience since every user of those interface had to change at once.

Regards,
Christian.

>
>>>
>>> Just my 2 cents.
>>>
>>> /Thomas
>>>
>>>
>>
>

