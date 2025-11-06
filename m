Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B79DC3B9A3
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F56A10E8EE;
	Thu,  6 Nov 2025 14:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="XcI4EWlD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazhn15011021.outbound.protection.outlook.com
 [52.102.140.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862E410E8EE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:13:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfqNU8FpgZfB4HGnIqvenCyi7aeeskmWt2lhIbXgUcWGyeEyHZBgreElriY8gehM5rI0q2rZeYRneOaX25tXjD+/cWObC4KbnSBDWrnqJCBOIXhVAPiB2K0xsHbDvodcswy+nOq5gCsQnX2sETwIle+L+wljDFaIZd28OJnsBaU9F3Zj3HthRzm6J5uIQCDVQgWHQfidjXxp0MTHV5WlEm+vk1m3VPdvRjcuUwbQVa4SF6RekDuh5PeOdBKPuC8+b83NhzNcyAjpQK2DDuvI3tPIoN5Z0pxhAO7uORHmwT5nivKWHIhZbocQJ68YOPHUpkNwFFypz+FGayP4HgVSNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwlKsDXAyd4qlaamF8RAvN3x3zyji7/h09GYHZOJ980=;
 b=taGh7VEHPUs18qRCPApLi6Zs+g2thncbSKErql9JK0Nti1CLzZl/0k20wsC+PDGBQNRafI4FokO+EHuAm1JFGeWDQ8PcG/a2bG0vHpvCrPrMqdyvnf0rqasujqhe1NhuEKGsDXqWdza0mPbj4u6NbG4RVkIJFrngqgdsgHaD6D9wPTVnOQsvfbf2E5PAJACSLZb3nyNl39Hi/SVhOvNcCOl6k3zT/gWAmyQiUbbtqokzdHFGxF2NHs/srMljkX0N3ZTbDIxpXb6okDHGtlyVuHxJGiKsz3/EqxzlXgr9gRy5zGoueDSGxNWkpmSMkSa3UUJL0Ls02oF2SOJ986/FwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwlKsDXAyd4qlaamF8RAvN3x3zyji7/h09GYHZOJ980=;
 b=XcI4EWlD2wdN1nPaEcMYssyX+Xy6IFX1Sx1SF9tWwNrYvslxfqEHluGeLB/8KvuZ9C7NmUox4PsYnRpghkpxZzoREVFOcw48IINfD9TWgP1NtpdZ5W3Rr56OnVpOy48aD/hhXug5JfdHmKQrW1iQKLUSfEnsa9h1VVKR4uiUzuc=
Received: from PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::6)
 by SA1PR10MB7683.namprd10.prod.outlook.com (2603:10b6:806:386::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 14:13:08 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::d2) by PH5P220CA0008.outlook.office365.com
 (2603:10b6:510:34a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 14:13:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 14:13:08 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:13:04 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:13:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 08:13:04 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6ECRES1335893;
 Thu, 6 Nov 2025 08:12:58 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
 <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
 <louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v2 5/5] drm/tidss: Fix sampling edge configuration
