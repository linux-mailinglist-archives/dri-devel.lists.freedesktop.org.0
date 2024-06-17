Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6703490A11D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 02:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C3610E109;
	Mon, 17 Jun 2024 00:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="KXENqQoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2068.outbound.protection.outlook.com [40.107.113.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E244910E109
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 00:59:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHKtHRzTbq+VZtgeRRG8SG5165fgktfO8O9ubk6Yzhl/GyygnPCCmoqVcmFxRHdAytj1G07reCdhy4sJtMvvXgE8lT/OvOoQ7mReid/swFDZ6NUQbMhNShUbB40sFVg7lZ/Ic9CR/TeZGROt2VrK5wsOEzjYH83Wae6/dJYg/npawx4ROubnaxAoXXoJSAuggkgdPyVmZCQUgSn/wivHNz5gpMGnGYxVGhs63tvoEetuOUkcKfdVqQ65QYhSWWCRPL5mTlo1lt7V4IShrRG9CXtbYNUi12IOy9oVaMe3Kdx7nkp6Onr4pa44ZAXXpTTU8oXAHZQLgVUZt1pkZqflWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJeioO+EW3xq2nPVxpRr6/AxHxgv9TxbDqgwEZtHUFY=;
 b=QH2ZJGwdY1NT4rz+SO4soeRmTHFn/34CGzP+UGo1u5VJToz7762GBMEk4hlF9z4lZz+2A8R/njD6y4LnBcrsPKY4+YY8ZfrmFBGf6QD2VU3CdjBactuQyPd3cvP8Li6HFn7BAO1a9x4IGksb24oD+ATs/WzBzh27GAHWyaLlVzATBXZpPaLBl3T48XX3FnJR5IbOJ1EZiMziClsKNI2l4ynIHTx6M2XO5UaTonzahMd8W18mWS4d3HLcY9pq3nh2ZNspmJg/KF9wXfmfImpcs4im5KCSmIXeSQ+bMZaa4ZaSWnSb8WAmfOlc6sfNog4wUgJFSTiYAzoiBIeEb3yPWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJeioO+EW3xq2nPVxpRr6/AxHxgv9TxbDqgwEZtHUFY=;
 b=KXENqQoT8Q3jNiM90kvkE6GDl7UKQjvXqQmZYuz9GFV5i7WQfcl19ECZGNQuVlnI8I3PtvpUj0Fkh9OgVW2IwiDVzU6cEW6fUZIka8ZjFHcUoL8OVQSx2n9SXUwDh7qb5abQWub27AbNugp7uyAgsT5Tlcq6pQINNwvrCuDZgws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5663.jpnprd01.prod.outlook.com
 (2603:1096:400:44::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:59:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:59:34 +0000
Message-ID: <87jzios7t6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 resend 8/9] video: fbdev: use for_each_endpoint_of_node()
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
Date: Mon, 17 Jun 2024 00:59:33 +0000
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc63293-8305-4a1c-552e-08dc8e68c097
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|7416011|376011|52116011|1800799021|921017|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3TVtvZM9elH4/pJIrl7xl8Eylyxq5cfrj0zQzMFa+0Ebb2C8cXlFqn1nBtug?=
 =?us-ascii?Q?a6F1rlb3zVjdjjI9yvE8VfV153hLnfV2h3mVdUBOcVOaU1vgRSDdEm2+DoRI?=
 =?us-ascii?Q?kO9IfboPlSV53x+9E2FjhiAUgqfjMDwnjTzqacLwr8OddCdYoIlYM+bnZxop?=
 =?us-ascii?Q?eZNL+FYhg+CkD5j/8uye65OD/IayKkvEwLPdixpjbqID8ne3N+xK91w6VEzC?=
 =?us-ascii?Q?IOzz/Nu7vHkbxsFvbK27DHEtgdLVUu8rVDjbkU9X3jppnbWFQNAZP4mP+9Z+?=
 =?us-ascii?Q?PB3c+YqcezX9/EhTs2knpwKKrCwLTPz5v9I5uOgeurp02ohjGkTkygd0a9WM?=
 =?us-ascii?Q?OItO5hy3diw+uRsrpSNA+cMFF5r+KprXgJ67RQWFSz3wG5zwEkMtsCvkTjrr?=
 =?us-ascii?Q?YBoPggUJpURGHy4yp78lohIfuPM+AeC/6Bc4k473ex8zujUo2AeN9wVjupAL?=
 =?us-ascii?Q?eZNvWMUOSAPi8zpJnaRmNwyDTAoqbDS8YUgCfW/K2lOYda6hslVTZH+wUss6?=
 =?us-ascii?Q?8z66BnaT5RedU0lG1prLZ9N2CXVIiPKSoWNrciwDAqgUlCWSDT7Wa9uVOqOe?=
 =?us-ascii?Q?rLUASCT47ie3XwfkCsHgBcC0W6FAg/GKKibi2RjAX6Koj5eRUpfBIfyDoJuW?=
 =?us-ascii?Q?VALop91al2T7QeJrBTlBGXqXsoL8H1+RqwEM2HCJ7/CmeUpXhbnP/7hthYIx?=
 =?us-ascii?Q?9ybCealjyQwDHEbNC9aVfMY8pb6zvltGAfacr70P5KszSYdtni5HSF6HDslK?=
 =?us-ascii?Q?RUhWNgBwlgIpMPoBU/TdcIHWMk4+L65SY7xZ3YA63kIfsTF2GJ4qRNlaroOx?=
 =?us-ascii?Q?6BAFJr1JUXpdbEv4/MNRKXOf6l63ZLw/plWEHUhiOu4r7YXUZAQAfQYK8DBL?=
 =?us-ascii?Q?dnxPa5hvOMHcZSSWyDq2mKKZ/Hsbu+NshGVYfjwMAc3Mn3yWO60tGzVPQzx2?=
 =?us-ascii?Q?e7HgJaFjv6fKPr6kpoghRoSo2gRVm/F9Q4RIbbGwjf5M/UnSnCRjnx0yzw6C?=
 =?us-ascii?Q?SoSJH11i8VdGKY3D73zR5BlmKp8vRi5wtiLWR4cClZrIp/mUnfE53SleKWEk?=
 =?us-ascii?Q?illV6MmfkyDEmRXrpChESYMTJl4nAk2E/U9uN7iNUzyol59wj01Ssj0SdHGt?=
 =?us-ascii?Q?pvsZD0ww8Uv4Yk9D5YMWJYVN2Hulh4lgsm3NBomfEHCwsltfNOSNK6DOTTJB?=
 =?us-ascii?Q?hzfjNO03SZ69ap+dh6ifOAqKOP0MiUtTW/8M7SWysvZxim9iCCSfJ91vsgHG?=
 =?us-ascii?Q?vEe+bUi6pA4Wuypa6vjuHRN2v8nQvlqDbUIUDn8Vt/7iuzEB3LKzlE3zJu/E?=
 =?us-ascii?Q?z0ouT18EFyjLW52/7Vsz4IDU3q9/vyK+wmVkdLPBw3OldmdDls2LCTfWbkZd?=
 =?us-ascii?Q?fbRv9tsxxN34pUKz26tALHbhaJd4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(7416011)(376011)(52116011)(1800799021)(921017)(38350700011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2+7PQ2XouOsfIr3qKiO9BPWd27NWtRsUy+hbwSK+LIj9O72Sjkq5TXP8uk/a?=
 =?us-ascii?Q?2zO7S8iPGy0VrXYUtcrDZv+TUsMAflOA3CYkeB3FYPgv54TbpQ1qb+LMBGXE?=
 =?us-ascii?Q?KTkgW3BClCx7LOdROPJvQszWWo9nXkduYLiwbzSfDqLZuwbS/xQBlOO3t9wN?=
 =?us-ascii?Q?8JyP3h9OtYGacaZz7tFqASIPJkvnncNTHjgzrYbVzZvP+bDmW13Bjn6LjzGR?=
 =?us-ascii?Q?XqdNAiKPHo5stWgPBntv55tbifa+mtCVid2fBXtSLnc77zJn/aoHy4kzWGzp?=
 =?us-ascii?Q?hN3+CW6SEWleA0OS2FRLriZg577Y+n3qjnx7zdw0v+MOTFaA/b4hD/L6Df3f?=
 =?us-ascii?Q?E4P3/xwY06oTA7JR1beDtuY2prHwkwZ9SxrtfShErmbVYv31xbkByV/1Vezk?=
 =?us-ascii?Q?WMdHWGgGLkyszbbaOoDWB+p47pbmoUCXAnCVqBhrBWeG4AnrTSYGSYak0RUs?=
 =?us-ascii?Q?0Fc+wv8I/kaZShmQybb1DtmPIqfTLCQ1UcSFXVXP75D+hm0KLE9q3VDWoLfq?=
 =?us-ascii?Q?jpGln2jFWXSgor78F6IHtgD8ALqtUCUR1T8n1hvgPBt3kfY9fc+0HkcBQyBy?=
 =?us-ascii?Q?OEwNBLVrZSn+X4DNuDDFdrXu8wsHBNt6mtkKi2qngJAk1jevIdKwxxbulqx0?=
 =?us-ascii?Q?hYzqMBDuLW3CiR/NPCHr2AD7jCpOpjk33+KNbd4SSVrTaks5tP5/IZjklcLa?=
 =?us-ascii?Q?A8g0AFfMsttF4Mp5LtoCy/8TOhWD4/5Dk3UQK64runH0x3x5B9Ur4rLtuNhW?=
 =?us-ascii?Q?jR1zD4+zl+bJGyWEng4nDExFLwcdEzSMshEa2EfOr+68LORMqMNK2Fcgi0ok?=
 =?us-ascii?Q?6MQJbTgg8namakoJKpcWZvwk/VVsi6Q+g9wSZrf0CPT7H/noEXGpumngLDww?=
 =?us-ascii?Q?8EAieMknUZAx8gqRRQUieCd1l9EExqOa4ojQuibq5SBnNfifoPKzdRsF56uM?=
 =?us-ascii?Q?eFvFBUNZeqJm+he1cMd4wcwpk3l0a8MwOj3NR2MIAH1zdfE53GGAE4guzxsF?=
 =?us-ascii?Q?N1B/vaYTJGr07CmS1hh8NBJAFXitj0z0VLleHtHEMCunMcJvlYKYI2DEfzbH?=
 =?us-ascii?Q?5WCpIf96sNG5kBSIcCzaJjTcXYXPSDRrxyMeVUSftnLXt6I7Bi2vqY/ABk1A?=
 =?us-ascii?Q?EiH7S+NkU/nVRmB7fjgtq524GmV2pobaKLmTdFIioRwTGJeg7iAnUrR0JgnB?=
 =?us-ascii?Q?CHZ6WXZ1za/joHmig1CDHv91pSUvMclBkhFnSJMJ5UgwFaNXOtt1shynrqx2?=
 =?us-ascii?Q?QZXbkvnkXKQCmD+2+qNWToG2IG0wVBB8uTZcJNTX2JRiZ4QmqKfxcGr76dht?=
 =?us-ascii?Q?1C3EUla2Cma+VjaKZwGNhUhSxQoifYmx36Yf7cxIHb0YCJdvH+e9h824yV53?=
 =?us-ascii?Q?9cPT4s9Huux12XN/FDsg+tevayBtClcUQuSKfD5sI68Cx5vgnB4wRu1N/cqq?=
 =?us-ascii?Q?pETC9ruo5J2R82rFoj71izwQkHRapo1LvoSQeIjzUBjKmL/9UPePVYNIOYIe?=
 =?us-ascii?Q?w2xzHH+VtbxXeB3Go5L7FlztGgbE/1amFlkHLTcgHhOlWBnh+6HJIom1+40f?=
 =?us-ascii?Q?b+xTw6bz4YScexSnGGFTJNLt4+8nILL9smxCsvNfrC+qiDRgLPgtDTT3cPXM?=
 =?us-ascii?Q?xj6Ycd3cl4q4UCFTb1YMkGw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc63293-8305-4a1c-552e-08dc8e68c097
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:59:33.9459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDSs/Ig8grjQxUn0DcaEZd6+yIv8jZTXpdO6ucSfq0xZpQlCWwCduRU/OuSmYFhTH6z8iQjWf1rFfZmB2c7S9IQQ1gXBIMjsG0/+KfQgjiSJc80pcn/WAYFpDB2uEKa1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5663
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

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
index 09f719af0d0c9..d80720c843235 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
@@ -149,8 +149,7 @@ static void __init omapdss_walk_device(struct device_node *node, bool root)
 
 	of_node_put(n);
 
-	n = NULL;
-	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
+	for_each_endpoint_of_node(node, n) {
 		struct device_node *pn;
 
 		pn = of_graph_get_remote_port_parent(n);
-- 
2.43.0

