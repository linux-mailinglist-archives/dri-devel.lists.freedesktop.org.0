Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253BC72E6EF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7137D10E3AD;
	Tue, 13 Jun 2023 15:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3D110E3A4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 15:20:28 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35DCfIAb029541; Tue, 13 Jun 2023 15:48:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=BZuidP131+vXXRLQ3tgPblLA49aXYpSiuQG8nzUtSFI=; b=ijR
 6MjaMZHqeIC1C3Uoxl0c8Fr210rQgZyQ5vdIjftLxrBxeXlt83QhkJ/8EczOuRIM
 1mhfcWGakUjtYUZUznEgtuB7FbvG8c8KRMG/lgYmK79QZaQfNDFTVs5Ja8QlN9p9
 Diw3qP1DcAAA7TP+8p5HSP2TNfCNk8A/SB8u7M9GEK7P7IJEz5Dljb8LMCML8T/E
 L5aGD89VbjcX8ST2bIfOOejUbjh3AFXvC5kbKb3d407IWiKTJiLuW9/rg4BnoLeU
 hw0SVphfEECXvbYiLHMjXZT1WsfNO8B8sxI1hrld4hD+Mn2uBOe+IlNDwWgkTXmx
 nrs3Q/Zz1OOY7wDYxzw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r4vqbt0kd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Jun 2023 15:48:23 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 15:48:22 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.57) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Tue, 13 Jun 2023 15:48:22 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnjYqCupJiLmfZ/0D3oVo7MehA5UzSxet/wHiciC8n/8SAf/ukJFb0wSnnAOFxDkqncubOXQ1OpUEHTOVlHvm3mAwcApZz8M1IhU2oshkr0qKo1kDt0wdrEMNEbzJlSBUy8bF/8R0DnyrP0QE6d2OrDIBXCtmBefdaI5wm97mdtAEIUARc5IR1mxpLSV3C9iZzViVoXeJrdXg5NPDgquRpw8JRyuynL6Yw8VrC5n2oKrNRqelAifrcUc/RI37M/qgAfsjBwKygGd2H6wfZjZiD1IaxTugQR+S3ezWOOuVgQCGW3Nw/tBDqDLDW2LXNI0BRl1SAk1BCl640SjtoLOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZuidP131+vXXRLQ3tgPblLA49aXYpSiuQG8nzUtSFI=;
 b=OdVXEXbI75VvmiYywzqgUu7LMlahSDv2F1YAh6Q30n98qKSjBIxNQBg/K51ZbTY5H12bU4DdG2o43kxrMnaLL4pcHgnIAv3WuESr10ORtCgn3mcCtFrdRDD2DPHkNZvE4qtUH/pNUO233DN3IklW/CLpYe/QmCAOCu3TQ75ptuRpg4GUMZ01aX4wN2GVeoVVz3RBKadkBtNyo/yqLmXpkXGsgPMQ3i9OSHp/cs8KcVkTmhdeSQeqT+ow8LCASWmAMoQSof13hjL+acsM5YWT4GFJcOuyzh9PF0egbQ0fzlbLIfwkcQeMimTEejOp5TRoYHYoYVLKbfdqCpJTkNrNbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZuidP131+vXXRLQ3tgPblLA49aXYpSiuQG8nzUtSFI=;
 b=WqpTGh3yYGncTSkLuy0p/gGp5i1VR9WbyBnfZcJ8UXT2vavb9V1UvoBSsMcOfkfWAQ+CZOBGvOg6HKh/lMU9cFEP9ihj0dlLVRFaNdlf02rCztvH3qJzqKGg5Vu8vB+W96p1JbKJDldileDPK1sKVlF+AN3oUgICqvPbcUynn6I=
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:155::11)
 by LO0P265MB6470.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 14:48:20 +0000
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f]) by CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f%5]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 14:48:20 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 15/17] drm/imagination: Add firmware trace to debugfs
Date: Tue, 13 Jun 2023 15:47:58 +0100
Message-Id: <20230613144800.52657-16-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613144800.52657-1-sarah.walker@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0375.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::20) To CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:155::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWXP265MB4826:EE_|LO0P265MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9d325d-8c22-4c9d-831d-08db6c1d3b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+LgbrJf4gRYQ7vT9+dMgAEWvous9d5n+oRJhpPMzCBNUHrvHuIDMcTGvMsd/4mVlNdUfj/N56jFpsansGXJYpjbWmP9t7vdSTlOgUnzbkXMOKGgLVu4x5Z+DeEo+UpHqgpDYDZX3zmncMriAm/FvP3lTIYgKx9ejv7XI6jXHeV3y2APC3P8TdStVq+0EOlB1bRuSGAYrgWZuxd0A8Rhfz1TnRe08zV+o524yLJVDnxk5x7klVCru+AJbnDwJkY3cLVKc0hEANvMZ0ZMKzt2tqugHbajIlRk0qrxlivGb2L8FNM9mewZbvDrq17xHlxEote8TTrPhrvDrx7RDYofsAqbhSddN1tuvR0mYbKV/VJPnZW2Ab3ZhRhEXpo1PbrwUVecND0D2xxdo0jyAgBbEJ08c2wu/Y2LdEgBieFv823AoEu7ZfNDNVMQ/WQyKIpj9/QMCLqJvCucAd+1jTCJJ6FD8qKNtBLaR1BEeROWSxA+cZnSWTMpHJqGE8FB6X+Up3G6z9AKzU4Mxi4Up7fo9EfYtMCIJjXyRSHNL229ehKT65at3gsA0PQrBivSgmTkk2Gz0Oy+UbjaUywP9Yc9+c1S38mI/2rWtNvE9/YMIvB136zV/KctRZfB1CgHtEi9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39850400004)(366004)(136003)(376002)(396003)(346002)(451199021)(66476007)(66556008)(66946007)(8936002)(8676002)(5660300002)(36756003)(6666004)(478600001)(6916009)(4326008)(52116002)(41300700001)(6486002)(316002)(38100700002)(38350700002)(186003)(1076003)(6506007)(6512007)(7416002)(2906002)(44832011)(30864003)(86362001)(2616005)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lXeTFK8Sdt7GMZGxsar4dUZ1KkNjj4hF1OcgMfI97dVTobzBUfsXhGV9ZR3i?=
 =?us-ascii?Q?tALvpydVoD+YU2vhtOlKO3qZ8G1t5h6DmL/oZMq0TV2s0duyU4d57b8fiOc6?=
 =?us-ascii?Q?IzCRQxRJqIGSlyKFzXAwDwxYzVOS4EQyBJv65XqXv2vd03jbDowKi0SqnFJW?=
 =?us-ascii?Q?SD5uA8Uz5pPQxnQUAh8IGpSvVFbzaXBYb79wHXYaOYwbAY6NsCDtqgf5j/dl?=
 =?us-ascii?Q?oBQPidgv56neeCXTTDodiJ9mUyPM+70uX+6s700ELoGjQN/fGCVBUfYycabm?=
 =?us-ascii?Q?yf2COQxsGFsqwbU+wTWKuIl+POq9Cfgc0sjttRFS4mu3ZRQOuuuglWHL2vc2?=
 =?us-ascii?Q?IsEmFDl+Di9/lrmwCzFIeBf95cxZptrJ+JJLeCUHZRUnNqMnGNN9hCIOR0mD?=
 =?us-ascii?Q?zEpLclCtcfv1CNqTot+eAIBmY0zxLJjVMsHjeIfayROHmBQIploVL0XeYbwf?=
 =?us-ascii?Q?zfM/NwDqOxBPO7KSW77Ol22iB3HKWLhVqRMqpcTx4ikBL/PtOZx123Sw42rn?=
 =?us-ascii?Q?+MNMUeIQ2u+o7WDwVbY/r0O7MldImitua3fpj2q2A4gRof9BAtivK//sMB2p?=
 =?us-ascii?Q?7m9RdZr2hZ6Hm8hlFj5MoioRgNFxlJpJNYRBeKcdxGArlS7DkT8BkRmtSKW3?=
 =?us-ascii?Q?WTY2wPNMwRZhi3B6grr1P8S5RAK6O5xjVQUAX7X5CubH5keur/w1imMhPvIi?=
 =?us-ascii?Q?yGyTdQhGXiNts9C98b7nrtYyWYAg3R7VwBZyWU2ga+OA5BwrohXsrXg6Mw1r?=
 =?us-ascii?Q?bQlcl/AcfpDyLdfuRsZ83hEAdeZOWTGL37fWw+kgXwYwV91tlfokoPHV0vqH?=
 =?us-ascii?Q?W/9/TKSvFEK/EfGAqWCjE2cNr+FtzmpoPEDQuVaeiKXE9xOQN0F8oGOOM2EA?=
 =?us-ascii?Q?eUmN2hfL8t0vbILfOOcXcU9wSUgvg/vydua6kI+eUauvOWPsUj9aG3uujFQS?=
 =?us-ascii?Q?egJrSfcKhas7HJvntuz3+3o2rn/EAAd9ctSYUbbHH3QHcKSEY/5qULfHsNbf?=
 =?us-ascii?Q?xqQGbAoVcrcaoTFzdqWifeddhi207iAOqY11CmI0N4mKK59u1gxgahp7eXJv?=
 =?us-ascii?Q?m7cd9GDZCG14UGUbEL4WgWxFtunTocJ5qUTlm1wfMFkWikuuZpwARW0t2375?=
 =?us-ascii?Q?P5/pE1w3uWL04rUrFmydOC7rT6GPR6qAMpT0pJ0XFoTgLlUTqW5WAfFu701k?=
 =?us-ascii?Q?7f4eik5ft+KMYXoukLPw23m18oVcIeDI3ssK6mE25baF+KRKscaEDtuZj8uS?=
 =?us-ascii?Q?V/HwDoyZMK3KTx/cMDIOHj8k9Pl5PobnzCTIb7bgrO4sflhT4jAyNSCPjZ3k?=
 =?us-ascii?Q?4RxoLbolSya/MmkndyvHLzVeObLcRXemFXtrZU8Ev8HsWvIybHHMfrPkDJb5?=
 =?us-ascii?Q?PtQ8VW8W+pc+8+dJnW3CyB6hfQxqUWidGU/3WUC2l4S2QR0+g9PTZk8uELaD?=
 =?us-ascii?Q?GM6P45sIyuqkHH82BUhGharxmPtdaRavh+TyT0xzmjYmCumqBEsMAyAQdYpY?=
 =?us-ascii?Q?xJln00nq6lbqz5qDcoazVqKvKt7198XGns+Nk3upTa4R7LDr7KRAjw6ARKPh?=
 =?us-ascii?Q?tc+sNV0eRfa00nw76UnCX4HgUhMJydsiyFrKchVgwIrWEyPJcv0eQaO3w8i7?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9d325d-8c22-4c9d-831d-08db6c1d3b37
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:48:20.8051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgppqNWS8tpUYLe9UU6H0+l1vL2y5DnzXmtVHr/QrxFWKnO5H0fegEq4YlAMIfWISc6n1BSHZipuJEp+v75Y8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6470
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: Pm8RTyk7xdJTkZlcf-Ik6GpSSvCDejho
X-Proofpoint-GUID: Pm8RTyk7xdJTkZlcf-Ik6GpSSvCDejho
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, sumit.semwal@linaro.org,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Firmware trace is exposed at /sys/debug/dri/<dev_nr>/pvr_fw/trace_0.
Trace is enabled via the group mask at
/sys/debug/dri/<dev_nr>/pvr_params/fw_trace_mask.

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile       |   4 +
 drivers/gpu/drm/imagination/pvr_debugfs.c  |  53 +++
 drivers/gpu/drm/imagination/pvr_debugfs.h  |  29 ++
 drivers/gpu/drm/imagination/pvr_device.c   |   9 +
 drivers/gpu/drm/imagination/pvr_device.h   |  10 +
 drivers/gpu/drm/imagination/pvr_drv.c      |   4 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 393 ++++++++++++++++++++-
 drivers/gpu/drm/imagination/pvr_params.c   | 147 ++++++++
 drivers/gpu/drm/imagination/pvr_params.h   |  72 ++++
 9 files changed, 720 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 85cd0c0c70cd..89c47adf6b0d 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -19,6 +19,7 @@ powervr-y := \
 	pvr_gem.o \
 	pvr_hwrt.o \
 	pvr_job.o \
