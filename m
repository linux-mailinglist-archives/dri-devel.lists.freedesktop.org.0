Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3305020A3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 04:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB00710E2FE;
	Fri, 15 Apr 2022 02:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80085.outbound.protection.outlook.com [40.107.8.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEFB10E2FE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 02:44:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kux1KD6m61U//9JQ4eYSf3voEM38mzLX372gTax1rmdAXOwOcq7U0pTR0gQxUyUUbCBIqbtTaaLEn4qIBGUhZNyLQQWmZcfwY2998NNsHKdays1flly/YGE6vs4+MUNJDw23lg+ecyGgqWalpfWR7sAolvoBNRCVfTL/4py7ahpVDvsN3Y7EfPHynimpJitNdiBwSyNGpbtOolbJfu6bWC/QZ9RfgxnmjGUzTke0JrRcqiUhcMiMYiwJt2MwTSUn9nOYc4nvLW5cFcDVU7+B19AyHCx6+rNFdQXOB053bYNPATmchUF+EN/CFnnZT5MMQrvr4ZkXQhzqmpdQxdirpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGiOoaay09Uo4oeYBskqha5KC/AD+waHnh7UzjMDDwY=;
 b=T0OeAHYXWR3fSxkY1x2MbBxyfdObjNHRqSWw6nIyKsAO++Hd2qd64cg0aPXHebk3BZDJNDtzZoQD/akBHaonKqjTPPMz0JLbriB7DaS7Swuu4qtHyGC0Nv8gBg/79eD565QQrVOG5gPbvj/Pa9sFbOcBrxFsRhEtuqYyInTiY/c8RchSBc01pnpVP0KXRDTyI8uFX8Bn2umIuM+hN55qnn74HI+lScdu22WjTucfng+1Rj9EAzaGTxEe4sPZvydlr4ijvTWZv14bbmOHcqi0fzP0GLfeIlaXhbqbjvDd1eTBr9nrtoDLnCnpu3OwLkC3EQlmcl7aP2bmE1PC5tXNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGiOoaay09Uo4oeYBskqha5KC/AD+waHnh7UzjMDDwY=;
 b=EbkJPYNapu7WTsK1zFleu2vEXa+Xh0MjpLT8uQVXxvi0asjGaaCOPe1YjetXsPpmmoUnpIkVNWi9mdLKfeM1uISBmuhxsZvwb1mmihfHWAoApogJZsm9drN+zu3HU0S5HTT33CGu5Kzey2WyCATMxxsNQne/X/ogr24SYeJoH7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by DU2PR04MB9132.eurprd04.prod.outlook.com (2603:10a6:10:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 02:43:59 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430%7]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 02:43:59 +0000
From: Sandor.yu@nxp.com
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 3/4] drm: bridge: dw_hdmi: add reset function for PHY GEN1
Date: Fri, 15 Apr 2022 10:42:49 +0800
Message-Id: <e0b3be2d63fe3e95246fb8b8b0dcd57415b29e04.1649989179.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649989179.git.Sandor.yu@nxp.com>
References: <cover.1649989179.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096::23) To
 DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e097da42-00e0-47c6-c549-08da1e89cb1e
