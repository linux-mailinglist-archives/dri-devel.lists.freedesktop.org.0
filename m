Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A53AE4F930F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A3B10E288;
	Fri,  8 Apr 2022 10:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80050.outbound.protection.outlook.com [40.107.8.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B2610E393
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 10:33:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHVIU7KyvunlV99673Z4Nr/1gKDCW2fms4e0Mu7F1gItUZIqPpy4Kck2DdzQR3jsGevptw+y7SfbGc3GXYDZIm3VbcCw/YXrE7CfS0sYEhQTk1HVL2xMsKlu+mCBRG9fL3Chn1LiHxDBY39nSBByFcZHq0kcSGzCcfO9RI323vG7N4qV5tXtp0kSnPeJsXSaUMVsg3Zg21SWFQBHnB9tt6kn9uMgOo0J0vtFc57+YHlrjZFDpgOdI9qj7pEUuR0C+fj9ryYroMC7zRUDUh54v0PclUPs+AhaYgS+j1Q84KFRj1dKCif6F87sq2Y97RTrqovEwHgGjIkl1y6a0OUMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mou73KzW0uXaX/nUX4AVL21HLgyJpCoTh7NY5JE2aww=;
 b=TtsJv3relzYYIESASGefl/LUWCE0gPHAgCYdde3gcAFST9jkq4UfmpgyPiGSNkHCvL71rUZmeSToHEYIADob+J742U68gb0ZF4CpsB/r0o3sDkjVYZJ+L29DbseukoV1gyswnTPkbtCiSzkO9OzMqE/Spi0u47G5T3ovasvzwfvBX49FzJpEFknwclCD8SF6r43LSdm9aAKuwPhY8V0lmD/yDOlL4JmAPEHluLRBc6C10nFvF0SoxcJVegIns1Anf5OHX2lYenY4JrALunxqSrxrCfwZSgC99PhKdzizN+GxHCoFJbNlp3FYeF0lulpwbY038oDdb/qyDtQbudAwjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mou73KzW0uXaX/nUX4AVL21HLgyJpCoTh7NY5JE2aww=;
 b=LDtt6XrNrWrhUWmjwrwlZXUv+bqkOy11X0EqVRQZD51Bk1kbpRWk4sTXSGHPSriTUyr3xU9lxyEQvdQ0QAJnXe1REYIoiCYv2bnJ7YklJ5h7sguLTGyGKDMkp6V61i7L3lRvRKy9aQxxPlUb5ERrx85NPY0aumP9X9mNCEJ+EJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 10:33:18 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430%7]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 10:33:18 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 4/5] drm: bridge: dw_hdmi: add reset function for PHY GEN1
