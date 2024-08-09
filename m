Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AC294C863
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 04:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A59E10E83F;
	Fri,  9 Aug 2024 02:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="B/dDu3JR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87E410E83F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 02:10:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKOdgJJTRaYztiRdEKXC4gXxi/27TipC8UCO3t+Wa+L0xcncZEbERx0RM+L/ZoG5VrXxKOXGDBxN+s6/A6wArpI0ewmNwm0t/JLKZGWdG8Z62Mvvb9Ydl0mIeRkPoAQgFlpfAermtmiuDp3ShYTOkLObjTntbwmUsdBXlg2LPMfEN+OW81hQfi2QKtk0lq2UQqc9RwK49Zz+gckLjApZVpnnk+siCWPPIeUKDi/RkqVbtxtd+cXejzJazTQcLmyfD2oYWCZHvAeVm/cPUhnnMCah3pRV/C3bHJE2MPPy0BYFr5/hHhbRSnl1C8bQgGBKU8FISwapN/113QEO8uWddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REuBx2XgD7RQA07q5H9/Gk357lR33USazFYjAI1Qdss=;
 b=zUEtWDr6bPqCORNDGyQOyCBgqkMBINmtK81ahw/rcW+amc00DQa4PU3fv77U5pohn2c6lS6Dwi50eihV96HVWI1+WlLk7ortxP8U7XLerqHVnbVeOoI5fSU5f0YlFyQpMjyBKY9646sxEJWAVIascEVz95yEg1V5WGxuOj4YEPTaZB0lQFDErQ1Y4ZUWczzmviL4HCjQU5H/vLYJlC9vkXEGLKLSHgdiBU7kwcRiHFMoz+MmZ9lq5oeeuSSC25EUxYcQsjss9B0yL8ty7cJczmji1KyB3wZPueFcOj7lLYwAw1WUUTqjSNE7h0RjXonVv+CDNZbznRS/SIijqWRnWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REuBx2XgD7RQA07q5H9/Gk357lR33USazFYjAI1Qdss=;
 b=B/dDu3JRRrNl3Ku+vwmf+ua6yCqIDwqDDjd6RrKhJp63IUIpvWycg2mYdtBPxbViSKYwGRUwi/aEQbiOhu/3k9DSg9hyCsBJ8uSJ+kOd0VREhJEtw36O5wSYSTD4rzcUTpSrPJfF/TS6BVVKMOKx2HAD4tYoonnvhPSTN87qRuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11251.jpnprd01.prod.outlook.com
 (2603:1096:400:3f2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Fri, 9 Aug
 2024 02:10:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 02:10:03 +0000
Message-ID: <87a5hm8n0k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/9] of: property: add of_graph_get_next_port()
In-Reply-To: <ca216286-b09a-4faf-8221-c88c21f4de0c@ideasonboard.com>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
 <87le1aw8lw.wl-kuninori.morimoto.gx@renesas.com>
 <ca216286-b09a-4faf-8221-c88c21f4de0c@ideasonboard.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Aug 2024 02:10:03 +0000
