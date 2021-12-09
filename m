Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3BC46EF9E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82A710E648;
	Thu,  9 Dec 2021 16:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95C410E124;
 Thu,  9 Dec 2021 15:31:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yr4PlGnVuD5h93S8Jpvi161fbZPJEK81m4LQRhU65rQ5UW4l0UdPI8kd1H/3UrRUajDmik7zhwivqEqSF2p0vTzOG3zUGnqib7tjX/hZElEaXFBVdrjiXUfF5fudVN430Sf/vHls2P56fiWEjRuoDQhVNUsNfeH3vthLqsT0dagjUhbOLAOi7WALYDKWnec3Wi7qqEP76JfZxo+mdfvg0Kwwk4nXRXm+svNCsPWp9vuEpvo7Y/YRuoHdsolxd79XT/9XzFkfyDUAYxT45GJ6dUeDWGWQXXwBljfHA9LsYEYXdcjJ9jpJ/LiNB5XxdJNBpqbpKato/nLP1EuhMASZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BnzYWrOeQQNFM6DlQCUYWUc6Qp/9FjS0ZRYiEt2CVM=;
 b=XxxePYWajmEMMe75O0SBX7l9bI6Dh/e1n+78+OtqzAI/hOPteLeVH6ThA0muVfQGaO9DUOELm3YLxsn0nzVJHGEHM/Z/zSqgNzwU4b6F3qpX/KLgje/aadowt3xOPpgMXv31Ad+LeQ1rC4HS69PfD8URqwJuB6uG5Iilzi1zSFhynpnd4/zH1/Am/34+hiisPZJlDr/upHgQY40bZo4BYCNhyDJWPKGrkG1yek1jmX6NmDUMFbrotpW0/4JcsOHNt3XjGWaeWsO43YEFQPSFDEC3/WyR/LM4JxeuoduMvyvJnipCrVpV7Cq6BHd9qJIDy8xDAkzKdF9VIBtnDikX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BnzYWrOeQQNFM6DlQCUYWUc6Qp/9FjS0ZRYiEt2CVM=;
 b=S64Sss65f3Jt6JTOjaYzS860Jcno4y9bFUbuQ2onoZaR/wVLgtVjiNIY/PvAvfkRR1UzvuruRfnUMHTtCyYenXLycmVUn9bZDMfbQFJlryYmmP32FSplzoUWOpnOk8eKIXoSHlX0s76DaYMZI5bsObfV3aY2PcI91xlj58QWh4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1613.namprd12.prod.outlook.com
 (2603:10b6:301:11::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 15:30:59 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 15:30:59 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
Date: Thu, 9 Dec 2021 16:30:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:76cf:54fe:ebe4:b83c]
 (2a02:908:1252:fb60:76cf:54fe:ebe4:b83c) by
 FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 15:30:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5bf73be-90f4-4822-db33-08d9bb28e662
