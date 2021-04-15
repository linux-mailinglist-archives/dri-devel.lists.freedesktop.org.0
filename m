Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F6B35FF50
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA076E9A5;
	Thu, 15 Apr 2021 01:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4126E9A0;
 Thu, 15 Apr 2021 01:24:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4nIGmcmfTf8qce4qYHVOKwr9cbeZmmfChOfo7D9ul9ZVjOibgi1CupTnJK82NRzshANvOrWM56Ti8M39lG19L45alsSz6GyRb2Xii1NLc9oMsLgUpvpFbr7xmMJjoFH/a8u77ls8qFCaFSzSd4QhOg0tCxHkwdgu9nzNg+ptoQgqjFnyHka4fP7C98ftmcPUZ8yiTCc2R2MPGeJ7Wuf7LtIqYS2oUC5j8H7+MZpekv5oAwkpRoYGi/RamJYEXJMPHeKTlxT/H0iG82c1SM7bL3KFe0LFrljkj3mUtAzISBNcbDgn38bR017H6ZU1Z0dxCTcvdH4TZa1lhRxzesCVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxVWP1WLlBmfpqL7qphhHvUsjdSQOpI643oNlzmXbvc=;
 b=PMJ91kES4fASFy9IR+5Q8RfLInNZ3T4KpgWcWuUefMr2HVd6n+6NOpeDJ5Hj63TzTUbFpesfTNNOg9/BPv97EQZDVmbOQ9JGwKDTmhHPaCpRd6sM4wbOTBsdNluSob6svY/WMrHMnZbunbIhQ184mUfPOLXxQoxVbSysWa/UDjSLmkDz8XxqSOcxsm1Ru7uI5U+9BeiBxE7zG/RbCd73Yk/U09oUdcRdNWNb1MHfOFAMtHfWDmvPPeMYedEDuYLrCNKrUfuB8aKD7xz7RawcsFIy7uYFlOZFRkMr64lmn67FxP8E+33wm7xtJsH7DYHGW5qzDg/aOC1G4Ulind5itA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxVWP1WLlBmfpqL7qphhHvUsjdSQOpI643oNlzmXbvc=;
 b=WvxIQJI4i5GLCaPxv1q2jyygPQn5YZNUVjSQAXjt/J/tloY67/je5tFKoZ/iM3Q+HRsNBHFyhbaoGq+4eI6oOwSAGR6r2f7cRaaFU+zgAkiwhyjo6fVBvmE676dT208EABd/IGmmWvZHEiFlNsI+hciz+PG5hAplZUwOdY0V+N4=
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
Subject: [PATCH 14/34] drm/amdkfd: add ioctl to configure and query xnack
 retries
