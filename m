Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9C86211D2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B9A10E447;
	Tue,  8 Nov 2022 13:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9297310E446
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 13:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzXDd+waPn5e9MiyTYJ2ufTsAfy2YYOkuyqngfdlxhdFC2aWWOzatcJqQAykKGMVW4ydKcj9YAYC6LKcTVqCq1EmvLMLM2zyZ5lmKdP3R7Hc1F5ontDmddiOjTVoxx4upxCgvrusbsv43YRR+PwFQO5VmyfKQ9hLIdr8YfDxNSYnzDzl4EldwHgGHQRMrFieqL6r6GFLnmgVyYL7LzCIBgdf8zJxUUrceEeQrwcl3zFkcPvrS0FxC/zf2UxASqJeDJDDv2HJC0+F2XEMOtck6HCGlEOn8J7mvCiMXZbjMQETVHy7nr5sqA5S9VXF74HQ+JSpq6tmKIcsPFAXue+3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CRpIgsQQkaH4obCqK4SnH8f9uaXFh2mJu+XXIdidw0=;
 b=QjwRD7UJ0xIy+LbdN3wg5iy9Qyp3SmSPd/inLFQ4/Tq6KlV1oGnyyEzgS7/wzq/eBqKBQplDZfbulCKUxJWROZRKOiMZJDeGUPIXIEO+qkDHZXGXQEfl+AoZgQNif+N+uQy8pB5pk6NuIVWloxeGI6yFfqacgXiBI4m1YCM9dK1CldZHVnBY6zpkiB7dmtajqzh1k3jC6ZDChvqszaMJmhJ3ZBuA94b6IMqy3LjK4KH03nK1nqjHt0QjPg6eUZfKLXUdfr8aYURV1z0YouU9Wl8B6zpse5ehBa4UgA+6/el/6OKu5JdAWlMdcyRjGrxH8aTa1ueOYDF32NrLF5BbtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CRpIgsQQkaH4obCqK4SnH8f9uaXFh2mJu+XXIdidw0=;
 b=Yxwn2I/Hy7ZNEHmJ4Fbg8WAuexkkHx28d5HOZci5FVpOplSxKa1nr0/VRn7GVAbLLH45xoHJahY7OcqE0n1KJJ37jDCgauM4w4wH1QJWAb0OfwBaAc8G9BaZ7AgesSSa8qzQ/bsTmFDRb1bY2MclRMSHbnEcmt7cCaxLVSvXG2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB7059.eurprd04.prod.outlook.com (2603:10a6:208:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 13:02:26 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%4]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 13:02:26 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, vkoul@kernel.org
