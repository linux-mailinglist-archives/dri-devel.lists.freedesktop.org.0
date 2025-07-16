Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7860B0700D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 10:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FF410E71C;
	Wed, 16 Jul 2025 08:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vHNivX5c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3F710E704
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:15:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfXUkNy+eBsSDpKhUBP/ZkvVW+3RXuK57rpXhwFMTqIZhDchxxFAB8JZcEjV/38oLPMRX+iKWbVcAhFNXId71GbnIjsPL8N+IBjgsazvOZ2PLs/5yhWczWOUvEGEAZiTQIP/PcgZLVgLmt5i0AmzYFGNroUKEvNuFHQ1PdgZVl6CLXH9KqEYWYlYYzLS2Efwg07E2j+iuugX8ngIEFH21+7yB5m6IUrXhOYhWM6E4u8wCjrESrLfkN5gU4C9NNGbCtuT0IXJOFJ2x35YjddweX1WVhHuINsgjG6Wki75uXJ1MDaflFuyHax1znngt7GitdD2k7QOZ4lIjVPong78nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbEk3r1qacDMzNMTWHkheKY5RFowGhyVFL59+k42kK4=;
 b=jFzzI+B174bu8b6eS+Fk2vJmSG1Q9FyJVmj0GzwhYEoDNfnaNz2TWk5S0Z/VIUFcKdbXGra4dorTwN7PAdtsojiHs65NJ4sHW2vwgMOI8rmXGEwx3CyNhCdzEsrORVfk/s/dpIqpvaanzBzuPzychzQBFI004W/FgbGAjDu5V96fdhq0WnywKhQuhBhx8GIDNyoboLG048qCxbPzxvtse4IsRVdUfWGSzJU3JNWX/D+B3FrGFmx13iPynAr6SeO4GGk+aUhlD0+222IT+ce88DD9Tg1/nBIK/ADSBeeuS8Dpufdxu1QK7LhTuteiWb0VPmE53Sqi3x7ufqeRLVeJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbEk3r1qacDMzNMTWHkheKY5RFowGhyVFL59+k42kK4=;
 b=vHNivX5c7u3JLOXIsFyPyPGCSStpOztxjW7rhfUlSHCtQPBC81y+yziVS0Nd1zmGoxdNOq7vD8ew0KpKo2YOb6keerepNgUdnr7eRPb8LJEG7lneBnNZYd6EySCP5YzpVMMCQdVHIY72N6z8oHCkKK1V1JgWJorZFTYGiSklgPkuP96Z/b8Ucd7mA93+FoxxkFjqDDXGixQxpiQw4pPpxitpQ2znQwVh2IyakeTNPCQw50Pktme3PglGweg8sdqpmKRo7nMfDJO/JjBF0b8Gu2mj8HwOUQuDGoLYIrAkG3RItXLJI6yLv4P63qxVBwVgJp9bFDWPJQ7Pon5YoqPZAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 08:15:41 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 08:15:41 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Frank Li <frank.li@nxp.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 00/10] Add support for i.MX94 DCIF
