Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112BCB1C835
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 17:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E00110E1DB;
	Wed,  6 Aug 2025 15:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i8XwjnkI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA0210E1DB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 15:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rB18Xz9BgRsKifexyGG3bWSyXYCTHXcK4NhuKDBIsqwDyOdjJoVm+SQfj7aT/a6vsuq3m4Wu8sr/GTfSTaMq/1kP3WaKBYWOYAmgpfgO5nlKzw5IeTbim5cXTh0pM/9liYaB/H2lEDRBIl4K3FJRfS0d4smlJJd6AwgV2trUeKIh1L7VkQ/t8JMrFeR3Vi7EQn517AEdqjNFAzhOg1yRfIkwQkWAnFcknZydUVNdDZz/wtB9fQZXusi0AIWLQa/ID+liICo8WDOU11/Ee4Z7t6EhLGhTQBicLO0qiUImDYetfYiy1Ya08Ur/pOtAYsVFqCZEP6ooikWK7jFbARJ/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2ncJwG8F4lF+qbb/qTu9hx6o6RgpZ7OT9v5gKAf2lA=;
 b=E7+tdxDSdZ5Vjei7td7A8eowtl+S7OnUcjIe6mICVYBexDibd7w4DxvXqwMH2PG1hdSVHAOdYlncdCgwXpl5bU5vMaUHvdyUlrNKMzHAsTTEJ4GyOdxC1y3EsPLwioPt5BMhgNTERPU8yWOBJZ88WOrYywk1tpBuKAKyzSjIRFl3tz6ZZtKHOIQUgO95BZOsl2a2vNiKWu1gCakPs6rb3uyyX3Z2o1XLkniTfQpWJeyp5jGFZw5bS++K09TrWbsrkKzaxxp2LWKfnQvdGbAcXoLgny0Vb7vHqH16pbr9Evuhx8pw2DdYa7/FTMruZ9PIs42VT9bHW/Z5r2bt+FMU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2ncJwG8F4lF+qbb/qTu9hx6o6RgpZ7OT9v5gKAf2lA=;
 b=i8XwjnkIcr8xW4zDxgqoj038/nel/rLWnQZsHkmbZDpRPuwk4u8RB5fxYTwhjIHLqur/YbGbOXW/NYX51YhhMBPgzFqVBu/Xi+cMTg2q3IJndUzLjQS8SPo4NwehMkqEIw1zW1o3YtLAOvnHI0Niv2T2K0m7vPxmq13eU0hRAiMqOi+V3i8zHDx2zx9FRJFjbTU1c6UYR3/kijmQ8u7kTqJrLQ/ioKh5xfvRvgY7Chm5lUpfqNAqjvgusVHu9YOTZgIjfBbhV1cs7JoeJTtHmjOhcGRXWhTmuXHmBeM7osR52yPrQ/MrDb/q6qbjyE/Kx5yXbZ++FDSXUyRHN3JTdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PA3PR04MB11203.eurprd04.prod.outlook.com (2603:10a6:102:4ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 15:05:34 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 15:05:34 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marek Vasut <marex@denx.de>
Cc: Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/9] Add support for i.MX94 DCIF
Date: Wed,  6 Aug 2025 18:05:07 +0300
Message-Id: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P193CA0009.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::14) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PA3PR04MB11203:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e77a08-f2a4-4ae6-87bb-08ddd4fab13e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rJ679M3jj5dOgruJ03GWTwY+dsqyMAPUN3i232/jK7FIqeOqm6/UQMqtxqbs?=
 =?us-ascii?Q?U35Nbr2Y+NKy2XZwxBNKbaBRnhLlzbdTnp6xaTuYZid9vyU5NZCVBkbt0MbP?=
 =?us-ascii?Q?Lsc6UpJRZJqs+Y88W8mQAZE2xAiRIDBxeRfPsEPukEW6rV4CxFHjbtOCf9P7?=
 =?us-ascii?Q?u6xLbpZpHeI2x6WS8i9TsN8DNmi8rXtRl/mvzXDZEggHFp5PNRnuB4TRPCgR?=
 =?us-ascii?Q?Ktt5Di1YXFpimryE6n/SMHo+3FJ8DQ8bXzA5armFLzZPnryVQ/QMhNDnkjpP?=
 =?us-ascii?Q?neY262uOtioF8CbjMS3LTEAaJuk6RLYHE5N6XbL4xT3N9n3b/AyFS0CYqrXk?=
 =?us-ascii?Q?+UYqG9LFk/tTO7UhCzNYKKOCc7YdhNA8o39wPuXE+3FG/CGr6Vc5jx3+Q4f0?=
 =?us-ascii?Q?MIbjaVNFewMCxsxZzBQJ5aEFWIpDs/TJ3efZ1ekg56XroLMbedGHqi03++4R?=
 =?us-ascii?Q?ZHk5dQBGijV+VPaqcJvVgfo+DY9+Jb7o/Mf+uNAKxFLh6WAvBIjiBZH6posn?=
 =?us-ascii?Q?ZCpKdoMWXNuvSfDG3Ejt3f5SdyODBNGbm+HwjNDevD1CJ+OafTLGku5Z3F0T?=
 =?us-ascii?Q?Nj4GT4a+fqimVw7Oc1DVHXa+PqpZdZ7G18534ZU6x8MfEJUCsKFs03oMUmWW?=
 =?us-ascii?Q?kTJ3SSr0VpBW1iWBS4Ir0HmyWZQXZgHV/TisF1ggfNWOnLfasfPC0g073MPo?=
 =?us-ascii?Q?LE9BBmpd2ZyFpxdEi1/fJuaKOTPvSbhTSe7ktIy1ptb6tNudeT3/m5oUeYBe?=
 =?us-ascii?Q?fjEJOfaLQbi0bLu7c26jjziXe2enr07lalOJuUHpJdEzi/+UoLcR1Q3BvD0f?=
 =?us-ascii?Q?w5hLumxX2fhGzfrTHi2E00iwKVxE9s8pBKWJbeqMMZUn8M8CD4T0naib3TkF?=
 =?us-ascii?Q?wOZBJ2lQu96WsDxW7xMK0VfCvMwEmcuwXDKyA00AOM2aOND0eAmR57Cp1pV0?=
 =?us-ascii?Q?wZ0Yi/tQO+ksdRpuTqcAcrTIWX703/6AoafPeuobrkfafJFULeBuqscLvWEz?=
 =?us-ascii?Q?SighLWAzhA10zay7eRXIJAQFZr+sCrTa14K5fbJIH9hqTRvTRoZThyYp7iuZ?=
 =?us-ascii?Q?X7gpoRPZ2S+t24ddINtOMtoKuQyxIGSX8XR9YVdWheZOOd1EDYEqyCyccU+h?=
 =?us-ascii?Q?ADcRwL+TZgnct8s/nN2IV+n9SeYiNexMc/ErqL2d/6c5pMWyi+RfjMWCHwJL?=
 =?us-ascii?Q?x3BPkEOif//c/oCXiYzwMqGfa20e7cpAHIWSiK9OchNk5ETjmyqkEUBgaYgV?=
 =?us-ascii?Q?865I4Y768GRGjesJgF5THO3Df5b73G6ofpeslBFacuaXVBVvHfO3tQcu/n+B?=
 =?us-ascii?Q?gJu7SplnlKTAa8csYcsrL4LBWkzOJVFwzWbKZ2SstBN/hXogoEF2aZ/MTWNo?=
 =?us-ascii?Q?DH27XdxNno/FvA9hgm90EUj4eQ99CO3K5Xc8lntDiZih1L1B6DVkbbwlZ88X?=
 =?us-ascii?Q?gI60dOZHi88=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M02GA0Cz70tnHTcja8OaDuIy6PTRg7yO3pYLEI099p6S0eGzoHixFMT7ep/q?=
 =?us-ascii?Q?31dlsmzBIBxepxyLD33VgxkzsQoQ7XBZ0UUdYRDtfiw+YantmUlAfhxZ+BXX?=
 =?us-ascii?Q?AKFPB14fCTk09ekQmQu61ANRRi3Nl907kPML6BcrSXESvGQU9b+24/CHiBIb?=
 =?us-ascii?Q?BEPUjQpCmmnof3xT4s3KKHwFpewYgTm91bX9THwzC9UKRBuvzFD53rTIBi7O?=
 =?us-ascii?Q?AWXGAoZ7G62WmwniGsx+nm2aqZd9pk8mTFJfjCfia1oGR8NPMZhfaaV+zo/Y?=
 =?us-ascii?Q?uv08bLONGtBEvEONGnYCdXlmvbHVs4Am2Hcfu7k8sVi2hMmsMB5dCYtSMJtX?=
 =?us-ascii?Q?Ng+7uRnsTfBR2eaKZPW9PkjTlT2a2Kdiq8kK/c8jRNFHp6bB024yk737fyjX?=
 =?us-ascii?Q?vDaG/Hf5hcJta7tPM1nUpa7SdouUVEYwn3pGMDkt0yyrUemq/ldM8INls9jq?=
 =?us-ascii?Q?p0afiM7sCuDnDvueNFgpt1Yb1OcH6YrPenoKX01Qw0jCZ8tgrCyrjuRzLYS0?=
 =?us-ascii?Q?u1WflW9RQYG04ZEuBzVmF6Uy1Ejebi0W3FlQr4bvjg8/W/E2AV9EdmKLlP7D?=
 =?us-ascii?Q?0Y1DFi2F66Oh08XGvpqSVyVbYcSSIcACciweoutJw9Vz4hAbBszc4jelaZng?=
 =?us-ascii?Q?RAU3DCXN5JKsSOWzGoeytDkPXmh6+JlOa7dpfU9QKi8dew4+v9ZTVvlw+9wm?=
 =?us-ascii?Q?r5I+qXHLQCGtmp8Z9pHQgx+PUkLfHKZb0mDFusejtm7MIErNHUXZUENdnK5V?=
 =?us-ascii?Q?FfIEQKmLBszlDBcgArbvVtXNFkfi1GE0KnB1I/W4f/aYcPBz/J2adBSVVWoR?=
 =?us-ascii?Q?5y9NQ3qBTgn7zf6GuduXgRpstufu7gv2rz8vBf6/PA2v2qbc9/610AXz9ZIy?=
 =?us-ascii?Q?bvLUzY3ab5FS3MnVV68eS9BkeZdmB3zPJn1FxAWoG4Q1xcDaTMYGjz675KyE?=
 =?us-ascii?Q?lbRZTD4NGsechhZx0qILddzvEyXlg2/z1igE4+38b7IegPblZkG04FP0/CD0?=
 =?us-ascii?Q?FgmPbcz7kwyWNAwcANpyqV3iGlZF9tpraEgcIdpw1HvhplzHDaGUlwUO3IV6?=
 =?us-ascii?Q?JdACP5nK+XYV5gg85j2H/Cc9c2uPy9BVxplIX98lWSYC6Eglqy90cItct/j/?=
 =?us-ascii?Q?u0uuuDcQFXkDlPMIAqrCgSott/2ixgfQ2vFIU+fMzb8Gk4WvzZ4WbWM76mUg?=
 =?us-ascii?Q?lO6ODuk6Jgnfjr5PqjyYxLGT0evq/b+KH9lExSdRv0nJMQSgW9QHLCYneVUB?=
 =?us-ascii?Q?RXVpDGWivcHHa8DaeqGB6elIgyjM1qHTMHIIZ5j3Gn+LDmv7tH6STFwd+EXp?=
 =?us-ascii?Q?zvGxlf27bgva4FfsU1CliJagsLAAXcm+WzUx8z4LOIArlR3vss93efL0PDJh?=
 =?us-ascii?Q?1q6lnyKMLLegTZaRNVArdqq7baQW7/GkncDK9Xt/bVEXio4hjYPosVUz3GdR?=
 =?us-ascii?Q?iL+oDogPXh2WTRgY2htlV7iJadBKkmDH5hRvNVwliftVwqw+LO0oEGm+SFww?=
 =?us-ascii?Q?P2Pfjlmd3lfmZcxZM0R5p3ZP5INVtFYeiaseejDBFSaT9X/VMjthwh1CB2Tb?=
 =?us-ascii?Q?U/qlGKlmhruSQdJ0nGpC5KEiBKzvQiatltWP2Z7QSq+464ViBjgDP9z6WVcS?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e77a08-f2a4-4ae6-87bb-08ddd4fab13e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 15:05:34.2038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kikHJsrffo7ArR+IGKKYkfyNF0Snvj7UkiIh6c4GcBDSKOg6p1ulcfN8tkSE9Mh+NInru1yu7Q3NAC4bT56X+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11203
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

