Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE798D436D
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 04:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF1F10EF21;
	Thu, 30 May 2024 02:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="CUGiCj8/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2065.outbound.protection.outlook.com [40.107.113.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8477E10EF21
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 02:06:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1PvaM+Xgx26d19bBhbON1ZGS6RTQBL1c3mmQ8T9KI/kIDJbSlSzWIr5Y/9eiHSkAKg3L95dhzhEpZ+OPi3ZwOv/4zc6U+XfcHKkNH3aH4LyP/ZB4gf8vQHetB26/Xuc/f6YK37ieVAouV7iO9UqiReIH9pzVL5A2umLhKbGM1xFF+JIkZQ8DY534XGkY5gal8ysOrOMC0VWPUYVV0gtjmE7PliR45VNAu6pt6pb1jjCGXwdKBDUxJaiOOsvWj5H0DqjCb7hKOkFlAPqTQnjwBs78ErEeI69V+FN4Sf9zgArjsWldTD/Msv6jeVnOZ0sRBVnH1MIMOWL7eGiAaaCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJeioO+EW3xq2nPVxpRr6/AxHxgv9TxbDqgwEZtHUFY=;
 b=VPQk4l/ikdY5wW3o50ehGChjz/YR8qfcuyNjmr2EUENL9mu6HEy0z8xjUHFvMtQzAZIN9/QESUeUtAPEdIJ+UAUOw+/5kTfzQ/Y0ISX4qlR6Omb0Fo1iBLj2nYHwUwmJhKnCDRQjrEU8xYITfIColvzbj5JdIs0p48I20np5lwj6Cu9dMwmu3AN/p5KftCHA1lbUXlY2D/bXnLtGWEU0D5WsRmajulpecu+eHX2UxlQSnTaY7FWGW6F+BiCl9IUEnSBWCYZIQmF8A8x93ddTOJ5UvK2zPPTDnceLz2aqYQrhOCG7k3HahMHg0gcbJIkrv7ffYDpuawVZ0mwUGwxnIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJeioO+EW3xq2nPVxpRr6/AxHxgv9TxbDqgwEZtHUFY=;
 b=CUGiCj8/UBjJ1qYXkVQxoX90z62U3GP6rxxDkZGlY42XU/yaeZ26vFloeEMOeLPi4GXDLZFNKavOdwl4+YuRVqltdOp8IP7fgBpQx3zI6wCSD5m0h4iBxmQ29sWnGnBvvStS3iglW/IIyMqf73caVsa0myW22+jVCkMxH+QxUdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10240.jpnprd01.prod.outlook.com
 (2603:1096:400:1e5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 02:06:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 02:06:27 +0000
Message-ID: <87a5k8oxy5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 8/9] video: fbdev: use for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
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
 linux-staging@lists.linux.dev
