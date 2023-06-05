Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC8C721DEE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 08:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874A110E083;
	Mon,  5 Jun 2023 06:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039D410E083
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 06:17:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J57UBpM7w8ZOWFx4sEcUqfo9i9l6IexucdDzBsc7LteUiFpnXCmGrwjb4igauKaOfCDXlvpLnn+kJrxv2Ar2wVVqT50FPQwvLW1CubznkbbTNYgnTx0FfXZZaBGXRDmN5jVQV7sz3zE/u63+tloR8aLviq5OIuI2vL3MmD/43SD0TKjN4fbgegeEM10TOMctgfoOk9tEplT6RZKuro0oG8uu4lHv/o5NYN+Bf9Ra9eHqWz9mXG3WDNWoj3fSD+xiqn7HJYpiMFzkv08Y4zPtJ5/vBMxQQ9x8xg2cxt051X6AQJ9LhUCnG7oZ8L7RWeoQOWfGe8PKTnWfXI3OQS2G7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vq2QrDsLeLFT3PrU06q3+b+ugFyA1/XdMAChtwB92q4=;
 b=SKCsD+NsZ72Y8o0lgAjbpkEJLopT9TOAv3HEylUUWF04AQ82TasbJ+/LH7Cr50u15CwHQXE6scJrsN/FNbRzcFcHohogcuZIH3fg7uN/L2NLIx9XjhnMPl2JCJWc9zr860spRt7mNesM10IYIF9NPxYypeGMxZHMmsHdKb2M9rAjD/66zloCm7Gzvtmwe/o6EKmeFQbENEphhWJHgVPMCZrB4rN01ElFBzl1Hr5DzEFbxnpT0Ms0Crp55uwl0zwdm2So3J3ukm7mLPM/+GDnzX11woVZrPABdQEDm4Z8ItDSp2+1CDOgrItR7/AN/NU06qV5B/jgnKunCOLdZCV7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vq2QrDsLeLFT3PrU06q3+b+ugFyA1/XdMAChtwB92q4=;
 b=CUP7OO6HQevF66LBQQMVGqpC+45GAAB6xwIcuAhKfNttvU1BoK2bUQEIcvIC4+pDpNaJMB6NgzruSKL9MSLV5v8+87p0FTEvl769R1fzuIUVqdkhjre5jzIh4gAVODYy8GjTScmNsFT9YmtuvlOvd6rmP7pFHuN7Ar7G70q/gD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8545.eurprd04.prod.outlook.com (2603:10a6:20b:420::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 06:17:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f3d5:528:d12d:50d0]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f3d5:528:d12d:50d0%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 06:17:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Date: Mon,  5 Jun 2023 14:22:15 +0800