X-ClientProxiedBy: TYCP286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11251:EE_
X-MS-Office365-Filtering-Correlation-Id: e3daa3bc-fd14-4ee8-e197-08dcb81861a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cV1efLkmVIw9VvESMKVo0ylaYnLsym60Ine15dYHILREVMWcnUNKFJZwsRYs?=
 =?us-ascii?Q?QaGFs+I9cggrQz6DePV0ytg8lQihJj7DjR6r2uqlvL0NL4IfxisUQbKt7H06?=
 =?us-ascii?Q?CbPnWFkyt/cAfFPc7N4+n3mvPLrEAbRdXeDgkhe47TFB+f6NBCM6AVRJiEtx?=
 =?us-ascii?Q?YKitsNO6SFUNRTdFIweS7/EG0oGf+Q60TGA84+4pW0t+nu7teyLCdWo5L9Gi?=
 =?us-ascii?Q?jTPhTP9OVWW8OZCvrrLV7xDGqazlYCpr5A5UgLw6oBw9nnV4fIITudxLwzu1?=
 =?us-ascii?Q?uvCjqYaZOkgraVAN/OtseWfZItypF9wZ8rgtsaspvDpFgzml/ebXu9E4TKUI?=
 =?us-ascii?Q?GToTuTCup7VdHkM1o033iGCD+/J2A0XnjZWwQeNk++tU66N8cYVW5R4i7U+A?=
 =?us-ascii?Q?zoECYb2rG6UIXbsy+hH68f/xqLoAd4tcmstOEBcMfFIcYNILuxS2tSRAgK7z?=
 =?us-ascii?Q?qddpU1TyPfSQ3RMsxhkDo7NCuwZfGL/Zo5dVdXhRbPtbAVEOSxUhPaYRwpld?=
 =?us-ascii?Q?mQViTztgd1AHgv7xo0QiBXsKlYqyCYaNplX3YhRooQlIAyDDWkm2pieHvqLG?=
 =?us-ascii?Q?41/WBcfJOZ2x8B0rZpDrgbxgbqgco6yrOlSOwCa+tgJZESsb3GPGhQBC7kbf?=
 =?us-ascii?Q?UyHqd8NB7cOod9qpM0XfY5NKfaS8ACKJajeLb6vUoehyomBkDX6taYc4+He7?=
 =?us-ascii?Q?zlnTh/BxPp6jYGz6BYLmYmjfr4fJbhR4q7nS0Y0qXtrRlAGbv/NJZLVOIUhP?=
 =?us-ascii?Q?SvdjxPMv+Yd84UyUoFViHevZ0OPaMWvymmumPuBWki67zh5ci23S+iHL5AEP?=
 =?us-ascii?Q?qXLTshv2qTYYZ8yvHanUozrcq2Ka9jMlZ3jeNJPNWLNi6JhSiCJdvF1IZvab?=
 =?us-ascii?Q?VjyO64YCSJ9MmcOAbWEtU+yJD5mgE8LNFdFgs0nVnEWy4pO7wnXt52aalwM1?=
 =?us-ascii?Q?CkgF4GLcwnsNSDBDIz4lmVzXknKAllzXXVCLSgoYnbPqR3f5uvipn03zKRKI?=
 =?us-ascii?Q?WClKsBmB43+kq9Qn2wCWmfQl3jY+bGKLkbyg4NoDz3p7wx/gksTAh1S3B2Uw?=
 =?us-ascii?Q?QO1IzfhcqJpDSQQxW8pTn5jxvbI/b1pKQYb8wvU5wBvz3lxN7ayzs5mx5uMK?=
 =?us-ascii?Q?IYyywZ+M3lJXw7q/MFDgBqRIgNEJllFVYhuxh0gZSVYQoaS+1ZcN29a59gZj?=
 =?us-ascii?Q?Xn6Wwn7QlHIUiX8FKXLzVaSmqR1GHLRWSZiA9AeoybuYTsTy350ZqBK0bOfO?=
 =?us-ascii?Q?wffUFFjkEx7LBUtZu6xIegMIfnkGvSxIXqfJogszQ/knXAFaQBItiyrXILps?=
 =?us-ascii?Q?MwhkHljW1HoiALrlTaIQ0GBYnF11uzfgcq/ShVlTC1PM+5JlVNFzDH0++y9w?=
 =?us-ascii?Q?N/dHRt9aB1Z/2gsy6ZAl5pFthAP/pXm/Bhq4JWBbrGNVbraL/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TF8kTPWoK3IDXcVDfrnsWyecLbG9l39pFeOvgX67aW4qK2mOnybsD9pBcjGn?=
 =?us-ascii?Q?NU47BI2OUQMuRgrcBlVAiBq6meseuiBmtE+GS+7fSnPjWCVaVIEFsCGWb+zv?=
 =?us-ascii?Q?T39qxC01UIqVGBEIUqPJTOHL7JyGCQTqYJCykrclZfON/CAV9LCJ4nXxDg+I?=
 =?us-ascii?Q?mKvmv/R+MVDizcLdM/VeqofXPa50jFeopYc/z4KfhZECN+cIoQhVC8wUPHU3?=
 =?us-ascii?Q?YMZQ3zVzenf8X+F5H97fYDu6561rKLp5F6yOWjbGK+AsmNnBgQmhhOZuIjAm?=
 =?us-ascii?Q?y6UHyqF5d0EUZWw3WOuVX1gVFp36OZrVn4Zy0PCi95f/UnzKnkRqcBVRfhQK?=
 =?us-ascii?Q?H0hcC0BmNV4wBMtw0IwK/1tNfbfhMwQMWuTBWP9c08WCaD9kUx8KxOnYPwxv?=
 =?us-ascii?Q?VmOlJuMRhxEDM9cjepzBONx1+xdPV+QfFLo/A2xnLM/K/wpys28JtKW+h+gx?=
 =?us-ascii?Q?fNLEdiFvpyNX2cTPDGmWS+jOLHuI7wk93FYNniGJ86wtr7x9vEQcp9M+RAAN?=
 =?us-ascii?Q?HeQimRiZ+pjtg7/RCmk+UTZSJRZZ0Surn1b3lSh56Z9YhDqrFTn10oXQtndb?=
 =?us-ascii?Q?e8IiDNDkOLFqdMBSEEsjP+d3YI4CcdKxdfcjik5VCzx6YfTCyUJkIxgdvpxW?=
 =?us-ascii?Q?G/ZjUxRtRfLBujr8Y2YVO7nnmR8eN8rBb7Da3ahZZQzME3lnAechXVP9ZqnC?=
 =?us-ascii?Q?0XXiGp++9vNKN0zblFAFM9w1EYSZSPFCscrRQziYyvBPNAKcKalKsQi5Yte2?=
 =?us-ascii?Q?KEOl3AxT3OwGV5fBbz1BkD+6Yt0rsRoeHvd0Vmrc69LRiRpn15DbRECJXuE/?=
 =?us-ascii?Q?6veKXmKfzvdETtYGCy+AZBhU2jvc+HBAsslzlag3mM0XqQUaxFU8IuSxOFI+?=
 =?us-ascii?Q?51OfuzGCaqbhbGeZQiOaitudZUyUltubBe6gLkKPmjrR3FtEH73Lg/hDZfng?=
 =?us-ascii?Q?6tySImcWd+8spy/DVXNAu2bxzRtZsgWKjlf5tTu3p5Z+i4PnFkCOlTt6OOBj?=
 =?us-ascii?Q?LT5ePHY3pqYgFBRmN2UTtUG3v9r7kYuOFHp5SypOJAZ+LBiEfdUucwOB5DHD?=
 =?us-ascii?Q?1x69uRsuVzDWqCQ2TGPU3oz4sN5/Yfyfjk224DZy/u2LDxfDTxnihs3YOaDo?=
 =?us-ascii?Q?iMAH3So4Y7dVJIdJMyqlA/eTihdaakLfYB4T/bKnKYhj00Bgu8hMmt82y+i7?=
 =?us-ascii?Q?2WmtpkwXZSnM0vc4HlDFlq3XfFeXgMBxc7cNnLiqR3o0xYA5C1WjB1bDel+y?=
 =?us-ascii?Q?10QhCAx2cCiQWQ8v0rcgd3aKGcZNFg1K2coYcUN12a1YKlT1NldNNavIFGBw?=
 =?us-ascii?Q?yMtQBpsJxa6ff/++LSL63HrrtTpxDJf59iUyjOMiELpBxKGf1rDv+b+Gqzb0?=
 =?us-ascii?Q?0K8cXMhUfLj7o1BjpGLySoql0hgpvx7gRnzzArk3PN99+zb16PPaWHM14cpR?=
 =?us-ascii?Q?wWDYlLLpX7Eb+yLRGIpkQeCSlRKtaB8dBVpp1ELKICh+sMnb7bpSAFuTfLkE?=
 =?us-ascii?Q?C2pejuZbqdp2VJJio+kWGYINfv0CSEZxXH8jq/cQXFqgR1mkxRX66savRB6H?=
 =?us-ascii?Q?aa1mcydNDy86BqH6t9rbe7BkV4qxRsDFv8KrJFO+vSlK8ALlFf0qqoXrecFf?=
 =?us-ascii?Q?Gvu6xKedLMH6LPGfbUr3+6Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3daa3bc-fd14-4ee8-e197-08dcb81861a2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 02:10:03.8037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTisU7d5qQmU0jh6KD626P47+t39k53AOddMHKliUZCdAXi8hTcOzBvadOyIfbuj5cnOA+4cfVexUbd+7RQZ64Ha/vY3G2F8MzP4bBsF5ncHz6K4VNH3W11KGfYRtbsv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11251
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