In-Reply-To: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 02:06:27 +0000
X-ClientProxiedBy: TY2PR02CA0072.apcprd02.prod.outlook.com
 (2603:1096:404:e2::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10240:EE_
X-MS-Office365-Filtering-Correlation-Id: b0723cda-523b-48a6-5822-08dc804d1d66
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|7416005|1800799015|52116005|366007|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uZI0Epw3mfC++b/HtDTNP5nnswlO3wyEbKDuVN/IBtpQfF5BaXCIu7dH17c7?=
 =?us-ascii?Q?hJcR+FlqN45hrmUh6wmVW+LguO4sDQgkZXTXZLpRgifQQf/8Ez8KQlVM+8hv?=
 =?us-ascii?Q?xevs6m/m0+CM2KWs2bsqm70RZgCRPJz2t6kR8dM5bTLi6+MBAymyGfodgOc5?=
 =?us-ascii?Q?3jm2wM3DYd3JJr/jnt+/VOCtXQiNhic8OCydhOEeZiPDZ720iJiQJ9hOdrGF?=
 =?us-ascii?Q?VkR2oI5/vgkz4PFcMETJO0hiGtJjfZc63A9h1NrK1sS0Z/hvSk12aZ1Fnz6l?=
 =?us-ascii?Q?NqtDad7MlwnL6yzs+BXIMPUIWxJ//CX1zeMg6Qs/Z+mog0V+6poO3zpuuWHv?=
 =?us-ascii?Q?5dcRAmukw4p82EvBTKVmuKAlVqcTdAhsmrFUWdyHokhYdnpp6tLgwiknBGR4?=
 =?us-ascii?Q?HCK+VxBWWW2kmYau73ChVu0Y0cSB+SruKkEvD6NLDEAohsWifOyMqYXn9DFu?=
 =?us-ascii?Q?w2uHFo/DMqnl2k5kP5P8P6yYbpmHSHWdhuTSIgmiNWSWAeThesux+NRmSMc8?=
 =?us-ascii?Q?bl03xyU02pGV0SPir9gEIsWBmpAwwBA7OYswd8meMjNexMkyNpwhxmqF89jI?=
 =?us-ascii?Q?YVjb05PNPgygNnnL3jhXWvhu04O/yGIrjhz+o89kzqzZ4HKvnoq6+kJ8ckxJ?=
 =?us-ascii?Q?uYg0+X6kXaxvxipNUPtzl82lWoADypK9UaCBnJRRovhjBwu0kqsBRPxo+Jxn?=
 =?us-ascii?Q?p7v+A9eppkkYF8FRXfkI3xGCdtJkpzQ/m6z/NPmlSEnXnVQ69k6UQVc3KMzz?=
 =?us-ascii?Q?GMZUgDtAe7H5+zfD2sTI33GOdobWdeBF2Qng9aEAQKr34JQ8cQLhyk75E7aM?=
 =?us-ascii?Q?fMDtzkOzpy/6Pfw6jy3vE83lvm7ufNCdlwfhOX8g5lzBF3PVTsFNO+BFYU/p?=
 =?us-ascii?Q?SQ2NPH7SpOIE8HiZMwYOO4Tdf5VJxybdyxa3o3999wN1BTWbxgAEi2ElaaeT?=
 =?us-ascii?Q?/uqGAFT89NQqAcyuSSsMNKnjDSOch4EMk/CGhQ0RHHCQfNXOHuGtjK/sSgCS?=
 =?us-ascii?Q?PyzFXN1Gk9Iacs+eRbbIFKwutXUEg7OC/XCDJgKcsSG+CK3njV3oBNcIuACx?=
 =?us-ascii?Q?3QniAWa+/7E/358ggQWIOf3Zms2F/a9UVDHXPpuZ7cENNtMHGMm0ONEqopg2?=
 =?us-ascii?Q?1K/tRbUuhb2lo7zrGs3wIrOib0QbbCJ7caJm8TSHx41uzl/XQDKmH9mFMVSC?=
 =?us-ascii?Q?hcJpTh/l1TciEOiRasYf+6rOTzDt62/f6X8rksgy6a6eOuzVwofywWwqd3zV?=
 =?us-ascii?Q?Q7nC0+KE4nFco2eqpqTHziN5N4uAlM1X2CFZtr221T9Z/Gbhfx8H2iJVHt8g?=
 =?us-ascii?Q?ZnFMxLDMViSJm+IOV8lZzEOBbytdlNVgulAUhEWU2LXMBW7+8KJkp/4UnIaS?=
 =?us-ascii?Q?gK4jBrY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(52116005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FabE0vtv0Bcw8KkC7Yi7qiRdbLYeL9k+uzNKT+1CTvfvHIl8d8AqHOjoWkC7?=
 =?us-ascii?Q?I2fROGsnu3rC2kD0GfhToMAWvt8vMn099SCpPSr0g4tzVaS3yCjJl82SpVXr?=
 =?us-ascii?Q?uYo3XNbV0jlWqzrCJ+n5aEv3flWkiVMOCVNGE9CyhU2gJCgqjvNV74e9dFzb?=
 =?us-ascii?Q?8DARhMC66sBVhH7zlRPkuxpIVqrtnbX39oxCHqOEXa1UOustDZtRz21nJ63b?=
 =?us-ascii?Q?pk9lfrokk4OIv5eJx3uANC5sBgzPcSQAlLessRQ2K2TcSy+c+fpkjwl0/A9G?=
 =?us-ascii?Q?T1qbOrxNvB7KhTXIaKLAx6q41ZDYd6NNjGjjzg1HKs0BawRXpxSXP0fX3K+5?=
 =?us-ascii?Q?neP51DPY8kRglvMoTf5qOncb1pu4jfwRXj3IH8Aj9fIQJrBY192sjPeFkLdC?=
 =?us-ascii?Q?nqPjQIm91ZnvVksBGxHJINXSHYQJ6HdAoJlW2kgbAmZ+K6jwJBrqnScQSqL9?=
 =?us-ascii?Q?UAs9kX5CAvKncYuQbunAoYwhIZGyWPF0M7sQf48FL4dnVxnmdZuiZN4ijOnZ?=
 =?us-ascii?Q?M2nGYE3o7eVS5kDjzWtgIk9IFQVJ7bfQchqAhO023NsrMWM2JY4cdSwoRz0G?=
 =?us-ascii?Q?H5N6TQ6Aul1hX5pAx00CYp3dbmHcTdhdWF/D1KxXvpMgDDa/fGn3mHc1I+9K?=
 =?us-ascii?Q?vbzKgW9vLnANuatb1OX24FcUdxKMInkF+7+d9jWy4f7KNFlG0511WdlyJXbl?=
 =?us-ascii?Q?hV8RL+UZDydoIxNIKEo9hcTPBeHsYu+bHyrizHxIzt8i5iLB3I+uyt9BtsNw?=
 =?us-ascii?Q?U+q4yTJPPZ3bajLOwrpLNO76vKL7YtqloklQejt2F5inUBHlXVhzuP9yJHj2?=
 =?us-ascii?Q?YMVhDtqqzsMn+lykVm81/0Fr7v49Z4jLeV/+o7h7fvYHgVIJ1ClZydeRmFb7?=
 =?us-ascii?Q?1g1tfXHgY9INd6POC3A2wSdOf2DyVN8chFirIxIbVeDKUXWI2kvyonHjRiza?=
 =?us-ascii?Q?UJRRXHlGKDVJJPRgihOS7C8agiT4s2I8aXdrn5+nkkarQQtT6+qTY5wZeeZO?=
 =?us-ascii?Q?YQorss9qxbiGL9T28DMrN4htTTFjsPL1EVoj0UKbe5juhB1ej6uO2xv6Gtlk?=
 =?us-ascii?Q?7inl+MUOidP/RQK49eTESyOq6WC3Fdxys0tjcjPtaQ7nNkTM+7K3W9vlwDyt?=
 =?us-ascii?Q?mf06Sk1weWV9X7WOon/hApyDUmg5ibAiF94kOt5sYIBtAPe9rWCNsgeL9yf0?=
 =?us-ascii?Q?NXrB9PR88oCszyMJimuTXEyaCDSBYi1R+XbUJU16DYi0lWOhOpSzPPP9d+fe?=
 =?us-ascii?Q?E63zD9r/U/xjF1+vs3rkL9qFDiNXwq8SQymS3xcfIQPtySyACU1D6GrKCz0U?=
 =?us-ascii?Q?bEXxKUZPLYlsER8HI9jGhgZH3hapDIEXGeV1A2ckHqegfw3Fpe16Wvi+hiJI?=
 =?us-ascii?Q?ig4ohscALuoGTSZUPc0R+CN7EvIsjp5LtRoTQoIS//i7bwxkhX+CqZ+ftffT?=
 =?us-ascii?Q?VwNLEjDwCrbl9DD+HHWrrI3EBT+EY4BdRwV5VAF5RsKxZxB+MrB5wwT2Vhr9?=
 =?us-ascii?Q?EKkh7D0VMp172alG+vxpuoCqTTetBQF9aokD7hVrqGXDiAqDSH+UXyJ6l2pE?=
 =?us-ascii?Q?RrrruGVv9pcHLHudY2MkzMxWkcJtDwcVl3tUcgn8yKP/FhTLwf1aE/guAXGM?=
 =?us-ascii?Q?u/qMTGQzAuNYcIOcNH/g5DQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0723cda-523b-48a6-5822-08dc804d1d66
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 02:06:27.4796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Y2/KYOigko6atj3R4GlKBqkZQub2ftVL4zFK032ybk5Tt32Q/HDZ9TEmP0erouyFVasOxAl1bjvwOotmwiMIpuIVu1tsk3mmOCsG+/75Vq2NUGh+UbSvSWOC8VUPE+O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10240
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

