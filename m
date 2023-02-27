Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBEE6A422F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 14:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B643210E19C;
	Mon, 27 Feb 2023 13:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2000010E00A;
 Mon, 27 Feb 2023 13:04:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaVF05PxabB6U30BMxrQ4V8YJzp5JLUDJr+GxHDSuqk6vyB3gZNxVE56qEgm+uLpIbK0jHI0yGF3Sfb3dRhlReW1ea4i45YM29h9L97QGTgJyTUNrzppPun1mKIHAmlGVOnqd7+HCCdJMIK49LBZSI7i2FW+hPVqFdXkfCrVaB/8ewhSA2GbTpgFYuQcsMYlZ+9ydc6ZHtyo24yk1LEd1f5r7Uk8Nnvmr39UMA2R/HI7ptb1J/5DsqOLUHFtDsXD/a2P94k815eYUb25btiTsvCYPEw4Mkk4tbQTtclICo8va9lcj5q+yzesuoisZ4dv1PQG/U5wcE+F70iKq3BlIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukGmhxaSi2U+kf5OgI6IM+tRWdFFtAdmnTuowmVPbME=;
 b=oHRzyWfzQv+JJHDq3Uh3ApOU33+x/dXB4fT/KLCzPOl7roHhCIoNe27lDjAQQFHN0juUYKym34/VuO2M5+P5GB4kmx4p0TciyaX93QAbwpmEjjGs+RdgV4H66+B2cPBV2BCmHiy1699OKUfSRQkUhZTkXIeKyd7Lp2Wmybf38XxmtGc/GzER+W0dSl/V+WyWHSZ736Y7yhpvjHyt09rOxA7CoZt+RVUyd3H7EvDYtN5n6aJOfQj1xvjywRZw7nB+17LJ36defGICyelX0S0L0N9ttgWSqzzn4v18GzuWLajyrt4X+Ll+oWH2GqIQGDip8h3bV4RZFqj98+aeNwJtwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukGmhxaSi2U+kf5OgI6IM+tRWdFFtAdmnTuowmVPbME=;
 b=2KeWX4dUc3EIBBir8OAL/Fos1VerZLQ92dLIyD+4DMX+4nFjoGB4cXAzJ4UM3b1D9Z2reHm5z5ZrnQie8tymetoBos4MABxqA0biXLHb1MUdeyjX7LYws7BWGmu8+XgQFFMT3vLikh4K3heN5vHuZjPIgsdDiblQcs1pEjkKiao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB7316.namprd12.prod.outlook.com (2603:10b6:930:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 13:04:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 13:04:02 +0000
Message-ID: <bcf1708d-5e3e-032e-6770-231cdb57971c@amd.com>
Date: Mon, 27 Feb 2023 14:03:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Intel-xe] [PATCH v4 0/3] drm/helpers: Make the suballocation
 manager drm generic
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
References: <20230224095152.30134-1-thomas.hellstrom@linux.intel.com>
 <6cddb602-31dd-8854-25dc-11afe9b1a275@linux.intel.com>
 <6f0b5231-a9c2-e31e-f2d6-61f403d2f94d@lankhorst.se>
 <f1caadc4-9e65-1b1c-ec81-82a89f764b40@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <f1caadc4-9e65-1b1c-ec81-82a89f764b40@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: a21407f0-d796-48f8-9450-08db18c31902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XCJQnIrNL7MQHBoANJ7fsJZ9YwSURws7HtNTK0n1gJTLS3bGLkzEuRfSSIYeThNnEnlyVgttYYrHrPy5zNXcV9mi+cQEq5UFKo2Mwn1GyXW5TlIenkR172a0Nwubbv1FICEP8u12f6NRjv3TEIsy+CTdH9s2ANivEVWE9mR9fN5hN9waGt9gNU4qJy72VxPZBfArF+o3UZJ0U+uYjPkMUbsoX8D9nmC18Q9paSJn/1GfFfxnDYcTda/oP87XNHiB654uq/WbpVXrtsmfQvPATtseGHv7h5/HPX4JETbtfvabodl6KX+hZbo4SGGRZ8IQRgA780BYcSEbTQy8z7CJYo/uh59cxE7Nrv4bZkK8MnL1Z/soQ6gbqAUQZ8h8PRYdeiaOexttopW0mFrCPQU+UvdPwnU1Myug62nLYQuVbeqjX81Ahl4jLy1TTuJsn51QKDtTvmUsdrhcXqA7ET66jyTf4TThStiVDubvqvINQTjFBvtdMxHEqAO7ABoQp6L0U0y5psq//UyiLsYQCHc/xbAW1GwwiYKpYaLGVp6C5QvJM3d2d7xhbBe/cR0g3nNRe5kA3uOeapKRic+5Y54BGSMVBkH0xx0al7BWPYRif3UJ198DD5uqBT3QPkSkm/myETK5I93bNUaqRzuDCntknOKzw5afSMCWegr1edczPW6erYXOB4PbCCHy5BVlURT1ONSwCZjhUczR0Cdi25pIhKGj0nDogx0hCcEQrCJr1ruOpjorDcnDwcdCtwVuthgh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199018)(36756003)(316002)(66574015)(110136005)(83380400001)(6666004)(6486002)(2616005)(53546011)(6512007)(478600001)(26005)(186003)(6506007)(8936002)(41300700001)(2906002)(86362001)(66556008)(5660300002)(66476007)(66946007)(31696002)(8676002)(38100700002)(4326008)(31686004)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzhTUVZnYlNnS0FuaWFDYWRXUURwNy9KM2xjeVkyK3VJM3NnMUwyMWZDOGZB?=
 =?utf-8?B?dzFveFhKcDUzWmxQdTdMQjNpWjh4YmRDQmdxckh0Z3ZZYW9JSWFDQ0ZodVRM?=
 =?utf-8?B?Wm5nOFBVaW5ndGxlWlQ0c1hIZHhQQmFSQ3VjaFhlcVpkWTBjMVZqbzMxdnA4?=
 =?utf-8?B?OFZ6UGpiR3ZGMFZGdkJRTGNDMXBSdXROTFY2YWZNRjYxT2dKcnBZRWtuNmM5?=
 =?utf-8?B?QWkxNnlLN0JpNWdKYXVNVlpyMXo4M3FaSTNWcVBlSWJhQ3ZISUp2UFFLS24r?=
 =?utf-8?B?MnlNS1pyTFhpYkZ1Q3FNSEJSTitiVTZldFl0MXJBcDEvZ1F5Z2hQWDRDSUJL?=
 =?utf-8?B?WFluTld1ZGppNmVJWjgwTjM0VmdSVjd0U1RBbXpXY2VWeHZ6TTRUMncrc3J4?=
 =?utf-8?B?N0psV3pWQUVlQTFKdERJY3MycUN5V2t1ZVh1RGJ2NlNJc3JSNXNyRDVNdkpW?=
 =?utf-8?B?RXpLL2FBbGYxeEhteUV2Wmowamk0RXF6a1htODAzQUlTVnhSNHBKa1JZTVdH?=
 =?utf-8?B?MFJsSkp6QWVxWEduNEwvK1RhYUpTNEx3dTJyM2gwS3pTenRzWlJGd2RGZUlk?=
 =?utf-8?B?b3E3MGJMMGN2Y0lyRnYwbC9OTkJKUnlyRTlwdFFzSVZLWEtSR1o4SGdmVU1Q?=
 =?utf-8?B?N1UrQWNYbWE1eWJ6Z2RiWHRBbWhHRFpZQnFrcndNNUhYYjFqaWExZFhkcWpK?=
 =?utf-8?B?aTkrRkJJcmx1SERzcEJMeG8rcHYza0R3NitaYkZPZVFiWVpCbXhmUk9nbS8r?=
 =?utf-8?B?dTU0Wks0NjhZb0Y3NERFZ1RnTW5CY0x4Wk90ODI1WGNKLzN3YXRiaGxGZW44?=
 =?utf-8?B?STkrWTNkckZHcVZadXRCUkxFajU1ck5kR2pJN1JVYjd2ZnBoS1RONlhRd1R5?=
 =?utf-8?B?Z213S1NVOEJNenF0TkRxSGZ1OE1uUXY2NWM3OHlMQVFyR042RGNzUHpzZVN6?=
 =?utf-8?B?QVYwSFZBak12cFFFK0VEWFN0TGJtV0NUVVVUZDJIbHRBYkRQMG5zdEhYOHpY?=
 =?utf-8?B?OGN2OXJNUEdCTW5JeG5DVlkrcCtxdk9tak5BR2JKS3ZmZDMvVDRWK1RZS3Ra?=
 =?utf-8?B?dTl6eTNQOHJ6RVJOSzJ2ZmtvRE9INmlGTm8vRWZiVEp1VTg2MW1sQVRYZ1Q1?=
 =?utf-8?B?Ym10dm9sTC9kdktxVmpvOWdJZnFNMTFWaGo2YXBmaS9CMnEyMGltVGM0Nmtq?=
 =?utf-8?B?MDJEalV3amhtQThRWmdmT2tFL1BXSkdQRXR3ZVg3a2wvUWsrWGx6dTBFZDlM?=
 =?utf-8?B?Mll2QWJ6M1lnSStuelVnRnFENG4ybFhwY2E2NVUvYXZWWFYxTGkzNzZzV3hF?=
 =?utf-8?B?SFIyZkM0UGRsRkFLLzVzamFSbENVM3NrYnJFUmtTc1NQaktZQ21zT0xDWWRw?=
 =?utf-8?B?RTY5SXFua3JJLy9oMnhTNnFFdTNsVjVuY2N5YVd2SkZYSEV5ZWNUazQ3Nmxr?=
 =?utf-8?B?U0c4VWpOeWhzMTdnSlhpNGhEejVDMUhnT3lrNUd6VHVrUHdaRUluRlVSV1pp?=
 =?utf-8?B?VnhHR2pVbEkwOUErWFp1emVnVXJNVHhnSTF3bkl0d1lQZ3ZqK3Y5c3BqL0dU?=
 =?utf-8?B?a0V3dytnOG9yeG04YjZaYmRJMm5WYm03dmdCQVRLQUsxQmV5Q0hJRnFvN0xx?=
 =?utf-8?B?VDdoazVoYlRzL01TQm9FUlNmQUVCK3lWTldIaXp6c2pzTmY5NmlhYmxzbW5u?=
 =?utf-8?B?MHh1aWptdHlDQWRXeFh4VU5sZksrUTI3OVp4V2M5dzFnVGlWWW9jRWgrRm9W?=
 =?utf-8?B?QjlVMGh5em53ckppZTBqVUlkaHBDckhUd28rZW8xdjArM20yY0JmeWlEbVh1?=
 =?utf-8?B?cWVaczRGZWw2V240dmIvR2lUNjVFdlBsSTQyQ3FMelVlTXRidW5iTnoyRkI0?=
 =?utf-8?B?RHN3NGFwUzhZZkRxUENHVDkwMStMeXZnU0hkZkp2b01KaVUwbklRUC9QY3VP?=
 =?utf-8?B?ZUJyR3RlaWJLanJRaDJGYjZYZXFadEFUNXFINlYyMDJReVZjRzdRNUY3bGx5?=
 =?utf-8?B?THpkUERXUk51d2lrY0w2TURuMFhkZHgrYS9YdG0vNVJkYzFXVDRPV0VVSmRC?=
 =?utf-8?B?Y3Q1c2taRXl2S1B1N2JtRDEvY2tiWlpEbXhIYTRQNHM0SEZTamdxQ3kwWGlz?=
 =?utf-8?Q?B/dp0RIpbwzs9GYtP4RHVVKuN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a21407f0-d796-48f8-9450-08db18c31902
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 13:04:02.2377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: De9tfd/u2gkIGFxpbf/K35ZQ2E7Ftmw3tXqQhNP2ogmlmtZvY3CbNUX3SrsKNlH5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7316
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.02.23 um 10:00 schrieb Thomas Hellström:
> Hi, Maarten,
>
> On 2/27/23 09:55, Maarten Lankhorst wrote:
>> Hey,
>>
>> I can push this to drm-misc-next, I don't think a drm maintainer ack 
>> is needed, as long as we have the acks from the amd folk for merging 
>> through drm-misc-next.
>>
> OK, sound good, we have that ack so please go ahead!

