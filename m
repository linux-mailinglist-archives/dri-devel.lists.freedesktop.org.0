Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35BE510119
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 16:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B31010E611;
	Tue, 26 Apr 2022 14:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454A710E5DF;
 Tue, 26 Apr 2022 14:55:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDppPzwK5CHeW2blMZ5MWYNhK7JZ3Y2HsF2nKmuLnFi/W+y/GMFM31GNeaAVGRVpLY2RSpLKeVTd3T5LGUgPXNC+ruPP09IVHIpoPTt3QJWQYm9C/JKn/2rvRiSiPGvkwIHqyLY225hBIbJB1WwAAAZhhry8Dl8oqFb+pBeiorR1xI/nRiZuV83uDYMTQtiKUmjtol+qml1RHeANkepmhV2A5sij0qkKdfVMsy8x9wh8Z70DMYXeORuUaJjCHfC5InLPKnYpaWp02Q6TuinF5DmC6Qu5KunNkcMHXmJKM/KmXmoWf+gLmFzD0Hn0ZPXEmHcKr+HYhrx9ZHjHlwRk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXVjliGmKXDl/LJVTHJiDkocbdSCQZqsBwNaeaQETtg=;
 b=YHf+zB5vZJd3At1OJxww2XBkbbsgY8USMfBJNqzKz96K3aq2v85AEINiTQ/xM38LsN1Mtzt33/UuOw4lUXnk6yhhK3bxy3kmbtKHV9Nzn3F9LGxCQBO2Y3tWx+iKlA5V117TiBvUZYwBbK7xpkF1FaADEeQBExZny4vDHBKx0lRyDxmn3k7JqXr8ekJji9RfdVR7EoJHTXBgyb5+ly6yWXoav9Jp/vajq61pceqG6IJCTu7CBHyb9MF8iPdVHC3IynnQjL9R+gmPKr8YcxyPlzLjAMAq2lyDdgDC9rNAWykudDC0GcRyEqC+apOS0DJxOuBfxcITaEd6kBWuwSaNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXVjliGmKXDl/LJVTHJiDkocbdSCQZqsBwNaeaQETtg=;
 b=Z7YlnHtaYqw8GrLmXzkLaS5s93wheQh+5WviBmvs8hf76EH6Kx+vQyLVlsVNPI3zj8N7k2ZpogsLDNHhP9vBNgZwTlqCaj1KN1TTP8cQFnJapvWB5u9f+M/pPCBX1c7NMn9ke5qre+81cavz9PTAIXfQj9W1t3rrJsNhfrcRynA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM4PR12MB5309.namprd12.prod.outlook.com (2603:10b6:5:390::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 14:55:38 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 14:55:38 +0000
Message-ID: <e26e6ef8-6665-0b9d-804f-cf107f1788d4@amd.com>
Date: Tue, 26 Apr 2022 10:55:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] gpu: drm: remove redundant dma_fence_put() when
 drm_sched_job_add_dependency() fails
Content-Language: en-US
To: Hangyu Hua <hbh25y@gmail.com>, yuq825@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220425083645.25922-1-hbh25y@gmail.com>
 <b7d8956e-5ac6-8200-d8b1-4ce828f04665@amd.com>
 <79b198d0-eff2-d658-4b5e-9084a834fc93@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <79b198d0-eff2-d658-4b5e-9084a834fc93@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::9) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55a930f3-6965-4054-bd83-08da2794d320
