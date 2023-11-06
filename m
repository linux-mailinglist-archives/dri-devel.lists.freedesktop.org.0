Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA97E22C5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C662910E30C;
	Mon,  6 Nov 2023 13:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D062210E30C;
 Mon,  6 Nov 2023 13:05:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbB9rV6xjes8OsQCmJkE8liHRTLRC6uM6UFp90Gqh4OC1pPXHCCXR61biCffjTkM9tf/W3D2UtcoolQQJJ80MBghhJw4qKoaCazUkC+Jj26ARUueKxWVxHhoA1VoUN79AL/wzBFm5zjq/OJaM86FWw3GeaERwc9o9VHgXeGfaN1/ZLTDE4yGU0MObfuQSCaojLz3AlRVQFUnAUs/3ObcEQ84Ikz/Ly+Mzi+trjOe2TCP47DLOrBlF3pKpwi6fC8kgm4x5wWzlK6NOXaOMdXOBc2EJ7jXq7Q51FU1r0MvXZIF8yd9RqoyPeIF0XepfOQpRKcyUcTV14kpTGRA6HK8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvNgOvqLeOUKKakIgRcF96D+gh7ePeu6Miv1qiuW43M=;
 b=FiSbMjqcSJekkHadrBBF0KM3v0mZRyAjI5z5MVq3NIhac7PiF/VDGobhez2zRmUeHXz3s9Q4Rlpp97Lth+CLRBZo47zCNSadf9A76VAOCB1F5HVOCtIgNdiKCyfZ3FkcYag1MHQ8fMCINb1kdRg9Oz17gzC9Su1wjnT8d+78dkBn5OI+p4EPRW+XMIoKtHMZLGX4CZUUl1+oxj8Y3bZT09yA068ph+rga7qdnKvapKb8aXsA1oF8ezL9+F+QVLg7oza7+86NaMzKJYL2Uat43jkfkuVUByy3xDw/aVpPZrxKdrg89JxcP8lXrkk2cUMWvofADN43JoLgSCt0JNgXWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvNgOvqLeOUKKakIgRcF96D+gh7ePeu6Miv1qiuW43M=;
 b=cKjbmx0mgI8M53KjklXVqPpfdIfqFkLDcfpMKSFkhse7sXH+4nw7asdVFTi+VrnpT6kEyZB6lrM+93ITbT1BAPDLCE1XGLBrbgKYc4qQPt3zwmZhG4k956jObFNnXdCgWxmWq5T4P0xCxgWCkritaTQPXYqTECQGsK8L0gJQbC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 13:05:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 13:05:20 +0000
Content-Type: multipart/alternative;
 boundary="------------tk0T70Ca0po5sGHgH0hC2TDV"
Message-ID: <8e87d962-c80c-40d9-94d7-58b6cd9dd794@amd.com>
Date: Mon, 6 Nov 2023 14:05:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com> <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
 <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
 <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com> <ZUjZFFtLM435tTxJ@pollux>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZUjZFFtLM435tTxJ@pollux>
