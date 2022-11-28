Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFC563A20C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 08:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3486D10E1DF;
	Mon, 28 Nov 2022 07:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe16::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C0F10E1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 07:37:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/nKWtNAUmlLoo0SLyYInJsX9864hQd99YEVdrdIvO7nA8dNiQKubuLlYp6CPDN94xmYxnoErtlSQpZxLz3KehS/89/fxTU1JZtJLRr5fpGvIrXgmRcFw6T+B2MwH+4MZAmhM8p4X1uBMlIKMPpskmvfEjwhnAXE1MuhsH6vkDqI07q7AEIlHnM6SdO92hU7vT1ACLkWIw4xlJD0DI9OHQ8zs5TJ3AmZrWnU5WpMgQ9slI0UvwjpI8paizPY6kTEYRaAMtk8tleff6YQNWtRM+hM1YwyPvvgBTFJvxxI7PhSzT+wandTAOHXpPjClabZWyPdsnOwH9renrflBAFBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1008IJqErbcV+/6nXoR6rj4i3y1t47bgmtMMOV8BU08=;
 b=RmzURGiNp+7qCLqiCDzzPwhs8tjY1bOCTio13PdswowTmyOne7tPId/SnDPOsNLWs2vnYPFIIxXxZM1Fgs5RmVImfiGxkqdprlNJC7KcC6eEsdx3SU33VyA0cBkuKv/+VDg4ut+dbWZF3VF4BnjLX58qYcJ2bEGG4H0r4PA90E5gC+yMZ0RyACaeVVaiznC6vUhO7H/XcThYXRTG4JadwJqDMOXX7y/SX+JY6sOx6mPuatyOgF2pH1orJO42/CoNfm3e8nDYUfpt8UhmMMS/dcO0yPmXVniNJUz5U4p+jsi23jJb3BLcD43oXNYOCwGi7gB0nWtVHn2d4wxuZoq7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1008IJqErbcV+/6nXoR6rj4i3y1t47bgmtMMOV8BU08=;
 b=EM2ot1qXhBiV9lipqFyxEhlBm61jqP6v8WQC4pTEpryNAEmu6ABIx69pzfPmgCLJftwRwoNv/dOGrrPMIJCtH53Y+6cg6G2CumzRNf6ZKz7Q1s1VOS8BkCd9dET6mFNidFo9nJQWVnr23gCUt9GGIBmRfW6+PduqW+HIKVlSrdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU0PR04MB9249.eurprd04.prod.outlook.com (2603:10a6:10:350::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 07:37:50 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400%6]) with mapi id 15.20.5857.022; Mon, 28 Nov 2022
 07:37:50 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v5 00/10] Initial support for Cadence MHDP(HDMI/DP) for i.MX8MQ
