Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598019D8262
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB25810E3C0;
	Mon, 25 Nov 2024 09:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="mTDJdUYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AE710E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:34:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U10LF7Cr7N87qRhp39Tu3YLrQdFbE7dXrfwZZdWbTs6CqTlKAaUFTCvJGhC745qRmrvuiybirobrxeS/dVjHjwv16iyF2ugrAvh8lAb+r/IdHQNS7t72GPniiO5OvsKgIjLYzpYxrJ5El47kWroK/hIYWH4aVzB2AvQPqz9jJ4HxLtDuDLr1ft4SYEzNwZDiuBu3KyTaOzK2TOLmC77NXdWr5j1mqWd2Y1xkNPVrKgg7wyv4Pyz0f8MdbCqdDR3wAWC/zm4sZB3FxjBnJ/tmOsF+gAj+W13lQmiCZb1X67oKAEmOhCk/Cj2k2pg8lohCn+xqiT11zKT5YMp0qeTTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KugDvRG4a58luOEHFLhtaKT6jgj6V08L3FRn6QW0alw=;
 b=jEcSowEgUOGuCUX/M+x6jlm2qxPdFPlihA1LqKPNrRn7fdEprSCz5NT2XPkFSgSRRWWPhUretCgpH91vZk1ifTd/jqDXah4V5ZRtbDB6triElPuX1axY3GRK2SH2I+StHssxZHNdHEejm3uegRFI6ZQEmfz2rpXrOuKIK/EabkXgUg8ozynsHI13t1jUwm/cO6FZjJG5Fg2tjl6bf2pUrv2yi08CdSSbVv46ndSPmC10bGuoqJyKV42b5Tu7uExivlwXlIbxzgPch23S6y3lbyskrrLqznJXZw06Ye2bYfjzddeILI9pK2Gfc/K+eVG5q50czslK8W+OK/2Rrc/qUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KugDvRG4a58luOEHFLhtaKT6jgj6V08L3FRn6QW0alw=;
 b=mTDJdUYr4uVseytNZPxsqvhMEcVfPE/KxAnSZOzHxFXeLEC8qy9Wd8U0NoLts/hEjbQBo/exBWVdX4GADuPhMB4799FE23NwYVUQJPk5jmfVMO8EL6tbwJkKYCpugZj4YZwuIJ+L7Z9n1Kol/KAH5noKcxs4SLACQ/UPGX6isyXz+YdfFreQAODqO79jp48u97ejPc3kMFbIYqQruFN+JNQPsOFUSjnKNBMtX6WWbypYGDdqf4m/u62SI4WTmGy3ENPI1LfIjzmyZocOrrGvQ72FYM+Xpr+1vAgsTSIOOyS2QSjGhxI1NCzXYefDXRCjjRTpCiNk6j9Zp37wNEX7Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7919.eurprd04.prod.outlook.com (2603:10a6:102:c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 09:34:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:34:20 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v4 10/19] drm/imx: Add i.MX8qxp Display Controller pixel engine
Date: Mon, 25 Nov 2024 17:33:07 +0800
Message-Id: <20241125093316.2357162-11-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 4827f7d0-6c28-47a8-e579-08dd0d3456d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hv09ziFjtRehP41LKIcb0Tj2F4r07mb2+D8W1ShlD93We2mV+Qo0119V4VKn?=
 =?us-ascii?Q?y5lBrMkQ133ZL56QQ1DrXSj/dWNUJwaVrIo9Q5F8fxVr4al5nxGY+e4udM6t?=
 =?us-ascii?Q?sJEVSY3E4mQNeJihUK+Ri109HtGvpj2mPJlAHzXTR5F+dFT59cV6mrrasDjL?=
 =?us-ascii?Q?+lcNhsIaiW29GaHR9DkAaDED1h0CaENKOtweziMzZA/zP23RspWh8DfJdvek?=
 =?us-ascii?Q?43WXKzx0TmuQFKEerF+0tikBr1iTJsS9GLBgR8Cx1snNSFDFZBDRBnQf/dV9?=
 =?us-ascii?Q?W0rw4YrG3mHjIGQIK/c14AxUiPMnyL5v7kinya2WI44MI4mMHZlYN+CQJlxQ?=
 =?us-ascii?Q?hCvDFHY2oYzMBo/s8ImKHrNGIImwnhrDksQEQzSgbRSXGTCcOeS/1tI21F6W?=
 =?us-ascii?Q?TzRpq+FjnA8nR5dm0NmjHM6ieBdfqsgoPUINBGZPdZD4dVSsfztGs0oumwys?=
 =?us-ascii?Q?eM1bitWn1Pq+Za2TGV76jYd6da51bzcdDaMf3sNBbZD0o8c9mLFlGHVA6OzV?=
 =?us-ascii?Q?m8NdNxx/NmMr5V3JKz+fzfC/5+ZaeWrTqNShkXX6dkt2LWaZkwvimxFvgZiL?=
 =?us-ascii?Q?Fwx726RI44EpyB6/OLoPGF8KCqBke82P9l5hHIk7w4xaHVbtKPQwh1VIltDA?=
 =?us-ascii?Q?6tChFGr/kF68X+V+Q5jGynaao60AEqpRzlilxcapaTl/Fou4pTDwCC/XPdbg?=
 =?us-ascii?Q?+pnADAYX4T6ZMpr1TNwtd3Ziwm8FP9e62dVjYwXXQca3fiQKeqP9gxWkKM19?=
 =?us-ascii?Q?oJN8T2VoHLnQpADK4AIykdwKoqINEO3tQdSiIgEPP9I/QNWczO6Pll6zZ60H?=
 =?us-ascii?Q?5d26ri1a1mkgj/FfHuOPXl79ZSFSdy6ft0V30vMJ3RUw/Di9k7XeiVjMjbQx?=
 =?us-ascii?Q?5HlUkNidm/P7TAlCvqHBM5EF7vQ8Eh5HIw2ggb4ISMAhwhuHdrKaGKhwf895?=
 =?us-ascii?Q?DJ6fbmR+5w24eFyMfL5o9AB8lWZBZU80YJmShMgvyi8MqTpQioHxdO7fLvTj?=
 =?us-ascii?Q?nc5L0tXslCzeSzH16SICTTIAPsY4pe10wBFSHTF7Pn67EHk/sLUBZE7p1iOn?=
 =?us-ascii?Q?pFQsilvMnlrje2PPk4nDtArvs/yH3NfRLtdwWdpG3KxaGN0qgExRyE1EoaQU?=
 =?us-ascii?Q?ehYUxBALqQtYfL0+mhrm7+evXaMJmf5QydcMZ7cY4NcZznBuO/IQygsPcRC2?=
 =?us-ascii?Q?NnavUS82l/qp0DIS7sCGkd3+WRub4oF2ndmD/yYXi7fy+HlWIceHzGASwhkc?=
 =?us-ascii?Q?0RUZabvFnVUzfx7qVhH6KWWWYvwnXckzFP1mUIVwPmYINbE2Ws+dfNjldosc?=
 =?us-ascii?Q?4UmJbA68Wh42mZfDOuN1CtvkPY6IC2Hl2ScCRgZ//zmt7uPMsyIBwvfE7zCT?=
 =?us-ascii?Q?2CaWSh4EwxJQMU/Ox0uq/WoRxZ7kEBEJhfX6T3SLBSKHgkb7LQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4w54ZWOGBtkkajJfP5fvdkH2yEazBIjq+JPWZci8Pid849Cid+GEv5FRl8F5?=
 =?us-ascii?Q?+xWJD92nW4q87+B+N2HD6MTyIG8dbSoZOKnt1D+Nt3oCkd2VKTh1TPc/tomr?=
 =?us-ascii?Q?mdXVBfegiaxU/qV39EE0ZT2juKuq/Gwx2VTsQPx0Oai21r7p1Ff9Q0bhzGiG?=
 =?us-ascii?Q?3cEtG4uOnL79pwHbuXG8SAUW/ra2mSi+zIwx3Uff5M+tw6UFvFvahw1/yfB7?=
 =?us-ascii?Q?1NRDe68pIvemzfFo3OxsHLLKwoytSnCFaqJV9umeQK04cuIvfe9xKhIglB9S?=
 =?us-ascii?Q?4CRInNGlRya/waz1bSo2+rcI7PL8vdteNUdUUyLkZvpe0gdp+uCzvRHOsyEf?=
 =?us-ascii?Q?3sZN97/TTGayDQvh9QOVkkiOfXaopxm5arw3Nn46+mR8ePcW9i7ZOLDqTSAE?=
 =?us-ascii?Q?G13vEiYAvTlUqLhw6dTkCdWDQzlOLldSY42qkazVo351EQI7YGPKUhZLyJUe?=
 =?us-ascii?Q?fCEsFlhWw+vDk0e8QQAFxGXWZfdlAEQFn8P4uyB3XMlcWOgYzrV4U+zzrQ0D?=
 =?us-ascii?Q?78ZNkvdzz9m64JRNGzHpVUk+rl5NxuyVUJWJwEd/o3Ht3OmJGVRgUlLwTuVN?=
 =?us-ascii?Q?NoyoBr7TAhsIJ9cYhV6i7eZFjpSfdwKI/OboM+hzh13XKRu7Hxc+iX6HrhFq?=
 =?us-ascii?Q?fC+PqLSScu+TpLsu7atGRpBGsSqtTL8t2foAMQz8lYvQzfQKuT3QUVB+cclL?=
 =?us-ascii?Q?3B4ftmMplcoVLql8uXsnVA2+Cy3NAFgtf5byQaQ2BcZq+vehHg2kNqjePLSN?=
 =?us-ascii?Q?4kAlyqUrIL06RVsyKUN4RfAHw6A8irLh9Db8RCzN5Fkel0Cp1DsFUubTmn9c?=
 =?us-ascii?Q?yiP/HunmwR+d1iybxZky0WbPaGo5liZLmST370cAJG/hwvsxuuFlJW2Y+bfS?=
 =?us-ascii?Q?G9LAZVeaedG8KGL8Au19qYLM2j6xjjpFpfBcddKt1pNqQgOnyXabTAe3cszn?=
 =?us-ascii?Q?ChZNrRj/+A7u8RamXq1KCv8UDeY+URIMS5m23nmuacSA1tPPvkudoa9YWlI+?=
 =?us-ascii?Q?OZRPqA/v3a+F7gSEmkvCAh0GetcqrbaPXPVccjqx6zjjB92y9ferMnrLgBQr?=
 =?us-ascii?Q?9HDP7rg15a8xNZ2bWjEZ76nMsto5mA0i4fY1bAWM60K5S66k6B6a79vROJCK?=
 =?us-ascii?Q?/uCTFamRT+626wdTpBYxzIXHCmwCW16YdKK+OI1HvKgpjB/A5DOenSpiUTEi?=
 =?us-ascii?Q?Hvltj0CWQpl/ffHf39lm3N+YEH9ZPZ3yhd2d681gzqRKaSLHdXuY258nYV5i?=
 =?us-ascii?Q?AU1y3IgiWXAi5FcJDIaCt3LanSn0JunO6LhAUsTjCj+OR+3xm3A6OZ5SXyYV?=
 =?us-ascii?Q?HpykugU4h5qOYGbUzvR2SY+V87KOfFjUrGkoDRQRSzwW8KSCFvhdZsIS6drU?=
 =?us-ascii?Q?YVk3Myp/AQc2qFLfzqdq0MgS55wnIlnqBnEJMopJRNml/9WGbtHOHH4ma6CL?=
 =?us-ascii?Q?2fVP8sFeJwgGm+L39f8QFwdvsRFNOIXH4/gkj8DPJByj+WpfF/f73AC24L0+?=
 =?us-ascii?Q?LjcJPFSCbKw2dQfRC/n2Bur1VqD6KEDkwwKiCDSiJe6NKkvIHlCKzzayv2Ng?=
 =?us-ascii?Q?dJv/umqFPl5myt1gdwnMShO1CaBOUPi3lknd3nf3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4827f7d0-6c28-47a8-e579-08dd0d3456d8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:34:20.8140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zIjlA0knraAkH2GXXLPcn3O0rAuFUQKASpaPvZQl+9/5Gap7tdmB112HlXWp24mRSOM1Q8FIbqb5ni63Ht/hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7919
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

