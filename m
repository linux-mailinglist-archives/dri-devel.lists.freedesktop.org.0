Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B43C989A09
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 07:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C972510E0DB;
	Mon, 30 Sep 2024 05:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="oSQHzNr6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013004.outbound.protection.outlook.com [52.101.67.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C2C10E0DB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 05:29:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GImYgyKuhTe8vzDd78CVY7i6qkN4FcXmNqVhw5tjHzUGtGBPS5I2VYtl3XLJN6DBimsVv0edGAL/XWu7xiMzdYouxvubB4zurXaicTpVufQKtyEPzfGmaWxVV8AIs/1Hdy/b9/FxkP/6xQAypLYb1mbJfixDIre6RO0XJE1ghPMY6KninbnazMmVcm55kD2iKVdfs/oeycuqrDfAbHpo1DwfynFcvYoTgFCuFVDlKcIlub4CXBrBPD05D7i5byBeUobxvt5Jies17tdO9R6fSeZdpzKlqGt4DOipnco0G428Tv/EOYyG3bZL/WImjjVryGCs4dfJpuPmwhOysbgSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVd0E0lyRBXWkmvGhlNxKECFxaodydKKIACJ94ljdFA=;
 b=HZFCersSBqaptHVMzAy5tJL5pvqKrlIvW6MPOdRlyHcNTkGeXTuw+AAy5AFE0YyEHOvZU7ELTWxWirclCcKaKCZs3YVUkciQgH6eCyLHlj9Td2Jc71BMCcUdEYnMStWZeAoqx1n6FSKmuP9iPAwB3ctlQJJ2pXujnwp/lWHzKN/S0383eb0POMn4pTQ9lLC+xz69innzHhvCfaMvQr73tFsnL8tvadDN2Dhtde11sDxeTrjur08MSlzA8WTo8xgL6gvy5rUXdYq+mMA8x6rgOGM9yeaOfB5A4anivn6QC4fzxBsDi6f80Ocp0a9DiTwBD3H/d3/5BCPWa4qJpnHZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVd0E0lyRBXWkmvGhlNxKECFxaodydKKIACJ94ljdFA=;
 b=oSQHzNr6gO48Fuod6Uf8WVMWmfWFyWVNRWxA11ux0m50ftCfX7N+B4BlusuX4SCzxnToxlQYN3YGAXnYvXXwukjetRFr2amwC0NAFK/P671AajWqMFe/g9pQ8xvE328bBeUz5s7cztFQ77DFveiPv/qxDgrIxgU4fw5P966SRTRHWLPW1M2BEmQyRXW7sqBssXKfP5c2/7v2GvPj7OiZgDBx60ziv9JuFwttT7B7RS53wpLtBGjdnukuTUOxFWBFL0CAyv0/nvMHy7h7JPH+pVavVPH1kLqdiBd7GFNryVroKoYBKi7f2jMdAXaWiAxkH5GULTk5FiH2LIBD9zWPWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10536.eurprd04.prod.outlook.com (2603:10a6:150:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 05:29:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 05:29:02 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de
Subject: [PATCH 1/8] arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Add
 panel-timing node to panel node
Date: Mon, 30 Sep 2024 13:28:56 +0800
Message-Id: <20240930052903.168881-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930052903.168881-1-victor.liu@nxp.com>
References: <20240930052903.168881-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10536:EE_
X-MS-Office365-Filtering-Correlation-Id: cd64f7ff-6021-45a9-dc34-08dce110cad4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KvS3BYDEV7DbxoGfa68yx9NSrYW/SjORgPIQEabVNTZMHXBxUiXJL6IHSetv?=
 =?us-ascii?Q?9vIUu50NRASDfwPNrO+JEcf8ty6QxxfJcZ4d/soOu56mlMCOI/U0/IBogvVA?=
 =?us-ascii?Q?gJi4ZPa9akw6YaNDR4wKkrnB+tXiepy59IbYmXe5Ex1rQgmdoDl0vMKSDaey?=
 =?us-ascii?Q?GDdyqzdtbGZWJvj0KWnVgfsmpyzvIDbwPuTxoDMkw7aVkAS159SOJQlh9jSA?=
 =?us-ascii?Q?zDvDHIVeg4/H/clVx5y/iShhoglm4pQ14tpu1zvIkkvJ/93iCzGmWv71i/6a?=
 =?us-ascii?Q?nAGU45U/+ZE9pI15TGef2y7sJ3DKchTSObSIYs7iRemq0fQ3gFrQNaPsQ6AV?=
 =?us-ascii?Q?LNZXxetvrQ1P9wqNH9jj0iYOU5TmiYzxYaEFb/8swPOe6UgeOyyT+l+RuwuO?=
 =?us-ascii?Q?IwA1lNQ6Ey+KikBRbS8HPYAasO2UU7+oCYYmJFMmw3ZGyJG5SUo05r5Op0K+?=
 =?us-ascii?Q?2Jx3YFNg1IYo1Lg+10M7gSKCfEtNdI6dERs2fMI1UFyxyoO86zmR11d5/xUZ?=
 =?us-ascii?Q?F0WYeMNSaXjWvIj0Ty8PZCFrpcB5azVe23L+aRRIhoKLjk1GQ+hc2MRf8Zr5?=
 =?us-ascii?Q?idRzrtOE8qra3ZtRFmNoslbVqp3qN9f8dinh9LyWeb+0Gw99OTH5/3TMkNbC?=
 =?us-ascii?Q?JMpv3c8Oo4D4G40f3HJwh07IFBcDqJTatcQZ9MXJvrbBpckTU6Kf+YKGOAms?=
 =?us-ascii?Q?PVKHIrtbKLT0j0LLp9ED5YyGHpuKiOz9aUTubcsisrDNvaYwHgXKegmBOYTn?=
 =?us-ascii?Q?t0eVYRf2oi4cArqjPv8cdi65rSQPGczq4bFoAMIi4dvicnfhfxJF3w/v+PHI?=
 =?us-ascii?Q?+wi7tuwOao6bQXy7q24UR2mDceXteWOQQ4wxxe4v1PhJjJwGARywJoJeKOxu?=
 =?us-ascii?Q?ZPeQBMPRkCC8ZivNLM9s+MfGhHq1T5JwS3HWpJ8huuZjBCRoh/iuckB2fRD9?=
 =?us-ascii?Q?HiS6Bmhn6ylLtkBMuoce1rffzsdkpvT2Wx4sEgsFEEcVVU+ZRJAH6kNz78f5?=
 =?us-ascii?Q?b+mkFAQ32nfA/UYo+uoHSFUz5IJFS3IVc9KSqog9nEYOkD7emIwCXMWdjorE?=
 =?us-ascii?Q?cQ3e20Sq6YytVM6bfX2SOJ20y1Y2Id2zqjMnWaXTxHqfexoswqfZsDmuTWV/?=
 =?us-ascii?Q?QLihpgeAV1J/VM8hwvEGmx4+81h48jO8LhWsV3/Gj+ZgFAPolJnDJ9jlEf5d?=
 =?us-ascii?Q?yfexakTM8oiHu/it54adoB0qjwQKfReIe2aYsdqIgSSncScSIejWzBghXop5?=
 =?us-ascii?Q?JymEBR9oWCr8RGvqjpBbLy+QqEsxjw5bHL4+02lLReJZoIG7dgO7HkPm4zVJ?=
 =?us-ascii?Q?fiJgB7rZb8g82acgkONdiM9igAp7xBxUtFLdPg9CwFhwap/9VEa3E0Bo5eS9?=
 =?us-ascii?Q?AQajfsGFlgEliVi9ckoxEGBFgU8gB6e0n/9mRgM0irLiLJCWdQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hplunFajrfo8kZN5EMgwfbWfl0/7ZQTQM8dGveJVbRaaptjUtqhB4BKY0Ibv?=
 =?us-ascii?Q?E2McOiMCJKgpe6ACIIEyqydYHnaS5x3ZS9a4CRuWNzwDkV45dTNmsljTxutu?=
 =?us-ascii?Q?FlgM0yVwy+Km1DctDmcRoqvUHXCkp9fYDMP1dqUtOpyP2KAUCpeNzO6D5D2f?=
 =?us-ascii?Q?6VOR0f3ZkbLL/LAHSDvJEU2KBw33BgwI3+rxzLOuz32Oyg5QuluM+D4oI2wF?=
 =?us-ascii?Q?ss3+V2gVilBq2NX+wNkwa0MzEeA+nXHJarj5vouOg8VYWK0d+QKRxq2d43N8?=
 =?us-ascii?Q?yqAmcesDPLopf2exiKEppP1Q6PxKUEk0CgOjXHntnb1CClWXxK9t0jLgtR8X?=
 =?us-ascii?Q?jM4RAkfiaXI203sf6KSxkL0L/v+/+GTF5Ys7PDZkaV0kKf+3HO9bJ9ibGB7Q?=
 =?us-ascii?Q?cA3nNn466hTjUoqUbRLpXlx/CxrcGn3qpcN2qgcrSgZY6itFoiluzgb4ZfGa?=
 =?us-ascii?Q?Cvyzvh0T7XUz0f23ZbW7z9BAug7iOw/306PYkv0ZvoxsjMQPbSFgLOtAGceP?=
 =?us-ascii?Q?7hX/EJP7ZoW4L5yAHdUzFVrtvnCutLi5v2GEFYDZRs7fa/YFhCmFLqUiV3EP?=
 =?us-ascii?Q?MZmeJvArrM1zR2yKAu5b2R4u2HHI0lvSE+jLUXH+Qh+4fX4uhSFMlpLyKpFs?=
 =?us-ascii?Q?2CrPoW7KLqda9kpFDZfX36mxiqMn4XnBrrw6RgtG0yf7U9tHDe3JST20boc3?=
 =?us-ascii?Q?spTDXfZU1bHngJZiF6/zK0ovYiY3ayYTq9UjnjQrXrmKORFbCFue2ERniDj4?=
 =?us-ascii?Q?uOLH85kFGWyD/HD0ivdWrpAvEhevj06J+BftYZNJ+asOUrGLW9d8DD/2jRzA?=
 =?us-ascii?Q?3IUwJmCQ0IxuYjS8o/kBMdczAoHW0RWgFBFXt1cNn7ofFAHoZIrk8NF31qb+?=
 =?us-ascii?Q?TYy96yavDuwixeH2FwgnHp+DGJZ+TlB3flgeOXe/Yhxc3Ut10TfXji4i+1+N?=
 =?us-ascii?Q?jD1Q+uFs4Vro8TZYcT2T2cFbCxcBgcwuGfcUI5n4LZAQTO6YspeGFNgfPHUE?=
 =?us-ascii?Q?K9zedqHzWFI4hfR0A/WOHbO/BAWynvW6o8FU75Cefy9Z3Xs36C0HTPfhWmF+?=
 =?us-ascii?Q?NGyyc6djpXmoQz2HqPxphMYHY8XEQbDWBpgO8uXIPqj3kfN1MhScfC5wIX5H?=
 =?us-ascii?Q?h7mSBond2wLpfM7IyV9s74wOl/dLo0/p5oUlV8WKzc/qa9hE0CQQFUyG2aW0?=
 =?us-ascii?Q?yTt+4WgV+vUwlzC53pVF4GkV9QF5yoZFQHbcD9BvCfDSGBoQpMOqoEU0YAjn?=
 =?us-ascii?Q?gz4ThE2N6Gn0RFj42QvOmuXcg44Vl44pLwlqvP/fh6H3M6aJWkdeQusn/nTx?=
 =?us-ascii?Q?cDib8/mz6TNhfDkZXmh+/3giVeGblEsuK6aU0PicG1Sy5amYQZoMAIKHx1Ps?=
 =?us-ascii?Q?omYcivssTwfPVlt0vuvIeCMxVNEu/UONIxROm0aT0mSArDlxhX0o7/ZZFIcv?=
 =?us-ascii?Q?ekITsu02fLSxkyZJmQnZsRDcfMVfKB1Wz0QvyW8+ezoxqsyiaw+t+daHipPC?=
 =?us-ascii?Q?AqfI2ilZL/ZhabPIaM7GpeRelktBUL6IZZAWmwtpmMTyKyYphfbt42axO484?=
 =?us-ascii?Q?LiCBMBWq7c6WidbHFWYp2cYeBm5Vv9p3btVC9tZa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd64f7ff-6021-45a9-dc34-08dce110cad4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 05:29:02.0892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqyfLewFpcRz8ABhAqlSEynp04enz9dsh2soKyOcT4KKKrJ88QKJq/lATY4UXT0zWF6S2maHOqFAPi8S+rfJhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10536
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

Add a panel-timing node to panel node to override any fixed display
modes written in a panel driver.  This way, 68.9MHz clock frequency
specified in panel-timing node may accommodate 7-fold 482.3MHz
"media_ldb" clock which is derived from 964.6MHz "video_pll1" clock.
The above clock frequencies align to the clock rates assigned in the
lvds_bridge node and media_blk_ctrl node in this DT file.

This should be able to suppress this LDB driver warning:
[   17.206644] fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (70000000 Hz) does not match requested LVDS clock: 490000000 Hz

This also makes the display mode used by the panel pass mode validation
against pixel clock rate and "media_ldb" clock rate in a certain display
driver.

Fixes: 6d382d51d979 ("arm64: dts: freescale: Add SKOV IMX8MP CPU revB board")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
index 3c2efdc59bfa..4e9f76de7462 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
@@ -13,6 +13,21 @@ panel {
 		backlight = <&backlight>;
 		power-supply = <&reg_tft_vcom>;
 
+		panel-timing {
+			clock-frequency = <68900000>;
+			hactive = <1280>;
+			vactive = <800>;
+			hfront-porch = <30>;
+			hback-porch = <30>;
+			hsync-len = <10>;
+			vfront-porch = <5>;
+			vback-porch = <5>;
+			vsync-len = <5>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+		};
+
 		port {
 			in_lvds0: endpoint {
 				remote-endpoint = <&ldb_lvds_ch0>;
-- 
2.34.1

