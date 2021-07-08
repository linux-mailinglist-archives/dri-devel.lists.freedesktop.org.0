Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AB13BF898
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 12:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C54E6E1ED;
	Thu,  8 Jul 2021 10:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2085.outbound.protection.outlook.com [40.107.100.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3AF6E1D3;
 Thu,  8 Jul 2021 10:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oB0rXkni4bO59hiH4iytfWIPS+VS6WQ7PH0rXiLNVfVgdq3K1KlNRbAOzwz9WFEG8ml6bcokWXH+Wr1MXhyQgqX7PwQ/XRQk0i9fVUGd4GJ4OIo0t3NQqIu+W+gilT2VE/+V+F42VrPN/7vwv89kbbbTLaFrPzK7R2ZDtabEiKPINsDaTxpfkjVUzb2jkjs8ii/Oa8I4eHK65YWTEx5tAMs0cT8OfM046hf/5KnE6wyVC5rKViaoj6o9ZCsCaDyO4tiE5cV5YR8Mh+n/Vfct6sVtuTefApOx6qkaFDPy10EDYeZBtFYvOZMovdmsCSLvWiM4rhowPU5s+/CIVCH1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzTJSQJ5Kt91q7u1HpsybpnjsmVFL51eewZGS73zwyE=;
 b=kXnWTxxqb3cuCYTIDFZziDvQucd26K7NuucuYZr/LzsP0e+Ym1toA3UKX/mVC/S79/KqYTKL3nArKKM+O2M6AlhpSxBl5yZNaS2T2wFLHkayvAiuFoM/hoT6ImX9ZOFSy4soSCPiPpULPyN1Q+wUuZMoXatg5o/g8Q1WXbcvVeTGp82/sNhZNEJpXcB5jisLO3sghAW5SiQ9HzvIqqWEeFK5xqgh3BoNHwqYLYW5tysrQcTGBs0WXaKf2B1UGfUO3MNisEjRtJeZTVEZOCtieh3ayu3lTipx760/j7tWNHeReFIrm8aRt929ZBruZS7JdHqdNSwET5wv25r2X+FT9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzTJSQJ5Kt91q7u1HpsybpnjsmVFL51eewZGS73zwyE=;
 b=WDKlCfGGTFOpF+RASE2Koyk2RyUksdNyaeT0jXKfZlME89QrO5HKJIe1Q/+UjC4S4URfGODPtit0bk0A1eN9gw6mPggQZQg6KUeixq3cRRVEsar3JCoRTnT0FVYkZJW14ULpoZzWVxqp7103bptPCTDCxEfI+ZEJ+uiEDHSeipc=
Authentication-Results: anholt.net; dkim=none (message not signed)
 header.d=none;anholt.net; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 10:54:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 10:54:19 +0000
Subject: Re: [PATCH v2 01/11] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel@ffwll.ch>
References: <a5c5647e-e0ce-cc6d-c473-685679739051@amd.com>
 <CAKMK7uGTSe9FZCup=6D2G3MWGuxoUiV3Qjau-pQyaqOAX8OTug@mail.gmail.com>
 <8387b5f8-a5f6-fc2d-48e6-4bb0768ac642@amd.com>
 <CAKMK7uFu7V0QzsbMGPJPnMjXOB7FrKB_d+oDwkFMVaEvgy5EOQ@mail.gmail.com>
 <7933a995-0c95-9339-5385-a24681f6df3a@amd.com>
 <CAKMK7uE3bd2whKVBA4uWmzKBp7fjcVKexVFc=TB+ZRxdYT7VNg@mail.gmail.com>
 <b4824514-4ffd-a5f0-9bbc-d89cdd4e7b50@amd.com>
 <CAKMK7uF7E4G9D_W+YRV_ZrJLtUFXqWZfN78VdrVC=byMux78LQ@mail.gmail.com>
 <CAKMK7uEwFUq2KnSjk0YgdbKKvhh2ifsyURO0E5RzzhWzzMtovQ@mail.gmail.com>
 <4369ee92-7eba-3faa-4d9c-08901d3506aa@amd.com>
 <YObNNcSZL0CBXvQK@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <700b6419-4d3c-9cc8-f8bd-0d7d134df546@amd.com>
Date: Thu, 8 Jul 2021 12:54:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YObNNcSZL0CBXvQK@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0233.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bc19:c1e3:6307:7e3e]
 (2a02:908:1252:fb60:bc19:c1e3:6307:7e3e) by
 PR0P264CA0233.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 10:54:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb656f5c-f480-4d88-e0fe-08d941febc09
