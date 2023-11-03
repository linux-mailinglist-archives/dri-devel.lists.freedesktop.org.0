Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5447B7E0456
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 15:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA3410E9F6;
	Fri,  3 Nov 2023 14:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E5310E9F5;
 Fri,  3 Nov 2023 14:04:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOV0+0eRDrIzCAbK68lxUEi+D25qG8NjAS0O4zIHLQ5JQdrrhilAsNo8g0U5kSnsfR3L25+VXx+EHKMBFoPr9Z8tXhMHNorGnEsahFqlgQ0b8HL3s2Io6Pa0Ut3cKnmZnf1cCl18a9e96oOgCm8bzn7y4FqA7Wxu8iquTXakFgV8Bxuup4NKCK/3Kbgk2OBHycSMBfBYQFAD4FGS/jTdZlsySPMOyiQGzUn4V0S9N2h1/v2XgPez5pqGP4F9ajA00D5GKP/8j+0b5+ryyp83ReS2Ku3huzDkYgFxgLO6S+oOziKTOAA9lsM97YNmNtOX9nmPBGJ8doLwFCr49XVMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rji8krO+55met/ds/YAVhvBG4uOao2Dp8x6jo15Hbwo=;
 b=YxUM9SfOibBL5mLhiwHph83ysnjBGR+bqqVRjdgs8/lscp/c2PsLPfj4FOUCpbXX6hVI7j2ZE/xNnE/U2SznigznYg57RkOOLyX6mlNwBLLukTv9GedZJJ6x4oo4W0CHOXz/CWGAuKm7HTMQlheOgAXAsl1Q8P0MOrzn/KBUH9BbSo9j9aFDQXNvvxM8CTBNmSHvln4R4nXAJFnafFGzhgyc6ebFiRvGQK3KUwwRUG7dtMhutBL/6DJHF++CgdicwoRbpSkekRPwp9ABXG0AxP6E2cLLAXboVccrC7eAtnomyywpeyhL1J81FmOLvcMC+hwEpbJczmF4370+E+ZVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rji8krO+55met/ds/YAVhvBG4uOao2Dp8x6jo15Hbwo=;
 b=i7xEjuVKnxdDwbjMCKYikGF658c3H9xODEGz+7bW3FNTZczvyIU2gI5WAvuxBGNJOcfHu3ZVW4zXhh+qWTj8ul9GJJHjLZf+4jqE1GALiPHsWbRjanQwFaSBdeNM33vi79p0xuDwlC1+mEvKlUnnu6JrUnGK0id5Ug0DelM17co=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6003.namprd12.prod.outlook.com (2603:10b6:208:37f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 14:04:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 14:04:53 +0000
Content-Type: multipart/alternative;
 boundary="------------1BSR1DmzzU74zajL8YoutQZT"
Message-ID: <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
Date: Fri, 3 Nov 2023 15:04:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com> <ZUTyGTxcH7WlHKsv@pollux>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZUTyGTxcH7WlHKsv@pollux>
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6f4581-5bee-4014-03e3-08dbdc75da0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ueK/zAJYywLJ+aPmSxMgo4tidmbxTlG8i9f1sNCNCofqGeXnxoeHLUnSepxz3T55VVrcXpaAivR7MRlQ+7Qd247CGQjSCVuSliQlwPgB7nadwjRWkgcz3c3+XwxhPx3tkwr1I6klS0qPSP/UeiZTjIpA0pg4m3jAOV5WeIxX9fcieDmQi06On3AnpQPbENNi/NRK7TP/dHMbNI3y14+Yycx8Xhd+N/qHcscPPWqtxW+zlBj6nUgNwrzAq80A13pqkuPdCBugJwAj0WzevgtYlFil5+gqS5qNY4sBVegrSBBV+EQq1L/7lJDix2t/HpBzyzSddZsqzo7hU2f7mhmn+NjCIjRrfxWIQuF8IXWCQXVg+NdvQM7qDxT3z+M3ZHKgzqGn1WAe+oP+tfCPcPNPqHEYsrVFHVbgWWYPqrYOGh6dfD3GN/CTBHjj25nFosv3g7/4zR8NhDGuR2ZP6cd/JplfXAwBkkF8hxaXJMeV9WQJ4BixcFpcx44RTOVpeCRSmvOLHfWAhWofT3vyN/IToRx4RlhakQ7z1RYphzQ9oMxEuBRAeDeg2sVfO877Z6SMQv/0ojOU9P5eYCmdEqLnpYt9f9IkmMa+oeCtTUU5kc1W/htecgzpHJu0lHKXimM/agt1SUOZHKZt5sQPjh/ciQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(396003)(39860400002)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(2616005)(6512007)(26005)(6666004)(6506007)(33964004)(478600001)(66574015)(83380400001)(7416002)(5660300002)(30864003)(2906002)(41300700001)(6486002)(966005)(66946007)(4326008)(8676002)(8936002)(66556008)(66476007)(6916009)(316002)(166002)(31696002)(38100700002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWFHVkY4TkN2OW05RWw4dUo4MjNLQXhEdzIxTUxmdTNaMlpaQzVGOU9zR2pR?=
 =?utf-8?B?dWxFOFdUNEtqNWJ4M3p0TloxL3VHeU9aTEkzK0UyaE1nYTBpaGllSFcrbFpl?=
 =?utf-8?B?TkhROGg4MVdhNTdUUXp6MTVFTE5hUDljR1U3TFljdGtwcTQxUEJTbklBWlJD?=
 =?utf-8?B?L29zWmp1eE1rd0dpTFZKZ1RxeFZEVFNZN1YvSTErYnNYT3pKWmdyc2ltYzQr?=
 =?utf-8?B?by9vdElSaWVXUFV6SjdGd2F2NzNNc20zeU10clUvOVkwWlVyM3JXRml6Lzll?=
 =?utf-8?B?N0JaUTdSQ3RtUTM0Mk5tS0ZnQzZCVjNPMXBnOFV2dUhHUnYwR3VvQm1kWlZk?=
 =?utf-8?B?bjNmemVEOUF6cm5kV0FGeERiemU4MWVaUXA0T1U5N1BoT3lEUXhwZVBhWFRh?=
 =?utf-8?B?WjBDeXZkZmR3RzA5aWFuSXQzNlRMVzVDcXZoS21lUUZ2MmZhcWdsTUQ3NUUr?=
 =?utf-8?B?eHprUmdDakloQzhpcm51OFNhY0R5QmNVa0p6aXEydkk0OURjUE1IbnVyTnUx?=
 =?utf-8?B?T0NlaUZpSXVjRXVhYkJVbkNsdVdTY3d5YThtcEEvVXNVODhvRjVraml0ZHNQ?=
 =?utf-8?B?OVkvUHl5VnJWcXFuK0ozZkpzd1QzMDlwd0k3Wm5DcENMRHF4a3l2Zkc1eFQr?=
 =?utf-8?B?dEFhLy9Ub21uUkpQbVE4Mkhob1VrOTBTQ1dvdU9naGhuN0dYQUlMam1DNEE2?=
 =?utf-8?B?VEZFbHJRT1lDbjRXK2NkK3lrOWRPdVd0OHdjZ0RZdlhncHZEV1pGRDVqcjJz?=
 =?utf-8?B?b1dCTktJVkZ4dG9GeWlvanAwOWxvL2I3b1QxTU9lb29QMHk3WUhjdXM3aXE0?=
 =?utf-8?B?bGl4WmhBUlU2bnBDY3oxTiswaVJsdk5sMDl0Y1lqZzlsc1M0QTA2eDBMMEhB?=
 =?utf-8?B?dFVGWlB5TmF4U0ZEb3hZV0RERUdlbnJDUzAwZERvdUQ1emdzdGFpWXZOV01n?=
 =?utf-8?B?SlVwYTJaNS9hTUFyUTUwbGZEZ1AvaU1SV216TTV5ai96clBVRjM2RHZVOUxu?=
 =?utf-8?B?dm1Hb0huRXVsUVpLNnpQeG1jZjN3NGNLWVVsUHdSRStPVlBkSGsrNy9IUllp?=
 =?utf-8?B?Ty9ZOEh1VGtJQ0N0cW00TThpWTJ3RWNIYmNpSDJUZ01oY2UrV2E2enA0bUtz?=
 =?utf-8?B?TEVSeEhuN1FiSlE3T2VCbHEzaFZFQ3ZIcGVTWHNpd2NYUGpYK1JuYUJCejhW?=
 =?utf-8?B?WDN2SUdXbkxTNllhMXBPWlRnWnZJTFdHOCtzS2R0bnVLMjh0cC9ITHJHem4y?=
 =?utf-8?B?NWlJNzBCK2I1NEh5cVJ1L1hIaW9ZSkRhditpNFRtamhPeHZtMjRUSFdsQjZM?=
 =?utf-8?B?dCtnRjRHbm5oYmxpL3JOb0FmWGpxVzRocGxUTS9TUml3SEkzWUh2d29obVdj?=
 =?utf-8?B?TlgrNlp4cjlqMGV0TWZTRkFrL0tSeVIrKzdvZGRUTUU1eitmZnpiOUtjbHB4?=
 =?utf-8?B?UWR4UjBIRnRWS1N6YlI1WVpmMm9oZzIxbWx3VFdBZEpEckVTZmlZRkJrN1lV?=
 =?utf-8?B?TXBmRUw1NGZ3RUZIcGpWbmRXUmlSM3J0VHliSmFOUnFwRkl3YUlPVWt2MXZY?=
 =?utf-8?B?dGZMYXRzYldPMjFHZm5sNHdyWkxFWmVKMWZINTlhSUUxa2cwNUJtd3RsUk41?=
 =?utf-8?B?eTdmUC9yVld0QzlQQ1QvVzA5dzAzSFpMdmVuS3Z6TFhEV1p0dDU4V0EyYnV5?=
 =?utf-8?B?SXprbjlWQ0lyam1kUGR0WTFzUkl1TGhrWmNZN2hZMEE0dStSQkRPTnJBd2dV?=
 =?utf-8?B?d1FxK2ZkSXVMT1daMXVZclg4b0lkcjVFTk5MM29vRUJmeGFkNWhTaGpGQldP?=
 =?utf-8?B?cnpkY2JDSWx2b3BPVmNNSjlNMS9PL1BsczZiNTFLeUFTRDVDVDgwdkVPZTF3?=
 =?utf-8?B?TGFtZ0VNRGUvSVRPTDVuL3IyekgzZy9Sbnhtbmh1ZHJWS0hBdk5kSmhFRmFB?=
 =?utf-8?B?YzlTOENCczNkTDRFdlEvbDFHaXVNam1BOWVhTE9tb2x6UitpMmp5ZTRoS1V3?=
 =?utf-8?B?QjZPbEM3SDArUnpnQTNPOFZjbm13ME15ckJCWE5XNnhoWGhqaFlRT1gyUHNP?=
 =?utf-8?B?MGR0N2tUV1Q5aVVBdzZSTVJaY3NERk95dzhScThOWEJBKzdFWVo4ZmU2NmFR?=
 =?utf-8?Q?LwNE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6f4581-5bee-4014-03e3-08dbdc75da0b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 14:04:53.1784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DI+1h2pOKQ5HBWVG6YNb2WxLYT3WsvvpfVpyNUO+CGyyKGwgff3PNfy3BCvGdxoM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6003
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

--------------1BSR1DmzzU74zajL8YoutQZT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 03.11.23 um 14:14 schrieb Danilo Krummrich:
> On Fri, Nov 03, 2023 at 08:18:35AM +0100, Christian König wrote:
>> Am 02.11.23 um 00:31 schrieb Danilo Krummrich:
>>> Implement reference counting for struct drm_gpuvm.
>>  From the design point of view what is that good for?
> It was discussed in this thread [1].
>
> Essentially, the idea is to make sure that vm_bo->vm is always valid without the
> driver having the need to take extra care. It also ensures that GPUVM can't be
> freed with mappings still held.

Well in this case I have some objections to this. The lifetime of the VM 
is driver and use case specific.

Especially we most likely don't want the VM to live longer than the 
application which originally used it. If you make the GPUVM an 
independent object you actually open up driver abuse for the lifetime of 
this.

Additional to that see below for a quite real problem with this.

>> Background is that the most common use case I see is that this object is
>> embedded into something else and a reference count is then not really a good
>> idea.
> Do you have a specific use-case in mind where this would interfere?

Yes, absolutely. For an example see amdgpu_mes_self_test(), here we 
initialize a temporary amdgpu VM for an in kernel unit test which runs 
during driver load.

When the function returns I need to guarantee that the VM is destroyed 
or otherwise I will mess up normal operation.

Reference counting is nice when you don't know who else is referring to 
your VM, but the cost is that you also don't know when the object will 
guardedly be destroyed.

I can trivially work around this by saying that the generic GPUVM object 
has a different lifetime than the amdgpu specific object, but that opens 
up doors for use after free again.

Regards,
Christian.

>
>> Thanks,
>> Christian.
> [1]https://lore.kernel.org/dri-devel/6fa058a4-20d3-44b9-af58-755cfb375d75@redhat.com/
>
>>> Signed-off-by: Danilo Krummrich<dakr@redhat.com>
>>> ---
>>>    drivers/gpu/drm/drm_gpuvm.c            | 44 +++++++++++++++++++-------
>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
>>>    include/drm/drm_gpuvm.h                | 31 +++++++++++++++++-
>>>    3 files changed, 78 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>>> index 53e2c406fb04..6a88eafc5229 100644
>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>> @@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>>>    	gpuvm->rb.tree = RB_ROOT_CACHED;
>>>    	INIT_LIST_HEAD(&gpuvm->rb.list);
>>> +	kref_init(&gpuvm->kref);
>>> +
>>>    	gpuvm->name = name ? name : "unknown";
>>>    	gpuvm->flags = flags;
>>>    	gpuvm->ops = ops;
>>> @@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>>>    }
>>>    EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>>> -/**
>>> - * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
>>> - * @gpuvm: pointer to the &drm_gpuvm to clean up
>>> - *
>>> - * Note that it is a bug to call this function on a manager that still
>>> - * holds GPU VA mappings.
>>> - */
>>> -void
>>> -drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>> +static void
>>> +drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
>>>    {
>>>    	gpuvm->name = NULL;
>>> @@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>    	drm_gem_object_put(gpuvm->r_obj);
>>>    }
>>> -EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>> +
>>> +static void
>>> +drm_gpuvm_free(struct kref *kref)
>>> +{
>>> +	struct drm_gpuvm *gpuvm = container_of(kref, struct drm_gpuvm, kref);
>>> +
>>> +	if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
>>> +		return;
>>> +
>>> +	drm_gpuvm_fini(gpuvm);
>>> +
>>> +	gpuvm->ops->vm_free(gpuvm);
>>> +}
>>> +
>>> +/**
>>> + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
>>> + * @gpuvm: the &drm_gpuvm to release the reference of
>>> + *
>>> + * This releases a reference to @gpuvm.
>>> + */
>>> +void
>>> +drm_gpuvm_put(struct drm_gpuvm *gpuvm)
>>> +{
>>> +	if (gpuvm)
>>> +		kref_put(&gpuvm->kref, drm_gpuvm_free);
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_put);
>>>    static int
>>>    __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>> @@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>>    	if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
>>>    		return -EINVAL;
>>> -	return __drm_gpuva_insert(gpuvm, va);
>>> +	return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
>>>    }
>>>    EXPORT_SYMBOL_GPL(drm_gpuva_insert);
>>> @@ -876,6 +897,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
>>>    	}
>>>    	__drm_gpuva_remove(va);
>>> +	drm_gpuvm_put(va->vm);
>>>    }
>>>    EXPORT_SYMBOL_GPL(drm_gpuva_remove);
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> index 54be12c1272f..cb2f06565c46 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> @@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
>>>    	}
>>>    }
>>> +static void
>>> +nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
>>> +{
>>> +	struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
>>> +
>>> +	kfree(uvmm);
>>> +}
>>> +
>>> +static const struct drm_gpuvm_ops gpuvm_ops = {
>>> +	.vm_free = nouveau_uvmm_free,
>>> +};
>>> +
>>>    int
>>>    nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>>>    			   void *data,
>>> @@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>>>    		       NOUVEAU_VA_SPACE_END,
>>>    		       init->kernel_managed_addr,
>>>    		       init->kernel_managed_size,
>>> -		       NULL);
>>> +		       &gpuvm_ops);
>>>    	/* GPUVM takes care from here on. */
>>>    	drm_gem_object_put(r_obj);
>>> @@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>>>    	return 0;
>>>    out_gpuvm_fini:
>>> -	drm_gpuvm_destroy(&uvmm->base);
>>> -	kfree(uvmm);
>>> +	drm_gpuvm_put(&uvmm->base);
>>>    out_unlock:
>>>    	mutex_unlock(&cli->mutex);
>>>    	return ret;
>>> @@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
>>>    	mutex_lock(&cli->mutex);
>>>    	nouveau_vmm_fini(&uvmm->vmm);
>>> -	drm_gpuvm_destroy(&uvmm->base);
>>> -	kfree(uvmm);
>>> +	drm_gpuvm_put(&uvmm->base);
>>>    	mutex_unlock(&cli->mutex);
>>>    }
>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>>> index 0c2e24155a93..4e6e1fd3485a 100644
>>> --- a/include/drm/drm_gpuvm.h
>>> +++ b/include/drm/drm_gpuvm.h
>>> @@ -247,6 +247,11 @@ struct drm_gpuvm {
>>>    		struct list_head list;
>>>    	} rb;
>>> +	/**
>>> +	 * @kref: reference count of this object
>>> +	 */
>>> +	struct kref kref;
>>> +
>>>    	/**
>>>    	 * @kernel_alloc_node:
>>>    	 *
>>> @@ -273,7 +278,23 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>>>    		    u64 start_offset, u64 range,
>>>    		    u64 reserve_offset, u64 reserve_range,
>>>    		    const struct drm_gpuvm_ops *ops);
>>> -void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
>>> +
>>> +/**
>>> + * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
>>> + * @gpuvm: the &drm_gpuvm to acquire the reference of
>>> + *
>>> + * This function acquires an additional reference to @gpuvm. It is illegal to
>>> + * call this without already holding a reference. No locks required.
>>> + */
>>> +static inline struct drm_gpuvm *
>>> +drm_gpuvm_get(struct drm_gpuvm *gpuvm)
>>> +{
>>> +	kref_get(&gpuvm->kref);
>>> +
>>> +	return gpuvm;
>>> +}
>>> +
>>> +void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
>>>    bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
>>>    bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
>>> @@ -673,6 +694,14 @@ static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
>>>     * operations to drivers.
>>>     */
>>>    struct drm_gpuvm_ops {
>>> +	/**
>>> +	 * @vm_free: called when the last reference of a struct drm_gpuvm is
>>> +	 * dropped
>>> +	 *
>>> +	 * This callback is mandatory.
>>> +	 */
>>> +	void (*vm_free)(struct drm_gpuvm *gpuvm);
>>> +
>>>    	/**
>>>    	 * @op_alloc: called when the &drm_gpuvm allocates
>>>    	 * a struct drm_gpuva_op

--------------1BSR1DmzzU74zajL8YoutQZT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 03.11.23 um 14:14 schrieb Danilo Krummrich:<br>
    <blockquote type="cite" cite="mid:ZUTyGTxcH7WlHKsv@pollux">
      <pre class="moz-quote-pre" wrap="">On Fri, Nov 03, 2023 at 08:18:35AM +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 02.11.23 um 00:31 schrieb Danilo Krummrich:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Implement reference counting for struct drm_gpuvm.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
From the design point of view what is that good for?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It was discussed in this thread [1].

Essentially, the idea is to make sure that vm_bo-&gt;vm is always valid without the
driver having the need to take extra care. It also ensures that GPUVM can't be
freed with mappings still held.</pre>
    </blockquote>
    <br>
    Well in this case I have some objections to this. The lifetime of
    the VM is driver and use case specific.<br>
    <br>
    Especially we most likely don't want the VM to live longer than the
    application which originally used it. If you make the GPUVM an
    independent object you actually open up driver abuse for the
    lifetime of this.<br>
    <br>
    Additional to that see below for a quite real problem with this.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZUTyGTxcH7WlHKsv@pollux">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Background is that the most common use case I see is that this object is
embedded into something else and a reference count is then not really a good
idea.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Do you have a specific use-case in mind where this would interfere?</pre>
    </blockquote>
    <br>
    Yes, absolutely. For an example see amdgpu_mes_self_test(), here we
    initialize a temporary amdgpu VM for an in kernel unit test which
    runs during driver load.<br>
    <br>
    When the function returns I need to guarantee that the VM is
    destroyed or otherwise I will mess up normal operation.<br>
    <br>
    Reference counting is nice when you don't know who else is referring
    to your VM, but the cost is that you also don't know when the object
    will guardedly be destroyed.<br>
    <br>
    I can trivially work around this by saying that the generic GPUVM
    object has a different lifetime than the amdgpu specific object, but
    that opens up doors for use after free again.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZUTyGTxcH7WlHKsv@pollux">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Thanks,
Christian.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[1] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/6fa058a4-20d3-44b9-af58-755cfb375d75@redhat.com/">https://lore.kernel.org/dri-devel/6fa058a4-20d3-44b9-af58-755cfb375d75@redhat.com/</a>

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Signed-off-by: Danilo Krummrich <a class="moz-txt-link-rfc2396E" href="mailto:dakr@redhat.com">&lt;dakr@redhat.com&gt;</a>
---
  drivers/gpu/drm/drm_gpuvm.c            | 44 +++++++++++++++++++-------
  drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
  include/drm/drm_gpuvm.h                | 31 +++++++++++++++++-
  3 files changed, 78 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 53e2c406fb04..6a88eafc5229 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
  	gpuvm-&gt;rb.tree = RB_ROOT_CACHED;
  	INIT_LIST_HEAD(&amp;gpuvm-&gt;rb.list);
+	kref_init(&amp;gpuvm-&gt;kref);
+
  	gpuvm-&gt;name = name ? name : &quot;unknown&quot;;
  	gpuvm-&gt;flags = flags;
  	gpuvm-&gt;ops = ops;
@@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
  }
  EXPORT_SYMBOL_GPL(drm_gpuvm_init);
-/**
- * drm_gpuvm_destroy() - cleanup a &amp;drm_gpuvm
- * @gpuvm: pointer to the &amp;drm_gpuvm to clean up
- *
- * Note that it is a bug to call this function on a manager that still
- * holds GPU VA mappings.
- */
-void
-drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
+static void
+drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
  {
  	gpuvm-&gt;name = NULL;
@@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
  	drm_gem_object_put(gpuvm-&gt;r_obj);
  }
-EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
+
+static void
+drm_gpuvm_free(struct kref *kref)
+{
+	struct drm_gpuvm *gpuvm = container_of(kref, struct drm_gpuvm, kref);
+
+	if (drm_WARN_ON(gpuvm-&gt;drm, !gpuvm-&gt;ops-&gt;vm_free))
+		return;
+
+	drm_gpuvm_fini(gpuvm);
+
+	gpuvm-&gt;ops-&gt;vm_free(gpuvm);
+}
+
+/**
+ * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
+ * @gpuvm: the &amp;drm_gpuvm to release the reference of
+ *
+ * This releases a reference to @gpuvm.
+ */
+void
+drm_gpuvm_put(struct drm_gpuvm *gpuvm)
+{
+	if (gpuvm)
+		kref_put(&amp;gpuvm-&gt;kref, drm_gpuvm_free);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_put);
  static int
  __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
@@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
  	if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
  		return -EINVAL;
-	return __drm_gpuva_insert(gpuvm, va);
+	return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
  }
  EXPORT_SYMBOL_GPL(drm_gpuva_insert);
