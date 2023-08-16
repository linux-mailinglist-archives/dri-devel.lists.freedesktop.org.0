Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B41377DC33
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749D110E305;
	Wed, 16 Aug 2023 08:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E7B10E2F3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:26:59 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G7djRb002497; Wed, 16 Aug 2023 09:26:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=OnwjbFxwjpaawl13D9FvWzszMT6NJ9gxVu3/jsBGsf4=; b=ZjV
 7JdqyisSi/S3UE/BoePO8bxI4fFJv2YQGSHtuibRHO2dOO8hnysKtEFsQCaOBSq/
 NNAMo5w1TqZBoclacmPbeu/O56AS3Ns8TCvudfu044LAgQrmkHWguoxFvJcRKjE2
 FMAORCy1FfittxAyXjv9FYbo2idGfHBXSrgvcidZtnOgW1Rb0CFISdoQV7BEosNd
 pJsKo6Vs3iodeblNBKO9BR7kBNT/5HFHNAuWQzM9dvKkXieAM4DtuJfqIUKmMDgP
 QRJkqfAAFP3d5zL4mYjad/ZnQchEtAAbXOqiOWUkzNCtacjbW7YmI7aMKC2w7vYB
 hL7GquKlvp9Q/FiPoFg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3se25ttutw-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Aug 2023 09:26:40 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:26:29 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 09:26:29 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqEQzPr7YNY6MKz/97W7LMRNZ2g2H6ZSYrEQo84Zykl/AtrKKx17c5GZuMcyuEyySEovZqBcTvsURS5jyMuUNERP5uTq6KL+fIsQ0DKXGjR/oL9OgwBzgkR3gdRDi2JhyfOvx420GTjVL+m3PTTNJztZQHWVH+4ehbT+mP7a3Evwj7Qm0Hr+9oPu40ldebvo11Dxk8pb+BKkfiyGz3HkRidXsHOXpgHEUoFWR8l7hMUslsmjfLNv0ieJ/9CoaFCb2vonKOZwDmTRvnZfHGRoIvhYsrLWdFoE27Nwgpkh6oTmHqjIUAn3/x7OjcuROlr9Bb91EY9ns2eE3ShrtCqfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnwjbFxwjpaawl13D9FvWzszMT6NJ9gxVu3/jsBGsf4=;
 b=jNm1TEPRpfTUcfoNsiUILeULOfvU2PYCtFKKR2Gp83uILfEION/kHgn4vE+p2SmcYD6lLdPYau1W0SCcuF0gYPJEG1VZSWDzwAhy8OZ1A7E8V3dbWWnkToGyF8iMew6djshDAEe6jcTKFmJcyvk0vuVLtz8BUmAYVsqnSTBfUi9s0+xyqKS+myGYnv05vfhKJRY4rS+LixAxRm3CcfdGDSnukfP1RFo41OtRQj9jtsLQ1P1JeWNocgTAHn1fCImCjNPL2zKwgy7Jo1xotedjHesAzb6C/EFc6scwG00rcg1pDT5wb4YzuGN54EeI0pO6k7FQJhHSY4RO+f10d7OeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnwjbFxwjpaawl13D9FvWzszMT6NJ9gxVu3/jsBGsf4=;
 b=FU/ZLcw5Una50Do8y02JqXR0iLoOXRZT4qUn3xY+25pMm4n+WwBIK0OUqIBVtamRsUaiC5MolefUZBJOTV2F/IhhD4xzoBTrUMvWqWCaOTBQDrzEbKWQfCK/AdwULxL8Cmb6u2rXs0OapSR4jpI2Y7D3nhNbCRSWyMuEf2Wk940=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2491.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 08:26:27 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6678.022; Wed, 16 Aug 2023
 08:26:26 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 15/17] drm/imagination: Add firmware trace to debugfs
