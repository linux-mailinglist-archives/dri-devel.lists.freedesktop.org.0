Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DC97E1D10
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 10:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B2D10E0D3;
	Mon,  6 Nov 2023 09:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8834110E0D3;
 Mon,  6 Nov 2023 09:14:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFAZXEiE6SopGwLrun9HKO/5qvTVDmQTG57Jb5CcKHnBAWUN3EEtZRAo+Xa+obRZY04WFH+RnurjR7q+h8Ub5qHEicfMVpGMCiJrR6bHnXtlzwTMqVs4bqkmgjxi8lQOTqhGpsus8p2CULZ3ikr9jfUZRiJiuUfGKLyL7y/PyqeTwmUMUNweCotEcczpsO2IAjPMgQFm30NLc/n68x4cptqBZnjvTfMK1aXWh4Ak2WTFdI5IG79Wf/ZahXoml3RyUKQSXlLu6y+7Wavl/oGCHejXzQ10gx8Xy/IKHvPL9ubEl7ZK01vWipZGvZsQOkUmyMVewO087cr327uv9HyagA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P94Xz1HJhCroRsZxTK792EZb1lOaXvc9ocBzdfmbWqw=;
 b=WH/zqHvy0MLB9ReZe69/A9jQFYBbwBw7EA1bDBfTGPqyX8Pn7mIXI0xUONEUZ+0Pe3XxlZtwNOFraxKQJjCArSqc8F0dnTA3fooiugScqV5w1syF7IeopZMvADn+IYO7W7DIFzTzBIrF/g/GLiILtoX9cXXRZ4hqH7Xjs49Tb/VkijVsI3iiywlWxlMSMylsZ4WzM4TzUtcGGTYkxsxGE9d9IUd93jIBC+6UZpYbtGAidgfp4DpCjB0qNAha5Ki7WNCFfviAqGLcIyabJZYPswKMn5GNyTsOEUO7zrOAnaLAAEF+qXlK/s5DTn2YkBZy0PrBfwIaMiDrth23yPxpOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P94Xz1HJhCroRsZxTK792EZb1lOaXvc9ocBzdfmbWqw=;
 b=mg6+xpIAOaqi4PcRlITTk6ZY+e18Sx015CT1l+ASebxalYEx+yXoNMHmrqAFBHGi54pq0/BiCxS57zgneaAwoUtO9c8NjMnw/sDEgWjlGJivn72xqDRpCVASq5xJAkUN/9BbAsgyMEVMLhWGNZ3Dh4Tx37s6/ecrtQ888nzC4c8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4936.namprd12.prod.outlook.com (2603:10b6:a03:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 09:14:52 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 09:14:52 +0000
Message-ID: <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com>
Date: Mon, 6 Nov 2023 10:14:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
To: Danilo Krummrich <dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com> <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
 <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BY5PR12MB4936:EE_
X-MS-Office365-Filtering-Correlation-Id: 8249edaa-7eaf-42b9-7f5b-08dbdea8d4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hBJAmvD7H8t1DSOzl+xp++VTuaaiNw2TTJxlPDYB9i+JANLelBSQWfeNfEKyEsz8R+uqiZ99fGjsVAEvKiKjHF30jHlfEtQMceGXKdFOlUgX96IcjtT2q5Vty6otHrMJfz5VvhCPKWL6jn2OKNDBf71mvAmvS1YvoQNS+Fu4Kn2rZP6zG9+h4t3KXYlOq8X0wkb2KI803sfUGtiQo/2/9qvmnhxHR4ejwahnwcKRfxTgrFSK88hV4C+6lygYBuiPgU9NXCGGCyY+gTrOV7hS5jcQU1PIGFitQqMSja7m49/o+8xbmYi1i+cJ4iwrvq46l2RsZZz6BD6YcwVWW/0dIpjumyPusOOniQsEu4JXaNw6WzNWL224Ytl/CwNFiJeBege63NAGbnJNKirtSAIOp4jRfuG7zHCfgFtsLSxb+FSPnzyq29JvVrCylm5iydOEBDTy1tBcb2EaTV15QoVQ8Xo0XsOQwyWjfvr4GtEbJfuVWfChWIquOFA0N6ykN+JssxusjUhPneiIexD/x/v/NOuS37T5u567alWG6pqntiWIs4Oboohh6v7q0YqYZAMeCl+baUZgDWOW6VLdXcCNBmxnUPJCZKKBR35ZkGzjDZFfcdEYxmWJn2admSvaA+0t+qzT6sjbloy7ojbhHbClc+2BX4VC3s9BhhTg98ZK5zzNUgG2Ta1hGei4mBtjQGmd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(30864003)(2906002)(41300700001)(8936002)(6916009)(478600001)(316002)(66476007)(66556008)(66946007)(38100700002)(8676002)(4326008)(36756003)(31686004)(86362001)(5660300002)(31696002)(7416002)(6486002)(83380400001)(6666004)(2616005)(6506007)(26005)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHl2aGhCSi9vOUZ2bW4yWmNuL2ZqMCtoYkNWZlI1QXh2bWI3TTFKVytBcks1?=
 =?utf-8?B?ZEUyNUVKcVV0cnRKTWFBTWdnZ1dVTml0YStkTFhVMHBKbUg3TWc5UUlUY1lD?=
 =?utf-8?B?RHFlUHFxWHY5TDV5L1RjVTFwc3cveE1IaysyN1k3MjdCYkQ5cXVOSFQyWUt2?=
 =?utf-8?B?a0RjUEk1MzR0a1J0eUV6a1BMT2R4bW9MUkZLMzdzNkRLRW54dHpLYmdGL1dW?=
 =?utf-8?B?VFE3bTczV1hDdXBPYWhmeXcyYVlBUU10QWtFMU9Gd3dIMDNZdm5LYXdxZXZo?=
 =?utf-8?B?TG4ydWdNc1FVY0hPQVYycEJYVzJNZzk2QWNnYUsyS0psVmN2cTluS0d6eDQv?=
 =?utf-8?B?SW1HYzFVUDkrT093cTc2d0VXUXRsZTNXc0liTnVrcVIvLzF0TzdwQ2RZZFNO?=
 =?utf-8?B?Y0ZYSmFZcVNnRU5wMTE3M2s3SmJaeUUrSGszK3JtQW9GSzRxSW5WT1doaGtq?=
 =?utf-8?B?NE9jd0RIeHB0a212OFdmeDhpWDRlZGdmUG9SMUJwNDZKMzU4N1M3WTNKVnlP?=
 =?utf-8?B?U1NZZGRDaE5kbzA3WWdtbVhiTDVFQ1N5SVdKSFNXU1FFckUxWDJxT29yalNC?=
 =?utf-8?B?Y3F1amxVbjQzNnVLSEwzeWNsZzBnbmx3QnJ5c1lSdVhuUE5nazc0REFkbWkz?=
 =?utf-8?B?cnhXMmk2c1F4Q21yTEROR3lHZjR3ZGZNeXU3T0E4SVF1U1dITTd1MlJWQkNr?=
 =?utf-8?B?WW5pVW40aWpjRDNaYTZ5R0dOYzczTktSc2tNb25CanppN2M0Rzc0eW1VUzhG?=
 =?utf-8?B?blJkNFlTVG9YaS9vVDVzQW02ZWhTa2tjVjBVZjNnNzFWUXhDcE1kOWRtNXRY?=
 =?utf-8?B?Vy9NYjJOQ3gvd280YnQzWHJhZDZmajVSUUErSDFzZHIwNTlWZ2dGWG56TW81?=
 =?utf-8?B?UCtkbGJYR0NROG9xUkttQk5GcWN5eGt2OTluSU8zaG1QL05hcnZZQnVpb0Vr?=
 =?utf-8?B?UGVLNkt3SWZ6d1ZFcjlqSE1INE12cHY3cnE4aDJkQk9XZDBSQjVhdi9BUWpv?=
 =?utf-8?B?R1dzcm5VdG1sQ0Jxa2Z4NzRIYnlkVVVZejN5Y1ZOUWoza09HYllEdUhpVjJo?=
 =?utf-8?B?TlV5SEUwUzFYT1Q4T1pxejZkOWdNWGZJOTkxTThSR1FDQlBhMFBPY2tURFR5?=
 =?utf-8?B?aGJMbVE4Vzdaa0tGRUZrenI3cUhzOVE5a1dFakNaSXZsd1hPcDlFcXlUU1BB?=
 =?utf-8?B?cW9vRWtvT1BBbkIxaHErUWgrY2Rhcjc1cExtMGZUQ1lrT2xpbW56RCswanVt?=
 =?utf-8?B?WHRMYXVqajMvTXY0Tm9ZSVlkNm1Fa0Z2UHptdFN5WVhjVzZVMGVkekU1ZDRL?=
 =?utf-8?B?OTE1cHFKTHVidFlsQ1loRVB1QkpnL3FHbHdIQWNlOWdPamNkRFo2TjJsYWxT?=
 =?utf-8?B?WWRSdlBGd2t2S2FkUVAvamhxWEJlKyt3akh5SmZNZExZWVU1RUN6U1NIcW1k?=
 =?utf-8?B?S3p3QTNvaENKbHdmUkY4TEZ1TnExd0hGdElEU0R2YzlMTGdKaU03YjJMNVAw?=
 =?utf-8?B?d2hkcThtSXVJUU5MM2cyRGNJWkRzRmlORTJsK2VJb2JSdzlSWHBlQS95eG5I?=
 =?utf-8?B?NHRTanZvQ0diS09RbUZMYzRVdWREV052K3JUK1hoWjBwUUZZQmtGRTl0dGpw?=
 =?utf-8?B?SndvNTgxeEFramVvTlZqcGZZZXdZU0RmOFVvaEZ3dTZqUFlYTThKVXFKTldJ?=
 =?utf-8?B?RDNTUTU3UkIrMUVvNUFiTVRXb1R3TGhhcVBvamxhVjBtbGxiZGEwUGhRaTFQ?=
 =?utf-8?B?STZGcVZ0eVl3WWN4dHd2cWI1UGlFUVM0L0xQQWZIeHJDZDZ4Qmc3YlEwNnUw?=
 =?utf-8?B?TmJpOUhzVnl3NjNzUzlOY2dtYlYvTmhnb28weHRnOEV6bktuRk9xcTIrOVBk?=
 =?utf-8?B?a29qc0c4cWtkVVJjM0hPVlRmdkZqYnFHd1FOWmp0NkpoZEovYStaelUwSTc2?=
 =?utf-8?B?K2JKZ1lBVU9YbmNJcGJIemZQcGhaQjZOTDVyZVZvaDNCTVlxeHNyVFNhSDgw?=
 =?utf-8?B?am0wK1JRMTk1REJscm9mNS8zU3BrRldiQ3FTREtxcFZGRkxRT3Jhd1NJK05m?=
 =?utf-8?B?NkhaYlJJUlBzbW4wbU5kRHZqOWpZL1dLR3kxdmt1NkN0UFNHKytOaktmSkJO?=
 =?utf-8?Q?XO2E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8249edaa-7eaf-42b9-7f5b-08dbdea8d4e5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 09:14:51.3207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpZkY6pC+7Jf6OtIT7p7eLCqVNsRm7wDkf9be1CFOjkDEI7FO3gKpJhegnVm529K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4936
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
 faith@gfxstrand.net, boris.brezillon@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.11.23 um 16:34 schrieb Danilo Krummrich:
[SNIP]
>>
>> Especially we most likely don't want the VM to live longer than the 
>> application which originally used it. If you make the GPUVM an 
>> independent object you actually open up driver abuse for the lifetime 
>> of this.
>
> Right, we don't want that. But I don't see how the reference count 
> prevents that.

It doesn't prevents that, it's just not the most defensive approach.

>
> Independant object is relative. struct drm_gpuvm is still embedded 
> into a driver
> specific structure. It's working the same way as with struct 
> drm_gem_obejct.
>
>>
>> Additional to that see below for a quite real problem with this.
>>
>>>> Background is that the most common use case I see is that this 
>>>> object is
>>>> embedded into something else and a reference count is then not 
>>>> really a good
>>>> idea.
>>> Do you have a specific use-case in mind where this would interfere?
>>
>> Yes, absolutely. For an example see amdgpu_mes_self_test(), here we 
>> initialize a temporary amdgpu VM for an in kernel unit test which 
>> runs during driver load.
>>
>> When the function returns I need to guarantee that the VM is 
>> destroyed or otherwise I will mess up normal operation.
>
> Nothing prevents that. The reference counting is well defined. If the 
> driver did not
> take additional references (which is clearly up to the driver taking 
> care of) and all
> VM_BOs and mappings are cleaned up, the reference count is guaranteed 
> to be 1 at this
> point.
>
> Also note that if the driver would have not cleaned up all VM_BOs and 
> mappings before
> shutting down the VM, it would have been a bug anyways and the driver 
> would potentially
> leak memory and UAF issues.

Exactly that's what I'm talking about why I think this is an extremely 
bad idea.

It's a perfect normal operation to shutdown the VM while there are still 
mappings. This is just what happens when you kill an application.

Because of this the mapping should *never* have a reference to the VM, 
but rather the VM destroys all mapping when it is destroyed itself.

> Hence, If the VM is still alive at a point where you don't expect it 
> to be, then it's
> simply a driver bug.

Driver bugs is just what I try to prevent here. When individual mappings 
keep the VM structure alive then drivers are responsible to clean them 
up, if the VM cleans up after itself then we don't need to worry about 
it in the driver.

When the mapping is destroyed with the VM drivers can't mess this common 
operation up. That's why this is more defensive.

What is a possible requirement is that external code needs to keep 
references to the VM, but *never* the VM to itself through the mappings. 
I would consider that a major bug in the component.

Regards,
Christian.

>
>>
>> Reference counting is nice when you don't know who else is referring 
>> to your VM, but the cost is that you also don't know when the object 
>> will guardedly be destroyed.
>>
>> I can trivially work around this by saying that the generic GPUVM 
>> object has a different lifetime than the amdgpu specific object, but 
>> that opens up doors for use after free again.
>
> If your driver never touches the VM's reference count and exits the VM 
> with a clean state
> (no mappings and no VM_BOs left), effectively, this is the same as 
> having no reference
> count.
>
> In the very worst case you could argue that we trade a potential UAF 
> *and* memroy leak
> (no reference count) with *only* a memory leak (with reference count), 
> which to me seems
> reasonable.
>
>>
>> Regards,
>> Christian.
>>
>>>> Thanks,
>>>> Christian.
>>> [1]https://lore.kernel.org/dri-devel/6fa058a4-20d3-44b9-af58-755cfb375d75@redhat.com/ 
>>>
>>>
>>>>> Signed-off-by: Danilo Krummrich<dakr@redhat.com>
>>>>> ---
>>>>>    drivers/gpu/drm/drm_gpuvm.c            | 44 
>>>>> +++++++++++++++++++-------
>>>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
>>>>>    include/drm/drm_gpuvm.h                | 31 +++++++++++++++++-
>>>>>    3 files changed, 78 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c 
>>>>> b/drivers/gpu/drm/drm_gpuvm.c
>>>>> index 53e2c406fb04..6a88eafc5229 100644
>>>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>>>> @@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const 
>>>>> char *name,
>>>>>        gpuvm->rb.tree = RB_ROOT_CACHED;
>>>>>        INIT_LIST_HEAD(&gpuvm->rb.list);
>>>>> +    kref_init(&gpuvm->kref);
>>>>> +
>>>>>        gpuvm->name = name ? name : "unknown";
>>>>>        gpuvm->flags = flags;
>>>>>        gpuvm->ops = ops;
>>>>> @@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const 
>>>>> char *name,
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>>>>> -/**
>>>>> - * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
>>>>> - * @gpuvm: pointer to the &drm_gpuvm to clean up
>>>>> - *
>>>>> - * Note that it is a bug to call this function on a manager that 
>>>>> still
>>>>> - * holds GPU VA mappings.
>>>>> - */
>>>>> -void
>>>>> -drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>>> +static void
>>>>> +drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
>>>>>    {
>>>>>        gpuvm->name = NULL;
>>>>> @@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>>>        drm_gem_object_put(gpuvm->r_obj);
>>>>>    }
>>>>> -EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>>>> +
>>>>> +static void
>>>>> +drm_gpuvm_free(struct kref *kref)
>>>>> +{
>>>>> +    struct drm_gpuvm *gpuvm = container_of(kref, struct 
>>>>> drm_gpuvm, kref);
>>>>> +
>>>>> +    if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
>>>>> +        return;
>>>>> +
>>>>> +    drm_gpuvm_fini(gpuvm);
>>>>> +
>>>>> +    gpuvm->ops->vm_free(gpuvm);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
>>>>> + * @gpuvm: the &drm_gpuvm to release the reference of
>>>>> + *
>>>>> + * This releases a reference to @gpuvm.
>>>>> + */
>>>>> +void
>>>>> +drm_gpuvm_put(struct drm_gpuvm *gpuvm)
>>>>> +{
>>>>> +    if (gpuvm)
>>>>> +        kref_put(&gpuvm->kref, drm_gpuvm_free);
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_put);
>>>>>    static int
>>>>>    __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>>>> @@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>>>>        if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
>>>>>            return -EINVAL;
>>>>> -    return __drm_gpuva_insert(gpuvm, va);
>>>>> +    return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(drm_gpuva_insert);
>>>>> @@ -876,6 +897,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
>>>>>        }
>>>>>        __drm_gpuva_remove(va);
>>>>> +    drm_gpuvm_put(va->vm);
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(drm_gpuva_remove);
>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c 
>>>>> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>> index 54be12c1272f..cb2f06565c46 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>> @@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo 
>>>>> *nvbo)
>>>>>        }
>>>>>    }
>>>>> +static void
>>>>> +nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
>>>>> +{
>>>>> +    struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
>>>>> +
>>>>> +    kfree(uvmm);
>>>>> +}
>>>>> +
>>>>> +static const struct drm_gpuvm_ops gpuvm_ops = {
>>>>> +    .vm_free = nouveau_uvmm_free,
>>>>> +};
>>>>> +
>>>>>    int
>>>>>    nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>>>>>                   void *data,
>>>>> @@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device 
>>>>> *dev,
>>>>>                   NOUVEAU_VA_SPACE_END,
>>>>>                   init->kernel_managed_addr,
>>>>>                   init->kernel_managed_size,
>>>>> -               NULL);
>>>>> +               &gpuvm_ops);
>>>>>        /* GPUVM takes care from here on. */
>>>>>        drm_gem_object_put(r_obj);
>>>>> @@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device 
>>>>> *dev,
>>>>>        return 0;
>>>>>    out_gpuvm_fini:
>>>>> -    drm_gpuvm_destroy(&uvmm->base);
>>>>> -    kfree(uvmm);
>>>>> +    drm_gpuvm_put(&uvmm->base);
>>>>>    out_unlock:
>>>>>        mutex_unlock(&cli->mutex);
>>>>>        return ret;
>>>>> @@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
>>>>>        mutex_lock(&cli->mutex);
>>>>>        nouveau_vmm_fini(&uvmm->vmm);
>>>>> -    drm_gpuvm_destroy(&uvmm->base);
>>>>> -    kfree(uvmm);
>>>>> +    drm_gpuvm_put(&uvmm->base);
>>>>>        mutex_unlock(&cli->mutex);
>>>>>    }
>>>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>>>>> index 0c2e24155a93..4e6e1fd3485a 100644
>>>>> --- a/include/drm/drm_gpuvm.h
>>>>> +++ b/include/drm/drm_gpuvm.h
>>>>> @@ -247,6 +247,11 @@ struct drm_gpuvm {
>>>>>            struct list_head list;
>>>>>        } rb;
>>>>> +    /**
>>>>> +     * @kref: reference count of this object
>>>>> +     */
>>>>> +    struct kref kref;
>>>>> +
>>>>>        /**
>>>>>         * @kernel_alloc_node:
>>>>>         *
>>>>> @@ -273,7 +278,23 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, 
>>>>> const char *name,
>>>>>                u64 start_offset, u64 range,
>>>>>                u64 reserve_offset, u64 reserve_range,
>>>>>                const struct drm_gpuvm_ops *ops);
>>>>> -void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
>>>>> +
>>>>> +/**
>>>>> + * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
>>>>> + * @gpuvm: the &drm_gpuvm to acquire the reference of
>>>>> + *
>>>>> + * This function acquires an additional reference to @gpuvm. It 
>>>>> is illegal to
>>>>> + * call this without already holding a reference. No locks required.
>>>>> + */
>>>>> +static inline struct drm_gpuvm *
>>>>> +drm_gpuvm_get(struct drm_gpuvm *gpuvm)
>>>>> +{
>>>>> +    kref_get(&gpuvm->kref);
>>>>> +
>>>>> +    return gpuvm;
>>>>> +}
>>>>> +
>>>>> +void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
>>>>>    bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, 
>>>>> u64 range);
>>>>>    bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 
>>>>> addr, u64 range);
>>>>> @@ -673,6 +694,14 @@ static inline void 
>>>>> drm_gpuva_init_from_op(struct drm_gpuva *va,
>>>>>     * operations to drivers.
>>>>>     */
>>>>>    struct drm_gpuvm_ops {
>>>>> +    /**
>>>>> +     * @vm_free: called when the last reference of a struct 
>>>>> drm_gpuvm is
>>>>> +     * dropped
>>>>> +     *
>>>>> +     * This callback is mandatory.
>>>>> +     */
>>>>> +    void (*vm_free)(struct drm_gpuvm *gpuvm);
>>>>> +
>>>>>        /**
>>>>>         * @op_alloc: called when the &drm_gpuvm allocates
>>>>>         * a struct drm_gpuva_op
>>
>

