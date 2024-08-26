Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A347F95E6E6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 04:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2796410E0CA;
	Mon, 26 Aug 2024 02:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="lYtKFm5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24EA10E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 02:44:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ut4WifaeN1l0TFDqJuRKi7GoRaHhj4ZjdZXwJHMpsZzPhUpzbrp5wCpl3CW3yNyFn4vmexbyRbVJT4B4cKVVZpvzoSbEFuIkmf/IQfIxNBE8zI71sUlBDBK7LC53j+DsI1v3rbTynWoRxnyGNdSX8GrvCc7VuXltb3oY/PqMpkjapWyaBQgzUbT4j0N+7ybEDMPJgdKe/FrFfE9ADOUExBXpqbZ1mlbaYWQbUZqTJMeDNqOlh7ncuLV2k9ETBDNIoNVv7P3KhnZiROUM1X3BVhcBMO1H26xeHQ8CnRNVXIqbhTXvXcizQHwexXHphSEQFL8gpYBY0Uwe/26Dq1Nk2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqzIohYp5afmfF86fzJ9cHhouXOQhdLWAIzB1UwkvGw=;
 b=eKwI4th+l/lpo1WoDYAMFmw2IB7UCgS83JA7JRFyV0zrVD1cvzM3XlUqHR9whAGFKbh2ce2mHAVl0WrdbiQpO+d35BMN+Zr1oq92UTJ+HOAtWvo90jEz9yAgaWD1X/zXwX9tDv1qZ+4AaqiyMf2tXWmuOt3FYSghPRzoIVZn90z2InxpleRxuuFK/bx4ib+zd06uome0KyqdMLt3y4hREN98cwfzW/d2oBhx0Qb8m6ar8k6pqK+CQNARymAkMZMK9zPwsjlIBezcuPbDI4GG9rOTFmnzNG9hbccsMyza/bBrzKDNtnKKzPYhLN8C65qQ/ES0yM2K+QLbhSdWaXBHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqzIohYp5afmfF86fzJ9cHhouXOQhdLWAIzB1UwkvGw=;
 b=lYtKFm5Rp4ls4JS6AOvO93hSE4gW+k6AjabqVAg+z/l6lY7AWw1RGocUpdjWcUfpd6m3kuL6atqWkjNgnXl2Mwheousjt6Q43uXVj06kdYD3mDRgcJ/3idj3GB9AcZWl3pQ/1fxFpMen6iE2M/OFytCtTuDsrn07Fj3tXx19LEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11547.jpnprd01.prod.outlook.com
 (2603:1096:400:389::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 02:44:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 02:44:05 +0000
Message-ID: <87zfp0ovey.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 9/9] media: xilinx-tpg: use new of_graph functions
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
In-Reply-To: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Aug 2024 02:44:05 +0000
X-ClientProxiedBy: TYCP286CA0273.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11547:EE_
X-MS-Office365-Filtering-Correlation-Id: 98976b5c-1567-4512-27d2-08dcc578f3d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|1800799024|7416014|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PHHCG6H1+ydFZKdrYZ7rDoqBNFr4r/9YUqYWdxWghmt5HiXGRA46l+N8uktz?=
 =?us-ascii?Q?i35cmAr1TpW51qJEOgpUwqlX+mqgpPbkvKXP9UIAQLcDvXKuRWilzgpQQ9zb?=
 =?us-ascii?Q?dn9Elo5xfum/3paRf87Y6pziDDEWKRpQ+do85u0qSFsVRH5FXs1uQL1cfsKd?=
 =?us-ascii?Q?q/tQGl5SVhaPFRi2pkBPBKKV994MzcLb0Z59sSE2+GhF+vOefyOjalTyqNFL?=
 =?us-ascii?Q?yC6DoB7Gz7Di4x28c1H+RyAcdapU37gW+a/fu52NNnxlF+RsyBRr8TL9OFjv?=
 =?us-ascii?Q?NIQg2bQ23VuWR9nX5henwabdm6I6gNqRdhJ2yMirJVHBio76Jiha3rQOOSA+?=
 =?us-ascii?Q?KJFlyrr8o2dcJR498JBwzW1wxYNYNVT2NNO6vBKqs9YIlJsJitAVz1pYQM10?=
 =?us-ascii?Q?+BPEYnH251+MNV1/X9kpazSRcT3mxFci+GaZNlwdFP8lvmygDQbEWy3RP00x?=
 =?us-ascii?Q?66h+OHh0/hCv6MBwRypcRtgV3OHuIK1fml7Fb+eSdD3F1u9gXLQHW4oBs+1D?=
 =?us-ascii?Q?G+xYJcceD58fC0ySkIln9CI16/kkV6q8oXLnVpV70UgE6B9FdzNCpfMYqXhJ?=
 =?us-ascii?Q?hEGvX4lWTL6D054gZct6HH/727LyRP4WOSYPheRiKREen82YH68yGRZYaI7W?=
 =?us-ascii?Q?rLflb+Le6S/MaG6ulDY6KwJGjcAaIHA+ZagMUfXJ8gahdF4RLdG8O5LGcvYj?=
 =?us-ascii?Q?E9qyVAGfQG5ERwhnrUskB7aD8GsESe1ezojBqgHWLLm9uOTRa+55hs8OHMYD?=
 =?us-ascii?Q?QXtjrchWglkBDICh+Djy1qakUeTWnmD0zXgoqoQZP6ysUKmroQ9jxeFVFvAm?=
 =?us-ascii?Q?eeQCEFiSoZRXFnSL9qdCQnLXhnt9oguSQUB6qK5spesAamXivqIv0x0PXeAI?=
 =?us-ascii?Q?WfEmoCpPzapZQ+QqH90Cahb+iaqjTeRXcOzPTpqBArV9eL8w+YLt84voChGN?=
 =?us-ascii?Q?MvZ7yh792MpxSzAyDkumpREIMNuCjmlAuUIY537yAqNaSFp4ghXpeA22orkE?=
 =?us-ascii?Q?+FQ7W1K6r7G46r8xYomSwk9C4v9iiji/zYTWTvCXcPUN5nJdivIqzwtJhpxM?=
 =?us-ascii?Q?KGxxMsMilodsTrYdcS5nN1JV+ndylIZ4sC51NAzRLElWHPHOOvyzujdg4lF9?=
 =?us-ascii?Q?qO1tfqutYofb7r/DAjdSyxoPS53b/E7xutSHQtrCc6OobmtkC8EppqJEL3zy?=
 =?us-ascii?Q?8fs9kevJo9rPVINBN4AjoDm6kGBdDtL7jSiy1/FEIas8LLour2Cg54lipRnG?=
 =?us-ascii?Q?Zmiy0X27zC8xt+bsgELC+0SSuQ7BQy3fn1j/SvJaD+POgArzN+hv8sHlvHlg?=
 =?us-ascii?Q?MSHF7VomtbGGvp2k/WenOlQHEZ5fjBOSf0tTILoMW3CNDasTb2ytpm5SBFRI?=
 =?us-ascii?Q?i6ik+wBR4uo9N8py44Dikf5be05n/cUaetqSxTWC/n5VwlUdp+WOetP6dY2G?=
 =?us-ascii?Q?a6/7D6Ebcg0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(1800799024)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6RTbZkl5OV6Y9vOpvLJ9zB6+RNQKdhN6snrnS4Af5JLOtRF4MGJ/TeJ7WQcx?=
 =?us-ascii?Q?M52hKQGLsIByl3CS4LI1Mu7VNsLbULb2Ndkf9T0xUNKwdGnbTV81P2vbEd7Z?=
 =?us-ascii?Q?M0fpkepTiDZWMaYYKfORzox/e9hTO7f1wKx5pBkQFJKWcDLz2hxDj/SfPoui?=
 =?us-ascii?Q?odNyrVkaf1STeBnGcjKnrCBRD29PLHKQEKRFhONnAA4MgclZJaLX1f4WVipc?=
 =?us-ascii?Q?QaXYmxYORU+vTa79ReON6e+z9BNIyGicVbAYECkxdJkTzKoRaYVnZufwDidD?=
 =?us-ascii?Q?gw/Kh630KqCSntm6e8vCd/GQOryy3asWWMqrl8xuuMAWgt6QCvk1auyAj/7G?=
 =?us-ascii?Q?u5wrVaJunauSKIb2f/fVypZFR9FL3V+SYKqz5DwqwmKuahMrMagAY44tuF1q?=
 =?us-ascii?Q?fchk2ntDmB4hnribySi7CzUERNQONbQBHwroRYTTASjA3GkkC9rsksaSbdK7?=
 =?us-ascii?Q?D+FdHmqdXu+0aT9zinIs2P0gBhUYN8P/0XF3O2E2Z2gMEONfO0id+N9SMLG8?=
 =?us-ascii?Q?eROcIhQ63qsioIF3A2V7REy74YD8+uQ2dpJ3aNBUvrMm/wiPC0AJv+gisXlh?=
 =?us-ascii?Q?Vd3ARaMkfFhIWAuyUkgKZJ7dcvKS4yTofxCF9Y/z9VoKz2nARcKJBzBWB3aK?=
 =?us-ascii?Q?RjfIyzEnOaXUlAwiptdCD2AcfGpfQGeA2PXWhKR6mHQUUFTQ6rnlp4O0yJQF?=
 =?us-ascii?Q?tpvnwXqik1SO0CEVN3RVt0fMHrVKnZuJRxmF98YAoMS61PxBqb7/vX8Gpk4Y?=
 =?us-ascii?Q?SUIzDUabahvzQodcqBRD5N75Q65R3bt5YBbyH2zwOR7yxXKRJzgF0JowdH+w?=
 =?us-ascii?Q?KpM3LxYUUqB8fNcFhAv0D6/QZSzjjygJg+pvd+6O8DXF1zp6ulYcB0VcWhIU?=
 =?us-ascii?Q?vWPNQBX5mbfKFwG5cN9OBsSQEZHzSXQpBKEftXLg3zxzaBQYFQ5KB66xUFhw?=
 =?us-ascii?Q?vN1J08LRNdWhGwHvydBsMcYg4pXdCg0NUFVxEwr1i08R8yvehgQt6Jtl5Fn8?=
 =?us-ascii?Q?/x1gio5hzmj5ak4ti6TQ078HDVaVBypHkn6Cpb62+4SicYs9gTWNMKl/2aK0?=
 =?us-ascii?Q?xeFzsO5QDKuCLOERAkxtDeg7fDGTbxMgFociZf609OuiSYp5pDMY8g5aMXw/?=
 =?us-ascii?Q?7XUtUi9fEBVm2/HrJsyqi0xeYXaklmGOkccCE4yv+tuvsHVo3KmsLAQvzFDR?=
 =?us-ascii?Q?VOztwnKEt/XmFmwhcSd1pvTPU+COfX8Ll/aq5G8WcGZ8JH9TC5t5CcDquhyY?=
 =?us-ascii?Q?jqCtSFdz3ELKksreGsEnMJF5EdQoJG4CfRVgBFEMSS0QsHGtX7IW0cqZVKB8?=
 =?us-ascii?Q?nDlu0RHwV4snfwojX7tp6XO+RuwP8LFIkfRzAg6bAYAP3NDD+vuINz9qrP7Q?=
 =?us-ascii?Q?aLNVq86iLwIXafGphcCynhL6uTmF3P25SCN0drkOB5tHEs4kILUAMUyM9kbe?=
 =?us-ascii?Q?Wb2qwVlOHpUTzTfQ3n9OXRgfx3CF0ufpkTdZVG8WbqPlWamkOMyAN9+1qwxJ?=
 =?us-ascii?Q?UOkoCxOPJMpdyIWTFQ2ev1FfJI2DZhAMS5HO12PlEXNvl4+DELFmc9h6Oc0y?=
 =?us-ascii?Q?5/JjO/QQyiwfSjcZp1uGcas5CRH6xc3+79GcX+FjUgODY5UuyoICavZK3tRq?=
 =?us-ascii?Q?oP3ZCcrUWwCzTgppBiqGuKc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98976b5c-1567-4512-27d2-08dcc578f3d6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:44:05.8099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIianSfrJUIIpMvBdi6wPsUEkLjAEwhPf+CeetIGa796xzNJggopgQMTqBxfxDQelrbnACXZ59TNRuUYPMyfDmxXnZm0ytORhH3TxXaFvk/d8ZWBzHNVzWEKvq9SxZCz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11547
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
 drivers/media/platform/xilinx/xilinx-tpg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index e05e528ffc6f7..a25f216b2513c 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/xilinx-v4l2-controls.h>
 
@@ -744,7 +745,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		}
 
 		if (nports == 0) {
-			endpoint = of_get_next_child(port, NULL);
+			endpoint = of_graph_get_next_port_endpoint(port, NULL);
 			if (endpoint)
 				has_endpoint = true;
 			of_node_put(endpoint);
-- 
2.43.0

