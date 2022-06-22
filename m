Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A49255409D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 04:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FEB10F9FA;
	Wed, 22 Jun 2022 02:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B2E10E51D;
 Wed, 22 Jun 2022 02:41:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wt2Qdu6lRg1GTqCAcgAwb5l08rm4hhnj81VwZOLGf+bcm5isSziq2NGBhzjPjtq/pZwWX2O0Kgb85AR+qBhAj3ohBBerisKOCtLnUxtMVJ+yD5VxW9RsZC8dQnA8h6cnMm8dKHXyDGUJ6vkbk/+pL/oyLU2nArC62/pwR2KOAPWgFiLdCWBN9QKQoy0FAxJ0jm9bMyg/dkpIe6nS9JiAPnWf1WObov+UhYw0pjnvcmJiAbZzQ+jsKPF6UJmgCb1S2mUqNZHyROyL8WCBdKqiFFi4PsB8Vr78MWTcUxYj2rFNPcGHoJja841tl2EMNHn3/ikIdlyyiTwzI4IbIjnaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxUVvRwfbsUSQs/Ie/DQajf7pd5DuKZDfTmes4oCAnY=;
 b=avMlzUVP8DIIlldoPWNJ5qvBQ2Z6Ezi2Pz2Qjic0Xvtmbqa73EGMvb5HXJRCt2auHqdByTINc2PksDTjw96DbO4ITfJ3jwrEVFEKpavYleqOySjCuYphiSN8ivbEY9dAsSVl/eVfdeUZg978cdhcQ67KSPsnAFBHPuaA4tLYmuzX3TMo2qQbVBxYLIGugrTWVZCxZxbGaP1jWp+N63mkAMVCrvQIBcvyEeVq813MLbbXtJW4VhuHXUT5yFE6pfIJZbf01RfIo4MCzJHhi/X8SRd6mGQBuiOgAY7Vn8cZ6u41FkZY6WYr+CZvjMtbz5ohl1no37xOPPVgwBkjEckxIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxUVvRwfbsUSQs/Ie/DQajf7pd5DuKZDfTmes4oCAnY=;
 b=Z3v0192lj52UujIL/b+78Er/zPeAvfodzDlAUwaJdbEANCD+VaybpQKisTAOJ0jM8hXC17rWXkxfYmmNg8AOB4WehMP/auqVMuszZUdlyky1jVHbJJKMx6W0AoJi8JuDEnCLLJo0xcQVimhjtehZ4DyI3kp3Sy+ge+osVhbOIdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR1201MB0220.namprd12.prod.outlook.com (2603:10b6:4:4e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 02:41:09 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 02:41:09 +0000
Message-ID: <354c3f15-1ace-db03-591e-00b70176ec2f@amd.com>
Date: Tue, 21 Jun 2022 22:41:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/5] drm/amdgpu: Prevent race between late signaled fences
 and GPU reset.
