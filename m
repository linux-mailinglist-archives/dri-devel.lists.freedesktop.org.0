Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2680A46EEB8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026E410E1C9;
	Thu,  9 Dec 2021 16:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9565B89CF6;
 Thu,  9 Dec 2021 15:27:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfUkBlwxILbkSv1Uh7OaTM3rJn1tzIE83JAwALiIVMKbVV98eITfxi1WVEnQSzqtcLTQw4lm5ZRtbsRoEXSPabF6Qs46mzPAJF4SBxXqLbECl+zczbXIuSaKiDeDLn7aI6zZx6gCtZWH4FrUMnT9UWZrc0z+JUBOaxnEg/ta5oc+rI3qGRIUKhyZEyp5KW7TsZ/Ka29889oipafFPlXbTJNska0iZXLcOac3e1e/zjYPlcLVCTTMyPtXN2/swZRSJlik27lfV5f3rUqWYv+2YnpORyQ5X+91bLzy7Il2NNtg2IoJoS7UpVLYZdIz0Y2rgYQfYOnHdtffxtVUPg/Ksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsy5q0/VaLju5Diyg+8jD2t8kr2HDKyCbPeWDt/J4wQ=;
 b=SLi3R66z7O8sR1v3R0oIs/2WUiUSFhKR1ypOFY9ayxfoYND/aqC6ZW+iH3PtJo8kUiLP+hXLVqmTnJhKm2Tjl6JDtsIfs2x4l+wvcXyTrWUF8ot9Dn4fXDvTogLRe8dTPHlX6aSa4UqcPc4HBpSIciD0wq3ghJ3lytJQ7sMKlyEjLHPx/YDRIylNGZ6Fw8alvMg6bBz9IlLuEL8JhC3PQl09iQPyyrrcVY+VaD7sa6NwjYnZaGZbZWNKB+0pZZQPawWCJae+qQiHJM+++tQKdT8a5wcvb+d0EB+R6m5dJxoLQRy7FyTkY41BpktYznwKBP+PJmsRqRcLXBnpMsPNvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsy5q0/VaLju5Diyg+8jD2t8kr2HDKyCbPeWDt/J4wQ=;
 b=WKw2ru2dYc+f66FKVVdn9YTO4JXrreL8MVbTemcbe75A77BGcncAAKeby3yp0krfrWwjKzAad4isQvMVHr7+ObpPMrPLq7l+CK0hdB2pyO28qfIl5oJuoZbI97GTeIR33iEd1Ice26z3cO+478Engcy4cQACp7L1fbz63B91d9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1343.namprd12.prod.outlook.com
 (2603:10b6:300:7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Thu, 9 Dec
 2021 15:27:25 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 15:27:25 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
Date: Thu, 9 Dec 2021 16:27:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0059.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::34) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:76cf:54fe:ebe4:b83c]
 (2a02:908:1252:fb60:76cf:54fe:ebe4:b83c) by
 AS9PR06CA0059.eurprd06.prod.outlook.com (2603:10a6:20b:463::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Thu, 9 Dec 2021 15:27:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 895a5197-d144-40e6-dfdf-08d9bb28670d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1343:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB13437CD962394AC7C066331683709@MWHPR12MB1343.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KrETBhYdPN/T7cdOdvouXCgh7nMaAxseNbtbaWDQQ0hqOCLipCTHQ3PJ2Kdo4p+dNt38zMohluXcMTSZVPY8BFA09Vw5mfEMPLMDuZ9/cvOmqGWT6KHLkZH+tGb3xkW3FXnjf9eH6OEOhSTEG6PO7wQ8crcmr6ams7YKM+LlysJkIqpg/GYg2lyM7ZoOIBKFn3PPu+s2aJszkk/dINY1S4SsF965EBCpY7iQO396/W0e3AmEuZqJ1za1tNXA4TtoY/DUa1/cYTXdztmDoUPMzQvCpOv/2cLb8O4nGgVQfLuM7bZ6M00YU9MbeLg3TqpCThPUvcTarLxfPQWDqOI5gz4CQTgN5pVVzs34XrlOVojQZhxJK9YgiRzy6KF8a7WLgaDjRgi2c5rQA9v/ZA89bBvuGrifGv5uBI/cjEuo7lpRKb1uWPNiBk5aYP8O7HNeB8/ipSmXRb64bm0J6cvU1l8Gt8LaGFGOdlkx6FYynFklWPp8W4saB6HFHxrMSfYA70EH2Rx0U0JHObJWNLKvgZinXZ3zbtTTO4vgcfKzxdt0btsWAhrT55/HhudfDWSTW7AUnWhezhMm85UfPupLDX/RscTUpm9+Id6il8INup7cPLV8wDYlQpY0jJMhWsTRbhjqZt/iB+c8DCNUEv7rXwb6NLRW9qcaQh4Qqh0nv73SoztzePv6Lb2ZFYHswv/dGv7nVRfFzRlMfIcGcGGiVoR+L2x2df3cuBS3of6JPe+DNVxRbUI6lZR468d5W4ks
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(86362001)(31686004)(36756003)(66574015)(2906002)(4326008)(5660300002)(54906003)(66556008)(8676002)(316002)(6666004)(2616005)(110136005)(6486002)(8936002)(66476007)(53546011)(66946007)(38100700002)(186003)(508600001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U251Qk1ibThaSGsyVzFIZ0FBTmtVQ1dQVVF3a1Bydi80MEN2SVByTFlLR0Fr?=
 =?utf-8?B?cTgyTDI0aUkrWUNsTTZ6aHVZWG9LSkhMRTBRdlBxUzhrMDNseVB5RERtK3hV?=
 =?utf-8?B?UXAyY1dnWDE5T2NIMGpoRDE0eDNCeVJnREZLSkYxcVd2NytIT21iTGkvN3VS?=
 =?utf-8?B?ZEFKNjZZMFlhQld2VDJNWFA2c1dOMEdlU1ZleS9DdTFCRDV1WFAzbHFkaHdn?=
 =?utf-8?B?QkhMc0ZJbXcyamFLMFR3cHoybWpyT0VSVUtQWkdrNXo3eGhLQklkNTlvcWlX?=
 =?utf-8?B?M2N2d3lFWGltSHB3S09LOW42WjJ3YkFlTHkxOVlSdkYzSDNkeHFQZmZMNEI3?=
 =?utf-8?B?RnQ2ZWpKOFRnUEczcUlGRlpmY2RKOER4cW5kRXFROTdIT1BWMDBPb0JaKzFX?=
 =?utf-8?B?WXQxa09tbDc1TjNObTRuelcxWGFXL2ZQZFg4RlcvekJBdC8zYVVNTWJBdEt1?=
 =?utf-8?B?cWRSb1htS2sxQmgyOHprb0Nzd09qWnBHeUxiZnQzdzVqOU5EY2RtYWhHaWdX?=
 =?utf-8?B?cno5bXM3Qk90cGgvQ1VZeFA0Q2RCV2tDTG45Tlc0WjI5OVlweWc2amNGK1l1?=
 =?utf-8?B?T2NYckNZengvM0JrS0J4VnQ0WUVFREtIMTZPOWk1czdkS0wrYkNVVlBpZjZ4?=
 =?utf-8?B?QTRxSGtuZW85cENQaVFyN2ZOUmdrcVZmMnM2WkdpQi9EMUhmN0VjcGhZME5W?=
 =?utf-8?B?ZUg1a2Y0YWhIeDZadHM5dFN4LzJsNk1nN1lJTkwzd3dCUldMYzdEM1JPamVy?=
 =?utf-8?B?T0hxaXdZMlRvVllWTk81by9YNExBRnE4VmxEMHRpN1I1MFZmMnJCN3dGeC9h?=
 =?utf-8?B?UGN6MGV3TDY2N1FrQzhnVExlMmMrWmxaUjgxZzBES1praWpIR1NSeGZsbEJY?=
 =?utf-8?B?dVlzUjNDUEpqVWYyb013Q1V1TjZUV3lkMzIwMVB1MWZCWkxBUTl3dWIvOFl6?=
 =?utf-8?B?blFSUmZLMm1DcDNJSitwRlhUbk55OVFMODlhdGR6b1pHNjI0RmdRNGVzTnZH?=
 =?utf-8?B?MlQ3d3FzNUxLeXZZZ1VISzBLeTNmTkZsaUpKM2lIYXVuUURQcWdjakJmMkli?=
 =?utf-8?B?OVJ2eTQ3dngzbTU4UUVLM081cUZ5bEJFWTc2eHdsbkV2NW0wUUo3Y3lsaHFS?=
 =?utf-8?B?bzNpY3ZFMFh3ZUo2RmFtN2RuZkk0VWF0Ni9uNmg4WGNSTnJZa0MxSnpoQkxY?=
 =?utf-8?B?S1UyWWNOMEo1a0psdlMwNm9QWjdGT2NEQUhWWStLUHorZ0R6VXVyU0hjZlpl?=
 =?utf-8?B?R3NSWlZoRlQzYVlvTmg4OHR4dVM1S1Jic0h0eVBMMnRIUVBJcTdVRlVUekVN?=
 =?utf-8?B?VTNBdVoxVE00RnJ5Yk9CV2xSd1RsSldmcjdYVjZIQjBYdmkyM2tzV2xscjAv?=
 =?utf-8?B?bS90ekRDSEEvT0FjOTU5MGZKbkk2dmptSjFBNGpUMTNBckJ2ZnBoUUJsemF0?=
 =?utf-8?B?UURBR1Jrb3pmQ3ZmbzZ5WExvY1A2Nkh1bElUZ3VnZTV3bEJOdjJ1UWlHWFNJ?=
 =?utf-8?B?RmFVMVVTUlVWRnFFbE1XNno4b3UyL2xEdXYwYXdUYnVJYTIxOGU1VXlHMUN6?=
 =?utf-8?B?S3NmT1NSdlhEVDZGY0dmN1ZlMkxqbWRSalR3NEtXYzF5Q0tuRlRyVDFGWmdW?=
 =?utf-8?B?RnArSjhMZDErMzNqV1B6NHdpT0NFRXVwZXdsU1hPdmNtVFFBakxHOW43Lyt4?=
 =?utf-8?B?QlorYUpxZDhMdUYxZzVvU3dEVkhkSUFMaE80Vmhqd3BnbWNlMUNLN0J5Smgw?=
 =?utf-8?B?WFFScTdvQ2ZEQTcwZkF5Yy9ET2NoY2FLZUtKWXpneWtXTDgwOVJBbzd2bU4y?=
 =?utf-8?B?SUNGZ0FHUTZIUFE5TXVHMW5UcVBPaXIwUGMrRTBXYmNHZFZyK0FZaVlaVWFv?=
 =?utf-8?B?em9BNkpSOEVFWE1JUHZHYXE0cFZ4KzJVcXZJVTZxNDNZY0VHOVVNOWd4TkJ2?=
 =?utf-8?B?bjdUN05hZEt5bTZZZWFjaTF1dVdINXA2dkpYYWNQdHJIbk5mRXdnbmRibDhI?=
 =?utf-8?B?OGRHdlpGVzFhaHFPUzh5UU1TOFN5SFV2c0FqU29SOXlzRFBhdEE0OTdQRVR4?=
 =?utf-8?B?WnpKTGdzdmtoQkxDeExnVGw1dHBwV1NQRkZ2dWFoc2xCUEdXdDZSaks4Qm5L?=
 =?utf-8?B?SmRKNUEreGtrTnVkSk1wd1FHUmtNR2xCV1JZOFdRbHUwTU5xWU5MUUY4T3NZ?=
 =?utf-8?Q?x28DPGLharOPAehKZzGi4aU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895a5197-d144-40e6-dfdf-08d9bb28670d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:27:25.5322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2NPhwYHcyayk+YXu6YwBrPISF22s0hWzlLTezAI7xWSBWPCUgDbc+ecO8NUTc0X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1343
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

Hi Rajneesh,

yes, separating this from the drm_gem_mmap_obj() change is certainly a 
good idea.

> The child cannot access the BOs mapped by the parent anyway with 
> access restrictions applied

exactly that is not correct. That behavior is actively used by some 
userspace stacks as far as I know.

Regards,
Christian.

Am 09.12.21 um 16:23 schrieb Bhardwaj, Rajneesh:
> Thanks Christian. Would it make it less intrusive if I just use the 
> flag for ttm bo mmap and remove the drm_gem_mmap_obj change from this 
> patch? For our use case, just the ttm_bo_mmap_obj change should 
> suffice and we don't want to put any more work arounds in the user 
> space (thunk, in our case).
>
> The child cannot access the BOs mapped by the parent anyway with 
> access restrictions applied so I wonder why even inherit the vma?
>
> On 12/9/2021 2:54 AM, Christian König wrote:
>> Am 08.12.21 um 21:53 schrieb Rajneesh Bhardwaj:
>>> When an application having open file access to a node forks, its shared
>>> mappings also get reflected in the address space of child process even
>>> though it cannot access them with the object permissions applied. 
>>> With the
>>> existing permission checks on the gem objects, it might be 
>>> reasonable to
>>> also create the VMAs with VM_DONTCOPY flag so a user space application
>>> doesn't need to explicitly call the madvise(addr, len, MADV_DONTFORK)
>>> system call to prevent the pages in the mapped range to appear in the
>>> address space of the child process. It also prevents the memory leaks
>>> due to additional reference counts on the mapped BOs in the child
>>> process that prevented freeing the memory in the parent for which we 
>>> had
>>> worked around earlier in the user space inside the thunk library.
>>>
>>> Additionally, we faced this issue when using CRIU to checkpoint restore
>>> an application that had such inherited mappings in the child which
>>> confuse CRIU when it mmaps on restore. Having this flag set for the
>>> render node VMAs helps. VMAs mapped via KFD already take care of 
>>> this so
>>> this is needed only for the render nodes.
>>
>> Unfortunately that is most likely a NAK. We already tried something 
>> similar.
>>
>> While it is illegal by the OpenGL specification and doesn't work for 
>> most userspace stacks, we do have some implementations which call 
>> fork() with a GL context open and expect it to work.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>>>
>>> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
>>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_gem.c       | 3 ++-
>>>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index 09c820045859..d9c4149f36dd 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object 
>>> *obj, unsigned long obj_size,
>>>               goto err_drm_gem_object_put;
>>>           }
>>>   -        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | 
>>> VM_DONTDUMP;
>>> +        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
>>> +                | VM_DONTDUMP | VM_DONTCOPY;
>>>           vma->vm_page_prot = 
>>> pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>>           vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>>       }
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index 33680c94127c..420a4898fdd2 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, 
>>> struct ttm_buffer_object *bo)
>>>         vma->vm_private_data = bo;
>>>   -    vma->vm_flags |= VM_PFNMAP;
>>> +    vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
>>>       vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>>>       return 0;
>>>   }
>>

