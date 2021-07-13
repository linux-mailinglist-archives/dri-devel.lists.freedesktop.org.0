Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1733C6AAF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 08:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE9E6E03C;
	Tue, 13 Jul 2021 06:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC206E037;
 Tue, 13 Jul 2021 06:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpqsXs83DZIMJNscR08AKDwQrm9CKZ2WjOuHygG/4lUfUiOMuHhQjezm4+1t9JcS9tMeRVssQ5WGtfVaf91x05GwPswDYhMu0MRr8XQ4mk2P9lJCKyECEdXgRlnjlpNIX5ttkPkp7g//IlGUzpz5qMjnysgirRsFv280TfWPSZcL070n5KCDoLBf0EM4Baq4RfDt7X0FbKZ1OwfjgRziAxJtxgpdiG6OfWQ0zQtbtXE+cQ9PyNGb2xjT41514GLk7bzT/e49SJ9lx1cqxz6PQD2Qu7D3dFHxcaqobLh6Y1BvisbFiouvyc8ie4X+FdVJ3038o/vHprpmIhXWF08tQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/5ZK/uBMBUMAfSe7r/Ub4ywOX+wovaiAOryCx6R4xw=;
 b=QgIlkXyjY+7QPeVmzX1ThkippyryTMk1SwNv+HgHY9uYryY7N8IGgptPSW/idQxWacjkIBPIFUMSzHj9vkJ564xq/bXB7BWD+UU25tZpoy7aAykdnCM5QWl2zz7vjjPURRX48AXWDqjF699YnEz42iHfXRy+N1jVig3xlULzqNPbzxkg6jpk7rq4almMgwzrECMSXU0uqq77FaJvVuPiJcZpqInvCf1g6bXGAoy/ZfSCVo7dUu3uqLCgA7M9rOOvpwMofrxtgEOH40qw0PYQuge2o0F4uH/ljdLN7Wu2Zzo04HJZpCnkjQZGZZWlPHZ98nBmpBWH38Ch48qRbBg5Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/5ZK/uBMBUMAfSe7r/Ub4ywOX+wovaiAOryCx6R4xw=;
 b=pBy5KEfL5Af6yCyGCwZVG2Heczwpbqp0q66+u4xPH6BTK5GM1PnQRlrh+CfrrU2ieyCDM92rMFVIde1GhCT1lVTDri29yBy8aIolbjNhQ9b1DruR1KvIMyYknvrKjkCEc8LuHT3oBHGNGpdLDewAksLOyHbrCbiqccPrmH/q49E=
