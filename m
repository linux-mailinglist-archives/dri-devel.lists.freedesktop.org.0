Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E1A9AD9A7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 04:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC4110E88A;
	Thu, 24 Oct 2024 02:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="c+0MdpcZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660D010E88A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 02:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLH+gPsuyi3gmYsB8tbqHZmZtEp9uSJhNe0HZw9yWL6VbTNCbWWeAZVkSwfeQrVdoUDIR0FKMU1EdlpDsy3Y9pjd3B+RXuEiHLfJUNvMpYfyzCNMNRiCxrrXuiDiutjB7ZJkauZ91GPCbe5puO/33NOdam9LhnDEBkZvZ6RBHtXgyKbJo5rbCJInxygnPATpEGmNuKkBk7qeTlrX8XvN9yNGmUXgZUdI9nF2zAllMRqvMg7BXXF9A88KXFoDdizrdwusJV2eAyxfQb6W9byAAQfVYc5U51oj3EryI+av/O2cjw5dMmnXIP8F5U1kRX6LIf0kponle6z78eKONjcLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sk6yExsf4kK2Hor4/e63guIBxIqoMy+/fnFJJjd0m0I=;
 b=YVi2uNt2kOBStOPJdKDSPZguY/ZvIexoN7Wz8vIoz5Fn3u4XepwkFpCq0DwQVgYn6awjFU4WL8sEoOqhnanZRItnvR94oP0CifHiGL/X1gMJzWQRlLwY5rYSmi6KjRcT6MzjzLk8mK+q5fiDsNW8/zazmvzDhYYvN5h9Fn+0akFIn5U8rjVf7zUoq0QFGMxAUxa4LED7lTb9H/cZY12fMfLJvhw0f05lFlyASJXRpXvV8yGNg4Qk/5tB9x/D3ZByTCK+OPgUZ+Um8HUygPt3DNi1cS1jrNiC9jNTwDGrc91fOesZHvoPwvEWqiiqGU+ddzPI512udbLV/qE/v3Jo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sk6yExsf4kK2Hor4/e63guIBxIqoMy+/fnFJJjd0m0I=;
 b=c+0MdpcZKMycC29hLPXu+s/Vew3lKrTYZU3ADpbkDiAe/bsKdawTepsZz+YO397zo2p3rlHTE9hlRo1Vu5KykdOW5sUWK54jTQbtpm6szqrwMF7+lMsV+lHcFxFGzN8bzcKjUtcsZ6WQ+eujGCjvUBNEHYae6WbRwxT6y3S/VdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8629.jpnprd01.prod.outlook.com
 (2603:1096:604:187::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 02:20:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 02:20:07 +0000
Message-ID: <87jzdyb5t5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 2/9] of: property: add of_graph_get_next_port_endpoint()
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
In-Reply-To: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
References: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 02:20:06 +0000
X-ClientProxiedBy: TYAPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: 822ff413-ebe8-4f74-016c-08dcf3d2609e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uVWHSjMSMFqMMYzgexO/RKY+TUlu4aexs9ea7HAtvReZX7VdN9cCavcier6L?=
 =?us-ascii?Q?reQuOVtS60UcbovJCKbEXw5JUtrunPjNoDhw5vcQJHl7hu1Gns14t1QWqxxc?=
 =?us-ascii?Q?nuguV1t8PqeeEc452iQqME3QTyJ8SNajSJKMkIYgl8cCIEW3THEuUSBPGW2J?=
 =?us-ascii?Q?qucgqGVD4Xf4FhV0Li5AiiFMFfErd5Z4TaOY2j59yTCWXQ/PRyiyWNGymvpN?=
 =?us-ascii?Q?CZ0fChE3aqedl6W6W86Jjephz4xtoKqW5P271kyCswRbeOxogRjwhEZAZ20f?=
 =?us-ascii?Q?rfMPC+l6rflZ80kEwnNMfupIsh2O/rjsMxgU4a3551LejLEmSshr45hWuO5A?=
 =?us-ascii?Q?KsKHGDktbIoanoIe7sUjWTRL/N5JcIM8fL2+bwVT9UwPe6FMa/uoptVyTSqb?=
 =?us-ascii?Q?N+yuY6LC/wrFjHtXgeDNp1nRPPLWCq+4l/Iyvvuaz4PfmW4rrbcRI5ZdE0LD?=
 =?us-ascii?Q?gHATwieDIqcdwHSjojvxW9P6qHsQeFpudUn53VoMoaHdgFgrJtMM/fWe+Bdj?=
 =?us-ascii?Q?8d1jDMs7PJ+mVjWU5hKgqJjF+JYtm1NC6xAXRnfg4GBrSTyWDpVW+O1GZ9Vx?=
 =?us-ascii?Q?7UU9B8oi8B59CnM3JG4qvaf7s/iNcKYF75r1AJHCfzKiLPm2aiNH2NI/PQ27?=
 =?us-ascii?Q?nGMDfdRbDkmODvLBCD0JYmgHGUxvKg1PCVvLqxgZJKIzNltTtEoCL3ToLJMG?=
 =?us-ascii?Q?uGrGjD/eD4WIZIwG4HSQJG1AItBVI0dyRIfcTZ79HZi2/HuBgxcDYN1pUEnz?=
 =?us-ascii?Q?WM/qJLLuMmuxV7BzxgmGXtgQ8tBs/KPdJm8c0l1Uq56Nl+vFA5M6EDXedSeU?=
 =?us-ascii?Q?iM1y0A0ZLbu786YHGAyDKWKQ5laUcrrCcFLaVrcF9mCuJuWgi1B+OniBuKdg?=
 =?us-ascii?Q?A0odtRh8r1aZjXJh11tVZA58LC9Q8FgZgYQXlO9cMSvlcTbtaiWREjKxN3UP?=
 =?us-ascii?Q?8SWWd2Tq/mc9PIv2vAfd3d1DJEPebV+1M1U1CFVs/cHtgqCqKqYuzQzh+YpM?=
 =?us-ascii?Q?5qL0yfPCm/+TOV6DYuSmKEE6ZuSOs54CpIcvL3e72UEJ1oEaBHHt5tYvwFOR?=
 =?us-ascii?Q?6aXy633Lj7IkDjqCPWLDZQoqAqC3P8GneZR4EOP+MpY2lZ730eb1AArlwyY1?=
 =?us-ascii?Q?jkqiWWF2PEll0RoBDzpEuEpZeGFSOLDKQ9uTNxKHpMjercFA3GsbnWKAlmmb?=
 =?us-ascii?Q?0619BEvdYhVUA5BV2oSTl0G8wGIOw+6hDhUajUFj4m3Y37+1s+USpnKNFL0O?=
 =?us-ascii?Q?XoADrMohCvDZjj5CoV51yV0yzoCdPyhlMy/hYtV3CORO46Zf4J+pnej49pd7?=
 =?us-ascii?Q?SFnWiPfrjQPjf4izu1Xjcj12F38Uuy2ALiBykfDNEElmYGZgkltM0sbJhtSM?=
 =?us-ascii?Q?E3aQ05iXon/4fINY+ZzLOChlcju9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zFQtYrWmiMiCLXdfUafC7lVYf119X0hhifgfMbFJT96L/C5jQIJw7inBFeuc?=
 =?us-ascii?Q?0W1oDZawjCEQG3BcbI+UMwenMYKIHlUYm6xoSrjXA8toINuy+5QAzHqn/eMY?=
 =?us-ascii?Q?AuwWEJJik0IiJOiX0qiax3ayniMQZ57eVqdl/1GEuj5iznWgeHJ6OTmZ+3dz?=
 =?us-ascii?Q?9y4a20L9Q0mAFw29+O6dUAx5hHHMU8i1ZhmQXQIKpYqMTgnq25kHBVJQQdwJ?=
 =?us-ascii?Q?ifQufJaYf5BJWBV5rjpvPSE+fjw4Yf0kEcwkkoKn1P3u7cntHzKEVBzviBui?=
 =?us-ascii?Q?Yu7qYPWhCDGCACejwFopzPlwplrVxDDZBIiPeae3nnEuVkC2sQnd/U9xXaUO?=
 =?us-ascii?Q?yVidmqi7Jzv+6PV4G9S7ymLgoKaczJQ7riZaK/R4DrPyyYC7duzw8ks/ctw+?=
 =?us-ascii?Q?iPmgrNHCqd64Ue/c/en1eY3dk66ReknIrIXZFttDRjWPTQeNMcbCsI18z/W5?=
 =?us-ascii?Q?NdhL5ay+Knu0OxJxOrTBcq2HtpLu7Ui7M1EWQYOQ0ivm6Ey2dEHeM6S253xt?=
 =?us-ascii?Q?vp/LbEkbgkpBzlH+cJa98paTpCTvJJ8mLOCdjgo3YhzorxC1PL7WHmoiQGFs?=
 =?us-ascii?Q?HflGPP0XCJnhBhlbqUUm526JE5aeRwqiwznZpEtD3F5fSP12GXPJwdNDkexY?=
 =?us-ascii?Q?RdEAgyr09FUSTzqF7ThuKkF33KFjkREhIHDsmcOi5XNscmubP3nT47FpNp25?=
 =?us-ascii?Q?Yup0FA/qTUX2IoMo3u/sjQBUINiToOZ2ccPBaSyw73LxeuWiYLSRfA9u7vtb?=
 =?us-ascii?Q?6xDKtlU9dEslrfu1BeuTD7rEyZZll8k8krW81PVeyUVd2G5lsgNGeFkv2VUW?=
 =?us-ascii?Q?YWuRaR+yoyAnOqC1PctM7rIfGEAkDZVJ8+2tVR1ivU1kIKiWi6cNBQT8T8St?=
 =?us-ascii?Q?eBytuzMc1meKyLB8F5sjCfL+jLWOG1gdnUut54QEUYa63bGp3IlyO6w9rzyw?=
 =?us-ascii?Q?ue/XTjuTTMezYMyZLziVT2YdKo4kaPrUuxVR2ZCGZVO19rfA6JzgZmprjO++?=
 =?us-ascii?Q?NOdIvwyAig6PwgNyG9mCMpsurwKBwKFccPb8FdOv5oxInw+yFO+rUKGf5o0Q?=
 =?us-ascii?Q?E8tEsU4ZkDQMAOz5CYDPSECeinE4xM1BAuTvSmz0HAPajgauz/c8c2htSB8V?=
 =?us-ascii?Q?nKNT6U1Uh7ZCUOa2mcSKSkOCtdLZHyziRmpb0rV/dejMCaPjKcQhy89DxRUm?=
 =?us-ascii?Q?KamzFYCv3WLv3F6GHj2kPyFDO5B4RW5CaXjJ5bizg5m7zo9ZXqB/RM+wndQx?=
 =?us-ascii?Q?egu+53EH3W68W7yy6Bu3Q+UhPQ/oDzxPfIJkLOh4IppLI4tUitbSewgW4/iF?=
 =?us-ascii?Q?U8zFZkh87nrCafpNMxEljrD39iEs7m5PtsOeT34ZwrLvaW1bNb4cntQdlVrj?=
 =?us-ascii?Q?ZtWDooXp8nj5qKh/h6lzhGQ0H90Essoe9eL1BwinqioebNxEzoih6Gf3x4gG?=
 =?us-ascii?Q?IMu06NgIz17cVIg1t2u3qrDA9AuzXs10oI6eAu992bCLrfp7GRbAiQsd6ZJd?=
 =?us-ascii?Q?W90BMZvCpEgraL/5NvL6jq/E2F0i2Lhml8M46iVvMKjzYgN2dVPa7pee2ZzR?=
 =?us-ascii?Q?L3zbravS5VusPdNyYm3yNzOdy25ZyE4aBzukUWxQ/iKq+MSfZ1V6f18ZL3kh?=
 =?us-ascii?Q?YeCnimu1Yk6zmEMOIpnn9CA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822ff413-ebe8-4f74-016c-08dcf3d2609e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:20:07.0474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VD7k0mkT1XQlcclsPrXJTFhpMS+YqQFujxnbmTDEdoubUncJ3T8SHGE1GZXlEW5uVWAdwI4+ojUbhkxkv5v2GacVWwCTPNj3wgvXaxXpRtFNCxo13AsUfI9hvdBykyQ8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8629
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

