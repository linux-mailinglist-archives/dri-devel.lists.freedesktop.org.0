Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775CB961E04
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 07:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9ED110E496;
	Wed, 28 Aug 2024 05:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="apRZVRdb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B676C10E496
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:12:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dM9wkfHWO6wkPiVVpr3C+T4p8GHHaj+oMLvjqT13M7CIdmdAn9t7qhu9coofjjA2VC5kCNWjXOsO16cwKhBFwc0qlNYL2pQHEZjf1obGLcZSZ4u0Vmj9yxi7oAQhcTDJdEKyApGGupdhmepqrrvm3PRzP5Xz+sewuK4zamjLl0UgGaXywetepFEd5Z3fK70Bm5cjlCWzCiAy0tz8XEwxpf7Dm62lgh9Scv01YgThX4LvykuRIUSRxExsCuMEmPlrEVTUSTNfYNFFFanxVxhqTX140+uXF2YmMfotb6JvgTm2jZ3oAqXzG7kzN+A6su0sLqYA2qIzL5ht/R7KBFJVsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqzIohYp5afmfF86fzJ9cHhouXOQhdLWAIzB1UwkvGw=;
 b=nwmaO1eMCgzPOlCNCJsamDmGCvWvnJV7BVL5n3SDOISoWVRke8Q5DXDkPpaJmoZZnLn80YRvnCfuUXYO+I7ZMBLnEsSaMoHuYJMls3t7egkMV93A6OJQYPie4DjCS7sdaWdf6FPgexWxt1+vHcAT5g0MDHeIUv53s0uwMuZuL/s5lsiPueIG9dHS7h9l4QPVdcizLyfhczSALNyyPSgH5FjBdnGhiRinmzSDzWqknLJRm0ZJEu220usBX1uG19MSdBGESEOn2NKpa62ZdDzHQ72xzkAbODuVT2+WJCOKucC6kdeY2MEWNDytOV482ZtnAQ7or0kZgCEQdr0N7kUtmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqzIohYp5afmfF86fzJ9cHhouXOQhdLWAIzB1UwkvGw=;
 b=apRZVRdbajfPAHwulnMMf/UIh/N5Iq3jQFo5kpymcgPjglXuOr3v8WwZ/sGQ1JdGQdlFqyGB5FLRdYu4V/clwRSPplz7XffF9PtsEiiB7pZ8h9/3qBDEXVRmv4sRpxoXHt5dAsMx1PphIsWJPXgcHKiQD8S1hF5OPVjZdVpx0Ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11955.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 05:12:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 05:12:28 +0000