Hi Tomi

Thank you for your review


> > +/**
> > + * of_graph_get_next_ports() - get next ports node.
> > + * @parent: pointer to the parent device node
> > + * @ports: current ports node, or NULL to get first
> > + *
> > + * Return: A 'ports' node pointer with refcount incremented. Refcount
> > + * of the passed @prev node is decremented.
> 
> No "prev" argument in the code.
> 
> The of_graph_get_next_endpoint() function uses "previous" as the 
> argument name (well, the function declaration uses "previous", the 
> implementation uses "prev"...), and I would use the same naming here.
> 
> Also of_graph_get_next_endpoint() talks about "previous endpoint node", 
> whereas here it's "current ports node". I'd use the same style here, so 
> "previous ports node".
> 
> The same comments for the of_graph_get_next_port().

OK, thanks. Will fix in v2

> > +struct device_node *of_graph_get_next_ports(struct device_node *parent,
> > +					    struct device_node *ports)
> > +{
> > +	if (!parent)
> > +		return NULL;
> > +
> > +	if (!ports) {
> > +		ports = of_get_child_by_name(parent, "ports");
> > +
> > +		/* use parent as its ports of this device if it not exist */
> 
> I think this needs to be described in the kernel doc. I understand the 
> need for this, but it's somewhat counter-intuitive that this returns the 
> parent node if there are no ports nodes, so it must be highlighted in 
> the documentation.
> 
> I wonder if a bit more complexity here would be good... I think here we 
> could:
> 
> - If there are no 'ports' nodes in the parent, but there is a 'port' 
> node in the parent, return the parent node
> - If there are no 'ports' nor 'port' nodes in the parent, return NULL

