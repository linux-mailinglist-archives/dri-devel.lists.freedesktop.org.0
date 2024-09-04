Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866E096B113
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3190610E5B5;
	Wed,  4 Sep 2024 06:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="aQOw8kwE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC73510E5B5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCnnEVl39dXZ5uydjQo+EmdP12bBXHrV5IiRRvn2e5I07cIyllzSql1xpl5RC9WMNlBmATpEPMuU31eGEOuDICsvS7ipbB5ynymMLm1kIL5YnxSk1oFLYWee974JDBn1D5clnkQD2+L1HZV5HaqQUhGbjqdjzNqjK/C1+n3IZBvJ0Cl9ueIcsOuoLLpnqX0smxyevxT8EfBkBQqD9utxBBxWaxNWn5OF8DZFEYp0ypvDPJrFxIRrkqQ/5WuyEKRtf2Np7St6OzsqU+Jg1J3epJGZVn2xP+v1VBx8YPQeLbVNnwxjdD9W3kIiCL75olpGbFLZxl5Q2dIcHh3BVdnpfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKmyRCnlh6pRp4xGuOPDxacwiqr8lRXCkyf1F2DnBB8=;
 b=tefnW731fFTcS2Q1KfNXArA4rvGKMq5j623oZc4k2kMrNDn1ci9kJdh6Fm0Xrkb6pYxTZEkwAPDR7UT1y5IY5weabCZxIWyMrdGYNFJWV+zx5/jfArZWvtpbp+54fAK47ADBnURaIU3OmsKTnk9zHcv1tKAle3mTg6OxToApUu3hxt0pyIbuLKtjobIJFRFtKO0zRuXBKftTf38tZJ8uho8kRZtWLRaT0TaFerVbbxZdOArEuNxGhzaVe6UbMh/9jWspUBo5yZDkZcck0RtluLd2BeH2ZhzsVu2sNBj9Hxn/W3btdImPEkqOn/1i26CWbtQswQgelN9746KkMnhuzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKmyRCnlh6pRp4xGuOPDxacwiqr8lRXCkyf1F2DnBB8=;
 b=aQOw8kwE8WBh0eE7THvfWrOW05DoRLUENf/I96L/47/Vitenmm1uVWqaGSJAlginNMO0boq0aF0NUP2kEu7IEpD/ERcvzflA0iwYiW+MsDtjm34Hfy8XL1mo3LxdE/AOJRuFxWJY+nCFPLjO2qHxNlLyJuYdig08gGjYPMGLpAw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7309.jpnprd01.prod.outlook.com
 (2603:1096:604:11e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 06:11:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:11:12 +0000
Message-ID: <87o7546j9c.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 2/9] of: property: add of_graph_get_next_port_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 06:11:12 +0000
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8e1da1-8b78-4522-702a-08dccca8606e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GEezVLHyz+4c+vUO3X5mdCy9XljdIy5lHkFXTE14sv6tZdvWIWUxAtcIsU2x?=
 =?us-ascii?Q?ApGkzX51qJ683f0UsTvAyA7FkcsMUgix7PNpPtgoovR7yJ+iCOIdJq4r4BJb?=
 =?us-ascii?Q?1JKY2AK+tWVxxxHVJWBSpzjAxRjLsAY/t60lOSkh2ytF8WUtNkmYayJ6KgT2?=
 =?us-ascii?Q?RPdADt7/m+b1L0nqCnEIi0sXEaZAfZS2I/emeHK8pDlXtYkVzhMhcpU5Obb6?=
 =?us-ascii?Q?J8jI2g613Q8KUSjckV66lxiSjLZXFajDnLj/tDTOLmKCLGF3pxUka3KM3i2P?=
 =?us-ascii?Q?tRK2XZOO9d9WMMmPaPK67k1ObTpAg89x0snLQsj9FM0BtDpAg59WGIN5vf17?=
 =?us-ascii?Q?7R2UJX971u60uQyi5kzf4140evEbaATE7k0ltub1xiWdjJKzIfVJX6NUPfpu?=
 =?us-ascii?Q?aLBnWTvXFdTtrlun2f7G0hBpDdW3yhlU5pI90yrKpeyb39O5oAxXVPgomi0U?=
 =?us-ascii?Q?XBVBCBK1UdKVMRN9pTRXk16WVOgXBFA4I8FCM/q4WT5w2MoCVez/tMztdmp5?=
 =?us-ascii?Q?+Lj81kcCd7YY/LwIVC+ROpm/zL14RhsJd7TyZerW/qur2y1JNE7uP+bzpvtG?=
 =?us-ascii?Q?uM+v11RkqoHs+WvErwX/+y1qKBFLpsLzf4pC1I8uVUNTV72pgwrTY3w8nesN?=
 =?us-ascii?Q?a45GB6i7LQxntT8Mwz3i+peJ9fxs7N+8yhF2V0IIn6PLlT9o5Nm3H3YkQmBf?=
 =?us-ascii?Q?vv8yOPw56Obw5XkN/Y8E5y4hhiS3uDmPlOYul+racMGbUJseVFhQIV1t5vF5?=
 =?us-ascii?Q?fFcrDFlXglykGY0yMwn5TY/JtRLII5Az1IwoRz7Bv/6+LSOOAYzDV/QfOL82?=
 =?us-ascii?Q?twYt+DvIILlM/dRwD+vhU13Mrzl0k55O4lJp9xrE7auQO04Yq24aUUb93fCH?=
 =?us-ascii?Q?Pt0m0thBFePL12AaCkSgVFXh6R0kzLE7VrEDM5ZoGM7H/QLlNL/+kXEn7cbt?=
 =?us-ascii?Q?dpInZBD5RqTmQkkU2/aGdk20Hx+vvTnZ7yQs0m7F+Wp8BRT/21l4+cFXER9g?=
 =?us-ascii?Q?uI4G2X6UgDqCep9VMRbymD2QV6Ug089r2JZTL6rEAbLMWnKy9T8gEyioHgR1?=
 =?us-ascii?Q?boF1KdPS/yv2ZGdzl66DQG0F59ITPxaKxhMpBViX64WQvStr7wyHh4DJr5cH?=
 =?us-ascii?Q?0Psnhpx67VB0yAvfIN6+55I9NaSPUlh7FkMq7CxKU//I/799i45vXatmsIlk?=
 =?us-ascii?Q?lZlE560rsQg3HrkkN4JH4WSD+JmckTro0K6DLSjMHeCGF1Z4K7YEJ0GUKyFe?=
 =?us-ascii?Q?teSrL1hIhfPBj/3UL47emVQKjHIrqyZyqG5Qz/CpHmz2QBr9SwYZbaqP9u5A?=
 =?us-ascii?Q?XIFQIui8a55Q+MSh4YY9ADGm+o/v8jqsRa7rmwPG7QNGUFQFelrvLrWVW0TS?=
 =?us-ascii?Q?yNLM7eg0VN9RceqjXc0mnnRs99iPfCXQ5KuKJPmWdnrMQZ/XZogbLNFryrUm?=
 =?us-ascii?Q?KF4vt76vzZo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pThXNqTDew6UlygPzvfHUKA0seqyGbOP9eQ+OD1tzcLw+XxvNK45wxzrLLaF?=
 =?us-ascii?Q?ITNRqXpMPP0d/bXcGLFkrX8PMtAeOcpR7mm8jTlPub2Ek7hkClhd+AKES7fx?=
 =?us-ascii?Q?UcyBsAkr8qJOwayDXPD82On4uaHOD0klTZIbeRP5N+ai/4i8TAbYmjh3Mc77?=
 =?us-ascii?Q?CPE4HCg9mN7xDmgrMPo7LM85rZI/Idz6qQJfAu3Q+/t3UzkX4VqMSkcwP2QC?=
 =?us-ascii?Q?FOQuy+BNbz8rQyJVHLcYhA5ZG4gxzb3TNUhV/QnvXFfrlhUMHC2ALGDTuEdN?=
 =?us-ascii?Q?ARJYw5XVr1+QNUk4+gBekyag6qFma+8qGbzkB7iJPaBj828V2J+61fbtd3uy?=
 =?us-ascii?Q?0qviF4yKdHR/L/o67b8GU6e7TPW2zWgJ2XkqJnEy3Bpwi77Hr4T64IYbKBXy?=
 =?us-ascii?Q?/49AgwmJZ087VXdvl1IHRbBjxS7hQZLoOHFsZyTB4QhTHH7XHm+UfGpCjobB?=
 =?us-ascii?Q?euuM06JwZIEr2ohJ974p/5QfPa2L2EHOIR69pgsZtpHEyQq5z1H1HOVf3Mh/?=
 =?us-ascii?Q?/zh24Wd0pi0aZ1szNomXKjvSMdw0gGvSMv/v2XfcIZI2qxB392vL0ypmNoMr?=
 =?us-ascii?Q?TrmQV+BJMnsgS+tK/uhlgVmNbW2HZvc/WjlrUODVORdh+Cx2mNQ4RdPOz3BT?=
 =?us-ascii?Q?cc1EALkyrWI/D2vNPg4u1tqjqxRD0asJ8lkfX61hkpfqzZ/ZGJJVWXz5fqPw?=
 =?us-ascii?Q?BCa21IcBZSM0wgu5vuJZBS1pMnFXqzlZA26Hv/YhuCrcLO3urbdugxLUl4L7?=
 =?us-ascii?Q?9a4jJoKve9B+/3Oubl0Ly0e7Q+SFgterJTZVM6gPGqGQubS4Vq4OfK9oNCJq?=
 =?us-ascii?Q?yJ/DsxNepCSABeD85TdfUw8yPXj5GIRKvhh+U2hX3FaUQjAnQc+Vnvh0DCFa?=
 =?us-ascii?Q?Hke78gUyuHunFqDsKURcG4IUBiUQ9HaqcpTAUAfRQ6a9DbyFfPOSQ1I/OFOQ?=
 =?us-ascii?Q?oo8Oq8bwh8FwHJCtgV0vSmBtKimCt50aQ1Q+apVGqY6N9FMvxwxNWOGnMkTV?=
 =?us-ascii?Q?xf5h4oG7q7qdIAEEbKDhgEiGJpfY2CrUHBEDDdGjErWwQoiAGp3wdCmaTwhU?=
 =?us-ascii?Q?eqMQu+ar3WNsF+IRTq+fyWaHmNnqDo2KqnhWzNSmH0P9PAwfyqURgXwpzdzd?=
 =?us-ascii?Q?lqu+15xNjDmTwEEE4Ik5tuzyZ14JCsOQVhbMLgxxoAl0DZo/H43mufcdgshS?=
 =?us-ascii?Q?LcSu5dYwWVIGLoPEWQrrTkGdl5leeVkEgicUVQOleEoHtxyQOZvVbwQe5Nps?=
 =?us-ascii?Q?axr0t8cE2pEiOYjED8fmA0qL7tvpLSyIUej6j5V4COIpeNcn5B6jRvBPdjxb?=
 =?us-ascii?Q?0V9T+RUaGFsMPnZjrVvDKWFQIzb1zJo8RqT5ah+xRdBcP/VA4BvunmCzq7mg?=
 =?us-ascii?Q?9ouWlS4b9kUVfXo2lM3uwVyDpmYKSjEiFTIJW1Apek1PkZgMWD0FwmDHooEe?=
 =?us-ascii?Q?y+/VNA4dMnDYCWL0Ix2m/maEQPTvir/kodWECw0ZTwenb39QoB1batPEQyrL?=
 =?us-ascii?Q?LYWZhX3jky0xFzew0jNiXRPgr0qRVF2LkbYVmFTFmcMVNDFf9B5LB7xNPKub?=
 =?us-ascii?Q?1yC+bCmMKLUGB8FAxcz80l1NuMNafYWeYw7GXHc8+B04Fkrk9ugKa2nUs/PB?=
 =?us-ascii?Q?fAClKKt5gwud6/7aGleETe8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8e1da1-8b78-4522-702a-08dccca8606e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 06:11:12.4996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+te+qicAnHF3/pbfOIwrg2+vITSIFb/BwVeeUutVnEvRwYNFoMJR1842Tk21tdQb4NeemISklgRS1mTOHbee4TcMdvfw24GKu1QjKAUCrVAwPfQhWGJoN7E+FM3G3GT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7309
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
index ad834d8b8c1fe..def152c610499 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -716,6 +716,33 @@ struct device_node *of_graph_get_next_port(struct device_node *parent,
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
index 6fbd2c8696fd9..4a91de147604b 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -62,6 +62,18 @@ struct of_endpoint {
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
@@ -76,6 +88,8 @@ struct device_node *of_graph_get_next_ports(struct device_node *parent,
 					    struct device_node *ports);
 struct device_node *of_graph_get_next_port(struct device_node *parent,
 					   struct device_node *port);
+struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
+						    struct device_node *prev);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -136,6 +150,13 @@ static inline struct device_node *of_graph_get_next_port(
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

