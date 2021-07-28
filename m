Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C9F3D8F1B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D29D6E987;
	Wed, 28 Jul 2021 13:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FE76E987
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:31:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFD04RxSeI59Fj2pqyuN+MSaCyHmOo0EgI1ZYovp4IalpbjQwQwxPx54N3wHhFHyfEs/nYu60y9jUxp7GCz0D7RmpWbDW0ePLUp1s5eQpKgvAB6Bu2H8gmsi6PT1oLKIGKjnczUUUkb+5PtbUjxj8XxmTgofxHRBxkwaIkZ61xTZJcb3yzK+EeitV8Q84f4VArxeRKuZl97jRx9wSqrx0PZwCsVnKdcpsQIa3/v8vvPjDamp1C5fq/17kuHn4gb+ktonDA0VIhgK3G4gNeLMultiCt/wx6rFchpObAENmQCOsR2XYMNswtLsOGumFg+9M4znsIoZcAtRb6IByEedFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2IhckuCMbydUrQRFstJF3gWBrkPOsiPceSX2QZJn4I=;
 b=SC9RHH61yb34P6+1njliY0rsR4/Se2sahoWmjzzy4VW3QjmtWptzyYdbQR9zrXOjbDN10aPcsLs6oilbgNpY7hXoXywQLFBBt9EBNeWUGzBzaErUfXkN/U2H3Gh2NF/GIrCSqzsHMMjV+P4I8Tj1p2N5MdZc0erqZxQAdzbazx/CD2MLkRimM6XA/aVa/9e6vFwiVb2Q/BSUyHGoExAHshnT6mqk5d9edo18AcmfxzBXukRSXs+y3bnVbY2hPqDxY9kfXC82NOOIIjjeXvUoAI7jbJL5YvSrqFQzNSxTDpKypMJ6v9GytjiPCHe5sUq5EetxvAxP8u7y14a+clT5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2IhckuCMbydUrQRFstJF3gWBrkPOsiPceSX2QZJn4I=;
 b=WPEtJNwE2A0spfTV/rWClAatKCOib9JAZRhf9hPdZmHWuFT7fwZK6znmFhu4sH6sEfnWN5C1+O2Fvc5n3joBzOQ3DI/CoDmvcbe+3mfLxlnB7nbf038fZOSk4xAOyKQ6XO4IzZcJy7knhFkMrBBaGMo8R6RK0viZ9sAS0sT2kOs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3727.namprd12.prod.outlook.com (2603:10b6:208:15a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 13:31:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 13:31:47 +0000
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@chromium.org>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
Date: Wed, 28 Jul 2021 15:31:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0002.eurprd03.prod.outlook.com
 (2603:10a6:208:14::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:af99:e30a:2b7e:eda8]
 (2a02:908:1252:fb60:af99:e30a:2b7e:eda8) by
 AM0PR03CA0002.eurprd03.prod.outlook.com (2603:10a6:208:14::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Wed, 28 Jul 2021 13:31:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d8f66f3-c50d-40aa-190d-08d951cc0c3c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3727:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3727F676BDDBE44478F5D90483EA9@MN2PR12MB3727.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GOn6NypFOvkWaRMrlmDPOLWFkQ1acbKg6wbP93rDnNXDPSIsUwtZHsYEUgqtwd4p4AWPVd5bevSONpWCtjR6oDLNR1YZovNtAtVKrlnIpjrqE5Z7u8xfTckxxXB0TFY6qKYm/Gn6MrPhFlRoxk2gAW0U8z4yYfe99qCEkuCo/CdVuQpo0ewDqo2W4yPEKcDxRvIhHEcvyXPHWonKOpHe/Of7IoTvE2428levhuT7LS22Geq40yIuJSHXbGR9VTXwAZZXz32WfIAt1JjhoUOCOqJvwMZ9B3O9kbiaaIjDS+bvnriEQz2lBj9FAMT4v6amYqIF17WfKLAtNp97O3Y/2PPT7Kpe26lwQ1Zthz5kseSHMCvu/ruHAnv6TlTQ/Tht2vV1ho0/FWIKnqQiqctjo1WxTC6sNQaNs48Glu1qEQV2ldS4dkDnF1ysSZhzmGkfuSo35xM/K6i+KGzD0vtzT6nwgHjKpoOCT1T/CMKox52Jf4aFbnEhsxzzXZ1gmF4I4m3vQiu8IJBfAeD08he1E/5T5goWzcmxfbgbjarZ4q9MD19pkcf8kD2mpGMo+yPAOJVmybkXmWF1w29aAbY2h4VOaFpxatgxoUhoBPNWH9JHYRxNT9zatL0bsI7ebNH8rJunQjtMhg7H4P9ZLGo76WYRIuLvtL2j6ZjUWsLCowtNj8vrWxNizThsAx4mWXGtq1aFHGXtHUL4HkGXA7OuCXdNP6hQScx0a0VKSurLm8p77HoZkjwUY0UmBqNzP8RUnjwHwWckeuM6dhuMlbpIrhP+uPb0KFv7XRe87O0/2H+6GZiNHwvpW25AVjRDniwy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(136003)(39850400004)(346002)(83380400001)(8676002)(66946007)(6486002)(66476007)(66556008)(31686004)(4326008)(66574015)(38100700002)(8936002)(966005)(53546011)(86362001)(6666004)(7416002)(2906002)(186003)(54906003)(2616005)(31696002)(5660300002)(36756003)(110136005)(45080400002)(478600001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlNEUC9Tc3FaYlZCMzExa3Q4VGpzdU51WGs0WTRhRis0Qlh3WkJTYU9oeUxu?=
 =?utf-8?B?QWRsRnk4SkU5dGhreWpqM2NxNFhtNzhFMGVpa3hQeXB3SjN0RGF4YUVOUlQz?=
 =?utf-8?B?UWluT3BJZXVKVENyYWt5ODFoNVlUOTZSYWhnTjlPQ3hVVmFaM1lzcFdhWWdM?=
 =?utf-8?B?cmVYUUFhY1djdHZaeERVejR3STczT3VzN0w4M0FZeEEveDF5c0F2cnNPdmtR?=
 =?utf-8?B?U1k0cEVDMWN4OWZqc0Nzckpsb2x4cEptamFYdG5HaFk4MWpMai8wWTd2dkNL?=
 =?utf-8?B?bzF0VERERlRwOVFpdVlicWkyaVVUeHg1VzMvRElsUnlzYVUyWjFPZHBKaEp5?=
 =?utf-8?B?Ky9wejFtbHBvK2RibldTNmxKWFNneXh1VTc4TW5EMFNlREdBcnB5YWpYTXVm?=
 =?utf-8?B?TW1ETXJadmpPVDNXOGFleC9ic3gyRlluc3BZMkljZndOR2c5Z1JFeUFQbnAy?=
 =?utf-8?B?NFV2VmE2eWZhSjhLUktXL1RzQXNNL1EzWnc1SjBGZ3V5WTkyL0NmNTFld3Qy?=
 =?utf-8?B?OFlCM29kZEZFT0p2bXpGZDF2emV0Z3VEbitocHRYc1V1RU5rQXhST1VucjIz?=
 =?utf-8?B?T3FVVkU1emZoRlQwaXNGUHRiVVMvVUtSL0lpRlFmTE50UGcvcFpmY3RRTmVN?=
 =?utf-8?B?TG5xbFVROWxodXpSVll4RmxKWlJmTW9kR1plYzhldTYrWmZqY0p6ajVoUkVo?=
 =?utf-8?B?WEdjUWhxV2lQdUZtN01VTVVxNDZDdlRnamJJNTZNcVhJaytvckd3VFZndTc4?=
 =?utf-8?B?OVV3SFBDMWxOMzlmR0ljSmVEUWJJNCtuOEg0Z2lCOVNoOG9XRndTQzJwMERR?=
 =?utf-8?B?YnhrSThVVktGeW5CMGgrUTZST0JaMkhKSWp3ZXE4MzVvT0U1SGF0MnRyN2cx?=
 =?utf-8?B?aW1raDBpYVJ4allGVENoMTVQRHRrOXF5d0Y1ZWJoUE9PT0VyU3BQY1hnRkVz?=
 =?utf-8?B?ZGpZeHZadXYzWEdxRWpCY0xBZmc3NTR2Qi9BOU42cXNkYXBUdU01WmMxQ2o1?=
 =?utf-8?B?c2ZzQ1hZVFBwbnFLYkpHTlIxYUp0eS9vNmVhVXQ1cGZyK1hYNW9haFhZV2px?=
 =?utf-8?B?WjZOUGRpM0VPb2YxcGhKNGdybkJEb1l6MGdncjZ2cVhDQzEzN2w0andnUVZo?=
 =?utf-8?B?Yit6d2YyM2oxTU9FbFhtcDNqdFdqT2ZaUUlJMWlFbmFHMHFwNDRJUlozczJu?=
 =?utf-8?B?REVjUThvcW1rN0NTTGtDaHpxYnNqTjN4TlBIKzkrZzNUVDdEMUVQakQ4UHVW?=
 =?utf-8?B?cmRwTXF2cGh5cy9WSnFyR25mNHlySVRuU3NoNzF2c05EcjYvMTdJZGJSdkh4?=
 =?utf-8?B?REh5NEFCMHREZXg5bGlSRVk0TmllWW5kdmdGaFRLcmdaNm1JVDNQcS9mV1Qr?=
 =?utf-8?B?VTRzZFVrQVQrMEtyU2I1YlZLU2R4aHhmUDFZMlhOSy9mUXp1YllQY1IybjZG?=
 =?utf-8?B?bVY5ZkJTU3ZUdFE1dmREU24vTi8yZS85ZnRza2l5Q0ZXZFoxVGp5V0pKZDNE?=
 =?utf-8?B?R24xRitzYmdXN3RLYi9QdTQzWGtPa0pMQ2ZLT1lYM2ZKY0Q4ZDlRZjlZUzlY?=
 =?utf-8?B?NlcxWGdFRllrbzhYL2ZoVUNIeGZ0cVl4dE95N0l3WmVXUTFuOWJ6bTdGY1lu?=
 =?utf-8?B?UWZPc0dhU3hKRjB5dVRiQm1OU2RVMXNuNHR5VVVaN0dvVU1yeGEwdklRODBx?=
 =?utf-8?B?d3hvekdYVjUwdExwcEwvdHA1VG9SbXY4QUk1UjBrMGdyWDZTK1NaVnpqQXZY?=
 =?utf-8?B?ejIrRE9zZG4zK01NMWxkdXA3OUNTSGV2cDQ3emVSSGNwU3dvTlZPTmE2QUVt?=
 =?utf-8?B?NEgweU9TcGh4ODV4U2ZJc0JpbTlMTkZRaWRIdmRIa2NLUEtyc0Nua3RNZzVm?=
 =?utf-8?Q?5tUf2eOwHMRMo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8f66f3-c50d-40aa-190d-08d951cc0c3c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 13:31:47.1598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jDnbFl110qYtxFvT8p45pCleP1Srd0whNzzv9GyDPV7C09XP55j4eJQZK/jEjTO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3727
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
Cc: Matthew Brost <matthew.brost@intel.com>, Jack Zhang <Jack.Zhang1@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.07.21 um 15:24 schrieb Michel Dänzer:
> On 2021-07-28 3:13 p.m., Christian König wrote:
>> Am 28.07.21 um 15:08 schrieb Michel Dänzer:
>>> On 2021-07-28 1:36 p.m., Christian König wrote:
>>>> Am 27.07.21 um 17:37 schrieb Rob Clark:
>>>>> On Tue, Jul 27, 2021 at 8:19 AM Michel Dänzer <michel@daenzer.net> wrote:
>>>>>> On 2021-07-27 5:12 p.m., Rob Clark wrote:
>>>>>>> On Tue, Jul 27, 2021 at 7:50 AM Michel Dänzer <michel@daenzer.net> wrote:
>>>>>>>> On 2021-07-27 1:38 a.m., Rob Clark wrote:
>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>>>
>>>>>>>>> Based on discussion from a previous series[1] to add a "boost" mechanism
>>>>>>>>> when, for example, vblank deadlines are missed.  Instead of a boost
>>>>>>>>> callback, this approach adds a way to set a deadline on the fence, by
>>>>>>>>> which the waiter would like to see the fence signalled.
>>>>>>>>>
>>>>>>>>> I've not yet had a chance to re-work the drm/msm part of this, but
>>>>>>>>> wanted to send this out as an RFC in case I don't have a chance to
>>>>>>>>> finish the drm/msm part this week.
>>>>>>>>>
>>>>>>>>> Original description:
>>>>>>>>>
>>>>>>>>> In some cases, like double-buffered rendering, missing vblanks can
>>>>>>>>> trick the GPU into running at a lower frequence, when really we
>>>>>>>>> want to be running at a higher frequency to not miss the vblanks
>>>>>>>>> in the first place.
>>>>>>>>>
>>>>>>>>> This is partially inspired by a trick i915 does, but implemented
>>>>>>>>> via dma-fence for a couple of reasons:
>>>>>>>>>
>>>>>>>>> 1) To continue to be able to use the atomic helpers
>>>>>>>>> 2) To support cases where display and gpu are different drivers
>>>>>>>>>
>>>>>>>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90331%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ccd365bc397c247bb96b108d951cb0686%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630754720055928%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1s0obbeqH%2FoiVh1JRfNaZIqPVK3EbKB0OP9zZ%2BAz874%3D&amp;reserved=0
>>>>>>>> Unfortunately, none of these approaches will have the full intended effect once Wayland compositors start waiting for client buffers to become idle before using them for an output frame (to prevent output frames from getting delayed by client work). See https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.gnome.org%2FGNOME%2Fmutter%2F-%2Fmerge_requests%2F1880&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ccd365bc397c247bb96b108d951cb0686%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630754720065922%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=6aTvBugWzfyZ13NLRYW3Qh9t2%2BDbmKpC1390m07BxV0%3D&amp;reserved=0 (shameless plug :) for a proof of concept of this for mutter. The boost will only affect the compositor's own GPU work, not the client work (which means no effect at all for fullscreen apps where the compositor can scan out the client buffers directly).
>>>>>>>>
>>>>>>> I guess you mean "no effect at all *except* for fullscreen..."?
>>>>>> I meant what I wrote: The compositor will wait for the next buffer to become idle, so there's no boost from this mechanism for the client drawing to that buffer. And since the compositor does no drawing of its own in this case, there's no boost from that either.
>>>>>>
>>>>>>
>>>>>>> I'd perhaps recommend that wayland compositors, in cases where only a
>>>>>>> single layer is changing, not try to be clever and just push the
>>>>>>> update down to the kernel.
>>>>>> Even just for the fullscreen direct scanout case, that would require some kind of atomic KMS API extension to allow queuing multiple page flips for the same CRTC.
>>>>>>
>>>>>> For other cases, this would also require a mechanism to cancel a pending atomic commit, for when another surface update comes in before the compositor's deadline, which affects the previously single updating surface as well.
>>>>>>
>>>>> Well, in the end, there is more than one compositor out there.. and if
>>>>> some wayland compositors are going this route, they can also implement
>>>>> the same mechanism in userspace using the sysfs that devfreq exports.
>>>>>
>>>>> But it sounds simpler to me for the compositor to have a sort of "game
>>>>> mode" for fullscreen games.. I'm less worried about UI interactive
>>>>> workloads, boosting the GPU freq upon sudden activity after a period
>>>>> of inactivity seems to work reasonably well there.
>>>> At least AMD hardware is already capable of flipping frames on GPU events like finishing rendering (or uploading etc).
>>>>
>>>> By waiting in userspace on the CPU before send the frame to the hardware you are completely killing of such features.
>>>>
>>>> For composing use cases that makes sense, but certainly not for full screen applications as far as I can see.
>>> Even for fullscreen, the current KMS API only allows queuing a single page flip per CRTC, with no way to cancel or otherwise modify it. Therefore, a Wayland compositor has to set a deadline for the next refresh cycle, and when the deadline passes, it has to select the best buffer available for the fullscreen surface. To make sure the flip will not miss the next refresh cycle, the compositor has to pick an idle buffer. If it picks a non-idle buffer, and the pending rendering does not finish in time for vertical blank, the flip will be delayed by at least one refresh cycle, which results in visible stuttering.
>>>
>>> (Until the deadline passes, the Wayland compositor can't even know if a previously fullscreen surface will still be fullscreen for the next refresh cycle)
>> Well then let's extend the KMS API instead of hacking together workarounds in userspace.
> That's indeed a possible solution for the fullscreen / direct scanout case.
>
> Not for the general compositing case though, since a compositor does not want to composite multiple output frames per display refresh cycle, so it has to make sure the one frame hits the target.

Yeah, that's true as well.

At least as long as nobody invents a mechanism to do this decision on 
the GPU instead.

Christian.
