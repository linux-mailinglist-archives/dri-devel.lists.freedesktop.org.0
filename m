Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6238033CE82
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 08:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0A589B3C;
	Tue, 16 Mar 2021 07:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2FB89B3C;
 Tue, 16 Mar 2021 07:19:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UINw1cj56w1c193WjcjRhON3NVU6wz83TDW6dgEu4wRnEVT1lMz3SYM9+pamo0aA8/baOXMXOcAJFPGPuXGzCgn0IGq9/xhdel74Pf9vphXfaWe9pLz2/H9ffo16ngIBSvFn3pkODlWz1oXE1PpD09dC3xAA4i6bTcmy2QZH5FWeguelMQmgMcAOL8P2en270X8w7BMDaSOgmwBxxAcnN7dLI9FlBDNbwRIScI6pL9ZKgakOErEKW87F24d6prQo3eU0FCWO1c3DzKtOG0GSVMRW07+mxcqII0t3P5J698jZOn5Ex4xcYvaI1iKtsM9x4jvuaqFg6/GrB2S7+aLjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWHVI57p3BnjEZ+bnzq+84B5r6mQZZSssWXshgwAS24=;
 b=jrLLdPRzytTWPpZ4GPPKqIzo2jDHtx3b0BNX0rrCLRXzBVWSjHKyMaAElwdabjQspzY2puOfj7+NTz8SvojVKTB38vFREArMa7lasNBjrs87iGWXbAZHwcwPbN1SS0Z0lGSkCzwxeW8dFpNcyMEYM91TaXyNj0Fa+0dGT8yRo18z7pCr1kuLCVkVd2h+We0reUrOfmJTFNaaTFnN9crVlrOpB3bEaV2MwrYQ2w3M/jtC+9z42in18TugL0Y3FBAHDbWdzRXGA12TyXx9uYYP8hUHOhJn1dA7306g9W1WJx4bbU8ADO2+p+NPsWw8NzfqQwvKTukpLFgmtDNWcvUqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWHVI57p3BnjEZ+bnzq+84B5r6mQZZSssWXshgwAS24=;
 b=wukzqCg+q44S9Jght7MJbxlHEIslYRBEla4Fsen1BWdGlwgj+YK75pVGecMH7qgsxIgOzsdwX7dnW2CDqaWxAxIaXnFDgG2YnbPyVZh2dElc1jSXl8rFPUElld4sR354Aajt6TaDZ+I1c/YYG4Lp1vZ7ZSuYhx6/coopE+4kBPc=
