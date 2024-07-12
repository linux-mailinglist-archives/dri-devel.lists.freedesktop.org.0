Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14592F7E3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FB110EC81;
	Fri, 12 Jul 2024 09:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="L+aZqnkM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54B310EC81
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:25:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zibys+W3WYxwZo04682ixnD8vAeaAUd8UQDhnC6p0NHWf95EGFvYUCxcAT7AIESOIiqhFlrEbvOIFA+4g3SY9B46AHXGaa8L/3Y1pWxYPzub+4dck70XsclZqpCpPJ9W95xJbItpqvn3w5Ky0BVlIOSaqtepXxCPvAlAWW7qFagFf8mgezOML43QY3N5KCAgg7uBIu/w8CtRyRpywJKGxrqmWjDhRADPquWQ7KgEQkdSW+ggzS4hJwZBlwC+Q90iq5mzKt3VlVLScAkxOB/H9rAGC3sGqZ8siYgf/5wltY/30B+dcH6jJOyRwRyic5Dlrvb7qxKAc4UTSi6sDaaEXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJ1IvKhIn9B2neFjBTIcUSi/+uO9Ep0X/jaJ930yBo0=;
 b=BLPQ38wXt4UrMeEHm39qEIglIe/YeavBFK1PVhq5Sc4+MEm/HV59ztAL95OuJNSqP3utjshMyvSskr2en3vlO71k4wuKn12XPuEw2iCMWjZA5u+zl4tFMjJJiK9hdkz9f90Tbl1fZgtK49xYvcfy77QmLybzB3IHaghgS+Yq/EUKtVgUCPFq4C0pl1traILgN0sq6Vl6hMxKB8BVF2PQ+7v9YR5rD/2PGtIfQW5mnQSieNZpn+WmVTLTiz/XefaK3q3iqZmnrv/lCnBl+U9mL9vERLrMDHy2IglAXkH0t/4bqN//a2r0OECy7+eqpaUFXTBaSyotbQ3oVYoLO8hwXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJ1IvKhIn9B2neFjBTIcUSi/+uO9Ep0X/jaJ930yBo0=;
 b=L+aZqnkM1TU2Z5JBIPzjkOn6t/iD9lQ7XWw2tq6PjLleXd7SEYugvG+h+T8rREv+Pm8cHXmaWfUi6zeVeIj4IkyvNo1PFXC1xzwkx10Zg3CFQdOeTRX958qQnED3/iVnNGg+KANp058yquth7I3TslxlINk1KTIEdbxm98JXVvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Fri, 12 Jul
 2024 09:25:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:25:27 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [PATCH v2 07/16] drm/imx: Add i.MX8qxp Display Controller pixel engine
