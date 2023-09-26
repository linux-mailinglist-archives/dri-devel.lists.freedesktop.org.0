Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A2D7AF574
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 22:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6B510E430;
	Tue, 26 Sep 2023 20:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209E510E430;
 Tue, 26 Sep 2023 20:43:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irlQVJjMydxqcKs8ieqrmeRDU40/FXxUTDofgNlC+oRee5IFed0UiWtePzjRgWo8Znl0+m43rXhD4Ldo97l9vtE6bhtzn3Iu5f8rxOVd9FYEaYn3Ffh2leSiI/utmLyMswoFLIUfixReCF1rUyImSULn194TP+PJ3666+r6lj9QXh2mJRb806U5Li6l/FQCNlUd5yBF/++0X6wv+Y2CYumwtDIFxA1MSXpRzTiD9DksFkVyvQxH+AVK61rIy+AH224+va7Db9QQI5wiaWSczNCItzJiiXsdS6szTZuAsMerlHVnUKC8zmaJfKbRMGRjXG82qzbZeMAExX42vpP5Wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohX8HPYI66rWELGRSyh3E7IxlgwV9GKI6qZxTJdXg48=;
 b=cCkAyUsL6ncnv7U/8eS80nXGV79SbSo3/NzXm+qzW/6UejYWk5u4oEEuu4vkX80+uzyHwUjBQbO2AoudA14jF+CNT7g9/eCNGsFSYPOGAwGHhqQEZh99qyjZyYqA1ryyoZfDtvnc69EHxb0s/VX8qyXcPF49QAtTqE7YVcAZ19tkzE9OBXCJSAZ7/ioh5GyTVrgo5K7yE2qR+i3xMRficfqVkcquVbgUoi4d1JAYUW3RYX+2KAmSBtrVTVasDpA6Lph4hXUzpQ1owUQGfo2pk2GUCnhZUPiEONL3rQt4Hn7cUximN5ELAcGpvBsJN+4zCQjbIresfGBFJTYV1iWQcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohX8HPYI66rWELGRSyh3E7IxlgwV9GKI6qZxTJdXg48=;
 b=PCx54OBZSdkBShJze7eupPhSbO76+5zMmZix8pyjo7blwf512OmYwE3oRttTIYwOELUOj6lAhRgOyHBzfGEMNKMaw6A/WvbPf4LJcwHk7fWosE+BT/67BgHpiv+UwEeiYRCCwNa2svjGqIGs52M3OZUx1HAfxcxpjwNQi3hGD1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 20:43:14 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 20:43:13 +0000
