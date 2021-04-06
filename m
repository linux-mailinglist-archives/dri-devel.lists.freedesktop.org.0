Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFC0354A50
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999456E1D5;
	Tue,  6 Apr 2021 01:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AA46E1D3;
 Tue,  6 Apr 2021 01:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dv1L5nvZPc79xZPppZs9d+mKxrOTKYIBapEfBWf5cId/VZ5qqlAXqMfdiIgaaj5ghrwCJRjgiUBwC//BaJrvZ1Acx/NlNHP31lKqB8Rru/3MCBmRAUJcLzduXaKq2jtj8mk4RxJD38EP68U8SUn/F6E+i1ppUtR9TN/kDSUnVYUt7v/1ycm9c2F3JcTLO/4ntoegaxoG5Qf4651Anv7Q16PavTDQ4Gwiqv38NQLVrDtrtlCpmTEWVxiAwL/kirLhYry1VwH0x42VtXsG+fOMPgG32mChaRpT0oVRvTkL+fUjvH1Zh6khhctFpSc47bp2rAAONgkvsT/q5MvCUqco7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYwoNJPlldRSEFYCXjvBJ0DlclGvXxjVkgtLfd5G874=;
 b=gw3diVCSvJzpje0FMPEpatmmm4pFt+RZfND03rVLIaFRCkQALs4k1CnF/JrvjtUBEVqjTcT1jRVBkrKUZwZ506dlU4s/8gSSrK9jZu3wb7Lzf3ufRIrgV1/UGBdemn7lWeALqmTRNaU+daGUlDgk61lQsslK+yxbzyPasVd4yFc58CIvlC9WFZKULgv9YnJSBSWmK7zWbcYYLXrMVbz7SL1S3at0pzGOecWMRdKDJEs6+2hO9xN+mg2/uYnzgr4PG/myBztKJNF80qTak3LAX4/sZwKSWSijhofoGgrW6AdsqkUkgnhhZ8ViGwtYCfjLQaRu/9oKeGQdRFHJTc5+/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYwoNJPlldRSEFYCXjvBJ0DlclGvXxjVkgtLfd5G874=;
 b=Bl42FzsGv1a1WKC5uKz/3YC+PKPzVEDV7Twt/IR27WQWbw5YiDocySMfaVV0kodwELfX+6NWh6tBKM5wUxaeUFYn6PSQ39i9RJjVoqzY/c5dEk15e3a5a1Hh4FOOFCAYHCf0b4Gcsp8ITUQWcpRoplIJAxuboXDuupKpRL8esLo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:46:54 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:46:54 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/34] drm/amdkfd: add svm ioctl API
