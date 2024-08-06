Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4FF948893
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 06:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0509010E075;
	Tue,  6 Aug 2024 04:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="NO2+0XIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A9210E075
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 04:58:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnexMjVng8HVxgZiUrYKnJdyPkC3lOaV+yBtUvYtwMQ5wtGd8QzDLzo3I4N2HsKp2FxF7a9Jyb61NtDSmM+hkB5EoSraRp+F4+htwWEkUYuM/oo68ccWeWOu1hdV9Qn6GQyvDyx1fwpPH0ccCWU+t6g+nPD2uIUPw12TvA2XEI3v1A7USQJMGGny7+ODYNJB/GRCcfAFykmvDqiQxN+P32oGFOpxSLhz23V49LJlHGSgHwsMyuhf3MbJkqmqb2HhwzAdaZg3wZJUiQfjbbAJTiMRRjTkB4Tgg2mFQZuEff9ZvS4GLBg/bsYemo7hRAZhrQqkx+rt0qDchvZzCGwxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ePXdTA+EB3d7vLEAvRAo9e1gOVehdylHGSLVMS6Dik=;
 b=pU8gGLFVcU0CuhOKuEUK48XlGxpZXLDinwc0EeueWSUcUCpUwMs1co3sF2HI2YLr5jJhAjVAWo2iEkp9mdSdBEtfnwjmFV89FQmOIPYIOf4hlH1p4xIJex/GCiSZH3z1cEwbiywHSN9wVCNp5acjkcHbhdA73D2fggNArs/EKq2u+c674HxrXQfQLskaftNqGIKNCJ3vdE9a5gAV6NqnjQCSYhrtGWgHU29u6pVU1d5EjNFBVV7n9mXom0bjdJyBgvymsNYWBcpaV+o5FmDfAnB5vyKs/ajkPci1a8WHFx+5V4ZKM1hjYuisx3spQp+ZAXo1tFLmxuQM3LBnKf0w4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ePXdTA+EB3d7vLEAvRAo9e1gOVehdylHGSLVMS6Dik=;
 b=NO2+0XIQYKu557XK/m8Ekkzhm4Sf4nViWxoyIUrJgKOJjg8ywq3WhkesS1AmQlemwCkXqcmmSc5OtZ7eb/sPpYkOBJyyAFhQB939vuCiNve/IN6+gEhKM11g0PKhA1mlAw7i5YwcCtgELzvzkI9qE5X5mGfQs92B3YZOS6VFfYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10409.jpnprd01.prod.outlook.com
 (2603:1096:400:24d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 04:58:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 04:58:19 +0000
Message-ID: <87le1aw8lw.wl-kuninori.morimoto.gx@renesas.com>
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
Content-Type: text/plain; charset=US-ASCII
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/9] of: property: add of_graph_get_next_port()
In-Reply-To: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
Date: Tue, 6 Aug 2024 04:58:19 +0000
X-ClientProxiedBy: TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aec0ea6-261f-4bcd-ce22-08dcb5d4641b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p51tJ97sEnOj3jZ0jt1v3uQKGE8eIUQkvrTGeAwSn/iHFW7Ap9tfQ7tx9Fsd?=
 =?us-ascii?Q?Q4xXc9UaFbBNfFIIV3b6XwpiorobjfcdxZSVZhXSlzZDXr1d+wdCz5GdCw4I?=
 =?us-ascii?Q?iTqFs+1tkSoZIhWriOnW+lhmZktD6kXipFrhLLb/UZ5NewmBDXxoxJybwxRY?=
 =?us-ascii?Q?udgra4p5iCm5TUAHsXM/QUm3yfYllOnwIAq7oaB+o8Qfjb177xvCu4rk63Nu?=
 =?us-ascii?Q?B8UrKh52lSAV0He/QWt6uDm6ccipkQ/rDrpW/n9WYn3m+u9kAdEGJIuvWl09?=
 =?us-ascii?Q?kIJ9RkXIVMSPfR9V//Aok4cpU/pH/GiHu1iTRgQaIygZW2VVAfj6K+YQ/++s?=
 =?us-ascii?Q?zZdtV5TBgLW3xORw0HrrpfaCPK7v9GgCWBb7Sns00i3kCuEgkyFAqCI4YSua?=
 =?us-ascii?Q?Kkf68iUG0Kc2QTP8sPf1z93XNo+Y6mlvW1FPLtnFY4k3lfJsSpS0zMuuXzII?=
 =?us-ascii?Q?OcpJIht2RyTk6DQa7NuSy35WB4FA3t9BSpE9gDUnxXU/q4v093wtLd/Gecez?=
 =?us-ascii?Q?yKjhyk0mPrbZDXBi3fP0CH+dwCv+vuTMQ6/QBcnQagbMJd8059K4Zt0Bnb3a?=
 =?us-ascii?Q?HKhPUSzxZGfpxqZZvGwR4HwNKTzknlcuKnoQ1GFx7SJZl3IEWmZjEnht03Az?=
 =?us-ascii?Q?ogn5lyN0PLS5U+zfJuAeWVcyQHvwFohUZ8MLHd7xs4q+QuL3xAzyTqxRtBBA?=
 =?us-ascii?Q?t6reCGLj7v4u4ruPJvRX4P4SKvGHhnqYENFCawlwxVk4khJwzHMgP0wEuj7a?=
 =?us-ascii?Q?ho9uXMyxZzMkTb91YbqqV9PFcBWOlJbT/r1MOrJ/q+pWE7EIHcshOenlgEkY?=
 =?us-ascii?Q?S7phML6IdpuveZkc/K2Sb3EVCufqLrkGG6gsjMUcKKp4u86r/DL1zj1WczEO?=
 =?us-ascii?Q?wr7JDEKJfAcC2dsvZ6q00h0XjCMZWhZZMztQP+unebztiYYLx29CEeFXeYL+?=
 =?us-ascii?Q?D4oviG1SK51GUgY8aIB2qOj9TRNx8EDHo1/WlawaofMqvx4pKW22TQbcsgSU?=
 =?us-ascii?Q?IwLfPAtY7yenhUbTpPaoAfQP4qkzM2Z+lLn40wPnJW3LZNrzxZns9hZDWdhP?=
 =?us-ascii?Q?ZJthdsNchOhHlbSDO6AeBpXMxCFpzakV3zb/7IZB09TblbG+Wi/pHPJo9No5?=
 =?us-ascii?Q?ThSA8eY5OO0vD0YlxFTlU5a8A4lVyeForqYvkLYMBpEoK9dJyTmilYZ/C2Sd?=
 =?us-ascii?Q?WJ9ZMom6CC3EnH1LP1towcTWttbTKklCr6nkBHlPx9z5yiK26fB2LFUDwjl9?=
 =?us-ascii?Q?CRhWEX3HC3Cau9IlaVVqVSQhjGLI00F/VkOMmgUgkR6v7wux47MoTWZFnEz4?=
 =?us-ascii?Q?dfFTpuwpDLvOH9QJbui6mR+eQOmBBong2XyNsrTSZ5AaL9FYqwJgC3R5DRSd?=
 =?us-ascii?Q?BFguZ54/vTbyRwQra7WINEJMA78atUo7P7qQjn2B5opvn6XGpCka5zHIpnZM?=
 =?us-ascii?Q?IY4l+lHjO/E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6zpliLo/KM5jO2OWopwU+ZoYmh5GvE5+VCZ9HNcgdLDAnrXs9QsyJs+NI+xM?=
 =?us-ascii?Q?e5RIJ5Txa3GlGLtGfjpAX1pSn6J75Si0M0si7gdN27Y00CLphmcDxszZn/kG?=
 =?us-ascii?Q?qPqI8bzpHudh3sy7xlTHp5Kq8C8u0MyhcYjTSj3csnYfLHo59Y8eKZxItGVl?=
 =?us-ascii?Q?G2Gtzbzc7Mn8MOl73BfdZC0QZcoUxKsL1QNrxtCkVXde3dm5/ZEt6eoTOoRU?=
 =?us-ascii?Q?kDdFs+COfSIhknUi5/oIf1okHxqJ7J0uS4oZBbl6fsB/T5DjAVLgmQJLLFjC?=
 =?us-ascii?Q?qBzX0FBbKW0DKzPhLqmi92lIzP51LwrGILxLdid/77KNzID2S4YPkNNPqAmQ?=
 =?us-ascii?Q?1O+Wb1b7owE0cNmRtNj+uQ7/71t86/UA0X5kSmTN6E0SgxTGI6yOK/ajIGT9?=
 =?us-ascii?Q?a+zVBoTkZ8ZhOcE7kfR4quGyqI0bHIUGZCivHTsLHUa6SrzbOzFjuP/V8G5V?=
 =?us-ascii?Q?RdK6zK69Y9t+7K4vi9iOq+h3fVUDfWh/44GeMqAirlKjhXgTscDqXWcxC5Ny?=
 =?us-ascii?Q?zyv+59oXX2r0xpVdDgOycVvZuyJ7DWYVFJoHQQHYVXz6gn2nIFVeEEsUIw1C?=
 =?us-ascii?Q?LUjYeZOnwlkPqoXom8lynZAbLmcuQb60VBCxDNLeRaQdLojyFNWaKbdlxB2G?=
 =?us-ascii?Q?ylxC+AYKBOiz5OiAalqifQBT+vmMfAlnJcVspmNYE7sZlN7ukIdPqQ/fFky0?=
 =?us-ascii?Q?zSz80SIWVaU3+SKzET/esCNnqbzlOjdvpmQGF2gqjLxGeQet9cWW1Xez/+Oj?=
 =?us-ascii?Q?z/wIgDbd0l12gKXdwl1cyLFv2w9AS6oLeB05kImt6TQmDq4UjJtVIh6UFgNe?=
 =?us-ascii?Q?sr5tW74OVW6OeJuWkNweKV8/sZ4ImJUR0hI39CgJk3SK/wU3NsFMAbobbZ/n?=
 =?us-ascii?Q?sj+e6wC3cm4WgOqg5hNRDYJhtlVoz0YUkAXL4kb/wjZ1y/oDmfCORz57AkM3?=
 =?us-ascii?Q?S1klvJMECT95SkvECK8kc93ZxXO5uhYNhVqp455MwmgHwUDiQGHEc3kvR8yB?=
 =?us-ascii?Q?lEttc7e73hd74leU+UmDM87Aduio0MIEFKtPUP5v4V6sZXZf02pt/WOIPTIL?=
 =?us-ascii?Q?S8W6NXBzB0XBNgihcwgAJu6Eg3Xzx/juq99W6YPc4vBbIGlfOQIdNtzocX9b?=
 =?us-ascii?Q?My2otHAQ4UgubUk2cZLivVRCsw1ogXFGI3XcNWe3Fdf1wGjMfEH4HzQE1c5z?=
 =?us-ascii?Q?5mnZHBI2J9TEtIuqvHE4HN2wBC6ph/Kjqkop6wCWpsAUMoNryPHm32MsF6zZ?=
 =?us-ascii?Q?Az7r2SiRPLi4Ge5dUPS4UtwhipUIn6e+r/lsXxGz7KWecL6SQsPpLTGVXkcZ?=
 =?us-ascii?Q?WNuIfinHJSYnKapGLlKIVIswuSHt8BpOg0ml0+U5jdKtuUI55OU4xZr7fRqm?=
 =?us-ascii?Q?AC0iPiooIfIPrHt6yN5kq90wtzwLGYCmkQ7lDHapH4VtfGq4X3WRrmJMw+WG?=
 =?us-ascii?Q?keXGfvozPMnDOwtODeVAoK7g9lf6OuzEs/DcvYv8Cuqqv/rrEqDXSbKnTqHx?=
 =?us-ascii?Q?1P51Bi7qXMBCYJeNkoyNDSbjbh38Kv3iTr/1AZdnH7XjBeWqxY2LeEgKDCGQ?=
 =?us-ascii?Q?IfRKHw4iBcI4Oo/eC6K5JxVKrHmVJUAbjVMWgiL5DNbH4X6Hh9rQdpIJYlol?=
 =?us-ascii?Q?upav/CdfF8RFwJ1GpqNsOak=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aec0ea6-261f-4bcd-ce22-08dcb5d4641b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 04:58:19.8004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXZYxVkL4az1bh+lqFdOetBGUWNxAhtKCbtLSGZM1nC22WnAEik1iQXNCS+uun2ivj6f1s+3AgTh46F6YX+8bxADLNEB1bxgTrwct0ni2LE3rEiuUB1UcWH04OHBFV7O
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

