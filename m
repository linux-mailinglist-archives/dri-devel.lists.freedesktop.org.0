Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FB1343F02
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A066E0F8;
	Mon, 22 Mar 2021 11:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C5A8999C;
 Mon, 22 Mar 2021 11:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVO4mY1B3qNe3/HRQXrohFLelbKHiK/vQx+Bsu3dU3QmYpgpAlXKucjWRlp2LeSByp5jISIP6uc/EzRAgtItxgz6uAV83O6A48dDf+pZYyeYrAIVTc1ADyzDupVPg2RMQcDwuFu09yPVQbZQ3ZjdduUuq3/ha7Z6dN3RS3Yaq7Pfw5IYP3RU9v1jTaJs/nSm043y8eF6GjmzdzJEoa20/UVDpzUAKvEjlEe5LwQcs7dwzqO3UW45g5oRJh16qmgB31YpeW0l3hrtYLZMCZhPXnJoRt42eQ2v+aeGF6IpnGO2xs7sw6qe3V656tLrXcYNrSX4Dd2ZQY332/me4uCtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y19EvBHzBPkAb69RdQzjf++FzipztJlyHJIJl9TLg+Q=;
 b=FWqezcMuRN3i6TLPyBRoZjFDszYJKASNwXpOfumacoehS+mskxqIKeRAY9z8/4+4Xov8nXh6aVdHymZ+Qk+sgtrke90PAOnNoRtlu9k6V/AzK5a8CwAyGmxRCJRiTw2m4IuemKZMTGXwyReiEeHOFcamInqSaFp2sGtwmecdGAn80rbUmwX+sAgcFdUT4TksKTbxeE8qiD3cK/sf7wcmrL/LblxGT3oiXHGzMK/AdXKfEDoQN5TJTZ/4OJujzyRAXCmr7/mMfSPJ7ofOEIAHfelKQv5vRDWtpPrLc08q94w0YzF4tppJoOKUmrK79AEd4VCLvVwPogRWH3qT2lHsMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y19EvBHzBPkAb69RdQzjf++FzipztJlyHJIJl9TLg+Q=;
 b=jMvpWTlX+Dln771SkZenZSTZagLIMmuhf/q0hZjdRcRR4i0bH0MUf5pRBqu9jbIUtVYiTaUH6JOmfV2zfirJELz8u1zNmJuWsEMIrz+b/qgjgEMDykd9OBGcwtotHdBMx2A5D++93utHpjM7DdFLS7NTJFi27WJEALOWVcaPAxs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:31 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:31 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/44] drm/amdkfd: add svm ioctl API
