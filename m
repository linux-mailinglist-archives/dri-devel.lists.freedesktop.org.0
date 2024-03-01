Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA85586D939
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 02:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DDB10E857;
	Fri,  1 Mar 2024 01:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2129.outbound.protection.partner.outlook.cn
 [139.219.146.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5447E10E849
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 01:52:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmQjIBPeeCRmPqtD1rIG3i6pFMEo/3wpvt1O2kAf3upbNNHcJkwiAsDiwGxm8cd9nZp2eXFoW2jEClBxsALYQL1bAKbqWzuHf71RhNzkg9feTJh+q8NBIN9OK2XWBJlpOGqAx6+fX5isimz8sAiTsdqN2qgO2fDV5dib4KT/xCKN5vU8LbujX+BWtVDQsMJXJhABCdyIQ/AJlzx4AWL9uaa3ISvDx/MuoXLbfkSXm47ZgzXWPd3WOsqK9GRr3QX2WblH0/enmOCzICV3SGhSi6X66XPKYlvAysnsqT2r2p3rLpa//aHnZdocBenVoF+x58Nw9yJ3O18n/FX3csIbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cAGB8pvQQOl8NNrP9rtkz4TmlTEoOoJ172+IVwC3LU=;
 b=VPtWX78ylUV26BLMxGmUfPVAlK/o49KDOT0rPECESpHtvwZX2Q6sjKnSX1a/YbXnTDYUEKhhja23XeSlUp68okEwFnxw0tYtV06f20fYN9t40/Yx3UjVf158hiSJIKD3FPn/XEXZFLQQWY2l6hPuziILyluLfe1qbPHjzvjKq3i3R6z8cKgmwDub0XmAGs6G9zTdt6Fssm2OVzPebcMnkdEawOQAbkoRL5HQZ5zHqMxQW+XpZ+9WdmiNZBuqGdwmneD+hdVBEU7IzkNl78UiKWwSEsEwuf8CY1Hjy7/nGbPWx21fdBzkxgsJs718B7NQCZwm25fRFRELymrF4Enrjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Fri, 1 Mar
 2024 01:52:45 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::db9a:cc7:56ae:de5a]) by NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::db9a:cc7:56ae:de5a%3]) with mapi id 15.20.7316.037; Fri, 1 Mar 2024
 01:52:45 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, aford173@gmail.com,
 agx@sigxcpu.org, rdunlap@infradead.org, u.kleine-koenig@pengutronix.de,
 sam@ravnborg.org, steven.price@arm.com, bbrezillon@kernel.org,
 changhuang.liang@starfivetech.com, keith.zhao@starfivetech.com,
 shengyang.chen@starfivetech.com, jack.zhu@starfivetech.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/bridge: cdns-dsi: Add support for StarFive JH7110
 SoC