Date: Mon, 28 Nov 2022 15:36:08 +0800
Message-Id: <cover.1669620155.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU0PR04MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ef060a-3d15-421a-14d2-08dad11373f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GkeW34yG05GNFOwWkxVHuY9XbuhTxrFV5JJOuxtv6wuc3yMJiNjTPRWWVM04LD7NeaEMyy9FzCj4ki4lpkh8tyJ71tJpdws7CtlkPg6jSZr522AzgEgEWSJQQ3gkefBFxNId6EmZkF5XfuedNXuJm09iUzl3O3HJUmtEIl9RtDuELr7XEliQ/FMiV4ULv5EXLuhWi+qTTWGs+F4mfu1tIjKAt6xTsj8Xjl8R6sGp7hM0QDPxWnEEzTn+l/4BYIICSGhN+d8B8WBXaRSBZJYCjSk6EsV0P/j8OduLIcREgUz/sg5ZnMmQShMZfuZ/DdkYRuZsRFOd8N0fO+IMcS6bYZ8uHO9nek6eKDM0MpLRnP1vpi1SvrRdIvrSLv3FNxFMWG88q909z3tVQSQXZmXSh+qXMT0Jm3CfT4R+iISPR0XJXnOwwG4lD2B1S1hraMN00Le659biG+Eou+b7JSUrIXP0rs3tUZ4CZK9YFudQiMsUjL8V+Z4rH2+ib8q6VZ0Nvw6JahCuelVpGFfPt+LZXVKZCXi+OEQC++8mcQMjBDoynDIOk+7OwwTSeVzJACjgvhipPurpOPGicPttP6NYK+ceIQBeuXr2zEHUg5SG/KQzz1cXAto8EDUIHVtiw9u3KtqadfUBoLixxoSSvoH3gv2kTdWReOxMd73S8beG+kUrt8fR43vyIJLNNP6LBaeeHEXk5hCFkcsNknJN544knvnE0L/h1OFP+HnB9Ej6VK2U6AW7UbhiKZYmN95xQkTu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199015)(5660300002)(7416002)(66556008)(66476007)(8676002)(4326008)(8936002)(41300700001)(966005)(66946007)(6486002)(2906002)(316002)(478600001)(36756003)(86362001)(6512007)(6506007)(26005)(52116002)(186003)(2616005)(921005)(83380400001)(38100700002)(6666004)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h15GXtve65rFROFfLPYJnIvk01G5np4dllqx0mgmjBj3wUrROwzjW8ZlzzP0?=
 =?us-ascii?Q?CQrxlSyxMD3E6aVMgdKeKiQcSt+lOIK/FmGqCQCvk1KdGmj3oMRDfmj9jizW?=
 =?us-ascii?Q?rOFG9zjszDIZAzF1XwB3C5P4FNoXGISr4qClciXhuH/lgse5PUo+QArWXQw9?=
 =?us-ascii?Q?/9wxz0qKMb58M4apdz+CyTy9FSN0VjD7AxGxfP6qjl9TqBiql26vLhtTChnk?=
 =?us-ascii?Q?Ohu5xvMcDswgJJE+zdxhmkUA3sXMJ7T/0wVWWa8/HSfJbVLhpvGm3F4OEpKT?=
 =?us-ascii?Q?SjCwWEitk+hVUNvHurBaz/n1wRqTLCmvgShjibkmPs/nCXMqssu1XLM+qHWm?=
 =?us-ascii?Q?1HedSw48hRmVYmNOy+lzRtPYvC16wIUtpRYyLKkp4ZVbisu9dQSkG+FIYrB0?=
 =?us-ascii?Q?zFZVJVDgz9rHlSvmdLjdhngpxjlUXEeLWeBE0Cepv+UmQJgUQSM0qwRcwGA3?=
 =?us-ascii?Q?ucG9eVC58Y/z66mjv7ihFJhgeB+dilX9vmHr/jMuf0DcbjEkCrwq15oN8hdP?=
 =?us-ascii?Q?ReFb/TngudMsdCrAioHMRNdN3y4ru/NyP+gERazBcBpG7ri8Ssgx6ozd/seY?=
 =?us-ascii?Q?NUiLZTexFk5bf9/jkIxtx679ptJunCC5xUzhGm2stLWh5jHarf8K3hrcefUN?=
 =?us-ascii?Q?zRwm+YnHk09g3t1i/W/0WtaZ4vdEIlCvFDbVvDOchGiZVgdoyUQivbO5OFjW?=
 =?us-ascii?Q?aPz2McbyDojsYA4u1NIhdZVOAyakBESxGIYTmnCxylVqkF7E1VKrxNisdqtX?=
 =?us-ascii?Q?5DFKBtxi+PfenqBl+hxeAjKeEivxAwyBTwqz3tZRvMrntB//wESNCmJBYAig?=
 =?us-ascii?Q?e33nz7c/3bLNnM8C+bl89VDhvq3H7V/1xHwEzOErGyzEXsW6O2VkQlS76Jk/?=
 =?us-ascii?Q?PMr1UOd2dwmj0ftBmurQSDTq8XVrCiM8Qbyfr0IX2SAEJnPYi0QI6+RgokG8?=
 =?us-ascii?Q?T7xsmSNpG7kGtne+eS2wVvWKzaSzcQU9luvPHBMD57MEnOa0fBj1H1U/O42T?=
 =?us-ascii?Q?JmXL5me1gqdAWIUYcGHvVGx2aWCHVmeNBaicejd+p2peUh+vYCAT3yPCzqeZ?=
 =?us-ascii?Q?wrRf58ry9oSoRt+REzK4z03rW17i1nl04NsQmRrtZrXOrWzMgfvaSqR4SuDV?=
 =?us-ascii?Q?d8FiqXUvXvrfrQV7oZIhKfXyBkb8QJeZrLjh77JpXPdUrXQOYNE93FjisvST?=
 =?us-ascii?Q?TbkaRABNp8Bd0ONfYGhdFRo4weJFkLhZjF6NOHTX4GWVqCmhPgggBIh73Bez?=
 =?us-ascii?Q?Rxu7uJtjIlxvNt+XKbAfWMlFv2nZIOvOyL3a+aZo/Q99e5MccPQIEjtPXOxw?=
 =?us-ascii?Q?+O6mDYi+sA5z3Z2NpRC+9nUmbgEYsJ+inEZ/OrH+HAMRqcYgUZcrzWRnAU0H?=
 =?us-ascii?Q?sxniYeYauarB98H/n5+kEr/K0Z0M56rJl9okedkUDaVlnBtv7hekKJbQj41O?=
 =?us-ascii?Q?eqm1o4+gu9eyClLZqN15z40h45/OADC0I1hLpQwfdbYrTTLLY6YpAZTGktbY?=
 =?us-ascii?Q?z7MuvMiPEoRd8eLRkVOEAKZB68cSS1eAab5nJlRwoZ/OirFP0/2H9YiiMCsm?=
 =?us-ascii?Q?FzFW+BiJGqzA8J5axJXHQtXILPoc5HqV5hcndRGf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ef060a-3d15-421a-14d2-08dad11373f4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 07:37:50.8180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+yFzF66iapWfvFYpIze0wH/vk49+An0SU8RkYXYmOYo+eSGjCuD7JllHJQtMQ6NovTSVgY6kYhEA36laj8y7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9249
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
Cc: oliver.brown@nxp.com, Sandor.yu@nxp.com, linux-imx@nxp.com,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch set initial support for Cadence MHDP(HDMI/DP) DRM bridge
drivers and Cadence HDP-TX PHY(HDMI/DP) drivers for iMX8MQ.

