Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC5735FF55
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A93A6E9B3;
	Thu, 15 Apr 2021 01:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5C76E99F;
 Thu, 15 Apr 2021 01:24:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1msQeY1ZYnwqzEH3WBPDERHktjIoOdSVFKf10Kg3SnS+G3EBEm1s44JKth0dbP9tX1JfI57HW/LXPqBB5zf7tnpv4wTmNP4J2UZOMyrvcpgPmpt7jzqI6Ys462U9Eyy419F+DDlU8KWdQKlcimI17Y+LUfZzzKW/abMXbgOJN5NjaVJMeT29em3MwtC5d7CFg/dQy+7oTD8dd3nhJlXeDlXIRCWbkeSFM8cM314xUd4cLQDy93b4e+vGpJlfpY5y9T9bUKWChqVmDPMPxrBLCbGfImLPXRRqH8YZ4o64ZIa6j+yIhTZ9dX1eUA3rhd5WMGwTVdi0Fpu2ZbXgshz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgCvREmkeK8l68yf4R/rBzu30/HOx86EsAq9rsxDWsk=;
 b=hexfpQ2bX0ancnwldAR9htV4awifsLwfzO61m9V2PcC1vypieJw9DPQ1kcQEvyhBfgEZ7aw0ejK7T7eXZFtuEKZ/AYguT3r0ZF85MDROcNAq0RzexF6hAzE8Fap7TD00FXGJ8qpd/3zJuWgvxiwZ40gsv8N1PPwiTmlap+aflWXCIsMfWQVJwExXOfI6/qCw+igjq3mrdDj38WGE3xkZb1GLT4I5euev6OcY0LXrHxEg5yIcjc/GLRB9yDsksOCMou/LMniXDEwVkzeW0DhuvEJ1PA1GIjLru8Xo5ewEywYFo/0yNH0DZy2OdlxkYjYdEd82g+bV77fKafRWfHt6XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgCvREmkeK8l68yf4R/rBzu30/HOx86EsAq9rsxDWsk=;
 b=hdrskp+buBBmCaZyIk3kXAaeeLPsuMBOytpSUYvNHLwBMgRb7ZN/wREWouSqf3SDDTCPJToWoyepjM5Bqwp4GsUdxsg7PthkdAqQUY1j8373fcOWFDirUsOpgx7UVVXvEatfnBkiP+W/AGyLpN5MNaxCNf2KHisZ6pir1TeGmME=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 01:24:02 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:02 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/34] drm/amdkfd: add xnack enabled flag to kfd_process
