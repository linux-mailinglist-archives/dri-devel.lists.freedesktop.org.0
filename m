Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB9C9DF92A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A7610E414;
	Mon,  2 Dec 2024 02:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ez5//N91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2047.outbound.protection.outlook.com [40.107.247.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7364010E2F8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:57:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7JjsvQl436zEUzButQK7x7kGv4/efQMEZ3Wb8a3dcXlC1ovel4MmT3FuSxpwuyCSezOyPJjC9caMF6FiXxhVs+Hukj6J34R7cyV5ZxWZHeHMXed81dOM4s1ORcFMA9+PjtRz8haV4ec7NCN9N0g6dCcPhN1h7XxpJkG6vRokF/hSnpPuojXlp3eKs8Y8thZTICY/eZE9m7GcBVHt1yTU7QO5T54iqJPqFKrSrRAcW4rX75F503XcFYVkM6LjoP6G9P20RNMwfIOi91/sTMzNJGMqY3j1mihDHXmyrzdvZmSLQWoGJTieQNpMSNSADZgcqAFN6fF1R7JKFFEywxHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUz/LVDUmuQszdqjF/odtsujg/l/8t8DxDbZdsR4qiI=;
 b=aFsFlx8Pfv7WDulzB8VKnAuYjww53X7+nyQnNtFiHq3QjW9prHNgCugz2HAUQKwE6JAlcRHDMqP5NcTVt/VmncCLTuNnaBhH9sNukX3cOYbwv9IC62e/yFxU4zB7X8/aoZlin8/QR4oNjY82wmyJFEFCXyhHw43Lr3tReIkgw706EeCdZ2Va2JY4AxV+KhffJhwcKQMJgv9QrzAQoTTOWtXQwdrSsPuolkMWKWfGyM2ayrPK0lKeuMeIoGVMmvj7FfySblTRZTTIwIXjmL1LVa88fG3q4umOBxKYyCAESZCycyqJGnI8zuuRagoSc6v+pu2o+jxkZygMrpzo9P2spQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUz/LVDUmuQszdqjF/odtsujg/l/8t8DxDbZdsR4qiI=;
 b=Ez5//N91AfMgKQ866x9NsSO4rFuVmCxBkiIniGe1f2PhWQ0Q1sOWpjepdZDDkdqImMXSfcZFyXlls+QoFW5xuLwBfBefqjNp85rAxnjUmMwpnp0Fve5sY5gq5DrFAeHzFtmBD3jwFGX9SemRO6NUekx6CzezSM1uRQD0Fd1uBdKjlnQWCCMEb3XJAbvujKk2CckO/KoAJrlXkyrmew3mQ12WbJK8Sh1LoxhT38pkN3+5pQ3TH/Zb04QRgUAPSS4RjvFi5uCxNCTH5BBSGSut9JwUlBXF1ru4hoDP6q1nXgl5W7ON55amNcxEZNhZ8pa6KPB8UjWSlLLNNuJkq50/+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 02:57:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:57:28 +0000
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
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [PATCH v5 08/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller
Date: Mon,  2 Dec 2024 10:56:24 +0800
Message-Id: <20241202025635.1274467-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: 557e0b99-bd3f-4d30-b9a5-08dd127d0e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qy6f2oPvayEG206hPo29Gzv8+27EkHFuk7qZl2ca8UQYp9xkY/S+qeqAM3rL?=
 =?us-ascii?Q?UTLPSegt1iPDSwYZayWJPhA/ux5tIi3aOtC1ox2EfTkA4xAqA9xLsTACr+4S?=
 =?us-ascii?Q?pibLnDqSeDOSSG7whPfPwYsCvdfG/ZiS6kkIA64vc00Gt23FIoLsXc2bGr26?=
 =?us-ascii?Q?R77JCLCsrYDDcjVFTImZBL613a4gB00zAd9CyX1bTNstqq6N37HAfQshy5pb?=
 =?us-ascii?Q?5D/tHSzV1b9XalNrHqpx/+DFn7TwsCaKKyhQ4jzDdu3wfMzKaXSEbyGvLU2r?=
 =?us-ascii?Q?y1Zq1pDzbz3o/yakNPn8heicD/3MwwPcWk0+yWKJhmmxFsS8oli6MtHVmin0?=
 =?us-ascii?Q?pxEyLwoh+2AsoepmiUoChzyKtrGzQOdoDEskBaPp0uuBUhfufy+NbKbmXiat?=
 =?us-ascii?Q?3JS0kEt66F4xiIiezqY/5FvJNsRwiEHSgJo3kaInTfrrBtLWvvmn6WkReJrW?=
 =?us-ascii?Q?si9T9/ASom7o7K7d8MX+gL2vJSZpKQJaI5PgC8VooI9/trL/enJ6S8tLf3At?=
 =?us-ascii?Q?RThuRfTgowjgvSr+sICB2rheIkFTNviUab5tv0cJ8DSKujcYL98gzO32ehpm?=
 =?us-ascii?Q?t/3Li1M+y7UwnCKUxi2OjK+awQmfMPSjkd9ZkvZaigwmg6ozwzVbSAStxTbE?=
 =?us-ascii?Q?VTbgI/iLf24d87eBssHQcCCQ0Imonkf7lbPGUIVDDeO+SZiSLQo+bN3v7koC?=
 =?us-ascii?Q?ChOuK9umXrn7iRHAh9EAK/YbUaeTql9iBfqMNxKlWv5L14hEOtsBIOi22D6D?=
 =?us-ascii?Q?Vxe8PDubeNoJBnTt0yaxoNX4+eEB6djWOJuiWkrWPvR/O6bz4/NYi9YUAz/1?=
 =?us-ascii?Q?P/Xh+7sb41ynw01TKydLWe2eY9pOO6Lw5dEh434WOM1HIGWj0sVkeWb4xDKn?=
 =?us-ascii?Q?FLMehTMjz3+bCHq5eVupS7WKJqU8cJ5pCfztJL3LkM75wh4Yd11kvTAELUiB?=
 =?us-ascii?Q?rtXouZ3ziyPFHgSESkT9ShamzOExGcvOMV3Au8URoj5VmJ1yLr/MW4TGoJp0?=
 =?us-ascii?Q?UX8bTq5jBdAXlueNSpPjyywYhI1/9rdzvklPH7D8uMsDQcNPeHhb2ztirmTc?=
 =?us-ascii?Q?CzduyxLY3ue48QULltNZJjrvUKcRC7jQwKNXtevdQ/kEHaqTbRXgMIeQ0Tb3?=
 =?us-ascii?Q?irwnvPtej/dimcvFUYMQDx7ItuLhLrnwvK2TUTT/ru8RmJ7ny5YrLjMhlVBv?=
 =?us-ascii?Q?ygeRTQ7Stl6lEMtiZZUkxJmqSwhr9dtzCQGqbLDcMjYRwZ11Fg8vpHvKO2jv?=
 =?us-ascii?Q?E1PT1SREww39mGnESoqMhCQXkIiH/qrTcpuxq6enIywcpL3QJFnW4AAjZGd+?=
 =?us-ascii?Q?NtpYi1yqTSM54HY6SNY8S8+rCHaKpJBPQcl1NMXJQD003w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PkCbwwLdMhrxASprLsC0OoojVopmy4OsGyGMD1NIj3En4Tjdl+/Q2hnaFP1D?=
 =?us-ascii?Q?3Eq+wilo8kJDWFZy7tOORPbsFKlKZ1rLZbV2hi0pbeRTOK9ZPLa+yJwG7D5y?=
 =?us-ascii?Q?3CGkBeJRhWYO7mHr0hpYYADT3IM5wU33KC2YA6QLaCt2mCwmzEqgIYP0dN5A?=
 =?us-ascii?Q?amW4nl6rmj0ExiUXuZUlX3dZ2zsD3AJT/+J5+f+kab/UTaFd8bOvfns3rd/v?=
 =?us-ascii?Q?IGCSWfJ+/uUJDXgxUyMBQW0Rcvk7tA3F6A4sRxuBcCwf6jAm6+l7I7BhPV6k?=
 =?us-ascii?Q?X6Db4cl0AqSPA2s017xJYcYiTmgEhb2Ohk/kOvRh6S/MhmeKTU8/VyyMLjag?=
 =?us-ascii?Q?BrISC+LbjYjQkqOoajPGXuiVKPYpSRfeJRGhXsnTrwqJEnmTSHQYVJy8Thva?=
 =?us-ascii?Q?sFO510cR3WXFv8XeZVhHfa3KCw05KZ+nVwW1nWuM9TrugJ/UoS9G2sn1xdYT?=
 =?us-ascii?Q?vHxsbtAh+2W3k6llgJBSk6AjfnOVhzeRqq678JBlXy9FBIMlFevI0JgJpIvZ?=
 =?us-ascii?Q?ohMX49VNVk+aU1CVnb8o6Tw/zj713DYTpHXH9wHGcdNoDFZB9iqcYtm7h5aM?=
 =?us-ascii?Q?hMnQVfaYXzqujHdrh0IC2MeSCF9Xb+H2cPP6CBsLiYG7tQ1/5a9iJAzkaP04?=
 =?us-ascii?Q?ogQ1KL4X3ASFXeX4kYjQEqsPmG06dT8x52xzzSjGQN4o+9aEgL/UvKJdY83I?=
 =?us-ascii?Q?wGcB6PL+iDI2zpckOIT3vZysmKVrs6USLHxF9rw11z0tFqFy4JGVWnfM2WYM?=
 =?us-ascii?Q?/XBgqUFfbJ3MbYoFV3jzmIwbL1uaWL4gaI8mL2fI9VKF6j/r/g853Rh8If5q?=
 =?us-ascii?Q?9RGPsXq57OprtozqeyzIOW83lmeGHAI5t/1n2W1TIEtCuXOm05ng3ibh3UMM?=
 =?us-ascii?Q?2Lof/X3gcVmL5DoE5fdmcsXKkMV96jQjJi0Wf53L5sUQX/tgyJbJbxTEg9U5?=
 =?us-ascii?Q?hxhEzul7RxzAlo0Mx8xIOkAzHcds/KUuKPPD44dc+A7YQ5POaUg3srrXhE6q?=
 =?us-ascii?Q?+k5XpQcLav7EgNIEeUV9YF/R+bFsju5LjkigxHoZukhU9ofFqLE+0DrYNSp+?=
 =?us-ascii?Q?Qf+na0in2BBg5RnCJ0URXwcrgHydkDpr7d+jDoxeDwoAWViXDbM2QnHLKoVm?=
 =?us-ascii?Q?mWViXD4zUEsqt+0pNgcKZDWCJgMsVg7/DwyGhu2/qr1ezoilv7DuhdBH/fQP?=
 =?us-ascii?Q?UbyC/vi3iTAGZPiEO5LyVbICNy7Nr2P9Lf4ZFgzAzxtBvjxkF/7dYOIYfyaY?=
 =?us-ascii?Q?31riZCsUAY7+6ooK3/nGRRC7N0quqTrg6vtOBPEXCZWtkmk9Gg3MqNZ/Z1bl?=
 =?us-ascii?Q?zrLVCrgEjSW37k+doc83EHAgRCv5MHHi5hE66t9f181HuQMuY6YtuwkTzHEy?=
 =?us-ascii?Q?0emiTwuEq7ms6tB9hdDNW7otvNiuas5EbDSeCk5J0xCVT9SCuIyeBjFW9PHn?=
 =?us-ascii?Q?TdgirVlRD1ImVKB65i69nGMpKZd8gDmEC7PvlrMNBINrruG1gRdapFRDIadD?=
 =?us-ascii?Q?pepjZNTD47uI5a3fsitDpdOmjtlQTyZQiEqfAr+l2h7nfqYWbtNRNQYRk7jX?=
 =?us-ascii?Q?fRDWu+/1TkUX9G6Zl7xZhmzSywiA2R6pTs33NzoI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557e0b99-bd3f-4d30-b9a5-08dd127d0e4d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:57:27.9634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVm0NgC+1ySehJijgJ6GVQJ8OuAsUjbYcoqnh8WXspdKp4KsEKz25Jokd0zlZLNi6aMw9QFMWyzgJcBV5e9JHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318
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

i.MX8qxp Display Controller(DC) is comprised of three main components that
include a blit engine for 2D graphics accelerations, display controller for
display output processing, as well as a command sequencer.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5:
* Document aliases.  Drop Rob's previous R-b tag. (Maxime)

v4:
* Collect Rob's R-b tag.

v3:
* No change.

v2:
* Drop fsl,dc-*-id DT properties from example. (Krzysztof)
* Use generic pmu pattern property. (Krzysztof)

 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 240 ++++++++++++++++++
 1 file changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
new file mode 100644
index 000000000000..10cc83a7420f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
@@ -0,0 +1,240 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller
+
+description: |
+  The Freescale i.MX8qxp Display Controller(DC) is comprised of three main
+  components that include a blit engine for 2D graphics accelerations, display
+  controller for display output processing, as well as a command sequencer.
+
+                                  Display buffers              Source buffers
+                                 (AXI read master)            (AXI read master)
+                                  | .......... |                  | | |
+      +---------------------------+------------+------------------+-+-+------+
+      | Display Controller (DC)   | .......... |                  | | |      |
+      |                           |            |                  | | |      |
+      |   @@@@@@@@@@@  +----------+------------+------------+     | | |      |
+  A   |  | Command   | |          V            V            |     | | |      |
+  X <-+->| Sequencer | |    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    |     V V V      |
+  I   |  | (AXI CLK) | |   |                            |   |   @@@@@@@@@@   |
+      |   @@@@@@@@@@@  |   |       Pixel Engine         |   |  |          |  |
+      |       |        |   |         (AXI CLK)          |   |  |          |  |
+      |       V        |    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    |  |          |  |
+  A   |   ***********  |       |   |            |   |       |  |   Blit   |  |
+  H <-+->| Configure | |       V   V            V   V       |  |  Engine  |  |
+  B   |  | (CFG CLK) | |    00000000000      11111111111    |  | (AXI CLK)|  |
+      |   ***********  |   |  Display  |    |  Display  |   |  |          |  |
+      |                |   |  Engine   |    |  Engine   |   |  |          |  |
+      |                |   | (Disp CLK)|    | (Disp CLK)|   |  |          |  |
+      |   @@@@@@@@@@@  |    00000000000      11111111111    |   @@@@@@@@@@   |
+  I   |  |  Common   | |         |                |         |       |        |
+  R <-+--|  Control  | |         |    Display     |         |       |        |
+  Q   |  | (AXI CLK) | |         |   Controller   |         |       |        |
+      |   @@@@@@@@@@@  +------------------------------------+       |        |
+      |                          |                |       ^         |        |
+      +--------------------------+----------------+-------+---------+--------+
+              ^                  |                |       |         |
+              |                  V                V       |         V
+       Clocks & Resets        Display          Display  Panic   Destination
+                              Output0          Output1 Control    buffer
+                                                              (AXI write master)
+
+  Each Display Controller device should have an alias in the aliases node, in
+  the form of dc<x>, where <x> is an integer specifying the Display Controller
+  instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: axi
+      - const: cfg
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^command-sequencer@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-command-sequencer
+
+  "^display-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-display-engine
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-intc
+
+  "^pixel-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-pixel-engine
+
+  "^pmu@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-axi-performance-counter
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    display-controller@56180000 {
+        compatible = "fsl,imx8qxp-dc";
+        reg = <0x56180000 0x40000>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_4>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        interrupt-controller@56180040 {
+            compatible = "fsl,imx8qxp-dc-intc";
+            reg = <0x56180040 0x60>;
+            clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+            interrupt-controller;
+            interrupt-parent = <&dc0_irqsteer>;
+            #interrupt-cells = <1>;
+            interrupts = <448>, <449>, <450>,  <64>,
+                          <65>,  <66>,  <67>,  <68>,
+                          <69>,  <70>, <193>, <194>,
+                         <195>, <196>, <197>,  <72>,
+                          <73>,  <74>,  <75>,  <76>,
+                          <77>,  <78>,  <79>,  <80>,
+                          <81>, <199>, <200>, <201>,
+                         <202>, <203>, <204>, <205>,
+                         <206>, <207>, <208>,   <5>,
+                           <0>,   <1>,   <2>,   <3>,
+                           <4>,  <82>,  <83>,  <84>,
+                          <85>, <209>, <210>, <211>,
+                         <212>;
+            interrupt-names = "store9_shdload",
+                              "store9_framecomplete",
+                              "store9_seqcomplete",
+                              "extdst0_shdload",
+                              "extdst0_framecomplete",
+                              "extdst0_seqcomplete",
+                              "extdst4_shdload",
+                              "extdst4_framecomplete",
+                              "extdst4_seqcomplete",
+                              "extdst1_shdload",
+                              "extdst1_framecomplete",
+                              "extdst1_seqcomplete",
+                              "extdst5_shdload",
+                              "extdst5_framecomplete",
+                              "extdst5_seqcomplete",
+                              "disengcfg_shdload0",
+                              "disengcfg_framecomplete0",
+                              "disengcfg_seqcomplete0",
+                              "framegen0_int0",
+                              "framegen0_int1",
+                              "framegen0_int2",
+                              "framegen0_int3",
+                              "sig0_shdload",
+                              "sig0_valid",
+                              "sig0_error",
+                              "disengcfg_shdload1",
+                              "disengcfg_framecomplete1",
+                              "disengcfg_seqcomplete1",
+                              "framegen1_int0",
+                              "framegen1_int1",
+                              "framegen1_int2",
+                              "framegen1_int3",
+                              "sig1_shdload",
+                              "sig1_valid",
+                              "sig1_error",
+                              "reserved",
+                              "cmdseq_error",
+                              "comctrl_sw0",
+                              "comctrl_sw1",
+                              "comctrl_sw2",
+                              "comctrl_sw3",
+                              "framegen0_primsync_on",
+                              "framegen0_primsync_off",
+                              "framegen0_secsync_on",
+                              "framegen0_secsync_off",
+                              "framegen1_primsync_on",
+                              "framegen1_primsync_off",
+                              "framegen1_secsync_on",
+                              "framegen1_secsync_off";
+        };
+
+        pixel-engine@56180800 {
+            compatible = "fsl,imx8qxp-dc-pixel-engine";
+            reg = <0x56180800 0xac00>;
+            clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+        };
+
+        display-engine@5618b400 {
+            compatible = "fsl,imx8qxp-dc-display-engine";
+            reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+            reg-names = "top", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <15>, <16>, <17>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+            power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+        };
+    };
-- 
2.34.1

