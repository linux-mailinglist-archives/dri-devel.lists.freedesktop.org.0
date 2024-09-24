Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6874983F46
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA0410E5BA;
	Tue, 24 Sep 2024 07:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="F3mYtBIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013039.outbound.protection.outlook.com [52.101.67.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F0010E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 07:38:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFY9J03RCVbQ7gKBAoYct0+zsM1YdQzP3JbKrQNHxvG5srcwKurwHwX1fp069aW/FlwZF5nDhd1sigiUb8JXCBS5CInKFFmxnwF4tBFMpwO60zVmc4fIXumKnCzUT2WARWwFs4bX1BS/OjHEFlNqmGTLQQv/z1mVtQVdzPf4v+SBmXVGAu4tQdc8yYRtonM230S2iP3IwRtQg65R2FxZz2+JiZDjCMcgHg9nJzzHddN+c/Xw2j9mxKKoyuqEYgrhqdP08ISsjsvUBlhFnGW2ntZyD0uXIHYUWEKvgy1yv2BYxSPJOL1sKTwuZOaMlAbbCR+kNrvuYUjMHcgDJl0TUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttWkP9dF73rjknjj+TACYm9GRu0CaQCDYL5Opqx1VRU=;
 b=eajpEYBLNzHmV1uOLNXiAUN65Ou+HeBYJ/c89KOSGORd82U5SmIv3rCSAYkuuDomWxOFV2zTTPsXT7DYGHhD5zMR8P0yZalRIa609I1oZw/YlVWRRJ/5DdiyBUMA98UXp7vPtycaxMMpzJK3g0U3C7JTOD0aWQ6s1g0qa6yPvw5/Qavl5foQKIPpR7WzxLIrZDV7t8I1OAPR4IzwBOfU6pJ3pOl2gj3RWwU6x+APyAXZKFfzyiCiXnp5v7ScyqPUOQq8mrKvCZHC0aQRCj3/Y74sJjNzzxrc/R0GXCMhzsdDNPJsfc7kXceH3FbIxjT5eoXXQE1hweas/4X3rJ0NSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttWkP9dF73rjknjj+TACYm9GRu0CaQCDYL5Opqx1VRU=;
 b=F3mYtBIsdtBXImWk8wrqncmjIF2pJQ8vXj25qSyBkI1pVeY2eSKPu4tw4TdRz2uXckNN5/lBGVi6HOrgupklmxq/zCEjepDnqXsmzI8DyBDhPEsStPCyvpnWN1Z44FmlEAoRP89OS/JN9MDKUI21q4G4jgsHxcjakVnRznfifNA02VHIL1IHxVUxaapY3n6ySeuJA5fhHcGy2Rx9JRXbpKYkUsUejAf3hQaAX7keJWNdOCIezM2PhN27ByrPkSCDlCkjISOFi17uDkWe4nlYvhS0sOmjObF6pGEbcXR4G50c/ajN2nBprRtfUM39w5gJrO6j89fA6DMcBhcVbBWo0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 07:38:05 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 07:38:05 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v17 1/8] drm: bridge: Cadence: Create mhdp helper driver
