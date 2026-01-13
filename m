Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B2D192B7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 14:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E3610E4DE;
	Tue, 13 Jan 2026 13:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lJMfbuUQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477AE10E4DE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:51:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L25sGqxOovuVZl8gshgNFzNNKF1C6Gwq9nLt/nJRy+FY9zZ+XS29QHyz4AxQi4W7Bdrl/mxFQO3ABk350T+oBlECf1hMw54eMUVMS2kAiQzRTPU6XTPVkny3iKvlt/gjlJP+xXQ19k5pzwys54TMeK/aw6aItuuGt7b+7V0/2zzOeT/t6ano0JrTY7KmgXIfjtgt2dpMzLV8kDnY4vf2tTi71dMlDLbju19p5aeHZ/wEbzAJDaDX3G8LCTEZjmEHgMiEEyUe4NKNP9CgP3SllEYGnQlF69g/11Dbs3zfVb+MjcJyttFqSNK2m4DCJ+2a1hMlu6FBtc+1RciROqIPeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EYLEnLRsFZQmKVJmX8nRcNORWcYXUPpSopXH8NFJpw=;
 b=Yf2up2aL6h51VnrSeJAwJUi+De1Rizvx4QIMZm6tx4WoYvzvPkUnSAA35rptZhbgDRI3DZgj7C1/lIw2AOUX78tNZoH0uiAjA6PTp4r+XcXon2klsZHgZDLpW5vrhWbRAQoYyqtogrNa/T8JHrrvYFG7jPS7eudIm93AKJ4jykMGaMviz3RfxeomySDEpdMCYpLKyQ4Gu+a+t76LUk73pCP+hwnGMFc/y18AoVkQFFKzeVq0PMr6Q1rJVFT7XTiV4BnQAkCZpufzk1CdKTVUMY1Ns6qwubLN04AA+FTrMu5mh6VCSZSbqYZ6cwwO1XTcKF1fLWxEaTr0txD4maRb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EYLEnLRsFZQmKVJmX8nRcNORWcYXUPpSopXH8NFJpw=;
 b=lJMfbuUQzkpBdVVHSVowJMKyOgS5vXTrFtTdx2SYf2tWwHEcCQmZxtEa8OMnWXAeFwH6TsvKaSB/DCj5greBroEAgjPShny0irbDdDRQjzNjhc7LdrPIr1ag9gA4GzHrvt148lzBo4qOZFK6TTFRMU0+RPKa1J1//2By+2ecPOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB16974.jpnprd01.prod.outlook.com (2603:1096:405:335::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 13:51:27 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 13:51:27 +0000
Date: Tue, 13 Jan 2026 14:51:07 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 06/22] clk: renesas: r9a09g047: Add support for
 SMUX2_DSI{0,1}_CLK
