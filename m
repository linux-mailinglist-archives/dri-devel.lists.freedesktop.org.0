Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2B2FAC27
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA3E6E5C6;
	Mon, 18 Jan 2021 21:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA306E5BD;
 Mon, 18 Jan 2021 21:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/OvsYpaUlcYVeiZ2517ofmzVpPmRAMDfh+qOkdpM1xJhXZVOEEtm9BVsxKqVGoikUoXo7VU/nM6nypr7KaYGOwXswKG16RC3fzTwo51f2X4JsPD0AILPIDUj5u7oocmKetL//YOLVXlBWh6rLZJqurxQw+eh5fJeOWp7Ix5MsnPqvl5xZyZnqUJkFoLTtGqM80idrK3P0ODlnL/oujDI7Ssa7RLT5cNNjcXiKIG+uhdDNmwVWyLPDTMsCzOc5vGl2POCLCeFaVjn/Qwk6IeDuZv5A5MlJ06TxIaNxZ/h/TPXoS5ThIgJePUvO+k1IkYkOWCBOv7/LMdwSmCGrLRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDkDjw+QgfK8Gi5BC9Ui5oA7T9i8V54hxCZRAFVplHs=;
 b=UmrFu18V+mxRuVLeKkumBpVG6KeP/ZJ6g4nB/Mu9Sw6qf4wOomJzCOoFCsfbqf9D85f5h5E/UHKDfV6eKUHTCiaOCE99219BKge83zx2jwyDb6mzhh5hePUV2hlDwTueq+kKmjszR43jRsxjfufRvImqwke5kvEH/I0mNdvkkF2vJSuJNP9Kj6tUib0zjKbdJdzfd21JRZZw/2iKcBRhmhyWR+hTcgYNgquzzoQeT+2cJe1DzpD1ghq356xAP+KpbPnSIh2ARbPLz3+9zf7VVJwSrG5GRnExQgy96KOKgKOfQASl4aeKQwZAFIrLBqUt87woJJhZ//1rU2JsXB2meQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDkDjw+QgfK8Gi5BC9Ui5oA7T9i8V54hxCZRAFVplHs=;
 b=Pix7s//9LWisbUL1fUFDNrIekOPX5uZHCZeHZy0eXKbCod0gd3Cxt8APMSin0WZ4qSG3LmmBwhk5wPdPb7kAoX2uAyi0A28G9Ely3dGHe9evFkUjZVSg0ZTxMwj2XG5FC0yD0jC18qrEagmqjS0qh6ZviCMAl6uBDnot5wXJGac=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:48 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:48 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 14/14] drm/amdgpu: Prevent any job recoveries after device
 is unplugged.
