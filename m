Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A36D9730CAF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 03:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC75110E0FD;
	Thu, 15 Jun 2023 01:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2070.outbound.protection.outlook.com [40.107.15.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5024310E0FC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 01:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+O32iR1gXkEJdbCrKdDFjAGdLLHdn0SfAeAqK6twOhfeTiGk5s4j3LGWxcv5JqbhG5ghlZDoR9+OQLwFAbdluuqRluMmk2vaQZ1kw8/krE2ofRqxCgR3Ia9sk4+FenvjYxKd1Hpj/fPwYPMRnvKtEcZqOO1y0frioFHRYwJTKWS7fM1mpQPMpw41Eb8m48UP5JcdUau/WKU1l/r2J+Qtn6NFJ8PUxkts93iwhyof1A3F8pN8/esFbvAHKiLeRLAcvplwDQ197fGSKepRb3YbqFaWm/jBDiILzPVVLqWKS+j9dMtMrf1pqKuBtuwWGLEP5HtpMEPI2CdfZewZ/IVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8yGGuC2DfD1VvgUV1rOu0UBsvecwcgYCTC2CecbBxk=;
 b=QcIKhuvjQ86QvKyZMQ3QAUBSUzU5gEol0A/eHdnGzpGPs4CIx0SRE02nbsDAUAHnxdOqEguOlcR3NzSrduz0kprE6VXw1xyx8bThjfqDvDlVyXVc7coFbZ0gXLzRT9QVTmZQVLMbNsy+rA74MXT9+aP2DpJWPXgd5J+ieWNWgI11FXgM84W0rN5wy433HxOYcdnc51vEuHjeZLM+zQ+A2UzQqEAtrIbX+fQ6nXzWog9vHOlBF+gyfqeQMhlP1ApUzOznmYRUN+l26Crc4z6UThs/GLSjSF+X8Sdq/tJtR905WbzqASZhOKWZDyIKXp0xehu/jDcajhjt03ArAo0bAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8yGGuC2DfD1VvgUV1rOu0UBsvecwcgYCTC2CecbBxk=;
 b=jZTb8B0gVS5lbI7x7cCnkTkx/byXq5BJHDH1P/m/vNzXKP8pkUndzyJJWSCj45n9Ekc+zqp5D10/cqwkS9UcU4OorU8lFpcruwU0046syLdkBmpQUCUn6agU29Ip1Jh4+LnfYhh963M592K/YR4A6UuNknYPO3xjtv4u09zeTD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 01:41:13 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 01:41:12 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v6 0/8] Initial support for Cadence MHDP8501(HDMI/DP) for
 i.MX8MQ
