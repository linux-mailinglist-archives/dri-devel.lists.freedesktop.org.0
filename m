Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A40F9488AD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 06:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8916010E2F9;
	Tue,  6 Aug 2024 04:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="LX3BRmY2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED44010E2F9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 04:59:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LO5XFy6gzXEFgmxUxL+N5JMy9IUEDpQrewOt0cLIN/63bynJgEaLi1BLOixffVDTnUyYaXQUC7zMzdY9yKe6wmZF8QGxjTgHKovs5qTbsbYOFJbc0cV32EkpDsfoS2ursmr8v0wki6/6utl2Ok3COIs5mfdp8WxDwD/zpi744JDGbAXjDz0+boP4+TCStHZL6WimMEFK3gFwxIwfJp+sZjSzEb4TGYHDo4/yaRjTIDUrvCpNIqARxdN6E/qlIZI0/ypdL6Ejm1rfFzVUYcFhqBjDRvPuk+SyMvaTz+5eJFa3sEqGnRolRqBtHjYLAZwOlB9ne9hUkS9/D2qhcO7H6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfCyx2ONYkUviuG/wntP5QJjjUOMYcCOHdxlqwvAle8=;
 b=cdOrUm/WxvMRV2F5oNRooNCaCnK2dNcWgqumXtZ+ilgp4xH2PMEeGmJjfjuGmHkYJbsp9eLY9/47ND2uJr9fiRCXzRP2ElqdQDbgBFuzVoj+UNwIbvUyyXHazawSXSE5AhYsevYFDjn0zewlCOTflHwFdiU2kxwBnjlHyscLgkYMe2LtrgixEySPYeebQ8oqseViZUppEIYjxTcw7EaJAMI0wPhApDcPl7UK7XNwIr8eWF0zT00LsqhvdO7+KPHujlcQYTwXm7jt3eiTdzqNQ21Moyov3MmoIiIOw5Nu1k7DBIB2+qL1OqWdk+Ua+2N55Z17htg57Jsq8b9KOBG7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfCyx2ONYkUviuG/wntP5QJjjUOMYcCOHdxlqwvAle8=;
 b=LX3BRmY2wiBM2Tr9EMIMgkNOcKWx78SUfUSaezwnOoEiWpAfXBzGCHi7AU1zbS8UWqJQVTMcyr8eaRgLXFI5kGjdB4YCFBriBom0VCDNfwpwSVGvo3Okfyo/Y/hfWp083YtL8IiHg1lwc2am7JRj1iFHZVQBzlVANVx+iWzwzFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10409.jpnprd01.prod.outlook.com
 (2603:1096:400:24d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 04:58:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 04:58:58 +0000
Message-ID: <87a5hqw8kt.wl-kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge
 Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
 <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Takashi Iwai
 <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-sound@vger.kernel.org>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
 <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Takashi Iwai
 <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-sound@vger.kernel.org>
In-Reply-To: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 9/9] media: xilinx-tpg: use new of_graph functions
Date: Tue, 6 Aug 2024 04:58:58 +0000
X-ClientProxiedBy: TYCPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:405:2::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: d850030f-4b6c-47be-ad0a-08dcb5d47b6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hD9ex22NANUR4oTbfSgGe58AY/l6RtpJJ37Vpi2TitYcEMrZtSgMbb4/cemR?=
 =?us-ascii?Q?0RVw91ZynqzFF9dDvsynddg6Vk/zTXUfUHDIgfMcLxjVlowe9tNCppdTvK25?=
 =?us-ascii?Q?2ZIUhLCexE0cuPYN2oIIy0WwZnoxvJ/i1TrKAvi3Ff5P2IcH8q3MDrwYR8k+?=
 =?us-ascii?Q?Xcbj1Mfg+PNyaJu2jFuWd1TQ0QnnJhIqmJITy6tfEJlntTUOgF61DiyKMMGi?=
 =?us-ascii?Q?SvtMV53NQcgnFe2QsrofY1R8OBSk5LyHE6w27WYkHK79CfZv5qz1NtZYTkWJ?=
 =?us-ascii?Q?EdTA1AXfvS9JOnP/0yKf80kcM6OQ+O7z0I8+Ri6bUdFS6ZyGCQ7GbtUvhhZ+?=
 =?us-ascii?Q?wZGaDjDQKMxxt3eb4PfF6oD9vW1j2+IkZFmt/U+iZscOUL+W6gJS+KR2sE9k?=
 =?us-ascii?Q?KgoQqHoNDbA6J3flrBoB517FXu6jhByzhvprft7hvePxmsr2ugc1LKTTdtxu?=
 =?us-ascii?Q?NjH3Q7z2ePykmQciu2qgFI/NPPjB3YU2unn1NrMhvbhUnypf5xTfwVGE/Z2W?=
 =?us-ascii?Q?OapO6/k7CT6Jn1UZidxMEooM6oeRhzv0vYrVm15w+hUz13vC9WNlhcivDkGI?=
 =?us-ascii?Q?lK7W6psOfSeieoy9r24iuUoy0LbxAbZvkVL6ixh7TsCYwYFAf//N1/fopBzT?=
 =?us-ascii?Q?DQimhT5eHsw59B7SGfuE+PwPfL8lgBdO6YsYhFvljist1Zyd+NICDPZ8HOfZ?=
 =?us-ascii?Q?2JA1SmKu9pgi1Tk2OrLPc5GxY8B1f/Ne6BIh5nWw+V8L2nXvkQZCug5i61TS?=
 =?us-ascii?Q?sO+8Kh0UYCkpPMoaApg0V3+K8vu9Cx26prRkhZ7f5l6n6GQb9dG4n6kRdWXx?=
 =?us-ascii?Q?BLP6UaUThOYD8CTRAUPdSEpbRL5eJUVAtZvvrgoLQRUwWJIxHKMv3LccO0Sr?=
 =?us-ascii?Q?UObYB0bY7GJU9wG/hXABS4bBo6mfZp3FdVfn4C5mtNCp9Bbn9Q7bXm23U3UH?=
 =?us-ascii?Q?Aw3yl85vyR527wyGdikbAry833eh0dO0akyH/0Qu9Nnoax9xNijKr1npnVQr?=
 =?us-ascii?Q?byGvl+mEIbGas36yfIqHosCNvA7jofged3EVj9RwgBYqg9OfBPrWM1zXlmbD?=
 =?us-ascii?Q?hRq7B+gzfmOio68fZuvWvH9EkeatXw25c84i8+yowbMTZ2CvqS0H6KHzN5gf?=
 =?us-ascii?Q?vecXDuwKqT+83U3i/nRV4TxRaajny/GiBrDlTAr1YWZuPTT7CLs/+ST/ZeQM?=
 =?us-ascii?Q?1ax4Oywl9IfMwY9VVPrq/iUd4eeNxDNDqTfQz0q6BitgcZfPpqNS9rC3PHL7?=
 =?us-ascii?Q?vZ9VDh1G0JGu6eq815m8WZCNjt9+8ts7oiAc4aSKEwJdqoqWnnSRr00gBJ6U?=
 =?us-ascii?Q?2jDUPaTn6y5Yf5TeC5YxpsSsMNsW/GGrbztuetzih1DelOQOHe0/XLwFFxJa?=
 =?us-ascii?Q?4dtEh0QWGQA+0IgY3+/B+4k9Wh2Pa9FZcI5hK8n93OTKEdDMViXEtaNaa70W?=
 =?us-ascii?Q?mskGGKeG8yA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K2A7+Io3LRV5TDkHAccaQn01JvT8gbhCooDYkVAMKhsuzV0TXjY3v4ox93IE?=
 =?us-ascii?Q?FY17PQ6xBPUuNDFg4nLxuUq6DacLxwy4em8xDPGIuokCCSXQSPxKQqPJJ5k6?=
 =?us-ascii?Q?LIvqbe5DkczH4SLJt4gIuPAhh7WEdKZK1FSUFIhQ5JjCOIcR8XcsaAEDJUY0?=
 =?us-ascii?Q?XbTs6uYSTg2ovczVxfA/tR7a4Vekq+bmWhh0JiGq+z70wLmwwZQuUCY4WTZP?=
 =?us-ascii?Q?bi/VVJzdEvkoSgy/AGxM/n7uRPn/HfTYr90B5C6v/rNRr8x6bVnuEPMZeF53?=
 =?us-ascii?Q?vtxSVV80v0yeyiVDdFlWbVQy62FV4qZrHD/lDFD+jmRLa/3R9k7jbxaQ2u0v?=
 =?us-ascii?Q?sVLHfWDB+NgS2dJD/He0VJ9/0UMxx0kx+vnNKHHRyVCV7e/lZh6yQ6H7wY8c?=
 =?us-ascii?Q?7qmvcc/+Te9bMtXUU1anXfjd0yI8uX9krL42TEypIKhe+J1UMxbSxZeOxMUH?=
 =?us-ascii?Q?wKSb70A1QQzb4YreZ/5oA0l0YP1A8nnVsQ79pX2KvuF914IxMLlYdw3kYQF3?=
 =?us-ascii?Q?hWnAmk85meks9FHHLthCUjdBZbwtgEyozFIxgMTlNvPX4qHpWU0zEWQfufEG?=
 =?us-ascii?Q?eU65ToV0TapPW1RAI1Tg1QYuGuAEzzsEDwVSyjidwMyDuuZB75dqpbN72PHm?=
 =?us-ascii?Q?1HxBJBRd5lblsX0q8Kh8+bNjupr3CGiBmZ38Nb4VhyP3C+2zvpxRQjNoZv1u?=
 =?us-ascii?Q?oi+pwQ5AIF9Woeci2ntkKHUkwSsZLZWsDA0iaYJ8pPrDBgKi8xLH7xETwwL/?=
 =?us-ascii?Q?kT6+p0CjoIqjKLjqX3Bhslmj4VClIw5S+4mJsrRxwtKD5W/KVaANlkhjcMNo?=
 =?us-ascii?Q?hrCgXf+qdiC5ng5e7d8Q/K4MxIh22HpCIpcy90nuzWV3Ap6i58+LJZMbuhet?=
 =?us-ascii?Q?9e42g4sLL9vxX4eMwtdxT9/ByHS4u2oSMK+n8tu8rnUqyX0AhP34Z1AT4FPp?=
 =?us-ascii?Q?mhgRpk5CpeMRXZsJFgafHX9/xizzCNeJzjb/G97vKV/5tczlsWKv1v9YsQjN?=
 =?us-ascii?Q?il+TBKXrix2wlBCSeDqAozwdeWJPItU3hsnNq+RSy7YJCOgwk2vXOnW7TP8q?=
 =?us-ascii?Q?cdDZia2hQ3sUAAHu5baEFJc5euLdOq+t6ylWIA+Oxtd39FDZodZAvMf7L3k1?=
 =?us-ascii?Q?YQ7zSIIrVN2fxt5vJLKjwHvOsyRCWfn8PUMmrswUT+nfZJp3q8SpdDth+fd2?=
 =?us-ascii?Q?JQ6Ls5SNiwQF/1WCI1ne93Nx0t5YXDWlJKI93T/g08MFGH9YMccNfEwVjIEt?=
 =?us-ascii?Q?wVGuBbeA9ACmtHzfSkd1nRScNFZc8IeKqdpaztU6uFCvTouYVSKqGeLqkzyc?=
 =?us-ascii?Q?f17U6CqDPnWJCfn8NCCDAuAmD8LGwEPv/XphnTAQiZvwxVGWl1NYAJ2rEL98?=
 =?us-ascii?Q?l97rCqCOZ62r8DX8A1lPAGkfGFzslnDhCGlxzoTTXuT1vbIGs0pmGbhaf0oz?=
 =?us-ascii?Q?/GU4ovdISE256i251Ntl9CepXdpta3XWPJPkCyinmgmtCa4HNRW18C+6XfJ3?=
 =?us-ascii?Q?u/d8+zzIRfp4ykUZ0Ca4HWGSDCwEPg8Q84JP9UfWgLs3aokYzMeXTuHS2fpy?=
 =?us-ascii?Q?+oofNjcaXyN+519nsbg9j9Cm/7Xae4c2U5r0bIrkQfMGKlVI3tivbdNRGMYv?=
 =?us-ascii?Q?P3MUSrf4Og6PLt+wLDkQMsI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d850030f-4b6c-47be-ad0a-08dcb5d47b6a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 04:58:58.9034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4UDbrNHclDXVB3kWYodYPBLLdyrh4EHbmPhpeOAtepsXxSFVv9NglxNM9xW6bWbBWmrqdsYVqUbdn8OqXNXR/QzYNGm+vkMmHypIRJPxth13MhdZav/nFVUDeWgjX43
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10409
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
---
 drivers/media/platform/xilinx/xilinx-tpg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index e05e528ffc6f..a25f216b2513 100644
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

