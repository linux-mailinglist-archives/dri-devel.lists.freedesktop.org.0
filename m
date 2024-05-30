Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65AB8D5692
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 01:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C4212BF43;
	Thu, 30 May 2024 23:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="R7YbDDVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2063.outbound.protection.outlook.com [40.107.113.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C2212BF43
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:52:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCydzrahAE1oj2xj0bUUlZSPk5kUzbONj1lZztXoOTBj44za0LXEGaWaPqrfM7yjL65muYF1toHMEKLrfId2VG23X5+Di5o65Bap+zu0OLiEkWnPxcaawhOULfbS8Meqrg7QRYd7lc1Lbfbp3e3B4maBcuAsSWLYE5L6SHh28qKyzhcja8ZgUWtDOxn4qk71hFAa+yQl4B9zDxSxtu0hOf/Zuk1LOyaXIYB9YSrTqFZfis8J5uZC+MjUFg50+ON+3AfJZMMtWYqRJvKzW8JjbIvl/mJ3k7BAbx1Ehs/6RM2e1BgeXIURm+azD1gYFGFbBPihThQu+4NCjptMP0Owew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F61pW/JXlCPlMpAXeCuGrjvAZex4ZZCkfe74gqj6NLM=;
 b=Y28Z+dUa+EHSZ9aN1dC/Bt5DE6LzI/asYzfGyavyLKSP1KkYWGXIKBdgnXZr98fYn6QZd2mejTlJ5Bt/BW7xfRB8cKfdEUmFGNSM2B29Ge7DYFoj6SnDyFxi5INtXrCtObqplVZ8R15y8SEWpuFPzM5M2LkReYdCOpC5HBhtpDl6nFBpv6blg1NK9t4sgmwHyylMVq+yiB2Q724zMvJO02Gm034d3rNLWHT81RwSn33y4p+G9FNC4FO2g0u5Ylnz7h5Aalg67eI/p4o0HNgqLEYHoM/KH8d3XTFAmyfU6xFnh/HTTKDquqZnUkFpqMb00eYNMxTrD0gAG745XjCupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F61pW/JXlCPlMpAXeCuGrjvAZex4ZZCkfe74gqj6NLM=;
 b=R7YbDDVWF/Ar0eB0OxQIWMgsHukBcHHb/xymMnBiJp8KZNF9mAQFxAK+qMouw23pbjz6kGoXCEC6hmzLQIa38Gv3BqHZgti6cZzr3TwWIaAXVCp/L5XCsPmqJmgkfYkHSnD9PnQ4dTRIJawMmKQ1nBujmdPaip4V3Uk+x0wBjNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10061.jpnprd01.prod.outlook.com
 (2603:1096:400:1de::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Thu, 30 May
 2024 23:52:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Thu, 30 May 2024
 23:52:30 +0000
Message-ID: <87sexy97sy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
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
Subject: Re: [PATCH v3 4/9] media: platform: microchip: use
 for_each_endpoint_of_node()
In-Reply-To: <330e0f46-567a-460c-ad88-1f6acb2c2fe4@moroto.mountain>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
 <87fru0oxyq.wl-kuninori.morimoto.gx@renesas.com>
 <330e0f46-567a-460c-ad88-1f6acb2c2fe4@moroto.mountain>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 23:52:29 +0000
X-ClientProxiedBy: TYAPR01CA0171.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10061:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ad1a00-e2a1-4a6b-e9e3-08dc81039129
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|7416005|52116005|1800799015|366007|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?graHr/WQWDHFNaMByLhW86/b+uSUIKIMxXEhxAF1YN9tohNDf6+catUoMqc3?=
 =?us-ascii?Q?yJEMArsWcIdGhGrmWJe8ncniEEEJP0H20x+2TGl5GOdwZ8G+drWhV74FUs9k?=
 =?us-ascii?Q?3aef6ME2w5NeyMzqyNCr6yfo4ZvFrd+KsYQ1X90McAckgqrVpOPwsyaltX7Z?=
 =?us-ascii?Q?DpQcUKuE65Wp/V0D1gjbFP1EDiXpqAepzdCctOWhDr2sUCi58oUtXQmiSVSj?=
 =?us-ascii?Q?XUZ0kBoMXEHUz6ZZIJac0VBjDJrxI/QOMS+/xFxviYplJfJyLF8PmcbGtyW8?=
 =?us-ascii?Q?GUQp4J8i7mB7Vyq+RSB8/3rmZw1o5KZJGFtTKc2eWX6FIIPvaalPsDM4MYWQ?=
 =?us-ascii?Q?BJa7ws4MtnGtFjroJ2Q2sUmjMSvP5fc2LXoNvqjnGAbrlhX0bAMRRnUCpI52?=
 =?us-ascii?Q?XNoXz5Njr4Qzq+EZUAnXEXL7MoW3XMEeArHh5nEXpb4aQm8xMk0Tn4ueFkZw?=
 =?us-ascii?Q?cxLyouZLRC7F/dM0gniORbZwa5VfH/hF3ZRB6+2l6oZHxNknslwTsTzF38r2?=
 =?us-ascii?Q?I+88i7ceW7D/Zhca5EWC0a1SguxV+ZZNm5yT8d/lPziuVxAFDN20fwlrzFe8?=
 =?us-ascii?Q?AEagj9sptB23ZqCj2aU1mAKimsjVpmfO7FbHxKuowO/cYeEKG4CVstCFGXgL?=
 =?us-ascii?Q?TZhpno1cpuoFOTeseRcZMFEPaAz211hb+Jv+UcIvwQ3Ft9B0KqT1wtBV688N?=
 =?us-ascii?Q?3fmreNx18L6LHEpvSYslJVGFhxfnR6sib0BPW+Usaym2dN2gtQue43aDluBy?=
 =?us-ascii?Q?auWqihDrwZd+ZNfw3+VlYnLTf4Khl8cfkaO6B5wLUrvYIY7kzu7zXE+y8Qc0?=
 =?us-ascii?Q?NmTATuET5vDL/z/McYQAI8epER4JNkGJQ0R+3tNBJ0+4phLzJQVx7zP3jK0H?=
 =?us-ascii?Q?lP9JSWTiY4rgH5ikRC7QlxSSM6moVduuPX+woyocN9uh0BBrZNioMe72Sqjy?=
 =?us-ascii?Q?Qi18aSKmRnqgKTqkFNgvxMIA6244Vzl0LCgPHzaYk3FY+w/Luhn6OI+8Ed3r?=
 =?us-ascii?Q?iFuFSRJbHIhyOdPdXIosM5+u7joGFwJARSouomxrKoJEH3RDCC741ZTPZXNn?=
 =?us-ascii?Q?d9vG2X5qDFTqLZD7m1vYncTLUhhL3wj8yDvLwLAMXHfZArOoq5p5OciMmcIh?=
 =?us-ascii?Q?DIvWq8jrubDon3E8aiCJmNqzHJC0xlzOL9QNUM/r1KpCeAc7nTtPIeYgY9Zb?=
 =?us-ascii?Q?zCXATRxyEEu3pI0lYTz4nyN60X6foVA7L9CQlPv4+yKZ7jvccIDdietZsQNh?=
 =?us-ascii?Q?fcczvpU52/TT3Re+8YV9v4/ujpod2y4HJDB+gMNnb0V1TmVBdwG6gsDXsHuP?=
 =?us-ascii?Q?jr6AC1CUy91jOsndd/y2ON4V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(52116005)(1800799015)(366007)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5hDoSgmYO+q5S4yVA0bILdNhm1OvGy5KwqY/GbS7hRMZWvyle0bl26raGqHa?=
 =?us-ascii?Q?Pw1GpgYk9vjmZVMiMT/2ZS9VwfbwYSY3Y01gAeI8wJnKYGeZWq11nLMuRRQ4?=
 =?us-ascii?Q?Xv3Yhexb5h2ghwDz4z8zYkBnTn/uZP1Yd8Pka1jrd+MkGYbOLeK4paxohCmj?=
 =?us-ascii?Q?2evIgXgDzcr8u64a4l2uIZQUlfahXwO66yHJ00cs0FVLEF+DuAKzTHN+K3jA?=
 =?us-ascii?Q?jvCcHJGLcPs28aT7tCrCFeqMzXiefs41R5WpalQxyePU0yRqM+YAM2+4NpS9?=
 =?us-ascii?Q?9B5hNsb7g9J8CcaJD8zSUE4sOlCIkE1CmPCU5Tvjm4r0cRUdaTFAf5QYv1py?=
 =?us-ascii?Q?2IpF8KgEPy0r6N61IZ69GgO3HZAbr3FAIa4EkpJ3CUUKEWrPTkzKtO0IXH32?=
 =?us-ascii?Q?LXxUkHiutdMtWK1KzdFMGPkfk9VrID2Lo706UmZ6JUr67UCJ80qUALwy6RU9?=
 =?us-ascii?Q?n5yWdeJ66ymoWns+FrZ4GJzZkjb5G9xVKcQntYwDbsVAm1UFREgkIxj0Tej+?=
 =?us-ascii?Q?h2hFBXDlj5Kh98avkStiAkxlwtKZM3YRH+PCL9OFLfoxUFl7ZpjRv5elW34F?=
 =?us-ascii?Q?GaLAX1HaLupcXoQcS0Log1YeWLd/WOv/kJKLl22k5ahiJEl5ajdpzp908OTn?=
 =?us-ascii?Q?qynasB+j/GQ3gt16k4UwAPAKJHXm8cqYum8LA3t46DCwZ7sOlb6p0KGlXt9n?=
 =?us-ascii?Q?qvOzPaLwF1suSXpB0Mvy75IG0xx27K5SBdJ5Cgol6n1WqldjeoPOX12eWV6m?=
 =?us-ascii?Q?FSGDR4jwJKL/KpuamPqWepkLro7TIeBLkEsT7ZHV1bAkPDBnUzNZOU4qhUf/?=
 =?us-ascii?Q?rXpJAk1nRfq4CDJl+ZT2+XYQOaUhwq8vNq5zHma9Ps1hyIlhFSzaYlajitUU?=
 =?us-ascii?Q?cV62VZ4ouO/6B4BBSYwl+b6VVHMHiYc98NrfH7teLFQId2Vcz4yLsIdhXwUw?=
 =?us-ascii?Q?WPqkGoHI1RldxdzG35awZ36SprnfJIC6VyPTOOo9MAQkHs9yO04Nx4jk5MU/?=
 =?us-ascii?Q?CTWqM82nsSW7nDwWEMBlDaUnGvuYOE/ZlNsTpk28sPPguVkBJBpfV6GbbIVb?=
 =?us-ascii?Q?DxRxMtDhzrJWNdOLclP0i3z4S+pwClcB7rnEPnHdr3zvPgNKptzWjmvfX+Oa?=
 =?us-ascii?Q?IgNwHeCEwGqX09qms0GQLpP6WDGTjmrus+UB0vH9ecjI65eMnuXYKK89SsN3?=
 =?us-ascii?Q?I/dmyuoXLyknfKDz50JLtnDZypdB2On1DVwvaPicEuoHEPTQj2i9E8RRUXDd?=
 =?us-ascii?Q?uFEdUATl+3PrUeUR1wP+4CLyqNqi4UN32m+MUfBjEkMk3O+5HJUoc6HAifpY?=
 =?us-ascii?Q?UdUfWAjDEnT6/xpCWS6NZHYKfLM90p3NOAQjxX4kkqMXmZ8UFhQt3jQHVLt/?=
 =?us-ascii?Q?O6M0alkFtQapiZTBdzsa1MfZXm9xEs17/uMTC0XUrFlbC9vNSYgMuSwagmwh?=
 =?us-ascii?Q?Fy6hcQ26iOBaHpVMQHdEcbTUCVnNtZ3MJRQYQ8HhzFyrE9lBP+r+TXNDRTfY?=
 =?us-ascii?Q?Vs3pYbdLdFtrIRiSlCOVWvqzbpnVEZ7GhugTwFCehoulDgaaEyXVaHLWMX5n?=
 =?us-ascii?Q?Ae/dDeMGHMRp+vTTV4/3GIrIs67Tgx9Qhd432SbhB0i4BqUE//2i+0ichVam?=
 =?us-ascii?Q?wh+hTP19eArPC3KB0+HmjJc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ad1a00-e2a1-4a6b-e9e3-08dc81039129
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 23:52:30.1623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jhiCDGb3VE7PDZ4GvJFd3dKXs65r6FsZ48At/j1L5dalTOewpvwl96+BkTpxGI1QYIqHpUE/tIEqO5rlHwqQmEGpn/wQhq8bUn7w7OM7x1XCwXMAnTkd/poua9kLrjX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10061
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


Hi Dan, Rob, Helge

> > -	while (1) {
> > +	for_each_endpoint_of_node(np, epn) {
> >  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
> > -
> > -		epn = of_graph_get_next_endpoint(np, epn);
> > -		if (!epn)
> > -			return 0;
> > +		int ret;
> >  
> >  		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
> >  						 &v4l2_epn);
> >  		if (ret) {
> > -			ret = -EINVAL;
> > +			of_node_put(epn);
> >  			dev_err(dev, "Could not parse the endpoint\n");
> > -			break;
> > +			return -EINVAL;
> >  		}
> >  
> >  		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
> >  					     GFP_KERNEL);
> >  		if (!subdev_entity) {
> > -			ret = -ENOMEM;
> > -			break;
> > +			of_node_put(epn);
> > +			return -ENOMEM;
> >  		}
> >  		subdev_entity->epn = epn;
> 
> This code is an example of what Laurent was talking about.  We're taking
> storing "subdev_entity->epn = epn" but then not incrementing the
> refcount.  Perhaps it's not necessary?
> 
> The difference between this and _scoped() would be if we stored epn and
> then returned.  I feel like that's less common.  We could detect that
> sort of thing using static analysis if it turned out to be an issue.

Thank you for pointing good sample, Dan.

But I wonder should this patch-set include and use _scoped() macro ?
If above is just a comment, _scoped() macro will be separate patch-set.
If above is pointing the issue, v4 need to have _scoped() macro.

Thank you for your help !!
Best regards
---
Kuninori Morimoto