Message-ID: <aWZNy7MmeO-obgYr@tom-desktop>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <cdd044968c1d199ad41ec84ed71162725cb2ec66.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdVpgnCXVzuZ7ZJQ8dy4Yae=zse3pq=r-g3frymbSVRpVg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVpgnCXVzuZ7ZJQ8dy4Yae=zse3pq=r-g3frymbSVRpVg@mail.gmail.com>
X-ClientProxiedBy: MR1P264CA0069.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB16974:EE_
X-MS-Office365-Filtering-Correlation-Id: 52586136-cf7f-4349-0258-08de52aad8f0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xAqoZNfCx5nTc2bW5PluqWsOUcQgFZh537MMkDGJOo2vWkJgZr73iMphFw2N?=
 =?us-ascii?Q?jUyTDDcvuWqLZxng0kuK9Acaqje6pKjDDNVBNJb46cVP7DXru2V+ylHfFW0P?=
 =?us-ascii?Q?4eaunW1/9WNoJqJg5jBbFW0fXHIFNPN5qU+p7GybEMjT+PeNa+Yf8OkSBQES?=
 =?us-ascii?Q?vxCDT2Mt+nPHd+Onv0KS7iY32IzpLxiNQurTvobBBNhdLI/bwxNW1W2475xM?=
 =?us-ascii?Q?PWpmlgwfjp7iy5nYMJucf0oqKCwwZOICmDaTgSAMYyG/6QSNPmxYXGo3XSKH?=
 =?us-ascii?Q?CZA4D3dwvmqcXy/xwn7ngtf5qnzPqiSx0lmcntyAbGUyYJIV0qIFNhGTcH9k?=
 =?us-ascii?Q?m9Rb72DnLB/kqD3ZPYDd/yemU0vGYIfHibkiz0CVS8lo3pIwsTIvBYHaAnQE?=
 =?us-ascii?Q?R0SHZzWhNRJFge6VfJg4+wVQaJZAOwKdEnzSqxRLIq9IwT6akJuKAZMqsg11?=
 =?us-ascii?Q?cU5jRlwEFhz2dTr0+LV5jTtLd7vdAlKzOV0I7rwHgIp/S2FqQ6h8gHdOG9Wu?=
 =?us-ascii?Q?vQUzi9qFv1pLCpoyW3Zq6iuKQ/CPf3KHpaDI8QklE+Ei8MuPWI5nHbRD/glI?=
 =?us-ascii?Q?oxr4GRHhjN5dJGv3Y6ydEi3CczV9LF7W3b7WgbjMAl2e31axJKJvM/p1LqvW?=
 =?us-ascii?Q?Yo6eGE07Yje/hVI1Rgu84oQt8tNbRFM/jw5bIYlgyJOhu2uKv50l/MYAHW3T?=
 =?us-ascii?Q?kdtEKcJKa62TpJMFUCpnHv+xZqKvm9Bt0b62HIg0XNMWfsxpVn8ZK4eEckGP?=
 =?us-ascii?Q?dA+k58LuI99kaqRFJ7uK+GhQj4fgtTrXqQZFkwze0X0d3hl1cV8ZA8DZV7fH?=
 =?us-ascii?Q?U4ku8rnDBdSk02PJ7R8Om3AiJ3wn1jKpV2ioq/pEyjC1YX9dbkZ8lUEzhmwK?=
 =?us-ascii?Q?o74tblhXnv2vzfg2nqq4I/KuZoh0u6vEs9rCYc9wFcmyacVLo7zV9OHJJgeL?=
 =?us-ascii?Q?INHHgKnWxMLsfA++BePbLUDS2Hu7ShjXNOexS3Me4BDHFQJkcnNh0L7m9u05?=
 =?us-ascii?Q?4Fl67l39BSLnXn0swDfbBk+MTbMhdBXf3K98gqNjBy7V3Mrs8ryMwmKEB4q6?=
 =?us-ascii?Q?YRPs8D+0tfAb4+GxbM2prZ6mtYePhWDAbFDz0W4bKZChFSdoU9Frrdr1Xeau?=
 =?us-ascii?Q?bFcZLbepyPl4K0s4DbjngNIX3xAKOSX+3QpS4uN8EUUN1AogmK4iRse2fZ/V?=
 =?us-ascii?Q?gvmhPiy7nnoCvZ7I6LwVAGxaKbEBBoSIIN9x+c5w7V2gnlgNV4h7yi8a2/N1?=
 =?us-ascii?Q?CJx3nK4tNc/La6jIJ+kqsH1KcDaYzuW5Y1HmRQbIfomAijT+hg/JJ4t6/HBG?=
 =?us-ascii?Q?V4Q81fBRSBUjRZdxzak+wljghi2wvCQMj7qOf2q8Zc78rTMGRbHinpucsqR8?=
 =?us-ascii?Q?Rc/aGmCqTdG057h+g9rMuYif2PTWcY5uZ+Erw2ASFEt6/7tHJxdbEY32s5J8?=
 =?us-ascii?Q?EFYo+1io/4BspP5fIOBoU53lw81EUov50ONCbC4ywYxafXnE+B/mrYV0M/qs?=
 =?us-ascii?Q?d+gZWGr2bRE+7Rwl2rH2lvu2pX66RMbAVctR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6hw0kuP+Rf6aNxQimBedguPNr0wRkTIaoaIyOdScPP7dEyH7LBXXjs3sdlRk?=
 =?us-ascii?Q?a3vqdt2RqVMk2qEN0LnNmgd5rp32NWRCAUWc+OC2kLARHtF5NuuIZLzoLOM5?=
 =?us-ascii?Q?6co1xKB5JbozRsEgt0v1zAShKYwozKpBBQZA/YtoIgO603fyoXhNY/us8Lya?=
 =?us-ascii?Q?gLSi4uV85Kkzy9bxs/SEOhTbr2Xpr4+YntgSDT7V8xvyFjwqRumi3pQsQvlb?=
 =?us-ascii?Q?J2Rbm7gKrbDpDv8CTMCjefj955CkiTvk7zh3qktf5vvXyzu7wPtM8vnM8Utz?=
 =?us-ascii?Q?tbDoUwmSSOCg01ByBbBvBUlASV1+IWKzx+Kgdr164UuiK3LjfRrHzlARcn/z?=
 =?us-ascii?Q?MEEIXCdb8SqA36VZfL0qTBqz+qNC8a8EDZvunQniakU6GFL9I7qf4tkaiuVh?=
 =?us-ascii?Q?drPCNasyYCgPRNf6w35j2AS923xJJHthhEcIVaxhIiwLrZwD6diJ62H1FS0Z?=
 =?us-ascii?Q?evn/c/GiEtmROnbYQMvw3CPDSPXr6Pucl0T4lGnSevOmesXIkRJLuOSsfaSG?=
 =?us-ascii?Q?ohzsM/X+L4E9DSs7V4dd3OPd3+55bjOiDBMudkZYxsfumN2ALV7tL0OSpbuk?=
 =?us-ascii?Q?YduE4cIoJbtPx7m/JGOd7+kdqbD1+RNlw6OdRb8PH5CjdvSY3UDbwiUb6MtQ?=
 =?us-ascii?Q?anuecizsNfWHYTpGHxR355dpd1qb6HRXUKM2uSspo2ROa3AWwmuMx8yd4L7a?=
 =?us-ascii?Q?5olC93rLuGfftvt0A4/y9mmxZsZjzSClDq8eBrc0I1xJd8Mfci7TeIQtM3O7?=
 =?us-ascii?Q?pr0Lubmon5O8DfSxEm5bCjLLU88vK5xivQwbcl71ntV56ZxQkCIef6RmtFq1?=
 =?us-ascii?Q?n1HXC/rHyx6fBXasLhDVhQ/1fth6cYPQWwHxBWsYVQ0OqE4EIy1LPJSoO2Qb?=
 =?us-ascii?Q?ZOMA0YphVqYIjU7/vCzc9KGvtkelJP2w9bVLt3glzbvYuTN2SVEwJraKqvuF?=
 =?us-ascii?Q?ltYtn7UrjLD8XK+0vNwFW778dvhf2rLKAVRwOAeY+5iedgS5yKpv5cAaZ76P?=
 =?us-ascii?Q?lmDS3f+UHh7V8eiuEEeiJUSlUPaFd325FRb1Gmj4jpZ8omlM0cWyvfkxPgot?=
 =?us-ascii?Q?xXxg9o59KTPsNLPI96B89jke/VS6lWFOPpJSJoKy7Dt3kijbsJjkWQZIzSKm?=
 =?us-ascii?Q?64MF4+uagqADQZkEWkSnfhshKkiWv1HWiI6V9qi5JfqvSJJFhWqlGByHlQ0T?=
 =?us-ascii?Q?Q0iVHgLr13n2ApVvsy7Wpx2kSaT9WIkTpDh/KvWoDhET/m7jcVnUhbTJ1g0n?=
 =?us-ascii?Q?SiKORu1QvHSs8uHRX1+6chtUIvZkhRQTs9HxxbIb1iFBa7Gb6ebF3HFvjtNZ?=
 =?us-ascii?Q?aFsX+4BE0U8uejn3C70/xhuBIF6I9VMKxPuIlFlPNnomgXRRk4ol7OJUgXvV?=
 =?us-ascii?Q?R/PNslYkP50EtIdTGcp40QKSuWe7nIVa1KSY+mzbwvZE0ZlLDsa+j00sPshH?=
 =?us-ascii?Q?Rwdn77L0OxWMnMi6XWHHpXYWmybpsoLuRLa4NL3j8lw6EBMIRca0T55PWQuQ?=
 =?us-ascii?Q?wH62j4F/o0TcBDt9Mmjbp/Fll7VQtU5irxG03e9thDaKKnZgNIclydrKK4cR?=
 =?us-ascii?Q?1fTk05L+5V/HBi0IK0pPDA6TQ8qwOWHAzZTa8chtf2u4WMi1iy3xD9sZFcG8?=
 =?us-ascii?Q?4PhMaUYLeRUS8hQ1p8NB3KqL93XvdCFbvvUziaHpajipD1MPSqtDnwOrkUvJ?=
 =?us-ascii?Q?VJMfpJ+clH7SyHNmiPGSJ4dIm0IUWXeSItYOyZVIn9feK7k+80sAfT61+IrP?=
 =?us-ascii?Q?PjKDBb8+xL+AfthWNHBneh4ENPBLg38oT/4vxxEGE2U4bQKRjyJ4?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52586136-cf7f-4349-0258-08de52aad8f0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:51:27.3742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRw2GfLorgGKCiPDgiCfnj0YmXgAbweaE/NRokDXQeY3nLLTL/Dv/MdCqKGSS3Zm9y56V6B7teR7RfsHjDyYElPSikQ6AQFn5tjlPHolNhf/j8WrivgjE6JKnaadLehD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB16974
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
Thanks for your review.

