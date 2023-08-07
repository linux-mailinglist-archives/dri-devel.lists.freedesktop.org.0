Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EB977195A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 07:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7493C10E031;
	Mon,  7 Aug 2023 05:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6379C10E031
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 05:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvTTa+zX9tfe56DrN/m+MulsmijvYELybUZ9t+O/TjvMNBH/jE6wfGxoCzoUI2U7EVVxaJjlGL3YwQSlW7JOM/0S2dacf38rQ+q0EgbR1N3XhWZ1LQH88CsVGEqeJkw0YCiYWDxL89FbopjxHzehXlKK2aNfdwNRphdlJACMd+oMK5iNN278o0zPvZ2YjK3P8beZEJt6iw59ub0mIidrbqYdXArrMJj3ewaPvOQM/BRp9rbiGhyDgNoOmVvCMzm195jCm+t/G0iqrb5dO50v10DMz+JxPUyzqjIEkAuLCijsErU3DPoN7MtjI5iCsYCmrDv8nz+MKHAdkWiMFH3NGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93iqaxoeIJuj76eeG1mP//vckwfywbOO/6nfKqCD5qo=;
 b=MFFR8yge2cmGIqvrJYCq8YPa+JWrY2VWXdGgUwEG7cORZPBxcVju/1H03F9fybceAQgGDB1+gBE+a8v4uDii9gRWuvaNsURRwmW2AxNRc310vza/zSUaKKEwiIxSRFlI4AfL554pAzPdWMm2B4OB7S+kV8tZwBfw/V2YQn8sUmPpP7/8QJ6gMlLMvvkpCala9dvzkhfy4yUr35j6plBtIex4Nv+aNWhNuE9o2Kzuk5GqCqn0hBqqG4zv4xEBAMdWxxJrzcMUIJptqLvqAWoZLXmFu6i7MIqN0ioZ/uY+VjE/07S8VwxcC0UxmzithhPawPD4nMSaFfe1Ex/T59IjhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93iqaxoeIJuj76eeG1mP//vckwfywbOO/6nfKqCD5qo=;
 b=YNMM4g/EjLBOKUtG0HLnzLyLGX3IhsHUZXdegTy9dunkxAhkuizFfTUcyJHkGtsKkW02LoIVV23TuWNdD4W3ravECHF43vEfEIGqjP2LuSpTKW11aU6KuSMlkyUn7jQGOAQLEpI2M0quFPyTCkXicZV+cuTC13eHWWeL1UT6wAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9390.eurprd04.prod.outlook.com (2603:10a6:102:2a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 05:21:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 05:21:53 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/9] drm/bridge: synopsys: dw-mipi-dsi: Add
 dw_mipi_dsi_get_bridge() helper
