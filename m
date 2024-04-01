Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241D189367D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 02:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E1410EC5F;
	Mon,  1 Apr 2024 00:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="ajsi5Qo7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6850010EC5C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 00:06:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGd04lIRmHTwlKVah01q7DBjtB4sIhSstIt+1P2vs3SQX/HmoH3HogWUb3YffthC1IOCJh9z4IkFvQLpo4Ume7wxakf3f+UyatrFt6cU9YpAP2c8BbBzfuzz7Mop3UShSWY3c651tWa/I7RTCvt8sOPNFbi89fm3jSwfliUYB7Lm8LK+CEOPqK+8uYqvbpQffj/avO8TmX4FZ37pwtPzZFq3hwEEvYT9l4Iu9RuvMd1FERu0NHFNstwIV31S+LXlA1z/I3KQVs9ljSp4mr0Wf+LPpeTCcwmfwsfrQY1PSBGpSWLhKgOlaJumiUfLDuU+7Iz8zsUf4ibfe7598rbbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8t4OQznVBGLLmBFnjQ/lO6G9QF4zCO9P6FQQUWVcwE=;
 b=mZeEaJWRLA1/yJrl/l67CabKsWln274sdiNl28r3padM9B3tD846QhW6gOplFs6wzwJ6rnK4me2AZx5Jev49xrTKOd9dxWDymzIGC+SnuZL7Skp0IgmOR/AYqOc4qE4Xtlxn2wucumgkdJAfbFe+Ov0Gz0LOlWxg+04+1FYqFgP1fuybF7zpG1hGC/k4epucYctunyCLv5sn5rS7hpLTDzK591imkgzuNl1zYGtzRy/Bs+o2ubU1pOPlCXYGTiGaUn/agiZ7l5rQNSQiql6LCH9OcDDKSUMqPpQ9M/a6LRjiUZB2btqcXl30Q6HY8KpN2nHVefXICIHyIgR/MeXsDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8t4OQznVBGLLmBFnjQ/lO6G9QF4zCO9P6FQQUWVcwE=;
 b=ajsi5Qo76m1robVzDnHCP+mRDDZs8ps+23iGfUumj2k/FUGPhK1EF5mAmHEJNZQVK98ZOLLTTKbVfqoQWoMJfpV+K6jt17D4wtG6yL/ZJ31e7ctQEOc0+1xOIW62/xArpFDHmz9jy9yq31uynl+3iVcQJh5079AOCNC671QpxeA=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7826.jpnprd01.prod.outlook.com
 (2603:1096:604:177::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:06:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:06:18 +0000
Message-ID: <871q7queti.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 8/8] fbdev: omapfb: use of_graph_get_remote_port()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:06:17 +0000
X-ClientProxiedBy: TYCP286CA0258.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7826:EE_
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: opXV4EKHvPqWxDO9bNiaozBSMAKd58IgIKRmhLsW0QWJzcfAxzCVoHeFbuVFMj5QTFoC3ZAKNMG/plu8g871uP2MxNRqB1MDfocZKMiKDB2V/f1gEpa4gQkeTKISrDsg5LwU65NwVL9a3wpYsWHbvV5R3X6irbgbIvYPsmHumG2TrfzgLZERkjBm+ci/0rpesV/7sIG+tV+N7t18JolBKE69VSU3ibvvPxU1th09/JFP3q5s4YlGwPGTMT2PaJkH6YyHB9v0Tz0VoNtcon+F6wu1mqVLgQfFvWWNhevFPB15oG64GS9d9/5c5zlS+tlUT6hPqo2K48prcV28O7d/L4+uGINScoa/pOvyDdkSzLGr6D/awN66gQGqYDlC3BNTiqToX8Wgt96JkTQ8sRt6P2Qq+vl3y6/SbRh7GL1JtM2H50w7Uvifp5wO/O1AWis3bfnK7qqV7FYMquTNHkAdFk7GkJSKHnCIYqJdJZ3oAoXRD3vqwshhraiWLMv7fMRjlMA/XXFBH4534UIk95xmPt6eap2M1xjTVTURW5MaQLZfvWGdXZsfZwXxB3JGyue0ZoqNVkS0BgCVDxvWNhQya9E4zbN1tewnxRbC0a3DlYSFuL21xrLW1HvbSq9teT6rmrMT8pIoO3WCaiaM4h4JsXm2QO+qrQi4di8qF/5KlrftiUBHH8JvBhY4C03gZWEme0SuRIst0lYxOCDZnAyosy+dynKTQ9p1PqIC5Kc7qic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EXXeE3LkUYxCaNUoKT858kGzkMZ5gLi4nxKdLhLuNkPjznRfPw8ozJ1aYMBv?=
 =?us-ascii?Q?O0rCj+fkezs5/+SgXifa2fLBOwPIc/TrrJByvN7+pYgfV4aeeLEHd/nigBMc?=
 =?us-ascii?Q?pbfRfInc5YNU0ejcFr4RsenO2LqwlDj8BRbRjVd5WYib24GFrVm7Wi+oBeoY?=
 =?us-ascii?Q?H2b0htFyEHYkhWrfRpkvRRy9jzYOvOdEnfuC100SIIJPIrSDjUMAREwkQsma?=
 =?us-ascii?Q?/EYNhyvFli1WonmzIZEDyFUa3fRcUcQ6sSo7lZ+Nty+lSp/vF8fQYBVg6uKq?=
 =?us-ascii?Q?PXdlnR6KFr3cS8FHjGozpfZnTm3Ah3Wyf2BUmoHKMXSC7H6CujxPY6wl1RGG?=
 =?us-ascii?Q?cMKDj3t52V6rNDqbjktGt5kd2odOXenPiH7NZUScqSwRFXM8WOl9OXD9UpPu?=
 =?us-ascii?Q?XicxddWfXdSV727xLz2xdsEAnjlNzfwDptPjtR4jJKk/W0FyWtZcz+6AzGvV?=
 =?us-ascii?Q?uV/K9Ga3uA6xZfK1djtgYYUlI87Hd5xqmrcUIx0sX77w+32AyYjZ2q4AFPZD?=
 =?us-ascii?Q?pxXVMDU5QQADISoERhFDCXOwrapBros1P3mjVnlaVUidB8oos35eZbtU0+/s?=
 =?us-ascii?Q?pZaOQUR1CSaXIIoFBNfBWQbJ6l/GQEiKmGKm3s2ls2OBNwacm+6vhF23SdHO?=
 =?us-ascii?Q?b60l7cCGc9EzIZnDdBumKN9n2WfDpWm6osRjoAcF5ghbG4hvtb1DcceIHfy/?=
 =?us-ascii?Q?s8KI7lp9+n56nRkt748UUm8NieCVGE+cql0py2azQfgDcjspN1sNBja8ilXM?=
 =?us-ascii?Q?Z+9cQK3wFMwHtU02SCPIihqxwgviaN6+NflO4WJWApRY4mo4ASrtzvZBM8rK?=
 =?us-ascii?Q?HCAPLkGvvxWmMAQjVDMIeVdXCQPHfgF/V662NZELz5emAGPtBueutT46dIRm?=
 =?us-ascii?Q?fQt4aP3VAz69lKnU3FvIy6WVcDonNd2vxO+ShjPX9B9j4OlfIHVlq385HUGC?=
 =?us-ascii?Q?cRr8Lr1lEK23H/+LDYkLWImmKl9yBgFP0Xp9tlr5ZMozwn+gl1pfXtmIEtGX?=
 =?us-ascii?Q?7b1/SJ+Ir62T0Md9TiDbjEDrurVrYK+UhbT41LOh4kMmL9wfLfM+DnU8Dnrj?=
 =?us-ascii?Q?rs2lQ/hIS17PCJfjf3BQnr8lS7xH1GmzbXkXMcj5ZbX0bbK89QkiOCJViw6Z?=
 =?us-ascii?Q?yCaeeI2yTqnHiKuUXZ2EfZ37ftxs8ksK9ZIyDxTYayCEzHhN6uV4galDTF5g?=
 =?us-ascii?Q?+7Uue81IoUbmQSNpZzBR7MWLTptsn/A/S2vLi8G/Oc1H8pLQgjOyWGNoxaJT?=
 =?us-ascii?Q?omPMNfUckFMlV5tUBnlM9iPqqAR4UrA6wmvknOeg6YU7CAmI5Hr95oL/ZfDs?=
 =?us-ascii?Q?EWGkiNP8FqgswWjznx/7a3vupnCOPt2NYsVu+Cud41e9n0+OvC+27ZXFE47c?=
 =?us-ascii?Q?0XKFj3mNvj3Uflm8vz/u69Jwu7l8ZkgBbJV1Qhreh+Xi4mOtdM5+ZT3kc4VX?=
 =?us-ascii?Q?1KFcVDIvZ/BaEOiA3RQ+RpOuw6DKTEzblNQPfcw7Eyi3wFICu/XTkNme8b+F?=
 =?us-ascii?Q?iw03aDaV9uN/4R53P76zkQK3EplJBWI5D+AkY75G2KuCugBtjtY88UwwFuOK?=
 =?us-ascii?Q?2yCQIQxUzH4DUZxgVpZ5W7Wb9YEgWHtFkBs7O0jLa55SjE6MMQH8RuuOYpbi?=
 =?us-ascii?Q?wdntqZUkcjMCx7X/8umcbZg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e43baf5-9ada-4da6-1068-08dc51df8de7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:06:18.2112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpI3xk5flFnl1rsJ9sjnLhGOGO+XZ3rhoW5qE8puW9hyjkcSPCWye4+RfdY+mVTRwtlkh6YCgr4CzRSS60HL578ZeRl5ZNclYzFJ/YLAcoYhG1kC68CGqEtwoC8OPhkz
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

We already have of_graph_get_remote_port(), Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 14965a3fd05b..4040e247e026 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -117,19 +117,6 @@ u32 dss_of_port_get_port_number(struct device_node *port)
 	return reg;
 }
 
-static struct device_node *omapdss_of_get_remote_port(const struct device_node *node)
-{
-	struct device_node *np;
-
-	np = of_graph_get_remote_endpoint(node);
-	if (!np)
-		return NULL;
-
-	np = of_get_next_parent(np);
-
-	return np;
-}
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node)
 {
@@ -141,7 +128,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
 	if (!ep)
 		return ERR_PTR(-EINVAL);
 
-	src_port = omapdss_of_get_remote_port(ep);
+	src_port = of_graph_get_remote_port(ep);
 	if (!src_port) {
 		of_node_put(ep);
 		return ERR_PTR(-EINVAL);
-- 
2.25.1

