Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B1D111E0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 09:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4282C10E04C;
	Mon, 12 Jan 2026 08:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RwwQMivS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05EF10E04C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 08:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAHSW57tTxq8gzWrvM67JA0IEbkHjBmWBB6s6OX3X1WeMB3SxPBSYT5rs0q6zbrWwNIBhb/47kuTcpQLdNkSgGnyz/r/v4CgsX0qfQoPVnQJiycdnEmwPtbDi4GHH5wUw9NDyM2xTp1m8RDy9F3sKHQZGzAY0inrZ4F97rC5eJIIolGk/N2oP1aUEvj2IYLxT1y7+KUGbrMgnZ1/iQPoPropA01WekYOJbVlV55uUaQAwThwzJ2wGwkX06teIWuTIcSaSf84J44eY2YRHJggT8lwvcAb7WI+LKX4OKxopJEDlIplzLzRUD96xdyNejNxYxtJwo/0wP/9s1Dz/b3icw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RESy8DknXISghLMq23HvKtBrZBl5v8Btc+fQFWGeOok=;
 b=zPQqEypUbGLPXhCmBHtdx6KCPBCFxS5yyG5aa76fAtfroWdFhsaBW+PAXidALj75ksAK6+KOTVKP3gu8lKucBwEuUYMIWJMVr6MX6d3v5d/bZaQlQW0AU92uHjuaT0XAawxeU9VCwbeeQ/fZTev1RFsXqNx30Rsp/hvJztd1FKgbnAZXCjZwT2BpfdsCwShXRx1Mkqt+nlIiirZ/NI18D8himaD715r+TFBJkglKokds0vcYhs2Ydb+OEiRH+YMmBCeblUG7dYz54FYclswLJ6VFJkH1CciXh+8rbBvz3XTWQdLsImTx8+xPRhXUqTc7xdMQrNqhd4/EkAgi4I3hxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RESy8DknXISghLMq23HvKtBrZBl5v8Btc+fQFWGeOok=;
 b=RwwQMivSz0xMpNc2ZJgrCzhjUutVIABz849hXCRWiOUYl/PfrsBa/p++sxRPNn4IHvcrnJoGGazlF3e2134RpwsOtDJRUhfWkTPkU8ohmzgrA0lt4Lnc60q+0rFNVuA5pu8FhxypB8XM3nMACtWsRIiNmGyrtvAahT1YUpaZ7vY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB12796.jpnprd01.prod.outlook.com (2603:1096:405:1e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Mon, 12 Jan
 2026 08:13:00 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9520.003; Mon, 12 Jan 2026
 08:12:54 +0000
Date: Mon, 12 Jan 2026 09:12:31 +0100
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
Subject: Re: [PATCH 01/22] clk: renesas: rzv2h: Add PLLDSI clk mux support
Message-ID: <aWSs75UPtTezytxQ@tom-desktop>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdXU6traB73KaFj0kRtdo4NDT4ynUyfd-4L36=D6cUUd6A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXU6traB73KaFj0kRtdo4NDT4ynUyfd-4L36=D6cUUd6A@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB12796:EE_
X-MS-Office365-Filtering-Correlation-Id: d6832f8e-a87c-4d78-9375-08de51b26305
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1m3shsizdV9QKIpE07YZP2h8WCZ/a0vUkthnFO5Zd6dIkRIRVPRPIH9FRb7e?=
 =?us-ascii?Q?KEFHleRVNcyMYyx/dhYss1+/UVy7+FYop26gnA7NgbnTi1OZVwQ/dCXMxpWs?=
 =?us-ascii?Q?bcVe2gjgUYJ9vebFdrmIbjlD4AW8OgcsXt6fqkrDFCRMICaOvl4Hi38RgaA9?=
 =?us-ascii?Q?ODfgIQOSdOk0ucXLrRoC6ttkEMmcU9uq5LZ5iJF77Tg44OgKOF1K/QsWzqgX?=
 =?us-ascii?Q?J6WIKxhtP+jfrjxAKZ+0g+FxPKrAZUq96BOi93t/myE5Qi0ZF+5yosuZnCxl?=
 =?us-ascii?Q?pLhIRhqNiiHor4GG1T63HXRwE67BezbLUKbV0CTNdsolIdA39pb6ObYqx5Yo?=
 =?us-ascii?Q?hs9xLjplWlY7eBBh723fz47CXC/KPP3EymjRLyAAhKMwuv+rTigzldNeZc43?=
 =?us-ascii?Q?QJAwKalT0JX5Hr5hxcdb9x/7IQhtEqVPT43t3P3jNRiUJfu1wQwfSdOB5jrB?=
 =?us-ascii?Q?otG289T61JeDRiR5fQ79uyfdFPAn+pQ74rv9nZPvLzAtozPEOeeYTE2NTYFl?=
 =?us-ascii?Q?z6t8q6zgrlUuqGdFlsvEJtP51dIeqJ8joZXeQTFvqOsQ/aWxHrwsPARK962z?=
 =?us-ascii?Q?2NfTX5Vn6b8UG+Q89ll8o4fyXzRzcQVyJZi4xqmAR7OkZRxmWazW9cSbI/CV?=
 =?us-ascii?Q?nTUSZ8RYcjrKH2Kbm1nhfqMERqNAUrFsrk664ZW0558cAYP0QLxC/eaisiYB?=
 =?us-ascii?Q?VOqTJzzDViHaDeu6R5zvxxupS7oEa/ktxx0sxEuVw/L5OREkBcGzIZVwAM+c?=
 =?us-ascii?Q?ImR5yH+2CNLgZXSK8z4OY4Ev+pEqkuEF571244jrPy7s40Lsokz04FzzDqp0?=
 =?us-ascii?Q?M9GtCE+TcPEJBcnknEJV02nFaXC1jCbP/f1lxgfd/l75SZnBvhxto5symons?=
 =?us-ascii?Q?8tI5kdX3IzZnuI/UR9cO36R5rBzJlS38fVwgLs0PojEUQBHHJGuFxxIWCtFT?=
 =?us-ascii?Q?vZxGP4nB3Y3pLYnvsjlMR8xdq4ln4PYItHvgON39rugM5/litv6uBylXwdR2?=
 =?us-ascii?Q?sivN3FOQXPVU+uhU8vHiE+8kkGXkqM1zhNzIoPjYtzSkrYa5jbwVlZXgevDM?=
 =?us-ascii?Q?Nmb00S1XIMuARqnt5xDFXe0dK7otcjRBm2mHtWTjMRtqfG97yrOO14ht+Yaq?=
 =?us-ascii?Q?BLcM5zu23xYT+uNm4doW8R3LjYBhgLnMPtRKYU+4/+joexVGBGmjQRLYjmR+?=
 =?us-ascii?Q?7aIK1ysuyDtNyVmAqkQSdOAwjTGfzT1L1s1Y6Gq+5BO+fdoMnueMDWqBgEo2?=
 =?us-ascii?Q?ZgVhArKjK6VF2iDpQFnwMTa0rVQKO0R14HoTfghu2okp6a567L0j3rWQ2LSN?=
 =?us-ascii?Q?/hwEd450dVS/N3b49W2Egeu9SOklmyyNzFLl3TGz/n06ueTYGmd1cdBSE4ew?=
 =?us-ascii?Q?ZytAM18q2nmVzsWRt6ddr1kyDaMyuVx2pEl0Wf8tiuyeiYUM9/YjritR0Dwx?=
 =?us-ascii?Q?1OestHSye06YrMhev8gVaMSla3J/y9WwdzBTTt+VvwQieF6h5nrcgX1dTeBx?=
 =?us-ascii?Q?Lh8YHwvYemK6Fuv3L+x8U4f1DwfFbjl5PtPa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q5qeu7OVgfLnkLM6zSyC5bsKjTRdTJDPmQy1oTZ/gCpUu7RXUxp97FWHfE+B?=
 =?us-ascii?Q?M/gC4BnTOb8Zh9Cn4lmjtLVECjzrDtU9GVbUWpuknDDkCP8vqAku+5Losg9M?=
 =?us-ascii?Q?AqZ+sLDqdPuwUUe8VrPTxFapGBNjSHd6kl1b00AO+M+j7/Zgscl2D82pvdYC?=
 =?us-ascii?Q?MT3yhxbWLDXtogbi0d7WyNlS6REjmttCvnXq33yiAkV/YYYwKp/ECD3V+ba3?=
 =?us-ascii?Q?XPHUXMpzfe6Xu7RL9rERZZmDL1nrBHQq5YZ/1mH/oF2OSgCk5h9TgaP+B1Lw?=
 =?us-ascii?Q?EXvLWPJycHfjdATzMCR8672dV1m573BJaWNtFtLdiVo2Brs986MHBYr2omo7?=
 =?us-ascii?Q?cH01UJUUe9bFIZBtEpuqesJgV/vqnFPgskRWLyzv7/n5Vn/nEWUB96FM//ee?=
 =?us-ascii?Q?QYhjjOmqt4nQBQyV+qLuHTOmggcEAiPmawWxO4P6Rt52cvTLvE5nKVpV7Yrj?=
 =?us-ascii?Q?qqz2KhlomSRUmltLLWmoDsfLQDoJgWrgcv7Cj4kqzhDXO43zoezti2erdwlE?=
 =?us-ascii?Q?UaixEYMwNZx0H9Cuw1vvVV/29q8qGqxAWRwzRiMg5fF2wwLO+qKhlbe1kQer?=
 =?us-ascii?Q?dztNwGQANKEI3RSGQpPXO2hnBU3YV53+COaecrGTdhPi/kj9JADOpRE+fOpE?=
 =?us-ascii?Q?udbqoBJZwY75FOD7yCwyAEJjuMp2Ei3VvuYCqXAkMdJZIX2N0j6SAsCDEqbz?=
 =?us-ascii?Q?6c+yC15NVQH8RgJJJ5WyHcumMC3E5OwOj8kxH6mHwQpAywHq3kVdTsy+3XSw?=
 =?us-ascii?Q?giKLhwe41C1iKyPNJ25VnoUPd8RxfBWFZnPhdbF83GkCViqywWj3OGUyNKCj?=
 =?us-ascii?Q?ioctNYOf/GXMzrIVJcaFA4Ec3lYuHzZKG0T0ok04Q5hBXE0wyqFbFiJ7YOcY?=
 =?us-ascii?Q?imB5xOf1QboiWr+e/0wkfAHLvPq6ctoGChK1/zSv9d0SrRdQPe0tfa8jB5/G?=
 =?us-ascii?Q?FEMPeGQGFjke9XHE0Ur1juSTacsRF3mj3HNPu/xnD5aOgfGX4cFRLUiA1Ddn?=
 =?us-ascii?Q?UNL8eOXjyxPjL/mcsq0W0z+N/JG96OZHowv2WiFLleJwYl+gHP0EU568CTqt?=
 =?us-ascii?Q?W2j83T5eH1Lya1N9Tth8fQJ3rfmUqyjORFCD+I+kxdCyIsxMFeXc+sDAAiKN?=
 =?us-ascii?Q?yf830ePg5F1UeXh5hzFa9zXCFt5rKkUGDGh9V7vQBmV9jhweu/tchJvd24o/?=
 =?us-ascii?Q?FzZGVYHaJ7+KWgDION4X6J1Gh+ANRrsOxQZTjQPsHCiJMC4xXWEVucIHC4ES?=
 =?us-ascii?Q?9ecrVU9QG3vHg4SznOpEfIQf+f9+LVr/YKjKEdfgnxom15/F2fZDlBRLVMqb?=
 =?us-ascii?Q?uS9dAdNFvP41/fP9pMMvegpL+rmq+6rTFmTDoVdxyg2Y5m8mQ3KC87x8Z76P?=
 =?us-ascii?Q?j2g4kJ78SBb/KGRUijJraoUhzpjQOxEumQ5WvWlV7r70Ff06JbJnhKQy6sJh?=
 =?us-ascii?Q?jv7mZS0DIcdJr9ZVBXA0On01rmsR9g4AKxaoyW+Nr9AC9JgM/1QzZp+7cdso?=
 =?us-ascii?Q?FPswnR7zN7aRLqf3+9VHpUllC2ig5EymJFt7Kyv/H0VmWf3GoJOaDc8OdPaY?=
 =?us-ascii?Q?5aKjlGQC1gQSn+IFjnC5GWHjSUsNju7WNhGZLEx1eXlQmKaSE6mVA8rVIMxr?=
 =?us-ascii?Q?GP45NQEpR57GauvYj7XkTgU5ZhWNFXeQ78pVB89zhI/Yl3TxiYmiJCFexB8V?=
 =?us-ascii?Q?ezaWLunR2Yf9S5KoONiPh5M0WMVvcmkhDUuOOTEfVDyOiQPXesWELHmLSmxq?=
 =?us-ascii?Q?Jhwi9VTvrd6Jfe6jUsoI9I3T40fEuFnJ5jvWz4qRIRXTbn8yNeXE?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6832f8e-a87c-4d78-9375-08de51b26305
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:12:54.3404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijY/bJ0rjMU9Ut1ENsRMx8MLvWWt2Q4yDOMv2zHCozjVNpv8e2WknmdFMLm79bpTaCFoDPgzAWV7z2+71wpMwO8O5CXl91eNnEp0vnSwJIC35YFNfoqo/20iq7mZQNxP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12796
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
Thanks for your review!

On Fri, Jan 09, 2026 at 07:27:04PM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > Add PLLDSI clk mux support to select PLLDSI clock from different clock
> > sources.
> >
> > Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> > them in the clock driver.
> >
> > Extend the determine_rate callback to calculate and propagate PLL
> > parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> > using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> 
> [...]
> 
> >  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
> >  {
> >         struct pll_clk *pll_clk = to_pll(hw);
> > @@ -1085,6 +1213,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
> >         case CLK_TYPE_PLLDSI_DIV:
> >                 clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
> >                 break;
> > +       case CLK_TYPE_PLLDSI_SMUX:
> > +               clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
> > +               break;
> >         default:
> >                 goto fail;
> >         }
> > diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
> > index dc957bdaf5e9..5f6e775612e7 100644
> > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > @@ -203,6 +203,7 @@ enum clk_types {
> >         CLK_TYPE_SMUX,          /* Static Mux */
> >         CLK_TYPE_PLLDSI,        /* PLLDSI */
> >         CLK_TYPE_PLLDSI_DIV,    /* PLLDSI divider */
> > +       CLK_TYPE_PLLDSI_SMUX,   /* PLLDSI Static Mux */
> >  };
> >
> >  #define DEF_TYPE(_name, _id, _type...) \
> > @@ -241,6 +242,13 @@ enum clk_types {
> >                  .dtable = _dtable, \
> >                  .parent = _parent, \
> >                  .flag = CLK_SET_RATE_PARENT)
> > +#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
> > +       DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
> > +                .cfg.smux = _smux_packed, \
> > +                .parent_names = _parent_names, \
> > +                .num_parents = ARRAY_SIZE(_parent_names), \
> > +                .flag = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, \
> > +                .mux_flags = CLK_MUX_HIWORD_MASK)
> >
> >  /**
> >   * struct rzv2h_mod_clk - Module Clocks definitions
> 
> Why do you need a completely new clock type, and can't you just use
> the existing CLK_TYPE_SMUX?

From reference manual (Table 4.4-10 Specifications of the CPG_SSELm
Registers)

We have the following:

 - SMUX2_DSI0_CLK*2
	0b: CDIV7_DSI0_CLK (default)
	1b: CSDIV_2to16_PLLDSI0

 - SMUX2_DSI1_CLK*2
	0b: CDIV7_DSI1_CLK (default)
	1b: CSDIV_2to16_PLLDSI1

Note 2.If LVDS0 / LVDS1 is used, be sure to set 0b.

For this reason these clocks needs an ad hoc determine_rate function:
	- rzv2h_cpg_plldsi_smux_determine_rate()

For that CLK_TYPE_PLLDSI_SMUX has been introduced.
What do you think?

Thanks & Regards,
Tommaso


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
