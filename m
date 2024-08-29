Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7C396536B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 01:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC5710E7B5;
	Thu, 29 Aug 2024 23:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="IYaB9xIJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694E110E7B5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 23:29:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPnT9siBkom3zX7t3PXG6GMQS1jpSrGcEZ8yDPmZbWEP8pgcwu+o/LxuFd6JRhsskfMgWbvSq9CdnAcEgP9txF3+7rqPiq8S0iJDRfZyfKWPLAlS7m6NhLJ0DETsogCV8lXrSTSG4YhV9cQgKUivMLowmKHBD+VmJahncR0v9iGg8YmPMKZT9LuL94qrdvyn2gMnbdkTg0O7fwV457DbLKRZCRjhUtX8aPYe7daSYTtZwMItMcysr2ydXTSmIA4DDkq1dHJKJH8F6W/BjKEIKwF3nFoDwh/PQJY1EfuFUUio5e1HQA544I+uepfV0lGSGdQE6jUHaxeo4kj7shOeoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Xn8COx+Rh6jcoyykDa0kNsAjm+H22sD7u/kjHHxsz8=;
 b=Q76vaQCjVZw0rfFjbjQZHgKMl/r7wHhcQ3zqvfZCPdGWghceSC+Bo5BFN5cIqpl/b5dWkTxAOOOw97Ckr9EbAL9wCGMR+vCUHvzZOld+/0yJmeIPefdJFezHTmmtAcOy57Iu40Hu4ccuCevESn6El7toxzJWryHNJnzkSbN+SqtulGKz/holakBgBgijrt5821dtakCiYHZBAia3U3xru+o2riUrf+h+0lHAU4sdd8F7KS32XgA9dxjOWVlGDwS9mml6vUIy9wwbNwgmkFZqQ+h5VeZBeIvxx4C55dBI0aB/HoAi+FT5am1xoGoU0p59m3LFIrYm4xv50Oi+Eq/BVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Xn8COx+Rh6jcoyykDa0kNsAjm+H22sD7u/kjHHxsz8=;
 b=IYaB9xIJCQ3MjVvKsTlrLBnhVTflRqnBNBMbBpfA3Xv5cAF3ChsVDYYJtxDwDIC67AP0W8JOg2WoLN+iDkj9v7moIgBpPv76Y8janG4hFCtZhRm/P4HXZNL5F2cyDuEEYMufX3HITiU9hYimVDwlKEtAcds+0el0el5Q9Dq9AAw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11610.jpnprd01.prod.outlook.com
 (2603:1096:400:372::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 23:29:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 23:29:00 +0000
Message-ID: <87o75anc1v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
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
Subject: Re: [PATCH v4 1/9] of: property: add of_graph_get_next_port()
In-Reply-To: <20240829154515.GD465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
 <87a5gx2pva.wl-kuninori.morimoto.gx@renesas.com>
 <20240829154515.GD465065-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 29 Aug 2024 23:29:00 +0000
X-ClientProxiedBy: TYCPR01CA0085.jpnprd01.prod.outlook.com
 (2603:1096:405:3::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11610:EE_
X-MS-Office365-Filtering-Correlation-Id: 32176f85-6c24-4e02-55af-08dcc8825cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wdvkSytsBdBumiqLS2ppQQUbRGJ90KgCEfK2vUc1MTy7w5kC71Saud2vHPol?=
 =?us-ascii?Q?1gr8ZVdW0uPmQpBGn5pjThYt3oKgD+gNHFpE/Y/StETA6WSvclEcoK7ovs/9?=
 =?us-ascii?Q?4N6C33Y2r/Sl5uLnzs+hvMKk9z1axBd0F2I3NnBSp2Z2AsVoSvsMr5eK8R07?=
 =?us-ascii?Q?CJL8B+/3Y6rT98Yf5Df0BoQQTKJdH+m8U8kzCrtRDEQjhm8kZOceBitmYJzS?=
 =?us-ascii?Q?aqhg31eiXal8DxV+u4rDNriqMYl6ehPg2ebqOHTigQMok6PoEdgI4CxjQem3?=
 =?us-ascii?Q?k87UHC2k1e7hFcUW5XzZHq34mO+JJ6IQyOfWbUYJEl2SiwCCbABJtHZSr+sU?=
 =?us-ascii?Q?fiCQzeGZCxMqS3X0KT8VDtfNSAM26nzFHoRbiS9eBP+3C0pVCSuKeLWR2ZYz?=
 =?us-ascii?Q?4PT3O8+NwpYyejfc9a+rYY9P2HrF/k86cpr29TvPEx1ciGp/DoaD7PEOvdc0?=
 =?us-ascii?Q?36ykXS98tbzdUSlEZ7bL/9mW8G8Yzfpev1HM/b5KcN13fjSFvEmrdHMEKUSO?=
 =?us-ascii?Q?DgcuTWKnmzq3tpVwtgd8qDNBLukyETm+sAompEw2gQG8AAmJ6m7SJ/dxI3x5?=
 =?us-ascii?Q?kJuTeuvNo29iNpKp06QkPgt7ElpViUnVLcXYvqKxNAMgTN2KZhwm++uNoIvi?=
 =?us-ascii?Q?RsygGSHyFFZEFE2ca/qiJ5ShCRZlnjoyLGSwSyeIYD/lAR1GGTT66xLzBUUU?=
 =?us-ascii?Q?bUny7lC8BmzDz47qTK4z/6Tc+K5Xl8uxdlj9hN9rPKb7r6pdzj5qNPXE1mVn?=
 =?us-ascii?Q?lsufLOGXyXL4Qqn6ygcUT4YVSVPEvVKdZoSf37olaJ1mpiKBh1ehchXd6TUi?=
 =?us-ascii?Q?7bCDVXfkasIY6nQTuECe0mJHg07+S6MnH9tNWameJJ5c51QPFNbOc0+rAIui?=
 =?us-ascii?Q?IgYkexCFZhTgeow28YJFpZUojw+ROfjFh5W5JS1WOE0/oWzj3+Zf36eVSoaK?=
 =?us-ascii?Q?hw3AVSVxPZVp941MJixmb8co6eol8imtaUwipJRnE6WwRsSlcAgHxdkPDLu/?=
 =?us-ascii?Q?6NJKLsREVr/lPB/VNOmJE+z9GTmxjJnRzut9OqEzXf/yUb/GgTfxhF5wJQ9P?=
 =?us-ascii?Q?ryp3NKcmlR1Qi/44v2++MkNuRyPTluZbF9hMQ8LfUOpSL00HdXeoBtCBhT4T?=
 =?us-ascii?Q?D7ewmAFWkk/hp/F3darUu642Zdv/XsVhqWQrvCn0Ku+sMQ1QGdn+PaMv4HTP?=
 =?us-ascii?Q?jM08Rmrj0xY2VVniX0+jSqBLBHuzVJWhuWMKG4DYSGeaYU04ck1GyIAEZMvE?=
 =?us-ascii?Q?2ZIPiktoGvaWL7HcDI6wMuzutc5fQPYzWEPiikv5DBD7L618tkrwX9rED0Q6?=
 =?us-ascii?Q?9/NMHMfU1TXKaVPXfYbxJFOVhQp2hFAKuar3NucEPxCv4+iuNrwfk6hWKZWK?=
 =?us-ascii?Q?Rs6olACUZ1P0mbaJ/NOBaRCsiOUnxIqxFJTTOm9injZPrW3+EQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jd5fYlFVwktOxNijso3xb7+bcdDizQA55wFdYkHUia3lZlmjKX3UAc3ZXSOM?=
 =?us-ascii?Q?HMmDlZPa3e+T/TTwCZnRxkb0wkNdl8Re0UVzpU7m908a017Xv7xHRVS/bWxP?=
 =?us-ascii?Q?as3+h/ILQ/qFN6vfGPwa7F9fNu4Kt4uXmYtynkPgnRRxCGj2uCKLSkSJxysw?=
 =?us-ascii?Q?EYOe6kdKjn+Lvg2WCJYSVakWVqcGAvwFYhkFHdbaqzCd6IaYdZ+dnzUXQQr5?=
 =?us-ascii?Q?gU3LFtamSYcCJJm80rcK0CSYur53JzPeFgi4okkw8xE9IRgu8UUbdAZiVV4J?=
 =?us-ascii?Q?Bfcp1Su2Ypjkiw0WR+7EYHE+7oanQID64YmulcdKJdjLMW1rMMq3hosDl90P?=
 =?us-ascii?Q?nDIkH3sMQ8PDAjbonLA0VI9fmiz7JmP0WjY/fOHGmR9c5gdeH4xeijZOfHeC?=
 =?us-ascii?Q?xDugi+8ijV+HYn/iyhWw0NLwVlj6KHiGK9a6RHcX8o8nZ2ZapgjP86+I92Us?=
 =?us-ascii?Q?p1ShcC4YU9AdIoIj6ElVhUd61lrM94dKL9zHoZC/5xuetfGOabM2/xwN6pSB?=
 =?us-ascii?Q?Y/II3V6aI3A/RArxFg53AEWXDw16/unvNwTwjO/WaNiCB6lcq7S1uX2mPrNH?=
 =?us-ascii?Q?ybttlQ854KPSm8NuMGOteBAEOHSrQ6vGwDqvjwncax8CHjveAvxUfPB2q779?=
 =?us-ascii?Q?epPyLrnzl7DnK+RgxJ8YuiqVwtXQUPnfS2zFAEYkdcggOtNe1gRF8+odyOPW?=
 =?us-ascii?Q?Xv//oVFSGyO3g+xuvpqpxlaVxWDcx8K+1aA246p8ym4eQiBq3ie7nEOB9Xjx?=
 =?us-ascii?Q?+AJ4lD05M60oum7t/Uj2e8zC/wUvRkysoeBacWB26SWUr8yCi9VxAIYjNM18?=
 =?us-ascii?Q?UmmmsRedl9GoLRWAvz706D7BaIU3OaEzfW2EV296qj/Ax7MzAWjakV8Qka/+?=
 =?us-ascii?Q?aBiJjXS2uDX0BXOgy0FwcLDQ0oyBlDhTL3Zd6PBLxKwrnBQQMHPxtvBhTdBM?=
 =?us-ascii?Q?Rqi1NXvUjYxfs9uHZyObPVWtaqWRS4oNnY7ofV/NN32F6LzZYHH0IlrhSldm?=
 =?us-ascii?Q?50D7Q4SmICM3UyeYfdJ9F71gx8G/rbTrfSozchpvWWTyMAaav8YozcmShZAP?=
 =?us-ascii?Q?EU9i0HEVzp14udkji53zl93fjyg0cRY0uFTva5uO2jb7T7BhaSNRJCLhB6Wd?=
 =?us-ascii?Q?JqKNvX0W+zXFVbI78kQGBmVyE3+Mt6IPYi0T2SHvN3yTGOBpGirP5FnBbV1q?=
 =?us-ascii?Q?AiB4hrtjM4Ol9GqkIzbgdlQsI2H+kDPmhAzVruhxhTmvqkQNFfm+bDK0nSqH?=
 =?us-ascii?Q?KkigE2cz3LgsVagzNy7f6baFMNa2fgbYXa8ARrD5byoXR42MNM1ZM2l/2Wbe?=
 =?us-ascii?Q?NgaXqhIT42NJKz2pyWUQ7iHD6zDhWKeuo5Bec0kQmqbNyaTuxalbzXkgnGMP?=
 =?us-ascii?Q?VA+15w+KzOWyCKlVuoBAptTE5EBpMiynJ5jJKNKHSUm9OsPvT1dfsjLimM5S?=
 =?us-ascii?Q?JriVPj1l3K3GD8d0K4fcoq8PHSvRW4d0Xhmkn8dBQkWBUqpL4YffHFp8ZSrl?=
 =?us-ascii?Q?xKGy7ZYd/TyFaIPNGe3wDYkbpoBnElVlZL5PQwanC6ijxZ3NKySwAKwPos2v?=
 =?us-ascii?Q?SMW6fvQxofOlv1QIkAE65O4eBYq+8Fig+mQ8wilgoaLZ75kNCRiI/BLE7xlF?=
 =?us-ascii?Q?AZSeibJCYc2Du/eQjuFeMYU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32176f85-6c24-4e02-55af-08dcc8825cc3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 23:29:00.8308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ep/LmT9UVWf/smM3xkmZwCYc6n5XmYge1ixo4z3xCun04h8oKijWsUXrAIv8l15a/UCWrrJr7lBsgwWoZXhrRJjYUm7B5adty+p79drMJJVlIErffd+5V5+gLQ4tkKAF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11610
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

> > 	node {
> > =>		ports@0 {
> > 			port@0 { ... };
> > 			port@1 { ... };
> > 			...
> > 		};
> > =>		ports@1 {
> > 			...
> > 		};
> > 	};
> 
> There is no schema that supports this structure. The closest thing we 
> have is in-ports and out-ports in Coresight bindings.
> 
> In any case, it should be a separate patch, not buried in here.

Oops, my driver is using multi ports already.
it is handling like below

	+-- Board  -------------+
	|+--------+     +------+|
	||SoC  (A)|<--->|Codec1|| Sound Card0
	||        |     +------+|
	||     (B)|<-+          |
	|+--------+  |          |
	+------------|----------+
	+-- Expansion board ----+
	|            |  +------+|
	|            +->|Codec2|| Sound Card1
	|               +------+|
	+-----------------------+

Here (A) is handled by ports0, and (B) is handled by ports1,
and each ports has many port nodes.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
