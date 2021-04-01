Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DF5350D9C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409976EC1F;
	Thu,  1 Apr 2021 04:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F20A6EC19;
 Thu,  1 Apr 2021 04:22:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qye3HZ+73VvG3SBgIlkhGdHaOGH575CXLHd2YjctUC8EGJfRlvkL0IdJaDMc9azrDsSMGUWEFk3hwRCesUPL0/PnLx8BlD6vDOazxOxDlodMF+2B2PuAQOmWM/Kbc97d0V/WTdzTECpJwoUZRYlrn3EpqlsU+xbqimxvoUQMfGISzd2KZ9f9Ipo3JMh/S2EesN+0z1mCtVAbC92QDEOCZgNS1yMUhfvxLpa7rK76OQMfZ119hmJp6ozvdNAyRk1cRiKA9oG2cVF5wl4rsDGGbNmG7H47TKzHs9Yv+4M5iHj0DBKtqkvzPUoUK9HaxTYwKTrpcVqAI/qE9khVhFtgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/N5araX4h9q28TGC1IyQcAPuVLfAKm46YAu5CnxXx6k=;
 b=AeGNMCb+Qm/YIx9T7KgXPtgng1RS7ZwNT2uEvfdMb9+H1smbOT1md+9cVko5RuQaOqppVtYcgMOtDsUA0B6X1uexx+Ceju8pgcKokOpCPVgUNS+qsj371Cuz+90N6WhB59oTzdUO3DFuogl23gsfpB5sRvlFMMQ+Db9/nTXW36a4TmgwxALYGvsM7RZxJfWQzUfRmH6tcskK3oaPbb/X8oZErtoJTu2eQlNgw3w2VAfO9hgSXysK6nn3HGgI3hbcBCcs/MyE/rxJYkcOYebngUWfdDjmdZt8zJcCeNclepahsvTeKIWxxm8ZCJlGxyf1YO+xQ5K6UigsitdIJkSXWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/N5araX4h9q28TGC1IyQcAPuVLfAKm46YAu5CnxXx6k=;
 b=poNtFhCYYC7FPiNQTutwil8Pc6GQxorHwNCpwFlcZ5C1Xad6wJn1Gdlnmk5AUPVkN9QWZacvcH72ZsOPhsjz7ItoGEz7G2iHbZtCeq1aPraRnLcWH5A6FWaZvBsQZkwdR138ICmBlmUJmvL72IUq9jYwv23CYLF9o2Idy4YuVYM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:44 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:44 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/34] drm/amdkfd: add svm ioctl API
