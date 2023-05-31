Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7F717BDD
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5211E10E4A4;
	Wed, 31 May 2023 09:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2057.outbound.protection.outlook.com [40.107.8.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C3410E4A4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5iiV2Q2CRbuRRg5qjrfTfVdAeO3ETc/D2P4yH9a+tg+iLDjWNMoxhObHrp31Bdwh17utxTO4U2moyFnM3m+RFynSuvptwSk85liTkCgTldSH8eXKc1PRSpD3ls/lKaloRQNLTXTnZPB1rdeLpRHChgWpf4202Zk5QEmhscwYtmGJUYbDG5AuQ8079Cv5TipLiSCI5J+6Gf/5SCDXHn6lzKitA4+GtUaNJomoyMJ2aB0wQSQu/ja0U2voBNPnx8hKk1K7si0x54JYoq0JvzOCZPQpvJ0+fJ5yURw1fq2beryZXhON96qYyxQswHMkVdh50EuEYWWBLqMxD8hejqGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pc3UWKfkCvHY7X4MFZBa/IgU8GuLGhkGE4NQYsFvJws=;
 b=h+5RrUjSko9by1qKENsYAWwTLAkbwNBoCoSMRYjtHd8KSzk9NOjEyjIUh2QkBH0Qso2vicLAiq8JhdjYKFv2vT0kiEeWVrNkEJjpb2cI69kN0yuqBxglfaLYbxdtiw6M+Wk2HwOnN0iMAysV1iH7WPSgzGaCmPp/ddUzpELBIO4YX4nsUliGu/+/1rAY70zrxPwOzlSZkbBxtgA2TN+jS1BKCozL2aSfmDs2Zm67ptswcbLWDJFkfDZ0D+pMxvIzeYU4hVvesqtzvlzYukV/u/zivq+V1328N849vkSDpjiBm749WIQ/fEuFrsY0y6AJzvoQei5kjQSZ7TWlTQuxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pc3UWKfkCvHY7X4MFZBa/IgU8GuLGhkGE4NQYsFvJws=;
 b=irqktpgXkCUTj3ATUFKYrcTQIzWsMFeLi3wxPRoWElW5CHbv7+RTG0EEuEsN/j916B+K1XByl+PdQOXNiYE2ADqVX9Rh3S34mzNfPpQfw1pFODVJXkm47w+S046pkZix/R+FQ9h+M2owGWn/Lf/BaAJmEo9/TTpc+4zNZXOPigQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7963.eurprd04.prod.outlook.com (2603:10a6:10:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 09:27:17 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f3d5:528:d12d:50d0]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f3d5:528:d12d:50d0%4]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 09:27:17 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Date: Wed, 31 May 2023 17:32:04 +0800