X-MS-TrafficTypeDiagnostic: MWHPR12MB1613:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1613DC579FBC6B712CECCF2E83709@MWHPR12MB1613.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: usllmwO2Z3gplQmHP2ViJv9+hU92BZUjIxmMXPqezFvspUTsPMRTaxZvcQNovWErUrt84g2mkhk2RGANv6pK4ZXOuT1d6mxKI3MbI3STkDSn2dmTGTXIJpeLUT+qmf4maX6c1auJjqUdYpY9aax7PIrGICwtPe7ZiOr7Zdv+Ld6c720J6EF4QNASHw5qtdxkQPD7Oe4c3c0vDgC6xFKN0BtnIYOw+v3tbCUxWTSBoAIUL1YeERRWbQM9o4vuIxfTZv6DoaZnxfK3pI9UnXFDpY7wj3LEuaVvmgRg+no3ndfClLLIFQcfzQh3+Utnqa+PX+ibBnd9SEiBUz3mSFjbWZfuYJ65/w2HlPcOKlOQtXySXSfz/o0JKgApihN48lY6GXLeLZ8YkOTRSBjZiAA3iyp1VXiI7axn7hS5BqFFaht39pH+AaAz08tAp1Qr1fwPgItydCMpvNqhc+S0lXLmySruA6ZzNAXRv0ksWF+mq7jV0hKCDd6pEpn0BybaVXbRwwRjkjtILNzNcPV9nZhoz4rO4EsfmhmNC/Hr3puqLAFGRQvr/Bh51GZN4S22VjkfUp74dCC8ZNkz/suyVB1WYwhjuOqPOTforgOhB+uutKsBRp4aPBaWoODnIHgZjRszNKmUIKqMfJkJKgG/w1OiSP018d80pcAgIBz/DRpqFDG2t80fIXbibxy7tc2haFKAaoIJ2X+75T+pOr0aU5axXlM18fprjCsvY6pz42QENaw146IRiRBjhgEdsLUqu2hu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(38100700002)(6486002)(8676002)(186003)(66556008)(6666004)(66946007)(66476007)(2616005)(8936002)(53546011)(31696002)(4326008)(31686004)(110136005)(54906003)(316002)(2906002)(66574015)(508600001)(86362001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjhnQ3IyaFJodkNjYXlQYUd6MTR3K1lCRDkxWitoSXZUOER1UVlNMkNET1No?=
 =?utf-8?B?QXFNREhoRzgzNGFsdTZTdVIvak16c1VBVGF4N3FwbDZlbjN5bFlqU1dHTVNU?=
 =?utf-8?B?TEcyRjdwVUxnRnhwUXZYeHJKNktwWEVvMTNzd3VsZ25SdXQzUmRmK0lnMXZB?=
 =?utf-8?B?U1c4RWdPTWxKUGtnK0hsZlh3N2lZTjRqV3FGdUlsbWg1VjdXc2tjbTNhNUl6?=
 =?utf-8?B?YUVWY2NrUEd2YlY4VGJTcmduVUFoS3pzYU56MXBNVWhHZ3AxSVlvdEFBVEpk?=
 =?utf-8?B?KzFFYW92TytMQlRTSk1ESHIrYzVGTTZSU05XMVB6ZU95U3p4V3loeFhiWHY0?=
 =?utf-8?B?V1Y1Q2J0YU5IbkdvWExFOXo4Y0xJRG1ZYlpadStEVy9EdVNFSkpSWWNncUsv?=
 =?utf-8?B?UGRsSVpOODM3TWtzVGJwKzV5ZDg5d3BDSmFzNXZhWlN0L21rZ1FQNUhoVitP?=
 =?utf-8?B?Y2FENE5WZHliRnVtRFJKVFJBN0FKZUNxRFRvOHZJRW9CYUNUMnk5YlF5dy93?=
 =?utf-8?B?NW9tYldMVTY5NWZ3dW1zTkptMExzaDVDK2p1VUo4Z2dVM1RzWkdSOHJ0SXYv?=
 =?utf-8?B?UkIrcGJ3bmZ1TEI1d0JGSkRxVzJodjgvODBLSnR5c09JQ3k5R3NXaUJFemQ3?=
 =?utf-8?B?K0VxSzJJKzBIK0JscFB2SkhMMHFtU0EwTDVCRGhTSkd3cmVTSzFDblhzSGhW?=
 =?utf-8?B?TFp5Mm91Z1hyc2xLaTdicEU0WmFZN3BTK1paRnA5d3JsVU52aHQ2UHZpMnlD?=
 =?utf-8?B?dUxrMFJCZElXSEVWZkp3WFRvcXFSTHV1UFhzRFEvRk1GdG9Yd2NTTnZvNk05?=
 =?utf-8?B?K241TjhWK2xHNGJPRjkwdFhZMXJNZnUxNkdQdktuc2ZYZGE1b0N3WVVuaUhU?=
 =?utf-8?B?OWVrZzcwRUx3QW1wNkhRV3MxOG9PLzBGOFA0d2xvcThWU1J2ZzRMRllHMTU4?=
 =?utf-8?B?YkFlK1k3cDRqL0xaSVBKWmZmOTl2Qnpob2dSYnRxdDNKYjBuZ3pYRmVTQndL?=
 =?utf-8?B?Z3Q1L3Q1OTRadXhnZTl2Z003MUJ0Nzl2akV2NWlDbGRvMjRxeXhMS3ljNjQz?=
 =?utf-8?B?R3NjcWpndXIwVGkrZGlORi9kWFQvRStuT1RtVXVOQ0RyckRpWU1KWE9hUmxp?=
 =?utf-8?B?SUhoU1hFbEhZVjU3SlNIS3lpV1VtWlVqY0s5Z09UN20xS0xPVjU5ampuQlRm?=
 =?utf-8?B?V3lFL0JJMk9jdi9MaWxKdnk0ZXJkcnBnQlk3T3Z1emI1Q09uUHdCNC9FeTVu?=
 =?utf-8?B?WXR2R3g2NVlhMFdsK1JKTjU5Vnl4NkhqSk4rMWszUlVQR2dsOWlxSXJhTzlz?=
 =?utf-8?B?c1RxSjFZeUlLUThueDhNWmNoaVVmTVpYNGIyTmJqM3I2eTlXNWg2Y0ZzOFlF?=
 =?utf-8?B?dmZpZy8xTkQvUUxWOHErbUlMeTRXSTBEZC9ObU5OeThsdHdXWnZlNTc3dHhC?=
 =?utf-8?B?Z2xWWjFkQzMraDY4RWNnTWx5MElNUEZ0TnFZWGtTVGtwN21FOUE3emw1VEhE?=
 =?utf-8?B?MU9ldXN2NkFMNzlDNlRkVzQrdTJ4alFGZkZNcmwxTmJDU2E5TE9OSDVpemUv?=
 =?utf-8?B?QzFiQ0Z3RWVJRWxaV25XWElBTHJiSWVybHltWElQNFo0YlUyeFFUT0hyMmpN?=
 =?utf-8?B?V1loM2syai9nMyttVnVGUlE0bENFZVhFa3lkbkVUNlZmS2NnSlZoN2xZY3lO?=
 =?utf-8?B?TldWQmxGSVExS20yc1cxV2ZaSXlDV1VuUmlPZlloZ0lFOEVDRkZTZCtJVE9s?=
 =?utf-8?B?d3ViREhCZjNxbm84UHRRWlNVVlhnZjYvRUlxUU9hN2x6VzJFT3ZhaVo1U2pn?=
 =?utf-8?B?K205cUhxWFdMbmxOMnY4YlEzTjZENy9kQkVWTjJkZUgxSVE3VnBOK0lPblow?=
 =?utf-8?B?cGxsVFZ1akliaHZWbURkd0FwRXVtcXk4clJocVBsOVljb3hHYnphbUltSXVU?=
 =?utf-8?B?TVMzNXFCZ1MxWGNmMmlqUURrTXZsQjhCOEovK1ptMlFXOWRYMFhBbmVzYmE2?=
 =?utf-8?B?VTBvUnlNUCthTnVMZFp0NmhwNVJFZjRwVW1mN3dwQmMyU0FZbWJab2xBdWNs?=
 =?utf-8?B?OEFMMkthbmo2S004WnFaNFBxVW0xUnB3eU1QQnB5d05QMFhhVU9Vb05JSmVm?=
 =?utf-8?B?aS9FQ004TVNLTmtDZldiWU52dW5NZ2gwWWIvYUtmdG01K0Ftdnh6aXJncjVX?=
 =?utf-8?Q?t7ZgphbiRXCwYxj9ZvQU4XM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bf73be-90f4-4822-db33-08d9bb28e662
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:30:58.9699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1H84kD5vbeJ74pKkdbh/38QCgMHFXgRRTjWS3HH9q2WdeEyxoq7BOenvtIrRums
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1613
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

That still won't work.

But I think we could do this change for the amdgpu mmap callback only.

Regards,
Christian.

Am 09.12.21 um 16:29 schrieb Bhardwaj, Rajneesh:
> Sounds good. I will send a v2 with only ttm_bo_mmap_obj change. Thank 
> you!
>
> On 12/9/2021 10:27 AM, Christian König wrote:
>> Hi Rajneesh,
>>
>> yes, separating this from the drm_gem_mmap_obj() change is certainly 
>> a good idea.
>>
>>> The child cannot access the BOs mapped by the parent anyway with 
>>> access restrictions applied
>>
>> exactly that is not correct. That behavior is actively used by some 
>> userspace stacks as far as I know.
>>
>> Regards,
>> Christian.
>>
>> Am 09.12.21 um 16:23 schrieb Bhardwaj, Rajneesh:
>>> Thanks Christian. Would it make it less intrusive if I just use the 
>>> flag for ttm bo mmap and remove the drm_gem_mmap_obj change from 
>>> this patch? For our use case, just the ttm_bo_mmap_obj change should 
>>> suffice and we don't want to put any more work arounds in the user 
>>> space (thunk, in our case).
>>>
>>> The child cannot access the BOs mapped by the parent anyway with 
>>> access restrictions applied so I wonder why even inherit the vma?
>>>
>>> On 12/9/2021 2:54 AM, Christian König wrote:
>>>> Am 08.12.21 um 21:53 schrieb Rajneesh Bhardwaj:
>>>>> When an application having open file access to a node forks, its 
>>>>> shared
>>>>> mappings also get reflected in the address space of child process 
>>>>> even
>>>>> though it cannot access them with the object permissions applied. 
>>>>> With the
>>>>> existing permission checks on the gem objects, it might be 
>>>>> reasonable to
>>>>> also create the VMAs with VM_DONTCOPY flag so a user space 
>>>>> application
>>>>> doesn't need to explicitly call the madvise(addr, len, MADV_DONTFORK)
>>>>> system call to prevent the pages in the mapped range to appear in the
>>>>> address space of the child process. It also prevents the memory leaks
>>>>> due to additional reference counts on the mapped BOs in the child
>>>>> process that prevented freeing the memory in the parent for which 
>>>>> we had
>>>>> worked around earlier in the user space inside the thunk library.
>>>>>
>>>>> Additionally, we faced this issue when using CRIU to checkpoint 
>>>>> restore
>>>>> an application that had such inherited mappings in the child which
>>>>> confuse CRIU when it mmaps on restore. Having this flag set for the
>>>>> render node VMAs helps. VMAs mapped via KFD already take care of 
>>>>> this so
>>>>> this is needed only for the render nodes.
>>>>
>>>> Unfortunately that is most likely a NAK. We already tried something 
>>>> similar.
>>>>
>>>> While it is illegal by the OpenGL specification and doesn't work 
>>>> for most userspace stacks, we do have some implementations which 
>>>> call fork() with a GL context open and expect it to work.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>
>>>>> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
>>>>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/drm_gem.c       | 3 ++-
>>>>>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>>>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>> index 09c820045859..d9c4149f36dd 100644
>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>> @@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object 
>>>>> *obj, unsigned long obj_size,
>>>>>               goto err_drm_gem_object_put;
>>>>>           }
>>>>>   -        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | 
>>>>> VM_DONTDUMP;
>>>>> +        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
>>>>> +                | VM_DONTDUMP | VM_DONTCOPY;
>>>>>           vma->vm_page_prot = 
>>>>> pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>>>>           vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>>>>       }
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> index 33680c94127c..420a4898fdd2 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> @@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct 
>>>>> *vma, struct ttm_buffer_object *bo)
>>>>>         vma->vm_private_data = bo;
>>>>>   -    vma->vm_flags |= VM_PFNMAP;
>>>>> +    vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
>>>>>       vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>>>>>       return 0;
>>>>>   }
>>>>
>>