Message-ID: <87y14h1b9f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 9/9] media: xilinx-tpg: use new of_graph functions
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
Date: Wed, 28 Aug 2024 05:12:28 +0000
X-ClientProxiedBy: TYAPR01CA0149.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11955:EE_
X-MS-Office365-Filtering-Correlation-Id: 872a83ab-d9ce-4c6e-48c6-08dcc7200319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7kGZXN2J3BobJdaKpfK4b8usn1verxmB88wl12Xu3ZxqXvRVwq7lWbTIGiIP?=
 =?us-ascii?Q?wIRQwjzOuJ0clxgXK9FiupshfkzNJGjEaZK9yi3eUOeLUrreDZUo4H2CMx+d?=
 =?us-ascii?Q?zMSvMPZTMWgSunsJ9bYD2cUd6N2YInygOvSvf749EYXMKeGtuTOpndn7LLAO?=
 =?us-ascii?Q?MuiUwjZpfFqogEKMJYxqla+TS5tMrXsgaVrlLTkgt2hnnH/esQJAxBhcO599?=
 =?us-ascii?Q?Y/NtE3HoPNR2PYLLEv7DqGQA1IBQ25OX0hSUatZHfFRojEWH/DDYAxJoWatt?=
 =?us-ascii?Q?sp3rdd2l9Omip52EsVWxihfF3yC9spB8w2Z6ya6LlGC8glrLnmQOIAvtdJOO?=
 =?us-ascii?Q?9bnDk9TXPhDneRg424L54Z1x9O4Hyv8zplhLLEPeKzSyITIxIOK/bP1MPVhQ?=
 =?us-ascii?Q?akrtHETpBWY9S9sI68kK6jl8P1vv2FOaWxii4CuYqB3xN19Avd6Ef3PqR2a/?=
 =?us-ascii?Q?XISfGCzAOYqI5/mZAa1hNhMp193IzUUu/1JA/aixv6dqcvuTKYFRGPQ0zJE1?=
 =?us-ascii?Q?WTnLjHFPCCimD+BHKlwexd6jpTn2FAk8yW7aI9LMJae1Iy0qvXHl3HWR9EV2?=
 =?us-ascii?Q?W/8C3uj1/8O5AbkpyIRNj/t9hyCJj/izQuRtk3hT+lfxW7pShuyFXCNT1LW+?=
 =?us-ascii?Q?Xw3PfouJrqamf1TP1QilEdP4A0IAMdUUfCQug2GiY6eaCflLFP9VXNwgZX+R?=
 =?us-ascii?Q?E6vUK+cSBQoAakwRie5d2OiiiSJMqBMM5184PmkCXDSm7OAsvegGCToqW+3F?=
 =?us-ascii?Q?PQ063ah2dbKfYqtJcjsBpmn2GiTuI5b8n7M2EIgJ7Orhkef/GBW2OjzlZMaP?=
 =?us-ascii?Q?OneF9SIrUdnOHvs6EMSJ8eu47Ad2PBFa9O12yF1P3JsbB5OohLhhOmw+A4Uk?=
 =?us-ascii?Q?vg/anpe0THd0017804JtaLevjtQcUw7XVX91Jjck+loyDiSd2h2Tr50/f+Q0?=
 =?us-ascii?Q?tW7bDHnW1oYqLiMrnYc/A7hAS8wp3Lu5zuirGbldJSuzCw/Arc3JadfUeAg1?=
 =?us-ascii?Q?t2WvNwpw3sg0hVMuJgftu4h8uLM6tAcqwSfbE4ht7kAZDhAL8g5l78jTquh6?=
 =?us-ascii?Q?OQFTB2LMM22zR0hO1z50RTaziq/qWsJbapBGs2mGXgOTUQrlCr7HK81+UKD6?=
 =?us-ascii?Q?As/8Q5bk0SkAj9OI2iZYQFd6IQOAMOfNMn40TwzXXKhmCqz5ZaDjD82nPmWa?=
 =?us-ascii?Q?Xk69P2TlUMHAIII4ShTJRgG7DOWnBtfuXTZPKqpZu7MZAl1FOmkq60T7CYo4?=
 =?us-ascii?Q?9moGYd7ZJZi8Do+JL399vB7WAbLjHJABH0gTDdSDFzQ2E7vuLYDo8k8Dq628?=
 =?us-ascii?Q?tC03ojg7y6uPfQ1yZtuxoI/QzGrHSgb1qO0KMy0wVMM3/uc9hnkLpiAghPdi?=
 =?us-ascii?Q?jWED97bsogPvzU9bGyAT4hU9VxPpVuK3V9n1ItN1E0nj28cFz04UJrHvU8Wy?=
 =?us-ascii?Q?VmWVml/drBI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hjR5UTc965aNUbc3dHkj3/6UP6zuEJJdMzLFKianVVkwNh9rBVK/2zMIcsCD?=
 =?us-ascii?Q?ZR6ID+JvrPDi7CshmmeiAdzMNsbk/RUomr44AOMxnRiXXEkxDr1i7H+qdCmJ?=
 =?us-ascii?Q?AceL5dxAJh1E2b7O5h5OoMczYFsqN/2M8qqNG/h6cxtXwuoVfSCnCZuqhn8A?=
 =?us-ascii?Q?9nXPVDNzMcYa8hPWOCktnMgU2xQgfKTgRWGWs+UD9GMAY+PYexO4ncqaXOiP?=
 =?us-ascii?Q?6L1TmV9/yl4w2smVZ113e2GkwE7A+0ftb83/UY5ctdIsSd3uBjrSSNorkOdn?=
 =?us-ascii?Q?ktmxxUI68Tq7nc6vfY6RGQL89+0o2OhswJnWNH8Mf6mUWk6gMJ5bih0OFv0o?=
 =?us-ascii?Q?6mIpg0q5Iag2Vfgc/AV3gAaT/YwXFaF1VlAYY7itEF/rj8Y5AhfWWm1xY4hC?=
 =?us-ascii?Q?F8DDCgKUAVpJyZ+j3PQaFOYr/zYAG2VuyiW5l3rGQ8wZxZIe3cUksJ/K7iCh?=
 =?us-ascii?Q?Dmbgce3f0u2GNY+04b7vpWlZ94B0SfELreXuCDqHXFr6ZoyvtlR/nmPxhLFP?=
 =?us-ascii?Q?wctlw61kKWWVr6GtHci5D5LP4E7xit0GKrAb2r8uvBhHTnIzxKD741JCS0bk?=
 =?us-ascii?Q?Iqq2LVxbcOo62qjYR2M+qHdiyqfvffjuLjIdbZnJTJEjuJ+MCay8fdmntDsc?=
 =?us-ascii?Q?MgLWBZvWWHhi7Az/K+JAVDvvD5rF8BXBBgm1EDu9udZAZ9nuCi/sbL7VAvYz?=
 =?us-ascii?Q?W3q3sJtXlj/bLCwvcbQCPCTjN3KEsiaZauIfHjV8fE661FYKhhsPTmNgOtpW?=
 =?us-ascii?Q?fUl8B80Sf+A23VMAsx4WFxuM9Qcntl8lLlmNSra0iGeY/AJjgyvhKDdSvMNe?=
 =?us-ascii?Q?FZsS+3864RwyUhqCcQQDs1re2ka8bHhxD6sG9ZAz9OQMPGO2IhqA2kEBO4Wx?=
 =?us-ascii?Q?C2twtNYGHeQmPwBYE9wNAxE710ML1/SLlf4vUVZUe19jq5b23+L6cayM8jS0?=
 =?us-ascii?Q?oZItHOm0Z6wRVQMENsDEbXdgW2K0iVng02fdyb09yYvANQoqmKM+VHdirl9x?=
 =?us-ascii?Q?Be2EwfauZqOYPMxrOGepNT3+70wx/k3YIeh920zZpFRSC5VRicR48FKSQxfl?=
 =?us-ascii?Q?AZmi2X7XYoh4vdjjo4FVLKbTxC8EB9flHaDDYpugq+PLcQQqp6twnkDrZjQL?=
 =?us-ascii?Q?GHZWdSomBXk10PAaGMcF1hSFkE3X5JP0bxPt2ozLBl5kR2ZVWPRKqgUaGkiJ?=
 =?us-ascii?Q?/2QmtXIWPmrHntdK8KJ7G3K9GXaCwZPJx8Q+ITvvfTl+d+tBbFJOnrmLBbOw?=
 =?us-ascii?Q?X9wsWMCi/G5/sdfSYqxJB876ude4uQQH7ULQXJC6wDVqWMPj421O6ganpU79?=
 =?us-ascii?Q?pZR9+cxcxsqD+cbJCy8wADM66w3z8QB3kmUfBLcKbEX66AE7otrA/kYm9H3l?=
 =?us-ascii?Q?AyprOv+grHC7L7zG9s7nBqjS4kIA5eqhp9Nf9DCKSHni4Ds44iOJnQSAkkhf?=
 =?us-ascii?Q?fIZqK3nAWNlziPzjq5V0lCJDmgv9AJmTNL9OVDw9sFJYC1WO6Phg0Rb0oVl/?=
 =?us-ascii?Q?jPwNrsohVPcGAOXNvLTsX4wFxH0J3aHPprk9bhY/b0Z+KsntyFrTI6BJPHe8?=
 =?us-ascii?Q?OKIr+GYH3S86Fm3VRLv3h5cwVRMlzze5ImEl4RpxUxpTBpoVWte93kBnb+3F?=
 =?us-ascii?Q?U234rh3ERJz0R5svPN1pqXI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 872a83ab-d9ce-4c6e-48c6-08dcc7200319
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 05:12:28.5315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNKm5/Q5DGZ3qsmVX8Y4AajYuc82znhtyuQw8L/xtD7G1Uy+Tdhx0fnw/STfVyfdLzlrwaubhwPcJ0nK9U2SIx3BTJbS+ikN78qzBSFuUVL2M27pgBOQ5ltDWoEFNIG3
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

