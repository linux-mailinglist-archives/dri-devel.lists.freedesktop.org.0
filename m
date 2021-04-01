Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392CF350DAF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64936EC37;
	Thu,  1 Apr 2021 04:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE026EC1D;
 Thu,  1 Apr 2021 04:22:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcLALK4R6e7XjlQZblgIdFx6wtqcf4sm0M75XIqpuT2rj/8MDr0OMupiJhF9wLBN42Zl6OdrLk9mPhlkP+ZYRo/JVFh+KdrUCaZyABVly5Z/SQvMguRvaU0We8iU7NSPh8FLSG+VIs1IeJeTUwZz/hvQlM0tams+4BYzJ2j5uYVL+qzuogvcnmVlvhk2CFYoDwUMo6D5xbC8T10YydAUTz4Og03seHk8CsaXHbnRj7Sn0cC3+w2vj/zQIyGkJucEBeTRhxSL6v/0DNfPfAuEbOMqWWiG98YF1WKPtV+kANGWDrTCPpHUTKXpQOsINzFiMEKb8yKb7QajD5oyWfiB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDOcok9wm8Pk39tIr3KjgqQjr4wR2vXFOzgudlDCMrA=;
 b=Xj6OptNF6A81j8L0FX3KS2g4PtHqtWuHWRH8tQzPGytMTQcNnIl0Trl3pOG4od3XtOrXHaoLlfehAATzLSJTTH9ptLakR+V7wSOVgN/Q4gzjxExTNwNmUnQS15AKxbRd2YqqgZf9iTqYVuwrl8wffT+pYBJiwSXXLgDSI4TmJYvB1CVQdGH6MxcAKNZACAOiqKT9WiXt1dz5FAaD/8UpmQzLFqc1XLSZ/YRNS7mID6OWxaC58KUx71bvUygJNsRlYEyQd22JJt32qJg4M4yYPYrKZpprxs9eFCgHQ+eM8axM5LRCU8aWm0nenJBbWb4e0mFii8k4M0Vrue3/fZssbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDOcok9wm8Pk39tIr3KjgqQjr4wR2vXFOzgudlDCMrA=;
 b=sqdD/dc6r5LGOxSaOyaGBSePNFxcUfPbjU00eCP4aeh6st1npJtTdR7O4dYZucly1HD4IpbqW+Dcw5CRGd64mbTpSmMr2a5mzJqbpdtgBDeL0YSLq7LkhfWu3MeJPTPO+EAbUdHndwldM7L70e/WO8c1XyVe5HVIFDVJECDWcAE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:53 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:53 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/34] drm/amdkfd: add xnack enabled flag to kfd_process
