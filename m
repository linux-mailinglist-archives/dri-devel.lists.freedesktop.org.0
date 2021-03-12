Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A927B3384D2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 06:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF946E0DE;
	Fri, 12 Mar 2021 05:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50046E0DE;
 Fri, 12 Mar 2021 05:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XD2JMb6myKaSw8Mwmhb1d15WcNYQ+Nonv4UPzoLs3ASvA7H8EknaTo72Bzb+ueZY7S6yWZIg+bLYrRrlpcLaL4WWI69kny8Dmg4VwuFS2XvhWpjmCwwikK3ydHbyd4/m4/wMoHrBSLzsFVubpIkR+uc6SMwS4bo+v7JNeSw+8c3K/4javggj1UcjIP3dSrNJD6ALeiDzKDdKmkmrqttDHO4Z8J9aqac5UgC2swUCOUNAhrV/Q86FuyIQMO/KDr3nfMvWDjAQGAOgkATpoCWYZl7G7+pCUA50btXvOTBwme4rxfC3IQE3DgiSC6UHnWQE63dOqiGtml42lpPQZzh8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcAIhpJtnSY+Yjc9lk5x9URmZBs3Hm/bYQ2pRzhGzUc=;
 b=LhP/4BhHxmimvV3xwxMoffpo1MfUiNun1k3jwxxmBJW++dlKEYVjhpbZTxafRU/qtJNRB3CQAUufCXXy0VJzaFw5+B0MVnaxe592qR3GXWol9Q0gQoj+R6oL91cfJhEW4N0FHSx8FMgxsqQmFNgkBy7NXwFwfu2ZcmY/DdDmt7dZ/Cxe56ogGUveoTWpY3e6st+n2uwGfIQ1Qsxd0Zv8ValchTFt98Kua3amBllYvdNneVivXMebMs/IUAI0F90u3QIjZAtsp909i3+9k7ICIT6QVSauaxCC0+BbbKwbwTR16K0DOHrK+JmHwRoVEMIoxwYeY56TnpsE1ikBos+1mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcAIhpJtnSY+Yjc9lk5x9URmZBs3Hm/bYQ2pRzhGzUc=;
 b=2+5I+9XMI1u3B3vPpvEbcILKetbKhxQISKM9t6XOUKCwhiUwg+05ZsfsglAeE4WQ9cSZVPlvxr/ATGCo1XqVEACes2C9S8tAv613BwvG8IWtY4LFVcW+9wMyvDGty4b3xfIwsN/eLkd5pOCZ6DTlsrl+m7QXgpcJzFL9x/h1olc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4541.namprd12.prod.outlook.com (2603:10b6:806:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 05:04:23 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 05:04:23 +0000
Subject: Re: [PATCH] drm/scheduler re-insert Bailing job to avoid memleak
To: Alex Deucher <alexdeucher@gmail.com>, Jack Zhang <Jack.Zhang1@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <20210312035746.1089855-1-Jack.Zhang1@amd.com>
 <CADnq5_N88ahLAz2w=OgFU3vv7zX8uupW+_GzsHcLrqVbPoURUA@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <d1e2d40a-095d-a44f-3ce2-f8eae50751ec@amd.com>
Date: Fri, 12 Mar 2021 00:04:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CADnq5_N88ahLAz2w=OgFU3vv7zX8uupW+_GzsHcLrqVbPoURUA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:9d0c:37c8:e184:bbaa]
X-ClientProxiedBy: YTOPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::17) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:9d0c:37c8:e184:bbaa]
 (2607:fea8:3edf:49b0:9d0c:37c8:e184:bbaa) by
 YTOPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend
 Transport; Fri, 12 Mar 2021 05:04:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 083cd3fe-6347-46e2-56fc-08d8e5144d4f
