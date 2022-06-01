Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2136539FCC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB73010E196;
	Wed,  1 Jun 2022 08:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057EE10E26A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAFL3pZ86vXn1DTdCBBWA1VSOyXivvq7zbOt8FJYzuubhYHUvsi2cxlLtueu8Xx5AuG8g1+bMxOBl5YHZkyG0iG51v7WJk0uYE0k+UlivKqF7jWuJ5gx8qU3Au96sQ7ZsUoIJP2p/+HUqNv75yEy4HXY7bMbirQXKv4dTuSM6QcD4je3ulVlzGOH5xX8KIITeAbZiFquG7VQQ64mDMPkFTGXdGBvg7WltB5JDZFa8HKQrF1YXF4lj1tnVsd35lbzmPlp52CnZfxejYJZTt+hm1fDE0aiSygOxty0dZ/NIibHxzqoCgpT+dmA1SMqzw4FtnoqaFtfKIoTZBGv5tVBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqIe3Md8X6PCE1jZvlxQ9QZMLq0jooKavy/PgbU0yYs=;
 b=mfHJDpcJ/i/LY4QL0viRtcfV4eXUSdMtpO57qvV5sbMtIEhjpwjF1upleLtZkz+HGeQomUpI3m+T+qRRD58ykfICx9I0m7teIgCJbN2j5O6XO9t2GYMh9iQat0Rm3JfczKbsI3YFqNGwT1B2gP3koljpbEI+b3V4eOBY6kmArPREsAhNyFbheniyDZkmq0RtYltHxcOk47vfmKwC0wHMGAIo0BPNs6GAX5xFnt4z6wGsqL78CxmQ5CMFP016TyoScM11LpfXou+aHmlt9hMqDPXylWhkJFNLoWrXP9Eh8xyqEayf8jbnVW5m4qZS/YnJiT5fqtg2vRkrnhFIXD6tKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqIe3Md8X6PCE1jZvlxQ9QZMLq0jooKavy/PgbU0yYs=;
 b=1TymA2LxG4Cn1iP4iJhlwZT50Uqg3xlEOBLwVZdr5WCmFtHcImSc0jM8OFq8fdPdovF4ljlVEZ2kSd1FfJBVquQasuIyXMtVCWljvEp21Q5s1eHQr+aucLOUUaWE3EZ9xPE6H0tPG5zigUYV/EyuBkXVmtrIhAgQ70Hi2UpV0UI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Wed, 1 Jun
 2022 08:47:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 08:47:48 +0000
