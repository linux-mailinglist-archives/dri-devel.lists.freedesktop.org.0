Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82FDB1D800
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 14:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5672F10E831;
	Thu,  7 Aug 2025 12:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ELA5XJJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25CC10E82F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 12:34:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sdl518v18rsU6Ub3dR698yWM0AVF2ayg5YDtEMN0yvIu2TK986widDBgmgg6zP5t3zUY+YH5oeMn/wOlLCwNM07AID+y5HcVhLcQ+lj3VE21uZDz+HBSlJ9jWzv/FxvWUVCqZ6XT8CmAWgOTsauZWz9CjuTbTq/uU3aUeI+li2HD3vB4qZclsR8d4lRbfS1wZcdYMNp5ZaIqO5RpyPHZbfO2gXm6NlD5hDhCegQ0PpoFlF8chOJ8v+t8sOqgsBSQGCf0hGozQbpSu3SZ2OmDVTdVn+01OOjcnaZsE6x0vP2xW3tWDZrYVoKNaA2PKXYVCC87HOzd79pMD/8cZ5C6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDoyLzxS9oJVAUl2uO5ZbhuLoHX3BSA8UmqC/1RCNsE=;
 b=dvQOqY+7tksjREkfk9pErBNizQkpIuaJqMNBi/QPimkKMGnt3ckqjH7IjsnhRCZ6so2WesSfnNNGbT5kRByzsrOXW8xbFux8xWMmrUeg5HRv+4SN4BJNX9u0reoIhgFW25ZaTvtrBD/5KlvcAHHBmgm+gff460GTHbTFwseo+4o4Ba15h9oUVsGUwqbbx/9OmTu2l9DDUsIRMdSWJU6V/JUhDQulJwYMX2NsdvAsSH3eXl/dEdKXrez8VJnf1fz8eInJePhAbmYndAqGSyubCEc3tmLU/8yV+sVWG4zJc8vuQx7jMk6LKKgTUbs/ILu8vTCgLkTRNLCFBAQla6t9Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDoyLzxS9oJVAUl2uO5ZbhuLoHX3BSA8UmqC/1RCNsE=;
 b=ELA5XJJrhhUXZ2mZTcq1t4qcsUfxL0tLfaHGHZO7SRQmzD9DCe81ikaPVs3aTL7Odq/CRqR1ZG4JFq7aomLADjxl5wbB0Jt4Its56REhDGALRxASNvnFdwPHH26xY5OCWFFhbq6ujZTeE6mr7byy/UCDD/LdJZWrHW7/VwD1HT/8q2Gu9dv33LJg65b8eNdXj05u7o+Xvy/H5R7M2wa5eD5HtKPxQ4dPlO+O1U7f5RbsDb+4yNfBY1nrX+JKKZBXjgCnFTV877DtgjtXxHFBhUWrg/YwyC5ISBKS7Jg50gEQpwk7rFTBx0c9TxkWfH+xjFT9g6Vuc+WErrt4R+F6pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by AS8PR04MB8246.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 12:34:30 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:34:30 +0000
Date: Thu, 7 Aug 2025 15:34:26 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Marek Vasut <marex@denx.de>, Frank Li <frank.li@nxp.com>,
 linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/9] Add support for i.MX94 DCIF
Message-ID: <y6tzqobvposn2xu2kuhvosixzavjdnuukkpc5wktqsnzu2j2b5@g4msjnuj3l5s>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
 <20250807-psychedelic-vulture-of-valor-d743cc@kuoka>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807-psychedelic-vulture-of-valor-d743cc@kuoka>