Date: Tue, 24 Sep 2024 15:36:46 +0800
Message-Id: <6e2e4951aa4c69eed68af231c2b0b2ce302b2358.1727159906.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727159906.git.Sandor.yu@nxp.com>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: b21884df-9ec2-467d-64b0-08dcdc6bd39c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G47MbwDQVtQ/xmeWURYZZl9EI8Di6wJROBtxMeHThzOQckYF2u9SQV/ouFfh?=
 =?us-ascii?Q?BMG81xZB+wzAxbiTqV6ec2DGGTM7RgzFhqT4M2bylzGUNjQ5+dd/Wac6ds2w?=
 =?us-ascii?Q?RdXm5Zxr/UOCSKnBBxlYiVOECLfYbbTdBoqvf+Tmn+TQac2BWXZ3xA33H1/d?=
 =?us-ascii?Q?CUZPO2TKHfXkLUdzYeA9ltpsOc9h1/Nvqz2s/8clTCYYy2OU/VqVHo9CKxKY?=
 =?us-ascii?Q?8GN/LYCcG1ssk5qGGqMhXqZb5ZS2l9SP5w6P+i3CKhIkbSauutk4K29gXmPt?=
 =?us-ascii?Q?134KFmLHtbn3/x3ba19hOdOwf5v4SJR7/4oZvXtjuYYQBRh8CU/FLXLCCkc4?=
 =?us-ascii?Q?Ab0v0+HKBydOjEhaFagWHPxMxoISvsDCYjOGS4cdO/blkTD9QZRfat0cOQnm?=
 =?us-ascii?Q?v7I39G23tpYwY49UourEDzoimowbpPKcPW217/zMDKHrk2coQEIugHH1Go8P?=
 =?us-ascii?Q?KOKpj2fDSfEw36Cf5WG698qp5/hkiKp6md8tzUgTJAfRB7hQqXB771i4qfdy?=
 =?us-ascii?Q?AykkoM5iTX/6TgE7YIOVkWKWkpxTMfia0cB3UGuSud8hYFm/D2VzwPer3DXw?=
 =?us-ascii?Q?2UHjYbC8BLJ8bky63yGScjKvUVF9IWPfZYZIjBCPcPZTYE0WqUBSNl37cDZ1?=
 =?us-ascii?Q?x0SAAarMWCbAtBAdi4ow6QkIQzKdX+Tr8daohoG2pYgvuRoQrtTluTpJK3FF?=
 =?us-ascii?Q?UVm1Q6gGVIuKLhlYQdUxmgxp5exOLZx8BSH95foV53D8f17R+KAm4jcdfsCI?=
 =?us-ascii?Q?HR4Q+dik2zRYv9IvPI91iR+ZB0hVY70Uo5pZYGd7JsLiTUFg4MHvdRWF4wkN?=
 =?us-ascii?Q?grBLcMwf8Ma1rgGK5JCVPnTRZ55QTVqbFU09W8q/zRZflsl7VhOVNX0S3mXw?=
 =?us-ascii?Q?WeGKLYZtwqtmFy/kTUPaL2bZyDDU2/0lhH9RDGKQrNjcQ2u0yvGUDYERKj/x?=
 =?us-ascii?Q?N1DCEY14dghi4jTTP0hxlmsIO4alxY3Kmom/fwLvVlGQ0xesmn79GMHw8Fl/?=
 =?us-ascii?Q?MtPLr5pGD8ogAi8aXaMTLsEICTR3fia+6XC/SPXGWa5B6jq6Qj3YFNlqlyAG?=
 =?us-ascii?Q?/y/AAVnNEqYyCn9edsFT25KV8WOtjmzl0vWu8cwN4yp26ehMyvJcx2bWfMVg?=
 =?us-ascii?Q?HYoL7WXV4bB5ptxVSNvwp3qiHF8EjiIYhj+Fhr1DgupS0NnfYlSQc4Ik3gJU?=
 =?us-ascii?Q?UOCVsbSM+gKafWDtfew+ck2bbTN5t7vXenx9xHk3u92oFFVKSWP4j0Mtpwlm?=
 =?us-ascii?Q?IEnc8hPxcCSIXchNnvACJRwCGTQ9b7yznOc3Zd0SWI/QY3+hE6MWQhqOa90M?=
 =?us-ascii?Q?Ih9IfGTuv19fpI5YGjQ7SRKGjYgxfmF1kmdz+ZmTi/2QIpdN9WMfw4v6+aNV?=
 =?us-ascii?Q?dXqYDvQQMpsmA5uSI04jjJwjnueK57OOTa7Z7Ob/1xXlUsQ+w5oHjBPOGszG?=
 =?us-ascii?Q?uYv0E7gpDqY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fEGGJNZ2Y8y5f5K1NtXbvrPmM5hTdeVkK+/TFoQGHkLhRHux/hwiNt621pkr?=
 =?us-ascii?Q?+aGwmRC54Kms9NNt4EOgmHABcejS9cuIlTJun4SnB/Eph5BeXKArZIYe55AA?=
 =?us-ascii?Q?KJhnqJ0SqTDegvH2UjKn9wm6PXK9oYr2J4tQHnnhwc6yi8elJziZ+JdrJCeJ?=
 =?us-ascii?Q?EKnFnZPDx2dwMlDq2Z56/qJGpDbwMqzdLdZTLCbIyrz85/o/10mRgwATI1TM?=
 =?us-ascii?Q?x7NkWeiN2zqM2UCteQpS1cKDCOp4rT5lAGYvjYWMkx1HqtC+YCRNMKOCET0g?=
 =?us-ascii?Q?v6FtrsIDGuhmgSZZDTLQ+seT7H3OjFKuY7IzbdEZDenYdDgUorj/LpaQhUz6?=
 =?us-ascii?Q?bIa+5tE9POxWnjcElmE/cMmeBOr9mvKPasBltDlvGxwV5ZCWXHRO8BBgM+Aq?=
 =?us-ascii?Q?yArIkIBgT4ZkYQc7+3EmRCojstZWYyRI3ImAQVBNrLfwkgtxbLMdnM3vIdz7?=
 =?us-ascii?Q?SoxtvLTRPBkiHoD94GhdiSPpLJdEgtAmapyK31/Iin3KIwj/RZfG8cjecouT?=
 =?us-ascii?Q?L6xz/Xl7e+NFTTb3VsYJxxMQsSD0dbO1XB80QUlxqT4ZGCQQiOTz+aquAMB/?=
 =?us-ascii?Q?a4wjd0GlszcJliu+LYDUJW+0eUVrdKLhoEXtkajNzZHj7OgiRhCNwp8ChnI9?=
 =?us-ascii?Q?5TK7enMFA2/fTTu9hJmC9yyVy5M2IjmAFNdWluaH2nt3Fp81Y5D4XXZrNlpn?=
 =?us-ascii?Q?2lCjg4UD890KsZxdlFq3anasLIuGpPN9m3+D7bzZMALEokJpNEQ5eukXHrij?=
 =?us-ascii?Q?ZPjDCF96Z9f4269pomI86m6oQavLyobhJoolSfRZr8zEy1oIR2DvhaHRDoGv?=
 =?us-ascii?Q?I4qXK4Ts4+Ua6MDcxfSbJXsy1O6aZo5tM/TfOk0V9VHBIx4ynlsaKoHxVXRg?=
 =?us-ascii?Q?2wmbP4UTxEUO6uOY2SyP/tUCEv1MRIrKziVxtK4rv94FbgD2MT2C7LiQBuhg?=
 =?us-ascii?Q?v+NZrH1jwTNfe8Kj02Sxyf0IDHXC4OU0sgRJ5dJ/ZhbCwjCQ6BB+yBCgTW51?=
 =?us-ascii?Q?q1VRvnA6BVyrDWpF8eGTfRbz8/L87TZg8rHGuLg3APE0mEEm1ijrQiHi9wfr?=
 =?us-ascii?Q?0LyOadEUm/d/NkC8LpH3dsjxJX5Cwi9832SnQyl7B3DEO4FnLXYwxTGEarD8?=
 =?us-ascii?Q?inzCnBVthS+xLDKZfTqgTrNiNDhnNuz8/ymesv6AZ1gCrT6a9/bZtw82yDBK?=
 =?us-ascii?Q?iO4tA1r6u2KDF/wO8czCZpw2dBzZqu7gteL7J08R4YB6xnbm1LT/pGR3YElv?=
 =?us-ascii?Q?pB/CvvVUUD2AsTQW8hV9b2g/ynpImM3u5CjEN5N32BeqykN4fhWmSX+Nu4nD?=
 =?us-ascii?Q?9Np3ymSKzWwA3EwvuGeQod51hwhghAMsrbf8Ociv9Yo7Z6VdVoQafbmc0KCS?=
 =?us-ascii?Q?6GAQ++18I7zSoKRppDvtbG0d5zpYWaImvYoIscmHz0DEul9pIgXdDi6scSRs?=
 =?us-ascii?Q?ALZM+j5yzWvCZa24WSBXsUaZwJRuNFYdzEKHaIWlSmqr+LByRPHo5nsllRgl?=
 =?us-ascii?Q?X70hL44oN+STIr1pVC66T1vlrE7RIXww0nyuz841Vbj/bgTP7fuxOsc5Tgh4?=
 =?us-ascii?Q?Ubk4KywELtyiNSLbiOoffAwX1mbJAvgGhQIRt6q1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21884df-9ec2-467d-64b0-08dcdc6bd39c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 07:38:05.4467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7DHgnWjy7YRtEvXzhGFhnJ7tn+3oKkhuG9m1sIR6OKOm8I/eq0uZPk1/CY1GP803hEUSoIdodKMyEk88x/pYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881
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

MHDP8546 mailbox access functions will be share to other mhdp driver
and Cadence HDP-TX HDMI/DP PHY drivers.
Create a new mhdp helper driver and move all those functions into.

cdns_mhdp_reg_write() is renamed to cdns_mhdp_dp_reg_write(),
because it use the DPTX command ID DPTX_WRITE_REGISTER.

New cdns_mhdp_reg_write() is created with the general command ID
GENERAL_REGISTER_WRITE.

Rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver,
use cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write()
same as the other mailbox access functions.

Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex
to prevent race conditions in mailbox access by multi drivers.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
v16->v17:
- Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex

v12->v16:
 *No change.

V11->v12:
- Move status initialize out of mbox_mutex.
- Reorder API functions in alphabetical.
- Add notes for malibox access functions.
- Add year 2024 to copyright.

 drivers/gpu/drm/bridge/cadence/Kconfig        |   4 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
 .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 307 +++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 425 ++++--------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  47 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |  36 +-
 include/drm/bridge/cdns-mhdp-helper.h         |  94 ++++
 7 files changed, 507 insertions(+), 407 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
 create mode 100644 include/drm/bridge/cdns-mhdp-helper.h

diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index cced81633ddcd..e0973339e9e33 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -21,6 +21,9 @@ config DRM_CDNS_DSI_J721E
 	  the routing of the DSS DPI signal to the Cadence DSI.
 endif
 
+config CDNS_MHDP_HELPER
+	tristate
+
 config DRM_CDNS_MHDP8546
 	tristate "Cadence DPI/DP bridge"
 	select DRM_DISPLAY_DP_HELPER
@@ -28,6 +31,7 @@ config DRM_CDNS_MHDP8546
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
+	select CDNS_MHDP_HELPER
 	depends on OF
 	help
 	  Support Cadence DPI to DP bridge. This is an internal
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index c95fd5b81d137..087dc074820d7 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 cdns-dsi-y := cdns-dsi-core.o
 cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
+obj-$(CONFIG_CDNS_MHDP_HELPER) += cdns-mhdp-helper.o
 obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
 cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
 cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
new file mode 100644
index 0000000000000..c60a6b69a5343
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
@@ -0,0 +1,307 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, 2024 NXP Semiconductor, Inc.
+ *
+ */
+#include <drm/bridge/cdns-mhdp-helper.h>
+#include <linux/dev_printk.h>
+#include <linux/module.h>
+
+/* Protects mailbox communications with the firmware */
+DEFINE_MUTEX(mhdp_mailbox_mutex);
+
+/* Mailbox helper functions */
+static int cdns_mhdp_mailbox_read(struct cdns_mhdp_base *base)
+{
+	int ret, empty;
+
+	WARN_ON(!mutex_is_locked(&mhdp_mailbox_mutex));
+
+	ret = readx_poll_timeout(readl, base->regs + CDNS_MAILBOX_EMPTY,
+				 empty, !empty, MAILBOX_RETRY_US,
+				 MAILBOX_TIMEOUT_US);
+	if (ret < 0)
+		return ret;
+
+	return readl(base->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
+}
+
+static int cdns_mhdp_mailbox_write(struct cdns_mhdp_base *base, u8 val)
+{
+	int ret, full;
+
+	WARN_ON(!mutex_is_locked(&mhdp_mailbox_mutex));
+
+	ret = readx_poll_timeout(readl, base->regs + CDNS_MAILBOX_FULL,
+				 full, !full, MAILBOX_RETRY_US,
+				 MAILBOX_TIMEOUT_US);
+	if (ret < 0)
+		return ret;
+
+	writel(val, base->regs + CDNS_MAILBOX_TX_DATA);
+
+	return 0;
+}
+
+int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
+				  u8 module_id, u8 opcode,
+				  u16 req_size)
+{
+	u32 mbox_size, i;
+	u8 header[4];
+	int ret;
+
+	/* read the header of the message */
+	for (i = 0; i < sizeof(header); i++) {
+		ret = cdns_mhdp_mailbox_read(base);
+		if (ret < 0)
+			return ret;
+
+		header[i] = ret;
+	}
+
+	mbox_size = get_unaligned_be16(header + 2);
+
+	if (opcode != header[0] || module_id != header[1] ||
+	    req_size != mbox_size) {
+		/*
+		 * If the message in mailbox is not what we want, we need to
+		 * clear the mailbox by reading its contents.
+		 */
+		for (i = 0; i < mbox_size; i++)
+			if (cdns_mhdp_mailbox_read(base) < 0)
+				break;
+
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_recv_header);
+
+int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
+				u8 *buff, u16 buff_size)
+{
+	u32 i;
+	int ret;
+
+	for (i = 0; i < buff_size; i++) {
+		ret = cdns_mhdp_mailbox_read(base);
+		if (ret < 0)
+			return ret;
+
+		buff[i] = ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_recv_data);
+
+int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8 module_id,
+			   u8 opcode, u16 size, u8 *message)
+{
+	u8 header[4];
+	int ret, i;
+
+	header[0] = opcode;
+	header[1] = module_id;
+	put_unaligned_be16(size, header + 2);
+
+	for (i = 0; i < sizeof(header); i++) {
+		ret = cdns_mhdp_mailbox_write(base, header[i]);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < size; i++) {
+		ret = cdns_mhdp_mailbox_write(base, message[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send);
+
+/* General helper functions */
+int cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32 *value)
+{
+	u8 msg[4], resp[8];
+	int ret;
+
+	put_unaligned_be32(addr, msg);
+
+	mutex_lock(&mhdp_mailbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
+				     GENERAL_REGISTER_READ,
+				     sizeof(msg), msg);
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_header(base, MB_MODULE_ID_GENERAL,
+					    GENERAL_REGISTER_READ,
+					    sizeof(resp));
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_data(base, resp, sizeof(resp));
+	if (ret)
+		goto out;
+
+	/* Returned address value should be the same as requested */
+	if (memcmp(msg, resp, sizeof(msg))) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	*value = get_unaligned_be32(resp + 4);
+
+out:
+	mutex_unlock(&mhdp_mailbox_mutex);
+	if (ret) {
+		dev_err(base->dev, "Failed to read register\n");
+		*value = 0;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_reg_read);
+
+int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32 val)
+{
+	u8 msg[8];
+	int ret;
+
+	put_unaligned_be32(addr, msg);
+	put_unaligned_be32(val, msg + 4);
+
+	mutex_lock(&mhdp_mailbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
+				     GENERAL_REGISTER_WRITE,
+				     sizeof(msg), msg);
+
+	mutex_unlock(&mhdp_mailbox_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_reg_write);
+
+/* DPTX helper functions */
+int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr, u32 val)
+{
+	u8 msg[6];
+	int ret;
+
+	put_unaligned_be16(addr, msg);
+	put_unaligned_be32(val, msg + 2);
+
+	mutex_lock(&mhdp_mailbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
+				     DPTX_WRITE_REGISTER, sizeof(msg), msg);
+
+	mutex_unlock(&mhdp_mailbox_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write);
+
+int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16 addr,
+			       u8 start_bit, u8 bits_no, u32 val)
+{
+	u8 field[8];
+	int ret;
+
+	put_unaligned_be16(addr, field);
+	field[2] = start_bit;
+	field[3] = bits_no;
+	put_unaligned_be32(val, field + 4);
+
+	mutex_lock(&mhdp_mailbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
+				     DPTX_WRITE_FIELD, sizeof(field), field);
+
+	mutex_unlock(&mhdp_mailbox_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write_bit);
+
+int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
+			u32 addr, u8 *data, u16 len)
+{
+	u8 msg[5], reg[5];
+	int ret;
+
+	put_unaligned_be16(len, msg);
+	put_unaligned_be24(addr, msg + 2);
+
+	mutex_lock(&mhdp_mailbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
+				     DPTX_READ_DPCD, sizeof(msg), msg);
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_header(base, MB_MODULE_ID_DP_TX,
+					    DPTX_READ_DPCD,
+					    sizeof(reg) + len);
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_data(base, reg, sizeof(reg));
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_data(base, data, len);
+
+out:
+	mutex_unlock(&mhdp_mailbox_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_read);
+
+int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8 value)
+{
+	u8 msg[6], reg[5];
+	int ret;
+
+	put_unaligned_be16(1, msg);
+	put_unaligned_be24(addr, msg + 2);
+	msg[5] = value;
+
+	mutex_lock(&mhdp_mailbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
+				     DPTX_WRITE_DPCD, sizeof(msg), msg);
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_header(base, MB_MODULE_ID_DP_TX,
+					    DPTX_WRITE_DPCD, sizeof(reg));
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_data(base, reg, sizeof(reg));
+	if (ret)
+		goto out;
+
+	if (addr != get_unaligned_be24(reg + 2))
+		ret = -EINVAL;
+
+out:
+	mutex_unlock(&mhdp_mailbox_mutex);
+
+	if (ret)
+		dev_err(base->dev, "dpcd write failed: %d\n", ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_write);
+
+MODULE_DESCRIPTION("Cadence MHDP Helper driver");
+MODULE_AUTHOR("Sandor Yu <Sandor.yu@nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index dee640ab1d3ad..3ceba90a682da 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -73,301 +73,31 @@ static void cdns_mhdp_bridge_hpd_disable(struct drm_bridge *bridge)
 	       mhdp->regs + CDNS_APB_INT_MASK);
 }
 
-static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
-{
-	int ret, empty;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_EMPTY,
-				 empty, !empty, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	return readl(mhdp->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
-}
-
-static int cdns_mhdp_mailbox_write(struct cdns_mhdp_device *mhdp, u8 val)
-{
-	int ret, full;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_FULL,
-				 full, !full, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	writel(val, mhdp->regs + CDNS_MAILBOX_TX_DATA);
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_device *mhdp,
-					 u8 module_id, u8 opcode,
-					 u16 req_size)
-{
-	u32 mbox_size, i;
-	u8 header[4];
-	int ret;
-
-	/* read the header of the message */
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		header[i] = ret;
-	}
-
-	mbox_size = get_unaligned_be16(header + 2);
-
-	if (opcode != header[0] || module_id != header[1] ||
-	    req_size != mbox_size) {
-		/*
-		 * If the message in mailbox is not what we want, we need to
-		 * clear the mailbox by reading its contents.
-		 */
-		for (i = 0; i < mbox_size; i++)
-			if (cdns_mhdp_mailbox_read(mhdp) < 0)
-				break;
-
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_device *mhdp,
-				       u8 *buff, u16 buff_size)
-{
-	u32 i;
-	int ret;
-
-	for (i = 0; i < buff_size; i++) {
-		ret = cdns_mhdp_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		buff[i] = ret;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp, u8 module_id,
-				  u8 opcode, u16 size, u8 *message)
-{
-	u8 header[4];
-	int ret, i;
-
-	header[0] = opcode;
-	header[1] = module_id;
-	put_unaligned_be16(size, header + 2);
-
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, header[i]);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < size; i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, message[i]);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static
-int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr, u32 *value)
-{
-	u8 msg[4], resp[8];
-	int ret;
-
-	put_unaligned_be32(addr, msg);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,
-				     GENERAL_REGISTER_READ,
-				     sizeof(msg), msg);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_GENERAL,
-					    GENERAL_REGISTER_READ,
-					    sizeof(resp));
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, resp, sizeof(resp));
-	if (ret)
-		goto out;
-
-	/* Returned address value should be the same as requested */
-	if (memcmp(msg, resp, sizeof(msg))) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	*value = get_unaligned_be32(resp + 4);
-
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
-	if (ret) {
-		dev_err(mhdp->dev, "Failed to read register\n");
-		*value = 0;
-	}
-
-	return ret;
-}
-
-static
-int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u16 addr, u32 val)
-{
-	u8 msg[6];
-	int ret;
-
-	put_unaligned_be16(addr, msg);
-	put_unaligned_be32(val, msg + 2);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_REGISTER, sizeof(msg), msg);
-
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
-static
-int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
-			    u8 start_bit, u8 bits_no, u32 val)
-{
-	u8 field[8];
-	int ret;
-
-	put_unaligned_be16(addr, field);
-	field[2] = start_bit;
-	field[3] = bits_no;
-	put_unaligned_be32(val, field + 4);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_FIELD, sizeof(field), field);
-
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
-static
-int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
-			u32 addr, u8 *data, u16 len)
-{
-	u8 msg[5], reg[5];
-	int ret;
-
-	put_unaligned_be16(len, msg);
-	put_unaligned_be24(addr, msg + 2);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_READ_DPCD, sizeof(msg), msg);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_READ_DPCD,
-					    sizeof(reg) + len);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, data, len);
-
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
 static