Message-ID: <72b14c60-19a3-d8f2-fb49-239bd8735d6c@amd.com>
Date: Wed, 1 Jun 2022 10:47:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 1/5] drm/ttm: Refactor num_shared into usage.
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-2-bas@basnieuwenhuizen.nl>
 <a5078937-a4d1-eaeb-af1b-de0482c2c78e@amd.com>
 <CAKMK7uG8n4tydDA7XUVpkGnZgcohwaEZmny2kCLYtSyJRYoyyA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uG8n4tydDA7XUVpkGnZgcohwaEZmny2kCLYtSyJRYoyyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0039.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08f8d6cd-d048-49d3-16bc-08da43ab679e
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6339:EE_
X-Microsoft-Antispam-PRVS: <SJ1PR12MB6339BAE43621B823A4006D9483DF9@SJ1PR12MB6339.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8Ww5EAU5DFAewVTsFekcMQp+/zKtpSZJinRdEzNUTT97vWvI1DrtFl6LDNBqWwBo1lgO2INZ6VjqQz1+1llOMM2wjB/+Q89e05hrBSwhBDI1oqyjIdaiFvSrzdQsbOoC+AC1YcBRk0QKlGRRiE4dmY9mtq+BA1V/iqk8DpFJ5+AJrJyr9UZaDC9cMNbnbTH+zs7ZmsL8p4WDAIl0yZHKMk5nYZnQ1q2eN9VkI9WNjfGnfE7vT8J6FBF0z00589q0w4xYefXYowY0fjpimk3rezPJZWOOGn3tf4QkCzqCZIZ4aCGbl0WYKe1RmLG00Gg5307y7MSqbNuaA+qyCs1Y5VYhr2LtTSBM26QeIEAKGjiDFjzX/yygt3VJiWy0PI9OxmR8LjFgVinGc4LH7222IBHfTYPHqoz08/2AGLCDDNE9ozqOaIFFgBfQfMgGQ8OkftWXqI3q2LOdc0q2sI8YefQnum41TfSe2dXX5sqf9vwdvm3d2l0XInTSQ8v6fKrISP/jGtH2b+qMwJvoyWobUxHIPONGFe/2+zU0UHimeSZNnXOaF1jlWNAdgCV7IXEEwzv3FjJ7eyyjLzOAIwU7+YFbAmZ4sRKvbEHG9LCkJTFJykn676wskWy6tnxkm4g+KlmYovk8rkXmx+6IGQQuYEfcWsqusYXcl8Su1GxSijqA48HjnHZPgSzekMMgZuBGXlwaH3Qy5BfRb4J9VtMHin0zj7Iwmc8tJxUBNNqH1xEbRyyzXAZL8V6y5kLXiNu4S4S4KU+/kQ9t/xwnDZKDhaPSX/uljJrCE+hWtuj/7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(38100700002)(186003)(31686004)(6666004)(5660300002)(66556008)(66476007)(4326008)(66946007)(66574015)(8936002)(36756003)(83380400001)(316002)(30864003)(2616005)(8676002)(2906002)(26005)(6512007)(6506007)(508600001)(6486002)(31696002)(6916009)(507254004)(556444004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGRzYXhmeU4wa2o5RnpZSktpSFV6d0VpdGd5dXJ2T3NhaUpKdWpscE1PU0dk?=
 =?utf-8?B?RXNBTXVLL2d4blNJNGdGY3ZQQmE1ZDNRRmh2N0VWVkEvMjh2cTBROGtONDhw?=
 =?utf-8?B?UU16K3ZHaTB2OEVZem4zbDU4RVc5NDJsVEt0bE5wMnZQVmd1eFFZOUY0M1Vw?=
 =?utf-8?B?ZnpaLzFqZXUvRG5VdndnRHNEY05kbmcwd042N2REY0NQT0VwemdBV2x2RzNh?=
 =?utf-8?B?RjgrQzRHWDRqQ1o1eEZoNXNIaWNmTWhFSXVRT1lxVzRUd2ZoWjNIWFMxWGZs?=
 =?utf-8?B?UXVSTVdBTW10OWZFTjJCYThOcDFoOExKNlhZV1pPb0FyRkV5QXNNdXFMNFZv?=
 =?utf-8?B?eTErWkVabGJpa1dVSUc4UFFPNmI4M28yakdKZEZPUnhPM1VCWmxubXl2UFA0?=
 =?utf-8?B?Skw3OWJKcElxTzVjSElqSDR4V3lIcml6TlFKeGtPM3kxNEJnUnRwOVY2U0RH?=
 =?utf-8?B?M2ZpanlCWXQwZHA4NTZBZTVrd3BxNjllZGVGWThCempOc2JTK3p2STVIMFJN?=
 =?utf-8?B?TmE4UUZQcDArbWgzZkNOREI3UW9aVlh4aVgyYjdqcVkvTkpQQ0JFSkp4Qldz?=
 =?utf-8?B?aXdDelZ6bC9DT21oekNncGhOTURENVVRMlhubkRXZzRna21OMUFLQzU3MENt?=
 =?utf-8?B?YklveUZTODNnWGVwckt5QW9vbVF2SXo0ZHFRZERUQkN3VWV0TVJMdi9kMXV3?=
 =?utf-8?B?YXlkQm5BOEpmbzE4SFdUV0xnbUw2VjBXVU8rR2pic2Z6R0ZvLzdFcTlVNnF6?=
 =?utf-8?B?aVBiWm9hdGtmVlZncWVJRmR4d1lia2xwU3VrKzR1azVFdEZoS0hYOGJ6MHpp?=
 =?utf-8?B?WXFwRkp5RVRXcmpFKzdZSklzMFVzMDlqSGY3TnBqQUhyNHpxMlB3QzFxNWp6?=
 =?utf-8?B?Qy90bHRXS1Q0dEN3ZU0rUzJyTVVIRXgxemdLMkd6R2VCVUxNenJMVmxxU1JV?=
 =?utf-8?B?ZTNpWUNxcVd2NXkyemp0NHNRMzF0TzA5NnEvYlhMeHgwaEZvQzBRY2RmWnRQ?=
 =?utf-8?B?Q2pKZmEwUmt4eEQ2WFFIYlliVTVJY0hGTDIrK2grWENpVCtPWW1UMjJZbHlY?=
 =?utf-8?B?enMwZXpJbkFrMVBVSUswMXJBTnVFdmxwNTZCdE9jUlN1NmtLNUlQaFB1Yjcw?=
 =?utf-8?B?QmNnYktvWEtDbGdIVWFqTlplSkNVZnhvbmJybG5SaGc4NGY0Rit2SFhoVCtU?=
 =?utf-8?B?MDNTd1VlY1hHTTFCNDdEcHRwUGdLTGZtMkNiS0N1OUpOQU1xazFncTBXQnRH?=
 =?utf-8?B?aWcwcVl4YXdCQlV4OHZmQ0V2bUUyNFUyRmQzOS91WitxdlZ6QWpJTThycjl6?=
 =?utf-8?B?eWtiTjVnRGhmMG9lK2RieEU1cUJ6RTFjdkFxZXVkYjVZUG8zODdyMlVSZEIw?=
 =?utf-8?B?bElobmhVOXJpb0EzSFF3M1ZET0pGdldobHQxWk1qRnNHRDhFOHhFNndKYStX?=
 =?utf-8?B?d1dhN1A5NkJNRVppZWEySTVYVXI5ZzBMb05jUndkY2o0QjdEWWJabmhxcWZT?=
 =?utf-8?B?WEpMYnR4L3EyZEczbDFwZEhvMjl0bTNHZmdUaDZpV2U4WDhldFRmeEY5NnNP?=
 =?utf-8?B?YXhqZWphT0hsRWw0UWhGdHNVSHN0OHFXTWJmeUhhUzVxN2J4WStiSC9rcnpG?=
 =?utf-8?B?Zm0yeTkwMjJOVFVXbGNqSkFsQVFCVVd3QVoyVWRNZW5SL2tBdHVmd29jejdj?=
 =?utf-8?B?WUZqVWk1RVJYT0NYUWZCKy9kVnBkbDFCUGJJdzVUL0RrV3BGSFZIaUU4bFBv?=
 =?utf-8?B?SHdTbTcyOVl5R2lTMzQ3S0ZaR3lxWkFDMUE0cHhLb2xKSTdMNUpiR1YwdmZm?=
 =?utf-8?B?amZodmhlOEZhVktRVE45REN6dmZ0M3pXV0ZxenJ0L0ZCSnE4OGdpT2orVEdO?=
 =?utf-8?B?MnpJN2pOclZFcHFGTWdDUWp6M1lZVWRWSi9Mbmd3dkZIZ2g4ZDJKTXpJOG9O?=
 =?utf-8?B?TW4rWEVOSDRDRFlxU2RFWUdiL1JnZGg3VTNoQ0FvVFp2bVdsdk4rY3E4cklk?=
 =?utf-8?B?a2UxelZWR2pQS3AvTm1WcE84YlNLcTY0T0g3THQvWW11R0VQRXNIM0pnYkVB?=
 =?utf-8?B?RnFiZytOZXhDUXJtOTZQL0p1M0ExdGhQb0NmaVNJRlY5QXpIcUFkaVN4V1dv?=
 =?utf-8?B?TzlwMFZydFNwQ0FHTEZCTUhTdFVLQWR2cXRmQ21iRW9pWUpWNDJhb3M2M0pU?=
 =?utf-8?B?UDFsdUR6SHJLV1FtRlJ6VHdnMlU2cG1NY2xlMTVNanpOV2d3cG5UZDdwUWN0?=
 =?utf-8?B?QmVQeHp1OFR6TTB6UElqMXR1OGRRbkwycTlZdWJDNjhOVEt4M0hlNkE4UStZ?=
 =?utf-8?B?U1NaYzg1SUcrZVJCaFZ1NTFJMys5clBtRkVVMmN4WlI5NkN6NFppZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f8d6cd-d048-49d3-16bc-08da43ab679e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:47:48.4010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wN2P+b95Nop774pBpa/bQAJP40l3Wlur+pEnIfLbjbCevBi6Z0BkheM+0OPufd2U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6339
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.06.22 um 10:41 schrieb Daniel Vetter:
> On Wed, 1 Jun 2022 at 10:02, Christian König <christian.koenig@amd.com> wrote:
>> Am 01.06.22 um 02:40 schrieb Bas Nieuwenhuizen:
>>> So that the driver can set some BOOKKEEP for explicit sync. Maybe
>>> some of the existing places would already make sense for that, but
>>> I targeted this for no functional changes.
>> Well first of all NAK to that one since it will totally break cases
>> which need to reserve more than one fence slot.
> Quick reminder, we talked about this in the past. For many folks (not
> you) NAK means "fuck off" and not "this wont work for the reasons I
> just explained". Looks like the conversation is all on a good track in
> the further replies, just figured I'll drop this again as a reminder
> :-)

