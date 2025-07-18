Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D75B0A3D7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A465310E994;
	Fri, 18 Jul 2025 12:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DR+IChoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013015.outbound.protection.outlook.com
 [40.107.162.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E1B10E93D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:12:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQdd16xHF/QvP06AFAyRroZItvrF+HdImPvQYy52RFJJeg9XbTGm80nw2rllnDQoLKKsp6nbpdrrAclyrZOMMKDn5BTd5R2YuF0iWChKUcwz+WP5KowruCdUa9YpfcOg8d5/HuxuKsD/uYXPKPUtZ055HwMZUp21gPuuSJ2qPmCpkxOfEspcJQsxqUxxEgwr2M2GJCscTMt6+G8ECcinPZLUI6uGbpHApvLbsGUbch4YuWNKKD2otkH5fQBm2yQpXJhkawqDdj43NDX9nixQBWxwpqnGm4/2N31aZ7MKB2HUhmCuFK+jb85u1urgqgqEn8LpIAc4LGQjYonWOiTgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTj/JhoU/HgBJdJOCgoCBn1+bgBg0BRA2VZC/M7HdV8=;
 b=Mz+NSDOY7bokKy1VN1sITRHSz2CN6jjsFBKWZNHGL++Z0w7OGt9Ol0+mdXvwThs3YX3+plPk5X40SjT9G9DpAImBH+VrvoiscTo64GS3xkibIEUK20FQcnuNClOFoUzvsNiI8aEIEW6khx/iUexUD5VOJA2uij3b9IKojwIgHkUiBhKmCuzSR1j/nDFTGgXajhtXfB3fCqqFXokBMcutiGiIHnGUORMhoALRa18L6JPrWNaLfJXrt7KPZBxUglyD6mLceCSsruil6ObcEZw0MtI41VMpSkTOLfIAh8U3cZ74yzQy10K2bzZJwQarW31cJ05uheOb4bokvrkoXt9I7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTj/JhoU/HgBJdJOCgoCBn1+bgBg0BRA2VZC/M7HdV8=;
 b=DR+IChoTdKKAPxhIpXSFGj56ZJtdqF7+KAd6w656FcH17Dha5ZIs9HYLZI9uPni3eSGrI+qHujHlov3O/mfyvr2c9+9aIXH2hnbN5JXpTmCoJLsPoJBjrf3WO58FKSMh+NVlWjmeLfS2pdLVfD/ullKT3b9flNtijnGC4u0PbXf/3Add3pzW4AHlKJL70zt/VW57H+/+yNHA8NrB27gMKIm/qIjQuul+GXH+TE4kx6nRVcsBO4nPFTS4dtxrbfZEf/LSuaVuqlonzO+asRHibf1WXgZYlqbP+B09aDWwzTde0gJwqveLUiqvMqfPmpFh5oKTvNbLF6wyfkwSP9HGVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7180.eurprd04.prod.outlook.com (2603:10a6:10:12c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 10:12:31 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8943.024; Fri, 18 Jul 2025
 10:12:30 +0000
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
 l.stach@pengutronix.de, shengjiu.wang@gmail.com
Subject: [PATCH 0/4] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
Date: Fri, 18 Jul 2025 18:11:46 +0800
Message-Id: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa78650-3cc5-4872-589a-08ddc5e39ad0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cPxDH4Gdvz94yfp+TBEzQGi01ILOY7ZNK5mKY9hReOuni9UBhbkiN/32dcAD?=
 =?us-ascii?Q?FwA4DbDZWjkyepz6+CxqzBnALnCDH4nM/94qurflLjUbyHjeDTJ2maAEuF1e?=
 =?us-ascii?Q?dswGpEoUhlwzUh+i43OqxqQCTGmyduJTZOuCfhQHhn0ixVON57Wujf+sUv+q?=
 =?us-ascii?Q?1qyTQthnz65ybc4W6yJSq7/ZjSjegvc6/UgpPH59JRoF0Wqqttj07wHu4lqO?=
 =?us-ascii?Q?KT9tXKnbumLE511HXh3dgHbtHCqX+tpkQB4awYdO1Relcx0ViQGA7ShEEhrM?=
 =?us-ascii?Q?hzKdWun1cOmW0S9/NTtDaoLf0nh+siQ1gaOrB2ycL51uC5K9yo5ZFv8QsvxC?=
 =?us-ascii?Q?rdUdrwRxll/dLoVYufytyd2+WEldUU62xg6GbLrGKNXdvjDj5RLwUHD5u4GA?=
 =?us-ascii?Q?zAs8Hn/8XWexRVHV1y9fLsddWD/ESTl9/qY+aNPEn0EPOgiFKkK41e/I83lM?=
 =?us-ascii?Q?KjDHeM0h4CJIWs2pIM6bjV+Wa1c7F92VBkaJF4Kmds0O/rUTMRZ3TrRjIrEO?=
 =?us-ascii?Q?Hi4ePIUelHOb0jh4c2tkbOWpKA2bKFwkSPJybACsnu4VsPPHOVzPOeValtqj?=
 =?us-ascii?Q?ZwXp9kJCxXh5ny9TBYLhODwb8MUBdCrUHHV34tHm2Lx/zkW6sbs5hdXM18it?=
 =?us-ascii?Q?1g9kX/6TAtnLN2dPdeQRWQF710H4r8OgnbMkqUefd8VYkm7wX9ryShfzw/uZ?=
 =?us-ascii?Q?zn0oH59M4O2K6p2jepg/VCAl3RHPUrzwdD0HShsECYrphKHYDegZjXqcIIN4?=
 =?us-ascii?Q?zt/jx7ei3LnRx/4HNcVAPzmvJIYZb6JXvWY1c7dqK76nAc0yvSlfTpKqNbsW?=
 =?us-ascii?Q?codBnTiMo2Om16tERbfvkuu+SvljvyEfEbR5rWjAn24gIft6yDnLZeDjpgVX?=
 =?us-ascii?Q?ghYJkUPPLBXprnbHhGGAdKgjWlJOFtASePQgcYuH5oD1oCdoNigB+o3/L0Co?=
 =?us-ascii?Q?FcQOCF1Fxmnpqq8u3QSg9oK+FofVGn7o1pFRMlwi2Rfzf+VZWOdn9/ASBnWa?=
 =?us-ascii?Q?+jPI2v42Eq2C/XvTEmVjB2bel6S3LfeA9sYdya1/6IaOU7SC7yApZHt0otT7?=
 =?us-ascii?Q?DFWi+hix9le8sRZhCJdr/GDUmNFlSLuYUtDqZIl/Qcn3yK1D6/55Rq3hlJjz?=
 =?us-ascii?Q?xoZvxCrKxMNNoigr5CJ6lG0BeNqfqEWS6vaDueIpyzwj8cjfioYjIg7jno+A?=
 =?us-ascii?Q?A/kISIZsBojQ8Eqs0aZ7Cr0m39m67uqAEFvuhzqjrW/pPzPIwFdzZ6gufCBV?=
 =?us-ascii?Q?46BERo+emO+TImff9bn5d2HMRRy1azKVYmDvtPcW+Zh3WlurCOFDh8XhsTyN?=
 =?us-ascii?Q?06Io4iGhHkNIg6Traz0t6TUGenO8eWSx3UYvUjviZY51pHLbEiX7oanw4M9r?=
 =?us-ascii?Q?vi0e9/NnNoEEYmjleRIHZ0QWN5CnVmFzTrVdiLHa0wzXWY0pYNaOJueGvLm+?=
 =?us-ascii?Q?SUovFzYJUv9TeNv33uZjSRbjrVPmI1DRDtwBWTeQSZEeVquG5F/cvQqtvkE0?=
 =?us-ascii?Q?bFQbwzA7YDPzwr8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BCqBbPqhtIBKeDnVClWidxTH3F10gXMR5eVEPbyDCfw96Yo+LPzntRHhpnm+?=
 =?us-ascii?Q?M93WXh0upU9MgYbYQ0W/K0AE7BTg3GoxyR6YhUzzPoOZp5XVvb1Ftjy6P+R0?=
 =?us-ascii?Q?pIX0lUUfO9pzbb3xsGHADP0v+NAwj+HjiWTCwQVkmXirvvGQ8oFYi0aisT7A?=
 =?us-ascii?Q?oz8QiLiuKEX//zkUq3/wMwlDVaLDr+r2RYnbcd7vbr17T6FR2N2jRTKmOWHg?=
 =?us-ascii?Q?WDKcywYrCxJtjTCanavGr/gXD3p6vWtc3rGVddXHitUXPe4peJ6IWS5wS8Ri?=
 =?us-ascii?Q?z9Eg15ipnCNyzvPyhukQVNdvW0MHOYEG453e24cWNyg4KYuR9zSHxhilu6sG?=
 =?us-ascii?Q?KGDr7B+U7Urt+YuzMBL/Xw/6gumduZ2T40Rn6mzUdAA97hGk+K3tu74hyJkW?=
 =?us-ascii?Q?gvnNdOQJmXlonDFv7pfc6DYzTGSpgncJTxLaqKzscuvWtlHra+icMVSkirW7?=
 =?us-ascii?Q?CA8uaMKLypRF0dSr6TshgOU3a0RHmDQVyYH0vhtp90WS7lLtBtNz2JIr1rGu?=
 =?us-ascii?Q?eGKvgJFTrgh/sUgDOG9G1aeXmWGUPAOXSBID0+fs7zYV5+z6UbOiEVcyBVOk?=
 =?us-ascii?Q?WTpePezBOkcZAndWFU9T5XEhk0XHBpdXCDo+gUmoFCKt3kQpu8ZQkZtoWedj?=
 =?us-ascii?Q?nvIzhwYklDInxw9pG33E9uSVJlq+5Kh5Nbv1wLoTajwGtMTv9uwL1jeuWDfE?=
 =?us-ascii?Q?oyZOI7K8aN6uiLvjAmxnYmgnhDrheUqMJ9tUkG3omliP0mT5z1qZrLrXeh4T?=
 =?us-ascii?Q?at14e4i78al9OFNSgXcl6fpBkKwuIJUtkotI4yrzGTaslyUkTp8YEJH7u335?=
 =?us-ascii?Q?D6XJPprjZ2fvPah4gQqsM83Kr3WLHkafZ5OskU5rRxm/It7XTT+gbg+kIbNE?=
 =?us-ascii?Q?b/az0hcaxIG53pohxfWPNc82B0e6gCin7Y9wX7usH5In9S+Wj11+Irg+hzh/?=
 =?us-ascii?Q?tMj7SnMz48hHArvSjMoJYZaVekhW+n1WQcJRJFmZlcdQ5qQq1pBq+jzMw68O?=
 =?us-ascii?Q?NK4vIcOLAGlDB3yp3Sy74R2QWLk0J24szmxTKKmnN+JDs6CMHJ+Mt2H5E6t/?=
 =?us-ascii?Q?nfKdQQrVaUvlPDZAbw4e0IP1K2W8wwXuvxwl4bN/OpVZGjYW2gIJyJVx76YR?=
 =?us-ascii?Q?LLlG7opYJT4ag/AkFhfVB47KUehHyk+Q2kZ14cspln/122xP22hH8DsYjet4?=
 =?us-ascii?Q?RqYn9n4wI8r8Mz5DU1H+xTip/9TE+x4NmRJrTrCj7LuIYvDlLAxtBJSbF4sW?=
 =?us-ascii?Q?0kkhDIlvqN4t8IZHFTNKbeQO+3wnGPhQP+shOuAwst3ianZARdC2DnYqeRNy?=
 =?us-ascii?Q?LN8+6XbX0SvWsaYsoQtWtS/Mgzlt75/wa8KBTUsKIl+hs69w7p97t3WWl/kI?=
 =?us-ascii?Q?KIRd4zsYFXoY6hXzozZOo6EHQk1I9CNtHHZlgKTWNPKBVhQ1z6OqeFxZbMEh?=
 =?us-ascii?Q?39vvd8jO+tcKVj0h9mfPcSK1mWVsw8QcMS56Ig9xO1tYeloN5oAqFF0dDpu7?=
 =?us-ascii?Q?nvjPwoZSE5Qf6x5tHqA44z2mZ+2l3Xe3BSUkCo2naTbpbZkmo849G1kvTy/N?=
 =?us-ascii?Q?qmnzjPDARI7Ko7od7Qu8qrqGAN3hz58w7j2wmT9A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa78650-3cc5-4872-589a-08ddc5e39ad0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 10:12:30.5515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rswcm7ZFy8MHng7WT3HN5+NNhlyVL115LfQSX1fWa5b6exW3E4g6bvyHxNIRZePDzIplS+P981D11XCLYSJv8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7180
X-Mailman-Approved-At: Fri, 18 Jul 2025 12:09:10 +0000
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

Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.

Shengjiu Wang (4):
  drm/bridge: dw-hdmi: Add function to get plat_data
  drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
  dt-bindings: display: imx: add binding for i.MX8MP HDMI PAI
  arm64: dts: imx8mp: Add hdmi parallel audio interface node

 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  13 ++
 .../display/imx/fsl,imx8mp-hdmi-pai.yaml      |  61 ++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   4 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  26 +++-
 drivers/gpu/drm/bridge/imx/Kconfig            |   7 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 134 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |   6 +
 include/drm/bridge/dw_hdmi.h                  |   7 +
 9 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

-- 
2.34.1

