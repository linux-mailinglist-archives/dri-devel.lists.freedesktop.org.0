Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0987A343F06
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5818D6E0CC;
	Mon, 22 Mar 2021 11:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C818389EB1;
 Mon, 22 Mar 2021 11:07:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFqQLNdOITBeUS8/1EjwVRx2Ndq+i9tmGDsKnj2e7r3nMlCTjVV5nxR12drgJfEog754uQgNSKpxjZk6+3Dr2nOtMk6a3QV12y7Auu+5qcwv+CPiD6cSxnFs6Q1kLOnJap1EurhtwepidPXHCFY9RuK3Z6psM83LtetFa1g5KFELlJ/IyTAkkjEMilNZOrK24faG0312ANE+nImRly6zqyDm+g+2NJdbgNVVcsVtYh0G3zmwIzjinS9L6mP9wzLIj/ppAaXN6Pnq3FstXT5EmlUbYwQixdGRi/vZ5JaniiwsRxS3FNNXiu15xGK327W24hdiIIIW0r2r8ahNPk5TKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7arCvRa/0V2Nc4Fqyd+wz49NawQlux4qsKns1D5belg=;
 b=k6pKBfGH0/FlXr5OaJNhy5v6b1Ye3PdCpHL4gPvwdFpat8UiYBu3eNIvgc2FzCveUduUWBx0cXRa38/IoRGdx1NmQtp1xeGUqb4Gb0Mzf1ylxgCVIkM4UfefORA06R0aMUsdix+yasSiMcqhOPPxnqgOx51+2qXG6mitvz7p1RCsKGyX0C0Cuc/4kbQPjrWLVt93XNKnf2PzthA1RiSTVekacSMKEVq3uY7EvLVj7/w8VLMqj/4GYL+amFapSuDhjdsh9K5LLxANZhvU1E4l7uiB/dDGrVnv2O+O3uQsSO7NyhzDb9x4RJMHqaR1MCOvsfYfXMcCe06dYpJtKmbz0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7arCvRa/0V2Nc4Fqyd+wz49NawQlux4qsKns1D5belg=;
 b=lx0yjtji/2YHpCoAAnXXfkTBYO+B3IpYKGY+qHFzTDC+z8z2jtM+sAy6S484tYHZrXo+mbzfbkUm7w/PKF3UepIJeOkgkha8eoQTob3NZ+b1eW7M6XMPRdP3BxytTy4rd2B/ks6PTVC7bwqDC3Y/Uiw5o/Ei0skewxlyQl1ypXU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:37 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:37 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/44] drm/amdkfd: add ioctl to configure and query xnack
 retries
