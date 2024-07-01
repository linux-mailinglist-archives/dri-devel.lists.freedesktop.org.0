Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7891D61B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 04:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FBF10E28C;
	Mon,  1 Jul 2024 02:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="WqCw+t3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6122810E28C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 02:32:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdM7BraiYXSlGOdKNV4otB9LTVa4DVYFDxBjel2vixs3uLPLXs3acrp1Q/Hs0/jijVrBs9YP4YRc8xhuEYa4b8Jgy0rmmLbazNk4ALzTZ2pu7L8t4pmvDy4goPKCWKsnBPi7L/pevXY47riBpuzGE5VC8Y0wVtXLnYOjM9ZVu3a38WlVtcO9z4RrjMFbmA53fNlbB8UxrYUcOM0dMSK5iL6h8x/k0bJHHyeFkXU+schmWtOCVJ+Gzq9Z/ztLh5EoVR/fZjvjtc7trgv8ZaXkEYr0+ZXlxeES/zueBB9wBPjmKoTK2L3YwtqgOKinkak3l4JsmR7Fp7yW0aFyF+Sllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apLBFbhxk+jqGAuccc7SKowoAWPHLJ/lrLshp2SEEjg=;
 b=MmjA+OWFCB2XrLVbofV9GG4YILGo8kYvPYFQAAPl9XapY6OW+H7LNrQfXxUuEq9snYr2VJYc0FbYpvScmN+svaoINK73mNwUm2vQrDLVvJNnF/5Cvxp0kXmOATtcg2J+YKcE7Pt/JzNDVhzLIXmKdhaS21i7fidX8KgSR1qG0NIkJvksEpVVxhNBSbJeh97h2+VEnKbQ6ZskZmIgIjAtua98RvXER6LgmOX9Yrk0eowuP1rMxo79vAyXAYH97/VN6O3U8t9F3lxO3ApuIvem3nmIMMGTocN0sZNi+/ZfZQ+zPX0UDG7wwbwZxmmBGK+3RDc3lR1RIDxkWqSpe9j6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apLBFbhxk+jqGAuccc7SKowoAWPHLJ/lrLshp2SEEjg=;
 b=WqCw+t3hEkMZ+ez1qXhD2dPDZ+UxRoO1lALqBP9q+HLciKglJFY/aJ+CGNVkidnNtg+J6mdK+zzm/ymyXUvDwU6jRHA10WaLHzMxDvc7y8o2uU8hoorZNCxwyK10nA0YAKpCk2DANN6x+H00cTxb6opUObTIgIBSh2Kt9aqiOLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9627.jpnprd01.prod.outlook.com
 (2603:1096:400:193::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 02:32:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 02:32:18 +0000
Message-ID: <87bk3h970v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 1/7] gpu: drm: replace of_graph_get_next_endpoint()
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
In-Reply-To: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
References: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Mon, 1 Jul 2024 02:32:17 +0000
X-ClientProxiedBy: TYBP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f37b87-c9d3-4b12-8739-08dc997606d2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kYHnzN1SqlFcPJnqxbVoXUfbyibnasg4UKSpLjycsOUmexUBIj1PV86qhzGW?=
 =?us-ascii?Q?MEMsoSZSDns59jsLWK8Kp3wvfnb9y8AaYiO6DLFtXbv7vTVGQwfj7ei8ecYi?=
 =?us-ascii?Q?S2uoagN+M8JfwxXTsTkZr+3Bu4XFHXtdCPuAZD08s2YJlxqWlqAmXIYJ+/eO?=
 =?us-ascii?Q?KPoKVyLHP1vndujE6I7TxGZFvMpPAEcMr2IlKxvS5bwq0TJGKTI9dbXbT3GY?=
 =?us-ascii?Q?l5deIa95lHFnxRG0eFz8rsGZeFrXcxorc0XwgqZVSoWAAKQATYqMEUAxGS64?=
 =?us-ascii?Q?xQ9Ij25Kxq7LEoCGHlI6NJTdqhyDUBaUDRZb4mkyrKTVxi0TkW48tTuN+x56?=
 =?us-ascii?Q?bjBCPVbQpTFg8qZ0raXv5MHuj3nkoz45bIuLXFucwp1xvxvtFNCwBjJ0IL4c?=
 =?us-ascii?Q?9+3T7uZcUe5zw2OoGeEEjxG5I32Diw4u4FAb3k0MmnTj1L815gYB089b0EjT?=
 =?us-ascii?Q?Vp5BTDAzkkYWzLUpsmtY+UWqS87ZoMgcpPstOUtq3jWk1GeyF2baJ+s2xnMQ?=
 =?us-ascii?Q?mYK5Yqo3RMxesC1GUi8lCyNTchMrxoy6/0QoJPNIYhidOe/kLLCXfSmRBL8O?=
 =?us-ascii?Q?OG+6dOiBcUBYqUkK77MYvoJ4bJTV3Yjo+CnvDzFifX6b5GUN73zqOI25FSPD?=
 =?us-ascii?Q?fYxi9wWmrxVN6nS23WILD3aZQXpXTj3LEXuabv964rXJPlAojO3LR10bxM/s?=
 =?us-ascii?Q?TDeVXIpqE+nxNv/xIZAIfflK3PI/Y3ec/Wp3DJPed5azWaELtOSXzcblyWuZ?=
 =?us-ascii?Q?t8O1KiIOhUqlg0wmIHY+Gal3rOzXBmHkg+3UkWkIQWxRbDJD8A/O541r+LVA?=
 =?us-ascii?Q?5JTwgpUvVBi2AfFarjiXovLwpE6AhQiRXCCRrsEESkQRCx4QfpAItNa7nuDv?=
 =?us-ascii?Q?fpMJQW6TZH8/m2sEomJILrumBBoyNAKUyPPMhwXYGfVICIF9P8rCFQ8zeSQx?=
 =?us-ascii?Q?1q79YLrKzlaRClqyYKAIO/EWhb31bekgcWmdrichHXG3GXnkyhFiXZIfJv8m?=
 =?us-ascii?Q?uxF4CHWHrj/YcLdyGHTfPCtSMK1C+xIshNN09eIZXy6tjUG8oRM1l/mRUpVM?=
 =?us-ascii?Q?ySpYLSAAicZkcUlRZmw1YyvmktmqPhdKIyu0uvseUJKSXBrgf/8/I7w3dDYX?=
 =?us-ascii?Q?xA4GNoocasjKZPuTsiU+GvzmuY41rMYsapEYEERWrcwZKQIoLXiesTdMkg17?=
 =?us-ascii?Q?ek65fQIdDdm6MWWa9nVQdEFEPLvDUdgd/OxWhiS3gydCSmQUgJwEMu15V/mT?=
 =?us-ascii?Q?igorZqtiCEm1lj6xIAKrdMjnfiNBW5OpBpapUzHNlAJusneE57ay0jK0oYeI?=
 =?us-ascii?Q?bNgrbfPSK5ySA1bv2wOv5mcMZ8HfqK1Qp7kzOc/Vf+rj9f15k7zEYh6B2LmW?=
 =?us-ascii?Q?ruU9fzqvFjMbdbALoj0s1QRWF2f/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?34rmV5qTuiRmvRzU/Sd1sWI7g5N1jEUYN4pB8H7YKwfa7BozXuBopeXTc2TB?=
 =?us-ascii?Q?KqV/wN3Yl10arg89nSYx0g5/gm5Txfu+Uaw2dZDtYN6f0Cf1eTfFcUYn+kW2?=
 =?us-ascii?Q?Hry9npupA61XWgW8jPbvoL2WpEIPRH9Yhe85Z0VLnYFlmdJjgekXRznwHbVP?=
 =?us-ascii?Q?SBY3OX5dkx0kGv2kU1wGHydWGdc23C2snuvADptXEYL8tCSb82ZamgnijKkV?=
 =?us-ascii?Q?tVRqi+J+lMig+vMxiWkO+ozBYezXAENxDyLHQqqbrKe4gW2ITxhGgmsUMyNd?=
 =?us-ascii?Q?mXnE3asR/AwtZEgyjUk/18HbMkblgGO/vVAkGiuCRR7lDK7BYP449SMoex5U?=
 =?us-ascii?Q?XLdLbcZ1OOhvgds1ZDVrY7wObg9GKi5YF13bqMYmA4OR7B5W4ThBIbjit2lN?=
 =?us-ascii?Q?ohpEPa++BjJD/D9iWwrzyjl+G3bJX1yE9gwiPBOyYhLI0ZzRRwbQrissV3F3?=
 =?us-ascii?Q?Phj5VtQ3LYasOPLj+wuJAP3l6prq8PPI+7PRd5OzIlAyWlTeFv6B339YypS3?=
 =?us-ascii?Q?4rKpJRwhBxADQAeDiOFMFhogd713F+zlz6KP7q4fg/9nloIgvh33UaAxYiUO?=
 =?us-ascii?Q?v5Oc436ztecZTT8OOKr0L6ThQ92XvMZeo8+11EWVTZ0CDj2DrG8T0tR/v06Q?=
 =?us-ascii?Q?33nw4yzE/aqpdXHVBiscmgXOGVUUxT/Okf5kY+beXLv+f9KyeT2dF2tJRRm1?=
 =?us-ascii?Q?2Z6Ko+imF20bVpATrVf33KI6IaQL95CKrqgB7AVH605Ii7tyMK3NsBYLceeQ?=
 =?us-ascii?Q?5WmKXaFN2TwXM8eG8wyRLIMkP/zJHd8p5QoQBmSKpaKT9OaIUWdiSAIorarR?=
 =?us-ascii?Q?DOhUZNZbj8rX/t7TXkENFbvR9G1w6BNL+n2Qu6/ZxoDygo67QSH2dvl6cawx?=
 =?us-ascii?Q?YCfINNtNoAaz5Bc6muTfAo8UD1vy2evVKUYyx2mJIKJcwU0NJDNUk72UNhit?=
 =?us-ascii?Q?8YvPScsrzw96ODDOMmgBvIZAOVOCY7EPX7VkjxTC/Mu6z6hSqGuQ6CLZaEsh?=
 =?us-ascii?Q?Y11a44IMyEui/wj4irq3M6avJbumggjwv/YuUKSquXtk4cy5kvA/kfwwULZd?=
 =?us-ascii?Q?wYX6mBqFBU9WdSqMKQH9aWpVoNGXQjXYKJxeJPaJn95fXpd8fFkNjRBAGCon?=
 =?us-ascii?Q?LWYwzqPMZG64EWc4MtRBl7fr0rXFFMTihNh28SPqD58om+oY6ToucNmof5ke?=
 =?us-ascii?Q?xWiSe5zuyu7tF0HMxZHUJX2fH30LKzdU+yrbw3kbHaRBbre7xxdXqyC0h9Vu?=
 =?us-ascii?Q?Wy0Q/3ZKObLHZgrswTKIVzDwckw2eqyr17w4AtOHQn0QiNqB6GCJ6NyrfKAi?=
 =?us-ascii?Q?YweUvZD79SxGbdqbjqS2oadkBG44tR9W7Ug17+EGhtpSQC9zUvDdmb+r5tfh?=
 =?us-ascii?Q?d0vQAm1piu7ZgOhUPkSgxNOwA0qeyyBtj9MQwnuYAjSsAHA9Dk7uuRcF5bHd?=
 =?us-ascii?Q?l2T9bJQ1TB13OiBLmdMZfTRPp40DVJPD14muI1TYT5+8rQ6RMKFBud16ur5r?=
 =?us-ascii?Q?nzkpa/iMKVgXjpfDtOGwcqrOtF+4/rZxBv4Iztuqr//j+xwTnoLM1YeYDrvf?=
 =?us-ascii?Q?ZoIbEHFwokhKgjSAomp0va1msAVcB8UUppvmQWetR4rS58t4L2lgVWR+h/oX?=
 =?us-ascii?Q?kQ0F8y/W7RSs5R/YNn356PQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f37b87-c9d3-4b12-8739-08dc997606d2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 02:32:18.0775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKF3SbnxvgMPdB4xHSZol0CFzvZghR8L7SjrTm6pt/HF4+4K4qa/7X9t8rvtpCYrhb9Bj3M69UPoIoDC0z+5BGz4xlTgd1p4UfPVhHB3/q18+Fk3Xb+GIIH2vJeskk9b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9627
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