+	pvr_params.o \
 	pvr_power.o \
 	pvr_queue.o \
 	pvr_stream.o \
@@ -26,4 +27,7 @@ powervr-y := \
 	pvr_vm.o \
 	pvr_vm_mips.o
 
+powervr-$(CONFIG_DEBUG_FS) += \
+	pvr_debugfs.o
+
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_debugfs.c b/drivers/gpu/drm/imagination/pvr_debugfs.c
new file mode 100644
index 000000000000..02e44c070861
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_debugfs.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_debugfs.h"
+
+#include "pvr_device.h"
+#include "pvr_fw_trace.h"
+#include "pvr_params.h"
+
+#include <linux/dcache.h>
+#include <linux/debugfs.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/drm_print.h>
+
+static const struct pvr_debugfs_entry pvr_debugfs_entries[] = {
+	{"pvr_params", pvr_params_debugfs_init},
+	{"pvr_fw", pvr_fw_trace_debugfs_init},
+};
+
+void
+pvr_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *drm_dev = minor->dev;
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	struct dentry *root = minor->debugfs_root;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(pvr_debugfs_entries); ++i) {
+		const struct pvr_debugfs_entry *entry = &pvr_debugfs_entries[i];
+		struct dentry *dir;
+
+		dir = debugfs_create_dir(entry->name, root);
+		if (IS_ERR(dir)) {
+			drm_warn(drm_dev,
+				 "failed to create debugfs dir '%s' (err=%d)",
+				 entry->name, (int)PTR_ERR(dir));
+			continue;
+		}
+
+		entry->init(pvr_dev, dir);
+	}
+}
+
+/*
+ * Since all entries are created under &drm_minor->debugfs_root, there's no
+ * need for a pvr_debugfs_fini() as DRM will clean up everything under its root
+ * automatically.
+ */
diff --git a/drivers/gpu/drm/imagination/pvr_debugfs.h b/drivers/gpu/drm/imagination/pvr_debugfs.h
new file mode 100644
index 000000000000..b260a2b26ebd
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_debugfs.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_DEBUGFS_H
+#define PVR_DEBUGFS_H
+
+/* Forward declaration from <drm/drm_drv.h>. */
+struct drm_minor;
+
+#if defined(CONFIG_DEBUG_FS)
+/* Forward declaration from "pvr_device.h". */
+struct pvr_device;
+
+/* Forward declaration from <linux/dcache.h>. */
+struct dentry;
+
+struct pvr_debugfs_entry {
+	const char *name;
+	void (*init)(struct pvr_device *pvr_dev, struct dentry *dir);
+};
+
+void pvr_debugfs_init(struct drm_minor *minor);
+#else /* defined(CONFIG_DEBUG_FS) */
+#include <linux/compiler_attributes.h>
+
+static __always_inline void pvr_debugfs_init(struct drm_minor *minor) {}
+#endif /* defined(CONFIG_DEBUG_FS) */
+
+#endif /* PVR_DEBUGFS_H */
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 209bc35450a9..d62f038c8840 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -5,6 +5,7 @@
 #include "pvr_device_info.h"
 
 #include "pvr_fw.h"