We already have of_graph_get_next_endpoint(), but it is not
intuitive to use in some case.

(X)	node {
(Y)		ports {
(P0)			port@0 { endpoint { remote-endpoint = ...; };};
(P10)			port@1 { endpoint { remote-endpoint = ...; };
(P11)				 endpoint { remote-endpoint = ...; };};
(P2)			port@2 { endpoint { remote-endpoint = ...; };};
		};
	};

For example, if I want to handle port@1's 2 endpoints (= P10, P11),
I want to use like below

	P10 = of_graph_get_next_endpoint(port1, NULL);
	P11 = of_graph_get_next_endpoint(port1, P10);

But 1st one will be error, because of_graph_get_next_endpoint()
requested 1st parameter is "node" (X) or "ports" (Y), not but "port".
Below works well, but it will get P0

	P0 = of_graph_get_next_endpoint(node,  NULL);
	P0 = of_graph_get_next_endpoint(ports, NULL);

In other words, we can't handle P10/P11 directly via
of_graph_get_next_endpoint().

There is another non intuitive behavior on of_graph_get_next_endpoint().
In case of if I could get P10 pointer for some way, and if I want to
handle port@1 things by loop, I would like use it like below

	/*
	 * "ep" is now P10, and handle port1 things here,
	 * but we don't know how many endpoints port1 have.
	 *
	 * Because "ep" is non NULL now, we can use port1
	 * as of_graph_get_next_endpoint(port1, xxx)
	 */
	do {
		/* do something for port1 specific things here */
	} while (ep = of_graph_get_next_endpoint(port1, ep))

