Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE1350069B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1175E10F229;
	Thu, 14 Apr 2022 07:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED3C10F229
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 07:09:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7cmNhBle6uC/Yjn6atc7SuF8fJK6NUc6WpFPFZM5lUnpcP+L2uvE3lXDT+3dJ/c1qFi9YN1+kWiVfYnFroqHdOjulAt3Dgk2/TuW55C7poHd8sT/xRnHOyr5DitH4h67tYPW3BDph0JWijikgDmzXLllz9jNk5UuNywiysZdNpTlBru+BsuKpAshB+gwI8InAIcmlzk/riGn4bz3DWlxfGFbH3pdkpP5w7SspeQ3s+YLINLKbHG0635yKdn8Bde0gOBpM35L48LoIJBsZpv7eykeUCY13bAvw2oHWWuPbbKnDzD2Ww4I5qCYF3mT+O3U11v2xYafmrpp0Xte8Wwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4Yt87+y8OLIFPsVv3s0nx47PgG01ijdBdHzherr3D0=;
 b=gxyLGPI/dSvfScpjWKcVOS/AE2hMOIWjlV79aKr1aPfsgJWhefo8DRGTQ5pTMxdkOIlAjGrC2i47aYWWI9UyPM7ntHbTfspj1In627xN+EpP1bnMcMjTPRyB/cSYlSmLWsr0hlFtJK3Sc/Pr+l5KDHXhiEt6471xYg6tawmAck1tQY4wM94UkVianPmJxCDM/VhMo2nvpkZQWtaMCY1Tr/P0qQSseg0mhMecOOEQkfG2fJOHv2EoQ3Ye+4UBHEKksrCSoulRbdXkHhBDfknLbjqdPM9Yuf4bpWzQACG8VZqr05ShMZnvYLTmoQ3+6VxnXDDu35Nm3uXkhXXFjx4uzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4Yt87+y8OLIFPsVv3s0nx47PgG01ijdBdHzherr3D0=;
 b=FmqwJJfRmcvbgvsJH28TqcMeI4YHHgH00Wtcsib4lWpvjEHpuAtlu30SmdsM2NDw40d7ZOeZRk2kV+zk9il9xugF0Ug5xT/lXRRrt88OyKg3o4OAP1HVWEeBVKCEnUwTyy9NFk0U2FeWcVhr0htm74an6gtFGMZ44dTms2C6TRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6714.eurprd04.prod.outlook.com (2603:10a6:10:10e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 07:09:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 07:09:02 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 1/5] drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_mode_set()