Date: Thu, 6 Nov 2025 19:42:27 +0530
Message-ID: <20251106141227.899054-6-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106141227.899054-1-s-jain1@ti.com>
References: <20251106141227.899054-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|SA1PR10MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb7caa7-a774-454c-96e1-08de1d3e9c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|34020700016|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M0cGdcT3VbW6LcL+M5y1NsTkdTQ4w0M38hZG0gDHveWtOKT5V22EXme8q7/T?=
 =?us-ascii?Q?MgnhXdrLhoP8MlZ61v5iv+QKS5f/Swlt4Uw4WQdyqU1G5qgNNWoevjSWpUSd?=
 =?us-ascii?Q?jKds3yAsC3GOQwa4mg7ziUpnx0xIW5wkM1Y88QQWDQRVSMklpCtwSMR4qSpS?=
 =?us-ascii?Q?wZ+lqqhFI0+FK0inpP5HkgB8u53lk1qfbEwWPt8upFQeXfOk5/jheq6U6Afj?=
 =?us-ascii?Q?6HKZeRtM6neYN62/lMcpCF9Cenji9IkLDGcTspZi6ju/i/OVKNM6BljnJZfU?=
 =?us-ascii?Q?BRwBfaahU3FOnDP8805o8TmfMJVmx2aeBpineQRJzEeJ9B2Gf7/Z7kcj7gXt?=
 =?us-ascii?Q?7NjjqbLBQwE2sZg8GWGRdWrrDyheV0qvbh1/tFb7KJICJ6gH9TPuigBjW0NV?=
 =?us-ascii?Q?+vdJQJim1y11gE/XtcIv4Xc1yLOtlxi8dDdPOw6MVWcUVCalMx+60sA4qaCe?=
 =?us-ascii?Q?5PTRq4RTP6bVc3lrDlW6vqjOojsaPQEAImh0pDYozUFCAHHfK7PlZR1juQ3p?=
 =?us-ascii?Q?Fd7RmhxTF7hEUOcRVqJY9//gtZDNFhFXPsA/HLNgS9+VlLNeloisKogIfPge?=
 =?us-ascii?Q?twjZN3mwhPsFRxXLMxa7kDS6E6rrJ8iSlEe7oltGpScd5XSHQg/3cKWtuB/J?=
 =?us-ascii?Q?RmtGX02Fz0OUHqOtLg1HzGJqW3QC/vtMG2dGtZ9RTrgkdgG5T8sakpCDwzLv?=
 =?us-ascii?Q?YOiJmu7uZe0GlykPo9Lv2NUk+6HAojvlW0MljjLSo2Bd4hr9oYZG6MGERI+y?=
 =?us-ascii?Q?9cW3VB+DjFnzWMUEPTnSiOKDzmuJqASwPbVuvZ4bpaWIP6+Ox5J9pjFIKAkb?=
 =?us-ascii?Q?II5iKbxeEW2OukkDErzxnJO51BujpcWgE0YOhs+uf7P3/nUYg+lXE6r/P29i?=
 =?us-ascii?Q?i5JCnH2u8Hger3pHwHZd3t3WqGj5zUuIYTTD1RjQ+jpvO6MNbsOWYdNJYhCJ?=
 =?us-ascii?Q?nCCowy/x5JC44Yzz+m2X3uq1TektCwIXZdK7LTJNMbIxBZ5tOX4op2BBZ436?=
 =?us-ascii?Q?eYrKJzCUpOwR3uAOTmiF3L0PJ8v8L02VS9fDdQLyRraM+aD9g5A8UW0twUcH?=
 =?us-ascii?Q?I++LFtczji6ptETNqMYwkADocXOGLe5cGUrfSwWsbZTYIrO+Y92g+wd/fWZX?=
 =?us-ascii?Q?DKI11IYtxQqOF5uRgIFKwDvQzRxNnfXgLsLXjrPXOBD/R4AujFwxF/4r7RFc?=
 =?us-ascii?Q?mpWLcfB+ozx8jxvjZI/K1xk0Jmq0SBGUWxwzCTO/Q7wgV6u/6LvL+RQyDgXA?=
 =?us-ascii?Q?PE/8s6uPkJPFy+dgk52V+3WJzncd+0b6I71tnM1tShLS4SehZwvbtsnvsEkd?=
 =?us-ascii?Q?lA29ZZFNo/REFdr8HLi0a2aQYlJg1iaoZMmq6xUxNTykRTum3FInZYkCKFpx?=
 =?us-ascii?Q?7jtj4V0i4Fhhg6O41Wyp4ca/r8Mh+xEtJxCRZ1dugX33qQmHGhwLO1HJsRxU?=
 =?us-ascii?Q?kn9pJ49KA7wrUq0xyOYLObM/WxwbRfsYCKT5i7Hz/jn1Mee8ehrRCPAcEOVD?=
 =?us-ascii?Q?6D3/ITjm5uN8h0YezUyjFuz4y+g6XdKZGqozXfYFZNl4BdeNg4DIWomix/Oa?=
 =?us-ascii?Q?HqoIVwTa51hYjtPYnktGku05mfkCHDMRiMD8lO0/?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(34020700016)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:13:08.5509 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb7caa7-a774-454c-96e1-08de1d3e9c9d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7683
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Louis Chauvet <louis.chauvet@bootlin.com>

As stated in the AM62x Technical Reference Manual (SPRUIV7B)[1], the data
sampling edge needs to be configured in two distinct registers: one in the
TIDSS IP and another in the memory-mapped control register modules. Since
the latter is not within the same address range, a phandle to a syscon
device is used to access the regmap.

Configure the CTRL_MMR register, as mentioned in the Technical Reference
Manual to fix sampling edge.

[1]: https://www.ti.com/lit/ug/spruiv7b/spruiv7b.pdf

Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
Cc: stable@vger.kernel.org
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index d8e1a1bcd660..d09eecb72dc0 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -500,6 +500,7 @@ struct dispc_device {
 	const struct dispc_features *feat;
 
 	struct clk *fclk;
+	struct regmap *clk_ctrl;
 
 	bool is_enabled;
 
@@ -1234,6 +1235,11 @@ void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
 				  mode->crtc_hdisplay - 1) |
 		       FIELD_PREP(DISPC_VP_SIZE_SCREEN_VDISPLAY_MASK,
 				  mode->crtc_vdisplay - 1));
+
+	if (dispc->clk_ctrl) {
+		regmap_update_bits(dispc->clk_ctrl, 0, 0x100, ipc ? 0x100 : 0x000);
+		regmap_update_bits(dispc->clk_ctrl, 0, 0x200, rf ? 0x200 : 0x000);
+	}
 }
 
 void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport)
@@ -3003,6 +3009,14 @@ int dispc_init(struct tidss_device *tidss)
 
 	dispc_init_errata(dispc);
 
+	dispc->clk_ctrl = syscon_regmap_lookup_by_phandle_optional(tidss->dev->of_node,
+								   "ti,clk-ctrl");
+	if (IS_ERR(dispc->clk_ctrl)) {
+		r = dev_err_probe(dispc->dev, PTR_ERR(dispc->clk_ctrl),
+				  "DISPC: syscon_regmap_lookup_by_phandle failed.\n");
+		return r;
+	}
+
 	dispc->fourccs = devm_kcalloc(dev, ARRAY_SIZE(dispc_color_formats),
 				      sizeof(*dispc->fourccs), GFP_KERNEL);
 	if (!dispc->fourccs)