i.MX8qxp Display Controller pixel engine consists of all processing
units that operate in the AXI bus clock domain.  Add drivers for
ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
well as a pixel engine driver, so that two displays with primary
planes can be supported.  The pixel engine driver as a master binds
those unit drivers as components.  While at it, the pixel engine
driver is a component to be bound with the upcoming DRM driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
* Use regmap to define register map for all registers. (Dmitry)
* Use regmap APIs to access registers. (Dmitry)
* Inline some small functions. (Dmitry)
* Move dc_lb_blendcontrol() function call from KMS routine to initialization
  stage. (Dmitry)
* Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
* Drop unnecessary private struct dc_*_priv.
* Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
  interfaces to bind/unbind the drivers.
* Make some fetch unit operations be aware of fractional fetch unit index(0-7).

v3:
* No change.

v2:
* Use OF alias id to get instance id.

 drivers/gpu/drm/imx/dc/Makefile |   3 +-
 drivers/gpu/drm/imx/dc/dc-cf.c  | 162 ++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-drv.c |   6 +
 drivers/gpu/drm/imx/dc/dc-drv.h |   8 +
 drivers/gpu/drm/imx/dc/dc-ed.c  | 270 +++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fl.c  | 180 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fu.c  | 268 +++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h  | 129 +++++++++++++
 drivers/gpu/drm/imx/dc/dc-fw.c  | 219 ++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-lb.c  | 319 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.c  | 133 +++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.h  | 100 ++++++++++
 12 files changed, 1796 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h

diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index 56de82d53d4d..2942ae6fd5bd 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-imx8-dc-drm-objs := dc-de.o dc-drv.o dc-fg.o dc-tc.o
+imx8-dc-drm-objs := dc-cf.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o dc-fu.o \
+		    dc-fw.o dc-lb.o dc-pe.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
new file mode 100644
index 000000000000..b02b5441986b
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-cf.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "dc-drv.h"
+#include "dc-pe.h"
+
+#define STATICCONTROL		0x8
+
+#define FRAMEDIMENSIONS		0xc
+#define  HEIGHT(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  WIDTH(x)		FIELD_PREP(GENMASK(13, 0), ((x) - 1))
+
+#define CONSTANTCOLOR		0x10
+#define  BLUE(x)		FIELD_PREP(GENMASK(15, 8), (x))
+
+static const struct regmap_range dc_cf_regmap_ranges[] = {
+	regmap_reg_range(STATICCONTROL, CONSTANTCOLOR),
+};
+
+static const struct regmap_access_table dc_cf_regmap_access_table = {
+	.yes_ranges = dc_cf_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_cf_regmap_ranges),
+};
+
+static const struct regmap_config dc_cf_cfg_regmap_config = {
+	.name = "constframe-cfg",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_cf_regmap_access_table,
+	.rd_table = &dc_cf_regmap_access_table,
+};
+
+static inline void dc_cf_enable_shden(struct dc_cf *cf)
+{
+	regmap_write(cf->reg_cfg, STATICCONTROL, SHDEN);
+}
+
+enum dc_link_id dc_cf_get_link_id(struct dc_cf *cf)
+{
+	return cf->link;
+}
+
+void dc_cf_framedimensions(struct dc_cf *cf, unsigned int w,
+			   unsigned int h)
+{
+	regmap_write(cf->reg_cfg, FRAMEDIMENSIONS, WIDTH(w) | HEIGHT(h));
+}
+
+void dc_cf_constantcolor_black(struct dc_cf *cf)
+{
+	regmap_write(cf->reg_cfg, CONSTANTCOLOR, 0);
+}
+
+void dc_cf_constantcolor_blue(struct dc_cf *cf)
+{
+	regmap_write(cf->reg_cfg, CONSTANTCOLOR, BLUE(0xff));
+}
+
+void dc_cf_init(struct dc_cf *cf)
+{
+	dc_cf_enable_shden(cf);
+}
+
+static int dc_cf_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct dc_pe *pe = dc_drm->pe;
+	void __iomem *base_cfg;
+	struct dc_cf *cf;
+	int id;
+
+	cf = devm_kzalloc(dev, sizeof(*cf), GFP_KERNEL);
+	if (!cf)
+		return -ENOMEM;
+
+	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(base_cfg))
+		return PTR_ERR(base_cfg);
+
+	cf->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
+					    &dc_cf_cfg_regmap_config);
+	if (IS_ERR(cf->reg_cfg))
+		return PTR_ERR(cf->reg_cfg);
+
+	id = of_alias_get_id(dev->of_node, "dc0-constframe");
+	if (id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", id);
+		return id;
+	}
+
+	switch (id) {
+	case 0:
+		pe->cf_cont[0] = cf;
+		cf->link = LINK_ID_CONSTFRAME0;
+		break;
+	case 1:
+		pe->cf_cont[1] = cf;
+		cf->link = LINK_ID_CONSTFRAME1;
+		break;
+	case 4:
+		pe->cf_safe[0] = cf;
+		cf->link = LINK_ID_CONSTFRAME4;
+		break;
+	case 5:
+		pe->cf_safe[1] = cf;
+		cf->link = LINK_ID_CONSTFRAME5;
+		break;
+	}
+
+	return 0;
+}
+
+static const struct component_ops dc_cf_ops = {
+	.bind = dc_cf_bind,
+};
+
+static int dc_cf_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_cf_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_cf_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_cf_ops);
+}
+
+static const struct of_device_id dc_cf_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-constframe", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_cf_dt_ids);
+
+struct platform_driver dc_cf_driver = {
+	.probe = dc_cf_probe,
+	.remove_new = dc_cf_remove,
+	.driver = {
+		.name = "imx8-dc-constframe",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_cf_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index e5910a82dd4d..7c64acc863ad 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -9,8 +9,14 @@
 #include "dc-drv.h"
 
 static struct platform_driver * const dc_drivers[] = {
+	&dc_cf_driver,
 	&dc_de_driver,
+	&dc_ed_driver,
 	&dc_fg_driver,
+	&dc_fl_driver,
+	&dc_fw_driver,
+	&dc_lb_driver,
+	&dc_pe_driver,
 	&dc_tc_driver,
 };
 
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index e1290d9a0a99..c687a36b8153 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -11,14 +11,22 @@
 #include <drm/drm_device.h>
 
 #include "dc-de.h"
+#include "dc-pe.h"
 
 struct dc_drm_device {
 	struct drm_device base;
 	struct dc_de *de[DC_DISPLAYS];
+	struct dc_pe *pe;
 };
 
+extern struct platform_driver dc_cf_driver;
+extern struct platform_driver dc_ed_driver;
 extern struct platform_driver dc_de_driver;
 extern struct platform_driver dc_fg_driver;
+extern struct platform_driver dc_fl_driver;
+extern struct platform_driver dc_fw_driver;
+extern struct platform_driver dc_lb_driver;
+extern struct platform_driver dc_pe_driver;
 extern struct platform_driver dc_tc_driver;
 
 #endif /* __DC_DRV_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
new file mode 100644
index 000000000000..de8b058d5462
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "dc-drv.h"
+#include "dc-pe.h"
+
+#define PIXENGCFG_STATIC	0x8
+#define  POWERDOWN		BIT(4)
+#define  SYNC_MODE		BIT(8)
+#define  SINGLE			0
+#define  DIV_MASK		GENMASK(23, 16)
+#define  DIV(x)			FIELD_PREP(DIV_MASK, (x))
+#define  DIV_RESET		0x80
+
+#define PIXENGCFG_DYNAMIC	0xc
+
+#define PIXENGCFG_TRIGGER	0x14
+#define  SYNC_TRIGGER		BIT(0)
+
+#define STATICCONTROL		0x8
+#define  KICK_MODE		BIT(8)
+#define  EXTERNAL		BIT(8)
+#define  PERFCOUNTMODE		BIT(12)
+
+#define CONTROL			0xc
+#define  GAMMAAPPLYENABLE	BIT(0)
+
+static const struct regmap_range dc_ed_pec_regmap_access_ranges[] = {
+	regmap_reg_range(PIXENGCFG_STATIC, PIXENGCFG_STATIC),
+	regmap_reg_range(PIXENGCFG_DYNAMIC, PIXENGCFG_DYNAMIC),
+	regmap_reg_range(PIXENGCFG_TRIGGER, PIXENGCFG_TRIGGER),
+};
+
+static const struct regmap_access_table dc_ed_pec_regmap_access_table = {
+	.yes_ranges = dc_ed_pec_regmap_access_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ed_pec_regmap_access_ranges),
+};
+
+static const struct regmap_range dc_ed_pec_regmap_volatile_ranges[] = {
+	regmap_reg_range(PIXENGCFG_TRIGGER, PIXENGCFG_TRIGGER),
+};
+
+static const struct regmap_access_table dc_ed_pec_regmap_volatile_table = {
+	.yes_ranges = dc_ed_pec_regmap_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ed_pec_regmap_volatile_ranges),
+};
+
+static const struct regmap_config dc_ed_pec_regmap_config = {
+	.name = "extdst-pec",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_ed_pec_regmap_access_table,
+	.rd_table = &dc_ed_pec_regmap_access_table,
+	.volatile_table = &dc_ed_pec_regmap_volatile_table,
+};
+
+static const struct regmap_range dc_ed_regmap_ranges[] = {
+	regmap_reg_range(STATICCONTROL, STATICCONTROL),
+	regmap_reg_range(CONTROL, CONTROL),
+};
+
+static const struct regmap_access_table dc_ed_regmap_access_table = {
+	.yes_ranges = dc_ed_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ed_regmap_ranges),
+};
+
+static const struct regmap_config dc_ed_cfg_regmap_config = {
+	.name = "extdst-cfg",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_ed_regmap_access_table,
+	.rd_table = &dc_ed_regmap_access_table,
+};
+
+static const enum dc_link_id src_sels[] = {
+	LINK_ID_NONE,
+	LINK_ID_CONSTFRAME0,
+	LINK_ID_CONSTFRAME1,
+	LINK_ID_CONSTFRAME4,
+	LINK_ID_CONSTFRAME5,
+	LINK_ID_LAYERBLEND3,
+	LINK_ID_LAYERBLEND2,
+	LINK_ID_LAYERBLEND1,
+	LINK_ID_LAYERBLEND0,
+};
+
+static inline void dc_ed_pec_enable_shden(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_pec, PIXENGCFG_STATIC, SHDEN, SHDEN);
+}
+
+static inline void dc_ed_pec_poweron(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_pec, PIXENGCFG_STATIC, POWERDOWN, 0);
+}
+
+static inline void dc_ed_pec_sync_mode_single(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_pec, PIXENGCFG_STATIC, SYNC_MODE, SINGLE);
+}
+
+static inline void dc_ed_pec_div_reset(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_pec, PIXENGCFG_STATIC, DIV_MASK,
+			  DIV(DIV_RESET));
+}
+
+void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(src_sels); i++) {
+		if (src_sels[i] == src) {
+			regmap_write(ed->reg_pec, PIXENGCFG_DYNAMIC, src);
+			return;
+		}
+	}
+}
+
+void dc_ed_pec_sync_trigger(struct dc_ed *ed)
+{
+	regmap_write(ed->reg_pec, PIXENGCFG_TRIGGER, SYNC_TRIGGER);
+}
+
+static inline void dc_ed_enable_shden(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_cfg, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static inline void dc_ed_kick_mode_external(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_cfg, STATICCONTROL, KICK_MODE, EXTERNAL);
+}
+
+static inline void dc_ed_disable_perfcountmode(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_cfg, STATICCONTROL, PERFCOUNTMODE, 0);
+}
+
+static inline void dc_ed_disable_gamma_apply(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_cfg, CONTROL, GAMMAAPPLYENABLE, 0);
+}
+
+void dc_ed_init(struct dc_ed *ed)
+{
+	dc_ed_pec_src_sel(ed, LINK_ID_NONE);
+	dc_ed_pec_enable_shden(ed);
+	dc_ed_pec_poweron(ed);
+	dc_ed_pec_sync_mode_single(ed);
+	dc_ed_pec_div_reset(ed);
+	dc_ed_enable_shden(ed);
+	dc_ed_disable_perfcountmode(ed);
+	dc_ed_kick_mode_external(ed);
+	dc_ed_disable_gamma_apply(ed);
+}
+
+static int dc_ed_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct dc_pe *pe = dc_drm->pe;
+	void __iomem *base_pec;
+	void __iomem *base_cfg;
+	struct dc_ed *ed;
+	int id;
+
+	ed = devm_kzalloc(dev, sizeof(*ed), GFP_KERNEL);
+	if (!ed)
+		return -ENOMEM;
+
+	base_pec = devm_platform_ioremap_resource_byname(pdev, "pec");
+	if (IS_ERR(base_pec))
+		return PTR_ERR(base_pec);
+
+	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(base_cfg))
+		return PTR_ERR(base_cfg);
+
+	ed->reg_pec = devm_regmap_init_mmio(dev, base_pec,
+					    &dc_ed_pec_regmap_config);
+	if (IS_ERR(ed->reg_pec))
+		return PTR_ERR(ed->reg_pec);
+
+	ed->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
+					    &dc_ed_cfg_regmap_config);
+	if (IS_ERR(ed->reg_cfg))
+		return PTR_ERR(ed->reg_cfg);
+
+	ed->irq_shdld = platform_get_irq_byname(pdev, "shdload");
+	if (ed->irq_shdld < 0)
+		return ed->irq_shdld;
+
+	id = of_alias_get_id(dev->of_node, "dc0-extdst");
+	if (id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", id);
+		return id;
+	}
+
+	ed->dev = dev;
+
+	switch (id) {
+	case 0:
+		pe->ed_cont[0] = ed;
+		break;
+	case 1:
+		pe->ed_cont[1] = ed;
+		break;
+	case 4:
+		pe->ed_safe[0] = ed;
+		break;
+	case 5:
+		pe->ed_safe[1] = ed;
+		break;
+	}
+
+	return 0;
+}
+
+static const struct component_ops dc_ed_ops = {
+	.bind = dc_ed_bind,
+};
+
+static int dc_ed_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_ed_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_ed_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_ed_ops);
+}
+
+static const struct of_device_id dc_ed_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-extdst", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_ed_dt_ids);
+
+struct platform_driver dc_ed_driver = {
+	.probe = dc_ed_probe,
+	.remove_new = dc_ed_remove,
+	.driver = {
+		.name = "imx8-dc-extdst",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_ed_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
new file mode 100644
index 000000000000..6c2e423ddb4c
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_fourcc.h>
+
+#include "dc-drv.h"
+#include "dc-fu.h"
+#include "dc-pe.h"
+
+#define BASEADDRESS(x)			(0x10 + FRAC_OFFSET * (x))
+#define SOURCEBUFFERATTRIBUTES(x)	(0x14 + FRAC_OFFSET * (x))
+#define SOURCEBUFFERDIMENSION(x)	(0x18 + FRAC_OFFSET * (x))
+#define COLORCOMPONENTBITS(x)		(0x1c + FRAC_OFFSET * (x))
+#define COLORCOMPONENTSHIFT(x)		(0x20 + FRAC_OFFSET * (x))
+#define LAYEROFFSET(x)			(0x24 + FRAC_OFFSET * (x))
+#define CLIPWINDOWOFFSET(x)		(0x28 + FRAC_OFFSET * (x))
+#define CLIPWINDOWDIMENSIONS(x)		(0x2c + FRAC_OFFSET * (x))
+#define CONSTANTCOLOR(x)		(0x30 + FRAC_OFFSET * (x))
+#define LAYERPROPERTY(x)		(0x34 + FRAC_OFFSET * (x))
+#define FRAMEDIMENSIONS			0x150
+
+struct dc_fl {
+	struct dc_fu fu;
+	int id;
+};
+
+static const struct regmap_range dc_fl_regmap_ranges[] = {
+	regmap_reg_range(STATICCONTROL, FRAMEDIMENSIONS),
+};
+
+static const struct regmap_access_table dc_fl_regmap_access_table = {
+	.yes_ranges = dc_fl_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fl_regmap_ranges),
+};
+
+static const struct regmap_config dc_fl_cfg_regmap_config = {
+	.name = "fetchlayer-cfg",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_fl_regmap_access_table,
+	.rd_table = &dc_fl_regmap_access_table,
+};
+
+static void dc_fl_set_fmt(struct dc_fu *fu, enum dc_fu_frac frac,
+			  const struct drm_format_info *format)
+{
+	u32 bits = 0, shifts = 0;
+
+	dc_fu_set_src_bpp(fu, frac, format->cpp[0] * 8);
+
+	regmap_write_bits(fu->reg_cfg, LAYERPROPERTY(frac),
+			  YUVCONVERSIONMODE_MASK,
+			  YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF));
+
+	dc_fu_get_pixel_format_bits(fu, format->format, &bits);
+	dc_fu_get_pixel_format_shifts(fu, format->format, &shifts);
+
+	regmap_write(fu->reg_cfg, COLORCOMPONENTBITS(frac), bits);
+	regmap_write(fu->reg_cfg, COLORCOMPONENTSHIFT(frac), shifts);
+}
+
+static void dc_fl_set_framedimensions(struct dc_fu *fu, int w, int h)
+{
+	regmap_write(fu->reg_cfg, FRAMEDIMENSIONS,
+		     FRAMEWIDTH(w) | FRAMEHEIGHT(h));
+}
+
+static void dc_fl_init(struct dc_fu *fu)
+{
+	dc_fu_common_hw_init(fu);
+	dc_fu_shdldreq_sticky(fu, 0xff);
+}
+
+static void dc_fl_set_ops(struct dc_fu *fu)
+{
+	memcpy(&fu->ops, &dc_fu_common_ops, sizeof(dc_fu_common_ops));
+	fu->ops.init = dc_fl_init;
+	fu->ops.set_fmt = dc_fl_set_fmt;
+	fu->ops.set_framedimensions = dc_fl_set_framedimensions;
+}
+
+static int dc_fl_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct dc_pe *pe = dc_drm->pe;
+	void __iomem *base_cfg;
+	struct dc_fl *fl;
+	struct dc_fu *fu;
+	int i;
+
+	fl = devm_kzalloc(dev, sizeof(*fl), GFP_KERNEL);
+	if (!fl)
+		return -ENOMEM;
+
+	fu = &fl->fu;
+
+	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(base_cfg))
+		return PTR_ERR(base_cfg);
+
+	fu->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
+					    &dc_fl_cfg_regmap_config);
+	if (IS_ERR(fu->reg_cfg))
+		return PTR_ERR(fu->reg_cfg);
+
+	fl->id = of_alias_get_id(dev->of_node, "dc0-fetchlayer");
+	if (fl->id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", fl->id);
+		return fl->id;
+	}
+
+	fu->link_id = LINK_ID_FETCHLAYER0;
+	fu->id = DC_FETCHUNIT_FL0;
+	for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
+		fu->reg_baseaddr[i]		  = BASEADDRESS(i);
+		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
+		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
+		fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
+		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
+		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
+		fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
+		fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
+	}
+	snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", fl->id);
+
+	dc_fl_set_ops(fu);
+
+	pe->fu_disp[fu->id] = fu;
+
+	return 0;
+}
+
+static const struct component_ops dc_fl_ops = {
+	.bind = dc_fl_bind,
+};
+
+static int dc_fl_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_fl_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_fl_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_fl_ops);
+}
+
+static const struct of_device_id dc_fl_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-fetchlayer", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_fl_dt_ids);
+
+struct platform_driver dc_fl_driver = {
+	.probe = dc_fl_probe,
+	.remove_new = dc_fl_remove,
+	.driver = {
+		.name = "imx8-dc-fetchlayer",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_fl_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
new file mode 100644
index 000000000000..dda8e6c52be8
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/math.h>
+
+#include "dc-fu.h"
+#include "dc-pe.h"
+
+/* STATICCONTROL */
+#define SHDLDREQSTICKY_MASK		GENMASK(31, 24)
+#define SHDLDREQSTICKY(x)		FIELD_PREP(SHDLDREQSTICKY_MASK, (x))
+#define BASEADDRESSAUTOUPDATE_MASK	GENMASK(23, 16)
+#define BASEADDRESSAUTOUPDATE(x)	FIELD_PREP(BASEADDRESSAUTOUPDATE_MASK, (x))
+
+/* BURSTBUFFERMANAGEMENT */
+#define SETBURSTLENGTH_MASK		GENMASK(12, 8)
+#define SETBURSTLENGTH(x)		FIELD_PREP(SETBURSTLENGTH_MASK, (x))
+#define SETNUMBUFFERS_MASK		GENMASK(7, 0)
+#define SETNUMBUFFERS(x)		FIELD_PREP(SETNUMBUFFERS_MASK, (x))
+#define LINEMODE_MASK			BIT(31)
+
+/* SOURCEBUFFERATTRIBUTES */
+#define BITSPERPIXEL_MASK		GENMASK(21, 16)
+#define BITSPERPIXEL(x)			FIELD_PREP(BITSPERPIXEL_MASK, (x))
+#define STRIDE_MASK			GENMASK(15, 0)
+#define STRIDE(x)			FIELD_PREP(STRIDE_MASK, (x) - 1)
+
+/* SOURCEBUFFERDIMENSION */
+#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
+#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x))
+
+/* LAYEROFFSET */
+#define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
+#define LAYERYOFFSET(x)			FIELD_PREP(GENMASK(30, 16), (x))
+
+/* CLIPWINDOWOFFSET */
+#define CLIPWINDOWXOFFSET(x)		FIELD_PREP(GENMASK(14, 0), (x))
+#define CLIPWINDOWYOFFSET(x)		FIELD_PREP(GENMASK(30, 16), (x))
+
+/* CLIPWINDOWDIMENSIONS */
+#define CLIPWINDOWWIDTH(x)		FIELD_PREP(GENMASK(13, 0), (x) - 1)
+#define CLIPWINDOWHEIGHT(x)		FIELD_PREP(GENMASK(29, 16), (x) - 1)
+
+static const enum dc_fu_frac dc_fetchunit_all_fracs[] = {
+	DC_FETCHUNIT_FRAC0, DC_FETCHUNIT_FRAC1,
+	DC_FETCHUNIT_FRAC2, DC_FETCHUNIT_FRAC3,
+	DC_FETCHUNIT_FRAC4, DC_FETCHUNIT_FRAC5,
+	DC_FETCHUNIT_FRAC6, DC_FETCHUNIT_FRAC7
+};
+
+enum dc_linemode {
+	/*
+	 * Mandatory setting for operation in the Display Controller.
+	 * Works also for Blit Engine with marginal performance impact.
+	 */
+	LINEMODE_DISPLAY = 0,
+};
+
+struct dc_fu_pixel_format {
+	u32 pixel_format;
+	u32 bits;
+	u32 shifts;
+};
+
+static const struct dc_fu_pixel_format pixel_formats[] = {
+	{
+		DRM_FORMAT_XRGB8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
+	},
+};
+
+void dc_fu_get_pixel_format_bits(struct dc_fu *fu, u32 format, u32 *bits)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		if (pixel_formats[i].pixel_format == format) {
+			*bits = pixel_formats[i].bits;
+			return;
+		}
+	}
+}
+
+void
+dc_fu_get_pixel_format_shifts(struct dc_fu *fu, u32 format, u32 *shifts)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		if (pixel_formats[i].pixel_format == format) {
+			*shifts = pixel_formats[i].shifts;
+			return;
+		}
+	}
+}
+
+static inline void dc_fu_enable_shden(struct dc_fu *fu)
+{
+	regmap_write_bits(fu->reg_cfg, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static inline void dc_fu_baddr_autoupdate(struct dc_fu *fu, u8 layer_mask)
+{
+	regmap_write_bits(fu->reg_cfg, STATICCONTROL,
+			  BASEADDRESSAUTOUPDATE_MASK,
+			  BASEADDRESSAUTOUPDATE(layer_mask));
+}
+
+void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask)
+{
+	regmap_write_bits(fu->reg_cfg, STATICCONTROL, SHDLDREQSTICKY_MASK,
+			  SHDLDREQSTICKY(layer_mask));
+}
+
+static inline void dc_fu_set_linemode(struct dc_fu *fu, enum dc_linemode mode)
+{
+	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT, LINEMODE_MASK,
+			  mode);
+}
+
+static inline void dc_fu_set_numbuffers(struct dc_fu *fu, unsigned int num)
+{
+	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
+			  SETNUMBUFFERS_MASK, SETNUMBUFFERS(num));
+}
+
+static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
+{
+	unsigned int burst_size, burst_length;
+
+	burst_size = 1 << __ffs(baddr);
+	burst_size = round_up(burst_size, 8);
+	burst_size = min(burst_size, 128U);
+	burst_length = burst_size / 8;
+
+	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
+			  SETBURSTLENGTH_MASK, SETBURSTLENGTH(burst_length));
+}
+
+static void dc_fu_set_baseaddress(struct dc_fu *fu, enum dc_fu_frac frac,
+				  dma_addr_t baddr)
+{
+	regmap_write(fu->reg_cfg, fu->reg_baseaddr[frac], baddr);
+}
+
+void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp)
+{
+	regmap_write_bits(fu->reg_cfg, fu->reg_sourcebufferattributes[frac],
+			  BITSPERPIXEL_MASK, BITSPERPIXEL(bpp));
+}
+
+static void dc_fu_set_src_stride(struct dc_fu *fu, enum dc_fu_frac frac,
+				 unsigned int stride)
+{
+	regmap_write_bits(fu->reg_cfg, fu->reg_sourcebufferattributes[frac],
+			  STRIDE_MASK, STRIDE(stride));
+}
+
+static void dc_fu_set_src_buf_dimensions(struct dc_fu *fu, enum dc_fu_frac frac,
+					 int w, int h)
+{
+	regmap_write(fu->reg_cfg, fu->reg_sourcebufferdimension[frac],
+		     LINEWIDTH(w) | LINECOUNT(h));
+}
+
+static inline void dc_fu_layeroffset(struct dc_fu *fu, enum dc_fu_frac frac,
+				     unsigned int x, unsigned int y)
+{
+	regmap_write(fu->reg_cfg, fu->reg_layeroffset[frac],
+		     LAYERXOFFSET(x) | LAYERYOFFSET(y));
+}
+
+static inline void dc_fu_clipoffset(struct dc_fu *fu, enum dc_fu_frac frac,
+				    unsigned int x, unsigned int y)
+{
+	regmap_write(fu->reg_cfg, fu->reg_clipwindowoffset[frac],
+		     CLIPWINDOWXOFFSET(x) | CLIPWINDOWYOFFSET(y));
+}
+
+static inline void dc_fu_clipdimensions(struct dc_fu *fu, enum dc_fu_frac frac,
+					unsigned int w, unsigned int h)
+{
+	regmap_write(fu->reg_cfg, fu->reg_clipwindowdimensions[frac],
+		     CLIPWINDOWWIDTH(w) | CLIPWINDOWHEIGHT(h));
+}
+
+static inline void
+dc_fu_set_pixel_blend_mode(struct dc_fu *fu, enum dc_fu_frac frac)
+{
+	regmap_write(fu->reg_cfg, fu->reg_layerproperty[frac], 0);
+	regmap_write(fu->reg_cfg, fu->reg_constantcolor[frac], 0);
+}
+
+static void dc_fu_enable_src_buf(struct dc_fu *fu, enum dc_fu_frac frac)
+{
+	regmap_write_bits(fu->reg_cfg, fu->reg_layerproperty[frac],
+			  SOURCEBUFFERENABLE, SOURCEBUFFERENABLE);
+}
+
+static void dc_fu_disable_src_buf(struct dc_fu *fu, enum dc_fu_frac frac)
+{
+	regmap_write_bits(fu->reg_cfg, fu->reg_layerproperty[frac],
+			  SOURCEBUFFERENABLE, 0);
+
+	if (fu->lb) {
+		dc_lb_pec_clken(fu->lb, CLKEN_DISABLE);
+		dc_lb_mode(fu->lb, LB_NEUTRAL);
+	}
+}
+
+static void dc_fu_set_layerblend(struct dc_fu *fu, struct dc_lb *lb)
+{
+	fu->lb = lb;
+}
+
+static enum dc_link_id dc_fu_get_link_id(struct dc_fu *fu)
+{
+	return fu->link_id;
+}
+
+static const char *dc_fu_get_name(struct dc_fu *fu)
+{
+	return fu->name;
+}
+
+const struct dc_fu_ops dc_fu_common_ops = {
+	.set_burstlength	= dc_fu_set_burstlength,
+	.set_baseaddress	= dc_fu_set_baseaddress,
+	.set_src_stride		= dc_fu_set_src_stride,
+	.set_src_buf_dimensions = dc_fu_set_src_buf_dimensions,
+	.enable_src_buf		= dc_fu_enable_src_buf,
+	.disable_src_buf	= dc_fu_disable_src_buf,
+	.set_layerblend		= dc_fu_set_layerblend,
+	.get_link_id		= dc_fu_get_link_id,
+	.get_name		= dc_fu_get_name,
+};
+
+const struct dc_fu_ops *dc_fu_get_ops(struct dc_fu *fu)
+{
+	return &fu->ops;
+}
+
+void dc_fu_common_hw_init(struct dc_fu *fu)
+{
+	enum dc_fu_frac frac;
+	int i;
+
+	dc_fu_baddr_autoupdate(fu, 0x0);
+	dc_fu_enable_shden(fu);
+	dc_fu_set_linemode(fu, LINEMODE_DISPLAY);
+	dc_fu_set_numbuffers(fu, 16);
+
+	for (i = 0; i < ARRAY_SIZE(dc_fetchunit_all_fracs); i++) {
+		frac = dc_fetchunit_all_fracs[i];
+
+		dc_fu_layeroffset(fu, frac, 0, 0);
+		dc_fu_clipoffset(fu, frac, 0, 0);
+		dc_fu_clipdimensions(fu, frac, 1, 1);
+		dc_fu_disable_src_buf(fu, frac);
+		dc_fu_set_pixel_blend_mode(fu, frac);
+	}
+}
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
new file mode 100644
index 000000000000..d5e20b132005
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -0,0 +1,129 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_FETCHUNIT_H__
+#define __DC_FETCHUNIT_H__
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <drm/drm_fourcc.h>
+
+#include "dc-pe.h"
+
+#define FRAC_OFFSET			0x28
+
+#define STATICCONTROL			0x8
+#define BURSTBUFFERMANAGEMENT		0xc
+
+/* COLORCOMPONENTBITS */
+#define R_BITS(x)			FIELD_PREP_CONST(GENMASK(27, 24), (x))
+#define G_BITS(x)			FIELD_PREP_CONST(GENMASK(19, 16), (x))
+#define B_BITS(x)			FIELD_PREP_CONST(GENMASK(11, 8), (x))
+#define A_BITS(x)			FIELD_PREP_CONST(GENMASK(3, 0), (x))
+
+/* COLORCOMPONENTSHIFT */
+#define R_SHIFT(x)			FIELD_PREP_CONST(GENMASK(28, 24), (x))
+#define G_SHIFT(x)			FIELD_PREP_CONST(GENMASK(20, 16), (x))
+#define B_SHIFT(x)			FIELD_PREP_CONST(GENMASK(12, 8), (x))
+#define A_SHIFT(x)			FIELD_PREP_CONST(GENMASK(4, 0), (x))
+
+/* LAYERPROPERTY */
+#define YUVCONVERSIONMODE_MASK		GENMASK(18, 17)
+#define YUVCONVERSIONMODE(x)		FIELD_PREP(YUVCONVERSIONMODE_MASK, (x))
+#define SOURCEBUFFERENABLE		BIT(31)
+
+/* FRAMEDIMENSIONS */
+#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
+#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x))
+
+/* CONTROL */
+#define INPUTSELECT_MASK		GENMASK(4, 3)
+#define INPUTSELECT(x)			FIELD_PREP(INPUTSELECT_MASK, (x))
+#define RASTERMODE_MASK			GENMASK(2, 0)
+#define RASTERMODE(x)			FIELD_PREP(RASTERMODE_MASK, (x))
+
+enum dc_yuvconversionmode {
+	YUVCONVERSIONMODE_OFF,
+};
+
+enum dc_inputselect {
+	INPUTSELECT_INACTIVE,
+};
+
+enum dc_rastermode {
+	RASTERMODE_NORMAL,
+};
+
+enum {
+	DC_FETCHUNIT_FL0,
+	DC_FETCHUNIT_FW2,
+};
+
+enum dc_fu_frac {
+	DC_FETCHUNIT_FRAC0,
+	DC_FETCHUNIT_FRAC1,
+	DC_FETCHUNIT_FRAC2,
+	DC_FETCHUNIT_FRAC3,
+	DC_FETCHUNIT_FRAC4,
+	DC_FETCHUNIT_FRAC5,
+	DC_FETCHUNIT_FRAC6,
+	DC_FETCHUNIT_FRAC7,
+	DC_FETCHUNIT_FRAC_NUM,
+};
+
+struct dc_fu;
+struct dc_lb;
+
+struct dc_fu_ops {
+	void (*init)(struct dc_fu *fu);
+	void (*set_burstlength)(struct dc_fu *fu, dma_addr_t baddr);
+	void (*set_baseaddress)(struct dc_fu *fu, enum dc_fu_frac frac,
+				dma_addr_t baddr);
+	void (*set_src_stride)(struct dc_fu *fu, enum dc_fu_frac frac,
+			       unsigned int stride);
+	void (*set_src_buf_dimensions)(struct dc_fu *fu, enum dc_fu_frac frac,
+				       int w, int h);
+	void (*set_fmt)(struct dc_fu *fu, enum dc_fu_frac frac,
+			const struct drm_format_info *format);
+	void (*enable_src_buf)(struct dc_fu *fu, enum dc_fu_frac frac);
+	void (*disable_src_buf)(struct dc_fu *fu, enum dc_fu_frac frac);
+	void (*set_framedimensions)(struct dc_fu *fu, int w, int h);
+	void (*set_layerblend)(struct dc_fu *fu, struct dc_lb *lb);
+	enum dc_link_id (*get_link_id)(struct dc_fu *fu);
+	const char *(*get_name)(struct dc_fu *fu);
+};
+
+struct dc_fu {
+	struct regmap *reg_pec;
+	struct regmap *reg_cfg;
+	char name[13];
+	u32 reg_baseaddr[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_sourcebufferattributes[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_sourcebufferdimension[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_layeroffset[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_clipwindowoffset[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_clipwindowdimensions[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_constantcolor[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_layerproperty[DC_FETCHUNIT_FRAC_NUM];
+	unsigned int id;
+	enum dc_link_id link_id;
+	struct dc_fu_ops ops;
+	struct dc_lb *lb;
+};
+
+extern const struct dc_fu_ops dc_fu_common_ops;
+
+void dc_fu_get_pixel_format_bits(struct dc_fu *fu, u32 format, u32 *bits);
+void dc_fu_get_pixel_format_shifts(struct dc_fu *fu, u32 format, u32 *shifts);
+void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask);
+void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp);
+void dc_fu_common_hw_init(struct dc_fu *fu);
+
+const struct dc_fu_ops *dc_fu_get_ops(struct dc_fu *fu);
+
+#endif /* __DC_FETCHUNIT_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
new file mode 100644
index 000000000000..c2717e5c9cd9
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_fourcc.h>
+
+#include "dc-drv.h"
+#include "dc-fu.h"
+#include "dc-pe.h"
+
+#define PIXENGCFG_DYNAMIC		0x8
+
+#define BASEADDRESS(x)			(0x10 + FRAC_OFFSET * (x))
+#define SOURCEBUFFERATTRIBUTES(x)	(0x14 + FRAC_OFFSET * (x))
+#define SOURCEBUFFERDIMENSION(x)	(0x18 + FRAC_OFFSET * (x))
+#define COLORCOMPONENTBITS(x)		(0x1c + FRAC_OFFSET * (x))
+#define COLORCOMPONENTSHIFT(x)		(0x20 + FRAC_OFFSET * (x))
+#define LAYEROFFSET(x)			(0x24 + FRAC_OFFSET * (x))
+#define CLIPWINDOWOFFSET(x)		(0x28 + FRAC_OFFSET * (x))
+#define CLIPWINDOWDIMENSIONS(x)		(0x2c + FRAC_OFFSET * (x))
+#define CONSTANTCOLOR(x)		(0x30 + FRAC_OFFSET * (x))
+#define LAYERPROPERTY(x)		(0x34 + FRAC_OFFSET * (x))
+#define FRAMEDIMENSIONS			0x150
+#define CONTROL				0x170
+
+struct dc_fw {
+	struct dc_fu fu;
+	int id;
+};
+
+static const struct regmap_range dc_fw_pec_regmap_access_ranges[] = {
+	regmap_reg_range(PIXENGCFG_DYNAMIC, PIXENGCFG_DYNAMIC),
+};
+
+static const struct regmap_access_table dc_fw_pec_regmap_access_table = {
+	.yes_ranges = dc_fw_pec_regmap_access_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fw_pec_regmap_access_ranges),
+};
+
+static const struct regmap_config dc_fw_pec_regmap_config = {
+	.name = "fetchwarp-pec",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_fw_pec_regmap_access_table,
+	.rd_table = &dc_fw_pec_regmap_access_table,
+};
+
+static const struct regmap_range dc_fw_regmap_ranges[] = {
+	regmap_reg_range(STATICCONTROL, FRAMEDIMENSIONS),
+	regmap_reg_range(CONTROL, CONTROL),
+};
+
+static const struct regmap_access_table dc_fw_regmap_access_table = {
+	.yes_ranges = dc_fw_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fw_regmap_ranges),
+};
+
+static const struct regmap_config dc_fw_cfg_regmap_config = {
+	.name = "fetchwarp-cfg",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_fw_regmap_access_table,
+	.rd_table = &dc_fw_regmap_access_table,
+};
+
+static void dc_fw_set_fmt(struct dc_fu *fu, enum dc_fu_frac frac,
+			  const struct drm_format_info *format)
+{
+	u32 bits = 0, shifts = 0;
+
+	dc_fu_set_src_bpp(fu, frac, format->cpp[0] * 8);
+
+	regmap_write_bits(fu->reg_cfg, CONTROL, INPUTSELECT_MASK,
+			  INPUTSELECT(INPUTSELECT_INACTIVE));
+	regmap_write_bits(fu->reg_cfg, CONTROL, RASTERMODE_MASK,
+			  RASTERMODE(RASTERMODE_NORMAL));
+
+	regmap_write_bits(fu->reg_cfg, LAYERPROPERTY(frac),
+			  YUVCONVERSIONMODE_MASK,
+			  YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF));
+
+	dc_fu_get_pixel_format_bits(fu, format->format, &bits);
+	dc_fu_get_pixel_format_shifts(fu, format->format, &shifts);
+
+	regmap_write(fu->reg_cfg, COLORCOMPONENTBITS(frac), bits);
+	regmap_write(fu->reg_cfg, COLORCOMPONENTSHIFT(frac), shifts);
+}
+
+static void dc_fw_set_framedimensions(struct dc_fu *fu, int w, int h)
+{
+	regmap_write(fu->reg_cfg, FRAMEDIMENSIONS,
+		     FRAMEWIDTH(w) | FRAMEHEIGHT(h));
+}
+
+static void dc_fw_init(struct dc_fu *fu)
+{
+	regmap_write(fu->reg_pec, PIXENGCFG_DYNAMIC, LINK_ID_NONE);
+	dc_fu_common_hw_init(fu);
+	dc_fu_shdldreq_sticky(fu, 0xff);
+}
+
+static void dc_fw_set_ops(struct dc_fu *fu)
+{
+	memcpy(&fu->ops, &dc_fu_common_ops, sizeof(dc_fu_common_ops));
+	fu->ops.init = dc_fw_init;
+	fu->ops.set_fmt	= dc_fw_set_fmt;
+	fu->ops.set_framedimensions = dc_fw_set_framedimensions;
+}
+
+static int dc_fw_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct dc_pe *pe = dc_drm->pe;
+	void __iomem *base_pec;
+	void __iomem *base_cfg;
+	struct dc_fw *fw;
+	struct dc_fu *fu;
+	int i;
+
+	fw = devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return -ENOMEM;
+
+	fu = &fw->fu;
+
+	base_pec = devm_platform_ioremap_resource_byname(pdev, "pec");
+	if (IS_ERR(base_pec))
+		return PTR_ERR(base_pec);
+
+	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(base_cfg))
+		return PTR_ERR(base_cfg);
+
+	fu->reg_pec = devm_regmap_init_mmio(dev, base_pec,
+					    &dc_fw_pec_regmap_config);
+	if (IS_ERR(fu->reg_pec))
+		return PTR_ERR(fu->reg_pec);
+
+	fu->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
+					    &dc_fw_cfg_regmap_config);
+	if (IS_ERR(fu->reg_cfg))
+		return PTR_ERR(fu->reg_cfg);
+
+	fw->id = of_alias_get_id(dev->of_node, "dc0-fetchwarp");
+	if (fw->id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", fw->id);
+		return fw->id;
+	}
+
+	fu->link_id = LINK_ID_FETCHWARP2;
+	fu->id = DC_FETCHUNIT_FW2;
+	for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
+		fu->reg_baseaddr[i]		  = BASEADDRESS(i);
+		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
+		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
+		fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
+		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
+		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
+		fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
+		fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
+	}
+	snprintf(fu->name, sizeof(fu->name), "FetchWarp%u", fw->id);
+
+	dc_fw_set_ops(fu);
+
+	pe->fu_disp[fu->id] = fu;
+
+	return 0;
+}
+
+static const struct component_ops dc_fw_ops = {
+	.bind = dc_fw_bind,
+};
+
+static int dc_fw_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_fw_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_fw_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_fw_ops);
+}
+
+static const struct of_device_id dc_fw_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-fetchwarp", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_fw_dt_ids);
+
+struct platform_driver dc_fw_driver = {
+	.probe = dc_fw_probe,
+	.remove_new = dc_fw_remove,
+	.driver = {
+		.name = "imx8-dc-fetchwarp",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_fw_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
new file mode 100644
index 000000000000..bfa4978bd592
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_blend.h>
+
+#include "dc-drv.h"
+#include "dc-pe.h"
+
+#define PIXENGCFG_DYNAMIC			0x8
+#define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
+#define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
+		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
+#define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		GENMASK(13, 8)
+#define  PIXENGCFG_DYNAMIC_SEC_SEL(x)		\
+		FIELD_PREP(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
+
+#define STATICCONTROL				0x8
+#define  SHDTOKSEL_MASK				GENMASK(4, 3)
+#define  SHDTOKSEL(x)				FIELD_PREP(SHDTOKSEL_MASK, (x))
+#define  SHDLDSEL_MASK				GENMASK(2, 1)
+#define  SHDLDSEL(x)				FIELD_PREP(SHDLDSEL_MASK, (x))
+
+#define CONTROL					0xc
+#define  CTRL_MODE_MASK				BIT(0)
+#define  CTRL_MODE(x)				FIELD_PREP(CTRL_MODE_MASK, (x))
+
+#define BLENDCONTROL				0x10
+#define  ALPHA_MASK				GENMASK(23, 16)
+#define  ALPHA(x)				FIELD_PREP(ALPHA_MASK, (x))
+#define  PRIM_C_BLD_FUNC_MASK			GENMASK(2, 0)
+#define  PRIM_C_BLD_FUNC(x)			\
+		FIELD_PREP(PRIM_C_BLD_FUNC_MASK, (x))
+#define  SEC_C_BLD_FUNC_MASK			GENMASK(6, 4)
+#define  SEC_C_BLD_FUNC(x)			\
+		FIELD_PREP(SEC_C_BLD_FUNC_MASK, (x))
+#define  PRIM_A_BLD_FUNC_MASK			GENMASK(10, 8)
+#define  PRIM_A_BLD_FUNC(x)			\
+		FIELD_PREP(PRIM_A_BLD_FUNC_MASK, (x))
+#define  SEC_A_BLD_FUNC_MASK			GENMASK(14, 12)
+#define  SEC_A_BLD_FUNC(x)			\
+		FIELD_PREP(SEC_A_BLD_FUNC_MASK, (x))
+
+#define POSITION				0x14
+#define  XPOS_MASK				GENMASK(15, 0)
+#define  XPOS(x)				FIELD_PREP(XPOS_MASK, (x))
+#define  YPOS_MASK				GENMASK(31, 16)
+#define  YPOS(x)				FIELD_PREP(YPOS_MASK, (x))
+
+enum dc_lb_blend_func {
+	DC_LAYERBLEND_BLEND_ZERO,
+	DC_LAYERBLEND_BLEND_ONE,
+	DC_LAYERBLEND_BLEND_PRIM_ALPHA,
+	DC_LAYERBLEND_BLEND_ONE_MINUS_PRIM_ALPHA,
+	DC_LAYERBLEND_BLEND_SEC_ALPHA,
+	DC_LAYERBLEND_BLEND_ONE_MINUS_SEC_ALPHA,
+	DC_LAYERBLEND_BLEND_CONST_ALPHA,
+	DC_LAYERBLEND_BLEND_ONE_MINUS_CONST_ALPHA,
+};
+
+enum dc_lb_shadow_sel {
+	BOTH = 0x2,
+};
+
+static const struct regmap_range dc_lb_pec_regmap_access_ranges[] = {
+	regmap_reg_range(PIXENGCFG_DYNAMIC, PIXENGCFG_DYNAMIC),
+};
+
+static const struct regmap_access_table dc_lb_pec_regmap_access_table = {
+	.yes_ranges = dc_lb_pec_regmap_access_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_lb_pec_regmap_access_ranges),
+};
+
+static const struct regmap_config dc_lb_pec_regmap_config = {
+	.name = "layerblend-pec",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_lb_pec_regmap_access_table,
+	.rd_table = &dc_lb_pec_regmap_access_table,
+};
+
+static const struct regmap_range dc_lb_regmap_ranges[] = {
+	regmap_reg_range(STATICCONTROL, POSITION),
+};
+
+static const struct regmap_access_table dc_lb_regmap_access_table = {
+	.yes_ranges = dc_lb_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_lb_regmap_ranges),
+};
+
+static const struct regmap_config dc_lb_cfg_regmap_config = {
+	.name = "layerblend-cfg",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_lb_regmap_access_table,
+	.rd_table = &dc_lb_regmap_access_table,
+};
+
+static const enum dc_link_id lb_links[] = {
+	LINK_ID_LAYERBLEND0,
+	LINK_ID_LAYERBLEND1,
+	LINK_ID_LAYERBLEND2,
+	LINK_ID_LAYERBLEND3,
+};
+
+static const enum dc_link_id prim_sels[] = {
+	/* common options */
+	LINK_ID_NONE,
+	LINK_ID_CONSTFRAME0,
+	LINK_ID_CONSTFRAME1,
+	LINK_ID_CONSTFRAME4,
+	LINK_ID_CONSTFRAME5,
+	/*
+	 * special options:
+	 * layerblend(n) has n special options,
+	 * from layerblend0 to layerblend(n - 1), e.g.,
+	 * layerblend3 has 3 special options -
+	 * layerblend0/1/2.
+	 */
+	LINK_ID_LAYERBLEND0,
+	LINK_ID_LAYERBLEND1,
+	LINK_ID_LAYERBLEND2,
+	LINK_ID_LAYERBLEND3,
+};
+
+static const enum dc_link_id sec_sels[] = {
+	LINK_ID_NONE,
+	LINK_ID_FETCHWARP2,
+	LINK_ID_FETCHLAYER0,
+};
+
+enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
+{
+	return lb->link;
+}
+
+void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim)
+{
+	int fixed_sels_num = ARRAY_SIZE(prim_sels) - 4;
+	int i;
+
+	for (i = 0; i < fixed_sels_num + lb->id; i++) {
+		if (prim_sels[i] == prim) {
+			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
+					  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK,
+					  PIXENGCFG_DYNAMIC_PRIM_SEL(prim));
+			return;
+		}
+	}
+}
+
+void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sec_sels); i++) {
+		if (sec_sels[i] == sec) {
+			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
+					  PIXENGCFG_DYNAMIC_SEC_SEL_MASK,
+					  PIXENGCFG_DYNAMIC_SEC_SEL(sec));
+			return;
+		}
+	}
+}
+
+void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken)
+{
+	regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC, CLKEN_MASK,
+			  CLKEN(clken));
+}
+
+static inline void dc_lb_enable_shden(struct dc_lb *lb)
+{
+	regmap_write_bits(lb->reg_cfg, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static inline void dc_lb_shdtoksel(struct dc_lb *lb, enum dc_lb_shadow_sel sel)
+{
+	regmap_write_bits(lb->reg_cfg, STATICCONTROL, SHDTOKSEL_MASK,
+			  SHDTOKSEL(sel));
+}
+
+static inline void dc_lb_shdldsel(struct dc_lb *lb, enum dc_lb_shadow_sel sel)
+{
+	regmap_write_bits(lb->reg_cfg, STATICCONTROL, SHDLDSEL_MASK,
+			  SHDLDSEL(sel));
+}
+
+void dc_lb_mode(struct dc_lb *lb, enum dc_lb_mode mode)
+{
+	regmap_write_bits(lb->reg_cfg, CONTROL, CTRL_MODE_MASK, mode);
+}
+
+static inline void dc_lb_blendcontrol(struct dc_lb *lb)
+{
+	u32 val = PRIM_A_BLD_FUNC(DC_LAYERBLEND_BLEND_ZERO) |
+		  SEC_A_BLD_FUNC(DC_LAYERBLEND_BLEND_ZERO) |
+		  PRIM_C_BLD_FUNC(DC_LAYERBLEND_BLEND_ZERO) |
+		  SEC_C_BLD_FUNC(DC_LAYERBLEND_BLEND_CONST_ALPHA) |
+		  ALPHA(DRM_BLEND_ALPHA_OPAQUE >> 8);
+
+	regmap_write(lb->reg_cfg, BLENDCONTROL, val);
+}
+
+void dc_lb_position(struct dc_lb *lb, int x, int y)
+{
+	regmap_write(lb->reg_cfg, POSITION, XPOS(x) | YPOS(y));
+}
+
+unsigned int dc_lb_get_id(struct dc_lb *lb)
+{
+	return lb->id;
+}
+
+void dc_lb_init(struct dc_lb *lb)
+{
+	dc_lb_pec_dynamic_prim_sel(lb, LINK_ID_NONE);
+	dc_lb_pec_dynamic_sec_sel(lb, LINK_ID_NONE);
+	dc_lb_pec_clken(lb, CLKEN_DISABLE);
+	dc_lb_shdldsel(lb, BOTH);
+	dc_lb_shdtoksel(lb, BOTH);
+	dc_lb_blendcontrol(lb);
+	dc_lb_enable_shden(lb);
+}
+
+static int dc_lb_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct dc_pe *pe = dc_drm->pe;
+	void __iomem *base_pec;
+	void __iomem *base_cfg;
+	struct dc_lb *lb;
+
+	lb = devm_kzalloc(dev, sizeof(*lb), GFP_KERNEL);
+	if (!lb)
+		return -ENOMEM;
+
+	base_pec = devm_platform_ioremap_resource_byname(pdev, "pec");
+	if (IS_ERR(base_pec))
+		return PTR_ERR(base_pec);
+
+	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(base_cfg))
+		return PTR_ERR(base_cfg);
+
+	lb->reg_pec = devm_regmap_init_mmio(dev, base_pec,
+					    &dc_lb_pec_regmap_config);
+	if (IS_ERR(lb->reg_pec))
+		return PTR_ERR(lb->reg_pec);
+
+	lb->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
+					    &dc_lb_cfg_regmap_config);
+	if (IS_ERR(lb->reg_cfg))
+		return PTR_ERR(lb->reg_cfg);
+
+	lb->id = of_alias_get_id(dev->of_node, "dc0-layerblend");
+	if (lb->id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", lb->id);
+		return lb->id;
+	}
+
+	lb->link = lb_links[lb->id];
+
+	pe->lb[lb->id] = lb;
+
+	return 0;
+}
+
+static const struct component_ops dc_lb_ops = {
+	.bind = dc_lb_bind,
+};
+
+static int dc_lb_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_lb_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_lb_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_lb_ops);
+}
+
+static const struct of_device_id dc_lb_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-layerblend", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_lb_dt_ids);
+
+struct platform_driver dc_lb_driver = {
+	.probe = dc_lb_probe,
+	.remove_new = dc_lb_remove,
+	.driver = {
+		.name = "imx8-dc-layerblend",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_lb_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.c b/drivers/gpu/drm/imx/dc/dc-pe.c
new file mode 100644
index 000000000000..8f186b95dc06
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-pe.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+
+#include "dc-drv.h"
+#include "dc-fu.h"
+#include "dc-pe.h"
+
+static int dc_pe_bind(struct device *dev, struct device *master, void *data)
+{
+	struct dc_drm_device *dc_drm = data;
+	struct dc_pe *pe;
+	int ret;
+
+	pe = devm_kzalloc(dev, sizeof(*pe), GFP_KERNEL);
+	if (!pe)
+		return -ENOMEM;
+
+	pe->clk_axi = devm_clk_get(dev, NULL);
+	if (IS_ERR(pe->clk_axi))
+		return dev_err_probe(dev, PTR_ERR(pe->clk_axi),
+				     "failed to get AXI clock\n");
+
+	pe->dev = dev;
+
+	dev_set_drvdata(dev, pe);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	dc_drm->pe = pe;
+
+	return 0;
+}
+
+static const struct component_ops dc_pe_ops = {
+	.bind = dc_pe_bind,
+};
+
+static int dc_pe_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = component_add(&pdev->dev, &dc_pe_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_pe_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_pe_ops);
+}
+
+static int dc_pe_runtime_suspend(struct device *dev)
+{
+	struct dc_pe *pe = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(pe->clk_axi);
+
+	return 0;
+}
+
+static int dc_pe_runtime_resume(struct device *dev)
+{
+	struct dc_pe *pe = dev_get_drvdata(dev);
+	int i, ret;
+
+	ret = clk_prepare_enable(pe->clk_axi);
+	if (ret) {
+		dev_err(dev, "failed to enable AXI clock: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pe->cf_safe); i++)
+		dc_cf_init(pe->cf_safe[i]);
+
+	for (i = 0; i < ARRAY_SIZE(pe->cf_cont); i++)
+		dc_cf_init(pe->cf_cont[i]);
+
+	for (i = 0; i < ARRAY_SIZE(pe->ed_safe); i++)
+		dc_ed_init(pe->ed_safe[i]);
+
+	for (i = 0; i < ARRAY_SIZE(pe->ed_cont); i++)
+		dc_ed_init(pe->ed_cont[i]);
+
+	for (i = 0; i < ARRAY_SIZE(pe->fu_disp); i++)
+		pe->fu_disp[i]->ops.init(pe->fu_disp[i]);
+
+	for (i = 0; i < ARRAY_SIZE(pe->lb); i++)
+		dc_lb_init(pe->lb[i]);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_pe_pm_ops = {
+	RUNTIME_PM_OPS(dc_pe_runtime_suspend, dc_pe_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_pe_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-pixel-engine", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_pe_dt_ids);
+
+struct platform_driver dc_pe_driver = {
+	.probe = dc_pe_probe,
+	.remove_new = dc_pe_remove,
+	.driver = {
+		.name = "imx8-dc-pixel-engine",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_pe_dt_ids,
+		.pm = pm_sleep_ptr(&dc_pe_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
new file mode 100644
index 000000000000..d0c1080e58d8
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_PIXEL_ENGINE_H__
+#define __DC_PIXEL_ENGINE_H__
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+
+#include "dc-de.h"
+
+#define SHDEN			BIT(0)
+
+#define CLKEN_MASK_SHIFT	24
+#define CLKEN_MASK		(0x3 << CLKEN_MASK_SHIFT)
+#define CLKEN(n)		((n) << CLKEN_MASK_SHIFT)
+
+#define DC_DISP_FETCHUNIT_CNT	2
+#define DC_LAYERBLEND_CNT	4
+
+enum dc_link_id {
+	LINK_ID_NONE		= 0x00,
+	LINK_ID_CONSTFRAME0	= 0x0c,
+	LINK_ID_CONSTFRAME4	= 0x0e,
+	LINK_ID_CONSTFRAME1	= 0x10,
+	LINK_ID_CONSTFRAME5	= 0x12,
+	LINK_ID_FETCHWARP2	= 0x14,
+	LINK_ID_FETCHLAYER0	= 0x1a,
+	LINK_ID_LAYERBLEND0	= 0x21,
+	LINK_ID_LAYERBLEND1	= 0x22,
+	LINK_ID_LAYERBLEND2	= 0x23,
+	LINK_ID_LAYERBLEND3	= 0x24,
+};
+
+enum dc_lb_mode {
+	LB_NEUTRAL,	/* Output is same as primary input. */
+	LB_BLEND,
+};
+
+enum dc_pec_clken {
+	CLKEN_DISABLE,
+	CLKEN_AUTOMATIC,
+};
+
+struct dc_cf {
+	struct regmap *reg_cfg;
+	enum dc_link_id link;
+};
+
+struct dc_ed {
+	struct device *dev;
+	struct regmap *reg_pec;
+	struct regmap *reg_cfg;
+	int irq_shdld;
+};
+
+struct dc_lb {
+	struct regmap *reg_pec;
+	struct regmap *reg_cfg;
+	int id;
+	enum dc_link_id link;
+};
+
+struct dc_pe {
+	struct device *dev;
+	struct clk *clk_axi;
+	struct dc_cf *cf_safe[DC_DISPLAYS];
+	struct dc_cf *cf_cont[DC_DISPLAYS];
+	struct dc_ed *ed_safe[DC_DISPLAYS];
+	struct dc_ed *ed_cont[DC_DISPLAYS];
+	struct dc_fu *fu_disp[DC_DISP_FETCHUNIT_CNT];
+	struct dc_lb *lb[DC_LAYERBLEND_CNT];
+};
+
+/* Constant Frame Unit */
+enum dc_link_id dc_cf_get_link_id(struct dc_cf *cf);
+void dc_cf_framedimensions(struct dc_cf *cf, unsigned int w, unsigned int h);
+void dc_cf_constantcolor_black(struct dc_cf *cf);
+void dc_cf_constantcolor_blue(struct dc_cf *cf);
+void dc_cf_init(struct dc_cf *cf);
+
+/* External Destination Unit */
+void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src);
+void dc_ed_pec_sync_trigger(struct dc_ed *ed);
+void dc_ed_init(struct dc_ed *ed);
+
+/* Layer Blend Unit */
+enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb);
+void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim);
+void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec);
+void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken);
+void dc_lb_mode(struct dc_lb *lb, enum dc_lb_mode mode);
+void dc_lb_position(struct dc_lb *lb, int x, int y);
+unsigned int dc_lb_get_id(struct dc_lb *lb);
+void dc_lb_init(struct dc_lb *lb);
+
+#endif /* __DC_PIXEL_ENGINE_H__ */
-- 
2.34.1

