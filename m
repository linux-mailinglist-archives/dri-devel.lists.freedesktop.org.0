Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377CC50069D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E3D10E2D3;
	Thu, 14 Apr 2022 07:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241FA10E2D3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 07:08:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/6yu9QYBm4VHS7p/U80VvIHk6NumbX0hfvbnTsy3ct3L9nHg9bjIktsRjbzCjyXT0O9IjrdpkHey3WDYabjOBsTZo6mxuhg//CKJ36sop6kwDhIDzkztjWJbMPopPgpJHeHCn2/j3v6tWF0YR+Se4kuJEwQYbxHqmpCJTejJJNRXOmINuThQw0Qb1CZK+W1XEgiDzs/tIn0UvIdsP/qtRnyhg9yUHbICC5okJr8IwMRXF+xrrR4dSEVy3rw9GtBVEfaX2ej8F/Xj9efsiOnGKHd2x4+3BTykgk7aNqC83mB/8yiXAPwLroNKQryIl9z7KW4/44x+D++HimjsJrDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xj9HkHSXAPpfi4JDX0Iv2IscETV/yNlMj3ear9OZ1LA=;
 b=eFS4iOcordPmyKm4Zu9YJO0S8nJihOlBCNeJRvVuPVYehQgjxD55BAbvtW43nizseQGMxpmBlgQoGDc6H1MrSotmdWi3eg6FdAyCrJOqvW7QTPPdhp27JnuT3B0lweiaRVZoxqzXo07qVvLmVMrd/Uuu2bC+XEfZerdENb5djmy3QCdcZlCJ+zR7jVKi/x7k8oWXdX2io0lt7+ADRacDqztwmQCCX24BmAqv0Hk3/dVyK54fzVlGxS2grae7vPZi1YfX/htZrUkslKC1WD2ruPVF9oYZVV7OtlGSRtUeyR2zGoOxb8BDAgOE++UxrE5/t8PlEBxXurU8IvlqcqC99A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj9HkHSXAPpfi4JDX0Iv2IscETV/yNlMj3ear9OZ1LA=;
 b=Mvi+RcspE27shtoobGCF+N2u4Fq0cBs4+42quj8853sYRIBPLjKunLV8WNPNC8MAtnjwlyN0ux/qKl4PO4mhf1vvlNbca/f652GjeDlCZEZGaEQXgIeBlJE+hNN++/uVDCKoNkBqAR1gusZ3x2yy4gPWQustjkCxl7T/8+HWugs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6714.eurprd04.prod.outlook.com (2603:10a6:10:10e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 07:08:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 07:08:55 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY
 mode support
Date: Thu, 14 Apr 2022 15:10:34 +0800
Message-Id: <20220414071039.423271-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34182e01-2da2-4608-d7db-08da1de5a2fe
X-MS-TrafficTypeDiagnostic: DB8PR04MB6714:EE_
X-Microsoft-Antispam-PRVS: <DB8PR04MB6714E6134D800994365CF2B698EF9@DB8PR04MB6714.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kUO2ip0tbM9FI/x3ukqaSjKW7roTH9dioopV1K+dqie9x7qERat/63UZMEptJabiar5+N418xIMSIN6RIYMiqZcuK4i7HgvF+X6e0yaNtB2FLN4wtozZuWhOLCOZXSS5EiQxAJOG/d8jEVLPuYZA9Fv8ZJ12meJn3rM3nUjNvhJf5cY/ZN2M8pr5iIhUeTFy7Gt5coVHq9gSShVkwgVgp9R20bDzounS/A8a6ClxGcKnHrx6TpPYc9Mr1MeQYY1TQFVsDRlYiVP/mIcFt+Wc0zl8C06SISamp+5BdypodEGiKmRWl5Ts/nB13HJo5NYo5RQ5qPZn9fWfTE9NE3cagxPa4d1tY774hz0Ib6uYZMCwijpxnXtGNvoS0fq94n7qPmrSnjNu9dpjivqX5Obc/3wFDD/mDC2pPGg6bsGfCjMBP5BP7rNd1mRQgb2YW1sPb7mD09BScoxD7Zvu9CXa4OfhmvuY88HjqnA+2ltBap9MsymMEiNSj/RptuebKeUSUpWkxSobYySDCnzLqbsAmETWpzAHMDfYiyIkZrbrWlFmqbFbbTksI0RIey2hNCJ9SzsRrk1tjK6XKgMidyHu1trgbP4B0S3EFFi7KR+imbFDhXwytqD+2ye3AxWKDecFDEBmJJHh3UqCx91BWnu5Gt4JB1B0K2CizpBRHbALRdZqe7Ldma8Cv7IAnopC2g31m7Ddygb0OqBBAsrRtRkIfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(1076003)(38100700002)(38350700002)(66556008)(316002)(66946007)(4326008)(66476007)(508600001)(8676002)(86362001)(2616005)(26005)(6666004)(6512007)(52116002)(6506007)(186003)(7416002)(2906002)(5660300002)(36756003)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTQxTHNtaEE5V2ZUUGExQlVET1Nud1FXdEtqNjJUek9XaXB5bFBKN3JiQkhC?=
 =?utf-8?B?WVNUR2RUY25Wdy9sTUFvM0dFakJwQjVlR2ZWUzZ2RFVaL3RJc3hKSkozcVBN?=
 =?utf-8?B?a2hvZCtnZ1RYZUxnbEJsNldTd0hCWTQ5NXBsYkFnYTYyYnJZdG5vWW9mcnJy?=
 =?utf-8?B?bGZuM2VDeGh2cVFvN0JVdTd0bkQra3JrNERhbnozOXo3eGQzb3pUMDNteUtK?=
 =?utf-8?B?am5VbDJWLzQyamZuMWFZVndnR0RkaG80SS9mNjB5NUlFNUxpeUtQbitaNUV4?=
 =?utf-8?B?dStjR3BKQVcwUCtBV2hDYldKVHV3V1RMekVpMjM2bG85VEFPdmN0UTFRaGZy?=
 =?utf-8?B?QzN4RWgxNFExRVRPeEFJM2luM25yK1dORkNVYkg5RFZibndjajJjT0tqb25i?=
 =?utf-8?B?QVZ2Z2pUdmJqTVIxUUpMT3lpeHBZemN6b2pIelM4MytjVGZuRnM4OTc4ekRY?=
 =?utf-8?B?R0RmVjNKOTErTzhzM2FhWk1kN0Jid0V0cjdaWm1lTzFnYzgzYUswdHBUY3Jk?=
 =?utf-8?B?b3U4em9oRmxKZjA2UEszeW9HVVdSdTdocG5NK21WL21CY2xyQWNRcXF1WkJx?=
 =?utf-8?B?OWlqejNTUFFEMDhWL2U0OVJ5aFpvMCtESXl2bVBQYTFxVmxvWnlUdUpaR2dx?=
 =?utf-8?B?N21JNkpXL2tGVGVoczVIVzlmM2xjVy9udWVHeGZpWVYrR201WHJEaFhXMkRN?=
 =?utf-8?B?Uit6NVBrSisvSjBnQ2RMVTZzYzhNYUlxT0t6RFhKTnBIdVV0aE1DSFRkbXJD?=
 =?utf-8?B?dG9jdDdEbmhOR2hkNE9pem42b1d3TFA3Y1RWbnRZcnBSQmMxZE5ISjQyTWZC?=
 =?utf-8?B?VDJYYlp4OFFmNUNsL3dOeVNpbzc2cm9jdmw4T1JleXdPVmdvNXUzU3hOeHZn?=
 =?utf-8?B?TE5NdTh4TjA1dFhPMU5BbDY1NWhsTWRXU1l6K1FBaU1wOU1DQWFVYkNFSFlL?=
 =?utf-8?B?QmZ1NEpVYzc5ZVNsZUNuTjVoL1AzQkJqd2xMRVltMS9VWDBQTzNLdXp1anBi?=
 =?utf-8?B?OUF2Z1V1Q3BTTjB3WjNrd0RSdVBaRWs3VGNWRExRczdkOHFYcEFWMkhXbDRy?=
 =?utf-8?B?UjJxT3ZFK3Y1NytrZWViSEJKUmozcDJwQkV1SnNPc1VJd1F3blI4TFd1S0Vo?=
 =?utf-8?B?K21QWSsxNTZRbGxQZGJhdzJyeGJMZDM5SkNuS0M1RDRkNU9meW0xMVhiS1RJ?=
 =?utf-8?B?RUtFVHNoL0U5SkJET0V1UXROVFhNR3VlMGs4YkpIcFJDN1F0d2cvV05VN3Zz?=
 =?utf-8?B?dm9qMFNiVHI2Ykl0ejJXUmNQVDd4NS9tOFZreElMdlRqRFdaWDJ3RE1paUE0?=
 =?utf-8?B?MEYwck1nREtZQVpDU1hGWXhQdks2blBFZnByWEo3bk50amFlWCtrV3MyT0hz?=
 =?utf-8?B?Sk1nZFRFZ1VpUmtSckhIWTBocXB4Y3N0dG1pUHhOMDZpNWZWMlBCY0hBaW1Z?=
 =?utf-8?B?S2VnZ2pKaThQRlc2QUxPNjJjY2RhdGRGTmRqM2NKblFjbzAzYkV3SFNOMERj?=
 =?utf-8?B?bEdVQlBmYmQvZjNZZmVxc2FyMDZlYi9ybjI3aTVTSFloYmlrTGpueStXMUtn?=
 =?utf-8?B?K200QndjZyt0QWhzNitOQjZDaWI3ZzZmbDlHNTdrMTBXN1FvR0RkOG1PVEZk?=
 =?utf-8?B?b3FkR0lFcWhMRzk4QjVtaGhaOGRIK0orWmRaQi82ditSZllzWWVuQm81b0l0?=
 =?utf-8?B?R1JEazJWWGIrRDBmVnNWb1RWdHY2Q1pMd2xPOS92dmxJNmcwT1AvbHF2SGg5?=
 =?utf-8?B?Y1RyYlhiMDQxUnVOQ3RMSndVU3NnTlA5Umo4TmZIcW1YTTlNRDBJTlMyOUxC?=
 =?utf-8?B?d1h3OWczblJpbU5iS2ZWOGY0VU5XWHFsRVVBWjFzOFM3VisrRENlN3FPdFJh?=
 =?utf-8?B?WnZiUjdJVGJmNzUwbTRtdGdZUkV0RFFiZitkcHZsT3ZnNGdOMWxtNWg3eTBv?=
 =?utf-8?B?bzlBWkJYWisrOGs4Wmdwc2h1RmFzTFExZ2tpQ1JBOHZnV3pVM3dqb1hXaWp2?=
 =?utf-8?B?eFVwMTYrWHVuNHM5eVNWWXdCbmZ6NjMvK3JzaGlYRjJsYm5Bc2ZRTk0rUEpK?=
 =?utf-8?B?R2RuWTBYbjNqaWRVOGZaQlNNYS9vd2hUT0tFWmVrbVg5a3U3Snhva0s0WnRO?=
 =?utf-8?B?alMzd3lJK2loTzF1ajRjZUNqd0ZEOURNMnBzSnhUS1pMc2t2ZVJXNGphTGRD?=
 =?utf-8?B?WEFYSXgzL3FRa2E0R0k5RE1lWnViZlNnRWtUMnF0MFRORG1ZZVVNTXB2cWpU?=
 =?utf-8?B?K3VIaVBCNnl3SWdTeEhPZkN0VzlYTTgyYXpodzBvSzRTZ2Nrb3diU2d6aGZx?=
 =?utf-8?B?YllYUzZHNlJxdEJJNmo3STNwNVJCSnpEZ1haV2tDUnlwMUUvK3BSUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34182e01-2da2-4608-d7db-08da1de5a2fe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 07:08:55.0672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhvsV6uH2PG9PovssBlL36Kjm64VI8Nbk0c3YYyjVfXxDMw0l/BC0AXDOECdatzMVwNovMh2PxwW10PlEBp/Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6714
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, jernej.skrabec@gmail.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the v8 series to add i.MX8qxp LVDS PHY mode support for the Mixel
PHY in the Freescale i.MX8qxp SoC.

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

v7->v8:
* Trivial kernel doc style fix for patch 2/5 - add '*'.

v6->v7:
* Update the year of copyright for patch 2/5.
* Better variable explanation for bits_per_lane_and_dclk_cycle in patch 2/5.
* Use marco instead of magic number for CCM and CA values for patch 5/5.
* Suppress 'checkpatch --strict' warnings for patch 5/5.

v5->v6:
* Rebase the series upon v5.17-rc1.
* Set PHY mode in ->mode_set() instead of ->pre_enable() in the nwl-dsi
  bridge driver in patch 1/5 due to the rebase.
* Drop Guido's R-b tag on patch 1/5 due to the rebase.

v4->v5:
* Align kernel-doc style of include/linux/phy/phy-lvds.h to
  include/linux/phy/phy.h for patch 2/5. (Vinod)
* Trivial tweaks on patch 2/5.
* Drop Robert's R-b tag on patch 2/5.

v3->v4:
* Add all R-b tags received from v3 on relevant patches and respin. (Robert)

v2->v3:
* Improve readability of mixel_dphy_set_mode() in the Mixel PHY driver. (Guido)
* Improve the 'clock-names' property in the PHY dt binding.

v1->v2:
* Convert mixel,mipi-dsi-phy plain text dt binding to json-schema. (Guido)
* Print invalid PHY mode in dmesg from the Mixel PHY driver. (Guido)
* Add Guido's R-b tag on the patch for the nwl-dsi drm bridge driver.


Liu Ying (5):
  drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_mode_set()
  phy: Add LVDS configuration options
  dt-bindings: phy: Convert mixel,mipi-dsi-phy to json-schema
  dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo PHY support for
    i.MX8qxp
  phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY mode
    support

 .../bindings/phy/mixel,mipi-dsi-phy.txt       |  29 --
 .../bindings/phy/mixel,mipi-dsi-phy.yaml      | 107 +++++++
 drivers/gpu/drm/bridge/nwl-dsi.c              |   6 +
 .../phy/freescale/phy-fsl-imx8-mipi-dphy.c    | 276 +++++++++++++++++-
 include/linux/phy/phy-lvds.h                  |  32 ++
 include/linux/phy/phy.h                       |   4 +
 6 files changed, 414 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
 create mode 100644 include/linux/phy/phy-lvds.h

-- 
2.25.1