Date: Wed, 14 Apr 2021 21:23:17 -0400
Message-Id: <20210415012337.1755-15-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:24:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eee65cd-d148-4f0d-cc84-08d8ffad267e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB47977717122B1A905E3AA33D924D9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CEmosMUf4UfszADrE9COUBzT5MhnMzBzwOOAwYlo/Id9uo4u0qfQyGEHRU3U1Jd+EcMFWD/GCjAvvEj+DyIOUNDR9uEfjSP7KhlYQrSGQ2A4NHJf/oxpWUo3bNSrhvVFj5AeDfN7HIpwdgGK+7TlQ+O+tTR9lM0Im2zlaubyn11jlHPovuc71Kl2BUHp22BxpCevZP/nWXl3lN5m6qXusBTikY0jWEdLgkIAtyKKQxrCmXK/5vj4/jJsNtLAEnW1korfnxQ8Fds8NHAf7yzIBzbR1RkYWqCM0sQK/jVEKGbbprkrQYM7ymbhW8Xd6fkI48CA7+COlXvc5VMhNIppY6qM/r8a2/SCdMjHXQcfeW4AGsxRJfMoRkfepCop0hpvUIOjV+i7CPDGCCm4Vu3UqVrRNEh+MXkhIoZFnHCngG5O68KU1RiqNi0Y6zhEyvCWNSOJaVJ7QueSJupPv0kd91+NhJZrJOa1Wb4eUFnCg/Abgzx7YeHA2aV+9kMGDaQXWEQ7flp3gC5NW/ja0IAKypfT8C+snqfdhVbDlLYAq7b1RHAZiPhZ8SkdDDNog8kC8wQxBAKzFWbkyUct9AtD/1xZtp1+GATqgXAHyqEBtCdkOa7ng5UBJdHIRYf2zVqfdYtCJT6TSBGRRoz/Oet5WCFEDugYvy12RLe+59NNboY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(66946007)(2906002)(38350700002)(186003)(36756003)(16526019)(450100002)(38100700002)(5660300002)(83380400001)(66556008)(4326008)(52116002)(7696005)(478600001)(6486002)(8936002)(2616005)(8676002)(1076003)(6666004)(956004)(26005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fcX39+TbWAVR+n3TtQEGGVQcftTvoHhzfge0YnS2YFbZzkPA1V1PIWSWXdgQ?=
 =?us-ascii?Q?x5mggKqZlKiZX+zylGcJkWy7KNEPy9GYdZb4RY6SQLIduEJK1Rh2zwlOlx9o?=
 =?us-ascii?Q?AmH9zLkhpPsLA+dYIbyxmczLFWCiifVlz2ATwqIrX86ZjPHjM10/4UjZN6jX?=
 =?us-ascii?Q?nYSSTfaRpPUHGg9lIwfWuy5o6OIEyapHEKkU7CjmdKotZlLGfgC6Oq3eyAa0?=
 =?us-ascii?Q?yXpbJi/WjJd4ua4M68eQEUSEscb9e6kBfmbWL72ThgAzzadtlGo0Fnim4Zg1?=
 =?us-ascii?Q?1BcgocemB+N80T61EPK+qsXEChmOrXZK2m7peK1VeBDCkC23eFn800ifuZ8S?=
 =?us-ascii?Q?J79exi9it3V9hkQ4Zj5sQhyaWkzuoqGcWQPS0YKMJasNA8nWq7SBwd/GP3mH?=
 =?us-ascii?Q?ovxfOd92DnkggnOsXikqmYi+UXRc4YIckcjmiz0bRXCeROvMh5oBEuR04mhn?=
 =?us-ascii?Q?a7CXnwIxg4wF4QRzKEntV+y2IMADe2RrH2WOQb5K7y70VrAjHpEtIaItpdE0?=
 =?us-ascii?Q?VsER2aPWBgiZ32RqYfkHlSFvZYxYn70ZeAABfF6QWh71IXRQd9V0vVphPsvE?=
 =?us-ascii?Q?JhDfGet2NRb8ejo0eetXkl3SMYSRpZAdoZALRzlPCebPE34EXvSCiB8XrJl1?=
 =?us-ascii?Q?k3jl/dbyubQaTPuG/8maZ1wz3elPL0UQitnxN/o6xTkSn5y4qPM9dOdPdYfE?=
 =?us-ascii?Q?w/xTrTiRvYf/6mYxp9g8aSGZ76GAjag4Yd0n+NY4xRr6EE1D3Q4vNcm84ZTB?=
 =?us-ascii?Q?lHBKlviatY1Rz7yPxSuwpJAjKwtjy/d6MaCY2aN/2Vf5wftW7v3HyIT2ihyT?=
 =?us-ascii?Q?ek+rWn2hBGlz85ul0Z2vGpF0v+nfTx1Q206FZGGVU6RqR4tb2Hs3jCvVhwCC?=
 =?us-ascii?Q?2ainD/UWmUPo7z6YZLx5CvZKVGMXdbG2nh0tZfPPwggdtAABzlVcri6MukvA?=
 =?us-ascii?Q?Bcw1o96Etbble1WAalrSjJkivl7iHvZoIgtZ29B6OCZMrGzYsFR3U0VuFZ3S?=
 =?us-ascii?Q?zRcd615HuH9mHsLeXEIkesKzuCD5tdxJN86fOatLmJ/GREpRUtwk4QFouVod?=
 =?us-ascii?Q?/vEtNpKYC6W+0MqvU316wmX2CRteYQVk6Bct5rJgmGSDPtfvdpt/bVnXPgWD?=
 =?us-ascii?Q?OFsroqkdbpV81SR5axc+3pRu4Km6R5uP8t4fzl6U7yK3DO2vXpqBDwVbfA5l?=
 =?us-ascii?Q?d96P+zvQ9x5b3r+Q6vBIYBIZ0Bzt4Bp7uZ08mphCWLdqwnaHpZn7yDBYhDd7?=
 =?us-ascii?Q?2G5ggIqW1bKdlWF3fvXp/T24okBt3IBPKqnNTpnnX3T2P3MydaU/NWKvtLZe?=
 =?us-ascii?Q?98U6blfd83XeX04F9q/+LyYi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eee65cd-d148-4f0d-cc84-08d8ffad267e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:01.4817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+OXVOEV/yMDjzY+4Mh1x7UQaSVUvqixnfifEkjO2l18/s6yTxjzMUV/81uF44xp/qq+XCbhbjokU4/YRcdEKw==
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

Xnack retries are used for page fault recovery. Some AMD chip
families support continuously retry while page table entries are invalid.
The driver must handle the page fault interrupt and fill in a valid entry
for the GPU to continue.

This ioctl allows to enable/disable XNACK retries per KFD process.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 28 +++++++++++++++
 include/uapi/linux/kfd_ioctl.h           | 43 +++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 9511826ac8ae..9838d0cd1f51 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1743,6 +1743,31 @@ static int kfd_ioctl_smi_events(struct file *filep,
 	return kfd_smi_event_open(dev, &args->anon_fd);
 }
 
+static int kfd_ioctl_set_xnack_mode(struct file *filep,
+				    struct kfd_process *p, void *data)
+{
+	struct kfd_ioctl_set_xnack_mode_args *args = data;
+	int r = 0;
+
+	mutex_lock(&p->mutex);
+	if (args->xnack_enabled >= 0) {
+		if (!list_empty(&p->pqm.queues)) {
+			pr_debug("Process has user queues running\n");
+			mutex_unlock(&p->mutex);
+			return -EBUSY;
+		}
+		if (args->xnack_enabled && !kfd_process_xnack_mode(p, true))
+			r = -EPERM;
+		else
+			p->xnack_enabled = args->xnack_enabled;
+	} else {
+		args->xnack_enabled = p->xnack_enabled;
+	}
+	mutex_unlock(&p->mutex);
+
+	return r;
+}
+
 static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_svm_args *args = data;
@@ -1869,6 +1894,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 			kfd_ioctl_smi_events, 0),
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SVM, kfd_ioctl_svm, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
+			kfd_ioctl_set_xnack_mode, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 247b57baa94f..3cb5b5dd9f77 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -597,6 +597,44 @@ struct kfd_ioctl_svm_args {
 	struct kfd_ioctl_svm_attribute attrs[0];
 };
 