Yeah, that came to my mind as well.

But I still prefer NAK as what it means in computer since, e.g. "Not 
AcKnowledged", please restart from scratch.

We do need a clear indicator that the whole approach taken in a patch 
needs to be dropped and restarted from scratch and a NAK seems to fit that.

When I would want to tell somebody to fuck of I would clearly write that.

Christian.

>
> Maybe do an autocomplete in your mail editor which replaces NAK with
> NAK (note: this means "fuck off" for many folks) so you can decide
> whether that's really the message you want to send out to start the
> morning. And in some rare case I do agree that just dropping a polite
> "fuck off" is the right thing to make it clear what's up ...
>
> Cheers, Daniel
>
>> Also as discussed with Daniel we don't want to use BOOKKEEP for implicit
>> sync. We should instead use READ for that.
>>
>> BOOKKEEP is for stuff userspace should never be aware of, e.g. like page
>> table updates and KFD eviction fences.
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 10 +++++-----
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c            |  8 +++-----
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c           |  2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c           |  6 +++---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          |  2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |  3 +--
>>>    drivers/gpu/drm/amd/amdkfd/kfd_svm.c              |  2 +-
>>>    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
>>>    drivers/gpu/drm/qxl/qxl_release.c                 |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_cs.c                |  5 +++--
>>>    drivers/gpu/drm/radeon/radeon_gem.c               |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_vm.c                |  4 ++--
>>>    drivers/gpu/drm/ttm/ttm_execbuf_util.c            |  5 ++---
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_resource.c          | 10 +++++-----
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_validation.c        |  2 +-
>>>    include/drm/ttm/ttm_execbuf_util.h                |  3 ++-
>>>    16 files changed, 33 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> index a4955ef76cfc..a790a089e829 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> @@ -774,7 +774,7 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
>>>        struct amdgpu_bo *bo = mem->bo;
>>>
>>>        INIT_LIST_HEAD(&entry->head);
>>> -     entry->num_shared = 1;
>>> +     entry->usage = DMA_RESV_USAGE_READ;
>>>        entry->bo = &bo->tbo;
>>>        mutex_lock(&process_info->lock);
>>>        if (userptr)
>>> @@ -918,7 +918,7 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
>>>
>>>        ctx->kfd_bo.priority = 0;
>>>        ctx->kfd_bo.tv.bo = &bo->tbo;
>>> -     ctx->kfd_bo.tv.num_shared = 1;
>>> +     ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&ctx->kfd_bo.tv.head, &ctx->list);
>>>
>>>        amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
>>> @@ -981,7 +981,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
>>>
>>>        ctx->kfd_bo.priority = 0;
>>>        ctx->kfd_bo.tv.bo = &bo->tbo;
>>> -     ctx->kfd_bo.tv.num_shared = 1;
>>> +     ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&ctx->kfd_bo.tv.head, &ctx->list);
>>>
>>>        i = 0;
>>> @@ -2218,7 +2218,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
>>>                            validate_list.head) {
>>>                list_add_tail(&mem->resv_list.head, &resv_list);
>>>                mem->resv_list.bo = mem->validate_list.bo;
>>> -             mem->resv_list.num_shared = mem->validate_list.num_shared;
>>> +             mem->resv_list.usage = mem->validate_list.usage;
>>>        }
>>>
>>>        /* Reserve all BOs and page tables for validation */
>>> @@ -2417,7 +2417,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>>>
>>>                list_add_tail(&mem->resv_list.head, &ctx.list);
>>>                mem->resv_list.bo = mem->validate_list.bo;
>>> -             mem->resv_list.num_shared = mem->validate_list.num_shared;
>>> +             mem->resv_list.usage = mem->validate_list.usage;
>>>        }
>>>
>>>        ret = ttm_eu_reserve_buffers(&ctx.ticket, &ctx.list,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index 60ca14afb879..2ae1c0d9d33a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -55,8 +55,7 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
>>>        bo = amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
>>>        p->uf_entry.priority = 0;
>>>        p->uf_entry.tv.bo = &bo->tbo;
>>> -     /* One for TTM and two for the CS job */
>>> -     p->uf_entry.tv.num_shared = 3;
>>> +     p->uf_entry.tv.usage = DMA_RESV_USAGE_READ;
>>>
>>>        drm_gem_object_put(gobj);
>>>
>>> @@ -519,9 +518,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>                        return r;
>>>        }
>>>
>>> -     /* One for TTM and one for the CS job */
>>>        amdgpu_bo_list_for_each_entry(e, p->bo_list)
>>> -             e->tv.num_shared = 2;
>>> +             e->tv.usage = DMA_RESV_USAGE_READ;
>>>
>>>        amdgpu_bo_list_get_list(p->bo_list, &p->validated);
>>>
>>> @@ -1261,7 +1259,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>>
>>>        /* Make sure all BOs are remembered as writers */
>>>        amdgpu_bo_list_for_each_entry(e, p->bo_list)
>>> -             e->tv.num_shared = 0;
>>> +             e->tv.usage = DMA_RESV_USAGE_WRITE;
>>>
>>>        ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
>>>        mutex_unlock(&p->adev->notifier_lock);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> index c6d4d41c4393..71277257d94d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> @@ -74,7 +74,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>        INIT_LIST_HEAD(&list);
>>>        INIT_LIST_HEAD(&csa_tv.head);
>>>        csa_tv.bo = &bo->tbo;
>>> -     csa_tv.num_shared = 1;
>>> +     csa_tv.usage = DMA_RESV_USAGE_READ;
>>>
>>>        list_add(&csa_tv.head, &list);
>>>        amdgpu_vm_get_pd_bo(vm, &list, &pd);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index 84a53758e18e..7483411229f4 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -207,7 +207,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>>>        INIT_LIST_HEAD(&duplicates);
>>>
>>>        tv.bo = &bo->tbo;
>>> -     tv.num_shared = 2;
>>> +     tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&tv.head, &list);
>>>
>>>        amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
>>> @@ -731,9 +731,9 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>>>                abo = gem_to_amdgpu_bo(gobj);
>>>                tv.bo = &abo->tbo;
>>>                if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
>>> -                     tv.num_shared = 1;
>>> +                     tv.usage = DMA_RESV_USAGE_READ;
>>>                else
>>> -                     tv.num_shared = 0;
>>> +                     tv.usage = DMA_RESV_USAGE_WRITE;
>>>                list_add(&tv.head, &list);
>>>        } else {
>>>                gobj = NULL;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>>> index 5224d9a39737..f670d8473993 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>>> @@ -319,7 +319,7 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
>>>        INIT_LIST_HEAD(&list);
>>>
>>>        tv.bo = &rbo->tbo;
>>> -     tv.num_shared = 1;
>>> +     tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&tv.head, &list);
>>>
>>>        r = ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index 15184153e2b9..515be19ab279 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -633,8 +633,7 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
>>>    {
>>>        entry->priority = 0;
>>>        entry->tv.bo = &vm->root.bo->tbo;
>>> -     /* Two for VM updates, one for TTM and one for the CS job */
>>> -     entry->tv.num_shared = 4;
>>> +     entry->tv.usage = DMA_RESV_USAGE_READ;
>>>        entry->user_pages = NULL;
>>>        list_add(&entry->tv.head, validated);
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> index b3fc3e958227..af844b636778 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> @@ -1395,7 +1395,7 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
>>>                vm = drm_priv_to_vm(pdd->drm_priv);
>>>
>>>                ctx->tv[gpuidx].bo = &vm->root.bo->tbo;
>>> -             ctx->tv[gpuidx].num_shared = 4;
>>> +             ctx->tv[gpuidx].usage = DMA_RESV_USAGE_READ;
>>>                list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
>>>        }
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 73423b805b54..851b7844b084 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -7601,7 +7601,7 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
>>>        INIT_LIST_HEAD(&list);
>>>
>>>        tv.bo = &rbo->tbo;
>>> -     tv.num_shared = 1;
>>> +     tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&tv.head, &list);
>>>
>>>        r = ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
>>> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
>>> index 368d26da0d6a..689e35192070 100644
>>> --- a/drivers/gpu/drm/qxl/qxl_release.c
>>> +++ b/drivers/gpu/drm/qxl/qxl_release.c
>>> @@ -183,7 +183,7 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
>>>
>>>        qxl_bo_ref(bo);
>>>        entry->tv.bo = &bo->tbo;
>>> -     entry->tv.num_shared = 0;
>>> +     entry->tv.usage = DMA_RESV_USAGE_WRITE;
>>>        list_add_tail(&entry->tv.head, &release->bos);
>>>        return 0;
>>>    }
>>> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
>>> index 446f7bae54c4..30afe0c62dd9 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_cs.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
>>> @@ -183,7 +183,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
>>>                }
>>>
>>>                p->relocs[i].tv.bo = &p->relocs[i].robj->tbo;
>>> -             p->relocs[i].tv.num_shared = !r->write_domain;
>>> +             p->relocs[i].tv.usage =
>>> +                     r->write_domain ? DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ;
>>>
>>>                radeon_cs_buckets_add(&buckets, &p->relocs[i].tv.head,
>>>                                      priority);
>>> @@ -258,7 +259,7 @@ static int radeon_cs_sync_rings(struct radeon_cs_parser *p)
>>>
>>>                resv = reloc->robj->tbo.base.resv;
>>>                r = radeon_sync_resv(p->rdev, &p->ib.sync, resv,
>>> -                                  reloc->tv.num_shared);
>>> +                                  reloc->tv.usage != DMA_RESV_USAGE_WRITE);
>>>                if (r)
>>>                        return r;
>>>        }
>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
>>> index 8c01a7f0e027..eae47c709f5d 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>> @@ -635,7 +635,7 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
>>>        INIT_LIST_HEAD(&list);
>>>
>>>        tv.bo = &bo_va->bo->tbo;
>>> -     tv.num_shared = 1;
>>> +     tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&tv.head, &list);
>>>
>>>        vm_bos = radeon_vm_get_bos(rdev, bo_va->vm, &list);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
>>> index 987cabbf1318..702627b48dae 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_vm.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_vm.c
>>> @@ -143,7 +143,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
>>>        list[0].preferred_domains = RADEON_GEM_DOMAIN_VRAM;
>>>        list[0].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
>>>        list[0].tv.bo = &vm->page_directory->tbo;
>>> -     list[0].tv.num_shared = 1;
>>> +     list[0].tv.usage = DMA_RESV_USAGE_READ;
>>>        list[0].tiling_flags = 0;
>>>        list_add(&list[0].tv.head, head);
>>>
>>> @@ -155,7 +155,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
>>>                list[idx].preferred_domains = RADEON_GEM_DOMAIN_VRAM;
>>>                list[idx].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
>>>                list[idx].tv.bo = &list[idx].robj->tbo;
>>> -             list[idx].tv.num_shared = 1;
>>> +             list[idx].tv.usage = DMA_RESV_USAGE_READ;
>>>                list[idx].tiling_flags = 0;
>>>                list_add(&list[idx++].tv.head, head);
>>>        }
>>> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>>> index 0eb995d25df1..c39d8e5ac271 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>>> @@ -101,7 +101,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
>>>                        continue;
>>>                }
>>>
>>> -             num_fences = min(entry->num_shared, 1u);
>>> +             num_fences = entry->usage <= DMA_RESV_USAGE_WRITE ? 0u : 1u;
>>>                if (!ret) {
>>>                        ret = dma_resv_reserve_fences(bo->base.resv,
>>>                                                      num_fences);
>>> @@ -154,8 +154,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
>>>        list_for_each_entry(entry, list, head) {
>>>                struct ttm_buffer_object *bo = entry->bo;
>>>
>>> -             dma_resv_add_fence(bo->base.resv, fence, entry->num_shared ?
>>> -                                DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
>>> +             dma_resv_add_fence(bo->base.resv, fence, entry->usage);
>>>                ttm_bo_move_to_lru_tail_unlocked(bo);
>>>                dma_resv_unlock(bo->base.resv);
>>>        }
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>> index c6d02c98a19a..58dfff7d6c76 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>> @@ -130,7 +130,7 @@ static void vmw_resource_release(struct kref *kref)
>>>                        struct ttm_validate_buffer val_buf;
>>>
>>>                        val_buf.bo = bo;
>>> -                     val_buf.num_shared = 0;
>>> +                     val_buf.usage = DMA_RESV_USAGE_WRITE;
>>>                        res->func->unbind(res, false, &val_buf);
>>>                }
>>>                res->backup_dirty = false;
>>> @@ -552,7 +552,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
>>>        INIT_LIST_HEAD(&val_list);
>>>        ttm_bo_get(&res->backup->base);
>>>        val_buf->bo = &res->backup->base;
>>> -     val_buf->num_shared = 0;
>>> +     val_buf->usage = DMA_RESV_USAGE_WRITE;
>>>        list_add_tail(&val_buf->head, &val_list);
>>>        ret = ttm_eu_reserve_buffers(ticket, &val_list, interruptible, NULL);
>>>        if (unlikely(ret != 0))
>>> @@ -657,7 +657,7 @@ static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
>>>        BUG_ON(!func->may_evict);
>>>
>>>        val_buf.bo = NULL;
>>> -     val_buf.num_shared = 0;
>>> +     val_buf.usage = DMA_RESV_USAGE_WRITE;
>>>        ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf);
>>>        if (unlikely(ret != 0))
>>>                return ret;
>>> @@ -708,7 +708,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
>>>                return 0;
>>>
>>>        val_buf.bo = NULL;
>>> -     val_buf.num_shared = 0;
>>> +     val_buf.usage = DMA_RESV_USAGE_WRITE;
>>>        if (res->backup)
>>>                val_buf.bo = &res->backup->base;
>>>        do {
>>> @@ -777,7 +777,7 @@ void vmw_resource_unbind_list(struct vmw_buffer_object *vbo)
>>>    {
>>>        struct ttm_validate_buffer val_buf = {
>>>                .bo = &vbo->base,
>>> -             .num_shared = 0
>>> +             .usage = DMA_RESV_USAGE_WRITE
>>>        };
>>>
>>>        dma_resv_assert_held(vbo->base.base.resv);
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>> index f46891012be3..0476ba498321 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>> @@ -288,7 +288,7 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
>>>                val_buf->bo = ttm_bo_get_unless_zero(&vbo->base);
>>>                if (!val_buf->bo)
>>>                        return -ESRCH;
>>> -             val_buf->num_shared = 0;
>>> +             val_buf->usage = DMA_RESV_USAGE_WRITE;
>>>                list_add_tail(&val_buf->head, &ctx->bo_list);
>>>                bo_node->as_mob = as_mob;
>>>                bo_node->cpu_blit = cpu_blit;
>>> diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
>>> index a99d7fdf2964..851961a06c27 100644
>>> --- a/include/drm/ttm/ttm_execbuf_util.h
>>> +++ b/include/drm/ttm/ttm_execbuf_util.h
>>> @@ -31,6 +31,7 @@
>>>    #ifndef _TTM_EXECBUF_UTIL_H_
>>>    #define _TTM_EXECBUF_UTIL_H_
>>>
>>> +#include <linux/dma-resv.h>
>>>    #include <linux/list.h>
>>>
>>>    #include "ttm_bo_api.h"
>>> @@ -46,7 +47,7 @@
>>>    struct ttm_validate_buffer {
>>>        struct list_head head;
>>>        struct ttm_buffer_object *bo;
>>> -     unsigned int num_shared;
>>> +     enum dma_resv_usage usage;
>>>    };
>>>
>>>    /**
>