Date: Mon, 22 Mar 2021 06:58:19 -0400
Message-Id: <20210322105900.14068-4-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9626b566-8190-4322-4acd-08d8ed22afed
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB367899D5BDF7ED58AC054B1F92659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NeyeiLIkAfvzF+v6arho85dh7B4huJJDTJmybFCFpPBkkgX/QGUV8d1ShygwG/TK9HiIg2w4nS38r7tkJnG871lbTmZ76Rz7UJdc7yAuM2JLmGRnITYs5fkfhkBgSuCLrtL28C6gxfquJc99lfW1iVr35lgzjiTxUHXOWjndbPjopO+AUDI0Q6INIyaKVz5CSUK42L9u13kpK9NPfGBOctuY9/sUBVN20RJvS13zRbHrB2s1nIiYt3HTNGIaKHuQR6P2Q+4Ie0tsG1gQgatM1cyGVAfyGjqqOGVAlfCSaEELsHd9LXO4JHYJ/PYlwEtmIVkEaVICAhxNEpLEYKKXZzGG6+bEFUm4TDjRmoom3yeRAODruct7BvzL8d7P27Q39nlvB4joUdkvqL4S85uXQS0MioYJViNzLVFirf4vMCF2EAPbQYg/xDc4DMBx0wmDI90PXZ6T1Itc7i90YzSEbGch6Q1eoNvCUrxd3AMUYbp3Q7rlZr0EaqOc1Q8A6rQde1SB8zghjLx4wsgjAAtb74Rk99EAcpDlkYEskZEsKRndf9Pw9v7uUGcfW25sxM/4BgX7raZSiDHLsZ0B71BUBxZMuij7LKz8B4Tvm2KyWFnHrj3UP81RwwgLJgrx31XQlnIVhQ+rP10NYjeJbocou3M63eAwqxxEdN0RGSEGhWc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(54906003)(6486002)(1076003)(36756003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7NYOIK8cGTN/kUPA0rXZZjSYXR1iMxQtV9ZTpcHGus4Eg870rqvmz1Ei2T0B?=
 =?us-ascii?Q?ThGxV90g334cjWE779cr4/isWB5wCJ/mH5uLLxXLowuIxXgdVf7bhNhZPs1K?=
 =?us-ascii?Q?R+EJ3xiwoguVO2UVuJKeGecxIqyht37niU1H2pDanTENKfiKA373inSj7TwM?=
 =?us-ascii?Q?qdv5o2vvev3I8uEaVepVolViMFGdW04+aytzQjYNyUJNH+jvm2x66kJIdPoK?=
 =?us-ascii?Q?jiYlj+/+fXCDzrJ4+B2iHXy2zIwiraHJp/ZW3Mi+f6XWVAvFVIflxnMCmyt3?=
 =?us-ascii?Q?RY7rzT8cLbgiAVWjV80lzpr/vbcaI3Oug1DqxIjwn8dG9JQp5x1nCP8WrLbs?=
 =?us-ascii?Q?FaCGgiB/SrvuH9YccoHzYu2cL3/lZp0Of0CURcKncqqpWS3LVNH3J5UYES5v?=
 =?us-ascii?Q?f1X5D7H31n32zlnaT74sjYKrYTjr3LvHC0h353Zh2MlI7DYt4DIbm+FuC1U4?=
 =?us-ascii?Q?xss3+GSZ4ZI8GCmtdl7oaLU9tNJTh0lizkcgrpmIv97dK5Yg0fGpOodxi73Z?=
 =?us-ascii?Q?wAVOUpunLTBF0BfY4QP6ptWk3dVTDj5OMo0KJ5KtfcADYz2qJMfUT2YVw0kf?=
 =?us-ascii?Q?wPz6IODvbZwxqfOA/JtP9in5oePFZV9uVKxH4TqlDQxLbH0KE51z9yRypTsU?=
 =?us-ascii?Q?JbM7ZI0G2hIZQPWk+44/EuXxvRduHUO6JY8mQfs+IrFpbSzxDCHBH7BTEUal?=
 =?us-ascii?Q?eqY3WV2DiSD7bq5K4e3Rkwpm2NrW7NeGwWKJka+qJ1lpY/h1Ws2Yjy2U5FrF?=
 =?us-ascii?Q?dRqm8TcEg7y8p5SmNjoB/t73AqMig3vZSekr8s4u4RT0dNR/okoXOaqb2Dcb?=
 =?us-ascii?Q?+F5sukDIwjIC2rJ8d7mIt7TAbyHtM1uUGWMOwHjRtLQCH3f5EmKqz6sPMKGh?=
 =?us-ascii?Q?6H7wvijMNlm6gbGRpF35mO9DQStaySMCsWR89IVFyzlhi4Gbu9hPZuJ4JMf1?=
 =?us-ascii?Q?jWkQGzWGASPcGsn5RrMKRV3yH53LKhSEIli9C8yoLjRhGOkwr3fAZHpOtyUK?=
 =?us-ascii?Q?OgZcjMsGXjgDRDX49P00uRV++fO9bsctOlYEMEdhFIgdd+Hq0lD1ksmDYpxG?=
 =?us-ascii?Q?+ifK7u/9UgCtZOmQ1XEKqg+fHmDp/MnOgYYCtPdsJ9ieLIdl9CP6FkFiAlkE?=
 =?us-ascii?Q?qDJgH/IYlAvtgPmayZnAu4O8kdPOqNYoP3ly/2t3N5Z9DESF5cwI6Vblobg4?=
 =?us-ascii?Q?nvzIZanNifp76yx5lDbRjNRAh8VVF469suCiVkRYr63cT7FODY1ddvpGCi0s?=
 =?us-ascii?Q?WBhVjpZPNXGeJuoY6owqsYuECJHw0VCs1tWYCZpDSHa+7m1Y8KTqgjm2bnGh?=
 =?us-ascii?Q?PFygIfMJA0QB23S5ZGPF27g5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9626b566-8190-4322-4acd-08d8ed22afed
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:31.0812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sp9oy5j6rFVZ9UYsWjCZ+fObMfLiRUTowjUcb4RaLMv4s25gW03tqteKkyyHpQnoriPsFeek/6t0TnOcbhJWWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
index 99b4624ef4c7..18fc2ccd1a77 100644
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
index 028ebb0deddd..89e7c125d334 100644
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
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
