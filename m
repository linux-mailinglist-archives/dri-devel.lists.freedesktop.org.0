Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168575730B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 07:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE2A10E069;
	Tue, 18 Jul 2023 05:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F61A10E069
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 05:14:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=es1Ns584JocOam8KRrRQnWd3Oasz+FXatcv5rk26uD9LdSikMtD9vjLaaQoRfAtQLB8IOq3uhWqFUJ52bBIbz12tPSMtr3bZg7UqgabQ0tWVuPyGuXNwGA7kXmecmKLapXB3yNy7xjWYYOEJeuv0WENOUb6y3tmodPunQUqQ6FMSFdqnYV6MHJdxV1f8CtVpzmxEifUTuUD3dk7vzmcNhBhUy7JzamMOaZHPECzTLQew4Oa1Qji+qCGMB54ka+zw76eDc33KHr50uvnLflm/gY8ZfJ9AAAHQS81bu0xkVDYgKbmlP15LZTwL5wX8xVwqcJ66KBxirF9BXStiyfbtKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcEv6r6dmmPy2ifGbIludp/eoVL4zdZt+hwrwcusmC4=;
 b=iB4Zm4Qaa5roB+m9V8Tz6SlzR6bikfNYqGjqwLV3GIgR0T3KoZWkPepRBz85BVHB0sLWItkzy0FCjFJeHpfNrVELgtUZI7NCAdUUvf+bo1HgF4Mk1aIhAOR2QXq8qEYU6/55wp4u0VgD1TYIXsva1Q/rI2zVPnDsp/aArDdu8DoG1UuHoHW9wKOYFzRnNy92uT6LEGSReokE5JLQE78kyMOw3+lxWeSBt+dmRCH4hnb9TgCnh4Ex8/9qTNfZhN/qjUTB/WpT1qbcZiejxqA7VAx7c8VoYZNtehZS9HMriKtSXfWVJzOWIyAC2wJP4jcenLv2P6+iBC+sdcRAb9XhKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcEv6r6dmmPy2ifGbIludp/eoVL4zdZt+hwrwcusmC4=;
 b=n+TudnngUKwBcyjFqHuH+M5UtKiPyDPdAvAdEqU38NMa+TcMMILxBZWKLtqGa9WJPHdmLi2hOkMVvnrzsPEy39Pz0WYK1Ara+HOQYFOMEgR4bzIJSSf6KuDlP/Ov/Egn4Y4f5LEa4mxLKotNMZ+iXurxBQMOf7bmP/MmdGG1IdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.32; Tue, 18 Jul 2023 05:14:02 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 05:14:02 +0000
Message-ID: <41efcbe5-e230-270f-53bb-90c703e9d3ad@amd.com>
Date: Tue, 18 Jul 2023 01:14:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/scheduler: Clean up jobs when the scheduler is
 torn down.
