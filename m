Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C09338636
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 07:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619796F448;
	Fri, 12 Mar 2021 06:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B316F441;
 Fri, 12 Mar 2021 06:51:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3dBYz4otQ6tSmpFRUHart5ZG2ryiT8FTm5M55vSz+jqp5IgC3JLP8xi+W0EhF6zKB1sKgWNXEIXkE/fl/twlAVGvOkjcJWzZSPZ5SHxefquhdYfAuYT9JmhDoOhBMSCvU3k5vcVmq9s7fHEYVcNtdq5muhUcZiiaqV2huSJer4k15WleZwV5THkp4xk/zJ2nQNzEtHpWh09B5t17A7MzaCG1wI21m4d4kwpjN12ZprevL7eenAzp8hNUDdfKYZ5vxF/sfEpo8nRS1NEM3aTJ+GAp5bsVdRey8oqkqBe9DXoGQxmFpnU0SohaheEJdGkV0T784tGavfZPCLDpm8xww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZgyTnwuww3TNCC+KMvtYk6wOTLMRAS1RrWkUs5oRsE=;
 b=TID29C2f7XknlH24w5r6QECbZeGt9EXmVSnO/p5W8YghL9tAFpbowaWSHVyJ6DLVd0zhiAo2zgyn9K02j1QJXbDhN5HEVildc5GDGuF/z/TS69nOOOuX8em6dSqceS39xvB64NykBI3wY2qHZQaDEvA05IqmIjN/FRdzTnA/+IzVMfJEuijqllpsU0ier//7fqncLQ4fJ+1tVdqDRzIld7sWw4zpagftQh7J+ZzPC2Pygbyrf15peSNWD8rt0u+ikGge/1HNnTYLztgaxatqL4nbWk7toPaTKLclI7rfQTzVK6d81AvFaCmFDaIOhx5JcGn6PKWljk3HFegAoSLMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZgyTnwuww3TNCC+KMvtYk6wOTLMRAS1RrWkUs5oRsE=;
 b=oSO0ALzP2B92bA36DfgykhG/9OxcSsM9Ac0V4mtcdAD3zi5vUn6SNQuJlvkqRKMDlKO1pFTHB/REXx+bhroFQnfYhMQsfafZ45nAjlFBMtCZCk/PBqYz/BxsNc1vvykVOlTlpIU0PRfQJYjGJIU8o3pB/6RuPK8xZZMQJvKCXrg=
