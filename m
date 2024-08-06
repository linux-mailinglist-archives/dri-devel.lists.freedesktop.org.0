Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB361948896
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 06:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA1910E2EB;
	Tue,  6 Aug 2024 04:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="JehxJfl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82C310E2EB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 04:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klsja21M0A3l11cMkkxILdhjHjSzBrfUuBwmoR6G9LqoyIusVmErZoNLlWzBDO5xhFIhr8BnLkT3Eqdcu6K2ZOa/1s02dKIkKLX4LbLzQtKgGxKeksdSa9J8O1LvHk9aLGELmv3enPaC1nC3TNDJWMcUbasYiZgS+RgfSDDvyWu4bfJB8j/oPJi0E64qPBArFGg69rw1ueUqoz80FXjGg44huftYnyXFK73ySz3NzxrynnSP6ry4/sye0rnBQ4YXE+8y7qR6vv8cs5LLkkPxAbs3asTgB5aXfbZQFIitXoricF5sE1LJYD71296XCo12LANOXqeerzNt0so1peTH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7p6eoE6N+1xmYecGXR25d8woQupOR2IiFBY9GkbC3CQ=;
 b=j/BxEyjzjLezYKwHRJMzlkIp46VLwRbPsCNOAQXYdIwmv0DpPpeL/Cx2jqEkp1d+cfbkGk5NS6fHHiSm7ckJ2jYAunqlcosYKThjiY93K6jahZQSUpbBiUf12T1VF45SvGYTPxa2zATMTN2GHt4icDIl9Ow+5FwqeldUvDGs7FLaM4yEUjV67nfREv9s2zkuox6jX+FLhBQkT0/JzbCzwWmjRm8qSFaNeycFVm2tESZnMnG/GGEhf+6UVg2U/9FqfoA9Kk4q5lb9u6ohOXqQVrzg0ssILmYh+vFOFychiQfOQssG6mNUMUDOOHWsxAkQMBcnVE4HPDYnhSlVkXfMwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7p6eoE6N+1xmYecGXR25d8woQupOR2IiFBY9GkbC3CQ=;
 b=JehxJfl9XXUUCSH75ha6VJmRwBlnYfvGIb3fCFB84kO7RBNvrGjPxYxlwXVeh9DR5/W9YzkVZCTRXdF/lnYMJ2i8Xynj9D26TEFeH5A4vXgMqKMYQYvkKELC3dNcEOoCztHlDO7bMCBJj4pai44VdpJHtsiRPMZAPcYz22nFQe0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10409.jpnprd01.prod.outlook.com
 (2603:1096:400:24d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 04:58:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 04:58:29 +0000
Message-ID: <87jzguw8ln.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 2/9] of: property: add of_graph_get_next_port_endpoint()
Date: Tue, 6 Aug 2024 04:58:29 +0000
X-ClientProxiedBy: TY2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:404:a6::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e36304-b05c-499b-96dc-08dcb5d469da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SMgHLhdbIPkOiu4zFfOh//J8alWCI1DBA9UhGNtgdepQejmKWiryup0PNQwK?=
 =?us-ascii?Q?NvTkP7MJR2n+MQyMNnbkFszPp6MHB86yn+ObyzE5XqGqKbo/99UtFPx4rtI1?=
 =?us-ascii?Q?SBakhacZj36Ci7zRUQbzC9Q0JNJ7h6zdNWQTnBPRKG/B3UWwZ8SyL4jOqdxG?=
 =?us-ascii?Q?08YU4Lq2NnbqVfDZapoD8eLDp9o99zpTwiK23s5rGmTybTJbKfO/EcthxWK9?=
 =?us-ascii?Q?0ns9hiPQrGtmOSyPfQgXnfcWx+9+NSldaY/1FauCD/nv24/SB3D9NOdIN92g?=
 =?us-ascii?Q?dllbMi0SEQH0nX0qdE69ZjOCMYTQa4OO/kQEPw+00exdOx++Fc65jcHOkLP/?=
 =?us-ascii?Q?bZ2a+xHALNROaLDmyANgnj7cOReHXT6K4fwx7mc4zb4Wc5SkHmxrQq3pkkdx?=
 =?us-ascii?Q?LnrISyNwEvCaNIDQfrkc2UBCYqGNWZv3cjdAJi5by5iX1bp1tXG3VDA9BgDj?=
 =?us-ascii?Q?pe/2evCiUL8HjpYTQHyWozudLQWY1OvN4MR6xN/tRfPqmAcNty86RD5GkGv2?=
 =?us-ascii?Q?yx1KbaOqv0ancoVEUCRyP6/58H5yByspDwF+ANVVifvqW+iBWmpI4z3QOb3b?=
 =?us-ascii?Q?CPUTcfN3U2XyQaRtkVtOsmk1w0sb8pPvFXIWbcwb/QOcnzraRXbNMbuIaVrz?=
 =?us-ascii?Q?ewBAYUcqf979HiuvpOG99YkyyaBcAYmE5QkJWXO0R749y/ZnxwarZ2/c466m?=
 =?us-ascii?Q?zZlmvSIPT0MKgEqWlzjXb08G6I5nCAwSfDh7+iRuzhQ9oevCZ+Eq9EHDWd/T?=
 =?us-ascii?Q?AqIiEicoRXPDYNmIKuabQlCk4ncMFGlsyaTNKOFoUdL1Ht/wnH16ndZ7mK2U?=
 =?us-ascii?Q?Qcobh7PGqmQ2CmtPh0sD9/H5Wo5I01HcIK2MgAJUYNyoUOmBVk3tR4att+iz?=
 =?us-ascii?Q?JkjGMi4U6WfSi+6+1Heofrg0HYO0AoAwJMuh/wn3AYs8E7+L4sx9d0wY/i42?=
 =?us-ascii?Q?iS2flfmN8Ni95/7YX6jrMjDKRo+Ercw7LiqNXOye/SGeID1Uyj5UCxiNUWB+?=
 =?us-ascii?Q?bGSzyLw5pCZDcT1jCQSCDAlHcpR1T9mSrdx6DvD2+x/007jtkhfZoWv+uSsj?=
 =?us-ascii?Q?PH3z7xN+OyHW4fKfXyCyWMhK6DoQqF9ydWFQ7MCwinflO9JtkqK4VMG2/vqG?=
 =?us-ascii?Q?FdpHanf4Fa5FI0iu6d/EhDamqjn6UKKGaVFEm4/FL4TsVGpJ0Yx7oyz6g8aW?=
 =?us-ascii?Q?HNQ0qxue2yG3xwd9EzH7jL4+lP0h/nigkF4HqXR5eSH3e8tpwS+dnmXpguyX?=
 =?us-ascii?Q?b2iuHnBL+OAa7NVIVwV8E+Y//pdCUI3vgdUAx+5X1xbLRXmmDo+B8/nG35Gn?=
 =?us-ascii?Q?d55U+dRhVbd+13c9P4d67beTDpjsZTNdV7oKYV+rWa3iNMIeQu0iWZAg5uW5?=
 =?us-ascii?Q?Cs5QU16UXK9r7LwGrLH4BH3/915r4GvlgdcjjGYq1pxLJdSPEVq6yf2DRzMv?=
 =?us-ascii?Q?W+7S1CvgO/w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?996hjRTKvpcB/bds9g74VaRmCQNqgYDh0GKt8TgkGpetLJkUhsE6GOQhZKJZ?=
 =?us-ascii?Q?Y3xBaq8i0v5me8nwLwiPgX75+g/GIgWumtWdfB9jCXDQG35ms4bMolh1ipC9?=
 =?us-ascii?Q?Jk4/rOi/XNISRb6kIGD5WWGWThSUKAPRXBVqRHhYTMXq0YiWMqenmaG/V5Aw?=
 =?us-ascii?Q?0GM6gwvU8OIA3x7AlpPgaf1ngGglnNEsdAq0s6XuVKpnySUyaoQzn3iEymtl?=
 =?us-ascii?Q?/awAXGjs4oXFvaGTgFNCZG+8aUY1iIxjK5OPdrq+L5GjKdjG4UfGWT1Al9x4?=
 =?us-ascii?Q?Wnm4gIUe8n84a2n+RR5l+C2ToXcz569mHNkA9nqWPJvpUCnSg06+YCJTaY9a?=
 =?us-ascii?Q?SRntJTcz/QCQh9bIBgOtJJIHcXkxAr2VCPf2lEWUiDMqTmjAW/Dxy92H+mWB?=
 =?us-ascii?Q?MpICWDcDZZ61WTYjVxpCokqd87OQyZeOaGLG6Ga9+ZdgsC8lLYIWVRX3PhNj?=
 =?us-ascii?Q?UaaNVLRj6Xr1uIo/p+elPzt2rjnKSFwGOH+IrpQ0GRlUaL0ssiXM9TCMPoPO?=
 =?us-ascii?Q?BUqS6zVzor8mspAdw2X18Q6CHIxqs0AB9CRx97CTtnkr+jVZik1k/BXXd5uP?=
 =?us-ascii?Q?dm1dgTyT2kjMl72UKteqck9mX7EuXxK5A6hpxziwv097mrRN3bYRVsBjkwFR?=
 =?us-ascii?Q?xTLxGwUAbOjfGnagf523WF0j+98dPycxuUNEthde+MK82g/0gNuv3aI3YfKy?=
 =?us-ascii?Q?/rHk1rZjm7dub5PJfln7zUO/QeMc3ZfJ89OuYbBV5Dha71b32wzcmmzhk/D+?=
 =?us-ascii?Q?nAtuw/+YtZ4jL3jtNWfQVbW4AB7Yb86HhyppkfsP3DpO+R87TL5mJTOiF0nB?=
 =?us-ascii?Q?9tlJ6O5/UQG1xtKK5m1JB+SUZqz5dp9m60+CmcfBSH46mg8OKMFvg6P/FWiV?=
 =?us-ascii?Q?a4aXZ2me8Xkk8uAfI1tpFuuJYQOwLdQAvSVw95WRCLeEUBIUBe33UiwtDjqs?=
 =?us-ascii?Q?qObPL9W72ciYyfk35htrX4TtRski92jhtzupe9ReXmpqqttkNvbeeQyY7b7A?=
 =?us-ascii?Q?fOwzSIpUTQGNfnV4OW822f3wY3BodaUg73vLxEhbEcjITAX9du1hsooqdBij?=
 =?us-ascii?Q?7hJuPtpPaqgHmmiXq/poPh+vMGOzrRuyC3nt4lQBaxJpBWuE2jhDBs3wFmo1?=
 =?us-ascii?Q?ficj4jJsnbkz+sY5i0isJQ0eF39Hqk/8cyoGr1LFHEK1s9YagDkKdkweR5Xg?=
 =?us-ascii?Q?ucsStveITNZlVUhXx9rX5xcMQcwOcuWaQ+zfOUc2W8I+YVVd966rZBImEv6K?=
 =?us-ascii?Q?yNqfWVzOcIChpNHuCU8cD1nBt0pw+vFRFwlJxak3mMFdSM/agKjpCx1WR+DY?=
 =?us-ascii?Q?AyQ71n9qpGTJxFMgSH+QUy1CoLrMJtquFaC1OKG41nMAL/bD+GHyfz63MMrK?=
 =?us-ascii?Q?LYMi5Y1GYKBtzLw0ZVji4yIZfEmG6Sr+WRseONC6yzUZSK2sBVF/C9MRiI0q?=
 =?us-ascii?Q?k0GsOPB8B+9Kt/JKWTPN3frS8KeOMaFjB/X3zhe7uAModMT8qwJ29C8H1iJ9?=
 =?us-ascii?Q?T4MJZip9jzOxeJIuYOTi8GQjAgcNRGXm/Tiie7AqegwM9HAiFepp9UUiCg+2?=
 =?us-ascii?Q?JHrQTgK0JBxX0O5tBOtVjWfyNWvGijeGqyWTOeLEbzF525/xOqToI6NVTglm?=
 =?us-ascii?Q?SrOPvl59mz0cvq21CjuLL6o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e36304-b05c-499b-96dc-08dcb5d469da
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 04:58:29.4257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNErPKKWFJ18kvCaD4BlJjL0fr3ZiUQXX1fH+lHtxSu3J9bN8s+/oRFN5vTbAQGauE9zuPNXMN5uaGIXzSDI/EvUJ9YVYkxOuFKe4O4XbRZglCyfLxtcOOZFAgeOvwqx
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

