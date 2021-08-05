Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9101C3E1602
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 15:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E2B6EA74;
	Thu,  5 Aug 2021 13:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737446EA66;
 Thu,  5 Aug 2021 13:48:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8KUHHaLg3PLQ5L75Tc6CsozabZbnBZXHJLOlZDaivWLZ2D3zkotsH0hAevAvTtm2SD8rgl1E6oHkSwugMyywUiBOlTtVtaG/d8BJgeRlxhAfaCTrOyldCcHH4LYAM36ecpCcBT7yTmY0W2ILKd3QUyiIPJKJ4W7ckGAzyao1ozdahxLTaK+t9a56zbpQI7rc1fu4tytq8HznICPG24IyfVwVeyTMSkIuYBHi+0fk17sG+5/kWU3MgJiUtcPbl60a2mjrtr6TG9g0elX6gjcv5ybX3gFdjgfhRbkW2FcfVzPJ8C3NL6ljg5/rNgGSd7V0GFNTS6nLGchKWyR5XFtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vuhG6UmDbYNx+uVDEUo/IMVXDyUY1MhSHNX50TyThw=;
 b=HgZuqWNE9nTFPHIrO4AxRc3ZWgTkA7NG1/LhHgoc1eVSwmvHGryMhFtFGOuFAvoOYHZdxNKazR720Q2I6X0HUt+bVMW809/r0dfv3O76o2Ugv0ZLTc968p5QcN8XWoMksWJEcRTaVcMiVkDd4UmaWnoS0n1BwaGFxpWRMUjz9ofLZK8+RgAwGdprtjdoaVmVYRmIQ0Xd+z/FR0Z7xzRwyKb5xHFUevxMgnE6QN3A0XTbfpMadvHOcYCRweTvUo6iGE1/nDJz5Es5YOH0gMiea/UMNr0vFjC+3lNo+YdNepP4S5SqIrRg1JBG6681QY3G/piQv3jp+PuPZ/lSzduxZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vuhG6UmDbYNx+uVDEUo/IMVXDyUY1MhSHNX50TyThw=;
 b=V52c+J9Fi8/Jgr7W9fkh3LrZtvU4PENEKRF2/qlpdsTwQnxgPxOV35e/5HChFmYdyOnNTa61KXPzy7mOwtQ20Gw4gaPf/kSbYG4/iPeaO6WEIemOV9yijzhmcLRFubhixXli3JGlLxFvWUH2OK0hVG9MqB0TtNmiWElAwHhu0UQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 5 Aug
 2021 13:48:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 13:48:57 +0000
Subject: Re: [PATCH v5 05/20] drm/sched: drop entity parameter from
 drm_sched_push_job
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Qiang Yu
 <yuq825@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Dave Airlie <airlied@redhat.com>, Chen Li <chenli@uniontech.com>,
 Lee Jones <lee.jones@linaro.org>, Deepak R Varma <mh12gx2825@gmail.com>,
 Kevin Wang <kevin1.wang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Dennis Li
 <Dennis.Li@amd.com>, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-6-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <73e05841-6bea-3599-6f76-ac92e05e56bc@amd.com>
Date: Thu, 5 Aug 2021 15:48:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210805104705.862416-6-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ae89:49de:1628:3147]
 (2a02:908:1252:fb60:ae89:49de:1628:3147) by
 FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.5 via Frontend Transport; Thu, 5 Aug 2021 13:48:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0948b174-9c89-4781-f759-08d95817c575