From DT point of view, in general, drivers should be asking for a
specific port number because their function is fixed in the binding.

of_graph_get_next_endpoint() doesn't match to this concept.

Simply replace

	- of_graph_get_next_endpoint(xxx, NULL);
	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);

Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_of.c                              | 4 +++-
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3..b6b2cade69ae 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -504,6 +504,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
  * Gets parent DSI bus for a DSI device controlled through a bus other
  * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
  *
+ * This function assumes that the device's port@0 is the DSI input.
+ *
  * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
  * request is unsupported, -EPROBE_DEFER if the DSI host is found but
  * not available, or -ENODEV otherwise.
@@ -516,7 +518,7 @@ struct mipi_dsi_host *drm_of_get_dsi_bus(struct device =
*dev)
 	/*
 	 * Get first endpoint child from device.
 	 */
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint)
 		return ERR_PTR(-ENODEV);
=20
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/driver=
s/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 4618c892cdd6..e10e469aa7a6 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -400,7 +400,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c=
)
 	rpi_touchscreen_i2c_write(ts, REG_POWERON, 0);
=20
 	/* Look up the DSI host.  It needs to probe before we do. */
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint)
 		return -ENODEV;
=20
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 4f8f3172379e..8c29b719ea62 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -288,7 +288,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpg=
u)
 	 * There is only one output port inside each device. It is linked with
 	 * encoder endpoint.
 	 */
-	endpoint_node =3D of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
+	endpoint_node =3D of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1)=
;
 	if (endpoint_node) {
 		encoder_node =3D of_graph_get_remote_port_parent(endpoint_node);
 		of_node_put(endpoint_node);
--=20
2.43.0

