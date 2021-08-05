Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 955A63E1749
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 16:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4716C6EABB;
	Thu,  5 Aug 2021 14:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5737B6EA91;
 Thu,  5 Aug 2021 14:47:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXwRqqgiyaNAMHPexQJbaNPnVyVTHt/0StW1BwCI+B+SXph8ez2Va+JPxWw+Yh3r84JwzK2k/VmUBDRSGcs8pPMUHloIZsPv9w1vnqxm0dPapHPHlw1/hcL7JrEKQA6TJgcg5U4M2Wj0fnsIfBpdmb7oGH7DVsTQ4m5OczpjTmhm88ac/f8l5CwyRvNe549+/6HakKH5jVgVUU57h1s3U7ywRaE7vn1ORTBbKc3bXcKENY9qrUnSUWVId0QTG9k6vmNoklfNld9ahWATtZaIhYqF2jkLm99nkDkJ9YBZ6anNkqN6xDSpXYObNsW9rP2e1oZBAnrTbLv0TG/v3ozBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3x71JxOpCl1H/UOi4wCT/sv0g0L8da5PA0hP1Egl58=;
 b=F/hnZ4Em0LImHWZqDdzqtSlF1t7Pg2JB2WJ60VQl6+d0/hmp38ULNpPGe/A2oxdSnQFET7WAsks/znVjLwXZSRGJdwV9gongqVU2eqzBaTOk1I68NPGWj5ce1AqOYKz6u+19FFbzAXLW8TuNBLS4K0UifF+HlXIAjyja7LrgOgl1UZltsh3MxuAoqfyJpMmnSCw4xYXVbGxIHb+x/XDERU0vj1EMz9oWEgHNakH+2FRM1X1uXWQQWx0/AWWebiq9F3w4lgCXWmuO2h15E5IasrnQbtqH5E8BOf9lDrrWY/NaOyTZG1i6fiV2dmEDJPZ8QVtAKfLAnedMu5wUnK5OyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3x71JxOpCl1H/UOi4wCT/sv0g0L8da5PA0hP1Egl58=;
 b=Zdm30DexrMDPZXdbPInaMQoqjKiEJTm8LUOrw/nEjljfgtybUbC7Cr89e/r83dmlwNyTAc02ybFTtohhdGb2It9EWV+aZkq2FenWlY57p1Kfdsn4GfBG26+mfiuYbxrI6ofQmhttXqgzpxc2qpV6ZuCELnL6+vG2OGEdlM4hpik=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4900.namprd12.prod.outlook.com (2603:10b6:208:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 14:47:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 14:47:50 +0000
Subject: Re: [PATCH v5 01/20] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Melissa Wen <melissa.srw@gmail.com>,
 Emma Anholt <emma@anholt.net>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Qiang Yu
 <yuq825@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Sumit Semwal <sumit.semwal@linaro.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>,
 Adam Borowski <kilobyte@angband.pl>, Nick Terrell <terrelln@fb.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Sami Tolvanen
 <samitolvanen@google.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Nirmoy Das <nirmoy.das@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Kevin Wang <kevin1.wang@amd.com>,
 Chen Li <chenli@uniontech.com>, Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Dennis Li <Dennis.Li@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Sonny Jiang <sonny.jiang@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 lima@lists.freedesktop.org,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-2-daniel.vetter@ffwll.ch>
 <7f7f839f-4944-32a5-2554-51131e7765a0@amd.com>
 <CAKMK7uGEjO16mFcUWbzXHybvSBWcye9eJgVsX7A6QjSHQeM0yw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <04699641-1db2-5e85-5ac4-ffb7cdf868ee@amd.com>
Date: Thu, 5 Aug 2021 16:47:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uGEjO16mFcUWbzXHybvSBWcye9eJgVsX7A6QjSHQeM0yw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0080.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7d20:f87c:d48e:1022]
 (2a02:908:1252:fb60:7d20:f87c:d48e:1022) by
 PR0P264CA0080.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Thu, 5 Aug 2021 14:47:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2846bc8c-20f7-4f3e-3054-08d9581ffef7
