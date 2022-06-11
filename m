Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF2F547554
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7658810E6E8;
	Sat, 11 Jun 2022 14:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60076.outbound.protection.outlook.com [40.107.6.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFBD10E6E8
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:13:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAE/Iwchmjer9KAAeJHqtiAr6mf/W8+yn1nJSlun05+Jo0A1JTxE8YrtrilRWSQC+w/qS6aM0JwOSBxIUiBIKGSQwPw0Xw7So0S7TJv/heJ5C7m4NfgCe2OCUtVUFL8LDsNt88Ifi/YBsMt/GTbNo51lx9iFYsnAXtxhfxJ1nSlBsLeNEEEqssEGDVHOjVSw/oyYOy8Ln0bet7HMfrI8d2VgRK1mpqL/yIhKQfTZiurx2KlYDyfhuUbn0HA+vF4O83uWF4DpMB28VY9vmNIFT6ZgsElEqOdebqqoqMxhdY5aHDFvbW/+uXf6Y40EmzQAu/C8K/6C0RC/pBXMD/pmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0IbIvxeaH5gt9hya9F+OOaqffXJf4kP1nnlR/O0hFw=;
 b=mMzVUtQzuPAaTmBO+xev0qI6zNvU5qJZEReteAuXCQoOUf0iqf5DHYQV4FTQfY9tIej5KkzynUDkJnF/P7n/7PzQ87GVoc9AuDiBsueOVZgVUkxeLRPARlydeF8Upnnb+expdiBd8LrgTB3uBzPDqVv5IX5a3xqwAqImhmQdz7Iq7iiGx9s8hstZpWlMV09FQPem4EZ0mIy1g6lnb1OGZmLmcjifXhIynYILevy9gc9M1eYg/kvPpb5CVJ/mGSji9fmHN4a/gqtrtSskkQHm2rxOjnjiB0Vip+GChd7vYLcZ/1PjOy9CfAH5lUGiK3vEIKAfaSQ9mCvzw+mXc298hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0IbIvxeaH5gt9hya9F+OOaqffXJf4kP1nnlR/O0hFw=;
 b=gM5K8cQyi7HybufttxXLWve/PGwl5do3obY10S58k73ogbSM+BtGAlTtlz8AMq7bWb25AAfeaZecoS5H1H9FFeYwVxwOnPukH4hckGUKrHcrR5qu/hpKkn3zb9XOvUEkW+rcMeCElDkoZjpIwrauaRajMl++mOs++07QMtgrmlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6347.eurprd04.prod.outlook.com (2603:10a6:10:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sat, 11 Jun
 2022 14:13:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:13:18 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 04/14] drm/bridge: imx: Add i.MX8qm/qxp pixel combiner
 support
Date: Sat, 11 Jun 2022 22:14:11 +0800
Message-Id: <20220611141421.718743-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220611141421.718743-1-victor.liu@nxp.com>
References: <20220611141421.718743-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0118.apcprd03.prod.outlook.com
 (2603:1096:4:91::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6491c68a-7f00-45e8-438e-08da4bb48893
X-MS-TrafficTypeDiagnostic: DB8PR04MB6347:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB8PR04MB6347FE9E6E158CD912A2088198A99@DB8PR04MB6347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7ELrVNKzLiQms8FJuKYfjcLxvLc8mNDu5OOzHFDWcN25n4fUz00SdzjXV6TK+xVo+fjKsQCnKkipbC1jIOBj7TGoCK1kkG+jIXc7fiC89/3aukDOOzfZTExq/OuuOUIzC8qQVTbjLoXQlBhZkMMTRfCYe75smg0H5G7mV1DEO9IZuKI7r3QwiYYqZu1cfCtGTGP5tlbPcnt9dsq3WiMktWdD7ca9L9pCDS7C3K6xnmU6x4lq31eFF1WtcNnjdSG5a5Kys1Hob6RS3xoX9Ub8G5w0eJ8DKy9eiHbfrAM8pL/7ik+ldzpOWYUdbF2IS7V/Si5FJX3waOW9YCihVbzBuUk4Nb98tMEbrVRu7k7C2rN0PrjMPL2Y+L8mIYMQpOlOIHfI6TdhxNXPaKu5AdfGh0FqI6SN33nRunWWhKciKj5P4GtnFpK6ql2RrZK2Cs54tjaqYarfpC/j2JSSkKh+h4jreDwFKSOicyVKwCUWas0fgCx3nQvoOG5G/eQmiifPgdKbxInEICJSfL/Wr1Lpk0yPYSNwfN4L5FE//fZJgdJoZENuaoM64FagtXbJ6Y+0b29bTWqhDbo0g/7mGjG3M67MEdwTxGssUJMy5mBpoxIq5eNgZnuhE4bW+jzrtC1liqfy8QiWrVUxEGKoVbpyzgGEoHxY+4tFJOcPGEXLq7+vjKWWwgi4GzYV+QyIwdfw5yZpwZ7G9dcdp8moxgNMtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(5660300002)(66556008)(66476007)(66946007)(1076003)(4326008)(8676002)(86362001)(316002)(186003)(8936002)(2616005)(7416002)(30864003)(36756003)(83380400001)(52116002)(38350700002)(38100700002)(6512007)(26005)(6506007)(6666004)(508600001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r8+qIEJfCqzyOUX14Dj/c5VMZmbjRexIRw6XuCMvix6zBtqTqfFyp1vFV6F+?=
 =?us-ascii?Q?OCwypnuYTty13Iu+BKUfhMW74dWStgQZ17LdDug3sYUMkK5suTHaxPyCQ2js?=
 =?us-ascii?Q?fonXSHKVPL9cJ51sL3aFfv93MULrGqfcaLQk2CI315PLvprwqOuGZcYmsi09?=
 =?us-ascii?Q?optW9zwzwmS5aTmLvre0fIWSKXMvLbQ2PjCVswxTmlrIQNlZipOEeHCAunZI?=
 =?us-ascii?Q?dml3IyEfDAEQ/FgoM9fISDx81+AUKafSuwfNYBZ8LKEv6NE/w7yLG7gybgXQ?=
 =?us-ascii?Q?8MCI/hMu4f2xZ3I+rhe5UlhTG7ZLglqOsM9CQ9XnZVqDU0NrNjxclj6Bz+BX?=
 =?us-ascii?Q?1lI7EffyBE024zrPmwYsDFCO0TjXGZgDzWd60yRaEyfuXLyqbt/qoUE+6oPi?=
 =?us-ascii?Q?TtivTEpeP2NXsymTEPyZDzRUHBxOQGdHjaovrYPGEjLFAb+9a6FHmzTCxKu9?=
 =?us-ascii?Q?U8QZADHaPuHFr99IAQS8gm0YUPRNcpc3qP5QvEJhwKWp+v3hmSm2Aqemtw8q?=
 =?us-ascii?Q?AFkR3IY8mbF0Xc1Gy7Q75MxNMeVjU7jYGX/8vKRxi3inBCf5M2HLkPyfOicJ?=
 =?us-ascii?Q?4/YfNPpY3UCepM4HHkMDbtIITK3yE/wMgIfL4QORwQtf8rQV7iQ7hPiaQcCp?=
 =?us-ascii?Q?gxSojW3xnUpGvVQFupCh/2vX0aV1sZ/QYWh7BWn1nV/aEEuii4EVZLymkvrk?=
 =?us-ascii?Q?R8RIw6pd32rRAoUx1Q2VHWFfM4X7W5/6VcmkZjSiZYE8zz+HAY5TsgM1MD5k?=
 =?us-ascii?Q?QNur19ClJ8TZfuLcZSVxXfD+r7gDtqkp0QhYsXDSbrJ4upxG0pBFHS83D/+K?=
 =?us-ascii?Q?SIQ5rNzQCWvuVGL8HrJPPyarHjouRpNdrp0f8jE3NMhGWJhekGbJsC81BaOj?=
 =?us-ascii?Q?bw3oQSyjxEocO8QepVJT+zqJpmYcu3/qVYiCd++6FHmb/slfv3b3KUeNXcRp?=
 =?us-ascii?Q?oJZxRsMThxIheFkBQFE2XkPdwJWSeMwrf5lOAma5yhrfiOsMKB2TkiokLqre?=
 =?us-ascii?Q?v6mtCZezqqGphwR8Fmtm5RJYfH8Tdj650vyYHv1yYsrRF5IyvGMgWwZLmv/R?=
 =?us-ascii?Q?Sp8APnKwmSdRo+DIuxfw6KIU6T8S2JZV2zy6E2JU27PDTlUghi8lzaSJ4C7F?=
 =?us-ascii?Q?tkKAj+/HykCkaAQV7+WJ2kSik/s52CBkZFSFdCt94yT88MMFC5aSadpGhJKG?=
 =?us-ascii?Q?t++xRDRkW5V0O4lOGBbMPCItNLRcdhnOcTZAV39BJtADh5Llh9rRSuLp418a?=
 =?us-ascii?Q?I5jMiY8wR6yU3d8nRrUFpGCsom9nDX9cee0VlVR787x1B/s6c/3vihGKo1dg?=
 =?us-ascii?Q?Ef8PP0ecDz0LdtYbPZVXH6UDrCtJRnHdYlbGWUw6k/xPdMGOTENzdLTF0G51?=
 =?us-ascii?Q?InYPGpk79QA9bMAIH4s3p3DOCwffkt7kggkDUBeq7slfvarczghZ0CnsnezJ?=
 =?us-ascii?Q?zJ5XLa5ZCBsqA2QXsN0cZOkUvsyel9EzX9jg2SNzP7oBvnMIwn6WgrfqJTVM?=
 =?us-ascii?Q?0pWWUlDlSBhwgsWV8EYhXPLhekj96UPhuNHczBektptnMEdyDVKAmdW0klXC?=
 =?us-ascii?Q?zOKlRhGDT3FzROZfXjdCO7SVPN4l206OfFA80kLHLKd8/teA3tVVRg9wA8+J?=
 =?us-ascii?Q?1q2Six6ZXVma44Eaxb6mrGRkWyBeS6/eLUiS+BeDYXSweNK79eeW4yRczn62?=
 =?us-ascii?Q?Qhi7voqQVhcOAho1pXEZZzaZ2oAvBYZbHjWySYx0ksHWjcnnSuxZ5/T8DYPR?=
 =?us-ascii?Q?1FJRwKWVWg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6491c68a-7f00-45e8-438e-08da4bb48893
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:13:18.6082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlJ5LqogWC6mQQMyvthkr2mnHYMJur9nhhf8QHNleZtQLenh5fzddfMPBCM5JdW/1pF32riDDvIqApr+HFbETQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6347
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a drm bridge driver for i.MX8qm/qxp pixel combiner.
The pixel combiner takes two output streams from a single display
controller and manipulates the two streams to support a number
of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB) configured
as either one screen, two screens, or virtual screens.  The pixel
combiner is also responsible for generating some of the control signals
for the pixel link output channel.  For now, the driver only supports
the bypass mode.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> # Colibri iMX8X, LT170410-2WHC, LP156WF1
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Robert, I keep your R-b tag from v5. Let me know if you want me to drop it, as
v7 contains a fix for checkpatch complaints.
Marcel, as the fix is trivial, I add your T-b tag. Let me know if you want me
to drop it.

v8->v9:
* No change.

v7->v8:
* No change.

v6->v7:
* Fix 'Alignment should match open parenthesis' complaints from
  'checkpatch.pl --strict'.
* Add Marcel's T-b tag.

v5->v6:
* No change.

v4->v5:
* Drop the 'PC_BUF_PARA_REG' register definition. (Robert)
* Add Robert's R-b tag.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 drivers/gpu/drm/bridge/Kconfig                |   2 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/imx/Kconfig            |   8 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 .../drm/bridge/imx/imx8qxp-pixel-combiner.c   | 448 ++++++++++++++++++
 5 files changed, 460 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/imx/Makefile
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 307b135da2f6..236a1342a390 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -366,6 +366,8 @@ source "drivers/gpu/drm/bridge/adv7511/Kconfig"
 
 source "drivers/gpu/drm/bridge/cadence/Kconfig"
 
+source "drivers/gpu/drm/bridge/imx/Kconfig"
+
 source "drivers/gpu/drm/bridge/synopsys/Kconfig"
 
 endmenu
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index f6c0a95de549..d15c86e14243 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -35,4 +35,5 @@ obj-$(CONFIG_DRM_ITE_IT66121) += ite-it66121.o
 
 obj-y += analogix/
 obj-y += cadence/
+obj-y += imx/
 obj-y += synopsys/
diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
new file mode 100644
index 000000000000..f1c91b6814a5
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -0,0 +1,8 @@
+config DRM_IMX8QXP_PIXEL_COMBINER
+	tristate "Freescale i.MX8QM/QXP pixel combiner"
+	depends on OF
+	depends on COMMON_CLK
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable pixel combiner found in
+	  Freescale i.MX8qm/qxp processors.
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
new file mode 100644
index 000000000000..7d7c8d674bf0
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
new file mode 100644
index 000000000000..86ae98a211b4
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -0,0 +1,448 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2020 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
+
+#define PC_CTRL_REG			0x0
+#define  PC_COMBINE_ENABLE		BIT(0)
+#define  PC_DISP_BYPASS(n)		BIT(1 + 21 * (n))
+#define  PC_DISP_HSYNC_POLARITY(n)	BIT(2 + 11 * (n))
+#define  PC_DISP_HSYNC_POLARITY_POS(n)	DISP_HSYNC_POLARITY(n)
+#define  PC_DISP_VSYNC_POLARITY(n)	BIT(3 + 11 * (n))
+#define  PC_DISP_VSYNC_POLARITY_POS(n)	DISP_VSYNC_POLARITY(n)
+#define  PC_DISP_DVALID_POLARITY(n)	BIT(4 + 11 * (n))
+#define  PC_DISP_DVALID_POLARITY_POS(n)	DISP_DVALID_POLARITY(n)
+#define  PC_VSYNC_MASK_ENABLE		BIT(5)
+#define  PC_SKIP_MODE			BIT(6)
+#define  PC_SKIP_NUMBER_MASK		GENMASK(12, 7)
+#define  PC_SKIP_NUMBER(n)		FIELD_PREP(PC_SKIP_NUMBER_MASK, (n))
+#define  PC_DISP0_PIX_DATA_FORMAT_MASK	GENMASK(18, 16)
+#define  PC_DISP0_PIX_DATA_FORMAT(fmt)	\
+				FIELD_PREP(PC_DISP0_PIX_DATA_FORMAT_MASK, (fmt))
+#define  PC_DISP1_PIX_DATA_FORMAT_MASK	GENMASK(21, 19)
+#define  PC_DISP1_PIX_DATA_FORMAT(fmt)	\
+				FIELD_PREP(PC_DISP1_PIX_DATA_FORMAT_MASK, (fmt))
+
+#define PC_SW_RESET_REG			0x20
+#define  PC_SW_RESET_N			BIT(0)
+#define  PC_DISP_SW_RESET_N(n)		BIT(1 + (n))
+#define  PC_FULL_RESET_N		(PC_SW_RESET_N |		\
+					 PC_DISP_SW_RESET_N(0) |	\
+					 PC_DISP_SW_RESET_N(1))
+
+#define PC_REG_SET			0x4
+#define PC_REG_CLR			0x8
+
+#define DRIVER_NAME			"imx8qxp-pixel-combiner"
+
+enum imx8qxp_pc_pix_data_format {
+	RGB,
+	YUV444,
+	YUV422,
+	SPLIT_RGB,
+};
+
+struct imx8qxp_pc_channel {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct imx8qxp_pc *pc;
+	unsigned int stream_id;
+	bool is_available;
+};
+
+struct imx8qxp_pc {
+	struct device *dev;
+	struct imx8qxp_pc_channel ch[2];
+	struct clk *clk_apb;
+	void __iomem *base;
+};
+
+static inline u32 imx8qxp_pc_read(struct imx8qxp_pc *pc, unsigned int offset)
+{
+	return readl(pc->base + offset);
+}
+
+static inline void
+imx8qxp_pc_write(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
+{
+	writel(value, pc->base + offset);
+}
+
+static inline void
+imx8qxp_pc_write_set(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
+{
+	imx8qxp_pc_write(pc, offset + PC_REG_SET, value);
+}
+
+static inline void
+imx8qxp_pc_write_clr(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
+{
+	imx8qxp_pc_write(pc, offset + PC_REG_CLR, value);
+}
+
+static enum drm_mode_status
+imx8qxp_pc_bridge_mode_valid(struct drm_bridge *bridge,
+			     const struct drm_display_info *info,
+			     const struct drm_display_mode *mode)
+{
+	if (mode->hdisplay > 2560)
+		return MODE_BAD_HVALUE;
+
+	return MODE_OK;
+}
+
+static int imx8qxp_pc_bridge_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	struct imx8qxp_pc_channel *ch = bridge->driver_private;
+	struct imx8qxp_pc *pc = ch->pc;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_DEV_ERROR(pc->dev,
+			      "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	if (!bridge->encoder) {
+		DRM_DEV_ERROR(pc->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return drm_bridge_attach(bridge->encoder,
+				 ch->next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static void
+imx8qxp_pc_bridge_mode_set(struct drm_bridge *bridge,
+			   const struct drm_display_mode *mode,
+			   const struct drm_display_mode *adjusted_mode)
+{
+	struct imx8qxp_pc_channel *ch = bridge->driver_private;
+	struct imx8qxp_pc *pc = ch->pc;
+	u32 val;
+	int ret;
+
+	ret = pm_runtime_get_sync(pc->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(pc->dev,
+			      "failed to get runtime PM sync: %d\n", ret);
+
+	ret = clk_prepare_enable(pc->clk_apb);
+	if (ret)
+		DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
+			      __func__,  ret);
+
+	/* HSYNC to pixel link is active low. */
+	imx8qxp_pc_write_clr(pc, PC_CTRL_REG,
+			     PC_DISP_HSYNC_POLARITY(ch->stream_id));
+
+	/* VSYNC to pixel link is active low. */
+	imx8qxp_pc_write_clr(pc, PC_CTRL_REG,
+			     PC_DISP_VSYNC_POLARITY(ch->stream_id));
+
+	/* Data enable to pixel link is active high. */
+	imx8qxp_pc_write_set(pc, PC_CTRL_REG,
+			     PC_DISP_DVALID_POLARITY(ch->stream_id));
+
+	/* Mask the first frame output which may be incomplete. */
+	imx8qxp_pc_write_set(pc, PC_CTRL_REG, PC_VSYNC_MASK_ENABLE);
+
+	/* Only support RGB currently. */
+	val = imx8qxp_pc_read(pc, PC_CTRL_REG);
+	if (ch->stream_id == 0) {
+		val &= ~PC_DISP0_PIX_DATA_FORMAT_MASK;
+		val |= PC_DISP0_PIX_DATA_FORMAT(RGB);
+	} else {
+		val &= ~PC_DISP1_PIX_DATA_FORMAT_MASK;
+		val |= PC_DISP1_PIX_DATA_FORMAT(RGB);
+	}
+	imx8qxp_pc_write(pc, PC_CTRL_REG, val);
+
+	/* Only support bypass mode currently. */
+	imx8qxp_pc_write_set(pc, PC_CTRL_REG, PC_DISP_BYPASS(ch->stream_id));
+
+	clk_disable_unprepare(pc->clk_apb);
+}
+
+static void
+imx8qxp_pc_bridge_atomic_disable(struct drm_bridge *bridge,
+				 struct drm_bridge_state *old_bridge_state)
+{
+	struct imx8qxp_pc_channel *ch = bridge->driver_private;
+	struct imx8qxp_pc *pc = ch->pc;
+	int ret;
+
+	ret = pm_runtime_put(pc->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(pc->dev, "failed to put runtime PM: %d\n", ret);
+}
+
+static const u32 imx8qxp_pc_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
+	MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
+};
+
+static bool imx8qxp_pc_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx8qxp_pc_bus_output_fmts); i++) {
+		if (imx8qxp_pc_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx8qxp_pc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state,
+					    struct drm_crtc_state *crtc_state,
+					    struct drm_connector_state *conn_state,
+					    u32 output_fmt,
+					    unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	if (!imx8qxp_pc_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X36_CPADLO:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X30_CPADLO;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X36_CPADLO:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X30_CPADLO;
+		break;
+	default:
+		kfree(input_fmts);
+		input_fmts = NULL;
+		break;
+	}
+
+	return input_fmts;
+}
+
+static u32 *
+imx8qxp_pc_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state,
+					     struct drm_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state,
+					     unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx8qxp_pc_bus_output_fmts);
+	return kmemdup(imx8qxp_pc_bus_output_fmts,
+			sizeof(imx8qxp_pc_bus_output_fmts), GFP_KERNEL);
+}
+
+static const struct drm_bridge_funcs imx8qxp_pc_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.mode_valid		= imx8qxp_pc_bridge_mode_valid,
+	.attach			= imx8qxp_pc_bridge_attach,
+	.mode_set		= imx8qxp_pc_bridge_mode_set,
+	.atomic_disable		= imx8qxp_pc_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+				imx8qxp_pc_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+				imx8qxp_pc_bridge_atomic_get_output_bus_fmts,
+};
+
+static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
+{
+	struct imx8qxp_pc *pc;
+	struct imx8qxp_pc_channel *ch;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *child, *remote;
+	u32 i;
+	int ret;
+
+	pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
+	if (!pc)
+		return -ENOMEM;
+
+	pc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pc->base))
+		return PTR_ERR(pc->base);
+
+	pc->dev = dev;
+
+	pc->clk_apb = devm_clk_get(dev, "apb");
+	if (IS_ERR(pc->clk_apb)) {
+		ret = PTR_ERR(pc->clk_apb);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get apb clock: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, pc);
+	pm_runtime_enable(dev);
+
+	for_each_available_child_of_node(np, child) {
+		ret = of_property_read_u32(child, "reg", &i);
+		if (ret || i > 1) {
+			ret = -EINVAL;
+			DRM_DEV_ERROR(dev,
+				      "invalid channel(%u) node address\n", i);
+			goto free_child;
+		}
+
+		ch = &pc->ch[i];
+		ch->pc = pc;
+		ch->stream_id = i;
+
+		remote = of_graph_get_remote_node(child, 1, 0);
+		if (!remote) {
+			ret = -ENODEV;
+			DRM_DEV_ERROR(dev,
+				      "channel%u failed to get port1's remote node: %d\n",
+				      i, ret);
+			goto free_child;
+		}
+
+		ch->next_bridge = of_drm_find_bridge(remote);
+		if (!ch->next_bridge) {
+			of_node_put(remote);
+			ret = -EPROBE_DEFER;
+			DRM_DEV_DEBUG_DRIVER(dev,
+					     "channel%u failed to find next bridge: %d\n",
+					     i, ret);
+			goto free_child;
+		}
+
+		of_node_put(remote);
+
+		ch->bridge.driver_private = ch;
+		ch->bridge.funcs = &imx8qxp_pc_bridge_funcs;
+		ch->bridge.of_node = child;
+		ch->is_available = true;
+
+		drm_bridge_add(&ch->bridge);
+	}
+
+	return 0;
+
+free_child:
+	of_node_put(child);
+
+	if (i == 1 && pc->ch[0].next_bridge)
+		drm_bridge_remove(&pc->ch[0].bridge);
+
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static int imx8qxp_pc_bridge_remove(struct platform_device *pdev)
+{
+	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
+	struct imx8qxp_pc_channel *ch;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		ch = &pc->ch[i];
+
+		if (!ch->is_available)
+			continue;
+
+		drm_bridge_remove(&ch->bridge);
+		ch->is_available = false;
+	}
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused imx8qxp_pc_runtime_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_prepare_enable(pc->clk_apb);
+	if (ret)
+		DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
+			      __func__,  ret);
+
+	/* Disable pixel combiner by full reset. */
+	imx8qxp_pc_write_clr(pc, PC_SW_RESET_REG, PC_FULL_RESET_N);
+
+	clk_disable_unprepare(pc->clk_apb);
+
+	/* Ensure the reset takes effect. */
+	usleep_range(10, 20);
+
+	return ret;
+}
+
+static int __maybe_unused imx8qxp_pc_runtime_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_prepare_enable(pc->clk_apb);
+	if (ret) {
+		DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
+			      __func__, ret);
+		return ret;
+	}
+
+	/* out of reset */
+	imx8qxp_pc_write_set(pc, PC_SW_RESET_REG, PC_FULL_RESET_N);
+
+	clk_disable_unprepare(pc->clk_apb);
+
+	return ret;
+}
+
+static const struct dev_pm_ops imx8qxp_pc_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx8qxp_pc_runtime_suspend,
+			   imx8qxp_pc_runtime_resume, NULL)
+};
+
+static const struct of_device_id imx8qxp_pc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qm-pixel-combiner", },
+	{ .compatible = "fsl,imx8qxp-pixel-combiner", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8qxp_pc_dt_ids);
+
+static struct platform_driver imx8qxp_pc_bridge_driver = {
+	.probe	= imx8qxp_pc_bridge_probe,
+	.remove = imx8qxp_pc_bridge_remove,
+	.driver	= {
+		.pm = &imx8qxp_pc_pm_ops,
+		.name = DRIVER_NAME,
+		.of_match_table = imx8qxp_pc_dt_ids,
+	},
+};
+module_platform_driver(imx8qxp_pc_bridge_driver);
+
+MODULE_DESCRIPTION("i.MX8QM/QXP pixel combiner bridge driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.25.1