-int cdns_mhdp_dpcd_write(struct cdns_mhdp_device *mhdp, u32 addr, u8 value)
+int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool enable)
 {
-	u8 msg[6], reg[5];
+	u8 status;
 	int ret;
 
-	put_unaligned_be16(1, msg);
-	put_unaligned_be24(addr, msg + 2);
-	msg[5] = value;
-
-	mutex_lock(&mhdp->mbox_mutex);
+	status = enable ? FW_ACTIVE : FW_STANDBY;
 
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_DPCD, sizeof(msg), msg);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_WRITE_DPCD, sizeof(reg));
-	if (ret)
-		goto out;
+	mutex_lock(&mhdp_mailbox_mutex);
 
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
+	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_GENERAL,
+				     GENERAL_MAIN_CONTROL, sizeof(status), &status);
 	if (ret)
 		goto out;
 
-	if (addr != get_unaligned_be24(reg + 2))
-		ret = -EINVAL;
-
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	if (ret)
-		dev_err(mhdp->dev, "dpcd write failed: %d\n", ret);
-	return ret;
-}
-
-static
-int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool enable)
-{
-	u8 msg[5];
-	int ret, i;
-
-	msg[0] = GENERAL_MAIN_CONTROL;
-	msg[1] = MB_MODULE_ID_GENERAL;
-	msg[2] = 0;
-	msg[3] = 1;
-	msg[4] = enable ? FW_ACTIVE : FW_STANDBY;
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	for (i = 0; i < sizeof(msg); i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, msg[i]);
-		if (ret)
-			goto out;
-	}
-
-	/* read the firmware state */
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, msg, sizeof(msg));
+	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_GENERAL,
+					    GENERAL_MAIN_CONTROL,
+					    sizeof(status));
 	if (ret)
 		goto out;
 
-	ret = 0;
+	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, &status, sizeof(status));
 
 out:
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	if (ret < 0)
 		dev_err(mhdp->dev, "set firmware active failed\n");
