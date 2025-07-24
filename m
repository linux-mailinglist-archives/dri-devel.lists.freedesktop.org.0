Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49472B1019B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73D710E89B;
	Thu, 24 Jul 2025 07:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hN9Uu3mh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B13C10E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2pR/S/D5TYkJusTihUdNBfNcLCB+h3YzUyfXUjDd9Ao2vL654nvw62r1mqIDodDy6KjmHmJWaVSYZ5GxVifHt9oPJPjF/27Spb6ahqC8TPgntsJ/MvMO79V2PMmByf/lWy0NSILv7yiGhASdKei9sXs4Pj0xgVhkV6owglunKm/7fy1KbjccJMCFB4YoaZQ+2/KBWefGOw4XV579sqjgWKmuyGlCh39V7WNd8IyRXNMXHDItsAzxfLEHQooe5noCD5D11k0T+iMho5elokfzmn3HWMVIYbRRiahqLs5nFBHxP6qDqbFARfs0nA1sErfjWspfZeSQwDyFQc8jshqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXWAomCv+uOxu98ORgioJvMYhlPHY2OBYFlAXNKIf9s=;
 b=lAWe1ZlreXOPZUTqhXy6Fq5h91InQUwJY8HuRtxDKdm+7nrTQVV6dleu5eI16UWTNZOQJ69SQKBHfyjF6ri1PYZETvNh+pUDWtsODOa0bxUjGgD902N/bnL1P47YX7Q8vGaY2eObcuEty1nRDxJoxk9NejM2V247io3/W57RVLELhq02zeE3NJosH39Ji7tTmI7kqUZTZlNAX6LyDXt+/UlWI4lhDbbqQsSXhqSJS1ZPiJNp43IIE23HkM5a3Lk7g8H2oJRRILqgo4VefCkBtcZIR/UfBhigbAZP/oT1TOs8zs5cH76MV9OZO8Z3QH0J5dUTjsUtex/K1BcXuXYd9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXWAomCv+uOxu98ORgioJvMYhlPHY2OBYFlAXNKIf9s=;
 b=hN9Uu3mhTotTJlFAxBDwXXBv4VKC2REHKIfDLz2PwKDdp1hfSj7UsW4ZHZa7fyxN6MetI8CLzwa7EbF/DQCG81gE7Na26p4DlEeBlDBqpE79idt/esoaHbhkpi4h0TNGCtzoRuF7i+NIXmQMLPCTnlQyZGXaS9dtO3xCeNVaocYT0Ussj6Nc+mS1Kopb4hVNm18lTkmH1cYjQ618SSKIJ8L+wYc1CGA0yDzFm/K91ywUdWKWWkwtmZMMKoY5LEAo+NO/N/PJYqsxH69cqcRz4L6Tbo5iAAzfEkYZerbQ+r9xHKep1GkraN8JC37KEGbmfqSHvSMzJGlYHx560NbFeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 07:24:03 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 07:24:03 +0000
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
Subject: [PATCH v2 5/6] drm/bridge: imx: add driver for HDMI TX Parallel Audio
 Interface
