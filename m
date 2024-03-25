Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B4C88898C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 03:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1876610E1DC;
	Mon, 25 Mar 2024 02:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="GawgjypN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11011009.outbound.protection.outlook.com [52.101.228.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96C310E1DC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 02:57:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9ifmTAGubjJt2gdrQqc0nmzjHUxpKH9EmX9Y+suhYB5z9rlpmHFbPH1QEnbxglkmhLDvnkPymeT/PKFb/4wUlLH0MOCX8P13ogqb6zO9WcluqnBoAW8FBdfht68paeYcfjE2HkAZwJ9L3gi6gUw32eiH7PgUJg0gj/Y1BI5L6/8PK5hJ9NJDfqQnqpU009ox6ptEDd+Hv1ag0dsCT0eMWJmVvPjt7dhJPok5Q2SbVmnTjngrH16gZyEqkiUOy4F+qF3Eg3feuIFpJC54AD4+vNgPdXftNODmGhxdb5X67NW2vKsOELHq6kovnk+KkRSdghpIyZhDsp/+Mq7uO3wHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPWy+PYtnAvN+6i0I6jsdtewufqRlqn7Qxjn1KjTnik=;
 b=YCBS7HrIQwwgyjRx0VFm9JKooJmcU3m4uujY1HpGRQ+JlKGbAjFO3lySJIMY/v8nIstnu7ie84fn7FpEzPzrOdP10uLbra8UHGMMWlh/edxoY+qGxmmednZd3t04JDcvj7DKO4Dfo+fWtj0XWLNcETb3uwVc/ce2cr4q7gPh1xge5LPViUKVx2Nj6LIJNQixn0FLAcTEWF7mQHw/9bA1P77HuZpat5IGS2z4J2uHYnRkbbLdlt5GtZ3H6+Mv/htFj8IJz/WXIrlNCp9wy8bKa4I2glt2DHecVksIkOEtHBxEEsAUW4C7q4OOTpG1lceqfd8A+7Ve+OcsruDUiROmqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPWy+PYtnAvN+6i0I6jsdtewufqRlqn7Qxjn1KjTnik=;
 b=GawgjypNh/y93otajLRDRbBzl5ZyIct+KRQUJ0f53qGPn1r9zjK/BjLH4HneRM2mkpf3DhBGI5bPXjlVGRTGZeikOALUErvgcPc/MDlsnZgtmYTJtl0v1vrKB+fOvR7j47nVjsIwP75fvmCVLf3TMi0B0v9vWJShaY2QdoFk+Bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6831.jpnprd01.prod.outlook.com
 (2603:1096:604:13d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 02:57:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 02:57:29 +0000
Message-ID: <874jcv6msn.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 2/2] video: fbdev: replace of_graph_get_next_endpoint()
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 Mar 2024 02:57:29 +0000
X-ClientProxiedBy: TYAPR01CA0234.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: d02b6376-0a4c-408f-04d6-08dc4c774f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3mAxNal8cSc7+E+xx7VB9kOa+G7NafQa+zwt1rwfbq0JdtNn1mEFagYAkj4YMld8Sm8SsthdP/9kNb7WxjGOj8PnBSnd+oCwJrpGbBM017ArG3EN+Ksm5T0bhaVyiHZ4deO7icoXRIyrFPW09+6VB/rxxSPduvo4qbziV3vpF6ZGfb1ZZ4ee6vdHyVbqpf9Mm6U9OSSrNyEyPkIHD5t+MwFpvP5jFZR8TJsbmZjPWADA4/ifsdx1nI+z/nXP7pEPn9BdwuWjB4bk+BHAQ2V4F/0XIoWINCAe/lGb3ab3jCO8JA5DQYiaegxt8LP3mxDKOiauSomIJxzfL6Bg8C1TWlwK+tnSfo2uiOtg5hdb78I5/fwHmyfiXDsfNvbGPKvDp+RwzbfCslepaWuEqths/G69QUX7/jfvQ/e5INNOSpx7lgtGHJ4uNZKA9fdr7CXPtyRDmL5FZQ8pf+hvYBtxj+oG0c0KdTrxkigyNHcmTzmP1x7GqvBH8ECYYx4HVwbf8k8WGEd1Xv8w+7NA3cBRRequZdhbH3AkYh8IxishNZlJyb+3WQdCAdIHviEgidJP28dBtuUgZ75oUqG58d81h99vgmDC0sI+SjE52WesK8gD9YqoNYeCQ/X/P3mz5A4dl0nFa17KqTdZ43p6imt1L4PlFL/BSzUlQOQHaOlvH7I2k7+RluGrgSwNe9HwxEv2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(52116005)(376005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?96LSZ6JGTAZndhkCoekZVMOctVBYOwD+Ic2u6++Tzo9Bkt1CgFGkC8JBS9m/?=
 =?us-ascii?Q?DAeaeIe+eSDCKB8BKk9sLvWvc3kYT89oKsvT0nBm/nbaV6+OT+rljQIy+qwv?=
 =?us-ascii?Q?Ws2VP4EHZ7oxMVA8WqswoOHpqZCP1ivK5ebRgEZB4aNIWccHK30tfYK2oT8b?=
 =?us-ascii?Q?dbznK+2OLm+y6HwFdhL0vU4iOXAmKiR6k8aGivG/gpYsn++swxJRqHRgYRLG?=
 =?us-ascii?Q?hAU+L/agQKYeobDrpCYm6+572TPVF7O11oXfYnHTg+inzMl6f57/riG2l5eb?=
 =?us-ascii?Q?sT1J+xVzBac97LkOxD1WfUJOdmMJpyMlVfN81s6Ga/9JkZjEv+plg/nPjNdT?=
 =?us-ascii?Q?t72KVkIYwNep58Gc/msdtcNlyFKqoCev2dvmBFTybgpTZoEIy1V/mwb0ZLqv?=
 =?us-ascii?Q?CQ4Clk2eXdZtqPmvhUzxHoIrW8QWH9vYoNFJ0vvGuWaISPy2thLYIHC+aI3C?=
 =?us-ascii?Q?Bgp+IJ3uWHo4JA/dKo+eA78wEy4vXu1+WwhdwbK7wPCxd+Xa60gRGhW+ZMw6?=
 =?us-ascii?Q?KnRX0m/m46nYPB8/sVLPBvFaxdMnkoEzxZpjxQBHmXeVRZk0ZPjC6z7MPPqN?=
 =?us-ascii?Q?lvYkxTEBKVmIQqH1+3EEHvxVg1uj+jGyKJ6hNx6CcR25V0M7Cz09gg40nCJR?=
 =?us-ascii?Q?GfM1SREkdChoCZiFTc7zGZ615VVBce97tQu10a3NYzcq40DabZ6g2jU5STLD?=
 =?us-ascii?Q?ofGr+LVdibgXy8Cf6bXQbktYn97JnlwmmQcYVEW+pRLrze3UYYpEbTVYyASp?=
 =?us-ascii?Q?Ye1Y8iZc/4cX0LOJGmhh9r/9gWQ41CG1+EGH9kvDNKRLWrDY5+Jjh0bTpNUD?=
 =?us-ascii?Q?K4vp0Vwy1ZVYlpuiCgEGoAxQ6Ep07bc170uUszh1g8/yfXFE9dqdTvoSdXHq?=
 =?us-ascii?Q?2iBsq3gMeR5eNEaERVD3b6CLyhZi1DJ4dIM88w+lJ7EPU719uWjsJF0YHYb9?=
 =?us-ascii?Q?15VwtW2Z/dPo5xEsXsDJFcM59zKBXn8wIuDUypfdExl4i7Ew3wwAp3h9peJz?=
 =?us-ascii?Q?EfGh61zsL0v5Uo9kya0eiI1kTkzsTYzsznLRFhP7LR1ROImVBJU2sDWHRVZE?=
 =?us-ascii?Q?kR2V+htz9JGV+0JEPosS7uficM/IVfQ8X4ZvpWr63oJKI370i50jtPyOPXDg?=
 =?us-ascii?Q?mUYztwgaoSJdIlNpMbIxR/0MKRnY4kIBm3wDe64BOZdJ9g3SKIlfQ2QyXQOQ?=
 =?us-ascii?Q?boOdr07xSc8FFBJ7TGkw2G+vZhWwY9oVrQcifo69pgUsA8mcuw5jB753Zil9?=
 =?us-ascii?Q?ycpErZ3UhRCcps/MqLMffNRF9QCTqSM4n3pZXERMHSfhdmBHOPD9fMGos89m?=
 =?us-ascii?Q?8lffFqVtzrjc6OT6empJbCypkvodAU4S5e48w5sT+jfHc9fgzacUWPCygnbG?=
 =?us-ascii?Q?XhgMVqk41yLF2YInrOM15kXxnXOgRp1FFrHOsvB/ZWM8p2JFE/VyTzFsKuRt?=
 =?us-ascii?Q?QZrRZK5pMAwZiYD6lz07dMey2SYBsKi9uXmi9iJcdsD8NRgLIYuQMQaZ/AxH?=
 =?us-ascii?Q?UClkGpKyK+vkQQ3fYPJQ5z26z+4ORCKhOqbqW4Qj1Xjp5EUREks6CX6EI/T0?=
 =?us-ascii?Q?eafs6ZdAq6r1WZg14+MpSI/5iyPa+zZjE6WoBgIAlnoYBxZoV1y9YPcMPBSg?=
 =?us-ascii?Q?n1S3i1WcXYdzA/cALAROaC4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02b6376-0a4c-408f-04d6-08dc4c774f6d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 02:57:29.7813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qY78S5f4+JLcLSQlhqJs+qoEzXz3kPb0JZHmiFtqGJ6q7dwlGfIDr9bRmyaVmbookWs02lj9LvTVobXy3vyyXjf0q0sMmmzaGpwoVc/1NJeE/Ad8iwFsiP+OdXuuCXyq
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
 drivers/video/fbdev/pxafb.c                   |  2 +-
 include/video/omapfb_dss.h                    |  3 ---
 7 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbd=
ev/omap2/omapfb/dss/dsi.c
index b7eb17a16ec4..1f13bcf73da5 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -28,6 +28,7 @@
 #include <linux/debugfs.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include <linux/component.h>
=20
@@ -5079,7 +5080,7 @@ static int dsi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	struct omap_dsi_pin_config pin_cfg;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
=20
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/=
fbdev/omap2/omapfb/dss/dss-of.c
index 0282d4eef139..14965a3fd05b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -130,24 +130,6 @@ static struct device_node *omapdss_of_get_remote_port(=
const struct device_node *
 	return np;
 }
=20
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent)
-{
-	struct device_node *port, *ep;
-
-	port =3D omapdss_of_get_next_port(parent, NULL);
-
-	if (!port)
-		return NULL;
-
-	ep =3D omapdss_of_get_next_endpoint(port, NULL);
-
-	of_node_put(port);
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_first_endpoint);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node)
 {
@@ -155,7 +137,7 @@ omapdss_of_find_source_for_first_ep(struct device_node =
*node)
 	struct device_node *src_port;
 	struct omap_dss_device *src;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return ERR_PTR(-EINVAL);
=20
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/f=
bdev/omap2/omapfb/dss/hdmi4.c
index f05b4e35a842..8f407ec134dc 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
@@ -529,7 +530,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
=20
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/f=
bdev/omap2/omapfb/dss/hdmi5.c
index 03292945b1d4..4ad219f522b9 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -25,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
@@ -561,7 +562,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
=20
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fb=
dev/omap2/omapfb/dss/venc.c
index c9d40e28a06f..0bd80d3b8f1b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -24,6 +24,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/component.h>
=20
 #include <video/omapfb_dss.h>
@@ -764,7 +765,7 @@ static int venc_probe_of(struct platform_device *pdev)
 	u32 channels;
 	int r;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
=20
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index fa943612c4e2..2ef56fa28aff 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2171,7 +2171,7 @@ static int of_get_pxafb_mode_info(struct device *dev,
 	u32 bus_width;
 	int ret, i;
=20
-	np =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	np =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!np) {
 		dev_err(dev, "could not find endpoint\n");
 		return -EINVAL;
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index e8eaac2cb7b8..a8c0c3eeeb5b 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -819,9 +819,6 @@ struct device_node *
 omapdss_of_get_next_endpoint(const struct device_node *parent,
 			     struct device_node *prev);
=20
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node);
 #else
--=20
2.25.1

