Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D709488A6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 06:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC2110E2F6;
	Tue,  6 Aug 2024 04:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="MY4oXVAe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E3110E2F9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 04:58:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+hlpF2Whx4BSXwQpBWB8cMeFKJY6KI7/VJG9ok25M1cv+SQ8Vz1WVrAl45UeIGNBBxUjwOSz9TBTUIa+Sx74Mu54N8UG3LS4bXFG/CFZ6L53Ky9WSW3y8hpgKU4ihezZh9LCSMOsnWRkNWgoYXTajMKEfsYqNMjsBJjBc35SrvCm6NfP4MysEvYD+2P8vzMjHSBtLxPAClyUpl6ihekHUS7r/zCo+Jrka8pGNUSNDtFIfeDbWKdd/qIS/8AMQ7G3L5wv02HFD0jzqt5quOHzPvwqzwg/pxm4zWSbxXi9jUymZlqKvZP41YObh7QeqrI4FsgYBe/aZN7/Vy/DAoM8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB6Fu7dPk96brYTuEHSz083xYrEd9Rz2uuKrvB+9cHA=;
 b=UhoGSRjbhV9uw55yL9ycAlNQ/U4Vl32aZRrNL1iFNzFpJim215n29gc76LBH0lDa/M1zhAgrl2hlOUpw92NiNjdz40sdJtvb0y3LYsUwAFkmg0+olyDTXYCMxNP2T6DNs5N+YfYUGu4QbkMPCenzoUTFaCtZO1iYjApWCQeWOnGjCBohgCvBnHCz1/5xJmuURXJGPm7HETI5VQzN5kzOSndwGLzsZqUUvR4lip9A4Eu64n4Dtpq5aXOi1Vkra3jTqbxJQelysYNeCkNgxl6WjfcrjgFN9iJmagkVeeuFoKACJon9qSJHclpikcMVduM1mielhVndG0HfYp8RjZGW3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB6Fu7dPk96brYTuEHSz083xYrEd9Rz2uuKrvB+9cHA=;
 b=MY4oXVAe0Cx2aWgpEXOzsdBBJWyB6JvP+XwVt2qQI2kCswN/5D0o0hRN26GFC+fz7oPQqLLXiO/sfj4TxXlSx438xedQhw9oVJD4B/P+dNLz5uV7UUZa0qQUAbx7M0WjG6CXvffgrTlW3uPhweRTDkJpupePnNLbS99/eI7RM+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10409.jpnprd01.prod.outlook.com
 (2603:1096:400:24d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 04:58:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 04:58:50 +0000
Message-ID: <87cymmw8l1.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 7/9] gpu: drm: omapdrm: use new of_graph functions
Date: Tue, 6 Aug 2024 04:58:50 +0000
X-ClientProxiedBy: TYCP286CA0193.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0de283-a24d-4d42-ae07-08dcb5d476a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cJV2fvZV7lucPTRO9kMYSw0PvSeuC3a2govN1jyn3mMKVevyS6tnaqQOFT8e?=
 =?us-ascii?Q?kRMeBhu9k0OzExXwZHS32Op+ZWmHgOLHhHxgkAfo8zTrA0T7wZCiQuMcJeOH?=
 =?us-ascii?Q?XrmB8FwYITNl5g1FBHNOgBesi6DLtIaITFdUHPE3cF7+NvAmtyUhLov+ER0B?=
 =?us-ascii?Q?QLDvpgtERozG/fFPGPoIdCpN5YxB0SzimaoFLvMTY4/2RkPWhzK0KiUMZNLV?=
 =?us-ascii?Q?dqsBPcoGppqq4cEfJLJea0D4Kge9jiQcHhMxyGj6WnY0+4lin4X/VLXQsYpt?=
 =?us-ascii?Q?VuU8P3MkdyWWMJW6qa1VizaYavzMTmWuzIL3sGw6JW7zS1Lg/tY9mN0mP7dm?=
 =?us-ascii?Q?mAJtupwulf4ixd/Ha8KTqXsmmU7/x0IZbeutUuBJdIRucoSk+N27OoekWvpW?=
 =?us-ascii?Q?oNURApdEGdPHaHtkvbsF+YSDxLEyW/M/O4bSft4OCcxJ42dZxCaZtV8qsFpL?=
 =?us-ascii?Q?4dtE43f9hUCBwKv9Nr+QZ0x5n8VdRCtL+lByUChuE8qw2YnSmsKAX19T/DkX?=
 =?us-ascii?Q?B+AK/t9F7uDYCHcXaAIZY8N9dFB84sfMIwhK+W7OCNtyRWEIvj9S8Sh7QwIH?=
 =?us-ascii?Q?W1KnGWquQayrpNoy8/0dZ72X/mlSXnRQrrKWaGYOCfnGfMftX/Yvy7SFldmJ?=
 =?us-ascii?Q?x5RF7P2qdvDp9wTi5C7WK3UBe2c1mOLz5KibUcq/JB8Pj+fP001behabfc0c?=
 =?us-ascii?Q?zYh0nWmhMXE3i0ejo676NTJhoO1f1Js03mQK9AqBaNayXrc1jw83YLgtTHUg?=
 =?us-ascii?Q?BH4cmdZGI7OSoGM1BPGXe7biBg+jCy35mfugvceJYv0GDrjkAdNKKfkozub5?=
 =?us-ascii?Q?qR8eGn8mPwzBwhPR7awvrWWSX9oA3gnO3pQs27oLU3Fz8ji/nS7mGligrXPq?=
 =?us-ascii?Q?ynGxSIWg3qWBc/gT+PmEpTceoP2GJsKeousK13GLSb9VPfKR6lxjJl9OQKZg?=
 =?us-ascii?Q?cxOVsSXYihIijx6hWKGlRDfqLk6976No2fF4IJQcl6nAGbjpI0BlVjJtjb33?=
 =?us-ascii?Q?aVqiKrAxudelK1xE4HjFF8Eon281NFjTgOuu/pVbbN2OrGojNUOK05u69Qfc?=
 =?us-ascii?Q?u9odTi/H/RSfTeNYLoQ+kOhXhPrt+fju9b+aiV7sBoNfLbcQkgswAlprv29v?=
 =?us-ascii?Q?AcN88Ee+rxrKnIREH9/hgqMathqZND5q6qENM/US0YZ++H/JYrJou1qbNl4N?=
 =?us-ascii?Q?Q9rKpmbUWeHWa8Brsg55SYAxkxlwhFy1n/zHO88yS8BToJQd/sWUwAq7ABWb?=
 =?us-ascii?Q?qLKnK+h7GhV8n8EaL5yNkJZ94QqDGMXxwoFkSrD5JDmmrQE3d4kbZZjnxXSL?=
 =?us-ascii?Q?PZuDg0J0axKmUTq8pvIWzJ2IXGDmB1ZxThjoyyaOc3AqmPaKrGkWaRBJqzXw?=
 =?us-ascii?Q?os6bTTULcBC2cnMvOjQg+txK7lnohZdL/ga9KWuy0bH/s/gsuaZsdxAp13Im?=
 =?us-ascii?Q?6i6h38GlF/4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JfvUkosohhGTUXMWi1GHDum/ZsVIbr7OO4DBKyw0M0SdQKGyvpZkGuKA+iuu?=
 =?us-ascii?Q?7Lj8z/4RMOZdvcMDX6tmUQITAmGkdMY/iB7Zs5SzUxqaUwI4YjCUBeyPXGLc?=
 =?us-ascii?Q?0P227YmLG1Nrhfv8ou9eewjCDp3FOmHXALwB9Xm1Hmfo+Uxqr1kmrgYzAV/5?=
 =?us-ascii?Q?epIObQWL5VV/NrCsSRGwzTor1wLX+c8AVblR4IE8HsKFuUR1qf6qwM1xjFxN?=
 =?us-ascii?Q?TKAjLjwUu20ljAQBBCqsufNqm5n2O4PVqwq0GJdU7k4EfkwaG3p04k/NcOwR?=
 =?us-ascii?Q?Vz29cd748tvfiRdSh3/1kEHQEhseWZz3NVr22GA2ajCs3cbl7Wo7ysnkeqMa?=
 =?us-ascii?Q?5xN/S1TuTEdquAaxFjFTWMtik9pw5oy/IH62Q2yFRzYwIWveaft0sqA5Nu39?=
 =?us-ascii?Q?RAAemGpc1LXxu8CZabjxjQgTlPXmZfaZTpjh5Hfybl8DB3snd85J/ZyCved/?=
 =?us-ascii?Q?3dQ/0ols45vJDm32o1St9eqFCWT/2tX03WQBf6rujoRifv44eVb3JUiAr8tJ?=
 =?us-ascii?Q?6oCvI196xMm8uFZ/NU4sxkJpjTpBj2f7ps41Qf0lTm16lFqMdphYVONPapwH?=
 =?us-ascii?Q?drLLVHn66AvESxOAsC+2+nwQDnVW4fSwI+VrrheDqV1vxo+Pzr+hTTuvYVQn?=
 =?us-ascii?Q?7caMf5fyqptcTdK+rLCq7KWG+36n7DfYdysiqAzuvvYsuRvQP4dzK0EfeWKf?=
 =?us-ascii?Q?92i97exivwCWc7e+innWr3jpp/QXBN9gVoN3sNsxNYWzOhQlT6ERaY524pvb?=
 =?us-ascii?Q?fKFJQZSDJPbqfgsrE9UpqFtoTfLix8tSl9saQkCk5duWbv5ZDl6Oey9nlGzW?=
 =?us-ascii?Q?0wOHwjFpapmGHRhaXXV2D/P5NbDvAK/UNztkezRkUzmVe9RUSs2JOceinB9p?=
 =?us-ascii?Q?BLAc02MaCb4B3OWgc1dE3VhcTUh8XU15nJKl6d+sFtnscmbISt5gywDGdVnW?=
 =?us-ascii?Q?akP3G5uiHVfqTFj/vI8ZEvmsrsSkwpBbKSbohqaGsACSIL4Nt0tetK0WWf52?=
 =?us-ascii?Q?spxJboVV1HKHRUU7iLmK9UPndwmQ7qi/ueoO80b1AEtp2r2vAJjaQ+5KnEoK?=
 =?us-ascii?Q?+a8+zYV6rrfj1xRS3ZFO5Lo3c3Wdh0wV/8wCVnX1g3BlO4kN67lKoq9MLq6J?=
 =?us-ascii?Q?UAjpuvD5LFk3ju/MSCXTjvFS3PJy0YGYtnE3703rQc2FvRZE87loxDVoxrSV?=
 =?us-ascii?Q?rNswVKgTFEmD5L0daB/Tr3NOCWw3ZbxDrDfsBgEoZ/P3gTqsAbMGEZ4YjpSR?=
 =?us-ascii?Q?7cRmxISKoyvQgYsB+1R5qzu58WbI27fBUukRSmJLA2Kzir8gSIeFGZh6ixCq?=
 =?us-ascii?Q?OMJzL9AzT9BXrlPGmc9LiV9740qC8BqaydnQK/SeWoQ91gy+/dvb6bYePrbf?=
 =?us-ascii?Q?I1OJyNJgJTkHWy6cbo7YiEu8zv/o1i15jGV35ddOS9o5pP54JXxy90u7rX7G?=
 =?us-ascii?Q?AAvOVs/ev1DenCDmUdackJAmv4CsnxafdlkduIbbhYJ/4SMSb1OhgbyqoPr/?=
 =?us-ascii?Q?k8wckfVjVdEkqDmT/lujkDsZzfCzb4KNgiiIhFeqIh51neLqzp/PkC495kc8?=
 =?us-ascii?Q?Ro3CEdzqXtobuokbar1qpE6HZz88u3tt8bNqcT0gfpSgp+u6qWhi7j/WnBO+?=
 =?us-ascii?Q?7WGfK1FPaMoksNuCGCx2bp4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0de283-a24d-4d42-ae07-08dcb5d476a4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 04:58:50.8855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ay8Knu3mb3NTIFKenCG+shWcq91vOt2lJpWjSPvFjasN2h5sxQ6DbHnIz+4V700UB23+BWR8B7imUQ6lUQvqtt7UwyHVX14h1yxEv0u94vIJk2WrkYDYfWKv7V6o3b4R
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