We already have of_graph_get_next_endpoint(), but it is not
intuitive to use.

(X)	node {
(Y)		ports {
			port@0 { endpoint { remote-endpoint = ...; };};
(A1)			port@1 { endpoint { remote-endpoint = ...; };
(A2)				 endpoint { remote-endpoint = ...; };};
(B)			port@2 { endpoint { remote-endpoint = ...; };};
		};
	};

For example, if I want to handle port@1's 2 endpoints (= A1, A2),
I want to use like below

	A1 = of_graph_get_next_endpoint(port1, NULL);
	A2 = of_graph_get_next_endpoint(port1, A1);

But 1st one will be error, because of_graph_get_next_endpoint()
requested "parent" means "node" (X) or "ports" (Y), not "port".
Below are OK

	/* These will be node/ports/port@0/endpoint */
	of_graph_get_next_endpoint(node,  NULL);
	of_graph_get_next_endpoint(ports, NULL);

In other words, we can't handle A1/A2 directly via
of_graph_get_next_endpoint() so far.

There is another non intuitive behavior on of_graph_get_next_endpoint().
In case of if I could get A1 pointer for some way, and if I want to
handle port@1 things, I would like use it like below

	/*
	 * "ep" is now A1, and handle port1 things here,
	 * but we don't know how many endpoints port1 has.
	 *
	 * Because "ep" is non NULL, we can use port1
	 * as of_graph_get_next_endpoint(port1, xxx)
	 */
	do {
		/* do something for port1 specific things here */
	} while (ep = of_graph_get_next_endpoint(port1, ep))

