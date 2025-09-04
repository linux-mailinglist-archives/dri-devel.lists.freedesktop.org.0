Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20415B4335F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B0410E983;
	Thu,  4 Sep 2025 07:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="E3dnrWX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA6710E983
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 07:07:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyZFgL4yH40nSGGsnGRqmWhddmBBjg+cxT4cqfkxYhZMJHgtYcI32rI6yCELvirzOp3Z1OSeMc7WlkwjGxcswkTqHr5H7Fn/zljqLDeP+buVNF5qQQkmqbtcL+vKxLe/fpWFVqqdEd3hwnUfeUUfO6klT+8Ev6jY01jif6xhGlnDnwSOw3jChtC8C9hHSFreI9wXlRHpfdCbELNdV6AgHic52gXQcRGOnUcN0stehz9MhhxVZusvmGALQNS4GctkiL0m7EQEhzhQZGWL5PnShchHuzV1ZX+5j1k5KPzaDHkneZTXql3gItYad5EezHnxJNpFofeCtqNkv6wSkXik0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOW0QiWFlZg1FlGWJIAh3KOM4jLl1sCBQmUFGePGhC4=;
 b=E/6FcVGcIh+Q3YesGhR9JZj+v3AR/wu2Bb1cvms7J4ozNgMuwew61TUsJKfHmVp3cSSpbaoFh+AIiFBHwjYgaualBmyUCs9AuR5SUiq2K18PKQ0NzfEvcV6SLP+q9X671oFS/hFo2mBPOW9gcBvGCbvnVfeDQ3kV2aeecmE4EbF63zht1rE/EfZk9yYRgVdwAd3W5ncuO2wLdp5mv85QBt3O9S+QACeAmU4mizNlR9mzuCrcILbSBVQmCek4KOZoeRBlTCkaFu6uaE07vZC3WRsNSFm98WteE24XdDFwkdfOuMu0HaGRpP4OZ0gPlhwOh7gEtSXSFHapDH7kSuAcOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOW0QiWFlZg1FlGWJIAh3KOM4jLl1sCBQmUFGePGhC4=;
 b=E3dnrWX0v31GE5vC+oDPPbUtWCmQdMHrjB8FHEbrCRBRB6IsjwQYMoaHKBhgJ30NnFbw/QFfqOp2e+XhYWLa0w6QqeQGJ8Vytemxkp+0DbTyAmhJUeR+uDg93iZnNoDWPQjrLcSZTUfz0jfmgWf1beQnIwhcVEc+1ZLAvWZXqtezd24lhh9NweflCi0I6gHJnjbIt343bQRFp4TE+yu4NVxSn0EKt/XCXlJWamXefv/4kfAduzm7x7qCq2tVZDnp5d51UhV7pzICI6yuQWwSV/DE5mjJeXZIKxmdHHFG3iSmTEkS4L1YMXTWV1sOrcozzwhVxarPkIO03VedS+90ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7002.eurprd04.prod.outlook.com (2603:10a6:10:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 07:07:14 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%6]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 07:07:14 +0000
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
Subject: [PATCH v6 5/7] drm/bridge: imx: add driver for HDMI TX Parallel Audio
 Interface
