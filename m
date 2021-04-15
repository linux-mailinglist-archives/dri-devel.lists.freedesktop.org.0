Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A1F35FF43
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39176E990;
	Thu, 15 Apr 2021 01:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DE66E98E;
 Thu, 15 Apr 2021 01:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsdM/KYyl2OzZ2CY+6zq8oDZOYfgIfagCVmAe/QGzPxTpSd2/u2++KLSbeGMx5j+Ak4zKDQZ/a/Fuci/qT13tGDdRUa1heF8YetHcZ4copx7S5GOS+9O4KSc5Md3it40iPT5epojdgzvYQRAuwa56fyKuwBVPW+ea4ayz4PtnHw+yec3R8/j/UWILQ/aWgCCTNawOxvIRj6zZ8aHP7dC48UJMtxSFUZo4aqgxH8MRuEtAQCGmu3CPy/dR6/3g2mpKsKTm6EKy4Vzk2k8wdQa4oisRsgOSPXz/6LS5VHr6YvsO7q2XJNtu6QnQC6bHgglnjpwdVb6J/szD05qAsPJIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpD/dGt9IzXaWHrquC7jjnFco++2UBxm86erVLnjDkg=;
 b=XTPjgO3iDeEoGmqUMT3uxe7EcT02LF2fSF0Kjt1GQc7Mhke4kksbvk1hmqcbQkAM5idfCEYeu25eQ9lOmOwQJprcrBZqA1/XZsTawlcMTBWFVvdvnPnaMHQ+L/FTvMPIN2DG2O3nyrqgQx3i3cGU2ji1LYH15rKWl7cqMWej0YUAYVSwtnjpnD59xyQB55qG1RXBeuuLrS5srvL7G+bKrg0RKUD1mstYqY8YIhsWN60WDlF+fUTaEnN1EveT0flhNbUyHFbeoOOKCIzh4g4tmGtvoyBUeUx+0uIIamanBBYcloRmASq3qEZybKyWf+YhkEjjYhV8bN+l6nbGZo5bmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpD/dGt9IzXaWHrquC7jjnFco++2UBxm86erVLnjDkg=;
 b=eHaf2lq6sB+ZvixMEL6uI2KdVEtJ+9MMw1UkEy2AMNf/nZwC8R+qHObxKgCzbu+cQNp1vrkCpuktP/+KQf1xzyMk2jgAYxqO4UX/Q1M0gU63yhg4ONASHvxfBmweBwNaAv/WZuweV32PSPPk23qD7InxzhGY/5JfmFLlFBsWRzg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3839.namprd12.prod.outlook.com (2603:10b6:208:168::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 15 Apr
 2021 01:23:56 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:23:56 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/34] drm/amdkfd: helper to convert gpu id and idx