Subject: [PATCH v3 08/10] phy: cadence: Add driver for HDP-TX DisplyPort PHY
Date: Tue,  8 Nov 2022 21:00:11 +0800
Message-Id: <e2706bb8937a10ad7edf253fe8c928f6b22e25f1.1667911321.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667911321.git.Sandor.yu@nxp.com>
References: <cover.1667911321.git.Sandor.yu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7b6701-ee69-46d1-9088-08dac1897c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uGi4BP75+G6p6/yTBCyuxwDiZNnEoFWRiqp3/LpHzpKvlyM2czOz7LS4XPHoy5AyMtbw/4hqz612rebngPxTcUVD7AiJd9iG+1Me0cwJ2qB+ujTdqufKnrqlWu6iX2upgTZtv9icqeebVYTUl3dfQHk+ub5rjCXGwfw5FPgaQS+SS+JJGhpjokUMRTmROXf94S3nRimvoBCuehvfnZyCvypgWZZ9j+Cpum80vI0bMgx7qokDMUFzq8g9+hqSWIcNL1KeiqFDl6hGYr+yFR0CqhjinfK+N0VXk/q2iGB5djWXK+heIKpDS4gQEXhn6fNk5DYfA04p8njodIuwwEQ7PJDjnROPpRmFlXQRtqCl0qWFAiREJBjZTPdU11pwu225YBnvS1SjV9UdyVXDpdKzXxfraVroY9p26rgp0bKDgPEOkyXokt5xsGNjEYbRTh4xj08DsD0flitYMtsS+35IKAz/PoQWWotI37m42jTgptWnGTOplBmOIb1Gy3FOt89ijuAUYWgYwMj1CIJ7jxFD1EHZmpHNegJNuk/PL+xGuI8GxKJfHXjMYZ6SEDswQDYkeVuD5x2yRUUCOF/tgEemHiQ0onw1sNWtFpPF+kgmMyOA+hwRqHmejh5Qj3lxabRacAj2QtfhJGXId0b2F8fVkYEggFShEe/v9f6eKvWuXT0uEXgQZK+uM296dDbIPim5C4BJbXZhtozDTrawXRJHKNj7Qpp5SVMEVN1jIddBFlGcUhNAx9qCOi+igwuUJCVlidheYNVQ5/SYYzimG8gizmLDaP92Ichzt7KpzB4YOlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(86362001)(921005)(26005)(6512007)(41300700001)(6666004)(478600001)(38350700002)(2906002)(38100700002)(36756003)(2616005)(8936002)(186003)(7416002)(5660300002)(8676002)(66556008)(6486002)(4326008)(316002)(66476007)(83380400001)(30864003)(52116002)(6506007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME0zNjVhemRPSjV0bEREbWJha09MbTBHWng5OWN4K1dUb21TOUx2cHV0NFRv?=
 =?utf-8?B?eUh1UW1oK1AyT1dpSmErbE1MK1g4dy9DSW5TMXI3MVpHZG1QSjZCaHpkV2ZZ?=
 =?utf-8?B?VlJZU1YweUpRYTF4aE1uVVVLSXhEQ3JsR29iZjZ6UFVKVndKYVVlVFpiTW1k?=
 =?utf-8?B?QTNreVBlYVcrYUhiTzRodnZjbnZBS2MyVjhGeUR2RG1mMks0MzJVRTVZL0VB?=
 =?utf-8?B?WFE3aGJLSmhmUTBHQnRPWjc0RmFSVkNRNDRETFA3bVlNYmdZVUlWYkxBUFYw?=
 =?utf-8?B?cnYvSisxYWZEZXliUG9JZEwvdDRlNXYxcGNPcE9GemlvRTVEdEU1TFlReGhH?=
 =?utf-8?B?RUhDbjlHdVJlaXovcG9MK1dTRWJaaVdGb2ZJN3kzTW9TTUJpVkVMdFprUktm?=
 =?utf-8?B?WERJcHI0OVVyL2lmV09ib3B4RkQzN3RkQm5VeTdza1pNQnNySnBpaExzYnpZ?=
 =?utf-8?B?YlZUampZZ254MkJlUS9rbDdVOWVUWVJPQVludHlHOEYveHliRGNXS1dRYlZR?=
 =?utf-8?B?WE1TS1JpU3RDVmM1U2s2NUNRR2N5NWRtaytPT3ozL3UzTTNmTFYrb2MyWDBj?=
 =?utf-8?B?dHJrZ3hPQVFSVjM3cmhkelJQQjNMNkNpMFhrSzNLSFY2R1Ixa2g0WkVPa2Ey?=
 =?utf-8?B?RnU3TmJ1ZGhHclJXdkppeWEwS1BCa2RJNEtwMldsVlRCa2NKQkRza3lJSkhK?=
 =?utf-8?B?MlUvVlByOEI2VU9UeGdZN3JPbloxQnAvVVRDM0tISW5BMHNzZ0VuVlFjV1pZ?=
 =?utf-8?B?MUw3MzlyNUtQSjZMd2VvNnJWTVg4c1dBWlVYa2l2am5OdzVmWjA0b3RQa0o0?=
 =?utf-8?B?QmxELzh3bXNQRlBCV2prZGlkeWhVcitzdmwzLzBWYVNwOWxQbWZRdUI3SzVK?=
 =?utf-8?B?bUxRYU4zbVhaTVNvYXAxaGR0N3RzMmJEa3RGb2NrMWJMOWpyQ0ZlamI5aVk4?=
 =?utf-8?B?SFdKK3crRmJkZ29kUWg2SjNEM2d1SG5KRzdJLzZtTkZRamo3VkFOOTlPNyt2?=
 =?utf-8?B?NzJqQkdXR0RxSnN1UU9tWUcvRzhiaTlVaGxOU2Q4YlMyZEdhZVdlUHJmZXEy?=
 =?utf-8?B?VnVkbG1VMWVnZFdHRUFkR0pKbFdUZ2RFKzF2aWN4ajVQdUVXdmViblJGaWhl?=
 =?utf-8?B?RWRsUW9UbGpGcjNoRWVVQkh6cGtNb3J0T2czR1FmZkZBRGF3eEVuVE1va3M3?=
 =?utf-8?B?WUNaUTFuZTlrL3Z4MTNkNzI3Q2JWWndGTUVTYnIvK2ZSelBpczVQYkl1cFhK?=
 =?utf-8?B?UFlQTjVrNGtOenN4NlhDUy9kNlVpUnZFcHFLRXNNQ24zZkxabkZxTnhjcTFD?=
 =?utf-8?B?VVRoS2RSZzBSc3BhSURzdjRGRXdweVlYd01JVVQwOUJISXdEY0I5ODM2NHFt?=
 =?utf-8?B?dTljcUZrQ0ZZajZxY24vRWFDSXZGclZTYlRzaWRkOUt2WG9TMjBBTVVTQ3NN?=
 =?utf-8?B?eFdLTW1qNmR4R0RQd1RLZlo0Tk1YQkpVblhpVzBwK01vL0dPNmdNaDVOdHJz?=
 =?utf-8?B?UThraHp2bkZ0bURjUXlOUEdwVUtjeWpaZndTNHk3Z3dhNUszeHR2bmtaNUJR?=
 =?utf-8?B?RzV0aHhlTlpvbGRSbEFlOUZNT2FRSzk3bnU4Qm94SmxXYkdjSElxSFg0eDc2?=
 =?utf-8?B?SUtOeHNzTUVoNTd4ejJoZDZEOHBRVlFBUFg4cjZvOFNhVExXREZGUXpISGFt?=
 =?utf-8?B?NzFpclBsRnBqMythc1ByOUZFWENQNU9yQUxwRjNSNzU4Um5zUi8zVkRrZGtN?=
 =?utf-8?B?TDdJWEVOVU9WdHgxank5ZTRDTHZBZTJKV3lLKzF6MG5xSnNzZGhSYlY4NmpI?=
 =?utf-8?B?cFRab3BBOHlnbHJCUzNUdTVSOGJ2WmZyUi9VMkhEbFRpSTIrQm44Ry9sN251?=
 =?utf-8?B?RGFBQVRiRklKOE41b01PZ1JMSVkxQ2hOcjVsTExHcURPN0ZzUTRyUWZJTEt3?=
 =?utf-8?B?THdEUXcwb2d1MDBpTXRveC8ycUQ0bkI0OVIvMXhDa20wTWpwTnhaWnlrSXcz?=
 =?utf-8?B?ZVp6aVpsaFJ3QmkyUVUrNnFDZHNOdXE2UFNWQVNKT3pSR01NMGwxNXE4bHQ5?=
 =?utf-8?B?V3NhdHY2ZFE0bTNJR2w2dWQ4cXhCYnpETEhKakNiUHpoOEdRREorbXE4ZHB3?=
 =?utf-8?Q?Od0BrHt26qbpUmdGdTBcos0xS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7b6701-ee69-46d1-9088-08dac1897c24
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 13:02:26.6766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbZXDGjke8dwjh4QTfUczCsW3KDQc48AfPc7e3edp9ifzDjrMJzhWwQc2kzgqRSt75ytGi0gfxIkRhc7jP2tSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7059
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
Cc: oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 jani.nikula@intel.com, tzimmermann@suse.de, s.hauer@pengutronix.de,
 javierm@redhat.com, penguin-kernel@I-love.SAKURA.ne.jp, robh+dt@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Sandor.yu@nxp.com,
 shawnguo@kernel.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Cadence HDP-TX DisplayPort PHY driver.

Cadence HDP-TX PHY could be put in either DP mode or
HDMI mode base on the configuration chosen.
DisplayPort PHY mode is configurated in the driver.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/phy/cadence/Kconfig                |   8 +
 drivers/phy/cadence/Makefile               |   1 +
 drivers/phy/cadence/phy-cadence-hdptx-dp.c | 774 +++++++++++++++++++++
 3 files changed, 783 insertions(+)
 create mode 100644 drivers/phy/cadence/phy-cadence-hdptx-dp.c

diff --git a/drivers/phy/cadence/Kconfig b/drivers/phy/cadence/Kconfig
index 1adde2d99ae7..1e1914d3afdc 100644
--- a/drivers/phy/cadence/Kconfig
+++ b/drivers/phy/cadence/Kconfig
@@ -46,3 +46,11 @@ config PHY_CADENCE_SALVO
 	  Enable this to support the Cadence SALVO PHY driver,
 	  this PHY is a legacy PHY, and only are used for USB3
 	  and USB2.
+
+config PHY_CADENCE_HDPTX_DP
+	tristate "Cadence HDPTX DP PHY Driver"
+	depends on OF && HAS_IOMEM
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	help
+	  Enable this to support the Cadence HDPTX DP PHY driver
diff --git a/drivers/phy/cadence/Makefile b/drivers/phy/cadence/Makefile
index e17f035ddece..fbdb0bc5ff11 100644
--- a/drivers/phy/cadence/Makefile
+++ b/drivers/phy/cadence/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_PHY_CADENCE_DPHY)	+= cdns-dphy.o
 obj-$(CONFIG_PHY_CADENCE_DPHY_RX)	+= cdns-dphy-rx.o
 obj-$(CONFIG_PHY_CADENCE_SIERRA)	+= phy-cadence-sierra.o
 obj-$(CONFIG_PHY_CADENCE_SALVO)	+= phy-cadence-salvo.o