But it also not worked as I expected.
I expect it will be A1 -> A2 -> NULL,
but      it will be A1 -> A2 -> B,    because
of_graph_get_next_endpoint() will fetch "endpoint" beyond the "port".

It is not useful on generic driver like Generic Sound Card.
It uses of_get_next_child() instead for now, but it is not intuitive.
And it doesn't check node name (= "endpoint").

To handle endpoint more intuitive, create of_graph_get_next_port_endpoint()

	of_graph_get_next_port_endpoint(port1, NULL); // A1
	of_graph_get_next_port_endpoint(port1, A1);   // A2
	of_graph_get_next_port_endpoint(port1, A2);   // NULL

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 22 ++++++++++++++++++++++
 include/linux/of_graph.h | 20 ++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 3b2d09c0376a..de56795a7362 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -692,6 +692,28 @@ struct device_node *of_graph_get_next_port(struct device_node *parent,
 }
 EXPORT_SYMBOL(of_graph_get_next_port);
 
+/**
+ * of_graph_get_next_port_endpoint() - get next endpoint node in port.
+ * If it reached to end of the port, it will return NULL.
+ * @port: pointer to the target port node
+ * @endpoint: current endpoint node, or NULL to get first
+ *
+ * Return: An 'endpoint' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
+						    struct device_node *endpoint)
+{
+	do {
+		endpoint = of_get_next_child(port, endpoint);
+		if (!endpoint)
+			break;
+	} while (!of_node_name_eq(endpoint, "endpoint"));
+
+	return endpoint;
+}
+EXPORT_SYMBOL(of_graph_get_next_port_endpoint);
+
 /**
  * of_graph_get_next_endpoint() - get next endpoint node
  *
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 30169b50b042..8b4777938c5e 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -59,6 +59,17 @@ struct of_endpoint {
 	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
 	     child = of_graph_get_next_port(parent, child))
 
+/**
+ * for_each_of_graph_port_endpoint - iterate over every endpoint in a port node
+ * @parent: parent device or ports node
+ * @child: loop variable pointing to the current endpoint node
+ *
+ * When breaking out of the loop, of_node_put(child) has to be called manually.
+ */
+#define for_each_of_graph_port_endpoint(parent, child)			\
+		for (child = of_graph_get_next_port_endpoint(parent, NULL); child != NULL; \
+		     child = of_graph_get_next_port_endpoint(parent, child))
+
 #ifdef CONFIG_OF
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
@@ -73,6 +84,8 @@ struct device_node *of_graph_get_next_ports(struct device_node *parent,
 					    struct device_node *ports);
 struct device_node *of_graph_get_next_port(struct device_node *parent,
 					   struct device_node *port);
+struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
+						    struct device_node *prev);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -133,6 +146,13 @@ static inline struct device_node *of_graph_get_next_port(
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