X-MS-TrafficTypeDiagnostic: MN2PR12MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41268BBE4C3BA0C7B429889D83F29@MN2PR12MB4126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f12iMDweGzmdb2jLZid5z04q9J4lvkUzR6gXPEb1Bixo6uBYO2Cl0e/K4LAPBKShos2g+OD4bY7yTuu/iNMRxpywhtX7QAzRFeyTvKxPIZabjM9TXqdc3mhiXd8Jp2ijyxmtDhUGeu5HVoE0RmHq+rVS+jOTaLfRuws7L834yPxyB2Q102YRjmlEvr9Td5auPhfTO/AFbevrQdyI/8iWJVLdEFoxUETQLZLJNl4zta5ae7RzlSO8/EPJ0y2yiZ0qjMvYt5u9myHMgRBpspDQae4LOWcdW1gKVwmbGEE3Yy7HeICCVgrB9ohrYJM8k2giM6DrbTkexeHfPbYDSNT/VzF787LEAZ2M5wkD7Fbd6gI92VSMFkPtXi/RWQQ7nc0WRD3ckBGPiz5Pfn8knGEZNZedfLaA/uSCJ2+0rraSefLCYlWrpeb1xemgWTwLVlitoUAS6aRnlfLH6dS7TFCi2OalZgQawXeTWKR8Iq/pg6C6bQVJczj6ESgQD+Oi3wIvpvIxUS3Z613Oq/1LYA98N3UekX/5SX8ybb43narp5x/cZmy2zLlj1MDAdAv3tFP2QfTG3zqOZHCGXvm/5BAXpU/ltN2pvKJ7694cUZx/m4gPwzFl4kH5y3f3QSUuXtedz6SrtkjVE6DrS0aVM4WVlKZfLbeovUk2i1Tyb5juGdSXK16PdkbJh4BKS97z8iAVQT+gUQVASoD0I+NkkWtgXlpYJK38dnXfPLgglvpH8iM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(478600001)(31686004)(66476007)(186003)(316002)(66946007)(66574015)(4326008)(8936002)(8676002)(66556008)(5660300002)(38100700002)(2616005)(6486002)(2906002)(86362001)(6666004)(36756003)(7416002)(7406005)(83380400001)(54906003)(31696002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzgzOTZrRWZNZzdKOGN0OEJoYjkrZUxkbVp2UlhLM2lFQWNIRWNBdU0vV0dv?=
 =?utf-8?B?R1hMRTFwcjF5SWx4dFR0WitOdFNuSk1rTGRNSnloWW5kUnZBNzZwZnJLTml3?=
 =?utf-8?B?VytORGQrcFBXMkVoeDBmcUtjM0l2WS8vZXJ5UWJlZUJvT01jMGdSZWFsTDBq?=
 =?utf-8?B?ZSs4RVJGbXRpci9VTnJYZGZuSElhK01DTjZiTmt2SHcrNDFXbkJML2NjRFJ3?=
 =?utf-8?B?R0NjaXpJdHYzWlBKdEtJNlBpcENqaUkvMDVPRVkxbHRYREQzak9rbHJLdzBs?=
 =?utf-8?B?UGRKTk8vS3Q5QlRlVWcwand1R04wR1F6MExtcVdNZGY2TWExTHF4S1BLVzhl?=
 =?utf-8?B?WEFtbjBNdkg5RndCblFOWXc4dk9BdWlDN0dvbTc0czMvV3pKTy9IWEs3OUd1?=
 =?utf-8?B?dmRsZkJsazVpcWEzQk1JMSs1L21wMnZOd0dSekJrMm1RYjI1WFh5bk4vRXJZ?=
 =?utf-8?B?VWw3MWVkQzc1MXM1cTc1UW1HcUxhZFRBd1liUmQvUGxyejBQblo0UDhLeGpv?=
 =?utf-8?B?b1ZvZThYWTZUNndQSTNpSHRsaEdzVG1CaWxvWENPVHJCWXV6NzNxWCtrbFU4?=
 =?utf-8?B?dHhqZmVjWUg5MUpnc3JhcElucnNYK1dLeXdYdURyU0poQTVpdmQxOUlxTTFU?=
 =?utf-8?B?NTU3a2szU2xEcGVvK0M0OXUrbnVkNWVjNFpseUpBUll1ZEVrbzZzU2V5bXNi?=
 =?utf-8?B?N0ZLNDliSTMzMCtxOTQ2bjRVUWxxU3pLM2NQSkN3ZldKY2VyOStabmZESGF6?=
 =?utf-8?B?aTB1Z0pvd3puRXk5M2Z0NHYwd1M0Q2hvaXdKMnRyM0prQmNIR2RsZUhmSzdu?=
 =?utf-8?B?RFoyRXQ3UVBJUGdPTlpjZXlkaWNaTUl4b0tZL1g5UXhYWCtXRXk4N0JMVVkr?=
 =?utf-8?B?dDZzNE0xVmo2dnQwbVNXTHB3aE1NcGpadWpURG5KNW5nUWJwOUpSRzROVytw?=
 =?utf-8?B?TktSN1IyQnM3VmNMVkpvQkorSjNHU042dEhkWkRTMG5Ma2pzZkVuMFZpc1h4?=
 =?utf-8?B?QVB1ZmhZN29NZm5IWHJrRGFSbnhGWEJHOU5WRG9MYndiUzJqOVYyL3JWZFJh?=
 =?utf-8?B?ZktmRldlNHVkUVJGOW9sQXZDbUFKZEdveXZMdUtlVXlDNStHRW11bUZ2NVJK?=
 =?utf-8?B?d3U3U1ZGL2VzbTB6bk1HYVR3elFPbFowSTJTaHhHSE8xTjQ1TDIxTk5sRnlu?=
 =?utf-8?B?VC83Z2VYREpiUGF3Z1dUTERCaE5LTWlvejNoelpnSEVnNnZOaTFURzA4N1p1?=
 =?utf-8?B?TDdxaHVBMVN3YzU2bzFwT0UxektiK3RUdGI3d28zcVdzQjJOREg2WDJhQStu?=
 =?utf-8?B?czBzVG9MbXUvaVpMeWErZFpFU0xpR2lpWGszb2hvdHgxTzcyTnRqOEZRWFNH?=
 =?utf-8?B?aGRrMFpJKy9QVnFxdDkwYTFZVmUwcjZmeHNVNkxNMEpldk9mbWVHdzFOT3M2?=
 =?utf-8?B?MVV5dHdMQmNxR25ZV01PV09JRlUwTFlOR3lxMWNMaHJqNmtuaFJlZHBoNXI1?=
 =?utf-8?B?T0VUTkZQTmt6QTZjV091TkZVRnJlbTVGTmI2Zlh0V2d6UlpxTklnSE9RZlg5?=
 =?utf-8?B?RUcwWmE4cnBSeEZuSUdjVjRtMm1FdzJIckY4NXFIY1ZEaFVQUFJMNXNhMS81?=
 =?utf-8?B?eUN1L0ZuUXdEaDhXUytrZnRTYmVmOVlWR3E2ZjRKcXV1L0w3dkhKOGhLdTQv?=
 =?utf-8?B?VWxrL2t4MVhaZmlpMUdMZFpRcTJFWUdzOE5HMXBQMXk4ckROWmFFWk5jT2R4?=
 =?utf-8?B?a3dYWE40TDVKMUlPdHhxMklSakV3K1lQOEhDekc0bGtDeWZ1SzVrd1EyK2Mr?=
 =?utf-8?B?WHlMUlplN2lnblVsS2g0ODZJK2N2YjBYdzlWeE83cjBPdmtHSjhKMTRBclZy?=
 =?utf-8?Q?XfjBlvMXQhFPD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0948b174-9c89-4781-f759-08d95817c575
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 13:48:57.3018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5PyLc7t4lON7r+pu4G+XsRT7HVRsA5YMKyXKXKtNsW5KXhPd8IE2daL8PVMyT1/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126
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
> Originally a job was only bound to the queue when we pushed this, but
> now that's done in drm_sched_job_init, making that parameter entirely
> redundant.
>
> Remove it.
>
> The same applies to the context parameter in
> lima_sched_context_queue_task, simplify that too.
>
> v2:
> Rebase on top of msm adopting drm/sched
>
> Acked-by: Emma Anholt <emma@anholt.net>
> Acked-by: Melissa Wen <mwen@igalia.com>
> Reviewed-by: Steven Price <steven.price@arm.com> (v1)
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> (v1)
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Nirmoy Das <nirmoy.das@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: "Marek Olšák" <marek.olsak@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Dennis Li <Dennis.Li@amd.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: etnaviv@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  | 2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c  | 2 +-
>   drivers/gpu/drm/lima/lima_gem.c          | 3 +--
>   drivers/gpu/drm/lima/lima_sched.c        | 5 ++---
>   drivers/gpu/drm/lima/lima_sched.h        | 3 +--
>   drivers/gpu/drm/msm/msm_gem_submit.c     | 2 +-
>   drivers/gpu/drm/panfrost/panfrost_job.c  | 2 +-
>   drivers/gpu/drm/scheduler/sched_entity.c | 6 ++----
>   drivers/gpu/drm/v3d/v3d_gem.c            | 2 +-
>   include/drm/gpu_scheduler.h              | 3 +--
>   11 files changed, 13 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 32e80bc6af22..1d8a914108af 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1267,7 +1267,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>   
>   	trace_amdgpu_cs_ioctl(job);
>   	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->ticket);
> -	drm_sched_entity_push_job(&job->base, entity);
> +	drm_sched_entity_push_job(&job->base);
>   
>   	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 5ddb955d2315..b8609cccc9c1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -174,7 +174,7 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
>   
>   	*f = dma_fence_get(&job->base.s_fence->finished);
>   	amdgpu_job_free_resources(job);
> -	drm_sched_entity_push_job(&job->base, entity);
> +	drm_sched_entity_push_job(&job->base);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 05f412204118..180bb633d5c5 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -178,7 +178,7 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>   	/* the scheduler holds on to the job now */
>   	kref_get(&submit->refcount);
>   
> -	drm_sched_entity_push_job(&submit->sched_job, sched_entity);
> +	drm_sched_entity_push_job(&submit->sched_job);
>   
>   out_unlock:
>   	mutex_unlock(&submit->gpu->fence_lock);
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index de62966243cd..c528f40981bb 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -359,8 +359,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
>   			goto err_out2;
>   	}
>   
> -	fence = lima_sched_context_queue_task(
> -		submit->ctx->context + submit->pipe, submit->task);
> +	fence = lima_sched_context_queue_task(submit->task);
>   
>   	for (i = 0; i < submit->nr_bos; i++) {
>   		if (submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE)
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index 38f755580507..e968b5a8f0b0 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -177,13 +177,12 @@ void lima_sched_context_fini(struct lima_sched_pipe *pipe,
>   	drm_sched_entity_fini(&context->base);
>   }
>   
> -struct dma_fence *lima_sched_context_queue_task(struct lima_sched_context *context,
> -						struct lima_sched_task *task)
> +struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task)
>   {
>   	struct dma_fence *fence = dma_fence_get(&task->base.s_fence->finished);
>   
>   	trace_lima_task_submit(task);
> -	drm_sched_entity_push_job(&task->base, &context->base);
> +	drm_sched_entity_push_job(&task->base);
>   	return fence;
>   }
>   
> diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
> index 90f03c48ef4a..ac70006b0e26 100644
> --- a/drivers/gpu/drm/lima/lima_sched.h
> +++ b/drivers/gpu/drm/lima/lima_sched.h
> @@ -98,8 +98,7 @@ int lima_sched_context_init(struct lima_sched_pipe *pipe,
>   			    atomic_t *guilty);
>   void lima_sched_context_fini(struct lima_sched_pipe *pipe,
>   			     struct lima_sched_context *context);
> -struct dma_fence *lima_sched_context_queue_task(struct lima_sched_context *context,
> -						struct lima_sched_task *task);
> +struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task);
>   
>   int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name);
>   void lima_sched_pipe_fini(struct lima_sched_pipe *pipe);
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index d0ed4ddc509e..96cea0ba4cfd 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -909,7 +909,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   	/* The scheduler owns a ref now: */
>   	msm_gem_submit_get(submit);
>   
> -	drm_sched_entity_push_job(&submit->base, &queue->entity);
> +	drm_sched_entity_push_job(&submit->base);
>   
>   	args->fence = submit->fence_id;
>   
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 2992dc85325f..4bc962763e1f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -301,7 +301,7 @@ int panfrost_job_push(struct panfrost_job *job)
>   
>   	kref_get(&job->refcount); /* put by scheduler job completion */
>   
> -	drm_sched_entity_push_job(&job->base, entity);
> +	drm_sched_entity_push_job(&job->base);
>   
>   	mutex_unlock(&pfdev->sched_lock);
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 381fbf462ea7..e4d33db1eb45 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -516,9 +516,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   
>   /**
>    * drm_sched_entity_push_job - Submit a job to the entity's job queue
> - *
>    * @sched_job: job to submit
> - * @entity: scheduler entity
>    *
>    * Note: To guarantee that the order of insertion to queue matches the job's
>    * fence sequence number this function should be called with drm_sched_job_arm()
> @@ -526,9 +524,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>    *
>    * Returns 0 for success, negative error code otherwise.
>    */
> -void drm_sched_entity_push_job(struct drm_sched_job *sched_job,
> -			       struct drm_sched_entity *entity)
> +void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   {
> +	struct drm_sched_entity *entity = sched_job->entity;
>   	bool first;
>   
>   	trace_drm_sched_job(sched_job, entity);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 2e808097b4d1..957228bef29c 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -487,7 +487,7 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
>   	/* put by scheduler job completion */
>   	kref_get(&job->refcount);
>   
> -	drm_sched_entity_push_job(&job->base, &v3d_priv->sched_entity[queue]);
> +	drm_sched_entity_push_job(&job->base);
>   
>   	return 0;
>   }
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index a47946f904b6..b72f73b375a2 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -409,8 +409,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity);
>   void drm_sched_entity_destroy(struct drm_sched_entity *entity);
>   void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
>   struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
> -void drm_sched_entity_push_job(struct drm_sched_job *sched_job,
> -			       struct drm_sched_entity *entity);
> +void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
>   void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>   				   enum drm_sched_priority priority);
>   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);

