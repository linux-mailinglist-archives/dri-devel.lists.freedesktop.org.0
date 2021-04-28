Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A3D36DB15
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59566EB94;
	Wed, 28 Apr 2021 15:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C806EB57;
 Wed, 28 Apr 2021 15:12:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRuygGgmKasg9Kjv8OyOghjDg1r42c7+aplNfOI3jYKFmp7V+xmDLdXsXwIUqsL43xSZUR0CcMMcqiv0dFckaRV4Bhd+MlFgDOzSLF77LSFvXTNDXajiArQTrBINZNGTdSnmDYjjQfq34e4vMefqGKKr+p2fK4dtu8J5VyK/bM3ICiH/OKgga9MZG55gfbX45AWm2F54M6N3EY8IbZ8fFkuKDWQZ69e1l7EhLcELKG7LRxPG7F0Djh9pVJgQ30szH/um4H2ZJHEoqPhPrJAquSKA0+1BtGNRFiZ2duzP48vx2494LrYUZmZmlA38H10cBQCEHvp+Q8gvjm/SlPrK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq2Nfd7RRClQQ37WYASWsolamzag+TDEAOgKHpaDDxg=;
 b=Cor7GaEHsxioXb1sMWCDKmgUpLUQN3W92vL72JYuolvZi+3xlAi6+dR9sFmcO6e04oFtGHWfMx/hpFpK53ChqpeEI/OCwIbfHLkzF7aQF/HUGgbIZycrNyqLdctW0IRWNZHSIAdpukxmxmMRsBkFcQuougWHaUD4wRVFNn8W4BQiD3JY0i+fQN5dp8qo56hccJNqfdzfQiEs/Ih74Qu66c5v57Vr/m+MEiShhdc//SRqHYbDBhnF1VhzfGq5klsUANCBrGhEjQVUyGBf7/3ZH9hugWesvJm6Jg2pOpHIccDE6QOJcvUJfOoljaZGEdbS7XH3qO7cRN+ADbXMlokzfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq2Nfd7RRClQQ37WYASWsolamzag+TDEAOgKHpaDDxg=;
 b=2aTvsDnRUjR3EOUdz9sxg75QN2olI0AGSm1F1jrt1yZCfVazUdFx+tMML30gs1oYbGv0c4iPmCNb+ZmQiUzROyi2VD35t0oy6TzvnSBL/BZ+2FLbJCVMlAzyFYQWUwsVAAiY9H9J6NnFpigIj5gVA/cVHaUNeM0u1woUofyGjEQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:12:54 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:54 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 12/27] drm/amdgpu: Prevent any job recoveries after device
 is unplugged.