Date: Wed, 16 Jul 2025 11:15:04 +0300
Message-Id: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::10) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f3bb3e-fb1f-4da7-2814-08ddc440f42f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6niJzhGwsTzFMu/nzLkPBG5ID14L0He4S6hhKSJ2YTdYgWzs9db/Kbs5GVek?=
 =?us-ascii?Q?w1W2Sf/yAOsyTezX7Eh08ESRWY/kNiL+9NL9vi04lSOQ/la/EQmUi6nFLe5A?=
 =?us-ascii?Q?5E1vZM03f6kqgZy+RkBO+ngN8hEJ9hFnoc67z43ED9QzhqUOCRvy59tuOSgD?=
 =?us-ascii?Q?UHywxWdzW/u6ltgmUDETwJtHe4mgTnY116s3Twn6MXFp+zwpdPmRHvuJSD7D?=
 =?us-ascii?Q?sunTEHwJ6t28Sn6ftvDsvurpNNGA/KxQ8xynwGoatWl57P7/fm8fbJaHWf8j?=
 =?us-ascii?Q?loRimI6PC45qWkOPNMNkZf1kwWiA+zuMhd8ci7GKf47fBOc7XkUEOcF9s8y1?=
 =?us-ascii?Q?8ngL1VynvqSaTZ8d6EVLcVLgeNsdutTrzaEvFXJkeBB7sArmEoSsthAstPIi?=
 =?us-ascii?Q?WpzdOK9yT9GPIdUs5Lz10dOD41mqltUK/gtC1ov0FQAqHFEkjwT1lksb7bPD?=
 =?us-ascii?Q?t+Dus5ULcNcmcXkHSjJ4nUg6XDnTxpNLXQeBjXcHgUpyQP2jQMbgif2ODc5F?=
 =?us-ascii?Q?yTSgJUbaCw1PlZyBJygOygJ6EXXZTDBiPggUuj48C1XG9FUzC+jMWqiFax/q?=
 =?us-ascii?Q?pRp/1LPln9RIKQnefZF3LVuiiT6cSZk19UI3xKmBrpPSbd1/N5iIrdPUC3ff?=
 =?us-ascii?Q?c2VKb3VBm5WLuNH8GkeONGY2RkzdSig3qaOTPKp0ZXGGop8rV063DeaoMCnC?=
 =?us-ascii?Q?wKkev0VNLaGLqXB9KlW6q/+XugzHIP0gP+2TQ2QtQWLi4L60v0tt8xl6hRt3?=
 =?us-ascii?Q?5Dfb93McVsL6LLBRXU6+6f521DfsEH6UGjbr30Zx+WG2q3hZlpyXhso3rah2?=
 =?us-ascii?Q?sK3sFf9VBtTVgIwnAiWLkbWRlheEYwCmEs0F07VtoipIUEuTesdIGYNOrBUk?=
 =?us-ascii?Q?6rFZ77jD+YVRa6inSRC2aQZQzHQ39Gbk/Cjmph+U1u+uAxglpdtbOMG5kgNn?=
 =?us-ascii?Q?Q+yugwJsVjrbea2Z/GNsOXJ/zRBpu+tdogv5no+F+fFbsfwc7K+zcucHzjx7?=
 =?us-ascii?Q?79VkGGgUWM/L52ggMjnGi5iLn5qdB/TVUPsJoUk1vWFGx1VIzvjvtN8N1y/G?=
 =?us-ascii?Q?gAisx4h1sf3l+c5DzBr7Pv1+jy4/mn7XkL1utQln4Bqfkz9Zybn0crAmsoeI?=
 =?us-ascii?Q?R1F+e/Qqz2C5VTr+vxJe4bf6mUw2GU9EN0HcP1Hq1/FCC679GVt2Q3LJxIye?=
 =?us-ascii?Q?Y6p6KDodQceuOvDayymm7V5qWCxdfpcGINI87JmRhU6XEoXxGbHuiUgePpFu?=
 =?us-ascii?Q?KgsYcbZ3E5CR+3JZpG0fbZ57JrtuiTix8++CB+n5Xq2tmBVN3oEA2oKjSDxD?=
 =?us-ascii?Q?WtzpW8KbRgxkoyxYkEYimI54512HLn3H3yBjv8HtDSx5PC57YSoDspzXSUuc?=
 =?us-ascii?Q?ZWVO8Ai+b7sDP/V1Yi3r/dxMVwG5xlNJXOhp36k8nb1Dx84cd2jLUvKE6Ge/?=
 =?us-ascii?Q?wEtRVSrIvOiBmLnaN5UbtpUQdlrFSi+trPipgjlgC6wqIbBrdEt0IYkGXaD6?=
 =?us-ascii?Q?nE8XqgO0uIgDHxk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AfjWv1NcxX1KcrY+U8O4kGHX/9LBz0oZwpzRysnOs8S1LJYlmatIMTm7C9q3?=
 =?us-ascii?Q?1ibOB6eaYv3SosdC+ulwpkZTY3r/wlb0R7ZR0RwJYEfT33viK3yX3uHbBHdI?=
 =?us-ascii?Q?BkINFcItFwo6mDLHaPM6wqG18IN2/12yZILAGN4iEx3YMzzCRhDsfljPa5qG?=
 =?us-ascii?Q?gq9dgOyE3Jecph857ZVSEq6E+VfJ7bzGAEIGdU4Dbqsn+vULt9qoVidObrET?=
 =?us-ascii?Q?m4xG2R7Z6uJ5QL2T2eD82F86dBHXFSfG0GRF/JPQeRz7LYISk0bo1Oxoz1cX?=
 =?us-ascii?Q?A5Jq1OD9mKSNz4jh38WabsXRpnOaa/mX8tITvxqzWPyKc+hEP4h/RRBXRFP/?=
 =?us-ascii?Q?lDXIqUmvwwWZFQ4kqQjN215D/6JGsTmSdTA0qp5ltgdKpG43qZ0fFjk73LaP?=
 =?us-ascii?Q?gfN7+gdVpcvEhukWHWStgJ2qM6BKj+B6mQCMEXXxTzb0FtNvmr30y6q75cHk?=
 =?us-ascii?Q?lKzmc4HWN3cDrYwEk+naK+zzRKRsBv4Wx/twQFZHWx97i6UjgzkC4Dh9qtmF?=
 =?us-ascii?Q?hS6p2LRoxcs2OYYk6xo6AhbsnyCTbdWhbiDq0hcKb6AoTygbn9lf4GqnsO2d?=
 =?us-ascii?Q?L05sYb36LYNmACYZ2FklfS0q8RgS8zlsdQoo2P/fMwdMb9pqkrurOay3vdO2?=
 =?us-ascii?Q?VYf0YU7L9gWac0Ged+iIgweS3CqVCxyrxIz+ZLOlDM4CpnmT5KhxbfAyNQLt?=
 =?us-ascii?Q?X16mNGVHVEbbJLoIKuz1x37ikT/OxIrTKYeRQ+LyyFQeNJPBzQchXvrkJxmO?=
 =?us-ascii?Q?ZVki9iJwHvOk8Pj9ntYcXAi9NHFaGmD2uyUOcC9prwg7871KHmnX5ovmwbY7?=
 =?us-ascii?Q?Rz18yIB52o/BY1QfB0hp3UwEYAte+9GtUu1hmV0WJyALWi+oGsJP8jVaIKhp?=
 =?us-ascii?Q?+1RWusTQmJxUzq8aOMwM8aZA2VgqX1n37VyVpfTMWxii6uRcdLSH4TLgl4Jj?=
 =?us-ascii?Q?hUFduUNaRHoYoSIepu6DU48QsUy64QqUmMyoeR6aJ52uchxieHsp5/OWnX3I?=
 =?us-ascii?Q?C/jJnGXaaj4SvU8WkGFmw0zhyqVWuqVBHBEcI8hsDd2RUx3XLaurS23OF+Nx?=
 =?us-ascii?Q?yTjOUKL/GYY6M9OmwFTrGXAAJApjaoG55ZUdfZtMr9Q52G+P57jaVUvqHzaU?=
 =?us-ascii?Q?o2noA8U/jRD7wb82SYM92yjOtro17J2TkGf4KZ5ieTE6Twt+zJtUJKqCnP3m?=
 =?us-ascii?Q?DzLB8PsWw7RKD4O+U2GRAFBZ8g64pLgspdjEBeu/zQAD9IxBtCUB7wZftSYX?=
 =?us-ascii?Q?X8vFSb9MfDn8WDlFd8bgmfqIkXUsjCZB+TcCJLdSApfUIvMZAn1OlPE6UKHK?=
 =?us-ascii?Q?ZFxSLRX12gu2EGBBz8f3+/DqXTflawQUnclEDztzkGZZk3e/aAfoqPdm51Zk?=
 =?us-ascii?Q?OWOWvlvwEViKaZ2yOvduW67Tb68qR+5ffkiBcYHYeTzrgE/pI66MfqIutuYQ?=
 =?us-ascii?Q?JkjmeksCK4IKJNTV07ulR9IESw+HPEUHHUtWdIr/WByjIa2QtIcYOMPsWUE0?=
 =?us-ascii?Q?cr0ftbIfWucwKFNU4FHY063c92oDyhKSgqYWLBVHZGmDOBo0SGURyJHgue3J?=
 =?us-ascii?Q?Zpqbt1l863dHmlR5mMiWP1cQYTNFo5XFfi2MaBUD/VQmI/pVkmFKXtKrvtZ7?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f3bb3e-fb1f-4da7-2814-08ddc440f42f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:15:41.5672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJ/AMD7cG467OTOhhLbO5h6cStO8el0MxYgZWPpg10ucPadz3sObokxqKPC6EI+okIH/Q53PbwPA3xfBtNeUdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7820
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
It applies on top of Peng Fan's BLK_CTL patches: [1].