Content-Language: en-CA, en-US
To: Asahi Lina <lina@asahilina.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-3-c567249709f7@asahilina.net>
 <9343165f-2533-f363-4942-719ee9b7d2a4@amd.com>
 <99f9003f-d959-fff3-361a-25b2f47efc88@asahilina.net>
 <49a33f61-91b5-22ee-78b5-c7dd7c0d4a46@amd.com>
 <4587c699-5a59-d465-01f4-1bc2fbef7a12@asahilina.net>
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
In-Reply-To: <4587c699-5a59-d465-01f4-1bc2fbef7a12@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0007.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::20) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS7PR12MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: e386c7ca-9eb9-4cf2-dfd5-08db874dccd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ap+SN07vptZmgkBsvXwCcH2MjBAcToOTzHvfN9doD3pd0DohgU8Wj3IBtY5wcy0Z7xdR8UPLrc1szM8NrqRSQOSoG2n0cNXw8lU/QHOIRKPvXAOIvHZjfGUcBzieVnRmTF8JLCZQuMJ+wytpG0Kq+lK7DmN1QSisGbmqRC+/txqjIPxkO5zeeu93FDs/VfzGVoo64b1ZCuzLLfnQ7GAxrRyzVquLE2ibTIHpJ7p2VBO4RwVbCAHAYKO5azyaWqREnqfHhWH4+P+RFrojxFHFkAu5+MGbzN4L6QGS0xnfjDbrzxHDORae4GVmJbnJwaH9rb2Br3/z7BX7mul96cShu3sbNFz5g4ZHWuPnRjpSf1oE+3U8JEgOyzOUas6Dfge4fIfpxn67tkI3G5EqFOqTRaneOcYBzKjUXv441o5utwxLP04NYC7YOhaLRtCwxGo2sKqFT9GPNl73exNULH+u3xBI7Hf5nLo+i8QzuA+RaP2cdBSiReQKN3V8U9iZoBn54IWBMnwb0ALVhUdG/r+EhYag3oLefh+jAm5fz4oLRfIPY3TqUrAYLiNyEcZ7G3OYc2loBwX07O6yptptGgJVnFQaToHoKShezmrhpmNuEQbR7YceWAC8/OIhutklL0szAZRp+I42Rxfc7BN52ue/SA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199021)(316002)(6636002)(4326008)(66946007)(86362001)(31686004)(38100700002)(31696002)(6486002)(6512007)(110136005)(478600001)(54906003)(8936002)(2616005)(44832011)(41300700001)(8676002)(7416002)(66476007)(66556008)(26005)(6506007)(5660300002)(186003)(53546011)(83380400001)(66899021)(2906002)(36756003)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWdCTE9VaHVqeWVsTko3QnhLYllQYjNvRmNybTZYVnlWNDdZa0wwazU0azB6?=
 =?utf-8?B?M0pDanVGaEJjdFBqdGxSRy91d0tLWGZMM25GM3locmozcTd6RHBYVlQyNnZW?=
 =?utf-8?B?d0g1dHZaL1pHT2pPalRKNVJzaFZ3NXg4cStRdzVJUmNHOG9rRXdzNkhBWkty?=
 =?utf-8?B?VmVCdks5Nkc0c3d3QjdleFBXbk9pdnhKQkpKNklNZjBGL0c2VXFCRVkyYkE1?=
 =?utf-8?B?Z3duT1FVWmcyaDA1aFhtcFkwQTVkbjJKNGVVNndpQXFURFMyZUdTK0JmUjFn?=
 =?utf-8?B?Qkg1N2NwclFIZlBEWXdVS2pnanQ4d1NvNnpLMk5GSHdrOGJWMmJnQmM3QklX?=
 =?utf-8?B?UUlZcHZiVWJWL1AxcHpSYnVrRkVpa2ZhQkZwa2Z0TVdBa2V5azViZ1pUVVBC?=
 =?utf-8?B?YW5OYXc5amUwMGJPeDRCRlVFY3Uzcnd5cHJBeFBhbWpiOStJd0wyU2VXYk9W?=
 =?utf-8?B?SWNnVVNwMTBRUW5UTDYzbmR3QThyNTBDUTRBQng1anU1SXU1ZllhNktmOVlq?=
 =?utf-8?B?OCs1MjB6ak1RUVVTSnJ6eVZKUjJsc1J2R3hDN3YxNjRFY3VJeGVWZVBxc2Vh?=
 =?utf-8?B?VkFIWGFnNnB5NTRoTllSM0hRWVdka25TaUxHcWt6REtQcDFnWXZQYmpHc1VX?=
 =?utf-8?B?My9pR1lJVVdJeHV3OGZFVko0UjdoZHl6ZlBFNzhPMDFDcllKMFhGZXRocXlq?=
 =?utf-8?B?ZnF6ZmxJQ2VLb3JsMDFUbDh5Q25NZC9ZK25VMVVJOU9OYUE5UUVKVFJNbGpI?=
 =?utf-8?B?WTNMbGRHM1hHSDdoRWl1VDJzeis2N0ZyT2NsSzVpZ0s1ZG95R3VaREwzMXBp?=
 =?utf-8?B?dTF3TlhmNzFSRmVOMTNMV2prcTgyMTdER0F5TDgwak1YdkNIeVA3dG5aYTBU?=
 =?utf-8?B?VEVmR09VNFlzb0h4Mk9nMlI0OS90bDd1c0VNK3F1aFVWSi9xUmVLV0pmZEdF?=
 =?utf-8?B?bVVSanZodElMZXNNcDBzY2VRTVNwOEFwU3lTbXdYQWk5YnlDZW9VYlQyNHg3?=
 =?utf-8?B?MUVXM2lxSUhrSDZ1T3QvdlZDNmJlTU5hTlA1dWo3Y0YvL0p0NVFhMllkWnp4?=
 =?utf-8?B?bnkrZTArdlUvM1hJYUkrdmdiNG80K1lGTWJkVU5LM3JkMjYrdzlkSnA5bUNL?=
 =?utf-8?B?cE5jZ282R3pCWUxrSm1uZUFWRGYyNm9IcVlNbnRpNElXQ3phL3JkRXFlVnZZ?=
 =?utf-8?B?OEZLRW1rNko4eHNNbTd2YWZUN2NJT29oSm9nVCszOWIxdmhTc0JRRlhZM2ht?=
 =?utf-8?B?U3VkNndBdzhGVW04dllaUmVzUmpUQVpnVkZ5NHhwbkI2QnhnbUcyRHlRa1oy?=
 =?utf-8?B?UjRBNWl1RjV5R2lkYkF4WkFoL0paL2I1RVpOaDBQTE5KWTAyQ3VodGtxdzIw?=
 =?utf-8?B?S0Z5cC90dTdsc1NRaTViNW8rVE85UHFPYmNIa0hTUVlaTGZuN3ZMcEU5QjRJ?=
 =?utf-8?B?MzlMMnBvbkZnd0FoY0IralZ0aDVwVTE5V3JVR1hkWDRmd2ZjYXJhK3RuNGVS?=
 =?utf-8?B?eVdVZmd3SDRGbmxrd3RFdnJTT0d3YkpJM3EvSm9OdGIvYTNPSDdvaUlyVDRi?=
 =?utf-8?B?WVdjdnNmQ2xCUjliaDFzWlV5QTdrSVhxZUI2c3FXWmh2MUkwZWdncTNsTW8x?=
 =?utf-8?B?YlZlY08xdElQL29jVEdxY2NWajhjQlh1dGJaV1JrWERPUG5XeFU1aDM4YVlt?=
 =?utf-8?B?ZnlsaTJWaGl5WFVuSU5uK2RxOXpuancvUXJxbVk5TXNndzU0aktDQ2JhbVFT?=
 =?utf-8?B?QjNFSDlQamNKSTNIb0pqaEY5ODlLem81QkJwVHpvU3BTRHNWSGJYMTZFeTBO?=
 =?utf-8?B?ZnJ5Mjc1cTVCLzd5L2FyblZ5TVFFVHREbThTaVVQV0tUaDQ4SkZZOURtb3h0?=
 =?utf-8?B?RlFnYllRcVc4RHZmT1YwNnF4OUZCSzhRVzlyNkZCRWZUdTFlTkUrV3ZvdFR6?=
 =?utf-8?B?QXErMW5HdGFsTE5VaTVuM1lPaEdPcGRtb1FCaUdhVm8vLy93OXFFbEFDdzVa?=
 =?utf-8?B?U24zbUpXTGpYRlMzS2VBM0swbFcyaGUyWG5lSm5JMC9ERDhoSUM4NkdkNmxl?=
 =?utf-8?B?K2R3amFtV3NnUE12MUR0NVhRTkx2M012QTZUVXZOTWN3c0dmK25LZVhnQ1RK?=
 =?utf-8?Q?pAcDXM+sRvunUs4mwXIh5GBu8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e386c7ca-9eb9-4cf2-dfd5-08db874dccd3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 05:14:02.3192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxcYIGcIM9lXVmh1oFjVSLcyIhnMGec9rIVZtAAANSK489pHBH136rg4u/Untpgr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007
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