Hi,

This patch-set adds support for the i.MX94 Display Control Interface.
It depends on Peng Fan's DTS patch [1] that was not yet merged. Also, it
needs the BLK CTL changes [2] that I spinned off from v2 in a different
patchset.

Also, included in the patch-set are a few extra patches that the DCIF
driver depends on for functioning properly:
 * 1/9 - 3/9 : add support for i.MX94 to fsl-ldb driver. It also
			   contains a patch (2/9) from Liu Ying that was already reviewed
			   and was part of another patch-set ([3]), but was never merged;

v3:
 * Removed the BLK CTL patches and created a separate patch set [2] for them;
 * Collected r-b tags for 1/9, 2/9, 3/9 and 9/9;
 * Removed the DCIF QoS functionality until I find a better way to
   implement it through syscon. QoS functionality will be added in
   subsequent patches. Also, used devm_clk_bulk_get_all() and used
   dev_err_probe() as suggested;
 * Addressed Frank's and Krzysztof's comments on the DCIF bindings;
 * Addressed Frank's comments on dtsi and dts files;
 * Added a new binding patch, 6/9, for adding 'ldb' optional property to
   nxp,imx95-blk-ctl.yaml;

v2:
 * reworked the BLK_CTL patch and split in 2 to make it easier for
   review;
 * split the dts and dtsi patch in 2 separate ones;
 * addressed Frank's comments in DCIF driver;
 * addressed Rob's comments for the bindings files;
 * addressed a couple of checkpatch issues;