Date: Wed, 14 Apr 2021 21:23:16 -0400
Message-Id: <20210415012337.1755-14-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e849258e-b716-4fb6-d721-08d8ffad263e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB479756CBAEC0EB51A196C095924D9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SgH21eojCIriTxss6XVRRaAFVEMNN0sCULYo99pY9336V2hGPFh5j1rlvtmAL86S4Q5iq+084RwViSD6xx3a9FF7DdvKC5icHzeKp80MTqG9mzKpOJ+pdw7UDxT3MOth0o1M/zImZs+QImv9jXmt71XOZ1iessxCFTdrSy7ipu2+o+LQ5LSI7gSS4Px8lOyFG5uHK8aPGmmyE/LpFu78WtnWJ9geKfaez9eaYuwQZh1UEEkbxx0OIS/DuktGduOMkxF9Q6Z5IcXrqjrlw0SUmKIV7+JDxWo2CnPuFd0Iea3Q9JYPPN5nyC5z1flNdW9xYSCKWMURfPziCrUi0JB5z3Hg9Z6NF0NWyCTGs8XglwSeBqrd9890aq3r4p4fPc1MJARhBi9ADegQKkQLSNx0YKRebBCnMX/sbw2OmdnP4u/Aq79hDLCNFggGuTBZ/kPqdkk4vEtHuFxhjdOv+OIZcwx2qQe5xGUzoZPn8CTv2MJI2Aiv5zuz0EW+datNsfRZHjMF/07UhyYOYRsn3Ftm6aADMU2cZ4LwIjIj/D7aahZt2hGy4V4cEG1Zo0ELN+PhiYQqw+HjrHnf4zIR9btkwHXADt4hanLrNTK8NxDCHiizu8hLfZt58wDXWc+l2sSYl5fGB3Sy29ZeGYd7eytLT9+As3MYduQffZi8IwRYjos=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(66946007)(2906002)(38350700002)(186003)(36756003)(16526019)(450100002)(38100700002)(5660300002)(83380400001)(66556008)(4326008)(52116002)(7696005)(478600001)(6486002)(8936002)(2616005)(8676002)(1076003)(6666004)(956004)(26005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fnP29CR11CEwOSnEDj+y0lSjXICZjik9nQFA5GcuyCm39AchPjY0uR2YMC7y?=
 =?us-ascii?Q?aaDARsLUe0OIwuaSAgOa6m2+Yagv0ut+mCLjV+U9G1H+Eahe2hIpY+VozA1A?=
 =?us-ascii?Q?UaE7L1JiKRNP7gWdA7PvZKmZJSnKlobEgNWB68T/P3bxZA7INjlGAHWVaBq4?=
 =?us-ascii?Q?RimhqZ7ccscAr++D+L9EEJZGGl6PiP4/0azwFPSFcgCoJGF4WVu6JOhgldtZ?=
 =?us-ascii?Q?+sxEoosTzKuYbyorxOFOxsDcVK4NnbCW40gZpAb9bNxnHaJtZ3CpmZbpbnGj?=
 =?us-ascii?Q?I4PZbVuhIJD9p+heufo2VPVQlIoX3wSDAPKvGOtGZCBYZfkFcvjNeDvzHMcX?=
 =?us-ascii?Q?nTapaMHQZjPOQo9fsH0yXcHMNOVc3CRhm86eYmDqrqCjuQu6f6nu/YKkBoaf?=
 =?us-ascii?Q?q5T++v1+MMhx87MnpErO4uhlOoMzh6kdYlCmoY61TVc/569CZA060zvCAQhd?=
 =?us-ascii?Q?jLtju+9Fi61Vqqn/GMvVT0RvY27tCZphEMNG0Q4uLST+so8P7ueyKlJULAsn?=
 =?us-ascii?Q?lQOqyc2GY8J5GSKxs3YalHRKL9DxFoFa8NoprR5b9IX7mUeCICDJavyTPLtr?=
 =?us-ascii?Q?/p1uF9p31ECTCSxcwgNV1DCUTU3BEYvkTzMrV2/Sh8/8aO160u+6ECm6mDZk?=
 =?us-ascii?Q?0y8NjcGI/6F9ShZ2hm5Cksfddo6ta2TLoiwvpKO2bBJeIG66pca1M2V4Il/n?=
 =?us-ascii?Q?sAfGAAxrHX9pG8LcfGgP8yZo5VVtAw+HN3vwpGRtpFZe09KPV1sptewku8RQ?=
 =?us-ascii?Q?2UrATInwFkj3SyImu5m+mybXE8hbOEwI/BH5b7ccoe5SYfjFHIZm6xtlOeYX?=
 =?us-ascii?Q?03234RCnSv6vX/SOGrI9dMAx7sY9XGMpAyjjCahzYnXJjx+yodMVvxY2fKxf?=
 =?us-ascii?Q?K3AekopbVo1rv15hzlS8os0mU698mtr0lz7L5G/2MIgJ8dllQChXb7fDdF7c?=
 =?us-ascii?Q?iDAcw+eum5LNxYbs+ihMMQ4zBnE00fFSF8Mm1E/ZX69QZuj4XVj94EdVaiC/?=
 =?us-ascii?Q?tfyO0/1G45kua6/e8qpAtG2N2/bWJyDXqBsDt7PcAu7i4Eag3IDMmKpeBqXc?=
 =?us-ascii?Q?xIc5E7BMrQ2M8i0yNbpo+WjS3yNw2oEtyKVimKxXdWHPeRETj2BQ6ZA1KgI0?=
 =?us-ascii?Q?Xo4qzc8Ib+j4mCjhYs+lUp/RXP3kMpwfSt7N4EVsVGsmQ03+VH4vB2T7p/io?=
 =?us-ascii?Q?k9Nay/5dkv7UVi0ICThhdC4abhHzInFpV/+5QUZztOBVID6D7IHTPyaLSy14?=
 =?us-ascii?Q?b+wJ193fUPioRPcR+t1L6sFIe1y6C3nKecOKaSqLkGUC2psTE6cIqWeintfx?=
 =?us-ascii?Q?Ml+lYgMRA9A3BI6IkBwYCOiw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e849258e-b716-4fb6-d721-08d8ffad263e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:01.0595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yey33JWdBU/cmijBAy/OulGweBUmvk30To42pSaxUti3ra+M9+AX3f9VwnIzN/VRu1/XA+kc9fCf9QAMU9P3yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

XNACK mode controls the SQ RETRY_DISABLE setting that determines,
whether recoverable page faults can be supported on GFXv9 hardware.
Only on Aldebaran we can support different processes running with
different XNACK modes. On older chips all processes must use the same
RETRY_DISABLE setting. However, processes not relying on recoverable
page faults can work with RETRY enabled. This means XNACK off is always
available as a fallback so we can use the same mode on all GPUs in a
process.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../amd/amdkfd/kfd_device_queue_manager_v9.c  | 13 ++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  4 ++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 53 +++++++++++++++++++
 3 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
index eca6331efa94..b5c3d13643f1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
@@ -61,10 +61,19 @@ static int update_qpd_v9(struct device_queue_manager *dqm,
 		qpd->sh_mem_config =
 				SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
 					SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT;
-		if (dqm->dev->noretry &&
-		    !dqm->dev->use_iommu_v2)
+
+		if (dqm->dev->device_info->asic_family == CHIP_ALDEBARAN) {
+			/* Aldebaran can safely support different XNACK modes
+			 * per process
+			 */
+			if (!pdd->process->xnack_enabled)
+				qpd->sh_mem_config |=
+					1 << SH_MEM_CONFIG__RETRY_DISABLE__SHIFT;
+		} else if (dqm->dev->noretry &&
+			   !dqm->dev->use_iommu_v2) {
 			qpd->sh_mem_config |=
 				1 << SH_MEM_CONFIG__RETRY_DISABLE__SHIFT;
+		}
 
 		qpd->sh_mem_ape1_limit = 0;
 		qpd->sh_mem_ape1_base = 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 1b829eef9e50..5c0efaaebd8c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -824,6 +824,8 @@ struct kfd_process {
 	/* shared virtual memory registered by this process */
 	struct svm_range_list svms;
 	bool svm_disabled;
+
+	bool xnack_enabled;
 };
 
 #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
@@ -883,6 +885,8 @@ struct kfd_process_device *kfd_get_process_device_data(struct kfd_dev *dev,
 struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 							struct kfd_process *p);
 
+bool kfd_process_xnack_mode(struct kfd_process *p, bool supported);
+
 int kfd_reserved_mem_mmap(struct kfd_dev *dev, struct kfd_process *process,
 			  struct vm_area_struct *vma);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 3bcde43ccd70..b6ba2b91bdc3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1193,6 +1193,56 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
 	}
 }
 
