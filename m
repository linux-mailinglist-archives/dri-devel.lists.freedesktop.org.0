Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B2BB1018E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0844410E89F;
	Thu, 24 Jul 2025 07:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="d73PELfu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3591410E89F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JzYKtLSLk+Umd5SRPU8fd+StENgtfd7w3AMeXL+zk6h3hy4OQ5dXFaLUFnGJjSFNvJCylklw4hX+rNQ3pfjeN1lFRj5hEYP06Fcy+ANBJ9HWE+WTKSEQkDWtb8LJfwvL9dhP6bnMKClIrF6Esq9oGuXOyO4u2zI2KhidaQt790eey2QVw+GN6ttS7yJIdniuDDe6HIytpwokFUWeFRKEucc9CGqYrgpAf5RgnCrbsPgY1Jllxa89e6rPCK+dYgCeRN/gDpYAF3Q5ppE8YVftcyaTxSWQJ3r1jahKEjE611KJRZhxLLTfbKhObRzkQ81CT9+dTvOxjrqyNjxSPfUzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjTil86IfMqQ9gWsJoJimyjfwWfXqIgyw8TfV/IbSYU=;
 b=R8DRb9TAw9cxEb+agkNdFUL6OuJ/+8l5fYsfIi3VkUbQ3IYhG/4Q5blR7kmeOjA420wFdZtN5KiPPJbusZt7NWdEw62D2Gkp0IdFPANMP2navBjXSXnUc5R2j2jTZxvePobxlhJIncli3NCcFGlcnY02i01il6sYS0CFkmW1gNrNktgGHn3ewXGiM/QiLU7mEj01O5JDql9Nv8p7u9VCtO/3+H2bKkme9pWR7iFtzNjYeX65QnCnzKRZfa8mbiCgCMH759aRAXJPAhrdhnyjKasBFTqpLxM1t/j7eARnHc5Yr4hcEGHVsZGm/nYm8X1TBBlPNN/Fyx4phFpUQXI/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjTil86IfMqQ9gWsJoJimyjfwWfXqIgyw8TfV/IbSYU=;
 b=d73PELfuaZxsg46tJj5NW4GyU9voy0orgjfUX7Ic8V+9PcFmFW4rWmssYMQHsNcE+zPy3c9hVc1+lGmqR1k/adxCYYWINX8N3UNMSSA8NF0Hy/u8RtlpXPd0gkjjkoP/XYe+hHdPBhQaIJEGpGn9eycYIZYM5HQkLtCPPyK1ncRos47Nt8W9NTWqGDbwb0WrN00GjqYyG7hp0U1fdttYlwa3g5ra/Zkd2HFP5DMlizMv1WLCcI3Pn2UYMxwuJoNXn4N/qlo09Xvx9grgs5ko6t0Z6wBa/WJKf9hu0LM3091B6BhDhWAATr0MINc4+QGADZUTbMQTZUQGJovyMAk9Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 07:23:15 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 07:23:15 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v2 0/6] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
