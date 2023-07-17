Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6763755B40
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 08:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6403F10E1D3;
	Mon, 17 Jul 2023 06:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB7310E1D3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:13:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mq9BPPzP6yx7G21ZB3tLiRAM3nskCL9igAAIPGbvV6vS8o3urWQd9elBM5yztywIz8e/4VG8RaXoqepO7fdeRwzTirf0TseKM/AMCF71FhDb1WDsq45nglF44BxmJa9ydliv+1eFfPzVpSyCUit7ySAHnFu6buAB1XiiFGWeUIESs/BKtddVc+xqY6ndLguYazgaC2VHJbF6U95SI5yxtI9mID6Cphbsnna4t9BKLPe4+oy1PORRVoGFWADXfUtEY1v4yRizKnXTYg9KKZxo4/qpHrbeoCxl9g5N2JJEtLJ0U/7qnfGOP9PEOFy7hZStEcRNqWx7AH/8Bx8ZPG05PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izxJ+1KPW2kK1Iwhav++SdH3hBfqa80vLCyWePQ7Q2o=;
 b=b530X9ZmQd39QvpGYWlLEeyTbEcLLBsigY2nZSunNEQmPETcnTHVYtXzjy6xW4Q2Du3K0lYD3pVZ1g/Rm9FuffFFjzW6lEsDJN+UIZzylVpvf5JZsdIHisy6f2qhAnx0cWTlhQkXEvlueecDcheFZ7jGyQ3krsngve9Qprt9/nev81JKKTOtpPIxRvwwcxRGwxz0mojUdLx2Eft5gBcsvxN6onUEq5zMRPJlmZcCcl5EwkC8dmoipwAFhpuRAQx7Qlnd8FGEmz6ivgz544Izhehsx8j+CHpbaarO7Q2z4etQKZ4C4Tn+BTwCKXqOyT0d44AuwV4uJjsA8hrkZQcW4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izxJ+1KPW2kK1Iwhav++SdH3hBfqa80vLCyWePQ7Q2o=;
 b=Wn3KkKiukin1SC3UqOGKrhUVJUH3tY0D/PoGVjhAHudgeGmpfxob24kMBmEbDc5dh8f0URqZhDPcepn54rPEnTRZpmlr/eT2q9XCZUmI7dUqoSIRV4Y3JWf+9cSmJ6vmwCZE38AS9wgyEKxDdsfk7wIbzoS6JDpVy+r2FmTF7x8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 06:13:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Mon, 17 Jul 2023
 06:13:48 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Date: Mon, 17 Jul 2023 14:18:22 +0800
