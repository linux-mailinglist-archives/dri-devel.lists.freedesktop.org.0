Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FB3905D7
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF7C6EA6C;
	Tue, 25 May 2021 15:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF026EA69;
 Tue, 25 May 2021 15:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHL0YmZfEL48fKqigmx4BJdvi2rdlHwy+Kjwt/6zB4uKojXad2UE3n+3MteHWazbm3emkcb87ujB+5tJJ2NSa2e1/nIul3w32xYNcXubf/UhiL8fkmMFychXMGk4uUsTj6j7X5d2sDBCcEwOP8wink0kCFPd15fDNOahv810MINizM0TCiaIeRlY7garDokyx6mHqPPYr0NM3j7NmOGWCMIdJwI88h07ikk8ndz0tfHa3vOpF0qFBr7NTlh111b88aAz3bCf1UU6wP/x1UfIvPwqW833ximr81nsDgkwsmT4z5Pa6/VYfFnjo+Slx/HWS0yWz3hubzHMZdYbiwVyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+uk5D29ek3Z/wCHhs3EuXaa+yvVKkjHtPsOIqwYeAE=;
 b=aNZTv8sWxKsMUnoH1k25r7f5n/IgUII+8K/6MhYMNLjolY2mjvFLbMzUmHx798/oIWJYC5qDary2JcCLxpe2rz/9R01OK182Cn6rkuNBfOKOueBeTtv0k8owsHqgDDxWyQ89alMpCM/wTzeDmdEp4NcQRLFYqC4MfQ5o953E7vFPcFJwOuUSyuZVfqXCPQqSLEKaIwL5U5rqIgBgkhI/VxfkEZiaD4RvFpSvKQXjfFTpR3Zu3ELU2O9bIZZfhL1wHXmAN32U2ue/tQJXujqcNtzrworBxHYCYBR0ELw5txjc5mus5CWPBPunlO1v4Oew4M8b9XHYPsxuEWqlpakl8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+uk5D29ek3Z/wCHhs3EuXaa+yvVKkjHtPsOIqwYeAE=;
 b=FwXiUbTwNZnim4ZCdELj/WGSA4JeJ/zlNK/PvBiqGd3Uph2xFJAzFfcmB9/c8EyPJFeISL8UC72dbsG98xti4cCzVZzEPkxeSAl0+CvQHWcef3QlOeLov/RSUay2GEIbJy8r9tiS8nNY+gIeBUDkaugfkpE9bmX1U9x3NVUBRnM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 15:48:12 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 15:48:12 +0000
Subject: Re: [Intel-gfx] [PATCH v3 06/12] drm/ttm: Add a generic TTM memcpy
 move for page-based iomem
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
 <20210521153253.518037-7-thomas.hellstrom@linux.intel.com>
 <CAM0jSHM9SOPKkvbzUgFacqURXY_QbKcJ=3K_8Tdh4jjxm0nA3Q@mail.gmail.com>
 <2cc9a60c-4360-40b6-8712-1e50b7bbfd03@linux.intel.com>
 <CAM0jSHNYJd0LQhy3J3LbXezGQ-=eTh5qZJbZJRkw28eNAC9dsQ@mail.gmail.com>
 <e355705ead458e2f7385752a601befe5956eddd6.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e6ae9ee8-401c-8ebb-33a0-0cd630e4d174@amd.com>
