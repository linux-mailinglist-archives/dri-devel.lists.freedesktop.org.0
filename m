Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO52A7tRj2kRQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9A3138119
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787DF10E836;
	Fri, 13 Feb 2026 16:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XLV9WCDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C90B10E836
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfaYw/UuG8CQ1N/E15jJmGHwaaDDNyeDQ1K8sdyLUMnRhGzA2UvT3IviiyOZmIUAwwO1r+LnffwDvXQgtlY2Lhm5lh0x6IwbAp4D9DCCEjI0PDbrHuLU3e8JNGm+DoEYzbAhMN5sCLJnHReZ3ihbb1CJ6+ctNcKfkNmwX2AOBQpFz0yXODIJnPM+E3UrPJBfm53ivwAtrmEMQfXyXRB5m1S6E0e8086gef7qpr18CKHUqTy/TLw5cUeiDdtwQjzMehh7Xb/HIWBk5BNzqM52b0FAx38el66oggr61pMOa4j32zuRuy5J+VCOvClTewIwhhTQM7O5A2V0/W1oZmnalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JV0kN1/Cvv7rGzr7cHZ/Ol9pkrC9W8gmlsMAvggf9BQ=;
 b=nKpo4I4RkwwArPQcOvfA1jc2WakQkSyOKbU3DkzRfuTcbkWaIxzJvnbbJISTfyvG/BCJ/mTOadLb/gM438jV2vVNbed/RUN4f4D70+dR8aKTlL+nik4u5tw+R7HybEOhfQ9dAH1lcSh3/L55t8TK1UnBVml0JfOntQ+2AgMB9Jx/PuCkv+IZTeFJrzfz+kjt93lXaPUvuIWxkKNitXG0jJ73v6g5kdvp5fhuTGYVW7z/VQLNj65DRjg1m6eVdpjzsMj5gNRtFdR+AEUfHjQ8hs+aaTCuzinypyCHd4z93oI1neKQPadvmwg3hIbAgOldsZFYxBiX8X0AoTvKASivZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JV0kN1/Cvv7rGzr7cHZ/Ol9pkrC9W8gmlsMAvggf9BQ=;
 b=XLV9WCDZF/BmJDUXp0pJgUSOJ5O5uXYtCE7tYFyVYoeHQtHuYc1fZTbBUPiA6wnKrF0PjLPhNeOXu/KXXKNyFKS2qN+3gbrqTkEsBWpcKWfVyFtKCeYKEA0fFpVcWXRrK3xGpxG/33z2hW61xYHowGfbnAziXDzFhrKbisft3Ec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY3PR01MB12106.jpnprd01.prod.outlook.com (2603:1096:400:3d8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 16:30:44 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:30:44 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v5 18/20] arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
