Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E826A84AE87
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 07:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1C11129DB;
	Tue,  6 Feb 2024 06:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2120.outbound.protection.partner.outlook.cn
 [139.219.146.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C614E10F8B8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 06:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAgP73p/gkU9dwvlKK/qP4rCZXi6tBUOk18KGPFuBjGNXDaTVJ4lzRyVSL8Jfuu8YbyZcDdej+tHLwxuQvqSFkUzZZAZMpeDl5uUAjYOk+dJznMCRdwQ97B487Vq982O+ZD7X+Zp9vQhzTh4c5qB6fnKIAoLHpbedMjl1RlIVNriwITTT0Vyz6vi87gOHGy0+j7jkOik7rXogM/TyFEoPliv3xlGc0nl4/v2dtxB4F9I5q5tX0jMBDAc35bHk4zjTTO6L+icPpLDlgl6NePod5yqtCANV+CzVWhMoXohWVMB9LNWCseLhaDieISc2SJzGeDcaOXfwgo3ABkChQDiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAQARkESsARAPtcim1Ol+PH7pr4NsDiA470kAl97xYM=;
 b=gcot5Kwgfai4LcwdFzKYUShi+4zkU1C+UzuVbzzDgoKDFv3G/YV6GMD5o+1yGjwPEfPXP0XCh+gMMgtpy26/uWBJ+Nz/2TouDwlrUyNPBSkXK2qL21GOWWg0arbqTJWR51s3iUfJVzd/21f7Xt3uFRFA1u9JCAOnspM1eRuL431+Te0+5C/uboRC3z0b/hXL9BYsMq9yfU6XemoZ5eTe4cUMh+KbQ4F69U1d6QgA7Y9k6spZv4VF0h4vC2jHNMjta59H4/4/6lrZjEucLnMKOiJKA57Ld395XW49MqV66LSKcrw3WLwWzEgxEO5lb2B96NaxOHCjywbtGeovvVKUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB0974.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.19; Tue, 6 Feb
 2024 06:57:29 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::57c1:eb9d:c4e0:71af]) by
 NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn ([fe80::57c1:eb9d:c4e0:71af%4])
 with mapi id 15.20.7249.017; Tue, 6 Feb 2024 06:57:29 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de,
 tomi.valkeinen@ideasonboard.com, r-ravikumar@ti.com, aford173@gmail.com,
 agx@sigxcpu.org, rdunlap@infradead.org, u.kleine-koenig@pengutronix.de,
 sam@ravnborg.org, bbrezillon@kernel.org, changhuang.liang@starfivetech.com,
 keith.zhao@starfivetech.com, shengyang.chen@starfivetech.com,
 jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] drm/bridge: cdns-dsi: Add support for StarFive JH7110
 SoC
