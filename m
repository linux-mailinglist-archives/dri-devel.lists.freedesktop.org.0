Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D7B965391
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 01:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDD610E7B0;
	Thu, 29 Aug 2024 23:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="ae+K1cTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF0910E7B0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 23:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AN2B70IpbvNsWmCPbywG+O8cu3D9M/yocNZ48LHX023p9pL35ub6hkojUV+sSrp615rNCi4l9O0YJsMsEblgLexplPPQUf2K8H1TkAEAyiiEVv2pSxhCQUrF43sHkVkqeurye/t4KuZ1mgxdSNnL0i+C9exjd2J1cAIt0JCrv4T5e/Vw5BzArjrAHNYAP45/55o/BMZnmpz+o8+uN4quq73e4lMCDB1cdRIuYK2L8fjJUeDmA3mhDKPwM8g3Na5mbLRvdR/I7vQZ1aRTZdACgr8m+E24Nk27kKqND6R5yHIMfEN4XgrW80M1HPClSVXA81EoM8GlniMJx/2IpN5nWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QW4P9wkh91521aRD9GnsvxnLi5l1hHThsUiC2zwJ6ys=;
 b=hUCQpCHuDKB4Wruz+BTBcgPo8BSiqdz2CZaf741OlZbw4bO2Il0C7Vo2Yfy0v2ZVv1gv0U9LuCWBgm2txqcWEecbB1adZh6bWgEBIR+hoeV9KBaB58kx0bVhO3ASbYrEjNjeSEy3yXoFWvTBOkqbVtE9WUxVBo/xat6P6+wue6NPNgebMHU3TyQL7hsiWum58JOU9JFvomBarpr775FBlG95gtvfp8koSnjHlTwl1F1op7P8+aibHKGcsvhbaVcUqoqtSN9sxY3xhXSc9hXgvit1s30bnrIPOtMBLeOrbex4Nesmld2uI+ZmXOaL/N0OjmOwdrXS50AGeKoT/EZUyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QW4P9wkh91521aRD9GnsvxnLi5l1hHThsUiC2zwJ6ys=;
 b=ae+K1cTwHPNixWZ4AbfW4ucA0EGYMOhccHDWZDlqN7XDUlu9JtWNppLSkVXDpybmQMHdYUXB3oyhylPdmP1SdMJmLBKZ4nWgz093YzCJDbenL463ZOBJ7lhlP87Zi/JYdXCkk/jyIUTEVioA0baDVTLsyfAR8oze/urV9p6R8j4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6766.jpnprd01.prod.outlook.com
 (2603:1096:604:131::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 23:41:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 23:41:33 +0000
Message-ID: <87le0enbgz.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <20240829155014.GE465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
 <87a5gx2pva.wl-kuninori.morimoto.gx@renesas.com>
 <20240829155014.GE465065-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 29 Aug 2024 23:41:32 +0000
X-ClientProxiedBy: TYAPR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 65391cdf-d375-4d8f-9dd6-08dcc8841d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XCrGjCzeLb9dAfR86W6ArRxET+bNOpKDAH771ZgulquA9v4dAxXSVD3wvCIk?=
 =?us-ascii?Q?TDa3IRoTg/N0lua3asS6wax9yTJIAvCgnmTTX1fg7LM88ecuYOpFUEeCu3Tr?=
 =?us-ascii?Q?Z7LbgeG8MuYblxEiiAXG9pobm2xhKAPX173YsPAendCa1nYHDHzj9JYcydDb?=
 =?us-ascii?Q?jFrl5k0KT9v44cMb5w+SouxGT8qStemvekVS3ttr5Q8Kovg0gHuEeAUNTp0o?=
 =?us-ascii?Q?tXTen2j4rzODb4PrJ0mgN1jigTb6tBsSiz3B58Pr15lfGRGnzjT4F+QoqvL+?=
 =?us-ascii?Q?qVgdlzwWfrAZOB65n25ccdy8KWoXOUiEdpV42ZwyM1igTCrRndkBHA16Uzrk?=
 =?us-ascii?Q?/hS1lzQi+Fw/Tkbd92lOIUDS9parCoDkKBPDEsV6iyidsdWj9UpZxwlQ4cS8?=
 =?us-ascii?Q?22KTmWpuso4hZXFCDnDRxdMybeOguXXztFwXmjUMmlOEXYdpWQqMCfaZEk1T?=
 =?us-ascii?Q?N2MNhf+LnLjeC8CmY1HQad9TrOWYDMogzvO762sU/r1huQOCep7G9GDAECrR?=
 =?us-ascii?Q?0C0AkvKXCxvWTHq7PR7qwPVPbvf0xc52d+lYTKDHwyMy7nzYvFx3r8QfXeiq?=
 =?us-ascii?Q?DL5kiesGQmPY4py7+bb9/Y/1snG3RbVuLrubmkV996SLHWpe56l+Hp4+S8QS?=
 =?us-ascii?Q?ga8U3rwfYlBe6+Qgqw2eCgBlLRHatGIwpDDpM/sDYDPSF2pe7u7EHEbk3O2J?=
 =?us-ascii?Q?9vJ+jgjjmeAFGrlQ3CvFKyCu9n3cJRdbIqQ4JuVJz3v44euv4RENC7I1Ptlc?=
 =?us-ascii?Q?Ee1e6zDy0HmYn4OelqNbQIy5bWFxniUZBpq5yh1yG/cZ227mjitCi1J8XmLX?=
 =?us-ascii?Q?jKqiFXt3/ZIU6XSqu2KBzuoGjUH202nM0I8J/S9jKmBl0QhvmmzXEraXyh0m?=
 =?us-ascii?Q?JnDvmHTmIQx5omR/ONdZgbzk2EAWKOkHPnynXEoksbbN0Ghxmi9pINGZZFuo?=
 =?us-ascii?Q?w+gGCxwQ08YflYegSjhoWumVEFjmzHyH6dl9H5iQMt+is78wG5E5cZAkn7BY?=
 =?us-ascii?Q?7xqgmReCbdjwakoAo315wHjo2ByqzXmeEpH/i2V4LRvQKsWomga0CdlIunZX?=
 =?us-ascii?Q?09yR6tS/Iihp5wELhYnolSbJgoKT/12va42yX6NeyaKJJEHwflpn5U7by0Aj?=
 =?us-ascii?Q?ljKOo7uWgwH2qWmLCMSTmFOAJGUB31KbJwtcOHNxK2qAHm64KYvFgahOpsWo?=
 =?us-ascii?Q?e1TSg966JZaSMffg+QNMSO4OTmuWZc5TbXN4QRQOtzBCy741qGJExZKhhRye?=
 =?us-ascii?Q?0EXEGghx55aMgEphTLTzbZP24kH5UhCUS/0nBf6uxDLk0d9bhWd9krwPKpBq?=
 =?us-ascii?Q?k3IHOteN9OHW0MAZEPA5fBHStjhHBFBOW71g47b95wQNe7efbKTiRDYbYVKz?=
 =?us-ascii?Q?Zk08NN6NXQ2mJV7FJRj5ky2Whf4ZK2rRzPJERnBDb2VkEO9E5Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1CFU1XPtBnQ1ZsjI3kKrYFjPPluFhg1zCSmCFQm1e+2JkzdQ3jjHCxdGz5cm?=
 =?us-ascii?Q?056cHG/BGmznmSWXYwxvNwyLJalEjBO8im6Yx9BwmZOBjZyE+tqsAPgq95zU?=
 =?us-ascii?Q?mtxCC5VXzeuxxbDnd7KXInpOwBOCV932E6f8sCkWPQazG1BSsaP3znBF9Tzh?=
 =?us-ascii?Q?g7/t47iGFnpzbQb4zoHAo+O4lKEOBNKtvn2PDumKlA7d5bNfKf9y31nQJ3PO?=
 =?us-ascii?Q?VkS4+W7NhqC7YrhCfI8TO8//pFctiU5FitfEQwhd0Vz0X7lZ2zPoDRESiA1n?=
 =?us-ascii?Q?dkykqLJBcV1aaY9idanGJkcNfwsTeTSktIcND32RWKb2UrXONteiEE0dn8JT?=
 =?us-ascii?Q?j/hQHaazbctOPyNoSwOHf+lcWeglCMTK/tZsIwftnv+D4PkKCFNNO3OJ4yr0?=
 =?us-ascii?Q?skvAMYGO8b3BX9rv9+/mGIoCEcemeBzFvhbBWYqZ2sq4bkkCNEwXcj5OQIDL?=
 =?us-ascii?Q?16DSCZzA9O/ZZQPAx251sD/m3CTL0FLmFVPQB8u/g366SS+p4tUcWwg6mZI9?=
 =?us-ascii?Q?lOKVO/Nm4MCNXlEtF1A7P/2eKUMRn0PU8XP7i3biXUXCTXLUxYubeuh/wjVb?=
 =?us-ascii?Q?MyZA5wm24l7Y4VUODsoaCN4BJz3ujuZpstf6eZvEgueBc4WjUC08x1OEeQ5R?=
 =?us-ascii?Q?b54/ceKhQEhMwSABEicY7t6+skjzw79Uu8O6Z4THdYNOeulFMwPPhLCMbtw0?=
 =?us-ascii?Q?2jIkGHzy2gSswssVRoL+0CKfmT0yqkEAPfJlQWucKn/n1lgpVLifl71uaADj?=
 =?us-ascii?Q?Yb+pZ9wmkHHxeBj2rbqTBuCnx4Sd4Y+oO8pTncc2mVrf2zXg3tYnLIWKdWqg?=
 =?us-ascii?Q?ZC3B2OjVpBxOzebtoeHo/pkm0sz3JRubF8vQpVBc/XBggJjHnJezvwRWwAGA?=
 =?us-ascii?Q?MM4+TRSi+v6Sd8p8W68PG8GFSX9hi27DXKRRh4BLiOb5NV7U8HlCDnRi0bpL?=
 =?us-ascii?Q?GQJCvApsbq12eWciMGHTk2f6yxHFqZrA1gpIP1qZbt4PMcI0GWa3koUzizel?=
 =?us-ascii?Q?yJMwD3KV2IZI5WrBCjlQH0+5i/HFGekPpMRQwby9W7F7cjEGBt5DrtrJDAPk?=
 =?us-ascii?Q?N7o8wrfZsSqOQcCwWKeiLofumyeE+5fGveioWfWIozuS//5mpAdapo5TIsKU?=
 =?us-ascii?Q?oc2vSqnSfsvKtuM/qmi0emjSppc69SXPjEu/oEVKTFqi3KbnlRMcoZ4LZusu?=
 =?us-ascii?Q?Rza4d6nXrZeoCBOI8y68aDlk0BciA0LihFh/5P5AHZC+lPBDu71r80EwtBfU?=
 =?us-ascii?Q?v+mHu0IdYNdPg0Te+9JMJT7gEJnIXcgTpK6EutA/9s0+fRB4uAw7TrqMip+1?=
 =?us-ascii?Q?CSqdHilD6g39XG8aILn+kdpnLgIuSayZ8hPwgSiIyq5HomZ9CbaYh8gpIx5t?=
 =?us-ascii?Q?cvNE4yY+D2gKTHkJ+rznFzb0j/pjCxH0gYx1315Dz7PPPNOz0MDhJJVOraLo?=
 =?us-ascii?Q?mzVuX2DlgWVN3XZfmWDxMO6yyshIlMtoLMK2D/ANiCa7tAfXxn/++dQNIqyn?=
 =?us-ascii?Q?P3kcFFg3kqzHIAELKpNmSyjhiqa5upiLCV5ubd6pVHon7o788XVua4zL4XbZ?=
 =?us-ascii?Q?o5elhRWFqEImt8EYOSEZDxdyNZe54pYbC/pdTs85Zfk6V70ZidI13bldn2CP?=
 =?us-ascii?Q?ywdAltZLB2C9YWP7gkcIT9c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65391cdf-d375-4d8f-9dd6-08dcc8841d30
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 23:41:33.1595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IelrRFL90tVrP8kW1HTgaCbA4Ld8DBYAJnTV4slpOOE1XCpWEuYc6Cvd0HQ0jDqUtd8gqi8PGolb5KL/xApWHNLXRrRrDgfrM7DmH7VqMlw1JxA277JekRt2bJcdzxMI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6766
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

> > +EXPORT_SYMBOL(of_graph_get_next_port);
> 
> of_graph_is_present should be reimplemented using this function. So 
> should part of of_graph_get_next_endpoint().

I didn't notice about of_graph_is_present()... but unfortunately, we can't.
The biggest reason is "const".

This is because of_graph_get_next_ports() needs to use of_node_get() for
"parent", in case of if it doesn't have "ports" node ("parent" node will be
handled as "ports" node, in this case).
So, it can't use "const" for "parent", but above 2 functions are based on
"const". Thus we can't replace these by new helper functions.

	struct device_node *of_graph_get_next_ports(struct device_node *parent,
						    ...)
	{
		...
=>		prev = of_node_get(parent);
		...
	}

Or I can do it if we can remove "const" from there.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