Date: Thu,  4 Sep 2025 15:05:58 +0800
Message-Id: <20250904070600.1361165-6-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
References: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: b8a6e1e8-c5d5-4896-6b72-08ddeb81ad0c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dTPA/5HZMZ/U9/3A0EkURl6UHefa78Ad09hGkh4piX02E/qW4S9FADGRa6tq?=
 =?us-ascii?Q?0/FdvXhbhFfgC3DT1650OUFbUt6ust6Dttw1Sw3xKwbr+DTGADJaKU8PHXpv?=
 =?us-ascii?Q?Z28QJpOtyzR9374sqou1QuFz0vjnNnrWVkPuGyg9zDCPhPuGs+KhcWBMfvyu?=
 =?us-ascii?Q?VCVcrGBObhBzHKTt2BBSBzhF7m5AdwxV7PT77Lih4eTs2zwSD9VWCvyvYzZF?=
 =?us-ascii?Q?HY+W+qZ1IPg9/Ieyn3GjOAIUJBRXRTgEZNYwk38dIy88wNJpnYdeqsEegXqk?=
 =?us-ascii?Q?7calALQwUk38KUR00sKTMgW8GaIoLq4i9g/KIRwoejWdEvuLAnpy+osdo7Cl?=
 =?us-ascii?Q?sWeqtXfyz4uycVGjYeWiVgw4hB7J1fk4qgh6NSZj07kXjPQAqO1DthHLFozC?=
 =?us-ascii?Q?4aKRp074q4aJU9pV9M6f9DsFfzefFhxXXvOfUC4WWIKn9lZQ6vKxy2K+vlaW?=
 =?us-ascii?Q?tDAHesfAGMU6z20KNJHJlh5f2V17/uXbZAebhSSqACI4tlsuPtx7+9Oz6Asj?=
 =?us-ascii?Q?01qeXGbDdivxHlv9c1XOOWDs92EFhcgPLWa3w4IHp5kEd97pcSuI7ocTa8ZZ?=
 =?us-ascii?Q?8Yr6JW4+BBkQ38E1Rqj82nrf/mFAsQmvDJoCSBpZXmi9EwadTPh07VDDcl4o?=
 =?us-ascii?Q?c84zdkW3Kdg0NpmK4KXLtGLjz/sv3TRYIUhRy18itm1MlQ/1Ie1T8u1tDY9G?=
 =?us-ascii?Q?wbNP8TaIuKtI13k9eD/qWS4sq0GkAjdCE4T2K6PRqs2IkkBDXWIl7/DeGSEJ?=
 =?us-ascii?Q?whkK6qAA8MyIMpz1hzGjSJQ4BlqmpQOjoWVa2EgT+eThqECwOgPFohRXsCBI?=
 =?us-ascii?Q?lsXlg4LR9Dlh643e94vOO0A2zG/E1if6jUCq8x9Nccc7Hc3w6r3JkIak9Z0D?=
 =?us-ascii?Q?+wIXZATBemE3+pAkszEolTIt8+iNg0RTFW3Smkd6ZhnJh+NyVWYpdFc5GyeC?=
 =?us-ascii?Q?QIrGq7XCWEiw46Tax6D/Sg5pCoWtfUTXypacMDpGc5a5H661Act5kvWeRRcE?=
 =?us-ascii?Q?WKeh1jlKutR7FBKo4JbUD0GvZ3IfEE71KPH6/WxRkC4qEQ2CT2vM1rR3NwRp?=
 =?us-ascii?Q?+QsbSiApf7NasLAhn+uoHsD+wMB5gCOih8YPifwBN7WtMWdc+jMQMk5UXjJC?=
 =?us-ascii?Q?ZXnwcrVKBzGzCpHwhJyTSyatvIDpsdzJv4jqQNpb3eURKfCJSukXtc2SK/QF?=
 =?us-ascii?Q?uLLU+F+FH+MGIRnvBU+NXiDSOkWnsaR7wz53xEIiIojw9hXWkLVNosgSaLZk?=
 =?us-ascii?Q?FJpMfjhg55/lUkdX2KvhPbCJJgDEbk6Rw8qwhKfR5EfCRHGCDqmJ6nQNA7nY?=
 =?us-ascii?Q?HIsz6ogMvCBxveAgloPSNx3LOp97HosGVzCehHc1izJYqUdl3MZPLmM93dPh?=
 =?us-ascii?Q?4V+f44z2x65zhb+tqgjFnmAA+/hXzxEsdKJXxJUKr2ZrgyJ6aj7mtfj0b0Qy?=
 =?us-ascii?Q?Wctbxr1JHMfQVOOlClTf/oCnwJeumzCURbLOA0QZjA4aRDceNssODPnG6+Nc?=
 =?us-ascii?Q?vT9zVu48sIUkSwk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/5qnesS7Dq5YVfhMwPHT+49pJAZVa3Hb66+jtBA2HE22+KJUcv1YvqO+ju7N?=
 =?us-ascii?Q?BkAAv3FIPCjuBgByNwnbS+uDQhfiUvVFoQMBN373BzoDypSbShW03v7Q2exX?=
 =?us-ascii?Q?5yiB9pCt7T3N9QFCVh7//g73zHjY73hSYgTQmfAtZFQCQ0koAHDNVGl+rjWr?=
 =?us-ascii?Q?aEapybZLaFEU8NeyvJKSxQ71BiOP8XWLQkVeDM5n0dSZRPhQqf2zvGAIEuIS?=
 =?us-ascii?Q?nhF8zagdobOtkFWd0tqjm0ATMEDu5bSepMeNNqB9AcUJT4YqC6zGwbcojKDk?=
 =?us-ascii?Q?PmpmsVfsEKoJbXV+gkpNsgbwVzhi/UkhI9Pa8CuwZDnX76lkyCffboBGeylP?=
 =?us-ascii?Q?c6K57fFO49f0nZap5y0XGfjLUiRn8x70sfhM8+4acxalG8+YpbvdxmGoMdFo?=
 =?us-ascii?Q?WlwT6/lX9+H211ePyjP8AmZ93Tf2ITcB+5CmXHmWVLjcUegCdVhV6+F22g2g?=
 =?us-ascii?Q?NCnkpIiMtG8rhdvE6RRpb4uB2+/06qlYEBB++2xUDntrWrh8l0d+5yW7Egji?=
 =?us-ascii?Q?V9pI/H2R5SGKakMj2gSOHBbnj2jcD657symOkS88f/3h80QzLadiMfFPeZH0?=
 =?us-ascii?Q?gwczkaeAOxm7AATYKPSH3EeJsdMlR9VQdannfyNoK4nVlYTTqYDeILlSILpg?=
 =?us-ascii?Q?p42o7VJLasCZPzGD8lr67Cpj/EjwTbZiXmx+Scb4/9VBb7hKQn7FL3SAoD4M?=
 =?us-ascii?Q?XXXrBzfCqG+t2ZGU/P/rHWjn8mLLOGUOma5bxIwT3HajO9sz7tYcDSgOkavT?=
 =?us-ascii?Q?eR1dllzz0DJDcqksPojM6rDKQC4jSQ/tCUkxbkd5A8hOlBgz/w1ujGI4TKaf?=
 =?us-ascii?Q?Kt+Pioitg7N2I78m5eYX1b80mPuf9tYFpzo03DTH0kIpr4Kk3SeATffTHHmr?=
 =?us-ascii?Q?MJZY7/F3r8eFd0dbdLLF5Q2EooukeT07eqKWGATnIcc9bcQRGPHOrLYWbVCY?=
 =?us-ascii?Q?CY0IJUMZIGK11pK64LSx4y7gRocKcYayxgItl+PWRPzOSx0uu4IBLDcjK0lx?=
 =?us-ascii?Q?I2rlp810juWOQtxiT5T/djfW+7jxeXyW7TPZEtTUnI2bcC2AWR2iNTGhewKA?=
 =?us-ascii?Q?vIBaBoPwwbEr8hWtL2VdSstmOjAexxIZ+5CysjXkrZAaecpPJr1ZTK5BofTP?=
 =?us-ascii?Q?apr//xu30dI7F+7/sUhlIW5LFCn7ScchCTZzIqAnfUgIFli27Prti3B30C5s?=
 =?us-ascii?Q?acxkR+MY4A6doZrwdAp4gfQaCKrB8ZYAwbR679t6fYL8IQ9jwzlkWifpjw9d?=
 =?us-ascii?Q?kFllWDA59gIjF2DXa1ap6xZN51kyDj2D3jJPTm96Oj1ZIMF4wUwWUfQtWjGr?=
 =?us-ascii?Q?LX8lGGQbqX2naCa0/zOY+zrEz7bW98jHg0YEooYoPXC3eoywyGCjCn3GiUDX?=
 =?us-ascii?Q?+qlg5agDVbup+Ipx/5SB7Gk/AkGCgstKvFkGWgkuTBWwolD7ueGLzvePNxiQ?=
 =?us-ascii?Q?HHaO/v3zC9AWT7PpGJuxsPmabRSVlhPV/vLL7PnBXuoUgJj/5Qfp19PHFQ5p?=
 =?us-ascii?Q?Z5Mnr6ifa7kU2uC1Rp2XK2dvX1nCiRYzVqg3e/U5E7BDYobytudn8zTwE3+l?=
 =?us-ascii?Q?4HXwdU1bkWC4NMtydKPF0JaZTJXJ7rv+eLtUx2Mw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a6e1e8-c5d5-4896-6b72-08ddeb81ad0c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:07:14.5885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dT139s9HOjCETEHM6F9uC9ILIZlP7QEqpyK3UMPej/Mr/ndzcqPNSKcNly4vUh6LAUz/4OGoq04jLO2t1iBDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7002
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