X-MS-TrafficTypeDiagnostic: SA0PR12MB4541:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45415904BAA041DBBC041A86EA6F9@SA0PR12MB4541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o8gNKswG89JcawDvokzk3OmxIIJwzRNQM+9yj5GwJf73FhHCXjKFhbTWACbsXJvRBXSkS313rQsVv/38RHkOVgeF3FEA8iZwzwNrJxqVmG098wZ851W9FA6SiLbL92rQekRIRJ3m++EsfmSjcuQqlhTjYzM5laArQCvfS3v+p20sI4jyuWoeLAAZK84Ccpqa6kak8LmIphyWtWQXLuaTEgtGuJQ8t1JfPIuyOBEMhDw2MJ2vjnlsxv/D8nNCUQrUIvbBgucRErdd7IqYrN9lZ1fLPemufF7w3otkwBKDGaUq7iJXWNiGpeCR4mJKe/CAOUgkT4dhwO6H65tUh8N5SxYr9DWSB7FVARRbV4qPUqVUnX7+1/0p2wRDGwHi7cZaso9H1MkJcC89MKPBS58SKwzXHsNnflYCPI40maUbLlBR5FuYwf5ZC8RkJf4kuXo/F0mH9mSNs7wdKhvFUD4HpWEr2ZHYVD/US9alAQtjE9V50ZKgbtmU31hf07s3ak9YhGCHwEVZcXfnWdXR02XbL20/vVuHgVESi+1igWPYEa/QD5cmGHJAwvsb4Jcj1cSAvBC2wT1iY3BzU4STuV4OyvFlrSAiLuhwJz3T7t1RrvwTnUDazCYTTm6AFVt7l7qzZBKFlMNRR2q7/YeRQ68aPbLwgR378w8uiOZOBRvMvWIbydwYGufpUn0pf6a5tWdD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(66556008)(478600001)(45080400002)(5660300002)(966005)(8676002)(16526019)(8936002)(316002)(186003)(54906003)(110136005)(53546011)(66946007)(4326008)(66476007)(44832011)(2616005)(2906002)(31696002)(36756003)(6486002)(86362001)(83380400001)(31686004)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cUNXZk5nd3AwaGY5dVR5bE9tWHlJdVlhakxxejdsNGJaSnMrK3lhT01tcTZ6?=
 =?utf-8?B?dlFzMjk3ZktYSU5kV3ZOOWVoZFMvRHFFN3ZHenBqd0tXZEtZWVJ2RWtQSmZZ?=
 =?utf-8?B?TGczK0JLc2gvTnh4OTZad3Q0R013NXpZTThZNngzWVhPamdIS1V1cmJrZEsz?=
 =?utf-8?B?N2ZMZTd6ZjQzMzhhY2ZTK0dOTURlZ1FnMmhCcGpaNzhTRlZhZ0RFZFZ5OURX?=
 =?utf-8?B?a2RzZkx2SnVkekxJdG9vaU9LRTJ0U1hSdXQ5VmF5UUVPNVFyeExvaUY5dkxY?=
 =?utf-8?B?ZmliL2h6d0lXUUdINlh4WHJ3ZkFsYjNVUW5ISm9NN2NzL2s1eHNtTWU4UjUw?=
 =?utf-8?B?T210RCs5ZzN0ek9mdjlMUjBKRFdIanpYdGlJSlJpeFJVZWxlKzNOZmF2WmF6?=
 =?utf-8?B?Wk1GU3hiNGFhOEVTVUdlMk9DM1F3WGV2bFR3eVFSc3VDcEViNCtEeFJ2U2Vr?=
 =?utf-8?B?NXhvTUsvb2g3dkVMZVZadXlFdU9jaDlGcTEyTk9pZWhtMDBjNS9PZk1UVTRB?=
 =?utf-8?B?WnBNa3RzTG5HUlJ2QjB6Ymo0OEhWdW5EVnhpRWRiNm9aQmQyVHc2MmNrRlIy?=
 =?utf-8?B?NUNzb3Q5YndxN1l4N1BIQjlTMiszS3VXTExlYmFOd1RNT2ZVUkdmUG9sWE52?=
 =?utf-8?B?U3hsSFlXS3pZL1lSN3J0dllFNTBOTG1mZWt5bDA2cVZOZW1aWkZtdmNSQTFR?=
 =?utf-8?B?Wjg1MXE4WjIxWWJzeGcraE9ZUHV0V2t6RDlKYTZLMGU1TFV6VSsxeTJQWXFO?=
 =?utf-8?B?TTZiY0VOR1pkYW8yeWZFN2dPOWNhMmxGNmFuc0ZXYjFwb3ZMcGJZSi8rRk1V?=
 =?utf-8?B?VWt1cWw5M3VWOVpRMTlsLzNUVVZ2c0o4YzIyUjI2YmE4WnA2cnVkcWdzRnlj?=
 =?utf-8?B?dFcrWSthUlhBbnRoWlYrbXVxcXE2aEdjUmE4aWFFMUp3MGtBWEwzZ3BVZjNQ?=
 =?utf-8?B?Y3lOTGErUGNNMnBXME9mc3hqMUI5RDZGMzBVVkxPRlRON0FMNmk2Y053NlhW?=
 =?utf-8?B?aHU5KzRUVUFvTlNqQ0RvTVJpMUE3UnhTMFFCYVFESWFoT1FBQXUyVWlNNzlG?=
 =?utf-8?B?L1NOS1o5dk9mUk9KcGFtLzIySGNuRVVFQkN2SThTc016bVJhVUlINTNBUW9G?=
 =?utf-8?B?OEZWaEUzK2lSS0RqWDkxemtzOWtwa0x2QnlmYXFyNTRuNjJKSjVqcEZqV2Zn?=
 =?utf-8?B?dkN2Y0dHUU95Y2hscVNKdThSUUlza2NiL0FUY0hqVjlDc1JwWWJubGx0SEtj?=
 =?utf-8?B?V0ZBUUU2ck5MQ2JGRzZYOWpPV0tYVkdhUVRUM29POG81RW84bnE0TXZMNW9S?=
 =?utf-8?B?NFNnM3BnNG9jOWdoNXY4RnZxZEV2TklGYm4yNXl0TkNrNjA3aWk3bGp5OTFM?=
 =?utf-8?B?ZHIyeExkTTM4V0Y0MFdUR0NPcGx6NkJBYUlheS9aSDVqaG5Ud2xGT2JGTzlI?=
 =?utf-8?B?bGRTVlZWdmtEZzNDN1Brd2d6dUs2ZC9JV0ZoNzN6aFk2QUVTT2Y4S0lmZEVD?=
 =?utf-8?B?TUNwdHZpSmk3VjA2TnhVSmx1N25jSEg2OWFuakFXZ0w5TmQ4M1h1N2VHbTB1?=
 =?utf-8?B?QXhMUWdYVFlGK0ZQTHU4aDNxb0FHSXhoZnQyODNpeXNDVmlsT3djUXlCNDcw?=
 =?utf-8?B?TEIvUnlJODZmdy9GZFFNWUV3amtKaEVjV3liVktIaE12UmtObzNPall3Z0VU?=
 =?utf-8?B?NnMwRjlFUTM5bW5TSmFSS3YrbzlIK1kwRnROK3p3L2drRi9Ic0Vnd2V0RUN6?=
 =?utf-8?B?dzFCYXpUVVZGVVdUM0ZIbDYwd0dSYnlKc2JDOWtqWmxhdnN5TzNjSzNhVUMz?=
 =?utf-8?B?bnAxWFFFQWxCUVlXUGtCNDlEUUVyRUhiQXI3WUUwTkpCbUpyekxPOThKVlJ3?=
 =?utf-8?Q?3dBm/Ro1a+fMK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 083cd3fe-6347-46e2-56fc-08d8e5144d4f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 05:04:23.3726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfpyNXUqiCxNeDsGZlx+ULr9czigXWhwRsUf/duW7h8sE3CSSN2QsmJb++RgdhoazqAhwV4wRd29j2WBEaChWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4541
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
Cc: "monk.liu" <Monk.Liu@amd.com>, Emily Deng <Emily.Deng@amd.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check panfrost driver at panfrost_scheduler_stop,
and panfrost_job_timedout - they also terminate prematurely
in both places so probably worth adding this there too.

