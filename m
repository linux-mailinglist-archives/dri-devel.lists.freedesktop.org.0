Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D75D2EC8A7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087706E42D;
	Thu,  7 Jan 2021 03:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACB66E417;
 Thu,  7 Jan 2021 03:02:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Px+y6ba8+so9Y6p395o2rr0nVIBpIo+LvKJS5bw/c1N8Cnl+K7IwcuwN6d4n17L0JrWfHSTvLf+TPyIPu4us7hY94pwNKGn0HfND9KQ+9nJFu7ZLEwDxqHq0bFmi6INm+bGFo8GxW5eBc7ZuoykJ7zA8VOMHOXJMbLODk3qQyoQAK/BfCspyMNLrRxlNzAxXtDAjB78Sujsnxyuot3DxA8K/9OZ7Y30/N+GLBqXoFaPPiVqeznllUf5ZNNNLp55wxwWS7er9OhoCBQ6n7AkbFRpOfRpli1esOQrvRoqcjXH0343w2ub4OhnbRsuDp32fGYKP+RFH7EPXPvvgzLahbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYGu+bV3N4LmksBxQ6n3cfHVkgWkt1rY9W/aod1dy90=;
 b=USwoNthWgW1jePRNmD/dtAzBDJ8ccQXJZfZPPyMuvDDMNaoorAcO130+1qCZU5IcBt+H96tnudlzYm6YpeSil+KyGvqZwnvzZILHC2Oc89MlE/EPNywsShc5wZglvyIUTOU7kia1clI76/CdgSK5VQSz0Y0LBtYLy5hM2b4ugtxszDEDX2ib719Fh02jMErEvEM48FxszFlSEtX21bATkFGOFWZ89+XNee1FbG70fQprgmtwXt7vZXhZVkx9kxS+3u7BSp9MOBnZzqsVJ0zgNbJtnaWzdqEEDTW1yCHpGC0T+Rk31ko7dgb8pij7t2W+C5LDS2eIr8wGwaZAosRRyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYGu+bV3N4LmksBxQ6n3cfHVkgWkt1rY9W/aod1dy90=;
 b=ozIlXvlWwbCPnTH7ePaSiNUfylHgD6xOcxfWnUZnWtKTg8/W94Z1/e0cO1YLKiqaJYnDp0n4/bIFDcsOl4TkkIDtRYkWz02AY9EmpvWXuk5A1Z60Oj55asXCbflFKLZ56LCkqRaD1HQQO0vBP3XYyIyxakyw5of4I6RA1vEE8+s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:57 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:57 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 16/35] drm/amdkfd: add ioctl to configure and query xnack
 retries
