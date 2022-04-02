Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534394EFEF9
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 07:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F011310E59E;
	Sat,  2 Apr 2022 05:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2050.outbound.protection.outlook.com [40.107.21.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86E110E59E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 05:23:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKIYkFYmeQrgLGTyMCgUO9llmYIyDtqP2FyYIu6ksqA+AVebptbw+qEptyL4W4hR012dAJnesWrOGkOz2hn3q8RTSx1ImG6tFSwi7Nnf0bMx/JsyalV7Pv3KvM8UARcZrvUIpgqGkOh2EBtlJLhUwb5rCIvuoqhYgzPxah3rzfcvTMrbfZ1wBM6OrAt/ihLtjCVzRoYN45i1PEuYm9Y5uXpPfJGo1QwvhtMw8CzgX+nmhQASfnm2Ya2SG47mNeoE/NnrUK+QYLJmw3bbuajtxnZ5nWSRGD6TrNNIe1bejGuuu9SOYlpCKWF3niAZW2iXTSDhAUucRjzVpa8b7KHvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjK68ISxlPtPopikQN4Q5k2cGpA/Ce2C8IvfLTxH7Z8=;
 b=fL3kTySMHJI1CUr7CdKQIj07qaxpsxrNga9P5SuclkNHqgKpO7eaD2EznpoVeFmfy4NPquYwocgZ8d/bTsTSW+m1sfWG3RHpoOu31wPzaRjE39mdXSUiy4z5ei4jGq2uep/cv65Uc16M3CDBhaOpZqFEhjcdVWXshjh6+V8C0j/eEUyXI8wY/Yfl0OojP3eIIt5G1Gkeq+LT3IfOvsGFnJ0w6Heu+pG4UWQACNTpSemuBSqyg8yJA8dLSviHSu+ZCReko+CfJ41YHoCOS599JyYn27AyTlmEsjimo+KU0Pq0NEPHbcTOz11o5yZkVW/aHtzr0aG+pA/5jq/vQh0lLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjK68ISxlPtPopikQN4Q5k2cGpA/Ce2C8IvfLTxH7Z8=;
 b=ee6DTM5IurD6EdCs31UVSFhP0sS7d1jJyUOt2DuN7kCv1kdxWLDm9kd5BjEzR+fEqI+RV9n8GAAVVrxvj1AFOu7eWPIpUdtcFsrG2JECT7Hpaq3mey1D3Q5uchZN0dWeSdVQZe8l+qN/jSenuVxsuDizPdcdeBXc5mg4rtxQLNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8750.eurprd04.prod.outlook.com (2603:10a6:102:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 05:23:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 05:23:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 resend 2/5] phy: Add LVDS configuration options
Date: Sat,  2 Apr 2022 13:24:48 +0800
Message-Id: <20220402052451.2517469-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402052451.2517469-1-victor.liu@nxp.com>
References: <20220402052451.2517469-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb170a2a-e24d-41e4-47ab-08da1468ec2f
X-MS-TrafficTypeDiagnostic: PAXPR04MB8750:EE_
X-Microsoft-Antispam-PRVS: <PAXPR04MB8750B284CBAB99D962AD3B5D98E39@PAXPR04MB8750.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4nWe9kKPUW6VPGar3deADfRxUat+z+/PdA43NtF53aHpnSt/0Ag11OmzIG0VdKI3E2DSj0RWbVEe+NOkpocYuyfOnSLE5G3t9xN268FxNiH7VwrWVQAtVCcfheFcIhEF2XBWsGArV5r5vEaU4GG7ssKRsqh/EA4gVMpiOQlk08RI1wuZdCo01WNGc1RvPASpYzrubnQWQ4SBDCpLMz4ZDLI1HjUEttHFizM4V2FOOY+K9TLagl3ywfwa7/wtPLQpNLXPdBx67cKMCOY1s5ctmbgvYpOPen4aIgZ2wyb839TQsIhF2X5of2gvUb3UKD5QM0WEWDPivu+ZifmmgGXQdWyCi9Qb+DrFJqnbO0+hGvpX1HKKkxOCKtcOsUWtPzm5wnHKyFZT+EJ7Zd7UtK5TE3FU/Y+VjbuGu3Nza+Gl3C9ck93Q+Io79FZ2afq2WmpS0pBhij9apoxvWM8sN89WwxpZ74Salu7FqcTmi863xodlXtz1ysXExpelWow+DyXTX1irr5DAFuXAn0GbGkXIO9HhT7R0E5fen14LSVrVJ1CON6leD6Z2alvXKca3kAzjjaHTRTifGAMPS7Xn3dBtQsfpAoSx69+DuqNfExaCRvs/V64vQrYNQkqeccavt5QhqGofiBX8Skj4GF0f7bb+kVp45CkWs/B2jiF0zBsYVJTsngLNSVOLfgXcMaoVV9/PaUnpB61XdcnfhIN/4g1Zwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6486002)(83380400001)(316002)(6512007)(52116002)(186003)(26005)(6666004)(6506007)(1076003)(2616005)(508600001)(7416002)(8936002)(86362001)(38100700002)(5660300002)(38350700002)(2906002)(66476007)(66946007)(4326008)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QjXNZgBNGr0QboPSXbqZNGfqbELKnaAt+DmlYqWPfbGJvEN1enYwIxzFl0uN?=
 =?us-ascii?Q?YHKhhH/VJPd8AzPlX/NTY9ByL/XHcny4QiDQHNzojk7nlc4sYjZCRojp8ARE?=
 =?us-ascii?Q?uUscR9JllxKz72SFTuV0s4zq+GMiVcBEMbfogZtG6+NN8qVI2CmBrO5tt7lD?=
 =?us-ascii?Q?n1RIOrq4U6Zn+jrC4vnlmibqBQddbuYsyOBcf3aDeE6sgdFk3EOtA3XYHfS0?=
 =?us-ascii?Q?QLOThZPezGisiNKlE4Xh4X5wQQfgMM60o+eA92LeOfXFjEAaWBH+PZhcHL7x?=
 =?us-ascii?Q?iPV1VUs7gH8y5TyCrZgNf5Nylu/PUcXABwKqtgqxxWgdi15CU/n2SAGNHCNU?=
 =?us-ascii?Q?XFqfz5s13NzlSwy8G+AqjEqJBM+iOB5+maQOvCQaF0qi+377su7DzOxar8E5?=
 =?us-ascii?Q?FNRId+vguAgvDvcAKjBIouoiJPm41mws4X0PItaq8GwTUfCFqXZ4ej7Morh2?=
 =?us-ascii?Q?g/HhoBP1zuotGLpp+29nH6y/+zk7HjualvRIonuaazbhZtSxB16k3Vifidcv?=
 =?us-ascii?Q?CYXzPAhZjTQUHHCE3JmuW93FgZq5DKc3IzGS8c+XPJTpHB+jcKsIYOavZOg0?=
 =?us-ascii?Q?+lKI+zLkQ6kZUYNFSdxg1YGsrA9hrMRSi0ZqIcq9e+KJMbKWuoNvRFTNx3qI?=
 =?us-ascii?Q?HqHnXwpDUqQRfN3EOv6ria+0wrrKp755xhUrkegkMKMWEtoz2iCnXLZTZiMm?=
 =?us-ascii?Q?KRNsEsOAXD5Sf8UsopG93T2jClVwmsXx1D03p3jaWwHpDcI1kftylNLbFz46?=
 =?us-ascii?Q?wSArfhyXNXLaPalt2mfwVjaPg03qCmT2zVC9j3MXWwCKvAjM0UxtVBrsfo2e?=
 =?us-ascii?Q?Uix7qXAdnZOGMUJztCJser3oiW/6+RkQQ8TsD+aAUjH18YRXgv0s3kMjnw1S?=
 =?us-ascii?Q?fce82sVEXjokJRZuZRO+aGEs+zFk7pgmeC/HEpGP7k0wC4+N44Iuq1GiuwV/?=
 =?us-ascii?Q?r7NjWg8AqcmahPdTdU6hm/+3ovr1MuyuG4Y7gBc1EoJAnBpXw0ePDC0XfLy2?=
 =?us-ascii?Q?dc0DyoPvKMRnbCP4xSSpJ6lLvMXfKpRDdlSUOb9+nyT4Rcs+N7pRyBIBHS6x?=
 =?us-ascii?Q?9OK11tyo93fX6oqLWfbEUeiUls5fv2ROLpV54QLWgmTYAUMZofJwCE2+VmrO?=
 =?us-ascii?Q?KNJutwsOf9MwMLcho0XI643zFL4vf4HbYqF/Up3zyB10NnGD+S6hL+vapY2V?=
 =?us-ascii?Q?rdPnpAS31EiyJPj5q3a/zCRDE8Z2ld+Bt0YNM6LdH19tHwp3WKGW827n71WF?=
 =?us-ascii?Q?FtBCtBu6QJAm/EtcM2uxIEmvBD1Z+iRWG1C2A/fHpRPYRwQrdUzTV/Kv1Wsq?=
 =?us-ascii?Q?F+ClAL3jKpc4tMYhdU8/iArBs2rG9KyihRbQ6pIyruhyGGM/pmzQIOnndV50?=
 =?us-ascii?Q?xMiP/l4uVuWzNvSEFhsqVhzxseLobJunmKxgetbxb+rS1t/3jyrWd+sL3uma?=
 =?us-ascii?Q?H2RiLEAGzN8OsvMFuLInpjBb48dXT4H9fIey60JVRSSy9Kj+G3QHPwdj9xqY?=
 =?us-ascii?Q?5tg9OnMCBvHq0CID6brDNBA/Swf05zOX5zA+VhEkBLTl9v3ThqkgZUkIX21N?=
 =?us-ascii?Q?rM4xuX8Z0JP2/GquqBAtglvgx5wSfPlCoANT6VzEtMMKUkVUpeVpEQBF0OJe?=
 =?us-ascii?Q?EGIN9PKz2g8PnzmlhjZuQSDcegq5P3fIuiagIOobR1eAmB7qTiC7sf17QxOK?=
 =?us-ascii?Q?eiI2ecaePvA8BEgY0GyQrooTEK4Wd8TwireNhoUXxID9m9GpvNK5ZBLCVwum?=
 =?us-ascii?Q?cF1uDbYa3Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb170a2a-e24d-41e4-47ab-08da1468ec2f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 05:23:30.1147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+FwNGim5uGBc6cZIv98Y2XxKrB3D2yGWx1F8VzE9J+ZIDym0iLraktk3TPSXTviSJ6B5dQ62c0mMoVJ8Fz7eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8750
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, narmstrong@baylibre.com,
 airlied@linux.ie, s.hauer@pengutronix.de, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, kernel@pengutronix.de,
 robert.foss@linaro.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch allows LVDS PHYs to be configured through
