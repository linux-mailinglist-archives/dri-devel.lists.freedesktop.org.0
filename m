Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70489A5AC0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D69210E417;
	Mon, 21 Oct 2024 06:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Q9Q9SI3k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2051.outbound.protection.outlook.com [40.107.247.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D8010E417
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:47:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPYi8Rw1nevMrAkyw/ExrYd7+QMx+zroQKpxRh2Qo2VcJFttx9EJBlmr/nFU+yECAbcq+OTQTpBLhb93AgfIsJ6hpBZ7BRsrBObsBuQSU8oEiCzKpy4DukQ3yv+aSKZoAfXfLDIx4MJhHlr+tFblpk1Qm0WXxNd9ccnjzydFh1i/sOg+O68fckUvNQn63M+l5MyXBHy3n6p2chbWVEDtCIQnckFBqAs7scN8byTT4pf5PMCD95881JoYzw+ShY2mJuW3610I7XpTe4DwI782DMyDi+XOzZobvUwr9VQlLkN5er0+BbinX0WFW5RNiszQp7uh7KEA3Fsnjfbg2On0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3b6iOEvIH5yGXR8cWLqSiHBunbnq9m9pNm7zQtSyec=;
 b=FfsJvTaDq8WT7VFC5hmgmibB23mkio4eliKH/YWhh05uwbYf9qA1JySRn8yV8CGNf3IcMpq4CLRESWQ3A8Zm4l2o9r8lzJ2aBtSvpCtnXcvZ+XYFAYqMy598GLdtxvEcsAne68hJfFJDVwdNqTKp9wbfwtDs4uniMBFtDsL2c6uqyQZMTDPsI3kQHMQlSmLN8CIcfSw7HwrQi06LKB+LWuvJGOpEPPizpahNee0Be7+beS2CUuccPqFexCkSy3In94tKw6V5y5dG0qtXYY4uKCNFvVFUV31FnhbHcof1LOO42RPMOhddUnmqeM8xBBX/tgcT5EnmChFcIznsz4/1tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3b6iOEvIH5yGXR8cWLqSiHBunbnq9m9pNm7zQtSyec=;
 b=Q9Q9SI3kPB1G/UZv0Vmz8WqD1KzexKW6hmyv/pLs0L5Oq4SZZlMKqS0a/Pcxlu/LsK7TwBkfikCYkf7d55ARv4n5GdaIDPOG0JTJcqx8LjnRG2SvXNTh/8B+Cp2dktnPyBKeiiaB8C52swV0Ylf9tWAwmOzkeapkLIU5lZjjd397BhHRYSd0MwDkAtLauLHkqeTeoiRAcIL3hzCYAdBg+YydffK6Mo2q1lebjcZJk7SQPvKkGf512X0tpofiPnTsH5MxOMfzxWbtq/VHld/7++sIZjHI5C44o5RaCWD8IGfGmbW3yBdH/zkgj17HXQButsJno1c0T3p6rDERM+sqgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Mon, 21 Oct
 2024 06:47:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:47:28 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Date: Mon, 21 Oct 2024 14:44:43 +0800
Message-Id: <20241021064446.263619-13-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ad52bc-3ac6-4a1e-abfd-08dcf19c3a77
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+4F6xdGU8lbvReZHb2+9oeT9pZZuKOgSth3jNUD8tFdTEQM6gK9GKlp7wnEh?=
 =?us-ascii?Q?PAg3ax7n5w6aW08AHZsT0gTIDRfy+Jz/UHoTyKa/CHmt93ySqpmKe3aGWC0F?=
 =?us-ascii?Q?ZQGBy/qnevVcm20bXH8tXgxVKpMFINJPeXvD/MlROgkFHmLX4/qHbl9+RRFC?=
 =?us-ascii?Q?1SvxF75grIBoEF+DCKxe/0oXjHtHaMOOU6WVZ1+SCFegaHC1pzIHZRtokQvR?=
 =?us-ascii?Q?X+xbcAJBAAYnBEZNo+HCfBfkrv9AX50Hm99A49YnhrUSJUMQtOxTrD8bj6SA?=
 =?us-ascii?Q?u54tzMQSGh37hVR1KsVhtnLs2LECw/jw153islFz2S/Xfwlz06DamAjVfwEo?=
 =?us-ascii?Q?8/r60Q3opuaZyWuyy2c33IcLTCq9vIzbbSRjHLu0fnZP5hBBldoQrd1LSbME?=
 =?us-ascii?Q?ah/jxSrnpVMBqqR1+U9n+grqSiZFEwlARXEemYJwyWkUGdv6qhHUd/DzLkH6?=
 =?us-ascii?Q?SMf8B0YKFpV7v1nCm7oCkgzJLtIV6wGBpd4zPt8k3eiJTuS0Wg2ASjiKQWic?=
 =?us-ascii?Q?JF5A+mBGwAbHSbsKe5ixBSGvMkYqKcjslMOvdnV/NFM0K4iz94vCaSYKr0W4?=
 =?us-ascii?Q?BPA+S0k4VPyN4Ee5+yC0lmZUpZyv4SKzrOfk7uua10/BqpCo6aro/wyLSDFY?=
 =?us-ascii?Q?deSV+3/DcstAFKf2fDyeIRTKWMNKCUnFUJkOYFMhOmc11+TMYt13aoyzX0/A?=
 =?us-ascii?Q?UbVw2TbO0mK7zVR1jciCbE8dLh/VHXj4baYz1ycz8IhJWt1eLkBJDHfjrSfB?=
 =?us-ascii?Q?2+Ebpqmg+y4nUwCkRMSR5p5vH5sng3TmEVmy8SzXn0mW0fnhqDNeSZ/E0VLm?=
 =?us-ascii?Q?LBYAUqaPFEa+/lkEH7K01DhIVrwfzNJvy6Xh5dhPzPycf7HGnReGPXKHPKm5?=
 =?us-ascii?Q?e1R5ig+dA2q6vE8ZXDuIwIJSdjyL37PRZohb0EVNvRiyXzoHTn8tBh2nm2w6?=
 =?us-ascii?Q?M2JCsoSV3FsnhEGzDRBY5LgNt3/L+ZK6TwyDO1t4ewqY/XKX3o+M/SL+9mbs?=
 =?us-ascii?Q?Hgsv4QkQyOV+yJFGycrRTTdmAI/qi5o8ozd2mBrX6jBEHrc38w1xyMmQCPpL?=
 =?us-ascii?Q?+DJq6YuDxheU5vWWAiRch4dI4Dpkswenu4SrAt4tyeicCrHD2v9hsf3zWVHB?=
 =?us-ascii?Q?l5FU7q0iuX0VHDUCy06hbNC9vUUrnb1JMAZ8midZ+GiGqLZ6ufgUReAI/QeW?=
 =?us-ascii?Q?urrGtyJiQMVnQPmM39uFI7G4MvCKXoDXdQWbvXbKe2htlGyO6I5eJjeAcVKu?=
 =?us-ascii?Q?mg0stBd0An2WAYeX5kNZVm8IaYXgGWVkcLEPG0HB2g/miFNw6cby/k2IX8/P?=
 =?us-ascii?Q?avix9/Z19uMGbgVvx2LDwY2evuPzzIoqOfFRsm7AOcfNXfEh5mq3X9eFyonm?=
 =?us-ascii?Q?zcXPQ1TjHjjnsKxazK23EdyDeg2V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dFLLyP3XwEU/F0+fP+Cjppr5L35ugIfyED1D4Ct4cxMbABeqB78L6gWMfkbM?=
 =?us-ascii?Q?okoZcD7ki+H+eqBScKwt890Qh2F9DqO7pIm40B2a1otUhmR3nKYi0QYx3RKz?=
 =?us-ascii?Q?q1SgHcxC6v8oVNvz4KBHY8kU3nF7HFRblA74J8Do6I6E/NgrgqkhpIRUz9GJ?=
 =?us-ascii?Q?iMscxq3S6BmShJZv/ebeC2Y03LFptAbZi+08Kda89hR95NyfO6HotCsHGMtU?=
 =?us-ascii?Q?UQbI+x4chgVAoqqrpSbjK2WHtqn2OpuNX2K2aJC+b+A6KDwE47bmPTVQQ+Bl?=
 =?us-ascii?Q?53l4ENuHhR9jtb12KxEG7xnlNQ0bS5jxr3iLr49cer3oD2aZAiGjXOsdLTy5?=
 =?us-ascii?Q?5N5bmw9xh6C9rerqrmzGToAWwDgfgPtJniMxio45Q4mnKh3RmfMx1ZUko7zL?=
 =?us-ascii?Q?rypv6YKSAF+Kts1tJwNCxsffVKPVALa9/1oGRtKO5bV9X9mh7GdgFeH/azyv?=
 =?us-ascii?Q?Zr9Ktin/FURF4tSkZ4R6kRrxJxOhDNxx1I5LQKEbNCp2fRhp669n/Tpp7CoS?=
 =?us-ascii?Q?Ji3/7QvahoJ+YnzC/NnZ49amo3rFBVjlgDGkt9T21HNrPEKpT6m7PUTj9Znz?=
 =?us-ascii?Q?APTOFBQZrQpWK/tSPJVWVVgKzufjMeEa/h6WdCqEFLPp62PACsWjR1MI22ji?=
 =?us-ascii?Q?3nkk32c11AF5k/gLBsx+6cFDQyn0Lld2odXb+5OcD4lhYXiLe68R3c2lQ8wS?=
 =?us-ascii?Q?hT4nW7egGBSI8qEXYKosQ7PKdNAhH8dRzwTXBbtSJ7vN2eB/9EVi1uMmKQ5r?=
 =?us-ascii?Q?ggnrBVkjLttnx/OxKPKxzDnBC+2N0nQPctOtfEGoNyGPrwFol7vo/3u/gkXJ?=
 =?us-ascii?Q?4KY5nOnkwc24wbv58gtYaciRbsmA7pfbGN4uQp2oDM8/688h1XBPOyv0+Vqu?=
 =?us-ascii?Q?2Jj4QIrrfFP+6BJOL3pgf6b54+fgXEGvBBRWBjBYV91ldJkmgLYyV5X4BG+Z?=
 =?us-ascii?Q?VytG/E6yz4rTnFC116rDEEd0eKwC/RKigAauWjogFGcGbkOSgEoyZL5CKYwE?=
 =?us-ascii?Q?eMlmz1KJ19HSnWK97MRy5oBNj0CbhU6T11sHejkAXkd7AuyJE+3IpAH1LelK?=
 =?us-ascii?Q?4qS1jxir32sqBvQCKSTiy72PFY0tBh7+S0GLrfAdSU/Lkzvvb7I3m8I+YxfY?=
 =?us-ascii?Q?E69l08OuFJYc4pxpGuG15gDO8fUdRB8qALvtFnWxxCTQfQ3LG/5YrDo+x+da?=
 =?us-ascii?Q?XsiqogII4OQo/5AmJdRElYSMZ2Cp3gbbfrIl7F/X17QzI8LETSwbibpqtWWF?=
 =?us-ascii?Q?kEbbgZFpDypp0yCBXckThdTIKUvsPhYa7NYlGGvStYZQU1kYq7bEUNTqlWTn?=
 =?us-ascii?Q?kl5PJld04H9VeaEZ/ROd6iFs89bEqOtq0Y7AIt+fSKokNcfqFAlbjXZ35hsK?=
 =?us-ascii?Q?yGBa1qjJZvJYZE7fWpS928fbvSjmFYnyitEnCLnRbQ6YYyrfdc8ujZFHB4nj?=
 =?us-ascii?Q?GPAzhJLLd3oj2LcF9RIp8Ki2dNLnflSy4xtQfl4IhgmwL0hTSGdF1xxiNzwQ?=
 =?us-ascii?Q?w4wfHa5Dn7uralWDLuvcEYnlGr70BmaAJGpRMtTwdd6EvXpLbepnAOUGTjhU?=
 =?us-ascii?Q?oHssH5WZtGHvbDDI2BDUy3L1G/7MPHaQrH4CHK8W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ad52bc-3ac6-4a1e-abfd-08dcf19c3a77
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:47:28.5375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAylx9UhM1QPdH43nREmG312ZgQ8Y6z4exHG9Awy/9wAys2kzqRVOfa+h0IiryB3Wd9wmGsgLrlOeCj36BwmBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
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

Add basic HDMI video output support. Currently, only RGB888 output
pixel format is supported.  At the LVDS input side, the driver
supports single LVDS link and dual LVDS links with "jeida-24" LVDS
mapping.

Product link:
https://www.ite.com.tw/en/product/cate1/IT6263

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* Use HDMI connector framework.  (Maxime)
* Control the missing HDMI_REG_AVI_INFOFRM_CTRL register.
* Validate the maximal HDMI TMDS character rate.  (Dmitry)
* Get LVDS data mapping from data-mapping DT property.  (Dmitry, Biju)
* Validate 30bit LVDS data bit order by checking data-mirror DT property.
* Use drm_of_lvds_get_dual_link_pixel_order_sink().  (Dmitry)
* Initialize a bridge connector instead of open coding.  (Dmitry)
* Add a comment that IT6263 chip has no HPD IRQ support.  (Dmitry)
* Use devm_drm_bridge_add() instead of drm_bridge_add().  (Dmitry)
* Fix a minor build warning reported by kernel test robot.

v2:
* Add AVI inforframe support.  (Maxime)
* Add DRM_MODE_CONNECTOR_HDMIA.  (Biju)
* Rename it6263_reset() to it6263_hw_reset().  (Biju)
* Check number of LVDS link data lanes.  (Biju)

 drivers/gpu/drm/bridge/Kconfig      |  11 +
 drivers/gpu/drm/bridge/Makefile     |   1 +
 drivers/gpu/drm/bridge/ite-it6263.c | 906 ++++++++++++++++++++++++++++
 3 files changed, 918 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 609f4d0ac93d..6b4664d91faa 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,6 +90,17 @@ config DRM_FSL_LDB
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
+config DRM_ITE_IT6263
+	tristate "ITE IT6263 LVDS/HDMI bridge"
+	depends on OF
+	select DRM_DISPLAY_HDMI_STATE_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	help
+	  ITE IT6263 LVDS to HDMI bridge chip driver.
+
 config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 3daf803ce80b..97304b429a53 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
+obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
 obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
new file mode 100644
index 000000000000..1ad7727742bf
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -0,0 +1,906 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/hdmi.h>
+#include <linux/i2c.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+
+/* -----------------------------------------------------------------------------
+ * LVDS registers
+ */
+
+/* LVDS software reset registers */
+#define LVDS_REG_05			0x05
+#define  REG_SOFT_P_RST			BIT(1)
+
+/* LVDS system configuration registers */
+/* 0x0b */
+#define LVDS_REG_0B			0x0b
+#define  REG_SSC_PCLK_RF		BIT(0)
+#define  REG_LVDS_IN_SWAP		BIT(1)
+
+/* LVDS test pattern gen control registers */
+/* 0x2c */
+#define LVDS_REG_2C			0x2c
+#define  REG_COL_DEP			GENMASK(1, 0)
+#define  BIT8				FIELD_PREP(REG_COL_DEP, 2)
+#define  OUT_MAP			BIT(4)
+#define  JEIDA				0
+#define  REG_DESSC_ENB			BIT(6)
+#define  DMODE				BIT(7)
+#define  DISO				BIT(7)
+#define  SISO				0
+
+#define LVDS_REG_3C			0x3c
+#define LVDS_REG_3F			0x3f
+#define LVDS_REG_47			0x47
+#define LVDS_REG_48			0x48
+#define LVDS_REG_4F			0x4f
+#define LVDS_REG_52			0x52
+
+/* -----------------------------------------------------------------------------
+ * HDMI registers are separated into three banks:
+ * 1) HDMI register common bank: 0x00 ~ 0x2f
+ */
+
+/* HDMI genernal registers */
+#define HDMI_REG_SW_RST			0x04
+#define  SOFTREF_RST			BIT(5)
+#define  SOFTA_RST			BIT(4)
+#define  SOFTV_RST			BIT(3)
+#define  AUD_RST			BIT(2)
+#define  HDCP_RST			BIT(0)
+#define  HDMI_RST_ALL			(SOFTREF_RST | SOFTA_RST | SOFTV_RST | \
+					 AUD_RST | HDCP_RST)
+
+#define HDMI_REG_SYS_STATUS		0x0e
+#define  HPDETECT			BIT(6)
+#define  TXVIDSTABLE			BIT(4)
+
+#define HDMI_REG_BANK_CTRL		0x0f
+#define  REG_BANK_SEL			BIT(0)
+
+/* HDMI System DDC control registers */
+#define HDMI_REG_DDC_MASTER_CTRL	0x10
+#define  MASTER_SEL_HOST		BIT(0)
+
+#define HDMI_REG_DDC_HEADER		0x11
+
+#define HDMI_REG_DDC_REQOFF		0x12
+#define HDMI_REG_DDC_REQCOUNT		0x13
+#define HDMI_REG_DDC_EDIDSEG		0x14
+
+#define HDMI_REG_DDC_CMD		0x15
+#define  DDC_CMD_EDID_READ		0x3
+#define  DDC_CMD_FIFO_CLR		0x9
+
+#define HDMI_REG_DDC_STATUS		0x16
+#define  DDC_DONE			BIT(7)
+#define  DDC_NOACK			BIT(5)
+#define  DDC_WAITBUS			BIT(4)
+#define  DDC_ARBILOSE			BIT(3)
+#define  DDC_ERROR			(DDC_NOACK | DDC_WAITBUS | DDC_ARBILOSE)
+
+#define HDMI_DDC_FIFO_BYTES		32
+#define HDMI_REG_DDC_READFIFO		0x17
+#define HDMI_REG_LVDS_PORT		0x1d /* LVDS input control I2C addr */
+#define HDMI_REG_LVDS_PORT_EN		0x1e
+#define LVDS_INPUT_CTRL_I2C_ADDR	0x33
+
+/* -----------------------------------------------------------------------------
+ * 2) HDMI register bank0: 0x30 ~ 0xff
+ */
+
+/* HDMI AFE registers */
+#define HDMI_REG_AFE_DRV_CTRL		0x61
+#define  AFE_DRV_PWD			BIT(5)
+#define  AFE_DRV_RST			BIT(4)
+
+#define HDMI_REG_AFE_XP_CTRL		0x62
+#define  AFE_XP_GAINBIT			BIT(7)
+#define  AFE_XP_ER0			BIT(4)
+#define  AFE_XP_RESETB			BIT(3)
+
+#define HDMI_REG_AFE_ISW_CTRL		0x63
+
+#define HDMI_REG_AFE_IP_CTRL		0x64
+#define  AFE_IP_GAINBIT			BIT(7)
+#define  AFE_IP_ER0			BIT(3)
+#define  AFE_IP_RESETB			BIT(2)
+
+/* HDMI input data format registers */
+#define HDMI_REG_INPUT_MODE		0x70
+#define  IN_RGB				0x00
+
+/* HDMI general control registers */
+#define HDMI_REG_HDMI_MODE		0xc0
+#define  TX_HDMI_MODE			BIT(0)
+
+#define HDMI_REG_GCP			0xc1
+#define  AVMUTE				BIT(0)
+#define  HDMI_COLOR_DEPTH		GENMASK(6, 4)
+#define  HDMI_COLOR_DEPTH_24		FIELD_PREP(HDMI_COLOR_DEPTH, 4)
+
+#define HDMI_REG_PKT_GENERAL_CTRL	0xc6
+#define HDMI_REG_AVI_INFOFRM_CTRL	0xcd
+#define  ENABLE_PKT			BIT(0)
+#define  REPEAT_PKT			BIT(1)
+
+/* -----------------------------------------------------------------------------
+ * 3) HDMI register bank1: 0x130 ~ 0x1ff (HDMI packet registers)
+ */
+
+/* AVI packet registers */
+#define HDMI_REG_AVI_DB1		0x158
+#define HDMI_REG_AVI_DB2		0x159
+#define HDMI_REG_AVI_DB3		0x15a
+#define HDMI_REG_AVI_DB4		0x15b
+#define HDMI_REG_AVI_DB5		0x15c
+#define HDMI_REG_AVI_CSUM		0x15d
+#define HDMI_REG_AVI_DB6		0x15e
+#define HDMI_REG_AVI_DB7		0x15f
+#define HDMI_REG_AVI_DB8		0x160
+#define HDMI_REG_AVI_DB9		0x161
+#define HDMI_REG_AVI_DB10		0x162
+#define HDMI_REG_AVI_DB11		0x163
+#define HDMI_REG_AVI_DB12		0x164
+#define HDMI_REG_AVI_DB13		0x165
+
+#define HDMI_AVI_DB_CHUNK1_SIZE		(HDMI_REG_AVI_DB5 - HDMI_REG_AVI_DB1 + 1)
+#define HDMI_AVI_DB_CHUNK2_SIZE		(HDMI_REG_AVI_DB13 - HDMI_REG_AVI_DB6 + 1)
+
+#define MAX_PIXEL_CLOCK_KHZ		150000
+#define HIGH_PIXEL_CLOCK_KHZ		80000
+#define MAX_HDMI_TMDS_CHAR_RATE_HZ	225000000
+
+struct it6263 {
+	struct device *dev;
+	struct i2c_client *hdmi_i2c;
+	struct i2c_client *lvds_i2c;
+	struct regmap *hdmi_regmap;
+	struct regmap *lvds_regmap;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct gpio_desc *reset_gpio;
+	int lvds_data_mapping;
+	bool lvds_dual_link;
+	bool lvds_link12_swap;
+};
+
+static inline struct it6263 *bridge_to_it6263(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct it6263, bridge);
+}
+
+static bool it6263_hdmi_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case HDMI_REG_SW_RST:
+	case HDMI_REG_BANK_CTRL:
+	case HDMI_REG_DDC_MASTER_CTRL:
+	case HDMI_REG_DDC_HEADER:
+	case HDMI_REG_DDC_REQOFF:
+	case HDMI_REG_DDC_REQCOUNT:
+	case HDMI_REG_DDC_EDIDSEG:
+	case HDMI_REG_DDC_CMD:
+	case HDMI_REG_LVDS_PORT:
+	case HDMI_REG_LVDS_PORT_EN:
+	case HDMI_REG_AFE_DRV_CTRL:
+	case HDMI_REG_AFE_XP_CTRL:
+	case HDMI_REG_AFE_ISW_CTRL:
+	case HDMI_REG_AFE_IP_CTRL:
+	case HDMI_REG_INPUT_MODE:
+	case HDMI_REG_HDMI_MODE:
+	case HDMI_REG_GCP:
+	case HDMI_REG_PKT_GENERAL_CTRL:
+	case HDMI_REG_AVI_INFOFRM_CTRL:
+	case HDMI_REG_AVI_DB1:
+	case HDMI_REG_AVI_DB2:
+	case HDMI_REG_AVI_DB3:
+	case HDMI_REG_AVI_DB4:
+	case HDMI_REG_AVI_DB5:
+	case HDMI_REG_AVI_CSUM:
+	case HDMI_REG_AVI_DB6:
+	case HDMI_REG_AVI_DB7:
+	case HDMI_REG_AVI_DB8:
+	case HDMI_REG_AVI_DB9:
+	case HDMI_REG_AVI_DB10:
+	case HDMI_REG_AVI_DB11:
+	case HDMI_REG_AVI_DB12:
+	case HDMI_REG_AVI_DB13:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool it6263_hdmi_readable_reg(struct device *dev, unsigned int reg)
+{
+	if (it6263_hdmi_writeable_reg(dev, reg))
+		return true;
+
+	switch (reg) {
+	case HDMI_REG_SYS_STATUS:
+	case HDMI_REG_DDC_STATUS:
+	case HDMI_REG_DDC_READFIFO:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool it6263_hdmi_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case HDMI_REG_SW_RST:
+	case HDMI_REG_SYS_STATUS:
+	case HDMI_REG_DDC_STATUS:
+	case HDMI_REG_DDC_READFIFO:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_range_cfg it6263_hdmi_range_cfg = {
+	.range_min = 0x00,
+	.range_max = HDMI_REG_AVI_DB13,
+	.selector_reg = HDMI_REG_BANK_CTRL,
+	.selector_mask = REG_BANK_SEL,
+	.selector_shift = 0,
+	.window_start = 0x00,
+	.window_len = 0x100,
+};
+
+static const struct regmap_config it6263_hdmi_regmap_config = {
+	.name = "it6263-hdmi",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.writeable_reg = it6263_hdmi_writeable_reg,
+	.readable_reg = it6263_hdmi_readable_reg,
+	.volatile_reg = it6263_hdmi_volatile_reg,
+	.max_register = HDMI_REG_AVI_DB13,
+	.ranges = &it6263_hdmi_range_cfg,
+	.num_ranges = 1,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static bool it6263_lvds_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LVDS_REG_05:
+	case LVDS_REG_0B:
+	case LVDS_REG_2C:
+	case LVDS_REG_3C:
+	case LVDS_REG_3F:
+	case LVDS_REG_47:
+	case LVDS_REG_48:
+	case LVDS_REG_4F:
+	case LVDS_REG_52:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool it6263_lvds_readable_reg(struct device *dev, unsigned int reg)
+{
+	return it6263_lvds_writeable_reg(dev, reg);
+}
+
+static bool it6263_lvds_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg == LVDS_REG_05;
+}
+
+static const struct regmap_config it6263_lvds_regmap_config = {
+	.name = "it6263-lvds",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.writeable_reg = it6263_lvds_writeable_reg,
+	.readable_reg = it6263_lvds_readable_reg,
+	.volatile_reg = it6263_lvds_volatile_reg,
+	.max_register = LVDS_REG_52,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static const char * const it6263_supplies[] = {
+	"ivdd", "ovdd", "txavcc18", "txavcc33", "pvcc1", "pvcc2",
+	"avcc", "anvdd", "apvdd"
+};
+
+static int it6263_parse_dt(struct it6263 *it)
+{
+	struct device *dev = it->dev;
+	struct device_node *port0, *port1;
+	int ret = 0;
+
+	it->lvds_data_mapping = drm_of_lvds_get_data_mapping(dev->of_node);
+	if (it->lvds_data_mapping < 0) {
+		dev_err(dev, "%pOF: invalid or missing %s DT property: %d\n",
+			dev->of_node, "data-mapping", it->lvds_data_mapping);
+		return it->lvds_data_mapping;
+	}
+
+	/* LVDS bit order is reversed only for 30-bit data mappings. */
+	if (of_property_read_bool(dev->of_node, "data-mirror") &&
+	    it->lvds_data_mapping != MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG &&
+	    it->lvds_data_mapping != MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA) {
+		dev_err(dev, "%pOF: invalid data-mirror DT property\n",
+			dev->of_node);
+		return -EINVAL;
+	}
+
+	it->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
+	if (IS_ERR(it->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
+				     "failed to get next bridge\n");
+
+	port0 = of_graph_get_port_by_id(dev->of_node, 0);
+	port1 = of_graph_get_port_by_id(dev->of_node, 1);
+	if (port0 && port1) {
+		int order;
+
+		it->lvds_dual_link = true;
+		order = drm_of_lvds_get_dual_link_pixel_order_sink(port0, port1);
+		if (order < 0) {
+			dev_err(dev,
+				"failed to get dual link pixel order: %d\n",
+				order);
+			ret = order;
+		} else if (order == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
+			it->lvds_link12_swap = true;
+		}
+	} else if (port1) {
+		ret = -EINVAL;
+		dev_err(dev, "single input LVDS port1 is not supported\n");
+	} else if (!port0) {
+		ret = -EINVAL;
+		dev_err(dev, "no input LVDS port\n");
+	}
+
+	of_node_put(port0);
+	of_node_put(port1);
+
+	return ret;
+}
+
+static inline void it6263_hw_reset(struct it6263 *it)
+{
+	if (!it->reset_gpio)
+		return;
+
+	gpiod_set_value_cansleep(it->reset_gpio, 0);
+	fsleep(1000);
+	gpiod_set_value_cansleep(it->reset_gpio, 1);
+	/* The chip maker says the low pulse should be at least 40ms. */
+	fsleep(40000);
+	gpiod_set_value_cansleep(it->reset_gpio, 0);
+	/* addtional time to wait the high voltage to be stable */
+	fsleep(5000);
+}
+
+static inline int it6263_lvds_set_i2c_addr(struct it6263 *it)
+{
+	int ret;
+
+	ret = regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT,
+			   LVDS_INPUT_CTRL_I2C_ADDR << 1);
+	if (ret)
+		return ret;
+
+	return regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT_EN, BIT(0));
+}
+
+static inline void it6263_lvds_reset(struct it6263 *it)
+{
+	/* AFE PLL reset */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), 0x0);
+	fsleep(1000);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), BIT(0));
+
+	/* software pixel clock domain reset */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST,
+			  REG_SOFT_P_RST);
+	fsleep(1000);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST, 0x0);
+	fsleep(10000);
+}
+
+static inline void it6263_lvds_set_interface(struct it6263 *it)
+{
+	/* color depth */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
+	/* output mapping */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
+
+	if (it->lvds_dual_link) {
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), BIT(1));
+	} else {
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, SISO);
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), 0);
+	}
+}
+
+static inline void it6263_lvds_set_afe(struct it6263 *it)
+{
+	regmap_write(it->lvds_regmap, LVDS_REG_3C, 0xaa);
+	regmap_write(it->lvds_regmap, LVDS_REG_3F, 0x02);
+	regmap_write(it->lvds_regmap, LVDS_REG_47, 0xaa);
+	regmap_write(it->lvds_regmap, LVDS_REG_48, 0x02);
+	regmap_write(it->lvds_regmap, LVDS_REG_4F, 0x11);
+
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_SSC_PCLK_RF,
+			  REG_SSC_PCLK_RF);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, 0x07, 0);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_DESSC_ENB,
+			  REG_DESSC_ENB);
+}
+
+static inline void it6263_lvds_sys_cfg(struct it6263 *it)
+{
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_LVDS_IN_SWAP,
+			  it->lvds_link12_swap ? REG_LVDS_IN_SWAP : 0);
+}
+
+static inline void it6263_lvds_config(struct it6263 *it)
+{
+	it6263_lvds_reset(it);
+	it6263_lvds_set_interface(it);
+	it6263_lvds_set_afe(it);
+	it6263_lvds_sys_cfg(it);
+}
+
+static inline void it6263_hdmi_config(struct it6263 *it)
+{
+	regmap_write(it->hdmi_regmap, HDMI_REG_SW_RST, HDMI_RST_ALL);
+	regmap_write(it->hdmi_regmap, HDMI_REG_INPUT_MODE, IN_RGB);
+	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, HDMI_COLOR_DEPTH,
+			  HDMI_COLOR_DEPTH_24);
+}
+
+static enum drm_connector_status it6263_detect(struct it6263 *it)
+{
+	unsigned int val;
+
+	regmap_read(it->hdmi_regmap, HDMI_REG_SYS_STATUS, &val);
+	if (val & HPDETECT)
+		return connector_status_connected;
+	else
+		return connector_status_disconnected;
+}
+
+static int it6263_read_edid(void *data, u8 *buf, unsigned int block, size_t len)
+{
+	struct it6263 *it = data;
+	struct regmap *regmap = it->hdmi_regmap;
+	unsigned int start = (block % 2) * EDID_LENGTH;
+	unsigned int segment = block >> 1;
+	unsigned int count, val;
+	int ret;
+
+	regmap_write(regmap, HDMI_REG_DDC_MASTER_CTRL, MASTER_SEL_HOST);
+	regmap_write(regmap, HDMI_REG_DDC_HEADER, DDC_ADDR << 1);
+	regmap_write(regmap, HDMI_REG_DDC_EDIDSEG, segment);
+
+	while (len) {
+		/* clear DDC FIFO */
+		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_FIFO_CLR);
+
+		ret = regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS,
+					       val, val & DDC_DONE,
+					       2000, 10000);
+		if (ret) {
+			dev_err(it->dev, "failed to clear DDC FIFO:%d\n", ret);
+			return ret;
+		}
+
+		count = len > HDMI_DDC_FIFO_BYTES ? HDMI_DDC_FIFO_BYTES : len;
+
+		/* fire the read command */
+		regmap_write(regmap, HDMI_REG_DDC_REQOFF, start);
+		regmap_write(regmap, HDMI_REG_DDC_REQCOUNT, count);
+		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_EDID_READ);
+
+		start += count;
+		len -= count;
+
+		ret = regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS, val,
+					       val & (DDC_DONE | DDC_ERROR),
+					       20000, 250000);
+		if (ret && !(val & DDC_ERROR)) {
+			dev_err(it->dev, "failed to read EDID:%d\n", ret);
+			return ret;
+		}
+
+		if (val & DDC_ERROR) {
+			dev_err(it->dev, "DDC error\n");
+			return -EIO;
+		}
+
+		/* cache to buffer */
+		for (; count > 0; count--) {
+			regmap_read(regmap, HDMI_REG_DDC_READFIFO, &val);
+			*(buf++) = val;
+		}
+	}
+
+	return 0;
+}
+
+static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_check(conn_state->connector,
+						     conn_state->state);
+	if (ret)
+		return ret;
+
+	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0;
+}
+
+static void
+it6263_bridge_atomic_disable(struct drm_bridge *bridge,
+			     struct drm_bridge_state *old_bridge_state)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, AVMUTE, AVMUTE);
+	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
+	regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
+		     AFE_DRV_RST | AFE_DRV_PWD);
+}
+
+static void
+it6263_bridge_atomic_enable(struct drm_bridge *bridge,
+			    struct drm_bridge_state *old_bridge_state)
+{
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	struct it6263 *it = bridge_to_it6263(bridge);
+	const struct drm_crtc_state *crtc_state;
+	struct regmap *regmap = it->hdmi_regmap;
+	const struct drm_display_mode *mode;
+	struct drm_connector *connector;
+	bool is_stable = false;
+	struct drm_crtc *crtc;
+	unsigned int val;
+	bool pclk_high;
+	int i, ret;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	mode = &crtc_state->adjusted_mode;
+
+	regmap_write(regmap, HDMI_REG_HDMI_MODE, TX_HDMI_MODE);
+
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+
+	/* HDMI AFE setup */
+	pclk_high = mode->clock > HIGH_PIXEL_CLOCK_KHZ;
+	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, AFE_DRV_RST);
+	if (pclk_high)
+		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
+			     AFE_XP_GAINBIT | AFE_XP_RESETB);
+	else
+		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
+			     AFE_XP_ER0 | AFE_XP_RESETB);
+	regmap_write(regmap, HDMI_REG_AFE_ISW_CTRL, 0x10);
+	if (pclk_high)
+		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
+			     AFE_IP_GAINBIT | AFE_IP_RESETB);
+	else
+		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
+			     AFE_IP_ER0 | AFE_IP_RESETB);
+
+	/* HDMI software video reset */
+	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, SOFTV_RST);
+	fsleep(1000);
+	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, 0);
+
+	/* reconfigure LVDS and retry several times in case video is instable */
+	for (i = 0; i < 3; i++) {
+		ret = regmap_read_poll_timeout(regmap, HDMI_REG_SYS_STATUS, val,
+					       val & TXVIDSTABLE,
+					       20000, 500000);
+		if (!ret) {
+			is_stable = true;
+			break;
+		}
+
+		it6263_lvds_config(it);
+	}
+
+	if (!is_stable)
+		dev_warn(it->dev, "failed to wait for video stable\n");
+
+	/* HDMI AFE reset release and power up */
+	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, 0);
+
+	regmap_write_bits(regmap, HDMI_REG_GCP, AVMUTE, 0);
+
+	regmap_write(regmap, HDMI_REG_PKT_GENERAL_CTRL, ENABLE_PKT | REPEAT_PKT);
+}
+
+static enum drm_mode_status
+it6263_bridge_mode_valid(struct drm_bridge *bridge,
+			 const struct drm_display_info *info,
+			 const struct drm_display_mode *mode)
+{
+	unsigned long long rate;
+
+	if (mode->clock > MAX_PIXEL_CLOCK_KHZ)
+		return MODE_CLOCK_HIGH;
+
+	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	if (rate == 0)
+		return MODE_NOCLOCK;
+
+	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
+}
+
+static int it6263_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+	struct drm_connector *connector;
+	int ret;
+
+	ret = drm_bridge_attach(bridge->encoder, it->next_bridge, bridge,
+				flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret < 0)
+		return ret;
+
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
+	connector = drm_bridge_connector_init(bridge->dev, bridge->encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err(it->dev, "failed to initialize bridge connector: %d\n",
+			ret);
+		return ret;
+	}
+
+	drm_connector_attach_encoder(connector, bridge->encoder);
+
+	return 0;
+}
+
+static enum drm_connector_status it6263_bridge_detect(struct drm_bridge *bridge)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	return it6263_detect(it);
+}
+
+static const struct drm_edid *
+it6263_bridge_edid_read(struct drm_bridge *bridge,
+			struct drm_connector *connector)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	return drm_edid_read_custom(connector, it6263_read_edid, it);
+}
+
+static u32 *
+it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	if (it->lvds_data_mapping != MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA)
+		return NULL;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
+static enum drm_mode_status
+it6263_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				 const struct drm_display_mode *mode,
+				 unsigned long long tmds_rate)
+{
+	if (tmds_rate > MAX_HDMI_TMDS_CHAR_RATE_HZ)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
+				       enum hdmi_infoframe_type type)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	if (type == HDMI_INFOFRAME_TYPE_AVI)
+		regmap_write(it->hdmi_regmap, HDMI_REG_AVI_INFOFRM_CTRL, 0);
+	else
+		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+
+	return 0;
+}
+
+static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
+				       enum hdmi_infoframe_type type,
+				       const u8 *buffer, size_t len)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+	struct regmap *regmap = it->hdmi_regmap;
+
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
+		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return 0;
+	}
+
+	/* write the first AVI infoframe data byte chunk(DB1-DB5) */
+	regmap_bulk_write(regmap, HDMI_REG_AVI_DB1,
+			  &buffer[HDMI_INFOFRAME_HEADER_SIZE],
+			  HDMI_AVI_DB_CHUNK1_SIZE);
+
+	/* write the second AVI infoframe data byte chunk(DB6-DB13) */
+	regmap_bulk_write(regmap, HDMI_REG_AVI_DB6,
+			  &buffer[HDMI_INFOFRAME_HEADER_SIZE +
+				  HDMI_AVI_DB_CHUNK1_SIZE],
+			  HDMI_AVI_DB_CHUNK2_SIZE);
+
+	/* write checksum */
+	regmap_write(regmap, HDMI_REG_AVI_CSUM, buffer[3]);
+
+	regmap_write(regmap, HDMI_REG_AVI_INFOFRM_CTRL, ENABLE_PKT | REPEAT_PKT);
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs it6263_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.attach = it6263_bridge_attach,
+	.mode_valid = it6263_bridge_mode_valid,
+	.atomic_disable = it6263_bridge_atomic_disable,
+	.atomic_enable = it6263_bridge_atomic_enable,
+	.atomic_check = it6263_bridge_atomic_check,
+	.detect = it6263_bridge_detect,
+	.edid_read = it6263_bridge_edid_read,
+	.atomic_get_input_bus_fmts = it6263_bridge_atomic_get_input_bus_fmts,
+	.hdmi_tmds_char_rate_valid = it6263_hdmi_tmds_char_rate_valid,
+	.hdmi_clear_infoframe = it6263_hdmi_clear_infoframe,
+	.hdmi_write_infoframe = it6263_hdmi_write_infoframe,
+};
+
+static int it6263_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct it6263 *it;
+	int ret;
+
+	it = devm_kzalloc(dev, sizeof(*it), GFP_KERNEL);
+	if (!it)
+		return -ENOMEM;
+
+	it->dev = dev;
+	it->hdmi_i2c = client;
+
+	it->hdmi_regmap = devm_regmap_init_i2c(client,
+					       &it6263_hdmi_regmap_config);
+	if (IS_ERR(it->hdmi_regmap))
+		return dev_err_probe(dev, PTR_ERR(it->hdmi_regmap),
+				     "failed to init I2C regmap for HDMI\n");
+
+	it->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(it->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(it->reset_gpio),
+				     "failed to get reset gpio\n");
+
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it6263_supplies),
+					     it6263_supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get power supplies\n");
+
+	ret = it6263_parse_dt(it);
+	if (ret)
+		return ret;
+
+	it6263_hw_reset(it);
+
+	ret = it6263_lvds_set_i2c_addr(it);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set I2C addr\n");
+
+	it->lvds_i2c = devm_i2c_new_dummy_device(dev, client->adapter,
+						 LVDS_INPUT_CTRL_I2C_ADDR);
+	if (IS_ERR(it->lvds_i2c))
+		dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
+			      "failed to allocate I2C device for LVDS\n");
+
+	it->lvds_regmap = devm_regmap_init_i2c(it->lvds_i2c,
+					       &it6263_lvds_regmap_config);
+	if (IS_ERR(it->lvds_regmap))
+		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
+				     "failed to init I2C regmap for LVDS\n");
+
+	it6263_lvds_config(it);
+	it6263_hdmi_config(it);
+
+	i2c_set_clientdata(client, it);
+
+	it->bridge.funcs = &it6263_bridge_funcs;
+	it->bridge.of_node = dev->of_node;
+	/* IT6263 chip doesn't support HPD interrupt. */
+	it->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
+			 DRM_BRIDGE_OP_HDMI;
+	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	it->bridge.vendor = "ITE";
+	it->bridge.product = "IT6263";
+
+	return devm_drm_bridge_add(dev, &it->bridge);
+}
+
+static const struct of_device_id it6263_of_match[] = {
+	{ .compatible = "ite,it6263", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, it6263_of_match);
+
+static const struct i2c_device_id it6263_i2c_ids[] = {
+	{ "it6263", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, it6263_i2c_ids);
+
+static struct i2c_driver it6263_driver = {
+	.probe = it6263_probe,
+	.driver = {
+		.name = "it6263",
+		.of_match_table = it6263_of_match,
+	},
+	.id_table = it6263_i2c_ids,
+};
+module_i2c_driver(it6263_driver);
+
+MODULE_DESCRIPTION("ITE Tech. Inc. IT6263 LVDS/HDMI bridge");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