Date: Mon, 18 Jan 2021 16:01:23 -0500
Message-Id: <1611003683-3534-15-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:84d3:21cc:478c:efa7]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu-1604-test.hitronhub.home
 (2607:fea8:3edf:49b0:84d3:21cc:478c:efa7) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 85738ac4-67b3-4735-3037-08d8bbf468c1
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4767D8D3EC9CD955175352B7EAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RgjCHMqdZd4fH4Uw9Akk+V+Delipg5XRLu6FAPL6TUpH645QMD5dBoB6WHeOt/3gwYdM0urZWvAbSAY7ojyN31eUFTsqMujxkvaWg8HOT/4/WfonlOGQCslc/ECM0fSv2/HGJP3VQc6td0/qLc1pGgiPtNPTNoXkfex7peNN2wb/4IvaQoiyY+H0CEpM8K8+HHjEYlxy+l1A9yLh90ZCDaDRv0MEG1LZDaeY2/CbUwHfy+1QoQUAV/B4jiqaHUdTflCiK6zmZvdTUyL67rEBZsmgpz6Z2GeeNq5a7guXnmrlrvB7UFJw7bqJkfjJfiH9B/YnZrjpKJ9gzBqfB5yvaBBdwP9Oxje/H6jYLaoEjauaqsHzyElfNlX1empJtO7QJzEGf3oChrGELL9nksQ1ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(6666004)(83380400001)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?34QxFK8BiRYbs2wMUeSN2r16M541wquDfSrKPfM4dHJBHhVxWm1Rzoh/sZWN?=
 =?us-ascii?Q?9MTqNh+8Hn/Cyc4D1XM2qlU/TZaOmgT6/9VEwdrHzZsPFu47ls6WPUR0Jufi?=
 =?us-ascii?Q?vRskIP9Us84WLjJ7T2UGPwIY5fuJNmWOVfAoEceFYyj8mllzGMYJjwUQqslq?=
 =?us-ascii?Q?+Y31dX1Yy3Q0sXCApMGIMttYoAV9cW8Fn+RKJpiNbIZYVGAdth3+gQBzGe3r?=
 =?us-ascii?Q?+1WDY5K7LZajxfLpV3u96jhDj/V0fKbrYNK4PyqQDiZRiFyPseoW7nYXaWOd?=
 =?us-ascii?Q?ce5hnyIV4gYXa92JmbVQTFt9SDxyNnrN6+SBrRSpfAEYK37SX7KgYZkvm78U?=
 =?us-ascii?Q?8zzRDfFp9c7gXQu23yZOaWANltNXRglSDjKFD2K/x5c07V2SV20sXCZGt0q3?=
 =?us-ascii?Q?bs2ODJimbFDNIKEsXjPiGWt6qEWZypSV9ol3G2gxikaKEz0wNADtNJpGm/xB?=
 =?us-ascii?Q?pGquhPowX7TgkySsCb/MGSyeoZLW+wd0cbScZIBnXZ+JyvBWRcCsY50LWT5t?=
 =?us-ascii?Q?oHJhZNqEypceiy2hjZr7g4yCDcDhDCR6Ji+lVvLPCM2Nm9WmmsrYyrFolBP/?=
 =?us-ascii?Q?FprSifJWf+1VRXkah0jCM9YyIGacxp2qqp02nDqOBnPNn3ZcsRp1ckmml2tb?=
 =?us-ascii?Q?TK0e2+XzFROr0gd3xTo21lcB6knZh9m5rYcMQQIwQ59UlPjvHtSniRzcDJQR?=
 =?us-ascii?Q?hDDW19Y0BgxYc7wfCHlvcXP2aDaYSVCYfW1Gw4ZmWrq7ygh4OeK86B8O2iI+?=
 =?us-ascii?Q?TrBJDQPuwp30jzp5350gCWrJMe/Wacgt4GYexeWZgNpcZwQkM2O5v2tM2PHk?=
 =?us-ascii?Q?Je3q0j23ji/bfVbig40zx1dAbUFEEsXQKybnuqh5X8QCZB5dQMp9NUGmnhnQ?=
 =?us-ascii?Q?1bT7o/JfvKbXjtZdpEt2R3P3XTW+Lx6NG0q6Ri0UiugatwMWGZ3iDL1CtMWa?=
 =?us-ascii?Q?rtLduJCcQGKf/zml1KRtqTnwlZp8DGevWapeyiaenS+94kPuBFUws4SWOlMT?=
 =?us-ascii?Q?05cUXNskijI3jpOGttEk0l9/9KH80DG5JFkxAaGuKLRiAWg8hqjiVXsktAnR?=
 =?us-ascii?Q?FJsAhFVML3+LFoJ7MRppUbdLBXAe5yi86JbW3xj0knhLCg/ISJSCOma0Yeay?=
 =?us-ascii?Q?C9zU3crZeWuG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85738ac4-67b3-4735-3037-08d8bbf468c1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:48.0098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKpnSvqrU7rmyM9q6PZw42MqsBTaRoH0KytNH0buR1EwVcIi7MRCOXwNHbO/VtPuTeL/PbtXX0PbMdHLctHi9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return DRM_TASK_STATUS_ENODEV back to the scheduler when device
is not present so they timeout timer will not be rearmed.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index a111326..e4aa5fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -25,6 +25,8 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 
+#include <drm/drm_drv.h>
+
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 
@@ -34,6 +36,15 @@ static enum drm_task_status amdgpu_job_timedout(struct drm_sched_job *s_job)
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
+		return DRM_TASK_STATUS_ENODEV;
+	}
 
 	memset(&ti, 0, sizeof(struct amdgpu_task_info));
 
@@ -41,7 +52,7 @@ static enum drm_task_status amdgpu_job_timedout(struct drm_sched_job *s_job)
 	    amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
 		DRM_ERROR("ring %s timeout, but soft recovered\n",
 			  s_job->sched->name);
-		return DRM_TASK_STATUS_ALIVE;
+		goto exit;
 	}
 
 	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
@@ -53,13 +64,15 @@ static enum drm_task_status amdgpu_job_timedout(struct drm_sched_job *s_job)
 
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
 		amdgpu_device_gpu_recover(ring->adev, job);
-		return DRM_TASK_STATUS_ALIVE;
 	} else {
 		drm_sched_suspend_timeout(&ring->sched);
 		if (amdgpu_sriov_vf(adev))
 			adev->virt.tdr_debug = true;
-		return DRM_TASK_STATUS_ALIVE;
 	}
+
+exit:
+	drm_dev_exit(idx);
+	return DRM_TASK_STATUS_ALIVE;
 }
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, unsigned num_ibs,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
