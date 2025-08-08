Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BF0B1E418
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 10:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DAD10E8D7;
	Fri,  8 Aug 2025 08:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="S0H6SYw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013015.outbound.protection.outlook.com
 [52.101.83.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A4D10E8D7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 08:07:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmNlcbgRxhBeYMzH5YEaeq0CULML0IuMX7cQ8khPuHykm7R3Boun9pGA3EhYsQOnIQYOZgwtzr1ISU3/eQ9MYyLDTXRc+BXbRQQUNGNNaXSq7CP6lVEeLqIo0k3xgwbgTVLf630lKvK18kuuAPy3SQmQ4it5R4DCSbDnk+XKrZejKFoA0FXYBG+MBUgoFSUvBle+3b1q+4rmYFpJn6xWJKU2YeVr5qFXLyAtx0PToV/TkdsG5p1mYwQ/YT1Q+JYuSDOQ7zYg8hl4ovagNqwQJoPjVdtKJ2b4DuuCreyyI4C+XqSl279tfw41iZsuNqVumHhXjt8BZRiWgQk4HdVJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkqAn79cxFCsxx7DGR0ECu7k0oZKV8nB8gzpx7KVQFM=;
 b=Q9AMnosVfQUOhSEUQusaK7uBCyHAR/YjGI+lB0wagi0XHRISTk5T4+B75Puz+KPrxmuUZK6xtZfvwir/IuuZCT9KIGGharkPjEsGnj7peEx51wHcGNdlnvhipQ9l0nV2DLnVAVE24iR4yK3nNmYNmPzMGLnR1wlO5ER+EY/Rg9v+PXQUIifYwdnaOJEwPTrCv4PtM2WU9ZdTF0NuD0t42yRezejZ75plN7E6e2aLiAmf5R/FXZilMMMDFOMCAokEC+yibCppwb+XHMSVNY8VZScqP+Oe3KsM1hqrqo8ZsFX02SCj8Q6Ruf3N0DZl2sh+RaIX9R3LjuU+hvAhusyphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkqAn79cxFCsxx7DGR0ECu7k0oZKV8nB8gzpx7KVQFM=;
 b=S0H6SYw7o/oW8HGBqCXvb5yowgkPzJV1NMa4YhWvCKCL57g8nklyxj9aIWkQ8mb7eYZgqrtY5lhW7YMZtfS+BolLNeiLp9LuSgX88v+H0+VcKJi68KegLvfaU5xOwCXo8lk1B5BFTt7h4DiMT7zhuXM6j4LScM/fzlNFv7zcs9zgYxy/1rJn+/jdnhOcFwbLn6U6RE6aXTQp7KuW7HHhBe/D7VGy4HEjvo9Iw5oTQFBhmo7Fnop/QCf6fy1JPmaVqwelZjG26AKAshLUPZ18DmepkcUY0SYvAOvLd9wez8YCRpsH1dRG4JcatYPot4kQpadHgWzZUJBBhegdIzYU6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8192.eurprd04.prod.outlook.com (2603:10a6:102:1cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 08:07:17 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 08:07:17 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v4 3/7] drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to
 get plat_data
Date: Fri,  8 Aug 2025 16:06:13 +0800
Message-Id: <20250808080617.2924184-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
References: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: b89e062b-62d7-49d5-5177-08ddd6529723
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kjMwVRfk+y5VZeTKg+JV2oqLLDdwbnrM8KIFf3XIoBqswqGGDkcZ7/KMIyWW?=
 =?us-ascii?Q?7RFFdDgzThql6SdrvW6+0k7hD2H8tGnGhhR+5sJ724ktH0dD+6Cx5oLDPHBo?=
 =?us-ascii?Q?2yoqRIrxh7de8uHQEsBOZwyeIL96MvfUonJtq0KPuNHO6zRVgs79K0yQ95Na?=
 =?us-ascii?Q?JZhqyWrueF4hfj91U8XYGIkusCTMYWnnM1Pxu828o9sgr/25KvgaUl1uieWV?=
 =?us-ascii?Q?gfGNLVXBXRhVfkbZeZ5v3nlmIS6vac+y6pK8eRORb4oV2CvVI/1q0qSt3fyh?=
 =?us-ascii?Q?X6DWzjb/dujk3SSY6OLI1tx7x1qXqBmvCMQ48gOIfdNyrwCPlJunyXQIbmZs?=
 =?us-ascii?Q?UYrbtIhWk8UT/+CGoBTbnWPJBeeTJku1VL3h8J37SurykmAkN/hSHa0lMdnJ?=
 =?us-ascii?Q?URwXNVfBZN954c2CmuZFOwqtPjPY03w4jRBmarrXjkcnNAMZqsgWXbzY0W3Q?=
 =?us-ascii?Q?AGGXk3fCM9p+wSWL7So5PIIXwQiwv4vhOi+FMPOrS6zFINvZa2+iOifDt2SX?=
 =?us-ascii?Q?bWPgdOi7SFHqOaDeO+Gbd/1vypV0C74QRLw7PyuwOfiU6CfHaOSX8zP7TZIY?=
 =?us-ascii?Q?VmMwHYZsBfIasDHOBIZNlgzXoipXZ21Tn4X08Wbi3OPDSMZEGD6KSW+N9Fr5?=
 =?us-ascii?Q?jouHuITDoyeOEq6CmMFuySfcPFZcPlygwzPQyHn+GEFMPLhuiLp9Whe28C3P?=
 =?us-ascii?Q?wko1xn8v65j39bASC22W16ZbPmrJ77KOFoSi3Cy9Qj5hCqhvIB/dI6z3YvQz?=
 =?us-ascii?Q?2EIons1+EKI+khHWNeqZJiEDzwSQgiXSXaNM54lkr2DuU+lWazwxAAgpVWH7?=
 =?us-ascii?Q?YgQdg7tE+nLD8y5LQZIrFw/vOVuwRAwzQZjOEXKB8z/VREFoOzkgVBhnKYf5?=
 =?us-ascii?Q?MCApRxN67CP9H5YfBG8aGB++NKlyTjLMfXdpHg+RlDUDyCH47n2q4Ekb8XEO?=
 =?us-ascii?Q?ZLd07uqr/LzTj2q7JUXmpGy4a3lHmlnbXrhRBNLUdH7uCPK0SJml0R1+E3c5?=
 =?us-ascii?Q?UHFqThRXdNsSo1TWUbTp7rpJ6Wh8t6P3MBBfsQ6uiuqdizWlp/7ZLR0mmkhb?=
 =?us-ascii?Q?1OmtmEyCfRvcQ7JjddipyUaZA43pgr7iFsiUA/P4MQrBRy3i61IMiXlDL0Id?=
 =?us-ascii?Q?UunVfhPmGNcYvEnsIiiiogRWgnDiuFJ4Wc2tvYJZ83Z/gAOzrsYcxmVAQFb1?=
 =?us-ascii?Q?j7Se2X24D4+3OOATsXAMOFfOhjhwgqbX4bRuUUugh2g4tMyKejHyL13SMjM4?=
 =?us-ascii?Q?hvy0i5/REvBJnWwH+RkC8wt23oAivAyh3Zgvwm+ddlm264rublzH/OvjNdoB?=
 =?us-ascii?Q?hyBVxb5mLqLMYkeetuSzOkKErI0seOnsm6KmBvb2nY3q8zTBE8Uk+Wct6/fy?=
 =?us-ascii?Q?mFJU3xm99Gzd/0jlq53NKWqM4WT2W2KGVfkT5zbGEIIxsLB+MCyR9H6vbYqB?=
 =?us-ascii?Q?DVzleFldHZFyDtWdSxo0E/yYYgjwA6vEhQYcKYFoeOj0JCC9qjbEIQYJm9HM?=
 =?us-ascii?Q?JZUZ9oyiDz5i4PE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3RMdITRMfUgUJjP/S9GBuuV8Z021bWHoNm6cyLhC9/uE+IynoodVv9QyLLrP?=
 =?us-ascii?Q?W3xcMuW3/k2fk6HSKj04GfU/8LEkQKCkvoLoHSrjnw6rjrzvgZbL06eL/iVs?=
 =?us-ascii?Q?1akvDrllxnqc79PkXs/5WjJSKaABQrLbTXsM/45PMVikbk67H4L/lZ+ve1wU?=
 =?us-ascii?Q?rREOVXFSn+6MNRRNFxXU/z2LeiwbmYyKEHVpC6txGvG/ZzGWLuGhqDzVRE13?=
 =?us-ascii?Q?CrU5QtG5/2AaDNJ6X/j7aCz8rAl1TgjDcUT/I7tJ80gg/tWLaKSP3IS7MZOo?=
 =?us-ascii?Q?RhOhEwlzE9/r5c9Qp4Sz+yby1ffr9cmchHt1UTBzuMkT4xn9fQ3OD78D+jdL?=
 =?us-ascii?Q?MJG3MM/LxopuQr8spHPOVEzj6lv3MNjl4vKqvI+viA9vJg5plNV5EuFlO/8L?=
 =?us-ascii?Q?cRwKmdgWTJMSTtUN25UnW2dw0wtIgoqU97Rc8YlbbYJtTLyDaLFsq7I4TTu2?=
 =?us-ascii?Q?HhT41HIr9lDlXQG4gKnkOad2YpQO9W0xbIxUeQhbtVfE/qWQRZ/OHYVoJzKo?=
 =?us-ascii?Q?k0VR9SgnUWOo6Mz61Eaqt1Nnt6oubWB84N1c7UwJZ5gfLlt3jqW7DIefy1II?=
 =?us-ascii?Q?xNWw3W9SfrJgOE2CCb+NdrA3bKUKjWuoWv7kmvjknChy8i34G/pXtHArwvJh?=
 =?us-ascii?Q?xCwAD5Ip+Xdf0umJtPhSr4LMABEUL4pqYKVbmr21o7klviN4DbO6rU/NfLGC?=
 =?us-ascii?Q?E1gfjvA6UVtdItQiDwaWgOe627IGdYcEGfvO0OMpCp4o+M1WASSP2jqpqaiG?=
 =?us-ascii?Q?c2xbTtvERFfyTYTp7ytAKpZDvYnHZtT2gvzm8nnJCl1Nv4BWmdnpf3TEnYMb?=
 =?us-ascii?Q?BAgqKYxSJ3KQAb9hzgMvHf1MjgbM9fd8RnUQqpZ0CvlNpaHBtGCWGHkSaFYC?=
 =?us-ascii?Q?KbGxroukeKFxKtwAs3qyr96tOK3ph2RyfIUiaMZaHyxUn/ntiUfrp84SoV3R?=
 =?us-ascii?Q?gqMMmvO2eq7BMEvfgffy2v3crmgTLiOB/n1UXmEBt4eb61LHDPG47uuSCLxJ?=
 =?us-ascii?Q?lpocU46gP9XbL2ZdvFCYtsJYNAYS/QkRbUWVUXT+Tp6+IgHEKWdN0GhGQU5S?=
 =?us-ascii?Q?BMQvJUHb5cYgbdJQil5fFlF/lHyQ0m8726369yCC45SXFvwkur/WDKxFgEZV?=
 =?us-ascii?Q?x2ta1sGi0EnmXjN/K8P5+PwnIodZSS2DpTIkNT/EMy4vmsHRpB8J0IjwwXlB?=
 =?us-ascii?Q?+VUchcYZ//Qa8ERQ/qEzn3fPs6UCAgtjiahnI5edpSk2bzDjs3M3xQDUBb/J?=
 =?us-ascii?Q?sskTTU3KhcFBt/JjPX+SORBTSl0FvZCbwRoZ8gXI1tiyCZ87QMvpDO91Z4zk?=
 =?us-ascii?Q?/4tPiNSUQSutU7rq9un4Ez7Hadenm8VQ72Lj+ktXPgOBvgSjeWC5ZeEaEvU1?=
 =?us-ascii?Q?8UzOY1OvAhPiLH+Bs0VcE4bAiR5jrRqnHnOgcYacRGLJ5gawWJHN3xELIeEs?=
 =?us-ascii?Q?m3z3JaNSPNqg2N1dox7W3fXSQwu+x+vsQHpX8OuDWguHfFg2x4sxUnSibRT0?=
 =?us-ascii?Q?536H5r8GwDhY3G+8evxaJwalV5JSBp4ZALjsz1/h/KimU5mCdEBR0BoaUkYS?=
 =?us-ascii?Q?+ZawIZNPY42YxdOcpjM2yaMHR20NNR3qE+o6QsQD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b89e062b-62d7-49d5-5177-08ddd6529723
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:07:17.0219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRu2jRQaN7eGYB6ld935pYkJqTtl3WPFjMSobbzUXZ8orlB+fj/Hnb6cpDllPL3+P360bwPOFgzsIto6jHiKcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8192
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

Add API dw_hdmi_to_plat_data() to fetch plat_data because audio device
driver needs it to enable(disable)_audio().

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
 include/drm/bridge/dw_hdmi.h              | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 206b099a35e9..8d096b569cf1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -198,6 +198,12 @@ struct dw_hdmi {
 	enum drm_connector_status last_connector_result;
 };
 
+const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi)
+{
+	return hdmi->plat_data;
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_to_plat_data);
+
 #define HDMI_IH_PHY_STAT0_RX_SENSE \
 	(HDMI_IH_PHY_STAT0_RX_SENSE0 | HDMI_IH_PHY_STAT0_RX_SENSE1 | \
 	 HDMI_IH_PHY_STAT0_RX_SENSE2 | HDMI_IH_PHY_STAT0_RX_SENSE3)
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 6a46baa0737c..b8fc4fdf5a21 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -208,4 +208,6 @@ void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
 
 bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
 
+const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi);
+
 #endif /* __IMX_HDMI_H__ */
-- 
2.34.1