the generic functions and through a custom structure
added to the generic union.

The parameters added here are based on common LVDS PHY
implementation practices.  The set of parameters
should cover all potential users.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* Rebase upon v5.17-rc1.

v4->v5:
* Align kernel-doc style to include/linux/phy/phy.h. (Vinod)
* Trivial tweaks.
* Drop Robert's R-b tag.

v3->v4:
* Add Robert's R-b tag.

v2->v3:
* No change.

v1->v2:
* No change.

 include/linux/phy/phy-lvds.h | 32 ++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h      |  4 ++++
 2 files changed, 36 insertions(+)
 create mode 100644 include/linux/phy/phy-lvds.h

diff --git a/include/linux/phy/phy-lvds.h b/include/linux/phy/phy-lvds.h
new file mode 100644
index 000000000000..7a2f4747f624
--- /dev/null
+++ b/include/linux/phy/phy-lvds.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020 NXP
+ */
+
+#ifndef __PHY_LVDS_H_
+#define __PHY_LVDS_H_
+
+/**
+ * struct phy_configure_opts_lvds - LVDS configuration set
+ * @bits_per_lane_and_dclk_cycle:	Number of bits per data lane and
+ *					differential clock cycle.
+ * @differential_clk_rate:		Clock rate, in Hertz, of the LVDS
+ *					differential clock.
+ * @lanes:				Number of active, consecutive,
+ *					data lanes, starting from lane 0,
+ *					used for the transmissions.
+ * @is_slave:				Boolean, true if the phy is a slave
+ *					which works together with a master
+ *					phy to support dual link transmission,
+ *					otherwise a regular phy or a master phy.
+ *
+ * This structure is used to represent the configuration state of a LVDS phy.
+ */
+struct phy_configure_opts_lvds {
+	unsigned int	bits_per_lane_and_dclk_cycle;
+	unsigned long	differential_clk_rate;
+	unsigned int	lanes;
+	bool		is_slave;
+};
+
+#endif /* __PHY_LVDS_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index f3286f4cd306..b1413757fcc3 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
 struct phy;
@@ -57,10 +58,13 @@ enum phy_media {
  *		the MIPI_DPHY phy mode.
  * @dp:		Configuration set applicable for phys supporting
  *		the DisplayPort protocol.
+ * @lvds:	Configuration set applicable for phys supporting
+ *		the LVDS phy mode.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
+	struct phy_configure_opts_lvds		lvds;
 };
 
 /**
-- 
2.25.1

