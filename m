Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F093AEF0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F54110E65B;
	Wed, 24 Jul 2024 09:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SkND8KSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A37910E660
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhtLyMBN7U/ce6gf4N8G0iNBza7fgNTLRnat6c2okfrH1J/i2IiXe4yASF0wD0/U8OI3+TbX/PEJcPnOQx0FPbnCvjM22vBQ1lQC3HC2LphVnbe4IhZcMN8EaqNz14RC/LMjpJMlc5QZ+VNrfQ/UDaxk+TzTM06DXK74iFLo1vdQ7zXjknsU/TI4I671TrqHwwcKkE+rI3G0enjwd7MoXU7W3uMK3zvafvf1OrCh3z9yKSFZMBQL0RmSKmAyebGDNCWRBRKA0Sg213iyHwSF6gz1xSQkKjq7Sbl7VXyRNbwjigQy8sRz4HchQEqsgaqPC2rUJKwCT4OYb121+q+u0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp8V5ZO/fCGgzj20rRKm3TZRDHYG/x5FoWpPt2SERcE=;
 b=GAbok8zN5HDSucEr7ILVwCHdg1+Ks0gT1cjA7Nb6Sq+aOC/ZtyIVWxemn/v0/ZBCXnIMtryffJFeso7roKF2FIEZsN8kCzgtDqVqAorfXK5KzBhHRjo3H3x2Z4VjSdm95YnnswF22ZJyk/CYuMUZ+CVLAcMH2y0rBPDxjLUcoGafv5norX1pxusO8AQ5kqX9U/Pm+IFd382cLqSfbVl+fYPhM2TdJYnfDQW4pRQtupkJkA30GnBHrcggKu6T8K9lfHoisDPo+MNpEKLZM4w/6M+w3nA2+q3qtkyV7aLiF+YwiZDW9pyb0ZWuC2WpQ32o9fY4evGPaqp/WOSU0rkvzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vp8V5ZO/fCGgzj20rRKm3TZRDHYG/x5FoWpPt2SERcE=;
 b=SkND8KSRZss6sIv5c43N8EGNWmgF0UIzOegUblh+2rKxiXRdi7TaJa+HNKD/eNCcCRXBVsBO7R7EyVxiOxUfY3J9vivhjpIx8YrbnKO8LKZHXW+eI7y2ZPbjIiHwQL9EQITak7VRTYzvesrEdczg0WBmAIDNRXfMK7On9jhfRtrpj7NqrSVIDodT8TRWpdgRWdzixR3GNH2uf7Ah4HvdNTNVNpv2/wS3HleInaINpWJGut/qd0flrb2W4EkjIKA+bdvw11KRjLGvBlxnG07M+HWNAHrww1kVK+uE6aLVfv8ggCHg+GkRbUMVnlNNQG4Uy+D57cRo7kaQG0yQi1hNUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 09:22:34 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:22:33 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [PATCH v3 13/19] MAINTAINERS: Add maintainer for i.MX8qxp Display
 Controller