We have endpoint base functions
	- of_graph_get_next_device_endpoint()
	- of_graph_get_device_endpoint_count()
	- for_each_of_graph_device_endpoint()

Here, for_each_of_graph_device_endpoint() loop finds each endpoints

	ports {
		port@0 {
(1)			endpoint {...};
		};
		port@1 {
(2)			endpoint {...};
		};
		...
	};

In above case, it finds endpoint as (1) -> (2) -> ...

Basically, user/driver knows which port is used for what, but not in
all cases. For example on flexible/generic driver case, how many ports
are used is not fixed.

For example Sound Generic Card driver which is used from many venders
can't know how many ports are used. Because the driver is very
flexible/generic, it is impossible to know how many ports are used,
it depends on each vender SoC and/or its used board.

And more, the port can have multi endpoints. For example Generic Sound
Card case, it supports many type of connection between CPU / Codec, and
some of them uses multi endpoint in one port.
Then, Generic Sound Card want to handle each connection via "port"
instead of "endpoint".
But, it is very difficult to handle each "port" via
for_each_of_graph_device_endpoint(). Getting "port" by using
of_get_parent() from "endpoint" doesn't work. see below.

	ports {
		port@0 {
(1)			endpoint@0 {...};
(2)			endpoint@1 {...};
		};
		port@1 {
(3)			endpoint {...};
		};
		...
	};