Date: Thu,  1 Apr 2021 00:21:56 -0400
Message-Id: <20210401042228.1423-3-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b20210c0-16c7-497f-ed18-08d8f4c5cbc3
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB491664F5642400B04C30C410927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6lHOLNWVCiRwiWgTS3/jOiVVBdoF5B9q50wwVeoFfWsSLBFdhqEovjCwHBdXA5POANl8PZSxNDs8UuQcQsDR0IWOPrj1dv6agTuiGLpMztkYMkmsGNEhylQQuPLmwZCsTMYZwSDPYNvPagszBHqDp7aoTs/kbTDNIkxEOPMEGC/3b2Ecvu6R8Lrltk3DD6zM1HBUFLARjUgb4uxjdWP5WvQpnIw0Y0ByTsZElCuBzQfsmV45X+iSiaikymzx/H+jvzeCRuH/nHU8JvkNE0Yg8sy91xFbntxQWgDf6a7LOWGijWyT0sdJ56myTwx+4KM+nGE8SN/mQAku6/M6kHHSGZhZcFH5Melw5ibJ0Ao/W25H8LtofMl4TIN7A9JEi0FOOJ34Zh4OnkykkKi7jZp3rlpMEI24kwb3C6DjEfOJb2AZplO1i61N2kBBVLkzBJhwzT6abr524ZJwzMJID/pq7YufDKayx7iI5fi/ZeAZAUpM7djsrdRwpRkUdLnyCYJqUnB9JvYzMvrD1iyP6k8nnYAmdLlYFJwMHzfAKj2uQnghOlfyJFcIMDWTSzzI8Hyd5oBUoHo2N4M/OF+9dvISxT4PZhBTfJAhBV+NKrJ4mWAyU+bt9nfS8LAPti7L+Nkp/12qH5tvrW07x6Ly6Tk0VDMGfBB6SIBK6Le0DysSgBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(54906003)(956004)(66556008)(26005)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Nk0Nl17UHHDvu+a05v1ls1rmVDRe/fFIaxrbmZ6lvA201TH+Ok5D1Ohe8vEP?=
 =?us-ascii?Q?xRfPdxiJJIKnt0X1yywiawg2tVEhnV6CD3yj5hgEL1IPWynZDxfpwUt6F8YE?=
 =?us-ascii?Q?DxVIp8WwIFM8bK2K6oORiKrOaDYibJRW5Se9YvPxiauyJ+8Cf3IWurBpogNF?=
 =?us-ascii?Q?eHmQfzwxJqqy1QuA+q/Hd9Rnrl55pRpM144zRs4DH5h4ywBqXZ9XlkHxcjsK?=
 =?us-ascii?Q?bp8F+I/8UfHZGSu0drFr/ihniOKPYEyMqb+sjvUNvEjybcnIubp+mZgpcAqG?=
 =?us-ascii?Q?YvpEiss15vjzNfVSqh576g4J4F34d0gClE4zDfBaHQkkM6+7sQJKyQEsxK92?=
 =?us-ascii?Q?36ED16W66ppRy7zzIe7uKRyaVVNd4CDLr5oxAzgca6HMpEMcK4tdasdmipSB?=
 =?us-ascii?Q?/JR5Fkb2ByunVD6FcMY52O5CEdwA8Pmt1M4yY4nvSU0tKrSX2hbj7hfq3nN4?=
 =?us-ascii?Q?xcRyWnZ9ttvxFcyWQPV2OLvzzLDwbx0j9SfoC88d9pZAqpTq3jZjqsCYOqMl?=
 =?us-ascii?Q?+hm25g4G1qgHzHsbvxMemPdtl7/5HvhZqyTgh4uzjJCRkEGoEsxOOODGaYJs?=
 =?us-ascii?Q?bc+u8Gr1YFcAobGvGrOQ8PV5rWoBlGKZFbID38U6ISMwk6BfotMlj/aASF9Q?=
 =?us-ascii?Q?ik6nX3rPdpW9lf0REhJle2OBs+98aeNOZesZZCO4YPk86VY8GMl0ouc4Zsd/?=
 =?us-ascii?Q?6l2i/LAmeet/4xc5dDVNFFRXrY2tQRnJmp29Qt9RiPNGKXg/2gxYvXTS/Z8I?=
 =?us-ascii?Q?r9ILayBd8gvxPMDRVGU+PMn67qLo1ZEB4wev/ZtAxGrLaQKwbU4DtqQs0Rkz?=
 =?us-ascii?Q?Bpa0yl+tQBmmOPcdH8hcdmoFJ+Ox+pMmYMVYvv43ODGi5KgWq3rdT8A9EQMp?=
 =?us-ascii?Q?pJIRNG+cp4ZOBVcBUXxivg3o2wUOdV/HCrsDP0nHHfZ4+zB4DZs4KBXynSso?=
 =?us-ascii?Q?5t02YSyXFXdTxqAXC+PRJh7S1zsnDBqwRKLNR/EgxaXQJc7U20Eetxnbt9yx?=
 =?us-ascii?Q?BgCvtEXP2/hXcQIY99VsziRD5qUKsPkP0bUMMXfiL+Qa0XIW4Dy9O4rAHFip?=
 =?us-ascii?Q?gPRwi2qywAPbbzHoXmRpdeoBvmQALZjF04S1xp6UNL82Vjmn8mWUFX+6J2Xf?=
 =?us-ascii?Q?IKbYEzwaie0BukEhoLP9hSPHKwgZTqc+Iz+yxb6rgpnoMsT3yeFRsrI+Okgs?=
 =?us-ascii?Q?O9CrsPUhebQhNj95Dl505k5lLN6xB++8R+DrcECIZPx4DR5qTVP+8lU12dqn?=
 =?us-ascii?Q?9aL1HWWJ3Qs0i7ZukSDhQu+NSMy9ZJMUKalxOSbjZMgTxKzSE/QwDFSSwyK4?=
 =?us-ascii?Q?h9jF1dE9Z0PvDqHHQXE5X0Cu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20210c0-16c7-497f-ed18-08d8f4c5cbc3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:44.1516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjxM68/S4PdNEeDTqvVNmNMXnoNRAElo9cWZTBirbP36gcZ3oCTlajYaNn04sJ3k0FRXwd3qWrjwEx5eXlcRYQ==
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

Add svm (shared virtual memory) ioctl data structure and API definition.

The svm ioctl API is designed to be extensible in the future. All
operations are provided by a single IOCTL to preserve ioctl number
space. The arguments structure ends with a variable size array of
attributes that can be used to set or get one or multiple attributes.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c     |  12 ++
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h        |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c     |   1 +
 include/uapi/linux/kfd_ioctl.h               | 130 ++++++++++++++++++-
 5 files changed, 147 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 43de260b2230..dbc824cc6b32 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1742,6 +1742,16 @@ static int kfd_ioctl_smi_events(struct file *filep,
 	return kfd_smi_event_open(dev, &args->anon_fd);
 }
 