Message-ID: <312983ee-ba4c-477e-8846-072c815df862@amd.com>
Date: Tue, 26 Sep 2023 16:43:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.3
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
Content-Language: en-CA, en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
References: <20230924224555.15595-1-dakr@redhat.com>
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
In-Reply-To: <20230924224555.15595-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0282.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::18) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: a52c955a-8191-4c56-a9b4-08dbbed133e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DtW15EEapZZwJ3e2FEjKJr6cxDcu46DBLfZE8b+wbYspXqdG043w+OCp6xCoR4CBSxPApxhUkNVgovZ1gHqNmftpw0Zxx/8zM07A7AgAHG0f3RDh1Kg8l23fwhyNaDpG/EpR9ApS77AQN5yiAA2KvvVnxIuiV2/Hzdr/WlJlN9WPg5lUn+GeMa6vPcCaUZWnHow9Vo4Gfm5Lo50St1+MiJsnxjCo1M5OsaAxuswtMpPPTFBDAbVqvWoP2nd07Sk3Zke+aXZcsQck95U5ieiXzjO7UT1CpBgFlnXrj6B5DogMAfTfyrvmnSpU7+opME+8fhs729YsxCR+CP9EgUGpgPRsAM0oeaVMRHeWaGfePrqbsFpo2gpDSBN6yZ0gBq2Md4yFUlotbGqHeLJqgdVm8x0eiImn5eRHan0ByntiAsjdgILViPLRj6S4OC+43ukaRIHLWbj46P3E9JmXtYYZN9WeiBLKzxm/ZioCtmSaHheh0VWcvFHbmsk0BXTF1/AAywMBO/VyR1Cdu1rCNRi4ZixXENelkkAW1Ji3JZFbmJTBxassV/eAqYMXmv6BSSgjT2o6NAIuYKZ3IVaskkbhZe4zs3YztnjmxtO1aHc1RnrZE3b9Q5O+fDcpzWTo8iFetPqQM07vGmv9wx/5fWtvqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(39860400002)(396003)(346002)(230922051799003)(451199024)(186009)(1800799009)(41300700001)(316002)(31686004)(66946007)(66476007)(66556008)(6512007)(8936002)(8676002)(4326008)(2906002)(30864003)(44832011)(478600001)(26005)(6486002)(5660300002)(6506007)(38100700002)(53546011)(36756003)(66899024)(966005)(2616005)(86362001)(83380400001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1JoOTYrWWtMSytSVkdRYW16Qmt3TERka1VoQnBSR09GVWhkamU2MVFwc1FQ?=
 =?utf-8?B?cG9wTkFKNm02YXNjS1U1UHMyWEVaTnFRZ0NRQW5MWVBMYldMa0dyNkJObUpZ?=
 =?utf-8?B?UjdNY1VCdkV4RUsyczh6dlBjSkdoV0ljZXJTeXBMWnBzNFBwdWg4WmdoV1VH?=
 =?utf-8?B?NkhRcGtZUitodmdBclR0cWlUOC9yeGdSNldYNHZoMmVmMkZCL3BXZmFLYkpR?=
 =?utf-8?B?RGNLS0svcjRNVmN0dHVZQlN6MnozWDVMUVJaM05zNmRJL3Z1MjRrRlg1TWVH?=
 =?utf-8?B?NlRRVENMR3dEM1U2TnBmbW40ejhJb1c2ZStPR2JWdlhEcXVqRFFqeXJHYkda?=
 =?utf-8?B?WlFJbnhPcWY3QWZpVFlUNWw2a1ZlNFN1dERIM2ZaeFBIN0dFT0pucklGQ0tu?=
 =?utf-8?B?UjlxTGdVODJEZEM4VEFkSEdwWFgwZE56Tk1VN3VReVUrYXhHalhjK0dYcnVU?=
 =?utf-8?B?M2NRUStmbS9lYW1FMkFyOWRHc3RjQTBZaGNQRG5XeUpSMFozNGF5NGI0YnJN?=
 =?utf-8?B?QlkzQWtVLzFwWktGNEFlS3JORkVTbzR5TkZ3eVlreVk4azNmeDk1R1dFQ2ZO?=
 =?utf-8?B?d3IwZlFKamhidHRLM1BmdDVIZ255c2VuM3U4NFhhRk5VRmQrWWdYM25ENjhu?=
 =?utf-8?B?TG5qUmRoSWN0TVdUMlhQdEtGdlQ0UTQwRWZ2ZlFWdlFDMURhQkRWc3JHd1Jn?=
 =?utf-8?B?NkxXMm5LQ3Z6VjRGWFBJWXRYYTFUTTd2QlVONWJiQXhOY2hqSjRtQWFRM1l2?=
 =?utf-8?B?L0pPZ0R5c3FIK0FTeC8xV1hCcVJXRm9DaW5Qa2owazZTOFBTUFdrL0I0NFdh?=
 =?utf-8?B?aGZtMWdJaW05NTZib3V2RWF1N0hTNGtrejdtenVFY3RWbE5YT1lOazc5ZWUr?=
 =?utf-8?B?U2RwR012bld5aEdHVWI1bEJUeDE5aG9rUWpQWktNS0c0ZVkxRFo5cE0yMmM4?=
 =?utf-8?B?Si9ZdHMyVDBWWWFtK0dVbkJKN1A0SVlva1FrQmxSY1BzL1lwb21Ram54WW5O?=
 =?utf-8?B?Uk5FdzVyRXdaTXdET2FsdzJHYVlKWnZrTHF4d2xobGhHRWU1Um5NMlZaZ0ts?=
 =?utf-8?B?LzVJVkYyVGI5WjZYVytpZzJ5amQzTEtJc3dOalF1cXpNeFh5cjJKc2ZiZ2I0?=
 =?utf-8?B?OWp6dUJTMXN5a3RJTk1FcTNnaHlidlRYU3Q5RFVwZXZlNW1hRVhZZ2FFRWdn?=
 =?utf-8?B?MEpTd091UkpKWmwwU1RvOXZJTG94VFV3WkF0Y0psN1lvTWUrdVg5UGZIVGZP?=
 =?utf-8?B?NTdnQ0pScCtKVG5zeEJtR3h1UkovV3RtK3ovT0orNWJZWkl3K1dtRTA1aUZH?=
 =?utf-8?B?WXBDcGxvYUR1cW91dTF1dzB5OENLbzQydnhCK2gzeGRIVFBBb1E1Q0tweWxx?=
 =?utf-8?B?bXEvZm56dXBiUGxWdWFkcVB2NWphdU0yR043eUthOGxxNmFKQzd4QmJIRnJN?=
 =?utf-8?B?QUZObzJxdVdneW4wd0x1ZTNhU3Q1YzJlRTlzKzRwQysxbWFjSUpsWTJEWkNr?=
 =?utf-8?B?NWlXVXJtbXBRT1lWSHU3Uzh0aEJtUXNXRStOUG8wcTVGKzFwQ1RVc2g3V0Ur?=
 =?utf-8?B?RG4yMjhIcFRjQjlyMFE4djVRekVNdkwxV2lZL29jQzZwTldiQzZnMHFJRHJM?=
 =?utf-8?B?S2t3a0J6T0Q3anlzVUk3WVFzam95NlZVK3hzRFRYUnFwLzB1YlBMUGlCYVB2?=
 =?utf-8?B?OUh0THNzSzQrdTJad3BISnRFTzkyRTdpMjdmOEpQV0ZqNXJGR3dlK3pSOHpz?=
 =?utf-8?B?SHFobU9qWFZqUzQ4aGRjY2NnbmJqdCt5dGlWWW1aYjhsSmZ2b1hpVkg1eXhm?=
 =?utf-8?B?bEkzTTlGek04eTJ1UnR4RVB4U2FZaVNqajIxWnhPbTQ3dCtIdDlBVkxVWWls?=
 =?utf-8?B?Mi9KUVc4aTM3UzJqR01JcHhscFQzaGZuQStZV3BGMmU3dm5YZlEwdlVvc3F6?=
 =?utf-8?B?T0tQdGR2emd2b1I1M2tRNWhkenVzcFViYjR4dXM0WURKY0RhajZPZ1l6eDVl?=
 =?utf-8?B?em9EbXB1NzY2WTB6aGdJa1JVZmtna1VENEEwMXBmSkdUNXozMERBbVFHb2Va?=
 =?utf-8?B?aUJYSTVveGF1c1gwd0MyYk9TL1BrSzMwdDlwa2hkYS9nVlRMeEhMRWhtOFRV?=
 =?utf-8?Q?pWr8lS9plY9Zuft7ho3bmDjUA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52c955a-8191-4c56-a9b4-08dbbed133e5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 20:43:13.2809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wgNUzhqguy1xulmGd2T5286xxj9ZK6jnBf0Lli5nQb96Y5TWqzPowy7rUmAc7BX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023-09-24 18:43, Danilo Krummrich wrote:
> Currently, job flow control is implemented simply by limiting the amount
> of jobs in flight. Therefore, a scheduler is initialized with a
> submission limit that corresponds to a certain amount of jobs.

"certain"? How about this instead:
" ... that corresponds to the number of jobs which can be sent
  to the hardware."?

> 
> This implies that for each job drivers need to account for the maximum
                                ^,
Please add a comma after "job".

> job size possible in order to not overflow the ring buffer.

Well, different hardware designs would implement this differently.
Ideally, you only want pointers into the ring buffer, and then
the hardware consumes as much as it can. But this is a moot point
and it's always a good idea to have a "job size" hint from the client.
So this is a good patch.

Ideally, you want to say that the hardware needs to be able to
accommodate the number of jobs which can fit in the hardware
queue times the largest job. This is a waste of resources
however, and it is better to give a hint as to the size of a job,
by the client. If the hardware can peek and understand dependencies,
on top of knowing the "size of the job", it can be an extremely
efficient scheduler.

> 
> However, there are drivers, such as Nouveau, where the job size has a
> rather large range. For such drivers it can easily happen that job
> submissions not even filling the ring by 1% can block subsequent
> submissions, which, in the worst case, can lead to the ring run dry.
> 
> In order to overcome this issue, allow for tracking the actual job size
> instead of the amount job jobs. Therefore, add a field to track a job's

"the amount job jobs." --> "the number of jobs."

> submission units, which represents the amount of units a job contributes
> to the scheduler's submission limit.

Yeah, that's a good thing.

I suppose that drivers which don't support this, would just use "1" to achieve
the same behaviour as before.

> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
> This patch is based on Matt's scheduler work [1].
> 
> [1] https://lore.kernel.org/dri-devel/20230919050155.2647172-1-matthew.brost@intel.com/
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  2 +-
>  drivers/gpu/drm/lima/lima_sched.c             |  2 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c          |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
>  .../gpu/drm/scheduler/gpu_scheduler_trace.h   |  2 +-
>  drivers/gpu/drm/scheduler/sched_entity.c      |  5 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 81 +++++++++++++------
>  drivers/gpu/drm/v3d/v3d_gem.c                 |  2 +-
>  include/drm/gpu_scheduler.h                   | 18 +++--
>  11 files changed, 78 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 78476bc75b4e..d54daaf64bf1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -115,7 +115,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	if (!entity)
>  		return 0;
>  
> -	return drm_sched_job_init(&(*job)->base, entity, owner);
> +	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
>  }
>  
>  int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 45403ea38906..74a446711207 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -538,7 +538,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  
>  	ret = drm_sched_job_init(&submit->sched_job,
>  				 &ctx->sched_entity[args->pipe],
> -				 submit->ctx);
> +				 1, submit->ctx);
>  	if (ret)
>  		goto err_submit_put;
>  
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index 50c2075228aa..5dc6678e1eb9 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -123,7 +123,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
>  	for (i = 0; i < num_bos; i++)
>  		drm_gem_object_get(&bos[i]->base.base);
>  
> -	err = drm_sched_job_init(&task->base, &context->base, vm);
> +	err = drm_sched_job_init(&task->base, &context->base, 1, vm);
>  	if (err) {
>  		kfree(task->bos);
>  		return err;
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 3f1aa4de3b87..6d230c38e4f5 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -48,7 +48,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  		return ERR_PTR(ret);
>  	}
>  
> -	ret = drm_sched_job_init(&submit->base, queue->entity, queue);
> +	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue);
>  	if (ret) {
>  		kfree(submit->hw_fence);
>  		kfree(submit);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index f26a814a9920..e991426d86e4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -89,7 +89,7 @@ nouveau_job_init(struct nouveau_job *job,
>  
>  	}
>  
> -	ret = drm_sched_job_init(&job->base, &entity->base, NULL);
> +	ret = drm_sched_job_init(&job->base, &entity->base, 1, NULL);
>  	if (ret)
>  		goto err_free_chains;
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index a2ab99698ca8..d5e777deee5c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -272,7 +272,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  
>  	ret = drm_sched_job_init(&job->base,
>  				 &file_priv->sched_entity[slot],
> -				 NULL);
> +				 1, NULL);
>  	if (ret)
>  		goto out_put_job;
>  
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 3143ecaaff86..2e4ffdecc5dc 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -51,7 +51,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>  			   __assign_str(name, sched_job->sched->name);
>  			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>  			   __entry->hw_job_count = atomic_read(
> -				   &sched_job->sched->hw_rq_count);
> +				   &sched_job->sched->submission_count);
>  			   ),
>  	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>  		      __entry->entity, __entry->id,
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 437c50867c99..6395090d5784 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -401,7 +401,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>  		container_of(cb, struct drm_sched_entity, cb);
>  
>  	drm_sched_entity_clear_dep(f, cb);
> -	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
> +	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity),
> +				      entity);
>  }
>  
>  /**
> @@ -645,7 +646,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  		if (fifo)
>  			drm_sched_rq_update_fifo(entity, submit_ts);
>  
> -		drm_sched_wakeup_if_can_queue(sched);
> +		drm_sched_wakeup_if_can_queue(sched, entity);
>  	}
>  }
>  EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 88ef8be2d3c7..857622dd842e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -93,6 +93,9 @@ int drm_sched_policy_default = DRM_SCHED_POLICY_FIFO;
>  MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>  module_param_named(sched_policy, drm_sched_policy_default, int, 0444);
>  
> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> +				struct drm_sched_entity *entity);
> +
>  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>  							    const struct rb_node *b)
>  {
> @@ -212,13 +215,15 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  /**
>   * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>   *
> + * @sched: the gpu scheduler
>   * @rq: scheduler run queue to check.
>   * @dequeue: dequeue selected entity
>   *
>   * Try to find a ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
> +drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
> +			      struct drm_sched_rq *rq, bool dequeue)
>  {
>  	struct drm_sched_entity *entity;
>  
> @@ -227,7 +232,8 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>  	entity = rq->current_entity;
>  	if (entity) {
>  		list_for_each_entry_continue(entity, &rq->entities, list) {
> -			if (drm_sched_entity_is_ready(entity)) {
> +			if (drm_sched_entity_is_ready(entity) &&
> +			    drm_sched_can_queue(sched, entity)) {
>  				if (dequeue) {
>  					rq->current_entity = entity;
>  					reinit_completion(&entity->entity_idle);
> @@ -240,7 +246,8 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>  
>  	list_for_each_entry(entity, &rq->entities, list) {
>  
> -		if (drm_sched_entity_is_ready(entity)) {
> +		if (drm_sched_entity_is_ready(entity) &&
> +		    drm_sched_can_queue(sched, entity)) {
>  			if (dequeue) {
>  				rq->current_entity = entity;
>  				reinit_completion(&entity->entity_idle);
> @@ -261,13 +268,15 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>  /**
>   * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>   *
> + * @sched: the gpu scheduler
>   * @rq: scheduler run queue to check.
>   * @dequeue: dequeue selected entity
>   *
>   * Find oldest waiting ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
> +drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
> +				struct drm_sched_rq *rq, bool dequeue)
>  {
>  	struct rb_node *rb;
>  
> @@ -276,7 +285,8 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>  		struct drm_sched_entity *entity;
>  
>  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> -		if (drm_sched_entity_is_ready(entity)) {
> +		if (drm_sched_entity_is_ready(entity) &&
> +		    drm_sched_can_queue(sched, entity)) {
>  			if (dequeue) {
>  				rq->current_entity = entity;
>  				reinit_completion(&entity->entity_idle);
> @@ -300,15 +310,27 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>  }
>  
>  /**
> - * drm_sched_can_queue -- Can we queue more to the hardware?
> + * drm_sched_can_queue - can we queue more jobs?

This change doesn't seem necessary. "can we queue more jobs?" is,
while very puritan, very vague and unclear. Where are the jobs
queue to? What are they being queued for? Please leave this one
alone, or if you're determined to change this, say something like:

	Can we queue more jobs for execution?

Also do NOT remove capitalization--leave it a proper sentence.

(Yes, they may be going to a firmware scheduler running in the hardware,
but from our point of view, they cross over the PCIe horizon to a different
domain, and we call that which lies beyond the PCIe horizon, "hardware".)


>   * @sched: scheduler instance
> + * @entity: the scheduler entity
>   *
> - * Return true if we can push more jobs to the hw, otherwise false.
> + * Return true if we can push at least one more job from @entity, false
> + * otherwise.
>   */
> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> +				struct drm_sched_entity *entity)
>  {
> -	return atomic_read(&sched->hw_rq_count) <
> -		sched->hw_submission_limit;
> +	struct drm_sched_job *s_job;
> +
> +	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> +	if (!s_job)
> +		return false;
> +
> +	WARN_ON(s_job->submission_units > sched->submission_limit);
> +
> +	return (sched->submission_limit -
> +		atomic_read(&sched->submission_count)) >=
> +		s_job->submission_units;
>  }
>  
>  /**
> @@ -325,12 +347,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>  	struct drm_sched_entity *entity;
>  	int i;
>  
> -	if (!drm_sched_can_queue(sched))
> -		return NULL;
> -
>  	if (sched->single_entity) {
>  		if (!READ_ONCE(sched->single_entity->stopped) &&
> -		    drm_sched_entity_is_ready(sched->single_entity))
> +		    drm_sched_entity_is_ready(sched->single_entity) &&
> +		    drm_sched_can_queue(sched, sched->single_entity))
>  			return sched->single_entity;

I believe the fact that we're running on a work queue protects the scheduler
count, right? That's good.

>  
>  		return NULL;
> @@ -339,9 +359,11 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>  		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> +			drm_sched_rq_select_entity_fifo(sched,
> +							&sched->sched_rq[i],
>  							dequeue) :
> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> +			drm_sched_rq_select_entity_rr(sched,
> +						      &sched->sched_rq[i],
>  						      dequeue);
>  		if (entity)
>  			break;
> @@ -399,7 +421,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>  	struct drm_sched_fence *s_fence = s_job->s_fence;
>  	struct drm_gpu_scheduler *sched = s_fence->sched;
>  
> -	atomic_dec(&sched->hw_rq_count);
> +	atomic_sub(s_job->submission_units, &sched->submission_count);
>  	atomic_dec(sched->score);
>  
>  	trace_drm_sched_process_job(s_fence);
> @@ -622,7 +644,8 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>  					      &s_job->cb)) {
>  			dma_fence_put(s_job->s_fence->parent);
>  			s_job->s_fence->parent = NULL;
> -			atomic_dec(&sched->hw_rq_count);
> +			atomic_sub(s_job->submission_units,
> +				   &sched->submission_count);
>  		} else {
>  			/*
>  			 * remove job from pending_list.
> @@ -683,7 +706,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>  		struct dma_fence *fence = s_job->s_fence->parent;
>  
> -		atomic_inc(&sched->hw_rq_count);
> +		atomic_add(s_job->submission_units, &sched->submission_count);
>  
>  		if (!full_recovery)
>  			continue;
> @@ -764,6 +787,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>   * drm_sched_job_init - init a scheduler job
>   * @job: scheduler job to init
>   * @entity: scheduler entity to use
> + * @submission_units: the amount of units this job contributes to the schdulers
> + * submission limit


"amount" is for uncountable entities, like milk, or water. Please use "number",
also fix "schedulers", e.g.,

    * @submission_units: the number of units this job contributes to the schedulers'
    *       submission limit

>   * @owner: job owner for debugging
>   *
>   * Refer to drm_sched_entity_push_job() documentation
> @@ -781,6 +806,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>   */
>  int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
> +		       u32 submission_units,
>  		       void *owner)
>  {
>  	if (!entity->rq && !entity->single_sched)
> @@ -792,6 +818,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  		return -ENOMEM;
>  
>  	INIT_LIST_HEAD(&job->list);
> +	job->submission_units = submission_units ? submission_units : 1;
>  
>  	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
>  
> @@ -1004,12 +1031,14 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
>  /**
>   * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>   * @sched: scheduler instance
> + * @entity: the scheduler entity
>   *
>   * Wake up the scheduler if we can queue jobs.
>   */
> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
> +				   struct drm_sched_entity *entity)
>  {
> -	if (drm_sched_can_queue(sched))
> +	if (drm_sched_can_queue(sched, entity))
>  		drm_sched_run_job_queue(sched);
>  }
>  
> @@ -1147,7 +1176,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  
>  	s_fence = sched_job->s_fence;
>  
> -	atomic_inc(&sched->hw_rq_count);
> +	atomic_add(sched_job->submission_units, &sched->submission_count);
>  	drm_sched_job_begin(sched_job);
>  
>  	trace_drm_run_job(sched_job, entity);
> @@ -1183,7 +1212,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   * @ops: backend operations for this scheduler
>   * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
>   *	       allocated and used
> - * @hw_submission: number of hw submissions that can be in flight
> + * @max_submission_units: number of submission units that can be in flight
>   * @hang_limit: number of times to allow a job to hang before dropping it
>   * @timeout: timeout value in jiffies for the scheduler
>   * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> @@ -1198,7 +1227,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
>  		   struct workqueue_struct *submit_wq,
> -		   unsigned hw_submission, unsigned hang_limit,
> +		   unsigned max_submission_units, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name,
>  		   enum drm_sched_policy sched_policy,
> @@ -1211,7 +1240,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  
>  	sched->ops = ops;
>  	sched->single_entity = NULL;
> -	sched->hw_submission_limit = hw_submission;
> +	sched->submission_limit = max_submission_units;
>  	sched->name = name;
>  	if (!submit_wq) {
>  		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> @@ -1238,7 +1267,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	init_waitqueue_head(&sched->job_scheduled);
>  	INIT_LIST_HEAD(&sched->pending_list);
>  	spin_lock_init(&sched->job_list_lock);
> -	atomic_set(&sched->hw_rq_count, 0);
> +	atomic_set(&sched->submission_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>  	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>  	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 2e94ce788c71..8479e5302f7b 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -417,7 +417,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
>  	job->free = free;
>  
>  	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
> -				 v3d_priv);
> +				 1, v3d_priv);
>  	if (ret)
>  		goto fail;
>  
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 27f5778bbd6d..89b0aecd02e3 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -329,6 +329,8 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>   * @sched: the scheduler instance on which this job is scheduled.
>   * @s_fence: contains the fences for the scheduling of job.
>   * @finish_cb: the callback for the finished fence.
> + * @submission_units: the amount of submission units this job contributes to
> + *                    the scheduler

