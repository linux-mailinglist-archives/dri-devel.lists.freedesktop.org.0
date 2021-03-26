Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAB9349F4D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 03:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47436EEA1;
	Fri, 26 Mar 2021 02:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEE06EEA0;
 Fri, 26 Mar 2021 02:04:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5fDSntPHIN0N32FSHHTDtGhRcy4XZ+NSZK6jPXHJsY2P1s/Or8p3CThAe6wBlDl+dtuu23f/85ZQjJPTmsHQ8e3fwEZLMgNhLZFj+hK0LhSILG1WW8QbrQu7V/e1QA+7O0nSkOa572xsZhy4ltDZZOJOp2sQMORBDYf2Mh2u8r8YbrR0j5C/b3ElH9jDUAVyrHJmTi0zhLcBqdlDuV7iLvKKsumiBaHAwij8fZMSzWxlBgYxsCCxySM2v3LGBDwXxruzeuRrmPGCn/OgShalCs0tBVrwwekStL7XG/LLFqzej2sDyBAWCLYMRCiZIkkmG3JO/k/rcwWa1BVG5JTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV8ZAmuMxuPxZb5x0LxHxcSlYPUDEdmzAUX3KkyX5MI=;
 b=J0pBsDN/WL9gWPt96uOOBquRL5+2WiBpSpcdJtu+f+L7p+9Py7z39pOZuk3uVi4mXk5qmWIHRReaufC2ksOGjxJqDlDC5mTMSXt4Ly2aT9qi2Ua67wKLTWbeatRehSksVPDBkzf5jSCb5pCH6v1RV4B4zcaPEHhdPSIOC21k/qM3uX02SKQuNV1qQq/DQ63r96cDKtt7nZT1NC/K8qEaNpiAeLtk+N+j4NHEcqaKr6ce+S2u4jcjNxukqR+ubXKOIZQVPY8gqLjHKDT6y8D4aoTEMF58+wWfayQRqVab5E/rerYHSqKIWwQymD2b1Hpc8d2l59yzhz5uHkpyTO+Oew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV8ZAmuMxuPxZb5x0LxHxcSlYPUDEdmzAUX3KkyX5MI=;
 b=4pBXiP+Jvtkkiy6D5Y2/z5lPja/+WR23tWapFjxgYM5nMTB3ShcAt1X+LfAMgyru2i1N8NppNw99DjMb/rekfMI7tohzWmmAq2sxHFAHWWkAbo84+mV+qwTUpX8t2ilRghZj6fTeTW0TOGx9z1ZWaeJRF6zICZxQMOekctyBpDQ=