X-ClientProxiedBy: FR4P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::9) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|AS8PR04MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 08cea3bc-5ff4-4668-996e-08ddd5aec17c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QJR7IUpGIb3qMFCSSw8OrW493Uy6x2JyWXGJw3COpgWFPVVkenm38PEG8que?=
 =?us-ascii?Q?88S+kdwsOslEG6wFsCGvzbrlfcfkW/vJt9it/RyZLmORKPkBNBioqBYA0ZGH?=
 =?us-ascii?Q?wz8Jb02YtsfiVcPZDtDjNe4/gS+b62LPeIHtu2EP+TZzPcefS0MWvyPCwfQ+?=
 =?us-ascii?Q?k6vsWoJNQ+cQDZtxEgixZR7zmtYxBiZvYZvJHl/XALf8EpENEmu2emqXoZgy?=
 =?us-ascii?Q?O86cQO8SGjTPWcSNYnH0VCBjNrQGGaH9dp6pA4rvlwz+cu8NEBrndSnWBPOQ?=
 =?us-ascii?Q?3IEjhLnLB6avyXWjZ9pHSWRc0MtoeNPvRXqFh2CgH6HB413Bm0piMZzYebPa?=
 =?us-ascii?Q?YQXpHDe8V36F6FH++jLcqvd5NrjR9d35KUEJrnhuacBJhqQZPPACAWYYYqi1?=
 =?us-ascii?Q?dxruQI+o+Fix50ccA/q8Dirz17liS+VdLpQ3fiBOV2OvhK3S5QFL4yAsP2Xg?=
 =?us-ascii?Q?Vw+LrKueBR341KdruMyYvN6zHCYLaWZxQhsO4Px6aIn3Kr0v6ZSdz3ckWnAa?=
 =?us-ascii?Q?Z9KCOVfZeZf2gkwDDDiiGXSbx0QqFLTWe3YMBJmOQPApnwbA3Uu/MdfYgD8F?=
 =?us-ascii?Q?HS/0VIjIMI6H21K6znzUoYBRwua+Ad+BmIkGAmHziO9ib60Zh2AITPlKGIoE?=
 =?us-ascii?Q?BDs/JboXrJcncy+pvmpj4PD0zjhdmr5xxxwwAi5h4L03uEKId2OKH796tFaz?=
 =?us-ascii?Q?Lw+h4qzhdwzHi1AngIDF6S6TZgx2+qbgOx/3TmxKyQj5qbgUkHY1ydNkphzB?=
 =?us-ascii?Q?v2E0bsmuz1ut8AJiBFNEkNE/j0RSqF/AA8l/E7gjQWD/4DizKVC35iffY6/X?=
 =?us-ascii?Q?tMDFqOOwP8Kykm3qavwl5qXpR0ZheUgImn6mG7kExggUwnT/Myum9PyoxbyH?=
 =?us-ascii?Q?1L4rqfurLr2wTHQGztHoUGfmyTYERwfFdboqVAsffvgozaWxJKy8naMCEO0f?=
 =?us-ascii?Q?Qpfm6NR6virxhHahFNDUq6lvTuXez/HAycBWJSgDANduAnn76PpV7IgAIEWu?=
 =?us-ascii?Q?eP7E5MDsJ4/mWU9g/dSm0yfisJoVQ7+XJ43iTJdZX8EzqF7boeoqKexR2qh/?=
 =?us-ascii?Q?ZKYjhHRPzuOGpffEOrD/HltjKk0iuvd9hCxgfoYlxq9mUw+KmymDgpXhaEL7?=
 =?us-ascii?Q?S723fLqB7Wqs3OhSxBHaDHxPs1y7IWcCh/XmvBy02pMEpXiUB2QgMqEyHBI7?=
 =?us-ascii?Q?3E6Is43PdiYA9P0YRyXYbRijKDEYC7hlTBy1uyiVh2JnhVJfJfy8VaO1qstU?=
 =?us-ascii?Q?eO1viaafqgO5AOeswPTMDe02VLYHPI96qm8RH0xdpIoyOCJZh/7+SPxsPgqF?=
 =?us-ascii?Q?Rb6qdsA3p6tdP8tkAGEz2E3CMuVuMJeVxL/yt2UP9pugiDRexk3bpmcpf3qQ?=
 =?us-ascii?Q?S+42GfcTlq+MqXF/JD8F+G4i+0btJTJVlyKjkI7AtEySnf139UIT3ZncxjSz?=
 =?us-ascii?Q?uv1bnY+cWiM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sPK628aTsZbmaAHVHtjHzPTkbEXBpF0DEYH48om12QaspBZgHG8C/A1YmcL9?=
 =?us-ascii?Q?6L2sqFyTop0q8IcYYJE99TPelHoz4bfyUjNbOprNVnKuU7pxG/D9LikjpYjY?=
 =?us-ascii?Q?2m58/ocNUDX+5PCuWUJgprGxQ3YwhEWVNZ+V2UkqBR433ccwHNi8QpXCNjuq?=
 =?us-ascii?Q?9M2hshrpMtRFUTBFCyWPrbkyV4JJvNpo5P72QYAznZFNQueq2HXZ6Eq6gJ5n?=
 =?us-ascii?Q?rNfa9R/QWaXdK5iBl4b6FWL7LFX8mgZbe4SDchszETCLXnOV46Y7K6RVDeny?=
 =?us-ascii?Q?2LLGAxvzvsQjhdEoAPzoAwu8d16Jt1Bme/qv2baCwmYnZFYpQKKVCMDDLtWL?=
 =?us-ascii?Q?zEoeCdrUPiaDb0Wx8LKpzTCDwYTexplhSAf0rAnfQ+Wq5tqQe1rBuxh4YzJ9?=
 =?us-ascii?Q?4X8vvXdJyuTcbzhkpIb6S0Rc6gEXLYKpceiTa/tVHGF8VERep1WVKcVW5QSj?=
 =?us-ascii?Q?u1j6N+RCEjKt0Cp83ASmGqYbf0YrafPlXDpArUkpRO3AnaljI0JryDSQ9Qfj?=
 =?us-ascii?Q?Z6hn6KWB/wOyQTFEN3bYzy0a+QON7F/7u7p7W1tYdxgpcnvtZQ7W0XSHsxMr?=
 =?us-ascii?Q?65PJigGQVp9tKJBmlLtR3dC8iW4eZuZwQe5h//HKe7aHvMl1G8A07bbSZ8Ep?=
 =?us-ascii?Q?qnrz8/ZqA09cr8kXBHAejmd1lvmeKJ7xn56C3d13HgH18B/XcE7iGIoeW4pw?=
 =?us-ascii?Q?O8jRiEkIFtzT6ipDqSR2I2yh4DsscFTPrblN7EfPgJXesuaKFb65KlroSMiH?=
 =?us-ascii?Q?pEqNAukBOkzL+Bb68XiBQMbXRqBbRpe/+N2LY19iKYCZjqmw9wV/0ldpsyjD?=
 =?us-ascii?Q?fHfFkEFCiPUVM/Aaevo7tOMdhrgPHo95EYN+7aFTcKTsRtuxLXMqjseqrld5?=
 =?us-ascii?Q?E4pndtJ59jdYHQBc+rrt+tBShwlP1Ksg3SWzYZPMNDafxNMqFoqpKlxA0Eab?=
 =?us-ascii?Q?ipCV2hrQTv2LJNPFgOG5KvX3FoVnr2JrANBpBzkVq8xIEczEqOVJ059NyzaS?=
 =?us-ascii?Q?sAblO+0XF/B1Nry3g1bgm2Bh28Pzgygmms5hQYSoerHxuKIpc5duvmqNVhzZ?=
 =?us-ascii?Q?w2RTO9O9TtsC3NXZ70Gs2M38vOC7qRtjeG/peUkAKX17IzqPRbwFzmMyXHfq?=
 =?us-ascii?Q?NypZeMpF9oAn8ONSZrfMcZgmUIrrTqxftO/xB4ZM/IZZSR3zJ3I6Bnvh+4oT?=
 =?us-ascii?Q?7sSacIeMPL6V1m3oaYDBxx7LuIUXFLmqIssd00KlgIDTkaxv/M2YObY2Q/Zo?=
 =?us-ascii?Q?vLriIOGEToCd8cbjhIlWkhL476C79Sy6t6Ofq9B0/yQCLQ5PYGUUwTO9jDde?=
 =?us-ascii?Q?fNttUaRts0ZesvxouKWalRMK0i6Q4kW3Sx0reQ1/qltGWP+MYsV83XWAeMu8?=
 =?us-ascii?Q?rXTK21JOoGDQ0lHZQrv1ImSiapplmviMNMvSygX9WIcYKUazfzDUN2kV+vgD?=
 =?us-ascii?Q?IHOSOFTwlHJcU/L6Ln8SmI8FU+lHkgl7wmrQqasu15QQmDO990clmfJap+Dh?=
 =?us-ascii?Q?I+dETyIsdNHyb5F8k4Yeeo1RnOni2Y7Fluu7CBhWOCGBI/QGCqG6I6Pc1inA?=
 =?us-ascii?Q?TmwE8PsP+uad9FXqNvnvDB/SQvWv6s4c4JTVF4ZVwlfzeCfEZevtWrloZ+vd?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cea3bc-5ff4-4668-996e-08ddd5aec17c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 12:34:30.5929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fStlwAUgwOz8V9QVI6DIYdoj8FgA9TvajaP3/zn58rtXg5Ouofn50E8ceeEDyPrhjyUgAg7fvsrZklkdG/ou6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8246
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