Date: Fri,  8 Apr 2022 18:32:27 +0800
Message-Id: <ab85938ee3f3b4a9482b4e2414165041d6a4c62e.1649412256.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649412256.git.Sandor.yu@nxp.com>
References: <cover.1649412256.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To DB7PR04MB5450.eurprd04.prod.outlook.com
 (2603:10a6:10:86::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b92eda1d-1342-4852-2e33-08da194b3273
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3405:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34059269DED6E77A982971A9F4E99@VI1PR0402MB3405.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VRiJ46s7G9tMMRzJBFLuahvorIiK/9ywLP8U5qwbmb1yk8F9hkNIIFSXtYMkFMUGAO4GXZsPkMCUtagS1OGexzsK/rTbv53t6NjNxN79Z8e2oZprVSKv2o30PGS7ouPNGmsz1pN/K63i1Os7EVMszJTiWam/Fqbh8QPlNrySD0NH9Us+l7Ky7WOkErdtU1lYaA7gKecVos/iMljHFuagh0jRsdgwZ8mN/4yUzYB9I5YVkA1J1cVXV8PgV5zyDEV8kxu4HzymfVAlnjy07n3bDBIu6qnm+YC73e6n8fkMZlaV0Bdy4pYr7MQV/Gim3+laja93/qhdXrbiSnHB6EJevPy8S1qhJj9L8M70URcV1EoOkM1FteQJ+cpoy6JZcvxDU1V8lHto5O1SlsulXkN+4W/ZwG6hsjbBXA4zSPWaWj8bZAGSUYRsBmnG5IEEo4VCzzCs3/EtTcOUOkmT/JkQ5LlE7Yy2nuOCZVIiPL995rs7dsv/5JCB5C9g0FrvkWvDI6E3LH2F1h9lGmOmYZb2+LZXZCyF5H4phwI5KdNAuv5uoT8VundRz8rW4vu7H6Ee5pwFxhcuaDmJTejtGKSDaoQQBubJT9HfGNxsU6CWC4o+GqIKDnQk2r10BLLTESIHaWxdpiKkyHE+vKHDPqxLrXycpEKxKGIHcWQqSUtHz3rWlYcTqinRrRk5f8PP2lHznsqmFgejeCa+shTntcWsSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(2616005)(52116002)(66476007)(6666004)(83380400001)(8676002)(86362001)(508600001)(66556008)(66946007)(38350700002)(4326008)(7416002)(2906002)(186003)(316002)(5660300002)(6506007)(26005)(36756003)(6512007)(38100700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jfdY9Hlz/iPk7bCtu84/h/LrxeUMU47NKbeZsHVEzbMi4XsUO1VJGhT16CyK?=
 =?us-ascii?Q?Wg/x9gN8tfbb5Oci/MVuqFap9hGS0UScKRbaJZDWgfzIP6FcOhjBS5dyynw8?=
 =?us-ascii?Q?lLV+yjiD6KIfBec+lrYTk8Eo0TvvXbxyIrn2DRlaczv2e1xzazdVlnrkvBPC?=
 =?us-ascii?Q?kDW3wdafViRBH3/nDntG2xJR/BfGd1i+pyTYK3zragjykUrErqkGOMtB24+E?=
 =?us-ascii?Q?SZgo6GTEKT4CdT734y2zHV9KZ/rDa2gtRG3BggF4Dus2uzxwiI3+MRqbskz1?=
 =?us-ascii?Q?0becIPXEQ1QjLEbxgb0f0EmjgXOwE6NKCN8IVkRohe8+tgcaBKnWTzaGIzjx?=
 =?us-ascii?Q?NZwX25XMUFdERDt40UaUUXwaqUWFYC9KemWMJgCZjHLCRuTxJQEJLwLGmJS8?=
 =?us-ascii?Q?kJx1uEO+xkvSWFE4si7lbvpA6rb3NmUtBt4KoxKFFnhTmV5LJtTbWRNpfbcx?=
 =?us-ascii?Q?0EZ9S4CrEY0r5Hqh1mtWnMJkShzslPPEjAeOwY2CUAC2uj3TaKiq7yBR4/bV?=
 =?us-ascii?Q?edzxAN2qT6aABODBEvfsYQKLfqlEhdKHchSo/iTMua16WgP6qRbsULFyOmOY?=
 =?us-ascii?Q?jPZn3EchOcRMxTtDqxJYsps2u+7uPPRKO31diAGeUhsweytYUAKuOFa0lNzf?=
 =?us-ascii?Q?VUDeTxJT/9JcDCsMdILJY4/hNnfYJcjQQq+u1dYzhwhxkl2MuHm6LFfLoivM?=
 =?us-ascii?Q?hPSKuwqNwuHJQp1c+eqyXwoP5AAOuVPQLsX0z6ic/pa2e9JIeWifk+Ezqm3a?=
 =?us-ascii?Q?+9GiZCpDVfAavUrxyqxROTc0fPAxOa02BDLODjE+8yhTNY4fVeqXim9Cv2FO?=
 =?us-ascii?Q?zZP7wowZynapu8L/bzpZ2u50d8dqtfxCkzVSC6L/6/CjGu5puFbHcW/7IYHF?=
 =?us-ascii?Q?37gIoSHYlNsD/H4A7T1Pa64wbYXV/RXwS0z+3e5eDNU1nh0uk4vu6DEaJFpx?=
 =?us-ascii?Q?pQ1ANmjtRxXSCrj40qdp7VxbNMXSk9TaCJ8EBO4QeZrGmNJ5zGXKbvHAOnih?=
 =?us-ascii?Q?Y2iYt8l7eR3G57CjflZ9fszjpnVv8wGt3u22NmhiuEMXWbDZBqi2wfUbija3?=
 =?us-ascii?Q?EdoKlUlpqJQ6E7+Uelb0xpfaexBYiUdO7Vsb7UHtyn3XjmBzmngWcb2nBSAo?=
 =?us-ascii?Q?ROS5jqaLxoeXPScP9Stouv4tmq+2LvUFSuayTx74+C2xsJSRN5a1sHntRK4j?=
 =?us-ascii?Q?+M17LXPTUNiq/YK0WO9Mv2F+8mjf7XQy/T45UxkXNZb5kBQ3A5G+O8bR6oa0?=
 =?us-ascii?Q?TFpnEOB8qBPAhHKF8Pa9j/ptw2TVvy/wgZxLZ016PlRJxk7KbhKAkE/X0jSk?=
 =?us-ascii?Q?gHTN6ss3zzX5IejNNjUhRIAWYeWLUevwBZxVBibQPqp1uIVPZNpMId1tHSAY?=
 =?us-ascii?Q?3tr2pSiCh/HK3BWSUb4sdtRCQK59Ag6T2QPdFg8iOAmsL+5qkFjeiqZpoM2h?=
 =?us-ascii?Q?59Qd9K3T0ak/0POzhj3RDuIy30EJy2lR2X0DPRFJIbUxynUW56Y3x9+t4XdT?=
 =?us-ascii?Q?u2efENcgh/sgwi9lxVUpRzIsIjgyw6RryfIhHxWocl86sJqmnxpfPMhvCc74?=
 =?us-ascii?Q?8VZkKOybyJLNiQN9G6kwLqnfw8APWRe3BybphitQl63WJXAvBxuiNrxK8RDN?=
 =?us-ascii?Q?dw/gXOXC8H5w5W7E3mmcUAJf76QBcJKGCqvdtaRPyBdfIM1ZIqgnBfUOMSqL?=
 =?us-ascii?Q?8YM7fvMunozBLwcF9St1RTgzzX8tCDYhyLkGurpbxPwlpfoI/NMoCEv8URFt?=
 =?us-ascii?Q?0Y6PXAoqjA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92eda1d-1342-4852-2e33-08da194b3273
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:33:18.7872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ce7ulaSeq7hg1Dfjnahaq8pAr7SHoTp+sfXDEQ8mXFfaWxZBVrPjIVWoXiVws3nPETLvuv5pRrxdsP4vUnSFkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3405
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
Cc: Sandor.yu@nxp.com, shengjiu.wang@nxp.com, cai.huoqing@linux.dev,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PHY reset register(MC_PHYRSTZ) active high reset control for PHY GEN2,
and active low reset control for PHY GEN1.

Rename function dw_hdmi_phy_reset to dw_hdmi_phy_gen2_reset.
Add dw_hdmi_phy_gen1_reset function for PHY GEN1.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 14 +++++++++++---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c    |  2 +-
 include/drm/bridge/dw_hdmi.h              |  4 +++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 5a7ec066e37a..13270d96e5be 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1369,13 +1369,21 @@ static void dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)
 			 HDMI_PHY_CONF0_SELDIPIF_MASK);
 }
 
