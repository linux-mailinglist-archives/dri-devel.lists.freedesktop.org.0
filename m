Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A455F9A35F4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 08:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A3F10E202;
	Fri, 18 Oct 2024 06:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fQoK3UVf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2078.outbound.protection.outlook.com [40.107.241.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF23E10E899
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 06:48:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2xWl13tcf6jsJqwQbKqzo9IS4foeE4r6iaTPcd0szx4Va1fn2WF04onL/yvm23+OiOpefp1QS+qi0LJMb0K49sxedP5NeDb9kwj5+iKOpqDWwC9cI9ehkJw4NO9OjyVluOnk9HFyF/J+cO990VkVp5uTRgu7EqWORv/gMU/n6wDf8F2Hbtl5UiUjZhb1+pxfuugN1x9IkWjeoZqqrQwSgYpsqVpELmAzgCSylkDVQYvv4HBvhbqSrZBaHODP4Uya0pWAcJLe4o2qCwUvWJ8oM7+F8POM4TcWShLpSeg7hItsmsP/V82f0KHbnqw6qqVb94hxwdvurIxJDf/uucIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ae6WsYwoEWAp7tiQJzLiju/EVhyX0deUjHBzWAv3ies=;
 b=COb9vq1RT/ZI2bm5C4VKEYSli6rR0yre4u9j/ufqeP1j/PMvrqd0uX1DpT7qkxPDumsU79fC9Int0ng9AUm53cy5S3o0d1f8Nbe/gvuh+bLo4lheOfQfDXVlvjfoL6NTub8QqCx/cL0XNrWRrCgWeA0A8vSykbZ/bLUFvWbSjdS9tlqKEcFkRJCUI7mNxufU5q6EfVdIVOb2iYMq0QPsASejS+ceYYx/+PwZouP4ApJ9VkUQheos9lW8apoXL6ZJi/TyNm8/NOxAVmqlruNLqzMxDuTTn8q7o+oR1JqMD2eyXJLw/K11zQ/+EnykTb0n5AJ8f1br5DYIy+c/cBFepw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ae6WsYwoEWAp7tiQJzLiju/EVhyX0deUjHBzWAv3ies=;
 b=fQoK3UVfU7pS06e8bbdg1kUfar1DVChf2UXUZXLudTKSwKYS36spHU9nbqJfwCpyDsX2e8upWxqW0BnRWOeZ2BnrM4ldE56kiBP7ygQQAAzHwiseJZkJhg8zqDGktPX6sbgX62hpMFOYm29hzowL3oq2VcYFgbGsLrMB+N/5gCE2cg5t5aytEgmrSM6ZSgOqTivOVcfccaDm2qATGrsnup8F6v3zvuwXzsNsAUv3ZmxrEUh7BI2bk7LiXr+XANrFM5f6SybY3NPrVBrpXlnZ1bIa1umlynHefw6bgvyht8/NlEGi8B3TwiJGZePwQCWusi+OtGByfFpDKmYSl0nJzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9787.eurprd04.prod.outlook.com (2603:10a6:800:1d8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 06:47:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 06:47:58 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, marex@denx.de, stefan@agner.ch,
 dmitry.baryshkov@linaro.org
Subject: [PATCH 0/5] drm: lcdif: Use drm_bridge_connector
Date: Fri, 18 Oct 2024 14:48:08 +0800
Message-Id: <20241018064813.2750016-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0204.apcprd04.prod.outlook.com
 (2603:1096:4:187::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e89dd10-96cd-4867-48b2-08dcef40ccd8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pWdAv3VDcjB2yMIYFhQ/Vqi0zbWQRJHlY2ghE4KDpp41iraP1xWOEIdI/yjN?=
 =?us-ascii?Q?anURSp8P4ZDWv0ZMXpGC4p4wsMU+WmUnxH+3nkNOuBriUHeAgv9q1CO2xI5g?=
 =?us-ascii?Q?0LHj2FxDM/X7xt56dCCC2Kegc+vb71b/mcAKMDx6Mu+X7zs87KrvG3haarnm?=
 =?us-ascii?Q?6l8Lu8NQ/H1w0ardc8MiNJ8mN//vrF1YbPvrwl+SJTR+6tFPg18hMxKQku5f?=
 =?us-ascii?Q?19mOZSSpR3/boIzGNrCeWs3lWNP2OiK+QTFU0pcNaUT3Nfi0YIPDFT2p3HU5?=
 =?us-ascii?Q?7X6/LGktW17JtwLNJrZm3Dlx+U/DBuv3stpE0FUabTs5Aa1GaveGJ6wLoWsp?=
 =?us-ascii?Q?Be07CJ4rhxoW4O1WA8Rb37V62QpnJQ+AZitb6ArUkMmtUFxyKhvxCrr4iVCi?=
 =?us-ascii?Q?wL2wnkEIN801+cx7KNYTVnt1yUgVHxKoOWeH5lDYGX5j7N5qnKz+hl/XpJ62?=
 =?us-ascii?Q?9paekdz1zhDUcKNhU0U+V7fZzDM2uNnMnhMIR7kIEdUa1xQuJTp9TadLNaSC?=
 =?us-ascii?Q?eLPnR/3B7pQRis/9Db6PbxiTQEo9X8ANJ4S00S7a2h5WGCCif/2zYUzAKLpa?=
 =?us-ascii?Q?KYd0WH6XoFLqJlZL7RlvRa3xd8oAOqVShLNdW9ZlxS7Tbwjzx7UT9NQ2kaLf?=
 =?us-ascii?Q?urCgV7a4zJRH5O+yBgkXbMbR4ve7th8+1YUtzCQb19ZkKr87IEBVMTVMwQMu?=
 =?us-ascii?Q?016CHpUmf3AyioHCGsEXArtiFZeSqeZZj27h+T4PeSEqRdVuTH+A86CJ1JPp?=
 =?us-ascii?Q?udl/LvO/mVaJ+uiGZFaCCxICBxWu8JHvLPbCgblqlxKS/0Ei26+p8IqLbDrQ?=
 =?us-ascii?Q?kcOwgByfarb9tC40NCJBcs/kCo4ZxV7+supPIOtLXwcolvubTCm2NsOuDERu?=
 =?us-ascii?Q?wVaYva6cMEqnS4fQgwKrmP0oeD5xifP0oj1lrUtp7WGOXdSkuMW5hQf8u7ry?=
 =?us-ascii?Q?hIIsQOu4PO02cK3E1FWJCJvYuz4Z3rjI1S3ks7InbeElNSbWYrN3nDkTqpqI?=
 =?us-ascii?Q?rTi4LMdp3w1l/EZycSAzOU7VYczF3kBUYyAqL0gFRp2wHddVqljG+nlT/f6R?=
 =?us-ascii?Q?/3swbctrwqzxI29CGWm9zk7ln4p/9v9p8B0/V2+QoHd/Tbpl6FWJkkl4h1R4?=
 =?us-ascii?Q?74VYDyNJeb3eT1/Om0VLXqJF0ztjYatwyK5+r7R7T6CAHhpncKmnGljouCJ0?=
 =?us-ascii?Q?6zi7lbQsgVGLTYhJgrnvgM9ut5g7AmgyDzShjcWbBYi6w6lXMVNqoBDrcn7+?=
 =?us-ascii?Q?m4bgR+JBEPEUB9ejPITFsmMxtgPf9ziTbMP+jXr46P0MxSQIkZ0aJtc6AVDL?=
 =?us-ascii?Q?Y2fLnUfzVw3Aev0a+8sLoCc4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B3i1dOdq/7O7njTvGoDWjGPPXF+ow010U54U7sC50hVZqyfD66PCuFAcKT80?=
 =?us-ascii?Q?QwopwHkI9FOseT3vgXTyA+jxC/k3zaasQgqM3SXzjgiWYtSNNR9LDMqI/SSw?=
 =?us-ascii?Q?BGZhSyRWeLRJ7Rd4G841c5TaLBpt7BE9//mW0pMtgl0b5bl08TNvtEwFIN84?=
 =?us-ascii?Q?YinonhYIr24tIRz+sybpl3gJvyORbOvjxbmJ2BnIdlkw0J0u24z6iFVJdSSK?=
 =?us-ascii?Q?u/svGxZLneKy0v1B7B2hcwtDoiEjsC2efI4UsIl0xhFkeAmFJlYm4uRzNnCd?=
 =?us-ascii?Q?XroIfYX1jdsoB3a3tyglXc0dKI40Qx3bpbnEqk6LP5QkFjdX4DLOF90zv8yq?=
 =?us-ascii?Q?/iwOaM+mur/mHLG7ErJdMpiJ6WOoAOAaTRcylHYMUXm+ecGCVJdA6D89oa3Q?=
 =?us-ascii?Q?I8+zHN19xVBOQDyb/wn8/cWlugVx9UxDOSlifGE2h1mIQqH2W+gGCbLlY5w8?=
 =?us-ascii?Q?D5ykExO5y6LU+f79JMnV549TuSVAUoDJ3Yvtvv6pnku/SwZXWlaXsarzIpCv?=
 =?us-ascii?Q?AHWmJK56zv/OCOoYigDhYhSFarbg0zVNUBmdAOf6UmaWT0+5EMmaiXj34J28?=
 =?us-ascii?Q?3XF6t+y5lyUayReknJ7CLxOzhld/NpW53ks3aFan2dkRzkHTUF6RekNoqWy2?=
 =?us-ascii?Q?COTcIghk5yPOOoUGEWRrBqfMc3Jgppn/5BCafQi725BWAqzRHTfFMBA0yqzq?=
 =?us-ascii?Q?xlRci/E6agbF1k6kGplJJiU1LtATK1EM1JCJffDgQAUCvLVf+8yCCeMdwPWy?=
 =?us-ascii?Q?vRQzx7fPLqdq2gWGkRhOtuJVwwltqgsANuFiXzcTZXmotJmAbf9RPqrHoJLr?=
 =?us-ascii?Q?oJw4EFCFgFXj4GlJKpGhvKkxnJoSLuO2NKdcRojLyZZ1TE6ZX3HPEJhm4a/V?=
 =?us-ascii?Q?hWTgFPrWIT/6yTE0qOFB9+Y9at1eyrBVFblfaN4EDHLL+Rt8/fYpSuFG1qPx?=
 =?us-ascii?Q?55JNOfHhYzzLY56vKszONkSrwgGsFQUR4kwuxMzkce46WwJhS9rg7hzE77DN?=
 =?us-ascii?Q?1wtzdsQl59DLVtNIJiTrL3nKULbS9ieAlvHq0RsTV3iBw4i9IfWKQ7Z/bySx?=
 =?us-ascii?Q?zgzaFOAzUtosfr29tZr+qZ7r3zVFFsZeeR3ilBFTnBo9l6Aw/6M4AGqD5RdA?=
 =?us-ascii?Q?vFhwglaGLhWiHDTQxfeUYvyJx5X6o+0ODnj2ApYtHbdM7ZAV6xRNJVoMDmqN?=
 =?us-ascii?Q?7SpKO6XzErW7aAPzqQMY14vAtZnQKwwl/5BC5UEHtWbwqEvZtTpJaLZG9hrJ?=
 =?us-ascii?Q?5xpqvXnmsGRrVaImt3xZ8Cn6wKBP+/i8Hqg7tbjjMsKuBS575HJcgGPeIBQt?=
 =?us-ascii?Q?CG26nriKLl587dVCE/8dqWiQLnAL4VVsnECfPttiUD/8JSduZEIlyuSeo0xS?=
 =?us-ascii?Q?rdZHvNPsw4/naNB9SgTLs1joY0TFEoD8Fpzl8fc56eV3zkDRUKr+lJVXqs0w?=
 =?us-ascii?Q?E0IVsz1YJUFqzhZ/Xyqc66Aq4Jis+jg/CAW16cSylDaoE1AsuWUg0cG2oYjC?=
 =?us-ascii?Q?hY1EEiTF07ofrhgzEcnyTTG/kEOSnICQ5Ia83MXbB9s1Kc0K+uKikzoRl7Hc?=
 =?us-ascii?Q?2Nau1g8bKKp8FR+QQLX4jptdM+X9A03CHzNNzLa0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e89dd10-96cd-4867-48b2-08dcef40ccd8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 06:47:58.1754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIwZ8xq0V1f1t9Lu6eu2y5vQBKFJYhjWQO6/i+ka5Xe+lERbrsBEEOVAPoliLhm+cM6cT4LLTgR/1GvMWcjetw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9787
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

Hi,

This patch series aims to use drm_bridge_connector in the i.MX8MP LCDIF
driver so that bridge drivers don't need to initialize DRM connectors.

Patch 1-3 add HDMI connectors to some i.MX8MP platforms's DT as preparation
work.  The Synopsys DW HDMI bridge core driver would try to find the bridge
of the HDMI connector after the LCDIF driver starts to use
drm_bridge_connector.

Patch 4 sets output_port to 1 in i.MX8MP HDMI TX driver, as a preparation
work too.  The Synopsys DW HDMI bridge core driver needs to know the output
port index so that the driver can use the port index to find and attach
the next bridge.  The next bridge attachment is needed after the LCDIF driver
starts to use drm_bridge_connector.

Patch 5 makes the LCDIF driver use drm_bridge_connector.

With this patch set, an in-flight ITE IT6263 bridge driver[1] doesn't need
to initialize a DRM connector.

[1] https://patchwork.freedesktop.org/patch/619465/?series=139266&rev=2

Liu Ying (5):
  arm64: dts: imx8mp-kontron-bl-osm-s: Add HDMI connector
  arm64: dts: imx8mp-kontron-smarc-eval-carrier: Add HDMI connector
  arm64: dts: imx8mp-msc-sm2s-ep1: Add HDMI connector
  drm/bridge: imx8mp-hdmi-tx: Set output_port to 1
  drm: lcdif: Use drm_bridge_connector

 .../dts/freescale/imx8mp-kontron-bl-osm-s.dts | 19 +++++++++++++++++++
 .../imx8mp-kontron-smarc-eval-carrier.dts     | 19 +++++++++++++++++++
 .../dts/freescale/imx8mp-msc-sm2s-ep1.dts     | 19 +++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  1 +
 drivers/gpu/drm/mxsfb/Kconfig                 |  1 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c             | 17 ++++++++++++++++-
 6 files changed, 75 insertions(+), 1 deletion(-)

-- 
2.34.1