The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
This IP block is found in the HDMI subsystem of the i.MX8MP SoC.

Data received from the audio subsystem can have an arbitrary component
ordering. The HTX_PAI block has integrated muxing options to select which
sections of the 32-bit input data word will be mapped to each IEC60958
field. The HTX_PAI_FIELD_CTRL register contains mux selects to
individually select P,C,U,V,Data, and Preamble.

Use component helper so that imx8mp-hdmi-tx will be aggregate driver,
imx8mp-hdmi-pai will be component driver, then imx8mp-hdmi-pai can use
bind() ops to get the plat_data from imx8mp-hdmi-tx device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/Kconfig           |  11 ++
 drivers/gpu/drm/bridge/imx/Makefile          |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 158 +++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c  |  65 +++++++-
 include/drm/bridge/dw_hdmi.h                 |   6 +
 5 files changed, 236 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9a480c6abb85..b9028a5e5a06 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -18,12 +18,23 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
 	depends on OF
 	depends on COMMON_CLK
 	select DRM_DW_HDMI
+	imply DRM_IMX8MP_HDMI_PAI
 	imply DRM_IMX8MP_HDMI_PVI
 	imply PHY_FSL_SAMSUNG_HDMI_PHY
 	help
 	  Choose this to enable support for the internal HDMI encoder found
 	  on the i.MX8MP SoC.
 
