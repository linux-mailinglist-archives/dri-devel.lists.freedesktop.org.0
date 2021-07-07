Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 032BB3BE5A2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861E86E868;
	Wed,  7 Jul 2021 09:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2058.outbound.protection.outlook.com [40.107.102.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD866E868;
 Wed,  7 Jul 2021 09:30:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sv8ZVQyvzrAoHKfPWrvHssd2A4ZoX4c2kgp6dWFRwBvUMZNc/CGLMMa85QBo4TwwfpKwAU85z9mtMHP2dIDax0p0cSw9uSBOH9Dwd96LDM1Qtvp6A7MT0Q8ysUUOGciHnTumSCTu/Nb2GAJiuHJ78PlRkU2hE3A7XmyITFQr7haym1gDqBiuZuddItRYF6/oA3V4VMjc6JPusNUnXrz7FXBrVKc7PsxM3zXAkVwUoDUAxTZ6IRNCNQiTcJqCQTnWfNUmjS+ACX0CcZ/S44HA6kalCp3aIlUKpMWB9+vPzs4N/BdqFV/BdQFETmwXLUKK40refbdQP3Lr0hAZQnJKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMiMPRQmeDFWDaoO7gkXhSwnwg7FljzqiwfAZucbAcY=;
 b=d4HpdC9XE7EIU4M+GrTjGbTD/eg6v8DpKs0fQV2L4cBAYrTRgGuEDXWhZYtD1mA7vTKJTwpg/ILgG4yEoH3U3LnqbUYzvX93FkV75Fi6ItBYkXKFoPr+Ce2+cOVXQtnTG9xAH/FNJWNNJZvOoLoo+/EkkYDEEMnz+o2tA/m9zh6U3sD4OF/JhvWjZcXP650bvGkjfVSHi4oJj5dU7BUc+DYOwq/7aGQQyWoaSu+O9XXd1wXFrnHknYgHySfgjPe6bC3z77pY/i/NFfZPo2p3POyWgZ7l9ImmO/UE9Byfr9fPUiR8U3CetbGqlL6k99wEQoR6qw0JMgHaJeWY5djMsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMiMPRQmeDFWDaoO7gkXhSwnwg7FljzqiwfAZucbAcY=;
 b=ktuLopHd6Rv41ihokKPh3SBoYeoZt1v4tevka5RUkhwv5ImzZK3dJhB9EneoN9WMKfSP6ToVETo4J9k3jeiRnrONGq997LIaXkG+RNx/waETWBG/2P5zoND9p+5WsTgV3U6FuibdNQynvHjWEyvlFiQgsthGbySrxAcemDpBdsI=
Authentication-Results: anholt.net; dkim=none (message not signed)
 header.d=none;anholt.net; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4897.namprd12.prod.outlook.com (2603:10b6:208:17e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 09:30:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 09:30:07 +0000
Subject: Re: [PATCH v2 01/11] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
 <20210702213815.2249499-2-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a5c5647e-e0ce-cc6d-c473-685679739051@amd.com>
Date: Wed, 7 Jul 2021 11:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210702213815.2249499-2-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7671:3328:2129:96b5]
 (2a02:908:1252:fb60:7671:3328:2129:96b5) by
 PR3P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Wed, 7 Jul 2021 09:30:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9082dc9-16f2-41d7-c829-08d94129cf1b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4897:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4897400B418EFC8CCB970FC9831A9@BL0PR12MB4897.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6FHedZPyEnh04J2GQN9fOtdI/jtmMrhyQsh6qzKsvPLwYxNa31mCc2GhbOp6KuXb1EcOPi1H5NF5Zdw4IFmbTQ9Dp/IY4+9FiqQq2kcRfNHUgoG79E8P1Mv75YwfBuhEprwc1V6xW74BLFCeIiPCsfdW/WZa9+hh06k1eFgf0kHVC0JYyYi+BOYchKvx/zHRuZKW8zqZi/HyeLTJN3SuTXxkBdlKsVOcYZ4puVq5yX5B/mjVEpHmHC6q2SsOU9X9u/EIOZbrTcfk5wkcB5IB78G/oHDKgB08E9si9KOoRh9RtYQ7IA8ZBFKDjrFAtqyNyhmIY+F1WjDXVF5qcEINvMtAmS9TWgNhOdwEQ4Kf2qmKtBROB83O/6Xe1uMhw/lW0bWdADpiVMVuh7AKZ1Lu/vftvfFMtKyd6hdL1vo05NwEn+hl1iK3UP7MUCRZS9oiOxImFtjyxV7C5z3gwS/6EDNeROOxyzy4QgbhFxXLxEkcAsV+pwHgZ4qu78AB6/Hfp4E/1f6s/3M86CAuZY6mq081L/Ww2hFpJi5WeS04RMZN88N2NaR9FSuI/jBX/zRX5RW8sQll0XmzLLBqQjsRpqfus6tZrP+HW4iz0ID7aCU9drFqDFCpfe1YGHjPL/6IJmR+uqVtefWi+rsuDkmbeGKAoOC5I0rU3F+1TI+yeeAZ4JwDac6e9O3ee3SlPfk3jQQBf5RVVhW4nGhBinVlnoH9PXuPBYm0EE65ifMhxb4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(7416002)(36756003)(6486002)(316002)(31686004)(7406005)(186003)(66946007)(66574015)(4326008)(110136005)(54906003)(478600001)(30864003)(2906002)(86362001)(5660300002)(38100700002)(83380400001)(8936002)(31696002)(6666004)(2616005)(66476007)(66556008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3RKVWNBc3V1NzZnZit3Z0JwbWZGV1N4ZWRuLzErdUVZUVN2ZEIrUzlOUHVu?=
 =?utf-8?B?NmJGUUJQeVI5cTJtU3VubmpEYzQ5RENXT3ROUG9INkxPZWVnWmNDeU0vODJM?=
 =?utf-8?B?UE1SdE1RTnMvWkxta2Q2ZFFZZk9xZDg1Tjd5dzQ4SlJjSDZVSVZEQyt4bkdr?=
 =?utf-8?B?YkZjOStUSFNPeFVmZGs5T00rRkh4cGh2a2hQa3cvU28rUGRLZkpEcTNQcXU0?=
 =?utf-8?B?V21pWmJXaStnSDBYRFFWWm9nM2N1WWVId0Nad0w0c21EVG1NQ3JSOWFhNDkw?=
 =?utf-8?B?Nlg4a1FhbFF2amdGUjJPREVnLzVOc1owWSs0c01EdE1oUUVCZ3NSdFhOWnlM?=
 =?utf-8?B?cHR1WGRKSzBKZEVZWHlRbU5tOWJCU1RCcXhFSVNUL3I1VGROTlV0VzhMd3NL?=
 =?utf-8?B?UEtiZmxocjZtbGFTMTBlUVlSWk9JQVdaeE40VUFkRUY3WHhnY1M3bENMcitG?=
 =?utf-8?B?NlZVaUM1YnNuVXlsdU4wQmVNRC9FZFpwclo2SDVNM1BwRHBjbW9JN3hsa2N4?=
 =?utf-8?B?YXE0R0J3UXRxWE9xWU5xQnZmZWxNbzVORVhkVWVBN1FHbEJvODhkR2ZaM1F0?=
 =?utf-8?B?aDZhc3Y3WDBtWDl6SGF1aDAzcFhEZXp0SGZrZGp1TGZOVkRDYnpnTlJCbUlU?=
 =?utf-8?B?eDhUN1hUbUV3alczSXhQMEJsbXNlKy9RcFdabXU1R2hiZnJjd0xkN0tuOXZt?=
 =?utf-8?B?TFFvWkM2eXhDNklYamp2NE5kbjZwUHhLMkRFQlg4YTJUblBJSE5ONzZkVDlo?=
 =?utf-8?B?WXk5NXpKbHBxc2p6bEpZVXBMYjg4TXprUGpYZVVaR2hDS29UdFUwN2tBaHpK?=
 =?utf-8?B?MlYyMHJpcUY4ejI5bFNESWNKSnZnQWFkNzdjb0xIclNHRjREc2VNaUdOOVZ4?=
 =?utf-8?B?Y1N6N3FrTHRnWmw5em10YllzYmwva0dQVlQ5SW5Ib1FNZDRHYWpWSVFJZnVk?=
 =?utf-8?B?LzFyNlMwL1VTSTdtQ3NlN25SRXdFakZ0cUZDN2VBd0lwZ1hzV3MzcG14RE1W?=
 =?utf-8?B?UjU4eTRJV1hhSXNHa1NZUElxeThsUnJ6ZXZZb2JEV3h5SWJkd1RqME9nNnNN?=
 =?utf-8?B?S0huTFoxbTRCSmFSVXJsQVpSRUpmdDVjTnBCSmE1RlRkbm5Xakg0NUlXcmsr?=
 =?utf-8?B?L2NpZkJrZTdhcVlrSHRGQmt1YnFKc1lJRml2Wko5WFFKbElMVzFyZ0l6Tlk2?=
 =?utf-8?B?OWJnZWdZWHZjM0lBRFVRTDFjWTBPU3lSZzE1c3Azem1YRzA2Si9uVHAwbnBQ?=
 =?utf-8?B?dTVKemY5bU5jZENxMVdjQ0t6QVArd0pndGkxRTNLSjMxdFA2UXNjYks0eFY5?=
 =?utf-8?B?WDk4NXVmZXdZalpSQlM1NXc2WG55K1BwNmFDUkZqQVFZNCtadk85d28xMW5G?=
 =?utf-8?B?UzA1MVJaMi85N0UzUkp3L1RteUg1Ym1IT2V0OE5zOXNpOWtLMmZLRHQrWm1F?=
 =?utf-8?B?R2pXSDdya3ZYN1hNR3hvYWs5aXN0TUFvbWphcThiU3FvVW1mNWVYc0d0dlY2?=
 =?utf-8?B?aFBLNjhmb2VEbENKSnVJSWxYZnBDd216MWM5UVVhSUthTlp6VGdqcyszLzF3?=
 =?utf-8?B?L25kZ2syN1E3eEFsc3pKakg0Sy9GRGRtZXduaE53bXUyS0hEN2wxVno3SVVM?=
 =?utf-8?B?aEVXM2JacjF1RXMxNkkxaHFxSHJsYVdCd2g2K0s2NmpMVnZDalpic291UXJj?=
 =?utf-8?B?ZndGZnY5dlhkYXRrd09lc210OWY2YnFqa2VTaGMvZWYwbUUvd2JDYUFTM1ZS?=
 =?utf-8?B?NDBXVmpkZ3pLcWMrY1lKTnczSmxNMnkxejcrb0Ntbno5dWtDRHdiaUIzRVlu?=
 =?utf-8?B?bHRabEJhWUdpSGltZFpKUko5WU1ZZUpQOWpFR2pGU3pMU0FpL2J1ZE1RSmxQ?=
 =?utf-8?Q?vPLJFqt9zXtUv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9082dc9-16f2-41d7-c829-08d94129cf1b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 09:30:07.7532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PaQKleo+RVi/6iAXyDW6LzvlKU2D9bATKzxwaWO5r3X4Vnl363cdyUB6dq31ijj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4897
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
 Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, lima@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Nick Terrell <terrelln@fb.com>,
 Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.07.21 um 23:38 schrieb Daniel Vetter:
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

Thinking more about this, I'm not sure if this really works.

See drm_sched_job_init() was also calling drm_sched_entity_select_rq() 
to update the entity->rq association.

And that can only be done later on when we arm the fence as well.

Christian.

>
> Also improve the kerneldoc for this.
>
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
> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> Cc: etnaviv@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: Emma Anholt <emma@anholt.net>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
>   drivers/gpu/drm/lima/lima_sched.c        |  2 ++
>   drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
>   drivers/gpu/drm/scheduler/sched_entity.c |  6 ++--
>   drivers/gpu/drm/scheduler/sched_fence.c  | 17 +++++----
>   drivers/gpu/drm/scheduler/sched_main.c   | 46 +++++++++++++++++++++---
>   drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
>   include/drm/gpu_scheduler.h              |  7 +++-
>   10 files changed, 74 insertions(+), 14 deletions(-)
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
> index 69de2c76731f..c451ee9a30d7 100644
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
> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
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
> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>   	fence->sched = entity->rq->sched;
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
> index 33c414d55fab..5e84e1500c32 100644
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
> @@ -577,6 +578,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>    * Refer to drm_sched_entity_push_job() documentation
>    * for locking considerations.
>    *
> + * Drivers must make sure drm_sched_job_cleanup() if this function returns
> + * successfully, even when @job is aborted before drm_sched_job_arm() is called.
> + *
>    * Returns 0 for success, negative error code otherwise.
>    */
>   int drm_sched_job_init(struct drm_sched_job *job,
> @@ -594,7 +598,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   	job->sched = sched;
>   	job->entity = entity;
>   	job->s_priority = entity->rq - sched->sched_rq;
> -	job->s_fence = drm_sched_fence_create(entity, owner);
> +	job->s_fence = drm_sched_fence_alloc(entity, owner);
>   	if (!job->s_fence)
>   		return -ENOMEM;
>   	job->id = atomic64_inc_return(&sched->job_id_count);
> @@ -606,13 +610,47 @@ int drm_sched_job_init(struct drm_sched_job *job,
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
> +	if (!kref_read(&job->s_fence->finished.refcount)) {
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