+#include "pvr_params.h"
 #include "pvr_power.h"
 #include "pvr_rogue_cr_defs.h"
 #include "pvr_stream.h"
@@ -580,6 +581,14 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	struct device *dev = drm_dev->dev;
 	int err;
 
+	/*
+	 * Setup device parameters. We do this first in case other steps
+	 * depend on them.
+	 */
+	err = pvr_device_params_init(&pvr_dev->params);
+	if (err)
+		return err;
+
 	/* Enable and initialize clocks required for the device to operate. */
 	err = pvr_device_clk_init(pvr_dev);
 	if (err)
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 9ab40d25a0fd..66de06c041de 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -7,6 +7,7 @@
 #include "pvr_ccb.h"
 #include "pvr_device_info.h"
 #include "pvr_fw.h"
+#include "pvr_params.h"
 #include "pvr_rogue_fwif_stream.h"
 #include "pvr_stream.h"
 
@@ -146,6 +147,15 @@ struct pvr_device {
 	/** @fw_dev: Firmware related data. */
 	struct pvr_fw_device fw_dev;
 
+	/**
+	 * @params: Device-specific parameters.
+	 *
+	 *          The values of these parameters are initialized from the
+	 *          defaults specified as module parameters. They may be
+	 *          modified at runtime via debugfs (if enabled).
+	 */
+	struct pvr_device_params params;
+
 	/** @stream_musthave_quirks: Bit array of "must-have" quirks for stream commands. */
 	u32 stream_musthave_quirks[PVR_STREAM_TYPE_MAX][PVR_STREAM_EXTHDR_TYPE_MAX];
 
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 2ee6c4b0d60e..15c1675e5a66 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2022 Imagination Technologies Ltd. */
 
 #include "pvr_context.h"
+#include "pvr_debugfs.h"
 #include "pvr_device.h"
 #include "pvr_drv.h"
 #include "pvr_free_list.h"
@@ -1385,6 +1386,9 @@ static struct drm_driver pvr_drm_driver = {
 	.ioctls = pvr_drm_driver_ioctls,
 	.num_ioctls = ARRAY_SIZE(pvr_drm_driver_ioctls),
 	.fops = &pvr_drm_driver_fops,
+#if defined(CONFIG_DEBUG_FS)
+	.debugfs_init = pvr_debugfs_init,
+#endif
 
 	.name = PVR_DRIVER_NAME,
 	.desc = PVR_DRIVER_DESC,
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index 42435149d56a..e0dd397f53e8 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -67,7 +67,12 @@ int pvr_fw_trace_init(struct pvr_device *pvr_dev)
 		ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS;
 	fw_trace->tracebuf_ctrl->tracebuf_flags = 0;
 
-	fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_NONE;
+	fw_trace->group_mask = pvr_dev->params.fw_trace_mask;
+	if (fw_trace->group_mask)
+		fw_trace->tracebuf_ctrl->log_type = fw_trace->group_mask |
+						    ROGUE_FWIF_LOG_TYPE_TRACE;
+	else
+		fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_NONE;
 
 	return 0;
 
@@ -97,3 +102,389 @@ void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
 	}
 	pvr_fw_object_unmap_and_destroy(fw_trace->tracebuf_ctrl_obj);
 }