Also, included in the patch-set are a few extra patches that the DCIF
driver depends on for functioning properly:
 * 1/10 - 2/10 : BLK_CTL driver fixes;
 * 3/10 - 5/10 : add support for i.MX94 to fsl-ldb driver. It also
			     contains a patch (4/8) from Liu Ying that was already reviewed
			     and was part of another patch-set ([2]), but was never merged;

v2:
 * reworked the BLK_CTL patch and split in 2 to make it easier for
   review;
 * split the dts and dtsi patch in 2 separate ones;
 * addressed Frank's comments in DCIF driver;
 * addressed Rob's comments for the bindings files;
 * addressed a couple of checkpatch issues;

Thanks,
Laurentiu

[1] https://lkml.org/lkml/2025/7/7/78
[2] https://lkml.org/lkml/2024/11/14/262

Laurentiu Palcu (8):
  clk: imx95-blk-ctl: Save platform data in imx95_blk_ctl structure
  clk: imx95-blk-ctl: Save/restore registers when RPM routines are
    called
  dt-bindings: display: fsl,ldb: Add i.MX94 LDB
  drm/bridge: fsl-ldb: Add support for i.MX94
  dt-bindings: display: imx: Add bindings for i.MX94 DCIF
  arm64: dts: imx943: Add display pipeline nodes
  arm64: dts: imx943-evk: Add display support using IT6263
  MAINTAINERS: Add entry for i.MX94 DCIF driver

