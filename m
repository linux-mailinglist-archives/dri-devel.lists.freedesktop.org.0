Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D09961B32
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 02:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638FC10E0AD;
	Wed, 28 Aug 2024 00:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="LHQ280W+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BDA10E0DC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 00:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VESUkiujlFoXAz42eV36FsvnRvpRfNvwcMEzsNCKJYDjpvgun/uBcleYf5u3o0Yx0AyZqxUXdaQXOzaVZi/S0y8b9+XtyYsZHzQnUgUORM/fEUgOtPshoZ2G0m7an1A7ppQy8m1v/lNrdg7acjUFnDCpTTj11tfNsS4VUYnvEFx31aurvKGvUqLVFYXQk/y7+OzE4X5hhrrBt4j0s6fTGAEdg1HIA7BfaON3Wd+ILG2zPEYHC6/zVuNSbttamQP7MQmdFbyRtuJfxR5H1i70/nfQ1PKaB6dma8bGiNMkR6V1C0c2YpX9RMsfW4Mh/bpH04Uufnzvl/nxwqUtGFEr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmLDuHWz3ia+yubnIbik7DzrJXWTnxAsSICokWqPLk0=;
 b=KtvP05nHy3Vx6k88IuQdRM9EyuSMGRSIuPrO6e4onWnXQmGriEOAZEm4Z1SasA/t6JnkOO5H4tXKJr8FmEYctgBNlP8BJT1On5KlwTjQrgCVp6yt9596jxaNJkhdzoDTJQaV13yzOa1ILRdMst0bTUwlk3arq8GLYj3YJW7F2vAbbmDQs+h6JDfjnTO6TChoSUy+TM4pl1zCGaIIPBBfuFinpGJMMEth7SbWTH5bnhnZAYt2lzrmuJ4xt9ZTMtzYcNS2dilGiy0WxcC7d5FgOhmDpisD3Y1eC3tlaOtbyfAx/6to7ktrTbVjMGeWZIjhlgLUK7uX/IAdY6EJwHAqvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmLDuHWz3ia+yubnIbik7DzrJXWTnxAsSICokWqPLk0=;
 b=LHQ280W+6kjGpWTs2L9//R4hTV95nVj6r2NpkM26A4Bus0dtar6wji2z9CKIs68lCC7ueuBS7/cxhG1sOIJUqhXJrHNYKtb5dGnsJuIxZvY0+QFo1Nj/OmGL9aMXsQVsKnIQNELupklR8iPHaM26hemdMxf2F3n5Dx59Phjk3ek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB6610.jpnprd01.prod.outlook.com
 (2603:1096:604:10a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 00:56:03 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%6]) with mapi id 15.20.7875.016; Wed, 28 Aug 2024
 00:56:02 +0000
Message-ID: <87h6b531p9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 2/9] of: property: add of_graph_get_next_port_endpoint()
In-Reply-To: <CAL_JsqLysakbSdENNy+_XvotK9_eHG0KP50s6gtfFUYntawyWw@mail.gmail.com>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>
 <20240826154009.GA300981-robh@kernel.org>
 <87bk1ebz59.wl-kuninori.morimoto.gx@renesas.com>
 <CAL_JsqLysakbSdENNy+_XvotK9_eHG0KP50s6gtfFUYntawyWw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Aug 2024 00:56:02 +0000
