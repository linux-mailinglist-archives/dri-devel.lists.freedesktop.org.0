Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0740C793908
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6209210E5C7;
	Wed,  6 Sep 2023 09:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B5C10E5C3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:56:25 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3869dYcL017704; Wed, 6 Sep 2023 10:56:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=IrMG9VqREhgYbg2+mmV6aFgpFgwVguMbYmRuhluut9g=; b=n8p
 144+f1IB47dEvPIVT+iBu+GgIPtEzW8PvionUdNmYcJSqzXVpyPNRfwZJyn2MTox
 o0i4xMsGdogySN67e32gvAuFTqzEdHaeUCJAct5TwWzH9aoUhQ4gQ+GgP41BGrBp
 XWUNW/sjQYXdblxjXbiRZ9Vh57RytfcOi+KKm5yNACOu/dHaV9N+Iuk+KlB0arog
 qkGIlzdOeX9T4GIQec3n9/CcStLDYt+VHmav+/36upvwFy+KpvmHe51RUSbrd6aS
 cxk2OJ/3ttSBIaO5CaCL9AsBMffFoK/L0VCW0pCHbNX9HUHKZdx+JjoJCUsdqEE9
 DIP+9m7HDxhy8eMHDYA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3suuanu2rx-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Sep 2023 10:56:10 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 10:56:09 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.53) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31 via Frontend
 Transport; Wed, 6 Sep 2023 10:56:09 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXPnn2AjueU7CyMhQzobxl8CGPpmQtGjHKy+oElzRtiYjclpm6LflnLyVJJbZMeVesfBQOPpT50gBaylH5ajiqidfsufqrM41zG9AYx8ksocpxTAALMRebdcX94NZZfj9n+PVWldbHJsUsJNWg5K6+v0VWuUXJYq0ld7ozKDvAAKJxeChdz8QczbZYQUUxEELn/b4G3zhmGfPusFdy/+XYtQRJwHeZq0oggU2k97iK8m0szZJo0WFLrVanw6vVvuIump4iTBEVn+IBTb1G9+WmMtxZVHhtTi13YQkPET3eFocqwhmC57vI2Nee//EH3JDEufdVI2yOiCI8IRgh1Smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrMG9VqREhgYbg2+mmV6aFgpFgwVguMbYmRuhluut9g=;
 b=feQIiPMqdxNWE1GYf6RdEV39PRZGZer53dywRdejYhW2U7nfk/5LvHxiTPkDc77AwX5GioJueI6THDuWn/GsoxfMb6HtEa+ig+jfENRQNsp6bEu/3P8JFM62xWk8ebthqJA3wBKMmrvBHrcVOiNTlYlMOntAYfAllvWOqgWd5iaqG1f/ZnZOigP5w739D5UD/4ZDRgeD/GXj0+XeUr6SdwaAdKB48HAzvKFIQ5OP77jrq0J3FcdbQjhNhp3wnArIw1nGi77EGuyi4chTDcxWWNxbSslz2KjGLJSbOKobg60Ismx5l0GxzhzdUuLj+Q0x5JrOuDhurbcCeuvgRK3WFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrMG9VqREhgYbg2+mmV6aFgpFgwVguMbYmRuhluut9g=;
 b=ADkNO7ecy+8gbq0JfV+Uypk13yTl3U5bh3+7fyHWQ6OFczpfgYev0W/E5c2C3rVHF79Pkx1WyDhAssdP3hJB2NsQ2PqwDjBO/WXDFTpKQr5GUab1TCTXxmrNgW2mvFpxvhKOAaWYsu/5uuBIvzS+KlL7Iha0VEIcs6RoglGzo2M=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO2P265MB4992.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 09:56:07 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:56:07 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 06/20] drm/imagination: Get GPU resources
