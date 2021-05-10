Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62083379428
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6096E8C2;
	Mon, 10 May 2021 16:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2067.outbound.protection.outlook.com [40.107.101.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0CA6E8BB;
 Mon, 10 May 2021 16:37:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ad73/V65/bNixlr7E4bGVfLiP2RBaz/Dye+lh9MEmQ6i83Jk98NQpWVY67VOro7zc+nEG/2M9rEe6V/a9LRm7GdurDgcqvl4jac8IJ1XSmNWYAyxDt7yvkgk3lzhYdgb69aOsEkz3Hp3Vf9IqjHUxROmfH4niBXY87PW8XZRgX8f182CbbIOdDJ0qAViEqHVKbfre/RFmX02WzglT49LUep9+NvGbLu74+icnpiJuS3g/7zZKbVYxB9Mc3fMy6VXLtr3a3wcSsYkEdhvgJx3e8H9hCvg4o1dmF+ay9BkYHyiz61oTpW7RsuLMbguhsqQm2WLLvVQrseYJFaTP5NUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq2Nfd7RRClQQ37WYASWsolamzag+TDEAOgKHpaDDxg=;
 b=SmeYE+wYDrfTYHOHcyLaWkl/S8qQsfG+0lhsWaaLbAJgIYUENhS6l3ynjM9o3Dptu/sp2ecMhDVhl1kZmyCP9XhKemTsxIm9Gz7laGoI5bpzy/8bcsfA+9J9nPgUfm3DHvdI8im5MW74eO20s6vAZq4vufzMcvMYQnc/L6Jwkbc0qi03pzAQp7tsB1iPGRyszfTR3FjTzTlimluQqV017KpaSv0bJZW1E26MryuuW+Hn2y/8CeF5k78y4Ac63/hE+f930hBkiIh64IceWNy0/XKH8SV+dd/0R9iIoWMgQxIcNvUlDlRiKnneB9m1XpfX06aRKfdLZwIitWj+WyE04Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq2Nfd7RRClQQ37WYASWsolamzag+TDEAOgKHpaDDxg=;
 b=HyNwLimS1rBtXSCPrPhA2dG2pjU6yZgR+Tq1s5VhHAC2WgQvCugVvD0fkZScEFeEXuxsEw/79sOZxN9xbF3kjKJBvW1xYAHTU6DXi4EpczbkBYO+FqqYDcUKXQHpaK46vSSvj7KAmFwP9SR5GDixfNlBoknRNUaPEV63vehHWdM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4717.namprd12.prod.outlook.com (2603:10b6:805:e2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Mon, 10 May
 2021 16:37:03 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:37:03 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 12/16] drm/amdgpu: Prevent any job recoveries after device
 is unplugged.
Date: Mon, 10 May 2021 12:36:21 -0400
Message-Id: <20210510163625.407105-13-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:37:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa2848a6-f9f8-463a-a7fa-08d913d1d6fa
X-MS-TrafficTypeDiagnostic: SN6PR12MB4717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB471775C9B897F6E0447825A4EA549@SN6PR12MB4717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oRSRjvYl4qPVeoQ2x7n3yX+DEPJDxE9Qpg1hAN0LX076qS0a282XvFIs2aYfMu7WgWMZdkrYz6Wqwxbh8h6/YAV3laaJorTPAJeRvWm6d6a4a1CPh0HsMANJpVhiCV+TDaHy8NdgxJcBM2Q4OwH35lRu5ta2Uw9PFmlA3N9T/EVQ68ypdc1xYS032C/CBtElP7zlDeKr0dWyHOh/ERL84FJGRj97QYXSvv5V/RENf71+dEgc9K56RW/ZNyCfV4o6lSBMT6Z3Kw96V2tuuvlcCMX5L2905vOfFzo2WXnjxqcGHxMZgQR81aO097XMuQOHtLqVlikUPU2LzbFcZb8UE9cNM7SAkgYGsOEEya1LWYHDCpZjATs44aBxqWAh9jX20yc5zEa2M9KtfBgKiZpB+vZU3yIsp8PphoerXd74ILK6DDFekQivLZkJ4/gBXxTG9l4/eRsRxk0UutUjSzdWS7UGCj011uULwMeEqsi7Hrrz4BkZsq2Od31jPa+6ytSVtEMxLkWBMxxWwbY0XlkMHv/hbI8Wx56lEVmey5aWcveY62Ul6hvTsV6GlpZCvMoUoeeiIbzV4omQkHqJ0VcDXAUA7/+ILRGJcij9CAuihhs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6486002)(44832011)(83380400001)(5660300002)(2616005)(8676002)(1076003)(86362001)(6506007)(478600001)(186003)(16526019)(8936002)(6512007)(6666004)(38100700002)(36756003)(52116002)(2906002)(316002)(4326008)(66946007)(6636002)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4uZjXku+5LDOlQhicl7snFE+crf9H4fiWGkMsCRTOcrr8c1hj8qQV6/Fp8UN?=
 =?us-ascii?Q?rPEuejYZqSKTYiEIFT1rotWExFsNwvB4ZgS1rr7L9tJP2yjGqFJhJSnGKhDg?=
 =?us-ascii?Q?/QZJbiOAKANZ6FdqbNfT6TTDL8Qyi1oyZE0cJSKW2S2NhHDCiY+Bhsy+qLoX?=
 =?us-ascii?Q?R9kSOEpHO+AOy9pjPnMT4RGqsFPrkd+CSCN1byT6aoHk5mIuBfhJfwf7ATYc?=
 =?us-ascii?Q?QA+DSwQrp4ivST4uDS3QO+bV1NDVa1CX2RgB78TwilgA0LR2fA809nwxy9uH?=
 =?us-ascii?Q?92a511X7g/rbC66jrlaQlvzvk7zb2Z3tlfc/iaPHNjNN5cVjmKhfRqSg+Iv6?=
 =?us-ascii?Q?1LcPHyI9ffmvoWsBwd1nXYJFDjjc0EW6tq89erZYKboRMXZ18yYJd3e9HQSn?=
 =?us-ascii?Q?XkpTcYTmZ6/fkQyDmGgkudKMe9fgwzNA5GhXqlDefVe5e2wluewaedYsXyFS?=
 =?us-ascii?Q?vgq88HhI0UNIn5Z5sNth5QSCDi07llmP/MFXPejJEqLPWMOkAQ3qjkp1fY0Q?=
 =?us-ascii?Q?Nr0QMF+VRjCsJ67sC+iP0YAwakLfV4sWUp7+gx4pX0EfSfUXxPa3ntGp2OYe?=
 =?us-ascii?Q?HzKnmjN7Wxi2DEJWyqloI3i4MzxKNoFqb4pB0MFfeZO/0y3U9rq4JVlzCkVm?=
 =?us-ascii?Q?5XHpsFeqDYSbUgfKscOeO2ROWDYhdETpEoyUNFM1hUMEhmT0+E1ngDRYVU4O?=
 =?us-ascii?Q?OciTI05M8qA532243l9P3Nm+WZG1+dsjKvUKjDETsFtlkEPyMpvqFrokeUnx?=
 =?us-ascii?Q?zUoBNRpA08EBF69kjpjhk4Ic8XxWKbsBwUkWgYgZkDu923XyUJB5H88yN0za?=
 =?us-ascii?Q?nnELvdIC16F9Gela2zO3Y3Ai5EOS0Sigg0c27bfAyY6h72M+49JgNST7u7XO?=
 =?us-ascii?Q?zQ8tqXLYHg4tZX1v9ZX/kM0VWw1WFWtvWvw+tpqaMB3vP4SDSBWlL8wXvEQY?=
 =?us-ascii?Q?iNpIZr/eCAU41OMdGHQnRO57OAhQAns7Q7NxqGKfnxjvZhZF1Rx8hli0kX0G?=
 =?us-ascii?Q?ew9JmTwOQkN5Ma1N6tm1pjl2lTSI0+Hq4I/3fC91wq6eeyGKtREJlhHl+MrF?=
 =?us-ascii?Q?SAfmSBS2H8lJfzKSFCtnpWmV9eOBZg0KQmTcd+MdXKfpmm9kuPUtn88VhIEF?=
 =?us-ascii?Q?AqVcb0xM24Nh8fbqG3dZXBV8Bv5YfPi5mbmXs6cRfcr8AjS5g5ba706vxYvv?=
 =?us-ascii?Q?XIyor8ZrAHIWI0MC8MGifM8/HrPcunGtxACIwfO/9AWZVp1fUErA2GR4VDxC?=
 =?us-ascii?Q?GiEKdAvU8NmlH3XvyeTYPKYpyRbJ21t8snwcf09D0EjO/L/iTeLDudqQ3Osc?=
 =?us-ascii?Q?w+pNnrfXRuk6s9xMJOln3rVISG5OjAz4Re8bws5luVs8A8sOUKFtoVo+YYj5?=
 =?us-ascii?Q?ys6P6oZIZ2mhOHrXBvxlLf6CmHuF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2848a6-f9f8-463a-a7fa-08d913d1d6fa
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:37:02.7618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nw/jGj0HDHAP8J/HC/+VG8bql9xMWEWonFlg5WNiwAkM4INIfCPFo1d0MzuhMUOj0aCPfBUmD2eanEvMok33tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4717
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return DRM_TASK_STATUS_ENODEV back to the scheduler when device
is not present so they timeout timer will not be rearmed.

