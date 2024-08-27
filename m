Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BFB95FDE9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 02:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EDE10E17F;
	Tue, 27 Aug 2024 00:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="QJIgPK1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011067.outbound.protection.outlook.com [52.101.125.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7946B10E17F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 00:14:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sv7ARZKwHqE1zp8RTuBj9i9Q2xLojtRrybBwVCjdB78D6yiaYVsxDnznm/K6qghtsEAvbK0yxqktezWs6Aaz22xfnYw214jtVNsQJ2cR2UFh/g59xOiptY5WLPulvQHvg/SpI+zU89w0WsJ+DXUCAbpkdrTWPGc8QMjR8ZOEQKMcphGVJFLKjlyzr0Ayc75LKJbxB8NlsFBNzmT2fZGSVSqga6JzB7UTBTgIDWodeC9dDE3MJ9UHVEXA0ULBsB9cZiurhE4A3eI4T0iHs1RQVKf0ezPrr78ZMURm+5RpJsVvh2L1kBRffO8SMTB7i+M8LfXWtOlQG+2gRVqtaZnAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5vRbbKr0kmOd1+9YQ01igm53wxBBQVAH6XY8hZa2zc=;
 b=t/NEIxYT2xJ1GFLhpbrklr867m9iXzMETt5BNqWnqlC+ET93AJ4p5Fqhmv1B9+xnaPvDoDCaImlxaUCr6b/01REW9KZBZb3T01271D73y6nxjxW39SCQAqi7pQnJ8a9/K/2ocN5XCDDUhzDD+52GSW2wdyFGzFuJAnvAL1nycGgA3PTjGWAF9ZWv8Em3jmo8SGld7hOaoT/i7jGhOsnaoRvYbXiykyUQd/IHjvD4BSj5YXVl4UmHz3zKxB2qsqe/9Iu+OJXu/89XCuIsBigp+B+hJ991bYjPZJUH2vdutz65llWUl//uxAdOCZTnB6dZLBPNuEQiO5iDMRvhXDEBUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5vRbbKr0kmOd1+9YQ01igm53wxBBQVAH6XY8hZa2zc=;
 b=QJIgPK1OiuyQl/7Y0kiGkv7nGpaLFmkUK3it6XhJup0grJWEEI141aCF/7YHpmuyt1MYga9vwSKOeX9ziqjR68KV7Dgw8Wc44KB75Fp6t3/1BY0IFVohfQ4HxqWb2oTpEjZcfWdDEHVlLcw0OjgbCJy98oWoov949Z4YFtu7rc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11369.jpnprd01.prod.outlook.com
 (2603:1096:400:3d0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 00:14:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Tue, 27 Aug 2024
 00:14:16 +0000
Message-ID: <87bk1ebz59.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 2/9] of: property: add of_graph_get_next_port_endpoint()
In-Reply-To: <20240826154009.GA300981-robh@kernel.org>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>	<87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>	<20240826154009.GA300981-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 27 Aug 2024 00:14:15 +0000
X-ClientProxiedBy: TYCP286CA0223.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11369:EE_
X-MS-Office365-Filtering-Correlation-Id: f88d6fed-e7ec-4d31-22a4-08dcc62d300e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ukEwedCF9ZCnbua4L7KJNsJMfo875WD8V8lKC+CbTs+J8nXZGplLjnE1XjYg?=
 =?us-ascii?Q?IjYaPArT5gyHaAsSZ4dbC1IRhyugT6ikYjRT2QnQzmF1dRDkYTfEwfy0vdMl?=
 =?us-ascii?Q?Y2yhBNzlQgQJfSGvt67X+8TMyJj8BX728RsOX6VusynhlhDiK2YnrMbI5KzC?=
 =?us-ascii?Q?k2z+QSce9taYt1dOwBZa6mXOg7swGyUx1mYdwIcyYKQYApeAj6NP8Ymnp1rj?=
 =?us-ascii?Q?tRRkLw0sIGiXHD4+s/Cmfz4OQ1wcw46X7z5gcMixtp1vcE7HuQZO3pwQiZFO?=
 =?us-ascii?Q?BKzbkpF65iTHpdyGTIdwZ/5UUlnOr26tM8jxXEotsplO3++MAFzgdCuLJFby?=
 =?us-ascii?Q?64IVhsA0zFX2KmNcUoCkoln0bPcmO854QpyNLCniu8kTms4XrHTYTv+rMpki?=
 =?us-ascii?Q?RP8S19lCQNMtLWoJFNHVCHtm1PLvgHMODjTNVGic2kVBpz+7oxTh/y824K87?=
 =?us-ascii?Q?pgF8Cp5NQWdYYj+tjC1pgaX7BQHMbBXa1gT/fhm2hXEvWcAPTWD7k3Dg2sg3?=
 =?us-ascii?Q?3AHW7jc1sQXDtdv38Wje4QCIP0cl3v8i7+hmUZXD61NTuq2T+1mEUaS2FJzQ?=
 =?us-ascii?Q?l+s0gOHFsmnOezMl8Dk3+KLTBTGTaUcJPTXkgbwYw4LDbpjFBp+WVECtdzAC?=
 =?us-ascii?Q?4zCkYi9qUzSaplQPCHWa2hMPenyXnkrtFXlOVSSmxjC/2CVOBVRXwf4JMPWS?=
 =?us-ascii?Q?jp2Dujei/6PhcZrsxNphbXjfuMG/4SrEbJQOadulGFYBghkfBIKosuY7JplI?=
 =?us-ascii?Q?Y0BzIE0In54poxiUFvvVeZeVh/HTM9yB1h11gS72vvyy5AWYhYYIrE5fRSg4?=
 =?us-ascii?Q?LP7/UazKYSPdu+BOsi+fD+hVtbYyhfF3FZwInxIsLsaRtKgnHycTRlVHNgLa?=
 =?us-ascii?Q?ASsYU1qeOlJwWJNiUKmweFGAX7BH3kjGw54OmeWGHOZxKFVkIfcJpGJomuZz?=
 =?us-ascii?Q?0Z3cVgca49oarT0zWKAY8jQ4th3slCeIHXbk9H6IU2/J7PhBYL0IEgBhxN3c?=
 =?us-ascii?Q?0L0ILVawR5booMyfZ96T3O23fbPtZNFRBYyoaqUo0+XkpirUjtLHNwaWu21V?=
 =?us-ascii?Q?Amdw4tfK00J2eleRoPwm0P/HbhnMfVLCn5T59qLTa9Hv39yN5DILs2v+QHk1?=
 =?us-ascii?Q?/fEO8OQRArI7BZxfGL1zILBJF4HIEPlSpnDCVNiPoFwgYMc9feDkYiorstVG?=
 =?us-ascii?Q?EKUvJKHVYkJp73bsK+wH8Ixtj8tSG0JfYJ6On+RsLRbDFV56zp2LYo+C7WuQ?=
 =?us-ascii?Q?KyYbMpPlRCmokDq6xuZuO8PE47J5LOLdvobOqppp6ZHFDUD1EF3/wSxQg/v/?=
 =?us-ascii?Q?SSkM5chyqu95UHLlr6CXxE/HbXHl+kYL5cC31nIJMZAZQSXTJAVLt+8y6SoZ?=
 =?us-ascii?Q?lnpEGpYHyq65uVQJ+CjokD84xJH/uLKcV4EOaZkCJdqHrA1Z2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tadecjq1OCDnnWaUpWizHXqxNB79N37RCAKfH6CvokYZUibgMKb4R6fy5rcs?=
 =?us-ascii?Q?1uvlmvSyHd6j76/zxWu0IDmRpK3M17d7cWbyqyUql9Ma+MdQrZNx9/NKhzyq?=
 =?us-ascii?Q?OzUFeVIqXamdWHob+f0GBneqqaKjJaCovxXFnwJ2sPeiLl2pQ+vZJ53UWuZA?=
 =?us-ascii?Q?tWBCI5CFpAab7hIMQF9Py13SSRfpMtqlD8QVGuxtLF7fQIKYNQwf1QD2IjUl?=
 =?us-ascii?Q?5W6hlRqRMbtw/Ntt+p+TsRwK507WBrY3QUGs7Wk+qVu0F9PY8EojuUUNYyUX?=
 =?us-ascii?Q?pQQIvinGKcm+l3Leb5YJu6DaIRBIMZAr5Hvugyv2vcptsndb7pzlMeuL4RlI?=
 =?us-ascii?Q?4cAbHF8V3eoM6nGNRaGAHUVV3pTdIV6L5M+FbEf+MBe4JC+6jbFP0B+FH5qF?=
 =?us-ascii?Q?Qlc/neDKs8g9+H/4yaq+ezR0ZuxHoY5wsezR7K+sP98zT+kobRSEdVNtFkYv?=
 =?us-ascii?Q?ZBHj86lSM5Kb1bLKnmwIcsy9ecbQ7NAop7TyHu7fH5jOPs2kYYPLtwEEE2os?=
 =?us-ascii?Q?5GlkJfEC6a7xhvmeWd3ygBDRGcjF3xVpBTym9zIkxnUP73bUsk6tJKw2mDii?=
 =?us-ascii?Q?jtBASPW/D9U7rTgdk95pkG99h23/yI31Q7jf5NxFERYjqSiWn7uNtpQGPq1h?=
 =?us-ascii?Q?hhvKOct9Nuf7ktaVKedSVle9if3FxkUxN9kX2CAAVjiz83HJELL+WY3k3E41?=
 =?us-ascii?Q?OANFqoXq2EM2s9A0KDGhH1BYrZqcL4tNyaJlTUWfa/ZYq2LB+6DXKmgX1Fhx?=
 =?us-ascii?Q?wO1zPybVr4L3dCy6RO7ADWv02RZU+0mZqnHKV6XmwJCrMfX1B/pqXDxeJTgZ?=
 =?us-ascii?Q?EpppYgbEiu/PBcikMT7ed4Us3nknuiJySJxih8Lr+DfsgkRMv8dv9sfyaEYU?=
 =?us-ascii?Q?lBC++9n55PT/l1nb622+Vkf9du0paai3E92KSc1CqpneMdQylFhO3cs19qiU?=
 =?us-ascii?Q?5YLDYDE/RRFX7TKwNbZP1DOnV3RwxYrrH2nnH5i9bcYYCecIcKDloNJXXbSc?=
 =?us-ascii?Q?8fADdae94Y/dWxf13BY74cqM6JFG1yXPSXiqkzitUQl+a2OGJ22YVLcG3zaF?=
 =?us-ascii?Q?Z7ss9ndVtKHrIZKG/6za6wBeI0Z22C9oelU1fX13r647/syrH/fhMIVXCaT9?=
 =?us-ascii?Q?PveDWR/3db7f7gYtD5xVEZXOd8Oc9t0vEH9z67zOwmssOXrF0NhVYrgv6Q9p?=
 =?us-ascii?Q?ds4TO8AuH/pr/sAmQX69HY1i5rALH0QvdsbXsfjc2M3fLzBg168KrKSS74z9?=
 =?us-ascii?Q?KnjYvthQTCmo4tbsHpEYPdoLa/l6b50OHNT4LTkklwfsKecY2907pW3tsBPZ?=
 =?us-ascii?Q?wKU5yKm0IOJLCPOCQvV9PYKjhhXqhvD3IZnJRtxuwEXuLUCpXzNBwPHsqAU0?=
 =?us-ascii?Q?EZRMgvTEhcSUh4WPLbcQooXhjkHLQD1QNvhsMD5uuo4o+HEHi1ygbVMmgVE1?=
 =?us-ascii?Q?RAWknCEbV/zvHeBObBlIJS6Viq/Gz+ODSKCfrPs9WB/YK/lOgN5HZbMNJjLV?=
 =?us-ascii?Q?xOwiE5TZBzjNWRsaVsgfBKAI2WlpzuGsHhNnLsrKAX/0gm3Crq3akvbRzWQ6?=
 =?us-ascii?Q?AU5OLQOpTzQgP+AnGJVRH0ls9lQ3LrBloYv3IiUDjq8aQ/8MfLc9mIQrTGdq?=
 =?us-ascii?Q?tcwgH4WPTHxI4ZzDhhWqNOo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f88d6fed-e7ec-4d31-22a4-08dcc62d300e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 00:14:16.4533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XthM9pfiEHdEPmepcrJ9IT90qP75BIgTMbOLTXADPU8TzaDCK2ZkLF9lYXEarJReb/LZCB2HJYKji1MOSKj9Lfh0/7pbyuWdPsRlKCeoGdeaOw/DN5LjN5EfI7CDHOST
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11369
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


