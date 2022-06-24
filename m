Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDB9559E3A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 18:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19CF10EBC5;
	Fri, 24 Jun 2022 16:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2074.outbound.protection.outlook.com [40.107.95.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BD710EBC5;
 Fri, 24 Jun 2022 16:13:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcRhDuekiyJ+OEO/DZRkuOTRYa+k11d/4F7DUCqgBu/tRVZrrxUUiXmI/WFlPYWbwDGQDb+ACB4afwfe9nxNrij5MIiNpDFxgAsjHVei7sWNKqybF5aMavKuV+AJDXQAJkhUiACqnObm4dyi3xRk62f8u2aLrxw0gdhlnXB0I3KBtWtLo/boVRO7QvLprEp2FH/ms3B1jmpFSURbfERh3Ou9troCvSvDtoP5mP4p6txb9f5TuhdtL9pIOHdjY+HUXTcuuzbs4B4ugzy8nNyMkpqWbW78DHyCwSW2pqiu7zasyBbqlmUcRwkwApHjLelmCkG4hRE8bLU6Jl/6KwCvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFRdunkTo01EgBqxATLZe68Iv5Tb4twd7F5qf60EytU=;
 b=L6bWR5SLIKia9KA/Tu37AKbkVgwo9pfVgyYoqkoX7WkzaG/aHDgsHAHhNKFaPXFoF9kdxGg/U0BQu+3xxhOep5HPgX+rmcRe+2V76T0Z0BIyV8PAoV6mR193Oe7OFr8UWHJRlkjut+HYe2K8t9tk4749IEhB1JXZFhk21SbwidshDBOOnK83DAX3VbEBN2Wo0iNO/BgPxGGrKWu403ukzojxxPp/rgY40DMYo6Fg6BLKNN2n7+qLqhorA+XWljtMmu2vH6R0LmoD8KTU13+g/3JqMT25aHhlVs4cPV5Tad007chbJwHRrCc18jGj7y5F3PLsRGezcx8beX9I0US1xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFRdunkTo01EgBqxATLZe68Iv5Tb4twd7F5qf60EytU=;
 b=sZyIounpb8YpM8ueg/5fPU/0D76OiGB/k3tXP7EhRt9Ic6e4nNqclx56WSb5Sv5CUFJdkHfI1UwCkArT3bWc1vwvUu66T38Z3batd0vKtyUgitXn3bDoVKEWE1skyATnlSX8La3y7g7/rcefAjlF3jgePZbcGRtdcSUg/NOJ7WQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 24 Jun
 2022 16:13:43 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::4534:eee9:f4ea:e9fb]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::4534:eee9:f4ea:e9fb%6]) with mapi id 15.20.5373.017; Fri, 24 Jun 2022
 16:13:43 +0000
Message-ID: <be3bb03c-2f30-283a-c47b-a50016a4fa86@amd.com>
Date: Fri, 24 Jun 2022 11:13:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Alistair Popple
 <apopple@nvidia.com>, akpm@linux-foundation.org
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <7605beee-0a76-4ee9-e950-17419630f2cf@redhat.com>
 <ddcebcc1-fb0a-e565-f14d-77c9d48f2928@amd.com>
 <6aef4b7f-0ced-08cd-1f0c-50c22996aa41@redhat.com>
 <65987ab8-426d-e533-0295-069312b4f751@amd.com>
 <34e94bdb-675a-5d5c-6137-8aa1ee658d49@redhat.com>
 <87letq6wb5.fsf@nvdebian.thelocal>
 <643c44e7-48be-375b-c7ab-6a30b5ee2937@redhat.com>
 <f5b9f777-85a2-9c38-17f3-0c9be1eeb867@amd.com>
 <01cf9f24-d7fc-61e9-1c28-85dc5aabe645@redhat.com>
 <01cad0cf-9937-8699-6df3-7d5dfa681922@amd.com>
 <9af76814-ee3a-0af4-7300-d432050b13a3@redhat.com>
 <c7d4d9a9-ac8a-b48d-55f3-9d2450e660ef@amd.com>
 <1ee41224-1095-7fb6-97c0-bf5add2e467b@redhat.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <1ee41224-1095-7fb6-97c0-bf5add2e467b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:208:236::21) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1c47af3-7517-4d00-1a76-08da55fc828e