In the same time, same reason, we want to handle "ports" same as "port".

	node {
=>		ports@0 {
			port@0 {
				endpoint@0 {...};
				endpoint@1 {...};
				...
			};
			port@1 {
				endpoint@0 {...};
				endpoint@1 {...};
				...
			};
			...
		};
=>		ports@1 {
			...
		};
	};

Add "ports" / "port" base functions.
For above case, we can use

	for_each_of_graph_ports(node, ports) {
		for_each_of_graph_port(ports, port) {
			...
		}
	}

This loop works in case of "node" doesn't have "ports" also.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 86 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of_graph.h | 47 ++++++++++++++++++++++
 2 files changed, 133 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 164d77cb9445..3b2d09c0376a 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -625,8 +625,76 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
 }
 EXPORT_SYMBOL(of_graph_get_port_by_id);
 
+/**
+ * of_graph_get_next_ports() - get next ports node.
+ * @parent: pointer to the parent device node
+ * @ports: current ports node, or NULL to get first
+ *
+ * Return: A 'ports' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_ports(struct device_node *parent,
+					    struct device_node *ports)
+{
+	if (!parent)
+		return NULL;
+
+	if (!ports) {
+		ports = of_get_child_by_name(parent, "ports");
+
+		/* use parent as its ports of this device if it not exist */
+		if (!ports) {
+			ports = parent;
+			of_node_get(ports);
+		}
+
+		return ports;
+	}
+
+	do {
+		ports = of_get_next_child(parent, ports);
+		if (!ports)
+			break;
+	} while (!of_node_name_eq(ports, "ports"));
+
+	return ports;
+}
+EXPORT_SYMBOL(of_graph_get_next_ports);
+
+/**
+ * of_graph_get_next_port() - get next port node.
+ * @parent: pointer to the parent device node
+ * @port: current port node, or NULL to get first
+ *
+ * Return: A 'port' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_port(struct device_node *parent,
+					   struct device_node *port)
+{
+	if (!parent)
+		return NULL;
+
+	if (!port) {
+		struct device_node *ports __free(device_node) =
+			of_graph_get_next_ports(parent, NULL);
+
+		return of_get_child_by_name(ports, "port");
+	}
+
+	do {
+		port = of_get_next_child(parent, port);
+		if (!port)
+			break;
+	} while (!of_node_name_eq(port, "port"));
+
+	return port;
+}
+EXPORT_SYMBOL(of_graph_get_next_port);
+
 /**
  * of_graph_get_next_endpoint() - get next endpoint node
+ *
  * @parent: pointer to the parent device node
  * @prev: previous endpoint node, or NULL to get first
  *
@@ -823,6 +891,24 @@ unsigned int of_graph_get_endpoint_count(const struct device_node *np)
 }
 EXPORT_SYMBOL(of_graph_get_endpoint_count);
 
+/**
+ * of_graph_get_port_count() - get count of port
+ * @np: pointer to the parent device node
+ *
+ * Return: count of port of this device node
+ */
+unsigned int of_graph_get_port_count(struct device_node *np)
+{
+	struct device_node *port = NULL;
+	int num = 0;
+
+	for_each_of_graph_port(np, port)
+		num++;
+
+	return num;
+}
+EXPORT_SYMBOL(of_graph_get_port_count);
+
 /**
  * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
  * @node: pointer to parent device_node containing graph port/endpoint
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index a4bea62bfa29..30169b50b042 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -37,14 +37,42 @@ struct of_endpoint {
 	for (child = of_graph_get_next_endpoint(parent, NULL); child != NULL; \
 	     child = of_graph_get_next_endpoint(parent, child))
 
+/**
+ * for_each_of_graph_ports - iterate over every ports in a device node
+ * @parent: parent device node containing ports
+ * @child: loop variable pointing to the current ports node
+ *
+ * When breaking out of the loop, of_node_put(child) has to be called manually.
+ */
+#define for_each_of_graph_ports(parent, child)				\
+	for (child = of_graph_get_next_ports(parent, NULL); child != NULL; \
+	     child = of_graph_get_next_ports(parent, child))
+
+/**
+ * for_each_of_graph_port - iterate over every port in a device or ports node
+ * @parent: parent device or ports node containing port
+ * @child: loop variable pointing to the current port node
+ *
+ * When breaking out of the loop, of_node_put(child) has to be called manually.
+ */
+#define for_each_of_graph_port(parent, child)			\
+	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
+	     child = of_graph_get_next_port(parent, child))
+
 #ifdef CONFIG_OF
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
+
 unsigned int of_graph_get_endpoint_count(const struct device_node *np);
+unsigned int of_graph_get_port_count(struct device_node *np);
 struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
 struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 					struct device_node *previous);
+struct device_node *of_graph_get_next_ports(struct device_node *parent,
+					    struct device_node *ports);
+struct device_node *of_graph_get_next_port(struct device_node *parent,
+					   struct device_node *port);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -73,6 +101,11 @@ static inline unsigned int of_graph_get_endpoint_count(const struct device_node
 	return 0;
 }
 
+static inline unsigned int of_graph_get_port_count(struct device_node *np)
+{
+	return 0;
+}
+
 static inline struct device_node *of_graph_get_port_by_id(
 					struct device_node *node, u32 id)
 {
@@ -86,6 +119,20 @@ static inline struct device_node *of_graph_get_next_endpoint(
 	return NULL;
 }
 
+static inline struct device_node *of_graph_get_next_ports(
+					struct device_node *parent,
+					struct device_node *previous)
+{
+	return NULL;
+}
+
+static inline struct device_node *of_graph_get_next_port(
+					struct device_node *parent,
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