Hi Rob

> > We already have of_graph_get_next_endpoint(), but it is not
> > intuitive to use in some case.
> 
> Can of_graph_get_next_endpoint() users be replaced with your new 
> helpers? I'd really like to get rid of the 3 remaining users.

Hmm...
of_graph_get_next_endpoint() will fetch "endpoint" beyond the "port",
but new helper doesn't have such feature.
Even though I try to replace it with new helper, I guess it will be
almost same as current of_graph_get_next_endpoint() anyway.

Alternative idea is...
One of the big user of of_graph_get_next_endpoint() is
for_each_endpoint_of_node() loop.

So we can replace it to..

-	for_each_endpoint_of_node(parent, endpoint) {
+	for_each_of_graph_port(parent, port) {
+		for_each_of_graph_port_endpoint(port, endpoint) {

Above is possible, but it replaces single loop to multi loops.

And, we still need to consider about of_fwnode_graph_get_next_endpoint()
which is the last user of of_graph_get_next_endpoint()

> > +struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
> > +						    struct device_node *prev)
> > +{
> > +	do {
> > +		prev = of_get_next_child(port, prev);
> > +		if (!prev)
> > +			break;
> > +	} while (!of_node_name_eq(prev, "endpoint"));
> 
> Really, this check is validation as no other name is valid in a 
> port node. The kernel is not responsible for validation, but okay. 
> However, if we are going to keep this, might as well make it WARN().

OK, will do in v4

> > +/**
> > + * for_each_of_graph_port_endpoint - iterate over every endpoint in a port node
> > + * @parent: parent port node
> > + * @child: loop variable pointing to the current endpoint node
> > + *
> > + * When breaking out of the loop, of_node_put(child) has to be called manually.
> 
> No need for this requirement anymore. Use cleanup.h so this is 
> automatic.

Do you mean it should include __free() inside this loop, like _scoped() ?

#define for_each_child_of_node_scoped(parent, child) \
	for (struct device_node *child __free(device_node) =		\
	     of_get_next_child(parent, NULL);				\
	     child != NULL;						\
	     child = of_get_next_child(parent, child))

In such case, I wonder does it need to have _scoped() in loop name ?
And in such case, I think we want to have non _scoped() loop too ?
For example, when user want to use the param.

	for_each_of_graph_port_endpoint(port, endpoint)
		if (xxx == yyy)
			return endpoint;

	for_each_of_graph_port_endpoint_scoped(port, endpoint)
		if (xxx == yyy)
			return of_node_get(endpoint)


Thank you for your help !!

Best regards
---
Kuninori Morimoto