X-MS-TrafficTypeDiagnostic: DU2PR04MB9132:EE_
X-Microsoft-Antispam-PRVS: <DU2PR04MB913218A5DD983EFD1D26C0CAF4EE9@DU2PR04MB9132.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jkIcF9kvPGhlN75l6psSFcLqiOIuJx1CunDMWnxViFZoWdsOZaIvrOodIxqUyXMadHo0nFcs28I7vccDiP6eox/ODPo7qauGslW23FuYZOVtsGsHJSv7Cr2IcSYNF04aj+3NMPlhzyhMzcTRRpFjFUGEoZOkR70FRtoxAb1I0yLiFeGjIR6GaxlMwctfBr/TJPrUTjCSuoZ4z10EUCPBXWv1YBYdqZP48rZhc9sjwIOge0KcxIfQSCFrI2BBMk9t8cq5Xt4uBGYkCJgSHQd4+sWJsWdsAQowGAF6iiayAG2+yDn6i51500R+RdxM264dfWi+eScntQJjL+nSX1zHzJXB4kRU2yhMJPQtgw47Am7Aob7QXcR5Se2/X7TIRO68gXydPTj1ebq4fnS81s+O3cCHaHWGjUXyq5Je/07u4maw0qlyMbwKhNtU9e8tZTStCV6DWxEcow1cFLzmjM8zyUbaDfuUhfxts+DlESI38ByjQSL/HYXbRKEB3SLNz3sI6EeuZX5z3HEEXe10ZX7VnuTbDTo0hR+R6yORe2f8wTcYXoJrPhxhtq+riyT484nid9Ji1OQfmpeRcXFlciReRHJIK2Usx1/mG1DtFdnvUXNwlxUN0/YzdidJbdwkaJReYlDLk9C6THANeBCQawc3Rx6BCM/hYoRHHFfF7kHm48mfAZ6aWD94qZt/7W7vwCTv/JqCd9gfbu5bOD7R8YQMOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(6512007)(26005)(2616005)(9686003)(186003)(6506007)(38100700002)(38350700002)(86362001)(66476007)(66556008)(66946007)(4326008)(7416002)(508600001)(8676002)(316002)(5660300002)(6486002)(36756003)(8936002)(52116002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hj6Ybqhwp9EZ4KIw8a/3VBmrAxB534U5RafXpfGGmE65Ei/9wllj/ThSqOsb?=
 =?us-ascii?Q?/tNlYnKRG3vzT/UrAbPt34u+djq3ptOlz8B3+FyA8jRdJPn/8pDRjtsq/jrO?=
 =?us-ascii?Q?KlcyW94pZZ+rx97GxhbiA0oEeis5SPWRzMui9s6x7Wg22sVgokNOEKFeHCq4?=
 =?us-ascii?Q?cBb7xcRBE9HlBCjjDkfYhN3ATvFWLTcSu8CrJNWe0dfguqNZk+i8PnCGQp/n?=
 =?us-ascii?Q?8LtMyQJmQ3Cta4Zw0rCMIkDfDHBz1Zbow6ZQdXrkfv995q7eH/1ZXIioFUaa?=
 =?us-ascii?Q?hk3oBhgghxw39yGivGkFGLe7eKV/tStDl2oAP5p9y1t90l2vy/j9yql9PJ5Q?=
 =?us-ascii?Q?JRWiKpk267lGA8MotUMx7NcIIitMRUb0SuqIGlsprWfmLEmQ0tAHtY/5uOTM?=
 =?us-ascii?Q?jYSl4p6PjpOSNl9P3KnmldeLqp3O8zKPN42WoED8VQ8EjqmD5o6PHHrjiFYl?=
 =?us-ascii?Q?Xdqg6WtC1W5R+BPshlM52iavYmS0e6TRxTuvXlyl1CDYm6QrzJ1m7BzQHA1v?=
 =?us-ascii?Q?Nz6QoQp9dot0QOnYxBpC7KDKAqkypTAf9wynjSKCKBJ30TBb1BkIGxn3B+9T?=
 =?us-ascii?Q?YX8vGNyVVUB+02R5gAKTNj8dwVKo5iTdomyDeGuNE7RxjltPE7TLdQ8y7bdR?=
 =?us-ascii?Q?FUXP5JhmW3XTB3Buh06uz+9CRz2H2NDoa9wSi1wqbKDHPIe2EcmJYKmuzeXJ?=
 =?us-ascii?Q?CapIQYQBVKyt4OSOGSjH1Ifu4qFl7ZFhXO9QCk+wnaaHV41SAWXB6g8VjEkH?=
 =?us-ascii?Q?zcuCp6tjDYtp1o/Nsx5q6oKDNeyST6MWc7dJiYkRZya8tjNd3rhZKfVR9/i9?=
 =?us-ascii?Q?H5vVoigGnKmFVBqaDGNRgxn4NY0ukS7MH+LrMR98hQY0A3Kc3ItV6167gUYd?=
 =?us-ascii?Q?PzL8vr1GN7s/bZU7gkTVbwEJQcFH8np0B2igkfUTcPHXz2W1l5rg/iQhmaKO?=
 =?us-ascii?Q?GS9H4yY+esVi9MqStA6jiwjj1YEhjpvZELQ5FMYsun19UDwX2Wo5f3y81zUL?=
 =?us-ascii?Q?chE4sCfYzccZICzbvOIsK30HSdmtUviYJcYnWVAiKqP8ZRwKIl8K9KfUBhs+?=
 =?us-ascii?Q?FDOqlFsDtDlitgjAbZLAA+AxkNEwM0F8Cv7VpTfOvXe7EdQrqhE8dkt3FJN5?=
 =?us-ascii?Q?t5q+r6dJUOu5wzPHJvUB1eU7W5/O8ch8PqOhUdieVZz5ORPM+RXQ+gkFj00h?=
 =?us-ascii?Q?j3TEMFsS6LsQJnjhmnGF7csZapfEB7S1hLKk8bZ8BvC2UnF/HzOo8NWBzjZ1?=
 =?us-ascii?Q?+dKSEXyqOAYiyBKh1sIAaQ0gsWBS8GeMUMDgUiZiD4KHIreyrDPaiGYtXidc?=
 =?us-ascii?Q?PYySpkscUPA3aomnVl5DZKvQpzgyn6/IeBSFdyCaH8xdHXO4HH4deFpJAawM?=
 =?us-ascii?Q?zgCmpV6ULB+AuAuuAoz4fnD3pSa4jVqp00JCnZPOBT9F8R0OLYjj7gz3/WLf?=
 =?us-ascii?Q?rGSQOLAMdvQFcJw2VryTktA2tThhfJpUFdNzqEtLrhKQzLlXj5+23ohwBMXZ?=
 =?us-ascii?Q?b300/iFIVn9iv0saBzlkNrmimkLXOjBzcz3FDh9LJz0NhYYfh/0/++kIOm9d?=
 =?us-ascii?Q?Y+AIA7EhOFbymkF9Rx83af4o9QbEG1lm/akpsoTPIH0FqhXTGyDIn+Fzrxtj?=
 =?us-ascii?Q?EVQvrBHYsW6ep5EsBxxyYYRO9GbNysJNC3Jfyigj41RhUBUdHZ9IYb3lcK2U?=
 =?us-ascii?Q?0V9S68E9UzFqAWKUN1cY5v6C0lEerzuFIuWjaAc5ky2J6L19QlTN/bSePEqq?=
 =?us-ascii?Q?UEnK8G0sCg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e097da42-00e0-47c6-c549-08da1e89cb1e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 02:43:59.5678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP8Mo0Rx1oDJXOEsjgsiNHwKIvAczb4NnO6+eVFPazQCuDI7CU0gyHNDdmayLc0pDo/9hQe1aKYg9pxqd9R4mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9132
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

From: Sandor Yu <Sandor.yu@nxp.com>

PHY reset register(MC_PHYRSTZ) active high reset control for PHY GEN2,
and active low reset control for PHY GEN1.

Rename function dw_hdmi_phy_reset to dw_hdmi_phy_gen2_reset.
Add dw_hdmi_phy_gen1_reset function for PHY GEN1.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 14 +++++++++++---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c    |  2 +-
 include/drm/bridge/dw_hdmi.h              |  4 +++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 312500921754..ac98605a6811 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1374,13 +1374,21 @@ static void dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)
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
@@ -1534,7 +1542,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi,
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