Date: Fri, 13 Feb 2026 17:27:44 +0100
Message-ID: <e6fe388f5a5f0aad17f23f6822e83b54f4cdb074.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY3PR01MB12106:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e4bcc2-7381-4a7b-7e71-08de6b1d3c71
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D01zd51d1aDXX0llUrP62tZEgbIB5aBHJFFsJtQIGmyEbb/8m14TL+PS62qP?=
 =?us-ascii?Q?VURAoL3OvtzaMOMH0JVwNF13da7G1HlJIxqTj3P3JQRgG4S5Sa78CX20njo7?=
 =?us-ascii?Q?CcmsoM3PGZZiZhFhz049+Bp6sxTAGl3GGCZ29eg9ff9O0Jy5tf4m5Ce8vRYb?=
 =?us-ascii?Q?S3owqsHPGyCn5SEqS2lafipWPnci1ev/3tq90NdAfDLXA4eG0YpdzlgRHaNK?=
 =?us-ascii?Q?gQePwJZ585kmiWSGi8CU7SOh0H89x/LtTv7pUtBaUqqWm8BHmoN7uSyIXvzW?=
 =?us-ascii?Q?+APAL7ixvE9wsldWWhYRYcO8dDMTbHKbMfqeFCvvClWkZO2T0v8rtfztmUGa?=
 =?us-ascii?Q?93h8daUkDqy+j6FWeW0bE54Rv+Q+Op6WUtIExy7PTmP7nm4PKuRtQYf1Y0/D?=
 =?us-ascii?Q?e+jk2wMliwgxc4vVmyz3fontmsoYlxB9ZQ97Mi9gQArvJDFaRwy8R2BrAw5c?=
 =?us-ascii?Q?nVa9xwnk7L6qHC+wj7X7xlpCytGLuZlcMD2HQLzWiLuvgFCfuBvKHdEJFLeh?=
 =?us-ascii?Q?9YYUrKepOWAY+5EpnVRqEy7fLGDXApGcNj5JcFm/8tT+siggyA7Fju4YT3QY?=
 =?us-ascii?Q?5IO+LLjcQeg7YYg5DtvWxlGJlbAE84EF0oX7IM13DOc8BBnItpdid1TdO1Tz?=
 =?us-ascii?Q?6gkqAOJyqfjJqsmr2S6Nq1SwfCJ7yRkZJvKeoIryZWaHWd+we54w+iJQImBD?=
 =?us-ascii?Q?naE6aBaaCveYin5AQfGe5M1sd/P0G1K6Q2HEVijh1cH9CQKyeBrJV5qVYHCi?=
 =?us-ascii?Q?kpNze5oAR3MLmfw2Pvo1gGtZD5WPEwLaaFFtbup7gg2mYzvh+wAIUuHiAYXh?=
 =?us-ascii?Q?nQv23Tll6FJJ0/02UabOXaBPOh0sC+yHd1TWfo1sTPHGKbXzPS030SEm8dEX?=
 =?us-ascii?Q?2rjuvQN/ny13OSEQf++/gp+j8HYpD1+qV3HX+xIKFYfo5HNZ84c9ra01pFdB?=
 =?us-ascii?Q?Dg2QaqWhVsE0/kBSs5qpsniB+u/ntL1nq738t/x2gYU+lrpI7X+4jE9Xxx4/?=
 =?us-ascii?Q?SKnJOrTK3X4LDHvS0cKXvZ8V5tJ0MUvQFaoxOXZ92+HBRwVSGLXaYjv+yow9?=
 =?us-ascii?Q?rCHuFyVO99H9UnAm00otC+d8Ry4ZojvoTJp63xcFhi1ibPCBJqzq2WytIngx?=
 =?us-ascii?Q?JVVU4P83Nv2Anu9UYU5p4kznAfNZDqIe+x149oxzstMH63fpFQs495bO0MVX?=
 =?us-ascii?Q?eM5OViMm4bipTg20LFgFNwCNQJkvDHv2vL4objqvjEGiRFXXT5cvGdRLFbNp?=
 =?us-ascii?Q?4vBpNdtT7yedC4aHCYJxUBnB+YywZ+1KcSg8kSnGs07UvI5RQFjV1zX3qjnb?=
 =?us-ascii?Q?awNuls7C6ADlkjmLGMgNBPsms9HwMSUosbryoRGjIHFn/TjbI9MFRzOyD+1J?=
 =?us-ascii?Q?RSyGxNpBq3HwUmKVkqiPRQAb96PYl17tUj5FDxXXucABLLfxSoqlPyOsbLaQ?=
 =?us-ascii?Q?HnxIT6WTs/GHbGxQyE65J1+W8s6WkSUAf8VCgMmXx637v2uyDYj5dJchH3xz?=
 =?us-ascii?Q?BP50xNhqtYU1jv76E0PkcoZC24cMMCNdXg3FPLtswfRNNWRtkjiy0a0o4vgC?=
 =?us-ascii?Q?tcFK7UZJ5codnqTviHaa/oRYu4h+Zq//0pyTLi4SXrOYPILUD97TIAkwBOGH?=
 =?us-ascii?Q?Snd9yT35OhK1foxdfvqEYGI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3THMZCBnOqYh9c8t0d+sHjaEUNEHbe1Eky60Khts/oLvAd0Y96YA0Vn+qhEY?=
 =?us-ascii?Q?KQYiYWCUIcWwSsC8Z/8blKCh29kef8C8PlSzel7gvaBFbYSzFDUfmwWqGNyQ?=
 =?us-ascii?Q?g+s9bM/11dePUItq8N+rAC2Ru8cdCJYrp2TjCA6KqlfHo0R9pi34wP4E9Hqf?=
 =?us-ascii?Q?k9pKoFR/6RmOy0+O9tgsbtVUk9b5oVXlxTNTWvH70Htdaoil4/DoWjYlwNEF?=
 =?us-ascii?Q?Yy3tEh+nq2/oMLZbDsrUfcLHXEbCo+W+T33uFCmaifAPScE06mL5OvN16Cvb?=
 =?us-ascii?Q?xvq+4xy8cEv64MnBZ6cvqU5JmDqePc0guRY5Y4rbrfUFlqPnnE2AKyHVP37V?=
 =?us-ascii?Q?iZY8aIuCQWN2aiR34Ug+9AIGtSoRm4kbrl8l27LaRWSVdvcpgGecJ1nOO8qV?=
 =?us-ascii?Q?XqzkgA/1HJIsBhhm0uW+3f788lL+d6wCXMHTTNoSYF0tDzCMNC6yZRc4UFoY?=
 =?us-ascii?Q?GxPPS0PvKbp12rOMdUBHm0SiQ8tedbbsJYzIDpnUtSiiFvBuuauZMYy5YBpJ?=
 =?us-ascii?Q?PkwVT05vOANaJEA8KLNNu2wdwkQvzV2GuiLlHCbYJqqwzjeC8GchPmobxuGR?=
 =?us-ascii?Q?tkzWYHTINaXzzFMvc0yt466aCQf2KFhLo7A3Tke9gETpn3+A3lLaHztcdR32?=
 =?us-ascii?Q?vLqz+0mTnEpdSokXyeykZKomY8m0gVB/70KYdn6euhf2MbD31Yk486KRq+k7?=
 =?us-ascii?Q?5b/ed6uFEvQxb8Keuvbnz99moqy21V2+DK+mFfmnsceNUYYvGsQnQXLmmlUx?=
 =?us-ascii?Q?z8gPnlba7z0YXILrAJoGXG3OkzpNuOesXE+PTQVGOWXGtn9MRkyYyJB2CRjW?=
 =?us-ascii?Q?+yvJrke2NzLYw6gtirQbNNEkgj15u/oKG6TrqHHcA4NN1clyGyXAXVGzd0yg?=
 =?us-ascii?Q?8jYjm6aq6USsqYyn0NZs6FMblFR6dgTqAb9a5vaaO4FLDlOMDgdRla9zCEj4?=
 =?us-ascii?Q?4HcJhGezaLpAq98iMHr/GPWPl4eK0VztfcBNKn58uJur28Ec6JQLZg7Fk7tk?=
 =?us-ascii?Q?+eELNiRuL7CWm7JjmOigzUAyHkNozcWbH+konEOxNwWLBAcgbyK77XnbkbKQ?=
 =?us-ascii?Q?MWAzx1RK5KqaVtbl+BUOeEvN9flJjv3ht0daIgvvijJaMR5VEQVQoUx9Av5F?=
 =?us-ascii?Q?WOLd5TNREQNQR29PUGZ+xZadFsEDUlvdw2a8Ma0g9N5QgQgm6lFyx6+7y3mL?=
 =?us-ascii?Q?CZ2sh/jcnb8VLIgdqBzqBZjNwqwPslj2qIMC7jpKLLGSPzHRVZhbuIS7Ong6?=
 =?us-ascii?Q?lTov3rCimrzlRZ+SwuYqrwMFJUJ10ulhOBD5mWiMfj8tAnCbrZH7r0QNgA3Q?=
 =?us-ascii?Q?Lpw8WZK5iVpwXf4jwdrtXZ58HZHicOUhkCP1o31ehqFNhkdjpSECWe3yBPD1?=
 =?us-ascii?Q?LyuchXkR1gK39/tJMUlt9MN7e7hh5FYCxqXOmkGior5s0eFFzr1cXGMy7U3j?=
 =?us-ascii?Q?rCEsAYTxW7ycJ8RIESnhdwFH6P3ajSuwfNZmNyhwptWpRj4orq1zrrHEOAI3?=
 =?us-ascii?Q?XUF8OXVH1CpRxjWkaO/IFyLNDrZoWNi8+RqEQP9mDKweS5D7Mqv9M6hZN9Eo?=
 =?us-ascii?Q?IBZL9Hwsb9DQkObKsuzHKC0TIWfdC3L0qQQBH3aF/Ys/1frAgYYFPurgd1Yg?=
 =?us-ascii?Q?hBcqRHC4zfaFq+A7HDaY7F+G/qbnOYQWaULAJnR+PctyxHiaZYJWWFzPmQiz?=
 =?us-ascii?Q?PYZRmclkhwPYz7iieNVKLbnMLhrqxEGpu/FAGrR/8lzN3E8/PRf0fI+TbYps?=
 =?us-ascii?Q?/fxr44stvu4xXbZEALOtKN5wBWdBzWQ8JY0AXNnu3WIH3YRTfZ4V?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e4bcc2-7381-4a7b-7e71-08de6b1d3c71
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:30:44.8470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gI4dGxVH2q83JoH2XhuxCKZgU8xkynEmg2qj8GdeEDAwVvTyU8OC9e+FYWB+iPSlaHqB1OCtH8Mmtf4/CC+IILmkQOU8tn5oGsYjPHyeqwdbVy1EgUW7NvsAVgvlfQtP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12106
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,glider.be:email,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,164b0000:email,0.251.119.0:email]
X-Rspamd-Queue-Id: 6B9A3138119
X-Rspamd-Action: no action

Add vspd{0,1} nodes to RZ/G3E SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Squashed vspd0 and vspd1 patches into a single patch.
 - Collected tags.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index c90a778250d6..d4db44b6ccf7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1455,6 +1455,34 @@ fcpvd1: fcp@164a0000 {
 			resets = <&cpg 0x11e>;
 			power-domains = <&cpg>;
 		};
+
+		vspd0: vsp@16480000 {
+			compatible = "renesas,r9a09g047-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x16480000 0 0x10000>;
+			interrupts = <GIC_SPI 881 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0xdc>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		vspd1: vsp@164b0000 {
+			compatible = "renesas,r9a09g047-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x164b0000 0 0x10000>;
+			interrupts = <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0x11e>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd1>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0

