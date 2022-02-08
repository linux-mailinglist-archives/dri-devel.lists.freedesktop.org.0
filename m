Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4BB4ADE26
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 17:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEE710E73A;
	Tue,  8 Feb 2022 16:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8910910E73A;
 Tue,  8 Feb 2022 16:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bp7KrClvmEJJZ39hk8uM2Tvb0lHS07512j8RRSixvxA5z+zrh2+jCDNSnDSXmQepxw6M9lB8ofvT3EuT3+LdT6zBrTsXbfbA68v0iaD+JiTFf/Zpfy+v1/rUWMuS/8mhcrefzR4oUfp8voGhEP//2yGwfcRa5ADKF5SNscwjNh8ttOFNiKds+Zi8PU7YukrwifG0OVp114uEKiRAilSyOkGAeYDZ/i0rO/oJ6YikGaMZMHIEcEkPwWEUH5zlVhp7ztH2ojy5kxnAPbuoFlFmc5jkSTA+WHkSFVzFCL6DMRakH61K5K4eJuQ+Wajp7hpTieOp383agtHM0dAb+n28Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O18tsEneNUGkU8WmiYrSl5X5wrpGgHOyrAOXtibCSa0=;
 b=lucUpp8r+knJT6KCotl9LS3rcl/5bnQ7yAMF89T+DaAg58MDawi+NxrU1UNJV9CQs36wwdMRC6/NP0TZSXP3JpGHhX1x8lS22sRIvbk/oCiMwrvY1TiGHWcBU9nzoZ190KlF38vBb/k9Nj4pIElvel8zwhDcDaufKSgaLvf69U7AjU2QTT89C64xtIlp+k8lt4e9/LIJ+Iekv+k6YZD7tO8LE0mvQRQyXy9pKdHVyMf4epKBcSZ0sKtn9ydnYevf6ypl+xWYGS2IQbQjX9P4idZHXZgUsicx6nW5aNcjvGascB9qb916dDleYvIAzmqx8Yr2MOgSKR+EGQSOACNuqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O18tsEneNUGkU8WmiYrSl5X5wrpGgHOyrAOXtibCSa0=;
 b=pvxcs/qZ3aISSIIhUc/mOeZMOMf3m9CQiMk7zlz27oqHDMxOcJiI7YLhhe3YksP2hHKCXE6qDRL3e3Y3OL1mLXgpsHcVY90wmrdQ/ch2meg7xpSp/Qdip2JMeRc1GHjn668smMc7AhbMVBHww+CaQgmTfzmkgB/NhP3MoKyrbl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MN2PR12MB3342.namprd12.prod.outlook.com (2603:10b6:208:c3::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 16:19:53 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 16:19:53 +0000
Message-ID: <f13f817d-530b-605f-9034-bfec0ef3e2a8@amd.com>
Date: Tue, 8 Feb 2022 11:19:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v4] drm/amdgpu: Rework reset domain to be refcounted.
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220125223752.200211-9-andrey.grodzovsky@amd.com>
 <20220202172617.16181-1-andrey.grodzovsky@amd.com>
 <8e4dc322-2946-9047-7cd4-8a734dc29bd3@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <8e4dc322-2946-9047-7cd4-8a734dc29bd3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::23) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a8fe051-755c-4f59-eb03-08d9eb1ed665