On 2023-07-17 18:45, Asahi Lina wrote:
> On 18/07/2023 02.40, Luben Tuikov wrote:
>> On 2023-07-16 03:51, Asahi Lina wrote:
>>> On 15/07/2023 16.14, Luben Tuikov wrote:
>>>> On 2023-07-14 04:21, Asahi Lina wrote:
>>>>> drm_sched_fini() currently leaves any pending jobs dangling, which
>>>>> causes segfaults and other badness when job completion fences are
>>>>> signaled after the scheduler is torn down.
>>>>
>>>> If there are pending jobs, ideally we want to call into the driver,
>>>> so that it can release resources it may be holding for those.
>>>> The idea behind "pending" is that they are pending in the hardware
>>>> and we don't know their state until signalled/the callback called.
>>>> (Or unless the device is reset and we get a notification of that fact.)
>>>
>>> That's what the job->free_job() callback does, then the driver is free
>>> to do whatever it wants with those jobs. A driver could opt to
>>> synchronously kill those jobs (if it can) or account for them
>>> separately/asynchronously.
>>>
>>> What this patch basically says is that if you destroy a scheduler with
>>> pending jobs, it immediately considers them terminated with an error,
>>> and returns ownership back to the driver for freeing. Then the driver
>>> can decide how to handle the rest and whatever the underlying hardware
>>> state is.
>>>
>>>>> Explicitly detach all jobs from their completion callbacks and free
>>>>> them. This makes it possible to write a sensible safe abstraction for
>>>>> drm_sched, without having to externally duplicate the tracking of
>>>>> in-flight jobs.
>>>>>
>>>>> This shouldn't regress any existing drivers, since calling
>>>>> drm_sched_fini() with any pending jobs is broken and this change should
>>>>> be a no-op if there are no pending jobs.
>>>>
>>>> While this statement is true on its own, it kind of contradicts
>>>> the premise of the first paragraph.
>>>
>>> I mean right *now* it's broken, before this patch. I'm trying to make it
>>> safe, but it shouldn't regress any exiting drivers since if they trigger
>>> this code path they are broken today.
>>
>> Not sure about other drivers--they can speak for themselves and the CC list
>> should include them--please use "dim add-missing-cc" and make sure
>> that the Git commit description contains the Cc tags--then git send-email
>> will populate the SMTP CC. Feel free to add more Cc tags on top of that.
> 
> I use `b4 prep -c` which I think does the same thing? I just ran it 
> again and it only added 'linaro-mm-sig@lists.linaro.org', not sure why 
> that one wasn't there. Am I missing anything else?