X-MS-TrafficTypeDiagnostic: MN2PR12MB4320:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4320521E6B13257F1D137E4D83199@MN2PR12MB4320.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6S/oqs/UxzvmgAmQ0w06F/zkHdiBWVN1L1SJHoX5p0Fir2wXqnEgBZcCZOTjaXL8wxbxoqbqFOSlZ1+bBuxYS9FvkXCV28Wo5jWNzBL1LRMAaJ56WaC8aN3DyGBtVFS8+QgNfJLGo8xMpBP6sjTV/ubPsPtJoRvenSoDMQCshr3avIuRkJW4orvu9qrvH7cCPBl2iSMkvPHGPJ57td+irEKGzsoITjR8xy/a0AVhV4mOlTcDxKjLCQUnfLDODF5q5GdLi1S3MUF3pohmCWvJyDhJRZnWQ6QukdnkS5cclBmHYAqHNu5oVVF4ywqQkykdjNxEuQoYGFS1uNZbZzZOBL9K+N7rEbI8+sT6/ooMcKY8DT8k/SxxfB35B/vR39te1QKdlgOiYiBCZGMBG7F2Mvj8hycLxytUTuLkJlIORDkusM3QNOiLnbZA2Rk90dYhZJi35FqwvPoaIgJjeVfVsFZlzu8VLiWPo1ZuzA9ZEOkidgXP6t2eC5MWqV/9O+EUsFJgt351bqeyFnzFjwyCPL6hCoKmYAyUMpeg2OZ1R/lFVPh8Oovjk1G7TBGxq6Sq1vNIVfzldFZeYUzPhcFKGoDW43PIVrUresaxj4Co+qTgumakx0kfanlSUwC1TMRyTjWMRCVq4H6Fzg4mb2VU9PA22fUIBvYCPjx+c9KZg4uFzJwm5XiqSmbZV/NyrepbhOk25w7JASCiL7aQxXZLBFSve5nZDLSw3gr/vgtxyBGvXVlTT/pakn7S7MM1TNIkw9Fj2lX+LO0BNAObI8JgIXs1NTgEWzcShE9+Vfa3uOoL86sirbiBlOzfn1pm0WoEA+ZwEXfsPwLZPh49Ya7hsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(54906003)(31696002)(4326008)(66946007)(6666004)(6916009)(66476007)(8676002)(8936002)(7406005)(66556008)(5660300002)(66574015)(316002)(6486002)(31686004)(186003)(30864003)(86362001)(83380400001)(53546011)(966005)(38100700002)(478600001)(2906002)(45080400002)(7416002)(2616005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blE5OW5kdTJzaW1EcVFQK2FFZTFITHkyVDBPNzJrT1c3Zjd0T2RxL00yajAw?=
 =?utf-8?B?T3djZnVndU9VcFh4VjVBZUNFN2lMTDNWRzlnVnpCZkYrdWIrYk9oanZiM1pD?=
 =?utf-8?B?clV6dEVleVZzL1YySGc1d1QrTUl1UThQajUzYzRsMDAvNzg1UCsvdHpQOFg4?=
 =?utf-8?B?eURDNlhIYWFmM09nUzlLSlRkNEF4N0ZyYVVWZkt1WnBCR0NYc3RraWphTzdC?=
 =?utf-8?B?YVhRTHA4VDA0MUtKa0FZVU5aUUs0cHJZdm9SOHZHYWFLdzc3eEJ4WWlLSUNM?=
 =?utf-8?B?Sm5BQy84cy8zbW56ckNUb2RJNWl0dzVRVTg2ZGhmWTZVbUs3eklIYWRJcEJN?=
 =?utf-8?B?SXd4UWFRNXpxUjNWZ3Y5YUVTNzBhVkdiMGRtMHk4TmZVSURWTGtYZ204dXhk?=
 =?utf-8?B?VDV3S0t1a28vWVNUNVQ3Q2NvVlRXbVNUc0kwWlFJekd6eTd3NDc3M1FsbVdh?=
 =?utf-8?B?L1g1Z0RCT0xhOEpFSzZmM0U3aWNGVjNQMEJWTXN4SDRCVUU2T3NsdjR3alZM?=
 =?utf-8?B?WmFXY3RzTFA5YTlSdkdZNnR3c0lKQ01BYkovNmpJR2Q2NjZKcVNrckZQMjND?=
 =?utf-8?B?QzBOdXdJc2ZIb2sySzQ5YXVYYVpuZ0pQbE84cXIzQ3hhWGJFejRuTVZUcmtE?=
 =?utf-8?B?akl3Z0kxWmFJN2FnUkx1RVBxQVdxUkdhNVRHUFY2Z1d1TFU5V1BZbUk0T0lF?=
 =?utf-8?B?VjUrd3Bya2YwMitKYi8vb1Z4SWszYktGdTE4ZjlyVGVpdjZqSENxVWRQaUxm?=
 =?utf-8?B?djFGa3hob3Y4NjEwVi96bklwNkV0NE9od3o1NFlDVFEzdW9Zbk1CTzNNVy8y?=
 =?utf-8?B?RG1hNUZpZFN2d1l3cU8xdkFFd09hNVIrbVRQVC9WdFF1UmYxRzhIZzBNcHNE?=
 =?utf-8?B?VE5TNVdpWVl3dzhGaDFFN1Zya1JvQk5Na2MwSGwrQmdPdDhmMUpsWXQzUmE4?=
 =?utf-8?B?dkluY3JHR3NxMWhjVklaKzNpY2t2dlhON2lFNUVZRkdwZVJmSnNCQmpjT0Y3?=
 =?utf-8?B?ZmQwMWlxR2VzRWpGQmlmL0lqWWFnbGdhTk5zNVkycmw2UmJ6YjFMUHAwenc2?=
 =?utf-8?B?UlhNVFhuZUlBQ1ZjV2dkRVZudGROeXZ2ZWdpZzdjVC8wNHo1Y01Eb1QvQ0lv?=
 =?utf-8?B?MXFsZ3VpNHZMLzkxSmhwTkk0b1ROM1E4UWtSRm1TSVVHd21Idk1XRzNXeTZZ?=
 =?utf-8?B?QVVWU0NwTXVZNlZqeGl1QW5CNXlDUk5nZGdDZk41bTRtSUs3bzViWjhycVh4?=
 =?utf-8?B?YkdESUt5Y0llTWhOclJIR2lNYnJreEhEdlBRc2JDSWEwQlpRdmVzTHZjMXVn?=
 =?utf-8?B?Sy94bm42ZGFOUnUzRkZrQTB2VTRvdVUvUkFjaVIwZ0NTVlpjL2xSRjlzY0dE?=
 =?utf-8?B?SG9XTlZFYWF5QkNUUzVVWWdzVit3cGRpOTBNOW52Y1VkTGo1SHB2Z2tSc3V5?=
 =?utf-8?B?MGhnU2laYnJ6WWxtelc3MzlFNGk1bGZQcnVlK2hoS0ZDTzRJd0dkbVVTTmxv?=
 =?utf-8?B?MXdYVXY3V1Mybm5hc1hTVFlUMlU2R0R2b0swdkYvWUM5Uk5LTVd3RHhPUXJr?=
 =?utf-8?B?aEhTNHQvSDgySDlrSGlVRzVBRVdzZkJHN3lYWWVPK09CVnFvQ21rR2hYQm13?=
 =?utf-8?B?Y2J6SGlTQXBkUFluTWIwMm1yM0o3ck1tR2o0c1I0Q3Z2aEsxeWJjdzBZMU5N?=
 =?utf-8?B?ZTZaUHRVRlBhSWJLbXp2R0JUN1RmMTVvRG9YdlNJRlo3bjdyYUU4TlhaY3Zq?=
 =?utf-8?B?Y3NlTmN2Q2hhZ0F5QkFNRThYaVNCc21CM0o4azBaTWQ1ODdNUWIyaC9CUG1R?=
 =?utf-8?B?eUw1UGk5UVFpVmtLZThHaUJFek1PaFYxR3RPREFnR3hVaEsrMzNaWGN0eHUw?=
 =?utf-8?Q?p5/4Miuh84P41?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb656f5c-f480-4d88-e0fe-08d941febc09
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 10:54:18.7595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/AeixzuWGWjHRP9AwZM/iISIOEXaibNVK4prlXBlicDE4JDIkr7m9T8CtrJNAdP
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
Cc: Emma Anholt <emma@anholt.net>, Adam Borowski <kilobyte@angband.pl>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, lima@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kevin Wang <kevin1.wang@amd.com>,
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Nick Terrell <terrelln@fb.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.07.21 um 12:02 schrieb Daniel Vetter:
> On Thu, Jul 08, 2021 at 09:53:00AM +0200, Christian König wrote:
>> Am 08.07.21 um 09:19 schrieb Daniel Vetter:
>>> On Thu, Jul 8, 2021 at 9:09 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>> On Thu, Jul 8, 2021 at 8:56 AM Christian König <christian.koenig@amd.com> wrote:
>>>>> Am 07.07.21 um 18:32 schrieb Daniel Vetter:
>>>>>> On Wed, Jul 7, 2021 at 2:58 PM Christian König <christian.koenig@amd.com> wrote:
>>>>>>> Am 07.07.21 um 14:13 schrieb Daniel Vetter:
>>>>>>>> On Wed, Jul 7, 2021 at 1:57 PM Christian König <christian.koenig@amd.com> wrote:
>>>>>>>>> Am 07.07.21 um 13:14 schrieb Daniel Vetter:
>>>>>>>>>> On Wed, Jul 7, 2021 at 11:30 AM Christian König
>>>>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>>>>> Am 02.07.21 um 23:38 schrieb Daniel Vetter:
>>>>>>>>>>>> This is a very confusingly named function, because not just does it
>>>>>>>>>>>> init an object, it arms it and provides a point of no return for
>>>>>>>>>>>> pushing a job into the scheduler. It would be nice if that's a bit
>>>>>>>>>>>> clearer in the interface.
>>>>>>>>>>>>
>>>>>>>>>>>> But the real reason is that I want to push the dependency tracking
>>>>>>>>>>>> helpers into the scheduler code, and that means drm_sched_job_init
>>>>>>>>>>>> must be called a lot earlier, without arming the job.
>>>>>>>>>>>>
>>>>>>>>>>>> v2:
>>>>>>>>>>>> - don't change .gitignore (Steven)
>>>>>>>>>>>> - don't forget v3d (Emma)
>>>>>>>>>>>>
>>>>>>>>>>>> v3: Emma noticed that I leak the memory allocated in
>>>>>>>>>>>> drm_sched_job_init if we bail out before the point of no return in
>>>>>>>>>>>> subsequent driver patches. To be able to fix this change
>>>>>>>>>>>> drm_sched_job_cleanup() so it can handle being called both before and
>>>>>>>>>>>> after drm_sched_job_arm().
>>>>>>>>>>> Thinking more about this, I'm not sure if this really works.
>>>>>>>>>>>
>>>>>>>>>>> See drm_sched_job_init() was also calling drm_sched_entity_select_rq()
>>>>>>>>>>> to update the entity->rq association.
>>>>>>>>>>>
>>>>>>>>>>> And that can only be done later on when we arm the fence as well.
>>>>>>>>>> Hm yeah, but that's a bug in the existing code I think: We already
>>>>>>>>>> fail to clean up if we fail to allocate the fences. So I think the
>>>>>>>>>> right thing to do here is to split the checks into job_init, and do
>>>>>>>>>> the actual arming/rq selection in job_arm? I'm not entirely sure
>>>>>>>>>> what's all going on there, the first check looks a bit like trying to
>>>>>>>>>> schedule before the entity is set up, which is a driver bug and should
>>>>>>>>>> have a WARN_ON?
>>>>>>>>> No you misunderstood me, the problem is something else.
>>>>>>>>>
>>>>>>>>> You asked previously why the call to drm_sched_job_init() was so late in
>>>>>>>>> the CS.
>>>>>>>>>
>>>>>>>>> The reason for this was not alone the scheduler fence init, but also the
>>>>>>>>> call to drm_sched_entity_select_rq().
>>>>>>>> Ah ok, I think I can fix that. Needs a prep patch to first make
>>>>>>>> drm_sched_entity_select infallible, then should be easy to do.
>>>>>>>>
>>>>>>>>>> The 2nd check around last_scheduled I have honeslty no idea what it's
>>>>>>>>>> even trying to do.
>>>>>>>>> You mean that here?
>>>>>>>>>
>>>>>>>>>              fence = READ_ONCE(entity->last_scheduled);
>>>>>>>>>              if (fence && !dma_fence_is_signaled(fence))
>>>>>>>>>                      return;
>>>>>>>>>
>>>>>>>>> This makes sure that load balancing is not moving the entity to a
>>>>>>>>> different scheduler while there are still jobs running from this entity
>>>>>>>>> on the hardware,
>>>>>>>> Yeah after a nap that idea crossed my mind too. But now I have locking
>>>>>>>> questions, afaiui the scheduler thread updates this, without taking
>>>>>>>> any locks - entity dequeuing is lockless. And here we read the fence
>>>>>>>> and then seem to yolo check whether it's signalled? What's preventing
>>>>>>>> a use-after-free here? There's no rcu or anything going on here at
>>>>>>>> all, and it's outside of the spinlock section, which starts a bit
>>>>>>>> further down.
>>>>>>> The last_scheduled fence of an entity can only change when there are
>>>>>>> jobs on the entities queued, and we have just ruled that out in the
>>>>>>> check before.
>>>>>> There aren't any barriers, so the cpu could easily run the two checks
>>>>>> the other way round. I'll ponder this and figure out where exactly we
>>>>>> need docs for the constraint and/or barriers to make this work as
>>>>>> intended. As-is I'm not seeing how it does ...
>>>>> spsc_queue_count() provides the necessary barrier with the atomic_read().
>>>> atomic_t is fully unordered, except when it's a read-modify-write
>>> Wasn't awake yet, I think the rule is read-modify-write and return
>>> previous value gives you full barrier. So stuff like cmpxchg, but also
>>> a few others. See atomic_t.txt under ODERING heading (yes that
>>> maintainer refuses to accept .rst so I can't just link you to the
>>> right section, it's silly). get/set and even RMW atomic ops that don't
>>> return anything are all fully unordered.
>> As far as I know that not completely correct. The rules around atomics i
>> once learned are:
>>
>> 1. Everything which modifies something is a write barrier.
>> 2. Everything which returns something is a read barrier.
>>
>> And I know a whole bunch of use cases where this is relied upon in the core
>> kernel, so I'm pretty sure that's correct.
> That's against what the doc says, and also it would mean stuff like
> atomic_read_acquire or smp_mb__after/before_atomic is completely pointless.
>
> On x86 you're right, anywhere else where there's no total store ordering I
> you're wrong.

Good to know. I always thought that atomic_read_acquire() was just for 
documentation purpose.



> If there's code that relies on this it needs to be fixed and properly
> documented. I did go through the squeue code a bit, and might be better to
> just replace this with a core data structure.

Well the spsc was especially crafted for this use case and performed 
quite a bit better then a double linked list.

Or what core data structure do you have in mind?

Christian.

> -Daniel
>
>> In this case the write barrier is the atomic_dec() in spsc_queue_pop() and
>> the read barrier is the aromic_read() in spsc_queue_count().
>>
>> The READ_ONCE() is actually not even necessary as far as I can see.
>>
>> Christian.
>>
>>> -Daniel
>>>
>>>
>>>> atomic op, then it's a full barrier. So yeah you need more here. But
>>>> also since you only need a read barrier on one side, and a write
>>>> barrier on the other, you don't actually need a cpu barriers on x86.
>>>> And READ_ONCE gives you the compiler barrier on one side at least, I
>>>> haven't found it on the writer side yet.
>>>>
>>>>> But yes a comment would be really nice here. I had to think for a while
>>>>> why we don't need this as well.
>>>> I'm typing a patch, which after a night's sleep I realized has the
>>>> wrong barriers. And now I'm also typing some doc improvements for
>>>> drm_sched_entity and related functions.
>>>>
>>>>> Christian.
>>>>>
>>>>>> -Daniel
>>>>>>
>>>>>>> Christian.
>>>>>>>
>>>>>>>
>>>>>>>> -Daniel
>>>>>>>>
>>>>>>>>> Regards
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>> -Daniel
>>>>>>>>>>
>>>>>>>>>>> Christian.
>>>>>>>>>>>
>>>>>>>>>>>> Also improve the kerneldoc for this.
>>>>>>>>>>>>
>>>>>>>>>>>> Acked-by: Steven Price <steven.price@arm.com> (v2)
>>>>>>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>>>>>>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>>>>>>>>>>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>>>>>>>>>>>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>>>>>>>>>>>> Cc: Qiang Yu <yuq825@gmail.com>
>>>>>>>>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>>>>>>>>> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>>>>>>>>>>> Cc: Steven Price <steven.price@arm.com>
>>>>>>>>>>>> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>>>>>>>>>>> Cc: David Airlie <airlied@linux.ie>
>>>>>>>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>>>>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>>>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>>>>>>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>>>>>>>>>>> Cc: Kees Cook <keescook@chromium.org>
>>>>>>>>>>>> Cc: Adam Borowski <kilobyte@angband.pl>
>>>>>>>>>>>> Cc: Nick Terrell <terrelln@fb.com>
>>>>>>>>>>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>>>>>>>>>>> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
>>>>>>>>>>>> Cc: Sami Tolvanen <samitolvanen@google.com>
>>>>>>>>>>>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>>>>>>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>>>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>>>>>>>>>> Cc: Nirmoy Das <nirmoy.das@amd.com>
>>>>>>>>>>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
>>>>>>>>>>>> Cc: Lee Jones <lee.jones@linaro.org>
>>>>>>>>>>>> Cc: Kevin Wang <kevin1.wang@amd.com>
>>>>>>>>>>>> Cc: Chen Li <chenli@uniontech.com>
>>>>>>>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>>>>>>>>> Cc: "Marek Olšák" <marek.olsak@amd.com>
>>>>>>>>>>>> Cc: Dennis Li <Dennis.Li@amd.com>
>>>>>>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>>>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>>>> Cc: Sonny Jiang <sonny.jiang@amd.com>
>>>>>>>>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>>>>>>>> Cc: Tian Tao <tiantao6@hisilicon.com>
>>>>>>>>>>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
>>>>>>>>>>>> Cc: etnaviv@lists.freedesktop.org
>>>>>>>>>>>> Cc: lima@lists.freedesktop.org
>>>>>>>>>>>> Cc: linux-media@vger.kernel.org
>>>>>>>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>>>>>>>> Cc: Emma Anholt <emma@anholt.net>
>>>>>>>>>>>> ---
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
>>>>>>>>>>>>        drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
>>>>>>>>>>>>        drivers/gpu/drm/lima/lima_sched.c        |  2 ++
>>>>>>>>>>>>        drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
>>>>>>>>>>>>        drivers/gpu/drm/scheduler/sched_entity.c |  6 ++--
>>>>>>>>>>>>        drivers/gpu/drm/scheduler/sched_fence.c  | 17 +++++----
>>>>>>>>>>>>        drivers/gpu/drm/scheduler/sched_main.c   | 46 +++++++++++++++++++++---
>>>>>>>>>>>>        drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
>>>>>>>>>>>>        include/drm/gpu_scheduler.h              |  7 +++-
>>>>>>>>>>>>        10 files changed, 74 insertions(+), 14 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>>>>>> index c5386d13eb4a..a4ec092af9a7 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>>>>>> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>>>>>>>>>>>            if (r)
>>>>>>>>>>>>                    goto error_unlock;
>>>>>>>>>>>>
>>>>>>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>>>>>>> +
>>>>>>>>>>>>            /* No memory allocation is allowed while holding the notifier lock.
>>>>>>>>>>>>             * The lock is held until amdgpu_cs_submit is finished and fence is
>>>>>>>>>>>>             * added to BOs.
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>>>>>>> index d33e6d97cc89..5ddb955d2315 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>>>>>>> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
>>>>>>>>>>>>            if (r)
>>>>>>>>>>>>                    return r;
>>>>>>>>>>>>
>>>>>>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>>>>>>> +
>>>>>>>>>>>>            *f = dma_fence_get(&job->base.s_fence->finished);
>>>>>>>>>>>>            amdgpu_job_free_resources(job);
>>>>>>>>>>>>            drm_sched_entity_push_job(&job->base, entity);
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>>>>>>> index feb6da1b6ceb..05f412204118 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>>>>>>> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>>>>>>>>>>>>            if (ret)
>>>>>>>>>>>>                    goto out_unlock;
>>>>>>>>>>>>
>>>>>>>>>>>> +     drm_sched_job_arm(&submit->sched_job);
>>>>>>>>>>>> +
>>>>>>>>>>>>            submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
>>>>>>>>>>>>            submit->out_fence_id = idr_alloc_cyclic(&submit->gpu->fence_idr,
>>>>>>>>>>>>                                                    submit->out_fence, 0,
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>>>>>>>>>>> index dba8329937a3..38f755580507 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>>>>>>>>>>> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
>>>>>>>>>>>>                    return err;
>>>>>>>>>>>>            }
>>>>>>>>>>>>
>>>>>>>>>>>> +     drm_sched_job_arm(&task->base);
>>>>>>>>>>>> +
>>>>>>>>>>>>            task->num_bos = num_bos;
>>>>>>>>>>>>            task->vm = lima_vm_get(vm);
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>>>>>>> index 71a72fb50e6b..2992dc85325f 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>>>>>>> @@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_job *job)
>>>>>>>>>>>>                    goto unlock;
>>>>>>>>>>>>            }
>>>>>>>>>>>>
>>>>>>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>>>>>>> +
>>>>>>>>>>>>            job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>>>>>>>>>>
>>>>>>>>>>>>            ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>>>> index 79554aa4dbb1..f7347c284886 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>>>> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>>>>>>>>>>         * @sched_job: job to submit
>>>>>>>>>>>>         * @entity: scheduler entity
>>>>>>>>>>>>         *
>>>>>>>>>>>> - * Note: To guarantee that the order of insertion to queue matches
>>>>>>>>>>>> - * the job's fence sequence number this function should be
>>>>>>>>>>>> - * called with drm_sched_job_init under common lock.
>>>>>>>>>>>> + * Note: To guarantee that the order of insertion to queue matches the job's
>>>>>>>>>>>> + * fence sequence number this function should be called with drm_sched_job_arm()
>>>>>>>>>>>> + * under common lock.
>>>>>>>>>>>>         *
>>>>>>>>>>>>         * Returns 0 for success, negative error code otherwise.
>>>>>>>>>>>>         */
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>>>>>>> index 69de2c76731f..c451ee9a30d7 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>>>>>>> @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>>>>>>>>>>>>         *
>>>>>>>>>>>>         * Free up the fence memory after the RCU grace period.
>>>>>>>>>>>>         */
>>>>>>>>>>>> -static void drm_sched_fence_free(struct rcu_head *rcu)
>>>>>>>>>>>> +void drm_sched_fence_free(struct rcu_head *rcu)
>>>>>>>>>>>>        {
>>>>>>>>>>>>            struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>>>>>>>>>>>>            struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>>>>>>>>>>> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>>>>>>>>>>        }
>>>>>>>>>>>>        EXPORT_SYMBOL(to_drm_sched_fence);
>>>>>>>>>>>>
>>>>>>>>>>>> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>>>>>>>>>>> -                                            void *owner)
>>>>>>>>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>>>>>>>>>> +                                           void *owner)
>>>>>>>>>>>>        {
>>>>>>>>>>>>            struct drm_sched_fence *fence = NULL;
>>>>>>>>>>>> -     unsigned seq;
>>>>>>>>>>>>
>>>>>>>>>>>>            fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>>>>>>>>>>>>            if (fence == NULL)
>>>>>>>>>>>> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>>>>>>>>>>>            fence->sched = entity->rq->sched;
>>>>>>>>>>>>            spin_lock_init(&fence->lock);
>>>>>>>>>>>>
>>>>>>>>>>>> +     return fence;
>>>>>>>>>>>> +}
>>>>>>>>>>>> +
>>>>>>>>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>>>>>>>>> +                       struct drm_sched_entity *entity)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +     unsigned seq;
>>>>>>>>>>>> +
>>>>>>>>>>>>            seq = atomic_inc_return(&entity->fence_seq);
>>>>>>>>>>>>            dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>>>>>>>>>>                           &fence->lock, entity->fence_context, seq);
>>>>>>>>>>>>            dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>>>>>>>>>>>                           &fence->lock, entity->fence_context + 1, seq);
>>>>>>>>>>>> -
>>>>>>>>>>>> -     return fence;
>>>>>>>>>>>>        }
>>>>>>>>>>>>
>>>>>>>>>>>>        module_init(drm_sched_fence_slab_init);
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>>> index 33c414d55fab..5e84e1500c32 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>>> @@ -48,9 +48,11 @@
>>>>>>>>>>>>        #include <linux/wait.h>
>>>>>>>>>>>>        #include <linux/sched.h>
>>>>>>>>>>>>        #include <linux/completion.h>
>>>>>>>>>>>> +#include <linux/dma-resv.h>
>>>>>>>>>>>>        #include <uapi/linux/sched/types.h>
>>>>>>>>>>>>
>>>>>>>>>>>>        #include <drm/drm_print.h>
>>>>>>>>>>>> +#include <drm/drm_gem.h>
>>>>>>>>>>>>        #include <drm/gpu_scheduler.h>
>>>>>>>>>>>>        #include <drm/spsc_queue.h>
>>>>>>>>>>>>
>>>>>>>>>>>> @@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>>>>>>>>>>
>>>>>>>>>>>>        /**
>>>>>>>>>>>>         * drm_sched_job_init - init a scheduler job
>>>>>>>>>>>> - *
>>>>>>>>>>>>         * @job: scheduler job to init
>>>>>>>>>>>>         * @entity: scheduler entity to use
>>>>>>>>>>>>         * @owner: job owner for debugging
>>>>>>>>>>>> @@ -577,6 +578,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>>>>>>>>>>         * Refer to drm_sched_entity_push_job() documentation
>>>>>>>>>>>>         * for locking considerations.
>>>>>>>>>>>>         *
>>>>>>>>>>>> + * Drivers must make sure drm_sched_job_cleanup() if this function returns
>>>>>>>>>>>> + * successfully, even when @job is aborted before drm_sched_job_arm() is called.
>>>>>>>>>>>> + *
>>>>>>>>>>>>         * Returns 0 for success, negative error code otherwise.
>>>>>>>>>>>>         */
>>>>>>>>>>>>        int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>>>>>> @@ -594,7 +598,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>>>>>>            job->sched = sched;
>>>>>>>>>>>>            job->entity = entity;
>>>>>>>>>>>>            job->s_priority = entity->rq - sched->sched_rq;
>>>>>>>>>>>> -     job->s_fence = drm_sched_fence_create(entity, owner);
>>>>>>>>>>>> +     job->s_fence = drm_sched_fence_alloc(entity, owner);
>>>>>>>>>>>>            if (!job->s_fence)
>>>>>>>>>>>>                    return -ENOMEM;
>>>>>>>>>>>>            job->id = atomic64_inc_return(&sched->job_id_count);
>>>>>>>>>>>> @@ -606,13 +610,47 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>>>>>>        EXPORT_SYMBOL(drm_sched_job_init);
>>>>>>>>>>>>
>>>>>>>>>>>>        /**
>>>>>>>>>>>> - * drm_sched_job_cleanup - clean up scheduler job resources
>>>>>>>>>>>> + * drm_sched_job_arm - arm a scheduler job for execution
>>>>>>>>>>>> + * @job: scheduler job to arm
>>>>>>>>>>>> + *
>>>>>>>>>>>> + * This arms a scheduler job for execution. Specifically it initializes the
>>>>>>>>>>>> + * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
>>>>>>>>>>>> + * or other places that need to track the completion of this job.
>>>>>>>>>>>> + *
>>>>>>>>>>>> + * Refer to drm_sched_entity_push_job() documentation for locking
>>>>>>>>>>>> + * considerations.
>>>>>>>>>>>>         *
>>>>>>>>>>>> + * This can only be called if drm_sched_job_init() succeeded.
>>>>>>>>>>>> + */
>>>>>>>>>>>> +void drm_sched_job_arm(struct drm_sched_job *job)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +     drm_sched_fence_init(job->s_fence, job->entity);
>>>>>>>>>>>> +}
>>>>>>>>>>>> +EXPORT_SYMBOL(drm_sched_job_arm);
>>>>>>>>>>>> +
>>>>>>>>>>>> +/**
>>>>>>>>>>>> + * drm_sched_job_cleanup - clean up scheduler job resources
>>>>>>>>>>>>         * @job: scheduler job to clean up
>>>>>>>>>>>> + *
>>>>>>>>>>>> + * Cleans up the resources allocated with drm_sched_job_init().
>>>>>>>>>>>> + *
>>>>>>>>>>>> + * Drivers should call this from their error unwind code if @job is aborted
>>>>>>>>>>>> + * before drm_sched_job_arm() is called.
>>>>>>>>>>>> + *
>>>>>>>>>>>> + * After that point of no return @job is committed to be executed by the
>>>>>>>>>>>> + * scheduler, and this function should be called from the
>>>>>>>>>>>> + * &drm_sched_backend_ops.free_job callback.
>>>>>>>>>>>>         */
>>>>>>>>>>>>        void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>>>>>>>>>>        {
>>>>>>>>>>>> -     dma_fence_put(&job->s_fence->finished);
>>>>>>>>>>>> +     if (!kref_read(&job->s_fence->finished.refcount)) {
>>>>>>>>>>>> +             /* drm_sched_job_arm() has been called */
>>>>>>>>>>>> +             dma_fence_put(&job->s_fence->finished);
>>>>>>>>>>>> +     } else {
>>>>>>>>>>>> +             /* aborted job before committing to run it */
>>>>>>>>>>>> +             drm_sched_fence_free(&job->s_fence->finished.rcu);
>>>>>>>>>>>> +     }
>>>>>>>>>>>> +
>>>>>>>>>>>>            job->s_fence = NULL;
>>>>>>>>>>>>        }
>>>>>>>>>>>>        EXPORT_SYMBOL(drm_sched_job_cleanup);
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>>>>>>>>>>>> index 4eb354226972..5c3a99027ecd 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>>>>>>>>>>>> @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
>>>>>>>>>>>>            if (ret)
>>>>>>>>>>>>                    return ret;
>>>>>>>>>>>>
>>>>>>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>>>>>>> +
>>>>>>>>>>>>            job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>>>>>>>>>>
>>>>>>>>>>>>            /* put by scheduler job completion */
>>>>>>>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>>>>>>>> index 88ae7f331bb1..83afc3aa8e2f 100644
>>>>>>>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>>>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>>>>>>>> @@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>>>>>>>>>>>        int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>>>>>>                           struct drm_sched_entity *entity,
>>>>>>>>>>>>                           void *owner);
>>>>>>>>>>>> +void drm_sched_job_arm(struct drm_sched_job *job);
>>>>>>>>>>>>        void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>>>>>>>>>>                                        struct drm_gpu_scheduler **sched_list,
>>>>>>>>>>>>                                           unsigned int num_sched_list);
>>>>>>>>>>>> @@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>>>>>>>>>>>                                       enum drm_sched_priority priority);
>>>>>>>>>>>>        bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>>>>>>>>>>>
>>>>>>>>>>>> -struct drm_sched_fence *drm_sched_fence_create(
>>>>>>>>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(
>>>>>>>>>>>>            struct drm_sched_entity *s_entity, void *owner);
>>>>>>>>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>>>>>>>>> +                       struct drm_sched_entity *entity);
>>>>>>>>>>>> +void drm_sched_fence_free(struct rcu_head *rcu);
>>>>>>>>>>>> +
>>>>>>>>>>>>        void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>>>>>>>>>>>>        void drm_sched_fence_finished(struct drm_sched_fence *fence);
>>>>>>>>>>>>
>>>> --
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C7086790381b9415f60e708d941f78266%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637613353580226578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=9GhYoGHD6TlcrW5dvT9Z%2BFukW%2F8%2BicK2t8180coEsJY%3D&amp;reserved=0
>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C7086790381b9415f60e708d941f78266%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637613353580236571%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Yt%2FirDjTmtDUjQS1xlYg4x5mz82cHkNyLPkNNpO31ro%3D&amp;reserved=0

