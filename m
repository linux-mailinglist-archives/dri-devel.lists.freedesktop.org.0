Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB7D4132C4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 13:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114486E95E;
	Tue, 21 Sep 2021 11:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFDC6E95D;
 Tue, 21 Sep 2021 11:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuXV9nAnyZdfhBx6lQ2Xv5YgtMY8eJW2dim+UnQp/DtJqcFnCgNb1o0UKlwZYYZakzT41Io7W2GMobgAGNQ0ECYjD+3p+jhiJYpd+APqJTIRcl1s3gmoWbQOohcxc4wOGlheb/GLU33aZJlrHXcJIQOFYxe9rJyLr7TISg4VJEzY5vjg1hohA8zVF5ieBgqOKr4uMNvbCRGydz2eaxq1KuBuWThaOFJr2GZFBipcTGu2awmV0NK/Jeg9NECV87Y7klIqw2cWNzsKyO55970tz5saebRYWyQGMEgypRFaTCEd1r8gt7HPjHOKQCY6DZQzioh54nQjuq1iShIr6EwcQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=hkHDky02UnClBDcXe1VgOduGzS1cycn+EbV2Ft1vA6s=;
 b=OC+Z+4AMFwAsDguXFxxqych6amvuQMrwnuI2j/k8fHbCV3NkA4EezmK0qaoUEpDiMEW/bOzNL096Z/Kfp/T5pam4wfAg3+wlXItPM0M876L9PHWdhdyK6wGB7AlJDrJ7LpAyyl0bTDOgyIvUKBzUOG8PB92zyahQvebtB2tSuAOte63OCxxMEs0Ad1P3GMJ7ooQwxrCFonNJ30emQE1YPFPcL7ZDjcW57ZY4SaVx4Ci2PMR18eGzDoxJjJxAzqHispaX0UVsXCFsOUwTiFyJWlLt81YcsWwM0gY54BKtRxHW6uML53HKxogrxWmPVZR1BV5DORTaTLynAaMzNAONHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkHDky02UnClBDcXe1VgOduGzS1cycn+EbV2Ft1vA6s=;
 b=0d9fF/TVFuHxTKLWvaWQA2bdTQp1P41ZKV4xQUR5nr9ApnILm6hutyRmk+4AMjdV6XmBKeGjdOo9xpZY/uiqPwXcRkY3ZnjptZ1JUsFnEPfThj5xvXVQF8yWILt1S0ICmFy6Tlz6/VNUDW7/5GmC5xsm6N9tJb0DhLBoyuv3NCY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 11:42:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 11:42:37 +0000
Subject: Re: [PATCH v4 01/14] drm/ttm: stop calling tt_swapin in vm_access
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20210921110121.3783395-1-matthew.auld@intel.com>
 <e358c620-fd78-f3c6-2558-7376a86701b9@amd.com>
 <bc9ca2021c05d4d0d1072f95d7bda42fa7f174d1.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3814bf91-7944-e3b0-ee84-e9d6fa506f44@amd.com>
Date: Tue, 21 Sep 2021 13:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bc9ca2021c05d4d0d1072f95d7bda42fa7f174d1.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR1P264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:8582:d9f8:1318:9d2b]
 (2a02:908:1252:fb60:8582:d9f8:1318:9d2b) by
 PR1P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 11:42:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d1f844b-e82b-46f0-e639-08d97cf4e8c5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4191:
X-Microsoft-Antispam-PRVS: <MN2PR12MB419161D7BBE74077B1CA98F283A19@MN2PR12MB4191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dKgcLI++uQy0BoRGFb4MBY3ngYAj7AY0hccWUVI/YIgwdoCwMVtxQUe0GwdCPlOBi075MFSfJ1lsd1ITqfiabzlMKB7TkcR/EHMUaX8PT7V8RgWRhEBOXB/DTymkD94OBu2yRrtIJK0BJjEjZjG3EPXbp+RP2n5fBXPYNosZF1JZm9c9nqSusr2FOU9wwvc7BcJxmMiWsxvYdlVCdCllHuiyaiTHcfPKAbL8hDiP9nOfPTWcL05mZHU13zelfjWffHxDuUyDwIHnmZLB8dQ1piFb6+OAc4Ma5OcSA3sxmm1swSY+nOOE3D2mYPFumO/YL+iDL0jp08Z109hZxFZ2XnIdN18Ux16KTLGZHao8rG/YwI5W1ICfTfesFH0rkyRoYez9L5zzB5rInOAQM3EeWlUu/gicIF6BIdW4wmGF2qDPHhB0zMOOTC1pCpdpmqFYx7IIfWmR7zH4C0cBDz8kt7Pg/Lrcn6y1irJjiQ2VDFgmdWX20/z5fn38AqJlB45N7Hg5XiirrpETXZuTEol/4fMGpvUp3fWoTrcbON7cfegLtRXl2g36cgt5i6pF8lC8fotug7oeLnkl7wc5EPhrG8pkXhfotEpz3v20UTVilni125AUa/BmA0YcPlEjqMfuaA1NM4ohE8rjO3L9nfTwf1QhWi+lCGyaOB6vfR54LzZX5d/9ymh3EyO2+ehneTHxuM6sEE/38h4ZXxyWIi9Ea7uFsI08iLizODfFl3okY6I/pZEdxWHDqaSmeTXuGFGK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(2616005)(316002)(8936002)(31696002)(66946007)(8676002)(110136005)(2906002)(66476007)(66556008)(5660300002)(4326008)(86362001)(36756003)(38100700002)(186003)(66574015)(6666004)(6486002)(508600001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTdEdngzS29tTTNZRHpRMzFmQXNYamJ2MUZsNEFmb2p4TkRoS2Z1cTAvMkhF?=
 =?utf-8?B?TVVvU21ZRHMzcXRGcFdXbGNvbjVpTHJTT093Z3JYcWcvdnNsSW41NEVManJs?=
 =?utf-8?B?Sk5yMzNiVlhOL2MxcFQvOS9zbU5Bb0dUR05OeEFtM0dBSy9HN2RRZCtORFF0?=
 =?utf-8?B?S21LUTVOdE5hNk1Zb3dNTFh4Z2dadTlhR0Z0NEJWUVNuRWRhc0JkNVdNYWlN?=
 =?utf-8?B?UzJUalJJbjVTR2hySFBYelJQdWlJZ1l2Y0xnMTNGendhQ2hKS01ReThFWXMv?=
 =?utf-8?B?bGV0SUcxRzNoRnhDRG8wbFoxQ1lNVmFUdEpTT0NKYXFYRUZnUmRJMW9Zdllh?=
 =?utf-8?B?UUpFMEE3NXlhVTBZcVJveVgxZmZiLzkrK1E0YzYyVVI3bXZpZ2pIZVVNZG5X?=
 =?utf-8?B?Z01oeEU2c0xockhjZ1VFSkJCK1hwQVRCdTBiUjdQcXcyZGIweVgxZitlSUo0?=
 =?utf-8?B?NUtsWmNwa0FmeW5iVWMwbHM2blRDMHo2ZFFhRkZ6dmZNcWpBa3JZVytvSUlS?=
 =?utf-8?B?UmFlVjV6Zm8xZU9MWGE0NkFRWklFUy9UNktYZ3VDZWFUdkR2cnJEdGJPNGhL?=
 =?utf-8?B?NDA3VVdtdk9iYlk0QTBFckwxMGtUK1JSRFlXaDc3VmZpSXhyY0p1RDVOaHdM?=
 =?utf-8?B?bjNvSDZhS002RllBaGx0eGxYVjM4YWkyYVRRam56LzY5TG9rcTFBdHhJemRS?=
 =?utf-8?B?YU5GUVUvejlYWjhBSUNlU2xiRUp4S3QxZVRNR2FLd0p5dnZJVW1PWkhjMHUw?=
 =?utf-8?B?cjd5V1pmRXhXdTBLSEsweXE1RlN5ZUJqNjhXWmlWRnFnekxWQmdOWUhqMFBL?=
 =?utf-8?B?M2JrYXB3dFdlRjlDZFRnMytYK0dlOXVqM3FBUjEyeGcrRkdybGgwSGRGRXcv?=
 =?utf-8?B?VEdPb1R2b0Jha2xEUkdCVWY4UEhVS0xZL0R3eGtHZzdMMGtqcjdEa2Yxcnhm?=
 =?utf-8?B?V3hucHFkdDFBYnNTVHF5YnYreTZaMHo4STUwV2QxM0dLM1hnRHJibzZPK3Ry?=
 =?utf-8?B?aFhJZU93L21lTUNFU1gzblBTTDZSNTlSWmZvUGd0aGxqZ2h5ck1XQW9PRHBh?=
 =?utf-8?B?N1IyVnVPVFlzdS9uVm5kc1MvaDIwN3M5ZHNHYXFQMWVuNEFoL3djQjUxWWNt?=
 =?utf-8?B?Y3Z6bWJjNWJldTBRSkxqSjM0Z013eFRDOG5NYjBCTnpESjV2MHpVYjY5dDQw?=
 =?utf-8?B?N1pVOFhnRHIwTzF6YTFVMzdFS2Q2WEl3QUVLNXZTcG9PZ1d5R1ljajVtVEE3?=
 =?utf-8?B?ODd4WmdrKzlPYmlFZjhjWWRpNWlFVzBTWVFwdmx0aHNxQUNTYUZNTVBjY2ZG?=
 =?utf-8?B?TGFsc0FiK204UUx0WTJ1YjFxdDB5ZUVJelMwUHBybXZnSGhjYkM3VFBISEFB?=
 =?utf-8?B?TmxjK3B0RXl5THlYTDNxVS83UlAxQVBER2tLenBQQW5TNW5Ic3JBY3dYajha?=
 =?utf-8?B?OFF1YitqQm9VNGJWMlRHTHZtb0VqLzJ2UW54blVJdHlQakxUSzRBK0huNERj?=
 =?utf-8?B?dXBYRTZGZ2FrMGRWWWFOQjFXV3MrRk9LcTR4MGI3OGJDcnhPcnU5VlNvaml1?=
 =?utf-8?B?NUxUbVFZTHlhMVU0ZkFqbUREbDhpbjdIMDZxNzlJTUxoeDl2SjZZNjh0VVhN?=
 =?utf-8?B?RzJpS2FtdGxURjlCdjRIVW5KUHp5WUtoTk0yeG5zQllKNzBHMXZjRWUyWTQz?=
 =?utf-8?B?emdkWHJJOWkzZmhQUVVDemFCN2QxS3lrVlVFdHd5RnBGeW9YWmdMZ01uRHNK?=
 =?utf-8?B?ajV4OHROckZzek5VVzFsRGUyb2lvOUJPSFlFQUprTElMeVhVZkVUSklnQlNT?=
 =?utf-8?B?VStkdzErelN3ak53LzFGVUU1U3lqQ2ZDMWIwVnREelcvUEdxSnlsdUl4ZDMr?=
 =?utf-8?Q?BXvIB2mCmBySo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1f844b-e82b-46f0-e639-08d97cf4e8c5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 11:42:37.0333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Wn60Adz9a6Gq7SoSYMisRJENIuhqxODYhQKgd6SjRFXBYgH4x3NO7jrqSGlYO88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.09.21 um 13:37 schrieb Thomas Hellström:
> HI, Christian,
> On Tue, 2021-09-21 at 13:28 +0200, Christian König wrote:
>> Am 21.09.21 um 13:01 schrieb Matthew Auld:
>>> In commit:
>>>
>>> commit 09ac4fcb3f255e9225967c75f5893325c116cdbe
>>> Author: Felix Kuehling <Felix.Kuehling@amd.com>
>>> Date:   Thu Jul 13 17:01:16 2017 -0400
>>>
>>>       drm/ttm: Implement vm_operations_struct.access v2
>>>
>>> we added the vm_access hook, where we also directly call tt_swapin
>>> for
>>> some reason. If something is swapped-out then the ttm_tt must also
>>> be
>>> unpopulated, and since access_kmap should also call tt_populate, if
>>> needed, then swapping-in will already be handled there.
>> Sounds like you completely misunderstand what that is good for.
>>
>> This is for debugger attaching to a process and peek/poke into the
>> VMA
>> and completely unrelated to kmap.
> I think what Matthew is saying is that there is a fallthrough to
> TTM_PL_TT which calls
>
> ttm_bo_vm_access_kmap

Ah, good point. Now that makes much more sense.

>
> which calls
>
> ttm_tt_populate().
>
> So from my pow, unless there are other concerns, this is
>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

In that case the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com> as well.

When this is gone we can also make ttm_tt_swapin() static since that 
here is the only user.

And BTW replacing the switch/case with a check for use_tt in the 
resource_manager is probably a good idea as well.

Regards,
Christian.

>
>
>>> If anything, calling tt_swapin directly here would likely always
>>> fail
>>> since the tt->pages won't yet be populated, or worse since the tt-
>>>> pages
>>> array is never actually cleared in unpopulate this might lead to a
>>> nasty
>>> uaf.
>> That's indeed true, but we just need to unconditionally call
>> ttm_tt_populate() here instead.
>>
>> Regards,
>> Christian.
>>
>>> Fixes: 09ac4fcb3f25 ("drm/ttm: Implement
>>> vm_operations_struct.access v2")
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c | 5 -----
>>>    1 file changed, 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index f56be5bc0861..5b9b7fd01a69 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -519,11 +519,6 @@ int ttm_bo_vm_access(struct vm_area_struct
>>> *vma, unsigned long addr,
>>>    
>>>          switch (bo->resource->mem_type) {
>>>          case TTM_PL_SYSTEM:
>>> -               if (unlikely(bo->ttm->page_flags &
>>> TTM_PAGE_FLAG_SWAPPED)) {
>>> -                       ret = ttm_tt_swapin(bo->ttm);
>>> -                       if (unlikely(ret != 0))
>>> -                               return ret;
>>> -               }
>>>                  fallthrough;
>>>          case TTM_PL_TT:
>>>                  ret = ttm_bo_vm_access_kmap(bo, offset, buf, len,
>>> write);
>

