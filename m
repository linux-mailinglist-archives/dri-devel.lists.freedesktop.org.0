Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99077A9153
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 05:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351CE10E0A5;
	Thu, 21 Sep 2023 03:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91B710E0A2;
 Thu, 21 Sep 2023 03:41:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIj1H/hYHIZpXzPacGJ8mkmhxqQ0vtal6xVB9NmVC4w29DMOlsaepU3euXx1yrZ38xJnXq3YHCzV1A9k6rOlMkRMeeWKj/VfRHL4vekn853nEv0ezyJtqMeNcMyshorOGPve73ZuRUv8N/CVJn2Ig6UOt+lqnX9cxHZHoA5ZFRohP0XCaTDHCxwM40D7ELB9Gmk5vmyLMkq+mCgdO5TixyInXlPftIo+nMTTCNfhx5PqKBQ3iq+qYAZrM5xS9Moft/mFKA9/K/Ew+K4C2EuTOzVpvIKJmu/Dbvj5+Hm4Mtcim9qLXVayuCjK64rlUEz2RcJF2fml39PSlU/yc/m7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTR5cHpdead0lghTk/KrrwD3dcJ5ZBZenfj9G0VHwWM=;
 b=Bf0SLA+7Bn4nt2Qi+3evFhoj4a/asA17NwHPDgdxOXaEXWiImnNQskMwp4mZ+TxapyOLTufLQt2NLyy/Qlm8FuJnHJprtjn8XWS0qSQmuow5oDzt3mx2rcfSFGhicXMeSXcfoGcTK1nrpVM8o7rKPMrSwTbqKn1ECU8dHuRyE1za7ojYNGM82VoZ/iF6FBcg6rcqseKpEmzsGRSY5drJgm2aIA2dC8xklIENuRrDQXNaapE+ZITWbhCtPKQ74+NpHaEAbaXN8+V0WRj2HQAqi9fNr1ETaNlsN2OkxP0j+3cENM1vNvpGTjLg50II5TNM5ZrT9goYx/p1c9VG4ksNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTR5cHpdead0lghTk/KrrwD3dcJ5ZBZenfj9G0VHwWM=;
 b=hvp1xbqTurrwF3njFs+40sn5ufY6G5LV4GKwIP5qD23z/kcalkhUNvg/zvI81RqSVedmZ0Of+TUTiac/7i7EX6rtNfEJ1+Yy+zbHBq9QLkVXnPo5cKypLtg38dYyDSvtgjgAR69wlRMJ6dx0mXbB8qjifuf/vKwayGtwmWGIw24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS0PR12MB7946.namprd12.prod.outlook.com (2603:10b6:8:151::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.23; Thu, 21 Sep 2023 03:41:12 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 21 Sep 2023
 03:41:12 +0000
Message-ID: <e582e99b-c481-4ff4-92a4-1d08da80d509@amd.com>
Date: Wed, 20 Sep 2023 23:41:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.2
Subject: Re: [PATCH v4 01/10] drm/sched: Add drm_sched_submit_* helpers
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-2-matthew.brost@intel.com>
 <8765a827-accf-2498-74a2-62fe561badb7@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <8765a827-accf-2498-74a2-62fe561badb7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::16)
 To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS0PR12MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: 203f73b0-0b32-4128-a674-08dbba549981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1ifEuYVP3TpclkqO6MIvyNQODSC1L2dm8HoHylUdxL0VG2hnCghkix7Rj5sZ8moaUzTWlvpIAXEJQSZnPWAHN+9xdSAlkzXm2GD3kXZCYxM+P39Lp6kXs36Q8Khkvii+CFzbdUuz5LVY8IA1Vg6fBA9SEvRT3bb/q4PVBIM854FFFDH2LT8jNQ+5cANQEogMgab5axMQxFXfB6hZJe9JtObCzErZMDQxgCIMKNkyFAI+z/lb5KD6XZXdgiWgOXmRelGaHuM2Vgdmqgt7FURv/MpqGnwL2JUaDIot7SV0pTA3z5nRbDIHA57z7KxM7vpwmlR4vG5F/blbtOCR+0xgnJIz1Mrhvlp5UcY+QEoXRkNO9JXXi1MAEUixM/RCAAbYApKOLNsLzUv3Bow02Ux3gh6w4CpQhF6UYhxuKr44l2BSFkM5fr2WVsTE3UH8lF3ZZuzudTmVVrBFSMNQ66HxWYMns94TTWXClQc8ikeHmQZUqq1zJza7NExKEMFEE9PZVY4ymzPFRVF3mFqUPzwR3tw/NjDSIECWch0uIL4P2fEVs7HhES8eb6hbGI6W9bynX58jOixahh7AAHiEoB6NIc67JO+5iX2cZMbZTkY/z9q0eB7r5UqRjdr6Ke3RK4kztYdbAWS+5abjrZLXZPzqgRIJzDzKS+5Got5VrBdJ6jZSC1llvhSAIy+87u2rBiS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(1800799009)(186009)(451199024)(478600001)(66574015)(83380400001)(6512007)(8936002)(26005)(2616005)(41300700001)(110136005)(316002)(7416002)(4326008)(44832011)(66476007)(5660300002)(66556008)(66946007)(6666004)(53546011)(2906002)(6506007)(8676002)(6486002)(86362001)(36756003)(38100700002)(31686004)(31696002)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzUzVzVFaGlnMkRLeFM5Q3MxejhSSFFKM3UvRjFzSWZ6N0dYWU5MZEFDK0N0?=
 =?utf-8?B?Y3U0Vm1rYU91bGVoNGpPWDBlUWw0Y3NoUGs2UVQrWnNUQW93ckVXUE5ZVFBM?=
 =?utf-8?B?QjU4L0IvSEdScTFZZWFDRVJ1d0dmb1daWGJDN1BDc2R2QmhIVGZvcks4c3Nv?=
 =?utf-8?B?dEx3dFhITnh2VzFxRUJMMDk0VnBwa2NWVXdRd21idXdoZUpPSTQyRjUwdGNH?=
 =?utf-8?B?c2xkSXdkU0NzbzRoOFdKamZCNTd2Q1BXTkxOVmc0NlpWNHJDV2NPT2o4UkxJ?=
 =?utf-8?B?WG92MkZsZVpPViszQmp2ejBBVlYwRzhJQkVnQTZuUzhiUVBuVS9QK3BEUzVF?=
 =?utf-8?B?aWg5TWN4d3VKMFd5TlU0UXRwWFJINmxoWGoxejVzNTZiV3dwWlF3eXNjcFU3?=
 =?utf-8?B?QTBBSmpYOVJKNmlCUlN5YnBQVitVZnU5ZWUvMTRxK1pweWpsM0dqczFqKysw?=
 =?utf-8?B?SHFhZktYRUtOMk1VREpCMkQ0VkQ2WFk5d1A5NmNxUktZVFdpTGZScVZGU0ZM?=
 =?utf-8?B?VzdLL3E0bCtsd3AvM3Baa1F2MWRnUSszWGFJSjlTeSt3alplSmJ0QnRqaG5E?=
 =?utf-8?B?QVcxSkZLS1VhbUt6RGcvQktKOWUzakljbVVQVjVmZnkrNE5MdTFqZE9MY0Rn?=
 =?utf-8?B?V3VWeGpMMXkvN2x1cVRuVHVwUFZLNlJDWVRBWG1mMnowYktadlIwb3NHNGVK?=
 =?utf-8?B?dndDcXF4c0Y4TXZYWmphSkF6bng5bkFId2pvQkFXMTRPMGkvL1JaS1RDSkZQ?=
 =?utf-8?B?NUlralgvdXN1R0R0M1pHODRqK3hwdkxPM2ZGRElFTFNpRFlNVnJIS2lKWlBo?=
 =?utf-8?B?cVVLMHZRVjAwQnp5WDRNcUVxUFdDck84MjRpQ0U4TmF3cXJiVEdTd0VZMGJF?=
 =?utf-8?B?a2xsNFlYQTFkTWRUU0lhOC9uRVZUY0k5cnV1aVo0WjNLdGRvdXNZbmFWeVFZ?=
 =?utf-8?B?ZlJZa25ZdzBVWndtd0t1ZkdLeUUvVTBrYXFPR21wNWpZNmlEank4Vnl1Mm83?=
 =?utf-8?B?Z0M5N0F3NmtxUEY3WFE4SXZPZisrSE9zMjFYMEFvZE5kZ25Jbk9ybXpjZWJK?=
 =?utf-8?B?K01lUE5ReFJXOHQ1S2JUUGZienpvOHpuSTZzVVlhemZPWXpBU2xjUlNEQjB1?=
 =?utf-8?B?OXgwS24vM1c1NXlrWFYzd015elRQbFpJdWlSYXFtdXFCZklBMjNOQlVZOFRG?=
 =?utf-8?B?R0x4MmhtM1B3aDVjMDdvRzZSb3IwTmJMd1hpSFJpcU9nOHQxNkRKL0FqR21z?=
 =?utf-8?B?bE03dlZia3QzSmU2c1Z2ZWp3b1FZQnpoTnB6akdaOEl6KzBIOGIyaE1kNkM4?=
 =?utf-8?B?MlZHeENaYllwVEdMNFhubWx4bzNtRWFxQ1h5Tjg5M1V0VERGMGNzbTNoOWlG?=
 =?utf-8?B?ekZPNW0zTjlkL1piU1BYSmV0a2ZIMy9ZUWlyNlgzR1BTS0ZGMnlpeTVjMkVN?=
 =?utf-8?B?ZXJobjB4SDVTMncxTkN4Z0E3Q2J2TEI5cmZQVGFzeUN6bTl6a1FUTkdRVUxB?=
 =?utf-8?B?OVNjNnRDbkNhWk1QTUlQTWxHRFZhZ3lKY3k2bHB1azV3aWF6bGhtYlV4bFZ5?=
 =?utf-8?B?aVhMZVNUaVAzQjNQSnVmNEFZdFBRRTVzbGtpWUNISWhUd2hzWVdGK2pzbmVu?=
 =?utf-8?B?RERGa1g3WFlhdzhYRWVrc0FCUzlsL3dLMHpGMVdFVVBUSUFjbndsVGxOUzVn?=
 =?utf-8?B?V2FPTWFhOUVmY2I3TGNMWlBnNnJCWXBUSVFhQy9mU3dtOVRQMkFnWWZvNGwv?=
 =?utf-8?B?RHdVNnBYMWFTTnRnUEhOZThSZXpWUE1UQXQvYU1qVnV4NERGSXFyRkNlamx5?=
 =?utf-8?B?bEcwMWwra0JzK2lGVVNwQWZRbGtQc3hwcDFYNnROM1Q5ZlhRcm5nMkZpTU9E?=
 =?utf-8?B?Skd5Rnh2eUVZS3F3TXVWWEZ4VmdjdTVLazUrVm93NGlRNWtMQ3JnYTdXU0Zl?=
 =?utf-8?B?Tmhtb3ltTm4xdXhMYXJhR2hFTDJmZTFraGVrS0NtYkVSN2tPbE52Mk9hWjA1?=
 =?utf-8?B?ZSs0eU9mNnNtcDZjbzhUeHZDemJKRU8zeGpoeVd4K2xyOWYveDRPZ2dQMW1Q?=
 =?utf-8?B?a2Q0UTdHSXdqM1VwT2d1dTFPbjdKNlUzRFI5NEw2RVltNDhCTHA4ZVFuREpl?=
 =?utf-8?Q?lXjpxhmhAmYzjR1rET9XWbo06?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203f73b0-0b32-4128-a674-08dbba549981
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 03:41:12.1712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipwHA5h3Vh5qdf9Alf/r0r1GloVP4EO8Sm8ZjJG4CtClZQ8+wWldh+Zg/Hty0jPt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7946
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-19 01:58, Christian König wrote:
> Am 19.09.23 um 07:01 schrieb Matthew Brost:
>> Add scheduler submit ready, stop, and start helpers to hide the
>> implementation details of the scheduler from the drivers.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com> for this one.
> 
> No idea when I have time to look into the rest :( But Luben should take 
> a look.

Hi Christian,

Yes, I'll finish up with v3 and v4 tomorrow morning and afternoon.

Regards,
Luben

> 
> Regards,
> Christian
> 
>> ---
>>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 15 +++----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 12 +++---
>>   drivers/gpu/drm/msm/adreno/adreno_device.c    |  6 ++-
>>   drivers/gpu/drm/scheduler/sched_main.c        | 40 ++++++++++++++++++-
>>   include/drm/gpu_scheduler.h                   |  3 ++
>>   6 files changed, 60 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
>> index 625db444df1c..36a1accbc846 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
>> @@ -290,7 +290,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
>>   	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
>>   		struct amdgpu_ring *ring = &adev->gfx.compute_ring[i];
>>   
>> -		if (!(ring && ring->sched.thread))
>> +		if (!(ring && drm_sched_submit_ready(&ring->sched)))
>>   			continue;
>>   
>>   		/* stop secheduler and drain ring. */
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> index a4faea4fa0b5..fb5dad687168 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> @@ -1659,9 +1659,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>>   	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>>   		struct amdgpu_ring *ring = adev->rings[i];
>>   
>> -		if (!ring || !ring->sched.thread)
>> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>>   			continue;
>> -		kthread_park(ring->sched.thread);
>> +		drm_sched_submit_stop(&ring->sched);
>>   	}
>>   
>>   	seq_puts(m, "run ib test:\n");
>> @@ -1675,9 +1675,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>>   	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>>   		struct amdgpu_ring *ring = adev->rings[i];
>>   
>> -		if (!ring || !ring->sched.thread)
>> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>>   			continue;
>> -		kthread_unpark(ring->sched.thread);
>> +		drm_sched_submit_start(&ring->sched);
>>   	}
>>   
>>   	up_write(&adev->reset_domain->sem);
>> @@ -1897,7 +1897,8 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>>   
>>   	ring = adev->rings[val];
>>   
>> -	if (!ring || !ring->funcs->preempt_ib || !ring->sched.thread)
>> +	if (!ring || !ring->funcs->preempt_ib ||
>> +	    !drm_sched_submit_ready(&ring->sched))
>>   		return -EINVAL;
>>   
>>   	/* the last preemption failed */
>> @@ -1915,7 +1916,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>>   		goto pro_end;
>>   
>>   	/* stop the scheduler */
>> -	kthread_park(ring->sched.thread);
>> +	drm_sched_submit_stop(&ring->sched);
>>   
>>   	/* preempt the IB */
>>   	r = amdgpu_ring_preempt_ib(ring);
>> @@ -1949,7 +1950,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>>   
>>   failure:
>>   	/* restart the scheduler */
>> -	kthread_unpark(ring->sched.thread);
>> +	drm_sched_submit_start(&ring->sched);
>>   
>>   	up_read(&adev->reset_domain->sem);
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 30c4f5cca02c..e366f61c3aed 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4588,7 +4588,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
>>   	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>   		struct amdgpu_ring *ring = adev->rings[i];
>>   
>> -		if (!ring || !ring->sched.thread)
>> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>>   			continue;
>>   
>>   		spin_lock(&ring->sched.job_list_lock);
>> @@ -4727,7 +4727,7 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>>   	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>   		struct amdgpu_ring *ring = adev->rings[i];
>>   
>> -		if (!ring || !ring->sched.thread)
>> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>>   			continue;
>>   
>>   		/* Clear job fence from fence drv to avoid force_completion
>> @@ -5266,7 +5266,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>   		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>   			struct amdgpu_ring *ring = tmp_adev->rings[i];
>>   
>> -			if (!ring || !ring->sched.thread)
>> +			if (!ring || !drm_sched_submit_ready(&ring->sched))
>>   				continue;
>>   
>>   			drm_sched_stop(&ring->sched, job ? &job->base : NULL);
>> @@ -5341,7 +5341,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>   		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>   			struct amdgpu_ring *ring = tmp_adev->rings[i];
>>   
>> -			if (!ring || !ring->sched.thread)
>> +			if (!ring || !drm_sched_submit_ready(&ring->sched))
>>   				continue;
>>   
>>   			drm_sched_start(&ring->sched, true);
>> @@ -5667,7 +5667,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
>>   		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>   			struct amdgpu_ring *ring = adev->rings[i];
>>   
>> -			if (!ring || !ring->sched.thread)
>> +			if (!ring || !drm_sched_submit_ready(&ring->sched))
>>   				continue;
>>   
>>   			drm_sched_stop(&ring->sched, NULL);
>> @@ -5795,7 +5795,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
>>   	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>   		struct amdgpu_ring *ring = adev->rings[i];
>>   
>> -		if (!ring || !ring->sched.thread)
>> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>>   			continue;
>>   
>>   		drm_sched_start(&ring->sched, true);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index fa527935ffd4..e046dc5ff72a 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -809,7 +809,8 @@ static void suspend_scheduler(struct msm_gpu *gpu)
>>   	 */
>>   	for (i = 0; i < gpu->nr_rings; i++) {
>>   		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
>> -		kthread_park(sched->thread);
>> +
>> +		drm_sched_submit_stop(sched);
>>   	}
>>   }
>>   
>> @@ -819,7 +820,8 @@ static void resume_scheduler(struct msm_gpu *gpu)
>>   
>>   	for (i = 0; i < gpu->nr_rings; i++) {
>>   		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
>> -		kthread_unpark(sched->thread);
>> +
>> +		drm_sched_submit_start(sched);
>>   	}
>>   }
>>   
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 506371c42745..e4fa62abca41 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -439,7 +439,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>   {
>>   	struct drm_sched_job *s_job, *tmp;
>>   
>> -	kthread_park(sched->thread);
>> +	drm_sched_submit_stop(sched);
>>   
>>   	/*
>>   	 * Reinsert back the bad job here - now it's safe as
>> @@ -552,7 +552,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>>   		spin_unlock(&sched->job_list_lock);
>>   	}
>>   
>> -	kthread_unpark(sched->thread);
>> +	drm_sched_submit_start(sched);
>>   }
>>   EXPORT_SYMBOL(drm_sched_start);
>>   
>> @@ -1206,3 +1206,39 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>>   	}
>>   }
>>   EXPORT_SYMBOL(drm_sched_increase_karma);
>> +
>> +/**
>> + * drm_sched_submit_ready - scheduler ready for submission
>> + *
>> + * @sched: scheduler instance
>> + *
>> + * Returns true if submission is ready
>> + */
>> +bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched)
>> +{
>> +	return !!sched->thread;
>> +
>> +}
>> +EXPORT_SYMBOL(drm_sched_submit_ready);
>> +
>> +/**
>> + * drm_sched_submit_stop - stop scheduler submission
>> + *
>> + * @sched: scheduler instance
>> + */
>> +void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>> +{
>> +	kthread_park(sched->thread);
>> +}
>> +EXPORT_SYMBOL(drm_sched_submit_stop);
>> +
>> +/**
>> + * drm_sched_submit_start - start scheduler submission
>> + *
>> + * @sched: scheduler instance
>> + */
>> +void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>> +{
>> +	kthread_unpark(sched->thread);
>> +}
>> +EXPORT_SYMBOL(drm_sched_submit_start);
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index f9544d9b670d..f12c5aea5294 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -550,6 +550,9 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>   
>>   void drm_sched_job_cleanup(struct drm_sched_job *job);
>>   void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
>> +bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);
>> +void drm_sched_submit_stop(struct drm_gpu_scheduler *sched);
>> +void drm_sched_submit_start(struct drm_gpu_scheduler *sched);
>>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>>   void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
>>   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
> 

-- 
Regards,
Luben