X-MS-TrafficTypeDiagnostic: DM4PR12MB5309:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB53091BD942911FB296EAEC5DEAFB9@DM4PR12MB5309.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vPuP7L2NFQyKia8PRlfs8OpmXGV4YjPWIVe3m5lzNlDC5+rcxAGtdJlm9bFUPiU/raVhBikGyG9CwCtYqOiEb4miFiIJtIrq9eCUJNks+MiCHitpjX6UmU4TUXaPVeSCoC63UqsAEA1foZ36EB4gX/soN0U1m1lxC1TFa17Jsdo3rBH6BA8crs58qa+KHeveEfSlY0n+NQYqjVfuy+NswjgJYdiFWSBYDIM+JnKYO3ithmMZa3gRlHhq+YD8M4U5HMLc7pEgZaKiW+OLJhbLWGgUu++jkpO+DPw7+G9OCJUP8/WGRZrcGMbC5G/MHhd2TV7h9RQP0AeStz9/1d30G3f8iezcGsPZSiiKtkNnOCD6znmsR45kdoHSlRCNKZHopFZRJi7NA5LUfg4JtBNEYDiqQakbprGTjZToLnU4S6ZVToCdVQATmClxw6cepLq2nfMcmga/Okl7pGta61PxQIcrABQTxtrrSez9h4Up9G6Q0FB5VAK/MYCivC2WL51RMy1EnpF7DYX2m702crPHRvchxwVtFVb/QneZbnmJhQ92o0ldx5eQwMqtDP0zbC4UhgmFDB+JtY5ZRqXvisktMTLtWIncTXvv35Uxq8VTAdbCenmuMuB1CRKoFCmhfgg8TU0T3qZCCiuivetNSeKfPLIX30MuryABrBByniBStkumLrY61xseQx0GmcAMCourdQyvDYKu8Ei1tdIYvWNAxhRf3r3WMJt6mjPdT9N5f7k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(8936002)(4326008)(83380400001)(316002)(66946007)(8676002)(31696002)(86362001)(6486002)(508600001)(2906002)(38100700002)(5660300002)(66556008)(66476007)(186003)(2616005)(53546011)(6506007)(6512007)(6666004)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BZbVRJTlpNcTF6ZnVUSCsvYkR5cDRhc1NKVEYyUll4UFFVRUFteTNkOHBR?=
 =?utf-8?B?V0ZFR1FCeE9id2Z2SEg1b0ZxdFdGMnJEWFlLVjExZVlCMDB3ME93cmdrNjBt?=
 =?utf-8?B?Q2xoWU5uMC9peHduMFNFbTVISlJqZ1hrNUttMVN1NU52RFVjMmhNQmROU2g2?=
 =?utf-8?B?a1MvTkUzZHlXdU0xSmcwcVA1cDdSOW9FakRzc2xPRGJCbkVwZzZRNGlQbmxR?=
 =?utf-8?B?YVR0RWxJSHFjMC9QSXordXM2ZnpxSGRYNFFJU2g5SVBiMHo2ZXZmNE10M2Nt?=
 =?utf-8?B?ZnJIRDc4VnNVNFd2Zk9nRnlrMXRvTG4xV1BFc1FOUC9HQ0VwQXRIV21WYThZ?=
 =?utf-8?B?cXRuQlVRS1VRa2VqVUtuMnd5Y0VQSVdiWVVuZzdtRDUyRzEwRjdjbVdubFJs?=
 =?utf-8?B?bmpJd0lGbSs0aTdpZVR5ejVnWWI0dTZpcVlZT25xR3dabnNtOExFb2FhRnVS?=
 =?utf-8?B?T3U3dEZEUHlyN2o1c2ZMOGVzZGY0N1dkR1hsVGFibExhRVE1NWJHZURHTEtX?=
 =?utf-8?B?TlQ0TDNlK2VaS1dSY1ZxOU0xT1FmWG9Hem8xRHVZTGl2UEJQUHp3Q3AzV3Fr?=
 =?utf-8?B?R3VhRlltdEVEdy9NZWtNU0t2aWtJQXhuaUttcHZieDlGRCtxSjlOUkYvejE1?=
 =?utf-8?B?eWZ4M0hUNmw2c2RxUXlQV1g3VXZFNTNDclFvN3hTcUxLRUI0VS91SWlNbENo?=
 =?utf-8?B?QjJOcVA1OS8xMjhXQzNLUjVxRU1tZDdNVm9JZlVJY2p5Vmh1SHpqYkIxdHJp?=
 =?utf-8?B?NU03aTRRamcwK0J4ajJ2cmt1cTZ1TFRFV3FsWXQxZ1B1Q3ZVeTZVUWdzMUZa?=
 =?utf-8?B?ekF0WkdTby91UjFWeDJ6dEpIbWhhLzZ1eGk3M2hVQlVNcG40ZEhpRHVSQS9E?=
 =?utf-8?B?SmVZeVJMS0NkcWVYNXNoZ1hGU1NoaDdOcy9OcCtRNUJKaElkVlhuUXhGajZO?=
 =?utf-8?B?Nmw0UTBoZ3NWeEkxNVdobHI4QVFiTSs5N1c1Tkd4Y2VYZmZpNitBYld0STZJ?=
 =?utf-8?B?UWthQUJ1TWxoWmlRNXN1eGRSTnM2UXcyZXd1OFpydlVIZG5CSTU3cGkrVVZV?=
 =?utf-8?B?Yld2QzNubTFHTWg5UmpCakRUTzZhMFhMK0E5ajdkMzFLbCtoSmlBcHU3emE2?=
 =?utf-8?B?Ri9EdEM0UzNoaFUrUXVNK1gycnZCeDl3QWVDVCsvMUpjb0h6bjRYM2hJcm85?=
 =?utf-8?B?Y2RJTjI1V0t2a2ZOc1N1TjZFbkUrRFJ5bXV4d1ZTK0hSalhLMnJZS0V2L042?=
 =?utf-8?B?WGliNk83NHVHcTZtczBselYyRDJEUnlSS1pCWFNUbklreDNTaExYL01TQ3Vy?=
 =?utf-8?B?dkFHUDRaMmVPVUM2RkVrVFpVZi85cWgvNWxuTzhBa0JPclkrenlKNkpoYkNC?=
 =?utf-8?B?eFZGMDkwdHpJTkdvV0d3aXpac3oxb3RDTEswOG9oaFkyUllPOGxmdVptK3dh?=
 =?utf-8?B?VkgyZGxWaHl4Z29NdytQUmcyMVFOZzJqMHg5cGVpdFlJaFM5Mm1MR3hUbml1?=
 =?utf-8?B?ZzBmemRBbGhSbVordGx3eFE5QlZRNkJ0c29EWUFJRlo3aFBzOURoV3FSSzZW?=
 =?utf-8?B?RFIwQWtRMldkMVVjM1o3YmZ4MkQ5aHlaRUN4VHA2SDg4TFVYTjJCQjZWYjFt?=
 =?utf-8?B?NzlBSTlKb1FONGc4ZWx4bE5NOTlDMkdOdkh2Z211aGQ4Q0UzSlN2a1pUSUNK?=
 =?utf-8?B?ZFJiajZPbmU4R3RqUU5ya0hIb1ZvSXdadnNad1dlaEtHeHdwTzNPNVpIWXlq?=
 =?utf-8?B?Yjg5Uk82YkYramtIN1J2YTM2RUp5STRmdjZpSnNGdFBZRlBJMVVWZVRsNlUw?=
 =?utf-8?B?Mm5uVDhEOXZrUVJJRGpaem15Qlg2enhiM1kxajJiZmFBLzBDdUpSckVXZk9F?=
 =?utf-8?B?VE9jTURleHd6N2xVQmN1OW9BNnhiYzk3WEJuR3dlRUlOYXFRQXNGTmMyUmZ2?=
 =?utf-8?B?ZXVkSW9Wa2dRM1VQWThiYlh2QTEzcjZiQnB5NnRDK1kyRjdDeGF6S2poTkQ3?=
 =?utf-8?B?WXgwWWg0NkE4aVVXWXppc1M1akpiaHhDT21ybyt4MHNEbjJXRm5ObGZXZWw3?=
 =?utf-8?B?LzEvRWxJK2Q0bUJocFIwVkhxYXk1Z3RuN1BNZjVYeHhjd3RjY08zaThobE9S?=
 =?utf-8?B?aWVmOTUxdGNKSHVrNE82NUhSeGZMSkF6VjB6WjlidlRlWWp6WnRkbE1Xa1Bx?=
 =?utf-8?B?NjhOMjYyLzFEbTgrTmJ6QmxuTTh3MWsybG12QmZ6SDg2RjdIRnNhcVlNSUdW?=
 =?utf-8?B?NGxqUW1zcG1SWHB3SHMwUkg0NEhQZ25LUEZJNk40MWNxZW1zSmJlcUZLcE9G?=
 =?utf-8?B?Y05vTHVHQnhmVHIwcUJ3bG9scXNZMXB6a1gwTXlsNWZLTVlrc3ZjQnR0aVRR?=
 =?utf-8?Q?LWNZdpsNfrLjepIcStJLRkaoRJKBDq9C7hD0rAgDSDjpH?=
