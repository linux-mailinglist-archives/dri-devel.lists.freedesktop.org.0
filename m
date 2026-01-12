Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6089BD1238B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E88B10E363;
	Mon, 12 Jan 2026 11:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JONebk67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185D710E363
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:17:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGuBv4oNhEjpYKrqlaxmnWGRBoKbY/J1u5E2QXU0q7XHhKiY9l+ceB/5xl2BPWaDdgSH53d5fbrRsmM6AQQw71Z7KmtU8uR0dZHS7cFTym5wtjsu3TthwCswpudJOD/zvlxFW8E/BYcO0ZidvSrrUFfFJOyKz5b7gAxm+Q7qWbm0LDBgH9Duq1DkIVVAdSbwgkAoaVJ9yFQQatfwyrkKYdZ2qHEfB9RMofEXQiVK2Xvjvbrp8Rce8hHK/3HI5wGuF4wvfEEk1imqcw5WGgSRLNRNmG27gD1Cghc+ZyiDJrcR//KEtl3eekjVkCNzTE0XIEXnLgSn9BuO0u115l45aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=admPmSp89x0knTfgX04X+wPOJ7UyG7CrvIHNkUCx6Fc=;
 b=U/NLoysIqLueKlgn7sH7dWxVOza27dE0cpyj0Z+1BKlv02UabrPG6ydxxc5xq1zJ1PGLyL+oBhkNwndJEQvh8aK9IvYvcFLbVtsZREVAG30BYwD3oQgzHDw4bl8MPnSlIiTVPjV034tpEcpNby4xPzQs8cGYTVF+Lqqqzb7qjGaA+auOLyQFIer6nS+nXNnUuls/mz1JGJTsBHpxGUhFsTqr8KygpohWl4tTO8MUFTZeNbTT7BGrCDxXRAOdaPa01fH2PrvNCw3rEjYObHOD5MrlZ/L5u0Ay/fIy8hNy07iGsDA5vkJdqDQlyur2o76b7gyHtL4hZyNN1MAyoODnbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=admPmSp89x0knTfgX04X+wPOJ7UyG7CrvIHNkUCx6Fc=;
 b=JONebk67j419QntHCWxo0b0LVRJs0Vys2QGHdP6lEI0Mn72q8H8Jnyf28F5maB6U9iHThTl59EIbBIBHjMZtWszfx7/5APzNrP17WygNLZr5EihuGazUSur+tQOcPuy3CKyMeI9Zx47Nkq++pB7M0tWNvqPD/0W66rSM1mbOVuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB9469.jpnprd01.prod.outlook.com (2603:1096:400:1a6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.2; Mon, 12 Jan
 2026 11:17:52 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9520.003; Mon, 12 Jan 2026
 11:17:51 +0000
Date: Mon, 12 Jan 2026 12:17:31 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 09/22] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/G3E SoC
Message-ID: <aWTYS9BjWn2bY5Lz@tom-desktop>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org>
 <aWEnfJonv4egKhXo@tom-desktop>
 <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
 <aWE8ikhsthB_0VQV@tom-desktop>
 <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: 735406ae-a56b-4442-a0f2-08de51cc397c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hyVI7eIYLpaWbO86FBG8PKmpKIOfEZYdg+FZwGciB6mMdAOdYaaw5vHQbFXO?=
 =?us-ascii?Q?Bl75UzsQSMx4hkxLJziTkjjmTuXLg1hl6JpJgPIQWi16RSb9hqo149Pr/0F4?=
 =?us-ascii?Q?sXCPo9NbxP04Cr40VDb1DIZfRp2txOx+YY5YVoedNq07M2yRb7Bq3KDuZVDK?=
 =?us-ascii?Q?LgaUIw7rLYWRVIBDBBgrT0cPYkebzSjNvMr/OENVgpVWbOThmPzYznT+cgZW?=
 =?us-ascii?Q?F4/ptbILAGKjyEd95La8t0ZaKaE6ZfFfT3PbFODWllXcYTuSAROjPbT9KA9Y?=
 =?us-ascii?Q?ViFEZIfX5ILmxqXfyulAzPueeFc2Hb4EExJHvLt5baN5uxkLdEdovyO5g61S?=
 =?us-ascii?Q?AKTlC+osqxSLVJyPGaBLW7blyKb3qDOUCu1ocUEU+QRrrMNa1B0DCzv0FAnJ?=
 =?us-ascii?Q?D74Z9XzRiqwWaydEoymJHV+Zp7a3z/XMYQWxzC4UDkHVKkqt7L+kuajrPJqN?=
 =?us-ascii?Q?EYbHKNfn4vYNN31U7qXBW5XTCZWucz4u2FpYU/YJcBmucd9d0NwokU8yh/Km?=
 =?us-ascii?Q?firzW5yBe1YbTHH2lAEuHIhOS1VoxpOZnconw8xR262Orcj+o25XAt9cAK1N?=
 =?us-ascii?Q?irF0MWJsCV5UeSJzuCqdSoX0bx6etRxHsMQYbjibT/cziZ1Rk8IUQoioB70A?=
 =?us-ascii?Q?nMV6hVdMQWDfi8sj5oA+5/2G9y9M9wLcKdJVUT4UJMaeBBQKhf4aD9pdx7Dq?=
 =?us-ascii?Q?UFsH/fDLX3hxGYscJDAIzTgwIoAF20Za7S8pMRFd+MrtNOkDKMyVcQyY7k6c?=
 =?us-ascii?Q?IU1GIhLUXD1pB29mP9RaLvZ6t6TLNKa8GIHUT+X+R1L2r6rslhulp0l7P0AA?=
 =?us-ascii?Q?BviybXtSEgIhQ3q5NMP45t9vm/NX5IcWPou7ua+PKi/OvjbhbKk3xyT8Mdsc?=
 =?us-ascii?Q?GHgbaj+DfQFe10UQJUWttb4Mo97Z+AmVPqbvEeKvcTSzZpx5bK/Z8/yDk3Ox?=
 =?us-ascii?Q?bib/P2nGKPqLchtUBCLII1+IhMzLuWIiBHvSz8xTcYs5Nt+ba1h6llTfV3ss?=
 =?us-ascii?Q?j468hXkLkXw04XncqgfGFvik9Me/WAyQyoU3iXxBWGj/+UB8lhNVDfX8jhAK?=
 =?us-ascii?Q?gwuypkN4A+rRnoUZGwZZDSdjD9q9pItT6pMJf25aiTsB5noiyyUwnh8q3SZr?=
 =?us-ascii?Q?9fVhJcJmFi/IPQk1qGKLSt26GDFWhFKURscBqTVfiCxyrzhDJOBQAeNcCmcC?=
 =?us-ascii?Q?mLA6ynKrjhqj8G6KcvK1HDsWXCsXGuMpuxRvVfiV4F4NO14DMLRq9JKFCKlC?=
 =?us-ascii?Q?r3hh7ajI44bHRG419xY/gQLqE8oA3yRHbhAfp3DEMnRuDXezZJd5aDIa/jmt?=
 =?us-ascii?Q?V/rsVZ7jNuTdzw869xQqPKQXSM1RKRbVUr56NWsdn/jCmLEjGcakOwjbqUKV?=
 =?us-ascii?Q?3ud2SPl2hG9YMFYZlgh0XL92HJOnJOdU5T/JrRtNoLVMCZZewW63IiFO/l11?=
 =?us-ascii?Q?wNm2znuMWqK+SwmxraT+67+ZRMmJuVllcAscE/YSWu5P1wqOdxFkyDin7R+8?=
 =?us-ascii?Q?AvPnYSaWOSqkGgfQO8Ba5LiH54WMDTCLd9vi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3wyTeYr5A9k8WiaW8F8iSWagS1u4+G+TVij/ffzc+3ewrJP1Q2w/vBOJs/nE?=
 =?us-ascii?Q?gcIG732W0fdnQXetCyKXTFv7pKFfCpvXKJ4N8UdZM+Z+/CsPZqbZOeXlN5Ci?=
 =?us-ascii?Q?EQnItJJB37xpfPqVSrFxlLmPDG7dooS2KL1N5YcZJY8LPSEHgvaoQYrhTGg2?=
 =?us-ascii?Q?rgaPKn1KmyetCTNKJW6k6QaNUdEibBulqltAWs1djvvuMeEiRS7aH/b8Tw9L?=
 =?us-ascii?Q?40O/b3qVjfPVGEqWRws5C9Xcoe6u32Np+EUryF+t/kWBT5KaQ4/uZuZxGqPx?=
 =?us-ascii?Q?iFVtpif7KVTCzEF6dBnkT9XUi2AdIikKSmAUHobkQZlfbatSsa/GAC/mlID4?=
 =?us-ascii?Q?h2FME2JorHGt8Y4Ylpi/Bdtj/ih7lxFDi8plG7JJQzjEPjCZa0Bzs6B9c2dI?=
 =?us-ascii?Q?WBsc44qCcehuEUx7gxmamNt2c5/BLR5eL0XuY88C01LARzBkltXa1v3SJ3d+?=
 =?us-ascii?Q?zrGq7P85vb5JT4mZCnKKwfHiUECmGXg6Vj9zg5BiDmdy2lUjEYe1opNjzHL6?=
 =?us-ascii?Q?5iv3TZF3fFr957Jzd7VlImX8U72q2mtMCQeyBQd9vNx7Dc25QdCaJ4lhtFSG?=
 =?us-ascii?Q?pEA8vJgtAEPLrJ4TfpWRqdFvP5osP84G1n8l9DwLaSqebn+ugxmwhaTn5fdR?=
 =?us-ascii?Q?b7rdynbPesUpcSTg3qryZRmb2SldkL9HnEVbdpiWu8ls/xubJUoBSABXUrZs?=
 =?us-ascii?Q?vx+zpnu9autHsBBuYE/Tr4zPXHNGlhXc0pJ2XdT4DiEOjPMKOlp0m0VJGewM?=
 =?us-ascii?Q?pvCj8ebIu32LSL4nAzCmqNLMk4UzMpiURZpzZVuLKm/LGNST8KI7D/dV9GwM?=
 =?us-ascii?Q?E1NXUSPe7XpoxbDbGj1FRuy/nYhoUQvKuSvy1cGeI7KeOObrFOxKjUdg9GRc?=
 =?us-ascii?Q?gF8TltGLmTXarUQ6iIj3jOgTRHipXOIEXGvJ/Na8eZYyJiDD4CxGcHRR15Kp?=
 =?us-ascii?Q?D2J7EReuz1/WT3acTwYX7ulFb1vvaLrVVXCB1fyxuJIzNIvs1XWT494UEO9a?=
 =?us-ascii?Q?W3HYIF51qOd30zds0+Y5fqFKSw1UJeFxTPfzPS9WSNervtPKC6AWo93RbeAe?=
 =?us-ascii?Q?mwgqywMxLUBovBKPxMx7jmXV5tJ5T6dU8dY1ZWjFM01G/uNvwU5lOU4o5X9v?=
 =?us-ascii?Q?ieOrGqI7HIObOC0OhLPUdmXTWsys4IQouL4YTxxVcb6NfTPwmF1YBn5UQdvJ?=
 =?us-ascii?Q?Y5Z0dJl5Zxif0O4cgeXtoIvb/RywHNzjbOBJQxS0OlW6feF3UpEBeKe1T8Tq?=
 =?us-ascii?Q?DXR2GhRbe5p7Twh4aIf0m1iFMu446vKowf8dZ4zzq0c89yoPXdYb8vBA7qpe?=
 =?us-ascii?Q?ssH/MkdY4DqQDmmwEakyEjifpwGeagiMsgLd8+bh8IT59g1GgeclfMXxGDQv?=
 =?us-ascii?Q?9LMg4R9HkJZ+WnlSQqMgE5sM0ZyjuNuBg5GguE77gNdD5dL9d9H3Xotf9JTl?=
 =?us-ascii?Q?OtEUXEgzIzqsavFGFvggLsU9XSKyeTHHxVdkafP7AnLjDevyMKAd+E/EY+Hw?=
 =?us-ascii?Q?hDWBx35CDCfOykSch0v6D/dEYDKocXufA2fw0fkVCFMq7Bikk6AqLDQHlWrR?=
 =?us-ascii?Q?KZbgrTiCvAchuIzGs/vz7ym7kgS1Qo/PlVH8BVW0qrMT52LmTQZLmDoPd0mG?=
 =?us-ascii?Q?0Jn9NyvZm2phs2YefFYCqbv0IXKslTyHn9+hiEIEGeBOQ9tk29DFhy3Pjd0b?=
 =?us-ascii?Q?QdFxgvrODefp0as59LJ72X6RqIYVbOGumSAEWgSSYkOmNHFdRgYxbG1LXkSM?=
 =?us-ascii?Q?0L+xiJESgpr+YlI7U75X9s8uR1b1Uqx3Gb28fEcHz/JSMrFWawx/?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 735406ae-a56b-4442-a0f2-08de51cc397c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:17:51.7735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upqG8Gw8rJ3hwi6YkDC9IRoDaaPgTfUhSOGOLn639gGYwLBUeFiTkQSX/iYGMxjQ3MFj5jrzhO11IOSenDGmEUgf3ChoLbwwEZFHfEVkKtz7KhybCIAqm0bHkNCovjEl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9469
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