@@ -380,24 +110,24 @@ int cdns_mhdp_get_hpd_status(struct cdns_mhdp_device *mhdp)
 	u8 status;
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
+	mutex_lock(&mhdp_mailbox_mutex);
 
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
 				     DPTX_HPD_STATE, 0, NULL);
 	if (ret)
 		goto err_get_hpd;
 
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
+	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
 					    DPTX_HPD_STATE,
 					    sizeof(status));
 	if (ret)
 		goto err_get_hpd;
 
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, &status, sizeof(status));
+	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, &status, sizeof(status));
 	if (ret)
 		goto err_get_hpd;
 
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	dev_dbg(mhdp->dev, "%s: HPD %splugged\n", __func__,
 		status ? "" : "un");
@@ -405,7 +135,7 @@ int cdns_mhdp_get_hpd_status(struct cdns_mhdp_device *mhdp)
 	return status;
 
 err_get_hpd:
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	return ret;
 }
@@ -418,28 +148,28 @@ int cdns_mhdp_get_edid_block(void *data, u8 *edid,
 	u8 msg[2], reg[2], i;
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
+	mutex_lock(&mhdp_mailbox_mutex);
 
 	for (i = 0; i < 4; i++) {
 		msg[0] = block / 2;
 		msg[1] = block % 2;
 
-		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+		ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
 					     DPTX_GET_EDID, sizeof(msg), msg);
 		if (ret)
 			continue;
 
-		ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
+		ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
 						    DPTX_GET_EDID,
 						    sizeof(reg) + length);
 		if (ret)
 			continue;
 
-		ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
+		ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, reg, sizeof(reg));
 		if (ret)
 			continue;
 
-		ret = cdns_mhdp_mailbox_recv_data(mhdp, edid, length);
+		ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, edid, length);
 		if (ret)
 			continue;
 
@@ -447,7 +177,7 @@ int cdns_mhdp_get_edid_block(void *data, u8 *edid,
 			break;
 	}
 
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	if (ret)
 		dev_err(mhdp->dev, "get block[%d] edid failed: %d\n",
@@ -462,21 +192,21 @@ int cdns_mhdp_read_hpd_event(struct cdns_mhdp_device *mhdp)
 	u8 event = 0;
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
+	mutex_lock(&mhdp_mailbox_mutex);
 
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
 				     DPTX_READ_EVENT, 0, NULL);
 	if (ret)
 		goto out;
 
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
+	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
 					    DPTX_READ_EVENT, sizeof(event));
 	if (ret < 0)
 		goto out;
 
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, &event, sizeof(event));
+	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, &event, sizeof(event));
 out:
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	if (ret < 0)
 		return ret;
@@ -510,22 +240,22 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp, unsigned int nlanes,
 	put_unaligned_be16(udelay, payload + 1);
 	memcpy(payload + 3, lanes_data, nlanes);
 
-	mutex_lock(&mhdp->mbox_mutex);
+	mutex_lock(&mhdp_mailbox_mutex);
 
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
 				     DPTX_ADJUST_LT,
 				     sizeof(payload), payload);
 	if (ret)
 		goto out;
 
 	/* Yes, read the DPCD read command response */
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
+	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
 					    DPTX_READ_DPCD,
 					    sizeof(hdr) + DP_LINK_STATUS_SIZE);
 	if (ret)
 		goto out;
 
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, hdr, sizeof(hdr));
+	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, hdr, sizeof(hdr));
 	if (ret)
 		goto out;
 
@@ -533,11 +263,11 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp, unsigned int nlanes,
 	if (addr != DP_LANE0_1_STATUS)
 		goto out;
 
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, link_status,
+	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, link_status,
 					  DP_LINK_STATUS_SIZE);
 
 out:
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	if (ret)
 		dev_err(mhdp->dev, "Failed to adjust Link Training.\n");
@@ -847,7 +577,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 		unsigned int i;
 
 		for (i = 0; i < msg->size; ++i) {
-			ret = cdns_mhdp_dpcd_write(mhdp,
+			ret = cdns_mhdp_dpcd_write(&mhdp->base,
 						   msg->address + i, buf[i]);
 			if (!ret)
 				continue;
@@ -859,7 +589,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 			return ret;
 		}
 	} else {
-		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
+		ret = cdns_mhdp_dpcd_read(&mhdp->base, msg->address,
 					  msg->buffer, msg->size);
 		if (ret) {
 			dev_err(mhdp->dev,
@@ -887,12 +617,12 @@ static int cdns_mhdp_link_training_init(struct cdns_mhdp_device *mhdp)
 	if (!mhdp->host.scrambler)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_ENHNCD,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_ENHNCD,
 			    mhdp->sink.enhanced & mhdp->host.enhanced);
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_LANE_EN,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_LANE_EN,
 			    CDNS_DP_LANE_EN_LANES(mhdp->link.num_lanes));
 
 	cdns_mhdp_link_configure(&mhdp->aux, &mhdp->link);
@@ -913,7 +643,7 @@ static int cdns_mhdp_link_training_init(struct cdns_mhdp_device *mhdp)
 		return ret;
 	}
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG,
 			    CDNS_PHY_COMMON_CONFIG |
 			    CDNS_PHY_TRAINING_EN |
 			    CDNS_PHY_TRAINING_TYPE(1) |
