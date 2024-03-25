Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155978889E4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 04:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538310E571;
	Mon, 25 Mar 2024 03:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="ayNNPj+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2044.outbound.protection.outlook.com [40.107.113.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611AB10E571
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:05:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCDdixymzrWOGZ4k8nA8UkBafyukafbFudB582W5fO+IMKa6B3NRMrxR6RHL9QSTs48sQFGlbPdwVzZzoHNKIw8YFfYYxvYgURpJ288l0o2WsRy5AMAo47fOZAdJL9vwPwaHbwY4na+RhGb+n6tyimmuJH+tJM9/tkg1iDvfFGFdyebX0GWplruDnEyc17J6By4lLbQtn/ID9g9IeLMjbT9ySNh4jim+cd2WVFiBz0NkvIqcCBSfAhptzY/iRls2DH8zrq45F3rXvKM/3GTfP6XP8ahSHzW9JCMrrCml2eITd+raBb6uCDKxFMHTZHjZ+TleFSrrIQVEc42i0+5kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8t4OQznVBGLLmBFnjQ/lO6G9QF4zCO9P6FQQUWVcwE=;
 b=AqLnd16v/SQKXW6noptx03YnVqbzCH5v79tSiPIaC5a4FlM9ASGl3Tcj65a3SG60vzEDaZfg5eM8NdlmSigzAJ2Ef7YjNNiFiEldzga+x6D7WlLGip8U85dhvlSdOMz/uscF5x9q/l4BCHy0sNeR36cODFwKwhG1r90IrPiPVCAk4U6AzkBri3allxfBPdLIr1qusvrM6Txo8N/CH/F9mHmw2+MQD52RVrjaFYmIbhi0lahIAQLSeDlDpiU2DRKoEC4cjKhT88+EOFuZtQ2aKhvzshOifoywrGSWoR+G81i9IsmSacwW1oVpz2FPrh6Xd1NDyIOttQ3SV7pFW/d1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8t4OQznVBGLLmBFnjQ/lO6G9QF4zCO9P6FQQUWVcwE=;
 b=ayNNPj+UCAGOsXrkP0o6qkl56WUt06FBptlBb+jLA3dXKuJYPeubeKNnGnw/2PHQshJyJ6c/FjKvmGSX/sOtuUcSgyK0lrggcGYmnlbe4+5h0c1qcAhPAAFFnc2qQ3hfBNB+zEcfxjHXZ53rmHYYqCoDvz3ruzYNc1tRftXqwG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6966.jpnprd01.prod.outlook.com
 (2603:1096:604:12d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 03:05:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 03:05:49 +0000
Message-ID: <87r0fz57ub.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
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
In-Reply-To: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
References: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 8/8] fbdev: omapfb: use of_graph_get_remote_port()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 03:05:49 +0000
X-ClientProxiedBy: TYCP286CA0229.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 217584a1-2ebf-40a9-e186-08dc4c787935
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j213kYYKemA54wITNEkH7qomEJThqx392VNx1fBkb856Y8C9uvnOlP+qtvF/gq2Aagn7mC25Xtf2BqDYOjqPSvUjCmE+1/9x9FsR4vK0FP28+G4fgN9OCpa6prlw1FdJV2rvC4EeKkUZ5MGV/qhlu08mytwaMvoHLAO7yKQeDyW7eqLuKjdCTqEYCanv1sBbR55hEPmzR9q/muHKLOAmHrBEg9IC657DBe2c4I4bIQLcJRK+cWH8r1JDzvvn3yZc1NgqRFdsEohyVAjmgNyG2315H3bdUO6I4WsmW89TTgo9qdU+DAkU3JeW1+p6YCLs7W27Uh8X2aQQN+6wsiil8j34bhEXRjf02JWNqLOCpXIKDhMfz/PpbgqsHMV7EMukhxTx+wIPi775mMSRaH8hGCaDOwp2MHJoKzkT9CL7V8ftnIn2l3KMhbIyTJNBTjJpS5FomKnKQUWfD9fNejeloKWT1hpHaIE+IucN95N4N1duejYQ2STXIZmQCdQ7oroAnbgjf65QyvT4fxAoGOc6C3C51IjqHavxVo6jpkDkRFEkq6KzjGl3r+6JkTCFd1S2zz6gcjqxLA8W5aVooSr0OohsjsLpIquAhnjM6MtIW+ijw/I8b1F4XCOCjddCmt4xIHANYZaexn5Ypr1fnBC8H7/C8Z0ENVfNer7UXAjly3yEBfc6Mdyl5wldNR4iBz1UtAtUjfA/Qf+VqHadzS+eaysTth74bKIm/CVo61QjEvY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(366007)(376005)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MRy66VN1HpM9PPtjj27gpNfbUocxfmd01NRvDo46yrgwQXpiPlK4hfAFNuhI?=
 =?us-ascii?Q?j4MzQMTpziGo+X1QgZOXPHdaoi8KM2GRrPzo7HRG04qz5GCJcUPBRFtWU7fV?=
 =?us-ascii?Q?bDVNi8/lBS4r3WFGJL5sQU2EP8rObvUhiLQFojhsc+zQhFGoPktdc7k+ZYX+?=
 =?us-ascii?Q?jQtL23hjvRvKtZtMk0jW7PfbqIPfJC7lCv50aLYUjuuEjcN5iMASjCXw1XEZ?=
 =?us-ascii?Q?WlmINlyFufXCQBdbxUqwndjg1lWFDemacXpaklydM9NV5rzgY8pnbNi6DOO7?=
 =?us-ascii?Q?o8/U70a5hf5bRTA9i925n8PZ3a+cBY30uBaeaTg6JdHnLsHuTr4kSdVf9EJA?=
 =?us-ascii?Q?RtmRtrrQZSM9GblNJKhPUq9azH/bctIZ61dbuw08/+jWhs0eQbscazih3XEw?=
 =?us-ascii?Q?i+AnUd4mYx74Z8iasx+S26aFVcPBjYJQYkdTjspBeYzX0ZC3/Nej81400hML?=
 =?us-ascii?Q?NjL4K0rWD/6IyQEY9VzRLT4JBJsT537cwBuT1jlIFsae1EK9IEGAyrl/qx1Z?=
 =?us-ascii?Q?FdeduOFPBre8ZJjsHfg4tjT/9oWAR+oWXFIMnYkIYBuhadbDj4jgqUQXb3Wq?=
 =?us-ascii?Q?jFIrUz0/Pa7DGcaySiJf2WSqJEVWcAaNZduDwBHPYh/lEV8G6QodC9L+N27g?=
 =?us-ascii?Q?nv2hBJ9MIUcNn99h20hQryDnpDvUADK/w8c95zUpbS+eFjFEqOBI3EF4gKJs?=
 =?us-ascii?Q?YW8228kuvycAx3q2h/ONKNYckAayX9U7C7FjykyELFBznLLYrKYTCQ4M1FX2?=
 =?us-ascii?Q?qaAt+Mw84iKEcVCco91/KJQTHOVEqa9OdHoo189ipXwj0YPYZXUWYFEEIG9s?=
 =?us-ascii?Q?GvipoHwxgDttcHXCZpSREqovGGGoJ4GrgbJaKIeRkwe+JQ/RKSjQ/LoeTyol?=
 =?us-ascii?Q?DZrfd9ea0n9NCfHIWYjRu+tffYxlmMvG1woRuTZlctsddYIExKbPeaEEtYsD?=
 =?us-ascii?Q?KEZMI8i7M2aIS9x86324rfibdCdJAw814mdW/cUOYXJhVA52ug0GMWRfWRBS?=
 =?us-ascii?Q?ZCEWyyt3pOXQSBe4GzDV0iOvFBle5V6N3AGPefI0ScAydyZsOwJJh79JlO43?=
 =?us-ascii?Q?hJICtZiyGRC11UUJabcISTP3WJCgMZHuz/d49BNIC17f1fU3g+dAqnE9gXPa?=
 =?us-ascii?Q?cXq81n/5Chtk4ut6zf9KGwluAluVcq8mgQxwY43K9g9jn3VRFeTCER3zdlMt?=
 =?us-ascii?Q?1Er7LN94bGc6FbV70jbGoxXpr8gb7miS1niT1DNj87Q8cJaGMqSrerAyFcwA?=
 =?us-ascii?Q?ZXeE94TrMoouvQTLtPXp5RaX0KpEYzItIu2wNujN6G8mOLotfg0pZsdp7atr?=
 =?us-ascii?Q?x4V8mbDqgkZbVPMRYtTlXVeZBX0CApgmVQdHyX+eSASsAzB+hQqb6E2YeCwl?=
 =?us-ascii?Q?tlwXorcahxvB0+DmhTZ0wFw7OfelwVYqkju95jDc4A2tEZsqJhf+kokB68Ne?=
 =?us-ascii?Q?TlcMSWy3mc5wZkFQIt3ND7pJlYEDkLkcNA50G7c8gJf3gHfvuVv2xVmqh+5f?=
 =?us-ascii?Q?JBViOZ9cbbcm8dhvJp6kd2lUPH35tkibCPZn77edY/KKYmnw/b8h+3fOl71o?=
 =?us-ascii?Q?+Ae3tMy8//5g48YbJ6NpO9V6Y8k7GX7gPjZTrHfvHVj0lScUPRlt60G1mbml?=
 =?us-ascii?Q?qasnenGEL0YrDNTfkw1JRcY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217584a1-2ebf-40a9-e186-08dc4c787935
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 03:05:49.4657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSZxAhjEgIxlB94locTwSeKbf7RT54Be7IkVp/sswyHrLI2pG42qP9ORKB8yRrV5gUr/ng9cFaCYt3yPppE3AbgXHitIZyYTcKoPpzTRxWiJTPx1sW8lGJpAVkbJ+XCS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6966
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

