Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFE435FF59
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292656E9B4;
	Thu, 15 Apr 2021 01:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16156E98E;
 Thu, 15 Apr 2021 01:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVoa86Eu0lpUGYHqbX5SCKeAb3vCE/kL3niVIQfiCPq7W4xEocTYk9D/5QVwZFUhONjANhrXxQqzOmccdwkqe4mLTU/ZTe3U9fkGuSNEACz6SRdZlb3q0VGcHwHBKWLp8hW1q3ljQ1QIOacADD6npygNvhEDb3iSmNH4DJYEx8lUjuI9KvinYITOXBHrv88XsFd+XqHU/t+tpS2mdMCvXq3nD/9TSNcYVNIQABKw7EU3gXhin354PGQwehCPiLG2YXPGmrLnQS+vaHSL7aX3TS8Fqt4WlPsgUJiYd8Kko5RjSaTtjlZEQEXEPmseOcz61uuLknvh/1UVa/AkLI/ahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pNKiHaIu6xYY8mU+XhEpfh7sh9IzRaZrBrQ4k5nmRU=;
 b=LTvjenLTlatXvaDX7qbSIRv0LursskvADAKX+FLdskHBPu8+N7TnRQPD1ytFVUWdlAx/fq0PJVhchnSE1oVjQkITHiJiU2Wy845ymKhV6fV9HAiYKaQtcd6A7ctU6rVXsc0B9gDPeJRlSTbOBdaYYaRNdbOqyb7j0KOJfwxUwEWhEtJ39opgC0lbgkqhQIlhrPDF/ZdDqlC8aLJiud57PnFHey2aFT/MhHozZq8vRIlV/UYWF0eoMXLJaDd3r9knuF+ZSReEHcsqtFv10akw5YaZGtktwtwI7HZZG6NzG1fNsfbAmL/iBS+Gvwg/3KtnKdm3ae36XFksnJx274SgEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pNKiHaIu6xYY8mU+XhEpfh7sh9IzRaZrBrQ4k5nmRU=;
 b=eoJkKXzP+dfDcNrlowiVYmfGi4KwX4GDgcNRRXDduCCp0rutxRc9iGCMW4O3hato91yj0hynRjcmpqGxp38qsxemVtwvbzs+DZJtqCnZvEZauQQ/XZohHHJj3xCFbhFYmBPeYRcgNTmgWXaDfi43WTwkkrJGe6DPTFZX/oYxIOE=
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
Subject: [PATCH 02/34] drm/amdkfd: add svm ioctl API
Date: Wed, 14 Apr 2021 21:23:05 -0400
Message-Id: <20210415012337.1755-3-Felix.Kuehling@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: d0370d79-e299-4b34-3c20-08d8ffad233b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB38397CD5E689DF49004DF2DF924D9@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GHr7MyGJ1jg1WdXWoGcw1AqKmGiNhItJ2pcwZZCvpLezQaV+037Lw+JJZzhEhKYi+zTkNHjE/2SsDhynZbZfgShWC+VXh/dsRWW02gsxFP8FxbafkzvHiMqThpV2gJU5uKfZS3+Xml3uH1YnPVyUtdtmDvLGGwhK9nnl140LOKERPh/ZyWjQShA57pCP2Fat5ulEL6Lrshx4heYDRbQPrQbRAwRHfbw9rnNLKQAT/pm2dSKtJnKvS2wInCOEOSBgHLjMQ9Asa8AnUlCKs88QOZ52Y18NlzsU3ntUd2NKJXTtPhKDT24+SMp9y5fCibXguc+0ptxTKWEuhPtLH8qxqWp03ho1cUHwpvs9fsCZgmdHohxi05Ps3aPIFE2U5DppH78zDriCI3gUmG4/HoZtI3KVmCUhIYBzNmt/MayBlgGsl27qhZlMqIPnHOp05Y2jZ+yPUX84fpaHMYEUK3xZKlcIMrYbl7XSvA57CR3c2pLvPJH8ft6DRrXnRDSq0UbVJxZ28acrYZHQzLv9aKHwNsw+Bf/Ehj9F4WTuVYoQXMhVFjyvsIZ9zNl27NFmVIdKRpzQ/3VTRSt9IPX1aydc61yMLrvh0sQ0BFDvuKtWtaAkjK7yCnFZa/x8oXsSPw6/ddBmdshw9NH8h4sb3w5OLvGKJO3Das1w8/vlhi2SUMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(2616005)(86362001)(26005)(956004)(52116002)(8676002)(316002)(83380400001)(4326008)(5660300002)(38100700002)(38350700002)(6666004)(478600001)(450100002)(8936002)(7696005)(66476007)(6486002)(66556008)(36756003)(54906003)(66946007)(2906002)(1076003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7UvW/xnZUaC8IcrrX3YGhHW7zfKyaj7lP+opaGKSANz4+zUXf59uDtKfsj5a?=
 =?us-ascii?Q?rDIoJy0sxJv6RgAzhBgQV/8Dr1uX+/EaU5pURcyepisz7j6qmZYKYSl5LAwT?=
 =?us-ascii?Q?Gf4y/JPhmX5ogwRKdqZ6wzvn+0YqMExlBDB9FLukw6dFIYzVOZ3FTcyDwMR6?=
 =?us-ascii?Q?VOVEI3XSQMSfSyUcRwE5G9lL5qRj7HAjJQr2UMjGAU2b9Ch9Z2GXHZ5Ip2Av?=
 =?us-ascii?Q?Te2bVrz8BaMV0AJrvq4e5HgmfcL6oy0vetKk7/acmEhMgm8KV0rMXBDrKLeo?=
 =?us-ascii?Q?uroNSq2Nk6oqypIRoiDJWwBXKH7oKKAJ8ZC40/xY3kWMUw04GVWsvk6qxQ++?=
 =?us-ascii?Q?b/zkHUVXMvW32SQjFLdbTpoGvbeYaxRHsWo0t9hCFxGkH8s31N6+FnNq7GmY?=
 =?us-ascii?Q?1sNgdRIXOytLi4EA7Segvuuhe7L8HtCrVNftSkTBC7ZMj+zzoNidduJ/dFJf?=
 =?us-ascii?Q?cnTm62GNJFjHGfUJyJYKHmR2+24h+mcAaSgkPIRtgfUqEEXeGXI44bjLNiE1?=
 =?us-ascii?Q?RUS8X1bNeIAeIW46DGFW9AmpMBooFMmThFxiYrjabhCYkn2YmnaZfGWC1773?=
 =?us-ascii?Q?DVobY+GYw+9RB7pFyAda4+14nlm4f8M0g3G96bo/EuSHYNoqyMcunnqJFxAU?=
 =?us-ascii?Q?gUR9su8rinwGTnALVPVl7oQtuMrtJWubllNL3ynOrduc5RlZPBpqY4xZT1M/?=
 =?us-ascii?Q?UbBMnHtOMGtWElcOYBLr4rjREnXIaJLrmkY90mu0rcnl/55/rE6sUZorT/j7?=
 =?us-ascii?Q?/4FVE07TFeyTmYuirLPFsod3WWOv+H2Dv0mMO+olr/AfwCVGKS9sWQDZczsP?=
 =?us-ascii?Q?GNYMuiGbikmtTR7mTMrg3dLVSeMF/+Ky1sDApgNQVrI0HFLYYsHizWSGGBjN?=
 =?us-ascii?Q?U++aq2G36nZwi4QXYHPtIvSv/yj3K3tpHRAPT3k1xeuXMp7aLy88Tl8+nzzt?=
 =?us-ascii?Q?wB6UdYADg+aBzVEMBe/NTR4s90ChpFos9aVDEd18rUbbz2C05GRHiohIJOM/?=
 =?us-ascii?Q?xwXHn9DI/ph2iAKp358Sou/4fQ6mme49RsHHgAKazFasO3ZKXrNZGCn0K2lt?=
 =?us-ascii?Q?S8u355v6ojllFlTVRuac+ldq7a/nh/H913knu3djLq0cprs1Wfa0Qejjp6QW?=
 =?us-ascii?Q?UWYFqvSTYeAuop4mtfb4ZSFQsCU7zekRkRyNAUSgzMQpV7dBp2SMn1x6Jt1M?=
 =?us-ascii?Q?3TwsXRTXxPfPbTZfB/0I5wuKGQc/cZEsGhFoJIpcH4fFaQfIbYGbDKjvCXwm?=
 =?us-ascii?Q?YpfFkEPTDt2W5cC3/ziE72jetdenHUtUXEgrqNvv4cgMwKI44ZHw5U/oVvW7?=
 =?us-ascii?Q?BMkDt3jCcBVJJoLhU6IJI4hP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0370d79-e299-4b34-3c20-08d8ffad233b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:23:56.0585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZobaEsB3ANf1kgfCQa+ZSJqQ4ClK3A9fzVm+CcyjSzN4EwzDzwaURnnoPtgECPRfxoRcaZGZRTXgV9qqkv378g==
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
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
index a2c9063076cc..72815e86a3b8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
@@ -405,6 +405,10 @@ int kfd_init_apertures(struct kfd_process *process)
 			case CHIP_POLARIS12:
 			case CHIP_VEGAM:
 				kfd_init_apertures_vi(pdd, id);
+				/* VI GPUs cannot support SVM with only
+				 * 40 bits of virtual address space.
+				 */
+				process->svm_disabled = true;
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