Hi Geert,
Thanks for your comment.

On Fri, Jan 09, 2026 at 06:59:12PM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Fri, 9 Jan 2026 at 18:36, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > On Fri, Jan 09, 2026 at 05:22:02PM +0100, Geert Uytterhoeven wrote:
> > > On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
> > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > > > > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > > > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > > > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > > > > or vclk2 as DSI Video clock, depending on the selected port.
> > > > > >
> > > > > > To accommodate these differences, a SoC-specific
> > > > > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > > > > RZ/G3E SoC.
> > > > > >
> > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > > ---
> > > > > >  .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++++---
> > > > > >  1 file changed, 101 insertions(+), 19 deletions(-)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > index c20625b8425e..9917b494a9c9 100644
> > > > > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > @@ -28,6 +28,7 @@ properties:
> > > > > >            - const: renesas,r9a09g057-mipi-dsi
> > > > > >
> > > > > >        - enum:
> > > > > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > > > > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > > > > >
> > > > > >    reg:
> > > > > > @@ -84,6 +85,13 @@ properties:
> > > > > >            - const: pclk
> > > > > >            - const: vclk
> > > > > >            - const: lpclk
> > > > > > +      - items:
> > > > > > +          - const: pllrefclk
> > > > > > +          - const: aclk
> > > > > > +          - const: pclk
> > > > > > +          - const: vclk1
> > > > > > +          - const: vclk2
> > > > > > +          - const: lpclk
> > > > >
> > > > > Why are you creating completely new lists every time?
> > > > >
> > > > > No, come with unified approach.
> > > >
> > > > The intent is not to create a completely new clock list per IP, but to keep a
> > > > unified clock definition that can scale with feature differences.
> > > >
> > > > The previous IP supports a single DSI input port, whereas this IP supports two
> > > > DSI input ports.
> > > >
> > > > Because of this added capability, the hardware naturally introduced an
> > > > additional clock.
> > > >
> > > > Can you please suggest how to handle it?
> > >
> > > Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
> > > Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.
> >
> > Testing a bit your suggestion
> > we can do:
> >
> >   clock-names:
> >     oneOf:
> >       - items:
> >           - const: pllclk
> >           - const: sysclk
> >           - const: aclk
> >           - const: pclk
> >           - const: vclk
> >           - const: lpclk
> >       - minItems: 5
> >         items:
> >           - const: pllrefclk
> >           - const: aclk
> >           - const: pclk
> >           - const: vclk
> >           - const: lpclk
> >           - const: vclk2
> >
> > Then later into the compatible if switch we can do:
> >
> >
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             const: renesas,r9a09g047-mipi-dsi
> >     then:
> >       properties:
> >         clocks:
> >           items:
> >             - description: DSI PLL reference input clock
> >             - description: DSI AXI bus clock
> >             - description: DSI Register access clock
> >             - description: DSI Video clock
> >             - description: DSI D-PHY Escape mode transmit clock
> >             - description: DSI Video clock (2nd input clock)
> 
> All descriptions belong at the top level. Just add the 6th one.

Please correct me if I'm wrong but if we move up:

	- description: DSI Video clock (2nd input clock)

To the top level description we will have 6 clocks for G3E and 6 for
RZ/G2L. With that I think dt_binding_check will fail ("is valid under
each of") because of the oneOf.

Kind Regards,
Tommaso

> 
> >         clock-names:
> >           minItems: 6
> 
> Exactly.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