Date: Wed, 16 Aug 2023 09:25:30 +0100
Message-Id: <20230816082531.164695-16-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230816082531.164695-1-sarah.walker@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::10) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LNXP265MB2491:EE_
X-MS-Office365-Filtering-Correlation-Id: fa97e6eb-62d8-4123-b225-08db9e327beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fs/mMXH2kgU/4thBczz4lWMRjHec3U6NCVDE2tBQBXDVZ0QHH1CyyuSNOgDzEygbRCyhGnIIs+s+jmP9ROPf6QzEl5dy8uazpG+yKIl6pJnxVdhxN0Cqr983q01pyYb3RW0zzT1nC5KvnxjpMu5VwOAmaQA0ia97QYelKSCxSmDGD3vofJXe+kTmi7NABadrIRaNhZn66803JP69lR/ibBSEg7ki72iMnRUUPj4GhzRB6wS2kIAuMM9aO5RPoo7hDD9i+mwERkWqaXgmjaQB6BRzulkp3WBq7EF35wpqo7J1gCGeFmo1PN4n3ZXJt+ckMGAzBnQGJQ0Leex7p7TJ3ZDRbO1r1ksfzafmPybfbW+Fe7DFRRLr/j3JSazpZIvPg6aUB6Ea/fdz9pE6et8MivCejLLAe3zf45atSVEBJstHb+biLyy61+23juUhgqOGYWzwR1fZmfU6CzhahOXr06z2xzfvG/jWdT9G7N2+W0BSrNJjsSTANnn5hbNpti0X2sH0PffHazFzSKLNvj8tdj3aG9wZ71MGmV7QwaKHVtdYS0eqsQEpjcxavTGsWhYRUS9XqtCssNDX0txL7KTPmAB1dpgEx1GBoT4ndMy3Nw8Hc3x9yYLbBxV7OLzcUP7j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39850400004)(346002)(136003)(1800799009)(451199024)(186009)(6666004)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(30864003)(2906002)(478600001)(1076003)(26005)(6916009)(7416002)(107886003)(5660300002)(2616005)(83380400001)(41300700001)(316002)(44832011)(52116002)(8936002)(4326008)(8676002)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kO6W58cycBSxtthngsd/EgOZwKOCFlpqZFIPo4FgUNL5be+HLuCxZnsEtHos?=
 =?us-ascii?Q?hvyuaN+ofDZ2u6sLaTZNlFP2hBDxfbshSLUUBCWhmZvMvVUEj+KYixB3yCAg?=
 =?us-ascii?Q?XPWni3gWQ9tCQ1v7RIVtjz6o1YvxmTNVGISpVfogrWCHpIqLc2fatBdVV+d2?=
 =?us-ascii?Q?V0j3p1rlP+6wCvOBZ+iI5bQ6dwqVnT5JnymtaNNg3BcbRihFqoO+p1WhUTNI?=
 =?us-ascii?Q?kAaBhU0ZzyNzvlHOqGmIr23QtB3mg1H8lk6q4gPnVSRs6VAwI/LqbFRfbxgt?=
 =?us-ascii?Q?ZjSO9gS8uXLoWd+bSM7sL+ytEuxaJemV8shCcDe535KpkJnHHEa0RPUGkcTP?=
 =?us-ascii?Q?ZZ6nh/ruQazbhlbZYOEAaXuDsq0doLYlh8Zn3Cu2EqVWVzxxh+67TDxGoEOl?=
 =?us-ascii?Q?bIBSRvoZj+l1xlRuJveRuF4wasQmcrpzGOltD/YwUrgdhK5paktcXfqAu60e?=
 =?us-ascii?Q?UlZuWI4HdQ/ZpmdDabtoWUywI7gZsFZxTUKrZYtKgFDpxqH0v67isOz33m7y?=
 =?us-ascii?Q?DuICWteZh7nQk9mesFD8wNlvd5ADnVOgECgcyORNK/UaD6c897i9w+y4dnFl?=
 =?us-ascii?Q?Em+V+u3nPwy300pP28/FQvazZx96Cbx1HFoN01Zw4YApPYmraHTgpohwKkOe?=
 =?us-ascii?Q?ZzUS2fonBqjp4yp4gJWS03hCfUa+340l1sgSrigY841pPLBF3c9cNwPb67SF?=
 =?us-ascii?Q?QCXnqBAZajZNIjjNAi0yjPwm5x81H1xe6Kxs4wgf6IWE6m663HRsHcFdnS4h?=
 =?us-ascii?Q?ZjvJHjWciVZzEjsI9VYRtFmMKH3hMOrwRDKSfWRsoKlm5I//vqATTITEcDZe?=
 =?us-ascii?Q?bco1KonaM50ONF/cR5+UzVMVnHG2C+hLmaM72qRhqSdXEpLqWYAZR0hBjjxA?=
 =?us-ascii?Q?pzjfFgOQQpEFBMZ4Ryj4t1LW6SFYDBFczZxxbykZagRKM1hYJ/jSI5i8EsSW?=
 =?us-ascii?Q?dry3+Dds0Tgb+TN2dX7IS4KJ9XzN/87ewvrw1p3pfz9reKf9tU58snzw6+Vw?=
 =?us-ascii?Q?46EIEKs1DRN5mpAKhh4tV6BJ/drkkzP33s/4Y6a0l1UrTcsuXsXZmIGjoN5+?=
 =?us-ascii?Q?rpQqryoNFIVVZsIY3jIl2X6FBMegJy2rAK5Cm0rJQToaU5MLBWxYq7j1eOJ9?=
 =?us-ascii?Q?oXTgGV27nm6luYyHbUMHkpwThPESnveUZAjZNUWqduqSiqVT6lD+z/EnvJ2H?=
 =?us-ascii?Q?HnAJxo8k4cirLPjcGuEJw/n0x4qjCn1vSGkfNKsKJ9cFaDmooPOXBkrV/e/5?=
 =?us-ascii?Q?kV4A+NQtAHn2CtWMKXfUz44ySnbxcTI66IpjnnOVaAv/QMleazJc7QOWi3IT?=
 =?us-ascii?Q?i9bGd+Czl/uoUG0sgmbHvYfWNmuQeeagRCvfIFU1oy8Sb24TdnTMOdx50iFs?=
 =?us-ascii?Q?MdXF3vjgMMZNsAGlUMuxbUTAbZTg7zuPtq6f1fmyVxjNIbh3AbK0p87xE+HO?=
 =?us-ascii?Q?I+SQ+2bz43+clrHkyb1AnJHVAqjmuXwHHUZ7qVuplxPwj+4bo+c6aBd63qM7?=
 =?us-ascii?Q?NqqIqveUqJyVG3GvEK7hlqw1zBCyksxRbWUtxIGrYiKyKbYJvILkX02JBm1/?=
 =?us-ascii?Q?K70mCElvcOUrtevt+IKVb/1nj5l73X4xEIrdg96EnFH5te16yteZheWLcZsN?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa97e6eb-62d8-4123-b225-08db9e327beb
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 08:26:26.9200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilPHG+wbEatQx3s2aP4C/XBrJs7jSTJWBPRfpJHsWQeSBhD3LO0AjGhc3hm6kUArQAMfmvQKnM50eufkR6f85g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2491
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: Ix5Xx_qRhqjX_PY_TYAgnij4UFJ2_izs
X-Proofpoint-GUID: Ix5Xx_qRhqjX_PY_TYAgnij4UFJ2_izs
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org, afd@ti.com,
 Matt Coster <matt.coster@imgtec.com>, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, hns@goldelico.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Firmware trace is exposed at /sys/debug/dri/<dev_nr>/pvr_fw/trace_0.