Message-Id: <20230717061831.1826878-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e726a3a-ce63-499b-79ad-08db868cfbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z+gob7Rw2G35hUsL9Z3nqytemRzHPOh4osU4MVZksInHHA39vJN5fSoW7QFox3ivBdQzGTMrep6eRCFiF4UfSR+Mw/0iETIbumx91RezTzXwFgiJJH/YLVzCoCAEQMXwtqWovz9YoEoVj8IVzAV+zOvnDFeh594VANDPOYrviUlEcnL1VnnaqLsS9S1yqzTKU5TbU6DW6d36FLn1uhpPgrPOWczwrG8iLE8KsnIrTa8c0lVdVH9GY1fL4HZWIWYMwE7xH6IYux+v1XDdcb+NpOoe7CrndHGX1tW5YvuxMjvTGQj43CSensDYDS3rLyGISKq67Z1u+RVSZy3mScUh0wfhnAV7lREoB41Bht877Ua2sJKaacFkY1ClqaIwrohywmyuA+z5FnQzu3TDlT4ezPVgPl0JGRRwE9cX8uZ4oaL9l7wf8Ub0TKxDN0Gl0gKeb2ClYfceJR+fs4aFLj+0ev+F8I/d7iDAmdJeb6C5/xQxjo/xNq5eIY5/2LZTlPbuI4nfuaVysXgkyQTFxB+VhpCnSO8cD5oJycuc3aw8Sm0bYRMKpYgM29ffAc6zMN/bAO4jMg5wQ7q6JTn49aORNmYhJ41pr+ztKvVuISBTaZhb8DvBRTo63MfqGXMX7f37
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(478600001)(52116002)(6486002)(6666004)(186003)(1076003)(6506007)(26005)(6512007)(2906002)(41300700001)(316002)(66556008)(66476007)(4326008)(5660300002)(7416002)(36756003)(8936002)(8676002)(66946007)(38350700002)(38100700002)(86362001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MC+gP72cyC+S3/+bRNwX/hHYg7umPLW8Msj1W+5XazYBMHByUWeFQvmWMU6I?=
 =?us-ascii?Q?+85lqu+Y2Mt+F9fWuKPsHepH4EEf2ZHekAJHfhqIZNylDbguMwcX1/huHPb4?=
 =?us-ascii?Q?o6RHSBni4k/9W4XNCsSyzRQhs5MlCOWbtjcZl24qEjj2A51dtgyk7R23OKRi?=
 =?us-ascii?Q?3dH8uh/juOga8HLwhO/1I+JvwqGGsoFQ71URapM2uBSCvEiuRF/g7TwNbVAy?=
 =?us-ascii?Q?6iZIUz33MFdNnnnjDVrLUw1u5nUDYND/pRxaS+cXuo6ifRYmfTMfVW6UIYfG?=
 =?us-ascii?Q?2RvVIMwHfNKrUGiU28qK70FHaOk87sxtolO/HF/+0sPPnOwomXorVAQ4MoBw?=
 =?us-ascii?Q?wCcte8sxEqYnmz+GlZjVpnVu06rb0SYO5ETppGMTg/8K1UtmK100uuW7YqI8?=
 =?us-ascii?Q?IKwJ1A7QJUDDSrH+pMYcVx2kuO11rUmH9Z9tqAaa9M1ClWvPDSpCJRrm1yPT?=
 =?us-ascii?Q?Qmip92xRH388kNTI9JLM5x6HsizJGvhmjs8j0wfcdabzMIbfE2t17fpaeHJN?=
 =?us-ascii?Q?twirbNz3Y4iaje/3Df+4WvvUufQVUbPaXPe+tvdcgAZDrv/EPYTiviXVNSbg?=
 =?us-ascii?Q?K0isQGdFdOKW1PTGlaSzWSjBg8LhdT5lLZNKrd/F2cgbwoiD8xkNDfqEAKez?=
 =?us-ascii?Q?LgRLx590Pig1e15EJoquTo78GdjAjQ+K/ey3JT3XJPgBcpFowU/uwJ/CvG1x?=
 =?us-ascii?Q?k9zWCcggfesJ34SLY1KECCABxQjRe4KoNuzlCveb15ePwKsiGcnCJNeMppKn?=
 =?us-ascii?Q?nkuOenp/rCYYfX8LBglur/HHPGGdBZBmhHeS6zXIhTao4u1yX6GgaMiuyQ0o?=
 =?us-ascii?Q?oSoW8aE3LVdfj9x7k7JJvebTdrPRcXXrbbnYDCynsQHsJf/rs/pOS0PgB0lq?=
 =?us-ascii?Q?RORsTkLTkjA9BeRs/nvnjQfBRsUcnMcZMkV+SmBhMD7cjqBEunbIZGBJZLF2?=
 =?us-ascii?Q?PQSjwj2Vc/2tZByd9+JDNm35fcArE0gEb0Hgr1G1bURXAVIWdM/g33XfQI0e?=
 =?us-ascii?Q?/INA1k4m51CR2zGHVYP1nW/V9pHyHh7wK4+naXGrDX0pfi1FAWDqsKFiBwfF?=
 =?us-ascii?Q?IplfZgnWFjT5SEQQACPyGWlqMbMaF7c2MykM4ootECXNrhbfvqCxSnLiNU2S?=
 =?us-ascii?Q?i5b9sZdQKmt0+Ql75EVMUoEZcMknDB5bf1eBKAr0Jz0AilsytnNrJtJJPAkz?=
 =?us-ascii?Q?IY3cL9ijWWAEWr37w7dZ0pwkU5WoPIUOs9DUU2NCEzxgUCCshlEiVrcdFPwI?=
 =?us-ascii?Q?s6tDGUc6ETGk28xbzgfdZ3PYoNNsO68/k5wClpb27W/bAoF0uWTAZJAoONbp?=
 =?us-ascii?Q?ZbuH0ag5kGHp6QC8D2wl4zul8qNLO/jx9QuFueP9cfOXhEqaGTEp9VkL9k3l?=
 =?us-ascii?Q?e/dBXuTYFx254YVpjAP8poWAgtoUJlt4HbDIG3C1xV7kGSYM+q24T+AGaR49?=
 =?us-ascii?Q?YPR2pDkIyb9aL10jvEVzKxQgOHu9r2KEd6Tsh7z7mVLDjul7kFNHukrn5m7N?=
 =?us-ascii?Q?TQpGA8RaKBBf33B2wWrf/f5nzJ2P+jh09oLoPpA00g7OZvlAS0Rr0gVlegMn?=
 =?us-ascii?Q?GhG0tfLR5rjKAmLbSA17ChbZh0E9Xh3haBTygWIC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e726a3a-ce63-499b-79ad-08db868cfbbb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 06:13:48.1904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TuapVDnhNwydeEYv2ab2/k7qDS70yRRcz+RPKPldtuTL6aUpbx8rISFlZ9IugCai1L/3Y/ZkBACNWQ2HxzEuFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9189
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series aims to add MIPI DSI support for Freescale i.MX93 SoC.

There is a Synopsys DesignWare MIPI DSI host controller and a Synopsys
Designware MIPI DPHY embedded in i.MX93.  Some configurations and
extensions to them are controlled by i.MX93 media blk-ctrl.

Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
bridge helpers and implementing i.MX93 MIPI DSI specific extensions.

Note that since this series touches the dw-mipi-dsi driver, tests are
needed to be done for meson, rockchip and stm.

Patch 1 ~ 7 do preparation work for adding i.MX93 MIPI DSI DRM bridge driver.

Patch 8 adds DT-binding documentation for i.MX93 MIPI DSI.

Patch 9 adds i.MX93 MIPI DSI DRM bridge.

Liu Ying (9):
  drm/bridge: synopsys: dw-mipi-dsi: Add dw_mipi_dsi_get_bridge() helper
  drm/bridge: synopsys: dw-mipi-dsi: Add input bus format negotiation
    support
  drm/bridge: synopsys: dw-mipi-dsi: Force input bus flags
  drm/bridge: synopsys: dw-mipi-dsi: Add mode fixup support
  drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to calculate
    lbcc
  drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane byte clock cycles
    for HSA and HBP
  drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and LPRX timeout check
  dt-bindings: display: bridge: Document Freescale i.MX93 MIPI DSI
  drm/bridge: imx: Add i.MX93 MIPI DSI support

 .../display/bridge/fsl,imx93-mipi-dsi.yaml    | 115 +++
 drivers/gpu/drm/bridge/imx/Kconfig            |  10 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c   | 934 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  91 +-
 include/drm/bridge/dw_mipi_dsi.h              |  16 +
 6 files changed, 1163 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c

-- 
2.37.1