-void dw_hdmi_phy_reset(struct dw_hdmi *hdmi)
+void dw_hdmi_phy_gen1_reset(struct dw_hdmi *hdmi)
+{
+	/* PHY reset. The reset signal is active low on Gen1 PHYs. */
+	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
+	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_phy_gen1_reset);
+
+void dw_hdmi_phy_gen2_reset(struct dw_hdmi *hdmi)
 {
 	/* PHY reset. The reset signal is active high on Gen2 PHYs. */
 	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
 	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
 }
-EXPORT_SYMBOL_GPL(dw_hdmi_phy_reset);
+EXPORT_SYMBOL_GPL(dw_hdmi_phy_gen2_reset);
 
 void dw_hdmi_phy_i2c_set_addr(struct dw_hdmi *hdmi, u8 address)
 {
@@ -1529,7 +1537,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi,
 	if (phy->has_svsret)
 		dw_hdmi_phy_enable_svsret(hdmi, 1);
 
-	dw_hdmi_phy_reset(hdmi);
+	dw_hdmi_phy_gen2_reset(hdmi);
 
 	hdmi_writeb(hdmi, HDMI_MC_HEACPHY_RST_ASSERT, HDMI_MC_HEACPHY_RST);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 5e2b0175df36..2860e6bff8b7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -135,7 +135,7 @@ static int sun8i_hdmi_phy_config_a83t(struct dw_hdmi *hdmi,
 	dw_hdmi_phy_gen2_txpwron(hdmi, 0);
 	dw_hdmi_phy_gen2_pddq(hdmi, 1);
 
-	dw_hdmi_phy_reset(hdmi);
+	dw_hdmi_phy_gen2_reset(hdmi);
 
 	dw_hdmi_phy_gen2_pddq(hdmi, 0);
 
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 2a1f85f9a8a3..70082f80a8c8 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -187,9 +187,11 @@ void dw_hdmi_phy_i2c_set_addr(struct dw_hdmi *hdmi, u8 address);
 void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
 			   unsigned char addr);
 
+void dw_hdmi_phy_gen1_reset(struct dw_hdmi *hdmi);
+
 void dw_hdmi_phy_gen2_pddq(struct dw_hdmi *hdmi, u8 enable);
 void dw_hdmi_phy_gen2_txpwron(struct dw_hdmi *hdmi, u8 enable);
-void dw_hdmi_phy_reset(struct dw_hdmi *hdmi);
+void dw_hdmi_phy_gen2_reset(struct dw_hdmi *hdmi);
 
 enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
 					       void *data);
-- 
2.25.1

