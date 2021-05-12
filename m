Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540337C00E
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4D06EC05;
	Wed, 12 May 2021 14:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6446EC18;
 Wed, 12 May 2021 14:27:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ktk1Bp3p2ZH/zwOCuurfcUnlFQXMAhj06P29c3MCZU6ArpsKIMpWPtvVH8M44Gh4Cj2Zzp3o15F5Y9HQohsH/sx6VDS4VyeVsXPdi251qkMDPDHTbazYE7gtj+YAK+Gr1N4gO049iT5IwnvCb+TMSox4BBNyjPJ5OnDiF+bH48Ujkq44nOfMffqlKF/ZWZSq8i8N+oe1X0BZyoWWM3tQYIoFq+Eps4EicMYHO6Vj57ORfMnNDVusvzG2jZ6LLKwNJVVjicbMFGeSSkYFhzlOOzik+Icto8qTbtLp7OgGBluBkEa7llHXivl6zxQ0kOEojWK5XhF6mPqZW56FzVtnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsuHwoXxG2GPArc939kNaSlXDwLw+Fkof8ti3WmEEZA=;
 b=TNZ2FXE9QjUl1Xe4Ck/f4obAOyFv8MUe54VDvOY5qAyVn4+ifQq8jby1giUNrNFeXg86AF02TrT6acWB3QE0fRVpGo7WSafTDW7qQLWSxvktV54MG6BcHiOmo+VM+l6sCoP2qFxY9IdA5qz7QTgp6+018MIwsgjYxoX56bO8jum6+5zct4bEQZ5QDCkU/H8nsHVm6qVzqFuB/WRKExGjTQuzGQV8mVlrrKRfBbo7E+8CcqoYuQi/g2g5QV8aD0s1OFPX4GWNtuAFALHvIcuDpG1Yn+7ctU1kzt+yeIznTt7WDacxIu+wLkCInggbYWtn4vtBTwaVLSlPEclNNCQjXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsuHwoXxG2GPArc939kNaSlXDwLw+Fkof8ti3WmEEZA=;
 b=z2Z8DPhzF4Ztx63weg4NF1yA/a0sSiYhQPMy8ULpPIiCqcl3t59QbWPyDoojpMeBjkSlAZ2aIfm5zi7I7UhAPszzVDz+b5gn32eibXPX/5ZJdoLuQ2lLME/mSljYGWQ7sv7Nrm6JSAZZITKyBSxmqFpX1Y6WkjZovApyYs+6a14=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2845.namprd12.prod.outlook.com (2603:10b6:805:75::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 12 May
 2021 14:27:35 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:35 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 11/16] drm/amdgpu: Prevent any job recoveries after device
 is unplugged.