Trace is enabled via the group mask at
/sys/debug/dri/<dev_nr>/pvr_params/fw_trace_mask.

Changes since v3:
- Use drm_dev_{enter,exit}

Co-developed-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile       |   4 +
 drivers/gpu/drm/imagination/pvr_debugfs.c  |  53 +++
 drivers/gpu/drm/imagination/pvr_debugfs.h  |  29 ++
 drivers/gpu/drm/imagination/pvr_device.c   |   9 +
 drivers/gpu/drm/imagination/pvr_device.h   |  10 +
 drivers/gpu/drm/imagination/pvr_drv.c      |   4 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 394 +++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_params.c   | 147 ++++++++
 drivers/gpu/drm/imagination/pvr_params.h   |  72 ++++
 9 files changed, 722 insertions(+)
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 313af5312d7b..1db003cf39ee 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -20,6 +20,7 @@ powervr-y := \
 	pvr_hwrt.o \
 	pvr_job.o \
 	pvr_mmu.o \
+	pvr_params.o \
 	pvr_power.o \
 	pvr_queue.o \
 	pvr_stream.o \
@@ -28,4 +29,7 @@ powervr-y := \
 	pvr_vm.o \
 	pvr_vm_mips.o
 
+powervr-$(CONFIG_DEBUG_FS) += \
+	pvr_debugfs.o
+
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_debugfs.c b/drivers/gpu/drm/imagination/pvr_debugfs.c
new file mode 100644
index 000000000000..fa0d7c89773c
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_debugfs.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
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
index 000000000000..7b7ff384053e
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_debugfs.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
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
index 9ae758a88644..a01544f64d8e 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -5,6 +5,7 @@
 #include "pvr_device_info.h"
 
 #include "pvr_fw.h"