Received: from DM5PR1201MB0204.namprd12.prod.outlook.com (2603:10b6:4:51::10)
 by DM6PR12MB4266.namprd12.prod.outlook.com (2603:10b6:5:21a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 07:19:39 +0000
Received: from DM5PR1201MB0204.namprd12.prod.outlook.com
 ([fe80::28e0:5877:b4e6:6bdc]) by DM5PR1201MB0204.namprd12.prod.outlook.com
 ([fe80::28e0:5877:b4e6:6bdc%9]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 07:19:38 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, Rob Herring <robh@kernel.org>, Tomeu Vizoso
 <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Subject: RE: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
Thread-Topic: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
Thread-Index: AQHXGVr0ttnalfpTIkyzQ3GFwzEsHaqEg4SggAGzJoA=
Date: Tue, 16 Mar 2021 07:19:38 +0000
Message-ID: <DM5PR1201MB020461EEDC275748389BB631BB6B9@DM5PR1201MB0204.namprd12.prod.outlook.com>
References: <20210315052036.1113638-1-Jack.Zhang1@amd.com>
 <DM5PR1201MB020453AA9A2A5C5173AF4D84BB6C9@DM5PR1201MB0204.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR1201MB020453AA9A2A5C5173AF4D84BB6C9@DM5PR1201MB0204.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-03-16T07:19:35Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=66e9be39-03d2-41fe-adf2-e4270c782a85;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 22861739-257d-43a0-43fc-08d8e84bdc40
x-ms-traffictypediagnostic: DM6PR12MB4266:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB42665AA4398F7BE53AC20FA0BB6B9@DM6PR12MB4266.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VCFAFrQ7jK2f/HBML3rv0cDxzFgpEEDeRmoT051djmuW3ZgvZo7pP65EeA2yXYkMhailqOsE+bJwZEPvCRoPzXaQcuMrfmGBL3qT8fFqRl1mfk69+kWNmtohkdgmw7UIWCzjdsYerRS/Hvjh5sZ4qz3uixwVkmAcerEtpV7fDtg2ywzIQT7vQ87ftQPO4VEfbmERBtbCRniGL7WzKCWRPr11SjMFB3qO5HaKGIpv1hrghivvABatRcznNQ0wToEqPr3SQPWCx2izZHGa33Rxoy5K/3vkYyzF4MrPytw6kF4Q8L7453pTDfOcdCdtJ8LjtgRHlyPdueWqXEK3UG0Trhsle6oKqg6EYCiEAoYS3z7JCiaQdgO5Lo4cegER4/YsMoF5LfVybCmsBUTg82JXF7CBNBaB7UOKU6KNSxaqxdMClKMOWLqqgH57p2LyPP1TRmE//6vg3mDcZULSCMmR8Wnu+INrgr9GBWnmbu9bVwKuP5o6ev2UBooiIjc/AYrzmlR20TbwHgKmxU7I+JDhp5EON074hR/tTIYhNpXFVWwtVtNq4Qs7KnwcLb4kZu1Keu8IAB9C9AQD5iGP7Oj7fxsj6ytHizPQXJDQ+CpbB5M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0204.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(8936002)(2906002)(26005)(6506007)(55016002)(86362001)(186003)(478600001)(53546011)(9686003)(52536014)(7696005)(316002)(66446008)(71200400001)(66946007)(66556008)(76116006)(64756008)(66476007)(110136005)(5660300002)(921005)(8676002)(83380400001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?YmxG2JvuT6cel3lHSpN6LZkghL+39TVpv5UTG24A54Ka676MCJSdq2tYEZuc?=
 =?us-ascii?Q?1x3hvxyQbSqm+21vDLjSf4drWotrNK655e6zNT4oIy+jebQ6q8zGaRx3bOzM?=
 =?us-ascii?Q?/Y1dqvr5WnfcYA9wtw9du+pYWZSPFXGGlb51Q+81szMfVrEhRdmciqPrXrHf?=
 =?us-ascii?Q?HjNVKECLxCwNjvDiQ3aRhrCTzJAu0UECs29bjNsrGY3BFFj3EBi1nQLJC7GF?=
 =?us-ascii?Q?icJ6j2O9R3Oy77qKJD/TJ2+uR6XWD9fRCqLrlZNUSfmP8hMrZjJ1KpK53M6b?=
 =?us-ascii?Q?tHzfPNodDcSPOWOyhgt7eoQxO/t8P7fLbrIqn+aRKmbrflxYVSwjjDiV58qq?=
 =?us-ascii?Q?7S2futL+Bf8aPACda+a42L1tnP3MmgoGF9aUAGWPf3T51jF7WIWBwCmx/HF4?=
 =?us-ascii?Q?anmeoEgyD3NKJEXoPhbzxtdFrCbjrIsN6EPG2WQM0ZK2zahnCgPpGqyh/zlV?=
 =?us-ascii?Q?dXstnVs8/f8pDZOcHrIYjMPxXohkfvFaQjSAsSTx1xf8cPEHtmu4dtnLMeJ6?=
 =?us-ascii?Q?3gzPpzEmO8E5NZCk2qxv5Ivt6OdKO6Vln6wcltutmK9b4tSN6gltS0JpUz1w?=
 =?us-ascii?Q?GvQLcSSWVaVcb0unR9mpHj0b7m0QjpWPYaR3Mz/ndFSxl7PgjUB7Yhn8YKTV?=
 =?us-ascii?Q?vQ4Dpz/toZhXfWQXjrKLwxZByPocyAbth4k7pHpLRyWIs/9Xf2PthPMoQHNU?=
 =?us-ascii?Q?P1KYT6f6MUIxA5+vqfVTBqNVqM/qPoR/12AKwTe6xdHFLgMprfE4V87wVC3N?=
 =?us-ascii?Q?/WGVi+wGGf5ckVR8LTBkjasfOS1gisiJXwffbOVsrMAYPQFvJu0XdMFrEXFM?=
 =?us-ascii?Q?uXoywS/P/bj9mplp0gPsPBqY1xKm246d7McYdTJIFFLBOX2dP8mFnLxrXvKp?=
 =?us-ascii?Q?YF7flWJ/UwMUiSBf/9h/l7ZVsgzfgHKK6AGxbwqamMkhSqTADAG3OmNgvkVx?=
 =?us-ascii?Q?C7NACtMfAdUTZ87UcfDgXESTlclGsy5plKre+Y/ZKxs06cSXiAZSBUZ2WTWd?=
 =?us-ascii?Q?EPSBjscsC5Uy8a6pd5lGNbyhvMapDpU/4SalItoD/no/XuUj8wU/LUlxru33?=
 =?us-ascii?Q?6IpmXAI++v1fckYCvVAUDEXL02qjbkiPtqRSVeTu59Hf+DChMq2osnsJaAtd?=
 =?us-ascii?Q?EYg/lj1MaNQVLTG0CqcdNqL4YJz8x0FHrImTz6eBzkEjVdaqQCfjkWFYX7Az?=
 =?us-ascii?Q?+GZDo50Ak/1ti1vUzNH63LI2mrhz7ZEPQ8svbFkJG1Iljj74DhCnVE1pEA6j?=
 =?us-ascii?Q?GzpXiu7D9wgg/1R/SQTwQGVxW3K22RAsct2qzLYNbxxa22BpWIOLZxq8NW3I?=
 =?us-ascii?Q?SCvxgAfTgHttMNYUcKL0b53h?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0204.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22861739-257d-43a0-43fc-08d8e84bdc40
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2021 07:19:38.6126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YFqdBaarQ8MgcHf4gIVGB12/jJC1Z2htAQt3ow1JkrthvxOsMy62G0Z48SzRlovv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4266
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

[AMD Public Use]

Ping

-----Original Message-----
From: Zhang, Jack (Jian) 
Sent: Monday, March 15, 2021 1:24 PM
To: Jack Zhang <Jack.Zhang1@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Rob Herring <robh@kernel.org>; Tomeu Vizoso <tomeu.vizoso@collabora.com>; Steven Price <steven.price@arm.com>
Subject: RE: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak

[AMD Public Use]

Hi, Rob/Tomeu/Steven,

Would you please help to review this patch for panfrost driver?

Thanks,
Jack Zhang

-----Original Message-----
From: Jack Zhang <Jack.Zhang1@amd.com>
Sent: Monday, March 15, 2021 1:21 PM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>
Subject: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak

re-insert Bailing jobs to avoid memory leak.

V2: move re-insert step to drm/scheduler logic
V3: add panfrost's return value for bailing jobs in case it hits the memleak issue.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 ++++++--
 drivers/gpu/drm/panfrost/panfrost_job.c    | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c     | 8 +++++++-
 include/drm/gpu_scheduler.h                | 1 +
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 79b9cc73763f..86463b0f936e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4815,8 +4815,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 					job ? job->base.id : -1);
 
 		/* even we skipped this reset, still need to set the job to guilty */
-		if (job)
+		if (job) {
 			drm_sched_increase_karma(&job->base);
+			r = DRM_GPU_SCHED_STAT_BAILING;
+		}
 		goto skip_recovery;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 759b34799221..41390bdacd9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -34,6 +34,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
 	struct amdgpu_task_info ti;
 	struct amdgpu_device *adev = ring->adev;
+	int ret;
 
 	memset(&ti, 0, sizeof(struct amdgpu_task_info));
 
@@ -52,8 +53,11 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		  ti.process_name, ti.tgid, ti.task_name, ti.pid);
 
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
-		amdgpu_device_gpu_recover(ring->adev, job);
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		ret = amdgpu_device_gpu_recover(ring->adev, job);
+		if (ret == DRM_GPU_SCHED_STAT_BAILING)
+			return DRM_GPU_SCHED_STAT_BAILING;
+		else
+			return DRM_GPU_SCHED_STAT_NOMINAL;
 	} else {
 		drm_sched_suspend_timeout(&ring->sched);
 		if (amdgpu_sriov_vf(adev))
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 6003cfeb1322..e2cb4f32dae1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -444,7 +444,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	 * spurious. Bail out.
 	 */
 	if (dma_fence_is_signaled(job->done_fence))
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_BAILING;
 
 	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
 		js,
@@ -456,7 +456,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 
 	/* Scheduler is already stopped, nothing to do. */
 	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_BAILING;
 
 	/* Schedule a reset if there's no reset in progress. */
 	if (!atomic_xchg(&pfdev->reset.pending, 1)) diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 92d8de24d0a1..a44f621fb5c4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)  {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_job *job;
+	int ret;
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
@@ -331,8 +332,13 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		list_del_init(&job->list);
 		spin_unlock(&sched->job_list_lock);
 
-		job->sched->ops->timedout_job(job);
+		ret = job->sched->ops->timedout_job(job);
 
+		if (ret == DRM_GPU_SCHED_STAT_BAILING) {
+			spin_lock(&sched->job_list_lock);
+			list_add(&job->node, &sched->ring_mirror_list);
+			spin_unlock(&sched->job_list_lock);
+		}
 		/*
 		 * Guilty job did complete and hence needs to be manually removed
 		 * See drm_sched_stop doc.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h index 4ea8606d91fe..8093ac2427ef 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -210,6 +210,7 @@ enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
 	DRM_GPU_SCHED_STAT_NOMINAL,
 	DRM_GPU_SCHED_STAT_ENODEV,
+	DRM_GPU_SCHED_STAT_BAILING,
 };
 
 /**
--
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