X-MS-TrafficTypeDiagnostic: MN0PR12MB6320:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJtdDGJBcnvcg4aawMmvkF14eDF9L1SjwVw/3edPGOZ/egF6VFBKRTkkFqHHz4VQCjgLe7s+OVwdQO/d3H61wyaHz3R1cqndzYw2ZRIicJjkGKeqDgUsR5isXa52+nLq8i2z36qrgJdIUk2syTo56KT/fzj8HJ/840kxNFNt+FzO3fEDea8JTRuUEBc5amH3oNLkEmpbZiTF899HjV46G4ptvdIcwrAC4MWDjaR/awi9h1WdFWfq/IqKD6Prju83HyZCDw9VY8pNnVvcHU323YU1DCqHO5Lw81CduTU0XJwQI26Q5WLg479jfpf8NvIJk7vl+tmySALHEMgZYcTDSYdAEuwD4xNV5AwDQqtKuWnF9N3bOQP7RhQFIKB1h6HxcGvgDz5jvqIHKy5OAjnnqqGdyZxg02ms/0IKJuGXiA8r2QVQU5bOYUB74BguEPlt2flPBUJLbNQnAYG62KNHDjMd2+IlB0Y3BYIF+apM8ggP+53BCmjePuCiOdzMtlT9Qmh5ZD+iQCnItCo3q7LLAvzdtcYg0/zISmrWo2rslgjA6rC1rurqQnD9nk35G14OjLrFtm1ejjXarUrQb1yLX6tG+AFJeVy+4WsRNqInMO2qfQOHmiw9DnQPweOOXK0NnBDoAg2xJOz6m4SEAxca29blz59uMvYqB6ikNpF6OQ/0MKOdBpgk+yiMYbx0N6vhXcjJIke8muvK7f/TwdsqtCbryMxlNvTBVQatxgzXJXLRzduqMjIm9RVzzO+hCrn/eL4xfwg1vpPtjFU4FBPLtD8xtLB0NA8lbGaOB9ckm1vohwJkxj4Suc9fj/JEI0Igh53Qi9exOrip7X6lIllfCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(8936002)(36756003)(66556008)(6666004)(4326008)(66946007)(53546011)(186003)(8676002)(41300700001)(316002)(110136005)(478600001)(6486002)(66476007)(6512007)(2616005)(7416002)(2906002)(31686004)(30864003)(26005)(38100700002)(5660300002)(31696002)(83380400001)(86362001)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0p6RTVmdE1yK1lTYnlNRGt4dzlTYzZYNDI0bFNjZzZIWXMzTjJJRDl3SElT?=
 =?utf-8?B?OUM1M1pFKzF0amNwYThaalpubFRacXV6dm4rWi9LV0Y4eUVxMU16ZEtGY0tE?=
 =?utf-8?B?TUN2SjFjZllIUkw0aFVMN0hZcG9DTm40eGVBUlAzWDZjUWJYcE8rL2lUOGJU?=
 =?utf-8?B?QlZZQUJvSnJSaXphMlZFeThMWTBQc2pzbUdnREdaazhQcHQ2emQxc041SFVx?=
 =?utf-8?B?UXpFcjRtNDNBZ3gxa1ljNWlIYzNoRkU4SngvczRWMkJSZnBDWFdsbEJ3dlFi?=
 =?utf-8?B?K0dXblNkQWFEUmVOVTVhVVhHOTVJYjVlM2MzZFFteHJLWnlwRGdCRWtLZTJY?=
 =?utf-8?B?VUwrWkpWQmtyZC9nckJYdGszc28vV05TVmxyMzZXWGlMTVlNUm5YUWxUK3Vj?=
 =?utf-8?B?SkFXMWhDdU42WjQ1R2hKckhQcnVqdFowWHJpSzRzdHVVVWpPaFp5RE93bFgx?=
 =?utf-8?B?c2hjVjZJdTJOVDBNaWRTSmJpaGZHb2k0Y0ZNRDhaMkl2ZnE2eWNtNlZzWHVP?=
 =?utf-8?B?Y1I1SkVmQUNvS1FNWTNiMTRORzlKWk8vVXNrNkRod1lWRDZvcWhnZnExMVYv?=
 =?utf-8?B?a21zV0pVS2ZWY3FDdzNqUFgwVWxsT1ZsbUxRU0FJb05NMUNuMEM4a0xtZTUz?=
 =?utf-8?B?UzNPai84NGdIeElBdDhad3JWY1hOeXZ2SnVsbEdrSVJJV3lCeHE0UWU5UnBX?=
 =?utf-8?B?TmZnUE4ySmJsdCsxcDNzeWU3QmxmVnBQdlJjNDhUdWhzMk8vc3VxYVZpbTg2?=
 =?utf-8?B?M1p6WUdUemNjWlNMVWlLYnNCWTRBQWduNjFOR3RSS2NWWTdzRnJWbklSYmx0?=
 =?utf-8?B?TUNlOEFwaEU1cFFXM3dXdVc5TjdxSGRCSXd5NFlQL1BDQUpsT202S0xPWjFT?=
 =?utf-8?B?dzZVSEg4czhINzBaZHFXZVJqbUNhWnNwMmtOYmgvSlJNMUNKVzJGODhnR3Nk?=
 =?utf-8?B?eHFNRUpDZGVqZzJtUzVIQW9INW43M3JNZkEza3V6UGR1OXpiVnZ1dWF2SlRR?=
 =?utf-8?B?Tmd5SkJVVjBLK3ZlQjhwSlNMb2FudjJaZ2QvVHBRZytlTGduallWTThqWGJD?=
 =?utf-8?B?NllaMGJORXBZMFBXTFhsM1hSalNjWGFBQVJIWFZXdUNjT0tFN25PQTFrVDdh?=
 =?utf-8?B?aEVPbGQ5OWZXM1puejdkMzVDY2xpeEEwWndsU0Jlb3NGUTNzczdFQTFQWTRE?=
 =?utf-8?B?OTgwYUo4OHpMT1ora3MxdkV3bWZLSzN3RTUrZDlWNUhIVWFIby9iUXJOWlEw?=
 =?utf-8?B?c0tSL2R5SlFwN2Q3cUFBY1kyUzVSeWRlWlFKQmFLcUVGZFdVMitUTjhManI4?=
 =?utf-8?B?UnRKa1Niby9Ub3JzVnlXUFNKa1pMQ1N0OXl4NWxITXRWcGp4NWM2a1RXeXJn?=
 =?utf-8?B?WFdxd0kzSW10MjFhMHV6OEpCMVpka2pqRVR0MWpGNUdRcmRGWU0xbktHNXVj?=
 =?utf-8?B?K1VSOGl1bGlUQW5vWEJBS2Nld1RjUWJxQ1Bva0g5c0xWUG1WMlcwcExiWEJL?=
 =?utf-8?B?c0JKY00wbTV0czkyU3VINmFtSVB3M3MyZDlwWFUwNS8vT0Y3OS9RR0lEWU5Q?=
 =?utf-8?B?aDFoWmlWSXluTkdOamVIU21RZE5UcU5uT3lWOS9RS05DZ3Jya0g0T1RKZDlw?=
 =?utf-8?B?aDJCdFl5bkc5K1paa1pXWm9sa2hjWXNjZEJuZFRBcUJZRFZoOEJQTFdqL09T?=
 =?utf-8?B?bmVpY2l3ZEF0dk9zNUs4dDVPUnBmYVVVLzB5bzk0QnF3MkhPWDN4UWJLUlFB?=
 =?utf-8?B?bGZmVmkzdGFnTUxYNVFEL2ZEc2VTcWQ4NGIxUHpvOTI3L3J0WUVkUDRZUVVq?=
 =?utf-8?B?c1RSK2czbTF5c0lCMVQ4WXJOYkt0N2h3ZG1QU3AyVlRVampBanZjbmxORkpv?=
 =?utf-8?B?ZGQ4NVpYRmJSQVRTYjFUY0I3dE5hb05jQjBYZE9YTEhSbG52QThiaVFGaVRl?=
 =?utf-8?B?OGFtSnN1WGhmb3MyaXRHbDJLaGU2Vk9NSk8va0hhdTljdkxTOVZ4MjVYeTNB?=
 =?utf-8?B?Z25uWVBBZE5nNmp1OWF5djAvT2I1UzJZN1ROcEl4em84ZVp3US8zMW5odGlo?=
 =?utf-8?B?czJOR0ZXVEdNOUVOMXNnV1FCbXJGV0FyQWYrdXQ5cWdWcStlWXYzTFB2WnlW?=
 =?utf-8?Q?fhO/aL5r2dHYwzd0rd68wM7fJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c47af3-7517-4d00-1a76-08da55fc828e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 16:13:43.8223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iijVn1j9T587YaNgz2v/11DuEvBQTc+hQwKntK8yxJQjB+p2mjO0SKDMWD00XeFJUNxhHfSxwmrzy2MacP9GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320
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
Cc: rcampbell@nvidia.com, willy@infradead.org,
 Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, linux-ext4@vger.kernel.org,
 hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/23/2022 1:21 PM, David Hildenbrand wrote:
> On 23.06.22 20:20, Sierra Guiza, Alejandro (Alex) wrote:
>> On 6/23/2022 2:57 AM, David Hildenbrand wrote:
>>> On 23.06.22 01:16, Sierra Guiza, Alejandro (Alex) wrote:
>>>> On 6/21/2022 11:16 AM, David Hildenbrand wrote:
>>>>> On 21.06.22 18:08, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>> On 6/21/2022 7:25 AM, David Hildenbrand wrote:
>>>>>>> On 21.06.22 13:55, Alistair Popple wrote:
>>>>>>>> David Hildenbrand<david@redhat.com>  writes:
>>>>>>>>
>>>>>>>>> On 21.06.22 13:25, Felix Kuehling wrote:
>>>>>>>>>> Am 6/17/22 um 23:19 schrieb David Hildenbrand:
>>>>>>>>>>> On 17.06.22 21:27, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>>>>>>> On 6/17/2022 12:33 PM, David Hildenbrand wrote:
>>>>>>>>>>>>> On 17.06.22 19:20, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>>>>>>>>> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>>>>>>>>>>>>>>> On 31.05.22 22:00, Alex Sierra wrote:
>>>>>>>>>>>>>>>> Device memory that is cache coherent from device and CPU point of view.
>>>>>>>>>>>>>>>> This is used on platforms that have an advanced system bus (like CAPI
>>>>>>>>>>>>>>>> or CXL). Any page of a process can be migrated to such memory. However,
>>>>>>>>>>>>>>>> no one should be allowed to pin such memory so that it can always be
>>>>>>>>>>>>>>>> evicted.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Signed-off-by: Alex Sierra<alex.sierra@amd.com>
>>>>>>>>>>>>>>>> Acked-by: Felix Kuehling<Felix.Kuehling@amd.com>
>>>>>>>>>>>>>>>> Reviewed-by: Alistair Popple<apopple@nvidia.com>
>>>>>>>>>>>>>>>> [hch: rebased ontop of the refcount changes,
>>>>>>>>>>>>>>>>              removed is_dev_private_or_coherent_page]
>>>>>>>>>>>>>>>> Signed-off-by: Christoph Hellwig<hch@lst.de>
>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>         include/linux/memremap.h | 19 +++++++++++++++++++
>>>>>>>>>>>>>>>>         mm/memcontrol.c          |  7 ++++---
>>>>>>>>>>>>>>>>         mm/memory-failure.c      |  8 ++++++--
>>>>>>>>>>>>>>>>         mm/memremap.c            | 10 ++++++++++
>>>>>>>>>>>>>>>>         mm/migrate_device.c      | 16 +++++++---------
>>>>>>>>>>>>>>>>         mm/rmap.c                |  5 +++--
>>>>>>>>>>>>>>>>         6 files changed, 49 insertions(+), 16 deletions(-)
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>>>>>>>>>>>> index 8af304f6b504..9f752ebed613 100644
>>>>>>>>>>>>>>>> --- a/include/linux/memremap.h
>>>>>>>>>>>>>>>> +++ b/include/linux/memremap.h
>>>>>>>>>>>>>>>> @@ -41,6 +41,13 @@ struct vmem_altmap {
>>>>>>>>>>>>>>>>          * A more complete discussion of unaddressable memory may be found in
>>>>>>>>>>>>>>>>          * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>>>>>>>>>>>>>>>          *
>>>>>>>>>>>>>>>> + * MEMORY_DEVICE_COHERENT:
>>>>>>>>>>>>>>>> + * Device memory that is cache coherent from device and CPU point of view. This
>>>>>>>>>>>>>>>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>>>>>>>>>>>>>>>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>>>>>>>>>>>>>>>> + * type. Any page of a process can be migrated to such memory. However no one
>>>>>>>>>>>>>>> Any page might not be right, I'm pretty sure. ... just thinking about special pages
>>>>>>>>>>>>>>> like vdso, shared zeropage, ... pinned pages ...
>>>>>>>>>>>>> Well, you cannot migrate long term pages, that's what I meant :)
>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> + * should be allowed to pin such memory so that it can always be evicted.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>>          * MEMORY_DEVICE_FS_DAX:
>>>>>>>>>>>>>>>>          * Host memory that has similar access semantics as System RAM i.e. DMA
>>>>>>>>>>>>>>>>          * coherent and supports page pinning. In support of coordinating page
>>>>>>>>>>>>>>>> @@ -61,6 +68,7 @@ struct vmem_altmap {
>>>>>>>>>>>>>>>>         enum memory_type {
>>>>>>>>>>>>>>>>         	/* 0 is reserved to catch uninitialized type fields */
>>>>>>>>>>>>>>>>         	MEMORY_DEVICE_PRIVATE = 1,
>>>>>>>>>>>>>>>> +	MEMORY_DEVICE_COHERENT,
>>>>>>>>>>>>>>>>         	MEMORY_DEVICE_FS_DAX,
>>>>>>>>>>>>>>>>         	MEMORY_DEVICE_GENERIC,
>>>>>>>>>>>>>>>>         	MEMORY_DEVICE_PCI_P2PDMA,
>>>>>>>>>>>>>>>> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>>>>>>>>>>>>>>> In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> However, where exactly is pinning forbidden?
>>>>>>>>>>>>>> Long-term pinning is forbidden since it would interfere with the device
>>>>>>>>>>>>>> memory manager owning the
>>>>>>>>>>>>>> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>>>>>>>>>>>>>> is allowed on this device type.
>>>>>>>>>>>>> I don't see updates to folio_is_pinnable() in this patch.
>>>>>>>>>>>> Device coherent type pages should return true here, as they are pinnable
>>>>>>>>>>>> pages.
>>>>>>>>>>> That function is only called for long-term pinnings in try_grab_folio().
>>>>>>>>>>>
>>>>>>>>>>>>> So wouldn't try_grab_folio() simply pin these pages? What am I missing?
>>>>>>>>>>>> As far as I understand this return NULL for long term pin pages.
>>>>>>>>>>>> Otherwise they get refcount incremented.
>>>>>>>>>>> I don't follow.
>>>>>>>>>>>
>>>>>>>>>>> You're saying
>>>>>>>>>>>
>>>>>>>>>>> a) folio_is_pinnable() returns true for device coherent pages
>>>>>>>>>>>
>>>>>>>>>>> and that
>>>>>>>>>>>
>>>>>>>>>>> b) device coherent pages don't get long-term pinned
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Yet, the code says
>>>>>>>>>>>
>>>>>>>>>>> struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
>>>>>>>>>>> {
>>>>>>>>>>> 	if (flags & FOLL_GET)
>>>>>>>>>>> 		return try_get_folio(page, refs);
>>>>>>>>>>> 	else if (flags & FOLL_PIN) {
>>>>>>>>>>> 		struct folio *folio;
>>>>>>>>>>>
>>>>>>>>>>> 		/*
>>>>>>>>>>> 		 * Can't do FOLL_LONGTERM + FOLL_PIN gup fast path if not in a
>>>>>>>>>>> 		 * right zone, so fail and let the caller fall back to the slow
>>>>>>>>>>> 		 * path.
>>>>>>>>>>> 		 */
>>>>>>>>>>> 		if (unlikely((flags & FOLL_LONGTERM) &&
>>>>>>>>>>> 			     !is_pinnable_page(page)))
>>>>>>>>>>> 			return NULL;
>>>>>>>>>>> 		...
>>>>>>>>>>> 		return folio;
>>>>>>>>>>> 	}
>>>>>>>>>>> }
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> What prevents these pages from getting long-term pinned as stated in this patch?
>>>>>>>>>> Long-term pinning is handled by __gup_longterm_locked, which migrates
>>>>>>>>>> pages returned by __get_user_pages_locked that cannot be long-term
>>>>>>>>>> pinned. try_grab_folio is OK to grab the pages. Anything that can't be
>>>>>>>>>> long-term pinned will be migrated afterwards, and
>>>>>>>>>> __get_user_pages_locked will be retried. The migration of
>>>>>>>>>> DEVICE_COHERENT pages was implemented by Alistair in patch 5/13
>>>>>>>>>> ("mm/gup: migrate device coherent pages when pinning instead of failing").
>>>>>>>>> Thanks.
>>>>>>>>>
>>>>>>>>> __gup_longterm_locked()->check_and_migrate_movable_pages()
>>>>>>>>>
>>>>>>>>> Which checks folio_is_pinnable() and doesn't do anything if set.
>>>>>>>>>
>>>>>>>>> Sorry to be dense here, but I don't see how what's stated in this patch
>>>>>>>>> works without adjusting folio_is_pinnable().
>>>>>>>> Ugh, I think you might be right about try_grab_folio().
>>>>>>>>
>>>>>>>> We didn't update folio_is_pinnable() to include device coherent pages
>>>>>>>> because device coherent pages are pinnable. It is really just
>>>>>>>> FOLL_LONGTERM that we want to prevent here.
>>>>>>>>
>>>>>>>> For normal PUP that is done by my change in
>>>>>>>> check_and_migrate_movable_pages() which migrates pages being pinned with
>>>>>>>> FOLL_LONGTERM. But I think I incorrectly assumed we would take the
>>>>>>>> pte_devmap() path in gup_pte_range(), which we don't for coherent pages.
>>>>>>>> So I think the check in try_grab_folio() needs to be:
>>>>>>> I think I said it already (and I might be wrong without reading the
>>>>>>> code), but folio_is_pinnable() is *only* called for long-term pinnings.
>>>>>>>
>>>>>>> It should actually be called folio_is_longterm_pinnable().
>>>>>>>
>>>>>>> That's where that check should go, no?
>>>>>> David, I think you're right. We didn't catch this since the LONGTERM gup
>>>>>> test we added to hmm-test only calls to pin_user_pages. Apparently
>>>>>> try_grab_folio is called only from fast callers (ex.
>>>>>> pin_user_pages_fast/get_user_pages_fast). I have added a conditional
>>>>>> similar to what Alistair has proposed to return null on LONGTERM &&
>>>>>> (coherent_pages || folio_is_pinnable) at try_grab_folio. Also a new gup
>>>>>> test was added with LONGTERM set that calls pin_user_pages_fast.
>>>>>> Returning null under this condition it does causes the migration from
>>>>>> dev to system memory.
>>>>>>
>>>>> Why can't coherent memory simply put its checks into
>>>>> folio_is_pinnable()? I don't get it why we have to do things differently
>>>>> here.
>>>>>
>>>>>> Actually, Im having different problems with a call to PageAnonExclusive
>>>>>> from try_to_migrate_one during page fault from a HMM test that first
>>>>>> migrate pages to device private and forks to mark as COW these pages.
>>>>>> Apparently is catching the first BUG VM_BUG_ON_PGFLAGS(!PageAnon(page),
>>>>>> page)
>>>>> With or without this series? A backtrace would be great.
>>>> Here's the back trace. This happens in a hmm-test added in this patch
>>>> series. However, I have tried to isolate this BUG by just adding the COW
>>>> test with private device memory only. This is only present as follows.
>>>> Allocate anonymous mem->Migrate to private device memory->fork->try to
>>>> access to parent's anonymous memory (which will suppose to trigger a
>>>> page fault and migration to system mem). Just for the record, if the
>>>> child is terminated before the parent's memory is accessed, this problem
>>>> is not present.
>>> The only usage of PageAnonExclusive() in try_to_migrate_one() is:
>>>
>>> anon_exclusive = folio_test_anon(folio) &&
>>> 		 PageAnonExclusive(subpage);
>>>
>>> Which can only possibly fail if subpage is not actually part of the folio.
>>>
>>>
>>> I see some controversial code in the the if (folio_is_zone_device(folio)) case later:
>>>
>>> 			 * The assignment to subpage above was computed from a
>>> 			 * swap PTE which results in an invalid pointer.
>>> 			 * Since only PAGE_SIZE pages can currently be
>>> 			 * migrated, just set it to page. This will need to be
>>> 			 * changed when hugepage migrations to device private
>>> 			 * memory are supported.
>>> 			 */
>>> 			subpage = &folio->page;
>>>
>>> There we have our invalid pointer hint.
>>>
>>> I don't see how it could have worked if the child quit, though? Maybe
>>> just pure luck?
>>>
>>>
>>> Does the following fix your issue:
>> Yes, it fixed the issue. Thanks. Should we include this patch in this
>> patch series or separated?
>>
>> Regards,
>> Alex Sierra
> I'll send it right away "officially" so we can get it into 5.19. Can I
> add your tested-by?

Of course.

Alex Sierra

>
>