Date: Wed,  6 Jan 2021 22:01:08 -0500
Message-Id: <20210107030127.20393-17-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7af2d3ec-3991-4064-77cb-08d8b2b8bc73
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3999AF9587487B41445B606B92AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rze5e1fOIJdbn9yTA1K0O9fsRuPP0++b9+CMl5LFVJHs10ETbAukzkzh1vSesel1ou8pE10E7Mr63cNcyLoycH5fQXuY0iHYa4s/Jti3clS1W32juWEYpiukxyNqX31eQ61wCUGGX09xXcrY9DZfoRy3gsS8Qi13nksO0ZQoXLogols0lD9N6X6VuBSer73e/sh55FXqvWkPmd1aw85C94Wbaue6ExRSrS4O1A+QQnNMhEl9MGihjAKg80PKDY2d45HFbQdrcbOQ/wIy/t+CifiDl1El9jAea+6UIwnNnuZtw5QYFNqIIxk3XOz+blwrq1EKRQMp7LIuPQQN5IAVUkqGLMb61NahaT0HsVj58B+fj5kQwh43WmJsi+6H+PicUGNhR6pgS3A1golnky4Nqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?f2nFI7c5Fzmdj69rYiTKqtqQPoT9zBsxhmzVdHDakc1yV1OMzrkYTdo6DLEW?=
 =?us-ascii?Q?rKOhuTolVywof8wtexpckPdbITMHnwbUjz6qKrNfOvBR4TPNTRk5M556draR?=
 =?us-ascii?Q?DbnzpYGLigRGH1J1KW3+xs2SmbqRId1oPMOfxJRXfM/BU5dMw/98Ly3MMAHN?=
 =?us-ascii?Q?xYqOsbnID5/5XQtoO4CtX5vrDs0eu0/VLcENElIa5Og6IWGVGUDlaGpOZ95/?=
 =?us-ascii?Q?Q5V27WalwvwXWwffNN9NH9v1U6EuzFSeyLi83wS/l3pA71Vw1vijOwT54nBv?=
 =?us-ascii?Q?NAmBURD+kvDJw6cVyrprXbEneFPJqy37IpLwvNTam6HRtSab77LFlvEB9z9E?=
 =?us-ascii?Q?FP2RthzIneWwBe4KpDUcTWt4W8FdJzcPd1GFhoiJKXU8k22tBensYUMLYfrL?=
 =?us-ascii?Q?/lxusmo6hbNSQ2DCGNQOIIaJ3YR9augJk62DXmU83DLujt9GY6HoQ8grXmw5?=
 =?us-ascii?Q?Y0LTuENLZf1y/oEClvv2E+NrVQpi+CEkwkWUT78EMskeINLLZwc1k6alxLkc?=
 =?us-ascii?Q?+i58oIeEGWnoMT1VmnFyD/MKHp45ehq3OZoFyVvVG2zqv+wAYBoPvTFn62R2?=
 =?us-ascii?Q?hBPvKoPe3kLnmHJ93j+o09OVKE7oNSF/VRIBgNf8HE5+cqn4eUtvUdkPcFA9?=
 =?us-ascii?Q?UnHXC5iUVe0P2NP7Zg76yrfT+HM2a8b1vfk1DWAMPfs2wkFioB4fa8P/Hglk?=
 =?us-ascii?Q?qhPy7albZVP6ibu/FVYpNWs+KFhfXZVag/l6wtMbsnReg1wxpwY/sZx2nB15?=
 =?us-ascii?Q?daZKiH4JPvUWSQqfZesIgR5OUs6Js2UFUzNhT6cGiZr5T2o/z7sijpk+z2iV?=
 =?us-ascii?Q?AFkgtvyttqVy1SvX9IwDF5aD0BMN33G2FM3cCWkh1ReRnpvuRQY8J8WIn82j?=
 =?us-ascii?Q?mhrHgsSnwBLm4BXNK75MXvdSR5H/Ptb7z+WPcK8ZejPdRy0wqF9zCMk6Fc8t?=
 =?us-ascii?Q?Wl28uZ9W50WmhwThsaAJxhcW90eXDMaLQIs6cS2ixC/ZXAeggMC7v+gh1cB/?=
 =?us-ascii?Q?5bkF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:57.6274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af2d3ec-3991-4064-77cb-08d8b2b8bc73
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUIXW1gFceV+ulGL6TSSLqZ8dhPHZXDgYrAsxq308jZf0OyQiBCwfhZ+3YKfZ3asLz0AKCl66csVlF2RLhslgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, philip.yang@amd.com
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
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 28 +++++++++++++++
 include/uapi/linux/kfd_ioctl.h           | 43 +++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 2d3ba7e806d5..a9a6a7c8ff21 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1747,6 +1747,31 @@ static int kfd_ioctl_smi_events(struct file *filep,
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
+		if (args->xnack_enabled && !kfd_process_xnack_supported(p))
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
@@ -1870,6 +1895,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 			kfd_ioctl_smi_events, 0),
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SVM, kfd_ioctl_svm, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
+			kfd_ioctl_set_xnack_mode, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 5d4a4b3e0b61..b1a45cd37ab7 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -593,6 +593,44 @@ struct kfd_ioctl_svm_args {
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
@@ -695,7 +733,10 @@ struct kfd_ioctl_svm_args {
 
 #define AMDKFD_IOC_SVM	AMDKFD_IOWR(0x20, struct kfd_ioctl_svm_args)
 
+#define AMDKFD_IOC_SET_XNACK_MODE		\
+		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x21
+#define AMDKFD_COMMAND_END		0x22
 
 #endif
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