@@ -1058,7 +788,7 @@ static bool cdns_mhdp_link_training_channel_eq(struct cdns_mhdp_device *mhdp,
 		CDNS_PHY_TRAINING_TYPE(eq_tps);
 	if (eq_tps != 4)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
 	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
 			   (eq_tps != 4) ? eq_tps | DP_LINK_SCRAMBLING_DISABLE :
@@ -1322,7 +1052,7 @@ static int cdns_mhdp_link_training(struct cdns_mhdp_device *mhdp,
 			   mhdp->host.scrambler ? 0 :
 			   DP_LINK_SCRAMBLING_DISABLE);
 
-	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &reg32);
+	ret = cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &reg32);
 	if (ret < 0) {
 		dev_err(mhdp->dev,
 			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG %d\n",
@@ -1333,13 +1063,13 @@ static int cdns_mhdp_link_training(struct cdns_mhdp_device *mhdp,
 	reg32 |= CDNS_DP_NUM_LANES(mhdp->link.num_lanes);
 	reg32 |= CDNS_DP_WR_FAILING_EDGE_VSYNC;
 	reg32 |= CDNS_DP_FRAMER_EN;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, reg32);
 
 	/* Reset PHY config */
 	reg32 = CDNS_PHY_COMMON_CONFIG | CDNS_PHY_TRAINING_TYPE(1);
 	if (!mhdp->host.scrambler)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
 	return 0;
 err:
@@ -1347,7 +1077,7 @@ static int cdns_mhdp_link_training(struct cdns_mhdp_device *mhdp,
 	reg32 = CDNS_PHY_COMMON_CONFIG | CDNS_PHY_TRAINING_TYPE(1);
 	if (!mhdp->host.scrambler)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
 	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
 			   DP_TRAINING_PATTERN_DISABLE);
@@ -1461,7 +1191,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 	mhdp->link.num_lanes = cdns_mhdp_max_num_lanes(mhdp);
 
 	/* Disable framer for link training */
-	err = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
+	err = cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
 	if (err < 0) {
 		dev_err(mhdp->dev,
 			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG %d\n",
@@ -1470,7 +1200,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 	}
 
 	resp &= ~CDNS_DP_FRAMER_EN;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
 
 	/* Spread AMP if required, enable 8b/10b coding */
 	amp[0] = cdns_mhdp_get_ssc_supported(mhdp) ? DP_SPREAD_AMP_0_5 : 0;
@@ -1834,7 +1564,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		bnd_hsync2vsync |= CDNS_IP_DET_INTERLACE_FORMAT;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_BND_HSYNC2VSYNC(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_BND_HSYNC2VSYNC(stream_id),
 			    bnd_hsync2vsync);
 
 	hsync2vsync_pol_ctrl = 0;
@@ -1842,10 +1572,10 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 		hsync2vsync_pol_ctrl |= CDNS_H2V_HSYNC_POL_ACTIVE_LOW;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		hsync2vsync_pol_ctrl |= CDNS_H2V_VSYNC_POL_ACTIVE_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_HSYNC2VSYNC_POL_CTRL(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_HSYNC2VSYNC_POL_CTRL(stream_id),
 			    hsync2vsync_pol_ctrl);
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_PXL_REPR(stream_id), pxl_repr);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_PXL_REPR(stream_id), pxl_repr);
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		dp_framer_sp |= CDNS_DP_FRAMER_INTERLACE;
@@ -1853,19 +1583,19 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 		dp_framer_sp |= CDNS_DP_FRAMER_HSYNC_POL_LOW;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		dp_framer_sp |= CDNS_DP_FRAMER_VSYNC_POL_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_SP(stream_id), dp_framer_sp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_SP(stream_id), dp_framer_sp);
 
 	front_porch = mode->crtc_hsync_start - mode->crtc_hdisplay;
 	back_porch = mode->crtc_htotal - mode->crtc_hsync_end;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRONT_BACK_PORCH(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRONT_BACK_PORCH(stream_id),
 			    CDNS_DP_FRONT_PORCH(front_porch) |
 			    CDNS_DP_BACK_PORCH(back_porch));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_BYTE_COUNT(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_BYTE_COUNT(stream_id),
 			    mode->crtc_hdisplay * bpp / 8);
 
 	msa_h0 = mode->crtc_htotal - mode->crtc_hsync_start;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_HORIZONTAL_0(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_HORIZONTAL_0(stream_id),
 			    CDNS_DP_MSAH0_H_TOTAL(mode->crtc_htotal) |
 			    CDNS_DP_MSAH0_HSYNC_START(msa_h0));
 
@@ -1874,11 +1604,11 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 			   CDNS_DP_MSAH1_HDISP_WIDTH(mode->crtc_hdisplay);
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
 		msa_horizontal_1 |= CDNS_DP_MSAH1_HSYNC_POL_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_HORIZONTAL_1(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_HORIZONTAL_1(stream_id),
 			    msa_horizontal_1);
 
 	msa_v0 = mode->crtc_vtotal - mode->crtc_vsync_start;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_VERTICAL_0(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_VERTICAL_0(stream_id),
 			    CDNS_DP_MSAV0_V_TOTAL(mode->crtc_vtotal) |
 			    CDNS_DP_MSAV0_VSYNC_START(msa_v0));
 
@@ -1887,7 +1617,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 			 CDNS_DP_MSAV1_VDISP_WIDTH(mode->crtc_vdisplay);
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		msa_vertical_1 |= CDNS_DP_MSAV1_VSYNC_POL_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_VERTICAL_1(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_VERTICAL_1(stream_id),
 			    msa_vertical_1);
 
 	if ((mode->flags & DRM_MODE_FLAG_INTERLACE) &&
@@ -1899,14 +1629,14 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	if (pxlfmt == DRM_COLOR_FORMAT_YCBCR420)
 		misc1 = CDNS_DP_TEST_VSC_SDP;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_MISC(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_MISC(stream_id),
 			    misc0 | (misc1 << 8));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_HORIZONTAL(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_HORIZONTAL(stream_id),
 			    CDNS_DP_H_HSYNC_WIDTH(hsync) |
 			    CDNS_DP_H_H_TOTAL(mode->crtc_hdisplay));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_VERTICAL_0(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_VERTICAL_0(stream_id),
 			    CDNS_DP_V0_VHEIGHT(mode->crtc_vdisplay) |
 			    CDNS_DP_V0_VSTART(msa_v0));
 
@@ -1915,13 +1645,13 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	    mode->crtc_vtotal % 2 == 0)
 		dp_vertical_1 |= CDNS_DP_V1_VTOTAL_EVEN;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_VERTICAL_1(stream_id), dp_vertical_1);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_VERTICAL_1(stream_id), dp_vertical_1);
 
-	cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_VB_ID(stream_id), 2, 1,
-				(mode->flags & DRM_MODE_FLAG_INTERLACE) ?
-				CDNS_DP_VB_ID_INTERLACED : 0);
+	cdns_mhdp_dp_reg_write_bit(&mhdp->base, CDNS_DP_VB_ID(stream_id), 2, 1,
+				   (mode->flags & DRM_MODE_FLAG_INTERLACE) ?
+				   CDNS_DP_VB_ID_INTERLACED : 0);
 
-	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &framer);
+	ret = cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &framer);
 	if (ret < 0) {
 		dev_err(mhdp->dev,
 			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG %d\n",
@@ -1930,7 +1660,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	}
 	framer |= CDNS_DP_FRAMER_EN;
 	framer &= ~CDNS_DP_NO_VIDEO_MODE;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
 }
 
 static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
@@ -1963,15 +1693,15 @@ static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
 
 	mhdp->stream_id = 0;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_TU,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_TU,
 			    CDNS_DP_FRAMER_TU_VS(vs) |
 			    CDNS_DP_FRAMER_TU_SIZE(tu_size) |
 			    CDNS_DP_FRAMER_TU_CNT_RST_EN);
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_LINE_THRESH(0),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_LINE_THRESH(0),
 			    line_thresh & GENMASK(5, 0));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_STREAM_CONFIG_2(0),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_STREAM_CONFIG_2(0),
 			    CDNS_DP_SC2_TU_VS_DIFF((tu_size - vs > 3) ?
 						   0 : tu_size - vs));
 
@@ -2006,13 +1736,13 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 		mhdp->info->ops->enable(mhdp);
 
 	/* Enable VIF clock for stream 0 */
