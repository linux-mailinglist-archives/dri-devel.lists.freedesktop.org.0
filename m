Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C847B2AC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 19:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52D411299D;
	Mon, 20 Dec 2021 18:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2194711275A;
 Mon, 20 Dec 2021 18:12:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgaKb6JLqe1c5+cWZQDyk7cB37NTvIRYKKS4sNauZIQbH9uUSngI2pdgEExIfqapwh2n6CKt2B6m+75lToK6OUM05MuQ9gMARku/zVcgM98Cq1eRsN0js5j3VE1tQE9xj5ErYjeLuTd2kPatEPdZzKtB4YqDNAL8c9GrwHzkk2X8/Y36TaSnfu6Q57/Gvubw1FwczD5IOsN7VIgtPUOMZQ8MNIP5gT5xr/lzcZGRvZVPNF7OiCdViyI6JIyprygVtLENQINS+5cEZGLqTjyMmezb4HnF62Z7Z/OeZQzMh6o3V1N82EdF1L8HJp3s/PX2pOS3yRj60b4Pw6T9jOG1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtcIqKNiBqgkZOquaP97Qo7A2tJnrWZogcPe2cpqBwE=;
 b=i1JYRZvbDTEA25x7uNyN+XLohd1b/DA6oBG2eZA0E303WYpoEtHcjJkQN9miWhasF9UBCoO2z1Z7GJRL2YAIXuoMtguj8v+7WFZhcuOk3rXmAgSvb7sDgSDqUZIk/rGfIWJp0zGkuETTpqs80wtAfIrqFAM/UHYtUsOuWfBfLa08PQrTJhYk9bMNprsyzS6X02khlrl0CgVXCWv9DRCch1jUjjihIVm/0VWeyzKi1MVmXDvin95oOVyGc5NEQx/t2MzKFRjf0+4VYqwtODWSZkL4Oe0kWJGGF1aHzGMi1/vvM7t9Ygwg1oUnBSBAsgtf1A6ZRUu7PPN9R6QXB/LrlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtcIqKNiBqgkZOquaP97Qo7A2tJnrWZogcPe2cpqBwE=;
 b=dFBu9GoJIo6kSPKJfkrwXa4UnnHsnZze+CnwTjoiJfVrpaAItizKnzibRkAi0H9yl45RZ76mKpmjSafc9hR02PZYkEvM76QDOIiEjaq6fZg5Y89JHOZgnpcv0cEgoKeaJl0qoh2YoTr3LmxDqsoYh5zpmIKhB6PX3eioBF1v3ec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1531.namprd12.prod.outlook.com (2603:10b6:4:f::8) by
 DM6PR12MB3193.namprd12.prod.outlook.com (2603:10b6:5:186::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.17; Mon, 20 Dec 2021 18:12:55 +0000
Received: from DM5PR12MB1531.namprd12.prod.outlook.com
 ([fe80::5d47:d509:84f9:299]) by DM5PR12MB1531.namprd12.prod.outlook.com
 ([fe80::5d47:d509:84f9:299%12]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 18:12:55 +0000
Message-ID: <9d1030c2-2269-cfdd-bbb0-9c3d5995841a@amd.com>
Date: Mon, 20 Dec 2021 13:12:51 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
Content-Language: en-CA
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
 <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
 <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
In-Reply-To: <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:610:52::23) To DM5PR12MB1531.namprd12.prod.outlook.com
 (2603:10b6:4:f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7214b785-3c80-4b4c-6bce-08d9c3e457e5
X-MS-TrafficTypeDiagnostic: DM6PR12MB3193:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB31936D9AC44001DA648C1AD1FE7B9@DM6PR12MB3193.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TDUTLg3VA1XxZ3bGkTN8UO1XFAwe4V9OBgJUvkwBHQd7uUs7TSDDrizwiUPLiuypKDAVhndSUqBqetgpcEJIf0PO3InWLgW+jm0HTCps/+ZoWjKj1hklIG2Ypf7lDYp0RpOZfdPPphLCeXsXIW2yIXnBzSdDJqc2MzyDF8+yDpG0pFIU6wbJ5sgbTwE3XWFbil+de3gypELpql3sswikCHQZ9mx2mfWUHjtgJtqx6cvC6KpipqLMKAjlDugvGI2YYjrmbt59mAKCIzcNvwwysTRWlbn+yTft6DZQlV6enkIzVqGkMgLG7rWhvQL0tAAqnkynXH0k3HOsJ1nLdbCIVuRRF8q9eeg8ZpFbAHyzZ6LFDqPXkVlLWRRKsjs6yZbNs3l6gMHG4qPdf5h6U44syrDAsZFSHezK06yPI41/veupd4ZG1ddSVCIu+fJ0OtYvXBvt1rJ6DYS+OGi6MJBEb5dDWVtZuKCeboQYnNGQK2ofEq7xoIWbLtUJsJaLh2rf40FAVumpWQ0+QeyDQs2TTvUB8AUczgVLpxQg3Z/fUwRzpvtp+yTYOvAN39F5etM0jrezuXG1170F9F2wRfwIYPj++cMFgh4e/5+L8/huMQkW138JIBcGU0nzyb6BwhgQLeYuSmQI9w2AUHvtFsqaqx5/SiViQHrGfnWxWKCNWUqzLbW762gvWbPaHDa5H7F2ZsSQiYZS2MIt6FdK47hM+L34J7YBm/QV8YLhfNW+jzvO7600xHD8epwZ06VpoqfZ8NBUX7dzZKcb+Q22khvyYF8z7YRzEBFyIZL6yb/gjymKgHZ/8gkRYJPqoSJp3UZzrlofgx4Z5OcxxidvsZgc+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1531.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(6512007)(2616005)(4326008)(38100700002)(66556008)(83380400001)(66476007)(66574015)(966005)(66946007)(508600001)(26005)(6636002)(186003)(5660300002)(31686004)(6506007)(31696002)(53546011)(6666004)(36756003)(316002)(86362001)(54906003)(2906002)(8676002)(110136005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3VXeHVTR3JQc1ZQOHh4WDU5TVZrbUxadzhzM252WndEV1lXSmpyL1JIZk8z?=
 =?utf-8?B?L2Zab01PeWU2Uk5ydVgwSTJHVEJrTEprdk9vaEpLOFlnOHFGZ2RUUUVrTjFF?=
 =?utf-8?B?bDkwditJZ3UvN2JKMnNFMVFKQ042NDlYekwrcFpvWU9aT2NnK1V3M1A0U2tT?=
 =?utf-8?B?a1dSSUIrekoxcG5mcjZmc3JHQlhqVm8rMEpUTWVXSTRqN0E1RnFoVzVzQVh1?=
 =?utf-8?B?ZDVjYzl4QjQ4Nm1xSkdzZVRIOGNUMThzZU1Tb1BGK0VZUE1hcVp5ZEc0SFk1?=
 =?utf-8?B?aFNiZ216eU9lZVBkYzZxNXk2NC9kbFFzYUVhNmlpZlNSeGxWWU1Mc3VvaUpR?=
 =?utf-8?B?b1M3TlhwTVVCeHFXTFZrRGMxSEs4R1I2UERaNmxqTU53amdhWldXUkJFNkpX?=
 =?utf-8?B?djd1MnI1OCtNOFRBckR4eGt5cWZmSHRwNUVxc1V5eXk4VlZ4ZHVQVzdhejgr?=
 =?utf-8?B?VFFlS3BxN0lFVWpjbC9sakFNVU5SV2c5MUIvbjVMYjU3ZG90UHZjbEhnNCtj?=
 =?utf-8?B?QTRxMjNiaUk5aDhOQ2htRVVMcHdjaklZaytMNW42SE8yMDBiNHliMXVORDZ1?=
 =?utf-8?B?OHh1STVhS0JWQ0p4cGhVSVhRNFB3eVh4SHJHVFJlWkdKM3BNSVluaDVHdWJQ?=
 =?utf-8?B?MDFYbnFlejN2UmtuTlZNK0hCNkVmRWZlNDQwNm4xYThRMmN6M3RPYUdWaEVC?=
 =?utf-8?B?UFUybUtzV29TRytDMDgweG5HTm1oV1VvQzMyVzE4S05UelZ2Si9WeFVvMmhY?=
 =?utf-8?B?QkYrZTVUbGZ0SllxYnlJYktTdjJXSm10RHRITEF3SDVGTlZkWDBNaXBKYXdm?=
 =?utf-8?B?MmNzK1M4TWVIR1N4L2tQbGNTU3VpNkRHY0ZlUVpGMG5tcGFuOFUvQVluTFUw?=
 =?utf-8?B?dk14akhCUnRDYWh1bGljT3dZRUtPTHRYNHhDOWR0NWMvL0FDQk40b25hNWlw?=
 =?utf-8?B?eGVLMnB4RWsyQUtxdnV1bFRNQi93ZHNDam8vaHVyL0UrTGxFRHp0Zks3V2I1?=
 =?utf-8?B?b3kwNHFwSE1reXUwTVpTeGNIZDM0czBmMk5ONlQ0eUFpdTRubUgzU3FhTnY3?=
 =?utf-8?B?S29TME9vRk5JZlV6RVRWaURnc1hHRjM1SUliZzVJaTBlakZIUXFDVXhyYVI0?=
 =?utf-8?B?WjdyMDE1MzFvRWM1UXRocDEzbjdYTG9yRVExNVg5Qnd1NzU5U093bkwvRnh2?=
 =?utf-8?B?SGlhR2Jac3k4Q0JiMCtKWkhXNUhIOWpydktTbW9uRnBxVGhGbWxEVVBSdVJu?=
 =?utf-8?B?N0dNWmliVmxLOWpERVdkUFdvZHQ2M3FXa2kzMjJnOS8rTUZYcGJvWlhaK2VH?=
 =?utf-8?B?MGp5L3U0cjlsbmRSdk95M3lnajB4UEE4anlpZ2FIRTRuMWRaeEdGbmtRUlFZ?=
 =?utf-8?B?bW1XUFpISkl6MGpqaDZhRThWSHR6a0s0QWFPM2JWYytXenZUYnk3ZnllSng5?=
 =?utf-8?B?VDBIcVdvU2pMOWpndjliU3JBbVd4a1lWaStzSWZpNFlvSlJMcVdDdGVWUWFI?=
 =?utf-8?B?dzRZMHB4anlBWGlXVjd6Z3dpUlJ4T0hhZFdFU283Tk94YlBLYkl6bjQ2cUUx?=
 =?utf-8?B?c2hPY1BZUFNzeDdkSThyenRoMjZHUTkwUzRSYVlySk1pSnpNaWgrcXd0VGdL?=
 =?utf-8?B?Z2hKNGlVSGsxaE81SEYwKy92ck4rK1J5cnNZWUJkYVNqcTJpd0E1aTExcmhi?=
 =?utf-8?B?SUkveGNkeklwaG80VFMvdTdTMTZBN1N3WHJSWGQwaWM5YUgwRlo4SEF6aGlh?=
 =?utf-8?B?RzN6bVNtdnh3VzN5OHpVL1EzRW1sTTFQT2dLelhRa3A0ampDZnZDOUMwTlBG?=
 =?utf-8?B?ZWJtWG5LV2R3WDQ4aEtHcmUraGt3Sy83Mlp4TWwzWjFXWXRNejJRdmVrWkow?=
 =?utf-8?B?RkJoZkh6ZnM1TFppSEVTOHhaTFdxZkdCVFdFNEswbFNna0xCZWlVc21ldGZi?=
 =?utf-8?B?eDZQYnE4V1FyUkE2UkV4Qk9Ga1hTYnp2czMwZWhRbSthbHh0LzUyeVJlUStG?=
 =?utf-8?B?dGc3L1Qyd042WGw4a3g1V3JFQjR6Q29BZEtjVjdrV1k0eWxpZkVuYXdxU3FB?=
 =?utf-8?B?S3RFR1JZZHNGTlpRajc0aVB3djhBczRDMG9OQU5wbml4cU9RQ3RtL0hJL3p6?=
 =?utf-8?B?YXRFODNxOHRUUURvRUdXbENrVE9qaEtCdW5JLzczOC93SWVFZkhFTC91SXNi?=
 =?utf-8?Q?c5Y4F0thcfCCHQVzClmRXII=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7214b785-3c80-4b4c-6bce-08d9c3e457e5
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1531.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 18:12:54.9626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Katu74mNdVMi5UKHwYqiDXL3i2M+5ViylielMuf8+ey2Fqv1ylj/A3DG31l6T2aW6ZBGqDPZC8ZaTtMTwz/DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3193
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 David Yat Sin <david.yatsin@amd.com>, amd-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/20/2021 4:29 AM, Daniel Vetter wrote:
> On Fri, Dec 10, 2021 at 07:58:50AM +0100, Christian König wrote:
>> Am 09.12.21 um 19:28 schrieb Felix Kuehling:
>>> Am 2021-12-09 um 10:30 a.m. schrieb Christian König:
>>>> That still won't work.
>>>>
>>>> But I think we could do this change for the amdgpu mmap callback only.
>>> If graphics user mode has problems with it, we could even make this
>>> specific to KFD BOs in the amdgpu_gem_object_mmap callback.
>> I think it's fine for the whole amdgpu stack, my concern is more about
>> radeon, nouveau and the ARM stacks which are using this as well.
>>
>> That blew up so nicely the last time we tried to change it and I know of at
>> least one case where radeon was/is used with BOs in a child process.
> I'm way late and burried again, but I think it'd be good to be consistent
> here across drivers. Or at least across drm drivers. And we've had the vma
> open/close refcounting to make fork work since forever.
>
> I think if we do this we should really only do this for mmap() where this
> applies, but reading through the thread here I'm honestly confused why
> this is a problem. If CRIU can't handle forked mmaps it needs to be
> thought that, not hacked around. Or at least I'm not understanding why
> this shouldn't work ...
> -Daniel
>

Hi Daniel

In the v2 
https://lore.kernel.org/all/a1a865f5-ad2c-29c8-cbe4-2635d53eceb6@amd.com/T/ 
I pretty much limited the scope of the change to KFD BOs on mmap. 
Regarding CRIU, I think its not a CRIU problem as CRIU on restore, only 
tries to recreate all the child processes and then mmaps all the VMAs it 
sees (as per checkpoint snapshot) in the new process address space after 
the VMA placements are finalized in the position independent code phase. 
Since the inherited VMAs don't have access rights the criu mmap fails.

Regards,

Rajneesh

>> Regards,
>> Christian.
>>
>>> Regards,
>>>     Felix
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> Am 09.12.21 um 16:29 schrieb Bhardwaj, Rajneesh:
>>>>> Sounds good. I will send a v2 with only ttm_bo_mmap_obj change. Thank
>>>>> you!
>>>>>
>>>>> On 12/9/2021 10:27 AM, Christian König wrote:
>>>>>> Hi Rajneesh,
>>>>>>
>>>>>> yes, separating this from the drm_gem_mmap_obj() change is certainly
>>>>>> a good idea.
>>>>>>
>>>>>>> The child cannot access the BOs mapped by the parent anyway with
>>>>>>> access restrictions applied
>>>>>> exactly that is not correct. That behavior is actively used by some
>>>>>> userspace stacks as far as I know.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>> Am 09.12.21 um 16:23 schrieb Bhardwaj, Rajneesh:
>>>>>>> Thanks Christian. Would it make it less intrusive if I just use the
>>>>>>> flag for ttm bo mmap and remove the drm_gem_mmap_obj change from
>>>>>>> this patch? For our use case, just the ttm_bo_mmap_obj change
>>>>>>> should suffice and we don't want to put any more work arounds in
>>>>>>> the user space (thunk, in our case).
>>>>>>>
>>>>>>> The child cannot access the BOs mapped by the parent anyway with
>>>>>>> access restrictions applied so I wonder why even inherit the vma?
>>>>>>>
>>>>>>> On 12/9/2021 2:54 AM, Christian König wrote:
>>>>>>>> Am 08.12.21 um 21:53 schrieb Rajneesh Bhardwaj:
>>>>>>>>> When an application having open file access to a node forks, its
>>>>>>>>> shared
>>>>>>>>> mappings also get reflected in the address space of child process
>>>>>>>>> even
>>>>>>>>> though it cannot access them with the object permissions applied.
>>>>>>>>> With the
>>>>>>>>> existing permission checks on the gem objects, it might be
>>>>>>>>> reasonable to
>>>>>>>>> also create the VMAs with VM_DONTCOPY flag so a user space
>>>>>>>>> application
>>>>>>>>> doesn't need to explicitly call the madvise(addr, len,
>>>>>>>>> MADV_DONTFORK)
>>>>>>>>> system call to prevent the pages in the mapped range to appear in
>>>>>>>>> the
>>>>>>>>> address space of the child process. It also prevents the memory
>>>>>>>>> leaks
>>>>>>>>> due to additional reference counts on the mapped BOs in the child
>>>>>>>>> process that prevented freeing the memory in the parent for which
>>>>>>>>> we had
>>>>>>>>> worked around earlier in the user space inside the thunk library.
>>>>>>>>>
>>>>>>>>> Additionally, we faced this issue when using CRIU to checkpoint
>>>>>>>>> restore
>>>>>>>>> an application that had such inherited mappings in the child which
>>>>>>>>> confuse CRIU when it mmaps on restore. Having this flag set for the
>>>>>>>>> render node VMAs helps. VMAs mapped via KFD already take care of
>>>>>>>>> this so
>>>>>>>>> this is needed only for the render nodes.
>>>>>>>> Unfortunately that is most likely a NAK. We already tried
>>>>>>>> something similar.
>>>>>>>>
>>>>>>>> While it is illegal by the OpenGL specification and doesn't work
>>>>>>>> for most userspace stacks, we do have some implementations which
>>>>>>>> call fork() with a GL context open and expect it to work.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>>>>>
>>>>>>>>> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
>>>>>>>>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>>>>>>>>> ---
>>>>>>>>>     drivers/gpu/drm/drm_gem.c       | 3 ++-
>>>>>>>>>     drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>>>>>>>>     2 files changed, 3 insertions(+), 2 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>>>>>> index 09c820045859..d9c4149f36dd 100644
>>>>>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>>>>>> @@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object
>>>>>>>>> *obj, unsigned long obj_size,
>>>>>>>>>                 goto err_drm_gem_object_put;
>>>>>>>>>             }
>>>>>>>>>     -        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND |
>>>>>>>>> VM_DONTDUMP;
>>>>>>>>> +        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
>>>>>>>>> +                | VM_DONTDUMP | VM_DONTCOPY;
>>>>>>>>>             vma->vm_page_prot =
>>>>>>>>> pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>>>>>>>>             vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>>>>>>>>         }
>>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>> index 33680c94127c..420a4898fdd2 100644
>>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>> @@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct
>>>>>>>>> *vma, struct ttm_buffer_object *bo)
>>>>>>>>>           vma->vm_private_data = bo;
>>>>>>>>>     -    vma->vm_flags |= VM_PFNMAP;
>>>>>>>>> +    vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
>>>>>>>>>         vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>>>>>>>>>         return 0;
>>>>>>>>>     }
