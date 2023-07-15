Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8FF7546BC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 06:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F1010E029;
	Sat, 15 Jul 2023 04:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB72E10E029
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 04:03:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxL5RX3yCxoFI4FNoEebGCpO7oH569KlRhHSrEkF+z51PhuJrQijuVbqCea+QcR/E/wr6WoaamFOFg0bY6Q92PqK8QKh75dyrcmfKI+Mhs56TPkhTU7rVlqB//6XOAJ2B0x6OlaixGnUxsHF47sFizRrS4/O3ocEMzhlCxOY5y+kNUEZLmwalDh91a2t15oIN6L4k+thHo4eSKmY+BMwGW5lcbaJq54nztvSQ3kPgH/SZHfioomPN/bLT0dZsRw/B+kditwSTyTJxM4HzJQHLAG/6d6ulxmBiluPVyXHzlnrdZe1xCID31YvpOMRm7ATxPo5JJ9gm0quPHjFua4egw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLRe/bTLcZDTf4Cb/8Lo2znNJc5zT8z6AEUBVtuFTj0=;
 b=HGqgvVKVP6PLVaPVOdizBRwu8S3mS8CtBG3EJgK1yDBsmbrWxaye4FhcUPaVQiOdjP3U4XRV+2tfBZABkaZmVeduvdC++TKJ8WkvJr1c+/HY7PEBSBLo85eZDJ+n7L0DfK3cX4ewe6r/MxoSE699ZHtF/4j2ozCNj5u2DYEz0Ib1WtF3JOTBlE6nL5ZBD4SNwU/hNSTe9SrsUH+F5ELlxf3TJDDLhOGFQsdOnGvB83SVp6QAUotmwkOe4ZNbwnrpeXRbyOZQIcZA+TZD9sYBn20+puXbXVXUWAUsR5ZbtYK1CU7WAdcuI91iDxaxpOcMD/cptRDSRRvSsETs4Y36Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLRe/bTLcZDTf4Cb/8Lo2znNJc5zT8z6AEUBVtuFTj0=;
 b=RK1/PmpXKy4KZwtMGkbLfFo4UcnuTSmMWPN7wPA7KQELv+zrjgRNbhD2otZafQn2JSt1HGFM4bXHJdyfYqXZ5EltkwKKkTNe/FHGhuzP5yUeSdjYyYTI8pBAlONF35FND7uQL6TPTcCsAAj5OHTr8le/QS6nXjBv7E5aQLACisM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Sat, 15 Jul
 2023 04:03:20 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e3dd:99bb:b742:2d48]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e3dd:99bb:b742:2d48%2]) with mapi id 15.20.6588.028; Sat, 15 Jul 2023
 04:03:20 +0000