Authentication-Results: anholt.net; dkim=none (message not signed)
 header.d=none;anholt.net; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4304.namprd12.prod.outlook.com (2603:10b6:208:1d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 06:40:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 06:40:33 +0000
Subject: Re: [PATCH v4 01/18] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-2-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0058920a-935a-20f2-9342-bda81485027f@amd.com>
Date: Tue, 13 Jul 2021 08:40:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210712175352.802687-2-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7f5a:cff:4644:b698]
 (2a02:908:1252:fb60:7f5a:cff:4644:b698) by
 FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 06:40:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86a395de-05f7-479e-b453-08d945c91d2f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4304:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB430405F4DC3C2DDBF5F6A02C83149@MN2PR12MB4304.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lnx4qVZkcTpZKvU+DU2tEfVsZtv+LKqu3bnZNZmJ4pFPWesBqFj2fZ+Ynrloe4SUUrvSzWNG7pvifQ26/0VrGL/hkrrYO72V/I1/QPv92qmbt5UNZzTm2l37E7AI3zBg0NKxBS7pYYw7KFMkygQKdhvAnoEkxT0yw2HJ00OKY0uhKiV8qDAgeOf4nNjfgyVa6SHGuQjDcpkwJ9oYri0eoOLD2G+m4k62iJu4imyyBzylRgGBY8m9XyVs9JSPs9/WO19oM/65f5sKdE/qCrnmQUXv0NSP0+wnPNhrxrDykyFWwJwHP809bT0Xmghp8Pi89TRHKyhXOg7YjRtOH4oYu2hy3vqhB2nLhaLDwgrKjv2uex/LuGla8HTIPywd0F0Bc+yiHDGFRwHvwksb/88Ta8qj0EsFSuaFBasTM+BScxBxLw9AxvpiexBIn9ziUuQaUHdUzAoYptuZhG3qGmhp++mdTQaOuXVhS1gWj2wnIhEK7FlLm5YwES/ZCN7wfqsS7jBdvWJ4m6cAaCxIwMiFoPYEU0IpT+dkFkeswojlXWyp/AuuYyeR01ozoGa5hBGARcc4E63Metn1Zf+g91cQLmfkIZeLnC28ELsEJPUq/bpa5BfYDO19YLvS2K6RBCzKUtsX/s7MWBBzMcDagUphMu+Nnvt+zJWVckf12cFEOXhXRcejs3G66F7xJmqi6Nl8FUBF8dHS4eN8ult0A65aImnI4dJalp2Q+kaMABrD7gI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(66574015)(8676002)(7406005)(83380400001)(66556008)(38100700002)(31696002)(30864003)(2616005)(2906002)(7416002)(31686004)(6666004)(8936002)(478600001)(36756003)(186003)(6486002)(316002)(110136005)(54906003)(86362001)(5660300002)(4326008)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z21OTGlwSXg4Z3orbElEcjdiVk1ackE5Wk5vejhPUVRKRlJhU3dFdm1Odmt6?=
 =?utf-8?B?czRuZnE1SGxQemRBbVVMNGlpVDE2QkRRUkVaMU0wVllmc1NqSzNkYzFDUEhW?=
 =?utf-8?B?VmpGVHBFUjJCYVdhSjVIQmp4L0lIWSs3RkRiN0dRTUxuSUNPTXhMTlljK3hB?=
 =?utf-8?B?MjVadlF2KzczUHNHUDZnNmxwZzJxWWV6T05tc2FETEhMOXZ3WThOR0Z4eWFr?=
 =?utf-8?B?UDhxRHMyaDVtUElEWkQvUlUwdC9rT2NqeGI5QmF2WHhiVDZucWV6UUJYbmtX?=
 =?utf-8?B?eUZRa2xaUFluR2xxcjZpSE9VamdXUEZLeDJiZVBxaHZ4WkYxbytBSXNnRWFu?=
 =?utf-8?B?ZlJrbXJIbkxsQmVnTWxEK1Z0a016cWd3R28yZk85d1gzWHJveXZTMzlLd1dG?=
 =?utf-8?B?eC9mYzNqMUxTeGRJTmhrL3pFbExjcERweVAxaFlvSi9LZ3JLM1A0Z05zc3p5?=
 =?utf-8?B?WjduaDlZYUUwTURjdTN1ZzJjNXN0RmVZQnBPSnpKTmlscGVVZ0xjLzlEMVZT?=
 =?utf-8?B?NHovejNac2RVSTJud3ZNN3lrL2paSXBjbXJ4TGd1Y2tlRHFDekxsTzBGdHBh?=
 =?utf-8?B?ckJKZFpXS0tDeWlkeFkvYUgydTF1OE1lTXpCOGhCcDA4UEdaaHZUWURhbmlG?=
 =?utf-8?B?elgyalRDQlVJV2RhNVJXcG80Vm4zMVdSbmIrYktpRCtpSFBvM3RjNHVLc3NF?=
 =?utf-8?B?b3hjcDlkeC91aDNiS3NpNTBQOXRmVVJiRUhnbktUN2phZDRYVjdHaGNJVXBj?=
 =?utf-8?B?Z3Q3djNGNk51K0pWbFVrYVVLYWZvcEpaNlVpY0hWZFlaY015S1BPckdMT2Ny?=
 =?utf-8?B?cDhtMHlFVklQY3orc0JkTWEwR1o1ckV3N2lqa0tvUHNlaFFuVnkra0d5Slh5?=
 =?utf-8?B?enQxMHhrdDBpNm5OY3UxV3R0WDNsVmNaRGpIemVwNjJ6REdqSFNlM240R0RC?=
 =?utf-8?B?MmJabGUreFlZZ0VERkVqL2MvOGV4aWVTZTloUVVDZkpaMUJ5S2g2cEJPY2ZZ?=
 =?utf-8?B?RFRIY2JZeGNRNjhpQVlVU3NlNWFkN1hhMkNycEJXaGNoWkpSeldLcCtiYVVG?=
 =?utf-8?B?ajZvQ2x6ZFdRS0d1TW55c3NSWTZIdjRjRGh3ZjlWUE4zeUkwRXZuYXgrNnFL?=
 =?utf-8?B?TUlVekNVV291OGYxSnhMQTZxOUJCcGpVSkJYU0tBNUMwZWxlUzdvTUErVGgz?=
 =?utf-8?B?UWVzSEFPL2lzK2wwMmZxRllxR0Q1SW4xQlNKLzV3UTZRSkFrd29sZmtnRFpy?=
 =?utf-8?B?Tk96YTJDQVU0bUZBUW41VGNxekpUeHBSODROd3VhTWZVeHkwRnI4TjVJOFZl?=
 =?utf-8?B?T3JPOWFsVFE2cnpxM2g3WmpWcG16WHpKVUZqWWdhYUVyaFJTZkxYU1RhaUhG?=
 =?utf-8?B?b1JSay82VGpwQ1V2bmdsOUcxdXVYSFUwa0EzSkdndmZRVWR1ZkZ5SXBzeWh3?=
 =?utf-8?B?ZDV6Yys2VTdpSElWQlEzT2pCYUtCTUJnaHBOVTEyRHFqWnJ5TmFZZEN4Uk9Z?=
 =?utf-8?B?VzdGY3J0Szcza0lWakdhQ1ZtK3F6NlUvMm83ZEkxNUhCS2QxV2llbEtGbmpv?=
 =?utf-8?B?QlpCYkZLeldRSkg1OTlBOVhWUjByb2NiNU1ybnBwOURZazhsdDZLZXdmNjVw?=
 =?utf-8?B?dWRtMW5HeXNDV1h5WVQ5STFvVUlWSlFKSTRicjFIY2FKamJucWdlRXJpTUFr?=
 =?utf-8?B?NEpiRVhMbzNZR1VxeUVZT1hyZDMwUElSZDdCUkJndjNPcEhoWEZ2VWN2a3Za?=
 =?utf-8?B?cHJGakFBZ0ZsTjFia1pCZDJDeXEydld1Y1dRbldKYU96WnVEMDY0SDJ6Ym5G?=
 =?utf-8?B?Q3p3NnUxZlZjWGExS1k0NGdXSTJGZTc2ZzlZRVFWOWQ5SFNpMHBLVmtKSllx?=
 =?utf-8?Q?sOIFxL+bYg2xd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a395de-05f7-479e-b453-08d945c91d2f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 06:40:33.4851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McTZv68RnoCjHB/I8BmLt7KDz95HTkWU7daswQTWtFVXdNyKP/4jcgG9WWFRhJSA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
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
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 Melissa Wen <melissa.srw@gmail.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 lima@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Nick Terrell <terrelln@fb.com>,
 Sonny Jiang <sonny.jiang@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.07.21 um 19:53 schrieb Daniel Vetter:
> This is a very confusingly named function, because not just does it
> init an object, it arms it and provides a point of no return for
> pushing a job into the scheduler. It would be nice if that's a bit
> clearer in the interface.
>
> But the real reason is that I want to push the dependency tracking
> helpers into the scheduler code, and that means drm_sched_job_init
> must be called a lot earlier, without arming the job.
>
> v2:
> - don't change .gitignore (Steven)
> - don't forget v3d (Emma)
>
> v3: Emma noticed that I leak the memory allocated in
> drm_sched_job_init if we bail out before the point of no return in
> subsequent driver patches. To be able to fix this change
> drm_sched_job_cleanup() so it can handle being called both before and
> after drm_sched_job_arm().
>
> Also improve the kerneldoc for this.
>
> v4:
> - Fix the drm_sched_job_cleanup logic, I inverted the booleans, as
>    usual (Melissa)
>
> - Christian pointed out that drm_sched_entity_select_rq() also needs
>    to be moved into drm_sched_job_arm, which made me realize that the
>    job->id definitely needs to be moved too.

As far as I can see you still have drm_sched_entity_select_rq() in 
drm_sched_job_init()?

Christian.

>
>    Shuffle things to fit between job_init and job_arm.
>
> v5:
> Reshuffle the split between init/arm once more, amdgpu abuses
> drm_sched.ready to signal gpu reset failures. Also document this
> somewhat. (Christian)
>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Acked-by: Steven Price <steven.price@arm.com> (v2)
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Adam Borowski <kilobyte@angband.pl>
> Cc: Nick Terrell <terrelln@fb.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Nirmoy Das <nirmoy.das@amd.com>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: "Marek Olšák" <marek.olsak@amd.com>
> Cc: Dennis Li <Dennis.Li@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Sonny Jiang <sonny.jiang@amd.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: etnaviv@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: Emma Anholt <emma@anholt.net>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 +
>   drivers/gpu/drm/lima/lima_sched.c        |  2 +
>   drivers/gpu/drm/panfrost/panfrost_job.c  |  2 +
>   drivers/gpu/drm/scheduler/sched_entity.c |  6 +--
>   drivers/gpu/drm/scheduler/sched_fence.c  | 19 ++++---
>   drivers/gpu/drm/scheduler/sched_main.c   | 69 ++++++++++++++++++++----
>   drivers/gpu/drm/v3d/v3d_gem.c            |  2 +
>   include/drm/gpu_scheduler.h              |  7 ++-
>   10 files changed, 91 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index c5386d13eb4a..a4ec092af9a7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>   	if (r)
>   		goto error_unlock;
>   
> +	drm_sched_job_arm(&job->base);
> +
>   	/* No memory allocation is allowed while holding the notifier lock.
>   	 * The lock is held until amdgpu_cs_submit is finished and fence is
>   	 * added to BOs.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index d33e6d97cc89..5ddb955d2315 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
>   	if (r)
>   		return r;
>   
> +	drm_sched_job_arm(&job->base);
> +
>   	*f = dma_fence_get(&job->base.s_fence->finished);
>   	amdgpu_job_free_resources(job);
>   	drm_sched_entity_push_job(&job->base, entity);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index feb6da1b6ceb..05f412204118 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>   	if (ret)
>   		goto out_unlock;
>   
> +	drm_sched_job_arm(&submit->sched_job);
> +
>   	submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
>   	submit->out_fence_id = idr_alloc_cyclic(&submit->gpu->fence_idr,
>   						submit->out_fence, 0,
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index dba8329937a3..38f755580507 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
>   		return err;
>   	}
>   
> +	drm_sched_job_arm(&task->base);
> +
>   	task->num_bos = num_bos;
>   	task->vm = lima_vm_get(vm);
>   
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 71a72fb50e6b..2992dc85325f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_job *job)
>   		goto unlock;
>   	}
>   
> +	drm_sched_job_arm(&job->base);
> +
>   	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>   
>   	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 79554aa4dbb1..f7347c284886 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>    * @sched_job: job to submit
>    * @entity: scheduler entity
>    *
> - * Note: To guarantee that the order of insertion to queue matches
> - * the job's fence sequence number this function should be
> - * called with drm_sched_job_init under common lock.
> + * Note: To guarantee that the order of insertion to queue matches the job's
> + * fence sequence number this function should be called with drm_sched_job_arm()
> + * under common lock.
>    *
>    * Returns 0 for success, negative error code otherwise.
>    */
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 69de2c76731f..bcea035cf4c6 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>    *
>    * Free up the fence memory after the RCU grace period.
>    */
> -static void drm_sched_fence_free(struct rcu_head *rcu)
> +void drm_sched_fence_free(struct rcu_head *rcu)
>   {
>   	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>   	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> @@ -152,27 +152,32 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>   }
>   EXPORT_SYMBOL(to_drm_sched_fence);
>   
> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
> -					       void *owner)
> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
> +					      void *owner)
>   {
>   	struct drm_sched_fence *fence = NULL;
> -	unsigned seq;
>   
>   	fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>   	if (fence == NULL)
>   		return NULL;
>   
>   	fence->owner = owner;
> -	fence->sched = entity->rq->sched;
>   	spin_lock_init(&fence->lock);
>   
> +	return fence;
> +}
> +
> +void drm_sched_fence_init(struct drm_sched_fence *fence,
> +			  struct drm_sched_entity *entity)
> +{
> +	unsigned seq;
> +
> +	fence->sched = entity->rq->sched;
>   	seq = atomic_inc_return(&entity->fence_seq);
>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>   		       &fence->lock, entity->fence_context, seq);
>   	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>   		       &fence->lock, entity->fence_context + 1, seq);
> -
> -	return fence;
>   }
>   
>   module_init(drm_sched_fence_slab_init);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 33c414d55fab..454cb6164bdc 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -48,9 +48,11 @@
>   #include <linux/wait.h>
>   #include <linux/sched.h>
>   #include <linux/completion.h>
> +#include <linux/dma-resv.h>
>   #include <uapi/linux/sched/types.h>
>   
>   #include <drm/drm_print.h>
> +#include <drm/drm_gem.h>
>   #include <drm/gpu_scheduler.h>
>   #include <drm/spsc_queue.h>
>   
> @@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>   
>   /**
>    * drm_sched_job_init - init a scheduler job
> - *
>    * @job: scheduler job to init
>    * @entity: scheduler entity to use
>    * @owner: job owner for debugging
> @@ -577,27 +578,28 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>    * Refer to drm_sched_entity_push_job() documentation
>    * for locking considerations.
>    *
> + * Drivers must make sure drm_sched_job_cleanup() if this function returns
> + * successfully, even when @job is aborted before drm_sched_job_arm() is called.
> + *
> + * WARNING: amdgpu abuses &drm_sched.ready to signal when the hardware
> + * has died, which can mean that there's no valid runqueue for a @entity.
> + * This function returns -ENOENT in this case (which probably should be -EIO as
> + * a more meanigful return value).
> + *
>    * Returns 0 for success, negative error code otherwise.
>    */
>   int drm_sched_job_init(struct drm_sched_job *job,
>   		       struct drm_sched_entity *entity,
>   		       void *owner)
>   {
> -	struct drm_gpu_scheduler *sched;
> -
>   	drm_sched_entity_select_rq(entity);
>   	if (!entity->rq)
>   		return -ENOENT;
>   
> -	sched = entity->rq->sched;
> -
> -	job->sched = sched;
>   	job->entity = entity;
> -	job->s_priority = entity->rq - sched->sched_rq;
> -	job->s_fence = drm_sched_fence_create(entity, owner);
> +	job->s_fence = drm_sched_fence_alloc(entity, owner);
>   	if (!job->s_fence)
>   		return -ENOMEM;
> -	job->id = atomic64_inc_return(&sched->job_id_count);
>   
>   	INIT_LIST_HEAD(&job->list);
>   
> @@ -606,13 +608,58 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   EXPORT_SYMBOL(drm_sched_job_init);
>   
>   /**
> - * drm_sched_job_cleanup - clean up scheduler job resources
> + * drm_sched_job_arm - arm a scheduler job for execution
> + * @job: scheduler job to arm
> + *
> + * This arms a scheduler job for execution. Specifically it initializes the
> + * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
> + * or other places that need to track the completion of this job.
> + *
> + * Refer to drm_sched_entity_push_job() documentation for locking
> + * considerations.
>    *
> + * This can only be called if drm_sched_job_init() succeeded.
> + */
> +void drm_sched_job_arm(struct drm_sched_job *job)
> +{
> +	struct drm_gpu_scheduler *sched;
> +	struct drm_sched_entity *entity = job->entity;
> +
> +	BUG_ON(!entity);
> +
> +	sched = entity->rq->sched;
> +
> +	job->sched = sched;
> +	job->s_priority = entity->rq - sched->sched_rq;
> +	job->id = atomic64_inc_return(&sched->job_id_count);
> +
> +	drm_sched_fence_init(job->s_fence, job->entity);
> +}
> +EXPORT_SYMBOL(drm_sched_job_arm);
> +
> +/**
> + * drm_sched_job_cleanup - clean up scheduler job resources
>    * @job: scheduler job to clean up
> + *
> + * Cleans up the resources allocated with drm_sched_job_init().
> + *
> + * Drivers should call this from their error unwind code if @job is aborted
> + * before drm_sched_job_arm() is called.
> + *
> + * After that point of no return @job is committed to be executed by the
> + * scheduler, and this function should be called from the
> + * &drm_sched_backend_ops.free_job callback.
>    */
>   void drm_sched_job_cleanup(struct drm_sched_job *job)
>   {
> -	dma_fence_put(&job->s_fence->finished);
> +	if (kref_read(&job->s_fence->finished.refcount)) {
> +		/* drm_sched_job_arm() has been called */
> +		dma_fence_put(&job->s_fence->finished);
> +	} else {
> +		/* aborted job before committing to run it */
> +		drm_sched_fence_free(&job->s_fence->finished.rcu);
> +	}
> +
>   	job->s_fence = NULL;
>   }
>   EXPORT_SYMBOL(drm_sched_job_cleanup);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 4eb354226972..5c3a99027ecd 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
>   	if (ret)
>   		return ret;
>   
> +	drm_sched_job_arm(&job->base);
> +
>   	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>   
>   	/* put by scheduler job completion */
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 88ae7f331bb1..83afc3aa8e2f 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>   int drm_sched_job_init(struct drm_sched_job *job,
>   		       struct drm_sched_entity *entity,
>   		       void *owner);
> +void drm_sched_job_arm(struct drm_sched_job *job);
>   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>   				    struct drm_gpu_scheduler **sched_list,
>                                      unsigned int num_sched_list);
> @@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>   				   enum drm_sched_priority priority);
>   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>   
> -struct drm_sched_fence *drm_sched_fence_create(
> +struct drm_sched_fence *drm_sched_fence_alloc(
>   	struct drm_sched_entity *s_entity, void *owner);
> +void drm_sched_fence_init(struct drm_sched_fence *fence,
> +			  struct drm_sched_entity *entity);
> +void drm_sched_fence_free(struct rcu_head *rcu);
> +
>   void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>   void drm_sched_fence_finished(struct drm_sched_fence *fence);
>   