Date: Wed,  6 Sep 2023 10:55:28 +0100
Message-Id: <20230906095542.3280699-7-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230906095542.3280699-1-sarah.walker@imgtec.com>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO2P265MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 174389c0-d78b-4363-c011-08dbaebf7d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AjYErLAWX/WsECg0llAprsABmyGoKql1R5ggII68FjE+0nnUWVH9FQv9NPnvgZHrmM0175VSzuyXzBWcsiOtrshGs4k0FkTlIFyXXvwEm8B/O+0uSEbDVpL+wyKgm6x4ESYZJkmyBNUSXQJim/lDLj7aP1N7WKw8weMi0rftQvoh4vrv2nhClQ/foc+MautdVAfFglgmZZBqdgzUhjfsx+ftsfX35E+8c2GnM7FB6uYASRftHfJwUviV4/f0/lt1eTEsWq7TysxB27CDz93WfeUv0SZRVvBZFkMyQ2foexZqCUcFkGpOyplf4gsahpkSjBgQM0hLXmMvbzC/atvrNcGnNawn7g2FJQJE4faNTZumW40CuTea/VRMXdbitOcqMmUkzM60cq9qITDW5nIt0Qythi5YJ5IjydBfRwsLSb/I9FlsMZIuBVG39kakef7wZOmR6X9bGAfn+W6qtw+lc/gAfF80L7GtFt+QZhwk/i9acGGZQLI/9GTtFItogav9+DEYwyDSWwWpLlgllxNwjIBmYqPX7yrFdtf5F7u0YXIBLElW/aXnmEQe+OPmZIhBeGZ0zXgLrtar1/yUVOsZchcZyIiQ/d5DBeuFd47FCxQuAJJcT67c4j33zLDF3j9I7jsoKA1SV/tfIqJxx2O5QQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39850400004)(376002)(136003)(1800799009)(451199024)(186009)(8676002)(44832011)(8936002)(6506007)(5660300002)(6486002)(4326008)(6666004)(30864003)(7416002)(66476007)(316002)(66556008)(66946007)(6916009)(41300700001)(478600001)(52116002)(6512007)(2906002)(26005)(1076003)(2616005)(83380400001)(38100700002)(38350700002)(86362001)(36756003)(134885004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iy0lDtxtq6IMfVKHKCvnwMpJzWtSFZwD64b3wyMjwG1dmQ3rzrz5GgWjOQmu?=
 =?us-ascii?Q?3sfkOWyWlVTvRwF7V/L9Hn0OjXyFCY5xrBO4e3EUOJLZV4qIzVPGMloyt880?=
 =?us-ascii?Q?9a8DMG6JRIsn7AjmPLNNPmm1+Nsm9I3d90p1/uKSegvAC0wenwrRFaMAQebk?=
 =?us-ascii?Q?mRGaB2uwYeeMqXV4tyLhVvn+YiQF46sWCuX4gP1XH8u3UuLhA4zbNUn18rFP?=
 =?us-ascii?Q?JriASZUHFmRhBSdwkTyFAtB+7sYKeMssE08P/2NXnzFSsg8etLUOMRBXV7ZC?=
 =?us-ascii?Q?PXzeEYFRwEHd0GgEixQnmcTP62uvPwZoWznsDI76+ip/30mg4Ib3Qr8Zy7z6?=
 =?us-ascii?Q?vfkX/2tLAdJ1T+L7Fn80fTXPtmputBfGijvwYgupyWTT/ZcJqhBh9AdYwpmO?=
 =?us-ascii?Q?rnJFegXUw5dOIQ1KnK/TlYAfUrjF1l17+iLmFAryeClczfJqT26T/ATfZuNs?=
 =?us-ascii?Q?TEg9/1Iu1sSzAJVt2qea/s9WkWTccRRKoriZTli981Lr1S08ucOEpqTvxjkw?=
 =?us-ascii?Q?O1F0QUY4eJNp9rE7WURANDYKGbSGAwV59B5xkaptK46KwwhH1hF5u+SZW+yj?=
 =?us-ascii?Q?LESk90h6j/bw7U89HerG0vMYHtSG0ii9yb3uwG2NJ9QAJDD6gbt3HXuUPR87?=
 =?us-ascii?Q?H13oTpx8Owr5zyMEahItNUXdA9rjti91l+eKPA6RDDaARPC+FLDw56Vmlssv?=
 =?us-ascii?Q?k6D6W8DMAt+WUxUmPEAOlKwD699QkPFWOQ/MaYyseO2TF3Grb94SBlxPD7GF?=
 =?us-ascii?Q?L/q829JRZrvqgTeKKY/wsa5XOJQG4GEdrEqSq2CJyWPLrXrZPFLLG5vxWuNo?=
 =?us-ascii?Q?Vbzft7X/jnm8KbrOuIZ9ulkjzK94QoTjCKy61rx2B9AFJu1w02ttPP0STUGX?=
 =?us-ascii?Q?a1iirSq+KmiWst0TI8fLtqidGQBQosSeIxb/IJNV9cMlEsZp+DtcDH0Y6G4v?=
 =?us-ascii?Q?qLI6wWt/eZDsEdiqRbZn22+20DqY7/yrlzr/SLSdPQAGCw5qYImiJubD7Nkt?=
 =?us-ascii?Q?OjIw5otUQ9N48Q2Ymo6sIVnvxYlvZj8UtEh4PVsiYGAw+4BH/vFmP84pPkxg?=
 =?us-ascii?Q?lVitYak+0l9dH0AhxI3/gNFhnmZyfRTwrRLFVIFPhXiFbg5k0hxv74iXe+H8?=
 =?us-ascii?Q?cQVQyBNljCo9iiMd3XoCGYIu1ZvCKuYclqL89+oscRK4BWBjm4XXGETQZ3Pt?=
 =?us-ascii?Q?1lI5ypgY1IL27rS+BBS9JWARnPHnVH1ZznwImILvbt8WK8zf24baZ5vZtybo?=
 =?us-ascii?Q?zaw6+IMz3W6u11DZtMjyy/1Xikb1X/yyrhD8ktvAaehUEtq4xYGW6UN0dipN?=
 =?us-ascii?Q?qQrTqRFuZxrj2KV/W4QRcy1JMKruB9zjR+h3ItX+VOGkxtmhfWRyGFCpbA4Q?=
 =?us-ascii?Q?qxOoeqwaOKdbuy4TjLq4V4krF+YzuUmc1ep3JcH7JCrLTulBr3MN2EzkA6T2?=
 =?us-ascii?Q?TxDvW7KNSgdMelzfcOfzAh0CJGs3OPI1qb75/aEXiBB6W0VHYKZQwt8xi1bR?=
 =?us-ascii?Q?WiuLDJm8ASZV584+8alnS3iUe4w0hFQZ4AHQs+oUGdOwZgOtaF6vGuN7oWC1?=
 =?us-ascii?Q?ar2LWFda8J3BENNGsDQlgiPWqucBQp2FPzSanfFg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 174389c0-d78b-4363-c011-08dbaebf7d8e
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:56:07.4970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hYzPF/1ZISL+bMNK41PErQGOa3MzJJMyZuyNC5SANrCpsfvmxXAZ2yUC3JvDS7c3j25UkE3TKWI5apzeJbfFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4992
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: vxHqdatBJ7VrFp23FUZhxeGca_rHPf7T
X-Proofpoint-ORIG-GUID: vxHqdatBJ7VrFp23FUZhxeGca_rHPf7T
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 matt.coster@imgtec.com, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acquire clock and register resources, and enable/map as appropriate.

Changes since v3:
- Remove regulator resource (not used on supported platform)
- Use devm helpers
- Use devm_clk_get_optional() for optional clocks
- Don't prepare clocks on resource acquisition
- Drop pvr_device_clk_core_get_freq() helper
- Drop pvr_device_reg_fini()
- Drop NULLing of clocks in pvr_device_clk_init()
- Use dev_err_probe() on clock acquisition failure
- Remove PVR_CR_READ/WRITE helper macros
- Improve documentation for GPU clocks
- Remove regs resource (not used in this commit)

Co-developed-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Co-developed-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/imagination/Makefile     |   1 +
 drivers/gpu/drm/imagination/pvr_device.c | 147 ++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h | 152 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_drv.c    |  18 ++-
 4 files changed, 317 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.c

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 19b40c2d7356..b4aa190c9d4a 100644
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
index 000000000000..cef3511c0c42
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
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
+	void __iomem *regs;
+
+	pvr_dev->regs = NULL;
+
+	regs = devm_platform_ioremap_resource(plat_dev, 0);
+	if (IS_ERR(regs))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(regs),
+				     "failed to ioremap gpu registers\n");
+
+	pvr_dev->regs = regs;
+
+	return 0;
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
+ *  * Any error returned by devm_clk_get_optional().
+ */
+static int pvr_device_clk_init(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct clk *core_clk;
+	struct clk *sys_clk;
+	struct clk *mem_clk;
+
+	core_clk = devm_clk_get(drm_dev->dev, "core");
+	if (IS_ERR(core_clk))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+				     "failed to get core clock\n");
+
+	sys_clk = devm_clk_get_optional(drm_dev->dev, "sys");
+	if (IS_ERR(sys_clk))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+				     "failed to get sys clock\n");
+
+	mem_clk = devm_clk_get_optional(drm_dev->dev, "mem");
+	if (IS_ERR(mem_clk))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+				     "failed to get mem clock\n");
+
+	pvr_dev->core_clk = core_clk;
+	pvr_dev->sys_clk = sys_clk;
+	pvr_dev->mem_clk = mem_clk;
+
+	return 0;
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
+		return err;
+
+	/* Map the control registers into memory. */
+	return pvr_device_reg_init(pvr_dev);
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
+}
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 53b1cdb5a6a6..d61b3615b49f 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -11,9 +11,22 @@
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
 
 /**
  * struct pvr_device - powervr-specific wrapper for &struct drm_device
@@ -26,6 +39,37 @@ struct pvr_device {
 	 * from_pvr_device().
 	 */
 	struct drm_device base;