Date: Wed, 12 May 2021 10:26:43 -0400
Message-Id: <20210512142648.666476-12-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bec6a8e7-d976-4c93-9d8e-08d9155215ee
X-MS-TrafficTypeDiagnostic: SN6PR12MB2845:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2845982DF4DE627C8446465FEA529@SN6PR12MB2845.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aOnQuY4GtXVhAzs2cVIDlW15ErGYjE9IiIOxxvp9z3jvdEctnikmIYr3Wy3jdWv0n6zUUscxqbUViOO4hCMCX8TL2VaWMzhu7FXEIvt8C6hbRQ/Za4LntQGGWEozvyhGYEuFNUTbr6zjMOlMvuo4Zeu86OZmMhhqsVro1EUX45uGIXVJvSIM4pUnMKUCbQR99NgpTupY72AW+Qsr3YUjpe6X5A7FJaezPT210MWl+MqffgZu5PD8fhR76O5APoHO9dhrgOEpWmvsWnyOGWvevLgj2SPUy70/BSsLuEJcchbGqFgVgAIfgnedG6NNf+EBBzYy9Bwn7dCp9nTJY9VFtNebdH3PewFyBilgcyskZkcAPP3IAMZGYEuyaN8kS5kYoqA//6gTNXi6IMyjWHOiRZ1pn7cdTtEVqL/zaDYU1gl1GL8kOtnmmBbG1y0HoJ3Gj7IynnQf+6CZ5NduuNz4vMEyaiiSQYqdslXUc6HIbwjkHyBADTidUNkhtwmxfGkoc6uJGLEAPPhStsyWcXIhNGOOMmqkcL8fi2+slM2KtS/OzaVpBwffKPAK8IDJIOVRFBGrTOkEk+0GO/5dVWkESmtQN93IHGSLUqrYaX3jryY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(6486002)(8676002)(54906003)(316002)(6512007)(16526019)(6636002)(478600001)(1076003)(186003)(4326008)(44832011)(2906002)(6506007)(8936002)(5660300002)(2616005)(38100700002)(66574015)(36756003)(86362001)(6666004)(66476007)(66946007)(66556008)(83380400001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVBvaXZDaENWcU82SnVlejFXNDU0NmJWNlpJTkhNSGlGSXVKbFlwRjcrLzFi?=
 =?utf-8?B?YVlyd0ZMYXZ0UFhUVXA1ZC9UalMvNE5rYVpzaXNtRXpiQ00xTUltRmxzWWJ0?=
 =?utf-8?B?em1jMUprTTNZaUFBemRFSzJmamZzQ2E3eGsvR2JQOWppMWRLTm9vZ2ZFRFZY?=
 =?utf-8?B?bzVIYWQxRGRPSE5Yb2JyQ0VqU01Sb0xwMU4rVVBHZWhGMnZuV3FYQ09lWjgw?=
 =?utf-8?B?Vzl0SzFqTnB5YkkrTCtzM0hMVWZFQmhPMlRyWUpFY2dCKzlxWVRkSlNTYktD?=
 =?utf-8?B?VlNkeEZUWG1ydGJodTNNTVNZeFBQTlJOZHl2dE8vYXpHVHhUNGpTMkt5Mklu?=
 =?utf-8?B?UlNLQTliOU5Lb0FIazZocVkvNUIwZ3VPOUJaZWE2Y2xqQjRSVWpQVGphdXpQ?=
 =?utf-8?B?M0prRGlzbDJWcEc2bURXUnJOYmkxdTVOSjNqTEpWYUo1eHRyNERpeEY1K0N3?=
 =?utf-8?B?NEFFV3IzSGlHd2t6Nml6ZjdEQ0MvWEVvUXozUTFMbUxaR1ZISGNLb2lGNFJl?=
 =?utf-8?B?a2JSeHc3S25DMjFDMmxLTTEvVUFUNWhhMTJWb2FnRitOSWpwWWdGUUI5Wmha?=
 =?utf-8?B?M2w0VDVBVklsaHBjeUx5WVFhZUQxVmJnZ3lLdzNNVWEzUWhEZ0FEM0RwOTJi?=
 =?utf-8?B?bm5NTFo0OUNKZHA1T3BCQ1FTcGcxZzBraFFCWnlGbENYanhSek5RckdMR29i?=
 =?utf-8?B?RnVWL0JZVlEyTnlXeVlvanBtSGpsZnJrUkNDaG5Pc2FueFQ2cXRhV3p4SlJj?=
 =?utf-8?B?Tlk3MlJPcG5vWFBNdlk2VGQxajBjYjUzcTg0emsrTWtPL21SbllUcnVta2lF?=
 =?utf-8?B?M2ZvYUh1aTAwVHNGNG9NMlkyTE1wa0wxR0gyS0VKSWJvQSt4U0ZwUWpHQkhY?=
 =?utf-8?B?REZrQ1hwdTgwbkNNbm80aGNEMmNnOWtXSTdrRjlQRDlMdnpybUhUVXd4MStO?=
 =?utf-8?B?Y2ZCeCtBRGxTNWZxUGIvRlM2anYwbkRmbnpkRlNDL3RhYnFncEs2Ym5EbDB4?=
 =?utf-8?B?QXhMR3hDQUg3MUI0ejhjUUErSVlTVWU1bUFkSFhOckpiSFBqRC9jQWkyOENX?=
 =?utf-8?B?YXV5aUhReUFEWFdmcUxiZzBOcWIxZDdvVUNNNVQrTDR5UEViZ285Q3dvN1Iw?=
 =?utf-8?B?R1A3ODlaQmpzTndSWGZnd2ViNXZrR21KMGVTRGxva3ppdzQwRFZ3YzcvRFlv?=
 =?utf-8?B?ZEZ3T2swSVREVWs5cytzd0FMSVp4K05kaXQrUEhCS21qZ1pZQjdvQTQzTTVV?=
 =?utf-8?B?b1M4V1pmbWZrSE5YaUsvWVFYYU1kNU1CS2o4WmIzSmlEZTBmNmdSM3VTdzVa?=
 =?utf-8?B?NHl1cGRhR3FyOWMyaDNUdVNBVFVraG1nWTI2dVpadngvV1k0QTAzczVpYVgy?=
 =?utf-8?B?aTVIUm9oMUp1bUhBVnplK3hMTTFOZnp3Z2hRVzZZY1hWNFdTVjdndWh3c1Br?=
 =?utf-8?B?VGpyUERtY3E5RVNUd2VWMDN6SHh4QmtvUkkxOUVWQnNNQnVGeVJGdDYrL241?=
 =?utf-8?B?S0xaUGlxbEZyTUh6MlpMS05KYWRyZ3U5WHJKZFlkRm9IdWx4dXBrcUxoaW5E?=
 =?utf-8?B?aEFPc3ovTUgremk5WEFtdkhzYzUxU2dVdHI0TDNua1ZkclFJUFBFMU5iUXp6?=
 =?utf-8?B?ZjVvT3lGd0hNRWdHZVYzVDlUVWxVSm9DNDl6eitCQWNFRmtjQkZ1ZmdjMGxk?=
 =?utf-8?B?UitEQWpqVDFWNE1Kd3c5QkZuWFg3RFRUUWRlRTZNbzRFdW5jWWtGeHAyQzZW?=
 =?utf-8?B?amV3bXdLVmNVakRxTUY5SjdIa1ZrWURtWUlkUW5zTlFoeksrcFRHYUN4OUVS?=
 =?utf-8?B?cUZvMFNaSEFaNE9CQmMrUHFDYXdqdllNelFGS3JvelBSc0IyZnNvdnpJZUtl?=
 =?utf-8?Q?9IJ19RJfPzUM0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec6a8e7-d976-4c93-9d8e-08d9155215ee
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:35.1045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOrrNCm3WrW2wSyBewI0vkE/bro2UGoAG67AedeQw7YjH0exhdt5Sbj2FNTAONp6UcR2niWdvgsBp0dP2jnOWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2845
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
 Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return DRM_TASK_STATUS_ENODEV back to the scheduler when device
is not present so they timeout timer will not be rearmed.

v5: Update to match updated return values in enum drm_gpu_sched_stat

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
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