@@ -876,6 +897,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
  	}
  	__drm_gpuva_remove(va);
+	drm_gpuvm_put(va-&gt;vm);
  }
  EXPORT_SYMBOL_GPL(drm_gpuva_remove);
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 54be12c1272f..cb2f06565c46 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
  	}
  }
+static void
+nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
+{
+	struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
+
+	kfree(uvmm);
+}
+
+static const struct drm_gpuvm_ops gpuvm_ops = {
+	.vm_free = nouveau_uvmm_free,
+};
+
  int
  nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
  			   void *data,
@@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
  		       NOUVEAU_VA_SPACE_END,
  		       init-&gt;kernel_managed_addr,
  		       init-&gt;kernel_managed_size,
-		       NULL);
+		       &amp;gpuvm_ops);
  	/* GPUVM takes care from here on. */
  	drm_gem_object_put(r_obj);
@@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
  	return 0;
  out_gpuvm_fini:
-	drm_gpuvm_destroy(&amp;uvmm-&gt;base);
-	kfree(uvmm);
+	drm_gpuvm_put(&amp;uvmm-&gt;base);
  out_unlock:
  	mutex_unlock(&amp;cli-&gt;mutex);
  	return ret;
@@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
  	mutex_lock(&amp;cli-&gt;mutex);
  	nouveau_vmm_fini(&amp;uvmm-&gt;vmm);