On Thu, Aug 07, 2025 at 09:26:55AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 06, 2025 at 06:05:07PM +0300, Laurentiu Palcu wrote:
> > Hi,
> > 
> > This patch-set adds support for the i.MX94 Display Control Interface.
> > It depends on Peng Fan's DTS patch [1] that was not yet merged. Also, it
> > needs the BLK CTL changes [2] that I spinned off from v2 in a different
> > patchset.
> > 
> > Also, included in the patch-set are a few extra patches that the DCIF
> > driver depends on for functioning properly:
> >  * 1/9 - 3/9 : add support for i.MX94 to fsl-ldb driver. It also
> > 			   contains a patch (2/9) from Liu Ying that was already reviewed
> > 			   and was part of another patch-set ([3]), but was never merged;
> > 
> > v3:
> >  * Removed the BLK CTL patches and created a separate patch set [2] for them;
> >  * Collected r-b tags for 1/9, 2/9, 3/9 and 9/9;
> >  * Removed the DCIF QoS functionality until I find a better way to
> >    implement it through syscon. QoS functionality will be added in
> >    subsequent patches. Also, used devm_clk_bulk_get_all() and used
> >    dev_err_probe() as suggested;
> >  * Addressed Frank's and Krzysztof's comments on the DCIF bindings;
> 
> What exactly changed?
I removed the redundant text in the description of interrupts, to make
the text fit on the same line with "description:" and, also, removed the
description items for clocks as they're pretty much explained by the
clock-names.

> I cannot find v2 of one of the patches, no lore links here, so with
> incomplete changelog I say you make it difficult for me to review it.
I'm sorry about that. :/ I am aware that removing or adding patches to
the set will most likely mess up with various tools... However, I stated
in the last line of the v3 changelog that 6/9 was new: "Added a new
binding patch, 6/9, for adding 'ldb' optional property to
nxp,imx95-blk-ctl.yaml".

Thanks,
Laurentiu

> 
> Best regards,
> Krzysztof
> 