X-MS-TrafficTypeDiagnostic: BL0PR12MB4900:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4900ABAD89D63BE26689AD3283F29@BL0PR12MB4900.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hen/wrxpw2wnvAhje6fYUkIrS2+Y8ZTSTsu/oin+G+K6EvTPJpuhypHUrSClPJEgy1kzDAFXmpbfZKsdaNgtW6ij/jvBuIPJldSSBQ7EntOfT4fS/vE+9NisJm+LAMKVAMzXPf7XgDjW1j2GAfM+OwP2d32Sjt4RNzCaiAt8o467+sO/GSLeZpPWoK4tzCkkKAGP7ESzrYxLCCt/wUHtLTcG1oNLYBpVuaU3fxiELa7LNUWO5jNU9QFLxWQgeotWGkhzB5V3PAd5L4Jz34uhfI7aXQpByyy3Fo1WNYhAbFgdzmA0t6TvgGJqoEjWzBXueKHS098w3cZDpGGvmSwvVTB+IneEyfpJURnBRlFz2BuGgr4QGqoqQnvYLNCdzwDZEDN5Om+4iU98f8Z0HG9cg1PfflNvZE3OSJQlZGYb2DUc9Ujqr9K06AB8AbNqjMK5pERqPOw7jSoOCqgwX5sgjibNeQJkwulqc+aSb7UBOPdDG/eQik///82PyQHLLfmlSW7NKf8Ao2R98mBleRma55NL1J9kX/mTfuXULp1XtQ3ENNUOCeZ8hBPlWBVu6OFa/ibI1eLVxtx0zUHnVKaKLNMJs+rJTzBLRjTQnxaCUG+0j3CbzF8htvc18705KMlk34TUaJ456UWxM77bu0MbfSYD1ljbVTSrfCZ5bBlYmDEIN4eFPWehA2iXF+KJjk0LqH/B1JlSJIXMMKN6IcU9InfyPzk5/DNlV6lSMwm66zE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(38100700002)(54906003)(66574015)(66946007)(66556008)(66476007)(31686004)(7406005)(5660300002)(2616005)(6486002)(7416002)(316002)(53546011)(4326008)(6916009)(186003)(31696002)(83380400001)(30864003)(2906002)(8936002)(6666004)(36756003)(478600001)(8676002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXQyeFJiR2xrMnJ1TzNpc09FT3NXVWtuQ2dBTWk0VWFxdk02K3FxejlUSHEw?=
 =?utf-8?B?TVhtU2hUUlpDTWZRek13bXhuMEthaVk5Q3VjMkozQm9iQmZGbHk1eWx6a2Mr?=
 =?utf-8?B?QkpIN1FIcGkzeHRIMmJiUWl1QmpOTmJwZkNkMGpPL2xWV1d4a21xMUFrSlcv?=
 =?utf-8?B?eitINGJXTTlMTVdQYXE0Z3N6Z0JFSmxHSkJoSTB0MGNaSm4wa25taXdTOFM3?=
 =?utf-8?B?bjZieVJ6YXZxWEdzVnhZMjJyaVA2WVpFTTkwOXdJUi8za1lhS1hVdmRuVzNN?=
 =?utf-8?B?a29MVndyMDNVVS90SVh3UG8wVWxHWXBkRmxTbHN3NVNibURkVXczTk1WYkU5?=
 =?utf-8?B?Q2ZVUXUyZDhVVEJkNXc0Zk84aUh5eHhKbDV6UHV6L1oyV1ZpYWZRTzVsMFpn?=
 =?utf-8?B?YTNyaTNZbEV5MWVlcEtOdFBWVWtZRTFSMWdJMmI4L0UxOWU3RVFWbzV1cUhX?=
 =?utf-8?B?SW94UlA5ZCs3MjlrYkZROXJtZkFreGYyYk1sbGcwUmdlR2FQSXh0eFFDcDJD?=
 =?utf-8?B?cVNXTFYyT0Uxajc5R1RPeGdHd1BVTnVJNU9saDdtcHFhWEtsRFFDbjVWQXBo?=
 =?utf-8?B?VjVLMGZGSmdITFNyR3NOZFJTTkpReklsakJoMVF2WllINGlBODh1NzJBYzQ0?=
 =?utf-8?B?OFdYdHloSGduU0taYXNIbXU4TjkvSzlkMmN6c1Q5c21zb1lHWHhRQUgrT1pw?=
 =?utf-8?B?ZlV1STdoVE44L0NZLy9BNWIxSitDdlVCVElIbXd6SXo5aU94NkcyelhqZVlv?=
 =?utf-8?B?cE1DdXVac1puRUZMd2ROdUR6aVdsQ0tpY0loUitlQkszQ3RObXlKZlEvL2Vt?=
 =?utf-8?B?VGFjWGprSGs4dG93ZlVXS0Q4YVhQMjlGTHRWNWZETllscFV6bE8zT1c3VVVu?=
 =?utf-8?B?WnJhdFRnRkNsUzJsbG1mS2lSenVuTlhZRFRnSGZVcE5CMjQxeDVNdzVhY1N5?=
 =?utf-8?B?OTgwbDFYYmVWSEREK1U0cTl5aUtyU3RBREVyOUpIU0JGTDhialZ4czA1OUk5?=
 =?utf-8?B?aW5SQ1MxOG5nL0hpSGNWblVBZjRBVnFyRFlGZTF5UjZ2SDRJZzdUcHV0bWNu?=
 =?utf-8?B?RW1sSzN5UER0MUYzS0hINE1wY2UvcE1CaVYxaGs0TFVOWVRwTXppNERSaTdC?=
 =?utf-8?B?UUJpMkRtaEhxeEhPNFRxbWVVZ01oVmxqVTY0NktwaHd6dzdaZEhuWWF1RVho?=
 =?utf-8?B?WkFmSWVkNG9ZWmRCekg0NzNvbzVXcjJEUFZTYW9Wakg5aGxORCtvaFUzcGJV?=
 =?utf-8?B?b29TVFJKaHRWUENPMVFNODhjUHNici9VNFVReVRtYU5naXR1UmYxcDE1RGdr?=
 =?utf-8?B?dEo3NTkxOEdDZW5mdXZpRnhFRVVsbkxKWWhKQ3B0cVpzTlpTUENheDJQL3Ny?=
 =?utf-8?B?MzVDSG0yb0JRNXFkU3BWaThFL01hVW0rOUFuYmI1Y1lnQXY1N0E5My83ZXZu?=
 =?utf-8?B?TktyeHVYckFEc0o1LzF3VXNPM010MzhUMm1tODJ3WXVXV1AwVThkblpRRDZ2?=
 =?utf-8?B?LzFPdnVrY1k0a3FQRmRENU84TnZqMFlMU01TVkJDam5ab0FSTDliSDBCWVJu?=
 =?utf-8?B?RTlnYW9rZzhvaUdiWG0zTzZ2SXNadHMyTzRUNHlLWDFJdjdDRzdjbndRdXhD?=
 =?utf-8?B?SkkxaUZVekR0MzFFbVZuS21rTGJJWlYxeGJESVpPcEpMK0tMNjduZlplc1hD?=
 =?utf-8?B?dzZGamZkRDIxeGowV3RBNFBqbW5jU3c0Zjc1NVFwQTBiZmNBeDhicWErTUdE?=
 =?utf-8?B?bVlJbWxWdStmdG9yZHpiZ2dZTzNGSmhNWDJJNUhHQkNjL0pnRWYwVzY3alB4?=
 =?utf-8?B?QmRJOGUzdmZObkZDYnFSeGllTVpxd0h6M1JZOFhOeElkT3g1QnRUb0QvekN4?=
 =?utf-8?Q?GjzEnqSpiv7G3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2846bc8c-20f7-4f3e-3054-08d9581ffef7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 14:47:49.9256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DsdStyeCha92AdLCVlGwHsmgQnJwOOS1oaDNbyJsPsTjWSzIQOpc5yvYX4CL1DJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4900
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.08.21 um 16:07 schrieb Daniel Vetter:
> On Thu, Aug 5, 2021 at 3:44 PM Christian König <christian.koenig@amd.com> wrote:
>> Am 05.08.21 um 12:46 schrieb Daniel Vetter:
>>> This is a very confusingly named function, because not just does it
>>> init an object, it arms it and provides a point of no return for
>>> pushing a job into the scheduler. It would be nice if that's a bit
>>> clearer in the interface.
>>>
>>> But the real reason is that I want to push the dependency tracking
>>> helpers into the scheduler code, and that means drm_sched_job_init
>>> must be called a lot earlier, without arming the job.
>>>
>>> v2:
>>> - don't change .gitignore (Steven)
>>> - don't forget v3d (Emma)
>>>
>>> v3: Emma noticed that I leak the memory allocated in
>>> drm_sched_job_init if we bail out before the point of no return in
>>> subsequent driver patches. To be able to fix this change
>>> drm_sched_job_cleanup() so it can handle being called both before and
>>> after drm_sched_job_arm().
>>>
>>> Also improve the kerneldoc for this.
>>>
>>> v4:
>>> - Fix the drm_sched_job_cleanup logic, I inverted the booleans, as
>>>     usual (Melissa)
>>>
>>> - Christian pointed out that drm_sched_entity_select_rq() also needs
>>>     to be moved into drm_sched_job_arm, which made me realize that the
>>>     job->id definitely needs to be moved too.
>>>
>>>     Shuffle things to fit between job_init and job_arm.
>>>
>>> v5:
>>> Reshuffle the split between init/arm once more, amdgpu abuses
>>> drm_sched.ready to signal gpu reset failures. Also document this
>>> somewhat. (Christian)
>>>
>>> v6:
>>> Rebase on top of the msm drm/sched support. Note that the
>>> drm_sched_job_init() call is completely misplaced, and hence also the
>>> split-out drm_sched_entity_push_job(). I've put in a FIXME which the next
>>> patch will address.
>>>
>>> Acked-by: Melissa Wen <mwen@igalia.com>
>>> Cc: Melissa Wen <melissa.srw@gmail.com>
>>> Acked-by: Emma Anholt <emma@anholt.net>
>>> Acked-by: Steven Price <steven.price@arm.com> (v2)
>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> (v5)
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> At least the amdgpu parts look ok of hand, but I can't judge the rest I
>> think.
> The thing that really scares me here and that I got wrong a few times
> is the cleanup for drm_sched_job at the various points. Can you give
> those parts in drm/scheduler/ a full review pls, just to make sure? I
> can note that in the tag ofc, just like a bit more confidence here
> that it's not busted :-)

