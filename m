Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5377B96533E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 01:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134DD10E7A6;
	Thu, 29 Aug 2024 23:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="I7JuOUIg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DD210E7A6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 23:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZQtqvJ9Ibg13tn3VXtXuWEcbj/ABnZiXz0DStHFUlj9O0nY6ecBnXHmUqKqGV3O/6vj+K3onNbBvH/oEwgjSOI2dB3YcenLye7KkCeXBcZR/bRbxFfoS4zxwSIsLq6IBebzP9jgFPT9QNzMW9wwNefgmLKyzvyW6ERS7ugQBvjnQVn9CsaTQv2WZDATSt4h9MxhXeVb2pnLdG6ggWVMseQVMQuwdnepf6J7I4czvLOqTL0hCfVIP5pB1Pds1doxzOKrY1YTP6tsf7dN3YLaKsTjONjhE4Es3nVkcchUr1u0NQnuLM/jp1Jc5rHgSut0LEkzzCHUddFQa0TrI808jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jT6+dIGMeI7WXvRRzHwreTqnLmKE/fO1H+oOPP6yo/g=;
 b=pzigXBrcsDrlePZidzZbJ7EH4i8nvBqNS0FJNN+7l/xOmXUu4oF0eGU6I2ecgqxvIxqIf11C16C3OlLD5gMgNwLN3BCdmtaF+7r10M5Kb8Rod+ZFWGi2A6KZtF/4MXt+CfWla9WcRPMTBvb890gDznCzcWq1No9e0WlHBo/eEhAiHIFyb6gfR1ewyIdcA+zuGm7CvfNZn9NY9hH2Yn0oDwTZlMWromltf3pSXVZAk5hzbwD5erhRJn7YRIJ7Aqam/sBq5/Z5/sV2yY354Qm82PVY0BBv5AppcWvGhBTz06CeAltllu0m9H2Mc+/91bm/kvT7BdGH4TFb92QA4uQZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jT6+dIGMeI7WXvRRzHwreTqnLmKE/fO1H+oOPP6yo/g=;
 b=I7JuOUIg9S0tHMexNJHyzmjD/PYX0tfvFgsHon+KBs3g5a/ysaWTTVrVGzPFt4pnodEjhbWCrSBFhqltMwa+1nZ38vv98k89SnQLscogUHtpJ7odZCEZTvlg0M0SbU4BxW3bFQYMBELo6uowahAmkl87Lue16TZ/IiRgg3RZcU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8854.jpnprd01.prod.outlook.com
 (2603:1096:400:16a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 23:05:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 23:05:52 +0000
Message-ID: <87seunlyk0.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v4 9/9] media: xilinx-tpg: use new of_graph functions
In-Reply-To: <20240829145434.GA465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
 <87y14h1b9f.wl-kuninori.morimoto.gx@renesas.com>
 <20240829145434.GA465065-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 29 Aug 2024 23:05:51 +0000
