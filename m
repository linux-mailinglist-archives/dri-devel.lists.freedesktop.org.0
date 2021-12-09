Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F27B46EFAD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A3F10EC55;
	Thu,  9 Dec 2021 16:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF42310E123;
 Thu,  9 Dec 2021 15:29:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsNxR5vGNf7d33uWc6L1fUi1skIzyIVaMUoXsH0sjT0f9iHfe+OlhotDMk0NzJrSICyPQ6U6vTM6DkCJauQFv9Jn2mOV8Ko+RFVdlte+539SPynHPs82nfrdbuCrpncpDfzVDKgJosSIiHkiFEaiq6B7KkVQhOA2reLMSo+PkzGSNy0zzdSlzHy2U+4SimQQ/N9N1xJV/DgYctA9T8e/JCaYqn0ADLqGTIuQQE68Uqa3iaySbuGIAcHySCHKniTboMsRpM0Qy1mrejj2ATWjo4tGFd8RpiEpXlOMo/exXWW1H7FOCphehZAALdyMaeDSbq+urUaSrii1mykUy2rKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESNVEy0p3MtP4vrx8oDrijPA6I9P4U4GNhF6G+KKg+A=;
 b=i/h9T12uOM6pQaMSz1vZ2s4wzpttnA0ND9R0GHsLvEUGehrcQnKRxk2n3mboLSxKmncbDlrrd1HnREd/9L7IgfiRbI9vM/53wtd7+68PgeNwCMxkWIM/4BSNLKy7ev61gcfWlenAzw1lojHf/xQAQrRwfh+Ywb4is7PSCQGGUEatoj9ymAChlfor2zGS5XRMzetEMNr5JYeUbErdh/EcoQkRXvl8JA6OTJ22KCpaE6j2ysWKt6mVHQ9sNZ92Nr8t1ONrC235CRVvufNz2IF0Wg+Qyw4uRPqJdHQKTpZkOHDxdJ2WJiukXQT48jbd8pwdl11Jbyi50fup8kkQgaNeag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESNVEy0p3MtP4vrx8oDrijPA6I9P4U4GNhF6G+KKg+A=;
 b=oekyp/f7cbpiUrLMR7bPlPGsDezxFumRih2+HbhupFfoiXI52kCCwBlrDNJ+7HAE4UInfIUOQhAv15AVUa7HjZ+m4OSwIg6nIKa2D0AUq+GGkkgVTi98kLmTuVZ2wHTydR5hIvfO2dJeuc49S5nnsbBpqZs+mqdmKATdoZYDYt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5344.namprd12.prod.outlook.com (2603:10b6:5:39f::11)
 by DM4PR12MB5294.namprd12.prod.outlook.com (2603:10b6:5:39e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 9 Dec
 2021 15:29:50 +0000
Received: from DM4PR12MB5344.namprd12.prod.outlook.com
 ([fe80::a003:6e33:8c98:790f]) by DM4PR12MB5344.namprd12.prod.outlook.com
 ([fe80::a003:6e33:8c98:790f%4]) with mapi id 15.20.4734.028; Thu, 9 Dec 2021
 15:29:50 +0000
Message-ID: <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
Date: Thu, 9 Dec 2021 10:29:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
In-Reply-To: <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:610:cc::11) To DM4PR12MB5344.namprd12.prod.outlook.com
 (2603:10b6:5:39f::11)