Date: Thu, 24 Jul 2025 15:22:47 +0800
Message-Id: <20250724072248.1517569-6-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM0PR04MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 982b540e-a338-444a-4ddb-08ddca8310db
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?na4rCHi25fSy1TIJ/nNsjg7iL9p7qpQlV8fW/QSZpyKJHw7dpCmvBR/b6pd7?=
 =?us-ascii?Q?Ayjy1dtXUNelzGVynYU4DqFNcSayC7kTxE3g/4mF4vWbg0XIjPreIs6GptJf?=
 =?us-ascii?Q?NzL8wWmxaBUx5fGqLhLazgN5+u+0ZvGJfP+Sbg4RC3WmilUOynmyakBzhRtd?=
 =?us-ascii?Q?kSE4QsV7/HQHk2+GVPut/yJ3FISSKYP1ixqGKAQVCNbKj6iz9SzcFeCu1pcE?=
 =?us-ascii?Q?eChrjyco3x4fytkCiFIv74VcW5e3jd2yy5KIzuZFk1K9L9Ix9JDj8FSezjhf?=
 =?us-ascii?Q?3MzJbwHCZrIJ3n3FqyttMK0Q4s+kVi485vqrezjAHZm6PrUO3mT3JnPFFUC5?=
 =?us-ascii?Q?Yxx6BbaATDcBMqcd9lDQW1bv4f0joCtoO1ybaOK9ixbmKYVmFgtuwUw7YbFq?=
 =?us-ascii?Q?UVUNuA+n7hAozWRp+JBLn+hwNhOZIvBJIycqx75PSnAviOremcopegzjQ7h0?=
 =?us-ascii?Q?Z5mBfhUOLECcq2ZyRi5jILkb5ZeG5GPMWvtBU9bgzBuR11YK7jAeHYhqTWzK?=
 =?us-ascii?Q?pc/GiLEeXsCg7K/3kPDDomFxkFjEv2Q5Hs/HiXWrawztl1EkN7rE27IS13k1?=
 =?us-ascii?Q?APzFRxkF/olzXCV043XEYUyU4CXjMYn4XSMxqDstIEFYusIRF/OG+ZTwA0Nw?=
 =?us-ascii?Q?8AWEpNMcIoFr9Whfny61fAsmzpNV8cvrTpVMKn8CnYAn7cbfBKMiX1uQqL2T?=
 =?us-ascii?Q?mlvbrr0TN/KmeDvj/OOB1AShsT9qxsJZGfUBgkSDhe5DmPEjWvXSNZllZILa?=
 =?us-ascii?Q?6axg5X/IRT10GILjpSccIdTQMjTr6rF79gCUQ9N96fNIjSJsgn5wzz0i0JGk?=
 =?us-ascii?Q?+jcd8QMvxSLKl3Wz58t4HbZ+hIUGBgXffdxgMoF1xEjruFdia8uXjwEWWuCW?=
 =?us-ascii?Q?TV3io5h959jVdOmSgiN71syvv9zB8czFygNT21CNGIXqZvhI7wRxWs18oCwc?=
 =?us-ascii?Q?qfN891R8SeQ0klMZeOhFbgER7cgYiN/BPdHHfncfj1pV7VGa7nISAQVqwmFs?=
 =?us-ascii?Q?qmteSRSJ56bfHPYzuvz8SBBjRG/0WHWaYE9zwlKSk5+SclAYo3BOKfOdH1Wp?=
 =?us-ascii?Q?X9sjLtBwfQ8eCNghXIRXPrVBcONlibFHY0aZ2hp36fwM+oGbrS6tEQgKZsFk?=
 =?us-ascii?Q?4kPUeuLpZyh604sn3k8438u6y6aXxKJlZaSejHitjT8WjeIC08Le/4TnwLpL?=
 =?us-ascii?Q?n80TXEHHxUUyxN2OPDYA2uorvZHlpQR3d8HmBge+OUgJYINk6etCLLES+wNX?=
 =?us-ascii?Q?ERjuudg8P58Uldcez06Mzi6au0p1EUrIjF+AwuZcFBiUNJD+v+jdVEQKbzHx?=
 =?us-ascii?Q?F81T0BNoGKlSddc02sFLHgEgmgaCPzs81t8Ga6ZXesKDDBUffi5Jvg56p7GI?=
 =?us-ascii?Q?oXx1j0Yia+Kf3VBN8sjX7IZ+WKvAEHfhsP5L/Y/yjGIDkDOKj86tYBwvskfr?=
 =?us-ascii?Q?IoOuSSI/9OaxpyIuGscWbBffm9oEJMil8948RRPvZxIkFNcgfCjVb5nDzyIi?=
 =?us-ascii?Q?v/3EeDU5XJoByOo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZcPAKdCKEWDxBR0iB4YJ8LYUFBP1b4uY3Uy4qGvXDBQZg/NKV5TTYUg2bFmC?=
 =?us-ascii?Q?JoavD3r6LCksuXhLV5/Xd98eYgNbKhDWu1RrDf2JUxv79lYbIiJ6BBlgX/e/?=
 =?us-ascii?Q?k5t2cdPd818vf3Idad7lZKYUQg9d2y9PWOJWT5L74DqT/XcGXWJpAW8NQahH?=
 =?us-ascii?Q?eaRSO6T8d7X9TVxcPeM6lhfTcqJV8T7TPXlq1NWYvU/Iu612cbnErQzaWKNF?=
 =?us-ascii?Q?fIdk5da2CwPEfir948gok618KNTo6bUhhX1v6umz8iBWjRgUQh6ln3U7hOcV?=
 =?us-ascii?Q?5KEUg/71lKqOm/gev2KX4U5Qc5EfGcBgPf+wbTgktGywhpHkCVhi/FY6eSSX?=
 =?us-ascii?Q?aDkqPLqz65v1UVnTwZ6PSh+xKZbcv4n+RZbzItCXjwVgfmYiDWJY2xCWdD71?=
 =?us-ascii?Q?uYJf283Zl3hqPynRHL6jEdmi5FqV3SbFgmRhs0WeTT7EUqrJeZbfS0xykGni?=
 =?us-ascii?Q?47ep8cxdoGcZkHwudCeyGIVgZHCLhJaSn8XCdv/vaMbqKO8n2lmnHttrQ8lA?=
 =?us-ascii?Q?b3P9mDFDC8/fUpXXrh6qjFlPBTEyUt4B9l1VItSt7jrBGKKT/mRI9gyW3P6J?=
 =?us-ascii?Q?K3E1JtnxPFszJszCq5Cf8Infzk6hD1hcMoVIkw+pKTODCjK2GXD9MH5s+/fm?=
 =?us-ascii?Q?GVWseKeym5YOBiTfuPEQmZ9iYazw3UCGk578bXtJpsDkDOc5WahyK3k9fOSq?=
 =?us-ascii?Q?yWWlvROVIydUATp0k1aaLNtA1FvNJ4+o6CE9Nq5PxU3KB/XRIPFrFLMvjQMh?=
 =?us-ascii?Q?l3a+Am53RI14S11mkWb90xVb502Rv4qAx5dmYeQV0in4OrnSmbjSPnUGW5H/?=
 =?us-ascii?Q?g+hBycEj0askxDUTmlFqByvuUAvmpYsLt19a/P5F21J/2AwSjxrxURxKqsc3?=
 =?us-ascii?Q?y7aFd0v4T4b/UxVTiCnERbBPu/byaSbdHC9d1lCLJlgU1tq5BiOPN26HZoU3?=
 =?us-ascii?Q?nfhADaTDW9vSVKsS/d8lM6TrlxbpypjjKPDx5DVBFtmUneyaqojJVVYDu4NB?=
 =?us-ascii?Q?w/uFFe2vLkavfAXyS71ioDGiU6QyUvwpgP5LUKPNu/i6m6X02vY0bI0qRFlk?=
 =?us-ascii?Q?SSdQR2FLUwWusEBlBWQ7DnY0/9FSqlIQ9ZwakwqDopbGuGkcY/Ek9WxAC/Xk?=
 =?us-ascii?Q?XDdYH4/lmR3+OQusrF+eX2vCSaIt/kq7M8xkMH98DrSdm41VEqqCDgEm+e7p?=
 =?us-ascii?Q?fDo/VouB4f/bP7c1QJk1ckJMbjGQUxpg+Lm3vHWjeUPcbwrcgkYNttHdV5U9?=
 =?us-ascii?Q?R0CwE+A2+6X+lL/kTgkjyc4M4OikjXSQkBc4nPkhOQOrTj7IGNSObaDkJ4vE?=
 =?us-ascii?Q?csBei+2WD3EYYoVKY6llxno6W5PkPikP7tsO4j7xuEWcCnaNCPyIkv5PqjoW?=
 =?us-ascii?Q?7TZchpDzwPiwO/08F/EK1aXjylK11bgyUCIkJ9CD5HKciAfneCnqZEGIkq6M?=
 =?us-ascii?Q?CkpIwTMYL/rs5yvQ/xR+y/0N5wi+msHdyGzW8ZAaBOlIZMGpB23g7RHfaWIG?=
 =?us-ascii?Q?yyhGWCLB4gybs4v+HFhDmi5ziZXWxPoIdSaVI4hOghWsH5FRN7F7gIwW40ak?=
 =?us-ascii?Q?aggqXmIfpnycnZkiVLrM3Cb3n1CjaSvuVdc8FLzo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982b540e-a338-444a-4ddb-08ddca8310db
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 07:24:03.2186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nbL4iD1QMKkEK/2XonFK3EQByaINk1j30FAL1MfjS18IyIORiS+Hoa201XoWgcw4saBvQjiKID9omRMHxhH/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915
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