Date: Thu, 15 Jun 2023 09:38:10 +0800
Message-Id: <cover.1686729444.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1c0003-966a-4202-f002-08db6d4199ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FvWPSYZn8o9YXksT3gK1H8EHCI+5yTCwhMFFhvmi2lkRWA49Sa98fnxOrvogNLgwrk2LJwqPpdJZjVdktvuRhd/jqSe4Bgy9kd4M8DSh7fp2YkYmq7wGjjSEIdhoQpObZp6UJ306dXX+3D74ZbgTI/22coZq+HvTb7UuLqxGC2bUbpKXTmKrUkrcIuh0s1E9kzL3s4cDXMaWOno+1QLn9EpkE9WREFzZIvukfnrYn+pH55sEH8ert7JFB+e6WL0D2mWCa+Dd6M0cjNMriZAsoynpfb2iVw2/9cDke2PZTm4Po8ySa3+pDIfCnVYjl3yDOvfVkJydY5y2QuBuPdCPfvJjJE6rpZUzK1v4EeGTzRkCObko39SnJOUsjsCS9vjsGeG8rfc86qnSz2wjAJjGtu4TmccsGjMFgdmCp/b7qFsgiE7yHL+qcZJh5Za5uH1yNuJxMt/w7f8DC0kO2BMpxb05OVrLgf/JiX1lqs2SBVYdXC0E5q3MrEajOd5s/IDwbl4a+EU63uHRyMvMhEYWEB3kgtlCCjBwoGC0y6JyuC/QmBBgUVYsl+RK9P5qOMRZfMzX/2FaNA+z1dz7FFvAslLcsrnIB30pdg8N1ZSRopKXRmgDF6L0VnbKEWfvdr/7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199021)(2616005)(186003)(2906002)(83380400001)(66476007)(66946007)(66556008)(52116002)(316002)(36756003)(8936002)(41300700001)(8676002)(6486002)(966005)(86362001)(4326008)(478600001)(26005)(6512007)(6506007)(7416002)(38100700002)(38350700002)(5660300002)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XAn/SVNXAe5v8ntiIpF5arM18Z6UqQpRTRChaU0QzVRoCfaqHMer+eUEue4x?=
 =?us-ascii?Q?pNpxNsUP/Pn1ilD/Cv4FHQT1n72wuAJaW7MRzcEb4yNucsWMTB2lkpVoUMOJ?=
 =?us-ascii?Q?B1cry+mNv3cRSRdaE3oqAAB1Y61DKldu7ljt++UB+G5eanBm6SqMhzxoSlVZ?=
 =?us-ascii?Q?z38JauZ3nqdV4Nic5wtIo7qo6NhHGikObFaJFM1ws+BUTIGUyOvG3pLMW2Qz?=
 =?us-ascii?Q?sZys4+m3JwEpKOf0A/NmaDoF95adrFv61FerbwC6X08fHomXVigVE1pOQe14?=
 =?us-ascii?Q?f+gX4ZrcrDdX213E0UB3lNm3fnQyIdZixVZPn/Bv7dKzAW+0t8wFYHqO61f8?=
 =?us-ascii?Q?Wm3r8TvnNBhXa6QGRy/ehJN0I9ldoR+Zj3o2SR2E40pbV0rDkRSQrnc9SnXF?=
 =?us-ascii?Q?mE/umBnxN1B/0YQG+q825bqIyteiWLk32hH/Q3duUkJvFBBZmO4knTpIUpjB?=
 =?us-ascii?Q?0gwx/PHZfUHpuTdWxicbX6bj+VTa8WGSNrLPeZl2wSNLtqDL4BUwyLJiUDL8?=
 =?us-ascii?Q?yXkniIpmiQ6U1n7s1EGU47/m/IcKaEfXdteKPqZt0XNsj8QyQgW0dgUz0Mvs?=
 =?us-ascii?Q?KtwxhlTCQkImy/zleYl0EHU6G8s1CLaDFSY5ldovo1OQwdHcLP3vBBeujJ9v?=
 =?us-ascii?Q?hGZWDkcLkI56bwxg+e8PKiF+BlypKeoKrNW3XgYge5v4eIF+p1nbELcJMBgm?=
 =?us-ascii?Q?31Ny4C0WelLkEH7FgAesBdGSAG/c4LtDWq3F9suK3VHJ0WW78kveApd7uJ0B?=
 =?us-ascii?Q?6NWC0rky2gmXZbjF93jsmIb9zJkJgO0RhuYSEV3gf6d63TxD4BLe107NmLlV?=
 =?us-ascii?Q?7VfyR6Ox4gmp2ZzTppcdmrfD7vF/nB3thX7QEBUYn6Ytz2qbXWZc38ckpslN?=
 =?us-ascii?Q?NhY03pNo48yYusdGItfhx5UGtGGBXk4omMcZ5Z+m4pbzHm2+ofSLNgIWm9NM?=
 =?us-ascii?Q?LfpDry7Ki4kygi+eTJNAkoRuMbH6s5PCUiu3cNQ5QLTlYAY1Bp9gxoNBCNXE?=
 =?us-ascii?Q?IUMl5hLPUiv+075rOU0Zwg4X3W32V/pC1U97uO/7NhV7NGDUHwYfjJ8U/QXk?=
 =?us-ascii?Q?rXbhPNA28CcoN7z7+aQQzvLZ3ZR4EdEwHHcWMl9L2jft88xpWrpvfxP8DIAI?=
 =?us-ascii?Q?d/1I5Je+UGTdfX+VC63tjg0+aU0zfKX1y9VfND9TicVrDdVaJnsFIVBgxhZS?=
 =?us-ascii?Q?BpTDC9OmIG/H5TpEzsPRsb3zDB1i/2GvtTZJeWYTwMdFalK7gp/uXNMA60dj?=
 =?us-ascii?Q?t8MbZ8pUodYdHBHfs+fLm3M6B7lJH68Xn3BGTAA02EmYyc9YEiUwP8g3+CUF?=
 =?us-ascii?Q?h8t7ezKZJVt+tM9pi30zJWmB9QceQtT4BOaboeLG2EjMma6guXudy+OQkGki?=
 =?us-ascii?Q?zyjjkyDVdI8eKJoLqvXWLSqxGqWMT1cBq6gPu0Ub6g6DiM047L/dPzUkyt1w?=
 =?us-ascii?Q?tXYMYWpgchEm64AaDznlqPjRGndodzNmADOOf471Zq8SdLOga72DIUju6bPP?=
 =?us-ascii?Q?neiVgsXdF5liFu3lrfd8Kqh0vtOTcvJXnoGviMyZWn+8Pg9tGerTPW33/6S3?=
 =?us-ascii?Q?Vl3dtlkAWrTbuHF1DYrRkB9YAmvrnUdFf60AVr+B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1c0003-966a-4202-f002-08db6d4199ef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 01:41:12.8265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x72+tlqDzGDfkTUJLiyoacnFZ/1JCbA+Ot7jlxBi2Wpte2xHLiGaozpnxdem6od6i4fTd8wKJ2fP1b1dPY6Xlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034
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