+/**
+ * kfd_ioctl_set_xnack_mode_args - Arguments for set_xnack_mode
+ *
+ * @xnack_enabled:       [in/out] Whether to enable XNACK mode for this process
+ *
+ * @xnack_enabled indicates whether recoverable page faults should be
+ * enabled for the current process. 0 means disabled, positive means
+ * enabled, negative means leave unchanged. If enabled, virtual address
+ * translations on GFXv9 and later AMD GPUs can return XNACK and retry
+ * the access until a valid PTE is available. This is used to implement
+ * device page faults.
+ *
+ * On output, @xnack_enabled returns the (new) current mode (0 or
+ * positive). Therefore, a negative input value can be used to query
+ * the current mode without changing it.
+ *
+ * The XNACK mode fundamentally changes the way SVM managed memory works
+ * in the driver, with subtle effects on application performance and
+ * functionality.
+ *
+ * Enabling XNACK mode requires shader programs to be compiled
+ * differently. Furthermore, not all GPUs support changing the mode
+ * per-process. Therefore changing the mode is only allowed while no
+ * user mode queues exist in the process. This ensure that no shader
+ * code is running that may be compiled for the wrong mode. And GPUs
+ * that cannot change to the requested mode will prevent the XNACK
+ * mode from occurring. All GPUs used by the process must be in the
+ * same XNACK mode.
+ *
+ * GFXv8 or older GPUs do not support 48 bit virtual addresses or SVM.
+ * Therefore those GPUs are not considered for the XNACK mode switch.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+struct kfd_ioctl_set_xnack_mode_args {
+	__s32 xnack_enabled;
+};
+
 #define AMDKFD_IOCTL_BASE 'K'
 #define AMDKFD_IO(nr)			_IO(AMDKFD_IOCTL_BASE, nr)
 #define AMDKFD_IOR(nr, type)		_IOR(AMDKFD_IOCTL_BASE, nr, type)
@@ -699,7 +737,10 @@ struct kfd_ioctl_svm_args {
 
 #define AMDKFD_IOC_SVM	AMDKFD_IOWR(0x20, struct kfd_ioctl_svm_args)
 
+#define AMDKFD_IOC_SET_XNACK_MODE		\
+		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x21
+#define AMDKFD_COMMAND_END		0x22
 
 #endif
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