X-ClientProxiedBy: TY1PR01CA0198.jpnprd01.prod.outlook.com (2603:1096:403::28)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 1722cfaf-3b0f-4a4c-316c-08dcc87f2109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o6NavSczrpE+nBv53N93UZjnI7CmZtawRfAKPeS53mDJeiZhsYLmQtkdE3ak?=
 =?us-ascii?Q?XomE7ZA9e0ossZxr55wXlqN2iWV3WNjoTv1IO06aqhzpxXC/FPPzCdurly+J?=
 =?us-ascii?Q?12lnlTMPFRoj2WNfXce+c0bEWmQl6oOjeYGPotrjQPop7ptKVOn0M/qf6R4t?=
 =?us-ascii?Q?rqBklhjwyGht6F18uth3+uhWQnTaVYeIGkzq0L/0VeQKCsB3hZDbsP/tJnYn?=
 =?us-ascii?Q?uYXCvpQOSe7wwU3jHPeFCSf1FdECeasbYmWtuNTm8z9azF6d5wnI5h88I1Nj?=
 =?us-ascii?Q?Q16XZzFIhA2AUnvhX0n8X+17zNsvuAEt3s+wmATDBtjPt/DnoarOGv6krMSA?=
 =?us-ascii?Q?kMN9JZS7Sv/GaxbP4Hn+uRZPTvsgCEzfOv5FZz1aYFEWoGSTx0oe6fBRCi3K?=
 =?us-ascii?Q?bF42Suly/JMiD6BUN3dIcNYlrUFqj/tK/zzeQtJ6Hjz4uMfnVr8p3B9w+Ubo?=
 =?us-ascii?Q?bhUz4vyL5329Vb4suVG8jq5FtOGtf6ahO/JLuex7dR3ICpQRe9mi8tY4kXCP?=
 =?us-ascii?Q?VpdO/t9o4Cqmph8jYN2ogObXAmO1Cte5rXYJA+5mrThHvfMX2EUlz/LNNxm9?=
 =?us-ascii?Q?ncvJGHWrUUdYcg6Y9Ad7Ab08lrOkKDjE7UDOfeNuJqtWmpRErqfzZJGLgmbm?=
 =?us-ascii?Q?UnE3StLV3IGXRu19tTF31p+U0/ETRdaX9sT558Q6ln/hXy796zawbpJMSm+g?=
 =?us-ascii?Q?3l5gfT8kmDBu+1X5ha9yfU5GMdQ5itNiHw+4tTbA9cUs6i7xlOxql2G7y6GO?=
 =?us-ascii?Q?VJ6cYkOWym3HuZgjxCYsekkHxhTfqfRgsNpW60BMy2VIK4yagT+X73bS6T6I?=
 =?us-ascii?Q?lEZ0bdDuyb9pCSx1eSqDbMohFK39789Zufw+lNheGMVqY3LylXw6GJeZM8Yl?=
 =?us-ascii?Q?wrnZhq4oHIknjyvvCzCCTkICHWF0S963o/oFFIR4YIrOuNQTV5x9EPgJGy/l?=
 =?us-ascii?Q?rlvnh6Pidw8/X6rnjygBLQikiKURZfJzAEfbfFE0NAIiVbS8HKlVk7mkLVC+?=
 =?us-ascii?Q?CLcNEzq6gmB2Bfs20r23/+7iih1kOswcf1/UtqZosim+HScI0+tgheuC6kM/?=
 =?us-ascii?Q?Q1fhXqVWQKaCSglqQEvYXCEToHsfTU08CNmubVC48mx36dmhgt/k8cz17Xya?=
 =?us-ascii?Q?8SAi0+z0vXoC4H7nl9A3iNxZ8wryHJOh50f0R86sq4wa68UqyQPHjjqR/f4R?=
 =?us-ascii?Q?8a8X5RBPUu6wF0IAjLpFQdcu4L+QC2Yn8RC+0PnwijcIMAz8874+xTBOF6QK?=
 =?us-ascii?Q?H+xLTEmX3Tc3qBLvQUoY13MSkjvgdnwTrENeSS9z9prvjftgG4wW8a0RcmZK?=
 =?us-ascii?Q?wKZmwOe1JIuiGZBisYx0VmiV4SBYNgFTg+QsnK6rFk0xOtFglv6Mj8DWNF5q?=
 =?us-ascii?Q?Y3bAATVaAKPew8gOU+2RvSrPFNk4L8CYakgSL4GbIuLW8/aSzA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/zfhFt4wvFi7KRsVDvAFixiRoOi4p0TL47RJjJiOAzdNUm/zRWrFuM+Dag8k?=
 =?us-ascii?Q?wLftlTXb/3YZP77h+/cH5adMBSFWT1XnqWd95MNR3QLcxHDkTwr5mIjAgz2E?=
 =?us-ascii?Q?izWjkYrWUiiVHw+RARaymjF/qmdYTAoh9G4NyT7PgfHYUDxvxuE0107g0z4O?=
 =?us-ascii?Q?jOSg7QBgaP6b4klvU02EZyh+ggX42myGu7XDj/+uA551Nt+GH4neDuPW01Aa?=
 =?us-ascii?Q?cz192bYgnYGXLjteII2IsKN2UuYmvotHlVLVAlYzAjnki34deANPuutW+oCM?=
 =?us-ascii?Q?IVKC1LbYA2OY+QbtIn7whaPMm7jesFqkvmJ7B+yVfrMRWbhQV3omE8SUi/vW?=
 =?us-ascii?Q?9TU8D4Iw0A4AXzJZfXjwfUSwKZAsn+dAa37shhXSe00B1g/8TZdbaupxXppn?=
 =?us-ascii?Q?wakIGj4HrsPXmeGJSTFqPzkINBbx0FpFMNO7+hhHMhLbEbA64RmJZAoy1yfi?=
 =?us-ascii?Q?JF5t+4/hoo3FvXqN0nQlSXff1SNlCnGWojTNg7XQza4H7N9iHuUL2NsU0yEH?=
 =?us-ascii?Q?LUUBaD0oMrRjO5G3rQLFc4khvqNbuPXHA+Ig1nrMvlaghZkFPIGmLjaqrFqp?=
 =?us-ascii?Q?tA5nn55h3QQUYeOTUBZ4mgjw2C0m217KQla1afb2hmj+NGfg6PEmIf6El0jm?=
 =?us-ascii?Q?a0i6IbRLbLpwkuwm9LTJicIvfMwwmfG6VqkLo8b3MM6uoZPwgJNBz6moFsv2?=
 =?us-ascii?Q?MSSU0Hbe+htnFeFt+HLLaWvFtvV/bj7Z31dq1wzb/O2+rykcaedbSfLZEkd8?=
 =?us-ascii?Q?n09wYWSJ+hTpmOOUE5UFPARcNK1F7/tlpCkVRggUkkz207ZxbOMX4xsQu7va?=
 =?us-ascii?Q?MTMPVZ80qDPg0aIhHZfql1zcyh2x+MJ45cIv/XDO3jOA4M70x5lGXqjaiyTx?=
 =?us-ascii?Q?6LdjMfWNpUDSCMWk8+u1nJKnGy3MW3el3Rcu1JMNYm9iJCQEvg65U1j9LH9W?=
 =?us-ascii?Q?QJmE18tE4gPbb9naVWl110Dl2DSXOg01WgLk/SoewLRqtiDYJgcuIdy3dW45?=
 =?us-ascii?Q?VGA5INrJ5FuK5wxEyyuKrXRaQfvU8q8UEUV1bnkAMi/sPGUbzEZ5gPUmDLUV?=
 =?us-ascii?Q?KA3xjACY7HUf4zOm9IHvKZgdf3GuKw0bntL7CZhQ/n4+JDZ4JoYGmTrAiQAY?=
 =?us-ascii?Q?N8KRlB5zXOoTWQgWd/DvXJcNyMO2+ILJkC4QD0FCfcjaYacz8YcE/2ZV3+2c?=
 =?us-ascii?Q?FeeexMpfmRXMp66f/S7raSPHkeEvkLfNef84eWLaEM8KGOHQgE8YYEbY5+8D?=
 =?us-ascii?Q?JDqNTEobgLj9AXWS3uEAjBSfK1QhmwKss6/LgPjOmnvGL7KQFmaIa4hYmCqf?=
 =?us-ascii?Q?lueIg2VEQ+cVuB7oB0zRIFe5owHktsOSoFsiWFEzpPxnsMkN3APZypxWbYj2?=
 =?us-ascii?Q?2uMISgz/LkTVU0Vjw69Ys8DDWuk5iMlD8334qNIHqYybJs7bfiLrzCy3eIWR?=
 =?us-ascii?Q?Q8zGK815catD1fnGTSUnl5Vxoc7LYxUr02C1tr7fN0gl/My5nHli+NwVqy0R?=
 =?us-ascii?Q?rqoLrccGB3odCfieA2RAl3Af4ajWk9mWkkPirYcl8WKK7iut06bQSkvjtPvB?=
 =?us-ascii?Q?TCy5hiKzi1aqUqvPCp+yfo1JR/ETa5baUfHDGHwgwvoSWTY/ECcPNP4nfCQd?=
 =?us-ascii?Q?xUFtz656jx9Ru+2OEMeLuhQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1722cfaf-3b0f-4a4c-316c-08dcc87f2109
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 23:05:52.1205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /454zw0xDYpz4bPJ8RZCGhEXRPR+VUNdjCTDpTgULu/Dz+mAnPzaJyxGjCQ7wyzwSmCZYDGdihIo3GwREvazLXX2CYboFyFDIuUJwvg4d/1Za8OJaobbPNssppIYwpcJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8854
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

Thank you for your review

> > index e05e528ffc6f7..a25f216b2513c 100644
> > --- a/drivers/media/platform/xilinx/xilinx-tpg.c
> > +++ b/drivers/media/platform/xilinx/xilinx-tpg.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/xilinx-v4l2-controls.h>
> >  
> > @@ -744,7 +745,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
> >  		}
> >  
> 
> This function is looping over port nodes, why don't you make it use 
> for_each_of_graph_port()?

Yes, indeed.
Will fix in v5

Thank you for your help !!

Best regards
---
Kuninori Morimoto