Content-Language: en-US
To: "VURDIGERENATARAJ, CHANDAN" <CHANDAN.VURDIGERENATARAJ@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-4-andrey.grodzovsky@amd.com>
 <5b6b623b-9a6b-a615-d7ea-af436f1b4d92@gmail.com>
 <ad87356b-4018-ce95-317a-bfed07b7f745@amd.com>
 <MW4PR12MB56688CDB45612B014D92BA4796B29@MW4PR12MB5668.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <MW4PR12MB56688CDB45612B014D92BA4796B29@MW4PR12MB5668.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0117.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::26) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50b543a6-4dd8-4d61-1a51-08da53f8a9f6
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0220:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0220610B6E0BD66559D71A1EEAB29@DM5PR1201MB0220.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WDcDnTci3Y9NoOH8gtSWl/3BF0nN8HUpZyiZJkr3LMFA7cR6ysjvkRgfd7lYihOwB3ElTEp8NEWXtyGAzE5/K7Jaa02PX8aKefQ2um2gMaNH0FJ4pEPMtfikn2o3ROJnrhrj7H112GykYBX4E/dUqJTplw0MZI/c6MtUYcAVkXgsUZ/HCOZ05IhGNoJ3OymmA+RUFRkoAcPSdOylSz+li9624I5zIG1/LVCh/5rVWnIteTI3ZqZOiBiHH8iIZvfh/aEQSLiyXd+VCUbZ9Im7Nm3dPu6ETYW+oDYHAoHe9hT86a1jSSfZq7L1DIJdY5AEC0yl+yMLIGQGx6HW+gGzVdXiamoDpcqzwSI0FRMUdbVfaDcAYX6PfDed7QBnW9jOiLhHamPyZ9mcusIlyWcbLletOBr4uomZ2pEs7XJu3nouLuFUGpCve3eT/avXVnbkZJFdtmwr2q/ni1vEt1jYuC840pfSriuttFplAF50mnXAYSKnq3qzQSZhexedvIRznL+eLC3yUxDFt9Dm8QfeNGuswB/Bgsgv4m7dvZyuI31rg+y1WkLAZ4IXySJFWkPHYUt5KEDqBExc4ussWpNxd/0HiqEMr9orQ4NQ9uHKswm1TVLUzDh1P+tSHIiR36eE6Br7yXWOLTL4aHAj4995WDeYu9ZYVBJNNGxrje19WXzVM+xxCCddILx5ysPFwfPztOxaQKI96SbVoeEVxUMV0jwVwLwzo34Z258m+5+F+lQQAgfEXKdcHzFQaLdtHS16Q7vHjatwS66Xs7tXjtPiHlF+wfmfzkSSeAE0pjFf+Z5T/TVpOVV4TXbBknzlrNytYbld1dDjOtOF0+5dBCd9zA/3c2o+ROTz9CP4AJ+m8UY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(66574015)(83380400001)(6512007)(86362001)(186003)(38100700002)(6506007)(44832011)(31696002)(31686004)(316002)(66556008)(36756003)(8936002)(53546011)(54906003)(6486002)(4326008)(41300700001)(8676002)(66476007)(2616005)(110136005)(5660300002)(66946007)(478600001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFpDYmdJU2ZmdXZ4R0NObm5mWXFYdUxOY0E0dHFHbHRDcDVndDh0Rnpud2c4?=
 =?utf-8?B?R2JnRXVMZjYzZDNva1RvNnRsc21kcjVjdXdWeTlaZXVqeUphM3pMRGQ0bHFO?=
 =?utf-8?B?N3FCNVVBbHM3cjNYVzlxSXJueCtnS3ZZTTRjS3lyMGJGNmJrcEgzaWJuNzN3?=
 =?utf-8?B?VlRiZzZOUTFqN21BZ241ZWxvakVOdDEvbUxqTjNiN3pXczQ1Nlk1Q0lrOUJq?=
 =?utf-8?B?bGM2NSthV3ZDUmJkamtEaG5aMVVsRGg3NmhjMkg2VHowSWQ0RkJSdWZ0TXRS?=
 =?utf-8?B?cDQzcE5TdjZzaysrcHhObWFFVTFNMlVJZHRocytOREVBOGhYSjlNTFRYMS9X?=
 =?utf-8?B?aTJrMXdQcVlZdUcySFNBTWhRbGpubEVsRmd0OERKUTg0WWMxb2xsMCtQUW9K?=
 =?utf-8?B?REVSZmZzS2UyUzNxa3FQQkpJcUxZUlZKTy9hOExkSjVNcGh5YWtFTjNkdGFP?=
 =?utf-8?B?U1lHandNV2U3c0lyS3Z4MGI1V3k2bjdYOEk3Z3p4U2RERU5hUitwOXExaWgr?=
 =?utf-8?B?VldveE5wd09aZjliWlBrSVBTb2FkNC80T1pyTm5mMW9UT0Mwc2VyWWRrMjNx?=
 =?utf-8?B?N2dKeEF6UVg2cVBySSsyWXJ0SFVaaXE4RytQNmlMVmRvM3dXMkpEa29KOSts?=
 =?utf-8?B?SWplVGZxR05ublphalF3RHlXb3RtNGNXK1ZyRnJXYWd6M2FMelVyYTJNSkFN?=
 =?utf-8?B?L29YOHpFSEpWUklqbHJkU1o2VjNVbkRTYmV2NWpqZkpzWEI0Zll5UXNWakk0?=
 =?utf-8?B?dFdONkorcWUvd3I0L3NzWHJkd2UvR3RUamxXdzd4amNxYkY5S0pycHk2UmNT?=
 =?utf-8?B?dUFGVnAxaFB0eTNDb1p1bDRqYlIyUmtmM1FlYnA0cDNVclVKU041dk5TUks1?=
 =?utf-8?B?eVg2NEEwRTFoMXRmUGtEZE5uRFNPemhqT2hvMFJldUVtaVg0M25WTWxVSllz?=
 =?utf-8?B?aUhqK3RMYXJFOWJJRm1MQ3hGbzRtUTQ0QVJVRHBPanBQeUNHR0psUjl2cjIz?=
 =?utf-8?B?VWNwMml0bXFmejEwRVA4ejVZV0YyeTJ3Q2pSQWFBUkI2Zkpaa0gycnlKdjFo?=
 =?utf-8?B?QU9qQ2xnSEdmSHBuSVFDNDAraE1xaitBZGV6MkNnR1hqS2pmcnF6R3ZIR0Z5?=
 =?utf-8?B?VGlBNGNIcDlpWVdqaUo0am83anNxOGhaL2FzNlVEZkR3ZkZMeFJjK1Nwb1lx?=
 =?utf-8?B?QnNHNEhENEZuWmhrcFNHOGhaRForejdNNHFjQmtMWHJyMU9tSjM5OVBCRjVn?=
 =?utf-8?B?ZDJoZ1VTUWJLcHhsemtEbFNZbFJuTHdQZFVOTFd4VnhUL3REanN6VFVBeWxO?=
 =?utf-8?B?c05Ob09TdW9EN014ZHFmSGRiRDhpeWtUajJjeUhlMW5HazExYld4SGFJMGJp?=
 =?utf-8?B?dXg0UnI4RHRFMnRibCtEbWUxTURaZlVTTmMzampxSHRpRFhmaGZ1cXJ0QUpH?=
 =?utf-8?B?cnVCTjdtSi9DWGROZUdrUVUvckNKdzJlU3IvYU1JdnJ5VEdJUG5xYVlCSG5X?=
 =?utf-8?B?WWVwVVplK1VUN0gvK1RoTEVGM1ByS0lXZE1iak1hRHhZM1RXQ01XNkY5aWxw?=
 =?utf-8?B?SmNGRDh6Z3QxL3Y4RjZOcWhCQjNyUEJ6Zk43NEdpa1MvRHIrRVJKVmFzMm9W?=
 =?utf-8?B?YUN5bUxIRDJRbG96citudjhGMDRSZDMwaFd3cUN5SWFncTRKbkZSNG5lMk9r?=
 =?utf-8?B?SFlSYzhmUnVBeUxGT1IwYjE1aEJaZENFVlJzRGNlU1UvOVpYd2tvekthSUFR?=
 =?utf-8?B?TGFVL2RwYjliNkNLNURMckNmazlFTGswOVBkNlRGUUIrTG9IckZ2R2QzYTdC?=
 =?utf-8?B?djhBcDY1VTZtOFY1VXRWcm9oUEtKa0hVOER5eWhyKzZ4SllIK3ZxeFdyNmFS?=
 =?utf-8?B?b2dpVXdZQ1VaTms1blNZK2dqSHk0SnNQaTM0ZE1oLzFuUHNWSGtyN0JWaVBJ?=
 =?utf-8?B?Q2hOOFZrVmZXVlJZRmIxc0VHYWhJNTlrR0tKQ1NXV3ZrV1g0VmMwQlcyM1NK?=
 =?utf-8?B?d0hCQlhmQjdZYjY5NTEvTHZGRTZZZkNBeHJuZXVWeXZxa0lhcFVCckNXRHJn?=
 =?utf-8?B?RjNuaGlDMUd2dWlPL2RoZi9STWx3b0NpQzZ3Yk95cDQ2YkJWWlZ1RDVTMmpD?=
 =?utf-8?B?Q21PUjBVcjlBS0JVMmk0b3kvb0ZkRmJTWEFWUzk1Tk5LOUMyb0dIWDdpMm9i?=
 =?utf-8?B?WC9CUmh0N1ViMm9ZZkNZdEdObmpiN3RPZzdxQ09RNG5FemtoZE1aVEtJMFNR?=
 =?utf-8?B?TVQva1VvYkduUlJsVmkxRlFJa2d6dUNuenNtS0RDVCtlSG13cVRzSEFPNGlW?=
 =?utf-8?B?RFpJUUo3elg0Q1BFSXpZMlNEUHk3dzdZWFkvTk82VXh2ZjJCekMxY3pERnVq?=
 =?utf-8?Q?s+TIql0t05ztxgbU3c9uPmZss2jYjQtwYoVXJaUwo4JWD?=
X-MS-Exchange-AntiSpam-MessageData-1: oRgJp9hFmkC02g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b543a6-4dd8-4d61-1a51-08da53f8a9f6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 02:41:09.6694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6OHRTa34aVRZ+DSnJIQx9AyMImC0pZnZpNxdHvXmTPsFXvZYrwdp42LOTvXWYcenLwbqIQsVGP8EKSu1nEQ8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0220
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
Cc: "Chen, JingWen \(Wayne\)" <JingWen.Chen2@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>, "Yao,
 Yiqing\(James\)" <YiQing.Yao@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

You have a job in the pending list which is marked as not finished in 
drm_sched_stop 
(https://elixir.bootlin.com/linux/v5.16/source/drivers/gpu/drm/scheduler/sched_main.c#L420), 
s_fence signal cb removed and the job is kept in pending list.
Later you will try to manually clear the HW fence of this job in here 
(https://elixir.bootlin.com/linux/v5.16/source/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c#L4492) 
but the EOP interrupt can fire for that fence exactly at this
moment and you have concurrent access to fence driver's  fence array 
from both amdgpu_process_fence and amdgpu_fence_driver_clear_job_fences 
which is not supposed to happen.Yiqing reported to me a race during 
debugging
we did of the original refcount bug and it looked to me like this 
scenario. Seems to me the EOP ISR handler should be prevented from 
running during this time at least.

Andrey

On 2022-06-21 21:47, VURDIGERENATARAJ, CHANDAN wrote:
> Hi,
>
> Is this a preventive fix or you found errors/oops/hangs?
> If you had found errors/oops/hangs, can you please share the details?
>
> BR,
> Chandan V N
>
>
>> On 2022-06-21 03:25, Christian König wrote:
>>> Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
>>>> Problem:
>>>> After we start handling timed out jobs we assume there fences won't
>>>> be signaled but we cannot be sure and sometimes they fire late. We
>>>> need to prevent concurrent accesses to fence array from
>>>> amdgpu_fence_driver_clear_job_fences during GPU reset and
>>>> amdgpu_fence_process from a late EOP interrupt.
>>>>
>>>> Fix:
>>>> Before accessing fence array in GPU disable EOP interrupt and flush
>>>> all pending interrupt handlers for amdgpu device's interrupt line.
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 26
>>>> ++++++++++++++++++++++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  1 +
>>>>    3 files changed, 31 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 2b92281dd0c1..c99541685804 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -4605,6 +4605,8 @@ int amdgpu_device_pre_asic_reset(struct
>>>> amdgpu_device *adev,
>>>>            amdgpu_virt_fini_data_exchange(adev);
>>>>        }
>>>>    +    amdgpu_fence_driver_isr_toggle(adev, true);
>>>> +
>>>>        /* block all schedulers and reset given job's ring */
>>>>        for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>>>            struct amdgpu_ring *ring = adev->rings[i]; @@ -4620,6
>>>> +4622,8 @@ int amdgpu_device_pre_asic_reset(struct
>>>> amdgpu_device *adev,
>>>>            amdgpu_fence_driver_force_completion(ring);
>>>>        }
>>>>    +    amdgpu_fence_driver_isr_toggle(adev, false);
>>>> +
>>>>        if (job && job->vm)
>>>>            drm_sched_increase_karma(&job->base);
>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> index a9ae3beaa1d3..d6d54ba4c185 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> @@ -532,6 +532,32 @@ void amdgpu_fence_driver_hw_fini(struct
>>>> amdgpu_device *adev)
>>>>        }
>>>>    }
>>>>    +void amdgpu_fence_driver_isr_toggle(struct amdgpu_device *adev,
>>>> bool stop)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>>>> +        struct amdgpu_ring *ring = adev->rings[i];
>>>> +
>>>> +        if (!ring || !ring->fence_drv.initialized ||
>>>> !ring->fence_drv.irq_src)
>>>> +            continue;
>>>> +
>>>> +        if (stop)
>>>> +            amdgpu_irq_put(adev, ring->fence_drv.irq_src,
>>>> +                           ring->fence_drv.irq_type);
>>>> +        else
>>>> +            amdgpu_irq_get(adev, ring->fence_drv.irq_src,
>>>> +                    ring->fence_drv.irq_type);
>>> That won't work like this. This increments/decrements the reference
>>> count for the IRQ, but doesn't guarantee in any way that they are
>>> stopped/started.
>>
>> I understand that, i just assumed that the fence driver is the only holder of this interrupt source (e.g. regCP_INT_CNTL_RING0) ?
>> I can disable amdgpu interrupt line totally using disable_irq - would this be better ?
>>
>>
>>>
>>>> +    }
>>>> +
>>>> +    /* TODO Only waits for irq handlers on other CPUs, maybe
>>>> local_irq_save
>>>> +     * local_irq_local_irq_restore are needed here for local
>>>> interrupts ?
>>>> +     *
>>>> +     */
>>> Well that comment made me smile. Think for a moment what the local CPU
>>> would be doing if an interrupt would run :)
>>
>> No, I understand this of course, I am ok to be interrupted by interrupt handler at this point, what i am trying to do is to prevent amdgpu_fence_process to run concurrently with amdgpu_fence_driver_clear_job_fences - that is what this function is trying to prevent - i disable and >flush pending EOP ISR handlers before the call to clear fences and re-enable after.
>> I guess we can also introduce a spinlock to serialize them ? Yiqing reported seeing a race between them so we have to do something.
>>
>> Andrey
>>
>>
>>> Cheers,
>>> Christian.
>>>
>>>> +    if (stop)
>>>> +        synchronize_irq(adev->irq.irq); }
>>>> +
>>>>    void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>>>>    {
>>>>        unsigned int i, j;
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> index 7d89a52091c0..82c178a9033a 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> @@ -143,6 +143,7 @@ signed long amdgpu_fence_wait_polling(struct
>>>> amdgpu_ring *ring,
>>>>                          uint32_t wait_seq,
>>>>                          signed long timeout);
>>>>    unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring);
>>>> +void amdgpu_fence_driver_isr_toggle(struct amdgpu_device *adev, bool
>>>> stop);
>>>>      /*
>>>>     * Rings.
