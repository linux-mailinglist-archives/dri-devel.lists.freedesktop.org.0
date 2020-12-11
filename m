Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0F72D7150
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4624D6ECA3;
	Fri, 11 Dec 2020 08:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89CB6E7E5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 01:54:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JD9ZzO6v44ghGZEr8JLZkOlf5t0C8kwUR0BdpLizjy7diizmDlHV61j6D/lffSPzSBOtcJ/6iVQqgCHP1gB7VN4aWxUuj8XUfIdI2aTOWlAmQwuff44k/Q9Badr5kYE5zvEvJ0p1oZGAuNFLw8OQCBsrprAxAgPMGOrdO/kIlhr+5VepgdrCJqKShwyL5WMK2OYgCwI04JgbjclM+IuiJ/T54JoKhyJEot17T2fwZjoyZtKuYqSI07vWUt4XSbUiDjcaFU+rW/pBe9azBQy9p31PpTCGVonlwjslnNGPl+wVtKVDHklW0B0wC5cV8sUulIeTzxTQZt2wyJsuBZnicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8QbsVSQpwTDeCI0oMdCzNpmCAjkpWMRnEA4qKBwYgk=;
 b=Jw1CA80L+AJ5dswBRjnAvaBixZb1LnbRnrOeJ5bq6FGvQIENYQoJupOYdjOiEy2boMfr910SzHsEWsPtAGBg0Luv/1cjcLkv1+0KcuMwaKr9/W+L8Fu0vb5lk2yUSh3F4CYR2aZwuK2IOjzK99ZzhtKb/6FG9uN3qv2IkrPS/vuiv25FZdEqCOcrcb8QWWnHOe4DWz5OC4WHUSqwx+u+fyLSPPSrewIJNB1iF2TETsqJRsxbQVL9Hhv4Cy2/jNdwk98ANX/i7g5bmz6HRVs+LMLKAWKAXLTNSNxWyu/DHdBPmHJ5y3XsaEqmr0YqgHUExoClOQrbqz46JEthO2vz+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8QbsVSQpwTDeCI0oMdCzNpmCAjkpWMRnEA4qKBwYgk=;
 b=DeahoOAIXe5FFdtfzjaRMbhQod0eZJ3Hr+YVNtuMCLQrT+by+kQDyA34Ebz+ASJTi23INu4+sJpTwrPJezUIbUMUEZkthmhsG5gXtEg/iG6s5Y3ymrOxPLx67tzE3njFR/NXMaEb/JpfAJxVv4j6f/ZHLckm0CnRMY7SOdxT9c4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3952.eurprd04.prod.outlook.com (2603:10a6:803:1c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 01:54:42 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 01:54:41 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY
 mode support
Date: Fri, 11 Dec 2020 09:46:17 +0800
Message-Id: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3676.5 via Frontend Transport; Fri, 11 Dec 2020 01:54:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9190fcdc-9e45-487b-ac04-08d89d77b9d5
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB395220BF8A5188894CB4553298CA0@VI1PR0402MB3952.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFSy1tfbktiVBP2M2FZr2/eeKzk8YUIY0LNUPOGG4AISM/GKPeg6pqnml5iMgX0p2LmwWx7hjitoVd+UUYP7THyWlFjc/C8DDyLC0ZesPB4vvwYcuN+eDKIQddUxfb9dFaumE+aVVgUnbo31/HH75+w+v/eXOfBDUoplAxY3mq3/btaK78gnytDgm3fMLl9pn9b3w27v02woTeDCpXuiFqWrk7MN+H/kjiEoJ+Q/n+5pO36MHgW/DBT6HmEcPsx8dOmOpzm/mf87VIwaw5muYkcoB5alCrXGMjV4OxMyybThlfhlUERas5eLCGeZzaNcZKV8Udd6U6+vvFvrDcXDEyutqYO4QMkMyiwrqEu6s64zUKSKG70vaRrbLdTm7xez
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(52116002)(316002)(956004)(69590400008)(2616005)(5660300002)(66556008)(4326008)(66476007)(2906002)(66946007)(6512007)(7416002)(8676002)(16526019)(26005)(186003)(8936002)(6486002)(36756003)(478600001)(86362001)(6666004)(6506007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?J3mGief3m79kPwuuMy4NNmWnA/Ow6z0vaHLn9fwPbZ9POOi+VyZo0CufyNOC?=
 =?us-ascii?Q?vec/E8kn4QThVBAw1cvgXPwfrRhlYd/ctjaXpCYtAFmf55rdYR6NN/U6qXV0?=
 =?us-ascii?Q?acdiwpIIt9RzdCQvJz1/JHx6UNSaOqgf/uX0Wx2ExuPC6VEK2scycYAvLbO3?=
 =?us-ascii?Q?rNhgbgfsXCL7j6pRsD4HYSISxm8vlLsYlNyaTcTCVHosiKc8dS3AmJxFMLkT?=
 =?us-ascii?Q?sAdSuZikqrrfnkHHbCAUYAVxALZB6Ys7ELu+45ftaI7XZ1glFw3kt8oVNSeb?=
 =?us-ascii?Q?eZ0XQ3iolwO3PYr9DF5Y6NnZfU3j2xP8t7HKXa+Ab+TrV2zKs+8c62BnYQNf?=
 =?us-ascii?Q?tPOEDunvvLDil9XDY5fWuTb4Nm7zR+hXK7CawRRPKl+K30qdmp3yDgCdWory?=
 =?us-ascii?Q?RCs2vq4FmS0j1DUYlZeCHgeD8+Jv54Dbwsr5nxsN+sPEgLxmr5LZqQnEhZXK?=
 =?us-ascii?Q?qk41KeYqyJsNxqglM6Hf8zF8415RbHMNUMLQ00fXKz8FbIaEyHSrUph00pnz?=
 =?us-ascii?Q?PaanrwQgJ34MJgvbJBZvqKKhZaOmJHrwZ1tItEeyv5BPzB9y5rMLv4f+Qcov?=
 =?us-ascii?Q?/6T0njSUqbmR5yNxCFZAueLoa+fmVg4cml4NQ5tuUWh3eM2M4VqEXrHJDKJ6?=
 =?us-ascii?Q?jStFPnpxCJ0a2IFHn+eq6qGcNvL/SvX0s89NyxTZ2efJObY4TJUyjqsd95g7?=
 =?us-ascii?Q?rZzxLNUZcMDC+PgLVuX45X6MxTAsoHRS4myM5t9qhgytaDkbc+DGbkd0JQXx?=
 =?us-ascii?Q?LUyhoznuoir00in3oOeMin1TQfdx6SIKzc6y3sJaYtoGplTLquop8/t3cCJ5?=
 =?us-ascii?Q?TNHUvpwQE4KfWKtrU5fq2Q9SR7buI0MAPz94ag/wJLJklNmpVbDlYmSNhfMe?=
 =?us-ascii?Q?+PAub9O3NigTDMjlCc/6Qr8VdeAej+F8iN3XrfQx2ISRAhqsG+lqrqhZFBUt?=
 =?us-ascii?Q?p0fWcOoeGoziJ5UqZNEQoJwYIAvytN2ve4sIe2vLn6zTBXvsyenVd4DomXYP?=
 =?us-ascii?Q?67w/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 01:54:41.5653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 9190fcdc-9e45-487b-ac04-08d89d77b9d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFbjMN4vuar18vQ1xwpfOsShUvd2FiG8Igo8VmdiRB9hcDcyriu4S6+BfAsYxzxaqmCxNkOsj5zHF950e00ThQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3952
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:07 +0000
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

v2->v3:
* Improve readability of mixel_dphy_set_mode() in the Mixel PHY driver. (Guido)
* Improve the 'clock-names' property in the PHY dt binding.

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
 .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 107 ++++++++
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   6 +
 drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c     | 269 ++++++++++++++++++++-
 include/linux/phy/phy-lvds.h                       |  48 ++++
 include/linux/phy/phy.h                            |   4 +
 6 files changed, 423 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
 create mode 100644 include/linux/phy/phy-lvds.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