Use component helper that imx8mp-hdmi-tx will be aggregate driver,
imx8mp-hdmi-pai will be component driver, then imx8mp-hdmi-pai can use
bind() ops to get the plat_data from imx8mp-hdmi-tx device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/gpu/drm/bridge/imx/Kconfig           |   8 +
 drivers/gpu/drm/bridge/imx/Makefile          |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 204 +++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c  |  55 +++++
 include/drm/bridge/dw_hdmi.h                 |   6 +
 5 files changed, 274 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9a480c6abb85..6c1a8bc5d4a0 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -18,12 +18,20 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
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
index 000000000000..e3ecd387291f
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
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
+
+#define HTX_PAI_FIELD_CTRL		0x08
+#define   B_FILT			BIT(31)
+#define   PARITY_EN			BIT(30)
+#define   END_SEL			BIT(29)
+#define   PRE_SEL			GENMASK(28, 24)
+#define   D_SEL				GENMASK(23, 20)
+#define   V_SEL				GENMASK(19, 15)
+#define   U_SEL				GENMASK(14, 10)
+#define   C_SEL				GENMASK(9, 5)
+#define   P_SEL				GENMASK(4, 0)
+
+#define HTX_PAI_STAT			0x0c
+#define HTX_PAI_IRQ_NOMASK		0x10
+#define HTX_PAI_IRQ_MASKED		0x14
+#define HTX_PAI_IRQ_MASK		0x18
+
+struct imx8mp_hdmi_pai {
+	struct device	*dev;
+	struct regmap	*regmap;
+};
+
+static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
+				   int width, int rate, int non_pcm,
+				   int iec958)
+{
+	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
+	struct imx8mp_hdmi_pai *hdmi_pai = (struct imx8mp_hdmi_pai *)pdata->priv_audio;
+	int val;
+
+	/* PAI set control extended */
+	val =  WTMK_HIGH(3) | WTMK_LOW(3);
+	val |= FIELD_PREP(NUM_CH_MASK, channel - 1);
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
+		/* PCM choose 24bit*/
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
+	struct imx8mp_hdmi_pai *hdmi_pai = (struct imx8mp_hdmi_pai *)pdata->priv_audio;
+
+	/* Stop PAI */
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
+}
+
+static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void *data)
+{
+	struct dw_hdmi_plat_data *plat_data = (struct dw_hdmi_plat_data *)data;
+	struct imx8mp_hdmi_pai *hdmi_pai;
+
+	hdmi_pai = dev_get_drvdata(dev);
+
+	plat_data->enable_audio = imx8mp_hdmi_pai_enable;
+	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
+	plat_data->priv_audio = hdmi_pai;
+
+	return 0;
+}
+
+static void imx8mp_hdmi_pai_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct dw_hdmi_plat_data *plat_data = (struct dw_hdmi_plat_data *)data;
+
+	plat_data->enable_audio = NULL;
+	plat_data->disable_audio = NULL;
+	plat_data->priv_audio = NULL;
+}
+
+static const struct component_ops imx8mp_hdmi_pai_ops = {
+	.bind   = imx8mp_hdmi_pai_bind,
+	.unbind = imx8mp_hdmi_pai_unbind,
+};
+
+static bool imx8mp_hdmi_pai_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case HTX_PAI_IRQ_NOMASK:
+	case HTX_PAI_IRQ_MASKED:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool imx8mp_hdmi_pai_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case HTX_PAI_CTRL:
+	case HTX_PAI_CTRL_EXT:
+	case HTX_PAI_FIELD_CTRL:
+	case HTX_PAI_IRQ_NOMASK:
+	case HTX_PAI_IRQ_MASKED:
+	case HTX_PAI_IRQ_MASK:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config imx8mp_hdmi_pai_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = HTX_PAI_IRQ_MASK,
+	.volatile_reg = imx8mp_hdmi_pai_volatile_reg,
+	.writeable_reg = imx8mp_hdmi_pai_writeable_reg,
+};
+
+static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
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
+	hdmi_pai->dev = dev;
+
+	hdmi_pai->regmap = devm_regmap_init_mmio(dev, base, &imx8mp_hdmi_pai_regmap_config);
+	if (IS_ERR(hdmi_pai->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(hdmi_pai->regmap);
+	}
+
+	dev_set_drvdata(dev, hdmi_pai);
+
+	return component_add(dev, &imx8mp_hdmi_pai_ops);
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
index 1e7a789ec289..ee08084d2394 100644
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
@@ -79,11 +81,46 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
 	.update_hpd	= dw_hdmi_phy_update_hpd,
 };
 