Date: Mon,  5 Apr 2021 21:45:57 -0400
Message-Id: <20210406014629.25141-3-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:46:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e00be92-c4de-442b-88e1-08d8f89ddafc
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3773A8706FE66C17472A7F4792769@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6MWpnL8j4C/dduW1+O6X6HLMj1Chjn7DRk6rl8GZJzmb3TE66buk2SO6xcutwkhH6/lcJJDXiw5v2INLnW69bG8ZDanKt9k0uw+YJV10wgCvL5hy8yG9GeeS2iI2yy0ucGPOfBp6w19034owe3qqlee0eJXIpIZLF0aBvyZmUsSPnSAMqBJoOP6O0DEnxTuSsNM8EG91dVcC+u1HTmEL0yJIG7fayIqJiSmr7NhDAKs/GE2PeeNy6jya6zTG+uvKEEuENHTbR89XXzcnb42ovfjZUN+RX6wNooHkP4LkTwb6UkLQi2Ro/gJhT5h3VszJrEwKPLFwsBDeQrhMJ2PXQoNztP+m0v1756vmvMLP4BGhJ7CxFwQEXNd7UrSQ+TxIM+i//9R/2BHdmLEoe0kGAXBSrwkuJWyMrAP2PIVFGmUJwKWIGd1v8zJtdBOu2bCZaYfg4rxy0ryLLXJgmxI0rVDFS4IpnSUwL2mNb/j/YPJ9pRyAKQaD4ecKZKBl8vvLhQnHQTdwPpZbw3EcPBBmIKeir6UiqVxEv5YWAfuaWHWWhCq0lp59HUgi8GCRoqiQl+G/kQQvKheABce6H7Hz6EIztZPEwc8VZdojaMvVex7GEnuHJ3iIT9jn2PUBpoLR0YONwp5kNmjjyzpgSBvm2J1Bryypofs+LbvntoTiq9DqwHyJMZitS5pEK3nXPKWW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(478600001)(5660300002)(6486002)(316002)(52116002)(66946007)(1076003)(36756003)(2906002)(16526019)(186003)(26005)(450100002)(8676002)(8936002)(86362001)(66556008)(66476007)(54906003)(4326008)(956004)(2616005)(38100700001)(83380400001)(7696005)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6BbCjqc5M+AhZvMkaqsvihKvf4M6VdacK0AjyCLazGxwd/jtkbFTVmmTE6E9?=
 =?us-ascii?Q?wt3aSWxBQEmd9wawnG+F/Dg5fKHNCFJuHy0yywKTrtWd8awmaGHPOxm6bdwm?=
 =?us-ascii?Q?7R6SrX7mQFjagulZULOFnMCUF5RGyNQ5+8j+9TPU9mlj9dqPvGRkRoXsoygi?=
 =?us-ascii?Q?tmGa+/F0m/xClU9hjuj7G7PxV37NcU1RdbidyqFvVfdISYp/Y+GBZ/J0oWfz?=
 =?us-ascii?Q?gk4TqO2RHSkZ4wnlNO2tLvrkcV4pSWxILcJ3TbbW21js2Z8yYfbte1A0iCzm?=
 =?us-ascii?Q?6YhZBBGTqksuruqpuZUYmrZeTSqhl9X7LX3+iJCuzc9KvrDJnYaKpOop9zpe?=
 =?us-ascii?Q?0HM1afjjVLRBXTeJz9xqr2exXuwOYMdNmSPeS1XA5cGeoO3mAYDUU61dPdUc?=
 =?us-ascii?Q?IDryHmhHtuDkzIqsqdvwGDxzWmEOfHe0hdciHB8x/D2yveQxFJ7ewXWsL6Ks?=
 =?us-ascii?Q?vfyZ0lBG6foa7hkPZPUnIj9EpoKA52j6XGWt7Ig+P9rMG0yLMDF3jHty74FL?=
 =?us-ascii?Q?UdEyVT+a2jg2nE7LxJlUsmPtPcNZzEyWs1jKAJdq2WLtAmt0Q/JzUzOtieNo?=
 =?us-ascii?Q?fz13izl6O2ddbupVaV/NvVgwWbZfSKyaKO7hCFVNN4Cx85XG0/fErQJXFb/d?=
 =?us-ascii?Q?gx9IMZgCQoSQYsOCod+lgkE26/k9LtlEPxAWnHnt+WOgl+Z66yZiYyUsx3W/?=
 =?us-ascii?Q?2Qk0fXWv7pukZMfY8vz16y9y0HrhbV+hkLg3uE9kWe97/irdIzCXAeoBynRy?=
 =?us-ascii?Q?irpEW+a56pmzo432qTu1qa7M84RxXclgMdp96IQ6jWHqddANdVSjFhIj6gTA?=
 =?us-ascii?Q?pQv1axjqOrgBUIlfC/tgPSSl3UfkPeH9U3+DgV8JlV8H1YhxTQHMGeuiJPgt?=
 =?us-ascii?Q?XRHL/+ii3QONJV0wTWvcHms7dwubTM16G5WhSSuxsTVsQW62ANVpFCgT31SO?=
 =?us-ascii?Q?3ktGD/T6GtqZ/97Amd6x3Iqdc68gk3ZfcTc8Aq77aFZJSaeB9qbN3cM9M0xT?=
 =?us-ascii?Q?XXE6PmpfbYbXAPRohyBapefwmQhm5RvbeeQ6E1VSzkvs/LHLehtL/3P1HRXu?=
 =?us-ascii?Q?KCjohX6G7Krnphw8OlXHpKdYUlL+EYoE+dy/tro2h+Jn0+aKyEmdxW/5kHN8?=
 =?us-ascii?Q?muuNLTDNj1XdgWhl41zSQqIOstJ9atLPWbWqz+1KcFnpdg07M/Fd8SPSxu4p?=
 =?us-ascii?Q?Bw7ppeVs6zSDt6xrQ0aDuyCQUfUmCyRnK3BfLpwccyHRJvyR8Gm9AgMsVGdH?=
 =?us-ascii?Q?VaUqW087nhHV9VEfTkrZRj4bOxW0mV2fzxnGV9tI++R43M9xtnOjUnm8ht+N?=
 =?us-ascii?Q?MW3ZRsu6fsDOgVLbBJy92pew?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e00be92-c4de-442b-88e1-08d8f89ddafc
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:46:54.2353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8pVzl2F2TTA4wlS0aXCuXOnAM822BFdwtImZaRke6VIjs2DW+cMbdoAsAfpvxxqmBceYT+mpx7vTBcsdB/BRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
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