Date: Wed, 14 Apr 2021 21:23:04 -0400
Message-Id: <20210415012337.1755-2-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:23:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42feec12-d14f-4ada-b196-08d8ffad22f8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3839276874DC89D3470D1D4B924D9@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1okOnza/dPOfDrLOFhzjj7lmEeUiPnZ5TnQ7mTEeUDgm3L5UTNJfMFmf0EV7iEYB0InrE3jEJUZtXKeMhjHODgBWYZDb0AFrOKJMrRd1TCPubeDfQGTlxdjuyFRmjoVRX0eLG8Mx9luGdPeE2dRZ55IGaTgl0N5HjutKmdpQHnnS7OXdhzGm95CiQuLA4kQqwDYN4A4GhULnKdWsmdhcYVhqZYmCwvQDADdKCvBbarhoHyhy6eGQYH20DIS1j2FdJqVPYg5GEuwPJ121S+oQvdoBvUhbTuUHbLUIoO9C5/b30fFSXXT0auvWKU6MJ6V7dnTLZSOlUGmbQEiLA/HviyBdfMWEbt0e/a/iWM0m93DkmVEpTOD2DGT+zb29iF1PY9+unihkKsdqD3aDhg6E7Th6KcKR1pUArDjUwTBFhgx4C7556OOv1ygN/rxbkHwFBANY3g6XQCyjLjb0VnFH4rUQ1R/Ag3gUHuF6Ks1DXv1srw8wkxDAC/Mzt8xh+6Hr6tTlfgEVrutfjgYsHR/qz0GxDI50FremJBHCUA1KXrF88a0RnML6DybEY5xEasUIahsF8n7EWjUHmL5YdaYFSxFhVZsYwU1ktxktgv19LJ4hy0XRZ4jUibNVGgH3iwWnWrsvSHcHYlJHzI2DpwIuCs4H+G1WD+ZWF9W+0RiqDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(2616005)(86362001)(26005)(956004)(52116002)(8676002)(316002)(83380400001)(4326008)(5660300002)(38100700002)(38350700002)(6666004)(478600001)(450100002)(8936002)(7696005)(66476007)(6486002)(66556008)(36756003)(66946007)(2906002)(1076003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xSEkF1X05OLJ01iw1PLGWQLWQffDDY+3zQc3dM1e7sfB4timrl5JRAI83nYU?=
 =?us-ascii?Q?lUAEDBR2Uy6fsmSYAU18csKS+hpOGr1Li/nRIBGl+BYi/7+6nU/NQETGB5o2?=
 =?us-ascii?Q?TPpKz4YFMUz+pQ1HpH6X35P2D8SpozYMKWNz34Yz7VhjXDaVX6B4awG5Wc1H?=
 =?us-ascii?Q?veqH13jbdxOA250B7oMFmsAdQPidYocUfOZ1buAtWcNhQM5+IbVtAIVKD81H?=
 =?us-ascii?Q?YamMJq2RPn3pyax8aySMdSimZyuuy6ZF0Ni3FXlvGc/MCpgS+XcxdjZYhc9R?=
 =?us-ascii?Q?2NOWFIoi1r3ZYoE1jSgOJc8sZlYqD3OEt/JDXXahxqefdyGZpzjB6ZwwQ/rF?=
 =?us-ascii?Q?3IsPVsWnDb7WhQ+JO8YW0GKwPcOvXcflyq2m9jQIxoiS4UeMEgpu8KOkduFg?=
 =?us-ascii?Q?jJthlzac3/NkCJfaC4729rGv9XjDBcuyfjUjOl87cOVu0MKxk2i784BQj2A8?=
 =?us-ascii?Q?5fF3lgsqsZq0FqRubawtXc8bO6I/qjkz7x/WIrjWo3qlzM5wdFCfE62s/PzJ?=
 =?us-ascii?Q?wQ16AIVvwfqBTPlRofYEXiQrFojEPVY7uxZC8pOZ1vL/mbFofJNoeg5t2T9G?=
 =?us-ascii?Q?Pz019GBnZEXo1Bsp01z1T88ex+H1rD/Bo90pRrANibK2Xkg64yU8BI7H5gLe?=
 =?us-ascii?Q?BrF29/0kKXkylR+uEvZKBCdhkk9nljy6j1IF4JnVhIcREOHve8AL1hLdV6i5?=
 =?us-ascii?Q?CgQOjs+b/CoZW4J42CZxVfd1ZynTZn2cgmOE2FhVim+AFflePLypi5Bw7T3S?=
 =?us-ascii?Q?Z8ElxlTM/VDo3OGpp4GlFBWXL9Ci8GuVj9hKKsLJPVYT/xAUkipxuKwucUt1?=
 =?us-ascii?Q?ZV7dbcdhKxDDIkkghF1vMK4wxV/7WjbhookCFDQ1OaLaPfQYUC/Z4DbcwqFW?=
 =?us-ascii?Q?KFdHK3rkusHYvriPxseXMRcYSiuZi2GOtYSnx70GiAovSqBAmstLLV1mfAXF?=
 =?us-ascii?Q?vKZ9lJ0Fuf3RVGhCWSEk5ROy9I6m14h/KDWRcBEjpV9Guad+XBU8EowGHxjR?=
 =?us-ascii?Q?4+Myxyvz35HDWxd3Q/k0KAikQBdT7jGWXKseqDBig/26L1i6A8iCBVjBpxwz?=
 =?us-ascii?Q?4ND5uAdH2+CdTX9vUjFX/hR0VSazIAMMX+gKEzljARK0L+6ebOdX0kwbAPEQ?=
 =?us-ascii?Q?Z1IpZrsSufLLdm9mj7APV+ZDhEWWjrfXhXr3ckyn6HxRDDyXLSg/WIzhdoZ1?=
 =?us-ascii?Q?thKWBPgP8DiocAcw6fgxtYYtIYWMRlIgBh0eFf4vHCbVPALxRACw1hLjiUrS?=
 =?us-ascii?Q?Jc7Onms/pThyN5K4RYMLwuKEerJw1MWB6wW4JXzyS+cXp0D5yyvC0XBteGvn?=
 =?us-ascii?Q?EwmcakYwU5pxiqxyfcg8s/ql?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42feec12-d14f-4ada-b196-08d8ffad22f8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:23:55.5517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HD5EgbIhOCoiVJAFvTWJXZynKF5GX93wZWnROMfB8ITyXlvX3UnbID/Y6r/maV45lsopCQtpgIbaejThs3kG5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3839
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

svm range uses gpu bitmap to store which GPU svm range maps to.
Application pass driver gpu id to specify GPU, the helper is needed to
convert gpu id to gpu bitmap idx.

Access through kfd_process_device pointers array from kfd_process.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    | 11 +++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 10 ++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 0b6595f7acda..17d91f05afe3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -842,6 +842,17 @@ struct kfd_process *kfd_create_process(struct file *filep);
 struct kfd_process *kfd_get_process(const struct task_struct *);
 struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid);
 struct kfd_process *kfd_lookup_process_by_mm(const struct mm_struct *mm);
+
+int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id);
+static inline int kfd_process_gpuid_from_gpuidx(struct kfd_process *p,
+				uint32_t gpuidx, uint32_t *gpuid) {
+	return gpuidx < p->n_pdds ? p->pdds[gpuidx]->dev->id : -EINVAL;
+}
+static inline struct kfd_process_device *kfd_process_device_from_gpuidx(
+				struct kfd_process *p, uint32_t gpuidx) {
+	return gpuidx < p->n_pdds ? p->pdds[gpuidx] : NULL;
+}
+
 void kfd_unref_process(struct kfd_process *p);
 int kfd_process_evict_queues(struct kfd_process *p);
 int kfd_process_restore_queues(struct kfd_process *p);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d4241d29ea94..d2cd757670d2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1607,6 +1607,16 @@ int kfd_process_restore_queues(struct kfd_process *p)
 	return ret;
 }
 
+int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id)
+{
+	int i;
+
+	for (i = 0; i < p->n_pdds; i++)
+		if (p->pdds[i] && gpu_id == p->pdds[i]->dev->id)
+			return i;
+	return -EINVAL;
+}
+
 static void evict_process_worker(struct work_struct *work)
 {
 	int ret;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
