Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACD946EF48
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0281010E208;
	Thu,  9 Dec 2021 16:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF5089A60;
 Thu,  9 Dec 2021 15:23:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lo4a2Ml9DZrT7uNOh3r7gnJteajB0hVt7nt6wZWX2z3XKH6DsGJJCt2At464mI66ZRerUkl9oHqkRb2BSjQa1SExrPM77QcuyIgNSdoGO9PXiU6kf8+LCtZkslX3WnfdL94E9TEzeHz+JsYhmLhews0cAD9c85kcl6avslX7m+Qy/aYZzmBsJ1GQh0BFl4a/wzH1gNjvhoXwhLeXh1cfdDrTso5PwiAkr6q8Ps1F72/HYdLZfdI/izzVawClV0sdUaLRCLESVhC1ciQaNqlBNf3VCXDS/lTTZLsx7ddTXGQKf9U6Pu0xubhWPDXfb+giZyrVQxC+gAP4Q8rgldkfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lhk+RX19xHhUs8jHZ3Qrbz30jfworS5ghZUeM88DFP4=;
 b=AivR6YL9dGK+SRj6V/zHIN4GZhR+wSO5ylFdRfKo6eAHmUDKRFHufmw8qJ4y95lioY05Y8sAo789Gi3SaIOae0PBzWO0D9o0ytpwNS9jjsz+43uIdtkyqWISb97e5OI8Wbg3swlj2m30USHMbPRvDeoXdPzXPK2YUhJLBc8giaPZlt5uhI4JXIEyup1vK34BuIzkJNULP8m0q5Oijf6iuG33aetephCStidcnqtJifTAQxStk8GGJBI6tnl4Cx1BESWb1b5U4kikSMDQmP4jIVrvx6gh2J5gB8V3DRlIK67to0/POkovcahLGJSMyNTSWq0SVkLOse+jIUP4aCClBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lhk+RX19xHhUs8jHZ3Qrbz30jfworS5ghZUeM88DFP4=;
 b=0yNWoqOIsRG/hbd3yHi8JEkkJsVbGTYgOIzGj53dEWHT0zwT1zkSRZ++dLJlxNNEFxVd13C46OWm8aczSHxq/z2Bz8b18ERRcFSUfunIg0UvfnCl+NGrrPpBmkRpAWsDgWlq0GXd0JnpDZ+DJij8m4RQVpSfk168LiOvJ3vM7xQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5344.namprd12.prod.outlook.com (2603:10b6:5:39f::11)
 by DM4PR12MB5151.namprd12.prod.outlook.com (2603:10b6:5:392::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 9 Dec
 2021 15:23:23 +0000
Received: from DM4PR12MB5344.namprd12.prod.outlook.com
 ([fe80::a003:6e33:8c98:790f]) by DM4PR12MB5344.namprd12.prod.outlook.com
 ([fe80::a003:6e33:8c98:790f%4]) with mapi id 15.20.4734.028; Thu, 9 Dec 2021
 15:23:22 +0000
Message-ID: <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
Date: Thu, 9 Dec 2021 10:23:18 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
In-Reply-To: <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0408.namprd03.prod.outlook.com
 (2603:10b6:610:11b::9) To DM4PR12MB5344.namprd12.prod.outlook.com
 (2603:10b6:5:39f::11)
MIME-Version: 1.0
Received: from [10.254.69.150] (165.204.54.211) by
 CH0PR03CA0408.namprd03.prod.outlook.com (2603:10b6:610:11b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.24 via Frontend Transport; Thu, 9 Dec 2021 15:23:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38851cb9-37ad-41e8-ba12-08d9bb27d65b
X-MS-TrafficTypeDiagnostic: DM4PR12MB5151:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5151DC122F8AD171EC0DBB6CFE709@DM4PR12MB5151.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i42ERnE3YB7Ic4tV5aM6JqUpB8nfkHqgqRIgN7fvKVF4dmnrnlGq556W7hqToG2DMXJT1FQVeJiTZ4e6n3Ov9JaZQUMQxEk/wImdX4HdUMzxHHtzsg0utY1G47sV5MOoPXOL8ToDrZzOlXQDxkeI6pdkmpzsT2bwQjWDvKQxT0iSgxbCw37zwsj7mO028pE88OkVPo50TVJ3rNkqYtPQrSq5BCI6j9mrM/zZVBMvvb6t1Mf/yR4bVH1kgQR2H9wk56wPopTM5g8KJe+2HRb3rOA5un31gn7zgHRLt82e/AuqaHQPMbG5oJYgR2Orhf2VxeEFkWleNXOl+6gQWAxzyBtZuhDs3vzuIuHWoU9OaGEL9pKy3PLlSFuko9CGFyoVbbns8rD247Doz1znVmFn+1iXmLeQLSFr5u4z9CM8rJEIzzl09mMA/ubuTVaVaimMs/To0+E8LKuvhSN+v1spz0u/WaCqwCkgUrt/ZJzJs/P8NXQrmNVd75oBVCvfPgn93+eHePBxDZ0IJqyATHTJ9+OQsD+ApNi3rZvVI0JzSjLW9PB3Eptos2qdt/9JQ8k8/P0aKe8aEDoA30UMR5+N+uhz4nZ1ArPDhoe5NchYU+sZjiuh+EuD4Izbf4ZTOghMb5XaooP7MBZCc+zGOnhC/s9vshbAognlVuCVkEIlcRex9Iw6afiZX75/I8qgxhE4ouvnbL65ibVbeqHlOCH7BSoZpyoz536nbUw83lBbldM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5344.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(186003)(2906002)(31686004)(2616005)(26005)(316002)(38100700002)(8676002)(16576012)(53546011)(6486002)(956004)(31696002)(83380400001)(4326008)(5660300002)(66476007)(66946007)(508600001)(36756003)(86362001)(66574015)(66556008)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1NLempSMlZWYmUvek9FdjJVSDRLZzI5TldsY0hqVXNZZTFYSk9ndjNPUkhz?=
 =?utf-8?B?SXZQa21jMXFKY1lhZnJySjEzb29SQTFicG5vOHlSaVFmNDhxakZFbFZDYUdv?=
 =?utf-8?B?M09XdG5JYWNFYzhob2hkNW5lSXZ5UnkrSkp0Q1lhOGVWSnpNK2hDRDRFSjNi?=
 =?utf-8?B?TWNsR0dvUHV6V2N3NDZOV0ozVG9OT3gvTytQTHFWejdhUDlqWmN2ZFBjOFht?=
 =?utf-8?B?c242YmlROU5yTFI5WEZUNGZMNG50N3Ayc2Vra3dxK0R6MHVXMEdiVHpIWWRx?=
 =?utf-8?B?THZibXFuMDg0NnQzeUtGVkRLSHQwWk1IWXA1dVVNbTVNMWpjV3RKY3hoZTZK?=
 =?utf-8?B?QlpmR0RRZENSRG0wQ2dnTXI5UTgwejdKRHRJY0tUWjl0VjIvY0RRbW9yRXIy?=
 =?utf-8?B?aGZtbUlyQjQ2dHJGemdrS3VBTFdLVEROcnNlQ2N0a0FZQ1ZsanI2d1VBd0l5?=
 =?utf-8?B?dlZ5M0hET0VwVi84ZTR1Q2ZIazVlWWR4V2JidDZkbUZtdzAwUEUvTXV6SEd2?=
 =?utf-8?B?M0o5NWp5OHg5dm9ja1F5cEpOM3VxNUp0ekVZTjFIckhrb21ib0hHNndYd0tp?=
 =?utf-8?B?VjlxNmw3ek1aSmc2L0RYUUZIeWdIZkpjcEZPQmZtcDVSbzZ3UU9HTTFGZnRv?=
 =?utf-8?B?WVhCOVVWRmpla1lrMFZtZDFmcnhJY0kvNHlseGY5Z3hGbkxMZDZtRnNWZThR?=
 =?utf-8?B?V2Z1MGFZeDNtUTJxb2pzcm92ZkRYMDhiU1N6V29DMEI4T3RGSWJ5Z3VFUFVr?=
 =?utf-8?B?L2dMSlJuVXlrZWl1b3ppam1PclVoSHRUQThKRWNsdHFRbzgweWI0T1FGL0hj?=
 =?utf-8?B?WEU3R0ZpUHRHdGlDWnAyLzU2cEsyUms0ZkxvMUR4cjlEZGllWk5mSGNuSHB4?=
 =?utf-8?B?NXdCVlNMNmdFUmNHWmNMNmRQOE5sRGxZUXZPMU1TaFQrYXIycEhnVi8rdnpP?=
 =?utf-8?B?WlhzemNVbjBqRVZxclV2clU3b3dpN0dpaVB2MU1oU1NVRm1tUW5aYjNGTGJP?=
 =?utf-8?B?S2FwcEozei9RNExwaG15MVZlQ3JGMFVNTW9ZQ29RbXlkSUhJL1ZlN0xBNXJK?=
 =?utf-8?B?dFNKTGR6ZWJwdE5ROEVYbW8yY3NGSFpEUlRYL0tIeFYyVXorSXNORzJzaGhu?=
 =?utf-8?B?RTJxYjluaHF6eXBsSzJFdkU0bitQTzhjMjRTM0NhUDBuUWJiTExzU2duVkpE?=
 =?utf-8?B?ZnN5N0ZSbUJXNnphVU1ZcUpzRE8zbnA2WUlVMndrUXZORHV1aWJOVDBncXZq?=
 =?utf-8?B?ZjVJRjh3L2V6c2I0ZGRWZmoxMnBFMVAxTVVibUV6UnFQVkc2UHRnb3hwTFRK?=
 =?utf-8?B?ZjIzVFlSQlFlWUc5TTdGOEpWRTF4cnRBd0hkUXdySHZ3MXBVSi9Hb3VoZjVH?=
 =?utf-8?B?Z1phd0l4OFdxK01nZmtyUmpkUUJMdHNLNmpWTzFuYVdWcDZiTW5BQWR5R2FV?=
 =?utf-8?B?S0dmUlpMVERFQlJzZEh5Y3dmdmFyWXpFNjk3L3VNVUYwWWJQVmFXQnNkcGRU?=
 =?utf-8?B?dlhtK1BieVVrbHpxMmx2ZDJEYjhEY1ZjSkU2akNpM3U2TEpyTHB2SlY0OEJx?=
 =?utf-8?B?YjlFaUFyRWhLc09mUTFsMWNCbk5Kd0lhSit2dGQ1NUhXbStPRUxDdFdCeWFO?=
 =?utf-8?B?VnYyT3hGaThReXVhTHh5MzRDTkplQTJ0YUxWdk5sRmNnMk4zRE1NRkR0NzdS?=
 =?utf-8?B?aVdiUWNzbHhBYURIcmV2YW5WK0dmaHZSV1hGU1RyWmdQYjRQYUZYWDlHYnRt?=
 =?utf-8?B?ZFViV0dRMjdDRkxVOHppQ0pmMS9EdXVZZmtwTG1MRDBZS3JtV2RSM0F4Tzhp?=
 =?utf-8?B?azZVdS81WStJM0o2UzdWTmJkYkdhRWMvRUVMaEVDL3REYmZ2Q3NyV0RqOVhC?=
 =?utf-8?B?OVdqdGJrNjFlT0t6ZW1MYUtFc1hkV2N0RGhob28zN2JjYTdBdnlRWWU5UDl1?=
 =?utf-8?B?YkIvQTMvMGliNzBua0k4ckF0WExjaHVjNFhteUJ2T0ZVaUhOMTRGdUl1Q09p?=
 =?utf-8?B?RzZhN01aVm02WGlFaDhKTG56RVlTdzFHb1ROaUlJQ0NCcFM2eEs4THZvM05a?=
 =?utf-8?B?emRSZWI5cG5PNWV0WElaRGtmeS9ITEMyWi9VTUlRUk9lVVRuSWJwTXlEOHRJ?=
 =?utf-8?B?NDMycXJqNnhyWXVXMjJSUHVpeTRzd3FMU004amdxUTJYZHBuTG1iMFUyU2tN?=
 =?utf-8?Q?oiWTLDP+KLWXmaMFMQohcYY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38851cb9-37ad-41e8-ba12-08d9bb27d65b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5344.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:23:22.8500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jge4ApHn2OUDjVUSfiCnhI75uqeUdhtuL5BA32RAMyEiIq+l/8cLb7s2oUEQYZrAqNE062dl9Ni1v0xHiXzihw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5151
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
Cc: daniel.vetter@ffwll.ch, Felix Kuehling <Felix.Kuehling@amd.com>,
 David Yat Sin <david.yatsin@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Christian. Would it make it less intrusive if I just use the flag 
for ttm bo mmap and remove the drm_gem_mmap_obj change from this patch? 
For our use case, just the ttm_bo_mmap_obj change should suffice and we 
don't want to put any more work arounds in the user space (thunk, in our 
case).

The child cannot access the BOs mapped by the parent anyway with access 
restrictions applied so I wonder why even inherit the vma?

On 12/9/2021 2:54 AM, Christian König wrote:
> Am 08.12.21 um 21:53 schrieb Rajneesh Bhardwaj:
>> When an application having open file access to a node forks, its shared
>> mappings also get reflected in the address space of child process even
>> though it cannot access them with the object permissions applied. 
>> With the
>> existing permission checks on the gem objects, it might be reasonable to
>> also create the VMAs with VM_DONTCOPY flag so a user space application
>> doesn't need to explicitly call the madvise(addr, len, MADV_DONTFORK)
>> system call to prevent the pages in the mapped range to appear in the
>> address space of the child process. It also prevents the memory leaks
>> due to additional reference counts on the mapped BOs in the child
>> process that prevented freeing the memory in the parent for which we had
>> worked around earlier in the user space inside the thunk library.
>>
>> Additionally, we faced this issue when using CRIU to checkpoint restore
>> an application that had such inherited mappings in the child which
>> confuse CRIU when it mmaps on restore. Having this flag set for the
>> render node VMAs helps. VMAs mapped via KFD already take care of this so
>> this is needed only for the render nodes.
>
> Unfortunately that is most likely a NAK. We already tried something 
> similar.
>
> While it is illegal by the OpenGL specification and doesn't work for 
> most userspace stacks, we do have some implementations which call 
> fork() with a GL context open and expect it to work.
>
> Regards,
> Christian.
>
>>
>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>>
>> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>> ---
>>   drivers/gpu/drm/drm_gem.c       | 3 ++-
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 09c820045859..d9c4149f36dd 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object 
>> *obj, unsigned long obj_size,
>>               goto err_drm_gem_object_put;
>>           }
>>   -        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | 
>> VM_DONTDUMP;
>> +        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
>> +                | VM_DONTDUMP | VM_DONTCOPY;
>>           vma->vm_page_prot = 
>> pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>           vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>       }
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index 33680c94127c..420a4898fdd2 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, 
>> struct ttm_buffer_object *bo)
>>         vma->vm_private_data = bo;
>>   -    vma->vm_flags |= VM_PFNMAP;
>> +    vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
>>       vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>>       return 0;
>>   }
>