Date: Wed, 28 Apr 2021 11:11:52 -0400
Message-Id: <20210428151207.1212258-13-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4caeca8b-64ce-47d0-d185-08d90a5818d8
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB446267A0B9FA247970F12BC8EA409@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OxorgGlpB5BJhIgKQW0O8o8MsICkkUr7/QLZDXTvAmq5RdlyuZuBNS4ydPEB49+zggycUhvomD6IFdZNzYpYgZ5lX3fBxohBaWeLvJ+s4dgehSmoKL18qItgJQnkAU4jUqUsyjIPuDLYeeeM0WTnYfeXzSf2RlxQIzXFL5xn/M5KWlcuXeWwgdWam3hb800hJdX+rGWXpSE0WhZbuC3zY843weuQuFl9YaYJbpKq8o3Efjiz3uuW5a40Z9cCMruUMipqQ+U9ocK1Y7PduEBHSdmKHbTaTn3nWM17mPjCrKnDlhju0uPoxrdY5G5leRDYZEyDl33eJ/S3AJqKRL5Z0dOGIu94GornXKYY8m7t6LcjGI6Gy+6udK2gKge4C5GJ8Nnh+iBs0xiiQTpeTelGFQFdT3dlPh6At5uLCtacqm4MjswQfSec5tk28ZiQmhjgNBUQKcKJXOvLMIOSddCUZKO/MhkAi1LtJcFVLYLvkjORJGZ258blSZTXuoa3EmLh1Ol+DJ4glAKS/83nq5wjD7oCtKzl2dvDivw5J1O8MVUMTuvftpgxYe2x4DmwNFvM8KM8T4SqT25uQ6IzDGEne2KS509jvQsUzu5756DuaVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6636002)(66946007)(316002)(186003)(44832011)(2906002)(16526019)(36756003)(83380400001)(6506007)(4326008)(52116002)(8676002)(66476007)(5660300002)(66556008)(1076003)(2616005)(478600001)(86362001)(38100700002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6FtouEJT7cyLFKUNDNNItX55DGroqe3icwqePAcQSf182nX36a0h6t+Hbzjk?=
 =?us-ascii?Q?7/65TquuMP3yzbJ0u+02EpGE8CFsSmt8//37XH2gPn4c8YeGAe7TFAMYVtK+?=
 =?us-ascii?Q?gO32SUcuyePc7TLpBOjsdZcdROBdeuwEHkLgFOPIChEIdfJIP9nrt49kG2g4?=
 =?us-ascii?Q?IUfMlyLWj/2m7SB+IBpE+G0iVwp/XpeQuRNb56Lu5oEvhrTpzHzC/n7Vy6HT?=
 =?us-ascii?Q?qdXpm+gnWqVDUbB/FIFlHpk34lIlztIXToq2bJSCKofJWAfVuJP1pTgxO8m8?=
 =?us-ascii?Q?1zvd9YLdWTGrqiQecfp4aWw/uyJuCV5QBM53/pO+xTByj0rvzzrGXv6pfdBD?=
 =?us-ascii?Q?zcVOkFBH0Lx9O3I24pn3EX5RDaI++gU66DX78RzQJg04X4f+4qzGlfa5IUAP?=
 =?us-ascii?Q?xsqspZ4y1Sza455mUsVvw2H8uUkxyHIkvSSTijUZ5UStbV+YJ6MOi1QgKGjb?=
 =?us-ascii?Q?A9rHG+8ag7skjBOvjEzTajX76kI68Z1hoAemUWR3T2iXpTs+rTB93a5qGCaw?=
 =?us-ascii?Q?fkx5XhqLbvNs1/m4lVpKZ/ShKqL3G5bhMScl2qudFM/lNxEJgLrkEkj2oR41?=
 =?us-ascii?Q?kDjPf5/NLkq4tUqsCvH9oWrE17rc5i93hWbEDp6XDun6NiMoSBEpFjLzugkG?=
 =?us-ascii?Q?Ou7FNiqGKYi60hRkQha8XxX3bgksTmnll+7w5lVtP2oC/fCQEKlCNDBMVBsZ?=
 =?us-ascii?Q?J3dmSullpFtDm6hIdbINBCxlsp76CmJov1+Aly9Vcg72mXKivd7/ME/hTFXJ?=
 =?us-ascii?Q?OLfKb7RLZ1tsGxuRhGOIszJZMpOFWOny5TvoF7tNcc1lrPHp6as5n5IJh+oV?=
 =?us-ascii?Q?HN8QlfDzyDq+lKTiaRySG6Ds22i5xKOLQniofIHB1ppohlcf3/d+j32Q11fl?=
 =?us-ascii?Q?7ls0rwXFffkMAqnIDhUumeFr/q5n5wkg3hcnAJ4xrvSH5ROpH3mnKq0HUffN?=
 =?us-ascii?Q?HF+3XFqCfDL3YZk/snK9K/dooeQpvAHpq6FTGr9gt1LtWnx1reXuR2v9NItW?=
 =?us-ascii?Q?2qw307j8gJpKJ9YUUVTGZZMwF19fQUDOIKO0419WdzI9gZUQsgJxJ2klUS8y?=
 =?us-ascii?Q?Xo3vViWQdMGRKKk5BfQzm+PAnej53EsrCDaxO805e9L7IoZWmHFP83ctpTGA?=
 =?us-ascii?Q?LfAPka7DePG5p+ivQNx/AI/5nLJ7sjIJFzLkqdI1prii7dfcthc4d4df4S/C?=
 =?us-ascii?Q?Khuwlas43Fky7KZt1QGSlcqE+t8oYKnHkRNhwiQwzLrEPNfl+l3oIHFMFji0?=
 =?us-ascii?Q?lRJhxz8PuwAvFEHMh74tkdtpEGU+D+5ffhvkgryhpujc+0a9eaus7etMta2y?=
 =?us-ascii?Q?5/KxHYV2EyrimCqYOBKhUGWMX4cyM0ZHaaMNSU3hjasujyV1S/Q/uNdWkKfU?=
 =?us-ascii?Q?MHmAUrRliuyzXHbVdDxUAKQw0+a4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4caeca8b-64ce-47d0-d185-08d90a5818d8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:54.0887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 133BX9YHX00l1RRiDze3iD77DRJBA8gQAvTsHQ5umBH83n/kqThEAwXmEOCQ9NQEO37pOLI5NZLZWzcMRNxjJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