But it also not worked as I expected.
I expect it will be P10 -> P11 -> NULL,
but      it will be P10 -> P11 -> P2,    because
of_graph_get_next_endpoint() will fetch "endpoint" beyond the "port".
It is not useful for generic driver.

To handle endpoint more intuitive, create of_graph_get_next_port_endpoint()

	of_graph_get_next_port_endpoint(port1, NULL); // P10
	of_graph_get_next_port_endpoint(port1, P10);  // P11
	of_graph_get_next_port_endpoint(port1, P11);  // NULL

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 27 +++++++++++++++++++++++++++
 include/linux/of_graph.h | 21 +++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 375d81fad8bf8..fcc609a17fe35 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -667,6 +667,33 @@ struct device_node *of_graph_get_next_port(const struct device_node *parent,
 }
 EXPORT_SYMBOL(of_graph_get_next_port);
 
+/**
+ * of_graph_get_next_port_endpoint() - get next endpoint node in port.
+ * If it reached to end of the port, it will return NULL.
+ * @port: pointer to the target port node
+ * @prev: previous endpoint node, or NULL to get first
+ *
+ * Return: An 'endpoint' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
+						    struct device_node *prev)
+{
+	while (1) {
+		prev = of_get_next_child(port, prev);
+		if (!prev)
+			break;
+		if (WARN(!of_node_name_eq(prev, "endpoint"),
+			 "non endpoint node is used (%pOF)", prev))
+			continue;
+
+		break;
+	}
+
+	return prev;
+}
+EXPORT_SYMBOL(of_graph_get_next_port_endpoint);
+
 /**
  * of_graph_get_next_endpoint() - get next endpoint node
  * @parent: pointer to the parent device node
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 44518f3583a44..a692d9d979a64 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -50,6 +50,18 @@ struct of_endpoint {
 	for (struct device_node *child __free(device_node) = of_graph_get_next_port(parent, NULL);\
 	     child != NULL; child = of_graph_get_next_port(parent, child))
 
+/**
+ * for_each_of_graph_port_endpoint - iterate over every endpoint in a port node
+ * @parent: parent port node
+ * @child: loop variable pointing to the current endpoint node
+ *
+ * When breaking out of the loop, and continue to use the @child, you need to
+ * use return_ptr(@child) or no_free_ptr(@child) not to call __free() for it.
+ */
+#define for_each_of_graph_port_endpoint(parent, child)			\
+	for (struct device_node *child __free(device_node) = of_graph_get_next_port_endpoint(parent, NULL);\
+	     child != NULL; child = of_graph_get_next_port_endpoint(parent, child))
+
 #ifdef CONFIG_OF
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
@@ -61,6 +73,8 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 					struct device_node *previous);
 struct device_node *of_graph_get_next_port(const struct device_node *parent,
 					   struct device_node *port);
+struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
+						    struct device_node *prev);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -114,6 +128,13 @@ static inline struct device_node *of_graph_get_next_port(
 	return NULL;
 }
 
+static inline struct device_node *of_graph_get_next_port_endpoint(
+					const struct device_node *parent,
+					struct device_node *previous)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg)
 {
-- 
2.43.0