-	ret = cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
+	ret = cdns_mhdp_reg_read(&mhdp->base, CDNS_DPTX_CAR, &resp);
 	if (ret < 0) {
 		dev_err(mhdp->dev, "Failed to read CDNS_DPTX_CAR %d\n", ret);
 		goto out;
 	}
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_CAR,
 			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
 
 	connector = drm_atomic_get_new_connector_for_encoder(state,
@@ -2083,16 +1813,16 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 		cdns_mhdp_hdcp_disable(mhdp);
 
 	mhdp->bridge_enabled = false;
-	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
+	cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
 	resp &= ~CDNS_DP_FRAMER_EN;
 	resp |= CDNS_DP_NO_VIDEO_MODE;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
 
 	cdns_mhdp_link_down(mhdp);
 
 	/* Disable VIF clock for stream 0 */
-	cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
+	cdns_mhdp_reg_read(&mhdp->base, CDNS_DPTX_CAR, &resp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_CAR,
 			    resp & ~(CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN));
 
 	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
@@ -2471,7 +2201,6 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	mhdp->clk = clk;
 	mhdp->dev = dev;
-	mutex_init(&mhdp->mbox_mutex);
 	mutex_init(&mhdp->link_mutex);
 	spin_lock_init(&mhdp->start_lock);
 
@@ -2502,6 +2231,10 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mhdp);
 
+	/* init base struct for access mailbox  */
+	mhdp->base.dev = mhdp->dev;
+	mhdp->base.regs = mhdp->regs;
+
 	mhdp->info = of_device_get_match_data(dev);
 
 	clk_prepare_enable(clk);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bad2fc0c73066..d209c7b3bbfab 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -15,6 +15,7 @@
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 
+#include <drm/bridge/cdns-mhdp-helper.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
@@ -27,10 +28,6 @@ struct phy;
 #define CDNS_APB_CTRL				0x00000
 #define CDNS_CPU_STALL				BIT(3)
 
-#define CDNS_MAILBOX_FULL			0x00008
-#define CDNS_MAILBOX_EMPTY			0x0000c
-#define CDNS_MAILBOX_TX_DATA			0x00010
-#define CDNS_MAILBOX_RX_DATA			0x00014
 #define CDNS_KEEP_ALIVE				0x00018
 #define CDNS_KEEP_ALIVE_MASK			GENMASK(7, 0)
 
@@ -198,45 +195,10 @@ struct phy;
 #define CDNS_DP_BYTE_COUNT(s)			(CDNS_DPTX_STREAM(s) + 0x7c)
 #define CDNS_DP_BYTE_COUNT_BYTES_IN_CHUNK_SHIFT	16
 
-/* mailbox */
-#define MAILBOX_RETRY_US			1000
-#define MAILBOX_TIMEOUT_US			2000000
-
-#define MB_OPCODE_ID				0
-#define MB_MODULE_ID				1
-#define MB_SIZE_MSB_ID				2
-#define MB_SIZE_LSB_ID				3
-#define MB_DATA_ID				4
-
-#define MB_MODULE_ID_DP_TX			0x01
-#define MB_MODULE_ID_HDCP_TX			0x07
-#define MB_MODULE_ID_HDCP_RX			0x08
-#define MB_MODULE_ID_HDCP_GENERAL		0x09
-#define MB_MODULE_ID_GENERAL			0x0a
-
-/* firmware and opcodes */
+/* firmware */
 #define FW_NAME					"cadence/mhdp8546.bin"
 #define CDNS_MHDP_IMEM				0x10000
 
-#define GENERAL_MAIN_CONTROL			0x01
-#define GENERAL_TEST_ECHO			0x02
-#define GENERAL_BUS_SETTINGS			0x03
-#define GENERAL_TEST_ACCESS			0x04
-#define GENERAL_REGISTER_READ			0x07
-
-#define DPTX_SET_POWER_MNG			0x00
-#define DPTX_GET_EDID				0x02
-#define DPTX_READ_DPCD				0x03
-#define DPTX_WRITE_DPCD				0x04
-#define DPTX_ENABLE_EVENT			0x05
-#define DPTX_WRITE_REGISTER			0x06
-#define DPTX_READ_REGISTER			0x07
-#define DPTX_WRITE_FIELD			0x08
-#define DPTX_READ_EVENT				0x0a
-#define DPTX_GET_LAST_AUX_STAUS			0x0e
-#define DPTX_HPD_STATE				0x11
-#define DPTX_ADJUST_LT				0x12
-
 #define FW_STANDBY				0
 #define FW_ACTIVE				1
 