Date: Fri,  1 Mar 2024 09:52:22 +0800
Message-Id: <20240301015222.93114-3-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240301015222.93114-1-shengyang.chen@starfivetech.com>
References: <20240301015222.93114-1-shengyang.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0026.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::13) To NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1070:EE_|NT0PR01MB1102:EE_
X-MS-Office365-Filtering-Correlation-Id: d6dbf976-4d7f-4484-1216-08dc39924a64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wJLevHrIi/UHISWeviWpJIpHRGzSMEdRiXVDKwozLB/j8b/29moETzLtqUbKJYfGG9XsF25vFjlnQ6G98MiwLDUz0GYiBb+79Eb/MIpZzRdQD86MVIVY2Aj8/GD7hUtB5OFyszeJrSMpObPAS0WwQOlassJsSHSWosqEXFrMli07hCBDh5MI00KyAiBJODGvzWvskrVRgVv/VPGXoSU3EAIMX15IP6Asxv2srSWOmE+BvMIJTs8Q3/BbKdn97pfH2jU4NpUOy5/nZist9y+13Yp5qhIuxM4fh96dF+kRKJYuaSTNFn47GL/uVt9gvCU9jv0jtT5+YVZ+gt7wZCqpU8xyqpPoASyhObIOQf7EAdfExBa10DPjUx//HT6yE8INrn6J53Z4iezIu4aaCXdEqCvb/Bu8WkLAhR3rtdI4CmINtczji1UqZ/EtnCebj/7OXEvo5sK4QUT87CSKiIXw3b+Ttoz/58Wsmt/1TELZ1TAmjNKo4s5DVj2ZEVDfHZ18BjkewpyDMzEbHph8bGGmBsl/qITSKopgWBYVpUUpa+RI3AaIiLuSr4ntmyyveVdhS0VjG4+KeegNbFR2HlL5NJ0EGvWQ47syH9S1sg5zqQ2TzAjI0aKX/UdDgy+oZ7ep
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE; SFS:(13230031)(41320700004)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tSsTxDiRGON9nTe50nuDEGVnhIqDmECR4+cWiBI4nLUtcCDUX7gAoXGY/CKH?=
 =?us-ascii?Q?EfNiFE3eTSIbOgb9biD3kor8SSNKhENhg/HxglbBEz1HuDZLvRZNeN8vpB5R?=
 =?us-ascii?Q?GGNRbA1hTMlQSJ2Tezr5gWDD9hvUl2Fdh4mZ1g76tDDHy8Q7xJsSF5CaVURe?=
 =?us-ascii?Q?h7L9rK+uLW9yX9BLN+d5Sxp5CpQCWo9RsFLNmIlQWiKqcbEaDqEU6MywPcet?=
 =?us-ascii?Q?1g8tMToc2DxmYoLKTSSGO8dlbyhVWnl812cgRN3Shy24+mgNFsYNz7RYw23I?=
 =?us-ascii?Q?4PWCHTvbG6ymduqqYusWAEpepFmkbO9M1QBxXU75Bf73ZDVc5oKXCXLUZvjv?=
 =?us-ascii?Q?WgogNcojI27pHu4/cPZo48TWdTrPcXkQ4df/7MoQHdhcgyQBRBvhJqgNaYX3?=
 =?us-ascii?Q?w+XfbDx/ENAsS2zMpUa6VB5ARZ/QNiGyN6NtEaOsPkUSYNX/Z7nfPfQlN0Rr?=
 =?us-ascii?Q?zrJH+jg7EAsXbpmUQbSE3QQI3RCR3AooAiFP2IzTC8UYIOhzZ+5X33QYgvBm?=
 =?us-ascii?Q?9mxKsvETb4l5rGfTkrs+gn/vDSRqyLysjwgjzf6p0Ep1Z4OrN1g4IP0dVTzG?=
 =?us-ascii?Q?YRTF0Kl6+Nf/OdS4cs0LdmRZnwh/BgL5rjyDfHnR7gGIOQCZ9W3K0VddM48q?=
 =?us-ascii?Q?dmusesMfEhectZtVH1AbtwVJYTc0gqEBAMxtWVx0a+l0uLIlhuGO/tNoTJ2g?=
 =?us-ascii?Q?ln/Tf3TJgxQGef1dWjw91oOCGq/ZZmd3XR2IxGMSLJxQA2yDtgeXjTovGYhF?=
 =?us-ascii?Q?uGugM6qe6PVHQ9KEjzsqJt8Wvp40bBvL91f7R4go7OByoiQlSWKXuvzkLbxp?=
 =?us-ascii?Q?2+0KAQOuYrcG0XO5i2qML9ZSeYIHen++NtTf4r2ukTqWAEgi6n4jq/4/Gvfp?=
 =?us-ascii?Q?/XCPC9fLTL8ndG6C4zMOC5nEb14ObHIs3vtUqH9S+JoqpbKJdkuSO5ySbAYe?=
 =?us-ascii?Q?Ue3ITX48KBBA6qebZJenJT2K5IjJbRdPj/ulfYwztF2qd/LERsOdg7xPGk2c?=
 =?us-ascii?Q?RUp5iWjmLa7rmvQ+IoVDWHEmJHYPQN1LzMdrRRxMQfxO4myRY0B8oS+X94T+?=
 =?us-ascii?Q?6BE3LjEmlX2q6d8fBYmrWcG8nPrqfNXD2ttpUNEVx50oasIMBcHGKSBlFh+f?=
 =?us-ascii?Q?InsqwzRvenye6HzaIpogHCRu+txL+UZIvbgobNxDezLktIvuLnJx13fUSNIc?=
 =?us-ascii?Q?GvberLr+oqs2rNZBlLt5rCWHnkhjYNRc6fkiB+IcQjvfaiH6VpBWYoaN1YU7?=
 =?us-ascii?Q?cjBjTKkxZBF9SJJr4MKUgsI+i/DwdbWF5mrJQHsb/V3UVeVcvkUQxmQhP4Tj?=
 =?us-ascii?Q?4IqGd418xXV6m3JqjkuQEf/lJ0M7BfKy+aBzy8DwJEW2Kd/Sb+7CrAGEwIVn?=
 =?us-ascii?Q?8JEI6bIiMeCsJEeXHhrTPq9RCGEWJXSxAkGJA/a8AE0JQyUUw7/ZmdPg2njs?=
 =?us-ascii?Q?ZeOVkx6NS1oQ4jptDGTB7PtntDLWCdcatEkH6/VA4rLWBHjIhwjCqOPru3nF?=
 =?us-ascii?Q?Uf27BjysaNeya7zImYtV1ErB/PIIYKSSj6UenPP04zXVHwx032bv3NqPEAJv?=
 =?us-ascii?Q?Yu0CHzvp10MtX86wCufTWDoV0Tt1xzRf51cTRRFESY2JEYRX9/eWINTCazOE?=
 =?us-ascii?Q?2HbnlrtyaasBp63pFvnksA4=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6dbf976-4d7f-4484-1216-08dc39924a64
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 01:52:45.7645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+wu9hQ0SIVd+BqrueLAYizbbqGRhIjWACmzs6OSgN7yTxJ9w8YnZUOlncNt59fIvCrdDjW+jKa1rf3B3hURe+PhgnwcmErlGgPRmudrdd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1102
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