Not sure about "b4 prep -c"--using "git send-email" instead, but what is
important is to add the Cc: tags as part of the commit message. A "git log" of
drm-misc-next shows the proper format. Then maintainers add Link:
tag to the correct email thread, which is usually completely automated
by "dim" or by "git am", or both.

I never do any of this stuff manually and it's all done by tools
like "dim", and the such. Sometimes I'd run "scripts/get_maintainer.pl"
manually ("dim add-missing-cc" runs that script too), as well
as "git blame" and "git log -- <file>" to see if I can add more Cc:
tags to the commit message to keep people well informed. Then
let "git send-email" add them to the SMTP CC, when the patch
is actually emailed out.

> 
>>>
>>>>
>>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>>> ---
>>>>>    drivers/gpu/drm/scheduler/sched_main.c | 32 ++++++++++++++++++++++++++++++--
>>>>>    1 file changed, 30 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 1f3bc3606239..a4da4aac0efd 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -1186,10 +1186,38 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>>    void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>>    {
>>>>>    	struct drm_sched_entity *s_entity;
>>>>> +	struct drm_sched_job *s_job, *tmp;
>>>>>    	int i;
>>>>>    
>>>>> -	if (sched->thread)
>>>>> -		kthread_stop(sched->thread);
>>>>> +	if (!sched->thread)
>>>>> +		return;
>>>>> +
>>>>> +	/*
>>>>> +	 * Stop the scheduler, detaching all jobs from their hardware callbacks
>>>>> +	 * and cleaning up complete jobs.
>>>>> +	 */
>>>>> +	drm_sched_stop(sched, NULL);
>>>>> +
>>>>> +	/*
>>>>> +	 * Iterate through the pending job list and free all jobs.
>>>>> +	 * This assumes the driver has either guaranteed jobs are already stopped, or that
>>>>> +	 * otherwise it is responsible for keeping any necessary data structures for
>>>>> +	 * in-progress jobs alive even when the free_job() callback is called early (e.g. by
>>>>> +	 * putting them in its own queue or doing its own refcounting).
>>>>> +	 */
>>>>> +	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>>>> +		spin_lock(&sched->job_list_lock);
>>>>> +		list_del_init(&s_job->list);
>>>>> +		spin_unlock(&sched->job_list_lock);
>>>>> +
>>>>> +		dma_fence_set_error(&s_job->s_fence->finished, -ESRCH);
>>>>> +		drm_sched_fence_finished(s_job->s_fence);
>>>>
>>>> I'd imagine it's better to rebase this on top of drm-misc-next where
>>>> drm_sched_fence_finished() takes one more parameter--the error.
>>>
>>> Ah, sure! I can do that.
>>
>> It's worth posting it as a stand-alone patch. Please make sure to add Cc tags
>> into the commit description--use "dim add-missing-cc", perhaps also
>> git-blame and git-log might help with additional Cc. "scripts/get_maintainer.pl"
>> for files unaffected by this commit. (dim add-missing-cc uses get_maintainer.pl
>> for affected files.)
>>
>> Feel free to post it stand-alone and we'll let the natural review process take over. :-)
> 
> I already posted this one as part of the bindings RFC and the other one 
> stand-alone, and they got NAKed by Christian, that's why it's a specific 
> series for sched now with the docs, per Daniel's suggestion... now 
> you're saying I should post them stand-alone again... ?

Oh, I see. I don't remember why Christian NAK-ed it--do you have a link by any chance?

As I said, conceptually I don't mind this patch as there is some merit to what it is
trying to do, but this does beg the question why no drivers seem to have wanted it thus far?

However, it is worth nothing that there is some logic to this patch, so I'd say,
if driver writers agree with it (we do call their free_job() method after all--do
we need to check that it is non-null?), we can at least try to cement
whether this is something they think is good to have, or is redundant, or breaks
some assumption, and so on.
-- 
Regards,
Luben

> 
>>>
>>>>
>>>>> +
>>>>> +		WARN_ON(s_job->s_fence->parent);
>>>>> +		sched->ops->free_job(s_job);
>>>>> +	}
>>>>> +
>>>>> +	kthread_stop(sched->thread);
>>>>>    
>>>>>    	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>    		struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>>>
>>>>
>>>> Conceptually I don't mind this patch--I see what it is trying to achieve,
>>>> but technically, we want the driver to detect GPU removal and return shared
>>>> resources back, such as "jobs", which DRM is also aware of.
>>>
>>> I think you missed the context of why I'm doing this, so in short: my
>>
>> As a general rule of thumb, in my writing emails I try to avoid using
>> "you" and "I" as much as possible--it sets this divisive stage, and it
>> can get misrepresented, especially in email.
>>
>> As is the case in research literature, if I absolutely have to use a pronoun--which
>> rarely happens, I always use "we", and this is the most number of "I"-s I've used
>> in a long while.
>>
>>> use case (like Xe's) involves using a separate drm_sched instance *per
>>> file* since these queues are scheduled directly by the firmware. So this
>>> isn't about GPU removal, but rather about a GPU context going away while
>>> jobs are in flight (e.g. the process got killed). We want that to
>>> quickly kill the "DRM view" of the world, including signaling all the
>>> fences with an error and freeing resources like the scheduler itself.
>>>
>>> In the case of this particular GPU, there is no known way to actively
>>> and synchronously abort GPU jobs, so we need to let them run to
>>> completion (or failure), but we don't want that to block process cleanup
>>> and freeing a bunch of high-level resources. The driver is architected
>>> roughly along the lines of a firmware abstraction layer that maps to the
>>> firmware shared memory structures, and then a layer on top that
>>> implements the DRM view. When a process gets killed, the DRM side (which
>>> includes the scheduler, etc.) gets torn down immediately, and it makes
>>> sense to handle this cleanup inside drm_sched since it already has a
>>> view into what jobs are in flight. Otherwise, I would have to duplicate
>>> job tracking in the driver (actually worse: in the Rust abstraction for
>>> safety), which doesn't make much sense.
>>>
>>> But what I *do* have in the driver is tracking of the firmware
>>> structures. So when the drm_sched gets torn down and all the jobs
>>> killed, the underlying firmware jobs do run to completion, and the
>>> resources they use are all cleaned up after that (it's all reference
>>> counted).
>>
>> The ref-count definitely helps here.
>>
>>> The primitive involved here is that in-flight firmware jobs
>>> are assigned an event completion slot, and that keeps a reference to
>>> them from a global array until the events fire and all the jobs are
>>> known to have completed. This keeps things memory-safe, since we
>>> absolutely cannot free/destroy firmware structures while they are in use
>>> (otherwise the firmware crashes, which is fatal on these GPUs - requires
>>> a full system reboot to recover).
>>>
>>> In practice, with the VM map model that we use, what ends up happening
>>> when a process gets killed is that all the user objects for in-flight
>>> jobs get unmapped, which usually causes the GPU hardware (not firmware)
>>> to fault. This then triggers early termination of jobs anyway via the
>>> firmware fault recovery flow. But even that takes some short amount of
>>> time, and by then all the drm_sched stuff is long gone and we're just
>>> dealing with the in-flight firmware stuff.
>>>
>>>> In the case where we're initiating the tear, we should notify the driver that
>>>> we're about to forget jobs (resources), so that it knows to return them back
>>>> or that it shouldn't notify us for them (since we've notified we're forgetting them.)
>>>
>>> That contradicts Christian's comment. I tried to document that (after
>>> this patch) the scheduler no longer cares about hw fences and whether
>>> they are signaled or not after it's destroyed, and I got a strongly
>>> worded NAK for it. Sooo... which is it? Is it okay for drivers not to
>>> signal the hw fence after a scheduler teardown, or not?
>>
>> Christian is correct in that we don't want to hang upstream control
>> to the whims of a low-level device driver.
>>
>>> But really, I don't see a use case for an explicit "about to forget job"
>>> callback. The job free callback already serves the purpose of telling
>>
>> Long time ago, in a galaxy far far away, this was needed in order
>> to prevent device write-DMA into non-existing (random) memory. As
>> this is not the case anymore, go with Christian's comment.
>>
>>> the driver to clean up resources associated with a job. If it wants to
>>> synchronously abort things there, it could easily take over its own
>>> fence signaling and do something with the underlying stuff if the fence
>>> is not signaled yet.
>>>
>>> In my case, since the driver is written in Rust and free_job() just maps
>>> to the destructor (Drop impl), that just ends up freeing a bunch of
>>> memory and other objects, and I don't particularly care about the state
>>> of the firmware side any more after that. The flow is the same whether
>>> it was a successful job completion, a failure, or an early destruction
>>> due to the drm_sched getting torn down.
>>>
>>>> (Note also that in this latter case, traditionally, the device would be reset,
>>>> so that we can guarantee that it has forgotten all shared resources which
>>>> we are to tear up. This is somewhat more complicated with GPUs, thus the method
>>>> pointed out above.)
>>>
>>> Yeah, in the firmware scheduling case we can't do this at all unless the
>>> firmware has an explicit teardown/forget op (which I'm not aware of) and
>>> a full GPU reset isn't something we can do either. Hence we just let the
>>> underlying jobs complete. In practice they tend to die pretty quickly
>>> anyway once all the buffers are unmapped.
>>
>> Perhaps in the future, as more complex workloads are deferred to this
>> hardware and driver, a real-time requirement might be needed for this
>> "tend to die pretty quickly", that that there's some guarantee of
>> work resuming in some finite time.
> 
> That's not something we can control. This hardware is reverse-engineered 
> and we don't get to write the firmware (it's signed). Maybe there is a 
> job cancel op, and maybe we'll find it some day, or maybe not. I've 
> certainly never seen macOS do anything like that, including in very 
> blatant cases like a 30-second compute job. On macOS it kept running to 
> completion even after I killed the process. We can't make the 
> hardware/firmware do something it can't do.
> 
> At least there's firmware preemption though, so a rogue long-running job 
> shouldn't block everything else.
> 
> ~~ Lina
> 