Thanks, but unfortunately, get_next_ports() checks only "ports" and
doesn't check whether it has "port" node or not.
So correct comment here is maybe...

	If "parent" doesn't have "ports", it returns "parent" itself as "ports"

I will add it on v2

> > +/**
> > + * of_graph_get_next_port() - get next port node.
> > + * @parent: pointer to the parent device node
> > + * @port: current port node, or NULL to get first
> > + *
> > + * Return: A 'port' node pointer with refcount incremented. Refcount
> > + * of the passed @prev node is decremented.
> > + */
> > +struct device_node *of_graph_get_next_port(struct device_node *parent,
> > +					   struct device_node *port)
> > +{
> > +	if (!parent)
> > +		return NULL;
> > +
> > +	if (!port) {
> > +		struct device_node *ports __free(device_node) =
> > +			of_graph_get_next_ports(parent, NULL);
> > +
> > +		return of_get_child_by_name(ports, "port");
> > +	}
> > +
> > +	do {
> > +		port = of_get_next_child(parent, port);
> > +		if (!port)
> > +			break;
> > +	} while (!of_node_name_eq(port, "port"));
> > +
> > +	return port;
> > +}
> 
> Hmm... So if I call this with of_graph_get_next_port(dev_node, NULL) 
> (dev_node being the device node of the device), it'll give me the first 
> port in the first ports node, or the first port in the dev_node if there 
> are no ports nodes?

Yes

> And if I then continue iterating with of_graph_get_next_port(dev_node, 
> prev_port)... The call will return NULL if the dev_node contains "ports" 
> node (because the dev_node does not contain any "port" nodes)?
>
> So if I understand right, of_graph_get_next_port() must always be called 
> with a parent that contains port nodes. Sometimes that's the device's 
> node (if there's just one port) and sometimes that's ports node. If it's 
> called with a parent that contains ports node, it will not work correctly.
>
> If the above is right, then should this just return 
> "of_get_child_by_name(parent, "port")" if !port, instead of calling 
> of_graph_get_next_ports()?

Hmm ?  Do you mean you want access to ports@1 memeber port after ports@0 ?
I have tested below in my test environment

	parent {
(X)		ports@0 {
(A)			port@0 { };
(B)			port@1 { };
		};
(Y)		ports@1 {
(C)			port@0 { };
		};
	};

In this case, if you call get_next_port() with parent,
you can get ports@0 member port.

	/* use "paramet" and use "ports@0" are same result */

	// use parent
	port = of_graph_get_next_port(parent, NULL); // (A)
	port = of_graph_get_next_port(parent, port); // (B)
	port = of_graph_get_next_port(parent, port); // NULl

	// use ports@0
	ports = of_graph_get_next_ports(parent, NULL); // (X)
	port  = of_graph_get_next_port(ports, NULL);   // (A)
	port  = of_graph_get_next_port(ports, port);   // (B)
	port  = of_graph_get_next_port(ports, port);   // NULl

If you want to get ports@1 member port, you need to use ports@1.

	// use ports@1
	ports = of_graph_get_next_ports(parent, NULL);  // (X)
	ports = of_graph_get_next_ports(parent, ports); // (Y)
	port  = of_graph_get_next_port(ports, NULL);    // (C)

I have confirmed in my test environment.
But please double check it. Is this clear for you ?

> Or maybe I'm just getting confused here. But in any case, I think it 
> would be very good to describe the behavior on the kernel doc for the 
> different ports/port structure cases (also for 
> of_graph_get_next_ports()), and be clear on what the parameters can be, 
> i.e. what kind of device nodes can be given as parent, and how the 
> function iterates over the ports.

OK, will do in v2

> > + * @np: pointer to the parent device node
> > + *
> > + * Return: count of port of this device node
> > + */
> > +unsigned int of_graph_get_port_count(struct device_node *np)
> > +{
> > +	struct device_node *port = NULL;
> > +	int num = 0;
> > +
> > +	for_each_of_graph_port(np, port)
> > +		num++;
> > +
> > +	return num;
> > +}
> 
> I my analysis above is right, calling of_graph_get_port_count(dev_node) 
> will return 1, if the dev_node contains "ports" node which contains one 
> or more "port" nodes.

In my test, it will be..

	parent {
		ports@0 {
			port@0 { };
			port@1 { };
		};
		ports@1 {
			port@0 { };
		};
	};

	of_graph_get_port_count(parent); // 2 = number of ports@0
	of_graph_get_port_count(ports0); // 2 = number of ports@0
	of_graph_get_port_count(ports1); // 1 = number of ports@1


Thank you for your help !!

Best regards
---
Kuninori Morimoto