Date: Thu, 24 Jul 2025 15:22:42 +0800
Message-Id: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM0PR04MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: a08e4933-d104-44f1-fd48-08ddca82f446
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?78V3s+MlVPsO5QzecWkMkXeIou2Y6mSl1IZS2qkbSd+ImvYp1ehliXH8qZFv?=
 =?us-ascii?Q?myNkCTTbXllBQC+OMevKOqXjyxf7f9ouT5ZuvPPyfl2vAj+bVxJs1XgBhk9Z?=
 =?us-ascii?Q?w5DrbZHyneEVJxDZDWTuxEu94qmkp9jkDYWuk7ocsBfxGLDKjiknOTB2WolH?=
 =?us-ascii?Q?9aD/1OmGVMaguBOOraCuTSyVeburlJISSRU19IvAMfH3dzlmqU7uGNfSrpr2?=
 =?us-ascii?Q?FolmtLSkwnwKy6T+YHl1C+rQJtwZCIBPCWlYCeWzTDR/zsyx6R1bHPIgp03c?=
 =?us-ascii?Q?7gHg6k7feXoW3FlJ35nadultjtwaGq6R5xFGoGRn3TjGCqCguokY0iTK48Xf?=
 =?us-ascii?Q?JFP9J21f7v5m1L53AwibIQzvhKVX2y3f2sBz7W/IrcCYsycJ2Uszej9R92qL?=
 =?us-ascii?Q?GBQ+obszcgS7TjUrsxdwJsJcvXghV+BK5M8lzNxWyea3Fau76ddsgyoEFU/w?=
 =?us-ascii?Q?NA7cDTvEgtJq+/LGpm68DAyGxNkqxm7cv8sqqrDHex28viaZg9cgAbJATypC?=
 =?us-ascii?Q?/oj+72OgcuoGYS79rorr0eBNflpz4S409Po4mynzIkqIvKqtNRX6RrX08K1z?=
 =?us-ascii?Q?PzP47mXeHX8nql5CmaRb+MoN2qbhhcVa2nwrYWmwFTZ6fct+1uOMV1/LUdyj?=
 =?us-ascii?Q?DBrzUNVNuSa4GIZV/hL+xa1B+FQRen15kj58WUhUt/2NdGyKdDecsEYbB6Ii?=
 =?us-ascii?Q?kdy0fldyOfkFxpAcNcHMbBRQOmTaxOpLXkEjNsZ7VFhrAJAshqGOuhliW8QJ?=
 =?us-ascii?Q?JSNg83fXhA2xq1r97Sjt/pP/ShrqlIgfMQAnVEQHNhdoIRqgMLShQC8k1z7M?=
 =?us-ascii?Q?QsY2knNa33MJhXjE6nHveQdg4PJlb/DHvBtKGXP6cVNJIdK+OcqckvYvVyVY?=
 =?us-ascii?Q?L/MoIq12L35qZVIcqIUK/y+JXaM0Wzjtc+vU96d1Xpr7DU/f3K6whMrmI8yb?=
 =?us-ascii?Q?KzKJJzru6FYslR+saUWxQo76zBAbZyl6gD4+mNKR78k0NbiOoJGTgAjQlHNR?=
 =?us-ascii?Q?33OjK8bLE8YPf242zd4fRa4G3csWSHgD7KhfFws7+U1ai9gYGf0FaE2G0kNr?=
 =?us-ascii?Q?vgGDKbMZyyCqPVB2FcV00QDVcv+jm3zafcTgKvWDPztX3satj8hKG/vGsRbn?=
 =?us-ascii?Q?HFkLXOmpJKtCVg+N/1ZWyda0pKilcuGffHNAEHzC9bw5mpXSYuLpYCc3pXFD?=
 =?us-ascii?Q?T9G0caXxbDCU1462jZhilDk3TaB/Udvqk6yqucGyXikh4epn42hUiTy41lr2?=
 =?us-ascii?Q?3Ns9sR0gLmDCjmibqT4JxHq2XHV7bspgdc3TYXUwDuMRKNORgV+g8YyrBFT6?=
 =?us-ascii?Q?7/E6O9KQ0VCGsz4RPvLay+3fIhBAlCLGJ2lRHrs0GnWXdTjjBI2xGk7fZrX4?=
 =?us-ascii?Q?B2geK/fNuD4gP9OpSu3zYiz4dSkhMq6lhqwfD0yMVyJS9yUpmpgX6ObET/sF?=
 =?us-ascii?Q?kWUDs+cpskDw8FEBD1nB+1CPwQuDyxvjR3JqKBsp2w4y6cUVseGLoFRUpSAv?=
 =?us-ascii?Q?SnjVBP2fDBzKMgE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2GySwniPuSBmLiHXact9kuuGTpLmL4poY7rtWO4MG2vmcdrqsHxcNsk/WlSd?=
 =?us-ascii?Q?vlgqRpMAULqewxMDhFPxElSFRLkv0fqRqHPxvxCD7/H1VYbCrTu7sNUkX7gK?=
 =?us-ascii?Q?auIZwOsNgD+goraXqt9sl9A0TN5YYkxf3k6xCCoGeBsAi9gVUYZC1MKJ/QuE?=
 =?us-ascii?Q?FbZNyyF0CNEfogO/YhNt31PjTorhKJv8nPI6q3n51I/2P4/yyJQa7UX9QRu2?=
 =?us-ascii?Q?LePYTpWc1wsr57FFwqmXyOkiks+k+SSavdJ2Wr9yrmZtfo8e8JMzrhi/VJ7F?=
 =?us-ascii?Q?JT8EGctfpj1YtjwSYNqh+FK6Rx+VYGe7ezV0p3lGDgc81ExhNVNBA0MX/asJ?=
 =?us-ascii?Q?cjBsrrHmHjugqySFgjl8VU58K62Zljnr8+T7RFK+GTSSFzQXymoO1vpojAVA?=
 =?us-ascii?Q?LaN6c1KIbmRSA/9A73V1K8uW+e6mVOehaRcvOJPQoC69bBcI+X+AoveVfUzi?=
 =?us-ascii?Q?qXWV5hrO34h38t7rUuEGoDMW4AjpCvsd2LIjmBk59CQQWPVz88W2O0fUPZuE?=
 =?us-ascii?Q?EpSaFqJDyaB5wA3rx+4fJLHz83l9skvOpahgdc6PiLKWw8g5g8qnaCSrexRK?=
 =?us-ascii?Q?GRdQJnMWtQDutN0RGGK8SXMGOCg/LS9X4QZnnqmkOWfW4G8oVu5jrzpOuZX+?=
 =?us-ascii?Q?pIuWVxBj1lWGo4DArABSlTr/s8WspFMldN90OuskGF8DgReyQa7R1HLYoEW0?=
 =?us-ascii?Q?/xaS7JpHrkO/T0OuGwB4rT7Gihb9q/FFQQS/RCCyZ5+i+xPIzUiRNx1eomG+?=
 =?us-ascii?Q?bnccoq9YO56egOprreAhTyTvY2wwvfzSvYHacoWyasHs15gurAbC5PoXiCqi?=
 =?us-ascii?Q?H7HIVfPv1i/74aXxcr6AaC6zwnKf12kXbRlxTi7wHR7etHc4Zm4qdWWMB4H+?=
 =?us-ascii?Q?o2cFMO8OAV6Imbt/QHgsKIFsL69znB4DpH2s8kem86FeH6ABHyjLGjDRLQAK?=
 =?us-ascii?Q?DLp+O8BAurXtVLHh4fwnSSPxN921DAfBRY4PBCPI8UrVvfkgHOluNcZW5eOE?=
 =?us-ascii?Q?YyIM0QPY2Y29ffjQEvjx5B4r0I9CSF1Rn9A17c/I4gLHXFvT9D3YHM8oPHQ6?=
 =?us-ascii?Q?g/ozY9lOSStW8aAHZNtVHeTmFUQfeytgSb8npGiQHR/YQDoP9/O6cTUsYdtE?=
 =?us-ascii?Q?yAJc72JEeNc1e+bO0qt74k+hrWrzTyTvJDvJTM0qXezQbm3r5J5lRjF4+5f6?=
 =?us-ascii?Q?dP8ekNFqalWlj18pwGORz3nnHCUcneO49N3oHLQqK/AfwmZmaYco7I5AtaRg?=
 =?us-ascii?Q?I+PAMvChrhj3XtxRJIhiG+iFPnQpvEetawJJhEiNPlBdAxPGopN9Y1IxLCY5?=
 =?us-ascii?Q?fzHdURZVROynxwSvDCsCxowHnbcu4LbJLlbHItTgrtpBTQtgyrrXWeHpK6yD?=
 =?us-ascii?Q?BwIm/BUIHOyO52xchH4N1P5QbMYJ9k0wS20fFKcVHzpXjpj6hGyteE0TSz0p?=
 =?us-ascii?Q?HBxCahl8MamM+skcypTMH+V1fIAVWJZoA91/ktLMgzXGgMz6qKl0D7MtUo89?=
 =?us-ascii?Q?CrmnxqgYMkeGjC1ZUa8wgYKODKfUSKNmvO7t18/H5V8FVbdpa4Z4xyscm2Nv?=
 =?us-ascii?Q?jyYKj4jzBndW4fteJ54yjnyji+y2ex33Ed0+PnG8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a08e4933-d104-44f1-fd48-08ddca82f446
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 07:23:15.1888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNVlWGnH8Y/RpsTtRgetFgMWVd7l1+Im92L7ZiXMNhQQz3En7IQj40YBNXs5gQ7/Jeen/FJshZp71SIGDpD2Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915
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

The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
acts as the bridge between the Audio Subsystem to the HDMI TX Controller.

Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.

changes in v2:
- address some comments on commit messages
- add two more commits:
  add definitions for the bits in IEC958 subframe
  add API dw_hdmi_set_sample_iec958() for iec958 format
- use component helper in hdmi_pai and hdmi_tx driver
- use regmap in hdmi_pai driver.
- add clocks in binding doc

Shengjiu Wang (6):
  dt-bindings: display: imx: add HDMI PAI for i.MX8MP
  ALSA: Add definitions for the bits in IEC958 subframe
  drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
  drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958
    format
  drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
  arm64: dts: imx8mp: Add hdmi parallel audio interface node

 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  12 ++
 .../display/imx/fsl,imx8mp-hdmi-pai.yaml      |  69 ++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   4 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  28 ++-
 drivers/gpu/drm/bridge/imx/Kconfig            |   8 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 204 ++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  55 +++++
 .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |   5 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  18 +-
 include/drm/bridge/dw_hdmi.h                  |  11 +-
 include/sound/asoundef.h                      |   9 +
 12 files changed, 421 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

-- 
2.34.1

