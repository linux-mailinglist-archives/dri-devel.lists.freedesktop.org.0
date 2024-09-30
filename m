Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761BD989A07
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 07:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DF510E05C;
	Mon, 30 Sep 2024 05:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IaMFFIaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013027.outbound.protection.outlook.com [52.101.67.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D54110E05C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 05:28:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBOtSTcLoFDt7uN9T7GI//YOXq47DRcEfFyTJH+OKKFnHn1/WOY99NcMVHn/Y8VA6g35/mgdG8baqbEFJBVNt4GMgS/1gv4nWxrv9VIAT2pNJ/JJ/QbiH1rmAX5KbUrRz1mIT2RRmTSQ+c08RhAgSsmS612lMDs7C6tSze9E0rhtc1md0QhUBJegZpQF12lqnibMCiiwcCpYTpC/YD75eCDBHoge0p5HuPLxJqOZ7FMqqLTdDvHH9Xh2T3+ymEo3xkeLwWhhotmPqfQPPVGD35lxjlrDoLwC20op5ZHWIQMkYqc+fDSjC8b2hWvIzuxckW084K3iL18BAo95IwxcnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GW8IlsCZBHX4E/aNs96ZxCcnocJoNyvqPyUxKws1czY=;
 b=NEQe3CFxyUHgKvBxiHMFU6x5NFGeVe44E6hNgOeb0LkStbmPaBtHqClhPRqxpF0iBWgeAsXvGRdGIY5ORcFCXF/jRvmwKXg4Rm2eAI1wMXUFA3YnM9ux7oaalI9/l82ysQlb89n8vhm6AtqkNMo1p35S3T92LbWiqt8FX6UtmJmfIu4FFqVy2AW0MGkE4lecA6nxieMiIMb55OQlK6E015bMFeEAIG7sR0fX8NK1wOSPHdpRr3KXgLvkcq4sa91Ep0ZQbpndrzfW8Zazp0OTiZnSSDIJ4mFiyoy5900MpgTc0RwvTrft8jGATnDEtIhrup3O3I9Cs3QJkmrBj1802A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GW8IlsCZBHX4E/aNs96ZxCcnocJoNyvqPyUxKws1czY=;
 b=IaMFFIaZzY/+LKBVa4J5Ozqd7Zznw+HGDo5tWlUkSCScz4ETgcKFF23Ae/36KNDqTHDgmfcCZx1j0CfVJsT6BpSXBiIS2LP4NdvEcanR2R2w6FjXBObmaaMYISDXLPevTmfOAIHlJEV0BwNaJpYTfFrkjn75+unvb0l9yBwKv+OwR3AQ1iYQScZHqdCsy63QUfpnlLD8RCTjEp/k5D98KpO1nn/ZYC85Lk3pgdATRf5+ZdPoC8U9BbS7wE4st0njgLlVhEYzEe7GLYxk+R8t0B86wnOhege8mpNZoTu0ZFz9a4bJVVq9sq7u1CQ863XYsO8bm61vgX2Bsa7v6PUfhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10536.eurprd04.prod.outlook.com (2603:10a6:150:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 05:28:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 05:28:53 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de
Subject: [PATCH 0/8] Add ITE IT6263 LVDS to HDMI converter support
Date: Mon, 30 Sep 2024 13:28:55 +0800
Message-Id: <20240930052903.168881-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10536:EE_
X-MS-Office365-Filtering-Correlation-Id: df498e5f-ef88-493e-8e26-08dce110c5d7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/Ha/Vx0tRKZnt/3b2va9ljPx3AzIe6ZkN6m99NOXbrE/1zKSMa+zBjrndvZx?=
 =?us-ascii?Q?ncGnnrsnOsCWo1PDWBaift29RG+6hhuw7uc+bJWVx18mhuM7a3DJALqlCPnq?=
 =?us-ascii?Q?QXhwR9vnrqbICDnN/v+QSUaDWE6RMgo8zuyrlobfFYCdl7OiFLXd7LEg0iA0?=
 =?us-ascii?Q?3TKsXXy2ufuaxK0ver6VNOiLx72BwwFAkVdBOe28TLrTm7LfBMrNd3b+2hVD?=
 =?us-ascii?Q?of40ZdQdECR9eua5LkIpeGiGnSqmgwrAYNWAW+rBLAnxP9t9WULI3HQo3YU7?=
 =?us-ascii?Q?e4TI9XDawOjChEAvBpe2IxYysqnqYYV3CBuVaf9RU/v8cEBsTRzypfRwx65d?=
 =?us-ascii?Q?hToq+g06DYKbF82pRyS1bChrhWeedZnyJVHClkk0Qqd8bXubvbpAgMuVDmmF?=
 =?us-ascii?Q?Q3dkkxnRhf3mvzd8BLbQXnhBicAKeB87vbZ7/t3vSCJgLo2CCMruZIpqxHpn?=
 =?us-ascii?Q?n6+XhrpKH75eGbMv7XnNV9+IncZRZ95g0a4Ooo1m8G3QVIVtitn9HS4SbeSc?=
 =?us-ascii?Q?Nhc55W0yx1nPFxAHG935YQgSdJTD6dTEMQIwU0L1AmxHyYMYE7xAzZAh4ADs?=
 =?us-ascii?Q?lY/gZW4Hb4Nyao5OTa75u+k1zBrHNPH586bWp2Qzl3PGYLE+c6GUwHRmDmZ6?=
 =?us-ascii?Q?TswoLvcLyXwnBuRUf5CZFh3IsDCGg4DZhme/AQpDTzvngX0a4L/GKRMJHpL5?=
 =?us-ascii?Q?TI+3OKrVLsbMl48AhZI6/LZ+V4PsHeEXUtMSHQzERPnuttHLhFkcC1EzQAXd?=
 =?us-ascii?Q?OlYkvQyDhrRzKevVqv/k3GuZ5An73hmE8vTRTEWBmsFwCDPoU7yZeIgT0S44?=
 =?us-ascii?Q?O4arUYnCwgZ6eyDMSJwRm4HA+7GmLnGFRvc6pSauc3+HabTLwUKAN3LlAn6A?=
 =?us-ascii?Q?pazDBSUo9RCejrtU4z0Ou4pi9uaDAp1w3YMc6PKTmtXc1hpf32l2pZCS8XaS?=
 =?us-ascii?Q?arptThAmDLuOVPtRnxTJHil5corOlI7v000056OIwOI6B+RHX14e7ArAadgz?=
 =?us-ascii?Q?KWd96X9nEc/LMOl9xu9zj1OQok07JfC6SXp4yF/JREYeaS5W86C5GPeQThdC?=
 =?us-ascii?Q?zfz0fprQ989AQ/8hdOEgdHUXnWzFllx5bpFlMtQDQTq6dKmY4hzBp5bwGN+5?=
 =?us-ascii?Q?hI4M8/UuwMAfo+e4DnMR8XalESr4RRzVFADVJUn6Cbh3xPOR6SeIktVfzXQd?=
 =?us-ascii?Q?1So0ddWRuLe0RRQDPcZAOg6Ap1sBA/R7eENQ1YiRGXmNm98U+C+J4DPz+i7R?=
 =?us-ascii?Q?FN6HefRcnlJK59nNoiv6AaWf66Rj+mZMbkc6TRZRv6Gfe+ZvyYZ9NT34HmBV?=
 =?us-ascii?Q?lGwpZCRRf1/DOmS2Ni3S59VSH7frXN7p9CggSgyOGNMdeKmq0Uwz2GONROJ7?=
 =?us-ascii?Q?LGQKJs8mzVOwIjO6cCBge0L9w/eYboJuEG6KEmaFa41P/2m/QA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B3KOpYve96osTXcxEwRfQy0R71PPJpQ22h7ydWpMAXirE35EiwVsVkUT5fmE?=
 =?us-ascii?Q?oCXt6td5E7MidjvBKL+u7+JIVeq/DeWidS7YkfLN+gnKZslVUvp5rjMt65q8?=
 =?us-ascii?Q?lviFZ96lLXfpe1xMDzkCluiL0OyhPgMwq3yVK+pPN3BowonfDIdIR+FbiPzq?=
 =?us-ascii?Q?/YCWDBL7gtUtvc+EUoWob75XwGIqHEnQP8bLgBg73OygEq432Lkx3dfiEljP?=
 =?us-ascii?Q?ywSc1z/EVoJNJTivguh72Y01ZVJm8adpq8SHqD0sXkj1KC21lT3gWv2kGo2m?=
 =?us-ascii?Q?0QPh9GXJkQX0KY6pyfN8iIC6p5xsiqA9y9eslxM1daxua4sVHFt2pqdRJ7bf?=
 =?us-ascii?Q?OK1eZukpNShX6wMLX12Zd0AoBloXsmO0BUFbMdOGcKe+TrXyslAzdrYXrA4S?=
 =?us-ascii?Q?t9GbaxcF3WY87nxVehoZzL+XHYIyf2Ch+pbyizIfQZ6GV3fnn2vLYLeyu64U?=
 =?us-ascii?Q?4FFg40vOF8IoXjK+hqYzI8JZNQ+NF2ycdkYuU79i9jZ49SQ6Tjvy+IJX16Ck?=
 =?us-ascii?Q?v/RMKUkn99ObUv3cZnDzYp9xs5AmK9av5+HiMiGQYf0YjJhj3MLbAdtzrOlG?=
 =?us-ascii?Q?qrvrLC+f7y6nwLHrqiYmTD1WtcY1MfMTpIHGq/craYNYYrONbd9U8iBvZCOx?=
 =?us-ascii?Q?o2PX0Ljao6LeCFM/GAuJJRLVcjqCEyjBny2qw4ZnY3ir0oWBbXjzXwFAbVbm?=
 =?us-ascii?Q?Fr/OnOctyC8IzwhR7a63Z+vXb9OPNMK0S4wEIGFtlQITePgBdwzakH+IFXs2?=
 =?us-ascii?Q?g9YVtwRDjXu8T9CIY4JzUZd4Bm1GOg3osLIgzQHEVMEzPIPW4n9uDJ0/XCkD?=
 =?us-ascii?Q?SCpRh57uWrQIWB979QozfdoozcjGdPCL535eXFAJ05p59d163j8fxpM/QaU+?=
 =?us-ascii?Q?CoeMHS1AiPYvmwwHllYqA/WhxSPTSIVu/NA/IXgNCTeaQ6Z4VLLTZuPV+fXi?=
 =?us-ascii?Q?8wYHFVoHXxQo8G5Afwio1eRmtd+hYA1bPAKWL5P/Fwof+Moce7yncJtnV4VQ?=
 =?us-ascii?Q?NYgREQn+LMPPQOcf+86456JAZM1dkDt3T11oOuF18i+sFATE4B8NZzhnHnfx?=
 =?us-ascii?Q?ovP3HrlNjhLphDqWQBgUEmk2LXRMzNpHTRf0EgzyuE40T+K6/6udgUCb4jwu?=
 =?us-ascii?Q?u0eKn/i5ZRql7yivqCkNibwTQE+1W8ccFf6ibDCZAAfoq/41qUnMR64BBNi3?=
 =?us-ascii?Q?Zf2kMvEmfxnp1XOal33fMR0w4CiJIzJSCp5Aut9K0mjlzX7ygq4Ol/tqG4/M?=
 =?us-ascii?Q?wlo5hl906CSf+jJWGCEoubZQiWDE7/BatEiwqEuwYoqW+BODRGeFFUAe+AU1?=
 =?us-ascii?Q?z1eMBXJ8E9G6acWvhq9nfbYkWXbx3KR/l+mNFOV+u6JKpjUZoWRmqtqaaIpu?=
 =?us-ascii?Q?CIaJDy99yXoqAglvdpT1EUZdAKIvgbqdfm9kLFbq2WfbV1bj1SX6NJI4UoWm?=
 =?us-ascii?Q?wuI10CguytAuSvyFGylq0DrD6mzPvtD+FzOkMawJ+LBobj8gTOaz1u0JHDlK?=
 =?us-ascii?Q?B5BakHPoGBvoqsKRq88grgVn+lZP6WSlF14kQZG+R/EgQo/BMPLIj2Y1agXy?=
 =?us-ascii?Q?dtMWKX3S6Zip8xB7fxr1JWEHr1YM7NGMbfpQIUKp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df498e5f-ef88-493e-8e26-08dce110c5d7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 05:28:53.6691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LtmMKMp0im3aPrUbAv8WT1ZSDc0qYqGfRkCyLxabOfo9Fwv6n4IHdegT6oZnvArbllUi/R9L1n8jq70qq14Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10536
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

This patch series aims to add ITE IT6263 LVDS to HDMI converter on
i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
the IT6263 supports LVDS input and HDMI 1.4 output by conversion
function.  IT6263 product link can be found at [1].

Patch 1&2 are preparation patches to allow display modes of two
existing panels to pass the added mode validation logic in patch 4.

Patch 3 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
the next non-panel bridge, that is the IT6263 in this case.

Patch 4 adds mode validation logic to i.MX8MP LDB bridge driver against
"ldb" clock so that it can filter out unsupported display modes read
from EDID.

Patch 5 adds DT binding for IT6263.

Patch 6 adds IT6263 bridge driver.  Only video output is supported.

Patch 7 adds DT overlays to support NXP adapter cards[2][3] with IT6263
populated.

Patch 8 enables the IT6263 bridge driver in defconfig.

[1] https://www.ite.com.tw/en/product/cate1/IT6263
[2] https://www.nxp.com/part/IMX-LVDS-HDMI
[3] https://www.nxp.com/part/IMX-DLVDS-HDMI

Liu Ying (8):
  arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Add panel-timing node to
    panel node
  arm64: dts: imx8mp-phyboard-pollux-rdk: Add panel-timing node to
    panel-lvds node
  drm/bridge: fsl-ldb: Get the next non-panel bridge
  drm/bridge: fsl-ldb: Use clk_round_rate() to validate "ldb" clock rate
  dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
  drm/bridge: Add ITE IT6263 LVDS to HDMI converter
  arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter cards
  arm64: defconfig: Enable ITE IT6263 driver

 .../bindings/display/bridge/ite,it6263.yaml   | 310 +++++++
 arch/arm64/boot/dts/freescale/Makefile        |   8 +
 .../imx8mp-evk-imx-lvds-hdmi-common.dtsi      |  29 +
 ...8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso |  44 +
 ...imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi |  42 +
 .../imx8mp-evk-lvds0-imx-lvds-hdmi.dtso       |  28 +
 ...8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso |  44 +
 ...imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi |  42 +
 .../imx8mp-evk-lvds1-imx-lvds-hdmi.dtso       |  28 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   6 +
 .../freescale/imx8mp-phyboard-pollux-rdk.dts  |  15 +
 .../imx8mp-skov-revb-mi1010ait-1cp1.dts       |  15 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/gpu/drm/bridge/Kconfig                |   8 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/fsl-ldb.c              |  53 +-
 drivers/gpu/drm/bridge/ite-it6263.c           | 829 ++++++++++++++++++
 17 files changed, 1483 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
 create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c

-- 
2.34.1