Liu Ying (1):
  drm/bridge: fsl-ldb: Get the next non-panel bridge

Sandor Yu (1):
  drm/imx: Add support for i.MX94 DCIF

 .../bindings/display/bridge/fsl,ldb.yaml      |   2 +
 .../bindings/display/imx/nxp,imx94-dcif.yaml  |  93 +++
 MAINTAINERS                                   |   9 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts  | 123 ++++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  56 +-
 drivers/clk/imx/clk-imx95-blk-ctl.c           |  51 +-
 drivers/gpu/drm/bridge/fsl-ldb.c              |  47 +-
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dcif/Kconfig              |  15 +
 drivers/gpu/drm/imx/dcif/Makefile             |   5 +
 drivers/gpu/drm/imx/dcif/dcif-crc.c           | 211 ++++++
 drivers/gpu/drm/imx/dcif/dcif-crc.h           |  52 ++
 drivers/gpu/drm/imx/dcif/dcif-crtc.c          | 695 ++++++++++++++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.c           | 282 +++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.h           |  87 +++
 drivers/gpu/drm/imx/dcif/dcif-kms.c           | 101 +++
 drivers/gpu/drm/imx/dcif/dcif-plane.c         | 269 +++++++
 drivers/gpu/drm/imx/dcif/dcif-reg.h           | 266 +++++++
 19 files changed, 2314 insertions(+), 52 deletions(-)
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
2.34.1

