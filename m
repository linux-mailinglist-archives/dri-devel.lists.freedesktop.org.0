Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413809E89B6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 04:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04DB10E373;
	Mon,  9 Dec 2024 03:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BlurpVHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B4310E294
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 03:39:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IY5rrnkQCzcS2GR2CHwGvnGziDDjYiYv0/4feSePZGq8l5KXMuJJ+GxL7+yGPMZsYNnOgyhNARNfKa6JYnvzZ1EkM6GHPkUFWxfH7/oZir5zbsbhFlVG8KTVKhWauyqjbJ/L3FOwi/CmVS0Woz0GG5ipDs4tokxeleqMH5o7cAZwyXaFlkk5IBjmOCI/FUuSBO2S4iAq7RFBQPLVwQkO3SkAuKn0StfUEL3y0eYjzFSBB7OXuN4+fyssMqxyl1JT4QizLr/bcM7jUE5w+sDnx/t14bIh6Z3AsjeTTxDS0yooLx46TQdLOD0jS753ImagzNwEPNCNYsCEU5jzwR67PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azUgw4cv6BO3/4aoGBL4zBhK9PCtZOUc2bkYZhlMlaA=;
 b=ExPps8B2l/NuT4TN24E9P2IPhO9B/RBcek6UjNu0a9xYt+CAiST8wJGFLEg9suRbtcFa816O2paqNwswApHe7JjJBW711dbu9ZWmScnGqaLW++d/xrj1YTdNF/Qlh6MhOEYK32giItUttfErp+yBIRBlZs6RSQrzgBGzR8eEbN8poUpATXLByoEYWhDZJy3pV1oLPHMXQ3lVASpcLqpi8qUf9OcZXmWTi6nSzSSSfk0EDf6H/pz/f7tWA5HcqKA7+rxFMt7Cx9iBeZAyAMSFRceCDuutoDCmFN3aTBaNasEJdOICDoZVOWelS5uYVSqtapKkzz2FpRyiHrCO3Z22aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azUgw4cv6BO3/4aoGBL4zBhK9PCtZOUc2bkYZhlMlaA=;
 b=BlurpVHcuTdKqdJmS6vBSieztlrp9YrFNSH14Q0fdnuT8ocf4pnPFhzLbmmRQwSLMo1hSoDoG8ZgYqmQnrh3hMyR0UWdaEkHdzMk2IXm/llPmtNAEgU9+Qr7VOY0bdkRlpu+Qc1A2t8wwjUSJf+jujF1YPK9TCI6jcIjwhZqnxDTHLqDYhEcLvFuAULJKDi2bxpShuYXJrrTKYRN7ePt9TiqoQnJKJTNu9vbYHM+ReipkGj3zZ8wf58RjiZegdOJkmbqn2+pdv1Fob44FTHITvPG9QB/WMZVRLJ6mP5slAjdsAvG80F7oZZXH0IkXYrU8T3NgJGRmTpnceFHsf6O/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10212.eurprd04.prod.outlook.com (2603:10a6:800:243::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 03:39:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 03:39:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
 u.kleine-koenig@baylibre.com
Subject: [PATCH v6 01/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller processing units
Date: Mon,  9 Dec 2024 11:39:05 +0800
Message-Id: <20241209033923.3009629-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209033923.3009629-1-victor.liu@nxp.com>
References: <20241209033923.3009629-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10212:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2dd9de-81c7-402e-ebf6-08dd18031ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?llGCjYy2vX+yv5YX/6oAdUYIDi6zOjRpQXbg7EEi0MZcfER+pbTNugMVONuT?=
 =?us-ascii?Q?71AY6EzapCHlc5Brec6kO97D6i7287SQ66p4jCKGGLy2vYycUVWtqWeKt9zU?=
 =?us-ascii?Q?6NhJ1JtnHSikI/QV7rI4JCI3m6rgFBYl0uDfseuiypRUpS45b8jqaKhTl0Db?=
 =?us-ascii?Q?rBIfJams0S/9snvEuCcy/zohByDlCkEN/VvFLzz1r3n+D8iy99BjXKCVJ28z?=
 =?us-ascii?Q?YlcYXc7beVUHEbvHkUnvuEa/Bhz96SmCWz6F7iRrN5WvRK4lbC/yzOUpoyRy?=
 =?us-ascii?Q?o74smtTwLWyg0WKsMIzh65jo+SXSMgBr+D3jnoXeiNj3kJ0qv2Jn+S8QJl3N?=
 =?us-ascii?Q?5onXyAB8v3/2wpLBWjJeO85LOc2M28ziCtjxgdt9j8kDB8OZ89xE5TSW8JbK?=
 =?us-ascii?Q?C5fIDDNbTNc69hwc0NkRSPu6fr/UmG+WS5UG9hiZB+7oORYamxbqApuk90yR?=
 =?us-ascii?Q?ZktaQBH1whBfmpg/sBXDZ/xm12/FlumPvnqjIYX6ApMIIhm66+qWRqy7uxY7?=
 =?us-ascii?Q?/XI9osjfHSOdRZd2rmhAMyGEbcm4VMoMcEx6MZDD2UxMz6fWKBs+1fpjtv2p?=
 =?us-ascii?Q?T5uPvFPUCaSeIbLGJt7YRG/UH62IYkz/TjShu9pg4eVaJdLDXV0dy4M5qtr4?=
 =?us-ascii?Q?XIMMNVmBsc+YAHotQVbjLoB7BTb35SPdzYFfOYBf86fWO30OckUU6cnu6JfB?=
 =?us-ascii?Q?dZLr/WzhZbk8l1Sk4iF6gC3Q+Jt/JtBla54MaIEQxBAIQ2OBxXonq7i85eRn?=
 =?us-ascii?Q?8qS79yobewVvbMC/VCfe9dCxLGz9QS8m279nZrfNBTA4EEaKH15xUJnBXPsi?=
 =?us-ascii?Q?weV/jZ/TvqBdJLVJXlu6D2J1/57M+gKUwQwPAhMyRFOSopJI7H+1CfojNvWw?=
 =?us-ascii?Q?/L09jjk/tjum/UhwfXpiyRqReJnNuQubtMI/FaI3poL86fSFD6IiCmgguc5z?=
 =?us-ascii?Q?ESdlbIaelpdMbGNoPJ+PJVKSotCw7Fl7n+nRHcKzHrDXHy0wHeoUYxZFrTfG?=
 =?us-ascii?Q?KttkMT2ru1LH7ONs05zUU7KDMgS5klGS88CYNFotVAssUz1bgTN5nFNfHT6P?=
 =?us-ascii?Q?8g9wAc1FkQYd4o2wn6retQka0rDpvWbWy8Fq+Mzt8N0DRkTpBuyuEbNQtXSA?=
 =?us-ascii?Q?zDKlGGiRjgwUiSpo2P8yYyZDIbCfTH4NlUgXHz90+sk8lLVCM8qCWCaxAYlz?=
 =?us-ascii?Q?aAmTAIBZcDncdig80EpGo/dRZxkG4iIaFuVuCNVNHBcKT1e37XGIpWIDJvOQ?=
 =?us-ascii?Q?9jsQFc5Wl4q/Fjq6gnHFbTMYV5BCqJGnbv5ZD3uqA4S6PwmijuIKhTAsNovK?=
 =?us-ascii?Q?6ab3FJtxlk5DDGv/qAPJ2dZXJG4sX50K+0aCQIS5+ePXULGiTFbxWWad17C6?=
 =?us-ascii?Q?c1GpeQo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R0OnQLa4f1Np0gyLpkAcIFejYp0jrkSdPfZ8GhRWDo3QtgftrwJ4BXqN5A6+?=
 =?us-ascii?Q?TIBicmWIApTQ8wvahUny2jmdb2ZUQekBCy0HXlgAk7w0TlqTkDkBThOwto1i?=
 =?us-ascii?Q?MAEhD6QYY0H75rieioMZgKJGoae5LfaX3zxqzqAQUE+tIey1HJ7QhR7Xs3zb?=
 =?us-ascii?Q?z/Af5QaNkvTy6HIWX+kzj52lHsbKB0CQtfpJ9qvSPwNXEqSv+cM0NyEUTjJ0?=
 =?us-ascii?Q?D/XT0JXszBSikKQZzxDgfbD5NsJk/n5alYg4WePcPjdD8sLaSzME2vyS1Dkj?=
 =?us-ascii?Q?oNhwqVdzBiBzozhRi6llzeRgjc49EuTCt6doOkWQiXbKW/t+qb0OPDXC5/UX?=
 =?us-ascii?Q?hobmpPcQw2/tpv7XaM4/8UcEJ8Y0CcW/gWgfpH4unSwFA4Ol6SIzk/tWHLux?=
 =?us-ascii?Q?ArAKaN/p/dBzCgI1tlW4z1VbGqtC3Yt/r5zKU1AhMSJYSJP9BU/6XpIbxs2f?=
 =?us-ascii?Q?M+rNTxVNn3KD+obQY8yCnAEBTu9IreZKfzeBQeP0gsmevlTbFKDCbpszAfyV?=
 =?us-ascii?Q?4wgtP8Yd3SMhWIEzy4wHgj05kxFgwVeNTgR/Q4AFqOgRcE+sAaWDBs8ZHQr1?=
 =?us-ascii?Q?hV6tlpY0nT+/3sMs1x0FiS1KAFMNr+TiLbUSDH+NT6nWhIrsiRkK9JjzDuHC?=
 =?us-ascii?Q?go41n4rAYtwGelgniRJqqXf5Z7dNk/NS4N9JBLg0vCU4Rts/njx5UYgputDK?=
 =?us-ascii?Q?vQAM3JXoen8n7N6zAj7LaA1IyxOqHvAKiaqxboy8sGjitytCFQ1UmgDuM2bV?=
 =?us-ascii?Q?96SeIf1OeSF8wMb7n1HCk79KjwOA2zPCwsYYTx1x3BQ+8XBCENkB3qvUKN0I?=
 =?us-ascii?Q?hlvveh/fAvDXODjTOhk3PkJYhas5VTAos54PbtI1OCMOvhJD8vC+rB41PFoZ?=
 =?us-ascii?Q?7XCCsVy1ZQEtf0Sjc+hrD8nHLwXOgImW/cj6kk3FenYswV2tCJ9P9K3ff1x+?=
 =?us-ascii?Q?uflShTRsq9ItuLA4wp8quQa0NK15p7SEuMwUyugL8RkDJOKdMlPL/X5FgwEx?=
 =?us-ascii?Q?YnHHviLHGSQs9WTWmsAIqU9z4Hz448TUi3n/JHjaQAXQb7xNEmNf1xN0Tkco?=
 =?us-ascii?Q?C1m1fKYADe33l6RNm2BV/AIyBnqqjJYJ592v+oYSCTRpaqT8+UV/ihZCruyk?=
 =?us-ascii?Q?EDqj5XF+Wi9aMGm5/hpWFI9aCH5veJ9fa+kg4B45y4+w0QsE8XnMMi5qCXOy?=
 =?us-ascii?Q?TGOZnf41EIzcJZTL0Epp5GpIXtcIk9RRUJcn3OXfEHzvehS6eRS2Ei5KlqZW?=
 =?us-ascii?Q?5T/IRY/QYtajjbS6Zxwbgp/Tv34qSk6kjqwyvUGqT94SnRFCDK1Kf0ESdDEZ?=
 =?us-ascii?Q?q/rkHi1NH1WJGTyAWBfDHagV+a2xypajMyOjbRHtRugdmrM24KXHP5n+oys6?=
 =?us-ascii?Q?3HXG22DUB1xuen0aS3/tpP1L0SJDHB3NZWk03WLcEvrtUzLwn6erFG9FPmAP?=
 =?us-ascii?Q?S8eXZ+gs+A4hYQb8SBzAeieBEEX0cGHFZvGFUuS2eTJ6tZbYKqz8PXKKllH3?=
 =?us-ascii?Q?CNgEdepVgK5amvR/TtjlKGGmCKj2BTpm4Y7IlASIwfxLMfTJPk10r82rVmWR?=
 =?us-ascii?Q?q49nxdy/eF/v5PaKRsJJYeOpUnhQWBE/jPdl4Jui?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2dd9de-81c7-402e-ebf6-08dd18031ee0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 03:39:44.1746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYpQjr02/YEaZzlFG27ml6mlDUDGjBac/aDLFbqiZfyWpo03TXe15j7yyQBtpVp7nLt4h8a+yiSYsfhZYcdcyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10212
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

Freescale i.MX8qxp Display Controller is implemented as construction set of
building blocks with unified concept and standardized interfaces.  Document
all existing processing units.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6:
* No change.

v5:
* Document aliases for processing units which have multiple instances in
  the Display Controller.  Drop Rob's previous R-b tag. (Maxime)

v4:
* Collect Rob's R-b tag.

v3:
* Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
  fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
  into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
* Document all processing units. (Rob)

v2:
* Drop fsl,dc-*-id DT properties. (Krzysztof)
* Add port property to fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
* Fix register range sizes in examples.

 .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  46 ++++++
 .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  49 ++++++
 .../imx/fsl,imx8qxp-dc-constframe.yaml        |  49 ++++++
 .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  49 ++++++
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  77 +++++++++
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 147 ++++++++++++++++++
 .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  47 ++++++
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  68 ++++++++
 .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  38 +++++
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  45 ++++++
 .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  48 ++++++
 .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  48 ++++++
 .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++++
 .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  89 +++++++++++
 .../display/imx/fsl,imx8qxp-dc-signature.yaml |  58 +++++++
 .../display/imx/fsl,imx8qxp-dc-store.yaml     | 100 ++++++++++++
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  50 ++++++
 17 files changed, 1042 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
new file mode 100644
index 000000000000..7f800e72c3f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blitblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Blit Blend Unit
+
+description: |
+  Combines two input frames to a single output frame, all frames having the
+  same dimension.
+
+  Each Blit Blend Unit device should have an alias in the aliases node, in the
+  form of dc<x>-blitblend<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Blit Blend Unit
+  device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-blitblend
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    blitblend@56180920 {
+        compatible = "fsl,imx8qxp-dc-blitblend";
+        reg = <0x56180920 0x10>, <0x56183c00 0x3c>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
new file mode 100644
index 000000000000..351692d8942e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-clut.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Color Lookup Table
+
+description: |
+  The unit implements 3 look-up tables with 256 x 10 bit entries each. These
+  can be used for different kinds of applications. From 10-bit input values
+  only upper 8 bits are used.
+
+  The unit supports color lookup, index lookup, dithering and alpha masking.
+
+  Each Color Lookup Table device should have an alias in the aliases node, in
+  the form of dc<x>-clut<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Color Lookup Table
+  device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-clut
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clut@56180880 {
+        compatible = "fsl,imx8qxp-dc-clut";
+        reg = <0x56180880 0x10>, <0x56182400 0x404>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
new file mode 100644
index 000000000000..cae19bc05d6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-constframe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Constant Frame
+
+description: |
+  The Constant Frame unit is used instead of a Fetch unit where generation of
+  constant color frames only is sufficient. This is the case for the background
+  planes of content and safety streams in a Display Controller.
+
+  The color can be setup to any RGBA value.
+
+  Each Constant Frame device should have an alias in the aliases node, in the
+  form of dc<x>-constframe<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Constant Frame device
+  instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-constframe
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    constframe@56180960 {
+        compatible = "fsl,imx8qxp-dc-constframe";
+        reg = <0x56180960 0xc>, <0x56184400 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
new file mode 100644
index 000000000000..cb0b4a05cfdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-dither.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Dither Unit
+
+description: |
+  The unit can increase the physical color resolution of a display from 5, 6, 7
+  or 8 bits per RGB channel to a virtual resolution of 10 bits. The physical
+  resolution can be set individually for each channel.
+
+  The resolution is increased by mixing the two physical colors that are nearest
+  to the virtual color code in a variable ratio either by time (temporal
+  dithering) or by position (spatial dithering).
+
+  An optimized algorithm for temporal dithering minimizes noise artifacts on the
+  output image.
+
+  The dither operation can be individually enabled or disabled for each pixel
+  using the alpha input bit.
+
+  Each Dither Unit device should have an alias in the aliases node, in the form
+  of dc<x>-dither<y>, where <x> is an integer specifying the Display Controller
+  instance and <y> is an integer specifying the Dither Unit device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-dither
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    dither@5618c400 {
+        compatible = "fsl,imx8qxp-dc-dither";
+        reg = <0x5618c400 0x14>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
new file mode 100644
index 000000000000..b382af1de1c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-extdst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller External Destination Interface
+
+description: |
+  The External Destination unit is the interface between the internal pixel
+  processing pipeline of the Pixel Engine, which is 30-bit RGB plus 8-bit Alpha,
+  and a Display Engine.
+
+  It comprises the following built-in Gamma apply function.
+
+  +------X-----------------------+
+  |      |          ExtDst Unit  |
+  |      V                       |
+  |  +-------+                   |
+  |  | Gamma |                   |
+  |  +-------+                   |
+  |      |                       |
+  |      V                       +
+  +------X-----------------------+
+
+  The output format is 24-bit RGB plus 1-bit Alpha. Conversion from 10 to 8
+  bits is done by LSBit truncation.  Alpha output bit is 1 for input 255, 0
+  otherwise.
+
+  Each External Destination unit device should have an alias in the aliases
+  node, in the form of dc<x>-blitblend<y>, where <x> is an integer specifying
+  the Display Controller instance and <y> is an integer specifying the External
+  Destination unit device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-extdst
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: framecomplete
+      - const: seqcomplete
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    extdst@56180980 {
+        compatible = "fsl,imx8qxp-dc-extdst";
+        reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+        reg-names = "pec", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <3>, <4>, <5>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
new file mode 100644
index 000000000000..2141e692bc02
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-fetchunit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Fetch Unit
+
+description: |
+  The Fetch Unit is the interface between the AXI bus for source buffer access
+  and the internal pixel processing pipeline, which is 30-bit RGB plus 8-bit
+  Alpha.
+
+  It is used to generate foreground planes in Display Controllers and source
+  planes in Blit Engines, and comprises the following built-in functions to
+  convert a wide range of frame buffer types.
+
+  +---------X-----------------------------------------+
+  |         |                           Fetch Unit    |
+  |         V                                         |
+  |    +---------+                                    |
+  |    |         |                                    |
+  |    | Decode  | Decompression [Decode]             |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    | Clip &  | Clip Window [All]                  |
+  |    | Overlay | Plane composition [Layer, Warp]    |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    | Re-     | Flip/Rotate/Repl./Drop [All]       |
+  X--> | sample  | Perspective/Affine warping [Persp] |
+  | |  |         | Arbitrary warping [Warp, Persp]    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         |                                    |
+  | |  | Palette | Color Palette [Layer, Decode]      |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  | Extract | Raw to RGBA/YUV [All]              |
+  | |  | &       | Bit width expansion [All]          |
+  | |  | Expand  |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Planar to packed                   |
+  | |->| Combine | [Decode, Warp, Persp]              |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | YUV422 to YUV444                   |
+  | |  | Chroma  | [Decode, Persp]                    |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | YUV to RGB                         |
+  | |  | Color   | [Warp, Persp, Decode, Layer]       |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Gamma removal                      |
+  | |  | Gamma   | [Warp, Persp, Decode, Layer]       |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Alpla multiply, RGB pre-multiply   |
+  |  ->| Multiply| [Warp, Persp, Decode, Layer]       |
+  |    |         |                                    |
+  |     ---------                                     |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    |         | Bilinear filter                    |
+  |    | Filter  | [Warp, Persp]                      |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  +---------X-----------------------------------------+
+
+  Note that different derivatives of the Fetch Unit exist. Each implements a
+  specific subset only of the pipeline stages shown above. Restrictions for the
+  units are specified in [square brackets].
+
+  Each Fetch Unit device should have an alias in the aliases node, in the form
+  of dc<x>-fetch<y><z>, where <x> is an integer specifying the Display
+  Controller instance, <y> specifies different derivative names(decode, eco,
+  layer and warp) and <z> is an integer specifying the Fetch Unit device
+  instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-fetchdecode
+      - fsl,imx8qxp-dc-fetcheco
+      - fsl,imx8qxp-dc-fetchlayer
+      - fsl,imx8qxp-dc-fetchwarp
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  fsl,prg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional Prefetch Resolve Gasket associated with the Fetch Unit.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    fetchlayer@56180ac0 {
+        compatible = "fsl,imx8qxp-dc-fetchlayer";
+        reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
new file mode 100644
index 000000000000..e1bdcdd893b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-filter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Filter Unit
+
+description: |
+  5x5 FIR filter with 25 programmable coefficients.
+
+  Typical applications are image blurring, sharpening or support for edge
+  detection algorithms.
+
+  Each Filter Unit device should have an alias in the aliases node, in the form
+  of dc<x>-filter<y>, where <x> is an integer specifying the Display Controller
+  instance and <y> is an integer specifying the Filter Unit device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-filter
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    filter@56180900 {
+        compatible = "fsl,imx8qxp-dc-filter";
+        reg = <0x56180900 0x10>, <0x56183800 0x30>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
new file mode 100644
index 000000000000..d784f6e59312
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-framegen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Frame Generator
+
+description: |
+  The Frame Generator (FrameGen) module generates a programmable video timing
+  and optionally allows to synchronize the generated video timing to external
+  synchronization signals.
+
+  Each FrameGen device should have an alias in the aliases node, in the form of
+  dc<x>-framegen<y>, where <x> is an integer specifying the Display Controller
+  instance and <y> is an integer specifying the FrameGen device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-framegen
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: int0
+      - const: int1
+      - const: int2
+      - const: int3
+      - const: primsync_on
+      - const: primsync_off
+      - const: secsync_on
+      - const: secsync_off
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    framegen@5618b800 {
+        compatible = "fsl,imx8qxp-dc-framegen";
+        reg = <0x5618b800 0x98>;
+        clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
+        interrupt-names = "int0", "int1", "int2", "int3",
+                          "primsync_on", "primsync_off",
+                          "secsync_on", "secsync_off";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
new file mode 100644
index 000000000000..895501566210
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-gammacor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Gamma Correction Unit
+
+description: |
+  The unit supports non-linear color transformation.
+
+  Each Gamma Correction Unit device should have an alias in the aliases node,
+  in the form of dc<x>-gammacor<y>, where <x> is an integer specifying the
+  Display Controller instance and <y> is an integer specifying the Gamma
+  Correction Unit device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-gammacor
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    gammacor@5618c000 {
+        compatible = "fsl,imx8qxp-dc-gammacor";
+        reg = <0x5618c000 0x20>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
new file mode 100644
index 000000000000..50c0c1dacb41
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-layerblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Layer Blend Unit
+
+description: |
+  Combines two input frames to a single output frame.
+
+  Each Layer Blend Unit device should have an alias in the aliases node, in the
+  form of dc<x>-layerblend<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Layer Blend Unit
+  device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-layerblend
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    layerblend@56180ba0 {
+        compatible = "fsl,imx8qxp-dc-layerblend";
+        reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
new file mode 100644
index 000000000000..8778526e1eb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-matrix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Color Matrix
+
+description: |
+  The unit supports linear color transformation, alpha pre-multiply and
+  alpha masking.
+
+  Each Color Matrix device should have an alias in the aliases node, in the form
+  of dc<x>-matrix<y>, where <x> is an integer specifying the Display Controller
+  instance and <y> is an integer specifying the Color Matrix device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-matrix
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    oneOf:
+      - const: cfg      # matrix in display engine
+      - items:          # matrix in pixel engine
+          - const: pec
+          - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    matrix@5618bc00 {
+        compatible = "fsl,imx8qxp-dc-matrix";
+        reg = <0x5618bc00 0x3c>;
+        reg-names = "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
new file mode 100644
index 000000000000..a724cf960250
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-rop.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Raster Operation Unit
+
+description: |
+  The unit can combine up to three input frames to a single output frame, all
+  having the same dimension.
+
+  The unit supports logic operations, arithmetic operations and packing.
+
+  Each Raster Operation Unit device should have an alias in the aliases node,
+  in the form of dc<x>-rop<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Raster Operation Unit
+  device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-rop
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    rop@56180860 {
+        compatible = "fsl,imx8qxp-dc-rop";
+        reg = <0x56180860 0x10>, <0x56182000 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
new file mode 100644
index 000000000000..66c12948ab09
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-safety.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Safety Unit
+
+description:
+  The unit allows corresponding processing units to be configured in a path
+  leading to multiple endpoints.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-safety
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    safety@56180800 {
+        compatible = "fsl,imx8qxp-dc-safety";
+        reg = <0x56180800 0x1c>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
new file mode 100644
index 000000000000..a1d6673f2a05
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Scaling Engine
+
+description: |
+  The unit can change the dimension of the input frame by nearest or linear
+  re-sampling with 1/32 sub pixel precision.
+
+  Internally it consist of two independent blocks for horizontal and vertical
+  scaling. The sequence of both operations is arbitrary.
+
+  Any frame dimensions between 1 and 16384 pixels in width and height are
+  supported, except that the vertical scaler has a frame width maximum
+  depending of the system's functional limitations.
+
+  In general all scale factors are supported inside the supported frame
+  dimensions. In range of scale factors 1/16..16 the filtered output colors
+  are LSBit precise (e.g. DC ripple free).
+
+                       +-----------+
+                       |   Line    |
+                       |  Buffer   |
+                       +-----------+
+                             ^
+                             |
+                             V
+                 |\    +-----------+
+           ------+ |   |           |
+          |      | +-->| Vertical  |----
+          |  ----+ |   |  Scaler   |    |
+          | |    |/    +-----------+    |
+          | |                           |
+          | |                           |
+          | |                           |     |\
+          |  ------------- -------------+-----+ |
+  Input --+               X                   | +--> Output
+          |  ------------- -------------+-----+ |
+          | |                           |     |/
+          | |                           |
+          | |    |\    +-----------+    |
+          |  ----+ |   |           |    |
+          |      | +-->| Horizontal|----
+           ------+ |   |  Scaler   |
+                 |/    +-----------+
+
+  The unit supports downscaling, upscaling, sub pixel translation and bob
+  de-interlacing.
+
+  Each Scaling Engine device should have an alias in the aliases node, in the
+  form of dc<x>-<y>scaler<z>, where <x> is an integer specifying the Display
+  Controller instance, <y> specifies scaling type(either "h" for horizontal
+  scaler or "v" for vertical scaler) and <z> is an integer specifying the
+  Scaling Engine device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-hscaler
+      - fsl,imx8qxp-dc-vscaler
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    hscaler@561808c0 {
+        compatible = "fsl,imx8qxp-dc-hscaler";
+        reg = <0x561808c0 0x10>, <0x56183000 0x18>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
new file mode 100644
index 000000000000..5403e3359fcb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-signature.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Signature Unit
+
+description: |
+  In order to control the correctness of display output, signature values can
+  be computed for each frame and compared against reference values. In case of
+  a mismatch (signature violation) a HW event can be triggered, for example a
+  SW interrupt.
+
+  This unit supports signature computation, reference check, evaluation windows,
+  alpha masking and panic modes.
+
+  Each Signature Unit device should have an alias in the aliases node, in the
+  form of dc<x>-signature<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Signature Unit device
+  instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-signature
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: valid
+      - const: error
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    signature@5618d000 {
+        compatible = "fsl,imx8qxp-dc-signature";
+        reg = <0x5618d000 0x140>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <22>, <23>, <24>;
+        interrupt-names = "shdload", "valid", "error";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
new file mode 100644
index 000000000000..38d86e3dd6b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-store.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Store Unit
+
+description: |
+  The Store unit is the interface between the internal pixel processing
+  pipeline, which is 30-bit RGB plus 8-bit Alpha, and the AXI bus for
+  destination buffer access. It is used for the destination of Blit Engines.
+  It comprises a set of built-in functions to generate a wide range of buffer
+  formats. Note, that these are exactly inverse to corresponding functions in
+  the Fetch Unit.
+
+  +------X-------------------------+
+  |      |              Store Unit |
+  |      V                         |
+  |  +-------+                     |
+  |  | Gamma | Gamma apply         |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Color | RGB to YUV          |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Chroma| YUV444 to 422       |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Reduce| Bit width reduction |
+  |  |       | dithering           |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Pack  | RGBA/YUV to RAW     |
+  |  | Encode| or Compression      |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  +------X-------------------------+
+
+  Each Store Unit device should have an alias in the aliases node, in the form
+  of dc<x>-store<y>, where <x> is an integer specifying the Display Controller
+  instance and <y> is an integer specifying the Store Unit device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-store
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: framecomplete
+      - const: seqcomplete
+
+  fsl,lts:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional Linear Tile Store associated with the Store Unit.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    store@56180940 {
+        compatible = "fsl,imx8qxp-dc-store";
+        reg = <0x56180940 0x1c>, <0x56184000 0x5c>;
+        reg-names = "pec", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <0>, <1>, <2>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
new file mode 100644
index 000000000000..87f02d92d55e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-tcon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Timing Controller
+
+description: |
+  The TCon can generate a wide range of customized synchronization signals and
+  does the mapping of the color bits to the output.
+
+  Each Timing Controller device should have an alias in the aliases node, in the
+  form of dc<x>-tcon<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Timing Controller
+  device instance.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-tcon
+
+  reg:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: video output
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    tcon@5618c800 {
+        compatible = "fsl,imx8qxp-dc-tcon";
+        reg = <0x5618c800 0x588>;
+
+        port {
+            dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+                remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+            };
+        };
+    };
-- 
2.34.1