MIME-Version: 1.0
Received: from [10.254.69.150] (165.204.54.211) by
 CH0PR03CA0066.namprd03.prod.outlook.com (2603:10b6:610:cc::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Thu, 9 Dec 2021 15:29:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef14f530-8972-4fb0-30f7-08d9bb28bda6
X-MS-TrafficTypeDiagnostic: DM4PR12MB5294:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5294BF85F4FB74A3323FF39FFE709@DM4PR12MB5294.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YxmU8QNjG+h4rhaRMldpl9vCa9zZXc33xVEoAQL6TztefkAGDsEZkghRKLKMjw5kg/jcZ9BZ86uDSZah2fUlRtQuPns+0ehxcRHhhShsqIfHXxxy2Kdxhyx+6FsvuTk9coPTewKqsbTFf8SyC607AYPDDesnDWtA2r2GPQjx71rGgaLrid0qy5mbHtjSmJU8ECpZQxVEbAulKjtHGEyp8Rr1rQK43YGlNENZiwUWRE4is7Aht7dpPvfuuqz5ENJDkIHNWMRszl1APWPX1eYS7kqXhx0zOrx//iwFZ76yhY3+kNXhYh+aUQ2goSD7MLjIvFmPg/45ytaqm+JmwD8kFqapM9VRm7XtAcs7zyJwY7meHbce3YbpKWv6NLPUqNaKbZVNiUIPEVdDfLz0uqQ4z+xeBlQflXoQACMqO4zFdykI8fNsJT3nqViBc74R03oOM6nhwdAoamoduG43S45N+xW5ucKxQ5ZD9bSUHMnPAu//MF5NAo3HV58GUAI/yBcotg33K0cbM9/pL5xeWD6ed/a+rGHfffpKt/2PFlb8AkQBSr2eCQLUITH69nz8RbVej8U6cSixdys6uFTgJAS6h2VmvkukvC9f4E2uifIcivqogEquua0ldPnSBzrvLyCdSxMg8bfzxnoPd8WKxWQLvNEBNwJ3eW0tJRjs/h8EUps3K5w7W50FQoPxLW/KSo6RnuSRD0YX97STvf1k5PKK128iMluTSAFVYhyRN5iNKkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5344.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(86362001)(4326008)(5660300002)(16576012)(31686004)(36756003)(53546011)(186003)(26005)(31696002)(2906002)(6486002)(8676002)(956004)(8936002)(2616005)(83380400001)(6666004)(110136005)(66946007)(508600001)(38100700002)(54906003)(66574015)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0s2YmRuUHhjQXl6aXpUWDRTS21pVHRnS2xTa0NoN1Bzbk0xREpoNng4VnVD?=
 =?utf-8?B?RUxrT1oyVVBDYXl2aUpIaGNGL3VpUzgzM0RaRzI3dlJjbE12NFJCRElDb3Bt?=
 =?utf-8?B?bVpQTnJaODM5bFNDb0VRaU5uTlJkaE0ydnFHSEdPU2ZPcmNpVndCaGVITzY4?=
 =?utf-8?B?QlU5Q1I4TndTaXUzUjR2RWt4Z1E1V3kwTUx5Wm9CUllrUVdTWEI1WVpQb0FD?=
 =?utf-8?B?T0lJUHRCVmVqdUZRVFY1SUFSaXNIK1E5R1hHZzYxZWhmODVGVlhYOXFjQm90?=
 =?utf-8?B?T2o0UlJkZlVJS0pLeDJScngvL1RNaHd5Q2cwckZ4ZGd2SFR1K3ZRK0c0MzM1?=
 =?utf-8?B?Skd2RlBaSXppMXh6ZVBwd0hZQ1o5TUhDbEZ5WC9HYXpaT3Y0VHl1QTRKTFFn?=
 =?utf-8?B?NTNpc3hudXdUWnJxYnB4Ui9qNi9wcFlJUVNYVHppWG1WT3I4S3pZOFJHYU93?=
 =?utf-8?B?aGpqbnErR09BUitHTGl5c1loMUNpMVd4ODJlWk9mSTFYVENOSzFOMGZuUzdi?=
 =?utf-8?B?SVE3bjhLMHhMK0hhdDNGNjZPdmF4N0l3R2dSdmxRRkZlelBsdlQySWsrMGRl?=
 =?utf-8?B?RzE3aUpaZXZxT05BOE82eTMzeW85TXN5M0pUUVorelB1dnZta1IyTmRVZ3dk?=
 =?utf-8?B?MS9OUjUybUM3anlmUktyUG5qcjc1Qi90Z2sxUEpPOWE2cTJ4N1NnL1UwNi80?=
 =?utf-8?B?N3FaZld2eXZIM2RhQldqWUFlUGlxQUNZMDBkK0VKSkh5aCtYOFI0VDExcEF0?=
 =?utf-8?B?NGVjMHdPVGlwOXBTSk1mdUlrV0o0U1h6RDExQ1JGL0h4ZWYvK2lNRkx2VUs4?=
 =?utf-8?B?SmNuYklVblk4VDZDU01QTnQrZEYxVXREVlZUdEtzeUdKVkExWHF4VTgyL3d2?=
 =?utf-8?B?cTBpdjZIQTNQQnBYbHY0U1FhdWlxQVhXdVViNDhET2ljVUlYb0NpNVo5M0hO?=
 =?utf-8?B?S2dFTVp6Nk9WNXF4ajBTejdCeEVndE9UbWtrVk1GNmRSL0pzWEltYTkrRXdB?=
 =?utf-8?B?RmJPblA5dzUvOW5ZQTFsUXczK1pGc0FSNnVqaHk3MGkrZGFXbW8yMUFRZURU?=
 =?utf-8?B?YnlYYnZFQkh6aVNYRGMwM1Yrcjhsd0xYR0Jyd2tUdG44aVltbXZidC9iSG5m?=
 =?utf-8?B?OXRneUd4eFlqQ3VpN0tzYUNHVDlMcUtDMFF3SVZkQWhteFVLN2k4T1l0cTg4?=
 =?utf-8?B?Z2piaU5DeG5VTUViZVU3T1V6N0Q0VFgwUHJ1c0UvQzJPZmN1Ujl2ci9wTVJW?=
 =?utf-8?B?ZW9DbWFWNGpUV3hYUEwwWHc3dXR1Y3BnZHlqeFkxY1NVZklURWIrZ2hURlJH?=
 =?utf-8?B?QUpQVXlLUHllaytWd3lwZlFoTGlLbFRLWGxLcndZTXdOMWY3b05TVkRsSHhG?=
 =?utf-8?B?YlBYZTVoUFowRDNOOE1ZVWEralpsay9YQW4vVktnc3UrL2pTMkNoTXY4Q09z?=
 =?utf-8?B?RHMxWThxcmVPbGRlRTVXaUxGeHZ2Vm5WVVh4bVlDRVllTHQzb2xLa0dRVEQx?=
 =?utf-8?B?bVhNbDRGVkIyT0xZMWpYWkdxbTFzTVdabW9sSE9CN1BPaTRPcTcyK1pJbDVY?=
 =?utf-8?B?K3RXaUExZ0VMNExzZ3NRZytiL21RN1hpSS9kdGs0UytGWWN5QURnaytycUw4?=
 =?utf-8?B?L1VtZ21OczVYb1IzeldaSTBZWEtROFJncnRuK1RtR0x2TjNrVHk2MmYrbTgy?=
 =?utf-8?B?YVN2U2dyaTRPYmFpWjdyL2N0VXIzQ1JWOUJLUmNJMzZqbi85VDlPa2tsREph?=
 =?utf-8?B?a3RiWXNpRGZsSGpadktyV2VCSmFFaXd5a3FkdkNPUWRUbXU0UW9QNGoxbWlT?=
 =?utf-8?B?Y1dZWGJHQzJOTEo5Vm5rbVNCNWE4MTJyNTIzUHlJcXhMdTQrY1BLNTFYNTVC?=
 =?utf-8?B?UXBQU2xEaUZ0S0NKMnQzYVVoSzI5a0FpMCs1LzRjTjcxTnlxekJmTTVYOVd6?=
 =?utf-8?B?RWdSRXloTzRPbHlqSjQvS3ZCWkF1VGFnWWdGNXZZRGRtdmN0ZTFCTCtNdSt5?=
 =?utf-8?B?N0FmZ0NFRU10UnozRXR1T0daTWQycnpGMVY5cFVpcjV3eXl3dTdtUGNTUGdK?=
 =?utf-8?B?WEdjcG9RNWRySEZtRG55VW8yNWtqck9RWktGb0NxMTBzQWN0a0crclpNNmdV?=
 =?utf-8?B?SnRJeFlwRW5oS1Bhb0tsSkl1R0FtZ25RWHc5VHpoZHY3cW5lUDBXYXJJNTY5?=
 =?utf-8?Q?LEjmRbbDLvnUuldLaB+kmhk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef14f530-8972-4fb0-30f7-08d9bb28bda6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5344.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:29:50.5891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlsdxOdnVbyOgJjv3T+wOaJeZ3WgHJBPc6bO9JuNuTCTUNKH3y0lfKHhG5pxzCls58pWdpvZeGGH2GHkd6kInQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5294
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch,
 Felix Kuehling <Felix.Kuehling@amd.com>, David Yat Sin <david.yatsin@amd.com>,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sounds good. I will send a v2 with only ttm_bo_mmap_obj change. Thank you!

On 12/9/2021 10:27 AM, Christian König wrote:
> Hi Rajneesh,
>
> yes, separating this from the drm_gem_mmap_obj() change is certainly a 
> good idea.
>
>> The child cannot access the BOs mapped by the parent anyway with 
>> access restrictions applied
>
> exactly that is not correct. That behavior is actively used by some 
> userspace stacks as far as I know.
>
> Regards,
> Christian.
>
> Am 09.12.21 um 16:23 schrieb Bhardwaj, Rajneesh:
>> Thanks Christian. Would it make it less intrusive if I just use the 
>> flag for ttm bo mmap and remove the drm_gem_mmap_obj change from this 
>> patch? For our use case, just the ttm_bo_mmap_obj change should 
>> suffice and we don't want to put any more work arounds in the user 
>> space (thunk, in our case).
>>
>> The child cannot access the BOs mapped by the parent anyway with 
>> access restrictions applied so I wonder why even inherit the vma?
>>
>> On 12/9/2021 2:54 AM, Christian König wrote:
>>> Am 08.12.21 um 21:53 schrieb Rajneesh Bhardwaj:
>>>> When an application having open file access to a node forks, its 
>>>> shared
>>>> mappings also get reflected in the address space of child process even
>>>> though it cannot access them with the object permissions applied. 
>>>> With the
>>>> existing permission checks on the gem objects, it might be 
>>>> reasonable to
>>>> also create the VMAs with VM_DONTCOPY flag so a user space application
>>>> doesn't need to explicitly call the madvise(addr, len, MADV_DONTFORK)
>>>> system call to prevent the pages in the mapped range to appear in the
>>>> address space of the child process. It also prevents the memory leaks
>>>> due to additional reference counts on the mapped BOs in the child
>>>> process that prevented freeing the memory in the parent for which 
>>>> we had
>>>> worked around earlier in the user space inside the thunk library.
>>>>
>>>> Additionally, we faced this issue when using CRIU to checkpoint 
>>>> restore
>>>> an application that had such inherited mappings in the child which
>>>> confuse CRIU when it mmaps on restore. Having this flag set for the
>>>> render node VMAs helps. VMAs mapped via KFD already take care of 
>>>> this so
>>>> this is needed only for the render nodes.
>>>
>>> Unfortunately that is most likely a NAK. We already tried something 
>>> similar.
>>>
>>> While it is illegal by the OpenGL specification and doesn't work for 
>>> most userspace stacks, we do have some implementations which call 
>>> fork() with a GL context open and expect it to work.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>
>>>> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
>>>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_gem.c       | 3 ++-
>>>>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>> index 09c820045859..d9c4149f36dd 100644
>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>> @@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object 
>>>> *obj, unsigned long obj_size,
>>>>               goto err_drm_gem_object_put;
>>>>           }
>>>>   -        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | 
>>>> VM_DONTDUMP;
>>>> +        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
>>>> +                | VM_DONTDUMP | VM_DONTCOPY;
>>>>           vma->vm_page_prot = 
>>>> pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>>>           vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>>>       }
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> index 33680c94127c..420a4898fdd2 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> @@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, 
>>>> struct ttm_buffer_object *bo)
>>>>         vma->vm_private_data = bo;
>>>>   -    vma->vm_flags |= VM_PFNMAP;
>>>> +    vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
>>>>       vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>>>>       return 0;
>>>>   }
>>>
>
