Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD22961DFC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 07:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60F810E4A5;
	Wed, 28 Aug 2024 05:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="HO4J+wn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BA310E4A3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4q99qRDMEEEos30gYTovgLVQEDbPtha5gWaBH+4fniRNIdP+UcWXCkO5BThpnD+AYR82S1WYbrBBIS2JCI0GgM6OX9e0+3Bwl7E+gm3uvX3n4CEe6oRmb0FgkXlYoZ/6XDHAPxpSzORqL7Bvgm9ZraFOvco+ITpKWUACfTSQHBf9wrdk00sMgxrIInAV7jLr1LU9yHOq53BZXFXZ1PekVGIj7TjkgoouPZ/tURivV072uEelVFL02VcPDTsanmpx2zU2sENS9gbPPsL8jx2e40ANEZsmYAj7I+Ht1PwCxdGCfoKZRzfknNINsLR4LJL/yhEh1yilQyJQ4xVblrIaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UeslM4FQH6N1O2L6SqbvVyNONUE0o4X2TQYeq8tCfA=;
 b=M7IYzIIOnHDAgj+OgXA6Ds2HHlOQ2ne0nf8ncdfgf7awCXZr+cisuI7GiW2/joZ7sWR9WgFTEUvvPOrXmNaKvcJpewPN1WRu6WxOmUA/47IBSN0sEtWKrRg4PbcnPVm2ex2t3T7tPT93Y4fPJfzkXmyR/m9PnUYJ0BdE+U4l7LZyzmK2Qsk0Ki1B5flmHeCxvhGA+9chF47B+nslsqSPugTMTjrLb7v8qh9TL6lYdU4ezSnMx/11ZGRYuqFdaPZm4JK2P4e9tgTgIxs1FLA4AO0lfgSSXzUWr5s+jmHCRyo3DuNoGQUQkrrJTHNv8QdRxShh/F9wpG7j4mNzkMZDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UeslM4FQH6N1O2L6SqbvVyNONUE0o4X2TQYeq8tCfA=;
 b=HO4J+wn75TXcLCKs663XkcQHEhidWQAdaFui3T+C9Tn1IehZ83s/MNmtnzu5wjOUX9TxhDi1i60/N+wR6LFe3YUr7ytaFghEmhoxX8j1BfRk6ly1l5n38lbKIQZCGLnVEN+Gakz7gBKyY6bDJ+4/4oIA4LxEFXomxclaTirmlfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11955.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 05:12:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 05:12:16 +0000