On Fri, Jan 09, 2026 at 07:38:40PM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Wed, 26 Nov 2025 at 15:10, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > Add support for the SMUX2_DSI0_CLK and SMUX2_DSI1_CLK clock muxes
> > present on the r9a09g047 SoC.
> >
> > These muxes select between CDIV7_DSI{0,1}_CLK and CSDIV_2to16_PLLDSI{0,1}
> > using the CPG_SSEL3 register (SELCTL0 and SELCTL1 bits).
> >
> > According to the hardware manual, when LVDS0 or LVDS1 outputs are used,
> > SELCTL0 or SELCTL1 must be set accordingly.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/r9a09g047-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> > @@ -64,6 +64,8 @@ enum clk_ids {
> >         CLK_SMUX2_GBE0_RXCLK,
> >         CLK_SMUX2_GBE1_TXCLK,
> >         CLK_SMUX2_GBE1_RXCLK,
> > +       CLK_SMUX2_DSI0_CLK,
> > +       CLK_SMUX2_DSI1_CLK,
> 
> Please move these up, before CLK_SMUX2_GBE0_TXCLK.

Ack.

> 
> >         CLK_PLLDTY_DIV16,
> >         CLK_PLLVDO_CRU0,
> >         CLK_PLLVDO_GPU,
> > @@ -143,6 +145,8 @@ RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
> >  #define PLLDSI1                PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
> >
> >  /* Mux clock tables */
> > +static const char * const smux2_dsi0_clk[] = { ".plldsi0_div7", ".plldsi0_csdiv" };
> > +static const char * const smux2_dsi1_clk[] = { ".plldsi1_div7", ".plldsi1_csdiv" };
> >  static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
> >  static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
> >  static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
> > @@ -218,6 +222,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
> >                        CSDIV1_DIVCTL3, dtable_2_16_plldsi),
> >         DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
> >         DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
> > +       DEF_PLLDSI_SMUX(".smux2_dsi0_clk", CLK_SMUX2_DSI0_CLK,
> > +                       SSEL3_SELCTL0, smux2_dsi0_clk),
> > +       DEF_PLLDSI_SMUX(".smux2_dsi1_clk", CLK_SMUX2_DSI1_CLK,
> > +                       SSEL3_SELCTL1, smux2_dsi1_clk),
> 
> Why can't these use the existing DEF_SMUX()?

Same comment of [0].

Kind Regards,
Tommaso

[0] https://patchwork.kernel.org/comment/26730109/

> >
> >         /* Core Clocks */
> >         DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
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
