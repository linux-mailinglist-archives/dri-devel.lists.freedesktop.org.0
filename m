Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788D354A6D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D4E6E2B8;
	Tue,  6 Apr 2021 01:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300ED6E221;
 Tue,  6 Apr 2021 01:47:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6jwjl/Lu48ZdScpL0AEm9JueY2JdyP91xfubAjkBlhyCsmMSnX4JhaT6W1QIC4Gf0oomH3j1AXAIgA0z6AePbsLXM8N4Lz5o68CT76EODVIOQxaet90fjQo0XTwo8S7tB24KrD3ZJHZjJ8N1SzdOi1rRcokNH0y8KVLCM1rfM8TOj0HybVHieBmpTvU8uKq50Ukc3gv3RBDuqyFjiKP/YMiDiC+BDaXWGWWDOK9bNrfW25yJmDsDnfpr9vJKraTnUGOUcKkEpg+6KXO1gKoRiotn1T9gEM8/BGRKgwDoJFa1v3hmWsSQXg2Ux/tktCCcgW3faCmemaziS5ePJKazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuUY2kSmqdaWzCUstDYE5trClp1717u8v/K1/XyZ3RQ=;
 b=f/U0w/+s2gumiO7PAM7R00BOtUFmrIU1xDo4rqSzjF8kem+9G4tNDPJjLJs4xxw4BPItAT0yhat/mKkDBg/k28S+eE6wR590tQfX5SsB1EBdiX+MFPVYsEPegxOLAY9B00lBTv3v+v+lStUoBwuFCerhJv0SPKw1XOmAWGWS6OcLvz+OYRhP5oGnRigNAw7Zm7NCva6IbDBOBrLzgLYxYObv2Byi2wNBWQR549A4yfw/UZMaNiu1P1jvR2MBJeMHKE6ZzcVpoJyoGFnpC/HpxRV/5f/D/H6fqush1oB4Np1vcwwysSunqSukMiRE8cIlariDsI0bsPYuuoEonpGqFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuUY2kSmqdaWzCUstDYE5trClp1717u8v/K1/XyZ3RQ=;
 b=UqHOVD0UTS2yHcmwdkD3eMxChvNZ1CAZTghJwXt9WACdTtxqV6o/1Ny/dM0Ei8RxGLX1TGW8vyZMULd0cuQN3iwWcabIeguW121frpeKCjaz6T/jfTxrz82ojIz6F0M2bAQucowQTVbO692DHUelmrrzrRNC2h61scIFgQbBvMo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Tue, 6 Apr
 2021 01:47:00 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:00 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/34] drm/amdkfd: add xnack enabled flag to kfd_process