+#include "pvr_params.h"
 #include "pvr_power.h"
 #include "pvr_queue.h"
 #include "pvr_rogue_cr_defs.h"
@@ -488,6 +489,14 @@ pvr_device_init(struct pvr_device *pvr_dev)
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
index fc6124ae4b26..fcaaeef8519d 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -7,6 +7,7 @@
 #include "pvr_ccb.h"
 #include "pvr_device_info.h"
 #include "pvr_fw.h"
+#include "pvr_params.h"
 #include "pvr_rogue_fwif_stream.h"
 #include "pvr_stream.h"
 
@@ -148,6 +149,15 @@ struct pvr_device {
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
index 757263eee34e..004395f2a9e8 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2023 Imagination Technologies Ltd. */
 
 #include "pvr_context.h"
+#include "pvr_debugfs.h"
 #include "pvr_device.h"
 #include "pvr_drv.h"
 #include "pvr_free_list.h"
@@ -1391,6 +1392,9 @@ static struct drm_driver pvr_drm_driver = {
 	.ioctls = pvr_drm_driver_ioctls,
 	.num_ioctls = ARRAY_SIZE(pvr_drm_driver_ioctls),
 	.fops = &pvr_drm_driver_fops,
+#if defined(CONFIG_DEBUG_FS)
+	.debugfs_init = pvr_debugfs_init,
+#endif
 
 	.name = PVR_DRIVER_NAME,
 	.desc = PVR_DRIVER_DESC,
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index 11f10946aeb1..3f184d0f6e05 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -7,6 +7,7 @@
 #include "pvr_rogue_fwif_sf.h"
 #include "pvr_fw_trace.h"
 
+#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 
 #include <linux/build_bug.h>
@@ -119,3 +120,396 @@ void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
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
+ *  * 0 on success,
+ *  * Any error returned by pvr_kccb_send_cmd(), or
+ *  * -%EIO if the device is lost.
+ */
+static int
+update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
+{
+	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
+	struct rogue_fwif_kccb_cmd cmd;
+	int idx;
+	int err;
+
+	if (group_mask)
+		fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_TRACE | group_mask;
+	else
+		fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_NONE;
+
+	fw_trace->group_mask = group_mask;
+
+	down_read(&pvr_dev->reset_sem);
+	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx)) {
+		err = -EIO;
+		goto err_up_read;
+	}
+
+	cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_LOGTYPE_UPDATE;
+	cmd.kccb_flags = 0;
+
+	err = pvr_kccb_send_cmd(pvr_dev, &cmd, NULL);
+
+	drm_dev_exit(idx);
+
+err_up_read:
+	up_read(&pvr_dev->reset_sem);
+
+	return err;
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
+		return err;
+
+	err = update_logtype(pvr_dev, new_group_mask);
+	if (err)
+		return err;
+
+	pvr_dev->fw_dev.fw_trace.group_mask = new_group_mask;
+
+	return (ssize_t)len;
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
+
+	if (trace_seq_data->idx >= ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS)
+		return -EINVAL;
+
+	id = read_fw_trace(trace_seq_data, 0);
+	/* Index is not pointing at a valid entry. */
+	if (!ROGUE_FW_LOG_VALIDID(id))
+		return -EINVAL;
+
+	sf_id = find_sfid(id);
+	/* Index is not pointing at a valid entry. */
+	if (sf_id == ROGUE_FW_SF_LAST)
+		return -EINVAL;
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
index 000000000000..6e2a3750e70e
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_params.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
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
index 000000000000..9988c941f83f
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_params.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
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
2.41.0