Date: Thu, 14 Apr 2022 15:10:35 +0800
Message-Id: <20220414071039.423271-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414071039.423271-1-victor.liu@nxp.com>
References: <20220414071039.423271-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17c75abb-9c88-4cf1-c548-08da1de5a7b5
X-MS-TrafficTypeDiagnostic: DB8PR04MB6714:EE_
X-Microsoft-Antispam-PRVS: <DB8PR04MB6714DC07C426DC08C83EF52E98EF9@DB8PR04MB6714.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: snn7Nol9XdeZwX+rj5wkYJmwp9/4VM3HHG0/9KZTVel1KFyr4nCZbZr+NksL3BtJiYT2cYLEp+/sCcowdL2JhNGc4BrfkMAACPfLX1Gz3xGfRR4znlzBduOr8Y5XdQZsUfQ3AyjUDBcy2zlhXc+W44f6SlqubSURUDTK70fJssA1dIK3aBarfZ73rpK2TBPV6elq5yerBmNErcAuOD4lkf9GlUhzB8sEGXA+Mv32fMXRmVsO4sJiuxtqFuP99+KU9IEyvm1ZAJFOa2wY/quR9HTFH/mx2CsVSHhWSZ2Ekov7KraNSsAguHs2TpyB1//Tbe0kKHeHvyEQR+ooGqCfpLhJ8OzXm681ggJ/og1ooFPPfeQymOczq5Qw+7yvgX1qNcX26Kw+l/AYMlN8dho08TZ94cM7Ef5RTPw57cc79Ir6YKNA2fzFzV4SfQGocdU7hcWvPgMQVwXo7OSi2Bme5CIxeQdspE25kMj6VR4inv4BCGRlTz/iVoiIn3WgOVJA7OzC+5+KVMmAqF9RXUTJf9qLPln/hpGNZYHv4m71xekeSGQA8q3ALo0GZebzRDXjDBB6l2bKdJxS1r0yNDRjAAY/eMNEum951WwThBHyBZJmfVBtwUwk/NYakXh5HhjfJX4LK8730Unuu/eIEsvNSLa9A5ahK0sQ9IJoEb9KHKGstUhDnb0aXDkasZtqeZtkcRaJw561oWKVRdtoLVpVdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(1076003)(38100700002)(38350700002)(54906003)(66556008)(316002)(66946007)(4326008)(66476007)(508600001)(8676002)(86362001)(2616005)(26005)(6666004)(6512007)(52116002)(6506007)(186003)(7416002)(2906002)(5660300002)(36756003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnVaN3B1SlJuM1ppMnp3ZGovUWdxTTd6UVRxWjBhaHoxeDBCZkh2ZFh3V1VQ?=
 =?utf-8?B?bThWM0thWnNPekVSZ0V4WHpjWEF0a1VieXBqbWtMZWUxOG1EcWlkRGo4V1Rm?=
 =?utf-8?B?TE50Y0NSNGxEWWFOcEpOWHh3NENSVEJta0JRUlNCZUFzakxtQWZQM1pKTWxI?=
 =?utf-8?B?V3dXeERjVXNBWDVJT2hIbXM1cXZUbXFsTWQ5OFduNHRON2Y1d2xiWGVDM3d6?=
 =?utf-8?B?RlUvS0lsRklkYXpwNTRGR25UaFc5V3BUVkFvV2tzbmczVU8vaXVDSG44ZHkx?=
 =?utf-8?B?TjFrSkU2R0Y5bXhYYzFkbU95UmFYZ0pPZUZHZTZWbFJ1bkJKTVB6TFpXKy9C?=
 =?utf-8?B?RCtQVElGWnRWdVNHYVpuNU53VTYyK2hreUZxbDAzdjFUVWg4amlNbG9nbGpP?=
 =?utf-8?B?WDUvSGpIc1VsNzVLTHdnb0YyN0lSblM3clI3cDdKUUdZYVNrUXNnOTZMdFV3?=
 =?utf-8?B?VnFqQWd3amZ2MVZOcUtYNlJQeGMyUFFlSWl1VGhxY3c1bHVmWGN6ZUY0dEpS?=
 =?utf-8?B?aEJNMjRFMFQvVm80N2dsc0RrckMxYkwrdmR2RXp2YVJYeG8xdWIvblozL2hy?=
 =?utf-8?B?MVlPVHJXQVpmbCtjTGgyMWFkNzhHSGJkL1lxaWl6WFFTbHVoVUtvUDhlUWVV?=
 =?utf-8?B?bVBGSjRLMVdMWGFUeGV6dzJSV1JISFV6YU5WMkx2WHB4NFZnUHhrc2lUMkph?=
 =?utf-8?B?bnR5UysrRm0xdXJGakd2RFM5WkJoQVFwT3JvSmRRMXpiTFJDS3N2N3FhTCtQ?=
 =?utf-8?B?SmdGckZqQjNLenF3MGpMUURDMEcvRXk2b0xLb1RUSCtoem0yMFN5SFhWcHJi?=
 =?utf-8?B?WVpJR1IvUHB5T1U3dHJZOVVIVEwrTlBhY0FxTGtkZjVrL3JjdHRjWTZKWjF6?=
 =?utf-8?B?N1BNNE5TNVI2Y3RENkRScGVvN2kyZHhjVHg0SjJJNjk0TkVOTzZKcVpiN3dp?=
 =?utf-8?B?cUgwMldhRlBtUVVWSjBPcFQyNUNvMnJOZWJtY0FzeDlHdVMwTWNSMGplbnV6?=
 =?utf-8?B?Y0tEUUFKODJWSHdEU1hGcU50TTB6Yyt3NU5JbHlZU2dZaTloU0VEbHZlMnVJ?=
 =?utf-8?B?SHN3V3FoaldwQ1lXc0hLNjd3VnY3Z2ZaVnBmUVcrWUpzaGZITzJ5S2pKenA0?=
 =?utf-8?B?RHU3UG9BdVhsbWZpZUw5L1QwMmJCK1dqbnJZZlcyd2dqbm5XZFJ3Z2h4WXVQ?=
 =?utf-8?B?ejFha0hsdkw0YzZHUmgzYnVKVk8yOHpMdFNDaDFWaTQ4NzF0Qng5N291WlF4?=
 =?utf-8?B?WjdzZkdXNkdXUjlSLys0a2c3TWxtaHhPc2dHZmRUVzcrZVJGc0w1N3lHakp6?=
 =?utf-8?B?T0tUSE1Oemx6N0JnNk5jWVBKVFVxTnM1MVA0cHZ1ZnBQbXR5TGJPYVUvV3VS?=
 =?utf-8?B?a0pjNWdWYWtDVG1LV3VxY3liNzlFZHFwV0ROdWNWdmdVNUpZdU9kb05Nb0FP?=
 =?utf-8?B?ME0zeGsvc2lhQnNGNmJFT0N3MnczWTZKQlMxZXRrOVlNeTZiWTVXOGc5WG9z?=
 =?utf-8?B?RHN2WUFlMnB2QVAxeGNJMDFvdTd0cVk0UjVja3p0WjdpL1Azb3gzbmVIRndm?=
 =?utf-8?B?aXBtcjFwU2o2dzRQUHZDU2hkaWRJLzYxNkFHbjU3SGZCd3U1T3BhZk9BR1h1?=
 =?utf-8?B?MWlEcFhyY3VuWDlYcE90dGZ1ajY1RlNaZGptUDRIbXcxVE1FS3E0czJiUFNX?=
 =?utf-8?B?S1B3SG54NXJDakRUZUQ2TXRGL1RCZnNVVEk1WDJZSkE0bjh4QUY2UksrTkEw?=
 =?utf-8?B?TUhRTXJ6KzVOK253TzRVeTY4Rm9uNzRLL3pXVS9kY3NCVjBUYlk4WENjendH?=
 =?utf-8?B?WlNDdzBLK0dnNGViQmxIYlkxRjg1Qi9UWldHQTJRaW9BSWRCaW9tRmZoekFq?=
 =?utf-8?B?QVNHdmZ0K3J4ak0xMEhsTHYzWHZjZDhVOGNicUw5ODlRZkczZVdFMUpBUXo0?=
 =?utf-8?B?VmFOeUo3d3NlMXZMRmFPb3dMT2k3MHBCMVFlQm5SaG4xa3VPRkpES0J3YlBm?=
 =?utf-8?B?Y1pSTmEraTkrTWNTNFM4Nk4rK0JCNGJWcDNBTDMwK0hoUndCckk2czVKZzM5?=
 =?utf-8?B?Qk5NNGlEVGZ4bDNkTmJvdHdYeExSM3pxMExmRVlYdkF1UEtoZ0ZvR2d4ZFIw?=
 =?utf-8?B?a1ZjRzN0NTY1MllkazBJR0YwMnZ2bWJGMUt0M1VteGVva3hIbGM1Q3VWUC8r?=
 =?utf-8?B?M0pkUER2SzVKblFQVk1Fb3gzSEtXaURVRkhnTGJJNEJvdHR6U0VnNkpjQ3BP?=
 =?utf-8?B?ZG51R0hSajhtYVp2ZS9JSVBVaURRb2hEYVZ5QmVyNTNCcUMrNGlPb2I5blJp?=
 =?utf-8?B?OHhFQTFUOFBsejgwYzVxc3VUN2xETytvdmdVa2UySG9nSDUrYk83Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c75abb-9c88-4cf1-c548-08da1de5a7b5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 07:09:02.6801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Az9lDrgiMsbzDu/QiAna3ZQr0NkQzZrea0HGXWtyhjtSterOAUT0FbrB0ERLnEzLQZP44EHIAVWVJgJJyayQNg==
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, agx@sigxcpu.org,
 Andrzej Hajda <a.hajda@samsung.com>, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, martin.kepplinger@puri.sm, jernej.skrabec@gmail.com,
 kishon@ti.com, linux-imx@nxp.com, robert.chiras@nxp.com, kernel@pengutronix.de,
 jonas@kwiboo.se, s.hauer@pengutronix.de, robh+dt@kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, robert.foss@linaro.org,
 vkoul@kernel.org, krzk+dt@kernel.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Northwest Logic MIPI DSI host controller embedded in i.MX8qxp