Andrey

On 2021-03-11 11:13 p.m., Alex Deucher wrote:
> +dri-devel
> 
> Please be sure to cc dri-devel when you send out gpu scheduler patches.
> 
> On Thu, Mar 11, 2021 at 10:57 PM Jack Zhang <Jack.Zhang1@amd.com> wrote:
>>
>> re-insert Bailing jobs to avoid memory leak.
>>
>> Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 ++++++--
>>   drivers/gpu/drm/scheduler/sched_main.c     | 8 +++++++-
>>   include/drm/gpu_scheduler.h                | 1 +
>>   4 files changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 79b9cc73763f..86463b0f936e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4815,8 +4815,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>                                          job ? job->base.id : -1);
>>
>>                  /* even we skipped this reset, still need to set the job to guilty */
>> -               if (job)
>> +               if (job) {
>>                          drm_sched_increase_karma(&job->base);
>> +                       r = DRM_GPU_SCHED_STAT_BAILING;
>> +               }
>>                  goto skip_recovery;
>>          }
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index 759b34799221..41390bdacd9e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -34,6 +34,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>>          struct amdgpu_job *job = to_amdgpu_job(s_job);
>>          struct amdgpu_task_info ti;
>>          struct amdgpu_device *adev = ring->adev;
>> +       int ret;
>>
>>          memset(&ti, 0, sizeof(struct amdgpu_task_info));
>>
>> @@ -52,8 +53,11 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>>                    ti.process_name, ti.tgid, ti.task_name, ti.pid);
>>
>>          if (amdgpu_device_should_recover_gpu(ring->adev)) {
>> -               amdgpu_device_gpu_recover(ring->adev, job);
>> -               return DRM_GPU_SCHED_STAT_NOMINAL;
>> +               ret = amdgpu_device_gpu_recover(ring->adev, job);
>> +               if (ret == DRM_GPU_SCHED_STAT_BAILING)
>> +                       return DRM_GPU_SCHED_STAT_BAILING;
>> +               else
>> +                       return DRM_GPU_SCHED_STAT_NOMINAL;
>>          } else {
>>                  drm_sched_suspend_timeout(&ring->sched);
>>                  if (amdgpu_sriov_vf(adev))
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 92d8de24d0a1..a44f621fb5c4 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>   {
>>          struct drm_gpu_scheduler *sched;
>>          struct drm_sched_job *job;
>> +       int ret;
>>
>>          sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>
>> @@ -331,8 +332,13 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>                  list_del_init(&job->list);
>>                  spin_unlock(&sched->job_list_lock);
>>
>> -               job->sched->ops->timedout_job(job);
>> +               ret = job->sched->ops->timedout_job(job);
>>
>> +               if (ret == DRM_GPU_SCHED_STAT_BAILING) {
>> +                       spin_lock(&sched->job_list_lock);
>> +                       list_add(&job->node, &sched->ring_mirror_list);
>> +                       spin_unlock(&sched->job_list_lock);
>> +               }

Problem here that since you already dropped the reset locks you are
racing here now against other recovery threads as they process the same
mirror list, and yet,I think this solution makes things better then
they are now with the leak but still, it's only temporary band-aid until
the full solution to be implemented. Probably then worth mentioning here
with a comment this it's a temporary fix and that races are possible.

Andrey

>>                  /*
>>                   * Guilty job did complete and hence needs to be manually removed
>>                   * See drm_sched_stop doc.
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 4ea8606d91fe..8093ac2427ef 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -210,6 +210,7 @@ enum drm_gpu_sched_stat {
>>          DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
>>          DRM_GPU_SCHED_STAT_NOMINAL,
>>          DRM_GPU_SCHED_STAT_ENODEV,
>> +       DRM_GPU_SCHED_STAT_BAILING,
>>   };
>>
>>   /**
>> --
>> 2.25.1
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb8e9c87369a74a6b0f2a08d8e50d4707%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637511192474845823%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=FgOIeqk34Sk13L%2BbXYxbqja%2BDY8NSva4wDtUWBMS3q0%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