Date: Wed, 24 Jul 2024 17:29:44 +0800
Message-Id: <20240724092950.752536-14-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240724092950.752536-1-victor.liu@nxp.com>
References: <20240724092950.752536-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: f72cf498-e43c-48f7-d21c-08dcabc2265f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Al7oiawGJf5trzV7zStpH+qBxDabW6TIFnNHg4G21aYWyjTMeqoiwEUPzeRv?=
 =?us-ascii?Q?BZLMHGRQfc55o6PzFzRvPNatASXFG9aMWojclXttmsd1J8e4C6N7ygZxxItM?=
 =?us-ascii?Q?KA5/sHXJHwuJZNHQdhbQMZeKMH8DG+NCHCMdR63UCM2BtDhtoEYM/ZtxySoP?=
 =?us-ascii?Q?Kz2c4CniJ9QSr3ROXbKO4vqc0kcQhfGW/kwVXWyQUW3H55m/5PfqtHeQDpwm?=
 =?us-ascii?Q?04gYjLNjmFNMZa+8t9nZhTuSgOsAkiOfkCEKW5amDXzq+nrfbPAAeXZn/rPJ?=
 =?us-ascii?Q?xiTXwaXaEuTnW7YBYU2KjU+oXzeXhmV5uCNHwkF19+8HTzJhF5OZKxSSzUKT?=
 =?us-ascii?Q?uzRI8C9Nne3IkOL+82k/TXgl/wORUcvDVpJI0kRG1W5zn4hETq1L7sVBHw8p?=
 =?us-ascii?Q?hdYnkMto3hq7ukgZg8ULN6DZK3bCXkecF6MVKPZ6UmU/tNaXXPVvRNnhn+Oa?=
 =?us-ascii?Q?BhVcl+k/ddUo90Vg2QuMrxrYX4WJsua3k55uJBQiMjcYuiYw7eR3GzGBJinY?=
 =?us-ascii?Q?y04Au5sKrBt/bQ0uWFKu1Cp9S1jW2OwWEo5cnxm/SdWhRSWHT222zKROzftR?=
 =?us-ascii?Q?W1fow8ZlSuSZYexzNkGCMBrqy4sBNKsWmFO990MyalBhK8ZgkR3EW72lJjpX?=
 =?us-ascii?Q?HymmHtjIHGo/TpNpc/CcBKWaBJT/uCeVJQ3nzrqVOAjyobwY88RemffYF55O?=
 =?us-ascii?Q?jQsmB7AaSF2TBjBD2Qju+nHXcGUe+GYjnnRX7uFiSK4hOJskOUy7DKyA23nw?=
 =?us-ascii?Q?egFdYVccOLlLr1zRpimDfcs3Dm9ArPC+cGD5wmUqfyrRvTMDn2xIa4SoMK48?=
 =?us-ascii?Q?svvzW/K4QJW5HTtuthGXubl6XIgojlW4XwO10uE8dOATRt6DmQpxzTRPhabi?=
 =?us-ascii?Q?3NNiW62buuowBt5RWSaxm2N30jvitieOdE6Bu39PfH2iWby7v9DEgBQ4fz+u?=
 =?us-ascii?Q?zQ5ZvPzJw+du/9a3QDaqCkC4/SRwYiPwM/mipHXSdFriP//oRVSp8RqD+gkQ?=
 =?us-ascii?Q?CmDe2MNHn+AtB+8JS86FSsL9/DkX0Hy3pHRQ9B5D2wNoUvZb/CFURjACUxy5?=
 =?us-ascii?Q?KbhhofgvtE2eKUJZ+lZAeB7VDiv3Ept10gwFnsq+oMRpvIMEO3mXbSu/CFEX?=
 =?us-ascii?Q?Mes0gzkXVWLXbTrK2co4jVUJ0WLNaMDCe/ziGtM+84wcRISpJ2l4x3WgH3Zb?=
 =?us-ascii?Q?9G3yqd4EBZc00NzE7K3daUypv6wW/4gAjq8ODPA6G2sRJ+ASCTl52YstSgaf?=
 =?us-ascii?Q?09f1VpEVtQpq3RoWLDj83EGtz5T8TcAd2LKR1HZHDNTs3jkQNlUi9HGLovDu?=
 =?us-ascii?Q?ZHyTDh0vP1UNINmmqUE8LUH/JD43nieb3yneN8OR1EAZqSiqOOJpFcvi9TOg?=
 =?us-ascii?Q?5E1eBFY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CPPUWeJhb8rDP1gF1Ovrvn0e3NyaNRQrILNRSonyP6O6ynqGr8mblMvVBC2E?=
 =?us-ascii?Q?cwV3UiYR1lOlbC8e6rtKDiO9bjOlIYMUntLG6A0IsI/MN7+ajHXj9nLa58bh?=
 =?us-ascii?Q?AhOMwQk+7KIZWbaYA/Wi2ErmZiBqDMu7FWArP7I2RYRKHjs9cs/YdxdN4B1F?=
 =?us-ascii?Q?5xyQvhNSjBItJuFOdxCQzsG+v6wbikCDbfLUJpH7K/s14PY65T2zQtpocNb0?=
 =?us-ascii?Q?pizAKQqTTs0Aby3a80TkXbU0oBuzVXk179DxSeaWHqGWF8VXC0Uil1FgF9Ul?=
 =?us-ascii?Q?eNQ9AA4pMrtDBkKbsbh7Tv75fib1haWF5W8kPRLr6dax0jTx1+ulZQZOHCop?=
 =?us-ascii?Q?prucaHNfR47XfL4GKWPKBjB4gX+Fr2V15QDlgVmO9U0136rNA5B2h4eUYhn8?=
 =?us-ascii?Q?Wz2OVnOnxpPMQ20beTn1V/flkmgePAQCel6z2fYhpAw5/aTF3pdmfLulWV//?=
 =?us-ascii?Q?aJJNfMWyowt+Q3Ndf6o4ZYhCrzpPWu9BcbOMNuVrvILj5lBVbhXRlrr/YatB?=
 =?us-ascii?Q?0kN/XUVhNoRu2uLr+sHqU4PguvNKjYwv5XusKuZxF9/+FNp+hNeYx4pBCfUa?=
 =?us-ascii?Q?98w/OgH3LtK9smzf4LCuKd6+DH0xaubpH9MXUga6aJirV1uMHHEYuxhj74Pz?=
 =?us-ascii?Q?SWR/PAZDcZOE+hVv9FTxKC2rsdZ4iO78lqlxaQEKEJHy2b5JQJkAPc6SgXkQ?=
 =?us-ascii?Q?Q53fNdM8+Z0wzZrYDvQpx9A3ROdxPT8F4Slr0jEz00zH/8F/oYxNLki2cb7j?=
 =?us-ascii?Q?XK+IKds6n7PTbYazSOy97GVnIpqKzEDMfckWWSWwf9kJVSMvJyeJMyTh+E/4?=
 =?us-ascii?Q?2BR34g00LmZIxcynjZv3EL1xfAfil9F+VcuG2QM3D0idLd214tUlKFvO8u8Z?=
 =?us-ascii?Q?+ndz38cb/8bKkQ4GR3v4EfAjsshdQYcL3JyGZdMEAAQ8eX1iev5aEek3IE+z?=
 =?us-ascii?Q?ECV8gPYigj4q5+JW+13p93ETeiipvPbqc1MSGOPH+VBXIkS80mJgxcQyfUzL?=
 =?us-ascii?Q?sFFO0KwBhMwo1zWmXM3ZAeyBKNIYunh4n3hPLVfdek6D5ZUPC+bQDOIDXIMR?=
 =?us-ascii?Q?5vnkmZm/5uWqkASosKQnGh7/qR0jfg5n1gsHOP9kvk1Ds5Daw6gWcvS3B/s+?=
 =?us-ascii?Q?E9ZoneBQYOBFPkmuCKVworBD96PCYD3DgMfTR1Og0QxIiPHucoiYhsFebAty?=
 =?us-ascii?Q?QxON5pkzpHpvLxs4ZHiwlBUQ4OKh+KEJCSyyjcZ1x5f2m4q3bdeBUa1aARo9?=
 =?us-ascii?Q?r7pbewntTj5CVEF7rwFl2xxf0wlTuO3THumzChrnXDaCDj1nfdS4SENv11Oo?=
 =?us-ascii?Q?b9cISO3mE8Ym/3GCUgY1VAdM9C/VUrBBjsyrYWtA4SQpxFStGU4hBerawIOc?=
 =?us-ascii?Q?Nc7CvVz1kZ9YT7Lvzg2bhNagQOm7SB95ANUgb99o9nBOwbX5QXWrf6OMNNnM?=
 =?us-ascii?Q?3JfPSXdsCOvxitAuVdzltAZ38zju+6lxsIomwAx5iRIeYuy0ZnibM2iKQ+2+?=
 =?us-ascii?Q?VqFw8MAFttUo1yDW6/OrwdY3Z2WrUIzVY5t6ARbWL4545dpu/6fPu3TOcCnj?=
 =?us-ascii?Q?Zd4NqNzB4YY05hTH0Jey67QzjvIvZkpw0ZaIJNIS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72cf498-e43c-48f7-d21c-08dcabc2265f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:22:33.8692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGcI+GM/HpL3OtkiMZiUo674xnkqwh2YCyeSGiJg8lNX9F8DwToiZfze2c6QKJZA5Ay4p9CR1RrkyxDqP4Cnkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040
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

Add myself as the maintainer of i.MX8qxp Display Controller.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* No change.

v2:
* Improve file list. (Frank)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10bd3f40a2f1..fa82fdd9bfef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7490,6 +7490,14 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/ipuv3/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
+F:	drivers/gpu/drm/imx/dc/
+
 DRM DRIVERS FOR FREESCALE IMX BRIDGE
 M:	Liu Ying <victor.liu@nxp.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.34.1