Message-Id: <20230531093206.3893469-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 895a0079-8126-4467-a73e-08db61b939c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gAWwMNzoBPg4XHIPcUQzAgW5VO1net475aVj1ASKHKFcDOMnrHuUNrD/pBBHeoFaXhzEbFV4AzUMqrV84Nv5X1YRSgOp/A+8inBkDwmFwMilCHFApE5uJMTLwmboZ+4eS+W3TMwMTKPThCv4ENIk4VIGnDPCdAfFQQZTmSxt6ljcZrXQ6Tu+9Ud2S4Z4Wy272TmlQlEcZADtEJ3ksumyhLJygLs0bB+E+dWINyLvx96+OCQ/dyXRLihZ35UJVAH5sGSQo0Et5KEuhLaQGjES+3u0/j/Q4P3ipgbDDNH3+BqeeyNtXKbRNuHIr+C6ZU41pWx4JfcDOiOC0iLEEDbqQW7EPgH7BfTs7uD11/ryxkJj0jTy1lbZ4HJ9rKWQcgZiufDG5Y/9DLEDbZyBIEdj5gJwggr0K0fwxhVKTStqF/rIxKit/6sNxpu1Yjl6nbrSRI3Fyr6e+4FMN9A3JVtKTtc57SRiSqRCoRHq3D7uhQyqTWRirrWF/NGx9InGaYH6X9bdgVLHBiJalAyIfGQ2dSNE7b0yVKut3OrlI/N7FbrxdRcJ6JFYZKJq7+alzul9/kekzq1j7QgKdfpz4x0dtM2IcE/F3LErqq9Se61mcU84izstdAjqkCHOk12YER2v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(7416002)(5660300002)(4326008)(66946007)(66476007)(66556008)(316002)(6666004)(8676002)(8936002)(186003)(6506007)(478600001)(6512007)(41300700001)(26005)(6486002)(52116002)(1076003)(2616005)(2906002)(38350700002)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kKTig9MqIWyoWge+Jby/uhA+IbbgexGbDF5095xgyGsBgWp91v3yQZXiYAdk?=
 =?us-ascii?Q?3LE0KdBEeVuH0yloQED+BcWJb6camGs7jXOhtjE8fLX1tTur645dcB1FKR2Z?=
 =?us-ascii?Q?4wNnMpdeYZN3B07Uq3QSbi8Xr7XiAlgydJpa7NfZF/UN41+ngmtFzPzYg8Ab?=
 =?us-ascii?Q?UMv3cs0MYaNIE+49ABVzHCzhsB8l9QqZl5Ienc4UnDb09xAKXqVXiKEQdors?=
 =?us-ascii?Q?7tgvg02FyOOIg5HDDbCsoaCC8zlnAyOI3rpKLkT3bJZy0liO2iiS44qkEJfi?=
 =?us-ascii?Q?X9N9y0fuExKI5rhnSPO4M/BfMjImn4hysimy6kJc9MQcBdI20nI1fQiBc4Nk?=
 =?us-ascii?Q?27JNeU47FxMb3qehQhuDCVRbf08RFUf1MoYUZPToisKKyc2FuYgcXWAfNFwT?=
 =?us-ascii?Q?Xsk521dFtS+ROiDcOiHYD/mVez+N/udPMxDilEHWkkFnmaniWKuouLbl0Rit?=
 =?us-ascii?Q?Jig7I+b1HuooQfY5fLGTXRFSXxSO7NlRcIPQ9arVR4/Q5AE/7hIxPaiYtbTY?=
 =?us-ascii?Q?Ykgp4olzUqNywkUC9kw9T+Y/kutF9jTrYufs4K4pwDN6uHq+bFuZyFI+MPZ1?=
 =?us-ascii?Q?np3zhfEZCFRkwsX2V31X+wzkaOMrYMHC6SG3S6BH/GpGWm/nlXjUhbNAuCgc?=
 =?us-ascii?Q?aawSpq2RVyy4NAfX6WnW0hza/zhiaWTHkwpYBgrlw3qrdtLbBdu0kfreTHgp?=
 =?us-ascii?Q?IqYBv4MSOfMosVM8p21ZvGK+TQ4TOKtrYoOLMsWGU7+Uk6fs8y42MSl7CeR7?=
 =?us-ascii?Q?ZL3STkD2I5rzZ6tS3wCacMElF9eZ3i2HFGemMc5u6Shz6BVK5tZpoY3hImBC?=
 =?us-ascii?Q?x51BeX7lPk5SUskoygnCQlaa3Hys6LgmDil45JxsqHITMjUihHaOH/drWLav?=
 =?us-ascii?Q?x2LyE/545nZq6oYtjD3fYLUlYeEbQudNDCBBfCQpP97Tqt1edLtTemGrqwOT?=
 =?us-ascii?Q?GK+4He+DwCScKBUJp7Sr/ndfg/ka+69XE9VH1QpRCplIh9hWQGaXeT9oLdZh?=
 =?us-ascii?Q?bEjDzCvmP3iCGyEFZBdx0IJysmfUfufnQVei7glSqBZ5zRz7fie3RWByozcv?=
 =?us-ascii?Q?sw/NtWKstUBkA5QIxrPHwG3mwxP2a5e1sEOP0JZ7B/U6Dptpuxa9SrhrFPMs?=
 =?us-ascii?Q?KZ6cT0amqv8fI3iHDCiVa02AqTCkrSpGgKhg20YGpQwz1S/oBR8gBm0lHKnM?=
 =?us-ascii?Q?llSagovVWKAOCtHw3aamwc0b9xhXFlHwqi+FWlmfI8Iy3qaZxm0ItQ0jP7Y/?=
 =?us-ascii?Q?Sv7oaUkh4tqKipejDwnzDYT3HgNYBtnYyNL3k98EFgV48EviAwPRfFsZ7Eq5?=
 =?us-ascii?Q?3LPUEppSQEw50jxzPLMfOW4RUOx7jTve3IfBz5pL+fiEyoDT5gemeNZyJwhG?=
 =?us-ascii?Q?fDRabtYYI6mOEIcn6Zw1px8CZB/suUXifsiWFXgfAB7wszwF8W4lfIDJ/iFI?=
 =?us-ascii?Q?T0nOWvhxdhEBOwjtD2mobPEw1G4BMva2MsMVJ8NqQ0tp6RwCgRnKIGj4Neh7?=
 =?us-ascii?Q?PF/glILHP7w4Q4cAEsc3b5VtEjCyUhNw5CXVitnarXpz97tSeArYX3AwnXRE?=
 =?us-ascii?Q?LsWcuQ5JdX01W1f4AQ2SAXwQHngBEhX3wjBk20eT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895a0079-8126-4467-a73e-08db61b939c3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 09:27:17.1287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAt5wXsV158JyTHOcXF5+yBRdAt67YLAESW9qAJEVFiwimFwhsAC3jCoy7dQGNt3L9ju8josPJ1lUjJrP7gxjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7963
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch set aims to add NXP i.MX93 parallel display format configuration
DRM bridge driver support. i.MX93 mediamix blk-ctrl contains one
DISPLAY_MUX register which configures parallel display format by using
the "PARALLEL_DISP_FORMAT" field. i.MX93 LCDIF display controller's
parallel output connects with this piece of small logic to configure
parallel display format.

Patch 1/2 adds NXP i.MX93 parallel display format configuration dt-bindings.

Patch 2/2 adds NXP i.MX93 parallel display format configuration DRM bridge
driver support.

v1->v2:
* Set *num_input_fmts to zero in case
  imx93_pdfc_bridge_atomic_get_input_bus_fmts() returns NULL in patch 2/2.
* Replace .remove callback with .remove_new callback in
  imx93_pdfc_bridge_driver in patch 2/2.

Liu Ying (2):
  dt-bindings: display: bridge: Add NXP i.MX93 parallel display format
    configuration
  drm/bridge: imx: Add i.MX93 parallel display format configuration
    support

 .../display/bridge/nxp,imx93-pdfc.yaml        |  78 +++++++
 drivers/gpu/drm/bridge/imx/Kconfig            |   8 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c       | 209 ++++++++++++++++++
 4 files changed, 296 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,imx93-pdfc.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-pdfc.c

-- 
2.37.1