Date: Mon,  7 Aug 2023 13:26:00 +0800
Message-Id: <20230807052608.3038698-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230807052608.3038698-1-victor.liu@nxp.com>
References: <20230807052608.3038698-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: 98fa495e-4c4c-41bc-e3ae-08db970635bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f04FEjL7YgatDMtlLOkakGByCqWAVoC5wHntXwg2uu5MSeZk2JnfxQB8JhkIskTHkUwwfsdesEs4uiDEY2n8zvEc5bpXYwXD3oF+9SxM+PpGkVuUfvWb1US7k5wDgglbrtvAnPR4xxUB0PN1kdBINEZWaS27fygX4fWRXbLiHb9jClBtkZiyb7rVtFrL7klNhJAFQidAS+nJMD33iyBqVNhjlljP5Ti+FlRte9FxeH9sYXbvqquXIsPpwx4YiyQPbbmokvNaMYtTI1qWF625pPpcj3UCx+pMUGmTseM9wPRhRxD+e+62PLJ/EX8g9s9esTDsl0KTpKBr5nff+Re6C23406fzcH5Cosxm4k64/klNHwqVoIQUBroXj6gsp1VErNa/3ImyHOMVwSYHVP9a7P3szEMIqWL+5qru1OmIF6SOwP7ZHAMCMFmWpvG9PDx9h0R5Sju4nbhTWikVVvUB+NyqSsRJqdLzPWi8SPpCN7G+WLSPH04Lo6IFQbf9f/8F8xNJVMGMzx+XX5WAqyinSHCtTkQ7ze+eF7qw8z8J0uIvRVhOcjc8XTBrt31HX4cN7+WzCt8wxW4oBDO91gf2mxkkZsV0LW/JIOGHEzgQWQvcBjsWDyGi92qp/YpjH48s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(1800799003)(186006)(2616005)(6486002)(52116002)(6666004)(6512007)(478600001)(86362001)(26005)(36756003)(1076003)(6506007)(41300700001)(316002)(8936002)(5660300002)(8676002)(7416002)(38350700002)(4326008)(2906002)(66946007)(66556008)(66476007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?krDEPvXz623h6E/FN3S0DOkuFBUMum4K+6W9roK551JDokenrMcji/2L501K?=
 =?us-ascii?Q?hiL0r/u+8OPWexX2lw4ffKJfbbO/qInzZuXDasaz+DTmWM5LUs9Rk0XwnTJ+?=
 =?us-ascii?Q?5l8tMLYDGVwKxDVaUQdpjc7gc4MiDyZfWjuT7Kvo3VvuL71wDwgNRqrDFpAS?=
 =?us-ascii?Q?+KDsp9pm+VkymNlyMC2aHoKb3Dcl49XqSvvGYWKs6ECX8jF0/RXA4dobiKxH?=
 =?us-ascii?Q?TvdPdRqVEeyEEmTeMayomkPDD7v5FfaMbX3jkRdA7F8LO9PkvmFCMnGUCTX2?=
 =?us-ascii?Q?7hWys6JrZ6SmBQkzkuoxk31CnlxovRKPaIQLbYO29/nX4YGN6swseZ+Fmp2P?=
 =?us-ascii?Q?QsY5f8u2nlGKkK5J1CdwtXUJmpFhWXL9SNzU25QHJaQqU/tkD+X/bRovhBVd?=
 =?us-ascii?Q?trC+wQ3k21GZVIl+9axnNB74Teem53AM/J+trO3C/In/+iFUn91q7yMvfWUp?=
 =?us-ascii?Q?Fo+WQbRZRZCfoe1FOMq9axVW5NaeCyN7Dj2YTg9f+bNGt5jhG/jpwE+TbF7V?=
 =?us-ascii?Q?XP3zNO2wXIRvXekJ4WsKDDte0cPOb7b+ADjkYKHljG9WJ8+HC9AD7eKBOJx4?=
 =?us-ascii?Q?ci+4OdpwQOKmmNcsKc+nUaMHtJjjX63Krhm2afNeRSFvmLwKaTNz64StBfyE?=
 =?us-ascii?Q?eZH6FRQIgQKj9AQOW/++rdGmu87X+4YLeYmbLnDl3lEnlZ6bqAff/AnlSK+4?=
 =?us-ascii?Q?3OpzZSz5VN0rKfa4kE6GlzIyirO8oXyxcu9VGDI+0btgh6rjDVfhaAa47LwA?=
 =?us-ascii?Q?DvAwyoKwA/Tlt4KxA7Y78N6nUBlmNzUSZ+4sxPfoGk+wPlrYhsSt788mcWTo?=
 =?us-ascii?Q?cLzeaiBcx7mifLYXrv3a+OB4YpUZqrcA8g4e5FLtflBJzuDRUaBasCjgijjm?=
 =?us-ascii?Q?Jb/aMIJX2ikxQw0L9/FXllVMoMsGtfjQpyQowYAPWyUV7Pmj0G/ijr9D4dz2?=
 =?us-ascii?Q?4pvVHEeNNUNF5dA+8CNf4J00iuK+5GMdXqf5gdUsjxh0tzV7ZE9sJwrooT8D?=
 =?us-ascii?Q?7Byoy8YdyzOGmcxuOnPM5rZ9JywWjkniS/nLYqwvu0pIpE99VjKWTF0OyZL0?=
 =?us-ascii?Q?RAurP877Obyao9okHUvwbHEGSlGir0mOlyz47ddl+GA3jbAeF2Vn5uoAKhUK?=
 =?us-ascii?Q?McyqnMcP7sVI9xs/eiCP5qi9H4v9whqU4O91tdSyksyH31US+2f+U3359WOC?=
 =?us-ascii?Q?HWj0nLz9jTO913pY6lYOYHmvQa9fq+eKWuPhhccGbBSpG12TCxCW4yJGa+f1?=
 =?us-ascii?Q?2bhvh+aKi9vPngFjAt5mWRI9d3XjirVRGf1yqrwjSv1M0tqAP+yobB9wqZuf?=
 =?us-ascii?Q?kI/lamAZV19XWweGJen0sbtH/2XJY8RkKWfiGV/9jH3Zq35kOWc3aCV1l6s0?=
 =?us-ascii?Q?P7gqvJ+R6FsUnidi2rTla6TRDlW/zCc3tHS1rpe4MlSA7JDRLUQ8bnlIzJMR?=
 =?us-ascii?Q?Gh6BFxfzvGqjbOAj56fOqxui0k/qQce0Cnd0q/NWNiFD8sxC0sCrTtn5xAFx?=
 =?us-ascii?Q?/NwBRTJmPOdSNjfz33cy4QFgjnzsEMs6qEp2ZrbecT4wqddpYSwXqAcTwvGF?=
 =?us-ascii?Q?gAbJCsIK0XJUcqvox4j7aGoHCG6GnZtwwJUPKGOT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fa495e-4c4c-41bc-e3ae-08db970635bf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 05:21:53.2366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0urueyl7BAYnGs3lyAZNcdds72SreU3OwsKHtDvutOHiN6rxpO/MfRtW4AHz6W+yOIKTMXACq/4tpdLxx4NUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9390
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
Cc: andrzej.hajda@intel.com, alexander.stein@ew.tq-group.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 zyw@rock-chips.com, rfoss@kernel.org, sam@ravnborg.org,
 raphael.gallais-pou@foss.st.com, jernej.skrabec@gmail.com,
 jagan@amarulasolutions.com, linux-imx@nxp.com, conor+dt@kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yannick.fertre@foss.st.com,
 hjc@rock-chips.com, philippe.cornu@foss.st.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dw_mipi_dsi_get_bridge() helper so that it can be used by vendor
drivers which implement vendor specific extensions to Synopsys DW MIPI DSI.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v3:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 6 ++++++
 include/drm/bridge/dw_mipi_dsi.h              | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index b2efecf7d160..57eae0fdd970 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1207,6 +1207,12 @@ void dw_mipi_dsi_set_slave(struct dw_mipi_dsi *dsi, struct dw_mipi_dsi *slave)
 }
 EXPORT_SYMBOL_GPL(dw_mipi_dsi_set_slave);
 
+struct drm_bridge *dw_mipi_dsi_get_bridge(struct dw_mipi_dsi *dsi)
+{
+	return &dsi->bridge;
+}
+EXPORT_SYMBOL_GPL(dw_mipi_dsi_get_bridge);
+
 /*
  * Probe/remove API, used from platforms based on the DRM bridge API.
  */
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index 5286a53a1875..f54621b17a69 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -11,6 +11,7 @@
 
 #include <linux/types.h>
 
+#include <drm/drm_bridge.h>
 #include <drm/drm_modes.h>
 
 struct drm_display_mode;
@@ -68,5 +69,6 @@ void dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi);
 int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder);
 void dw_mipi_dsi_unbind(struct dw_mipi_dsi *dsi);
 void dw_mipi_dsi_set_slave(struct dw_mipi_dsi *dsi, struct dw_mipi_dsi *slave);
+struct drm_bridge *dw_mipi_dsi_get_bridge(struct dw_mipi_dsi *dsi);
 
 #endif /* __DW_MIPI_DSI__ */
-- 
2.37.1