-	drm_gpuvm_destroy(&amp;uvmm-&gt;base);
-	kfree(uvmm);
+	drm_gpuvm_put(&amp;uvmm-&gt;base);
  	mutex_unlock(&amp;cli-&gt;mutex);
  }
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 0c2e24155a93..4e6e1fd3485a 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -247,6 +247,11 @@ struct drm_gpuvm {
  		struct list_head list;
  	} rb;
+	/**
+	 * @kref: reference count of this object
+	 */
+	struct kref kref;
+
  	/**
  	 * @kernel_alloc_node:
  	 *
@@ -273,7 +278,23 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
  		    u64 start_offset, u64 range,
  		    u64 reserve_offset, u64 reserve_range,
  		    const struct drm_gpuvm_ops *ops);
-void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
+
+/**
+ * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
+ * @gpuvm: the &amp;drm_gpuvm to acquire the reference of
+ *
+ * This function acquires an additional reference to @gpuvm. It is illegal to
+ * call this without already holding a reference. No locks required.
+ */
+static inline struct drm_gpuvm *
+drm_gpuvm_get(struct drm_gpuvm *gpuvm)
+{
+	kref_get(&amp;gpuvm-&gt;kref);
+
+	return gpuvm;
+}
+
+void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
  bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
  bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
@@ -673,6 +694,14 @@ static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
   * operations to drivers.
   */
  struct drm_gpuvm_ops {
+	/**
+	 * @vm_free: called when the last reference of a struct drm_gpuvm is
+	 * dropped
+	 *
+	 * This callback is mandatory.
+	 */
+	void (*vm_free)(struct drm_gpuvm *gpuvm);
+
  	/**
  	 * @op_alloc: called when the &amp;drm_gpuvm allocates
  	 * a struct drm_gpuva_op
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------1BSR1DmzzU74zajL8YoutQZT--
