Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A4E995D4A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 03:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6530710E629;
	Wed,  9 Oct 2024 01:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="VupuG6YU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EC710E62F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 01:45:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nf3Zi6gBIOyAoOMDBqxVITaFBG/7PKS/i1xRsyQByll91g53PMpVISNKKAli40syjClzMWGJR9U/eX5E6We1YlZ7pFRD4D+IJquJXSf/GK553de4DsQZVFmnTeC7MeKsw9U6VDz/DHmMP0IUaxXbfia+I41HfK8/CNUFfk0mNF2hUtl3704hZTsnJGbdlzjy18mY6y5RCekKsCY7L4amNcpPLQMUIDaJ7MBUbO2ln5p9EkPBTWLYXejshJhhX/Bp0/Ng7n8E0qa7b7eEwwUcAqMttDvge3Ovr6hvmLOSIkvYI8ET+qMjWlEU9EIGwtHExA1KhSIaKhaTF8rI3V6/+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJTI3fVU7PXFX1tjVUU8Ye9r4QnjQGrtjmmqI2Oz+XU=;
 b=lQdHoPFXZ6eNTEnhMh7DHRzUoZkuANdHnIV2mv9GmrWaFpmfHdIH3l+mLXlfit6cN31S90RPQFpf44XEG2MmfbVqb7W+oCB56R0LjqfHaNaIbTcJbnwZPalgTwxVgoTe+CvHMfu7ZJjbDE1wm99mIMXiuT4MyzOX9V0GHlQmLhHglRm10+HbxNMZHyF+68qn0n0gv/AMqmy0x6wSVO4XN5lOJmprefERvAq5arwMxFY4vG5mKTNqdUYG8UfxG+ya+ZOO+Xdx7HOPHurjnusY+qKWn+rT6T3fjeF8WX73ji26RN/bemGLLvxM+sdwct1lyxgyvDvxmKuGYcKzQv2cAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJTI3fVU7PXFX1tjVUU8Ye9r4QnjQGrtjmmqI2Oz+XU=;
 b=VupuG6YUiYKU/vXypv8a4TgGGfSOpoemAPNj1TqBvlbknYvDX1peadoA8z2HHkhlK/Ql5eAGnTDkoadW2U7XfkHsb7/yDiakd2z+dn3MCTHEXnh40W7m35l9nOVMvSlN2jMvXkdS1jh0U9TDjKBOF4Sg0H4zO3jHiFrXjkc9hcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8765.jpnprd01.prod.outlook.com
 (2603:1096:604:15e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 01:45:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 01:45:28 +0000
Message-ID: <87msjerqvc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 7/9] gpu: drm: omapdrm: use new of_graph functions
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
In-Reply-To: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Oct 2024 01:45:27 +0000
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f106ab-af44-49a8-af0b-08dce8040d4a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DvyQpDL8h2yJ5v8bWtpAabZtiFOssUg123VkANMZl6GHyCwuHTN3cgmCo0RB?=
 =?us-ascii?Q?91sNe5GsHV5KroC2pTHca4A4odHxZVa5YM9TznuWd3skHzKfdSyeTSBMdji8?=
 =?us-ascii?Q?V9QpjwztC2qhEqEneD6WFqYd8SErvc3PSXvc0qGUd90/f4TB2UASpFGsiCu7?=
 =?us-ascii?Q?TLKJmfz/vu6+W5pTXaBlC0BEQQmo7rygQZhnbTwUpszLkrzva0JM/SGXZakG?=
 =?us-ascii?Q?59EnFL4z+4nTluPHD8QJPMercSi43P8Isc5mah0Rc8pLM8sNFAUbbUhVnwTZ?=
 =?us-ascii?Q?qQnKxMhqEtVn8nXo5wjTUkpYdg1x9AzoJx6nqpTvfZajIj0aXRDDc/eAdweK?=
 =?us-ascii?Q?KSyIBBWCFD2r+8wDl3AZmEyLZRSv9G97an1KQ9QkYFo+rn6vhzFx2c5A0HVe?=
 =?us-ascii?Q?owQOHF8jVY9DPVy2epjYHqJp/a2dPCyO55+vcisCqHcfmOzbp0e2NRL9YeQy?=
 =?us-ascii?Q?B80vfPvpJlPJRv2dtF9xpJaotpmEAxLKRWBi3m+kVdZLRXvEsKwFdBhQ5wyd?=
 =?us-ascii?Q?XPmlPykK/QUXfhyQ8Cao34Kviwr0lsLxRyL+Tz9h72teXoxQRc2QBOKKivVZ?=
 =?us-ascii?Q?EXItTKGCjn+FUJ2bOpV4dgeW3kGVt+2xJtGlmbAmsH3zNzdN9KZfYRz5Owh9?=
 =?us-ascii?Q?TTQ3jiIz3pjKUbKFWdD+XrSyGZJgbcrBtbJr93TTNe5Xc9T/MtuWywxKly8k?=
 =?us-ascii?Q?E44O9W/BlA01l0ow73PmyoYkgEnaTcVzPld7B/4Vs4VjZlfMS7KG7MMExbql?=
 =?us-ascii?Q?77IKR54TvVqdPqQrW90uJTDIxtTHGl4vVO6/OLYJcRQcZxkNo/3BgY3Xp+2k?=
 =?us-ascii?Q?uuSYxfc37WyAi2fJVrtGYFj3h6nG7m+SEA43EIdhLjo1Wgy/BktmMf8mmHdi?=
 =?us-ascii?Q?Ushg+1MmEeLCRI8n4nvTMM5kAcF1IeoO/OkSDsC5CM4D9DbLQGmAddUklH56?=
 =?us-ascii?Q?A605401WgxnwmmK61Ug5xdgATMAJZ0aC8zxx5mbscTKPTsi9NuqN8NGQCjc7?=
 =?us-ascii?Q?9pYjcckzJN7WsxYRU8NtVK8DUfkPaTHN/EiMZYilzk7919vXkJHiIP/+2+xT?=
 =?us-ascii?Q?bPKtegsn9eRC+/ZfDTKJ4kv4StxkkNxKs5Hnq5l3/gtQ5dcyoSYsJ0EeQSE0?=
 =?us-ascii?Q?PlFn456HNagk0oPT1Cq9R/5uNx9LBN8eCgS2FllbWtzUvdQoxW59ApF7IFUe?=
 =?us-ascii?Q?f9+hbfANxVNtD+4cjWwHa23dytKQQngOTbRYXMf8j1DJuO9m6tlSp/Xv/tnx?=
 =?us-ascii?Q?ebWTR10dbSme5wusOUvhdMNVrJg5EWf1GYP+hGh7P7T7VyZhcjfx75xhu5JL?=
 =?us-ascii?Q?DAsHD+mD8BE5d9HYFWU9fPt49l2xB1PbmxLIfE9gZO3s7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m4kW0iXR59GUOoOQy9/upV87YwF0vZu8Xu+mArDHHTMLRxc30fEF8ztYle6b?=
 =?us-ascii?Q?G056TcZp7OnR8YKhAmXNydOomqYyYiswn5Fx4HJwO4PKZo4KPuerEd8tw1OB?=
 =?us-ascii?Q?MFX7OY4iK3vU1AMTnpBecMFHcQoQ7YLbz3QkrbIELx19e6A1z+3CXuds9rPz?=
 =?us-ascii?Q?iX2CpTA4sCKzwgw2WEaIrBjwrNRUC/tWDkwvdHQJZfoodWyhUwEwYHgGhl9N?=
 =?us-ascii?Q?wE9t2y/te0M7ak4RB1P44R6WgwjIWB0Oa4vhWk1tomrHcEfKJCTgSH8hx5sc?=
 =?us-ascii?Q?QWMd8XVW956T9hDi1lp26kg23+FokNoOw5ZafTs2ODn4Yv11O3vuQxraj2hM?=
 =?us-ascii?Q?jXKdm5HomeI89GEoL8XTnYjQUMIIhy9tlUuLYp7E+J/G2b+GEpr73C08vC7m?=
 =?us-ascii?Q?rCVFiTzjGvP3nz7RQOmqrOabsWxWi/cdMJXf2X3VWPLV4IQwjW1aZgnXSPSa?=
 =?us-ascii?Q?ZcCgk4nbxG1tgeFXfhBxS7R/k25lRcnRW541iJl16VV9otiQUMcTLXIlvcIO?=
 =?us-ascii?Q?5bxhljM+0GertSZUZNPzzTbCK/11wLqoedivRuqEhT20jj9P9KUQQbTNR56O?=
 =?us-ascii?Q?5kk4YZEeXHae5P8zOro/4gNvugHTYQDiT4v5TUZMMDobwpmoIsvoJV5Oj9fo?=
 =?us-ascii?Q?ClmXcYJEbE7Ww8xD6MndX63PP3gfMhwMTdfFk6PrhcC104YFQ48Ou69khaUM?=
 =?us-ascii?Q?8mbWuCR7X57ZM/Ggkb8WSvxTCN0HxrvOFFAfRiqIuxHgZX0isYx7kkRNRwvj?=
 =?us-ascii?Q?ZlXQkgP90aitkwuY5LnjqLRDhbDvz3fjLdhK4Ydklz9gUd7AjpGR4iFkxjUe?=
 =?us-ascii?Q?cdJQeZ8tg8cYow0zVFKX+onyrCugCKqmhaWK8iRp6qG361/76CNyxof+m8uQ?=
 =?us-ascii?Q?+gXPRws6cku3TAjckVa2FDFFO8n/78l1fQZ5OM8fh3XU0a5hbxcGvInrZU4v?=
 =?us-ascii?Q?WbFjRgiDb/7Sa7YVk2bm4gdWv2x01ZEMsJCoZrzgZmIBjK3olv+qMmX/5Cow?=
 =?us-ascii?Q?8mm1kZgdYZTUmwPy6mlOkpDOwj4GJxcx1lkkWHc2V/27joiq/PehTguu7Eq7?=
 =?us-ascii?Q?XdTaJJtR9ebJGfre2QXYphiVGZMOmhjH6S38Rn9munhP6CjMYw4CHVrdat67?=
 =?us-ascii?Q?KESOvIf2FJ8QI66SxGuoYYgbEc7/RF884+qu6Qs7lovBmN3dK7CdV8H/AlHX?=
 =?us-ascii?Q?MKUmml5tpP8CkyWKTYDusECRe4SgbBn1ra8rjNPAGyIbzbCZ+4EoZUuYq5O+?=
 =?us-ascii?Q?z6dLEt2mXTcTxcF1sxDvTnflDsbudB4kx0ZE8LBalCoBaDE42At5qBDUfsX2?=
 =?us-ascii?Q?MGS6LFImp/hHOQGCnOVntUnGN1Q6JZMxiYlvqbw20DjYZ0OtJQv+xabrb+no?=
 =?us-ascii?Q?0/L1b97ovBXMjS87mzh7Owk3SgxF8vONoMQpZp5aX9nuHfuoN+x10sDlin1D?=
 =?us-ascii?Q?SIvDU0OZZylILX+6DQYi5hjxhUBZqQ06YzR0WWQXy9z69PO1JznQJcJXmhkZ?=
 =?us-ascii?Q?5NL6MZ1hGwfjAJItv9MhVpJ0R8zX4XMyQ9naaLeULT89bIiE74DjgOseapjT?=
 =?us-ascii?Q?IaJ28JDuqWnLI/zZTtj/sjW77gQDKx9lFpPYt4iSay1+NamakufZBNTpLv+X?=
 =?us-ascii?Q?XqapYJzPNdT+vKHQDVGGPmI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f106ab-af44-49a8-af0b-08dce8040d4a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:45:28.1370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hy9SQO3T0+JX2uoiio0rs5dO2kBy6XjG4wQyzUKDWNO8hrD1XhSdw6VGy/pQAscv4Vi+Ng7smsr2LkvOBsgQATy/GqUGyKHywEFwRjsMEzBQrPnllQnjfYX3G6wHvKVf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8765
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
index 030f997eccd0..b17e77f700dd 100644
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
index 91eaae3b9481..f9ae358e8e52 100644
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

