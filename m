Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7F290A103
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 02:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7544C10E041;
	Mon, 17 Jun 2024 00:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="YdQV5IvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2074.outbound.protection.outlook.com [40.107.113.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D20B10E041
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 00:58:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJuOGIjDWHEKBX/LfTqwDu4CipKtOHz9B7KNv7D0QVIkk0QAlwIwQ7+IGLKigDMvcgeQ2l/5J852H7l/uRXE30uoi/9EoWk2tSwoz6eQi083cmYjEWKUbO8glO+gf/SFp0DMU7BaSE/3tzft1zU5oQ2mVSnwSGGApq74XzlJmYMZkBjwdYZxiXwaYuON7UJ7G3AgWeNQCESqWZE9vQ99XbTiNRg+4pzXSDLOtlOsoiCVrEOAPposKYdzWd3lYYruDF9fnQnlvjMqz5cx96pSfIWMZ5kjn/wjStIRqXX0kaJ/pCm6TVpRaNsz5hu8IEi9yds6+yq02oA/9Vvh2wxUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cbb0dRK+5iDbyv2Y/MVH4j/HgoQMnUdnZRnxe2rrKFw=;
 b=OR1a1aK1IOR0VybfHH4vItwEIKoAZwqnN8AE3V6u6LYxidaxQufyHxDF+iL3nEcthW49yUa+k6El1FVCiBXBv0k6yI9UWphrY4RenniT3g1xp08uf/3V1DckqGrOO12j95/83LwinBalsJgOaZbeIbcXlPcvKdRzgIKXtwObV3exIfDAc1lj2ng02VzqnVTR7+BcstcaRnWp82ceY7zXC9yotOb52H0/+nc3NgCzqoxEheWnX7kxNsPwQ75uBLkja1rGdj4EtVoNg4Dbe86+Y4zgpseJ5giSRJXXCXHq2yxw1Wat1sQlNLgr7UOuErSdYp3ufH44V0MSTaFg1gS1QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cbb0dRK+5iDbyv2Y/MVH4j/HgoQMnUdnZRnxe2rrKFw=;
 b=YdQV5IvOTvYKMPRV3AdlgBuiYD1mrd0SpPmz+VCjyqxAknbMihFCvwdhsBc7tqqdUfmmV1jM8dkGj/5XITzqzuLxtqmZgZen0KwW9dp1pqz1K+FvQnfFjJiPZx0TUQsmGLQIk4qBDjCi71gRc3QAnQ7/Wc1YfR8KEr9nrDgwrtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8560.jpnprd01.prod.outlook.com
 (2603:1096:400:13f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:58:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:58:46 +0000
Message-ID: <87tthss7ui.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 resend 1/9] gpu: drm: replace of_graph_get_next_endpoint()
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Jun 2024 00:58:46 +0000
X-ClientProxiedBy: TY2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:404:56::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ac385c-b5c7-4787-60af-08dc8e68a469
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q5mlfhINr4msdM+JyyqBfQB3jpag9DPjV7zQ4dQUynAqPPxAG+g8cZUnWqSL?=
 =?us-ascii?Q?FSkcyLik3iau3KUDwlatNEe6wTrS1dQQy7qlYXJIcSMeD3WCjtDzbHFV2X+c?=
 =?us-ascii?Q?fHfvXckU27oPr+v4Yh6lbqh0Fu8s9LEI8icw9CTQskT2yxJr001VkoZy4LXM?=
 =?us-ascii?Q?koUuFlqYikzQJIsLVYSwPlFrnMrw34pvxrTj1uE/2eq6fLQmju61K7sPbkg0?=
 =?us-ascii?Q?lOweVlJeErklvgS0sCgliwlQ2tc/YnD2GjPXgoWz8uJbkWAmEvwxisP2Kd4+?=
 =?us-ascii?Q?bhJin46qpQVSHocGPbJ8/Krj+jo602yeS7gCvNkwa+XA24dR67vgoNrD80Ya?=
 =?us-ascii?Q?yALeXVFTxTyl9r1ahTiQ3sr1Sr97n+IemrX9RLodgEF0eoCTDc7SEmNMRLug?=
 =?us-ascii?Q?D4Oanly/jKvG9r3SEDUZP6/k6asJnU9/AeUGNtLdhoNpdULgWNLhylGyNB4X?=
 =?us-ascii?Q?2NIjIBo0eynOcfPyDubcBK9K/7FxtAay/otzvDGmpEwBXngo2PAGVMsUd5I4?=
 =?us-ascii?Q?+HvPcHb2v0IIOxCaCAY8KSa9iGGObG0eoVPmfn05AlZO/I+//iVyh3bwa1Mr?=
 =?us-ascii?Q?qJH84q9jC3cA0d7JOj2lalesWG+dysAv5F4TpQsryQ/Ib7hu6gDQrl5KpwJF?=
 =?us-ascii?Q?11lHyd8Aw1vQhGZ3Fu75KG87Vx2Pz7bcxBI8z7XAO3McFnRXOAMSSY4Sg9qn?=
 =?us-ascii?Q?4uCAC5TwYQ5yzwG8GiCKslL3cK2g6d0AoMo0Qb0r7QJ25OAcFPipQXcXnd6c?=
 =?us-ascii?Q?1j2bfboKhhr7yvwr+wp/aEdLi1KAbj4XydSc/fwEGXvnyj3iksA+JHUxvtCm?=
 =?us-ascii?Q?kFq4+zw3ai3HGLP9pbDuNfjusCTFXpVJDkDWfAxprURdwCNYT80G0g55WSDy?=
 =?us-ascii?Q?SKpJGA7vAAvbcOqu7RVo7QAfk+zbPLPLwxeEnoVPTS4WaRwbbrq3lQg7ExqK?=
 =?us-ascii?Q?wAVW8IRrpHrxOOc1aISSk12g9v/PLZ8dVq5fzPnXsZeGa1ifvRHrxW4bIcJz?=
 =?us-ascii?Q?u7zpSCGRpo2AxEjxpHlv1V9OevMAXmmeyMQuMycrPSNAo7bB0UuGDMm2rN0Y?=
 =?us-ascii?Q?J2XbpjkARJ+5tkwTCKs+kKTsR6yN2jKm9aG2wyaUbbO5GZB7pCFbTA5p6wuM?=
 =?us-ascii?Q?3cBhM4T8npe5L6v/nCPr1me3cJt/tgr9/WpndE3iFpOGOy99rYPtlK90jEFj?=
 =?us-ascii?Q?bv7Vk8CjAc4zTI+bGpU96u++vfCz4yRrtELc8EwAALVUP2RptdHfVhY2qEMQ?=
 =?us-ascii?Q?dReeke7z5KN9eHdbMG2qe7P0z0CJF6QNttNJn8zkXFYrgYWrUY3/7v5m+TAt?=
 =?us-ascii?Q?eUvotNn6HsBIvYWUNPip+LrjbJfJtfOzW9nZMoOpkYo6oQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gHdvkfI6nuVyX0PBcLZyIyqIwlDf6ewQnWKUi4bgCCPfVgMgBSoaI71a5CvY?=
 =?us-ascii?Q?Wl6hWnvV9370n0gORGc1lbDDam2mpQL2drfMGksiZu59XFdzXNYHn5Nd9Xr7?=
 =?us-ascii?Q?oSm7CdddiTUy+U1QtEuQkgsDsdxpZSwkGsWRSa/577+9VCQgeepmWsVdKnJT?=
 =?us-ascii?Q?NDnLUeca4zs2gqFjnVOhUcU6kao3DcWxifQptHMaoOgJqs+YuuEIMwhc+fY2?=
 =?us-ascii?Q?2cYoqiOqwcLRMlEAH4MBJorvC/mM4yBLRH7qF3BzwKyR/caz64ueEE97IWrC?=
 =?us-ascii?Q?nmOv4GdHUCkZYiTQ7QRnYtTHbXKj+MOfAjuqPZlMlcqoO3YP1j2NmwQ7HvXY?=
 =?us-ascii?Q?QotI872hT/4wGUEPqVO4fp3PLOeAcWtY1fLwkpab0cV3EDlqzuBJ+BOh8nhf?=
 =?us-ascii?Q?NlVRBCErjGym9Q1KKe0bMV5ARBOe5ATk5ph4GrEjwHKsFjnc6aoaYQ2ZQHZp?=
 =?us-ascii?Q?o40gj/H1WdbHaddJHm+LHbPfv0BkFQvO9Wy1hxwkgFAg4Hsf5MOmDn/2uFTv?=
 =?us-ascii?Q?3bDE1Xv2CHFMPXhqz3Gk+TGj0ITCsx7PbdN5LJ3fhPexwWuHz+oUUFdNsVsF?=
 =?us-ascii?Q?yQY/DHB1XwD4pzPqOX4pMa+Vf5kAJ8YhRf1D0ww/RBACrawaxv6g68Bar4VS?=
 =?us-ascii?Q?sFtLtng++qbm0KGRj+D1SFiMpmzbOp9+4xG+mKTK0AIkJlJqdW5A/kUM7PF+?=
 =?us-ascii?Q?ETV19TU31wW4+TisjX6izbN9uOxyGsA31ATD9isaC/yVx4AD+8QxZ7NPPKEI?=
 =?us-ascii?Q?f7nN57KDaWR1cKNMxTCqzbPccnxmJJMFyCkoGfj8B4kX0RhoQTj/XqIFX2LK?=
 =?us-ascii?Q?RDQvt9tCInB2hsdHMk9oVpwv+jfRPQr1dUHHoBAsusIedCOMhesqo6ttB/At?=
 =?us-ascii?Q?9tFIvcKom+tCSDqe/OMO/NVjE8YvugXEDzbr8/+n20wfLaph+VJXF1hWJKPU?=
 =?us-ascii?Q?mA1J7Qye+VR/rv9tovHURE28niI8uBk1OKn2TdXFUx4W1mCwXakQQEfXQQt0?=
 =?us-ascii?Q?6DEtqR5403AcCmqsvJ58BSnE2OxxdsCLR+7nB40GkkjKPZxrsgCtrzm1oZ6c?=
 =?us-ascii?Q?CEYfiCeOHyL94AVsddyPSEth3KvPk6o1fP+5tkSQjJGKvZnmILCiBIBWsJ62?=
 =?us-ascii?Q?OejUEklAfL5JaDS9Sg+DLRny+yfiAmfNmTBnOHbol0k2PJDVJH7/hMOdbUQZ?=
 =?us-ascii?Q?1kFj9I2AmhVRwM0JKY8LOZdjI345lEpj1mlVcEQMj1pnpiKlJ6Nr3Ltv0HGb?=
 =?us-ascii?Q?eYRqRiBIYa5DhtSKvkOiX6Om5asoKj397bxSIU0h2ZBhqIgTT13mXIwwzIX+?=
 =?us-ascii?Q?K92LD625WH9I6/Nvi613KCE9bvR8mc6xOjE+S6gS3UwRoFkcMKynOb5Uf/+r?=
 =?us-ascii?Q?C/23r3E/U5/aUOfGynbM1QEttDK2SLcY8C1fBRaCRjDzPaHGi0xFIOtXtbfZ?=
 =?us-ascii?Q?4BI5bJ42jYV20FDaH1yyy2ZE94Ur5DZIPfug+CwXvYi+IisyfN/K6Cjr0ZVx?=
 =?us-ascii?Q?Xxtxjb67dkuadR/I9G61oIoDTnJ8NBwee2IdwRiFawi/NBWJaauOv6O5NQyD?=
 =?us-ascii?Q?a7q/l9stZ8L2rY6jI3t1i7p0wzqmqkV9rBPJxrXl1CWuMT54pXqPdVWgMOJE?=
 =?us-ascii?Q?iWAA4G/LMdZhMli/Fi2yTJs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ac385c-b5c7-4787-60af-08dc8e68a469
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:58:46.7357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDMMriImhV8icW+oO3TmaRuEtnA8WQJpDiUZR2sGiFDicJCvCQS/BS9rD6Oh32iX3lYRnO2FDU//1zggnHai1O4aYRiRMsOdQEZUNPy/rDzkzgMtR+WO0LkkYUp5SjDg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8560
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