From: Keith Zhao <keith.zhao@starfivetech.com>

Add display bridge support for dsi on StarFive JH7110 SoC.

The mainly modification is followed:
    1.Add extra clock and reset operation for JH7110.
    2.Add callback for JH7110.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>
---
 drivers/gpu/drm/bridge/cadence/Kconfig        |   7 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  29 +++-
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  19 +++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.c  | 138 ++++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.h  |  16 ++
 6 files changed, 209 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h

diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index cced81633ddc..ad9f572f4720 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -19,6 +19,13 @@ config DRM_CDNS_DSI_J721E
 	help
 	  Support J721E Cadence DSI wrapper. The wrapper manages
 	  the routing of the DSS DPI signal to the Cadence DSI.
+
+config DRM_CDNS_DSI_JH7110
+	bool "JH7110 SOC Cadence DSI support"
+	default n
+	help
+	  Cadence DPI to DSI bridge which is embedded in the
+	  StarFive JH7110 SoC.
 endif
 
 config DRM_CDNS_MHDP8546
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index c95fd5b81d13..87f603a9f4ad 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 cdns-dsi-y := cdns-dsi-core.o
 cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
+cdns-dsi-$(CONFIG_DRM_CDNS_DSI_JH7110) += cdns-dsi-jh7110.o
 obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
 cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
 cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 7457d38622b0..c0c81745e765 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -27,6 +27,10 @@
 #include "cdns-dsi-j721e.h"
 #endif
 
+#ifdef CONFIG_DRM_CDNS_DSI_JH7110
+#include "cdns-dsi-jh7110.h"
+#endif
+
 #define IP_CONF				0x0
 #define SP_HS_FIFO_DEPTH(x)		(((x) & GENMASK(30, 26)) >> 26)
 #define SP_LP_FIFO_DEPTH(x)		(((x) & GENMASK(25, 21)) >> 21)
@@ -552,6 +556,10 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 	/* data rate was in bytes/sec, convert to bits/sec. */
 	phy_cfg->hs_clk_rate = dlane_bps * 8;
 
+	if (dsi->platform_ops && dsi->platform_ops->mode_fixup)
+		adj_dsi_htotal = dsi->platform_ops->mode_fixup(dsi, dsi_cfg, phy_cfg,
+							   dpi_hz, dpi_htotal, dsi_htotal);
+
 	dsi_hfp_ext = adj_dsi_htotal - dsi_htotal;
 	dsi_cfg->hfp += dsi_hfp_ext;
 	dsi_cfg->htotal = dsi_htotal + dsi_hfp_ext;
@@ -683,7 +691,7 @@ static void cdns_dsi_bridge_post_disable(struct drm_bridge *bridge)
 	pm_runtime_put(dsi->base.dev);
 }
 
-static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
+void cdns_dsi_hs_init(struct cdns_dsi *dsi)
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	u32 status;
@@ -1026,6 +1034,14 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
 
 	cdns_dsi_init_link(dsi);
 
