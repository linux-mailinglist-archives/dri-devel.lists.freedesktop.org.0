Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1073E15EF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 15:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9276E6EA64;
	Thu,  5 Aug 2021 13:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2067.outbound.protection.outlook.com [40.107.100.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAF46E82E;
 Thu,  5 Aug 2021 13:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vhbc5tUyPz8d8TTPDbux/T/M7SE1tzW/uqYsqc5LKZ7sgq2smpBt/daD82onUeoJPrUQvSusxllffiSnhzhPnf+A2lzrwTUpoICUf9l/YC9zZem5eFRTbfM6zzRCtSvh4WYJiSUz6tLCdZ2h//HT3aEgXYwr8B/ygO0K2ajPRmMgzMJfOOV9e6N5xplGEDfktqR8KZoH/kma2hDHZHzH5GMppe0hjQ/gRZuiVmOFPlYFBtj5Q6QQ1MA5CDCREZQ67PcvYiXna6uOcAjZGQ+xm3x3jWQlNSUssDgRWDBbEn8jtoCHTnpqOvljX9MtsnCClzeoaEMhOJIRTZNZUgFlpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nkWVs14lnh8n3K3Uo+qzB0RHI2zDtzXrGjDFQKV/5w=;
 b=gRhc5pgW2l3hmmGNIWtLrNTztPQ1fCLeslkCoRWzuxWv6Q1RXgtrsHbJgTulcLuKN4osKg51H+l3xsq+80b1t8ph4LjMZSoTRr1j6rJw3TiafBcp2brNj3d6oJU7RkEaK0qdGmzsl/bBiw26YKisfvLqqvvimi4M4tIsgglSJIHwkyahmnqExOpWoaHzsxB6Uvl5HJ1IfV6qNI/ukEOCs48GZGwOEwAtUGxDrLQBL9ZxKtpgSvqHPF+RxpSuu/aRXnzrhSKnyaLnf2lL3MVODDILWsQeoTAnaTslHft6dZvH2n/aQhU6ADMcCS5aEZVG3aIiKrAXboak6OcdEE02YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nkWVs14lnh8n3K3Uo+qzB0RHI2zDtzXrGjDFQKV/5w=;
 b=13l9GPkxEtLjb2FkSx8PxEr0s3VSRkT1gYzIsZRKWTyfaKUMJI1b/c82UVKawdeHeoXkeJATGCj4nAUE2qO9PakyYupMvKM/gaI67ty/oH2fwMaJb+6UbYxeFvr2sZ63yH4Y8mNI5y4zouExFgxupgGNF+I9zWNdV4f/3TiMbD4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4552.namprd12.prod.outlook.com (2603:10b6:208:24f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 13:43:58 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 13:43:58 +0000
Subject: Re: [PATCH v5 01/20] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Melissa Wen <melissa.srw@gmail.com>,
 Emma Anholt <emma@anholt.net>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Qiang Yu
 <yuq825@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
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
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-2-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7f7f839f-4944-32a5-2554-51131e7765a0@amd.com>
Date: Thu, 5 Aug 2021 15:43:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210805104705.862416-2-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0102.eurprd02.prod.outlook.com
 (2603:10a6:208:154::43) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ae89:49de:1628:3147]
 (2a02:908:1252:fb60:ae89:49de:1628:3147) by
 AM0PR02CA0102.eurprd02.prod.outlook.com (2603:10a6:208:154::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Thu, 5 Aug 2021 13:43:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0a47bb0-a0ab-491d-4eb8-08d95817136a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB45523691E9278E97B9F1C64983F29@MN2PR12MB4552.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mzfh4yeUZcgtYhAft6lUi7xpBTNN702YZ8u7/Fewukqhgh6HL41481eS2wJmxc6Gkq3ysM3N4TIVeizqZm0st3BzZ5F97FnTc1poAD6bQCsa+ObjLnpQvCAmAKd/akQW0TssKbuUpv2ztcVVbypmkNX2fZx/lLZnOYCgDQQi7VUW7oXk92rMNQbmrHyO8IkLQDNcbD5tEaPO0RjvGMdEJRhsorQrL9KrrB1Uc5G+UMb4PxltXaajssD+uyRK9GxJmKSG80QlRA2llrRKzT1kjkMHeRCxlTZTvvmK2iaioxtiyEXN05D9DV8aduJuixVLzQKr4tscIowbv3dUqqbVVzF4VBP441FIC3WrPPSArVFu3b6tAQRYmJnKPFp/DL9fG1Ohz4Guvq22gcJ/QMuyDGePuyXDbmadCG7paHaAODihsRvVpBwqLyh17G3AdRRQ6AfkGb51Xg5eqKJh6pKYTxTGx2SHVKBw32G0BS7JIgvvNv/8D7iIbooTolgFpoeFJTJgT3TMPF7ci3soa7HhzzgJuVPR0NSRu6a1QFrAFEPJkwqMxsmrAU5y1L+wI/1BhmO/hyoQ/6eGe6U55ZInwN5XqRijBRfAsE+k9CD7vohygk29//83d3p16glbozT5k9MjVtYT4/sqSFLhLYrG8GcwQoqKrw2DRyojiTSeP9s5KD3ePy0O8W43ooRDZYcualE5jOgjTydoeq1rl3d4JRlm32FAWZhuB3G4eKTWME8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(36756003)(38100700002)(7406005)(8676002)(31696002)(316002)(5660300002)(86362001)(66556008)(66476007)(30864003)(110136005)(54906003)(7416002)(2616005)(186003)(2906002)(8936002)(31686004)(6666004)(66574015)(6486002)(83380400001)(4326008)(66946007)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHlQOGdLWFFuUXljaFhsaVVJWUJ6UXUxY1NwSmk0eGJHVjRLdHJBQkRPc1p1?=
 =?utf-8?B?dTJGSVdCSXpjUkc3MVR2MXU2cUI0cGZhVzRBMjB4SDZXSXhRUCtOdVhodk5s?=
 =?utf-8?B?d3NGTFhZbERvdVYxNUtBa1VjdEdPejA4L1RpSmxuRUpPZ1JObVRlcHFlelhB?=
 =?utf-8?B?azJDYVVlV1hhZ2xKQi9aOFo2eGJZZlhOSk5VR2RWcUo5WmZ1Q25RWnp0dUhC?=
 =?utf-8?B?Mkl0bXdnQ2MzRmk0VWp5eUhoM2VVQXJLUEJnTHN4YWlqS2JlOTFScGJyUldW?=
 =?utf-8?B?amhHRTJHUlhtRzJCVGJBMkhPeFI1c1F5QUt0c1NJK005OW9zL2ZLTUJzL3NM?=
 =?utf-8?B?d1pRYUxKbURPTzU2SzlDUU5CcHdGQ2E5eE9nYjBuVWF5ZWVTSzYxdUVrSDFk?=
 =?utf-8?B?K2VKaWRtS3RWQ2lqeFk0UGZzMEtEVmRFV3VHV3IzeFJRaWI4bmhHcEF1REFZ?=
 =?utf-8?B?OHVkQmR0QlozTTZGbjJFUXNjU1NRZE1vcG9LcjBqNEFhZHBoT05xRGdKL1p4?=
 =?utf-8?B?SUFpbmd3bnpWU2lUaWFCanA5RHhqTkZFdjlKRDFQL3VpZTdUZ0p6ekU4QjQy?=
 =?utf-8?B?R3lHcTdrdktXT0pZeWcyclVCRWdvOVFtQ1dPNDBKdEYrUGZoTzNNVUJtS3Nj?=
 =?utf-8?B?RXRqL3ZhS2J2cW9IQjZpTFFrZ0pJaEhsU3U4Mkx1U0R4UktHMDJzdU51MmVy?=
 =?utf-8?B?SC85REhlcmFsYlF4WkRjcVFybnNqK1pSL1lSMkwydFNSZ0p4emQzQnFEZDZs?=
 =?utf-8?B?cFgvS3NIR1Y1MmZ1THdPVncrZVdsS1hHMTlIKzJyQVpaTUw0MDlnYnB2RkYv?=
 =?utf-8?B?TEpGQ2NyMVFPUnl2emtTRW4xaW1tTVMycXcvRWJtNXB5NlNFcktuT25Ic2h5?=
 =?utf-8?B?OG9EUjY5L0ZOWWd0UHpIdmtBd3JCWVd4bzRQVzhRQU9lNEE5S2s5TldDeE1s?=
 =?utf-8?B?WTZkNmE0T1M1MXdKUjE2UTNOWEtSZ3pVM3RSWGdLeUtFaThPMzlyNUhNamFR?=
 =?utf-8?B?OG43YVNscVVoSG5aUTE1bEtGZmVQNGFJMFdKbHJBemNQVFZGOEpJTHRGMjZ6?=
 =?utf-8?B?b1poeW81TWEvM2k2L0FRQ0k0aE41VUtuOUh0YS9nTE9uZTExUm9WeitJbDlF?=
 =?utf-8?B?MTVMYnFsYVBSNEZPVHlPUzVXWGU3WHRqVE54b2JTV0JyTi9wS1Bzd0k5WGtu?=
 =?utf-8?B?MHRXYWlQY0NPV2xZV1IycVppZG85VlFQSXJZSUJUVWd1YWhGRVQzc203WVdI?=
 =?utf-8?B?UXVTZ0ljdlVCckhoYkV5aGFkTUUybjRPOXI0a3NBUWFLMFh1bVB3TlJlYUxz?=
 =?utf-8?B?SmhiVER6YURhYU1qN1F0eVpkbHdCOWdvVm5Udk03Q2J4cVVhWUc5ZkdaT0lU?=
 =?utf-8?B?VTZWUnRSZ3J6dXMveEhBdzU1UHBNYUFybzc0SXRzWk83VFFWVFlnY1lOU2dt?=
 =?utf-8?B?SEVFL1JZYnpYbWFBYnh1Y3o2cVBSWmt4SHNwQjVBY1VDUmEzM0xETTN5YXNN?=
 =?utf-8?B?LzdGc28rbDFacFFGd0tBQ0Y4aDByMDhzUGVERTM3dWNnU2xObStjU0s3RW56?=
 =?utf-8?B?VkY4RVBBRHEvQ2FvLytacUlleGoycDZtOHRNZWxJMVpQQkVEZ0drZVpXYkJx?=
 =?utf-8?B?M292eC9UanpDUTk5RUFwUHExekJGSzdlVHpVMXdibSt4MnFRWlVYU2FDYzlE?=
 =?utf-8?B?bHNTQVhsYloxVVhQWWpWVkRYVUFobDBsK1c2T1g2STJjRS9sRVB0V1J3ZVVO?=
 =?utf-8?B?UkdFVWpNcEJKNnFJdnhkYTQxY3lsRzMxQVJXbStWVUJYaVR4b1RWSjRMUVd5?=
 =?utf-8?B?bEp0VCtyOHhKOEhVZEhWWU5JaFNQczBMeFJzSEQxUThxQktUTUlmUUFkTzRZ?=
 =?utf-8?Q?K9pdLGHjep8Ja?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a47bb0-a0ab-491d-4eb8-08d95817136a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 13:43:58.6200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2EEGVABI/wRioeLuLc6DfDd2YUaTSsuLzxl6MphlKq9qA2kjHY/yDoubilccVqO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4552
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

Am 05.08.21 um 12:46 schrieb Daniel Vetter:
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
>
>    Shuffle things to fit between job_init and job_arm.
>
> v5:
> Reshuffle the split between init/arm once more, amdgpu abuses
> drm_sched.ready to signal gpu reset failures. Also document this
> somewhat. (Christian)
>
> v6:
> Rebase on top of the msm drm/sched support. Note that the
> drm_sched_job_init() call is completely misplaced, and hence also the
> split-out drm_sched_entity_push_job(). I've put in a FIXME which the next
> patch will address.
>
> Acked-by: Melissa Wen <mwen@igalia.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Acked-by: Emma Anholt <emma@anholt.net>
> Acked-by: Steven Price <steven.price@arm.com> (v2)
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> (v5)
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

At least the amdgpu parts look ok of hand, but I can't judge the rest I 
think.

So only Acked-by: Christian König <christian.koenig@amd.com>

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
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 +
>   drivers/gpu/drm/lima/lima_sched.c        |  2 +
>   drivers/gpu/drm/msm/msm_gem_submit.c     |  3 ++
>   drivers/gpu/drm/panfrost/panfrost_job.c  |  2 +
>   drivers/gpu/drm/scheduler/sched_entity.c |  6 +--
>   drivers/gpu/drm/scheduler/sched_fence.c  | 19 ++++---
>   drivers/gpu/drm/scheduler/sched_main.c   | 69 ++++++++++++++++++++----
>   drivers/gpu/drm/v3d/v3d_gem.c            |  2 +
>   include/drm/gpu_scheduler.h              |  7 ++-
>   11 files changed, 94 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 139cd3bf1ad6..32e80bc6af22 100644
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
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index fdc5367aecaa..6d6c44f0e1f3 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -52,6 +52,9 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>   		return ERR_PTR(ret);
>   	}
>   
> +	/* FIXME: this is way too early */
> +	drm_sched_job_arm(&job->base);
> +
>   	xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
>   
>   	kref_init(&submit->ref);
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
> index 5689da118197..2e808097b4d1 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -480,6 +480,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
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