"The _number_ of submission units ..."

"The amount of milk and sugar necessary to make a 3 lbs cake is ..."

>   * @work: Helper to reschdeule job kill to different context.
>   * @id: a unique id assigned to each job scheduled on the scheduler.
>   * @karma: increment on every hang caused by this job. If this exceeds the hang
> @@ -348,6 +350,8 @@ struct drm_sched_job {
>  	struct drm_gpu_scheduler	*sched;
>  	struct drm_sched_fence		*s_fence;
>  
> +	u32				submission_units;
> +
>  	/*
>  	 * work is used only after finish_cb has been used and will not be
>  	 * accessed anymore.
> @@ -478,14 +482,14 @@ struct drm_sched_backend_ops {
>   *
>   * @ops: backend operations provided by the driver.
>   * @single_entity: Single entity for the scheduler
> - * @hw_submission_limit: the max size of the hardware queue.
> + * @submission_limit: the maximim amount of submission units

"the maximum number of submission units"

> + * @submission_count: the number current amount of submission units in flight

"the number current amount of" --> "the number of submission units in flight",
you don't need "current" as it is implied by the English language--it's redundant.


>   * @timeout: the time after which a job is removed from the scheduler.
>   * @name: name of the ring for which this scheduler is being used.
>   * @sched_rq: priority wise array of run queues.
>   * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
>   *                 waits on this wait queue until all the scheduled jobs are
>   *                 finished.
> - * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
>   * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>   * @timeout_wq: workqueue used to queue @work_tdr
> @@ -511,12 +515,12 @@ struct drm_sched_backend_ops {
>  struct drm_gpu_scheduler {
>  	const struct drm_sched_backend_ops	*ops;
>  	struct drm_sched_entity		*single_entity;
> -	uint32_t			hw_submission_limit;
> +	u32				submission_limit;
> +	atomic_t			submission_count;

That's good.

So, this is a good patch. Please fix the annotated above, and repost it
for an R-B. Thanks! :-)
-- 
Regards,
Luben

>  	long				timeout;
>  	const char			*name;
>  	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
>  	wait_queue_head_t		job_scheduled;
> -	atomic_t			hw_rq_count;
>  	atomic64_t			job_id_count;
>  	struct workqueue_struct		*submit_wq;
>  	struct workqueue_struct		*timeout_wq;
> @@ -539,7 +543,7 @@ struct drm_gpu_scheduler {
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
>  		   struct workqueue_struct *submit_wq,
> -		   uint32_t hw_submission, unsigned hang_limit,
> +		   uint32_t max_submission_units, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name,
>  		   enum drm_sched_policy sched_policy,
> @@ -548,6 +552,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
>  int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
> +		       u32 submission_units,
>  		       void *owner);
>  void drm_sched_job_arm(struct drm_sched_job *job);
>  int drm_sched_job_add_dependency(struct drm_sched_job *job,
> @@ -570,7 +575,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  
>  void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
> +				   struct drm_sched_entity *entity);
>  bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);
>  void drm_sched_submit_stop(struct drm_gpu_scheduler *sched);
>  void drm_sched_submit_start(struct drm_gpu_scheduler *sched);