X-MS-TrafficTypeDiagnostic: MN2PR12MB3342:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3342E93BA619F12971D00F90EA2D9@MN2PR12MB3342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A6ruLjvt1kgPJ42jiMRkztLATfOGtlDT5zvzXeZuwj76TYesjzohAABC3IEK6z2N8K4+BoF8z0LTwZeRD9lh/WdrQ1L6GSijHyV1if2q8gmoT4wjBdX2yk8jbsOp+LiIDDRSqNH3nOQ2JhRux84wGLZKQWLTfpYNqsgzk9NJY4MJG4mzC8XiH4ShfvQcUqsFfsMMOQsD558N0jEw7lzWJhw8hp+LVGvFLGOEk7Ek50s6v9vo3ThWtXS06M/HZM6Xebl6ZVE7jagA5bCG5SPTGxI4IFEydMjef8RoeH/nUxbUVHiRd4JAIlm4DpvphbsUI2betahmTYMY4jZGgyruApqptXO0AgypVrFf78Iwmvro/D6W8ehDhGJ2lIdSForqs9R0t26kwV7wDz80glZ53IvmjMv2WIfVDGePUPnUGc79twSE/SxAwPc3jwHl4EkJgFtn654jWViEvLCxBAjBaIg9O9zSuKTE8RHjOocB6w3YEIdPGjDw79bvTZ/j87uTSIXUf2uqoN4rTZTOcSLSSxQRV0dSELvSpN+7BrPzfkK85JsnEJK7km9ZyEYEjdrcKctNwIpAF6B27ICoDarMVGzWjWv+B1DfFvP4qnwTS/9JMsMxKMK6R+Q9/Ny0XqCiHNhgBua1X32yCbl8nrvoHoDwt96vpCg4ZbZlJcbqPDX9NCERhQwL+lLTPPVIgHnc4HjGXI3DVUSwMYBMQFeGccrdI517ZgQBa+1XueOSAAS9GJ5w2kFCiaROn7YDrLwealfNarXq/9NcxbJ0i3h18Nx38cqyeGzyiGs4G/8F/oxBF9j+qiN6N6oY7KdXqcDKF+M/A0tkx1SZG/fGKOHLfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(6506007)(36756003)(316002)(508600001)(6486002)(966005)(83380400001)(53546011)(2616005)(2906002)(86362001)(31696002)(8676002)(4326008)(8936002)(66556008)(66476007)(66946007)(6512007)(44832011)(38100700002)(30864003)(31686004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTgvc0VWeENxWGgvWmVlcnhTQmJkSkN6dmJvbzh3TTBWZFhDcS9qN3lyWW1I?=
 =?utf-8?B?cXBzV1Z0YnBteGFKZVRIWG81NllHZFJIU20vcmN0bUpDVWNTRFdPSHpXaGdE?=
 =?utf-8?B?YWx5M3g2OVorVjQ0OFV4aG9wY2pRSTN0MHZXTjRMOEdrNldETm9JWjBObHE2?=
 =?utf-8?B?REswTE9vK3ZkYXI0QU5XNThHdEIrS1BaMW9jcEEyanp0MzFoTEx6M1pVWG1Q?=
 =?utf-8?B?WEZDUndTSFhhby9pSFhteDhJVVJvVWFLWWpKa0FUV0dUT3E0TEZHS1JMRXlI?=
 =?utf-8?B?dUZYWkpyUmwyYWFXck9FZXZTZjNjTGpLMUdsY3djeWdHWmNNZDhhZTVNN0ha?=
 =?utf-8?B?WTFMaU5CeTJmMXJHbjlrUDhGVVRlVWJxMi9DNEozVGczeWoyRFJ1M0lyY1Zn?=
 =?utf-8?B?OW5SWEt1eTN2VXdwS3gvQjRpN0JwQkFlYUloMVdZd1NDVk1jNldzSlNhVmcy?=
 =?utf-8?B?bnRodzhvbDBUcWpHalp2T2Fpd2NtazB5c2lGOHNKbTgxdzB5L2kvN2t5S1I1?=
 =?utf-8?B?L2UvaW44VzNYWEptQlc4Q1BVMGRYKzRzVXZFclAyQUZmTk8rcXB5OWZuQWlx?=
 =?utf-8?B?MFg0eFJScWxkSW5XYU1xMnFmNVkrdlNCNWllYmcwalBIZ1RubkZ1ekV4cURB?=
 =?utf-8?B?dUpPeDhGV2dxUU5ncWo4aE1hU1JhbXMxcnVNeWRNbUFWRmF2d2k2SVJBUUVx?=
 =?utf-8?B?M0tOU0JvcEVyQnJ5M3l5QjM2czFrekJWQ2gyeEpPalVRZUtSK28vZnJ5UzlB?=
 =?utf-8?B?T1VwRkQ1MlZuUTcwZUYwQzlVSjg4MTF2QjFJQWNGaEFoRHVIVjFtVFhpalJN?=
 =?utf-8?B?a0c3WmNyV2RBN0JGUUhYMkduU0lYeGZJSk14K1VqTmJidzhxMTRuamxCSjlP?=
 =?utf-8?B?R1dCajU3Y2pxbEpHakNjYXFMZVlYRlVwNmtnUklCK1FDS2hkbjh4SUxHc3VX?=
 =?utf-8?B?UTNDemJUSmpMNndJdmRtT29mOUNyOFFobUNxZFVEOW4wYkJNNEgrUGlXaldU?=
 =?utf-8?B?WHdMbWlkbDFHU2JoRlpqdEx0bS9teXRhOEtNTW5neE1jZDFjSE1IT0lTVUdi?=
 =?utf-8?B?UGVxRjZTSjVCMXJjd1dwN25lSVplVmw4VGNJUU1MYXVHWGRieEZDWnV3Yisv?=
 =?utf-8?B?QXlhVlJIdFExKzNnVjRxR21vL0RlSXlVUTdQc2Z1K2VjV1Nvb3U1bEtQWS9i?=
 =?utf-8?B?bkJmTkdyK1FyRFpLd1lDaDhXK0padmxGV01RNUhwTzB4UE5mU2pTWXVUMlc3?=
 =?utf-8?B?a0VHTVpRK3dObjlScWJta0JyMzFjSFBRTWdpTmpUUjJzd0ZTUE5aTlBubExG?=
 =?utf-8?B?eTFnUFNHT0RQb2xrTmtNSmpnR3k5ZC9GNktGZ3ArSzRMQ05FbFdzVjRnbWtZ?=
 =?utf-8?B?V2w3RVRFSVFCVWk2Zk1aQkNvbXI1T05NZ3ppSnRYS3VhWmNjeWtGUGlEZU4z?=
 =?utf-8?B?dncxQzdGckM4dlh2b3FUUUwvaFg3RE0vL3ZmaDNFTjBxeGcwR3JOOUxWM2xG?=
 =?utf-8?B?Qi8rTHlyZWsyeFFTZ1U5aU5ZYklPV2NuUHFYRzA3ekF2T3cvUDZtYmd6NWg5?=
 =?utf-8?B?cEdIWmYvaTQyUndCaFdWWVlNS1BkY1ZqbmhhVFgrZ0MxMEJVSVJ5cUVNTXdW?=
 =?utf-8?B?Z0thL2VkdDljMm5sNy9UTGg2bThla245YUpvMlhNb1l0dEZnaVJ6RUdLeTF4?=
 =?utf-8?B?eVNJcGNFYjBrVlNEL1VaV3MzaGRZWXRXTGhPVTlOU2xRYzNoNyt5ckNkcVgr?=
 =?utf-8?B?RlNZQkRCVWoxSHRITVBFYm9xTVJMcC9pa254SklyVElOYzhSZHBNaU5Ia1Zy?=
 =?utf-8?B?dUoxZ1VDaWY0blB1a1Racm5KV3d6Y0FlcVdFWmcvdGNubHZKeGZ2TWZzZXpR?=
 =?utf-8?B?YUFJS1hhU3RDcDJRZmliQlVtbUhzUSs5M2FUMmN4Z05mYXVWc0dzVFdSS0cr?=
 =?utf-8?B?S0p1T3BSTkRKYy9DaUlPVk9DL0RyWjdNVXN2UVd5MHRNM29nMk9OU0taMWRI?=
 =?utf-8?B?UVJLL3VhMzEveVRyMkZEWXlUb3N2azhyUWRsSlFCZmNKZS8wcWU3U0FXdkda?=
 =?utf-8?B?K0hYV2JVTk5Id2lPeGw2SGNVU1hnN1JXeDNSVENMOE9HeEJydVJPM085TDM0?=
 =?utf-8?B?RTlZY2swN3h2VW9DbTdqR1p3c0lNVzBLbkNKQmpXSGh3SU9FaGh3RWx4VXlX?=
 =?utf-8?B?bGpsRjllTkdSdk56d3cza3pJMzBUa3Y0bXVuWVZwWWl3Wjl2TjFKZmpyRWtQ?=
 =?utf-8?Q?/ps+EtOPfypRiqShxC5oAQWTOEHgVRJnJLvb0/49Cw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8fe051-755c-4f59-eb03-08d9eb1ed665
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 16:19:53.0216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A47OPvUPIrHfWlcCRpaXrVQiFMuUwBXVTw9JMNFhe737phNxXN9a49Cn2JBI5muCDj9DVZ19tnNFHBW0AB1gAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3342
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, jingwech@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-02-08 06:25, Lazar, Lijo wrote:
>
>
> On 2/2/2022 10:56 PM, Andrey Grodzovsky wrote:
>> The reset domain contains register access semaphor
>> now and so needs to be present as long as each device
>> in a hive needs it and so it cannot be binded to XGMI
>> hive life cycle.
>> Adress this by making reset domain refcounted and pointed
>> by each member of the hive and the hive itself.
>>
>> v4:
>> Fix crash on boot with XGMI hive by adding type to reset_domain.
>> XGMI will only create a new reset_domain if prevoius was of single
>> device type meaning it's first boot. Otherwsie it will take a
>> refocunt to exsiting reset_domain from the amdgou device.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 44 +++++++++++++---------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 38 +++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 18 +++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 29 +++++++++++---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  4 +-
>>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  4 +-
>>   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c      |  4 +-
>>   9 files changed, 118 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 8e96b9a14452..f2ba460bfd59 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -813,9 +813,7 @@ struct amd_powerplay {
>>   #define AMDGPU_RESET_MAGIC_NUM 64
>>   #define AMDGPU_MAX_DF_PERFMONS 4
>>   -struct amdgpu_reset_domain {
>> -    struct workqueue_struct *wq;
>> -};
>> +struct amdgpu_reset_domain;
>>     struct amdgpu_device {
>>       struct device            *dev;
>> @@ -1102,7 +1100,7 @@ struct amdgpu_device {
>>       struct amdgpu_reset_control     *reset_cntl;
>>       uint32_t ip_versions[HW_ID_MAX][HWIP_MAX_INSTANCE];
>>   -    struct amdgpu_reset_domain    reset_domain;
>> +    struct amdgpu_reset_domain    *reset_domain;
>>   };
>>     static inline struct amdgpu_device *drm_to_adev(struct drm_device 
>> *ddev)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index fef952ca8db5..cd1b7af69c35 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2313,7 +2313,7 @@ static int amdgpu_device_init_schedulers(struct 
>> amdgpu_device *adev)
>>             r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>                      ring->num_hw_submission, amdgpu_job_hang_limit,
>> -                   timeout, adev->reset_domain.wq, 
>> ring->sched_score, ring->name);
>> +                   timeout, adev->reset_domain->wq, 
>> ring->sched_score, ring->name);
>>           if (r) {
>>               DRM_ERROR("Failed to create scheduler on ring %s.\n",
>>                     ring->name);
>> @@ -2432,24 +2432,22 @@ static int amdgpu_device_ip_init(struct 
>> amdgpu_device *adev)
>>       if (r)
>>           goto init_failed;
>>   +    /**
>> +     * In case of XGMI grab extra reference for reset domain for 
>> this device
>> +     */
>>       if (adev->gmc.xgmi.num_physical_nodes > 1) {
>> -        struct amdgpu_hive_info *hive;
>> -
>> -        amdgpu_xgmi_add_device(adev);
>> +        if (amdgpu_xgmi_add_device(adev) == 0) {
>> +            struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
>>   -        hive = amdgpu_get_xgmi_hive(adev);
>> -        if (!hive || !hive->reset_domain.wq) {
>> -            DRM_ERROR("Failed to obtain reset domain info for XGMI 
>> hive:%llx", hive->hive_id);
>> -            r = -EINVAL;
>> -            goto init_failed;
>> -        }
>> +            if (!hive->reset_domain ||
>> + !kref_get_unless_zero(&hive->reset_domain->refcount)) {
>> +                r = -ENOENT;
>> +                goto init_failed;
>> +            }
>>   -        adev->reset_domain.wq = hive->reset_domain.wq;
>> -    } else {
>> -        adev->reset_domain.wq = 
>> alloc_ordered_workqueue("amdgpu-reset-dev", 0);
>> -        if (!adev->reset_domain.wq) {
>> -            r = -ENOMEM;
>> -            goto init_failed;
>> +            /* Drop the early temporary reset domain we created for 
>> device */
>> +            kref_put(&adev->reset_domain->refcount, 
>> amdgpu_reset_destroy_reset_domain);
>> +            adev->reset_domain = hive->reset_domain;
>>           }
>>       }
>>   @@ -3599,6 +3597,15 @@ int amdgpu_device_init(struct amdgpu_device 
>> *adev,
>>           return r;
>>       }
>>   +    /*
>> +     * Reset domain needs to be present early, before XGMI hive 
>> discovered
>> +     * (if any) and intitialized to use reset sem and in_gpu reset flag
>> +     * early on during init.
>> +     */
>> +    adev->reset_domain = 
>> amdgpu_reset_create_reset_domain(SINGLE_DEVICE ,"amdgpu-reset-dev");
>> +    if (!adev->reset_domain)
>> +        return -ENOMEM;
>> +
>>       /* early init functions */
>>       r = amdgpu_device_ip_early_init(adev);
>>       if (r)
>> @@ -3949,6 +3956,9 @@ void amdgpu_device_fini_sw(struct amdgpu_device 
>> *adev)
>>       if (adev->mman.discovery_bin)
>>           amdgpu_discovery_fini(adev);
>>   +    kref_put(&adev->reset_domain->refcount, 
>> amdgpu_reset_destroy_reset_domain);
>> +    adev->reset_domain = NULL;
>> +
>>       kfree(adev->pci_state);
>>     }
>> @@ -5186,7 +5196,7 @@ int amdgpu_device_gpu_recover(struct 
>> amdgpu_device *adev,
>>         INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>>   -    if (!queue_work(adev->reset_domain.wq, &work.base))
>> +    if (!queue_work(adev->reset_domain->wq, &work.base))
>>           return -EAGAIN;
>>         flush_work(&work.base);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> index 02afd4115675..14f003d5ebe8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> @@ -96,3 +96,41 @@ int amdgpu_reset_perform_reset(struct 
>> amdgpu_device *adev,
>>       return reset_handler->restore_hwcontext(adev->reset_cntl,
>>                           reset_context);
>>   }
>> +
>> +
>> +void amdgpu_reset_destroy_reset_domain(struct kref *ref)
>> +{
>> +    struct amdgpu_reset_domain *reset_domain = container_of(ref,
>> +                                struct amdgpu_reset_domain,
>> +                                refcount);
>> +    destroy_workqueue(reset_domain->wq);
>> +    kvfree(reset_domain);
>> +}
>> +
>> +struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum 
>> amdgpu_reset_domain_type type,
>> +                                 char *wq_name)
>> +{
>> +    struct amdgpu_reset_domain *reset_domain;
>> +
>> +    reset_domain = kvzalloc(sizeof(struct amdgpu_reset_domain), 
>> GFP_KERNEL);
>> +    if (!reset_domain) {
>> +        DRM_ERROR("Failed to allocate amdgpu_reset_domain!");
>> +        return NULL;
>> +    }
>> +
>> +    reset_domain->type = type;
>> +    kref_init(&reset_domain->refcount);
>> +
>> +    reset_domain->wq = create_singlethread_workqueue(wq_name);
>> +    if (!reset_domain->wq) {
>> +        DRM_ERROR("Failed to allocate wq for amdgpu_reset_domain!");
>> +        kref_put(&reset_domain->refcount, 
>> amdgpu_reset_destroy_reset_domain);
>> +        return NULL;
>> +
>> +    }
>> +
>> +    return reset_domain;
>> +}
>> +
>> +
>> +
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> index e00d38d9160a..0b310cd963d9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> @@ -70,6 +70,19 @@ struct amdgpu_reset_control {
>>       void (*async_reset)(struct work_struct *work);
>>   };
>>   +
>> +enum amdgpu_reset_domain_type {
>> +    SINGLE_DEVICE,
>> +    XGMI_HIVE
>> +};
>> +
>> +struct amdgpu_reset_domain {
>> +    struct kref refcount;
>> +    struct workqueue_struct *wq;
>> +    enum amdgpu_reset_domain_type type;
>> +};
>> +
>> +
>>   int amdgpu_reset_init(struct amdgpu_device *adev);
>>   int amdgpu_reset_fini(struct amdgpu_device *adev);
>>   @@ -82,4 +95,9 @@ int amdgpu_reset_perform_reset(struct 
>> amdgpu_device *adev,
>>   int amdgpu_reset_add_handler(struct amdgpu_reset_control *reset_ctl,
>>                    struct amdgpu_reset_handler *handler);
>>   +struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum 
>> amdgpu_reset_domain_type type,
>> +                                 char *wq_name);
>> +
>> +void amdgpu_reset_destroy_reset_domain(struct kref *ref);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>> index 9ad742039ac9..a216e88a7b54 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>> @@ -32,6 +32,8 @@
>>   #include "wafl/wafl2_4_0_0_smn.h"
>>   #include "wafl/wafl2_4_0_0_sh_mask.h"
>>   +#include "amdgpu_reset.h"
>> +
>>   #define smnPCS_XGMI23_PCS_ERROR_STATUS   0x11a01210
>>   #define smnPCS_XGMI3X16_PCS_ERROR_STATUS 0x11a0020c
>>   #define smnPCS_GOPX1_PCS_ERROR_STATUS    0x12200210
>> @@ -226,6 +228,9 @@ static void amdgpu_xgmi_hive_release(struct 
>> kobject *kobj)
>>       struct amdgpu_hive_info *hive = container_of(
>>           kobj, struct amdgpu_hive_info, kobj);
>>   +    kref_put(&hive->reset_domain->refcount, 
>> amdgpu_reset_destroy_reset_domain);
>> +    hive->reset_domain = NULL;
>> +
>>       mutex_destroy(&hive->hive_lock);
>>       kfree(hive);
>>   }
>> @@ -392,12 +397,24 @@ struct amdgpu_hive_info 
>> *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>>           goto pro_end;
>>       }
>>   -    hive->reset_domain.wq = 
>> alloc_ordered_workqueue("amdgpu-reset-hive", 0);
>> -    if (!hive->reset_domain.wq) {
>> -        dev_err(adev->dev, "XGMI: failed allocating wq for reset 
>> domain!\n");
>> -        kfree(hive);
>> -        hive = NULL;
>> -        goto pro_end;
>> +    /**
>> +     * Avoid recreating reset domain when hive is reconstructed for 
>> the case
>> +     * of reset the devices in the XGMI hive during probe for SRIOV
>> +     * See https://www.spinics.net/lists/amd-gfx/msg58836.html
>> +     */
>> +    if (adev->reset_domain->type != XGMI_HIVE) {
>> +        hive->reset_domain = 
>> amdgpu_reset_create_reset_domain(XGMI_HIVE, "amdgpu-reset-hive");
>> +            if (!hive->reset_domain) {
>> +                dev_err(adev->dev, "XGMI: failed initializing reset 
>> domain for xgmi hive\n");
>> +                ret = -ENOMEM;
>> +                kobject_put(&hive->kobj);
>> +                kfree(hive);
>> +                hive = NULL;
>> +                goto pro_end;
>> +            }
>> +    } else {
>> + kref_get_unless_zero(&adev->reset_domain->refcount);
>> +        hive->reset_domain = adev->reset_domain;
>
> Suggest to wrap this like -
>     amdgpu_reset_domain_get(reset_domain)
>
> and another like
>     amdgpu_reset_domain_put(reset_domain)



I already use kref_put, kref_get on reset domain so this will be 
confusing  to use same naming for
reset domain creation a bit I think to use it for creation.
I can do those wrappers around the direct usage of kref_put/kref_get


>
> Even smaller wrappers like
>     amdgpu_reset_domain_schedule(reset_domain, reset_work)


This really would be a one line syntactic wrapper but sure


>
> Other than that, looks good to me (need to combine with earlier series 
> as this misses a few other members in reset domain).


It's all because i added this and later patches on top of existing old 
patches since i had a lot of merge conflicts if i put this changes in 
original patches.
See patches 9 and 10 for moving the other members into reset domain.

Andrey


>
> Thanks,
> Lijo
>
>>       }
>>         hive->hive_id = adev->gmc.xgmi.hive_id;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
>> index 2f2ce53645a5..dcaad22be492 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
>> @@ -42,7 +42,7 @@ struct amdgpu_hive_info {
>>           AMDGPU_XGMI_PSTATE_UNKNOWN
>>       } pstate;
>>   -    struct amdgpu_reset_domain reset_domain;
>> +    struct amdgpu_reset_domain *reset_domain;
>>   };
>>     struct amdgpu_pcs_ras_field {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c 
>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>> index b2b40e169342..05e98af30b48 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>> @@ -32,6 +32,8 @@
>>   #include "soc15_common.h"
>>   #include "mxgpu_ai.h"
>>   +#include "amdgpu_reset.h"
>> +
>>   static void xgpu_ai_mailbox_send_ack(struct amdgpu_device *adev)
>>   {
>>       WREG8(AI_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
>> @@ -302,7 +304,7 @@ static int xgpu_ai_mailbox_rcv_irq(struct 
>> amdgpu_device *adev,
>>       switch (event) {
>>           case IDH_FLR_NOTIFICATION:
>>           if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
>> -            WARN_ONCE(!queue_work(adev->reset_domain.wq,
>> +            WARN_ONCE(!queue_work(adev->reset_domain->wq,
>>                             &adev->virt.flr_work),
>>                     "Failed to queue work! at %s",
>>                     __func__);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c 
>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>> index 08411924150d..6e12055f3f4a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>> @@ -31,6 +31,8 @@
>>   #include "soc15_common.h"
>>   #include "mxgpu_nv.h"
>>   +#include "amdgpu_reset.h"
>> +
>>   static void xgpu_nv_mailbox_send_ack(struct amdgpu_device *adev)
>>   {
>>       WREG8(NV_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
>> @@ -337,7 +339,7 @@ static int xgpu_nv_mailbox_rcv_irq(struct 
>> amdgpu_device *adev,
>>       switch (event) {
>>       case IDH_FLR_NOTIFICATION:
>>           if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
>> -            WARN_ONCE(!queue_work(adev->reset_domain.wq,
>> +            WARN_ONCE(!queue_work(adev->reset_domain->wq,
>>                             &adev->virt.flr_work),
>>                     "Failed to queue work! at %s",
>>                     __func__);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c 
>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
>> index 02290febfcf4..fe1570c2146e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
>> @@ -42,6 +42,8 @@
>>   #include "smu/smu_7_1_3_d.h"
>>   #include "mxgpu_vi.h"
>>   +#include "amdgpu_reset.h"
>> +
>>   /* VI golden setting */
>>   static const u32 xgpu_fiji_mgcg_cgcg_init[] = {
>>       mmRLC_CGTT_MGCG_OVERRIDE, 0xffffffff, 0xffffffff,
>> @@ -551,7 +553,7 @@ static int xgpu_vi_mailbox_rcv_irq(struct 
>> amdgpu_device *adev,
>>             /* only handle FLR_NOTIFY now */
>>           if (!r && !amdgpu_in_reset(adev))
>> -            WARN_ONCE(!queue_work(adev->reset_domain.wq,
>> +            WARN_ONCE(!queue_work(adev->reset_domain->wq,
>>                             &adev->virt.flr_work),
>>                     "Failed to queue work! at %s",
>>                     __func__);
>>