Thanks,
Laurentiu

[1] https://lkml.org/lkml/2025/7/7/84
[2] https://www.spinics.net/lists/kernel/msg5791546.html
[3] https://lkml.org/lkml/2024/11/14/262

Laurentiu Palcu (7):
  dt-bindings: display: fsl,ldb: Add i.MX94 LDB
  drm/bridge: fsl-ldb: Add support for i.MX94
  dt-bindings: display: imx: Add bindings for i.MX94 DCIF
  dt-bindings: clock: nxp,imx95-blk-ctl: Add optional ldb property
  arm64: dts: imx943: Add display pipeline nodes
  arm64: dts: imx943-evk: Add display support using IT6263
  MAINTAINERS: Add entry for i.MX94 DCIF driver

Liu Ying (1):
  drm/bridge: fsl-ldb: Get the next non-panel bridge

Sandor Yu (1):
  drm/imx: Add support for i.MX94 DCIF

 .../bindings/clock/nxp,imx95-blk-ctl.yaml     |   5 +
 .../bindings/display/bridge/fsl,ldb.yaml      |   2 +
 .../bindings/display/imx/nxp,imx94-dcif.yaml  |  82 +++
 MAINTAINERS                                   |   9 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts  | 121 +++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  55 +-
 drivers/gpu/drm/bridge/fsl-ldb.c              |  47 +-
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dcif/Kconfig              |  15 +
 drivers/gpu/drm/imx/dcif/Makefile             |   5 +
 drivers/gpu/drm/imx/dcif/dcif-crc.c           | 211 ++++++
 drivers/gpu/drm/imx/dcif/dcif-crc.h           |  52 ++
 drivers/gpu/drm/imx/dcif/dcif-crtc.c          | 694 ++++++++++++++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.c           | 226 ++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.h           |  84 +++
 drivers/gpu/drm/imx/dcif/dcif-kms.c           | 100 +++
 drivers/gpu/drm/imx/dcif/dcif-plane.c         | 269 +++++++
 drivers/gpu/drm/imx/dcif/dcif-reg.h           | 266 +++++++
 19 files changed, 2223 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
 create mode 100644 drivers/gpu/drm/imx/dcif/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dcif/Makefile
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.h
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.h
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-kms.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-plane.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-reg.h

-- 
2.49.0