I can take another look, but I won't have time for that in the next two 
weeks - vacation and kid starting school.

Christian.

>
>> So only Acked-by: Christian König <christian.koenig@amd.com>
> Thanks, Daniel
>
>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>>> Cc: Qiang Yu <yuq825@gmail.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>> Cc: Steven Price <steven.price@arm.com>
>>> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>> Cc: Kees Cook <keescook@chromium.org>
>>> Cc: Adam Borowski <kilobyte@angband.pl>
>>> Cc: Nick Terrell <terrelln@fb.com>
>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
>>> Cc: Sami Tolvanen <samitolvanen@google.com>
>>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Nirmoy Das <nirmoy.das@amd.com>
>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
>>> Cc: Lee Jones <lee.jones@linaro.org>
>>> Cc: Kevin Wang <kevin1.wang@amd.com>
>>> Cc: Chen Li <chenli@uniontech.com>
>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>> Cc: "Marek Olšák" <marek.olsak@amd.com>
>>> Cc: Dennis Li <Dennis.Li@amd.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Cc: Sonny Jiang <sonny.jiang@amd.com>
>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>> Cc: Tian Tao <tiantao6@hisilicon.com>
>>> Cc: etnaviv@lists.freedesktop.org
>>> Cc: lima@lists.freedesktop.org
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> Cc: Emma Anholt <emma@anholt.net>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Cc: Sean Paul <sean@poorly.run>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: freedreno@lists.freedesktop.org
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +
>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 +
>>>    drivers/gpu/drm/lima/lima_sched.c        |  2 +
>>>    drivers/gpu/drm/msm/msm_gem_submit.c     |  3 ++
>>>    drivers/gpu/drm/panfrost/panfrost_job.c  |  2 +
>>>    drivers/gpu/drm/scheduler/sched_entity.c |  6 +--
>>>    drivers/gpu/drm/scheduler/sched_fence.c  | 19 ++++---
>>>    drivers/gpu/drm/scheduler/sched_main.c   | 69 ++++++++++++++++++++----
>>>    drivers/gpu/drm/v3d/v3d_gem.c            |  2 +
>>>    include/drm/gpu_scheduler.h              |  7 ++-
>>>    11 files changed, 94 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index 139cd3bf1ad6..32e80bc6af22 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>>        if (r)
>>>                goto error_unlock;
>>>
>>> +     drm_sched_job_arm(&job->base);
>>> +
>>>        /* No memory allocation is allowed while holding the notifier lock.
>>>         * The lock is held until amdgpu_cs_submit is finished and fence is
>>>         * added to BOs.
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index d33e6d97cc89..5ddb955d2315 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
>>>        if (r)
>>>                return r;
>>>
>>> +     drm_sched_job_arm(&job->base);
>>> +
>>>        *f = dma_fence_get(&job->base.s_fence->finished);
>>>        amdgpu_job_free_resources(job);
>>>        drm_sched_entity_push_job(&job->base, entity);
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> index feb6da1b6ceb..05f412204118 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>>>        if (ret)
>>>                goto out_unlock;
>>>
>>> +     drm_sched_job_arm(&submit->sched_job);
>>> +
>>>        submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
>>>        submit->out_fence_id = idr_alloc_cyclic(&submit->gpu->fence_idr,
>>>                                                submit->out_fence, 0,
>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>> index dba8329937a3..38f755580507 100644
>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
>>>                return err;
>>>        }
>>>
>>> +     drm_sched_job_arm(&task->base);
>>> +
>>>        task->num_bos = num_bos;
>>>        task->vm = lima_vm_get(vm);
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> index fdc5367aecaa..6d6c44f0e1f3 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> @@ -52,6 +52,9 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>>>                return ERR_PTR(ret);
>>>        }
>>>
>>> +     /* FIXME: this is way too early */
>>> +     drm_sched_job_arm(&job->base);
>>> +
>>>        xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
>>>
>>>        kref_init(&submit->ref);
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> index 71a72fb50e6b..2992dc85325f 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> @@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_job *job)
>>>                goto unlock;
>>>        }
>>>
>>> +     drm_sched_job_arm(&job->base);
>>> +
>>>        job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>
>>>        ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 79554aa4dbb1..f7347c284886 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>     * @sched_job: job to submit
>>>     * @entity: scheduler entity
>>>     *
>>> - * Note: To guarantee that the order of insertion to queue matches
>>> - * the job's fence sequence number this function should be
>>> - * called with drm_sched_job_init under common lock.
>>> + * Note: To guarantee that the order of insertion to queue matches the job's
>>> + * fence sequence number this function should be called with drm_sched_job_arm()
>>> + * under common lock.
>>>     *
>>>     * Returns 0 for success, negative error code otherwise.
>>>     */
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index 69de2c76731f..bcea035cf4c6 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>>>     *
>>>     * Free up the fence memory after the RCU grace period.
>>>     */
>>> -static void drm_sched_fence_free(struct rcu_head *rcu)
>>> +void drm_sched_fence_free(struct rcu_head *rcu)
>>>    {
>>>        struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>>>        struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>> @@ -152,27 +152,32 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>    }
>>>    EXPORT_SYMBOL(to_drm_sched_fence);
>>>
>>> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>> -                                            void *owner)
>>> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>> +                                           void *owner)
>>>    {
>>>        struct drm_sched_fence *fence = NULL;
>>> -     unsigned seq;
>>>
>>>        fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>>>        if (fence == NULL)
>>>                return NULL;
>>>
>>>        fence->owner = owner;
>>> -     fence->sched = entity->rq->sched;
>>>        spin_lock_init(&fence->lock);
>>>
>>> +     return fence;
>>> +}
>>> +
>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>> +                       struct drm_sched_entity *entity)
>>> +{
>>> +     unsigned seq;
>>> +
>>> +     fence->sched = entity->rq->sched;
>>>        seq = atomic_inc_return(&entity->fence_seq);
>>>        dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>                       &fence->lock, entity->fence_context, seq);
>>>        dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>>                       &fence->lock, entity->fence_context + 1, seq);
>>> -
>>> -     return fence;
>>>    }
>>>
>>>    module_init(drm_sched_fence_slab_init);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 33c414d55fab..454cb6164bdc 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -48,9 +48,11 @@
>>>    #include <linux/wait.h>
>>>    #include <linux/sched.h>
>>>    #include <linux/completion.h>
>>> +#include <linux/dma-resv.h>
>>>    #include <uapi/linux/sched/types.h>
>>>
>>>    #include <drm/drm_print.h>
>>> +#include <drm/drm_gem.h>
>>>    #include <drm/gpu_scheduler.h>
>>>    #include <drm/spsc_queue.h>
>>>
>>> @@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>
>>>    /**
>>>     * drm_sched_job_init - init a scheduler job
>>> - *
>>>     * @job: scheduler job to init
>>>     * @entity: scheduler entity to use
>>>     * @owner: job owner for debugging
>>> @@ -577,27 +578,28 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>     * Refer to drm_sched_entity_push_job() documentation
>>>     * for locking considerations.
>>>     *
>>> + * Drivers must make sure drm_sched_job_cleanup() if this function returns
>>> + * successfully, even when @job is aborted before drm_sched_job_arm() is called.
>>> + *
>>> + * WARNING: amdgpu abuses &drm_sched.ready to signal when the hardware
>>> + * has died, which can mean that there's no valid runqueue for a @entity.
>>> + * This function returns -ENOENT in this case (which probably should be -EIO as
>>> + * a more meanigful return value).
>>> + *
>>>     * Returns 0 for success, negative error code otherwise.
>>>     */
>>>    int drm_sched_job_init(struct drm_sched_job *job,
>>>                       struct drm_sched_entity *entity,
>>>                       void *owner)
>>>    {
>>> -     struct drm_gpu_scheduler *sched;
>>> -
>>>        drm_sched_entity_select_rq(entity);
>>>        if (!entity->rq)
>>>                return -ENOENT;
>>>
>>> -     sched = entity->rq->sched;
>>> -
>>> -     job->sched = sched;
>>>        job->entity = entity;
>>> -     job->s_priority = entity->rq - sched->sched_rq;
>>> -     job->s_fence = drm_sched_fence_create(entity, owner);
>>> +     job->s_fence = drm_sched_fence_alloc(entity, owner);
>>>        if (!job->s_fence)
>>>                return -ENOMEM;
>>> -     job->id = atomic64_inc_return(&sched->job_id_count);
>>>
>>>        INIT_LIST_HEAD(&job->list);
>>>
>>> @@ -606,13 +608,58 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>    EXPORT_SYMBOL(drm_sched_job_init);
>>>
>>>    /**
>>> - * drm_sched_job_cleanup - clean up scheduler job resources
>>> + * drm_sched_job_arm - arm a scheduler job for execution
>>> + * @job: scheduler job to arm
>>> + *
>>> + * This arms a scheduler job for execution. Specifically it initializes the
>>> + * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
>>> + * or other places that need to track the completion of this job.
>>> + *
>>> + * Refer to drm_sched_entity_push_job() documentation for locking
>>> + * considerations.
>>>     *
>>> + * This can only be called if drm_sched_job_init() succeeded.
>>> + */
>>> +void drm_sched_job_arm(struct drm_sched_job *job)
>>> +{
>>> +     struct drm_gpu_scheduler *sched;
>>> +     struct drm_sched_entity *entity = job->entity;
>>> +
>>> +     BUG_ON(!entity);
>>> +
>>> +     sched = entity->rq->sched;
>>> +
>>> +     job->sched = sched;
>>> +     job->s_priority = entity->rq - sched->sched_rq;
>>> +     job->id = atomic64_inc_return(&sched->job_id_count);
>>> +
>>> +     drm_sched_fence_init(job->s_fence, job->entity);
>>> +}
>>> +EXPORT_SYMBOL(drm_sched_job_arm);
>>> +
>>> +/**
>>> + * drm_sched_job_cleanup - clean up scheduler job resources
>>>     * @job: scheduler job to clean up
>>> + *
>>> + * Cleans up the resources allocated with drm_sched_job_init().
>>> + *
>>> + * Drivers should call this from their error unwind code if @job is aborted
>>> + * before drm_sched_job_arm() is called.
>>> + *
>>> + * After that point of no return @job is committed to be executed by the
>>> + * scheduler, and this function should be called from the
>>> + * &drm_sched_backend_ops.free_job callback.
>>>     */
>>>    void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>    {
>>> -     dma_fence_put(&job->s_fence->finished);
>>> +     if (kref_read(&job->s_fence->finished.refcount)) {
>>> +             /* drm_sched_job_arm() has been called */
>>> +             dma_fence_put(&job->s_fence->finished);
>>> +     } else {
>>> +             /* aborted job before committing to run it */
>>> +             drm_sched_fence_free(&job->s_fence->finished.rcu);
>>> +     }
>>> +
>>>        job->s_fence = NULL;
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_job_cleanup);
>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>>> index 5689da118197..2e808097b4d1 100644
>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>>> @@ -480,6 +480,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
>>>        if (ret)
>>>                return ret;
>>>
>>> +     drm_sched_job_arm(&job->base);
>>> +
>>>        job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>
>>>        /* put by scheduler job completion */
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 88ae7f331bb1..83afc3aa8e2f 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>>    int drm_sched_job_init(struct drm_sched_job *job,
>>>                       struct drm_sched_entity *entity,
>>>                       void *owner);
>>> +void drm_sched_job_arm(struct drm_sched_job *job);
>>>    void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>                                    struct drm_gpu_scheduler **sched_list,
>>>                                       unsigned int num_sched_list);
>>> @@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>>                                   enum drm_sched_priority priority);
>>>    bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>>
>>> -struct drm_sched_fence *drm_sched_fence_create(
>>> +struct drm_sched_fence *drm_sched_fence_alloc(
>>>        struct drm_sched_entity *s_entity, void *owner);
>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>> +                       struct drm_sched_entity *entity);
>>> +void drm_sched_fence_free(struct rcu_head *rcu);
>>> +
>>>    void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>>>    void drm_sched_fence_finished(struct drm_sched_fence *fence);
>>>
>