Works for me and I don't think Alex would object either.

Regards,
Christian.

>
> /Thomas
>
>
>> ~Maarten
>>
>> On 2023-02-27 09:11, Thomas Hellström wrote:
>>> Daniel, Dave
>>>
>>> Ack to merge this to drm through drm-misc-next?
>>>
>>> /Thomas
>>>
>>>
>>> On 2/24/23 10:51, Thomas Hellström wrote:
>>>> This series (or at least the suballocator helper) is a prerequisite
>>>> for the new Xe driver.
>>>>
>>>> There was an unresolved issue when the series was last up for review,
>>>> and that was the per allocation aligment. Last message was from
>>>> Maarten Lankhorst arguing that the larger per-driver alignment used
>>>> would only incur a small memory cost. This new variant resolves that.
>>>>
>>>> The generic suballocator has been tested with the Xe driver, and a
>>>> kunit test is under development.
>>>> The amd- and radeon adaptations are only compile-tested.
>>>>
>>>> v3:
>>>> - Remove stale author information (Christian König)
>>>> - Update Radeon Kconfig (Thomas Hellström)
>>>>
>>>> v4:
>>>> - Avoid 64-bit integer divisions (kernel test robot <lkp@intel.com>)
>>>> - Use size_t rather than u64 for the managed range. (Thomas)
>>>>
>>>>
>>>> Maarten Lankhorst (3):
>>>>    drm/suballoc: Extract amdgpu_sa.c as generic suballocation helper
>>>>    drm/amd: Convert amdgpu to use suballocation helper.
>>>>    drm/radeon: Use the drm suballocation manager implementation.
>>>>
>>>>   drivers/gpu/drm/Kconfig                    |   4 +
>>>>   drivers/gpu/drm/Makefile                   |   3 +
>>>>   drivers/gpu/drm/amd/amdgpu/Kconfig         |   1 +
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  26 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  23 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 324 +--------------
>>>>   drivers/gpu/drm/drm_suballoc.c             | 457 
>>>> +++++++++++++++++++++
>>>>   drivers/gpu/drm/radeon/Kconfig             |   1 +
>>>>   drivers/gpu/drm/radeon/radeon.h            |  55 +--
>>>>   drivers/gpu/drm/radeon/radeon_ib.c         |  12 +-
>>>>   drivers/gpu/drm/radeon/radeon_object.h     |  25 +-
>>>>   drivers/gpu/drm/radeon/radeon_sa.c         | 316 ++------------
>>>>   drivers/gpu/drm/radeon/radeon_semaphore.c  |   4 +-
>>>>   include/drm/drm_suballoc.h                 | 108 +++++
>>>>   16 files changed, 674 insertions(+), 693 deletions(-)
>>>>   create mode 100644 drivers/gpu/drm/drm_suballoc.c
>>>>   create mode 100644 include/drm/drm_suballoc.h
>>>>