The patch set compose of DRM bridge drivers and PHY drivers.
Both of them need the followed two patches to pass build.
  drm: bridge: cadence: convert mailbox functions to macro functions
  phy: Add HDMI configuration options

DRM bridges driver patches:
  dts-bingings: display: bridge: Add MHDP HDMI bindings for i.MX8MQ
  drm: bridge: cadence: Add MHDP DP driver for i.MX8MQ
  dts-bindings: display: bridge: Add MHDP DP bindings for i.MX8MQ
  drm: bridge: cadence: Add MHDP HDMI driver for i.MX8MQ

PHY driver patches:
  dts-bindings: phy: Add Cadence HDP-TX DP PHY bindings
  phy: cadence: Add driver for HDP-TX DisplyPort PHY
  dts-bindings: phy: Add Cadence HDP-TX HDMI PHY bindings
  phy: cadence: Add driver for HDP-TX HDMI PHY

v4->v5:
- Drop "clk" suffix in clock name.
- Add output port property in the example of hdmi/dp.

v3->v4:
dt-bindings:
- Correct dt-bindings coding style and address review comments.
- Add apb_clk description.
- Add output port for HDMI/DP connector
PHY:
- Alphabetically sorted in Kconfig and Makefile for DP and HDMI PHY
- Remove unused registers define from HDMI and DP PHY drivers.
- More description in phy_hdmi.h.
- Add apb_clk to HDMI and DP phy driver.
HDMI/DP:
- Use get_unaligned_le32() to replace hardcode type conversion
  in HDMI AVI infoframe data fill function.