X-MS-Exchange-AntiSpam-MessageData-1: Q1NWsJ5XvLA9GA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a930f3-6965-4054-bd83-08da2794d320
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 14:55:37.9783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIAwtq2I16vSUtrepKukoa6d/BdAyKPUeajNVWmwcMtb/jXxG5joDsOhf9SlE+H0bovkIWsHSJuoEUVkAAOMjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5309
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
Cc: lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-04-25 22:54, Hangyu Hua wrote:
> On 2022/4/25 23:42, Andrey Grodzovsky wrote:
>> On 2022-04-25 04:36, Hangyu Hua wrote:
>>
>>> When drm_sched_job_add_dependency() fails, dma_fence_put() will be 
>>> called
>>> internally. Calling it again after drm_sched_job_add_dependency() 
>>> finishes
>>> may result in a dangling pointer.
>>>
>>> Fix this by removing redundant dma_fence_put().
>>>
>>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>>> ---
>>>   drivers/gpu/drm/lima/lima_gem.c        | 1 -
>>>   drivers/gpu/drm/scheduler/sched_main.c | 1 -
>>>   2 files changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/lima/lima_gem.c 
>>> b/drivers/gpu/drm/lima/lima_gem.c
>>> index 55bb1ec3c4f7..99c8e7f6bb1c 100644
>>> --- a/drivers/gpu/drm/lima/lima_gem.c
>>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>>> @@ -291,7 +291,6 @@ static int lima_gem_add_deps(struct drm_file 
>>> *file, struct lima_submit *submit)
>>>           err = drm_sched_job_add_dependency(&submit->task->base, 
>>> fence);
>>>           if (err) {
>>> -            dma_fence_put(fence);
>>>               return err;
>>
>>
>> Makes sense here
>>
>>
>>>           }
>>>       }
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index b81fceb0b8a2..ebab9eca37a8 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -708,7 +708,6 @@ int 
>>> drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>>           dma_fence_get(fence);
>>>           ret = drm_sched_job_add_dependency(job, fence);
>>>           if (ret) {
>>> -            dma_fence_put(fence);
>>
>>
>>
>> Not sure about this one since if you look at the relevant commits -
>> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies' and
>> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder'
>> You will see that the dma_fence_put here balances the extra 
>> dma_fence_get
>> above
>>
>> Andrey
>>
>
> I don't think so. I checked the call chain and found no additional 
> dma_fence_get(). But dma_fence_get() needs to be called before 
> drm_sched_job_add_dependency() to keep the counter balanced. 


I don't say there is an additional get, I just say that 
drm_sched_job_add_dependency doesn't grab an extra reference to the 
fences it stores so this needs to be done outside and for that
drm_sched_job_add_implicit_dependencies->dma_fence_get is called and, if 
this addition fails you just call dma_fence_put to keep the counter 
balanced.


> On the other hand, dma_fence_get() and dma_fence_put() are meaningless 
> here if threre is an extra dma_fence_get() beacause counter will not 
> decrease to 0 during drm_sched_job_add_dependency().
>
> I check the call chain as follows:
>
> msm_ioctl_gem_submit()
> -> submit_fence_sync()
> -> drm_sched_job_add_implicit_dependencies()


Can you maybe trace or print one such example of problematic refcount 
that you are trying to fix ? I still don't see where is the problem.

Andrey


>
> Thanks,
> Hangyu
>
>>
>>>               return ret;
>>>           }
>>>       }
