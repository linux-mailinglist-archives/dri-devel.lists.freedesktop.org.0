Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E928B547557
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A0C10E407;
	Sat, 11 Jun 2022 14:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BD810F991
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:13:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzESpkEw14E/Y24icc5OgrjmFsT90L9imK9zF8Ve114I1/47p7mSuAa5s4v6ND/TI7bxrtObWOq9mUl9AwB5tY+WpWhRPJXbBveRUi3PHqlZ27Ze1810e63xwH8IzNc+ZKudgBS/f4bAWQo4xQ2u56Kh9X39LzAG1PeUWZfsfGtvD4AIVtmk7ljqB/ba+9tXgHSRg1faebckUl32EpqE7pblkZT9OCN1lYGdJ5mOQmlGdnh5YENvsJ8w5FRQ/MWZE9PNoR2WfdETTZDhGqJr5NU5+FuvrIJdLqLO7BsSU3fonK0MtlhZQt/7mfe3rIHfPQirNzR4aj+M8pIMyZzhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3mXuJUoNJDuf+vqgjpQNqYnj0IY5r4aDzEpFJRhQ1g=;
 b=UD46Yo2xsyA1UJuomyr8sO73wq29lOkgiRVgyO0yT+ic+RVAbKnv3MbzlHc4dOUsnyUlWnGtWlNZfOS4876ExqlGtBNwBdgyRnKk11gNqTb3FEvy+puBSWgrFe+gsxfuK4lFVT9Quf6ndO3HwNOjYjDrnKo7AZ1tymbpfRC1whUIXVhuTWCwA2AEouTe0Nm2tT4p9c1wTgGPURJGlUuoxag8iKC/f832mH0IHgk1dGTIk+btZmFVq8j2dPWGNhRVMZkMaiIvNU2mLEMlapnZC2OXTLnAp6J2MCZ53MQFeNI996aZxjKSILCsE14zIbDiyI8Jx1o2MeH3b5SIB3Y12Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3mXuJUoNJDuf+vqgjpQNqYnj0IY5r4aDzEpFJRhQ1g=;
 b=P48KphX4hq9KOy+XWkZSktvSGtNTLJlnOA6qy7WAWKhk5Ecp+qAtuA4l00YVbPiSdOCRvJunzh5zIR8g3VsgYmvTBo5IwXZMKmffScSNxIIxsx0JxgLk7/W/umJ1Hz9g9CgdXbLSOrnRviVWhD9FULvj6tMhw+ysY0faAEM6lGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6347.eurprd04.prod.outlook.com (2603:10a6:10:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sat, 11 Jun
 2022 14:13:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:13:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 06/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel link
 support
Date: Sat, 11 Jun 2022 22:14:13 +0800
Message-Id: <20220611141421.718743-7-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 94bd883d-51fc-4e48-7fc1-08da4bb48ff0
X-MS-TrafficTypeDiagnostic: DB8PR04MB6347:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB8PR04MB6347EC9ED71246F744DEE3DE98A99@DB8PR04MB6347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: umnLMEKBOq4ccRX529dG3vbOl+EE5GDsFdIV1HIRRAjlma5gbtTnQTojCXwp7jT64twLt8GUGj6AUKXjs0TWj5HtkNkBYwOf2H7hIEV4NkTG2+ynLR6GIYf0uOeM4JRoK7HxHW86Bl3pOlAmF/JmOufg9YXiFLz7XSteSqKGQzeDc706Fb7OTEtDSLoOmd6mN7KaB0KBTzjHDp+qGM9+Xpy1V6/JMFcf/5FKNp3vKLvwQOFzO6ZWxkn6imXkkqQGZPigVDa03ld1PDSjZGIiBLthDLANyMlEsUn1Fhr6ZU84p41Pk0fDSQnsvIqihWdPFVbYctSvG+rsBqzEwW9OShAFOmWREpZCqq17UDLlZBBiIjyZv+DFr7z8ttXNdmmaGwZhGi4mMG+RtwWQoar3/63yt06wBqF8syMyr3EKG99DDy+T1U3x+2fq3MiTCeX7pv9RiREnA54tXTxomIA/7PCBpORQtlx8OAfPrTQLZDQTgLkB/m59f0enoRo+85eKyykPN7Z7j+Mr5ZFaST+/oEE9HWD+SYQRPGaWsWLhl1ihwHLy1OdRAeNbjilZR6TXpwJ2yfkuagWKdaEOWhSHHc6i45bLfHuvkaUlw17SdJS0kpBY+UOawGIyriuLSng8XQLgmPDlvM2G/O99H5Pf0zXqM456c9bNchmwO9i17Mwezc+0PuAmIU7ZhFuZQvZuD4zFP3wSBFyqOkFNpSOs1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(5660300002)(66556008)(66476007)(66946007)(1076003)(4326008)(8676002)(86362001)(316002)(186003)(8936002)(2616005)(7416002)(30864003)(36756003)(52116002)(38350700002)(38100700002)(6512007)(26005)(6506007)(6666004)(508600001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ATyCvycCnuSKvh3K6jtk/gKUIJJX2rhUokJ8ggueoeogYjoKZB8apiHJxIMI?=
 =?us-ascii?Q?vut/AcCf3IuxG99t1FtLZki/Vgme1JC51L6cmqYjKL28R0ERu0H0hRt/x9zN?=
 =?us-ascii?Q?IIFXq7blT/b/YWhQtcMGH/W30ZYVYU3+fvos2zcOoo7plRPIS2CTuzcVA41M?=
 =?us-ascii?Q?CNk2ifYO1fc7J+ldD4Hjp+TZ7a1GId2cqVxVNpg+IB9YnJ8FcqwEe9yeTAUs?=
 =?us-ascii?Q?JVKj4VVajr017TXXcS8puOB1J9WIcITHgyGVc61jMQwkQMge8gBYK7sT18sM?=
 =?us-ascii?Q?wp5KnNE1VyvG9Hj950Rbd3nN/KZviXIUDQqNvb9FYTh4B7WCGtdYZL9pXu9U?=
 =?us-ascii?Q?RRDK8HKR0hPJbQieUY8L0GFMaJcwUzXqhZcf31dQ7DQEbgWYjd8hP1I7Lma9?=
 =?us-ascii?Q?RopVCK92iyStF+wjGUM0gi7HZt+/IDdNX+QlAvaOiwjRZLaF3NE6Dc50pD78?=
 =?us-ascii?Q?HNUQHqhMRWeuLXfPxKcXCbLZccSTDsS8pL+9yZvCVHHcMHZo9mql23QVXRcF?=
 =?us-ascii?Q?KBcB5gAnDMuWznRcqiLkNTXx5ZkBdJ+/G7XiUDZIhg4a2MNT+PYGdRfrpG+r?=
 =?us-ascii?Q?aF3l3Kc8CI0JqT8vY+Qy2bm0mEQANeBH6PyTz2IWOClDuiUtqxZSRtWuKJCr?=
 =?us-ascii?Q?cnD4Ev6R2guCRO7IvLfe/zQIWQ66kONqtKqSBYUgwqYUCqJWsm5bgNqnRRG5?=
 =?us-ascii?Q?2bbEZv4L5sB6gYCy6CByAan39ln/FNwc/fzRAiZUjKH3ysYIL5NnTHbJfnu1?=
 =?us-ascii?Q?Jjce7iGpdpaMpn1Z+FWnuNv4fLQy9+HU7cqDhJhYWVTDsIyqjE9VBeKGNiyw?=
 =?us-ascii?Q?IOQNy1NpTXeHO6rS+QjghU8m+8963tsFy9kjxeNwnjV27H0ZlL+bBB7BszDY?=
 =?us-ascii?Q?uQxg8pS+6hkFbDE9xX99hb+JoX0qgKeYY1wToCrHbgPMZPmT3DJCz22GMyif?=
 =?us-ascii?Q?KbEJ/Fzs5txBOQCasCvAjDOwQDXv22rMDsVhA03K60rJCMn3CoMS9o09aNU4?=
 =?us-ascii?Q?Hr0MBp+OeSkP3WAv/SiVXePj0Ke5KSHN1nVrS7o/ACcHHoisEVdqKr4cxjZS?=
 =?us-ascii?Q?mppoaamN7TZ+KOPzt4wW6+bryiDzjAEXhzTjFpIf3KuappwWI+xCFkWuTf5v?=
 =?us-ascii?Q?F8VYNrWStg+n6OSpNXWhC7MHfh413+F0TCfxOf/N5v7ULnQzUHZO81dSCDnf?=
 =?us-ascii?Q?QPccKnAfgalOkCWmTMqzVRS15itIfWIabB9m1Xbr53kIjfrLHOPf70qZvozv?=
 =?us-ascii?Q?/G1Gz1KHl4yCQ2e2dxooHQa9GUFr+58rZps2pPGYNsajwYJEmzknuqzZSoHm?=
 =?us-ascii?Q?+7YEU2+rqIzIulnjm8B3JIIdQCWqCf1DSD0roorz2HK2ucT4JJnXQFvcBvxb?=
 =?us-ascii?Q?Ok+fyReY+FWYchAxbk8tksxASNp6vK5tzP6tfKERMMU7zSEMa6X/zYiEhr41?=
 =?us-ascii?Q?KfNz7HKM3MQMGEu29Q02mRhYUkonpTHM/q0g3Wt2W7ACfBAwseQXnQlO6kVK?=
 =?us-ascii?Q?252AECQtBCvTrwtMQ+q8Q7CIUAQ6tfNIAHIHuZCpE1pHQsXu/IW6K9+JUWTD?=
 =?us-ascii?Q?r/EE9Rz7ECXbD8Pjx0RHHSQQJhCByuot2i1ezUPhYVfXaOWSyxWajEkzljXo?=
 =?us-ascii?Q?ZH1p4jR+JLfPK7eaF8nggohwmW0drm2UvB9DayakQ2duWEMX7xCJhYRrklsQ?=
 =?us-ascii?Q?DFLpDpnUDGeDDW7EzYbB79OeXCqW/UDcadPmEWsWMc9U9YijzlVOaxXGMnFV?=
 =?us-ascii?Q?SFBgdAcbHg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bd883d-51fc-4e48-7fc1-08da4bb48ff0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:13:30.8864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZVo40x/Pmn9kaKr4/Xs4bAXvVm3CAjcJEdGD0vCj2iJf4xiWJQqkPghkHneH16gwh8lKurTqaKlfKPS7N0qpA==
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

This patch adds a drm bridge driver for i.MX8qm/qxp display pixel link.
The pixel link forms a standard asynchronous linkage between
pixel sources(display controller or camera module) and pixel
consumers(imaging or displays).  It consists of two distinct
functions, a pixel transfer function and a control interface.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> # Colibri iMX8X, LT170410-2WHC, LP156WF1
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Robert, I keep your R-b tag from v5. Let me know if you want me to drop it, as
v7 contains a fix for checkpatch complaints and change in v9 is kinda trivial.
Marcel, as the v7 fix and v9 change are kinda trivial, I add your T-b tag.  Let
me know if you want me to drop it.

v8->v9:
* Depend on IMX_SCU. (Laurent)
* Get DC index and DC stream index from 'fsl,dc-id' and 'fsl,dc-stream-id'
  properties instead of OF alias. (Laurent)

v7->v8:
* No change.

v6->v7:
* Fix 'Alignment should match open parenthesis' complaints from
  'checkpatch.pl --strict'.
* Add Marcel's T-b tag.

v5->v6:
* No change.

v4->v5:
* Make a comment occupy a line. (Robert)
* Add Robert's R-b tag.

v3->v4:
* No change.

v2->v3:
* Drop two macros which help define functions and define them directly.
* Properly disable all pixel link controls to POR value by calling
  imx8qxp_pixel_link_disable_all_controls() from
  imx8qxp_pixel_link_bridge_probe().

v1->v2:
* Rewrite the function to find the next bridge by properly using OF APIs
  and dropping unnecessary DT validation. (Rob)

 drivers/gpu/drm/bridge/imx/Kconfig            |   9 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 429 ++++++++++++++++++
 3 files changed, 439 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index f1c91b6814a5..9f6ec601af37 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -6,3 +6,12 @@ config DRM_IMX8QXP_PIXEL_COMBINER
 	help
 	  Choose this to enable pixel combiner found in
 	  Freescale i.MX8qm/qxp processors.
+
+config DRM_IMX8QXP_PIXEL_LINK
+	tristate "Freescale i.MX8QM/QXP display pixel link"
+	depends on OF
+	depends on IMX_SCU
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable display pixel link found in
+	  Freescale i.MX8qm/qxp processors.
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index 7d7c8d674bf0..c15469fb5789 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
+obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
new file mode 100644
index 000000000000..305c833f11ee
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2020,2022 NXP
+ */
+
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+#define DRIVER_NAME		"imx8qxp-display-pixel-link"
+#define PL_MAX_MST_ADDR		3
+#define PL_MAX_NEXT_BRIDGES	2
+
+struct imx8qxp_pixel_link {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct device *dev;
+	struct imx_sc_ipc *ipc_handle;
+	u8 stream_id;
+	u8 dc_id;
+	u32 sink_rsc;
+	u32 mst_addr;
+	u8 mst_addr_ctrl;
+	u8 mst_en_ctrl;
+	u8 mst_vld_ctrl;
+	u8 sync_ctrl;
+};
+
+static void imx8qxp_pixel_link_enable_mst_en(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->mst_en_ctrl, true);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			      "failed to enable DC%u stream%u pixel link mst_en: %d\n",
+			      pl->dc_id, pl->stream_id, ret);
+}
+
+static void imx8qxp_pixel_link_enable_mst_vld(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->mst_vld_ctrl, true);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			      "failed to enable DC%u stream%u pixel link mst_vld: %d\n",
+			      pl->dc_id, pl->stream_id, ret);
+}
+
+static void imx8qxp_pixel_link_enable_sync(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->sync_ctrl, true);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			      "failed to enable DC%u stream%u pixel link sync: %d\n",
+			      pl->dc_id, pl->stream_id, ret);
+}
+
+static int imx8qxp_pixel_link_disable_mst_en(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->mst_en_ctrl, false);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			      "failed to disable DC%u stream%u pixel link mst_en: %d\n",
+			      pl->dc_id, pl->stream_id, ret);
+
+	return ret;
+}
+
+static int imx8qxp_pixel_link_disable_mst_vld(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->mst_vld_ctrl, false);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			      "failed to disable DC%u stream%u pixel link mst_vld: %d\n",
+			      pl->dc_id, pl->stream_id, ret);
+
+	return ret;
+}
+
+static int imx8qxp_pixel_link_disable_sync(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->sync_ctrl, false);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			      "failed to disable DC%u stream%u pixel link sync: %d\n",
+			      pl->dc_id, pl->stream_id, ret);
+
+	return ret;
+}
+
+static void imx8qxp_pixel_link_set_mst_addr(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle,
+				      pl->sink_rsc, pl->mst_addr_ctrl,
+				      pl->mst_addr);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			      "failed to set DC%u stream%u pixel link mst addr(%u): %d\n",
+			      pl->dc_id, pl->stream_id, pl->mst_addr, ret);
+}
+
+static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
+					    enum drm_bridge_attach_flags flags)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_DEV_ERROR(pl->dev,
+			      "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	if (!bridge->encoder) {
+		DRM_DEV_ERROR(pl->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return drm_bridge_attach(bridge->encoder,
+				 pl->next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static void
+imx8qxp_pixel_link_bridge_mode_set(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adjusted_mode)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	imx8qxp_pixel_link_set_mst_addr(pl);
+}
+
+static void
+imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_bridge_state)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	imx8qxp_pixel_link_enable_mst_en(pl);
+	imx8qxp_pixel_link_enable_mst_vld(pl);
+	imx8qxp_pixel_link_enable_sync(pl);
+}
+
+static void
+imx8qxp_pixel_link_bridge_atomic_disable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *old_bridge_state)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	imx8qxp_pixel_link_disable_mst_en(pl);
+	imx8qxp_pixel_link_disable_mst_vld(pl);
+	imx8qxp_pixel_link_disable_sync(pl);
+}
+
+static const u32 imx8qxp_pixel_link_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
+	MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
+};
+
+static bool imx8qxp_pixel_link_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts); i++) {
+		if (imx8qxp_pixel_link_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+						    struct drm_bridge_state *bridge_state,
+						    struct drm_crtc_state *crtc_state,
+						    struct drm_connector_state *conn_state,
+						    u32 output_fmt,
+						    unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	if (!imx8qxp_pixel_link_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = output_fmt;
+
+	return input_fmts;
+}
+
+static u32 *
+imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+						     struct drm_bridge_state *bridge_state,
+						     struct drm_crtc_state *crtc_state,
+						     struct drm_connector_state *conn_state,
+						     unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts);
+	return kmemdup(imx8qxp_pixel_link_bus_output_fmts,
+			sizeof(imx8qxp_pixel_link_bus_output_fmts), GFP_KERNEL);
+}
+
+static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.attach			= imx8qxp_pixel_link_bridge_attach,
+	.mode_set		= imx8qxp_pixel_link_bridge_mode_set,
+	.atomic_enable		= imx8qxp_pixel_link_bridge_atomic_enable,
+	.atomic_disable		= imx8qxp_pixel_link_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+			imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+			imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts,
+};
+
+static int imx8qxp_pixel_link_disable_all_controls(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx8qxp_pixel_link_disable_mst_en(pl);
+	if (ret)
+		return ret;
+
+	ret = imx8qxp_pixel_link_disable_mst_vld(pl);
+	if (ret)
+		return ret;
+
+	return imx8qxp_pixel_link_disable_sync(pl);
+}
+
+static struct drm_bridge *
+imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
+{
+	struct device_node *np = pl->dev->of_node;
+	struct device_node *port, *remote;
+	struct drm_bridge *next_bridge[PL_MAX_NEXT_BRIDGES];
+	u32 port_id;
+	bool found_port = false;
+	int reg, ep_cnt = 0;
+	/* select the first next bridge by default */
+	int bridge_sel = 0;
+
+	for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
+		port = of_graph_get_port_by_id(np, port_id);
+		if (!port)
+			continue;
+
+		if (of_device_is_available(port)) {
+			found_port = true;
+			of_node_put(port);
+			break;
+		}
+
+		of_node_put(port);
+	}
+
+	if (!found_port) {
+		DRM_DEV_ERROR(pl->dev, "no available output port\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
+		remote = of_graph_get_remote_node(np, port_id, reg);
+		if (!remote)
+			continue;
+
+		if (!of_device_is_available(remote->parent)) {
+			DRM_DEV_DEBUG(pl->dev,
+				      "port%u endpoint%u remote parent is not available\n",
+				      port_id, reg);
+			of_node_put(remote);
+			continue;
+		}
+
+		next_bridge[ep_cnt] = of_drm_find_bridge(remote);
+		if (!next_bridge[ep_cnt]) {
+			of_node_put(remote);
+			return ERR_PTR(-EPROBE_DEFER);
+		}
+
+		/* specially select the next bridge with companion PXL2DPI */
+		if (of_find_property(remote, "fsl,companion-pxl2dpi", NULL))
+			bridge_sel = ep_cnt;
+
+		ep_cnt++;
+
+		of_node_put(remote);
+	}
+
+	pl->mst_addr = port_id - 1;
+
+	return next_bridge[bridge_sel];
+}
+
+static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
+{
+	struct imx8qxp_pixel_link *pl;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	pl = devm_kzalloc(dev, sizeof(*pl), GFP_KERNEL);
+	if (!pl)
+		return -ENOMEM;
+
+	ret = imx_scu_get_handle(&pl->ipc_handle);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
+				      ret);
+		return ret;
+	}
+
+	ret = of_property_read_u8(np, "fsl,dc-id", &pl->dc_id);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to get DC index: %d\n", ret);
+		return ret;
+	}
+
+	ret = of_property_read_u8(np, "fsl,dc-stream-id", &pl->stream_id);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to get DC stream index: %d\n", ret);
+		return ret;
+	}
+
+	pl->dev = dev;
+
+	pl->sink_rsc = pl->dc_id ? IMX_SC_R_DC_1 : IMX_SC_R_DC_0;
+
+	if (pl->stream_id == 0) {
+		pl->mst_addr_ctrl = IMX_SC_C_PXL_LINK_MST1_ADDR;
+		pl->mst_en_ctrl   = IMX_SC_C_PXL_LINK_MST1_ENB;
+		pl->mst_vld_ctrl  = IMX_SC_C_PXL_LINK_MST1_VLD;
+		pl->sync_ctrl     = IMX_SC_C_SYNC_CTRL0;
+	} else {
+		pl->mst_addr_ctrl = IMX_SC_C_PXL_LINK_MST2_ADDR;
+		pl->mst_en_ctrl   = IMX_SC_C_PXL_LINK_MST2_ENB;
+		pl->mst_vld_ctrl  = IMX_SC_C_PXL_LINK_MST2_VLD;
+		pl->sync_ctrl     = IMX_SC_C_SYNC_CTRL1;
+	}
+
+	/* disable all controls to POR default */
+	ret = imx8qxp_pixel_link_disable_all_controls(pl);
+	if (ret)
+		return ret;
+
+	pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
+	if (IS_ERR(pl->next_bridge)) {
+		ret = PTR_ERR(pl->next_bridge);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
+				      ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, pl);
+
+	pl->bridge.driver_private = pl;
+	pl->bridge.funcs = &imx8qxp_pixel_link_bridge_funcs;
+	pl->bridge.of_node = np;
+
+	drm_bridge_add(&pl->bridge);
+
+	return ret;
+}
+
+static int imx8qxp_pixel_link_bridge_remove(struct platform_device *pdev)
+{
+	struct imx8qxp_pixel_link *pl = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&pl->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id imx8qxp_pixel_link_dt_ids[] = {
+	{ .compatible = "fsl,imx8qm-dc-pixel-link", },
+	{ .compatible = "fsl,imx8qxp-dc-pixel-link", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8qxp_pixel_link_dt_ids);
+
+static struct platform_driver imx8qxp_pixel_link_bridge_driver = {
+	.probe	= imx8qxp_pixel_link_bridge_probe,
+	.remove = imx8qxp_pixel_link_bridge_remove,
+	.driver	= {
+		.of_match_table = imx8qxp_pixel_link_dt_ids,
+		.name = DRIVER_NAME,
+	},
+};
+module_platform_driver(imx8qxp_pixel_link_bridge_driver);
+
+MODULE_DESCRIPTION("i.MX8QXP/QM display pixel link bridge driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.25.1