+
+/**
+ * update_logtype() - Send KCCB command to trigger FW to update logtype
+ * @pvr_dev: Target PowerVR device
+ * @group_mask: New log group mask.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_kccb_send_cmd().
+ */
+static int
+update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
+{
+	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
+	struct rogue_fwif_kccb_cmd cmd;
+
+	if (group_mask)
+		fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_TRACE | group_mask;
+	else
+		fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_NONE;
+
+	cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_LOGTYPE_UPDATE;
+	cmd.kccb_flags = 0;
+
+	return pvr_kccb_send_cmd(pvr_dev, &cmd, NULL);
+}
+
+#if defined(CONFIG_DEBUG_FS)
+
+static int fw_trace_group_mask_show(struct seq_file *m, void *data)
+{
+	struct pvr_device *pvr_dev = m->private;
+
+	seq_printf(m, "%08x\n", pvr_dev->fw_dev.fw_trace.group_mask);
+
+	return 0;
+}
+
+static int fw_trace_group_mask_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, fw_trace_group_mask_show, inode->i_private);
+}
+
+static ssize_t fw_trace_group_mask_write(struct file *file, const char __user *ubuf, size_t len,
+					 loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	struct pvr_device *pvr_dev = m->private;
+	u32 new_group_mask;
+	int err;
+
+	err = kstrtouint_from_user(ubuf, len, 0, &new_group_mask);
+	if (err)
+		goto err_out;
+
+	err = update_logtype(pvr_dev, new_group_mask);
+	if (err)
+		goto err_out;
+
+	pvr_dev->fw_dev.fw_trace.group_mask = new_group_mask;
+
+err_out:
+	return err ? err : (ssize_t)len;
+}
+
+static const struct file_operations pvr_fw_trace_group_mask_fops = {
+	.owner = THIS_MODULE,
+	.open = fw_trace_group_mask_open,
+	.read = seq_read,
+	.write = fw_trace_group_mask_write,
+	.llseek = default_llseek,
+	.release = single_release,
+};
+
+struct pvr_fw_trace_seq_data {
+	/** @buffer: Pointer to copy of trace data. */
+	u32 *buffer;
+
+	/** @start_offset: Starting offset in trace data, as reported by FW. */
+	u32 start_offset;
+
+	/** @idx: Current index into trace data. */
+	u32 idx;
+
+	/** @assert_buf: Trace assert buffer, as reported by FW. */
+	struct rogue_fwif_file_info_buf assert_buf;
+};
+
+static u32 find_sfid(u32 id)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(stid_fmts); i++) {
+		if (stid_fmts[i].id == id)
+			return i;
+	}
+
+	return ROGUE_FW_SF_LAST;
+}
+
+static u32 read_fw_trace(struct pvr_fw_trace_seq_data *trace_seq_data, u32 offset)
+{
+	u32 idx;
+
+	idx = trace_seq_data->idx + offset;
+	if (idx >= ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS)
+		return 0;
+
+	idx = (idx + trace_seq_data->start_offset) % ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS;
+	return trace_seq_data->buffer[idx];
+}
+
+/**
+ * fw_trace_get_next() - Advance trace index to next entry
+ * @trace_seq_data: Trace sequence data.
+ *
+ * Returns:
+ *  * %true if trace index is now pointing to a valid entry, or
+ *  * %false if trace index is pointing to an invalid entry, or has hit the end
+ *    of the trace.
+ */
+static bool fw_trace_get_next(struct pvr_fw_trace_seq_data *trace_seq_data)
+{
+	u32 id, sf_id;
+
+	while (trace_seq_data->idx < ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS) {
+		id = read_fw_trace(trace_seq_data, 0);
+		trace_seq_data->idx++;
+		if (!ROGUE_FW_LOG_VALIDID(id))
+			continue;
+		if (id == ROGUE_FW_SF_MAIN_ASSERT_FAILED) {
+			/* Assertion failure marks the end of the trace. */
+			return false;
+		}
+
+		sf_id = find_sfid(id);
+		if (sf_id == ROGUE_FW_SF_FIRST)
+			continue;
+		if (sf_id == ROGUE_FW_SF_LAST) {
+			/*
+			 * Could not match with an ID in the SF table, trace is
+			 * most likely corrupt from this point.
+			 */
+			return false;
+		}
+
+		/* Skip over the timestamp, and any parameters. */
+		trace_seq_data->idx += 2 + ROGUE_FW_SF_PARAMNUM(id);
+
+		/* Ensure index is now pointing to a valid trace entry. */
+		id = read_fw_trace(trace_seq_data, 0);
+		if (!ROGUE_FW_LOG_VALIDID(id))
+			continue;
+
+		return true;
+	};
+
+	/* Hit end of trace data. */
+	return false;
+}
+
+/**
+ * fw_trace_get_first() - Find first valid entry in trace
+ * @trace_seq_data: Trace sequence data.
+ *
+ * Skips over invalid (usually zero) and ROGUE_FW_SF_FIRST entries.
+ *
+ * If the trace has no valid entries, this function will exit with the trace
+ * index pointing to the end of the trace. trace_seq_show() will return an error
+ * in this state.
+ */
+static void fw_trace_get_first(struct pvr_fw_trace_seq_data *trace_seq_data)
+{
+	trace_seq_data->idx = 0;
+
+	while (trace_seq_data->idx < ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS) {
+		u32 id = read_fw_trace(trace_seq_data, 0);
+
+		if (ROGUE_FW_LOG_VALIDID(id)) {
+			u32 sf_id = find_sfid(id);
+
+			if (sf_id != ROGUE_FW_SF_FIRST)
+				break;
+		}
+		trace_seq_data->idx++;
+	}
+}
+
+static void *fw_trace_seq_start(struct seq_file *s, loff_t *pos)
+{
+	struct pvr_fw_trace_seq_data *trace_seq_data = s->private;
+	u32 i;
+
+	/* Reset trace index, then advance to *pos. */
+	fw_trace_get_first(trace_seq_data);
+
+	for (i = 0; i < *pos; i++) {
+		if (!fw_trace_get_next(trace_seq_data))
+			return NULL;
+	}
+
+	return (trace_seq_data->idx < ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS) ? pos : NULL;
+}
+
+static void *fw_trace_seq_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct pvr_fw_trace_seq_data *trace_seq_data = s->private;
+
+	(*pos)++;
+	if (!fw_trace_get_next(trace_seq_data))
+		return NULL;
+
+	return (trace_seq_data->idx < ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS) ? pos : NULL;
+}
+
+static void fw_trace_seq_stop(struct seq_file *s, void *v)
+{
+}
+
+static int fw_trace_seq_show(struct seq_file *s, void *v)
+{
+	struct pvr_fw_trace_seq_data *trace_seq_data = s->private;
+	u64 timestamp;
+	u32 id;
+	u32 sf_id;
+	int err;
+
+	if (trace_seq_data->idx >= ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	id = read_fw_trace(trace_seq_data, 0);
+	if (!ROGUE_FW_LOG_VALIDID(id)) {
+		/* Index is not pointing at a valid entry. */
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	sf_id = find_sfid(id);
+	if (sf_id == ROGUE_FW_SF_LAST) {
+		/* Index is not pointing at a valid entry. */
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	timestamp = read_fw_trace(trace_seq_data, 1) |
+		((u64)read_fw_trace(trace_seq_data, 2) << 32);
+	timestamp = (timestamp & ~ROGUE_FWT_TIMESTAMP_TIME_CLRMSK) >>
+		ROGUE_FWT_TIMESTAMP_TIME_SHIFT;
+
+	seq_printf(s, "[%llu] : ", timestamp);
+	if (id == ROGUE_FW_SF_MAIN_ASSERT_FAILED) {
+		seq_printf(s, "ASSERTION %s failed at %s:%u",
+			   trace_seq_data->assert_buf.info,
+			   trace_seq_data->assert_buf.path,
+			   trace_seq_data->assert_buf.line_num);
+	} else {
+		seq_printf(s, stid_fmts[sf_id].name,
+			   read_fw_trace(trace_seq_data, 3),
+			   read_fw_trace(trace_seq_data, 4),
+			   read_fw_trace(trace_seq_data, 5),
+			   read_fw_trace(trace_seq_data, 6),
+			   read_fw_trace(trace_seq_data, 7),
+			   read_fw_trace(trace_seq_data, 8),
+			   read_fw_trace(trace_seq_data, 9),
+			   read_fw_trace(trace_seq_data, 10),
+			   read_fw_trace(trace_seq_data, 11),
+			   read_fw_trace(trace_seq_data, 12),
+			   read_fw_trace(trace_seq_data, 13),
+			   read_fw_trace(trace_seq_data, 14),
+			   read_fw_trace(trace_seq_data, 15),
+			   read_fw_trace(trace_seq_data, 16),
+			   read_fw_trace(trace_seq_data, 17),
+			   read_fw_trace(trace_seq_data, 18),
+			   read_fw_trace(trace_seq_data, 19),
+			   read_fw_trace(trace_seq_data, 20),
+			   read_fw_trace(trace_seq_data, 21),
+			   read_fw_trace(trace_seq_data, 22));
+	}
+	seq_puts(s, "\n");
+	return 0;
+
+err_out:
+	return err;
+}
+
+static const struct seq_operations pvr_fw_trace_seq_ops = {
+	.start = fw_trace_seq_start,
+	.next = fw_trace_seq_next,
+	.stop = fw_trace_seq_stop,
+	.show = fw_trace_seq_show
+};
+
+static int fw_trace_open(struct inode *inode, struct file *file)
+{
+	struct pvr_fw_trace_buffer *trace_buffer = inode->i_private;
+	struct rogue_fwif_tracebuf_space *tracebuf_space =
+		trace_buffer->tracebuf_space;
+	struct pvr_fw_trace_seq_data *trace_seq_data;
+	int err;
+
+	trace_seq_data = kzalloc(sizeof(*trace_seq_data), GFP_KERNEL);
+	if (!trace_seq_data)
+		return -ENOMEM;
+
+	trace_seq_data->buffer = kcalloc(ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS,
+					 sizeof(*trace_seq_data->buffer), GFP_KERNEL);
+	if (!trace_seq_data->buffer) {
+		err = -ENOMEM;
+		goto err_free_data;
+	}
+
+	/*
+	 * Take a local copy of the trace buffer, as firmware may still be
+	 * writing to it. This will exist as long as this file is open.
+	 */
+	memcpy(trace_seq_data->buffer, trace_buffer->buf,
+	       ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS * sizeof(u32));
+	trace_seq_data->start_offset = READ_ONCE(tracebuf_space->trace_pointer);
+	trace_seq_data->assert_buf = tracebuf_space->assert_buf;
+	fw_trace_get_first(trace_seq_data);
+
+	err = seq_open(file, &pvr_fw_trace_seq_ops);
+	if (err)
+		goto err_free_buffer;
+
+	((struct seq_file *)file->private_data)->private = trace_seq_data;
+
+	return 0;
+
+err_free_buffer:
+	kfree(trace_seq_data->buffer);
+
+err_free_data:
+	kfree(trace_seq_data);
+
+	return err;
+}
+
+static int fw_trace_release(struct inode *inode, struct file *file)
+{
+	struct pvr_fw_trace_seq_data *trace_seq_data =
+		((struct seq_file *)file->private_data)->private;
+
+	seq_release(inode, file);
+	kfree(trace_seq_data->buffer);
+	kfree(trace_seq_data);
+
+	return 0;
+}
+
+static const struct file_operations pvr_fw_trace_fops = {
+	.owner = THIS_MODULE,
+	.open = fw_trace_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = fw_trace_release,
+};
+
+void
+pvr_fw_trace_mask_update(struct pvr_device *pvr_dev, u32 old_mask, u32 new_mask)
+{
+	if (old_mask != new_mask)
+		update_logtype(pvr_dev, new_mask);
+}
+
+void
+pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir)
+{
+	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
+	u32 thread_nr;
+
+	static_assert(ARRAY_SIZE(fw_trace->buffers) <= 10,
+		      "The filename buffer is only large enough for a single-digit thread count");
+
+	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); ++thread_nr) {
+		char filename[8];
+
+		snprintf(filename, ARRAY_SIZE(filename), "trace_%u", thread_nr);
+		debugfs_create_file(filename, 0400, dir,
+				    &fw_trace->buffers[thread_nr],
+				    &pvr_fw_trace_fops);
+	}
+}
+#endif
diff --git a/drivers/gpu/drm/imagination/pvr_params.c b/drivers/gpu/drm/imagination/pvr_params.c
new file mode 100644
index 000000000000..20f2ba8915f4
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_params.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_params.h"
+
+#include <linux/cache.h>
+#include <linux/moduleparam.h>
+
+static struct pvr_device_params pvr_device_param_defaults __read_mostly = {
+#define X(type_, name_, value_, desc_, ...) .name_ = (value_),
+	PVR_DEVICE_PARAMS
+#undef X
+};
+
+#define PVR_DEVICE_PARAM_NAMED(name_, type_, desc_) \
+	module_param_named(name_, pvr_device_param_defaults.name_, type_, \
+			   0400);                                         \
+	MODULE_PARM_DESC(name_, desc_);
+
+/*
+ * This list of defines must contain every type specified in "pvr_params.h" as
+ * ``PVR_PARAM_TYPE_*_C``.
+ */
+#define PVR_PARAM_TYPE_X32_MODPARAM uint
+
+#define X(type_, name_, value_, desc_, ...) \
+	PVR_DEVICE_PARAM_NAMED(name_, PVR_PARAM_TYPE_##type_##_MODPARAM, desc_);
+PVR_DEVICE_PARAMS
+#undef X
+
+int
+pvr_device_params_init(struct pvr_device_params *params)
+{
+	/*
+	 * If heap-allocated parameters are added in the future (e.g.
+	 * modparam's charp type), they must be handled specially here (via
+	 * kstrdup() in the case of charp). Since that's not necessary yet,
+	 * a straight copy will do for now. This change will also require a
+	 * pvr_device_params_fini() function to free any heap-allocated copies.
+	 */
+
+	*params = pvr_device_param_defaults;
+
+	return 0;
+}
+
+#if defined(CONFIG_DEBUG_FS)
+#include "pvr_device.h"
+
+#include <linux/dcache.h>
+#include <linux/debugfs.h>
+#include <linux/export.h>
+#include <linux/fs.h>
+#include <linux/stddef.h>
+
+/*
+ * This list of defines must contain every type specified in "pvr_params.h" as
+ * ``PVR_PARAM_TYPE_*_C``.
+ */
+#define PVR_PARAM_TYPE_X32_FMT "0x%08llx"
+
+#define X_SET(name_, mode_) X_SET_##mode_(name_)
+#define X_SET_DEF(name_, update_, mode_) X_SET_DEF_##mode_(name_, update_)
+
+#define X_SET_RO(name_) NULL
+#define X_SET_RW(name_) __pvr_device_param_##name_##set
+
+#define X_SET_DEF_RO(name_, update_)
+#define X_SET_DEF_RW(name_, update_)                                    \
+	static int                                                      \
+	X_SET_RW(name_)(void *data, u64 val)                            \
+	{                                                               \
+		struct pvr_device *pvr_dev = data;                      \
+		/* This is not just (update_) to suppress -Waddress. */ \
+		if ((void *)(update_) != NULL)                          \
+			(update_)(pvr_dev, pvr_dev->params.name_, val); \
+		pvr_dev->params.name_ = val;                            \
+		return 0;                                               \
+	}
+
+#define X(type_, name_, value_, desc_, mode_, update_)                     \
+	static int                                                         \
+	__pvr_device_param_##name_##_get(void *data, u64 *val)             \
+	{                                                                  \
+		struct pvr_device *pvr_dev = data;                         \
+		*val = pvr_dev->params.name_;                              \
+		return 0;                                                  \
+	}                                                                  \
+	X_SET_DEF(name_, update_, mode_)                                   \
+	static int                                                         \
+	__pvr_device_param_##name_##_open(struct inode *inode,             \
+					  struct file *file)               \
+	{                                                                  \
+		__simple_attr_check_format(PVR_PARAM_TYPE_##type_##_FMT,   \
+					   0ull);                          \
+		return simple_attr_open(inode, file,                       \
+					__pvr_device_param_##name_##_get,  \
+					X_SET(name_, mode_),               \
+					PVR_PARAM_TYPE_##type_##_FMT);     \
+	}
+PVR_DEVICE_PARAMS
+#undef X
+
+#undef X_SET
+#undef X_SET_RO
+#undef X_SET_RW
+#undef X_SET_DEF
+#undef X_SET_DEF_RO
+#undef X_SET_DEF_RW
+
+static struct {
+#define X(type_, name_, value_, desc_, mode_, update_) \
+	const struct file_operations name_;
+	PVR_DEVICE_PARAMS
+#undef X
+} pvr_device_param_debugfs_fops = {
+#define X(type_, name_, value_, desc_, mode_, update_)     \
+	.name_ = {                                         \
+		.owner = THIS_MODULE,                      \
+		.open = __pvr_device_param_##name_##_open, \
+		.release = simple_attr_release,            \
+		.read = simple_attr_read,                  \
+		.write = simple_attr_write,                \
+		.llseek = generic_file_llseek,             \
+	},
+	PVR_DEVICE_PARAMS
+#undef X
+};
+
+void
+pvr_params_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir)
+{
+#define X_MODE(mode_) X_MODE_##mode_
+#define X_MODE_RO 0400
+#define X_MODE_RW 0600
+
+#define X(type_, name_, value_, desc_, mode_, update_)             \
+	debugfs_create_file(#name_, X_MODE(mode_), dir, pvr_dev,   \
+			    &pvr_device_param_debugfs_fops.name_);
+	PVR_DEVICE_PARAMS
+#undef X
+
+#undef X_MODE
+#undef X_MODE_RO
+#undef X_MODE_RW
+}
+#endif
diff --git a/drivers/gpu/drm/imagination/pvr_params.h b/drivers/gpu/drm/imagination/pvr_params.h
new file mode 100644
index 000000000000..1d8335246d27
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_params.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_PARAMS_H
+#define PVR_PARAMS_H
+
+#include "pvr_rogue_fwif.h"
+
+#include <linux/cache.h>
+#include <linux/compiler_attributes.h>
+
+/*
+ * This is the definitive list of types allowed in the definition of
+ * %PVR_DEVICE_PARAMS.
+ */
+#define PVR_PARAM_TYPE_X32_C u32
+
+/*
+ * This macro defines all device-specific parameters; that is parameters which
+ * are set independently per device.
+ *
+ * The X-macro accepts the following arguments. Arguments marked with [debugfs]
+ * are ignored when debugfs is disabled; values used for these arguments may
+ * safely be gated behind CONFIG_DEBUG_FS.
+ *
+ * @type_: The definitive list of allowed values is PVR_PARAM_TYPE_*_C.
+ * @name_: Name of the parameter. This is used both as the field name in C and
+ *         stringified as the parameter name.
+ * @value_: Initial/default value.
+ * @desc_: String literal used as help text to describe the usage of this
+ *         parameter.
+ * @mode_: [debugfs] One of {RO,RW}. The access mode of the debugfs entry for
+ *         this parameter.
+ * @update_: [debugfs] When debugfs support is enabled, parameters may be
+ *           updated at runtime. When this happens, this function will be
+ *           called to allow changes to propagate. The signature of this
+ *           function is:
+ *
+ *              void (*)(struct pvr_device *pvr_dev, T old_val, T new_val)
+ *
+ *           Where T is the C type associated with @type_.
+ *
+ *           If @mode_ does not allow write access, this function will never be
+ *           called. In this case, or if no update callback is required, you
+ *           should specify NULL for this argument.
+ */
+#define PVR_DEVICE_PARAMS                                                    \
+	X(X32, fw_trace_mask, ROGUE_FWIF_LOG_TYPE_NONE,                      \
+	  "Enable FW trace for the specified groups. Specifying 0 disables " \
+	  "all FW tracing.",                                                 \
+	  RW, pvr_fw_trace_mask_update)
+
+struct pvr_device_params {
+#define X(type_, name_, value_, desc_, ...) \
+	PVR_PARAM_TYPE_##type_##_C name_;
+	PVR_DEVICE_PARAMS
+#undef X
+};
+
+int pvr_device_params_init(struct pvr_device_params *params);
+
+#if defined(CONFIG_DEBUG_FS)
+/* Forward declaration from "pvr_device.h". */
+struct pvr_device;
+
+/* Forward declaration from <linux/dcache.h>. */
+struct dentry;
+
+void pvr_params_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir);
+#endif /* defined(CONFIG_DEBUG_FS) */
+
+#endif /* PVR_PARAMS_H */
-- 
2.40.1