X-ClientProxiedBy: TYAPR01CA0230.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::26) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: 0044f524-a945-4397-c6e2-08dcc6fc3087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3gfvY74ntZbU0A5PExB5E0X6kOTvGhndRcOl2EVBsIXvuJWkl3GiK/hTaSfx?=
 =?us-ascii?Q?bHojQBdde+iT1YWf65GgEk53fEh3GnseY7OzSS5TldUaA4Q161qvWNJ8RyLF?=
 =?us-ascii?Q?qkN9DgMTKO9C4WW0c/OskzyZhxSO5TBqa33XdWLj+Qba7J5HF07V0xRLJaV4?=
 =?us-ascii?Q?Nsa39jjokCAXqOTl0SIX1Znme83RKICXHkCt2YmvYAH02FNvfTlRSsrbLS2F?=
 =?us-ascii?Q?tPhqUYLxJk5T3Y3UMOI3U7r3n0QmLl+0W3WX1bFwDpZMo0b5Ai51eAwig/UY?=
 =?us-ascii?Q?ENwqxM3iQU3jHIZxrDRUS9nn1uneB7YlZvKGYZ5LqAuEKd35PrRmkVKGlWzb?=
 =?us-ascii?Q?nnUPWzo46Vc2xs7uQTk5CsddgcSm3C7HwgH345qZbII5eyeCkhNF1P+f4a7P?=
 =?us-ascii?Q?BcQUkBKii0tYX6tzO4PbRGj10pMVZ7wMOotgbYWkV2adrVy5cNXCJPey2XXK?=
 =?us-ascii?Q?lyQ+5D6ghoxmx+0fdc0fpg9TXw4JHFoer312Foa1Sic0vVXXiIQxF2gtMw8S?=
 =?us-ascii?Q?F7QS+bpBAn25E8pNuggAEnO7UG+Mv9Vk9PWl2GRpPcozec8aADkoXXtPDcq0?=
 =?us-ascii?Q?i3qRARvEkWFL4LCseCS3iZOENbZr/MroYbafckQVQRTTfmLC2hsrXL1e/BWZ?=
 =?us-ascii?Q?N074U56unV9cftCOzg2lgI0utFI4DbssUDSMOF1R4fkYlvX70DnHspXIYN0a?=
 =?us-ascii?Q?nAzjA812h0032cyzcg5aHXQqqoQLS5cp7OmrQebDqLNQPlSD5X0liyp+VHiQ?=
 =?us-ascii?Q?wsjpL+Q/4gNK0NtUoqDwqd6Ts48dnLXMon7DHqTPmDGXduk4S4zLCuVO/OOW?=
 =?us-ascii?Q?iScOc2eJkYTlsi8jot6PX9z3R7TmtJEypgFQlBf3fCRtg+61Qqy26ioO4L/o?=
 =?us-ascii?Q?4qpOSkDCQOa6wp/BPFXjZbIAYrpMKHb0dLQb484nem2M7f6/JBq81kkheFur?=
 =?us-ascii?Q?Z/sEtlmsQWNHopOdwSsDt5/llwQPoCRbA2X5JA+fDlit+Que2G3d4hAoyycK?=
 =?us-ascii?Q?0MjGyzD5b89S3uGHbjp5IhU8bLnYPNJefyhXC6Joq9yJhE5kTia2C67cvmH6?=
 =?us-ascii?Q?nximXOOLqP5V6kjuUrTn7YVV0Z4pED/Rg1i7SkJ+bNuZaefZYly0O7ieuIzI?=
 =?us-ascii?Q?gnkAi3m3x9j7pv/U71kUjIVdowHzz8VhjucLHpUEuNwRT9T1f5fPHuMA50Eq?=
 =?us-ascii?Q?25hZ9Rp+73GYCXbZ7xHZMq3xy+zJrscLiqheZtV1jipvRewW+QbL/kO8BZeh?=
 =?us-ascii?Q?Hnap6rDWKBTz5xy42del9kI8H6EvJTAX9hEYVtDSQh38po4xsf5decu1nHo5?=
 =?us-ascii?Q?1Otms4SHJKzf36zrrOQXFsjS1hanZupPNz3hKRtsA+XmfcoT/F4BuR4unlxR?=
 =?us-ascii?Q?IXTf0DtHPYbM+QuTytf5tivea59jiRuQq7A4kSuVyiNW6POPMg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB10906.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ociBfkTzfVtVI+9J65CEq9L2dMWp/YFAVW4tKZsXufxmwORsmmY0G8ndt74X?=
 =?us-ascii?Q?2Tg5mVN1DAS84cS08Eq4ssU9mQ117fdTAQFsVx2BuHMJdQRoarMz5S+HYEKf?=
 =?us-ascii?Q?qjcVxq9BGwoFglvwLDnKbWDBv0eVB1eWHFFaZd16YIRKjCdyDFWbMMZBz3Ko?=
 =?us-ascii?Q?xnj6Ng92j+meZOYRpG0ye9TfTTSw3zkkmKcSSt9fLPD54heLT3tOy6igqZez?=
 =?us-ascii?Q?SYlYV94raxq3G2obSY7TAxeaoZunW1cgnSCTfbjKsACPZQaUvZpKy5+dVruC?=
 =?us-ascii?Q?NKgRf7OzsWw5q8c3gV/ozV0lsxyTyuPaszkebG3i53pNLUTBu4BlBj2+9zZr?=
 =?us-ascii?Q?VKwGAOs5MItwBMtGV/J4b/p5KL39i1lJoH4WFC6qfkM7THjAzYhKlHXjwExI?=
 =?us-ascii?Q?MOPJO7WtrJgSKzE6ysLEhBxqgpfbtmwOMFWjTWzdEIgRNUXO2FDbIbXYCAy7?=
 =?us-ascii?Q?YBbohwPGwPzGCFr7e6/NRSKLAiDvRv13Q3mRwuLhVS6TeX3Rr/4Wm3odcm0t?=
 =?us-ascii?Q?vsySuveocyW04FigDNXXYcUzHGkXkpkFyf3DDoy2bhUEmdyJs3ulZX1Rk5GW?=
 =?us-ascii?Q?WMfyZDVEb5OueDSX1r3FU5ZKW8bJLeqhowGx4o6bVJ5JJAj4EKErCn0d9Kyu?=
 =?us-ascii?Q?bsFfFwrf0wqNmpHVb15ny7Gf3Umpmj9ZVCha9fMS1pkEC7NDl27r9nwLZKSu?=
 =?us-ascii?Q?5Lpzbsa5e8zVlGGuDbBio7RF74qC91GOVpYmtBhW1LHJhMmLO5mqdoYpqylA?=
 =?us-ascii?Q?wTjBS+VwM1losTkwl+kLQQ8TDET6ZFk3CEXbhPdDZeFhg8XgPzNx/MjXcULv?=
 =?us-ascii?Q?N6KqTddwYgpF7Qwu9hsQcpnj3XOYcClNa+6UoyB3QpQBx1NBAgXz8BKwp3PW?=
 =?us-ascii?Q?MaXZBgcdye7t7GKTnPPl0hglnnlb72nBYH75e3YLg0+h+EHsJUmGLV+mPsFu?=
 =?us-ascii?Q?9up5+3bdZqvD2PCoyhR321GWWVqZ+JuCiVpMK0ugLz6HAWJxu0qgSn8grenM?=
 =?us-ascii?Q?ePNkumSM/obtgEwVmzbHWYKj5QL8CStYMsyW5BjXzVxtGWoApiOwAgRayrBK?=
 =?us-ascii?Q?HoXOWZtihiG/Ch8F3Eo7nkjs9qSfANvtXP1vDkgFP/T8uFNPJoLW0aPSKvnQ?=
 =?us-ascii?Q?yOVqEpxFP5mupmdpm1XWvBz5n3RcbHejpHEbYbX0nhzujBSdYw0wD5V6dwTj?=
 =?us-ascii?Q?pH/Ge3JKA5HVjRsgzsTQ6202i1zVUMAqiiEkDlv71opmV3z4jkkSQ95fCbA8?=
 =?us-ascii?Q?Oryc24zpieIe96+uCXH9DCbnxeJICswhWcrLfKvpIvwYCE/jFZ5T0muKRm9h?=
 =?us-ascii?Q?OUZvprX04wzsRIIMDGB3B9z/yQxJV04V+HMKEboK7vxWuqnQ5yuP/i47/M+v?=
 =?us-ascii?Q?B0+JrSrTjR608nEu2ceDdnwlvBs7I4TlFQHkjWfCy88S/QwXrTuiyZZEhZr7?=
 =?us-ascii?Q?qj2F9npWGN2CxIghxG8R8l3rBi3djyd7HWK2zNpGvZFn0NkwUI1kDus+LJFC?=
 =?us-ascii?Q?vrtrekcODNc/kJY9WrxL8v3NQ+zJGLljw5vtzsk57s6A3jrVF89wusSnQO0J?=
 =?us-ascii?Q?pdZFc9WYNMU+LQAk+FELZtYFEewsPdjG+suNOIDLr6zUQixJ5GSABfPtk1MB?=
 =?us-ascii?Q?YKPtxLXU4k9iwhiJfMe6xJE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0044f524-a945-4397-c6e2-08dcc6fc3087
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 00:56:02.8946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfATgaliq9VTDN39rma1zGmv+QMX4hakA0wjqJINSAbLGshToT/VpE2bY8TMDBmvBs/dydnqH6lccsEzqcWN63YdByLZSDu+SuoLOi1ihU4oEOYAJ6ReuT4dg9oCPRI5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6610
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

> > And, we still need to consider about of_fwnode_graph_get_next_endpoint()
> > which is the last user of of_graph_get_next_endpoint()
> 
> I missed fwnode_graph_get_next_endpoint() which has lots of users.
> Though almost all of those are just "get the endpoint" and assume
> there is only 1. In any case, it's a lot more than 3, so nevermind for
> now.

OK, thanks.

> So back to the name, I don't think we need _scoped in it. I think if
> any user treats the iterator like it's the old style, the compiler is
> going to complain.
> 
> > For example, when user want to use the param.
> >
> >         for_each_of_graph_port_endpoint(port, endpoint)
> >                 if (xxx == yyy)
> >                         return endpoint;
> >
> >         for_each_of_graph_port_endpoint_scoped(port, endpoint)
> >                 if (xxx == yyy)
> >                         return of_node_get(endpoint)
> 
> Actually, you would do "return_ptr(endpoint)" here.

OK, nice to know about this
I will try to use this style on v4


Thank you for your help !!

Best regards
---
Kuninori Morimoto
