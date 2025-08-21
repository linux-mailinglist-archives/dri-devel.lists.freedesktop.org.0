Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4222CB2EFB0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 09:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB57110E889;
	Thu, 21 Aug 2025 07:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NFUU7H36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013050.outbound.protection.outlook.com [52.101.72.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DF710E889
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:32:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3ZuufFqELjKgu+mZqIsyEMoyllCZQTSrOakwQWc43rDQkXahWz8R35HOHqmPEjgG6QslKUhRqv3xM80va/YdjcjP7UWapzlTyVAvstP8q+juWD1VQs4cICxy9rm6zeNxtJtLgCmv+4xFPMI+y17CaNe8o/9PdELygD46bbKzfA6slW/rkgQR3ZI09A/h5lBapbrSa8iJsVZGjSbqXgbb90aZ2fvmP6MnH1KlUzcn/E/jL+gFKChqAWAPtX/ktTmOX5bM3srVTkGs+LpqIZO5hcNr1mtKd8Z4N51LDWY0EzSUaM4OUPzNVoyFl8opaQ1FFn9GeFXjePD6NIq4GY/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7eGh27JFpJchx4tzC/K2tkkcR51sNynsSDLtMpHPPY=;
 b=qP7ggRKlx+BYuTCNe7/OpZVYUDVVrNPnyzncDMwHRcgnRHivwFsQrmUdbCcBnvEoJio4SfeDeuRP8A6m8sVrhsxdKa0zRVY78c45f28vzVbiJRodiuDN6jRs4KYqwkUdB6/dDTk2udp/UdTqSTeaS/4gJ1b1S5n8XNaimxIVkB1SR6gdc7SefPnkItM60gl5/r0eHAvt2CG03StJ6xbIRMUhT+iYWwLf+zGPlV4Ou8LTHZFo8VxUwUzLM8gxrpO1l/J831eK48A8dfVb0XcseNoemgCz2hgz5owE751grs/hUwFSGgkqLEP6lYlDWEJIQKzmIOdhVmwDx8DK1/KeDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7eGh27JFpJchx4tzC/K2tkkcR51sNynsSDLtMpHPPY=;
 b=NFUU7H36eBYtlmnsRvTPyA/zWK7hV6BK1ACPovRp2bGsoWDmd0odM5fAF7RV8G+n53O4IIP3H70w9WkI+OZxuOxQilsdgAT54Em6RjFcx0cVGD962AA/p2YIhgkFjXGHLBYb1svPtIYcIAroGVfxWhHwyUTCewkZErC+Wn6fS/M4L6VPZPw0aDp21B6/zIXWDHpxlYi//qs2JxdPPwMGdWxQnsN7FoeZqws/R11/V10sy2FRyareZcg2PSFEzsXCj59HvM7tzxEO2Gu0qC3Ij2USoSRsO7lrBDHDt62TY2oDY8uYxsVH8TS2S6SJEgx8JjKlpGZKFUUhL4i5SP4n3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB9377.eurprd04.prod.outlook.com (2603:10a6:10:36b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 07:32:33 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 07:32:33 +0000
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
Subject: [PATCH v5 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
Date: Thu, 21 Aug 2025 15:31:24 +0800
Message-Id: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: ae33616e-b249-4a31-83b6-08dde084e495
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zH22DUTEoWLcsfAniVDj7hdpSuq9NbvHQPxD/+4RvdQtaAeCX+SjKdMs8te1?=
 =?us-ascii?Q?9LNnTyFb8YX5o4xakDrvn9kYOI9FUSlLxypqx1FwyE6XpPywf7/S7NvUlreU?=
 =?us-ascii?Q?RZLY8RBLiwl1BrY6/aeVSqvFuEjb8Tg7aXKqMOWYwB9bh54JFqkjvUC8vx2Q?=
 =?us-ascii?Q?waDS88xfcC1bWx8a0D16jsY8qRoQlI9iqWzCMUHO8241RA7tophkjkDTqcKN?=
 =?us-ascii?Q?xcTDcqrDpdyqZ2xI41W5FopZFnjQ5mcnI5gsLnEbT0WU8ocfShsOZaYAWagB?=
 =?us-ascii?Q?WtwLbWs5zOgcQF3RFCryB6vzm7Ye2wvJx+bAWvaVBvNgeLpt/MxO/IacNBXf?=
 =?us-ascii?Q?nLseozTYrnvoAbxvZN/MdpiRiwP7k3EWap+Qovj50rjWRwz2QBQOZULhlHgu?=
 =?us-ascii?Q?YO/nwnRwqqsytHcc6lN9hgXhhSpADALtf396ipfFL2NGPQkRhBCVIZVxMiuQ?=
 =?us-ascii?Q?NqKikxmt2rgjz8ZVTTeXMLcBk7ODCBZVZMoVneQ5pu17cGYPvUWmf7NAx7h6?=
 =?us-ascii?Q?Te4t3/aUd54w2+XuHFIDfa+A68Du6ocao8QBwJAReR0deHMcjiZcqSiEvKpH?=
 =?us-ascii?Q?8j2XJSVpmE18wPFuQtg+v0Y42XGbaVtN4+7+BweXFfTY6fz6ZCnhry5I7Ig2?=
 =?us-ascii?Q?3z9vB/rDnhMUsyd1sXSL86EIk1WyMFKY+eN1IiJCL3joUMNKMd7m6iDSd6iQ?=
 =?us-ascii?Q?W52KxiMY2MNrgncJKN8/CsaQzTCPJQbCVXfoAdE2ZB3gkTjv7JCA+LgdxzAN?=
 =?us-ascii?Q?ZT0DyX8D4FIfr00xEsfs1Ac3Jjl+fZypVeQof3FdopMvvQNzCg7IKSc2Xs3s?=
 =?us-ascii?Q?eQtJ2uwLLYROUTE6qy4nKSHYm1Az448XV+H8gmS6EanLp+ynIrXMLoFGjq8v?=
 =?us-ascii?Q?rzna1shn2hdh7i/uCMITh6NBsyg9/ed6jzDTw1VS+lKonzRbamjBwt5e008b?=
 =?us-ascii?Q?RYjDkhXDmaDdn4MzudTOXlqmT9AIxHe0pO3goapKjcRjqfd/OwSXsP208Hn1?=
 =?us-ascii?Q?MlYy0bQ+f5EUjeaaBh4Lv/D1+p5qa5KHvxZN+8N4yElvhlWYwc9SrXkf1YFD?=
 =?us-ascii?Q?B0oGKCj//xHfvrTWTvqvy5n/7oXLTQ+LAmNp77OVy+wu6D3kHecjatzu3yaL?=
 =?us-ascii?Q?35gLPMMPx8j1VmJF/KBIePVF871M5+2fZC1l9vwkuklOUlk25B7mdSTpeYQ6?=
 =?us-ascii?Q?sXTlOI0FTPUc8gmLJUdYfFf85CF+NJ/qX6EhcOMtCbLGwh3XbDho/WcPCx2X?=
 =?us-ascii?Q?c9fBu9SuvfGpdgrzmI7i6oIOYZv70b44MtwtRmAOR5ZMLiQDZlu97YVcoIYQ?=
 =?us-ascii?Q?CI0fL0nzoy9ls3AMz3UTlUZSBIH53u9BbICVm9394XHiZoF2RhV7XJbOOsT0?=
 =?us-ascii?Q?lPmzQyFzlAm6IUuYwYqc1NFk4OVXjywnPTk1BSgJ8SPzmjwGRkyza7MlhO+0?=
 =?us-ascii?Q?QnQTjrCXWnJIyu3FkjjxNrpOx041vsdxdDV7dT8c4w2Sro+hToZHBypxEHyq?=
 =?us-ascii?Q?fx7/ZoKg1VSlnec=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(52116014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N0k6xm+NlY5HCjDJ7lcabbFviCxewxt7g0QM+5n8B8YvJKYz+a3Qj4lTB7QT?=
 =?us-ascii?Q?Z3gf+4B0XwpY6X0wEyoKKzi15nGqcZfZq5WOR5c5ZoXm+Q1Nt87KO3USFn0G?=
 =?us-ascii?Q?eBWM47A1emyklfa2KkwpMJQ4MLaSA77yzolaZDct65y7Hbko/SbvaCY/MFLo?=
 =?us-ascii?Q?vOo33c0qIYOvQjbpL+AsETWI8cNE+iwGrMgEUb+TOJqUPBsU94xtdXvOq3Of?=
 =?us-ascii?Q?k7TNK2ER91sbzwDJ/j4LKbnmb7iVLuZMeJtdNOJHUBN1J3wFol4e4fHQZqhL?=
 =?us-ascii?Q?rJIA/YhvUMXEXvILv3lg5wQQcOo6eOx/WlVfd/2XwN7d+RuBXcCyXtpHRFwh?=
 =?us-ascii?Q?Gk76nY6zQXKnr9V9RYR7HLaorIYjKtMImVUkhm0Dp18a8X4X4XiH1umtDUMm?=
 =?us-ascii?Q?4W0wCOzCvegEcQsn/2CfoItnFBlq2c7ClLqKBCxJYHhGUYlnbfeAInU7Sjcu?=
 =?us-ascii?Q?6dirrGCdvey2ms0E/1Cxh4MF7XzKDU1gMUF/Kxyx4fIyT4VEjyc4/lDLxyPO?=
 =?us-ascii?Q?qfqGABmxwH/vZp416pE3Kk2FN07tLEPOTW8pw0/47aJ7iEsyX1MtyhlSAp0b?=
 =?us-ascii?Q?cek4S30Jw4uIUXoywjkaOPfo0/yBCwaHpqf/WIfh4v/9RPg+bqhFuALeOLFC?=
 =?us-ascii?Q?VyjlWPscyC/CrZrtJx3UXRh8uupF6qZOkp4Y+hRb6JXLFSRLb6I5/AU+/h8E?=
 =?us-ascii?Q?RVwUpwuztiTCFmV+WjNMp63KfYjwjB3dqLfAnIQZW55Dw3uVZaDC9W7JVmlv?=
 =?us-ascii?Q?S+jaHVzK1sYrIynlxiE1r7Kkle1+Jh60rmoWeddTxFqkQFYTQv1AUlSrXc84?=
 =?us-ascii?Q?H4KMhiIoKSnj8tCiMBIa0Qa3WfkXBYv3AmYNK6AI65TMJJVVgsxvsdzoKk28?=
 =?us-ascii?Q?gQJiKnMqdiFVrl6uXr3jxcK6CBqjTbGyVsEuhhDBekU8NVhsT/M6EEXmLMUy?=
 =?us-ascii?Q?/9HOmo378Uwqn1EpYmuMhtpQuq6sjq25XsQbdDr2npxr7XYnIPc0SNPSxDBA?=
 =?us-ascii?Q?7sEZpa+F7BMi6vxdbGcnsmQF4r9D+tPNAuJlRQrWq7JXqBmWjxG7rFMUqvUq?=
 =?us-ascii?Q?BRbhL8NhiJRi0/qtX43sC1WBnMKNywFeBkvLXtRPgNV+xvdUyOPs7Zs3VaRe?=
 =?us-ascii?Q?D8rEYXgeC8IdD9k8/AOcKcRragfH4WfAc3tTZsQbk3abvtmQu3z3J2D0b2yQ?=
 =?us-ascii?Q?oevAF8ERiqPfvGp/wqiigdUi/hNJAK/12QRvgW9lg0iM86S7ZaY+ELzk8Nmw?=
 =?us-ascii?Q?tA6gu4Ue3h0e8liT5lZywLSHSz6a5FQoCoea++d7ipOgACAQzcD+KVrPMJh0?=
 =?us-ascii?Q?8Z9BAi/vHPBf5AdJVAU5CDlI+gsvz4YiDJi2BMq6sWzLWTaHfe4CwsoBfRaK?=
 =?us-ascii?Q?N2tAEwmoe43Y+fUDeltRk5z7ucawvVUSVNgH3OCyLI6ZjCq/tsjTKCJAeBIT?=
 =?us-ascii?Q?Psx4/iGgspLk+JmEA90FBf4/4GXEcqySWCEnTByy67m+spGiTOGpVwLjluz8?=
 =?us-ascii?Q?Z7hGPceyuOTNSesaILn239hDnQ9aH4Axc2VMYY/DGlpOjgJyGLmklOGGqYad?=
 =?us-ascii?Q?Y2tONLOM793lSqvZatCiqqlzTT2tO7BlQofqFipW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae33616e-b249-4a31-83b6-08dde084e495
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 07:32:33.3874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuLMJeiHiUtTGu829qjHqGXlAvtzmVp4QVzyoOSZNeZZInG98wbBZFlr5jNhnynSj+fC1/9PyXrfa/3yGihLEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9377
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

changes in v5:
- add empty line commit message for patch 7
- remove blank line in dts node
- add component_unbind_all when dw_hdmi_probe return error

changes in v4:
- separate dts for soc and board
- bind hdmi_pai with hdmi_tx by moving some code to .bind() and .unbind()
- add "select DRM_DW_HDMI" to fix build error reported by test robot
- remove unnecessary code/definition in pai driver

changes in v3:
- add space and 'U' in asoundef.h
- add more commit message for binding doc commit
- add bitfield.h header for fixing build error

changes in v2:
- address some comments on commit messages
- add two more commits:
  add definitions for the bits in IEC958 subframe
  add API dw_hdmi_set_sample_iec958() for iec958 format
- use component helper in hdmi_pai and hdmi_tx driver
- use regmap in hdmi_pai driver.
- add clocks in binding doc

Shengjiu Wang (7):
  dt-bindings: display: imx: add HDMI PAI for i.MX8MP
  ALSA: Add definitions for the bits in IEC958 subframe
  drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
  drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958
    format
  drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
  arm64: dts: imx8mp: Add hdmi parallel audio interface node
  arm64: dts: imx8mp-evk: enable hdmi_pai device

 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  12 ++
 .../display/imx/fsl,imx8mp-hdmi-pai.yaml      |  69 ++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   4 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  27 ++-
 drivers/gpu/drm/bridge/imx/Kconfig            |  11 ++
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 158 ++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  65 ++++++-
 .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |   5 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  18 +-
 include/drm/bridge/dw_hdmi.h                  |  11 +-
 include/sound/asoundef.h                      |   9 +
 12 files changed, 382 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

-- 
2.34.1

