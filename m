Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3B32D3D7B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7086B6E9DB;
	Wed,  9 Dec 2020 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF606E10B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 06:32:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDNBLvDonkBn3IH2LIq9sMMtr/bkcmXgv1tap417PsjaQRWCaZVDRaz15boTkjD1tn30F7IXZb5oJSZIo30Qm41B0TxPy5MszapmROlygulodJ5og9lyV92ftLD+YNIIJzAX9qlqZus2h9ero+xWvrOZBFg7NqQpI8VNojnxpke/z/dZkqbvyEu8/4SNG7K0WEJq8axLlYmBDDjBAemT572VSwrGert81rXHgKcf72xtQ4+yXZTR07/2z3cOqi28+kxaOkaV0n4TKH0Vo89MsSACFnW7rg/DElhRmM1e78rnl//0kLHHpRSyZXB+dN88K3OBvnWC88M/+KwA6zu+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/7O3+KhmuH2kWVMAMyJRwr8GizujQDJOVwQgT9EQdM=;
 b=SmwTeyeqC/FZ/2OqyqrxMpFgRoF45c4BhS28i/87vMtCWzZ8hlbl7EbBp3VwKPYQDUrXKGpKlcbMeCFKtXko+Jp2VoU6OsfHmlB0vqCD16ut+hxndsTb7dQqyfD+QUxKof8QQEiYjgQPgv2fJGGHcT1e3esSHTHtGLp4o03/coFDOnPPBgyfJVaJiXAIcc6Qd+OO8rKzR4/UDBf0OtZNmmiN8xMRa2iV5qCIR6P7TyUtPeYI8z50l3rscB48I7HnM6oh5OxGwSKt24Zu4Y5wPqDL5phF+kg4IMxtvBenShSGxyQJ1b7PjSZlVBdtJyj6B5cnHpOfBo7RsoxzLiY3YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/7O3+KhmuH2kWVMAMyJRwr8GizujQDJOVwQgT9EQdM=;
 b=mbksD7RdYtOSjC6wYApp2JeFedL3M25o0TvwrUmluKSdTcUPdvOmQjAPiGVnq5FoghOAx9jHql7k47Pi0V9G+iE8JCH26Q5lbpQPu1/ckPnG3L+YfIQJoeCveZwCI16/PKtk7dGIgFtci0E9YdF0DkdS+Lh57Y+DW03N5kDkoHo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4238.eurprd04.prod.outlook.com (2603:10a6:803:4e::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 9 Dec
 2020 06:32:52 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 06:32:52 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY
 mode support
Date: Wed,  9 Dec 2020 14:24:23 +0800
Message-Id: <1607495069-10946-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0148.apcprd06.prod.outlook.com
 (2603:1096:1:1f::26) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0148.apcprd06.prod.outlook.com (2603:1096:1:1f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 06:32:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 34811096-2015-443d-0d71-08d89c0c416e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4238:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB42380C970D641C28D38340EF98CC0@VI1PR04MB4238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FBtYDsaQHdZX6nF6kEOesxpfC5OXw5lX4dUe+32FsG2S0MHpCekXFq/Kc6XJBK3LAtBamPZNCzx6GyOHkjTeN3/QfF4Cecyq2ugI36erL8/28Rr/SaEihnM3cbAm56S22F4jrvLJQ+AAJuRYyYkeB9LC0haPhdBgpscwEvXRVJcrSa4q/g51fdc1sS0a1G1qGhLr7DTMHNPiYdP5F/J7c/OiGPVn2BcyysDVhkHXvDE75ZlxMCW0mRKCiskF76SILlgv+kx1f7jTBr5kxbfLJZTWISAmDndUbn7lWQ/SOzkvkdFXggN02cng6EQ8zAtS0Cm7nrHRf5mLhE5c49fO/8Pa7GAGjLxx6twV953mh8KVG/mCJkzvgpslO3H0gj/lPaZO5SdgewYoxzozkV9VoEEgueofpgKoqs5XkC/k+mw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(83380400001)(66476007)(52116002)(7416002)(6506007)(4326008)(2906002)(186003)(66556008)(26005)(66946007)(16526019)(36756003)(5660300002)(8676002)(508600001)(6666004)(34490700003)(956004)(6486002)(2616005)(69590400008)(6512007)(8936002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?spMFe4pWpDVHj0bDsEfj58yiG3CORYyd4dDV+MQCe+K3vOddM5wyv+wAaW47?=
 =?us-ascii?Q?7gl92AunFBWq0pFOC+Y5G9Gl9e8ua9wqt0PIGs26IrcsC2p7CeAeU9jXdmxy?=
 =?us-ascii?Q?vPxmNw73YoZF0uBWbp11E3GNPJEdGT3laItXWQAwREn8vf/pGDmS9aMOVDxB?=
 =?us-ascii?Q?VZ50OFP+ryyCy2zF1GC7hj6+ia3cocW/N3zfNShLXrla9rG0eSBNVSAGgtp1?=
 =?us-ascii?Q?UfbzKuflop26hql3vTvXDF97vgug/NmhIcRvxzcuRUroEeG5j56B7GVtT5bX?=
 =?us-ascii?Q?AdvIZZFxiz52AQTzn19NjDzRs/6aX8kyj1BVd7+nSIG1oEQzM0hAGX4aH91B?=
 =?us-ascii?Q?Eliedz5TxcGJ7DhGAsR4GH370mmFnsGuu2c8LDV5SUp3Pg7FO2p7mg1Q5RIJ?=
 =?us-ascii?Q?S04Vet8RJXZXSZV9z4gopMwr5T+Jf1WZoU6gj8tU1zrt+FlA6CUM689Uuiw4?=
 =?us-ascii?Q?BhI0kT166hnzYLtsca7+CQkb+LgLRTzADc7/eg3p3T5IN7lIbsq0Dwvy4CaT?=
 =?us-ascii?Q?U3at+ZzYsyMeIuipYWpOZ3WHjZFDcQ1EUIcS+kYTBcaUZEvPjD6SkGnzYHfD?=
 =?us-ascii?Q?wmE1cqk3Eo4t8a6hFQX9aBt25xx/xiyfBOl6IDiNw+nzzS3lVJTvtVpjya8Q?=
 =?us-ascii?Q?IPONc04F03OiA/J5VUa7s0mebX7JQ00JbjdibazIAgzxj5s335xTLTWr2Os2?=
 =?us-ascii?Q?2JKhyh0MzxYeLFWzSpvvicNav4q8TDH3pl2T6MTK5lbWdpTSFUrgYhzHZEBj?=
 =?us-ascii?Q?2UM+Xs93fhmEXbEWOQim6hsRnL9T+oQ/flEkVWlS58OW97VfQPwwal1XJP6Q?=
 =?us-ascii?Q?dbQTgHgIFmmGInHzBhJ3bAdBZr8Qeh3sUNi+SBCrl5gN4i40n2EEMMqXxsHS?=
 =?us-ascii?Q?53paGQa6cw/Ac44LdRVjeKsxbKvjOQyN54d9TprxS7Wmbmp1578cUm6gjjVZ?=
 =?us-ascii?Q?LOPkrPVjRrbasX95lKi8j3fIcltCtMXkJlPN6BZzbvGbnnFEbZ55H42AXohK?=
 =?us-ascii?Q?kqus?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 06:32:52.2668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 34811096-2015-443d-0d71-08d89c0c416e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/9MtDliGye6UIZrrYJumUKpy4kYKkczAg/E2ZppWY65yTVX7vzSRGKsKxtiBrvUnZ4zuiJXt/6Ff6XOg0VnoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4238
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
Cc: martin.kepplinger@puri.sm, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com,
 shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds i.MX8qxp LVDS PHY mode support for the Mixel PHY in the
Freescale i.MX8qxp SoC.

The Mixel PHY is MIPI DPHY + LVDS PHY combo, which can works in either
MIPI DPHY mode or LVDS PHY mode.  The PHY mode is controlled by i.MX8qxp
SCU firmware.  The PHY driver would call a SCU function to configure the
mode.

The PHY driver is already supporting the Mixel MIPI DPHY in i.MX8mq SoC,
where it appears to be a single MIPI DPHY.


Patch 1/5 sets PHY mode in the Northwest Logic MIPI DSI host controller
bridge driver, since i.MX8qxp SoC embeds this controller IP to support
MIPI DSI displays together with the Mixel PHY.

Patch 2/5 allows LVDS PHYs to be configured through the generic PHY functions
and through a custom structure added to the generic PHY configuration union.

Patch 3/5 converts mixel,mipi-dsi-phy plain text dt binding to json-schema.

Patch 4/5 adds dt binding support for the Mixel combo PHY in i.MX8qxp SoC.

Patch 5/5 adds the i.MX8qxp LVDS PHY mode support in the Mixel PHY driver.


Welcome comments, thanks.

v1->v2:
* Convert mixel,mipi-dsi-phy plain text dt binding to json-schema. (Guido)
* Print invalid PHY mode in dmesg from the Mixel PHY driver. (Guido)
* Add Guido's R-b tag on the patch for the nwl-dsi drm bridge driver.

Liu Ying (5):
  drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
  phy: Add LVDS configuration options
  dt-bindings: phy: Convert mixel,mipi-dsi-phy to json-schema
  dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo PHY support for
    i.MX8qxp
  phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY mode
    support

 .../devicetree/bindings/phy/mixel,mipi-dsi-phy.txt |  29 ---
 .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 108 +++++++++
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   6 +
 drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c     | 270 ++++++++++++++++++++-
 include/linux/phy/phy-lvds.h                       |  48 ++++
 include/linux/phy/phy.h                            |   4 +
 6 files changed, 425 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
 create mode 100644 include/linux/phy/phy-lvds.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