X-ClientProxiedBy: FR4P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 113f1f16-32f0-43c1-1c40-08dbdec907c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nGtiO9GHIQdYmic3JEj6UnZXfsvOP8pWdyBPNWWH14HOnAYv537r/tf5be/guAw2zvoSkHoGYIYky7HO42BoVKlpM95EQauLCnlqH9F6AYYqGPtzkqr7VWRnSRsYj+8XaXeZyUqQkNj0iC87mt7pU0yNpuOrA4nCTp40IlDPzwz6H36eoIfyJ8rkgRomKZM3OOv1u1gz1sqyLysVrMFmL8ZPdVN4WNPupDX7UodZCnihy52cqELM85okDSi198JATGG7UzmMTysNkfRAD1CdwuvxROq7QJHtzjq6PZbo1L+R/RjCOcFteov1A+FW/C4ptfF1r60fWF662VU5XCT5L88jqPBYAMcpsAn1idG+UyJBBt1zkBA6B+jA9fYseLjSqO3n4ofe6s2BNPBmVlpNDr1aJQiy0OjMltzNz4KDb20esyaXzPQNKAGUUTtazob/MfZGnDrbTTCJcxtvfqZEPAl6+l7S1zyI+LpYuNK3Zrcdk8A8IHGsdJ01vb48iFnNXWbfns78rehhfUIw6xKDX8f2ZKmpYB7uUMHlH8ceTIMqsYnow8t7QG9bHqhaE4pmXFmgGE5vnyGfrivZdQ5VUXoWqw/O+nrEuIWU2k4G5Gt4vWiNCmIDOekHYip+UFBkCG2nl55ShPdO6vhy9eLu/W3E3ooE9lB/DQfzMhgm+rrdz65SICwO2LO0pP2MtANz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(2616005)(6666004)(6506007)(33964004)(6512007)(26005)(6486002)(478600001)(166002)(31686004)(38100700002)(8676002)(66476007)(8936002)(316002)(66946007)(6916009)(66556008)(4326008)(5660300002)(31696002)(7416002)(86362001)(2906002)(30864003)(41300700001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVJqYldHNE5kam5jc3d6azdIeVpmaTlBOWtIM2RkREtJRERPZkVDT1BoNUto?=
 =?utf-8?B?Ri9iNWhDSkxUVlBiRGI1TlV1RmtUeTBOaSt3ZjFwQWZQQ21HVkloRWZGVkJE?=
 =?utf-8?B?YnYveXlaaVlKQWRId3N0N00vVFhVZUQ0ZzdJUVIvQUtJVVBPRUIvU0oxVXJx?=
 =?utf-8?B?NkVVYkZBalMwU2pISGVhdTZ3ZlFCb2dVTFhmaVJzZS92ZjJaZ3htUk5qMVVv?=
 =?utf-8?B?RGp0cEZrTjZzUmJHdWh6aFQxQjQ2dkJEb0tMWmlxdHpOcFh2dU5teXo0YlMv?=
 =?utf-8?B?TFhUVEMyNHVPcnM1eVFHWDJLVXVlZ3o5bi8vOHdiWDhRSm5qWmpzRTF2SG9n?=
 =?utf-8?B?amJla0tLcnVTbXZNbk5rVGJpWGVEUjhrLzFETmZGaWxJempMd3RLdDZCSnB4?=
 =?utf-8?B?dXE2MWlPZFNLYWJrVlNkd203NzN2Z0FUdFNnL0h4aldjbmpmSDFGNThZc3VT?=
 =?utf-8?B?Z3Iva1UyN2ZaSnpaK2hnUERFQTg3aFZ5L2I3KzhGL3Zua1hacHpDTnZsQURy?=
 =?utf-8?B?SEpKcURLQzEzanExZGhUUTdrc2kvS1pmYTJuVVg3Rm9vRy8vRERQclJjZ0Z6?=
 =?utf-8?B?eGl6SGdFenA0M2NxYXFobWJNeS9qaGNoOTVHMVdEamNXaFRkSUFSWkJZRExB?=
 =?utf-8?B?cHUzVzhJV3N1dnZ2eTVpUnA2WGRBWGFtWDVIVElBazhIV2JMNlJ3T01nb2gx?=
 =?utf-8?B?WXVKQVNPeXd6amN5QU9KRFIvS3picDZDYktwR2Y2N3cyRmJMMXgxUEVvcGU0?=
 =?utf-8?B?YTVYYUJuaU16dU9BU2c1OWE0VXZCWmFscEk4NE9pUitrdVZQL1dpZWNhdXJz?=
 =?utf-8?B?cmY2c1NUQkZBb3FxdTlodGVMd2xMZDMrU1IrZDJ5aytPR1RVd0pRUnlnZGk2?=
 =?utf-8?B?anAwNWNPWW5INkRueUxEcEdXQ2lKR1ZIMlVLVUNERVdrQzBKMEl6ejdDNEEy?=
 =?utf-8?B?Sm52clZiY09laEhCeDkwTEFZUmRXRm9qalBENVRnV0NOM3Byb05OMWxqYzds?=
 =?utf-8?B?NVlSRlAvNS9NVW1sVDZCWDRoTkFlM3gyWXlhS1J4U2oxMjRZTjAyZER0aGlF?=
 =?utf-8?B?T0pDNGR1L0gxbXZ4VFJVRmhXdXVEakNWbTJpVE9HbGxYTlhKMUJraHdXWFll?=
 =?utf-8?B?RG1walcxZVQ0dG95QXhBbDB6SVh4Ly9yVElBOURTUldLZ2pxMG5IbWxqV3ox?=
 =?utf-8?B?UVlGMTNHUVIrQiszcmRVckFFT2VRQXMxV1lkVXhpeGREamgxNDBYTXRGNFhn?=
 =?utf-8?B?WGtqb3RiQnRnaGdLYWtPUEp2TnNWZEY5WmFTZzlRVDRMZm0ya3VDUUt0bllX?=
 =?utf-8?B?NlNZcVBwWXJBMm1GdzF2YXZqK0dVaDJEdXhIY2FRQWI1N3JTVWdDeU5UbEZn?=
 =?utf-8?B?Z1RtTFJ4ejJiZDhEbEg0bWFES1RSTHd1dDIxTDZFcTVuMGRsQnk2MVlxUm1o?=
 =?utf-8?B?SWxMVWtEQWJWbTFTZU5zUnNJNUs2K2RXcmpjZUpxcG0rZzVWR1RKM0ExcE45?=
 =?utf-8?B?TGpkaHZJVE8rc0I4cHV1TjRZQk5rRzg4RjVXVmo4TDhuSWNCcUp4ZkNydE5S?=
 =?utf-8?B?MWRNR0dJMTNyY2VMOXBGRkcwK3IxbzJvaWRKVXc5bnNjVU5LZysrSzBON0hB?=
 =?utf-8?B?TGNFeU1SNTR4M0dDUFZWeDBPRno2aTJvS2c1aHhSQVZxalUrVmJ2UkcyelFI?=
 =?utf-8?B?NEZmV0ZMRE5UdVBzZVZ4Vjh0QjdDWlROWWRaM1FWV0R5MlFjcU14Nml6ZVgz?=
 =?utf-8?B?cTBrRVlMbDFleUkxcDlPQ2RtKzNhcVlRTmhvZ3BWNWxPRGNjVE1qVm8rd3Uy?=
 =?utf-8?B?SWRJRnNJSjRpNnBXNjNzckFDZUg4UU1Hb0pHNGMvODY4WHpadlN6T0ovaHVL?=
 =?utf-8?B?akxSYjY5c1l6QXpTUkgxRGVsZExETTQwVUI1b09RdUVBMTc3VFJ5MjV1Z2JV?=
 =?utf-8?B?MVRFMTZIaVk4ODBUOHNVNmoxdU8yMmpROXVrTlZRR0NUODZEcDA4dll2UEh6?=
 =?utf-8?B?MDV3c0U4b2xlQVdScGx4VFBCZjFyT3FxMVp6Z1hLVEltZkE2aW9EM1p3SCtv?=
 =?utf-8?B?My9Tc3M5S1JyOWxtVXBZNGQrVlBtdHVIQU44c3pabE9oZDlaVTcvNnRQVDN5?=
 =?utf-8?Q?JyYw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113f1f16-32f0-43c1-1c40-08dbdec907c6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 13:05:20.5990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4BAQSHPplfwInEf8n/BP5mBqPMIJGhkhvkpSws1ec0GJ3bY4Nt+vGqhF/MEH+SR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737
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

--------------tk0T70Ca0po5sGHgH0hC2TDV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 06.11.23 um 13:16 schrieb Danilo Krummrich:
> [SNIP]
> This reference count just prevents that the VM is freed as long as other
> ressources are attached to it that carry a VM pointer, such as mappings and
> VM_BOs. The motivation for that are VM_BOs. For mappings it's indeed a bit
> paranoid, but it doesn't hurt either and keeps it consistant.

Ah! Yeah, we have similar semantics in amdgpu as well.

But we keep the reference to the root GEM object and not the VM.

Ok, that makes much more sense then keeping one reference for each mapping.

>> Because of this the mapping should *never* have a reference to the VM, but
>> rather the VM destroys all mapping when it is destroyed itself.
>>
>>> Hence, If the VM is still alive at a point where you don't expect it to
>>> be, then it's
>>> simply a driver bug.
>> Driver bugs is just what I try to prevent here. When individual mappings
>> keep the VM structure alive then drivers are responsible to clean them up,
>> if the VM cleans up after itself then we don't need to worry about it in the
>> driver.
> Drivers are *always* responsible for that. This has nothing to do with whether
> the VM is reference counted or not. GPUVM can't clean up mappings after itself.

Why not?

At least in amdgpu we have it exactly like that. E.g. the higher level 
can cleanup the BO_VM structure at any time possible, even when there 
are mappings. The VM then keeps track which areas still need to be 
invalidated in the physical representation of the page tables.

I would expect that the generalized GPU VM handling would need something 
similar. If we leave that to the driver then each driver would have to 
implement that stuff on it's own again.

> If the driver left mappings, GPUVM would just leak them without reference count.
> It doesn't know about the drivers surrounding structures, nor does it know about
> attached ressources such as PT(E)s.

What are we talking with the word "mapping"? The BO_VM structure? Or 
each individual mapping?

E.g. what we need to prevent is that VM structure (or the root GEM 
object) is released while VM_BOs are still around. That's what I totally 
agree on.

But each individual mapping is a different story. Userspace can create 
so many of them that we probably could even overrun a 32bit counter 
quite easily.

>> When the mapping is destroyed with the VM drivers can't mess this common
>> operation up. That's why this is more defensive.
>>
>> What is a possible requirement is that external code needs to keep
>> references to the VM, but *never* the VM to itself through the mappings. I
>> would consider that a major bug in the component.
> Obviously, you just (want to) apply a different semantics to this reference
> count. It is meant to reflect that the VM structure can be freed, instead of the
> VM can be cleaned up. If you want to latter, you can have a driver specifc
> reference count for that in the exact same way as it was before this patch.

Yeah, it becomes clear that you try to solve some different problem than 
I have expected.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>>>> Reference counting is nice when you don't know who else is referring
>>>> to your VM, but the cost is that you also don't know when the object
>>>> will guardedly be destroyed.
>>>>
>>>> I can trivially work around this by saying that the generic GPUVM
>>>> object has a different lifetime than the amdgpu specific object, but
>>>> that opens up doors for use after free again.
>>> If your driver never touches the VM's reference count and exits the VM
>>> with a clean state
>>> (no mappings and no VM_BOs left), effectively, this is the same as
>>> having no reference
>>> count.
>>>
>>> In the very worst case you could argue that we trade a potential UAF
>>> *and* memroy leak
>>> (no reference count) with *only* a memory leak (with reference count),
>>> which to me seems
>>> reasonable.
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>> Thanks,
>>>>>> Christian.
>>>>> [1]https://lore.kernel.org/dri-devel/6fa058a4-20d3-44b9-af58-755cfb375d75@redhat.com/
>>>>>
>>>>>
>>>>>>> Signed-off-by: Danilo Krummrich<dakr@redhat.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/drm_gpuvm.c            | 44
>>>>>>> +++++++++++++++++++-------
>>>>>>>     drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
>>>>>>>     include/drm/drm_gpuvm.h                | 31 +++++++++++++++++-
>>>>>>>     3 files changed, 78 insertions(+), 17 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c
>>>>>>> b/drivers/gpu/drm/drm_gpuvm.c
>>>>>>> index 53e2c406fb04..6a88eafc5229 100644
>>>>>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>>>>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>>>>>> @@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm
>>>>>>> *gpuvm, const char *name,
>>>>>>>         gpuvm->rb.tree = RB_ROOT_CACHED;
>>>>>>>         INIT_LIST_HEAD(&gpuvm->rb.list);
>>>>>>> +    kref_init(&gpuvm->kref);
>>>>>>> +
>>>>>>>         gpuvm->name = name ? name : "unknown";
>>>>>>>         gpuvm->flags = flags;
>>>>>>>         gpuvm->ops = ops;
>>>>>>> @@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm
>>>>>>> *gpuvm, const char *name,
>>>>>>>     }
>>>>>>>     EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>>>>>>> -/**
>>>>>>> - * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
>>>>>>> - * @gpuvm: pointer to the &drm_gpuvm to clean up
>>>>>>> - *
>>>>>>> - * Note that it is a bug to call this function on a
>>>>>>> manager that still
>>>>>>> - * holds GPU VA mappings.
>>>>>>> - */
>>>>>>> -void
>>>>>>> -drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>>>>> +static void
>>>>>>> +drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
>>>>>>>     {
>>>>>>>         gpuvm->name = NULL;
>>>>>>> @@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>>>>>         drm_gem_object_put(gpuvm->r_obj);
>>>>>>>     }
>>>>>>> -EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>>>>>> +
>>>>>>> +static void
>>>>>>> +drm_gpuvm_free(struct kref *kref)
>>>>>>> +{
>>>>>>> +    struct drm_gpuvm *gpuvm = container_of(kref, struct
>>>>>>> drm_gpuvm, kref);
>>>>>>> +
>>>>>>> +    if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
>>>>>>> +        return;
>>>>>>> +
>>>>>>> +    drm_gpuvm_fini(gpuvm);
>>>>>>> +
>>>>>>> +    gpuvm->ops->vm_free(gpuvm);
>>>>>>> +}
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
>>>>>>> + * @gpuvm: the &drm_gpuvm to release the reference of
>>>>>>> + *
>>>>>>> + * This releases a reference to @gpuvm.
>>>>>>> + */
>>>>>>> +void
>>>>>>> +drm_gpuvm_put(struct drm_gpuvm *gpuvm)
>>>>>>> +{
>>>>>>> +    if (gpuvm)
>>>>>>> +        kref_put(&gpuvm->kref, drm_gpuvm_free);
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_put);
>>>>>>>     static int
>>>>>>>     __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>>>>>> @@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>>>>>>         if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
>>>>>>>             return -EINVAL;
>>>>>>> -    return __drm_gpuva_insert(gpuvm, va);
>>>>>>> +    return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
>>>>>>>     }
>>>>>>>     EXPORT_SYMBOL_GPL(drm_gpuva_insert);
>>>>>>> @@ -876,6 +897,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
>>>>>>>         }
>>>>>>>         __drm_gpuva_remove(va);
>>>>>>> +    drm_gpuvm_put(va->vm);
>>>>>>>     }
>>>>>>>     EXPORT_SYMBOL_GPL(drm_gpuva_remove);
>>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>>>> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>>>> index 54be12c1272f..cb2f06565c46 100644
>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>>>> @@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct
>>>>>>> nouveau_bo *nvbo)
>>>>>>>         }
>>>>>>>     }
>>>>>>> +static void
>>>>>>> +nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
>>>>>>> +{
>>>>>>> +    struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
>>>>>>> +
>>>>>>> +    kfree(uvmm);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static const struct drm_gpuvm_ops gpuvm_ops = {
>>>>>>> +    .vm_free = nouveau_uvmm_free,
>>>>>>> +};
>>>>>>> +
>>>>>>>     int
>>>>>>>     nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>>>>>>>                    void *data,
>>>>>>> @@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct
>>>>>>> drm_device *dev,
>>>>>>>                    NOUVEAU_VA_SPACE_END,
>>>>>>>                    init->kernel_managed_addr,
>>>>>>>                    init->kernel_managed_size,
>>>>>>> -               NULL);
>>>>>>> +               &gpuvm_ops);
>>>>>>>         /* GPUVM takes care from here on. */
>>>>>>>         drm_gem_object_put(r_obj);
>>>>>>> @@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct
>>>>>>> drm_device *dev,
>>>>>>>         return 0;
>>>>>>>     out_gpuvm_fini:
>>>>>>> -    drm_gpuvm_destroy(&uvmm->base);
>>>>>>> -    kfree(uvmm);
>>>>>>> +    drm_gpuvm_put(&uvmm->base);
>>>>>>>     out_unlock:
>>>>>>>         mutex_unlock(&cli->mutex);
>>>>>>>         return ret;
>>>>>>> @@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
>>>>>>>         mutex_lock(&cli->mutex);
>>>>>>>         nouveau_vmm_fini(&uvmm->vmm);
>>>>>>> -    drm_gpuvm_destroy(&uvmm->base);
>>>>>>> -    kfree(uvmm);
>>>>>>> +    drm_gpuvm_put(&uvmm->base);
>>>>>>>         mutex_unlock(&cli->mutex);
>>>>>>>     }
>>>>>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>>>>>>> index 0c2e24155a93..4e6e1fd3485a 100644
>>>>>>> --- a/include/drm/drm_gpuvm.h
>>>>>>> +++ b/include/drm/drm_gpuvm.h
>>>>>>> @@ -247,6 +247,11 @@ struct drm_gpuvm {
>>>>>>>             struct list_head list;
>>>>>>>         } rb;
>>>>>>> +    /**
>>>>>>> +     * @kref: reference count of this object
>>>>>>> +     */
>>>>>>> +    struct kref kref;
>>>>>>> +
>>>>>>>         /**
>>>>>>>          * @kernel_alloc_node:
>>>>>>>          *
>>>>>>> @@ -273,7 +278,23 @@ void drm_gpuvm_init(struct
>>>>>>> drm_gpuvm *gpuvm, const char *name,
>>>>>>>                 u64 start_offset, u64 range,
>>>>>>>                 u64 reserve_offset, u64 reserve_range,
>>>>>>>                 const struct drm_gpuvm_ops *ops);
>>>>>>> -void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
>>>>>>> + * @gpuvm: the &drm_gpuvm to acquire the reference of
>>>>>>> + *
>>>>>>> + * This function acquires an additional reference to
>>>>>>> @gpuvm. It is illegal to
>>>>>>> + * call this without already holding a reference. No locks required.
>>>>>>> + */
>>>>>>> +static inline struct drm_gpuvm *
>>>>>>> +drm_gpuvm_get(struct drm_gpuvm *gpuvm)
>>>>>>> +{
>>>>>>> +    kref_get(&gpuvm->kref);
>>>>>>> +
>>>>>>> +    return gpuvm;
>>>>>>> +}
>>>>>>> +
>>>>>>> +void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
>>>>>>>     bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>>>>>>> u64 addr, u64 range);
>>>>>>>     bool drm_gpuvm_interval_empty(struct drm_gpuvm
>>>>>>> *gpuvm, u64 addr, u64 range);
>>>>>>> @@ -673,6 +694,14 @@ static inline void
>>>>>>> drm_gpuva_init_from_op(struct drm_gpuva *va,
>>>>>>>      * operations to drivers.
>>>>>>>      */
>>>>>>>     struct drm_gpuvm_ops {
>>>>>>> +    /**
>>>>>>> +     * @vm_free: called when the last reference of a
>>>>>>> struct drm_gpuvm is
>>>>>>> +     * dropped
>>>>>>> +     *
>>>>>>> +     * This callback is mandatory.
>>>>>>> +     */
>>>>>>> +    void (*vm_free)(struct drm_gpuvm *gpuvm);
>>>>>>> +
>>>>>>>         /**
>>>>>>>          * @op_alloc: called when the &drm_gpuvm allocates
>>>>>>>          * a struct drm_gpuva_op

--------------tk0T70Ca0po5sGHgH0hC2TDV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 06.11.23 um 13:16 schrieb Danilo Krummrich:<br>
    <blockquote type="cite" cite="mid:ZUjZFFtLM435tTxJ@pollux">[SNIP]<span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">This reference count just prevents that the VM is freed as long as other
ressources are attached to it that carry a VM pointer, such as mappings and
VM_BOs. The motivation for that are VM_BOs. For mappings it's indeed a bit
paranoid, but it doesn't hurt either and keeps it consistant.</pre>
    </blockquote>
    <br>
    Ah! Yeah, we have similar semantics in amdgpu as well.<br>
    <br>
    But we keep the reference to the root GEM object and not the VM.<br>
    <br>
    Ok, that makes much more sense then keeping one reference for each
    mapping.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZUjZFFtLM435tTxJ@pollux">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Because of this the mapping should *never* have a reference to the VM, but
rather the VM destroys all mapping when it is destroyed itself.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hence, If the VM is still alive at a point where you don't expect it to
be, then it's
simply a driver bug.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Driver bugs is just what I try to prevent here. When individual mappings
keep the VM structure alive then drivers are responsible to clean them up,
if the VM cleans up after itself then we don't need to worry about it in the
driver.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Drivers are *always* responsible for that. This has nothing to do with whether
the VM is reference counted or not. GPUVM can't clean up mappings after itself.</pre>
    </blockquote>
    <br>
    Why not?<br>
    <br>
    At least in amdgpu we have it exactly like that. E.g. the higher
    level can cleanup the BO_VM structure at any time possible, even
    when there are mappings. The VM then keeps track which areas still
    need to be invalidated in the physical representation of the page
    tables.<br>
    <br>
    I would expect that the generalized GPU VM handling would need
    something similar. If we leave that to the driver then each driver
    would have to implement that stuff on it's own again.<br>
    <br>
    <blockquote type="cite" cite="mid:ZUjZFFtLM435tTxJ@pollux">
      <pre class="moz-quote-pre" wrap="">If the driver left mappings, GPUVM would just leak them without reference count.
It doesn't know about the drivers surrounding structures, nor does it know about
attached ressources such as PT(E)s.</pre>
    </blockquote>
    <br>
    What are we talking with the word &quot;mapping&quot;? The BO_VM structure? Or
    each individual mapping?<br>
    <br>
    E.g. what we need to prevent is that VM structure (or the root GEM
    object) is released while VM_BOs are still around. That's what I
    totally agree on.<br>
    <br>
    But each individual mapping is a different story. Userspace can
    create so many of them that we probably could even overrun a 32bit
    counter quite easily.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZUjZFFtLM435tTxJ@pollux">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">When the mapping is destroyed with the VM drivers can't mess this common
operation up. That's why this is more defensive.

What is a possible requirement is that external code needs to keep
references to the VM, but *never* the VM to itself through the mappings. I
would consider that a major bug in the component.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Obviously, you just (want to) apply a different semantics to this reference
count. It is meant to reflect that the VM structure can be freed, instead of the
VM can be cleaned up. If you want to latter, you can have a driver specifc
reference count for that in the exact same way as it was before this patch.</pre>
    </blockquote>
    <br>
    Yeah, it becomes clear that you try to solve some different problem
    than I have expected.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZUjZFFtLM435tTxJ@pollux">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Reference counting is nice when you don't know who else is referring
to your VM, but the cost is that you also don't know when the object
will guardedly be destroyed.

I can trivially work around this by saying that the generic GPUVM
object has a different lifetime than the amdgpu specific object, but
that opens up doors for use after free again.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
If your driver never touches the VM's reference count and exits the VM
with a clean state
(no mappings and no VM_BOs left), effectively, this is the same as
having no reference
count.

In the very worst case you could argue that we trade a potential UAF
*and* memroy leak
(no reference count) with *only* a memory leak (with reference count),
which to me seems
reasonable.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Thanks,
Christian.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">[1]<a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/6fa058a4-20d3-44b9-af58-755cfb375d75@redhat.com/">https://lore.kernel.org/dri-devel/6fa058a4-20d3-44b9-af58-755cfb375d75@redhat.com/</a>


</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Signed-off-by: Danilo Krummrich<a class="moz-txt-link-rfc2396E" href="mailto:dakr@redhat.com">&lt;dakr@redhat.com&gt;</a>
---
&nbsp;&nbsp; drivers/gpu/drm/drm_gpuvm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 44
+++++++++++++++++++-------
&nbsp;&nbsp; drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
&nbsp;&nbsp; include/drm/drm_gpuvm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 31 +++++++++++++++++-
&nbsp;&nbsp; 3 files changed, 78 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c
b/drivers/gpu/drm/drm_gpuvm.c
index 53e2c406fb04..6a88eafc5229 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm
*gpuvm, const char *name,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpuvm-&gt;rb.tree = RB_ROOT_CACHED;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_LIST_HEAD(&amp;gpuvm-&gt;rb.list);
+&nbsp;&nbsp;&nbsp; kref_init(&amp;gpuvm-&gt;kref);
+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpuvm-&gt;name = name ? name : &quot;unknown&quot;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpuvm-&gt;flags = flags;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpuvm-&gt;ops = ops;
@@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm
*gpuvm, const char *name,
&nbsp;&nbsp; }
&nbsp;&nbsp; EXPORT_SYMBOL_GPL(drm_gpuvm_init);
-/**
- * drm_gpuvm_destroy() - cleanup a &amp;drm_gpuvm
- * @gpuvm: pointer to the &amp;drm_gpuvm to clean up
- *
- * Note that it is a bug to call this function on a
manager that still
- * holds GPU VA mappings.
- */
-void
-drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
+static void
+drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpuvm-&gt;name = NULL;
@@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_gem_object_put(gpuvm-&gt;r_obj);
&nbsp;&nbsp; }
-EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
+
+static void
+drm_gpuvm_free(struct kref *kref)
+{
+&nbsp;&nbsp;&nbsp; struct drm_gpuvm *gpuvm = container_of(kref, struct
drm_gpuvm, kref);
+
+&nbsp;&nbsp;&nbsp; if (drm_WARN_ON(gpuvm-&gt;drm, !gpuvm-&gt;ops-&gt;vm_free))
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
+
+&nbsp;&nbsp;&nbsp; drm_gpuvm_fini(gpuvm);
+
+&nbsp;&nbsp;&nbsp; gpuvm-&gt;ops-&gt;vm_free(gpuvm);
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
+&nbsp;&nbsp;&nbsp; if (gpuvm)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kref_put(&amp;gpuvm-&gt;kref, drm_gpuvm_free);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_put);
&nbsp;&nbsp; static int
&nbsp;&nbsp; __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
@@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;
-&nbsp;&nbsp;&nbsp; return __drm_gpuva_insert(gpuvm, va);
+&nbsp;&nbsp;&nbsp; return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
&nbsp;&nbsp; }
&nbsp;&nbsp; EXPORT_SYMBOL_GPL(drm_gpuva_insert);
@@ -876,6 +897,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __drm_gpuva_remove(va);
+&nbsp;&nbsp;&nbsp; drm_gpuvm_put(va-&gt;vm);
&nbsp;&nbsp; }
&nbsp;&nbsp; EXPORT_SYMBOL_GPL(drm_gpuva_remove);
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 54be12c1272f..cb2f06565c46 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct
nouveau_bo *nvbo)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp; }
+static void
+nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
+{
+&nbsp;&nbsp;&nbsp; struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
+
+&nbsp;&nbsp;&nbsp; kfree(uvmm);
+}
+
+static const struct drm_gpuvm_ops gpuvm_ops = {
+&nbsp;&nbsp;&nbsp; .vm_free = nouveau_uvmm_free,
+};
+
&nbsp;&nbsp; int
&nbsp;&nbsp; nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *data,
@@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct
drm_device *dev,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOUVEAU_VA_SPACE_END,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; init-&gt;kernel_managed_addr,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; init-&gt;kernel_managed_size,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;gpuvm_ops);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* GPUVM takes care from here on. */
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_gem_object_put(r_obj);
@@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct
drm_device *dev,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
&nbsp;&nbsp; out_gpuvm_fini:
-&nbsp;&nbsp;&nbsp; drm_gpuvm_destroy(&amp;uvmm-&gt;base);
-&nbsp;&nbsp;&nbsp; kfree(uvmm);
+&nbsp;&nbsp;&nbsp; drm_gpuvm_put(&amp;uvmm-&gt;base);
&nbsp;&nbsp; out_unlock:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;cli-&gt;mutex);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
@@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;cli-&gt;mutex);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nouveau_vmm_fini(&amp;uvmm-&gt;vmm);
-&nbsp;&nbsp;&nbsp; drm_gpuvm_destroy(&amp;uvmm-&gt;base);
-&nbsp;&nbsp;&nbsp; kfree(uvmm);
+&nbsp;&nbsp;&nbsp; drm_gpuvm_put(&amp;uvmm-&gt;base);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;cli-&gt;mutex);
&nbsp;&nbsp; }
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 0c2e24155a93..4e6e1fd3485a 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -247,6 +247,11 @@ struct drm_gpuvm {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct list_head list;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } rb;
+&nbsp;&nbsp;&nbsp; /**
+&nbsp;&nbsp;&nbsp;&nbsp; * @kref: reference count of this object
+&nbsp;&nbsp;&nbsp;&nbsp; */
+&nbsp;&nbsp;&nbsp; struct kref kref;
+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @kernel_alloc_node:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *
@@ -273,7 +278,23 @@ void drm_gpuvm_init(struct
drm_gpuvm *gpuvm, const char *name,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 start_offset, u64 range,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 reserve_offset, u64 reserve_range,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct drm_gpuvm_ops *ops);
-void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
+
+/**
+ * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
+ * @gpuvm: the &amp;drm_gpuvm to acquire the reference of
+ *
+ * This function acquires an additional reference to
@gpuvm. It is illegal to
+ * call this without already holding a reference. No locks required.
+ */
+static inline struct drm_gpuvm *
+drm_gpuvm_get(struct drm_gpuvm *gpuvm)
+{
+&nbsp;&nbsp;&nbsp; kref_get(&amp;gpuvm-&gt;kref);
+
+&nbsp;&nbsp;&nbsp; return gpuvm;
+}
+
+void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
&nbsp;&nbsp; bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
u64 addr, u64 range);
&nbsp;&nbsp; bool drm_gpuvm_interval_empty(struct drm_gpuvm
*gpuvm, u64 addr, u64 range);
@@ -673,6 +694,14 @@ static inline void
drm_gpuva_init_from_op(struct drm_gpuva *va,
&nbsp;&nbsp;&nbsp; * operations to drivers.
&nbsp;&nbsp;&nbsp; */
&nbsp;&nbsp; struct drm_gpuvm_ops {
+&nbsp;&nbsp;&nbsp; /**
+&nbsp;&nbsp;&nbsp;&nbsp; * @vm_free: called when the last reference of a
struct drm_gpuvm is
+&nbsp;&nbsp;&nbsp;&nbsp; * dropped
+&nbsp;&nbsp;&nbsp;&nbsp; *
+&nbsp;&nbsp;&nbsp;&nbsp; * This callback is mandatory.
+&nbsp;&nbsp;&nbsp;&nbsp; */
+&nbsp;&nbsp;&nbsp; void (*vm_free)(struct drm_gpuvm *gpuvm);
+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @op_alloc: called when the &amp;drm_gpuvm allocates
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * a struct drm_gpuva_op
</pre>
                </blockquote>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
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

--------------tk0T70Ca0po5sGHgH0hC2TDV--
