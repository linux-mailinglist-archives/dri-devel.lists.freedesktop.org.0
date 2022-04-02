Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608B44EFEF7
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 07:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F083D10E027;
	Sat,  2 Apr 2022 05:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D711410E027
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 05:23:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4K7Tc5Y10Ju2sCzkxlPa83tpC/8gQdkh0AtEve9dVTZWCGipqp2E9PSwhhsFZrqHGrVhm+kTqLSnVTdFUUS+scDTO2hR1OGd9/6PyUof40lhk1biVO/eWzT7LLByYHzT3JAGc1KhBuotFJXdtx4wpCF41S0MPzB2QcKkQnucZrAbBqY5XUM/WuiwjvU1Xv8IpOvKFD/dp7dDoJL317XNHS+AVpZzIvZ/CuxyBEPPmhp8XiktjducTbSl+zot50LjxUOnqd3T2TU0uFMEdKHm9G05ZEMpkLfDGg7EDvXFKRtIJoJtyyY178jOnuN+q+x6GxQhcHI9B3yUTL9gZULsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKF3ZHbu2cRhYcusaOvTHu3Ufexvm4LzPwJQ3FVb0+I=;
 b=ITzY3CbC4uH1ZDWGirHDrizjhcdurOM7ue42zATldoc/v3jeQZjQMuhNoIv65eH38YEB3DtGmKu5xKIFB1H4xZv8l6v4QUjYm+OPrdIeLSRFmD1SkMd4kZX/WewTHsVXy64cN6WmwxCc7qpqGACwuljk6Qx7CFG8I5KEjCTuc+a8HZ7k5vSeE7cTJMDcLnQl16jgcuBd09/JID4H3U+hNUDP7sI68bb2CNgdTRj8Lw3ZEzjwqSdac4Yh1qHNLn2h5ugGWMrVd/MHjGcyYIAorD+WST1TGTN2ToZYfZ3fRw1qFZeUwQLkxRfRcdBizDMAsUsyYMRVkn0hBBIk7Mxppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKF3ZHbu2cRhYcusaOvTHu3Ufexvm4LzPwJQ3FVb0+I=;
 b=P3pb9bz9qKEPvOOY+GMdFiXk++G4KRNj96nUQWXmmEgv4EV+pKe1xXGQVsriCePDJLuj2BHOx1pVF1dtsIR3jv1OissxS9m/Q7wmMhxHEjaQ0s52XESKzRmUyWX0rgeB9XtS+bo+NUb8YwY4pymrAnNmmt4nnvL5qb9iIHG1GGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8750.eurprd04.prod.outlook.com (2603:10a6:102:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 05:23:17 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 05:23:17 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY
 mode support
Date: Sat,  2 Apr 2022 13:24:46 +0800
Message-Id: <20220402052451.2517469-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ff52a59-af6c-4e5d-de66-08da1468e441
X-MS-TrafficTypeDiagnostic: PAXPR04MB8750:EE_
X-Microsoft-Antispam-PRVS: <PAXPR04MB87500B4037FCC67EC551D0CB98E39@PAXPR04MB8750.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OpLFrsZgaqa/tS7knPuq9eTShSSgc+/gh32bTQFMYHbkXtwk2BOoXtnaNDymUtnJ404q+1R4uvG8EB8wCGKqa06ZSdVsRy4UnW1aV6ijLVZ9BDEljNJHDk84ELlK/Lbd67ZqkhtH6FHRrlVc4hC0GKnYzOdCTQZQrhx6WDTn7uOp15gEXohfgTcuNAb6jUpqP5kCi8A7CxaXPlK/kS7+f0+hVKBep9dRquwhS8xgztoUX31MuktoU3j+A/bD5b1Frpshgx3ldRwSOI4ezlskhCkyI7gpXJUswObh+4IwGDz+XcmSHUjjlc6O8nmSET8IZ2HZdnslVymWUkxiAowvHUZC52TV+1cYNnuqyMOy0gbP7wJwxHqT5Zch9g1hj1IngWRkStE9qYeHFao1CtBAjjW1DBypHYeuHnPCL+EY2Fr5ecJgD8Y2XP2onDN8kIpy8ul5u49qWfVBHt6t0bNOmxstLdfRAmprnGMo/LDphVsuwMb5VSCOXdzeT+uPGCZcmDmbKulfvKQQY9TElrV2/6NeiFzhnxpYQUySZtUigO0NP3hXcjx/A1wM9cKwAPv0BRRWMaFv6j84ijRHVNKOEbjwzoj5IVWFqvViNGua1uaJl6PL930rO+yLYNUzLhSi/z4SJ2bVL+JyNTIPJLpyjYWH/peHgbUONqXDmoY57lHXqgzZm/2Saj8StVyePAJ00f6nsvqOUqbV9L0yLK1m6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6486002)(83380400001)(316002)(6512007)(52116002)(186003)(26005)(6666004)(6506007)(1076003)(2616005)(508600001)(7416002)(8936002)(86362001)(38100700002)(5660300002)(38350700002)(2906002)(66476007)(66946007)(4326008)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0hIWHFkWjhuRXQ0dzZkRnpjVDQxRlIzNWJXbEJnNmg2M05CT0t4My9GU3Fp?=
 =?utf-8?B?TUFRZVBaZEpVVjZDRFc0bWN6dW9GdkVmVkdZempRTkVZVyt1bldSVkczLzBk?=
 =?utf-8?B?eGdQQjZmNGt3MnB2aHhpT0Vsb2wwdUVGMThVVlVXeDFyWWtjR0R4c0NhTWNF?=
 =?utf-8?B?M3hRZ1d0QjVWQ0xBNVluUGh4bW9YOGtwdWxiUENPVGJUSWhETEdRNTBFOG9C?=
 =?utf-8?B?REFTc1paelhIaFVwVmx5bHhHM2RBQnRuNWdnQzZKWmYwOGJaNGtNVVMxdXpO?=
 =?utf-8?B?Qm42Z2drME1sYnp1U3gyUjNIQVJvY2tLL294SitZTWZLekV1aU1qTXg1OEpr?=
 =?utf-8?B?OGFUUDVHVFdHUGlmWGUrWnl6OXc0R0pTTUlBU2FLaVdSSkhKVHpBTGxac2lx?=
 =?utf-8?B?ODRiN2lMc0pnS01aajh5cGVIY2V6RDhEZUtOYWFGdjBZWXYwd2NkRVE4VFAz?=
 =?utf-8?B?b1IrVmdQakRrdVpJVS92WGwzdWdWZlpiRmlwL0tEMWl3VGZkYm43dVJHdUM0?=
 =?utf-8?B?VGNEcXNPOStsNXdHUjdIUWo0M2ZpaG5nalpYRzBuc2NMRnIrV2lwYmZYaVRW?=
 =?utf-8?B?NGxXbXQxOEFTNEltbW43c21za05PSVhaMDdxNExwU0Ntem5KSWVuWWdLQXFC?=
 =?utf-8?B?dFRabzI1L0hNWTUrN1JPUHJnNmNRZCs5NFlGaGl4UmwvQnp0cHJqOHZiSklx?=
 =?utf-8?B?YWtyTmN2V0lMeFZiWFVtaytIY1p4N1UwUHVCLzJsVlhFNjRJazZ1UEd3VlpF?=
 =?utf-8?B?WTZDSy85VmF0THlFaXJ5N3hqUjF0cnhMQnQ1WUhsQUQwM2dXM01TSzNHeXBk?=
 =?utf-8?B?WVBqRnUvOGcrM0NDZXVya3pycGtwNDlQbkdyZkxvajUrSXNYUEpZYk9Hd1Av?=
 =?utf-8?B?NWQxcy8ya1ZZR0JwUlNCYmtRUTVLN1Nralk0dHU4K1FPdE92ck9VTEI4R0c0?=
 =?utf-8?B?bno4UEl5SFhwOHR0cDU3c3ZNbjgzRGtPNldvUUVNRTJYYUltY0ZTckN0WW9v?=
 =?utf-8?B?dERlOVhoTG11eUd1enVXc0F4ME4xa3lKYTVhbWwwVGdmYmd4akF4Y2pUS1No?=
 =?utf-8?B?WUJoUWtId1RJOGphL0F0eW9tS1ZidGF2ekZUT3dmUVlNWVpCL05FMnBGNDNZ?=
 =?utf-8?B?UkI3Q2xXckRTSVc2MHZ0M3BOY0RVcTdmdDJ3ZDlTRHJkQzNhMUxISTZIUXda?=
 =?utf-8?B?SjFocE9ad3Z1K0RHcjlEOVNQZlQwcEJwbTFrWXZ5ZUF4MUYwdnVGc3NoZWdr?=
 =?utf-8?B?bWhNeWQzRWxXdlNKTmU3OWwrWTlpSzc4WTRpam5mK0FZakw5YWcyUDdlQjBt?=
 =?utf-8?B?UVZpUVQyaFN1M3VJS1hhLzViSWhTelp3L0Nkb2tGSGRjaFBDaGVpWThabHdF?=
 =?utf-8?B?SkZ6NEk2ZHIyMjVqYkhsY3AvZ2tuVkFLa2VyNmJQc3FnbXRIYkEwZ3FkNVQw?=
 =?utf-8?B?VnVNdm5hckdhSkpSeWxzVUUzYjdvejRCRXRuMXhHYThRQk9Cd05XbHQ4ZmJM?=
 =?utf-8?B?T2EzNFM5WEtZcCs5ZTlFNVlrZ2YxKzZFeFFPWDl6TVlVT1lJK2VvUG5HQkRi?=
 =?utf-8?B?MlFuWlYySkFuN3MyWHpaZEg4QTdHT1dsODVXYkRydWZ5aXlMQXJNVmV3MTcy?=
 =?utf-8?B?T3VVekVnUC9VaEZ1ZEFXVk44NzZYYXJEUVJ6YTNlY1gzZ1dmK3lFMDhQK2tD?=
 =?utf-8?B?K3RDMFlIVlFQYlJUYzFRYXJ2S2RrTkx3UUNFaWp3eWNVQXZGcFliekJ3Tmdj?=
 =?utf-8?B?c2ZDb28rbVhzWXNyR21KVTVwSTkrbkNlQzRHZEpuRXNpeWd4czBRdGdVUGlZ?=
 =?utf-8?B?Wjk1ZG9YODZoNjM3MWd5Rnl0c1pkdU0zSXRIMmtOV3QwWmQzOU95djR2YzdB?=
 =?utf-8?B?ZnhCcWhaUy9PY3JtWENaOVIvazlxdUIyQ3hhNkJ3ZkVOK1FOaGFMdFVvU1c2?=
 =?utf-8?B?MWwrbW1NazhkQlFvVzJYM0g5L2ZGbFdhZ0VVdFpOQnQwQitwWEV1aXA0TUs4?=
 =?utf-8?B?ai96Q0JkRWJ3OW5XdFoxOHdpeHEzbGQ4UytPbGM4Z0pZVjRiTmFxODNoU3k4?=
 =?utf-8?B?Um4yc1VaQUVFOHk1QTNmOFFoRUtkQ3V2b3l6MWxHSnlzWjN2VUhsbmtHZDg3?=
 =?utf-8?B?ZmIrNEd3S3hnYVBUYm4rT0k1US9Qd0JhME94U3N3TzhxempPaE8vcHp2UkRY?=
 =?utf-8?B?UCtoY29aWFpXZVpkd3N4WDZoTSt3TkNOaWJiTHlUSXltdUVnSDVrd0dhb2Zt?=
 =?utf-8?B?aUFxNWwyck9wYVZ4eDhlL3dCQ21oMjdDV2h5ckhmZEhLREl4UTdPTXl2Z0k3?=
 =?utf-8?B?OU8rMjF4ZnpidXZ5WTZ1ZnpxWUlSS2NNZjRueGtkQ2kxR2ZrcW4zZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff52a59-af6c-4e5d-de66-08da1468e441
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 05:23:16.8303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8FMC7dfl1s/71PZc7UxR8NSx33vg9mZgd28TnJom6abuDirfZlZmmFdQKO+M+2xUPD5FJ//s+gjnFGDHPiQJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8750
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, narmstrong@baylibre.com,
 airlied@linux.ie, s.hauer@pengutronix.de, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, kernel@pengutronix.de,
 robert.foss@linaro.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the v6 series to add i.MX8qxp LVDS PHY mode support for the Mixel
PHY in the Freescale i.MX8qxp SoC.  Comparing to v5, this version only
rebases the series upon v5.17-rc1.

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

v5->v6:
* Rebase the series upon v5.17-rc1.
* Set PHY mode in ->mode_set() instead of ->pre_enable() in the nwl-dsi
  bridge driver in patch 1/5 due to the rebase.
* Drop Guido's R-b tag on patch 1/5 due to the rebase.
* Resend with linux-phy ML Cc'ed and reviewer mail addresses updated for
  patch 1/5.

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
 .../phy/freescale/phy-fsl-imx8-mipi-dphy.c    | 269 +++++++++++++++++-
 include/linux/phy/phy-lvds.h                  |  32 +++
 include/linux/phy/phy.h                       |   4 +
 6 files changed, 407 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
 create mode 100644 include/linux/phy/phy-lvds.h

-- 
2.25.1

