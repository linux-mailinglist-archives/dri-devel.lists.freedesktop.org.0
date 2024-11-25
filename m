Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0B19D8261
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653D110E5E5;
	Mon, 25 Nov 2024 09:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hb6hqUWE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F42410E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:34:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dm4dVXfHMI5RqXB/YTqabeVAWQE0a84M2qY2s6UCrwElGe1AvADIV8DkDcU4RKZwQr6K19fsbhYuqFQin97xwwP/0mZMy8Oz0k7JlM80eI9Q/biVNHbZVOP5cOTZlDK3kGOwqJVQvceagZoobsnZ+baBRC96RfWIpbftc6BOPQjOdpqjs3fEUtLAV3FQFsT8pAxNrkp1anUUaii+bW30ua7OHeGD3zPTMf8yW5nqLIQr3+tFU7lG7Oi7FEhcICAHt9By58tjMg5WJNO5NvQWzJDOjudvg7eYs2D2zWQiwjjNzxLurZjuEYmZ+jdh+dNBbHQsilWlp7P6e+IUfGWEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8n+JXdV/8xKybkaz3//khAp/P7xQQWjJoRYjAzelgWo=;
 b=cDfmDxDixrWyXyCSIwOeo7vdeH6OInbvjbyYpta1SYWB7qlVwnjQeyPKineJ0vKAaZ/0UxlC8zQHVlfvXA7+JMZ+rGz6ZobIULQeHeFxETUQcrtF5DYWw1ciAVJvl3ztHEPlrNhbKRRMB7C5tzE5VaEC1GwwXZ8nDGpSJD7CQJYs2xCZTsFGk1FZNIXp/J7cKAbfEQvFXfUZnsthuDwr6+LZPmSXX4YfwEFoGebdtQyHtxDnZhhvDS6+bFJsFyqgj+dr/wUqQ8iXStcAES84j55LdzEQTldD/xDuqyPQWT6vAg9Hgit9aR7+oU+iIe27G9udctqmwedWlGXgfRhPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8n+JXdV/8xKybkaz3//khAp/P7xQQWjJoRYjAzelgWo=;
 b=hb6hqUWERBLCExGRK6HW384TjL3cqhJ3rV48pj3tIIf5bxdhxSVOIVJg8vd8M8fHGE5BAgnU7mVXI3wyA2jJe4MOd5at0gxvEH3chvU8SB1D1zXFI9TDs50patLXGjds7RCLWIL4ZFdnnuLORqrLE2kDFHezXZKnUGWzW+iFzSOnTRK6v3U0va8hv6v4ZKmMNKbKoqCEi4t/GMMMFqEvmaj19ZDf9mWG+g7grq3I7VNAkhaX1jTOq5UwjCHuSgZqUqNwCIuI36T+5FW2BAAHpC9Iry1UZWA28ib9w/2C/IQW9JpgjAq+ugKdzsLGw8lN35RIZeZiNxRMyQkDCrZONw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7919.eurprd04.prod.outlook.com (2603:10a6:102:c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 09:34:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:34:13 +0000
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
Subject: [PATCH v4 09/19] drm/imx: Add i.MX8qxp Display Controller display
 engine
Date: Mon, 25 Nov 2024 17:33:06 +0800
Message-Id: <20241125093316.2357162-10-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: cbd999f1-f11f-48c3-dce0-08dd0d345259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RQHi/gz+bc0Rs7CA+EwgjEw7ySHfeB2I019E7vP0Z9o5T+YqurLri83S2YX6?=
 =?us-ascii?Q?4OWdJXnBNRQ3+BzMKxsaes//hqFimutzbi4tomZDo81p+v0mZam1sdjRGTss?=
 =?us-ascii?Q?lPGxVMTtapzNlZO9bzeQpieyprt7iY5+4hEZKUwISdQqcvRDsptvxUZOViFp?=
 =?us-ascii?Q?oVCcR7Vcgjubyl7/nT2MiftTRoT9y81JK6nEJlsTgD4U5JTMs1tIhpBiY0vx?=
 =?us-ascii?Q?rqCIbWbtFJ25QasO7L+7v4EvS/bL6N/yl2OrfXKtwQJLeb/+YKWNvOLe5xxU?=
 =?us-ascii?Q?qOud+ZDvt+nRP5nKzjKzKqOsVP1wBDNCztku5imzs+tmntd6ahUexzhOqkQz?=
 =?us-ascii?Q?E5AHPikCIEVnErjrznS8rc0CCJmkHdngGFfHGp/rdFbUBa3y13u/rshd9WaR?=
 =?us-ascii?Q?SSo8TEdHnMeWgFxdvy5OPAX4HN/n3urKNOlSYNUj8OSdz86Odfj/AhZSmqvu?=
 =?us-ascii?Q?13iSDwmpmmGzY3nYLJraeG6F6D3wlLT3pwFSHKD+w5GiCzU9deHYWSvq8G2I?=
 =?us-ascii?Q?sfn4x3isIGaDTtV57bjfLOBABhhUY3vpgZ+YqqlJgPPCrpJ63fIGa7jgtkDK?=
 =?us-ascii?Q?ywvN+6Z+ilPiU4b0/iHqx7b5FEXCOyYR+9eQ8+XYhjCxRzwwM1cX9b+rwRMp?=
 =?us-ascii?Q?6MITziLFsDkn2EvhOgQTJ+8K8J/uAyRcWCFMyuIYTlRSYgJe0kmBHfYiUUQl?=
 =?us-ascii?Q?AqQQDYY+kUKl/TJUdqyx7j2Fycpsrn4aKgu1S/2FiVjfli8O/jr2kudoKB2K?=
 =?us-ascii?Q?bskmcfgGZFee90omxOYW7OXQ4D4GEB0gbKXPjzR8lAa4y1o4//1y96wYoivD?=
 =?us-ascii?Q?FBTYGMuDB71MK4pAX/AuL/KdDJVADsVs0m8s2DTtpg9VuD8KOuMg/nSDPz78?=
 =?us-ascii?Q?T2mFJK0v0QVTYe0gu5ogme1SUrz8/YSneLs9ljp8Xl+iIqKNfzSvwH+yQfHl?=
 =?us-ascii?Q?VE9C2CyO7IRRJacpWAhUZ5fLTGFsVfvLalou/E8iEtqklFt2t5YYWhe3X0ZY?=
 =?us-ascii?Q?8UaZuRG34ihi2trm4wEvzhSvSDZC/ye/BUHB1Vg1VmudTweifR8AOMd1NzoN?=
 =?us-ascii?Q?YkgMN/b8pVnkMBQtwsNPtKeemE8lrPcRteXuznMHf2xj7dFU06Pq0KhMHq6n?=
 =?us-ascii?Q?xZV/9wHAEEPR1IykdKEvkDArMefEi/Kzr8Gglf44XXG2aH+53XLSOMRBHLre?=
 =?us-ascii?Q?1pj4LONXK2kAy5RtaZDODO6ojmRixJg16UFAKhhKg5i1yknFiwMgKdJJexA1?=
 =?us-ascii?Q?eVqDcFBYlxsFO807GIK3PSqB0y9PutM5tQloJ0yzbgW0j/p2ZPV5ijJBsP+e?=
 =?us-ascii?Q?F/yKvw1pRDYL6RdwLFtQV6XoQzgfQoSehcezi2to4+/sEbeIKXREU9PoBt1D?=
 =?us-ascii?Q?jbuCslMTLsejs2I6x61gMnFj8dGbDZwXAdYb6bU8iLZX3uFW1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fVJ6JoPz0I+3g7z8yQzy2AeB2zbeXlhwvCAoKQF5tvRJO1l9QwIBmnpJa6hV?=
 =?us-ascii?Q?/oHpv37aKwBySz+oKrWma8wOUGIxgP2uKraVizDDx08/wxn78kBiGsl7/8R5?=
 =?us-ascii?Q?ZKE4cOhNtgcS/LzpvkB/z71zwRpSRSwGtTl3nrSJNRGC0q12c2HRyvLTp6M2?=
 =?us-ascii?Q?6k2vaUHNBC77rlH4dCp/EX1jV2/u84VLpcUOBl7Q5QyZK58k96LDAKRLzfwr?=
 =?us-ascii?Q?v2QuBuX8D5LPr423Xc5u7+Eo2FyUZ3JgQLEuwfTYPoGl121ieqAQuQZBPbyI?=
 =?us-ascii?Q?sPOkD2s7KK2oPf0eQNA+qQcc5JaT/06PfB2mifZ1RTmX291pJxJWJqSxgnis?=
 =?us-ascii?Q?H45++d4YhX/yvAGnmY8OahRpUdKjsr2ivG/xzxJxmaOFoihXiRLKUGYw/cKw?=
 =?us-ascii?Q?5npzPPLwK3fFt9mpm6JQ2LnF6+hrz4K3bAEjHOHrJJn00dYlEKELWJo8MyLs?=
 =?us-ascii?Q?ojZjG4kwyjryd25xTjzc5gzsEsLaqD5qWGFcDku6hfCO5KjGoMhlKwofxw8b?=
 =?us-ascii?Q?vm6hcob0zYkT4cnNaYxODUrHBPCXaVftaQxtEzc16hQs2390L6jpDIiTOIFT?=
 =?us-ascii?Q?a4B8dcKz3lRoibOxU6pNKjuVCYCDzYgD4GE6s/0ga3hOIIbrEkKWdkKMT0l8?=
 =?us-ascii?Q?D09gumJw3s2sPhLEN9DUFzZSHlTdbcu/sxZzkH4W2y9kPKWK4j6ll0RjUzYG?=
 =?us-ascii?Q?5urGVauCcjWSd21WEzNIiEVpeGx5m1V0oGkMs5HhF1o0E7qiPMbErr4ySY4a?=
 =?us-ascii?Q?RvorKW7knS3ja3ieVtTBMWJtEoRTx491ggRx11j6vyrIeInrGodg9IUfZ1y7?=
 =?us-ascii?Q?QVoVgVGZQG+4Q1eUFBxMYrduSv/yQYLcZKZ8v4//YTb8cQol2NXO5t804vRE?=
 =?us-ascii?Q?KyPP+EFSiUobnTZjgtMov0Kqn8RR7JufEXZ94xntQTRr5Nhd/6gkBtcXU6ng?=
 =?us-ascii?Q?e4qmYyDK3NpPjv4G78yRAPeA4CfUnotJuiKgMdFVcHacf6MKZ9jZUj+F7Tna?=
 =?us-ascii?Q?CRpb6ZPefAr+GV+kCISrtHs0aHmZDXBKNPQNuFgbkOvcPlvEF4tpH3Qc5iUN?=
 =?us-ascii?Q?hebAhJ3q19fN2QlD611wIL1YJiyamjjDbYnFThlsHoN1fuWWOkKcr999IuT9?=
 =?us-ascii?Q?BePpN1dpvwUHaLQLi3KqyxJm85z4PaRfwIXgM231Rr5qu7wVQUtSaZoGwtAO?=
 =?us-ascii?Q?xjPErQ5m5pUZthRQv3lQhAMpI0ZBe0ztW8g3oJ53XaCH3S5KZhA/LqpW2NIA?=
 =?us-ascii?Q?/NeDtIJ4isTBY6BMyNLi3bg/6VTFAy+7pFLPIpv/hApeIjxfEl8ds6bXttR0?=
 =?us-ascii?Q?8Hn/PTYeEtMEJw5RRdHI7eiAI+n3Znob68RlO3nxnb8lt9MAwRmJkdHVo2Jl?=
 =?us-ascii?Q?J8GqT3ZrlQLG44hZH2GsOCGFPxh/vhwKCKdgX7LWcyJgM371Z6AvcSB0aCg1?=
 =?us-ascii?Q?q+lKyXMDNdMx2HwAFmc4FmsKuvhFVPTBjJ/jn+0RTqn/cCzAENnnXXgZJX3W?=
 =?us-ascii?Q?N+PSLK2Xh+Rkwc3JweH1lbEHDZLTlq/Z/imNW3vA2VQ1LBKszNDtpNDzX8xY?=
 =?us-ascii?Q?T1pcBoF+e37nQ/7eHzXMJDVq+Mh298dpXf/aH9za?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd999f1-f11f-48c3-dce0-08dd0d345259
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:34:13.0703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKOeJ1P13P1qcMlBD4iWdVoMO1HPaOEskKzd2B3hxs/fsu9ldFl3bheC847yfHQoKz7XrINxcHgck0ppQJrCGg==
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

i.MX8qxp Display Controller display engine consists of all processing
units that operate in a display clock domain.  Add minimal feature
support with FrameGen and TCon so that the engine can output display
timings.  The display engine driver as a master binds FrameGen and
TCon drivers as components.  While at it, the display engine driver
is a component to be bound with the upcoming DRM driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
* Use regmap to define register map for all registers. (Dmitry)
* Use regmap APIs to access registers. (Dmitry)
* Inline some small functions. (Dmitry)
* Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
  KMS routine to initialization stage. (Dmitry)
* Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
* Drop unnecessary private struct dc_*_priv.
* Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
  interfaces to bind/unbind the drivers.

v3:
* No change.

v2:
* Use OF alias id to get instance id.
* Add dev member to struct dc_tc.

 drivers/gpu/drm/imx/Kconfig     |   1 +
 drivers/gpu/drm/imx/Makefile    |   1 +
 drivers/gpu/drm/imx/dc/Kconfig  |   5 +
 drivers/gpu/drm/imx/dc/Makefile |   5 +
 drivers/gpu/drm/imx/dc/dc-de.c  | 153 +++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.h  |  57 +++++
 drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
 drivers/gpu/drm/imx/dc/dc-drv.h |  24 ++
 drivers/gpu/drm/imx/dc/dc-fg.c  | 374 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-tc.c  | 138 ++++++++++++
 10 files changed, 790 insertions(+)
 create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dc/Makefile
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c

diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index 03535a15dd8f..3e8c6edbc17c 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+source "drivers/gpu/drm/imx/dc/Kconfig"
 source "drivers/gpu/drm/imx/dcss/Kconfig"
 source "drivers/gpu/drm/imx/ipuv3/Kconfig"
 source "drivers/gpu/drm/imx/lcdc/Kconfig"
diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
index 86f38e7c7422..c7b317640d71 100644
--- a/drivers/gpu/drm/imx/Makefile
+++ b/drivers/gpu/drm/imx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(CONFIG_DRM_IMX8_DC) += dc/
 obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
 obj-$(CONFIG_DRM_IMX) += ipuv3/
 obj-$(CONFIG_DRM_IMX_LCDC) += lcdc/
diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
new file mode 100644
index 000000000000..32d7471c49d0
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -0,0 +1,5 @@
+config DRM_IMX8_DC
+	tristate "Freescale i.MX8 Display Controller Graphics"
+	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	help
+	  enable Freescale i.MX8 Display Controller(DC) graphics support
diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
new file mode 100644
index 000000000000..56de82d53d4d
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+imx8-dc-drm-objs := dc-de.o dc-drv.o dc-fg.o dc-tc.o
+
+obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
new file mode 100644
index 000000000000..66b8918dc156
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-de.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include "dc-de.h"
+#include "dc-drv.h"
+
+#define POLARITYCTRL		0xc
+#define  POLEN_HIGH		BIT(2)
+
+static const struct regmap_range dc_de_regmap_ranges[] = {
+	regmap_reg_range(POLARITYCTRL, POLARITYCTRL),
+};
+
+static const struct regmap_access_table dc_de_regmap_access_table = {
+	.yes_ranges = dc_de_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_de_regmap_ranges),
+};
+
+static const struct regmap_config dc_de_top_regmap_config = {
+	.name = "display-engine-top",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_de_regmap_access_table,
+	.rd_table = &dc_de_regmap_access_table,
+};
+
+static inline void dc_dec_init(struct dc_de *de)
+{
+	regmap_write_bits(de->reg_top, POLARITYCTRL, POLARITYCTRL, POLEN_HIGH);
+}
+
+static int dc_de_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	void __iomem *base_top;
+	struct dc_de *de;
+	int ret;
+
+	de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
+	if (!de)
+		return -ENOMEM;
+
+	base_top = devm_platform_ioremap_resource_byname(pdev, "top");
+	if (IS_ERR(base_top))
+		return PTR_ERR(base_top);
+
+	de->reg_top = devm_regmap_init_mmio(dev, base_top,
+					    &dc_de_top_regmap_config);
+	if (IS_ERR(de->reg_top))
+		return PTR_ERR(de->reg_top);
+
+	de->irq_shdld = platform_get_irq_byname(pdev, "shdload");
+	if (de->irq_shdld < 0)
+		return de->irq_shdld;
+
+	de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
+	if (de->irq_framecomplete < 0)
+		return de->irq_framecomplete;
+
+	de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
+	if (de->irq_seqcomplete < 0)
+		return de->irq_seqcomplete;
+
+	de->id = of_alias_get_id(dev->of_node, "dc0-display-engine");
+	if (de->id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", de->id);
+		return de->id;
+	}
+
+	de->dev = dev;
+
+	dev_set_drvdata(dev, de);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	dc_drm->de[de->id] = de;
+
+	return 0;
+}
+
+static const struct component_ops dc_de_ops = {
+	.bind = dc_de_bind,
+};
+
+static int dc_de_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = component_add(&pdev->dev, &dc_de_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_de_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_de_ops);
+}
+
+static int dc_de_runtime_resume(struct device *dev)
+{
+	struct dc_de *de = dev_get_drvdata(dev);
+
+	dc_dec_init(de);
+	dc_fg_init(de->fg);
+	dc_tc_init(de->tc);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_de_pm_ops = {
+	RUNTIME_PM_OPS(NULL, dc_de_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_de_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-display-engine", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_de_dt_ids);
+
+struct platform_driver dc_de_driver = {
+	.probe = dc_de_probe,
+	.remove_new = dc_de_remove,
+	.driver = {
+		.name = "imx8-dc-display-engine",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_de_dt_ids,
+		.pm = pm_sleep_ptr(&dc_de_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
new file mode 100644
index 000000000000..17a44362118e
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_DISPLAY_ENGINE_H__
+#define __DC_DISPLAY_ENGINE_H__
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <drm/drm_modes.h>
+
+#define DC_DISPLAYS	2
+
+struct dc_fg {
+	struct device *dev;
+	struct regmap *reg;
+	struct clk *clk_disp;
+};
+
+struct dc_tc {
+	struct device *dev;
+	struct regmap *reg;
+};
+
+struct dc_de {
+	struct device *dev;
+	struct regmap *reg_top;
+	struct dc_fg *fg;
+	struct dc_tc *tc;
+	int irq_shdld;
+	int irq_framecomplete;
+	int irq_seqcomplete;
+	int id;
+};
+
+/* Frame Generator Unit */
+void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m);
+void dc_fg_enable(struct dc_fg *fg);
+void dc_fg_disable(struct dc_fg *fg);
+void dc_fg_shdtokgen(struct dc_fg *fg);
+u32 dc_fg_get_frame_index(struct dc_fg *fg);
+u32 dc_fg_get_line_index(struct dc_fg *fg);
+bool dc_fg_wait_for_frame_index_moving(struct dc_fg *fg);
+bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg);
+void dc_fg_secondary_clear_channel_status(struct dc_fg *fg);
+int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg);
+void dc_fg_enable_clock(struct dc_fg *fg);
+void dc_fg_disable_clock(struct dc_fg *fg);
+enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
+void dc_fg_init(struct dc_fg *fg);
+
+/* Timing Controller Unit */
+void dc_tc_init(struct dc_tc *tc);
+
+#endif /* __DC_DISPLAY_ENGINE_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
new file mode 100644
index 000000000000..e5910a82dd4d
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "dc-drv.h"
+
+static struct platform_driver * const dc_drivers[] = {
+	&dc_de_driver,
+	&dc_fg_driver,
+	&dc_tc_driver,
+};
+
+static int __init dc_drm_init(void)
+{
+	return platform_register_drivers(dc_drivers, ARRAY_SIZE(dc_drivers));
+}
+
+static void __exit dc_drm_exit(void)
+{
+	platform_unregister_drivers(dc_drivers, ARRAY_SIZE(dc_drivers));
+}
+
+module_init(dc_drm_init);
+module_exit(dc_drm_exit);
+
+MODULE_DESCRIPTION("i.MX8 Display Controller DRM Driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
new file mode 100644
index 000000000000..e1290d9a0a99
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_DRV_H__
+#define __DC_DRV_H__
+
+#include <linux/platform_device.h>
+
+#include <drm/drm_device.h>
+
+#include "dc-de.h"
+
+struct dc_drm_device {
+	struct drm_device base;
+	struct dc_de *de[DC_DISPLAYS];
+};
+
+extern struct platform_driver dc_de_driver;
+extern struct platform_driver dc_fg_driver;
+extern struct platform_driver dc_tc_driver;
+
+#endif /* __DC_DRV_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
new file mode 100644
index 000000000000..eebbafe39d7f
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/jiffies.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/units.h>
+
+#include <drm/drm_modes.h>
+
+#include "dc-de.h"
+#include "dc-drv.h"
+
+#define FGSTCTRL		0x8
+#define  FGSYNCMODE_MASK	GENMASK(2, 1)
+#define  FGSYNCMODE(x)		FIELD_PREP(FGSYNCMODE_MASK, (x))
+#define  SHDEN			BIT(0)
+
+#define HTCFG1			0xc
+#define  HTOTAL(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  HACT(x)		FIELD_PREP(GENMASK(13, 0), (x))
+
+#define HTCFG2			0x10
+#define  HSEN			BIT(31)
+#define  HSBP(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  HSYNC(x)		FIELD_PREP(GENMASK(13, 0), ((x) - 1))
+
+#define VTCFG1			0x14
+#define  VTOTAL(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  VACT(x)		FIELD_PREP(GENMASK(13, 0), (x))
+
+#define VTCFG2			0x18
+#define  VSEN			BIT(31)
+#define  VSBP(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  VSYNC(x)		FIELD_PREP(GENMASK(13, 0), ((x) - 1))
+
+#define PKICKCONFIG		0x2c
+#define SKICKCONFIG		0x30
+#define  EN			BIT(31)
+#define  ROW(x)			FIELD_PREP(GENMASK(29, 16), (x))
+#define  COL(x)			FIELD_PREP(GENMASK(13, 0), (x))
+
+#define PACFG			0x54
+#define SACFG			0x58
+#define  STARTY(x)		FIELD_PREP(GENMASK(29, 16), ((x) + 1))
+#define  STARTX(x)		FIELD_PREP(GENMASK(13, 0), ((x) + 1))
+
+#define FGINCTRL		0x5c
+#define FGINCTRLPANIC		0x60
+#define  FGDM_MASK		GENMASK(2, 0)
+#define  ENPRIMALPHA		BIT(3)
+#define  ENSECALPHA		BIT(4)
+
+#define FGCCR			0x64
+#define  CCGREEN(x)		FIELD_PREP(GENMASK(19, 10), (x))
+
+#define FGENABLE		0x68
+#define  FGEN			BIT(0)
+
+#define FGSLR			0x6c
+#define  SHDTOKGEN		BIT(0)
+
+#define FGTIMESTAMP		0x74
+#define  FRAMEINDEX(x)		FIELD_GET(GENMASK(31, 14), (x))
+#define  LINEINDEX(x)		FIELD_GET(GENMASK(13, 0), (x))
+
+#define FGCHSTAT		0x78
+#define  SECSYNCSTAT		BIT(24)
+#define  SFIFOEMPTY		BIT(16)
+
+#define FGCHSTATCLR		0x7c
+#define  CLRSECSTAT		BIT(16)
+
+enum dc_fg_syncmode {
+	FG_SYNCMODE_OFF,	/* No side-by-side synchronization. */
+};
+
+enum dc_fg_dm {
+	FG_DM_CONSTCOL = 0x1,	/* Constant Color Background is shown. */
+	FG_DM_SEC_ON_TOP = 0x5,	/* Both inputs overlaid with secondary on top. */
+};
+
+static const struct regmap_range dc_fg_regmap_wr_ranges[] = {
+	regmap_reg_range(FGSTCTRL, VTCFG2),
+	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
+	regmap_reg_range(PACFG, FGSLR),
+	regmap_reg_range(FGCHSTATCLR, FGCHSTATCLR),
+};
+
+static const struct regmap_range dc_fg_regmap_rd_ranges[] = {
+	regmap_reg_range(FGSTCTRL, VTCFG2),
+	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
+	regmap_reg_range(PACFG, FGSLR),
+	regmap_reg_range(FGTIMESTAMP, FGCHSTATCLR),
+};
+
+static const struct regmap_access_table dc_fg_regmap_wr_table = {
+	.yes_ranges = dc_fg_regmap_wr_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_wr_ranges),
+};
+
+static const struct regmap_access_table dc_fg_regmap_rd_table = {
+	.yes_ranges = dc_fg_regmap_rd_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_rd_ranges),
+};
+
+static const struct regmap_config dc_fg_regmap_config = {
+	.name = "framegen",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_fg_regmap_wr_table,
+	.rd_table = &dc_fg_regmap_rd_table,
+};
+
+static inline void dc_fg_enable_shden(struct dc_fg *fg)
+{
+	regmap_write_bits(fg->reg, FGSTCTRL, SHDEN, SHDEN);
+}
+
+static inline void dc_fg_syncmode(struct dc_fg *fg, enum dc_fg_syncmode mode)
+{
+	regmap_write_bits(fg->reg, FGSTCTRL, FGSYNCMODE_MASK, FGSYNCMODE(mode));
+}
+
+void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
+{
+	u32 hact, htotal, hsync, hsbp;
+	u32 vact, vtotal, vsync, vsbp;
+	u32 kick_row, kick_col;
+	int ret;
+
+	hact = m->crtc_hdisplay;
+	htotal = m->crtc_htotal;
+	hsync = m->crtc_hsync_end - m->crtc_hsync_start;
+	hsbp = m->crtc_htotal - m->crtc_hsync_start;
+
+	vact = m->crtc_vdisplay;
+	vtotal = m->crtc_vtotal;
+	vsync = m->crtc_vsync_end - m->crtc_vsync_start;
+	vsbp = m->crtc_vtotal - m->crtc_vsync_start;
+
+	/* video mode */
+	regmap_write(fg->reg, HTCFG1, HACT(hact)   | HTOTAL(htotal));
+	regmap_write(fg->reg, HTCFG2, HSYNC(hsync) | HSBP(hsbp) | HSEN);
+	regmap_write(fg->reg, VTCFG1, VACT(vact)   | VTOTAL(vtotal));
+	regmap_write(fg->reg, VTCFG2, VSYNC(vsync) | VSBP(vsbp) | VSEN);
+
+	kick_col = hact + 1;
+	kick_row = vact;
+
+	/* pkickconfig */
+	regmap_write(fg->reg, PKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
+
+	/* skikconfig */
+	regmap_write(fg->reg, SKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
+
+	/* primary and secondary area position configuration */
+	regmap_write(fg->reg, PACFG, STARTX(0) | STARTY(0));
+	regmap_write(fg->reg, SACFG, STARTX(0) | STARTY(0));
+
+	/* alpha */
+	regmap_write_bits(fg->reg, FGINCTRL,      ENPRIMALPHA | ENSECALPHA, 0);
+	regmap_write_bits(fg->reg, FGINCTRLPANIC, ENPRIMALPHA | ENSECALPHA, 0);
+
+	/* constant color is green(used in panic mode)  */
+	regmap_write(fg->reg, FGCCR, CCGREEN(0x3ff));
+
+	ret = clk_set_rate(fg->clk_disp, m->clock * HZ_PER_KHZ);
+	if (ret < 0)
+		dev_err(fg->dev, "failed to set display clock rate: %d\n", ret);
+}
+
+static inline void dc_fg_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
+{
+	regmap_write_bits(fg->reg, FGINCTRL, FGDM_MASK, mode);
+}
+
+static inline void dc_fg_panic_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
+{
+	regmap_write_bits(fg->reg, FGINCTRLPANIC, FGDM_MASK, mode);
+}
+
+void dc_fg_enable(struct dc_fg *fg)
+{
+	regmap_write(fg->reg, FGENABLE, FGEN);
+}
+
+void dc_fg_disable(struct dc_fg *fg)
+{
+	regmap_write(fg->reg, FGENABLE, 0);
+}
+
+void dc_fg_shdtokgen(struct dc_fg *fg)
+{
+	regmap_write(fg->reg, FGSLR, SHDTOKGEN);
+}
+
+u32 dc_fg_get_frame_index(struct dc_fg *fg)
+{
+	u32 val;
+
+	regmap_read(fg->reg, FGTIMESTAMP, &val);
+
+	return FRAMEINDEX(val);
+}
+
+u32 dc_fg_get_line_index(struct dc_fg *fg)
+{
+	u32 val;
+
+	regmap_read(fg->reg, FGTIMESTAMP, &val);
+
+	return LINEINDEX(val);
+}
+
+bool dc_fg_wait_for_frame_index_moving(struct dc_fg *fg)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(100);
+	u32 frame_index, last_frame_index;
+
+	frame_index = dc_fg_get_frame_index(fg);
+	do {
+		last_frame_index = frame_index;
+		frame_index = dc_fg_get_frame_index(fg);
+	} while (last_frame_index == frame_index &&
+		 time_before(jiffies, timeout));
+
+	return last_frame_index != frame_index;
+}
+
+bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg)
+{
+	u32 val;
+
+	regmap_read(fg->reg, FGCHSTAT, &val);
+
+	return !!(val & SFIFOEMPTY);
+}
+
+void dc_fg_secondary_clear_channel_status(struct dc_fg *fg)
+{
+	regmap_write(fg->reg, FGCHSTATCLR, CLRSECSTAT);
+}
+
+int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg)
+{
+	unsigned int val;
+
+	return regmap_read_poll_timeout(fg->reg, FGCHSTAT, val,
+					val & SECSYNCSTAT, 5, 100000);
+}
+
+void dc_fg_enable_clock(struct dc_fg *fg)
+{
+	int ret;
+
+	ret = clk_prepare_enable(fg->clk_disp);
+	if (ret)
+		dev_err(fg->dev, "failed to enable display clock: %d\n", ret);
+}
+
+void dc_fg_disable_clock(struct dc_fg *fg)
+{
+	clk_disable_unprepare(fg->clk_disp);
+}
+
+enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz)
+{
+	unsigned long rounded_rate;
+
+	rounded_rate = clk_round_rate(fg->clk_disp, clk_khz * HZ_PER_KHZ);
+
+	if (rounded_rate != clk_khz * HZ_PER_KHZ)
+		return MODE_NOCLOCK;
+
+	return MODE_OK;
+}
+
+void dc_fg_init(struct dc_fg *fg)
+{
+	dc_fg_enable_shden(fg);
+	dc_fg_syncmode(fg, FG_SYNCMODE_OFF);
+	dc_fg_displaymode(fg, FG_DM_SEC_ON_TOP);
+	dc_fg_panic_displaymode(fg, FG_DM_CONSTCOL);
+}
+
+static int dc_fg_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	void __iomem *base;
+	struct dc_fg *fg;
+	struct dc_de *de;
+	int id;
+
+	fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
+	if (!fg)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
+	if (IS_ERR(fg->reg))
+		return PTR_ERR(fg->reg);
+
+	fg->clk_disp = devm_clk_get(dev, NULL);
+	if (IS_ERR(fg->clk_disp))
+		return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
+				     "failed to get display clock\n");
+
+	id = of_alias_get_id(dev->of_node, "dc0-framegen");
+	if (id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", id);
+		return id;
+	}
+
+	fg->dev = dev;
+
+	de = dc_drm->de[id];
+	de->fg = fg;
+
+	return 0;
+}
+
+static const struct component_ops dc_fg_ops = {
+	.bind = dc_fg_bind,
+};
+
+static int dc_fg_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_fg_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_fg_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_fg_ops);
+}
+
+static const struct of_device_id dc_fg_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-framegen", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_fg_dt_ids);
+
+struct platform_driver dc_fg_driver = {
+	.probe = dc_fg_probe,
+	.remove_new = dc_fg_remove,
+	.driver = {
+		.name = "imx8-dc-framegen",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_fg_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
new file mode 100644
index 000000000000..05b86f41ae9e
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "dc-drv.h"
+#include "dc-de.h"
+
+#define TCON_CTRL	0x410
+#define  CTRL_RST_VAL	0x01401408
+
+/* red: MAPBIT 29-20, green: MAPBIT 19-10, blue: MAPBIT 9-0 */
+#define MAPBIT3_0	0x418
+#define MAPBIT7_4	0x41c
+#define MAPBIT11_8	0x420
+#define MAPBIT15_12	0x424
+#define MAPBIT19_16	0x428
+#define MAPBIT23_20	0x42c
+#define MAPBIT27_24	0x430
+#define MAPBIT31_28	0x434
+
+static const struct regmap_range dc_tc_regmap_ranges[] = {
+	regmap_reg_range(TCON_CTRL, TCON_CTRL),
+	regmap_reg_range(MAPBIT3_0, MAPBIT31_28),
+};
+
+static const struct regmap_access_table dc_tc_regmap_access_table = {
+	.yes_ranges = dc_tc_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_tc_regmap_ranges),
+};
+
+static const struct regmap_config dc_tc_regmap_config = {
+	.name = "tcon",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_tc_regmap_access_table,
+	.rd_table = &dc_tc_regmap_access_table,
+};
+
+/*
+ * The pixels reach TCON are always in 30-bit BGR format.
+ * The first bridge always receives pixels in 30-bit RGB format.
+ * So, map the format to MEDIA_BUS_FMT_RGB101010_1X30.
+ */
+static const u32 dc_tc_mapbit[] = {
+	0x17161514, 0x1b1a1918, 0x0b0a1d1c, 0x0f0e0d0c,
+	0x13121110, 0x03020100, 0x07060504, 0x00000908,
+};
+
+void dc_tc_init(struct dc_tc *tc)
+{
+	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
+	regmap_write(tc->reg, TCON_CTRL, CTRL_RST_VAL);
+
+	/* set format */
+	regmap_bulk_write(tc->reg, MAPBIT3_0, dc_tc_mapbit,
+			  ARRAY_SIZE(dc_tc_mapbit));
+}
+
+static int dc_tc_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	void __iomem *base;
+	struct dc_tc *tc;
+	struct dc_de *de;
+	int id;
+
+	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
+	if (!tc)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	tc->reg = devm_regmap_init_mmio(dev, base, &dc_tc_regmap_config);
+	if (IS_ERR(tc->reg))
+		return PTR_ERR(tc->reg);
+
+	id = of_alias_get_id(dev->of_node, "dc0-tcon");
+	if (id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", id);
+		return id;
+	}
+
+	de = dc_drm->de[id];
+	de->tc = tc;
+	de->tc->dev = dev;
+
+	return 0;
+}
+
+static const struct component_ops dc_tc_ops = {
+	.bind = dc_tc_bind,
+};
+
+static int dc_tc_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_tc_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_tc_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_tc_ops);
+}
+
+static const struct of_device_id dc_tc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-tcon", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_tc_dt_ids);
+
+struct platform_driver dc_tc_driver = {
+	.probe = dc_tc_probe,
+	.remove_new = dc_tc_remove,
+	.driver = {
+		.name = "imx8-dc-tcon",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_tc_dt_ids,
+	},
+};
-- 
2.34.1