Date: Mon,  5 Apr 2021 21:46:08 -0400
Message-Id: <20210406014629.25141-14-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5414e4f-4e77-4d37-e628-08d8f89ddeaa
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4206DDD31A544EB346A1490A92769@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aTfmz6TEdDdx7pWw0audrSJdlaOHBGRUs0/ahqinfb+x4ZSUBpPHQAm0XHssa0XHyyifCTLACDsUHfPsJIoLcbNkAHYdnm+YSmA2nOa0ifU6q6c5q3WEe3cz7zYl+SY4iXbQPgSf2SdFDAR9/0dQFFo6UdF4rCG1+waqcNVhu6AgB1jxD10i4WSrzuUM/Q/x8KTnWyWxtOgQhFjXgfT71jkXfYbRAaZDMno0t4fnHVA5JDuBVGLXkZbpp15kY1QpP0a6PDgD2VZKyN8dqwI0dgkyu6ZvlRotIvju0qKIuU5Hn9pwSBLGD30yCRC4x9DACMg/xhi2xOqmoKx4/NFV7IeYdHYdQvT9QPLB3uYOuum8DSV6+bhyM+x8ozns+bjR1s4IeWcZGuc/4Wmt+Jo0xEeSginz3eAoWNicTxitu+APp5hGB3TtNRbec1dB+HyojbeeHLSuy9LNmti41wNvHVTG8bBe3PmKR7QUrSZPyUymHQ/fhwv+JR36ewGzItf8KuAUwjhhv/N0arWiDJI1G2uD72D1mocpdw2yFyg7KXe1DQBeWf/eRimSyBUPM+MyGaYPmeD89vug/iHYXwfotpUvv0GRqY5qhEat9jjYtlXOUBAARp1eKoNuB+eTazUtaPXjyNsoJw+bZQ3bHBdrMeIuXBvElu+n2+9kIynajV0Y8n7MELwn+UUOw464GebK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(186003)(8936002)(38100700001)(7696005)(52116002)(956004)(36756003)(2906002)(478600001)(316002)(6486002)(16526019)(26005)(1076003)(8676002)(66556008)(66476007)(86362001)(4326008)(5660300002)(66946007)(2616005)(83380400001)(450100002)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YC8YypmoZsKCGK9WdtuyHsxenzqL+VNd/qMoGYlovP1end84kZzfj3EafFEQ?=
 =?us-ascii?Q?PVHvb67T7+ivH/JaQL4BlO21OmnA4Lg36TLcHwFq/lx+zAj34SZT3Blm+Z0x?=
 =?us-ascii?Q?fGcvn/VLl5/n0KxoJZkPUvFzU3MVlXgY1CIMrfT3ai6bB5BdvXM1wYEX+QDQ?=
 =?us-ascii?Q?IwXLXByQk5raBDRYXmsNrohT/+gVg7RdiWOtc+3CMAQCbMzzQy03NpE74HSq?=
 =?us-ascii?Q?VXXa91D1l1+69/awn7sz5q8dimBWXeOoWAC42ZySdqiPO0yqRq9Q/2VE0TPb?=
 =?us-ascii?Q?xYljXCtVuvzpXNmD7iCS0wF49SkbBSgDvZ7BX0HbRl8MqTp8k1vV7gIJgDh0?=
 =?us-ascii?Q?t5l7B2Qxixzmrojf6ahbI0QVcwpvdku0tD4gSOORfrCk9XrWQqnPpQrpY7vb?=
 =?us-ascii?Q?owwMu3V9qGMYz20H+R2RAk2pB83NtDJcOJucXTH0uktlwbHufkkuufrl2LXC?=
 =?us-ascii?Q?WLXekx2ep7tG57rbvnJiQvrUloWRsSGqBphHdk81dil2a4fGZcLv+NonMeMX?=
 =?us-ascii?Q?jYvnT5gJxpmdc4/BxDuKf43fvu1NCTVT5sUniaEJ630S6L1BhfOvK4kKYUuo?=
 =?us-ascii?Q?5CyoFLxSHVPebmUqEQI230XwFXFHNgNFNjh286fuux/JK0B2Ozd/QWM/+y0c?=
 =?us-ascii?Q?T7URmXAEHDLEJ9otUqD0FCc9IJCpgpb8T34e1qashBMgPutXg29LAWOJ0b4X?=
 =?us-ascii?Q?KPVLHhiT6v0eJHDFRReCNTmI+I9hKPv9Mpy62dTI25dvxq17QaBSQW7WMxOm?=
 =?us-ascii?Q?j37RO70mCxUwQO/9GT2/fnmd13s96YG6Qvq8xnPtNeAvXY+Dj3rI3uDibtxs?=
 =?us-ascii?Q?mRfX1349scNYdtBJwFhKcAwYrsg6XZo8r9GfdtB9VpLKe5YO/4cwxs7LudBr?=
 =?us-ascii?Q?40QIn0tFlLaZSBXyR0J87J+L0LgK8/Gzl+klbcUpxukP1hDHhRg51jiKc8Jg?=
 =?us-ascii?Q?fdUXz/F9af6rtyA+aE+kxp2S+HC+hZD+6hD8+qmczTKm578dL2q30ea+8hXq?=
 =?us-ascii?Q?aZs9FC4n3SGvwa+BJSeCfE3kMB1pBVRxlVMoHpAJj9yAAB2aGvTG60MmIB5x?=
 =?us-ascii?Q?u2+EkP8Vi8tvTzEh0CHzOHUDSmLS0mnH+oSWDm3+r9Ek4O9SqDLCBIyQwHjm?=
 =?us-ascii?Q?g0pG2v+iFPP3HxSJGsAbSDd19DZRlcc55znqRBcxNlTnA8iGmmT8/PM1m2s9?=
 =?us-ascii?Q?EPNGzZ0HfEG3aqSHwEQXoTi3F4LIYD/4Gqa7kCsTO3Srvf6mPra3Rad0DpnJ?=
 =?us-ascii?Q?Vwu3h9ahvaLFquC8RNnU4D7jsQX0WzjW9SMRf25Gtdt+BxAAjzmsRCXNS8vq?=
 =?us-ascii?Q?dA2m9MXTTJZjKb3Mb90dK7Hh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5414e4f-4e77-4d37-e628-08d8f89ddeaa
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:00.4839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZyTStWu3WogI7X+GCbmGuqh8y2zF4M/m2xmLXx11FC/sF+fgRbf64m/Bg6BwM1CjvLxSF9tU/A97Lgg+5ixsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
