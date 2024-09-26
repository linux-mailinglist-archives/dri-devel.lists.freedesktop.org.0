Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28990986A31
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 02:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8AA10EA8D;
	Thu, 26 Sep 2024 00:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="C/1rakAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C39410E876
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:05:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/ndsCikwmn6pCGj0t9ge8gKVrT2zkXABx7cd/ycPDxAoRU6o/kHSztfVN+1zL24TB5Ht3ctpeuTB8NcpirHYTI+3C2DF0bbKzqibxTxHjcy1X1l7UxGfl9yKSBorL+xigq8f970ro0YlT1ZOgB9UA3jNxuXPUjWYnast9LVD+ytYzBuH2vNjPpwmQJryVdhXPsZW6WjRve9E1qJB9xZkDJBQ23xvGPw623UHh7ouNvQWOs2eTKeg2OI5bq6Hazof+d0lBWcRporTwkImh4f4c9MPVJAqlkkhVnFg3qA8xUzN5wPHcsCSk2ctHWioQ8CZBu8jpDv6Mrh4g8s3G95nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5aiON9TQYg54VbsotdDjHS6GOwJCn/hyoSGolmFQ3k=;
 b=JQcieiYJIhwu6nvKyMX3AXhyl0yu7cbMcDeRv9WPDSxK3OJrDsXK0cJ9CV7WeNtEmcSAVHMO1M0SR8/HzqVPno9k7kCDpxLj7I2pHnNvN4qWzP0CIBvh0dWpcm3JFqEOqeN6+bFeoJ7w8GokeTbkEV1pFH3qTua0hx3NrkUnHTx3xFW9+qEKAos8rd7g/+brc/Ia/9hrAXmw0yAaAns1QlTIpslbIQ+aHNQBSih0zVn+hvMT70CQ9ZgaFkORw6oyTowcKRmPcbGgPPFwW/Z26ZOpZvrES7lXf2dO3kg2wgA3w0GDhYt6O+VsE1YeYuhpQKwo5vjUO8l34vSQjwGxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5aiON9TQYg54VbsotdDjHS6GOwJCn/hyoSGolmFQ3k=;
 b=C/1rakAq43AhRh+NPIpfOqhzTylcwS0/fXCpDZ0IpOIK79f12nK70z6MgXvjU/AvI60aJp+/P51S/GdCfEaINpAEiU0oKEYywzJ4NG6M+Ez11pW3roRGuKrK7GOOji6i0t6KYRKa0xwb9hfUra2qtFrGdPwGlwq69SGvuWsxscA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9281.jpnprd01.prod.outlook.com
 (2603:1096:604:1d3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 00:05:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Thu, 26 Sep 2024
 00:05:42 +0000
Message-ID: <87setn8eju.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alexey Brodkin <abrodkin@synopsys.com>, dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 ] gpu: drm: replace of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Sep 2024 00:05:42 +0000
X-ClientProxiedBy: TYCP301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffeedf4-57c3-49b8-94e9-08dcddbef620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|376014|7416014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UMWE52D747JWm8+46BW5q8id8pRINuF4jvuZ9kTeJBIQsXeb+WNz6nhPv8Tx?=
 =?us-ascii?Q?vA4ZuihAo+svLzB4ERjdXR3PpLG7LoZmJS8T53Hx6uzZ162HRGvdxeDqUh6L?=
 =?us-ascii?Q?yB+kQ7ZGTNNqvXvo/+A/odYKkzBlWZVVvSQFyGLwX6hkCfy3PsMqQ9SMdCy8?=
 =?us-ascii?Q?TEcKADqId6M2+jCTcNOeXdjSF1uGCJlKnrZCgc1i9yY/7zx+fKb3mNUIGVtd?=
 =?us-ascii?Q?xnNmq+Dr800a+WiJMN4EgF8WdBH7q+IQfEwvqJoLehed9xO13t2zSp1ihSWa?=
 =?us-ascii?Q?qLVYfyuGFt++9Pdb83GaHbV5Z+pvUO9tFyY3CtNDT1ecOpMq+bcRL1KQUrRY?=
 =?us-ascii?Q?23gLoXY548e629Nt80ZMJivSCqc3Sv+0d/utJKO9UiOmOg7m65oJub83HvPr?=
 =?us-ascii?Q?qRRoGIsHW3b424kzbst2J73us+5YDrJ+ba/PG8vHzPedIb3O7eh15Lmb5laW?=
 =?us-ascii?Q?URSsDm4PpLh1UbEr05hhXIQsETYzYt/28cQ1xSua2/mltc/5SPYiUZUxqe1e?=
 =?us-ascii?Q?0WP36+72hzoD4tFiVeryeQmQ6yAsllzFeC0AJnfI0GPitZbSqoHdMKFk1Dc8?=
 =?us-ascii?Q?dS8XwsKK7gX7mha33hBWvFEYCX8mhOnf+tL0iW5xrcPuKapbkpAJ6wPuBJVn?=
 =?us-ascii?Q?1x4hEQjaVtYzBgPgfCPVGjmORQFqP3vdcTtVDOV7XEnM4UUlp5AuMjlzK4pT?=
 =?us-ascii?Q?Q+MIp0nESR0T9CFPNJf47wbQDjUCivgmJ/d/SDZi3etGkyWi1c+VXplYuwKU?=
 =?us-ascii?Q?aDj6GUe8M22IhzMevzz1e3f6aBU0NrQpIPyS6es5gqeTnDzocPIObYdkD3ff?=
 =?us-ascii?Q?uO8osZzp6EUPgSJdYyEQAOxP9lPJH3Rq7XKam42psICeAkYdiu5IHpgeNBYy?=
 =?us-ascii?Q?au91CBby4CVjrFB4KBundJoRH358KL0oycB+Rd1DXzkrBurP3JasCDuJSjfz?=
 =?us-ascii?Q?ZjA/hneE6KdmRBEVWm2+usHLrQfGtrlOx4bZz7MIAq6JWvmYsrP+UGernADO?=
 =?us-ascii?Q?iVU8qmk/8NPZXm/EfRIvQ6x3kHth6YI2BFNPCep/FvBYp6MyMox+E3EzNyPX?=
 =?us-ascii?Q?9L8YL5o3BdAs5S/rWAUL2+3LGi7ZOCXEYF7cSbM7cHJCLsPr8uXO6f6F7b+O?=
 =?us-ascii?Q?cy9sOkrFs7gVRvnAGtO7EKpqNW+59PtYgiTf6Xo6NirkAeYJdYoUgZ79GNuW?=
 =?us-ascii?Q?N9iWOSjAKppDdK9JDz4tMVLgT75OKAv6lBejEnKDhuDjGM2r4DjANjeslvkR?=
 =?us-ascii?Q?yryDLhpF3AHeifhwU4YO4ryBQBPApom3Zkrk6A8ukC66v54Kty9wZ7BbY+bk?=
 =?us-ascii?Q?NIcIkLE48ElonljvWeGch76nx7b4WChKdGFrOm1uSJQGScAKHjxOBXO96F8H?=
 =?us-ascii?Q?IHZj2HQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fB1P3PHeEMwJ5s2+0J1vg5wxzZn06sLpKj1kCyNbVShAVOUgFYp5fRNSNoR8?=
 =?us-ascii?Q?AsMGHethn1tRPbGMfvXpKnTx+148QMOanenbEbAvD49RmZTNdTZenmp+bkvF?=
 =?us-ascii?Q?ePPOy7QyhXezHCu9WrOXYPjTSjpsi1oMFS3pm1gUxuTZaHDVS1Ycd+yGlZ70?=
 =?us-ascii?Q?X1oLmBeoNTJDJkS36hcHNJNdgN9mUOaJUEWBW4IBBzEr9VoB2IDSn5FcVI70?=
 =?us-ascii?Q?ShKRxgudCS3NGO14o1G/R00CXNn1iOEIJb1qGL7gc3wKclTplcvqG3iFSCrv?=
 =?us-ascii?Q?EcEV20jQDvbKJeen5Yl0F9N+Bsxb3MNMHkkrpq22y0mXhaBdr57j6/3avj0I?=
 =?us-ascii?Q?5eEDcW0N78GLb1F+6tP1dqRcCsZCRoAH+7aDwcXq12IMUTwwDY++/4cXc4XC?=
 =?us-ascii?Q?xpxInqfoTBwPyKF/MfYBFdLMZDlTlrxpQn3M0v6k3C4HACCrjZjoTl3L+747?=
 =?us-ascii?Q?w7UfyQzXR87DYF+3IKpAqZoX4uZidk4Kq4C6V2Bl7/v2DL4Z0pGga3q0ASke?=
 =?us-ascii?Q?5Z+LD068sJiwq+D8XLzzgium1gp1JlTDjljTT43SdStWojfL9tqJzwmuAKFd?=
 =?us-ascii?Q?nKk/8JW9HYJCGIdxi5uc54ad6WShTC1Lh6OQxv/l2L7bb0qFs6XFf4VVnCBs?=
 =?us-ascii?Q?5XowSzG95QfCkukG8ba8uBAXAvu+bw6jRitWSgSFTM7IlsLI2lGIrQeXsVk7?=
 =?us-ascii?Q?xenGd3ay1cerBWSTjiZzNvJreXcmpocccOc10E2IxofqHlNvN9LEbxRrqU69?=
 =?us-ascii?Q?Lgh88TaxAZHRyLxippxfcXcfoNrH7hSSL0ENy6y9Bi9Asvr3e1d5NU2J0uE8?=
 =?us-ascii?Q?exyNqN8LF9Wt4ggqdVyCNVicGMO0P1OE6K+ha+dJ0kv3XMhLbb6y1UPfg1od?=
 =?us-ascii?Q?HJTlyM4vc1hN9BuWExmwuLXGB87m9bnk2enJrF6azAfEjW+2svYIqVM0DQVM?=
 =?us-ascii?Q?DRqRffG9d1nLUF/bvK+wyxHpbmlCUzCyVyVzJJefQZo7MxKHrP03FKzb4nE5?=
 =?us-ascii?Q?uwaAnwQbEIhlyvz8+nPbuDvbuOaLilxAG6zaYyXt0x/W5N/rU3OVBw6lqv68?=
 =?us-ascii?Q?vwg25nq4BDBnISDqvwRl34wR5jjnCvlm8a5JFoelII9YbypLQkP4Q7hYLq0e?=
 =?us-ascii?Q?0/9Zs1quO2LGiVIsFfVQEkP2EoDV6iawb8hhoctqkPDWiOJ1azZr6vCJiKNT?=
 =?us-ascii?Q?A0Lrhojzr48dZrg+COOYKn6WSBcu4mKf5If8TS/gTbY5+PHC32RCmXqE9sd9?=
 =?us-ascii?Q?Cczt1SKLuepPW47k8tGnAEqS33LBoDrHiy/pqbaz/zV8wzTQBNuiTbdU+hie?=
 =?us-ascii?Q?VQRgc5ZZbJ0RZQ0po1PjFPUSf63s8tvtR4qOXVtAZZ80m1MmUiC9XvKUQw6J?=
 =?us-ascii?Q?QCG6B6mtCnxzXChlrKWzqCKhOLEVgP9H1eqpSZp7qsfmdloi2f1XPMu5qnHd?=
 =?us-ascii?Q?9iIh4+S9153ey+3shf2VjpC+qscDMYAcHUTDwFUHmn4jvpAvzXMLkTV4oZd0?=
 =?us-ascii?Q?Q9f8rWPFgrHLh1BLC+lHw3qUfQJoKFAMjfnNjThq2lY2b1OcfZIqbLQ579Be?=
 =?us-ascii?Q?znSUnn934qmMkKAbFXt1Pv4S3wEInrCRaS1if1AP59ZYKGM8WzMlVQJIK25y?=
 =?us-ascii?Q?EKsZO/Wg4tEUM+qXtqLiEIc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffeedf4-57c3-49b8-94e9-08dcddbef620
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 00:05:42.3549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAxNfI/34IJZf82oDlQJ+Z1iEOjq/6Sq+ma1GqPmTYzXht27+5nvNOi3K6tBTMsmODQ0E+Luf+QmmI1zKCVtrtIKN4k2afJuDoPWy6izC7fMh0BRfRSKz3ui2DezmCuQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9281
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
v3 -> v4
	- based on latest linus/master branch

v2 -> v3
	- based on latest linux-next/master
	- Add someone to "To" who is thought to be Maintainer

 drivers/gpu/drm/drm_of.c                              | 4 +++-
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3c..b6b2cade69aeb 100644
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
index 4618c892cdd65..e10e469aa7a6c 100644
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
index 4f8f3172379e3..8c29b719ea626 100644
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

