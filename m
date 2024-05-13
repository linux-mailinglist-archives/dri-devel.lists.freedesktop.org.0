Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3E48C3D06
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 10:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD64510E4EF;
	Mon, 13 May 2024 08:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2111.outbound.protection.partner.outlook.cn [139.219.17.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDBA10E4EE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 08:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k23WtRBrq5QaPCQunr9rAX4ET6xwTpZ+AqKQ72w7yFpaXPFOLtbfok+MszalWKnCGlX4Ke6RBOIbsTC3tCuNzbsE5C/yAu/WwvLuIFGQUcPSzu6BXLh7PVn17Y+g3EcSdHwIEXroExFFCLLNrbgu3G+TiJbkQLvUMWTT0Ikftsv9tEnB9QZPsmYEl0BNCInHMxlLzk1GWQ3mznlznhHQblrWW4FCq/DaSLar1jAuq0IfKY5OmQm8SAJnpXP0vUvCRuiEQcjMRLGQLbRmaGsAWhANF+kwtvfYm1S8ayuH4Uwm/PwzZjRTH7uWkqDD1Krg/Gyu8JfcoHaUNJWBSR0RrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cAGB8pvQQOl8NNrP9rtkz4TmlTEoOoJ172+IVwC3LU=;
 b=T/P425pLlBfq3ALA4xOFG3q4nvfyLMm/nh6KwxI74l2d0cGBaNm1lhGhTP2QIRwkiDFz+n4BI83LvRQ+qHKVS094TyQ7QRZrtmcWQcmn6Dv8/9yqdD+ZNu1mHryn1/GzmwdZptFkZ+ydyanFRsPWWxDa8wKvwH4G5rfvsjt1hUO0NSiN/MW1PnUIKdSUOaJjnlbW3Tj7yqweu9Zrr3ffP9uu0t2zzhTtVopWg3celaalS9DNoLnS2aNzH0DJigeTwVOfe/errhVCu8YuRIQSKHCI17rYfemj4g/HfrakaXAHXGyYhMPcTUoSe9R6E630r7Wbsd0UlWJa2fPinJwuQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB0990.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Mon, 13 May
 2024 07:46:17 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::2bb1:5ec6:5260:17bd]) by
 NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn ([fe80::2bb1:5ec6:5260:17bd%6])
 with mapi id 15.20.7472.042; Mon, 13 May 2024 07:46:17 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, aford173@gmail.com, agx@sigxcpu.org,
 rdunlap@infradead.org, u.kleine-koenig@pengutronix.de, sam@ravnborg.org,
 steven.price@arm.com, bbrezillon@kernel.org,
 changhuang.liang@starfivetech.com, keith.zhao@starfivetech.com,
 shengyang.chen@starfivetech.com, jack.zhu@starfivetech.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/bridge: cdns-dsi: Add support for StarFive JH7110
 SoC