+static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
+{
+	int r = 0;
+
+	if (p->svm_disabled)
+		return -EPERM;
+
+	return r;
+}
+
 #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
 	[_IOC_NR(ioctl)] = {.cmd = ioctl, .func = _func, .flags = _flags, \
 			    .cmd_drv = 0, .name = #ioctl}
@@ -1840,6 +1850,8 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SMI_EVENTS,
 			kfd_ioctl_smi_events, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SVM, kfd_ioctl_svm, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
index a2c9063076cc..52da1a3b2c7a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
@@ -405,6 +405,10 @@ int kfd_init_apertures(struct kfd_process *process)
 			case CHIP_POLARIS12:
 			case CHIP_VEGAM:
 				kfd_init_apertures_vi(pdd, id);
+				/* VI GPUs cannot support SVM with only
+				 * 40 bits of virtual address space.
+				 */
+				process->svm_disabled |= true;
 				break;
 			case CHIP_VEGA10:
 			case CHIP_VEGA12:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 17d91f05afe3..d701b53b9bc3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -809,6 +809,8 @@ struct kfd_process {
 	struct kobject *kobj;
 	struct kobject *kobj_queues;
 	struct attribute attr_pasid;
+
+	bool svm_disabled;
 };
 
 #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d2cd757670d2..1a6236317cd5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1208,6 +1208,7 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	process->mm = thread->mm;
 	process->lead_thread = thread->group_leader;
 	process->n_pdds = 0;
+	process->svm_disabled = false;
 	INIT_DELAYED_WORK(&process->eviction_work, evict_process_worker);
 	INIT_DELAYED_WORK(&process->restore_work, restore_process_worker);
 	process->last_restore_timestamp = get_jiffies_64();
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index bf5e7d7846dd..247b57baa94f 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -30,9 +30,10 @@
  * - 1.1 - initial version
  * - 1.3 - Add SMI events support
  * - 1.4 - Indicate new SRAM EDC bit in device properties
+ * - 1.5 - Add SVM API
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 4
+#define KFD_IOCTL_MINOR_VERSION 5
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
@@ -473,6 +474,129 @@ enum kfd_mmio_remap {
 	KFD_MMIO_REMAP_HDP_REG_FLUSH_CNTL = 4,
 };
 
+/* Guarantee host access to memory */
+#define KFD_IOCTL_SVM_FLAG_HOST_ACCESS 0x00000001
+/* Fine grained coherency between all devices with access */
+#define KFD_IOCTL_SVM_FLAG_COHERENT    0x00000002
+/* Use any GPU in same hive as preferred device */
+#define KFD_IOCTL_SVM_FLAG_HIVE_LOCAL  0x00000004
+/* GPUs only read, allows replication */
+#define KFD_IOCTL_SVM_FLAG_GPU_RO      0x00000008
+/* Allow execution on GPU */
+#define KFD_IOCTL_SVM_FLAG_GPU_EXEC    0x00000010
+/* GPUs mostly read, may allow similar optimizations as RO, but writes fault */
+#define KFD_IOCTL_SVM_FLAG_GPU_READ_MOSTLY     0x00000020
+
+/**
+ * kfd_ioctl_svm_op - SVM ioctl operations
+ *
+ * @KFD_IOCTL_SVM_OP_SET_ATTR: Modify one or more attributes
+ * @KFD_IOCTL_SVM_OP_GET_ATTR: Query one or more attributes
+ */
+enum kfd_ioctl_svm_op {
+	KFD_IOCTL_SVM_OP_SET_ATTR,
+	KFD_IOCTL_SVM_OP_GET_ATTR
+};
+
+/** kfd_ioctl_svm_location - Enum for preferred and prefetch locations
+ *
+ * GPU IDs are used to specify GPUs as preferred and prefetch locations.
+ * Below definitions are used for system memory or for leaving the preferred
+ * location unspecified.
+ */
+enum kfd_ioctl_svm_location {
+	KFD_IOCTL_SVM_LOCATION_SYSMEM = 0,
+	KFD_IOCTL_SVM_LOCATION_UNDEFINED = 0xffffffff
+};
+
+/**
+ * kfd_ioctl_svm_attr_type - SVM attribute types
+ *
+ * @KFD_IOCTL_SVM_ATTR_PREFERRED_LOC: gpuid of the preferred location, 0 for
+ *                                    system memory
+ * @KFD_IOCTL_SVM_ATTR_PREFETCH_LOC: gpuid of the prefetch location, 0 for
+ *                                   system memory. Setting this triggers an
+ *                                   immediate prefetch (migration).
+ * @KFD_IOCTL_SVM_ATTR_ACCESS:
+ * @KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE:
+ * @KFD_IOCTL_SVM_ATTR_NO_ACCESS: specify memory access for the gpuid given
+ *                                by the attribute value
+ * @KFD_IOCTL_SVM_ATTR_SET_FLAGS: bitmask of flags to set (see
+ *                                KFD_IOCTL_SVM_FLAG_...)
+ * @KFD_IOCTL_SVM_ATTR_CLR_FLAGS: bitmask of flags to clear
+ * @KFD_IOCTL_SVM_ATTR_GRANULARITY: migration granularity
+ *                                  (log2 num pages)
+ */
+enum kfd_ioctl_svm_attr_type {
+	KFD_IOCTL_SVM_ATTR_PREFERRED_LOC,
+	KFD_IOCTL_SVM_ATTR_PREFETCH_LOC,
+	KFD_IOCTL_SVM_ATTR_ACCESS,
+	KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE,
+	KFD_IOCTL_SVM_ATTR_NO_ACCESS,
+	KFD_IOCTL_SVM_ATTR_SET_FLAGS,
+	KFD_IOCTL_SVM_ATTR_CLR_FLAGS,
+	KFD_IOCTL_SVM_ATTR_GRANULARITY
+};
+
+/**
+ * kfd_ioctl_svm_attribute - Attributes as pairs of type and value
+ *
+ * The meaning of the @value depends on the attribute type.
+ *
+ * @type: attribute type (see enum @kfd_ioctl_svm_attr_type)
+ * @value: attribute value
+ */
+struct kfd_ioctl_svm_attribute {
+	__u32 type;
+	__u32 value;
+};
+
+/**
+ * kfd_ioctl_svm_args - Arguments for SVM ioctl
+ *
+ * @op specifies the operation to perform (see enum
+ * @kfd_ioctl_svm_op).  @start_addr and @size are common for all
+ * operations.
+ *
+ * A variable number of attributes can be given in @attrs.
+ * @nattr specifies the number of attributes. New attributes can be
+ * added in the future without breaking the ABI. If unknown attributes
+ * are given, the function returns -EINVAL.
+ *
+ * @KFD_IOCTL_SVM_OP_SET_ATTR sets attributes for a virtual address
+ * range. It may overlap existing virtual address ranges. If it does,
+ * the existing ranges will be split such that the attribute changes
+ * only apply to the specified address range.
+ *
+ * @KFD_IOCTL_SVM_OP_GET_ATTR returns the intersection of attributes
+ * over all memory in the given range and returns the result as the
+ * attribute value. If different pages have different preferred or
+ * prefetch locations, 0xffffffff will be returned for
+ * @KFD_IOCTL_SVM_ATTR_PREFERRED_LOC or
+ * @KFD_IOCTL_SVM_ATTR_PREFETCH_LOC resepctively. For
+ * @KFD_IOCTL_SVM_ATTR_SET_FLAGS, flags of all pages will be
+ * aggregated by bitwise AND. The minimum  migration granularity
+ * throughout the range will be returned for
+ * @KFD_IOCTL_SVM_ATTR_GRANULARITY.
+ *
+ * Querying of accessibility attributes works by initializing the
+ * attribute type to @KFD_IOCTL_SVM_ATTR_ACCESS and the value to the
+ * GPUID being queried. Multiple attributes can be given to allow
+ * querying multiple GPUIDs. The ioctl function overwrites the
+ * attribute type to indicate the access for the specified GPU.
+ *
+ * @KFD_IOCTL_SVM_ATTR_CLR_FLAGS is invalid for
+ * @KFD_IOCTL_SVM_OP_GET_ATTR.
+ */
+struct kfd_ioctl_svm_args {
+	__u64 start_addr;
+	__u64 size;
+	__u32 op;
+	__u32 nattr;
+	/* Variable length array of attributes */
+	struct kfd_ioctl_svm_attribute attrs[0];
+};
+
 #define AMDKFD_IOCTL_BASE 'K'
 #define AMDKFD_IO(nr)			_IO(AMDKFD_IOCTL_BASE, nr)
 #define AMDKFD_IOR(nr, type)		_IOR(AMDKFD_IOCTL_BASE, nr, type)
@@ -573,7 +697,9 @@ enum kfd_mmio_remap {
 #define AMDKFD_IOC_SMI_EVENTS			\
 		AMDKFD_IOWR(0x1F, struct kfd_ioctl_smi_events_args)
 
+#define AMDKFD_IOC_SVM	AMDKFD_IOWR(0x20, struct kfd_ioctl_svm_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x20
+#define AMDKFD_COMMAND_END		0x21
 
 #endif
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