+	/*
+	 * on JH7110 SoC , when transfer dsi command ,
+	 * cdns_dsi_hs_init is needed.
+	 * or the final ret will be error value.
+	 */
+	if (dsi->platform_ops && dsi->platform_ops->transfer)
+		dsi->platform_ops->transfer(dsi);
+
 	ret = mipi_dsi_create_packet(&packet, msg);
 	if (ret)
 		goto out;
@@ -1142,6 +1158,9 @@ static int __maybe_unused cdns_dsi_resume(struct device *dev)
 	clk_prepare_enable(dsi->dsi_p_clk);
 	clk_prepare_enable(dsi->dsi_sys_clk);
 
+	if (dsi->platform_ops && dsi->platform_ops->resume)
+		dsi->platform_ops->resume(dsi);
+
 	return 0;
 }
 
@@ -1152,6 +1171,10 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
 	clk_disable_unprepare(dsi->dsi_sys_clk);
 	clk_disable_unprepare(dsi->dsi_p_clk);
 	reset_control_assert(dsi->dsi_p_rst);
+
+	if (dsi->platform_ops && dsi->platform_ops->suspend)
+		dsi->platform_ops->suspend(dsi);
+
 	dsi->link_initialized = false;
 	return 0;
 }
@@ -1294,6 +1317,10 @@ static const struct of_device_id cdns_dsi_of_match[] = {
 #ifdef CONFIG_DRM_CDNS_DSI_J721E
 	{ .compatible = "ti,j721e-dsi", .data = &dsi_ti_j721e_ops, },
 #endif
+#ifdef CONFIG_DRM_CDNS_DSI_JH7110
+	{ .compatible = "starfive,jh7110-dsi", .data = &dsi_ti_jh7110_ops, },
+#endif
+
 	{ },
 };
 MODULE_DEVICE_TABLE(of, cdns_dsi_of_match);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
index ca7ea2da635c..fec2d5a9c778 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
@@ -53,12 +53,22 @@ struct cdns_dsi;
  * @deinit: Called in the CDNS DSI remove
  * @enable: Called at the beginning of CDNS DSI bridge enable
  * @disable: Called at the end of CDNS DSI bridge disable