v5: Update to match updated return values in enum drm_gpu_sched_stat

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 759b34799221..d33e6d97cc89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -25,6 +25,8 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 
+#include <drm/drm_drv.h>
+
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 
@@ -34,6 +36,15 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
 	struct amdgpu_task_info ti;
 	struct amdgpu_device *adev = ring->adev;
+	int idx;
+
+	if (!drm_dev_enter(&adev->ddev, &idx)) {
+		DRM_INFO("%s - device unplugged skipping recovery on scheduler:%s",
+			 __func__, s_job->sched->name);
+
+		/* Effectively the job is aborted as the device is gone */
+		return DRM_GPU_SCHED_STAT_ENODEV;
+	}
 
 	memset(&ti, 0, sizeof(struct amdgpu_task_info));
 
@@ -41,7 +52,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	    amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
 		DRM_ERROR("ring %s timeout, but soft recovered\n",
 			  s_job->sched->name);
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		goto exit;
 	}
 
 	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
@@ -53,13 +64,15 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
 		amdgpu_device_gpu_recover(ring->adev, job);
-		return DRM_GPU_SCHED_STAT_NOMINAL;
 	} else {
 		drm_sched_suspend_timeout(&ring->sched);
 		if (amdgpu_sriov_vf(adev))
 			adev->virt.tdr_debug = true;
-		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
+
+exit:
+	drm_dev_exit(idx);
+	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, unsigned num_ibs,
-- 
2.25.1