Message-ID: <871q292pu7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 7/9] gpu: drm: omapdrm: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
In-Reply-To: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Aug 2024 05:12:16 +0000
X-ClientProxiedBy: TYCP286CA0345.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11955:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a68700-1a2a-429a-549a-08dcc71ffc06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ky8X1IsS/NowMGa+vZm8WcCLAten1yQOyX8YvoMzstGcmTDV8fZxSP4E5RGV?=
 =?us-ascii?Q?v0NoLuRSZTbrHVvSw0skZfMKsi1GqZZ6U7tRgGGm5qgwPyjGIuCDBkMRNQ0k?=
 =?us-ascii?Q?Lv0NLdMDi+8bOU9NfjpSSZZRPGm/Zle3ADOZl/ljY0D6RFPZymV+zqIDGda2?=
 =?us-ascii?Q?D7qt/hBojC+9QEVdShWjZY5FjmwpZcPK7PceGXcmnlqDfQfnK1yLiKHwV4qu?=
 =?us-ascii?Q?47a8mCqFZzMat/XEUd4pPOPQqMA0cQLtHW2Lqi0N5/wwnvUpz1KZk+ZyMVkR?=
 =?us-ascii?Q?9sd0nEFBZYzNU3UzbkFV29j5VQnG2c8yuswOCdvN7Go+ZfBMZg4Si58ZsXr+?=
 =?us-ascii?Q?e2BOUKMxyL0l28aSWMW0rCwRj82G/yULukrRMNhLqG6HIBmi2KFjlaMs1l7Z?=
 =?us-ascii?Q?kdAearVgBiB4BaGlMWgoE106DNbiaBkYTqe8BjIs2FONB+zS/f6C+6O4Akh4?=
 =?us-ascii?Q?HT41uX6bFCxpCgTuMaCcr5c6z8xrx5XJwtpeKaNci0vuIdO20rehUGyRw2B7?=
 =?us-ascii?Q?Xxbl+hJOhPSDePb7uLZIYzLWJKoQvOOv4yRbzz5mc1dXBMOvPv3UN82621Vv?=
 =?us-ascii?Q?4hCy1erDpORD2hyf3NKoBYR4JUqQQuDfI31yXQACzzEVKZAgklZ4rWOUH9SI?=
 =?us-ascii?Q?SFo7968QrkCjUkvNOJql1UI3waKfw9+IrEArJuvfa8KjArLsBP2vxDEr9b1i?=
 =?us-ascii?Q?sXVxDPegy5uj7+0qll4CQvGV9XoGCpErqambROYh5u9jWbS+SO/cMpEiHIP6?=
 =?us-ascii?Q?RodlvCztme0UXsZO/VL+hK5ERGYzoxYjujzUqMKhYk865/PX1v0foY76vD/F?=
 =?us-ascii?Q?uHZ/k2/Cop2s06zor745uMx2bBGo/UHlEW0AoF4qYihyas0dS03JNInaYbpF?=
 =?us-ascii?Q?QR454XSwjiuRzn8aFZk0iE8FbN2X1uAVlbcRzIXQoZpG5JHzU/lZHpp7JkV3?=
 =?us-ascii?Q?SFOa5efVc8AZkgFDYlKDZiUdS9/WLX8bthzhcsI0nBHMYjsLTSKp1QGlavwp?=
 =?us-ascii?Q?VavDVbRCIjJM15ouVNSslG6+tmF4tki5OTHSVz26uc0ZThjqCF4SskrQeYyw?=
 =?us-ascii?Q?ABixh0MeKvKBjSMHbfvRtnTpmSW9R4BtdxMRk3Dbo9RNvm0pL+9Vnifx5H/1?=
 =?us-ascii?Q?eJENzjuUheJoHLGMQCcZUYBvTG+zzdf45iN6W65BYBKGogO7NhYQhFG4btLh?=
 =?us-ascii?Q?48aBEfYYC1ScZUyyQIA6nm+6UsHyaezh5ZKG7ObNADF/QkYk7l1m+ODjfwFr?=
 =?us-ascii?Q?pNph/yp0+bg2abdByXgBnIDCYDMtTa5WqrjcmXnNJQVOmGIXtjMFpaAnqd7p?=
 =?us-ascii?Q?fzxrPTS5OFgmwi6/TGLcoWcqNELBL4nHK9r2byCibonq/bskNMLTvZ1Wn0s3?=
 =?us-ascii?Q?0m8FvdeL47mQP/yzV3C5JcPTI1nbFAT6kxRdR/rnFz4bF+pHtz2OFhYXGLYj?=
 =?us-ascii?Q?2Uhy9lLjXlU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y0HXUXaub7zvBCWbqhHqVlo/o56osM/ctCzpILZB8h5k/6mGkbx23093s1m+?=
 =?us-ascii?Q?6XwHctlo5HTjHGQrwgOfEaLyDNXCo46RA3w5tFkbH57c1PGnthdDqwwFeENR?=
 =?us-ascii?Q?W8+V+5bIWGOiI2z/K8sFbkjwKdOlfP4IHtbwdjG5b1n2x34QNDWEPhAK+m11?=
 =?us-ascii?Q?9qljaP8wcNWSGkK1eC9/eOE64IB1ENbONmAZzy7GtF/SqQc3eOI1LT7qsc/g?=
 =?us-ascii?Q?AvFIuGPjwNNlyqO4GNOeo2z+xZkWib/85vDvkZp46frsvFefQAUNndUZBpjf?=
 =?us-ascii?Q?IdbUSFoC8aVS9pq4pN1P/rDbX8zGCzsILZWgLTQfmEwwoUOGgqBB6L3Zi/OL?=
 =?us-ascii?Q?Xbrk+RtOGzbRv2pLWCjTvCgbYaa0t3WIuTfwWIDnn9hnhDi3UedlqKCCO29S?=
 =?us-ascii?Q?CtVH/TgedejCuES5TtBRyJubd7U6ENLVCXKwZ+17cIqxBftbpvh2mG2Td7Bf?=
 =?us-ascii?Q?/QJfpF6tdFTfpUtUoGFzUv5iCJoRWg5xBWLT/2x7hXMEe3bmNzxIu2lv+9DN?=
 =?us-ascii?Q?skuPEYMfttAQqhzHW7OoaQ63YjPxQhKqv3zrssdl58x2JiTNKmImjCx+yqAz?=
 =?us-ascii?Q?/jLCrO9yiRKHZsg/PpAjvryIh0ONmAb6v0aZZTbSnAdxq1WiFMG54CkJGkbu?=
 =?us-ascii?Q?O3mJpK1vwWiNAinAp9wtQqyyKaFo6kGKsUnfepqGo6nYlv/2PjhThaT0atnn?=
 =?us-ascii?Q?ujJURHDostecGq67/z+wuueZbKHKBs8CdYCMZ7d5GcPYN0GNCWUXczE/Kb3B?=
 =?us-ascii?Q?zBrUAN/0XNF+JoTV4dxh+qq0teYGunNguTMRNnoIC35t/6i7PD7xkYwNA11j?=
 =?us-ascii?Q?hK6y0s9cTsVwqmeu5Q+8R6+M4eoH01TesZejiIh0JElzshIh7lc8N9uZ/wOE?=
 =?us-ascii?Q?sk8Ro1RLFJFdjIbXNvKcM2Kk9tUM1dcw6adS4R8t07fAKn73hjcbgjkgtsiA?=
 =?us-ascii?Q?DmtMPijmRrwKbXjEkVAJvv2fcxeKxYCQ4GY6lzN7XMny6vc751BWUcFditSy?=
 =?us-ascii?Q?VKcfRLj5xwhLTxABio8alcSW8ptaswla7i6O+Eop/6ifCPlGJCdjnITDcHnR?=
 =?us-ascii?Q?Q0rWZzf+m+e9SfNXhF4pZlXZnIACvuoUEE1XoVqR8lsa75Cd3EWRpD1ZXxWq?=
 =?us-ascii?Q?OYzGOLTApKezPD2PTyVg0YQ1rUZzhdtNQTIS37AqaZ8ry4z5vJOGWdkwj4Sw?=
 =?us-ascii?Q?0nTZQ6WlMSYKdJd9u5DJJnHdaLe+AteAXI4w5q7wCuumpVn9tBa6Bp1zbl1C?=
 =?us-ascii?Q?pLvJwgNVpIhFjFjDwiOo0n3PHDdYH6qThRrZQCgVtv4cs8uZfx9F0c/TwYKX?=
 =?us-ascii?Q?WjGnN2LTl6mCuINfh8QGgQG7SmRrYnfvpf1ezkQjxFOD251uacsEFkN7pBy5?=
 =?us-ascii?Q?TRGZcOhXOHyuDbPZ7v95Fuc7gNfz9XX9GAwI88ipjTRBRR6fFWV4XGKWVlmV?=
 =?us-ascii?Q?SDHy9gScBOr880lXvS6YdD0KevMzulz9FgFd9fmOh2UsRRbz217txEGYx/vB?=
 =?us-ascii?Q?Nrii633pUd3YmzdOXf0iXJxxfOp4IaPfwv2is58u2npYYPa5dpFkD4/zTp/l?=
 =?us-ascii?Q?dmi6OTFnD3J0knDJ9p0OzQUK0Wkh0t6+6zCAmwDer2J8CzDHPt0L3qD10k/G?=
 =?us-ascii?Q?BBzQFGsbxXOWWaZBi3AULHI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a68700-1a2a-429a-549a-08dcc71ffc06
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 05:12:16.6671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MN1Y+2AKXUIL5iyj38x5z9w+vwaqCYKGRF5BpeP0ZNN6NSsjV4R2WpwdOVm/lYJjTyj4fzli0jbsJYSZ59WA7C1cpcXMZcDNbtFirSqSDuI3yvYn1FULiWX0fTefKsnr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11955
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

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c | 3 ++-
 drivers/gpu/drm/omapdrm/dss/sdi.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 030f997eccd00..b17e77f700ddd 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -16,6 +16,7 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
@@ -709,7 +710,7 @@ int dpi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	if (!dpi)
 		return -ENOMEM;
 
-	ep = of_get_next_child(port, NULL);
+	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 91eaae3b94812..f9ae358e8e521 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
@@ -346,7 +347,7 @@ int sdi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	if (!sdi)
 		return -ENOMEM;
 
-	ep = of_get_next_child(port, NULL);
+	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep) {
 		r = 0;
 		goto err_free;
-- 
2.43.0