Message-Id: <20230605062217.3716328-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To AM0PR04MB7041.eurprd04.prod.outlook.com
 (2603:10a6:208:19a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: efb8b8d9-6f05-44b9-4d2d-08db658c8afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DnLJZQ3zVNATn9kuWitT8k3viQfEmGTcNJpZQVxhjsIWYFfe42I4tcee/3ECCOCBvMbl3kGuIxxQRNitcBIS545BEp7YM4X2p4Q30JGwpmp/6mZ0Car6m8/et7D8hNaS+gWz2CseQyoOV6mvW+jUrNIbycAkYKS0w7uISoGRb4YEX/6ZYIGzubqb2h+CLUC1j0Tmenf4zgm/jvxcymU5D9wsw9KauwvtdQ1kR5a8NH3dTMrS++mokx+yxbpIAAwIHe5OGLEyiX1scRLPJQsBUK7Gn8SuTYO3YSo2kRWwRaCkIxgGhcgoJt0USUXlXB3PiHFDdX1purtbBO0ZzdmPzT1U+p8/fZpL+EP0dYWmo9wkSkSBKBPsMAKrpJrhmzYz9twB1lw2FnmCwtjxdvGg2WlCDfSF7Nj0o8j6dumOKMpaYJMUjv0AGEXnBwhreI9J7YuANJ2g9r1T/rK0UE4y+0mjotpTf8vJjtVL+GjTGXhx4S2WcZxlZ+78TZKnV+MTbyyeKX4xTEKvGUsOVoZpYQe06ynYVcfj6rRNssjs08pMfsFAHwxOaZUdOXK+b8FAb9DHCoazfQzzJL+n4F/MnH0grm5zVVRh1MU4Ge5V8CVvOg3zyy1/wN9SAMpS7CbS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(2616005)(26005)(6512007)(1076003)(6506007)(38100700002)(38350700002)(41300700001)(52116002)(6486002)(6666004)(186003)(478600001)(4326008)(66476007)(66556008)(316002)(66946007)(7416002)(8936002)(8676002)(5660300002)(2906002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dmdCzpvsrfcKFJOWLKvQYJG43h7+BcPBwRKT55ThSDDH27q+tRE2ORWn+SRB?=
 =?us-ascii?Q?Muwcz4vfaL6Xjr/j4Xq6JMvqbs3p3RuBZs6okJD3mRPHGUoaEoflClnpQ1al?=
 =?us-ascii?Q?7VmUxvfNsXinZTADyT7SyI8/APbF0QIJ0DwwXNu4Gd6ugSqih47a4KSWIaXA?=
 =?us-ascii?Q?kt+rVzTaGwqeaNlzTbPi3YE6JLiXOxz7oGjvr6fpzpfFyGgTkG4SU2y16h/x?=
 =?us-ascii?Q?pZWxnZSBHEIGkjKbudqppRhzMiAW5MFSe0soZRyIBB+jEb72l/5jRYxsCZ5T?=
 =?us-ascii?Q?dTOZ5Idin7GbFv/F2ftM4XXNcS72nzQdDCRUhgkBhpKpqlXvqi7vS7XQP7je?=
 =?us-ascii?Q?xuZ2AcASK9U0uaD8OoShN8mY+oq0IpuEg5oPF1FgIYdNSSQTkREUxjFPcN1y?=
 =?us-ascii?Q?WlXvlCIIYWBnAKtImmXz6fQ9tKXUSRtGK5Z9qhvjV6ht4P4oKjjHc2Iv7Fv8?=
 =?us-ascii?Q?CqKiBE8l/SXxedz0fqg9usAWEbklyBLB4Dsg2jIwxYbad8zRUxOSzMMi445Z?=
 =?us-ascii?Q?lRMLjz1J89CrnU4O538DbUs+buPIvUNQ5k15SjGMj7fMhRDaTJFMnp76WykL?=
 =?us-ascii?Q?nuy45EgfuZ46hafQNnV4uV+h8kmEPVVl6ACbJq2uBZ6Z2KfQL11gWI+vcwRc?=
 =?us-ascii?Q?mk8hNafiYODUnOqTUv+NS0moVoAMF6wsoIDU8aZ5EsI6sQIjYqDmXDrmrTnp?=
 =?us-ascii?Q?BEJdnzdOJkzAq/0WD9CsD0u3P3vBC2Qidgh44i8ABaqlFFUiavxwvxJDMy5v?=
 =?us-ascii?Q?K2crwFOH+aAyPW0RkuveJX04Yjq6zDKICuumfb0hnkHl27HHm8Rf3bobdhIn?=
 =?us-ascii?Q?8t+US97zeGeDaftmiJhW4yXwwRjOcOFx+fmkM16No3HtJL8Sa6VKnmmXnnAj?=
 =?us-ascii?Q?QLEUMdQQL5hhS9hYwVDRiKLNjBZE1DvCQ9OalN++XAcH/V8Dr9pTiRX7IOjJ?=
 =?us-ascii?Q?1EB0HGXlcD+gECBvJcKCPKJG+AW1dBDcyWiiEpplK/PaQmpKcpm5hTPKhmL9?=
 =?us-ascii?Q?APeYaamQx5QSwqpbbjkUyDjphRIDTNHGAuJ698qB4nBQfBwsd7JoGmOmRoFb?=
 =?us-ascii?Q?wEunDZWV8MqN0eGn7fPs4RI/iNx7XnkEGDrgmkMep5MuJl3pWngKtQY5vJgF?=
 =?us-ascii?Q?8i4wJMHzvBdgCxTiI+i5Lzjm8K+idQnve1VuXyfylmoKWmpZEvdA0lzsen0d?=
 =?us-ascii?Q?cy20NCOGphnszHm8DV1vH/mQ/IpACi1Ab0MDpWWvObx5Jbxr5d0XdEmaoezX?=
 =?us-ascii?Q?S7lZFr1idP8SlydT/ceCacLv+xCPL9wkervfA7N2Ntm7Rx6tiEWqlzVk+1hT?=
 =?us-ascii?Q?+sP3CwLdl54STPrFXyFOB0pYXJ386YqsH8WjU9kNvlDnTR23Ae8WoY+OWLk6?=
 =?us-ascii?Q?60xj4H9BCJbSiPO7xSNI0nki9gl3NC0wRUpa/7ufupcinV/DinOZo7nPF20b?=
 =?us-ascii?Q?32LE3sIqZRBJWsmNVZmavHue8dmdR+X+DFeFLJ+ODz7ve9Z9mYaWaOM3Xt5Y?=
 =?us-ascii?Q?b85quMpB0xV16VldT2phl10tbKRfnT+oPiNfvLv4iTDV9elk7Noq3eC5ULRY?=
 =?us-ascii?Q?SUDaIPkBRK7fFgCtH98Qfit1Nv73wvTRhUN5aaAE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb8b8d9-6f05-44b9-4d2d-08db658c8afa
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 06:17:30.7390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6VNe6witFUSpXruFgA8XB2Hw7OvbHQrxpRSATGAO8arqdstryXPkxM8nVR4WoDjpgcTJbZr894Km9hbVG5sVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8545
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
Cc: marex@denx.de, neil.armstrong@linaro.org, conor+dt@kernel.org,
 rfoss@kernel.org, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 s.hauer@pengutronix.de, peng.fan@nxp.com, jernej.skrabec@gmail.com,
 andrzej.hajda@intel.com, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch set aims to add NXP i.MX93 parallel display format configuration
DRM bridge driver support. i.MX93 mediamix blk-ctrl contains one
DISPLAY_MUX register which configures parallel display format by using
the "PARALLEL_DISP_FORMAT" field. i.MX93 LCDIF display controller's
parallel output connects with this piece of small logic to configure
parallel display format.

Patch 1/2 adds NXP i.MX93 parallel display format configuration subnode
in i.MX93 mediamix blk-ctrl dt-binding.

Patch 2/2 adds NXP i.MX93 parallel display format configuration DRM bridge
driver support.

v2->v3:
* Define i.MX93 parallel display format configuration subnode in
  i.MX93 mediamix blk-ctrl dt-binding. (Rob)

v1->v2:
* Set *num_input_fmts to zero in case
  imx93_pdfc_bridge_atomic_get_input_bus_fmts() returns NULL in patch 2/2.
* Replace .remove callback with .remove_new callback in
  imx93_pdfc_bridge_driver in patch 2/2.

Liu Ying (2):
  dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and
    example
  drm/bridge: imx: Add i.MX93 parallel display format configuration
    support

 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     |  68 ++++++
 drivers/gpu/drm/bridge/imx/Kconfig            |   8 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c       | 209 ++++++++++++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-pdfc.c

-- 
2.37.1