Date: Tue,  6 Feb 2024 14:57:09 +0800
Message-Id: <20240206065709.108684-3-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240206065709.108684-1-shengyang.chen@starfivetech.com>
References: <20240206065709.108684-1-shengyang.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0014.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::23) To NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1070:EE_|NT0PR01MB0974:EE_
X-MS-Office365-Filtering-Correlation-Id: b9572da5-0617-4158-b922-08dc26e0e22f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NmDFlQGj2v04n8u8a3v9vjJE33IZTe7AKodJLp98XpUkS/gXFOd87129rIg0vhMbNnnEG84VMfYCk/uiOhDcpofoehDLlfBPMChkUjfp1Vk4M4yxzzX0s2cq/3dKO0PQXWXMLduR0qENKJHzGJEIxZQfxGogas0NU/AFWpQAo6WdSm2o/srZiuOIWB63OdJWRSoAP9CxYbUFhsRN/Ibe0zg0+cHbuq8sbKO8CBR3BzhjMH1Wb7p+pt+fI4MPNZM0NtGKV2VpFqTLU+VrYe+LB5rjtbPRUrxhk7uRMxPZkNMnScR6wXRRwbVDxDw+66mCzl2ailAn9A6Hk2Kk8xtECG4pyHFLNnWd1ozftbT1xxy2yveup4akzHtJPZlsJ36Su1WghcWB5GUWSSGl8FmWCf2v/nLk4TRx66btgDbVXBXgITyBfaykJmvJcPTAZ0M5d2UkJqNvLvbDVJMgEAePngxFkoiUDsdxRpy7OuMrzl99YMJ8XvC72ogxZGAaBYrgG/3uG2Xps/vS3tRJ5w5sNTlRWJZE090RFT1aJt2Y97oJyjkXRwjmhKocp1ObPqVQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(39830400003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(40160700002)(41300700001)(83380400001)(66946007)(6666004)(8676002)(30864003)(7416002)(2906002)(8936002)(5660300002)(4326008)(44832011)(40180700001)(86362001)(38350700005)(66556008)(38100700002)(66476007)(36756003)(41320700001)(508600001)(52116002)(2616005)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?04Wfz/Qqj70BDKWLTozM8OiSBIJMKnOmUfbAiSptc3b0/2nRriQd6WKHp4Cc?=
 =?us-ascii?Q?gfVPrZstP9zbOwzlrCD3Dtfs3Fn6187JhsnvlG5B9+EtZVTl8zKPd1RtZS5F?=
 =?us-ascii?Q?ViGXewgW8sVpLEPD2jPK+2kvRgw5tQwrvbicvpLc0JeCs0pWjZ59hHoUKiKZ?=
 =?us-ascii?Q?2D1lHUcbZ3OZofkSDuhWhEjgJBIEvOG0x/yrKxTto2GXi4V6aMqCpqVNzpij?=
 =?us-ascii?Q?YPBqaeWnLi3VTjPB0z68mVtUuyaqgdtrFfaqDxqLF7FxMn85idOJuXI+O3Ic?=
 =?us-ascii?Q?vblZZWs2NcavZ9VMsHNSxn/iUbCnM5C3VD7McuTff8phucyD32MbR6h0HTt9?=
 =?us-ascii?Q?thMklv7bdlQS5sDlgon8Q4lmkkuExHtN0gNr+D+WPXc5PeAMb9yy5/WuVDdq?=
 =?us-ascii?Q?4OBPNrvVUyv+L9vho4ZJYJtssczuLcrnP4XgmIE/cF9vY/+IhZlOPJ9a7trR?=
 =?us-ascii?Q?41XHpLskw//1X15Ex0pU8bCiy02kVC4RYrxH+iIsH5fwL04vqr/kGAPVUxNP?=
 =?us-ascii?Q?pQzgWDyFIjy5uu/a4vzNINp5R5ehu1qA99M1SeRX6P5mOmDwKXK7gEY4y+ML?=
 =?us-ascii?Q?c4JtQwgLV892UO+LlVnw5wx9ak385HTgNCBIQKdgYdqg9+doTcxEj08j5ufC?=
 =?us-ascii?Q?gYe1FD96cD7j46YGF9iYrwdmS8ilWqp+hkjn4qYbf32+IT8vyBJKDCscN/DA?=
 =?us-ascii?Q?xxmc3IF36iU0xgQX1twJh0ZW893iF8hAg0I9NA3dnfnoNN26jiKSrtDWqwKW?=
 =?us-ascii?Q?k49OBmmWz9lkVhL0Oa/o38mMtw26PLKBPFbRlW7MNbro5T0sNjdHGdq7xasF?=
 =?us-ascii?Q?0wt4Y4oUeOjFBlzkNOd9icNv5rtcSNXBZITAqxdXVax0c2cm1bALBlxgwaqV?=
 =?us-ascii?Q?rlMQ0BsjUvLYHGrCPSMKmvDNpMHSowr8mIeJD/He/wb8vUUfYaGNbyIpqh8i?=
 =?us-ascii?Q?lJQRXRquNEIWsZg5zGU7pDAk+bixq4qBxU1Tl6VW4MzWcEkmuT6SviTVYchD?=
 =?us-ascii?Q?i0cDIdyCfeI0AQGmOMHRfEv6vtORw1GK+Axkx7OoJ4aWRZpTYcAyj+yaiXFk?=
 =?us-ascii?Q?s6fmWiuEzHe/cDoIpESIPtK/bXKNh7pg7JWTg7haN+TJix7XU4B7Cbuyg7pg?=
 =?us-ascii?Q?8oOy1wNaCIfG8pzbdEcd877aItH4diCKpO26EoiE62mdI6km5kFG1RQF+1bt?=
 =?us-ascii?Q?SU/8TR+PTSyY5zshIUKLKeEBP1WgKOwlkmxwLDUnJFuwhJ66LA+XiKG4OxJf?=
 =?us-ascii?Q?/i5EvnlUoRh1vm+YU7bwYTdm5lr0Ptur7kLYZp8hClR9OsBlgZwJB+5/id7W?=
 =?us-ascii?Q?HcYKxz5BNUidZtWTAL6Ta8xFpCmBNgMgaXA5wd/PbPfDdGX/P1iXCJDCFt+s?=
 =?us-ascii?Q?f7NsRw7osGsJc7c9MHr5cnSzl/Gw2L/yU0TcZYPLenqYDh5Bgc2yonYuWt8w?=
 =?us-ascii?Q?KpYR0RRmguGFcghs96l6b19Szvx8K04JN+n6cOOChBIH7hI4AoIBUW94vxiB?=
 =?us-ascii?Q?xpWLjABja1sf16ogszteKz89KezytB73LcUFdKx7i1nhuotv/M4R3RThL0CQ?=
 =?us-ascii?Q?WTKiH7o/oQjP4WA2xAd8KY8Tc/m6r4d5URblY25GSHTQtSL4usJ8PRr8UU+G?=
 =?us-ascii?Q?De53HoYha9uWwiW2GikM7TQ=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9572da5-0617-4158-b922-08dc26e0e22f
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 06:57:29.0288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQ5p5MgZrhlGyQjwk4KFQ5EQSkVeTjarD9xgMuMzWdwVNeFXB6BdXbnogDIlLSWVJrVH0xE09eeuEmcfgR2ozJ9PyxoSMVZY8wAJfdgsnpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB0974
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
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  29 ++-
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  21 ++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.c  | 193 ++++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.h  |  16 ++
 6 files changed, 266 insertions(+), 1 deletion(-)
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
index ca7ea2da635c..0a86495ead7b 100644
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
@@ -79,6 +89,17 @@ struct cdns_dsi {
 	bool link_initialized;
 	bool phy_initialized;
 	struct phy *dphy;
+
+#ifdef CONFIG_DRM_CDNS_DSI_JH7110
+	struct clk *dpi_clk;
+	struct clk *txesc_clk;
+	struct reset_control *dpi_rst;
+	struct reset_control *sys_rst;
+	struct reset_control *txesc_rst;
+	struct reset_control *txbytehs_rst;
+#endif
 };
 
+void cdns_dsi_hs_init(struct cdns_dsi *dsi);
+
 #endif /* !__CDNS_DSI_H__ */
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
new file mode 100644
index 000000000000..c6b9296a9275
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
@@ -0,0 +1,193 @@
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
+static int cdns_dsi_clock_enable(struct cdns_dsi *dsi, struct device *dev)
+{
+	int ret;
+
+	ret = clk_prepare_enable(dsi->dpi_clk);
+	if (ret) {
+		dev_err(dev, "Failed to prepare/enable dpi_clk\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(dsi->txesc_clk);
+	if (ret) {
+		dev_err(dev, "Failed to prepare/enable txesc_clk\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static void cdns_dsi_clock_disable(struct cdns_dsi *dsi)
+{
+	clk_disable_unprepare(dsi->dpi_clk);
+	clk_disable_unprepare(dsi->txesc_clk);
+}
+
+static int cdns_dsi_resets_deassert(struct cdns_dsi *dsi, struct device *dev)
+{
+	int ret;
+
+	ret = reset_control_deassert(dsi->dpi_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to deassert dpi_rst\n");
+		return ret;
+	}
+
+	ret = reset_control_deassert(dsi->txesc_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to deassert txesc_rst\n");
+		return ret;
+	}
+
+	ret = reset_control_deassert(dsi->sys_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to deassert sys_rst\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int cdns_dsi_resets_assert(struct cdns_dsi *dsi, struct device *dev)
+{
+	int ret;
+
+	ret = reset_control_assert(dsi->dpi_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to assert dpi_rst\n");
+		return ret;
+	}
+
+	ret = reset_control_assert(dsi->txesc_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to assert txesc_rst\n");
+		return ret;
+	}
+
+	ret = reset_control_assert(dsi->sys_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to assert sys_rst\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int cdns_dsi_get_clock(struct device *dev, struct cdns_dsi *dsi)
+{
+	dsi->dpi_clk = devm_clk_get(dev, "dpi");
+	if (IS_ERR(dsi->dpi_clk))
+		return PTR_ERR(dsi->dpi_clk);
+
+	dsi->txesc_clk = devm_clk_get(dev, "txesc");
+	if (IS_ERR(dsi->txesc_clk))
+		return PTR_ERR(dsi->txesc_clk);
+
+	return 0;
+}
+
+static int cdns_dsi_get_reset(struct device *dev, struct cdns_dsi *dsi)
+{
+	dsi->sys_rst = devm_reset_control_get_exclusive(dev, "sys");
+	if (IS_ERR(dsi->sys_rst))
+		return PTR_ERR(dsi->sys_rst);
+
+	dsi->dpi_rst = devm_reset_control_get_exclusive(dev, "dpi");
+	if (IS_ERR(dsi->dpi_rst))
+		return PTR_ERR(dsi->dpi_rst);
+
+	dsi->txesc_rst = devm_reset_control_get_exclusive(dev, "txesc");
+	if (IS_ERR(dsi->txesc_rst))
+		return PTR_ERR(dsi->txesc_rst);
+
+	dsi->txbytehs_rst = devm_reset_control_get_exclusive(dev, "txbytehs");
+	if (IS_ERR(dsi->txbytehs_rst))
+		return PTR_ERR(dsi->txbytehs_rst);
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
+	ret = cdns_dsi_clock_enable(dsi, dsi->base.dev);
+	if (ret) {
+		dev_err(dsi->base.dev, "failed to enable clock\n");
+		return;
+	}
+	ret = cdns_dsi_resets_deassert(dsi, dsi->base.dev);
+	if (ret < 0) {
+		dev_err(dsi->base.dev, "failed to deassert reset\n");
+		return;
+	}
+}
+
+static void cdns_dsi_jh7110_suspend(struct cdns_dsi *dsi)
+{
+	int ret;
+
+	ret = cdns_dsi_resets_assert(dsi, dsi->base.dev);
+	if (ret < 0) {
+		dev_err(dsi->base.dev, "failed to deassert reset\n");
+		return;
+	}
+
+	cdns_dsi_clock_disable(dsi);
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
+	phy_cfg->hs_clk_rate += 100000000;
+	dlane_bps = phy_cfg->hs_clk_rate * lanes * dpi_htotal / 8;
+	adj_dsi_htotal = dlane_bps / dpi_hz;
+
+	return adj_dsi_htotal;
+}
+
+static void jh7110_cdns_dsi_hs_init(struct cdns_dsi *dsi)
+{
+	cdns_dsi_hs_init(dsi);
+	reset_control_deassert(dsi->txbytehs_rst);
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

