Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9287D957B0A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 03:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E16910E350;
	Tue, 20 Aug 2024 01:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="ACPQEUOl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B18310E350
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 01:36:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUqddecPG83EOwb6f5j7HjFAxcv7x63siGwZSmYnZlSpnyQ0IGzwd9kya8ODTLLGSC598RI9BtUfE2h1F7AYHoSDqfoUeQEyCo1JfT1Wb06RtmxPAf38UJprgiRDak1EbohxatTX09XaWUuDcpzSUVsmVHakFiP8e03gSenIUd6rSIu03YLQsYBeMC4Ec5hnD5Hu6YwzQGp6Xho++DdMcyiK0PI7UDCsCmq0jGEz0SqLp5tTNUC0/Nt+nE7TJkKwfoWRGhSXcTsr6vmr0KVPw7zrdEFoRYfTV5lJcdJIJYj0jzCzveUPHjxQrYHUNF0jZRiglFuz3JQRp0snpsLcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dA18vKKY8K9JbTVtVIkFGRw5M8O06+NHVtNAyhjGHec=;
 b=PY58vIn/sb36yEj4NZAlo+jzdjPKPNYf8pptnAe4K0juDzR523/jarJLBG4EjfdLI33qDQVofEx4te+mQZUbOy9PJwqxmsElNWhLUzMQD1Q0N3N4UvyjXQrymu3UoN5gp56PLBdQ9aKcoXKqNiAEMLDtiqTI6ysvMzJLZ1vggA3XkCTmVj3ATEIn7iYi8P/Ak6EEJzmmSJpZDu922l2zkLPDZF4+xmxaWW5Btsxkw6nfu3wt85gzR+t4d9Ek57htZ5rJbzq3jVwqkLcnbyp01z1q2uoM0Uzw8HRHhFLfyHn9Jipg5Le52yAXFKqfoah/dT61HZkEwxxfaxnHRfZmXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dA18vKKY8K9JbTVtVIkFGRw5M8O06+NHVtNAyhjGHec=;
 b=ACPQEUOln5TbGo/xnwyczqJM21yxYYcC7N9mlHmtOZz8ntocx/ieuGo6A02TotKiELGeMBneHtWi19TSHVKua6nMpYty4O8rzlVOeL83XfDPZg4/OgcqJaeh2rBxWL1W+Zj2F83I8c8h2eKWwCgp3rx7ANvywAguAell0Dc44N8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11234.jpnprd01.prod.outlook.com
 (2603:1096:400:3f2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 01:36:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Tue, 20 Aug 2024
 01:36:42 +0000
Message-ID: <87zfp8561i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
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
Subject: Re: [PATCH v2 1/9] of: property: add of_graph_get_next_port()
In-Reply-To: <20240811170316.GL2270@pendragon.ideasonboard.com>
References: <875xsa8gws.wl-kuninori.morimoto.gx@renesas.com>
 <874j7u8gw2.wl-kuninori.morimoto.gx@renesas.com>
 <20240811170316.GL2270@pendragon.ideasonboard.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Aug 2024 01:36:41 +0000
X-ClientProxiedBy: TYCP286CA0118.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11234:EE_
X-MS-Office365-Filtering-Correlation-Id: bddc8a73-bb94-4fbb-aaa3-08dcc0b88b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zGNTRb2d4sGq0l8B36S5czE3AjyL3a1Ro87T18qpk/o1VYSPakJAyIBTY4mg?=
 =?us-ascii?Q?9UyzKJjbMz1eAVwoyCZ93tNCXExUrrv8ceMuRdElCuBk7ao/4APMAbUqSJDS?=
 =?us-ascii?Q?wEpl4LKFL5lV/NdniZzx9sIevZ4CVcnkMdgiDjnFUHFSRtPaByGK2Gpy3SaB?=
 =?us-ascii?Q?DkhGEA48N9dZDG339QQCdy+2CHXCS8hE133OPhHsf1X0xtmzf8s00Vu2KGw/?=
 =?us-ascii?Q?wQHO0Wnbzfb+BTtOXLzzC8xeMuAkFpZxvACvzq3+YsvEbDSyawguuUL8TJAW?=
 =?us-ascii?Q?SQ57sVKlCYyemuy5HvtqeRcFFJoY+td8sReQmW/GtCWVgJDCUysGc9tuk+3p?=
 =?us-ascii?Q?aVyBAsA5UpPIhrZ5PsKIzwDr4a+1uECkA4nTNUJAdiEEEBF2rZ7h1p9nNNQq?=
 =?us-ascii?Q?mOHFH7W5kx7JNfKJWhz9a3gORaEJLIA9GnS+53uNz0JynesHCKRS2gI/9q+Y?=
 =?us-ascii?Q?NppsLa8oe2yOQxSM3vDir2eUHaV6NlA/kZeF+zpy3VmH2M54qCQS3rmChku9?=
 =?us-ascii?Q?AuUMD1u0lWO+qzEWGhOqgrwg0bDFCx5gMtjj3Nbo1+MaOS3BVVPtfKOkZPwy?=
 =?us-ascii?Q?PHLdCJEabybJzO6/r4JD4bjQD0sPG+sp2xDp3gshpPJ8PYItUYYmj9YIZ1nh?=
 =?us-ascii?Q?BFzlaNlPXRqDnE7aM4Vvhr8zBMTOV/jAR6mFLIavl6BuCi6Su+pPRR81MTCC?=
 =?us-ascii?Q?0ZAVAFyaMWS0oMbqRIM15/BLMy7JiZYm3MnyE+MQL3X1bQ/Z3VVMs18iRnmv?=
 =?us-ascii?Q?bWaxFqAnaqxqrZKjFrmuzL2CGcBfAzfIlMweXv0au1otVj0cm8Av34YO9+UQ?=
 =?us-ascii?Q?ZFtfrziGAfq3ac9nSS9VlMOc4X/lWhDlOSi3xesiwafIEvztwnAtDIWSQkeg?=
 =?us-ascii?Q?SG5D6FZlOc9keqY0xXgUzV552ZbZsd6H7sGSjADko6e+cAmRpru1uQVbDnnO?=
 =?us-ascii?Q?Qst10cCl4K9eORzoWxoE5c5wiy7lA0EMM8T43IU42ZtaCwSWT67W9UH8WtD1?=
 =?us-ascii?Q?ynZ8Aq5/hIJSYaGGOgncCH07ZJDDO1AjYQ+iHNztMB2bgDb/aERyNNlCZ+7Y?=
 =?us-ascii?Q?ADg/+ZZHk6Cixcktqkb1e3Z9N1SnYwqVJ1dK30NTrTakF/wK89BGoGi+i7LM?=
 =?us-ascii?Q?4M5IunBDYeL9/s/hc+xDHo3dl31uUVCY4OkM6ez6nsmGC0hJ1dgjV2KAY+DV?=
 =?us-ascii?Q?5g6TqE3SHnksn7KDLcDLcFnGv2OZBJMHRFLnwbhMU1qR1/kZs+1j6P+6+sfd?=
 =?us-ascii?Q?5x0DkeYULpvQeF/qPT0rOmIUWPwlQp4/GUXCqDoycTAZY2KtTj4XFj8YW0ye?=
 =?us-ascii?Q?soIoz5U1iwTySj9mi9/4H/ykoxG93MDFyT4aciBosgrXA6iORsGkFC1BTyTI?=
 =?us-ascii?Q?i4mEEQzHK86iNGrr8ZGBu4en0m0fw1P/s/2+rqdTrrc0Qm8EJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/3D7JrrKmxsu2Wpgy/hHtkhQjXpu/1OHkUAn2+3ArV8ACdXbIv0p1Ra/l+f/?=
 =?us-ascii?Q?UyWtKFZ8WxN9LdYAOjpGfkBK60bPRYIt59OxEJK+EwZk9+yV/204r1uPFEQK?=
 =?us-ascii?Q?3XzejZOLyhF9vCic2D2LAp2utdwUR8yd2EW4argEfsUFnzqn7eqIMwr4AnhI?=
 =?us-ascii?Q?mUgeRluNdud2OHOgVjdZKj5LkhRRMTnA2dCYKi8sqvIX6s2o29eAz1klROlX?=
 =?us-ascii?Q?QLQW/iFiRfdSKsOCI2pKELEV1JfaByqwL7JXPkJJInKifw8SmwoH55QRLAtg?=
 =?us-ascii?Q?rlfTLpXNSFT+zlceB1BjGN4EMCYrbD9jTDqc6ilE+hOhGZB5kG9mFyVN/BX7?=
 =?us-ascii?Q?m3ezwSIUQw2RGZ6T+CXGmwRtHbu79Nb8bBy8h6s1XOYED8Fn+lXf5DrWXIOM?=
 =?us-ascii?Q?hzyQU5a+nVjNz8Vfn723YkxBWFjTyS8JLqm6fjn+962L91VY8CqMrL5m7hhZ?=
 =?us-ascii?Q?VOgOtzAb+royyz24NFg+hFyGb7GcBvhAZCAplm+a/MLO5OP6zlZy0B6yrVVy?=
 =?us-ascii?Q?o7yUtDDZgDrOx1zXlyosc8JDSZZMo2k3Iy/tJxmzAxZW9s5BtE6qBD9Bs6u5?=
 =?us-ascii?Q?i+lblLD4/smDw2Y7dRIUuKE/1n+mxrb5GcSPQNaWUSWJB6n/RYGM+Op0MOCl?=
 =?us-ascii?Q?04QxptBQQ/wBy5xRmQgK/xEaRbK7Ms3bzEbJ/nCMTkVLSVf1ecZicGnEekKP?=
 =?us-ascii?Q?DMNPlWuYI7YM0QsDXBDq8f6VXQq+IoVXpBEDAmtgdkOrbu0O3UA6JZH4wOU6?=
 =?us-ascii?Q?YIflwDCmC/iVRPM+wZ9r2wFp7iWGy5UzZDUh06GlZizlEfVdLdU4dxPiJHtY?=
 =?us-ascii?Q?hnn80KwfG0axIpobT93WKNsan7vFIviDvkkgLHz8t1PMPv7QyDm6ZLQt/pnN?=
 =?us-ascii?Q?2N8rX/gsjAdgzrlWDPnYiugnVckPOZiU0yV273rqVVAnmUv3ohQaJuvNfEnM?=
 =?us-ascii?Q?OqRig9uw2Tdc+B+bvYoVjvxwhS8Emez2hrnhiuviP8i628jp1Ho0LNqQ7qOK?=
 =?us-ascii?Q?nsfdAzEPJCWxyGwWynx3BRjFiL/YJwAf7wPR55/GT1v+wctSMotZsiVQHwrb?=
 =?us-ascii?Q?UhQg0THAKJZ4Tu0dTde0cxX/SfEhVYv2AGUc+BshlExApTDDS6CcpifCaHZH?=
 =?us-ascii?Q?z3sYkwFdlS3K7AWqaXAVEeqEF/VqTK0Ha5Vi+hTc4YrRdsYZ6N7a1KR4uQRn?=
 =?us-ascii?Q?Hnh92iD+ckKYFg5N4N4Pv8SE8I9P26/V2bDRDsrXBAdoqWlfHd4fGdcWZiKo?=
 =?us-ascii?Q?TffQHk3t9XA4iZCe878SkjzAVfgXv0BWkMa1BtpK0FDMibJtv04lDdx46u1C?=
 =?us-ascii?Q?drUa/nEOp2NPtejIfV2146cYgOE93vAdAcMon5kSzlLTQiTVymfilcEiKhAZ?=
 =?us-ascii?Q?t17M5T6SdDrPxZOoYDe8MgAbeQSC8RQnqgC152aM43zCqnVPU3cjZoV3Tuqq?=
 =?us-ascii?Q?XWAmb8wRXqFDeup/+ihpoDCXi+59+BDsaBAJVy2aUBtJFgE9Z4IREDGv9v9a?=
 =?us-ascii?Q?i5Tj9DjKniaZAAAKKQlKCcOyuQt4ISrVBHujFoQPu062WtIeatc0c07qx/d1?=
 =?us-ascii?Q?wJHW3GjND3LtmFBXctCofiHs5T5FNpXcqowfOEVwJ3XiVqZIGgC7eKvIZcMT?=
 =?us-ascii?Q?ipCV9yAek6zUenZSOdyI/N8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bddc8a73-bb94-4fbb-aaa3-08dcc0b88b14
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 01:36:42.0662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivTU8AHtKuKYP6WB+uOZe230uGXTs8eebjYycfQdyV9J4TCUsWcOh6hC4WTwLpvJa5Xf0/G2Fh+kFB2Hpg1FC6flBXAHIbQFoq7/zlk+06TwTxMSN3DyPCJvxaxzt51j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11234
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


Hi Laurent

Thank you for the review

> Having multiple "ports" nodes in a device node is not something I've
> ever seen before. There may be use cases, but how widespread are they ?
> I would prefer handling this in driver code instead of creating a helper
> function if the use case is rare.

In Sound, basically 1 CPU device will be 1 Sound Card, but sometimes we
want to handle 1 CPU device for 2 Sound Cards.
In such case, it needs multiple "ports".

1 example is
	(A) arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
	(B) arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi

We have ULCB board and its expand board (= KingFisher), and both have
Sound interface. In this case, we want to handle ULCB-Sound as 1st Sound
Card, and ULCB-KF-Sound as 2nd Sound Card. Before, it was handled as
1 big Sound Card, but it was not intuitive for user.

Our SoC's ports@0 is used for ULCB-Sound (= A), and ports@1 is used for
ULCB-KF-Sound (= B) now.


> > +struct device_node *of_graph_get_next_port(struct device_node *parent,
> > +					   struct device_node *prev)
> > +{
> > +	if (!parent)
> > +		return NULL;
> > +
> > +	if (!prev) {
> > +		struct device_node *ports __free(device_node) =
> > +			of_graph_get_next_ports(parent, NULL);
> 
> This also makes me quite uncomfortable. Iterating over all ports of a
> device node that contains multiple "ports" children seems an ill-defined
> use case.

This is because having "ports" node is optional. The driver code will be
pointlessly complicated without above.

Below 2 cases are indicating same things. So driver want to handle these
by same code.

	/* CASE1 */
	device {
		ports {
			port { ... };
		};
	};

	/* CASE2 */
	device {
		port { ... };
	};

	port = of_graph_get_next_port(device, NULL);


> > +#define for_each_of_graph_port(parent, child)			\
> > +	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
> > +	     child = of_graph_get_next_port(parent, child))
> 
> I think I've proposed something similar a looooong time ago, and was
> told that iterating over ports is not something that drivers should do.
> The situation may have changed since though.

I guess you mean checking "endpoint" is enough ?
But unfortunately, it is not for us.

I guess this is mentioned in git-log, but we have *Generic* Sound Card
driver which supports many type of Sound connection.

	device {
		ports {
			port@0 {
				endpoint@0 { ... };
				endpoint@1 { ... };
			};
			port@1 {
				endpoint { ... };
			};
		};
	};

Because it is *Generic* Sound Card driver, it need to know how many
"port" are used. In this case, using "endpoint" loop is not useful.
It want to use "port" base loop.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
