Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5480088898A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 03:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B423810E00A;
	Mon, 25 Mar 2024 02:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Hb5moxue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11011009.outbound.protection.outlook.com [52.101.228.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1503510E00A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 02:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QydVgL84yTj2lf9Bpfv34la2tLcwR15xGZT1qfqxFbAniZFQfsFN9lAV6LBI9FpmDWi7Yb9UmIihGx/xZnO3dWCvemMMxks1JpO4GSWMo/xdMjjGA1Y52Lk4wicQ6+aufOKXu/dRKnVQvC/1WqmyC2OCScxK8qDxMPrc3emSV3dWJ4rQ1Aq/5f7gF7hG10e/M+0oDbb3Uy2DjzdNINovFuw2d41XLpKnY28eEMgrTwUA+UtwVgC7b++4+8AyP6jaBmqnwi8wxCSJAC83YrrwCM0b8fd4ivkqppxYBwRIKQyv+V/dqUKwQIopGk8a17ZhPxERelAo9VLqKBKvqs0baQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+nNdu9cruwklfWfBXe1iTRh4EtTiIw5DoO94oGqHpw=;
 b=nPenHrchRDo+l9qb/4k6wE6scXWgksz+zFiQnUdeKH0D5dR6IeZBFbByOu4o+WhUHHPtRp0xZ3dA/wVITjkooNPfCoCWUeIzob71Ad5tGJri0eGoT/rlQP2efFQ3E1Twt1WgFF1K7d5zB46I9IpqEPzKC8aeRvxpVlER+sqx7+iLxJCmNZ78rl1gfpHCXK+LJUDOwIQDaC9uEonngllwnBUzf+gY18TNXZNV49HsAZrLukwTArg6Ruv3hrlSKzIIzAxoOquR3bJ1YzjyJUuL8ay+o7EXYPEld6UKk3YSeMvNInmKeSKP9d7Ph0XY4YLgG3CwWZRfTetzf6arn6Zf+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+nNdu9cruwklfWfBXe1iTRh4EtTiIw5DoO94oGqHpw=;
 b=Hb5moxueGGXz+uok/jDciiC47KbxHeWCxfBQh8Qe4Gi4UoJMMuqkpVzYZVfV1pgFcrsDPUmxFrOjwI3MNEz/HJV07BxbmmJaei/RaIYYpH31fxe0yjB64oqg1X+o9IP5kb7dEJ7hPHAwKIMnO7mVJ0q/E2zRdDgtcl4ii0zP2Xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6831.jpnprd01.prod.outlook.com
 (2603:1096:604:13d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 02:57:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 02:57:19 +0000
Message-ID: <875xxb6msy.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?=
 <u.kleine-koenig@pengutronix.de>,	Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>,	David Airlie <airlied@gmail.com>,	Florian
 Fainelli <florian.fainelli@broadcom.com>,	Helge Deller <deller@gmx.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Maxime Ripard
 <mripard@kernel.org>,	Neil Armstrong <neil.armstrong@linaro.org>,	Rob
 Herring <robh+dt@kernel.org>,	Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,	linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org,	linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
In-Reply-To: <877chr6mu5.wl-kuninori.morimoto.gx@renesas.com>
References: <877chr6mu5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] gpu: drm: replace of_graph_get_next_endpoint()
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 Mar 2024 02:57:18 +0000
X-ClientProxiedBy: TYCP286CA0266.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 054b0ca4-401d-409c-b896-08dc4c77492e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: llpXSbCRjkFbxX3NehKm+RpwebPlFoqPUG7qqgH/Devk9mAgA2Gt9vHxyIFxZ4TSnixSfwGTHomnvIASblJK0u08AaMH1e2GiLHs3mXX3pXNy9444lYp9aZ1K6K4R61GaZEn8T47jvgcANaARS6JKLXewrUusK6CWN6/gwSAH/YHwatq72JwGkGQbiuNXzftOXty/VuiATJN8Am7Qz13m5Lwpvr5dJJuck/uhYYTRXR2+Ccr6xDPouaKRIwPCr3YZCIjxyBOUO/+wLI1w6fZVGkRGIX4aemNYo+hhKb6Nx2edUGNpYCKMawlzqrcH23h1vuEm0BXTNZ8ih/jRXtnX9/8/xZ9qE5H4Xwda/3IF6YSxd/e+05kCJfX5mkJGiqfTUCUAVp1S+PPujIUf5xjVHVL4J9xBwkRQDDJGCCqOkXlklUd/1L5qEsywrN/CJ0iOoVKGxZad3SAXkiFry4vYwz3dOkDGAfaTo0KnbMBgSCnR2sfNGyTS0a8wDVmKjq9Ys+6YAHNGLFhcaCDlI1qzREql9zZkDy7KRnCF6HEznrIHKN8p1h+wxwE0HELMf0x6J4JzSEgP3nFuSadaOwkn1qfK9eSxBk5+B+3nqsHTBIsuVZCGKOYg17JXKBTzg3mZ2/QoOvwQudjbQvR82QqZL8vEj7P95+3vdsPvASzm7xDIF6NdVV+uoCH5RbIhsi4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(52116005)(376005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yTYOGWGrigvSf3xxSPtlbdnqURCsj6PoMU0ekUczqWN2aalrVpJT+z6C2b3U?=
 =?us-ascii?Q?OQI837Br+C0rA+BmghG+NsVvgiZfQWofUXVmhnEbOKVN9c4n5/wncQcwtKJ2?=
 =?us-ascii?Q?cHISYHHlIF000QAOCWkdIekoh8V3SoR+ifoU/ROkTeAdtKcKZaU0/z1X9eCz?=
 =?us-ascii?Q?8wHTu9VsiETnC50dK4GkACL8nnC08eDj3bwJ9fPcesFkx0NjHpPCgOadYwU5?=
 =?us-ascii?Q?j/TJrUuR6Iz/uasLx1CpAFfSJ1O+i7MRWNHbVMAi/tO3OtXaby+azyqN+P0+?=
 =?us-ascii?Q?6DzrS/nU8ip0RxIyci5PF6VbeBvNk/gTCpYfOzWRmuP7s/aXyyuAqxam7gXS?=
 =?us-ascii?Q?Z6rZegxRAqNmJf2nbXkZ4InT2m9iseDAw8/5L8GyS9OmNhsAGNYYERXI8TUg?=
 =?us-ascii?Q?dW7PLjPTe9p7/FtKj97FVsRvfMC2RCi4gCi2SdjIDL+f2UfeWjMif3LLQu+U?=
 =?us-ascii?Q?FnqZHG7A7C06xSzT2wh+I5FOum01iHM+cSfeflY1f3RA+YPnBFZDj4UbVMGY?=
 =?us-ascii?Q?zHwRs+C/tD1FKxoGkXMUm1z3VSksrgWLGE+NuKI69Tzyoa5W0QONPnvQig6v?=
 =?us-ascii?Q?lCPtKKudGEoeYetswykXN3F99macP/n4b4RIbKK40u/xADnSf7b/k8yPMWlU?=
 =?us-ascii?Q?ZWJks6YGWzghfR5JdUbbWvIXM8/uKmiYN+VaPibILpwZiSVg9EUHiC0nPtCT?=
 =?us-ascii?Q?fwCSzPf0yy0yzkShyizct2NHiy6kqCzI8A+bpBahixM2Uay4RIlxM56Y1gmO?=
 =?us-ascii?Q?L8AXXb7J/Md6nEB487v9k3znxV4zfvjUniaZGoxpdU2Haw31uUI+tFugiqvV?=
 =?us-ascii?Q?VhS5JeY5syRGyi/x0nLGLAkgAmYGI7TQr2VjW6j12PcxaiKSkK6jMpYIbIv7?=
 =?us-ascii?Q?GEPnpBpJ5/278+WN6JD7wR6+74U1u0uXRTPpHHk1YtC+SSogulgfSje0+FAf?=
 =?us-ascii?Q?7OyfP3WzbCspL0dWckq1QLUi0ZtuxkkhQOUL6YjFSH674SxY7jd8k4funAo1?=
 =?us-ascii?Q?74Xk8FIP07mBQfHZJ/j+ZEn/Tqs4XMckESAXAlbJzJIFuEx5QUzkioiyF1/q?=
 =?us-ascii?Q?THxPRtlzG33qdSexg1QcKtpWV+qa3URnNrrKLignDIeA/rEGiyPxAVs2I28f?=
 =?us-ascii?Q?IArWKZbvvpADvOn4VyoyTsM7U8qneYiMRMKRNmCbKZ38JCbKrQSuCdNzYPKz?=
 =?us-ascii?Q?04lCX/z+qLvHpfSpZ9oLMiqXOJsYd9/LPkNmrklaRdpCvKNxlYXMT/woN4CK?=
 =?us-ascii?Q?BFwi5UHuZh3V3xwBAQ5Sc3jI+/yWdlbRRhtzqtk/kKfhbFeHJaWEF57dSoUg?=
 =?us-ascii?Q?YTXxJUZFLhi4PXOUGI/r8mypJ68w2eChTJyUB332v/hlr3PVczcAA/jWhQ1b?=
 =?us-ascii?Q?n6UtrkDGCevLAi0ZVuyXkblHiXB4oW3LtIMUXVbffQYLgE+cpG2vrjPk7DNn?=
 =?us-ascii?Q?9BiyqugQyASrqPJqzeq8d1bf3t/ih1X8s/ATvPqwc7nSJ1hAG8hKkhQmYVyX?=
 =?us-ascii?Q?KJmQpwWBkehG6FkAKxYeznnBvejQ4YPy+XfX6YqRW9y+l8lYsvQr3HxHI/ui?=
 =?us-ascii?Q?IM1XxArejblw4HsZQnQc6czqPm519VtuMizfUonMYvK9qiJQanqqRtiEqhhA?=
 =?us-ascii?Q?vQs/ZLkHvRqVCYKBDOOJuFw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 054b0ca4-401d-409c-b896-08dc4c77492e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 02:57:19.3266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: En9w4O26aq8dW3pPzfMOBVvQdzRhRbEI4wJNW4iN3wCUn1vy04G+ACntNqLvRlFnZhgA3vDTdKWzhgIkfORLSgi/SQat85dK/WfEBIgLxwUadR9eOCXo8MQakIvoi++q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6831
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
2.25.1

