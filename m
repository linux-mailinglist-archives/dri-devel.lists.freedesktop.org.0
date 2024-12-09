Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722799E89C6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 04:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB27510E465;
	Mon,  9 Dec 2024 03:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Xn/NchiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2071.outbound.protection.outlook.com [40.107.247.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D3710E465
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 03:40:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gv73jM9n5P1liuNmPe0KtUz0UE1WJrBsb7Gad6qfhqPhd4bUVeyx6oHd9kl2tNOTPutUCqd9WONVtLaikQSWcjVrbzODoDAQLjU87q4z0ZVozvBJmgy53ALgbgLnEw3yekrfFiqphtPMlMiC4176XgISApUGUS2lAi8a+Fiw7b3Pu6cYfHdaGoykxshW9UQCP3Iz+yghhW9iOrZ4y8gt2act4qKCScKe1r+xgFqM+WnygucUdJkyceVONpIZ2HPEs91QZuYLg3IV1ccAkARFjl8SivP+6YMEqqxw/CLj8lAHzWoaJG8hzq4iVI79caCkPbd4okbJBhug29//+sqBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+TQESrLwCyxJ9LEG38oLibqrERDNGgHfPS4nVb04js=;
 b=kBlz0enMa3CAlmeeaSbwLKYaJqydpciajKvjXVrXLTe8sXg8DUG3j8Zo/3egcgbK6Jj4GadskMzKbPJzXVcQmbsT/G8pG9xFDHC+aRaoz0ooIMr4Nhbu+nMGvo7JPKI6Z2H2YPSeGxeAS1wCM2Pf8LC9s2IHCgIXd80OXWn92Ntu1hYSRs9kSSzMhtyZM3aaL2OMRTei3ZSsApcFrLEn4CjXu7ozSVoVqeySMEpkQAbM0Z0ZE5XEs2Q17mUlCZB35JqmqZ5rShQmNrcuRvs56o/gEx/v5a3j5cirFqcUFU9W16s7i7IVL2HCP7y1mq2fikQVH8ZfPAWtBgQ6EGEGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+TQESrLwCyxJ9LEG38oLibqrERDNGgHfPS4nVb04js=;
 b=Xn/NchiBJCue0DENyMGCLGXTCuEfzq9UY42YvDVCn4YawHBJa+V1gqFQqbkqrEa3xexoDooFo5tp07pDrXJzs2GzGzeqa/2+FYcqjbQxXRLbRrz7Q5yfXtSOh8ZbIT+deWYW+W+Y1O9vET7HGPUupBqYjFeWw/OINi5D5NgfFvw9tV1C7GGYqRE+5hJFTv8WkReBfjgCn5ZKcCJx0CHlsF4nV4lK+B0DyAT2dO54RvigU8XHqJhI1E61upR0oFOtvu3OVnb1eOuMqhP9USkbzJriPuN6PF8zfDp9ieFKLEXviPWKFQepBlykz15fxlMEC7y4stDvK50nnrcaxKzcqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10212.eurprd04.prod.outlook.com (2603:10a6:800:243::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 03:40:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 03:40:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
 u.kleine-koenig@baylibre.com
Subject: [PATCH v6 08/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller
Date: Mon,  9 Dec 2024 11:39:12 +0800
Message-Id: <20241209033923.3009629-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209033923.3009629-1-victor.liu@nxp.com>
References: <20241209033923.3009629-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10212:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a2a0c4-9bba-46ad-ea3f-08dd18033ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LiD0kvL3LYnvG/Dh02s+VBVhkbnewZ0Nh8qm+1aOIeFtC1J93M3g6iMesmm7?=
 =?us-ascii?Q?7WMx4zRn8003iOCCtXhbWKBqkz1A004ABXZnblUUu+9Fe+TbcCbxvu/4SxyS?=
 =?us-ascii?Q?TJfOCpezGkBGJhSIoAphk2K9xsBydZB7VU+wYAJMfIq92fplzz4NrqH81dVV?=
 =?us-ascii?Q?EzMW6wUsPM8MqNnw4nAWLL72P50j7mIXFoHxUxlY9M8M94pkbDVBkhskAEqm?=
 =?us-ascii?Q?MtAnbrSdTJnoSBN9NJz+JZMKvBEtkTEzbrs3nXjOLpMdZHbZudaCAd2nipKv?=
 =?us-ascii?Q?Yj8Ra3e4hyxI/mnppaIuULF72wIcxj1Cn1YKoTvDEn7/Ul8W6uCkv1D7+h2w?=
 =?us-ascii?Q?UtNemrzHObgS4hvSgpco29hfajZCUXIdyYrIEc6VQQ+JIVmsd/Ac32ssRI9b?=
 =?us-ascii?Q?D2VIxCaIWFFZRlzHTnGb0q+eqzlpN2uyZDeICd3vl0DYVFpxxAEayAteExkD?=
 =?us-ascii?Q?WFfXjl7dzhEmfdDkXLK3+7EozBk1Tal82EYBOFRzWwubMWjgaQelqHGfKRyj?=
 =?us-ascii?Q?wpN80lkLWJ+i3hlEQ/QjNsV729tnoplFv7BcXxV7jzJmyfr26l3WoTddmgUr?=
 =?us-ascii?Q?GUTc8hNW3zJ++51AGKC4GaNb6ng4f9EVpbZhUIThT+T70hZs9cu7u2Dj/TD0?=
 =?us-ascii?Q?rkVhhdBAGMCFjjAyATPhGHUPic2OGfjCqrYBkHgM65rTEdZYddxIl19dDTWy?=
 =?us-ascii?Q?DOZP8WUUNgXvktrBIZE6flf+53pzyiEmdEFyOt6nBujyxuSrshkizrQXgkl9?=
 =?us-ascii?Q?u7jkV7jLpq3fgfN6Cc8KlULHv9YYdbLzRo2Xi6/MOIFSUCBwHWtwIkKyDIsi?=
 =?us-ascii?Q?Zbkyc6XDitwX5tMrDCb2seSwSoyKlSFbmNRujERZr2PQ27jY+e0Ch/1YG6Sz?=
 =?us-ascii?Q?nmi3RbjS5xxwbxOm31JH1GHnkoKhkINaZlicf3HaEIl4GtE4/fus4VJZtEGT?=
 =?us-ascii?Q?Qxv43OVdRxCxFP2FlZjhMTsW5VAO21E4cA6vxWcbo6Z5y0Rmj4XmA1CZoimH?=
 =?us-ascii?Q?u5NCUs8+vnOZ5f+nJZTv6q3gWwmEz9uDhI0TVsCSHBpWUD+tE0GFqLRCmKvi?=
 =?us-ascii?Q?JVu9jpbPEamO6fUDWu0Beb4Cx+tfblp1HU6Q5cSZPn5ZVlDIOH6eIj033xc2?=
 =?us-ascii?Q?KVxKlrwkMwXcpUJfcjWzzPfAIccOD3L7ckNbgOcW22CIpxlYE5iiAWyNkpY9?=
 =?us-ascii?Q?Mrgtvk+KbyPeiJk1sPVLMJCrv0NR/Xg2Kot+krVe39Qyoudp1bI4NjqR618t?=
 =?us-ascii?Q?rZlSSy5Sxs7Bd/CdQHF47kuj9oJcGuTky3/Dizm1m3S9HYkm4G1bp0n1kpkZ?=
 =?us-ascii?Q?XWKZyeTYMpSWHV5SvnltOWNtKmGvzwAAsXGd6NR75wCC8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2VEmb5I+X3tswVrT/T2e7QHddNXsS4ELU/4h5K15qm6ghasTmw1k3WsiLBte?=
 =?us-ascii?Q?hRXszwwH4a/DuKGgXB18MqXquzXVk9fjO5Em7b7PM6g55wyrRRirwrcWyrc0?=
 =?us-ascii?Q?JyaU/VlgCF89n/678E8QnEoCRe8cXuQEPrE6knACa0+oFLVMTEoDO4Cds9Fs?=
 =?us-ascii?Q?vfvfmtFrsBwUzIz+4w93JV/4aaLHCDloOGcinKPpPchK0uJBmPd/urWCZOMO?=
 =?us-ascii?Q?QjJTvyvwRf92fTIzIme2p63d9S/HxRQmaq4iD1JQkQALo2G+/NRvgRR+PZy7?=
 =?us-ascii?Q?+sDdogyebd1h1rouFhpTL3pXQYr9mnmg9e6OaGbZFEr1SmgGE7oYIwBbAD6e?=
 =?us-ascii?Q?F8pbmvMAgVvTckNlZxRi8T4J3ZbMVWrFCToeQ4TVWuGFljxnfrSx8g58Wda4?=
 =?us-ascii?Q?Mmo4LSbMpqjUxi5jy6UHgd346AguEURaowJI9VFWIZh2JwJM46+SR4gCcQco?=
 =?us-ascii?Q?G/MLX0ReBeu7C3CAVDtZjvkxZ0TOv5ix6gMlTXihkwnGjebfrFdNDtYOgvlT?=
 =?us-ascii?Q?yqMtwwmndDE5spYA9gGMh5yzjidikwbUrsfF8OvxCrYo2rjykBeCopXNsccQ?=
 =?us-ascii?Q?JHm/5pL9+cE8GHv1SKJx7tGREUz1q/vomLYqDFnClehbJhisfHIOp21MJNQB?=
 =?us-ascii?Q?XxnrxNZzgqfNQac/3hrkY0aUrELTDO/hZ+9tAZTKa9l0aTnwoed9Ra8Hgv8k?=
 =?us-ascii?Q?LnGOpWJWKyMEj3bTIT3lglpjBGV0rRuhWdxu6bjk9QrEowiRgO698v7gsGE2?=
 =?us-ascii?Q?VRDytkWXKnY80WyI2aDKqQi3XYnJlVhuaQzfZ/9PCYydLN3HUiOhi+wSrElT?=
 =?us-ascii?Q?YjqyahIbwTNmv1LY6FnWrEOxoDHfFY5/7WFduRo6sBo9bGJOiX9O4/l4aOTz?=
 =?us-ascii?Q?SJlGEOIS3LNPJasmmgr8PgFMtk0VgH6dOHY5ekBbDJ8ZK0nDB9NVAhbFbX9E?=
 =?us-ascii?Q?ubPG6iRr3/NjrjgaMDn8fmtaGQZecSxip89kNe5UrHtBdYHDTWuJNJm2K4E8?=
 =?us-ascii?Q?A2WTBvxNOg+g4f5IY7imPa03tzUt/rI3vT3XiuuE2WSImt8K22X4GMXdVMys?=
 =?us-ascii?Q?36iQrTUlWsNjE76pOMuSHQp9T7C52UUaAj1n+e3898PcYmb4cbF5XC18Yw4w?=
 =?us-ascii?Q?H6hm6kIlj0OoW9NKX6ubKViMAhSlRM4n94FVZN6EgJ52QtDLr9MC1nh6T8Mf?=
 =?us-ascii?Q?W2oOVbhAxauMGNDzXm8V3sPzUddQpqR2Z5CErKdzMtiG3lpvC1w5lnvizQx4?=
 =?us-ascii?Q?RxeYV61u7zlziy6oF1WUD2HhWZ2kH9Q/pT5bDWt+HXrIHjLIYoPN1+HPgJVk?=
 =?us-ascii?Q?Vs437xPhNOtR+Dh3Rt9UC/0Fd9aSVd9TjT9pNL+FZ11lDimgHCRRfADi+owE?=
 =?us-ascii?Q?vXDIV956aZ+4MYWpLGge8RFzADmgXPavutzzvIrFadWmT15mWhRX7w9emSmG?=
 =?us-ascii?Q?ALQyEF1ruu7NEVyMwZn9n+m3a8C65QrBMC8Xmlep7AR/6Q9cA+VnY7Trmdg9?=
 =?us-ascii?Q?45ycgACHunwVVHFz0DlFQxBIB82u6BA4kOpdkkhrzIqn3dJ2pqL1hSJPjf+1?=
 =?us-ascii?Q?VcS8cXKaa/fUGwdJXWdnFUI2QDvdWxvWS5HrDzlo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a2a0c4-9bba-46ad-ea3f-08dd18033ef6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 03:40:37.8817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogfGyWklF1K1aX97hpU03T/K6TQmP9tfTuZ4MSvVpaAF0fdlO39O5UYZnC+uHpykpjTOJXPIbIErND7PORfpjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10212
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
v6:
* No change.

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