Date: Thu,  1 Apr 2021 00:22:06 -0400
Message-Id: <20210401042228.1423-13-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a38d747-f662-499f-96d5-08d8f4c5d140
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4916F8A399D206C42F6A9F96927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: APFHA4cN8Q5ELGekF/VzzLpp3MBrDdtCe5uHS70bSlBRaVLyNut3AgF9jdY7uOlV9Hy8TcUZQ1feArZmUy9hqRiNRvheUemYkuqCLHow/E+aQzM/ITxFvXfk5YQaEXJL6YxjQ27EcO0e9DRFNoFXBUUNofdk52v2pN3J+EmS3+awNObtIeBX+uaPVKG1NjUfBhvpguHLZyQvgjumJTqp1QMJWnHvWF7knn7UF0TaoEreQUqYhq7VFyQAEoo4qJ2xkLDkHXgePOGXUVbaqI13MGpGxzctQ4GwKN1+gJ96q7fPnPON/TctfP3fia1ZwLvKblTROZW7nx5VGFSS2ddlYOXK879V7RH/bGXkCPUrm/DyR+EZ54x2QeTHVbgU/n7sn6sXJhOJDEEzxpTZHGoB0AnOw/hlEZ3GtupriLf84fhmzVFF/EjyqDqHuModqkhoEylz3aljXKldnHa7/EVM3UYFGAY64TkK6b8UaiyhmpNrGnaxyDxvJvgHNpG1cDVIe0ZbADjDvYfEGD/Qt3CztBWBgpr7NXr2ZTN8lJcS5BrdiK5Vfvs0dTNNl7B8crBd2BJuf/v5OoFeDawCe1t7hfB/rxxdfFRpzJr6zT0SwjyZAk82a++3tWHpKTRsad39CkK0MwhecvxKgdsD1qjx8u2VdV9vejU8ElGp1HnXdHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(956004)(66556008)(26005)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8vqahIJCnuATRkkYAoAqUKvZFVT5WyY9eZTl9Sn/4Y3VyX0DgZvIbgc/F7nS?=
 =?us-ascii?Q?HbWMcXEJ9cqZtOD+5DKqmtC7UgLb4/n+Ss4bdp2/fldR5dCZvw+PkxW4Mv5R?=
 =?us-ascii?Q?HSqR3BMQEwFcbb8ohkqPV3h0zNdZiuQUcVmazIADpiVenzkx2wCHVgSmH+KE?=
 =?us-ascii?Q?CuKFWa4zL0rVeFEHi887EM+YubLUmQtF8hLwTo392z1VgDuSoMHQCwXsIZRk?=
 =?us-ascii?Q?X43FGK4sh3GLP8eZuoNk4oYpb0EfDR99ALvhkpLW07XK0EvG4phBa6nYBmww?=
 =?us-ascii?Q?asuPUqYlwSbk1nHBpW2Lfm6LnNkFeZwyU+f2EMcKb0d0e+lbQxT9SC8SgB/b?=
 =?us-ascii?Q?uCHLv9Q+EwVIpsk9rgJa7XmCBMUzbkWc/2DWtC0KtKHN8YeUoyfKOW+0q7E0?=
 =?us-ascii?Q?KW50o4FBL6XeRLM86/vVuLBWyOTJUWOZJWcVM9R+Pza9ZlaRqNBzeGoZS9LG?=
 =?us-ascii?Q?jCy7aIilLNJaFsbpWbGuKmZb4XF3ev+IxMspvT4y5wmESvkYeNenjsDFayax?=
 =?us-ascii?Q?RAUtywDmzJwEjMPuAQ8OM7Ej8tIB4fu4E45WFQsPK7Shgn2Q1KxVdnBxpDQZ?=
 =?us-ascii?Q?vYmZDGlb5ctTvFBz12zuwAtLX23P5x31NvaocPq7K9+xAF5RY3HRpARJSoC9?=
 =?us-ascii?Q?joitbIZXiR19lZ8fgsRsZl8vHH2hA+3LyStFVcJag0hsDYS5bMMRtp7t12Qq?=
 =?us-ascii?Q?NfLfnr0CETebNEIjF4LKw4cVmJOR3kHmJqTym5wyzBD9g0FdRB5//wxWZ+nG?=
 =?us-ascii?Q?aaaLDFmtbJ3+kZq2ciNZXvXkcD9yfPifndUUiG11b5JG1r1VQbeiD7uFuPn0?=
 =?us-ascii?Q?Z+hBD4R1ykGQSYgfXUIsgWAcpP71NWrqbO09vplzu6ZuGKzt2+8VtgEMcDy6?=
 =?us-ascii?Q?ECkBpWVrwuSH0xXF9UpM4ggCxSbJmxDKDcU90ux322Pki7cyArMZ8ti5Woqn?=
 =?us-ascii?Q?Cetlou89qlO2Sadep2RLWY8TQvpoaNasCh2KA80BAX9+3X3CFAXwv5DLOTol?=
 =?us-ascii?Q?bEEghZbHsZ2SaJntXpa5ZnZWDldHZqmmDPNungkQrGM2AgKauhgrqNJlCrxG?=
 =?us-ascii?Q?PD7EPIUmlUh8BdGhnYl6kfpLRIXA9KYja0X3Gzx8LsSYXz87QvxUGfi74P5g?=
 =?us-ascii?Q?UNsFRx9XxSuVAaZ/R5v7tXyt3Usxu9rr7ZDPSFBWwPR7YSQgKWaLbrpMeFqw?=
 =?us-ascii?Q?FVNi5WLjKkEXjHTiHQ+QvHLHq/6/sGEQlmgssEZwF5WhBXnkn5/4taJE+snp?=
 =?us-ascii?Q?BU92V2jYlfdZpiawZZ9/Stqvb8ZHQj2e6ZkJX43p6exxcSc6uYinq8QiT45N?=
 =?us-ascii?Q?T60yiZcVD5yWJgzRdcEMInV1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a38d747-f662-499f-96d5-08d8f4c5d140
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:53.3014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1jndDwsQ3mjlnoWmmCkYd8fMU32l5NAJ996cxripeVU54ukAHgiwT8VuBkIw1SMJTokxNG3ws7is9qO1cWmjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../amd/amdkfd/kfd_device_queue_manager_v9.c  | 13 +++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  4 ++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 45 +++++++++++++++++++
 3 files changed, 60 insertions(+), 2 deletions(-)

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
index 3bcde43ccd70..f897c1d0ea66 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1193,6 +1193,48 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
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
@@ -1232,6 +1274,9 @@ static struct kfd_process *create_process(const struct task_struct *thread)
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