+bool kfd_process_xnack_mode(struct kfd_process *p, bool supported)
+{
+	int i;
+
+	/* On most GFXv9 GPUs, the retry mode in the SQ must match the
+	 * boot time retry setting. Mixing processes with different
+	 * XNACK/retry settings can hang the GPU.
+	 *
+	 * Different GPUs can have different noretry settings depending
+	 * on HW bugs or limitations. We need to find at least one
+	 * XNACK mode for this process that's compatible with all GPUs.
+	 * Fortunately GPUs with retry enabled (noretry=0) can run code
+	 * built for XNACK-off. On GFXv9 it may perform slower.
+	 *
+	 * Therefore applications built for XNACK-off can always be
+	 * supported and will be our fallback if any GPU does not
+	 * support retry.
+	 */
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_dev *dev = p->pdds[i]->dev;
+
+		/* Only consider GFXv9 and higher GPUs. Older GPUs don't
+		 * support the SVM APIs and don't need to be considered
+		 * for the XNACK mode selection.
+		 */
+		if (dev->device_info->asic_family < CHIP_VEGA10)
+			continue;
+		/* Aldebaran can always support XNACK because it can support
+		 * per-process XNACK mode selection. But let the dev->noretry
+		 * setting still influence the default XNACK mode.
+		 */
+		if (supported &&
+		    dev->device_info->asic_family == CHIP_ALDEBARAN)
+			continue;
+
+		/* GFXv10 and later GPUs do not support shader preemption
+		 * during page faults. This can lead to poor QoS for queue
+		 * management and memory-manager-related preemptions or
+		 * even deadlocks.
+		 */
+		if (dev->device_info->asic_family >= CHIP_NAVI10)
+			return false;
+
+		if (dev->noretry)
+			return false;
+	}
+
+	return true;
+}
+
 /*
  * On return the kfd_process is fully operational and will be freed when the
  * mm is released
@@ -1232,6 +1282,9 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	if (err != 0)
 		goto err_init_apertures;
 
+	/* Check XNACK support after PDDs are created in kfd_init_apertures */
+	process->xnack_enabled = kfd_process_xnack_mode(process, false);
+
 	err = svm_range_list_init(process);
 	if (err)
 		goto err_init_svm_range_list;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