The patch set initial support for Cadence MHDP8501(HDMI/DP) DRM bridge
drivers and Cadence HDP-TX PHY(HDMI/DP) drivers for Freescale i.MX8MQ.

The patch set compose of DRM bridge drivers and PHY drivers.

Both of them need the followed two patches to pass build.
  drm: bridge: Cadence: convert mailbox functions to macro functions
  phy: Add HDMI configuration options

DRM bridges driver patches:
  dt-bindings: display: bridge: Add Cadence MHDP8501 HDMI and DP
  drm: bridge: Cadence: Add MHDP8501 DP driver
  drm: bridge: Cadence: Add MHDP8501 HDMI driver

PHY driver patches:
  dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
  phy: freescale: Add HDMI PHY driver for i.MX8MQ

v5->v6:
HDMI/DP bridge driver
- 8501 is the part number of Cadence MHDP on i.MX8MQ.
  Use MHDP8501 to name hdmi/dp drivers and files. 
- Add compatible "fsl,imx8mq-mhdp8501-dp" for i.MX8MQ DP driver
- Add compatible "fsl,imx8mq-mhdp8501-hdmi" for i.MX8MQ HDMI driver
- Combine HDMI and DP dt-bindings into one file cdns,mhdp8501.yaml
- Fix HDMI scrambling is not enable issue when driver working in 4Kp60
  mode.
- Add HDMI/DP PHY API mailbox protect.

HDMI/DP PHY driver:
- Rename DP and HDMI PHY files and move to folder phy/freescale/
- Remove properties num_lanes and link_rate from DP PHY driver.
- Combine HDMI and DP dt-bindings into one file fsl,imx8mq-dp-hdmi-phy.yaml
- Update compatible string to "fsl,imx8mq-dp-phy".
- Update compatible string to "fsl,imx8mq-hdmi-phy".

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

Sandor Yu (8):
  drm: bridge: Cadence: convert mailbox functions to macro functions
  dt-bindings: display: bridge: Add Cadence MHDP8501 HDMI and DP
  drm: bridge: Cadence: Add MHDP8501 DP driver
  phy: Add HDMI configuration options
  drm: bridge: Cadence: Add MHDP8501 HDMI driver
  dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
  phy: freescale: Add HDMI PHY driver for i.MX8MQ

 .../display/bridge/cdns,mhdp8501.yaml         |  105 ++
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |   53 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   25 +
 drivers/gpu/drm/bridge/cadence/Makefile       |    3 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 1078 +++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 1024 ++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501.h    |  399 ++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  195 +--
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |    1 -
 drivers/phy/freescale/Kconfig                 |   18 +
 drivers/phy/freescale/Makefile                |    2 +
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c     |  697 +++++++++++
 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c   |  889 ++++++++++++++
 include/drm/bridge/cdns-mhdp-mailbox.h        |  240 ++++
 include/linux/phy/phy-hdmi.h                  |   38 +
 include/linux/phy/phy.h                       |    7 +-
 16 files changed, 4578 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501.h
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-dp.c
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c
 create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h
 create mode 100644 include/linux/phy/phy-hdmi.h

-- 
2.34.1

