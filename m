Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DDB58D4FD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 09:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5391CA3D9;
	Tue,  9 Aug 2022 07:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF793CA3AA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 07:55:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qs4Z1BxaYHgmuVdT763fIKoE8K0P0mkJNRoiBUDhUAqfeljzMN8IdmwG0ZMVh6O6iuyzhr9nrgjTm4Yji/+yK9dQyFnkGr7pGHXtqkUtZrzaCXo1vloZ3nBqlXHQxOczpFVIDY0xakbBO5INKaNGtxJdtP4ItRDGQJjoAEM+gdSSZS7S3nM9aw5f5D6TdkROEIutflr2XRoyriTC7TXpPoFItIVMM74wtqHQGXjpuaZ8IAkTchV+FzTvXtowdBglHEThjzaJbPMttEYZfsaxVU53lGaSAEZL4IioMEplNqquD+DmpxtQPyVAk5GW1H2k16YJDicRlYiG923v091RRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rylQ9wwCwKhdnHkHC+zGZDWUU5JcjP+/snakbPcU2aU=;
 b=OUNx4jCbsHME4HShbVqBkk4GPx0CwwjJI8bCt5wj9udycN2F6MeUFxbsOb5I6v7syOVWsnnEoY+LdECIijIIozyxYeFuFNz5p0AShaWnNsNfPn1pi5MjsY++omTkWcgMOTyt3kcs11BoO0zYd9wKqaI7ri9s9EBKhq0/mxFEqb/oaOkEgoWFHLxJa/TFMe0ut7nAXUcoo8G4M6qN4H03oHwUA8Y6/q2tpcatRltX4oPYN83fxNd+Anq6ZY4rLNaXEMt9tWEiKBsXJwFBjAAb6PGUfFvU+AoPwJI0xt7qK3PgJocZ/x+cOkH5iFYGLpOd5a8N84vqPTOStM1Qj8ZfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rylQ9wwCwKhdnHkHC+zGZDWUU5JcjP+/snakbPcU2aU=;
 b=lH7HZ2RheJjOcfRN6nIuA4M0lmL9f2LDUsHfYbET+hWlMGNcbRjOUfpkbb/Sz8enChKMUpA1Qzb9pxsFxcljV9vaSv+x00IsLGoAFF8q0XrIczU6X+FYWVtNE5qCuiVkJ9G0/QTjOrTAFnlZmqDdS5KZGbH7ZgmJWv0won1idJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7026.namprd12.prod.outlook.com (2603:10b6:510:1bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 07:55:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 07:55:18 +0000
Message-ID: <0e284f57-e03c-f128-f6e7-52a58edbcd54@amd.com>
Date: Tue, 9 Aug 2022 09:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/gem: Fix GEM handle release errors
Content-Language: en-US
To: Chen Jeffy <jeffy.chen@rock-chips.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220803083237.3701-1-jeffy.chen@rock-chips.com>
 <c7cb225b-7f21-8d9a-773b-efc655e6332c@amd.com>
 <7cd16264-fa84-7b50-f3ed-64f7f22dcef2@rock-chips.com>
 <64bf4e4b-4e22-0ff0-5f92-76f603c04ec0@amd.com>
 <cd806954-e94e-aec8-2b0c-4047da9a92ec@rock-chips.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cd806954-e94e-aec8-2b0c-4047da9a92ec@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ff9f518-0481-44e2-88a0-08da79dc803e
X-MS-TrafficTypeDiagnostic: PH8PR12MB7026:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7JxvOU8oOE0B2LoeCMzBR1JyMeSPNkxKMdHCFlegg83FBOSS4MiUbPfCwpRw2NXye3ESt3a5jbb0LpTroaKpXNeofK0/NxclyXWjN3tbOz92WAJAj+1uuBheayDH0TfPINNPp63KqNl44ttCtKJUFNddP8Y3AwSZy955pWqp5otCOJtW6rQgbdoOBHb1OSbdw0IGFiYLBIK3VLbKiNK1FLWh27mhgSEyTOb5aeU9btFZw2nAHgiiDrgG2rU/DxYpMjR7L7f+2qJ1g9p3JK1SGCYmOoX6kI4XRRKDHe6pdaxkGFNeclMWrAIORJYhe4/H/E2reULDi2I08Ya29rBo9WFsUHnt93VSO+wgTP04vZJCT3lu+HR1ayVlcLgtOe9EGKWmnEzgfshUEwAAdezT6Aj3dQkhywOKvysn7erKcJbNjqP18jK73C/YLPd9Fwf3t+VUkqcolDh5MpsoEmeVQaE+zf0ZTlW3uUDGdYOwVJ6UxgAoLP0e5WLF5HbNwzLa/vsKIyhKDfjixu9q4+cjKZYKXW6F6OB36f/FbzJn7hFNl1xiFBbe4uX/g+D5wpQjT8gZ+g5aEd48gzCdF11NmZ0gt29oTp19viCYs9cnSLc9qQ6WgXGR/xszMC3D1GVqcsf223Jy5jc+U13uE7WMjKGNCeB5Z6Oj8sufQeCQuxkT62DoNO7xoyYqMCxKzHYDg/8xKAx7ptI2CHVjaYDaDmRFzTDmsIKnU0f1EpTkm6CIq82HKJ80SCc4TDJIDSQgNRPk329UBBXmKlBbFgQcL6laoaKLi91+JBGJxCUeXxQsmujyyjCL+YWOsqwy6eLSdoPdIxMV3smoEt4StZDxLHLj3p4dOHXH+Ye+MJavMP/buj047iS+IUNFu2F8EDdw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(31696002)(31686004)(2906002)(2616005)(478600001)(110136005)(54906003)(36756003)(38100700002)(8936002)(5660300002)(7416002)(6666004)(66946007)(6512007)(26005)(4326008)(6506007)(83380400001)(41300700001)(66476007)(66574015)(316002)(86362001)(66556008)(8676002)(186003)(6486002)(966005)(45080400002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGhjM3pwUFpJb3NsbVpuTnRCNElPUkhxV3pOT29ySTZ1eU1jNTlIVjJZQXJ5?=
 =?utf-8?B?cElGeDIrTlNsQi9xQlRQdHZRY3N4Q0xCVTZzVXFTdzN4d2VkQXRoKzU4SlRT?=
 =?utf-8?B?OEVnaWR4VEJyZkEyTGNDOFhTNzZSV1BueGpoTDZTRjlwWEU0NFNJUUlITXVq?=
 =?utf-8?B?c0JralNSRmRrbGhTcWtXcUNYM3d6RG52d1A0SkNUMUlrWEJRdFFYWjdvU2ZB?=
 =?utf-8?B?dEpYRXBMRXlNTkFPNUQ1U2ovYWpneGNoSFBGZjFWRGVtU1ZqZkY2Tm1ubVB2?=
 =?utf-8?B?TEppd3dKaGFTZlQ4SGZNeUYraWhHMThBM2xtUGFaYkg3eW1aSkQzREZWVGlQ?=
 =?utf-8?B?eU1UR21pRnRSV2VSNTl3WTU4YVpzUlVRdkZUR0RSaUZYUUNxYmtFd2tsM0FT?=
 =?utf-8?B?VjdDekJMVUowSFZEWW5McHZWMWxHK0F3MTY4REdYMHlMTFFya2JNMkxkLzdB?=
 =?utf-8?B?aXRIdkwwSVdyR3dYbzJRMkEyc2ZjUTBSK25zWDFKanVPUkFBSEd3L1RxMUtr?=
 =?utf-8?B?RzRCUDhtRmdGRkdrZ1dRM1hyUEIzT3VOS2I3VUlMZk1BWmJwL2xnWlE3T21Y?=
 =?utf-8?B?REhzYnI3aVcyQTNOY21uMDg0eHpINU1WVFFhRFNqUVN0ZUFmNVFpc0RyMWhi?=
 =?utf-8?B?d0FIdW43Mmk2YkVsaHdjTE1ZT1FpQ0pNTnN0WkQ1dFFKUHJxa1pxeEQ2UFdy?=
 =?utf-8?B?dHZOeUk3YzJhV3U4UmV2MGpsWU44Y1BUV2lXOVJGTENmUWNOdVhPZ2NMQ3Bw?=
 =?utf-8?B?WXB1SmJ1UG00K1czbE1rZytmUVdQRmVQeVEzN2Vzd0JSOG9CRjJYSWVvVStY?=
 =?utf-8?B?UDZydHJiUmc4QmwrT2FJZTFSem5FdzhQdHl3NllPQkY2cjIyRE52OW0vK0hX?=
 =?utf-8?B?aE1SemtmdWxWMVBxNjdVL3NBeGIrV0huNWp4Sjl5dGZlUFExeG80VUJMRkpl?=
 =?utf-8?B?bEEyVEhPL2NtYXhSdnFwVjZtMHA5d2dXY3Ntc1RTZHJDUzZQWTR5TTBXQXZ1?=
 =?utf-8?B?R2ZyZ3EwRVEyd1Y5Z3d2SlA2OUQ4bys3Q2lNaXN1M0FrRVFkUzNFWnNRNXJC?=
 =?utf-8?B?bUVXVFU2SUFoNm1haDJRekZ5elFLZjJHYnB1QmpCWkNTeENXQnd4WlFGb2xS?=
 =?utf-8?B?TXc3ZFRidkxGUituUzJCQzUvM3h2N0ZhTjFQZDdkNHZKMnp3Z0FSWDNDRVF1?=
 =?utf-8?B?Y3BLR1ZsQStVbjhJS0dzWE5Tc00vQ2JSaGU2RjI0TXBKalNVKzl4Zld0OWZG?=
 =?utf-8?B?ZjJPdXJ2emRheGF3cmFsd3Zoend0VXhNRFBsMVlhenlBdzRKbmpramZMTlBi?=
 =?utf-8?B?TC82eDlFVWd3T2tyWkxoQXpZVnh3Z1ROOHdsaGVyVHJCM1J5eUd2cTAxeVB4?=
 =?utf-8?B?S25WR0E0Q1MvOUJlTGN4c2JXejRFNnZVWkoyTzlPMmgxdkxLM1hwR3hIZmlC?=
 =?utf-8?B?RDkwYk9ZcVIzMzBVYmZqcGlTWmtRY2FkSU5yWU0wY2dFSXRGMlBDVUVOallq?=
 =?utf-8?B?SEwvTGJaRm5kdWt2YkxqSmlSbXRTbXFpeWxXYW1mcDZMV1o1TlE3M0FDT0Zu?=
 =?utf-8?B?VWpJcnBNbjQzQ09aQW9NMWN6a043VUppWEw2bTBIK3FqSXdtWEgrNm5yRUlI?=
 =?utf-8?B?WGVQR01WamZ5R3UzVkpMS1Q5a3B5TFovTG9HbGtHbC85WlQzRU5lbFAzMnFm?=
 =?utf-8?B?a0wwdFBOTW9MR2ZEUkV2d3VWNjVEbHN2b3BmUk5lbVBpeDJGeVJjK01NVFZS?=
 =?utf-8?B?cktQODdKK3lWNVJYRXFpUGs3aEhScHJxNVhIbkpROHN1N2tWdzBYYzYvV1NL?=
 =?utf-8?B?SFBWUEQzdWFlRHJoamdkZFJSaGZHL2xkczlKT3B0NlIrdmhqb3VvWUhLcGNs?=
 =?utf-8?B?bFdJVGkrU3FqeC96RWpEWS9XVC9VSXRYNG90ZHIvUi8xbGJrejJ5QUtEdE9T?=
 =?utf-8?B?Um55QjRsb1hoZFBVKzkwMzZoVDREazF3SDIyV2xMMEVseGpvRFVsTWNRY2Ji?=
 =?utf-8?B?VlZBZ2VTSDJWN1BzRnVRYTE4RWVnRzcrSTlnUUFSK3RqOVZ1b1RYYk9hRFFo?=
 =?utf-8?B?d011cDZLdWNPV3I5b0x5T1pjQWJCTHpDamFGT3p0TEZNZXIzSlBxOUFvNDRp?=
 =?utf-8?Q?26Ghh6r8YHmrG46C9ay/M0JqS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff9f518-0481-44e2-88a0-08da79dc803e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 07:55:18.0037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUnaJwUjvTZDq82ApoMuAsUoiVyqNDV8shMorTKIJKiTCkqRSchCKVLF+0WMZdQW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7026
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.08.22 um 03:28 schrieb Chen Jeffy:
> Hi Christian,
>
> On 8/9 星期二 2:03, Christian König wrote:
>> Hi Jeffy,
>>
>> Am 08.08.22 um 05:51 schrieb Chen Jeffy:
>>> Hi Christian,
>>>
>>> Thanks for your reply, and sorry i didn't make it clear.
>>>
>>> On 8/8 星期一 0:52, Christian König wrote:
>>>> Am 03.08.22 um 10:32 schrieb Jeffy Chen:
>>>>> Currently we are assuming a one to one mapping between dmabuf and 
>>>>> handle
>>>>> when releasing GEM handles.
>>>>>
>>>>> But that is not always true, since we would create extra handles 
>>>>> for the
>>>>> GEM obj in cases like gem_open() and getfb{,2}().
>>>>>
>>>>> A similar issue was reported at:
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20211105083308.392156-1-jay.xu%40rock-chips.com%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C52cd6ca16a3a415b92a708da79a67dec%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637956053232922419%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=hIuH18B10sbVAyS0D4iK6R6WYc%2BZ7mlxGcKdUae%2BW6Y%3D&amp;reserved=0 
>>>>>
>>>>>
>>>>> Another problem is that the drm_gem_remove_prime_handles() now only
>>>>> remove handle to the exported dmabuf (gem_obj->dma_buf), so the 
>>>>> imported
>>>>> ones would leak:
>>>>> WARNING: CPU: 2 PID: 236 at drivers/gpu/drm/drm_prime.c:228 
>>>>> drm_prime_destroy_file_private+0x18/0x24
>>>>>
>>>>> Let's fix these by using handle to find the exact map to remove.
>>>>
>>>> Well we are clearly something missing here. As far as I can see the 
>>>> current code is correct.
>>>>
>>>> Creating multiple GEM handles for the same DMA-buf is possible, but 
>>>> illegal. >
>>>> In other words when a GEM handle is exported as DMA-buf and 
>>>> imported again you should intentionally always get the same handle.
>>>
>>> These issue are not about having handles for importing an exported 
>>> dma-buf case, but for having multiple handles to a GEM object(which 
>>> means having multiple handles to a dma-buf).
>>>
>>> I know the drm-prime is trying to make dma-buf and handle maps one 
>>> to one, but the drm-gem is allowing to create extra handles for a 
>>> GEM object, for example:
>>> drm_gem_open_ioctl -> drm_gem_handle_create_tail
>>> drm_mode_getfb2_ioctl -> drm_gem_handle_create
>>> drm_mode_getfb -> fb->funcs->create_handle
>>
>> Yes, so far that's correct.
>>
>>>
>>>
>>> So we are allowing GEM object to have multiple handles, and GEM 
>>> object could have at most one dma-buf, doesn't that means that 
>>> dma-buf could map to multiple handles?
>>
>> No, at least not for the same GEM file private. That's the reason why 
>> the rb is indexed by the dma_buf object and not the handle.
>>
>> In other words the rb is so that you have exactly one handle for each 
>> dma_buf in each file private.
>
> I don't think so, because if user get multiple handles for the same 
> GEM obj and use drm_gem_prime_handle_to_fd() for those handles

Mhm, that works? This is illegal and should have been prevented somehow.

Let me double check the code.

Thanks for pointing that out,
Christian.


> , the current code would try to add multiple maps to rb:
> drm_prime_add_buf_handle(buf_1, hdl_1)
> drm_prime_add_buf_handle(buf_1, hdl_2)
> ...
> drm_prime_add_buf_handle(buf_1, hdl_n)
>
>>
>>>
>>> Or should we rewrite the GEM framework to limit GEM object with uniq 
>>> handle?
>>
>> No, the extra handles are expected because when you call 
>> drm_mode_getfb*() and drm_gem_open_ioctl() the caller now owns the 
>> returned GEM handle.
>>
>>>
>>> The other issue is that we are leaking dma-buf <-> handle map for 
>>> the imported dma-buf, since the drm_gem_remove_prime_handles doesn't 
>>> take care of obj->import_attach->dmabuf.
>>
>> No, that's correct as well. obj->dma_buf is set even for imported 
>> DMA-buf objects. See drm_gem_prime_fd_to_handle().
>
> Well, that obj->dma_buf would be set in 
> drm_gem_prime_fd_to_handle(create new handle), and cleared when 
> releasing the latest handle(release handle).
>
> So it doesn't cover other handle creating path.
>
> For example, a imported dma buf:
> drm_gem_prime_fd_to_handle <-- we got a handle and obj->dma_buf and 
> obj->import_attach->dmabuf
> drm_gem_handle_delete <-- we lost that handle and obj->dma_buf cleared
> drm_gem_open_ioctl/or getfb* <-- we got a new handle and 
> obj->import_attach->dmabuf
> drm_gem_handle_delete <-- we lost that handle and obj->dma_buf is 
> null, which means rb leaks.
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> But of cause this can be fixed in other way:
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -180,6 +180,9 @@ drm_gem_remove_prime_handles(struct 
>>> drm_gem_object *obj, struct drm_file *filp)
>>> drm_prime_remove_buf_handle_locked(&filp->prime,
>>> obj->dma_buf);
>>>         }
>>> +       if (obj->import_attach)
>>> + drm_prime_remove_buf_handle_locked(&filp->prime,
>>> + obj->import_attach->dmabuf);
>>>         mutex_unlock(&filp->prime.lock);
>>>  }
>>>
>>>
>>>> So this is pretty much a clear NAK to this patch since it shouldn't 
>>>> be necessary or something is seriously broken somewhere else.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
>>>>> ---
>>>>>
>>>>> Changes in v2:
>>>>> Fix a typo of rbtree.
>>>>>
>>>>>   drivers/gpu/drm/drm_gem.c      | 17 +----------------
>>>>>   drivers/gpu/drm/drm_internal.h |  4 ++--
>>>>>   drivers/gpu/drm/drm_prime.c    | 20 ++++++++++++--------
>>>>>   3 files changed, 15 insertions(+), 26 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>> index eb0c2d041f13..ed39da383570 100644
>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>> @@ -168,21 +168,6 @@ void drm_gem_private_object_init(struct 
>>>>> drm_device *dev,
>>>>>   }
>>>>>   EXPORT_SYMBOL(drm_gem_private_object_init);
>>>>> -static void
>>>>> -drm_gem_remove_prime_handles(struct drm_gem_object *obj, struct 
>>>>> drm_file *filp)
>>>>> -{
>>>>> -    /*
>>>>> -     * Note: obj->dma_buf can't disappear as long as we still hold a
>>>>> -     * handle reference in obj->handle_count.
>>>>> -     */
>>>>> -    mutex_lock(&filp->prime.lock);
>>>>> -    if (obj->dma_buf) {
>>>>> - drm_prime_remove_buf_handle_locked(&filp->prime,
>>>>> -                           obj->dma_buf);
>>>>> -    }
>>>>> -    mutex_unlock(&filp->prime.lock);
>>>>> -}
>>>>> -
>>>>>   /**
>>>>>    * drm_gem_object_handle_free - release resources bound to 
>>>>> userspace handles
>>>>>    * @obj: GEM object to clean up.
>>>>> @@ -253,7 +238,7 @@ drm_gem_object_release_handle(int id, void 
>>>>> *ptr, void *data)
>>>>>       if (obj->funcs->close)
>>>>>           obj->funcs->close(obj, file_priv);
>>>>> -    drm_gem_remove_prime_handles(obj, file_priv);
>>>>> +    drm_prime_remove_buf_handle(&file_priv->prime, id);
>>>>>       drm_vma_node_revoke(&obj->vma_node, file_priv);
>>>>>       drm_gem_object_handle_put_unlocked(obj);
>>>>> diff --git a/drivers/gpu/drm/drm_internal.h 
>>>>> b/drivers/gpu/drm/drm_internal.h
>>>>> index 1fbbc19f1ac0..7bb98e6a446d 100644
>>>>> --- a/drivers/gpu/drm/drm_internal.h
>>>>> +++ b/drivers/gpu/drm/drm_internal.h
>>>>> @@ -74,8 +74,8 @@ int drm_prime_fd_to_handle_ioctl(struct 
>>>>> drm_device *dev, void *data,
>>>>>   void drm_prime_init_file_private(struct drm_prime_file_private 
>>>>> *prime_fpriv);
>>>>>   void drm_prime_destroy_file_private(struct 
>>>>> drm_prime_file_private *prime_fpriv);
>>>>> -void drm_prime_remove_buf_handle_locked(struct 
>>>>> drm_prime_file_private *prime_fpriv,
>>>>> -                    struct dma_buf *dma_buf);
>>>>> +void drm_prime_remove_buf_handle(struct drm_prime_file_private 
>>>>> *prime_fpriv,
>>>>> +                 uint32_t handle);
>>>>>   /* drm_drv.c */
>>>>>   struct drm_minor *drm_minor_acquire(unsigned int minor_id);
>>>>> diff --git a/drivers/gpu/drm/drm_prime.c 
>>>>> b/drivers/gpu/drm/drm_prime.c
>>>>> index e3f09f18110c..bd5366b16381 100644
>>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>>> @@ -190,29 +190,33 @@ static int 
>>>>> drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpri
>>>>>       return -ENOENT;
>>>>>   }
>>>>> -void drm_prime_remove_buf_handle_locked(struct 
>>>>> drm_prime_file_private *prime_fpriv,
>>>>> -                    struct dma_buf *dma_buf)
>>>>> +void drm_prime_remove_buf_handle(struct drm_prime_file_private 
>>>>> *prime_fpriv,
>>>>> +                 uint32_t handle)
>>>>>   {
>>>>>       struct rb_node *rb;
>>>>> -    rb = prime_fpriv->dmabufs.rb_node;
>>>>> +    mutex_lock(&prime_fpriv->lock);
>>>>> +
>>>>> +    rb = prime_fpriv->handles.rb_node;
>>>>>       while (rb) {
>>>>>           struct drm_prime_member *member;
>>>>> -        member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
>>>>> -        if (member->dma_buf == dma_buf) {
>>>>> +        member = rb_entry(rb, struct drm_prime_member, handle_rb);
>>>>> +        if (member->handle == handle) {
>>>>>               rb_erase(&member->handle_rb, &prime_fpriv->handles);
>>>>>               rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>>>>> -            dma_buf_put(dma_buf);
>>>>> +            dma_buf_put(member->dma_buf);
>>>>>               kfree(member);
>>>>> -            return;
>>>>> -        } else if (member->dma_buf < dma_buf) {
>>>>> +            break;
>>>>> +        } else if (member->handle < handle) {
>>>>>               rb = rb->rb_right;
>>>>>           } else {
>>>>>               rb = rb->rb_left;
>>>>>           }
>>>>>       }
>>>>> +
>>>>> +    mutex_unlock(&prime_fpriv->lock);
>>>>>   }
>>>>>   void drm_prime_init_file_private(struct drm_prime_file_private 
>>>>> *prime_fpriv)
>>>>
>>>>
>>>
>>
>>
>