+ * @resume: Called at the resume of CDNS DSI
+ * @suspend: Called at the suspend of CDNS DSI
+ * @update: Called at the middle of CDNS DSI bridge enable
  */
 struct cdns_dsi_platform_ops {
 	int (*init)(struct cdns_dsi *dsi);
 	void (*deinit)(struct cdns_dsi *dsi);
 	void (*enable)(struct cdns_dsi *dsi);
 	void (*disable)(struct cdns_dsi *dsi);
+	void (*resume)(struct cdns_dsi *dsi);
+	void (*suspend)(struct cdns_dsi *dsi);
+	int (*mode_fixup)(struct cdns_dsi *dsi, struct cdns_dsi_cfg *dsi_cfg,
+			  struct phy_configure_opts_mipi_dphy *phy_cfg,
+			  unsigned long dpi_hz, unsigned long dpi_htotal,
+			  unsigned long dsi_htotal);
+	void (*transfer)(struct cdns_dsi *dsi);
 };
 
 struct cdns_dsi {
@@ -79,6 +89,15 @@ struct cdns_dsi {
 	bool link_initialized;
 	bool phy_initialized;
 	struct phy *dphy;
+
+#ifdef CONFIG_DRM_CDNS_DSI_JH7110
+	int num_rsts;
+	int num_clks;
+	struct reset_control_bulk_data *resets;
+	struct clk_bulk_data *clocks;
+#endif
 };
 
+void cdns_dsi_hs_init(struct cdns_dsi *dsi);
+
 #endif /* !__CDNS_DSI_H__ */
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
new file mode 100644
index 000000000000..0bee5a622508
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * JH7110 SoC Cadence DSI wrapper
+ *
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "cdns-dsi-jh7110.h"
+
+static const char * const dsi_resets[] = {
+	"sys",
+	"dpi",
+	"txesc",
+	"txbytehs",
+};
+
+static const char * const dsi_clocks[] = {
+	"dpi",
+	"txesc",
+};
+
+static int cdns_dsi_get_clock(struct device *dev, struct cdns_dsi *dsi)
+{
+	int i;
+	int ret;
+
+	dsi->num_clks = ARRAY_SIZE(dsi_clocks);
+
+	dsi->clocks = devm_kcalloc(dev, dsi->num_clks,
+				   sizeof(*dsi->clocks), GFP_KERNEL);
+	if (!dsi->clocks)
+		return -ENOMEM;
+
+	for (i = 0; i < dsi->num_clks; i++)
+		dsi->clocks[i].id = dsi_clocks[i];
+
+	ret = devm_clk_bulk_get_optional(dev, dsi->num_clks,
+					 dsi->clocks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
+
+	return 0;
+}
+
+static int cdns_dsi_get_reset(struct device *dev, struct cdns_dsi *dsi)
+{
+	int i;
+	int ret;
+
+	dsi->num_rsts = ARRAY_SIZE(dsi_resets);
+
+	dsi->resets = devm_kcalloc(dev, dsi->num_rsts,
+				   sizeof(*dsi->resets), GFP_KERNEL);
+	if (!dsi->resets)
+		return -ENOMEM;
+
+	for (i = 0; i < dsi->num_rsts; i++)
+		dsi->resets[i].id = dsi_resets[i];
+
+	ret = devm_reset_control_bulk_get_exclusive(dev, dsi->num_rsts,
+						    dsi->resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get resets\n");
+
+	return 0;
+}
+
+static int cdns_dsi_jh7110_init(struct cdns_dsi *dsi)
+{
+	int ret;
+
+	ret = cdns_dsi_get_clock(dsi->base.dev, dsi);
+	if (ret)
+		return ret;
+
+	return cdns_dsi_get_reset(dsi->base.dev, dsi);
+}
+
+static void cdns_dsi_jh7110_resume(struct cdns_dsi *dsi)
+{
+	int ret;
+
+	ret = clk_bulk_prepare_enable(dsi->num_clks, dsi->clocks);
+	if (ret) {
+		dev_err(dsi->base.dev, "Failed to enable clocks\n");
+		return;
+	}
+
+	ret = reset_control_bulk_deassert(dsi->num_rsts - 1, dsi->resets);
+	if (ret) {
+		dev_err(dsi->base.dev, "Failed to deassert resets\n");
+		clk_bulk_disable_unprepare(dsi->num_clks, dsi->clocks);
+		return;
+	}
+}
+
+static void cdns_dsi_jh7110_suspend(struct cdns_dsi *dsi)
+{
+	reset_control_bulk_assert(dsi->num_rsts, dsi->resets);
+
+	clk_bulk_disable_unprepare(dsi->num_clks, dsi->clocks);
+}
+
+static int cdns_dsi_jh7110_mode_fixup(struct cdns_dsi *dsi, struct cdns_dsi_cfg *dsi_cfg,
+				      struct phy_configure_opts_mipi_dphy *phy_cfg,
+				      unsigned long dpi_hz, unsigned long dpi_htotal,
+				      unsigned long dsi_htotal)
+{
+	unsigned long long dlane_bps;
+	unsigned long adj_dsi_htotal;
+	unsigned int lanes = dsi->output.dev->lanes;
+
+	phy_cfg->hs_clk_rate = phy_cfg->hs_clk_rate - (phy_cfg->hs_clk_rate % 10000000);
+	phy_cfg->hs_clk_rate = roundup(phy_cfg->hs_clk_rate, 100000000);
+	dlane_bps = phy_cfg->hs_clk_rate * lanes * dpi_htotal / 8;
+	adj_dsi_htotal = dlane_bps / dpi_hz;
+
+	return adj_dsi_htotal;
+}
+
+static void jh7110_cdns_dsi_hs_init(struct cdns_dsi *dsi)
+{
+	cdns_dsi_hs_init(dsi);
+	reset_control_deassert(dsi->resets[3].rstc);
+}
+
+const struct cdns_dsi_platform_ops dsi_ti_jh7110_ops = {
+	.init = cdns_dsi_jh7110_init,
+	.resume = cdns_dsi_jh7110_resume,
+	.suspend = cdns_dsi_jh7110_suspend,
+	.mode_fixup = cdns_dsi_jh7110_mode_fixup,
+	.transfer = jh7110_cdns_dsi_hs_init,
+};
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h
new file mode 100644
index 000000000000..15d6a766b502
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * JH7110 Cadence DSI
+ *
+ * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
+ * Author: keith.zhao <keith.zhao@starfivetech.com>
+ */
+
+#ifndef __CDNS_DSI_JH7110_H__
+#define __CDNS_DSI_JH7110_H__
+
+#include "cdns-dsi-core.h"
+
+extern const struct cdns_dsi_platform_ops dsi_ti_jh7110_ops;
+
+#endif /* !__CDNS_DSI_JH7110_H__ */
-- 
2.17.1