Date: Fri, 12 Jul 2024 17:32:34 +0800
Message-Id: <20240712093243.2108456-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240712093243.2108456-1-victor.liu@nxp.com>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a29e900-5e8d-44b9-ec96-08dca25490b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O5FTTer9kr3FCu9hHNsYbbPlZ6mEvp2xNzWo/RL4HOUhOXE9PRcIDxaPoIEQ?=
 =?us-ascii?Q?neqPD+nU6MD3TEc5y4/L7mu788bMhz5n4sFJ2/CpizdSA4ec4qKuBe3oUXvv?=
 =?us-ascii?Q?NjDXeds95uOZngIVdAiMSK0fiVbdRtuE53zucPN1HGF3odwf3Pxr2J2HZyhK?=
 =?us-ascii?Q?/aPvMFEvaJrooiT3qtu9Rczz+5P8+z89kTegsxWWcNTspnGjlitnH/LsmrS8?=
 =?us-ascii?Q?LElYg1BLz7sI890ZhvaCeLdV25W0/YzLADtfsndIb3OGS2UgUBwbzj+qM7Kt?=
 =?us-ascii?Q?c81lmDOxl+tX80TMYdhWYF+LDYcq2VuLHulO2+lzcjoIpivw4Us+BGuDmLkO?=
 =?us-ascii?Q?KL2WFXOgZ30iMO4K9vmq9qvVChbS+eyymLQASjfJo1jVjPe1gtZV5kSxfg7Q?=
 =?us-ascii?Q?MrdkEauzmD1Gm+0/BLYFY1569Cq0oWyApCLWPsABQT605FdMkzsD7RVtBXG8?=
 =?us-ascii?Q?w3gudyX0dOOisXZZ+Zk/LVwNK8jCgCYpq+F8mFY4Rh+k53HVxMXOs06ANK9z?=
 =?us-ascii?Q?YGHamQS1VUVu8+xFw1/YRdL0fysT6AGgH2o7EH23obPkFFI8taFG+MuWgBEq?=
 =?us-ascii?Q?ex4FMZl8SLwsklFjzMvHCPhNfFiQfmiCK4cyLPmttNglzEhM6cs0kwbErOJk?=
 =?us-ascii?Q?eBdml3Kbppe6pjDMNg6A5tTkmNc17JbHJTEucL5ILq+Kjs5G2cfXZraivT/j?=
 =?us-ascii?Q?OI49GbwAB3YTYK5qduDwq8AJKnl2eGZbfFPMzJkfAh5w9ouvXPwaaEkcBRrH?=
 =?us-ascii?Q?Bc0w+WXDX7R2lspxVNCHZ+B8ukRQeyssQOt+gm+XtTAyGX/l6xfAOA6cakZT?=
 =?us-ascii?Q?90VTUuEAmBevwVlqpCsGP+BNZA1BdbG4vxpwZ4q5j+KEXhyeq72mZ1aSGBxG?=
 =?us-ascii?Q?2aY50DIuP+Yrej0TJKM0NF5DfWptPaIwVGbRlTGWLu7WZ6wpjcqBPH6Z+5P6?=
 =?us-ascii?Q?DiCkTBGN0krfkmyqGmpzklZ7GlDr9n3/qUVhSsVnA2XgOUmMrCklexdG599s?=
 =?us-ascii?Q?Rd/4rMF+U/8z+BzDl6ZgIodbXfa9b1T+uOM7097S/KVqTe3R5nS/w1IzzUih?=
 =?us-ascii?Q?aTxtaGrIbFXlI3fNGZOHOsFMs74bDllm10SJyJUW/hYu/ryG+8Pyz/tbbVqd?=
 =?us-ascii?Q?DSNshq4BuewNG+ZsO6czsKOJMs8VglPYqMQQkoFBFXU4ExQCiSm4FsBmBAuk?=
 =?us-ascii?Q?om1weKXAnjuaXSKfpDEnYx8eeUt6C3pJUKSe07RgCuRBcR/WfXXcI+gtmmLM?=
 =?us-ascii?Q?AeRAl54qQwv9M7FLCYqVGHYWMa0TDATJvSeJePiDUhZkE5/pCELylvf4IzgB?=
 =?us-ascii?Q?xkrTRd3VWW1yecNnP+F/E48mbpNdFLMvZDT8CGVobT0NFuiLqUNAF3U2mKoe?=
 =?us-ascii?Q?os5PAIq3P2gPVNnC/3tYsrY/LRslbMAwLK4MdDZFQupFqEinYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ocPwwXQESOMmgeHeop50DQyHn1HJEQfWz4A2AtSkYYEAljoilySX3qQkFeBh?=
 =?us-ascii?Q?qhXeyaCblUc6jtqdTonpdPCWXztK3hj02gvtcL1uYU+FlXJtp83HzippNRy5?=
 =?us-ascii?Q?eagEfTgtbtamVgPfmOgxCjPPVNAUVLU+LQBJgWxnnZ8iq9c+F9/Xs3fQFqaZ?=
 =?us-ascii?Q?vLtBT/a0MW2Ema/d0UJOC4cNDOhsiXX4bYqBNfuduO/sdCOhMyGfa9sLFsG+?=
 =?us-ascii?Q?jCG3NLR1bDuWJYIRIf/0iz1R3Xuyv1AZkbHJ3pbVhwm/ph9ltl8t4M1c6Zur?=
 =?us-ascii?Q?Xc39euiSDrrsuurFLHN7nysnPpjuN8yuosDvx6MrsQv7WzL8cBxX7Ober9Ja?=
 =?us-ascii?Q?FmS09iitR4kAWa9XFPnfgmfJ0SW+Dw3KWBiXoLrY94WEQHKaDRt4mkH0CA9D?=
 =?us-ascii?Q?OVUHHwh8bpl36kpp/5+q8cO0weUGvJkxP5uNEvUoHQvnxc3tVUmv8uaLSQh0?=
 =?us-ascii?Q?6ehBzoOYncPoLVdw1MW2IGN8L2sr0S/cubCmB6CIGDa2A0a+loCQuwnQGy0e?=
 =?us-ascii?Q?BjGniJ5pRjaH3pt4NnNMtFWfwsXsGR+qevG0Z1G1ZRMZTEk8RfTRnjhhOvPT?=
 =?us-ascii?Q?pCH6nHiex/OP7XA5fNwlxWvkVUoNmfQIZKDvuWxhAy4QvczytGHu8RePPRkL?=
 =?us-ascii?Q?zHOqaMdAMQ4j0wIhCsKceFPUIxoN41Oe8chUVSeoho1nhnU5rOckmBdiG9E8?=
 =?us-ascii?Q?9sU6PwBDmdL3BBVRWsVAT9Gcqn2jJcPJMo+GcAS7bzE8VfYueJ643y4ChVDT?=
 =?us-ascii?Q?HmEBn1Ltp5AhT+E/OtQECNsSpXX/uivbeuWKnQKX2eFEmBQXVwSWaxn510OJ?=
 =?us-ascii?Q?r2VFLBMk5e185EBtSje/2A3cHZOSc7twd/w6afsNDrcw6HwsPjshjZTAmd8V?=
 =?us-ascii?Q?+DXEKZpVCocS6hhHtqbE+liRcCkEtI98Iy0S5VP5ph9bL/Nk+CikIaQS0Pwk?=
 =?us-ascii?Q?uDENXPHXQQ/VLsiDGJidRtD8gAatAKCwep+axU1YPbJxq6BTtej2RduEtry9?=
 =?us-ascii?Q?xW6J0iICwgK51enWMI3cp0mZ7thM9zXfBpN6Ao1LaT+TXefzU8p73Bs4lG1O?=
 =?us-ascii?Q?sG4OZXJFjBeSK8zhoICN8wFIsCTjmrUbUgcD5xiVR6pVg8to+PCcAQMmgY8J?=
 =?us-ascii?Q?5DA5rw2adAdYhjgRAHpZdcCnjkLDClXTWfPEye0Dtb2AKAgbnY6v3pwayKQz?=
 =?us-ascii?Q?j3iDvmZZXbcVkk9+xDGOpqSwlwIHKIL5jywapNqvsu5GzhWlUNhJv/WwyW/v?=
 =?us-ascii?Q?glkINUpkiRy2Se5Qr4iU4NJM0G1DM/SFSVRih1dxC89TpHv2eCShSIRK+mkh?=
 =?us-ascii?Q?D5d2ShVczoPsmEo5aN+fSY5EScr+Gf1G1ZX7GEc//ZZl7BFqg+XbfWzuzn7q?=
 =?us-ascii?Q?ZysV7zBD5QpKjpbaFkxVyrSZe2efHjmtoLcoeUBPFMlRBjfU1OklC1fXDpl+?=
 =?us-ascii?Q?WxFXjkeMOV7GqZjCk6avny4Zvm+s6KbCsyoTG2b/7sA90YTHI0Me+iyMODwS?=
 =?us-ascii?Q?ePbApAbfZyGyck+DxPRQIJCFZP+QIlsqE1i6GGIZzGp6LMWzq5aBlhj2qfdF?=
 =?us-ascii?Q?fP5wMDEyAj2NJp+5UAT/SyTLFguDfzhyr0B6wA8D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a29e900-5e8d-44b9-ec96-08dca25490b2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:25:27.1277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grnY4rTkoFodYjxrAhPIYVw5RNzzenNaA2RS60Lr4EKWRXNav+BnhRSG3zplq2BmYIy+5p81mAFXiMO/UrLu0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9183
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
v2:
* Use OF alias id to get instance id.

 drivers/gpu/drm/imx/dc/Makefile |   3 +-
 drivers/gpu/drm/imx/dc/dc-cf.c  | 157 +++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-drv.c |   6 +
 drivers/gpu/drm/imx/dc/dc-drv.h |   8 +
 drivers/gpu/drm/imx/dc/dc-ed.c  | 266 ++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fl.c  | 136 +++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fu.c  | 241 +++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h  | 129 ++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fw.c  | 149 ++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-lb.c  | 300 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.c  | 140 +++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.h  |  91 ++++++++++
 12 files changed, 1625 insertions(+), 1 deletion(-)
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
index 000000000000..4fb2bbc67b4a
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-cf.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/container_of.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_managed.h>
+
+#include "dc-drv.h"
+#include "dc-pe.h"
+
+#define STATICCONTROL		0x8
+
+#define FRAMEDIMENSIONS		0xc
+#define  WIDTH(w)		(((w) - 1) & 0x3fff)
+#define  HEIGHT(h)		((((h) - 1) & 0x3fff) << 16)
+
+#define CONSTANTCOLOR		0x10
+#define  BLUE(b)		(((b) & 0xff) << 8)
+
+struct dc_cf_priv {
+	struct dc_cf cf;
+	void __iomem *reg_cfg;
+	enum dc_link_id link;
+};
+
+static inline struct dc_cf_priv *to_cf_priv(struct dc_cf *cf)
+{
+	return container_of(cf, struct dc_cf_priv, cf);
+}
+
+static inline void dc_cf_write(struct dc_cf *cf, unsigned int offset, u32 value)
+{
+	struct dc_cf_priv *priv = to_cf_priv(cf);
+
+	writel(value, priv->reg_cfg + offset);
+}
+
+static void dc_cf_enable_shden(struct dc_cf *cf)
+{
+	dc_cf_write(cf, STATICCONTROL, SHDEN);
+}
+
+enum dc_link_id dc_cf_get_link_id(struct dc_cf *cf)
+{
+	struct dc_cf_priv *priv = to_cf_priv(cf);
+
+	return priv->link;
+}
+
+void dc_cf_framedimensions(struct dc_cf *cf, unsigned int w,
+			   unsigned int h)
+{
+	dc_cf_write(cf, FRAMEDIMENSIONS, WIDTH(w) | HEIGHT(h));
+}
+
+void dc_cf_constantcolor_black(struct dc_cf *cf)
+{
+	dc_cf_write(cf, CONSTANTCOLOR, 0);
+}
+
+void dc_cf_constantcolor_blue(struct dc_cf *cf)
+{
+	dc_cf_write(cf, CONSTANTCOLOR, BLUE(0xff));
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
+	struct dc_cf_priv *priv;
+	int id;
+
+	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reg_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(priv->reg_cfg))
+		return PTR_ERR(priv->reg_cfg);
+
+	id = of_alias_get_id(dev->of_node, "dc0-constframe");
+	if (id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", id);
+		return id;
+	}
+
+	switch (id) {
+	case 0:
+		pe->cf_cont[0] = &priv->cf;
+		priv->link = LINK_ID_CONSTFRAME0;
+		break;
+	case 1:
+		pe->cf_cont[1] = &priv->cf;
+		priv->link = LINK_ID_CONSTFRAME1;
+		break;
+	case 4:
+		pe->cf_safe[0] = &priv->cf;
+		priv->link = LINK_ID_CONSTFRAME4;
+		break;
+	case 5:
+		pe->cf_safe[1] = &priv->cf;
+		priv->link = LINK_ID_CONSTFRAME5;
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
index 000000000000..5357ae33c505
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/container_of.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_managed.h>
+
+#include "dc-drv.h"
+#include "dc-pe.h"
+
+#define PIXENGCFG_STATIC	0x8
+#define  POWERDOWN		BIT(4)
+#define  SYNC_MODE		BIT(8)
+#define  SINGLE			0
+#define  DIV_MASK		0xff0000
+#define  DIV(n)			(((n) & 0xff) << 16)
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
+struct dc_ed_priv {
+	struct dc_ed ed;
+	void __iomem *reg_pec;
+	void __iomem *reg_cfg;
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
+static inline struct dc_ed_priv *to_ed_priv(struct dc_ed *ed)
+{
+	return container_of(ed, struct dc_ed_priv, ed);
+}
+
+static inline u32 dc_pec_ed_read(struct dc_ed *ed, unsigned int offset)
+{
+	struct dc_ed_priv *priv = to_ed_priv(ed);
+
+	return readl(priv->reg_pec + offset);
+}
+
+static inline void
+dc_pec_ed_write(struct dc_ed *ed, unsigned int offset, u32 value)
+{
+	struct dc_ed_priv *priv = to_ed_priv(ed);
+
+	writel(value, priv->reg_pec + offset);
+}
+
+static inline void
+dc_pec_ed_write_mask(struct dc_ed *ed, unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dc_pec_ed_read(ed, offset);
+	tmp &= ~mask;
+	dc_pec_ed_write(ed, offset, tmp | value);
+}
+
+static inline u32 dc_ed_read(struct dc_ed *ed, unsigned int offset)
+{
+	struct dc_ed_priv *priv = to_ed_priv(ed);
+
+	return readl(priv->reg_cfg + offset);
+}
+
+static inline void dc_ed_write(struct dc_ed *ed, unsigned int offset, u32 value)
+{
+	struct dc_ed_priv *priv = to_ed_priv(ed);
+
+	writel(value, priv->reg_cfg + offset);
+}
+
+static inline void
+dc_ed_write_mask(struct dc_ed *ed, unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dc_ed_read(ed, offset);
+	tmp &= ~mask;
+	dc_ed_write(ed, offset, tmp | value);
+}
+
+static void dc_ed_pec_enable_shden(struct dc_ed *ed)
+{
+	dc_pec_ed_write_mask(ed, PIXENGCFG_STATIC, SHDEN, SHDEN);
+}
+
+static void dc_ed_pec_poweron(struct dc_ed *ed)
+{
+	dc_pec_ed_write_mask(ed, PIXENGCFG_STATIC, POWERDOWN, 0);
+}
+
+static void dc_ed_pec_sync_mode_single(struct dc_ed *ed)
+{
+	dc_pec_ed_write_mask(ed, PIXENGCFG_STATIC, SYNC_MODE, SINGLE);
+}
+
+static void dc_ed_pec_div_reset(struct dc_ed *ed)
+{
+	dc_pec_ed_write_mask(ed, PIXENGCFG_STATIC, DIV_MASK, DIV(DIV_RESET));
+}
+
+void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(src_sels); i++) {
+		if (src_sels[i] == src) {
+			dc_pec_ed_write(ed, PIXENGCFG_DYNAMIC, src);
+			return;
+		}
+	}
+}
+
+void dc_ed_pec_sync_trigger(struct dc_ed *ed)
+{
+	dc_pec_ed_write(ed, PIXENGCFG_TRIGGER, SYNC_TRIGGER);
+}
+
+static void dc_ed_enable_shden(struct dc_ed *ed)
+{
+	dc_ed_write_mask(ed, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static void dc_ed_kick_mode_external(struct dc_ed *ed)
+{
+	dc_ed_write_mask(ed, STATICCONTROL, KICK_MODE, EXTERNAL);
+}
+
+static void dc_ed_disable_perfcountmode(struct dc_ed *ed)
+{
+	dc_ed_write_mask(ed, STATICCONTROL, PERFCOUNTMODE, 0);
+}
+
+static void dc_ed_disable_gamma_apply(struct dc_ed *ed)
+{
+	dc_ed_write_mask(ed, CONTROL, GAMMAAPPLYENABLE, 0);
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
+	struct dc_ed_priv *priv;
+	int id;
+
+	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reg_pec = devm_platform_ioremap_resource_byname(pdev, "pec");
+	if (IS_ERR(priv->reg_pec))
+		return PTR_ERR(priv->reg_pec);
+
+	priv->reg_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(priv->reg_cfg))
+		return PTR_ERR(priv->reg_cfg);
+
+	priv->ed.irq_shdld = platform_get_irq_byname(pdev, "shdload");
+	if (priv->ed.irq_shdld < 0)
+		return priv->ed.irq_shdld;
+
+	id = of_alias_get_id(dev->of_node, "dc0-extdst");
+	if (id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", id);
+		return id;
+	}
+
+	priv->ed.dev = dev;
+
+	switch (id) {
+	case 0:
+		pe->ed_cont[0] = &priv->ed;
+		break;
+	case 1:
+		pe->ed_cont[1] = &priv->ed;
+		break;
+	case 4:
+		pe->ed_safe[0] = &priv->ed;
+		break;
+	case 5:
+		pe->ed_safe[1] = &priv->ed;
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
+		.of_match_table = dc_ed_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
new file mode 100644
index 000000000000..7a535be32cbd
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -0,0 +1,136 @@
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
+
+#include <drm/drm_managed.h>
+#include <drm/drm_fourcc.h>
+
+#include "dc-drv.h"
+#include "dc-fu.h"
+#include "dc-pe.h"
+
+#define FRAMEDIMENSIONS		0x150
+
+struct dc_fl {
+	struct dc_fu fu;
+	int id;
+};
+
+static void
+dc_fl_set_fmt(struct dc_fu *fu, const struct drm_format_info *format)
+{
+	u32 bits = 0, shifts = 0;
+
+	dc_fu_set_src_bpp(fu, format->cpp[0] * 8);
+
+	dc_fu_write_mask(fu, LAYERPROPERTY(fu), YUVCONVERSIONMODE_MASK,
+			 YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF));
+
+	dc_fu_get_pixel_format_bits(fu, format->format, &bits);
+	dc_fu_get_pixel_format_shifts(fu, format->format, &shifts);
+
+	dc_fu_write(fu, COLORCOMPONENTBITS(fu), bits);
+	dc_fu_write(fu, COLORCOMPONENTSHIFT(fu), shifts);
+}
+
+static void dc_fl_set_framedimensions(struct dc_fu *fu, int w, int h)
+{
+	dc_fu_write(fu, FRAMEDIMENSIONS, FRAMEWIDTH(w) | FRAMEHEIGHT(h));
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
+	struct dc_fl *fl;
+	struct dc_fu *fu;
+
+	fl = drmm_kzalloc(&dc_drm->base, sizeof(*fl), GFP_KERNEL);
+	if (!fl)
+		return -ENOMEM;
+
+	fu = &fl->fu;
+
+	fu->reg_pec = devm_platform_ioremap_resource_byname(pdev, "pec");
+	if (IS_ERR(fu->reg_pec))
+		return PTR_ERR(fu->reg_pec);
+
+	fu->reg_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
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
+	fu->sub_id = 0;
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
+		.of_match_table = dc_fl_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
new file mode 100644
index 000000000000..88793b2366fe
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitops.h>
+#include <linux/math.h>
+
+#include "dc-fu.h"
+#include "dc-pe.h"
+
+#define STATICCONTROL			0x8
+#define  SHDLDREQSTICKY(lm)		(((lm) & 0xff) << 24)
+#define  SHDLDREQSTICKY_MASK		(0xff << 24)
+#define  BASEADDRESSAUTOUPDATE(lm)	(((lm) & 0xff) << 16)
+#define  BASEADDRESSAUTOUPDATE_MASK	(0xff << 16)
+
+#define BURSTBUFFERMANAGEMENT		0xc
+#define  SETBURSTLENGTH(n)		(((n) & 0x1f) << 8)
+#define  SETBURSTLENGTH_MASK		0x1f00
+#define  SETNUMBUFFERS(n)		((n) & 0xff)
+#define  SETNUMBUFFERS_MASK		0xff
+#define  LINEMODE_MASK			0x80000000
+#define  LINEMODE_SHIFT			31
+
+#define BASEADDRESS(fu)			(0x10 + SUBID_OFFSET + REG_OFFSET)
+
+#define SOURCEBUFFERATTRIBUTES(fu)	(0x14 + SUBID_OFFSET + REG_OFFSET)
+#define  BITSPERPIXEL_MASK		0x3f0000
+#define  BITSPERPIXEL(bpp)		(((bpp) & 0x3f) << 16)
+#define  STRIDE_MASK			0xffff
+#define  STRIDE(n)			(((n) - 1) & 0xffff)
+
+#define LAYEROFFSET(fu)			(0x24 + SUBID_OFFSET + REG_OFFSET)
+#define  LAYERXOFFSET(x)		((x) & 0x7fff)
+#define  LAYERYOFFSET(y)		(((y) & 0x7fff) << 16)
+
+#define CLIPWINDOWOFFSET(fu)		(0x28 + SUBID_OFFSET + REG_OFFSET)
+#define  CLIPWINDOWXOFFSET(x)		((x) & 0x7fff)
+#define  CLIPWINDOWYOFFSET(y)		(((y) & 0x7fff) << 16)
+
+#define CLIPWINDOWDIMENSIONS(fu)	(0x2c + SUBID_OFFSET + REG_OFFSET)
+#define  CLIPWINDOWWIDTH(w)		(((w) - 1) & 0x3fff)
+#define  CLIPWINDOWHEIGHT(h)		((((h) - 1) & 0x3fff) << 16)
+
+#define CONSTANTCOLOR(fu)		(0x30 + SUBID_OFFSET + REG_OFFSET)
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
+static void dc_fu_enable_shden(struct dc_fu *fu)
+{
+	dc_fu_write_mask(fu, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static void dc_fu_baddr_autoupdate(struct dc_fu *fu, u8 layer_mask)
+{
+	dc_fu_write_mask(fu, STATICCONTROL, BASEADDRESSAUTOUPDATE_MASK,
+			 BASEADDRESSAUTOUPDATE(layer_mask));
+}
+
+void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask)
+{
+	dc_fu_write_mask(fu, STATICCONTROL, SHDLDREQSTICKY_MASK,
+			 SHDLDREQSTICKY(layer_mask));
+}
+
+static void dc_fu_set_linemode(struct dc_fu *fu, enum dc_linemode mode)
+{
+	dc_fu_write_mask(fu, BURSTBUFFERMANAGEMENT, LINEMODE_MASK, mode);
+}
+
+static void dc_fu_set_numbuffers(struct dc_fu *fu, unsigned int num)
+{
+	dc_fu_write_mask(fu, BURSTBUFFERMANAGEMENT, SETNUMBUFFERS_MASK,
+			 SETNUMBUFFERS(num));
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
+	dc_fu_write_mask(fu, BURSTBUFFERMANAGEMENT, SETBURSTLENGTH_MASK,
+			 SETBURSTLENGTH(burst_length));
+}
+
+static void dc_fu_set_baseaddress(struct dc_fu *fu, dma_addr_t baddr)
+{
+	dc_fu_write(fu, BASEADDRESS(fu), baddr);
+}
+
+void dc_fu_set_src_bpp(struct dc_fu *fu, unsigned int bpp)
+{
+	dc_fu_write_mask(fu, SOURCEBUFFERATTRIBUTES(fu), BITSPERPIXEL_MASK,
+			 BITSPERPIXEL(bpp));
+}
+
+static void dc_fu_set_src_stride(struct dc_fu *fu, unsigned int stride)
+{
+	dc_fu_write_mask(fu, SOURCEBUFFERATTRIBUTES(fu), STRIDE_MASK,
+			 STRIDE(stride));
+}
+
+static void dc_fu_set_src_buf_dimensions(struct dc_fu *fu, int w, int h)
+{
+	dc_fu_write(fu, SOURCEBUFFERDIMENSION(fu), LINEWIDTH(w) | LINECOUNT(h));
+}
+
+static void dc_fu_layeroffset(struct dc_fu *fu, unsigned int x, unsigned int y)
+{
+	dc_fu_write(fu, LAYEROFFSET(fu), LAYERXOFFSET(x) | LAYERYOFFSET(y));
+}
+
+static void dc_fu_clipoffset(struct dc_fu *fu, unsigned int x, unsigned int y)
+{
+	dc_fu_write(fu, CLIPWINDOWOFFSET(fu),
+		    CLIPWINDOWXOFFSET(x) | CLIPWINDOWYOFFSET(y));
+}
+
+static void
+dc_fu_clipdimensions(struct dc_fu *fu, unsigned int w, unsigned int h)
+{
+	dc_fu_write(fu, CLIPWINDOWDIMENSIONS(fu),
+		    CLIPWINDOWWIDTH(w) | CLIPWINDOWHEIGHT(h));
+}
+
+static void dc_fu_set_pixel_blend_mode(struct dc_fu *fu)
+{
+	dc_fu_write(fu, LAYERPROPERTY(fu), 0);
+	dc_fu_write(fu, CONSTANTCOLOR(fu), 0);
+}
+
+static void dc_fu_enable_src_buf(struct dc_fu *fu)
+{
+	dc_fu_write_mask(fu, LAYERPROPERTY(fu), SOURCEBUFFERENABLE,
+			 SOURCEBUFFERENABLE);
+}
+
+static void dc_fu_disable_src_buf(struct dc_fu *fu)
+{
+	dc_fu_write_mask(fu, LAYERPROPERTY(fu), SOURCEBUFFERENABLE, 0);
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
+	dc_fu_baddr_autoupdate(fu, 0x0);
+	dc_fu_enable_shden(fu);
+	dc_fu_set_linemode(fu, LINEMODE_DISPLAY);
+	dc_fu_layeroffset(fu, 0x0, 0x0);
+	dc_fu_clipoffset(fu, 0x0, 0x0);
+	dc_fu_clipdimensions(fu, 0x0, 0x0);
+	dc_fu_set_numbuffers(fu, 16);
+	dc_fu_disable_src_buf(fu);
+	dc_fu_set_pixel_blend_mode(fu);
+}
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
new file mode 100644
index 000000000000..c7c84db85d87
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
+#include <linux/io.h>
+#include <linux/types.h>
+
+#include <drm/drm_fourcc.h>
+
+#include "dc-pe.h"
+
+#define REG_OFFSET			((fu)->reg_offset)
+#define SUBID_OFFSET			(((fu)->sub_id) * 0x28)
+
+#define SOURCEBUFFERDIMENSION(fu)	(0x18 + SUBID_OFFSET + REG_OFFSET)
+#define  LINEWIDTH(w)			(((w) - 1) & 0x3fff)
+#define  LINECOUNT(h)			((((h) - 1) & 0x3fff) << 16)
+
+#define COLORCOMPONENTBITS(fu)		(0x1c + SUBID_OFFSET + REG_OFFSET)
+#define  R_BITS(n)			(((n) & 0xf) << 24)
+#define  G_BITS(n)			(((n) & 0xf) << 16)
+#define  B_BITS(n)			(((n) & 0xf) << 8)
+#define  A_BITS(n)			((n) & 0xf)
+
+#define COLORCOMPONENTSHIFT(fu)		(0x20 + SUBID_OFFSET + REG_OFFSET)
+#define  R_SHIFT(n)			(((n) & 0x1f) << 24)
+#define  G_SHIFT(n)			(((n) & 0x1f) << 16)
+#define  B_SHIFT(n)			(((n) & 0x1f) << 8)
+#define  A_SHIFT(n)			((n) & 0x1f)
+
+#define LAYERPROPERTY(fu)		(0x34 + SUBID_OFFSET + REG_OFFSET)
+#define  YUVCONVERSIONMODE_MASK		0x60000
+#define  YUVCONVERSIONMODE(m)		(((m) & 0x3) << 17)
+#define  SOURCEBUFFERENABLE		BIT(31)
+#define  FRAMEWIDTH(w)			(((w) - 1) & 0x3fff)
+#define  FRAMEHEIGHT(h)			((((h) - 1) & 0x3fff) << 16)
+#define  INPUTSELECT_MASK		0x18
+#define  INPUTSELECT(s)			(((s) & 0x3) << 3)
+#define  RASTERMODE_MASK		0x7
+#define  RASTERMODE(m)			((m) & 0x7)
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
+struct dc_fu;
+struct dc_lb;
+
+struct dc_fu_ops {
+	void (*init)(struct dc_fu *fu);
+	void (*set_burstlength)(struct dc_fu *fu, dma_addr_t baddr);
+	void (*set_baseaddress)(struct dc_fu *fu, dma_addr_t baddr);
+	void (*set_src_stride)(struct dc_fu *fu, unsigned int stride);
+	void (*set_src_buf_dimensions)(struct dc_fu *fu, int w, int h);
+	void (*set_fmt)(struct dc_fu *fu, const struct drm_format_info *format);
+	void (*enable_src_buf)(struct dc_fu *fu);
+	void (*disable_src_buf)(struct dc_fu *fu);
+	void (*set_framedimensions)(struct dc_fu *fu, int w, int h);
+	void (*set_layerblend)(struct dc_fu *fu, struct dc_lb *lb);
+	enum dc_link_id (*get_link_id)(struct dc_fu *fu);
+	const char *(*get_name)(struct dc_fu *fu);
+};
+
+struct dc_fu {
+	void __iomem *reg_pec;
+	void __iomem *reg_cfg;
+	char name[13];
+	unsigned int reg_offset;
+	unsigned int id;
+	unsigned int sub_id;	/* for fractional fetch units */
+	enum dc_link_id link_id;
+	struct dc_fu_ops ops;
+	struct dc_lb *lb;
+};
+
+extern const struct dc_fu_ops dc_fu_common_ops;
+
+static inline void
+dc_pec_fu_write(struct dc_fu *fu, unsigned int offset, u32 value)
+{
+	writel(value, fu->reg_pec + offset);
+}
+
+static inline u32 dc_fu_read(struct dc_fu *fu, unsigned int offset)
+{
+	return readl(fu->reg_cfg + offset);
+}
+
+static inline void dc_fu_write(struct dc_fu *fu, unsigned int offset, u32 value)
+{
+	writel(value, fu->reg_cfg + offset);
+}
+
+static inline void
+dc_fu_write_mask(struct dc_fu *fu, unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dc_fu_read(fu, offset);
+	tmp &= ~mask;
+	dc_fu_write(fu, offset, tmp | value);
+}
+
+void dc_fu_get_pixel_format_bits(struct dc_fu *fu, u32 format, u32 *bits);
+void dc_fu_get_pixel_format_shifts(struct dc_fu *fu, u32 format, u32 *shifts);
+void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask);
+void dc_fu_set_src_bpp(struct dc_fu *fu, unsigned int bpp);
+void dc_fu_common_hw_init(struct dc_fu *fu);
+
+const struct dc_fu_ops *dc_fu_get_ops(struct dc_fu *fu);
+
+#endif /* __DC_FETCHUNIT_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
new file mode 100644
index 000000000000..5f0b6ef11b17
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -0,0 +1,149 @@
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
+
+#include <drm/drm_managed.h>
+#include <drm/drm_fourcc.h>
+
+#include "dc-drv.h"
+#include "dc-fu.h"
+#include "dc-pe.h"
+
+#define PIXENGCFG_DYNAMIC	0x8
+
+#define FRAMEDIMENSIONS		0x150
+#define CONTROL			0x170
+
+struct dc_fw {
+	struct dc_fu fu;
+	int id;
+};
+
+static void
+dc_fw_set_fmt(struct dc_fu *fu, const struct drm_format_info *format)
+{
+	u32 val, bits = 0, shifts = 0;
+
+	dc_fu_set_src_bpp(fu, format->cpp[0] * 8);
+
+	val = dc_fu_read(fu, CONTROL);
+	val &= ~INPUTSELECT_MASK;
+	val &= ~RASTERMODE_MASK;
+	val |= INPUTSELECT(INPUTSELECT_INACTIVE);
+	val |= RASTERMODE(RASTERMODE_NORMAL);
+	dc_fu_write(fu, CONTROL, val);
+
+	val = dc_fu_read(fu, LAYERPROPERTY(fu));
+	val &= ~YUVCONVERSIONMODE_MASK;
+	val |= YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF);
+	dc_fu_write(fu, LAYERPROPERTY(fu), val);
+
+	dc_fu_get_pixel_format_bits(fu, format->format, &bits);
+	dc_fu_get_pixel_format_shifts(fu, format->format, &shifts);
+
+	dc_fu_write(fu, COLORCOMPONENTBITS(fu), bits);
+	dc_fu_write(fu, COLORCOMPONENTSHIFT(fu), shifts);
+}
+
+static void dc_fw_set_framedimensions(struct dc_fu *fu, int w, int h)
+{
+	dc_fu_write(fu, FRAMEDIMENSIONS, FRAMEWIDTH(w) | FRAMEHEIGHT(h));
+}
+
+static void dc_fw_init(struct dc_fu *fu)
+{
+	dc_pec_fu_write(fu, PIXENGCFG_DYNAMIC, LINK_ID_NONE);
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
+	struct dc_fw *fw;
+	struct dc_fu *fu;
+
+	fw = drmm_kzalloc(&dc_drm->base, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return -ENOMEM;
+
+	fu = &fw->fu;
+
+	fu->reg_pec = devm_platform_ioremap_resource_byname(pdev, "pec");
+	if (IS_ERR(fu->reg_pec))
+		return PTR_ERR(fu->reg_pec);
+
+	fu->reg_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
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
+	fu->sub_id = 0;
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
+		.of_match_table = dc_fw_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
new file mode 100644
index 000000000000..9deda4c18a0a
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/container_of.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_blend.h>
+#include <drm/drm_managed.h>
+
+#include "dc-drv.h"
+#include "dc-pe.h"
+
+#define PIXENGCFG_DYNAMIC			0x8
+#define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	0x3f
+#define  PIXENGCFG_DYNAMIC_SEC_SEL_SHIFT	8
+#define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		0x3f00
+
+#define STATICCONTROL				0x8
+#define  SHDTOKSEL_MASK				0x18
+#define  SHDTOKSEL(n)				((n) << 3)
+#define  SHDLDSEL_MASK				0x6
+#define  SHDLDSEL(n)				((n) << 1)
+
+#define CONTROL					0xc
+#define  CTRL_MODE_MASK				BIT(0)
+
+#define BLENDCONTROL				0x10
+#define  ALPHA(a)				(((a) & 0xff) << 16)
+#define  PRIM_C_BLD_FUNC__ZERO			0x0
+#define  SEC_C_BLD_FUNC__CONST_ALPHA		(0x6 << 4)
+#define  PRIM_A_BLD_FUNC__ZERO			(0x0 << 8)
+#define  SEC_A_BLD_FUNC__ZERO			(0x0 << 12)
+
+#define POSITION				0x14
+#define  XPOS(x)				((x) & 0x7fff)
+#define  YPOS(y)				(((y) & 0x7fff) << 16)
+
+struct dc_lb_priv {
+	struct dc_lb lb;
+	void __iomem *reg_pec;
+	void __iomem *reg_cfg;
+	enum dc_link_id link;
+};
+
+enum dc_lb_shadow_sel {
+	BOTH = 0x2,
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
+static inline struct dc_lb_priv *to_lb_priv(struct dc_lb *lb)
+{
+	return container_of(lb, struct dc_lb_priv, lb);
+}
+
+static inline u32 dc_pec_lb_read(struct dc_lb *lb, unsigned int offset)
+{
+	struct dc_lb_priv *priv = to_lb_priv(lb);
+
+	return readl(priv->reg_pec + offset);
+}
+
+static inline void
+dc_pec_lb_write(struct dc_lb *lb, unsigned int offset, u32 value)
+{
+	struct dc_lb_priv *priv = to_lb_priv(lb);
+
+	writel(value, priv->reg_pec + offset);
+}
+
+static inline void
+dc_pec_lb_write_mask(struct dc_lb *lb, unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dc_pec_lb_read(lb, offset);
+	tmp &= ~mask;
+	dc_pec_lb_write(lb, offset, tmp | value);
+}
+
+static inline u32 dc_lb_read(struct dc_lb *lb, unsigned int offset)
+{
+	struct dc_lb_priv *priv = to_lb_priv(lb);
+
+	return readl(priv->reg_cfg + offset);
+}
+
+static inline void dc_lb_write(struct dc_lb *lb, unsigned int offset, u32 value)
+{
+	struct dc_lb_priv *priv = to_lb_priv(lb);
+
+	writel(value, priv->reg_cfg + offset);
+}
+
+static inline void
+dc_lb_write_mask(struct dc_lb *lb, unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dc_lb_read(lb, offset);
+	tmp &= ~mask;
+	dc_lb_write(lb, offset, tmp | value);
+}
+
+enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
+{
+	struct dc_lb_priv *priv = to_lb_priv(lb);
+
+	return priv->link;
+}
+
+void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim)
+{
+	struct dc_lb_priv *priv = to_lb_priv(lb);
+	int fixed_sels_num = ARRAY_SIZE(prim_sels) - 4;
+	int i;
+
+	for (i = 0; i < fixed_sels_num + priv->lb.id; i++) {
+		if (prim_sels[i] == prim) {
+			dc_pec_lb_write_mask(lb, PIXENGCFG_DYNAMIC,
+					     PIXENGCFG_DYNAMIC_PRIM_SEL_MASK,
+					     prim);
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
+			dc_pec_lb_write_mask(lb, PIXENGCFG_DYNAMIC,
+					     PIXENGCFG_DYNAMIC_SEC_SEL_MASK,
+					     sec << PIXENGCFG_DYNAMIC_SEC_SEL_SHIFT);
+			return;
+		}
+	}
+}
+
+void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken)
+{
+	dc_pec_lb_write_mask(lb, PIXENGCFG_DYNAMIC, CLKEN_MASK, CLKEN(clken));
+}
+
+static void dc_lb_enable_shden(struct dc_lb *lb)
+{
+	dc_lb_write_mask(lb, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static void dc_lb_shdtoksel(struct dc_lb *lb, enum dc_lb_shadow_sel sel)
+{
+	dc_lb_write_mask(lb, STATICCONTROL, SHDTOKSEL_MASK, SHDTOKSEL(sel));
+}
+
+static void dc_lb_shdldsel(struct dc_lb *lb, enum dc_lb_shadow_sel sel)
+{
+	dc_lb_write_mask(lb, STATICCONTROL, SHDLDSEL_MASK, SHDLDSEL(sel));
+}
+
+void dc_lb_mode(struct dc_lb *lb, enum dc_lb_mode mode)
+{
+	dc_lb_write_mask(lb, CONTROL, CTRL_MODE_MASK, mode);
+}
+
+void dc_lb_blendcontrol(struct dc_lb *lb)
+{
+	u32 val = PRIM_A_BLD_FUNC__ZERO | SEC_A_BLD_FUNC__ZERO |
+		  PRIM_C_BLD_FUNC__ZERO | SEC_C_BLD_FUNC__CONST_ALPHA |
+		  ALPHA(DRM_BLEND_ALPHA_OPAQUE >> 8);
+
+	dc_lb_write(lb, BLENDCONTROL, val);
+}
+
+void dc_lb_position(struct dc_lb *lb, int x, int y)
+{
+	dc_lb_write(lb, POSITION, XPOS(x) | YPOS(y));
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
+	dc_lb_enable_shden(lb);
+}
+
+static int dc_lb_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct dc_pe *pe = dc_drm->pe;
+	struct dc_lb_priv *priv;
+
+	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reg_pec = devm_platform_ioremap_resource_byname(pdev, "pec");
+	if (IS_ERR(priv->reg_pec))
+		return PTR_ERR(priv->reg_pec);
+
+	priv->reg_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(priv->reg_cfg))
+		return PTR_ERR(priv->reg_cfg);
+
+	priv->lb.id = of_alias_get_id(dev->of_node, "dc0-layerblend");
+	if (priv->lb.id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", priv->lb.id);
+		return priv->lb.id;
+	}
+
+	priv->link = lb_links[priv->lb.id];
+
+	pe->lb[priv->lb.id] = &priv->lb;
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
+		.of_match_table = dc_lb_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.c b/drivers/gpu/drm/imx/dc/dc-pe.c
new file mode 100644
index 000000000000..a20a5adab231
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-pe.c
@@ -0,0 +1,140 @@
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
+#include <drm/drm_managed.h>
+
+#include "dc-drv.h"
+#include "dc-fu.h"
+#include "dc-pe.h"
+
+struct dc_pe_priv {
+	struct dc_pe engine;
+	struct clk *clk_axi;
+};
+
+static int dc_pe_bind(struct device *dev, struct device *master, void *data)
+{
+	struct dc_drm_device *dc_drm = data;
+	struct dc_pe_priv *priv;
+	int ret;
+
+	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk_axi = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk_axi))
+		return dev_err_probe(dev, PTR_ERR(priv->clk_axi),
+				     "failed to get AXI clock\n");
+
+	priv->engine.dev = dev;
+
+	dev_set_drvdata(dev, priv);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	dc_drm->pe = &priv->engine;
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
+	struct dc_pe_priv *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->clk_axi);
+
+	return 0;
+}
+
+static int dc_pe_runtime_resume(struct device *dev)
+{
+	struct dc_pe_priv *priv = dev_get_drvdata(dev);
+	struct dc_pe *engine = &priv->engine;
+	int i, ret;
+
+	ret = clk_prepare_enable(priv->clk_axi);
+	if (ret) {
+		dev_err(dev, "failed to enable AXI clock: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(engine->cf_safe); i++)
+		dc_cf_init(engine->cf_safe[i]);
+
+	for (i = 0; i < ARRAY_SIZE(engine->cf_cont); i++)
+		dc_cf_init(engine->cf_cont[i]);
+
+	for (i = 0; i < ARRAY_SIZE(engine->ed_safe); i++)
+		dc_ed_init(engine->ed_safe[i]);
+
+	for (i = 0; i < ARRAY_SIZE(engine->ed_cont); i++)
+		dc_ed_init(engine->ed_cont[i]);
+
+	for (i = 0; i < ARRAY_SIZE(engine->fu_disp); i++)
+		engine->fu_disp[i]->ops.init(engine->fu_disp[i]);
+
+	for (i = 0; i < ARRAY_SIZE(engine->lb); i++)
+		dc_lb_init(engine->lb[i]);
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
+		.of_match_table = dc_pe_dt_ids,
+		.pm = pm_sleep_ptr(&dc_pe_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
new file mode 100644
index 000000000000..82fee7fe112d
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_PIXEL_ENGINE_H__
+#define __DC_PIXEL_ENGINE_H__
+
+#include <linux/device.h>
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
+};
+
+struct dc_ed {
+	struct device *dev;
+	int irq_shdld;
+};
+
+struct dc_lb {
+	int id;
+};
+
+struct dc_pe {
+	struct device *dev;
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
+void dc_lb_blendcontrol(struct dc_lb *lb);
+void dc_lb_position(struct dc_lb *lb, int x, int y);
+unsigned int dc_lb_get_id(struct dc_lb *lb);
+void dc_lb_init(struct dc_lb *lb);
+
+#endif /* __DC_PIXEL_ENGINE_H__ */
-- 
2.34.1

