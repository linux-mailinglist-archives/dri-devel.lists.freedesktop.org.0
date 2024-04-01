Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B5189367C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 02:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4326310EC58;
	Mon,  1 Apr 2024 00:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="YBvIZv67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBED910EC58
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 00:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejfjO7rmq73IRBwjHopgDB7lXQtq3P4nZ8FueyFuFVnajF6w8JYf/eyEA47lzVlcx/MHDmqwSPX+Kt6JVfOKpzzTSW+DL+RXGH68JX5/nSLLn/UwRmiQwycEZPr2bVy6J+JH+iG4BnAn9hg8KDBbvqiy0b9XYJbj393VPiBNRjsRtVcW0QiuVMXYRhpWubXCzR3TnH2aYWdZmEYpSIiLTq2oSgO/AP5/f/zRyKgr4KCgHSa1YTfTxy9lMIgtX4Spr/oUzmMmSRWi+gYMkhn59SYlm+eoqCG8l5H4hYelpptsJhU7tcUhL+Y05hF/nj0/cvuHVtyT6DXWBhpmyufCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4brAv8IRjvQv8+uHm6V2KjfYIs6aEml9p7JOjKUA4M=;
 b=nxctdtTFeQpwYFTiLMytzuvdjf654wNBoNBK4bBf67mBQDV/h6fpvHGYfLLI0BjrO0kwH8l0hSMYFWAa4LotKqG/UDXo80zPpXN+EKkmwsv7ufHgHvbyyB7XKJK5tWECVogVlhSS97/87AIsBN9e9zJP8ba/waulJAH8UNQDNKCbRdFJtOULDP2ZEGs3YmQPxHFn/EbHhmUnkQG75Ntc2wJZJOwQPnL75tLe/wHrJlyAWhCsMn9/biflgxTcn5a7beTTzbEv/TmtHo8Q0DV7jM5s5NiBOlcU7qQQQTNHkgPgfzzrEx++30vbw3qYu1TpnWXYA2DnzsCFwBL+DBi/RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4brAv8IRjvQv8+uHm6V2KjfYIs6aEml9p7JOjKUA4M=;
 b=YBvIZv67fUOFhQIG+/RF/lEA8njKsP9g3q2ftyfB558rvGosHcwjAPciNz5t+ZsYEFAQc11ljShyvd2s7RxTFSDNyntx8tEfp6B9cSIGHL2FJqP8UtVUNcCtGLg/XBluMHw75GKpHgNE1CjbRzyywHYmvgQD+ZJoNRpfbWT8LeU=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7826.jpnprd01.prod.outlook.com
 (2603:1096:604:177::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:06:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:06:13 +0000
Message-ID: <8734s6uetm.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
References: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 7/8] video: fbdev: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:06:13 +0000
X-ClientProxiedBy: TYCPR01CA0146.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7826:EE_
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MhQVpogADwHzcfjKpuLNkDVsTiRJLLROF7QfqJTQOWUBIv4f6EnIREF4q2BDfpwzuA+AXcucNgosXCw9yo41jQOXFOg+0d4gB/DSqas4dlcqct+mTGIN3QcGn6ToincNjFjYTEbvC1ibEuKKoNzPlczA4o9q9PLhD2Du6mm2J7Uw2Y/ZR2SMmmpqZyOztoHdzX42mwFr/k72xS4/cnxeTcvaM/QnjeiQi/YuoPBbC+8xAh4/rzHdp+WN5TgG5ur7/CeHcp6cW0SjosormegcEMblV2iz1R8LlTGCEh8BLJqqE84rWsUP5DAcON2HDpY1dRjbDkkSzUFocJBcKXkp5aLHVMDh1evZb/SYDpk+TvHMG8fNd+i7thOHunEur0LAXlK8xpzTQfCexf51JFwUbrsYRS40y4sQuvYvYbiK5GY7gAoqCAMkSB7dtSo+M8NbeW44APFz19QM/xrn4BtdbBBNwc1vJEcTlxaag0Ykn7Mlb7Gp8/KcwB0c7Bv6Fr5UZmn5DlcSfOJovWE1csRgFowk08KlO/Ii/BM2Nw33ZMqJpTLs4yXT4Xt8VG1j4AjXEbkVnHMXnWUuPT7ni3POfQ15PdiOJZC4elcluZsdWIQCCQVKsKENQrQp2YnfHG/UAb1RYYtCCRF8a+jHT0HAKWWEWgZt3Lm0kPacpEfy3l9/9w07SGaJZNfOadW3Koo2fFJIWq8N/ZrdLLsfdIswcypaRlpranKoniPef93Vpos=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kIjJNbSukdXKVTPCPuDIlvf32ZOpDtGp1rr7mQOVJYGuJ58ULgHGiUO1kAsn?=
 =?us-ascii?Q?QizvYEzbLCESrIWbeuG50kR89R+OJiRVBaefbdYszdsee/xStmC4ohM63Hp9?=
 =?us-ascii?Q?VTFtifGJ8QX6PwgIBQWKdZphYkniyZLOvYP0VwvgLNMh2QETl1VWDv7CwZI2?=
 =?us-ascii?Q?pONiLmQUsalmhzOdiU8Ojb/obxM9ydw+tAdNpVrWpnQ6Ok4JqmoIkIDqxjE+?=
 =?us-ascii?Q?ezzmOnl6348yd9GbOMRcT4bwa/+FdHg8pPST1BFgyA6CKY6hoyod2jvu0ins?=
 =?us-ascii?Q?XYKOd2R0BmlIRnhinMHOj3W7fLP/ZS0aNg13qm59q3uuHim+O750+t1t8sLT?=
 =?us-ascii?Q?y5/v8aMtMlTTeQrf6pxk2jrWM1dN2PttAXvZW44pLatxOaa1tfvADR4/ma70?=
 =?us-ascii?Q?HJZQt9xiFyq8WmMTvZk27wX/6PTRg/RY/8AXjCcFGy19ZN3+lXwF7a1FzTib?=
 =?us-ascii?Q?nAwBY60Mn2PyUxMyASdifSfcy+DdMFQ7rH+8y5LXE6S14omASQ6mGIJN4t+w?=
 =?us-ascii?Q?u1cWvCl6XIYtqagG7MbmfXGdKlQTNc16KD/wOs5NJbNr7bDBPOZ3NEIedW71?=
 =?us-ascii?Q?FQRUTtT8TrtQgHx8CT2bpkhLY1+X3A6LVuE3ljbdv5JpKjsDx1svpIhnZSl4?=
 =?us-ascii?Q?MZn//d1Zd4YK7t2lNAkT68Bqdh/ccwcNb9ML/WsXZCsAySIRx1tJYIEIv1ct?=
 =?us-ascii?Q?X6gAPBGmps02S+OXx7tpk0l2pA65CWTGWH400M5wqVGoS20bTkwKocE2bCkg?=
 =?us-ascii?Q?cXYDjQulYJ9ICD+oE5z5oeueVaCmsuUnNAEHW78f9pCm+MIVSpK5SfioyMai?=
 =?us-ascii?Q?t0S1lC+3ixADiCMQX2hk/NBoYWCiBXXGRmHLL7la8zKhIboo4jECXWacGe8I?=
 =?us-ascii?Q?Bovorlll/kSJx8U+hXyVdIHqxJgjPfDcJd//Ebo13OyT07bMxKp27xRTckJB?=
 =?us-ascii?Q?3MJS/vCRNXEgRzYXlioFTKipdyJytEc10IgUjY9QZiOAY5YENRFHSIt3vAuq?=
 =?us-ascii?Q?1rqlDsHgU9fCeIUzXEOKa9gM9CfM93WkBNpl4n7Mo890mxLq0vozzVb5Baxi?=
 =?us-ascii?Q?8eAlIGjBrcc0QqCxmdbTbhoxNtSndzPscEc0ZMjuKqg6x1qoJLSZ2f7OmSbH?=
 =?us-ascii?Q?tNYS8l/Qdk8o0S+k6jPdCEngHNQacsHLfElOVj83/zwLlaoOk9KcrlQTAty4?=
 =?us-ascii?Q?gTNv/lGENMnjuxjUxPGgwHTt0ZwJoVt0YVqiki0fT2hPCuz6cBBX+cej6Vor?=
 =?us-ascii?Q?CXZd1DyQPRTPFVbQFLqyDkfUUr8dvCrDOuIZtGQjLyKhqNwL9Kjlpaqr8nvP?=
 =?us-ascii?Q?NfCLhO64PGCfVk/pBMqqKs+BngzL+fYJfxKZSlcg+xpPOWZlwy0K7vS7wCwH?=
 =?us-ascii?Q?ZaYjez533wCLM7+RAQdNT2l8EGdCBHxMy5uHt0e0fxqdCa51gZKlhafqZO3Y?=
 =?us-ascii?Q?GNpFQgoj8sMP2sTsKlczNANHgjIHvoJOc9CvdQPWhRXWgBxL+HWCQpViWAeU?=
 =?us-ascii?Q?ZaQkxvazmNw2XC2cuZvhEK5jNIP/i2glmQj+ZLAPMEtHUHvebVgktm3iIl4S?=
 =?us-ascii?Q?VF0e9hsVoVHGCeGp8pkgV4tthXQYtYez7fy03x8cq642X4lNrUCJL3QJDbrO?=
 =?us-ascii?Q?Ub4xXTRN2/wVQnFEGqByPUw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6e55bd-ae94-4651-0fd4-08dc51df8b48
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:06:13.6865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKjX39mHI5XdK1FR0FrO7EKA14tQDxvHhjgWlgj993tH0kSKqcv/y9+eIosuKM0cf4HC7CVxJ6df1Gge91242kA7HCsxzFJO6hnwWeq3twfDIUDYThcBvj+45yhrqqsI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7826
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
---
 drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
index 09f719af0d0c..d80720c84323 100644
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
2.25.1