+static int imx8mp_dw_hdmi_bind(struct device *dev)
+{
+	struct dw_hdmi_plat_data *plat_data;
+	struct imx8mp_hdmi *hdmi;
+	int ret;
+
+	hdmi = dev_get_drvdata(dev);
+	plat_data = &hdmi->plat_data;
+
+	ret = component_bind_all(dev, plat_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "component_bind_all failed!\n");
+
+	return 0;
+}
+
+static void imx8mp_dw_hdmi_unbind(struct device *dev)
+{
+	struct dw_hdmi_plat_data *plat_data;
+	struct imx8mp_hdmi *hdmi;
+
+	hdmi = dev_get_drvdata(dev);
+	plat_data = &hdmi->plat_data;
+
+	component_unbind_all(dev, plat_data);
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
+	struct component_match *match;
+	struct device_node *remote;
 	struct imx8mp_hdmi *hdmi;
+	int ret;
 
 	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
@@ -108,6 +145,22 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, hdmi);
 
+	/* port@2 is for hdmi_pai device */
+	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
+	if (remote && of_device_is_available(remote)) {
+		drm_of_component_match_add(dev, &match, component_compare_of, remote);
+
+		of_node_put(remote);
+
+		ret = component_master_add_with_match(dev, &imx8mp_dw_hdmi_ops, match);
+		if (ret)
+			dev_warn(dev, "Unable to register aggregate driver\n");
+		/*
+		 * This audio function is optional for avoid blocking display.
+		 * So just print warning message and no error is returned.
+		 */
+	}
+
 	return 0;
 }
 
@@ -115,6 +168,8 @@ static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
 {
 	struct imx8mp_hdmi *hdmi = platform_get_drvdata(pdev);
 
+	component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
+
 	dw_hdmi_remove(hdmi->dw_hdmi);
 }
 
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

