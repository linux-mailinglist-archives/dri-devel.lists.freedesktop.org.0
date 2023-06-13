Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25D072E6E7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E6410E389;
	Tue, 13 Jun 2023 15:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1916 seconds by postgrey-1.36 at gabe;
 Tue, 13 Jun 2023 15:20:26 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE9910E389
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 15:20:25 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35DBeOa6026252; Tue, 13 Jun 2023 15:48:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=FV7Xvet8ZjCfAFmsndkJOn/SIKEsYEaTAzW8YyR2UXA=; b=ihk
 /3IEm1ClSb1DZy8IsJOuWsccuRF5o2HI4XKiDAzohSceLlxVvLXup2UkfK5Pbmvi
 guYi4Z4fjbwAOJ1K5P1CzHeGHdtIDk9WYfgl1lxsBMh6nsQFNaLELexTyJNaua8R
 SPICy6SMjMNn0wBVShCydh6INyUjoHHunENta7Vh18P3LG4KGw79m0Q/Gjjrztto
 I/CLD5gMmo2+x2r/d9mElGb8m0hCUgGia6/Uatd2bskV3U9O1KjsQ/EhAWERBeVT
 pF7ArzV/gz3PQcIswHdttWHjxR8fRkTYCB4ZPYfYz3lRPUsxZwFEQCXNzZ6F2g8o
 Q7eJZy8CG06jIqSOLfQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3r4ferjc3f-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Jun 2023 15:48:17 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 15:48:16 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.57) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Tue, 13 Jun 2023 15:48:16 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deU/r3/fQHTYPIrRs2wFRcf45oJPkp1nwAp+EaFi8jJphfcWqm9oWmX4n1TpWb8A1no7LRTu+HsMv2emiOhtTC+8zmdeytOQFPALafWxl0FyQO5tcFne2KpVudPsZj6WPx8byetRiTc4KgQyi4UlDotkC8BAxjhJBX6qZz6XQzVF0pKjSUVU5MC1YcNndIxTDj0K3zZBMcqwQwXVYPBUo+notS4Y6SVFlnnDvdrvDBYvVIZc82JNtLsiIlxqgqoplO2X+0yBcNCUEMuztOAC9QGgZaJMBy5LRPK+CMDo4KfCyaEIDKym0nZaU7IcoG5BhwKs3tovJ/mPY984XZ2Hxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FV7Xvet8ZjCfAFmsndkJOn/SIKEsYEaTAzW8YyR2UXA=;
 b=FrQ2/DKhnxKSZAPlwXP9S9m0ByXjfOQtaxOkcw/40z0TEjIukTSQAd6Z737oIT2yPZGB/N5/IGvCsyBUA+LI3wGvgJ6vo89vv7MwasNvz4S9JvbMxgkrdQegKETblYyT4/+HEiOYUscw21QG3NbmYiTxS6HyFKBNvEZwwoMxW7a2rvH65HgDF0zsxNEtTSO1u9pUtmKZ4jjJTZ/VYciLVDTFc4gIcvCfcj3/op94fTDe4fZr8pb4Km6LWHxLUQwM+LfA0tTFwXQPHgzx9VmoKnbAt7FQTkeXJa0JjnkKAIU/4q4xYYZI7kZW4BQ+kmetlGO8uur6y3nmeNfxSnmAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FV7Xvet8ZjCfAFmsndkJOn/SIKEsYEaTAzW8YyR2UXA=;
 b=I0l831TVMel4PicViBaRM3hmnGpBIn0EwB0ZghB1jDQQgDlIA1qz79Kqz7mzGPOPAQ5hVmNvFwDMepYYQDQ51DTqTjQQYwvKdlw+5CjVdQrdf21Jqe/Q0OdRniBGhTwlzVP4Fb0HH3NunJg0xmTHG6b3p0qCSZwWnqg0wUtWbIc=
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:155::11)
 by LO3P265MB2282.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 14:48:14 +0000
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f]) by CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f%5]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 14:48:14 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 05/17] drm/imagination: Get GPU resources
Date: Tue, 13 Jun 2023 15:47:48 +0100
Message-Id: <20230613144800.52657-6-sarah.walker@imgtec.com>
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
X-MS-TrafficTypeDiagnostic: CWXP265MB4826:EE_|LO3P265MB2282:EE_
X-MS-Office365-Filtering-Correlation-Id: 2671fe11-fb97-4f3e-b7ee-08db6c1d376f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDIxju4fwbuFXPd4ScDSB8FzBho6JEuGbFCeg4EIyiJezkvaSZVNJuwlZ/iysaEnp5u3n2GGIRLY/R4dWZ3gDPEF3X1ZO70d8YndanGple1EBToGN972vWSIp3TBO3htuSaK6h2RI2K/ZPnXWr8Xm1YWmbGxvHHXdjmb3BrukGdFVJbKRAycK3K/el/X6u6VfcwVfa8m7FNpBTBEimAFbISdKDsWLrSo8AP7PU97Ci70NfNWXs/IDcLZGdwWh9yGWXYWylEzranM4fwEWbGYIh5/km+1REF31pirTQG9DpWz8xoIEuOgDBIPJuj5zE0NhNT3qALfo9QwjXvkgYlxszIZi715SthNB9zc85jSpa369IRk7TGXrddlYv2Bkmx5ZtmzsMYkKpU0lWX10iq4z3GEiiCvQ0D/KOKzIqfDx4lI+Dti5hGWA/sVlzuBZitRyhb/tzq579Oz4mdTfu3yUiP11bkHzkVddVX/fqfYKafAogt1k6b0rOVMzMJ6d0LnG7SZpdFZTFP7bQUycsogNBKKZ17u9lYYA8eFG76vjDHSALHJ461iiXRg22DduN2pGfk+2PyeFu4YFPGlBWWKP13VMLNeZ5ugolwWKFUkbNk/1mC9RAosZxfVMwB0YXoAmxU5ZNAXd9KFniDHIgQ8cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39840400004)(451199021)(44832011)(4326008)(8936002)(316002)(7416002)(66946007)(6916009)(66476007)(41300700001)(186003)(2906002)(30864003)(66556008)(478600001)(8676002)(5660300002)(6666004)(52116002)(6486002)(6512007)(1076003)(6506007)(26005)(83380400001)(36756003)(86362001)(2616005)(38350700002)(38100700002)(134885004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8M1bUyxH5UGhsmDu7ByNCYIC5auB7xpv+UqNT1FtK+J+of2o2dKFglidK6AG?=
 =?us-ascii?Q?w23GPjUB4SgG9pAJGun7u3BImlx1axFd9dcyB2q0Kzx5sfvYkV9BGTX1O/TP?=
 =?us-ascii?Q?uY9XSA4dNsVHu3n9DN19qRn/Xr9n+W86uuYUvWinPd4MBUC2Iyj1FDLY4ZUp?=
 =?us-ascii?Q?ilaZIM/lSJREDLbwZ/86wOWL8VEk8W09Rawl4TM/oZQxIl1c6hdxQN0w8LQs?=
 =?us-ascii?Q?yc6LTzylpap28v/va/+Y8RVevAvhYMaCNCQIBkj9v4TzWr/Xi+j5kVya4wUr?=
 =?us-ascii?Q?wL4LpkscYMcNjiBjl28awp2+rj3BpDG+qgEquSQ5i2lbp30BGUMGo51XR9Lu?=
 =?us-ascii?Q?CsoH+W3r1Ufr6yzwldl8hlkGJuM1KlW0f4PJbwdm99VYTYci6OiipYU2jAYz?=
 =?us-ascii?Q?zYA9SuJC3cTVWA9L7+6woSJA8sj9gHcGbq69qp8eXqqgzK5pncyPeJH7YjRo?=
 =?us-ascii?Q?WluVrU0u67GlpAi0mIIegWX7FwXcxNsC5syYSd84vsL99RuTVmJEoup12OyW?=
 =?us-ascii?Q?I+4jT2UclZoOi6IhI+w6gfK+lT+sLoAJu8QKyuG8C51LCIZMYy309CxaY+qs?=
 =?us-ascii?Q?8xsgZqt8hFRP73AOCRR3IDPyX7/6gcGvEff+bXrWwebm7Zbrt6tTp/bdgUyB?=
 =?us-ascii?Q?JezJw9kcRQGUkpG1GJVX0mUGef1lcGjbw/0NLsbMzlN3uktqTlYrAbm4jRho?=
 =?us-ascii?Q?PVPrm6T04Orln6gCiOLZ5OUAKAYzozXsLMZ1np8oklBBZ38gDhZKQc32Qqcn?=
 =?us-ascii?Q?RlNl2ggajzm7oW2X/5cgxy0DHph3reqF1MJlTzhm6pg5e0wmvSC71QwSyhK1?=
 =?us-ascii?Q?58bLYPj/hYqmNxo4E/XBKbpkLxNq18d5+oCvHNMhfsaGKKc5j08+E4LM555M?=
 =?us-ascii?Q?/A/mNTctUdOXc0uaYsbJcagJorsIrqXikYmVz5U+Y7gmWn/Q4YKQlM24Z8eL?=
 =?us-ascii?Q?Hez2OszsVlpC7It2g9jF48EjPghUJqT/brgoji83dU+cUAkgCM/e+q1J0Vuq?=
 =?us-ascii?Q?v1eAXvGIjrwo8snbEQ0qcAo3/eryrqnhr2SImOAO4Rm7nYswUs2g5XxfSdcI?=
 =?us-ascii?Q?+Ekmistdgf9+BG9JZ4s32hZAh+BbPhauDfF9ZQNXNbSnO1sxg43Yy13tagMt?=
 =?us-ascii?Q?emHqI9KH7ciDoSE03vvlXamnLHDa59QywtNUMg5wYutWTr+SukHvb1sjcXh7?=
 =?us-ascii?Q?y8TUDPsm/Z4o5iwmNB7sCU+9hKinvJDQ0eo9gTonRZcBSUuHX7+2yx4MJa+K?=
 =?us-ascii?Q?c+8iQSsw4OwqICcYfHzvuzuPKK7o55MrchJHNVJIsJTpq/UgBZXeCgl8HU4B?=
 =?us-ascii?Q?RL76L0E8h3bbojUhgibbXyoCDxhlTparuz2CQ4Zt5ofIMPXcuUREv13suM47?=
 =?us-ascii?Q?Cd9RHxstHq3JLh3J1UpjiY/xmd97T0PipPkEBcoK8RPTkcnnmGEa8c+kJOGf?=
 =?us-ascii?Q?F9j4/TvKMNMRFsi0vaGubdl1z/DNH1rkTZq/j9sPwaS+LBhjJPPhoPcKIFZu?=
 =?us-ascii?Q?WLMHuUwUxdsQejfnNFm+b+nrbfaC0vCJyY1jSV/9vk51/cg2YoM2Jv3lf6gu?=
 =?us-ascii?Q?g5Lg/fKqj+5POVBZ+UIbK2yD90R0YfyeDg9S38EvzgFK/VBFUmEwHErKakz6?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2671fe11-fb97-4f3e-b7ee-08db6c1d376f
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:48:14.4146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: midogzAYuS9xfWl407xYMalXedCMpEf5FoYrHpv1auYHhqMefNAuDX/yGw+bG7IcB+lFQSI/3whoX3smdDQa8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2282
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: IxIQiGg5NyRRdM7yfSah0B5YKOEbEGru
X-Proofpoint-GUID: IxIQiGg5NyRRdM7yfSah0B5YKOEbEGru
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

Acquire clock, regulator and register resources, and enable/map as
appropriate.

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile     |   1 +
 drivers/gpu/drm/imagination/pvr_device.c | 271 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h | 214 ++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_drv.c    |  11 +-
 4 files changed, 496 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.c

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 62ccf0ccbd51..186f920d615b 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -4,6 +4,7 @@
 subdir-ccflags-y := -I$(srctree)/$(src)
 
 powervr-y := \
+	pvr_device.o \
 	pvr_drv.o \
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
new file mode 100644
index 000000000000..790c36cebec1
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+
+#include <drm/drm_print.h>
+
+#include <linux/clk.h>
+#include <linux/compiler_attributes.h>
+#include <linux/compiler_types.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/gfp.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/stddef.h>
+#include <linux/types.h>
+
+/**
+ * pvr_device_reg_init() - Initialize kernel access to a PowerVR device's
+ * control registers.
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Sets struct pvr_device->regs.
+ *
+ * This method of mapping the device control registers into memory ensures that
+ * they are unmapped when the driver is detached (i.e. no explicit cleanup is
+ * required).
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by devm_platform_ioremap_resource().
+ */
+static int
+pvr_device_reg_init(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct platform_device *plat_dev = to_platform_device(drm_dev->dev);
+	struct resource *regs_resource;
+	void __iomem *regs;
+	int err;
+
+	pvr_dev->regs_resource = NULL;
+	pvr_dev->regs = NULL;
+
+	regs = devm_platform_get_and_ioremap_resource(plat_dev, 0, &regs_resource);
+	if (IS_ERR(regs)) {
+		err = PTR_ERR(regs);
+		drm_err(drm_dev, "failed to ioremap gpu registers (err=%d)\n",
+			err);
+		return err;
+	}
+
+	pvr_dev->regs = regs;
+	pvr_dev->regs_resource = regs_resource;
+
+	return 0;
+}
+
+/**
+ * pvr_device_reg_fini() - Deinitialize kernel access to a PowerVR device's
+ * control registers.
+ * @pvr_dev: Target PowerVR device.
+ *
+ * This is essentially a no-op, since pvr_device_reg_init() already ensures that
+ * struct pvr_device->regs is unmapped when the device is detached. This
+ * function just sets struct pvr_device->regs to %NULL.
+ */
+static __always_inline void
+pvr_device_reg_fini(struct pvr_device *pvr_dev)
+{
+	pvr_dev->regs = NULL;
+}
+
+/**
+ * pvr_device_clk_init() - Initialize clocks required by a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Sets struct pvr_device->core_clk, struct pvr_device->sys_clk and
+ * struct pvr_device->mem_clk.
+ *
+ * Three clocks are required by the PowerVR device: core, sys and mem. On
+ * return, this function guarantees that the clocks are in one of the following
+ * states:
+ *
+ *  * All successfully initialized,
+ *  * Core errored, sys and mem uninitialized,
+ *  * Core deinitialized, sys errored, mem uninitialized, or
+ *  * Core and sys deinitialized, mem errored.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error returned by devm_clk_get(), or
+ *  * Any error returned by clk_prepare_enable().
+ */
+static int pvr_device_clk_init(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct clk *core_clk;
+	struct clk *sys_clk;
+	struct clk *mem_clk;
+	int err;
+
+	pvr_dev->core_clk = NULL;
+	pvr_dev->sys_clk = NULL;
+	pvr_dev->mem_clk = NULL;
+
+	core_clk = devm_clk_get(drm_dev->dev, "core");
+	if (IS_ERR(core_clk)) {
+		err = PTR_ERR(core_clk);
+		drm_err(drm_dev, "failed to get core clock (err=%d)\n", err);
+		goto err_out;
+	}
+
+	sys_clk = devm_clk_get(drm_dev->dev, "sys");
+	if (IS_ERR(sys_clk))
+		sys_clk = NULL;
+
+	mem_clk = devm_clk_get(drm_dev->dev, "mem");
+	if (IS_ERR(mem_clk))
+		mem_clk = NULL;
+
+	err = clk_prepare(core_clk);
+	if (err)
+		goto err_out;
+
+	if (sys_clk) {
+		err = clk_prepare(sys_clk);
+		if (err)
+			goto err_deinit_core_clk;
+	}
+
+	if (mem_clk) {
+		err = clk_prepare(mem_clk);
+		if (err)
+			goto err_deinit_sys_clk;
+	}
+
+	pvr_dev->core_clk = core_clk;
+	pvr_dev->sys_clk = sys_clk;
+	pvr_dev->mem_clk = mem_clk;
+
+	return 0;
+
+err_deinit_sys_clk:
+	if (sys_clk)
+		clk_disable_unprepare(sys_clk);
+err_deinit_core_clk:
+	clk_disable_unprepare(core_clk);
+err_out:
+	return err;
+}
+
+/**
+ * pvr_device_clk_fini() - Deinitialize clocks required by a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ */
+static void
+pvr_device_clk_fini(struct pvr_device *pvr_dev)
+{
+	if (pvr_dev->mem_clk)
+		clk_unprepare(pvr_dev->mem_clk);
+	if (pvr_dev->sys_clk)
+		clk_unprepare(pvr_dev->sys_clk);
+	clk_unprepare(pvr_dev->core_clk);
+
+	pvr_dev->core_clk = NULL;
+	pvr_dev->sys_clk = NULL;
+	pvr_dev->mem_clk = NULL;
+}
+
+/**
+ * pvr_device_regulator_init() - Initialise regulator required by a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * The regulator is not a required devicetree property. If it is not present then this function will
+ * succeed, but &pvr_device->regulator will be %NULL.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by devm_regulator_get().
+ */
+static int
+pvr_device_regulator_init(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct regulator *regulator;
+	int err;
+
+	regulator = devm_regulator_get(drm_dev->dev, "power");
+	if (IS_ERR(regulator)) {
+		err = PTR_ERR(regulator);
+		/* Regulator is not required, so ENODEV is allowed here. */
+		if (err != -ENODEV)
+			goto err_out;
+		regulator = NULL;
+	}
+
+	pvr_dev->regulator = regulator;
+
+	return 0;
+
+err_out:
+	return err;
+}
+
+/**
+ * pvr_device_init() - Initialize a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * If this function returns successfully, the device will have been fully
+ * initialized. Otherwise, any parts of the device initialized before an error
+ * occurs will be de-initialized before returning.
+ *
+ * NOTE: The initialization steps currently taken are the bare minimum required
+ *       to read from the control registers. The device is unlikely to function
+ *       until further initialization steps are added. [This note should be
+ *       removed when that happens.]
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error returned by pvr_device_reg_init(),
+ *  * Any error returned by pvr_device_clk_init(), or
+ *  * Any error returned by pvr_device_gpu_init().
+ */
+int
+pvr_device_init(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	/* Enable and initialize clocks required for the device to operate. */
+	err = pvr_device_clk_init(pvr_dev);
+	if (err)
+		goto err_out;
+
+	err = pvr_device_regulator_init(pvr_dev);
+	if (err)
+		goto err_device_clk_fini;
+
+	/* Map the control registers into memory. */
+	err = pvr_device_reg_init(pvr_dev);
+	if (err)
+		goto err_device_reg_fini;
+
+	return 0;
+
+err_device_reg_fini:
+	pvr_device_reg_fini(pvr_dev);
+
+err_device_clk_fini:
+	pvr_device_clk_fini(pvr_dev);
+
+err_out:
+	return err;
+}
+
+/**
+ * pvr_device_fini() - Deinitialize a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ */
+void
+pvr_device_fini(struct pvr_device *pvr_dev)
+{
+	/*
+	 * Deinitialization stages are performed in reverse order compared to
+	 * the initialization stages in pvr_device_init().
+	 */
+	pvr_device_reg_fini(pvr_dev);
+	pvr_device_clk_fini(pvr_dev);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 3d2865d726b8..c0dd0562844c 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -11,9 +11,25 @@
 #include <linux/bits.h>
 #include <linux/compiler_attributes.h>
 #include <linux/compiler_types.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/math.h>
+#include <linux/mutex.h>
+#include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/wait.h>
+#include <linux/workqueue.h>
+#include <linux/xarray.h>
+
+/* Forward declaration from <linux/clk.h>. */
+struct clk;
+
+/* Forward declaration from <linux/firmware.h>. */
+struct firmware;
+
+/* Forward declaration from <linux/regulator/consumer.h>. */
+struct regulator;
 
 /**
  * struct pvr_device - powervr-specific wrapper for &struct drm_device
@@ -26,6 +42,29 @@ struct pvr_device {
 	 * from_pvr_device().
 	 */
 	struct drm_device base;
+
+	/** @regs_resource: Resource representing device control registers. */
+	struct resource *regs_resource;
+
+	/**
+	 * @regs: Device control registers.
+	 *
+	 * These are mapped into memory when the device is initialized; that
+	 * location is where this pointer points.
+	 */
+	void __iomem *regs;
+
+	/** @core_clk: General core clock. */
+	struct clk *core_clk;
+
+	/** @sys_clk: System bus clock. */
+	struct clk *sys_clk;
+
+	/** @mem_clk: Memory clock. */
+	struct clk *mem_clk;
+
+	/** @regulator: Power regulator. */
+	struct regulator *regulator;
 };
 
 /**
@@ -72,6 +111,181 @@ to_pvr_file(struct drm_file *file)
 	return file->driver_priv;
 }
 
+int pvr_device_init(struct pvr_device *pvr_dev);
+void pvr_device_fini(struct pvr_device *pvr_dev);
+
+int
+pvr_device_clk_core_get_freq(struct pvr_device *pvr_dev, u32 *freq_out);
+
+/**
+ * PVR_CR_READ32() - Read a 32-bit register from a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ *
+ * This macro is a wrapper around pvr_cr_read32(). It applies ROGUE_CR_ prefix
+ * to the provided @reg name, making it behave comparably to the
+ * PVR_CR_FIELD_GET() macro.
+ *
+ * Return: The value of the requested register.
+ */
+#define PVR_CR_READ32(pvr_dev, reg) pvr_cr_read32(pvr_dev, ROGUE_CR_##reg)
+
+/**
+ * PVR_CR_READ64() - Read a 64-bit register from a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ *
+ * This macro is a wrapper around pvr_cr_read64(). It applies ROGUE_CR_ prefix
+ * to the provided @reg name, making it behave comparably to the
+ * PVR_CR_FIELD_GET() macro.
+ *
+ * Return: The value of the requested register.
+ */
+#define PVR_CR_READ64(pvr_dev, reg) pvr_cr_read64(pvr_dev, ROGUE_CR_##reg)
+
+/**
+ * PVR_CR_WRITE32() - Write to a 32-bit register in a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ * @val: Value to write.
+ *
+ * This macro is a wrapper around pvr_cr_write32(). It applies ROGUE_CR_
+ * prefix to the provided @reg name, making it behave comparably to the
+ * PVR_CR_FIELD_GET() macro.
+ */
+#define PVR_CR_WRITE32(pvr_dev, reg, val) \
+	pvr_cr_write32(pvr_dev, ROGUE_CR_##reg, val)
+
+/**
+ * PVR_CR_WRITE64() - Write to a 64-bit register in a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ * @val: Value to write.
+ *
+ * This macro is a wrapper around pvr_cr_write64(). It applies ROGUE_CR_
+ * prefix to the provided @reg name, making it behave comparably to the
+ * PVR_CR_FIELD_GET() macro.
+ */
+#define PVR_CR_WRITE64(pvr_dev, reg, val) \
+	pvr_cr_write64(pvr_dev, ROGUE_CR_##reg, val)
+
+/**
+ * PVR_CR_FIELD_GET() - Extract a single field from a PowerVR control register
+ * @val: Value of the target register.
+ * @field: Field specifier, as defined in "pvr_rogue_cr_defs.h".
+ *
+ * Return: The extracted field.
+ */
+#define PVR_CR_FIELD_GET(val, field) FIELD_GET(~ROGUE_CR_##field##_CLRMSK, val)
+
+/**
+ * pvr_cr_read32() - Read a 32-bit register from a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ *
+ * The wrapper macro PVR_CR_READ32() may be used instead to simplify the
+ * selection of @reg.
+ *
+ * Return: The value of the requested register.
+ */
+static __always_inline u32
+pvr_cr_read32(struct pvr_device *pvr_dev, u32 reg)
+{
+	return ioread32(pvr_dev->regs + reg);
+}
+
+/**
+ * pvr_cr_read64() - Read a 64-bit register from a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ *
+ * The wrapper macro PVR_CR_READ64() may be used instead to simplify the
+ * selection of @reg.
+ *
+ * Return: The value of the requested register.
+ */
+static __always_inline u64
+pvr_cr_read64(struct pvr_device *pvr_dev, u32 reg)
+{
+	return ioread64(pvr_dev->regs + reg);
+}
+
+/**
+ * pvr_cr_write32() - Write to a 32-bit register in a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ * @val: Value to write.
+ *
+ * The wrapper macro PVR_CR_WRITE32() may be used instead to simplify the
+ * selection of @reg.
+ */
+static __always_inline void
+pvr_cr_write32(struct pvr_device *pvr_dev, u32 reg, u32 val)
+{
+	iowrite32(val, pvr_dev->regs + reg);
+}
+
+/**
+ * pvr_cr_write64() - Write to a 64-bit register in a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ * @val: Value to write.
+ *
+ * The wrapper macro PVR_CR_WRITE64() may be used instead to simplify the
+ * selection of @reg.
+ */
+static __always_inline void
+pvr_cr_write64(struct pvr_device *pvr_dev, u32 reg, u64 val)
+{
+	iowrite64(val, pvr_dev->regs + reg);
+}
+
+/**
+ * pvr_cr_poll_reg32() - Wait for a 32-bit register to match a given value by
+ *                       polling
+ * @pvr_dev: Target PowerVR device.
+ * @reg_addr: Address of register.
+ * @reg_value: Expected register value (after masking).
+ * @reg_mask: Mask of bits valid for comparison with @reg_value.
+ * @timeout_usec: Timeout length, in us.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%ETIMEDOUT on timeout.
+ */
+static __always_inline int
+pvr_cr_poll_reg32(struct pvr_device *pvr_dev, u32 reg_addr, u32 reg_value,
+		  u32 reg_mask, u64 timeout_usec)
+{
+	u32 value;
+
+	return readl_poll_timeout(pvr_dev->regs + reg_addr, value,
+		(value & reg_mask) == reg_value, 0, timeout_usec);
+}
+
+/**
+ * pvr_cr_poll_reg64() - Wait for a 64-bit register to match a given value by
+ *                       polling
+ * @pvr_dev: Target PowerVR device.
+ * @reg_addr: Address of register.
+ * @reg_value: Expected register value (after masking).
+ * @reg_mask: Mask of bits valid for comparison with @reg_value.
+ * @timeout_usec: Timeout length, in us.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%ETIMEDOUT on timeout.
+ */
+static __always_inline int
+pvr_cr_poll_reg64(struct pvr_device *pvr_dev, u32 reg_addr, u64 reg_value,
+		  u64 reg_mask, u64 timeout_usec)
+{
+	u64 value;
+
+	return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
+		(value & reg_mask) == reg_value, 0, timeout_usec);
+}
+
 /**
  * DOC: IOCTL validation helpers
  *
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index e203a2370f55..48a870715426 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -485,12 +485,19 @@ pvr_probe(struct platform_device *plat_dev)
 
 	platform_set_drvdata(plat_dev, drm_dev);
 
-	err = drm_dev_register(drm_dev, 0);
+	err = pvr_device_init(pvr_dev);
 	if (err)
 		goto err_out;
 
+	err = drm_dev_register(drm_dev, 0);
+	if (err)
+		goto err_device_fini;
+
 	return 0;
 
+err_device_fini:
+	pvr_device_fini(pvr_dev);
+
 err_out:
 	return err;
 }
@@ -499,8 +506,10 @@ static int
 pvr_remove(struct platform_device *plat_dev)
 {
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
 	drm_dev_unregister(drm_dev);
+	pvr_device_fini(pvr_dev);
 
 	return 0;
 }
-- 
2.40.1