Date: Mon, 22 Mar 2021 06:58:29 -0400
Message-Id: <20210322105900.14068-14-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d4e24f4-70bc-42b5-5057-08d8ed22b33d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB36783A47BCECB4C31E9131F492659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6nFQfppPZH20OIx2wLX2+EjBSJ7xQRpvnWU+8sgbTXV3vdzEt2BgSmZlutBtJ7YT7SdXoRIDnzxwe5r7Lj1/m7WSftZvyzaACA5O2sF99AOU4QITyfvFMyq6SNbGHggv04/Ov4z3YWJSiFu9PYa/tGQLuYq1IcKeDCFn0ysARabddtgwonGFM6peud2Xu202cbR92mwjy/yyj1eF6/1HmDFTAJrFOZgf/qyxu4r6wImqO/fS0XPOPk8rfIiA3VNNAv7vzNIKXV6e+6Z7USf1qiU8XSEvdyuBIK6VURpbqud78MN11oU1um8+/MWSMe6DpG7wN/AZdTUfOARzJCLqChEo+KnKl1yqLxH4Ybzc1K5jR3tjK/Vc24K0Gem5k1U8v4YNzeLMdS37fFDY/YOwidTvP/s/GmTs/BgNQ3eET31e5813NLRdQJ1jq0wwobXMbHIDt18m6wJft5FxDrdYHTgouYLlZvS8wM/1omHT7ETraj5Nw3s6IX2SEUWLrUgolYSq+5HUEF9BEDuQpaokICZdCZT1d089Y+EtDHZXUO5d8UMW4xWGerdnOBisb800t1RdxOf66ZTE4GcbDG1dUmIGwbLppn+uXJeoVAt/fRIHUyF+OpRuy43yGgz7KsqkpBmlyObcOMvuZfBGyLAvNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(6486002)(1076003)(36756003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?igCJjMAU7+MrQ7AUyN3askbMxIxj6gFWEJN2YsXssiaWNNyt/dkNpTX7zY7r?=
 =?us-ascii?Q?jr2n4KRmpRtbtktO15DAFsQwB6vMcmXPp9TyTYXbV8Tq0qLmURlPTphoGQN8?=
 =?us-ascii?Q?abS9peNGrZHwUvq9Fm38bZnBx3zLAfFJDx9e5lJo0mXBKtN4jyT7NY7ggPeW?=
 =?us-ascii?Q?e4wi4t4xsv/oCHsySxEPFFt2QbKrnHohy0jhmUludJ888vkKLJopOmz/+mJX?=
 =?us-ascii?Q?Ptk9Ieq6TDv6usBIwxFT4g7MxLGEHg5/uDh6KziOGwK06CWFr5AzlyXhrV3b?=
 =?us-ascii?Q?9Rl20QdeviiFrMejLibcXJcqeS3WemZQE2yAaVEqoOOytVsaBCjsap1IIPyj?=
 =?us-ascii?Q?HSlvYK+8IZ6G2qskL9twxQLsaTpnffVsDXg5R5VpjrQ51lhva2CAlZW4yvHV?=
 =?us-ascii?Q?p4kLRwc7Wy1Giw5hw6jIfkLKZHaLg2c5/iyVwojo0XBZkgK+Y7so1irpzMDr?=
 =?us-ascii?Q?0IMURbLYvIc2JcEft+3SXo6FTLDATHYYbn2/X7KLg4vx8aI2lfqzsSKtzR3U?=
 =?us-ascii?Q?F6POyufBsd65NTKAf5Q3Cj+VHVKzxKIAVzaGY0KYUv1LOFvnCNR4U5kWKp3F?=
 =?us-ascii?Q?Fz0AP1S8OY1q7MM+jpv/0tiAXy9gEoYbqorDUJc2a3MyG/HyXpPA43s0T0dF?=
 =?us-ascii?Q?YMe0q+2C5p2IvNCtvZtUaqzEMyMbZ6nROIXsBPmz4xEWSSj8bm2/QAL82rzr?=
 =?us-ascii?Q?R/J3pt4UtqZFgm23h/sCMDVZGt7pWGhNn185bPIcRsUU7GyGLJRyBPSwePFQ?=
 =?us-ascii?Q?TOyVfgmN2xp5/U57ZGpqCMF5z+yhXUemp+s0BScpjcx2hh31llLOVvqviE0U?=
 =?us-ascii?Q?Df3MnVDHjf9TyIGqximc2iXwx5IZBICdRVpZB7yCWzIbb4Kqnpo3Vn80hxmt?=
 =?us-ascii?Q?ZEgoAJtpV3vIefcTJf7rwEyITvOqswW3RG6TRnYQHy1hYkwdsPMpRSWLTnwg?=
 =?us-ascii?Q?Ffz6apMDdBx2o96dabzOR7FRSusB546r3Q+HUq7TcYYDNx5FemmOHVkuJFHq?=
 =?us-ascii?Q?XtuSC7YEP8M2LpaEBQFOS2g3R83LKsuwwqBve1e9uiIwyQdFQSXPkr/ezfMJ?=
 =?us-ascii?Q?Kplk7v4EE3tRm8KOEeCfVbeRZ7YGU62QK0ydsob/T3nC1tvkvBbDyU1UqsFe?=
 =?us-ascii?Q?3U3GKu9ORCZ312ZUIW/zpqV+Wl+D2JUV27jxeQnVnt8Llq+4WPnE6mskvIXQ?=
 =?us-ascii?Q?EtpWSUvaQo4YDPy4PlLSRsbQh8hx0XtV+9AhYWqGZN5PSgkFhfUQE3o2ReJ2?=
 =?us-ascii?Q?VFLItk7DxnNKxby0iM9sUCF5ZG+RsEtfwOhyjEAJ1EbDirBNXqZpXP9grbbc?=
 =?us-ascii?Q?k0VrFZCmFJms5VOIHRskscIt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4e24f4-70bc-42b5-5057-08d8ed22b33d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:36.7304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tAGyVT4MGNmbv7wnMPtS7G7ICFgv4hD2qdNSB901QBe9vHdMDnd1Y/oGbTutVeTtaQQPoxd33/f9vLlvQMk1w==
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
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 28 +++++++++++++++
 include/uapi/linux/kfd_ioctl.h           | 43 +++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 9511826ac8ae..63eee7ef3355 100644
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
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