works with a Mixel MIPI DPHY + LVDS PHY combo to support either
a MIPI DSI display or a LVDS display.  So, this patch calls
phy_set_mode() from nwl_dsi_mode_set() to set PHY mode to MIPI DPHY
explicitly.

Cc: Guido Günther <agx@sigxcpu.org>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* Rebase the series upon v5.17-rc1.
* Set PHY mode in ->mode_set() instead of ->pre_enable() in the nwl-dsi
  bridge driver due to the rebase.
* Drop Guido's R-b tag due to the rebase.

v4->v5:
* No change.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* Add Guido's R-b tag.

 drivers/gpu/drm/bridge/nwl-dsi.c | 6 ++++++
 1 file changed, 6 insertions(+)
 drivers/gpu/drm/bridge/nwl-dsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index d5945501a5ee..85bab7372af1 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -666,6 +666,12 @@ static int nwl_dsi_mode_set(struct nwl_dsi *dsi)
 		return ret;
 	}
 
+	ret = phy_set_mode(dsi->phy, PHY_MODE_MIPI_DPHY);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "Failed to set DSI phy mode: %d\n", ret);
+		goto uninit_phy;
+	}
+
 	ret = phy_configure(dsi->phy, phy_cfg);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "Failed to configure DSI phy: %d\n", ret);
-- 
2.25.1