+config DRM_IMX8MP_HDMI_PAI
+	tristate "Freescale i.MX8MP HDMI PAI bridge support"
+	depends on OF
+	select DRM_DW_HDMI
+	select REGMAP
+	select REGMAP_MMIO
+	help
+	  Choose this to enable support for the internal HDMI TX Parallel
+	  Audio Interface found on the Freescale i.MX8MP SoC.
+
 config DRM_IMX8MP_HDMI_PVI
 	tristate "Freescale i.MX8MP HDMI PVI bridge support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index dd5d48584806..8d01fda25451 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
 obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
 obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
+obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) += imx8mp-hdmi-pai.o
 obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
 obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
new file mode 100644
index 000000000000..8d13a35b206a
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <drm/bridge/dw_hdmi.h>
+#include <sound/asoundef.h>
+
+#define HTX_PAI_CTRL			0x00
+#define   ENABLE			BIT(0)
+
+#define HTX_PAI_CTRL_EXT		0x04
+#define   WTMK_HIGH_MASK		GENMASK(31, 24)
+#define   WTMK_LOW_MASK			GENMASK(23, 16)
+#define   NUM_CH_MASK			GENMASK(10, 8)
+#define   WTMK_HIGH(n)			FIELD_PREP(WTMK_HIGH_MASK, (n))
+#define   WTMK_LOW(n)			FIELD_PREP(WTMK_LOW_MASK, (n))
+#define   NUM_CH(n)			FIELD_PREP(NUM_CH_MASK, (n) - 1)
+
+#define HTX_PAI_FIELD_CTRL		0x08
+#define   PRE_SEL			GENMASK(28, 24)
+#define   D_SEL				GENMASK(23, 20)
+#define   V_SEL				GENMASK(19, 15)
+#define   U_SEL				GENMASK(14, 10)
+#define   C_SEL				GENMASK(9, 5)
+#define   P_SEL				GENMASK(4, 0)
+
+struct imx8mp_hdmi_pai {
+	struct regmap	*regmap;
+};
+
+static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
+				   int width, int rate, int non_pcm,
+				   int iec958)
+{
+	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
+	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
+	int val;
+
+	/* PAI set control extended */
+	val =  WTMK_HIGH(3) | WTMK_LOW(3);
+	val |= NUM_CH(channel);
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL_EXT, val);
+
+	/* IEC60958 format */
+	if (iec958) {
+		val = FIELD_PREP_CONST(P_SEL,
+				       __bf_shf(IEC958_SUBFRAME_PARITY));
+		val |= FIELD_PREP_CONST(C_SEL,
+					__bf_shf(IEC958_SUBFRAME_CHANNEL_STATUS));
+		val |= FIELD_PREP_CONST(U_SEL,
+					__bf_shf(IEC958_SUBFRAME_USER_DATA));
+		val |= FIELD_PREP_CONST(V_SEL,
+					__bf_shf(IEC958_SUBFRAME_VALIDITY));
+		val |= FIELD_PREP_CONST(D_SEL,
+					__bf_shf(IEC958_SUBFRAME_SAMPLE_24_MASK));
+		val |= FIELD_PREP_CONST(PRE_SEL,
+					__bf_shf(IEC958_SUBFRAME_PREAMBLE_MASK));
+	} else {
+		/*
+		 * The allowed PCM widths are 24bit and 32bit, as they are supported
+		 * by aud2htx module.
+		 * for 24bit, D_SEL = 0, select all the bits.
+		 * for 32bit, D_SEL = 8, select 24bit in MSB.
+		 */
+		val = FIELD_PREP(D_SEL, width - 24);
+	}
+
+	regmap_write(hdmi_pai->regmap, HTX_PAI_FIELD_CTRL, val);
+
+	/* PAI start running */
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, ENABLE);
+}
+
+static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
+{
+	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
+	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
+
+	/* Stop PAI */
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
+}
+
+static const struct regmap_config imx8mp_hdmi_pai_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = HTX_PAI_FIELD_CTRL,
+};
+
+static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dw_hdmi_plat_data *plat_data = data;
+	struct imx8mp_hdmi_pai *hdmi_pai;
+	struct resource *res;
+	void __iomem *base;
+
+	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
+	if (!hdmi_pai)
+		return -ENOMEM;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	hdmi_pai->regmap = devm_regmap_init_mmio_clk(dev, "apb", base,
+						     &imx8mp_hdmi_pai_regmap_config);
+	if (IS_ERR(hdmi_pai->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(hdmi_pai->regmap);
+	}
+
+	plat_data->enable_audio = imx8mp_hdmi_pai_enable;
+	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
+	plat_data->priv_audio = hdmi_pai;
+
+	return 0;
+}
+
+static const struct component_ops imx8mp_hdmi_pai_ops = {
+	.bind   = imx8mp_hdmi_pai_bind,
+};
+
+static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &imx8mp_hdmi_pai_ops);
+}
+
+static void imx8mp_hdmi_pai_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &imx8mp_hdmi_pai_ops);
+}
+
+static const struct of_device_id imx8mp_hdmi_pai_of_table[] = {
+	{ .compatible = "fsl,imx8mp-hdmi-pai" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
+
+static struct platform_driver imx8mp_hdmi_pai_platform_driver = {
+	.probe		= imx8mp_hdmi_pai_probe,
+	.remove		= imx8mp_hdmi_pai_remove,
+	.driver		= {
+		.name	= "imx8mp-hdmi-pai",
+		.of_match_table = imx8mp_hdmi_pai_of_table,
+	},
+};
+module_platform_driver(imx8mp_hdmi_pai_platform_driver);
+
+MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 1e7a789ec289..32fd3554e267 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -5,11 +5,13 @@
  */
 
 #include <linux/clk.h>
+#include <linux/component.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_of.h>
 
 struct imx8mp_hdmi {
 	struct dw_hdmi_plat_data plat_data;
@@ -79,10 +81,45 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
 	.update_hpd	= dw_hdmi_phy_update_hpd,
 };
 
+static int imx8mp_dw_hdmi_bind(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
+	int ret;
+
+	ret = component_bind_all(dev, &hdmi->plat_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "component_bind_all failed!\n");
+
+	hdmi->dw_hdmi = dw_hdmi_probe(pdev, &hdmi->plat_data);
+	if (IS_ERR(hdmi->dw_hdmi)) {
+		component_unbind_all(dev, &hdmi->plat_data);
+		return PTR_ERR(hdmi->dw_hdmi);
+	}
+
+	return 0;
+}
+
+static void imx8mp_dw_hdmi_unbind(struct device *dev)
+{
+	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
+
+	dw_hdmi_remove(hdmi->dw_hdmi);
+
+	component_unbind_all(dev, &hdmi->plat_data);
+}
+
+static const struct component_master_ops imx8mp_dw_hdmi_ops = {
+	.bind   = imx8mp_dw_hdmi_bind,
+	.unbind = imx8mp_dw_hdmi_unbind,
+};
+
 static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dw_hdmi_plat_data *plat_data;
+	struct component_match *match = NULL;
+	struct device_node *remote;
 	struct imx8mp_hdmi *hdmi;
 
 	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
@@ -102,20 +139,38 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 	plat_data->priv_data = hdmi;
 	plat_data->phy_force_vendor = true;
 
-	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
-	if (IS_ERR(hdmi->dw_hdmi))
-		return PTR_ERR(hdmi->dw_hdmi);
-
 	platform_set_drvdata(pdev, hdmi);
 
+	/* port@2 is for hdmi_pai device */
+	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
+	if (!remote) {
+		hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
+		if (IS_ERR(hdmi->dw_hdmi))
+			return PTR_ERR(hdmi->dw_hdmi);
+	} else {
+		drm_of_component_match_add(dev, &match, component_compare_of, remote);
+
+		of_node_put(remote);
+
+		return component_master_add_with_match(dev, &imx8mp_dw_hdmi_ops, match);
+	}
+
 	return 0;
 }
 
 static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
 {
 	struct imx8mp_hdmi *hdmi = platform_get_drvdata(pdev);
+	struct device_node *remote;
 
-	dw_hdmi_remove(hdmi->dw_hdmi);
+	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
+	if (remote) {
+		of_node_put(remote);
+
+		component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
+	} else {
+		dw_hdmi_remove(hdmi->dw_hdmi);
+	}
 }
 
 static int imx8mp_dw_hdmi_pm_suspend(struct device *dev)
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 095cdd9b7424..336f062e1f9d 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
 					   const struct drm_display_info *info,
 					   const struct drm_display_mode *mode);
 
+	/*
+	 * priv_audio is specially used for additional audio device to get
+	 * driver data through this dw_hdmi_plat_data.
+	 */
+	void *priv_audio;
+
 	/* Platform-specific audio enable/disable (optional) */
 	void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
 			     int width, int rate, int non_pcm, int iec958);
-- 
2.34.1