Received: from DM5PR1201MB0204.namprd12.prod.outlook.com (2603:10b6:4:51::10)
 by DM5PR12MB1657.namprd12.prod.outlook.com (2603:10b6:4:d::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Fri, 26 Mar 2021 02:04:42 +0000
Received: from DM5PR1201MB0204.namprd12.prod.outlook.com
 ([fe80::f9a1:e085:6f3f:5c1c]) by DM5PR1201MB0204.namprd12.prod.outlook.com
 ([fe80::f9a1:e085:6f3f:5c1c%12]) with mapi id 15.20.3977.025; Fri, 26 Mar
 2021 02:04:42 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: Steven Price <steven.price@arm.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, 
 "Liu, Monk" <Monk.Liu@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>, Rob
 Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: RE: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
Thread-Topic: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
Thread-Index: AQHXGVr0ttnalfpTIkyzQ3GFwzEsHaqEg4SggAup7wCABWeFAA==
Date: Fri, 26 Mar 2021 02:04:42 +0000
Message-ID: <DM5PR1201MB02040F7DF455429AE6DB3328BB619@DM5PR1201MB0204.namprd12.prod.outlook.com>
References: <20210315052036.1113638-1-Jack.Zhang1@amd.com>
 <DM5PR1201MB020453AA9A2A5C5173AF4D84BB6C9@DM5PR1201MB0204.namprd12.prod.outlook.com>
 <bd11b7f4-41a8-fd29-bc94-656c7c83c552@arm.com>
In-Reply-To: <bd11b7f4-41a8-fd29-bc94-656c7c83c552@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=cb87e60e-bfb6-4df9-9359-9c1cf0431eee;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-26T02:00:49Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 30da10c4-9234-42e6-5f26-08d8effb853a
x-ms-traffictypediagnostic: DM5PR12MB1657:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB165774065D84D620AB6065A7BB619@DM5PR12MB1657.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qR9uEHpcVSn7Aai28q9b/xDy1ZHeMR0gPhAQcCS2xA0N3wZc7P3O3dDJeqW6DKnHgNNumCrx4BFUwWB75P/pYdyijyYjrG2kvCT46lKLdMYeh17mr2tveorGtDR78xzjV/P0UoKAjIvBKV3SBtOQOqXTddbQfWaTNooHsldPRyit8H/IJ5E3qd8Re+QQHucYbUdFjFk6Vc1SHtB6gUG7MSNhRgvyF/lLRWRCSTuYP2fwF6QacivCJXYOeBTbd8rzYaLyj+RySv3CVxWCHtzr0ZoOurHmC9GjBaw21nICTRPVZjA0dXBDkZLDHWPpXBQTsupF+iaLaDev5e0uFuAqE49HbuX+C2+MDdAlEIvBmZKzezRdQ3zKhetXvS5hPd6tDKXcu8Ms+WR5UEmCWK/ZvblrTeiR/8eKDzwxLplUqkzvNtmJSSqYz+KCDeAYp9zUskbFHmrnBTr4FyPhIeGwRrQ2N7VZfJXEBus0Nxw0TiY0s+0m4uDSrigMwRLccC3/rtpwHJuSK2L/3lNEv7/sflQinj6EeuWRqnUtcYLl5mQnNXB9fJ/J3etVHntftxvrtqftLtGScRRigfTwdl83MM6GHo2w6BQ0JJkh3vb8GUdQsySigOPwUVvxdtOKRIuJuXxwrys1gFg46xPk73o8VISyvf9Cp38Ja79nbXTLSFXtDO+6dd1RfZ/sK/iN8X6l
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0204.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(8936002)(478600001)(186003)(55016002)(86362001)(7696005)(83380400001)(9686003)(6506007)(110136005)(5660300002)(316002)(26005)(71200400001)(33656002)(66446008)(2906002)(53546011)(66946007)(38100700001)(8676002)(64756008)(66476007)(76116006)(52536014)(66556008)(921005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?U25QRGFGMmltZHRmeHdyakVHRlUyVTV1SjJNR0RKU3ltbmpvVTlXMWttWXVy?=
 =?utf-8?B?aFZkNUV0Y0hOSW5rRnJNN3ZFNUlMbnF4WXZFR3VlYnNKZmxYOE41ay9vL25o?=
 =?utf-8?B?ZUpGdGcwSWZLMmRCd2kyekxpdm1haW5NTVBLUTRwTU9Sdm41VStFODE0dkdw?=
 =?utf-8?B?OG9CTWgrTVdJWlVKQWpxQmxHVUU0a2p5U04ycXFTWVZhanJtUk5aRFhtM1Nq?=
 =?utf-8?B?WGwrWEwxMWFVTnY0Sm5HdFI3U0NpbENrNEVhbEFhdUlSVmhVTzJuWjhhY1Zs?=
 =?utf-8?B?VEpaTk90V2Z4ZE9OVjNncTR1eWVJV0RUTlFWZzhVUU8yNDRETWM1Z1hpU04r?=
 =?utf-8?B?TnlFaCtpV3p4QVRoWFdPejgyaW93RTZyeGYzV09vdDZ5ZEphRWk2TkNPWFA3?=
 =?utf-8?B?V09HTjlUVUhMMjBWN0dzS0hsMFJXNGpxYjRsYWprY3VWVnBnZCtQOGZZYVBn?=
 =?utf-8?B?Z00wdytlK3ZLd3JJeXk5U3hhOE5Qcm01WHFWbzBabkVqWHRKcFpWYjlkS1Js?=
 =?utf-8?B?R3MyZnhmcDhUaHZHdkVMbkIrR3A2bnZZMTRVVUpGMXB6NWdPZkRkM3NPS1lJ?=
 =?utf-8?B?M3dsY0JUVHVjazVFcnNCOFJTUitwSGwzZUhwb3BOK29YcU5hNHc1czArNnhI?=
 =?utf-8?B?NTBCNElqMTc0R3IzcTdhMHdka2FDYlg3L0xaYjlQODhaZUxYcm82b0VHR1Ux?=
 =?utf-8?B?SDlLeUhQbnZSc1ZkenVwMGlETXRIWUhqMGVUUnlxMkYvZFZyNHM1OGJ6SXlq?=
 =?utf-8?B?UFJsbGRuUFZZSFA3QlVjZ2Y2S0djWENJQ21DRXE4OTRmemFsd2htTW9Ma0Y5?=
 =?utf-8?B?L3liNEVwaEp6cUZiQXA5dXliYng2QnFrZk5FQU5GQVBJa3VLVk13ZG1PRjVG?=
 =?utf-8?B?ck4vNkJhOGs5Sk9kSWtUbG9HY0tzdXhISUVCNVIzSUk4UzVSUFBiTHlkQnU1?=
 =?utf-8?B?Rk91MVVvVDdva01jUVZqL0pTZVVsVm14VVY3a2NUblFjWUNNUTYrcnJ1bjdV?=
 =?utf-8?B?SlVhcEc5ZVFSMjhqWVNrVlg3Q012SmFzWmtoVGpmcUlvejNnOUFtdVZoeWhK?=
 =?utf-8?B?RzYrRllOcHVPRktMbXFNZWl3OHc0SnAwS1RtSmc3VTB0MTA0RGg3TXpJSGlN?=
 =?utf-8?B?VWwwNkZYWStsY1dFNlFWVFJlQTlZYUVOUmhHT0kvc25aOHQ0N0plZ1pXQkRV?=
 =?utf-8?B?ek84cUNiWTlWcUZQY1BXeis1N1hxRVdtaHNKR2pxVk80VkZxdDJvTVR3alZp?=
 =?utf-8?B?cGVlRlRXQWg0Ry9Yb1QzU25qOXVoVmdzVTFuWDN3cWdFR0Y3LzRYYXhvNTgy?=
 =?utf-8?B?Zyt2alpWbFBmSGFkMVZ3UnpJSTNJS25XdldPQmxUaDdsLzc1dDR6VVI1Ri9i?=
 =?utf-8?B?UWkzY2ZiSExzSEVFQXFWOVRjdkphRm5xcTV0di9xbXpBNEFselU3RmtFamxw?=
 =?utf-8?B?NVRKVHZyNFlDNTdaVXhXYlhuRmJtY3VBU2t5YlF4d3VSb3g3QWhtZFhpcXll?=
 =?utf-8?B?R1dJeVp5MDZPNGtQMlJhQjcvbTAyaEVhelFJSURFT05kZWk3U3hRUzgwdVlU?=
 =?utf-8?B?NWJDY1FBd3F2RUowczI5T2hKdDJLa1FITEF6UVhaaWt4MTlScmMybzVUQm5h?=
 =?utf-8?B?cnpEOU5taEx4QmlOSjBnQU5BclpHQVFVYXRGVU5lYndmcDZKQnJlcVFYWWpL?=
 =?utf-8?B?S2F6RklCWWhBbjhwTnpBWis5enlncUxqWFRhVDFyQW4rSFdUNmJYOGhocGg0?=
 =?utf-8?Q?Dy1hkNAqfWpv9lmSJbVTk8btsFMAigPql2GnKsz?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0204.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30da10c4-9234-42e6-5f26-08d8effb853a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 02:04:42.2540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /PqdlE/CSqDyooXRVR6MsEIyxBYjaX7rk1W0xBVA0egAsT1kGtXp42A9zCzqgVjZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1657
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Hi, Steve,

Thank you for your detailed comments.

But currently the patch is not finalized.
We found some potential race condition even with this patch. The solution is under discussion and hopefully we could find an ideal one.
After that, I will start to consider other drm-driver if it will influence other drivers(except for amdgpu).

Best,
Jack

-----Original Message-----
From: Steven Price <steven.price@arm.com>
Sent: Monday, March 22, 2021 11:29 PM
To: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Rob Herring <robh@kernel.org>; Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak

On 15/03/2021 05:23, Zhang, Jack (Jian) wrote:
> [AMD Public Use]
>
> Hi, Rob/Tomeu/Steven,
>
> Would you please help to review this patch for panfrost driver?
>
> Thanks,
> Jack Zhang
>
> -----Original Message-----
> From: Jack Zhang <Jack.Zhang1@amd.com>
> Sent: Monday, March 15, 2021 1:21 PM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey
> <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily
> <Emily.Deng@amd.com>
> Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>
> Subject: [PATCH v3] drm/scheduler re-insert Bailing job to avoid
> memleak
>
> re-insert Bailing jobs to avoid memory leak.
>
> V2: move re-insert step to drm/scheduler logic
> V3: add panfrost's return value for bailing jobs in case it hits the
> memleak issue.

This commit message could do with some work - it's really hard to decipher what the actual problem you're solving is.

>
> Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 ++++++--
>   drivers/gpu/drm/panfrost/panfrost_job.c    | 4 ++--
>   drivers/gpu/drm/scheduler/sched_main.c     | 8 +++++++-
>   include/drm/gpu_scheduler.h                | 1 +
>   5 files changed, 19 insertions(+), 6 deletions(-)
>
[...]
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 6003cfeb1322..e2cb4f32dae1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -444,7 +444,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>    * spurious. Bail out.
>    */
>   if (dma_fence_is_signaled(job->done_fence))
> -return DRM_GPU_SCHED_STAT_NOMINAL;
> +return DRM_GPU_SCHED_STAT_BAILING;
>
>   dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
>   js,
> @@ -456,7 +456,7 @@ static enum drm_gpu_sched_stat
> panfrost_job_timedout(struct drm_sched_job
>
>   /* Scheduler is already stopped, nothing to do. */
>   if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
> -return DRM_GPU_SCHED_STAT_NOMINAL;
> +return DRM_GPU_SCHED_STAT_BAILING;
>
>   /* Schedule a reset if there's no reset in progress. */
>   if (!atomic_xchg(&pfdev->reset.pending, 1))

This looks correct to me - in these two cases drm_sched_stop() is not called on the sched_job, so it looks like currently the job will be leaked.

> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 92d8de24d0a1..a44f621fb5c4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   {
>   struct drm_gpu_scheduler *sched;
>   struct drm_sched_job *job;
> +int ret;
>
>   sched = container_of(work, struct drm_gpu_scheduler,
> work_tdr.work);
>
> @@ -331,8 +332,13 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   list_del_init(&job->list);
>   spin_unlock(&sched->job_list_lock);
>
> -job->sched->ops->timedout_job(job);
> +ret = job->sched->ops->timedout_job(job);
>
> +if (ret == DRM_GPU_SCHED_STAT_BAILING) {
> +spin_lock(&sched->job_list_lock);
> +list_add(&job->node, &sched->ring_mirror_list);
> +spin_unlock(&sched->job_list_lock);
> +}

I think we could really do with a comment somewhere explaining what "bailing" means in this context. For the Panfrost case we have two cases:

  * The GPU job actually finished while the timeout code was running (done_fence is signalled).

  * The GPU is already in the process of being reset (Panfrost has multiple queues, so mostly like a bad job in another queue).

I'm also not convinced that (for Panfrost) it makes sense to be adding the jobs back to the list. For the first case above clearly the job could just be freed (it's complete). The second case is more interesting and Panfrost currently doesn't handle this well. In theory the driver could try to rescue the job ('soft stop' in Mali language) so that it could be resubmitted. Panfrost doesn't currently support that, so attempting to resubmit the job is almost certainly going to fail.

It's on my TODO list to look at improving Panfrost in this regard, but sadly still quite far down.

Steve

>   /*
>    * Guilty job did complete and hence needs to be manually removed
>    * See drm_sched_stop doc.
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 4ea8606d91fe..8093ac2427ef 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -210,6 +210,7 @@ enum drm_gpu_sched_stat {
>   DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
>   DRM_GPU_SCHED_STAT_NOMINAL,
>   DRM_GPU_SCHED_STAT_ENODEV,
> +DRM_GPU_SCHED_STAT_BAILING,
>   };
>
>   /**
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