@@ -352,6 +314,8 @@ struct cdns_mhdp_hdcp {
 };
 
 struct cdns_mhdp_device {
+	struct cdns_mhdp_base base;
+
 	void __iomem *regs;
 	void __iomem *sapb_regs;
 	void __iomem *j721e_regs;
@@ -362,9 +326,6 @@ struct cdns_mhdp_device {
 
 	const struct cdns_mhdp_platform_info *info;
 
-	/* This is to protect mailbox communications with the firmware */
-	struct mutex mbox_mutex;
-
 	/*
 	 * "link_mutex" protects the access to all the link parameters
 	 * including the link training process. Link training will be
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
index 5e3b8edcf7948..21164ff78be23 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -19,7 +19,7 @@ static int cdns_mhdp_secure_mailbox_read(struct cdns_mhdp_device *mhdp)
 {
 	int ret, empty;
 
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
+	WARN_ON(!mutex_is_locked(&mhdp_mailbox_mutex));
 
 	ret = readx_poll_timeout(readl, mhdp->sapb_regs + CDNS_MAILBOX_EMPTY,
 				 empty, !empty, MAILBOX_RETRY_US,
@@ -35,7 +35,7 @@ static int cdns_mhdp_secure_mailbox_write(struct cdns_mhdp_device *mhdp,
 {
 	int ret, full;
 
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
+	WARN_ON(!mutex_is_locked(&mhdp_mailbox_mutex));
 
 	ret = readx_poll_timeout(readl, mhdp->sapb_regs + CDNS_MAILBOX_FULL,
 				 full, !full, MAILBOX_RETRY_US,
@@ -131,7 +131,7 @@ static int cdns_mhdp_hdcp_get_status(struct cdns_mhdp_device *mhdp,
 	u8 hdcp_status[HDCP_STATUS_SIZE];
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
+	mutex_lock(&mhdp_mailbox_mutex);
 	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
 					    HDCP_TRAN_STATUS_CHANGE, 0, NULL);
 	if (ret)
@@ -151,7 +151,7 @@ static int cdns_mhdp_hdcp_get_status(struct cdns_mhdp_device *mhdp,
 	*hdcp_port_status = ((u16)(hdcp_status[0] << 8) | hdcp_status[1]);
 
 err_get_hdcp_status:
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	return ret;
 }
@@ -172,11 +172,11 @@ static int cdns_mhdp_hdcp_rx_id_valid_response(struct cdns_mhdp_device *mhdp,
 {
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
+	mutex_lock(&mhdp_mailbox_mutex);
 	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
 					    HDCP_TRAN_RESPOND_RECEIVER_ID_VALID,
 					    1, &valid);
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	return ret;
 }
@@ -188,7 +188,7 @@ static int cdns_mhdp_hdcp_rx_id_valid(struct cdns_mhdp_device *mhdp,
 	u8 status;
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
+	mutex_lock(&mhdp_mailbox_mutex);
 	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
 					    HDCP_TRAN_IS_REC_ID_VALID, 0, NULL);
 	if (ret)
@@ -209,7 +209,7 @@ static int cdns_mhdp_hdcp_rx_id_valid(struct cdns_mhdp_device *mhdp,
 	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, hdcp_rx_id, 5 * *recv_num);
 
 err_rx_id_valid:
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	return ret;
 }
@@ -219,10 +219,10 @@ static int cdns_mhdp_hdcp_km_stored_resp(struct cdns_mhdp_device *mhdp,
 {
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
+	mutex_lock(&mhdp_mailbox_mutex);
 	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
 					    HDCP2X_TX_RESPOND_KM, size, km);
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	return ret;
 }
@@ -232,7 +232,7 @@ static int cdns_mhdp_hdcp_tx_is_km_stored(struct cdns_mhdp_device *mhdp,
 {
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
+	mutex_lock(&mhdp_mailbox_mutex);
 	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
 					    HDCP2X_TX_IS_KM_STORED, 0, NULL);
 	if (ret)
@@ -246,7 +246,7 @@ static int cdns_mhdp_hdcp_tx_is_km_stored(struct cdns_mhdp_device *mhdp,
 
 	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, resp, size);
 err_is_km_stored:
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	return ret;
 }
@@ -256,10 +256,10 @@ static int cdns_mhdp_hdcp_tx_config(struct cdns_mhdp_device *mhdp,
 {
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
+	mutex_lock(&mhdp_mailbox_mutex);
 	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
 					    HDCP_TRAN_CONFIGURATION, 1, &hdcp_cfg);
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	return ret;
 }
@@ -504,11 +504,11 @@ int cdns_mhdp_hdcp_set_lc(struct cdns_mhdp_device *mhdp, u8 *val)
 {
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
+	mutex_lock(&mhdp_mailbox_mutex);
 	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_GENERAL,
 					    HDCP_GENERAL_SET_LC_128,
 					    16, val);
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	return ret;
 }
@@ -519,11 +519,11 @@ cdns_mhdp_hdcp_set_public_key_param(struct cdns_mhdp_device *mhdp,
 {
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
+	mutex_lock(&mhdp_mailbox_mutex);
 	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
 					    HDCP2X_TX_SET_PUBLIC_KEY_PARAMS,
 					    sizeof(*val), (u8 *)val);
-	mutex_unlock(&mhdp->mbox_mutex);
+	mutex_unlock(&mhdp_mailbox_mutex);
 
 	return ret;
 }
diff --git a/include/drm/bridge/cdns-mhdp-helper.h b/include/drm/bridge/cdns-mhdp-helper.h
new file mode 100644
index 0000000000000..a0727cbbace55
--- /dev/null
+++ b/include/drm/bridge/cdns-mhdp-helper.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023-2024 NXP Semiconductor, Inc.
+ */
+#ifndef __CDNS_MHDP_HELPER_H__
+#define __CDNS_MHDP_HELPER_H__
+
+#include <asm/unaligned.h>
+#include <linux/iopoll.h>
+
+/* mailbox regs offset */
+#define CDNS_MAILBOX_FULL			0x00008
+#define CDNS_MAILBOX_EMPTY			0x0000c
+#define CDNS_MAILBOX_TX_DATA			0x00010
+#define CDNS_MAILBOX_RX_DATA			0x00014
+
+#define MAILBOX_RETRY_US			1000
+#define MAILBOX_TIMEOUT_US			2000000
+
+/* Module ID Code */
+#define MB_MODULE_ID_DP_TX			0x01
+#define MB_MODULE_ID_HDMI_TX			0x03
+#define MB_MODULE_ID_HDCP_TX			0x07
+#define MB_MODULE_ID_HDCP_RX			0x08
+#define MB_MODULE_ID_HDCP_GENERAL		0x09
+#define MB_MODULE_ID_GENERAL			0x0A
+
+/* General Commands */
+#define GENERAL_MAIN_CONTROL			0x01
+#define GENERAL_TEST_ECHO			0x02
+#define GENERAL_BUS_SETTINGS			0x03
+#define GENERAL_TEST_ACCESS			0x04
+#define GENERAL_REGISTER_WRITE			0x05
+#define GENERAL_WRITE_FIELD			0x06
+#define GENERAL_REGISTER_READ			0x07
+#define GENERAL_GET_HPD_STATE			0x11
+
+/* DPTX Commands */
+#define DPTX_SET_POWER_MNG			0x00
+#define DPTX_SET_HOST_CAPABILITIES		0x01
+#define DPTX_GET_EDID				0x02
+#define DPTX_READ_DPCD				0x03
+#define DPTX_WRITE_DPCD				0x04
+#define DPTX_ENABLE_EVENT			0x05
+#define DPTX_WRITE_REGISTER			0x06
+#define DPTX_READ_REGISTER			0x07
+#define DPTX_WRITE_FIELD			0x08
+#define DPTX_TRAINING_CONTROL			0x09
+#define DPTX_READ_EVENT				0x0a
+#define DPTX_READ_LINK_STAT			0x0b
+#define DPTX_SET_VIDEO				0x0c
+#define DPTX_SET_AUDIO				0x0d
+#define DPTX_GET_LAST_AUX_STAUS			0x0e
+#define DPTX_SET_LINK_BREAK_POINT		0x0f
+#define DPTX_FORCE_LANES			0x10
+#define DPTX_HPD_STATE				0x11
+#define DPTX_ADJUST_LT				0x12
+
+/* HDMI TX Commands */
+#define HDMI_TX_READ				0x00
+#define HDMI_TX_WRITE				0x01
+#define HDMI_TX_UPDATE_READ			0x02
+#define HDMI_TX_EDID				0x03
+#define HDMI_TX_EVENTS				0x04
+#define HDMI_TX_HPD_STATUS			0x05
+
+extern struct mutex mhdp_mailbox_mutex;
+
+struct cdns_mhdp_base {
+	struct device *dev;
+	void __iomem *regs;
+};
+
+/* Mailbox helper functions */
+int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
+				u8 *buff, u16 buff_size);
+int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
+				  u8 module_id, u8 opcode, u16 req_size);
+int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8 module_id,
+			   u8 opcode, u16 size, u8 *message);
+
+/* General commands helper functions */
+int cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32 *value);
+int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32 val);
+
+/* DPTX commands helper functions */
+int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr, u32 val);
+int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16 addr,
+			       u8 start_bit, u8 bits_no, u32 val);
+int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
+			u32 addr, u8 *data, u16 len);
+int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8 value);
+
+#endif /* __CDNS_MHDP_HELPER_H__ */
-- 
2.34.1