+obj-$(CONFIG_PHY_CADENCE_HDPTX_DP)	+= phy-cadence-hdptx-dp.o
diff --git a/drivers/phy/cadence/phy-cadence-hdptx-dp.c b/drivers/phy/cadence/phy-cadence-hdptx-dp.c
new file mode 100644
index 000000000000..079d43772d1d
--- /dev/null
+++ b/drivers/phy/cadence/phy-cadence-hdptx-dp.c
@@ -0,0 +1,774 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cadence HDP-TX Display Port Interface (DP) PHY driver
+ *
+ * Copyright (C) 2022 NXP Semiconductor, Inc.
+ */
+#include <asm/unaligned.h>
+#include <linux/clk.h>
+#include <linux/kernel.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include <drm/bridge/cdns-mhdp-mailbox.h>
+
+#define ADDR_PHY_AFE	0x80000
+
+/* PHY registers */
+#define CMN_SSM_BIAS_TMR                0x0022
+#define CMN_PLLSM0_PLLEN_TMR            0x0029
+#define CMN_PLLSM0_PLLPRE_TMR           0x002A
+#define CMN_PLLSM0_PLLVREF_TMR          0x002B
+#define CMN_PLLSM0_PLLLOCK_TMR          0x002C
+#define CMN_PLLSM0_USER_DEF_CTRL        0x002F
+#define CMN_PSM_CLK_CTRL                0x0061
+#define CMN_CDIAG_REFCLK_CTRL           0x0062
+#define CMN_PLL0_VCOCAL_START           0x0081
+#define CMN_PLL0_VCOCAL_INIT_TMR        0x0084
+#define CMN_PLL0_VCOCAL_ITER_TMR        0x0085
+#define CMN_PLL0_INTDIV                 0x0094
+#define CMN_PLL0_FRACDIV                0x0095
+#define CMN_PLL0_HIGH_THR               0x0096
+#define CMN_PLL0_DSM_DIAG               0x0097
+#define CMN_PLL0_SS_CTRL1               0x0098
+#define CMN_PLL0_SS_CTRL2               0x0099
+#define CMN_ICAL_INIT_TMR               0x00C4
+#define CMN_ICAL_ITER_TMR               0x00C5
+#define CMN_RXCAL_INIT_TMR              0x00D4
+#define CMN_RXCAL_ITER_TMR              0x00D5
+#define CMN_TXPUCAL_CTRL                0x00E0
+#define CMN_TXPUCAL_INIT_TMR            0x00E4
+#define CMN_TXPUCAL_ITER_TMR            0x00E5
+#define CMN_TXPDCAL_CTRL                0x00F0
+#define CMN_TXPDCAL_INIT_TMR            0x00F4
+#define CMN_TXPDCAL_ITER_TMR            0x00F5
+#define CMN_ICAL_ADJ_INIT_TMR           0x0102
+#define CMN_ICAL_ADJ_ITER_TMR           0x0103
+#define CMN_RX_ADJ_INIT_TMR             0x0106
+#define CMN_RX_ADJ_ITER_TMR             0x0107
+#define CMN_TXPU_ADJ_CTRL               0x0108
+#define CMN_TXPU_ADJ_INIT_TMR           0x010A
+#define CMN_TXPU_ADJ_ITER_TMR           0x010B
+#define CMN_TXPD_ADJ_CTRL               0x010c
+#define CMN_TXPD_ADJ_INIT_TMR           0x010E
+#define CMN_TXPD_ADJ_ITER_TMR           0x010F
+#define CMN_DIAG_PLL0_FBH_OVRD          0x01C0
+#define CMN_DIAG_PLL0_FBL_OVRD          0x01C1
+#define CMN_DIAG_PLL0_OVRD              0x01C2
+#define CMN_DIAG_PLL0_TEST_MODE         0x01C4
+#define CMN_DIAG_PLL0_V2I_TUNE          0x01C5
+#define CMN_DIAG_PLL0_CP_TUNE           0x01C6
+#define CMN_DIAG_PLL0_LF_PROG           0x01C7
+#define CMN_DIAG_PLL0_PTATIS_TUNE1      0x01C8
+#define CMN_DIAG_PLL0_PTATIS_TUNE2      0x01C9
+#define CMN_DIAG_PLL0_INCLK_CTRL        0x01CA
+#define CMN_DIAG_PLL0_PXL_DIVH          0x01CB
+#define CMN_DIAG_PLL0_PXL_DIVL          0x01CC
+#define CMN_DIAG_HSCLK_SEL              0x01E0
+#define CMN_DIAG_PER_CAL_ADJ            0x01EC
+#define CMN_DIAG_CAL_CTRL               0x01ED
+#define CMN_DIAG_ACYA                   0x01FF
+#define XCVR_PSM_RCTRL                  0x4001
+#define XCVR_PSM_CAL_TMR                0x4002
+#define XCVR_PSM_A0IN_TMR               0x4003
+#define TX_TXCC_CAL_SCLR_MULT_0         0x4047
+#define TX_TXCC_CPOST_MULT_00_0         0x404C
+#define TX_TXCC_MGNFS_MULT_000_0        0x4050
+#define XCVR_DIAG_PLLDRC_CTRL           0x40E0
+#define XCVR_DIAG_PLLDRC_CTRL           0x40E0
+#define XCVR_DIAG_HSCLK_SEL             0x40E1
+#define XCVR_DIAG_BIDI_CTRL             0x40E8
+#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR   0x40F2
+#define XCVR_DIAG_LANE_FCM_EN_MGN       0x40F2
+#define TX_PSC_A0                       0x4100
+#define TX_PSC_A1                       0x4101
+#define TX_PSC_A2                       0x4102
+#define TX_PSC_A3                       0x4103
+#define TX_RCVDET_CTRL                  0x4120
+#define TX_RCVDET_EN_TMR                0x4122
+#define TX_RCVDET_EN_TMR                0x4122
+#define TX_RCVDET_ST_TMR                0x4123
+#define TX_RCVDET_ST_TMR                0x4123
+#define TX_BIST_CTRL                    0x4140
+#define TX_BIST_UDDWR                   0x4141
+#define TX_DIAG_TX_CTRL                 0x41E0
+#define TX_DIAG_TX_DRV                  0x41E1
+#define TX_DIAG_BGREF_PREDRV_DELAY      0x41E7
+#define TX_DIAG_BGREF_PREDRV_DELAY      0x41E7
+#define XCVR_PSM_RCTRL_1                0x4201
+#define TX_TXCC_CAL_SCLR_MULT_1         0x4247
+#define TX_TXCC_CPOST_MULT_00_1         0x424C
+#define TX_TXCC_MGNFS_MULT_000_1        0x4250
+#define XCVR_DIAG_PLLDRC_CTRL_1         0x42E0
+#define XCVR_DIAG_HSCLK_SEL_1           0x42E1
+#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR_1 0x42F2
+#define TX_RCVDET_EN_TMR_1              0x4322
+#define TX_RCVDET_ST_TMR_1              0x4323
+#define TX_DIAG_ACYA_0                  0x41FF
+#define TX_DIAG_ACYA_1                  0x43FF
+#define TX_DIAG_ACYA_2                  0x45FF
+#define TX_DIAG_ACYA_3                  0x47FF
+#define TX_ANA_CTRL_REG_1               0x5020
+#define TX_ANA_CTRL_REG_2               0x5021
+#define TXDA_COEFF_CALC                 0x5022
+#define TX_DIG_CTRL_REG_1               0x5023
+#define TX_DIG_CTRL_REG_2               0x5024
+#define TXDA_CYA_AUXDA_CYA              0x5025
+#define TX_ANA_CTRL_REG_3               0x5026
+#define TX_ANA_CTRL_REG_4               0x5027
+#define TX_ANA_CTRL_REG_5               0x5029
+#define RX_PSC_A0                       0x8000
+#define RX_PSC_CAL                      0x8006
+#define PMA_LANE_CFG                    0xC000
+#define PIPE_CMN_CTRL1                  0xC001
+#define PIPE_CMN_CTRL2                  0xC002
+#define PIPE_COM_LOCK_CFG1              0xC003
+#define PIPE_COM_LOCK_CFG2              0xC004
+#define PIPE_RCV_DET_INH                0xC005
+#define PHY_HDP_MODE_CTRL               0xC008
+#define PHY_HDP_CLK_CTL                 0xC009
+#define STS                             0xC00F
+#define PHY_ISO_CMN_CTRL                0xC010
+#define PHY_ISO_CMN_CTRL                0xC010
+#define PHY_HDP_TX_CTL_L0               0xC408
+#define PHY_DP_TX_CTL                   0xC408
+#define PHY_HDP_TX_CTL_L1               0xC448
+#define PHY_HDP_TX_CTL_L2               0xC488
+#define PHY_HDP_TX_CTL_L3               0xC4C8
+#define PHY_PMA_CMN_CTRL1               0xC800
+#define PMA_CMN_CTRL1                   0xC800
+#define PHY_PMA_ISO_CMN_CTRL            0xC810
+#define PHY_PMA_ISO_PLL_CTRL1           0xC812
+#define PHY_PMA_ISOLATION_CTRL          0xC81F
+#define PHY_ISOLATION_CTRL              0xC81F
+#define PHY_PMA_ISO_XCVR_CTRL           0xCC11
+#define PHY_PMA_ISO_LINK_MODE           0xCC12
+#define PHY_PMA_ISO_PWRST_CTRL          0xCC13
+#define PHY_PMA_ISO_TX_DATA_LO          0xCC14
+#define PHY_PMA_ISO_TX_DATA_HI          0xCC15
+#define PHY_PMA_ISO_RX_DATA_LO          0xCC16
+#define PHY_PMA_ISO_RX_DATA_HI          0xCC17
+
+#define MAX_NUM_LANES		4
+#define DEFAULT_MAX_BIT_RATE	5400 /* in Mbps */
+
+#define REF_CLK_27MHZ		27000000
+
+enum dp_link_rate {
+	RATE_1_6 = 162000,
+	RATE_2_1 = 216000,
+	RATE_2_4 = 243000,
+	RATE_2_7 = 270000,
+	RATE_3_2 = 324000,
+	RATE_4_3 = 432000,
+	RATE_5_4 = 540000,
+	RATE_8_1 = 810000,
+};
+
+struct phy_pll_reg {
+	u16 val[7];
+	u32 addr;
+};
+
+static const struct phy_pll_reg phy_pll_27m_cfg[] = {
+	/*  1.62    2.16    2.43    2.7     3.24    4.32    5.4      register address */
+	{{ 0x010E, 0x010E, 0x010E, 0x010E, 0x010E, 0x010E, 0x010E }, CMN_PLL0_VCOCAL_INIT_TMR },
+	{{ 0x001B, 0x001B, 0x001B, 0x001B, 0x001B, 0x001B, 0x001B }, CMN_PLL0_VCOCAL_ITER_TMR },
+	{{ 0x30B9, 0x3087, 0x3096, 0x30B4, 0x30B9, 0x3087, 0x30B4 }, CMN_PLL0_VCOCAL_START },
+	{{ 0x0077, 0x009F, 0x00B3, 0x00C7, 0x0077, 0x009F, 0x00C7 }, CMN_PLL0_INTDIV },
+	{{ 0xF9DA, 0xF7CD, 0xF6C7, 0xF5C1, 0xF9DA, 0xF7CD, 0xF5C1 }, CMN_PLL0_FRACDIV },
+	{{ 0x001E, 0x0028, 0x002D, 0x0032, 0x001E, 0x0028, 0x0032 }, CMN_PLL0_HIGH_THR },
+	{{ 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020 }, CMN_PLL0_DSM_DIAG },
+	{{ 0x0000, 0x1000, 0x1000, 0x1000, 0x0000, 0x1000, 0x1000 }, CMN_PLLSM0_USER_DEF_CTRL },
+	{{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 }, CMN_DIAG_PLL0_OVRD },
+	{{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 }, CMN_DIAG_PLL0_FBH_OVRD },
+	{{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 }, CMN_DIAG_PLL0_FBL_OVRD },
+	{{ 0x0006, 0x0007, 0x0007, 0x0007, 0x0006, 0x0007, 0x0007 }, CMN_DIAG_PLL0_V2I_TUNE },
+	{{ 0x0043, 0x0043, 0x0043, 0x0042, 0x0043, 0x0043, 0x0042 }, CMN_DIAG_PLL0_CP_TUNE },
+	{{ 0x0008, 0x0008, 0x0008, 0x0008, 0x0008, 0x0008, 0x0008 }, CMN_DIAG_PLL0_LF_PROG },
+	{{ 0x0100, 0x0001, 0x0001, 0x0001, 0x0100, 0x0001, 0x0001 }, CMN_DIAG_PLL0_PTATIS_TUNE1 },
+	{{ 0x0007, 0x0001, 0x0001, 0x0001, 0x0007, 0x0001, 0x0001 }, CMN_DIAG_PLL0_PTATIS_TUNE2 },
+	{{ 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020 }, CMN_DIAG_PLL0_TEST_MODE},
+	{{ 0x0016, 0x0016, 0x0016, 0x0016, 0x0016, 0x0016, 0x0016 }, CMN_PSM_CLK_CTRL }
+};
+
+struct cdns_hdptx_dp_phy {
+	void __iomem *regs;	/* DPTX registers base */
+	struct device *dev;
+	struct phy *phy;
+	struct mutex mbox_mutex; /* mutex to protect mailbox */
+	struct clk *ref_clk;
+	u32 ref_clk_rate;
+	u32 num_lanes;
+	u32 max_bit_rate; /* Maximum link bit rate to use (in Mbps) */
+	u32 link_rate;
+	bool power_up;
+};
+
+static int cdns_phy_reg_write(struct cdns_hdptx_dp_phy *cdns_phy, u32 addr, u32 val)
+{
+	return cdns_mhdp_reg_write(cdns_phy, ADDR_PHY_AFE + (addr << 2), val);
+}
+
+static u32 cdns_phy_reg_read(struct cdns_hdptx_dp_phy *cdns_phy, u32 addr)
+{
+	u32 reg32;
+
+	cdns_mhdp_reg_read(cdns_phy, ADDR_PHY_AFE + (addr << 2), &reg32);
+	return reg32;
+}
+
+static int link_rate_index(u32 rate)
+{
+	switch (rate) {
+	case RATE_1_6:
+		return 0;
+	case RATE_2_1:
+		return 1;
+	case RATE_2_4:
+		return 2;
+	case RATE_2_7:
+		return 3;
+	case RATE_3_2:
+		return 4;
+	case RATE_4_3:
+		return 5;
+	case RATE_5_4:
+		return 6;
+	default:
+		return -1;
+	}
+}
+
+static int hdptx_dp_ref_clk(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	struct device *dev = cdns_phy->dev;
+	u32 ref_clk_rate;
+	int ret;
+
+	cdns_phy->ref_clk = devm_clk_get(dev, "refclk");
+	if (IS_ERR(cdns_phy->ref_clk)) {
+		dev_err(dev, "phy ref clock not found\n");
+		return PTR_ERR(cdns_phy->ref_clk);
+	}
+
+	ret = clk_prepare_enable(cdns_phy->ref_clk);
+	if (ret) {
+		dev_err(cdns_phy->dev, "Failed to prepare ref clock\n");
+		return ret;
+	}
+
+	ref_clk_rate = clk_get_rate(cdns_phy->ref_clk);
+	if (!ref_clk_rate) {
+		dev_err(cdns_phy->dev, "Failed to get ref clock rate\n");
+		goto err_ref_clk;
+	}
+
+	if (ref_clk_rate == REF_CLK_27MHZ)
+		cdns_phy->ref_clk_rate = ref_clk_rate;
+	else {
+		dev_err(cdns_phy->dev, "Not support Ref Clock Rate(%dHz)\n", ref_clk_rate);
+		goto err_ref_clk;
+	}
+
+	return 0;
+
+err_ref_clk:
+	clk_disable_unprepare(cdns_phy->ref_clk);
+	return -EINVAL;
+}
+
+static void hdptx_dp_aux_cfg(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	/* Power up Aux */
+	cdns_phy_reg_write(cdns_phy, TXDA_CYA_AUXDA_CYA, 1);
+
+	cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_1, 0x3);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_2, 36);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0100);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0300);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_3, 0x0000);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2008);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2018);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xA018);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030C);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_5, 0x0000);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_4, 0x1001);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xA098);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xA198);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030d);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030f);
+}
+
+/* PMA common configuration for 27MHz */
+static void hdptx_dp_phy_pma_cmn_cfg_27mhz(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	u32 num_lanes = cdns_phy->num_lanes;
+	u16 val;
+	int k;
+
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+	val &= 0xFFF7;
+	val |= 0x0008;
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
+
+	/* Startup state machine registers */
+	cdns_phy_reg_write(cdns_phy, CMN_SSM_BIAS_TMR, 0x0087);
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLEN_TMR, 0x001B);
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLPRE_TMR, 0x0036);
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLVREF_TMR, 0x001B);
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLLOCK_TMR, 0x006C);
+
+	/* Current calibration registers */
+	cdns_phy_reg_write(cdns_phy, CMN_ICAL_INIT_TMR, 0x0044);
+	cdns_phy_reg_write(cdns_phy, CMN_ICAL_ITER_TMR, 0x0006);
+	cdns_phy_reg_write(cdns_phy, CMN_ICAL_ADJ_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_ICAL_ADJ_ITER_TMR, 0x0006);
+
+	/* Resistor calibration registers */
+	cdns_phy_reg_write(cdns_phy, CMN_TXPUCAL_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPUCAL_ITER_TMR, 0x0006);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPU_ADJ_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPU_ADJ_ITER_TMR, 0x0006);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPDCAL_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPDCAL_ITER_TMR, 0x0006);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPD_ADJ_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPD_ADJ_ITER_TMR, 0x0006);
+	cdns_phy_reg_write(cdns_phy, CMN_RXCAL_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_RXCAL_ITER_TMR, 0x0006);
+	cdns_phy_reg_write(cdns_phy, CMN_RX_ADJ_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_RX_ADJ_ITER_TMR, 0x0006);
+
+	for (k = 0; k < num_lanes; k = k + 1) {
+		/* Power state machine registers */
+		cdns_phy_reg_write(cdns_phy, XCVR_PSM_CAL_TMR  | (k << 9), 0x016D);
+		cdns_phy_reg_write(cdns_phy, XCVR_PSM_A0IN_TMR | (k << 9), 0x016D);
+		/* Transceiver control and diagnostic registers */
+		cdns_phy_reg_write(cdns_phy, XCVR_DIAG_LANE_FCM_EN_MGN_TMR | (k << 9), 0x00A2);
+		cdns_phy_reg_write(cdns_phy, TX_DIAG_BGREF_PREDRV_DELAY    | (k << 9), 0x0097);
+		/* Transmitter receiver detect registers */
+		cdns_phy_reg_write(cdns_phy, TX_RCVDET_EN_TMR | (k << 9), 0x0A8C);
+		cdns_phy_reg_write(cdns_phy, TX_RCVDET_ST_TMR | (k << 9), 0x0036);
+	}
+
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_0, 1);
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_1, 1);
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_2, 1);
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_3, 1);
+}
+
+static void hdptx_dp_phy_pma_cmn_pll0_27mhz(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	u32 num_lanes = cdns_phy->num_lanes;
+	u32 link_rate = cdns_phy->link_rate;
+	u16 val;
+	int index, i, k;
+
+	/* DP PLL data rate 0/1 clock divider value */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val &= 0x00FF;
+	if (link_rate <= RATE_2_7)
+		val |= 0x2400;
+	else
+		val |= 0x1200;
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+
+	/* High speed clock 0/1 div */
+	val = cdns_phy_reg_read(cdns_phy, CMN_DIAG_HSCLK_SEL);
+	val &= 0xFFCC;
+	if (link_rate <= RATE_2_7)
+		val |= 0x0011;
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_HSCLK_SEL, val);
+
+	for (k = 0; k < num_lanes; k++) {
+		val = cdns_phy_reg_read(cdns_phy, (XCVR_DIAG_HSCLK_SEL | (k << 9)));
+		val = val & 0xCFFF;
+		if (link_rate <= RATE_2_7)
+			val |= 0x1000;
+		cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_HSCLK_SEL | (k << 9)), val);
+	}
+
+	/* DP PHY PLL 27MHz configuration */
+	index = link_rate_index(link_rate);
+	for (i = 0; i < ARRAY_SIZE(phy_pll_27m_cfg); i++)
+		cdns_phy_reg_write(cdns_phy, phy_pll_27m_cfg[i].addr,
+				phy_pll_27m_cfg[i].val[index]);
+
+	/* Transceiver control and diagnostic registers */
+	for (k = 0; k < num_lanes; k++) {
+		val = cdns_phy_reg_read(cdns_phy, (XCVR_DIAG_PLLDRC_CTRL | (k << 9)));
+		val = val & 0x8FFF;
+		if (link_rate <= RATE_2_7)
+			val |= 0x2000;
+		else
+			val |= 0x1000;
+		cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_PLLDRC_CTRL | (k << 9)), val);
+	}
+
+	for (k = 0; k < num_lanes; k = k + 1) {
+		/* Power state machine registers */
+		cdns_phy_reg_write(cdns_phy, (XCVR_PSM_RCTRL | (k << 9)),  0xBEFC);
+		cdns_phy_reg_write(cdns_phy, (TX_PSC_A0 | (k << 9)), 0x6799);
+		cdns_phy_reg_write(cdns_phy, (TX_PSC_A1 | (k << 9)), 0x6798);
+		cdns_phy_reg_write(cdns_phy, (TX_PSC_A2 | (k << 9)), 0x0098);
+		cdns_phy_reg_write(cdns_phy, (TX_PSC_A3 | (k << 9)), 0x0098);
+		/* Receiver calibration power state definition register */
+		val = cdns_phy_reg_read(cdns_phy, RX_PSC_CAL | (k << 9));
+		val &= 0xFFBB;
+		cdns_phy_reg_write(cdns_phy, (RX_PSC_CAL | (k << 9)), val);
+		val = cdns_phy_reg_read(cdns_phy, RX_PSC_A0  | (k << 9));
+		val &= 0xFFBB;
+		cdns_phy_reg_write(cdns_phy, (RX_PSC_A0  | (k << 9)), val);
+	}
+}
+
+static void hdptx_dp_phy_ref_clock_type(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	u32 val;
+
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+	val &= 0xFF8F;
+	/*
+	 * single ended reference clock (val |= 0x0030);
+	 * differential clock  (val |= 0x0000);
+	 *
+	 * for differential clock on the refclk_p and
+	 * refclk_m off chip pins: CMN_DIAG_ACYA[8]=1'b1
+	 * cdns_phy_reg_write(cdns_phy, CMN_DIAG_ACYA, 0x0100);
+	 */
+	val |= 0x0030;
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
+}
+
+static int hdptx_dp_phy_power_up(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	u32 val, i;
+
+	/* Enable HDP PLL’s for high speed clocks */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val |= (1 << 0);
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	/* Wait for PLL ready ACK */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+		if (val & (1 << 1))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait PLL Ack failed\n");
+		return -1;
+	}
+
+	/* Enable HDP PLL’s data rate and full rate clocks out of PMA. */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val |= (1 << 2);
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	/* Wait for PLL clock enable ACK */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+		if (val & (1 << 3))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait PLL clock enable ACk failed\n");
+		return -1;
+	}
+
+	/* Configure PHY in A2 Mode */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, 0x0004);
+	/* Wait for Power State A2 Ack */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_MODE_CTRL);
+		if (val & (1 << 6))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait A2 Ack failed\n");
+		return -1;
+	}
+
+	/* Configure PHY in A0 mode (PHY must be in the A0 power
+	 * state in order to transmit data)
+	 */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, 0x0101);
+
+	/* Wait for Power State A0 Ack */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_MODE_CTRL);
+		if (val & (1 << 4))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait A0 Ack failed\n");
+		return -1;
+	}
+
+	cdns_phy->power_up = true;
+
+	return 0;
+}
+
+static void hdptx_dp_phy_power_down(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	u16 val;
+	int i;
+
+	if (!cdns_phy->power_up)
+		return;
+
+	/* Place the PHY lanes in the A3 power state. */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, 0x8);
+	/* Wait for Power State A3 Ack */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_MODE_CTRL);
+		if (val & (1 << 7))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait A3 Ack failed\n");
+		return;
+	}
+
+	/* Disable HDP PLL’s data rate and full rate clocks out of PMA. */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val &= ~(1 << 2);
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	/* Wait for PLL clock gate ACK */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+		if (!(val & (1 << 3)))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait PLL clock gate Ack failed\n");
+		return;
+	}
+
+	/* Disable HDP PLL’s for high speed clocks */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val &= ~(1 << 0);
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	/* Wait for PLL disable ACK */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+		if (!(val & (1 << 1)))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait PLL disable Ack failed\n");
+		return;
+	}
+}
+
+static int cdns_hdptx_dp_phy_on(struct phy *phy)
+{
+	struct cdns_hdptx_dp_phy *cdns_phy = phy_get_drvdata(phy);
+
+	return hdptx_dp_phy_power_up(cdns_phy);
+}
+
+static int cdns_hdptx_dp_phy_off(struct phy *phy)
+{
+	struct cdns_hdptx_dp_phy *cdns_phy = phy_get_drvdata(phy);
+
+	hdptx_dp_phy_power_down(cdns_phy);
+
+	return 0;
+}
+
+static int cdns_hdptx_dp_phy_init(struct phy *phy)
+{
+	struct cdns_hdptx_dp_phy *cdns_phy = phy_get_drvdata(phy);
+	int ret;
+
+	hdptx_dp_phy_ref_clock_type(cdns_phy);
+
+	/* PHY power up */
+	ret = hdptx_dp_phy_power_up(cdns_phy);
+	if (ret < 0)
+		return ret;
+
+	hdptx_dp_aux_cfg(cdns_phy);
+
+	return ret;
+}
+
+static int cdns_hdptx_dp_configure(struct phy *phy,
+				     union phy_configure_opts *opts)
+{
+	struct cdns_hdptx_dp_phy *cdns_phy = phy_get_drvdata(phy);
+	int ret;
+
+	cdns_phy->link_rate = opts->dp.link_rate;
+
+	/* Disable phy clock if PHY in power up state */
+	hdptx_dp_phy_power_down(cdns_phy);
+
+	if (cdns_phy->ref_clk_rate == REF_CLK_27MHZ) {
+		hdptx_dp_phy_pma_cmn_cfg_27mhz(cdns_phy);
+		hdptx_dp_phy_pma_cmn_pll0_27mhz(cdns_phy);
+	} else
+		dev_err(cdns_phy->dev, "Not support ref clock rate\n");
+
+	/* PHY power up */
+	ret = hdptx_dp_phy_power_up(cdns_phy);
+
+	return ret;
+}
+
+static const struct phy_ops cdns_hdptx_dp_phy_ops = {
+	.init		= cdns_hdptx_dp_phy_init,
+	.configure	= cdns_hdptx_dp_configure,
+	.power_on	= cdns_hdptx_dp_phy_on,
+	.power_off	= cdns_hdptx_dp_phy_off,
+	.owner		= THIS_MODULE,
+};
+
+static int cdns_hdptx_dp_phy_probe(struct platform_device *pdev)
+{
+	struct cdns_hdptx_dp_phy *cdns_phy;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct phy_provider *phy_provider;
+	struct resource *res;
+	struct phy *phy;
+	int ret;
+
+	cdns_phy = devm_kzalloc(dev, sizeof(*cdns_phy), GFP_KERNEL);
+	if (!cdns_phy)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, cdns_phy);
+	cdns_phy->dev = dev;
+	mutex_init(&cdns_phy->mbox_mutex);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+	cdns_phy->regs = devm_ioremap(dev, res->start, resource_size(res));
+	if (IS_ERR(cdns_phy->regs))
+		return PTR_ERR(cdns_phy->regs);
+
+	if (of_property_read_u32(node, "cdns,num-lanes",
+				 &cdns_phy->num_lanes)) {
+		dev_err(dev, "%s: No \"cdns,num-lanes\"-property.\n",
+			node->full_name);
+		return -EINVAL;
+	}
+
+	phy = devm_phy_create(dev, node, &cdns_hdptx_dp_phy_ops);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	cdns_phy->max_bit_rate = DEFAULT_MAX_BIT_RATE;
+	of_property_read_u32(node, "cdns,max-bit-rate",
+			     &cdns_phy->max_bit_rate);
+
+	switch (cdns_phy->max_bit_rate) {
+	/* valid bit rate */
+	case 1620:
+	case 2160:
+	case 2430:
+	case 2700:
+	case 3240:
+	case 4320:
+	case 5400:
+		break;
+	case 8100:
+	default:
+		dev_err(dev, "unsupported max bit rate: %dMbps\n",
+				cdns_phy->max_bit_rate);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "DP max bit rate %d.%03d Gbps\n",
+		cdns_phy->max_bit_rate / 1000,
+		cdns_phy->max_bit_rate % 1000);
+
+	phy->attrs.bus_width = cdns_phy->num_lanes;
+	phy->attrs.max_link_rate = cdns_phy->max_bit_rate;
+	phy->attrs.mode = PHY_MODE_DP;
+
+	cdns_phy->phy = phy;
+	phy_set_drvdata(phy, cdns_phy);
+
+	if (cdns_phy->num_lanes > MAX_NUM_LANES) {
+		dev_err(dev, "Invalid lane configuration\n");
+		return -EINVAL;
+	}
+
+	ret = hdptx_dp_ref_clk(cdns_phy);
+	if (ret) {
+		dev_err(dev, "Init clk fail\n");
+		return -EINVAL;
+	}
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		ret =  PTR_ERR(phy_provider);
+		goto clk_disable;
+	}
+
+	dev_dbg(dev, "link: (%d lanes)", cdns_phy->num_lanes);
+
+	return 0;
+
+clk_disable:
+	clk_disable_unprepare(cdns_phy->ref_clk);
+
+	return -EINVAL;
+}
+
+static int cdns_hdptx_dp_phy_remove(struct platform_device *pdev)
+{
+	struct cdns_hdptx_dp_phy *cdns_phy = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(cdns_phy->ref_clk);
+
+	return 0;
+}
+
+static const struct of_device_id cdns_hdptx_dp_phy_of_match[] = {
+	{
+		.compatible = "cdns,hdptx-dp-phy",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, cdns_hdptx_dp_phy_of_match);
+
+static struct platform_driver cdns_hdptx_dp_phy_driver = {
+	.probe	= cdns_hdptx_dp_phy_probe,
+	.remove = cdns_hdptx_dp_phy_remove,
+	.driver = {
+		.name	= "cdns-hdptx-dp-phy",
+		.of_match_table	= cdns_hdptx_dp_phy_of_match,
+	}
+};
+module_platform_driver(cdns_hdptx_dp_phy_driver);
+
+MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
+MODULE_DESCRIPTION("Cadence HDP-TX DisplayPort PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