Date: Tue, 25 May 2021 17:48:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <e355705ead458e2f7385752a601befe5956eddd6.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1]
X-ClientProxiedBy: AM3PR05CA0139.eurprd05.prod.outlook.com
 (2603:10a6:207:3::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1]
 (2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1) by
 AM3PR05CA0139.eurprd05.prod.outlook.com (2603:10a6:207:3::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Tue, 25 May 2021 15:48:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4985a89-97a2-4f92-c5c8-08d91f948025
X-MS-TrafficTypeDiagnostic: MN2PR12MB4320:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4320BB4326E98946FF30EE5E83259@MN2PR12MB4320.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0rPBtOZJUV340sJT6+T3n5X43LByQmBG7tZRl4wgOwCMQ2Wv9moxUtAeUQnprdP1RLXzTCHDGGkNdFVM1kdsTn4HwZ15WKiL4Heol4Jmf7WxzwIrMoT6WiKdsnceGctgqW7pknz3TDLqNoBTl02UfGYSLzIXSGP7957/HJHWZnovDiXJbL5KlWDVzrU1+BZhdW+Cal4Hn8pbQwgdOdAgSZCBhMIPjz5cV+HskcxGv1AJIGqovU/wh1WPyZozwA+npPErsHW3QVQm52OCGn5izgvLemAzG5OMVCVp2bzDrfGvqJmNGwdWWK3In1N90bJJi/Qx6PvjbE/cBNVSAyNK6/+HW86peVsm2kNGbf8qH45yRx0x2apynAUHER0sicpzcLpaddm4yV6d3BrPqp5imeoXDH1VwrWFYQLTN6H9y5BstpxfswPNg8Kw1vY/linG5vG5VihDjj23zCjnGo6gZ6slCk26nY2ryFM4+Hh3RRY+00dk7xrd0k0mvkU7Ki5aFTL2fh7rnnnjQNEqQWwogq+8FO827TqACOXZfAni0BrXJeHseGDaMvUatWsiqGuMgned1tHhtXIwyrJBqUHON5Gh4ZeANU/dntn8XkWzwa0QaQ9RHSi62qQO/nyg3IsrUikKNrOELv0n7dUGIUTFKoaVvyfUhtFaJmbM/hNS4mreuflQzSEk5U6T+LhP8UR8kjwndmXiLGFDP8/3whGDrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(54906003)(31686004)(66556008)(2616005)(16526019)(66574015)(8676002)(66946007)(186003)(316002)(478600001)(110136005)(2906002)(66476007)(6486002)(38100700002)(31696002)(83380400001)(8936002)(53546011)(5660300002)(4326008)(86362001)(6666004)(30864003)(36756003)(52116002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UG1DUGNYVEpSZlMvM2oyWWRWdi9jZytZNkZEaGNWWEl2aW5yUjJ1S1RwZlZ1?=
 =?utf-8?B?SXNPWW45V0JJSi9NaEtvK24yaXpZREdHYVFnSTVBMlJheE91d09aK3VGTXJi?=
 =?utf-8?B?V1p6dVFIN1ZjZlFnUUlZaXJvVytOUFVwNDNydkppM0FiQWI3bzNBMlhqT1dj?=
 =?utf-8?B?Yi9XRDQrUlBxN0FrSUhkVGhYYXFZSGY0VmUxQkdtY1IwU1JFUm00cHpkbWxI?=
 =?utf-8?B?amNKZi9mSkJhNTQ0bDdMT2YxUG1GTkV0dXErdXgwd0pCWERGZm56a2w2emFs?=
 =?utf-8?B?YllYd0xaVFZRUWc0TU4rc0kvUHg5bVg3LzBnTWg2aUducE9lbmlsSHQ5eEpH?=
 =?utf-8?B?RHQ3MXVhT2x2L1ZMKy9wcGcybjJTamJVeXRYcmNjRTRzNkQ2SENLbWlyTCsv?=
 =?utf-8?B?MktoNEtKOVFYOTVQRmtxZm8zY3NCblB0eWhBTFBBR2w0ZlpIQnlsY2IwRVdq?=
 =?utf-8?B?alIyWWViYXV5aUNnWE43dnBKcXJBbnpDNFNtVG4ydS90UmJPenNTbE9mekVF?=
 =?utf-8?B?UUtGVWEvUDkrMWNQK1lMcEgzbE04NG5JWWwwdHlHTnE4b0x2ck40Q29SZEJm?=
 =?utf-8?B?cjEzQXNxRHRGQVBaZGV2cGFSVU5YanRtUnhiSWxXYmZna3hxRkpkbTlxZmhk?=
 =?utf-8?B?MmpiK2g0THJKaXNOSmM0WlNrM0todzk3YzdiTm5Jd00yZXVLZThzeXB0VG5t?=
 =?utf-8?B?VU5mdm1ZVENFUk8yYjBZcU5BbFVKbEl6OWw5L2JoMDB0dnZ1Uy9RdEYvbmZ2?=
 =?utf-8?B?SFoySEZIeDBneEtmaFMxaDFHd1lHZ2ZVV3QwbGZ0c3hxMDZLMFBHSkVrSnB5?=
 =?utf-8?B?Y2NOUTVLQ1pHQzlGZlVQcXVFZGIwekVzUGRUYktCQ3d5OXpUUzNoS1E3SDRq?=
 =?utf-8?B?Y09kUytkUVdSK0xycHNJcFNiMEN3a2hNejBPWUZUWkRjZXJPTUpMUGhHMlpE?=
 =?utf-8?B?SS9WS2cwUFdzazFHMVJraFBPTUU2azdiZjRzUmIvczlkODJpRkFuWk1MSCtj?=
 =?utf-8?B?Y2FORGhNS29vYVY2NXdoejkvVjlYZDFZQkI3Q2JTR2JtWS9DZmFuUm1nMW9Q?=
 =?utf-8?B?TXBJRWE2eEkxUWNxZ2xDSTlVcjJISDVhVzc5bDVjcjlPQ3NCVk5wV3V3a0pz?=
 =?utf-8?B?ZFJUYnU2clMxVVFMMk11bjAvRlVSVUI5N3lqa1FDR0o1MmZ1L1pma2RCZ2VJ?=
 =?utf-8?B?eVoxWGFNMzRPcndaeUF0VEVOVDRROWtxZUk5R2hrbU4xblRDaFdOdGlHcC9F?=
 =?utf-8?B?SGQ5R2pQYkYwdVprQ25uaDhqSFdnZGFUdUhlRWw5ang1cHlYbEs5ajh2SjNV?=
 =?utf-8?B?cG4zVWN0V0VGd3NhOExjbEpjQXZ4SDZhZHlsaXY3RmpVV3FXZUJHRTVsMTBx?=
 =?utf-8?B?cVVGZnRpcEUrVWFwNWhXOEJGVE53bTMyZWtaY0EvRU1iSFZQemlieHczT1RU?=
 =?utf-8?B?eE1ZWTBFV3p6WWhoZEVQNWpPblpCOUp0cEZDeEhDT21WbTEvWHlObmlyODN2?=
 =?utf-8?B?SUFtTzBCUkxaVXZMT1J4MUdjZDhZaXpVNDFNTDFub1o2L2lxQUxnNnI2cFNj?=
 =?utf-8?B?QS8rSHpHSFNEUGw2cnZHQmd5SlRHcUlSc2VSVGNhQWhIbm04SWpPeDVrMXZT?=
 =?utf-8?B?czN1MEJlNUpTS0VOYWlPellrOXN0cUk4V1RmaWg0N3RBZHJPVUREbklpbi9P?=
 =?utf-8?B?Rk5FbUpUU2tCditIZ2tFSXZvL25rZ3ZDbitPQnlxK3dodVpVc3N5TW1FOFYy?=
 =?utf-8?B?R1g5ZlNnejRlek00eFhxVVVGK0d4d2FhLzdYdmFxQU1ScWsyY2oxcXhVYUZM?=
 =?utf-8?B?R3JNM2dlTjlQWEk5cktTQWFhWEFySHNhV2NJWXIzbWNDMDFNMFBpMm1MR2Mr?=
 =?utf-8?Q?eD8CsTRSW5VpA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4985a89-97a2-4f92-c5c8-08d91f948025
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 15:48:11.8224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArIjEYbvwJbWzqtx/pAgFfSwm78VzfkQUVgYsd7jfGJnkUoTpLyaUJwJjayokqo4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 25.05.21 um 12:07 schrieb Thomas Hellström:
> On Tue, 2021-05-25 at 10:58 +0100, Matthew Auld wrote:
>> On Tue, 25 May 2021 at 10:32, Thomas Hellström
>> <thomas.hellstrom@linux.intel.com> wrote:
>>>
>>> On 5/25/21 11:18 AM, Matthew Auld wrote:
>>>> On Fri, 21 May 2021 at 16:33, Thomas Hellström
>>>> <thomas.hellstrom@linux.intel.com> wrote:
>>>>> The internal ttm_bo_util memcpy uses ioremap functionality, and
>>>>> while it
>>>>> probably might be possible to use it for copying in- and out of
>>>>> sglist represented io memory, using io_mem_reserve() /
>>>>> io_mem_free()
>>>>> callbacks, that would cause problems with fault().
>>>>> Instead, implement a method mapping page-by-page using
>>>>> kmap_local()
>>>>> semantics. As an additional benefit we then avoid the
>>>>> occasional global
>>>>> TLB flushes of ioremap() and consuming ioremap space,
>>>>> elimination of a
>>>>> critical point of failure and with a slight change of semantics
>>>>> we could
>>>>> also push the memcpy out async for testing and async driver
>>>>> development
>>>>> purposes.
>>>>>
>>>>> A special linear iomem iterator is introduced internally to
>>>>> mimic the
>>>>> old ioremap behaviour for code-paths that can't immediately be
>>>>> ported
>>>>> over. This adds to the code size and should be considered a
>>>>> temporary
>>>>> solution.
>>>>>
>>>>> Looking at the code we have a lot of checks for iomap tagged
>>>>> pointers.
>>>>> Ideally we should extend the core memremap functions to also
>>>>> accept
>>>>> uncached memory and kmap_local functionality. Then we could
>>>>> strip a
>>>>> lot of code.
>>>>>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Signed-off-by: Thomas Hellström <
>>>>> thomas.hellstrom@linux.intel.com>
>>>>> ---
>>>>> v3:
>>>>> - Split up in various TTM files and addressed review comments
>>>>> by
>>>>>     Christian König. Tested and fixed legacy iomap memcpy path
>>>>> on i915.
>>>>> ---
>>>>>    drivers/gpu/drm/ttm/ttm_bo_util.c  | 278 ++++++++++----------
>>>>> ---------
>>>>>    drivers/gpu/drm/ttm/ttm_module.c   |  35 ++++
>>>>>    drivers/gpu/drm/ttm/ttm_resource.c | 166 +++++++++++++++++
>>>>>    drivers/gpu/drm/ttm/ttm_tt.c       |  42 +++++
>>>>>    include/drm/ttm/ttm_bo_driver.h    |  28 +++
>>>>>    include/drm/ttm/ttm_caching.h      |   2 +
>>>>>    include/drm/ttm/ttm_kmap_iter.h    |  61 +++++++
>>>>>    include/drm/ttm/ttm_resource.h     |  61 +++++++
>>>>>    include/drm/ttm/ttm_tt.h           |  16 ++
>>>>>    9 files changed, 508 insertions(+), 181 deletions(-)
>>>>>    create mode 100644 include/drm/ttm/ttm_kmap_iter.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>> index ae8b61460724..912cbe8e60a2 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>> @@ -72,190 +72,126 @@ void ttm_mem_io_free(struct ttm_device
>>>>> *bdev,
>>>>>           mem->bus.addr = NULL;
>>>>>    }
>>>>>
>>>>> -static int ttm_resource_ioremap(struct ttm_device *bdev,
>>>>> -                              struct ttm_resource *mem,
>>>>> -                              void **virtual)
>>>>> +/**
>>>>> + * ttm_move_memcpy - Helper to perform a memcpy ttm move
>>>>> operation.
>>>>> + * @bo: The struct ttm_buffer_object.
>>>>> + * @new_mem: The struct ttm_resource we're moving to (copy
>>>>> destination).
>>>>> + * @new_iter: A struct ttm_kmap_iter representing the
>>>>> destination resource.
>>>>> + * @src_iter: A struct ttm_kmap_iter representing the source
>>>>> resource.
>>>>> + *
>>>>> + * This function is intended to be able to move out async
>>>>> under a
>>>>> + * dma-fence if desired.
>>>>> + */
>>>>> +void ttm_move_memcpy(struct ttm_buffer_object *bo,
>>>>> +                    struct ttm_resource *dst_mem,
>>>>> +                    struct ttm_kmap_iter *dst_iter,
>>>>> +                    struct ttm_kmap_iter *src_iter)
>>>>>    {
>>>>> -       int ret;
>>>>> -       void *addr;
>>>>> -
>>>>> -       *virtual = NULL;
>>>>> -       ret = ttm_mem_io_reserve(bdev, mem);
>>>>> -       if (ret || !mem->bus.is_iomem)
>>>>> -               return ret;
>>>>> +       const struct ttm_kmap_iter_ops *dst_ops = dst_iter-
>>>>>> ops;
>>>>> +       const struct ttm_kmap_iter_ops *src_ops = src_iter-
>>>>>> ops;
>>>>> +       struct ttm_tt *ttm = bo->ttm;
>>>>> +       struct dma_buf_map src_map, dst_map;
>>>>> +       pgoff_t i;
>>>>>
>>>>> -       if (mem->bus.addr) {
>>>>> -               addr = mem->bus.addr;
>>>>> -       } else {
>>>>> -               size_t bus_size = (size_t)mem->num_pages <<
>>>>> PAGE_SHIFT;
>>>>> +       /* Single TTM move. NOP */
>>>>> +       if (dst_ops->maps_tt && src_ops->maps_tt)
>>>>> +               return;
>>>>>
>>>>> -               if (mem->bus.caching == ttm_write_combined)
>>>>> -                       addr = ioremap_wc(mem->bus.offset,
>>>>> bus_size);
>>>>> -#ifdef CONFIG_X86
>>>>> -               else if (mem->bus.caching == ttm_cached)
>>>>> -                       addr = ioremap_cache(mem->bus.offset,
>>>>> bus_size);
>>>>> -#endif
>>>>> -               else
>>>>> -                       addr = ioremap(mem->bus.offset,
>>>>> bus_size);
>>>>> -               if (!addr) {
>>>>> -                       ttm_mem_io_free(bdev, mem);
>>>>> -                       return -ENOMEM;
>>>>> +       /* Don't move nonexistent data. Clear destination
>>>>> instead. */
>>>>> +       if (src_ops->maps_tt && (!ttm ||
>>>>> !ttm_tt_is_populated(ttm))) {
>>>>> +               if (ttm && !(ttm->page_flags &
>>>>> TTM_PAGE_FLAG_ZERO_ALLOC))
>>>>> +                       return;
>>>>> +
>>>>> +               for (i = 0; i < dst_mem->num_pages; ++i) {
>>>>> +                       dst_ops->map_local(dst_iter, &dst_map,
>>>>> i);
>>>>> +                       if (dst_map.is_iomem)
>>>>> +                               memset_io(dst_map.vaddr_iomem,
>>>>> 0, PAGE_SIZE);
>>>>> +                       else
>>>>> +                               memset(dst_map.vaddr, 0,
>>>>> PAGE_SIZE);
>>>>> +                       if (dst_ops->unmap_local)
>>>>> +                               dst_ops->unmap_local(dst_iter,
>>>>> &dst_map);
>>>>>                   }
>>>>> +               return;
>>>>>           }
>>>>> -       *virtual = addr;
>>>>> -       return 0;
>>>>> -}
>>>>> -
>>>>> -static void ttm_resource_iounmap(struct ttm_device *bdev,
>>>>> -                               struct ttm_resource *mem,
>>>>> -                               void *virtual)
>>>>> -{
>>>>> -       if (virtual && mem->bus.addr == NULL)
>>>>> -               iounmap(virtual);
>>>>> -       ttm_mem_io_free(bdev, mem);
>>>>> -}
>>>>> -
>>>>> -static int ttm_copy_io_page(void *dst, void *src, unsigned
>>>>> long page)
>>>>> -{
>>>>> -       uint32_t *dstP =
>>>>> -           (uint32_t *) ((unsigned long)dst + (page <<
>>>>> PAGE_SHIFT));
>>>>> -       uint32_t *srcP =
>>>>> -           (uint32_t *) ((unsigned long)src + (page <<
>>>>> PAGE_SHIFT));
>>>>> -
>>>>> -       int i;
>>>>> -       for (i = 0; i < PAGE_SIZE / sizeof(uint32_t); ++i)
>>>>> -               iowrite32(ioread32(srcP++), dstP++);
>>>>> -       return 0;
>>>>> -}
>>>>> -
>>>>> -static int ttm_copy_io_ttm_page(struct ttm_tt *ttm, void *src,
>>>>> -                               unsigned long page,
>>>>> -                               pgprot_t prot)
>>>>> -{
>>>>> -       struct page *d = ttm->pages[page];
>>>>> -       void *dst;
>>>>> -
>>>>> -       if (!d)
>>>>> -               return -ENOMEM;
>>>>> -
>>>>> -       src = (void *)((unsigned long)src + (page <<
>>>>> PAGE_SHIFT));
>>>>> -       dst = kmap_atomic_prot(d, prot);
>>>>> -       if (!dst)
>>>>> -               return -ENOMEM;
>>>>> -
>>>>> -       memcpy_fromio(dst, src, PAGE_SIZE);
>>>>> -
>>>>> -       kunmap_atomic(dst);
>>>>> -
>>>>> -       return 0;
>>>>> -}
>>>>> -
>>>>> -static int ttm_copy_ttm_io_page(struct ttm_tt *ttm, void *dst,
>>>>> -                               unsigned long page,
>>>>> -                               pgprot_t prot)
>>>>> -{
>>>>> -       struct page *s = ttm->pages[page];
>>>>> -       void *src;
>>>>> -
>>>>> -       if (!s)
>>>>> -               return -ENOMEM;
>>>>> -
>>>>> -       dst = (void *)((unsigned long)dst + (page <<
>>>>> PAGE_SHIFT));
>>>>> -       src = kmap_atomic_prot(s, prot);
>>>>> -       if (!src)
>>>>> -               return -ENOMEM;
>>>>>
>>>>> -       memcpy_toio(dst, src, PAGE_SIZE);
>>>>> -
>>>>> -       kunmap_atomic(src);
>>>>> +       for (i = 0; i < dst_mem->num_pages; ++i) {
>>>>> +               dst_ops->map_local(dst_iter, &dst_map, i);
>>>>> +               src_ops->map_local(src_iter, &src_map, i);
>>>>> +
>>>>> +               if (!src_map.is_iomem && !dst_map.is_iomem) {
>>>>> +                       memcpy(dst_map.vaddr, src_map.vaddr,
>>>>> PAGE_SIZE);
>>>>> +               } else if (!src_map.is_iomem) {
>>>>> +                       dma_buf_map_memcpy_to(&dst_map,
>>>>> src_map.vaddr,
>>>>> +                                             PAGE_SIZE);
>>>>> +               } else if (!dst_map.is_iomem) {
>>>>> +                       memcpy_fromio(dst_map.vaddr,
>>>>> src_map.vaddr_iomem,
>>>>> +                                     PAGE_SIZE);
>>>>> +               } else {
>>>>> +                       int j;
>>>>> +                       u32 __iomem *src = src_map.vaddr_iomem;
>>>>> +                       u32 __iomem *dst = dst_map.vaddr_iomem;
>>>>>
>>>>> -       return 0;
>>>>> +                       for (j = 0; j < (PAGE_SIZE >> 2); ++j)
>>>> IMO PAGE_SIZE / sizeof(u32) is easier to understand.
>>> OK, will fix.
>>>
>>>
>>>>> +                               iowrite32(ioread32(src++),
>>>>> dst++);
>>>>> +               }
>>>>> +               if (src_ops->unmap_local)
>>>>> +                       src_ops->unmap_local(src_iter,
>>>>> &src_map);
>>>>> +               if (dst_ops->unmap_local)
>>>>> +                       dst_ops->unmap_local(dst_iter,
>>>>> &dst_map);
>>>>> +       }
>>>>>    }
>>>>> +EXPORT_SYMBOL(ttm_move_memcpy);
>>>>>
>>>>>    int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>>>>>                          struct ttm_operation_ctx *ctx,
>>>>> -                      struct ttm_resource *new_mem)
>>>>> +                      struct ttm_resource *dst_mem)
>>>>>    {
>>>>>           struct ttm_device *bdev = bo->bdev;
>>>>> -       struct ttm_resource_manager *man =
>>>>> ttm_manager_type(bdev, new_mem->mem_type);
>>>>> +       struct ttm_resource_manager *dst_man =
>>>>> +               ttm_manager_type(bo->bdev, dst_mem->mem_type);
>>>>>           struct ttm_tt *ttm = bo->ttm;
>>>>> -       struct ttm_resource *old_mem = &bo->mem;
>>>>> -       struct ttm_resource old_copy = *old_mem;
>>>>> -       void *old_iomap;
>>>>> -       void *new_iomap;
>>>>> +       struct ttm_resource *src_mem = &bo->mem;
>>>>> +       struct ttm_resource_manager *src_man =
>>>>> +               ttm_manager_type(bdev, src_mem->mem_type);
>>>>> +       struct ttm_resource src_copy = *src_mem;
>>>>> +       union {
>>>>> +               struct ttm_kmap_iter_tt tt;
>>>>> +               struct ttm_kmap_iter_linear_io io;
>>>>> +       } _dst_iter, _src_iter;
>>>>> +       struct ttm_kmap_iter *dst_iter, *src_iter;
>>>>>           int ret;
>>>>> -       unsigned long i;
>>>>>
>>>>> -       ret = ttm_bo_wait_ctx(bo, ctx);
>>>>> -       if (ret)
>>>>> -               return ret;
>>>>> -
>>>>> -       ret = ttm_resource_ioremap(bdev, old_mem, &old_iomap);
>>>>> -       if (ret)
>>>>> -               return ret;
>>>>> -       ret = ttm_resource_ioremap(bdev, new_mem, &new_iomap);
>>>>> -       if (ret)
>>>>> -               goto out;
>>>>> -
>>>>> -       /*
>>>>> -        * Single TTM move. NOP.
>>>>> -        */
>>>>> -       if (old_iomap == NULL && new_iomap == NULL)
>>>>> -               goto out2;
>>>>> -
>>>>> -       /*
>>>>> -        * Don't move nonexistent data. Clear destination
>>>>> instead.
>>>>> -        */
>>>>> -       if (old_iomap == NULL &&
>>>>> -           (ttm == NULL || (!ttm_tt_is_populated(ttm) &&
>>>>> -                            !(ttm->page_flags &
>>>>> TTM_PAGE_FLAG_SWAPPED)))) {
>>>>> -               memset_io(new_iomap, 0, new_mem-
>>>>>> num_pages*PAGE_SIZE);
>>>>> -               goto out2;
>>>>> -       }
>>>>> -
>>>>> -       /*
>>>>> -        * TTM might be null for moves within the same region.
>>>>> -        */
>>>>> -       if (ttm) {
>>>>> +       if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
>>>>> ||
>>>>> +                   dst_man->use_tt)) {
>>>>>                   ret = ttm_tt_populate(bdev, ttm, ctx);
>>>>>                   if (ret)
>>>>> -                       goto out1;
>>>>> +                       return ret;
>>>>>           }
>>>>>
>>>>> -       for (i = 0; i < new_mem->num_pages; ++i) {
>>>>> -               if (old_iomap == NULL) {
>>>>> -                       pgprot_t prot = ttm_io_prot(bo,
>>>>> old_mem, PAGE_KERNEL);
>>>>> -                       ret = ttm_copy_ttm_io_page(ttm,
>>>>> new_iomap, i,
>>>>> -                                                  prot);
>>>>> -               } else if (new_iomap == NULL) {
>>>>> -                       pgprot_t prot = ttm_io_prot(bo,
>>>>> new_mem, PAGE_KERNEL);
>>>>> -                       ret = ttm_copy_io_ttm_page(ttm,
>>>>> old_iomap, i,
>>>>> -                                                  prot);
>>>>> -               } else {
>>>>> -                       ret = ttm_copy_io_page(new_iomap,
>>>>> old_iomap, i);
>>>>> -               }
>>>>> -               if (ret)
>>>>> -                       goto out1;
>>>>> +       dst_iter = ttm_kmap_iter_linear_io_init(&_dst_iter.io,
>>>>> bdev, dst_mem);
>>>>> +       if (PTR_ERR(dst_iter) == -EINVAL && dst_man->use_tt)
>>>>> +               dst_iter = ttm_kmap_iter_tt_init(&_dst_iter.tt,
>>>>> bo->ttm);
>>>>> +       if (IS_ERR(dst_iter))
>>>>> +               return PTR_ERR(dst_iter);
>>>>> +
>>>>> +       src_iter = ttm_kmap_iter_linear_io_init(&_src_iter.io,
>>>>> bdev, src_mem);
>>>>> +       if (PTR_ERR(src_iter) == -EINVAL && src_man->use_tt)
>>>>> +               src_iter = ttm_kmap_iter_tt_init(&_src_iter.tt,
>>>>> bo->ttm);
>>>>> +       if (IS_ERR(src_iter)) {
>>>>> +               ret = PTR_ERR(src_iter);
>>>>> +               goto out_src_iter;
>>>>>           }
>>>>> -       mb();
>>>>> -out2:
>>>>> -       old_copy = *old_mem;
>>>>>
>>>>> -       ttm_bo_assign_mem(bo, new_mem);
>>>>> -
>>>>> -       if (!man->use_tt)
>>>>> -               ttm_bo_tt_destroy(bo);
>>>>> +       ttm_move_memcpy(bo, dst_mem, dst_iter, src_iter);
>>>>> +       src_copy = *src_mem;
>>>>> +       ttm_bo_move_sync_cleanup(bo, dst_mem);
>>>>>
>>>>> -out1:
>>>>> -       ttm_resource_iounmap(bdev, old_mem, new_iomap);
>>>>> -out:
>>>>> -       ttm_resource_iounmap(bdev, &old_copy, old_iomap);
>>>>> +       if (!src_iter->ops->maps_tt)
>>>>> +               ttm_kmap_iter_linear_io_fini(&_src_iter.io,
>>>>> bdev, &src_copy);
>>>>> +out_src_iter:
>>>>> +       if (!dst_iter->ops->maps_tt)
>>>>> +               ttm_kmap_iter_linear_io_fini(&_dst_iter.io,
>>>>> bdev, dst_mem);
>>>>>
>>>>> -       /*
>>>>> -        * On error, keep the mm node!
>>>>> -        */
>>>>> -       if (!ret)
>>>>> -               ttm_resource_free(bo, &old_copy);
>>>>>           return ret;
>>>>>    }
>>>>>    EXPORT_SYMBOL(ttm_bo_move_memcpy);
>>>>> @@ -336,27 +272,7 @@ pgprot_t ttm_io_prot(struct
>>>>> ttm_buffer_object *bo, struct ttm_resource *res,
>>>>>           man = ttm_manager_type(bo->bdev, res->mem_type);
>>>>>           caching = man->use_tt ? bo->ttm->caching : res-
>>>>>> bus.caching;
>>>>> -       /* Cached mappings need no adjustment */
>>>>> -       if (caching == ttm_cached)
>>>>> -               return tmp;
>>>>> -
>>>>> -#if defined(__i386__) || defined(__x86_64__)
>>>>> -       if (caching == ttm_write_combined)
>>>>> -               tmp = pgprot_writecombine(tmp);
>>>>> -       else if (boot_cpu_data.x86 > 3)
>>>>> -               tmp = pgprot_noncached(tmp);
>>>>> -#endif
>>>>> -#if defined(__ia64__) || defined(__arm__) ||
>>>>> defined(__aarch64__) || \
>>>>> -    defined(__powerpc__) || defined(__mips__)
>>>>> -       if (caching == ttm_write_combined)
>>>>> -               tmp = pgprot_writecombine(tmp);
>>>>> -       else
>>>>> -               tmp = pgprot_noncached(tmp);
>>>>> -#endif
>>>>> -#if defined(__sparc__)
>>>>> -       tmp = pgprot_noncached(tmp);
>>>>> -#endif
>>>>> -       return tmp;
>>>>> +       return ttm_prot_from_caching(caching, tmp);
>>>>>    }
>>>>>    EXPORT_SYMBOL(ttm_io_prot);
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_module.c
>>>>> b/drivers/gpu/drm/ttm/ttm_module.c
>>>>> index 56b0efdba1a9..997c458f68a9 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_module.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_module.c
>>>>> @@ -31,12 +31,47 @@
>>>>>     */
>>>>>    #include <linux/module.h>
>>>>>    #include <linux/device.h>
>>>>> +#include <linux/pgtable.h>
>>>>>    #include <linux/sched.h>
>>>>>    #include <linux/debugfs.h>
>>>>>    #include <drm/drm_sysfs.h>
>>>>> +#include <drm/ttm/ttm_caching.h>
>>>>>
>>>>>    #include "ttm_module.h"
>>>>>
>>>>> +/**
>>>>> + * ttm_prot_from_caching - Modify the page protection
>>>>> according to the
>>>>> + * ttm cacing mode
>>>>> + * @caching: The ttm caching mode
>>>>> + * @tmp: The original page protection
>>>>> + *
>>>>> + * Return: The modified page protection
>>>>> + */
>>>>> +pgprot_t ttm_prot_from_caching(enum ttm_caching caching,
>>>>> pgprot_t tmp)
>>>>> +{
>>>>> +       /* Cached mappings need no adjustment */
>>>>> +       if (caching == ttm_cached)
>>>>> +               return tmp;
>>>>> +
>>>>> +#if defined(__i386__) || defined(__x86_64__)
>>>>> +       if (caching == ttm_write_combined)
>>>>> +               tmp = pgprot_writecombine(tmp);
>>>>> +       else if (boot_cpu_data.x86 > 3)
>>>>> +               tmp = pgprot_noncached(tmp);
>>>>> +#endif
>>>>> +#if defined(__ia64__) || defined(__arm__) ||
>>>>> defined(__aarch64__) || \
>>>>> +       defined(__powerpc__) || defined(__mips__)
>>>>> +       if (caching == ttm_write_combined)
>>>>> +               tmp = pgprot_writecombine(tmp);
>>>>> +       else
>>>>> +               tmp = pgprot_noncached(tmp);
>>>>> +#endif
>>>>> +#if defined(__sparc__)
>>>>> +       tmp = pgprot_noncached(tmp);
>>>>> +#endif
>>>>> +       return tmp;
>>>>> +}
>>>>> +
>>>>>    struct dentry *ttm_debugfs_root;
>>>>>
>>>>>    static int __init ttm_init(void)
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>>>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>>>> index 59e2b7157e41..e05ae7e3d477 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>>> @@ -22,6 +22,10 @@
>>>>>     * Authors: Christian König
>>>>>     */
>>>>>
>>>>> +#include <linux/dma-buf-map.h>
>>>>> +#include <linux/io-mapping.h>
>>>>> +#include <linux/scatterlist.h>
>>>>> +
>>>>>    #include <drm/ttm/ttm_resource.h>
>>>>>    #include <drm/ttm/ttm_bo_driver.h>
>>>>>
>>>>> @@ -147,3 +151,165 @@ void ttm_resource_manager_debug(struct
>>>>> ttm_resource_manager *man,
>>>>>                   man->func->debug(man, p);
>>>>>    }
>>>>>    EXPORT_SYMBOL(ttm_resource_manager_debug);
>>>>> +
>>>>> +static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter
>>>>> *iter,
>>>>> +                                         struct dma_buf_map
>>>>> *dmap,
>>>>> +                                         pgoff_t i)
>>>>> +{
>>>>> +       struct ttm_kmap_iter_iomap *iter_io =
>>>>> +               container_of(iter, typeof(*iter_io), base);
>>>>> +       void __iomem *addr;
>>>>> +
>>>>> +retry:
>>>>> +       while (i >= iter_io->cache.end) {
>>>>> +               iter_io->cache.sg = iter_io->cache.sg ?
>>>>> +                       sg_next(iter_io->cache.sg) : iter_io-
>>>>>> st->sgl;
>>>>> +               iter_io->cache.i = iter_io->cache.end;
>>>>> +               iter_io->cache.end += sg_dma_len(iter_io-
>>>>>> cache.sg) >>
>>>>> +                       PAGE_SHIFT;
>>>>> +               iter_io->cache.offs = sg_dma_address(iter_io-
>>>>>> cache.sg) -
>>>>> +                       iter_io->start;
>>>>> +       }
>>>>> +
>>>>> +       if (i < iter_io->cache.i) {
>>>>> +               iter_io->cache.end = 0;
>>>>> +               iter_io->cache.sg = NULL;
>>>>> +               goto retry;
>>>>> +       }
>>>>> +
>>>>> +       addr = io_mapping_map_local_wc(iter_io->iomap, iter_io-
>>>>>> cache.offs +
>>>>> +                                      (((resource_size_t)i -
>>>>> iter_io->cache.i)
>>>>> +                                       << PAGE_SHIFT));
>>>>> +       dma_buf_map_set_vaddr_iomem(dmap, addr);
>>>>> +}
>>>>> +
>>>>> +static void ttm_kmap_iter_iomap_unmap_local(struct
>>>>> ttm_kmap_iter *iter,
>>>>> +                                           struct dma_buf_map
>>>>> *map)
>>>>> +{
>>>>> +       io_mapping_unmap_local(map->vaddr_iomem);
>>>>> +}
>>>>> +
>>>>> +static const struct ttm_kmap_iter_ops ttm_kmap_iter_io_ops = {
>>>>> +       .map_local =  ttm_kmap_iter_iomap_map_local,
>>>>> +       .unmap_local = ttm_kmap_iter_iomap_unmap_local,
>>>>> +       .maps_tt = false,
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * ttm_kmap_iter_iomap_init - Initialize a struct
>>>>> ttm_kmap_iter_iomap
>>>>> + * @iter_io: The struct ttm_kmap_iter_iomap to initialize.
>>>>> + * @iomap: The struct io_mapping representing the underlying
>>>>> linear io_memory.
>>>>> + * @st: sg_table into @iomap, representing the memory of the
>>>>> struct
>>>>> + * ttm_resource.
>>>>> + * @start: Offset that needs to be subtracted from @st to make
>>>>> + * sg_dma_address(st->sgl) - @start == 0 for @iomap start.
>>>>> + *
>>>>> + * Return: Pointer to the embedded struct ttm_kmap_iter.
>>>>> + */
>>>>> +struct ttm_kmap_iter *
>>>>> +ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
>>>>> +                        struct io_mapping *iomap,
>>>>> +                        struct sg_table *st,
>>>>> +                        resource_size_t start)
>>>>> +{
>>>>> +       iter_io->base.ops = &ttm_kmap_iter_io_ops;
>>>>> +       iter_io->iomap = iomap;
>>>>> +       iter_io->st = st;
>>>>> +       iter_io->start = start;
>>>>> +       memset(&iter_io->cache, 0, sizeof(iter_io->cache));
>>>>> +
>>>>> +       return &iter_io->base;
>>>>> +}
>>>>> +EXPORT_SYMBOL(ttm_kmap_iter_iomap_init);
>>>>> +
>>>>> +/**
>>>>> + * DOC: Linear io iterator
>>>>> + *
>>>>> + * This code should die in the not too near future. Best would
>>>>> be if we could
>>>>> + * make io-mapping use memremap for all io memory, and have
>>>>> memremap
>>>>> + * implement a kmap_local functionality. We could then strip a
>>>>> huge amount of
>>>>> + * code. These linear io iterators are implemented to mimic
>>>>> old functionality,
>>>>> + * and they don't use kmap_local semantics at all internally.
>>>>> Rather ioremap or
>>>>> + * friends, and at least on 32-bit they add global TLB flushes
>>>>> and points
>>>>> + * of failure.
>>>>> + */
>>>>> +
>>>>> +static void ttm_kmap_iter_linear_io_map_local(struct
>>>>> ttm_kmap_iter *iter,
>>>>> +                                             struct
>>>>> dma_buf_map *dmap,
>>>>> +                                             pgoff_t i)
>>>>> +{
>>>>> +       struct ttm_kmap_iter_linear_io *iter_io =
>>>>> +               container_of(iter, typeof(*iter_io), base);
>>>>> +
>>>>> +       *dmap = iter_io->dmap;
>>>>> +       dma_buf_map_incr(dmap, i * PAGE_SIZE);
>>>>> +}
>>>>> +
>>>>> +static const struct ttm_kmap_iter_ops
>>>>> ttm_kmap_iter_linear_io_ops = {
>>>>> +       .map_local =  ttm_kmap_iter_linear_io_map_local,
>>>>> +       .maps_tt = false,
>>>>> +};
>>>>> +
>>>>> +struct ttm_kmap_iter *
>>>>> +ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io
>>>>> *iter_io,
>>>>> +                            struct ttm_device *bdev,
>>>>> +                            struct ttm_resource *mem)
>>>>> +{
>>>>> +       int ret;
>>>>> +
>>>>> +       ret = ttm_mem_io_reserve(bdev, mem);
>>>>> +       if (ret)
>>>>> +               goto out_err;
>>>>> +       if (!mem->bus.is_iomem) {
>>>>> +               ret = -EINVAL;
>>>>> +               goto out_io_free;
>>>>> +       }
>>>>> +
>>>>> +       if (mem->bus.addr) {
>>>>> +               dma_buf_map_set_vaddr(&iter_io->dmap, mem-
>>>>>> bus.addr);
>>>>> +               iter_io->needs_unmap = false;
>>>>> +       } else {
>>>>> +               size_t bus_size = (size_t)mem->num_pages <<
>>>>> PAGE_SHIFT;
>>>>> +
>>>>> +               iter_io->needs_unmap = true;
>>>>> +               if (mem->bus.caching == ttm_write_combined)
>>>>> +                       dma_buf_map_set_vaddr_iomem(&iter_io-
>>>>>> dmap,
>>>>> +
>>>>> ioremap_wc(mem->bus.offset,
>>>>> +
>>>>> bus_size));
>>>>> +               else if (mem->bus.caching == ttm_cached)
>>>>> +                       dma_buf_map_set_vaddr(&iter_io->dmap,
>>>>> +                                             memremap(mem-
>>>>>> bus.offset, bus_size,
>>>>> +
>>>>> MEMREMAP_WB));
>>>> The comments in set_vaddr suggest that this is meant for
>>>> system-memory. Does that actually matter or is it just about not
>>>> losing the __iomem annotation on platforms where it matters?
>>> Yes, it's the latter. dma_buf_map() is relatively new and the
>>> author
>>> probably didn't think about the case of cached iomem, which is used
>>> by,
>>> for example, vmwgfx.
>>>
>>>> Apparently cached device local is a thing. Also should this not
>>>> be
>>>> wrapped in CONFIG_X86?
>>> Both dma_buf_map() and memremap are generic, I think, I guess
>>> memremap
>>> would return NULL if it's not supported.
>> It looks like memremap just wraps ioremap_cache, but since it also
>> discards the __iomem annotation should we be doing that universally?
>> Also not sure if ioremap_cache is universally supported, so wrapping
>> in CONFIG_X86 and falling back to plain ioremap() might be needed? Or
>> at least that looks like roughly what the previous code was doing?
>> Not
>> too sure tbh.
>>
> I think the long term goal is to use memremap all over the place, to
> just not have to bother with the __iomem annotation. But to do that io-
> mapping.h needs to support memremap. But for now we need to be strict
> about __iomem unless we're in arch specific code. That's why that
> dma_buf_map thing was created, but TTM memcpy was never fully adapted.

I don't think that this will work. __iomem annotation is there because 
we have architectures where you need to use special CPU instructions for 
iomem access.

That won't go away just because we use memremap().

Christian.

>
> As for limited arch support for memremap cached, It looks like we only
> need to or in "backup" mapping modes in the memremap flags, and we'd
> mimic the previous behaviour.
>
> /Thomas
>
>
>>> /Thomas
>>>
>>>
>