Message-ID: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
Date: Sat, 15 Jul 2023 00:03:16 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Asahi Lina <lina@asahilina.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::15) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH0PR12MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a219d2-d614-42bf-2c16-08db84e86cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JQx/m3Y7LUmhHo4mOXQo6Jnz4tEEKjrgpFWOoWs4JFjgGZNcMCz/73xjTm5HmTsmFOl4qW7SFP194ZgQKQvFLIZWI/C3TEdQGcycKTfireB/To8cL3NOz9OFaoWjvmpsQ9VX/T1E8rhXFW6RgTDIGvrlpZ4N12j6Z6PV5+I5+t1XFJq6/lav0OC01o+0ckc8fm0kvIQ/0pGCalHSu7wVOugLE50BZVbiwskUBI8zSW7U8xu+LW7luqG/Q20bqYJo8O9CRX/lTtCHEE0rtj8SsAe4+KZxSUsItFj3yD3/m4PwLMYgPTHhKrGkqIvy5jHYn38XXWPrHTuQLigMGEdt+PyPWgp1edJkBZ7FFK7MpwKvVJZsn5m4/44jGuQ6jFfhQUjh48v6OBsiF9CiFAHZ9EqylawhVwrQrFI17MZ+eO0xUXf0KTOmhwkrKi6Xa5/ZzMDNJ3BV+VpUMN+90+Uj0/RoM+PpAku8z4AW+vSQcld4HggZzFzwRgxcnybSA78oT4jRCTjFbKGLdkSZqOYhxFuX56hdRORrFwidDR3ZnemvAox8F/w/hjChof0LRBTf1P/0kcqDP8vU/z87pR6f5eptLsxEJmT2HgdUI5qm1Kv12C09jRDFPFng4Bzr0gKDBq4d5/DBAc9a2sLLhZCBKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199021)(38100700002)(31696002)(86362001)(44832011)(110136005)(66556008)(54906003)(2906002)(316002)(5660300002)(41300700001)(66476007)(7416002)(4326008)(66946007)(66574015)(83380400001)(36756003)(2616005)(6512007)(186003)(26005)(6506007)(53546011)(8936002)(6486002)(31686004)(8676002)(478600001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNrZWc3S0dEWHZsL0xHRWZqYWpQc3Vxb0tPSmFyOG5VQ044NVhlOUlGTDU1?=
 =?utf-8?B?bloydHV6Y0JXYXQ5R0pBWjNmUGt3aHhXeCtoSkhmRkVPd0FudnR3cWNvdS8z?=
 =?utf-8?B?a3dxaUluRlJ1SkN6cm8rdkl6cHUwTGZHSVRXbEowWFYyTTl6UlVsMnBnK2hz?=
 =?utf-8?B?NWwyQytGOVUzVVQvcmlzTEpmRE1HWFkxSGE3QnIyeVN5TUQ3RHE1UE5uMUZh?=
 =?utf-8?B?Mmk3ZktLM21BOWpRcEFtUGZ4N0hTM3EzZVFwcldkcldPM0VrVnZWZ2paQlFG?=
 =?utf-8?B?RlIza1BsWDBiTSsrdnpqRUdEVHlzdE5EeUpienByOHlKdjh1elNubWExcDI1?=
 =?utf-8?B?Y1c0cC9MQUNvdUNiODRRakpYUkRNSTNNTC9ocXA4RkdyYWxacjZ1ZlNKYnpo?=
 =?utf-8?B?a1VmQ0Jka2Z5SGlidWcyMVZ2MVZlWkwvUG8wVFRVMmlWQmI5cG9ZZDlZbWNi?=
 =?utf-8?B?b2pVekJQaEFOWWFSYlBnNE90Y25DR05SaGJCTUg1S05ya2lqd0JsbGhTbisz?=
 =?utf-8?B?ekVuQ3IrbDY1WGJUVWhRd1kwK3VEMnpzdWJCNkRGNFdQYXJRZDNHaVltU1Vo?=
 =?utf-8?B?aU9aTmd5QXFQdTJLSWNqdUtWaVpBS3ZUQmRpNnhVUVdaSUVoRGk1cXUvR3hI?=
 =?utf-8?B?NzVBREZjRVBwNDNoZTFjMFpqUDluZVVScEFVSk9GUWJoa3M3QXNQNFhQNEx4?=
 =?utf-8?B?VU9iaTdkTFNUakhpRDBURzYwYmQreWV2cUlWSlhkK2RnT2daYk5KeGRrT3Rq?=
 =?utf-8?B?YUxsU2UxdFpxZllyajJJTFE2Q2FLMkFWUmlFOWlWb0M1V3huMEVpZVBJSG84?=
 =?utf-8?B?d0M2V0ZOaEYxRU1rMGhXZDlrcTVjM0Y4SVpxTjlHdUxFVjNVa0tLaytXY2Nr?=
 =?utf-8?B?L1BKcDBZNnVZeHdqcXpiajNQTHRxK3RXdFVsOWlNUXpYWVBxSjJyU1kyNGhn?=
 =?utf-8?B?S2t2MG9FWUI4OTh6YWQvM2k0cGpWNmtjQUpJVndHYUptVlNNbjVGL2JrejIy?=
 =?utf-8?B?a3FsVWJiR1ZjcXZCbHA2OHJJQlpyam5OcGFJSmdNVUlrRXoyczVWOXZ0OFk2?=
 =?utf-8?B?ZXZjOHdkdmtrbmJLU2tCb1pubTVzS29vNE50cFZkWThwTDNYRE16QTFCaVF6?=
 =?utf-8?B?dzNSVGVFR2RiMHdRWCs0UWY3RWJLSmQ4VUhQVHQ0V1MxcEF0NkxKMnFub096?=
 =?utf-8?B?NUtReDNuWXN3bEU0VEc0Q1Z4QndoNVY3Ujc3N2JyYnoyRzYrbFQ1YXRrWnZi?=
 =?utf-8?B?ZFNwT3RreWYreGNndlJudCswV0x1NkZ6TkRXNmVkaUlNRmo2cmUxczlPYjIr?=
 =?utf-8?B?SUhqTEk5eUFiK0w4YlBZamRaYTN0Umtuc3ZMWHY1RFplQnhlOHBNWjNEUXhL?=
 =?utf-8?B?Kyt0aFlnT2doc3ljcUVYN2o3RG5uN2JrVjdMUGVYWGI4VTZPaDMrT2RZVzM3?=
 =?utf-8?B?ckk5dkxnZ3BwdUpFN2NNL01wcFhWd0o2aS83Q0NDSWl2Szl5K01IVEFKenk2?=
 =?utf-8?B?NEJFdzgzdmkvTFR1bmlsZm5zNG9jMzF5dm1UeTJJbG03OWdEQkRGaDZGRWdx?=
 =?utf-8?B?cXN6VjZDVzNtVEhwQnFwSHFNR1VDVUVCRlFaNWxxQzh5dTJnaGhxeU9LUE5J?=
 =?utf-8?B?VWIxa1YvWXRLZ0lYSGI4Ty94TzlyRlBXWWs0MUN0dXZqQm1OYW9mTVZLb2Zm?=
 =?utf-8?B?ZTA0NkI2QjZxa0k3WCtFNnlqM1ZIc2pSMzYvTEQxZXJYR2dJbHpaa2xJOVcy?=
 =?utf-8?B?U3J0YXgzMlVKRmxzeG1hTmVoQXVBWk5VUmx6eDZZNFkzbkNrcDFza3R6NlZJ?=
 =?utf-8?B?ZW1qY1FmQ0lYclB3alBqdktiRjVmTm9PTWdSc3FjZEwzVWJLYXlkeXRxTFFW?=
 =?utf-8?B?TnNMQ2VrYXZhT0p0dUhCNjFQdlhhM3NrRTBtVHFaNEZUZG50eUxKTWdxYm5v?=
 =?utf-8?B?VEJXVEpoZGpnWDQ3TEJqZ3JyVXlFSlM4NjJmSHRscEpyN1JhNkViM3ZKUmx4?=
 =?utf-8?B?VU9RWUh2Rkh5S3dSTlRjWVNuVWhlOHVyck1QcWtKWlNqM3RDUm9kc0ppOUE0?=
 =?utf-8?B?YXRVWml4RDJVTFVaQjRxRHpXS1RmeXVzTU4xN3Y5MFJ3L3Iyd2FTQWM1ZjdR?=
 =?utf-8?Q?EyqQMrVPD1ydCRIV1HJ1XaJsU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a219d2-d614-42bf-2c16-08db84e86cc2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2023 04:03:19.8081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIBhXfbNQcQgtb2XCVDVnOLV395so9gbowBI5dP6s1zo0Blg61gOA//oMqoOwhXE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8152
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-14 05:57, Christian König wrote:
> Am 14.07.23 um 11:49 schrieb Asahi Lina:
>> On 14/07/2023 17.43, Christian König wrote:
>>> Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>>> A signaled scheduler fence can outlive its scheduler, since fences are
>>>> independencly reference counted. Therefore, we can't reference the
>>>> scheduler in the get_timeline_name() implementation.
>>>>
>>>> Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
>>>> dma-bufs reference fences from GPU schedulers that no longer exist.
>>>>
>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>>>>    drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>>>>    include/drm/gpu_scheduler.h              | 5 +++++
>>>>    3 files changed, 14 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index b2bbc8a68b30..17f35b0b005a 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -389,7 +389,12 @@ static bool 
>>>> drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>>               /*
>>>>             * Fence is from the same scheduler, only need to wait for
>>>> -         * it to be scheduled
>>>> +         * it to be scheduled.
>>>> +         *
>>>> +         * Note: s_fence->sched could have been freed and reallocated
>>>> +         * as another scheduler. This false positive case is okay, 
>>>> as if
>>>> +         * the old scheduler was freed all of its jobs must have
>>>> +         * signaled their completion fences.
>>>
>>> This is outright nonsense. As long as an entity for a scheduler exists
>>> it is not allowed to free up this scheduler.
>>>
>>> So this function can't be called like this.
>>
>> As I already explained, the fences can outlive their scheduler. That 
>> means *this* entity certainly exists for *this* scheduler, but the 
>> *dependency* fence might have come from a past scheduler that was 
>> already destroyed along with all of its entities, and its address reused.
> 
> Well this is function is not about fences, this function is a callback 
> for the entity.
> 
>>
>> Christian, I'm really getting tired of your tone. I don't appreciate 
>> being told my comments are "outright nonsense" when you don't even 
>> take the time to understand what the issue is and what I'm trying to 
>> do/document. If you aren't interested in working with me, I'm just 
>> going to give up on drm_sched, wait until Rust gets workqueue support, 
>> and reimplement it in Rust. You can keep your broken fence lifetime 
>> semantics and I'll do my own thing.
> 
> I'm certainly trying to help here, but you seem to have unrealistic 
> expectations.
> 
> I perfectly understand what you are trying to do, but you don't seem to 
> understand that this functionality here isn't made for your use case.
> 
> We can adjust the functionality to better match your requirements, but 
> you can't say it is broken because it doesn't work when you use it not 
> in the way it is intended to be used.

I believe "adjusting" functionality to fit some external requirements,
may have unintended consequences, requiring yet more and more "adjustments".
(Or may allow (new) drivers to do wild things which may lead to wild results. :-) )

We need to be extra careful and wary of this.
-- 
Regards,
Luben

