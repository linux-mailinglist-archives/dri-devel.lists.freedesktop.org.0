Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D820B9468D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 07:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEA810E561;
	Tue, 23 Sep 2025 05:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YV4tgpB5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0AB10E561
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 05:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ih79mRPJvvLRfeVMFarKmGj7vK1F0I25J3X9pvQ/TQygTt9ZM7jDhUz1TXwWJ6A/grS5Wg7t0J0krQkA5qAkIr/mDSfSoBpjPA3ukbjoPexWGVxBBUa89kpHUVUtJPmYOLgTf1HpRzssQHYdcOwRv6xO/yMt4CjuyxIobWgXeOoN20N03M31nDsirxK0mQ/veqDt1xBiI+59/4+bQz95R1GZ9rpaZ+BUQHHfIoTcSpS0jPKNNZ65R3UcN+LGiTJ8fI+cftF026ADGRVpden5b9dixH7jVzbu6kRPHQmihlkzY4IFqVX2qaq7Eg8aSFT8Q16043XRfQEENvI8ffShJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X03oPoLSTXUH9f8v9I4EHGwDSP0kSvw5e40DtbfgzPc=;
 b=j+KhweVcJCeMYjK33ReykE9xIGDMV0VtX9gpBILcDqopoqs5y/Dx9a47vfkEg0Ik6bq3SkLVIxOhxfi8rFZEwMLIOn1Fsf4ZigUBGn75VCO+nz7qni5AuoA3AGMpQxDSX4HQKAUviV1SUcmL2Y4Y73mu1FaNZ4tMRah70kM5hkzrbvFAhp/C22XhgVPfqiw5ZCJ/IjE9way2/I1o2DzJ9ji5UzBIl8LkRU66dP6UdgO9wWBAsgnGJ9tSCZnwShk9WsYTvV+ivUfPpFRzBM++0MA+aWl4NQCxRxCFI0xTtQWeN/iWBK9yThPFzy5VimBtljijvF+wfVErYjQbs7356g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X03oPoLSTXUH9f8v9I4EHGwDSP0kSvw5e40DtbfgzPc=;
 b=YV4tgpB5f+pudoTrjahzjugGT0CQfcQsCoIxQkpt1KRlU/119TL7kiPjPSaVO98g/aRhvBdnYlYvwhxQmR0v01L7bbSvkeryh9qZEPjcixnHCBFunb1mRWg6RoSXN8U5r3IFqtuZetO76YjHRI6C8U/YKIU7W1vX01vm3foIGVK4a2hqudU2j3Lzcmbe971WbSPJQvfhXKwb7Sh/MqYlahgXBx+Ft2UFQ3hza/5WLfzIR7VtimGLA48hV1AjRWSe/2ABZ8xGhOlAXpbg6nImx3XjIrm0dAuJjzp66tb0MVHUI9QTWOTaKWk7l3U2xpgeg2md4AASim59Kw/Pisccew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB7920.eurprd04.prod.outlook.com (2603:10a6:102:c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:31:15 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:31:15 +0000
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
Subject: [PATCH v7 5/7] drm/bridge: imx: add driver for HDMI TX Parallel Audio
 Interface
Date: Tue, 23 Sep 2025 13:29:59 +0800
Message-Id: <20250923053001.2678596-6-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7da19f-39a9-49b9-3582-08ddfa626a5a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iDwE9mcpWSANvIO9Fafbl58pAx1l3ZiTDGAkPGLIKCXMQ37060BqNbtGx47Q?=
 =?us-ascii?Q?OMAD6Rb3sOX+1ioX3wSYvjxNKR18cHnSh6NqiwOCpaJghkxYD2wQjkztdu+v?=
 =?us-ascii?Q?I5euKxwaOfK+GYcCCRTjnIdF+5Y/pbkoFdkyVfx82fCQWvSVdv9DISwcj8yl?=
 =?us-ascii?Q?f9wwHu9ckf2IzNNje+FP5CJHRf0Sr4nUoxPeVl9Dqa3SXcG/TeX7tv0lTgrs?=
 =?us-ascii?Q?I/S8LQPC1x6YxRnR17gJplfLgX6gonTpoDygcCcQbOk9kQA6gTw+eoY+fi/6?=
 =?us-ascii?Q?ahexgreUhrZK+Pj22Mcs3AfaWoO1FU1TmZQAmPoZsNIubbqWjnZpRoBl+283?=
 =?us-ascii?Q?NaEQ8PCYLvIRrJxnZJfgjIsRt8mnJWIngx2N7tcBUSeKjbvF/MsEBjClh2dd?=
 =?us-ascii?Q?wqFp4E4Ui3FuIqrnXvuWRmESVFEKeUUWgzFmxDNzpiE0/GKDM2bSrJynkcy1?=
 =?us-ascii?Q?/55dnz1tq3sxIsLKUxRdyYrcdMlUwDHEUYISuUfSBaH+SFFKVVe+AIE1zQ9C?=
 =?us-ascii?Q?IgmpPH1wkTM1Ymt+uHGqhZtDXgewZwZElZ2WSRlCbkFcwY0uGFVvM7OjNVlD?=
 =?us-ascii?Q?tDGAaZHJn0u0YUIvkmYZFhS/T5imIuDL34O0lwxlRZteyi/01QfYEfr+fRwb?=
 =?us-ascii?Q?hkxHpdw1SeVZWvKd0X+QajdYPkCm1PvNyEZPRw3UbqyW9XtBP8ziErMPAtcH?=
 =?us-ascii?Q?klSGn1g7FUf7B7d4iuT7MEnco9OdDDry3E9Xy50pHiPQj3gAWkKWDjumdDFz?=
 =?us-ascii?Q?GdiI0hlS1bb5ciAfEZDO+lgpXJ+DaNts3axsc7MZS9Uldbl565yqnAA4ynD3?=
 =?us-ascii?Q?YRcVlL7DrDhJXfOIAFZAxMAlnpC5CzKCr2kVpnecAnjCkEgFakBlA+u1aSC1?=
 =?us-ascii?Q?gfx/biYWLJD2x5HbkzrIi2MY7G0TGz+378gVlcUWU46GPtsQXOMqSRYuAVoX?=
 =?us-ascii?Q?JXuPksg1yT0t3IiFvYW6kb9Zc3iSXrS06Zcdl8ZXxhqyMVZZFD3KhINagbV4?=
 =?us-ascii?Q?dPHf1P+scLES1Bp62OelPPh6QcY7FwPvjx6Tw5Q5IsrFvylw/Q8/7s6J8TwC?=
 =?us-ascii?Q?7FHkfdCndvdj9au4kvmVQjBz/scutp9XB08l1yURFPwTD2aASDLA/NL1w48u?=
 =?us-ascii?Q?vpbo+i/F7l9wQ1/kQiXaYfsSik69Dn1b/9jWF9R5KpYxRDLOGcQV4VBhgv1k?=
 =?us-ascii?Q?6SPChOlgzJnpwjCYKmISnjo0Q6I+Fahhi5uMyHRouFnrqyNJXpFmieNWlfup?=
 =?us-ascii?Q?jcYWVC7KyjxTmc0j8H8TksXu7lwUHET6I9NQ49feTtCy8OsefxY0LU3JVrwW?=
 =?us-ascii?Q?B/8TI4JtOL1O/wcHqkv87Q/67dpvc9Qdm8RPiGK0Y0HgKFqpPH0nAwqPS3pF?=
 =?us-ascii?Q?fwz6Tw1DzOwyFg3t8AFpd9V68duKTT/3Q7dtB5EX+dgnQh4+GSaxcQ+8detC?=
 =?us-ascii?Q?U85XHAuvw3QuvzdwhsJMnuJraOTch8AC+zYjEn1iy639dOQYx/b7hGHgDjh+?=
 =?us-ascii?Q?weTfV6YWxMTICAc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dePQa7hiofxq0mWYjxQhwE908/jN7yyu7p5RI1sDdpDWpZj5CDHZjRkqpmYc?=
 =?us-ascii?Q?bc5eQj/+t3rFV4K3IXcVYz7MnxN8EKU4W6seH+MXIL8TbGxviVoS/J/GWxUr?=
 =?us-ascii?Q?V/oCreMCNP4Un6iZwy1d7JOAB0ohzA8ZGk0lLvps8MmBKsEbWIrGqrrtG88p?=
 =?us-ascii?Q?hO+tLipxfP63slL4RTNNWTEjIDrMbzrERCVfTKJtW2a2CvLsVoymppWelUrI?=
 =?us-ascii?Q?BS944tsV8YI23buPw2aAACOECptxgwpvVgDCNUr5NPHAa2ki2uUeR2fprlXk?=
 =?us-ascii?Q?T2SdPR7bU4uR2R4SZEAukQgcO7PAIRlEXv5uNw3Jb70KPWCgW0gh7825gB5O?=
 =?us-ascii?Q?QCad495VH1x3fBdGPDJC8pi0LDefhZkKIoN8jBXoiNw6qRSDq0Puz5+DNPEh?=
 =?us-ascii?Q?kCKvaT6f8VVbB6SKzdzbr7eGmuMrr1FbyqfqQr5Ut0cl5hsrfFvJcOQF3z3M?=
 =?us-ascii?Q?mdVv5gMsimRKgny9C1Ud6UzCi9auqQebtz+sKYbrT/qQNYleY9LRCKyEDSg6?=
 =?us-ascii?Q?F7NEA0nW7JmVWUbmYuGF7JZTDCH2i+9VhuAWAVR0E6LuJ6McnIN06MXMtuyI?=
 =?us-ascii?Q?YelXQS2sYEfHW8XHefqLnwjdAQxSGsRF/fCgqp7MxMPovrqMrRDhAq/Zllcl?=
 =?us-ascii?Q?Gn5RaY0eGk4HEtl4SA4PyAt7VSoGH+zy3mW3+2oBrAHYozZ7jNzIh0dDbEa5?=
 =?us-ascii?Q?xWcCBu6QAnuAeiV9jHBHA6ABq2JLR3vbf/bSEpxwd3Wv+L2Ctmqjmz4+NzXI?=
 =?us-ascii?Q?8IgNz8aJ4YyL8vYmX8sQxQH3dST67henpTd1aZOOCTy1ZZmHnYCguYXns12G?=
 =?us-ascii?Q?K72Y7T/CRe/Nc+1glh0qVi92RA0qLAnjg6OK38ixd6QUfxHhZQ/2GOKR7i7H?=
 =?us-ascii?Q?lVzpXxpSgx0zzna4PsdV3CTfH05ysWRvMBFqMe1GlxuypdeSDTZa+WzjN4Rp?=
 =?us-ascii?Q?lfDD4TVrrW0qK6j+hjRtBHbbUEgfAb7ckhOVQojS6qblaLuIOlagUdtOvzUk?=
 =?us-ascii?Q?jZAmXWYSeNmk4hcn64MiKeRTz6BJLa6SzWWB+7F5EWVwtJN6CalfoV3DAlj+?=
 =?us-ascii?Q?5o2D5dPpdnK/k0ZN+jIZzJJGbtgA+b+wJsGXeCJpKEm45plySL603VxRzwXp?=
 =?us-ascii?Q?bRWPXFhhs5k1HCWlmY8Tm/t1uDi4nM+maQIut+qiTfDLlxBDQTH7tFORFsot?=
 =?us-ascii?Q?LTDyWi/9F6UqBjppI/9+M/HDF6vbR6q8qLk4WLYBCt3mLrxSH3mxpG/d95Ji?=
 =?us-ascii?Q?c7Yjk/2VDc9vDVHnxBvfkndDplt/VaesQsJvFRT5k8mda95DCwV1p9ZD+4gG?=
 =?us-ascii?Q?LaeX2yOKLwoZsG/VX2Fw3mzwNHLYFWYzLZfXBTBQx6HpiZ37OyNO0vQ+DiEC?=
 =?us-ascii?Q?CGjBsSkm/vMBMBi85hrgZvFgT98OLeCn7E3rrfUA9qgFqf2nWeHf4oxKKtJp?=
 =?us-ascii?Q?L5cSae1GK/BYYF+H0xTjUSNzvbvcBylK13EIwI9j4h4kJ4+BSV02yQPDHd9W?=
 =?us-ascii?Q?A1WxZ3BVn4T+QDh3AR5NdIDKxVY0qCD6/nwCVJMyhOM8m89pthk0UvHmBA/t?=
 =?us-ascii?Q?cGR+qjRkCkJU/hkGcwajKtEL0rXY1qO+qKYBR2TO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7da19f-39a9-49b9-3582-08ddfa626a5a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:31:15.7745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQtdfIIwnahxaZcq6QfyjuFCoHlDQ7yMfIEhZVMbzIoliofNgDOQxEJUIkzK3vWjyQHcqhXn2F4Nji51YZB1TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7920
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
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
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