- Add mailbox mutex lock in HDMI/DP driver for phy functions
  to reslove race conditions between HDMI/DP and PHY drivers.
- Add apb_clk to both HDMI and DP driver.
- Rename some function names and add prefix with "cdns_hdmi/cdns_dp".
- Remove bpc 12 and 16 optional that not supported.

v2->v3:
Address comments for dt-bindings files.
- Correct dts-bindings file names 
  Rename phy-cadence-hdptx-dp.yaml to cdns,mhdp-imx8mq-dp.yaml
  Rename phy-cadence-hdptx-hdmi.yaml to cdns,mhdp-imx8mq-hdmi.yaml
- Drop redundant words and descriptions.
- Correct hdmi/dp node name.

v2 is a completely different version compared to v1.
Previous v1 can be available here [1].

v1->v2:
- Reuse Cadence mailbox access functions from mhdp8546 instead of
  rockchip DP.
- Mailbox access functions be convert to marco functions
  that will be referenced by HDP-TX PHY(HDMI/DP) driver too.
- Plain bridge instead of component driver.
- Standalone Cadence HDP-TX PHY(HDMI/DP) driver.
- Audio driver are removed from the patch set, it will be add in another
  patch set later.

[1] https://patchwork.kernel.org/project/linux-rockchip/cover/cover.1590982881.git.Sandor.yu@nxp.com/

Sandor Yu (10):
  drm: bridge: cadence: convert mailbox functions to macro functions
  dt-bindings: display: bridge: Add MHDP DP for i.MX8MQ
  drm: bridge: cadence: Add MHDP DP driver for i.MX8MQ
  phy: Add HDMI configuration options
  dt-bindings: display: bridge: Add MHDP HDMI for i.MX8MQ
  drm: bridge: cadence: Add MHDP HDMI driver for i.MX8MQ
  dt-bindings: phy: Add Cadence HDP-TX DP PHY
  phy: cadence: Add driver for HDP-TX DisplyPort PHY
  dt-bindings: phy: Add Cadence HDP-TX HDMI PHY
  phy: cadence: Add driver for HDP-TX HDMI PHY

 .../display/bridge/cdns,mhdp-imx8mq-dp.yaml   |  102 ++
 .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml |  102 ++
 .../bindings/phy/cdns,hdptx-dp-phy.yaml       |   68 ++
 .../bindings/phy/cdns,hdptx-hdmi-phy.yaml     |   52 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   25 +
 drivers/gpu/drm/bridge/cadence/Makefile       |    3 +
 drivers/gpu/drm/bridge/cadence/cdns-dp-core.c | 1071 +++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-hdmi-core.c   | 1018 ++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp-common.h |  400 ++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  197 +--
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |    1 -
 drivers/phy/cadence/Kconfig                   |   16 +
 drivers/phy/cadence/Makefile                  |    2 +
 drivers/phy/cadence/phy-cadence-hdptx-dp.c    |  737 ++++++++++++
 drivers/phy/cadence/phy-cadence-hdptx-hdmi.c  |  891 ++++++++++++++
 include/drm/bridge/cdns-mhdp-mailbox.h        |  240 ++++
 include/linux/phy/phy-hdmi.h                  |   38 +
 include/linux/phy/phy.h                       |    7 +-
 18 files changed, 4773 insertions(+), 197 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dp-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
 create mode 100644 drivers/phy/cadence/phy-cadence-hdptx-dp.c
 create mode 100644 drivers/phy/cadence/phy-cadence-hdptx-hdmi.c
 create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h
 create mode 100644 include/linux/phy/phy-hdmi.h

-- 
2.34.1