+
+	/**
+	 * @regs: Device control registers.
+	 *
+	 * These are mapped into memory when the device is initialized; that
+	 * location is where this pointer points.
+	 */
+	void __iomem *regs;
+
+	/**
+	 * @core_clk: General core clock.
+	 *
+	 * This is the primary clock used by the entire GPU core.
+	 */
+	struct clk *core_clk;
+
+	/**
+	 * @sys_clk: Optional system bus clock.
+	 *
+	 * This may be used on some platforms to provide an independent clock to the SoC Interface
+	 * (SOCIF). If present, this needs to be enabled/disabled together with @core_clk.
+	 */
+	struct clk *sys_clk;
+
+	/**
+	 * @mem_clk: Optional memory clock.
+	 *
+	 * This may be used on some platforms to provide an independent clock to the Memory
+	 * Interface (MEMIF). If present, this needs to be enabled/disabled together with @core_clk.
+	 */
+	struct clk *mem_clk;
 };
 
 /**
@@ -56,6 +100,114 @@ struct pvr_file {
 
 #define to_pvr_file(file) ((file)->driver_priv)
 
+int pvr_device_init(struct pvr_device *pvr_dev);
+void pvr_device_fini(struct pvr_device *pvr_dev);
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
index a23bef62b52b..e007d6946bdc 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -464,6 +464,7 @@ pvr_probe(struct platform_device *plat_dev)
 {
 	struct pvr_device *pvr_dev;
 	struct drm_device *drm_dev;
+	int err;
 
 	pvr_dev = devm_drm_dev_alloc(&plat_dev->dev, &pvr_drm_driver,
 				     struct pvr_device, base);
@@ -474,15 +475,30 @@ pvr_probe(struct platform_device *plat_dev)
 
 	platform_set_drvdata(plat_dev, drm_dev);
 
-	return drm_dev_register(drm_dev, 0);
+	err = pvr_device_init(pvr_dev);
+	if (err)
+		return err;
+
+	err = drm_dev_register(drm_dev, 0);
+	if (err)
+		goto err_device_fini;
+
+	return 0;
+
+err_device_fini:
+	pvr_device_fini(pvr_dev);
+
+	return err;
 }
 
 static int
 pvr_remove(struct platform_device *plat_dev)
 {
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
 	drm_dev_unplug(drm_dev);
+	pvr_device_fini(pvr_dev);
 
 	return 0;
 }
-- 
2.42.0