Date: Mon, 13 May 2024 15:46:07 +0800
Message-Id: <20240513074607.28271-3-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240513074607.28271-1-shengyang.chen@starfivetech.com>
References: <20240513074607.28271-1-shengyang.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0005.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::14) To NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1070:EE_|NT0PR01MB0990:EE_
X-MS-Office365-Filtering-Correlation-Id: 61cbefa7-a446-4ca7-1251-08dc7320c5a3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K5tsZiqTjISxuI4luaSmFeUz6KjGdWRIAy5F9drOC9RQPaD3df9di8/yYekHO+6k3dZIgCrKP/kbL9bA58yXAwRiYLzR3ddncb4zQaiL8b0dVjIDZIN+IhsxTStyGae8BJ+HAOALnmoGcVC0SzmCqDw0x5KJtuNmfkDlUBKdzuU0MoDw3Foogx9TUQXuRJ0lHTyrC8GHOBhAGs4FD5b23/djCZgLciYxlGHDCdzANUTVdf3/Ds3dtigatCaoTC0ehVkKwYgkWQkCfaYtuzt02eW1uhcdZGIG08qLagEvCGSkVaUO4Em+8q8e3iEHpz8m/3+AGMQtIBql7nGtMy8qWnZYJCPB5AcpEYFHCxgsap/LaXfyiz/Ip93lja2DD76nImBx5fFyk/1Ze1PaotoxCSRY/3/DzMdm/Uu+oR5rraR/WUc6YUVzkEXhiF2vcqfOz0Ok2sNYuLn4D1BD/at3a7H0IPnV5kl9qkizJyuVgnJSLZYwCRxYzwP0rrodOZHnGaENIqG2Lm1tTxA4+TZbUQIV/ftcUdl3y2m5ZF14Ew9T/JlYBpZ54Wqpifj674KgRxYqyterZFUOADz9HXdwAgMENC39d6aTYUIRmmm9jiFF2BQqGXEjhFR6J8SeKW6b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(41320700004)(7416005)(52116005)(366007)(1800799015)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?INGcfrcUk1AbfW7JJ0duisPolFxNrvVJd/aRvVYJ8mHGVpJndZSM4KFVWrda?=
 =?us-ascii?Q?ymJEQSUYnvzZSExSr9L4tyh0uYcWGGjpvUHb0S4wgEgptCPkrCAgN0zCvlL+?=
 =?us-ascii?Q?hFNpouvIuy5pwD/r5ARlAabZZVhqASmDqH3WfGy/LoBgrx/2g6TWB8y1wk45?=
 =?us-ascii?Q?TTSWu+0+kgEUK4kLOMd3ddNTWoUaoZLadTdCPFboBQIFNHL1qQT5xxKVC/uo?=
 =?us-ascii?Q?1M94XQwYHtukkEauw4mV1+/zozqi060DHyq7YOuIPsHYhCfFzxTRAd1OVy+4?=
 =?us-ascii?Q?BXrqR3/Ya5AAXvu5fD9n0LVBEm5NDSo/fJeM/gfEVTHui5rjGgkI746iypRw?=
 =?us-ascii?Q?890f/hL6bUdCa1j0KWZyEF2LxNWylpPb6estOoFLD4Dwa4ozxxLnLd7Kr4VL?=
 =?us-ascii?Q?69rXW58tO8eImBVPvlm32XzGUnZjYLHCPu+/UkXDDekSeHI6I9n/1+fNDEx4?=
 =?us-ascii?Q?9f9nqo7uWBPgJQeyWAPfGOZ4p63zTRfdoUVq5b6oVRGgmq0+19vo+nGeqxnM?=
 =?us-ascii?Q?+UxvGMxMssTdv2O9i9zhYOY84HfkcgeJ0oGcpGCZOwn19eTOJdhj0n3ad4i3?=
 =?us-ascii?Q?QjX1YW0t8HJwlRQ5C7hlCjDijjnRCc5ZszZmrMDY2sLVeYK/eQcLjnadXGkW?=
 =?us-ascii?Q?tf4PvaOCnFh+nRGAwNUgOG0bv7tTHwKEpLfGBK3RHQwh2mvM2vHcbXP+reDu?=
 =?us-ascii?Q?OTUKeaHwZXqpMjXI7EZafdHnnvrSkA4r+ZnjnKjK2af0wG5iDoY8LWSMmjr+?=
 =?us-ascii?Q?nzDVksqn3XYqUVkuNVkkvyfKeTq2r9bTDnie9uz9dM8MRkWmx6zSSUkvf5dA?=
 =?us-ascii?Q?WntXPVwUTu+Ibg/oLm+eJiUt5AzdF/4omBLAhmoX2SCEPfJb6mcjnXetHoea?=
 =?us-ascii?Q?Sw4kYacTv3Cs+fAJ6zosTauDk//qx/WyodUh1xmSprNNVYEkUMSqlZ1ya1Zi?=
 =?us-ascii?Q?P2xK8sUVGudHIuydaoP9ixVw6wNJu3Ak0sCYRUTgYq8PibES7u6gtPWjyz8I?=
 =?us-ascii?Q?FpPGWWhcJ3pKvjKWKQqTMmDNH95bhEW0XiP/EBAgzLzpVLZwy4Jd6ELbhaty?=
 =?us-ascii?Q?A7R137POyUpKlzPo5FHAjOZ7zTI15CTcZywpmS3JYXxgW1Wy3xlWRW4gS+tL?=
 =?us-ascii?Q?/I+U4PsH9Q8TNo0POTwm6bjJZK/Gc1AAvUBOokprBeXqhnQsksjiaSxx4Jsi?=
 =?us-ascii?Q?+Bi8MdZEbv9fK/mxIDjeUVz4FZRg5f+Oj0XrCoIIvZ6Cx1FUwEH445Gb7Tvn?=
 =?us-ascii?Q?x8L1DhHGYDgBgnxGRpnEQOfsmASVdrTXsg7fmjlg/c7CahZ1uS7PAdJYGFt6?=
 =?us-ascii?Q?zd115ekbVRAxIFsKjBZYMSjpr1Bgn7OvI80V5cfeSuqhw8C/sV9/wCE5453r?=
 =?us-ascii?Q?uySDrcpfwLWaX/yq+CvvSJ2Wkn63fvCfbIOhwnPvv/rbWEX9C9IK5cdpeQhT?=
 =?us-ascii?Q?n0rxmvyYY5uA6DI1FoyG5jRK0VfctGKaX2cZKqQ39p+oksFk2PpmT74uKqBl?=
 =?us-ascii?Q?L2IhXIIJ+m7gQTTpG66KNSVrbEONRwj9nwVqzo+hhXQ0ozu96GcV9fXEmNxw?=
 =?us-ascii?Q?xfuHv3Qw+PGvWnuOsFvGZYz6B9IkcxMAfqArqrsrIQBKzlePLv2/6Pk3lRUK?=
 =?us-ascii?Q?Bw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cbefa7-a446-4ca7-1251-08dc7320c5a3
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 07:46:17.3082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXtGYHTJ8IlSASWaSvkq56Wt62HnSs+39dcIi387TDSAIZIyuqLhSZPNLJzIkNVpUWx6mVWSBYNfoUhGmgLNh8MEotOrogScO71yMJwoXWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB0990
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