Received: from DM5PR1201MB0204.namprd12.prod.outlook.com (2603:10b6:4:51::10)
 by DM6PR12MB4973.namprd12.prod.outlook.com (2603:10b6:5:1b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.29; Fri, 12 Mar
 2021 06:51:21 +0000
Received: from DM5PR1201MB0204.namprd12.prod.outlook.com
 ([fe80::28e0:5877:b4e6:6bdc]) by DM5PR1201MB0204.namprd12.prod.outlook.com
 ([fe80::28e0:5877:b4e6:6bdc%9]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 06:51:21 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/scheduler re-insert Bailing job to avoid memleak
Thread-Topic: [PATCH] drm/scheduler re-insert Bailing job to avoid memleak
Thread-Index: AQHXFvPjI2io3Vl5XE2hRbG7VvPkr6p/vlIAgAAOGACAAB2o8A==
Date: Fri, 12 Mar 2021 06:51:20 +0000
Message-ID: <DM5PR1201MB0204311EA6CA7F2111A56138BB6F9@DM5PR1201MB0204.namprd12.prod.outlook.com>
References: <20210312035746.1089855-1-Jack.Zhang1@amd.com>
 <CADnq5_N88ahLAz2w=OgFU3vv7zX8uupW+_GzsHcLrqVbPoURUA@mail.gmail.com>
 <d1e2d40a-095d-a44f-3ce2-f8eae50751ec@amd.com>
In-Reply-To: <d1e2d40a-095d-a44f-3ce2-f8eae50751ec@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=f012a59e-4ad7-4d09-9336-06cc25605e89;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-12T06:50:29Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 89dbcc00-542f-4452-61e2-08d8e5233ec2
x-ms-traffictypediagnostic: DM6PR12MB4973:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB497393638D374BAE33F90F05BB6F9@DM6PR12MB4973.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vh6CSybFkjOVCEKt42BzoeyFCmPqPJ/XfurPoxRnsmE3eg12BuiNA+VmFM7XUDao4plUWzCj4rhIrdE9wqqByjKBsStuzjXqna0ms55im2sMVEspcdoP63gZWsxSkQV1MnSo4HT1DEp8mBa4oVua1HuJOrh4GsQT9/PeWTX0ucTya2pB2V0quiIChYHvNJKjYtSJh2zxarlCs385NZr2pcfn3vk/gNe7XBVa3Nr4gaMA3PgYFxIStidC3yV+s3yVkG+d4hZL7cRKQfOyDZ4Xp/+cPBEEu0tVOVUJKlpgLK9wTUuoB5Mq8bnKYZOpo7NiSoEOv7U+7xTeUW6Si07dYUvIyob/u6apF44BkXltNse8sascQTeKRMWxoasQ6DoFrZwMOHcB+bDbPot4f+0kKOu+QAFGJkwQR/FEtBaGIGtrE/JsAVA6hwTKdVQ9XHVbv808CwkmgWIsbGfgaLM4MEsM0Q0nKdezOdWamDx5iwB9w65bsw231rKUskHJy/UQNjrY/+KTTXsHf1uGJqhPpyx247UpkxQU4/9eLhBJ2v3YFd2OKoFwcH26gTd1vBTO8dpSky8f5PRWvrWWnSxtMyJs9BnswJ5+9J/4R7D4vwc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0204.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(8936002)(53546011)(6506007)(71200400001)(45080400002)(26005)(478600001)(186003)(52536014)(966005)(54906003)(110136005)(4326008)(86362001)(33656002)(316002)(66556008)(55016002)(76116006)(5660300002)(9686003)(83380400001)(8676002)(2906002)(66446008)(64756008)(66946007)(66476007)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?R29CbGlZcGdzMVBES3FVSWVGaDI2OXRNZEdxTG1uVFZraW40bzlxT0ZSTEpq?=
 =?utf-8?B?NTVJMlczdTNNZHBOaWxuS3BvSGhVQVJrTEtjR1lFVCtBV21VeGd6Znd4Y0lG?=
 =?utf-8?B?TTZuaXU5eTJma0hFOFo3RTNLZjF4WnZ0UWlsQjVja2xWQ3pWeWtkTDdIQ0hn?=
 =?utf-8?B?YndJWnloWDJ1V0tJMm96SFZPd0xZREp4dW5JOVRQMncydVFva0szeVNyeURD?=
 =?utf-8?B?WFB3MExvY0dUSTFYbUlpZ2ZHZWZsL0FMU0tIYXVuOUN3eFNTYTR3djJaQllV?=
 =?utf-8?B?YVdRWWQzRFFyVUFOcmgxZkt0ZjZFdUpHUERVRDRRMlNsSjlQNWRKYW5KWDl1?=
 =?utf-8?B?anZ4VnZGclRtdm1tWGJKSXhkU2FBZEQweEhFbE41MXJCdEZVNENVZVRybXA3?=
 =?utf-8?B?ZDArQ0VCeXh2bVFwRlRqUDU5bFFjRTdYZ2NqLzRxWjUrazFuWndyV29QSnQ4?=
 =?utf-8?B?V2pVMmtkNmJSamRzSFAwZGN6VmxhNlJQN1k5Q1k0azkwOS8xQ3JQWnhHeVZn?=
 =?utf-8?B?cTlPV1NYK0VrMFk1R2NtM2NBNTN2STN0QXB5U3JMMG1hMjVCMWFRZ3VrbERy?=
 =?utf-8?B?S1lpSlAxS3hHMmRBNGdFY1o1dExIbWJJeGNUaGlqbytNdE9WL1lGenBiZUdX?=
 =?utf-8?B?ZlZXb2I5RXl6ZU94eDZCd2JJRGlXK3g4bTdScENaZTVhVk9MdVJDYTBjTzFL?=
 =?utf-8?B?QitxbVZtdUo0RSt3QWdRZ3dERkt6NG9oOHRJZ042b2RtNXIyQ1RGU2NXUU50?=
 =?utf-8?B?NEg3RVNJODB5Qm1hTFhNOWt3S3c5RXVxQzFTejl0bmFTYWJaWm85eUlINW43?=
 =?utf-8?B?a3owVUxOZm00R09KWkNjSURYK2lWUXZFM01oT0hid21DWUdJVGlmWCt3amVF?=
 =?utf-8?B?MmVWT1RyalpxVkhUbDQ5SkQwZStPUHdUSi85OTd4VFVSM0JXNzRSSWx6cHla?=
 =?utf-8?B?bEg2dzVnT0JYRWFUczE3d0YyRkV4UUQvazRrK2hsbXdqemF0M2FDdFhiSDRW?=
 =?utf-8?B?cUlPZ1dXaS8rc1VmQmpxcXliYzd3Z2lIRkJ0dzNWYVkyQWY3MU9Yc2gybEhq?=
 =?utf-8?B?YzVtdnlqY1gxM1BLNGRyeEVzWVZXd0tuTXE4a0JBY3IrektoMnJleWN5M1Nk?=
 =?utf-8?B?UmxQM2l6UGxBaXAyc1FmbWpRb0YvUnFQZFBLYUNDM0tOOFlsUlExWXkrdWN1?=
 =?utf-8?B?dFB4MFd1QWtDZGRJWUxUVkJtcEJLRDhDeTFqWGRpODV0VnA2R0lZSWp0M2ta?=
 =?utf-8?B?eDVVMW1RNHYvOEpEK3U0RVk1dkdiZ2duamIxTml2RVlvTXo0NkNNQ3l0WDlP?=
 =?utf-8?B?ZHF3bFlnK1NrNko3N0NUSkdRanhZRXhIUzA0eWFNczl5OFhONzAxa1FEQnU4?=
 =?utf-8?B?VHZjZVRKNkh0cW5jMUlaQUNibUwvUnRsMEN0L0QwbnFhcWFhOUZQSnc2Q1gw?=
 =?utf-8?B?aFpUWHVJdmJDd2sxb2VKbkorMUZRWXNQUTVtQUU4bVJXbUhpUDd1eW5qWWpY?=
 =?utf-8?B?dFYvUWJMZ3dlM3lBY0tzWFhzS2krdnVXcWVrT0crN3NXbTlvdDcxK25wYnE3?=
 =?utf-8?B?M29tSkM4NmJrZ2k0aWI0VUNHSUIwdlFFVFp5Nm9abEhFVkVmUGYwajZEMHd3?=
 =?utf-8?B?Rm04MEY5a2RmUitHaDkyWTQrZmU2OGNWbkpGWU1xV1FhdmxxYW1KS29iNktQ?=
 =?utf-8?B?UVMvai9nVmxOaWJZUThrS0FWaWxmNTNDT1k5Nnl6aCtHSkc3RjFKS2FiUXQr?=
 =?utf-8?Q?l5bv1ZFRjHnSQl2LreZyssIdj8CnSZxmnJN/6SQ?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0204.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dbcc00-542f-4452-61e2-08d8e5233ec2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 06:51:21.0778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 56L55FWskUXCvswDTDDRCtrRTkcfcNP7q89Q4s1jknX/33QOJS15MakTs1AQPGkG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4973
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
Cc: "Liu, Monk" <Monk.Liu@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Hi, Andrey,

ok, I have changed it and uploaded V2 patch.

Thanks,
Jack
-----Original Message-----
From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Sent: Friday, March 12, 2021 1:04 PM
To: Alex Deucher <alexdeucher@gmail.com>; Zhang, Jack (Jian) <Jack.Zhang1@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Koenig, Christian <Christian.Koenig@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>
Subject: Re: [PATCH] drm/scheduler re-insert Bailing job to avoid memleak

Check panfrost driver at panfrost_scheduler_stop, and panfrost_job_timedout - they also terminate prematurely in both places so probably worth adding this there too.

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
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
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
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
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
>>                  if (amdgpu_sriov_vf(adev)) diff --git
>> a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 92d8de24d0a1..a44f621fb5c4 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>   {
>>          struct drm_gpu_scheduler *sched;
>>          struct drm_sched_job *job;
>> +       int ret;
>>
>>          sched = container_of(work, struct drm_gpu_scheduler,
>> work_tdr.work);
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

Problem here that since you already dropped the reset locks you are racing here now against other recovery threads as they process the same mirror list, and yet,I think this solution makes things better then they are now with the leak but still, it's only temporary band-aid until the full solution to be implemented. Probably then worth mentioning here with a comment this it's a temporary fix and that races are possible.

Andrey

>>                  /*
>>                   * Guilty job did complete and hence needs to be manually removed
>>                   * See drm_sched_stop doc.
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h index 4ea8606d91fe..8093ac2427ef 100644
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
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flis
>> ts.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7C
>> Andrey.Grodzovsky%40amd.com%7Cb8e9c87369a74a6b0f2a08d8e50d4707%7C3dd8
>> 961fe4884e608e11a82d994e183d%7C0%7C0%7C637511192474845823%7CUnknown%7
>> CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
>> VCI6Mn0%3D%7C1000&amp;sdata=FgOIeqk34Sk13L%2BbXYxbqja%2BDY8NSva4wDtUW
>> BMS3q0%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
