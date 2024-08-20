Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D09C957C6D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 06:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE4310E04A;
	Tue, 20 Aug 2024 04:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="KEvV0/lv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0205510E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 04:34:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6+QU58+fQxqfqwSXwsibb2ap3SeWqnXZJYSP8O5frnJzo2LE7+uAD1IGiZBm36M7bfzADnAfKUquvCGPKVlH1MpUb+rAh2OI6FM8zM847vEmXXOWg2D0c8ISHObbpO1hJLN+jJr+CBubZ7CBJzEmdw3d68D/tWgb2DPC64RA2DebPnj6/1XU+EHrqP6gjSYKNxBd4ekEiw8x+toYjH1H/z/M3pvsunDfNssf/jdQYZM96WiYDP5gW0/Ns+g/ft8IHwiYCCntxpw8Tvt2Q1QIMK17WvtwXXv64cEwRBSzx4+EF+tLpU/o8CTjLmUEk+5DXqcbTbUTMQyKTw7ncuKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzljShvW8eEQCPSoi7jJ9KA6lkwk0x3PHF6FTdth6NU=;
 b=dwj30I2k1N1OpLIwtXG/8gPYncRJWY0RHZHPIXyn/T1muwpu1XuoKFCLfdWj+HhthR5eQMR1CV/HhiyNM4hwQ7B1PZdLOCvpQmEsc5bZNXwdjvjyw6R1O1MdlyTF7+cdaHewTMfdCT/byMWsNCDI2eJ5qp5aR0//MykakmIZMKqyo6omW9iCQ81MpDwm51YvcCSF2vJRHaRUrFsOWWf7vjiOXOaf2khTdhYKbmnX/yOgSmzeb69JkfHNmpxmr+aI4ghEoxXrmBBkzh4fYsOdbcLnLRGcM7WhVVy1Uhc+OsGI/EqQJn92blvScOYxkjI5Tfj2QLPALVkplcwCJvWHgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzljShvW8eEQCPSoi7jJ9KA6lkwk0x3PHF6FTdth6NU=;
 b=KEvV0/lvdWyNdRJIZk/00BSHtpX2yqS0CxXwFTki4v1ZQsgrBYiVvUNZANUFOjy7QYUPRjGrHGJwyjajjAOEkDnfU1aotOLXl5B/1vaMJcKayIUKuCsiSJI0IpZGavZ/b2sjUfKQ3hKf+cyOmO6x25oHfgmLZCXW3F4SBhH6+ak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11706.jpnprd01.prod.outlook.com
 (2603:1096:400:400::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Tue, 20 Aug
 2024 04:34:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Tue, 20 Aug 2024
 04:34:02 +0000
Message-ID: <87y14r6cee.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <7b5db9c1-5cba-48c8-ae77-f224b7b4834f@ideasonboard.com>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
 <87le1aw8lw.wl-kuninori.morimoto.gx@renesas.com>
 <ca216286-b09a-4faf-8221-c88c21f4de0c@ideasonboard.com>
 <87a5hm8n0k.wl-kuninori.morimoto.gx@renesas.com>
 <7b5db9c1-5cba-48c8-ae77-f224b7b4834f@ideasonboard.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Aug 2024 04:34:01 +0000
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11706:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa7cf4f-2096-42d5-f1ad-08dcc0d15121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qoMIsxPTA1OG/BX+7l0iXVxdz2E+0vh3Vv4/j/EESZlntQHPhlc3oQgXKmve?=
 =?us-ascii?Q?zrivDTook7+DNoLL6cpndfpwuk/pY94D02QNfMmt9B6PO5tnAhRGg6WHt7G5?=
 =?us-ascii?Q?nKAKHy3zyb7AEpdJXlcH5xpL9rFZZRNcf1KCsdv2WfocWJLmZatyJE7QJwix?=
 =?us-ascii?Q?cF/tn2h/QtAmTS44/alPtdsgULbrHgrbcAm4M5Luwe1Sxh511cSNllacr8+c?=
 =?us-ascii?Q?ntDNRepYw3r1L3vIjT/sI6mLJc56XDUXaZCi6r2Pww8sWMJPElgH+hFcxfym?=
 =?us-ascii?Q?UqpoWKro267Vjh2rDI9L17Vrn8RZVWFqT60RVuI2a3cN4Wcn73m4hYBgxV3K?=
 =?us-ascii?Q?KwjXaHBFI575KDGt6GE6K+ePHm3TGJ4j0Z3TppKlkoBNIzs20QXfktZHXRST?=
 =?us-ascii?Q?Y0p/s9AdwpCtTXk06+MtP7bMi2yM7ihNr196c61HU9a/7oPNHENj9sgIzhhP?=
 =?us-ascii?Q?UFIHG6wYlFKcIjWJuBfQiuNb25V/W1f3+P9LFdm7H+lPCT4ebLiisJLDxELT?=
 =?us-ascii?Q?CGsHu1MEsOxfnb9v5KGVTWE6LUnXzp9+jmjJpPJW/6/j5sq4aRyBEWxUCSBq?=
 =?us-ascii?Q?USuNXgNwNwQpy1wWvRCxz5duN89MkpoxNE4HmCDIUlEd/oMsPL1qMFhmISD5?=
 =?us-ascii?Q?aIlXXkaLL1fV4RmlnqC95GaofafwlidBXOyB4L7IgUQQFKdg7wZPWA8gnbjl?=
 =?us-ascii?Q?Xxg8lwmWAyxJT34sAjQHPsQoiNcEh0tl/Q0bnyke1IOwHvzVvUfAC5hTtNHy?=
 =?us-ascii?Q?ehrlGmvPay4JPvlB1vm5HdrXYqMECdr9jUH+pHr1XnehbAtKiinCRGcAwmXS?=
 =?us-ascii?Q?5K2dx2O+l0KKc1ogyVa1GtaNVW7dCO79iuYGChynJVnxKxoCVBl4C19Lq77f?=
 =?us-ascii?Q?XIrVJ2DnWARA+lyxSVyA49vpz039LSjKUAAVVNEyOAlZv06tjxyt0h34xgOO?=
 =?us-ascii?Q?KHOvfWjLHuVnQpT9GMlXKE550bbDY9EYEGL7zXxr0GBLqk3T6a34zJQ9axzx?=
 =?us-ascii?Q?UFn1EBHXgM5OGt2lPT4WBBZC8p02B2BkR4NkMUDb9PEGjYn/+ioXB++IhDJs?=
 =?us-ascii?Q?mL02kjTt1BLY/T7tdTunX/Zr3NcdjhOKFvWUUZxkH7pgfGku3+IZbJw/lecC?=
 =?us-ascii?Q?bgWko2oQJjw6Rut8Hci58B6swV5B9nLfTb2yz52G/sqEWalRfUX1qnk7soxp?=
 =?us-ascii?Q?8kaRGDWCxDY5wUll/dkT4MmNqNXOjgmEazxMvd16pXI73dy5MYJim7QWtfF6?=
 =?us-ascii?Q?/HRn1K745SAz67tUwWFrjYvuNr1X3NbIvI0uuX8lZ+Yp+bPeYE5J7J7/+NrX?=
 =?us-ascii?Q?ABBEwT9rOg9rms2/I9AFS3Z6TLBVlOi9T0WZiV0N4pdlt/7XDHDGY6WL3lGz?=
 =?us-ascii?Q?TgQO0TCAskG426xONg5vbhm3dinFrH9gTE3V5A8pzkC5O6OlVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gqSROLsJ5wpk9rP2Yjd+YBsaLX3Jw7/5MXbIB++vQLf9ipq+288olCbxx0II?=
 =?us-ascii?Q?oFv+nsRRU87j7m68YfWggTiyvvI3AQPn4d9/QYpw1QMnTtpbZpZ//AF03hOC?=
 =?us-ascii?Q?y1Gs7BLUdaarE3GuJLsOBlZ0Sg2Na+xzaEtbczAVwe5g/GvIPq3cXq2jl0st?=
 =?us-ascii?Q?tBuFwV1qRd4WgxxvG1nsy7adpRaCsIxzG9RPL5xH3G5W2IcWSFhp2NEP8Lmm?=
 =?us-ascii?Q?4/owUJQhP7eqIWyunXsTC75KVPXLVZz17hPRvWzjpxxpb/5by7d6AmaaBrKe?=
 =?us-ascii?Q?H+Tlhp8AJoQ/EC8z4y6Aa2/8SbhStXOOVBKtXO4ldQT/nrHv32h+LyckKZvi?=
 =?us-ascii?Q?xZ7+3RqCWbu7IerujmpvWklZ7Rr4sQEArXfPj4n07aAWUyHh2vUxfC+aDd9Y?=
 =?us-ascii?Q?jcDWArj52/hjraprrwLwAs4mNbZG2II2+/lnsER3GR13jNuhMBASizk3Kabt?=
 =?us-ascii?Q?aP2VmtO/FxtKE6iTEBCBGaw00e9dzynhZMuQeiNsIS8N6r5Bwhk2dHKH/Bd7?=
 =?us-ascii?Q?alzHOQMkMhV+OmeF4nB7KCS0QkXFRMJbfg3vMwO7/Q83X8EwtSXNN6eD8m7V?=
 =?us-ascii?Q?R26rAdR1/pfDb1+kptIAIguuzAcpOUGYLpI2FZGHAvnDbQUlOHzMYbDSCSfE?=
 =?us-ascii?Q?fMu7EhoJgGeKoACxkNnNtSVjTnE6eR3xGgGsOD9v8GBPYlxqmVPKm2Lq+q7g?=
 =?us-ascii?Q?cDkUnaoXEONJJQHBej/78NFVzuN2QpniFPH8Btbckde4u+KA88z4ru6ihcvm?=
 =?us-ascii?Q?BFTa/d5L3S2FwhIY7pNDSKrugi14GZX/pn9ptYjFHfLLC1QgtIaScrb0In5D?=
 =?us-ascii?Q?FR9XG04cW9jurKCw8ePW60yCBgqGz2k0x0iTrFb2kahHMSvgIEvcFJNJTKh2?=
 =?us-ascii?Q?3T92/UUDUHpYU/wTf+xUgAzNqI+hAIhaj1fF+3kPTDJl4zxF9LTEzdqHaQz8?=
 =?us-ascii?Q?qJ16ykt+666n0qRIjcKTwVQcH809xkG8aLHWa5xB3QBM5SeEz6SU8Oz0UozZ?=
 =?us-ascii?Q?WjZSzAGoBCkoBL4JMqmhkZ9UWcl9wdSlX+asU6t4Fv64iTR23IRDQdjyOxT+?=
 =?us-ascii?Q?CjWn5SnpS3PPlh1Pr6n/SoRWZcZmbe/yAF2w9q1/gIrITyTehumLTwRCYJjR?=
 =?us-ascii?Q?iV7LZWrG5ZNY16vtX188I9McBjSr7zhXLIcNmCJpfRNQtUUCVOF5jao3bfKS?=
 =?us-ascii?Q?MYGjdlMfXmdbeVgVHTZau2SM0j3IJxItDpk+NUqvILtidu+h25izZsvH1P2+?=
 =?us-ascii?Q?uMpE7on8tk8FQecsIcN4D1xyeRuG/cMlk3GZxOkvbHZorzd4W7edIvRojtUV?=
 =?us-ascii?Q?U1pwRaTZU5gflMdiW7FGLYn2G8iHCaBU8sm6tstFL38oNjfIqCfLWB7CMVCz?=
 =?us-ascii?Q?aJ/siBPVW56KJgZFdBT0T+/Mql8ZEoNd9T3WVUnEguxFeNBbTzPvfTQ1ZGOZ?=
 =?us-ascii?Q?ZOgJqu+zAN8A6dbpuoZI2J66hlAIvkxNtJTx4q+2SP1u+l+GWFJhhoSFGgEk?=
 =?us-ascii?Q?83GhmgIPcnJdHc12TmGW/PD7XcvLdXeJnY8XHvsozWGyMg5M75lMU2FoG7Zw?=
 =?us-ascii?Q?CYxqKKQCVQxtQ4JBMhjmWO6dbBuYaOaXXmuUeONiXiZJQ74Pwh2beffZjswF?=
 =?us-ascii?Q?SICiTm+0ePuD7r1ZUOxjCNg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa7cf4f-2096-42d5-f1ad-08dcc0d15121
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 04:34:02.2783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixNdywT8ALMNLXcW2tySoDe6mPiG/Tvpw4hvg70OwJYEZDIBNoWudvJeesDG1qbrHxQltEYHZZVabA+uFxI5evL6t1+IQrGQ7ijyNzbmDrB0MDlmBCTRhlKyU1qOUdL+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11706
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

Thank you for the feedback, and sorry for my late responce.
I was under Summer Vacation

> If we have this, of_graph_get_next_ports() returns the ports@0, and that 
> makes sense:
> 
> parent {
> 	ports@0 {
> 		port@0 { };
> 	};
> };
> 
> If we have this, of_graph_get_next_ports() returns the parent, and 
> that's a bit surprising, but I can see the need, and it just needs to be 
> documented:
> 
> parent {
> 	port { };
> };

Thank you for understanding the situation

> But if we have this, does it make sense that of_graph_get_next_ports() 
> returns the parent, or should it return NULL:
> 
> parent {
> 	/* No ports or port */
> };

Yeah, it should return NULL in this case.

>  > 	port = of_graph_get_next_port(parent, NULL); // (A)
>  > 	port = of_graph_get_next_port(parent, port); // (B)
>  > 	port = of_graph_get_next_port(parent, port); // NULl
> 
> it does not feel right. Why does of_graph_get_next_port() return only 
> the ports of ports@0? I think it should either return nothing, as there 
> are no 'port' nodes in the parent, or it should return all the port 
> nodes from all the ports nodes.

As you also mentioned, having "ports" node is optional, and maybe this is
the reason you feel uncomfortable on current code, and I can agree about
it.

If the driver needs to care about multi "ports", it is obvious that the
driver cares "ports" node.

My opinion is because having "ports" is optional, we want to handle
"port" with/without "ports" by same function, especially if it doesn't
need to care about multi "ports".

I think your opinion (= "port" nodes strictly only in the given parent
node) means driver need to care both with/without "ports" node, but the
code will be pointlessly complex if it doesn't need to care multi "ports".

> bus {
> 	/* our display device */
> 	display {
> 		port { };
> 	};
> 
> 	/* some odd ports device */
> 	ports {
> 	};
> };
> 
> and you use of_graph_get_next_ports() for display, you'll end up getting 
> the 'ports' node.

This is interesting sample, but feels a little forced.
If you need to handle display::port, you call

	port = of_graph_get_next_port(display, NULL);

Indeed we will get "ports" node if it calls of_graph_get_next_ports(),
but it needs to use unrelated parameters, I think ?

	ports = of_graph_get_next_ports(bus, display);

> > 	parent {
> > 		ports@0 {
> > 			port@0 { };
> > 			port@1 { };
> > 		};
> > 		ports@1 {
> > 			port@0 { };
> > 		};
> > 	};
> > 
> > 	of_graph_get_port_count(parent); // 2 = number of ports@0
> 
> I think the above is a bit surprising, and in my opinion points that 
> there is a problem. Why does using 'parent' equate to only using 
> 'ports@0'? Again, I would expect either to get 0 (as there are no 'port' 
> nodes in parent, or 3.

This feature is for the driver which *doesn't* need to care about "ports".

	/* CASE1 */
	parent {
		port {...};
	};

	/* CASE2 */
	parent {
		ports {
			port {...};
		};
	};

both case (CASE1/2), we can use

	of_graph_get_port_count(parent);

If the driver need to care multi ports, it should use such code, IMO.

	nr = 0;
	for_each_of_graph_ports(parent, ports) {
		nr += of_graph_get_port_count(ports);

But of course we can handle it in v2 patch.

	/* of_graph_get_port_count() cares multi ports inside */
	of_graph_get_port_count(parent);

Thank you for your help !!

Best regards
---
Kuninori Morimoto
